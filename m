Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00EB4A35;
	Tue, 28 Apr 2026 20:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409234; cv=none; b=aV+CRdkIL5FHkLUNMER6neHeX/29ksKsBwN6826es5IYXnDZF90ysP1AB9otL+hW4R9LvfmuFTscsCxZAu2RybIRUePkZi+mUrr5EK+3GyzQ6YVSIGWLzU5BOYHHWv5Di7h/VHb5Sk0wuoJsdGISgGisUVyxdyQP0d3C6QOJlwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409234; c=relaxed/simple;
	bh=53qqY7PQB/uAj+zPP1JxuvnMAG3AtCcj7DDDSb0K5uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tW9+myoHuzBk+GlND71FraUERVwyYuIXclQnSU6aBDSJu2gp7hpFuwBXhbBXtMrBkVh9yyM0/lawSn+SFPBfgDHp/dxCDvFSbgXCB6w/g4f7j7ArD+SskNOwN4TAQbw7FAp+rEV6LmIishoukNOiDog4tqZf4X6Wt1oQ1UkwxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5frIw2F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5frIw2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B72C2BCB7;
	Tue, 28 Apr 2026 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409234;
	bh=53qqY7PQB/uAj+zPP1JxuvnMAG3AtCcj7DDDSb0K5uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q5frIw2F9h3j3tr/ZuaBgEJumVaCnozxARfMNxbPw4TvdEq+hTbY/Bbhgpvs69+l/
	 yTKrQL1Les69eP+oLRVWYDb3RjY52lt0DqJZx2UHfnvMKIcQN4Bop+LlvMhhKWNQwQ
	 k8i4Iqa74XD1lFdCzKO0KQIlI4njUh2zZ3e8GpFdECDU2W37DghWfakwPnjxAvhRNE
	 wILGlLj/dKqeZZ3Mg+6D5o+EpegtLBtGvQcj21Ti8/XhRYwtj9zdpii8jojEERa7OR
	 IeDg6HWxg3oprDwDV22pRZn6uxfTqGWyxEAge41rkAddkkqo2K77p+dq5iRFd1wVwh
	 pBfLayLsjYHFw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 40/54] selftests/mm: hugetlb-mremap: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:26 +0300
Message-ID: <20260428204240.1924129-41-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

hugetlb-mremap test fails if there are no free huge pages prepared by a
wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-mremap.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hugetlb-mremap.c b/tools/testing/selftests/mm/hugetlb-mremap.c
index 1c87c39780c5..09241a279ec2 100644
--- a/tools/testing/selftests/mm/hugetlb-mremap.c
+++ b/tools/testing/selftests/mm/hugetlb-mremap.c
@@ -26,6 +26,7 @@
 #include <stdbool.h>
 #include "kselftest.h"
 #include "vm_util.h"
+#include "hugepage_settings.h"
 
 #define DEFAULT_LENGTH_MB 10UL
 #define MB_TO_BYTES(x) (x * 1024 * 1024)
@@ -108,8 +109,9 @@ static void register_region_with_uffd(char *addr, size_t len)
 
 int main(int argc, char *argv[])
 {
+	unsigned long hugepage_size;
+	int ret = 0, fd, nr;
 	size_t length = 0;
-	int ret = 0, fd;
 
 	ksft_print_header();
 	ksft_set_plan(1);
@@ -125,7 +127,14 @@ int main(int argc, char *argv[])
 	else
 		length = DEFAULT_LENGTH_MB;
 
+	hugepage_size = default_huge_page_size();
 	length = MB_TO_BYTES(length);
+	length = (length + hugepage_size) & ~(hugepage_size - 1);
+	nr = length / hugepage_size;
+
+	if (!hugetlb_setup_default(nr))
+		ksft_exit_skip("Not enough huge pages\n");
+
 	fd = memfd_create(argv[0], MFD_HUGETLB);
 	if (fd < 0)
 		ksft_exit_fail_msg("Open failed: %s\n", strerror(errno));
-- 
2.53.0


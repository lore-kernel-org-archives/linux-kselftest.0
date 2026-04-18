Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75C359A8C;
	Sat, 18 Apr 2026 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509988; cv=none; b=F7r9ZaUdtUHwSpPW56UNcRI+GC/sjzHwJJaSXmegl4Y+p9DULlZjai6IDaaci0NFb3JZYw+5T3wdTE1wGyalaYS4AMXUkD/UBS+UUiXMEtuyWDU18IZB7ou0PE7/3NvQBz9wGvbEIMm5lUjaC+go91MIH4ixrqERf8JP6mfnmCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509988; c=relaxed/simple;
	bh=53qqY7PQB/uAj+zPP1JxuvnMAG3AtCcj7DDDSb0K5uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDmXTytjkSHINI9UV+Bqi2JFzajGxR18LSe0JNJx5cHSwWrx+ZqgHDyovNxuVwz3BJec25BHzZTHeu4qzZt1laKGjv/oQ7h/GpD/kAdaqYKJSMQOWtAC/YI5x2ubB/lDQM/GQQzCWKyhEXj5OOTEWriwB+aQ84vNLC2tK5O7FoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUZXlt5w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUZXlt5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC524C2BCB5;
	Sat, 18 Apr 2026 10:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509988;
	bh=53qqY7PQB/uAj+zPP1JxuvnMAG3AtCcj7DDDSb0K5uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LUZXlt5wRrXqfRKAmHovZ3JMSpzhHwncgfJ652lortl5wq58UoQvjIQ+c+ydESSGb
	 mv2czE3tEUxi4Ol/Zgpvq4lNqupj63om6xpPM4urrwHcm8Pi03Qfq8jTvAVWv1XhUJ
	 CrszSYDr9DdzRPohCaE2FlosizlkFu5m5ACfuTGlndhpHuQC70gBoCZfa2dhOREIOG
	 QAG3Ydz3xcFD2Lke+5WFijdnQ8LyO2JWN63uSst4jNp8pvpKz+XG0zHYvndMbjNPSA
	 /o2S1KlKSjo9dwM2ZBYz8GieNy1Xhsq1iQpPLiApC7HQZB5+zEVsLpZfNfEUbw2HG2
	 66cRXTN53ur0Q==
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
Subject: [PATCH v2 39/53] selftests/mm: hugetlb-mremap: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:24 +0300
Message-ID: <20260418105539.1261536-40-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418105539.1261536-1-rppt@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
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


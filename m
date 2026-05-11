Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B049242B753;
	Mon, 11 May 2026 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517198; cv=none; b=W+tzutaEbAo4/wR4/two27bKcwHquIoOszTGI7LvE3zk5JlPyzIjHTGc3rfhoSD7dD+W2jdVQXyFMq8+iwBlL3iRAMrz7CQcaEnfEvPAz4QBCIYPQXzj9MwdpuoTnkBy25UYgUIbwT8SMt6InLNDFQPluVJbON57hIFKZwkGzJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517198; c=relaxed/simple;
	bh=M5ApfsSYjafUfJ9qgwq5XnAC9wVA2+57J0j6FC98Eww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHd67FagIep2datxOtXol3LLYZ/LJJPJq5dPtNGTDseVr3kV04mshwbcL/NkXQcc+QMFcNVQzSSNa3WMyazSYBGXs2KXqmq4eRXOTglHu8Tkc4DyT4RraOTP4jtaOS4XVA9pDNYRqz9k825m3hCcdNkCJfzqGMpcQWx1i5Tc1nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiXQ1ybr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiXQ1ybr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49389C2BCFC;
	Mon, 11 May 2026 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517198;
	bh=M5ApfsSYjafUfJ9qgwq5XnAC9wVA2+57J0j6FC98Eww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hiXQ1ybrKjokkKJjCSwm36wQtUMAEH2YBFMm7TL9Yr5/Vq8P+7qKZvDqLrn3yQwsy
	 eK6GiWeSaPif1iphBUI/XT8nW49DvFlZlOHZ3jaCPjuFmhZUMwDJQwuKxdoZ/w3qRw
	 2iG8Y3KRiT+6rN/pQpFECf3/+Hwmv/5tM+bU4kExEp5eVhWHwQmVbGRHBvJVicNrv7
	 zOrtZpPGUyEoX4cxaPi3CESQYcQR6x7bRQRxMIB3IJGHWlFCEv9b9tlDbyUFR6EsMI
	 45AOKO/DIjo4/mOt2aBmhrE4ebGFyvmqdlVNMLj/Jv/vH5fI75+X15mNDS2fcFKN9w
	 xpesQcidZaW4A==
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
	Li Wang <li.wang@linux.dev>,
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
Subject: [PATCH v4 41/55] selftests/mm: hugetlb-mremap: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:25 +0300
Message-ID: <20260511162840.375890-42-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
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

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-mremap.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hugetlb-mremap.c b/tools/testing/selftests/mm/hugetlb-mremap.c
index 1c87c39780c5..d239905790dd 100644
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
@@ -125,7 +127,16 @@ int main(int argc, char *argv[])
 	else
 		length = DEFAULT_LENGTH_MB;
 
+	hugepage_size = default_huge_page_size();
+	if (!hugepage_size)
+		ksft_exit_skip("Could not detect default hugetlb page size\n");
 	length = MB_TO_BYTES(length);
+	length = (length + hugepage_size - 1) & ~(hugepage_size - 1);
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


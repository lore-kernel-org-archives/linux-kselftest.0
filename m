Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474203;
	b=LG9YU6voAiXaWRlTE4gpHmrEZz0NR3atdhN2dAOQ5ctmNKjh8Q+X/f+oljLIil0Gj6gV
	 cPON5WLnfDMY3/3QVQYJ8ZZVZ8ZXjwd6vDllwSUFeN58brWquDbn7MAQWa9IlM8IS9kop
	 8YSHguMtTj4GGi1yP1dOYSQ0wNiGjVd306l1DGtx5SC/IcXY7w1F6uSCxfdVLfBjm/Q2l
	 w6ITJxuTDmrMTSvnYGs1iIIU6hZJQr8WNLkLPAX+kPE3ASZvZ6eVyIvjELOTICB5giKqR
	 42HpzY36DQnm+c/dW9GIpAnNpT1t7CE5EvObhqSkSTPXk8mZFuFtHU2yPxKYArYcNKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474203;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZPvNr3mZonc2DF68bCIP/ucq9mR3dRYykiaNISklMLs=;
	b=2vULKHH8b6zZZFCFiEhof+m2hh8fRpXuQdOBOhJR/p7bi7n1W9mh3sv87K/wUzr9ALTt
	 1+UwiTw3q6oEH1qdEVV0eHQ4e2IOVznAbUEQ2v8T1tSgyZMWta+2+xO5GAxyadNEAZXeL
	 7D+ls7HyB8FcV9R1ZOlHISNWXSkM7k/f+lR+QDnQ/rIZ4u4XH4ERIYisB0ML21rPsf1ar
	 o23Kv/pGpJDB/Zzy7PCAxrUugRFmTr6aVm4dasbnViqwbdtetJ5JjoJJcOmeGGZr3CiKJ
	 lC43C41CkjW1tKIINkJWGgu34l8833YKpSg+Rt4hkB+rRCvkrm6rhJdTyzdmor/r8VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NJQ4BvBf;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CD8606A321;
	Thu, 12 Nov 2026 09:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79CD8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NJQ4BvBf
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD1B7339;
	Thu, 12 Nov 2026 01:03:19 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.169.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FD1D3F632;
	Thu, 12 Nov 2026 01:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794474202; bh=iDc8VYXRuayG1421sMnA6tNhOgvIr0UOwFtSDUy3iIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NJQ4BvBfwqXuu+JQb6LFfPIh4nX5n3/0+MzBSS04lBhBKO7/L1jOSWLR8VIcfQE1A
	 j1AZz1ObGzOrz9c1UxNIG2nESE+7TvotYYj4EUsR+T1gr6+4fn5lw1AfdU5iq+3rOt
	 C+7bRrmN6ry+celZHFLerDmLtBALhQZMP59rXAGg=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH 2/4] selftests/mm: detect masked PFNs in allocate_transhuge()
Date: Thu, 12 Nov 2026 14:32:48 +0530
Message-ID: <20261112090250.334344-3-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112090250.334344-1-sarthak.sharma@arm.com>
References: <20261112090250.334344-1-sarthak.sharma@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

allocate_transhuge() uses pagemap PFNs to determine whether a THP
was allocated. But pagemap PFN returns zero PFNs when the caller
is not allowed to read them (without CAP_SYS_ADMIN). Currently
this looks like a normal THP allocation failure.

When both pagemap entries are present but their PFNs are zero,
return -EACCES since the THP size and alignment cannot be verified.
In case of a base page fallback, the second entry won't be present
and thus it will still return -1 indicating a THP allocation failure.

Update ksm_tests.c to skip the test when pagemap PFNs are
unavailable. While here, use a common cleanup path and
add the missing close(pagemap_fd).

Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/ksm_tests.c | 26 +++++++++++++++++---------
 tools/testing/selftests/mm/vm_util.c   |  9 +++++++++
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
index 9e6e1633d0b5..9f97ce28e72a 100644
--- a/tools/testing/selftests/mm/ksm_tests.c
+++ b/tools/testing/selftests/mm/ksm_tests.c
@@ -10,6 +10,7 @@
 #include <unistd.h>
 #include <fcntl.h>
 #include <stdint.h>
+#include <errno.h>
 #include <err.h>
 
 #include "kselftest.h"
@@ -521,6 +522,8 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
 	unsigned long scan_time_ns;
 	int pagemap_fd, n_normal_pages, n_huge_pages;
 	const uint64_t hpage_size = pmd_psize();
+	int status = KSFT_FAIL;
+	int64_t pfn;
 
 	if (!thp_is_enabled()) {
 		ksft_print_msg("Transparent Hugepages not available\n");
@@ -551,7 +554,13 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
 	n_normal_pages = 0;
 	n_huge_pages = 0;
 	for (void *p = map_ptr; p < map_ptr + len; p += hpage_size) {
-		if (allocate_transhuge(p, pagemap_fd) < 0)
+		pfn = allocate_transhuge(p, pagemap_fd);
+		if (pfn == -EACCES) {
+			ksft_print_msg("Pagemap PFNs are unavailable\n");
+			status = KSFT_SKIP;
+			goto out;
+		}
+		if (pfn < 0)
 			n_normal_pages++;
 		else
 			n_huge_pages++;
@@ -563,13 +572,13 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
 
 	if (clock_gettime(CLOCK_MONOTONIC_RAW, &start_time)) {
 		ksft_perror("clock_gettime");
-		goto err_out;
+		goto out;
 	}
 	if (ksm_merge_pages(merge_type, map_ptr, map_size, start_time, timeout))
-		goto err_out;
+		goto out;
 	if (clock_gettime(CLOCK_MONOTONIC_RAW, &end_time)) {
 		ksft_perror("clock_gettime");
-		goto err_out;
+		goto out;
 	}
 
 	scan_time_ns = (end_time.tv_sec - start_time.tv_sec) * NSEC_PER_SEC +
@@ -581,12 +590,11 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
 	ksft_print_msg("Average speed:  %.3f MiB/s\n", (map_size / MB) /
 					       ((double)scan_time_ns / NSEC_PER_SEC));
 
+	status = KSFT_PASS;
+out:
+	close(pagemap_fd);
 	munmap(map_ptr_orig, len + hpage_size);
-	return KSFT_PASS;
-
-err_out:
-	munmap(map_ptr_orig, len + hpage_size);
-	return KSFT_FAIL;
+	return status;
 }
 
 static int ksm_merge_time(int merge_type, int mapping, int prot, int timeout, size_t map_size)
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 8ef226107d78..9942bbea7837 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -534,6 +534,15 @@ int64_t allocate_transhuge(void *ptr, int pagemap_fd)
 		  (uintptr_t)ptr >> (pshift() - 3)) != sizeof(ent))
 		ksft_exit_fail_msg("read pagemap\n");
 
+	/*
+	 * Both entries present means that a THP has been allocated. But if
+	 * their PFNs are masked, we cannot verify the size and alignment of
+	 * the THP
+	 */
+	if (PAGEMAP_PRESENT(ent[0]) && PAGEMAP_PRESENT(ent[1]) &&
+	    !PAGEMAP_PFN(ent[0]) && !PAGEMAP_PFN(ent[1]))
+		return -EACCES;
+
 	if (PAGEMAP_PRESENT(ent[0]) && PAGEMAP_PRESENT(ent[1]) &&
 	    PAGEMAP_PFN(ent[0]) + 1 == PAGEMAP_PFN(ent[1]) &&
 	    !(PAGEMAP_PFN(ent[0]) & ((1 << (hpage_shift - pshift())) - 1)))
-- 
2.53.0


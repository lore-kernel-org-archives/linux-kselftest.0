Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF05437C0E1
	for <linux-kselftest@vger.kernel.org>; Sun, 28 Jun 2026 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782641500; cv=none; b=gMS2UsWIMSQxVEAGFH/E6sXH06n76oraNMuwH3FcPmLKUP6gv01M7MhFZ2UgZSSFbRhunruhulUdCam3fo8c8nSfDR/+ogmWA8KsaezCyPOzTWHfBUB6S30fcmHdTlt6MTk67px0ehGpTnETLMEU+HcM+YpKB/5tl7USlbybZ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782641500; c=relaxed/simple;
	bh=dSZWz9FIl6aPrgUrsayXFU6WSGYEr171lxYJ4FOgsnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPMqxqVJih9bQ96klu/pMM5uDi+9zRkLWeYmF88JRbmCNg/x1Wfgk2PkhR3slaN+yoNtAcOy1Clp6HplnGE87kDz5/w9FpUApvOTsQc/kJrF6VKvcpGolbhqckzJyg4IRp6ScoXMAqjNZB1gR0RkwysxXMuoPN+BbrcpeK/iBUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Gu4G3yKs; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Gu4G3yKs"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782641494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/FXxFOl7E9feXzC4XdYQEI/BCMSekolzWSRC+gy20uU=;
	b=Gu4G3yKs1r17iq2hxE0V5jXT5++Q//mG7LBNPjGv/CTGvDVFMn2quqRpaQjMAFG3bhY/4J
	GUlD12Yw4i9gUAc+mo8AXwjlVz1Vksd9gHEJ2ZGXGuQ/aCPwolM3H3pJWwT58ypVh/1DFu
	4cTYLLyAGQlAwsyjfMbvcgzlPkgpdLE=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	usama.anjum@arm.com,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] selftests/mm: pagemap_ioctl: use the correct page size for transact_test()
Date: Sun, 28 Jun 2026 18:11:18 +0800
Message-ID: <20260628101118.35861-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

There are several places in transact_test() where we use the hardcoded
0x1000 (4k) as page size, which is not always correct for architectures
supporting multiple page sizes.

Switch to use the correct page size. Otherwise ./ksft_pagemap.sh on a
16k-page-size arm64 box fails with

 $ ./ksft_pagemap.sh
 [...]
 # ok 96 mprotect_tests Both pages written after remap and mprotect
 # ok 97 mprotect_tests Clear and make the pages written
 # Bail out! ioctl failed
 # # Planned tests != run tests (117 != 97)
 # # Totals: pass:97 fail:0 xfail:0 xpass:0 skip:0 error:0
 # [FAIL]
 not ok 1 pagemap_ioctl # exit=1
 # SUMMARY: PASS=0 SKIP=0 FAIL=1
 1..1

Fixes: 46fd75d4a3c9 ("selftests: mm: add pagemap ioctl tests")
Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 tools/testing/selftests/mm/pagemap_ioctl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index 762306177ad8..6f8971d5b3ce 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -1368,7 +1368,7 @@ void *thread_proc(void *mem)
 			ksft_exit_fail_msg("pthread_barrier_wait\n");
 
 		for (i = 0; i < access_per_thread; ++i)
-			__atomic_add_fetch(m + i * (0x1000 / sizeof(*m)), 1, __ATOMIC_SEQ_CST);
+			__atomic_add_fetch(m + i * (page_size / sizeof(*m)), 1, __ATOMIC_SEQ_CST);
 
 		ret = pthread_barrier_wait(&end_barrier);
 		if (ret && ret != PTHREAD_BARRIER_SERIAL_THREAD)
@@ -1403,15 +1403,15 @@ static void transact_test(int page_size)
 	if (pthread_barrier_init(&end_barrier, NULL, nthreads + 1))
 		ksft_exit_fail_msg("pthread_barrier_init\n");
 
-	mem = mmap(NULL, 0x1000 * nthreads * pages_per_thread, PROT_READ | PROT_WRITE,
+	mem = mmap(NULL, page_size * nthreads * pages_per_thread, PROT_READ | PROT_WRITE,
 		   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	if (mem == MAP_FAILED)
 		ksft_exit_fail_msg("Error mmap %s.\n", strerror(errno));
 
-	wp_init(mem, 0x1000 * nthreads * pages_per_thread);
-	wp_addr_range(mem, 0x1000 * nthreads * pages_per_thread);
+	wp_init(mem, page_size * nthreads * pages_per_thread);
+	wp_addr_range(mem, page_size * nthreads * pages_per_thread);
 
-	memset(mem, 0, 0x1000 * nthreads * pages_per_thread);
+	memset(mem, 0, page_size * nthreads * pages_per_thread);
 
 	count = get_dirty_pages_reset(mem, nthreads * pages_per_thread, 1, page_size);
 	ksft_test_result(count > 0, "%s count %u\n", __func__, count);
@@ -1420,7 +1420,7 @@ static void transact_test(int page_size)
 
 	finish = 0;
 	for (i = 0; i < nthreads; ++i)
-		pthread_create(&th, NULL, thread_proc, mem + 0x1000 * i * pages_per_thread);
+		pthread_create(&th, NULL, thread_proc, mem + page_size * i * pages_per_thread);
 
 	extra_pages = 0;
 	for (i = 0; i < iter_count; ++i) {
-- 
2.53.0


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF44436370;
	Wed, 29 Jul 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316303; cv=none; b=Kd2jVlSR1DVuocph1/QaErsMin8YvDiWSrTI0/mOug3tQuL5++Nqpo1u7KNE4rnO5NZkPCK06WDvSUdhUFozh0lgMQ9ELxLrxdmRq0YZ7qzvGVTTEbIRYOEtfxh69n50CKIW5973tT0AnigxYRHjwEYw2ydOFG5qpqznQzL0abY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316303; c=relaxed/simple;
	bh=oNUbNk0r8yn7C9q0VD2yHlmYQNN2PE7c8SHuTfHYrLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcDHrVxXoHcW33YS1KT6EOY+bg5mXfk4ojn0dripAXsqDkYKslk103gDTUOWNUZvdEVMqv19B43tmAESHckzojZDeOH2kxCtQ90F8bgS60iw+C6J1PYSFbH/83HePjcU6swr33ANSwCTeTHABZOy7+0nBdGeIiigKGeimJqmFiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HQogYakk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HQogYakk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F0EA169C;
	Wed, 29 Jul 2026 02:11:36 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 628DF3F86F;
	Wed, 29 Jul 2026 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785316300; bh=oNUbNk0r8yn7C9q0VD2yHlmYQNN2PE7c8SHuTfHYrLE=;
	h=From:To:Cc:Subject:Date:From;
	b=HQogYakkJHq7a/AOgN8mCAHfYWa5QINk9+nqy4BrQlz6rSqabhO3GTfB5tKFft0Ck
	 H9QdlliPn4cc8dnHt315SEahF3sLQxxa+w10y/Y/jS5kQ5qVAUepSqzHYJrIZOEobB
	 K+pK9Ai3KB8rfEv5z76nKqzzHD0vXYiKM+bh4AjU=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/mm: unpoison pages in memory-failure teardown
Date: Wed, 29 Jul 2026 10:11:26 +0100
Message-ID: <20260729091127.1001179-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory-failure tests call cleanup() only after all result checks.
A failed ASSERT_* invokes fixture teardown and aborts the test, so it
skips cleanup() and leaves the injected page hardware-poisoned.

Invoke cleanup() from FIXTURE_TEARDOWN() instead. Guard it with
self->injection_attempted so tests that exit before injection do not try
to unpoison a page when no injection was attempted. Injection can poison
a page before returning an error or delivering SIGBUS, so teardown must
clean up after every injection attempt. This runs the existing HWPoison
and HardwareCorrupted checks on both normal and assertion-failure paths.

Fixes: ff4ef2fbd101 ("selftests/mm: add memory failure anonymous page test")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v1:
- Rename triggered to injection_attempted.
- Document why teardown cleans up after every injection attempt.
---
 tools/testing/selftests/mm/memory-failure.c | 44 ++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
index 5d00aab31f9b5..f3cb578b16096 100644
--- a/tools/testing/selftests/mm/memory-failure.c
+++ b/tools/testing/selftests/mm/memory-failure.c
@@ -46,7 +46,7 @@ FIXTURE(memory_failure)
 	unsigned long pfn;
 	int pagemap_fd;
 	int kpageflags_fd;
-	bool triggered;
+	bool injection_attempted;
 };
 
 FIXTURE_VARIANT(memory_failure)
@@ -122,13 +122,6 @@ static void teardown_sighandler(void)
 	sigaction(SIGBUS, &sa, NULL);
 }
 
-FIXTURE_TEARDOWN(memory_failure)
-{
-	close(self->kpageflags_fd);
-	close(self->pagemap_fd);
-	teardown_sighandler();
-}
-
 static void prepare(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure) * self,
 		    void *vaddr)
 {
@@ -200,8 +193,7 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
 	ASSERT_EQ(pfn_flags & KPF_HWPOISON, KPF_HWPOISON);
 }
 
-static void cleanup(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure) * self,
-		    void *vaddr)
+static void cleanup(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure) * self)
 {
 	unsigned long size;
 	uint64_t pfn_flags;
@@ -217,6 +209,20 @@ static void cleanup(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failu
 	ASSERT_EQ(size, self->corrupted_size);
 }
 
+FIXTURE_TEARDOWN(memory_failure)
+{
+	/*
+	 * Injection may poison the page before failing or delivering SIGBUS, so
+	 * clean up after every injection attempt.
+	 */
+	if (self->injection_attempted)
+		cleanup(_metadata, self);
+
+	close(self->kpageflags_fd);
+	close(self->pagemap_fd);
+	teardown_sighandler();
+}
+
 TEST_F(memory_failure, anon)
 {
 	char *addr;
@@ -231,8 +237,8 @@ TEST_F(memory_failure, anon)
 	prepare(_metadata, self, addr);
 
 	ret = sigsetjmp(signal_jmp_buf, 1);
-	if (!self->triggered) {
-		self->triggered = true;
+	if (!self->injection_attempted) {
+		self->injection_attempted = true;
 		ASSERT_EQ(variant->inject(self, addr), 0);
 		FORCE_READ(*addr);
 	}
@@ -242,8 +248,6 @@ TEST_F(memory_failure, anon)
 	else
 		check(_metadata, self, addr, MADV_SOFT_ANON, ret);
 
-	cleanup(_metadata, self, addr);
-
 	ASSERT_EQ(munmap(addr, self->page_size), 0);
 }
 
@@ -298,8 +302,8 @@ TEST_F(memory_failure, clean_pagecache)
 	prepare(_metadata, self, addr);
 
 	ret = sigsetjmp(signal_jmp_buf, 1);
-	if (!self->triggered) {
-		self->triggered = true;
+	if (!self->injection_attempted) {
+		self->injection_attempted = true;
 		ASSERT_EQ(variant->inject(self, addr), 0);
 		FORCE_READ(*addr);
 	}
@@ -309,8 +313,6 @@ TEST_F(memory_failure, clean_pagecache)
 	else
 		check(_metadata, self, addr, MADV_SOFT_CLEAN_PAGECACHE, ret);
 
-	cleanup(_metadata, self, addr);
-
 	ASSERT_EQ(munmap(addr, self->page_size), 0);
 
 	ASSERT_EQ(close(fd), 0);
@@ -347,8 +349,8 @@ TEST_F(memory_failure, dirty_pagecache)
 	prepare(_metadata, self, addr);
 
 	ret = sigsetjmp(signal_jmp_buf, 1);
-	if (!self->triggered) {
-		self->triggered = true;
+	if (!self->injection_attempted) {
+		self->injection_attempted = true;
 		ASSERT_EQ(variant->inject(self, addr), 0);
 		FORCE_READ(*addr);
 	}
@@ -358,8 +360,6 @@ TEST_F(memory_failure, dirty_pagecache)
 	else
 		check(_metadata, self, addr, MADV_SOFT_DIRTY_PAGECACHE, ret);
 
-	cleanup(_metadata, self, addr);
-
 	ASSERT_EQ(munmap(addr, self->page_size), 0);
 
 	ASSERT_EQ(close(fd), 0);
-- 
2.47.3


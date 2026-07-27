Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E90627CCF0;
	Mon, 27 Jul 2026 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146076; cv=none; b=hGpMY7FYXL//HJnl+i2dk1Ocs3c0oafDD1NJhRCIRIf7rrqDEiRi/cSfX5wQKwEE/MuG2YYrc7KCPIZqcCqsaKp5RSXmw0kqUvue8iucpOjgIFzYVtPWqTeE02797WK1RnIWWvB+uQXb0keL1kxY+HSMBAz1O1TaP2rvXQ63liA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146076; c=relaxed/simple;
	bh=IwWrSDrINE++NYwqj/Bk+VRo4oGJ2eHfAb46LAiKODc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tMgoFj8lUihY3xQhVgee8upZhcsppBko3Bm3PSf8+c33ulwtjHxczkN1sIo4O3ejjIYUG30LXFQDxWFu8NOSOzv6nTQdAoFiyXwJQQ4MlcYcEfTEdH6h+Qn+e090QmvzrhkEaWNJ+ussdNWUqX/E3sQ7rJOWoxawlSOtmqyg8wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VkVpdYd2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VkVpdYd2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D28AD143D;
	Mon, 27 Jul 2026 02:54:25 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A2F6A3F66F;
	Mon, 27 Jul 2026 02:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785146069; bh=IwWrSDrINE++NYwqj/Bk+VRo4oGJ2eHfAb46LAiKODc=;
	h=From:To:Cc:Subject:Date:From;
	b=VkVpdYd21kJu0+U4OzGUiBxP/KkjUT1DaHuHW8cdr0cIYRPVvg059nd7jIRnT0l10
	 epzhR+iaQPlv+eKwAcvnKxZDzLfcqJOOF6zJaeB7nOXYSKmC9FbT8vqNArEIwj8Twy
	 q6GWXNCWhWjHqC27zmzMXRr2aHzXPeUcOcl+66Rw=
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
Subject: [PATCH] selftests/mm: unpoison pages in memory-failure teardown
Date: Mon, 27 Jul 2026 10:54:14 +0100
Message-ID: <20260727095415.385026-1-usama.anjum@arm.com>
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
self->triggered so tests that exit before injection do not try to
unpoison a page when no injection was attempted. This runs the existing
HWPoison and HardwareCorrupted checks on both normal and assertion-failure
paths.

Fixes: ff4ef2fbd101 ("selftests/mm: add memory failure anonymous page test")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 tools/testing/selftests/mm/memory-failure.c | 26 +++++++++------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
index 5d00aab31f9b5..eaa8b9bd401a1 100644
--- a/tools/testing/selftests/mm/memory-failure.c
+++ b/tools/testing/selftests/mm/memory-failure.c
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
@@ -217,6 +209,16 @@ static void cleanup(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failu
 	ASSERT_EQ(size, self->corrupted_size);
 }
 
+FIXTURE_TEARDOWN(memory_failure)
+{
+	if (self->triggered)
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
@@ -242,8 +244,6 @@ TEST_F(memory_failure, anon)
 	else
 		check(_metadata, self, addr, MADV_SOFT_ANON, ret);
 
-	cleanup(_metadata, self, addr);
-
 	ASSERT_EQ(munmap(addr, self->page_size), 0);
 }
 
@@ -309,8 +309,6 @@ TEST_F(memory_failure, clean_pagecache)
 	else
 		check(_metadata, self, addr, MADV_SOFT_CLEAN_PAGECACHE, ret);
 
-	cleanup(_metadata, self, addr);
-
 	ASSERT_EQ(munmap(addr, self->page_size), 0);
 
 	ASSERT_EQ(close(fd), 0);
@@ -358,8 +356,6 @@ TEST_F(memory_failure, dirty_pagecache)
 	else
 		check(_metadata, self, addr, MADV_SOFT_DIRTY_PAGECACHE, ret);
 
-	cleanup(_metadata, self, addr);
-
 	ASSERT_EQ(munmap(addr, self->page_size), 0);
 
 	ASSERT_EQ(close(fd), 0);
-- 
2.47.3


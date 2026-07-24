Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A70471249;
	Fri, 24 Jul 2026 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784932214; cv=none; b=IPdt4dVtTZn+/6lz1pasLMoIEhDfrFNUlGMvIa4pfQ20GH6cZ/D9ys4BorKYy3P+oPo/f39XA/WLEeASXT1Bh+DZ2lNpDLSfLYwzSnpj4FWMgSwHnVSI4Tg48i5DIXWQW2jO1fGf3KsJsWR1V3bzfjPTnAIZDiJVUULubQIZIk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784932214; c=relaxed/simple;
	bh=8/w2kfEV4dpxs1e04E9KZKjsCZ7Gf858pYTInPu8Xdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVyRJ7CjK/E3caMzGOIJV342OVZBvATw/L6XA1rnWX1Vy/XpgKHDVgJTQ8DoElGoHP3Ms5Un6S76q1y8mM9AVaBq3W26fEkcqWGM146I8J038MPMbDilbENdA7k2UlnFGXZYy+hdtdEQGRekYzSlFsreJeXB13BsWzVtCk1nO1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=lDGkdWSg; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="lDGkdWSg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=phv1B9Yxat6YIEopEPUTNjYYzL54eFSY9r4GoCdruM0=; b=lDGkdWSgenq2WUBSSLwgIoU2bb
	iq5fO5pwGwjNj4bxQlt4EaiKdpGhKGWYtAlH8V4HscBe+rLdz3LpbJ1rz4Eo+8VHi5Cf2YozwpoKa
	/EOf7b6Fj1trVqdHRewh1VGmUqt2Uelwy48tNNXJNpUrXhxN2zVXjdupFpQVDCV2E7dnQLmXL8+iR
	L2uoBhWRMCi66UhaWFlC12UuNvV8vGwQzSm9dIYb5f6FEjYNYvE+3V+Vz3IqDYqTDL0zb61Ac86UM
	/peYQvZJXj0L62/5Os+HC3VsJDdWWxk6zGgLEgSYvF8x6yeOIqsGogSrLBPrd15tBYdhgtMl7L8QJ
	6fXo9UZA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wnOOs-0000000027h-1kjG;
	Fri, 24 Jul 2026 18:29:50 -0400
From: Rik van Riel <riel@surriel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Rik van Riel <riel@surriel.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v4 08/12] selftests/mm: cover /proc/pid/mem access to VM_PFNMAP memory
Date: Fri, 24 Jul 2026 18:29:30 -0400
Message-ID: <20260724222934.1463812-9-riel@surriel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724222934.1463812-1-riel@surriel.com>
References: <20260724222934.1463812-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading a VM_PFNMAP mapping through /proc/pid/mem exercises
__access_remote_vm() two ways: a COWed page has a struct page and is
returned by get_user_page_vma(), while a raw PFN has none and is reached
through vma->vm_ops->access().

Add two tests to pfnmap.c, both reading VM_PFNMAP memory through
/proc/self/mem.

procmem_cow_read maps the file MAP_PRIVATE and writable, writes to COW a
page, then reads it back. Without the struct-page path in
get_user_page_vma() this read is short: the access falls back to
generic_access_phys(), which ioremaps the PFN, and ioremap of a COWed RAM
page is rejected.

procmem_pfn_read reads a raw PFN back through ->access(). ioremap rejects
RAM, so it runs only for genuine device memory and is skipped for the
default /dev/mem System RAM target.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 tools/testing/selftests/mm/pfnmap.c | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/mm/pfnmap.c b/tools/testing/selftests/mm/pfnmap.c
index 4f550822385a..6ff5d1029517 100644
--- a/tools/testing/selftests/mm/pfnmap.c
+++ b/tools/testing/selftests/mm/pfnmap.c
@@ -31,6 +31,7 @@ static sigjmp_buf sigjmp_buf_env;
 static char *file = "/dev/mem";
 static off_t file_offset;
 static int fd;
+static int target_is_ram;
 
 static void signal_handler(int sig)
 {
@@ -113,6 +114,7 @@ static void pfnmap_init(void)
 		if (err)
 			ksft_exit_skip("Cannot find ram target in '/proc/iomem': %s\n",
 				       strerror(-err));
+		target_is_ram = 1;
 	} else {
 		file_offset = 0;
 	}
@@ -271,6 +273,70 @@ TEST_F(pfnmap, fork)
 	ASSERT_EQ(ret, 0);
 }
 
+TEST_F(pfnmap, procmem_cow_read)
+{
+	char *priv, *buf;
+	ssize_t rc;
+	int mem_fd;
+
+	/*
+	 * A COWed page in a VM_PFNMAP mapping has a struct page, so reading it
+	 * through /proc/self/mem -- __access_remote_vm() -> get_user_page_vma()
+	 * -- returns it directly, instead of routing to vma->vm_ops->access(),
+	 * which ioremaps the PFN and cannot reach a COWed RAM page.
+	 *
+	 * Map the file MAP_PRIVATE and writable, write to COW a page into anon
+	 * memory, then read the page back through /proc/self/mem.
+	 */
+	self->size2 = self->pagesize;
+	self->addr2 = mmap(NULL, self->size2, PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE, fd, file_offset);
+	if (self->addr2 == MAP_FAILED)
+		SKIP(return, "Cannot create a writable private pfnmap mapping");
+	priv = self->addr2;
+
+	/* COW the page and stamp known bytes into the anon copy. */
+	priv[0] = 0x42;
+	priv[self->pagesize - 1] = 0x24;
+
+	buf = malloc(self->pagesize);
+	ASSERT_NE(buf, NULL);
+
+	mem_fd = open("/proc/self/mem", O_RDONLY);
+	ASSERT_GE(mem_fd, 0);
+	rc = pread(mem_fd, buf, self->pagesize, (off_t)(uintptr_t)priv);
+	close(mem_fd);
+
+	ASSERT_EQ(rc, (ssize_t)self->pagesize);
+	EXPECT_EQ(buf[0], 0x42);
+	EXPECT_EQ(buf[self->pagesize - 1], 0x24);
+
+	free(buf);
+}
+
+TEST_F(pfnmap, procmem_pfn_read)
+{
+	char buf[64];
+	ssize_t rc;
+	int mem_fd;
+
+	/*
+	 * A raw PFN of a VM_IO/VM_PFNMAP mapping has no struct page, so
+	 * __access_remote_vm() reaches it through vma->vm_ops->access()
+	 * (generic_access_phys()). That ioremaps the PFN, which is rejected for
+	 * RAM, so this only applies to genuine device memory.
+	 */
+	if (target_is_ram)
+		SKIP(return, "Target is System RAM; ->access() cannot ioremap RAM");
+
+	mem_fd = open("/proc/self/mem", O_RDONLY);
+	ASSERT_GE(mem_fd, 0);
+	rc = pread(mem_fd, buf, sizeof(buf), (off_t)(uintptr_t)self->addr1);
+	close(mem_fd);
+
+	ASSERT_EQ(rc, (ssize_t)sizeof(buf));
+}
+
 int main(int argc, char **argv)
 {
 	for (int i = 1; i < argc; i++) {
-- 
2.53.0-Meta


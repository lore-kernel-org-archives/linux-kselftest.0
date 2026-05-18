Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D121254B;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128266; cv=none; b=acsfkjJrBTr9YtY0pSHGwxIC8iRzyIjqeP30LJ1gyZdf5aYLhDIlJb+Z0UnneNvR0Fja30GZvrD8jKVWrXkr8JTljJW8EEby4ImGxv2Hw0eJN6H0Oxf8xtI2o53+tJVXb/vJKKvDXG+tc3JIkvgdPW+3e2ju5bhkOsA+UtuViV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128266; c=relaxed/simple;
	bh=PykAxIkeN0jFfz1Zn2ciq+xbGylYcs6mwYJtCuA0HUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfuegJsiK+iVAvpAsOwrUASKkyWMKDWb08z3okDg03Y3YFUOajDeUL4JYWtXR0M7rropugzxNmZ4f6C49I7prqc6eSzBoftZOf3OQoLPuRP07VuZ20Fv8WzHhk4V7BzQ31S8Ie8Bj1E5uGkyDvP+Rm2I5SHQwwgvWXmjxSzXMZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6wbsmLV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6wbsmLV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B429BC2BCF6;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779128265;
	bh=PykAxIkeN0jFfz1Zn2ciq+xbGylYcs6mwYJtCuA0HUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m6wbsmLVMwi7Upb11/kQFX/HyNxuFSFY5SFBz3UwQGuxUi6FhGgQdqJzoy+cKeH4e
	 tPCPwU3YB9c0o/BtYlHeeE1y8JDE5FJgOCUCI9FtUrjk6G6w78UaQvNQRyOh6/55OD
	 fsF89KiQ/a1iuU/ofksPPU8aGKV+eimTBJI/nDuEuGfxH95OM+jnxqa2822dryZy1S
	 uEWYjfBUp9WW4IXR7DUzpfAk9TQ6P2Ap1eIQ/X43JtueojXeaNwdt0ma4n5AaojQnc
	 jE73+KyKYR/T42Jrpt6NOcmrQM7GCGV9z6mTERsBad6YvRUdTSzqf0OpMm2a66budD
	 7LrtB4FhSfwxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EB3CD4F58;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
From: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Date: Mon, 18 May 2026 11:17:35 -0700
Subject: [PATCH RFC 3/5] mm: selftests: Refactor hugepage-mmap to use
 kselftest harness
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-port-hugetlb-selftests-v1-3-d64ba3a785fe@google.com>
References: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>
In-Reply-To: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 muchun.song@linux.dev, osalvador@suse.de
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779128265; l=2847;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=+iX/sXuCWZ7Cvdfn9EiGTfuvG8jGBSzvIKiil83JdTo=;
 b=cCP3PNDbEeViZeHLywrqRCI3U02IjNAxaY6JYUaLkxHKd7lXQu1aRkOkIki96+D7u+Eg7seg3
 Ck69Pd15PnTCJdoyr6CcFCDPFOqZ+N4TulPvxistfAsTOhpiopVYqat
X-Developer-Key: i=ackerleytng@google.com; a=ed25519;
 pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Endpoint-Received: by B4 Relay for ackerleytng@google.com/20260225 with
 auth_id=649
X-Original-From: Ackerley Tng <ackerleytng@google.com>
Reply-To: ackerleytng@google.com

From: Ackerley Tng <ackerleytng@google.com>

Refactor hugepage-mmap.c to use the kselftest harness so that a later patch
can add a different setup flow.

Use a fixture for managing the hugetlbfs-backed memfd lifecycle (setup and
teardown).

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/mm/hugepage-mmap.c | 67 ++++++++++++++++--------------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/tools/testing/selftests/mm/hugepage-mmap.c b/tools/testing/selftests/mm/hugepage-mmap.c
index 64f7d28a97fdf..9c8a0638d04b8 100644
--- a/tools/testing/selftests/mm/hugepage-mmap.c
+++ b/tools/testing/selftests/mm/hugepage-mmap.c
@@ -15,49 +15,54 @@
 #include <unistd.h>
 #include <sys/mman.h>
 #include <fcntl.h>
-#include "kselftest.h"
+#include "kselftest_harness.h"
 
 #define LENGTH (256UL*1024*1024)
 #define PROTECTION (PROT_READ | PROT_WRITE)
 
-int main(void)
+FIXTURE(hugepage_mmap)
 {
-	void *addr;
-	int fd, ret = 0;
-	unsigned long i;
-
-	ksft_print_header();
-	ksft_set_plan(1);
+	int fd;
+	char *addr;
+};
 
-	fd = memfd_create("hugepage-mmap", MFD_HUGETLB);
-	if (fd < 0)
-		ksft_exit_fail_msg("memfd_create() failed: %s\n", strerror(errno));
+FIXTURE_SETUP(hugepage_mmap)
+{
+	self->fd = memfd_create("hugepage-mmap", MFD_HUGETLB);
+	ASSERT_GE(self->fd, 0) {
+		TH_LOG("memfd_create() failed: %s", strerror(errno));
+	}
 
-	addr = mmap(NULL, LENGTH, PROTECTION, MAP_SHARED, fd, 0);
-	if (addr == MAP_FAILED) {
-		close(fd);
-		ksft_exit_fail_msg("mmap(): %s\n", strerror(errno));
+	self->addr = mmap(NULL, LENGTH, PROTECTION, MAP_SHARED, self->fd, 0);
+	ASSERT_NE(MAP_FAILED, self->addr) {
+		TH_LOG("mmap(): %s", strerror(errno));
+		close(self->fd);
 	}
+	TH_LOG("Returned address is %p", self->addr);
+}
 
-	ksft_print_msg("Returned address is %p\n", addr);
-	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
+FIXTURE_TEARDOWN(hugepage_mmap)
+{
+	munmap(self->addr, LENGTH);
+	close(self->fd);
+}
 
-	for (i = 0; i < LENGTH; i++)
-		*(char *)(addr + i) = (char)i;
+TEST_F(hugepage_mmap, read_write)
+{
+	unsigned long i;
 
-	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
-	for (i = 0; i < LENGTH; i++) {
-		if (*(char *)(addr + i) != (char)i) {
-			ksft_print_msg("Error: Mismatch at %lu\n", i);
-			ret = 1;
-			break;
-		}
-	}
+	TH_LOG("First hex is %x", *((unsigned int *)self->addr));
 
-	munmap(addr, LENGTH);
-	close(fd);
+	for (i = 0; i < LENGTH; i++)
+		self->addr[i] = (char)i;
 
-	ksft_test_result(!ret, "Read same data\n");
+	TH_LOG("First hex is %x", *((unsigned int *)self->addr));
 
-	ksft_exit(!ret);
+	for (i = 0; i < LENGTH; i++) {
+		ASSERT_EQ(self->addr[i], (char)i) {
+			TH_LOG("Error: Mismatch at %lu\n", i);
+		};
+	}
 }
+
+TEST_HARNESS_MAIN

-- 
2.54.0.563.g4f69b47b94-goog



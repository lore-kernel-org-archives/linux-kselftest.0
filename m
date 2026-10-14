Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634F2515961
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000688; cv=none; b=Bs8PPVrV4WFIry4b94vBtFK2IgrSHFoZYXhSrKzz+yqWhNcT0EyBZOk8/xHhlFUTHog2UpC89LQhygeaIRJ39Q2+sHGbo26Swiz65kebAAxN69gXBwGNrqs0jPBC5ZVl36j33jftC1sm4s/3wJY6oQq/ZJNYMPeeJ9T6WseNlxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000688; c=relaxed/simple;
	bh=dQFd174IyKEc42PMYrNrs0oRtwuuB5aMw09KeEoMoUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8uOtTdv2Gf0WpsShFv3A5ZSysiyk1MDS2d6vuPbMU7Goam78T+du/QQVbM2ARBa/p4JfMEE4T7o4H6DckkeubBW6y+YnlGRuqL7r0sraFN2xZol/PUDReBOQMBcDZ8aKQS/pjml/7QPuGi9+KMg89DOEJeUIbXntgQDN4/UHfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=YU5IghKe; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="YU5IghKe"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e56c287b3so52829985a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000686; x=1792605486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bK/BWDZAO2OK/KTNrMPySMyjNClCeAdL4aMTxK9K6Oc=;
        b=YU5IghKeg7JpVxt87Rd2tJKWWgmiUkpJ1bvgSRI/AnN46mYbNHr3jhXDYX9bIJJAWp
         ibDqyTlLz0SZe/gHGnXHkoyi65nbH11yQjwoCf+pKHQHC10hqcUHkPwz0/YWmeGFyP0J
         8YxGxX1O+ugfKby267ucBRB3CPLrG7z2P58YniwO1uxETWyDCuhMX2WkbfUhuwc9K4j+
         yqNnUwkvtvAGwGTloQfhWjnxTi/rLLPfJPcvF6hZxt6PTd40h+IJzQxMLTI5VobJM88R
         9YjxA5a/2df4lWiT6UAE0Ta3jCYaZFijK28N+uvU+6+F5z0VpSHXKQlyE5bUxpw6TfBc
         C9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000686; x=1792605486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bK/BWDZAO2OK/KTNrMPySMyjNClCeAdL4aMTxK9K6Oc=;
        b=f5d2IcUN5ONW5USVaGgzvbmduWMFLBdvqkt0jN3TkeEXjI5GjLgzQ9CwzgFPLR0xBz
         sY5gY9yvR7A/O81PkJgzDXabcg2qUd6aXDGAqjT2yksPn++yIhqEntJpg5y64yXxQIIJ
         HEE84kqLnZ6jbMf/tYdEwka0AbfHPKNQ4RQCTgAILUYTDsPEluu5onSwYWqQh5HR5Joz
         OA4lfwlAot0UX6cw7Rz/daXpwnYMuCR0lt+werkXZwmdwIOXJHVee9qJFrK9Ee6KO0vC
         ZEopkCvnCtZVQMHoGgC9pMe62TNeYp+HpO7Bbj31HcTH/+58vYZ4JrFE+6bDOdfomH3i
         b3CA==
X-Gm-Message-State: AFq9FYJCOaTaXrpA6CACLiTYoZels+vQVzVUOeq1yRaNjZ6HMG+oncZ4
	CcpNHkZPvZY2A+5Fsl2QMezfyaAUZzTaBlSwejqRxvEaV9uVzb6JhQAZtEE5aASLhZRZDZhwpJz
	2y8ga388=
X-Gm-Gg: AYBFou2QKhRfDqxPTaqEnnkR6044N9dIaBJ2Q+bbn4HVZYHS3OZ6nbIgRrPU5fYP3uY
	UaaHKUsbY9GGkk71AiOpDfQQDBovxSzuCF6DOQvjOvAUDffsN5qKfohJPP1MOV6Az6wHMjLHkDK
	E37hTuxq8g6rCdFYRZoBUoX+MVgAeVKOX3a1fRHlsyd6G2VFRjfDaMekilc8xu8vnzCIXnCAMwq
	Bsnm+JWAa6nEfSlxZHfRbUvvmsaVlks7AN91Q+WN/vwpvpSMoe8SZbMJ3sV3I68yRtZOml05uYN
	N4oS3wB2plwcPxo+AOVFjs4vJ6WeOkdNijOA1T7xPQ3mGQHH1bUetlTuLGWRXBthwxWzY39XFoI
	HnfPQ/kF3Cqv/lyM0ww87H9tM2dU9r2d2z5470CcC5GCpkQEr2NVkbM7Ah35IFkYKP+kdVcHRoi
	h8vRWcNfQRWgox8YYgqMpXqL9WFskwyBKFNAD+2kaEVbZ86TXQSisMR2CjhilSPi0pfsoZEUyXQ
	AP7Am2fUvbos7yE8hUCXnoqoceijy2WRytiKSKo8iBoopwf8HKSPHdjsy9J
X-Received: by 2002:a05:620a:1720:b0:93e:c12c:9b69 with SMTP id af79cd13be357-93ec12c9eb7mr2613825985a.68.1792000686355;
        Wed, 14 Oct 2026 10:58:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:06 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 1/8] selftests/mm: add MADV_COLD and MADV_PAGEOUT contract tests
Date: Wed, 14 Oct 2026 13:57:49 -0400
Message-ID: <20261014175756.2035176-2-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-1-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MADV_COLD and MADV_PAGEOUT share a page-table walker covering ordinary
PTEs, PTE-mapped large folios and huge PMDs. Existing selftests provide
little coverage of its range, folio-state and permission decisions.

Add a kselftest harness test for both hints, starting with the most basic
behavior userspace relies on: MADV_COLD neither populates a PTE hole nor
faults a swapped page back in, and neither hint may be applied to a locked
VMA.

The swapped-page test skips when swap is unavailable.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/Makefile        |   2 +
 tools/testing/selftests/mm/ksft_madvise.sh |   4 +
 tools/testing/selftests/mm/madvise.c       | 134 +++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh  |   5 +
 4 files changed, 145 insertions(+)
 create mode 100755 tools/testing/selftests/mm/ksft_madvise.sh
 create mode 100644 tools/testing/selftests/mm/madvise.c

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index beacc0f87304..07d61110eb24 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -69,6 +69,7 @@ TEST_GEN_FILES += hugetlb-shm
 TEST_GEN_FILES += hugetlb-soft-offline
 TEST_GEN_FILES += khugepaged
 TEST_GEN_FILES += madv_populate
+TEST_GEN_FILES += madvise
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_populate
 ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64 loongarch32 loongarch64))
@@ -156,6 +157,7 @@ TEST_PROGS += ksft_ksm.sh
 TEST_PROGS += ksft_ksm_numa.sh
 TEST_PROGS += ksft_madv_guard.sh
 TEST_PROGS += ksft_madv_populate.sh
+TEST_PROGS += ksft_madvise.sh
 TEST_PROGS += ksft_memfd_secret.sh
 TEST_PROGS += ksft_memory_failure.sh
 TEST_PROGS += ksft_migration.sh
diff --git a/tools/testing/selftests/mm/ksft_madvise.sh b/tools/testing/selftests/mm/ksft_madvise.sh
new file mode 100755
index 000000000000..29cbbca800f2
--- /dev/null
+++ b/tools/testing/selftests/mm/ksft_madvise.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+# SPDX-License-Identifier: GPL-2.0
+
+./run_vmtests.sh -t madvise
diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
new file mode 100644
index 000000000000..bb4efb92e6da
--- /dev/null
+++ b/tools/testing/selftests/mm/madvise.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MADV_COLD and MADV_PAGEOUT tests.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+#include "vm_util.h"
+
+/* Reclaim can fail transiently, so retry for up to a second. */
+#define PAGEOUT_RETRIES 100
+
+static size_t page_size;
+
+FIXTURE(madvise)
+{
+	int pagemap_fd;
+};
+
+FIXTURE_SETUP(madvise)
+{
+	page_size = getpagesize();
+
+	self->pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
+	ASSERT_GE(self->pagemap_fd, 0);
+}
+
+FIXTURE_TEARDOWN(madvise)
+{
+	close(self->pagemap_fd);
+}
+
+/* Page out the range until its first page is swapped. */
+static bool pageout_until_swapped(struct __test_metadata *_metadata,
+				  char *mapping, size_t size, int pagemap_fd)
+{
+	int retry;
+
+	for (retry = 0; retry < PAGEOUT_RETRIES; retry++) {
+		ASSERT_EQ(madvise(mapping, size, MADV_PAGEOUT), 0);
+		if (pagemap_is_swapped(pagemap_fd, mapping))
+			return true;
+		usleep(10000);
+	}
+
+	return false;
+}
+
+/*
+ * Both hints are best effort, so these tests check what userspace can rely
+ * on: which mappings are accepted, which pages must never be reclaimed, and
+ * that neither hint changes memory contents or populates the range. A test
+ * that needs a page to be reclaimed first checks that reclaim works at all,
+ * and skips if it does not.
+ */
+
+/* Neither hint may populate a hole between two populated pages. */
+static void check_skips_pte_hole(struct __test_metadata *_metadata,
+				 int pagemap_fd, int advice)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, 3 * page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+	mapping[2 * page_size] = 1;
+	ASSERT_FALSE(pagemap_is_populated(pagemap_fd, mapping + page_size));
+
+	ASSERT_EQ(madvise(mapping, 3 * page_size, advice), 0);
+	ASSERT_FALSE(pagemap_is_populated(pagemap_fd, mapping + page_size));
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[2 * page_size], 1);
+
+	ASSERT_EQ(munmap(mapping, 3 * page_size), 0);
+}
+
+TEST_F(madvise, cold_skips_pte_hole)
+{
+	check_skips_pte_hole(_metadata, self->pagemap_fd, MADV_COLD);
+}
+
+/* Neither hint may be applied to locked memory. */
+TEST_F(madvise, locked_vma_is_rejected)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+	if (mlock(mapping, page_size))
+		SKIP(return, "could not lock a page");
+
+	ASSERT_EQ(madvise(mapping, page_size, MADV_COLD), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(madvise(mapping, page_size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/* Neither hint may fault a swapped page back in. */
+static void check_skips_swapped_pte(struct __test_metadata *_metadata,
+				    int pagemap_fd, int advice)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+	if (!pageout_until_swapped(_metadata, mapping, page_size, pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not swap the page");
+
+	ASSERT_EQ(madvise(mapping, page_size, advice), 0);
+	ASSERT_TRUE(pagemap_is_swapped(pagemap_fd, mapping));
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+TEST_F(madvise, cold_skips_swapped_pte)
+{
+	check_skips_swapped_pte(_metadata, self->pagemap_fd, MADV_COLD);
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index a1b45a3dedae..0e6a24659d12 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -53,6 +53,8 @@ separated by spaces:
 	test madvise(2) MADV_GUARD_INSTALL and MADV_GUARD_REMOVE options
 - madv_populate
 	test memadvise(2) MADV_POPULATE_{READ,WRITE} options
+- madvise
+	test madvise(2) MADV_COLD and MADV_PAGEOUT
 - memfd_secret
 	test memfd_secret(2)
 - process_mrelease
@@ -330,6 +332,9 @@ CATEGORY="madv_guard" run_test ./guard-regions
 # MADV_POPULATE_READ and MADV_POPULATE_WRITE tests
 CATEGORY="madv_populate" run_test ./madv_populate
 
+# MADV_COLD and MADV_PAGEOUT tests
+CATEGORY="madvise" run_test ./madvise
+
 # PROCESS_MADV test
 CATEGORY="process_madv" run_test ./process_madv
 
-- 
2.56.0


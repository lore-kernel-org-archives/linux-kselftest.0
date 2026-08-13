Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706441A4F6
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 06:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602858; cv=none; b=SLAb6JTbauOuEabi6ev9dW6361+XvT9zvPoUcEtHQjsKUCozFhwdERA1Jycyu3LTBAifYqX8lVbA40q/8UkP4cbFOGs5YP+gdaFqoQR6u6POGd/NldEgm2vCOPibNATzUTVh8X1cNKanTH+2KLqI2hL+OQP/3mBmEActETUKHZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602858; c=relaxed/simple;
	bh=76LM6ToY2eHSmSZYm0suq08/jRJsqACPst0XTL36MYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PjS7VT4uikTrymn1oSk9eMyvQqyk8hkybz+Oj6YcZUnSjI+8DZ64U/O4stkxOd2+8kYeWC+sOfT7CrI4EHjVVJSUjh/iEA03/z84EXmnJiy+QbI/gngwHLYN6hOrwt+yMhEp9/ucbLGJhZofBfy1rWoD3JGhAx151OBUGg4oZ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdlMtOF5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdlMtOF5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc891373e0so5644645ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786602856; x=1787207656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGEHu03tHaEQC/40eXovaB+LbvcIQZXcnqhPlZve8e0=;
        b=RdlMtOF5D8sPUcYTqfHa5QBI/Q7yY0UK2VElRkzzCzTlOMwUQE5lZ/9rthfL0NQv/B
         xn2X3hKEzqHp/1hhvERZQw5Hwz+esWsaOBaXI/BvSd+CvIqcO7EUTW4hQlKpEDCYRXo2
         5X9DdRCgEdrJb4gvjkdkLbb32HEHv1YaI0FZdSSlJusr+m9PZ3u4OEYW0AaNI7W/N4Fl
         EkmOWOCaG8f65ZcCqDZvZ4jpXuvpXYTzFAzYyzsavSbirhh6AiSMLnIfgAu/4T/0tFcV
         8t9uBkapYdlA1NYOWMv8yIOF/2RzeMxIINn8lUfTcTeVOxZTLwEr+ZI/XMYSDUbXIEPr
         vE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786602856; x=1787207656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uGEHu03tHaEQC/40eXovaB+LbvcIQZXcnqhPlZve8e0=;
        b=lAu7Dor7IB+jskJLc3AdfDnBPtD8qvv/GcSB296iPIbWvo2vziQlr/AKTj58PahbvW
         Sgocz4xVdneDG91YeVG+vvvru3jDJIjioWHQRrqozXvucIzw6BdFm25MGqGB39BJl8IF
         2t9qv10l2prIG+NTaWW9y3tXRK67e3k0fxpSKAghs0nbt7hspcq+IffrY4/Af+NP7ubk
         pSfajbKMSmgkizCf4lOKnv6TZgmkbf5wQ2faoKJHQ9p0ueYxpWyo9hpZYZOqlQJQPU00
         cGoqCoxCfRTYkjkF3lZ56IXSvioh5ejn4uV0bg3Ay40gtQGIYpZEYGOfUT+vt2lPpbM5
         VDOg==
X-Forwarded-Encrypted: i=1; AHgh+RrDeN5CiY/ArQs5C/86VKhxQV5F7CTSi/jl0OuArQrQMFDrIdSPTnrJDzVw8Dv5N2QFq/Pa5TxeHl8+ttitC1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZsas8ujYuB6srpbo5Fhzqn3QhlPGx5aggCyyHhoclq0Vu9mnI
	qGhELC5YTYNnW0Q+inrFgNtXOxK4p5YUeaeJqWoB3TIUamlHK7LFDlLg
X-Gm-Gg: AR+sD11L3kawFdMERbPvkixS1tp8mJbLM9m6dD53bNYOAy5oJnorpYIENQqMheZa6Qc
	bK4we1PyMyJ+w8tkQ94RIBfyIKL6NXiZSJdVY74QRUxzzTnOMInqPJRja2wb2U2bJxo63Pmd0t6
	1Xze28zAWLKnzuYUv9SAntT4Un91XQ8SNRr3REQ3RaOCfkGku+QMd3HadBN0NXeQI0088yuFRnK
	upCsHeGU8oREpxy/CoS04djokS+2IWZunTOHUCGIhYHXXF9tG0POkPUFH0L0ETW62hqBm6cXdpx
	TyWTGwdXpTR4af1ZnlNoDxAYrtI3esQccgQe73WqAcopxbVbwWa6mLUNqhuiCp3iQRSLbUc4vTq
	bU18ZDqUur7Rb7Wq78MnvL+jsbzBpZhRRmWtP7XRiMJ9UmF7E+WKdA3jYF4I0A5eGroH1qQitA4
	Tz6F52yp6NI7QoSqQel0V6OLefbnUjpfr5rSJrkWwKF7XbQ6lZKmrCxfAFH1hhZ1xucRfG6W5xG
	K5ZEgdWOJhwGrWwvJd4tazqYIUe7Vl49LQMaB3Cb67wniMQWrsgFkpUFgApfTzXFA==
X-Received: by 2002:a17:903:37cf:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2d37e873f04mr41704175ad.19.1786602855815;
        Wed, 12 Aug 2026 23:34:15 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c49c446sm4681875ad.69.2026.08.12.23.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 23:34:15 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 2D31615B0436; Thu, 13 Aug 2026 15:34:13 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-mm@kvack.org
Cc: geert@linux-m68k.org,
	daniel@thingy.jp,
	Hajime Tazaki <thehajime@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: [RFC PATCH 6/6] selftests/mm: add nommu mmap and mremap behavior tests
Date: Thu, 13 Aug 2026 15:34:01 +0900
Message-ID: <20260813063401.1786548-7-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813063401.1786548-1-thehajime@gmail.com>
References: <20260813063401.1786548-1-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a kselftest utility to validate memory mapping capabilities
under nommu kernels, aligned with
Documentation/admin-guide/mm/nommu-mmap.rst.

The test implements basic checks into a generic architecture-agnostic
test matrix applicable across nommu targets. It evaluates:

1. MAP_FIXED allocation rejections.
2. Standard MAP_PRIVATE and MAP_ANONYMOUS allocation resilience.
3. MAP_UNINITIALIZED allocations via optional kernel configurations.
4. Regular file mappings via standard filesystem storage.
5. Memory-backed file mapping with /dev/zero
6. Block device subsystem mappings (gracefully skipping if node is
   missing).
7. Shared vs Private backing discrepancies under nommu conditions.
8. mremap limits, ensuring non-expandable restrictions behave properly.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-um@lists.infradead.org
Assisted-by: Gemini:Pro [AI_Reviewer] [Sashiko_Linter]
Assisted-by: cubic.dev:unspecified
Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 tools/testing/selftests/mm/Makefile           |   3 +
 tools/testing/selftests/mm/nommu_mmap_test.c  | 294 +++++++++
 .../testing/selftests/mm/nommu_mremap_test.c  | 583 ++++++++++++++++++
 3 files changed, 880 insertions(+)
 create mode 100644 tools/testing/selftests/mm/nommu_mmap_test.c
 create mode 100644 tools/testing/selftests/mm/nommu_mremap_test.c

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index e6df968f0971..3986ae7d75bc 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -185,6 +185,9 @@ TEST_FILES += run_vmtests.sh
 # required by charge_reserved_hugetlb.sh
 TEST_FILES += write_hugetlb_memory.sh
 
+TEST_GEN_PROGS += nommu_mmap_test
+TEST_GEN_PROGS += nommu_mremap_test
+
 include ../lib.mk
 
 $(TEST_GEN_PROGS): vm_util.c hugepage_settings.c
diff --git a/tools/testing/selftests/mm/nommu_mmap_test.c b/tools/testing/selftests/mm/nommu_mmap_test.c
new file mode 100644
index 000000000000..50ce385967f4
--- /dev/null
+++ b/tools/testing/selftests/mm/nommu_mmap_test.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <limits.h>
+#include "../kselftest.h"
+
+#include <sys/vfs.h>
+#ifndef RAMFS_MAGIC
+#define RAMFS_MAGIC 0x858458f6
+#endif
+
+#ifndef MAP_UNINITIALIZED
+#define MAP_UNINITIALIZED 0x4000000
+#endif
+
+static size_t ps;
+
+struct test_case_t {
+	const char *name;
+	const char *pathname;
+	int open_flags;
+	int mmap_prot;
+	int mmap_flags;
+	int exp_err;
+	int (*resolve_exp_err)(const char *path);
+};
+
+static int get_shm_expected_error(const char *path)
+{
+	struct statfs fs;
+
+	if (statfs(path, &fs) == 0) {
+		if (fs.f_type == RAMFS_MAGIC)
+			return 0; /* ramfs succeed with contiguous memory */
+	}
+	 /* hostfs, etc returns ENODEV due to lack of contiguous allocation */
+	return ENODEV;
+}
+
+static struct test_case_t test_cases[] = {
+	{
+		"Anonymous private allocation",
+		NULL,
+		O_CREAT | O_RDWR | O_EXCL,
+		PROT_READ | PROT_WRITE,
+		MAP_ANONYMOUS | MAP_PRIVATE,
+		0,
+		NULL,
+	},
+	{
+		"Non-anonymous private file mapping (rw-)",
+		"/tmp/ksft.nommu-reg-XXXXXX",
+		O_CREAT | O_RDWR | O_EXCL,
+		PROT_READ | PROT_WRITE,
+		MAP_PRIVATE,
+		0,
+		0,
+	},
+	{
+		"Non-anonymous private file mapping (r--)",
+		"/tmp/ksft.nommu-reg-XXXXXX",
+		O_CREAT | O_RDWR | O_EXCL,
+		PROT_READ,
+		MAP_PRIVATE,
+		0,
+		0,
+	},
+	{
+		"Non-anonymous shared file mapping (rw-)",
+		"/tmp/ksft.nommu-shm-XXXXXX",
+		O_CREAT | O_RDWR | O_EXCL,
+		PROT_READ | PROT_WRITE,
+		MAP_SHARED,
+		0,
+#ifdef CONFIG_NOMMU
+		get_shm_expected_error,
+#else
+		0,
+#endif
+	},
+	{
+		"Non-anonymous shared file mapping (r--)",
+		"/tmp/ksft.nommu-shm-XXXXXX",
+		O_CREAT | O_RDWR | O_EXCL,
+		PROT_READ,
+		MAP_SHARED,
+		0,
+#ifdef CONFIG_NOMMU
+		get_shm_expected_error,
+#else
+		0,
+#endif
+	},
+	{
+		"Memory-backed private storage via /dev/zero",
+		"/dev/zero",
+		O_RDONLY,
+		PROT_READ,
+		MAP_PRIVATE,
+		0,
+		NULL,
+	},
+	{
+		"Memory-backed storage via /dev/zero (MAP_SHARED)",
+		"/dev/zero",
+		O_RDONLY,
+		PROT_READ,
+		MAP_SHARED,
+#ifdef CONFIG_NOMMU
+		ENODEV,
+#else
+		0,
+#endif
+		NULL,
+	},
+	{
+		"Block device volatile node mapping",
+		"/dev/loop0",
+		O_RDWR,
+		PROT_READ | PROT_WRITE,
+		MAP_PRIVATE,
+		0,
+		NULL,
+	}
+};
+
+static int run_mapping_matrix_test(struct test_case_t *tcase)
+{
+	int fd;
+	void *ptr;
+	char path_buf[PATH_MAX];
+	int rc = KSFT_PASS;
+	int expected_error;
+
+	ksft_print_msg("[RUN] Testing: %s\n", tcase->name);
+
+	if (tcase->pathname == NULL) {
+		fd = -1;
+	} else if (strstr(tcase->pathname, "XXXXXX")) {
+		strncpy(path_buf, tcase->pathname, sizeof(path_buf) - 1);
+		path_buf[sizeof(path_buf) - 1] = '\0';
+		fd = mkstemp(path_buf);
+		if (fd < 0) {
+			ksft_test_result_skip("Failed to setup temp node: %s\n",
+					      tcase->pathname);
+			return KSFT_SKIP;
+		}
+		if (ftruncate(fd, ps) != 0) {
+			ksft_test_result_fail("ftruncate failed for: %s\n",
+					      tcase->pathname);
+			close(fd);
+			unlink(path_buf);
+			return KSFT_FAIL;
+		}
+	} else {
+		fd = open(tcase->pathname, tcase->open_flags, 0600);
+		if (fd < 0) {
+			ksft_test_result_skip("Device node not accessible: %s\n",
+				       tcase->pathname);
+			return KSFT_SKIP;
+		}
+	}
+
+	expected_error = tcase->exp_err;
+	if (tcase->resolve_exp_err && fd >= 0)
+		expected_error = tcase->resolve_exp_err(path_buf);
+
+	ptr = mmap(NULL, ps, tcase->mmap_prot, tcase->mmap_flags, fd, 0);
+
+	if (expected_error != 0) {
+		if (ptr != MAP_FAILED) {
+			ksft_test_result_fail("%s: mmap unexpectedly succeeded (exp error %d)\n",
+					      tcase->name, expected_error);
+			munmap(ptr, ps);
+			rc = KSFT_FAIL;
+			goto cleanup;
+		}
+		if (errno != expected_error) {
+			ksft_test_result_fail("%s: mmap failed with %d (%s), but expected %d\n",
+					      tcase->name, errno, strerror(errno), expected_error);
+			rc = KSFT_FAIL;
+			goto cleanup;
+		}
+		ksft_test_result_pass("%s: Correctly rejected with expected error %s(%d)\n",
+				      tcase->name, strerror(expected_error), expected_error);
+		rc = KSFT_PASS;
+		goto cleanup;
+	}
+
+	if (ptr == MAP_FAILED) {
+		ksft_test_result_fail("%s: mmap failed unexpectedly: %s\n",
+				      tcase->name, strerror(errno));
+		rc = KSFT_FAIL;
+		goto cleanup;
+	}
+
+	ksft_test_result_pass("%s: mmap validation successfully passed\n", tcase->name);
+	munmap(ptr, ps);
+
+cleanup:
+	if (fd >= 0) {
+		close(fd);
+		if (tcase->pathname && strstr(tcase->pathname, "XXXXXX"))
+			unlink(path_buf);
+	}
+	return rc;
+}
+
+static int test_map_fixed(void)
+{
+	void *ptr = mmap((void *)(ps * 100), ps, PROT_READ | PROT_WRITE,
+			 MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
+
+	ksft_print_msg("[RUN] Testing MAP_FIXED behavior\n");
+
+#ifdef CONFIG_NOMMU
+	if (ptr == MAP_FAILED && (errno == ENODEV || errno == EINVAL)) {
+		ksft_test_result_pass("MAP_FIXED correctly rejected under nommu\n");
+		return KSFT_PASS;
+	}
+	if (ptr != MAP_FAILED) {
+		ksft_test_result_fail("MAP_FIXED unexpectedly allowed under nommu\n");
+		munmap(ptr, ps);
+		return KSFT_FAIL;
+	}
+	ksft_test_result_fail("MAP_FIXED failed under NOMMU: %s\n",
+			      strerror(errno));
+	return KSFT_FAIL;
+#else
+	if (ptr != MAP_FAILED) {
+		ksft_test_result_pass("MAP_FIXED successfully allocated under MMU\n");
+		munmap(ptr, ps);
+		return KSFT_PASS;
+	}
+	ksft_test_result_fail("MAP_FIXED failed allocation under MMU\n");
+	return KSFT_FAIL;
+#endif
+}
+
+static int test_uninit(void)
+{
+	void *ptr = mmap(NULL, ps, PROT_READ | PROT_WRITE,
+			 MAP_PRIVATE | MAP_ANONYMOUS | MAP_UNINITIALIZED, -1, 0);
+
+	ksft_print_msg("[RUN] Testing MAP_UNINITIALIZED behavior\n");
+
+	if (ptr == MAP_FAILED) {
+		ksft_test_result_skip("MAP_UNINITIALIZED not supported by kernel config\n");
+		return KSFT_SKIP;
+	}
+
+	ksft_test_result_pass("MAP_UNINITIALIZED allocation successful\n");
+	munmap(ptr, ps);
+	return KSFT_PASS;
+}
+
+int main(int argc, char **argv)
+{
+	int result = KSFT_PASS;
+	int i, rc;
+
+	ps = sysconf(_SC_PAGESIZE);
+	ksft_print_header();
+	ksft_set_plan(ARRAY_SIZE(test_cases) + 2);
+
+#ifdef CONFIG_NOMMU
+	ksft_print_msg("Running strict MMAP test criteria under nommu architecture\n");
+#else
+	ksft_print_msg("Running MMAP test criteria under MMU architecture\n");
+#endif
+
+	if (test_map_fixed() == KSFT_FAIL)
+		result = KSFT_FAIL;
+
+	if (test_uninit() == KSFT_FAIL)
+		result = KSFT_FAIL;
+
+	for (i = 0; i < (int)ARRAY_SIZE(test_cases); i++) {
+		rc = run_mapping_matrix_test(&test_cases[i]);
+		if (rc == KSFT_FAIL)
+			result = KSFT_FAIL;
+	}
+
+	if (result == KSFT_PASS)
+		ksft_finished();
+
+	ksft_exit_fail();
+}
diff --git a/tools/testing/selftests/mm/nommu_mremap_test.c b/tools/testing/selftests/mm/nommu_mremap_test.c
new file mode 100644
index 000000000000..b1b8a4e64b55
--- /dev/null
+++ b/tools/testing/selftests/mm/nommu_mremap_test.c
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <limits.h>
+#include "../kselftest.h"
+
+#include <sys/vfs.h>
+#ifndef RAMFS_MAGIC
+#define RAMFS_MAGIC 0x858458f6
+#endif
+
+static size_t ps;
+
+static long get_fs_type(const char *path)
+{
+	struct statfs fs;
+
+	if (statfs(path, &fs) == 0)
+		return fs.f_type;
+
+	return 0;
+}
+
+/* return original value if succeed */
+static int set_nr_trim_pages(const char *value)
+{
+	int fd, orig_value;
+	ssize_t len, written, read_len;
+	char orig_buf[32];
+
+	fd = open("/proc/sys/vm/nr_trim_pages", O_RDWR);
+	if (fd < 0)
+		return -errno;
+
+	read_len = read(fd, orig_buf, sizeof(orig_buf) - 1);
+	if (read_len < 0) {
+		close(fd);
+		return -errno;
+	}
+	if (read_len == 0) {
+		close(fd);
+		return -EIO;
+	}
+
+	orig_buf[read_len] = '\0';
+	orig_value = atoi(orig_buf);
+
+	if (lseek(fd, 0, SEEK_SET) < 0) {
+		close(fd);
+		return -errno;
+	}
+
+	len = strlen(value);
+	written = write(fd, value, len);
+	close(fd);
+
+	if (written != len)
+		return written < 0 ? -errno : -EIO;
+
+	return orig_value >= 0 ? orig_value : -EINVAL;
+}
+
+static void munmap_shrink_test(void)
+{
+	void *addr;
+
+	/* munmap shrink test */
+	for (int i = 0; i < 4; i++) {
+		addr = mmap(NULL, ps * 4, PROT_READ | PROT_WRITE,
+			    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+		if (addr == MAP_FAILED) {
+			ksft_test_result_fail("mmap failed: %s(%d)\n", strerror(errno), errno);
+			return;
+		}
+		if (munmap(addr + ps * i, ps) != 0) {
+			ksft_test_result_fail("memory %p isn't unmapped at %p\n",
+					      addr, addr + ps * i);
+			for (int j = 0; j < 4; j++)
+				munmap((char *)addr + j * ps, ps);
+			return;
+		}
+
+		if (i == 0) {
+			if (munmap(addr +  ps, ps * 3))
+				goto error;
+		} else if (i == 1) {
+			if (munmap(addr, ps) || munmap(addr + (ps * 2), ps * 2))
+				goto error;
+		} else if (i == 2) {
+			if (munmap(addr, ps * 2) || munmap(addr + (ps * 3), ps))
+				goto error;
+		} else if (i == 3) {
+			if (munmap(addr, ps * 3))
+				goto error;
+		}
+	}
+
+	ksft_test_result_pass("%s success\n", __func__);
+	return;
+error:
+	for (int j = 0; j < 4; j++)
+		munmap((char *)addr + j * ps, ps);
+	ksft_test_result_fail("%s clean up failures\n", __func__);
+}
+
+static size_t page_align(size_t len)
+{
+	return (len + ps - 1) / ps * ps;
+}
+
+static void mremap_shrink_test(void)
+{
+	void *addr, *addr2;
+	size_t current_len;
+	size_t old_len, new_len;
+	struct param {
+		size_t old;
+		size_t new;
+	} params[] = {
+		/* should not happen any shrink */
+		{ .old = ps * 4 - 1, .new = ps * 4 - 2 },
+		/* should not happen any shrink */
+		{ .old = ps * 4 - 1, .new = ps * 4 },
+		{ .old = ps * 4, .new = ps * 2 },
+		/* should not happen any shrink */
+		{ .old = ps * 2, .new = ps * 2 - 2 },
+		{ .old = ps * 2 - 2, .new = ps * 1 },
+	};
+
+	/* mremap shrink test */
+	current_len = page_align(ps * 4 - 1);
+	addr = mmap(NULL, ps * 4 - 1, PROT_READ | PROT_WRITE,
+		    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (addr == MAP_FAILED) {
+		ksft_test_result_fail("mmap failed: %s(%d)\n", strerror(errno), errno);
+		return;
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(params); i++) {
+		old_len = page_align(params[i].old);
+		new_len = page_align(params[i].new);
+		addr2 = mremap(addr, old_len, new_len, MREMAP_MAYMOVE);
+		if (addr2 == MAP_FAILED) {
+			ksft_test_result_fail("memory %p isn't remapped at %p\n", addr, addr2);
+			munmap(addr, old_len);
+			return;
+		}
+
+		addr = addr2;
+		current_len = new_len;
+	}
+
+	if (munmap(addr, current_len)) {
+		ksft_test_result_fail("%s cleanup failed: %s\n",
+				      __func__, strerror(errno));
+		return;
+	}
+	ksft_test_result_pass("%s success\n", __func__);
+}
+
+static void zero_middle_munmap_test(void)
+{
+	int fd = -1;
+	void *addr = MAP_FAILED;
+	void *addr2 = MAP_FAILED;
+	int left_mapped = 0;
+	int right_mapped = 0;
+	int ret;
+	bool addr2_middle_unmapped = false;
+
+	ksft_print_msg("[RUN] Testing middle munmap of private /dev/zero mappings\n");
+
+	fd = open("/dev/zero", O_RDONLY);
+	if (fd < 0) {
+		ksft_test_result_skip("Unable to open /dev/zero: %s\n",
+				      strerror(errno));
+		return;
+	}
+
+	addr = mmap(NULL, ps * 3, PROT_READ | PROT_WRITE,
+		    MAP_PRIVATE, fd, 0);
+	close(fd);
+	fd = -1;
+	if (addr == MAP_FAILED) {
+		ksft_test_result_fail("Initial /dev/zero mmap failed: %s\n",
+				      strerror(errno));
+		return;
+	}
+
+	left_mapped = 1;
+	right_mapped = 1;
+
+	/*
+	 * Split one private /dev/zero VMA in the middle. On nommu, the
+	 * VMA still has vm_file set even though it is semantically
+	 * anonymous.
+	 */
+	ret = munmap((char *)addr + ps, ps);
+	if (ret) {
+		ksft_test_result_fail("Middle munmap failed: %s\n",
+				      strerror(errno));
+		munmap(addr, ps * 3);
+		left_mapped = 0;
+		right_mapped = 0;
+		goto out;
+	}
+
+	/*
+	 * Access both remaining VMAs so a stale VMA interval cannot remain
+	 * hidden behind the unmapped hole.
+	 */
+	((volatile unsigned char *)addr)[0] = 0x5a;
+	((volatile unsigned char *)addr + 2 * ps)[0] = 0xa5;
+
+	/*
+	 * Repeat the operation on another mapping of the same inode. This
+	 * exercises insertion and removal in /dev/zero's i_mmap interval
+	 * tree after the first split.
+	 */
+	fd = open("/dev/zero", O_RDONLY);
+	if (fd < 0) {
+		ksft_test_result_fail("Reopening /dev/zero failed: %s\n",
+				      strerror(errno));
+		goto out;
+	}
+
+	addr2 = mmap(NULL, ps * 3, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE, fd, 0);
+	close(fd);
+	fd = -1;
+	if (addr2 == MAP_FAILED) {
+		ksft_test_result_fail("Second /dev/zero mmap failed: %s\n",
+				      strerror(errno));
+		goto out;
+	}
+
+	ret = munmap((char *)addr2 + ps, ps);
+	if (ret) {
+		ksft_test_result_fail("Second middle munmap failed: %s\n",
+				      strerror(errno));
+		goto out;
+	}
+	addr2_middle_unmapped = true;
+
+	if (munmap(addr, ps)) {
+		ksft_test_result_fail("Left VMA munmap failed: %s\n",
+				      strerror(errno));
+		goto out;
+	}
+	left_mapped = 0;
+
+	if (munmap((char *)addr + 2 * ps, ps)) {
+		ksft_test_result_fail("Right VMA munmap failed: %s\n",
+				      strerror(errno));
+		goto out;
+	}
+	right_mapped = 0;
+
+	if (munmap(addr2, ps)) {
+		ksft_test_result_fail("Second left VMA munmap failed: %s\n",
+				      strerror(errno));
+		goto out;
+	}
+
+	if (munmap((char *)addr2 + 2 * ps, ps)) {
+		ksft_test_result_fail("Second right VMA munmap failed: %s\n",
+				      strerror(errno));
+		goto out;
+	}
+	addr2 = MAP_FAILED;
+
+	ksft_test_result_pass("%s success\n", __func__);
+
+out:
+	if (fd >= 0)
+		close(fd);
+	if (left_mapped)
+		munmap(addr, ps);
+	if (right_mapped)
+		munmap((char *)addr + 2 * ps, ps);
+	if (addr2 != MAP_FAILED) {
+		if (addr2_middle_unmapped) {
+			munmap(addr2, ps);
+			munmap((char *)addr2 + 2 * ps, ps);
+		} else {
+			/* The middle munmap failed, so all three pages remain mapped. */
+			munmap(addr2, ps * 3);
+		}
+	}
+}
+
+static int get_shared_writable_file_expected_error(const char *path)
+{
+	if (get_fs_type(path) == RAMFS_MAGIC)
+		return EPERM; /* ramfs failed */
+
+	return 0;
+}
+
+static int pre_conf_trim_page(void)
+{
+	return set_nr_trim_pages("0\n");
+}
+
+static int post_conf_trim_page(int value)
+{
+	char buf[32];
+
+	if (snprintf(buf, sizeof(buf), "%d\n", value) < 0)
+		return -EIO;
+
+	return set_nr_trim_pages(buf);
+}
+
+struct mremap_case_t {
+	const char *name;
+	const char *pathname;
+	int open_flags;
+	int mmap_prot;
+	int mmap_flags;
+	int exp_err;
+	int (*resolve_exp_err)(const char *path);
+	unsigned int old_pages;
+	unsigned int new_pages;
+	int (*pre_hook)(void);
+	int (*post_hook)(int value);
+};
+
+static struct mremap_case_t mremap_cases[] = {
+	{
+		.name = "anonymous shrink (r--)",
+		.pathname = NULL,
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ,
+		.mmap_flags = MAP_ANONYMOUS | MAP_PRIVATE,
+		.exp_err = 0,
+		.resolve_exp_err = 0,
+	},
+	{
+		.name = "shared file shrink (r--)",
+		.pathname = "/tmp/ksft.nommu-remap-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ,
+		.mmap_flags = MAP_SHARED,
+		.exp_err = 0,
+#ifdef CONFIG_NOMMU
+		.resolve_exp_err = get_shared_writable_file_expected_error,
+#else
+		.resolve_exp_err = 0,
+#endif
+	},
+	{
+		.name = "zero device shrink (r--)",
+		.pathname = "/dev/zero",
+		.open_flags = O_RDONLY,
+		.mmap_prot = PROT_READ,
+		.mmap_flags = MAP_PRIVATE,
+		.exp_err = 0,
+		.resolve_exp_err = 0,
+	},
+	{
+		.name = "private file unchanged length (r-)",
+		.pathname = "/tmp/ksft.nommu-remap-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ,
+		.mmap_flags = MAP_PRIVATE,
+#ifdef CONFIG_NOMMU
+		.exp_err = EPERM,
+#else
+		.exp_err = 0,
+#endif
+		.resolve_exp_err = 0,
+		.old_pages = 4,
+		.new_pages = 4,
+	},
+	{
+		.name = "private file unchanged length (rw-)",
+		.pathname = "/tmp/ksft.nommu-remap-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ | PROT_WRITE,
+		.mmap_flags = MAP_PRIVATE,
+		.exp_err = 0,
+		.resolve_exp_err = 0,
+		.old_pages = 4,
+		.new_pages = 4,
+	},
+	{
+		.name = "private file growth (r-)",
+		.pathname = "/tmp/ksft.nommu-remap-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ,
+		.mmap_flags = MAP_PRIVATE,
+#ifdef CONFIG_NOMMU
+		.exp_err = EPERM,
+#else
+		.exp_err = 0,
+#endif
+		.resolve_exp_err = 0,
+		.old_pages = 4,
+		.new_pages = 8,
+	},
+	{
+		.name = "private file growth with reserved capacity (rw-)",
+		.pathname = "/tmp/ksft.nommu-remap-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ | PROT_WRITE,
+		.mmap_flags = MAP_PRIVATE,
+		.exp_err = 0,
+		.resolve_exp_err = 0,
+		.old_pages = 3,
+		.new_pages = 4,
+#ifdef CONFIG_NOMMU
+		.pre_hook = pre_conf_trim_page,
+		.post_hook = post_conf_trim_page,
+#endif
+	},
+	{
+		.name = "private file growth (rw-)",
+		.pathname = "/tmp/ksft.nommu-remap-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ | PROT_WRITE,
+		.mmap_flags = MAP_PRIVATE,
+#ifdef CONFIG_NOMMU
+		.exp_err = ENOMEM,
+#else
+		.exp_err = 0,
+#endif
+		.resolve_exp_err = 0,
+		.old_pages = 4,
+		.new_pages = 8,
+	},
+};
+
+static int run_mremap_test(struct mremap_case_t *tcase)
+{
+	int fd = -1;
+	void *addr, *addr2;
+	char pb[PATH_MAX];
+	int rc = KSFT_PASS;
+	int expected_error;
+	unsigned int old_pages = tcase->old_pages ?: 4;
+	unsigned int new_pages = tcase->new_pages ?: 2;
+	unsigned int file_pages = old_pages > new_pages ?
+				  old_pages : new_pages;
+	int orig_nr_trip_pages = -1;
+
+	ksft_print_msg("[RUN] Testing mremap: %s\n", tcase->name);
+
+	if (tcase->pathname && strstr(tcase->pathname, "XXXXXX")) {
+		strncpy(pb, tcase->pathname, sizeof(pb) - 1);
+		pb[sizeof(pb) - 1] = '\0';
+		fd = mkstemp(pb);
+		if (fd < 0) {
+			ksft_test_result_skip("Failed to setup file backing\n");
+			return KSFT_SKIP;
+		}
+		if (ftruncate(fd, ps * file_pages) != 0) {
+			ksft_test_result_fail("Failed to setup file backing\n");
+			close(fd);
+			unlink(pb);
+			return KSFT_FAIL;
+		}
+
+		if ((tcase->mmap_flags & MAP_SHARED) && get_fs_type(pb) != RAMFS_MAGIC) {
+			ksft_test_result_skip("Skip the test under non-ramfs filesystem (%s)\n",
+					      pb);
+			close(fd);
+			unlink(pb);
+			return KSFT_SKIP;
+		}
+	} else if (tcase->pathname) {
+		fd = open(tcase->pathname, tcase->open_flags, 0600);
+		if (fd < 0) {
+			ksft_test_result_skip("Backing node not accessible\n");
+			return KSFT_SKIP;
+		}
+
+		if ((tcase->mmap_flags & MAP_SHARED) &&
+		    get_fs_type(tcase->pathname) != RAMFS_MAGIC) {
+			ksft_test_result_skip("Skip the test under non-ramfs filesystem (%s)\n",
+					      tcase->pathname);
+			close(fd);
+			return KSFT_SKIP;
+		}
+	}
+
+	if (tcase->pre_hook) {
+		orig_nr_trip_pages = tcase->pre_hook();
+		if (orig_nr_trip_pages < 0) {
+			ksft_print_msg("pre-hook failed %s(%d)\n",
+					    strerror(errno), errno);
+			rc = KSFT_FAIL;
+			goto out;
+		}
+	}
+
+	addr = mmap(NULL, ps * old_pages, tcase->mmap_prot,
+		    tcase->mmap_flags, fd, 0);
+	if (addr == MAP_FAILED) {
+		ksft_print_msg("mmap mapping failed %s(%d)\n", strerror(errno), errno);
+		rc = KSFT_FAIL;
+		goto out;
+	}
+
+	expected_error = tcase->exp_err;
+	if (tcase->resolve_exp_err && fd >= 0)
+		expected_error = tcase->resolve_exp_err(pb);
+
+	addr2 = mremap(addr, ps * old_pages, ps * new_pages,
+		       MREMAP_MAYMOVE);
+
+	if (expected_error != 0) {
+		if (addr2 != MAP_FAILED || errno != expected_error) {
+			ksft_print_msg("Expected error %d, got %s(%d)\n",
+				       expected_error, strerror(errno), errno);
+			rc = KSFT_FAIL;
+		} else {
+			ksft_print_msg("%s/%s: Handled expected error path (errno=%d)\n",
+				       __func__, tcase->name, expected_error);
+		}
+	} else if (addr2 == MAP_FAILED) {
+		ksft_print_msg("mremap shrink failed unexpectedly: %s\n",
+			       strerror(errno));
+		rc = KSFT_FAIL;
+	} else {
+		ksft_print_msg("%s/%s step successful\n", __func__, tcase->name);
+	}
+
+	/* clean up */
+	if (munmap(addr2 == MAP_FAILED ? addr : addr2,
+		   addr2 == MAP_FAILED ? ps * old_pages : ps * new_pages)) {
+		ksft_print_msg("munmap failed: %s\n", strerror(errno));
+		rc = KSFT_FAIL;
+	}
+
+out:
+	if (fd >= 0) {
+		close(fd);
+		if (tcase->pathname && strstr(tcase->pathname, "XXXXXX"))
+			unlink(pb);
+	}
+
+	if (tcase->post_hook) {
+		if (tcase->post_hook(orig_nr_trip_pages) < 0) {
+			ksft_print_msg("post-hook failed %s(%d)\n",
+				       strerror(errno), errno);
+			rc = KSFT_FAIL;
+		}
+	}
+
+	ksft_test_result_report(rc, "%s:%s\n", __func__, tcase->name);
+	return rc;
+}
+
+int main(int argc, char **argv)
+{
+	int res = KSFT_PASS;
+	int i;
+
+	ps = sysconf(_SC_PAGESIZE);
+	ksft_print_header();
+	ksft_set_plan(ARRAY_SIZE(mremap_cases) + 3);
+
+	munmap_shrink_test();
+	mremap_shrink_test();
+	zero_middle_munmap_test();
+
+	for (i = 0; i < (int)ARRAY_SIZE(mremap_cases); i++) {
+		if (run_mremap_test(&mremap_cases[i]) == KSFT_FAIL)
+			res = KSFT_FAIL;
+	}
+
+	if (res == KSFT_PASS)
+		ksft_finished();
+
+	ksft_exit_fail();
+}
-- 
2.43.0


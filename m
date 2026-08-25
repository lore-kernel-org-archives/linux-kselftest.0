Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F7038AC90
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 01:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787623201; cv=none; b=nvXfU41j5Hny3DRbcS4oVtqoYkNtRgsFxLPCOrFGwxXffbjt+KjHuQmqwBAtJsJ4g9lnt9Ls7iNXdcxE/KVm8/Yyc+KxOI6AE3AaRWKyDlHeydY/pe3ytDTe0b7hl6qoo4EJAIHfZH/lwEQS254S3xNgohJq6vDA9oqbnojIfWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787623201; c=relaxed/simple;
	bh=YySa5dNQMqAZcNowMhL8NiVql2CRGAkNLuQnIwHoVyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MoQGke97mfcYP5jw3VfPtsXPoP0Ah/epCuZROIpCG/cFdnB38nCykEx2eassxhNUEUO55CC0p0YHy1bvlH88qb8Y5ys4P0iDfkkLeDGyQlI4mn6xq3S145hT95KumHig7XLqYT67p9PcvAXpvM27ulyNkksAEWhXhdlMkC5sJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rsWzGQQY; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rsWzGQQY"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-395ea741d07so2027316a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 18:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787623197; x=1788227997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvm7PLfF2XlXIxexfSNwawshBPBpAGZ6EXoOYWillHo=;
        b=rsWzGQQYC0YQRx53CoiIHxSEZc/YAM+r8E+COTCDnUl8qys6AD/Tr3Oe86F/WFZGwA
         oyw51v97tVDdnZ+lSThMiDage9cL1iU9jsWDab3dKucwqDoj8WVlJn/AbRzoN6ZLJpuH
         g0O75XUdQu47lATsgbl56kbfwLuIHgdWIZX6uY1vkbXL623ZA2laPwhv9IEPxYOK7AoW
         Q8tmKnkYRHcp2pdteU2gbw5fWrgbOi5CZmsD4E+bB4kr6qHdMOx9t3pbBWPLt8R+ZqqV
         AaIOvD09TdIigaoWJ4aLnIHkVzbHHZXSRAIa3WbdUB5qh4TrKXiVfbroRZq8MkKIc2DY
         oG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787623197; x=1788227997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvm7PLfF2XlXIxexfSNwawshBPBpAGZ6EXoOYWillHo=;
        b=fK2TVfGixsMSWkcTYvHNG8dM5AraUiIXWoKgmN3aQV6mPvQ6olyRUR33V6Q0jaFe9o
         2nQTUtzxlnDUKp8I/ipOe9ymBeqWjC/fHwTE15EQqrURxqRXPfrtQzSxOmVNi1ILl703
         VTL/nQoNN6NCgNCRbrvaVmeYjDOYV7vxEg3L7dC7dXGkqNrtfLhS0YkTmIHsJ6V9yFsx
         0PqgmUb6m0//3+z3JlMTNKV/mDuqy5tO9vhQhVSmiO/bRdiN1CLc/o0QuaXRqVH7EejC
         xq4db3NWq91CgrUig5oyS7oy59KeMYJKZeXHX7TJphwQfFrdFk7XlGgc09TrBclEYZlO
         xbTg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5TGBYbGfrchv4mvmGUoo1OobbKXZVPF8xXqohFTgabOrpvBr+6YwGTMltkXjQoHc+kYEbA2gDiqNSWSa2QpE=@vger.kernel.org
X-Gm-Message-State: AFuF++nR+20/FpHnVdi9UcoNydtrXNNk7IA9rtfYLVKWM8F0nTG4miIu
	/ow3Uiyy0GoPSrFkbk58B0445F1hNZ9Gaj8sGB4hMw+xSTwBFiVY5eu6
X-Gm-Gg: AR+sD11ytZNbhwm58YubVfFbyq2jORnXsK7La9NQp6JFEZg2MOlbRawOe47QPocR/hF
	TIdHRn8/a6cixyfdm0xkVyYK+zZlbS6+uoCNUcmq9wcdyYeZv0pGhwQA8hsrLo8hdjiW2UzEbgT
	xLOO81gGKzTc4/UC3j5PVK90Rsoca+TN0upMOwgFPMXCtpfoPJT14nxjaAjMK6d9c/V7LSvDnYl
	zYkDDgcDJeNUrWSwp8wYy+mZ4uUzbcgVD3NZcLbyaO/wPil9S33kS1TtPe3q9f7Glt62+CGndCJ
	pWzD2LXezy3TB/SdVVvRODhhPac0gUD7IvStVjPxome8QgSNqpR/B6sI5yDF/I9hYf8iODVPCyD
	XhmtcKN9JeOoz59fhwLq0mIkv+CbmuyhU1Fi48mP1STY9UOBAoVJkeWsZdlGOhCGOOFgLpXn25R
	NhJzu9c3FDvdtzDDzBFMzvQMcWy9F680DXEwFblHO1HdbtNC9YcfGnOuKHbu++hRk0AOaGfnuXC
	S5U1WABeE0MeIkTdwX+Sj8RXMKRyZBzNf4yUv37Om8X8karzPLKVXYHVRTSD+yKOQ==
X-Received: by 2002:a17:90b:1a90:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-395c33a0168mr43913932a91.5.1787623197223;
        Mon, 24 Aug 2026 18:59:57 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b08ca0sm1725131a91.2.2026.08.24.18.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 18:59:56 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id BACB915C677E; Tue, 25 Aug 2026 10:59:55 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Cc: geert@linux-m68k.org,
	daniel@thingy.jp,
	Hajime Tazaki <thehajime@gmail.com>
Subject: [PATCH v2 2/2] selftests/mm: add nommu mmap and mremap behavior tests
Date: Tue, 25 Aug 2026 10:59:45 +0900
Message-ID: <20260825015945.141739-3-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825015945.141739-1-thehajime@gmail.com>
References: <20260825015945.141739-1-thehajime@gmail.com>
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
3. Regular file mappings via standard filesystem storage.
4. Block device subsystem mappings (gracefully skipping if node is
   missing).
5. Shared vs Private backing discrepancies under nommu conditions.
6. mremap limits, ensuring non-expandable restrictions behave properly.

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

--

rfc => v2
- prepare a different TARGETS for tests (mm/nommu)
- drop shrink fix tests
- drop mmap /dev/zero tests

rfc:
- https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
---
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/mm/nommu/Makefile     |   7 +
 .../selftests/mm/nommu/nommu_mmap_test.c      | 265 +++++++++++++
 .../selftests/mm/nommu/nommu_mremap_test.c    | 353 ++++++++++++++++++
 4 files changed, 626 insertions(+)
 create mode 100644 tools/testing/selftests/mm/nommu/Makefile
 create mode 100644 tools/testing/selftests/mm/nommu/nommu_mmap_test.c
 create mode 100644 tools/testing/selftests/mm/nommu/nommu_mremap_test.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 2cc63e4134fb..940d2cab4f71 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -135,6 +135,7 @@ TARGETS += uevent
 TARGETS += user_events
 TARGETS += vDSO
 TARGETS += mm
+TARGETS += mm/nommu
 TARGETS += vfio
 TARGETS += x86
 TARGETS += x86/bugs
diff --git a/tools/testing/selftests/mm/nommu/Makefile b/tools/testing/selftests/mm/nommu/Makefile
new file mode 100644
index 000000000000..9e28be37bc8f
--- /dev/null
+++ b/tools/testing/selftests/mm/nommu/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for mm/nommu selftests
+
+TEST_GEN_PROGS += nommu_mmap_test
+TEST_GEN_PROGS += nommu_mremap_test
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/mm/nommu/nommu_mmap_test.c b/tools/testing/selftests/mm/nommu/nommu_mmap_test.c
new file mode 100644
index 000000000000..425ec425daad
--- /dev/null
+++ b/tools/testing/selftests/mm/nommu/nommu_mmap_test.c
@@ -0,0 +1,265 @@
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
+#include "kselftest.h"
+
+#include <sys/vfs.h>
+#ifndef RAMFS_MAGIC
+#define RAMFS_MAGIC 0x858458f6
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
+		.name = "anonymous private allocation",
+		.pathname = NULL,
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ | PROT_WRITE,
+		.mmap_flags = MAP_ANONYMOUS | MAP_PRIVATE,
+		.exp_err = 0,
+		.resolve_exp_err = NULL,
+	},
+	{
+		.name = "non-anonymous private file mapping (rw-)",
+		.pathname = "/tmp/ksft.nommu-reg-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ | PROT_WRITE,
+		.mmap_flags = MAP_PRIVATE,
+		.exp_err = 0,
+		.resolve_exp_err = NULL,
+	},
+	{
+		.name = "non-anonymous private file mapping (r--)",
+		.pathname = "/tmp/ksft.nommu-reg-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ,
+		.mmap_flags = MAP_PRIVATE,
+		.exp_err = 0,
+		.resolve_exp_err = NULL,
+	},
+	{
+		.name = "non-anonymous shared file mapping (rw-)",
+		.pathname = "/tmp/ksft.nommu-shm-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ | PROT_WRITE,
+		.mmap_flags = MAP_SHARED,
+		.exp_err = 0,
+#ifdef CONFIG_NOMMU
+		.resolve_exp_err = get_shm_expected_error,
+#else
+		.resolve_exp_err = NULL,
+#endif
+	},
+	{
+		.name = "non-anonymous shared file mapping (r--)",
+		.pathname = "/tmp/ksft.nommu-shm-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ,
+		.mmap_flags = MAP_SHARED,
+		.exp_err = 0,
+#ifdef CONFIG_NOMMU
+		.resolve_exp_err = get_shm_expected_error,
+#else
+		.resolve_exp_err = 0,
+#endif
+	},
+	{
+		.name = "block device volatile node mapping",
+		.pathname = "/dev/loop0",
+		.open_flags = O_RDWR,
+		.mmap_prot = PROT_READ | PROT_WRITE,
+		.mmap_flags = MAP_PRIVATE,
+		.exp_err = 0,
+		.resolve_exp_err = NULL,
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
+	void *fixed_addr;
+	void *ptr;
+
+	ksft_print_msg("[RUN] Testing MAP_FIXED behavior\n");
+
+	fixed_addr = mmap(NULL, ps, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (fixed_addr == MAP_FAILED) {
+		ksft_test_result_skip("Unable to reserve test address: %s\n",
+				strerror(errno));
+		return KSFT_SKIP;
+	}
+
+	if (munmap(fixed_addr, ps)) {
+		ksft_test_result_fail("Unable to release test address: %s\n",
+				strerror(errno));
+		return KSFT_FAIL;
+	}
+
+	ptr = mmap(fixed_addr, ps, PROT_READ | PROT_WRITE,
+		MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
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
+int main(int argc, char **argv)
+{
+	int result = KSFT_PASS;
+	int i, rc;
+
+	ps = sysconf(_SC_PAGESIZE);
+	ksft_print_header();
+	ksft_set_plan(ARRAY_SIZE(test_cases) + 1);
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
diff --git a/tools/testing/selftests/mm/nommu/nommu_mremap_test.c b/tools/testing/selftests/mm/nommu/nommu_mremap_test.c
new file mode 100644
index 000000000000..8d577d960b11
--- /dev/null
+++ b/tools/testing/selftests/mm/nommu/nommu_mremap_test.c
@@ -0,0 +1,353 @@
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
+#include "kselftest.h"
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
+static int get_shared_writable_file_expected_error(const char *path)
+{
+	if (get_fs_type(path) == RAMFS_MAGIC)
+		return EPERM; /* ramfs failed */
+
+	return 0;
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
+	int orig_nr_trim_pages = -1;
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
+	ksft_set_plan(ARRAY_SIZE(mremap_cases) + 2);
+
+	munmap_shrink_test();
+	mremap_shrink_test();
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


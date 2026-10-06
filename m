Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0C63C09FF
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791277021; cv=none; b=WsKq/HSekwhFtBCeCxhuY3PgMHjQxDk49JIbvGNeEAhD82Mzs7e7AC0SvdOxHfTfTJe1stp6CcvPNrVRzt103T/3vWOe9unaHnfVJPfTtw6PgykEBtRneKTQJz/jLRQXG4Z6eDLCX2Bggnt+ZpBTBqS0YiZbkzKrAYMX2/RloUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791277021; c=relaxed/simple;
	bh=KZzG4b1dNXS6ViLGE0LGejPU0mO5PoXcFahIsIgiFvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGqUp4hFKQRVoVxhEq4XJ8Ez955mchkjn153qImXW+6SAGLJePoZ7jZJL5cuBmByGIHLvrOMpHFnVfJBu+srBV0UF7rdSmyDYiF3C3qikyPJiIuLXPyOwPqZt79oCCqxVs5o8ii4XVaofhP8gMg60RgVE150C4WiG5hcOuejq7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNf85u6x; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNf85u6x"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso380211a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791277019; x=1791881819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLP+DlCrm4churEqgBK9zuXe3B/hfyGw8D6NXH49xTw=;
        b=GNf85u6x8/kLLoGJrlrbXdBMrO5fNnmZOefIbWVb4xG/RvMpLwCoXd95Ddf0KE0TyK
         JT7GctjoBcSXqF9oJo/9W7UH/UufS+m5/sPsm7LXGFjZ7p3jwMPSbUbClcDMhU950gw5
         ZAaYcLyls5d1hUScP8Sds3vI5ki28PRtsdqJUBvPX2ep7gBrHs1zcGw5hiTCx7FDrwf6
         ylhAp1+8mmqXHpG6LNnEwyl9+i6497HGS4EEpdq1fSvNl9CN3l5gvRoswvsL5ZB+x5vw
         DxcmIGdE8kgSmMZNG85q0SYGOUV14/P/RAmNbUxF5LvWOLVYyq7iEA3Wb8QH55yv19zD
         Y7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791277019; x=1791881819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZLP+DlCrm4churEqgBK9zuXe3B/hfyGw8D6NXH49xTw=;
        b=GfFc2s6uVmcci9po5kOL5IbPEPaaV0bFF2fOy+GUaQDCOAUkEJIUEQSGzEXYP5Vs/w
         hgLEVAOBRqi1YLY2XyRCouK/ttI0JbC/lwTvUnJbmB5pq85nXNK4HrNKAX9c42td49Bh
         AG5LSbvHwT4Zurn0qPkjvXtqSujN/sfxVRsQKGWFPV/LkZcp8grq2gfueW4Fh6D6AlXS
         HEVyDmu7acdl5bwN0DzMW5A4wSWbvjOYhdqlpaHm0GxdZnSG5V6QQF+OeMe/MuoawYax
         SEgjgTNtYed4YFikwab3swE5l8ZNi9526SFWEMsxudH8fERAdwsNZG6WC9RXMyImEW59
         Dp7Q==
X-Forwarded-Encrypted: i=1; AKwUvBytTYG+lVnzFnTZwneeTVgPOPWXWHlIonbl/cq+anBN2e4bFgwOqQseILylVNXdamUxDRDy97I89Bc06P6yOFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN8b/4PojQuI4h/i6XUJIgcsMjTzTTleDQ56Wf1tx2MdF2Ketq
	YMvoCDoQrRWL+NlDJfkYN5EZLOfurvXZSIfyeOpWCCtn7cn3pgB6MGdM
X-Gm-Gg: AYBFou0FGWPKnwoorWvUSzFUl4oyKyDwtQPQmnANn87sHb0TUqhQGO4+qDQJ3Y9FzUI
	MijCbO0QKSJrNWzqG6zlRPRoGrPV/0By1c11L7d2tYwtl0wUQ3epnkN6qCGP4AfLK7cyD2ehXUm
	R4YUjrQ8RBYLy3lSXCm4+MaExuVvQl3C4CdJISQGwBuOzP+CLWVH7pxq3+md3DBYtcCS5YzepZv
	a/KybV17aChM5LME8u3j4XPmEovdaL8jTcpu8Q3jXB+oDxhm0YhOl4w++FMLiG2BJ3Rpqv2+GI4
	z7oGxeLHIRx0Klz1ARLWlrb0J+kvud77ymjsoPgC1gNK9tJjkOj6PUQf7+VSM3TkdB8t9Ii1sWr
	XTwDVSVOl6nSHn8Qv1Cyv2rEOSomKEARJFxd7STvANFHTH5X3BHLuCkEbCPENtJx0J2LrJi5rGn
	8XVxDuMI7IYoMreYngo582RWkqtdEZ/AVAJ9WbRKpg71hFh0f/sGqjfalFLQiRU2uzG8uT596nI
	ki41vOH8lV7a+Lu/V5QJSbADelmco6hDbunvYU+06rSs03ZNAPfGJjDGY94T2HpjXY7g2HYww/u
	sL6GHe5gpKwj3XcrgIf+7CGzlPaK1dvZ8aEEEu3CO6X7+65CkD6uV15H/7M7JXL5+xvdOdRv
X-Received: by 2002:a17:90b:1a8a:b0:3a6:df74:c64 with SMTP id 98e67ed59e1d1-3a8736d49cemr333517a91.46.1791277018814;
        Tue, 06 Oct 2026 01:56:58 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85afe9ef9sm3141805a91.12.2026.10.06.01.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:56:58 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 0ED6916FBFD3; Tue,  6 Oct 2026 17:56:57 +0900 (JST)
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
Subject: [PATCH v5 2/2] selftests/nommu: add nommu mmap and mremap behavior tests
Date: Tue,  6 Oct 2026 17:56:42 +0900
Message-ID: <20261006085642.3852152-3-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006085642.3852152-1-thehajime@gmail.com>
References: <20261006085642.3852152-1-thehajime@gmail.com>
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
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260825015945.141739-1-thehajime@gmail.com
Assisted-by: Gemini:Pro [AI_Reviewer] [Sashiko_Linter]
Assisted-by: cubic.dev:unspecified
Signed-off-by: Hajime Tazaki <thehajime@gmail.com>

--

v4 => v5
- remove #ifdef NOMMU and use a global variable detected from /proc/meminfo

v3 => v4
- clean up messages

v2 => v3
- remove unnecessary modifications
- address Sashiko review

rfc => v2
- prepare a different TARGETS for tests (mm/nommu)
- drop shrink fix tests
- drop mmap /dev/zero tests
- https://lore.kernel.org/linux-mm/20260825015945.141739-3-thehajime@gmail.com/

rfc:
- https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
---
 tools/testing/selftests/nommu/Makefile        |   7 +
 tools/testing/selftests/nommu/nommu.h         |  33 ++
 .../testing/selftests/nommu/nommu_mmap_test.c | 264 +++++++++++++
 .../selftests/nommu/nommu_mremap_test.c       | 356 ++++++++++++++++++
 4 files changed, 660 insertions(+)
 create mode 100644 tools/testing/selftests/nommu/Makefile
 create mode 100644 tools/testing/selftests/nommu/nommu.h
 create mode 100644 tools/testing/selftests/nommu/nommu_mmap_test.c
 create mode 100644 tools/testing/selftests/nommu/nommu_mremap_test.c

diff --git a/tools/testing/selftests/nommu/Makefile b/tools/testing/selftests/nommu/Makefile
new file mode 100644
index 000000000..87bc3bbfa
--- /dev/null
+++ b/tools/testing/selftests/nommu/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for nommu selftests
+
+TEST_GEN_PROGS += nommu_mmap_test
+TEST_GEN_PROGS += nommu_mremap_test
+
+include ../lib.mk
diff --git a/tools/testing/selftests/nommu/nommu.h b/tools/testing/selftests/nommu/nommu.h
new file mode 100644
index 000000000..2c9a2f4e0
--- /dev/null
+++ b/tools/testing/selftests/nommu/nommu.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef NOMMU_H
+#define NOMMU_H
+
+#include <stdio.h>
+#include <string.h>
+
+/* Returns 1 for NOMMU, 0 for MMU, and -1 if /proc/meminfo is unavailable. */
+static inline int ksft_is_nommu(void)
+{
+	FILE *fp;
+	char line[256];
+	int nommu = 0;
+
+	fp = fopen("/proc/meminfo", "r");
+	if (!fp)
+		return -1;
+
+	while (fgets(line, sizeof(line), fp)) {
+		if (strncmp(line, "MmapCopy:", sizeof("MmapCopy:") - 1) == 0) {
+			nommu = 1;
+			break;
+		}
+	}
+
+	if (ferror(fp))
+		nommu = -1;
+	fclose(fp);
+
+	return nommu;
+}
+
+#endif
diff --git a/tools/testing/selftests/nommu/nommu_mmap_test.c b/tools/testing/selftests/nommu/nommu_mmap_test.c
new file mode 100644
index 000000000..2b3639cf7
--- /dev/null
+++ b/tools/testing/selftests/nommu/nommu_mmap_test.c
@@ -0,0 +1,264 @@
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
+#include "nommu.h"
+
+#include <sys/vfs.h>
+#ifndef RAMFS_MAGIC
+#define RAMFS_MAGIC 0x858458f6
+#endif
+
+static size_t ps;
+static int nommu;
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
+	if (!nommu)
+		return 0;
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
+		.resolve_exp_err = get_shm_expected_error,
+	},
+	{
+		.name = "non-anonymous shared file mapping (r--)",
+		.pathname = "/tmp/ksft.nommu-shm-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ,
+		.mmap_flags = MAP_SHARED,
+		.exp_err = 0,
+		.resolve_exp_err = get_shm_expected_error,
+	},
+};
+
+static int run_mapping_matrix_test(struct test_case_t *tcase)
+{
+	int fd;
+	void *ptr = MAP_FAILED;
+	char path_buf[PATH_MAX];
+	const char *path = tcase->pathname;
+	int rc = KSFT_PASS;
+	int expected_error;
+
+	ksft_print_msg("[RUN] %s\n", tcase->name);
+
+	if (tcase->pathname == NULL) {
+		fd = -1;
+	} else if (strstr(tcase->pathname, "XXXXXX")) {
+		strncpy(path_buf, tcase->pathname, sizeof(path_buf) - 1);
+		path_buf[sizeof(path_buf) - 1] = '\0';
+		fd = mkstemp(path_buf);
+		if (fd < 0) {
+			ksft_print_msg("Failed to setup temp node: %s\n",
+				tcase->pathname);
+			ksft_test_result_skip("%s\n", tcase->name);
+			return KSFT_SKIP;
+		}
+		if (ftruncate(fd, ps) != 0) {
+			ksft_print_msg("ftruncate failed for: %s\n", tcase->pathname);
+			rc = KSFT_FAIL;
+			goto cleanup;
+		}
+		path = path_buf;
+	} else {
+		fd = open(tcase->pathname, tcase->open_flags, 0600);
+		if (fd < 0) {
+			ksft_print_msg("Device node not accessible: %s\n",
+				       tcase->pathname);
+			ksft_test_result_skip("%s\n", tcase->name);
+			return KSFT_SKIP;
+		}
+	}
+
+	expected_error = tcase->exp_err;
+	if (tcase->resolve_exp_err && fd >= 0)
+		expected_error = tcase->resolve_exp_err(path);
+
+	ptr = mmap(NULL, ps, tcase->mmap_prot, tcase->mmap_flags, fd, 0);
+
+	if (expected_error != 0) {
+		if (ptr != MAP_FAILED) {
+			ksft_print_msg("mmap unexpectedly succeeded (exp error %d)\n",
+					      expected_error);
+			rc = KSFT_FAIL;
+			goto cleanup;
+		}
+		if (errno != expected_error) {
+			ksft_print_msg("mmap failed with %d (%s), but expected %d\n",
+				errno, strerror(errno), expected_error);
+			rc = KSFT_FAIL;
+			goto cleanup;
+		}
+		ksft_print_msg("Correctly rejected with expected error %s(%d)\n",
+			strerror(expected_error), expected_error);
+		rc = KSFT_PASS;
+		goto cleanup;
+	}
+
+	if (ptr == MAP_FAILED) {
+		ksft_print_msg("mmap failed unexpectedly: %s\n", strerror(errno));
+		rc = KSFT_FAIL;
+		goto cleanup;
+	}
+
+cleanup:
+	if (ptr != MAP_FAILED && munmap(ptr, ps)) {
+		ksft_print_msg("munmap failed: %s\n", strerror(errno));
+		rc = KSFT_FAIL;
+	}
+	if (fd >= 0) {
+		close(fd);
+		if (tcase->pathname && strstr(tcase->pathname, "XXXXXX") &&
+		    unlink(path_buf)) {
+			ksft_print_msg("unlink failed for %s: %s\n",
+				       path_buf, strerror(errno));
+			rc = KSFT_FAIL;
+		}
+	}
+	ksft_test_result_report(rc, "%s\n", tcase->name);
+	return rc;
+}
+
+static int test_map_fixed(void)
+{
+	void *fixed_addr;
+	void *ptr;
+
+	ksft_print_msg("[RUN] %s\n", __func__);
+
+	fixed_addr = mmap(NULL, ps, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (fixed_addr == MAP_FAILED) {
+		ksft_print_msg("Unable to reserve test address: %s\n",
+				strerror(errno));
+		ksft_test_result_skip("MAP_FIXED behavior\n");
+		return KSFT_SKIP;
+	}
+
+	if (munmap(fixed_addr, ps)) {
+		ksft_print_msg("Unable to release test address: %s\n",
+			strerror(errno));
+		ksft_test_result_fail("MAP_FIXED behavior\n");
+		return KSFT_FAIL;
+	}
+
+	ptr = mmap(fixed_addr, ps, PROT_READ | PROT_WRITE,
+		MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
+
+	if (nommu) {
+		if (ptr == MAP_FAILED && (errno == ENODEV || errno == EINVAL)) {
+			ksft_print_msg("MAP_FIXED correctly rejected under nommu\n");
+			ksft_test_result_pass("MAP_FIXED behavior\n");
+			return KSFT_PASS;
+		}
+		if (ptr != MAP_FAILED) {
+			ksft_print_msg("MAP_FIXED unexpectedly allowed under nommu\n");
+			ksft_test_result_fail("MAP_FIXED behavior\n");
+			if (munmap(ptr, ps))
+				ksft_print_msg("munmap failed: %s\n", strerror(errno));
+			return KSFT_FAIL;
+		}
+		ksft_print_msg("MAP_FIXED failed under NOMMU: %s\n",
+				      strerror(errno));
+		ksft_test_result_fail("MAP_FIXED behavior\n");
+		return KSFT_FAIL;
+	}
+	if (ptr != MAP_FAILED) {
+		ksft_print_msg("MAP_FIXED successfully allocated under MMU\n");
+		if (munmap(ptr, ps)) {
+			ksft_print_msg("munmap failed: %s\n", strerror(errno));
+			ksft_test_result_fail("MAP_FIXED behavior\n");
+			return KSFT_FAIL;
+		}
+		ksft_test_result_pass("MAP_FIXED behavior\n");
+		return KSFT_PASS;
+	}
+	ksft_print_msg("MAP_FIXED failed allocation under MMU\n");
+	ksft_test_result_fail("MAP_FIXED behavior\n");
+	return KSFT_FAIL;
+}
+
+int main(int argc, char **argv)
+{
+	int i;
+
+	nommu = ksft_is_nommu();
+	if (nommu < 0)
+		ksft_exit_skip("Cannot read /proc/meminfo; mount procfs at /proc\n");
+
+	ps = sysconf(_SC_PAGESIZE);
+	ksft_print_header();
+	ksft_set_plan(ARRAY_SIZE(test_cases) + 1);
+
+	if (nommu)
+		ksft_print_msg("Running strict MMAP test criteria under nommu architecture\n");
+	else
+		ksft_print_msg("Running MMAP test criteria under MMU architecture\n");
+
+	test_map_fixed();
+	for (i = 0; i < (int)ARRAY_SIZE(test_cases); i++)
+		run_mapping_matrix_test(&test_cases[i]);
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/nommu/nommu_mremap_test.c b/tools/testing/selftests/nommu/nommu_mremap_test.c
new file mode 100644
index 000000000..6ee89cb25
--- /dev/null
+++ b/tools/testing/selftests/nommu/nommu_mremap_test.c
@@ -0,0 +1,356 @@
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
+#include "nommu.h"
+
+#include <sys/vfs.h>
+#ifndef RAMFS_MAGIC
+#define RAMFS_MAGIC 0x858458f6
+#endif
+
+static size_t ps;
+static int nommu;
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
+	int ret;
+
+	/* munmap shrink test */
+	for (int i = 0; i < 4; i++) {
+		addr = mmap(NULL, ps * 4, PROT_READ | PROT_WRITE,
+			    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+		if (addr == MAP_FAILED) {
+			ksft_print_msg("mmap failed: %s(%d)\n", strerror(errno), errno);
+			ksft_test_result_fail("munmap shrink\n");
+			return;
+		}
+		ret = munmap((char *)addr + ps * i, ps);
+		if (ret != 0) {
+			ksft_print_msg("memory %p isn't unmapped at %p\n",
+				addr, (char *)addr + ps * i);
+			goto error;
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
+	ksft_test_result_pass("munmap shrink\n");
+	return;
+error:
+	for (int j = 0; j < 4; j++) {
+		if (munmap((char *)addr + j * ps, ps))
+			ksft_print_msg("cleanup munmap failed: %s\n", strerror(errno));
+	}
+	ksft_print_msg("clean up failures\n");
+	ksft_test_result_fail("munmap shrink\n");
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
+		ksft_print_msg("mmap failed: %s(%d)\n", strerror(errno), errno);
+		ksft_test_result_fail("mremap shrink\n");
+		return;
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(params); i++) {
+		old_len = params[i].old;
+		new_len = params[i].new;
+		current_len = page_align(new_len);
+		addr2 = mremap(addr, old_len, new_len, MREMAP_MAYMOVE);
+		if (addr2 == MAP_FAILED) {
+			ksft_print_msg("memory %p isn't remapped at %p\n", addr, addr2);
+			ksft_test_result_fail("mremap shrink\n");
+			munmap(addr, page_align(old_len));
+			return;
+		}
+
+		addr = addr2;
+	}
+
+	if (munmap(addr, current_len)) {
+		ksft_print_msg("cleanup failed: %s\n", strerror(errno));
+		ksft_test_result_fail("mremap shrink\n");
+		return;
+	}
+	ksft_test_result_pass("mremap shrink\n");
+}
+
+static int get_shared_writable_file_expected_error(const char *path)
+{
+	if (nommu && get_fs_type(path) == RAMFS_MAGIC)
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
+	int nommu_exp_err;
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
+		.resolve_exp_err = get_shared_writable_file_expected_error,
+	},
+	{
+		.name = "private file unchanged length (r-)",
+		.pathname = "/tmp/ksft.nommu-remap-XXXXXX",
+		.open_flags = O_CREAT | O_RDWR | O_EXCL,
+		.mmap_prot = PROT_READ,
+		.mmap_flags = MAP_PRIVATE,
+		.exp_err = 0,
+		.nommu_exp_err = EPERM,
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
+		.exp_err = 0,
+		.nommu_exp_err = EPERM,
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
+		.exp_err = 0,
+		.nommu_exp_err = ENOMEM,
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
+	const char *path = tcase->pathname;
+	int rc = KSFT_PASS;
+	int expected_error;
+	unsigned int old_pages = tcase->old_pages ?: 4;
+	unsigned int new_pages = tcase->new_pages ?: 2;
+	unsigned int file_pages = old_pages > new_pages ?
+				  old_pages : new_pages;
+
+	ksft_print_msg("[RUN] Testing mremap: %s\n", tcase->name);
+
+	if (tcase->pathname && strstr(tcase->pathname, "XXXXXX")) {
+		strncpy(pb, tcase->pathname, sizeof(pb) - 1);
+		pb[sizeof(pb) - 1] = '\0';
+		fd = mkstemp(pb);
+		if (fd < 0) {
+			ksft_print_msg("Failed to setup file backing\n");
+			ksft_test_result_skip("%s\n", tcase->name);
+			return KSFT_SKIP;
+		}
+		if (ftruncate(fd, ps * file_pages) != 0) {
+			ksft_print_msg("Failed to setup file backing\n");
+			rc = KSFT_FAIL;
+			goto out;
+		}
+
+		if (nommu && (tcase->mmap_flags & MAP_SHARED) &&
+		    get_fs_type(pb) != RAMFS_MAGIC) {
+			ksft_print_msg("Skip the test under non-ramfs filesystem (%s)\n",
+				pb);
+			rc = KSFT_SKIP;
+			goto out;
+		}
+		path = pb;
+	} else if (tcase->pathname) {
+		fd = open(tcase->pathname, tcase->open_flags, 0600);
+		if (fd < 0) {
+			ksft_print_msg("Backing node not accessible\n");
+			ksft_test_result_skip("%s\n", tcase->name);
+			return KSFT_SKIP;
+		}
+
+		if (nommu && (tcase->mmap_flags & MAP_SHARED) &&
+		    get_fs_type(tcase->pathname) != RAMFS_MAGIC) {
+			ksft_print_msg("Skip the test under non-ramfs filesystem (%s)\n",
+					      tcase->pathname);
+			rc = KSFT_SKIP;
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
+	expected_error = nommu ? tcase->nommu_exp_err : tcase->exp_err;
+	if (tcase->resolve_exp_err && fd >= 0)
+		expected_error = tcase->resolve_exp_err(path);
+
+	addr2 = mremap(addr, ps * old_pages, ps * new_pages,
+		       MREMAP_MAYMOVE);
+
+	if (expected_error != 0) {
+		if (addr2 != MAP_FAILED) {
+			ksft_print_msg("Expected error %d, but mremap unexpectedly succeeded\n",
+				       expected_error);
+			rc = KSFT_FAIL;
+		} else if (errno != expected_error) {
+			ksft_print_msg("Expected error %d, got %s(%d)\n",
+				       expected_error, strerror(errno), errno);
+			rc = KSFT_FAIL;
+		} else {
+			ksft_print_msg("%s: Handled expected error path (errno=%d)\n",
+				       tcase->name, expected_error);
+		}
+	} else if (addr2 == MAP_FAILED) {
+		ksft_print_msg("mremap shrink failed unexpectedly: %s\n",
+			       strerror(errno));
+		rc = KSFT_FAIL;
+	} else {
+		ksft_print_msg("%s step successful\n", tcase->name);
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
+		if (tcase->pathname && strstr(tcase->pathname, "XXXXXX") &&
+		    unlink(pb)) {
+			ksft_print_msg("unlink failed for %s: %s\n", pb, strerror(errno));
+			rc = KSFT_FAIL;
+		}
+	}
+
+	ksft_test_result_report(rc, "%s\n", tcase->name);
+	return rc;
+}
+
+int main(int argc, char **argv)
+{
+	int i;
+
+	nommu = ksft_is_nommu();
+	if (nommu < 0)
+		ksft_exit_skip("Cannot read /proc/meminfo; mount procfs at /proc\n");
+
+	ps = sysconf(_SC_PAGESIZE);
+	ksft_print_header();
+	ksft_set_plan(ARRAY_SIZE(mremap_cases) + 2);
+
+	munmap_shrink_test();
+	mremap_shrink_test();
+
+	for (i = 0; i < (int)ARRAY_SIZE(mremap_cases); i++)
+		run_mremap_test(&mremap_cases[i]);
+
+	ksft_finished();
+}
-- 
2.52.0


Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F36B349AE0
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137576; cv=none; b=hrSc4JBTpGa8YVdTuXRqaPo2j6ts8H/6tTPBJ8seTnxMqHIa5ISDeKlFAGSRHN1yX4NKnrhFtjOYG6bqfhq8IAgJHZMPHvcxXgpQUg30pNf4AOKDmXItGXrVdA4orXCqEB4I1vWiTE/KJSkOLr3vJPV3HPxnXLWAam15zjcokHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137576; c=relaxed/simple;
	bh=qPX7yyUZJCtm7bSS8AuOTkkokV46Y9uiDvYp6mJERV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwJVgin6DnTP7T5B9RvWZNslm+y29DArE8/TDtHQ2W0mJ5T771xha+He978yknVanZXn7Y7qNpXxZ7Ev+hKw6J8IDq+R1G2uPMqRSNYx/LUYUGIUbWemRMD+y2xzL91rfJ3Kdrv9cK1syg5m4I//ITzVARXYfdhO/cMuYMTw4QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkNSey+A; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkNSey+A"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so156925a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778137575; x=1778742375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dgv2EkYfGFbvZ1PGx8KpTzNURorGBePyogLOLYsqDZY=;
        b=EkNSey+ADPCnfBAxhH93pgW3lEdItSu/TISol3OEa94kLQHBQ4uqk7FwwodVovPWdE
         8HUcpe9okV6+myWxJJS2kZ7uO8xmbSdkCZbmo9RkAI4E4Gv4z5/5BeGXc3xmRF9Oeo6W
         NP7BIZDl3vdApJ6kxAebTu55coSisTiBNUNm/cxjTFhTybz+3c4JGBCcqQEgiPG/0JEU
         BZNHHVKp9icvix5zakAVvj7WT5j2Fj8hfRnKqituxCmlztvB1P3dBgLlKLEcJPDIByXN
         HghxodNGKe506wS2xXD1nEtnJGsdWkKVBQCOikL4di1xO7s1YlLfLeXJWOY5iEaosl8f
         KbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137575; x=1778742375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dgv2EkYfGFbvZ1PGx8KpTzNURorGBePyogLOLYsqDZY=;
        b=Zy9AOJyZy09waEcami/qJ8+YYqPgDCaAm/64B9QVcyY6SyilQo5nCI1NyQlO2deJaS
         IDm7kpNL2Sq1XXJV+KXBSwgMzln0NGc56Tv6s6Q0EGPhN3Eli6qyt/9v4x0WmV6GHshO
         On7NHpuOKK0Cer5C0gPcCvQ/ZOR05mT80V8jaeThDoTTR/Nhd8UW3skkfla3k1lqe9c7
         mJ+UwD5O6iSZ5/ne8G6exENZycsTnPnVdMbLJbUqpQiuvKSZD+fc9hWk0ncKNsCBgY4c
         7Yj5Qmyxuk0Ihjk6d+njqtcT8csh8PiVt3s3xnSJep8IrGhz23b5tebVel+3zuI4LrMT
         Axww==
X-Forwarded-Encrypted: i=1; AFNElJ/DfBQmSw//o7RSP6I3J62Wkr9xxjZ6XetGFt+SjW9g5t+vAbSvGFPaj7inzxp6J+R21ArbL88pRNXwE+nzvyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1zK5TLFz6oYm2gmyvhMeV3rGM9qBGsZDDEmb7giPoLzTjDhN
	a7tubcUqwFtbQ3Anc2m6FItRnUZzQzRsdbZtfq4FSU3VsUMq/jSuRD6V
X-Gm-Gg: AeBDiet6zcgDOa+e8lZFNGIiHJxhXLMdcQgMDOj6Vy0O2rHciKww3i/T7+5jztKGZUt
	rc5ZTYlR+I98o42FphCObxgx7xVxAub1yzTJlFrVTUyT1dCsInhfl+mokySyLXAvtfSrOwICm4L
	fOpH5hHAQ5P5gA0h4ayzSZPZRAlfw6QGN3/b+ZKoSVoIrph4jD2okRrjTS+fZL5OCn+DNw49KNr
	OVVcrCVGK3av+bkRbyCKYDRvZnxK0te0bXCJpeXu38PQW65FwEYdQiVKxRzjqQivfZ9cML+7MdU
	jCNG/Wwfs341ee/WLiYBx8AhxjsbGRPL2b+iBmlq3Vp5CdcYA79dYwNtvqduZrTKiBpdAbLVxq7
	IU5SY4G5bx7doEEwy/yYf/dblbH+39yOXk2sb+4ZCxSoTxXWQ/7pGNRbY8+mshE39bsJgxZZBlD
	PUNRNihEszLrfP+ybrEA5vtvlp9XAbBPS16WPNV9P8IFwFAA8N
X-Received: by 2002:a05:6a20:258c:b0:3a8:9dd:75c6 with SMTP id adf61e73a8af0-3aa5ac5fca1mr7408664637.51.1778137574565;
        Thu, 07 May 2026 00:06:14 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c825379099bsm1200164a12.14.2026.05.07.00.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:06:14 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	shuah@kernel.org,
	zokeefe@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftests/mm: add MADV_COLLAPSE sub-PMD range tests
Date: Thu,  7 May 2026 15:05:58 +0800
Message-ID: <20260507070558.3064142-3-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507070558.3064142-1-chenwandun@lixiang.com>
References: <20260507070558.3064142-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add madv_collapse_range to verify the fix for the spurious -EINVAL
returned by madvise_collapse() when the madvised range contains no
complete PMD-aligned window.

madvise_collapse() rounds the caller range inward to PMD boundaries:

  hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  // round up
  hend   =  end   &  HPAGE_PMD_MASK                    // round down

When hstart >= hend there is no PMD window to collapse.  Previously
the final expression computed (hend - hstart) without guarding against
hstart > hend, causing unsigned wrap-around and a spurious -EINVAL.
Both tests expect 0: "no PMD window to collapse" is a successful no-op.

  Test 1 - aligned start (hstart == hend):
    start = 2MiB-aligned, len = PAGE_SIZE
    Both hstart and hend round to the same 2MiB boundary.
    Was already correct; included as a regression reference.

  Test 2 - unaligned start (hstart > hend):
    start = aligned + PAGE_SIZE, len = PAGE_SIZE
    hstart rounds up past the next 2MiB boundary while hend rounds
    down below start.  (hend - hstart) wrapped unsigned, causing the
    final comparison to fail and return -EINVAL instead of 0.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 tools/testing/selftests/mm/.gitignore         |   1 +
 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/ksft_madv_collapse.sh        |   4 +
 .../selftests/mm/madv_collapse_range.c        | 141 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   5 +
 5 files changed, 153 insertions(+)
 create mode 100755 tools/testing/selftests/mm/ksft_madv_collapse.sh
 create mode 100644 tools/testing/selftests/mm/madv_collapse_range.c

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index b0c30c5ee9e3..a24f8c3cf3dc 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -28,6 +28,7 @@ protection_keys
 protection_keys_32
 protection_keys_64
 madv_populate
+madv_collapse_range
 uffd-stress
 uffd-unit-tests
 uffd-wp-mremap
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index cd24596cdd27..758639f8ae8e 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -68,6 +68,7 @@ TEST_GEN_FILES += hugepage-mremap
 TEST_GEN_FILES += hugepage-shm
 TEST_GEN_FILES += hugepage-vmemmap
 TEST_GEN_FILES += khugepaged
+TEST_GEN_FILES += madv_collapse_range
 TEST_GEN_FILES += madv_populate
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_hugetlb
@@ -153,6 +154,7 @@ TEST_PROGS += ksft_hugetlb.sh
 TEST_PROGS += ksft_hugevm.sh
 TEST_PROGS += ksft_ksm.sh
 TEST_PROGS += ksft_ksm_numa.sh
+TEST_PROGS += ksft_madv_collapse.sh
 TEST_PROGS += ksft_madv_guard.sh
 TEST_PROGS += ksft_madv_populate.sh
 TEST_PROGS += ksft_memfd_secret.sh
diff --git a/tools/testing/selftests/mm/ksft_madv_collapse.sh b/tools/testing/selftests/mm/ksft_madv_collapse.sh
new file mode 100755
index 000000000000..0d0b0356cbd0
--- /dev/null
+++ b/tools/testing/selftests/mm/ksft_madv_collapse.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+# SPDX-License-Identifier: GPL-2.0
+
+./run_vmtests.sh -t madv_collapse
diff --git a/tools/testing/selftests/mm/madv_collapse_range.c b/tools/testing/selftests/mm/madv_collapse_range.c
new file mode 100644
index 000000000000..11850be80dd8
--- /dev/null
+++ b/tools/testing/selftests/mm/madv_collapse_range.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Tests for MADV_COLLAPSE behavior when the madvise range contains no
+ * complete PMD-aligned window (range smaller than 2 MiB).
+ *
+ * madvise_collapse() rounds the caller range inward to PMD boundaries:
+ *
+ *   hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  // round up
+ *   hend   =  end   &  HPAGE_PMD_MASK                    // round down
+ *
+ * When hstart >= hend the collapsing loop is not entered.  Previously,
+ * the final return expression computed (hend - hstart) without guarding
+ * against hstart > hend, causing unsigned wrap-around and a spurious
+ * -EINVAL.  Both tests expect 0: "no PMD window to collapse" is a
+ * successful no-op, not an error.
+ *
+ * Test 1: aligned start (hstart == hend):
+ *   start = 2MiB-aligned, len = PAGE_SIZE
+ *   hstart = aligned, hend = aligned  ->  0 == 0  ->  0  (was already correct)
+ *
+ * Test 2: unaligned start (hstart > hend):
+ *   start = aligned + PAGE_SIZE, len = PAGE_SIZE
+ *   hstart = aligned + 2MiB, hend = aligned
+ *   (hend - hstart) wraps unsigned  ->  was -EINVAL, fixed to 0
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <linux/mman.h>
+
+#include "kselftest.h"
+#include "vm_util.h"
+
+#ifndef MADV_COLLAPSE
+#define MADV_COLLAPSE	25
+#endif
+
+static unsigned long	page_size;
+static unsigned long	hpage_size;
+
+/*
+ * Test 1: 2MiB-aligned start, len = PAGE_SIZE.
+ *   hstart == hend  ->  0
+ */
+static void test_subpmd_aligned(char *aligned)
+{
+	int ret;
+
+	ksft_print_msg("[RUN] sub-PMD: 2MiB-aligned start, len=PAGE_SIZE\n");
+	ret = madvise(aligned, page_size, MADV_COLLAPSE);
+	ksft_test_result(ret == 0,
+			 "sub-PMD aligned start returns 0 (ret=%d errno=%d)\n",
+			 ret, ret ? errno : 0);
+}
+
+/*
+ * Test 2: start = aligned + PAGE_SIZE, len = PAGE_SIZE.
+ *   hstart = aligned + hpage_size  >  hend = aligned
+ *   unsigned wrap was -EINVAL; correct answer is 0.
+ */
+static void test_subpmd_unaligned(char *aligned)
+{
+	int ret;
+
+	ksft_print_msg("[RUN] sub-PMD: unaligned start (aligned+PAGE), len=PAGE_SIZE\n");
+	ksft_print_msg("      hstart=%p > hend=%p\n",
+		       (void *)(aligned + hpage_size), (void *)aligned);
+
+	ret = madvise(aligned + page_size, page_size, MADV_COLLAPSE);
+	if (ret && errno == EINVAL)
+		ksft_print_msg("      got -EINVAL: unsigned-wrap bug not fixed\n");
+	ksft_test_result(ret == 0,
+			 "sub-PMD unaligned start returns 0 (ret=%d errno=%d)\n",
+			 ret, ret ? errno : 0);
+}
+
+int main(void)
+{
+	char *base, *aligned;
+	unsigned long map_size;
+	int probe_ret;
+
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	page_size  = (unsigned long)getpagesize();
+	hpage_size = (unsigned long)read_pmd_pagesize();
+	if (!hpage_size)
+		ksft_exit_skip("transparent hugepages not available\n");
+
+	/*
+	 * Probe: map one hpage-sized region, touch all pages, and attempt a
+	 * real collapse to confirm MADV_COLLAPSE is supported.  EAGAIN is a
+	 * transient resource failure and still counts as "available".
+	 */
+	map_size = 2 * hpage_size;
+	base = mmap(NULL, map_size, PROT_READ | PROT_WRITE,
+		    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (base == MAP_FAILED)
+		ksft_exit_fail_msg("probe mmap failed: %s\n", strerror(errno));
+
+	aligned = (char *)(((unsigned long)base + hpage_size - 1)
+			   & ~(hpage_size - 1));
+
+	for (unsigned long i = 0; i < hpage_size; i += page_size)
+		aligned[i] = 0;
+
+	probe_ret = madvise(aligned, hpage_size, MADV_COLLAPSE);
+	munmap(base, map_size);
+	if (probe_ret && errno != EAGAIN)
+		ksft_exit_skip("MADV_COLLAPSE not available: %s\n",
+			       strerror(errno));
+
+	/*
+	 * Both sub-PMD tests share a single 2 * hpage mapping so that
+	 * every test range falls within the same VMA.
+	 */
+	map_size = 2 * hpage_size;
+	base = mmap(NULL, map_size, PROT_READ | PROT_WRITE,
+		    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (base == MAP_FAILED)
+		ksft_exit_fail_msg("mmap failed: %s\n", strerror(errno));
+
+	for (unsigned long i = 0; i < map_size; i += page_size)
+		base[i] = 0;
+
+	aligned = (char *)(((unsigned long)base + hpage_size - 1)
+			   & ~(hpage_size - 1));
+
+	test_subpmd_aligned(aligned);
+	test_subpmd_unaligned(aligned);
+
+	munmap(base, map_size);
+
+	if (ksft_get_fail_cnt())
+		ksft_exit_fail_msg("%d out of %d tests failed\n",
+				   ksft_get_fail_cnt(), ksft_test_num());
+	ksft_exit_pass();
+}
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d8468451b3a3..58402f8261e0 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -53,6 +53,8 @@ separated by spaces:
 	test madvise(2) MADV_GUARD_INSTALL and MADV_GUARD_REMOVE options
 - madv_populate
 	test memadvise(2) MADV_POPULATE_{READ,WRITE} options
+- madv_collapse
+	test madvise(2) MADV_COLLAPSE sub-PMD range handling
 - memfd_secret
 	test memfd_secret(2)
 - process_mrelease
@@ -422,6 +424,9 @@ CATEGORY="madv_guard" run_test ./guard-regions
 # MADV_POPULATE_READ and MADV_POPULATE_WRITE tests
 CATEGORY="madv_populate" run_test ./madv_populate
 
+# MADV_COLLAPSE sub-PMD range tests
+CATEGORY="madv_collapse" run_test ./madv_collapse_range
+
 # PROCESS_MADV test
 CATEGORY="process_madv" run_test ./process_madv
 
-- 
2.43.0


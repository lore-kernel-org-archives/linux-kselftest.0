Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FD63502A9
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 04:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782103195; cv=none; b=P94NDVtKjwgjB1aiRLebHsEC1R7JQGHqo1Eaz4lOAc/TmCV2pDJ/E/AFieC7W5CjPfCBEYMxFRbjNNyt6ZpyQaiur6TwbFLnLWeu5ogNwIGdUUfv1X6pJTvJyQLAkXdX0YhxP1c1z2wIxSo5Y51qIe/c5xS/WZdglhnEGPIyx0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782103195; c=relaxed/simple;
	bh=LjxX8Klr+G34KM3rSGV4EWy2BeuZZEAefpqD8YkOBms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NOCtb5P1MuVi+R8RvD8mtmrGu2ZS7BfzK9We1hbarjRIrLP7n+sAGAqGhcLEbKvuKa2MJhBqVkyoOu3XRXSiBUJWJlILGGWqrwEhTia/PdhvHjhhME+UPA3BkPQv6BgWdAitCov9jk82Mcsl6DIplH0eYly+R/zHFuVLYj32BQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3ZhiGSa; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3ZhiGSa"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e6b5c374e5so3615519a34.0
        for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 21:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782103193; x=1782707993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKMHfcfhMGcxiR57N856X9q08MvdnvQ8rtbS1nGojyw=;
        b=K3ZhiGSaEdDMTAAMGtQgSOsWUyUY9inQ13wzM+al1rTMVfN/WIGtX1e9eAstDD8jUQ
         QQx71QRZVJSkOOHKFSl+j71KjQHaJCbfh00btCfODbEi5yz00J9EYMfz16QKLij7yoI4
         im3TFj/xzOOTpLyfDaD+iTGk8q7vzt/1ETAZ1yfo2WoHDeE3CHXq9/izh+EcTGmmWHU2
         u733cjKR/NOwDx5FP/nn9BOmlPTX0fwXwZCmy7OH4z9bVJZkCzLGtqIm8r47pCWmC/T5
         tyY/UkRDNqRlM14+IDilwFIogaKOgxoNQSC1sbV41mk5S0GV/Q7Hg/KQzViEIJ4npK5Q
         XqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782103193; x=1782707993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKMHfcfhMGcxiR57N856X9q08MvdnvQ8rtbS1nGojyw=;
        b=mtMlsIuO2fpj1hW3+LI9Bekco47kcqitUz2xl0zqVhrYedvIvytr2vrqZ2P8Dx4V/T
         1y+JG6S786NTeGHDY30V1I1X4kWgCyVqpc2yJ7YouSbs3T1JViLIQlo/DS5/HvpdBsEY
         VltHOe6JaaP3Mj/sTPOkmq4TkYFfYUOPFCkou9w7s1QM8WB6vZLOMgHlvRsSucXKL8kC
         V/7PWvSk0YsxnA0/4f+6RG5Y9zoCsE8+dJRjvtNRRV5F5L/DIY4U20Rbn6i03JH5Fgxz
         XHvLWMp6pIEdi/7Xb7XRXJ2Da9D7t3avna1mcmB7udG7vwd7XkbHWOj8px3B/d88AJrc
         xX/A==
X-Forwarded-Encrypted: i=1; AFNElJ8Xs+tOZFSHp8RrmyqlfKJYd79TI8R2Q/YnsCKGqwi5nHLKfBJ6jgp+m4HymNYSdUt9N521KVQQaNrcBbtyiR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGQ3YkChm6z0VIWOjCUCVMM25Zg15YmXriKDhq+CILdsAHRw3
	5NWgUBjyoOdMmUE1ICrME1Z3nkbFXi9gXYXTCI1vCeMN5COh7PtJBPyr
X-Gm-Gg: AfdE7cnPU8ZeKDL3MC/UXgnTCmMDmzxvIXESkvvlHtPuPrZF+glwyAuXJdPO1cLpIs6
	6WMpWs5NTAvgGvQjr0ZFn+2iJTIX6q8AYFBMsABfuguuDBFMEyibAUrKu5vQWmjOajdv4m5JeXo
	tkyZf0hOJwVSeAMktC2G78/nPPbj/OWhBlU1yTMaUSPqVBdVzgznzpq7Esknt3WdhZKDoWqcxX1
	hPx/T4V5RCSA71sOBbEio+USabS8Iu84nlOjdT9w84QXRz0ZXpZ0LDbVFKRZenyBAgTtQHEWSCs
	+j5uLqSb5K9K7pAhZIksTXSSF7sJ4FP+ELGxjsAjT33cDglOFJ7Xzl4CVxIMutEnzkQvItNgEVy
	4kT4X5Wzw4Y5GojiMcuTjg3OzEDKF199JeF+HGMItEpWptnGTXJ1BB03NN0BECuUXGt5EFKNKTv
	6kIFRipUu6eMsiaJCuPMUUFeUU44hXAX/t5A==
X-Received: by 2002:a9d:6ad0:0:b0:7d7:45b7:ed8a with SMTP id 46e09a7af769-7e92cb41280mr6746119a34.5.1782103193153;
        Sun, 21 Jun 2026 21:39:53 -0700 (PDT)
Received: from nyx.tail25a6.ts.net ([2605:59c8:74db:6e0c:3a80:a3f:f9f0:1b3c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9442ea144sm5428453a34.27.2026.06.21.21.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 21:39:52 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
To: kees@kernel.org,
	brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: jack@suse.cz,
	shuah@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Farid Zakaria <farid.m.zakaria@gmail.com>
Subject: [PATCH 2/2] selftests/exec: add test suites for $ORIGIN interpreter resolution
Date: Sun, 21 Jun 2026 21:39:34 -0700
Message-ID: <20260622043934.179879-3-farid.m.zakaria@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260622043934.179879-1-farid.m.zakaria@gmail.com>
References: <20260622043934.179879-1-farid.m.zakaria@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add verification suites to test the kernel VFS and ELF loader $ORIGIN
interpreter resolution.

1. Add a KUnit unit test 'exec_test_resolve_elf_interpreter()' verifying
   path resolution format logic.
2. Add a kselftests integration test containing:
   - A nolibc-based statically linked mock interpreter that prints a
     success message and returns 42. nolibc is used to bypass glibc's
     static startup code which segfaults when loaded as an interpreter
     due to AT_PHDR mismatches.
   - A dynamic test program configured to look for the interpreter at
     $ORIGIN/mock_interp.
   - A shell script harness checking for a PASS result.

Assisted-by: Antigravity:Gemini-Pro
Signed-off-by: Farid Zakaria <farid.m.zakaria@gmail.com>
---
 fs/tests/exec_kunit.c                         | 26 +++++++++++++++++++
 tools/testing/selftests/exec/Makefile         | 12 ++++++---
 tools/testing/selftests/exec/mock_interp.c    |  6 +++++
 tools/testing/selftests/exec/origin_interp.sh | 16 ++++++++++++
 tools/testing/selftests/exec/test_prog.c      |  5 ++++
 5 files changed, 62 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/exec/mock_interp.c
 create mode 100755 tools/testing/selftests/exec/origin_interp.sh
 create mode 100644 tools/testing/selftests/exec/test_prog.c

diff --git a/fs/tests/exec_kunit.c b/fs/tests/exec_kunit.c
index 1c32cac09..991b9abad 100644
--- a/fs/tests/exec_kunit.c
+++ b/fs/tests/exec_kunit.c
@@ -119,8 +119,34 @@ static void exec_test_bprm_stack_limits(struct kunit *test)
 	}
 }
 
+static void exec_test_resolve_elf_interpreter(struct kunit *test)
+{
+	struct linux_binprm bprm = { .file = NULL };
+	struct file *f;
+	char *resolved;
+
+	// Test 1: Non-$ORIGIN interpreter path should just be duplicated
+	resolved = resolve_elf_interpreter(&bprm, "/lib64/ld-linux-x86-64.so.2");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, resolved);
+	KUNIT_EXPECT_STREQ(test, resolved, "/lib64/ld-linux-x86-64.so.2");
+	kfree(resolved);
+
+	// Test 2: $ORIGIN interpreter path
+	f = filp_open("/", O_RDONLY, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, f);
+	bprm.file = f;
+
+	resolved = resolve_elf_interpreter(&bprm, "$ORIGIN/../lib/ld.so");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, resolved);
+	KUNIT_EXPECT_STREQ(test, resolved, "//../lib/ld.so");
+	kfree(resolved);
+
+	filp_close(f, NULL);
+}
+
 static struct kunit_case exec_test_cases[] = {
 	KUNIT_CASE(exec_test_bprm_stack_limits),
+	KUNIT_CASE(exec_test_resolve_elf_interpreter),
 	{},
 };
 
diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
index 45a3cfc43..5e2e305cb 100644
--- a/tools/testing/selftests/exec/Makefile
+++ b/tools/testing/selftests/exec/Makefile
@@ -10,9 +10,9 @@ ALIGN_PIES        := $(patsubst %,load_address.%,$(ALIGNS))
 ALIGN_STATIC_PIES := $(patsubst %,load_address.static.%,$(ALIGNS))
 ALIGNMENT_TESTS   := $(ALIGN_PIES) $(ALIGN_STATIC_PIES)
 
-TEST_PROGS := binfmt_script.py check-exec-tests.sh
-TEST_GEN_PROGS := execveat non-regular $(ALIGNMENT_TESTS)
-TEST_GEN_PROGS_EXTENDED := false inc set-exec script-exec.inc script-noexec.inc
+TEST_PROGS := binfmt_script.py check-exec-tests.sh origin_interp.sh
+TEST_GEN_PROGS := execveat non-regular $(ALIGNMENT_TESTS) test_prog
+TEST_GEN_PROGS_EXTENDED := false inc set-exec script-exec.inc script-noexec.inc mock_interp
 TEST_GEN_FILES := execveat.symlink execveat.denatured script subdir
 # Makefile is a run-time dependency, since it's accessed by the execveat test
 TEST_FILES := Makefile
@@ -55,3 +55,9 @@ $(OUTPUT)/script-exec.inc: $(CHECK_EXEC_SAMPLES)/script-exec.inc
 	cp $< $@
 $(OUTPUT)/script-noexec.inc: $(CHECK_EXEC_SAMPLES)/script-noexec.inc
 	cp $< $@
+
+$(OUTPUT)/mock_interp: mock_interp.c
+	$(CC) $(CFLAGS) $(LDFLAGS) -static -nostdlib -include ../../../include/nolibc/nolibc.h $< -o $@
+
+$(OUTPUT)/test_prog: test_prog.c $(OUTPUT)/mock_interp
+	$(CC) $(CFLAGS) $(LDFLAGS) -Wl,-dynamic-linker,'$$ORIGIN/mock_interp' $< -o $@
diff --git a/tools/testing/selftests/exec/mock_interp.c b/tools/testing/selftests/exec/mock_interp.c
new file mode 100644
index 000000000..9c9ca1098
--- /dev/null
+++ b/tools/testing/selftests/exec/mock_interp.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+int main(void)
+{
+	write(1, "Hello from mock interpreter!\n", 29);
+	return 42;
+}
diff --git a/tools/testing/selftests/exec/origin_interp.sh b/tools/testing/selftests/exec/origin_interp.sh
new file mode 100755
index 000000000..635a40839
--- /dev/null
+++ b/tools/testing/selftests/exec/origin_interp.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+# Execute the test program which has its interpreter set to $ORIGIN/mock_interp
+# Note that mock_interp must be in the same directory.
+dir=$(dirname "$0")
+out=$("$dir"/test_prog 2>&1)
+exit_code=$?
+
+if [ $exit_code -eq 42 ] && [ "$out" = "Hello from mock interpreter!" ]; then
+	echo "origin_interp: PASS"
+	exit 0
+else
+	echo "origin_interp: FAIL (exit_code=$exit_code, output='$out')"
+	exit 1
+fi
diff --git a/tools/testing/selftests/exec/test_prog.c b/tools/testing/selftests/exec/test_prog.c
new file mode 100644
index 000000000..451614def
--- /dev/null
+++ b/tools/testing/selftests/exec/test_prog.c
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+int main(void)
+{
+	return 0; /* Should never be reached if interpreter is loaded instead */
+}
-- 
2.51.2


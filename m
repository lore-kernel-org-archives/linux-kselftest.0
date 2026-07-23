Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75589403EA0
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 22:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845313; cv=none; b=nDXLYBrb03pt2VJBH8FPCvXKlkX6Cfvfo+XoK7Fp4/oYCYWYqWmrYcjkXSLKsLPsv7ETD65YFC9UjY9PQ6Bj6vTopRFsmXeuc2i5r0arqQSsDGoESrRAvDavBf3IHRvj3vvWIVEaXo3PTiDb8LEjbzgd6r4QvXDFUUB2U73lrtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845313; c=relaxed/simple;
	bh=fJOU6/miCLaEtKkvCw17Nkxijrztkn/FLifw9WOUGoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCWZFmGrjkxtf0ljccwslo43Gmib9nD6Vi4q6aTOuzzjKZ1FYnOur8OK9911SpuMYRyErE8wCPOlEXPVbocpMPAm01Ynh3PER0jZKteznMaa0sLuWw0CD4PZ4u5tdKhs7V6VZ3W5fIuTTdJSPq82cr6eLvRU59pVnTP1l7ikRDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=MlzwKVS4; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="MlzwKVS4"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ee4399c3abso894754a34.2
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 15:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784845304; x=1785450104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pk4XAwmL2BJHmhVYsZYXxgDptRoYP8bPdBv4gVu4WSA=;
        b=MlzwKVS4G3Kg6fxaUg9lqRmao/fXgPkvB6QBCidgzY6aGDUMMkswRkJBaSFXFMYFI7
         JLs7vjwB0RwpVcQgTIaNElZYYJ8rAMC6Oh32ZHzL6M18PQ1dnxqqjW8vQGZUKIaM2Kq2
         /N5/8+Yoscz30WpLlBnG2CNCvcKmFmspp/7QRaH0odN+h4E0whZgiwkbpd6flAv9MVx2
         nr1RzxBGG1QkOE9MwxOMB5ZI1aqaS5P27OI14J12gE2bVemE3Tuxx+ZU1tMIgC3rNXho
         lVXnJ/2mNxxjGssR4Jek3bhTSnnPqW/vy+M0oK3o1tMle4GRFs2l0grsDNDFEyd40tiX
         VEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784845304; x=1785450104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pk4XAwmL2BJHmhVYsZYXxgDptRoYP8bPdBv4gVu4WSA=;
        b=ZH+e+mIitUG+0aMTWc4icJBW45/NuFZUGT0xuOClNO5AN84DxMLtagXPaaTmU8Lu8w
         BtmaxWSzzbrq2Iu2r4Gzess4+xMdHo5drvQLTRETMHfwZti3Xt+5fsIZw13FzUNl6/u/
         m+LpHSO5wqnV3sMurioFkgCd1Lp87oM5WNxJOwDsepUdVl0NjE6Moc8PW2Nx9kLidDh6
         8CIDcgWRrk7ogFLiW2XD7hogyTgXBdlzIiJXdqFd1KtPLRST0X2hynwrEXOHcelv8jhb
         9WOgo0L+m+z5uq6QSs9jN3QDextLW7eIqm+rzEoTWA/FvQGzrJJawgilct6BP1B+IDhp
         Smdg==
X-Forwarded-Encrypted: i=1; AHgh+RrX/miKQjz7z963CTKjG8KokWNpKam3UjoWcA016/PTXsCe+OebovotP0hZ4ScF90sHrGFTSb5yNqWfJnaIil8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyECGkXLlimfGm7Bc/JaJIiemZQk36v3eK/Csna8W2b8NuK72oW
	rw7L/rrH29aGyMgWqBlZ24gn24b8+s/HpmnNJGLC/uEu5XyCQMDc6w6J/m0YCmwMfXg=
X-Gm-Gg: AR+sD1067tbwH5Rv0/oUbY7xOdp0++QkJaojS8VkEHNU4KqALs4U/F6jArzLxlmOKWQ
	TkcKqs7/I4E5Efksd6VFQ/r1zcFKPRjKHGoP0MsvwV8FoC8KtKOcbA9LcBlU3b8R6eDifkJS75X
	kshWcKgRgibS9kpVNMt2o2Va0IYBFEHK918qt2cdDyY5jjOYa0BCk08tedyPctml+YmSMCz7WFl
	7cJpUQ/Imj0MJYvtseI6tRkiNRwvjpWfdAgQ6SDkX/RhHjxT0ZKd5jmS7X/Qh1DHuTIcQ9ipZVh
	G088DPmqt+C2kAg+T6GEXKwX59ktZDDCS3YYVwP4OMNe0FbMkN3/+jAvfM0Rd3Cf+NC8YkLSOrH
	kPfUKMDw7WKqhsKIsP8Gtco6eg9LrZWIWrmL3EHRG8msJzohw/zmhsI60S3ZHxmtC4PsSjGc4Ni
	TGgHhYLcoZvvgZIz/m69KK9rSamaKjI10/Sdw=
X-Received: by 2002:a05:6820:1a0b:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6aad401d342mr2269576eaf.17.1784845304358;
        Thu, 23 Jul 2026 15:21:44 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaddc93c54sm1316877eaf.11.2026.07.23.15.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:21:44 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH 2/2]  selftests: riscv: hwprobe: test the RISCV_HWPROBE_KEY_EXT_ENABLED modifier
Date: Thu, 23 Jul 2026 17:20:57 -0500
Message-ID: <20260723222109.2229089-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723222109.2229089-1-tchiu@tenstorrent.com>
References: <20260723222109.2229089-1-tchiu@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a selftest for the RISCV_HWPROBE_KEY_EXT_ENABLED modifier key, which
reports the extensions that are not only present in hardware but also
enabled for the calling process.

The modifier is positional within a single hwprobe request: keys placed
before it report what is present in hardware, keys placed after it report
what is present and enabled. A single query therefore returns both views:

      [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
          present       modifier       enabled

The test uses this to check that Vector is masked out of the enabled view
once V is disabled for the process, while remaining in the present view.

The disabled-V check depends on user space being allowed to run vector
instructions by default (/proc/sys/abi/riscv_v_default_allow == 1). The
checks that require the modifier or V in hardware are skipped when either
is unavailable.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 .../selftests/riscv/hwprobe/.gitignore        |   2 +
 .../testing/selftests/riscv/hwprobe/Makefile  |  14 ++-
 .../selftests/riscv/hwprobe/ext-enabled.c     | 111 ++++++++++++++++++
 .../riscv/hwprobe/ext-enabled_nolibc.c        |  58 +++++++++
 4 files changed, 181 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c

diff --git a/tools/testing/selftests/riscv/hwprobe/.gitignore b/tools/testing/selftests/riscv/hwprobe/.gitignore
index 6e384e80ea1a..ceb4bf86340c 100644
--- a/tools/testing/selftests/riscv/hwprobe/.gitignore
+++ b/tools/testing/selftests/riscv/hwprobe/.gitignore
@@ -1,3 +1,5 @@
 hwprobe
 cbo
 which-cpus
+ext-enabled
+ext-enabled_nolibc
diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index 71e3f26c541b..55be82758830 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -2,9 +2,8 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-CFLAGS += -I$(top_srcdir)/tools/include
-
-TEST_GEN_PROGS := hwprobe cbo which-cpus
+TEST_GEN_PROGS := hwprobe cbo which-cpus ext-enabled
+TEST_GEN_PROGS_EXTENDED := ext-enabled_nolibc
 
 include ../../lib.mk
 
@@ -12,7 +11,14 @@ $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
 	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/cbo: cbo.c sys_hwprobe.S
-	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) -I$(top_srcdir)/tools/include $(LDFLAGS) $^
 
 $(OUTPUT)/which-cpus: which-cpus.c sys_hwprobe.S
 	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/ext-enabled: ext-enabled.c sys_hwprobe.S
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/ext-enabled_nolibc: ext-enabled_nolibc.c
+	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
+		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
diff --git a/tools/testing/selftests/riscv/hwprobe/ext-enabled.c b/tools/testing/selftests/riscv/hwprobe/ext-enabled.c
new file mode 100644
index 000000000000..887820911629
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/ext-enabled.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test the RISCV_HWPROBE_KEY_EXT_ENABLED positional modifier.
+ *
+ * The modifier is a one-way switch within a single hwprobe request: keys
+ * before it report what is present in hardware, keys after it report what is
+ * also enabled for the calling process. A single query returns both views:
+ *
+ *	[ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
+ *	    present       modifier       enabled
+ *
+ * When V is disabled for the process it must drop out of the enabled view but
+ * stay in the present view. V cannot be turned off for a thread that already
+ * has it on (prctl returns -EPERM); the NEXT control only takes effect across
+ * execve(). So the disabled-V case runs in a forked child that sets NEXT=off
+ * and execs a nolibc worker (built without libc so no vector-optimized libc
+ * routine can SIGILL while V is off). The worker reports back via exit code.
+ */
+#include <unistd.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+#include "hwprobe.h"
+#include "kselftest.h"
+
+#ifndef PR_RISCV_V_SET_CONTROL
+#define PR_RISCV_V_SET_CONTROL		69
+#define PR_RISCV_V_VSTATE_CTRL_OFF	1
+#endif
+#define VSTATE_CTRL_NEXT_SHIFT		2
+
+#define WORKER "./ext-enabled_nolibc"
+
+/* Verdicts returned by the worker. */
+#define VOFF_OK		0	/* present keeps V, enabled masks it */
+#define VOFF_BUG	1	/* enabled view still reported V */
+#define VOFF_SETUP	2	/* could not disable V / probe failed */
+
+/* Run the canonical present/enabled query; returns the raw syscall result. */
+static long query(__u64 *present, __u64 *enabled, __s64 *mod_key)
+{
+	struct riscv_hwprobe pairs[3] = {
+		{ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, },
+		{ .key = RISCV_HWPROBE_KEY_EXT_ENABLED, },
+		{ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, },
+	};
+	long ret = riscv_hwprobe(pairs, 3, 0, NULL, 0);
+
+	*present = pairs[0].value;
+	*mod_key = pairs[1].key;
+	*enabled = pairs[2].value;
+	return ret;
+}
+
+/* Fork a child that disables V across execve, and return the worker verdict. */
+static int probe_with_v_disabled(void)
+{
+	char * const argv[] = { WORKER, NULL };
+	char * const envp[] = { NULL };
+	int status;
+	pid_t pid = fork();
+
+	if (pid < 0)
+		return VOFF_SETUP;
+	if (pid == 0) {
+		/* Disable V for the next execve of this child. */
+		prctl(PR_RISCV_V_SET_CONTROL,
+		      PR_RISCV_V_VSTATE_CTRL_OFF << VSTATE_CTRL_NEXT_SHIFT);
+		execve(WORKER, argv, envp);
+		_exit(VOFF_SETUP);		/* execve failed */
+	}
+	if (waitpid(pid, &status, 0) < 0 || !WIFEXITED(status))
+		return VOFF_SETUP;
+	return WEXITSTATUS(status);
+}
+
+/*
+ * This test assumes the user space allow executing vector instruction as a
+ * default behavior. Namely, /proc/sys/abi/riscv_v_default_allow is 1
+ */
+int main(void)
+{
+	__u64 present = 0, enabled = 0;
+	__s64 mod_key = 0;
+	int verdict;
+
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	if (query(&present, &enabled, &mod_key))
+		ksft_exit_fail_msg("hwprobe() failed\n");
+
+	ksft_test_result(mod_key == RISCV_HWPROBE_KEY_EXT_ENABLED,
+			 "RISCV_HWPROBE_KEY_EXT_ENABLED is recognized\n");
+
+	/* The remaining checks need both the modifier and V in hardware. */
+	if (mod_key != RISCV_HWPROBE_KEY_EXT_ENABLED ||
+	    !(enabled & RISCV_HWPROBE_IMA_V)) {
+		ksft_test_result_skip("V off: present keeps V, enabled masks it\n");
+		ksft_finished();
+	}
+
+	/* V off (only reachable across execve): enabled view masks it. */
+	verdict = probe_with_v_disabled();
+	if (verdict == VOFF_SETUP)
+		ksft_test_result_skip("V off: present keeps V, but could not disable V\n");
+	else
+		ksft_test_result(verdict == VOFF_OK,
+				 "V off: present keeps V, enabled masks it\n");
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c b/tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c
new file mode 100644
index 000000000000..d7f0a3c8314d
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/ext-enabled_nolibc.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * nolibc worker for the RISCV_HWPROBE_KEY_EXT_ENABLED test.
+ *
+ * ext-enabled execs this program with V disabled for the process. It is built
+ * with nolibc on purpose: there is no libc here, so no vector-optimized libc
+ * routine can run and take a SIGILL while V is off. It probes the canonical
+ * [present, modifier, enabled] request and reports a verdict via exit code:
+ *
+ *	0  present keeps V, enabled masks it  (correct)
+ *	1  enabled view still reports V        (bug)
+ *	2  setup problem (V not off, or hwprobe failed)
+ */
+
+#ifndef __NR_riscv_hwprobe
+#define __NR_riscv_hwprobe		258
+#endif
+
+#ifndef PR_RISCV_V_GET_CONTROL
+#define PR_RISCV_V_GET_CONTROL		70
+#define PR_RISCV_V_VSTATE_CTRL_OFF	1
+#define PR_RISCV_V_VSTATE_CTRL_CUR_MASK	0x3
+#endif
+
+#define RISCV_HWPROBE_KEY_IMA_EXT_0	4
+#define RISCV_HWPROBE_KEY_EXT_ENABLED	17
+#define RISCV_HWPROBE_IMA_V		(1 << 2)
+
+struct riscv_hwprobe {
+	long long key;
+	unsigned long long value;
+};
+
+int main(void)
+{
+	struct riscv_hwprobe pairs[3] = {
+		{ .key = RISCV_HWPROBE_KEY_IMA_EXT_0 },
+		{ .key = RISCV_HWPROBE_KEY_EXT_ENABLED },
+		{ .key = RISCV_HWPROBE_KEY_IMA_EXT_0 },
+	};
+	long ctrl;
+
+	/* We must really be running with V turned off. */
+	ctrl = prctl(PR_RISCV_V_GET_CONTROL, 0, 0, 0, 0);
+	if (ctrl < 0 ||
+	    (ctrl & PR_RISCV_V_VSTATE_CTRL_CUR_MASK) != PR_RISCV_V_VSTATE_CTRL_OFF)
+		return 2;
+
+	if (syscall(__NR_riscv_hwprobe, pairs, 3, 0, 0, 0))
+		return 2;
+
+	/* Present view must still carry V (it is in hardware). */
+	if (!(pairs[0].value & RISCV_HWPROBE_IMA_V))
+		return 2;
+
+	/* Enabled view must have masked V out. */
+	return (pairs[2].value & RISCV_HWPROBE_IMA_V) ? 1 : 0;
+}
-- 
2.43.0


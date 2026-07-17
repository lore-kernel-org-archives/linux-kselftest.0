Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D873AB288;
	Fri, 17 Jul 2026 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278619; cv=none; b=ueK78wf/dpi2vPkLjhLuHmLGwZn7ymLqrcCUabtGE+xujQSVuvWYmnjdAW8kW8vMpamAFZaLjtrHyTFD8XUVD3X5t6QxGeK1VGEwcdd9egUuoM2fQW7QNN4SOfXvTOd4ur12wQ5PmCcQYTsSJIqTVcu4Ci41Z/ugW3ta7Tr9wPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278619; c=relaxed/simple;
	bh=T6FIl2qBNzHVux9fRPl8zy0+exJR/zlmu3RzkHklYpo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2bTxZVu0zv+XG7hzhTp8QyNg/Kwfs4K6pdLm9AnPxCsiWnpS7v7sL98Xpxstr+qjmeEh/5xNy1Bf1hEJYbcHDpwlwdYiGOoZkPhcFrn15ECVEe+KRvvrAtLa6mFeaZHCX/onTpwQ0B1tz+jfy8HtBCdKwVOnszHqQLxwrczxao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=EOHAj8GJ; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="EOHAj8GJ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1pe6oNWRgyqsCINQc9IE5lBArQDCM88lWlgPXH66SvQ=;
	b=EOHAj8GJtMLgv+LgoapPh8rztrXJQFsDep6/qc9p1559QU3zdRaojdXPsgc3kvSq/8eknbrjJ
	g02kLTYLv1zrDrxBajvUgBbUZ4OojxMYwO3UCnBa7knnmfXImNhPd+UH33pRQsS4NUo7VxXM5FC
	gmZ2tIIidIScGRLXuX3fXz0=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4h1k7N75mDz1prmX;
	Fri, 17 Jul 2026 16:47:28 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 991304057D;
	Fri, 17 Jul 2026 16:56:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 17 Jul
 2026 16:56:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 2/2] kselftest/arm64: Add SECCOMP_RET_TRACE x0 bypass test
Date: Fri, 17 Jul 2026 16:56:57 +0800
Message-ID: <20260717085657.3600248-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717085657.3600248-1-ruanjinjie@huawei.com>
References: <20260717085657.3600248-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Add a selftest that verifies the kernel re-synchronises orig_x0 after
a SECCOMP_RET_TRACE ptrace event, so that tracepoints (and audit) see
the modified argument rather than the original value.

The child installs a seccomp filter returning SECCOMP_RET_TRACE for
write().  The tracer changes the first argument (fd) from 2 to 1 at the
SECCOMP event, then the test checks that the sys_enter_write tracepoint
records fd=1.

The test requires root and tracefs (at /sys/kernel/debug/tracing);
it is skipped gracefully when these are unavailable.

Before the fix:
	# ./seccomp_ret_trace_x0_bypass
	TAP version 13
	1..1
	not ok 1 seccomp_ret_trace_x0_tracepoint
	# Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

After the fix:
	# ./seccomp_ret_trace_x0_bypass
	TAP version 13
	1..1
	ok 1 seccomp_ret_trace_x0_tracepoint
	# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Cc: Kees Cook <kees@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Link: https://lore.kernel.org/all/20260716120640.6590-1-will@kernel.org/
Link: https://lore.kernel.org/all/202607152004.DEA95D63@keescook/
Suggested-by: Kees Cook <kees@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 tools/testing/selftests/arm64/abi/.gitignore  |   1 +
 tools/testing/selftests/arm64/abi/Makefile    |   2 +-
 .../arm64/abi/seccomp_ret_trace_x0_bypass.c   | 249 ++++++++++++++++++
 3 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c

diff --git a/tools/testing/selftests/arm64/abi/.gitignore b/tools/testing/selftests/arm64/abi/.gitignore
index 39129a9907c7..491a80db9dff 100644
--- a/tools/testing/selftests/arm64/abi/.gitignore
+++ b/tools/testing/selftests/arm64/abi/.gitignore
@@ -1,5 +1,6 @@
 hwcap
 ptrace
 seccomp_ptrace_x0_bypass
+seccomp_ret_trace_x0_bypass
 syscall-abi
 tpidr2
diff --git a/tools/testing/selftests/arm64/abi/Makefile b/tools/testing/selftests/arm64/abi/Makefile
index 5a16db379bd4..a01d3806eba8 100644
--- a/tools/testing/selftests/arm64/abi/Makefile
+++ b/tools/testing/selftests/arm64/abi/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (C) 2021 ARM Limited
 
-TEST_GEN_PROGS := hwcap ptrace syscall-abi tpidr2 seccomp_ptrace_x0_bypass
+TEST_GEN_PROGS := hwcap ptrace syscall-abi tpidr2 seccomp_ptrace_x0_bypass seccomp_ret_trace_x0_bypass
 
 include ../../lib.mk
 
diff --git a/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c b/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c
new file mode 100644
index 000000000000..a4e56a382fe2
--- /dev/null
+++ b/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Verify that after a SECCOMP_RET_TRACE stop, changes to x0 are visible
+ * to the syscall tracepoint (orig_x0 re-sync).
+ *
+ * The child installs a seccomp filter that returns SECCOMP_RET_TRACE for
+ * write().  The parent waits for PTRACE_EVENT_SECCOMP, changes the first
+ * argument (fd) from 2 to 1, then resumes the child.  By monitoring the
+ * sys_enter_write tracepoint, we check whether the kernel recorded fd=1
+ * (test passes) or fd=2 (test fails).
+ *
+ * Requires root and tracefs at /sys/kernel/debug/tracing.  If unavailable,
+ * the test is skipped.
+ */
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+#include <sys/prctl.h>
+#include <sys/ptrace.h>
+#include <sys/wait.h>
+#include <linux/elf.h>
+#include <linux/filter.h>
+#include <linux/seccomp.h>
+#include <linux/ptrace.h>
+
+#include "kselftest.h"
+
+#ifndef __NR_write
+#define __NR_write 64
+#endif
+
+#define PTRACE_EVENT_MASK(status) ((status) >> 16)
+
+#define TRACEFS_PATH "/sys/kernel/debug/tracing"
+#define TRACE_EVENT  "syscalls/sys_enter_write"   /* note '/' not ':' */
+#define TRACE_PIPE   TRACEFS_PATH "/trace_pipe"
+#define TRACE_ON     TRACEFS_PATH "/events/" TRACE_EVENT "/enable"
+#define TRACE_CLR    TRACEFS_PATH "/trace"
+
+static int do_child(void)
+{
+	int null_fd = open("/dev/null", O_WRONLY);
+
+	if (null_fd >= 0) {
+		dup2(null_fd, STDOUT_FILENO);
+		close(null_fd);
+	}
+
+	if (ptrace(PTRACE_TRACEME, 0, NULL, NULL))
+		_exit(1);
+	raise(SIGSTOP);	/* let parent configure ptrace options */
+
+	struct sock_filter filter[] = {
+		BPF_STMT(BPF_LD | BPF_W | BPF_ABS, 0),			/* syscall nr */
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_write, 0, 1),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_TRACE),		/* write -> trace */
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
+	};
+	struct sock_fprog prog = {
+		.len = ARRAY_SIZE(filter),
+		.filter = filter,
+	};
+
+	if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0))
+		_exit(2);
+
+	if (prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog))
+		_exit(3);
+
+	/* write(2, "", 0) – parent will change fd to 1 at SECCOMP stop */
+	syscall(__NR_write, 2, "", 0);
+	_exit(0);
+}
+
+static int trace_pipe_expect(const char *expect, int timeout_secs)
+{
+	FILE *fp = fopen(TRACE_PIPE, "r");
+	char buf[4096];
+	int found = 0;
+	time_t deadline = time(NULL) + timeout_secs;
+
+	if (!fp)
+		return 0;
+
+	fcntl(fileno(fp), F_SETFL, O_NONBLOCK);
+	while (time(NULL) < deadline) {
+		ssize_t n = fread(buf, 1, sizeof(buf) - 1, fp);
+
+		if (n <= 0) {
+			usleep(10000);
+			continue;
+		}
+		buf[n] = '\0';
+		if (strstr(buf, expect)) {
+			found = 1;
+			break;
+		}
+	}
+	fclose(fp);
+	return found;
+}
+
+static void enable_trace(bool on)
+{
+	int fd = open(TRACE_ON, O_WRONLY);
+	char c = on ? '1' : '0';
+
+	if (fd >= 0) {
+		write(fd, &c, 1);
+		close(fd);
+	}
+}
+
+static void clear_trace(void)
+{
+	int fd = open(TRACE_CLR, O_WRONLY);
+
+	if (fd >= 0) {
+		write(fd, "0", 1);
+		close(fd);
+	}
+}
+
+int main(void)
+{
+	/* Wait for SECCOMP event or child exit */
+	bool seccomp_event = false;
+	bool ok = false;
+	pid_t child;
+	int status;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	if (geteuid() != 0) {
+		ksft_test_result_skip("not root\n");
+		goto out;
+	}
+	if (access(TRACE_ON, W_OK) != 0) {
+		ksft_test_result_skip("tracefs unavailable\n");
+		goto out;
+	}
+
+	child = fork();
+	if (!child)
+		return do_child();
+
+	/* Wait for initial SIGSTOP */
+	if (waitpid(child, &status, 0) != child)
+		ksft_exit_fail_msg("waitpid initial");
+	if (!WIFSTOPPED(status) || WSTOPSIG(status) != SIGSTOP)
+		ksft_exit_fail_msg("unexpected initial stop");
+
+	if (ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_TRACESECCOMP)) {
+		ksft_test_result_fail("setoptions\n");
+		goto out;
+	}
+
+	if (ptrace(PTRACE_CONT, child, 0, 0)) {
+		ksft_test_result_fail("PTRACE_CONT\n");
+		goto out;
+	}
+
+	while (1) {
+		if (waitpid(child, &status, 0) != child)
+			ksft_exit_fail_msg("waitpid lost");
+
+		if (WIFEXITED(status)) {
+			int code = WEXITSTATUS(status);
+
+			ksft_test_result(code == 2 || code == 3,
+					 "seccomp filter not installed\n");
+			goto out;
+		}
+		if (WIFSIGNALED(status)) {
+			ksft_test_result_fail("killed\n");
+			goto out;
+		}
+		if (WIFSTOPPED(status)) {
+			if (WSTOPSIG(status) == SIGTRAP &&
+			    PTRACE_EVENT_MASK(status) == PTRACE_EVENT_SECCOMP) {
+				seccomp_event = true;
+				break;
+			}
+			ptrace(PTRACE_CONT, child, 0, WSTOPSIG(status));
+		}
+	}
+
+	if (!seccomp_event)
+		goto out;
+
+	/* At SECCOMP stop: modify x0 (fd) from 2 to 1 */
+	{
+		unsigned long long syscall_nr, x0;
+		struct user_pt_regs regs;
+		struct iovec iov = { .iov_base = &regs, .iov_len = sizeof(regs) };
+
+		if (ptrace(PTRACE_GETREGSET, child, NT_PRSTATUS, &iov))
+			ksft_exit_fail_perror("GETREGSET");
+
+		syscall_nr = regs.regs[8];
+		x0 = regs.regs[0];
+		if (syscall_nr != __NR_write || x0 != 2) {
+			ksft_test_result_fail("bad regs\n");
+			goto out;
+		}
+
+		regs.regs[0] = 1;
+		if (ptrace(PTRACE_SETREGSET, child, NT_PRSTATUS, &iov)) {
+			ksft_test_result_fail("SETREGSET\n");
+			goto out;
+		}
+	}
+
+	/* Enable tracepoint and clear buffer */
+	clear_trace();
+	enable_trace(true);
+
+	/* Continue child; it will execute write(1, ...) and hit tracepoint */
+	if (ptrace(PTRACE_CONT, child, 0, 0))
+		ksft_exit_fail_perror("PTRACE_CONT after SECCOMP");
+
+	/* Reap the child */
+	while (1) {
+		if (waitpid(child, &status, 0) != child)
+			break;
+		if (WIFEXITED(status) || WIFSIGNALED(status))
+			break;
+		ptrace(PTRACE_CONT, child, 0, WSTOPSIG(status));
+	}
+	enable_trace(false);
+
+	/* Check trace for the modified fd */
+	ok = trace_pipe_expect("fd: 1", 5);
+	ksft_test_result(ok, "seccomp_ret_trace_x0_tracepoint\n");
+
+out:
+	if (child > 0) {
+		kill(child, SIGKILL);
+		waitpid(child, NULL, 0);
+	}
+	ksft_print_cnts();
+	return ok ? EXIT_SUCCESS : EXIT_FAILURE;
+}
-- 
2.34.1


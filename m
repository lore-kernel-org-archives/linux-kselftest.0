Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D189405C38;
	Wed, 30 Sep 2026 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763440; cv=none; b=rYtEOSnZk8T58Kcv+5+kNwzscUoNcasR2Yx+JaBl1/yIVBs4h2p+KkjhU2VEd86eEWQCt8QdqVOUedeUxVJAkQnXMIlEPYyUZWQ29KeBSEGl3REUqgwcsqmxFHl9VGRyPJU5KmmAtO3WwRQMhmy51lwuMkmBoNO67TXcEk9Qmi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763440; c=relaxed/simple;
	bh=mdKr8gZgxiHNzQSrE9laEW/r9A4DJv3KJm9payQNJz8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8h71eLpxVUld3E+VWHvNEGXBdy1Nsbl5ilglF0eCvJ4n9mZMGhcHco2YIhpG2/cRvsgM/R4OBNivTMMi0JcPM9HXlP3OPuvP8NqNqBtgYmy55Wjm2tuV4ni5vV8WjTUH+w40/8y8RxkH5Ft+ZkMLRZZc88fRBss6pzNLqPljSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=vXDsHX8z; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="vXDsHX8z"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fGKpdk+Y4vSjU4vgpD7sLGtFABdVy/U1HtZpPGbtd5o=;
	b=vXDsHX8zQ/wXGDSAgaeWI2U/EEY4jc4xHDtlMMXhvAzVmtu7QWJYM1LJvbsCzBTQIRxIoAjXy
	69juUVBsT3qG9LBg+NIP7fuT+5slhWmIDm1ZPKjCk7FkzfTQSwqyQPsSETJ+B8umKNaF6LMvbwd
	p3Ha/gbQFQPDMe7X0gcNS/w=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJ51BKyzKm8V;
	Wed, 30 Sep 2026 18:04:53 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3EEF74056C;
	Wed, 30 Sep 2026 18:17:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:17:05 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<tglx@kernel.org>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v20 15/15] selftests/arm64: Add ptrace SYSEMU/single-step tests
Date: Wed, 30 Sep 2026 18:18:05 +0800
Message-ID: <20260930101805.1770358-16-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930101805.1770358-1-ruanjinjie@huawei.com>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The ptrace man page requires that PTRACE_SYSEMU and
PTRACE_SYSEMU_SINGLESTEP do not produce a syscall-exit-stop as below:

	"If the tracee was restarted by PTRACE_SYSCALL or PTRACE_SYSEMU,
	the tracee enters syscall-enter-stop just prior to entering any
	system call (which will not be executed if the restart was using
	PTRACE_SYSEMU, regardless of any change made to registers at this
	point or how the tracee is restarted after this stop). ...
	If the tracee is continued using any other method (including
	PTRACE_SYSEMU), no syscall-exit-stop occurs. Note that all mentions
	PTRACE_SYSEMU apply equally to PTRACE_SYSEMU_SINGLESTEP."

And commit ac2081cdc4d9 ("arm64: ptrace: Consistently use
pseudo-singlestep exceptions") added the pseudo-step to avoid corrupt
the arm64 stepping state.

Add four tests covering arm64 syscall-exit pseudo-step and single-step
behaviour:
 - sysemu_singlestep_no_exit_stop: an emulated syscall has no
   syscall-exit-stop (ptrace(2))
 - sysemu_singlestep_intercept: the tracee is intercepted after an
   emulated syscall
 - single_step_signal_handler: single-stepping stops at the signal
   handler entry
 - single_step_syscall_stop: single-step survives a ptrace stop taken
   during a syscall

Link: https://lore.kernel.org/all/20200710130702.30658-1-will@kernel.org/
Assisted-by: DeepSeek:DeepSeek-v4 flash
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 tools/testing/selftests/arm64/Makefile        |   2 +-
 tools/testing/selftests/arm64/ptrace/Makefile |   9 ++
 .../selftests/arm64/ptrace/ptrace_common.h    |  84 +++++++++++
 .../arm64/ptrace/single_step_signal_handler.c | 131 ++++++++++++++++++
 .../arm64/ptrace/single_step_syscall_stop.c   | 130 +++++++++++++++++
 .../ptrace/sysemu_singlestep_intercept.c      |  93 +++++++++++++
 .../ptrace/sysemu_singlestep_no_exit_stop.c   |  81 +++++++++++
 7 files changed, 529 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/ptrace/Makefile
 create mode 100644 tools/testing/selftests/arm64/ptrace/ptrace_common.h
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/sysemu_singlestep_intercept.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/sysemu_singlestep_no_exit_stop.c

diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selftests/arm64/Makefile
index e456f3b62fa1..3edd476f8fc0 100644
--- a/tools/testing/selftests/arm64/Makefile
+++ b/tools/testing/selftests/arm64/Makefile
@@ -4,7 +4,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),aarch64 arm64))
-ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs
+ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs ptrace
 else
 ARM64_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/arm64/ptrace/Makefile b/tools/testing/selftests/arm64/ptrace/Makefile
new file mode 100644
index 000000000000..1feec905ab6e
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES)
+
+TEST_GEN_PROGS := sysemu_singlestep_no_exit_stop \
+		  sysemu_singlestep_intercept \
+		  single_step_signal_handler \
+		  single_step_syscall_stop
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/ptrace/ptrace_common.h b/tools/testing/selftests/arm64/ptrace/ptrace_common.h
new file mode 100644
index 000000000000..4e4f7c67437c
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/ptrace_common.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Shared helpers for the arm64 ptrace self-tests.
+ */
+#ifndef ARM64_PTRACE_COMMON_H
+#define ARM64_PTRACE_COMMON_H
+
+#include <signal.h>
+#include <stdbool.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <elf.h>
+#include <sys/ptrace.h>
+#include <sys/uio.h>
+#include <sys/wait.h>
+#include <linux/ptrace.h>
+#include <asm/ptrace.h>
+
+/* Program counter of the tracee (0 on failure). */
+static inline unsigned long tracee_pc(pid_t pid)
+{
+	struct iovec iov;
+	struct user_pt_regs regs;
+
+	iov.iov_base = &regs;
+	iov.iov_len = sizeof(regs);
+	if (ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &iov) < 0)
+		return 0;
+	return regs.pc;
+}
+
+/* PTRACE_SYSCALL_INFO_* op of the current stop, plus syscall nr on entry. */
+static inline int syscall_info(pid_t pid, long *nr)
+{
+	struct ptrace_syscall_info info;
+
+	memset(&info, 0, sizeof(info));
+	if (ptrace(PTRACE_GET_SYSCALL_INFO, pid, (void *)sizeof(info),
+		   &info) < 0)
+		return PTRACE_SYSCALL_INFO_NONE;
+	if (info.op == PTRACE_SYSCALL_INFO_ENTRY && nr)
+		*nr = (long)info.entry.nr;
+	return info.op;
+}
+
+static inline int traceme(void)
+{
+	return ptrace(PTRACE_TRACEME, 0, 0, 0);
+}
+
+/* Stop tracing the tracee and reap it so it does not linger as a zombie. */
+static inline void tracee_kill(pid_t pid)
+{
+	ptrace(PTRACE_KILL, pid, 0, 0);
+	waitpid(pid, NULL, 0);
+}
+
+/* Wall-clock guard so a broken kernel cannot hang the test run. */
+static volatile sig_atomic_t ptrace_timed_out;
+
+static void ptrace_timeout_handler(int sig)
+{
+	(void)sig;
+	ptrace_timed_out = 1;
+}
+
+static inline void ptrace_timeout_start(unsigned int seconds)
+{
+	struct sigaction sa;
+
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_handler = ptrace_timeout_handler;
+	sigemptyset(&sa.sa_mask);
+	sigaction(SIGALRM, &sa, NULL);
+	alarm(seconds);
+}
+
+static inline void ptrace_timeout_stop(void)
+{
+	alarm(0);
+}
+
+#endif /* ARM64_PTRACE_COMMON_H */
diff --git a/tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c b/tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
new file mode 100644
index 000000000000..249a70058781
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Single-stepping into a signal handler must stop at the handler entry.
+ *
+ * When TIF_SINGLESTEP is set the kernel must arrange for the tracee to be
+ * stopped as it steps into a signal handler; leaving it to the hardware
+ * fast-forward would execute the first instruction of the handler before
+ * reporting it.
+ *
+ * (ac2081cdc4d9 "arm64: ptrace: Consistently use pseudo-singlestep
+ * exceptions")
+ */
+#include <sys/mman.h>
+
+#include "kselftest.h"
+#include "ptrace_common.h"
+
+static volatile unsigned long *sh;
+
+static void sigusr1_handler(int sig)
+{
+	(void)sig;
+	sh[1] = 1;
+}
+
+static bool steps_into_signal_handler(void)
+{
+	int status, deliver = 0, delivering = 0;
+	bool stepped_in = false, handler_ran = false;
+	bool ok = false;
+	pid_t child;
+
+	sh = mmap(NULL, 4096, PROT_READ | PROT_WRITE,
+		  MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	if (sh == MAP_FAILED)
+		return false;
+	sh[0] = 0;
+	sh[1] = 0;
+
+	child = fork();
+	if (child == 0) {
+		struct sigaction sa;
+		sigset_t blk;
+
+		memset(&sa, 0, sizeof(sa));
+		sa.sa_handler = sigusr1_handler;
+		sigemptyset(&sa.sa_mask);
+		sigaction(SIGUSR1, &sa, NULL);
+
+		sigemptyset(&blk);
+		sigaddset(&blk, SIGTRAP);
+		sigprocmask(SIG_BLOCK, &blk, NULL);
+
+		if (traceme() < 0)
+			_exit(3);
+		sh[0] = (unsigned long)sigusr1_handler;
+		raise(SIGSTOP);
+		while (!sh[1])
+			asm volatile("nop");
+		_exit(0);
+	}
+
+	if (waitpid(child, &status, 0) < 0)
+		return false;
+	ptrace(PTRACE_SETOPTIONS, child, 0, 0);
+
+	/* Queue the signal; it is delivered on the next resume. */
+	kill(child, SIGUSR1);
+	ptrace_timeout_start(60);
+
+	for (;;) {
+		int sig;
+		unsigned long pc;
+
+		if (ptrace_timed_out)
+			break;
+		if (ptrace(PTRACE_SINGLESTEP, child, 0,
+			   (void *)(long)deliver) < 0)
+			break;
+		deliver = 0;
+		if (waitpid(child, &status, 0) < 0)
+			break;
+		if (WIFEXITED(status) || WIFSIGNALED(status))
+			break;
+		if (!WIFSTOPPED(status))
+			continue;
+
+		sig = WSTOPSIG(status);
+		pc = tracee_pc(child);
+
+		if (sig == SIGUSR1) {
+			/* deliver it on the next resume */
+			deliver = SIGUSR1;
+			delivering = 1;
+			continue;
+		}
+		if (delivering) {
+			/* the kernel must stop at the handler entry */
+			if (sig != SIGTRAP || pc != sh[0])
+				break;
+			stepped_in = true;
+			delivering = 0;
+			continue;
+		}
+		if (stepped_in && sh[1]) {
+			/* the handler ran, so it was not reset to SIG_DFL */
+			handler_ran = true;
+			break;
+		}
+	}
+	ptrace_timeout_stop();
+	tracee_kill(child);
+
+	ok = stepped_in && handler_ran;
+	return ok;
+}
+
+int main(void)
+{
+	bool ok;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	ok = steps_into_signal_handler();
+	ksft_test_result(ok, "stopped at the signal handler entry\n");
+
+	if (ok)
+		ksft_exit_pass();
+	ksft_exit_fail();
+}
diff --git a/tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c b/tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
new file mode 100644
index 000000000000..a44bdf6153e8
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A ptrace stop taken during a system call (here a seccomp RET_TRACE trap)
+ * must not lose the single-step stop at syscall exit, even if the tracer
+ * modifies the tracee's registers at that stop.
+ *
+ * This covers the second issue fixed by ac2081cdc4d9 ("arm64: ptrace:
+ * Consistently use pseudo-singlestep exceptions"): the hardware
+ * fast-forwards the software-step state machine across the SVC, and the
+ * ptrace stop during the syscall may rewind it.
+ */
+#include <stddef.h>
+#include <sys/mman.h>
+#include <sys/prctl.h>
+#include <sys/syscall.h>
+
+#include <linux/filter.h>
+#include <linux/seccomp.h>
+
+#include "kselftest.h"
+#include "ptrace_common.h"
+
+static int install_seccomp_getpid_trace(void)
+{
+	struct sock_filter filter[] = {
+		BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
+			 offsetof(struct seccomp_data, nr)),
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, SYS_getpid, 0, 1),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_TRACE),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
+	};
+	struct sock_fprog prog = {
+		.len = (unsigned short)ARRAY_SIZE(filter),
+		.filter = filter,
+	};
+
+	if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0) < 0)
+		return -1;
+	return prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog);
+}
+
+static void poke_a_register(pid_t pid)
+{
+	struct user_pt_regs regs;
+	struct iovec iov;
+
+	iov.iov_base = &regs;
+	iov.iov_len = sizeof(regs);
+	if (ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &iov) == 0) {
+		regs.regs[0] ^= 1;
+		ptrace(PTRACE_SETREGSET, pid, (void *)NT_PRSTATUS, &iov);
+	}
+}
+
+static bool step_survives_stop_during_syscall(void)
+{
+	volatile int *marker;
+	pid_t child;
+	int status, seen_seccomp = 0;
+	bool ok = false;
+
+	marker = mmap(NULL, 4096, PROT_READ | PROT_WRITE,
+		      MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	if (marker == MAP_FAILED)
+		return false;
+	*marker = 0;
+
+	child = fork();
+	if (child == 0) {
+		if (traceme() < 0)
+			_exit(3);
+		raise(SIGSTOP);
+		if (install_seccomp_getpid_trace() < 0)
+			_exit(2);
+		(void)syscall(SYS_getpid);	/* seccomp RET_TRACE trap */
+		*marker = 1;			/* next instruction */
+		_exit(0);
+	}
+
+	if (waitpid(child, &status, 0) < 0)
+		return false;
+	if (WIFEXITED(status))
+		return false;
+	ptrace(PTRACE_SETOPTIONS, child, 0, (void *)PTRACE_O_TRACESECCOMP);
+	ptrace_timeout_start(60);
+
+	for (;;) {
+		if (ptrace_timed_out)
+			break;
+		if (ptrace(PTRACE_SINGLESTEP, child, 0, 0) < 0)
+			break;
+		if (waitpid(child, &status, 0) < 0)
+			break;
+		if (WIFEXITED(status) || WIFSIGNALED(status))
+			break;
+		if (!WIFSTOPPED(status))
+			continue;
+
+		if ((status >> 8) ==
+		    (SIGTRAP | (PTRACE_EVENT_SECCOMP << 8))) {
+			seen_seccomp = 1;
+			poke_a_register(child);
+			continue;
+		}
+		if (seen_seccomp) {
+			/* first stop after the syscall, before the marker */
+			ok = (*marker == 0);
+			break;
+		}
+	}
+	ptrace_timeout_stop();
+	tracee_kill(child);
+
+	return ok;
+}
+
+int main(void)
+{
+	bool ok;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	ok = step_survives_stop_during_syscall();
+	ksft_test_result(ok, "single-step survives a ptrace stop during syscall\n");
+
+	if (ok)
+		ksft_exit_pass();
+	ksft_exit_fail();
+}
diff --git a/tools/testing/selftests/arm64/ptrace/sysemu_singlestep_intercept.c b/tools/testing/selftests/arm64/ptrace/sysemu_singlestep_intercept.c
new file mode 100644
index 000000000000..6d9900209d41
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/sysemu_singlestep_intercept.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * After an emulated system call, the tracee must be intercepted by a
+ * single-step stop before it executes the next instruction.  This guards
+ * against the software-step state machine being lost around the SVC.
+ */
+#include <sys/mman.h>
+#include <sys/syscall.h>
+
+#include "kselftest.h"
+#include "ptrace_common.h"
+
+static bool intercepted_after_emulated_syscall(void)
+{
+	volatile int *marker;
+	pid_t child;
+	int status, phase = 0;
+	bool intercepted = false;
+
+	marker = mmap(NULL, 4096, PROT_READ | PROT_WRITE,
+		      MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	if (marker == MAP_FAILED)
+		return false;
+	*marker = 0;
+
+	child = fork();
+	if (child == 0) {
+		if (traceme() < 0)
+			_exit(3);
+		raise(SIGSTOP);
+		(void)syscall(SYS_getpid);	/* emulated syscall */
+		*marker = 1;			/* next instruction */
+		(void)syscall(SYS_getpid);	/* endpoint */
+		_exit(0);
+	}
+
+	if (waitpid(child, &status, 0) < 0)
+		return false;
+	ptrace(PTRACE_SETOPTIONS, child, 0, (void *)PTRACE_O_TRACESYSGOOD);
+	ptrace_timeout_start(60);
+
+	for (;;) {
+		long nr = -1;
+		int op;
+
+		if (ptrace_timed_out)
+			break;
+		if (ptrace(PTRACE_SYSEMU_SINGLESTEP, child, 0, 0) < 0)
+			break;
+		if (waitpid(child, &status, 0) < 0)
+			break;
+		if (WIFEXITED(status))
+			break;
+		if (!WIFSTOPPED(status))
+			continue;
+
+		op = syscall_info(child, &nr);
+
+		if (op == PTRACE_SYSCALL_INFO_ENTRY && nr == SYS_getpid &&
+		    phase == 0) {
+			/* reached the emulated syscall, resume once */
+			phase = 1;
+			continue;
+		}
+
+		if (phase == 1) {
+			/* First stop after the emulated syscall: the marker
+			 * must not have run yet, i.e. the step was delivered.
+			 */
+			intercepted = (*marker == 0);
+			break;
+		}
+	}
+	ptrace_timeout_stop();
+	tracee_kill(child);
+
+	return intercepted;
+}
+
+int main(void)
+{
+	bool ok;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	ok = intercepted_after_emulated_syscall();
+	ksft_test_result(ok, "tracee intercepted after the emulated syscall\n");
+
+	if (ok)
+		ksft_exit_pass();
+	ksft_exit_fail();
+}
diff --git a/tools/testing/selftests/arm64/ptrace/sysemu_singlestep_no_exit_stop.c b/tools/testing/selftests/arm64/ptrace/sysemu_singlestep_no_exit_stop.c
new file mode 100644
index 000000000000..c5a0218b0c6c
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/sysemu_singlestep_no_exit_stop.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * An emulated system call (PTRACE_SYSEMU_SINGLESTEP) must report a
+ * syscall-enter-stop but no syscall-exit-stop, as documented in ptrace(2):
+ *
+ *	"If the tracee was restarted by PTRACE_SYSCALL or PTRACE_SYSEMU,
+ *	 the tracee enters syscall-enter-stop just prior to entering any
+ *	 system call ... If the tracee is continued using any other method
+ *	 (including PTRACE_SYSEMU), no syscall-exit-stop occurs."
+ */
+#include <sys/syscall.h>
+
+#include "kselftest.h"
+#include "ptrace_common.h"
+
+static bool emulated_syscall_has_no_exit_stop(void)
+{
+	pid_t child;
+	int status, after = -1;
+	bool saw_entry = false, saw_exit = false;
+
+	child = fork();
+	if (child == 0) {
+		if (traceme() < 0)
+			_exit(3);
+		raise(SIGSTOP);
+		(void)syscall(SYS_getpid);
+		_exit(0);
+	}
+
+	if (waitpid(child, &status, 0) < 0)
+		return false;
+	ptrace(PTRACE_SETOPTIONS, child, 0, (void *)PTRACE_O_TRACESYSGOOD);
+	ptrace_timeout_start(60);
+
+	for (;;) {
+		long nr = -1;
+		int op;
+
+		if (ptrace_timed_out)
+			break;
+		if (ptrace(PTRACE_SYSEMU_SINGLESTEP, child, 0, 0) < 0)
+			break;
+		if (waitpid(child, &status, 0) < 0)
+			break;
+		if (WIFEXITED(status))
+			break;
+		if (!WIFSTOPPED(status))
+			continue;
+
+		op = syscall_info(child, &nr);
+		if (op == PTRACE_SYSCALL_INFO_ENTRY) {
+			saw_entry = true;
+			if (nr == SYS_getpid && after < 0)
+				after = 4;
+		}
+		if (op == PTRACE_SYSCALL_INFO_EXIT)
+			saw_exit = true;
+		if (after > 0 && --after == 0)
+			break;
+	}
+	ptrace_timeout_stop();
+	tracee_kill(child);
+
+	return saw_entry && !saw_exit;
+}
+
+int main(void)
+{
+	bool ok;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	ok = emulated_syscall_has_no_exit_stop();
+	ksft_test_result(ok, "emulated syscall has no syscall-exit-stop\n");
+
+	if (ok)
+		ksft_exit_pass();
+	ksft_exit_fail();
+}
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397394;
	b=Fkw4zidQkXv6SAo4emG57q3zt06mYb3ARynaV39ipEBIRmCbDwlacY9Gr554ysvjqHVJ
	 1LFkZ0j04Tyl0VCQK7f/+2EY6iMIayYG4/v8tUdkvMhy3kSVh6XKXE7/xSBSCIksgA+ol
	 eZjHfdSBN8a94PoZXnoYEhziRPWiRqBJq4ayFcr4nN9EvB2wB5hFrA/2V6pfdqlNFVE+c
	 HeWoiKp+TQNOKoDcIGmw+pwJkQl0wDIUyvGX1nivIzzL3ZlAoBwA5LOl9IwkFvC3c9hb4
	 EZovWeUfK2zxe0MgrEsRvOilr+F3yTsqA0RXMqibhc4O6Wf1+eRu4fNv7VpmX5v2G2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397394;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Oeze6S7ciVv8XfxXFl5F6x6obqMaeQynoIigknRyN9Y=;
	b=D03cTMeZ3c4bSs6Mx8sKg60MTxBF29QkHoY1bhBQYH+dJPgyyFWRrfvF7f8aSJUciyAi
	 JlnP2XCCH/908wjkx2SDsTzes/0zvbsEagVU3qbajhS4DxyA3AjtXgoEniJHVuWluOUeV
	 KpZVbRBxHvJSh9hzaLm1YGm2WyOqgXvSbtEq7g/kqc8lWpuv8gGmC8UBNyjRswOIWOFMR
	 0AgBu4xF8XZ1NyEnUfzN6noCS29Z5ZH2puJhuYoKDPVf535UGrouVHs2EwPAMVYwVxWXO
	 7ul6BcfzjQsVzY19Kq8CJoZ/g+ejOhG3YwBL4WkHM6SRnsUflwtt5pW2+mMmfz1B0nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2JovtsX0;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F8C60A6F70;
	Wed, 11 Nov 2026 11:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6F8C60A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2JovtsX0
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Oeze6S7ciVv8XfxXFl5F6x6obqMaeQynoIigknRyN9Y=;
	b=2JovtsX0HS34iL/T+/TbatHVo9xjQ/v5unA9CtBErfj1rAEC1fjHZf3qYHqXq2HnaQtAb1KO8
	7K41PWdgcfe/GbgTRRmkfiSpPSgMtpg7NOz7vowF+0XqHcpGgiKQnO+LhjTbVzuQqWUozugCUo/
	mGgpD0ZovgjlGo7IrzQWHOY=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTn1QDcz1prR6;
	Wed, 11 Nov 2026 19:42:53 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id EF92A4057F;
	Wed, 11 Nov 2026 19:43:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:43:01 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <thuth@redhat.com>, <james.morse@arm.com>,
	<yeoreum.yun@arm.com>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v21 15/15] selftests/arm64: Add ptrace single-step and rseq syscall-exit tests
Date: Wed, 11 Nov 2026 19:42:25 +0800
Message-ID: <20261111114225.3977243-16-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111114225.3977243-1-ruanjinjie@huawei.com>
References: <20261111114225.3977243-1-ruanjinjie@huawei.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Add tests for the arm64 syscall-exit and single-step behaviour fixed by
the following commits. Each test fails on a kernel without the fix it
covers and passes with it.

  pseudo-step fix:      commit ac2081cdc4d99 ("arm64: ptrace: Consistently
                        use pseudo-singlestep exceptions")
  SPSR.SS override fix: commit 3a5a4366cecc ("arm64: ptrace: Override
                        SPSR.SS when single-stepping is enabled")
  SYSEMU fix:           "arm64: ptrace: Fix spurious pseudo-single-step
                        for PTRACE_SYSEMU_SINGLESTEP" (this series)
  rseq fix:             "arm64: ptrace: Check rseq critical section
                        before reporting syscall exit" (this series)

single_step_signal_handler
  Single-step into a SIGUSR1 handler while SIGTRAP is blocked and has
  its own handler. The tracee must stop at the handler entry, SIGTRAP
  must still be blocked in the handler, and its handler must not be
  reset to SIG_DFL.
  Covers the pseudo-step fix, issue reported by Keno Fischer.

single_step_spsr_ss
  Clear SPSR.SS with PTRACE_SETREGSET, as GDB does when reverse-stepping,
  then PTRACE_SINGLESTEP. The PC must move by one instruction.
  Covers the SPSR.SS override fix, issue reported by Luis Machado.

single_step_syscall_stop
  Single-step across a system call that takes a PTRACE_EVENT_SECCOMP
  stop. The first stop after the seccomp stop must be at the SVC return
  address, both when the tracer continued to the seccomp stop and when
  it single-stepped into it and rewrote the registers there.
  Covers the pseudo-step fix; the second case is the PTRACE_SETREGSET
  variant Mark Rutland pointed out, which only shows up once the
  SPSR.SS override fix is applied.

sysemu_singlestep
  PTRACE_SYSEMU_SINGLESTEP over a system call: no syscall-exit-stop
  (ptrace(2)), no pseudo-step stop after the syscall-enter-stop, and no
  pseudo-step after resuming a PTRACE_EVENT_SECCOMP stop with
  PTRACE_SYSEMU_SINGLESTEP.
  Covers the SYSEMU fix.

rseq_syscall_pc
  With rseq debugging enabled, a tracer moves the PC at the
  syscall-exit-stop. A system call issued inside an rseq critical
  section must still kill the task with SIGSEGV after the PC is moved
  out, and one issued outside must not after the PC is moved in.
  Skipped if rseq debugging is not enabled (CONFIG_DEBUG_RSEQ before
  generic entry, the rseq_debug= boot option after).
  Covers the rseq fix.

Results in QEMU (-M virt -cpu cortex-a57), P = pass, F = fail,
S = skip, one letter per test point:

  kernel                              sig  spsr sys  emu  rseq
  v5.8-rc1+, before the pseudo-step   PFF  F    FP   PPP  S
  + pseudo-step fix                   PPP  F    PP   PFF  S
  + SPSR.SS override fix only         PFF  P    FF   PPP  S
  + both                              PPP  P    PP   PFF  S
  v7.4-rc1                            PPP  P    PP   PFF  S
  + SYSEMU fix, CONFIG_DEBUG_RSEQ=y   PPP  P    PP   PPP  FF
  + rseq fix,   CONFIG_DEBUG_RSEQ=y   PPP  P    PP   PPP  PP
  this series                         PPP  P    PP   PPP  S
  this series, rseq_debug=1           PPP  P    PP   PPP  PP

"SPSR.SS override fix only" is the SPSR.SS override fix cherry-picked
onto the parent of the pseudo-step fix. That combination never existed
in the tree, but it is the state in which the PTRACE_SETREGSET case of
single_step_syscall_stop fails.

Link: https://lore.kernel.org/all/20200710130702.30658-1-will@kernel.org/
Link: https://lore.kernel.org/all/20200524043827.GA33001@juliacomputing.com/
Link: https://lore.kernel.org/all/1eed6d69-d53d-9657-1fc9-c089be07f98c@linaro.org/
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 tools/testing/selftests/arm64/Makefile        |   2 +-
 tools/testing/selftests/arm64/ptrace/Makefile |  12 ++
 .../selftests/arm64/ptrace/ptrace_common.h    | 101 ++++++++++
 .../selftests/arm64/ptrace/rseq_syscall_pc.c  | 130 +++++++++++++
 .../selftests/arm64/ptrace/rseq_syscall_pc.h  |  22 +++
 .../arm64/ptrace/rseq_syscall_pc_asm.S        |  45 +++++
 .../arm64/ptrace/single_step_signal_handler.c | 121 ++++++++++++
 .../arm64/ptrace/single_step_spsr_ss.c        |  79 ++++++++
 .../arm64/ptrace/single_step_syscall_stop.c   | 138 ++++++++++++++
 .../arm64/ptrace/sysemu_singlestep.c          | 172 ++++++++++++++++++
 10 files changed, 821 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/ptrace/Makefile
 create mode 100644 tools/testing/selftests/arm64/ptrace/ptrace_common.h
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.h
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc_asm.S
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_spsr_ss.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/sysemu_singlestep.c

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
index 000000000000..74c250120a2f
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+CFLAGS += -Wall -O2 -g $(KHDR_INCLUDES) -I$(top_srcdir)/tools/include
+
+TEST_GEN_PROGS := single_step_signal_handler \
+		  single_step_spsr_ss \
+		  single_step_syscall_stop \
+		  sysemu_singlestep \
+		  rseq_syscall_pc
+
+include ../../lib.mk
+
+$(OUTPUT)/rseq_syscall_pc: rseq_syscall_pc.c rseq_syscall_pc_asm.S
diff --git a/tools/testing/selftests/arm64/ptrace/ptrace_common.h b/tools/testing/selftests/arm64/ptrace/ptrace_common.h
new file mode 100644
index 000000000000..65454cfbbc42
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/ptrace_common.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Shared helpers for the arm64 ptrace single-step self-tests.
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
+#ifndef PTRACE_SYSEMU_SINGLESTEP
+#define PTRACE_SYSEMU_SINGLESTEP	32
+#endif
+
+/* PSTATE.SS as seen in the saved SPSR (user_pt_regs.pstate) */
+#define PSR_SS_BIT			0x00200000UL
+
+/* Status of a SIGTRAP stop reported for PTRACE_EVENT_SECCOMP */
+#define SECCOMP_STOP_STATUS		(SIGTRAP | (PTRACE_EVENT_SECCOMP << 8))
+
+static inline int tracee_get_regs(pid_t pid, struct user_pt_regs *regs)
+{
+	struct iovec iov = { .iov_base = regs, .iov_len = sizeof(*regs) };
+
+	return ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &iov);
+}
+
+static inline int tracee_set_regs(pid_t pid, struct user_pt_regs *regs)
+{
+	struct iovec iov = { .iov_base = regs, .iov_len = sizeof(*regs) };
+
+	return ptrace(PTRACE_SETREGSET, pid, (void *)NT_PRSTATUS, &iov);
+}
+
+/* Program counter of the tracee (0 on failure). */
+static inline unsigned long tracee_pc(pid_t pid)
+{
+	struct user_pt_regs regs;
+
+	if (tracee_get_regs(pid, &regs) < 0)
+		return 0;
+	return regs.pc;
+}
+
+/* si_code of the signal that caused the current stop (-1 on failure). */
+static inline int tracee_si_code(pid_t pid)
+{
+	siginfo_t si;
+
+	memset(&si, 0, sizeof(si));
+	if (ptrace(PTRACE_GETSIGINFO, pid, 0, &si) < 0)
+		return -1;
+	return si.si_code;
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
+/* Resume the tracee with @req and wait for the next stop. */
+static inline int resume_and_wait(pid_t pid, int req, int sig, int *status)
+{
+	if (ptrace(req, pid, 0, (void *)(long)sig) < 0)
+		return -1;
+	if (waitpid(pid, status, 0) < 0)
+		return -1;
+	return WIFSTOPPED(*status) ? 0 : -1;
+}
+
+/* Stop tracing the tracee and reap it so it does not linger as a zombie. */
+static inline void tracee_kill(pid_t pid)
+{
+	kill(pid, SIGKILL);
+	waitpid(pid, NULL, 0);
+}
+
+#endif /* ARM64_PTRACE_COMMON_H */
diff --git a/tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.c b/tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.c
new file mode 100644
index 000000000000..1281c9c95def
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The rseq debug check on syscall exit must look at the PC the system
+ * call was issued from, not at a PC written by a tracer at the
+ * syscall-exit-stop.
+ *
+ * With rseq debugging enabled (CONFIG_DEBUG_RSEQ, or the rseq_debug= boot
+ * option and /sys/kernel/debug/rseq/debug with generic entry), a system
+ * call issued inside an rseq critical section kills the task with
+ * SIGSEGV. arm64 used to do this check after reporting the
+ * syscall-exit-stop, so a tracer could:
+ *  - hide a system call issued inside the critical section by moving the
+ *    PC out of it, and
+ *  - get a task killed for a system call issued outside the critical
+ *    section by moving the PC into it.
+ *
+ * The test is skipped if rseq debugging is not enabled.
+ */
+#define _GNU_SOURCE
+#include <stdint.h>
+#include <stdio.h>
+#include <sys/rseq.h>
+
+#include <linux/compiler.h>
+
+#include "kselftest.h"
+#include "ptrace_common.h"
+
+#include "rseq_syscall_pc.h"
+
+/* struct rseq_cs must be 32-byte aligned (see linux/rseq.h). */
+static struct rseq_cs cs __aligned(32);
+
+static void *rseq_cs_slot(void)
+{
+	struct rseq *rs = (struct rseq *)((char *)__builtin_thread_pointer() +
+					  __rseq_offset);
+
+	return &rs->rseq_cs;
+}
+
+/*
+ * Run the system call in the child. If @ret_pc is set, trace it with
+ * PTRACE_SYSCALL and write @new_pc at the syscall-exit-stop whose PC is
+ * @ret_pc. Returns the wait status of the child's exit.
+ */
+static int run(bool in_cs, unsigned long ret_pc, unsigned long new_pc)
+{
+	int status, i, sig = 0;
+	pid_t pid;
+
+	pid = fork();
+	if (pid == 0) {
+		if (ret_pc) {
+			if (traceme() < 0)
+				_exit(1);
+			raise(SIGSTOP);
+		}
+		_exit(in_cs ? call_in_cs(rseq_cs_slot(), &cs) :
+			      call_out_of_cs(rseq_cs_slot(), &cs));
+	}
+	if (pid < 0)
+		return -1;
+	if (!ret_pc) {
+		waitpid(pid, &status, 0);
+		return status;
+	}
+
+	if (waitpid(pid, &status, 0) < 0 || !WIFSTOPPED(status))
+		return -1;
+	ptrace(PTRACE_SETOPTIONS, pid, 0,
+	       (void *)(PTRACE_O_TRACESYSGOOD | PTRACE_O_EXITKILL));
+	for (i = 0; i < 10000; i++) {
+		if (resume_and_wait(pid, PTRACE_SYSCALL, sig, &status) < 0)
+			break;
+		sig = 0;
+		if (WSTOPSIG(status) != (SIGTRAP | 0x80)) {
+			sig = WSTOPSIG(status);	/* pass real signals on */
+			continue;
+		}
+		if (syscall_info(pid, NULL) == PTRACE_SYSCALL_INFO_EXIT &&
+		    tracee_pc(pid) == ret_pc) {
+			struct user_pt_regs regs;
+
+			if (tracee_get_regs(pid, &regs) == 0) {
+				regs.pc = new_pc;
+				tracee_set_regs(pid, &regs);
+			}
+		}
+	}
+	return status;
+}
+
+static bool killed_by_segv(int status)
+{
+	return WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV;
+}
+
+int main(void)
+{
+	int status;
+
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	if (__rseq_size == 0)
+		ksft_exit_skip("rseq is not registered by libc\n");
+
+	cs.version = 0;
+	cs.flags = 0;
+	cs.start_ip = (uintptr_t)cs_start;
+	cs.post_commit_offset = (uintptr_t)cs_end - (uintptr_t)cs_start;
+	cs.abort_ip = (uintptr_t)cs_abort;
+
+	/* An untraced system call inside the critical section must be fatal. */
+	status = run(true, 0, 0);
+	if (!killed_by_segv(status))
+		ksft_exit_skip("rseq debugging is not enabled\n");
+
+	status = run(true, (uintptr_t)cs_after_svc, (uintptr_t)cs_end);
+	ksft_test_result(killed_by_segv(status),
+			 "syscall in critical section is caught after the tracer moves the PC out\n");
+
+	status = run(false, (uintptr_t)out_after_svc, (uintptr_t)cs_after_svc);
+	/* exit 42 means the critical section was aborted, which is also fine */
+	ksft_test_result(WIFEXITED(status),
+			 "syscall outside critical section survives the tracer moving the PC in\n");
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.h b/tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.h
new file mode 100644
index 000000000000..975fb883810f
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef RSEQ_SYSCALL_PC_H
+#define RSEQ_SYSCALL_PC_H
+
+/* BRK #0x45E0, the arm64 RSEQ_SIG */
+#define RSEQ_SIG_INSN		0xd428bc00
+
+#ifndef __ASSEMBLER__
+/*
+ * Both functions store @cs into @slot (rseq->rseq_cs) and then issue
+ * getppid(). call_in_cs() does that inside the critical section
+ * [cs_start, cs_end), call_out_of_cs() outside it. Both return 0, or 42
+ * if the critical section was aborted.
+ */
+long call_in_cs(void *slot, void *cs);
+long call_out_of_cs(void *slot, void *cs);
+
+extern char cs_start[], cs_after_svc[], cs_end[], cs_abort[];
+extern char out_after_svc[];
+#endif
+
+#endif /* RSEQ_SYSCALL_PC_H */
diff --git a/tools/testing/selftests/arm64/ptrace/rseq_syscall_pc_asm.S b/tools/testing/selftests/arm64/ptrace/rseq_syscall_pc_asm.S
new file mode 100644
index 000000000000..78452fde3bdf
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/rseq_syscall_pc_asm.S
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Issue a system call from inside and from outside an rseq critical
+ * section, with labels the test uses to check and rewrite the tracee PC.
+ *
+ * x0:	&rseq->rseq_cs
+ * x1:	struct rseq_cs describing [cs_start, cs_end)
+ */
+
+#include <asm/unistd.h>
+
+#include "rseq_syscall_pc.h"
+
+	.text
+
+	.globl	call_in_cs
+call_in_cs:
+	str	x1, [x0]
+	.globl	cs_start
+cs_start:
+	mov	x8, #__NR_getppid
+	svc	#0
+	.globl	cs_after_svc
+cs_after_svc:
+	nop
+	.globl	cs_end
+cs_end:
+	mov	x0, #0
+	ret
+
+	.inst	RSEQ_SIG_INSN
+	.globl	cs_abort
+cs_abort:
+	mov	x0, #42
+	ret
+
+	.globl	call_out_of_cs
+call_out_of_cs:
+	str	x1, [x0]
+	mov	x8, #__NR_getppid
+	svc	#0
+	.globl	out_after_svc
+out_after_svc:
+	mov	x0, #0
+	ret
diff --git a/tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c b/tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
new file mode 100644
index 000000000000..52d89282affd
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PTRACE_SINGLESTEP into a signal handler must stop at the handler entry
+ * without changing how the tracee handles SIGTRAP.
+ *
+ * Before commit ac2081cdc4d9 ("arm64: ptrace: Consistently use
+ * pseudo-singlestep exceptions"), arm64 delivered that stop as a real
+ * hardware step exception. If the tracee had SIGTRAP blocked, the forced
+ * SIGTRAP unblocked it and reset its disposition to SIG_DFL. The fix
+ * reports the stop with the generic pseudo-step, which leaves both alone.
+ *
+ * The tracee blocks SIGTRAP and installs its own SIGTRAP handler; after
+ * stepping into its SIGUSR1 handler, both must be unchanged.
+ */
+#include <sys/mman.h>
+
+#include "kselftest.h"
+#include "ptrace_common.h"
+
+/* Shared with the tracee, which writes it from its signal handler. */
+struct shared {
+	int handler_ran;
+	int trap_blocked;
+	int trap_handler_kept;
+};
+
+static struct shared *sh;
+
+static void trap_handler(int sig)
+{
+	(void)sig;
+}
+
+static void usr1_handler(int sig)
+{
+	sigset_t cur;
+
+	(void)sig;
+	sigprocmask(SIG_BLOCK, NULL, &cur);
+	sh->trap_blocked = sigismember(&cur, SIGTRAP);
+	__atomic_store_n(&sh->handler_ran, 1, __ATOMIC_RELEASE);
+}
+
+static void child(void)
+{
+	struct sigaction sa;
+	sigset_t blk;
+
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_handler = trap_handler;
+	sigaction(SIGTRAP, &sa, NULL);
+	sa.sa_handler = usr1_handler;
+	sigaction(SIGUSR1, &sa, NULL);
+
+	sigemptyset(&blk);
+	sigaddset(&blk, SIGTRAP);
+	sigprocmask(SIG_BLOCK, &blk, NULL);
+
+	if (traceme() < 0)
+		_exit(1);
+	raise(SIGSTOP);
+	while (!__atomic_load_n(&sh->handler_ran, __ATOMIC_ACQUIRE))
+		;
+
+	sigaction(SIGTRAP, NULL, &sa);
+	sh->trap_handler_kept = (sa.sa_handler == trap_handler);
+	_exit(0);
+}
+
+int main(void)
+{
+	unsigned long pc = 0;
+	int status, i, sig = 0;
+	pid_t pid;
+
+	ksft_print_header();
+	ksft_set_plan(3);
+
+	sh = mmap(NULL, sizeof(*sh), PROT_READ | PROT_WRITE,
+		  MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	if (sh == MAP_FAILED)
+		ksft_exit_fail_msg("mmap failed\n");
+
+	pid = fork();
+	if (pid == 0)
+		child();
+	if (pid < 0 || waitpid(pid, &status, 0) < 0 || !WIFSTOPPED(status))
+		ksft_exit_fail_msg("tracee did not stop\n");
+	ptrace(PTRACE_SETOPTIONS, pid, 0, (void *)PTRACE_O_EXITKILL);
+	kill(pid, SIGUSR1);
+
+	/* Step until the SIGUSR1 delivery stop, then step into the handler. */
+	for (i = 0; i < 1000; i++) {
+		if (resume_and_wait(pid, PTRACE_SINGLESTEP, sig, &status) < 0)
+			break;
+		if (sig) {
+			pc = tracee_pc(pid);
+			break;
+		}
+		if (WSTOPSIG(status) == SIGUSR1)
+			sig = SIGUSR1;
+	}
+	ksft_test_result(pc == (unsigned long)usr1_handler,
+			 "stopped at the signal handler entry\n");
+
+	/* Let the tracee finish and report what it saw. */
+	if (ptrace(PTRACE_CONT, pid, 0, 0) == 0)
+		waitpid(pid, &status, 0);
+	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0) {
+		tracee_kill(pid);
+		ksft_test_result_fail("tracee did not exit normally\n");
+		ksft_test_result_skip("SIGTRAP disposition not checked\n");
+		ksft_finished();
+	}
+	ksft_test_result(sh->trap_blocked,
+			 "SIGTRAP is still blocked in the handler\n");
+	ksft_test_result(sh->trap_handler_kept,
+			 "SIGTRAP handler was not reset to SIG_DFL\n");
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/arm64/ptrace/single_step_spsr_ss.c b/tools/testing/selftests/arm64/ptrace/single_step_spsr_ss.c
new file mode 100644
index 000000000000..a51baca61bf4
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/single_step_spsr_ss.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Clearing SPSR.SS through PTRACE_SETREGSET must not stop
+ * PTRACE_SINGLESTEP from executing the instruction at the PC.
+ *
+ * GDB does this when it reverse-steps: it writes back the saved pstate,
+ * which has SS clear. Before commit 3a5a4366cecc ("arm64: ptrace:
+ * Override SPSR.SS when single-stepping is enabled"), the step then
+ * started in the active-pending state: the step exception was taken
+ * before the instruction ran, so the PC did not move but the tracer
+ * still got a SIGTRAP.
+ */
+#include "kselftest.h"
+#include "ptrace_common.h"
+
+extern char step_start[], step_next[];
+
+static void child(void)
+{
+	if (traceme() < 0)
+		_exit(1);
+	raise(SIGSTOP);
+	asm volatile(".globl step_start, step_next\n"
+		     "step_start:\n"
+		     "nop\n"
+		     "step_next:\n"
+		     "nop\n nop\n nop\n");
+	_exit(0);
+}
+
+int main(void)
+{
+	struct user_pt_regs regs;
+	unsigned long pc = 0;
+	int status, i;
+	pid_t pid;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	pid = fork();
+	if (pid == 0)
+		child();
+	if (pid < 0 || waitpid(pid, &status, 0) < 0 || !WIFSTOPPED(status))
+		ksft_exit_fail_msg("tracee did not stop\n");
+	ptrace(PTRACE_SETOPTIONS, pid, 0, (void *)PTRACE_O_EXITKILL);
+
+	/* Single-step until the tracee is at step_start. */
+	for (i = 0; i < 100000; i++) {
+		if (resume_and_wait(pid, PTRACE_SINGLESTEP, 0, &status) < 0)
+			break;
+		pc = tracee_pc(pid);
+		if (pc == (unsigned long)step_start)
+			break;
+	}
+	if (pc != (unsigned long)step_start) {
+		tracee_kill(pid);
+		ksft_exit_fail_msg("did not reach step_start\n");
+	}
+
+	/* Write the registers back with SS clear, as a reverse step does. */
+	if (tracee_get_regs(pid, &regs) < 0)
+		ksft_exit_fail_msg("PTRACE_GETREGSET failed\n");
+	regs.pstate &= ~PSR_SS_BIT;
+	if (tracee_set_regs(pid, &regs) < 0)
+		ksft_exit_fail_msg("PTRACE_SETREGSET failed\n");
+
+	pc = 0;
+	if (resume_and_wait(pid, PTRACE_SINGLESTEP, 0, &status) == 0)
+		pc = tracee_pc(pid);
+	tracee_kill(pid);
+
+	if (pc == (unsigned long)step_start)
+		ksft_print_msg("PC did not move\n");
+	ksft_test_result(pc == (unsigned long)step_next,
+			 "single-step executes one instruction after SPSR.SS is cleared\n");
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c b/tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
new file mode 100644
index 000000000000..88b96f234e55
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PTRACE_SINGLESTEP across a system call that takes a ptrace stop while it
+ * is in progress (here a PTRACE_EVENT_SECCOMP stop) must stop at the
+ * return address of the SVC before any further instruction runs, so that
+ * the tracer can look at the result of the system call.
+ *
+ * Before commit ac2081cdc4d9 ("arm64: ptrace: Consistently use
+ * pseudo-singlestep exceptions"), the first stop after the seccomp stop
+ * came one instruction later when stepping was enabled at the seccomp
+ * stop: the hardware step needs one instruction to complete. The fix
+ * reports a pseudo-step at the SVC return address instead.
+ *
+ * The pseudo-step also covers a register write at the seccomp stop:
+ * since commit 3a5a4366cecc ("arm64: ptrace: Override SPSR.SS when
+ * single-stepping is enabled"), PTRACE_SETREGSET sets SPSR.SS, which
+ * discards the step left pending by the SVC.
+ *
+ * Both ways to get there are tested:
+ *  - continue to the seccomp stop, then single-step;
+ *  - single-step into the SVC, rewrite the registers at the seccomp stop,
+ *    then single-step.
+ */
+#include <stddef.h>
+#include <sys/prctl.h>
+#include <sys/syscall.h>
+
+#include <linux/filter.h>
+#include <linux/seccomp.h>
+
+#include "kselftest.h"
+#include "ptrace_common.h"
+
+extern char after_svc[];
+
+static void child(void)
+{
+	struct sock_filter filter[] = {
+		BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
+			 offsetof(struct seccomp_data, nr)),
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, SYS_getegid, 0, 1),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_TRACE),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
+	};
+	struct sock_fprog prog = {
+		.len = (unsigned short)ARRAY_SIZE(filter),
+		.filter = filter,
+	};
+
+	if (traceme() < 0)
+		_exit(1);
+	if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0) < 0 ||
+	    prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog) < 0)
+		_exit(2);
+	raise(SIGSTOP);
+	/* svc, then a label right after it and a few NOPs to step over */
+	asm volatile("mov x8, %0\n"
+		     "svc #0\n"
+		     ".globl after_svc\n"
+		     "after_svc:\n"
+		     "nop\n nop\n nop\n nop\n"
+		     : : "i" (SYS_getegid) : "x0", "x8", "memory");
+	_exit(0);
+}
+
+/*
+ * @step_in: single-step into the SVC (true) or continue to it (false).
+ * Returns the PC of the first stop after the seccomp stop, 0 on error.
+ */
+static unsigned long first_stop_after_seccomp(bool step_in)
+{
+	unsigned long pc = 0;
+	int status, i;
+	pid_t pid;
+
+	pid = fork();
+	if (pid == 0)
+		child();
+	if (pid < 0 || waitpid(pid, &status, 0) < 0 || !WIFSTOPPED(status))
+		return 0;
+	if (ptrace(PTRACE_SETOPTIONS, pid, 0,
+		   (void *)(PTRACE_O_TRACESECCOMP | PTRACE_O_EXITKILL)) < 0)
+		goto out;
+
+	/* Run to the seccomp stop of the SVC at after_svc - 4. */
+	for (i = 0; i < 100000; i++) {
+		if (resume_and_wait(pid, step_in ? PTRACE_SINGLESTEP : PTRACE_CONT,
+				    0, &status) < 0)
+			goto out;
+		if ((status >> 8) == SECCOMP_STOP_STATUS)
+			break;
+	}
+	if ((status >> 8) != SECCOMP_STOP_STATUS)
+		goto out;
+
+	if (step_in) {
+		struct user_pt_regs regs;
+
+		/* Any register write goes through valid_user_regs(). */
+		if (tracee_get_regs(pid, &regs) < 0 ||
+		    tracee_set_regs(pid, &regs) < 0)
+			goto out;
+	}
+
+	if (resume_and_wait(pid, PTRACE_SINGLESTEP, 0, &status) < 0 ||
+	    WSTOPSIG(status) != SIGTRAP)
+		goto out;
+	pc = tracee_pc(pid);
+out:
+	tracee_kill(pid);
+	return pc;
+}
+
+static void check(bool step_in, const char *name)
+{
+	unsigned long pc = first_stop_after_seccomp(step_in);
+
+	if (!pc) {
+		ksft_test_result_fail("%s: test setup failed\n", name);
+		return;
+	}
+	if (pc != (unsigned long)after_svc)
+		ksft_print_msg("%s: stopped at after_svc%+ld\n", name,
+			       (long)(pc - (unsigned long)after_svc));
+	ksft_test_result(pc == (unsigned long)after_svc,
+			 "%s: first stop is at the SVC return address\n", name);
+}
+
+int main(void)
+{
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	check(false, "continue to seccomp stop, then step");
+	check(true, "step into seccomp stop, write regs, then step");
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/arm64/ptrace/sysemu_singlestep.c b/tools/testing/selftests/arm64/ptrace/sysemu_singlestep.c
new file mode 100644
index 000000000000..903e21e45429
--- /dev/null
+++ b/tools/testing/selftests/arm64/ptrace/sysemu_singlestep.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PTRACE_SYSEMU_SINGLESTEP over a system call.
+ *
+ * ptrace(2) says the emulated system call is reported by the
+ * syscall-enter-stop alone ("If the tracee is continued using any other
+ * method (including PTRACE_SYSEMU), no syscall-exit-stop occurs"), and the
+ * next resume must single-step the following instruction.
+ *
+ * Commit ac2081cdc4d9 ("arm64: ptrace: Consistently use pseudo-singlestep
+ * exceptions") added a pseudo-step SIGTRAP (si_code SI_USER) on every
+ * syscall exit with stepping enabled, including the emulated one. That
+ * gives the tracer an extra stop at the SVC return address before any
+ * instruction runs.
+ *
+ * Tests:
+ *  - no syscall-exit-stop for the emulated system call;
+ *  - no pseudo-step stop after the syscall-enter-stop;
+ *  - after resuming a PTRACE_EVENT_SECCOMP stop with
+ *    PTRACE_SYSEMU_SINGLESTEP, the first stop is not a pseudo-step.
+ */
+#include <stddef.h>
+#include <sys/prctl.h>
+#include <sys/syscall.h>
+
+#include <linux/filter.h>
+#include <linux/seccomp.h>
+
+#include "kselftest.h"
+#include "ptrace_common.h"
+
+extern char emu_after_svc[], secc_after_svc[];
+
+#define SI_USER_CODE	0	/* SI_USER, used by the pseudo-step */
+
+static void child_emulated(void)
+{
+	if (traceme() < 0)
+		_exit(1);
+	raise(SIGSTOP);
+	/* svc, then a label right after it and a few NOPs to step over */
+	asm volatile("mov x8, %0\n"
+		     "svc #0\n"
+		     ".globl emu_after_svc\n"
+		     "emu_after_svc:\n"
+		     "nop\n nop\n nop\n nop\n"
+		     : : "i" (SYS_getpid) : "x0", "x8", "memory");
+	_exit(0);
+}
+
+/*
+ * Single-step with PTRACE_SYSEMU_SINGLESTEP up to the emulated getpid()
+ * and two stops past it. Reports whether a syscall-exit-stop or a
+ * pseudo-step stop was seen after the syscall-enter-stop.
+ */
+static int run_emulated(bool *saw_exit, bool *saw_pseudo)
+{
+	int status, i, after = -1;
+	pid_t pid;
+
+	*saw_exit = *saw_pseudo = false;
+	pid = fork();
+	if (pid == 0)
+		child_emulated();
+	if (pid < 0 || waitpid(pid, &status, 0) < 0 || !WIFSTOPPED(status))
+		return -1;
+	ptrace(PTRACE_SETOPTIONS, pid, 0,
+	       (void *)(PTRACE_O_TRACESYSGOOD | PTRACE_O_EXITKILL));
+
+	for (i = 0; i < 100000 && after != 0; i++) {
+		long nr = -1;
+		int op;
+
+		if (resume_and_wait(pid, PTRACE_SYSEMU_SINGLESTEP, 0, &status) < 0)
+			break;
+		op = syscall_info(pid, &nr);
+		if (after < 0) {
+			if (op == PTRACE_SYSCALL_INFO_ENTRY && nr == SYS_getpid &&
+			    tracee_pc(pid) == (unsigned long)emu_after_svc)
+				after = 2;
+			continue;
+		}
+		if (op == PTRACE_SYSCALL_INFO_EXIT)
+			*saw_exit = true;
+		if (WSTOPSIG(status) == SIGTRAP &&
+		    tracee_si_code(pid) == SI_USER_CODE)
+			*saw_pseudo = true;
+		after--;
+	}
+	tracee_kill(pid);
+	return after == 0 ? 0 : -1;
+}
+
+static void child_seccomp(void)
+{
+	struct sock_filter filter[] = {
+		BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
+			 offsetof(struct seccomp_data, nr)),
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, SYS_getegid, 0, 1),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_TRACE),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
+	};
+	struct sock_fprog prog = {
+		.len = (unsigned short)ARRAY_SIZE(filter),
+		.filter = filter,
+	};
+
+	if (traceme() < 0)
+		_exit(1);
+	if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0) < 0 ||
+	    prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog) < 0)
+		_exit(2);
+	raise(SIGSTOP);
+	/* svc, then a label right after it and a few NOPs to step over */
+	asm volatile("mov x8, %0\n"
+		     "svc #0\n"
+		     ".globl secc_after_svc\n"
+		     "secc_after_svc:\n"
+		     "nop\n nop\n nop\n nop\n"
+		     : : "i" (SYS_getegid) : "x0", "x8", "memory");
+	_exit(0);
+}
+
+/* si_code of the first stop after resuming the seccomp stop, -1 on error */
+static int run_seccomp(void)
+{
+	int status, code = -1;
+	pid_t pid;
+
+	pid = fork();
+	if (pid == 0)
+		child_seccomp();
+	if (pid < 0 || waitpid(pid, &status, 0) < 0 || !WIFSTOPPED(status))
+		return -1;
+	ptrace(PTRACE_SETOPTIONS, pid, 0,
+	       (void *)(PTRACE_O_TRACESECCOMP | PTRACE_O_EXITKILL));
+	if (resume_and_wait(pid, PTRACE_CONT, 0, &status) == 0 &&
+	    (status >> 8) == SECCOMP_STOP_STATUS &&
+	    resume_and_wait(pid, PTRACE_SYSEMU_SINGLESTEP, 0, &status) == 0 &&
+	    WSTOPSIG(status) == SIGTRAP)
+		code = tracee_si_code(pid);
+	tracee_kill(pid);
+	return code;
+}
+
+int main(void)
+{
+	bool saw_exit, saw_pseudo;
+	int code;
+
+	ksft_print_header();
+	ksft_set_plan(3);
+
+	if (run_emulated(&saw_exit, &saw_pseudo) < 0) {
+		ksft_test_result_fail("emulated syscall: test setup failed\n");
+		ksft_test_result_fail("emulated syscall: test setup failed\n");
+	} else {
+		ksft_test_result(!saw_exit,
+				 "emulated syscall has no syscall-exit-stop\n");
+		ksft_test_result(!saw_pseudo,
+				 "emulated syscall has no pseudo-step stop\n");
+	}
+
+	code = run_seccomp();
+	if (code < 0)
+		ksft_test_result_fail("seccomp stop: test setup failed\n");
+	else
+		ksft_test_result(code != SI_USER_CODE,
+				 "no pseudo-step after resuming a seccomp stop with PTRACE_SYSEMU_SINGLESTEP\n");
+
+	ksft_finished();
+}
-- 
2.34.1


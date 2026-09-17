Received: from mta0.migadu.com (out-107.mta0.migadu.com [91.218.175.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F6B4B0E26
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 23:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686603; cv=none; b=lkBQ5u7PbozeksrlRJnnrP8eF1vGka2EYlx+xI2YaNJmi5YKG1RJYHPvF0slyouAk6V/fydZXOsSIpctSgp+SulTWKgA2TvcDjTl51cUj3XpbIH0MhGt7aZjTjmKjPMnyMixEo8QiMFZsj+0Lsln3Mr9EL9DEFUnUI1ufYWx1GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686603; c=relaxed/simple;
	bh=oFNZnroysglcMzj8u+xfoACOnRUzQ/KsuJn2dxzUMR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QGyxrjJnyMOp2jseViKFmkanLiGLrcaT8RTdhBnJay/4pnOOM3tE4sPYv3ZSvKnFAGmu+VeBLKq3SjgSGd60S8rdimM2bMClJ3Tn8FKQvzYcMVUD4hOPnLrj5PhOkN43t0eH6rubGQiqdoh2K2w6bNzWLuT974UvYYTTZq7XEhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VoeaAR//; arc=none smtp.client-ip=91.218.175.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VoeaAR//"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oFNZnroysglcMzj8u+xfoACOnRUzQ/KsuJn2dxzUMR8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789686588; v=1; x=1790291388;
 b=VoeaAR//fQudthjcqsK2u1hnV4AdsPfcodFmkNJIjgE9h7g0Tb99MxAA4H3+oxk5ZzZ9f8h2
 OPsYnJ7SwimMoWTcH5clgDLXPbyB48l+HUW7rjb65VWkXWhyRDWrZcXKIqwSotyCihA30QLwgxF
 AV0SSZ6wAQHdAKq+FEy0AycE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f227167076898fad;
	Thu, 17 Sep 2026 23:09:48 +0000
X-Mizu-Trace-ID: f227167076898fad
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Xin Li <xin@zytor.com>,
	hpa@zytor.com
Cc: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Paul Gofman <pgofman@codeweavers.com>,
	Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 2/2] selftests/x86: Check signal state for rejected software interrupts
Date: Thu, 17 Sep 2026 16:09:07 -0700
Message-ID: <20260917230907.2080792-3-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917230907.2080792-1-matthew.schwartz@linux.dev>
References: <20260917230907.2080792-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test of the signal ABI for INT instructions in both 32-bit and
64-bit processes. Check the signal number, trap number, error code,
si_code, si_addr, instruction pointer and RF/TF state against legacy
IDT behavior. Include a 15-byte prefixed INT to check that IP uses the
hardware instruction length. Exercise both INT3 encodings, INT4, UD2
and HLT to cover the unchanged trap and fault paths.

Run each instruction with TF clear and set. Resume at a known NOP after
handling the signal and check that single-stepping traps after the NOP.

Also drive INT 0x2d under ptrace, which resumes through the fault frame
rather than sigreturn and so exposes a stale FRED software event flag.
Start from an INT3 stop, whose FRED frame has no software event flag,
instead of the syscall frame of raise(SIGSTOP). Single-step into the INT
and check that the fault reports its address. Then suppress SIGSEGV and
resume at the NOP, once with PTRACE_SINGLESTEP and once with PTRACE_CONT
and TF set. Section 6.2.3 of the Intel FRED specification [1] specifies
the immediate single-step trap caused by returning with both that flag
and TF set. Check that each trap occurs after the NOP, rather than at
its address.

Report whether the CPU supports FRED, since a pass looks the same on
either entry path. INT 0x80 with IA32 emulation disabled and a 64-bit
tracer of a 32-bit tracee are not covered.

Both variants pass all 29 checks on a non-FRED AMD host and on Panther
Lake with FRED enabled and the fix applied. With the same binaries on
unpatched Panther Lake, 16 signal-context checks fail and the first
ptrace check reports the IP after the INT. The two dependent ptrace
resume checks are not reached.

[1] Intel Flexible Return and Event Delivery (FRED) Specification,
revision 9.0 (346446-009US), section 6.2.3.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Link: https://cdrdv2.intel.com/v1/dl/getContent/678938 # [1]
---
 tools/testing/selftests/x86/Makefile     |   2 +-
 tools/testing/selftests/x86/int_signal.c | 311 +++++++++++++++++++++++
 2 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/x86/int_signal.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 434065215d12..d478b13cc8d5 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -13,7 +13,7 @@ CAN_BUILD_WITH_NOPIE := $(shell ./check_cc.sh "$(CC)" trivial_program.c -no-pie)
 TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt test_mremap_vdso \
 			check_initial_reg_state sigreturn iopl ioperm \
 			test_vsyscall mov_ss_trap sigtrap_loop \
-			syscall_arg_fault fsgsbase_restore sigaltstack
+			syscall_arg_fault fsgsbase_restore sigaltstack int_signal
 TARGETS_C_BOTHBITS += nx_stack
 TARGETS_C_32BIT_ONLY := entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
diff --git a/tools/testing/selftests/x86/int_signal.c b/tools/testing/selftests/x86/int_signal.c
new file mode 100644
index 000000000000..22676dac72b5
--- /dev/null
+++ b/tools/testing/selftests/x86/int_signal.c
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Check the signal context for INT instructions with IDT and FRED entry. */
+#define _GNU_SOURCE
+
+#include <cpuid.h>
+#include <errno.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <sys/ptrace.h>
+#include <sys/user.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include <ucontext.h>
+
+#include "helpers.h"
+
+#ifdef __x86_64__
+#define REG_IP REG_RIP
+#define USER_IP rip
+#define STACK_PTR "%rsp"
+#else
+#define REG_IP REG_EIP
+#define USER_IP eip
+#define STACK_PTR "%esp"
+#endif
+
+/*
+ * Each instruction has normal and single-step entry points. Resume at the
+ * NOP after handling its signal, then expect a trace trap after that NOP
+ * when TF is set. Explicit labels avoid assuming the kernel's saved IP.
+ */
+#define PROBE(name, insn) \
+	extern void name(void); \
+	extern void name##_tf(void); \
+	extern const char name##_end[], name##_step[]; \
+	asm(".pushsection .text\n" \
+	    ".globl " #name "_tf\n" \
+	    ".type " #name "_tf, @function\n" \
+	    #name "_tf:\n" \
+	    "pushf\n" \
+	    "orl $0x100, (" STACK_PTR ")\n" \
+	    "popf\n" \
+	    ".globl " #name "\n" \
+	    ".type " #name ", @function\n" \
+	    #name ":\n" insn "\n" \
+	    ".globl " #name "_end\n" \
+	    #name "_end:\nnop\n" \
+	    ".globl " #name "_step\n" \
+	    #name "_step:\nret\n" \
+	    ".size " #name ", .-" #name "\n" \
+	    ".size " #name "_tf, .-" #name "_tf\n" \
+	    ".popsection\n")
+
+PROBE(int1, ".byte 0xcd, 0x01");
+PROBE(int29, ".byte 0xcd, 0x29");
+PROBE(int2c, ".byte 0xcd, 0x2c");
+PROBE(int2d, ".byte 0xcd, 0x2d");
+PROBE(prefixed_int2d, ".byte 0x66, 0xcd, 0x2d");
+PROBE(long_int2d, ".fill 13, 1, 0x2e\n.byte 0xcd, 0x2d");
+PROBE(int81, ".byte 0xcd, 0x81");
+PROBE(intff, ".byte 0xcd, 0xff");
+PROBE(short_int3, ".byte 0xcc");
+PROBE(long_int3, ".byte 0xcd, 0x03");
+PROBE(int4, ".byte 0xcd, 0x04");
+PROBE(ud2, ".byte 0x0f, 0x0b");
+PROBE(hlt, ".byte 0xf4");
+
+struct test {
+	const char *name;
+	void (*run)(void);
+	void (*run_tf)(void);
+	const char *end, *step;
+	int signo, trap, error, ip_offset, flags, code;
+};
+
+#define TEST(name, sig, trap, error, offset, flags, code) \
+	{ #name, name, name##_tf, name##_end, name##_step, \
+	  sig, trap, error, offset, flags, code }
+
+#define GP(name, error) \
+	TEST(name, SIGSEGV, 13, error, 0, X86_EFLAGS_RF, SI_KERNEL)
+
+static const struct test tests[] = {
+	GP(int1, 0x00a),
+	GP(int29, 0x14a),
+	GP(int2c, 0x162),
+	GP(int2d, 0x16a),
+	GP(prefixed_int2d, 0x16a),
+	GP(long_int2d, 0x16a),
+	GP(int81, 0x40a),
+	GP(intff, 0x7fa),
+	GP(hlt, 0),
+	TEST(short_int3, SIGTRAP, 3, 0, 1, 0, SI_KERNEL),
+	TEST(long_int3, SIGTRAP, 3, 0, 2, 0, SI_KERNEL),
+	TEST(int4, SIGSEGV, 4, 0, 2, 0, SI_KERNEL),
+	TEST(ud2, SIGILL, 6, 0, 0, X86_EFLAGS_RF, ILL_ILLOPN),
+};
+
+static const struct test *active;
+static volatile sig_atomic_t seen, signo, trap, error, ip_offset, flags;
+static volatile sig_atomic_t code, addr_ok, single_step, stepped, step_ok;
+
+static void handler(int sig, siginfo_t *info, void *context)
+{
+	ucontext_t *uc = context;
+	uintptr_t ip = uc->uc_mcontext.gregs[REG_IP];
+	uintptr_t start = (uintptr_t)active->run;
+	uintptr_t end = (uintptr_t)active->end;
+
+	if (seen && single_step && sig == SIGTRAP) {
+		if (stepped++) {
+			ksft_print_msg("%s: second trace trap at %#lx\n",
+				       active->name, (unsigned long)ip);
+			_exit(KSFT_FAIL);
+		}
+		step_ok = ip == (uintptr_t)active->step &&
+			uc->uc_mcontext.gregs[REG_TRAPNO] == 1 &&
+			info->si_code == TRAP_TRACE;
+		uc->uc_mcontext.gregs[REG_EFL] &= ~X86_EFLAGS_TF;
+		return;
+	}
+
+	if (seen || ip < start || ip > end) {
+		ksft_print_msg("%s: unexpected signal %d at %#lx\n",
+			       active->name, sig, (unsigned long)ip);
+		_exit(KSFT_FAIL);
+	}
+
+	signo = sig;
+	trap = uc->uc_mcontext.gregs[REG_TRAPNO];
+	error = uc->uc_mcontext.gregs[REG_ERR];
+	ip_offset = ip - start;
+	flags = uc->uc_mcontext.gregs[REG_EFL] & (X86_EFLAGS_RF | X86_EFLAGS_TF);
+	code = info->si_code;
+	/* force_sig() reports no address, force_sig_fault() reports the IP. */
+	addr_ok = info->si_addr == (code == SI_KERNEL ? NULL : (void *)ip);
+	seen = 1;
+	uc->uc_mcontext.gregs[REG_IP] = end;
+}
+
+static void wait_for_child(pid_t child, int *status)
+{
+	pid_t ret;
+
+	do {
+		ret = waitpid(child, status, 0);
+	} while (ret < 0 && errno == EINTR);
+	if (ret != child)
+		ksft_exit_fail_perror("waitpid");
+}
+
+/* Resume the tracee and check where the next stop lands. */
+static bool resume_to(pid_t child, int *status, int request, int sig,
+		      const void *ip, const char *what)
+{
+	struct user_regs_struct regs;
+
+	if (ptrace(request, child, 0, 0))
+		return false;
+	wait_for_child(child, status);
+	if (!WIFSTOPPED(*status)) {
+		ksft_print_msg("%s: tracee did not stop\n", what);
+		return false;
+	}
+	if (WSTOPSIG(*status) != sig) {
+		ksft_print_msg("%s: stopped with signal %d, expected %d\n",
+			       what, WSTOPSIG(*status), sig);
+		return false;
+	}
+	if (ptrace(PTRACE_GETREGS, child, 0, &regs))
+		return false;
+	if ((unsigned long)regs.USER_IP != (unsigned long)ip) {
+		ksft_print_msg("%s: stopped at %#lx, expected %#lx\n", what,
+			       (unsigned long)regs.USER_IP, (unsigned long)ip);
+		return false;
+	}
+	return true;
+}
+
+static bool set_ip(pid_t child, const void *ip, bool tf)
+{
+	struct user_regs_struct regs;
+
+	if (ptrace(PTRACE_GETREGS, child, 0, &regs))
+		return false;
+	regs.USER_IP = (unsigned long)ip;
+	if (tf)
+		regs.eflags |= X86_EFLAGS_TF;
+	return !ptrace(PTRACE_SETREGS, child, 0, &regs);
+}
+
+/*
+ * Exercise the tracer paths that resume through the fault frame rather than
+ * sigreturn. A stale FRED software event flag on that frame traps before the
+ * NOP executes instead of after it.
+ */
+static void test_ptrace(void)
+{
+	bool into = false, step = false, cont = false;
+	pid_t child;
+	int status;
+
+	child = fork();
+	if (child < 0)
+		ksft_exit_fail_perror("fork");
+	if (!child) {
+		if (ptrace(PTRACE_TRACEME, 0, 0, 0))
+			_exit(KSFT_FAIL);
+		/* Start from a breakpoint frame, not the syscall frame of raise(). */
+		asm volatile("int3");
+		_exit(KSFT_FAIL);
+	}
+
+	wait_for_child(child, &status);
+	if (!WIFSTOPPED(status) || WSTOPSIG(status) != SIGTRAP)
+		goto out;
+	if (ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_EXITKILL))
+		goto out;
+
+	/* Single-step into the INT. The fault must report the INT's address. */
+	if (!set_ip(child, int2d, false))
+		goto out;
+	into = resume_to(child, &status, PTRACE_SINGLESTEP, SIGSEGV, int2d,
+			 "single-step into INT");
+	if (!into)
+		goto out;
+
+	/* Suppress SIGSEGV and single-step the NOP. */
+	if (!set_ip(child, int2d_end, false))
+		goto out;
+	step = resume_to(child, &status, PTRACE_SINGLESTEP, SIGTRAP, int2d_step,
+			 "single-step after INT");
+	if (!step)
+		goto out;
+
+	/* Fault again, then suppress SIGSEGV and continue with TF set. */
+	if (!set_ip(child, int2d, false))
+		goto out;
+	if (!resume_to(child, &status, PTRACE_CONT, SIGSEGV, int2d,
+		       "continue to INT"))
+		goto out;
+	if (!set_ip(child, int2d_end, true))
+		goto out;
+	cont = resume_to(child, &status, PTRACE_CONT, SIGTRAP, int2d_step,
+			 "continue with TF after INT");
+out:
+	if (WIFSTOPPED(status)) {
+		kill(child, SIGKILL);
+		wait_for_child(child, &status);
+	}
+	ksft_test_result(into, "ptrace single-step into INT faults at the INT\n");
+	ksft_test_result(step, "ptrace single-step after suppressing SIGSEGV\n");
+	ksft_test_result(cont, "ptrace continue with TF after suppressing SIGSEGV\n");
+}
+
+static bool cpu_has_fred(void)
+{
+	unsigned int eax, ebx, ecx, edx;
+
+	if (__get_cpuid_max(0, NULL) < 7)
+		return false;
+	__cpuid_count(7, 1, eax, ebx, ecx, edx);
+	return eax & (1 << 17);
+}
+
+int main(void)
+{
+	unsigned int i, tf;
+	int expected_flags, ok;
+
+	ksft_print_header();
+	ksft_set_plan(2 * ARRAY_SIZE(tests) + 3);
+	ksft_print_msg("CPU %s FRED\n", cpu_has_fred() ? "supports" : "lacks");
+	sethandler(SIGSEGV, handler, 0);
+	sethandler(SIGTRAP, handler, 0);
+	sethandler(SIGILL, handler, 0);
+
+	for (tf = 0; tf < 2; tf++) {
+		for (i = 0; i < ARRAY_SIZE(tests); i++) {
+			active = &tests[i];
+			single_step = tf;
+			seen = signo = trap = error = ip_offset = flags = 0;
+			code = addr_ok = stepped = step_ok = 0;
+			expected_flags = active->flags | (tf ? X86_EFLAGS_TF : 0);
+			if (tf)
+				active->run_tf();
+			else
+				active->run();
+
+			ok = seen && signo == active->signo && trap == active->trap &&
+				error == active->error && ip_offset == active->ip_offset &&
+				flags == expected_flags && code == active->code && addr_ok &&
+				(!tf || (stepped && step_ok));
+			ksft_test_result(ok, "%s%s\n", active->name, tf ? " with TF" : "");
+			if (!ok) {
+				ksft_print_msg("got signal=%d trap=%d error=%#x ip=%d\n",
+					       signo, trap, error, ip_offset);
+				ksft_print_msg("got flags=%#x code=%d addr_ok=%d step_ok=%d\n",
+					       flags, code, addr_ok, step_ok);
+				ksft_print_msg("expected signal=%d trap=%d error=%#x ip=%d\n",
+					       active->signo, active->trap, active->error,
+					       active->ip_offset);
+				ksft_print_msg("expected flags=%#x code=%d\n",
+					       expected_flags, active->code);
+			}
+		}
+	}
+	test_ptrace();
+	ksft_finished();
+}
-- 
2.55.0


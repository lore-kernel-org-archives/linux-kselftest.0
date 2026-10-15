Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCDE3DA5A0
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 02:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031523; cv=none; b=reiUwizYnkrgUpbthoBr0ZWjbrB3yuYFYcZm2KLsagTgxNs2Mwcsfr3WeoqDIz9DVxqISIyVYqHONqPhMmYG8B7qe/yrgQ2m98DHCpeHq+yOBJC6We84uWTwX4nN9+odOpJugKOTMAN+aYqtnKmhzCyu07RXPcAlOH7VQHHnU34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031523; c=relaxed/simple;
	bh=ArleLi+M0DTEuyIN0wh/cYS0LQN9Nt9cd9Uku2IW92w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jS2hNkTPjHC1rRiJmKtngFmLYlzdWgRaYP0KAvcucNqDwr2N4E9DKx8Wg80NrL5rpzqEf63KK2PF/4xKo+cOTmwuNWhC6upiFL2vc1Ft73/qAOVgJHdGVzlDwQ+e89F5Es9IviuubD5fhU4j4t1OHBl9319zLrY5SeX712UHsjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMlaKtZp; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMlaKtZp"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1438d9363fbso482255c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 19:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792031520; x=1792636320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIr3KE4wiTOmPi/gWE/VmNTTSQBWIApFS/4c+uSZ+C0=;
        b=DMlaKtZpQFcvq5gg51QwmfHk+YS4f64KXoabLsnoVptxKs6t6TNjG73VIuyJXv5+ab
         DChYDCkJAAoGWs9oKgRKg1gq+7auesp1rgD8tdmzWrAOgaIWa4pruKma2ZEVGl4Ekx3B
         kAu392UiI9aKIwpvdLzWJoK+2CoFiqAvPDEC0eUWU4bKUWFUTkAOLUNDfwhp4iD/EhI7
         ZV2pmKnincrqUOBc3J7oodQM4nspGE3SXb6WjyYqAgRh7dMEyHqERPVUjqWPGWZeAPnU
         SbLxb7zQ/0TNIuUcYBtRc8Dv3Q1D39KUR+knyez+XGNLYKVfYrvlgk3SSKh+IzuJdx1i
         EC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031520; x=1792636320;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIr3KE4wiTOmPi/gWE/VmNTTSQBWIApFS/4c+uSZ+C0=;
        b=E49NJ2r639/1CQ2NzXjhwo+4BAd5jQVEBYYftbUOI++dCmErEKdULSN53T30PozXcX
         kuZoQbo2q9krtLbYTaSJ+jd5hRVligcSC3W3d12NbIV8NfngKSWID2lRmLqGL3nyLM0z
         OTALG0DfJ0bNtUChIxOixjk4gMMY0S/1vSLQA6+q5rP7DqbpTF0tkXT1ln2p8+mGt4Xp
         XEub3Kwho3Ub9MrWx7hyzlzYHigngLllrEP2EOkhXGFrgSxbF8nD41ggOuix9Eadby5f
         wrjLU4UgultGjSDVozMb05vcVIbenGWcSjCtU6RfDVNR3R+bAcQqZc1EX1XgLnPMc+bA
         TfkA==
X-Forwarded-Encrypted: i=1; AKwUvBwwkZVqrquZbp2qxyB0HyZMUI7WiTOsNdQgx6LL8eZFFn8mIMc3hdQX0XlGa6PNPfjkK4wdfqe/BrlVP4qubJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMY9rSJAkl9Rw6yjjO2vStdVv5uyK9Jlotkk0pJBSUl710n6nC
	kfacFwukQej8ukTUuoVBz/64q0IMJb2OxIoZ9MdB9wDaTdNdK4cpKsVi
X-Gm-Gg: AYBFou0EjWId2YwfDSWSxhXIgAiawsAFWhsw6/Z4qMtFegwuPRM1XWJD726RiDH7r47
	Use8/yjV6gqHlqmpt2IUm83x0oPsdcFn2xUkYdk9OgDx+//+C8PSn3NA4hfOgJKAaNpm02cV31g
	qmsn0n+fPaae8KEchiJNM0GJCfvXGSYay9H6CkHeADPazzj/juL4XyfqhSqAKEv9FRj512pX2rH
	ZnbjMqOTrNhJfUDvtx+Y2LIAEuPO9G0LXXztOlp7u0lOM39TvGGvEt82lSqmHuBnSsXeivG3G3R
	IhV8jDnjh3Lev9p4NdBFKxX+5dcfwz1ckA3yg1bi66/C4tmfmmBRVMUNTs2ymUgtnXGUIjWCIyO
	I0bq5ckSVWl1dPETFwbtelYyTY8W/jtPKwK9mp3/ZrHIBGiEpUdaUfyCymU/1dU7RMrU/pCPbii
	tMVXGcfiWgXeSHSKaSDCuctD1JdT7gH88CVQkeBRRRCxHzuuZ1CRXGcRxKvdVeb8M/
X-Received: by 2002:a05:7022:7e89:b0:144:eb3f:563a with SMTP id a92af1059eb24-16a129230a4mr24031124c88.15.1792031520121;
        Wed, 14 Oct 2026 19:32:00 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm49912225c88.21.2026.10.14.19.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:31:59 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Li RongQing <lirongqing@baidu.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	HyeongJun An <sammiee5311@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftests/x86: shadow stack must survive a bad TLS
Date: Wed, 14 Oct 2026 23:31:47 -0300
Message-ID: <20261015023147.519257-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023147.519257-1-ivanrwcm25@gmail.com>
References: <20261015023147.519257-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clone3(CLONE_VM|CLONE_SETTLS) with an out-of-range TLS fails in
set_new_tls() after copy_thread() has mapped a shadow stack.
copy_process() does not call exit_thread() on that failure, so the
VMA stays in the parent's mm.

Enable user shadow stack, reject 16 such clones, and require the
shadow-stack VMA count to stay unchanged. The original mapping must
remain, and a call/return on that stack must succeed, so the cleanup
cannot be unmapping the parent's shadow stack.

A clone3 with the same flags and a valid TLS has to succeed first.
EPERM from the rejected calls is not evidence on its own: a policy
can reject every clone3(). The child exits with a raw syscall because
it resumes on an empty shadow stack.

Skip when CPUID has no shadow stack, when the kernel does not provide
the feature, or when it is locked. Any other ARCH_SHSTK_ENABLE error
fails the test. The test expects /proc already mounted, as in a
normal kselftest run.

The recursive call goes through an indirect call. A visible recursive
body is optimized into a closed form and does not execute ret.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/x86/Makefile          |   3 +-
 tools/testing/selftests/x86/shstk_clone_tls.c | 364 ++++++++++++++++++
 2 files changed, 366 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/x86/shstk_clone_tls.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index d478b13cc8d5..4f8a771b0839 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -19,7 +19,8 @@ TARGETS_C_32BIT_ONLY := entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
 			vdso_restorer
 TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip syscall_numbering \
-			corrupt_xstate_header amx lam test_shadow_stack avx apx
+			corrupt_xstate_header amx lam test_shadow_stack avx apx \
+			shstk_clone_tls
 # Some selftests require 32bit support enabled also on 64bit systems
 TARGETS_C_32BIT_NEEDED := ldt_gdt ptrace_syscall
 
diff --git a/tools/testing/selftests/x86/shstk_clone_tls.c b/tools/testing/selftests/x86/shstk_clone_tls.c
new file mode 100644
index 000000000000..6b2f1001b084
--- /dev/null
+++ b/tools/testing/selftests/x86/shstk_clone_tls.c
@@ -0,0 +1,364 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_SETTLS) with an out-of-range TLS must not leak a
+ * shadow-stack VMA. copy_thread() maps one before set_new_tls() can fail,
+ * and copy_process() does not call exit_thread() on that failure.
+ *
+ * Pass: shadow-stack VMA count is unchanged, the original mapping is
+ * still there, and a call/return on this thread still works.
+ * Fail: one new shadow-stack VMA per rejected clone.
+ *
+ * Enable shadow stack with an inlined syscall. A normal function return
+ * across that point has no address on the shadow stack, so main() must
+ * not return after a successful enable.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <linux/sched.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#ifndef __NR_clone3
+#define __NR_clone3 435
+#endif
+
+#ifndef ARCH_SHSTK_ENABLE
+#define ARCH_SHSTK_ENABLE	0x5001
+#endif
+#ifndef ARCH_SHSTK_STATUS
+#define ARCH_SHSTK_STATUS	0x5005
+#endif
+#ifndef ARCH_SHSTK_SHSTK
+#define ARCH_SHSTK_SHSTK	1ULL /* bit 0 */
+#endif
+
+/* Same value as KSFT_SKIP in kselftest.h. */
+#define KSFT_SKIP		4
+
+#define NCLONE			16
+#define STACK_SIZE		(64 * 1024)
+
+/* CPUID.(EAX=07H, ECX=0):ECX[7], CET shadow stack. */
+#define CPUID_SHSTK		0x80
+
+#define ARCH_PRCTL(arg1, arg2)					\
+({								\
+	long _ret;						\
+	register long _num  asm("eax") = __NR_arch_prctl;	\
+	register long _arg1 asm("rdi") = (long)(arg1);		\
+	register long _arg2 asm("rsi") = (long)(arg2);		\
+								\
+	asm volatile (						\
+		"syscall\n"					\
+		: "=a"(_ret)					\
+		: "r"(_arg1), "r"(_arg2),			\
+		  "0"(_num)					\
+		: "rcx", "r11", "memory", "cc"			\
+	);							\
+	_ret;							\
+})
+
+#define get_ssp()							\
+({									\
+	unsigned long _ssp = 0;						\
+									\
+	asm volatile("rdsspq %0" : "+r" (_ssp));			\
+	_ssp;								\
+})
+
+static int cpu_has_shstk(void)
+{
+	unsigned int eax, ebx, ecx, edx;
+
+	asm volatile("cpuid"
+		     : "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
+		     : "a" (7), "c" (0));
+	return ecx & CPUID_SHSTK;
+}
+
+static void on_fault(int sig)
+{
+	static const char msg[] = "[FAIL]\tparent shadow stack faulted\n";
+
+	(void)sig;
+	if (write(2, msg, sizeof(msg) - 1) < 0)
+		_exit(2);
+	_exit(2);
+}
+
+struct ss_span {
+	unsigned long start;
+	unsigned long end;
+};
+
+static void ss_scan(int *vmas, int *kb, unsigned long addr, struct ss_span *hit,
+		    const struct ss_span *want, int *kept)
+{
+	FILE *f;
+	char line[256];
+	unsigned long start = 0, end = 0;
+	int size = 0;
+	int saw_size = 0;
+
+	*vmas = 0;
+	*kb = 0;
+	if (hit) {
+		hit->start = 0;
+		hit->end = 0;
+	}
+	if (kept)
+		*kept = 0;
+	f = fopen("/proc/self/smaps", "r");
+	if (!f) {
+		perror("smaps");
+		_exit(1);
+	}
+	while (fgets(line, sizeof(line), f)) {
+		unsigned long a, b;
+
+		if (sscanf(line, "%lx-%lx", &a, &b) == 2) {
+			start = a;
+			end = b;
+			saw_size = 0;
+			continue;
+		}
+		if (sscanf(line, "Size: %d kB", &size) == 1) {
+			saw_size = 1;
+			continue;
+		}
+		if (strncmp(line, "VmFlags:", 8) || !saw_size)
+			continue;
+		if (!strstr(line, " ss")) {
+			saw_size = 0;
+			continue;
+		}
+		(*vmas)++;
+		*kb += size;
+		/* Ordinary membership is [start, end). */
+		if (hit && addr >= start && addr < end) {
+			hit->start = start;
+			hit->end = end;
+		}
+		/*
+		 * An empty shadow stack leaves SSP at the exclusive end.
+		 * That address is not inside [start, end).
+		 */
+		if (hit && addr == end) {
+			hit->start = start;
+			hit->end = end;
+		}
+		if (kept && want && start == want->start && end == want->end)
+			*kept = 1;
+		saw_size = 0;
+	}
+	fclose(f);
+}
+
+/*
+ * clone3 carries tls in the struct. 0 is a valid FS base. -1 is rejected
+ * by ARCH_SET_FS before any FS write. No CLONE_THREAD: a created child is
+ * a separate process and _exit() does not tear this one down.
+ *
+ * Returns 0 if the child exited 0, -errno if clone3 failed, 1 otherwise.
+ */
+static int clone_tls(void *stack, size_t stack_size, unsigned long tls)
+{
+	struct clone_args args = {
+		.flags = CLONE_VM | CLONE_SETTLS,
+		.exit_signal = SIGCHLD,
+		.stack = (uint64_t)(uintptr_t)stack,
+		.stack_size = stack_size,
+		.tls = tls,
+	};
+	long ret;
+	int st;
+
+	/*
+	 * Inline syscall. The child resumes here on an empty shadow stack,
+	 * so it must not return into the libc wrapper.
+	 */
+	asm volatile("syscall"
+		     : "=a" (ret)
+		     : "0" (__NR_clone3),
+		       "D" (&args),
+		       "S" (sizeof(args))
+		     : "rcx", "r11", "memory");
+	if (ret == 0) {
+		asm volatile("syscall"
+			     :
+			     : "a" (__NR_exit),
+			       "D" (0)
+			     : "memory");
+		__builtin_unreachable();
+	}
+	if (ret < 0)
+		return ret;
+	if (waitpid((pid_t)ret, &st, 0) < 0)
+		return -errno;
+	if (!WIFEXITED(st) || WEXITSTATUS(st) != 0)
+		return 1;
+	return 0;
+}
+
+/*
+ * GCC 13 turns a visible recursive body into "return n + 1". Hide the
+ * callee in an asm output so each level stays a real indirect call/ret.
+ */
+static int depth(int n);
+static int (*depth_fn)(int) = depth;
+
+static int depth(int n)
+{
+	int (*go)(int n);
+
+	if (n <= 0)
+		return 1;
+	asm volatile("" : "=r" (go) : "0" (depth_fn) : "memory");
+	return go(n - 1) + 1;
+}
+
+static int skip_enable(long rc)
+{
+	if (rc == -EOPNOTSUPP) {
+		printf("[SKIP]\tkernel has no user shadow stack\n");
+	} else if (rc == -EINVAL) {
+		printf("[SKIP]\tkernel built without user shadow stack\n");
+	} else if (rc == -EPERM) {
+		printf("[SKIP]\tuser shadow stack is locked\n");
+	} else {
+		printf("[FAIL]\tARCH_SHSTK_ENABLE returned %ld\n", rc);
+		return 1;
+	}
+	return KSFT_SKIP;
+}
+
+int main(void)
+{
+	struct sigaction sa;
+	struct ss_span parent;
+	void *stack;
+	unsigned long ssp, ssp_mid;
+	long rc;
+	int vmas0, kb0, vmas1, kb1;
+	int i, kept, d, cret;
+
+	setbuf(stdout, NULL);
+
+	if (!cpu_has_shstk()) {
+		printf("[SKIP]\tCPUID has no shadow stack\n");
+		return KSFT_SKIP;
+	}
+
+	stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+	if (stack == MAP_FAILED) {
+		perror("mmap");
+		return 1;
+	}
+
+	/*
+	 * rdsspq #UDs while CET is off, so enable before the first read.
+	 * Already enabled is a no-op. Locked-and-enabled returns EPERM
+	 * before that no-op; ARCH_SHSTK_STATUS tells the two apart.
+	 */
+	rc = ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK);
+	if (rc == -EPERM) {
+		unsigned long status = 0;
+
+		if (ARCH_PRCTL(ARCH_SHSTK_STATUS, &status) ||
+		    !(status & ARCH_SHSTK_SHSTK))
+			return skip_enable(rc);
+	} else if (rc) {
+		return skip_enable(rc);
+	}
+	if (!get_ssp()) {
+		printf("[FAIL]\tenable left SSP at 0\n");
+		_exit(1);
+	}
+
+	/*
+	 * Same flags as the rejected calls, with a TLS that set_new_tls()
+	 * accepts. EPERM from the rejected calls is only meaningful if this
+	 * one is allowed: a policy can reject every clone3().
+	 */
+	cret = clone_tls(stack, STACK_SIZE, 0);
+	if (cret < 0) {
+		printf("[SKIP]\tclone3 with a valid TLS failed: %s\n",
+		       strerror(-cret));
+		_exit(KSFT_SKIP);
+	}
+	if (cret) {
+		printf("[FAIL]\tclone3 with a valid TLS did not exit 0\n");
+		_exit(1);
+	}
+
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_handler = on_fault;
+	sigaction(SIGSEGV, &sa, NULL);
+	sigaction(SIGBUS, &sa, NULL);
+
+	ssp = get_ssp();
+	ss_scan(&vmas0, &kb0, ssp, &parent, NULL, NULL);
+	if (!parent.start) {
+		printf("[FAIL]\tSSP %lx matches no shadow-stack VMA\n", ssp);
+		_exit(1);
+	}
+
+	for (i = 0; i < NCLONE; i++) {
+		cret = clone_tls(stack, STACK_SIZE, (unsigned long)-1);
+		if (cret == -EPERM)
+			continue;
+		if (cret < 0)
+			printf("[FAIL]\tbad TLS errno %d, want EPERM\n", -cret);
+		else
+			printf("[FAIL]\tbad TLS was accepted\n");
+		_exit(1);
+	}
+
+	ss_scan(&vmas1, &kb1, 0, NULL, &parent, &kept);
+	ssp_mid = get_ssp();
+	d = -1;
+	if (kept && ssp_mid)
+		d = depth(16);
+	ssp = get_ssp();
+
+	printf("ss_vmas=%d->%d delta=%d ss_kb=%d->%d\n",
+	       vmas0, vmas1, vmas1 - vmas0, kb0, kb1);
+	printf("parent=%lx-%lx kept=%d ssp_before_depth=%lx depth=%d ssp=%lx\n",
+	       parent.start, parent.end, kept, ssp_mid, d, ssp);
+
+	if (vmas1 != vmas0 || kb1 != kb0) {
+		printf("[FAIL]\tleaked %d shadow-stack VMA(s), %d kB\n",
+		       vmas1 - vmas0, kb1 - kb0);
+		_exit(1);
+	}
+	if (!kept) {
+		printf("[FAIL]\tparent shadow stack %lx-%lx was unmapped\n",
+		       parent.start, parent.end);
+		_exit(2);
+	}
+	if (!ssp_mid) {
+		printf("[FAIL]\tparent SSP was 0 before call/return\n");
+		_exit(2);
+	}
+	if (d != 17) {
+		printf("[FAIL]\tparent call/return returned %d, want 17\n", d);
+		_exit(2);
+	}
+	if (!ssp) {
+		printf("[FAIL]\tparent SSP is 0 after call/return\n");
+		_exit(2);
+	}
+
+	printf("[OK]\tno shadow-stack VMA leak; parent stack still works\n");
+	_exit(0);
+}
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792707458;
	b=mcXBrvnvzABe2rwiNme7nIHQ+Uvk5NH2w/eCjqbf9GJcSEVLtZJjsYcCkb1a35YYPuQy
	 Hu79LEXNVumLSJrlx09875uZf4AvcCxoTO/9tFg+FL4fvbOsqIakXctH30d0F32EIADGm
	 fHuwDilHub+ThHlrQo5kvYJ33nj90mK+cKKX5cZ/r2CPjV+FDCmvGxiumqf97w6VvrHHF
	 L6h3JQo61l3Fh/2OajAq5JXtmjAZeVrLdZ/Hhv9rv3ubY9qq/Wwtud9AdolUWf0JbZRVU
	 ZhZQ9tHLx2X6UKW/6P3Bgw9IImv5GkP0UY20XWw1rehrH766Co9yrsCvCr8RUuM2B1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=O9rxmQQE5HClmg1Y7ttdTB+8dKWaLFnE1l1C4A2emaY=;
	b=NgH5E6KFD48RM4cE0qzDzYcH7tialIYuq0A4AB8g3O7T3xFGV5g5GxdnwHU7NOjFvDqL
	 msz93yEq3nfet9iOJArw2gS1H8UjKa/LQ+P2YRN8KdpnNqFy0JBLwj69Bu9VQkGF7SSZM
	 m6bqvPDbWnp+ojeNsK0QJhgZy50rIbCyul2SmzkIdmF8YiBA1ZuinfX+HatxkfJZcp3AH
	 q4SLc6K7OdhNpUHZ2EIHYg1eYS7u0zfFv9IgMrkELUwvVhRW9xnAZyYr9Q9mGgckc/LE6
	 e7C+zebAQOxkaG/xaxtoDkpWnZmugLW8guxOhN2tlpoybX/9Q+Q/Uwt4tvv3ZehEodA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pA2QiHkx;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AF4606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7AF4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pA2QiHkx
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eafb65e163so234487e0c.2
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792707457; x=1793312257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O9rxmQQE5HClmg1Y7ttdTB+8dKWaLFnE1l1C4A2emaY=;
        b=pA2QiHkxBFb/q0goNPPdecNtw6q+j3oXi69o0L3tJicEB1r7mcoboI+othycHl+r4f
         vgS6s4Ma/g3rXaJDjEc5Yeo5Jl5lYzSMloAbtN4lcRdh48PAOqTededyogTm7dUY8ytk
         fuyA8hRF5XRddAaWE1kmKh4AuyJN+DC85mDnB4quPLD8aa+rj8iwcyCAQUnk9Db3ieNf
         yXw/D0c3AB2ipZ3qSejD4IvjuOav84BN/bsIyIkA9TwdUIeeQ0RhuTGHfENHL2Icya6z
         fbsOFBEWwL/qoEbcji8ppX8swLW2Lk8MxCVkml1MrK1c8qMqx39tvpKQWA/Xvwq6ZzTe
         2DMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792707457; x=1793312257;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9rxmQQE5HClmg1Y7ttdTB+8dKWaLFnE1l1C4A2emaY=;
        b=vXRzr+N+lYGaj4d7/QmPfkDPg4SGrhiz4OLVqXtKwnsMcXNyHUnm+5kYMcRoSz2K7L
         hLguoCBnVtiLX3Rn4DwFfsTm61daxQC/R2rQD+5IIGpVY8jDVEwVQ0ISvGJk/KSR68TJ
         m2khjF1JwX6FYsVmQOabl6RaGAVJJWHbZIjwZbth2/154pxg6OF0epVYv0KQOzfIJnqv
         PDpLzp0bn9adokhTbsgDrB1KGnYONx7fMuxuh/KzhMfCczkm8u7UOY3D/suT2Cej4UbR
         vh3jjw1irmnwT1Zh/RSuZMbYSgQKFXRDp0ecUA3V1dUXS0giw8oCVvk4VOePGUX5xFZT
         c6wA==
X-Forwarded-Encrypted: i=1; AKwUvBwiZaycTcoZwpT8gsXudQ+Ym6Fgrj86LyhbidzfQ/7YQWKs4LcN27RKkt8Z+3T3yfsni3GXNZnCQVY6ai3XgA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrZX6inF8k2Wh0n7oXTw56jbDKPOs7nwQMw7+IZQTjhTDUCZ8L
	MdvE1g0/K1rLcGNO5Cb7ByzAM+s71WHNXwvMerEyRRcMQhP4m9vc5ZUC
X-Gm-Gg: AYBFou3iOaNLrfVgx+C1xgmKiI/yZoHPGq2EazAEf4G+qmxInHvDGL83NkN24SYnMLC
	vzRRPTkgxPHM+4l3mwuTMCdFK1u7JpF6pKpGYLEeU/Yy7cSVBzz2Kl6bji/OfpEsPsb2wTQbTh6
	gn1mWHeCLFuvxWEAyYhiIDsMeWpydV/2jPsfsUNsNLNcj5ds8VxAWaXQ2xtmvom9aPnm+lpg1tr
	Vo8NsrCsDhICDds4wga/QC4Vb3h4yDQBw1Ge5uoeew+ZvEwk9YyXUHc08RSy/O62gSDu1BhqX1C
	3KtQCuSYXI10jpZ7umtFluHCzgSq+Vb/cOQZWGwZKKl9wSnU3lZvpVrBq2UCu9rHIC9LwrO2OIl
	kEy+S9s29I5+qSASkelgoO6Oo+DAxKC/pBL3ysd9etBMZRhgni0nhdyC0Spq0Z9YVqFb4Kd1E3A
	d1AE4rGIGY8duVwVJuKulFgvIa3cELtIbxQE66BPWwjjtj+412p9iFlhIjR3u8zVwo6PaJwmYT0
	6uLL9LXn9mNYeAo7rR5KScJwDWDPukglCqF66VP+lWYRTWhiA==
X-Received: by 2002:a05:6122:4002:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ec14a6ff39mr101116e0c.5.1792707456873;
        Thu, 22 Oct 2026 15:17:36 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13f2cfe0sm456271e0c.14.2026.10.22.15.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:17:36 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v2 2/2] selftests/x86: shadow stack must survive a bad TLS
Date: Thu, 22 Oct 2026 19:17:21 -0300
Message-ID: <20261022221722.619233-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022221722.619233-1-ivanrwcm25@gmail.com>
References: <20261015023147.519257-1-ivanrwcm25@gmail.com>
 <20261022221722.619233-1-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clone3(CLONE_VM|CLONE_SETTLS) with an out-of-range TLS fails in
set_new_tls() after copy_thread() has mapped a shadow stack.
copy_process() does not call exit_thread() on that failure, so the
VMA stays in the parent's mm.

Use kselftest.h / KTAP. Skip paths that cannot run the regression
run before ksft_set_plan(). Then confirm a valid clone3, that sixteen
bad-TLS clones return -EPERM, and that the shadow-stack VMA count is
unchanged while the parent's stack still supports call/return.

SKIP the valid-TLS control only for ENOSYS, EPERM, or EACCES. Missing
/proc/self/smaps (ENOENT) is SKIP. Read errors, truncated lines, and
VMA records without VmFlags are FAIL so under-counting cannot hide a
leak. Skip when CPUID has no shadow stack or when user SHSTK cannot
be enabled. The child exits with a raw syscall because it resumes on
an empty shadow stack.

The recursive call goes through an indirect call. A visible recursive
body is optimized into a closed form and does not execute ret.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/x86/Makefile          |   3 +-
 tools/testing/selftests/x86/shstk_clone_tls.c | 334 ++++++++++++++++++
 2 files changed, 336 insertions(+), 1 deletion(-)
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
index 000000000000..5c9b5709b440
--- /dev/null
+++ b/tools/testing/selftests/x86/shstk_clone_tls.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_SETTLS) with an out-of-range TLS must not leak a
+ * shadow-stack VMA. copy_thread() maps one before set_new_tls() can fail,
+ * and copy_process() does not call exit_thread() on that failure.
+ *
+ * KTAP via kselftest.h. Capability / clone3 skips run before
+ * ksft_set_plan(). After ARCH_SHSTK_ENABLE, exit only through ksft_exit_*
+ * (do not return from main).
+ *
+ * Relies on /proc/self/smaps (CONFIG_PROC_PAGE_MONITOR).
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
+#include "../kselftest.h"
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
+#define ARCH_SHSTK_SHSTK	1ULL
+#endif
+
+#define NCLONE		16
+#define STACK_SIZE	(64 * 1024)
+#define CPUID_SHSTK	0x80	/* CPUID.(EAX=07H,ECX=0):ECX[7] */
+
+/*
+ * Inlined arch_prctl — same constraint as test_shadow_stack.c: after
+ * SHSTK is enabled, a libc syscall wrapper return has no shadow token.
+ */
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
+static __always_inline unsigned long get_ssp(void)
+{
+	unsigned long ret = 0;
+
+	/* RDSSPQ is a NOP when SHSTK is off; keep destination cleared. */
+	asm volatile("xor %0, %0; rdsspq %0" : "=r" (ret));
+	return ret;
+}
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
+	(void)sig;
+	/* Async-signal-safe path; do not call into libc printf. */
+	_exit(KSFT_FAIL);
+}
+
+struct ss_span {
+	unsigned long start;
+	unsigned long end;
+};
+
+static FILE *open_smaps(void)
+{
+	FILE *f = fopen("/proc/self/smaps", "r");
+
+	if (f)
+		return f;
+	if (errno == ENOENT)
+		ksft_exit_skip("/proc/self/smaps unavailable\n");
+	ksft_exit_fail_msg("fopen /proc/self/smaps: %s\n", strerror(errno));
+}
+
+/*
+ * Count ss VMAs; optionally resolve SSP → span and check a known span.
+ * Empty stacks leave SSP at the exclusive end.
+ *
+ * Each address-range header must be followed by VmFlags before the next
+ * range (or EOF). Truncated lines and a dangling range are FAIL — silent
+ * skips would under-count leaked shadow stacks.
+ */
+static void ss_scan(int *vmas, unsigned long ssp, struct ss_span *hit,
+		    const struct ss_span *want, int *kept)
+{
+	FILE *f = open_smaps();
+	char line[256];
+	unsigned long start = 0, end = 0;
+	int saw_range = 0;
+
+	*vmas = 0;
+	if (hit) {
+		hit->start = 0;
+		hit->end = 0;
+	}
+	if (kept)
+		*kept = 0;
+
+	while (fgets(line, sizeof(line), f)) {
+		unsigned long a, b;
+		size_t len = strlen(line);
+
+		if (len + 1 == sizeof(line) && line[len - 1] != '\n') {
+			fclose(f);
+			ksft_exit_fail_msg("smaps line truncated\n");
+		}
+
+		if (sscanf(line, "%lx-%lx", &a, &b) == 2) {
+			if (saw_range) {
+				fclose(f);
+				ksft_exit_fail_msg(
+					"smaps range %lx-%lx missing VmFlags\n",
+					start, end);
+			}
+			start = a;
+			end = b;
+			saw_range = 1;
+			continue;
+		}
+		if (strncmp(line, "VmFlags:", 8))
+			continue;
+		if (!saw_range) {
+			fclose(f);
+			ksft_exit_fail_msg("smaps VmFlags without range\n");
+		}
+		saw_range = 0;
+		if (!strstr(line, " ss"))
+			continue;
+
+		(*vmas)++;
+		if (hit && ((ssp >= start && ssp < end) || ssp == end)) {
+			hit->start = start;
+			hit->end = end;
+		}
+		if (kept && want && start == want->start && end == want->end)
+			*kept = 1;
+	}
+	if (ferror(f)) {
+		fclose(f);
+		ksft_exit_fail_msg("read /proc/self/smaps: %s\n",
+				   strerror(errno));
+	}
+	if (saw_range) {
+		fclose(f);
+		ksft_exit_fail_msg("smaps range %lx-%lx missing VmFlags\n",
+				   start, end);
+	}
+	fclose(f);
+}
+
+/*
+ * Returns 0 if the child exited 0, -errno if clone3 failed, 1 otherwise.
+ * Child uses a raw exit: it resumes on an empty shadow stack.
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
+ * Indirect call so GCC cannot fold recursion into n+1 (call *%rax + ret).
+ */
+static int depth(int n);
+static int (*depth_fn)(int n) = depth;
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
+static void enable_shstk(void)
+{
+	long rc;
+	unsigned long status = 0;
+
+	/*
+	 * RDSSPQ leaves its destination unchanged when shadow stacks are
+	 * disabled. Enable SHSTK before inspecting the SSP.
+	 */
+	rc = ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK);
+	if (rc == -EPERM) {
+		if (ARCH_PRCTL(ARCH_SHSTK_STATUS, &status) ||
+		    !(status & ARCH_SHSTK_SHSTK))
+			ksft_exit_skip("user shadow stack is locked\n");
+		return;
+	}
+	if (rc == -EOPNOTSUPP || rc == -EINVAL)
+		ksft_exit_skip("user shadow stack unavailable: %ld\n", rc);
+	if (rc)
+		ksft_exit_fail_msg("ARCH_SHSTK_ENABLE: %ld\n", rc);
+}
+
+int main(void)
+{
+	struct sigaction sa = { 0 };
+	struct ss_span parent;
+	void *stack;
+	unsigned long ssp, ssp_mid;
+	int vmas0, vmas1;
+	int i, kept, d, cret, n_eperm = 0;
+
+	ksft_print_header();
+
+	if (!cpu_has_shstk())
+		ksft_exit_skip("CPUID has no shadow stack\n");
+
+	stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+	if (stack == MAP_FAILED)
+		ksft_exit_fail_msg("mmap stack: %s\n", strerror(errno));
+
+	enable_shstk();
+	if (!get_ssp())
+		ksft_exit_fail_msg("enable left SSP at 0\n");
+
+	/*
+	 * Positive control before the plan: SKIP only when clone3 is
+	 * unavailable or denied; unexpected errno is reported as a failed
+	 * test after ksft_set_plan().
+	 */
+	cret = clone_tls(stack, STACK_SIZE, 0);
+	if (cret == -ENOSYS || cret == -EPERM || cret == -EACCES)
+		ksft_exit_skip("clone3 valid TLS unavailable: %s\n",
+			       strerror(-cret));
+
+	ksft_set_plan(3);
+
+	ksft_test_result(cret == 0,
+			 "clone3 valid TLS (rc=%d)\n", cret);
+
+	sa.sa_handler = on_fault;
+	sigaction(SIGSEGV, &sa, NULL);
+	sigaction(SIGBUS, &sa, NULL);
+
+	ssp = get_ssp();
+	ss_scan(&vmas0, ssp, &parent, NULL, NULL);
+	if (!parent.start)
+		ksft_exit_fail_msg("SSP %lx matches no shadow-stack VMA\n",
+				   ssp);
+
+	for (i = 0; i < NCLONE; i++) {
+		cret = clone_tls(stack, STACK_SIZE, (unsigned long)-1);
+		if (cret == -EPERM)
+			n_eperm++;
+	}
+	ksft_test_result(n_eperm == NCLONE,
+			 "clone3 bad TLS returns -EPERM x%d (got %d)\n",
+			 NCLONE, n_eperm);
+
+	ss_scan(&vmas1, 0, NULL, &parent, &kept);
+	ssp_mid = get_ssp();
+	d = (kept && ssp_mid) ? depth(16) : -1;
+	ssp = get_ssp();
+
+	ksft_print_msg("ss_vmas=%d->%d parent=%lx-%lx kept=%d depth=%d ssp=%lx\n",
+		       vmas0, vmas1, parent.start, parent.end, kept, d, ssp);
+
+	ksft_test_result(vmas1 == vmas0 && kept && d == 17 && ssp_mid && ssp,
+			 "no shadow-stack VMA leak; parent stack works (%d->%d)\n",
+			 vmas0, vmas1);
+
+	ksft_finished();
+}
-- 
2.43.0


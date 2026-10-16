Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247919046E
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 19:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179998; cv=none; b=CTDYD+BxzbJ5rZT7qSxals1sjzCpKR3J8vtfN3cgL7zkqDZ/HfcN07XdSyKCnhDUlQkzkxH8+Qw/jvoIW+0JI+R4167iT734Q0aZhUtNu1mM6ub4Tbcdpd6bDuJLSmj43MMncEp7Uy0mrunh6yymPXuBWHsyzeMYVCciH2wc/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179998; c=relaxed/simple;
	bh=RN3raEmy/hY3BmGXxgB1c2NQ5lP9hksv/kX6tR1Sizc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRaz/Xl2Xl4FiMBTotYyBRTV5gPbnw6mJIEGXQLbrzcmhAwnkLcYPOveeNHYcrcl6kfFDaZDKmiy2uTiBXVwlGakVOZrE53ZmEaUDoE7ibTHEkvj+LHmVm7Cs9y9OKVLHLPoCfw7esVP5MNLkqRIlfTvcxBTHvmAlPJltajydic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCq7aR5N; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCq7aR5N"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-17bc533fda3so331133c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 12:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179996; x=1792784796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6BejmUJayYXc+px7VFw82eKlRmA2IpD+Hx93b9PlXnk=;
        b=MCq7aR5N9vYZ2UvyFIbZYD53JfsSOFfpkIzgqWPmKksILhGJzYNxPe3kYxoj146HtN
         rBNi7KYAPWKVnU8tYX84qk2ovR2xLA/k/pZ/C/LOImGI1e3cSjZw1MkcoFKjeLWRZqTg
         1XjbdxXTAB1GrhVMuciNAE4jKf5K/pfEMTaqlqf/IGU8Z16muxS8s72pKs+LBwTwneXh
         +s4H8nyDq3zq2a+eizLQPVYKGt95TyQ0QUl6oszWIh3LvW7LV+J7VLGeIHr6uXj8/x93
         Dwwqe6fZb9ynKCl6Df0uZfJRMHdf2gBXvWWb9I1h2wURlzyxFKV+xr6DpOI6zWgc41ru
         jJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179996; x=1792784796;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BejmUJayYXc+px7VFw82eKlRmA2IpD+Hx93b9PlXnk=;
        b=FybjyaOubiLSYd2HFv4Wpt2IHlh4ZMPxNcOhhOHdYf5ESuGNl84xalSw5N70vxRwQz
         W9Y63COqy5Egf3N5Mt02+cPSYUF6ySnu9lFeNh789SqgA27bowHa8uVxAM6UpwOHE4pN
         rBMsekoBlpD8/TXDgnhb2iMcY1bpl2W1DDmuOYea6j42rqGSZlviZmwqg96/31Vq0NTt
         hORhT+2NKsZIZq/yz0CJE163d16X3tt4+5FKI1O1BCJOeDGs1Y1lsbbZLwd4b5Nk6CJx
         g8bSJ2I7KRJC8XDJ8ibI2r7RfOMNhQ5Qocey4tmr/fJv+MUkmUykKX3n5XZCy+mij35T
         MI/g==
X-Forwarded-Encrypted: i=1; AKwUvBwtDCRHjwmbNUmDsPFn5Iwas+R8rsRq5OwzgJ5R3+8a4ymIjTmPlMQ5mTJ7m36GRthkbFqqVpsN075+UL8pFts=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVyH2N6n7PwKYEiqvLPeWzKgW7Q/0UVqKE4qHnoeNyos5mfvLV
	c1eONSqURC4d4tjrdrOGNOr0Dd/v9OmhPCPrVZndazXfVDQ3NFiLNMr7
X-Gm-Gg: AYBFou3ue9Z3Iu7yypP3B0MVE0bcQIIdcAXCRBDzFMuXve7CUAKXb7m83nK+cD8y5nN
	6A9GYqOFapy4U5XLUdIqohTgd9g53cN2QCJyLfsPfa1IfEJXvjOeB+sugRavU+W/tdI8cKbK11r
	3IYRIv8Eqsib45+01NYaPbe8Re6M2tQrfDkHwE5Tju5s3E+AaKjTbd5gybV56bwwN1wl8Soemq5
	3sw1iKDcYla9+2TbL4NmuJnWo4yNsBMESmUnMe35APWSJotgdTF8/p6IsLkJ9Nlloy4QcBvHpcc
	8+VAUznuuQvd8gFj76Avp+/vnECrJS8/U/TAxZv5nn41azlydHn2lMpUnR7x8HpVTBE3Ix74IRB
	NXgGPePDnigUG6seFJflG4Y4BeG3j4MpZoo7zYQMYt6Y8VqAW2ZQ5qvuK4JACQMMAKeBCk7Mq3U
	tKJ1lbcewnD/MczGKwScsgB9yaxOjBMz3SxHT+gideJ21PzD0ykRdfDE1sgJGYIDGD
X-Received: by 2002:a05:7022:fe0a:b0:169:bef5:f445 with SMTP id a92af1059eb24-1850c5f77b4mr1596666c88.4.1792179995901;
        Fri, 16 Oct 2026 12:46:35 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:34 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH 4/4] selftests/riscv: shadow stack must not leak on a failed clone3
Date: Fri, 16 Oct 2026 16:46:03 -0300
Message-ID: <71829fed122c74000a2ac8b7de89aca811d40b0a.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer fails
in put_user() after copy_thread() has mapped a shadow stack.
copy_process() then calls exit_thread(). Without HAVE_EXIT_THREAD
that free is a no-op and the VMA stays in the parent's mm.

Enable user shadow stack, reject 16 such clones, and require the
shadow-stack VMA count to stay unchanged. The original mapping must
remain, and a call/return on that stack must succeed, so the cleanup
cannot be unmapping the parent's shadow stack.

A clone3 with the same flags and a valid pidfd has to succeed first
and write a pidfd. That child exits normally, so deactivate_mm()
and exit_thread() both run. ENOSYS, EINVAL, and EPERM skip; any
other error from that clone, or a success that leaves pidfd unset,
fails the test. The rejected child's empty shadow stack is left
with a raw exit syscall.

Skip when the kernel returns EOPNOTSUPP or EINVAL, or when the
feature is locked. The test expects /proc already mounted, as in a
normal kselftest run. The toolchain CFLAGS already request
zicfiss/zicfilp; the Makefile skips this binary when the compiler
cannot target them.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 317 ++++++++++++++++++
 2 files changed, 321 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c

diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 418b4b5325a5..dbecb1fd3b82 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -13,10 +13,13 @@ endif
 
 
 ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null > /dev/null 2>&1; echo $$?),0)
-TEST_GEN_PROGS := cfitests
+TEST_GEN_PROGS := cfitests shstk-clone-pidfd
 
 $(OUTPUT)/cfitests: cfitests.c shadowstack.c
 	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/shstk-clone-pidfd: shstk-clone-pidfd.c
+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
 else
 
 $(shell echo "Toolchain doesn't support CFI, skipping CFI kselftest." >&2)
diff --git a/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c b/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c
new file mode 100644
index 000000000000..3f9f6827bd4d
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer must
+ * not leak a shadow-stack VMA. copy_thread() maps one, then put_user()
+ * fails and copy_process() calls exit_thread(). Without HAVE_EXIT_THREAD
+ * that free is a no-op and the VMA stays in the parent's mm.
+ *
+ * Enable shadow stack with an inlined prctl. A libc return across that
+ * point has no address on the shadow stack, so main() must not return
+ * after enable.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <linux/prctl.h>
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
+#include "cfi_rv_test.h"
+
+#ifndef __NR_clone3
+#define __NR_clone3 435
+#endif
+
+#ifndef PR_GET_SHADOW_STACK_STATUS
+#define PR_GET_SHADOW_STACK_STATUS	74
+#endif
+#ifndef PR_SET_SHADOW_STACK_STATUS
+#define PR_SET_SHADOW_STACK_STATUS	75
+#endif
+#ifndef PR_SHADOW_STACK_ENABLE
+#define PR_SHADOW_STACK_ENABLE		(1UL << 0)
+#endif
+
+#define KSFT_SKIP		4
+#define NCLONE			16
+#define STACK_SIZE		(64 * 1024)
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
+		if (hit && addr == end) {
+			hit->start = start;
+			hit->end = end;
+		} else if (hit && !hit->start && addr >= start && addr < end) {
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
+static int clone_pidfd(void *stack, size_t stack_size, int *pidfd_ptr)
+{
+	struct clone_args args = {
+		.flags = CLONE_VM | CLONE_PIDFD,
+		.pidfd = (uint64_t)(uintptr_t)pidfd_ptr,
+		.exit_signal = SIGCHLD,
+		.stack = (uint64_t)(uintptr_t)stack,
+		.stack_size = stack_size,
+	};
+	register long num __asm__("a7") = __NR_clone3;
+	register long ret __asm__("a0") = (long)&args;
+	register long sz __asm__("a1") = sizeof(args);
+	int st;
+
+	asm volatile("ecall"
+		     : "+r"(ret)
+		     : "r"(num), "r"(sz)
+		     : "memory", "cc");
+	if (ret == 0) {
+		register long n __asm__("a7") = __NR_exit;
+		register long e __asm__("a0") = 0;
+
+		asm volatile("ecall" : : "r"(n), "r"(e) : "memory");
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
+static int depth(int n);
+static int (*depth_fn)(int) = depth;
+
+static int depth(int n)
+{
+	int (*go)(int n);
+
+	if (n <= 0)
+		return 1;
+	asm volatile("" : "=r"(go) : "0"(depth_fn) : "memory");
+	return go(n - 1) + 1;
+}
+
+static int skip_enable(long rc)
+{
+	if (rc == -EOPNOTSUPP || rc == -EINVAL) {
+		printf("[SKIP]\tkernel has no user shadow stack\n");
+		return KSFT_SKIP;
+	}
+	if (rc == -EBUSY) {
+		printf("[SKIP]\tshadow stack is locked\n");
+		return KSFT_SKIP;
+	}
+	printf("[FAIL]\tPR_SET_SHADOW_STACK_STATUS returned %ld\n", rc);
+	return 1;
+}
+
+int main(void)
+{
+	struct sigaction sa;
+	struct ss_span parent;
+	void *stack;
+	void *bad_pidfd;
+	unsigned long ssp, ssp_mid;
+	unsigned long ss_mode;
+	long rc;
+	int pidfd;
+	int vmas0, kb0, vmas1, kb1;
+	int i, kept, d, cret;
+
+	setbuf(stdout, NULL);
+
+	stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+	if (stack == MAP_FAILED) {
+		perror("mmap stack");
+		return 1;
+	}
+	bad_pidfd = mmap(NULL, 4096, PROT_NONE,
+			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (bad_pidfd == MAP_FAILED) {
+		perror("mmap pidfd");
+		return 1;
+	}
+
+	rc = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
+			 (long)&ss_mode, 0, 0, 0);
+	if (rc) {
+		if (rc == -EOPNOTSUPP || rc == -EINVAL) {
+			printf("[SKIP]\tkernel has no user shadow stack\n");
+			return KSFT_SKIP;
+		}
+		printf("[FAIL]\tPR_GET_SHADOW_STACK_STATUS returned %ld\n", rc);
+		return 1;
+	}
+	if (!(ss_mode & PR_SHADOW_STACK_ENABLE)) {
+		rc = my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+				 PR_SHADOW_STACK_ENABLE, 0, 0, 0);
+		if (rc)
+			return skip_enable(rc);
+	}
+
+	ssp = csr_read(CSR_SSP);
+	if (!ssp) {
+		printf("[FAIL]\tenable left SSP at 0\n");
+		_exit(1);
+	}
+
+	pidfd = -1;
+	cret = clone_pidfd(stack, STACK_SIZE, &pidfd);
+	if (cret == -ENOSYS || cret == -EINVAL || cret == -EPERM) {
+		printf("[SKIP]\tclone3 with a valid pidfd failed: %s\n",
+		       strerror(-cret));
+		_exit(KSFT_SKIP);
+	}
+	if (cret < 0) {
+		printf("[FAIL]\tclone3 with a valid pidfd failed: %s\n",
+		       strerror(-cret));
+		_exit(1);
+	}
+	if (cret) {
+		printf("[FAIL]\tclone3 with a valid pidfd did not exit 0\n");
+		_exit(1);
+	}
+	if (pidfd < 0) {
+		printf("[FAIL]\tclone3 succeeded but did not write a pidfd\n");
+		_exit(1);
+	}
+	close(pidfd);
+
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_handler = on_fault;
+	if (sigaction(SIGSEGV, &sa, NULL) || sigaction(SIGBUS, &sa, NULL)) {
+		perror("sigaction");
+		_exit(1);
+	}
+
+	ssp = csr_read(CSR_SSP);
+	ss_scan(&vmas0, &kb0, ssp, &parent, NULL, NULL);
+	if (!parent.start) {
+		printf("[FAIL]\tSSP %lx matches no shadow-stack VMA\n", ssp);
+		_exit(1);
+	}
+
+	for (i = 0; i < NCLONE; i++) {
+		cret = clone_pidfd(stack, STACK_SIZE, bad_pidfd);
+		if (cret == -EFAULT)
+			continue;
+		if (cret < 0)
+			printf("[FAIL]\tbad pidfd errno %d, want EFAULT\n",
+			       -cret);
+		else
+			printf("[FAIL]\tbad pidfd was accepted\n");
+		_exit(1);
+	}
+
+	ss_scan(&vmas1, &kb1, 0, NULL, &parent, &kept);
+	ssp_mid = csr_read(CSR_SSP);
+	d = -1;
+	if (kept && ssp_mid)
+		d = depth(16);
+	ssp = csr_read(CSR_SSP);
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


Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55319046E
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 19:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179992; cv=none; b=Pw9LqZVRyhqVgurD5ejLfZZprezEHFEu46+bmgln45jqfXQtqZmbyrmBZiGir1QUEUY0h9ClgRophEP2l8KeGlbZsiaQPs1tn2IIi5nQUHQgxKYEmMIYHwWiRQm6BSXWaE6jTZNaPw1sr7MthLescn+XEyInpfZhHbLOmgp9jKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179992; c=relaxed/simple;
	bh=/x5Yix+rLTLmUGsTGBhQg4mt6nnxIe+zwS1gMxbcT0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h4mysmA9FZ85SA1dXnpSMaaHCGyUDYAkBJfdLjIqUjcVg0TZFDtF094oaLAPCL2Q0WpEwnLDmVssZrv368PtUJYptMsQwYjiryF1rj+6YQ+BLjYyRqx7cYv2IiRIqC84mD46W8JvovZn6wEF+rb/Q7EeceIVLxPBSZ5ogC2gZCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oc+cJkAl; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oc+cJkAl"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so629316eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179990; x=1792784790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m/dXBgoz0ituzVPypJqvKFSanJLtBP1uVeLtKCNjUy0=;
        b=Oc+cJkAl7VUsTXzWwIsj6ataMAJqlLVqq9agwazvXlmSTyQ8go6oiIW8oz2uWmj7Ol
         9y6LJlBewUq5RVqQHmFCpxz4/wRZqn0utYjK/Nw69XSLYT4AHHKWT83ml1B8TYTTS/42
         0zGOHqRtSg3U5juUXQCrDsGFax33cYbv93P+EghpYgQfLXqeU0kslxefBSaxSDDECXeh
         7OL8GfldLngX62cQz6hGUBD9P68g1W5Hn0gjjoGqCMPGT0app6A7ZtZT5Qfjjq/12oit
         rh0ZE2zpi6i3MITbx2Tr0T4EmCIVbxeUx2d1yAhhSJHIweNY+Oe4Pf44Q1tLM/6adYZg
         QuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179990; x=1792784790;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/dXBgoz0ituzVPypJqvKFSanJLtBP1uVeLtKCNjUy0=;
        b=z30g1v0TIwX8PFkoHi/h2PSnhUQiLzlH3QxIYVVpPiSp+QJOF1Qr3XB4yuukKjq4Me
         wAlt8s6JZz+BkJJYsJsRE1ctHHu5tjFJMfyht8Tzt1kYki8kzvA1aEjNzqOWEVi73VhK
         ujUte/njvzP5vSo2WzC9LRXXdyYABLD4+6W+VqadRVmDyyLK9E/H9+QJIO6SGIuy9eir
         OHiiJ284/ne1o2mBVNyR8koyVJ3AsfQmr3T7+xF9gjnKGxn1C1imvbmHdHXW+8l+y+BH
         t/y1p34PkDfuNU+FI5n6eD3jS4Nlv8un97FUUliLz5gtEQQ8bK+VyM1wrQsy4Fh1qt0A
         dVIw==
X-Forwarded-Encrypted: i=1; AKwUvBxLkVQmwGOWO6GLcKLYGRiN6+KxSwn+IzjbPuL4Ktp/2zCKziibkPg1v8N790ckTEO1+41WIxsQjY7PVZsW2nM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUEmHBY5IvxWp/5I8KTo4zPq6euTGJ+QNSpQW7fT3dBXpVLXoP
	Nq2+vQml4YisQJKoUzLLYMi+wC8V6yvKuxfcaZNAk5PxslS1rkzmJzVi
X-Gm-Gg: AYBFou0MmE+ANu+8OsqbhrAaVJ0DETxpeDcC8ZB+Fk7w4on33jrdw3D64xNUDHWt25k
	RhaUizeQPgRnuW3O/Wp9nC6scGrnjK1kBlXN0cLiKmEDeZN3UOomCf4pCKFsGA3gpRc+wv8xaDQ
	qCNPTiSJXG0jfy8nnY72DX/PxiwWqxr98fZ54eFg97VIYja0AwS35Hgo5VseHdF/R/fF4kU6fyu
	bkvf42N9X0YmcVYV0ee3HA6F1phSxJTqVMMP0+RRhs1HghehKfwnX0yULMYbiRCzH6WHnL1ciYc
	ymZ7fruQdyoLycaFhJVutYSEVIUROok8CpKZm0TbzpvLn/hqBnbEWgLaN7BSNam7PmiitOaw/SF
	KGigNVZtutv1yQVXSqoyQVQoelVg6/lmppSJ65Z5HI+JtSlhcvxhFsEOp+QDYN/G4pE2kp615VM
	sTlS/xAZhWVnt3VXaYiEup5CMnpW9v74B0YzT/991ttf5UFQqbJ+tqWF+1SY46GFnL2ZfRmYi9o
	TQ=
X-Received: by 2002:a05:7023:a4d:20b0:144:fb42:52 with SMTP id a92af1059eb24-18512f1ed6amr977259c88.28.1792179989988;
        Fri, 16 Oct 2026 12:46:29 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:28 -0700 (PDT)
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
Subject: [PATCH 3/4] selftests/arm64: GCS must not leak on a failed clone3
Date: Fri, 16 Oct 2026 16:46:02 -0300
Message-ID: <ed22ebf64ed00a56d5e1eff31ac639fef00dcae6.1792179433.git.ivanrwcm25@gmail.com>
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
in put_user() after copy_thread() has mapped a GCS. copy_process()
then calls exit_thread(). Without HAVE_EXIT_THREAD that free is a
no-op and the VMA stays in the parent's mm.

Enable GCS, reject 16 such clones, and require the shadow-stack VMA
count to stay unchanged. The original mapping must remain, and a
call/return on that stack must succeed, so the cleanup cannot be
unmapping the parent's GCS.

A clone3 with the same flags and a valid pidfd has to succeed first
and write a pidfd. That child exits normally, so deactivate_mm()
and exit_thread() both run. ENOSYS, EINVAL, and EPERM skip; any
other error from that clone, or a success that leaves pidfd unset,
fails the test. The rejected child's empty GCS is left with a raw
exit syscall.

Skip when HWCAP has no GCS, or when the kernel returns EOPNOTSUPP,
EINVAL, or EBUSY. Any other PR_SET_SHADOW_STACK_STATUS error fails
the test. The test expects /proc already mounted, as in a normal
kselftest run.

The prctl wrapper matches gcs-locking.c. The recursive call goes
through an indirect call; a visible recursive body is optimized
into a closed form and does not execute a BL/RET.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 355 ++++++++++++++++++
 2 files changed, 357 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c

diff --git a/tools/testing/selftests/arm64/gcs/Makefile b/tools/testing/selftests/arm64/gcs/Makefile
index 1fbbf0ca1f02..f1365eea31c9 100644
--- a/tools/testing/selftests/arm64/gcs/Makefile
+++ b/tools/testing/selftests/arm64/gcs/Makefile
@@ -6,7 +6,8 @@
 # nolibc.
 #
 
-TEST_GEN_PROGS := basic-gcs libc-gcs gcs-locking gcs-stress gcspushm gcsstr
+TEST_GEN_PROGS := basic-gcs libc-gcs gcs-locking gcs-stress gcspushm gcsstr \
+		  gcs-clone-pidfd
 TEST_GEN_PROGS_EXTENDED := gcs-stress-thread
 
 LDLIBS+=-lpthread
diff --git a/tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c b/tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
new file mode 100644
index 000000000000..c8515e65c947
--- /dev/null
+++ b/tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer must
+ * not leak a GCS VMA. copy_thread() maps one, then put_user() fails
+ * and copy_process() calls exit_thread(). Without HAVE_EXIT_THREAD
+ * that free is a no-op and the VMA stays in the parent's mm.
+ *
+ * Pass: shadow-stack VMA count is unchanged, the original mapping is
+ * still there, and a call/return on this thread still works.
+ * Fail: one new shadow-stack VMA per rejected clone.
+ *
+ * Enable GCS with an inlined prctl. A libc return across that point
+ * has no address on the GCS, so main() must not return after enable.
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
+#include <sys/auxv.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include <asm/hwcap.h>
+
+#include "gcs-util.h"
+
+#ifndef HWCAP_GCS
+#define HWCAP_GCS		(1UL << 32)
+#endif
+
+#ifndef __NR_clone3
+#define __NR_clone3 435
+#endif
+
+/* Same value as KSFT_SKIP in kselftest.h. */
+#define KSFT_SKIP		4
+
+#define NCLONE			16
+#define STACK_SIZE		(64 * 1024)
+
+/* Same wrapper as gcs-locking.c: extra prctl args must be zero. */
+#define my_syscall2(num, arg1, arg2)					\
+({									\
+	register long _num  __asm__ ("x8") = (num);			\
+	register long _arg1 __asm__ ("x0") = (long)(arg1);		\
+	register long _arg2 __asm__ ("x1") = (long)(arg2);		\
+	register long _arg3 __asm__ ("x2") = 0;				\
+	register long _arg4 __asm__ ("x3") = 0;				\
+	register long _arg5 __asm__ ("x4") = 0;				\
+									\
+	__asm__ volatile (						\
+		"svc #0\n"						\
+		: "=r"(_arg1)						\
+		: "r"(_arg1), "r"(_arg2),				\
+		  "r"(_arg3), "r"(_arg4),				\
+		  "r"(_arg5), "r"(_num)					\
+		: "memory", "cc"					\
+	);								\
+	_arg1;								\
+})
+
+static void on_fault(int sig)
+{
+	static const char msg[] = "[FAIL]\tparent guarded control stack faulted\n";
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
+		/*
+		 * An empty GCS leaves GCSPR at the exclusive end. If
+		 * the next VMA is contiguous that address is also the
+		 * start of the next range; prefer the mapping that
+		 * ends here.
+		 */
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
+/*
+ * CLONE_VM maps a new GCS. CLONE_PIDFD lets put_user() fail after that.
+ * No CLONE_THREAD: a created child is a separate process. The child
+ * resumes on an empty GCS, so it must not return into libc.
+ */
+static int clone_pidfd(void *stack, size_t stack_size, int *pidfd_ptr)
+{
+	struct clone_args args = {
+		.flags = CLONE_VM | CLONE_PIDFD,
+		.pidfd = (uint64_t)(uintptr_t)pidfd_ptr,
+		.exit_signal = SIGCHLD,
+		.stack = (uint64_t)(uintptr_t)stack,
+		.stack_size = stack_size,
+	};
+	register long num __asm__("x8") = __NR_clone3;
+	register long ret __asm__("x0") = (long)&args;
+	register long sz __asm__("x1") = sizeof(args);
+	int st;
+
+	asm volatile("svc #0"
+		     : "+r"(ret)
+		     : "r"(num), "r"(sz)
+		     : "memory", "cc");
+	if (ret == 0) {
+		register long n __asm__("x8") = __NR_exit;
+		register long e __asm__("x0") = 0;
+
+		asm volatile("svc #0" : : "r"(n), "r"(e) : "memory");
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
+ * GCC can fold a visible recursive body. Hide the callee in an asm
+ * output so each level stays a real BL/RET that uses the GCS.
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
+	asm volatile("" : "=r"(go) : "0"(depth_fn) : "memory");
+	return go(n - 1) + 1;
+}
+
+static int skip_enable(long rc)
+{
+	if (rc == -EOPNOTSUPP) {
+		printf("[SKIP]\tkernel has no GCS\n");
+	} else if (rc == -EINVAL) {
+		printf("[SKIP]\tkernel built without GCS\n");
+	} else if (rc == -EBUSY) {
+		printf("[SKIP]\tGCS is locked\n");
+	} else {
+		printf("[FAIL]\tPR_SET_SHADOW_STACK_STATUS returned %ld\n", rc);
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
+	void *bad_pidfd;
+	unsigned long gcspr, gcspr_mid;
+	unsigned long gcs_mode;
+	long rc;
+	int pidfd;
+	int vmas0, kb0, vmas1, kb1;
+	int i, kept, d, cret;
+
+	setbuf(stdout, NULL);
+
+	if (!(getauxval(AT_HWCAP) & HWCAP_GCS)) {
+		printf("[SKIP]\tHWCAP has no GCS\n");
+		return KSFT_SKIP;
+	}
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
+	rc = my_syscall2(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &gcs_mode);
+	if (rc) {
+		printf("[FAIL]\tPR_GET_SHADOW_STACK_STATUS returned %ld\n", rc);
+		return 1;
+	}
+	if (!(gcs_mode & PR_SHADOW_STACK_ENABLE)) {
+		rc = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+				 PR_SHADOW_STACK_ENABLE);
+		if (rc)
+			return skip_enable(rc);
+	}
+
+	gcspr = (unsigned long)get_gcspr();
+	if (!gcspr) {
+		printf("[FAIL]\tenable left GCSPR_EL0 at 0\n");
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
+	gcspr = (unsigned long)get_gcspr();
+	ss_scan(&vmas0, &kb0, gcspr, &parent, NULL, NULL);
+	if (!parent.start) {
+		printf("[FAIL]\tGCSPR %lx matches no shadow-stack VMA\n", gcspr);
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
+	gcspr_mid = (unsigned long)get_gcspr();
+	d = -1;
+	if (kept && gcspr_mid)
+		d = depth(16);
+	gcspr = (unsigned long)get_gcspr();
+
+	printf("ss_vmas=%d->%d delta=%d ss_kb=%d->%d\n",
+	       vmas0, vmas1, vmas1 - vmas0, kb0, kb1);
+	printf("parent=%lx-%lx kept=%d gcspr_before_depth=%lx depth=%d gcspr=%lx\n",
+	       parent.start, parent.end, kept, gcspr_mid, d, gcspr);
+
+	if (vmas1 != vmas0 || kb1 != kb0) {
+		printf("[FAIL]\tleaked %d shadow-stack VMA(s), %d kB\n",
+		       vmas1 - vmas0, kb1 - kb0);
+		_exit(1);
+	}
+	if (!kept) {
+		printf("[FAIL]\tparent GCS %lx-%lx was unmapped\n",
+		       parent.start, parent.end);
+		_exit(2);
+	}
+	if (!gcspr_mid) {
+		printf("[FAIL]\tparent GCSPR was 0 before call/return\n");
+		_exit(2);
+	}
+	if (d != 17) {
+		printf("[FAIL]\tparent call/return returned %d, want 17\n", d);
+		_exit(2);
+	}
+	if (!gcspr) {
+		printf("[FAIL]\tparent GCSPR is 0 after call/return\n");
+		_exit(2);
+	}
+
+	printf("[OK]\tno GCS VMA leak; parent stack still works\n");
+	_exit(0);
+}
-- 
2.43.0


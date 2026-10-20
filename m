Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520397;
	b=UZoHaGQLIxOUW6drJn9OrOirV5UQyxeuj4dN+mGY5s3tzSRMiQwwwmGBWNmtO8BvyUaN
	 tTXeutBwYfCq0Bd2Rp+C+Bp70K7/OI9lc0VWj89NrAY7qWDmrzYctIsvDE9SPw1w5UICs
	 8nEzBIMuIGxNdTnXbe8Pp3DAhcai/MunoxslEJxy2AyekfvzrNpBXMVx1F3r3DnxR2NF7
	 RXv9JLYE4nKvER+L3/mX287NmGmsfgG8Tyt7SqtZK6nFDNr8hXcYMsuJUG4pHgPXlWzHK
	 0t405ZE0vxpyNUmC72PRX2HxxKiT5sSox/9MrCZDgXCD3VsATsNOOIJ/s44QNQeT8pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ODwfS8M8SXuoEAx3U0UwYdL7MiECVNqk0msYC5n17UI=;
	b=CWpC8YkIITNNMrycgSU43LlQmDw+/twKvXHVcpeZZV876wzUMMaACVTE1AE7CviVzyTh
	 Wf491BfkeiCynJgMJXvvjKmeVnGk8I4t7+HIrjDGMU7SgKAFazs5CP4kEwFmEu0jatIll
	 vIEAo+sIucZ47CDrkyAfO3//6CXLH1kI7EDLWE5OZYxzF3yDfTQCvzcYWFQUBKNb8R3Cz
	 sTyFZHk96x75HPA7ow1raIRZyOLMH6YgwubqkrOsw1REvmopoGVYyz9N1kv8GqBYplNjA
	 8b1bqxY6LaZLFh2sjhMozS/ladiKgzxz1jaVBFlrmxPIYucfw20UYUrn6u6FBhEyaxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WCJAuynP;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7628606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 18:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7628606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WCJAuynP
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1845067eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520396; x=1793125196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ODwfS8M8SXuoEAx3U0UwYdL7MiECVNqk0msYC5n17UI=;
        b=WCJAuynPIXaXCLZSScUBe6YnW12OLKwxvrMAAnG4DWxFBQbx8F1PJWmAtEJm2mrYWM
         r4+W/sgdSot2n2L3N7sqPDFdz+Vg8bfShwWXDU9wXcK0uEht3ty52dPFGlKSLgXT9AxX
         iT0yPe+YUvihtfFmDoJBXrlg99DnjrhaZ/vVnwKsH72DZggDaqsU2WTrIJ5Brq28JNSV
         MSdq0zDDkCbMA9ilMtsJvjSYxr7nb7MNK1FE7DQpPay+QczbTOnCtX05J1tqgG5ms7Av
         e9TSisNyWBLohavrKCXTDmMRbLB2knpZa2xyD1gSA1t2SnQoswNb9i07PA15UQfKv2MX
         W11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520396; x=1793125196;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODwfS8M8SXuoEAx3U0UwYdL7MiECVNqk0msYC5n17UI=;
        b=gPKjEnaHMTAp8t6n5Y8xW0xigF6yBVzQs1BHXot/hkZy2dJzoib3/y5asxW6/tCvYM
         +0U4DxQiFiw/rPKa57PpLfkppbBgZwHwDGOEyzZA6IuXDKwHFaT/OEBcH33lmWmE7nTf
         bHSxZBVqCDF2gixnLrdYeHri1yYd/bTZpRqIAjBD/REiRQhGO84qL7tboKvrI63uexC+
         R1s+HksqmGTurGWjYrjMrJpi/KZvEdIxUkFtwulVd0NQSL6kI8ZBa3WSCssUSHAkRTY6
         d2cVvOPf2/jZMfeRAGxr9gVnzbcTV/COMC+wqIkcLBjCWjMm3gM++532BgbYoI1ZpRql
         5RyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcwLVBHkGkpkMLj8gm60rE16AXDMB6BRhx0rLUAbBdgnqC5fc883JukN2eoQ4UJ9MX7xfOjRFWlpHH/TjCgiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBnyRwV7EczMP2v3N36gCtWvdJl+A8roqXwvxuFebkNKcx6e8I
	ESnFB88jGR98J51PY2S8hI+lRNjNx3gzhK0A7AiH8QX9eqVbhdD+85P7
X-Gm-Gg: AYBFou1iACkrL2Xe8mlGMRMj2nRkna+CRW6ajalkxLQ3jxKluyo1REKFh2uNwaa72bo
	iPOpSCqu6wVr+2j7gUbEMsxN5taD5m1ZCJQM02VqGykgEHjVU7ePuCxPieapeL8zuGwnCFHF6zm
	kc1fdQIYuN95Y3TZbiP7QhppwgTL3VS2yObA+0MQ2TC5guATN2w8T24aZvy2JcU4MxGH0cnAmuY
	7pXlNxlCsGdLFWTtGQ+WtRRXjU6EjuZltm/oith0JXEz78utkz0kaBCrMkxoXrYbJWXzbSy1mwz
	uhuFjqVtYjgpqrpjIO11sEa2yk49Amd6NR08mmreDXu26YF8I/4LWYffp+qtAP+fYxsiHGVM8Ek
	op2GD2ARwjR7f774AUjMrl+y+vYpzAI9N/LD4VEsamNGnf+eYG8bN5KeZg9SJit1Tzgdimzzul4
	/BHTCmlCOb+fEQUmXY+CSXiWx9Q+Rl5NAZzFnAkHHH4DWWJgpz+PgRc++R62ReLa5Rd6RTgztjm
	0s=
X-Received: by 2002:a05:7300:8812:b0:35b:da8b:f88c with SMTP id 5a478bee46e88-367508eb4dbmr34905eec.41.1792520395576;
        Tue, 20 Oct 2026 11:19:55 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:19:55 -0700 (PDT)
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
Subject: [PATCH v2 3/4] selftests/arm64: GCS must not leak on a failed clone3
Date: Tue, 20 Oct 2026 15:19:32 -0300
Message-ID: <420e012252ed09cdb83d18512488fd2535ffc7fa.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792519121.git.ivanrwcm25@gmail.com>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
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

clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer fails
in put_user() after copy_thread() has mapped a GCS. copy_process()
then calls exit_thread(). Without HAVE_EXIT_THREAD that free is a
no-op and the VMA stays in the parent's mm.

Use kselftest.h / KTAP. Skip paths that cannot run the regression
run before ksft_set_plan(). Then confirm a valid clone3 writes a
pidfd, reject 16 bad-pidfd clones with -EFAULT, and require the
shadow-stack VMA count (VmFlags " ss") to stay unchanged.

ENOSYS, EINVAL, and EPERM from the valid clone skip; any other
error, or a success that leaves pidfd unset, fails. The rejected
child exits with a raw svc. The test expects /proc already mounted.

Move my_syscall2 into gcs-util.h and reuse it from gcs-locking.c and
libc-gcs.c.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 168 ++++++++++++++++++
 .../testing/selftests/arm64/gcs/gcs-locking.c |  20 ---
 tools/testing/selftests/arm64/gcs/gcs-util.h  |  24 +++
 tools/testing/selftests/arm64/gcs/libc-gcs.c  |  20 ---
 5 files changed, 194 insertions(+), 41 deletions(-)
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
index 000000000000..96400ea376c0
--- /dev/null
+++ b/tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer must
+ * not leak a GCS VMA. copy_thread() maps one, then put_user() fails
+ * and copy_process() calls exit_thread(). Without HAVE_EXIT_THREAD
+ * that free is a no-op and the VMA stays in the parent's mm.
+ *
+ * After enabling GCS, do not return from main(): libc frames above
+ * that point have no GCS entries.
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
+#include "kselftest.h"
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
+#define NCLONE			16
+#define STACK_SIZE		(64 * 1024)
+
+static int count_ss_vmas(void)
+{
+	FILE *f;
+	char line[256];
+	int vmas = 0;
+
+	f = fopen("/proc/self/smaps", "r");
+	if (!f)
+		ksft_exit_fail_msg("fopen /proc/self/smaps: %s\n",
+				   strerror(errno));
+
+	while (fgets(line, sizeof(line), f)) {
+		if (!strncmp(line, "VmFlags:", 8) && strstr(line, " ss"))
+			vmas++;
+	}
+	fclose(f);
+	return vmas;
+}
+
+/*
+ * CLONE_VM maps a new GCS. CLONE_PIDFD lets put_user() fail after that.
+ * Use a raw svc: the child resumes on an empty GCS, so a libc return
+ * after clone3 would fault; exit the same way.
+ */
+static long clone_pidfd(void *stack, size_t stack_size, int *pidfd_ptr)
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
+int main(void)
+{
+	void *stack;
+	void *bad_pidfd;
+	unsigned long gcs_mode;
+	long rc;
+	int pidfd = -1;
+	int vmas0, vmas1;
+	int i, n_efault = 0;
+
+	ksft_print_header();
+
+	if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
+		ksft_exit_skip("GCS not supported\n");
+
+	stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+	if (stack == MAP_FAILED)
+		ksft_exit_fail_msg("mmap stack: %s\n", strerror(errno));
+
+	bad_pidfd = mmap(NULL, 4096, PROT_NONE,
+			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (bad_pidfd == MAP_FAILED)
+		ksft_exit_fail_msg("mmap pidfd page: %s\n", strerror(errno));
+
+	rc = my_syscall2(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &gcs_mode);
+	if (rc)
+		ksft_exit_fail_msg("PR_GET_SHADOW_STACK_STATUS: %ld\n", rc);
+
+	if (!(gcs_mode & PR_SHADOW_STACK_ENABLE)) {
+		rc = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+				 PR_SHADOW_STACK_ENABLE);
+		if (rc == -EOPNOTSUPP || rc == -EINVAL || rc == -EBUSY)
+			ksft_exit_skip("cannot enable GCS: %ld\n", rc);
+		if (rc)
+			ksft_exit_fail_msg("PR_SET_SHADOW_STACK_STATUS: %ld\n",
+					   rc);
+	}
+
+	rc = clone_pidfd(stack, STACK_SIZE, &pidfd);
+	if (rc == -ENOSYS || rc == -EINVAL || rc == -EPERM)
+		ksft_exit_skip("clone3 valid pidfd unavailable: %s\n",
+			       strerror(-rc));
+
+	ksft_set_plan(3);
+
+	ksft_test_result(rc == 0 && pidfd >= 0,
+			 "clone3 valid pidfd (rc=%ld pidfd=%d)\n",
+			 rc, pidfd);
+	if (pidfd >= 0)
+		close(pidfd);
+
+	vmas0 = count_ss_vmas();
+
+	for (i = 0; i < NCLONE; i++) {
+		rc = clone_pidfd(stack, STACK_SIZE, bad_pidfd);
+		if (rc == -EFAULT)
+			n_efault++;
+	}
+	ksft_test_result(n_efault == NCLONE,
+			 "clone3 bad pidfd returns -EFAULT x%d\n", NCLONE);
+
+	vmas1 = count_ss_vmas();
+	ksft_test_result(vmas1 == vmas0,
+			 "no GCS VMA leak (%d -> %d)\n", vmas0, vmas1);
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/arm64/gcs/gcs-locking.c b/tools/testing/selftests/arm64/gcs/gcs-locking.c
index 1e6abb136ffd..61789bdd2744 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-locking.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-locking.c
@@ -18,26 +18,6 @@
 
 #include "gcs-util.h"
 
-#define my_syscall2(num, arg1, arg2)                                          \
-({                                                                            \
-	register long _num  __asm__ ("x8") = (num);                           \
-	register long _arg1 __asm__ ("x0") = (long)(arg1);                    \
-	register long _arg2 __asm__ ("x1") = (long)(arg2);                    \
-	register long _arg3 __asm__ ("x2") = 0;                               \
-	register long _arg4 __asm__ ("x3") = 0;                               \
-	register long _arg5 __asm__ ("x4") = 0;                               \
-	                                                                      \
-	__asm__  volatile (                                                   \
-		"svc #0\n"                                                    \
-		: "=r"(_arg1)                                                 \
-		: "r"(_arg1), "r"(_arg2),                                     \
-		  "r"(_arg3), "r"(_arg4),                                     \
-		  "r"(_arg5), "r"(_num)					      \
-		: "memory", "cc"                                              \
-	);                                                                    \
-	_arg1;                                                                \
-})
-
 /* No mode bits are rejected for locking */
 TEST(lock_all_modes)
 {
diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing/selftests/arm64/gcs/gcs-util.h
index 7a81bb07ed4b..46f6ed9cf54d 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-util.h
+++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
@@ -43,6 +43,30 @@
 #define GCS_CAP(x) (((unsigned long)(x) & GCS_CAP_ADDR_MASK) | \
 		    GCS_CAP_VALID_TOKEN)
 
+/*
+ * prctl(..., arg1, arg2) with unused registers forced to zero.  The
+ * kernel rejects non-zero unused args; libc may leave garbage there.
+ */
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
 static inline unsigned long *get_gcspr(void)
 {
 	unsigned long *gcspr;
diff --git a/tools/testing/selftests/arm64/gcs/libc-gcs.c b/tools/testing/selftests/arm64/gcs/libc-gcs.c
index ddb0b2b20155..4e9fa9b82f0f 100644
--- a/tools/testing/selftests/arm64/gcs/libc-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/libc-gcs.c
@@ -24,26 +24,6 @@
 
 #include "gcs-util.h"
 
-#define my_syscall2(num, arg1, arg2)                                          \
-({                                                                            \
-	register long _num  __asm__ ("x8") = (num);                           \
-	register long _arg1 __asm__ ("x0") = (long)(arg1);                    \
-	register long _arg2 __asm__ ("x1") = (long)(arg2);                    \
-	register long _arg3 __asm__ ("x2") = 0;                               \
-	register long _arg4 __asm__ ("x3") = 0;                               \
-	register long _arg5 __asm__ ("x4") = 0;                               \
-	                                                                      \
-	__asm__  volatile (                                                   \
-		"svc #0\n"                                                    \
-		: "=r"(_arg1)                                                 \
-		: "r"(_arg1), "r"(_arg2),                                     \
-		  "r"(_arg3), "r"(_arg4),                                     \
-		  "r"(_arg5), "r"(_num)					      \
-		: "memory", "cc"                                              \
-	);                                                                    \
-	_arg1;                                                                \
-})
-
 static noinline void gcs_recurse(int depth)
 {
 	if (depth)
-- 
2.43.0


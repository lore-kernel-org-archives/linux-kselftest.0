Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202281;
	b=rwO8CVPf1aKBB9ycT+XhjTXNls+07XRhhvBA6jprqVkMTn7RrcckZLqHUrXJb2ReD9Mo
	 6gzVuMc5X1Z1fj6cZQUfgVxYdwpa4G+SnEzbAJlaPokbmil7ukVqlcXS62ktPoAQH1ShO
	 lz/DDtOHlv96HRSQ6U0X78ki9OANMWxB+1MI0vbZ+oqnwQDUTzlgT7xXPZq/e+vWg2o1K
	 zea8KA4rEiWJ9HLZMG4nYNDPt29qZ4Z97NeNHTpGXxxWCV6RCUCr3Kj7tL38J22PrCdMA
	 Kde9M+Iyg7bYWOLOqTryygOMDsTlIw5mOxsdfya5W8Kt8cVERlKwiTiD8l7rhmPwJBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ms02nrJTaBuo+AIaXcDfc5FWiw4agEchEQ/tyzSsLpc=;
	b=UayGGEapqPumh8pDcnXkU+ZwP3OfEa7OhlsAZViSSLdWRqvcTdkG2ZOs0nlL0b41BiSU
	 SD6AqE9fAyWJALcZ4UfkuqYuq5zzhwlTy9onhAMRvfV+wTYyT3fmc2GmWtEj+7rLWEOx1
	 mfTWQXqk2Cu1FHZwYOAHOW5qgtwU3wWLXy+JQ1X3hVeqObRjEqM2N3JI8UOe9T7hvsbv9
	 zKfnY47s5Q2+y8CFIHr1HLSD2iU9ClVkTVVoDOjY2qbb53d9AZ8syCBHuaRsikgJbPS6e
	 MTI2rYRUkAbZkRsDWaBHevwrtwF8a2LiTlnyLYyupqH1jcJvXhJILf9jt7imoQd6Rnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9HjNIMr;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D01060A6F6C
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D01060A6F6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9HjNIMr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso9882095e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202279; x=1793807079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ms02nrJTaBuo+AIaXcDfc5FWiw4agEchEQ/tyzSsLpc=;
        b=u9HjNIMrCZDNu/6Fq/2AJBkVWhqvixpit3P2sLm/TertR3NAlkmZPZrxTQ1oEVadoO
         7cnhUmEix6B4k2ezBjAq+nzHgfYfHJoFNGMaVYHVxAFW9ZTQ202504POIAt9DwOMf8F3
         /MdQyVN3tbrC2y160Kf3wfgkA5YYmyjT5jhgYkT0shIdTePFzTE3BiFYBfJ89epE8/cF
         T4Lx35UVSzfYPsr3vIHKgHFKUJsyhN03/zNARHxLw41KXGHfET4IbaiOuyEMA2+wM2Ij
         gMfXTkJUnakZhntr4ikZGuXR0oRclE0w9UCmpBEp2l59mQaBDx3DKoQ90PWlcypKsGCn
         nnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202279; x=1793807079;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ms02nrJTaBuo+AIaXcDfc5FWiw4agEchEQ/tyzSsLpc=;
        b=Gof4kVU2dHYpYlmWq35aM42/+ecIDu81M18QlAs8wdgiGn7zz3Hw0scX4WXI376QZi
         7/xyzgdOOlXcKf4GeHnw1c7U3Of1P9RIm3Da3DXvh+IY4ZQ8v0d6jIWO06wF8roElYX1
         nvOITViPNSQuwmqB4IDFnjgZ4hK9iOtLHwy/mjUrLkNKP18qbvEycwRTeKaA3Y+v9mt3
         zN9xoJM/JNxKQh/4Sc+iXHCK3qHXao2ebTQW/Da7bPb8M/imYhnV6Ey3+9T2aBDaynLR
         4ZO5yEt7HusR9K6WYJ5uVAdm6b7c6NCqoMjlC4iOGLC7g5FSwum+yh10mkh55p7GUKCA
         +2fw==
X-Forwarded-Encrypted: i=1; AKwUvBze/2KvRJPBrCr3YTz8+1YLpT6Sc+kmD9Qgjwv8LKMvXhcXfJXDrjKI88i8QUukDAVtNcfPKFd2Xb/+qAkoo7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaw/RyiNTdRajyo45Nl5saPfGeiVTZy8ViIG4w0jRueI4l/m5Y
	5mo6vIgwScLZBlm4xIn8JhkK5MI71NSNOp13kvvEHDDEidx/XmNUSGME
X-Gm-Gg: AYBFou0glzxBBk8Kz0scSnGzcQu+LEMAL4vUh2hMi5gZI6quFDribk0+a20NtVGzDam
	bvqupLvNEpmS02/qUjuL339bDkN+M/thh9Ev3Apq3zeMhb0CsYAyYYX+/rMIGviPliTvletJ9dj
	IeffuY2f/1bZeiuYse0qak1dCyTHQ085MHoANs6cCWPvTQBP9nldLvIyrtBWcWP1CtApoI/97YM
	RwHfD5W9BHVnKEc3KhmLJ6bkhEX0Sgcd+vFh8ZfRpylUhlLd7z6Af2J01kiXme0Dqzi97CitKvg
	i3Sh2DLIiMEg54+a7+50GtlC6gzhML04b+yIKlGYKmaBgWZIwVP/rNHUdSyd3R3c/gioHC9Hs6s
	QXnnvhy6GrNkCWzdoKOkDM45CkNkFX9YWnML1B1u3ziutkEADId0qWlzkh6x2AMN4jXsDOys2rr
	HTzxTHCStlV5Z1a1wnrxENinBk6u7eRkNGiqNkYZQwvHusSK7TuRHzvxjoxBwqFUDRfpw+soNMj
	rylTWwFEceZuTllwiFHhWkgLp5EXAlL2h6xrUon9NO8pXN9zHO32LOitiltVLQTyE6pLTdzcwvj
	LFYpObdh0PDgPBfxlf81w/8RKpPpC+5ZxGDwNNAIhUPk8AmkjcHgnk/JJ42axhcaXA==
X-Received: by 2002:a05:600c:6211:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4a965ec94ffmr51952945e9.11.1793202278790;
        Wed, 28 Oct 2026 08:44:38 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:37 -0700 (PDT)
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
Subject: [PATCH v3 3/4] selftests/arm64: GCS must not leak on a failed clone3
Date: Wed, 28 Oct 2026 12:43:14 -0300
Message-ID: <20261028154315.1272705-4-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
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

KTAP coverage for clone3(CLONE_VM|CLONE_PIDFD) with a bad pidfd
pointer: sixteen failures must not grow the parent's GCS VMA count.

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
index 80a1317f6097..8877fd2d2eab 100644
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


Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9642C37C0E3
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380778; cv=none; b=EwUF8T0AuoChZt5ug1eaFCIV5QGisY8zlU4GM3F9LgZp9TYWXCy7LS6MvCIOpYUAexAGv/KPdsyiCQ+0xOqiHNp/VY3SPZwkrRabDp+r6RlfEkkuJO0+i0dUdpbt29XBDBa0oL82xxbdPYFaYW9QYY5a7rAnHq/MQG8KUqUJVuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380778; c=relaxed/simple;
	bh=DHXW2vxPeh0rbI5oFBZWIWB2Z4TndodVPBY1uRpcX8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snpWpjd3dBv4jwMoWUsXaJ93yuVkmOcwvgxzy0hj3P0MJnuMk9QbDpeDRTL3QnFKmujHOF/FE2YsnXmmv1KY05eOF477EIx4wmoHLo8C693na9r4A8p3AYkCFc4GbJmsboc5HlaH65ht1hWmEpls78hVOMtRccVOpNmHERajrLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=HzCsKtt0; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="HzCsKtt0"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7c23248f3a3so67804957b3.1
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779380775; x=1779985575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9FDf4DlWCdet9ejsQPRXtBBttAImyKEU2oe9Q8ZuQA=;
        b=HzCsKtt0xhoHxNSm2hbHindVUton1kxlQWjBxl9drb5LZg29GlSNPwa97CRRqofDAT
         ZcfV3/Rci6wWM0Wbv8eqo3TNO5OSD2tvhrJHUMlXu7J7exbT0RawfyR5x4z8oc1Hrquu
         oV1DahQ9qr9IfkAHmL3U0XUcSFKY0g3AkgTN0RqUKAM5Xnl/dgh8zXnDOzKW8fvvB3+B
         6/+eU250AG7wkwYaZA7nHj6Y8W69YiUw1VYaPhq4sopcn0EeH2StRzMsZskeqVU8CAyV
         ExcIiMH9m5v/wta9yPR4AtlDvOQMPZb0T6JKpSC+CKKtEJDTy3EQghFhaCEzLWkYu+mD
         zFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779380775; x=1779985575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J9FDf4DlWCdet9ejsQPRXtBBttAImyKEU2oe9Q8ZuQA=;
        b=rs9FtsYqiR4DuOrNf5S3xmRXguoukEYCdYsmgqWo2XZ4gD6P3kre6SQjBLTBjmqvCC
         WkHV1pdvmzF4yWZUM9BGFkU7AViswX0uH08Viou46DDunKFnI0g1k7SehZF6DDuPuQ9k
         s61lT3VY2PD9sfRwrEHySp9vwnZOwJQjFV+dtda4kDFQRGIXTAJ8HQs63kydAPAqYXeE
         XehyNtLxp6Dy14o76EFhRFtBaj0BqlTVCy/KukScvLdTIpYZyPZR0x5bMwh3Cvve8X4z
         aVSC3sNmJS9GS7OQqTwWnSFtYjd4Lp3jMOxIU7z2+D6i824M01UmKNUQixuZFQ16YA58
         zfjA==
X-Forwarded-Encrypted: i=1; AFNElJ/eFaAhNuA2NURm73l8pTF7877psytGrMCXZIUBVWpyS0XfsUVcKD/Roe0quiuiApLCUXbpvRVbAF0v9FCQ4mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLt5o3DcETa1S3ZMrjv3nD2dLN3fxucz5YhHVKe2/f0rgSHUef
	TdouKnWuo0/nJr4+yLN6epNV9/8VAdVjONuJWMvovXV7ttjJQxdZeWwlYr+ZDOSXUzw=
X-Gm-Gg: Acq92OHYkcefTRfwGSNP012BrvTYXfSRFY+rQ7vGoHwwf3OyOWqR1FOHtz6leyaSr4e
	z1qdHvCMlNW54+hcSt+RAQPp+X78uNVDlAl4nDZC9uIi6eUdbqLeYCquOl4v0JumEdnnoECoz0Y
	bNOET8bzQjWp8qQzJHwRTU4zQ7ofRqbqCXUmtoEUxP77s5R8g03zC/uUQBu1gmBn9M+isWSD4j9
	Pw6PWps35CoXuZScHKE16FuBupZUEU4JXRc0HuqLmVICyBB70bHnsk3PDAHx+RPWPwfyAWx4XVN
	x2OWAjJ9FFa9I7/JOkAbFfHWTfrK49Gc0BE3HNimICX9I93DKCLVlQDrXopz33/Inr8FkN6YxCy
	85IRwhe2RxjlM50+Aws3tsRcYC9vao1bAXmnDhH5FL/wrkfulz2jFPM1j1uZxDrTKJeQbi9AgEp
	aY7Enj5lPYE47zvE5hrSQPGOMyxQSEWA504ozkoQE5FXcfHurzEaUFq82qJxY9pesYsks=
X-Received: by 2002:a05:690c:7346:b0:7a2:842a:db7e with SMTP id 00721157ae682-7d20d020fdamr39734727b3.35.1779380774903;
        Thu, 21 May 2026 09:26:14 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2ca76a8cbsm4822007b3.32.2026.05.21.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 09:26:14 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: [PATCH v3 4/4] selftests: riscv: extend vector tests for sigreturn and ptrace
Date: Thu, 21 May 2026 11:25:20 -0500
Message-ID: <20260521162521.188629-5-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521162521.188629-1-tchiu@tenstorrent.com>
References: <20260521162521.188629-1-tchiu@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new test cases to verify the vector state restorations at syscall
stops for ptrace and signal interfaces. Specifically:
1. Signal handler should read all ones at syscall stop and modifying
   context should success.
2. Ptrace should read all ones but any modification to NT_RISCV_VECTOR
   is silently dropped.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v3:
 - new patch since v3
---
 .../selftests/riscv/sigreturn/sigreturn.c     |  78 ++++++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 100 +++++++++++++++++-
 2 files changed, 177 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
index e10873d95fed..c7d8cac80efb 100644
--- a/tools/testing/selftests/riscv/sigreturn/sigreturn.c
+++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
@@ -3,10 +3,12 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <ucontext.h>
+#include <sys/time.h>
 #include <linux/ptrace.h>
 #include "kselftest_harness.h"
 
 #define RISCV_V_MAGIC		0x53465457
+#define END_MAGIC		0
 #define DEFAULT_VALUE		2
 #define SIGNAL_HANDLER_OVERRIDE	3
 
@@ -61,6 +63,82 @@ static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
 	return after_sigreturn;
 }
 
+#define V_TEST_PATTERN_SIGNAL 0x98
+int nulled_val;
+static void sigalrm_handler(int sig, siginfo_t *info, void *vcontext)
+{
+	ucontext_t *context = vcontext;
+	struct __riscv_extra_ext_header *ext;
+	struct __riscv_ctx_hdr *hdr;
+	uint8_t *ext_ptr;
+
+	/* Find the vector context */
+	ext = (void *)(&context->uc_mcontext.__fpregs);
+	ext_ptr = (uint8_t *)ext;
+	hdr = &ext->hdr;
+
+	while (hdr->magic != END_MAGIC) {
+		if (hdr->magic == RISCV_V_MAGIC) {
+			struct __riscv_v_ext_state *v_state = (struct __riscv_v_ext_state *)(hdr + 1);
+			/* Assume a valid datap */
+			nulled_val = *(int *)v_state->datap;
+			/* Fill all vector registers with magic pattern */
+			memset(v_state->datap, V_TEST_PATTERN_SIGNAL, v_state->vlenb * 32);
+			/*
+			 * We must also set the vector configuration so that when
+			 * userspace reads v0, it uses a valid element width (e8).
+			 */
+			v_state->vl = v_state->vlenb;
+			v_state->vtype = 0; /* e8, m1, tu, mu */
+			break;
+		}
+		/* Move to the next extension header */
+		ext_ptr += hdr->size;
+		hdr = (struct __riscv_ctx_hdr *)ext_ptr;
+	}
+}
+
+TEST(test_signal_syscall_ucontext) {
+	struct sigaction sa;
+
+	/* Make sure we get V in ucontext by executing vsetvli */
+	asm volatile (
+	    ".option push\n\t"
+	    ".option		arch, +v\n\t"
+	    "vsetivli	x0, 1, e32, m1, ta, ma\n\t"
+	    ".option pop\n\t" : : :);
+
+	sa.sa_flags = SA_SIGINFO;
+	sa.sa_sigaction = sigalrm_handler;
+	sigemptyset(&sa.sa_mask);
+	if (sigaction(SIGALRM, &sa, NULL) == -1)
+		ksft_exit_fail_msg("Failed to register signal handler\n");
+
+	/* Setup a 10ms timer to unblock us from pause() */
+	struct itimerval itv = {{0, 0}, {0, 10000}};
+
+	setitimer(ITIMER_REAL, &itv, NULL);
+
+	pause();
+
+	/*
+	 * If the kernel successfully parsed and restored our modified ucontext,
+	 * v0 will contain V_TEST_PATTERN_SIGNAL.
+	 */
+	unsigned char v0_val;
+
+	asm volatile(
+			".option push\n\t"
+			".option arch, +zve32x\n\t"
+			"vmv.x.s %0, v0\n\t"
+			".option pop\n\t"
+			: "=r" (v0_val)
+		    );
+
+	EXPECT_EQ(v0_val, V_TEST_PATTERN_SIGNAL);
+	EXPECT_EQ(nulled_val, -1);
+}
+
 TEST(vector_restore)
 {
 	int result;
diff --git a/tools/testing/selftests/riscv/vector/vstate_ptrace.c b/tools/testing/selftests/riscv/vector/vstate_ptrace.c
index 1479abc0c9cb..7952885a04c7 100644
--- a/tools/testing/selftests/riscv/vector/vstate_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/vstate_ptrace.c
@@ -21,6 +21,41 @@ static long do_ptrace(enum __ptrace_request op, pid_t pid, long type, size_t siz
 	return ptrace(op, pid, type, &v_iovec);
 }
 
+static int do_child_syscall_stop(void)
+{
+	int out;
+
+	if (ptrace(PTRACE_TRACEME, -1, NULL, NULL)) {
+		ksft_perror("PTRACE_TRACEME failed\n");
+		return EXIT_FAILURE;
+	}
+
+	raise(SIGSTOP);
+
+	asm volatile (".option push\n\t"
+		".option	arch, +v\n\t"
+		"vsetivli	x0, 1, e32, m1, ta, ma\n\t"
+		"vmv.s.x	v31, %[in]\n\t"
+		".option pop\n\t"
+		:
+		: [in] "r" (child_set_val));
+
+	getpid();
+
+	asm volatile (".option push\n\t"
+		".option	arch, +v\n\t"
+		"vsetivli	x0, 1, e32, m1, ta, ma\n\t"
+		"vmv.x.s	%[out], v31\n\t"
+		".option pop\n\t"
+		: [out] "=r" (out)
+		:);
+
+	if (out != -1)
+		return EXIT_FAILURE;
+
+	return EXIT_SUCCESS;
+}
+
 static int do_child(void)
 {
 	int out;
@@ -109,11 +144,62 @@ static void do_parent(pid_t child)
 	free(data);
 }
 
+static void do_parent_syscall_stop(pid_t child)
+{
+	int status;
+	void *data = NULL;
+
+	while (waitpid(child, &status, 0)) {
+		if (WIFEXITED(status)) {
+			ksft_test_result(WEXITSTATUS(status) == 0,
+					 "SETREGSET vector at syscall stop\n");
+			goto out;
+		} else if (WIFSTOPPED(status) && (WSTOPSIG(status) == SIGSTOP)) {
+			/* Attach to the child at syscall stop */
+			ptrace(PTRACE_SYSCALL, child, NULL, NULL);
+		} else if (WIFSTOPPED(status) && (WSTOPSIG(status) == SIGTRAP)) {
+			size_t size;
+			void *data, *v31;
+			struct __riscv_v_regset_state *v_regset_hdr;
+
+			size = sizeof(*v_regset_hdr);
+			data = malloc(size);
+			if (!data)
+				goto out;
+			v_regset_hdr = (struct __riscv_v_regset_state *)data;
+
+			if (do_ptrace(PTRACE_GETREGSET, child, NT_RISCV_VECTOR, size, data))
+				goto out;
+
+			ksft_print_msg("vlenb %ld\n", v_regset_hdr->vlenb);
+			data = realloc(data, size + v_regset_hdr->vlenb * 32);
+			if (!data)
+				goto out;
+			v_regset_hdr = (struct __riscv_v_regset_state *)data;
+			v31 = (void *)(data + size + v_regset_hdr->vlenb * 31);
+			size += v_regset_hdr->vlenb * 32;
+
+			if (do_ptrace(PTRACE_GETREGSET, child, NT_RISCV_VECTOR, size, data))
+				goto out;
+
+			ksft_test_result(*(int *)v31 == -1, "GETREGSET vector at syscall stop\n");
+
+			*(int *)v31 = parent_set_val;
+			if (do_ptrace(PTRACE_SETREGSET, child, NT_RISCV_VECTOR, size, data))
+				goto out;
+		}
+		ptrace(PTRACE_CONT, child, NULL, NULL);
+	}
+
+out:
+	free(data);
+}
+
 int main(void)
 {
 	pid_t child;
 
-	ksft_set_plan(2);
+	ksft_set_plan(4);
 	if (!is_vector_supported() && !is_xtheadvector_supported())
 		ksft_exit_skip("Vector not supported\n");
 
@@ -130,5 +216,17 @@ int main(void)
 
 	do_parent(child);
 
+	parent_set_val = 0x53355457;
+	child_set_val = 0x49504F21;
+
+	child = fork();
+	if (child < 0)
+		ksft_exit_fail_msg("Fork failed %d\n", child);
+
+	if (!child)
+		return do_child_syscall_stop();
+
+	do_parent_syscall_stop(child);
+
 	ksft_finished();
 }
-- 
2.43.0


Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E26E343D8A
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995483; cv=none; b=iw0MT2Jx0XhTiF9/F/o+vA4pur5VOIaFVXPm1Lr9dJhjtUKX23FvZud4BieZUFz2Ijc0mnpx0qpyCE98foBtEt6V8wMSlG27hP0aAqz/y1RT3/W3uPOV4mvrEH+V4D5Y+hgWilDxLzV/xauuTKvgAG+gmdxZ/HzZLkghzkCJcjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995483; c=relaxed/simple;
	bh=4obCzAmw0zrncbU1ubw6ygLwj60cV+pHfK4MmgYhFH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D2jqUMPfm+Aa/UeorexwSEQ180BxmU2WtVIlqMKx3DlapsQmaYM3XieKYJhefDma1V0WqPc9nDy568ERsq6KRLosqv3MG7pyNK4F3Izd8wmfPh47eO3WV94bl1NB5F8UBiL6mBqktRovIwNEwRzAXX9dRLiC39DOZpWGr7rVO6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=d5r1PxwE; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="d5r1PxwE"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e4de538f83so7448740a34.1
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 12:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779995480; x=1780600280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
        b=d5r1PxwEjDHGvPFgmBM9IT11BYrKSuEE8QyyB1fS0GNlwFuN8QAnkrIchB6Zzi5jYi
         11OsniMZj8G37TNKqVRws26o8yEIeZf9kthdMEqOx0uGuKWrHMTeYUgUrz/dQYFaOlap
         14ixRYtzfKYqsn+RQ5uM9jbEAjjstPiOj0aILd1mRlpac4i+ANI37nAVnybQAHmD9e45
         XO0y7tWQ4IFKwZPjb8tMhKO9eVpw3p2bvjo9NHddfXofJmCp3P3WTEfqGQKNfY2hBsjR
         a8qDvF1a9WTK29wh0lN1sH/dyW15llFy4GbUIW07ng+9khnE7a98SH+IHjKx3L+lF+SZ
         WjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995480; x=1780600280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
        b=c+kT75lZZnKNbA1Hkm5kUScmeyo8ZKW1qjxTvysD1BBt4xlO2SHWoB3Ww3TKRmm1pP
         gvS6PMMDVio0+Cdt0BkcQm6/nqgHJrZ+3Goya+EDbll7ia93GssYD66Y/tGBYUkWe4xP
         yU6+xpT8zEWuYrKnTEC1Gxok+Ny5Z7iwmAGhxe7Q8I/CRDOwgTE2QCBT2wPhoAKJaA3f
         FJH8DqcrvKd01GpE6Oqa4A8kUGpys0MqXU+zNOVPuHSMkEI3iYvHTo23lQJIQKEsiNbs
         DqnXSKETfxE+nu+/CKKkDDog1yhBNjJOjk3pC1tFP0FUAjxZAryVIVeN2k5kwoWaqrg+
         RZww==
X-Forwarded-Encrypted: i=1; AFNElJ8UrCmA0nenH0w4viS1TRViA60fpgiWZXJNH3fKvdUE4qHM5cee7qdLFAa/74ngD0xTfjx4LTgdDsnxo6bx17U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMM8fvYAN4XJcVgdZ8jg2NCmoZb4ubR+6pHcTAX7ZTootZOidt
	b8oHRVCjOkJF8r7bZJsGvwb6r8hI9l44alTWd/8sO6OQws/Vik+BParLBFXQui1hDGA=
X-Gm-Gg: Acq92OGPDzsz+OniOZIti4w9QieyUlPoP4BE85JZJmTm2Has+qM1kHHXvKttVPlj5dj
	cUmWaR5VHyKgw86tlnj8MCog9Uxr/yIV8VeIf7Lt7Tsh+lgoRLKdnHyE/cBQehL5w6CroJNeqL4
	WxIxZCLEILFtlWMagLVCQg59ATTAyNt5zDJKB3N1P1L90xEwMUrqi5zl5go9zCQ7gBW/HavmFKL
	oMPYIyrtPKk3t2+l0YIhJOVIHPa2nhxt6pX+gB4dA71YotqyATBYytkqwdhxYLxCAW26ydpMdDv
	TgX6xHv906c4WeqBNJsEQJXPAP0SGAtfbcUL/QM8hrh2Fhp6oX4edxxJOIV2/JaiE3StmO59JYc
	Z4I1kFyh6QiO9tuu2MMIxT4Q6XBbRWnWrY1hJX2P0rZ3VcDUwcRTMZ+0Sm6jEjBhTiVVR/7rRmX
	SKBfhwHL2biqBihU/sH2Mzo9FF75snlBEgIhx4XL/wUu3twhAvsHOIAiqoL+Azq5/uePDRXd1Wx
	+fC/Q==
X-Received: by 2002:a05:6830:3808:b0:7dc:e6e8:62b with SMTP id 46e09a7af769-7e5fefcb98emr16751871a34.13.1779995480287;
        Thu, 28 May 2026 12:11:20 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e606482b65sm14849267a34.10.2026.05.28.12.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:11:19 -0700 (PDT)
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
	greentime.hu@sifive.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [[PATCH] v4 4/4] selftests: riscv: Extend vector tests for sigreturn and ptrace
Date: Thu, 28 May 2026 14:09:15 -0500
Message-ID: <20260528190927.886558-5-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528190927.886558-1-tchiu@tenstorrent.com>
References: <ag_N8H3e3YzjRb8j@chonkvm.lixom.net>
 <20260528190927.886558-1-tchiu@tenstorrent.com>
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
Changelog v4:
 - remove timer dependency from the signal delivery (Sashiko)
 - solve 2 memory leaks in ptrace (Sashiko)
Changelog v3:
 - new patch since v3
---
 .../selftests/riscv/sigreturn/sigreturn.c     |  71 +++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 111 +++++++++++++++++-
 2 files changed, 178 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
index e10873d95fed..647249dbd7e6 100644
--- a/tools/testing/selftests/riscv/sigreturn/sigreturn.c
+++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
@@ -7,6 +7,7 @@
 #include "kselftest_harness.h"
 
 #define RISCV_V_MAGIC		0x53465457
+#define END_MAGIC		0
 #define DEFAULT_VALUE		2
 #define SIGNAL_HANDLER_OVERRIDE	3
 
@@ -61,6 +62,76 @@ static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
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
+	raise(SIGALRM);
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
index 1479abc0c9cb..863a16f6e1a3 100644
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
@@ -59,7 +94,7 @@ static void do_parent(pid_t child)
 			goto out;
 		} else if (WIFSTOPPED(status) && (WSTOPSIG(status) == SIGTRAP)) {
 			size_t size;
-			void *data, *v31;
+			void *vctx, *v31;
 			struct __riscv_v_regset_state *v_regset_hdr;
 			struct user_regs_struct *gpreg;
 
@@ -73,9 +108,11 @@ static void do_parent(pid_t child)
 				goto out;
 
 			ksft_print_msg("vlenb %ld\n", v_regset_hdr->vlenb);
-			data = realloc(data, size + v_regset_hdr->vlenb * 32);
-			if (!data)
+			vctx = realloc(data, size + v_regset_hdr->vlenb * 32);
+			if (!vctx)
 				goto out;
+			data = vctx;
+
 			v_regset_hdr = (struct __riscv_v_regset_state *)data;
 			v31 = (void *)(data + size + v_regset_hdr->vlenb * 31);
 			size += v_regset_hdr->vlenb * 32;
@@ -109,11 +146,65 @@ static void do_parent(pid_t child)
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
+			continue;
+		} else if (WIFSTOPPED(status) && (WSTOPSIG(status) == SIGTRAP)) {
+			size_t size;
+			void *vctx, *v31;
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
+			vctx = realloc(data, size + v_regset_hdr->vlenb * 32);
+			if (!vctx)
+				goto out;
+			data = vctx;
+
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
 
@@ -130,5 +221,17 @@ int main(void)
 
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


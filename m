Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D82B42FCAF
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 17:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382739; cv=none; b=YbkWsiWUH69S0uflcJkCLvH+Cb0UG+IOASq57owpNjiRtI811SiaGRU2kBC4CPOYmFc0JYduoYVZZmCo3hYMLiJfqFuFNtgdG77s5/4168CxYK7f5T/mmtYKGoK9/W0qoQ3y6cRCsyAi3CLTwKet/ry5SNz5nVODYh7WrZROGWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382739; c=relaxed/simple;
	bh=4obCzAmw0zrncbU1ubw6ygLwj60cV+pHfK4MmgYhFH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jlq0cZmkyMadwy0BWOD2Tg6Vp+W6tO7HzXWBTy9BCAMAr3ABrRQv01uNxH6tRosnUY85A8bCgUOerqUfuMCjItYzA6UczxmKId1nxCgco2AwQ/v5Sshy1oq4e36H7E0ok6CmxDyopm9ImmawBR88KfzJKDLFbo8zssc0rI8k8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=BXNxmAGu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="BXNxmAGu"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8484f229529so1590027b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 10:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786382737; x=1786987537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
        b=BXNxmAGu6xfsJhJ52Bnh8vVypQp81vtMZmCJ0GvD9+I65Ca+GmHyk14FM7J53whJPV
         oS6SSKP+N9P2lT7DXRAkqFF+V1jEQWxa+lOc2edHDRKxJQakOVVuj1adng5siC/aUihc
         VpwDnXe0qFOVfQYqrIOziNbhRQFTw6UTlOopqh8a1VIWZmhPAq/KYqdXSTdiOfbgZFwK
         LFSFjTWgdhuiTeBQkjfEY9OaLt5hGrD3nFnzerG5n7WIkBgfszCkTwQy4sLsedzjaori
         90xmKoJFVXgV1Cjf9un+jry1+nVqGLMzOtbuvYZ0FUrP8BAUiZD9fBgS4PhrsKQ6xEf4
         SEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382737; x=1786987537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
        b=arFUC5Dn150edHmYVJSUPQhFZOx5zd4Nc/Z2vn2CzAHysvv3Ol0talwLEkE49AweYo
         qmJ/Yn8SGDbgqRQLVGRw8rZCJM6+sVSMj1UwCBXkpiYTdgmVPp4IR78+tZZU1cZvOY5b
         7QEbacovRvpoMqzgJRhEsdZLmR6ovCDfnQOtiJLv+jBcHH2+fceLGV2NuBRDOf8iXbNU
         2p24/Y1rf/gra2RNdDKvw/D/7NWd4aSWjLhC3zTgvqlcEUtY+BQyCMYnFO/QkQLEKngi
         CM4Z1uZHCpfeHPnitWv8FoJiRjefE1PktbKbBsedvYEb3tGsLlQKPirjTC2X8fk1Jcuc
         Sr8w==
X-Forwarded-Encrypted: i=1; AHgh+RoPdpxcMJ8oHX+RaydiGumOy8VC4psQ7RjLyWl+HQQ6I5RyFiy5PT4G+V3yptSHZ75mJ1f6LtBzjTVYFBCEulI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPEdUjaoZuX4AhCcok11COq/xeAFHByQz62Uip7K64gp2bz7FZ
	4TpMg2I5IMqw7Fs8GfiQUAv3gMmH3Q7D78ckg0NEmlIFPEMElQzT8VE1g3Ydmej//PxDn3slBow
	rdFXZTF1QG5iP
X-Gm-Gg: AR+sD11hWjDmi94nUu5SJlrq0sNOpONVhUiBSg4MHLCXZAy+tCr/ONoZdZSTSGU5h1u
	bkQg9x3/Sj5ILmlYg64DsDRvjukuAqq4h5SXlLGBTE4eEhTV2R+ZxWUyurATJnBGu8aG0IfZxIO
	55fELiZHMpFjIyonlWQdo3cAg2D2fnwKrN78M7BhIdQLsbwMCswNTu8eNRqVSwMHr0nMrRslt7n
	p9uatqE25bgIpH3mvvqGLcUwLPgJktkeTUSyG6hxhyqwySc0w3Vvzz82/sDeciK7OpOfU3xAvUp
	ihOWMoExR9LeaxGYqmop0WRVn7zQithz18XpNT8apV0s9lxovy4SpB1JptkHduzqWj/hFy1L2ms
	iY0zrNehGLnjsSu5EPqqT3IWJEHTExX55WMSKOSorSiXLIqx9ZN0/jakZgn1iKvIgQYs40y2biH
	9p7uTRhwZPUFFM+nJt9ZvN5hL11G6oRIjPPANpTM9VOGoSHtog0MYHQjIhdgIBr6uIgqJHOy0Gj
	Y4qywhHv9oxa80TvB+HM2kzTJISJtB9/H7tWJo9V4OfltEy146YPvBkK/ojCbBHeA==
X-Received: by 2002:a05:6a00:430c:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84f694168bamr23837020b3a.6.1786382737502;
        Mon, 10 Aug 2026 10:25:37 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (61-222-153-199.hinet-ip.hinet.net. [61.222.153.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5898f8sm4149949b3a.52.2026.08.10.10.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:25:37 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 6/7] selftests: riscv: Extend vector tests for sigreturn and ptrace
Date: Mon, 10 Aug 2026 12:22:33 -0500
Message-ID: <20260810172255.1532787-7-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810172255.1532787-1-tchiu@tenstorrent.com>
References: <20260810172255.1532787-1-tchiu@tenstorrent.com>
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


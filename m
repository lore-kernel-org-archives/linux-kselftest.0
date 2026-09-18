Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282CC35201B
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768432; cv=none; b=vC0oH71n4XTNg+BvhgltDG4OnR9eDXNWl2djp+ALh+HHS6J3zMLSk9NcdGllAUvJtp1xrOVuZpjROmWR0yWrpZzBDupPYDfT4odJZvXATyJZHFxs0J7UT1D2NHDHGOA64KEOV90XTalIPWwKa367GMX4TXo3Y6668TjZQ13zHyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768432; c=relaxed/simple;
	bh=yZCLh9FYzdm/xaUKV2QwRGQ+s6VMsJPtmVEdYsPHSFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LgElGAyXGMaQHqxKCAeXepzflk2r+SQLgm6o9xGuF+oe2n6VrkaKh5CAkLSqr2QfVzHoid8fNmUCt3NGhKY/WA33UYjZX9tzZ7Y3lwd/RXQ31P6e4jwlJUxCj8EBEIo2eInIjTaTk/vXz1crXXRM2L65yiY3VaUli2FZ2myWXFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=fYjf/Ykt; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="fYjf/Ykt"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8961cca9193so15792357b3.3
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 14:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768430; x=1790373230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgKQxSeRnOzoiZ3Got1iPeMZXr/r/xBvpSPq8RVnIaQ=;
        b=fYjf/Yktuwipk+TfStlUBujhXHl3jw5r1hpx/fag1xAtxuSnDYMARHwJboYHRqS4it
         hd3e6JWf+Coy2VbRvpGAuihXlzkDDAPSjaUVoc7du46rKxUzjEO6AORSu0PbD07bdf1h
         nOE7b5HzOEv6XkL91ED4kWVej/BMZg9cpocJpH/RwVRcLodnABgsO6dIVWv95Q/FOFZV
         uo6eVyuWsbJrzXM6gr7Xs6R97NcCI1xP1fGpLSwfKrvwaLNyMPfrJAuFCifExeMPOR+6
         BcTw1puxaft3du8ibYEaauXspP/SvZFnv25c42QBaGJykQUC7jMTAm0YLS7FYIo2WSeP
         UBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768430; x=1790373230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgKQxSeRnOzoiZ3Got1iPeMZXr/r/xBvpSPq8RVnIaQ=;
        b=ei9q6r0LYgiM1RNQL4nnn5o5HVvPEZu3eDqmeLSIxESKOnIMrIyzJuq2fTY+gJp6gr
         XCl7ANX7vdBso1Ety4kn6eRsk+XDJ1csAa4grBcoA4TKTfTM5RCQueZWSXUOAnr1H/EY
         u5aGuFIRc6tEhbfbRmG7Gkpz0XRwZdkNQxVv+ga1e6axszRAAOt3gsqdeKVrgS3ujIH7
         TKwjalHcVOXpaA0KesCIl9VSQnsk4pVkphxNyHuLKXwPJGJcydExV2nuvyl8YXZw/nCq
         8VBUvNEXk4LkkAs1h+xI6XFJGbM0bI3ybBQI5peLPz7Balsq3Pl902hjDZnJ3yhk3w3n
         5sRA==
X-Forwarded-Encrypted: i=1; AKwUvBzEg2DKACibMIcuYmyzFF8+FWXnGieHH22O6wKibZSHXC5Su/FLt2UyD0Oux8DRhV2BdGuChNmep7EfVhspoko=@vger.kernel.org
X-Gm-Message-State: AFuF++kZdOgO7uYTnNVfscGkbWRryUNfMgsmQxlGERONoR5zo8rVeWM0
	Q/UK4HrMTVyukczi20YZ11hBkNoBWOGz/oVrBVjH11pt62F4gem1B754zcmGDc01izU=
X-Gm-Gg: AYBFou1cn4XspHOZ9IylEoFHZTuLkAMn3L8e17KLjkoyUuK4betqWlMS4vvsAkAJokK
	01LaPJDdz1c0FwigMfU/0oayECRUt/IMahX7hQI4AR/IDx68wD/dXyqVxAFReTdU27cetAB17QQ
	Kq+Axcyb7zJVE0Xvg5fN9pJWUoPsox+7qwbWS2D2FuARh+Dx4lY6VJLgGOJJsI4ljYxWF4E2W6B
	ybhmjjymbXGQ/zMquqEGGsJndiXEPYoUbKVU9RlP1i/A3R1KYPfxvQcpiBcYYt28wMTKoPBznSc
	9nGhskFPI/PbSfb5C1HgHiDGE4xBQmCgxbnk9A5ivQd9hNMv7xChRzX3bomkdbpibYBzX6Vz4pC
	07+12o05Hd3jAZpXS8+uCLY3q/uP3ppNpYD92k3Yiag6DgW2bjiEdQWCvu9efdC9ls4zJu69svi
	e26uRYs+at1sPk6U+ibYshvyQ59+GVonP+q2wQ5V+QngNaSpVoXeQF0ZtAqJQfcyfdLT3d+ZAF7
	ZoySNbgx5TefLf5xZToFxoR12vQT5BMUDFI
X-Received: by 2002:a05:690c:93:b0:872:1e2e:b496 with SMTP id 00721157ae682-89736948fdfmr26927807b3.31.1789768430101;
        Fri, 18 Sep 2026 14:53:50 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:49 -0700 (PDT)
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
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v6 7/8] selftests: riscv: Extend vector tests for sigreturn and ptrace
Date: Fri, 18 Sep 2026 16:51:21 -0500
Message-ID: <20260918215154.2481482-8-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
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
Changelog v6:
 - reformat code to slience checkpatch
Changelog v4:
 - remove timer dependency from the signal delivery (Sashiko)
 - solve 2 memory leaks in ptrace (Sashiko)
Changelog v3:
 - new patch since v3
---
 .../selftests/riscv/sigreturn/sigreturn.c     |  69 +++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 111 +++++++++++++++++-
 2 files changed, 176 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
index e10873d95fed..386367cf28be 100644
--- a/tools/testing/selftests/riscv/sigreturn/sigreturn.c
+++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
@@ -7,6 +7,7 @@
 #include "kselftest_harness.h"
 
 #define RISCV_V_MAGIC		0x53465457
+#define END_MAGIC		0
 #define DEFAULT_VALUE		2
 #define SIGNAL_HANDLER_OVERRIDE	3
 
@@ -61,6 +62,74 @@ static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
 	return after_sigreturn;
 }
 
+#define V_TEST_PATTERN_SIGNAL 0x98
+int nulled_val;
+static void sigalrm_handler(int sig, siginfo_t *info, void *vcontext)
+{
+	struct __riscv_extra_ext_header *ext;
+	struct __riscv_v_ext_state *v_state;
+	ucontext_t *context = vcontext;
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
+			v_state = (struct __riscv_v_ext_state *)(hdr + 1);
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
+	asm volatile (".option push\n\t"
+		      ".option		arch, +v\n\t"
+		      "vsetivli	x0, 1, e32, m1, ta, ma\n\t"
+		      ".option pop\n\t" : : :);
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
+	asm volatile(".option push\n\t"
+		     ".option arch, +zve32x\n\t"
+		     "vmv.x.s %0, v0\n\t"
+		     ".option pop\n\t"
+		     : "=r" (v0_val));
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


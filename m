Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423674;
	b=Yr6Bllm+CDlUU2NEn7++VF+TLlwUz2Bf+apUGNPhiDk1ZQ/rEK0MftKB3INfAJwLA43Y
	 xSrKL56dghw7foID2iMYLMGLgbZFBwVP/4trrv2lg365VAciQ0DYutxf6mp4s4GR9FibY
	 0g+Zjs2ZivG+F+RJu9izJlRBTCQGUXZ0B2v1fUU45UdkhIeY6j1+XB1eVbDJz3DVVBr0P
	 Fz27WcHv2YuiNgj6rGiIvNBIZCDOsytMaMGwN3Q6jnPBHS1cZVHcoGhdBsb9cJSf8RTT3
	 sX44fcoSUDxW6KqDZg3RrG2ZjM/ld5D6+Xb6KZuT286WlYBTSzzc7nw60tjZi+9eHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
	b=S+aCmd9KjkJjAyX0tgRjhBhs6hrhtlderPujZrvi4oPg/m4ona22BRoCWnG0jwEYEs66
	 OKKPVNwMgS5RS9mJCPBQClcfb26ONPHoS/c6afWm6pgtJllAZfvNxswqQ123DA/y1cdzG
	 emqlW6X264krsrbmjfv4Qo3VUTpxCYOHU0Ur5pa5jkHPC7VmYM3cuOvMyXtjdTL/Cbaia
	 L/PmiEWTOIkA6jdW7RoR+K2w9/+BykVdXlpQDLw7x9jaqwTuBsZshnam2vZd7DmihP4rd
	 rly/N2RqvY4AtybJ/HPlG4D0l10/SjOhpSjnkXeBITxs1EGZkV7lyr4mpqmR2GK7w1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=ORrEOp5D;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8805606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 19:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8805606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=ORrEOp5D
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c24619b19so3552326d50.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 11:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794423673; x=1795028473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
        b=ORrEOp5DdnCVUISTuyqW6PSRiNVfUtZwZH7cVrH99sguUCmzx/elRz3AERRftOxuW9
         XxgFsKtpfn0NagcdmM4bkuyOI2NU+XaP3M25+gT4YmIFk79a5PoTdELR6P/TrvODqwyA
         TG/KUwWp9ptkbm23RsrkgeEne3TcPMa3CfyaqARwzonjTNaapxzmOxtWU9fdMSEr37UP
         1RO/Sec6VH1Ww2DrYUnKl5o3ya8WUyqF3QGYh73NSuC/k5/+v8p5pwS+4QwgzB9FzI17
         DVqmt1o9w5l3u/5nz6N4N7xpw7g/5znmlzMUzfYpRnWE68wm6r4p1cTHTYXxkhly3/Dv
         Osyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423673; x=1795028473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0CCar7U9xY/cuLeWShGMRY6FLa2CcPakhHg+oZkKygo=;
        b=Fv7JqtNQa95R0T1vxAMGLz6mRcXRKOwPPgKbT9X9KVoxok61mqfsvMhS/+4T6oF7a1
         ynD9DogIvXWkO4mhf5JHRlmJWTpSTPjAgWNS0qYOBw5PmuM0F/ZHiqTBWlRE3nVUnDRv
         DjA5oOnUQH7SoLtHfpc8zL2BrcqYhSetnOWTczpFodf8FPhvASKhwEj+tmPVnKMBhq6P
         l0SkIlxTk37WarWzpq9XQMAKB5m7hebtLMme1CKc/TjTA/1DkUE3Dn1Xn00w9laCPjLH
         GnSQjl3v1DBONlaNd0/+fzgIRmbPBZnRsTh0mDk+oTjl6uuqJ0dpxE1ZqzL+GqY7TK7y
         3u3w==
X-Forwarded-Encrypted: i=1; AL+hErFejehcnw8H8YeX1q8mwtaEaNVYwHqXSAAUF0s/WyTxaoTWDd5eRuyJXNzFO2H38BHPIQNVcGIciKLMNvhkaMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kDiG4XJoMWIpwzN7+9jljlpXUCouCvaqpgiO9pUIvM1rr0Z+F
	EigZCwz+/rSxY1O9NlnxegaumA8qJkGx0MhuWDBQWSvaHfsJMrPabIi1m8GDNlZF8OU=
X-Gm-Gg: AYBFou3uWG1o/AJTEkMUnZbpOPOZkqz6jusXduzCUFMDQ8+GIMo7CrZWJZkb+5n4MJA
	aOYfopj1PTR6NR+6CLuGpH3GgrCGeYT3qUpHfBFjhJJ5zr/GxvGkEAVCTLE2ZZ5djVJgmtQBv7q
	EqiD5RG15ld2FBxwm3LuCaeb8VA7HSR3WT53r+MuBzyDrSfDqgTDvc2d3rTXJoO72JosIp4ZNDM
	epT2wB3eXonNuJ13DWqayhckZRbj4oUyu2Unubn1YxfBy195GYbx+nt6TK6G0ZMXGGVNnATK/ki
	nI6rltvzdAW6sBwN+sEE4yvUhvAz3sOmpSUEuY93PqXCkxVBpPe8BE5IDvw2QfNluy2ni7DXPKr
	8Witica+5XjWgW5MHx/BTQhPDE1ZJcFCPoLDnc7b6g9thRG6fkKQNmSPejHaxvaeFLHRhwJ7ztz
	/SyPost8k7lCghGXxmor4ybzq8hf9LpsIBzgjazK3jB+jjUcmQICW+GeTI51SaChZFAnmmi8AzY
	QPuR8E99WSK1Jo1lzQo1Tad7rGgqyaE+yUdk36QJQZs88q8FYVwLquwJp2LPeSIJX6H108WugZ3
	JOLfYPWre3k+vcqeeOK60Pq5vnKpGqqviXAd182lbv5J/OS5erjJmCFfx5fNCehbBzktvoVur1C
	nd+ongptoCuIjou+7jdAQWvf2UO0OucSm3dsUfmF20NY7yWg+
X-Received: by 2002:a05:690e:4851:b0:67b:fe99:a7a0 with SMTP id 956f58d0204a3-67c67fb2612mr1607228d50.69.1794423672627;
        Wed, 11 Nov 2026 11:01:12 -0800 (PST)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm5209197d50.6.2026.11.11.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:01:11 -0800 (PST)
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
Subject: [PATCH v7 4/6] selftests: riscv: Extend vector tests for sigreturn and ptrace
Date: Wed, 11 Nov 2026 12:43:26 -0600
Message-ID: <20261111184359.1239821-5-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111184359.1239821-1-tchiu@tenstorrent.com>
References: <20261111184359.1239821-1-tchiu@tenstorrent.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
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


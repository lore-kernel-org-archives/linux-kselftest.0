Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793658979;
	b=P55UBXy4LnM7OpF9dy6cD3u1oI8DiFvc5d+rIvoEKidWI4PspTh8SlSbT3Y5XU/in/MS
	 E8Ylv9qMnHnJIWLXEmV9ZkWeoXYXlG9A5bKlQpxbFgt56vnv05sbh1ln1k5yn7Z69oSmB
	 7x+hl0ofgat/MeVg5Rz+JiuVJZDJDB7ltqEkYUrjEdamzRVnOVCuBpWDHqogFPT+I94Gv
	 4kigf7HMzTlYJUt+ZiJ/4lmVgo17Y6opxpQoNJWmqMLi/S5mYrCY1OvhLSwKnFktQvmN8
	 2hvEQUM54Su0hWpIwsiXrleciZZaCIIaoNqDpo989b9nVgVZB0/VXd83ZjyK+RUbM3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=+2B62P6pygpI8xDXVCsGnEznvKzC8xpzSm47oWeOBg4=;
	b=XOpvxBF2xz6HuS3L9c7fhB3QuKf2348mdwD+pZvOPdaCYyHNfPMDlULsX5Bop4I+ROco
	 7eRkWxHVnlDRqaQpIAPEh86T/9Aq6aSCtxhYTQItLGk+x8fCkKouxBO9jTGNVIWdlU2ti
	 6vASg+0hmwMalIiA6JKVVkbOF/eMymLcCEAMtbI6UtQPvj3+vVjHdZRla1bA9s67g9JYr
	 6OolZ1SOsqbxDLGuMNA1E7V6rdAA4e7BaWtEC0wwlyhGrXmFn9+cIeIkkPLzQ/e+Y2da6
	 RexoFIv+MXKmYfasmQaVlDvmLCYG1gy+D0SGsPLmA8RNnG1wN3NNS1xqJd7muEi7utg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRSdtq08;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528C7606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 22:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528C7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRSdtq08
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so2053811b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 14:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793658979; x=1794263779; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+2B62P6pygpI8xDXVCsGnEznvKzC8xpzSm47oWeOBg4=;
        b=PRSdtq08wl5FtZ7YS71F2pJ+fvUKNonuRqIl/3w069O+LydfKKf3y1lbdaULR1O9y4
         Ref/0pdN127yUikWeo1tveFpvSxg3gJV6hhnV7pgUse7yY4f3BxnTSGvSgW9UKVsugFu
         V4t3N9gHX51MYQ3e2qkaG0ai9zUmEckq4VxxtW2ItS+pIbA1aP8kvdqLrCyvjk8csSPL
         KfDs0FO4R0jDEDbcmYBIHPG3BnjfSuq7BQnGTem7bEam2MREX0VaMcLK7pYU4fjyjnHq
         nuHokar16KkJJhXoitdL9rkBIbfqr93oTFjFwTDtugRESc0n9V0OgKK6VwYfjgx3VPXw
         yWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793658979; x=1794263779;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2B62P6pygpI8xDXVCsGnEznvKzC8xpzSm47oWeOBg4=;
        b=P6p/j6D4l6iOyV26WgPaPHTo2U9tbAcUSXNdlRYgNyOktnbBVxXu9b0Q9O2oVoB0zN
         MYhbKm3b7UYWR9ZGQXRdmLOC5itJlAYI0yW4pZxeE4QyiEzcmrZYMlEE+QxsFnm5mMIV
         CyeTvtpdHvhFwQf3Aim8LiPT7YO2Ns+7IhNr5TgpDgQC8JloJ7HmasFZ6jr8cXMmoy8w
         +hAE73V3pWeqGCER1X+0k3D5tom0N6mDGD91nXbiVfSmwdprrhUOWUkiEj0vD5kxmz1f
         V8pyaTRB5QnarCnbJyj7P+9bW6FclSduoVTLioUB28REFacWHLa89rW+d+Db8KShXA9/
         FRKA==
X-Forwarded-Encrypted: i=1; AKwUvBxKQrrMM4EYv0xHcibIf+bvMqu2T6eZd0D0Bf4M5u5UiyHeyr7W69UI+r2foN2z95xeotXr7ptdrJ/mhp3KnBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrhY5RwPpGJymJZJs7bApLwFQQUg/KY3BTCaFgx+Q4cYdYhw1J
	+NKUrGoRgKtDZI/Ziy7DHtnet12TBpre50CnANq9UCR+W/dZMNY1/w66
X-Gm-Gg: AYBFou1BNgoMAnLCne4RrHD/CktPiWf8u/fUNQoHoAJ0B8oOtq+BFuBAYGj224kZY27
	X2H8wYCpq7hfq64K3Oo3ziY0pOyP4Y7KAOyt4cYrGNLXct++Nep/3lBhSCq6BRMPTLM/EjPHUs/
	O+K901ESlBVCgmpkBsimVFUq5qsAmWkEDj8oCPAobzER6cNAs5q8yvMvyEfE/BJwC/2dMsbBhMa
	YO23BhGkP/GvCXqJw7SG9uiBd4Dq/Kf8X6oQhmbhaqUSi+NOzdcEQHd7lEdljOEdSBOVepDGkKo
	WNIiTjj/nVtGyFMKFLXJ6DGuC0U5JAWnV5WtrxJEZ0wc7kHuvXC3NXL9EGThOM4yULbr4NptZBW
	gzYyQhbZfZ6GElItJKczQUhrWUXEkFWDGVLfGGCsALmUqNEhj5qLgp8zkbt7fAq4CL58guIhYPa
	vm63jGAEfHZWM/wm6gCMogEPNkkzwmwU19C3riNzhdHcKmOHCloibWA4ZCiuOhictr7nqTwnlw7
	Hio3LvogxrfnWzasjaKCN3XJDO8bDZxZ24eu9e2VNwlqz+rrTtS011JIKn7FnA3ZtzQADzzMWNJ
	cmI5G9dJYtU9P+qrezNvys7+i8XTQe1KDs94GZQ2hPwosU6cZ9cKLST12A7iE+A3y4rCpzP9eEK
	YBQCGJ9M45qVKQnph2MOYf3yet2O+JoF61w==
X-Received: by 2002:a05:6a00:288c:b0:89e:9c7e:fd5e with SMTP id d2e1a72fcca58-8a9bd1facdbmr9633354b3a.9.1793658978321;
        Mon, 02 Nov 2026 14:36:18 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d479dsm2513387b3a.39.2026.11.02.14.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:36:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 22:36:17 +0000
Message-Id: <DML31IUICB7B.2FO0J06WCREC8@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <john.fastabend@gmail.com>, <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <jose.marchesi@oracle.com>, <david.faust@oss.qualcomm.com>
Subject: Re: [PATCH bpf-next v3 3/8] selftests/bpf: report SKIP for arena
 tests a compiler cannot build
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261102220717.4079739-4-vineet.gupta@linux.dev>
References: <20261102220717.4079739-1-vineet.gupta@linux.dev> <20261102220717.4079739-4-vineet.gupta@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 02:07 PM Vineet Gupta <vineet.gupta@linux.dev> wrote:
> Give each guard an #else with a dummy marked __skip(), so the skip gap is
> reported rather than invisible.  Add __skip_without_arena for it, which
> expands to __skip() with a fixed reason when the compiler cannot do arena.

How about the following approach instead...
looks much simpler to me...

pw-bot: cr

diff --git a/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c b/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c
index b5a01cb..16c3dd9 100644
--- a/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c
+++ b/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c
@@ -23,8 +23,6 @@ struct {
 /* volatile to force the scalar reloads below */
 volatile u64 stash;

-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
-
 SEC("syscall")
 __arch_x86_64
 __jited("...")
@@ -93,6 +91,7 @@ __jited("	cbz	w4, L0")
 __jited("	add	x4, x28, w4, uxtw")
 __jited("L0:	{{.*}}")
 __success
+__skip_without_arena
 int arena_arg_jit_args5(void *ctx)
 {
 	u64 __arena *val;
@@ -113,6 +112,4 @@ int arena_arg_jit_args5(void *ctx)
 	return 0;
 }

-#endif /* __BPF_FEATURE_ADDR_SPACE_CAST */
-
 char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
index d7f706c..4ec840b 100644
--- a/tools/testing/selftests/bpf/progs/bpf_misc.h
+++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
@@ -116,6 +116,10 @@
  *                   feature the toolchain or JIT cannot provide, so a run does
  *                   not report OK for coverage it never executed.
  *
+ * __skip_without_arena
+ *                   __skip() when the compiler does not support the arena
+ *                   address space, nothing otherwise.
+ *
  * __log_level       Log level to use for the program, numeric value expected.
  *
  * __flag            Adds one flag use for the program, the following values are valid:
@@ -156,6 +160,11 @@
 #define __success		__test_tag("test_expect_success")
 #define __description(desc)	__test_tag("test_description=" desc)
 #define __skip(reason)		__test_tag("test_skip=" reason)
+#ifdef __BPF_FEATURE_ADDR_SPACE_CAST
+#define __skip_without_arena
+#else
+#define __skip_without_arena	__skip("compiler does not support the arena address space")
+#endif
 #define __msg_unpriv(msg)	__test_tag("test_expect_msg_unpriv=" msg)
 #define __not_msg_unpriv(msg)	__test_tag("test_expect_not_msg_unpriv=" msg)
 #define __msg_next_unpriv(msg)	__test_tag("test_expect_msg_next_unpriv=" msg)
diff --git a/tools/testing/selftests/bpf/progs/jit_insns_arena.c b/tools/testing/selftests/bpf/progs/jit_insns_arena.c
index 95736ea..77d135a 100644
--- a/tools/testing/selftests/bpf/progs/jit_insns_arena.c
+++ b/tools/testing/selftests/bpf/progs/jit_insns_arena.c
@@ -106,6 +106,14 @@ int cast_to_user(void *ctx)
 	: "r1", "r2", "r7", "r9");
 	return res != 0;
 }
+#else
+SEC("socket")
+__skip_without_arena
+__success
+int arena_unsupported(void)
+{
+	return 0;
+}
 #endif

 char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/verifier_arena_large.c b/tools/testing/selftests/bpf/progs/verifier_arena_large.c
index dbdea14..428b984 100644
--- a/tools/testing/selftests/bpf/progs/verifier_arena_large.c
+++ b/tools/testing/selftests/bpf/progs/verifier_arena_large.c
@@ -181,7 +181,6 @@ int free_reserved(void *ctx)
 	return 0;
 }

-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 #define PAGE_CNT 100
 __u8 __arena * __arena page[PAGE_CNT]; /* occupies the first page */
 __u8 __arena *base;
@@ -220,6 +219,7 @@ __noinline int alloc_pages(int page_cnt, int pages_atonce, bool first_pass,

 SEC("syscall")
 __success __retval(0)
+__skip_without_arena
 int big_alloc2(void *ctx)
 {
 	__u8 __arena *pg;
@@ -290,9 +290,9 @@ int big_alloc2(void *ctx)
 /* Nonsleepable because it binds to a socket program. */
 SEC("socket")
 __success __retval(0)
+__skip_without_arena
 int big_alloc3(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	char __arena *pages;
 	u64 i;
 	int err = 0;
@@ -314,16 +314,14 @@ int big_alloc3(void *ctx)

 	bpf_arena_free_pages(&arena, pages, LARGE_PAGE_CNT);
 	return err;
-#endif
-	return 0;
 }

 /* SYSCALL programs are always sleepable. */
 SEC("syscall")
 __success __retval(0)
+__skip_without_arena
 int big_alloc4(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	char __arena *pages;
 	u64 i;
 	int err = 0;
@@ -345,8 +343,6 @@ int big_alloc4(void *ctx)

 	bpf_arena_free_pages(&arena, pages, LARGE_PAGE_CNT);
 	return err;
-#endif
-	return 0;
 }
-#endif
+
 char _license[] SEC("license") = "GPL";

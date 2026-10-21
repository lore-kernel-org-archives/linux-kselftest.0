Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569682;
	b=MXkK6TBWur+jtCVG1VB6EBusmtB1VWYbpxIkyTeAcek49RTqs7LQ3Hb77WymVjmVxKxj
	 oPRvD4RTkC2IbRlqVJeWJO2zTwvlbtcE6qv0rjN875WNZfNRX8pJUkIBA8oZjCVYsSEO1
	 bRTa+VZwGxZGB5H+yyRC/A2FAgxQWzZ9Mm1URd7jlzenMrVK2GmfAIb6RsZSKIKO698ET
	 Cuw9ZcDkwnPqrilq42jSy5DTUPu/d/HwY8FIvPkfuu1RkGa+zRjbxG61xC75YVJvA1/dB
	 a1w/UrN1DBxJpcMbagcKWbHmcHD82hdrDgVJYi0ENctqUw7GklF2jO6gv/E310D4x+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7MIS0cUZkMo0tueSJ40/6CJPQJ/uhX77qO1/G5pJdKc=;
	b=ZFLOaIQIunykzlo7TMdAA2a6hBivLOxYzdeJf47YFUFKW3+U/kQPGQS0aW0EN4tTk7tG
	 lhoXlKLoDpVUgRX1MawTSDT4AYzlkWBUFzQZRgOPma+Jplm1euRHYyt6eiSbYtzYoQgAj
	 TKYvgJQJwshQkYhf8EOWtiKgCczb8LDdpMtbJNSE6ewmKJiQ+D7A8/lQM9nnUAt7xE4TB
	 vb8EHUcrjnttcZnqTGuNzM6qOGuNXvKj/1m8BE/m/2qiJLB1PhFBfQXGQCfPmupe42lAc
	 nwxfXcDx++tqUG/SBBjuiI1s5wAMjj/eEJhxsDWoOl/JdQ2baFY+TQAkqpM/vqC1QpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pPtw1iXh;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25058606A325
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 08:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25058606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pPtw1iXh
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so1137890eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 01:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569681; x=1793174481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MIS0cUZkMo0tueSJ40/6CJPQJ/uhX77qO1/G5pJdKc=;
        b=pPtw1iXh0q5WfAtHEuxSAz1WelWzqMsZOhK/i4Ybpbmiv7DXt3F88tHkJHSE+TzG2w
         +hemZUvb1PDJvayoYm4YK2aWbSKUo/DQz6k084eKCjcpqEmTR74laCR8zDMSIdGgcZXB
         7OkpXuRW357xyvQR9gq+3FQt9ZAeF0XBVNe5dnHRauMZl9qszsCcQw2JqRc7Y9UA3Km0
         LSKVKPQQNg5dOybyy6qfmKkV3W65Cw/EuuPeEtXk9+Ug1KcDPwbJsS6tRIaZrI0yFLVu
         Lq8tcwrgi4L/6mVLzPsV1Itrm2yaKsIp2JIdlYOoaQFLg0d4vys698bHs/hKVc3i9m4o
         pJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569681; x=1793174481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MIS0cUZkMo0tueSJ40/6CJPQJ/uhX77qO1/G5pJdKc=;
        b=lX8toK00De9Eky8uJHts0lEku+ARcU1dyP/vPZmIL/3CJUwpvRy43wNhvqy3QTLNAj
         FmVHjfxFT1Fue8J8Olyi3Zik9YpHtvriS+2lQEq/GO8cWL4k9ryRfchLIx5EO29rfrmo
         69lkEZK6MNtQiSqgpUvwf77oQqB6J0tspZ6S56VGW4jNbhLKET+itNNcTJC7apO1M7Qj
         rzRq0hyPrbk7IdZqA488LXITM8CwnjRl+iHgGkuM50KtQaR2p0hSCGaQuhr5IkMDrrE9
         ETC0ZqPb1TPjroe0vaR4WePmejNhlTF0P0hr6yFDOuBEnmNLUhrtH+5jg4UkaulpBSnY
         z+og==
X-Forwarded-Encrypted: i=1; AKwUvBwURaTKnaoH310bwWL6wyMS8i3zD/jgiK9yJE97dlTXjrz+Iviim9f/aEQ/ZEsnIXm7LSLTN0aWT5SZsNMI7wc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiTfbmoDHqCTGIB23E/WHtytaAsLAHsqwBYGUtY02iYbqGNlSl
	ZwmqKXol+hhzj7hfA+s9TjZ4y6i/Gp03l5bNdiV5oeB3651qtYxV4GZWTYoC5Ge3nhc=
X-Gm-Gg: AYBFou0gOxg577EK5JKDoSp+Cey5BgH9xJQ37hQL3B3YkXFSfQdZsyyigQfPK2oiYzP
	OcOOcu6tYKuPgM29e1o7OF+IGrRu9t2TRyUE3xzGg5K7pmvUPIGoFrkjT1Q58IM0uPaYA2wiriZ
	21xH05sP5PpqPax6caIHbwcqSOhaUAKJSwhHLJ8RVYfUaghS5L2K0wHef2Dw6hK96LBoQvtoXrj
	55yrmJNN8UybPPtP452MAiDB2gIhNS33P6B6j18HP7cT3RCSpVmWte5pg8QBRqDofzklF6Es2xR
	CuOPM31BKYrzGqzPKGaAnKCSdbfdJyFRdUWtMEXcSXuEKhOU7Eq1RjTUOtuqU+GSC/dPCUZYC6t
	ArDPwkeq3AIUOBraxVTZcsiqHw1eGEaQIBT8OEB8lbnIBIgTQpx8x1B+1LHRtI9LQ88o23eCWLr
	f5/94a/2iqCt6jKDiy4nfdmhsfXiT5Hay4puJwthiNT+WzUQODm0m7qNK99tf92QqMPJp063Ymd
	/WNY0BZDLPdEdbSVnVrtMZK1Ys+UEwD5JG4Hrj/uUOa11vsRWtXxDf4MB1m1TSpO7m58+MK8GFY
	c0hu/CKHjDqFXg7Bia71u49OG5Zc
X-Received: by 2002:a05:7301:dd88:b0:35d:8c39:b2fd with SMTP id 5a478bee46e88-3674a40df97mr2426025eec.1.1792569680787;
        Wed, 21 Oct 2026 01:01:20 -0700 (PDT)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367416a1fb9sm4470610eec.20.2026.10.21.01.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:01:19 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+eada64ce90ecebce@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: [PATCH bpf v2 2/2] selftests/bpf: Test missing and callback stack arguments
Date: Wed, 21 Oct 2026 01:01:00 -0700
Message-ID: <20261021080100.2663618-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021080100.2663618-1-bestswngs@gmail.com>
References: <20261021080100.2663618-1-bestswngs@gmail.com>
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

Exercise the path where a static seven-argument subprogram has unreliable
BTF and is called through a bridge with only one initialized outgoing stack
argument. The callee expects two stack arguments, but the unreliable-BTF
path skips check_outgoing_stack_args(). Expect the verifier to reject the
second r11 load at offset 16.

Also exercise synchronous and asynchronous callbacks whose BTF prototypes
declare a sixth argument. Initialize the outgoing slot at each helper call
site so the programs reach the callback-specific rejection. Keep a valid
six-argument direct call in each program so bpf_fixup_call_args() records
the stack-argument requirement and cannot become an unrelated rejection
fallback.

The fix also rejects the existing uninitialized-stack-argument test before
the later unreadable-register check. Update that test's expected diagnostic
accordingly.

Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
Changes in v2:
- Add synchronous bpf_loop callback coverage.
- Add asynchronous bpf_timer callback coverage.
- Add the six-argument callback BTF prototype and initialize the outgoing
  stack slot so both tests reach the callback-specific rejection.

 .../bpf/progs/btf__verifier_stack_arg_order.c |  10 ++
 .../bpf/progs/verifier_stack_arg_order.c      | 121 +++++++++++++++++-
 2 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c b/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c
index 99bc115f8380a7..cd0ab034b788ce 100644
--- a/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c
+++ b/tools/testing/selftests/bpf/progs/btf__verifier_stack_arg_order.c
@@ -25,6 +25,11 @@ void subprog_bad_ptr_7args(long *a, int b, int c, int d, int e, int f, int g)
 {
 }
 
+int callback_6args(long a, long b, long c, long d, long e, long f)
+{
+	return a + b + c + d + e + f;
+}
+
 #else
 
 int subprog_bad_order_6args(void)
@@ -46,4 +51,9 @@ void subprog_bad_ptr_7args(void)
 {
 }
 
+int callback_6args(void)
+{
+	return 0;
+}
+
 #endif
diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
index c9fe4857da3f55..610c96e8113760 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
@@ -5,6 +5,17 @@
 #include <bpf/bpf_helpers.h>
 #include "bpf_misc.h"
 
+struct timer_value {
+	struct bpf_timer timer;
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_ARRAY);
+	__uint(max_entries, 1);
+	__type(key, int);
+	__type(value, struct timer_value);
+} timer_map SEC(".maps");
+
 #if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
 	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
@@ -129,6 +140,25 @@ static void subprog_bad_ptr_7args(long *a, int b, int c, int d, int e, int f, in
 	);
 }
 
+__noinline __used __naked
+static int callback_6args(long a, long b, long c, long d, long e, long f)
+{
+	asm volatile ("r0 = *(u64 *)(r11 + 8);"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
+__noinline __used __naked
+static void subprog_call_bad_ptr_7args(void)
+{
+	asm volatile ("*(u64 *)(r11 - 8) = 0;"
+		"call subprog_bad_ptr_7args;"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
 SEC("tc")
 __description("stack_arg: read without caller write")
 __failure
@@ -151,7 +181,7 @@ __naked void stack_arg_read_without_write_1(void)
 SEC("tc")
 __description("stack_arg: read with not-initialized caller write")
 __failure
-__msg("R0 !read_ok")
+__msg("invalid read from uninitialized stack arg off 8")
 __btf_func_path("btf__verifier_stack_arg_order.bpf.o")
 __naked void stack_arg_read_without_write_2(void)
 {
@@ -170,6 +200,95 @@ __naked void stack_arg_read_without_write_2(void)
 	);
 }
 
+SEC("tc")
+__description("stack_arg: unreliable callee with too few stack args")
+__failure
+__msg("invalid read from uninitialized stack arg off 16")
+__btf_func_path("btf__verifier_stack_arg_order.bpf.o")
+__naked void stack_arg_read_with_short_bridge_write(void)
+{
+	asm volatile ("r1 = 0;"
+		"r2 = 0;"
+		"r3 = 0;"
+		"r4 = 0;"
+		"r5 = 0;"
+		"*(u64 *)(r11 - 8) = 0;"
+		"*(u64 *)(r11 - 16) = 0;"
+		"call subprog_bad_ptr_7args;"
+		"call subprog_call_bad_ptr_7args;"
+		"exit;"
+		::: __clobber_all
+	);
+}
+
+SEC("tc")
+__description("stack_arg: synchronous callback with stack args")
+__failure
+__msg("callback subprog cannot have stack args")
+__btf_func_path("btf__verifier_stack_arg_order.bpf.o")
+__naked void stack_arg_sync_callback(void)
+{
+	asm volatile ("r6 = 0;"
+		"*(u64 *)(r11 - 8) = r6;"
+		"r1 = 1;"
+		"r2 = %[callback_6args];"
+		"r3 = 0;"
+		"r4 = 0;"
+		"call %[bpf_loop];"
+		"r1 = 1;"
+		"r2 = 2;"
+		"r3 = 3;"
+		"r4 = 4;"
+		"r5 = 5;"
+		"*(u64 *)(r11 - 8) = 6;"
+		"call callback_6args;"
+		"r0 = 0;"
+		"exit;"
+		:
+		: __imm_ptr(callback_6args),
+		  __imm(bpf_loop)
+		: __clobber_common, "r6"
+	);
+}
+
+SEC("tc")
+__description("stack_arg: asynchronous callback with stack args")
+__failure
+__msg("callback subprog cannot have stack args")
+__btf_func_path("btf__verifier_stack_arg_order.bpf.o")
+__naked void stack_arg_async_callback(void)
+{
+	asm volatile ("r1 = 0;"
+		"*(u32 *)(r10 - 4) = r1;"
+		"r1 = %[timer_map] ll;"
+		"r2 = r10;"
+		"r2 += -4;"
+		"call %[bpf_map_lookup_elem];"
+		"if r0 == 0 goto l0_%=;"
+		"r6 = r0;"
+		"r7 = 0;"
+		"*(u64 *)(r11 - 8) = r7;"
+		"r1 = r6;"
+		"r2 = %[callback_6args];"
+		"call %[bpf_timer_set_callback];"
+		"r1 = 1;"
+		"r2 = 2;"
+		"r3 = 3;"
+		"r4 = 4;"
+		"r5 = 5;"
+		"*(u64 *)(r11 - 8) = 6;"
+		"call callback_6args;"
+	"l0_%=: r0 = 0;"
+		"exit;"
+		:
+		: __imm_addr(timer_map),
+		  __imm_ptr(callback_6args),
+		  __imm(bpf_map_lookup_elem),
+		  __imm(bpf_timer_set_callback)
+		: __clobber_common, "r6", "r7"
+	);
+}
+
 #else
 
 SEC("socket")
-- 
2.56.0


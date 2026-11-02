Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622756;
	b=ZAU0JHELBOFgw7D8VrgCBIaRPTDpBssGYl8dZgcfsTArUawe1aB/NQtnMdWJG1SUtpIR
	 Vk+FgBd/kVtcqqH/ZVgjewU5pw7mpJuZvYqdBrs/eEQ9nFhrTw5uyk4PNeLCTciPARQhM
	 nq9hY1oZLV+DbkmKDTRNsCj1a2bnHJo0WkXWwdrSFbBbOXPmXDyilI0fAPCifwxiiqMaz
	 99Dv+xqtgn4Sb5ppoB4ODMhTSW5+cQDm1Pid58DBW9TMbRgNpZ0tnYTtB2lQrLCIVJsgR
	 tlQxPzqkOZUXG6aLg2qSMl9QBFNcX6AaecffS5ZNwiFXqWqiKPjHwH5qbmrIWbgACfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jw7VoFe2BRpLE9w0NVN4ak5GlvkOVAFYOzKd+6FTP8Q=;
	b=4cPl62IbGKdSKbG254IjdxOS92q1P+MOMDjDeAPVCPzE6B5VkUH2tesu5k//SawJhTzd
	 arcWeM6PV9GXvGdRRigPoPoFnZNPWVx0nX++Qq3lfHv15NMKRxie6hA+ZjE1+hw++PJdp
	 diKwfpDuvavfVKUK72X0kRG+MMNL3YrEgP0f6dS9fWk3tgjXkdbR3CxVWBp6fjVnDsKT7
	 yWqEa9YQ98LnmaiLphN9ooyzlW9v3fAIIrJAzcmmZvJeUCq/C6tGSKJLrSkPy/ik8E2xt
	 blqBjcxmtryptmR1R/XCh+T/HKLovrYijWDjL56MedZ1D/+5VuPIdvxmSn//JhJwR5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=megLCsb5;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B04260A2622
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 12:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B04260A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=megLCsb5
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so5000391c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 04:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622755; x=1794227555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw7VoFe2BRpLE9w0NVN4ak5GlvkOVAFYOzKd+6FTP8Q=;
        b=megLCsb5PGtWqPdL+GjgU49TDv8Gv3Zr1DplU5+XiUnA384WTXsxxVAdkTk/9z5+9e
         eHvhSDdXw1f8bt02x5tOlEpvYtYqLaDeYFqG/NqL3cGVoWzp/+1XBd10lObfFXAQ/1VY
         XEkFy8mMEAOTT39BlcBRqmW7JIWhF5Tvsn8G1Q3fAWw9MlXghZx+VGgNcuEKSMTbA+jq
         xFsAm7q6qk4Gclb0Ch2d3XhD6/yXd5jfOtPa5mG7RGVoeqxR3WsqFeeYRWIu/Up7pRrX
         t98GhDutkRN8xgZyc7VPxWUnZduiFNxP00gUjzPl4Z21zT8BVXMKNGEWBP0QuNWlssdM
         /22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622755; x=1794227555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw7VoFe2BRpLE9w0NVN4ak5GlvkOVAFYOzKd+6FTP8Q=;
        b=xUSY4+M2R2kyHNgL+IQ3+pqGarjYtQHWFQwnu4HyLdPhZ3NtK+fXggaJ67lEfGs3Z/
         249BP6plhP2/6rT9oeeqK/pP4rnaXGlKaBMyAW+G5o4RShnBP8Df9OSTjC1P3GWvV1o5
         3IKp56JU2c/9fsh/1SFLZ4cI1vH6oi42JpUHHVePj5XbEULBMdl6j+xaKwMuZwM48WKW
         TT7Eq4phSnVUo8oLtx+loxaMJnuMpn2zMT6OtU0c4DpF9G+cvFV86H+j9WYBZ4m/Cr9B
         7BXgnocojbfLm6+/larVKxhdFFo1oZtGmPlJO4Ym0RZA6WegDpVIZMbIB/vA4opQ5Vw1
         fcYA==
X-Forwarded-Encrypted: i=1; AKwUvBxYwkwcxIKjSbdJc/kWmXFXE8Aj0hV68VXDg1fvJKF7UbQU1Jk+B4YPDa/grKC0cgaEHrrpNGqS0+f+zgFtFlo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh9+ubLQ1Ga/8RXoXaCgmhfbWujIKGElPlIF6MVuxAGnfD2Pv6
	KEd4hncu7EUKUq7bz92qZqjZdYQQila+sXkqPWuHiWGbr+/Bj57ZeuN2
X-Gm-Gg: AYBFou2oTdHpacnAXwly+C8udJxxaMBDtu7iRsfzwrflSbQenFHLGb2c6NIRzJFmmRq
	aZ1zAaN12qINCl5xAJv/49n/yNDvz2l4TuvZca61ym01RQJkH+e7C9ypdNwOXVbYdE3mRQU748C
	ci9iOcHvUNnAEouwpKEfVM7XSnWI9NZ5SBeOZUN2IyGRZCqFwA0jHBYbkz83aHwKNRlyVxYi54A
	Q21POjVKXRoxNvukIKZ1w3dGdgBpGfxnM+aAd0d9ESKB3BGwWOjXLNgfkusr4ZhfQYKiq5f4sbR
	/GF3Z4G6ikDdQfWwUL/Prn0kHr9wJLyMuO0XCnPs/jHWrvmrzZLLxvXwdJqiqfnnZyx/WDkCdS0
	nGtr7/Wlo6aI6Ka2pckC20ZId9uHtZErKQSu9iWkRENHaLma8Ymq8eCveKA8LB0d0jmysr28qX0
	q6N06x5tmcrQRRJgUUd6X8U2ZaMtJIjlMbBEf0bqeoVDmUL0Fr2BfcWclH8ii3whUA8KtgkLdAC
	VoV/yS0NgbMjnhLZA7FAFl3BavdZnBqzl/qUYoX4QN/qrn+0HNTVrxf4YcLBq2A49XN5jMkkdiQ
	8v21TyoyaZ8iA6VKm5N7KqihnWxV+Xbo8TkdZ1HY0lY8Hnc=
X-Received: by 2002:a05:701b:4348:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1ac5a0b8872mr15780127c88.13.1793622755017;
        Mon, 02 Nov 2026 04:32:35 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b2360d2066sm4950951c88.11.2026.11.02.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:32:34 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:32:14 -0500
Subject: [PATCH bpf-next 4/4] selftests/bpf: Cover a second patch with a
 jump behind a barrier
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-bpf-patch-list-followups-v1-4-ddc8ccf40f43@gmail.com>
References: <20261102-bpf-patch-list-followups-v1-0-ddc8ccf40f43@gmail.com>
In-Reply-To: <20261102-bpf-patch-list-followups-v1-0-ddc8ccf40f43@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_convert_ctx_accesses() can patch an insn twice: a barrier goes in
front of it, and then its ctx access replaces the copy of the insn
behind the barrier. bpf_patch_list_add() merges the two into one patch.

No test has a second patch with a jump in it, so nothing checks that
the jumps of the second patch survive the merge. The barrier needs a
prog without CAP_PERFMON, and "nospec, store, nospec" in
verifier_unpriv.c has no jump.

Load skb->ifindex, which becomes a load, a jump and another load, at an
insn that a mispredicted path reaches with a scalar instead of the ctx.
Without CAP_PERFMON the verifier puts a barrier in front of it. Check
that the jump still skips one insn.

Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 .../selftests/bpf/progs/verifier_patch_list.c      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_patch_list.c b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
index 045081936d73d..287b33e17b730 100644
--- a/tools/testing/selftests/bpf/progs/verifier_patch_list.c
+++ b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
@@ -423,4 +423,43 @@ __naked void patch_list_goto_over_nop_and_insn(void)
 	::: __clobber_all);
 }
 
+/*
+ * Load skb->ifindex where a mispredicted path through l1 has a scalar instead
+ * of the ctx, so that the verifier puts a barrier in front of the load. The
+ * load becomes a second patch of 3 insns behind the barrier, and its jump must
+ * still skip one insn. Only a prog without CAP_PERFMON gets the barrier.
+ */
+SEC("socket")
+__description("patch list: second patch with a jump behind a barrier")
+__success __success_unpriv
+__caps_unpriv(CAP_BPF)
+#ifdef SPEC_V1
+__xlated_unpriv("nospec")
+__xlated_unpriv("r0 = *(u64 *)(r2 +{{[0-9]+}})")
+__xlated_unpriv("if r0 == 0x0 goto pc+1")
+__xlated_unpriv("r0 = *(u32 *)(r0 +{{[0-9]+}})")
+__xlated_unpriv("exit")
+#endif
+__naked void patch_list_second_patch_jump(void)
+{
+	asm volatile ("					\
+	r8 = 0;						\
+	r8 ^= r8;					\
+	r9 = 0;						\
+	r9 ^= r9;					\
+	r0 = 0;						\
+	r2 = r1;					\
+	if r8 != 0 goto l1_%=;				\
+	goto l2_%=;					\
+l1_%=:	if r9 == 0 goto l3_%=;				\
+	r2 = r0;					\
+l2_%=:	r0 = *(u32 *)(r2 + %[ifindex]);			\
+	goto l4_%=;					\
+l3_%=:	r0 = 0;						\
+l4_%=:	exit;						\
+"	:
+	: __imm_const(ifindex, offsetof(struct __sk_buff, ifindex))
+	: __clobber_all);
+}
+
 char _license[] SEC("license") = "GPL";

-- 
2.43.0


Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DC5489FB9
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791502590; cv=none; b=BoqIw/71ji6CfogLeMhsR00tG/b6PwEXD25WoybjmVHU8yA9Dgg6Ip61wECm9fJaYlT8m4RgKUrHajdyFZqz+ExEoCpiWcMf+A5h7uiwMbritPTaVTGS6ZIhw0GCMu03nobuir+LnFkiRPn7WYMdQQRx0WFJ5FyAX2t3KE0hSLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791502590; c=relaxed/simple;
	bh=M/rQ4561R6UGKHsMQcfnGPKUwVjb9tqVoXZCGSnYpGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KN1JoZ/mteYS0AkHSEZY1d0w5bNgycPw5dHFweMLQ/ycSPFTz+LAo/A8tHoihEn2s3vK8g5pTy42VzGdfSng4Hp483Wfd2Xz7B6m1vEnixz30NanvCLv42s4kjrCjATJVty+Zat0ODYydb9vSh9pMHvFQaUmZGLxScC+jffPg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4bNCNlE; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4bNCNlE"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93a40a9a01aso538331385a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 16:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791502588; x=1792107388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5p2nTO5pz9p/mFq6enSm35xmN3QB4rNCp8nZZUu4Is=;
        b=A4bNCNlE2cQ8mo8jkpfdFWeILTEGV69vADUlry59sokN4N5E7/BVzrWWjPS+BZwXtj
         Rja0UnlC55PWxLIReHMXljNQsJumU+4fshNL2+GKkpqq5PATYGAkiG9T/SDlxnNeLYJ7
         ewOLMy4tUZYi3p6FT5fm0XoN/Dq4pBunzTw80q5RuIWdjdEtiOzs7wOeiPICK28yY5Iy
         d283p3I2r1aAAU9xorYtn9UQCZ+xOt+/6FolmrgiP0yVs76i4yoVNsJfm/089kqGTR5e
         TO1UNH+ht9sstmfqS2UYByJH/+8IVhdl5EwROXbrt3dVPuUJ+dQfPJ2c5DlZiVRYtI9b
         mS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791502588; x=1792107388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5p2nTO5pz9p/mFq6enSm35xmN3QB4rNCp8nZZUu4Is=;
        b=IcXxW/RaAO6czBGnqFIPg/OWlaWtunZVO7bu4GtKqkk6woolsDGctaSVwwePVomnHf
         6JcWjLvCg73q+KDBGvr2qSg0FLCBElIseFO0tsnjpgs/BsO3ggng4ju8DOiOLLa/lQdf
         Y2afJne1d8tnPUGQBKmEfMlQuCk912Yl88CHiMZj2vqShbXkv5mtf4o93IbsTjqJOxRG
         M8niwl3Qx1+7zfX2IQ5cSXd6pUdSCGrxlKC+XPom1LtsRkBDM0y1DU32ekBIG2ZsOU5h
         d8dka4dzYr2ErTkgxOpzjDDvVob5BHkSvruTWCA+SLY8sg6jZWpekAY4U3ECNGyQ46wi
         X1Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzo6ATsxmijvx6qI5XJQKbjYpXtoHSUtVaeqgIAqXFOn9kFtZJgu4UQnKKsWI98sVc5r/LvMO+If8URSkYPUa0=@vger.kernel.org
X-Gm-Message-State: AFuF++ns3NknKVmgLAJxqy+DMgxr54U1H9eW0jxlv6cddudr/E22W4bu
	ddTqupa6GmQjyHtViU38DOi99MzwEDctOfgfbe9Z/dGbapHhJ3TnRkKF
X-Gm-Gg: AYBFou04fIYHV5bMzbX0bM8iGoDqdqaY04GFbHEq+tJYk+wJmqcNJGRc1UXgVFvLGFz
	hN1FnlPSj6dem5P3ryx6/wTwehzUKMW73CCVqA7GdOpZT8CQr6socIkrYBmObmXWBrJAoJ1t/BM
	HKY5SqUi9/8Ftf/epKJ/aIiJWEJdy9q0FpFWKmg+qWagh/2HlC9ouEwMHEFC90BTS6JYNyD3ZDU
	kNH1MYR7Ina2PxU62QP2rEJ6oIuQH9NhEpRNYQPzmAiEiO09jfkmz9/5E7RYhxFISa6wklW5r6m
	dYtR00N5IVZ0b61wVgKgvN7OOSxNez5C096OLC14MytjV2vXvzISbko0LEx20gq/BYjbB4MacGE
	4xw59zd6EjhUtX6+63K2QUOSiCBlAjS3T6U/tWqVTcQ8WoUr2O8HltbsA6rspBtXkqJqBEXtp1e
	ZUFrtOKyK9s/LrUFAJXwsrfpeU+Wr5A6gsVShkujCIQn2UyT+MNdYQ40hz7w9z0MnnfsAj/gW29
	xwvMfgHmKCNM1PMkuAMV8U4UW6Q2Rr/XbPIEWiZ6rWPkn/LWZby1DNJF8AZrDtz8FFONt5QVwTB
	0PceEULT
X-Received: by 2002:a05:620a:1786:b0:93e:5cad:643f with SMTP id af79cd13be357-93ebdc7013dmr16445485a.29.1791502588033;
        Thu, 08 Oct 2026 16:36:28 -0700 (PDT)
Received: from battery.lan (pool-138-88-31-60.washdc.fios.verizon.net. [138.88.31.60])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9848702sm51693885a.12.2026.10.08.16.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 16:36:25 -0700 (PDT)
From: David Windsor <dwindsor@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yunwei356@gmail.com,
	David Windsor <dwindsor@gmail.com>
Subject: [PATCH bpf 2/2] selftests/bpf: cover bpf_loop() state pruning regression
Date: Thu,  8 Oct 2026 19:36:23 -0400
Message-ID: <20261008233623.4011127-2-dwindsor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008233623.4011127-1-dwindsor@gmail.com>
References: <20261008233623.4011127-1-dwindsor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise 18 independent conditional stores to dead callback stack slots,
reproducing the verifier state explosion fixed by the preceding commit.

Signed-off-by: David Windsor <dwindsor@gmail.com>

diff --git a/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c b/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
index 75dd922e4e9f87ebc947ee6e621a789cad10431e..c1c3099a6a20391c8b36b39eedd9cc6ce893d996 100644
--- a/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
+++ b/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
@@ -783,4 +783,62 @@ __naked void check_add_const_regsafe_off(void)
 	: __clobber_common);
 }
 
+#define DEAD_STACK_SLOT(off) \
+	"call %[bpf_get_prandom_u32];" \
+	"if r0 == 0 goto 1f;" \
+	"*(u64 *)(r10 - " #off ") = 1;" /* dead stack store */ \
+	"goto 2f;" \
+	"1: *(u64 *)(r10 - " #off ") = 2;" /* dead stack store */ \
+	"2:;"
+
+__used __naked
+static void dead_stack_cb(void)
+{
+	asm volatile (
+		DEAD_STACK_SLOT(8)
+		DEAD_STACK_SLOT(16)
+		DEAD_STACK_SLOT(24)
+		DEAD_STACK_SLOT(32)
+		DEAD_STACK_SLOT(40)
+		DEAD_STACK_SLOT(48)
+		DEAD_STACK_SLOT(56)
+		DEAD_STACK_SLOT(64)
+		DEAD_STACK_SLOT(72)
+		DEAD_STACK_SLOT(80)
+		DEAD_STACK_SLOT(88)
+		DEAD_STACK_SLOT(96)
+		DEAD_STACK_SLOT(104)
+		DEAD_STACK_SLOT(112)
+		DEAD_STACK_SLOT(120)
+		DEAD_STACK_SLOT(128)
+		DEAD_STACK_SLOT(136)
+		DEAD_STACK_SLOT(144)
+		"r0 = 0;"
+		"exit;"
+		:
+		: __imm(bpf_get_prandom_u32)
+		: __clobber_all
+	);
+}
+
+#undef DEAD_STACK_SLOT
+
+SEC("?raw_tp")
+__success __flag(BPF_F_TEST_STATE_FREQ) __log_level(4)
+__naked void callback_dead_stack(void)
+{
+	asm volatile (
+		"r1 = 100;"
+		"r2 = dead_stack_cb ll;"
+		"r3 = 0;"
+		"r4 = 0;"
+		"call %[bpf_loop];" /* trigger state pruning */
+		"r0 = 0;"
+		"exit;"
+		:
+		: __imm(bpf_loop)
+		: __clobber_all
+	);
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.53.0


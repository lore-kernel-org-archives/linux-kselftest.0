Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312CC4C151A
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394946; cv=none; b=YeZb1h5cjCWjvd2QXngDi5r8YpraRgtblHXrjtJVEh4PjP+TlKlrqrt7JnIztqhPdgLlIAMphjKd4zYhb+rpZesZ4GP4zYW3fBFM5kpuxKnst88qJWMVLFm8qFNVm1YbjfeGq3RH7cbfI7mRkIfKMg9GF2fjqcMOKMTHH7bL/oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394946; c=relaxed/simple;
	bh=ZVEMir1UVtjeqTDd+kQt9OYW8kEe+ToC0TfYjUegh2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBVnQHjruzJr6hAsgN6pnUi0cx8PqhGNzTjGm27IUZurgtGYctrNgL2aAdsS/jiV0RVvwil+IQGMH+N7g6/6Yo6OfaJ+ZH1IsBu6MivtLbKhVJilaYrI2UJejQ8+ct7hRw9F5As049KLIerI8Yp26YUBPAThnzgc3noGHaxT6pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1UCkofR; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1UCkofR"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33e6279a1d7so928612eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 10:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394942; x=1791999742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHXvTpeToSMwL5+SVT0PZraPoeYCO8NWG7j1aLQ/JCE=;
        b=I1UCkofRjmJtDEMqSrRX0+dJXFFZFv0KBZ80v0jJJF/am07zpBY66FXD+vY2Agex0S
         4mMoy4tsIjEcPsSw6Zf6SRMBtfzSOflAfr5VF07UebFTzeA/jZPljV9DScD4w6aCDLXZ
         Xguu0ZQrdXIRD6n/9WELDGFznN98kt0dvQUSOXXodE3IYo49gsd7JFO0VsOvMEnokRdK
         7on36iJ8omg2aXOSXYrog+UxOo8LwZtwaHySZ7frMmUV2XfLyYTeu4d6Pv1tUynGB64n
         EoWwM5ZB08Gwr5RrHo7QBgPzGJFBIlBGjOhXGTig39tzteTjMTXuyRyPox2pM831Hqyy
         wetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394942; x=1791999742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHXvTpeToSMwL5+SVT0PZraPoeYCO8NWG7j1aLQ/JCE=;
        b=MU/6fjiQo2jQ4KoQfp4YdV8um65q7plnNEFDAWL6E1xfS8UhMvzoFTq0Lud8J4N65z
         ZgiHJzkq7NnLVlQ0AI4kWc/Zlv+CvQajo8yqJDr7aAZaOM5yqn8QNLp4xYxLmuqdIF3g
         AF4B7Q4y/VNZuq856mT4iiGkwgjU/Tp+DX9ywNjijb38xcLwreKdCfGRg1El0O0eFCpJ
         RY/nJUjno48+EAs94NEdlQ7YrTWUWAJncvXVjjghaosHWOogWGZW8+b4ja9wSThnPzpo
         TGyVr8CSGlrvHMipPul2+3rBHLSrVJnUCKQSo29suapUAUHxsaAyNXEjovWUwyezEwUW
         3WQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXesUs7g5X7ZMbDsXZ2j86vIi0ASwYYF5lq6tZBaCIwp7tshfdMC6FdOUdTMRD1/X50pwtcE2e/krmKWG+ruU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfBlJzSqbsNi9pJkX7ti5leGS4EiTbjkJk6JCHPVVC8iuKcXHS
	VdgIMKwAAwsQdCsg+3z2JQYW2dRMDEPE/XNB3o2zMn0qTQyM401VW61c
X-Gm-Gg: AYBFou0Hjazdf89xIdchyYIySF8tyFxRSYU48NKOz7j0z6OuREwFICGThk1M5jmy7nx
	+UknqYXt/x0XT3L4C26c+lijUzBoDK+qDG619xnr47btYQTCyaOUkVxpCkDObCLuqb+eV7ixSvG
	IGi8iTJRwo/AFX8NoVoouZzu3ltgEIBjiKZSolaaJ+ghX5n3Adj+NmAqo6s6mLoH9BZ5TH9w+55
	gGGoPnGnRcnFlS4jZ+l3yq1L8niUvTs/zvZbQD3UmRxniEddN2TQamUV9Tq1Uhccx2pPdGmavlA
	VvBUqLci62OzqdyfqE8g3a2uwEU/dTB/RC6U+Fy9mCL09mIoxa47dBgPXdC34La3uqSfoukbUVG
	cO7k8Sr+lqaM28nsrPI6x3DpBz+DRvnxbyQrsfvBflAWnj16jcasV13dnweNl0o055d4YipSLCD
	+TLH+i5+ajP5j4vFguWDdhApkVZe37di7178JXvSuZHD8G+FNBNlOvyQ1N7UFMgdLtxlpq058zt
	VhHRrm9rJ/NsoUGXzbEzRsUz4ZoKHUm
X-Received: by 2002:a05:7301:6e9a:b0:351:4d25:861 with SMTP id 5a478bee46e88-3515de80f01mr3202494eec.7.1791394942003;
        Wed, 07 Oct 2026 10:42:22 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm9124558eec.26.2026.10.07.10.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:42:21 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH bpf 2/2] selftests/bpf: Test missing caller stack argument slots
Date: Thu,  8 Oct 2026 01:42:03 +0800
Message-ID: <20261007174203.37071-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007174203.37071-1-bestswngs@gmail.com>
References: <20261007174203.37071-1-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise the path where a static seven-argument subprogram has
unreliable BTF and is called through a bridge with only one initialized
outgoing stack argument. The callee expects two stack arguments, but the
unreliable-BTF path skips check_outgoing_stack_args().

Without the fix, the second r11 load copies an 80-byte bpf_reg_state from
stack_arg_regs[1], past the caller's one-element array. Expect the
verifier to reject that load at offset 16.

The fix also rejects the existing uninitialized-stack-argument test
before the later unreadable-register check. Update that test's expected
diagnostic accordingly.

Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 .../bpf/progs/verifier_stack_arg_order.c      | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
index c9fe4857d..23c7515ea 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg_order.c
@@ -129,6 +129,16 @@ static void subprog_bad_ptr_7args(long *a, int b, int c, int d, int e, int f, in
 	);
 }
 
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
@@ -151,7 +161,7 @@ __naked void stack_arg_read_without_write_1(void)
 SEC("tc")
 __description("stack_arg: read with not-initialized caller write")
 __failure
-__msg("R0 !read_ok")
+__msg("invalid read from uninitialized stack arg off 8")
 __btf_func_path("btf__verifier_stack_arg_order.bpf.o")
 __naked void stack_arg_read_without_write_2(void)
 {
@@ -170,6 +180,27 @@ __naked void stack_arg_read_without_write_2(void)
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
 #else
 
 SEC("socket")
-- 
2.55.0


Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F31B4F0A
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 04:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297328; cv=none; b=HOk/ksV+FnR9BKqGd/otdptU1nuHS6kQFQOt0J294EGcFGVLyj4kt7/7Kn5Hgimji/0K9cpaWLHjVZvI4nex8w/PD8NccViBHSVb2RQ1LO7nWSfsYv3LdgZA4l5LYA3DdEzv4X2FvJjcL6kdDALs+qLDlwAXOj+NTeGnCSnVgs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297328; c=relaxed/simple;
	bh=1WTEq8XDn5lZJt8MvaFJTmJDSDYONR3DmalFi1vhOFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OoJIl5/GEDn8NNhWFzfD3t2dPq3r3leW2zXcTIw6UQIr5WzfE9Pv6EkxFkUdg8UGV7xSg9M8WcXbNLKJE0iuaR3Bo1i/WkQRD8uhfHhOxEjWZEgbDiLseuzaQrAN1PveZnOM+KND7oakhNz7vR0edaJZTOXFmh9OHV9bwyyEpMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuKihxCf; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuKihxCf"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac845e7231so307049a91.1
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 21:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297326; x=1792902126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LDrqDBR4YF4jx3Glhm4GDi471ougI+ZECXiqokwPJY=;
        b=SuKihxCfIQywq/PsnV6gU89D3HYuor5UMMAtaA+jInzLuzx6/ybmlt/dMhVYJRN51i
         kzbDmFFEbepi9+eNRZrOdXoPeA3djbWgVGJPwtTHE5k9jgPNLKOtfcqFIGiSVwg1SFFq
         EKzSn/ZO4J9oAtHugTd2yJFt2FT7dznZSb9DoPOEsh8UsWOEbdQcldSv1o2ZR31Oo/em
         jIMoO8s8RCEIOEayCEnFYqNpIxSGWMrGtQqLlx+Y1d57VFX8oGBHvbxGPuDeIwe/iEaf
         0P3E6ieLIFHQq8PKAQR1Bjj0KEnFSTLBnqapyCcK25DYrcigvTi3OwMZypXaO+h6NfXc
         FMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297326; x=1792902126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LDrqDBR4YF4jx3Glhm4GDi471ougI+ZECXiqokwPJY=;
        b=IFAkYhxW9cdkbOr5kcpB5/qOVBWWo1SF8SLplnlD86S/N4P0wiHszUw34J7RHlRD5i
         OTSr1gaUPVSLJkE2ZNX4/F9mwVx7Dnr8O4OXLiefAvg73IVluBx55i6GVi07hkijemKf
         81EnhmrrWYrlfLFBtPTlSL+bS5HiecMNb3ersq0WTr4xxuP+bgkFIT2Aq0BdQ1y5rtyB
         W5uuv54agenlS5vSSnVGzV/FkiB18s1DZgxIsY+lNiiT+L1E0M34ghZZmVRWSbh+CuRf
         YxKerW/nEmNo7Nslg9tw11eGs6vPMphKa5q+l7xkQb1WHjYuyZVunvSZ2OKg9rdBmv6N
         41hw==
X-Forwarded-Encrypted: i=1; AKwUvBzHMnJtidIMMyk6BJDo07Jbbb5hCXQI113aMlIKMG26hal0NlWQixlLh6BxEqhp8Lj0f+JF33ebVLO27Vi+nWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVrJ/mpAEuW5+cd8llLonJlwOEOBzOlo2HbyxTWUYWil2fdEpO
	a2NrKA/bAzuv1IX3VExQbdykOdP2D6FTBYGzRpGE7d2hCPS7YBf0NouD
X-Gm-Gg: AYBFou1QSlQv07PNV4i0LUvrJmkfv38drD/6G+2JA1+LvC7TrOGZSELWhPsDbFwndab
	t9rOuBNy+hwsqXai4W7Ct/rw9qeoRuMK3PYyxf0CVJKfh2znsgNkAfUdcZV1KaLYSF4VPQlfbxl
	pKyr56rLouxtEjrMIj4tOHBUMXWPEncoUzQgD9M95O1GgDULZnT3fxOR5KHk7gIknSx6vRIi8F7
	VAc1OUxRLmRO+gvyhAkjuAs5NrvXsvOD3smisUegzFi4DFRPdIslhdGSdjNzrdxGUAnJts0gO5r
	34bPRKzZHJqD7fDOou4Suzz06A98A89iNiPQ7FlKqcEeHdRKPoMD97r9vUOjhU9znYVdiKNmZOt
	PsIrtZxuyoyd4PSKFzO2T3uOCwfox+7iJusqXA22fs0AVYGkQVI5DDRZWskfYM5vuuFupYFaDM6
	NcXlwszZbUk4kk6VhiZFkRRTVaRmo9ZAkIa2ds44KGvvfa7J5xgjqAQW0bhAp4m6Wh2wAw8Wj/
X-Received: by 2002:a17:90b:2d86:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3aceefbf369mr3429642a91.23.1792297326333;
        Sat, 17 Oct 2026 21:22:06 -0700 (PDT)
Received: from [127.0.1.1] ([123.109.188.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8758efsm24799195ad.55.2026.10.17.21.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:22:05 -0700 (PDT)
From: Woojin Ji <random6.xyz@gmail.com>
Date: Sun, 18 Oct 2026 13:21:42 +0900
Subject: [PATCH bpf v2 2/2] selftests/bpf: Test out-of-range index bits in
 bpf_get_func_arg()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-get-func-arg-v2-2-048848b3eddf@gmail.com>
References: <20261018-get-func-arg-v2-0-048848b3eddf@gmail.com>
In-Reply-To: <20261018-get-func-arg-v2-0-048848b3eddf@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Woojin Ji <random6.xyz@gmail.com>
X-Mailer: b4 0.14.2

The inlined expansion of bpf_get_func_arg() bounds-checks only the low 32
bits of the index, so a helper prototype that keeps the upper bits of the
index is needed to reach it.

Add check_wide_index() and call it from the fexit and tp_btf tests. It
drives the helper with indices that have upper bits set and with indices
whose low 32 bits are out of range, and it checks that the destination is
left untouched when the helper reports -EINVAL. Without the previous patch
the wide index is shifted as 64-bit and the load uses an address far
outside the context.

Acked-by: Jiri Olsa <jolsa@kernel.org>
Assisted-by: LLM
Signed-off-by: Woojin Ji <random6.xyz@gmail.com>
---
 .../selftests/bpf/progs/get_func_args_test.c       | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/get_func_args_test.c b/tools/testing/selftests/bpf/progs/get_func_args_test.c
index 1bf47f64d0967a3543739841201b58b14b4036a7..9b0beb58d88d5bcf1a36a0598695fd02a2cebbcf 100644
--- a/tools/testing/selftests/bpf/progs/get_func_args_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_args_test.c
@@ -6,6 +6,40 @@
 
 char _license[] SEC("license") = "GPL";
 
+/* Keep the upper index bits: the inlined expansion must truncate them. */
+static long (*bpf_get_func_arg_wide)(void *ctx, __u64 n, __u64 *value) =
+	(void *)BPF_FUNC_get_func_arg;
+
+/* Both traced functions are called with arguments 2 and 3. */
+static __always_inline int check_wide_index(void *ctx)
+{
+	__u64 a = 0, z = 0xdeadbeefdeadbeefULL;
+	__s64 err;
+	int ok = 1;
+
+	/* The index is truncated to u32, so these select arguments 0 and 1. */
+	err = bpf_get_func_arg_wide(ctx, 1ULL << 32, &a);
+	ok &= err == 0 && ((int)a == 2);
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 32) | 1, &a);
+	ok &= err == 0 && a == 3;
+	err = bpf_get_func_arg_wide(ctx, 1ULL << 59, &a);
+	ok &= err == 0 && ((int)a == 2);
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 59) | 1, &a);
+	ok &= err == 0 && a == 3;
+
+	/* Out of range: -EINVAL and no store into the destination. */
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 32) | 2, &z);
+	ok &= err == -EINVAL && z == 0xdeadbeefdeadbeefULL;
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 32) | 0xffffffffULL, &z);
+	ok &= err == -EINVAL && z == 0xdeadbeefdeadbeefULL;
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 59) | 2, &z);
+	ok &= err == -EINVAL && z == 0xdeadbeefdeadbeefULL;
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 59) | 0xffffffffULL, &z);
+	ok &= err == -EINVAL && z == 0xdeadbeefdeadbeefULL;
+
+	return ok;
+}
+
 __u64 test1_result = 0;
 SEC("fentry/bpf_fentry_test1")
 int BPF_PROG(test1)
@@ -63,6 +97,7 @@ int BPF_PROG(test2)
 	/* return value */
 	err = bpf_get_func_ret(ctx, &ret);
 	test2_result &= err == 0 && ret == 5;
+	test2_result &= check_wide_index(ctx);
 	return 0;
 }
 
@@ -162,6 +197,7 @@ int BPF_PROG(tp_test2)
 	/* not valid argument */
 	err = bpf_get_func_arg(ctx, 2, &z);
 	test6_result &= err == -EINVAL;
+	test6_result &= check_wide_index(ctx);
 
 	return 0;
 }

-- 
2.47.3


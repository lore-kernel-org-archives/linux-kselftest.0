Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733E202F65
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 18:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770143663; cv=none; b=g+VJywbPySATMMrZoLqdW4z+ebvVk2PM2YyCmSk3O0h0z2Sc1359tsqeS252UM+4NiIiSeQ2iM5FCql43uYOdHQ/myEyk/u4B2lUKJyvLU7HfM2OaILZBG2yPq9vlbop1E9ZhEDAyzK+sbiTsc/kvt4kksP/gqmCuLJA0e565WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770143663; c=relaxed/simple;
	bh=pBOp8/P1hQCnGJgskG3YY0KJlWnmwCTblLlq6mNTV2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ih5RbnAxK4nP6JDEo3s9R27rdZzVv6KitbskqXwq3TalCnL0zGv4KMiXW37ez4WTH9zb3dNPppMv694ugJzPAfNCi6qlShrqktPyHDQ52f8CzAx4ncdfmcjffOtSJk6gK7jIICIFsDe/rjTVbNBcIdZUTpgWyDFJn3wxJXs80xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKRFbKHk; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKRFbKHk"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82310b74496so3462646b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 10:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770143661; x=1770748461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o6uJLcE00Iq19qZLatJ2/SPEG6MVkQU0n0oI7YP48ZU=;
        b=fKRFbKHkFdzdVesugMjN6MHatQ3vL0U7kztStrlgqNXUtO2yvB1VxYW3Tfkl88NUFt
         nbSWqT7nGRtzWp+fDca4ZS/MOUNsKKMbr8SFk6FpAfQc4CZWz65FLBkiueEYgHT27r7M
         IFsmSbCRAdammoobSnvbPPJ2T28hIwTk0auDITdnQ4UXMblL2+sehq7fTQ6R3vA0nKXc
         4Je7Z5yt6Q7qUOWBoEWYmXharCSyVsqc5gqEyFr7u6RKu8+O/vGLAKgC1sYJOkXv0zL8
         KkLKoAvsBCVzc7up58zUrcC9JtXJvNKRblBd11fyMfTv5AABF2M5UuAOY6DAiRJbrQi0
         og3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770143661; x=1770748461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6uJLcE00Iq19qZLatJ2/SPEG6MVkQU0n0oI7YP48ZU=;
        b=vEKiOCPNuHNqUQ0hPhcyKGRHPQDEDjvYnl5wTQ7sr3IS8Fb//RKk1heUEemyBqzbFl
         MJc584Yb6CrOxhuMSeTxzzrsSABXWE7fanRZNLXpOnTo8GEuu/lah2A5nXk2O119LfXY
         plG5DNzBIxWjzjMumtMnvtciu4yHa7Rde0Xprus9cUAf0cOt/x4fLE8+8BClat4e1oVV
         4ZLVdqS+fj+LRhhBaCiSnPFH/9uLTkGSZkNP/EcBRbzYIoYiRvbGFOtvrQ7JLMFLG8Ba
         l+XmLtNtcUcdrPqMj3i5Yq9lXOb2VLx2hxeKk8Fr9YA8vrCGJD5xQZs+E0iTfw7/SUQr
         h/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjHdLqmunGm7KxmIlJF8aaDcGKuQUcf8R+pFtm+oXl/nJhbxCRpM24SxR5JBOVB4VISzX1VoR8zHDJ+1RmUWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJiqEjFLNFdTAmM2lRuOnJsh0fJLYMndjTVE7wzNW4iy3Mzdww
	vQZVAAIEIjk+uGB5yi3f5RVeIIPhxDf+kFBuqH4y6OeVJRKCENIcLzv3
X-Gm-Gg: AZuq6aIj3IPAO5QcJPL/kHiBthlQPcZV+EAVEYG2PGooc2Gt20zbB1E6VFZDu1yebGm
	RI3Cy6D99TQMV/uuDup+rXtMBkmWs0RO/nCqlSQl8fM+Pi8Yx0VGRDuStppsgSreUPwPT0rCv5z
	UR/6Cp57aGHh99MrtsXZXxyrZdfwL4l6u0SOSqnGZzIMKnALhuHUDHhd9O3jhlEoFVGQE2cMMMo
	JCIUEK+GbZruud8xYvDnqHNIRFLpq4a9EMBM4H+hP3dFs7DyQ6+/9ZQ7wr7dYfQK/GrgIhijH/0
	W1cuQ4v0U6sOrzT6aibw0DcMc6QJy3HoA//2uHp7MUNDk+72Ab2+Q9tO86dyB3ZTbg9EmzcxH/4
	3d/8/lb+xlmMKYB9d589SKxWOOISdeg+CBEfcL3JzMlbcnGHEB6DI/mLHiucvIFxx/5v6MJyj19
	19Z7maQjXM99rm82J708x4K+ii
X-Received: by 2002:a05:6a20:cf90:b0:38b:de3d:d542 with SMTP id adf61e73a8af0-393723c22c5mr326552637.51.1770143661043;
        Tue, 03 Feb 2026 10:34:21 -0800 (PST)
Received: from google.com ([2402:7500:479:35ee:ffa0:8c05:8b18:1c7a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354860fa13csm413520a91.7.2026.02.03.10.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 10:34:20 -0800 (PST)
Date: Wed, 4 Feb 2026 02:34:16 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, davidgow@google.com,
	raemoar63@gmail.com, kees@kernel.org, eleanor.lin@realtek.com
Subject: Re: [PATCH v5] lib: math: tests: drop unnecessary KUnit param_value
 casts
Message-ID: <aYI_qLX3DqxlymmD@google.com>
References: <20260203173040.42158-1-titouan.ameline@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203173040.42158-1-titouan.ameline@gmail.com>

On Tue, Feb 03, 2026 at 06:30:40PM +0100, Titouan Ameline de Cadeville wrote:
> Drop unnecessary casts from KUnit parameter access since param_value
> is a void *. This improves readability and follows common kernel style.

I'm not necessarily against this patch, but to be honest, I don't see
how this "improves readability."

Regards,
Kuan-Wei

> 
> No functional change.
> 
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
> ---
> 
> Changes in v5:
> - Use consistent email address in From/Author/Signed-off-by (titouan.ameline@gmail.com).
> - Add version changelog below the '---' line.
> 
>  lib/math/tests/gcd_kunit.c      | 2 +-
>  lib/math/tests/int_log_kunit.c  | 4 ++--
>  lib/math/tests/int_pow_kunit.c  | 2 +-
>  lib/math/tests/int_sqrt_kunit.c | 2 +-
>  lib/math/tests/rational_kunit.c | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/math/tests/gcd_kunit.c b/lib/math/tests/gcd_kunit.c
> index ede1883583b1..b9c9b8758991 100644
> --- a/lib/math/tests/gcd_kunit.c
> +++ b/lib/math/tests/gcd_kunit.c
> @@ -34,7 +34,7 @@ KUNIT_ARRAY_PARAM(gcd, params, get_desc);
>  
>  static void gcd_test(struct kunit *test)
>  {
> -	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> +	const struct test_case_params *tc = test->param_value;
>  
>  	KUNIT_EXPECT_EQ(test, tc->expected_result, gcd(tc->val1, tc->val2));
>  }
> diff --git a/lib/math/tests/int_log_kunit.c b/lib/math/tests/int_log_kunit.c
> index 14e854146cb4..9f9b48232701 100644
> --- a/lib/math/tests/int_log_kunit.c
> +++ b/lib/math/tests/int_log_kunit.c
> @@ -43,7 +43,7 @@ KUNIT_ARRAY_PARAM(intlog2, intlog2_params, get_desc);
>  
>  static void intlog2_test(struct kunit *test)
>  {
> -	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> +	const struct test_case_params *tc = test->param_value;
>  
>  	KUNIT_EXPECT_EQ(test, tc->expected_result, intlog2(tc->value));
>  }
> @@ -52,7 +52,7 @@ KUNIT_ARRAY_PARAM(intlog10, intlog10_params, get_desc);
>  
>  static void intlog10_test(struct kunit *test)
>  {
> -	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> +	const struct test_case_params *tc = test->param_value;
>  
>  	KUNIT_EXPECT_EQ(test, tc->expected_result, intlog10(tc->value));
>  }
> diff --git a/lib/math/tests/int_pow_kunit.c b/lib/math/tests/int_pow_kunit.c
> index 34b33677d458..ef9c8a9bd8ac 100644
> --- a/lib/math/tests/int_pow_kunit.c
> +++ b/lib/math/tests/int_pow_kunit.c
> @@ -31,7 +31,7 @@ KUNIT_ARRAY_PARAM(int_pow, params, get_desc);
>  
>  static void int_pow_test(struct kunit *test)
>  {
> -	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> +	const struct test_case_params *tc = test->param_value;
>  
>  	KUNIT_EXPECT_EQ(test, tc->expected_result, int_pow(tc->base, tc->exponent));
>  }
> diff --git a/lib/math/tests/int_sqrt_kunit.c b/lib/math/tests/int_sqrt_kunit.c
> index 1798e1312eb7..9c46024b0fc1 100644
> --- a/lib/math/tests/int_sqrt_kunit.c
> +++ b/lib/math/tests/int_sqrt_kunit.c
> @@ -45,7 +45,7 @@ KUNIT_ARRAY_PARAM(int_sqrt, params, get_desc);
>  
>  static void int_sqrt_test(struct kunit *test)
>  {
> -	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> +	const struct test_case_params *tc = test->param_value;
>  
>  	KUNIT_EXPECT_EQ(test, tc->expected_result, int_sqrt(tc->x));
>  }
> diff --git a/lib/math/tests/rational_kunit.c b/lib/math/tests/rational_kunit.c
> index 47486a95f088..b05587a1e90a 100644
> --- a/lib/math/tests/rational_kunit.c
> +++ b/lib/math/tests/rational_kunit.c
> @@ -33,7 +33,7 @@ KUNIT_ARRAY_PARAM(rational, test_parameters, get_desc);
>  
>  static void rational_test(struct kunit *test)
>  {
> -	const struct rational_test_param *param = (const struct rational_test_param *)test->param_value;
> +	const struct rational_test_param *param = test->param_value;
>  	unsigned long n = 0, d = 0;
>  
>  	rational_best_approximation(param->num, param->den, param->max_num, param->max_den, &n, &d);
> -- 
> 2.44.2
> 

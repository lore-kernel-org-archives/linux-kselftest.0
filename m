Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE7938E5E3
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109289; cv=none; b=fma8SJja3HJuCaMcieZ3mi/3av5eE0TFB8dv/pYb9dfx3sZNySsBmiFHPw0RLsQBE3L7LOxEDwMyV+f2Xi/Q+AxGW4/utClMUEif3LbgpaRiRd4qWtvXGa6ENvR+qprVaTy2MtUcFojrwdpVUPJguTJiWx9GC82QGkAA2B8NJ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109289; c=relaxed/simple;
	bh=PL3ysPmbxcBDibfXv713ph0hidA2EAq/4bda6HQXI7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB4io2cAwWgkEdtL7TJdF4W9B7tiBtpAzZmK9Wtb3UdPz802f4Jq3/FsivdoNtHUXEtkLgQUrrakxAYubtXiaaKRhsCwOxtHR8wtFJZ1YErCxL3hxKYxtqj/beU9YUVwRNSBeyWf7F+6i4oJyoJ0fjQb5OshRBJB0++PAYpa9WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrHgK8B5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrHgK8B5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0c20ee83dso49458815ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 01:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770109287; x=1770714087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1/GRgpl6NlEP7J/nClm4VO7VYnbdrjrhxV7mJrSTMnM=;
        b=IrHgK8B512q7npDxBqy7GNLxDNaSdG6OSzjnVwoUMm3TSUtIJPb5KeeXw8UVhNr8Kb
         Ir+aVc2x3YDpUYbLPt5snOGCeFf4vWQvYY1i7NPWSgckZCfZt3uQcwgWuIbiD+3NPzUb
         AUB+ZpajELStcRsfkHaZFHWzuT+UdokGdEvrG9bA8mdpM9qmmZxfLU4a3U3yBmFBL9Wn
         4vJTLlm5yMZdKWv7pKR+1Y4f16qx1RPOyFU0eXWFiKSNEYaRdgDcFiZgrDfXJEaaEUP5
         X/y9JGABRFxU7j4W2wNm+3eE4fBuHNaq2OzCps0p5TmgWUYCsDMdglOYkkMzfoUoJG1w
         3NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109287; x=1770714087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/GRgpl6NlEP7J/nClm4VO7VYnbdrjrhxV7mJrSTMnM=;
        b=lgb0cwKwXtVAYTIvampiLtiBz0Fa8K6PHDv0BWyT5GLMfEdEDwFk63i0pO1AB558zK
         h8QHKy9XBHCuO498SKANs68z4If143zU6qe5IzqPk7Q59Nwq24GhRzA4bQig5H7N18jn
         +kJX/bnxcNYnVZfV01soWON0hVOifN6eLKBOKDhfwVgr+jGSj9ucnzTJEfPKBvEmprOQ
         PuK6t8UDFKU/K9b2btHbG/o4gOzhMMZoDuUvykP9W8usrHnheTaxLPcbpsUz1J+nsYUp
         zlslVhDMl355gLLzK+dNNLenRIBd750xFGgEAF3C7jfwrIbyq3AkKs5osugPSG/4ZZcs
         Kuxw==
X-Forwarded-Encrypted: i=1; AJvYcCVxMj1UK/Mq28akZUvEaJoWKyMQpZ+KMblKrlBVv3r0Y/xErD7leBcBYuuZizvg4xUYtXL4yMwouYbDbrd6WVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6pEWnG/FIsMK+BF6pXSELhzwXDHKr37zR8zfXYG/4rdGTZyKx
	mZgQ/JBCie14br2OaY2ETHIEkwViPMrzsbhGgnkwDbwF4MrE28vmH5Xz
X-Gm-Gg: AZuq6aJUpJTr3q3NdvtCYxfU4eH7PZWHZl7LrjaW6wqPS/x8iKmfN0aGsvL2Dh82XHr
	kw288kBt7lSAA8cpE13mq26eypObBXYxqNAnxVeGzkRTFumd9Lly2VWDX5A7FyU1h1Eu76GM/aJ
	sECFGiw8JKFEhuYC2qcuZUtm8bzp4aK1FdHTy6IILW5QCXvPUjpbttLR2qyGBelRRhHG9P2+y93
	xBd/3b8Ki6BJgl8lE1JS64D2LgWVph0FOkxjyygiFr8CRJxZwbr/ZiexbMRZb99ht8/p57Mwy6Q
	HSC5m4ByRMXN4eF32TXOMHWHX4Fsg9VwDLsk+Mv21rFHDK6+q/fr1SAmt+THRtJpapxuyXZMgcQ
	molCSOQn5dICnxBiiHlI6XNGO8xzSl0vn5muV2kajF6l2Y/kZ7zS4Ybfoq67jo2iD8tWFxEMZEs
	wW++xktyIBpsdQ0vgADQ==
X-Received: by 2002:a17:902:d54e:b0:294:f310:5218 with SMTP id d9443c01a7336-2a8d894cb94mr148176215ad.0.1770109286907;
        Tue, 03 Feb 2026 01:01:26 -0800 (PST)
Received: from google.com ([2401:fa00:95:201:ccd7:e2a6:45a:76f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eecb7sm163847715ad.1.2026.02.03.01.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:01:26 -0800 (PST)
Date: Tue, 3 Feb 2026 17:01:22 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, davidgow@google.com,
	raemoar63@gmail.com, kees@kernel.org, eleanor.lin@realtek.com,
	Titouan Ameline de Cadeville <titouan.ameline-de-cadeville@epita.fr>
Subject: Re: [PATCH v3] lib: math: tests: drop unnecessary KUnit param_value
 casts
Message-ID: <aYG5YsZF6w0RJZpM@google.com>
References: <20260203083608.29109-1-titouan.ameline-de-cadeville@epita.fr>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203083608.29109-1-titouan.ameline-de-cadeville@epita.fr>

Hi Titouan,

On Tue, Feb 03, 2026 at 09:36:08AM +0100, Titouan Ameline de Cadeville wrote:
> Drop unnecessary casts from KUnit parameter access since param_value
> is a void *. This improves readability and follows common kernel style.
> 
> No functional change.
> 
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline-de-cadeville@epita.fr>

checkpatch.pl reported the following warning:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>' != 'Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline-de-cadeville@epita.fr>'

total: 0 errors, 1 warnings, 0 checks, 48 lines checked

Regards,
Kuan-Wei

> ---
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

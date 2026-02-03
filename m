Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290463EBF36
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130497; cv=none; b=WyRNvys7ydY7xkfJPI/WC2aI9In6j0KjI9c0vm3JVZAOpcsLeUbXt2e6UcqygSTsEVzayRCD6o4x4cS1ofA6v+CGGZhGRTpNvbXtsU6yz62vQx7ZH8Su8vuW88FTH3Wf0zgl3TOlUUx8C/w8p3Eg7iZ3v7f3NB+fD8WENsmZ1v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130497; c=relaxed/simple;
	bh=1h8VkPqC0AtstNgySYZODiaA2bt/n8qUC0fcONi7FXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maa8C6jxQK75y1qEDUQKNE3kaAoZYe1kco1qoHpSrSjZTJzznj1Tqm6mEmBea1ABAhbF+K0liLpmpbkwQHe0AUaudzzxt8E2d+SCLFn8NDD4z/RcSI0doVlDxQwZp7Hxv4PJTL0OI8pP7q5cChlSxxrs9zrxHwe5ZmKm1kf9fc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKKSoT6i; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKKSoT6i"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8230c33f477so2593090b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 06:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770130494; x=1770735294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SwruOa+rqkI+mx5hTpN8rgA/A1w5qc1IEyyYTI3b8/c=;
        b=YKKSoT6ibevfeYeeZEXaFD8oCA1+dJsBNozbL5b2NEoCQqmiVBUxJBAL6LuA5pMade
         9hSM0FEvyNs+9lV4NwHsPEwWOjuuoCGg4PxP05FP0FHAgdbjMdrid639jUTX/yfk58wn
         2aVU9n0k4aW8BfQHbfr9fiIslD7XsCbfMpyhh6FcJu//ZMtPBsaJdl6aV7zePtCoCLMA
         c3fLecGVOBJ402ZbCmI/nKgk52+yrLnOUhsMeDxiDPomabNAzqooC4MscImZ/+HnWcMk
         OYU//PDdhs0BugtmdtyRMtOsJDzOI47V0I1TaK/T8wJ/JjcR02DoVfXTcnJkuUwjlZ9u
         ymrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770130494; x=1770735294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwruOa+rqkI+mx5hTpN8rgA/A1w5qc1IEyyYTI3b8/c=;
        b=kNNjTHzMulfSiUv17XpO8UDLZHFWm+3uXibePEM7TDZpwoaGH6KBO0dxcM9Jva97eC
         C6UMYqpunTBE9Ohwqq+OpfBm8FlKbITOpuWMSboceXCS5+4hXRcA9hPL+01zX0iJ4a0L
         SeaPu9ygbTsNygQhnhCDvleV2j4B3f0thltxN8tiK+agmSGewZpBh/Eety0dhKO22OcW
         RqIV+C9wxK67NDos3FBY8ABwI0K5CzQQzR7/bdpnUzh10M1nJEIn4BvOdTOoi0mEj8CI
         DJt/QrSfx7Eyy2WiT6YZq27QPsCkRZFzCjfVZmNtmeLNXhTxVo6hNc6ordE/hBZD3nNQ
         dhkw==
X-Forwarded-Encrypted: i=1; AJvYcCUNZZJDjedYPgwMeOvneycB+R9bKwRJGwjPaPuFmMGYz5KeQN68zvNJ9WurBDXfy70rqaH6sZKPAC3twdgWXok=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzSawvZIMhPZpV3uJPDnhNkF2SSiJK09fpWfwmfJ8++7sUfsZR
	o9bc3+/JzY7wfOsGqtDoX6BwrKfdJSGcUgY9JBqein22f7WtjelklXoR
X-Gm-Gg: AZuq6aLVLCNkgcmuGZiioHEoQ9QfDIw38WntOcEaZIb2BLTue7MHTG5M6HvGyZH3Py1
	y3/9CZrQM5Li4aKsrWLRuFOlyVllbGcIgP1OZN5ilnHwmalD9uRegimCHxYMCd5GqEVBZZ+mjj0
	Eg239i4nDPUYL1+5lZhZX9cx4PIw+/uXj31DI1cTXgU6Yi3TweWcy7VRSujwysq87G2HnMZ4yZS
	CRqdhUwa27xVI/glfVj5jQ50YM2nN3ftTq1kmm4ZDFZ0c/sFUr6VYtY0A9X1ZTCvhztwBVgr5Al
	yCT3Wr446H7Px3haBe/MXBuC15gNqrfFUPEIEYJPcIB0JAZnwKf9rERUrS3D0/7Ql3Fdov8SQCR
	aVAcGz+CFY4tOGJmAYFtAO2ErUK3DQAotdssZYPFo+7HMaZNZC4ysQefQEi+ES77s5YoJPlE6NM
	7lfRuL7MZZVdJXzCAzRMCBl3JT
X-Received: by 2002:a17:90b:1348:b0:352:d1a4:19cb with SMTP id 98e67ed59e1d1-3543b323becmr14114944a91.11.1770130493557;
        Tue, 03 Feb 2026 06:54:53 -0800 (PST)
Received: from google.com ([2402:7500:479:35ee:e4d3:f3eb:beee:73a1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543babe4aasm7657190a91.0.2026.02.03.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:54:52 -0800 (PST)
Date: Tue, 3 Feb 2026 22:54:48 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, davidgow@google.com,
	raemoar63@gmail.com, kees@kernel.org, eleanor.lin@realtek.com,
	Titouan Ameline de Cadeville <titouan.ameline-de-cadeville@epita.fr>
Subject: Re: [PATCH v4] lib: math: tests: drop unnecessary KUnit param_value
 casts
Message-ID: <aYIMONemSs3GqJLT@google.com>
References: <20260203090609.30430-1-titouan.ameline-de-cadeville@epita.fr>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203090609.30430-1-titouan.ameline-de-cadeville@epita.fr>

Hi Titouan,

On Tue, Feb 03, 2026 at 10:06:09AM +0100, Titouan Ameline de Cadeville wrote:
> Drop unnecessary casts from KUnit parameter access since param_value
> is a void *. This improves readability and follows common kernel style.
> 
> No functional change.
> 
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline-de-cadeville@epita.fr>

v4 appears to be identical to the previous version. The same
checkpatch.pl warning is still being reported. Please slow down and
ensure the content is correct before resending.

> ---

Also, please include a changelog below the --- line describing the
changes between versions. This allows reviewers to easily track what
has been modified.

Regards,
Kuan-Wei

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

Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C48623D2A1
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 18:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769367263; cv=none; b=XOGDBrWJ7myldr370V+P13GtoTeHU3CErBOcnUSXFl4u2U67ywtHaYOTkm34YJByVPMdTrQefg/3x2wM/BHszcUhhml592tp4D9qcr8Hx5ytriogenVSK/RTeQ1T3uvdRIah2Hgu8S33voV/tdCfcQy/OnUJJLg5+8k3+R/oGaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769367263; c=relaxed/simple;
	bh=MNx7CpVPfK4SIp6L5qZvc4IDpYVFgEwS7rEMUXt6xuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIUcBQ/pZq988xnv2Gx2Bg1KNcN7vnxxqAyynCJXoRWpkNog+73rgCWfhss0YmoJcJNeteeEvX4pnRHC7fRSpn1Z5cCoN7miaAFrao1Ydedz+wjK22tKQEBCWouc1Y3TaHAvkldzjdjuDlwUZhb/Ut/B2wvGC4L2BqVLgRhFMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qS9l5kyW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qS9l5kyW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a35ae38bdfso87005ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 10:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769367262; x=1769972062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bJwaR/zGofB89ztFQf0PisW/NqMpT7fZXv1USedVEw8=;
        b=qS9l5kyWJyOguTlDDoSHkXs/uHwTFPunwt4K9gcQYSTxNZANAcQsZaifrlQOtTIl8m
         TjnS+FFi7fpRYTrCZDVQMKdMoTIJy0S26GJg+L3cvpqOedVdtazS2xWNWgpP3hccGAnU
         eTNI80X7z0krS/6ih2gk2mJhtZkyDqBckXfvcZXjjJr6d5LjYQdV8ZGUFCsVrwjP1pXW
         KIWq988JC1qmucGSvnWhykpbu7IkWsWqekpMOxQ3JUP4WUtLwipkzmbn5EoF2Sxd/VJG
         PGbOQILXrRWTEqVlG8h5HHwRaeITTo9GopC3DiJe412R+lYCeXbjIwZm9CayKZRQWJo9
         n4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769367262; x=1769972062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJwaR/zGofB89ztFQf0PisW/NqMpT7fZXv1USedVEw8=;
        b=ct8wP7XLOZKFfW9lv3mCD0Ylu/kL+TW9fJXJ1zrmz+udgjU4CyMZUD4HRzbbv/vOs9
         VbDvizOFdP5Xaj5uIgCiLtgxGQCJyWgMByqbPmZGT8dzksABj0XohlDlNaefRQTxcIJ6
         i7ljOeDXO9bP2c+PB8TzZpptdYA6fmfrSuEDGRHQvjlrW1ghGDiEu/YCBi3I4Pf+rpP5
         8liwCnYtzWpgMsPHCXNRmaG514dEd/TETHvaiLx5IsBkOCGKqxO5sKJYc1tMwqJ5HJiy
         enpnc/9ECTfCce2NMUfZzVxbYMwtNQMNR4/ivsISIsPtd1QFbvcw7PKD5gohJWS5xxp8
         JcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjGETP6auIbd5jMdT494Ii1sREv4pLae5M8QrPcUrUPEf9UG4/3B9m3fk51eIN5zvBmPgi6677WJ0XL6yYhwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJ+NV7+iTMYzQWIkZdHYZbbyXvfUFja9d3Cz0i16BrNsewfbt
	iEpkvG8XOnujYl3b7xZcRXzlU7JxQwB3W3Fu1T1imGh4cBqQr0MYN0rje3OTd3ybfA==
X-Gm-Gg: AZuq6aJpwGePOff4Ixr4yx7bzV5nElHmUeN22aVp97Z/0ipHfprV+cFv5tVgFI/VCSg
	UDUPgzWIeaux/P6L63ZD6O4lgNk4bLhKaF7Cs2jr7YVXoZmFPeXVxB0feUrLtMfFd1apAyQedfE
	YRMc2L86EhDNOGabcPDUviAK6h/74Y0kG/tH8sLU3GplHGFgzEpVGIuHFCjlWARDuKtP2GilU72
	m9geOhWDEETTdCMZ+xQkFnGAg5ESIScbPGNwBb/C57E7W/MRc+XRJw25sVbzxIykuSYsLy287FF
	LrH0Vb3I3RMUgboeKd+UJ2SIF/JQrPpfj7dY7nHFtBnVHnserSTAnx1uJ+Ay1EDA0T7eBKtk0+v
	007nbfYz4xuqat9jhIFTfKuEpsBsJ9xAjzgvHszLXsLzMxh6/Ho+/meN+3GagoYRAZ43xAY3Gwi
	3SG1Y6IpoDYycAPhCWcQe6QPHIgGEWtDPlN2yqx/SQb+yuxwBCKsg=
X-Received: by 2002:a17:902:f788:b0:290:8ecf:e9f9 with SMTP id d9443c01a7336-2a844b04233mr923075ad.7.1769367261004;
        Sun, 25 Jan 2026 10:54:21 -0800 (PST)
Received: from google.com (28.117.125.34.bc.googleusercontent.com. [34.125.117.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644885sm7489927b3a.4.2026.01.25.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 10:54:20 -0800 (PST)
Date: Sun, 25 Jan 2026 18:54:15 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marie Zhussupova <marievic@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Ujwal Jain <ujwaljain@google.com>, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kunit: reduce stack usage in kunit_run_tests()
Message-ID: <aXZm10CCRgdVou90@google.com>
References: <20251204101050.1035801-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204101050.1035801-1-arnd@kernel.org>

On Thu, Dec 04, 2025 at 11:10:46AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Some of the recent changes to the kunit framework caused the stack usage
> for kunit_run_tests() to grow higher than most other kernel functions,
> which triggers a warning when CONFIG_FRAME_WARN is set to a relatively
> low value:
> 
> lib/kunit/test.c: In function 'kunit_run_tests':
> lib/kunit/test.c:801:1: error: the frame size of 1312 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> Split out the inner loop into a separate function to ensure that each
> function remains under the limit, and pass the kunit_result_stats
> structures by reference to avoid excessive copies.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Sending it now as I ran into the build failure while testing 6.18.
> I only build-tested this, so please test it properly before applying.

I just ran this through our CI with no problems.

Tested-by: Carlos Llamas <cmllamas@google.com> 

> ---
>  lib/kunit/test.c | 221 ++++++++++++++++++++++++-----------------------
>  1 file changed, 115 insertions(+), 106 deletions(-)
> 
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 62eb529824c6..c5fce199d880 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -94,7 +94,7 @@ struct kunit_result_stats {
>  	unsigned long total;
>  };
>  
> -static bool kunit_should_print_stats(struct kunit_result_stats stats)
> +static bool kunit_should_print_stats(struct kunit_result_stats *stats)
>  {
>  	if (kunit_stats_enabled == 0)
>  		return false;
> @@ -102,11 +102,11 @@ static bool kunit_should_print_stats(struct kunit_result_stats stats)
>  	if (kunit_stats_enabled == 2)
>  		return true;
>  
> -	return (stats.total > 1);
> +	return (stats->total > 1);
>  }
>  
>  static void kunit_print_test_stats(struct kunit *test,
> -				   struct kunit_result_stats stats)
> +				   struct kunit_result_stats *stats)
>  {
>  	if (!kunit_should_print_stats(stats))
>  		return;
> @@ -115,10 +115,10 @@ static void kunit_print_test_stats(struct kunit *test,
>  		  KUNIT_SUBTEST_INDENT
>  		  "# %s: pass:%lu fail:%lu skip:%lu total:%lu",
>  		  test->name,
> -		  stats.passed,
> -		  stats.failed,
> -		  stats.skipped,
> -		  stats.total);
> +		  stats->passed,
> +		  stats->failed,
> +		  stats->skipped,
> +		  stats->total);
>  }
>  
>  /* Append formatted message to log. */
> @@ -600,26 +600,26 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
>  }
>  
>  static void kunit_print_suite_stats(struct kunit_suite *suite,
> -				    struct kunit_result_stats suite_stats,
> -				    struct kunit_result_stats param_stats)
> +				    struct kunit_result_stats *suite_stats,
> +				    struct kunit_result_stats *param_stats)
>  {
>  	if (kunit_should_print_stats(suite_stats)) {
>  		kunit_log(KERN_INFO, suite,
>  			  "# %s: pass:%lu fail:%lu skip:%lu total:%lu",
>  			  suite->name,
> -			  suite_stats.passed,
> -			  suite_stats.failed,
> -			  suite_stats.skipped,
> -			  suite_stats.total);
> +			  suite_stats->passed,
> +			  suite_stats->failed,
> +			  suite_stats->skipped,
> +			  suite_stats->total);
>  	}
>  
>  	if (kunit_should_print_stats(param_stats)) {
>  		kunit_log(KERN_INFO, suite,
>  			  "# Totals: pass:%lu fail:%lu skip:%lu total:%lu",
> -			  param_stats.passed,
> -			  param_stats.failed,
> -			  param_stats.skipped,
> -			  param_stats.total);
> +			  param_stats->passed,
> +			  param_stats->failed,
> +			  param_stats->skipped,
> +			  param_stats->total);
>  	}
>  }
>  
> @@ -681,13 +681,106 @@ static void kunit_init_parent_param_test(struct kunit_case *test_case, struct ku
>  	}
>  }
>  
> -int kunit_run_tests(struct kunit_suite *suite)
> +static int kunit_run_one_test(struct kunit_suite *suite, struct kunit_case *test_case,
> +			      struct kunit_result_stats *suite_stats,
> +			      struct kunit_result_stats *total_stats)
>  {
> +	struct kunit test = { .param_value = NULL, .param_index = 0 };
> +	struct kunit_result_stats param_stats = { 0 };
>  	char param_desc[KUNIT_PARAM_DESC_SIZE];
> +	const void *curr_param;
> +
> +	kunit_init_test(&test, test_case->name, test_case->log);
> +	if (test_case->status == KUNIT_SKIPPED) {
> +		/* Test marked as skip */
> +		test.status = KUNIT_SKIPPED;
> +		kunit_update_stats(&param_stats, test.status);
> +	} else if (!test_case->generate_params) {
> +		/* Non-parameterised test. */
> +		test_case->status = KUNIT_SKIPPED;
> +		kunit_run_case_catch_errors(suite, test_case, &test);
> +		kunit_update_stats(&param_stats, test.status);
> +	} else {
> +		kunit_init_parent_param_test(test_case, &test);
> +		if (test_case->status == KUNIT_FAILURE) {
> +			kunit_update_stats(&param_stats, test.status);
> +			goto test_case_end;
> +		}
> +		/* Get initial param. */
> +		param_desc[0] = '\0';
> +		/* TODO: Make generate_params try-catch */
> +		curr_param = test_case->generate_params(&test, NULL, param_desc);
> +		test_case->status = KUNIT_SKIPPED;
> +		kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> +			  "KTAP version 1\n");
> +		kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> +			  "# Subtest: %s", test_case->name);
> +		if (test.params_array.params &&
> +		    test_case->generate_params == kunit_array_gen_params) {
> +			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT
> +				  KUNIT_SUBTEST_INDENT "1..%zd\n",
> +				  test.params_array.num_params);
> +		}
> +
> +		while (curr_param) {
> +			struct kunit param_test = {
> +				.param_value = curr_param,
> +				.param_index = ++test.param_index,
> +				.parent = &test,
> +			};
> +			kunit_init_test(&param_test, test_case->name, NULL);
> +			param_test.log = test_case->log;
> +			kunit_run_case_catch_errors(suite, test_case, &param_test);
> +
> +			if (param_desc[0] == '\0') {
> +				snprintf(param_desc, sizeof(param_desc),
> +					 "param-%d", param_test.param_index);
> +			}
> +
> +			kunit_print_ok_not_ok(&param_test, KUNIT_LEVEL_CASE_PARAM,
> +					      param_test.status,
> +					      param_test.param_index,
> +					      param_desc,
> +					      param_test.status_comment);
> +
> +			kunit_update_stats(&param_stats, param_test.status);
> +
> +			/* Get next param. */
> +			param_desc[0] = '\0';
> +			curr_param = test_case->generate_params(&test, curr_param,
> +								param_desc);
> +		}
> +		/*
> +		 * TODO: Put into a try catch. Since we don't need suite->exit
> +		 * for it we can't reuse kunit_try_run_cleanup for this yet.
> +		 */
> +		if (test_case->param_exit)
> +			test_case->param_exit(&test);
> +		/* TODO: Put this kunit_cleanup into a try-catch. */
> +		kunit_cleanup(&test);
> +	}
> +test_case_end:
> +	kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CASE);
> +
> +	kunit_print_test_stats(&test, &param_stats);
> +
> +	kunit_print_ok_not_ok(&test, KUNIT_LEVEL_CASE, test_case->status,
> +			      kunit_test_case_num(suite, test_case),
> +			      test_case->name,
> +			      test.status_comment);
> +
> +	kunit_update_stats(suite_stats, test_case->status);
> +	kunit_accumulate_stats(total_stats, param_stats);
> +
> +	return 0;

nit: the return value is always zero and it's not being used either, so
maybe switch to void?

> +}
> +
> +
> +int kunit_run_tests(struct kunit_suite *suite)
> +{
>  	struct kunit_case *test_case;
>  	struct kunit_result_stats suite_stats = { 0 };
>  	struct kunit_result_stats total_stats = { 0 };
> -	const void *curr_param;
>  
>  	/* Taint the kernel so we know we've run tests. */
>  	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
> @@ -703,97 +796,13 @@ int kunit_run_tests(struct kunit_suite *suite)
>  
>  	kunit_print_suite_start(suite);
>  
> -	kunit_suite_for_each_test_case(suite, test_case) {
> -		struct kunit test = { .param_value = NULL, .param_index = 0 };
> -		struct kunit_result_stats param_stats = { 0 };
> -
> -		kunit_init_test(&test, test_case->name, test_case->log);
> -		if (test_case->status == KUNIT_SKIPPED) {
> -			/* Test marked as skip */
> -			test.status = KUNIT_SKIPPED;
> -			kunit_update_stats(&param_stats, test.status);
> -		} else if (!test_case->generate_params) {
> -			/* Non-parameterised test. */
> -			test_case->status = KUNIT_SKIPPED;
> -			kunit_run_case_catch_errors(suite, test_case, &test);
> -			kunit_update_stats(&param_stats, test.status);
> -		} else {
> -			kunit_init_parent_param_test(test_case, &test);
> -			if (test_case->status == KUNIT_FAILURE) {
> -				kunit_update_stats(&param_stats, test.status);
> -				goto test_case_end;
> -			}
> -			/* Get initial param. */
> -			param_desc[0] = '\0';
> -			/* TODO: Make generate_params try-catch */
> -			curr_param = test_case->generate_params(&test, NULL, param_desc);
> -			test_case->status = KUNIT_SKIPPED;
> -			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> -				  "KTAP version 1\n");
> -			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> -				  "# Subtest: %s", test_case->name);
> -			if (test.params_array.params &&
> -			    test_case->generate_params == kunit_array_gen_params) {
> -				kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT
> -					  KUNIT_SUBTEST_INDENT "1..%zd\n",
> -					  test.params_array.num_params);
> -			}
> -
> -			while (curr_param) {
> -				struct kunit param_test = {
> -					.param_value = curr_param,
> -					.param_index = ++test.param_index,
> -					.parent = &test,
> -				};
> -				kunit_init_test(&param_test, test_case->name, NULL);
> -				param_test.log = test_case->log;
> -				kunit_run_case_catch_errors(suite, test_case, &param_test);
> -
> -				if (param_desc[0] == '\0') {
> -					snprintf(param_desc, sizeof(param_desc),
> -						 "param-%d", param_test.param_index);
> -				}
> -
> -				kunit_print_ok_not_ok(&param_test, KUNIT_LEVEL_CASE_PARAM,
> -						      param_test.status,
> -						      param_test.param_index,
> -						      param_desc,
> -						      param_test.status_comment);
> -
> -				kunit_update_stats(&param_stats, param_test.status);
> -
> -				/* Get next param. */
> -				param_desc[0] = '\0';
> -				curr_param = test_case->generate_params(&test, curr_param,
> -									param_desc);
> -			}
> -			/*
> -			 * TODO: Put into a try catch. Since we don't need suite->exit
> -			 * for it we can't reuse kunit_try_run_cleanup for this yet.
> -			 */
> -			if (test_case->param_exit)
> -				test_case->param_exit(&test);
> -			/* TODO: Put this kunit_cleanup into a try-catch. */
> -			kunit_cleanup(&test);
> -		}
> -test_case_end:
> -		kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CASE);
> -
> -		kunit_print_test_stats(&test, param_stats);
> -
> -		kunit_print_ok_not_ok(&test, KUNIT_LEVEL_CASE, test_case->status,
> -				      kunit_test_case_num(suite, test_case),
> -				      test_case->name,
> -				      test.status_comment);
> -
> -		kunit_update_stats(&suite_stats, test_case->status);
> -		kunit_accumulate_stats(&total_stats, param_stats);
> -	}
> +	kunit_suite_for_each_test_case(suite, test_case)
> +		kunit_run_one_test(suite, test_case, &suite_stats, &total_stats);
>  
>  	if (suite->suite_exit)
>  		suite->suite_exit(suite);
>  
> -	kunit_print_suite_stats(suite, suite_stats, total_stats);
> +	kunit_print_suite_stats(suite, &suite_stats, &total_stats);
>  suite_end:
>  	kunit_print_suite_end(suite);
>  
> -- 

I don't see any logical changes, everything seems to have been extracted
cleanly into kunit_run_one_test(). So this LGTM, just a minor nit.

--
Carlos LLamas

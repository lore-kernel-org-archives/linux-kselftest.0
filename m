Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F077F31813A;
	Sat, 20 Jun 2026 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953692; cv=none; b=VP1PywaGhJp16VDl5TFPutwq5gJ3kwJUwXJlnW7jbwbHTZR+d31YeAid0ByOu67Jf0Zg/oGt/5ZrASlwighejZH9EJdBIvwyt96C/Qy4MjZv0zbQMEsYx7uuQp7JpW9F5LEe2QOuoibV/3QHFnqU0EUyNvD6H5xMjAr/W6lJv78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953692; c=relaxed/simple;
	bh=5Nm/nuCLzehv6MLNpKDPm2fg+1E8/skgbR+8FvD+BY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxTVdcvYqGG9v7USyOgfkUji0FMx20pCzDvuTTCycFWljW4WxGszhfoVDZA1iruLoyqptGcRlVRBjTdgjPlTDFryVKQZPyp41I5GBXOKJPrG/LLiaXTaCzVeHjQ+528c6l0swi4hoQEh0aZ9imsLAk1snBVY+iZLE7QOfDJTh0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id A859B1EA33C; Sat, 20 Jun 2026 19:08:08 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::9c4] (unknown [IPv6:2001:8003:8810:ea00::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 749C01EA334;
	Sat, 20 Jun 2026 19:08:07 +0800 (AWST)
Message-ID: <194406f7-0aaa-4740-bfe4-34567d2c0688@davidgow.net>
Date: Sat, 20 Jun 2026 19:08:05 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] kunit: Add ability to skip entire test suites
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
References: <20260617121535.462459-1-vaibhav@linux.ibm.com>
 <20260617121535.462459-2-vaibhav@linux.ibm.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260617121535.462459-2-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 17/06/2026 à 8:15 PM, Vaibhav Jain a écrit :
> Currently, KUnit provides mechanisms to skip individual test cases, but
> there is no way to skip an entire test suite based on runtime conditions
> checked during suite initialization. This limitation forces test suites
> to either fail or skip tests individually when certain prerequisites are
> not available.
> 
> To address this limitation, the patch adds a 'status' field to struct
> kunit_suite that allows suite_init callbacks to mark the entire suite as
> KUNIT_SKIPPED. When a suite is marked as skipped, all test cases within
> that suite are bypassed without execution.
> 
> The patch proposed changes to kunit_suite_has_succeeded() to Check suite
> status before evaluating individual test case results. Also
> kunit_run_tests() is updated to skip suite execution if kunit_suite's
> 'status' is KUNIT_SKIPPED, thats either set before suite_init or by the
> suite_init callback itself. kunit_init_suite() is updated to initialize the
> 'status' of kunit_suite to KUNIT_SUCCESS so that any skipped suite's can be
> restarted from debugfs.
> 
> This enables test suites to perform runtime capability checks in their
> 'suite_init' callback and gracefully skip all tests when prerequisites are
> not met, rather than reporting failures or requiring each test case to
> perform redundant checks. In case a kunit-suite is skipped it can be re-run
> from the kunit's debugfs interface.
> 
> Also update debugfs_print_results() to clearly log the kunit-suite as
> 'SKIP'. kunit_suite_has_succeeded() is also updated on which
> debugfs_print_results() depends to update 'kunit_suite.status' in case any
> of the kunit_case has failed.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> 
> ---

Thanks for sending this out.

My preference would be to merge the rust fix into this patch, so that
there isn't a period where rust builds fail, which could make bisection
unpleasant.

Otherwise, this is looking good.


Reviewed-by: David Gow <david

> Changelog
> =========
> 
> V2->V3:
> Link:
> https://lore.kernel.org/all/20260608090438.219497-2-vaibhav@linux.ibm.com
> 
> None
> 
> V1->V2:
> Link:
> https://lore.kernel.org/all/20260604162805.556135-2-vaibhav@linux.ibm.com/
> 
> * Fix malformed and missing test-log when skipping kunit-suite. [David Gow]
> * Update kunit_init_suite() to reset the kunit-suite so that it can be
> re-run [David Gow]
> * Update kunit_suite_has_succeeded() to check for any failed test-case and
> update the 'status' for kunit-suite.
> ---
>  include/kunit/test.h |  1 +
>  lib/kunit/debugfs.c  | 30 +++++++++++++++++++++---------
>  lib/kunit/test.c     | 17 ++++++++++++++++-
>  3 files changed, 38 insertions(+), 10 deletions(-)
> 
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index ce0573e196ce..395221d623f7 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -285,6 +285,7 @@ struct kunit_suite {
>  	struct string_stream *log;
>  	int suite_init_err;
>  	bool is_init;
> +	enum kunit_status status;
>  };
>  
>  /* Stores an array of suites, end points one past the end */
> diff --git a/lib/kunit/debugfs.c b/lib/kunit/debugfs.c
> index 9c326f1837bd..442b2ceb955b 100644
> --- a/lib/kunit/debugfs.c
> +++ b/lib/kunit/debugfs.c
> @@ -76,18 +76,30 @@ static int debugfs_print_results(struct seq_file *seq, void *v)
>  	seq_puts(seq, "KTAP version 1\n");
>  	seq_puts(seq, "1..1\n");
>  
> -	/* Print suite header because it is not stored in the test logs. */
> -	seq_puts(seq, KUNIT_SUBTEST_INDENT "KTAP version 1\n");
> -	seq_printf(seq, KUNIT_SUBTEST_INDENT "# Subtest: %s\n", suite->name);
> -	seq_printf(seq, KUNIT_SUBTEST_INDENT "1..%zd\n", kunit_suite_num_test_cases(suite));
> -
> -	kunit_suite_for_each_test_case(suite, test_case)
> -		debugfs_print_result(seq, test_case->log);
> +	if (suite->status != KUNIT_SKIPPED) {
> +		/* Print suite header because it is not stored in the test logs. */
> +		seq_puts(seq,
> +			 KUNIT_SUBTEST_INDENT "KTAP version 1\n");
> +		seq_printf(seq,
> +			   KUNIT_SUBTEST_INDENT "# Subtest: %s\n",
> +			   suite->name);
> +		seq_printf(seq,
> +			   KUNIT_SUBTEST_INDENT "1..%zd\n",
> +			   kunit_suite_num_test_cases(suite));
> +
> +		kunit_suite_for_each_test_case(suite, test_case)
> +			debugfs_print_result(seq, test_case->log);
> +	}
>  
>  	debugfs_print_result(seq, suite->log);
>  
> -	seq_printf(seq, "%s %d %s\n",
> -		   kunit_status_to_ok_not_ok(success), 1, suite->name);
> +	if (suite->status != KUNIT_SKIPPED)
> +		seq_printf(seq, "%s %d %s\n",
> +			   kunit_status_to_ok_not_ok(success), 1, suite->name);
> +	else
> +		seq_printf(seq, "%s %d %s # SKIP %s\n",
> +			   kunit_status_to_ok_not_ok(success), 1, suite->name,
> +			   suite->status_comment);
>  	return 0;
>  }
>  
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 99773e000e1b..09e3dabfac0c 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -214,12 +214,18 @@ enum kunit_status kunit_suite_has_succeeded(struct kunit_suite *suite)
>  	const struct kunit_case *test_case;
>  	enum kunit_status status = KUNIT_SKIPPED;
>  
> +	if (suite->status == KUNIT_SKIPPED)
> +		return KUNIT_SKIPPED;
> +
>  	if (suite->suite_init_err)
>  		return KUNIT_FAILURE;
>  
>  	kunit_suite_for_each_test_case(suite, test_case) {
> -		if (test_case->status == KUNIT_FAILURE)
> +		if (test_case->status == KUNIT_FAILURE) {
> +			/* Update the kunit_suite status also */
> +			suite->status = KUNIT_FAILURE;
>  			return KUNIT_FAILURE;
> +		}
>  		else if (test_case->status == KUNIT_SUCCESS)
>  			status = KUNIT_SUCCESS;
>  	}
> @@ -795,12 +801,20 @@ int kunit_run_tests(struct kunit_suite *suite)
>  	/* Taint the kernel so we know we've run tests. */
>  	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
>  
> +	if (suite->status == KUNIT_SKIPPED)
> +		goto suite_end;
> +
>  	if (suite->suite_init) {
>  		suite->suite_init_err = suite->suite_init(suite);
>  		if (suite->suite_init_err) {
> +			suite->status = KUNIT_FAILURE;
>  			kunit_err(suite, KUNIT_SUBTEST_INDENT
>  				  "# failed to initialize (%d)", suite->suite_init_err);
>  			goto suite_end;
> +
> +		} else if (suite->status == KUNIT_SKIPPED) {
> +			/* Skip this kunit suite */
> +			goto suite_end;
>  		}
>  	}
>  
> @@ -825,6 +839,7 @@ static void kunit_init_suite(struct kunit_suite *suite)
>  	kunit_debugfs_create_suite(suite);
>  	suite->status_comment[0] = '\0';
>  	suite->suite_init_err = 0;
> +	suite->status = KUNIT_SUCCESS;
>  
>  	if (suite->log)
>  		string_stream_clear(suite->log);


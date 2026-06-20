Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7555B364E9E;
	Sat, 20 Jun 2026 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953720; cv=none; b=qVbcYNXy/7CIDR3bkdQR2vztJbEpQFV/t6q7zGP40tLVLVgprubkhh9HV7yU1ohadKL9fCuIPmmsgx+Ldb7yMe61LPO+L9E3+Lwe0IjfitOySIBeh2mQeV/bq7mWRU5PhV75hJdJ3Mc0vhSbJGa/stfBN5YWMqj+uDyaUbnDEbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953720; c=relaxed/simple;
	bh=+1vJhbi/C4sCLvgM534Y33japY7HojDMq/sR6v6MIY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uns9fN+sQXk3NdnBBM9u7p+kkSJsXwkos61rpI+GL4aHnxyRs4Uxt1QykupBqwq51TpdF59r/ft+eeBD29ggbW1hR7pgw2GSkOspHgBr6LrQ/qUGnJmwYl7YhN/kkCm8RPkVbTpK2WDm3xYKQTn0nWuByXobEb4n0bxjrMBnLsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 8E6A21EA343; Sat, 20 Jun 2026 19:08:37 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::9c4] (unknown [IPv6:2001:8003:8810:ea00::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id EBC441EA33A;
	Sat, 20 Jun 2026 19:08:35 +0800 (AWST)
Message-ID: <94e796b8-aba6-426d-bb84-92259300fe66@davidgow.net>
Date: Sat, 20 Jun 2026 19:08:33 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] kunit: Add example of test suite that can be
 skipped at runtime
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
References: <20260617121535.462459-1-vaibhav@linux.ibm.com>
 <20260617121535.462459-4-vaibhav@linux.ibm.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260617121535.462459-4-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 17/06/2026 à 8:15 PM, Vaibhav Jain a écrit :
> Add an example test suite name 'example_test_skip_suite' to
> 'kunit-example-test.c' that shows how to skip an entire test suite based on
> runtime conditions.
> 
> The example suite 'example_skip_suite' provides a 'suite_init' callback
> named example_skip_suite_init() which marks the entire suite as skipped
> using kunit_mark_skipped().
> 
> This demonstrates a way for conditionally skipping test suites when any
> prerequisites for kunit_suite execution are not met. The 'suite_init'
> callback can perform any necessary checks and mark the suite as skipped,
> preventing all test cases from executing while also indicating why the
> suite was skipped.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---

Reviewed-by: David Gow <david@davidgow.net>



> Changelog
> =========
> V2->V3:
> Link:
> https://lore.kernel.org/all/20260608090438.219497-3-vaibhav@linux.ibm.com
> * Updated patch index in the series
> 
> V1->V2:
> Link:
> https://lore.kernel.org/all/20260604162805.556135-3-vaibhav@linux.ibm.com/
> * Added RB from 'David Gow'
> ---
>  lib/kunit/kunit-example-test.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-test.c
> index 0bae7b7ca0b0..b8ded54fa46d 100644
> --- a/lib/kunit/kunit-example-test.c
> +++ b/lib/kunit/kunit-example-test.c
> @@ -591,5 +591,34 @@ static struct kunit_suite example_init_test_suite = {
>   */
>  kunit_test_init_section_suites(&example_init_test_suite);
>  
> +/*
> + * This test should always be skipped.
> + */
> +static void example_skip_suite_test(struct kunit *test)
> +{
> +	/* This line should never be seen */
> +	KUNIT_FAIL(test, "You should not see a this.");
> +}
> +
> +static struct kunit_case  example_skip_suite_test_cases[] = {
> +	KUNIT_CASE(example_skip_suite_test),
> +	{}
> +};
> +
> +static int example_skip_suite_init(struct kunit_suite *suite)
> +{
> +	kunit_mark_skipped(suite, "Test suite expected to be skipped");
> +	return 0;
> +}
> +
> +static struct kunit_suite example_test_skip_suite = {
> +	.name = "example_skip_suite",
> +	.suite_init = example_skip_suite_init,
> +	.test_cases = example_skip_suite_test_cases,
> +};
> +
> +/* This registers a test suite that will be skipped */
> +kunit_test_suite(example_test_skip_suite);
> +
>  MODULE_DESCRIPTION("Example KUnit test suite");
>  MODULE_LICENSE("GPL v2");


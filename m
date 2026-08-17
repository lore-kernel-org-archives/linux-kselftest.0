Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A65B3FA5CC;
	Mon, 17 Aug 2026 16:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786985086; cv=none; b=NXlwj452jrOtbxD8i+r8uU46y+tx6b8niEQgEIx0nwiX6VPdZ8JqOFxoEBAqSEyqsUwql0ijNvytcZ/d6+zVVepEyx5Q9ZXoJBkJgnJEgIFueV2XROhxUqdVw5giKMAvZfvW2ggLinhPIwuF4AMe1LSxBcc0DlIyOELpIIcTg1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786985086; c=relaxed/simple;
	bh=K++/3hBmvqfBNmBwi8rFxNO/SVpPqAMQZaZVzhe8MUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tc3pqEAp82PJfH1QrRaS9zLHt+TFs6xru/XtNIGsvPa1ZVpBzVbvh8pk90muNSUjmaABr8hvaIrxr2EltnOyk/Sd8LngB9XEqYVVQRmrgnMnNxmr29I6Mqc4s5emG6JYiEalNP3swtANlJSVzZ6odCNxU9jVlDEqXvpF/0dS14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYnqBcKI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYnqBcKI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE5D1F000E9;
	Mon, 17 Aug 2026 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786985085;
	bh=yDuzR5cxKZS/BaI1hA0RgLkwfQvh6EYcntgsppszUIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BYnqBcKIJLFZCXPWKVyHxamKQzGsB5l3qDD03SM/KGsbGpnbqPimRAPgGALZqRaBE
	 M4fOlWgCN8kqMX8Ae+tOYNP55ixHIwCigtO56NLNiVfAxhDBPSO29mBxBZz1cqXE39
	 60lQeq27eNIQczOHaekHwqdr/iPz9K4a6a6HJGhwEOAtjQ2/L7mbhUI6lFszyopUez
	 Oa4RAFjAq3Q0Wh4JyxHTLM+4w33H0trzrfDyyLtjSA1qAKkp3ElbB5V1hi93LL4JUq
	 yrCdZF0gaRI2dJzAhpFM72IYi7KaLAzsLenfwyjFciqckkhkl1X794faU1yUFr9Pl1
	 b25+hC+bLSN/A==
Date: Mon, 17 Aug 2026 17:44:26 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: akpm@linux-foundation.org, rppt@kernel.org, sarthak.sharma@arm.com, 
	linux-mm@kvack.org, shuah@kernel.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com, peterx@redhat.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] selftests/mm: emit TAP header and use TAP skip in
 mremap_test
Message-ID: <aoM6YivoBU8JXnSO@lucifer>
References: <20260815080716.3596514-1-husong@kylinos.cn>
 <20260815080716.3596514-3-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815080716.3596514-3-husong@kylinos.cn>

On Sat, Aug 15, 2026 at 04:07:15PM +0800, Song Hu wrote:
> mremap_test calls ksft_set_plan() without ksft_print_header(), and its
> get_mmap_min_addr() skip path uses a bare exit(KSFT_SKIP) that prints no
> TAP line, so its output is not valid KTAP.  Add the header and switch
> the skip to ksft_exit_skip().
>
> Also fix two more KTAP compliance issues spotted in review:
>
> - get_mmap_min_addr() calls strerror(errno) after fclose(), which may
>   clobber errno; save errno before fclose() instead.
>
> - Some ksft_*() messages embed "\n\t", so the text after each embedded
>   newline is printed without the "# " prefix.  Split those into separate
>   messages.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Signed-off-by: Song Hu <husong@kylinos.cn>

All LGTM so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/mremap_test.c | 41 +++++++++++++-----------
>  1 file changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
> index 131d9d6db867..28f151daabe4 100644
> --- a/tools/testing/selftests/mm/mremap_test.c
> +++ b/tools/testing/selftests/mm/mremap_test.c
> @@ -111,18 +111,17 @@ static unsigned long long get_mmap_min_addr(void)
>  		return addr;
>
>  	fp = fopen("/proc/sys/vm/mmap_min_addr", "r");
> -	if (fp == NULL) {
> -		ksft_print_msg("Failed to open /proc/sys/vm/mmap_min_addr: %s\n",
> -			strerror(errno));
> -		exit(KSFT_SKIP);
> -	}
> +	if (!fp)
> +		ksft_exit_skip("Failed to open /proc/sys/vm/mmap_min_addr: %s\n",
> +			       strerror(errno));
>
>  	n_matched = fscanf(fp, "%llu", &addr);
>  	if (n_matched != 1) {
> -		ksft_print_msg("Failed to read /proc/sys/vm/mmap_min_addr: %s\n",
> -			strerror(errno));
> +		int err = errno;
> +
>  		fclose(fp);
> -		exit(KSFT_SKIP);
> +		ksft_exit_skip("Failed to read /proc/sys/vm/mmap_min_addr: %s\n",
> +			       strerror(err));
>  	}
>
>  	fclose(fp);
> @@ -1164,10 +1163,11 @@ static void run_mremap_test_case(struct test test_case, int *failures,
>  					    rand_addr);
>
>  	if (remap_time < 0) {
> -		if (test_case.expect_failure)
> -			ksft_test_result_xfail("%s\n\tExpected mremap failure\n",
> -					      test_case.name);
> -		else {
> +		if (test_case.expect_failure) {
> +			ksft_print_msg("%s: expected mremap failure\n",
> +				       test_case.name);
> +			ksft_test_result_xfail("%s\n", test_case.name);
> +		} else {
>  			ksft_test_result_fail("%s\n", test_case.name);
>  			*failures += 1;
>  		}
> @@ -1177,11 +1177,13 @@ static void run_mremap_test_case(struct test test_case, int *failures,
>  		 * was faulted in.
>  		 */
>  		if (threshold_mb == VALIDATION_NO_THRESHOLD ||
> -		    test_case.config.region_size <= threshold_mb * _1MB)
> -			ksft_test_result_pass("%s\n\tmremap time: %12lldns\n",
> -					      test_case.name, remap_time);
> -		else
> +		    test_case.config.region_size <= threshold_mb * _1MB) {
> +			ksft_print_msg("%s: mremap time: %12lldns\n",
> +				       test_case.name, remap_time);
>  			ksft_test_result_pass("%s\n", test_case.name);
> +		} else {
> +			ksft_test_result_pass("%s\n", test_case.name);
> +		}
>  	}
>  }
>
> @@ -1250,13 +1252,16 @@ int main(int argc, char **argv)
>  	time_t t;
>  	FILE *maps_fp;
>
> +	ksft_print_header();
> +
>  	pattern_seed = (unsigned int) time(&t);
>
>  	if (parse_args(argc, argv, &threshold_mb, &pattern_seed) < 0)
>  		exit(EXIT_FAILURE);
>
> -	ksft_print_msg("Test configs:\n\tthreshold_mb=%u\n\tpattern_seed=%u\n\n",
> -		       threshold_mb, pattern_seed);
> +	ksft_print_msg("Test configs:\n");
> +	ksft_print_msg("threshold_mb=%u\n", threshold_mb);
> +	ksft_print_msg("pattern_seed=%u\n", pattern_seed);
>
>  	/*
>  	 * set preallocated random array according to test configs; see the
> --
> 2.43.0
>

--
Cheers, Lorenzo

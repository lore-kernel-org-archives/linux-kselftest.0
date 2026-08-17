Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FBC28BAB9;
	Mon, 17 Aug 2026 15:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981469; cv=none; b=m2DDwHtND+RxaSfIcpLf0WTksk7xhQYhrZCLEbjEjIEXS/SC4sd1egUtMbF28+/vmGOpdet55yeDYznOoM874ioNckDY399NbFSh+GB3QL+Y/WVMHx2OEMD77lX1QWCIcRKwfUkX3akEQp+maL+4n8GZrlCWfXuUyBhsuIXgb9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981469; c=relaxed/simple;
	bh=nfSNkX0Mke+jbuYO+dDTnHSDSi8qw+1krN9Fi8gRdtA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fkf8hzwMn+MQnkipD/BNmzG2tdzgQ6zdnmahUnRBH05Bj/OKEdxW+g5zRUf1V2OYEuN8gQJc7s9ofPRXfuWgi0F55xyutP7F+aAuFo+1rlWO5uMT2LCrRZ2CA2l4RflZDf6Tzmlt7GJgz/mZDtK9PNqkMYd8JwO6rp48lzUK9tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lJ/lMFsB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lJ/lMFsB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6DF0143D;
	Mon, 17 Aug 2026 08:44:22 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2B6C3F673;
	Mon, 17 Aug 2026 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786981466; bh=nfSNkX0Mke+jbuYO+dDTnHSDSi8qw+1krN9Fi8gRdtA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=lJ/lMFsB1WLR5L52UGl94SU8+gVOnFH1mkky4gU5i0LkxwzmKaNj82r4985zJsXu3
	 kZEgFfPcyQdegobmISFB0pAbSR/DyWhq5h5faGhr65fR6QAeXwk6yLxewOYN++IwvB
	 B0YNCsJFyrV9UIJ0122mLWxtAzs6xZdmjGNpH9To=
Message-ID: <7eb13c5f-127d-4abe-bcde-b4d5066510e2@arm.com>
Date: Mon, 17 Aug 2026 16:44:23 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-mm@kvack.org, shuah@kernel.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 surenb@google.com, mhocko@suse.com, peterx@redhat.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] selftests/mm: emit TAP header and use TAP skip in
 mremap_test
To: Song Hu <husong@kylinos.cn>, akpm@linux-foundation.org, rppt@kernel.org,
 sarthak.sharma@arm.com
References: <20260815080716.3596514-1-husong@kylinos.cn>
 <20260815080716.3596514-3-husong@kylinos.cn>
From: Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260815080716.3596514-3-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2026 9:07 am, Song Hu wrote:
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

The skip conditions are usually at the start of the test before we set
the total number planned tests. If skip like this happens later, it
still counts as failure. I found the following corresponding output
with this patch:

TAP version 13
# Test configs:
# threshold_mb=4
# pattern_seed=1786980558
1..26
ok 1 # SKIP Failed to read /proc/sys/vm/mmap_min_addr: Success
# 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Planned tests != run tests (26 != 1)
# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0
MREMAP_FORCED_SKIP_RC=4
### MREMAP FORCED READ-SKIP END

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

Thanks,
Usama


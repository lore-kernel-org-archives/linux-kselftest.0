Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A5425228C;
	Mon, 20 Jul 2026 14:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556896; cv=none; b=nk8s3jDp9dPXoT/c8z1hydRC5MLkR/i707AZd7zkh4HacxyvwpGXstGu4M2NLhUpBflpjMtOsd/ABMe8058OtdBRHI1Q5Ox+nT5B1LPsJOxYRuVcFhEYMyJsUMENDP6Aw6fXdoWl0uNdpqjPVsCFC39rwZKW8TNiMI8e8UNVKJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556896; c=relaxed/simple;
	bh=2/MF0FYQmhN2vivS047rhNMDL6DfoLf/y1iUpILXsBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pg9OPR1wZ9EwcTLnelCQMRHBr/+eJJxrlysCZ3k4QJlQsoeKtFM3jwoAIP4rxJriQBc/BFY/rcOY2pAddWR6OUsU9HnP6VR45s1z5cdeCpM8QHdKo7t4G0iPY153Bx9fVP9nI289GjRkua6Um2eqsonA/FPNQn9vugqxNgbcFJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npYCaf6/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npYCaf6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099971F000E9;
	Mon, 20 Jul 2026 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556895;
	bh=rTlnxQa99V2S816/+ueMDwavNPzZk+ohprrnapQmdrs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=npYCaf6/0721SX3u+kfSwWCiL35NbpKAGa1Pilah2uIHEtVUEXC1w7xKooLRZhTaC
	 1aVSJHeFd4aiMbwPh+nqqeKWBx0e3/0acXfTISsYpBp6AweED6V4veTlRORfa6JtRu
	 YE+CGvikaIH8Ljl2mpb0FsaHgRWc4uFkFj+Cqsp3D2LMV8ne0tn2evrczog/zaAoXU
	 rG8sDvtQ+WK6SkdndJcw3/yDavZd26SFyJC5o0+zby1VZeQkTPmrBxT/XqpFHHMD56
	 RGx3mKjB3h+G3gOctt7f0Nvqfa7lHQVsh2yD2l0lbmf8ygZdXqlZ2ovYeaVSf3ln98
	 v9KBkoLnF4YqA==
From: Thomas Gleixner <tglx@kernel.org>
To: Wake Liu <wakel@google.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Wake Liu
 <wakel@google.com>
Subject: Re: [PATCH] selftests: timers: Use CPU time for CPU timers in
 posix_timers test
In-Reply-To: <20260708121544.583552-1-wakel@google.com>
References: <20260708121544.583552-1-wakel@google.com>
Date: Mon, 20 Jul 2026 16:14:52 +0200
Message-ID: <87fr1dn3xf.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 08 2026 at 12:15, Wake Liu wrote:
> The posix_timers test compares the elapsed real time (GTOD) with the
> expected timer delay to verify if the timer expired. This works fine for
> real-time timers (ITIMER_REAL), but is flaky for CPU-time timers
> (ITIMER_PROF, ITIMER_VIRTUAL, and CLOCK_*_CPUTIME_ID) on loaded systems
> (like shared test runners) because the test process might be scheduled
> out, resulting in elapsed real time being larger than the consumed CPU
> time.
>
> Fix this by using the appropriate measurement method for each timer:
> - Use CPU process/thread time (via clock_gettime or getrusage) for CPU
>   timers.
> - Keep using monotonic clock (real time) for real-time timers.
>
> This makes the test robust against scheduling delays.

Lacks Signed-off-by ....

> +#include <sys/resource.h>
> +
> +static long long get_clock_time_us(clockid_t clock_id)
> +{
> +	struct timespec ts;

Newline between declaration and code.

> +	if (clock_gettime(clock_id, &ts) < 0)
> +		return -1;
> +	return (long long)ts.tv_sec * USECS_PER_SEC + ts.tv_nsec / 1000;
> +}
> +
> +static long long get_itimer_time_us(int which)
> +{
> +	struct rusage usage;
> +
> +	switch (which) {
> +	case ITIMER_REAL:
> +		return get_clock_time_us(CLOCK_MONOTONIC);
> +	case ITIMER_PROF:
> +		return get_clock_time_us(CLOCK_PROCESS_CPUTIME_ID);
> +	case ITIMER_VIRTUAL:
> +		if (getrusage(RUSAGE_SELF, &usage) < 0)
> +			return -1;
> +		return (long long)usage.ru_utime.tv_sec * USECS_PER_SEC + usage.ru_utime.tv_usec;
> +	default:
> +		return -1;
> +	}
> +}
> +
> +static int check_diff_us(long long start, long long end)
>  {
>  	long long diff;
>  
> -	diff = end.tv_usec - start.tv_usec;
> -	diff += (end.tv_sec - start.tv_sec) * USECS_PER_SEC;
> +	diff = end - start;

Move that to the declaration line.

>  	if (llabs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
>  		printf("Diff too high: %lld..", diff);
> @@ -100,7 +123,7 @@ static int check_diff(struct timeval start, struct timeval end)
>  
> -	if (gettimeofday(&end, NULL) < 0)
> -		fatal_error(name, "gettimeofday()");
> +	end = get_clock_time_us(which);
> +	if (end < 0)
> +		fatal_error(name, "get_clock_time_us()");
>  
> -	ksft_test_result(check_diff(start, end) == 0,
> +	ksft_test_result(check_diff_us(start, end) == 0,
>  			 "timer_create() per %s\n", name);

Please get rid of the line break.


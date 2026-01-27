Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BDE299923;
	Tue, 27 Jan 2026 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769546857; cv=none; b=ac2UJXTDSXw2GXQnsF/9WyO4aQ8kvNyIaRUvrJGpHcCTt5RJMaLPSaekE3zgLjUdui8qhWqrrNhZ1FgA4I/G2ejls9FpVMVvrTKUA0ysoGUNhlQeRC9PCwSFYPOSkHRJYeSZua9WWz9hRggrpPaXt4XcZjxQ1nmRNE1AwLkMsqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769546857; c=relaxed/simple;
	bh=JnWYRZnMblnchTfh7t8o/pUUlUKNyAr6tfFBHl5V7pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cwno1aJDFMBVLykuqWkV00qjJwdFVegAg+z/hVwttCgUQG1q2Mbd4S4qsnCyRcFK9fMQAVM1rdkHXkSz4xSg8wGfqwoJaec02GL4sOLFqSz+s9e2Nvim9sOMr6EYT6C4d5OWXKdJqUE7qQVjyHbu2qSW9kM5C+HV0HtqGO48MHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C4351515;
	Tue, 27 Jan 2026 12:47:28 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B9943F5CA;
	Tue, 27 Jan 2026 12:47:33 -0800 (PST)
Message-ID: <5aea412c-9c7f-4692-af3e-79937956ef8c@arm.com>
Date: Tue, 27 Jan 2026 20:47:31 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] kselftests/resctrl: Add support for CAT test on
 ARM
To: Shaopeng Tan <tan.shaopeng@fujitsu.com>, fenghuay@nvidia.com,
 reinette.chatre@intel.com, james.morse@arm.com, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
 <20260123044034.141247-6-tan.shaopeng@fujitsu.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260123044034.141247-6-tan.shaopeng@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shaopeng,

On 1/23/26 04:40, Shaopeng Tan wrote:
> Currently, CAT test is limited to Intel architectures.
> Add cache cleaning and enable result checking for Arm architectures.
> 
> Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c | 2 +-
>  tools/testing/selftests/resctrl/fill_buf.c | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index e1b30ab4cef5..58b1590695d1 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -113,7 +113,7 @@ static int check_results(struct resctrl_val_param *param, const char *cache_type
>  		ret = show_results_info(sum_llc_perf_miss, bits,
>  					alloc_size / 64,
>  					MIN_DIFF_PERCENT_PER_BIT * (bits - 1),
> -					runs, get_vendor() == ARCH_INTEL,
> +					runs, (get_vendor() == ARCH_INTEL || get_vendor() == ARCH_ARM),
>  					&prev_avg_llc_val);
>  		if (ret)
>  			fail = 1;
> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
> index 19a01a52dc1a..dbbf80d22f42 100644
> --- a/tools/testing/selftests/resctrl/fill_buf.c
> +++ b/tools/testing/selftests/resctrl/fill_buf.c
> @@ -35,6 +35,10 @@ static void cl_flush(void *p)
>  #if defined(__i386) || defined(__x86_64)
>  	asm volatile("clflush (%0)\n\t"
>  		     : : "r"(p) : "memory");
> +#elif defined(__aarch64__)
> +	__asm__ __volatile__("dc civac, %0\n\t"
> +		     : : "r" (p) : "memory");
> +

This is only guaranteed to clean and invalidate to the point of
coherence, PoC. On Grace I expect this is L3/slc and so the cache line
there in L3/slc is likely not invalidated or pushed to DRAM.

The dsb() for synchronization is missing for aarch64 in sb().

>  #endif
>  }
>  

Thanks,

Ben


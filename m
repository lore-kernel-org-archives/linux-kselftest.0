Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F94A4611CC;
	Thu, 22 Jan 2026 06:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769062942; cv=none; b=JKZ/Ot4cqE1Bbgiyt++Og2lHZal4l9KmMk7V6hS0m43W7+gTGcr37Cf9C2syIkBFR75F+CC79rec/uUIX3LUPqbPnXcI33QnSxBcrQXaOL+xz7At215NEFuPuS0AFETcr9HJbNtBLQrAzsZ2xe0YtF73UBinphB3wg79x6ymS9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769062942; c=relaxed/simple;
	bh=hetu5g04znhqBycC/hGsWoU14terX7K4XrSs2qLK7dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g+DowboW7g9sk2F+8NJB/Y8UugmyyAGH2x/ts+z7u2pRphAnMP8F7GDki92NifU/J3DA0DHHuJzCViVgTvqrhzolDcwcyV6+cnoyODV53GypfDRZgDSr+lqrMeEPKr8SJn55gZal0GmHStV9/IzXyXG+963gdKJMCf00o0eXgNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD5031476;
	Wed, 21 Jan 2026 22:22:13 -0800 (PST)
Received: from [10.164.18.63] (MacBook-Pro.blr.arm.com [10.164.18.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46DE93F740;
	Wed, 21 Jan 2026 22:22:17 -0800 (PST)
Message-ID: <0e5e303c-19b0-4c16-bd94-2354f6553846@arm.com>
Date: Thu, 22 Jan 2026 11:52:14 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] selftests/mm: fix exit code in pagemap_ioctl
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mark Brown
 <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Usama Anjum <Usama.Anjum@arm.com>
References: <20260107164842.3289559-1-kevin.brodsky@arm.com>
 <20260107164842.3289559-8-kevin.brodsky@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260107164842.3289559-8-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 07/01/26 10:18 pm, Kevin Brodsky wrote:
> Make sure pagemap_ioctl exits with an appropriate value:
>
> * If the tests are run, call ksft_finished() to report the right
>   status instead of reporting PASS unconditionally.
>
> * Report SKIP if userfaultfd isn't available (in line with other
>   tests)
>
> * Report FAIL if we failed to open /proc/self/pagemap, as this file
>   has been added a long time ago and doesn't depend on any CONFIG
>   option (returning -EINVAL from main() is meaningless)
>
> Cc: Usama Anjum <Usama.Anjum@arm.com>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Reviewed-by: Dev Jain <dev.jain@arm.com>

> ---
>  tools/testing/selftests/mm/pagemap_ioctl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> index 80d7c391f8f5..7b214e8755f7 100644
> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> @@ -1551,7 +1551,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
>  	ksft_print_header();
>  
>  	if (init_uffd())
> -		ksft_exit_pass();
> +		ksft_exit_skip("Failed to initialize userfaultfd\n");
>  
>  	ksft_set_plan(117);
>  
> @@ -1560,7 +1560,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
>  
>  	pagemap_fd = open(PAGEMAP, O_RDONLY);
>  	if (pagemap_fd < 0)
> -		return -EINVAL;
> +		ksft_exit_fail_msg("Failed to open " PAGEMAP "\n");
>  
>  	/* 1. Sanity testing */
>  	sanity_tests_sd();
> @@ -1732,5 +1732,5 @@ int main(int __attribute__((unused)) argc, char *argv[])
>  	zeropfn_tests();
>  
>  	close(pagemap_fd);
> -	ksft_exit_pass();
> +	ksft_finished();
>  }

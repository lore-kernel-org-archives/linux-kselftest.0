Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846610;
	b=OTAhfnHscvdG14+polK7JNfe6SDrRG0UboT6DQ8e/gySp+0wXI/YiPdube55NhbZTRNT
	 BIQ86HOA+U3hnOFuMB9WiEj8t8Kl40Qi2gS8f5p5g/75wBguEV1nqRSmGH1Tntd5hNMXR
	 +qC+uD1qHUsj8sfg6tm0LEvUe/lF5+EeX6yhIdXQpJGwfIE8Whi6mEQqiXr6CnjOrp1fZ
	 Udmsq91iXqfDzn9LtrarU0WWuijK6MW1En9aeOVONMsdsSFCmPnj6Ufqtb7e0D3JNmz5P
	 02XBP4prqCkc1TsK84BdgolllocFYPYQr5gZ3eiCTJ1dxSCT6je7dE+ExaVAoJwVNEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846610;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/gPyuCMe5xPsig+UesHAvJvAXwzPTI7l8kdjouUPbUY=;
	b=DTF44gpDeNuXWaANx8BeQtG3coeu9C7cQxX/bWAf+o4JGZtxVt9ug4bkQz+NlCNstBCr
	 OVKv+XfoDaY+hncTdhlU/nrY1lCBlYf+wjo13O3GVW5MsRNE5cPJTVhN6MtHN8oc8PvvM
	 Vg3G9ZCkjcX9vEe2VvSzhXs1sZaV6lC+fAtgCaamZ9YZEtFwRi2CiyJuG4A8k/+CYSGxD
	 RE76I8Dxt7IEO88jHSobsu+NPtwuhRwPoUJ+g/JSO00I4BG7c9dZlwbKSgUUvJTrHD40V
	 Qqal8mGy15eMKNdgMI+BF0HwlYSqog+aL4BSRH1HOkwo9N3aWU8HuQIQWYTtqqTDh6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=n0FHJucI;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856D4606A329;
	Mon, 16 Nov 2026 16:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 856D4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=n0FHJucI
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DB39143D;
	Mon, 16 Nov 2026 08:30:06 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1A093F763;
	Mon, 16 Nov 2026 08:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794846609; bh=w+nWXugcjQ+4FQMtmStDKUfKy7TzYJBDal6iYFInAbo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n0FHJucI1etdZfmNz7fQu8KHi9eRCSthMfBVURk5xU/Y8cJtNAP5Pk0FbozSbTsZS
	 jETVUe0SSDdTZ+o2utQed/MHQTPPJc8NrnKnLKbpyP0rb0Q/1PiPl77RZXnK7in5/+
	 ueoidBkKUj/p7XJ91FkJ9Ijv+fD+f4rEOqkdsOvA=
Message-ID: <6ae02c7b-69a3-43a1-bcd5-639780e2a0f2@arm.com>
Date: Mon, 16 Nov 2026 16:30:06 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] selftests/resctrl: Fix CMT test failure when all
 cache bits are tested
To: Richard Cheng <icheng@nvidia.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, shuah@kernel.org, fenghuay@nvidia.com
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kaihengf@nvidia.com, kobak@nvidia.com,
 newtonl@nvidia.com, kristinc@nvidia.com
References: <20261114140108.36954-1-icheng@nvidia.com>
 <20261114140108.36954-2-icheng@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261114140108.36954-2-icheng@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On 14/11/2026 14:01, Richard Cheng wrote:
> The CMT test accepts any number of bits from 1 to the length of the full
> cache bit mask via "-n". Since cmt_init() gives the default resource
> group the inverse of the tested mask to keep other tasks out of the
> tested cache portion.
> 
> When all bits are tested the inverse mask is empty. resctrl rejects an
> empty mask with "Mask out of range" on systems that require at least one
> bit to be set, cmt_init() fails and the test fails before taking any
> measurement.
> 
> Only write the schemata of the default resource group when there're bits
> left for it. When all bits are tested the default resource group keeps
> its allocation.

Why did you choose this policy? For instance, why not just set a single bit?

Thanks,

Ben

> 
> Fixes: 7a214b4ec1c9 ("selftests/resctrl: Improve accuracy of cache occupancy test")
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/cmt_test.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cmt_test.c b/tools/testing/selftests/resctrl/cmt_test.c
> index ccb6fe881a94..5d0bb27b7817 100644
> --- a/tools/testing/selftests/resctrl/cmt_test.c
> +++ b/tools/testing/selftests/resctrl/cmt_test.c
> @@ -42,10 +42,13 @@ static int cmt_init(const struct resctrl_test *test,
>  	if (ret)
>  		return ret;
>  
> -	snprintf(schemata, sizeof(schemata), "%lx", ~param->mask & full_mask);
> -	ret = write_schemata("", schemata, uparams->cpu, test->resource);
> -	if (ret)
> -		return ret;
> +	/* No bits are left for the default group when all bits are tested. */
> +	if (~param->mask & full_mask) {
> +		snprintf(schemata, sizeof(schemata), "%lx", ~param->mask & full_mask);
> +		ret = write_schemata("", schemata, uparams->cpu, test->resource);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	snprintf(schemata, sizeof(schemata), "%lx", param->mask);
>  	ret = write_schemata(param->ctrlgrp, schemata, uparams->cpu, test->resource);


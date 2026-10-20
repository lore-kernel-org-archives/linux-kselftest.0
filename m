Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513114;
	b=iN27q4x3V+7mszh09C5L8HQeWUHR+aNXwrWvJKd9ylUI/X+0RXzcmCBe+Z/G8N/BDWUm
	 2FjEcLvgNaKlPsjMx0SZkeg8Y0Dr38LZgnajQFLDZJ64GPAlzDEJFu3Do9QFgz0Le43Oi
	 ThfAY5fQYJAPeZCX+9hWB/Udsq2SKfAHFshOm2FyQgnZvBunw8UJoyqkFAgJXkD1GZPRG
	 +2peQHnTYeTW2cpro5cqmN7Oq14u61s4XMl+NEncR77z3btU0r9cwUaOrlpyBKo+wBYHj
	 RftbBGOzoKgVElxJiSIVbEI+cN+aGj/K6evib4ppsP9PjaGgpeJ7oT3dzdnt8ulg4xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513114;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sRy8OMvelqpi1kx8GaG4oDAawes2m93eDuOUAuGI78I=;
	b=vLB/NcBWzhm6U9KcGEjw3Gin7SF9B53ykF79LnHi2RD93wXqlo+nHWhikSgzbJqaYTaG
	 mYqQbdKgMu/qDgK2kLgWRg8XZ+fWK1qMOGP7FptF2VoBKcmNpfzIm3ZUn+iv57tPn6+pS
	 AzQh5wlsUYBb/a2BnFfkGyDKXBbhfW3boD6ZVlQimne4KBIrN6pYBEdL9U2srUKKirJQ5
	 Zt/YJRawWchXw6d8yh62WObWDwlN3U6jnFz7tfT7AvvUlYHqbogR7giOqmlPX/LiY8Cqt
	 Om0N6OyD75rj6VpnoHUCvNL3IhPfck34/BFszE0hKihYlTC9DS0JvwuDQyujG88Of7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P3UKYGoj;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7022A606A321;
	Tue, 20 Oct 2026 16:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7022A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P3UKYGoj
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87E562103;
	Tue, 20 Oct 2026 09:18:29 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DD503F7D8;
	Tue, 20 Oct 2026 09:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792513112; bh=C9GWUSzHu70C+auZV5q3SwYVi5/DqwHUbfj4SB1WjDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P3UKYGojoamu+TtRAydYO4m+GIMBnLjmIMSd9zG+Uxq3x97+c8iBdviiA2haADTrF
	 fBI4p4GlhFIEjJTGK3WPJi4Mx4maLW0joHPmFDwiOd4wJihxWwqSs/l8w74WB50IMR
	 B5bulrDunM0QRXWIaDJlPbuGGNaFPyn8ydM9iYt4=
Message-ID: <415d1bf3-342d-45b5-b31e-ddc654510d85@arm.com>
Date: Tue, 20 Oct 2026 17:18:28 +0100
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
Subject: Re: [PATCH v5 2/2] selftests/resctrl: Recognise aarch64 as a vendor
 for L3_NONCONT_CAT
To: Richard Cheng <icheng@nvidia.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, x86@kernel.org, shuah@kernel.org,
 fenghuay@nvidia.com
Cc: Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kaihengf@nvidia.com, kobak@nvidia.com, newtonl@nvidia.com,
 kristinc@nvidia.com, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-3-icheng@nvidia.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261012074729.40042-3-icheng@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Richard,

On 12/10/2026 08:47, Richard Cheng wrote:
> aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
> and arch_supports_noncont_cat() falls through to "return false".
> L3_NONCONT_CAT therefore spuriously fails on every ARM MPAM platform.
> 
> Define ARCH_ARM, short-circuit detect_vendor() to it on aarch64, and
> add it to the AMD/Hygon always-supports early-out in
> arch_supports_noncont_cat().
> 
> aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc.), but MPAM
> mandates non-contiguous CPBM uniformly, so per-implementer handling is
> not needed here.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c    |  9 ++++++--
>  tools/testing/selftests/resctrl/resctrl.h     |  1 +
>  .../testing/selftests/resctrl/resctrl_tests.c | 21 +++++++++++++++++++
>  3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index 0a417267dd74..f4b02b3eedd7 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -271,8 +271,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
>  {
>  	unsigned int vendor_id = get_vendor();
>  
> -	/* AMD and Hygon always support non-contiguous CBM. */
> -	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
> +	/*
> +	 * AMD and Hygon always support non-contiguous CBM. ARM/MPAM defines
> +	 * MPAMCFG_CPBM as a bitmap with no contiguity constraint per ARM
> +	 * DDI 0598.
> +	 */
> +	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON ||
> +	    vendor_id == ARCH_ARM)
>  		return true;

Would it be better not to just to use the information resctrl advertises?
/sys/fs/resctrl/info/L3/sparse_masks

Is there any reason this test doesn't use that other than being written before its introduction?

Thanks,

Ben

>  
>  #if defined(__i386__) || defined(__x86_64__) /* arch */
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index a7556cdae0de..03b4500c1f7f 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -41,6 +41,7 @@
>  #define ARCH_INTEL	BIT(0)
>  #define ARCH_AMD	BIT(1)
>  #define ARCH_HYGON	BIT(2)
> +#define ARCH_ARM	BIT(3)
>  
>  #define END_OF_TESTS	1
>  
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> index dbcd5eea9fbc..cfece594a8c6 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -23,6 +23,15 @@ static struct resctrl_test *resctrl_tests[] = {
>  	&l2_noncont_cat_test,
>  };
>  
> +static bool detect_aarch64(void)
> +{
> +#if defined(__aarch64__)
> +	return true;
> +#else
> +	return false;
> +#endif
> +}
> +
>  static unsigned int detect_vendor(void)
>  {
>  	static unsigned int vendor_id;
> @@ -34,6 +43,18 @@ static unsigned int detect_vendor(void)
>  	if (initialized)
>  		return vendor_id;
>  
> +	if (detect_aarch64()) {
> +		/*
> +		 * aarch64 has no userspace vendor_id in /proc/cpuinfo.
> +		 * MPAM-capable ARM implementations follow ARM DDI 0598;
> +		 * treat all aarch64 builds as a single vendor for the
> +		 * purposes of resctrl selftests.
> +		 */
> +		vendor_id = ARCH_ARM;
> +		initialized = true;
> +		return vendor_id;
> +	}
> +
>  	inf = fopen("/proc/cpuinfo", "r");
>  	if (!inf) {
>  		vendor_id = 0;


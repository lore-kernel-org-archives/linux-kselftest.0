Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779023C3C15;
	Thu, 28 May 2026 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779966111; cv=none; b=WLE3ta0hx0q95eiL14vZ/lHC6+TYUwWS+gQP3Wtqqd7di2ECbCs/Gr8PQlj9W3MNQIb7Rg1rT5xHYp4rMfpPE+IUYuYH5Be7mfOQl3B+qU0avu+blbQl+9PUhCJYg4cQNQSFCPe8OKs5C6B9CAt9tLgJ//EMNt6Fqufeg2i6clA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779966111; c=relaxed/simple;
	bh=Ed37Kf+lRqRnz5AV70Cq5GN8fdukOYfQP5/n3T4m3xo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B8On7XTEKM7ZXovg3v173pGyQYt35QzNIFGN2QPuJ56XWVI/WgBCTc19Dcr40FI58YOogS8j7FFNfTKW3u5mVFLUKm2Qt+j0j79uz/eJjStKOYp7DSw0paopxH83or9+YCZXpajbyC7rQekGpJjhd/s76PZyBdX7HO8TA1WqVbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLuXDdj3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLuXDdj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779966107; x=1811502107;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ed37Kf+lRqRnz5AV70Cq5GN8fdukOYfQP5/n3T4m3xo=;
  b=WLuXDdj3WH7eRcq6S02AKnxam5e//KKZb1Vza2l6pUrAcepe64/J0jFj
   dLm3NNoiBsNjKAYXX5WwJxvzLcxjS8pbPDcvSFUwZZ/h1+6QVRFoHUzzU
   q4ZN3ib2wvywhkACV6+nTzS7+lobbw3wVhyTVzzr8jO7KBaZ+8X4n67Of
   Bna1Fsm0qjkUV/5HaxkPRYhyNPiXr8E8rwXWldNU2Cy3A9mq3/sAmbDeG
   bQQ4dRWoqK8h7vq5aiCWevl/s4pc81zvKitZWXEVI6OFRlsERyfCg9Vzy
   FGUliFBewMsHh1ZMmcR8+duCoIBC1bkns9TxZnaxKG+pUMJpu4BwLCl20
   w==;
X-CSE-ConnectionGUID: XG7aPquFSqKUXbLmgSkbVQ==
X-CSE-MsgGUID: 4TqU3TaITxiMsL1oXOkrgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80919566"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80919566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 04:01:43 -0700
X-CSE-ConnectionGUID: GdfHuIGcTdaYBmqtB2R4Lw==
X-CSE-MsgGUID: rp25r7I5Qd+KAoBrQJLz0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="246551778"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 04:01:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 May 2026 14:01:34 +0300 (EEST)
To: Richard Cheng <icheng@nvidia.com>
cc: tony.luck@intel.com, Reinette Chatre <reinette.chatre@intel.com>, 
    shuah@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, 
    babu.moger@amd.com, LKML <linux-kernel@vger.kernel.org>, 
    linux-kselftest@vger.kernel.org, fenghuay@nvidia.com, newtonl@nvidia.com, 
    kristinc@nvidia.com, kaihengf@nvidia.com, kobak@nvidia.com
Subject: Re: [PATCH v2 3/3] selftests/resctrl: Recognise aarch64 as a vendor
 for L3_NONCONT_CAT
In-Reply-To: <20260528102956.33121-4-icheng@nvidia.com>
Message-ID: <215fc6b6-9fc6-29a3-986e-f195c7c8da79@linux.intel.com>
References: <20260528102956.33121-1-icheng@nvidia.com> <20260528102956.33121-4-icheng@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 May 2026, Richard Cheng wrote:

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
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c      |  9 +++++++--
>  tools/testing/selftests/resctrl/resctrl.h       |  1 +
>  tools/testing/selftests/resctrl/resctrl_tests.c | 11 +++++++++++
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index dc414e55ae94..ce66016dbd88 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -292,8 +292,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
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
>  
>  #if defined(__i386__) || defined(__x86_64__) /* arch */
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index afe635b6e48d..670e5b128b4d 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -40,6 +40,7 @@
>  #define ARCH_INTEL	BIT(0)
>  #define ARCH_AMD	BIT(1)
>  #define ARCH_HYGON	BIT(2)
> +#define ARCH_ARM	BIT(3)
>  
>  #define END_OF_TESTS	1
>  
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> index dbcd5eea9fbc..b28dae83d0a4 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -34,6 +34,17 @@ static unsigned int detect_vendor(void)
>  	if (initialized)
>  		return vendor_id;
>  
> +#if defined(__aarch64__)
> +	/*
> +	 * aarch64 has no userspace vendor_id in /proc/cpuinfo. MPAM-capable
> +	 * ARM implementations follow ARM DDI 0598; treat all aarch64 builds
> +	 * as a single vendor for the purposes of resctrl selftests.
> +	 */
> +	vendor_id = ARCH_ARM;
> +	initialized = true;
> +	return vendor_id;
> +#endif

It would be better to create a detect_aarch64() function and put 
the ifdeffery inside it so it returns either true or false here.

> +
>  	inf = fopen("/proc/cpuinfo", "r");
>  	if (!inf) {
>  		vendor_id = 0;
> 

-- 
 i.


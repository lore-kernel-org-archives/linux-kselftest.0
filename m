Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621992F7EE7;
	Mon, 25 May 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703328; cv=none; b=N6yKfX4PhrFLP7BdPpV86QrfBDCiZ0HBxQkRIpwykWns7KBkjDoH+MyalDGEKGCM6h5bSkD2DGs0qpUFuo8T/xk3r6yAzlqAkEbkilKR3nJBH+I1EOEaMzgGOXfaetdvky2qous9QVa9O3fOVsffkrj/rvxwg1okW+aJlRKLoXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703328; c=relaxed/simple;
	bh=OsNFx6vh4TVbd+njBvmqiAxtHokjTKRqzyb/eNLLR1s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B+Y0DnCXPcfT8uqRz/xlr/XI6f9oQm7W8rljlNIXp3+whDyV1dSm0HSrHbax3lnDBeqTIYvOqw2Gk4biuuwcsmPDM3ghO01y5G5EB49b0hsEwIsO7Flt8+ZgBGipqSO0f18P1phG/hgp8yKOs18cvLSqpxIOUqqY/xQYCL1SqWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLgTgqsJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLgTgqsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779703327; x=1811239327;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OsNFx6vh4TVbd+njBvmqiAxtHokjTKRqzyb/eNLLR1s=;
  b=BLgTgqsJ0cReLv5g/gJrI2VGXtGPBh9/i/Ums/8JvoSWCscNpUNh4jgs
   IiNLL/E/VhbsKoFNiF29oQ+R1qDAkQ89MC8fXFSPPlf07lYAA126aEz1t
   1K/NJ0Y4n2zTKq0AYcI9phzwDfY/1IuPCacvG8YxQ3CoAfFUoma50EZWV
   96Xq2HPQbg5eIuLUerwX4ctw1wppbzlu2J6PDGBftDWyv9C7Psd/s5hc5
   6YgckaDtlNZVn2aC4Coeni0lp1EFgtEeqUjfQQNoC+JBbZdqwq1jR3qAj
   vxiSMR9jN9NeDsmMSAn+XHjCAAk+bBoYW/35+8k97/nct26tKqj01Gn9f
   Q==;
X-CSE-ConnectionGUID: 8DGFwPkFRRSjfjSyxkCH3w==
X-CSE-MsgGUID: RO5YNziPR/+bW0D5CkwFlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="84375561"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="84375561"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 03:02:06 -0700
X-CSE-ConnectionGUID: qZfIs3cQRMajR+WznqCNMw==
X-CSE-MsgGUID: kAOkMlTwRzmGtrs6xeSnpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="237143258"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 03:02:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 25 May 2026 13:01:59 +0300 (EEST)
To: Chen Yu <yu.c.chen@intel.com>
cc: Tony Luck <tony.luck@intel.com>, 
    Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org, 
    Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, 
    Babu Moger <babu.moger@amd.com>, LKML <linux-kernel@vger.kernel.org>, 
    linux-kselftest@vger.kernel.org, Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH] selftests/resctrl: Allow CAT testing when no exclusive
 cache exists
In-Reply-To: <20260523101715.3964456-1-yu.c.chen@intel.com>
Message-ID: <db89b830-997f-8f74-012c-9aece7fa5c34@linux.intel.com>
References: <20260523101715.3964456-1-yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 23 May 2026, Chen Yu wrote:

> The shareable_bits indicates which cache portions might be shared with
> other agents (e.g., GPU, other I/O devices). On some platforms, all L3
> cache ways are marked as potentially shared.
> 
> The L3_CAT test should fall back to using the full CBM mask when no
> exclusive portion exists, since the test logic (writing different
> schemata and measuring cache misses) still works. The shareable mask
> is a hint about potential interference, not a hard exclusion.
> 
> Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index f00b622c1460..b6994ba4504b 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -248,7 +248,7 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
>  	/* Get the largest contiguous exclusive portion of the cache */
>  	ret = get_mask_no_shareable(test->resource, &long_mask);
>  	if (ret)
> -		return ret;
> +		long_mask = full_cache_mask;

Wouldn't it warrant to log something when the fallback occurs? It 
certainly looks something that makes the results less reliable (so it 
would be nice to know about it when looking at the test results).

>  
>  	/* Get L3/L2 cache size */
>  	ret = get_cache_size(uparams->cpu, test->resource, &cache_total_size);
> 

-- 
 i.


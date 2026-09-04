Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAF1390610;
	Fri,  4 Sep 2026 06:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788501858; cv=none; b=lZWwgaOvhiOGYnnLbwqJUNmbGX9Lsa+iWYmMbD1RwVst0dzvf3wPxM160kvKYUnXD6JTtZk4Qqb7RxufzzBiKf1sD1DMsTvHpzZeNSIRfTWF3zINWU/6G/BjK0QjRQjhc/AXeVMMurE6YxGliwGN2WVCNhRbZsPadx59rAF6T7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788501858; c=relaxed/simple;
	bh=1jCojS2k9dmomuM/T5Y/9PMCl0u+3Q640PkvDTWKiLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3M34pZZH2E/FtjMXOTfzKMTbbnqrr+2HaD1HqpL0MXz7yKLm7d6x+8XuIPsjbXI0bRYcWx11XJ48zutiq3lZNAEHkKYyN3pUTu55+VUH2i/OQAMRmqZwu5wEx++Z3xkyYfk4e4RbDQmMkrmzYZtX/SpM6s2z065bFnbavje0Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ez8gGPZJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ez8gGPZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788501856; x=1820037856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1jCojS2k9dmomuM/T5Y/9PMCl0u+3Q640PkvDTWKiLw=;
  b=Ez8gGPZJDI2XptSjspAXxaE0QrLZ1e79aPgLMI1mr/0Ywpiz8V65LmIG
   2TMmmHd5tZ7yhaE0mF4VzN1N9uxJxTYkNNctpUHclVNxvLT8hAMVErFgX
   qQ312M+IzzZcA4F1ySeau+WKZBVDJVayGzbDM9OuoOoKnXn6vxbxOxqEx
   pvqqMUiVi119zASa2HxkERCYrmOz+mJA0NPwkPJ/P/Gj7T2Z5ULiRNC40
   1fHfHPE9N7xLQAhtqN5I3nzXycg/yI/s/8CmJbY+5N4qapTzSMgiypbWG
   Xkl7iFsCoATJXSItq69okgLSaFRBWSITlwvddG/U/wZ+go72rHvaqTxHV
   A==;
X-CSE-ConnectionGUID: mv0TdqG0Q7uXaxe0swuDug==
X-CSE-MsgGUID: we8bXrJHQbeq+IqmWcSxTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100516275"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="100516275"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 23:04:15 -0700
X-CSE-ConnectionGUID: XZ+6LqDLQfumcewIwdVduQ==
X-CSE-MsgGUID: S8npCM7eRcOSnkB7MxG2Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="263745271"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.224])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 23:04:13 -0700
Date: Fri, 4 Sep 2026 09:04:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH] lib: hexdump: convert test to KUnit framework
Message-ID: <appfWm7KaBuk5iL1@ashevche-desk.local>
References: <20260903213656.57203-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903213656.57203-1-danielmaraboo@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 03, 2026 at 06:36:56PM -0300, Daniel Pereira wrote:
> The old test_hexdump module used the traditional kernel printing
> functions to verify hex dumping capabilities.
> 
> This patch converts the existing test into the modern KUnit framework
> to allow standard automation, faster execution, and better integration
> with Kselftest CI.

...

> +++ b/lib/Kconfig.debug

>  	tristate "KUnit test for cpumask" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
>  	default KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
>  	help
>  	  Enable to turn on cpumask tests, running at boot or module load time.
>  
> @@ -2289,6 +2290,7 @@ config TEST_LIST_SORT
>  	tristate "Linked list sorting test" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
>  	default KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
>  	help
>  	  Enable this to turn on 'list_sort()' function test. This test is
>  	  executed only once during system boot (so affects only boot time),
> @@ -2300,6 +2302,7 @@ config TEST_SORT
>  	tristate "Array-based sort test" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
>  	default KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS

>  	  This option enables the self-test function of 'sort()' at boot,
>  	  or at module load time.
> @@ -2329,6 +2332,7 @@ config TEST_MULDIV64
>  config TEST_IOV_ITER
>  	tristate "Test iov_iter operation" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> +	default KUNIT_ALL_TESTS
>  	depends on MMU
>  	default KUNIT_ALL_TESTS
>  	help
> @@ -2343,6 +2347,7 @@ config KPROBES_SANITY_TEST
>  	depends on DEBUG_KERNEL
>  	depends on KPROBES
>  	depends on KUNIT
> +	default KUNIT_ALL_TESTS
>  	select STACKTRACE if ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
>  	default KUNIT_ALL_TESTS
>  	help

Have you read the patch before sending?

...

Please, take your time and check what you are sending next time.
This version is obviously no-go.

-- 
With Best Regards,
Andy Shevchenko



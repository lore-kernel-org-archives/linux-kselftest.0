Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4645C31813A;
	Sat, 20 Jun 2026 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953711; cv=none; b=Nzlo4JnNADTAS+zUMwd0rDwcKXmE7TaKaIljaR/RTc13312qTJYDhYjgeLs6rJiJh3vXle1GGaRtH37MNRoezel0751rYnBCqkBhq6alPecoBJ86omXubYVdQf1p6+LNTJRrIijTGA10xM9SEQw1LioR3rONByWmUCUy2Gvpm1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953711; c=relaxed/simple;
	bh=DwHcr0L6dXNG1wV56wKeeEVm5U2kc0MmTKeBheUKwRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aanen7g0Iljrm10dZP7sVH61Ix7lfX668h4sduCNz4f4jFNPNPikZThhS2WGC28kQAHmpapWOxYbDBSiBbgrUWd4yRA+f1mDH743InAu30TJA+/vAoSuS2hwtFycHkf7Zw0DDFIOoSPj+OPnNZsJ4uFDDUE2wBJxxaTdxTMRUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 56C2C1EA340; Sat, 20 Jun 2026 19:08:28 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::9c4] (unknown [IPv6:2001:8003:8810:ea00::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 17F771EA338;
	Sat, 20 Jun 2026 19:08:27 +0800 (AWST)
Message-ID: <db22082d-c14d-4e9a-b381-a655708f7c91@davidgow.net>
Date: Sat, 20 Jun 2026 19:08:24 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] rust: kunit: add 'kunit_suite.status' binding to
 'kunit_unsafe_test_suite'
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
References: <20260617121535.462459-1-vaibhav@linux.ibm.com>
 <20260617121535.462459-3-vaibhav@linux.ibm.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260617121535.462459-3-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 17/06/2026 à 8:15 PM, Vaibhav Jain a écrit :
> Update KUnit Rust binding macro-rule 'kunit_unsafe_test_suite' to add and
> initialize the newly introduced 'kunit_suite.status'. Without this
> 'kunit_suite.status' field is never initialized which is an error for the
> Rust compiler.
> 
> Suggested-by: David Gow <david@davidgow.net>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog
> =========
> V2->V3:
> Patch, not present in earlier version
> ---

Thanks very much. I'd prefer it if this could be squashed into patch 1,
just so we don't have a period where the rust build is broken.

Otherwise, good, though. With the formatting issue below fixed, this is

Reviewed-by: David Gow <david@davidgow.net>

>  rust/kernel/kunit.rs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index a1edf7491579..e07894c72d0d 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -288,6 +288,7 @@ macro_rules! kunit_unsafe_test_suite {
>                      log: ::core::ptr::null_mut(),
>                      suite_init_err: 0,
>                      is_init: false,
> +		    status: kernel::bindings::kunit_status_KUNIT_SUCCESS,

Alas, Rust code needs to be indented with four spaces, rather than tabs.
In theory, make LLVM=1 rustfmtcheck is supposed to catch this, but it's
not working for me.


>                  };
>  
>              #[used(compiler)]


Cheers,
-- David

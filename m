Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD2A422E2E;
	Wed, 19 Aug 2026 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129865; cv=none; b=OfqZHSLCIqO6ys7alhxCme1L6Lfvaon+EKGg9zzMgZYa78oUJ/JFbSA0527mSn2dKeh97CoDfmy9DV+Kd2AAE3oNIyCf0GfhRBw2g6eU3WgjyZMMPJvGVIqWhAqhSa7C/bWqV1sL6VRvJlBDax7NZMCO67IL3RSIL8V5XSEmtkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129865; c=relaxed/simple;
	bh=0pke4ue5ZnXMUycpgpAZZFwNMU7Mqv2qQAGK/9npows=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gl6+eC1Y4t0XsdC8wfkkP+Xs/xJGBkDr3ZvTkeba2tvAPVGMl12l46993p26qx1IKlgNYO5xNhbNlzzL9EbQ803dROzWqQ5F0a0YWc0ciB+BR1QbW3BtfJr09b35BMZzFLFh0z1QNPJJBITE+JnrewHua2/B5zjhTJqyj2NyIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 924861EA9A5; Wed, 19 Aug 2026 16:57:33 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::9c4] (unknown [IPv6:2001:8003:8802:7000::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 4F9BD1EA998;
	Wed, 19 Aug 2026 16:57:29 +0800 (AWST)
Message-ID: <1f19d1ca-bd49-402f-b5e7-7b87681cc42a@davidgow.net>
Date: Wed, 19 Aug 2026 16:57:25 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpu: nova-core: add a KUnit test configuration option
To: Yury Norov <ynorov@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev
Cc: Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Yury Norov <yury.norov@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260818152324.587932-1-ynorov@nvidia.com>
 <20260818152324.587932-2-ynorov@nvidia.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260818152324.587932-2-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 18/08/2026 à 11:23 PM, Yury Norov a écrit :
> The continuation-record KUnit tests are currently built whenever both
> Nova Core and KUnit are enabled, providing no way to select the tests
> independently.
> 
> Add CONFIG_NOVA_CORE_KUNIT_TEST and use it to guard the test suite.
> Follow the usual KUnit convention of enabling the option through
> CONFIG_KUNIT_ALL_TESTS.
> 
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---


Thanks. I imagine this should go in via drm, rather than the KUnit tree.
I'm not totally convinced by patch #2, but let's get this patch in
regardless. Maybe it even should have a Fixes tag:

Fixes: 0499a3826c2f ("gpu: nova-core: gsp: add tests for continuation records")
Acked-by: David Gow <david@davidgow.net>

Cheers,
-- David

>  drivers/gpu/nova-core/Kconfig                  | 12 ++++++++++++
>  drivers/gpu/nova-core/gsp/cmdq/continuation.rs |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
> index f918f69e0599..d05c2c1d46d9 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -15,3 +15,15 @@ config NOVA_CORE
>  	  This driver is work in progress and may not be functional.
>  
>  	  If M is selected, the module will be called nova-core.
> +
> +config NOVA_CORE_KUNIT_TEST
> +	bool "KUnit tests for Nova Core" if !KUNIT_ALL_TESTS
> +	depends on NOVA_CORE && KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests for internal components of the Nova
> +	  Core driver. The tests currently do not require GPU hardware. These
> +	  are only for development and testing, not for regular kernel use
> +	  cases.
> +
> +	  If unsure, say N.
> diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
> index 05e904f18097..c0aa16c8fbf4 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
> @@ -167,6 +167,7 @@ fn init_variable_payload(
>      }
>  }
>  
> +#[cfg(CONFIG_NOVA_CORE_KUNIT_TEST)]
>  #[kunit_tests(nova_core_gsp_continuation)]
>  mod tests {
>      use super::*;


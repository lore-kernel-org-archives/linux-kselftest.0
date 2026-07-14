Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550C176238;
	Tue, 14 Jul 2026 02:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783996315; cv=none; b=QY5a2cEz3WXinEK09p2enGK3jfJ9P3LDhY8v+lmdkNSogAt1nkWNbu7LokIHen6mWrD8llE4O6dUKSZ8NFDTs0MhG0CkXgv+o1b5Kv6YOq3DR+rni5OzQA3dEul2fIKcz8cF5ASIeEcTk/ma16h4Rz1j1gFskukotG3wYTaTUJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783996315; c=relaxed/simple;
	bh=Hv4gqMQwrsm9ja9Uqk1BHvfzalDvHsqTooU73jtp5MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evC49LQIayqGGlgUjnRGGoEs31tIdaMRR6y/6wdlynH/L4psXvFUBTz85QZyM7jTxOsUrKOCQY665zUwNpHfBFpLmkKsYsNBrtFYjcDgyiVkIkPqZZes9WmcXmc+cu9zp2fLLJWOPmJhEPQxRThXWQU7jKSQmHFuvNHyLVOhP3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 507AC1EA795; Tue, 14 Jul 2026 10:31:46 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::41b] (unknown [IPv6:2001:8003:8810:ea00::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 9BE101EA78E;
	Tue, 14 Jul 2026 10:31:44 +0800 (AWST)
Message-ID: <464c7f9d-9bb7-4064-9289-341991e68ba3@davidgow.net>
Date: Tue, 14 Jul 2026 10:31:41 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: configs: enable GPIO kunit test cases in
 all_tests.config
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Rae Moar <raemoar63@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, brgl@kernel.org
References: <20260629124245.27674-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260629124245.27674-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 29/06/2026 à 20:42, 'Bartosz Golaszewski' via KUnit Development a écrit :
> Enable CONFIG_GPIOLIB in all_tests.config to ensure the kunit test cases
> for GPIO core can be built with this config.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Thanks -- sorry for missing this earlier.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   tools/testing/kunit/configs/all_tests.config | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
> index bccc2c77196d5..6825c2e855a55 100644
> --- a/tools/testing/kunit/configs/all_tests.config
> +++ b/tools/testing/kunit/configs/all_tests.config
> @@ -21,6 +21,7 @@ CONFIG_VFAT_FS=y
>   CONFIG_PCI=y
>   CONFIG_USB4=y
>   CONFIG_I2C=y
> +CONFIG_GPIOLIB=y
>   
>   CONFIG_NET=y
>   CONFIG_MCTP=y


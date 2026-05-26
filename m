Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F353CF977;
	Tue, 26 May 2026 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785908; cv=none; b=WqmQB315wO3p7pTryKthjaBXQiaS8bmO/APiB92o2g7yJt7QVaqZV9NoGnh2DiYhKMibzepu7qD+vs5JJn1of9H7BScv6fHpr64C6cpxJIUxXAEqek2ryhBFssnMrfPlOQsop3EH6WoEh1tMTb1o1T5AKqriOr9NuSkHwRrhsG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785908; c=relaxed/simple;
	bh=guwTm8bxZuaxydze++XtyW1fa8TPK+AZU64MhCcABdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXUZ+iMl8E7mbtkxqFRpq6d4pu4qpYyGUofcJcHSxCYAVg29CduO5+IeEjAVDK7eb3rPRl5hjrNdjUPdfpgNsyqL+Amh/m/OdJa6z/74LGSgjq6YJrIi7tlXJDyhe6Bfv/DjT+kht5hvujYoqkdOz3vsYcOuEa1RfvwRAhC6118=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=o+27EDdQ; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=hyBF1euP; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="o+27EDdQ";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="hyBF1euP"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1779785900;
	bh=guwTm8bxZuaxydze++XtyW1fa8TPK+AZU64MhCcABdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o+27EDdQdWFJtgj9qI9iH5ScEcJI+CJ8iqM12gxyl/QoUHT8ADGyTuq+Lpn1/ZVWS
	 iNZTc3vdlKPT0jsN2sSy22v+8ok3t/AWwXPlswkQz9/Bkb0XkZMhGL106nT8XlCP+S
	 5hrGENlMt86ykIClEJhQxDrgrWgYsNVRYV0YTll3G3cTmty0Bzh1ayklj5rujGq1ri
	 6/tCifXurjvNrTsc+38SPsUEyzXMqe+KwFj8ez9pnxqsbEWTej66LaORDg8h26GQcv
	 jgkQPaRuKVYbnQ/963+m0GGdEs0V04+/l/eDWbbM1nYDFuQwGvRQB5vS6dR/VSHyvu
	 OZ9Bl0+EkBCWWQxJbsQ9hkSDcD6y98RqpoYltCr7/UuMNuX9jB2ir1XPTISgzgf3j9
	 sFuPFo/6WkXvukON8+ZW3mBeBB/H0f1hjT/AYUFPNj7Na+YPkZ5pXgmLv2IRl2IWSB
	 y7VQkooypkSiB6hWZUQLW1090lss7xF+dfgeYv376+rlEym+ce4GnPEqKYlIKG0YYA
	 pOgelvXD+9eCoDVgjXBKAASgTkW7n+v2351zjM5VgRauO9TCSMwEFz8tmqd/ISuMfp
	 IDklCu8tvQYapUNtLhkhAeAXZ62KB1ABFtY6E0iR+XhRdLBXWLjnw2hm9dTnfXCSlo
	 IB0nQB6hforuTEAnlV6javAQ=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 05FF81E9C6E; Tue, 26 May 2026 16:58:20 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1779785898;
	bh=guwTm8bxZuaxydze++XtyW1fa8TPK+AZU64MhCcABdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hyBF1euPNFKqd88dtMoy4z3ERNIgntT5PnDoJtDPZ7XzMnOrMUa2nbh3fKcrtRIwG
	 xYLtY61JWipCwZhGvOtHTUXR5Ar+HfsDloSqiVbmpyqgUPAJj0H6SLh6TwRB8HmI67
	 UhIkwk/VbC7PZSh5k+nlwTUXOmjNtTIDn60JyuCdo8pPGFf5k2akwMT1ht29uku3Gn
	 HIBvXTUibx5zhThhppWIpvvgZ601kGbgLP9ZRPWHGc0BApDd2LYNmUhi1DbgFK1dSq
	 9PduB4FtiRwcSfG+5IZgsRBsWY9ZrcHSD1CvuSGaHXCJs9PBhY23DvJ6EzZKg8YzK2
	 hX3rlnoT8TpJWdcuTN+uWv/5FE9BELOHFEo1jt/t+po6WzIB2QRNhVsqE/cztNT712
	 K4wfwoWKb+95zkTr/2pD+i36DO9q/wgGGu0EkAgW+TO0XwTraKmQhHQq0b9hRtjSn/
	 w4RnMqRoS8Vl+2g3OgUp2UrcdtLKcUuaIAgIzki6BbOE1YZMB9whFzVkJhI/+b2hQB
	 UrbuqPgFFagG7ts2vfyoREavfC8EJnwIkfDe19FI3KNj6YhBShWORZduQzc/PxLoho
	 WVlRNGL7oCk2dRsExxnh+VR6BwrL7B7C2XE99gD9zK0XXK1zSxftI2ytTseDTgjmZx
	 tDlkQiowIkjGY2YXoIUf8+yQ=
Received: from [IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d] (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 3F2AA1E9C63;
	Tue, 26 May 2026 16:58:18 +0800 (AWST)
Message-ID: <ece5ebd2-136c-4479-bd31-714d9707ecdd@davidgow.net>
Date: Tue, 26 May 2026 16:58:16 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] kunit: provide kunit_platform_device_unregister()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
 <20260522-gpiolib-kunit-v3-2-b15fe6987430@oss.qualcomm.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260522-gpiolib-kunit-v3-2-b15fe6987430@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 22/05/2026 à 9:42 PM, Bartosz Golaszewski a écrit :
> Tests may want to unregister a platform device as part of the test case
> logic. Using the regular platform_device_register() with kunit
> assertions may result in a platform device leak or otherwise requires
> cumbersome error handling. Provide a function that unregisters a
> kunit-managed platform device and drops the release action from the
> test's list.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Looks good, thanks.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>  include/kunit/platform_device.h |  2 ++
>  lib/kunit/platform.c            | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/include/kunit/platform_device.h b/include/kunit/platform_device.h
> index 8cad6e1c3e7efba862862b579089f2f317784a73..eee565d5d1d35c1d1bc82b45eb91d21d00c68428 100644
> --- a/include/kunit/platform_device.h
> +++ b/include/kunit/platform_device.h
> @@ -14,6 +14,8 @@ int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev);
>  struct platform_device *
>  kunit_platform_device_register_full(struct kunit *test,
>  				    const struct platform_device_info *pdevinfo);
> +void kunit_platform_device_unregister(struct kunit *test,
> +				      struct platform_device *pdev);
>  
>  int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
>  						 struct platform_device *pdev,
> diff --git a/lib/kunit/platform.c b/lib/kunit/platform.c
> index 583b50b538c79599ebbf33e261fe2e9ced35efa9..737758d710b2839fab29c5cbcf3bc5ba00e20094 100644
> --- a/lib/kunit/platform.c
> +++ b/lib/kunit/platform.c
> @@ -161,6 +161,39 @@ kunit_platform_device_register_full(struct kunit *test,
>  }
>  EXPORT_SYMBOL_GPL(kunit_platform_device_register_full);
>  
> +static bool
> +kunit_platform_device_add_match(struct kunit *test, struct kunit_resource *res,
> +				void *match_data)
> +{
> +	struct platform_device *pdev = match_data;
> +
> +	return res->data == pdev && res->free == kunit_platform_device_add_exit;
> +}
> +
> +/**
> + * kunit_platform_device_unregister() - Unregister a KUnit-managed platform device
> + * @test: test context
> + * @pdev: platform device to unregister
> + *
> + * Unregister a test-managed platform device and cancel its release action.
> + */
> +void kunit_platform_device_unregister(struct kunit *test,
> +				      struct platform_device *pdev)
> +{
> +	struct kunit_resource *res;
> +
> +	res = kunit_find_resource(test, kunit_platform_device_add_match, pdev);
> +	if (res) {
> +		res->free = NULL;
> +		kunit_put_resource(res);
> +	} else {
> +		kunit_remove_action(test, platform_device_unregister_wrapper, pdev);
> +	}
> +
> +	platform_device_unregister(pdev);
> +}
> +EXPORT_SYMBOL_GPL(kunit_platform_device_unregister);
> +
>  struct kunit_platform_device_probe_nb {
>  	struct completion *x;
>  	struct device *dev;
> 


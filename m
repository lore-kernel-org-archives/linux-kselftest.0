Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BCA435EEC;
	Wed,  5 Aug 2026 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938349; cv=none; b=OwXpnAJsSSPDSlKpKbl5rb12Sikms8S9eKji5KntpprPU114P3+y8d7T7NYi1mF4PfO1QPUDDEWqv5xzGm5NlrvLnnH9Nyu0leVniB2x2xSZthRsdAqcUMUzDZni357+fJFMOEBpgHL0BnpR0YjH8BLaFdFkyX2aw56eqdcKaQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938349; c=relaxed/simple;
	bh=GpbvtCeGEJX4AT1Dque5D2FRRDjYabu6h9B13i5ooLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhgBIqqvTC3fE94qKLfPGla8ZVbq4KoU1bNVuJATyvdtLOcy9iUzRGv+lHA5bCM1x6WW0ztvVTFOaoOELvYTV6YE2PxjjEc3dVNXDQg1s2tml2SLesXLWh4UrhTMG49xV5IabicasNy5BY/K7gTf2lhKV7M//jQ1xUjIB0ngicE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 655491EA8B3; Wed,  5 Aug 2026 21:59:05 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 72D9A1EA8AC;
	Wed,  5 Aug 2026 21:59:03 +0800 (AWST)
Message-ID: <2eb03d7c-08ee-4e59-a8ea-58bd448012a5@davidgow.net>
Date: Wed, 5 Aug 2026 21:59:00 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] microblaze: uaccess: Zero out destination on failed
 get_user()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Michal Simek <monstr@monstr.eu>, Brendan Higgins
 <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-1-6dcdfe12eb40@weissschuh.net>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260804-kunit-microblaze-v1-1-6dcdfe12eb40@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/08/2026 à 13:32, Thomas Weißschuh a écrit :
> On failure get_user() is supposed to zero out the destination variable.
> This is documented in the kdoc of the microblaze get_user()
> implementation and validated in lib/tests/usercopy_kunit.c.
> 
> Currently that zeroing is missing.
> 
> Add it.
> 
> Fixes: 0d6de9532663 ("microblaze_mmu_v2: uaccess MMU update")
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---

This test seems to be the gift which keeps on giving. Every architecture 
seems to have had a buggy get_user() at some point.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   arch/microblaze/include/asm/uaccess.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/microblaze/include/asm/uaccess.h b/arch/microblaze/include/asm/uaccess.h
> index afa0dd8d013f..77203af255e5 100644
> --- a/arch/microblaze/include/asm/uaccess.h
> +++ b/arch/microblaze/include/asm/uaccess.h
> @@ -95,7 +95,8 @@ extern long __user_bad(void);
>   #define get_user(x, ptr) ({				\
>   	const typeof(*(ptr)) __user *__gu_ptr = (ptr);	\
>   	access_ok(__gu_ptr, sizeof(*__gu_ptr)) ?	\
> -		__get_user(x, __gu_ptr) : -EFAULT;	\
> +		__get_user(x, __gu_ptr) :		\
> +		((x) = 0, -EFAULT);			\
>   })
>   
>   #define __get_user(x, ptr)						\
> 


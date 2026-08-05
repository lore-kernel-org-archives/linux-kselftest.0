Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C7746AA8D;
	Wed,  5 Aug 2026 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938350; cv=none; b=h+aTeAmlxMLgzA7y0p+jwvvJHhSdy1j59D1U9FWVWqx//VgNHwMGY2yfp2L3MkvwS8Za7V+zA8A0gWAv4yDjNP/FqWd/YMqLRsbz/i5nLEcLqFosVsy/15ZoM/ZajFiYcmi4Rj9TwPU7E3l+sXAmRzkq2UrZjTrVlmqPQe3vm1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938350; c=relaxed/simple;
	bh=yG1JN5abU9ZauHGXmEws9I5i1L3rBKB0EiBbBpFQdVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2G095geudPamW6Auu4DhpFLxiiSD1znB4Hr76ScKEj76sB13sR4XWCYZz8s4QLfHt5DK5+GZIEaMnRf8wkHtozNjIgrlTxqHSr3c4meix1F0c92/We4OTC+oG0YL7Agw6ZlX1bbGcvWxY9of+iE7Jgz0s6FBJMp9vPL8VmwF4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id F276D1EA8B9; Wed,  5 Aug 2026 21:59:05 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 7EF8E1EA8AE;
	Wed,  5 Aug 2026 21:59:04 +0800 (AWST)
Message-ID: <37db7181-3f2d-47ac-985b-da6b1828efa4@davidgow.net>
Date: Wed, 5 Aug 2026 21:59:04 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] microblaze: reset: Call POWER_OFF handlers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Michal Simek <monstr@monstr.eu>, Brendan Higgins
 <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-2-6dcdfe12eb40@weissschuh.net>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260804-kunit-microblaze-v1-2-6dcdfe12eb40@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/08/2026 à 13:32, Thomas Weißschuh a écrit :
> System power off might be implemented through sys_off handlers.
> 
> Currently these are not respected on microblaze.
> 
> On power_off call into the generic power off function which will execute
> all regustered handlers.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---

Seems sensible enough.

Acked-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   arch/microblaze/kernel/reset.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
> index 2f66c7963084..3612a20ca16d 100644
> --- a/arch/microblaze/kernel/reset.c
> +++ b/arch/microblaze/kernel/reset.c
> @@ -27,6 +27,7 @@ void machine_halt(void)
>   
>   void machine_power_off(void)
>   {
> +	do_kernel_power_off();
>   	pr_notice("Machine power off...\n");
>   	while (1)
>   		;
> 


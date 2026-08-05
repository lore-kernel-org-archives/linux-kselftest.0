Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE94248B7;
	Wed,  5 Aug 2026 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938360; cv=none; b=pEae67WOUooAOvinAc2le74g27OJ+STpsd3uof2/wVXjkcPnLlWRX2OW9DJ1XKzsNs9r9U13tWdjTbF3lcuj+sLteKd4zOUo8DRiTgqUIIS0hVT1ICISBS7o8bGUGmV3ZwM6vLQPa7mXEs6AS9l48bu5E4Ui7IgWp354lANjY64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938360; c=relaxed/simple;
	bh=/7rcCZHOlj5ck86kxGXbRrr+/HKbpWPWBpEsOl/1Tak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuB6lYyv8yq/Yv62SVpsyAdIYXA+447OoVj6Oh88lVfQOUz/cM6UeB0DDhly4+YMBoOEqsFjD6j12VEBWcrz+mLCAsMCVR9Eu/8RCX7iKUXNqHZpipOPsPZNIekw87ctFnm9FWZ/4pAnErVaUov8cU8HV+szQJX8SCI+eJpg2rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id E048B1EA8B5; Wed,  5 Aug 2026 21:59:16 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 302CE1EA8AF;
	Wed,  5 Aug 2026 21:59:15 +0800 (AWST)
Message-ID: <c9989a6b-5b49-40d4-b11e-51a278757eb0@davidgow.net>
Date: Wed, 5 Aug 2026 21:59:12 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] microblaze: reset: Provide a power off handler
 through an unaligned PC
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Michal Simek <monstr@monstr.eu>, Brendan Higgins
 <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-3-6dcdfe12eb40@weissschuh.net>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260804-kunit-microblaze-v1-3-6dcdfe12eb40@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/08/2026 à 13:32, Thomas Weißschuh a écrit :
> microblaze is missing a generic architecture-wide power off mechanism.
> 
> To enable KUnit for microblaze it is necessary for KUnit to shut down
> the machine in a way that QEMU will recognize. The machines emulated by
> QEMU do not provide machine-specific power off functionality which could
> be used.
> However at least the petalogix-s3adsp1800 machine will abort if an
> unaligned instruction is executed. An ugly message will be printed but
> that is not an issue for KUnit.
> 
> Make use of this to provide a power off handler.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> ---
> This is quite hacky. But I didn't find a better solution.

This is hacky. It does work fine here, though, and I also don't have a 
better solution. But I'd feel better about it if a Microblaze person has 
seen it and at least not complained too loudly.

Tested-by: David Gow <david@davidgow.net>

> ---
>   arch/microblaze/Kconfig        |  9 +++++++++
>   arch/microblaze/kernel/reset.c | 21 +++++++++++++++++++++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
> index 484ebb3baedf..0ca8999dd770 100644
> --- a/arch/microblaze/Kconfig
> +++ b/arch/microblaze/Kconfig
> @@ -216,3 +216,12 @@ config MB_MANAGER
>   	  Say N here unless you know what you are doing.
>   
>   endmenu
> +
> +config MB_POWER_OFF_THROUGH_UNALIGNED_PC
> +	bool "Power off through unaligned PC"
> +	help
> +	  This options adds a power off handler which executes an unaligned PC
> +	  so the machine resets in a generic way. This works for the
> +	  petalogix-s3adsp1800 QEMU machine.
> +
> +	  Say N here unless you know what you are doing.
> diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
> index 3612a20ca16d..4af660deed3b 100644
> --- a/arch/microblaze/kernel/reset.c
> +++ b/arch/microblaze/kernel/reset.c
> @@ -41,3 +41,24 @@ void machine_restart(char *cmd)
>   	pr_emerg("Reboot failed -- System halted\n");
>   	while (1);
>   }
> +
> +#ifdef CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC
> +static int unaligned_pc_sys_off(struct sys_off_data *data)
> +{
> +	__asm__(
> +		"bri 1\n"
> +	);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int __init register_unaligned_pc_sys_off(void)
> +{
> +	struct sys_off_handler *sys_off;
> +
> +	sys_off = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_LOW,
> +					   unaligned_pc_sys_off, NULL);
> +	return PTR_ERR_OR_ZERO(sys_off);
> +}
> +device_initcall(register_unaligned_pc_sys_off);
> +#endif /* CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC */
> 


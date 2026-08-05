Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE6D4734DC;
	Wed,  5 Aug 2026 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938360; cv=none; b=EvT7RKSFH/7NaLYde5l7wn/qpU9H/9GzeZVnUtINgHjehUAnfAZss2k4LOCAPooCjntdQUDQUu2v2efj/gB3CBlZPkIlOhqrwKjG/rpi05I04b4TYIqWed+LAVPch6isW/FikIe80WBkpAVTR6OP2MfYWhloulNOiculJIFDS78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938360; c=relaxed/simple;
	bh=2aQ1nPA1Vuo06psO2CNCgnVM5jtVA73XTwgJfLmOacU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXqgf5uDZYX8fIvUTDZi/1AiTECM7WlYHNcWhTwt5whMUB1AOh2++pMdMJo2VSpWcWYycwGuN8nLnfSrs2qgXOe2MDuXiQfPcE1FCocTb8WQ0EnvWtGjZXsCyqz1h7XfJimkgVG9ugP19WMqcMP2TDSLO4MTgbhx2o1ntbJcRJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 93ED31EA8BA; Wed,  5 Aug 2026 21:59:17 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 9EF681EA8B3;
	Wed,  5 Aug 2026 21:59:16 +0800 (AWST)
Message-ID: <42dfe558-f75b-4d7c-a560-449101bae4f5@davidgow.net>
Date: Wed, 5 Aug 2026 21:59:16 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] kunit: qemu_configs: Add microblaze configuration
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Michal Simek <monstr@monstr.eu>, Brendan Higgins
 <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/08/2026 à 13:32, Thomas Weißschuh a écrit :
> Add a basic configuration to run kunit tests on microblaze.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---

Works well here, though there are still a couple of test failures (and a 
longer timeout is needed to get through them all on my machine):

 > Testing complete. Ran 965 tests: passed: 866, failed: 3, skipped: 96
 > Failures: blake2s.test_hash_alignment_consistency, 
memcpy.memmove_overlap_test, printf.dentry


I'm okay with this going in via either the microblaze or KUnit trees. 
Any preferences?

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   tools/testing/kunit/qemu_configs/microblaze.py | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/tools/testing/kunit/qemu_configs/microblaze.py b/tools/testing/kunit/qemu_configs/microblaze.py
> new file mode 100644
> index 000000000000..ff012095e77d
> --- /dev/null
> +++ b/tools/testing/kunit/qemu_configs/microblaze.py
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +from ..qemu_config import QemuArchParams
> +
> +QEMU_ARCH = QemuArchParams(linux_arch='microblaze',
> +						   kconfig='''
> +CONFIG_CPU_BIG_ENDIAN=y
> +CONFIG_SERIAL_UARTLITE=y
> +CONFIG_SERIAL_UARTLITE_CONSOLE=y
> +CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC=y
> +''',
> +						   qemu_arch='microblaze',
> +						   kernel_path='arch/microblaze/boot/linux.bin',
> +						   kernel_command_line='kunit_shutdown=poweroff',
> +						   extra_qemu_params=[
> +							'-M', 'petalogix-s3adsp1800',
> +						   ],
> +)
> 


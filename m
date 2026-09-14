Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD70633260B
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381549; cv=none; b=GP25sz8tKORJqbuXpY+r/CkdJXper5Cb7Uu8RZLOjJv5XM3y7+8Ykiw8kQyY+qAYxk/3Xs4wyyO1oPMo6sHPfESz02xBAeAAjfdzAsiwswPy2ZY7MMC1/R0eQIaMKAoSr/DFm0a1MY/ZhEJV02IeHUu97/V6coPsi/JNUVsPVVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381549; c=relaxed/simple;
	bh=REIrSaykx4LWkDbfveszVkDpVcalomJLt6NcRuiOo0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDrb1jLTSVG8usf22l755vSHfWMrRn4OdTYAaRQBIkqOhB17LyJSAWgg4p4WPBO8XaX5jSR7V2LHP4YK7fZSeEZP8yd6AwTFxXOiJsGRw7IZQt/hWQbYwgWbLxKdJCUUNLeUciRxgJFIZt0I+nAvMNwDRESgJ7kfAqa/1vOTdk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=nfhqI8pD; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="nfhqI8pD"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so3468621a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1789381544; x=1789986344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSR88sMEFJCoCvAI0LTYFAxIMu+azVship5IZj/cgaI=;
        b=nfhqI8pDwStp6fX6FUPVfTqrZNoQYVEVz/kT/NrDS7zhUFU92zRSSTNGv9myCcWIeU
         wj4C9Ga1/8jE9At9uwo4SRwgp1zA1QDJWXvBQYNMmWqsGTzAUglZ60IUt++2utZLssg3
         tAJ3OKrELBvKh45ak1IzxGo+EwDDUdogVLJe1l8yErkFkpRvWsLR3hyLWq2W1ECkZGJL
         sSnqy870lK0Du6F8ts4IdWpkaHIQ989tLY+TqPAgw8oLKfj/vR77amvBUYZduEXxlEqc
         1FlRXypxYkJhBgDvQFA/WLWfEAV7ZUBwxeS91ddu0MRVwizENVT5g/Ne7NpWHxbFYWB7
         nh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381544; x=1789986344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSR88sMEFJCoCvAI0LTYFAxIMu+azVship5IZj/cgaI=;
        b=FnUNem+bufw4O7KkJ+93VMqT04GKB8fFnEkuTOlA+IqheQoxF7LbwoqfNJ+u5r0nUz
         aEhjoBLU6ERXug9NLxuWsbdaR2aFFBiSmG9j0LmhhIvTWDCegxOpy12pEEwTFlRqqSBh
         9vFPmqiQ8wzLtGppdszdLd0r/Jr/53nJtSC1yAcBCwVtKMxC/BK7eqVcuIVZFwIKwflk
         pvo5GGLJmJlEFhOrQoxfxd4j37dk/t6H0M7eLOxnvSRcjfBvMr7NVn7j7Apnql3SUzXN
         p7+S9TbGk+S90dirLjIPuhMdlPGCTkWytL1iYKmZjhnLewX7Ul2tjbjNe4FuF0rniIxy
         9h0g==
X-Forwarded-Encrypted: i=1; AKwUvBwrz3etN/7ISZ3CE14kOfcWrsbSP19a5YaG4wL45dWbXcIT0HRGKVtGLFK8WEgKpilUOqGZlIyqVEv5g3xw+nY=@vger.kernel.org
X-Gm-Message-State: AFuF++mLxEFLNexEHCrojWx9fpCuBreGl3y+N+Y3GuPj3dLBwsHuS7GA
	YCnEcoQU9JmAAhVZSCy97c1VzTT2rs5bNxX2hoklTlu3FVrTu+TrV9tbw21ullE5Fw==
X-Gm-Gg: AYBFou0q6U8clicZq2vJbXAmOGrtLmCb6jfcPkRagrxWDLZDfSgg55qmgjr0o9UBeUV
	OKA/NIjErgFrDYgbsaCE2+N9y3Myo6gVG9wUHvWFKMwd2vnOfwyXlVDmSddHoMczNU7j2Hs7D9Q
	D+STH5nMeNClcUOWQPmQG9WrLH9MDIYvbJEpTskZuf3G92MLQh/REOzeHfrWLjEOuehFB/PPqBJ
	YSbeMVw69KF8/a+n2xhPwbIhM8GVRfVXd8BtH0jtPg2HPoK2cRRHvhELDnIpd0Lyv7LfliRE4xp
	HTLwWmj1+fIi9o1bfbANmZ+oa0DlXkkMMB/AFPUsRVWNCiVKpninWNuq1p/B/X5gT67hiQQtl3T
	Aje0eciyaC2L7u0zHx0sBoxduSQfiFdKS6K/Y4+Hdm6ovQPX/pd50Ec6qzXJauPKrJeeSKmaezN
	zGZpe7geBbO8oaBsfuJYet5p6rkhK6mby1OtdRd9fka1cwklwsQqlmRBh5EQtnyt2yoeGc5kcTZ
	d14Oc8f8HJYjPu8JXpv4venE0CwVZ1f1Q+QU1cLPiukdHs=
X-Received: by 2002:a17:907:c13:b0:c26:1648:a06c with SMTP id a640c23a62f3a-c29b8770a38mr127537866b.39.1789381543301;
        Mon, 14 Sep 2026 03:25:43 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966026fb1sm418149166b.11.2026.09.14.03.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:25:42 -0700 (PDT)
Message-ID: <853c3881-1532-4332-ad5d-2f3e909af552@monstr.eu>
Date: Mon, 14 Sep 2026 12:25:41 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] microblaze: KUnit support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/14/26 01:50, Thomas Weißschuh wrote:
> Add the necessary prerequisites and configuration to run KUnit on
> microblaze.
> 
> Please note that various KUnit tests might fail depending on the
> kernel configuration as the memmove() implementation from
> arch/microblaze/lib/memmove.c seems to be broken.
> 
> gpu_buddy.gpu_test_buddy_alloc_exceeds_max_order is currently also
> broken.
> 
> Intended for the microblaze tree.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Rebase on v7.3-rc1.
> - Pick up review tags.
> - Move do_kernel_power_off() after the message printing.
> - Little endian support.
> - Link to v1: https://patch.msgid.link/20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net
> 
> ---
> Thomas Weißschuh (5):
>        microblaze: uaccess: Zero out destination on failed get_user()
>        microblaze: Pass -m{big,little}-endian through KBUILD_CPPFLAGS
>        microblaze: reset: Call POWER_OFF handlers
>        microblaze: reset: Provide a power off handler through an unaligned PC
>        kunit: qemu_configs: Add microblaze configurations
> 
>   arch/microblaze/Kconfig                          |  9 ++++++++
>   arch/microblaze/Makefile                         |  6 ++---
>   arch/microblaze/include/asm/uaccess.h            |  3 ++-
>   arch/microblaze/kernel/reset.c                   | 22 +++++++++++++++++++
>   tools/testing/kunit/qemu_configs/microblazebe.py | 24 ++++++++++++++++++++
>   tools/testing/kunit/qemu_configs/microblazeel.py | 28 ++++++++++++++++++++++++
>   6 files changed, 87 insertions(+), 5 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260802-kunit-microblaze-7a3f6ac88b4d
> 
> Best regards,
> --
> Thomas Weißschuh <linux@weissschuh.net>
> 

Applied.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs


Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E03CEB8B
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164132; cv=none; b=M9+JDWqZjKmP8yaAVsyJzDYrSZOMsZ9d2wm5k6oRMwmOI/e2+3VMuLHPyAIaaYsw5vpRA2XdaI4ROrgtYgOrFwKKJKZ4hYUsLBM7NvahZuiEPGYVPQCQildA5RN6zZti7z+LTNxJbTWhKF/wxO2WrtDxD7JfsGqXLctE3AkXiWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164132; c=relaxed/simple;
	bh=Buhbz898X+Zwy+ACjKQMw5UgJ8wruz4B6fZ3hHsGJRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTmJbbslAHvmJ1lSmDgfVFJopl+HnuRcBEACGM+ui3XRJ3eOvXt/gncvJMNEOITEegzkBqateSZJw9QmPsJkAjMw0rziU+6z0D2Joo/t9iZu5+PyNh16sj2Ht8LG9MXvILqnQk6Xq3XxRGklxQVeJrv6Aym2N015KU9dcX5WdOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=Ji96pOZ9; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="Ji96pOZ9"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1c52d920b8so386363666b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 01:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788164129; x=1788768929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07XOke8MZcakwnBV1pfCWoo5tuEKqxVaUuHzsnaos6w=;
        b=Ji96pOZ9dXBUU9Aeu5+mrG9Sl6VQ+ALpzv5Bs2PEjYZ+wLmvxoYLOptJi6d5Aut2Ee
         rCF0s8dvzoHHOWP+o11veM3g6OsShUB79QIcqDfRvagY5AvnBHWPnEJHS83j+k5og49U
         z3FbNWCAsBgwQeIAaf3FKTkSkYCmQ3/GdESb+54tXHAjTAB3Gljm+wVk7O84fDmbTsPl
         s7RqZGzYZlnbw+0UvhSylXIRT49doUKz/25Epv0hI1glPcBt/aT9TRyvC9OLnn8rdS5S
         SNrOCimFEA13BjFz4GtOVdfD8SLxrqYPixlgbchh6jFj/kXpYuIc0psLEHAY/uviKfYq
         ODww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164129; x=1788768929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07XOke8MZcakwnBV1pfCWoo5tuEKqxVaUuHzsnaos6w=;
        b=IncfvYGIvyz3jOY2elfr95hGICPCMZZjlXgVaSE9kcQdYbwJzAAbvj09slqjG3u5Ev
         8PhMF3TyHhzaplcRhuCBofmopn2r0xoiTU9xJSt7qGCvi4LQoK54g9xDUTWNg07p9vq7
         Gg8MfdEtyPDzxbZwyppMQkt2hbDgeLoXos5BF/9U9z1mEyTuxPsTIRZuYWjyFttQJq2b
         oD7JQ3uV+qbcLTX8pU9GhYkDy5VRoWOgDeIqislOed9N8CHxbE4iSx4QWs8FikOdb+SE
         MG1wz7CTpoyD7CMbvlFeY8tFNe7zLXQDjVIINIJIOfcuUglEMo4MbyJaw+wWa0x3qdtx
         12sQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+3SR0ps7pvFeQx0jUyT0KLNgPQwUdtIUh83vWvMC7kjzaxMVSiWeAokxruXb0IhxNyy67I9cIJTX03ZSG2+g=@vger.kernel.org
X-Gm-Message-State: AFuF++lXrSU3wXO3On2Yjy04k+6kpnwb5iggKdbPyuWSS36MBf9ga0e6
	XgonVHwnSNx6enggnAeII07fckolgQH/SB7gbZ35Zqt2njZmFiG8nnmsKUgIhrO47Q==
X-Gm-Gg: AR+sD11q30FcpcX/7buYlLIb6938iBjz5kV9znHD5H02a/vD4xLEqaIsjubrHKSjFmL
	VVEbggqmNFh/nWAWyKLXKJ4kwH9LiRLYLauXB5PcVn8JBxINYLLnbh/B1Z2ZaUJODzbpSj3eq6R
	RIBUWQIMVKjQICrhJJjroH7b9z0dU52ct65B44l5MLXJcoaqpKXOy3irIs4ms88Espww+HBIT+5
	lLfxuVfbK+osQHflApKNOQfEbvLUDoULH1txndC7tcFXATfWhO3kngk75BF1wnLPRgHIIMoIYkE
	RI1rNbvkWL75vLK80SJyANwUU8unNW7ANQoPKozuUaAaeih08RKC3JLkR15HM6srATTBprMMNvv
	+s1pDpUfI0bXQHfU+hDufxN9hVXnsOZDPhlMDcKaDDeMW0Uz4cEcnP56z/z9ztc40ZICRndRCU+
	AC5zf+YTu9pUeC8kRBX/UL7XD7w6RPLsdsNVW8Sa+Cr6bbQ7BtFIj5vyieHY7Xs6XQfI2Qdm9iG
	rPCLV8I8StuIsvKwNhYr9w9+0SYq/eFDTFo
X-Received: by 2002:a17:906:fe4a:b0:c25:5d2:acf0 with SMTP id a640c23a62f3a-c2556c4611fmr1467365166b.8.1788164129415;
        Mon, 31 Aug 2026 01:15:29 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee28677sm408971966b.21.2026.08.31.01.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:15:28 -0700 (PDT)
Message-ID: <ed8f89c9-ef2c-4566-b296-974f73bd1b54@monstr.eu>
Date: Mon, 31 Aug 2026 10:15:28 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] kunit: qemu_configs: Add microblaze configuration
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
 <42dfe558-f75b-4d7c-a560-449101bae4f5@davidgow.net>
 <e11bc960-b31c-408a-a57e-631e76806bb5@t-8ch.de>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <e11bc960-b31c-408a-a57e-631e76806bb5@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/5/26 21:18, Thomas Weißschuh wrote:
> On 2026-08-05 21:59:16+0800, David Gow wrote:
>> Le 04/08/2026 à 13:32, Thomas Weißschuh a écrit :
>>> Add a basic configuration to run kunit tests on microblaze.
>>>
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>> ---
>>
>> Works well here, though there are still a couple of test failures (and a
>> longer timeout is needed to get through them all on my machine):
>>
>>> Testing complete. Ran 965 tests: passed: 866, failed: 3, skipped: 96
>>> Failures: blake2s.test_hash_alignment_consistency,
>> memcpy.memmove_overlap_test, printf.dentry
> 
> These are all due to the broken memmove() implementation.
> 
> It should be fixed by *either*:
> - Disabling CONFIG_OPT_LIB_FUNCTION
> - Enabling CONFIG_OPT_LIB_ASM

Let me comment this in the patch directly.

> 
>> I'm okay with this going in via either the microblaze or KUnit trees. Any
>> preferences?
> 
> None from me. I would have expected it to go through microblaze, though.

Not an issue to go this through Microblaze tree.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs


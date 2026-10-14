Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B895616AE
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 15:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992909; cv=none; b=ACZUkXiBLA0hlF0BCYISy+YFcvQosAhywVOjkpUqQ+uZRoe7eeGLbR6XfOIVACbXN75XPnXXoDC0n5/YwgsyHorQ6XciTD/DOKLRA3M3DDCydXaN9ug+G26W9CmBvt/9l4LZkLV5gDKLXrB+77+kD9X8NslNIllMo/RYh01InGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992909; c=relaxed/simple;
	bh=a/8E072az9TqNHLpioLquDWQWwqCcSa7yW3WWTPze/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AzE9dJNxQfIAj1Gqjaht433aIgV1/VFSjIM1jpGEVcz6cyZ7RDlzyaDI0q9UoZcXATbRYiVBDAZQe/IagemmilI+2J7CZkUOM+XjkjC2VfcCQ1sRkll2arSNduPE9FYFEEAm0Txe5M54DN9ddwx2K2HkTOpy6Y+st25LFlR4hgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d9VB9f63; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d9VB9f63"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f48c750afcso759443a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791992899; x=1792597699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3h7V9jz/etfn6h0SF0dpBgn4IBujQwOBPWBG/0f6sUE=;
        b=d9VB9f63WVnp+oPh2oiL/UmkRHgA3vbnlY6DHN2FFxcjrO0+v312PkvTr57h8WRWsZ
         fnyEvneoJ8OWw2p0yFiGpoOIKvCfp86wNCRLJkGlNhVyZmT4s0LJL64lLm8HnEW2ro/O
         /HTMCUaNsldip2fp+EfkdTvN+AIYP2B7c8yaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992899; x=1792597699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3h7V9jz/etfn6h0SF0dpBgn4IBujQwOBPWBG/0f6sUE=;
        b=wG2q5p37jo/eVOP9l07uwYBxSDTqVH0Mmbs7lKC13jXIvQoY0370kn1JmHIMSHxf+P
         F+60Sf6Imk5gMoxw4ryOtOR/CDEAZpuKjxXIfT9i4k+Z/XAmRbnc4I0Q/ZM2z+C2h8v5
         Kl0vKQUKz5K1Fo/JhUbZJuXHbMzfqK81Oa0o90/xz4Mwqt7cM2NP3nuZ4aDhe6ZZCb7N
         EFZxrecSDmL/Xr8Un/AHWuH1ehATPmAkh9rti2CvbgEBxmYNzYkDgeqU23Nba6I3GNtL
         2DVqYC2NRxzlo7KWM4DKdYRX9moHNK0kZ6kzUEoJF8dbTfEiN7mIM1FfTkDqdazM7cvv
         SFvw==
X-Gm-Message-State: AFq9FYIT5NQ3Vzrat5p7g6xnHW1Ct/inYqGRlY8z5iIf/E8P7JacIhSU
	wc6Bhg5evVm3ZnkxDAbjo4edpqUiIW91ySoWdUA8odEXLwlVJGnbG85PhjDQUvJwe2FAENBgoM8
	WE3DPsh4=
X-Gm-Gg: AYBFou2s9PK6CQIOGEiTrTDWxP0NyOyQJ+wRMQ4K648w8TIDkMGxyicFrRXytdUy3sy
	9tBCANVUireghki/p8tgz0xU64w01082JbKHNp/B86H7PQ8lxZspTx2jgPmxIeiO6zk89ubEQ+5
	2qONnou8Skq6odNF4gXxQdmk7ajQYOFSjqntLCoMmt0QxmMfgER0hpYFncZu4/7phR2JlYyDxEh
	14pb5z13odZ9cNUf8hqdYe0EM5QoM8H1HbioV3CT3jJvez+D24GuBqpsfJZS/Nvb+qANmHvL74A
	NDh2OgWpOKwp65vYumcimHvDVEEeseFULa5w15sOpyc2YJUsFjgDrKcYFF9n/9lNZDYGX3f9aOZ
	JmEI8iT8d+9yNKEztIet+0NbZx/hMERmgq0lMo3U7dPX/3fQgXzvdPuCuBFnm3XH3bC0mgsro1n
	6537owz33JU6RT5+3AF6ikt4KGATUdzWm7vgHlRfcjDORfB7Fjdd8zldA//R2VtmYM+NxqI2kTt
	3czE3Yq
X-Received: by 2002:a05:6830:3c84:b0:81f:b957:abae with SMTP id 46e09a7af769-83090e15bb3mr14254616a34.1.1791992898993;
        Wed, 14 Oct 2026 08:48:18 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a47048sm15062632a34.19.2026.10.14.08.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:48:18 -0700 (PDT)
Message-ID: <1f1b5c35-fdfc-490d-9196-97621915140e@linuxfoundation.org>
Date: Wed, 14 Oct 2026 09:48:16 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: lib.mk: Don't fail install if no modules were
 built
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261014-kselftest-lib-no-modules-v1-1-e4f7208dcb56@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261014-kselftest-lib-no-modules-v1-1-e4f7208dcb56@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 07:03, Mark Brown wrote:
> The install rule for TEST_GEN_MODS_DIR copies *.ko from the directory
> with rsync which fails if there are no modules, for example because the
> directory's Makefile skipped building them. Only run rsync if there is
> something to install. This currently affects the livepatch suite but it
> seems sensible to fix here for added robstness.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Thanks. I picked this up for 7.4-rc1

thanks,
-- Shuah

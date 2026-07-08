Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C3737C11F
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517570; cv=none; b=N4wAkuM0OGf+nsa6S/BWIGt4QIq9onRTwBZFSrrhlPZCBH/OU9qmI6+KPcqQ9rNNcE9gOQXjPh0/ulpHXxdvyfJeEPNU2rw0z4G+9/xkNRwDsTkGB21Q+ISPBNTPcyooDFpdm67UVSFfDrYhsAKqqZ74NXTHyukHDluwL1ndHtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517570; c=relaxed/simple;
	bh=TBQnnf1ISW62j4RHZSvYvNLSTDQ9QzUk7AAeKMrk3ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNiHr+kqdTGys7dQ5BnomPNbKWSMszSnytK4CgNnjSvPZgZTWihCbKFoKEz3rNZuCdVfc15d7ofGG1aqp3efp0rCLSnd6MrBnZ1BOk/BB1vyGDUMSMDePpUeW3+JnkrCFesSBEP/HLe9pn5A/XR7IYB0BCtn+agAfCz4Y/65+GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AFqRtKVD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XKZAolcw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AFqRtKVD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XKZAolcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783517566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6QdbQflS+GfJz88gA8xHxJyZ3hxbQBYcalujojmxh0=;
	b=AFqRtKVDAkuq1QAlDtl0YRKn80Rk7Wd/37g8N9vMmb3VZ8F7LNjxYLWlHJzOvT/frKVVE0
	Fll6VkYvWY4qsyRFo+YuGG1nn9whnEXtGY24e9zpoJbXvX6JbcT4BJOMY/Y8CBfvsMXNVT
	TbXIL83sF1q1FImlaPKM1QLoPM+Z0ig=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-mEEME8FfM4CTXY31q40bWw-1; Wed, 08 Jul 2026 09:32:44 -0400
X-MC-Unique: mEEME8FfM4CTXY31q40bWw-1
X-Mimecast-MFC-AGG-ID: mEEME8FfM4CTXY31q40bWw_1783517563
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ac0a54110so72867185a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 06:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783517563; x=1784122363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6QdbQflS+GfJz88gA8xHxJyZ3hxbQBYcalujojmxh0=;
        b=XKZAolcw5ErbQbwpF6UKOiN0HNqCoVzDuKrGMaTezgEbNMntK8YGp/2apCjnodGbpp
         9nFOmca5h8zmL+7k0O4AD1hSJhhWyjCAIzvwTKa1kjZ/YrQDP7tWBKQlNWM6mlBcGD/a
         D8zt0LnIw7pEB4LjuTVfQkt8r8mTWnu610Q5Zpu1rWKbxC5DCTZ4eWbt4M+UcMoKg1iI
         NuhUEUjQ8NlyBRnFoWjMqTLP75qwxWjV1aIicMmUAkFFJauZoNuOfZhtiPejx73AxlPR
         TSp+FzXxMKcb/jKx+A4qpLiWnh+Hx6gsUbggotBEZsUqxywLK0XPlWkzv8h5WGTiw+rI
         bbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517563; x=1784122363;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6QdbQflS+GfJz88gA8xHxJyZ3hxbQBYcalujojmxh0=;
        b=eHz7WW0zlBLfLH986P2TZRpNpGlCT+Qf/RwGPwp/Qc9WV3zsvp/1U/E8SXMlHT6/HA
         lsWvXQarCEFoPufx7ijiwxq8gTnkBmGmfIUZcP8zqHWj9N5kC1z+x/CaeV5EscusN24t
         Ahh7HQoB157vCGtlVkvXjia3+dV1YUSsUmP4AlijPJoAlf2lrd8J3hGVPyM2rGDwrWK1
         nz/CLvJp88w9H+tRJcBiJ+0+UoI8hxBwWjf2fZBDMAiJi0H+4WnjI1C+pC3jyjEPBx3t
         EMvrfpV8lyGy0fviTcqBUcupH6MJ/g/39SorOZmIIFBgTcpJIJxyiV/HUa2USoAyd0iK
         OTzA==
X-Forwarded-Encrypted: i=1; AHgh+RoCBSBWNR7hIOHaPmw/47vu90mcAE4KPaywLROXjqj4GKZAQt+++R6U5O4Lk5cZObACclTqv7uUGjScInyioaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrAUdyKyq85r29oK2t1QiO8U3oEYwfyeusoaCsbBOE4wtEi2IU
	1h/8YsD/1aGvDN1eE9LDc6+B9oykyD+vrlpKdU4VyLHyN4HtkgLaevl6C1xnJXZef5oJPJjxe5p
	d940DLtxxyQdD6ZfVVO4xTOYm3H1u6K3Rmtla3i8iC9RniJAag4Y7PDC9ho36aP2eWKig6A==
X-Gm-Gg: AfdE7ck8zinLw0s1q/D+kOQhi0IdQNGKoKnP57Pfd2aFaR0jPgM2CYvv1BtG/CLlCwW
	bDwTRxFR8Np0UwuslHXYAQcwLjqbNtgKxrgiADH+KAU6bSaNc5MDglJmfZWh7WsQBxuaGnA2L/v
	SqtZjcSsFNS7CCV0poEGCbnWZq5AvonZ6ANFC7jd4mQ5zuzaWhFRDrSAONsh+hZjamdUGV8yGUJ
	HqNpwEy8Qk9VeT3ggVg1ax7oJ1xCbmEo7zMFtkxcXscR4ekuh+kGhiNtOpOMNREr06zhRR/MJnp
	VJgf4wZIE1bg+OX/pknhPUQKhjG5dUIq7Ub2cSh/pjFeqkkC5TVNxTR6Pxr+HP8mu6f5RG7Amgr
	z2CTNjQsvUQ==
X-Received: by 2002:a05:620a:46ac:b0:92e:c197:e9f5 with SMTP id af79cd13be357-92ecf92af35mr203843785a.77.1783517563398;
        Wed, 08 Jul 2026 06:32:43 -0700 (PDT)
X-Received: by 2002:a05:620a:46ac:b0:92e:c197:e9f5 with SMTP id af79cd13be357-92ecf92af35mr203839485a.77.1783517562934;
        Wed, 08 Jul 2026 06:32:42 -0700 (PDT)
Received: from [192.168.8.207] ([45.81.3.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ba7e62sm1430433785a.13.2026.07.08.06.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:32:42 -0700 (PDT)
Message-ID: <d434fecb-5df3-4ddd-b2f8-27194a9131b7@redhat.com>
Date: Wed, 8 Jul 2026 07:34:17 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bug: fix warning suppressions with kunit built as module
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>,
 Albert Esteve <aesteve@redhat.com>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 brgl@kernel.org, stable@vger.kernel.org
References: <20260707125837.57256-1-bartosz.golaszewski@oss.qualcomm.com>
From: Nico Pache <npache@redhat.com>
Content-Language: en-US
In-Reply-To: <20260707125837.57256-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/7/26 6:58 AM, Bartosz Golaszewski wrote:
> CONFIG_KUNIT is a tristate symbol but the warning suppression code in
> lib/bug.c is only built if it's built-in. Use IS_ENABLE(CONFIG_KUNIT) to
> enable it for a loadable kunit module as well. When using a plain #ifdef,
> the suppressions only work if kunit is built-in.
> 
> Cc: stable@vger.kernel.org
> Fixes: 85347718ab0d ("bug/kunit: Core support for suppressing warning backtraces")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I ran into the same issue and found the following fix also resolved the issue.

Tested-by: Nico Pache <npache@redhat.com>
Acked-by: Nico Pache <npache@redhat.com>


> ---
>  lib/bug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/bug.c b/lib/bug.c
> index 292420f45811..b9820a0226f5 100644
> --- a/lib/bug.c
> +++ b/lib/bug.c
> @@ -219,7 +219,7 @@ static enum bug_trap_type __report_bug(struct bug_entry *bug, unsigned long buga
>  	no_cut   = bug->flags & BUGFLAG_NO_CUT_HERE;
>  	has_args = bug->flags & BUGFLAG_ARGS;
>  
> -#ifdef CONFIG_KUNIT
> +#if IS_ENABLED(CONFIG_KUNIT)
>  	/*
>  	 * Before the once logic so suppressed warnings do not consume
>  	 * the single-fire budget of WARN_ON_ONCE().


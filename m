Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90CA340282
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095938; cv=none; b=cH8gqLrg+dMqfStY9IBJ8HXOmGY4/s1Bvn2Rs07u6mE9nMQ30zAuuQ110MLbsNvdnEM+6g+aK92YQ4t3DgTo7qVW4eZHQJIbOngv4flnhgmYpGkTab1PrUF6nURZ1AsDnxRXFt4bRBXErzOqduWwRvFucUBiOcz9x/dH/0Zl/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095938; c=relaxed/simple;
	bh=Tdp+mcITKsiIvySwDVpO5FTy5mQWlwJlxWX9gnP5yyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JARaNzGNcfj1meYa/elBJHGhiJuy+DyNk3yZQsZsdLeqxOT3QkwO1aCyvfBkwFLAmw+y2zk6Owoj6sREf7+rmqHXbSAK+1gC4IRAh0/bQE17nxhpjbdOpOUH0lvOF38xWIv14fSqXY/Z6KLGSFvi67rtuYrYoqGKlh5nWycgGTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H2HNf3MX; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H2HNf3MX"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-415c8a4d2e6so2072954fac.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776095935; x=1776700735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0mLEqSJkZyHQgnOUF59T99Z8znx2jxsYBHcn5qzOMI=;
        b=H2HNf3MXI34QGLk/inzZg/NJmrLbBzjh8eMfYTpo7NCaBYbmfnFyM8XeuqFau1/E3E
         fBmYZdwbH6xVtPffM9LFT54aA3HW5/Fq/2GWUSOA3sH7u92BbweAySEXmEqsD1/7RKAr
         oZLpLA0YBkexEP69b1BxuDz0u7pSS16Hg4xIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776095935; x=1776700735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0mLEqSJkZyHQgnOUF59T99Z8znx2jxsYBHcn5qzOMI=;
        b=hujheFvZZRWZY1hbu6hoC9oGEWoa8XvQcKwPwbhRqysiza+83SGw6YoX4P5YXt7npy
         KtJaIUCefuQD6E+9Rzmv89Z0a8CBMpgfVRisjj/84o3My3N2f5QN6fjLnyTS66Wlq63X
         Fai+fHTqZb3iaD1fMybAelRxPgTqYP1TGpaI/jv94rYN656Q0U2JHNb0izk3yawHC5rW
         ynHdFbPMCu2eUOjP16PeJFMpOl1Uxh4mhWfhQEohNIOUBlDWGusunAlEvJU2qHQrINX5
         QpGvCmEYnTOUDsrRewU8OAlK8+3/jaNVuJcsf0dVKUckztkkXVFcXS7Evb3GNIgqoEkb
         iMPQ==
X-Gm-Message-State: AOJu0YyZyYFHSjxkgNY3/4YuBHy07YISU4Six+KEM9sybWcgqbfHFzzb
	a8i7xuFRFKzgCzDmZ9kO+Gdgi81BxpMgZqb8N3/8YcHhQ4i9PG9B6jKTm2w0rAfb/Yc=
X-Gm-Gg: AeBDievk7kkZpZIvtHf1BqLk0iFpkH4/Y6qeeum1TSP/8EADOkqtrcfmbx0iRDtac6m
	u3qiF6pg5cmY8H8vrr8QiH8HcmyWTWzxQc4/u5ejywgbgxnmHEXPzDlOik3PICdlTMLzxtmh8UN
	yrYeEfcey7GcdcUCdzCIWBapyqsRQlv7Aa2Kf2hq+av47C//q6E/vI8RrtsZvnuUWjhpx4xY5gO
	Suq9j5D9IOxCt2WeV2VXcdLNlWaFZR/J1aLDz83HZzTJbqKu6yvEnMNbFUwB1zyl8G0QRPiaBNJ
	8il2vvIDP5ocKQYdBKV4fCkh8EfHOSvK5kqSDPAftejxNGsX7ANXsKcqiBbNgRT7n2WaRPchJJ4
	wMMrz/sma5QiCPjwcqT5OF7Fz8K5aticMjSxLkD3M5Ns+cAJFtMZC/L/dJcY4blzQ0FLaM9zwQ8
	mqauaZAupc3BW18vUr3Nz3vZjwAEe0nqDQq6twOBbCQg==
X-Received: by 2002:a05:6870:1604:b0:422:f3f3:5082 with SMTP id 586e51a60fabf-423e102d530mr6937269fac.21.1776095934648;
        Mon, 13 Apr 2026 08:58:54 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42410ac4858sm4857171fac.7.2026.04.13.08.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 08:58:53 -0700 (PDT)
Message-ID: <7287249f-3afb-487e-adec-8cf08ae7b1ad@linuxfoundation.org>
Date: Mon, 13 Apr 2026 09:58:52 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] kbuild: remove kselftest output in mrproper
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-6-79144f76be01@suse.com>
 <0db1075e-4273-4504-9c3e-1a9f35d37998@linuxfoundation.org>
 <227fd478-581e-462b-9579-afc5028abced@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <227fd478-581e-462b-9579-afc5028abced@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/11/26 06:49, Ricardo B. Marlière wrote:
> On 4/10/26 4:19 PM, Shuah Khan wrote:
>> On 3/20/26 12:29, Ricardo B. Marlière wrote:
>>> Selftests built with O= store generated files by default under
>>> $(objtree)/kselftest. Those files are not removed by mrproper today, so
>>> stale generated artifacts can survive across builds and be reused
>>> unexpectedly.
>>>
>>> Add kselftest to MRPROPER_FILES, so that the default kselftest output
>>> directory as part of mrproper target.
>>
>> Does this change remove kselftest build objects in-tree builds?
>> It didn't for me - also there is kselftest directory under
>> tools/selftests that has several scripts.
>>
>> Can you test this for in-tree builds - I would like this work
>> for both.
>>
>> I dropped this from my next for now. This can go through kbuild
>> tree.
> 
> OK! But please also drop https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=next&id=33880424308df3c2e39fa88ea74f051205ebb7b4
> 

I can do that - you didn't mention the reasons why you want me to drop
this one. Do other patches in this series depend on this one?

thanks,
-- Shuah

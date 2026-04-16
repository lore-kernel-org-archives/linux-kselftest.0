Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A282E34DCD2
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374134; cv=none; b=UgPD2cI6R0QJVpi2ol696zWx6L8j2/QOgVTHaxpy+18EbjjdB93udx6VKNVGjJNu46JpoibsX0Hi2YP9r4mYXFzxymrVmvJWQpkA4aUjA6USZ1/ILR6cFq/xfJm1yaGfnfE39hOplEaK62t9ZW/ucTtrERougIaivmX9YyejRJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374134; c=relaxed/simple;
	bh=I1bLt47VSjWaeL4igpmdpjI+SkBgxLH9XmCMOiEEmaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VzfZFoT2r9PSnNJ2hEM/wUcyFTZR8s0fSCZGPihYMBVdcKWou/mHN+Y2x1/QrIPBZcrohG9DgEyAElqCC1q+wxzDm0T5Kg5PeemMb4Q45ThXgrFxL3pnbfY95+ALH4QwN1fwg135p9dfTe8WaK2IV0PPbSKBvN9FePoHNPIbcVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S/b2f6n+; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S/b2f6n+"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-45f053b7b90so30257b6e.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776374132; x=1776978932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHMQmXQQ5iVP4ZwbqUQmktHmPMGw34HfaBhpS2wli1c=;
        b=S/b2f6n+sQyL0NMCCzf4/LH+xamwDbL0YP/5Oyob73C1FpVTmAuCfQ8aqILmhbkPMt
         2j7DJpX1VaUkFCUkaEhnUbOAvrPGfEGav50CF4XVcft3k0QM3jln1kYa9/rhwwSHOAX0
         b6QRbWchb5s5Usu5rLPwh2j8E2bjFjC4zkdyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776374132; x=1776978932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHMQmXQQ5iVP4ZwbqUQmktHmPMGw34HfaBhpS2wli1c=;
        b=Ki+R/rE7KoYCAg89Kjz99CtBgd3W4a8JGtdC/24c6E9X8eA5TidDgPkfoEiEaqxkqt
         EY72gaRz0AJy7XwQbUwfBXaoEcfTNmudxPLksvV6H4+fQkOPpIdt5NiVbtj5qaknOBCI
         HxG2JH8pfL6cdh7txxJzLMGvRw7FpfT65ZWmf1ucDH123JPdJghmdTKHY4ddfsoKL0XY
         Wqt3PyyxNQucetZbfhN7GkTtkWRUe+ZstELR29gj0RW8Wk9X3NDnaRmq5/0OEy9jF1ft
         ytW/ZBGBna4wDZLhi925PM90V1/FyT0Gu4SpvsAKQ1rYnPd4kMxp+M0KQfE4CzIBrrCO
         V9sQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KFBco9vvl/TXQH4PPKP9krzus2d6NmrsLHAXWodmq97VhBPgupo3VrXzmnvPM2HYQa0l7IHKhqA8IzHImO5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/q2S1JckHXYC+o5evlQ8KfDK4H/Dp9Kw68KclmH974GspnRlQ
	Soki+pCLD7iU5Bf4Ay/nA6uBkeHSVEnKb1itv5Mb1UReV928eQ3OzA0b2/rdwLBakEc=
X-Gm-Gg: AeBDievsjRzOW6iKk1S+1XM1E/iq6eYoxRf3wST2vvlMSvOk1rnrB+EC8V+Ony79ZAl
	ingg4EFDnYoNkjLVViYl19GN8mZueGLHPugEuCHBota7nMpm5k7qgdW5YQrppsY7tFdiDxDyOHT
	GJuTPMqyFOvV0Hr2t0OHD7kH8p2Idk7jnnG1NWV07xYikRybwzd+1m2sn1pBJCphi/BmcsokZz/
	4cpUdzDkVjbA7zk88j2a/YF5XFv27cCcz3A4YktpLT1ACKOoYE3/e73Ferna7o9BlbJAfaG34Ql
	aawOxjfYMMztsODZxYo4JpKk9EHqDdAgNV9agTWr2o3hkoGugGv+CsdptBzumIy5M2ibr9Fx/Jm
	2VDYKwUl0cH11LZMXvyF+XqJCNsaQ0r0TVex4PCMcSzwALspUI81rn8U1IW1a02AwshNa7wABLJ
	vWlXvUSmf+MqoBHJquGgPmXtBpQu96qymSUNl5kp1WrA==
X-Received: by 2002:a05:6808:180b:b0:467:bfa:bd9b with SMTP id 5614622812f47-4799a233197mr375962b6e.21.1776374132495;
        Thu, 16 Apr 2026 14:15:32 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47997dbaa4bsm771993b6e.5.2026.04.16.14.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 14:15:31 -0700 (PDT)
Message-ID: <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
Date: Thu, 16 Apr 2026 15:15:30 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
 ben.copeland@linaro.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <ad-8BIkw_ijCLqcF@sirena.co.uk>
 <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
 <c834846c-96d5-405c-97d9-f182b8fe1569@linuxfoundation.org>
 <a73aa838-d194-4867-86fb-42bc8d057fd9@sirena.org.uk>
 <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/16/26 09:21, Shuah Khan wrote:
> On 4/16/26 09:15, Mark Brown wrote:
>> On Thu, Apr 16, 2026 at 09:08:17AM -0600, Shuah Khan wrote:
>>> On 4/16/26 07:16, Mark Brown wrote:
>>
>>>> Sending shortly, FWIW I'm also seeing a buch of issues with:
>>
>>>> ./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
>>>> ./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file
>>
>>> I will take a look and isolate the two commits that changes
>>> run_kselftest.sh - sorry for the trouble with CI this time
>>> around.
>>
>> Pretty sure it's 2964f6b816c2 (selftests: Use ktap helpers for
>> runner.sh) - I've just put together a fix for that one, will throw it at
>> my testing and send it later today all being well.  It uses readlink -e
>> which isn't implemented by busybox.
> 
> Yes 2964f6b816c2 is my first suspect with ktap_helpers.sh no such file.
> Thank you for fixing this. That way we can patch it and not revert it.
> 

Just a quick note to say I applied all 3 patches and will send pr tomorrow.

thanks,
-- Shuah

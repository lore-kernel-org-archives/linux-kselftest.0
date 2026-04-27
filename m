Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4335AC13
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306848; cv=none; b=EdEPDZnuQt28s/QoyPPLNGtprtyS/urQrclga2AcozqpuEL8nKrZyP711suFHWC9aOfjrLUOmXM5zSbmQ9gnTdsqnRFGqyLDI77oYw3tJF17N4s/K0l5B41lT/8dKn6GHZky3P6yh/hRMsgkW4Q23e0vKN07MPlc6htlMs5x3R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306848; c=relaxed/simple;
	bh=PT+rq68a1imxKm0EouCRUU9FAs8DiyFNM6mQH5O6yOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDS7yxYUUhpoqPSoz0S918AITI11KvI1ycuJeyG99j/0k5qGTSPdtIedpEEIFYjuo9c+fsKuMZyVjj1Du2APwdTtzAZSJkpmQYoBJX12cJ5G6pgAUIdwYRlGjVh275FAZGknVRUBh8suV0FNqKgLcK8QS2+COe1z3hOmfENpppI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G0jfENzQ; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G0jfENzQ"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2eadb000b8cso575539eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777306845; x=1777911645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpH+wiFtbZhDxmfHoe73MdVVOoCtnndrGkINTx7QaFY=;
        b=G0jfENzQnLoR3RB0Wbf5RNHhLKR+eyksKTfin9mc5M6Ibn0gkeWKw1i6GW3KKfkPYj
         lkfzYQZxMh5OiOuK9l3GBYuSFP6uEzV/p4OrEpHakZK+lhD9yVeFGQxH4l8nr1OYZwAl
         TPNhIxuiry90Waj39cX5Q9LDLMqjMmrO73oQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306845; x=1777911645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpH+wiFtbZhDxmfHoe73MdVVOoCtnndrGkINTx7QaFY=;
        b=ftjl2OKelNG9RrLCfCs54BOLkfqTLpbcM6a+qKq8wOt4Mm9Fjdx+AhR0lEmb3GhVmj
         1bwhV/Lm3MTAC92hSz9Szh3+OX9yaPPnRDYKr3qcLRKPMqURPmZOHGLPd8S9ILRS3sPH
         sCn7agBiLYr3Z3IkEhKxbZsHearX8T69dUrpltWinp9rcQonTLucoujhyZCoXHnOlw3Z
         BSNwYZ11KZWwInHs+U/XEL3MSGOrVuoZPq9QouBjbnyT/zhMHj8xoNKXTp/ECScAfr84
         n9L+ZOIUk3mhwco/TK4/NRYCHmXtGfqTeU7ECX7R0i3kkxGOPVsXqSfxYA0c/fxoyRxO
         34Cw==
X-Forwarded-Encrypted: i=1; AFNElJ+dgMJmua+ME+k/4hLkr63NpSNxarhRjjkJ5O6QM/63zKvB0e43u7D4aS/eG3UApZywLIpveQg122+Ut4ej18U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz+aIgznEKifUGJDFyGl7OpJxIww83LK1mev3MBtsXXAahzFtY
	W/aTnr159Dp7XGAaooDiID/2CuO3tU2WQTIm4A8Ip3UgNvvlqqkXuA+OysRhfhIbKJ8=
X-Gm-Gg: AeBDietSLCnW6YSiPZAI9PZ6E1AS9qsH/5GPwWK4xRqfGIiF0jhMGq6F0ZXWaR068Ya
	FZ2DSxFZ9FE8fcIrAc9sUKUHEyER5Y+Ug0cc0QLC8tvaqYOSQILwCQW/XgSVNeEYt3hkk7UvGUo
	tbXwr4Rm3CEdzGBz9IHP9Adgg+amLCcKwTsMuQ037AUmowYkzEWUh6S7en0n22badE9cRBZp6jG
	gO2VRc5dM/P3Z3eMLvkCeOxHZDhM8WlB0VGfiPHWYNJ6g6U0VObRgFO/Yjhiaqu/i95XZtsVS4R
	UfO766K5CZkUPf9iTQFgEdYLbFvdQnvgnynSi6weJJ7ekLGjoEjEO9uhnhg8bVldWRBDn3MU3a0
	yCF3QsuGOoN0dtKQaRmn85UTUUUkAEEQwYod8jne+YBf+ECJ6I2kBgfvvtU4J/Hw5BqG9P3VezR
	6OSL1P+A6U+wtwAZp6dvtD5obxJ8XbVpVluhIkxdCx7t+Q
X-Received: by 2002:a05:7300:bc9a:b0:2d8:c521:c157 with SMTP id 5a478bee46e88-2e478a2f0b7mr23181940eec.18.1777306845229;
        Mon, 27 Apr 2026 09:20:45 -0700 (PDT)
Received: from [172.30.76.185] ([50.224.25.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm43484326eec.2.2026.04.27.09.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 09:20:44 -0700 (PDT)
Message-ID: <f4a213da-7016-4d87-a93f-ea205ab05aae@linuxfoundation.org>
Date: Mon, 27 Apr 2026 10:20:43 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: runner: Avoid spurious warning about
 missing failures file
To: Yohei Kojima <yk@y-koj.net>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Shuah Khan <shuah@kernel.org>, Brendan Jackman <jackmanb@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260224-kselftest-fix-failures-file-v2-1-2bfb8f5cb6a8@linutronix.de>
 <ader8C3F2uOY7ro6@desktop.y-koj.net>
 <4915db6e-5bcf-4f70-b510-693f5d5b8678@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <4915db6e-5bcf-4f70-b510-693f5d5b8678@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/22/26 08:51, Shuah Khan wrote:
> On 4/9/26 07:38, Yohei Kojima wrote:
>> On Tue, Feb 24, 2026 at 04:37:56PM +0100, Thomas Weißschuh wrote:
>>> When runner.sh is *not* executed via run_kselftest.sh, the variable
>>> $kselftest_failures_file does not exist. This triggers a harmless but
>>> annyoing warning from runner.sh if a test fails:
>>>
>>> tools/testing/selftests/kselftest/runner.sh: line 50: : No such file or directory
>>>
>>> Silence the spurious warning.
>>>
>>> Fixes: d9e6269e3303 ("selftests/run_kselftest.sh: exit with error if tests fail")
>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>> Reviewed-By: Brendan Jackman <jackmanb@google.com>
>>
>> Hi all,
>>
>> It seems this patch hasn't been picked up yet, although it already got
>> reviewed by Brendan. This bug is also mentioned by a netdev maintainer
>> and several developers [1], so I think it would be nice to have this
>> patch merged.
>>
>> [1]: https://lore.kernel.org/lkml/20260112135326.7ce71119@kernel.org/
>>
>> I confirmed that it still applies to 7.0-rc7. I also tested it by adding
>> a failing test to net and namespaces selftests, and confirmed that the
>> error disappeared.
>>
>> Tested-by: Yohei Kojima <yk@y-koj.net>
>>
> 
> Sorry for the delay.
> 
> It disappeared in my Inbox - I will pick this up for Linux 7.1-rc2
> 

Thomas,

Please rebase on Linux 7.1-rc1 and send it to me?

thanks,
-- Shuah

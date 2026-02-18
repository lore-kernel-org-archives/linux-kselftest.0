Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0D62EDD7E
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771401727; cv=none; b=bNLSmDJk1PtddGICjGZS1iYb45zMcFJK/HkYwOkIG+7efZzvqpfr4RZrsdJAf5qCowZx1SeXB0pdSGmI5Oqmtg7X3rM+4EVAZeuX2U1GAi9fMj6I3nfDiMsTcYkIhwL6mXPbPOJAAPHBWzAt3X2+ypSHbQNvrMN2wQL6gAtJwO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771401727; c=relaxed/simple;
	bh=XI04HMMZxmtmKIt5krwj5AVJKXwc+CwEajC7Ya2hKUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1esHILB5FiD1pGvRBxRw9eR14CM2V824vSW2miR3z7Td9exuha1Mmy0VEZbywtRM0qauQBEpg4QCRsuodvbXmJVhHJKRGxy2FnrAvmLFj44ZJ1BwiWEtF7gIBqzP58+6KqOq7BWTjMP1kvWYnsmW7FgkQ62GE5zmdkPWQmr9UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jc5vXaKF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jc5vXaKF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483770e0b25so44600995e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 00:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771401725; x=1772006525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joXhlMp7nr1yG3GmLEpDKyVgijmZOHHHCsIq8VlzarI=;
        b=jc5vXaKFXSWX6BK20tk8Dg53nh+psfN+OUbY0CgimlWQ9eVMRAP8JzOQdW16gggm6p
         pM4qbabxT+WvKcRG5GFOn6N6A7w6ODP7PqP17MqGerm3kcl2EFlJdQbee0gYyT/OMz18
         FHaIc+YcbD/G2Tqo1GR/ABHLeBHg20gavlf4IrqbRvnyu1v8t9Xn0HD55DInumSLgu9B
         FM8Zr83qz1kPJuRIAgBM6KIxBoELjBVIa8hqsaVDD6gkqMwaTXIegh32MGEbi9F2HBnf
         hgQojdQAAjcETkT3cf8BiEc1NbcylLF9zz1tv+zw63Tx5FD51R3sT07A0/uwMXIW0vGg
         7j/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771401725; x=1772006525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joXhlMp7nr1yG3GmLEpDKyVgijmZOHHHCsIq8VlzarI=;
        b=miebjbFgac3rXCIEk2t4nBzZiJ5EKYRYM2uSKCk2krB/NK602PokYtvDMqx3DlrQjB
         kBo32B2RULOoRPZF6J1596+vhdfP4Gkf2tta2lCUkoq+6u9L+TNU5SFfhAWU6z3Vf0IW
         9ym7DQV3N+v/iOU11DlWldpleLsy71vq/W+l1Ui1NmBNtzVsHRpK3qPMBeQr/xDayiJw
         /DKoXGAUwLdGDV6BdDBgbwI4eIPotVtpmqNYeyJeylUsw1N4vNdJ5FT323ZDhkM8mz9B
         446FG6cs0cFKrnnoX7HPAA64yDL3gHNEckY4SKSz/D7Lhlw+queznVQdQVoo6iuUsfet
         jGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmso6jQf0BwI941w8uTkLh/deld3WgeT5m5Cj5D0Ji/QmNR8JwVlILfr3NVZUBwZ8lZxD6aPqjtaJ6ci6qYg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0JiP3ezq0h1fuw53XYhW5mrsJVfk6iSSBIacu1hVCMqbHEkD
	Z+yDEC0ITCEyrUA1AFIkGrok3AOJjbu/Dlwz6ViOqXDSyNEHPXNgT7WM
X-Gm-Gg: AZuq6aJHLgJUUruchQcXj5WkBEt2jO+SMeQX9uvyPRukqV1zNqRGlF1CS1b/O76FE2P
	NJmgavJzMiG0jVBwOVMD49FGNn4bRQMJvHfivzro7ZK9+Jgt8pMUwiWtG9tvZdTtj+xZROtvBQV
	xQoO6DpiLJyJ8CVVs3JT6B5D/lxt6Fsy7a8U9Gn5KMeToW71xA8lfj79Ga0JTgV+TsG0Tg9qqDN
	XPmqj1AD/Mhp8XU1N3V9q979gKjN6P3/Hm11dXtAP34s051p8bWYQf+vxNuCSxpE3uIzpammRrH
	gA+aAgyS8ZsbEbqhjH19c3Uw9R8TpCawco6Ql9epkp5ih1GZ8GpKv3pIgQIU8JnqQFwE1SfcOYU
	yTQE+yFWtMFXku7GI6W9JHx9zFCaCf59nCqtoenv+hidCCD1LIaB1ct7MjR4/z+9nseLVtofmet
	1HEskMkeJKoyyLlDZaYIcwxpBgxKdN/fIXw0uxkGBBX2bcPTwPKZNLsg==
X-Received: by 2002:a05:600c:3143:b0:480:53ce:45d3 with SMTP id 5b1f17b1804b1-483710858d3mr294678345e9.18.1771401724343;
        Wed, 18 Feb 2026 00:02:04 -0800 (PST)
Received: from [10.158.36.109] ([72.25.96.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0deeasm527592655e9.12.2026.02.18.00.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 00:02:03 -0800 (PST)
Message-ID: <d56f8f9a-7377-4892-8b29-d5be53eed08e@gmail.com>
Date: Wed, 18 Feb 2026 10:02:01 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: rss: validate min RSS
 table size
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yael Chemla <ychemla@nvidia.com>, davem@davemloft.net,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org,
 Willem de Bruijn <willemb@google.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
 Gal Pressman <gal@nvidia.com>, noren@nvidia.com
References: <20260131225454.1225151-1-kuba@kernel.org>
 <9f535014-80eb-4f57-b047-3638579bde9a@nvidia.com>
 <20260211134319.39710c1d@kernel.org>
 <dbbe9690-996f-4a63-90a0-baec52c27236@gmail.com>
 <20260212172215.0a3295a0@kernel.org>
 <ba1885cc-57e7-488b-946b-d08c1644dcaa@gmail.com>
 <20260217135727.292acc4e@kernel.org>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20260217135727.292acc4e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/02/2026 23:57, Jakub Kicinski wrote:
> On Mon, 16 Feb 2026 10:28:52 +0200 Tariq Toukan wrote:
>>>> This ignores multiple other considerations:
>>>>
>>>> 1. Existing behavior: In general, mlx5e today implies 2x factor, so it
>>>> would fail this new test.
>>>>
>>>> 2. Device resources: In large scale (high num of channels, or high num
>>>> of netdevs on the same chip, or both), it is not obvious that increasing
>>>> the indirection table size is still desirable, or even possible. To pass
>>>> the selftest, you'll have to limit the max number of channels.
>>>>
>>>> 3. ch_max should win: Related to point #2. Driver should not enforce
>>>> limitations on supported ch_max just to fulfill the recommendation and
>>>> pass the test. I prefer flexibility, give the admin the control. That
>>>> means, driver would use 4x factor (or larger) whenever possible, but
>>>> would not block configurations in which the 4x factor cannot be satisfied.
>>>
>>> Oh I see.. I wasn't aware the CX7 has a limitation of the indirection
>>> table size.
>>
>> There is a limitation, we read it from FW.
>> It's usually not small, much larger than 256.
>>
>> But currently it can vary according to FW decisions in scale (resource
>> management).
>>
>>> I wrote the test because of a similar limitation in a
>>> different NIC, but that one has been fixed.. I have limited access to
>>> CX7 NICs, the one I tested on maxed out at 63 queues so the test has
>>> passed.
>>>
>>> Is it not possible to create an indirection table larger than 256
>>> entries?
>>
>> It is possible, depending on the exposed FW capability.
>> As of today, there are high-scale configurations (many VFs for example)
>> where the FW exposed cap is lowered.
> 
> Not entirely sure what you expect the outcome of this discussion to be.
> 
> The 2x indirection table has been proven inadequate for real production
> use. I'm not talking about some theory or benchmarks, actual workloads
> reported machines/NICs with such table as unusable (workload starts
> choking way before reaching expected machine capacity).
> 
> That said I just checked out of curiosity and the OCP NIC spec also
> states:
> 
>    The minimum supported indirection table size MUST be 128.

That should be fine. Max table size cap is always >= 256.

> The minimum
>    SHOULD be at least 4 times the number of supported receive queues.
> 
> so I guess the 4x isn't exactly a new recommendation.

My position is as follows:
Provide the appropriate factor *if possible* (currently it is 2x, and we 
will likely increase it to 4x).
However, do not limit the maximum nch if the factor cannot be satisfied 
- even if that results in the selftest failing.



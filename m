Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3243659FD
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188897; cv=none; b=KJjSoXHxh+OEL3D+gmkuqcUz8fTRDV59NzsgosuqxRcIn/Y+1nP3PCg+Zcgn0hxV6w6B+y5vnBqYANLZtJQeYrMroaDC0PEo8XyN9RdfGxYxUWf4AwtDSd9VJ1rKcoK01MOwydt6Ujn0/Vx4yyp2UByREQU2Rgji42zibvVgbC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188897; c=relaxed/simple;
	bh=nZc2xi5zdfE0k9aodqhuuyxCv5YS9Ogmy++z4WwGvlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFIryj0VbMNUNd3xJSNwbGhp5RQNuPbZloma1JQuzw9A761Flb8oYClXC0U/42hhIxMS1X6d33gKLIvvayK/dZhvt5yDAy82rFDmpffIDG1lFty2CrUpRa4yTHECzUzZOK5tXzXYWUkJwJIh69wXK8brrS+K0kMPREBjZrIWUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1whEmtu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1whEmtu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432da746749so221074f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 23:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770188895; x=1770793695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kqnpITCCQiIQonzXq9ScSS11b9xv/CuzslKyMe7TLdE=;
        b=e1whEmtun5UfQZIiU3dL0el4NLpHcA6q7nJ9jVU3drGNTu/II5icMGTQrmlseujkh8
         /WpdCBKYX5A17RO+yOPUdPEUu+l9ho+fpYEyI3/eJZHCUPAoU+DRvpOYTy6lLU7BNFVI
         ZYq1+hHv1LpC5s5fXpAGZK4pD+pWfgDR/ROL4rMjBY7W7V7AuoJW6cyL3dO00Qxy+A5q
         gouWd3js2G56adcwcC1D6bwFESyzmX7F2mZ1xF1RRz+L0HRzCUQRxz+/oBx1uCZ5KRpn
         c9G0hifSfNtNOOqTip7goKYOkvrsPoTK7Ipzngxg5G/I43webNNsljdrHS2ZTide7vTA
         r1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770188895; x=1770793695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqnpITCCQiIQonzXq9ScSS11b9xv/CuzslKyMe7TLdE=;
        b=O1VBzzy1i3sEDozS2L5ShBaaYGDe7utSdQ5/8Ah17ZQyToLl9n4UjP1Sg/F50AFzmR
         Kqyy00ouwApsNb+5B/sbWXxQe6xr3BSMC+DfMiv4pRYfHS+SRp8oNb+VZAJR8w80hTKy
         lezVoDn1bHOylzyFVK33FkT7tKnUebh/iWULBGgOvsgZ63d79ITPgG+72Q1xRMMVxvXJ
         pe3VsQjlkLcJ+PNWhPUMi7XkPDgmZmYvmtMfk9XKJsidx2U2LLhyJazMAnDC4sIKx71j
         gOgulrLCCnYLlGbAyCjGaH4EDqOXNimwUpHw8dUFwPPVKaiHheQyM0wjtetlODRisgcw
         AWXw==
X-Forwarded-Encrypted: i=1; AJvYcCW6EA2KG423RrJetyB8QUaCgoukRyISFMHZi3hokCPwLMsNm16cyJRJ31BDv6YV4YXyuvWCSw1ODvR80F+fUxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdGFZ/lhYlKEEf2PDKuseqJOb1LQauTx4eJ8aAfjb6Z5Ew+PTK
	CRRx2fEcc3UvFN+t7ZpNSqsaSvqFUMPV0vazw64YoR79RuzSlHCgCwt8
X-Gm-Gg: AZuq6aJdG0v7YzQByChLiOX7h2yJGmX+XdIyqaaF1UDgQ08bnQqf6/bs4EzWFqDV8mo
	h4RP+r5thfvM8gmEpcAYOgecztuxnvDZFivTw3R7Q6rGlgQYQpqYVbs2gijeh/8GMIuXbvKhLw/
	TUv4IqzTDpZYvnpoZMPzLjIGoh+cvSyTgXLqRAOG4zVr7QSUV3pHWGAQYY/gYAHgphsUjTOb20h
	q4R+69P/G5ccapFNoE0pj4r66/WHikKtmUsdFRCko7+aXZEsGMW7HKiX5w3k6clO2Sj4MkxJGTA
	gBWeQZy8XgzLJEicijeUq95Rc4rfdKZsc3tUUC2TV6iXDDQY+8geW9Hc11z50kvvcK4JVvqvmaZ
	a2wGkFtAkMIaxN5qyE8ZMePBplGJsGDBfonv/IpkY6XCU84lrK09Nf41a42vkffNRaiMc2JiHfc
	LB+aKxFoFq7s2MPKzCok1LmsspOLZv
X-Received: by 2002:a05:6000:2888:b0:435:8d02:b9cd with SMTP id ffacd0b85a97d-43617e3d500mr2536235f8f.26.1770188894959;
        Tue, 03 Feb 2026 23:08:14 -0800 (PST)
Received: from [10.80.1.200] ([72.25.96.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e38fbbsm4578360f8f.13.2026.02.03.23.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 23:08:14 -0800 (PST)
Message-ID: <f3e5ef08-c073-4f96-b874-8fcf8c72af2a@gmail.com>
Date: Wed, 4 Feb 2026 09:08:13 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/5] selftest: netdevsim: Add devlink port
 resource test
To: Jakub Kicinski <kuba@kernel.org>, Tariq Toukan <tariqt@nvidia.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>,
 Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>,
 Jiri Pirko <jiri@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>
References: <20260203071033.1709445-1-tariqt@nvidia.com>
 <20260203071033.1709445-5-tariqt@nvidia.com>
 <ce09e17d-2b74-4bda-a8ec-352c92659a6e@redhat.com>
 <20260203182652.39a3620d@kernel.org>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20260203182652.39a3620d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/02/2026 4:26, Jakub Kicinski wrote:
> On Tue, 3 Feb 2026 11:16:45 +0100 Paolo Abeni wrote:
>> # Error: netdevsim: Exceeded number of supported fib entries.
>> # Error: netdevsim: Exceeded number of supported fib entries.
>> # kernel answers: Operation not permitted
>> # TEST: resource test                                                 [ OK ]
>> # Command "resource" not found
>> # Command "resource" not found
>> # TEST: port resource test                                            [FAIL]
>> # Failed to show port resource for netdevsim/netdevsim10/0
>> # TEST: dev_info test                                                 [ OK ]
>> # TEST: empty reporter test                                           [ OK ]
>> # kernel answers: Success
>> # kernel answers: Success
>> # ./devlink.sh: line 614: echo: write error: Invalid argument
>> # Error: netdevsim: User setup the recover to fail for testing purposes.
> 
> I suppose this is because iproute2 needs patching. Tariq, could you
> post the user space bits or share a link where we can pull them from?
> I'll revive this in PW once we have CLI updated..
> 

Right. I'll include a pointer in the next submission.
We're fixing the code to fail gracefully (i.e. skip) if userspace 
doesn't have the needed support.



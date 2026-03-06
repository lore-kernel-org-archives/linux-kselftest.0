Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA42481A97
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 21:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831542; cv=none; b=J9spg3lPUlfr0niqOd7yfjyjRaC+WBnWc38JduDFWSbEEtvdKKAS/FwT2aVS8xzCzG/AcKni60ASJ95BYr5eGEQgY8dK4aP070kBB91BOYLaMotg2LrsYbe+lqV1WJ6wcQHHbOmOsnGeYf0dQ/0yg6ZH1ji/65IZJMVmIZQ6HI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831542; c=relaxed/simple;
	bh=Wh94xCRt7HVtbFTu1E7hVihYsRF1gk17Jl85uGP6hOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhuP9cvRSwpPdk9XGbsmYXX0BC6w/u7QtL5KbStwh9M8DlBOjPmMwLbeO19vzfeSc9Z+URtYeXCg/8fomX8+OChHB5wQKvukhswHYLkSTVdAGdLF3qlgALe1iEpGZaIR8ZAKyZi5kOqHOCCv1EwfBVaV4j2oVDv2w0pwWBuMp5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=GXhVBQWw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="GXhVBQWw"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439cb5af25bso3130703f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 13:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1772831540; x=1773436340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LFVUw8hQrGrYFzA9IDyVyoE7HtboAbMzwNI4WYaE3JE=;
        b=GXhVBQWwpETw/foijQJXVwp40wKamFTtxyyymhrAWW93iC1nCmU5vbK69SifWO12zJ
         Z5N1mHeQigIZej11J6PZL2FOQrsXEvHFMb477XKZvzu412aglLMCKbhAs97yTVOdIvbH
         pjLKtDRXZ2IdTTK7uBp4DzSPY9BjTZCFUSq8yJ9+dyQAJYNpYn0uF0ydECYn6xWcGMLE
         We8BkxLZNuAQ0Y33igjFVWUOSEfW1JUkqME3+yvByiZbeEaoMPp89h5B7pvAdBIJJcgo
         mdKajddz1yIUqIrWKHNu1VpQhQtpCLEmBs4o9u6QY3mhp1s2MN+CZDxzlFLP76yWOXJf
         h8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772831540; x=1773436340;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFVUw8hQrGrYFzA9IDyVyoE7HtboAbMzwNI4WYaE3JE=;
        b=N5hH1+L86/ybeiICHId+h26lEyF/MAw7OpBVJXUeNP8dzcVNG+ObL1Qjs0xMiOGCM7
         v5YQ6eRIbM7ZhwuirixoCuKDzKBpvzAZ1d6RqfZgDNWpszJsppC2N3N52Q3xQbva667A
         AiwmrNA340EK6bB7JJg7fPSXBA9xuJUgK4NzbF6OF1G0IDGPLT0Z/g3ZSPhw6MeKCe72
         pllWCLEjBVR64oPFnMkMhUkRB4DZ6lKhTaYWlmeXXSDZqYx9qRnAq/Z/+dj6EQHkvRe4
         cRtJQFkeTkqwSwR7Kp5WKW/Z37xt2Wxi5ti5PaAF/vB6dEgmln8ux7JK2bT+zi3Bybun
         DWFw==
X-Forwarded-Encrypted: i=1; AJvYcCWW6ydsW1kTLnEWx2gJ1TCX2NFj/gAN66jyH26OG8RsNAg+RQYsEVIk0RdUEzv8HK21PeAYuiZtmSsWM/KgI1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlTgq5x9oPSyZcdnXvRmOW/eeyeLJ8hiAMf0Pbb+HS26j65vS1
	dZsKgkHmNZrTe41VB8glc4wBO93+mN2XYzXSIPp3ipJpCi2gQCbAdQ0p3th4QMqaaPzELxfAuv1
	BW4GwgO7Wm+yh35GZnYB8XtUOV1PWlwdVYl5gRoygi9Bwl7OJAKJ8Ev4CK6usyPQ=
X-Gm-Gg: ATEYQzzIHTFzD+hypkFcfFNTmUyb3PhYHk8XjmaTBO+NoS4NaNR320kjRXlopUfWwIv
	Wr6Mw6wwa6rfwq4/WbVYVLyD/j02CVHEOHK65IjWoB57oWt8/rbfSirrKAzqouwl/xycS3O3rkf
	W/dMipd8boV7oHAF/GAOEG3PH0SjsRh9jpXls7ShJ/Yku0co8wqm5rPSx2BEoc4PPbtUSNSYhV+
	ZngJ2eUjOlQCUkfCjyeTd7sGjXHcEYz12w7q8CYVA7STU41DxKs/qHXrTFb7H/yiI5O7Et2QemY
	wwohyQVFGz+PTDifgj8AxLVC8ql3A3j7OJpb/O2gCZRQLzWEBkY6akV6o8hjES87wP2ge5ITdYA
	2xe8/XrFABRpwqUZ76vL/PvCPMzVdXiC5w4EORFKYQGj80zgXCgQ7rMeL1Bn1CsPnO7SO/5Zj2G
	3akjdNMuxl1S202RbpKeGJM45nSEA1Gguj3mw4Rfnp7M68w0iFvsUOAiSErZff7bvZPQ8SmyIG
X-Received: by 2002:a05:6000:400d:b0:439:bc89:6b18 with SMTP id ffacd0b85a97d-439da354cf0mr6733967f8f.9.1772831539605;
        Fri, 06 Mar 2026 13:12:19 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:99eb:76f9:2124:56da? ([2001:67c:2fbc:1:99eb:76f9:2124:56da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9fbsm6436076f8f.23.2026.03.06.13.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 13:12:19 -0800 (PST)
Message-ID: <8a22df80-824c-4711-9354-b0392220bbeb@openvpn.net>
Date: Fri, 6 Mar 2026 22:12:18 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/9] selftests: ovpn: add notification parsing
 and matching
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Ralf Lici <ralf@mandelbit.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, horms@kernel.org
References: <20260304230643.1014-1-antonio@openvpn.net>
 <20260304230643.1014-6-antonio@openvpn.net>
 <20260306130130.559d844f@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <20260306130130.559d844f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2026 22:01, Jakub Kicinski wrote:
> On Thu,  5 Mar 2026 00:06:23 +0100 Antonio Quartulli wrote:
>> +def check_requirements(requirements_path):
>> +    """Return dependency issues from requirements_path, or an empty list."""
>> +    issues = []
>> +    with open(requirements_path, encoding="utf-8") as f:
> 
> Semi-jokingly let me also mention that you do all this requirements
> checking here, all the dependencies seem to have been installed on
> netdev CI already.

as expected :-)

> One thing for which you don't check is ngrep,
> and that was not installed.

yeah, because the script is only checking the python deps.

> 
> IMO the requirements checking is a waste of effort, things always
> slip thru.

I am fine with dropping the dep check if you also don't find it of much 
value.
We'd have to keep it updated and it won't help much once packages have 
been installed the first time.

> But unless you have a strong reason to use ngrep maybe
> switch to a more standard tool?

Any recommendation?

ngrep is used to make sure that received packets start with a specific 
pattern (OpenVPN header with certain values in it).

I presume we can just replace ngrep with tcpdump, assuming it's "more 
standard".


Regards,


-- 
Antonio Quartulli
OpenVPN Inc.


Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00782F25F5
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775086554; cv=none; b=ZDCP1dYtuge88q83Y2PoVBqjyI7Qxy8i8eufCMXLn3TI1ORK1k/UOBmbRpFGHrSC/4gOxDcsuKFwcOQn4VR4NWdp9+gQ8S2nRjGmKUVEFPT4lFseNL1R15eHbbZvJxqmajgBV1CoUbhmlxM33hRLA/XiRszeD9+ljCXsSBWIyBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775086554; c=relaxed/simple;
	bh=h5k3Xx4lObwj4IO8cFxWfuy9O+uGkMuCLqqzf6mDyFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcT7xA1pp+hpB7ZDg6XO1i02A2tndpLA7J5qHPCIeY57gUpRnbShemq5AI3R7puJ7OegAYcMjGgKZRW3pBzPnUp86XpSG62Luir6S6mtWd8+pB8ZNeVwW4xbsHD9FyrUp/w/qvvgzysgMvKCC7Yy1gep4AOOr9k6Xqvcn3OmXDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b2SgRaWD; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b2SgRaWD"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-67bb04151dcso170832eaf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775086551; x=1775691351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zfjh2JtIM03zvg4bBCmPSybeaL43I2wt5CLM1EweZGM=;
        b=b2SgRaWDmHpCJZ/TeBuSRbS25s3AtbybF+DEdFPx+K2OtPY7f5CwiXJPRYMxSu2wAD
         213/5qKi/DSuVxrcgpXUVoddxSUE2J7VbTJiRCKKKg68Fe3uR4n+Z71YXtBpyYAoz8xp
         xn+5fdtoxXppw2a8vFydn1vdISfmctZ+dwjr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775086551; x=1775691351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfjh2JtIM03zvg4bBCmPSybeaL43I2wt5CLM1EweZGM=;
        b=LqiLE/rqeNPhQYZH3DYu6lVjigNsRSm5TbT3cIK5qSD6cocEnC7F4dQDhFCHOhxK8b
         pgcMY6sXcJW3s+zp6D5KJtAfBwfMybJjuXTFggAbOCQ5E4ZVQ18nohSaB3x2OngZgFMp
         JCTboXg7GXd8HCxlqePJlUjzji4qAwv84ZsZCwTGE4ep1S/uxqGWpiMRu9IJDWppRGAg
         QWbxFSrBUS6yK+wOdqnw6lY+kunkezHE5WfET9i0kaZpMxSw3wAL4fHemEaKuhSJBVbN
         EO6Kz6PuWcjYIJooSa2RR8g6L7lbPdO1CSqJLkL5FjqPk6eh4p2zZ8PxFsTLY8xMwFX4
         c2xg==
X-Gm-Message-State: AOJu0Yxq+QmMYR0sE54RouhUY5d5xzM3iawr39UdhQwl0hLocAZcZMmQ
	9duRYUBwoOn8bFPeFSMg+Qmj864WD3GeEBcfIn77+aagPkSmBhjpxfm9b5b5vMDp2zQ=
X-Gm-Gg: ATEYQzwE9rCHMIGAaRyHH4/adDwR0oPYbPJzIF0RpN3/SvO0rTO2ubmz6hD+TL//4Is
	51lZySIQjrGEHCDCV0reKHjD59S4RRqDB4Gq0QzzUPPZ4RjgJyVD0hq+yG0LHOvZI1OvZYLyZtm
	tJsKqZbuu83qdUTH7CuxdvzgFEpZWBwoaV4SQVQe25IgKomoS1eSkEFcGeBXJnrdbZ+nW/pxgqT
	KLQ8eIo2LPLQiTJlOGBeNceeSRh2BoKpW3LpeDVzaCaSNCnqWyTl27hjnesPNyPLEJf4japQp/F
	45bnUvlkVOAGvQNgNrQum9SIfBk0GJwTy5++uaUW4rbsiJS9bb2ne94V6o4LP8mLre8rr/N49Nb
	DPBR85gpDRLrDeVJQWgNcDl7o8wWJ6uFtqrRDZm8zF9Cnq9SNdVvK3SMLej/9Rx7vc1kuO96Nwv
	6andwh7rQMm3oGpPsK/QtKWEg/P4jzURdyxMM=
X-Received: by 2002:a05:6820:1897:b0:67b:b0bd:8bd2 with SMTP id 006d021491bc7-680a8548b56mr858545eaf.59.1775086551530;
        Wed, 01 Apr 2026 16:35:51 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm751543eaf.8.2026.04.01.16.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 16:35:50 -0700 (PDT)
Message-ID: <8290d427-ae1f-4e90-b988-c209e81ec85c@linuxfoundation.org>
Date: Wed, 1 Apr 2026 17:35:49 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Sashiko.dev for kselftest
To: Roman Gushchin <roman.gushchin@linux.dev>, Shuah <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, sashiko@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <d0dc7caa-052b-4d50-aeb8-60d3327d1130@kernel.org>
 <877bqqh11y.fsf@linux.dev>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <877bqqh11y.fsf@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/26 14:34, Roman Gushchin wrote:
> Shuah <shuah@kernel.org> writes:
> 
> Hi Shuah,
> 
> Sure, will add later today.
> 
>> Hi Roman,
>>
>> Please add linux-kselftest list to sashiko.dev for reviews.
>>
>> There might be double coverage for patches cc'ed to lkml
>> and other lists such as mm, net, bpf etc. Hope that won't
>> cause problems.
> 
> It's not a problem at all.
> 
> What I believe might be a problem: kselftests are mostly userspace
> code and at least some parts are written somewhat loosely (which
> is totally fine for tests), so Sashiko will report a ton of issues,
> many of them are not worth fixing.

Good point. Maybe we can also find things that are worth fixing. It will
be an experiment.

> 
> So I guess it will be good to put down a kselftest-specific prompt with
> some guidance what we believe is acceptable in tests code and what's not.
> 

I can definitely do that depending on what we find.

thanks,
-- Shuah

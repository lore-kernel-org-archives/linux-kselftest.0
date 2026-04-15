Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFC530C608
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268357; cv=none; b=tBufS3qyY6R7XRm9LRuY7Agar0w778Xj7lWCR4bPEHCJK5BeoEJyFLn8ZHI0z0tuINoilVHKHBap9D5ii/v78VShGD8P660dOsS2sOj/aTuDBtm8tNfZvdWnpww3Nkyq3M0oVagUq8tjebXrLfqdBmuq/VyWNMVG/x8yL2zp/SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268357; c=relaxed/simple;
	bh=U6e3kvNh9KQystEAl0TfrKTSNzunQsW++ByhZy3Guj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyWTIgVqume/9aN8wf4OwFttL7xHoEdBKHQNRZF8bCzzqE90YVPCFJZs/pB2LfCFhedhdxkO7mbcWMg6TRTm0LeQgV/qBiH2Ik1/NEcGmtiBC+JYH8H/G0DJiZBjMvcd+Zlb9J7sOa4Iab6lL97zuJoIKA7tJI1d7xUmcL/jqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g05Va1LD; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g05Va1LD"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-46f0fa0e398so3938296b6e.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776268355; x=1776873155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OyU57pKrT+E3A9527zYY3QFwxCUHqAEnIl4mnw9XKdg=;
        b=g05Va1LDml3bA0HGHyPqErgzqJmG4BZ+xalGPfgRTDRosCHbr+O1ydnaQQsLtg9kFA
         skBYBUGv3qx3uF/1hkIlU9XquZpfVOwy31tQTNi1mBdXsnOVXF3FtK3kyNzuqRVRv/Jx
         Xd/FAJv9lqTbcEkz9ImDavsiJbgZzSfFzhLwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776268355; x=1776873155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyU57pKrT+E3A9527zYY3QFwxCUHqAEnIl4mnw9XKdg=;
        b=iIfViy/8yC9HVG4hHPW+8KQ9WpgnCLPs3Ny0GMhH9XqLIHkDuXC22hDCfkYWe/5B/W
         etg2e7qaGYexsfNBjt890lr75eLRiJ7UTeIvO6VvnT+zUAzi3sdK3b7U/J6F6jIhJE8K
         88B6pWN0nqf3ULpqMW2Y7G9ienRyAmpiLuK/GHez/VbuKTinwhBbeSMBLvCMk2bQlJRI
         YTDQ0L/bsS6hwIVtjJ8FYrSoZDvXaW6NO33+IdL2P6EwBRn3rAp8AGhWtk4Yhex5wl+a
         EymM0J/C/UCeoP5Oz6+hKWO1BRi4VYvqxve/hlBmtgS2NtSOUr6DRuVH2H4LLxPZPpOX
         UrBA==
X-Forwarded-Encrypted: i=1; AFNElJ+9H2EV+IUsgOD1OiMYBei3m5gFkstDoYwjss87o5gaSc3fzxPf0KSt8q0hacw0aqUnZKyh9CIJsmpO5VEOGsI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1oJMCW3xzhwDBpEFoqcDiYSgwts+JApGATyFCcw2N+V24mMb5
	emQGvDlI2jwwa/4NOyhDHX29jFSsQRsGkQbWfjRIoU+vC+AEus/U/CH418j+krBrDOQ=
X-Gm-Gg: AeBDietAF8y3nsjkJAy1qFr44pHMVod9Dv350T2ZrCF/V8LE9iQGxJqyG5x1vbsSiKX
	G/KZnbaZGV5fa/x+pz6XpLxExlocGORgGZ+kw9NpkrgrheF6SNuAYxpEnIn9qQmDDhPa4QCuAo1
	LhyWvOru+hpJwMQrenccqSyk2ar2nlaVSbMp6ZASxWJ/NW1I69Qi06JqLMHsoJdcbf1imTueqsH
	OkcMTdaWvXr5f5p+fvuR7NJN9iIiY4NNUL9ddzKJoUF58ZmvnBGr/FiJ33HEz5oObEC8tV+gLnk
	hOnXrkIH8ZDYocilZc3V0e4fYxBS/Pz+8xaMQVoN703oMWHq/6bolm0ji+OAnDnYsMkgX+C/ZJm
	Hupp/Y9C8oa5LmHGCVIFqIx4sjFyMV+F28nkn1U6Y11r0vO6AhsGd10rxkBOnXuiFvUkfYeGxC5
	NSNaUc117koZdZhTUW+3JjeRCg9s/VMQQ=
X-Received: by 2002:a05:6808:4483:b0:46a:701:c549 with SMTP id 5614622812f47-4789c848130mr11887020b6e.3.1776268354674;
        Wed, 15 Apr 2026 08:52:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4797a544fc5sm1026816b6e.17.2026.04.15.08.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 08:52:34 -0700 (PDT)
Message-ID: <b80e905d-67bf-4c52-9b61-e52f3acc5b35@linuxfoundation.org>
Date: Wed, 15 Apr 2026 09:52:32 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Mark Brown <broonie@kernel.org>, torvalds@linux-foundation.org,
 Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
 ben.copeland@linaro.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <DHTUDCIYT34R.3VKGNDGUUKS84@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <DHTUDCIYT34R.3VKGNDGUUKS84@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/15/26 09:42, Ricardo B. Marlière wrote:
> On Wed Apr 15, 2026 at 12:40 PM -03, Shuah Khan wrote:
>> On 4/15/26 07:58, Mark Brown wrote:
>>> On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marlière wrote:
>>>> Track failures explicitly in the top-level selftests all/install loops.
>>>>
>>>> The current code multiplies `ret` by each sub-make exit status. For
>>>> example, with `TARGETS=net`, the implicit `net/lib` dependency runs after
>>>> `net`, so a failed `net` build can be followed by a successful `net/lib`
>>>> build and reset the final result to success.
>>>>
>>>> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, so
>>>> the top-level make returns failure when any selected selftest target
>>>> fails.
>>>
>>> This patch, which is now in mainline as 7e47389142b8, is breaking a
>>> bunch of CI systems - at least KernelCI, our Arm internal CI and my
>>> personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour in
>>> the top level Makefile, the prior behaviour where the exit status of the
>>> top level Makefile ignores failures from individual directories is
>>> desirable since by default we try to build almost all the selftests but
>>> between quality issues and build time dependencies it's very common for
>>> at least one of them to fail.  With this commit unless the user has
>>> configured a more restricted set of selftests it would be surprising if
>>> we manage to get a successful build and install.
>>>
>>> As well as being a poor default due to the very high likelyhood of build
>>> failures this also has the undesirable effect of causing a build failure
>>> in one selftest to cause the whole install target to fail, meaning that
>>> the build failure is escallated to a complete lost of coverge for all
>>> selftests in common CI usage.
>>>
>>> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
>>> and explicitly choose a restricted set of kselftests which actually
>>> build with my system and configuration.  It was less obvious than it
>>> should have been with the other systems since they did not expect there
>>> to be a complete failure to generate a kselftest tarball and variously
>>> masked the error or reported it in a manner that looked like an
>>> infrastructure issue.
>>
>> I didn't see it when I did test on linux-next and my repo. I did install
>> to catch problems.
>>
>> Sorry for not catching this. We can drop this patch.
>>
>>>
>>> It would be really nice to get to the point where we can reasonably do
>>> this but we're simply not there at the current time.  At the moment if
>>> people want to see build failures reported at the top level that really
>>> needs to be opt in, we have FORCE_TARGETS for that.
>>
>> Good point - I will go look and see if we document this in kselftest doc
>> and add it.
> 
> It's not documented. It would have solved my issue, sorry for
> overlooking this!

Ricardo, Would you like to send me doc patch for this?

thanks,
-- Shuah

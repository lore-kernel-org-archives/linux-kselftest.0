Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F38F34AB0B
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 17:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776446850; cv=none; b=U++czqcWzx/5VoONbKIJteZjTo804lCNWAyy4BaJxLQNWDhds6DhPzGGME9s2xUfltD/351JjCd1arEzcfkieVVH+G5CE/M6y+I+yTLdW7gS7BoEqc1CO86FUBjnRL/meP0eQXSozZZM9xWb/l7zFnVXYUqY5k0nmGA0vxc6+wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776446850; c=relaxed/simple;
	bh=7Y+D6KqcYE9lTP7zS5oHeHLOKpJ4jNFqhuy0hQB9z9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwk7RJcK5ex3vtIlq0WEeuIq+00ksHzaeFeEzygWEIPlQBWKNU84OdrPvocsqGVGlrBxX3DBppMxO/jmR1JXJGMSI4nEk7FaE90/MI722S+vq6M2rJUwvKRkea58HKLrGK8lSS2VqmAu9PdaEErCXVeX2lZowdsuVVddhTQB++U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N5PKGutg; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N5PKGutg"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dbff06e4a6so933978a34.1
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 10:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776446845; x=1777051645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLn+P2ktPPdEjm49mYZXWZCPIYGUflvOd0GJ7r0DE78=;
        b=N5PKGutgvOZ01mZs+scY3X4VeezwrlWv+Z6jo5Je1cyfCfgnjbo+6KmlSaYhAUuflG
         VTxUSdgRlpNjGrtOGGZtIbhHM8g3Ij3wbyhTmQMrwJv/SrUFNWqRHqLN464xATESNbmA
         KD11WjJVAeWjbFp4u405DijA0TIvHtTOh+Vis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776446845; x=1777051645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLn+P2ktPPdEjm49mYZXWZCPIYGUflvOd0GJ7r0DE78=;
        b=eLh5vf50Vr0w+yYs4LZpIKPMjluhNiHq8kQMGMoa88zazuStwiUD3sGyK7K44DRM/u
         Oia8ezU/Xlc4UMbm96kVdibroJWNOL0JE8EJ9zLb52rq2CP1kBg03hvExtwBWUBbcBD9
         4+uDhXRxkuHK1JJYlYxL3jozsBu4dj0JWMwX39hXM/HU6HKFBj2CoIiOarh+dfC/ughY
         3J0ARBXwJSrXG7gCJbSuMWMlXhwB5U0iV4zfQUwAd+Uxp+DlBNcmL7ZTmd6UoXhOGSm1
         GB6M8UqRMOzyNBnsn0KsZ0qrbfGaoGqLvebBhrSwXwRY8wwpOvd7DWpJ7xEBE1qBQj6w
         IhgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5kF3b+dHOZI8BGaBu66hnwnhYXg6bImXNoNunumcPBSBeAy88OAMG0i+zzXfuoK4ljk1RL91kfPriBw00wKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7nmq/8dzfGunpcEvFa/6v9lU8gqFFYQXpyAeUPmprudtzh02M
	HPh5yPbgkY8e8mqytggW9VMXPUF/sxaLNniSNQWOYS74PgE9BeE5UzH3hwF6ibnSTxc=
X-Gm-Gg: AeBDievTD7MKySxiQJDzVs1/KMKA1tTHDacKlHBr73uFrL+yA0Xr6E1pMxixc4rLrbk
	b4BHVopNIkZRjFq7MW8YjGgE9fNQiD+Wxld4F8iSFhjNXmiERh23IjAndJE3ujIoNc0AXATgN8R
	eDaDIAIR9p71E0bHunq+Yb8WgwbN5JXatZ9lBK6Uk4VfpZDkLOxjhV8kF97gc+Yv/GLTO7RMmQE
	GsT5uQGIan+V4Yah5J33/POTFsyWhLQJ0wsUNtNQLKjTCxUV/Eyit7AKVtVDn5w6wLspW4dB73D
	JdbJp/Ny8IymSgsN/d+wi7Maq+LX+TbmbmHQzSBGfOupctffYW0uQ+zPhSwJdOrQTPNEzqxCR8z
	M8VtebRJaMzr1LwAZXrKO4pObmpdOT4agmL/W20tTlktCNulM7eZuhfNCYHRYx1wUsSwj44u457
	eFpH47hzLoVQoEXK1UlCPb6r6gnv7dMSHdDKJRg9T+dQ==
X-Received: by 2002:a05:6830:348c:b0:7d7:cc53:c457 with SMTP id 46e09a7af769-7dc951e22b1mr2523842a34.17.1776446844974;
        Fri, 17 Apr 2026 10:27:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc975b06d2sm1585184a34.23.2026.04.17.10.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 10:27:23 -0700 (PDT)
Message-ID: <edded65a-633e-4891-b4b2-cd85aea20f66@linuxfoundation.org>
Date: Fri, 17 Apr 2026 11:27:22 -0600
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
 <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
 <e54a02b1-dd0b-4dd4-93aa-0484bb2cd8fe@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e54a02b1-dd0b-4dd4-93aa-0484bb2cd8fe@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/26 07:30, Mark Brown wrote:
> On Thu, Apr 16, 2026 at 03:15:30PM -0600, Shuah Khan wrote:
> 
>> Just a quick note to say I applied all 3 patches and will send pr tomorrow.
> 
> Confirmed that everything seems to be running fine in -next for me.  I
> am seeing the test number duplicated in the log messages from the
> wrapper:
> 
>    ok 59 59 selftests: arm64: syscall-abi
> 
> which is confusing my parser a little but is less of an emergency, I'll
> take a look.

Just about to send pr when I noticed your patch to fix the above.
I applied it to linux-kselftest next and will send a combined pr
with all 4 patches tomorrow.

Thanks for fixing these regressions.

thanks,
-- Shuah

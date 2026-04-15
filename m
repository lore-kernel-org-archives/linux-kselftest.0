Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8845D3DE45E
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776267642; cv=none; b=hJ76TFvGw94/Zc0Qt+Qkqjif1vYq8HMlJhyInu5qQAUNJNBJJns4/1ETad/XFKPntrkPSiw2OQb3AA9+YAazIHrTDOXxJBorSEzb8K6AGYbtWnyAIZttoPW7KPnTWzkMtfyxYq3i0BO5VANkUUEC2M5WpduD1ijWMdw5DirkmH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776267642; c=relaxed/simple;
	bh=peiaXFopgD2U2+byFyO3EYl1KnMQYZFQdtVvq5N8icM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FflmnAuFnkrAfOTu4Y3bOKt7HjS49hIoMifct3DHNPdvDkElrtDjb5fD0rVRJgccasALAcXWB0xb4FM9DiEeZXUqyz2VdIMOJUeGdect7sGWP6QR0siuK+EzYUKsiswOOS1UfEB8HrHj+uCjH1WmLiBMAgm4xqMSZIvZFvjWOh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XglkLSTl; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XglkLSTl"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dbff06e4a6so6616997a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 08:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776267639; x=1776872439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bRbU9EO4HkCghO3rFTcKaAJtXlf84b+M9U+wgEYVq24=;
        b=XglkLSTlxeLFgvXJvM/Vu282lSe+0DAJ2I/Qt+vIjTWprfzeo82P2n2ffXS2Q2vC4u
         hH4Mu256F5Ov6Lt4m5+ylnel5nq/EW1MJw34BI2FonBFBRzBaa7q0m9LJyMFFDEckjXk
         24NEJOedkfropoyPlhOPsZVAz4pXzX6IkArzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776267639; x=1776872439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRbU9EO4HkCghO3rFTcKaAJtXlf84b+M9U+wgEYVq24=;
        b=kbhJpUcyQVPdjr02rRlO1geDIqFN9VR0LpkM3dFocyE8FUoTUv2ckZmHKd3mOTRIZ7
         JvKSnot10VYW1vcrfTBD+f400SeRTP8saD0BGMobaFhqxt4Tc+xIkdz53GpIrjHmISxj
         NakWL5feVD9tPgOAkySLcRbgnEMnckezqk6LicrEIQWtxw5bQbd9nXyG0GQWB6Bf3ukM
         fGiaL1uy+1FNWAStSAFRdXlzFYR71iVxy2N8lUtfx5rG4y0SjxqBtnhfISdArXl8Ew3m
         ikPcNAtM1nqIkB9xhNkRbgZ61kl6epk5Rj27eAYy4kZ14eo93XRBYRFsRR2kPshYEjn5
         ZSEg==
X-Forwarded-Encrypted: i=1; AFNElJ9l9TbhllVGKEe+6aspKdEWGGpXGLKWKa8DceJftjbjGuw4JrMrF4R5ISjFOe5aVgEOu41amKpNwEaRfwlYWeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhccNZ3Nwcx4qGYak3ca4QPJn3QYkq5MtJQO+sP02dqBOe9wUG
	iZ2mldlCK5dheZaJDDB7fgKb9x0kieRUNY9MtGu+N80JGNIxChNMAAoqv0e9G0oj8M0=
X-Gm-Gg: AeBDieuYyG51h+vdIWyasL/iJtGLKCSjxsXjCQgy7BKMPxxYnPr7dWNNZPGYuPyL4ex
	XiVJ4Ewi+GQdfU3vfFnC2Zb1hHZwO1nDoxE8eFVRc84Am8+5W1xWaD18Tyu4OEG7gQluRmNlr1m
	/LrEFenk/w8EYDfFS0tAywo1+xyMPQK7GMDNWUfiW/TUUJ5jsK1Rhv1nJx8cURdX6jd9MPvBOIB
	MkJM/e9g9Dowpn1DKpHTlKINW96HjH8PSn8MyTcBocPhmt+wII1xUxB4mdpilKn4A0nhRNOB8ZE
	fWQmhBbmVeVRrJO+7gCy6o3sodj1HeMp/vrr7QQBp3o9njecZiW6+ZeAqWUZLExbqMCYnBZR7XA
	ucdRJKJa16gq5LWwTAVVTiN3Medu7yT+zFq9L+YyEw/Kh6sY8Knyo7lhNuNZgvT2UhxEx3xTrp7
	1ALwSL9D/s31ETp3J9nEqBBYbqvJ/Gt3M=
X-Received: by 2002:a05:6830:6f85:b0:7db:b7ae:ef0b with SMTP id 46e09a7af769-7dc27e1a8fbmr12524416a34.24.1776267639310;
        Wed, 15 Apr 2026 08:40:39 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc76a333e8sm1470984a34.8.2026.04.15.08.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 08:40:38 -0700 (PDT)
Message-ID: <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
Date: Wed, 15 Apr 2026 09:40:37 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <rbm@suse.com>, torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
 ben.copeland@linaro.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ad-ZdjzQZXNgkpwv@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/15/26 07:58, Mark Brown wrote:
> On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marlière wrote:
>> Track failures explicitly in the top-level selftests all/install loops.
>>
>> The current code multiplies `ret` by each sub-make exit status. For
>> example, with `TARGETS=net`, the implicit `net/lib` dependency runs after
>> `net`, so a failed `net` build can be followed by a successful `net/lib`
>> build and reset the final result to success.
>>
>> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, so
>> the top-level make returns failure when any selected selftest target
>> fails.
> 
> This patch, which is now in mainline as 7e47389142b8, is breaking a
> bunch of CI systems - at least KernelCI, our Arm internal CI and my
> personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour in
> the top level Makefile, the prior behaviour where the exit status of the
> top level Makefile ignores failures from individual directories is
> desirable since by default we try to build almost all the selftests but
> between quality issues and build time dependencies it's very common for
> at least one of them to fail.  With this commit unless the user has
> configured a more restricted set of selftests it would be surprising if
> we manage to get a successful build and install.
> 
> As well as being a poor default due to the very high likelyhood of build
> failures this also has the undesirable effect of causing a build failure
> in one selftest to cause the whole install target to fail, meaning that
> the build failure is escallated to a complete lost of coverge for all
> selftests in common CI usage.
> 
> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
> and explicitly choose a restricted set of kselftests which actually
> build with my system and configuration.  It was less obvious than it
> should have been with the other systems since they did not expect there
> to be a complete failure to generate a kselftest tarball and variously
> masked the error or reported it in a manner that looked like an
> infrastructure issue.

I didn't see it when I did test on linux-next and my repo. I did install
to catch problems.

Sorry for not catching this. We can drop this patch.

> 
> It would be really nice to get to the point where we can reasonably do
> this but we're simply not there at the current time.  At the moment if
> people want to see build failures reported at the top level that really
> needs to be opt in, we have FORCE_TARGETS for that.

Good point - I will go look and see if we document this in kselftest doc
and add it.

Mark, would you like to a revert for this?

thanks,
-- Shuah


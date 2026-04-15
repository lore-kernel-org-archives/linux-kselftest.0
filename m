Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECB73D75A6
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776271190; cv=none; b=Q5589REU4/0SgkWR+MJJ3HbDDrZ2rXp24okYW38Ursotz7eImSXmJVkPhmHRsDZ2a5LXeK4YqFK7AWOfxrnqb7WcfnSV3Tmwk6JnN5gMsSrmx2SS1VSTihll/m1UMMtpsJ4ArN41nNWULfhg6GXH1bziCSAyEzaybYt6v4D4HDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776271190; c=relaxed/simple;
	bh=f0Xhz36jloHzjGryaVb2w/X3cuD5tHkh/y9qkWJJBQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSmB/cQBkgnB4Stb/59hmozZo6oTPUpxZjDpRM2sBGAOwL7q8+tAIQYoNxIHfQMoFwUf9beJsp219SbtBXELg7VHTIwzYI89CyaV6dwEuw2/zc/cV4s4fOkfF5VcA5nw3kWv4iZgJkkahy5LcL9VusJ2AdMaVzKuOgg8qrP6xlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qlt7PXFv; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qlt7PXFv"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d9e22176a7so3704262a34.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776271188; x=1776875988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sI6SnmW4yH3OEitrbAs93gP+SdSOTHdc6LjUpuJ7Fnw=;
        b=Qlt7PXFvw9FcmqNI0M5j4MkprnKnAPHjJApGeSzTW0tNwq/vfYPKbp8ZnLlVByAAvC
         daH85kVHmxKMfv3h9Azk4Fxx0zH+vsiV1PLXC2iEhmgRq3rc19rl3tir1eh4G/I0Nnl1
         STPjHmMadICWnenFos2h9RPv4bM4L4oG9+f/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776271188; x=1776875988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sI6SnmW4yH3OEitrbAs93gP+SdSOTHdc6LjUpuJ7Fnw=;
        b=c6IiOd4GrY9VXrr67ZmRfPJXsvmeyR6Mqzwy4v+jiWr6RcR6d2S1cUlBVVCHi0U1UC
         FknA16rR3LknZ6l3kPF46uxEn2jXe6inzjnAQGMIpPrwgdstXn7xmTiQ+Erj5YuWFpdn
         GvHzEqQLcGboztyM9dLix6l4TRiH0coLW7ID9nnw5mIp7fsWYIO37QRqDSsQ7y1/Wzlo
         SKYCYx3arOAlXs9saMiiu7kVOXQDIz0IHhlUYx5rcmlJ4AB6oV5NSXc+JUYlO2zNLDLN
         o3PtdqUSZiDmomzxAiBx2u/Ze+w4zAkRk1CWHT68dLkWShDOhY7Z+neqbxvuuLHB5Tgl
         yjvQ==
X-Forwarded-Encrypted: i=1; AFNElJ86TJgFGbZ39mJfTHPMvemge8PyNUv08wdvIQcoXL/tZ/S2d3KSuMvB3930qfVQvD1npRYzdXWo5Bz/vFqzmWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1UeVNZtxtSKhtK7EHxf3Q56UdrlAZNIiL06aw0JbgVVwckPWg
	tvDyJyL5riF0HMMP0ZiH1AuAHjEBfiPZjRNregdf6AgcGyeyDd68NA2Tzd7XLm7h/EQ=
X-Gm-Gg: AeBDieuSFnr20xKIbypL6bIhAvJYzhMOXyendol+Hp0dljcRpNysbqnZ+RxgNH4wbpJ
	a2gg5eCLbNTje955uZ9zmZm09Wma4dn/s5lR2sur2wzYpP5+pbo+qhsakuDFI2nVrisbXH7c+1U
	hWiFRXjMfDYYZIiIi4PefDlOX+A/ox+M+OST1kVj7Y36iEtsnJ3+xiAiihtebNf8r4qthhQ8eXN
	SmI/Nrg21wr7flajCJqWmkhiLi518ZkLkDtPnkOdHrm5uPUmfU4YJEEmSKn8MK7dtk+8AT66z2j
	iQ5DyCD4WV8JXIetqJ/RZ/xZ20J6ra78PBr2W+GbnsoJKFguW36DuWQOaJZRh/t5jEkZY8bbOS/
	7bgRHUJ3YO5iK4xLr/5Ryktq7Ewt1pnqoFJ/P2hhWY0LvEBCCSRxI4P0HfhZiN6C1SQG82ivhca
	Cq2EAymFjHD7CVnvLobZ/NxSUaII+rMxc=
X-Received: by 2002:a05:6830:61c1:b0:7d7:4a7d:fd40 with SMTP id 46e09a7af769-7dc27f23b8cmr12850964a34.22.1776271188347;
        Wed, 15 Apr 2026 09:39:48 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc76b2dd7dsm1541449a34.17.2026.04.15.09.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 09:39:47 -0700 (PDT)
Message-ID: <b35bc514-5def-4e0c-9260-79bb2ae9da94@linuxfoundation.org>
Date: Wed, 15 Apr 2026 10:39:46 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ad-8BIkw_ijCLqcF@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/26 10:25, Mark Brown wrote:
> On Wed, Apr 15, 2026 at 09:40:37AM -0600, Shuah Khan wrote:
>> On 4/15/26 07:58, Mark Brown wrote:
> 
>>> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
>>> and explicitly choose a restricted set of kselftests which actually
>>> build with my system and configuration.  It was less obvious than it
>>> should have been with the other systems since they did not expect there
>>> to be a complete failure to generate a kselftest tarball and variously
>>> masked the error or reported it in a manner that looked like an
>>> infrastructure issue.
> 
>> I didn't see it when I did test on linux-next and my repo. I did install
>> to catch problems.
> 
>> Sorry for not catching this. We can drop this patch.
> 
> Yeah, it's easy to miss if you're set up to build everything.
> 
>> Mark, would you like to a revert for this?
> 
> Yes, I'll massage the text from my report into a changelog send
> something - it'll probably be tomorrow now.

Thank you Mark

-- Shuah

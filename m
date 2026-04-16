Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E6135F5E4
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352874; cv=none; b=EN3nbd2gkShavIV23sH7E2pb0ggwYmgW4vcD8EvkTsFSGLJLlt08qkOloiEjwPxhfBW8U7BuCddCxNZ3ZAy2SNgcPXK1qos9VKclan0Qjcvl5iC9YzYZYKvZjquZblIovaSeljL7u+ouKTMNqrZaWTqFg4+kzJsclwRBrx3GDLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352874; c=relaxed/simple;
	bh=lY8KnyEnww1BaerqB9rUeouJcntcbdG7KfY4D4jc3hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaQnWVB2mPN5EM3CeKMwD6awL+zDFLwg9de9Kxy7ZRwzrbWri6OQscyVpjvp9m8MV0ge0eKQ8ZEeIbxkGZnOzKg7OlDu2zAud+7OA4J2Z762OzX+ZTxtb38MFBLQKZPVKmY2tWanZ/SL83ymWf2C4D/BalLC/tJ6L22OtrhTdmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UXD+qgWg; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UXD+qgWg"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4230a00de40so626017fac.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776352872; x=1776957672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ED7Dtk/V7JNqL6bwm+6sfQAnzfjIa9OPc/3hBimeik=;
        b=UXD+qgWgk/64Yt2GJgOpAU+SRkyuvWJaYd7Dy4XFvOUF+8y6zYAusyTKobEbIbGnva
         3xGjwKXH5t4ooZsTk7WgeIoG7XrWBQInKdhGmjavoIW2OYFcDTdsFW5UtaF0uxyHvYj+
         w/DTeAv6C+f6GYxKsZt5eefMY0G+6JtzOxA8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352872; x=1776957672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ED7Dtk/V7JNqL6bwm+6sfQAnzfjIa9OPc/3hBimeik=;
        b=beaGjw46geUY0bHVvVGXubJw0FTP2C0eCFVcXUG/e/Ub93Jtgrm5sJ2+CuKwLl9vat
         3rfCQoM+7otx3hCkxH7Rnxl4ZZWIJniQieE6WBvuA7mXIUKRKCVvbEoQwgCpPqBNfTVO
         wXdhfBPLe3ZZmaMVyDL3CT/d1gnzEG6eq9bWRtfjlz7+1/hb+Ma5hMlJXF6xA8WaIjRw
         IDN5XY3I+Tm2cy2+USyA3SvC4I+iPB8Ok3x4WVDdTBGxoiqfKKBb/v8OSDQL7Z2yhXss
         Ss6GKnJvRbOZ3LsUcOL1q8dVtnVsixJbZzY2y+EJZyYK1Tukyku3+TJSveuDPAwNNZFY
         VcYw==
X-Forwarded-Encrypted: i=1; AFNElJ9xFKz31LlGX2j8WymmXPgvGfXKdH/EDWNutHMzPBRWB/xE1WlscdbqsItencj5xhEq65lj9lK1HVfRIYvjK0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs8js5dyEtnVhkQXjS4AeL28TPh48uUJkgzHbSNMj9re3Ycvix
	yef1Y8hsenlHiqI9XV9SELiNaimM/Kg09vxSeEx2KkJt1zWA+SVSruf/pOZKTCotOeI=
X-Gm-Gg: AeBDievE9q68M7Jhi0tvH4wntFwn8jmjqkiJLxD4QEu0R1z5/UIeGtwsnkUsmAmoOgF
	plZZTap0MyfqP+EXZElhJeHLydGK8ui33JZOj1/OwlQny3rY9v/dOzBIz2jxqJQMiaV4AcxF0z+
	8kOZ1wZrEEGWEqgo37OE1X4uvdcvyGGu+Ztl5iAGEg7VlKo49hi9JMR7Msyd7nGyvwxh4Zar23Z
	cCIs/ADiKxvwe9R59vxg2QGf1WKvDSMuVosis5NMxl1hlxJD3zh0693bEeZ7NVPoD2Abu6ZNN0b
	MKZ4dXx+SSS6+/9fEfMTMEtRc8Ia61VvJRJ0OFc8Ktpm/Ljmhff5FmJJAHpyE2sFpyIZAdKWSXa
	PlI4PWIWM2IaomQJRF4GQoz6Jp3h7tss/7nfDwsC8vpKPBiRgBhwoXIEQzQwnblE+u7Tv4Sfqqu
	wZ2zIB6D5ldjj96g76ucmznP3YbKB0zVE=
X-Received: by 2002:a4a:e39a:0:b0:67b:b738:59b4 with SMTP id 006d021491bc7-694249766b9mr1880122eaf.32.1776352871649;
        Thu, 16 Apr 2026 08:21:11 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42689699dc8sm4149132fac.14.2026.04.16.08.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:21:11 -0700 (PDT)
Message-ID: <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
Date: Thu, 16 Apr 2026 09:21:10 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <a73aa838-d194-4867-86fb-42bc8d057fd9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 09:15, Mark Brown wrote:
> On Thu, Apr 16, 2026 at 09:08:17AM -0600, Shuah Khan wrote:
>> On 4/16/26 07:16, Mark Brown wrote:
> 
>>> Sending shortly, FWIW I'm also seeing a buch of issues with:
> 
>>> ./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
>>> ./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file
> 
>> I will take a look and isolate the two commits that changes
>> run_kselftest.sh - sorry for the trouble with CI this time
>> around.
> 
> Pretty sure it's 2964f6b816c2 (selftests: Use ktap helpers for
> runner.sh) - I've just put together a fix for that one, will throw it at
> my testing and send it later today all being well.  It uses readlink -e
> which isn't implemented by busybox.

Yes 2964f6b816c2 is my first suspect with ktap_helpers.sh no such file.
Thank you for fixing this. That way we can patch it and not revert it.

thanks,
-- SHuah

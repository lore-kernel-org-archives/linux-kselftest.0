Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A08541462
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 19:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092186; cv=none; b=Cvj2VDf8Qw9xhgB9VQ5U+Zzvu4+4xPNj8heRV9zB+rYIDkK74MWBTdHxgl4cVCv1orenuET9i+EjXm2dAoJkB9JZO5DI3pRlABQAE2oRqmCKNgsdbXq86NnoW4kmU2ubY5CZW3VU1cDxBMp1p8J20SH8aZn6X/gkilly1uhRTDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092186; c=relaxed/simple;
	bh=OdG9rW5898KDaBRDabW8SJyvwLGoLiCjrkhpx2bMMJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAlVs/HqLKGI0EDOPooGROG0pvREI8UeL0l6Q9r92x54nT6nZO8B65x+ORR8LFldlE2bLIgLa7JgbNA7j8B5oTV6TLCbkZY1a9M2xhzhWjk/wLZFp2/BuHuuB4hbDeeppBXWP1pUX0UcfuCA/He1+hVnimj2qxESCl1CJ/OezPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EP4IFrV3; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EP4IFrV3"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6df7f544919so3800010eaf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 12:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792092183; x=1792696983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUALdL9mzi/lPiIZ88I6AcamdL4Eb3iixPrb9XTRKdg=;
        b=EP4IFrV3k/5jpj33W29WCY7FoOaa7qZC/zs/PBazMUcmDkzBIxgPcsKdOAdzEp5lEC
         54wG51udU6C9RKbF1eimWrx9M3qlRz3TeBJS0PBOshKjGhksFkwvaSA4uPsfCYAKrob3
         rxCIWWxxGWZTrypOZEbljB1iJ3dzfQ6Pvo+Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092183; x=1792696983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUALdL9mzi/lPiIZ88I6AcamdL4Eb3iixPrb9XTRKdg=;
        b=m1oWV2KHQ+IZ30XnhocUfwYZv8BhdJRMMMBbSvaHz62fDszy3O2qfIWFdt0xGVOJbd
         FgmpKZXuKHNw49TRDwPwNP7hWjCnjSTM+GBOvjvpLYnoaBiZG+WjRZ0sklxzJcuox26S
         R3L9lCTPrfE0KmtlKGj5EhphSPlXerZIQPo8fojrQ5aPTnhjYelsct8+WwrFHzQ0G2e0
         kZuynRd175shmiLg6K+AzntMMmO0sVn43hxnxM51pXkj5wgCbH40e0wIQPaG3T7NdE4z
         JpHbdwgNPWyB6kVup2ikJXGuGuwgixyu9P/QiAol2CiPVmSmM57CUlFtGdZlTx5UssMR
         29Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwVmVXUFeWvlbCGUWjzxbeaif/zZh1KLVY5zWN20mDa+SzW+aitxXMYIyjOBC07C2RmTP/LeCDN5mVu/CzeLO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqeaXD/GkjLs3eyOiMS9c1rUFhQlAizEDwvSJ1lz3QebzRurt2
	VHYYaRRC8xj/SCgerAKtqXtXXcS7XM3ZY3IYCwauTW3lKZW3cR4AKAEKZEsX8+gtkgs=
X-Gm-Gg: AYBFou338oVvG2G414kncLuOa8AnqLWEPKkl4/DaaQhYO/qdNYgo9stPSoxANWvLeHF
	bFS8iFaFCKJwRMQJwytJ6Uqk7+A7Lio0fKgbVEh1K9Ol5qg4cz1uM/Ez6tq1Qxz89vrBseJlEO+
	FRY12ayN54rv4vaomwLa2M2sUzeLunPyu5iZx6nJJ/V4mjYiCyIcBm87RJfeOlOAMo659Us3MjE
	4C/ZaFvvkeseAsm/BovT8VgzMWhnrleqDIZJYxFp5gNX3eJK7nkonRsPtr9LqgVMJ4iXHQTKp0P
	Gy83dmytUrx5g3JcsR9GlK+R4tt8XMv4D02BPWNGMyCkFXlEbQRJBnYlwUs65f4AuWwonmxXwGG
	qYP3BChe2KfYZsJ28v7blss80Krgjv1+50PhSXrijtQWIyiXWTN80dAzp1AgBCLHzaO9b/dJkJY
	3n6LNdwt6Ds9QQL0J10fL8qVHGscLr5FgFYS+1G7c3caGpgh/vKMwArMhKKhC2IhdpdEYSddYkB
	zK2gOJkTg==
X-Received: by 2002:a05:6820:1ca4:b0:6fa:db5d:be1 with SMTP id 006d021491bc7-6fadb5d1246mr6780700eaf.11.1792092183278;
        Thu, 15 Oct 2026 12:23:03 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a0f284d1sm18623a34.2.2026.10.15.12.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:23:02 -0700 (PDT)
Message-ID: <5bcc0ed9-b48d-483c-8bfa-ec31f111320e@linuxfoundation.org>
Date: Thu, 15 Oct 2026 13:22:55 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] selftests: optionally record per-suite build and
 install results
To: Sasha Levin <sashal@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <rbm@suse.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261014200115.1363363-1-sashal@kernel.org>
 <20261014200115.1363363-3-sashal@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261014200115.1363363-3-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 14:01, Sasha Levin wrote:
> By default the selftests build and installation succeed as long as one
> target succeeds, so that a single broken suite does not cost CI systems
> the coverage of all others; commit cad6f32665cb ("selftests: Deescalate
> error reporting") restored that policy after it had been tightened.
> The exit status of make therefore cannot tell which suites failed, and
> inspecting the installation is not reliable either: a suite whose
> compilation failed can still install its scripts.
> 
> Add an opt-in report. When KSFT_BUILD_REPORT names an absolute file,
> the all and install rules append one tab-separated record per target
> with the phase, the target name and the exit status of its recursive
> make. Generating the runlist is recorded as part of the install phase.
> The records are written without changing which targets are built or
> installed or the exit status of make, also with FORCE_TARGETS. Nothing
> is recorded by make -n, -t or -q, including when the selftests are
> built through the kernel's kselftest targets, which clear MAKEFLAGS.
> 
> The recording helper lives in a small fragment so that suites built
> from subdirectories can add records for them, and the variable is
> exported to sub-makes. A relative path is rejected, since every
> recursive make runs in a different directory. Keep the exit status of
> the runlist generation loop as before, and create an empty runlist for
> installations in which no target emits tests.
> 
> Document the format, version 1, and how to read it.
> 
> Link: https://lore.kernel.org/r/20260416-selftests-deescalate-error-reporting-v1-1-38e7c0536227@kernel.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   Documentation/dev-tools/kselftest.rst   | 38 +++++++++++++++++++++++++
>   tools/testing/selftests/Makefile        | 31 ++++++++++++++------
>   tools/testing/selftests/build_report.mk | 26 +++++++++++++++++
>   3 files changed, 87 insertions(+), 8 deletions(-)
>   create mode 100644 tools/testing/selftests/build_report.mk
> 

I picked this up for the next merge window. Patch is in kselftest next.

thanks,
-- Shuah

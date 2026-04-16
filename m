Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B034C83C
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 21:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374059; cv=none; b=DPJSfvLYVxNMdi5OKkExNuj2HZFfG52GdyVi3Kt5F9frxinnIgJUTKhLfvu5IAh6uwMfDliszapWp6doNMQM705kvV+VLh01emAHGPS3dCSheAj6R1Y5mGFJPfd0F2wvb/pqu7Ni7N8BDCovIkJxpaywSd3d+0gVzITrYTHZXxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374059; c=relaxed/simple;
	bh=vzGCSdSZGgznvW2BflHE/U1h+EX3Txa7VKjbpQUid+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnLzDWYe7pPbsVBVMCCOuPQl0Q6a6Jdm3MIgp7VUZnWBGLwHFWl7QggOF2Krv9kaL5TcvPRGYlDt1luLjUWdZcKV0JfeKJNv51vIQ48vQuy8Y05Tl+SlKu140O6eMWAyDUBSI8O+3ziRG9c0DtaVS0fw9/LXoqt1ZzgwXI1i3zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Lc+QyANV; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Lc+QyANV"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d4be94eeacso11513a34.2
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 14:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776374056; x=1776978856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=636WrS47DhMrab3WetvRTiVdIVfIM/ZId3iUkiQeAM4=;
        b=Lc+QyANVubb1V+Bj+NsW7SG1KnMV1EJ58/TMFgscUhgMQmzGZ4v6dfZKIUR5MrAybP
         hMfMAP38zwNF7ohp6QKUy9NDMPQTWS1glZqFR3NkOAZxwb40UUAtN6jw+4/1FMSbbgl4
         A6sOLXYtYMjnPcY/yZ70hBFC4K6felxeqXVg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776374056; x=1776978856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=636WrS47DhMrab3WetvRTiVdIVfIM/ZId3iUkiQeAM4=;
        b=E/vI01SH+rDXGaa+gCP9KTaXmQ7/4r4o7McYMqA5o3/xzTCga/CrvmDLeRTDRCgbzU
         NWx5EquwMA2sWOtrj281QC0V4e3VQWX1upDRONHJBy8+BCluVpIMBE4SjtBIj81wV/mT
         +v2SywOrPRY0+RVI6wTiaMN20ITm8hqj2pwUOD/vCXrVjmUG7JG7Csv5O7JEfog0NopD
         OSWEgscPhCdErf3bZqDHiY5pjBA/dtdLd3Aw0YUpFwBZt/dFs6F9lUiLvRalxIC1ob80
         rdscaf683MyAnwXGqHhjYVhVZ3CeavJTK2CJdRkzwnjvGftdwXMh16JCzEYIRShuHXgh
         ITaQ==
X-Gm-Message-State: AOJu0Yz01OXU5AxH/bT+uFC563E7CDS4hO1t8AZItHNhl+RuU5nhLJkr
	ul/X+vo1nKnXTLqYVcq1rW/6aVk+wXhoO2vGJX+EmO7YVLfDWVBjKE3bh1W5s/iqffQ=
X-Gm-Gg: AeBDiesyxdAqptz16jyn0pPPoZdoA+aFkcGmKt+tJliHIP3kXbSr/KX9T6gsXuqzr+v
	uvO1KgdRazVPI6uo5hXYYeRKJnAXRJNqwnDyUTDNEh+INAeEG+Dyy23ijzLVGvKPPCgnI1FLIAS
	Hd6NXwUxuxQF+ZZFs/4qRYUAD3AbDJ2LdNylePfpBgB2CkUNm4xclyOb58JaZDENfF1X4AKP0UZ
	brSQIAVuUNE863UZ+8O0sKCs2N0Dl1dFxN6pJaq8P6RE+lMP5qt2saWbWBW0PD1exnYWlLR8aCq
	uYqmgqMda9hNF5huhh9NamyWM9LR78G7ZMfJM9ew9i4jisHWkgBtskshj45F5wlJ5akOi5Kw8Ak
	je97U5jglEwH4971Icj+Mp8LAD082YhEMWzCMAUYgBcyvOPWeUfvJw6xNd88c73NH5Dh3G8NrnX
	rio1nd41Ub/OPCtRu2Mds0flJw0G2Ewyg4WWWuBtnpnQ==
X-Received: by 2002:a05:6830:3152:b0:7d7:ebf0:34b0 with SMTP id 46e09a7af769-7dc951c681dmr139660a34.15.1776374056218;
        Thu, 16 Apr 2026 14:14:16 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc90c94d9fsm752957a34.27.2026.04.16.14.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 14:14:14 -0700 (PDT)
Message-ID: <57e570f4-af6d-4055-8464-2a2d552542f1@linuxfoundation.org>
Date: Thu, 16 Apr 2026 15:14:13 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: Deescalate error reporting
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20260416-selftests-deescalate-error-reporting-v1-1-38e7c0536227@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260416-selftests-deescalate-error-reporting-v1-1-38e7c0536227@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 07:19, Mark Brown wrote:
> Commit 7e47389142b8 ("selftests: Preserve subtarget failures in
> all/install") updated the propagation of errors from indivdual kselftest
> targets to be similar to that seen with FORCE_TARGETS.  While it would
> be really nice to be in a position to do this currently it is premature
> to do this as the default behaviour.
> 
> At present we default to trying to build all selftests but a combination
> of code quality issues and build dependencies mean that it is almost
> certain that at least one of them will fail to build (for example,
> several depend on clang so don't work in a GCC container) and a top
> level failure in the kselftest build reported.  Further, the resulting
> failures mean that the install target does not run at all so any build
> problem is escallated to a complete failure to produce a kselftest
> tarball so CI systems that run into issues loose all selftests coverage.
> This has been causing disruption to a range of CI systems including
> KernelCI, mine and Arm's internal one.
> 
> Revert the commit, users who need this behaviour should be able to use
> FORCE_TARGETS for the time being.  At present users that do this (such
> as linux-next) are most likely building a subset of targets known to
> succeed in their environments.
> 
> Fixes: 7e47389142b8 ("selftests: Preserve subtarget failures in all/install")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/Makefile | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 

Thank you. I applied it to linux-kselftest next and will send pr tomorrow.

thanks,
-- Shuah

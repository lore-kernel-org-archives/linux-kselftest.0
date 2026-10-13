Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333464A9D44
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 20:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921899; cv=none; b=lOVW3q1H5M0wlmSlZ5dInx0jBPzN4Gly9KoUXaOK226/TK61Z6i7Xi8kI37B+AACneRkSpU5RRdnAnHaO2eu64AXrCF5EmjJPUduhFK0i6JMrQMc77apNWHDMxTVYpSsi3fVFaDByXv7L7vuT930Xp/SVtTRCDYXkPJ5hPiDKno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921899; c=relaxed/simple;
	bh=jsf/N4puSeJOQIlhIhkdxik0aMfrnwHvBR4c/f1fBN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=no7cu4Ie698NJm/GMctBhdEcXYWUFifyN2bFhZNaYXNf/Di2Iv8zNcIPq13iJX8Fvp1QIPnHTkFsVOsL4v1Mkla6IipjM+iziFtvDI07WNti3Vmexuvw0OJmx57nbjPkvtmnnplLkOxyoC7mIrckH6Bm914lTpgDLUFqmigUFVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h7+Kmg2n; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h7+Kmg2n"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6de08b2e447so1449028eaf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 13:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791921896; x=1792526696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8k8GHcZymDm4VuYrOBPVcb94WVXehxdLUIl/SQhO0TQ=;
        b=h7+Kmg2noTICU1LwuDE7LKCT+ll1OhtqfHLp2Jsy5fmulpQM5RUsLgfDRKO51guKOG
         XgBoxYVRS6X1+wv6DGaLfqbcn7tugLOHjtPF1gK7pf6eXYwTkw3ja1FWrCn51hrZpcFJ
         Bo6hgINnltAx45iZRrAIsUYE3HQJjQEe9v00M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921896; x=1792526696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8k8GHcZymDm4VuYrOBPVcb94WVXehxdLUIl/SQhO0TQ=;
        b=HDfRrH9qXiVYpSAQ0zVxRgJToyjCkNHVoFUBOdjIuBpWi5igT3Px6Cse5C1mNx2a2V
         UL8Ll+GHmVro8UopYJ/intpI0agcEUjYMwCJICyBqifrQJWy8gU5OXSUJwVn/xgbrHH9
         l6C6K5DzYqTjcM79flQ9ZjhZrZbLe7UhLNx9Kn7Xc+L9JwDXB7nCxPqaeVWZPLeQTD5g
         VnKEMDtXr3S9tGiph8Lt1Rv3wg61GSyb6iBc9W7rvxtwCVAzj6Whs9/EF8K10mF+vkaZ
         rrsJWmRDM5uJRLwF2jq/0GVzMczOMTGz68FDz+WRwAvu4wxITKXzQ0Aik+Dqwn/X2so1
         pcrw==
X-Gm-Message-State: AFq9FYKb1OUFL2g91F18Z7QOSw36dwA6LdnDNW6yUV4m+a7mtX5pHNYU
	3UcNLQWAKrIQMSFx8Auy/YmHpglaTa2f6YxCj+RP57hfbxJRyJj7S2Mnsw21lXtnLVM=
X-Gm-Gg: AYBFou0ID3T21zssyRYG/zV2EKCoAjRAWhK9qTREBEqGxTW0b7DejoUBe9EAXPs2uQ4
	r6v2mrdpqz+D4kA7KTB+6PesepKzwADHcXHcOza3FhSkR6SkkyQhP8381AtjB7SpwQmpoO4Vn7a
	4Jgxz83AQsp/i3bFAlxDIvQ2HEoE27vG0ZxwxYWSycseuJvlxFY5Pvxl5giDZIrThC+uSVhGpMP
	XLbPJ1ePi1gdzkU+im2TFrV5TMLyusMrh+8xx27pxDI3gLfwQa1V2ErgOorfM3sborL3ey56MbR
	rwhq9kOKtjrcNOYZELpn5pzcQU2GnrG0wXRvv8emV4bWFLf4qGoOj30WPkbQC2Aj5FGo1ZGjdJ9
	wl0RAsF1fl1Vkk6PTY9q75oFr1PdD34Z+nFsa7SUM0BLtMztPJu9qJqH8jUttRvhWhH4+YX6mC1
	fe3Gtc4F/9lrpZ+SRd7RjdtzGKTwoTNqYW7BKm4QHk+kThLp/WVIyiHmoSLKMqML5y6StweEoiS
	JI2tks=
X-Received: by 2002:a05:6820:c8b:b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-6ef10e69495mr9069578eaf.82.1791921895794;
        Tue, 13 Oct 2026 13:04:55 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfc3150bsm505062fac.10.2026.10.13.13.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:04:54 -0700 (PDT)
Message-ID: <21d16f93-316d-4043-a4f3-b4abbfe7990e@linuxfoundation.org>
Date: Tue, 13 Oct 2026 14:04:52 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 13:40, Mark Brown wrote:
> The kselftest_deps.sh script currently takes a compiler as the first
> argument and uses it to check that libraries needed by the selftests
> are installed.  This works well for GCC where a separate binary is
> provided for each target architecture but is less of a good fit for
> LLVM where a single compiler binary can target all of the supported
> architetures.  Extend the script to accept "LLVM" as the compiler with
> an additional optional ARCH= argument so that it can be used when
> building with LLVM in a similar fashion to how the actual build works.
> 
> The duplication with the main Makefile isn't ideal here.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/kselftest_deps.sh | 83 +++++++++++++++++++++++++++++--
>   1 file changed, 80 insertions(+), 3 deletions(-)
> 

Thank you Mark.

Looks good to me. I will wait for others to chime in and will
apply this for 7.4-rc1

thanks,
-- Shuah

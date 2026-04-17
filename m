Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A803491C4
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 17:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776446664; cv=none; b=LgMnmuemWEzgUKdRgB11dfb+NxUj4xhQpBNuJWx9s+BCbyFAGB7xVutJ1xcxzMZp5bUH6xfa2hPjzuzv77tMpSbXaqqprxGHBYTfW3/semAFd3jzr72QAJJ/9rA+WFcfSOw7CQAovCv//ktYHGCC97EAOdRl96HUCuZs6pA0FpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776446664; c=relaxed/simple;
	bh=aHv9tsQwOFWggkpGigY/3Zh58wAA9DWTSfuVQSJCNNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGfR5zv1JjRVONEeN1EM010JRMkjR4RfOmyv1VSx3Fc01okcNm7tJQXC8lMZgU26/nBq4EQds56WUHB3eWu/OStExD/qm9siFPdkzkLaOf2sHgE6TSRLwIhy6GQFzhjNJC5AiU6GU2zidizz92lmsYqHHfNAMAsuB0E2H4UCyUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UgVkkGSM; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UgVkkGSM"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6830f4f34c9so523066eaf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 10:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776446660; x=1777051460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9lqaLLbAqqCpm4lRt6a4mxEqUE0kMvxTIEVafwoTsY=;
        b=UgVkkGSMX1s87UoibbL0nZvO/V6K+jGItps7/85e7bCKJZow6kMsKUUAYg+FUPXoGG
         g0ip7Qd3D0AO2hX5X3owsL+ZW4vRfi1D/S2qEgdGpQzm7U2UvdrHImalfUUTCfWOFiZ/
         IEXY9I9G2rte6uCewfgewAhrNHaVPEZpGb80s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776446660; x=1777051460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9lqaLLbAqqCpm4lRt6a4mxEqUE0kMvxTIEVafwoTsY=;
        b=NU1yKyach9ijKFpXjfBm1pb313utpmmAGWdwUpvSXiBJdYMfrnWu8i762+nKWR787C
         W2/aR8LRHA9D4gvhvW6IgiX4JONWa4OvIvXpv3gUCy/0kEWcSRUnvLMGgupa0ZkLzvkS
         1HyoC/7ktE0GZBBoKyDZtShN+72Mpulf1QKzz23JwcCrgxrf27C1j0bQglMJ3bm6mdFw
         s26+en6ncXty92aWDGDzpl716/dZa0MjtoI0i6D4qxUrQZOqUioNh25qHckRNuAx4R4Y
         ZlKFmsHlTCrY1weRWkNB5pxX3g4GNyyPy2CxLWZn3mR1gT0GDBJY5G3GyhQtfSJDWkrY
         9sDQ==
X-Gm-Message-State: AOJu0Yxi7F/Gv6Bs6Nzllodt1sTQY+E3xosFNmr8OIkQYo7FD9tNtMl3
	L7m7jKB5Xs3aX+4JT39/SnEVoSdJBavYtimocKEUrdpeMkubZHyJn6TXdL5Hqv6+5lA=
X-Gm-Gg: AeBDiesvmPZ/wt/Lsv0qL3kyiYL6GeXeWQP6iw25B4xsGNbIkga+hP8ZTQBYpQBvNSS
	eofUqiMQxnwvuhji8wgjeICkU6owvdjwbCMSXcl1kDqgaszRivaFqCA4dUUFHsJlsLjk2b8bd88
	LCcnaCdVHDws6d8udNoUP2TmVut0yBpO7aan2xmAADHqPvzYNIJN6fVB34vknChBGEyno1URLL3
	/qLFwbuBni1cq4fp41b7usqraJYsYeNSbsIT8a+0VeiyV/5aGMpTKt0wnLeLp1kA/E+f6BiBPvR
	d/WXujNE3oJdftQ2mbCdtJZyU6CIBcWq83dvxmEQ17QyAVjVrbKSZsdncym/BA9tMeL6yU6yoIo
	7iygA0qvRk5j+6a6GELA0elFt0D99zMYaopMMEYu7SK6Yh9SPuG2uet+cT3b60CZbS1ib2w0+Qv
	/6mymvefq3cedaEsaSHGXSANZk/5yonJk1CRqs19JYzA==
X-Received: by 2002:a05:6820:4716:b0:691:e8ce:35c2 with SMTP id 006d021491bc7-6946537dcacmr1145945eaf.20.1776446659659;
        Fri, 17 Apr 2026 10:24:19 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b93048e4dsm1608931fac.2.2026.04.17.10.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 10:24:17 -0700 (PDT)
Message-ID: <ab4cea9d-3274-4018-a172-f5399eef1f4f@linuxfoundation.org>
Date: Fri, 17 Apr 2026 11:24:15 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: Fix duplicated test number reporting
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Hangbin Liu <liuhangbin@gmail.com>, Brendan Jackman <jackmanb@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260417-selftests-fix-double-number-v1-1-1be5d7c36b94@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260417-selftests-fix-double-number-v1-1-1be5d7c36b94@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/26 10:57, Mark Brown wrote:
> Commit 2964f6b816c2 ("selftests: Use ktap helpers for runner.sh") converted
> the prints in runner.sh to use the relevant helpers from ktap_helpers.sh,
> not modifying any of the strings printed in the process. This included
> converting all the result reports to use the relevant ktap_test_ function.
> Since the output was originally KTAP compliant the strings reported for
> test names now include test numbers:
> 
>    ok 59 59 selftests: arm64: syscall-abi
> 
> instead of the expected format:
> 
>    ok 59 selftests: arm64: syscall-abi
> 
> which causes result parsers to interpret the second number as part of the
> test name.
> 
> Given the use of the helpers the tracking of test numbers by runner.sh is
> now redundant, remove it entirely to restore the expected output format.
> 
> Fixes: 2964f6b816c2 ("selftests: Use ktap helpers for runner.sh")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

That was quick - I applied this one also to linux-kselftest next.
I will send one pr with all 4 fixes tomorrow.

thanks,
-- Shuah

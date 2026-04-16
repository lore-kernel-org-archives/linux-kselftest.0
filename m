Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FBA2ED846
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374088; cv=none; b=tRw/FdF1mCCsZ1lnCK8Am9wRdpTwRlVP5kVjUjKqxeMNTMwnqHH9rsZqM8P+j/3B2iSGnLSM2JATQF8/9jozU5Yb5T1hZtGsRyJfRXT9L3slhXWejRrRONal9ioLG4d4BH47COVMBKGTyky5QePqW9TMdtYhBtGqZWL/hB5IEeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374088; c=relaxed/simple;
	bh=rsKvP2WS/xjdIb2fQz2+k8dJxXsp0PHKmOX7LkSjlc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t68e5iuCC6vyAZ5lbrKwO16FyW+S6phb4VXr2KSMgB6iL61409iTgZzPGnKGkabI1X1cpk2sZjTVUrDfW0d3/ajSqt9tkkOV1HbgYvFjUduo1+0sUOszzheUeq8w7t+roPqvKJFkPk8+3O1jqB4Qwr29OLyUNlXzEld+zxLAV0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LLv16BYv; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LLv16BYv"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-679f6ee3fb0so6246eaf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776374086; x=1776978886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URdEeFOpJ4MkhIst1k7ByThYTxeqJAWmyNzSxv3nzfo=;
        b=LLv16BYviJUa3dIYbsqzlbdSFfwoz71GsO/6+HLPqsPCpQSxJ5vN25M5lSUMz7Wqri
         Ahxo4zXnVg7wbmxhDUZe3CLT+HkoQRGMU+IxE9u9dvbUHMdU4Q8zZ8Tigq4Mo5mDL4+j
         /MTYP/Md5fPK/RUhJ8yyaSh/Ahdtgso0fj9Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776374086; x=1776978886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URdEeFOpJ4MkhIst1k7ByThYTxeqJAWmyNzSxv3nzfo=;
        b=FigJclg46unyfs3pRbjxbdqBRGcNSskj5zA6DrqQomUQY3kvS3rr2t2oyOXzXWiYYy
         gb5FQTznUIjNq8PYc5hkOxkmZVMX0zgnG1kCZBS8NZaHEIvt2uC/Y7w5kQv1c7GxgAqI
         W77fVOI19kBj5qRkR07o67SXWYkVdhKYjfZYVY2rHQjtxGm2ZJzWvVHY7mooHJxYhY6Y
         y2j8iBsD8dcSrxdSJ5v4ivotlhT/BVD98k390tMK9wD01AIj5clR+d0sFUllgL3x1/qv
         h+XazgdElmiJ+q4jdB0TyRaL3LswdWoBJ5BxTLOJ5Qqx4FJsMh9iFmFoVMz8qWSaqejg
         T+PA==
X-Gm-Message-State: AOJu0YyZKgW6iyLVG+8Zv3NKgnhAvpy2AZPtVG3zcnQhIOe7NaArVnk4
	wqgrpFqjlbmTVbhZWEUK5UqCd36KCXOO1umVzYz7hD5koSsBlDw+cbeGJ93MvGZc4JA=
X-Gm-Gg: AeBDietYmcSltz+Zy03n4ifHKNFKZ0p18xTRfDsJAhHyNcK+OEWT1/CJWmbgdJ2ycRc
	VuqRdbOQhwAEQ2sLmjbrS+iLSRMtRVfnvKdzDKaTdPU52g8CpPDy1n8MQrh2SSr19CbKczKbXnC
	3+bwt7M5sLuzAGJj0uZv2pD3IvhxiuMExEO6svEY6fSWW2cW1D8aq4gSTm3Hf55Ebh9dx+EAjWP
	A7CgjpdX2oicpVL/v24pJwAU53p+DhAnmgZZ2sPNrfJ6HgnQLcMOowWyUwy6Xsz6/g76tOhjwfd
	o4FQ7oeDuy1QfbB2K8RLxteg8/Wd7T1IS6HrNvR+xcYm9AT5ZetINcBbSoJFJ+HaVysPOhdPxIc
	EwyWZFyXrdCjFd6/dtv9zKoBl4YWvURKnTqPZqzS/AuFj39umMmCeQv81m8bS+tXTggNrrHAjhw
	1+mPhAh+bQjK4PZfKqh8EStpE3/vovZs7ztBd58eB4ug==
X-Received: by 2002:a05:6820:986:b0:684:da8a:a6ae with SMTP id 006d021491bc7-69462ee0885mr176806eaf.35.1776374086532;
        Thu, 16 Apr 2026 14:14:46 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6946043dbf8sm611575eaf.12.2026.04.16.14.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 14:14:45 -0700 (PDT)
Message-ID: <e138bae2-3a3c-4183-8f2c-5768a2bfe2f0@linuxfoundation.org>
Date: Thu, 16 Apr 2026 15:14:44 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] selftests: Fix runner.sh breakage
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Hangbin Liu <liuhangbin@gmail.com>, Brendan Jackman <jackmanb@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260416-selftest-fix-readlink-e-v1-0-94e4cabbdec4@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260416-selftest-fix-readlink-e-v1-0-94e4cabbdec4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 13:03, Mark Brown wrote:
> Commit 2964f6b816c2 ("selftests: Use ktap helpers for runner.sh")
> introduced several regressions by introducing dependencies on bash and
> GNU coreutils breaking testing on Debian based systems.  Roll these
> changes back.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Mark Brown (2):
>        selftests: Fix runner.sh busybox support
>        selftests: Fix runner.sh for non-bash shells
> 
>   tools/testing/selftests/kselftest/runner.sh | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)
> ---
> base-commit: 2964f6b816c25ee094df4a143eb5b8828910045f
> change-id: 20260416-selftest-fix-readlink-e-da604f02686b
> 
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
> 

Thank you. I applied these two patches to linux-kselftest next and will send pr tomorrow.

thanks,
-- Shuah

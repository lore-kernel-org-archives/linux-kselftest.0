Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD93C6A56
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352102; cv=none; b=MAcaxzDbjtvfMJFN/s5FY6qSkJBe0BchLZVBQEoS9a1RIZeeSvcVAaGGaMOg1k8MoS9StEM68n+Uj+mQaU0vqgs8/I+D0YZ+0fW5LK4zty5txy0B1spf4VKaAPt2VRTUZI8E58cnUZ2iSVjZ/0Tj+dlr2LcUGaJlyhfZAN4GlGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352102; c=relaxed/simple;
	bh=dLxLDhZsluEJozasLQ1fGGLtCpEhvnHZVUnXZIn1Mkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mhj3D5jCjCILmFS5pmogYzPXhJohnrA/YuVA7G9BoYCnZxk5o5Kh6TZOGZvh48iELq3THVfsh0woPGBRjnXKUuc2rUiPQhT/5Dn2YdR2VbVlLllooZPLbEcQAEbJXhyHhvBDswh21XHadlfKcN484WT7+w9mgnQGLrNWQo2Btfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FTlLxERo; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FTlLxERo"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4232323a7daso4293173fac.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776352100; x=1776956900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vbhnmRO7MCa9WiQ7reMvzj2c+4J3QkirLTz5X95JsY=;
        b=FTlLxERo7Uu/U/a4EemrfEGA0qwIXn3UL5UWyGoyhxtb3wthNw+jJCkozbkwt1m4BM
         bb/WmlkaqtZA1XhF3VRiUfeDhTay/sLoPFDajQlUwn9vv7HZ7VSTobqBj+zFj/adSTsu
         3/KZQWzh53NrUsTAFqd9AlEHKZUJHVpvMk+bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352100; x=1776956900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vbhnmRO7MCa9WiQ7reMvzj2c+4J3QkirLTz5X95JsY=;
        b=R+ZdtRAAM8Kk52XSiCClgeJ1K/a1oPNY/iUVZr3HmgFKvwjRQmLDt8qy09lRbpfKW6
         kly743suMIZlX5sGaVgoxPrR5mbcrxa6atLABsjuvig3G+u8qPyB+GEoCHozU47vFv4K
         FhxkvnzCQiyrk2L3LxN0SVbDt8Ra3azGNjUKBbQeZBHVmCEfUuz5f41jyczGiIF8dnkJ
         FQf8nAc4Kbb+Vx/JynL4OlsANp1fdIgdnzVfWj0jdX50/NJpS87nXsR1nVBTEgWVD+AC
         rJVLjCDPN0eUOsP9q9Et2OTQni+WKBtjg+k6MxpRJpQFdBi748cKqPfu9QScFlQ5xv+/
         Gihg==
X-Forwarded-Encrypted: i=1; AFNElJ990pGvmw5rlm9Tg8pNB5wdfg3GTycY7ruzE+nbpfrestl74ZYqemP9A65iie5PDlRaKfS9k1Wj10lKnkMyQGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW93E/TxEZCxeB+xz/GhuH592asO3WF7VDhNZMswI/CmYYzCww
	XxUQdANn6e/Q3NUO/WjDK77k4fpQtBHI1w/YTETdGOSHs5Ozijbtt7vmGtyzrj5NQj8=
X-Gm-Gg: AeBDiesgFKIYqJSbuW67GuXsbWSwH3k8IEUhsHqOmWGflXGMPArIHRC/3kk8wDJ21D4
	nOICNbmC4gpvbguGpJYgIJnO98XjzV5RzJ2ywHHJdEEFGhu5yIolJPqNDFASVuyqgEBt1H/QY9u
	xrAuZIFYhT2AX/VWsv1HUPaTi8gt/W4TSuUp7Qhy2MJhNDVs+Q2LeRgVXn7birQfyM6r6Iha8tZ
	HuP1YvxGtOuBPSHB/cFnE1gNPhrGnHdB801Vc15WVXyA8u6nxtuEL7RUNk2vzm8uYf3nv/12KB/
	HjQzDWailXDvPg7zS1O7yfjwM8eQLAiKbGxM47q8s6dGcO/BW/7AMuSzep1WI17ODjQQhSjiYFM
	glJDq66D0NZ5FpUY3amQLaf3IMVgg3+JcwgdjgQS/LWrjZZcSVrqmkow2bSo7t7JqYM3TNa9K2x
	X4KVi2fO+9OiFe5XXFzSeGv3YIKWYsSPI=
X-Received: by 2002:a05:6870:7883:b0:41b:f7f5:e887 with SMTP id 586e51a60fabf-423e100f0afmr16167618fac.24.1776352100022;
        Thu, 16 Apr 2026 08:08:20 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42666bcbedbsm4045489fac.5.2026.04.16.08.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 08:08:19 -0700 (PDT)
Message-ID: <c834846c-96d5-405c-97d9-f182b8fe1569@linuxfoundation.org>
Date: Thu, 16 Apr 2026 09:08:17 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 07:16, Mark Brown wrote:
> On Wed, Apr 15, 2026 at 05:25:40PM +0100, Mark Brown wrote:
>> On Wed, Apr 15, 2026 at 09:40:37AM -0600, Shuah Khan wrote:
> 
>>> Mark, would you like to a revert for this?
> 
>> Yes, I'll massage the text from my report into a changelog send
>> something - it'll probably be tomorrow now.
> 
> Sending shortly, FWIW I'm also seeing a buch of issues with:
> 
> ./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
> ./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file

I will take a look and isolate the two commits that changes
run_kselftest.sh - sorry for the trouble with CI this time
around.

thanks,
-- Shuah

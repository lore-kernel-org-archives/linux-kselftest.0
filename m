Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5CE357CF1
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450879; cv=none; b=U25Cl8FDUtuEpXrzd4cACttn4ecqjK1tkdn37MAVNX+DxPMxL9hDfiPxN/Z//evLqX1D6H46GxjF5aiZYMNMaZO7mx10biBi8Rg4HkIWcZRBTQxHHNHEdNA0nvx62/D/uKYefcTw4rMEljhDK+2hUdY7Z+w30APYNoE6AS8fmSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450879; c=relaxed/simple;
	bh=YpaQOC1WDkFRpQbpfg74M0L2LJg3c76FI9oNmLLjydY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWjUgf4JY9TAnPCDagXM3L8/jgSjkr0bX1EnGqOIDfXfinBc6M8cjEQqebwB0BL1sx/RVzQS6jMKrDuYAOJzBYnx0mIoxuN1LxYGWDpZaGPe2arXdoz927EkaJ/BdrHtJpVmcaqdQQyYYLu7U1KBVVJ9M/JzWQO+k9HhYacRemc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gs0ZRnCM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gs0ZRnCM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so18059545e9.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790450875; x=1791055675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1i/A0Q7vSMnTo4N9O4lpowhPB3CoGwq6o5i8iGE/Bqk=;
        b=gs0ZRnCMx+XMi2CrOIaYsSBoH3Ba/g2KLA7BRI6Dy3a73c+3HMYEDuAQhsIXCF+pHa
         aOVAk1dubbbEw22cESk6lOkAbOIkkcTfgGGDhkZkCCqaiCrAdYTxpIK+pWHY7U73TNTS
         4RMdxpWdH99uVeyCLQTBTL1sAbWl0dR4jrf9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450875; x=1791055675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1i/A0Q7vSMnTo4N9O4lpowhPB3CoGwq6o5i8iGE/Bqk=;
        b=wYiIxOMyAc6vSx3Pz4yQaXI/biQ4ZuAPKNqYf+EjfiaFCyHO0aQsGFEHrT0Jf0ZgjG
         QGlzhorqM7AP4mqRtfpBpm38kZ1GoiFGVMev3lzKfcrcAjB8Jp0nJxK3rbQnJAQR3gpf
         nrU+IGrBhervVKILTkUNcXHHn8jMZgOd42oB3DEBVWnpyM1t/ORZoOqyhpLLAYjxols0
         B4+z7PrBQXPsTqU+3jsKLLWDoJLUkvU4VGwIEGXP+a7eF3l8j6KfAgC0d/Tqbg/O5F9i
         9Zp++BTr6wtzNw9OtxXD2Qz5CaYcRy5iowgcDJzmHDUmucdjdqdEjjiI+MFV8r45CpcE
         mMHg==
X-Forwarded-Encrypted: i=1; AKwUvBy/zTjLql4yv6+5xanmd88m/ozzjWwFppsxQzClbIZtsvholqG7CP0f4nHSPSQzowty09dPHbZr93ZsI7YEP5U=@vger.kernel.org
X-Gm-Message-State: AFuF++nqlBbOyFvpeLYi+kNIjLCA7MLD5zuXsY6EMTr9AZzqHSae1nBY
	YjnhR6AlmWgF/Mga1wpoZbFlBbdeEW1lG73ZxCmN9up1YOvteuFONMEEIs4Bq3prygE=
X-Gm-Gg: AYBFou3ZL5VMO3VO9hbr4yS/ZGftMSs4EUErL93pKawMUejIEgrSPpQ7AyTLvaVBSco
	9PzUTwVsPYqQerhKqtIpLbwcN7kbQeAucnv9tvyg+HXuwP4HQK/tLWNEQvFAWqVj+PJNrAcn4oW
	xzJIVEevuesVdq6YoalUyU1aHQm8Ecv6NVTBlK+qemZuA5BRhb/34X5FjtybDox5svVV++lYHap
	BeyuU651GYA6urFsDcA/OrGoHyeNzOVE5KZsYhIdToP8tVwjfL4hzEcKGeSXgvMSzdVMnDDWFFz
	5as7T5jJIETvVx1uj3ZtWrkNnTnC+GyYoCD9EdRPinxgct2DefcMS6IR+rGg9drS3o/lrK6dG+b
	wXS8eISP6ybyjTSRr21/JxNcW4gbC+gw8Bont5ikjRypj3PynkArR9lwacaikfHMCSKlOp0XN8s
	gvb0EOXOtCoCugjCSuWd6aniw2dscwyxY/CFEY2MtBfckZfbge05CDXYT6DvHKd9VYFbD7F9RmF
	QDQbs31ln4R26KKb7+mHnhTz1Y46JY4Pjiok9OGXWZ580C1sMQ6wqTpsR/+riBf6CtZ
X-Received: by 2002:a05:600c:83c4:b0:49f:c331:39e4 with SMTP id 5b1f17b1804b1-49fe66ca101mr152199945e9.7.1790450874738;
        Sat, 26 Sep 2026 12:27:54 -0700 (PDT)
Received: from [10.188.205.27] (cust-west-par-46-193-1-237.cust.wifirst.net. [46.193.1.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff044406dsm179388075e9.1.2026.09.26.12.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:27:53 -0700 (PDT)
Message-ID: <d41f6f1b-b317-404d-b1f9-ed6f4170fa26@linuxfoundation.org>
Date: Sat, 26 Sep 2026 13:27:51 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest: Fix debug message formatting
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 ZhuangZhuang Wang <wzz_123123@163.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260916190423.1892-1-wzz_123123@163.com>
 <dfb3afb2-cec0-42e0-8e5d-25e89f54215b@igalia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <dfb3afb2-cec0-42e0-8e5d-25e89f54215b@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/22/26 14:06, André Almeida wrote:
> Em 16/09/2026 16:04, ZhuangZhuang Wang escreveu:
>> ksft_print_dbg_msg() passes a va_list to ksft_print_msg() as a regular
>> variadic argument. As a result, format specifiers consume the va_list
>> representation instead of the caller's arguments and print garbage.
>>
>> Add a va_list-based helper and use it from both message printing
>> functions. Also annotate ksft_print_dbg_msg() so the compiler can check
>> its format arguments.
>>
>> Fixes: f2662ec26b26 ("selftests: kselftest: Create ksft_print_dbg_msg()")

Does it really fix this commit? I don't see that is the case. Please don't
add fixes tag unless it fixes the problem in the commit.

>> Signed-off-by: ZhuangZhuang Wang <wzz_123123@163.com>
> 
> Reviewed-by: André Almeida <andrealmeid@igalia.com>

Also can you tell me how this problem was found and what;s the output
before and after this change?

thanks,
-- Shuah

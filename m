Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448BB39479D
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484879; cv=none; b=MrgTo4TlOwQGtI8R8PM0Qm/u5mz7yVYPPong02u1MR9xo6i/dadU4WmyP4iRiNixgjoWFuXYgIoNkHC8mQOq1aDIPgxIH+Ih58OP7MiWcSXRzJo8AowsggkbZjvmc0oZUB1D1IbMwo8PHS1JxYvJYbvMGPWUkxPbg+qhz0iusBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484879; c=relaxed/simple;
	bh=BzW+12Ywi9rZg7Ypi/2zGy/sL526QFJLW/zXMzXv9zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvDlzmBP/388wZ+pRk2i7UimsCr8bVOBpk8OgHEozS2/0X7ooNepSuFdyV6MK1Yxj/k2wEK5pOaREg+KlncVGxdkCMu048N++tg/SV28SDqEX4SakRTUvHBKEw4vVQ5cBcWQlcn/hjDgY/3K76hAIC72sAK/VJ79ckflYkzLAA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GLeipT+j; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GLeipT+j"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40ede943bf0so62907fac.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 12:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772484877; x=1773089677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQnLi3nJgWjYgGzCZr1R1riKpq6psbLt7Jrhw/Eq3qo=;
        b=GLeipT+jjTAGw/sZuDXC8I+Sq4T1NCCWdsbagSOysv2Qz2+1YKwqQ5y5tNLiD/IoQz
         UjanzNSPST9oVC5QumWlcv9cHeyWl9gTcIpScLA7faA5OZGfqJUYAGuIrsXhm8jux4AQ
         6Re2Z1bHioOD23Lkep5n0lmrEzYi0qvnNqiIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772484877; x=1773089677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQnLi3nJgWjYgGzCZr1R1riKpq6psbLt7Jrhw/Eq3qo=;
        b=coEPWzNjXB1vKitP3cbDBFJEx+upNqgBF7Gq49FX/Rrzc4P7IfL0dohsxwrImHGO/X
         45IYSM6i6ORGPIKgJHQdhGlmT2E+aYd5+HBICxUzDBiqKJV0EkGHEd4+z4npkUlylSMc
         zp42ghRuTHfbJnFiKjDw33M5af0B+2ZlcrzRfYlx3ZYB+AqBuHyVc76V06ov+I2fCFNL
         Ire7gwodnYorc3u/KwCX3Si8uRv7E0JLnlZCvl8rTDaJ+4N4sXXRRUCe0HOBPr2rHhCH
         Iz/xKI6i5vdq/w2wHmbdi/nxnVBwFCpP0ZAZP0wK7KpcMq1hhlbIzkV+h67zi4bl0Nyt
         ei+g==
X-Forwarded-Encrypted: i=1; AJvYcCWPLUr2VnbLkQniLizGgR23HfLj5+n2/oUcJhez0WEvA9338EkrLjarZmX5+qzxwlrEIwQ7o1e4TEBr9wbCh/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZlArzhjIdSoJUNFz2m+lmQ94RW3DkDVqAydmc7/0jcK4C3lqv
	tmgt5dWw/FqnfCQU0K29897M6TiVfXFuusEKpAhsLLy8WAmURjt1Cbuw51I2DCOZkuY=
X-Gm-Gg: ATEYQzz8klcBPP2B/4lmjPLMMhrE4dgL+q5IqEHJKG7j43EmH24UFpdMfzK1VJdecia
	UDkAQ0y/hz2mn4kvrKqM0chm/Gtu9jMgSFisfi/95kt7rGHslFgFqmTDaz1aAe1P2Gl6FC9qZya
	I+3L+f3Pd0MCRX2sQtcUA9o5eiSm4F4GTpbHnzIcB3rRrOApl1nWwWCQkJ8l1h68DQDn+GypsCB
	SD53qsTXzyEMKkBu6QPD0bAtGO+cFo33q0xtcaH+6lPKd44wQVavfPd7FSR6g+05sLWWvx0GkJ9
	IDi7DxY3ixM0GFkiLnC+7W3VaScwRfw0AlINY+rNVKxHPVt1crR7ohgRzFT4oparl/0v1MlEQGu
	K4HAm1uU51BsyZtcBpU0cSgrJiI0JVnwUSCPPTC0yX3nJioU6Vk6WBW39IUvsNEakmaXbFaIrfL
	8AEMAX5qMWw3XCr1IKTY6NvYhe4DaUp2ziogZATZaD1sT5zA==
X-Received: by 2002:a05:6871:7a4:b0:3e8:9747:f8f8 with SMTP id 586e51a60fabf-416270986abmr8478561fac.51.1772484877163;
        Mon, 02 Mar 2026 12:54:37 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cf259a7sm12914372fac.3.2026.03.02.12.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 12:54:36 -0800 (PST)
Message-ID: <498d1f60-853b-4cd6-a58a-2ab1bd22dcaa@linuxfoundation.org>
Date: Mon, 2 Mar 2026 13:54:35 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 7.0-rc1 kunit x86_64 run crashes
To: Guillaume Tucker <guillaume.tucker@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 david@davidgow.net
Cc: KUnit Development <kunit-dev@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <0b621c07-9359-45fc-b14d-1a86d0b153b0@linuxfoundation.org>
 <72bd77ed-51e0-49f2-b67c-0e68340f2070@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <72bd77ed-51e0-49f2-b67c-0e68340f2070@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/2/26 13:44, Guillaume Tucker wrote:
> Hi Shuah,
> 
> On 02/03/2026 18:57, Shuah Khan wrote:
>> All,
>>
>> I am seeing the following crash on Linux 7.0-rc1  kunit x86_64 run.
>> Is this a known problem?
> 
> Yes, and there's a fix attached to this email:
> 
>      https://lore.kernel.org/all/20260226-ungeziefer-erzfeind-13425179c7b2@brauner/
> 
> It's fixed in next-20260302 but not in mainline yet.
> 

Thanks Guillaume

-- shuah


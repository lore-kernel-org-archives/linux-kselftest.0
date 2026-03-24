Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF623BCFD
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375370; cv=none; b=YqhsM354mhCtOtrFxzg8UL3I0XcioHvj8mjIPt1jW3gAKWD36PqFq3kJB5kNhwyqlp/8etArNrH4UG0LLWSK58wAXUziHWzF+yLnrNdE/gH+0iKD6cqI08KPC3sUQwZwsgqTbvE0TwcKxNWNtfswgiK1Atj6EgClMRXM+o47diQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375370; c=relaxed/simple;
	bh=R7ZX0LE7XGFFQWMOtrASqhk0culrI4MvTKiFsqDKfPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DItylZvgd9NdEr26H+PogHnKMnHPYYbjyuP3Lxy6bMUMMVj2oxXe99aIA8gPlcADdWcwqeO4qlinVwDHomIcsl2Wk95qW4rLlrcDwBYMEPP96yP6KTfQ7E9MvKGKCiGu4rMyy0WJCAySTqQeWf3knaybkibfEKHA1ru2K6BXCr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XK4dDdnn; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XK4dDdnn"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d7439f8837so77230a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 11:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774375368; x=1774980168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1RhgEBpZwcw2mC7/SNEryH9p0tgwRBwIrIydZS7iB0=;
        b=XK4dDdnnnynFzpW4GTweZadTIkILnq2olNCeq3ZltwpBnrxPcz4eUiv4thtOCeYDns
         dm2iUwosQc7ZvN7kUPL71ZCwnXME1tJXFQ0dNa8GDHgjJlfqIkvpGRIT+DqYTFfqGitb
         TUtbdAmygKrUVurPl09sOskVIziJsyBOwebHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774375368; x=1774980168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1RhgEBpZwcw2mC7/SNEryH9p0tgwRBwIrIydZS7iB0=;
        b=Blv7LVwyxxEoRdZEszsSl69G0ukCjhez4SGDuCOvTunFqLyI49MSp/EXlAX41ESLjl
         VgVr4qIVKlfCZaORjonH0Xv4Y2uFDozvNWeEvQMaPMB0OXJps+4OGpsGqp1ElKkMMsQ+
         4lmJIPbEtskuIEXaUrtAqXV7t/VliCIiQC+IBcPg6fXnm4iwZ23SwisAmWeA8G2edjfc
         x9ajJP3aDhrCtqC/WyPERz3XVgm3JAoCvksevGle2Qll98/Q2FDvVX8PoZYDJRXpc+ln
         vbwZTUh9x/8Td5SjT50CASb3J8fXyuutw8yv0ccizQOrUXj1kdYrMDVh5A02zKR4UP95
         rlxw==
X-Forwarded-Encrypted: i=1; AJvYcCU7WCQ06M2yuCl/jIaXZY1EE6MrvDD5dKDcwYoOEbiAO1e5wb0HmZzKXIrPQSmVDf0b/uLhQE8voUfn5167WiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxgWgEDf7/CMj+8Pb48qaXrA1zzmD83vbSs4FllIxoaIzanCCX
	WOdDQ+4s4obCOD4068rPfRC/4UAHvIe8WHaxpSWA607t/NDBw1UrYvvn+gBRrCYbnrA=
X-Gm-Gg: ATEYQzwwcpC/7j/annD5njTGbgTRhBTOQHyjr2Y8bMJIs9Yp6jav+r4KffyFh2OaluC
	XPslTKjD6qFh2khWyGyObnELcOAseL7BF182V6IjLdg0Y75u91i8R6ygz2uPHoxzXze2auyLldl
	3ZiByZwErtJ7xjqCGajQvuNC9XYiU+x7TZ94ee/0fdk7kkdRr689Kk0fI80R9wrK0FKuiy0rzc5
	twS4ngGquLEaSV9yW4g0kYzwoYQM7fgEFaJgmbk+3dd/597TuBZ0BlY91NblKc3MPjQRstaSmC3
	BXwZ+3JZ0+zaI1Yx8ll8jMxVJ/YZXtUimLiJN87NvsK3ujG0k3+9XNkXSGhDu8uQMLrAUBgsJV2
	/98HX3VCAncztfhfN6+vQDN60ldIcuQuLgfgJQ+0z3zj0CCJp/9S/6S3PLzhnXa9dR8+vfHJDUa
	nk/43mRyUEo8xAExyFDomZDEvakGXzoJgHIS26MWLvfV8K3A==
X-Received: by 2002:a05:6820:1691:b0:67b:e7d4:84f3 with SMTP id 006d021491bc7-67dff56cdbfmr368540eaf.21.1774375367627;
        Tue, 24 Mar 2026 11:02:47 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c252fe793sm8840845eaf.8.2026.03.24.11.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 11:02:46 -0700 (PDT)
Message-ID: <091f264f-21f1-464d-913a-1500643728c7@linuxfoundation.org>
Date: Tue, 24 Mar 2026 12:02:45 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: selftests: Guard execinfo.h inclusion for non-glibc
 builds
To: Hisam Mehboob <hisamshar@gmail.com>, pbonzini@redhat.com,
 seanjc@google.com
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aqib Faruqui <aqibaf@amazon.com>,
 Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org
References: <20260319000842.1213426-2-hisamshar@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260319000842.1213426-2-hisamshar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 18:08, Hisam Mehboob wrote:
> The backtrace() function and execinfo.h are GNU extensions available
> in glibc but not in non-glibc C libraries such as musl. Building KVM
> selftests with musl-gcc fails with:
> 
>    lib/assert.c:9:10: fatal error: execinfo.h: No such file or directory
> 
> Guard the inclusion of execinfo.h under #ifdef __GLIBC__, and wrap
> all backtrace() usage under the same guard with a fallback message
> for non-glibc builds indicating that stack traces are not available.
> 
> Unlike the approach of adding a weak stub for backtrace(), this
> explicitly handles the non-glibc case rather than silently providing
> an empty implementation.
> 
> Link: https://lore.kernel.org/kvm/20250829142556.72577-7-aqibaf@amazon.com/
> 
> Suggested-by: Aqib Faruqui <aqibaf@amazon.com>
> Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
> ---
>   tools/testing/selftests/kvm/lib/assert.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/lib/assert.c b/tools/testing/selftests/kvm/lib/assert.c
> index b49690658c60..3442b80c37c1 100644
> --- a/tools/testing/selftests/kvm/lib/assert.c
> +++ b/tools/testing/selftests/kvm/lib/assert.c
> @@ -6,7 +6,9 @@
>    */
>   #include "test_util.h"
>   
> +#ifdef __GLIBC__
>   #include <execinfo.h>
> +#endif

Is __GLIBC__ defined in musl-gcc? Looks like that is the case with the
error?

Check a couple of things first: did you run "make headers" and
do you have the correct packages installed on your system?

thanks,
-- Shuah

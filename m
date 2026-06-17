Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72462EEE74
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 22:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781734943; cv=none; b=esIwwQhYn9EY6cR2iSkXG7rN6R8+wL+lixQmTMs0HK+09Wya/84abbJmYhFuKiQG+Oxowrf3QAnnosM0gnafrdZuzxSjIi6+8vZajcuuyLv0hOjqmSYJoKrvpP/cro+KwU3rN3/7Qa/62tcW+Re6mxV7E1eTMiUQxts4MQrrtww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781734943; c=relaxed/simple;
	bh=f9ltjWijChP+XwlEfqLXkwLf6HWaXOC5djnNtTmN11E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGybNVniq95rnuW8twB+QmA5WOsZBFDSdK6eu/4nw88nvCiVdGQ8XiVIwUg5WeD1XpVfhpMmbkx/o3jBWPp/g6r/2TOMunNEUbHkRBKvDPL/kXel5l6qSQi6pUTyeTH33fACHQobLJkuymTgB9Kj/qwtrYpUE3l9qYDClIXF8Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fGNf2bsu; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fGNf2bsu"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4866834f8deso107755b6e.2
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 15:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781734940; x=1782339740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTXpAyQa5yxfc977tpz0ZoWkhTqW+Yu4kmTVOCchAW4=;
        b=fGNf2bsuUxZwgA+6ZxlSMRi2ip+2f7gbiME4RjQMqyxAqh9/tZKsW2TClyq63QDL9M
         isGj7/2ZuATaEc455C5vgzjAfWcMDa6Tn7Gc2WpOKkGHbwF5qa0NIK2rbcj/gZNzKYfm
         3UxFyDUqo05G6OnhBITfs1hbvEzMZCY8a8u50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781734940; x=1782339740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTXpAyQa5yxfc977tpz0ZoWkhTqW+Yu4kmTVOCchAW4=;
        b=M1oT9YGpXltYJ/UqzlGFtZzu7CLvvhNYXq5YVGRwdrkkSHynNpNX9E+4SSmJnHML34
         mPkYSS1XELuZ6P4gON05j2AcuZC15bpP5xQ/zaF8HPltVV2J85NXbpo7XkMbvgktq4l8
         8goVyT0Yc6Seiok7c9Y5IIMOTwe56N2DsZ8GSVuOs6E5Or+X3665PkMfFVZspp49UIAY
         aaownZm5AGvtAXqIuGycmzOydmqOhF/PVWkHacUAfzopkTYDxZNEJWMEX+umN1uMCx73
         OhDfb13tAiHLRXgNjwQ2UXSA6kiyeDk26ks28+NhTyvNI2ZfWkpIZjtZ5qcT06rKULyc
         kryA==
X-Forwarded-Encrypted: i=1; AFNElJ+wjVrZtE94NaXgxcaAkZpckxxFXbc5NO3VAsFibNv7m6bsXBVqiM3Mgy4p3EyXKMu5DmG2b5G6a+ha523/854=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmQdkvM+Dka/KA2k7GCb4nZS3eNBGKmm6tt4C3wmaGUhrsUnvu
	L8swK+LXYjmx4sezzXAgdnnwjO+Pmw0pFDVzcuD1cHipE/gzVbC+CJoP7dM6l8znY/pfEA40UN/
	+O3i5
X-Gm-Gg: Acq92OGcRJHaGDWHWEUENtvo0OLzTsGrrT4W90J8RHPuhDQdFc4mbr2v97l7xo9YHfF
	ISxNZEy6pSXvaEhs0Pdb9AYutGGNd/ToNeud8sfP85jfpg3aoaUuZkMtmBy+YeNfxv1aGtNLaJO
	Uqbm09EUgiZ8g+MiVLrxn6qhZurtd2k+NpWGW4aTUYturVyWXxXY7IxSUfImc5bRILKDgWuDYHA
	WmGoJl81z26+oF4FbmRhwPMvKZW9pityEtQbXZSUGHMIN4bnmR+TdR7TlWqC8eIjTt3n8I+yco1
	f9/N8hYQV/HSxwnXKdXhEcY+P73O84Nx/YldEe9DhhdmvPewL2q7MRIP0DT+DyS+m2eUv3V3ZAZ
	JNaM1zXmgwxJcA/8rP6DEcvELF5F2hiPwn60LhfkaFrXmjcndp4lpzuAWh42rI8dD/T1ryIM9Wh
	rk1yeGxLbkx8TUCJGDfBBk
X-Received: by 2002:a05:6808:1483:b0:479:fca7:4647 with SMTP id 5614622812f47-48944472537mr4208022b6e.2.1781734939814;
        Wed, 17 Jun 2026 15:22:19 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875df8284asm7093338b6e.11.2026.06.17.15.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 15:22:18 -0700 (PDT)
Message-ID: <787e5047-04cb-4fde-9563-2d6eab23cf64@linuxfoundation.org>
Date: Wed, 17 Jun 2026 16:22:17 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ftrace: Drop invalid top-level local in
 test_ownership
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: CaoRuichuang <create0818@163.com>, mathieu.desnoyers@efficios.com,
 shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260407102613.81419-1-create0818@163.com>
 <20260407203727.442b583c@gandalf.local.home>
 <20260601133146.b16b0ad7c2204adcc168c945@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260601133146.b16b0ad7c2204adcc168c945@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/26 22:31, Masami Hiramatsu (Google) wrote:
> On Tue, 7 Apr 2026 20:37:27 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>>
>> Shuah,
>>
>> Care to take this through your tree. Probably could even add:
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 8b55572e51805 ("tracing/selftests: Add tracefs mount options test")
>>
>> As well as:
>>
>> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>>
> 
> Shuah, here is my ack too.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 

Thanks - sorry for the delay. I will send this up for Linux 7.2-rc1

thanks,
-- Shuah

Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F20D2EEE74
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 23:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781738368; cv=none; b=Bvu9C0bUVeDiruqPeA0OBdg4kH58GAaC0vxEod+ZKgzSJ+Jh/a8L+5jFrsXMPLz6ftpXgLRHvYUaOn1goPaZfxlQlpLUQbKsg8E6ANOO1viadeRyvji7ysJd4Lrtw3l77B2MY9pliTxG+YAvL8SRAqXrMzJ3cVBGTAWfBv/cp7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781738368; c=relaxed/simple;
	bh=kjmM2f9Y4tTpSANdrgbzkRs/GfUPSsXsu6fFj7lu1Lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bys3OlONRHUk56dqarNp3ros6Mbgk1KchCMG/Rjke2H7CNAhZLH4YrBgQtK2Os7e6LZIBWDUn2z/T/tvZSnBnFYEh744h/VVQfRNYwQcwFvB1mro8plQSkPXjK3jp5o5myobTuPcZoCU8mZ5agrnHh5vBxh1hZibIpStIKIOQv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NWhZdEHX; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NWhZdEHX"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e6cfdc8382so237700a34.2
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 16:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781738365; x=1782343165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vMBMjuCrro73P2KY+e0B51nJwwuq2WSOY+l9c5fER/U=;
        b=NWhZdEHXP2pPa4HY/2a5P/BLElzgETN2gIwP9bslL0sdvGc5WQP8YMgxFBGIyXlMc4
         b32u8xz/V3Y5E0zczUEY37LJ1WRO6GGgjd8DRJs4cyJirttEh53Wj0diwYtXagqoFH1q
         p4wi/PocscpYyJuMvj07yEMAKyP6PuirYH6A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781738365; x=1782343165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMBMjuCrro73P2KY+e0B51nJwwuq2WSOY+l9c5fER/U=;
        b=ogxFQNVQVg/2XNCP3N+XOJj9w0ksh9BldhWjp6A/wXb8SNeqIR5RVafbfv69kQbb9f
         uSGiCaVnSLfiWolho6cSHBbpOu+hpUsuPpwg3BXfUCFLdn3UY6kkyV3267pTaZx4Fi3R
         84vgcpZlhWdSsjUNa8PrSWp4sgOS0Jy6+TmNnwNolm0oUPu+kEOlQzY482LYpb5LRKeq
         A7nCHfKuOfdxg6G4KMZ12sORXpb3yayCAeYf4QpYDhsblLivfjkYv7FCM2WTqcuAou2/
         yIf2PC9/NxQsjB63oxxUYCUfRq8FFzg1WWdH0oOOWfUcqsATp2bl1BQTEW0eSMklBFe5
         AWZg==
X-Forwarded-Encrypted: i=1; AFNElJ8G8Djc8LZNeiGRyCaTgNg02u4MbRZJKT874won5M0K6T1NBbZV9Jq82833HKO/KCEuU2bIGLFfgQWuc/KW8II=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ub7QnggRGePkFpaSwJhCRP9g03JDM92SaHty2z97cEdWs0V2
	0O8bmdgCJelUikcrfhW60V4lsD/7lcSjS7Nrxvf8a9RxUJFYzV0PJ1A/fL7UcSJKJWw=
X-Gm-Gg: Acq92OF2B3uRE0FeJFBARdDYrhStV7/0POhPWxiSiCUL7NoQsnvmXfoLLyHEDXEKW5D
	DK+xQMvgzX2/RmxrRbP82qF3ptsMIrtYvkBTR3YEw4nH5u61/fWNN9Kh1JaGisvc46aKReTiFzC
	huOWHNHA4+Bcf7KwlMD2biLJZzwflWI9MWfAcCoAL7KXWvLE2UjVmF2XbjUCnlzlrah5uFw5Trj
	llnMTx6Bei4++1ctHDuhwrhRkR1Z6OLZWJr0fO2XQEh6mdetvHwP5cXrFx2hJCpWFn4g3DyDv+7
	bL7SJwvcSNjfhJbPBItLcbx1ikwbmX2zSchSnhyzEDSICT3sUP9IVG+0rqX5qDpQEDqOz0C7bfM
	SBuuwx9dw3mUteWk7JruH5ac6OmTM54FdrrHVpUlVWz1JLGvvZadBkv0IWRrtxvZkvHMmH+yldq
	T5Rd+htHNvkiCYZK7I/Hkn
X-Received: by 2002:a05:6830:916:b0:7e6:ed97:ce5a with SMTP id 46e09a7af769-7e90b2af148mr5858277a34.4.1781738365560;
        Wed, 17 Jun 2026 16:19:25 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f6df8d6sm10146721a34.22.2026.06.17.16.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 16:19:24 -0700 (PDT)
Message-ID: <602d46d6-0ca1-4f05-8cfd-a6007aff560b@linuxfoundation.org>
Date: Wed, 17 Jun 2026 17:19:23 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/ftrace: Account for 8-byte aligned
 trace_marker_raw events
To: Steven Rostedt <rostedt@goodmis.org>, Hui Wang <hui.wang@canonical.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, pjw@kernel.org,
 linux-trace-kernel@vger.kernel.org, shuah@kernel.org, wangfushuai@baidu.com,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260607072431.125633-1-hui.wang@canonical.com>
 <20260607072431.125633-3-hui.wang@canonical.com>
 <20260608125049.092d4543@fedora>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260608125049.092d4543@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 10:50, Steven Rostedt wrote:
> On Sun,  7 Jun 2026 15:24:31 +0800
> Hui Wang <hui.wang@canonical.com> wrote:
> 
>> trace_marker_raw.tc assumes that the raw marker payload length
>> reported in trace_pipe is the result of int((id + 3) / 4) * 4, but
>> that is not true on kernels with CONFIG_HAVE_64BIT_ALIGNED_ACCESS
>> enabled.
>>
>> With forced 8-byte alignment, the ring buffer event forces 8-byte
>> alignment. The event length is stored in array[0], the payload data
>> and id are placed in a struct raw_data_entry which is stored starting
>> at array[1]. In this case, the printed payload data length is 8*N+4
>> bytes.
>>
>> To make the testcase pass in this case, add a kconfig_enabled() helper
>> and use it to detect CONFIG_HAVE_64BIT_ALIGNED_ACCESS so
>> trace_marker_raw.tc can calculate the expected length correctly.
>>
>> Assisted-by: Copilot:gpt-5.5
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> 
> NACK
> 
> Let's not change the kernel for a broken test. Also this has already
> been fixed but appears not to be applied yet.
> 
> Shuah, can you please apply the below fix.
> 
>    https://lore.kernel.org/all/20260601023251.1916483-1-dtcccc@linux.alibaba.com/

I applied the above to linux-kselftest next - will send it up later
this week to for Linux 7.2-rc1

thanks,
-- Shuah

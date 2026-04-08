Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F366238AC7A
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683363; cv=none; b=FGg+V/4SqtH9/MyDx4iTm0NodBeZAd2pzzIbNQ84WtubefsHP/FEflynain2frPXkgoPVvweQ7EWJEGyqMDOuhi42NZm1HStfsvxBFP5Sl4hQFW+AC3SGLLbOqd8PoCpfVhIGDUSxLhZpPmkkEdHo8HAhRnTN1AggmTgb/9WRkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683363; c=relaxed/simple;
	bh=6BeHkxLyWctFUSR46MfqmCh8uAhV3DyrDuxgljfGSGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5aeOWT0YyX1eQ+COiPji3gnOGpB7MZqRNvAgAYs4jeb3uivOiv8x5CvphpAclgGd/Qf8NnVmCIOFpSHhizT0AuOGmUx6wFA1K5AvHAZna1NnYkO/0fXf46bWvDJPjLRYBwt8RFLWViyABo+/o8GSxek7oII031S1FnbrOufxhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fc9oSzG8; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fc9oSzG8"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d556c1a79eso287312a34.3
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 14:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775683359; x=1776288159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SP33wRSGcLjNkqt9PmKyMhjJTYVxYcQC6XjnQNqNNFs=;
        b=fc9oSzG87Zf6UlihO7nchOxdHK9zLnEToTfCJ9ovupyoVT1dNBAK4iKkymuusKSUt4
         pxA3WSznsQkRy0bcFgJbVKoPzaacVBV6DB0nEN2fATHuc36sbRUlH/um6zN63jccKKAL
         X/PnC3XO5tdXQjsDpBsfb1n4RI2DFhILYVNKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775683359; x=1776288159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SP33wRSGcLjNkqt9PmKyMhjJTYVxYcQC6XjnQNqNNFs=;
        b=BiRDl8wEuEsunLVFFwSQQQUOz8OtSk21d+xqPvDZF0ELgnAtgxrmtKF8mHozdduOHw
         LWsJAD6sjxqmZlTy2A92TKvcAyusSp6QIfo7OLnWWuEZ3N12ESUU97Z5IrVuaBwyANod
         Eovl8MK5GcU9Xp2V/HEs8FDHH110Hz7ZEnmtK7BU2CxDVkFzY8FIbsj3cbE8+ybMcbgT
         cASgU6uNOkZ3rqa30CqCWsOt3yS8RyTOvIFiXoPHk2a3KLguMIhXv2O+9ZqPzehMJV/U
         U+l28zjutOJkAxai5f9yv//ETIgRZPO1Y/mB10StLaBaGG+rxzAe0fJJLUBWHIrPHaF7
         7zVw==
X-Forwarded-Encrypted: i=1; AJvYcCUPdU6a3bDb4Kt6c9llGYDck5pLp1Lu9O7LZPQcSCnO5JiO4ogZHJ7lJTCt83XdFK4Ik3dND66OVbfG5pMnZcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdgxuAfgUIQfPfMgXciN5MhKl8VIfHlOfwULxNJonyJjC4kl5H
	G9x1iKn6xzNJMgjOfYSq7BYvdeQ5CXasNSEIg9mgY8h/Sw3VoD0BSrc/cjY94UEL39A=
X-Gm-Gg: AeBDiet5PYs3IbQVknM+EE5Mv6tqp5+338oZ4sl0aCGa/n7uf+pDfr06PS4UY9RVamf
	WtdbADCnhzZG2+134jLCK8EM9s5D3v6gsAvZSfV1sCdvqZieBSzCp/ZWhjjZ8BJ0bl1qzs/+NVI
	WlJgTKVimURQtlHjSqpkZoKbDVdbEDnr/y7nvIHVU4RWM/N+M6TObZ9OXqzx36e2j4nxwclunOJ
	Kp5pgGrEoNtuVwz8apVFgv1GCohMnVTdIYRpttOmS32IKW7zrMrrTZUkUkBO+1agqo7W2L/t0Pl
	B/NJV9muxhtvcbqLi3ObEAVl1dc6H8Th86k9kZx/LTBeVS8dlLjVg8O021+lmDdgVf7EcJyfV1d
	hjVqIkae6JUb4k+hLw46v+5R5FwTDY3yrRm3N/hacPJwQKcxxXw6r1JY6ACIDXM7oqZm1SEMxyC
	9sbD87N97kB5CZ4OIPdijoXdWJLm+c4FfVkHc=
X-Received: by 2002:a05:6830:91f:b0:7d7:ccc7:c546 with SMTP id 46e09a7af769-7dbb755b224mr15665376a34.23.1775683358738;
        Wed, 08 Apr 2026 14:22:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dbfc1cb79esm3531705a34.15.2026.04.08.14.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 14:22:38 -0700 (PDT)
Message-ID: <eb5022d6-a09b-4521-b847-a9a5d66c144a@linuxfoundation.org>
Date: Wed, 8 Apr 2026 15:22:37 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ftrace: Quote check_requires comparisons
To: Steven Rostedt <rostedt@goodmis.org>, Cao Ruichuang <create0818@163.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260408043212.8063-1-create0818@163.com>
 <20260408171831.69520c50@gandalf.local.home>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260408171831.69520c50@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/26 15:18, Steven Rostedt wrote:
> On Wed,  8 Apr 2026 12:32:12 +0800
> Cao Ruichuang <create0818@163.com> wrote:
> 
>> check_requires() compares requirement strings that can contain shell
>> pattern characters such as '[' and ']'. Under /bin/sh, the unquoted
>> test expressions can emit 'unexpected operator' warnings while parsing
>> README-backed requirements.
>>
>> Quote the relevant comparisons and path checks so the helper handles
>> those patterns without spurious shell warnings.
>>
>> Validated by rerunning fprobe_syntax_errors.tc and confirming the
>> previous '/bin/sh: unexpected operator' lines disappear from the
>> detailed ftracetest log.
>>
>> Signed-off-by: Cao Ruichuang <create0818@163.com>
> 
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> 
> Shuah,
> 
> Care to take this through your tree?
> 
> -- Steve

Yes - I can take this for the merge window.

thanks,
-- Shuah

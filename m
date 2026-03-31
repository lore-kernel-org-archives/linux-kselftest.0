Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275D83321AA
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 23:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774998588; cv=none; b=ZPuU/XC6RjW6EyyrDcISJIm8QCkX3NFKJlsts2V2Z6pcE1qCa6xJjeYlk8FCn9REFCXyCZF9ykLzY+t6Gngx70e0DW/7YDc2CUbufMgTGH/Isa55bOK+OGf+GZhrpMrIKuJqhnycdJojYG11WLnY56q/XpAoc6IOqnF44yVoAEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774998588; c=relaxed/simple;
	bh=LcwrEE/Su6MqZg1BVVUXTgS+hDQtivNXll3DuxETR5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KT8mNqb4e7N7j4GsTw3VymSg5ACqKNOWY4RLhCiH6vdwutsmVFx92KPwT07l/nLU9Ewz60PW+PilvoJOoS6Uauc6erzF00DM4AMSbSeK1xwJWoBsZ4O8ZIDKUOijEIYjjyEneAqwkjNxNi+1w8xMa8sW3TB2yw0LQL0i3PCd5h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WpLq93JW; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WpLq93JW"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d7e565c877so3054253a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 16:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774998585; x=1775603385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAxWk+l9wnHigA07/m15Z7FRvAHJCuXF+wjFvuQTo7w=;
        b=WpLq93JW1LhcDqYBATrkbc/fP5BwgszTYjHTA3FXUN1LOsuQJot7TD0HRvUVli1J/S
         vz89CzQT7EHzaHrVzxI59BFstRbAp3sdQjjqhvLjzee16e344e115X5WWBURKvbLTYlV
         N3Ju1z+DHTPVC47nnOttAyrL6Nb28EyoeVawU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774998585; x=1775603385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAxWk+l9wnHigA07/m15Z7FRvAHJCuXF+wjFvuQTo7w=;
        b=fmLZ/coPfLsWVZOo2ohFgvYV93i1HUcAVHCKt8BA+YVreAgL2jQPeLqoTMIQDGRoRo
         wjFgV5Ki6b3qo9WmSovHOf++X6WT5gIWE8GLmc5znWxfqS7qOPsJ1tQZxDAi8BpNHNNN
         m7iLNPP/KxCfWJMhdFdt1FgTLnyxZBXSXyFda4y0QrBkYgIhXaZ+qc1SR+PDTqafH5cX
         +gmeNqX4VQI4Nw1c/JSECoy1NhxiiEJrXzGbUrhIWXGbjx9uub3nCVxcXcYATapNM8Sq
         9ADkD8svhTzsGsA8G2BwCLdlqdNEdBR3uVoQYR7ggsGUgcG6zSnCzXKEAGOhfTfP/GyW
         7OYA==
X-Forwarded-Encrypted: i=1; AJvYcCX4+edQzyCnAbJKY2+CHmq8/aFOzyQWuK4fNZFhDqh3ABhKqFoixwx6aHp0aqtsMzIaIGN4+2C2KslyMu0+LGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/IBNEHjMIC0LP4yTEb4JCyUrCV8TtJsGHJppYjj6D0g+X29d
	phiGF3NdX5NLu8y2H8p2OHlUSh8jSHAUhm7j6le/qSx55kYTnT9c5z1MbzQHvsXmyNA=
X-Gm-Gg: ATEYQzyNwK/iFwjPFuad/3aPE+SBLMB6c43tv/m97TdOCaObzC7wh8l8EE/8owo94VY
	HFSanFbIOMZ3TlBtztDZ0rUMPp6QG/oA4pHtOn0ysf+q4GwIIvDEDZbfjCZj/kUTTFIydeH0ocL
	i9L50J7DygVMoitApnhIMrRepT5TRujUlDoPTEz4nyQcCJcS94dot3cljAVxTVZbJW25LJfyWIy
	fA3HcoWZ4lyiC+CfiKr+BdAd7xWr4+LuIks6sews/AE1kIjASimps/mtu2vrMrQy+2vg93/T047
	uTvE70PgpwxEGdnH7GoW/xNa8c1OQELBmntMkkaS9PMkA6VnmagypfoaNMCDATCSD0LcT8i93Xv
	qrlOsuWDsczvhVJi87HPinIlt8lUQoK0AClnnGtA/liDJpO4jKZxicImUvmRZ+iY5pVPPggwIVi
	k3EDah4LPomu3cNH8Y07aSRs28h1NSRBjbt/Q=
X-Received: by 2002:a05:6820:4c12:b0:67e:160c:369b with SMTP id 006d021491bc7-67fabcd99b7mr657522eaf.49.1774998585004;
        Tue, 31 Mar 2026 16:09:45 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e231ea41dsm7828492eaf.15.2026.03.31.16.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 16:09:44 -0700 (PDT)
Message-ID: <4334432d-982e-4450-9281-de739c25ebfd@linuxfoundation.org>
Date: Tue, 31 Mar 2026 17:09:43 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: selftests: Guard execinfo.h inclusion for non-glibc
 builds
To: Hisam Mehboob <hisamshar@gmail.com>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aqib Faruqui <aqibaf@amazon.com>,
 shuah@kernel.org, pbonzini@redhat.com, seanjc@google.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260319000842.1213426-2-hisamshar@gmail.com>
 <091f264f-21f1-464d-913a-1500643728c7@linuxfoundation.org>
 <137f63af-a993-4b1c-a9e9-931718a47343@linuxfoundation.org>
 <f044f31d-740d-4cdb-834c-59de7691203d@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <f044f31d-740d-4cdb-834c-59de7691203d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/25/26 12:47, Hisam Mehboob wrote:
> On 3/25/26 23:03, Shuah Khan wrote:
>> On 3/24/26 12:02, Shuah Khan wrote:
>>> On 3/18/26 18:08, Hisam Mehboob wrote:
>>>> The backtrace() function and execinfo.h are GNU extensions available
>>>> in glibc but not in non-glibc C libraries such as musl. Building KVM
>>>> selftests with musl-gcc fails with:
>>>>
>>>>    lib/assert.c:9:10: fatal error: execinfo.h: No such file or directory
>>>>
>>>> Guard the inclusion of execinfo.h under #ifdef __GLIBC__, and wrap
>>>> all backtrace() usage under the same guard with a fallback message
>>>> for non-glibc builds indicating that stack traces are not available.
>>>>
>>>> Unlike the approach of adding a weak stub for backtrace(), this
>>>> explicitly handles the non-glibc case rather than silently providing
>>>> an empty implementation.
>>>>
>>>> Link: https://lore.kernel.org/kvm/20250829142556.72577-7- aqibaf@amazon.com/
>>>>
>>>> Suggested-by: Aqib Faruqui <aqibaf@amazon.com>
>>>> Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
>>>> ---
>>>>   tools/testing/selftests/kvm/lib/assert.c | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/tools/testing/selftests/kvm/lib/assert.c b/tools/ testing/selftests/kvm/lib/assert.c
>>>> index b49690658c60..3442b80c37c1 100644
>>>> --- a/tools/testing/selftests/kvm/lib/assert.c
>>>> +++ b/tools/testing/selftests/kvm/lib/assert.c
>>>> @@ -6,7 +6,9 @@
>>>>    */
>>>>   #include "test_util.h"
>>>> +#ifdef __GLIBC__
>>>>   #include <execinfo.h>
>>>> +#endif
>>> > Is __GLIBC__ defined in musl-gcc? Looks like that is the case with the
>>> error?
>>
>> If __GLIBC__ isn't there you shouldn't see this error because the include
>> is in - this error doesn't make sense if __GLIBC__ isn't defined. What
>> am I missing?
>>
> 
> To clarify the compiler error you mentioned: the error log in the commit message shows the failure that occurs before this patch is applied. Because musl-gcc doesn't define __GLIBC__, the original unconditional <execinfo.h> inclusion causes the build to fail. The #ifdef in my patch was intended to fix that exact failure.
> 
>> +#ifdef __GLIBC__
>>   #include <execinfo.h>
>> +#endif
>>
>> Also check tools/testing/selftests/bpf/test_progs.c - I think backtrace()
>> stub needs be defined only for the !__GLIBC__ case
>>
> 
> Looking at how bpf/test_progs.c handles it, I agree the weak stub approach is much cleaner. I will implement it so that it still prints an explicit warning message when a trace is unavailable.
> 
> If you are okay with this, I will move forward with a v2 patch.
> 

Ultimately kvm maintainers make the call - send v2 patch

thanks,
-- Shuah

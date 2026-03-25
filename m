Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD5931AA87
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464469; cv=none; b=LTzFdbta8kK9IJN5lD9NgTiKzENs3mudKWk2dprmEaoqrk/ps5a1laMbBxsNCEWEcs9eJ9DVAk4jBnSGWZhR+XufGXTD2LDgdi/tmFVlKeEm8HiSWkz5WXLgpsYdK7VOMYJ3dJmcKlX4xJ4tRuqtTZ1E99JTy+gn4HenfkZw9rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464469; c=relaxed/simple;
	bh=4NQg+jm6R4DvQVeWzwiik6zXgZ3a5nsPLM2cLEdlp7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vxs0IiAtcQ8MdZI3eSzVKieaL5tMBuo4IcEseWz5qmd64GXNoZyA4Tj8T7ohGwL9oIK6n7F8yQqU6osOR4OUuDmzUxTnmrUqvs6f1wcjf4GU3cPgufIbyFNvvqjzhDsleiex2KJ7FB7sAAe9PQt/AeWaFAFexsH4RyFXADQ6p8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bn50l2Kt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bn50l2Kt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b6d9c981so53610f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774464466; x=1775069266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dAkZBM8A9CwSt7dU1hFM05HktIG4hf4BJ0KGo2YHnpU=;
        b=bn50l2KtxDTKVi/wPLZTXS5rbN3vS01t6Yp0w2/HAj/LFggpadRbHQV+HZO1wGy/ZS
         vmElsBewL4L5ugM2DyuFytFUeeOrOQlEPuguLk2wjthHGnRUq9lXH3IU52xCQoM3+xV/
         EeNsNuYMKJ6j9+78y3MYLJ/F+5SWSKc3Jqmz7QYA6L0U8pRGSD8q3tSPn+xo+OR1zJqZ
         3O4qq6C/kF9XuHOR0oDXsxnmsZbTItPG4ry2XkDfP3ikGeaqQ0X3udnWYPQtf5N9hKdb
         pe7x/ypTrvmv8afx8w3tbggiEu4HVpa+F5+zQt9uu9IxJQ4EdNXVthSF0+ncObz33/ce
         o/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774464466; x=1775069266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAkZBM8A9CwSt7dU1hFM05HktIG4hf4BJ0KGo2YHnpU=;
        b=CMfM0ZO34nJOuQjoFJ4Fx8McAHtLo56VW7+Hsq22oKfh+p5XrUVmT1TZSt/Yg7HCjA
         Q1oqIEBBR8+wzCEZbKVvaIp3159E0r0vb7NYCLTBgn8Ghipk7OxQw5HwO2YdWPiok6Tf
         CMK9tmckxhWyUr1WD8EcBC3zBQfBssYgOaeFcHUJf8BJuoJbPcDnJ2eJeAnImIE/Zww1
         0ilNtHhpdoqH8K469tzUb/n5Xr/16p+e93MfLZoMPFuxuyItYURmQNRCq4W5d7gNx2rc
         UXGoc3P7WWk0qJUOATNW3ZzYg5Lnnxe0lIjVNXS9WtI0rI+Av3UdhZZkitA0+s9p9KTq
         PZ2g==
X-Forwarded-Encrypted: i=1; AJvYcCW+GV4IgksVsGi+rPhrDdOcnzwhst4AwaLdxtPQ0MN7ku4jO22+38sXuA9TaEH5sbqN0cRGGqiAk1KyV2ge1wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhMWxHAe4S7iq/18qT9PVSx4jCSM/iFhgt4ikarYgVS8EoXaT
	uVjR5/WnSUVCb81b3cgaZHxijT/gFHSH31WFi3F7PyEsoNF5sCu64Dz0
X-Gm-Gg: ATEYQzyHvstS1O7CDQexqXDde1ECw/ujxQzDUh3w3ejeJ15qmVkvB7T7sptfxAhvxDJ
	kDYfvIhGVCGQhPoGhi8qC5PhDbko+qS9ZWypha8f93rBHkvuN39ef6W484c3Hz0RsLrfqGzYwDE
	E4nMYdJKgtJ6MCMsgdPpTW2n6owJz33wP2BW91RKXFz9CcqRDRbQ12q8m7N1BdKObQzCZ0BnFNT
	5vMSkwUXJtYMNNV0qVN7fy0zX4jthyWxVTr3PjZxnqD1JWRHo21JcWwvQmm/By296xmJpaSoSBf
	pvjmokWzBe3AlLk9T8lS6Kt0MCvU95ROSjpRzr7EBmC/wFHcOgKOsxQiyhJWCdi1NzXy14mJmla
	XrW+F+Wxoqw+4PDIT4Dfyc6iFuFL9aufiQEmGPdg2QaAx3kSNs3yhKD1KsSxvLQC+jkX4pwRo2/
	rLkw+C1R50OJ8YdC979Q+3ofJ1VHU2weiMGNtZE610lLU1MTLIursbBDel1vU3p/ZzNCUbIVHAT
	AEL7+w=
X-Received: by 2002:a5d:64ed:0:b0:43b:46b0:fc3d with SMTP id ffacd0b85a97d-43b80526457mr12653785f8f.5.1774464465866;
        Wed, 25 Mar 2026 11:47:45 -0700 (PDT)
Received: from ?IPV6:2402:ad80:11e:183:2828:2ade:18de:c75f? ([2402:ad80:11e:183:2828:2ade:18de:c75f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm1967329f8f.27.2026.03.25.11.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 11:47:45 -0700 (PDT)
Message-ID: <f044f31d-740d-4cdb-834c-59de7691203d@gmail.com>
Date: Wed, 25 Mar 2026 23:47:41 +0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: selftests: Guard execinfo.h inclusion for non-glibc
 builds
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aqib Faruqui <aqibaf@amazon.com>,
 shuah@kernel.org, pbonzini@redhat.com, seanjc@google.com, hisamshar@gmail.com
References: <20260319000842.1213426-2-hisamshar@gmail.com>
 <091f264f-21f1-464d-913a-1500643728c7@linuxfoundation.org>
 <137f63af-a993-4b1c-a9e9-931718a47343@linuxfoundation.org>
Content-Language: en-US
From: Hisam Mehboob <hisamshar@gmail.com>
In-Reply-To: <137f63af-a993-4b1c-a9e9-931718a47343@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/25/26 23:03, Shuah Khan wrote:
> On 3/24/26 12:02, Shuah Khan wrote:
>> On 3/18/26 18:08, Hisam Mehboob wrote:
>>> The backtrace() function and execinfo.h are GNU extensions available
>>> in glibc but not in non-glibc C libraries such as musl. Building KVM
>>> selftests with musl-gcc fails with:
>>>
>>>    lib/assert.c:9:10: fatal error: execinfo.h: No such file or directory
>>>
>>> Guard the inclusion of execinfo.h under #ifdef __GLIBC__, and wrap
>>> all backtrace() usage under the same guard with a fallback message
>>> for non-glibc builds indicating that stack traces are not available.
>>>
>>> Unlike the approach of adding a weak stub for backtrace(), this
>>> explicitly handles the non-glibc case rather than silently providing
>>> an empty implementation.
>>>
>>> Link: https://lore.kernel.org/kvm/20250829142556.72577-7- 
>>> aqibaf@amazon.com/
>>>
>>> Suggested-by: Aqib Faruqui <aqibaf@amazon.com>
>>> Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
>>> ---
>>>   tools/testing/selftests/kvm/lib/assert.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/tools/testing/selftests/kvm/lib/assert.c b/tools/ 
>>> testing/selftests/kvm/lib/assert.c
>>> index b49690658c60..3442b80c37c1 100644
>>> --- a/tools/testing/selftests/kvm/lib/assert.c
>>> +++ b/tools/testing/selftests/kvm/lib/assert.c
>>> @@ -6,7 +6,9 @@
>>>    */
>>>   #include "test_util.h"
>>> +#ifdef __GLIBC__
>>>   #include <execinfo.h>
>>> +#endif
>> > Is __GLIBC__ defined in musl-gcc? Looks like that is the case with the
>> error?
> 
> If __GLIBC__ isn't there you shouldn't see this error because the include
> is in - this error doesn't make sense if __GLIBC__ isn't defined. What
> am I missing?
> 

To clarify the compiler error you mentioned: the error log in the commit 
message shows the failure that occurs before this patch is applied. 
Because musl-gcc doesn't define __GLIBC__, the original unconditional 
<execinfo.h> inclusion causes the build to fail. The #ifdef in my patch 
was intended to fix that exact failure.

> +#ifdef __GLIBC__
>   #include <execinfo.h>
> +#endif
> 
> Also check tools/testing/selftests/bpf/test_progs.c - I think backtrace()
> stub needs be defined only for the !__GLIBC__ case
> 

Looking at how bpf/test_progs.c handles it, I agree the weak stub 
approach is much cleaner. I will implement it so that it still prints an 
explicit warning message when a trace is unavailable.

If you are okay with this, I will move forward with a v2 patch.


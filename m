Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC30641322A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461817; cv=none; b=cmeBE1PGVJ3xF6mqH07QwlzjUILQdx/i60oqi9c+hkgUk+m7UzsVnvWi4w3DRSEnN5GP/jvJf0Y60Rgv10pU9i84yqt7E+TZi/NKaj52tkUOEman7CXnqjlkOsXBxxxpkUqHkkalXdJlta31fVIADU6dyewE9MsLT/y8SMhjF+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461817; c=relaxed/simple;
	bh=A+jUmXiUjqNgfZWHo7uvi8hZQpP3vPOx34iWFM4RRMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdwXajGtfERoF25s8FKSyjtVQ8uyWafHtsNTXPfpa/kr0HWN0e9hw0or5t5Mc9FbemLI4sFkeqjfhlPgO6HJXHBxQNxbH2Btie+6sXjLn232Rp74tJ255CKheMyMYssuECsyv0OKDlAH10WD2Ks0V0AzCnle/KstSvGhuFu+4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iAlisuWp; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iAlisuWp"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d7c77fd31cso57849a34.3
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 11:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774461813; x=1775066613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s91KuRYxNM++mXxBR/3RAyKkSTkEX4JgZkC++rqVfdE=;
        b=iAlisuWp68vnkd6erN6uMVElne/aJvj85hZf4QVFundtxyx78307fiUDtxlVRlwVAF
         dtYB8ORxVeCSacBNT99J5hJd3RhYcUP4Oaf/5r4jkxUmUoGJPeiulQpWyCF/zMx/i4+j
         rGPLdyxNXMeDqLGPgtVKxgDsLbkrdiDRxClcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774461813; x=1775066613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s91KuRYxNM++mXxBR/3RAyKkSTkEX4JgZkC++rqVfdE=;
        b=hzErvJZtys1zFg3kfizyFRRmBmJlg8oG2WY/caZHsMs7bi16L71jpIETNB7ioBeIft
         o7IN4ZzvfHIQEJmgOHxreIcKHWT8+Z3V8pMmhiS6N7qrq+0wwknhRqSTWNzea9ATNqXw
         klJlHdS1qKCJCknPAM/N2SQOdnbwMm4lSiVST0mh7eOtd7wLJbnH/sZoM4BKFWw0Iepp
         mcWY/zu1qOG87Yq4ZEOKaXNJpBbbV1tz+835fu2ePhYnQOU3NGvT3eHeoc9KUdD4gjGq
         uTO4hNS1IOMkcQR9zvuxLELC/8QTNSZQxvKSXPsLwgLxgrMdMKh2kHG/QOkPoVRZEVVl
         xgqA==
X-Forwarded-Encrypted: i=1; AJvYcCXZBGvAR6icj2ECcMdObKLVR1mGWw9gcrSt2ZY4eTJfzJyxh0wXav6++X+VTxg7E87Yl0kb8f2ZDAf/h8edDFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+07kIdpBXWR29e+4xRrUa301YThWFkZGB8XpuDD7pNV2I2AEg
	DbZJomjV9vPiE37ZfZDg4sPIK0eXEj3yIbpon8YDdUfW1DKMcQ6Y6MGB2CN+bB/rSC8=
X-Gm-Gg: ATEYQzyO+WRkKzHBYDqHdCFuW4B0A6pgCa5j0eTP9uI9m3G2HAFmjcM25zEgnawcsRi
	JVpne8RaE9EHBFk4bUkfHkIvyxiRK60qVLUKQDjwYCiG1+0rPORZwEokibIq+TJBwcCAa1vXpcO
	aBn0HBlyEa3bXgmrJiqwh6fneDj+tYMcbGh0iqKEM7Y59TK6EPIsc/y4DQLS9fniGKtuEkxxiVl
	u1m+WpLQCQoO/1N0Ek+jTND+E0p3WykT8QIT0nc7uzlixPuOTD0kabVhhcPKQGDpWQlnIPsH/RY
	k8M6EMeKUmWguS9xI4P65+/sA56JRnNi1BIdFIIlnnr2zYkNDF6evol+fMmWD5+7Lx4SBxangHv
	IewVlYUnppdo967fELOcpkvyMShStgWrV25EQQnIqCbvaqHNUSTIe2/miXySIYutaWEBf9hi9Qj
	10yOoPsv0Kfm0gopb4cDgsAtZJ8CqQY4q7f+w=
X-Received: by 2002:a05:6830:3811:b0:7d9:d390:1c35 with SMTP id 46e09a7af769-7d9d687ef23mr2267519a34.31.1774461812521;
        Wed, 25 Mar 2026 11:03:32 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e6fb2ddbsm314756a34.4.2026.03.25.11.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 11:03:32 -0700 (PDT)
Message-ID: <137f63af-a993-4b1c-a9e9-931718a47343@linuxfoundation.org>
Date: Wed, 25 Mar 2026 12:03:31 -0600
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
 shuah@kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 pbonzini@redhat.com, seanjc@google.com
References: <20260319000842.1213426-2-hisamshar@gmail.com>
 <091f264f-21f1-464d-913a-1500643728c7@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <091f264f-21f1-464d-913a-1500643728c7@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/24/26 12:02, Shuah Khan wrote:
> On 3/18/26 18:08, Hisam Mehboob wrote:
>> The backtrace() function and execinfo.h are GNU extensions available
>> in glibc but not in non-glibc C libraries such as musl. Building KVM
>> selftests with musl-gcc fails with:
>>
>>    lib/assert.c:9:10: fatal error: execinfo.h: No such file or directory
>>
>> Guard the inclusion of execinfo.h under #ifdef __GLIBC__, and wrap
>> all backtrace() usage under the same guard with a fallback message
>> for non-glibc builds indicating that stack traces are not available.
>>
>> Unlike the approach of adding a weak stub for backtrace(), this
>> explicitly handles the non-glibc case rather than silently providing
>> an empty implementation.
>>
>> Link: https://lore.kernel.org/kvm/20250829142556.72577-7-aqibaf@amazon.com/
>>
>> Suggested-by: Aqib Faruqui <aqibaf@amazon.com>
>> Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
>> ---
>>   tools/testing/selftests/kvm/lib/assert.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/tools/testing/selftests/kvm/lib/assert.c b/tools/testing/selftests/kvm/lib/assert.c
>> index b49690658c60..3442b80c37c1 100644
>> --- a/tools/testing/selftests/kvm/lib/assert.c
>> +++ b/tools/testing/selftests/kvm/lib/assert.c
>> @@ -6,7 +6,9 @@
>>    */
>>   #include "test_util.h"
>> +#ifdef __GLIBC__
>>   #include <execinfo.h>
>> +#endif
> > Is __GLIBC__ defined in musl-gcc? Looks like that is the case with the
> error?

If __GLIBC__ isn't there you shouldn't see this error because the include
is in - this error doesn't make sense if __GLIBC__ isn't defined. What
am I missing?

+#ifdef __GLIBC__
  #include <execinfo.h>
+#endif

Also check tools/testing/selftests/bpf/test_progs.c - I think backtrace()
stub needs be defined only for the !__GLIBC__ case

thanks,
-- Shuah


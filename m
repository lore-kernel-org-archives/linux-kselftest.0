Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1700526E71E
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 00:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771633148; cv=none; b=hlapPVf5A66+l2Kj3zFuuLbvHtGhgXm8XBTUKXMfSVi6GTMUKC7+QJznxdi+1/cPrz45EG7kSUCbiSSMxPvohR+KUHKk54qx3uorUs04NX+I1P+Dea/IJhwL1ice11EdKsN2640CQ3Mmdqc6QJd5Jm+K8NAele4ktSxIwMHgImo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771633148; c=relaxed/simple;
	bh=lDMgTBjr6jA7ry6Xm5A7oyBFF0gSzW20pw31ngDNXA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t0rb97UxMDGZhEobt4HtvA/TEEnIN375wbPpkL/dpetwqy9zqPna6g2x43kCPd7c+HXQCBAyivScxyes8/mMDsnhtOqcKMrvXeF3sE9sHvvMfUdwxOl7PjWR92h2ZG/UDchynRFOPzYrv8B1CdEVq5iVfuuJzYctozMgAYis5pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bcTQSc34; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bcTQSc34"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d19bfe1190so2227624a34.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 16:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771633146; x=1772237946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEkkf0xp3RHWH1cDZYXUxoDJ7Fv9qjiBqyJI7rOFU/M=;
        b=bcTQSc34cToTEpGu7CTBysRyFXi8EHfkV80AIqtmz1CirCGQtWnLCOSAUARoqJwWHH
         CihJNmBTQejr2UKtf3dAtwsvPeamshE4Y1G82wP7IeoAM6Ef3YjiqZ5XlYu6L3guS/xn
         kz5g8yfEXL8j2qVuoeJUO3UJpdemk7KINx5s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771633146; x=1772237946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEkkf0xp3RHWH1cDZYXUxoDJ7Fv9qjiBqyJI7rOFU/M=;
        b=OvsdmrjBPxQPBMj9E4cYEe45SCicRsluZRxLnj9/ZD4hWfPK1CilsCxmxejALqqrPL
         qNbbw5fJErekChRh4DQkR87NCi3hlGDBQAJhomTKwLxIp9KdxWqp6lLtlUteP4VeBiHt
         ryFIKHdUesLjBNnTLyKFRvzxIxO1DOOHH9WwJVdurFk/3Wyo5VksMXdz2CDWOVs+3xty
         hSrPec7MtwtYAytAElweJGHS4QzoMDCnErn/nTXJaVfrngBpncFNV+fSfbhpenoamTg9
         D8Lpo4eG1X0UwmBnrV1yDMqKnrmmjWYvy4cuR21wU09jvL87Kn2xUBvvHEEFvNSIrLUV
         SgZw==
X-Forwarded-Encrypted: i=1; AJvYcCW8nzkIv8wfCmMMUqpFtMr4jpN3r70I5hmD1CC9l9lctoU6Gf2nkWJ2tWjLwENZcG6ymqzLxV6UgoD8q8tjFdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbqDpvJwyJ9fIzILQaIaoKMbZh+7ALnHRw+1dVXa+FniqMROMe
	jRWLeIUpwYN7I5Phnkxl0MoH5TOJmGYurFVeX+5JayK9bcaASRJ9Pc0y0NIiU0vTpDw=
X-Gm-Gg: AZuq6aJMvQeeawydnzzv3qIGWYoiqwCWTcgRNC2/CZVBiMjWI7z+CsVfzSih1i+aWlH
	gcnomYlywMX8hA9SU75PPXwhyeK0/REUxS7oaeGcSHAw44p9DU0vktsyq9SDM0V5qIPL6abrWkT
	9TTxugsSFnFbdEGfWgIxfiT7OTuFTCKVDrxuEuI8kgXT+btV7szFi5xYdfGqb90lHg++bdo7HgT
	3/l7KWsnkTWrZ5TopwwNJj9J1AB2wwaJNczUVybOziR6dn6RxaGTnZaes8w5oNvI1RW25jDJGMv
	CE1S8+7hId4W2boL1A7yDLWLGVEGYJ15mRYpB3oScsXngBah7Y9BvtMWupGGxz1bLJ7sQNxtQfZ
	Gp7PeRfrVnZPMQJWKGWyo2cNtxNxc8pZR3rjXZij4/tZXq0CxmXd18Wdl4GVxm9sIXQqHcUVVkI
	zm+ubuvr1wXqueGe0iguCkCgVnKkng+LLJiIM=
X-Received: by 2002:a05:6830:6c07:b0:7cf:e4a1:8b6b with SMTP id 46e09a7af769-7d52bdf6e7fmr966627a34.4.1771633145775;
        Fri, 20 Feb 2026 16:19:05 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d0386d2sm1050954a34.15.2026.02.20.16.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 16:19:05 -0800 (PST)
Message-ID: <a45eaddb-9e17-4e82-8a78-a1d1f6e3d735@linuxfoundation.org>
Date: Fri, 20 Feb 2026 17:19:03 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12.y 00/14] Address pkey self test failures.
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>, "shuah@kernel.org" <shuah@kernel.org>
Cc: stable@vger.kernel.org, kevin.brodsky@arm.com,
 Ramanan Govindarajan <ramanan.govindarajan@oracle.com>,
 linux-kselftest@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260219101318.2442406-1-harshit.m.mogalapalli@oracle.com>
 <2026021904-unclothed-flavored-cdf7@gregkh>
 <e1cb6b3f-ab40-46a8-a338-70e4a18f687b@oracle.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e1cb6b3f-ab40-46a8-a338-70e4a18f687b@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/26 16:08, Harshit Mogalapalli wrote:
> Hi Greg and Shuah,
> 
> On 19/02/26 16:57, Greg KH wrote:
>>> All are clean cherry-picks. After patching the selftests the test is
>>> correctly skipped. These additional backports cleansup the code and
>>> avoids the need for conflict resolution and might help future backports.
>> Shouldn't you be always running the latest selftests on older kernels?
>> We don't always keep selftests up to date at all, as you can see here,
>> but newer selftests should ALWAYS work with older kernels.
>>
> 
> Thanks for sharing your insights on this.
> 
> Couple of problems around this, would really appreciate your guidance on this.
> 
> 1. Not all new selftests written might be correctly skipping if the feature is not supported in older kernels.

They should be skipping if a feature/configuration isn't supported.
The right approach is to fix the test to skip.

thanks,
-- Shuah


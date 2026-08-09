Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E736B061
	for <linux-kselftest@vger.kernel.org>; Sun,  9 Aug 2026 04:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786248795; cv=pass; b=fJRLjJ+cs8QZC3N0Zq3nbEbA75H7nItBsnJNm2kEqrbYZLoWLEGCxJ7JpwOPr29R5Z+xXY9N9mSoun0mqMA4IPfzNn7AFj4p0ucD/dvYuplFsoK1+3ABmPnxaWabXo5v+bDTCSlmqELFIaf0l6WDzuGto2lGO1uo8udM+TBY8qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786248795; c=relaxed/simple;
	bh=HiIJYw6XAIdly7FznRJmSLwu3aQgjqn3SOYU1/J2UwM=;
	h=References:In-Reply-To:From:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rz2wpB509ULOkPx3Jgl9ACbBnVhUXKd40NORqP8zv75pPmP6dgRQE/JqhIyQf+yEwiixiqoM9ezl+C9bN8V+Rgbnt+F4GDtqawisQqwlgCQLEcfZL7unmAQVtpK2MdlThvAvrl1bZS0ZpfCagvsoI5hhP35+PYpUQNWaJ/eq2l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AILoeifo; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AILoeifo"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b015b2d792so748347e87.3
        for <linux-kselftest@vger.kernel.org>; Sat, 08 Aug 2026 21:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786248791; cv=none;
        d=google.com; s=arc-20260327;
        b=T6v3qfp9d8yhrfnpgpjWO5Ghi1kOvGECsRVM21P9qpbn3rtUEcv0oNvVSzloR+MrQX
         rjnGzo8v7NHvM7wdL9XZ4ygF23PRLfcxwjhapi3KwbNipYP0GoAYXXQ7otfoAwXDQs6m
         82BLo3vUs4zOQvZc+86Zkb1bH8b0xMVW7yHl/7lGiWoPmmnx1f4LsOtR+ZOY1pEA+vor
         Z83WnN86EV8VjiT7oxXUjyrAcDRj/gz7ddikeAsBNFGc0Sh0wevRRWfDpPYhOrWJvE9r
         cWV7RYiIKiQZQ6rU694A6dzW3NwPHTxfgwc8eVfxKME+OzJ+cpqh8Kojy4+eZ5AzunBG
         B3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:user-agent:from
         :in-reply-to:references:dkim-signature;
        bh=nj/GrLZHfLimxl3JVKkCgz72NOChgU4G7DTMfU1gKqQ=;
        fh=vB09uPZ5iBefLNdXQSu0IThD1x+y2jLcgTb4H6caQbU=;
        b=qdUZw6Br/BvSuGyc+4UJzv1qlYoSBeNBYUvalMNoUJHzTOeT14WBn/MNvq3I/D1yBN
         DdokwOA36ZCHZyN9+NxaRbEHQ/UK6NbPolS1dFgXXRFnRYNB4dvclL1ILqcYJ0OEYPJG
         rLeKC891KJwBGLk/SJksdk05UgwlJzajvnxc2LK9sXjtVmFOkZoErj++8VvhYebOqQ5u
         ZLzdXZFEW1t8HNda0/hbdyUsl4PDJS9uSWuFDh1hQMmh7e1tb6wLgqLu43Gwyu1v2WrF
         pIZw8ia/DGPsa680nUvLx2Bn3c5guByHAT52G4m9/LledKMwq4DixuZGtGAE7/2Wu8dF
         MAQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786248791; x=1786853591; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:user-agent
         :from:in-reply-to:references:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nj/GrLZHfLimxl3JVKkCgz72NOChgU4G7DTMfU1gKqQ=;
        b=AILoeifos1o34B65DhCqU6iqjvrwG9jRLgRYoZDpn5q0xkwy6m1xWlTd08LTNB5b9o
         sENB52HLM7ZJ24MhiXqcHWcLdBrNJpVCgj8K29Xzps8kk/KjOyVgXC1KeZK0vaDgZ3hI
         +8gP4acs74/c8zhtg+PMbruvVg/o66cZ3bRtwqgPUWH69uEOrYIek/KBFU9WFYkLZwqP
         smgAsQ7IbFrRo87TD7xux7iLMGdSJySU32+zIx3HqsQZcfKc1Acto7naF2jFlwG6KK9D
         octJyhi4fQw/kT98RbMb+SO7AzZHw+JUL7VwuQO4xKcxetvx354LJ2xDAj2IamqKa9Xt
         ZW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786248791; x=1786853591;
        h=content-type:cc:to:subject:message-id:date:mime-version:user-agent
         :from:in-reply-to:references:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nj/GrLZHfLimxl3JVKkCgz72NOChgU4G7DTMfU1gKqQ=;
        b=qD58SBlF/zGWPwrKs3bcVIHs7+eoaP7621mnzV+UPd0ZmOj0VI1s9pgDb8iHSeJeJX
         z/l4KKPDtjCK6A5/6ZdN4FktnD5ZeunRp5tQjzuoAo7Douw/g1iyczrWI7x1p5j39s6u
         v+vHkDzYKJfD/SI5ilyX8wozN9ybFMTs+4vB/gikrvUEYa5JFuyz60MjZPlzCkoZfnMV
         ViWcPmwtzOpNopl56tyqS3mfWrGU+mgJTD59hjMDfQkNpfggmOnqSV7lF2APvwF/IFw8
         R5JTqIDMgyE/6dn7Mj9YMr16DUEx52af0rZmTEb0Sfp4aLUfkG+Z2a8/c9pnTgJlh6ti
         GJxw==
X-Forwarded-Encrypted: i=1; AHgh+RqAgI9+hnU4w8JUQp3kbCSIeHkpS3+W4YhwJE+ShC5vMS3Yuqs3HQJv6Hvt4r9aSsVEsNcgx7H6AinXRHJYshM=@vger.kernel.org
X-Gm-Message-State: AOJu0YygkUZmhmO0+I7dEdekxR0lwqv1P7KLSOrewlq3HYJ9IU5e/J00
	odKi5U9uxqG94tQ5nce+aOb9gg88Ry4DpWnFseHiDnZL6/aSa0CYZZ7pHq9QexeGr/ocIy5uIGr
	5yJqTskRPt1C2BPqGu7yCvIud+ZEpsjKtmfPdhVBLUqfBtTaRgdpX
X-Gm-Gg: AR+sD10fGYMeJu0IRyJJ/AG3rZEgOtKVeIZOVdixnLWyyEdVDe03hyP/kn2It9IDdzl
	y77fQpsch2xN5KCtY5089zgZpYx3DVMwqBLf/gqV1v9tsINs7G9eBFyoX1wAifwgUD59Rw2I9pV
	vVQcyBV6czQXyAmU8roX2tWccTyXHfsKfyGZB2CmkeSN0IeyCW0z8Oy5ES6EYwFhJT6VoHxkbX3
	JN3VufQhsaZNNotsE9ULlK9aoUNb7WD6zmHAhko9K1ESRi43v8aymOkhcb6Xdaf2CD2b3YPeVqE
	l9Og2DbRSvvLrMkEbUbrhKbg1Qt4GPqahEgSvx6Jvw==
X-Received: by 2002:a05:6512:6d1:b0:5b3:e02:b3a3 with SMTP id
 2adb3069b0e04-5b30e02b519mr1049490e87.13.1786248790804; Sat, 08 Aug 2026
 21:13:10 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 8 Aug 2026 21:13:09 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 8 Aug 2026 21:13:09 -0700
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <anQaaQvpEXFTRYvS@x1> <7cf591e8-e182-447f-9808-d8e328d28f79@arm.com>
In-Reply-To: <7cf591e8-e182-447f-9808-d8e328d28f79@arm.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sat, 8 Aug 2026 21:13:09 -0700
X-Gm-Features: AUfX_mzzYgAHotFJmRr_abQhtL3f8Je1q-ux1TqnkbEk2HMTY_2mQymojNl5UmU
Message-ID: <CACnXVneKuebieFi4wNF7V2QmMXy-N379C--H0jtCg8Fzy-PMSg@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 0/7] riscv: iommu: Add QoS ID support
 for resctrl device assignment
To: Ben Horgan <ben.horgan@arm.com>, Drew Fustini <fustini@kernel.org>
Cc: xiaqinxin@huawei.com, zengheng4@huawei.com, palmer@dabbelt.com, 
	tony.luck@intel.com, reinette.chatre@intel.com, tomasz.jeznach@linux.dev, 
	will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, 
	corbet@lwn.net, shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com, 
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Drew, Ben, and Qinxin,

On 8/6/26 4:42 PM, Ben Horgan wrote:
> Hi Drew,
>
> On 06/08/2026 06:23, Drew Fustini wrote:
>> On Tue, Jul 14, 2026 at 09:06:50PM +0800, Zhanpeng Zhang wrote:
>>> This RFC extends RISC-V CBQRI/resctrl support to external requesters
>>> behind a RISC-V IOMMU.
>> [..]
>>> Open questions for this RFC:
>>>
>>>    * whether a common resctrl "devices" file is the right ABI for
>>>      associating external requesters with a resource group;
>>
>> I think a separate file is the right approach to avoid confusing iommu
>> groups with pids.
>>
>> I should note that James Morse had an ARM MPAM "extras" tree [1] which
>> carried an iommu_group assignment interface, using the same
>> iommu_group:<id> format, but writing it to the tasks file. However, Ben
>> Horgan clarified back in March [2] in a reply to Qinxin Xia that it is
>> no longer maintained. Ben also wrote that the interface would likely
>> change upstream. I've added Ben Horgan and Qinxin Xia to the CC list so
>> hopefully they can chime in.
>
> I haven't thought about the interface much but Reinette let me know here [1], with good reasons,
> that we should consider the format of the tasks file fixed.
>
> Thanks,
>
> Ben
>
> [1] https://lore.kernel.org/all/f9b08563-4958-4f3c-ad6c-1e7fa3047896@intel.com/
>

Thanks for the useful links and context. I referred to the earlier Arm
MPAM IOMMU group assignment work in my test version as well.

Given that the tasks ABI should remain PID-only, a separate file for
IOMMU group assignment seems to be the reasonable direction.

>>
>> I plan to review the patches in this series further but I didn't want to
>> delay any further in pointing out the above.
>>
>> Thanks,
>> Drew
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot%2Bextras/v6.18-rc1
>> [2] https://lore.kernel.org/lkml/d13fdc75-b647-44f3-9657-d592353e8a1a@huawei.com/
>

Thanks,
Zhanpeng

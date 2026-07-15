Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA933AA9C4
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 02:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084102; cv=pass; b=E0tvUlV5L/BsDiI5SnJwZwuIpIV/BgFK+CqIZ97+WcvPV7bGrVxsMdtUvhknwbQwY0wP/SHGF5oMipHXZoHBx72SmwpSM8PRwS0WZf+AZJw6ov22FH9yQBOTjJbbrJZip1LrJ870QU/o4Ar3gpZLQ7jpIeIi+UaZ5b+0XDEo+sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084102; c=relaxed/simple;
	bh=6eBwj4et6Kll0SOF/dlQ0iXDfU2skh9D1bcyDgpLDWQ=;
	h=From:References:Mime-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPZFQulqI0jp7JiVkEuZ0H7XpVlNyckImWlh/2rC0q6vm5tbXeupLLwVIj5xlvQbgGSgmZN7/yA9ZfSiakG/Df1A3BLJ26yq/MPPUVmzjmmkGWD+kjbmpXtXrAXbKJ+MJ6ejdJADGB1rd+WchGHuCPVsXrBAYeSV8au5Myimzms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eBi6MxUg; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eBi6MxUg"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c923b8c2aso46199671fa.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 19:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784084097; cv=none;
        d=google.com; s=arc-20260327;
        b=nFsk/1UUUuKobVphwKUGD+4rJ3gUCx+LTlOaJC2FB/krOeZc9aDV0ZG1nACZZmQ1F9
         y5TdAVdzzcGpElX6lZ20NToDjTjNTS+ob82lKlLsOcmAMvdX3KaaUSJEkbIDw4YUo5kK
         d4AFU5bNZ1DHJUqQj+FExs4UgJ313Knl6g6RpmrU1mST9faUFTh6whYxmDez0iDSqe83
         qAx08iXcxwHxmomib0x/4VLiojg5nizH61M7bdWv9oZ/cYeoXTv3m7vmVVmjMI6CjVgb
         FDP6HFSm0YfZFAbFYcfmWhhpnnugVwWjB9rRI4tbVgKV8gNbHJ8SZguLsHF3f9m/1uB7
         doXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:in-reply-to:mime-version
         :references:from:dkim-signature;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        fh=Dq9Z6kz1FC+IrjOdtFpeV0DczJuztvV0n90KlXWB/c8=;
        b=TMM7NQZ5xp95n5rCI9kLqztYjv+O2/mnbV+8yUslhLHYFjen2/UPV4RUp/DVzINdmF
         L7W07oPPVSogFURLw1mSWubSixiuCJmgCZQjR5HYsmOYKuEC8u/t17J96Yq5NFPePyeF
         0r/yrStF/GJLEKsOApLm1OjBq0yxanxRCd5lxaXC+ts+5J0YY2UrB6taVruI4uCafd4T
         qQTsv6clTQmTJKCCr1R/7KE/9QKFRpJmjpxz4jVCbC0Gm7ywxxZUfeXRndgoZ0YCMaP2
         wMg95UHPW66NrpK5Y3w/CdFfOI1XU362YqOYSZB4bJ0bNQoFAlKrQHHvDWzR3zSj5K4N
         CWoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784084097; x=1784688897; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:in-reply-to
         :mime-version:references:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=eBi6MxUgUP9e/EZR5wL2qUDKLVco0neXKf65JxbQc5VwsbvWdzteYKmWNrD+aWT1lX
         trrBk1/P8A+zA8UynCqcpuZcT6dRBxTfNrTvKXmDMB2oQrXiW2Zs6hT6GwtICes1iQIj
         nAYWWYTnmFvIZt+bf0be2vhlHHQ4S42KaTtm/zHB8oWFl0Zco6IxHh0570j4YcpazqJY
         TpFntrc/euy/6OEF95+QUJ0paheutqyE9kgizjbQQGCJsMbZUpFYy6JedMPe8/TqsK1j
         bIUEvch2yIIJEx1uCyTqoJkI+YIQEcPpmWl/LssgTmKopxCT2aGLYlip+6jX2mGiN1gk
         d9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084097; x=1784688897;
        h=content-type:cc:to:subject:message-id:date:user-agent:in-reply-to
         :mime-version:references:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=AYW0PfPOJhFBLIVot+I9ilO0XJsHC4ShBt6GFQD/LlI80fdp/WWpdJYYzR//aDfuLj
         jlzv+VKw5Lcocxx3pUu0r3/vWEL9adORkSQNUYwq/Gg5UbXj6U3ktBtB4XTR6tYtzAHL
         HnmQxvpLrnzUkjKGBF7RzLKrWiXG8+ZZEMI7HYDEIK7cgqpgJ5Pe3MeyD0mGP5ElLI8E
         YFv6JDOlEFNh1AJGIL21GA6DYecQZKSiaQA7LOFqkws29XUmbYDPPUxc8UhR28JLR8ff
         M2NsjmgI5otqefbziZKqkARJsZd3Cr5l6LieFu/rd4zIw5XEF1DxC8ocGj1OfI2D3V7e
         widA==
X-Forwarded-Encrypted: i=1; AHgh+RpuCxTur++q0Hy1iE564Xm4xnLI4L8jCxt9yEa7LsWbgPQ+w1dlSPeHNoVG1Dlr1VjMh1nr4ISixkCW3IcRBiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhWwYXoRYahtca+qz5mzsdBy8oGD/8mBljzdkkFBwGey+MDE+t
	nALIgT/02rAl/V4003RV0xHwUjK+u8tdmv4zb3dXeZIo3BLXCjXmQ8cRQW3sOmQ+Jp2bTuV6fp5
	bsgLyi/A+TysehdV+doRsdynLYCwssIf8vx0is8sXxg==
X-Gm-Gg: AfdE7cm/pwsxAW/JQefXRsmKv9Ghf0MJcMgrr0xbuC03T8j97rD6Z40q/1dqN0TBEXo
	Hin9XvgK0FFYTTZKvRhdTPvZ0wTabH/hZbKPbN+Yd0LfOFuwbjAFuRQCl2E4CI6S9TEgmRiOFmm
	EXnZJ2KRlXOCGPv8gim0dpLjLz6WJ1lnAhHLA9GGyTenAEW5Y5hYa5YlcO3O/CitOi9Jez6uNZC
	Ah47Og7fXNC/UWWJgfi3++6OH0zs8LHb2ozxZ1sJf9BwF0OoANiT1MMbI4m/wWlctjHf/MJL4JU
	CirY24qg
X-Received: by 2002:a05:6512:3f12:b0:5ae:b7d4:7ddb with SMTP id
 2adb3069b0e04-5b159b6fda3mr1064835e87.26.1784084097163; Tue, 14 Jul 2026
 19:54:57 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 15 Jul 2026 02:54:54 +0000
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 15 Jul 2026 02:54:54 +0000
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com> <20260714140336.GA3716926@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260714140336.GA3716926@ziepe.ca>
User-Agent: Mozilla Thunderbird
Date: Wed, 15 Jul 2026 02:54:54 +0000
X-Gm-Features: AUfX_mzaekcsCjyK9vwKSYgr-sn1iFmjDQZenkFE6MLRADlmaaPOOGhkJ3gRioM
Message-ID: <CACnXVncfth5=ctoS6YqY8n1u_8JvZb-BpVgdniRqqjzxgNzdXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] iommu: Add group lookup by ID
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com, 
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev, will@kernel.org, 
	robin.murphy@arm.com, fustini@kernel.org, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com, 
	james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net, shuah@kernel.org, 
	kevin.tian@intel.com, cuiyunhui@bytedance.com, yuanzhu@bytedance.com, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

On 7/14/26 10:03 PM, Jason Gunthorpe wrote:
> On Tue, Jul 14, 2026 at 09:06:51PM +0800, Zhanpeng Zhang wrote:
>> Add iommu_group_get_by_id() so callers can resolve an IOMMU group from
>> the numeric ID used in /sys/kernel/iommu_groups.
>>
>> An ID lookup must keep the group object alive without also keeping an
>> otherwise empty group active. Embed the devices kobject in struct
>> iommu_group so its address remains valid until the parent group is
>> released, and return a reference on the parent kobject to ID lookup
>> callers. Add iommu_group_put_by_id() to release that reference and
>> iommu_group_is_active() to detect when the devices kobject has become
>> inactive.
>>
>> Serialize lookup against group teardown with iommu_group_kset_mutex and
>> only return groups whose devices kobject still has a live reference.
>> This prevents a concurrent lookup from dereferencing a stale child
>> kobject while allowing external users to discard bindings to empty
>> groups.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   drivers/iommu/iommu.c | 107 +++++++++++++++++++++++++++++++++++++-----
>>   include/linux/iommu.h |  17 +++++++
>>   2 files changed, 113 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index e8f13dcebbde..da269d10f6bf 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -40,6 +40,7 @@
>>   #include "iommu-priv.h"
>>
>>   static struct kset *iommu_group_kset;
>> +static DEFINE_MUTEX(iommu_group_kset_mutex);
>>   static DEFINE_IDA(iommu_group_ida);
>
> I think it would be better to change the ida to an xarray than to use
> a string search on a kset..
>
> Jason

Agreed. Using an XArray as both the ID allocator and the group lookup
table avoids the string-based kset lookup and the additional mutex.

I will refactor it in the next revision.

Thanks,
Zhanpeng

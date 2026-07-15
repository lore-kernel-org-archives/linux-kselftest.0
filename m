Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B753AA9C4
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 02:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084121; cv=pass; b=cjyi15rA2UYMPbhyEjWFjjE2i44+HGaLXtw1cD3YK2r8Zymrb/fyp6isqp038vr4RowNCiwC2VzDBfLuzm4zVnrCVAsFMOMJDsajZ0BetKK6u2wgIj7KkeNW8qJQfgSTdQtJBbg5dN6cv+r18MNTJYxogPSDuPbyp8FvZSXClBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084121; c=relaxed/simple;
	bh=6eBwj4et6Kll0SOF/dlQ0iXDfU2skh9D1bcyDgpLDWQ=;
	h=Mime-Version:References:From:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPT11PTXRFe/hqosmz/Jt40/7k8lkgcGmpycbgGVjgBTZWz0ZtD1nDwB/Lb2dOlGVEYxgxk3fiA+LEcmZ85gCjbjF16kajBys1dM6XGJVA9LYD9y6JRw/AlGdOSEGsjX/fL+ts6wAMg4tQ4D6rmAnFJtmAdwMzR7XRic//6eSWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=az0I9Lqs; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="az0I9Lqs"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso54981225ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 19:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784084119; cv=none;
        d=google.com; s=arc-20260327;
        b=N3VOxopbfx9846Tv/PqUkHGu4ry2sXcw+z9sGkyPBBZVaxUrItlFlkhj8IJ3ZVSRBp
         KmWt7ZGJqV5pSGxOyD81/LP0va9rEGFFaXiMTwQ1zM6uDAaHigi2XbylRKUvVN8HK7ou
         9uLQf5ySMAw+DNsRbiQClxhkm04cC9CCOUTwTh7xsjGDD17TatLn2RmxbdAS0ichN5su
         UsYi3arfklBBkrHRAo6W0f+LCi9nPzwEpOHmrs2yHbkG1/AHZN7qTf7aqD7IuRASg4MQ
         0dteOcYRhKkIIgc5kEzUzAvBkbb2wKoOCDYy1jW7vv8tm2sWaHhiuP7HiskYwpdPbyZM
         SiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:from:references
         :user-agent:mime-version:dkim-signature;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        fh=6P/eYT5b3vEo8d1ZXsCOLBy1ct75GSXdppq9GidS7Ks=;
        b=GJF1Yem9voolFo2fOghWwhOFk1ECTLbAIYTRxbqKE6FGWxZg5Qk6N2f0U0xW3mZEbZ
         irgLBQcAclvcC3MpFQ1m2Nu0aOOJsntvuXzjM61F76chhCalQgRAjUHS59Cec8xX4Vbg
         5a9Ue24YF/b/uKjWyNVDd1DAYaxlLJ5X8SzkfQ9nzN/JL5GOJe050heOf4v0vLhsdd59
         sBrOt1gibHzmi+IR9h1eKMxFYZUIq3eKCxthVOvutYrQbZEO9H4Fa612DE6TfcKvCwNV
         5lfqes+kWcpbrLb0V9vNgBCz5FGml+U58f7c1LXZnHt5Q9cs2UwM46HcDL05CWgqxk1e
         1yWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784084119; x=1784688919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:from
         :references:user-agent:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=az0I9Lqspl/LdgQk34qBFiPFA6yu2QxQ7uKkiwljXC8OEpXwvoYolQ3+YN24c298Hw
         yL1joghLV8soIWNV+0gPqIN/SMxlejZSSFN9lC3RpNfjfJiNWwMErvhruByUI5L8ygJ5
         TgsRpLX8rnNsfcPW/wAoSgUa/RKZ8C0zZy7XTzUMP1byZtYnhiwLenztbf73ozM4W9Ri
         tH53lqVndfnhBXSNizzOCxqzGss+ADo5qK9IHIPGnhesvevGvZk7GlmZ7NDhTEtk7Wqq
         UmQXogeOZFANqBx18YcrI0XLFUT8pnPg2zirtGjs8/1isc8HwIb1HSkgTOzgkUkhZ/FU
         VsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084119; x=1784688919;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:from
         :references:user-agent:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onc8LBGsosWpMb6oO+llEi3YzErTQezwilYi6725L7E=;
        b=Ny2+dNwxv2ltEP91eA9zZ1kcz4HoVxoYRkztMQ0dJsE/ZeM52dmGguNLRsbJPYZHoj
         oKSKXtFs5cYGuAoC+rquHfbbG/FHENgn8KfhxILvukpFyssIblpnZfcBNVaBPtnCKjgb
         UXO2HwUsmsWDPL3J7vcc6IYNHpAdeSCYoAar75hqjm9SxW7XECjkRynp5mqjvpMLhVmD
         O9aMKAKSz5ILynYJBVlBjHfKyZAaxOJP+cqLeKUGBaQ5mQ2XaIAHQccGhuQIxtgM3a9l
         B0Cx8h0GQTffaMWWsfy+IjgT1O+rWTkwQkuRnpXBtqg1Y/Qy6MPeKlYkXUK/lA0HzInN
         zQEw==
X-Forwarded-Encrypted: i=1; AHgh+RobSDr5rb7m3JprMoAobjtMriYDRN0ZK/Cl7/zx/LXko+hZTpt+LFgUHW0hrQRUdY4wUqQOLbKOwax+3kaczXc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7WxhH5hKh1aKJ32Rb1sUyh3r1UPsRhn3ez9f69gn7QOL8pcf1
	ini+a98ZpLbBtVRxEvkukO+eK/M6tvqR54JPRkN6vmiJ8pZutCHSOuaZScOp5FA97BkdQNgBdxD
	1uedRWeSwkk0tDSwO5U+BsP6D+5Ji8DMxYCO/VeOOBw==
X-Gm-Gg: AfdE7cm+gLYyclpirY742+WsnkzycFFtSClEkqIe7QBqLgcz1FB/ZeCPvGdMI9B1a+m
	ehbhqkMNeA/Ym2N8HimnJ8AxEyuExagNrtjwiJLZN5XGREgf7ULnA8te3qbZv7GCuiQQ1vBv2bz
	GB2Flux5OsnMcqRFx5d7p2HCaJfCRh4JzjqSp0XoAFFCMZzs2leeqt8sJG7H/cY7sZ49V4uImMZ
	jofsLi1PZNY0keBIed/GtEU/LIL1nq713BpW0tvbtjf+i+oJKAZDVbzptt6LW8quQf2W8A=
X-Received: by 2002:a17:902:f64d:b0:2ca:5d24:720b with SMTP id
 d9443c01a7336-2cee9b82e93mr60194075ad.39.1784084119427; Tue, 14 Jul 2026
 19:55:19 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 14 Jul 2026 21:55:16 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 14 Jul 2026 21:55:16 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com> <20260714140336.GA3716926@ziepe.ca>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260714140336.GA3716926@ziepe.ca>
Date: Tue, 14 Jul 2026 21:55:16 -0500
X-Gm-Features: AUfX_mwCsBOf_hgb5yUzS2yT7xbSqsn1sQG_-ZF1ldFSOzP_jx_ehBg3xh3TSj4
Message-ID: <CACnXVnc4T40uUJKViZH0dzp8=RBjgC08KG6Pjz8btjPJ+aiG8Q@mail.gmail.com>
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

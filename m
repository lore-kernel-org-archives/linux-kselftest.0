Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F22E7179
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 02:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786501987; cv=pass; b=tfMyD/Qj/JdpwV9SQGoxRcp8v+8nGJTZSvswuyKp7IzGW/swdBAhMydK0tBfpzGOKWKvXsSD+v5hfOkvgVHrInH/fcY8QvTQSB1/EBSyQgNSuMnETDB/M+vrd7kss65uaKgLrPbzFpM/jFZYOStK0K1sov9hgJGan4e6FRVV9wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786501987; c=relaxed/simple;
	bh=Q6qQHVSg2A0pusNqlHUO6ccG/0BmwRkp9wplW5UwomM=;
	h=References:In-Reply-To:Mime-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z32YU+fkTjyVKNFRoB/PBn+R7FNRylfd5ehvi96UqrMbcGruS0bdCWcVVX98NXeEIRItv8EUdPFTkpHQhLbrpBGzDuUNAfU+HyT6bwFZJ7dmBGsGwPhZd9nx5/FXJ4AWeibxSa0yrVxdJ1+Z/aZ7wwqC0EHBf4CSYVOvCAJ7iQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MAm+Mp41; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MAm+Mp41"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b015b2d792so342357e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 19:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786501982; cv=none;
        d=google.com; s=arc-20260327;
        b=FbSy5PVklrBw0PzR5BmZ++F+skhugN5PAutTtXIzoiOKV7M/6UXY9R1p3mPdXuY/K2
         xBeLO7zTkp2UjzQpXwi9gyachUm/NatjRnnh0gLuoIDfebW+GbeY4k50B6vEO6PXAO53
         l7WpqL5kTRwRZb7d3FEnDPje6NvEor8AjRScuRDb+G9LO49BAWy6+t8uVZAzLPjt5GpP
         sWfqs9c7z0+o33vmsmfTJqj69i76MgYwW86ec/c8wkk4ESn3v+3vdyu6Nq9ShO0Z9k97
         HdRW5V2aQJwX3/xGk6jLfkJPZoirucpj3ND7iEMh9o1FfT+eB72xd6jP+f6Hmi6cucl/
         yXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:user-agent
         :in-reply-to:references:dkim-signature;
        bh=jE3vNWzPKFqJXOD6wSjLs1YSOlszFJSXmdSNJJf+nTQ=;
        fh=dPGQ6Nuycxwbo24NHv3PGdtL8rYrgbG1XkVVKG7V8p8=;
        b=bjFCwGg8do7uO95rcP+ttAdzx4lTdUt4XZzf7xZj3zAYNEh+7p9eSEd2fDIXS4gs/J
         rN2wQgGKZTXMxDywztA+x7T/G3Fd2u3p/j3lQz69g5ToOi7/YQKewzvrM7BYlY9XaHm2
         Gs7rBhY9U8hmsJoGLc7R1fcl80NczWbSICwEjVoPOm3FW4j/SUZ6uyPXSo6ATcxaFN2U
         OAoxuUOw6KD3pUsMVlQYgfwlAqtUECV7ivVVKBO9ruLTPWoRygf/3yog+fSOBcctt7ma
         9TKIfL60W03RfUusTeZWpBw0rDReign6CzuO8ZmBmuYN682ED6QB7qeZT+QEPSjn8GH7
         puiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786501982; x=1787106782; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :user-agent:in-reply-to:references:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE3vNWzPKFqJXOD6wSjLs1YSOlszFJSXmdSNJJf+nTQ=;
        b=MAm+Mp41BjD7Uv2dP8i2CZqrMI4Q4yCRSWEO/R1k5Mf0M1kI2wnpY5elQwnWaT3BTk
         XlSA0zXz0ywtXngMQfaogkF7Ikc00f/t1EQ+XHhMY63RzIz0mh/ds/kdmjj/ee8Iauhe
         nRpVL8nA4rNLKRsMml9LtFg8V+R1fscZ7IUXSo4qsO1exlR3V468tr6cYC2BSabwGnjA
         dQIGvoX5VZ7jztbuP0ahfSuAZwfdR8j+6u8i+bQ6cc+/TN7OBQUQ8oVvSiHCA39CEvyE
         +x2fShx8CF/AgTktN+BAtZtdN721KDwd7+NcRduvzl6pQuRWKmn7ivRxK8krquCusLJ0
         D24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786501982; x=1787106782;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :user-agent:in-reply-to:references:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE3vNWzPKFqJXOD6wSjLs1YSOlszFJSXmdSNJJf+nTQ=;
        b=HDUlzMHcad9gTmjY2nkNfs6/zO7KXofWcS0GlK0c88n6gscHEQCjZuWsbKuk+b90a6
         tSbDcENGXeSy3l5q0TLrLsja0dFTdPcUD6N+YAiwl1FST2piA55jU42qPWsqti0y/AyI
         mIu9p50Kp7H4WA1P4LF83MmZ1Q6Ie63sBlqEZjQCb0TwicF6UjmTPX2ox15+zbU8VcV+
         gkTYMm3RYhRfPa4VR1zPepHcUEZOw/2t2uSdkCnpCyV1HTxt6EidcxJMsN4HJT9Xgkf8
         O/zMhiqUDEHutu6Ylk6g1rtOfl7fcncu0RLEB1xihjHdsUGlk12idyoxVR1R7znbZPis
         1mHg==
X-Forwarded-Encrypted: i=1; AHgh+RoX04PjKd1Czeg0D3i0VKxaBVNlG5X5q6R9KBrcRIQ8ir7ARKsqL65WDSTYR7Afzd/ekjo6NXWOyMTxaeXiRR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFTlScygWH+8qcuHvCDBpxEYHeTa6RxvOk2e55teUNxB38kJkF
	/6Xb6vnBKKS4CYR1SyhNp/rtjMNOS/LvTyRILwyQTzvlNRGGAmI0BHeMuKElcKTvdSPysyGiXl3
	eO6DuQfLRW0D2apGCbGC2HEiRI2clmLC269w+rm0H8Q==
X-Gm-Gg: AR+sD10gTy5HZG4e4XFD2xN/oSIhk+Bg1WV/7O3xk8nDyhc974owbAqCLpqIJ/xEK10
	XmacmSXdjOLgPWGS3sQQ5w2J/KQgcbh1F6jKo5a4I182u4z44aHYl2No4OqR1pVGtlplr+bp9r6
	XYnRK3RnjGsU/ujFV7/j/ZlYjpYxGMRhOAHChlCm/pmvR0NwVMBPBdCjpqsntSTPdZDuh6R94lr
	cRtSFSif1nRC8Un6QEcZkGRP0brWqF2iL2Ck5PsqiftuoNJmeCnJz/6i40o4RRnb1C9ga02dhZB
	ZE0hiCyFbpvEJv65mxz5QCg0hzhxu3mjURmj9ZQODS4=
X-Received: by 2002:a05:6512:2211:b0:5b2:f211:130e with SMTP id
 2adb3069b0e04-5b44e31916amr194307e87.37.1786501981558; Tue, 11 Aug 2026
 19:33:01 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:33:00 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:33:00 -0700
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-5-zhangzhanpeng.jasper@bytedance.com> <andiWrKhz5rLPVuq@x1>
In-Reply-To: <andiWrKhz5rLPVuq@x1>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Tue, 11 Aug 2026 19:33:00 -0700
X-Gm-Features: AUfX_mzrwSJAC7ECp6FZeYOMnrio9pumdwlfO90AszxP14I4KKFHzAruOFpbNJA
Message-ID: <CACnXVndvxVx+a3U8jbyMKwFPEz_ex8u1ima5OEh+vhuV=esbuw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] iommu/riscv: Program QoS IDs for assigned groups
To: Drew Fustini <fustini@kernel.org>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com, 
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net, 
	shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com, cuiyunhui@bytedance.com, 
	yuanzhu@bytedance.com, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Drew,

On 8/9/26 1:07 AM, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 09:06:54PM +0800, Zhanpeng Zhang wrote:
>> Program RCID and MCID for RISC-V IOMMU groups through the device context
>> TA fields. The resctrl group assignment is per device group, so reject
>> BARE mode where only the per-IOMMU iommu_qosid global default is
>> available.
>>
>> Validate every group member, firmware ID, device context, field value,
>> and QoS ID capability before changing hardware. Then update all members
>> through the checked IOMMU group helper so a validation failure leaves the
>> group unchanged.
>>
>> Serialize DC.ta changes with context setup under qosid_lock. Change only
>> the RCID and MCID fields with ordinary accesses so fixed DDT mappings are
>> not subject to atomic LR/SC operations, invalidate active device contexts
>> after an update, and clear the IDs when a device is released.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   arch/riscv/include/asm/qos.h     |  16 +++
>>   drivers/iommu/riscv/iommu-bits.h |  15 +++
>>   drivers/iommu/riscv/iommu.c      | 200 ++++++++++++++++++++++++++++++-
>>   drivers/iommu/riscv/iommu.h      |   3 +
>>   4 files changed, 232 insertions(+), 2 deletions(-)
>>
> [..]
>> +static void riscv_iommu_dc_update_qosid(struct riscv_iommu_device *iommu,
>> +					struct riscv_iommu_dc *dc,
>> +					u32 rcid, u32 mcid)
>> +{
>> +	u64 qos_ta = riscv_iommu_qosid_ta(rcid, mcid);
>> +	u64 ta;
>> +
>> +	lockdep_assert_held(&iommu->qosid_lock);
>
> It seems that qosid_lock is not defined until the next patch. I think
> you should move the definition to this patch so that the series is
> bisectable.
>
> Thanks,
> Drew

You're right. qosid_lock is first used in this patch, so its definition
should be added here as well. I will fix the patch ordering in v2.

Thanks,
Zhanpeng

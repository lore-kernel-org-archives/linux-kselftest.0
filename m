Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045BE37FF6F
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 02:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502554; cv=pass; b=p2ycvRoi1qJiOwIdaaS1AqV75GQk2WFR7FjnJZJ5V2xVZdRxoM4OMWQP+wtfZWh/T0PvmrtEd2VWFXNDZFGQwm96XIz3wkqRmFe7SK8CLjntm7sMcPsgHV2JD/MsWIQqhoT7smzOla4mTwuyixss6//4GEZv866NByTUM1G/mII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502554; c=relaxed/simple;
	bh=g/2afXd1QhsDNXpLtYrqK3LVQpstqIRtF29BH045doo=;
	h=References:Mime-Version:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/TwN8mAKHdOa/+1XUA/wwC4x/CTpw7jWiqz1crCOCgsR/5qiKTkbgMNTcvIR0EnsVABYS8tILD0k+Pl728S+8FV7UHNwHmw63tLTWnkE4AQlJ5elrJjWQYtmUr0vqAMxgwZdSdtQU15gVQNUsBpMJ9l+cNNhvuegEEW/3gFUS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=X0TBkN8k; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="X0TBkN8k"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b015532f7bso543898e87.0
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 19:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786502550; cv=none;
        d=google.com; s=arc-20260327;
        b=p0z/Pl//IWfrLC828S/+VBvd2ULVeudMiBUDAUFQqqSqVZHJ8hvlT9hbQnHMDotfN/
         TQlAqtdj7iebFOIdUupoG38hV+EwqpMrXz+6ArxSCelgLgFyLfgT+jH1lXQm1lI5WtIq
         DiSLI3OCwcK+xkC6s8wRLwBYu82UfvQp4/SVwDz3KHAtJulC7/09TivNFmtK2qR8lKaL
         kGUUUef8F0X2EJI9iJc3BjN6p3P00yXv2nNoFAzW7X1PJrw12UJ1QNAssZ+Ybd/zAJM0
         FUqa/4UJP1omtVGrm85qN4gTs9vP5oPV2LgCEagk1B3MFH4Sg+2dqMGMZnOX9TxuUdKp
         AiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:user-agent
         :mime-version:references:dkim-signature;
        bh=MA8pf91t4FXFQxQ756OvBfWNusYinHNGZmr60DLI1ig=;
        fh=jzmCo490IXALzKbYw6vghn3OvgIhXTAMLUcyJFltHRU=;
        b=SSKTVBr+tM1K3BmPigFG5yHOBH+gq7+ue8w4VEDDlLHq75kJnv9mqO2OwNio+LEs5c
         m/eCjyfQrpC6C8r7REML2QOj3hth7PONPeRlhM3htkj5Fj86u4X5S0Z8r6StzFNQQIYy
         QNttf9l6rh8C7lYFHLbuS4q++4yjpFC0ote7e1GWCc7fHmfRnO5H0xz8nD+qEeOIC5tD
         TB3lLiEThF/SxgPTTZgHWAUTxI0Ltn6iAjKrYFLswkRAGcH7t5desxh8psgON5sAOcHw
         WZmvfeKmMV0JoN5uQug3YiwJlBQZsKiMlzlEeE+K+UA04/yAKctmVtWuVyRaStkESQKq
         U+ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786502550; x=1787107350; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :user-agent:mime-version:references:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA8pf91t4FXFQxQ756OvBfWNusYinHNGZmr60DLI1ig=;
        b=X0TBkN8keWfVgh1WEOiDUc6+xgsmMyRil9F91zxV/HrvGhoIZ7fY/+450G5vknDlPc
         TnMO/YTpodH3uQDPr0gVBcDAZcwmWBa59xo2IPAAlf/U5y6LOTnoMupG6QPXyB5Xfd4T
         aVfiZG6TrHrd92h4Kv9QYOCB50+lk/RHHKdt6yLxcbUVOWzRld/w1HWburwUG1LEzCpe
         Fy1K/2PcBgEGWSctc9GEGez7dRSsVZiTwtMyqMDUbj+osN/MguOH5NRWNM6qY23v8gb3
         s8qrvvOw/cfVF2NUdcPuApIJwDfCygjK6MPOnMUbSE/NlcqpXY5NqKdUG0UtvS/UMkhr
         2XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786502550; x=1787107350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :user-agent:mime-version:references:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MA8pf91t4FXFQxQ756OvBfWNusYinHNGZmr60DLI1ig=;
        b=JRVMpX/I7jWXIu8r57YQ7GHqbiqhen5PRyqUgVTJ8a1j66kz966g4LGb6hniDWrDOY
         vp6GNwnJ79WgY0YhPnoDMY1i4lQzF9sxGhwso0rqxvxAmLLiisp8237QLgXh2ePsJKFy
         5O4JsRwRXt1pJORky+Pl2J1J/kmpG/sKTge0RsMWlV/yMtmqvjH+KmQIqouRZi38ZyzO
         EqSGv/nKgO4hF3J4Aav/mKIAHdhTPdnXw0g5FSUjSITGTkK2jccBKGOdo/ZBg981alDn
         7YFlDNMsERTBqSH/6AaJnsKZTrhHSSV+7d2EtLfDYuAJBrk5CHXy307EyDoAw1+CIkJX
         LE4g==
X-Forwarded-Encrypted: i=1; AHgh+RpafzIkr1gTa/1J34bGphtcfaY6Bq73mLncYEQwy4P8+WCgZpenCdO+VCa4RhgiHR023GT1pHY482YtpEA1XPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw63O1SWYU8fLK27oBAKH1xmzzkBLEaoOsQz9XPIA8sUiigtDfK
	xvXcUlPft2ePmLv/aUlzWpfbBhJwKpFE9GBlpsn4dvWlyhGwtfZno5GLTAEk1nId5x/fDlWiWu3
	WFCUEEmvaR6D3PBdPoSh2g+rvomh2zjvizykgc+s2mg==
X-Gm-Gg: AR+sD10jd7UIALhV20cwwjnxL5lcpm3RwsZBWHJNUZIQ9+r7REhOtwIm/GW8wv6aER8
	CbHgv5lSCSM7g03k+vQG1ZIYz62UtGKuvXkMpiELnyl7DxxRxlsQb98klbEeWYHWB4v45yakazq
	XMb/SjQzQdu//lCsErhjY9RcZtFoxoOr8pP0DC5hsuAkZlgpddNGKijkVab3VYjrY4Rr9BzdG/F
	sgwnjN3Q8/rgRnw8rD/BmogE/RhFvG6AWosT+QOjlm33rl/RdyzMSPJ4JuBczgQDFlWvxrwB/QJ
	1iZ32NhmtQ43A0d0tj9dSK9//YYXdmZjs63lsBjA6dvkyQ==
X-Received: by 2002:ac2:4c52:0:b0:5ae:b88f:311e with SMTP id
 2adb3069b0e04-5b44e2d9076mr214876e87.15.1786502549982; Tue, 11 Aug 2026
 19:42:29 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:42:29 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:42:29 -0700
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-6-zhangzhanpeng.jasper@bytedance.com> <anuSdFS4Enajdqff@x1>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
In-Reply-To: <anuSdFS4Enajdqff@x1>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Tue, 11 Aug 2026 19:42:29 -0700
X-Gm-Features: AUfX_mxVuesSQBbvklGRHcVkXo5XtC5KWv0jTTFlxpw_NNWMsenVNQ5v5yGezCg
Message-ID: <CACnXVncPrZms8PMJYbK58PEqR_mFzNxG=6CsziQCi8QCyr4eHg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] iommu/riscv: Expose global QoS IDs in sysfs
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

On 8/12/26 5:21 AM, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 09:06:55PM +0800, Zhanpeng Zhang wrote:
>> The RISC-V IOMMU QoS extension provides iommu_qosid as a per-IOMMU
>> global default tag. It is used for IOMMU-originated DDT, CQ, FQ, PQ, and
>> MSI accesses, and for device-originated requests when DDTP is in BARE
>> mode.
>>
>> Initialize iommu_qosid to RCID 0 and MCID 0 when the hardware advertises
>> QOSID support. Preserve reserved and WPRI bits with read-modify-write,
>> and use register readback to reject values which the WARL fields do not
>> retain.
>>
>> Add a qosid attribute to the RISC-V IOMMU class device. Reading returns
>> the current RCID and MCID values. Writing the documented
>> 'rcid=<rcid> mcid=<mcid>' form updates both fields while preserving the
>> other register bits.
>>
>> Keep this interface separate from resctrl group QoS. The sysfs attribute
>> controls the IOMMU-wide default, while resctrl device assignment programs
>> per-device DC.ta in translated modes.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   .../ABI/testing/sysfs-class-iommu-riscv-iommu |  27 +++
>>   MAINTAINERS                                   |  10 ++
>>   drivers/iommu/riscv/iommu.c                   | 159 +++++++++++++++++-
>>   drivers/iommu/riscv/iommu.h                   |   9 +-
>>   4 files changed, 202 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
> [..]
>> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
>> index 2c57625637bf..13ea67b7e42d 100644
>> --- a/drivers/iommu/riscv/iommu.h
>> +++ b/drivers/iommu/riscv/iommu.h
>> @@ -12,8 +12,12 @@
>>   #define _RISCV_IOMMU_H_
>>
>>   #include <linux/iommu.h>
>> -#include <linux/types.h>
>>   #include <linux/iopoll.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +#ifdef CONFIG_RISCV_IOMMU_32BIT
>> +#include <linux/spinlock.h>
>> +#endif
>
> RISCV_IOMMU_32BIT does not seem to exist upstream and these lines
> to just be deleted later in patch 6.
>
>
> Drew

Oops. These lines are leftovers from downstream code. I'll fix that.

Thanks,
Zhanpeng

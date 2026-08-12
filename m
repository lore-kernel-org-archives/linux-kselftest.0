Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640A237E30F
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 02:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502327; cv=pass; b=t5q7gedupUUSY+Sp9LX0SnOVJsD9NQUn0gftRuCoLIsvjHSaUr0usCT2atrip/Z5kO68HV+akPbtioyppp8a6sQ8fI3RVVV9ElkvByUyziBLJq9gSByrd9upQ9RC1I2CAWx2xus4TqFUJBZAzccTQv7gbkgqvgIiT9jrf5+ElnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502327; c=relaxed/simple;
	bh=paVKL8uujOZXf9sEomzLIUC31zXEINH59NqUPFZaing=;
	h=In-Reply-To:From:Mime-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isQZJm2SP1OOowb1PvjlIhTddxzcuhlp7GdP0vlCpFkOYQXdyqlG41VDe5rn70OX2c8p2wTwuspIqMYanJSWYMaFonbAgtQOCf7wyXqZFivXtZWrPySZbEBAg+9wDBvRHu94G4CJd4WbHzpDNKKrG7gl5cTwInyocohk8uIx8r8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HfGYohGV; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HfGYohGV"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39fa5e3a428so4144391fa.1
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 19:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786502323; cv=none;
        d=google.com; s=arc-20260327;
        b=lex772piGjW5fnnZTVMdtY2v/IQUqwFu5IMxfTQBjUoYmRCm5IIe0S+UGKCaGAvGa1
         D0ngInEEWkJLjo5a2DsZ3YZTvc+24uvDTsnNPWnpR1olEbFUWlT1S+RIe0eBbIAciCTA
         MeQvRdEiFder52e11pVzOWIbro36HBKHvig2K+ObV7X1n7MV4Ipkq81CUzhb8bw9oCQ3
         KGjfkwizwMCBSl+LniYMBzMEOPikXTglO7NKRH3geqnP7fIO++YUWsVO5ifDvADVD+Tp
         PMf49SRmbtUCAq0ldOXmQ0MBpYyXVGXtBa28NfcN2fi44Rmd5NCd25CLnhaNGbU+n2ke
         NSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:mime-version:from
         :in-reply-to:user-agent:dkim-signature;
        bh=xsPbH6RVpEmtv3mDSTBrJpAsPxSPG2QtDyPYl702kZM=;
        fh=QhJ11uQGgp7mbsCd59L3sFXIndKIE44Ky6ARlVShxdM=;
        b=aHoH/nizh48BFGMsnLjWocQdTlU/YXb4MZfwocehE7B8NNL33ISqyuXJSv7bC2qj+y
         5HUZNUbNiV6Is93WwViMJlIhxBFf0NODl33GouaeIpPMiZ3O2lQqNAbqF+DreU3VEHxC
         h1I/0uc1HmqPHgDeIm9Kb/WQr9Ad1L6RP0EZhNfu1xi0NsMlmYnksfkEESeV8yAMILjI
         vhCwvBOTEqYKdEBpUvfRegEDL80hRegJ4+z6OtSGHECd3W1p65jj/HlAfZN+M1p+t9rb
         aenR4NAjS9Z6wOZNDrox4KFJgRcSSk3PkDTYCMO2ft4oYjBJtBAXqmpsub3vKAauuLPp
         1S8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786502323; x=1787107123; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:mime-version
         :from:in-reply-to:user-agent:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xsPbH6RVpEmtv3mDSTBrJpAsPxSPG2QtDyPYl702kZM=;
        b=HfGYohGViMWIwQtCooPbT8zz4/NDB0YxADTu+MzceqOX4uV+bc4eA44d8uPTxAy/f9
         4Qofe1tVBQgcbrjH6Su4fWJOflIjZcDezCr0hyFkHWJXAPepQyAQQ7AFfGj2aV1ykKX7
         F3qnRDXtETqvDuADJCq0RrwJfAyrV4fZKw6KCtyyyJK0FKKOsBBmz96AkEyjnPwENAcK
         bogbd7CmUfQNkniuwWngftAAbIpjoD9c2BwZ3YVUG/l6fK92lYiVftajQZZp1tJ9vbvO
         eGD8bMHO8KpdhHvvpUUufcCRtVwS4McYyMA6X7mZSCruTXf38yRYnTk48+6+dAy9EGLk
         b7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786502323; x=1787107123;
        h=content-type:cc:to:subject:message-id:date:references:mime-version
         :from:in-reply-to:user-agent:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xsPbH6RVpEmtv3mDSTBrJpAsPxSPG2QtDyPYl702kZM=;
        b=Vn/QZaJhy5JlKb4R+s7nILWtPNs01WVTIzyvXO3hOU//kUh8kqy6SpyqBcYtXpZxW3
         XOobiCnAyXeuGo4mQKIgOWXwQPusYH/MuUJ7hilwWU/3qfYUaJxAXQuY64XEd/27GnEg
         Vt+pYjfao98o4rVxNjYa40TPoYVjcffi97FRvRLg75faFMtz8shAih3dqPMiX/ZaBrE3
         Q7Ec8KISMc39kaL/Y9Rd3PIKuiI4zd+Q9KP0/uT/UAL0ffRo8Jw1AHAgTLJVrXQQubWu
         zJ48FHsrAYVosgtZk9ufiXGaD7xvnC9LyOPrCMBSoL4ronCF9VqfErQYkBz7pNQGdJ3T
         zBJw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8HMGk7BKh18fOKF9075nlTwMg/YkhnZoyTkibuTuKmmzg4f7rr+2leB1YARUy4gwazbBfzKDkaIMjhRF7icQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfNH4hdG0w8P0b3x0i05x1H6OtiGWGBI4K6P7bOms3bR2Of9td
	Bf2KIku/BpawXs1c9QHyywrX4YuWu0ZgQJ/Yq3MSpXJyujopc5iee7yeG/jF6Bwvp6vnNpm/Lw9
	a52+W5dPwOfHWDJK+8FRqd53ijJyinIfYPLu94W9wfg==
X-Gm-Gg: AR+sD113j8NVThHOVfD4bVNQ3xrAl9J6Jmin2ckjn/yBVm96aNKwT27BquqgdRWDmMi
	i7k7YRlwmGuOvLDvPSg69a3EHLCuRN6YewViJuTv6mEmSgH/M5py+Qzjd+7CkbQu05hrbgN0R67
	8A3Fc7eUO/ulZsqepMD4cxpDC37eI3lvtF4u/chriRK9385F40KdxTe5xX3rbbHgPXIKUQN16tT
	yCyrcvllpPwDhOn3YUGkleAOZJoaCML9ekMHj9tidWZZ64ASdM7x+GCs9/r6CvXhquUxizMdXJd
	bW7X/UTzyxNfaYSDyvOOMATJVKeENxxbUoJPeKyRxr8=
X-Received: by 2002:a05:651c:b21:b0:39c:753a:853f with SMTP id
 38308e7fff4ca-3a10d18f514mr1416711fa.3.1786502323254; Tue, 11 Aug 2026
 19:38:43 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:38:42 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:38:42 -0700
User-Agent: Mozilla Thunderbird
In-Reply-To: <andiub47zsUsL4qh@x1>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-6-zhangzhanpeng.jasper@bytedance.com> <andiub47zsUsL4qh@x1>
Date: Tue, 11 Aug 2026 19:38:42 -0700
X-Gm-Features: AUfX_mzVF_qtHGnSgVqubj7FrTSqgmuPuhnXiNhwESKsg66sjHqWMZRBEXVi9Ls
Message-ID: <CACnXVnd14LEAOfakzpasXnteaVfZo3nsH1a4fEjvHNOQ8bMeXg@mail.gmail.com>
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

On 8/9/26 1:09 AM, Drew Fustini wrote:
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
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
>> new file mode 100644
>> index 000000000000..b0cd68997f17
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
>> @@ -0,0 +1,27 @@
>> +What:		/sys/class/iommu/<iommu>/qosid
>> +Date:		June 2026
>> +KernelVersion:	6.18
>> +Contact:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> +Description:
>> +		The RISC-V IOMMU global default QoS IDs for this IOMMU.
>> +		The file is present only when the IOMMU reports the QOSID
>> +		capability.
>> +
>> +		Reading the file returns the RCID and MCID fields from the
>> +		iommu_qosid register:
>> +
>> +		  rcid=<rcid> mcid=<mcid>
>> +
>> +		Writing the file updates the RCID and MCID fields while
>> +		preserving reserved/WPRI bits:
>> +
>> +		  rcid=<rcid> mcid=<mcid>
>
> I think it might fit sysfs better if the rcid and mcid are separate
> files in that directory. Is there a reason you combine them into one
> file?
>
> Thanks,
> Drew

Agreed. There is actually no particular need to update the two fields
together; combining them was mostly a habit on my part... I will split
the interface into qosid/rcid and qosid/mcid in v2.

Thanks,
Zhanpeng

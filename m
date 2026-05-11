Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E984D90D8
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 21:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535684; cv=none; b=bYpmkZjt0dD72TWVbUZXhdaXJKcHXZvhvJaQHIhaC8Wr/fwlPY3XbB5Pjt1JJE9ivasgWQPMd3OSDydEUqP9/QZqXyHxzkOA4lXUer8jJfUib/rOhTjAN1YQPX/0kQydCa6UPQ9bEusTU2RbjztE29yvESI59Nnlvtl9Gkw2jAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535684; c=relaxed/simple;
	bh=/e3f6zy8+2O3SOV431n7I0SZEJjZUbJQmkF91G952Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9xIFzenbSjii5+RJPHjfqO2wBJExZe4X9aDd3X/8uPW04sIwCmAr6oVQqwdWVnhGj53fMB+gGIqYiAxkREdD2ypLqFHHP4hbPIYUOJ3v4lnteabqNSHxXU9huUG47Gydc5Cz3orkXiZLiTUl1qzXyITpcDkjwaS98BRpzf5hKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rzmbnNSm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rzmbnNSm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b46da8c48eso365ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 14:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778535683; x=1779140483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s41dmpYUKpt1K9Yzx8SN6t8VShmt2QtfJ1wxqCwyx+E=;
        b=rzmbnNSmOWwpbUSedN3yPzv3qEczuKqa5r2SYB1KOFaRbI5XwacF/E4N6iFJ//2Lm1
         51TpwIrlIgWRQZZz0AfPzvFeKPP3depppG/ykQxWQZVyh3q2tN14C+kwt9zYzvgLO//I
         ldSl3yFSI5OEuVs+i+DhJ/C08Vqx8I2rXGKWI6QZKR16fQLShsKNyCQ7scaWa6j8X8E2
         tAGbjxrx2hQnFDraK+kg3wK7u+MVUB5uSaAiMm696DYtqlQZQ7kAw6ViqxkXnmm9fj/A
         qcHYD2tjaMU0CKkw4GWjQsCEjhsx5FrwPNsMwW4P+vodIzbbUVbyutDP0BKMBbpUMnZV
         vZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778535683; x=1779140483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s41dmpYUKpt1K9Yzx8SN6t8VShmt2QtfJ1wxqCwyx+E=;
        b=qC2r13bOfL/cEGVVnH45DlonRnqTjxHgzCH1Vlsbcwe8K9vmt2rIOd+A7DmG8TQ/ip
         OYiJ6C06pE95MOa+fOWlxN13B8uEgJCfs/Z3aw0h01/x263aGsTQ8UsevNFEOQmNDi4C
         DI3VSCiRMP7NnAg/HP7XI+jhhAV52TGe6YwiAWbtFv8/oye2bOzlJFtKgEmx/GG4r5cF
         fw3GN0MAoAs5cEGVaCO9hUvX6eZ7Z1yoU48j2ycs81YHPeRWFo4qMXx0poufsPuzC9fE
         XW6wE/CmHMDWaU8EXhyTvEjQaz9gHoyJs3zqRTa95TBS0UDrEFBTVVgp46fZ8v6gM1hu
         UdRA==
X-Forwarded-Encrypted: i=1; AFNElJ9I9B6hJcZcF7Ph9zoPoJh1yg8Ptlyxn+AoF6dAFmZpUrZ5ka+fM+SHxFDT+RTPwDySeBT1BH6QVht/L0TLLVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYYOhJKsfi/PoV1eG1PrS1fJuCtRiaOCbnlNJycwiidfxuhn7X
	ptdPOwkG3O0vt4bnrflQ5rxwoc7oI8HScxPCO4how0/kK5ZbbafF42hNBQ41Zhv7Bg==
X-Gm-Gg: Acq92OHvSbqygKvN8s9x5SLluYzuzcaN8RUs8RS9aTOL3xpst2vK+ogH3cI1EdctZwH
	VY6OMPL8ev1hi+HuiyLJD448yxbqTsDaCKHtURceL1WBNJABe6DHgJEwp1h15N6FwN6myfIte4r
	6VIJYiAtpN7ZuRlJUtHuCFOjIrp4lLEpd2YCiP3DH1pIj128w9KEXv4QQL5uid6iWN+vVsW5DcI
	1uLbT/Ptm4C5fgnwYpAoe5jPRUWbmKkC9mb8Ci+Q2P56P/aJaBQQRtVrInKJOswNNfVoNzz0mYz
	QJb5rOORvP3MkTwrk7ySmMuPAUIsq16l6O6Chh7u/rZnsGWzoiGJ4PHx+mEHGnrOt4vbEhtZcNs
	LV91/E23fhqNfNSGPs+mDMBMh4GkFiqJLrpSy79xncblY4GC5M8wG48pmoSUF643kyQQs1ug5BN
	YclvLCzYR6syM0DxPUtJUWGobPkmAbAcAfTKwOR0jAN7OwHG3KtLid3AH/bqSDlfW5cncKKA==
X-Received: by 2002:a17:903:190:b0:2ba:dfa:328d with SMTP id d9443c01a7336-2bd01294a6bmr914625ad.1.1778535682176;
        Mon, 11 May 2026 14:41:22 -0700 (PDT)
Received: from google.com (153.46.83.34.bc.googleusercontent.com. [34.83.46.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d63b952bsm8644567a91.9.2026.05.11.14.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 14:41:21 -0700 (PDT)
Date: Mon, 11 May 2026 21:41:18 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Aex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	Alex Mastro <amastro@fb.com>, Raghavendra Rao Ananta <rananta@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] vfio: selftests: Add support of creating multiple
 iommus from iommufd
Message-ID: <agJKOnHZdsQ71KLw@google.com>
References: <20260505221518.619123-1-skhawaja@google.com>
 <20260505221518.619123-2-skhawaja@google.com>
 <af4or28EA6PGEd12@google.com>
 <agI2EFvBwKUHaHVi@google.com>
 <agJDSaAmZYv_5byL@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <agJDSaAmZYv_5byL@google.com>

On Mon, May 11, 2026 at 08:59:53PM +0000, David Matlack wrote:
>On 2026-05-11 08:21 PM, Samiullah Khawaja wrote:
>> On Fri, May 08, 2026 at 06:17:19PM +0000, David Matlack wrote:
>> > On 2026-05-05 10:14 PM, Samiullah Khawaja wrote:
>
>> > @@ -478,11 +483,7 @@ struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id, u32 flags)
>> >        struct iommu *iommu;
>> >
>> >        iommu = iommu_alloc("iommufd");
>> > -
>> > -       iommu->iommufd = dup(iommufd);
>> > -       VFIO_ASSERT_GT(iommu->iommufd, 0);
>> > -
>> > -       iommu->ioas_id = iommufd_ioas_alloc(iommu->iommufd);
>> > +       iommufd_init(iommu, dup(iommufd));
>> >
>> >        if (flags & IOMMUFD_IOMMU_INIT_CREATE_PT)
>> >                iommu->hwpt_id = iommufd_hwpt_alloc(iommu, dev_id);
>> >
>> > > +
>> > > +	if (flags & IOMMUFD_IOMMU_INIT_CREATE_PT)
>> > > +		iommu->hwpt_id = iommufd_hwpt_alloc(iommu, dev_id);
>> >
>> > Does this need to be part of iommufd_iommu_init()? Maybe it would be
>> > better to expose a separate helper to allocate a HWPT for a given struct
>> > iommu *.
>>
>> Hmm.. that is interesting.. I think we can have following immediate
>> possibilities when creating a struct iommu (there will be more down the
>> road, but can be handled in similar way):
>>
>> - create using struct iommu with a new IOAS.
>> - create using struct iommu with existing IOAS but new HWPT.
>> - create using struct iommu with new IOAS and new HWPT.
>>
>> I think I should probably add following flags:
>>
>> IOMMUFD_IOMMU_INIT_CREATE_IOPT (IO Page Table) or _PT
>> IOMMUFD_IOMMU_INIT_CREATE_IOAS (IO address Space) or _AS
>>
>> At least one of those should be required when creating new struct iommu
>> from an existing one. WDYT?
>
>I don't love the idea of passing in flags to control the logic,
>especially since not every combination of flags is valid. And also tests
>would be required to pass in dev_id even if it's not needed (first
>possibility in your list).

Agreed.
>
>Maybe add explicit helpers for each case?
>
>/*** static (private) helpers ***/
>
>static u32 iommufd_hwpt_alloc(struct iommu *iommu, u32 dev_id)
>{
>	struct iommu_hwpt_alloc args = {
>		.size = sizeof(args),
>		.pt_id = iommu->ioas_id,
>		.dev_id = dev_id,
>	};
>
>	VFIO_ASSERT_EQ(iommu->hwpt_id, 0);
>	ioctl_assert(iommu->iommufd, IOMMU_HWPT_ALLOC, &args);
>
>	iommu->hwpt_id = args.out_hwpt_id;
>}
>
>static struct iommu *iommufd_new(int iommufd, u32 ioas_id)
>{
>	struct iommu *new;
>
>	new = iommu_alloc("iommufd");
>
>	new->iommufd = dup(iommufd);
>	VFIO_ASSERT_GT(new->iommufd, 0);
>
>	new->ioas_id = ioas_id;
>
>	return new;
>}
>
>/*** Public API for tests ***/
>
>struct iommu *iommufd_new_ioas(struct iommu *cur)
>{
>	return iommufd_new(cur->iommufd, iommufd_ioas_alloc(cur->iommufd));
>}
>
>struct iommu *iommufd_new_hwpt(struct iommu *cur, u32 dev_id)
>{
>	struct iommu *new = iommufd_new(cur->iommufd, cur->ioas_id);
>
>	iommufd_hwpt_alloc(new, dev_id);
>	return new;
>}
>
>struct iommu *iommufd_new_ioas_hwpt(struct iommu *cur, u32 dev_id)
>{
>	struct iommu *new = iommufd_new_ioas(cur);
>
>	iommufd_hwpt_alloc(new, dev_id);
>	return new;
>}

This looks great. I will update in next revision.

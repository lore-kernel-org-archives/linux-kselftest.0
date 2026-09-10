Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5DE48663E
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047635; cv=none; b=mocQnDJfUIj3n3keRahI9M7cpkbqiLRaD4o+bVGqigKovkyl3OEbJg8NEXbtOmRde3TwLj7auHICAGPJ6OtaIfDuBnoAmaT4kXP2HYurx7HXlU6e+FOsuPj8PKTi776HcUlo4Zt5FpDtMT91aEEcTaKgp+vqvJcQezQYaEZJlUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047635; c=relaxed/simple;
	bh=E0HFg0SzLDxP5QD6hp/YjRxGgume2isM05oS3oy4/Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bA5gUtOnIhNBUQLGogiP9IMP2womL88bXCCdn9Tj5ze37kvD3jX7znHtgp8DFpwzNx41CnhAbNXj0wXhNfONR8MILo/XjcNbRqdRTccdsju/LpJnKyCi118n8r1+7/iFSyuhI2kELK35a/l1NJVc1YnwUR70l/oWUEzCQbM7Dxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=CKQOPX94; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="CKQOPX94"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9377f717879so377217385a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 06:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789047631; x=1789652431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aY0bZ/yqrjuFAG3J6+JEFIWAYMbJQEXce7G9l1M4Rcc=;
        b=CKQOPX94M69/LzUskxyfGliTFAlVsyLopvpt0sLwbo/Pn10hRe1e01BSeZ492LTU4g
         MR/X0W87+Q4KWTSh4DYQ9d4GfhBkEaF5XhmlN2odStk0UBNQHRiJ2ps7TXJRGK5LObBf
         USVNKpzq3unJritdP4Vv3T0g+5U8zi/eB+o8QW+XgPfYZ5RP1Xs23ip3q8ie/xJSv1qc
         RSjlHzvOYynSipCbvraD2YTlpjPe+OgjO7BIcD+yZaDwGiLhrRrT6wXxE5q5oV4e3ZZZ
         d8Uu1zaOHb07ey7RdWw4dvFR7R2jZYDa4+mMt6xoYnsscm4nugSESvns1/BvyKKSITcK
         5zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047631; x=1789652431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aY0bZ/yqrjuFAG3J6+JEFIWAYMbJQEXce7G9l1M4Rcc=;
        b=TeQ7Teh7aPUhUXU0SOnagi5lRahv+D0Mm7bRNPMYPuvOTPfGHmmBaYe09fP+fhbar5
         aYMJPcBR4oBVitSKsAo6OqnffVoaPpANkX91fsosnz7fJjPrChwElbFYav/QuQvQqtjU
         74lLgnj4cjQmnBvS8E60plPFt8DVuY6E5wqT5E82vGGXh2SmqObC5F1iT/pUeaqb0Rkf
         m/CvYuFAC8NHKqNpuJn4Ok/UgZwATGGxDzEsWj1ExgZjRem7+4eanBER4RY27ImRUx+x
         PS2yuyaYKywweSsAElt753jUTGt3IcxUoKAolsiWm8pdj5leliprAMKiqOzRZ7/zJg25
         67Og==
X-Forwarded-Encrypted: i=1; AKwUvBwxZwsblDRlUbV8p5BGzi8Ui7B+Dx8LtK5xRMzLogOfeMuFvo1uBXppaZajkAFZwbCgVzp8Nn5AIMkYsSOPb2E=@vger.kernel.org
X-Gm-Message-State: AFuF++lym4J8yDdyWtpqToylml+285xbOTUKbFRmW34EWgzX3+Whkr8u
	aOweKNrznlEkLw4sGENEoCtgTkNIIpc552jq9b+4Lo54jYM+MTFxz712+/Y6i+wz4u8=
X-Gm-Gg: AYBFou2fg0b57YFq8fIuyWm4MW2+o6rOaJdWhw5HCETbu23QJvK0ntjc6XguEd1bs9A
	pLdi2ny32fitpe45jQB95ZJLVfrjhP4O6AlayJenBCKH7QGz9r8sUZh/W9/harBYNApMiC3mbRR
	JSv5IBjVW3dV0l6cWPz2ChSWsQ2B0/EHXpYWSFMUai8W2QW87YgbxdXRT9H7x1RUERDGRgBEVVC
	OPWlTwFoLIuktQ8xCL7tMzep/xh4FtRuVSUzsRyjOrJWyrjnzLf8uRqfQK9RU/uHJ8oGBG+oXnl
	ncZi2K4B8xWIkREtfaeTmAIyojImuRi+4SwwhXMMJRfGXLkk/7yRKyICbVpX8N6dQ6ska5eqqfh
	UNtupEDAI3Z5HrDTWU3OhPcWlcfbnFoRLBEQAHxZ3BlWDaj6uIVmrutBqMynazDzIcBGL1fUxk2
	PaWR9uZvdR27LjV1wutWKP6G7M27jvRvYadywshA1KZTmMfSCMSXK7BSDVE+mHC+Bs06OzMeV+X
	MErXocSGC9T3jxIJhercupExbHTsloCWFWYia/2OlkkOVwiXQSXes8YQCqEHF3DfQ==
X-Received: by 2002:a05:620a:2a11:b0:939:a2fe:926e with SMTP id af79cd13be357-939a2fe971fmr3077102985a.17.1789047630473;
        Thu, 10 Sep 2026 06:40:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e190f8c3sm78468885a.17.2026.09.10.06.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:40:30 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:40:28 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	pbonzini@redhat.com, seanjc@google.com, akpm@linux-foundation.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, shuah@kernel.org
Subject: Re: [PATCH 0/5] KVM: guest_memfd: bind backing memory to a NUMA node
Message-ID: <aqKzIO3DD66Dhkdw@gourry-fedora-PF4VCD3F>
References: <20260902194657.79075-1-gourry@gourry.net>
 <9b67424d-70e5-442b-9ec7-22b1d3db12f4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b67424d-70e5-442b-9ec7-22b1d3db12f4@kernel.org>

On Thu, Sep 10, 2026 at 01:30:04PM +0200, David Hildenbrand (Arm) wrote:
> On 9/2/26 21:46, Gregory Price wrote:
> > guest_memfd allocates its folios through a per-inode shared mempolicy.
> > 
> > Today that policy can only be set after the fact, with mbind() on a host
> > mmap of the fd. That requires the fd to be mappable, and it cannot reach
> > folios that are only ever guest-faulted. Neither holds for a
> > non-mappable (confidential) guest_memfd.
> 
> That looks like an investment into a mechanism we will soon consider legacy, so
> I am not convinced this is the right approach?
> 

Hm, I think i've missed recent work in this space / this context.
Any suggested reading here? Don't want to eat too much of your time.

~Gregory

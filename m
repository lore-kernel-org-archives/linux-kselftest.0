Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4383D2D94AF
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Apr 2026 18:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775328815; cv=none; b=NU6h63Md5wLhG7WMdgyC3cxWTreZFdkKo0r0PXA3cr06sf9gHjdwtQJmyFygpuZ0HKgE0mLXAsyUsyIa+IYpJ4Nk95TX51PhfdHtoMO9k0v2laob+Uy/Il757LWLBg32vK1vR5NyRi0pGLGf725D+XAwQp6FmvVE7bzjdt5T8sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775328815; c=relaxed/simple;
	bh=dtScXWXhuDldnt6Kvgogigjrvo1FHXnb9GiXekrXjiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKNvhgXtLVR61diOxfigkx3FimOddrv3l8cRTwaNqL6AKWzg7QjT+J6vGzzkcMr/oXCh9yEoIJ4LH1GH9rckh9qTSBp2nmNPrlu6boTbNOF5vcwmrqEOyEki17xRuJF2YVMWad8AY1GyHMPjb/zQUTzjNBYq4B+vn9zgukTzTQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ByDIMUKw; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ByDIMUKw"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cbb6d5f780so302669785a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Apr 2026 11:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1775328813; x=1775933613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nck4cGiGZiXSzZzHQhsuUAn9cXTimQB//kh9QdWI6lU=;
        b=ByDIMUKwmTdGCOxitwoHje2n/+PTeyBAv707lgF33j61xnMUcwkFFHQqg/RkbGFaHh
         Zz6yMrfvfJnvp1flwz60AtMoXBTvUV4tbTb4YcH9CxdfZSk5kxULJ8Ifmacf+MQfqZqs
         VWWcDBe9rURqQ9M7dosyV3nNTgCDXz222O6V/tHlKCwsbnzrIcB569Ghy8B6/p9i9nsW
         5tJiNINRpJWSZe0MKlDI+X4ZcTXtdZZtosUT9ATanZKqQvVfbL7H1aJUiHQjy48Qa8OJ
         4uG5XtFt90iMXBenMCAVNAUjfUy0eEjr2qLh2l431Rryhh7wXaNGNfAU/uH1jB8IQ79y
         azmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775328813; x=1775933613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nck4cGiGZiXSzZzHQhsuUAn9cXTimQB//kh9QdWI6lU=;
        b=TImPSKozDauNQ0/ePlqCQIXAUf5tr0xsNv+OMT7VO/0ClHb+LIiM/Hl2CiuOUhUwNn
         7XFebNKzsUGlKUUMlBRpz/acpR05pXrenXDNMJV1xLFJsqa31XyhksN5AaV58B09oKp6
         48cCSOIiGEdI7I8kLhwFl4AtJGBJzjsr5+oVAJD+m0hDzhZywhPdMUbWJ4T0IK/nfmQk
         peOzxf5VH/3eLBRvOQipE40xa4xq9aSc/93+t2GWdGCCLM28HlVHINmSL7pjgItv/AFz
         uXLlW7+ihwz+5TU80biqwqnNzX8uB16MbFWhHjgsh+Yk3pf5UMhbey3La6akT/n1P9sn
         7giQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfa80gAKaRLcIYRyLRZMy2CPg9cyT79Mnqv5NxOGqkvPHrwLcpU53NtPuiyRNZ+XcW5mrnnw410Cw+Sj6YE0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLPQWLC16JY7J8vu5YRhrza2KR2/fRd8Ba6igFKJIrOjKxGBZl
	NRpF6vPjpS4VBlVOXwGKQNoXWzGcLEZ/OcCz0Mfd+JvL5z/O8PyYD4aLHOHebRguuV0=
X-Gm-Gg: AeBDiesIw2qvGpBUQRon+dvxhQG5RnxrzUOueUPoPZVR0rciJCbt2tCau8wULrqepED
	1rPW8KTUiAErdwc1XjSHU6S0AdZZTsCb9Pjl0JX90kJVEJapcMYyekj4RcdgE6CYqhSJ7yYR8mk
	2JkHPuz4yMp2HfC1qP0feIuSHKT7gIU383sk3Ut3nfnJq7gj427DEDvF9n4PQlHuLpHuYYy/YJ2
	RClkmGrDLYVvI7IjFJrpzhurFmJClVA7tgWH3zoe/Lrig/K0VcGKJZ+dH4YR8+HKeWuGGDdAoTj
	YF32nAFUrRmxt7NkcNVqMbaHFIvrmFdYkbN76rF6Yl6ZSjdkfokoVnYPM9tuVQcOIWRsiNAC6Cr
	f/gdufN3qj2usf+mChVm6hr0ChFDr8hhxLOTo6WkyW91O2229LXH2xgaHAZmpo0gUXNJl9dstcc
	NKZKrtzHMEqjHkKluVPl2OG6ALViOtc7CWjnxbXfOMOV1s6igjmhD4qgH7DKdTM60wNN7CEA==
X-Received: by 2002:a05:620a:4003:b0:8d6:bd01:a67a with SMTP id af79cd13be357-8d6bd01b3f5mr99323085a.26.1775328812984;
        Sat, 04 Apr 2026 11:53:32 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a864b516sm733755685a.37.2026.04.04.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 11:53:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w967e-0000000CyRZ-3Zuw;
	Sat, 04 Apr 2026 15:53:30 -0300
Date: Sat, 4 Apr 2026 15:53:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Cc: mhonap@nvidia.com, alwilliamson@nvidia.com, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alejandro.lucero-palau@amd.com,
	dave@stgolabs.net, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com, dmatlack@google.com,
	shuah@kernel.org, yishaih@nvidia.com, skolothumtho@nvidia.com,
	kevin.tian@intel.com, ankita@nvidia.com, vsethi@nvidia.com,
	cjia@nvidia.com, targupta@nvidia.com, zhiw@nvidia.com,
	kjaju@nvidia.com, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v2 16/20] vfio/cxl: Register regions with VFIO layer
Message-ID: <20260404185330.GD2551565@ziepe.ca>
References: <20260401143917.108413-1-mhonap@nvidia.com>
 <20260401143917.108413-17-mhonap@nvidia.com>
 <69d0169115c06_1b0cc6100a5@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69d0169115c06_1b0cc6100a5@dwillia2-mobl4.notmuch>

On Fri, Apr 03, 2026 at 12:35:45PM -0700, Dan Williams wrote:
> > +	/*
> > +	 * CXL device memory is RAM, not MMIO.  Use memremap() rather than
> 
> Right, CXL.mem is RAM, not MMIO, so I question why is this not being
> mapped via a RAM mechanism? Can you explain a bit more about why reusing
> vfio MMIO mapping mechanisms is suitable here and what happens when we
> get to questions like guest_memfd integration, page conversions, and
> large page mapping support? 

None of that is applicable to VFIO. VFIO owns the entire address space
and does not share it with the mm or anything else.

> Maybe this is the start of the conversation for something simple, but I
> would actually prefer uncached ioremap() if only to avoid all the
> coherence management and suitability of MMIO mechanisms questions.

The entire thing needs to be mmapable in a cache coherent way since
that is what the HW semantic is. If you try to do something else you
will break KVM support since it follows the VMA.

Jason

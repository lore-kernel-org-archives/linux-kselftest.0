Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B26E3B8920
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571332; cv=none; b=dAXH6DmHqcTgttdWlNHF0IMolErp5F4yarfNpTE5TJKpauf53vg/e25BB9POwRbfw+Fl3wXfoYvbc2/6MdKSmxfg/EEqx25PplSkR8I2OMCf54sUPOFQwRnxy1PYOGZ2fq1q+GYw0RFSFDxV8eSwxaCy8YrcwE4IZSjdcNrkfUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571332; c=relaxed/simple;
	bh=FnSsZuPnGyxPDhNZRLYQ6JCnZWuSSmTUwVpsXpmU4SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRxUk9IGwBhoQTRcZqe7/hhrRntgC+ipILt21+ZVx+NaKLDsb8cEg+6BjUEAfTuQmSXTkb1UVTd8ORDy3a7TUl0MT4edCqi/KtjnHvfEf5/5dbh4pnyAJud2wug8PP15+o0Tsn/FODW74RiWP1DKpaU70PNABk/mO7BuAxj/HMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MtaqTtWC; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MtaqTtWC"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8d6d5e45c43so327696585a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1775571330; x=1776176130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrXvcr862UuyP9u64puUV6+vM1HuF+WgVzFiTHYkxJA=;
        b=MtaqTtWCayCARWnIfAPjHP9sgccrUonJRIK8Swc2gcl2f8lHjGClpqtv2R1df2NZJA
         A/ifVD2S55jf7AngdY6uUPhI5nGMeX3IDKA5mLsic7GDGQfBqGDiEYdH0Id7wupSketU
         L+t1ngjlUlmMA2O7DBM6sOkr5RN9K/U73cJnwu0bmcraxzr+QusBAmyxAEDPSNw/nsZD
         UmHVpz2jeyyLXRvEnFOgEQgslBrrkNbqzhWuYgzgT3jcHOdfPeM/CjgXFMvbr6PXuTrF
         57hq7ZDVXjZTNxHPoTCBcNiEWHmYPBkvt9yGZNEe6tIy2Vgt1h/ZaSs1VYK/FUHdxpPq
         Qjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571330; x=1776176130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrXvcr862UuyP9u64puUV6+vM1HuF+WgVzFiTHYkxJA=;
        b=N6XQANkVjgO3eiwEY5XVuj+xC1a6wK8/Dx8XhNBqGlCokCmfJcYCnhmfDOvuqS9Dx1
         zVIY/MVyHvY2L7DBCOlEocJmWLxZoqbIFnsvFkfHGAZ6r49Dik23joRlOg4RpqxntZ6F
         QcYhGTCz5eKXpnWY/MC1lKSAOwZQgGuX1+t3Af7qQd4kkB2N3AHZW0NvDOK1Xo0XCzPL
         UsWGwcIpk6afNHB08q6WKxE4epBLN6IMh00hf0vSItMwPtQDKrF36Kxjp+7Qh5O2EIlP
         msSZVghR0/Qm8xDDMzn8Pdqc1kXw3rlXEB+4yMcFc0y6WCJoNXh6m2qtWjKepmEWiL5G
         h1kw==
X-Forwarded-Encrypted: i=1; AJvYcCUiXXGivuCpNdbfxxIVUA4CiGjAeWHaNayxQkb6/0tA/9jbP072rWTyHtmbGu5DHDy1mf92UGF/njhgCS0C+24=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/zHheANYx1dTw5pvz2XAbuLh1aLJc3K1vxtSprw0StWuMPP7t
	4fd+oj7gVgNBWfl7e5+Sv0YnyvQCMsjJwuE627qDEFqDl7WLvx9cXOTsFz1uLdnb9ME=
X-Gm-Gg: AeBDiesXe78EzEZAYHl+o5raWKrN77OY/cpOHEYXTzCxoUUMj4u6eGRYhNX6pWxiWm/
	hLCNt4SFlfLI4h9No5/tZamA5NMLV64uvhNxtEG7MApbVc1QOcHUm0XqxgSSCSQA9x1XyBNKSJH
	Pxxn9w/KBYmLNnejma803upDoD5KD4yVY3izfMaM5PK5qr4K6RSyKyl2I989rLoBbZUsjMM8duv
	f1slpM1LTlEjey6/jIm0VQj4+HaGZTJcm9RONA8dDjaiajNBDOGdjZe6zIhf1mpqyG8C8I44VHz
	xa14JaH8sT/c3asWHccRFgS6331bGlgN307cLpul46Mayz4WLjWWxBOIO6iik3svX9DnYRmGg5u
	j5UpPvEUVn7DoIG+qpqs3qcxuQWX7EWE0D3PVM7Uxjlc7X5Vvwkzt3UIZgft3LOnmRK8Axabuor
	x6ZvuMJhALdhrkjG184M9sjZKWD5Ol3cdN51tNfG67yVE+V3pbVvbNBsg3fhbelndt3fyjtEz1Y
	JEt3DM6M4IQ
X-Received: by 2002:a05:6214:400a:b0:89a:f92:b09f with SMTP id 6a1803df08f44-8a7022bb7a7mr282281776d6.4.1775571329335;
        Tue, 07 Apr 2026 07:15:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-243-150.washdc.fios.verizon.net. [71.191.243.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596ff619asm183100226d6.37.2026.04.07.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:15:28 -0700 (PDT)
Date: Tue, 7 Apr 2026 10:15:26 -0400
From: Gregory Price <gourry@gourry.net>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dan Williams <djbw@kernel.org>, mhonap@nvidia.com,
	alwilliamson@nvidia.com, jonathan.cameron@huawei.com,
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
Message-ID: <adURfscEwBuT3utz@gourry-fedora-PF4VCD3F>
References: <20260401143917.108413-1-mhonap@nvidia.com>
 <20260401143917.108413-17-mhonap@nvidia.com>
 <69d0169115c06_1b0cc6100a5@dwillia2-mobl4.notmuch>
 <20260404185330.GD2551565@ziepe.ca>
 <69d1685538f45_556821002f@djbw-dev.notmuch>
 <adQj_gxSzjA51Q6n@gourry-fedora-PF4VCD3F>
 <20260406220521.GG2551565@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406220521.GG2551565@ziepe.ca>

On Mon, Apr 06, 2026 at 07:05:21PM -0300, Jason Gunthorpe wrote:
> On Mon, Apr 06, 2026 at 05:22:06PM -0400, Gregory Price wrote:
> > On Sat, Apr 04, 2026 at 12:36:53PM -0700, Dan Williams wrote:
> > > Jason Gunthorpe wrote:
> 
> I would expect this to happen via the request_resource mechanism, if
> MM is using the CXL range it should be locked in the resource tree and
> vfio should request it and then fail during the initial startup
> phases.
> 
> > I need to read up a little bit on this area, but i don't see the "needs
> > to be mmap'able in a cache coherent way" to be an argument for one
> > particular method or another (hotplug, private node, memremap, etc).
> 
> It is speaking to what VFIO has to do. It is the exclusive owner of
> the physical range, it does not have struct pages, it must be cachable
> for VFIO and KVM to work - not alot of choices here. Turn the
> phys_addr_t's into large cachable special PTEs inside a VMA.
> 

Right - the observation here is essentially "if you need struct page and
need to get fancy with them...".   But if you just need to plonk a
region into one set of page tables and move on - then this is fine and
arguable preferable.

~Gregory

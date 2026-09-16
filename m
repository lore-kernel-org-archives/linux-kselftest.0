Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9029A4D37AA
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584586; cv=none; b=N/vxLWeyn6NoqLcMWEea1677Ih4SUcEota78OTdU80jvV/39kK5JeX5egwNnbHG3reyv9U4Rf8CvLii/34uWfJoiN39K/ofIKEyIFkkS5tlZMKoiJe2Mj2RFQV7O1Zt6U49blZPB1ihJVRUwfqaDUrhQrmnSv0CKN1GX/qXi4JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584586; c=relaxed/simple;
	bh=qjO05h8NCgW9DdH4l85dlmT24Ysl3YzDoaGNJA1xrmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhowKmKz1l4NzZDWK8dbmhPTeHW66s+tpmN0K52TDadzZQ+MbHSWDTbQAnRBBRHuAOP6Fdi2UuzqbY8srqJDJyWeroLbeRdVzT0oEokU67DaolD29E3/kymmabM9AWX9017X4FwpfXr90Ng8ALGicGG6L7lhsQlbXTi5g4SC+ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ur49RFow; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ur49RFow"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6eeso11331826d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789584579; x=1790189379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c0iIgJwWQvCfxDYTtHwJ9R8OwiKsFPaAaYmGvWCYHto=;
        b=ur49RFowrugsitDaOgTStbQHm+W6D/02S+/MOvhvMB009kC6tZjAi82Ko/N58VLPxD
         pyXFXamCYOw+3E+3qoL6beXSB2Y+gpDfO5z9awOvcWz7nw9t2V0Xr537zaWfHFk++/Rq
         0GuINYEzdF0e+POW4Y/Do/mCRSlGCD3kXhWFx7qIwwwqIV7ufFvS0J+Er7wZz3IiM4tn
         TJMnvlbZZ94JK4CDfNX+/YXNcrPPNLKYtV8st/9DMgMPbLzXWFPaxS5GLdZSU4TG1PXV
         q8FDrb8A3DsRRBqB+9r2Z6tpBjpAyMpR/lJ3LDNi14KfyPnY2vUxIrxPEgEqezIy/u6a
         SLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789584579; x=1790189379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0iIgJwWQvCfxDYTtHwJ9R8OwiKsFPaAaYmGvWCYHto=;
        b=HoClpR5O9FkWNu3vAVuH7bJzE++/f5KqWDlGwfATA315yAHI1n3XBdg7AINm+Y5zGE
         Ljqz/PE1ZmKrSe/iL+UCHQnbb/gbEDVw2gFIqaVJx/uV/GRpWVs2gdYNPIJCA5MAHUj6
         MQoRcL5nJz5LZz9lZTBOG56aBSzfIqXRxzbXnOBlViCMtANS5cMDVUjYa+DOmNJlGY14
         5aqL0KMu9yGngQT3bjaCpZNJbCzr0CKFtpIFtBo9mdMiwRx4rVMOTCzdfVpAvQzs3EiX
         bwBclI1enKs7FeUWUoN/G7fC0ewFbOjiKgRklhGWvMXLjXd6SXwaI0kW8CUQR8LRP/HV
         Z2vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYygC6z8MKamMUIsydAK4z8fHJFICvOgNFlYITIPiwcKAG95D8eSsDKToi0RxQzLb6xm3+4Mk7MU3MVFaeuO4=@vger.kernel.org
X-Gm-Message-State: AFuF++mgcntNzlIF0NCIHqShHaqimT0L8CXpv8jpAVJfGSi2CeBE/9pB
	lfZF/Yw0mY4Lc/3eAwJiD8QaRB0jPqAu3sOEFTJ8Ycv7HecEn7G/CXYwaVecn7ZMyD0=
X-Gm-Gg: AYBFou2/EJWlWJdkqQ7G6bygJgCKxVBX2kg827ckky+GqO4VgzHABGEC0Xz6DSK7vG1
	fs2KaVBP2fYGYfeAIqoD1YB/DWgQ7ioie8Nmi7FYqyDGYthxr2HLetps1T3cXWgY6fT+tO4cM3m
	QkRb5+hiVxfA58iP8V7dPxz/w62CyCG3fdTbO5EX6Bu/hg4+jy4DJAG0YdN+SqfnefdVBs8pSXa
	8ecsO5WtSZfd/L5TJdM7oelVAclDIf8Dk1XSLPz042CO+wAlI+34yHCjkoGXNYCVlUWdHwUurWK
	74BB/a1JK8mUtRM5u8yv5Gx8UG0icU/4mHek7NG0OgBwFFzJXxU46pkiQj47E2LeRxAO6dnKTyj
	nglE7LSHICbpAHuoGcMUOVnvVNRtBM9ZKLSlfsuGYUEsrsTVWM55fUJREMHaWPP1PdrRjGW80IC
	Xwa/k6GzvmOJ/JcUs4Ez6ppvTyaUAcEjcXNgjsA08wzRtE430okK7K9LHLcfShK4ygJ0un5rwsS
	NlLHDrDVrrpFIgb0xXKtY73SKuNHNWWlM1Ba+ho6rmiaxbUpU8jzfg=
X-Received: by 2002:a05:620a:17a3:b0:939:8905:ce9b with SMTP id af79cd13be357-93bb77461a9mr631916885a.17.1789584579016;
        Wed, 16 Sep 2026 11:49:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81d147ffsm281088485a.43.2026.09.16.11.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:49:38 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:49:36 -0400
From: Gregory Price <gourry@gourry.net>
To: Jonathan Cameron <jic23@kernel.org>
Cc: mhonap@nvidia.com, alex@shazbot.org, jgg@ziepe.ca, ankita@nvidia.com, 
	dave.jiang@intel.com, alejandro.lucero-palau@amd.com, smadhavan@nvidia.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, dave@stgolabs.net, 
	alison.schofield@intel.com, vishal.l.verma@intel.com, iweiny@kernel.org, 
	ming.li@zohomail.com, yishaih@nvidia.com, skolothumtho@nvidia.com, 
	kevin.tian@intel.com, bhelgaas@google.com, dmatlack@google.com, kees@kernel.org, 
	gustavoars@kernel.org, cjia@nvidia.com, kjaju@nvidia.com, vsethi@nvidia.com, 
	zhiw@nvidia.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-cxl@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 07/27] vfio/pci: Detect CXL devices and load vfio-cxl
 on demand
Message-ID: <aqrg9AJBh0GUsP0l@gourry-fedora-PF4VCD3F>
References: <20260813093631.2288172-1-mhonap@nvidia.com>
 <20260813093631.2288172-8-mhonap@nvidia.com>
 <20260916191659.1d3cb36b@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916191659.1d3cb36b@jic23-hlaptop>

On Wed, Sep 16, 2026 at 07:16:59PM +0100, Jonathan Cameron wrote:
> > +/*
> > + * A CXL Type-2 device advertises both CXL.cache and CXL.mem in its CXL DVSEC.
> > + * pcie_is_cxl() is also true for Type-1 (cache only) and Type-3 (mem only)
> > + * devices, which the vfio-cxl provider does not handle, so confirm the Type-2
> > + * identity before engaging it.
> 
> We don't expect to handle type 3 class code compliant devices, but what about
> the things referred to sometimes as CXL Type 3+?

Dan has previously (and I think would continue) to just call that
an accelerator - because it is.

I think the Type 1/2/3 nomenclature is stale and needs to go away,
it's outlived its usefulness.

To your point below, a compressed ram device is really an accelerator
with CXL.io and CXL.mem.  All the spec says (used to say?) about
"Type 2" is that it *may* support CXL.cache - it doesn't require it.

> It is also plausible we'd pass a full compressed RAM device through to the
> guest without paravirtualizing like we currently plan to do for class
> code Type 3 devices (for DCD, sharing etc). +CC Gregory to point out where
> I am wrong on this ;)
> 

Plausible, possible, feasible - yes.

Sane?  More sane than using it as a normal memory device on the host
assuming RAS signals from the device can't overwhelm the host (unknown).

> More generally, why are we controlling usecases?  A class code compliant type 3
> device 'could' be passed through I think if someone wanted to do that.
> I'd not encourage it but why is it a linux policy to not support it?
> 

The only scenario I can think of that you'd want to pass a simple
expander all the way through to the guest would be RAS signals - which
I think still require host plumbing anyway to avoid passing said signals
to the wrong guest depending on how you've chopped up the region.

Basically if you need DPA/HPA data from the device to be interpreted by
the kernel, the guest needs a translation mechanism.

In practice I can see passing a virtualized, locked auto-decoder through
to the guest with the same HPA/DPA values as the real device so the
signals can be delivered quickly with limited host interposition.

You would probably need on-device vitualization support to do "proper"
passthrough so the device can route signals to the guest directly.

Anyway, you could pass it through, sure, why not.

We shouldn't limit it, if only because we're not clairvoyant about
what will be useful tomorrow.

~Gregory

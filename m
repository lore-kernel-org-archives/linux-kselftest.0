Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7D92FDC3D
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 19:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773947085; cv=none; b=YsRXSJG/4ySMVRyrO+bdRQty7h3ZavXAjQxdcx5SROoHZ5MPoHsQkGCYKAjWFatJopKA26nSvy91EZbj5UR82gwSP5Um3y0cfSLQK9/FKKgWv7d2MUrnwJdfEPKXjJXdxxIpqIsr/ryJYeHHPs8hFhG/6tng99p0jI4d1CMNYoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773947085; c=relaxed/simple;
	bh=O7How6iy7ps7jiYMw6xEBgenh4uyyqsHt+PiU3w0UG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WM3XMNLswDegTouIkd8V75UhRim58fi7TuGi2pKztpGTF5Y7JCJh2OizSBgDMwgrUgtR3scZ/4xOedK+5vRnMjKDT9fmsS50S4QbYF3EtZG5Ji5BF3H2ZzMxEzJdA7rrKShLTnY1P/je22l46ImHxk5Yb0/f0v4zhieMXpI2UUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YhbmXuFp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YhbmXuFp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a9296b3926so10218985ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 12:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773947083; x=1774551883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EdFs4L1IxX9cAoKBRBGs3SKhjp891xHC1RU8twwjVNk=;
        b=YhbmXuFpMvanRdeKE9E82m81B+AD/Yab8L0P1XRd4ZD3oNaP7tx/eedmeJhFBfk2T6
         3rnrYmA4ozr3HU1NKBC9W7CBaEB6M13y2mA/zMXH10dh2CAKiMLoTmk7sT4WEfB4r8l8
         zxGgZOorDzA4dYjrzsU1yT45EXiPUcbjMtSUT+Y4m1fyH7JWAsIExDlGe2tkBGdWLMgE
         HifBOXFfohiVsEJQ3QNhqJLw0j3uDfvYqWutQubF5SeuGqtIqxqnZvCpzMHOmaZlXuXR
         Q8tiphIlFrB5+gbPZzhHQF5B+rroVASLL/L21JoDLFww1b9bm90EX/qHo8qnNbqTVGRf
         OSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773947083; x=1774551883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdFs4L1IxX9cAoKBRBGs3SKhjp891xHC1RU8twwjVNk=;
        b=QRPSDbAuoUzAOUkFfqmggT6V5Nl+js0uivwIqBczPZ5IbgOf9wVD0zwhQfsThcn6Nb
         ZHnVy6XtuiPG60R8ILRDNoH/1MCw9E4HgrQYteVFxW02HPB2la2rWCWo6HXxN9a/5olY
         30TNuCSO33aP+2qp+cwCWzcflYhk9EHenaxdAL6DQEAcHshdPxojc0qoU6bdvprWBbpP
         T4pG2f3aRidyff93yHDwRAB6ICm/grgF+snmIaC4+KkAgvohJGHRp2fTX4RWLpMNVuiT
         jfWQSPvMZfpSBaxjsgnLiPVqQPQFXZKWnigrslsbfuQA22eqQFV3JSydzGRF19uZrNDr
         WfNg==
X-Forwarded-Encrypted: i=1; AJvYcCUqibg/2rUrmFwkNwSaz7KeK18DNi32sBJvt8ovqRTidN1V7outhFbxGqcadpzNg43Op2VRkkJs5tK6vNeBd5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF1Erld3kU0i1NmrFA57T7ngT7xb5niAYCybre563RMCAapkHM
	QzIg/98nkviaM6H2AgVBgPc6w5dyy2vQAzDFRnqSy8J3twZ2uA9syne7vIxwoC8qaQ==
X-Gm-Gg: ATEYQzx8YBBvtXLw3VkmbjUetH/ZX1sxOe9TSY73GmUP5gtkXfyPJ1UBbn3khyHvla2
	+HSYGrKrG386rRkgRik+k047r9lxkgUlniWctqah7Ypn0o7Jcwke7ZwuT4UHF/OJVMtJzSiplMk
	BEsajekgu/4ffKflz9d3PAhBubLRgh5TRkzquFW7luBTRnBD1gsPmtNX95aEcMPTHilY5CYglLo
	6hQsgMUlkGkTdukUCsSex09OgSYPVY9oMXgSv67E3ZS8fdCWhiJJtXFQtgQRyJdhP95uZlUmOpq
	2mHfa1ArKoMqGDeCKIi8KYt5sutySMXpNPJn2u17bEtzQo2rPczjR2ISyUOZnpbxgiHld7XorAI
	sj2cALN+3A8UW5QeJtZ+oEKx5RiYlklySZLz1JmdFA/NN+wXrZ4DLHuGbdNzms0USDxnC9fqbvG
	i6as+IIr8ET9Y2RzSYi7bDWSgZnFEvxwfqxAjc4EJeg/Tw15pMAnETNP5yom6NKg==
X-Received: by 2002:a17:902:e551:b0:2ae:6755:a258 with SMTP id d9443c01a7336-2b0826b8b9emr3557255ad.3.1773947082722;
        Thu, 19 Mar 2026 12:04:42 -0700 (PDT)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e41974asm66911255ad.7.2026.03.19.12.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:04:41 -0700 (PDT)
Date: Thu, 19 Mar 2026 19:04:37 +0000
From: David Matlack <dmatlack@google.com>
To: Rubin Du <rubind@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] selftests/vfio: Add NVIDIA Falcon driver for DMA
 testing
Message-ID: <abxIxa910ddkAiLm@google.com>
References: <20260317214239.124857-1-rubind@nvidia.com>
 <20260317214239.124857-3-rubind@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317214239.124857-3-rubind@nvidia.com>

On 2026-03-17 02:42 PM, Rubin Du wrote:
> Add a new VFIO PCI driver for NVIDIA GPUs that enables DMA testing
> via the Falcon (Fast Logic Controller) microcontrollers. This driver
> extracts and adapts the DMA test functionality from the NVIDIA
> gpu-admin-tools project and integrates it into the existing VFIO
> selftest framework.
> 
> The Falcon is a general-purpose microcontroller present on NVIDIA GPUs
> that can perform DMA operations between system memory and device memory.
> By leveraging Falcon DMA, this driver allows NVIDIA GPUs to be tested
> alongside Intel IOAT and DSA devices using the same selftest infrastructure.
> 
> Supported GPUs:
> - Kepler: K520, GTX660, K4000, K80, GT635
> - Maxwell Gen1: GTX750, GTX745
> - Maxwell Gen2: M60
> - Pascal: P100, P4, P40
> - Volta: V100
> - Turing: T4
> - Ampere: A16, A100, A10
> - Ada: L4, L40S
> - Hopper: H100
> 
> The PMU falcon on Kepler and Maxwell Gen1 GPUs uses legacy FBIF register
> offsets and requires enabling via PMC_ENABLE with the HUB bit set.
> 
> Limitations and tradeoffs:
> 
> 1. Architecture support:
>    Blackwell and newer architectures may require additional work
>    due to firmware.
> 
> 2. Synchronous DMA operations:
>    Each transfer blocks until completion because the reference
>    implementation does not expose command queuing - only one
>    DMA operation can be in flight at a time.

Asynchronous DMA will be important for testing Live Update:

  https://lore.kernel.org/kvm/20260129212510.967611-23-dmatlack@google.com/

That is why I split memcpy_start() and memcpy_wait() from the beginning.

Would it be possible to add support for it here even though it is not in
the reference implementation?

> 
> The driver is named 'nv_falcon' to reflect that it specifically controls
> the Falcon microcontroller for DMA operations, rather than exposing
> general GPU functionality.
> 
> Reference implementation:
> https://github.com/NVIDIA/gpu-admin-tools
> 
> Signed-off-by: Rubin Du <rubind@nvidia.com>

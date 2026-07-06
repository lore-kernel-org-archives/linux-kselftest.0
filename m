Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7172E8B83
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 22:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783375453; cv=none; b=eXRGOBU1wvoK76WiNT0EN+6eeIfP4rKdXacfvgAA55V2YcSu/xgoHzjzgnB1U1MwlGG+iHFq/0vY635bPOLNz51ckYL/MeC9KNTiefs1gTblvMpNbhnCldvDGrMK7W7CGSwtkSR3cHWB01aUbPG8LbTxj0fbKXjLJ5ONKN7nGWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783375453; c=relaxed/simple;
	bh=rLy/ysj5tbpERefiVlqo7Up7k2XPDa6wDyapX0dgtAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVjp/mpWVfnBd4l0LUHuHKKteVovtAKJUeSbMuw56jIX5q9GK3P+NUvcIbBH0TDO7tJaTpahi65F6XLXMNbLK+5ZqTKRyTrKJtZX1lfLLEyGefACM9o75/y3RZHb/TsYe3dEzSPEwRHpRzVBvcFx6TBIWt2Kjh6Hvs4St3FY5gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RFfpI5LL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RFfpI5LL"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc6dd436c6so18077905ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 15:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783375450; x=1783980250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ExF2e/cXpRQsXQR0TRuzWP6MSTLDs8ljOSl9uaYcPTU=;
        b=RFfpI5LL9CeFLidDrLl0FoW4hdPY0VRDS3QcnJ+clGW9WvEdLWCbXf5J92IQaigrL0
         Bp2yCFakukTmmVAeM6ZeL77QMcc1fuAoIEuR6crhbkkApmqw9D+jN7f1QHWJvW5OVEpH
         HMKrIENsTn+MC7NUTKuJDYjpGtSn++j3fihYwBAyAwtNYsWCciQQ2k35Qq/3TlLootZC
         QWk1MTX627gzw34S731LWLEO7OtwnWzZDfC4rJzuaQ4IBgCZzwQfoQjLBmdo9Fd5iEQu
         UuuCdoHxTO1Stpoqw4pKcg2hSFefko4jeIiEQyJjzXTXDAI3L21m66dCXTiOVDpnycmx
         vePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783375450; x=1783980250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExF2e/cXpRQsXQR0TRuzWP6MSTLDs8ljOSl9uaYcPTU=;
        b=gAkAPKVlE+bYyKxFla1Vhea8PX2yXs/byEacVk+ZxOTrWNo4stZg6VaRyx6Sd8aOpt
         6RfkjCSBKzIkkp01OHU1/85FD64AsSa+x30NvUm5rXA0Toq/LKqkU2WQKCFVGD8TOje0
         +Dka7YPZ4inY1kRkc7189f6vm8uszxtU+E79hu7iUgPKMypjEC+Fz+9d8N49UzLFGmL2
         Bwq1iNa8O+bR3gtzgbm6k13egtlKTUxNCw/pKpR/DpseKowY3NZGE51WVwuThlGQUKqb
         x5q1EVs714Jyjkqte06N2qrp7yJNj8mL68z0VCb6EM/aJaQZn04ufh7IwzadN7YAwL0I
         XPrQ==
X-Forwarded-Encrypted: i=1; AHgh+RprUNnhtjxL5hYvOoPwVDF85GF1L4gpXF0SyjPkuUucFtEvXsbXnH5bnpmfdxxj5VjszgAnJbXgKY3xoDQFXFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/uUsNF2JD7UdorLb8Wt3Un1acOWBaCWCtJzA+G5EkjpRyF2U
	Tlnwdnl4IG9KMDtqVoXQr2CzzfIwbO3OAjjpUwr7Js4QNHAmDh9INt97aeVMJeNdKQ==
X-Gm-Gg: AfdE7cmrm0zpGgcLBLD6vHO+kwhJoG4LVOihRcKpGbBTlDBfFEXFLNm22yKH2rjUqkO
	0HLKh4uWEqGKLMO+UJkVLHaBfCMo0mP5uFEJojFrva27dB+kdfF0Qd42N2ZsQJb2jRE+TT8A7XD
	BOfYkRZZwfF0Z29CDKVObocnEzQGVV+vAhhvPhQ48IMbmzSF4MIZt3Zm9sFZ9y0yiC2XTxxpeGy
	zpWs6j8L6E+z2zVjFfQ7Nl51F+2ZXSBDIAIpVavvou/3Uj/SoT2bLmRIH0nhypVsW+8PEJxi4fd
	JEqwCeIEPNJmA0mnAMfrY4NNtYhdjYMle4eeBzakppEqeaNgFWIxAq2v/TnAKL/EE6EFgwKnldm
	R7l4QPfZDLUMH6o62kqE9EFCY227ZBbtBnLWvn/Gnapnvo5jvB2zxzDt5z6IdUl97skS2w1TVkd
	yOh+HQRunNhoLtvJ1SX4gZ19OOG/spQKa4yvKh3a744eaHpuU2Q10=
X-Received: by 2002:a17:903:3d0f:b0:2c9:b48c:fdde with SMTP id d9443c01a7336-2ccbf057775mr26873645ad.26.1783375449431;
        Mon, 06 Jul 2026 15:04:09 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf8c12sm1075785ad.26.2026.07.06.15.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:04:08 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:04:05 +0000
From: David Matlack <dmatlack@google.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: alex@shazbot.org, shuah@kernel.org, amastro@fb.com, rananta@google.com,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com,
	sbhat@linux.ibm.com, harshpb@linux.ibm.com
Subject: Re: [RFC PATCH 3/6] selftests/vfio: add sPAPR TCE v2 DMA window
 helpers
Message-ID: <akwmVUE6w_4mesUO@google.com>
References: <20260703032806.40946-1-nnmlinux@linux.ibm.com>
 <20260703032806.40946-4-nnmlinux@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703032806.40946-4-nnmlinux@linux.ibm.com>

On 2026-07-02 11:28 PM, Narayana Murty N wrote:
> Add helper support for sPAPR TCE v2 DMA windows in the VFIO selftest
> library.
> 
> Track the platform default DMA window separately from selftest-created
> dynamic DMA windows. The default window is discovered with
> VFIO_IOMMU_SPAPR_TCE_GET_INFO and is not removed during cleanup.
> 
> Add helpers to create and remove DDWs, return the active IOVA range, and
> register/unregister memory around DMA map/unmap operations. Window
> selection is done before IOVA allocation; the map path only validates,
> registers memory, and calls VFIO_IOMMU_MAP_DMA.
> 
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> ---
>  .../vfio/lib/include/libvfio/iommu.h          |  18 ++
>  tools/testing/selftests/vfio/lib/iommu.c      | 273 +++++++++++++++++-
>  tools/testing/selftests/vfio/lib/libvfio.c    |   2 -

Let's move all the spapr code to its own .c file under lib and only
compile it on powerpc, and a new header file so that the code in iommu.c
can call into it as needed.

Please also avoid adding ifdefs within function bodies. The generic code
in iommu.c should unconditionally call spapr routines and those routines
should be stubbed out on non-powerpc architectures.

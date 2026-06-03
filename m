Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348AA331222
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496001; cv=none; b=GzQn7/5pL2dcWZr9VlvNUp7c95VjkIlHsPOJaY6mDxXWFMpSJ7leWvC7lO2DncgAXHVpEGj8BBcN+B7avWVSBwdibmhVlJGl+0+At2AktVi1ftInYZpH8oHeKdoX2b5kjzW6YjnA7GEONGK5Rz78eC33ngeZRFmVwoftM1W2Jys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496001; c=relaxed/simple;
	bh=CRJtyzPVwZ27iPdMdn+YffG3q+hwHsP+3emZ2ABQJ2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCRDrLa/UHhjeTLbY5Z9ibpbhqHd7EgMrnqZiFaGe/4iOtvI1t8sRYu6E/tnGDPQRWuZNPtiLArtAXrhebHOGshGbyXDEncyHAJ1zucwNldKjjNiC0Pxs3NddhP7OqglQebgWMFII4SPebr3iBYhDM3X8LoyAO/ol6gSoQBOeEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s9UBvQuY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s9UBvQuY"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf2911f93cso61385ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780495999; x=1781100799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gl2/sR4bOkCw/IHgANyX/OAo2qKH6Z+1HugGtGKRHMc=;
        b=s9UBvQuYGBcu/GYN6flzhLuPFQT/RZGWPbpxYIRaRgR7PXXN62nXrYbZlUNzDTJ1xD
         0zQyf9gIsJBVL9wADHy+4U1dM2UOrg1vO1AjaNVE4EfGGHET2RoUGuonR93NsAJtLSOq
         FHwQzxOBYZ1QDIOK9drOC42CFKaek50TLMTHOzCoY2Ztb9SxcXMmABCK/Yalgi5RkYib
         GlOKncRbrMWwbqxjckanjfjjm3fpt4tOa3ltYyTNnl8r1fc+i5BgCENQPgPfFs/q2bag
         Hakv2fxui4EyDq4cIxIsT7vuk7AcTGCARTlwY22GHRZnTufBYGzKyZiWPkoX+Jy5afbM
         3vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495999; x=1781100799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gl2/sR4bOkCw/IHgANyX/OAo2qKH6Z+1HugGtGKRHMc=;
        b=Pww9f8PXQIiwyeZN0oxheEw9nYmXIyRssKc4LCNGtZT3xaufeSXaGm+CCXaERkxG62
         0KT0G3g9qNHXadrSQ5TERWA9c77tVzw0/Hm+JrU0gN8PPufY3bnydNvbcBzvKXDOmhXj
         9H3jB+auKVZWWrvhnepJ/L64/95Nr4MzMOAV2vhy3rRJyV04SXPpN+gGAki7wZ2CgPEL
         m4ibcPZva7zuJB9HOh+i5cLa7j8r+3ComlclZ/D7VDz5pqowg9MfoRRwoKcZqzfjoEpo
         1AL96IE/YgGt6vc8t3jYxJot+ioP1k0CPH3O2aRb8yBnOsxTChr7ndxfgAhliyC5uqVJ
         y+GQ==
X-Forwarded-Encrypted: i=1; AFNElJ89UKXvN0XNjswU1OxSK41PCcxOgvXntp1O3H4mlZiTGKYJmtKLARPurUS2xf3uxfzND8MsLMAgAfpaaBBkviA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeHoA4Ue0Rno2AMYQLZ29p+sfg7qmumP8M2cfIgh45O7x4BSqX
	4VzJ2Q1C2CltLXNbNa//OTzRaynMwOfMStGXAmcPaUFHrkTzMXGscgDm0OVWUYsV7w==
X-Gm-Gg: Acq92OELQdDX41pARKa275Y7xM3+dtVBeSgmZxYJGqkPSqTHizv+UVtMR22v2dRi9CM
	dNeGUTQOpv6GhMqLER4go4FOq7LqVvaDoGFKkP62zc0YrxncCedvuD3AGRRTDCoGnLq+e2sNwW9
	Ro4tyscNSRyA1wNs1Zb+G6E2EY11UqKMwGp6Oo8x2zZgpZ1vJ3EnJ08Zt9tz/EWytiBoXkFJOE0
	xIrar8D3Pso3hWevrkRZpb24vstcj4oeVaRpo9nb9p5B56Zbz8bqqThhJStmmFez7eb7YafRina
	JZbv875oPCRz7UOdqxz6iDjuSg9uECT/UPqAAXhgh13WC/Gkf5eIhiPYcxGmTl9eKUHleR0Lidv
	6MMNgYEMbMa4dwX5Hgp1A77vCP23NOjYPCa6md3WcVyixr1y9QmB4MnKHXELTaAytnZCBieLdLA
	YNRCeZZ2fsOAnQDQUwPtE951i8qizTZY4Lvn0BpG1VtykwgdiajDQvN/lNLy//urO8jZ7yZBY0W
	/hoWXSsUg==
X-Received: by 2002:a17:902:ecc3:b0:2c0:c14c:bf37 with SMTP id d9443c01a7336-2c16c13a022mr1861355ad.16.1780495998924;
        Wed, 03 Jun 2026 07:13:18 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bc5sm3061356b3a.43.2026.06.03.07.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:13:18 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:13:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, joro@8bytes.org,
	baolu.lu@linux.intel.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 3/7] iommufd: Propagate allocation failure in
 iommufd_veventq_deliver_fetch()
Message-ID: <aiA2ee3lqxFgXZLO@google.com>
References: <cover.1780343944.git.nicolinc@nvidia.com>
 <25d29feac909e36f78c145fa99ef2d4cb7a415da.1780343944.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25d29feac909e36f78c145fa99ef2d4cb7a415da.1780343944.git.nicolinc@nvidia.com>

On Mon, Jun 01, 2026 at 01:42:34PM -0700, Nicolin Chen wrote:
> When the kzalloc_obj() fails in iommufd_veventq_deliver_fetch(), it returns
> NULL, falsely advertising to userspace that the queue is empty.
> 
> Propagate the -ENOMEM properly to the caller.
> 
> Fixes: e36ba5ab808e ("iommufd: Add IOMMUFD_OBJ_VEVENTQ and IOMMUFD_CMD_VEVENTQ_ALLOC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED55E2222AC
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 01:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792114445; cv=none; b=izo2o9Wmz4XGb6lKv2Ig6ZNCYWyjmurfj9+sC7HaT06CnyWnvEnzaI0KORM/yCd4b5gGvFcrVhdg6QbJD36rin1XpRXtheenkGthF8+I0nvHG4Kd1kwfHd6ekWY0mpcsYI2WcDtTgybm5BdYQyCsgrwYFhof+2Yr0FQx54XwgP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792114445; c=relaxed/simple;
	bh=nLgPiYbSq45fhcCwaebsJ2SjYmzyaWlhxU4COKBBfmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyC4xzRvD1gxVzjv3Dx+n+FepMBLyPjRjiGE/3P3bODvnAd37M07TBVjN3Zrxex0dmp+v0703Fn9rz3Qc0vcb0FlPqQuzD6ZFGJkW7Z4p6Ocdt1454oYF+TNLOgj6DjeTPH/WcO2eMeT8iqfNYyloG/b+v9pTEgfYgBToVJ1mao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mm4xI7Ct; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mm4xI7Ct"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8623790f8so27945ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 18:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792114443; x=1792719243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdPpN9Xqdtkh9zsXDM/jJFMTNd+EOKXTasm7UxE7C4k=;
        b=mm4xI7Cts7SacjdOHVRThknM2wpHWELzCegAQbMFur4gSOOpE2t4Jvaa3g6l8KsG3Q
         g7lRp2nfVauBPr6x2YUfSZ/a295FLUnmx9MnaXvI79A7dL83BmxB8JY6YDb3nTQOGH7m
         /2DCKHgt7sR/8NF51TDIi15SJlZZT+ts67wKGapEOLt4QpuwwBuKVZJzF8nRhTT9Bs5W
         n3ZJKL6oy2xj7ljdRIPFQ8uUvQ0t7R3tAWMen4cK77Acs/CIEVVql0gN32Qu7XrNRRes
         BzIqar5FvK794JD78ZBQeIliKg/hMAlEzw4XojXY8zX2MkKNOJU1xi1bMh5rJ8Nl6tnm
         jw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792114443; x=1792719243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdPpN9Xqdtkh9zsXDM/jJFMTNd+EOKXTasm7UxE7C4k=;
        b=gBN92UeA9CvPgT0urW9N5HcG15FjdG5iFuvI2hK4OvJum+S4yzuda2wooiOK7sJFvq
         usg7XjtFfQ4QuZA99gGAQiim61MV7lR8Bza0rROT4Y3Gft4pcw4yziAH9+nwB5/bP96a
         itr2YK8r3WRPz++NYzhhuXo2zbyh65GKxey7pbxVhxQZBKIWdbZwCCMgSWYwqdNbyijy
         zLs3MWPcEDJxdGbj963iCkyIq0+Gh4B+fIAT+y9EN+sAzDHukIPpOG3LJhmNinUKTH8L
         tzdCFNiM1l5rnyRyFypnGJNiAEtSkVWz/pJQoeNNAzfb9Tq0tdga7o8zGqM1FrgjHknt
         hexA==
X-Forwarded-Encrypted: i=1; AKwUvBwJq+euaVwxq16EuKMtz/wXNP0GVaryFhZMUGlVf+6XtSDtoFY0+NXovYmm/7Tc+D95njY4Jd/enmhPfLC/0Ko=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMZ0z73CC65TFEo6LFyJArT4vne928GCpa6TbdqH8InGFDI7eF
	zGd8yHzRiisY5Vtf0oZc8rwA/3GUqxq/WJFewKOg65HrayF28TKb844lWmBdYKbGRg==
X-Gm-Gg: AYBFou3slnO6DleXLnviOc6qA0b7bzgdaFOre6Q8zDEbtw9vP10HiFtbl8p9J0ZVmiY
	Cp5/2X/zuTTFlMLDXWZE6Nk7g1pXgDmisJjfkY44p7wrPFH5qWouuKq3Om97us6ZhBkPuI3ShAV
	FpHGbyYbrLxhBu56yGbOaGXZXyq4q+5hMtR+l2hOf+VoF2QpEosa+3GAlm6tDHYqj0kTPGxT4YN
	J7xeRMFkoYsBzbLWCewXBPXmO9987nuavO7KX6aUopeCCB4kIDd5nbQfBrYRHJesG9Ph/g8+JL9
	9A6F0PmBqrHTtEhdi9SCVJss2nF5G3/wByhwIGWJfbjl48HRkDSH6cc8eDLhCTLzkmeUShS5B19
	abd7c0P7ZcR667eyKedBASxTBO/od82RzIq/Af/MfZMb3h53cZCOjW/yAldADG/qlyamNmMVagd
	qrQ2tfSTaKLP36SA3+LxicQuX8gc/wRNl6AANrzbQxhQCsU99MdEkM4I8GsxICCSrTdqmoKqvNU
	JBliMMci0GS+DBos0RazbtJn8M3XeFWfVBZQocAfUw1S9Q4ayvZG/eKcOQUoVWFcVg=
X-Received: by 2002:a17:902:ecc3:b0:2e6:1013:ad57 with SMTP id d9443c01a7336-2e9821d5bafmr1820355ad.12.1792114442559;
        Thu, 15 Oct 2026 18:34:02 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd05c9255sm407564a91.2.2026.10.15.18.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:34:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 01:33:55 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	linux-kselftest@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
	Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, Joerg Roedel <joerg.roedel@amd.com>, 
	Kevin Tian <kevin.tian@intel.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	patches@lists.linux.dev, Samarth Narang <samarth.colleges@gmail.com>
Subject: Re: [PATCH] iommupt: Do not allow PTEs to be split when dirty logging
Message-ID: <atF8QSyk2TK7wlvH@google.com>
References: <0-v1-5bb926ff73ec+576-iommufd_dirty_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0-v1-5bb926ff73ec+576-iommufd_dirty_jgg@nvidia.com>

On Thu, Oct 15, 2026 at 02:20:10PM -0300, Jason Gunthorpe wrote:
>If a single PTE cannot be stored in the current bitmap that should be a
>failure and reported back to userspace. Allowing a PTE to be split creates
>a possibility that dirty memory will be reported as clean.
>
>The gather must also cover the entire PTE that is being cleaned, not just
>the part that fits within the bitmap.
>
>Fix both issues by computing the full IOVA range of every PTE and using
>that to update the bitmap and the gather. The bitmap code now rejects
>ranges that don't fit in it, and the gather always combined ranges.
>
>The selftest quietly relied on a bug where the CONT was split, that is why
>the half page size for the mock domain saw alternating dirties. Increase
>the dirty test page size to PAGE_SIZE so it still works as intended.
>
>Cc: stable@vger.kernel.org
>Fixes: 4a00f9434891 ("iommupt: Add read_and_clear_dirty op")
>Reported-by: Samarth Narang <samarth.colleges@gmail.com>
>Closes: https://lore.kernel.org/all/20261013165814.309255
>Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>---
> drivers/iommu/generic_pt/iommu_pt.h     | 30 +++++++------------------
> tools/testing/selftests/iommu/iommufd.c | 10 ++++-----
> 2 files changed, 13 insertions(+), 27 deletions(-)
>
>This relies on other changes in the iommufd tree so I will take it
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>

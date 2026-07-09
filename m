Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C044A3B9DA8
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634933; cv=none; b=KKyaU0ZBN5ArG8UMg9UYPSCA2l7ssNt46L7F+GHMP3xrZWIT8quVmtOg78PlUwIYj5fEWZUge1euzKt7A64RnMurr4Y7V8smc4Leys7yM4nMfWbEFMgkqgNzLhDAYbbW3x6GOOaAv8ZRRdfBJmF+8rfWag9GtLO5CJiRIwVvN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634933; c=relaxed/simple;
	bh=6RBF0jp09O3guB5Q86RDVYGXWp7JXTcPagL5/X5HeO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucA83JSM47m5nKXm7VCS8egKpApjX44H7RYJQA/65E1z8XYI0zU2oXxHykWapxLsKsHFoQRUpxEX8QTD/YUYg7QWtFRyeSaIwkjqCRXfi10G+6rVjj1HEUrPtSTArMvMqBcEdYeDahV5k+Ok2EpHQDxEt7/R122qwQgzVN991VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=DWqIjK+w; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="DWqIjK+w"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso11828006d6.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 15:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783634931; x=1784239731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5hy/40qOWrDje+rO1HwX24k6GcjiBFx+d8whX1kHrQ=;
        b=DWqIjK+wQP2S9P9eDvz+eifCekOeL5ICmp8XDSO63D9iIeJ9bpo31x+iZ4b9X9mtJm
         qw91+Xp9U0JYB4q+7pZprbMLRJhqqvcuJzoeCzrkLF8T6FkhJ2sULWx04ZQWrYt+QzSQ
         IGTG2hxZjb8YFa6rBwoC2yILH/XaS1Rvd/OWfhMj5pn8cWfKAKJJA9JciEuaTEDeUGBj
         HCd/FoUkjV/qVzg52zrPYFM2b3JEkp2xBOPu15zpY9VMz2qPDG5xPaDDhcpdIX9NYxNM
         0jfW455Ec5bew/JtVTztslE2bH7jkqL7XCli0x819iGHCFfxJ5EEYcmFydhwLVUAsnbq
         3YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783634931; x=1784239731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5hy/40qOWrDje+rO1HwX24k6GcjiBFx+d8whX1kHrQ=;
        b=WcUvfTd1fzwOlkEQT6eaSo4z1GMcpasWaNgbV4tbiVs59uAVE8KkNYRKBlre4gpbBI
         qCn2YbEsomcemFt79bMImnX6FAuDdn8ScUCUp2stmrnjwS3D/y8QuIcJVhn6rd84iEnU
         BYyKNe67+F4s0pYR7/R85X+5u3yrIykOGSetBrmFkhFeOyCnwl/6iJln5CU/36/14ZVm
         Q/mcoP9dMV+JlBUSfsURABaTv9ICKPPoT44QTXQmltBHZxQu+GnI7i1qHPEQg56krTHT
         s4mQEkwbgb7fniOFkK14K2PJqHboPMG6T1t0oOBxgGLpqIER5lVmuBT0HoNc9XaQpIl+
         UFlQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKfofoLCu1LRMaw203xWQHlRIZL+C3pULKPOh2LEIULLK0ld17fABVLJ1hKAIvPr8lEPAyGxcShJb2vrrwTFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5pcHOsbWNVqm/AC4DXHwq3u1IUaZPvTViL9e4Z2X3Q9vPhZr6
	92RhEIbPH6Ga0mZobGWsaVB+SmKNNoYdzyVIh81qCwNnY13R4phb2ZoZRfkQRvm7nZA=
X-Gm-Gg: AfdE7cmoZJhrXuTtGIX65PkKF3LRoa2gjC0EZV+pzb2TqXMcsKW7Nh5bb9FQ44GvmLd
	yqjPy+0cpT6HBCDniGWEDN64Otqq+uShBioVyeOf7/x0bhXaX+GqmNUx2eVNln5dM5OT0ypbOoX
	cIraVxjk1QxMLzCgiwCX+89b+iSyRC3kDjlX1UCYkFVtBkqcpL2HbmqG62N1nG9ZTH4qFtWYagZ
	J+uk6rogUNJljc85AlvqmR42soC0ndUIk3dEdObl1iAiBbsrIlE7ETUC9+7FSb18ylKcJiQnOAm
	F5j/ZFpxCYr59Mq3ACtFrKg5FCNDXLEp4VumkK67+InHcwssULtnDbRA2LVyQxuFmUnjDl3+ZrZ
	L9ekGyI+vEzfJMimf7jdvskSn1vt4hXaiFM+kVGv3l/NCMBLGUMhK0lG0RZMerw3PDRT/Yoz4hE
	cd9MMqv6Hb8FOCUqdLg6E2BkXn0QfdtApoAVhlGLUwH/KfbnArjZBRPAyQG/dxZk4/rJAF
X-Received: by 2002:a05:6214:1306:b0:8ef:1840:2bd8 with SMTP id 6a1803df08f44-9024204ca5cmr14984856d6.33.1783634930620;
        Thu, 09 Jul 2026 15:08:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87cacb8sm26797256d6.49.2026.07.09.15.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 15:08:49 -0700 (PDT)
Date: Thu, 9 Jul 2026 18:08:45 -0400
From: Gregory Price <gourry@gourry.net>
To: "Dan Williams (nvidia)" <djbw@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 07/10] dax: plumb hotplug online_type through dax
Message-ID: <alAb7Q_Ku5dVRKZ7@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-8-gourry@gourry.net>
 <6a5016bf71df4_3b7ee5100b3@djbw-dev.notmuch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a5016bf71df4_3b7ee5100b3@djbw-dev.notmuch>

On Thu, Jul 09, 2026 at 02:46:39PM -0700, Dan Williams (nvidia) wrote:
> Gregory Price wrote:
> > There is no way for drivers leveraging dax_kmem to plumb through a
> > preferred auto-online policy - the system default policy is forced.
> > 
> > Add 'enum mmop' field to DAX device creation path to allow drivers
> > to specify an auto-online policy when using the kmem driver.
> > 
> > Capturing the system default would otherwise break the ABI, because
> > the system default can change - but we would be statically assigning
> > the value at device creation time.
> > 
> > To resolve this we add DAX_ONLINE_DEFAULT, which defaults devices to
> > the current behavior, while providing a clean way to override it.
> > 
> > No behavioural change for existing callers (still the system default).
> 
> So I know you have some future usage for this ability, but it is not
> present in this set. The only piece that *is* used is that the
> online-type from the new sysfs interface gets plumbed through to
> __add_memory_driver_managed().
> 

Correct.

I didn't want to cross three subsystems in one go, I do intend to follow
this up with at least a CXL build option to override the global hotplug
policy by plumbing it through to the existing cxl auto-probe process.

Some of the accelerator stuff is still a bit up in the air but the base
driver can still benefit from this as well.

> Are these touches:
> 
> >  drivers/dax/cxl.c         |  1 +
> >  drivers/dax/hmem/hmem.c   |  1 +
> >  drivers/dax/pmem.c        |  1 +
> 
> ...premature until the first user arrives that with the background story
> about how it knows to set the policy?
>

This was more a matter of having the DEFAULT set consistently across
the dax driver variant probe() functions to make the behavior explicit.
I didn't want an un-set value bug to creep in here somehow.

Happy to drop them if you think that's unneeded.

> If DAX_ONLINE_DEFAULT is a sentinel for "default" should
> DAX_KMEM_UNPLUGGED be a different sentinel than (-1)?
> 

They don't actually run into each other.  DAX_ONLINE_DEFAULT is
overwritten at probe time with the system default policy, so
`dax/state` can never perceive it (even if the values are the same).

But this is visually confusing i suppose, so I'll just swap it for -2.

> Feel free to add:
> 
> Reviewed-by: Dan Williams <djbw@kernel.org>
> 
> ...to this and the previous patches when that is fixed up.

Thank you!

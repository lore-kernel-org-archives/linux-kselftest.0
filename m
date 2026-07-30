Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EFE3A0B24
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 04:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387510; cv=none; b=Wy6NjNoCklWBuXPXgw5YdJljpaN9r61naa2GFedFouqPrkDf7dIob9nqksSZOHrp1X9fDaH1oFaluLDES7u/SXC8BACTu7R1+ral6KTiNZrbuBJ3jmTc/MBgoctSyZ9s/6leSm4s2CtNI8ye9PEbMM3jZV8qynVIoQeQ5kw6t4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387510; c=relaxed/simple;
	bh=6EKgm8nuEG6R+AQ20jjnZXhzmrZkg1EifUJZW9092GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVudnNbdxsD+q53boi4MM3PWsrQCTxjnOoD+QkZmvLskggbfgq+T4Vb7f01fgHcv2hjJOymv57SXxHl0YYXp3D+Y2NdrYulFrW7+/XFeHSKsYRFOahbTd1b0/bXAMy1xStRa+zDQ0oGjghcYxJEr4/nAy2zr1YJD8O+ALW8R3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Zgr+uHwZ; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Zgr+uHwZ"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c4436d02cso8807311cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 21:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1785387508; x=1785992308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xIFNfpu9gmD/EDvYhBb6eSwchsbOBYYW3f9ffk0DLHE=;
        b=Zgr+uHwZx+4ITvHiYBh9Qa8KDJP6qDAapn3BuVDzwPzLza0c/r4b0c/lF9NC++oCVX
         ag1bkpzDt4VsgWbF/T0ZDf2YBbAZlvuKuoAzqZ6fRXk+GqLtj0Jx9fql6DxqiyBquuo6
         FuXF1KJpjGuJBcGLUiorZQflwv738+KY/vSH49lAGpusbofZLMUh9H2vRnolNXkrsYxO
         0vKN2IRNALffXpg8lfx0tWowJ6XbB18l7cskv9GIrOAm9bAdVhGoZzVD/hAux4phZrfR
         gNx61MBFdGM2cSoFnsgFlVzcq9afpEUOYMGUzXcoOFTb2oPP3dKzGqJapQKdit/RPQCm
         m6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387508; x=1785992308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIFNfpu9gmD/EDvYhBb6eSwchsbOBYYW3f9ffk0DLHE=;
        b=acTR34NJ3MmQIuBV/9GJ0t66cF9zqi0yQP0N7lKebARwx+9oe2TY6bKE4El6nGB+rg
         Fve1t4satRdhw3dVCTGkwT/QwNBEPLO5A+UyB89Nu8Q4wdrsEnhidVj/RbSm6/rcxeXN
         T4bDhxH1DGcwTtCWtI4jhKz7M6bUfQSC+7GRdyH1PyEDjFOrLUGuzWcZyWKfLezy0PFB
         RaKvfo0m8Whd16WmfCqoFc2VSmYEHsN8nzIyPXMPgviygVqWn3cCPKfuhg5nMlsrqXxA
         aq5/vCiNgN2cKR/JRLTbrvkbLgyF0LUocO28Se6YQBN5UpNplAP42eBs7AWNL6Gbiq12
         YeHg==
X-Forwarded-Encrypted: i=1; AHgh+RogoHMHyw8B4MFyXartUFSpj+aqQXqRO1+spN3dw8wm9XnDdEeWJYYdtL2LJfeNil/YTFT669QQ1wiwlXvM68M=@vger.kernel.org
X-Gm-Message-State: AOJu0YznGWamSbNVLLP/cG/wccowGtL6UgDoGRQMD9uou0BTlCOWEebX
	GJ0skQ/hY+6H8/XBVQzu/o55M2ilVcXjjIFmLBfME4Scfxgx4hj5MfI7IBc/cKMMXv4=
X-Gm-Gg: AR+sD10eDfedinMBZv9iXEgImHDGZjVVagpH3vTX2q8U1tYDrevhyMZp4uzKny/+FH2
	ZHmXJdKXeqOVzJA+OmBBlbxKkGQBzdAPOFT/KOahfPbiLlPn44tHyE4IthwP/ByO3di3aFfYtQ6
	gqrddZTahqCqyVH8qS/ud7EY+UZAYRYJBSwiKj+s24shNLFubt1eZKqfAVYHo0yQqpJsvWUgkfK
	t3mDleOniq7SjDWsO9ATlFwPTgHBbUNnMzVyuGHuWLqFoDb1k+bbCiggrAlslxtwEWLAGb78c8u
	mlLxBBdxv6NbWv4P9IdbXTfhiQrf6qQZTVv5AaOz+8vVThB+d1d/1fZc35Nykc+34DmR2nCwFRd
	0r3wCobgRAgqCDzBb48CTDJYCGh9SOwUAiCRGzH0zHJlClsj4mGhmSUzJmGAzGq97O52crNIhwI
	0Bbng1M9Z9h41qJutGkw9JRUAPDdpONnR1YBC+rX2RZwznWu2JhXJZ9hKmgi+FSeEBrPwTY5O8N
	AbvQZxIPIYS4QcVUJ3326DfDASiOgdGZ2pP3jHPrM/R
X-Received: by 2002:ac8:59cf:0:b0:519:51b1:e764 with SMTP id d75a77b69052e-52b38662c5bmr13461711cf.47.1785387507988;
        Wed, 29 Jul 2026 21:58:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e733a27esm338204685a.34.2026.07.29.21.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 21:58:26 -0700 (PDT)
Date: Thu, 30 Jul 2026 00:58:22 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Kees Cook <kees@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Usama Arif <usama.arif@linux.dev>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 03/15] mm: abstract vma_address() and introduce
 vma_anon_address()
Message-ID: <amrV0Y7ZUtihiB2B@gourry-fedora-PF4VCD3F>
References: <20260729-b4-scalable-cow-virt-pgoff-v3-0-e8ecfefea812@kernel.org>
 <20260729-b4-scalable-cow-virt-pgoff-v3-3-e8ecfefea812@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-b4-scalable-cow-virt-pgoff-v3-3-e8ecfefea812@kernel.org>

On Wed, Jul 29, 2026 at 05:48:38PM +0100, Lorenzo Stoakes (ARM) wrote:
> 
> This will be necessary for determining the address of a folio's index
> within a VMA when the folio belongs to a MAP_PRIVATE file-backed VMA but
> has been CoW'd, and thus is anonymous, once the anonymous VMA page offset
> field is used for the reverse mapping.
> 

This is a doozy of a sentence... 

... determines the address of a folio's index within a VMA when
  - the folio belongs to a MAP_PRIVATE file-backed VMA, but
  - <The VMA> has been cow'd
  - thus <The CoW'd VMA> is anonymous (as well)
  - The original VMA may or may not also be marked anonymous?
    (just clarifying, could be original mapper or a COW that COWs)

Ow, my brain.  One question below

> +static inline unsigned long vma_address(const struct vm_area_struct *vma,
> +		pgoff_t pgoff, unsigned long nr_pages)
> +{
> +	return __vma_address(vma, pgoff, vma_start_pgoff(vma), nr_pages);
> +}
> +
... snip ...
> +static inline unsigned long vma_anon_address(const struct vm_area_struct *vma,
> +		pgoff_t pgoff_anon, unsigned long nr_pages)
> +{
> +	VM_WARN_ON_ONCE(!vma_is_anonymous(vma) && vma_test(vma, VMA_SHARED_BIT));
> +
> +	return __vma_address(vma, pgoff_anon, vma_start_anon_pgoff(vma), nr_pages);
> +}
> +

Why make the caller have to know anon vs not-anon if you can determine
from the vma bits which vma_start_pgoff variant to use?

(I suppose this is probably the entire point of the series, just trying
to get some clarity on the increased API surface).

~Gregory

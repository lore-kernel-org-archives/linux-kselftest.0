Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E317530B517
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 17:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617325; cv=none; b=nLH+1T1hrbS7h+fuogZFOj7Cza4oPKA1cUAEvzEbbqnLKTP0wHm1qh+vCWHfpsnzHVuH8zggmO8nnkGrjJsvsmCAMzA9mZaDqdvqH5Edbb6EdLtvZvR0xoXenO7W6204hPY28q+O+S4OGZ/LipfrcSkYcHpBPOPcPecwTbtm3Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617325; c=relaxed/simple;
	bh=SzROYG8BwD/EB/+MUjQ4u1vhoaHs3/zZwllWfULF+qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GU6UXce7BIR8O+P2lnuH1ru6I9Hpf/98mhtFPtXBIWOH+8njDKOCMzhmRMIJEgDF7lTRgTgaCnkQH7b2DmQDoVtCE7h8h+cUmwNr2JXGHYlEVCAiWaKLMyltkWWXNscr4zhR0066hr2jYyDVRx0RiIFmuRdggccK9wL0WZ4LtKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gk0zhMxP; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gk0zhMxP"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ea70ca4fc8so706086d6.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 10:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783617323; x=1784222123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46UkRwT/i/djJx+KopbYZyKUrVPhRVpwIJdu7TzJpII=;
        b=gk0zhMxPCwdMeia9k1VETsBkdLdlSUiHgtr/lxI34cIdfLJu788hSwNC4UXQj5RHLF
         mex7yejvsPB2SSYb0a4ATL4mvLDHXVUcofAXP/G3aV+/e0HzaKcNf7cLVkkR85oNiD9m
         LoDWnj2LMAt7utzVlJ+XOrCTJtE7qaFqyJFxZygEzxhwSHJrCxDozHyHA1XvlQH+Jrbc
         imd7n4XXsQhloWf3R6EbXswShRm0e35oZVkp68wjNPOA5N6uqxNHp9O3nOq0N97Y+El4
         7JS46cJLFNDyaPU2IWeXp0FUfg5eqh6HlWZMjjHIIOI/dAnwK60yX0GXfS4seLtNgcRL
         L6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783617323; x=1784222123;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46UkRwT/i/djJx+KopbYZyKUrVPhRVpwIJdu7TzJpII=;
        b=qX9BZSicq54uQCIfmPZDREAUMv6rlViuPKCGf2h9m57mVzqiGAikN5LGauvNtO3aAi
         Uda/nNN2rt3hyEg5JfTQYFhd+zfXRz3k/cjSosBuKnbEo4E3M2cW8R9VJkv9gf1wVwxt
         iG/GxtS5inBaz3z6sIIL/ZCPmLkS3Ab7qoauQnp3PL68ZyhyJ4oWINmk6jkxBIXmpG3m
         9p3wMJJtCbbxW5RjxQc5vPTK6YbW4EwCoN/SVOww+1nfRHLWhLc3cYFl91Khxg45iXTg
         d5ZcT9kPnF+RbzAQzjCqrY1n9R3f1aE/P3VTg/na5rum1sVSfsxKzGFW8+VhwsG+Xc8+
         Vi2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrq7/+c9qhG9OfvVFoDs5680TkOj7bZrsVksglYh/Vh0S3ZAwZHQuSZc95fXqO1OWhaHLzZWZYFq601TBQ7yXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMaXUAhfqUTWNWcMGgJxUWXgcdDktiVjaBKEuVzvye9RINAzMl
	8Vjv+XRlrN4Vd4Icg/6Fz9hmp7ReGsF+RvE/72bbFBlGz9nLb0enG7BXybE0hwGKXLI=
X-Gm-Gg: AfdE7cld+EkQvVRAIfqIUsqgz8AO7ip3y3xVza2R6YjNfMPXuLoy9FMHIt39PB3Mvxh
	S9YzVJPajTx3USOl649c0HV/1k2/5D+FLKKNp8EYYPByZigSVoOS05CrKOyNS1C+P8MAd0CC0pj
	BihPZh/HNia+xD5lUNMLX5lnsN6rG9nvi6Jv34tJbsiNc9pxT3TvqxQcBu35G4MnmjdBe2PKM2e
	jaRQgAQA80hfSMZiUYmAO8VwcBLuoHdKBQkZEVBqDRDJ6hn8c0uzL2evhWzOW+AkmMcc31tuXef
	OiC2FPRI5jZfCMVI4m8je79kG7am5IrklMjdPA7912NqBFiTGUFqdkjCB4rPZRvgnFs/k8ktTo0
	ajDFZjTxlm7j4jxhId7clu4hiRqFMNfIqnmeYkrFgTFajhCzH6kl6mkKjNA51cupuD/6wgunqa6
	vFTIcI5J3tO7Qu6EMYOXuEiflG8HwOCqJOBn0XuOsAJJJNQK+tiMGAGX3PDauSEyOLNf9L
X-Received: by 2002:a05:6214:6014:b0:8e9:f45f:107b with SMTP id 6a1803df08f44-90242143c3amr1641696d6.34.1783617322803;
        Thu, 09 Jul 2026 10:15:22 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d8fcsm22085656d6.25.2026.07.09.10.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:15:22 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:15:17 -0400
From: Gregory Price <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 06/10] mm/memory_hotplug: add
 offline_and_remove_memory_ranges()
Message-ID: <ak_XJWglABmKfSiU@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-7-gourry@gourry.net>
 <ak9ee95F7pJpCKMo@MWDK4CY14F>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9ee95F7pJpCKMo@MWDK4CY14F>

On Thu, Jul 09, 2026 at 04:45:51PM +0800, Richard Cheng wrote:
> On Tue, Jun 30, 2026 at 05:18:38PM +0800, Gregory Price wrote:
> > +/**
> > + * offline_and_remove_memory_ranges - offline and remove multiple memory ranges
> > + * @ranges: array of physical address ranges to offline and remove
> > + * @nr_ranges: number of entries in @ranges
> > + *
> > + * Offline and remove several memory ranges as one operation, serialized
> > + * against other hotplug operations by a single lock_device_hotplug().
> > + *
> > + * This offlines all ranges before removing any of them.  If offlining any
> > + * range fails, the entire process is reverted and nothing is removed.
> > + * This provides a fully atomic semantic for unplugging an entire device.
> > + *
> > + * Each range must be memory-block aligned in start and size.
> > + *
> > + * Return: 0 on success, negative errno otherwise.  On failure no range has
> > + * been removed.
> > + */
> 
> I think this can return 1, and it shouldn't.
> device_offline() returns 1 when a block is already offline, and phase 1 passes that value through as-is.
> 

I just realized try_offline_memory_block() already clamps the value to 0

static int try_offline_memory_block(struct memory_block *mem, void *arg)
{
...
    rc = device_offline(&mem->dev);
...
    /* Ignore if already offline. */
    return rc < 0 ? rc : 0;
}

But this is a bit non-obvious, let me see about making this a little
bit clearer.

~Gregory

Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF3A31ED81
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018146; cv=none; b=ShfzPfIYQXX8+jIBxnEeiKYGKiCLv4C3I11biQ2reTZwZBvVr0xU9RyE6Q0Y/9bBG/aW19LExnIhD6nerlbCini4m8gf2wWgPdWxPRNBI5h2Mi2leTML0aBHtnpDEPgw0ePKdDMAWuR1+b3VBSDSEDZfyOHxHrlKGudoTe0Xyaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018146; c=relaxed/simple;
	bh=4Q3lUCN/K5ogiGNFPWtDLaQVmKDt2aFt3PTUh0S3qXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYpDxCVlMmocznlGDVDAXRInqzJIksjF6AAIYbywVrf41Ph1wW7v6a/MBDW7skavVbW7laf8JEnd53lTdlRN04GEv5JV+m/OtTumlIz3Dr4uWhKBLzrpYae8xZE16btkSlw42N7ffOLLmfTQdNlUxPgWOR1xmsHYdr+EVa/uBiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QYKlEwp1; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QYKlEwp1"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9156b74006aso410250985a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 08:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781018142; x=1781622942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01y5Yp7Lv2fsZ0TiFN6M9m/RLD3dl7/dyTYKRdYu1dc=;
        b=QYKlEwp1NAeKXFH14vu88N/Jn3kbwlP3nN9KftlyUwc0sVPeNHbrFcKvdMCfxsTZwZ
         7/utzHEww1ziDVO16OsAdJvAz6tNgEc1ODsGpNhP4TPipcWA59mg3UyV6JlsmIaSZv4u
         2YbMRZ7LzVxll6mm4gBXF24O7wvKumb25xSRVDzQCBvvEQpoifN9VjHJmJeJsapmrbQk
         GB1xfENxYm8wHIAYyLTXx5++1Ise24d1xQECru8Qzx2O1GxkDlUAMg3/r3l7DY+w/cnK
         ZLRt1jVYnLZ+KpKEneVxmUrXNgglHlFV5MLkhbs9hke5TB4lybkrgoj6Zak8biTtcxHa
         v5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018142; x=1781622942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01y5Yp7Lv2fsZ0TiFN6M9m/RLD3dl7/dyTYKRdYu1dc=;
        b=G7xr02JXa+xMhyOVJNMT3T2WRbLJqjzDosZyNT+WoQQdQECIbXxHrFGR3wRNXAzrNP
         XwkeSEIIv+1w33eg9F2y1ZrcDBQfZpKn+SeRQQsi1IySos6eEIVn7QLPbk16H3h+qhVh
         OkoGEDpvyl0ZEsQJPv0k1Nab2K4vErpHG2+E0MWkdmseSj357kO9CFldyc0YAhcRMtEs
         zZxYBdalVJJ0jm/73yGs0VGhtRnUOqRG3Xb550kAF5x/dsjEfoj7QVLAdUjVusFji70s
         VXCDHRuizBjLhkVQLXrzFuoEbgbD9HFh0Z0jHYFFX+zqjAnBYK+KM9IH/NA0kh164DYa
         nJ0w==
X-Forwarded-Encrypted: i=1; AFNElJ8AItIvjF3jnTBEDxE1oZcF1KyfAaFAHDIcJ3Jctl/hlMm+M49cxaeHZjrMTfoMt2oCWi166oGIk6K+kodr2IM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZIBV1xZzrA/izUUPMuFBozhu5E2YtAlWRru8DeNto1XW1RqWE
	YIUWjHVbm3odRbnb6BN8mEwgiYCMfHdgolEvTPyGp/VnCc3rTshRqLzLbhEki942SzM=
X-Gm-Gg: Acq92OE6VoXgqXuUXw7L8hWGWhSa3GpWl6zMBj5VHbiVFticZzE4Hl5ezk2u0TKD/MU
	15wruZMVBKhlLyR6fsOneyUxwStbtsDVLGUQe19dCr908/7uxyLP0h6HGFvovXvcz3IcdOgweV0
	JJ0m3ST6xm1DNmmW+RNDsEFSruJa/cp8Xr9lVqHmpRFLNzDPQGslAjL/jg/lmPYSZnltYWz55dZ
	R6dndUT7LKeDNMcrhX4lDdDq53uXpJJIdXpltuS3wj/Cm4rBDbrc5GptumplDXXMuxKAbWYDvKX
	k6WXtEYlUbY0emZK4I5PbmEKSpthLTpgu8DhTS14JUmO5a2ayEAXnZZPaKLhVAuSZYrX7o61iTi
	ivexsOV1ZE8F0+5NmD6M4MnxldgOF+AOs20l8AktLTJfoseMqn/jeV9c99SqoZyn9yoxtT/wRqc
	QMMIzqUBiu66U/19uu6Al8UG2eykwFS8UoRgF57a1fVcXjRucx0WQsazU+GRc+QsVntu0Bev55F
	xvDGqORSyZJFVYQoQ==
X-Received: by 2002:a05:620a:2547:b0:915:9972:cfc with SMTP id af79cd13be357-915a9c7bba3mr3335701585a.19.1781018139752;
        Tue, 09 Jun 2026 08:15:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91589ea0bcfsm2153439585a.0.2026.06.09.08.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:15:39 -0700 (PDT)
Date: Tue, 9 Jun 2026 11:15:37 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	linux-cxl@vger.kernel.org, linux-kselftest@vger.kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, osalvador@suse.de, shuah@kernel.org,
	alison.schofield@intel.com, Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com, apopple@nvidia.com
Subject: Re: [PATCH v4 5/9] mm/memory_hotplug: add multi-range hotunplug
Message-ID: <aiguGeKKfSOu8haT@gourry-fedora-PF4VCD3F>
References: <20260605211911.2160954-1-gourry@gourry.net>
 <20260605211911.2160954-6-gourry@gourry.net>
 <b62e071b-9dec-423f-9b4b-e3c34ea0a409@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b62e071b-9dec-423f-9b4b-e3c34ea0a409@kernel.org>

On Tue, Jun 09, 2026 at 12:06:38PM +0200, David Hildenbrand (Arm) wrote:
> 
> >  EXPORT_SYMBOL_GPL(offline_and_remove_memory);
> > +
> > +/**
> > + * offline_and_remove_memory_ranges - offline and remove multiple memory ranges
> > + * @ranges: array of physical address ranges to offline and remove
> > + * @nr_ranges: number of entries in @ranges
> > + *
> > + * Offline and remove several memory ranges as one operation, serialized
> > + * against other hotplug operations by a single lock_device_hotplug().
> > + *
> > + * Unlike calling offline_and_remove_memory() in a loop, this offlines *all*
> > + * ranges before removing any of them.  If offlining any range fails, the
> > + * offlining of the ranges processed so far is reverted and nothing is
> > + * removed, leaving every range online as it was before the call.  This gives
> > + * callers all-or-nothing semantics for the offline step, so a failed unplug
> > + * does not leave a device split between online and removed ranges.
> > + *
> > + * Each range must be memory-block aligned in start and size.
> > + *
> > + * Return: 0 on success, negative errno otherwise.  On failure no range has
> > + * been removed.
> > + */
> > +int offline_and_remove_memory_ranges(const struct range *ranges, int nr_ranges)
> > +{
> 
> Is there a way to just generalize the logic in offline_and_remove_memory() to
> multiple ranges, making offline_and_remove_memory() then a simple wrapper around
> the new offline_and_remove_memory_ranges(), providing only a single range?
> 

Yeah that's reasonable, I'll look at what can be done.

~Gregory

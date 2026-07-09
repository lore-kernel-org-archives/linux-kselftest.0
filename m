Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942EF32694E
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 15:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609625; cv=none; b=FRFNeM8osvWej5k+wnfLWrIaWjl4xsDHCt7s2G8SIX1syVWCRRvuicpkOwOZHwyEhPU3Sdjia1VX0s9VxwksNuMzWzqhKH56kbmt7YPdJtCL7LijIOtXsztkkpLF++rtziceK0HyTusxe7EDCfZ2gylDlncYkRbBOx7V1vU1XCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609625; c=relaxed/simple;
	bh=/grVSRUciXotV+M5DyGJv/gSDKzJoMKn2myJZvg9YgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RR2HJSmmvWnPuS2+7pBTGBzbCGls25S86N2WQyPyTeEA3b6Cu0heotlIrGJv/5HpyF3GkG8jAaofGnpxYMMsY/AZoYN5nCcRGhUtR7yRbENSADzHN9b9x5hQv+vlP5WF2tuPEFm1VXJHsOZsX9mTSb1XaD/++Va2qOX66PKCLxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KgZDfzEV; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KgZDfzEV"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c22c61795so13764251cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 08:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783609622; x=1784214422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LA4FqejTaFf1jVYUF/eNvlLLZJZ5tRpTNigHNeOPvho=;
        b=KgZDfzEVrSihwClIha5vLHr7gLsNnyeQqcYHGIdkMpi7tEj8SqpYCn0XECKw1bhxcX
         yNLWW0PW/Cd4/BjP8l8jOyjsK9N+8tKkeLG6FxKIuhJUmcOkmdmXeRV62p/NKrEHu+Iq
         K4spBhoXhSjSPGEvFM0J7Av9oNHz3OWaHpLozVega43cShCUdxyJ9C149A6Y4Vw8IuOO
         RVySdQslv7NpErUZrG9VzAUOmwrMD1lXcZpAGkrVglvRyT3OiW+6Ru93fHAU3KNjpPi4
         GiwnWhDvUCl1sNL9HDBu3nKjD6bqZqcA4JnwHWfErw1u3UI+HnFjGVrin4t+4k2qV393
         NfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609622; x=1784214422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LA4FqejTaFf1jVYUF/eNvlLLZJZ5tRpTNigHNeOPvho=;
        b=DnQw4S2bzg/B4NqXXl6zW+S0myBPzfJbSe4QFKo/zhjC9MnEAeLGYjDaqKxCfk3whY
         Sa7F8pg71VSDcsbJKc3X6g97iWsqAnKa1Pz0ibiAcKAHuJByB6JY5VHhXG/Ii5s9623r
         PKAJsazorS8EpVAsmf/soR3o2yWR1FKoSYjbY1HGDtMxChX6FHn+ICNI9rHEK+FEw1sP
         jz2DvdV80SqutGp3dJ0xiZN79PtXGnURGpaV2gz9m+U/4WiOvfT/+hGO+Vt6pvXLYxur
         jAw/ykICs1F40y7iSlIbrv77TTcUNA8Uwpdh/81j8yJfmUDGu6YlLQMCLE5GptPlwisI
         6qLA==
X-Forwarded-Encrypted: i=1; AHgh+Rrn4L7ctwPp5+7gZhVYj3rQdhorEgRKuKmwNeXyAT28YYDe57hExetMBjxs+xqbZpY+3/5J+UCC8DgC0hu9A9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3C2fyna2rEAP5lYLv82bz/tICmz1+W8iFnKa2x/8NQqRwxY2v
	K2sZzmsJtjT1mR1/J6vqY17IXky6t0ld4kPh6oP8kR/5H5ucASWUZpaa8NvR9PX5MtI=
X-Gm-Gg: AfdE7clbbeOLzF58rLCcYOAFzPpG6fCrScxSNjXEl5U4k9zRFoYowPl68GwPko+ec8P
	1AHG45E3Pg0Bwi5ZK0OA08Ftm1F7hp+KkXDfXLVNmMvRhKMHZIqbpYXyJavZYFDbGsqCIk2VH7A
	A0gVAm0rqK9DLbkxJiYgaOd2kBBqM+RMHVVnEnTDoaNHhj0x6WY5rCjVVjbz02+7drYEsURP0Bm
	XQ3hepdaQ3AmUjabREkkJkqd1gOWZzqPSzkcLtyFG/4z8eihv5suqxzPZiL6UTApa99aNHOzVGW
	3IAnI34Y58Y+nwkQasZhePxytCN2Pm/nTSSPylFooxZ6IZLjMUu/4Bza4ckpRpijlX/iYgpHVfx
	Hcc3Cv70TasLNRKkZ6TUsUCkDzgD/JaDYHPQ5SX5uiA0V7FkknzvCcjgHNougVUBm5DtqDC6+uB
	e/xjTOVSw9dg35hJ+2v3Jje+YNVSG+lHgp0FECEhjGa8HhxBnxiC+qVazYXglt5jl8uYyTwK+m0
	mYEnr4=
X-Received: by 2002:a05:622a:1791:b0:51c:7b12:5fee with SMTP id d75a77b69052e-51c8b40f651mr77711651cf.74.1783609622533;
        Thu, 09 Jul 2026 08:07:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c42038c4bsm160321251cf.31.2026.07.09.08.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:07:02 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:06:57 -0400
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
Message-ID: <ak-5EXwL56O3G_J_@gourry-fedora-PF4VCD3F>
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
> Easy to hit with patch 0, offline one memory block via memoryN/state, then write
> "unplugged" to daxX.Y/state. The store returns 1, userspace treats it as a partial write of 1 byte,
> and retries the write with the rest of the string.
> 
> Maybe
> """
> if (rc > 0)
>     rc = -EBUSY;
> """

Oh weird, I thought I'd solved this problem at some point.  I must have
botched a rebase or something.  Good catch.

I'd originaly had some tests that race memoryN/state and dax/state, but
I dropped them because it caused long testing cycles (mostly because i
was testing force unplugging).  Maybe I'll re-introduce some of these
partial tests and just avoid the destructive ones.

~Gregory

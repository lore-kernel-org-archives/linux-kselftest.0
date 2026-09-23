Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A8856328B
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 17:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183219; cv=none; b=QPsoZykC+5mMsDAxxsEUPjvp9immnCrSCtMT5YqRhYiw+yZgxDX27R3MvQHfto+S8FTuhIFKc97s4gZrnC5el/93Ifo2wcClPThKAH0DqP+9IbAHYlgPZfhSVI5UIdNrc+e/LBVnSXsm1BmImTaxXcw+NDnrrvuuOHgFl7sWQkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183219; c=relaxed/simple;
	bh=LiJ4g9qpoghVVXRiEy8va6iNjTqxUY5nd8Q1xYAsk8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMvDLraYnUfSD47jiN3rfY37c1lHnfMUM2EWfItKMIyF/rv8cu0DjAeZ/yh2KRtOs3EM7rsP7iPywUE5w4IXfxWqDxtWvv+DebDCX8/zsX2hgJGUghiwNYZ843S5ij5H33T4j4CjU7HOqZsKERlkqAkhPm/vukFSRkfofews6jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LQRBDuEJ; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LQRBDuEJ"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20a33so1254597d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 10:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790183207; x=1790788007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/Q15LjQU6IGrJSXLhgsnwxABxyY9NVXcvoSHf7b9NM=;
        b=LQRBDuEJ3KI9cDxBVDkeGj+C6778FtYCypgLCL6/DwCTp0WUEZpxrT/eGXm+P9CuPZ
         oEDJUq7Vudgeur5fvwxfPi881yu4TQz4jCPpNTtCUZN87c8FoQSagkG7cKnU035mW0Wx
         jyQFma1JhDZH0LHq6kJ/6yRJmlIl/6FQ4IVnwQ3tqGwN7CCbIrGKUUG0CcDFDJ7DC1R7
         vqvOR2NOVsSle2IXWbakqrI4vWpn8PM3KGV1ZeTj8g1Pcot4NlgDd043Yt3I2YyhMlG9
         HNVjkvWge2xiYgfIf/y3XD+Zgy6hUDvvohzuRAUcQHpNNvXh5pBmStUMawKRl6RtjV37
         GNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183207; x=1790788007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/Q15LjQU6IGrJSXLhgsnwxABxyY9NVXcvoSHf7b9NM=;
        b=uguvNpCMjrv2HoFFhOR1irWAO9ME0IcKon+/c2uaeJ6Da5LIzjl9wHkaBPVPg7Fa77
         pwgwq9nYVfk/uMCgV00gg4raoJH3EhGEUvx3mObR7kuxXHcryj7v1VwWpnP6pni2Rs6H
         YRT6QAGv2Is4lRGIpT0ypxmy6nmnWOcZ/dKw/y+X2Y/DE2O5TL/fK7vTstH2scNHXrmC
         Unzy0aPbsz3eDsLluvhyrDlelwJWTMltRDL9D3LGXNackLM4xectUuKRSUA3WCn7LIF0
         Hdw8oJb08CsIx5BNHod7Lr7FKkqk+tEGHjf/YyA1xj4a/kldz9ya9qI9AnyawxibwswI
         Gnjg==
X-Forwarded-Encrypted: i=1; AKwUvBzGlhj5DDPdVKgPpaPAdN33bY38/cc65PqPfTS1thDA9369txJYDg6RqGflfeEgmvUau//RrwegnAf/pCECpqE=@vger.kernel.org
X-Gm-Message-State: AFuF++mf7EwDHUzrLZriDAlpd4S0/zQVHjuf7kGNtc20zDLWF/1fGt00
	zzrez/jvl83P9qUQ7/G8dvtu0HKG+ZLsK1R1iHOgRYftnizkYDnl6qXxJDO8sjn6flo=
X-Gm-Gg: AYBFou0UiuAYbbdGPQ7LfoqYqt63VLp2Sj4VyFgAo7oOtqtFZG74FLZ3KRdNahj3ZkM
	uCZy4DcDRqafn4+fVAsg7Xq3Q6g5EknTzVtL4ecxVDk0sFfNCLY4gzgFJN96fKqzXWvO4rL9TG9
	3VY8WJtjHlP98J2NlL6Wl/30VRH3sNEI0WtaCHnkrRWokbhUTXjBkOWxo0PYC47t/Uw/419xDB4
	+QzRA5QKnR/9EKu0edSqlJv58WZajNspAKB9DcQsJ4il9b98NqwpmbC8Kg/x0a82LglAtbgMYdv
	ABWadCYxDSR7GixKNwCw9kpWZIVG1Nkl8+E+WPoF8EX7d0EK2DCO6CEIAIhG+mkk2XeRB2KGYtC
	GN25NtzPvVngkHfPSGiGhsqB2DJzfISl2WAXh/8NUT/+2QbTA3zT5xxPhaQc32Zm2wV0ZqAjv6Q
	+4gqkHhLvCnSrE9eN4/MqH8pv+zw5B7TrQofzXWyoelemSj/HWpl79xEE5uZy9MEkM1Qr3zHbNd
	ExGVTF82i9vp+jTWPYgNHPlPC569nb7DAECCb2a9Or+AAAwo4t6h6g=
X-Received: by 2002:a05:690e:1743:b0:672:99e0:ebec with SMTP id 956f58d0204a3-672d5956963mr1045386d50.132.1790183207298;
        Wed, 23 Sep 2026 10:06:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248cf620sm269920985a.43.2026.09.23.10.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:06:46 -0700 (PDT)
Date: Wed, 23 Sep 2026 13:06:45 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 05/10] mm/madvise: factor huge-PMD folio processing
Message-ID: <arQGK4RbYWYm4En7@gourry-fedora-PF4VCD3F>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-6-gourry@gourry.net>
 <arP4Igew3iL9qVKW@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arP4Igew3iL9qVKW@gremlin>

On Wed, Sep 23, 2026 at 05:43:59PM +0100, Lorenzo Stoakes (ARM) wrote:
> > +/* Return a locked, referenced folio only when it must be split. */
> 
> I find it really weird that when it:
> 
> a. succeeds
> b. mapped folio is missing/invalid/filtered
> 
> In both cases it returns NULL.
> 
> And it's also weirdly returning a folio in a kind of failure case, or it's
> more like a defer-to-the-rest-of-the-code case I suppose.
> 
> I wonder if the split could be done as part of the function?
> 
> Then maybe have it return bool and document that true means it's fully
> processed (invalid folio cases, success case), false means that it's been
> split and the rest of the code should continue.
> 
> Awkward one actually.

Yes this was an awkward one to futz around with.  I took a couple tries
at it and this is ultimately what fell out and passed the tests.

I think there's some tweaks that could be made here, but I err'd on the
side of "don't break shit" before I went twiddling.

It is at least easier to understand, but certainly this shows how poorly
the original code was structured.

> 
> > +static struct folio *
> > +madvise_lru_huge_pmd_locked(pmd_t *pmd, pmd_t orig_pmd,
> > +		unsigned long addr, unsigned long next, struct mm_walk *walk,
> > +		struct list_head *folio_list, bool pageout_anon_only)
> > +{
> > +	const struct madvise_walk_private *private = walk->private;
> > +	struct vm_area_struct *vma = walk->vma;
> > +	struct folio *folio;
> > +
> > +	folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
> > +	if (!folio || folio_is_zone_device(folio))
> > +		return NULL;
> > +	if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
> > +		return NULL;
> > +
> > +	if (next - addr != HPAGE_PMD_SIZE) {
> 
> NIT: Maybe could define above as:
> 
> 	const bool spans_pmd = next - addr == HPAGE_PMD_SIZE;
> 
> And then make this:
> 
> 	if (!spans_pmd)
> 

seems reasonable. ack

~Gregory

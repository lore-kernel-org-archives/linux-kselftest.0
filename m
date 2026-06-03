Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38043382F31
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495895; cv=none; b=b1J1JoGftnyGfBxEjbA4GgrpPHxD+p8vXibkeo9n9BaCim6m6zW7t+QcGT4SEFdtgWyVxaY+cuYMd7P8L5S9rPCY7+roBy4rVS8mUvMWYD5LHSUHNRP82aYt4Mxf+VHtrLP2kLC40kIDyqPkQDofMmbDXt21cFryWrMTOqVP8PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495895; c=relaxed/simple;
	bh=b/SIUriVsuGQ8+K9ks4Bx6z61f4Zp4N9nO9DkwNZvL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKRoXPphyN4r58R9SOAEMaoftZdxgk/4mWPKrn/e2E8fTwA3vaGEmKLDyVBmI34BIPAuKCaZK+tvPEcS9FLx4prG4jM2Kpi13dsrhvo9DZh8MEFyhbfWmeLn0zRxAxyQ0qVGz7G7Mow7Rw5E4TrbODpUATD8lZWp5jYUgDi4ut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Jj/gXNQz; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Jj/gXNQz"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-91587626ae1so160429385a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780495893; x=1781100693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3JBFLHHchSf6Ugt56GZlS5cZe18tTPuP1JId2xHEinc=;
        b=Jj/gXNQz9PzMyt/Qlt6Q2M3R245DJFs2mznVy5gaKaJpgI6Fzs3uffqHQTVciPDiON
         c+gXtmpnbP//2nGpOWRG1DMuK+KCG+q3QbHfdMsZZXdMbqT6KDziuumMr9bKwVcQLtYj
         nY5fZbjcBpBy4vQmg7riJpMdsd849LjZkUG+7LSsHGj50odIXBLfu3ZC2RQRsjK8NC21
         BtVbmz/mfj5A9eQvlDuUmtmfAuejT773Z40C6Sxy8s9e+jVFgBdYMiciPrJ0BWapP8c2
         1+n6edbMVArRWJMh1g1hFb824kkVkjvXDQfVU2j5TAucSqkOiDOgCkcYYZoSShEFAA9B
         OYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495893; x=1781100693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JBFLHHchSf6Ugt56GZlS5cZe18tTPuP1JId2xHEinc=;
        b=sh2UUgu94rTrCjp7SdoOmJZ+sWdIS3AFrkS8lRUfl0h3OGwsca26FmJzosywg212BO
         krYuGDNG+w7CNgVFfIUNoPhaIDWIsYwaQDRNx2GpnmQ+A57fcn78GTy/RpRun52W2G9W
         smLM5jl7fHE1rqPnDn9JQdo5yhF01proVY1SHAuK7JyOUABQ/4yDvUp5S9M+zbMyhWmo
         p1CxrluiRMFSoVZk/Rko+cm/U1kC3nMnBRTIjW0AAKe0Tbs6v8BXxx844ZBQAxOgh9Vg
         M3afSsbv/1kUd6Eh77R+KdUrcu/x4mcMEDO6nIE67YZyrmVI45UTUubMEFbj2cjjXOQD
         hk8w==
X-Forwarded-Encrypted: i=1; AFNElJ+Tl1vw2Kjc520xkpWN4aG2GeXGwLMAdrjPNyQJZh9ETuSnAt6BHZ5WsBBbIdDtTShyY3nFHiXffuhbeceq1h8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6wDYRYyFkYvPwXCwcZ7a0nNWtGzOCIjdsm6cSoc7SAq10gN2y
	0Zh1k4NaivP3IoBszoRHrd4U+Csdc91Ij05MOeLwypRNECzqqXHCSQFJkSNrH8pwlO0=
X-Gm-Gg: Acq92OFw71nX38UXO3hftfRMnpE9oCxVETwumEHYHJ87QgW+vPufODtvpwCJLghohlV
	blvTWhIzELeHwnrjZsyzjBjhsZ2U2anbWqZD/lk5daUI+/x6sUHAf2+kf3mLD1EzbIutw7V0hjL
	XtMaL2FPxkawwU2aJQYJxSeJEgifjPZsRSw74ZquMXbz3VPAtJOg0o7duR5amxYbEc+7r8zSaXN
	YJCN10dt/UtGHDZOl8zuH9YpkqwxwY6H5qdFmRbKHD5i3F0xpXVHhlQgBIxj1o3xAdopiGyCX0s
	TgsbuDwze5MVeXBxr0POflOLYH9hEV+MstNkUKGPAAW8eZJjDWhbrAPPOGHKqwHNhPa2sfI6+Ja
	Hw6XW7ELk0DeRVFuuKjp3TdscxAy9CPJ6mdvxT+7jozH1udi1pVQoZQJq7OUVPzL3G7N7TL7lcm
	Ta1jXWdVLgInZZ0ih/ahJ1gmDyfY5a5a9q76MpHuSWaglfLAWRh0INWIQqm6mxKA==
X-Received: by 2002:a05:620a:4613:b0:915:4ca3:61bd with SMTP id af79cd13be357-9158a83f992mr602997485a.59.1780495893289;
        Wed, 03 Jun 2026 07:11:33 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a402ff9sm248774285a.45.2026.06.03.07.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:11:32 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:11:31 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v6 07/13] kho: add support for linked-block serialization
Message-ID: <aiA1slnqPnC4_8XY@plex>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-8-pasha.tatashin@soleen.com>
 <178046937151.468621.13398573538792303093.b4-review@b4>
 <aiANtYRRDr5iO5QR@plex>
 <aiAzT9TvGYjITiB8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiAzT9TvGYjITiB8@kernel.org>

On 06-03 16:59, Mike Rapoport wrote:
> On Wed, Jun 03, 2026 at 12:05:04PM +0000, Pasha Tatashin wrote:
> > On 06-03 09:49, Mike Rapoport wrote:
> > > On Wed, 03 Jun 2026 03:28:58 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > > > diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
> > > > new file mode 100644
> > > > index 000000000000..8641c20b379b
> > > > --- /dev/null
> > > > +++ b/include/linux/kho/abi/block.h
> > > > @@ -0,0 +1,56 @@
> > > > [ ... skip 25 lines ... ]
> > > > +#define _LINUX_KHO_ABI_BLOCK_H
> > > > +
> > > > +#include <asm/page.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +#define KHO_BLOCK_ABI_COMPATIBLE	"kho-block-v1"
> > > 
> > > It's never used by block set and after looking at the following patches I
> > > found that it's appended to LUO compatible string.
> > > 
> > > While this works for LUO, I think it should be kho_block_set_restore()
> > > responsibility to verify the compatibility.
> > 
> > It should work for any component that relies on  kho_block. My proposal 
> > is to use this method for other common KHO data structures (e.g.,  kho 
> > vmalloc,  kho radix, future kho xarray). There is no need for them to 
> > carry the compatibility string in their metadata, as whoever uses them 
> > will include their compatibility string.
> 
> So if, say, memfd_luo uses kho vmalloc, xarray and blocks it'll have five
> compatibility strings glued together?

That is correct, but it will be in only one place: the header of the 
client's KHO subtree. Since it is dynamically sized and 8-byte aligned, 
it should be safe to include in any struct.

Pasha

>  
> > For now, reviewers will have to make sure that if the ABI header content 
> > is changed, the compatibility string is updated.
> 
> -- 
> Sincerely yours,
> Mike.

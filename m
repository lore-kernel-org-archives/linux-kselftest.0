Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEFB344DA0;
	Wed,  3 Jun 2026 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495197; cv=none; b=bfotCxqSFfhuBlUPAdbM9zvT4Es6y02c5fTMG2JJvkG0Tf+WYQbkf672uLKIpExyclsWPPH/gYSB0Etiduc9RuxUCsc2Y232CM2PnNqN0h3qTJQeoVAbNQG7SHaRwtH3Oodl11yyrfFrXjzPuvYhnD05XPk/ETus5ud6/U0B+7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495197; c=relaxed/simple;
	bh=B1+WLzpuj0CWKKgYCrl78Wy/eOtgg+hWl/7+WxVAfP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQpuEigz/tSj5K7tlRwM9ZddHcZwxUxiY/ExOLPgaHmC8MoAFXEDH7hi99jysZiZ3uuFD2hqHcSCbAUwKAJ5NiOBuGiF7llrRCLiUq1cNSpTcrCt12cO2u+/IX/zrr9oNdUl+qtT+oL29FpfkhgH1R25rE+BTucvxeFEBqQy4cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etVZk3/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etVZk3/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948C71F00893;
	Wed,  3 Jun 2026 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780495190;
	bh=AhF+jUpU1E0204EIQ63W4XnUB7T83kejus0i2mjqkkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=etVZk3/aXRNhvGcH3Bm6kbdy06t+JcMXHeruO2GnT/u6CtGXxBz8gfWLcADNEMK+W
	 TrgH1b1J0MvahPjHWsUzff9yQnoRg1zcYs4RD762G651aDk+OSt8A1CowDDE8at8R2
	 ytUnXImjFNGI1IoeZMrkD39QqUJHdMTAMWeoIJCpyABH9UHsJirRprFUWWOroEHiuM
	 lEzJwr5Hpirzmly1jAEX5EDKKn3TwLd/iP3y/wuvPqUJISIi/JVf0XiiG3di9Mmawm
	 NOlnD0DFIRpnMHBYzHIZq2SbVwtglNMvID+T04ePOW5h3np1YwRp0rEHVNzWVWoutH
	 Y2cnIDgib1x5w==
Date: Wed, 3 Jun 2026 16:59:43 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v6 07/13] kho: add support for linked-block serialization
Message-ID: <aiAzT9TvGYjITiB8@kernel.org>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-8-pasha.tatashin@soleen.com>
 <178046937151.468621.13398573538792303093.b4-review@b4>
 <aiANtYRRDr5iO5QR@plex>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiANtYRRDr5iO5QR@plex>

On Wed, Jun 03, 2026 at 12:05:04PM +0000, Pasha Tatashin wrote:
> On 06-03 09:49, Mike Rapoport wrote:
> > On Wed, 03 Jun 2026 03:28:58 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > > diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
> > > new file mode 100644
> > > index 000000000000..8641c20b379b
> > > --- /dev/null
> > > +++ b/include/linux/kho/abi/block.h
> > > @@ -0,0 +1,56 @@
> > > [ ... skip 25 lines ... ]
> > > +#define _LINUX_KHO_ABI_BLOCK_H
> > > +
> > > +#include <asm/page.h>
> > > +#include <linux/types.h>
> > > +
> > > +#define KHO_BLOCK_ABI_COMPATIBLE	"kho-block-v1"
> > 
> > It's never used by block set and after looking at the following patches I
> > found that it's appended to LUO compatible string.
> > 
> > While this works for LUO, I think it should be kho_block_set_restore()
> > responsibility to verify the compatibility.
> 
> It should work for any component that relies on  kho_block. My proposal 
> is to use this method for other common KHO data structures (e.g.,  kho 
> vmalloc,  kho radix, future kho xarray). There is no need for them to 
> carry the compatibility string in their metadata, as whoever uses them 
> will include their compatibility string.

So if, say, memfd_luo uses kho vmalloc, xarray and blocks it'll have five
compatibility strings glued together?
 
> For now, reviewers will have to make sure that if the ABI header content 
> is changed, the compatibility string is updated.

-- 
Sincerely yours,
Mike.

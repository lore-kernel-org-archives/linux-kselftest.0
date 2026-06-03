Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5779C33970F;
	Wed,  3 Jun 2026 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497261; cv=none; b=X9AS3ZpY/xDT/l9Pm/lIvALXw1vKHJ6viJK5rjIdTPf/S6o22EyGk18Wolbu69LaaZNiJhShpQ+t+QWfb1xCpgybFD0sicihshc6hwlFsMSGZklIa2SY37rc65m2AGtwZFK6503zHpxH4t3LCZbKJSyID0l4uXGzEdI3yrjOGW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497261; c=relaxed/simple;
	bh=3WikHp9gRVkuVp8+7UzM84rcmvZ3obzhbv7GBYqSIbU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Y2YToHYWldf96SVu4/v/kuUWjya99SVAOVIP3V9TmvyKCdxv9Et5/L3Asfp+Gr00rjHAPZHTDAHPEAB85zVKY0f0YGyUEsBbfqCSGYr66vxqu4qTS25YgPkvlmR6gG1J4cPoSASGpGutCVwnkc4rYGmwGR9d8rb1Pp43Fcpbp2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RncmSrbY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RncmSrbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2ED1F00893;
	Wed,  3 Jun 2026 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497260;
	bh=yu2f5FIaIpPGb9LsISKA98pvWiCaazPbEtHtZWNusVY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=RncmSrbYsIH29DH7UOSflSaLWXVrOKpLLAkTNCb1nluOnMdGip2i37TURU6W4HJeJ
	 TZmp9pFP/lbNDNr3NmDkkjJQARDS1Em4yc4OBjvD/HMqo5Kld1S1vJuw7KOZcI/GDd
	 IjXr1uUeuaJ6ivMy9Kcf1kEZLJ30C1L9MYns8jf2EuhRyGX6snzePBcWJ0eCFfN0FT
	 focV5Pz8fwOO1Xg4xet9jBisJNLqZE3MMFs794fvDkya9D/WUwSrHHZT26Bl5MLnrR
	 fi6kk90xXakTHdzzz88I1gudGHOY/XZtbx+xIuSYhxAJQiCjkJycHRHBYMAZXRurbj
	 7KVS/pipaYesw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 07/13] kho: add support for linked-block
 serialization
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kselftest@vger.kernel.org, 
 shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com, 
 kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com, 
 graf@amazon.com
In-Reply-To: <aiA1slnqPnC4_8XY@plex>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-8-pasha.tatashin@soleen.com>
 <178046937151.468621.13398573538792303093.b4-review@b4>
 <aiANtYRRDr5iO5QR@plex> <aiAzT9TvGYjITiB8@kernel.org>
 <aiA1slnqPnC4_8XY@plex>
Date: Wed, 03 Jun 2026 17:34:14 +0300
Message-Id: <178049725439.475072.11560134126837430744.b4-reply@b4>
X-Mailer: b4 0.15.2

On 2026-06-03 14:11 +0000, Pasha Tatashin wrote:
> On 06-03 16:59, Mike Rapoport wrote:
> > On Wed, Jun 03, 2026 at 12:05:04PM +0000, Pasha Tatashin wrote:
> > > On 06-03 09:49, Mike Rapoport wrote:
> > > > On Wed, 03 Jun 2026 03:28:58 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > > > > diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
> > > > > new file mode 100644
> > > > > index 000000000000..8641c20b379b
> > > > > --- /dev/null
> > > > > +++ b/include/linux/kho/abi/block.h
> > > > > @@ -0,0 +1,56 @@
> > > > > [ ... skip 25 lines ... ]
> > > > > +#define _LINUX_KHO_ABI_BLOCK_H
> > > > > +
> > > > > +#include <asm/page.h>
> > > > > +#include <linux/types.h>
> > > > > +
> > > > > +#define KHO_BLOCK_ABI_COMPATIBLE	"kho-block-v1"
> > > > 
> > > > It's never used by block set and after looking at the following patches I
> > > > found that it's appended to LUO compatible string.
> > > > 
> > > > While this works for LUO, I think it should be kho_block_set_restore()
> > > > responsibility to verify the compatibility.
> > > 
> > > It should work for any component that relies on  kho_block. My proposal 
> > > is to use this method for other common KHO data structures (e.g.,  kho 
> > > vmalloc,  kho radix, future kho xarray). There is no need for them to 
> > > carry the compatibility string in their metadata, as whoever uses them 
> > > will include their compatibility string.
> > 
> > So if, say, memfd_luo uses kho vmalloc, xarray and blocks it'll have five
> > compatibility strings glued together?
> 
> That is correct, but it will be in only one place: the header of the 
> client's KHO subtree. Since it is dynamically sized and 8-byte aligned, 
> it should be safe to include in any struct.

This is safe, you are right.
But I have more usability concerns from one side and the duplication it
causes from the other.

I can see the downside of putting the version information in the data
structure itself as it either requires a different header for the first
element or needlessly increases all the headers.

But 

#define LUO_ABI_COMPATIBLE     LUO_COMPAT_BASE "-" KHO_BLOCK_ABI_COMPATIBLE "-" KHO_VMALLOC_ABI_COMPATIBLE "-" KHO_RADIX_COMPATIBLE

is not really digestible too. And it forces KHO users to potentially
track KHO internal changes.

We still don't promise any compatibility between different kernel
versions so to avoid blocking this series on the decision what is the
best way to convey KHO data structures compatibility I suggest to bump
kho ABI version in v6.2* of the patch that adds KHO blocks and postpone
this discussion to after rc1 when we'll have plenty of time.

* sending a new version of a single file does same email traffic, but it
confuses b4 and quite possibly other tools, so I think v7 is better.

> Pasha
> 
> >  
> > > For now, reviewers will have to make sure that if the ABI header content 
> > > is changed, the compatibility string is updated.
> > 
> -- 
> > Sincerely yours,
> > Mike.
> 



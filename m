Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9CF3CF04F
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499021; cv=none; b=Eomey5kEfCu685bphftJ1nm+7cXR9G/X7YhJJxiFfPLtC9jhUb6+9LJs91Y3Jjf/lsLYvpGVuJ8l96P6n3KiPpc7AkXMKwTx/Onv8+AS+enGLy3M3KwS2aQ7CbQ8+gFLa7P5PY4v/WH9e84W0RG/uoSpr06eBT1KOuWYHm/E0S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499021; c=relaxed/simple;
	bh=aJLjATifzgiw0TOlO2S9rrai0BaEgmmVwEMl+rz5nfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/Utl8W4/0xGEysjsX4K4VGPwkBsAMRrAQkv5ZJ9/xMbwHtvNx7eqSuYi2uPTPq3WmxKnpTcNphh3qWVl6nYraFt4YTOO9I8NtXhLmpuFGVktJ97S1PFhIMgGl8onYdJADUcjN1lQv88aWgdbw15fI6qCcqH2RnbHsTq/eChEo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=cqgOTH34; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="cqgOTH34"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5174363a843so9426201cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780499018; x=1781103818; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GE3cxqAXSaCHVcc+WKXlgfot3UvMd9FsWD9Iu0pbg2Q=;
        b=cqgOTH34C+FJgNcku0jzLOHE06WOO0GzZlwzJWYwQrB3lNzQycQHXHfiRUeg96EJuj
         zu80R9bQFL5szMIu2M6mBNaYBpH2uuiQWpqazM+lJMNdWAWRcXylqfDIgv8pYxropi2H
         iRc+3WEfNnow2lkbOuMPW6GRfaiM778Q5KrvQuZaiIUOThJU7EYYW5BTobgWJeJ7JtWH
         s40eM8WjpSNEsynDnrxTy9rOcgACSokJKDxHm5vmW/Qr/Jg2a1Xh4VuO2huux8eJoVsT
         NHhD2wTOX5APj2DP/CmiOU09ZL057g+NdbquGMcFrC6IizUQHUOeUHWeiSaXy2Kx15Ji
         ZCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780499018; x=1781103818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GE3cxqAXSaCHVcc+WKXlgfot3UvMd9FsWD9Iu0pbg2Q=;
        b=MkFdtsPiQ2VWpxUIQqoaEVnxssco5AcOq1TWk+ZJHNXwTdlolDa9hHpD+TvpKfu03/
         3uJmnUuW1pBB5JNqcOpwUC5ei0JN9uDKShFEY0LYMMEX95OBLwPKRUReljaF5uAEHFOc
         joSZ0gEmwel+GeqGhIb2db3johljxj6gGrIU4egWqn+kBBewo1QBzgOoehw9dugGu9pa
         EFddcb5eQRVFP1HE2LWE69dAizTKiCbgrdhuWeJ5UofB/zaGBkbEslDFeuTYN7WgKsrx
         fEy1x4zSy8RSgwSU0K32yw6mp9DmALSbK/xszJwU9HAzrTJ+Y4U3dg8rGVq2wVyZpCr1
         wsOw==
X-Forwarded-Encrypted: i=1; AFNElJ+aGCK1Poe0NFdb0pZwTxxDrRtDLefKn3Roa3L1n3FbpY8bQxtWSKzWC7YmU5ty5jMOKIr8i7XRGVzS64SsXsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdqdAual5OdWgrGgkHvd81Lneeffk7Rpp/hMaSmTMQxuEQszEh
	/Ot+xZKiOq/S1UoJeILi/BI/wmjvKKeXHYEeSqExCDzx8iGFeNdWJkTDyVPt7lIWPoY=
X-Gm-Gg: Acq92OG8RXIe+Pvr8FIwRjO7hmlk91pHpRTu2LK/WJ5jlphTdKy+pp3ZY+PuS3APQmf
	IaroQ0S8yLGCpUgM4WSgjM2JpQ/6A0rKJvd6DAHH7R57uuoGhhhFhNBQ84EelpfXdXjBUllNlyz
	74EcPdT5yTByZwy/+0np4sxLlE9Jmq81pCEKOmSJKH4Ar6KC1oS/kbylOoSCnwcAPaF3uZvoLZA
	Mq8fn6SGM/pVgMYUm8P84pA0kN/90Ruz6X0X7eZYsELYq1Y3mH4t66o0cTKvD8LjRT1QfCHBZ9X
	+DPkRF5UpMlTCdJxQnLAKB88O2npdLq2kYWI2/3qmFmhAGKR/QALdOhjZpPl2bz2oI/q4TG6VTE
	2LdadSTr0QuIFk7NMU43rKAu7ZODqLGf3pmRj1ljHMWJtMqnPWivys50sH02qZVw088ZOQ2/dbr
	oniti/YjFW6PZoI2beNFhdwrvEmKDdSgxBRmaBlfgkQXPrxjR4ke/JjroNU6TaKw==
X-Received: by 2002:ac8:7e86:0:b0:516:82e2:7788 with SMTP id d75a77b69052e-51779701719mr41203361cf.1.1780499017835;
        Wed, 03 Jun 2026 08:03:37 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775dd2e53sm25188571cf.24.2026.06.03.08.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:03:37 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:03:36 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v6 07/13] kho: add support for linked-block serialization
Message-ID: <aiA_j7udFaO9TRBP@plex>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-8-pasha.tatashin@soleen.com>
 <178046937151.468621.13398573538792303093.b4-review@b4>
 <aiANtYRRDr5iO5QR@plex>
 <aiAzT9TvGYjITiB8@kernel.org>
 <aiA1slnqPnC4_8XY@plex>
 <178049725439.475072.11560134126837430744.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178049725439.475072.11560134126837430744.b4-reply@b4>

On 06-03 17:34, Mike Rapoport wrote:
> On 2026-06-03 14:11 +0000, Pasha Tatashin wrote:
> > On 06-03 16:59, Mike Rapoport wrote:
> > > On Wed, Jun 03, 2026 at 12:05:04PM +0000, Pasha Tatashin wrote:
> > > > On 06-03 09:49, Mike Rapoport wrote:
> > > > > On Wed, 03 Jun 2026 03:28:58 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > > > > > diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..8641c20b379b
> > > > > > --- /dev/null
> > > > > > +++ b/include/linux/kho/abi/block.h
> > > > > > @@ -0,0 +1,56 @@
> > > > > > [ ... skip 25 lines ... ]
> > > > > > +#define _LINUX_KHO_ABI_BLOCK_H
> > > > > > +
> > > > > > +#include <asm/page.h>
> > > > > > +#include <linux/types.h>
> > > > > > +
> > > > > > +#define KHO_BLOCK_ABI_COMPATIBLE	"kho-block-v1"
> > > > > 
> > > > > It's never used by block set and after looking at the following patches I
> > > > > found that it's appended to LUO compatible string.
> > > > > 
> > > > > While this works for LUO, I think it should be kho_block_set_restore()
> > > > > responsibility to verify the compatibility.
> > > > 
> > > > It should work for any component that relies on  kho_block. My proposal 
> > > > is to use this method for other common KHO data structures (e.g.,  kho 
> > > > vmalloc,  kho radix, future kho xarray). There is no need for them to 
> > > > carry the compatibility string in their metadata, as whoever uses them 
> > > > will include their compatibility string.
> > > 
> > > So if, say, memfd_luo uses kho vmalloc, xarray and blocks it'll have five
> > > compatibility strings glued together?
> > 
> > That is correct, but it will be in only one place: the header of the 
> > client's KHO subtree. Since it is dynamically sized and 8-byte aligned, 
> > it should be safe to include in any struct.
> 
> This is safe, you are right.
> But I have more usability concerns from one side and the duplication it
> causes from the other.
> 
> I can see the downside of putting the version information in the data
> structure itself as it either requires a different header for the first
> element or needlessly increases all the headers.
> 
> But 
> 
> #define LUO_ABI_COMPATIBLE     LUO_COMPAT_BASE "-" KHO_BLOCK_ABI_COMPATIBLE "-" KHO_VMALLOC_ABI_COMPATIBLE "-" KHO_RADIX_COMPATIBLE
> 
> is not really digestible too. And it forces KHO users to potentially
> track KHO internal changes.

These are compatibilities; I think they are quite digestible, both to 
write and also when the  LUO_ABI_COMPATIBLE  string is printed out for 
debugging/info purposes.

> We still don't promise any compatibility between different kernel
> versions so to avoid blocking this series on the decision what is the
> best way to convey KHO data structures compatibility I suggest to bump
> kho ABI version in v6.2* of the patch that adds KHO blocks and postpone
> this discussion to after rc1 when we'll have plenty of time.

Let's keep this patch as is for now. We will have a broader discussion 
when we convert other participants to this new scheme. If we decide not 
to pursue this approach, we will change this code to use an independent 
compatibility string. However, having this in place as a template will 
help us convert other components correctly, ensuring proper alignment 
and that correct string helpers like  strncmp / strscpy are used—which I 
have already ensured is the case in LUO.

> * sending a new version of a single file does same email traffic, but it
> confuses b4 and quite possibly other tools, so I think v7 is better.

Agreed, I also prefer re-sending the whole series...

Pasha

> > Pasha
> > 
> > >  
> > > > For now, reviewers will have to make sure that if the ABI header content 
> > > > is changed, the compatibility string is updated.
> > > 
> > -- 
> > > Sincerely yours,
> > > Mike.
> > 
> 
> 

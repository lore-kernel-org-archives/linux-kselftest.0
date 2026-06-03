Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67E6481FCB
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492889; cv=none; b=s818WbNEGg8DNj1FLTA8mZ3o8bD9J2LCFuzBLaa5Wt/6uQYb2isFRSygoXdV6oHFMrq3+0W5FMOvtGj3LfW0ZyHU9KPFiyJYr+PgJoEgN7/Qm/Dstwv+U1w1kCANv0tD3oux38dHz5jD1D+gl3FacRkNdn+RR15QtAHKKDc11dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492889; c=relaxed/simple;
	bh=AbYFedEpd0T6+t0RhCLrGsUjXQJYEa4eUNcPa+BCBzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOGc4f4wq3qFKfGC29V5lg6y10TgpFHQK1vm11WLMAwJ9u3uN+Ip0OIXb6vkhzcBOK80qvV4bCQ0ITX6v3HpTJ7lxbG24WweXZBkCHsKFIig0Z3A/llQUaY96k2UxdqrK7tw/9r0qMgbTvkaYvnJg+rgGlr5Vmpqs1mMNOoUeRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=JTogK67W; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="JTogK67W"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9154ca1aa1dso95779485a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780492887; x=1781097687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EYzLxXCyFp78st9iZvxHkpqPKyf62haaChBN9xQvBYM=;
        b=JTogK67WOYMYxiqn70yK6W/abrFldDN+UfFthmYFVg0xUdOfiHcPWwY+jP4ny5t1Zz
         lWIZsgbCf+tzCqwij1P73VuuukZpQ4/agHjULoBQhs3/laysYgEK+uHjHooV/TcX//lX
         LtkblWuJZ59fTX5+hilhGPjy4hVr66XUAj34ca58gI0xv8ULyEUHlWkuNJ11YNdaZUeA
         WMvJ8IWo8uuL0JHUSQA1KSZeL8QZkRyTU5L3TbZ6woMVBlSm3n1u7MKYOoQfiK9YSAHx
         blBf7mu6HE14CVE5sc1I6tKgoAmojYvAl+BYWY2fIj18sgokHacLEHbVUyLpgDkfQNKe
         lXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492887; x=1781097687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYzLxXCyFp78st9iZvxHkpqPKyf62haaChBN9xQvBYM=;
        b=QeNTnlfWi/HRIOlg9oh0Y1H0U0Rs9ZBvdG3PPdnNw3VDUE+haxvkG8KHdW6OLSuhJd
         QSIoLRs044v2i3XNlt7giFwKCSOaMZArcGhSjIGdXhdnWxmRGqENntRGpiezf+4mTp/2
         316vxzxmh2ot4ClrCq6WX2GPU2qW+BfiHidGFxqyJGhYi09TWGmiBSOqoEhK+jIfqKje
         gcEXqdQw1EItZ744sT+8jWIBgfkHGwdxzgKo4UIhlVn9K+m4Pb7nxTLellru4xgZZ9F7
         Na6vxv3bZMXYUPTQkB3hqqCHg1sIFEmh3e7aQJChoKN5GgTsv8M23RO+imKwWf58vIXZ
         7U1g==
X-Forwarded-Encrypted: i=1; AFNElJ9HPX5aj+GovRS2wQ17PrvOy3WQPfSkBgiIhhKtgN7ly+ehhFgH9F8nCTo0w5KGkob/hyp85jueaB85Tz8MSLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2WN2Zga62Q8q96u38YIIY4ZbdONPU71RG0YZaIRi+aXsdfAiO
	aBuOBEr9+elPRj2PWND3k2ryWSlJkERc63JVnSR0eKimNjv9eMT28UyVmerlyVRAlME=
X-Gm-Gg: Acq92OHpA/emZ3OGqWTlaYquPW272Uobl1UNIHXgFSF/kJT8ZOfGHiBIokckcN4GIHq
	B29vN2npXPQ0jXovJlkimSWJYj2KlFZj6kAm94EUMG2NDGlGGfFGN8XkUfqyVjYOXOunSZ6gsKs
	7uGJSPyLN7igasbXUZCp7sJ6gzrz5ASOr97XhjSYbnJcUYr+pdfnx94PgONDhqMUI9oMEmBuWGf
	k/Ns+l/j0FOy8oYljDwxyNIezIXxFZdvOM1hGd6CTFniMs6+HEQi/Ipy7FIy+tb54gg//b9h4H8
	Pw7VCx6fF7vWAuHcMEs1hEGpR2ZqbjN0OgyHxYRTiUfxg1PVDNOZUUOWNjcZonbQpm0QGIdikDu
	LpVyf8XfF5hK60u/jaNm4FdHSe5Y+T1atpFDZxnaKIG3idUDziSXGcWltVHbbxOG2X7FQZcsWN8
	AErko2KxwSsSsXOPNNfOURyx3Vjo3IjViDE3ElXlNAhIggJkbthaj3aSc9GerzRQ==
X-Received: by 2002:a05:620a:414a:b0:8ef:6b87:5c52 with SMTP id af79cd13be357-9158b76c157mr410625285a.38.1780492886503;
        Wed, 03 Jun 2026 06:21:26 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37cae4sm240219185a.29.2026.06.03.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:21:26 -0700 (PDT)
Date: Wed, 3 Jun 2026 13:21:24 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v6 07/13] kho: add support for linked-block serialization
Message-ID: <aiAqOaA_J4PrIoow@plex>
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

On 06-03 12:05, Pasha Tatashin wrote:
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
> 
> For now, reviewers will have to make sure that if the ABI header content 
> is changed, the compatibility string is updated.
> 
> > > diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
> > > new file mode 100644
> > > index 000000000000..4f147c308e6b
> > > --- /dev/null
> > > +++ b/kernel/liveupdate/kho_block.c
> > > @@ -0,0 +1,411 @@
> > > [ ... skip 121 lines ... ]
> > > +/**
> > > + * kho_block_set_grow - Expand the block set to accommodate the target count.
> > > + * @bs:    The block set.
> > > + * @count: The target number of valid entries to accommodate.
> > > + *
> > > + * Acts as a runtime notifier when new resources (such as files or sessions)
> > 
> > Not sure I understand what "runtime notifier" means in this context.
> 
> It came from discussion with Pratyush, but I think we are on the same 
> page what they are, and I will just remove this.
> 
> > 
> > > [ ... skip 11 lines ... ]
> > > +
> > > +	while (count > bs->nblocks * bs->count_per_block) {
> > > +		int err = kho_block_set_grow_one(bs);
> > > +
> > > +		if (err)
> > > +			return err;
> > 
> > This leaks memory if more than one block is added.
> > 
> > > [ ... skip 31 lines ... ]
> > > + * unregistered, allowing the block set to release and unallocate redundant
> > > + * preserved memory blocks. Checks if the last block in the set can be removed
> > > + * because the remaining entry count is fully accommodated by the preceding blocks.
> > > + *
> > > + * Note: It is the caller's responsibility to ensure that entries are removed
> > > + * in LIFO (last-in, first-out) order (the reverse order of their insertion).
> > 
> > I think "in LIFO order" is sufficient :)
> 
> Oh, I keep removing those :-)
> 
> > > [ ... skip 173 lines ... ]
> > > +		it->i = 0;
> > > +	}
> > > +
> > > +	entry = kho_block_entry(it, it->i++);
> > > +	it->block->ser->count = it->i;
> > > +	return entry;
> > 
> > This looks way better than the previous version :)
> > Thanks!
> 
> Thank you. I will send a new version of this patch as a reply to this 
> email to avoid cluttering the mailing list.

The patch is here:
https://lore.kernel.org/all/20260603130612.397948-1-pasha.tatashin@soleen.com/

I messed up in-reply-to field with wrong message-id.

Pasha

> 
> Pasha
> 
> > 
> > -- 
> > Sincerely yours,
> > Mike.
> > 

Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6073F13D51E
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488309; cv=none; b=u5otvfIxyTYS10KYhsPaS5tX913EbBZNda4RRXs5bhWU+kHM57hXeBcf+/jxZ1PUBrNfJ6S9ui7WEU6z7oH3NdmrCMDzt6S02Usn2JgX7bQznnvZTsMJbQRmMPEA5D2cmoNDdBs1aACvwLJ8zfOTAu53UetqZI95/YFbSq1YGVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488309; c=relaxed/simple;
	bh=OwDhAFJOHEAGx56sW7AtIsSE/hkAKo5OcDReMvQULCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzmb+C1+tQ/b60RJlTkBbgxscmvCW/PP1fRnMil9LOmwdr+gbWc3r8pQLikFf1yp4NDac1SeAveUItigpC4XQL97eTxfCPlK7DMzMRgymhetqf0dKwPGHxaOgQHfC/QurZVK3ElEy4NT6Wj9b7Kgg6YE4b1/26KOEKyFz9tgs6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=hKOpIF7d; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="hKOpIF7d"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ce65629acaso44099186d6.3
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780488306; x=1781093106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1X7rdmAsUUmk8fm1lXinqRbOJ2Rb1qcFGzfHrd7zSSw=;
        b=hKOpIF7dorP9INndDLGyuKFBdaPFKloZkTRRB0pBhfXg5RJmiLvCh9x/se1CqXJW18
         e37iAYfiHVClUE1Qql0WqJoWyb1iRb1tFPr0ng78fisDFVJ/2VF/akwMTWLjRATEmRzn
         PFFUQNdOT7BVZMOQU7g3N9tv0dh7QgF27ZZPzcSsTWF5UiVtZ2akkk8hqfKMcbuZ3IBr
         0Pc3lecr/7TcnnDm6hSGWSAwApZAOS9v0pT1FS57oEk3+3lHjErXXeBTOTnzjqBisARG
         I1BdZkqrBrLUPhHoWq5cmRRqCq2EZoOLPC2iSQVUNjW0txoFuLaQtc31ZTkAH5WFSZE+
         bLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488306; x=1781093106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1X7rdmAsUUmk8fm1lXinqRbOJ2Rb1qcFGzfHrd7zSSw=;
        b=FZipifyLiA3rEkxdDqNqeKgDCGYECSJVWob/2ywrrCY6CEyquwNQVakYJIdXvDNwVO
         tJCa4vxO/Txa/AwvrPCFw7IieCj4KglZPecCcOoYXM8uH2/FO4CTBnDTcl5vVjTvX24U
         iLIVYEC8M9TPNVKv0XiBARREpe73FJTS0rmVwckk0EzPpv/2p6/zufQJQhFQxkQyKovH
         LulgyAlvY0KCwIy4aGbJnrzsD2qGgdKeiHxIW2dgI4iIN92De6ciSeV9TC9WPPEYTqzb
         D96SgxhWhns9FkFptR+/py+5GJXBBTlNw/En6VAANXq3pmkTQRPm5oMPqeYuGVTbuHby
         CQbw==
X-Forwarded-Encrypted: i=1; AFNElJ9fJKbgSv3Wky6AAM6mn6AuEYMlifcr3cc8P0Z5xU6HW8RPHkciYV/5vqU9ZQAayHKaRpJbU7PpxkXONakWewA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRDyMeeIj598e7O9aXdyk5ChfMfEh4q2OXHJQXEfgopdT8SPWP
	9AUmU2HpaMmW57WL3WI2daWMKicNNGgjvSZ0inrqIAXw/FrXTp6fHSyo9BBoQJc4i4M=
X-Gm-Gg: Acq92OFI6z+D5MriAEkcu88ig96v+uQU3NPZEsK/77NdS3mX7wBt+0NhyQ1YzbJc2ig
	STYOJZZyWS7Mx9szBinMVSrBUwvCgX/L8JRX+X+T6nXPIIgd1BUxf/JozvC3wIbLJGO0wk7/Alj
	TQXIIBs19ZIiq4Zne85hO4u7sEgLgLFni4wFfEnklKB3iluxPh7+CcrDOElR6oKcUNmCkkV7Ysg
	bxdgQEw6Xf4GFNUTLjJc65afHYD1Uhtni2R8M3w4mzT0Yxgd1iPPVteY9TvNAIEYD5eEfqmfNFv
	sybZZTNPK7QcEaXQcB0tlOGAfY8DUQOuS7qJZ1Tl9URwztyXHRGuPvBQUhgtC4YXQ1xXyl3xGNf
	FqCDamqDM9Sm4bLmlyidZNrnI/7TkNiWJcsZsTb7I+7SkZC4bjSBOEWXylDgsvWvBG1vGqUDYnL
	Z3119vxTywDt/ck0tCrB9WfjLfsr0iYMS2D0LbJUhzm5Wna0TdcOTDQl3I17uJVw==
X-Received: by 2002:ad4:5851:0:b0:8cc:f012:f42c with SMTP id 6a1803df08f44-8cecdc09461mr34569126d6.6.1780488306396;
        Wed, 03 Jun 2026 05:05:06 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd2682f8sm18054716d6.43.2026.06.03.05.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:05:05 -0700 (PDT)
Date: Wed, 3 Jun 2026 12:05:04 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v6 07/13] kho: add support for linked-block serialization
Message-ID: <aiANtYRRDr5iO5QR@plex>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-8-pasha.tatashin@soleen.com>
 <178046937151.468621.13398573538792303093.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178046937151.468621.13398573538792303093.b4-review@b4>

On 06-03 09:49, Mike Rapoport wrote:
> On Wed, 03 Jun 2026 03:28:58 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
> > new file mode 100644
> > index 000000000000..8641c20b379b
> > --- /dev/null
> > +++ b/include/linux/kho/abi/block.h
> > @@ -0,0 +1,56 @@
> > [ ... skip 25 lines ... ]
> > +#define _LINUX_KHO_ABI_BLOCK_H
> > +
> > +#include <asm/page.h>
> > +#include <linux/types.h>
> > +
> > +#define KHO_BLOCK_ABI_COMPATIBLE	"kho-block-v1"
> 
> It's never used by block set and after looking at the following patches I
> found that it's appended to LUO compatible string.
> 
> While this works for LUO, I think it should be kho_block_set_restore()
> responsibility to verify the compatibility.

It should work for any component that relies on  kho_block. My proposal 
is to use this method for other common KHO data structures (e.g.,  kho 
vmalloc,  kho radix, future kho xarray). There is no need for them to 
carry the compatibility string in their metadata, as whoever uses them 
will include their compatibility string.

For now, reviewers will have to make sure that if the ABI header content 
is changed, the compatibility string is updated.

> > diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
> > new file mode 100644
> > index 000000000000..4f147c308e6b
> > --- /dev/null
> > +++ b/kernel/liveupdate/kho_block.c
> > @@ -0,0 +1,411 @@
> > [ ... skip 121 lines ... ]
> > +/**
> > + * kho_block_set_grow - Expand the block set to accommodate the target count.
> > + * @bs:    The block set.
> > + * @count: The target number of valid entries to accommodate.
> > + *
> > + * Acts as a runtime notifier when new resources (such as files or sessions)
> 
> Not sure I understand what "runtime notifier" means in this context.

It came from discussion with Pratyush, but I think we are on the same 
page what they are, and I will just remove this.

> 
> > [ ... skip 11 lines ... ]
> > +
> > +	while (count > bs->nblocks * bs->count_per_block) {
> > +		int err = kho_block_set_grow_one(bs);
> > +
> > +		if (err)
> > +			return err;
> 
> This leaks memory if more than one block is added.
> 
> > [ ... skip 31 lines ... ]
> > + * unregistered, allowing the block set to release and unallocate redundant
> > + * preserved memory blocks. Checks if the last block in the set can be removed
> > + * because the remaining entry count is fully accommodated by the preceding blocks.
> > + *
> > + * Note: It is the caller's responsibility to ensure that entries are removed
> > + * in LIFO (last-in, first-out) order (the reverse order of their insertion).
> 
> I think "in LIFO order" is sufficient :)

Oh, I keep removing those :-)

> > [ ... skip 173 lines ... ]
> > +		it->i = 0;
> > +	}
> > +
> > +	entry = kho_block_entry(it, it->i++);
> > +	it->block->ser->count = it->i;
> > +	return entry;
> 
> This looks way better than the previous version :)
> Thanks!

Thank you. I will send a new version of this patch as a reply to this 
email to avoid cluttering the mailing list.

Pasha

> 
> -- 
> Sincerely yours,
> Mike.
> 

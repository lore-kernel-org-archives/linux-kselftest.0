Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E811C3D75A9
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 02:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780453292; cv=none; b=CKYS+bZcP7rv1aKZVv46Z11UUXWmOb/ykDqtgZZs01w5E33exA6jyUG6Wg5MWd6kbC1Gt3l6cTJFKPu2gR/qegVIauCFcHbeCHGjOSc/IOOB9AQg5/lnV+rilwUV37byG3wTTPhTK17pKC+2+bCF8FiLEzYD1KWXOzeNYf0W8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780453292; c=relaxed/simple;
	bh=B6UiAWELcOybS6WN+RYhVLn+8R0MHHzWvv7kTDPBaV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2n50uVdlOlNqnKxbZFtgdoXaH1Jm3c4M2AZfxiqiTINTze3bVGnQpOT5PdrnyWKrdbQm0u61SgSIt5pA1fHMIYB1hn/KSDcQ71WqUPEHp+zAymo38M9FckZcM74f6X6qIFV1aX9XbiJihpJUDWRlxVppjfv/KFhEuFyv+Lvn9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PgwKiS59; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PgwKiS59"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5174a3d9598so31781511cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 19:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780453290; x=1781058090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9MJOr97mrATixEW5kehH0DvlyrDDJP/7LhB74lpVfHs=;
        b=PgwKiS597GCKPaZv1rbT0kLAVAtEeLvpTCDO4Fe/rEHV3Bu4nx5cSjnVWaoOx0moAN
         HESuTtcrgwTa3UEziGXZoo42J9GEXnlPu90nDjbx5ces5v/Truabf170CqTYrEkeiEVu
         U/PH1IP4dMgyM3BQ+0jQkj1GeuuW5LrgeOEns5vo8pSlpgRNzjhzusU2Jq1Fzk8v52qj
         X1Zmxr0oJUhr3zyVdijSKg571NTOGn/h+9+VJnBzzhiZ9p4suKmtgRCB5xjoK0bsTQ+x
         Nvyj1K38YF2DZdT/zyPWuZd2WlNEJoW/KLsbaIPZjwaPh3cDm/v4ynrPsooZZVhIrSuT
         l1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780453290; x=1781058090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MJOr97mrATixEW5kehH0DvlyrDDJP/7LhB74lpVfHs=;
        b=O5o/IpIRaPkZZv5TMBXQa21NFFTOi9q+9BS7MFmIiXMG9MqC/WkIAqbFMMttXqSKvW
         b19jxvTLl9S7YnF7EmnkFwJEniQpyTPAybUkO12QH696tKSqw9phW/3iywZZpZGIuo2c
         X1YnbUiRd+c4Bw5SqSBYFIY6QxfVmbRb/1Y70xQlzTLxlZ1LzYRGmdsZ/cCppFv7N6Gs
         qkCjhWzzFCoGDHyfrstou8FsTLmGbqCPzv5RvRnAeIU0PX1EC9/3ABv2Yz2ExdPWXgf1
         ftZQ3OggZjwabdP7P3K5PLch8uW8jvjnRUl4iQG2VDajSywnACx4fuL5q/1l7/1Dm9Cl
         wApA==
X-Forwarded-Encrypted: i=1; AFNElJ+hyVpFLftsTbDtFrUA03323MlRTS2CO1MajBTiqtrI8hAGMZwL771bugQgL6ewlmIvDJiMT+DPjMFIugGC3xk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Opy/8i5VgWEosDClyv/V05u0Xg+gEyW0PU+Q6T1Uhi6HtcgI
	2CqaWF4f1DTSzVWCWg3jZqBr0Fq2BiFp02MUqRMYiXGKjREbRrCdGd7b1yiqlNkNK/Y=
X-Gm-Gg: Acq92OHBmrmHz0mmaZ/4SKh4Kkvu40UVxQip4Ldg4g8zyIUUwRukPUbWXMYE5/KOxm9
	4wp5TS2gz09Jc48wOLiHUquAVD4oZuNFNZCAzIHe7owN5nh2OQlxd1FC2mG+ykUJj11Z3ckRYu0
	Faxn7YRTUC6hUMGZCq7zVyUMNOD9cZEgGXuI47AQ7A/QMAkU4Qcrs6mgbYViwrVeZShKjdBj47N
	MWka0BfcyQKQmCGgacOh+Yl/f8r4eza4qK/yZKB/Dv6dd0mPL4NRE/BWPGFAWinQ3Yzop0kOWZ0
	GSvPLRtkKSbOgTw91cB3FKDgoshzlfic4dcg4DPSXBFZuR+diM91QfbjbTifofqW3OVXUn0ABZe
	CRewXzkuVh6CvxbwomCPKK0DnuO6DUzh4sOusEOQ5XYQCHMF1oNjV7UrB8ULtLrwLRSdsFQpyiE
	y8BeioHlsLFQmJZkZln4GbZ994r9v+s2f03uZ23kgDzwD9+St18zMFgCQkh4A7TQ==
X-Received: by 2002:a05:622a:306:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-517785adec6mr26502311cf.11.1780453289820;
        Tue, 02 Jun 2026 19:21:29 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd06d600sm8167806d6.35.2026.06.02.19.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:21:29 -0700 (PDT)
Date: Wed, 3 Jun 2026 02:21:28 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 07/13] kho: add support for linked-block serialization
Message-ID: <ah75uAV8uPtS0XNj@plex>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-8-pasha.tatashin@soleen.com>
 <178038801491.119771.18384706761138506132.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178038801491.119771.18384706761138506132.b4-review@b4>

On 06-02 11:13, Mike Rapoport wrote:
> On Sat, 30 May 2026 22:19:32 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > diff --git a/include/linux/kho_block.h b/include/linux/kho_block.h
> > new file mode 100644
> > index 000000000000..5e6b87b1befa
> > --- /dev/null
> > +++ b/include/linux/kho_block.h
> > @@ -0,0 +1,79 @@
> > [ ... skip 19 lines ... ]
> > +	struct list_head list;
> > +	struct kho_block_header_ser *ser;
> > +};
> > +
> > +/**
> > + * struct kho_block_set - A set of blocks that belong to the same object.
> 
> "same object" sounds off to me. The blocks belong to the same module?
> user?
> 
> Thoughts?

user and module are not descriptive, as the same client/user/module can 
use multiple kho_block_set for different purposes. I suggest:

"struct kho_block_set - A set of blocks containing serialized entries of 
the same type."

> 
> > + * @blocks:          The list of serialization blocks (struct kho_block).
> > + * @nblocks:         The number of allocated serialization blocks.
> > + * @head_pa:         Physical address of the first block header.
> > + * @entry_size:      The size of each entry in the blocks.
> 
> I think it's "... entry in a block"

It is 'in the blocks' (or 'across the blocks') because a single  
block_set  can contain multiple blocks, and they all share this same 
uniform entry size.

> 
> > [ ... skip 42 lines ... ]
> > +
> > +void kho_block_it_init(struct kho_block_it *it, struct kho_block_set *bs);
> > +void *kho_block_it_next(struct kho_block_it *it);
> > +void *kho_block_it_read(struct kho_block_it *it);
> > +void *kho_block_it_prev(struct kho_block_it *it);
> > +void kho_block_it_finalize(struct kho_block_it *it);
> 
> These operate on block sets, should be reflected in the names.
> Can be kho_blocks_ to avoid too long names.

We have already started using kho_block_set. Although it is longer, I 
prefer to avoid kho_blocks/kho_block because the subtle difference makes 
them difficult to read and prone to typos during coding. Let's use 
kho_block_set for operations on a block_set.

> >
> > diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
> > new file mode 100644
> > index 000000000000..a4e650af946f
> > --- /dev/null
> > +++ b/kernel/liveupdate/kho_block.c
> > @@ -0,0 +1,384 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * Copyright (c) 2026, Google LLC.
> > + * Pasha Tatashin <pasha.tatashin@soleen.com>
> > + */
> > +
> > +/**
> > + * DOC: KHO Serialization Blocks
> > + *
> > + * KHO provides a mechanism to preserve stateful data across a kexec handover
> > + * by serializing it into memory blocks. This file provides the common
> 
> "This file" does not look good in HTML docs.

Fixed.

> 
> > [ ... skip 15 lines ... ]
> > +
> > +/*
> > + * Safeguard limit for the number of serialization blocks. This is used to
> > + * prevent infinite loops and excessive memory allocation in case of memory
> > + * corruption in the preserved state.
> > + */
> 
> Can you add how much memory it is and how many entries with, say, 4 u64
> it can accommodate?

Done

> 
> > [ ... skip 13 lines ... ]
> > +{
> > +	if (unlikely(!bs->count_per_block)) {
> > +		bs->count_per_block = (KHO_BLOCK_SIZE -
> > +				       sizeof(struct kho_block_header_ser)) /
> > +				      bs->entry_size;
> > +		WARN_ON(!bs->count_per_block);
> 
> Don't you want to set count_per_block in _init()?

Done.

> 
> > [ ... skip 29 lines ... ]
> > +	if (!block)
> > +		return -ENOMEM;
> > +
> > +	block->ser = ser;
> > +	last = list_last_entry_or_null(&bs->blocks, struct kho_block, list);
> > +	list_add_tail(&block->list, &bs->blocks);
> 
> No locks?

Linked blocks are not internally synchronized; that is a responsibility 
of the caller, similar to linked lists.

> 
> > [ ... skip 12 lines ... ]
> > + * @bs:    The block set.
> > + * @count: The current number of entries.
> > + *
> > + * This function handles the dynamic expansion of a block set. It allocates
> > + * and links a new serialization block if the provided entry count matches
> > + * the current total capacity of the set.
> 
> This is a weird semantics for a generic API. I'd expect _grow() would
> add count - current_count blocks.

Changed the semantics to use target count, i.e. "The target number of 
valid entries to accommodate."

> 
> > [ ... skip 25 lines ... ]
> > +}
> > +
> > +/**
> > + * kho_block_shrink - Conditionally destroy the last block in a block set.
> > + * @bs:              The block set.
> > + * @count:           The current number of entries across all blocks.
> 
> Maybe 
>  	... of valid entries?

OK

> 
> > + *
> > + * This function checks if the last block in the set is redundant based on the
> > + * total entry count and the capacity of the preceding blocks. If the entry
> > + * count can be accommodated by the blocks that come before the last one, the
> > + * last block is destroyed and removed from the set.
> 
> This should mention that it's the caller responsibility to ensure that
> entries are removed in the right order.

OK

> 
> > [ ... skip 49 lines ... ]
> > +
> > +		fast = phys_to_virt(fast->next);
> > +		slow = phys_to_virt(slow->next);
> > +
> > +		if (slow == fast) {
> > +			pr_err("Cyclic list detected\n");
> 
> Maybe "block set is corrupted"?

OK

> 
> > +			return false;
> > +		}
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +/**
> > + * kho_block_restore - Restore a block set from a physical address.
> > + * @bs:      The block set to restore.
> > + * @head_pa: Physical address of the first block header.
> 
> I'd mention that the block set should be allocated and initialized

Done

> 
> > [ ... skip 10 lines ... ]
> > +	bs->incoming = true;
> > +	if (!head_pa)
> > +		return 0;
> > +
> > +	bs->head_pa = head_pa;
> > +	if (!kho_cyclic_blocks_check(bs)) {
> 
> if (kho_block_set_cyclic()) 
> 
> reads nicer IMO

Sure, done.

> 
> > [ ... skip 87 lines ... ]
> > +{
> > +	if (!it->block)
> > +		return NULL;
> > +
> > +	if (it->i == kho_block_count_per_block(it->bs)) {
> > +		it->block->ser->count = it->i;
> 
> Why iterator updates ser->count?

The new name  kho_block_set_it_reserve_entry()  clarifies that this is a 
write/reservation path function (unlike the original read-only  next  
name). Reserving a slot to write entries naturally implies 
writing/finalizing the metadata count in the physical block header when 
a block becomes full

> > +		if (list_is_last(&it->block->list, &it->bs->blocks))
> > +			return NULL;
> > +		it->block = list_next_entry(it->block, list);
> > +		it->i = 0;
> > +	}
> > +
> > +	return (void *)(it->block->ser + 1) + (it->i++ * it->bs->entry_size);
> 
> In a month we'll need an LLM's help to understand what it does.

Good thing in a month we will have even stronger LLMs to help us :-)

Anyways, clean-up ...

> 
> > +}
> > +
> > +/**
> > + * kho_block_it_read - Return the next entry slot for reading.
> > + * @it: The block iterator.
> 
> And what is the conceptual difference between this and _it_next()?

This was updated :-)

> 
> > [ ... skip 49 lines ... ]
> > + * @it: The block iterator.
> > + */
> > +void kho_block_it_finalize(struct kho_block_it *it)
> > +{
> > +	if (it->block)
> > +		it->block->ser->count = it->i;
> 
> So, it looks like the intention of _it_next is for write, and this ends a
> write iteration.
> 
> I think the names should be adjusted to make it clearer.

Done

> 
> -- 
> Sincerely yours,
> Mike.
> 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410140;
	b=kFNPQLQJ4p5QdXh56puW0bl1N13+OwvxfYlXTHpuS5gUgbRWKVbrSnLIt7GyhBNtSr3S
	 5OVgKMMki/12mpPAUznfCgH05Bp82/fRrJJJfi+a3UmBKIKzxkr+wCHLAOXWBWHK4CmBv
	 RDqySXGiXMD5COCXm5pcp09QV2wHQQW1Q64a1joQKgMPOy9vEvLu6w/dSAqfCJJwZg18Y
	 9kUTPyE0/UBQ6ac3TIwsSU9tSbl7sfHDUXBEcl4AoGEuKHSqK1lLAERyDvY0rlXmryN0B
	 qtZvBC7mn6GtFAV22tP6Ax3iUwPjuSUsbn30BOFdNtzSeUkeC8OBMZPelFEL4EzRZrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To;
	bh=7MN59RS0FEa8Yt1lpkKUAzp9vOqlc0URHQI/8ivhnpE=;
	b=AHemek0OVyVQEk+MGPl+k5LXPz9CC9uJCWDWH8jWKzP+f29yje93MUumPYLYbqy6dL25
	 VWxeIM/YeMhg32Ed7i8oXpevHXFJNLLHu3UG3kbTWxhmm5zcIn0REBY4TkI8tvpM2VA9t
	 QU5ntLQyfkDQURnCcrJtIZwCDEliK0TnKv+olRj6X1LsN5m8/6EHQbCWfHyJUHJAPy1Uw
	 FuA+oyjof0isgGHdrLoWjt2aGKqF0eiczmiENRanulmlRXyTn8PkR5cdMkXwjwvqgbj4N
	 0eXqufFDMpJLklfVP1RZw2HGJFJQk5VqznpKczTJcH1veDIsDL/qY9LZTzyhzhPXR3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=cHMnuriu;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E1D606A324
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 15:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E1D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=cHMnuriu
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso1149788137.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794410139; x=1795014939; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7MN59RS0FEa8Yt1lpkKUAzp9vOqlc0URHQI/8ivhnpE=;
        b=cHMnuriu35D5Qi8d4jwXyCo+yJbOq8O5/wnsbj8z5kgzAG62f9RgxewWFOBGEpYQTo
         PHLS4egxJkUpUeX4oJ5/h0f70BdwcweRs+kqOw7j1705yAMySPkG6OYnk3E15nqkK6pZ
         SO4+PJjEzAw+MRUiw7TudVY/aXeuVd4zQuFVyh3jDVWaqeRcND8N9WrOJhJ4MEFAzBzR
         8s/mBO728gQ5zQANjHJQNKt668NrAfEw4oAurdlzj6f9QvwLt2bPKRosp3TN3pdMobRs
         jShv/tpmtKfAsuF2vIhnyq3By+Z26kO0/pXGlXxfxdwtL9H/Qus3qIILVW/cz6XCQISR
         2pSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410139; x=1795014939;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MN59RS0FEa8Yt1lpkKUAzp9vOqlc0URHQI/8ivhnpE=;
        b=HihHrnuo5UZ/IWHHJFK3Zs+O+YFHI9HrkTszz8iVI2gfGRUJlLoqK70TWqW1EuqalX
         lTz1xiKHoEj1Wre4mFbhgR3QZwwvRJIXAg4Kqwn+x+C5bUK47NTeDCPoU2k4bUZopgAE
         A9M3AYyJFr/gpousDRfj96r0bxUgkxwTw35byN8QCIXyKUxwzk3KG9/26joMMBTF5OiD
         EW1chz26na14JGBEP87pu3rKZvnwRWBUM3ap9u7u1GmjDR2WDbYa1U3Z++RjT4WoqQjC
         IjAnwhJ8rwOyQVLtzva5HNWnGEcRsvE/Ep+5mIkXTjIEfRgEv+SuBQsZOhCuIt8mgVQJ
         6JGA==
X-Gm-Message-State: APuU4Z81S3MB3qVZMs7ojMQrNCQ82iYhfpb3QoQCgbnU1BSW+H+/7L3n
	xADgVx7cn+6Xt6qySApl23FLA3vFMim3CrXTWt7qJJ+8r/4h2drajWAdzuBjwTiHEvo=
X-Gm-Gg: AYBFou0oBRw6lKdnvpPdyyqTu9MV/Ped/dQyX48Rkw0ji+r7EaNHHu/ZngFMxGHnfGe
	L21F0UL9xSc1t1M/R+mc6mrwsbADaEtq0QvZ5AVqcPy+B+qDpabqXT08IaYnB2YOkJ6BaR2Eh4E
	cKlr0Zn503c7KHojzkK+ZHoEgB3N2PFGCdKVvpWkwIGLYuBfp2c/btphTyKbkBAtGIBrZgSUQo3
	deRuCQ3gMRsbI3xVT5J/b4QB9A8fkVN7vSyYpBDQG7/+xoiYd3EJRzaqudDsUjvfoXCaFp1f+pF
	FcClx3Cz+Z1m+DUXfsNMm0TJ3ruuS2sEpOb5h/mgceDhEy8C2gqvmtO6+2VXnr26TnrCWossUfy
	Ji1AAJ6nb2dxilc7IakosFXTAq/KLwSh+HWgZ4wxycOr28orUVPtxLTV/gKTQ/Zq/VEfRuLOUl6
	AwiwOgdScpqYWzhaSmPyeWIAkFCvmS4TeSLBc38Q8MX8T0n7aQvIKQAYDg60cJ4CJmMkgk+BTaT
	QAEKAZ0AcJnyD3JNLpMfWRvYxPy6xnXuJYjbEQM5Ex+EytHc76ExBtb9CDmPfKSL3RGVOjN01xV
	vzZKQ84K5XM2KbVaCnwYOe93DFqYy83tE1NOLPTJ2it4sZU1nuXgbbvMwoxloB9JZtYRQJylbr2
	t98TS2RStOaOSldzp78ckuVGzZ+7s
X-Received: by 2002:a05:6102:5cc8:b0:7d2:cdd6:6be with SMTP id ada2fe7eead31-7d505fa8765mr836563137.21.1794410138969;
        Wed, 11 Nov 2026 07:15:38 -0800 (PST)
Received: from localhost (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee1dcd3930sm1185914e0c.11.2026.11.11.07.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:15:37 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 10:15:36 -0500
Message-Id: <DMSHB0JBS5V8.1IZD7WPEQGPMA@soleen.com>
Subject: Re: [PATCH v5 2/6] kho: support incremental entry publication in
 kho_block
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <20261105050053.3063001-3-pasha.tatashin@soleen.com>
 <179439592040.425130.12391503339294194908.b4-review@b4>
In-Reply-To: <179439592040.425130.12391503339294194908.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> To allow LUO sessions to be frozen and committed into the outgoing KHO
>> subtree from userspace ahead of reboot, kho_block needs to support
>> publishing entries one by one into a live serialized block chain while
>> new blocks may still be preallocated or shrunk for uncommitted sessions.
>>=20
>> Currently, kho_block assumes outgoing block sets are populated in a
>> single batch during reboot() before the chain is exposed: preallocated
>> blocks are linked onto the chain immediately even while empty
>> (ser->count =3D=3D 0), and reserving a slot increments ser->count before=
 the
>> entry is populated.
>>=20
>> Address this by keeping preallocated outgoing blocks unlinked in
>> kho_block_add(), linking blocks lazily only as entries are written. Add
>> kho_block_set_it_append() to copy each entry into its slot before
>> publishing the updated ser->count and next-block link via
>> smp_store_release(), paired with smp_load_acquire() in
>> kho_block_set_it_read_entry().
>>=20
>> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> ---
>>  include/linux/kho_block.h     |  1 +
>>  kernel/liveupdate/kho_block.c | 86 +++++++++++++++++++++++++++++++----
>>  2 files changed, 77 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/linux/kho_block.h b/include/linux/kho_block.h
>> index 93a7cc2be5f51..a9e696ef3e08e 100644
>> --- a/include/linux/kho_block.h
>> +++ b/include/linux/kho_block.h
>> @@ -100,6 +100,7 @@ static inline bool kho_block_set_is_empty(struct kho=
_block_set *bs)
>> =20
>>  void kho_block_set_it_init(struct kho_block_set_it *it, struct kho_bloc=
k_set *bs);
>>  void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it);
>> +void *kho_block_set_it_append(struct kho_block_set_it *it, const void *=
src);
>>  void *kho_block_set_it_read_entry(struct kho_block_set_it *it);
>>  void *kho_block_set_it_prev(struct kho_block_set_it *it);
>> =20
>> diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block=
.c
>> index 0d2a342ef4228..2813c6fd593c4 100644
>> --- a/kernel/liveupdate/kho_block.c
>> +++ b/kernel/liveupdate/kho_block.c
>> @@ -16,6 +16,12 @@
>>   * array of serialized entries. Multiple blocks are linked together via=
 a
>>   * physical pointer in the header, forming a linked list that can be ea=
sily
>>   * traversed in both the current and the next kernel.
>> + *
>> + * Outgoing blocks preallocated via kho_block_set_grow() remain unlinke=
d until
>> + * entries are written into them. Callers publishing entries incrementa=
lly into
>> + * a live KHO subtree can use kho_block_set_it_append(), which populate=
s each
>> + * entry before exposing the updated block count or next-block link via
>> + * release-store ordering.
>
>
>>   */
>> =20
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> @@ -93,9 +99,7 @@ static int kho_block_add(struct kho_block_set *bs,
>>  	list_add_tail(&block->list, &bs->blocks);
>>  	bs->nblocks++;
>> =20
>> -	if (last)
>> -		last->ser->next =3D virt_to_phys(ser);
>> -	else
>> +	if (!last)
>>  		bs->head_pa =3D virt_to_phys(ser);
>
>
>> =20
>>  	return 0;
>> @@ -129,14 +133,15 @@ static void kho_block_set_shrink_one(struct kho_bl=
ock_set *bs)
>>  	last =3D list_last_entry(&bs->blocks, struct kho_block, list);
>>  	list_del(&last->list);
>>  	bs->nblocks--;
>> -	kho_block_free_ser(bs, last->ser);
>> -	kfree(last);
>> =20
>>  	new_last =3D list_last_entry_or_null(&bs->blocks, struct kho_block, li=
st);
>>  	if (new_last)
>> -		new_last->ser->next =3D 0;
>> +		WRITE_ONCE(new_last->ser->next, 0);
>
> Why this is needed? Docs explicitly state that "Synchronization and
> locking are the responsibility of the caller".

This was done as prep for the kho-ro changes: when an uncommitted=20
session closes and shrinks an unused trailing block, new_last may=20
already be published and read concurrently via kho-ro. I will move it=20
into a separate patch in the kho-ro series to clearly explain the=20
intent.

>
>>  	else
>>  		bs->head_pa =3D 0;
>> +
>> +	kho_block_free_ser(bs, last->ser);
>> +	kfree(last);
>
> This change seems unnecessary.

Leftover from the earlier pop support (unlinking last->ser before=20
unpreserving/freeing it). Will drop this change in v6 as well; I have=20
since simplified the logic so adding to KHO is always a one-way trip.

>>  }
>> =20
>>  /**
>> @@ -144,9 +149,9 @@ static void kho_block_set_shrink_one(struct kho_bloc=
k_set *bs)
>>   * @bs:    The block set.
>>   * @count: The target number of valid entries to accommodate.
>>   *
>> - * Dynamically preallocates and links preserved memory blocks if the ta=
rget
>> - * entry count exceeds the current total capacity of the set, ensuring =
they
>> - * are available during serialization/deserialization.
>> + * Dynamically preallocates preserved memory blocks if the target entry=
 count
>> + * exceeds the current total capacity of the set, ensuring they are ava=
ilable
>> + * during serialization/deserialization.
>>   *
>>   * Context: Caller must hold a lock protecting the block set.
>>   * Return: 0 on success, or a negative errno on failure.
>> @@ -318,6 +323,7 @@ void kho_block_set_clear(struct kho_block_set *bs)
>>  	struct kho_block *block;
>> =20
>>  	list_for_each_entry(block, &bs->blocks, list) {
>> +		block->ser->next =3D 0;
>>  		block->ser->count =3D 0;
>>  		memset(block->ser + 1, 0, KHO_BLOCK_SIZE - sizeof(*block->ser));
>>  	}
>> @@ -348,6 +354,7 @@ void kho_block_set_it_init(struct kho_block_set_it *=
it, struct kho_block_set *bs
>>   */
>>  void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it)
>>  {
>> +	struct kho_block *prev =3D NULL;
>>  	void *entry;
>> =20
>>  	if (!it->block)
>> @@ -356,15 +363,73 @@ void *kho_block_set_it_reserve_entry(struct kho_bl=
ock_set_it *it)
>>  	if (it->i =3D=3D it->bs->count_per_block) {
>>  		if (list_is_last(&it->block->list, &it->bs->blocks))
>>  			return NULL;
>> +		prev =3D it->block;
>>  		it->block =3D list_next_entry(it->block, list);
>>  		it->i =3D 0;
>>  	}
>> =20
>> +	if (!it->i)
>> +		it->block->ser->next =3D 0;
>> +
>>  	entry =3D kho_block_entry(it, it->i++);
>>  	it->block->ser->count =3D it->i;
>> +	if (prev)
>> +		prev->ser->next =3D virt_to_phys(it->block->ser);
>
> kernel-doc should mention that this function now links blocks.
>
> And I believe there should be a paragraph about the new flow in the DOC:
> section.

+1, I will update the kernel-doc.

>
>> +
>>  	return entry;
>>  }
>> =20
>> +/**
>> + * kho_block_set_it_append - Write and publish an entry at the next slo=
t.
>> + * @it:  The block iterator.
>> + * @src: Entry data of size @it->bs->entry_size to copy into the slot.
>> + *
>> + * Copies @src into the next available slot before updating the block's=
 entry
>> + * count or linking a newly occupied block to the previous block, so co=
ncurrent
>> + * readers never observe an uninitialized slot or an empty block.
>> + *
>> + * Return: A pointer to the written entry slot, or NULL if the block se=
t's
>> + * capacity is fully exhausted.
>> + */
>> +void *kho_block_set_it_append(struct kho_block_set_it *it, const void *=
src)
>> +{
>> +	struct kho_block *prev =3D NULL;
>> +	void *dst;
>> +
>> +	if (!it->block)
>> +		return NULL;
>> +
>> +	if (it->i =3D=3D it->bs->count_per_block) {
>> +		if (list_is_last(&it->block->list, &it->bs->blocks))
>> +			return NULL;
>> +		prev =3D it->block;
>> +		it->block =3D list_next_entry(it->block, list);
>> +		it->i =3D 0;
>> +	}
>> +
>> +	if (!it->i)
>> +		WRITE_ONCE(it->block->ser->next, 0);
>> +
>> +	dst =3D kho_block_entry(it, it->i++);
>> +	memcpy(dst, src, it->bs->entry_size);
>> +
>> +	/*
>> +	 * Ensure the serialized entry is visible before exposing the
>> +	 * incremented count to concurrent readers.
>> +	 */
>> +	smp_store_release(&it->block->ser->count, it->i);
>> +	if (prev) {
>> +		/*
>> +		 * Ensure the new block's first entry and header are visible
>> +		 * before linking prev->ser->next for concurrent readers.
>> +		 */
>> +		smp_store_release(&prev->ser->next,
>> +				  virt_to_phys(it->block->ser));
>
> Until now the locking model was "the caller is responsible to hold a
> lock".
>
> Using WRITE_ONCE() and smp_store_release() instead of plain assignments
> implies that it is not anymore, or at least not always.
>
> This should be a well documented separate change.

Agreed. I wrote this patch as preparation for both early freeze and=20
kho-ro: mutations to struct kho_block_set itself still require caller=20
locking, while the WRITE_ONCE() and release/acquire ordering allow a=20
concurrent kho-ro reader to walk the live serialized physical block=20
chain while the host continues committing entries under its lock.

In v6, I will remove the kho-ro parts, and submit them together with the=20
next iteration of that series.

--=20
Pasha


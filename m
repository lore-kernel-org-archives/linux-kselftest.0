Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696C032FA18
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 23:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790725307; cv=pass; b=o466pQ19lpjI/GEkFZJxV3bvAmlhC11sjRJMXQsMBuRUeuEM81MKr0wbZ9xHfP9Yoa6CJsnwsm11dscUw1Wi+6/jz7FrjDj6gN8yImhjM0M2BlQt1ppCm0Ys9YEYRi0VUwOHGKHAONT6BdB4LBxZvxUWw6csO76ix9pOTcteqBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790725307; c=relaxed/simple;
	bh=HD1IXYaD6c+FfUy56N8Mrzk10Uq5pLrnPqJGCZSn9JQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmwktoiNc0vVwER889Ev7LTdoSioWocEqT3IWNmC4ylA1r3F6kGIavCxoHOG0GW0DdeLUzeHwTdN2eymSttNtPZmruTv3BBCsuchQeSj8UNTWJOAMZc0wUvCTsK1ESKVDoVv1M9I/oBKEt6WfNwnv3Vv4LagfT7iBLsbSGcO89Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rg4soNIr; arc=pass smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rg4soNIr"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-914446005e8so37794956d6.0
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 16:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790725303; cv=none;
        d=google.com; s=arc-20260327;
        b=MTkOG2euWAIF6vdQ0f+H20wd5EcjIZOLVzwPdLZDxubZMD92dpKOFYvB3vi7pKixBh
         W7GLnGOe5Ba0ikdGwsjROx3mqmraAL/O2AoXWDeEFuMkqHViITQCUKKpAfpS/BIQPMV8
         32XhRnaHl6sdR7qg7twocG1EPimJrixmtL8If2JG61iWk7DN62U66b1gbbEXsti7qrrd
         pbHUDlXgwv1HH97ds2546yJFJpIKpRpHoVpg7BwmLgSh8Lr3p9lOhsc2KIH2FjS8paq5
         R50JFAtPNCZlIMErhqhZ0vazdrX9N8ZW1mLrp/UKYGIG+NIt4A5cNPucOs3OukeaCXsm
         AxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=+Xrgsv7RmptoTEWMbXsE4AaL7NQQ9ZRcJ/lLOBbn/ZM=;
        fh=RFunQaXFeQiri4Ei5XfHeFqxgJghozUO8kCbiJkMxzA=;
        b=BPqsFzGkhs4SI+5IAH4x6dd+7+fswX1rpQof2ke0/HxnRKlQUf8YQZYR1o1w1ACC+i
         rbvLMtSsd5nP2jR93/tUU3C3MxDfW9A7Vc/fcjiChsdEBHgXpm16h/1wcpkK9HjEuTf3
         wSTcVbeaH5TA8fwZonJomyLfuOlZmzau8/ESKcOYqDat6/QQjApY+EAy4mIa9uP8ktoo
         8DIJU1+T1pOHfoVTrOQl7vnPTddFBQPI3e0drXhCTWR+sDx8rxlOwewQnBUTP1FdfC5V
         XuUZuVyRvrmQQ0F3nf6SziBsXw0OeVOjYRxbOPrWfa6T0nlQwa3IeyTlM/8ZF255SZbd
         kzAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790725303; x=1791330103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Xrgsv7RmptoTEWMbXsE4AaL7NQQ9ZRcJ/lLOBbn/ZM=;
        b=rg4soNIr/Ato9YlkBjBXZhb8Z91ywgNvHRb2xXoFXP2tmgkO1OcY1kowUb7H6spYe2
         /zYoLiBYnoSXiDqIK9MlvmpljFgikNzYR5yKx5yJS2wmVGQlFeVS0r7/nDzn5wy//8St
         VVdsFs0EDOOH7T1RsHo9POlDpNkJbDi3d16NubYsB9Ml4Wwere26DIE/WfDF2ku5Kr+F
         FMr3U0FTDoYyi4+nMTFryqagjzHhEcXLmI80g0N6p1TF+4Nr2dLSSuCaHrinvtOD6E+e
         ODO0HHTXm9mRqL7356G4GJN1LR4cjahUxt0ELx+NOn63uEO7knlcqm10+ZumyB/04lXi
         adBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790725303; x=1791330103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Xrgsv7RmptoTEWMbXsE4AaL7NQQ9ZRcJ/lLOBbn/ZM=;
        b=xmxoFtzFFIzSTCVUBE0Fsu0PU/MI0fCFpAWSKNvjjGlui/BXOb6+bkIpB/zO1eGKvv
         aYU2Jj1kBEW5Vm8nZG7uX9tdTTf5KhBahm33qd8VJoEt5knbINTTni8tbSceI5vfdPh3
         zbbQJRfcCtiCrlx/N9bD1fc2j4lfX9XkQ533c3oe3MvOM7j3nO9KOfCApL3Dc/UPRuHj
         nbrOGeVerkY5cr4aZG00HL6f1aPVugSqAQThJMw+MFmNyeb2lKZfQ3tXIFX5C0J3KBwu
         kPcbnTwKaKuMrRqOdjG1fQrfDunPyIdgCgaE+lcZM+ovUOaeWBntfxw4K6vyN3L4jSo+
         JvDg==
X-Forwarded-Encrypted: i=1; AKwUvBzxBofPHBPiGvQbU4Q/5T87j+5C8UkExhtgZlM7xsjCYQXJtsXH/GdEnDHwv5XD3qnajbAfgBdEy+2ymy0HLv4=@vger.kernel.org
X-Gm-Message-State: AFuF++lin1m9ctM4o6Nye1NoVRmRjFjmswYWRWoM0fZuLjaHDl5eUvoY
	+A9zsJP4FDhpS/e/fGaW2R71g9p3JM1BxFcJOhow+xgw6XO9wTgpfNdQCBGuk5aLx5WD9M+ehDa
	3j13chf/+6u0R9aeK9ZOXbh5zQ1ONngpNPuPebh1w
X-Gm-Gg: AYBFou2dGV85xBP1ErbgNVYmCSSOxlplS3nQENBFzdWIDoOUYawK+rPZ60j9qfycxY1
	CnDQf47fZLMcwiQzKFE27NBG5SCNVkHa3pViLjd3RBkXZ28u8R4dcDJSExMiXbMI/3AWqSGhbFp
	sCbxHByyhFJF4a7Fvd2sN7Wnj2V3wx0K6LJY4cEDEDXHL/3ED/w6smlGX4udj9ss7o0tOIvBWiw
	RXCUnzCePNIntYyMLwxDXVbN3M1rrQo6sGYqIHGoewgJlGmwlCginOGnH6mHM7JrH0CmJ6aYZFf
	kneFjQJ0R6ohPw8m9VYE5d3eRBaT+Rsw3JUDxQdP9MngD7V6X5Y/fXqiFZC/nIz4PVXktfIW9fO
	lSMuqnm1ZrA4n/S3bMFI5oPVqgpGMNRkZfTGTkMD4
X-Received: by 2002:a05:6214:3f86:b0:912:1f7a:3e96 with SMTP id
 6a1803df08f44-91799b6f1cbmr14363076d6.7.1790725302155; Tue, 29 Sep 2026
 16:41:42 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 16:41:41 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 16:41:41 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ecab388213245df81815e42246db3b13b2d43e2b.camel@infradead.org>
References: <20260925-gmem-tmpfs-backend-v1-0-d36159822d18@google.com>
 <d599627270c67a5334d2abced75d1d1711fb0af0.camel@infradead.org>
 <CAEvNRgGw_RjiGs_bbVnoRAvq49Qukm4h8XhkBd0DXxn1ZzLrQg@mail.gmail.com> <ecab388213245df81815e42246db3b13b2d43e2b.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 29 Sep 2026 16:41:41 -0700
X-Gm-Features: AclHuK-XLbcvCXV4wApQJel8RTlaN3ncBGEcJbP_UmWcTs4Jcx4bthsfg-DyB4A
Message-ID: <CAEvNRgEU47Xag6S4mJNxZCjEf9AetHO_kvMQ033Vaz4jpwcrcg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/17] Allow guest_memfd to be created using a
 resource (pool) fd
To: David Woodhouse <dwmw2@infradead.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, vannapurve@google.com, erdemaktas@google.com, 
	jxgao@google.com, rientjes@google.com, fvdl@google.com, jthoughton@google.com, 
	tarunsahu@google.com, pratyush@kernel.org, fuad.tabba@linux.dev, 
	Gregory Price <gourry@gourry.net>, yan.y.zhao@intel.com, michael.roth@amd.com, 
	suzuki.poulose@arm.com, Christian Brauner <brauner@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>, aik@amd.com, 
	aneesh.kumar@kernel.org, Vlastimil Babka <vbabka@kernel.org>, 
	Connor Williamson <connordw@amazon.co.uk>, Fred Griffoul <fgriffo@amazon.co.uk>
Cc: kernel-team@android.com, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

David Woodhouse <dwmw2@infradead.org> writes:

> On Mon, 2026-09-28 at 15:59 -0700, Ackerley Tng wrote:
>> David Woodhouse <dwmw2@infradead.org> writes:
>>
>> > On Fri, 2026-09-25 at 17:50 -0700, Ackerley Tng via B4 Relay wrote:
>> > >
>> > > =3D=3D=3D What if my provider doesn't deal with pages?
>> > >
>> > > Frank and David Woodhouse [2] have use cases for providers that use
>> > > PFNs, and this is definitely something a generic interface must
>> > > support.
>> > >
>> > > Here are some options I can think of:
>> > >
>> > > 1. Don't define .alloc_folio(), instead define .alloc_pfn()
>> > > 2. Refactor .alloc_folio() to .alloc_pfn()
>> > >
>> > > Either way, I think guest_memfd should still be the primary manager =
of
>> > > the memory.
>> >
>> > Thanks for working on this.
>> >
>>
>> Thanks for the quick reply!
>>
>> > I'm not sure what you mean by 'primary manager' here but my use case i=
s
>>
>> Naming is hard! See comment on revocation below.
>>
>> > for the provider to be the ultimate arbiter of who owns which PFN, and
>> > revocation of the same. Think of it like a filesystem backed by
>> > external memory. Each guest's memory is a file, and a guest can
>> > *donate* specific pages of its memory to other guests (which in the
>>
>> Putting donation aside first - I don't have a good picture of how a
>> guest would tell the host that it's willing to share a page - can't
>> comment. Would love to find out more.
>>
>> > context of the *interface* only means that we need revocation).
>
> That's implementation-specific. Think of things like Nitro Enclaves
> where a guest 'donates' its memory back to the hypervisor to be used by
> another microvm. But that interface isn't the guest_memfd concern; as I
> said, in the context of the guest_memfd interface, there is only
> revocation: that page went away, whatever the reason.
>

Okay we're on the same page then. :) guest_memfd only needs to know that
the page went away, guest_memfd cannot say no.

>> Going with this revocation part, beginning with a more basic use case:
>> I'm thinking that the provider can notify guest_memfd that the page or
>> PFN is going away.
>
> Right. That part I have working in what I was posting.
> [5] https://git.infradead.org/?p=3Dusers/dwmw2/linux.git;a=3Dcommitdiff;h=
=3Dee95ed5aaf06
>

That is similar to what I had in mind except the parameters, I was
thinking inode, offset, size.

kvm_gmem_invalidate_range() in your patch [5] does have a kvm_gmem
prefix, but it's really a direct call to tell KVM MMU to zap the gfn
range, guest_memfd doesn't get to update its own state.

>> guest_memfd cannot say no, but it does have to tell KVM to zap the page
>> from stage 2, and for CoCo it may need to do more stuff.
>>
>> The notification needs some pointer, so I was thinking that on .attach()
>> the provider would also note down which guest_memfd instance the
>> provider should notify.
>>
>> The notifier could tell guest_memfd that some (offset, size) is going
>> away, and breaking down mappings in the EPT/NPT should be something
>> guest_memfd tells KVM to do, I think. Are you thinking that the provider
>> would directly break the mappings down in the EPT/NPT?
>
> I think telling KVM is the right thing to do.
>

Glad to hear that :)

>> Does this notification mechanism work for you? IIUC regular DAX would
>> need it too, like if the device is unplugged for example.
>
> Sure. As long as it works and efficiently covers everyone's use cases,
> I'm not going to be overly opinionated a priori about *how* it works.
>
> All such bets are off once we see the code, of course :)
>
>> > Should I be trying to rework parts of my series to live on top of this=
?
>>
>> I hope to gather more feedback at LPC. It'd be nice to get early
>> feedback if you think it can work for you! The overall design still
>> needs feedback though, don't take this as the final direction.
>>
>> > Things I have working but which I don't see here include:
>> >
>>
>> This sounds like 4 or more different features! I think they do work with
>> this resource fd proposal.
>>
>> > =C2=A0=E2=80=A2 PFN support (which you mentioned).
>>
>> Yup, guest_memfd needs some way to track PFNs in addition to folios. I
>> think for tracking we can reference DAX, the part I haven't looked at is
>> how to let guest_memfd handle events. Like if there's memory failure on
>> a PFN, how do we let guest_memfd handle it?
>
> Telling the guest about correctable and uncorrectable errors, you mean?
> I would have thought that's up to the VMM, until the point where (see
> revocation)?
>

Informing the guest is definitely the userspace VMM's action to
take.

guest_memfd's role here is updating it's own tracking, and perhaps
splitting folios. When guest_memfd supports huge pages, one thing high
on the wishlist is to split the huge folio and zap only the page where
there was an error and not the huge page.

Advantage of splitting: If the failure happened in the last 4K, the
first 1G - 4K can continue to be used by the guest. If the guest never
touches the last 4K, it doesn't have to know about the failure at all.

>> guest_memfd needs to at least be notified, so that it can handle the KVM
>> stuff: zapping and special stuff for CoCo. Whether the provider or
>> guest_memfd gets to handle it first can be worked out :)
>>
>> > =C2=A0=E2=80=A2 IOMMUFD support via dma-buf.
>>
>> Is this about having guest_memfd work with dmabuf fds?
>
> It's about having the provider of memory (again, think of it as a daxfs
> if you will) able to tell *both* KVM and IOMMU which pages are where =E2=
=80=94
> and revoke them at will.
>
> The *implementation* involved dmabuf fds, and we already discussed
> which wraps which, on the first posting of my series. But maybe we'll
> conclude that the right answer is for IOMMUFD to recognise this
> guest_memfd 'provider' as a first-class citizen, and we won't need to
> masquerade as dmabuf?
>
>> Fuad also brought up that Android uses dmabuf as an interface for CMA
>> memory. [3] IIUC the dmabuf fd is mmap()ed, then the userspace address
>> is set up in a memslot for the guest. To make this CMA memory
>> CoCo-friendly, we want to use it with guest_memfd.
>>
>> Jason response was that guest_memfd should probably just directly get
>> memory from CMA [3].
>>
>> I'm not super familiar with CMA or dmabufs, would either have a suitable
>> "resource fd" to pass to guest_memfd like how HugeTLBfs has a mount fd?
>> The "resource fd" should ideally have no way to mmap or read/write the
>> memory directly.
>>
>> [3] https://lore.kernel.org/all/CA+EHjTxZ0N3Tfnid404B4tkb_E+Z8mODTHTgBPi=
F6=3DbwZp7Hjw@mail.gmail.com/
>
> I think where the memory comes *from* is an implementation detail for
> the provider. It provides a PFN (or folio, if you must). All else is
> not the business of KVM or IOMMUFD.
>

So we already have

  dmabuf --wraps--> CMA (and others)

We could have

  [a] guest_memfd --wraps--> dmabuf --wraps--> CMA

or

  [b] guest_memfd --wraps--> CMA

I agree guest_memfd shouldn't care where the PFN comes from, but this
does impact where the provider_ops code is implemented though.

If we go with [b], CMA needs to find a non-dmabuf way for userspace to
get some resource fd. If we go with [a], dmabuf folks need to support
this :)

>> Or is this about letting IOMMUFD get pages to map in IOMMU page tables
>> via an fd+offset instead of via mmap()-ed userspace addresses as in
>> IOMMU_IOAS_MAP_FILE, and that guest_memfd isn't a supported kind of fd
>> (yet)?
>>
>> I think guest_memfd should support IOMMU_IOAS_MAP_FILE. One use case is
>> Confidential IO [4], where SNP would need to have private memory
>> (guest_memfd) mapped in the IO page tables.
>
> Right, I think that's what I meant with 'first class citizen' above?
>

I agree, yes, I would like guest_memfd to be first class alongside other
memory providers.

>> The missing parts here are that guest_memfd and iommufd need to
>> cooperate for conversions (or some other coordination in userspace). If
>> private memory gets converted to shared, iommufd needs to know to remap
>> the pages as shared in the IO page tables.
>>
>> [4] https://lore.kernel.org/all/20260225075211.3353194-1-aik@amd.com/
>>
>> > =C2=A0=E2=80=A2 Revocation (which I've tested correctly breaks down la=
rge pages in
>> > =C2=A0=C2=A0 both EPT/NPT and IOMMU).
>>
>> See above.
>>

I missed considering breaking down huge pages (the folios). guest_memfd
will definitely need to cooperate with the provider to break down the
pages.

I'll need to prototype support with HugeTLBfs, probably after LPC. There
I'll need to split pages on conversion to shared and merge on conversion
to private.

I think you meant breaking down the mappings for the large pages in
stage 2? guest_memfd tells KVM to do that in one of the earlier
prototypes for guest_memfd HugeTLB pages.

>> > =C2=A0=E2=80=A2 AsyncPF support for pages requested by KVM.
>>
>> Is this kind of orthogonal? IIUC today KVM MMU handles the async-ness.
>> KVM MMU checks that the page is not there, then since async was
>> configured, KVM tells the guest to schedule in something else.
>>
>> guest_memfd doesn't have support for async #PFs now. I imagine it would
>> be something like KVM MMU firing off a kvm_gmem_get_pfn() request
>> asynchronously, and then guest_memfd gets the page or PFN and inserts it
>> in guest_memfd filemap, and then notifies KVM MMU?
>>
>> Within kvm_gmem_get_pfn(), guest_memfd should get the page or PFN from
>> the provider.
>>
>> I think it's orthogonal because guest_memfd could
>> have gotten a PAGE_SIZE page (existing functionality) or gotten a page
>> from the provider.
>
> Kind of, but I'm focusing on the guest_memfd provider interface, and
> that needs to support the asychronous mode: asked for a PFN for a given
> guest address, it returns -EAGAIN and then provides it later, and the
> guest gets the right asyncpf behaviour:
> https://git.infradead.org/?p=3Dusers/dwmw2/linux.git;a=3Dcommitdiff;h=3D8=
94dd0fcb34f

I thought the same .alloc_folio would be used, except for an async #PF
the entire kvm_gmem_get_folio(), which calls .alloc_folio() would be
done in some background thread, so the provider doesn't have to have a
different .alloc_folio_async().

If the provider does need to know, then the corresponding thing in this
series could be:

  struct guest_memfd_provider_operations {
	  void *(*attach)(struct file *resource_file);
	  void (*release)(void *provider);
	  struct folio *(*alloc_folio)(void *provider, pgoff_t index,
-				       struct mempolicy *mpol);
+				       struct mempolicy *mpol, bool nowait);
	  void (*invalidate_folio)(void *provider, struct folio *folio);
  };

something like that?

Either way I think it would have to be a later series after the first
one (for upstreaming).

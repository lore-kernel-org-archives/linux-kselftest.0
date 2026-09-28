Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B96830EF9A
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790636370; cv=pass; b=aaqsCxuSWuwI8RLwY8h24ZdB5pezKzurDZs3z7ZcoXHlWCtth5J8cnydnYTMOtpF6vgGBMqjMvaGqmibrUJ042MN6H+hWYzgLKyLvNwj8ARjRSdl4+9ya99W1gVWOZd462AwDud0yVkKnlU7EWddfQKoeCzdLUqt7M1qtJ/1JP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790636370; c=relaxed/simple;
	bh=3dhFSJqSrYEPxwhxTd/7VdtKX5PRSVUZ0eWZ0ZacoZY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iaZCYdwWTddeBqeKFus5CdHcS1xraaTzTpqaMfeZj4v453yNmckeBZa3Iv2PNDo4F5lwD5hlNuZRh4x8UkHm5f0Pi6ZO6sbrE42uyZxhwA4D+TdqOhf8C6PeQa3F2iIU9B2GEbfobXmGTwJP9ejS3SUHJbG4ZwJIQ4PDYuLHmkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ds55nWJj; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ds55nWJj"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5f63c54eso198616485a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 15:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790636368; cv=none;
        d=google.com; s=arc-20260327;
        b=kTj9gWcDSzpEcUMejFYapcZPGeBECMkbUYMo25jyGCCQ5ISfs4L1WRvGYDiedjRNVa
         elWIwJ4ruNIpv981JTOIjqYkj0NolpniKmXk27MxnUp4RTuzxhUoSxwlnx8KXB+24P+p
         XdU452LgOs3MWVbP1wjlWK0uBxEvtc/BAiHOq493a5RibU/87qvGbkL5idphLIq/aiK6
         7OSSkjTzJ75hFN3xaaGgJFfeedDfrZV5KYBsggD0/dvPGs431VfRwXfz8jhhL2gOJIoa
         qbDV8Y/4SHwwgo2bT+0qx+G4VzadRvZeMlmOgMILM1+Ss0toPsyzr+NrWod2xv2PYERA
         VnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=h1XRNkq6Yhc/2nUm3L5+IvDvFRHvgBkAyzRT7XwQvCM=;
        fh=j0lTDY0gsQmxzNupGW6a0njaSVvMjN04PkSfmgLsCY4=;
        b=BC7XA/Z9AzcUt0C634/1TJLF3sO7aM11BT4TbEjcOPuRVkx+6lQ8kdrgVC6OQNsyik
         X8L6r3IeoijVUQ32o0P8yTodi5qYwpwWCwXSrEQ8Fy3d/uMchpDIk7VbPXJZuqix1j70
         lgU3W43CbWMjR+nw+ObL6jR+6HCA+QYd2BnpBY4KiPSaM254aYw5O3p6+hwQr2QuUS5s
         NyFswNgUQpWs4OgWiefxC62L9lbrWMOh/yxuto1jBQZYyALqhw6QdcacVm1XYEz3F0h/
         eV3k8WmZNGw3fatEk/vX1sHtAOhTyIGXlGQ43HpXrciILQl1c310MGq4dX79Yx7E5ndL
         BMCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790636368; x=1791241168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h1XRNkq6Yhc/2nUm3L5+IvDvFRHvgBkAyzRT7XwQvCM=;
        b=ds55nWJjikTFMP1BW/kSKlsFLNXzqe2QVctr1EPFtaing/6xj99mqU8zOrK1EWqoq2
         wM7+DzCNZa7JMl6D8NhikQlxf6hlnxmiI5cEVQCvqThjoOuJc0dbEFOqRyHhfGWT5yYG
         iD+z2Ivc/ZwbG45plgbcSqiKRGJKrCVoKVmb7POmLL5PRepkJAGBmSGLaUElIIoUnYm+
         2CXWUGFhe/zTcchrUeiYeIvDwVOi6Z/8LZJ/0nCEWrTav3CRXFL3WjLrGDIdRqn43aAc
         yMelocVWt7h6QVO1uVmW5r9dMQr7pLu5+dg1SYhkUShkEUJJDcADUWCgnSb9df1xJ8SS
         3t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790636368; x=1791241168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1XRNkq6Yhc/2nUm3L5+IvDvFRHvgBkAyzRT7XwQvCM=;
        b=UnjqNEw8soitAUiQp8tEScHC4p2CueyJ92FOxQHZSP0DCPEREogHWcRysZ4z+rF3d4
         HnIVeUuh7kEoMhLiC20sRiY40Ad8ueAUViyuBUQsFojxTakjbOPd4vTppxUcNv5Uc8jK
         8eHOiv+wWrpo/myorKRKpGnxL7FKf85LXTLeb+NO1+ehrmAGPFlaXdt8lV7HN4K1fWJ5
         xshtpOfSrSfQk0zq/ofcZY4p+xYCcYzwyYZm4QL/cmbG2n7ipMwtXSesGUxW3xfJtaz2
         HUHVjbuBsOFY0SN7j1i3IeUV/bjaSsQE88HMNla6Yk4PV/ibdM8mPBRmrLknnyVH8KhG
         FhNQ==
X-Forwarded-Encrypted: i=1; AKwUvBymdGDPaY59pcmZb6IKQdloAAzkxaS0Pd0j5gbEwuSkZehl0X0WA9Ab+iBYBps2xXI3zl1x4iek5RzptYYwHZo=@vger.kernel.org
X-Gm-Message-State: AFuF++nVbQ/XPamWhFQvLMztghlZtsZ7XOjUhbtncknwkzHHUpfST5IS
	dyaQw1GizrjDieDYsu7JUqp7uD1ZcODVOW1Pi46SuejNbXkQB1FjGCEYZbxxX35eKj590njPIfd
	FAAN1HRwd4PLKcLJS/a8QvRO7nHDkiJxepUigIxuh
X-Gm-Gg: AYBFou3RqvMHfr9XyZxK71/jjB50HkhaJcRIDfQpJXivr52waLjGqwHOwjhIN4c0iPy
	+Bhr3Zr2lX9elSXH89zn8CxjJg1PVoNEM4y/ujb8GkhbBSGVEWXvGPke5b51uSL3Jb0bg5MxsiI
	7V1xAVrulbGPnl872AdBTIU3ulczfW8xRzQ3yLinzq23UKBgR6SHsCq8ngF8zWY/1EaeWcJLSAa
	yFO8I4nseL/eC1Ll2aB1/CCqPKKxs7FRRRKsKwsd2wzNiEdSSb+ZaWwzm/jK41FnxDbFAldCJnO
	KoQ/YWfyI9YWhn5uD/mkBlN+1t8X+hSuXBWgZOb658i5vI3HB58SlxFFtdsGwUtNrT3AFNjXC7S
	3MquNjXBrluSpLWJ5Kvxc3hGmZ2ogWisqyBrocuqb
X-Received: by 2002:a05:620a:7083:b0:939:6c31:2318 with SMTP id
 af79cd13be357-93c43ca0f85mr2339686185a.34.1790636367060; Mon, 28 Sep 2026
 15:59:27 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 15:59:26 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 15:59:26 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <d599627270c67a5334d2abced75d1d1711fb0af0.camel@infradead.org>
References: <20260925-gmem-tmpfs-backend-v1-0-d36159822d18@google.com> <d599627270c67a5334d2abced75d1d1711fb0af0.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 28 Sep 2026 15:59:26 -0700
X-Gm-Features: AclHuK84frc6bKnG4G1OS7cYNUmtfpFymmTftjPaGUJ8aPWmipSyf5FmbAPxTfI
Message-ID: <CAEvNRgGw_RjiGs_bbVnoRAvq49Qukm4h8XhkBd0DXxn1ZzLrQg@mail.gmail.com>
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

> On Fri, 2026-09-25 at 17:50 -0700, Ackerley Tng via B4 Relay wrote:
>>
>> =3D=3D=3D What if my provider doesn't deal with pages?
>>
>> Frank and David Woodhouse [2] have use cases for providers that use
>> PFNs, and this is definitely something a generic interface must
>> support.
>>
>> Here are some options I can think of:
>>
>> 1. Don't define .alloc_folio(), instead define .alloc_pfn()
>> 2. Refactor .alloc_folio() to .alloc_pfn()
>>
>> Either way, I think guest_memfd should still be the primary manager of
>> the memory.
>
> Thanks for working on this.
>

Thanks for the quick reply!

> I'm not sure what you mean by 'primary manager' here but my use case is

Naming is hard! See comment on revocation below.

> for the provider to be the ultimate arbiter of who owns which PFN, and
> revocation of the same. Think of it like a filesystem backed by
> external memory. Each guest's memory is a file, and a guest can
> *donate* specific pages of its memory to other guests (which in the

Putting donation aside first - I don't have a good picture of how a
guest would tell the host that it's willing to share a page - can't
comment. Would love to find out more.

> context of the *interface* only means that we need revocation).
>

Going with this revocation part, beginning with a more basic use case:
I'm thinking that the provider can notify guest_memfd that the page or
PFN is going away.

guest_memfd cannot say no, but it does have to tell KVM to zap the page
from stage 2, and for CoCo it may need to do more stuff.

The notification needs some pointer, so I was thinking that on .attach()
the provider would also note down which guest_memfd instance the
provider should notify.

The notifier could tell guest_memfd that some (offset, size) is going
away, and breaking down mappings in the EPT/NPT should be something
guest_memfd tells KVM to do, I think. Are you thinking that the provider
would directly break the mappings down in the EPT/NPT?

Does this notification mechanism work for you? IIUC regular DAX would
need it too, like if the device is unplugged for example.

> Should I be trying to rework parts of my series to live on top of this?

I hope to gather more feedback at LPC. It'd be nice to get early
feedback if you think it can work for you! The overall design still
needs feedback though, don't take this as the final direction.

> Things I have working but which I don't see here include:
>

This sounds like 4 or more different features! I think they do work with
this resource fd proposal.

>  =E2=80=A2 PFN support (which you mentioned).

Yup, guest_memfd needs some way to track PFNs in addition to folios. I
think for tracking we can reference DAX, the part I haven't looked at is
how to let guest_memfd handle events. Like if there's memory failure on
a PFN, how do we let guest_memfd handle it?

guest_memfd needs to at least be notified, so that it can handle the KVM
stuff: zapping and special stuff for CoCo. Whether the provider or
guest_memfd gets to handle it first can be worked out :)

>  =E2=80=A2 IOMMUFD support via dma-buf.

Is this about having guest_memfd work with dmabuf fds?

Fuad also brought up that Android uses dmabuf as an interface for CMA
memory. [3] IIUC the dmabuf fd is mmap()ed, then the userspace address
is set up in a memslot for the guest. To make this CMA memory
CoCo-friendly, we want to use it with guest_memfd.

Jason response was that guest_memfd should probably just directly get
memory from CMA [3].

I'm not super familiar with CMA or dmabufs, would either have a suitable
"resource fd" to pass to guest_memfd like how HugeTLBfs has a mount fd?
The "resource fd" should ideally have no way to mmap or read/write the
memory directly.

[3] https://lore.kernel.org/all/CA+EHjTxZ0N3Tfnid404B4tkb_E+Z8mODTHTgBPiF6=
=3DbwZp7Hjw@mail.gmail.com/

Or is this about letting IOMMUFD get pages to map in IOMMU page tables
via an fd+offset instead of via mmap()-ed userspace addresses as in
IOMMU_IOAS_MAP_FILE, and that guest_memfd isn't a supported kind of fd
(yet)?

I think guest_memfd should support IOMMU_IOAS_MAP_FILE. One use case is
Confidential IO [4], where SNP would need to have private memory
(guest_memfd) mapped in the IO page tables.

The missing parts here are that guest_memfd and iommufd need to
cooperate for conversions (or some other coordination in userspace). If
private memory gets converted to shared, iommufd needs to know to remap
the pages as shared in the IO page tables.

[4] https://lore.kernel.org/all/20260225075211.3353194-1-aik@amd.com/

>  =E2=80=A2 Revocation (which I've tested correctly breaks down large page=
s in
>    both EPT/NPT and IOMMU).

See above.

>  =E2=80=A2 AsyncPF support for pages requested by KVM.

Is this kind of orthogonal? IIUC today KVM MMU handles the async-ness.
KVM MMU checks that the page is not there, then since async was
configured, KVM tells the guest to schedule in something else.

guest_memfd doesn't have support for async #PFs now. I imagine it would
be something like KVM MMU firing off a kvm_gmem_get_pfn() request
asynchronously, and then guest_memfd gets the page or PFN and inserts it
in guest_memfd filemap, and then notifies KVM MMU?

Within kvm_gmem_get_pfn(), guest_memfd should get the page or PFN from
the provider.

I think it's orthogonal because guest_memfd could
have gotten a PAGE_SIZE page (existing functionality) or gotten a page
from the provider.

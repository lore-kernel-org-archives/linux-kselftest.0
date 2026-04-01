Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671193E95A5
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775083611; cv=pass; b=Oolx5sH97c5w8nfcy8ZiUM3p+8WYOWqELZJXgjDagaBLkXblGXkBBFm+TQjN4xo9JxLYDeB0NTkSIsOAF9EYB/nI8V6+zZr8L4B6e/YtoyBTDGs8v5C2Uhj0lPPtVQJ6kp0vv4HLUmaDu+ia3sRayq8blQePvP6JJtdy1OwKscs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775083611; c=relaxed/simple;
	bh=/6bWyUqm+9eDut6ccU8wAGvXDqzMH1T9XonO28gZlms=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQa3IGqlc0okY96Jue+eL38NGglJ/G3PcPhKRjIUfYvxtaT+ZImOQ40bcGGSlaD675oOLdVhhyQt1WcVKN1+RHtM15JyYz132ucEKwbaSIIsPfDY+g8LUxLQ3eY0NpKkyhG9gdrDHbM/IKfEB2D9Dj2ei88/AB2WbOwCwGiZCeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g7QYe+TP; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g7QYe+TP"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6058a955e04so32300137.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 15:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775083605; cv=none;
        d=google.com; s=arc-20240605;
        b=C4loTE25m0kKxeAmLZtYQ+g6xDj0nF6s/CfGu4QLl01QlnK9PPPgz02DVhpNBVaKS2
         kZAPD+an+lp5BO49DW/m4DNvosX8sAxga8Nqu6nRwKwpI5AlFg7wkYJdaYhgo+IGpfVH
         zTAkK1aPknF6RpQ3aeEamVog1q4VZ85uPuSjAWRhzlQiuPZb3ng7Z3W/AJjr7jltAuFz
         db9U00GtraMt44HrEW55kLnIA5aVMr4nDyOGvMqMI1MVObCDykmrArT1PfNrU69eQHcy
         ytQqO1sHPrZE4HW446bn/V/iL9S9et14TNEKDqdCi9+Z72OChnaH6Sq4Nei8h2qoM7xt
         TZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=9YPPgluH5dfl2SzGDQZmCOiPT4mFW9I+aoMhSywEtUQ=;
        fh=hS31miEL0C4il9ooMjEjLIcw7J5E3ICggVfBEExos50=;
        b=Vx9ZGM4oxQ4MUUQIuU0cJe8DcVX9SsYeREfLi3oIRk32F2nXDCGyoysP4UBmJhgVCP
         nudWyOVZ4yYhZuy2QJPScxzFcWH3RzzUjjmW2/WKczsfWG+z6lUttP3qXlfT8Lr3YWjJ
         4Lx5seRcZzOGpj0bLPX7+R8JE/79tKjHjyCdC8subjA7iwJVwUJjyeSE/rXT3T+z3F1J
         u+T0idcVwnzq+7ADSwXMAIcLNi377KqxBHWVDX/O3cM5OlF5mLZjmB1OHiS9lXnahvDO
         mq5zDI0a+kBFZwL/FskHfyzUoE94a7o41mgAu3PbShQ++/bfHIJMQ2i8UU/LWTUpkiOl
         z9eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775083605; x=1775688405; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9YPPgluH5dfl2SzGDQZmCOiPT4mFW9I+aoMhSywEtUQ=;
        b=g7QYe+TP/Cr/+gKuTi2qxvH96+wG0sEY6sCZ8l7nib6kRQYysPP5n/KtiNHUlAde79
         KzrvGGiLJo8s+9nvELRNkZmvwgeBpBmYKVfEBkhYCyJLyDn/HCIs4HLZc/ycdW9km3jT
         y45DCGgnNT2iuH2+hQ2xyvHpKFI/VBkxSKaVWQ0NcngNHtxfgOgQA4k4S/CxYw9T8PXs
         Z6Ewkzv2gTHoL20KQYEaIhxHXa7clvdCcFB6+cY38ZQ4Ub7EARvQodfDpeyB2ZBo1OZf
         SuvylT2RBua1KAmjS6AvqECBjXmTLZrQD5ElWen3gGEXBW8tVa+cEkREEyND6/HueRuf
         jzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775083605; x=1775688405;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YPPgluH5dfl2SzGDQZmCOiPT4mFW9I+aoMhSywEtUQ=;
        b=rt1nqb7VB4eiCOLFKHK2V1Y13OWOzI8sGL29XWYyhgKUY8rzlpNS8jTlML+2b+4ZaG
         jLyngqI/2puOEMx910YeOROcEXieXP6qEpBPy3kxWvmE8wMp3cTSTyvGSXxhwGz1W0SH
         Tk07uanZIeqvolRRvw2hwxD5bsZLdiC14YGObW2/wLF3IyfUQl52qvixPGjLrvoimZ9R
         zX2LSWCouDw2+zAwg3NPLMDw7OV5IZKAYmJ5YLOmTr4cMPbF7o8dVd9fRhsu5Dxf5pR7
         Q4kDJDrLuofrNWduf7KCAfUCTsm39uRE3hQmsq/H75yDALE0MSNgdWnQN0nzacSGGqhc
         cqZg==
X-Forwarded-Encrypted: i=1; AJvYcCW+ejF/O8wxK0V90ruVHiH0vaw9a/iBwOba/QzfPw5d01IzcxnsFbdVBXb+PhvJGx+eUWJQRtfoeoJojyZ1rQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIdp4ieyfQHMKSKstHyY7U6hOa8RkJ1EzYO026KLIxiqOrS/P5
	ML9TVeL/Y/uGVUAOPm8ZyJn56iCSFoh+0FW85G1QWO59zG6P4M1/AeSLoAVy0v5pD8uccockq8x
	6IhyzMqtzJvW5dRJUvXkP9bZNZIsaHeVkZSoa4xOn
X-Gm-Gg: ATEYQzyMEBVoaNnrRkmBEOtgI9kFmxTFiBPwxeL8PqO14NEYBGuiD29q/ekaOsKJ7R2
	lb7bIlGpTwQtnSvHvzuUsrb0oWOWD+rjm5HHcnmKXeZk/bru8QzKW3RwFtMNA4sSnHQPPRIZxa6
	9VwfkYcVB+vdfl8Oca5UcGeB+1ZozBEdaHKhDyZiiIpNS3y+PKMt/9iy6FrgDIS05rEDN4Wtbya
	6tJVvB4472I89Fai8z37Of/25F4HBehM6/GIQYAAvI3nOhb+VIzViLx7GAhlGAf3SrQR4d8QA+A
	zBmYGzeXnDth24DQK51ygqIs3PvzZxeHF/0eGL5glhl+283fYQxj4lyodYFLAYFPRqBTXg==
X-Received: by 2002:a05:6102:3e19:b0:602:70ca:64ff with SMTP id
 ada2fe7eead31-6058a9eb523mr70227137.20.1775083604142; Wed, 01 Apr 2026
 15:46:44 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Apr 2026 15:46:43 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Apr 2026 15:46:43 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <cqkyz4zxosmev6lnbasa32ed5jjfljrx3gr6plyjfhrtbysuwr@rg5noy6y6ayu>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com> <cqkyz4zxosmev6lnbasa32ed5jjfljrx3gr6plyjfhrtbysuwr@rg5noy6y6ayu>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 1 Apr 2026 15:46:43 -0700
X-Gm-Features: AQROBzDDCz2wIjIVmNQ0-ajdRi4I1p90A0stJRrbKBWGRj169blHjivIVN8AGHc
Message-ID: <CAEvNRgFgOJj1_WKGrmFfXe8Kg9BrrX7Shmu_cjsEfiq2RP79zQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Michael Roth <michael.roth@amd.com> writes:

> On Thu, Mar 26, 2026 at 03:24:19PM -0700, Ackerley Tng wrote:
>> For shared to private conversions, if refcounts on any of the folios
>> within the range are elevated, fail the conversion with -EAGAIN.
>>
>> At the point of shared to private conversion, all folios in range are
>> also unmapped. The filemap_invalidate_lock() is held, so no faulting
>> can occur. Hence, from that point on, only transient refcounts can be
>> taken on the folios associated with that guest_memfd.
>>
>> Hence, it is safe to do the conversion from shared to private.
>>
>> After conversion is complete, refcounts may become elevated, but that
>> is fine since users of transient refcounts don't actually access
>> memory.
>>
>> For private to shared conversions, there are no refcount checks, since
>> the guest is the only user of private pages, and guest_memfd will be the
>> only holder of refcounts on private pages.
>
> I think KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES deserves some mention in
> the commit log.
>

Will update this in the next revision. Thanks!

>>
>>
>> [...snip...]
>>
>>
>> +Set attributes for a range of offsets within a guest_memfd to
>> +KVM_MEMORY_ATTRIBUTE_PRIVATE to limit the specified guest_memfd backed
>> +memory range for guest_use. Even if KVM_CAP_GUEST_MEMFD_MMAP is
>> +supported, after a successful call to set
>> +KVM_MEMORY_ATTRIBUTE_PRIVATE, the requested range will not be mappable
>> +into host userspace and will only be mappable by the guest.
>> +
>> +To allow the range to be mappable into host userspace again, call
>> +KVM_SET_MEMORY_ATTRIBUTES2 on the guest_memfd again with
>> +KVM_MEMORY_ATTRIBUTE_PRIVATE unset.
>> +
>> +If this ioctl returns -EAGAIN, the offset of the page with unexpected
>> +refcounts will be returned in `error_offset`. This can occur if there
>> +are transient refcounts on the pages, taken by other parts of the
>> +kernel.
>
> That's only true for the guest_memfd ioctl, for KVM ioctl these new
> fields and r/w behavior are basically ignored. So you might need to be
> clearer on which fields/behavior are specific to guest_memfd like in
> the preceeding paragraphs..
>

Yes, will update in the next revision, thanks!

> ..or maybe it's better to do the opposite and just have a blanket 'for
> now, all newly-described behavior pertains only to usage via a
> guest_memfd ioctl, and for KVM ioctls only the fields/behaviors common
> with KVM_SET_MEMORY_ATTRIBUTES are applicable.', since it doesn't seem
> like vm_memory_attributes=1 is long for this world and that's the only
> case where KVM memory attribute ioctls seem relevant.
>
> But then it makes me wonder, if we adopt the semantics I mentioned
> earlier and have KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES advertise both
> the gmem ioctl support as well as the struct kvm_memory_attributes2
> support, if we should even advertise KVM_CAP_MEMORY_ATTRIBUTES2 at all
> as part of this series.
>

Read your other email as well, thanks for reviewing!

It makes sense, hope this captures what you suggested. In v5,

If vm_memory_attributes == 1:
    (KVM_CAP_MEMORY_ATTRIBUTES2 will be removed (will return 0))

If vm_memory_attributes == 0 aka attributes are tracked by guest_memfd:
    KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES2 will return valid attributes
    (KVM_CAP_MEMORY_ATTRIBUTES2 will be removed (will return 0))

So yup, KVM_CAP_MEMORY_ATTRIBUTES2 will not even be #defined at all.

>> +
>> +Userspace is expected to figure out how to remove all known refcounts
>> +on the shared pages, such as refcounts taken by get_user_pages(), and
>> +try the ioctl again. A possible source of these long term refcounts is
>> +if the guest_memfd memory was pinned in IOMMU page tables.
>
> One might read this to mean error_offset is used purely for the EAGAIN
> case, so it might be worth touching on the other cases as well.
>

Will update this in the next revision.

> -Mike
>
>>
>> [...snip...]
>>

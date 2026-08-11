Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E173594A
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 02:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786414637; cv=pass; b=AipjTyT6TOJuXI/DlaJtXLiDBdB26qU+szU0qrfb6f+I1twfixCge/w+cLDoBCq05XgiOfprnNxSsqi/zzQjvtROyT+Kfov1PxeRPUVDC3Hc69RZx0PRifjAhGG9u7m6HLSIBRw8H9EJe/KByLGEKxqZQJvqp+1O7caOjnTwP+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786414637; c=relaxed/simple;
	bh=R/zZ6BYoiA79eeIm3KeZtQxbzghVCX2aLBidVFbgTcE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYpc2m296FTb05KCfEGjrA5VgcDOsXXMM+xqRHNFdQbIpiiijrDJyPF/loil87QsLzpAx55a/QvWlP6zm1CM6KOPdrR2XtWJsLuPPVI9CaocHh2dxbZUUfMZMDX8cvdK8eKb+ft3PV+l+0WF+gsHMbj4VMBb+0dlwdUZWJRhIeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I/rdRC7a; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I/rdRC7a"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1836039a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 19:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786414634; cv=none;
        d=google.com; s=arc-20260327;
        b=gJAhwROhrauGa5+OzEqsxEo1dnzypkLX4qLxlQteOC4qy3njLTKkoyBPtbYLZNrHiO
         mcJ4TBMQmzeTmbkuv+3ExhDoYpnI+F0CAyVnvo0HXbY0+GoC415GKKpf6Z/J8RXkUI4n
         Mlni9lgbvGJj0xQ4om4Bf+5ym0GvHzlVq5ppTV9cfSvz27PG4jgWgKsXtaQ6i60HQkGC
         WRjgni/Pqe6pE6D2JAsSrnn/IjAXXnnd/DGHgqXjQA+zfK/oT/ma9saV3Ct+bjrLOCFS
         lkVcGl6EU4eFSAfFlIK05dlnkmSTBApSAskSE5tn5pzPddnoyLgMq/UVKnY+Gg+ANEaD
         bCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=1H+h+WapU6HmHtu5GH/zw8vUgSMNLrMHJCstuFReTU4=;
        fh=R9zz8GQBSMC41bLrabWd57DnVhIwsm2z4R2eUlJQO8o=;
        b=M6nMdgs7df2JgKA7KQ40Xh7VSIChqOqNmnMt15qHXSa9/nUbdoLkjN8Xq9b3hApeEF
         fjhCBSgTNg8mRLsOQDZbBJIDVdTRWiZhDcIYnsO+gmtEySY0tdYdEKJwn7rqaVuZFR5Q
         UlfbTiGHUq0RTbM1v/yg0Wgs4VpHpofHitFNsFUXqir5zF+gQfSYUiGuk4Hqq+k0mWep
         bgGMHFy7SavmrhoYTc1ePf0b2th5oK1pEFklrurXtmP8FjrZf4YcqJgvbxjRkmABy86r
         KyJ22d70hp4u1M8UrYR+NvrGVsftB829X2CzqzPwJDaD/irEtsMz3nlSvr7uSxbHMfOL
         8HuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786414634; x=1787019434; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1H+h+WapU6HmHtu5GH/zw8vUgSMNLrMHJCstuFReTU4=;
        b=I/rdRC7a3448yQ8hGlOhiEoIPZeYxQI1j4Xz9VEAFJBhDTkc92QLcqJINyU3mDgQM1
         iU2RTE+wTa9vfsi5U1hjduked1Dv2HioKvrX+jLltmDLdhwiFTTrHhxFnY5GBPQnoQ2J
         owdgyfrw71gwss05tWJTTWxBtmLavD+6pidsLb+ZERsZGwWcGJxg0f7vqXTSzjbf63gN
         9Cntmy0IhGFpnlfQ/tAeBspEkoKCx12blzEmffMIGQiN+TtHro8CqpkYTNS5JWOhUL1a
         MLmj8Xnoj0BCM1phKUoPAOyF+xuaUlZx/zSrmk5rrtuWqtfghyE7PI5000pm6W/sk5JH
         8UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786414634; x=1787019434;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1H+h+WapU6HmHtu5GH/zw8vUgSMNLrMHJCstuFReTU4=;
        b=Rwdmf/epdPJpcG3IQoDvyRdgRnJkg+G+Pu+uif6KbgirfzA6pVjYAbxXpGBOvzZIfG
         rxsnTSZjie20cbxvjl5cGxVdWOKC+lNFQ19IGySpTF/VnSjNOBq3U+9iKLepYOrtcawy
         y2sd8uc8KGWlMV7oemfOjs9UM6Hi8jZ4sLZCcW2clfxoKDZsw70+4zAiYOwcZ+NQFw+s
         ZQEXM9MxgaQrn6IWVUV5AXYuw1/YbNJbAq9BpB9MYTZUnRM+rEAeI+ffgYF2yqbBkVUJ
         n9KSBsks+JTtRkyjrChWWfW+tybOFUxyOe1sNwk7t0nmbT1Bs+k2SHkJ+L6UOEh35Sls
         Xvxg==
X-Forwarded-Encrypted: i=1; AHgh+RqIxiRKAd/NtqnmEPtuOpkT0QQ6R7ZB6WrEshQiNtWZyssaYvdz2KvQXEXvgc7uRml0V0cck/HLUFtP0GU+T+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHq+6LYP7fiSGEfHXW1s6y+OEsMQ9SDSNZJRASAhPrcEpTfWpp
	zbShnr0Ses5ViD3/uGVb9ruTsg+D9SzjHwP/9Mus8LUE/cssqv6tkYDCCUScU3E5K7e/Ps7eWx7
	npmqv2vjIYSG0+f6USVcWD+yQNGYUSx4YB3xxHHga
X-Gm-Gg: AR+sD11OqULg+KK7/EUEYB+NBiJ2ehoWSqypVYAwtsnnNQAKQcGrbydqcllGitcJs/M
	IiNBqMudSiMpcctCj0oO022o/3NTWWzT5XiXceskgyZaMiBTepT6yYgOlQGX/mFMjHu4WTMrQE1
	iiirh1Lx4c6prAV2vzaf20agXXyH3uVTtu6//plCLIA5b2tAZ8wTG0/XKZxFoJo15pXfvqw78pw
	rjnC6Drj08CqhlDN81s1UFHjFykfJDCHm+Z+ue4G9x2gzCEmlh/xQB/h40eifkeP2fKpVOW02hR
	ixIfqAp8VYti9IMcXOVRNkh6zBFyFu6f8sAaN8W0VP8hkzAEeHin3AIWwDRndX8KRVNL+MeJWHL
	o
X-Received: by 2002:a17:90b:3950:b0:37f:b0a9:1a68 with SMTP id
 98e67ed59e1d1-392822afd23mr27577046a91.7.1786414633045; Mon, 10 Aug 2026
 19:17:13 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 19:17:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 19:17:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <anp1I64K0KeyQuyo@yzhao56-desk.sh.intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-11-2fc18ee6d3ba@google.com>
 <anZ4W9o5pTWIEgMY@yzhao56-desk.sh.intel.com> <anj2bPrGqzZgZWMF@yzhao56-desk.sh.intel.com>
 <CAEvNRgFzRj_=GVy8T4P8ehhQjYomYxkngzwtKBF0iEL0Cv6fuQ@mail.gmail.com> <anp1I64K0KeyQuyo@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 19:17:11 -0700
X-Gm-Features: AUfX_mzvgcGJKhBZdH74z8--mi0L_iDlDHSTMM9cYEbuSUE6Lb98RLbbLhS37aw
Message-ID: <CAEvNRgFWcndQKJE_q+ZATFZEMYd=6uRLygozLvg7L77bPX0cEQ@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Mon, Aug 10, 2026 at 02:06:06PM -0700, Ackerley Tng wrote:
>> Yan Zhao <yan.y.zhao@intel.com> writes:
>>
>> >
>> > [...snip...]
>> >
>> >> > @@ -542,8 +576,21 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> >> >
>> >> >  	mas_init(&mas, mt, start);
>> >> >  	r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
>> >> > -	if (r)
>> >> > +	if (r) {
>> >> > +		*err_index = start;
>> >> >  		goto out;
>> >> > +	}
>> >> > +
>> >> > +	if (to_private) {
>> >> > +		unmap_mapping_pages(mapping, start, nr_pages, false);
>> >> > +
>> >> > +		if (!kvm_gmem_is_safe_for_conversion(inode, start, nr_pages,
>> >> > +						     err_index)) {
>> >> Note: conversion failures could occur if another vCPU is attempting to map a GFN
>> >> within this range.
>> >>
>> >> CPU 0 (setting attributes)          CPU 1 (attempting to map)
>> >> --------------------------          --------------------
>> >>                                  A: mmu_invalidate_retry_gfn_unsafe
>> >>                                     filemap_invalidate_lock_shared
>> >>                                     __kvm_gmem_get_pfn ==> folio refcount++
>> >>                                     filemap_invalidate_unlock_shared
>> >>
>> >> filemap_invalidate_lock
>> >> filemap_get_folios
>> >> check folio_ref_count(folio) ==> Not match !!
>> >> filemap_invalidate_unlock
>> >>
>> >>                                  B: read_lock(&vcpu->kvm->mmu_lock);
>> >>                                     is_page_fault_stale
>> >>                                     kvm_mmu_finish_page_fault ==>folio recount--
>> >> 				    read_unlock(&vcpu->kvm->mmu_lock);
>> >>
>> >>
>>
>> Thanks for reporting this!
>>
>> >> Retrying in kvm_gmem_is_safe_for_conversion() or moving the invocation of
>> >> kvm_mmu_invalidate_start() + kvm_mmu_invalidate_range_add() to an earlier
>> >> position does not help as long as CPU 1 stays at stage A.
>> >>
>>
>> IIUC CPU 1 isn't blocked by a conversion so stages A and B should
>> complete fine, and CPU 0 would already be retrying for other reasons
>> anyway, like speculative refcounts from elsewhere in the kernel, so the
>> conversion would take longer but it'd work out.
>>
>> Is that understanding right, that this doesn't completely break
>> conversions?
> It depends on the timing. The max retry count cannot be expected under unlucky
> conditions.
>
>> >> So, should we avoid this failure?
>> >> e.g., by moving filemap_invalidate_unlock_shared() from stage A to after
>> >> stage B?
>>
>> Not really sure about this, how will control go back to guest_memfd
>> after the fault finishes for guest_memfd to unlock the filemap?
> I don't understand your question. But I find this solution is less ideal than my
> below proposal.
>

When kvm_gmem_get_pfn() is called from kvm_mmu_faultin_pfn_gmem(), KVM
MMU takes over from there, there isn't another call when KVM MMU
finishes mapping the page into the stage 2 page tables back into
guest_memfd.

After stage B, how is filemap_invalidate_unlock_shared() going to be
called? Do you mean filemap_invalidate_unlock_shared(folio->mapping)?

I think filemap_invalidate_unlock_shared(folio->mapping) is a little
asymmetric...

>> > Or what about having KVM always treat gmem page as non-refcounted, and have
>> > kvm_gmem_get_pfn() put folio refcount before releasing the filemap invalidate
>> > lock?
>> > Below patch is applied and tested at the end of this series.
>> >
>> > From 8c2f29bc15bceb6a8fa103cf2585ec11354fd74e Mon Sep 17 00:00:00 2001
>> > From: Yan Zhao <yan.y.zhao@intel.com>
>> > Date: Mon, 10 Aug 2026 06:24:52 +0800
>> > Subject: [PATCH] KVM: guest_memfd: Return gmem page as non-refcounted
>> >
>> > Have kvm_gmem_get_pfn() put gmem page refcount before releasing filemap
>> > invalidate lock and return the gmem page as non-refcounted. This avoids
>> > gmem memory attribute conversion failure caused by temporarily holding gmem
>> > page after faulting and before completing mapping.
>> >
>> > guest_memfd always holds gmem page in filemap cache. TDX does not increment
>> > gmem page refcount when having gmem pages mapped in S-EPT. Additionally,
>> > as gmem pages are not swappable, setting dirty or accessed bit is not
>> > necessary. Therefore, there's no need to treat gmem pages as refcounted
>> > pages.
>> >
>> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
>> > ---
>> >  virt/kvm/guest_memfd.c | 5 ++---
>> >  1 file changed, 2 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> > index 2115e73e455a..e357b4ffa777 100644
>> > --- a/virt/kvm/guest_memfd.c
>> > +++ b/virt/kvm/guest_memfd.c
>> > @@ -1332,11 +1332,10 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>> >  #endif
>> >
>> >  	folio_unlock(folio);
>> > +	folio_put(folio);
>> >
>> >  	if (!r)
>> > -		*page = folio_file_page(folio, index);
>> > -	else
>> > -		folio_put(folio);
>> > +		*page = NULL;
>> >
>> >  out:
>> >  	filemap_invalidate_unlock_shared(file_inode(file)->i_mapping);
>> > --
>> > 2.43.2
>>
>> Hmm going with the above CPU 0 and 1 illustration, if instead CPU 0
>> truncates the folio and the folio ends up being freed, then KVM's MMU
>> has a pointer to a page that is already
>> freed. kvm_release_faultin_page() is passed the pointer to this page and
>> will dereference the page.
> Not really. It's just like KVM mapping non-refcounted pages.
> kvm_release_faultin_page() does not access the non-refcounted pages.
> The invalidate protocol also ensures no mapping of stale pfn.
>
> As below, if CPU 0 truncates the folio, it needs to hold filemap invalidate lock,
> add KVM mmu invalidate range, hold mmu_lock, zap KVM mappings before the
> truncation.
>
>
> CPU 0                                      CPU 1
> -----                                    --------
>                                          Save fault->mmu_seq
>
>                                      B1. filemap_invalidate_lock_shared
>                                          __kvm_gmem_get_pfn
>                                          folio_put
>                                          filemap_invalidate_unlock_shared
>
> 				     B2. read_lock
>                                          is_page_fault_stale
>
>                                      B3. kvm_tdp_mmu_map
>                                      B4. kvm_mmu_finish_page_fault
>                                          read_unlock
> A1. filemap_invalidate_lock
>     kvm_gmem_invalidate_start
>
> A2. write_lock
>     zap KVM MMU
>     write_unlock
>     truncate
>
> A3. kvm_gmem_invalidate_end
>     filemap_invalidate_unlock
>
>
> A1 occurs either before or after B1.
> 1) If A1 occurs before B1, B1 will find the correct pfn.
> 2) If A1 occurs after B1 and before B2,
>    a. if A2 is before B2, B2 must find the fault is stale, so it's fine.
>    b. if A2 is after B2, A2 must be after B4 as well. So, accessing stale pfn
>       in CPU 1 is fine.
> 3) If A1 occurs after B2 and before B3,
> 4) If A1 occurs after B3 and before B4,
> 5) If A1 occurs after B4,
>    A2 must be after B4 (for 3-5 conditions).
>    So, accessing stale pfn in CPU 1 is fine.

It's not about the stale PFN, if there's no refcount on the page
returned from B1, then after A3, the page can be freed.

Contractually, I think KVM is allowed to reference the page?
kvm_release_page_clean() calls kvm_set_page_accessed() on the page
(UAF?). Not sure which other KVM architectures reference the struct page
itself. Are we going to teach the rest of KVM to not reference and not
do kvm_release_page_*?

Would like to see what Sean thinks of this. Either way, is it okay to
follow up after conversions lands?

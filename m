Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CFA440A3A
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 21:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786395972; cv=pass; b=JYnk5XpLrpA4UCiI0++CTZyvUfNOp/bsfSywv4a/qHqOLEHwG7L9JNdtsxqHhRl8DTd/SoPBqubJB+5Gw5xbcNPX+HaanRaYPCC8oyPtCAkdShF70p9Fg6e94bnRpKGO6j1oUas7L2f/BjFg5VFey8xQVaTuY+qOExVQUtHhvT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786395972; c=relaxed/simple;
	bh=gI56oLo0KNbRow/rXskAuQ15iNl8L1CwTyWKdxDJ9vc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Content-Type; b=ZnCTufa7TufTcr18vS/P/8r6MtlVizmpVCAKx9+mMMFdBCs78axp6KUBUc8WYZjTuUobgW8+cRe9q2NxQ5k1s23oT4cAhQCVHqo+eIM4VeqvTkDVgyX/F2jCH0OI/5jkiXFs+eaNrMDs9Go7suggViGi9O68PooawmHq3ipESNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=chHkBcTV; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="chHkBcTV"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so1691890a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 14:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786395969; cv=none;
        d=google.com; s=arc-20260327;
        b=NqmcGX8DbG8M6C2bYbBCImk/VIQFh/9MYP5dwdCau5ItZdarQU+aPWmHzyQ5wWAuj8
         UVbW2keGF5xVk2qRrnZBl9dGSHgrmvg5YenYnpgety1a6FWIdZxudfmQZqXgXO8NakTw
         wPAl2QJSTdOVSxusghsX964ldNeFNSfEOHgpNyexL1a8gL8dtXJShbhClLXgzQmwLWek
         HVredNo9qUzkwFOSYU5rXcHD2T03MKZiRB2DQw/aimCLDv6Nep2Z9WtjgcnXBGAqCcmV
         2sbrvxsyCCsJB7WmHKwuvOaQSzOYU3WZ5bDVY8wj3SrMN0Jf+r2u/C0YSUA+aoYtIhUm
         VeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:mime-version:references:in-reply-to:from
         :dkim-signature;
        bh=jBbGpsBOXqFYnTikH0FoZ8DdjoKWQr2k7+SRpWv9uL4=;
        fh=aNf4HZR+tEFGTYSPiYahZ3LUQMfTvMcQyFYGlIS4748=;
        b=heMXbX3aMHuaJ0QQl+t8hcA7iCjdM2jpRDnA72ZTLB2zsm2hMkG6L48B/+baiD8YyH
         ji7XW6DQQh3RPVA8EIGCiNX2YhvIVerBb6bpoJ4l0CtuBKUil5x0nEpH9YnstvHpvJDb
         mARe14jHvoLBLiIdYDSIha6oVqdBXXe1oWd/ANsqw4O9A08PAslpieTSU1Xj9rGwyqge
         NqYAv3GhRjG+w0EeJezWULRt2MZyTRyGHcNaYW37lUqInq0C9b8H5e90E9cYdTq0/2N+
         S7XjwJ1J7S3QIZd+mRF9Dv0ijz3lWxEJJ8PvX7LbnWaqR7+oHnbF2OTGftcoweUjtjGI
         Wuhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786395969; x=1787000769; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBbGpsBOXqFYnTikH0FoZ8DdjoKWQr2k7+SRpWv9uL4=;
        b=chHkBcTVegynp9fkddzQzywbl6aWtS4qaMXEG7wSopjfm1GqjSmO0sTScUZaKZ4p8Q
         wTTNt+3JxYehOVHERyNeWTHRFSV7wMzvtGP95WjHNXVreUFieuLTOTheavxG37XTrtf2
         x3HxQOnWfJ42UogUe1jI76trnhVACjmNeeuatdQQzGMgpFewY93jgp1U/3X6EiqB9E9G
         WZ80lN9lmdW9juyPnDFYXzmBCZRPV5dgy6lL8YDYYEAzoYLaHklWWu4tcke+/RqEVKGJ
         tGRWRpnlZKvb1CccI2rigqmyHImvgxiLvDdvq7JY9FnsipwYcEMZpDUPYMtjUzXQKAmA
         IeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786395969; x=1787000769;
        h=content-type:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBbGpsBOXqFYnTikH0FoZ8DdjoKWQr2k7+SRpWv9uL4=;
        b=moeGAAAH403vZUofDH2+gwco/hZmjVEmmcRVoJ29gf+nshy2NMdT1st6PSfFdEXhXz
         HS/KcfRGKMZ3Z/ADj1/TR535rhvLM2OCIsLctdWCyHL+O1ssv7zNA3eqG5GIq5IKued2
         aFfc4KwJEL+1b0+mSGeEV4dA39x41UMHQWlPbvIBix45lqK9dMfSd1+nReeOEXMJILw4
         39F8HYjEDHcDsr735t4cg7IS6OZ09I+/b+2L1JXBQ8+SwbvBBrA9Iwtne56SgIXWKI9E
         r3MbVhKdcfsyR0ca8KrtCMJ6tcRq44taecO5UVHtbVrIWdqqf7/JcHvja9a9Vd10eKRQ
         6qEw==
X-Forwarded-Encrypted: i=1; AHgh+RpuOrwHDjWJtKRqnq2/BnkGaV3qTmkT04THmccJn114DjKQ/m7ECfJvNCJq8NqY9lqz6X/1aJQt4+bq0UU3hjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG19OIGi7ydqEgTd7j8Oax9Mm6eGl2IoYBwvc9w+if+EFKQdNn
	mTSP/HGmal6v/fM6oJGSE+/vdpVrUVUYiZubQisfR4JeSnfU7w/rjWhwC+AzkA721kawOVEivYV
	cSLDkAa2WN+U5GRwZhKkVX14M3EsgSHLc3ElULf5I
X-Gm-Gg: AR+sD12WMmUJi+6I0muSXV1Zm1K7n6nuj0qC1xNufC53IzAEuv9hDsODffNn2ZcfE+P
	G9uaiBJh3eNyIrSqWq8cM/+iNczyUQnDWqnw+sWdv2kzWvoBMXR8EEmG/ATeGjl6ux2rhBT8DP0
	rGD+OyfMzrECNkLEBO5o1trWe9YOgRWPMFwprrwVE34w1nrB/WOt5sefCnkm7LKPIj5GUvc5Uvq
	f8enoGU79dY3QVHqS1d6X7U0N0eMfiaWjv0woZ5dtkVooS7+6oUFvED/AJ7l4IhyAnHU5FXeweW
	00BgfDRCSvzXmBVAR7hQHpX68RWcNOCZ5PFnsP/vysEumtw1iMre6xZudKQGwLJgjzRD9cmTOS5
	ZXeZQkglnm8B840VHT0qWdiqrl+bWPq09/Hk=
X-Received: by 2002:a17:90b:3847:b0:383:f52b:d616 with SMTP id
 98e67ed59e1d1-3909d89bd69mr24868036a91.10.1786395967805; Mon, 10 Aug 2026
 14:06:07 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:06:06 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:06:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <anj2bPrGqzZgZWMF@yzhao56-desk.sh.intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-11-2fc18ee6d3ba@google.com>
 <anZ4W9o5pTWIEgMY@yzhao56-desk.sh.intel.com> <anj2bPrGqzZgZWMF@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 14:06:06 -0700
X-Gm-Features: AUfX_myPYbMVlta00ya1-5ZhE7lDWW0LOnyJR-gHZaPeDATx5xIvNNK-iJcLcsY
Message-ID: <CAEvNRgFzRj_=GVy8T4P8ehhQjYomYxkngzwtKBF0iEL0Cv6fuQ@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: Yan Zhao <yan.y.zhao@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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

>
> [...snip...]
>
>> > @@ -542,8 +576,21 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>> >
>> >  	mas_init(&mas, mt, start);
>> >  	r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
>> > -	if (r)
>> > +	if (r) {
>> > +		*err_index = start;
>> >  		goto out;
>> > +	}
>> > +
>> > +	if (to_private) {
>> > +		unmap_mapping_pages(mapping, start, nr_pages, false);
>> > +
>> > +		if (!kvm_gmem_is_safe_for_conversion(inode, start, nr_pages,
>> > +						     err_index)) {
>> Note: conversion failures could occur if another vCPU is attempting to map a GFN
>> within this range.
>>
>> CPU 0 (setting attributes)          CPU 1 (attempting to map)
>> --------------------------          --------------------
>>                                  A: mmu_invalidate_retry_gfn_unsafe
>>                                     filemap_invalidate_lock_shared
>>                                     __kvm_gmem_get_pfn ==> folio refcount++
>>                                     filemap_invalidate_unlock_shared
>>
>> filemap_invalidate_lock
>> filemap_get_folios
>> check folio_ref_count(folio) ==> Not match !!
>> filemap_invalidate_unlock
>>
>>                                  B: read_lock(&vcpu->kvm->mmu_lock);
>>                                     is_page_fault_stale
>>                                     kvm_mmu_finish_page_fault ==>folio recount--
>> 				    read_unlock(&vcpu->kvm->mmu_lock);
>>
>>

Thanks for reporting this!

>> Retrying in kvm_gmem_is_safe_for_conversion() or moving the invocation of
>> kvm_mmu_invalidate_start() + kvm_mmu_invalidate_range_add() to an earlier
>> position does not help as long as CPU 1 stays at stage A.
>>

IIUC CPU 1 isn't blocked by a conversion so stages A and B should
complete fine, and CPU 0 would already be retrying for other reasons
anyway, like speculative refcounts from elsewhere in the kernel, so the
conversion would take longer but it'd work out.

Is that understanding right, that this doesn't completely break
conversions?

>> So, should we avoid this failure?
>> e.g., by moving filemap_invalidate_unlock_shared() from stage A to after
>> stage B?

Not really sure about this, how will control go back to guest_memfd
after the fault finishes for guest_memfd to unlock the filemap?

>
> Or what about having KVM always treat gmem page as non-refcounted, and have
> kvm_gmem_get_pfn() put folio refcount before releasing the filemap invalidate
> lock?
> Below patch is applied and tested at the end of this series.
>
> From 8c2f29bc15bceb6a8fa103cf2585ec11354fd74e Mon Sep 17 00:00:00 2001
> From: Yan Zhao <yan.y.zhao@intel.com>
> Date: Mon, 10 Aug 2026 06:24:52 +0800
> Subject: [PATCH] KVM: guest_memfd: Return gmem page as non-refcounted
>
> Have kvm_gmem_get_pfn() put gmem page refcount before releasing filemap
> invalidate lock and return the gmem page as non-refcounted. This avoids
> gmem memory attribute conversion failure caused by temporarily holding gmem
> page after faulting and before completing mapping.
>
> guest_memfd always holds gmem page in filemap cache. TDX does not increment
> gmem page refcount when having gmem pages mapped in S-EPT. Additionally,
> as gmem pages are not swappable, setting dirty or accessed bit is not
> necessary. Therefore, there's no need to treat gmem pages as refcounted
> pages.
>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  virt/kvm/guest_memfd.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 2115e73e455a..e357b4ffa777 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1332,11 +1332,10 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  #endif
>
>  	folio_unlock(folio);
> +	folio_put(folio);
>
>  	if (!r)
> -		*page = folio_file_page(folio, index);
> -	else
> -		folio_put(folio);
> +		*page = NULL;
>
>  out:
>  	filemap_invalidate_unlock_shared(file_inode(file)->i_mapping);
> --
> 2.43.2

Hmm going with the above CPU 0 and 1 illustration, if instead CPU 0
truncates the folio and the folio ends up being freed, then KVM's MMU
has a pointer to a page that is already
freed. kvm_release_faultin_page() is passed the pointer to this page and
will dereference the page.

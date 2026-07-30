Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920C43FE640
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407765; cv=pass; b=u/lkbZgkeJsTwEPjs5+k8mx6+0WzBvh6MyD+ZXnvT4uduisGiVExwQfbzuCf+ACCbqwsSbTFXBsQStbOPe57sq7okygF9mBX90xRt5yHRN4Vxv5RTUYrbcdR+p2Sb4MZU9C1AZo4lNcF512zn2z3KJHyhuH21L76pWkMTf1t1VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407765; c=relaxed/simple;
	bh=lN5P2U6zU77+d38S81rcqTKY2nPem/l6z4v0pII5/Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1XJ1e2BuHuE33EjsLadOJg/w3Bzw5qAnqXEsov7bEwKRJ/SbbMKWeUB7hQImz1hOKQBehKKaKUy1Jh0Kk7qkGd+SAdamJn5f+jObo+UCW6yZBkV5gkaAAz1QoPUWVbcttUrO2VAZ+6OkevAwlysn8g9PK2AgAIHG8UOe3+25Vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eCdb7hQl; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eCdb7hQl"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c01c79467so255811cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 03:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785407761; cv=none;
        d=google.com; s=arc-20260327;
        b=IuAcoX0hpLHuqfQES2Oih1oLstr1XDR00x6/QwAkSrk7/+BaYuQsY0bqKc22zpnIJs
         cq/q5efvqbsYZUDJKgPqERHV+qZR/NNlRklVtZ8+fagtxm829pEiooB7/76erq105OSd
         fUV4evTcOWcqYobUcLEDgi+/hLBOKerokEcv9nUVAYgDPWpw2V2UOTe/i+HZ9HVNJ0a9
         tu5/R6FN1/uKUu6fhvmwuzvUBkuZCwuQQFejnXEBMsKx/jl9mViTkC0baKbl1TgWlIq7
         nlQGxbeRsfq71lFjO5EqVsdr37FclvpdXpKKGvtAH6NPVq0u+jOG9hTmz+CdhUDwyw62
         dpDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SOOBkZJwQCWVQFO2bew9xlSgUrM3XWnbKBiotDY5lMU=;
        fh=j8HBJKSdeZ2embPhF8DugHj+CYBYZox5SBJh45/xE6s=;
        b=EMiQ0baMdLW7tMDxSwrmiUaZyryyDCEfWBz6C3yj6xsZsnVF3FXpgJOHe4qwl9ekVw
         91CC20mr4crEhJHD37/jxO/A1FITU4p1SF/KzROQNHmJF3B2KzmzCZKi5ApyFgKbvFzC
         l0uXoNUuapdeY3m3SsAbRfqTmgIK5g/+4CDvJx/WFgK/nSG+cJWqEyEYN/DUNFavbZkt
         41d2ed/1MfmbQGEvEQ9iC23VQ0MUK0ZF09zJ6+L6VzSn33GJ1uS1B4PFA5uXZlDOh8Ny
         s01ghf1zHF1fyP3n4WVPjTjuU9t6wW6Mop200ECTzP/XDBAKd/cnQG8cjRl2ILCdYlki
         vkiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785407761; x=1786012561; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOOBkZJwQCWVQFO2bew9xlSgUrM3XWnbKBiotDY5lMU=;
        b=eCdb7hQlCy51cfk6yQiIIYk2G5r8XrYjHOatiEVyhKpizERUphkiD8WfxMuGjzGarX
         //90Tt2kbTn7NzZ2nZ+yHxNgRHxkTdZA7kPR5Zh0HcSSI6IguxuBG2to4ELkF1HF6X4I
         TLKP5EFtUUhBRkk6KwY+/YZVxvPjxKU69tlGYw7hDfQUII8dZ6qD6tfhg3SFhiqM10ju
         vVQbyqG0cj5F+RxW6ey/Hl+XPXz8eCLHj3LFYOCWxFqO0r6b7RafgHV1fAzdfrL8iTR0
         S2O9CLs1oS0tvq+IUv8Mx+ag9bxpum1r4Jld4USr4HnH3rzOu3AhxbsnGQyxxFcUED9W
         dfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407761; x=1786012561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SOOBkZJwQCWVQFO2bew9xlSgUrM3XWnbKBiotDY5lMU=;
        b=AwCSAnl7BL38UN9bLcF4J5dT5oxcfbvXUM3+46SYkWRXb3yRJoEMxqj5FbpktFfcRK
         rk9bHah44JVNX/vQ0qdnLSn1IJignvxs+PHe+htqc0zscOz1ua4chKbiPFh00aucHoXe
         lAfJGRXafUBRjYd3MXV9jNK+h2LFJVgHqQb/CxnVwquExOJsafQ6gX7zlWw4E+FI31LV
         tn+csV/G+7cBMZLsj2v8po9+1CoD3XcFS35ab0uYsJAnrmU3zfucp83qdTecSkK4030Y
         ZTvJqp34iPfeFTXAfenAIO+k1FJ8kx1lo1dSdixEixXduLuJTLsGP0wL0/nerF+o2Gmn
         ep5A==
X-Forwarded-Encrypted: i=1; AHgh+RoZagQ8ZMFRb4bG821Dguj5Tu3kmhHnv6QT4u8T47mC9JU8fa1LfCIX0IxOMha6x+oFmVFsgIN8danzY/D2/9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvhwDBCIVqyA0AKEsMOiyjIvXyxvyEVUa1ivRD0+yv8QQT4gTE
	XXasAMT58DSxiDBPcTeG3hoguUZ0Drx1F0r9D018f7nJVT2FOC22qhA/2ylKgpVr+mvuMRNBNDg
	Cy9XwEsQveWnylu2S9LOlzwdz7UjkpOORwQ6e1cRP
X-Gm-Gg: AR+sD128FrQkQSQKfflXvfLI9knbGDz5fQQA1NTme5mAoU0VnehQ1ZbNIOmHrqiEr9A
	zcXt3DhZFfromgXw/9cduy0YIWtWfAf0mtDgpRpJpwpC/iZRiQxwoPoHuuMfbQmnr1HLSrBHPtt
	AHxpyjF+rRkgcVHaEBjuMW7JaxW6QehA20sA34+uCEBP6woYBVc45517w1+lSnjlBZX3pgEUnaO
	0Yz983sxRUEho4d8wVLKl2Ju1zhRNxtTNtvey0DJEbAHhhdGhrb55RvLWDF4zrgX3WJ7+wz0Wqa
	Y45xTTbluwLL8jHKM4RP7WkIZATihkzxdFXCeYXz0eKC
X-Received: by 2002:a05:622a:e198:20b0:517:64f6:3365 with SMTP id
 d75a77b69052e-52b391602aamr11675091cf.4.1785407760987; Thu, 30 Jul 2026
 03:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com> <20260728-gmem-inplace-conversion-v9-12-35f9aec2aed2@google.com>
In-Reply-To: <20260728-gmem-inplace-conversion-v9-12-35f9aec2aed2@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 30 Jul 2026 11:35:23 +0100
X-Gm-Features: AUfX_myxKBJR6h01nzpu_vZoQunkdC1wrGyOxOE_3W2zA3Dduo4yuXfuFwjgfug
Message-ID: <CA+EHjTzypkaq3qUpLeFM3k96QtFSMZMPW4Y+AA_A0WUo1u97Vg@mail.gmail.com>
Subject: Re: [PATCH v9 12/41] KVM: guest_memfd: Call arch make_shared callback
 for to-shared conversion
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Wed, 29 Jul 2026 at 01:35, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> When memory in guest_memfd is converted from private to shared, the
> platform-specific state associated with the guest-private pages must be
> invalidated or cleaned up.
>
> Iterate over the folios in the affected range and call the
> kvm_arch_gmem_invalidate() hook for each PFN range. This allows

I think this line is left over from v8. The patch calls
kvm_arch_gmem_make_shared() now, and kvm_arch_gmem_invalidate() no
longer exists after the reclaim/convert rework, so the changelog
describes a hook the code doesn't call.

With that fixed:

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> architectures to perform necessary teardown, such as updating hardware
> metadata or encryption states, before the pages are transitioned to the
> shared state.
>
> Invoke this helper after indicating to KVM's mmu code that an invalidation
> is in progress to stop in-flight page faults from succeeding.
>
> Omit support for calling the arch hook to make private, since SNP, the only
> implementer of the arch make-private hook today, would actually prefer
> making private only just before faulting memory into the NPTs.
>
> Calling the make-private arch hook would require iterating both bindings
> and the filemap to find the intersection of bindings and allocated
> folios. On top of that, SNP would need to figure out whether to actually
> make private based on whether the memory is about the be faulted, or
> whether it is a conversion.
>
> This does leak SNP-specific details into guest_memfd (as in, why only
> make-shared during conversions but not make-private?), but the additional
> complexity is not worth taking on until guest_memfd has a user actually
> requiring an arch make-private call.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  arch/x86/include/asm/kvm-x86-ops.h |  2 +-
>  arch/x86/include/asm/kvm_host.h    |  2 +-
>  arch/x86/kvm/x86.c                 |  5 +++++
>  include/linux/kvm_host.h           |  1 +
>  virt/kvm/guest_memfd.c             | 42 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index 5cb132eca3c35..8e0d6970c43b5 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -149,7 +149,7 @@ KVM_X86_OP_OPTIONAL(alloc_apic_backing_page)
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
>  KVM_X86_OP_OPTIONAL_RET0(gmem_make_private)
>  #endif
> -#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_RECLAIM
> +#if defined(CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT) || defined(CONFIG_HAVE_KVM_ARCH_GMEM_RECLAIM)
>  KVM_X86_OP_OPTIONAL(gmem_make_shared)
>  #endif
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 9fdf13b071097..ceb2abf43b76f 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1730,7 +1730,7 @@ struct kvm_x86_ops {
>         int (*gmem_make_private)(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>                                  kvm_pfn_t nr_pages);
>  #endif
> -#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_RECLAIM
> +#if defined(CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT) || defined(CONFIG_HAVE_KVM_ARCH_GMEM_RECLAIM)
>         void (*gmem_make_shared)(kvm_pfn_t pfn, kvm_pfn_t nr_pages);
>  #endif
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 3308d58342955..52de3ec7c7f73 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10639,6 +10639,11 @@ int kvm_arch_gmem_make_private(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>  {
>         return kvm_x86_call(gmem_make_private)(kvm, gfn, pfn, nr_pages);
>  }
> +
> +void kvm_arch_gmem_make_shared(kvm_pfn_t pfn, kvm_pfn_t nr_pages)
> +{
> +       kvm_x86_call(gmem_make_shared)(pfn, nr_pages);
> +}
>  #endif
>
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_RECLAIM
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f408746d315f7..47f633cddffe0 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2612,6 +2612,7 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
>  int kvm_arch_gmem_make_private(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>                                kvm_pfn_t nr_pages);
> +void kvm_arch_gmem_make_shared(kvm_pfn_t pfn, kvm_pfn_t nr_pages);
>  #endif
>
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index d3c813dcbf96d..612fcde4ae8ea 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -563,6 +563,43 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>         return safe;
>  }
>
> +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
> +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, pgoff_t end)
> +{
> +       struct folio_batch fbatch;
> +       pgoff_t next = start;
> +       int i;
> +
> +       folio_batch_init(&fbatch);
> +       while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
> +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> +                       struct folio *folio = fbatch.folios[i];
> +                       pgoff_t start_index, end_index;
> +                       kvm_pfn_t start_pfn;
> +                       kvm_pfn_t nr_pages;
> +
> +                       start_index = max(start, folio->index);
> +                       end_index = min(end, folio_next_index(folio));
> +                       /*
> +                        * end_index is either in folio or points to
> +                        * the first page of the next folio. Hence,
> +                        * all pages in range [start_index, end_index)
> +                        * are contiguous.
> +                        */
> +                       start_pfn = folio_file_pfn(folio, start_index);
> +                       nr_pages = end_index - start_index;
> +
> +                       kvm_arch_gmem_make_shared(start_pfn, nr_pages);
> +               }
> +
> +               folio_batch_release(&fbatch);
> +               cond_resched();
> +       }
> +}
> +#else
> +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, pgoff_t end) {}
> +#endif
> +
>  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>                                      size_t nr_pages, uint64_t attrs,
>                                      pgoff_t *err_index)
> @@ -605,7 +642,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>
>         filter = to_private ? KVM_FILTER_SHARED : KVM_FILTER_PRIVATE;
>         kvm_gmem_invalidate_start(inode, start, end, filter);
> +
> +       if (!to_private)
> +               kvm_gmem_make_shared(inode, start, end);
> +
>         mas_store_prealloc(&mas, xa_mk_value(attrs));
> +
>         kvm_gmem_invalidate_end(inode, start, end);
>  out:
>         filemap_invalidate_unlock(mapping);
>
> --
> 2.55.0.508.g3f0d502094-goog
>
>

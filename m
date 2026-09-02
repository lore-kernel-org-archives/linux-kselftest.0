Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410C73644A2
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 02:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315686; cv=none; b=fMH/fZKauDtayVdXkA+Adjhn9PObogShVozFxwQflFkqa/muOPgICaczsOb+Gz+7jHwqvtP1TExQHYidGsB/+d+sN1IJ8m/VrYK9HwmOYs/WLf4TxueF67V6duD3wX/8qU6iNpdXjw7+IBB4TECGRoBpm4qKxnuxlFb3N/n5sNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315686; c=relaxed/simple;
	bh=dMv4nlHu8Y249mLMfP00bq7DYL6IzUHigBCjVTtONZg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PSpXQf5ck6E+y22mdu7P8sEqpO5Pn0Yuq2rDGIAYENsZooNeGgDbw6xe3nrM8jgJgUbEvqzvvgW9J5t/tZeLMQcwpVF32sagw0Vrd+XUhnx/psAY79G20f9Qn9af0mnjYBXvuiKts4SFFm97uLkRlmLmbMRLYqQC0riq3E9te9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=meLSm2rQ; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="meLSm2rQ"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-867a943b149so11921107b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 19:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788315684; x=1788920484; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GP2nihoXTh44eq0onDqBGjACptMCLq276d/ZwwaKLtA=;
        b=meLSm2rQNh+3UVY1uUdEjjMfsuClBtztj7u2+Tyeq5hpPRLDsRnLTzMjAFEXNA22Cp
         OlRM/CrYljMqUZKdlY22Ltu4/786tcDa9kBNMUmHjafmJKGCJMW0FMaXbz7/nia6010A
         Y00BkzuWN/1i302PQLhgTqjysmRQEEZ6ZSxmDvE7PSJq5i7ughq/fgwIzihqdiBvxlho
         wTNerakvDwMdKpY0ReezEeR6O2lwFCaxhVkst9NV7Ev3uFskpWIBUvM+9lSELqeI+Dsm
         zvrum3dxAWwBGqyWXgtNUQd+TSiS8kmT7jWa3WIZs7Ys5r5tXN6i9Ds6yK3CxOKCG/BF
         yJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788315684; x=1788920484;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GP2nihoXTh44eq0onDqBGjACptMCLq276d/ZwwaKLtA=;
        b=jriCXwYEBF7hwPZOnh2pcVv/c244vioCwTMiHPoKJgWClHNwrkGLchc2aMnOrLWZOu
         uPS7iccY8fDVbxqL+79aPPAaRvvYam3PmmbIy9sx99youSxBVuv8siogqoCw6mfADMfb
         TF9X88+B2UUDqWoScOyyBIdEKvcB/1W4eV1JmwOH5v97OjOcbuYQMjI3z0HbqX3QVmrD
         rnlnjabx44j9MhG00POEIPRmy5vJvFT/vh7iPBdYXGrhOQ4DklrN0/h207sSdl485oKS
         +GSKDelE/GPuYXcCKLh/jOEOLYZQpz8Amcz1kBNZgXTQwPAYrjZ7sbMs58sw3olQPvZV
         PN6A==
X-Forwarded-Encrypted: i=1; AKwUvBxkg4VsebTR9ezwljQJWpbRsVJzvnD/EHfa5zTaDAYDDc6x63X1tvewD+totIwppIggPrlZxdzJQv6iqRb07Zk=@vger.kernel.org
X-Gm-Message-State: AFuF++nIu/QacGzA95xltkiZsCbfc+/v5AP38KCsCsBAeDjofBW8fc4F
	uFnkhzWZbUisMpmuBeEOBPpRA3d0shaVDYjlkH24rtyUVnZ/48Env0uLReJaYL8TRg==
X-Gm-Gg: AYBFou1cUZP12rMmf6TPfG/eXyKFSgeNpLR4RKKmmHI7nbnBUed+kPCgNatDyhqRZpt
	PN8ZNWK0LBdjyVZznKm/zT5htOcMfVsjf7ucGQkyBLzwrtrYl0yZmD3Yd7VwngD7RXMUDN6pvEE
	qpZ2lQoLSxgSpJhfPNvaKzsybdYjvtcFg4owgedetN0KhvPp7Acgi0mEzWBM8FF0v8U09A0hWmz
	DY0VPpMxnqEpzdr+i2y1t647zi/YV7u/iknpvM724hMyJ+grDw/bDk3/SWZZDwAv04ZFl3ZG72c
	yeIEGqEtey2p0JopYBB1JzUGOv1GOiEuVMbrqtXL5zZx0F4SXZhNMNaFeRyX+POQSZR9KtPlTOo
	7v2BfeBZ16CYpB3mWrJ7F2HlIbDbFA4XSiTuNrb7mkldGDfrBxs/vulyD4SclHomOLM2aDA79Q/
	Qk57nKHztFjybNLPJ9tk5UZ4l6l887e+lzo/q/kcMSS/dY7V725Dn4ksNc8F9MbYxu56F/X4wUC
	Rdogz2hsg3xz0nbYiRB3lT4xLaPUt0l6OrUfF+BimINF7cx
X-Received: by 2002:a05:690e:4419:b0:66f:7d51:b5ef with SMTP id 956f58d0204a3-66f9b90a9d6mr365005d50.3.1788315681539;
        Tue, 01 Sep 2026 19:21:21 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f986b612esm893663d50.21.2026.09.01.19.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 19:21:20 -0700 (PDT)
Date: Tue, 1 Sep 2026 19:21:05 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Ackerley Tng <ackerleytng@google.com>, 
    Andrew Morton <akpm@linux-foundation.org>
cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
    brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
    jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
    oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
    rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
    steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
    yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
    suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, 
    Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
    "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
    Masami Hiramatsu <mhiramat@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
    Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
    Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
    Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
    Axel Rasmussen <axelrasmussen@google.com>, 
    Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
    Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
    Shakeel Butt <shakeel.butt@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
    Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
    John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
    tarunsahu@google.com, Randy Dunlap <rdunlap@infradead.org>, 
    Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
    Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
    kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
    linux-coco@lists.linux.dev
Subject: Re: [PATCH v12 18/45] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
In-Reply-To: <20260830-gmem-inplace-conversion-v12-18-85e5fd25252a@google.com>
Message-ID: <bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com> <20260830-gmem-inplace-conversion-v12-18-85e5fd25252a@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 30 Aug 2026, Ackerley Tng via B4 Relay wrote:

> From: Ackerley Tng <ackerleytng@google.com>
> 
> A guest_memfd folio has no outstanding references if guest_memfd holds the
> only references on it. Any other references on the folio may indicate
> another user, and guest_memfd cannot convert it to private if there may be
> an existing host user.
> 
> A folio will have outstanding references if it is present in a per-CPU
> lru_add fbatch. guest_memfd does not actually participate in LRU, but
> freshly-allocated folios are still added to the lru_add fbatch for batch
> LRU statistics processing.
> 
> A folio may also have extra refcounts if it is on the mlock fbatch.
> 
> These two known "usages" of the folio are handled by calling
> lru_cache_drain_for_folio, which drains both the lru_add and mlock
> fbatches. After draining, if the refcount is still elevated, then there are
> truly outstanding references.
> 
> If the page may be dma pinned, DMA is using it and hence there are
> outstanding references. folio_maybe_dma_pinned() can have false positives,
> but that's only with a significant number of refcounts, at which point
> draining LRU is not going to move the needle - it can still be concluded
> that the folio has outstanding references.
> 
> If the page is still mapped after guest_memfd tried to unmap it earlier in
> the conversion process, it also has outstanding references.
> 
> Return true and exit early to avoid unnecessary draining in these 2 cases.
> 
> Provide a drain status to only drain once ever while processing a batch of
> folios.
> 
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  mm/folio.c             |  2 ++
>  virt/kvm/guest_memfd.c | 30 ++++++++++++++++++++++--------
>  2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/folio.c b/mm/folio.c
> index c02dcea9c03c2..50a6dbe55998e 100644
> --- a/mm/folio.c
> +++ b/mm/folio.c
> @@ -33,6 +33,7 @@
>  #include <linux/page_idle.h>
>  #include <linux/local_lock.h>
>  #include <linux/buffer_head.h>
> +#include <linux/kvm_types.h>
>  
>  #include "internal.h"
>  #include "page_alloc.h"
> @@ -926,6 +927,7 @@ void lru_cache_drain_for_folio(const struct folio *folio,
>  			*drained = LRU_CACHE_DRAINED_ALL;
>  	}
>  }
> +EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio);
>  
>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>  

I don't mind about the virt/kvm/guest_memfd.c part of it, but I'm finding
a KVM patchset modifying mm/folio.c there hard to deal with: and notice
Sean also suggesting to separate this part out.

As you know, I've worked up a patchset "mm/fbatch: drain lru_add_drain()
and _all()" which finally removes the problem lru_cache_drain_for_folio()
works around. In the initial version posted a week ago, there was no
lru_cache_drain_for_folio() in the tree. Now 7.3-rc1 has it, so I
intended a replacement 13/25 in my series, giving you just an empty
inline lru_cache_drain_for_folio() stub (and enum lru_cache_drained)
in linux/swap.h.

But that won't work for you, if you're adding an EXPORT_SYMBOL_FOR_KVM()
in mm/folio.c, and of course conflicts with my removals (in context both
above and below your EXPORT line). It's easy for me to remove what's in
mm/gup.c and mm/folio.c, but I cannot remove what is not yet there.

I've wasted hours on this, hoping not to trouble either of you; but
seeing now that I shall have to rebase anyway (an unrelated mlock fix),
I'm electing to take the only clean way out: I'm going to submit this
mm/folio.c part of your patch to Andrew tonight (with a shorter Cc list!),
in the hope that it can be accelerated into 7.3-rc2 (or at least get an
mm-stable stable base-commit id) which we can both work off independently.

Whether that's acceptable to Ackerley and to Andrew, I don't know
(just as we don't know when either of our patchsets will go further),
but let me try.

Thanks,
Hugh

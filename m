Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6218B3DBD72
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278936; cv=pass; b=oUwCrLzVZWaZwPruQ0BtSchR2LeeU1t8UOwzZwSYzIiOViDiEZEpub/1+ZDxr4EJG1UxW2aJ77DzAOBX98dCGT8RFLU2EzbKwT0LbRqYDYFKjjo5qmV11tO8v8zNmfgUV8Y9lTG8dDS4mSTrR41vNEYNKfdGdYTtKa8Kt+HPo9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278936; c=relaxed/simple;
	bh=NP+Bm/TkJcZUUZNKc8UFgfwADzoe89pmcwPJCKU5qNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQIKrYcDS7IiTUe043m9NogXkYNCKUexYSxfWd1MYdbavIFOtQlyKNQ320I356jGeh0aRavzio35fiu28OhZvYDztZBGqWyImLZsVNiqxs1DezRUgxNpy3xRBhxqbOK7OMKxZp0dzrj38ZKUddW96Wa37g5ttxXuxEHomakBvZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BAYPnjIM; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BAYPnjIM"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d864c23bdso8551cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 05:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779278933; cv=none;
        d=google.com; s=arc-20240605;
        b=RWyYnehI5JfwRh1kF4Fxs97h9Ju1XQhcNT2ZVL1oq3JjWDA2d0v1wXqBigtHh6gq5O
         3tdXttG6BmwZiS2gJA3UmETqSCLaP6IFpoz8vO2buJORm0jwkRKgmf7D3tvROAJwGxfq
         4YossMOyXnmFgwsG3aUyMGS0RJ/oAihD9q6mRfkx/+DBvRfRRoteJKCcCvrE3kNuNaVj
         i3pfWM3AP5HX2WakE/HdqO+HoZZA18kM07XfWVV5LElRvc9euEGEH1Td0jWdHvRi9PEe
         UuT95SglIzS5dUMPd4NdXoA5O2BpZK9ptFeh1FwdSUQo76vUYCGmisARtVlKFI2nIDn/
         EOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0e+G9jJA0Qdw1DFvqZm8i4ZRk5ML+liKRoq2xKwcnGc=;
        fh=ph3HaxWSSEf7qb7m8pb7P1Ma0KppesRmnyBvDYosQ8Y=;
        b=ifVwhWbKwVx3AgId0BaVwYbcDq7XbK+zQFyCUBtq4jR7j1/xX9b4MGahHqoTDxbyXY
         Gi7+2ZLODQJ6AoBSrYWyWjRcREp2e7spmFe8swRsNvFRslyy9xVNFjmTZ5yv3nxM4PX8
         dy4ieiLz4hsIEl+g9xRR1d0HvrNq6H3kWi67DILA1SizuEeeDGOqr8OmW18ZjFCqlnXT
         nECebfo47tt+HM0UFyV1xTngQ1CCzfYZi9/IPQM8g5JUxH+P+armxnx7fGmcm7ufXFqd
         tz8wZQQgcBqva5QB6dLkLaZC33mKh1xz2jA/NJ3v5qTkBEnV4P8i6OjMml3uUE3rqlol
         9Urg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779278933; x=1779883733; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0e+G9jJA0Qdw1DFvqZm8i4ZRk5ML+liKRoq2xKwcnGc=;
        b=BAYPnjIM1dncEk2Gy8exCWvlnvRZvG3Ot0dHOC6ECIfu4rULFkMrL3HiFhFOVxPTeW
         Z9clF/W288a3Ba/Zw2qtoDcu4QeYDyKgXjufV5708LjstjenHgneGQ04fpuv23pE/VpT
         A9iATvuZ8IrSFZKBvRJ9yO/otD+8sMaTMkLkDq3gGsxP1rsgZ6J74SCHdI+D8ZZYIrCP
         dz5J+/FYKSAiB0nEmsf+Q492JSVebmsMUEnn9EfKACSKPPuPn75ugrkrcWaBeCWkvZ9/
         ByNCVpA7KoroVyovmuVpnYuE5Irb7JBCQd/Pm2Vdp1O4ZuGtehQaTAa2Fg/zjny5nkAN
         JhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278933; x=1779883733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0e+G9jJA0Qdw1DFvqZm8i4ZRk5ML+liKRoq2xKwcnGc=;
        b=VFnQokT4dhAddRvZbhlCupdUregm5HBY9JV6YY6OGaD9U2lFTD5ruc0psegSH1pjiI
         vKfT1kdtvA/BPC5ZkBjqdGzXzfFuR29+ArDrUzA7Nuf9yedlTi3quMZ6si0PWS2By+rh
         8YiTDjGbZkKrI2z72lZwyOBMO1lY7HC4aoRynVA4kkv8w9xJV2Dpn/K2D6bG9lxsdzr7
         pc30C44eYJVRiyqe+c1YsN6ygUhQXnu+J2zGw/3nRFY75r8p2PSsYsWKvIgHUlI3vhUq
         1gddv6cahhcmeW+jU5dPzUuZizseAD24W52DCM+PMUc6S9UhCkMwwCN67gmVdfam26Y0
         9CLg==
X-Forwarded-Encrypted: i=1; AFNElJ9rzYi57Lf9IeA/HKdUif/jBFI3lb028ipS7md5fCPgg1pbD1ZJSh0RzN72cfdFNfJso3qU+29NgOnwATiid5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78LntDyiV+r9D/c0lWx5Kb+fDgFH7PCnbW+5h8MKz9MxuPnuZ
	fVeiqom22TeMLS7d+ceRhEguWFsQUbWh4b1Bnw2ohn+znbtbz+OyUsgRd6v18j8Uby14sEcV0nJ
	0+cOn5WmoahFXvoHkEoa9kB3KYsWAzkr2UURAKB6V
X-Gm-Gg: Acq92OHPSMRpVNJu7W94EipGaL2LC8v2+ljf5xDK8BpPTMUfJYair/nn9Ia6ydjkcdP
	lN+5We8OKws6lJK72wlX1+l7MIYtZkWEaaKpte40Sf/gYDIOJY0zNWwgB6NMbr7CbmSvApFzbc0
	u6vzRY6omoQjh5wzrW5vRASDEujZTinIPm8DTXogOHrHMzqRTbbA2llwrEUi71z+t9D5n+K78s5
	SKcor1hz7HeZjDrUWptHb6pHC+5Ad3JRlug4iup2rlE9qOfjYhpeq6qeHwF08NegDgZGc8XvKGC
	8+G2TO2lCAH/jwXaUFE=
X-Received: by 2002:a05:622a:d04:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-5167b5765f0mr39671891cf.1.1779278932741; Wed, 20 May 2026
 05:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-2-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-2-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 13:08:15 +0100
X-Gm-Features: AVHnY4KBKfgyi_eBxWBlexdsB2vmcgOHdCyR81rdHfnvKJlVZGLuwL2FE3zd1TQ
Message-ID: <CA+EHjTwnMMbqLP=NFjM-FKYnvdzxi-z9Q0oEenQEy=WPcT5gZg@mail.gmail.com>
Subject: Re: [PATCH v6 02/43] KVM: Rename KVM_GENERIC_MEMORY_ATTRIBUTES to KVM_VM_MEMORY_ATTRIBUTES
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Rename the per-VM memory attributes Kconfig to make it explicitly about
> per-VM attributes in anticipation of adding memory attributes support to
> guest_memfd, at which point it will be possible (and desirable) to have
> memory attributes without the per-VM support, even in x86.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/x86/include/asm/kvm_host.h |  2 +-
>  arch/x86/kvm/Kconfig            |  6 +++---
>  arch/x86/kvm/mmu/mmu.c          |  2 +-
>  arch/x86/kvm/x86.c              |  2 +-
>  include/linux/kvm_host.h        |  8 ++++----
>  include/trace/events/kvm.h      |  4 ++--
>  virt/kvm/Kconfig                |  2 +-
>  virt/kvm/kvm_main.c             | 14 +++++++-------
>  8 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index c470e40a00aa4..60b997764beef 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -2369,7 +2369,7 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
>                        int tdp_max_root_level, int tdp_huge_page_level);
>
>
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
>  #endif
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 801bf9e520db3..26f6afd51bbdc 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -84,7 +84,7 @@ config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
>         depends on KVM_X86 && X86_64
> -       select KVM_GENERIC_MEMORY_ATTRIBUTES
> +       select KVM_VM_MEMORY_ATTRIBUTES
>         help
>           Enable support for KVM software-protected VMs.  Currently, software-
>           protected VMs are purely a development and testing vehicle for
> @@ -135,7 +135,7 @@ config KVM_INTEL_TDX
>         bool "Intel Trust Domain Extensions (TDX) support"
>         default y
>         depends on INTEL_TDX_HOST
> -       select KVM_GENERIC_MEMORY_ATTRIBUTES
> +       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_POPULATE
>         help
>           Provides support for launching Intel Trust Domain Extensions (TDX)
> @@ -159,7 +159,7 @@ config KVM_AMD_SEV
>         depends on KVM_AMD && X86_64
>         depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
>         select ARCH_HAS_CC_PLATFORM
> -       select KVM_GENERIC_MEMORY_ATTRIBUTES
> +       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_PREPARE
>         select HAVE_KVM_ARCH_GMEM_INVALIDATE
>         select HAVE_KVM_ARCH_GMEM_POPULATE
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 892246204435c..a80a876ab4ad6 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -7899,7 +7899,7 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
>                 vhost_task_stop(kvm->arch.nx_huge_page_recovery_thread);
>  }
>
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  static bool hugepage_test_mixed(struct kvm_memory_slot *slot, gfn_t gfn,
>                                 int level)
>  {
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 0a1b63c63d1a9..1560de1e95be0 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -13625,7 +13625,7 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
>                 }
>         }
>
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>         kvm_mmu_init_memslot_memory_attributes(kvm, slot);
>  #endif
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 4c14aee1fb063..7b9faa3545300 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>  }
>  #endif
>
> -#ifndef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>  {
>         return false;
> @@ -871,7 +871,7 @@ struct kvm {
>  #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
>         struct notifier_block pm_notifier;
>  #endif
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>         /* Protected by slots_lock (for writes) and RCU (for reads) */
>         struct xarray mem_attr_array;
>  #endif
> @@ -2528,7 +2528,7 @@ static inline bool kvm_memslot_is_gmem_only(const struct kvm_memory_slot *slot)
>         return slot->flags & KVM_MEMSLOT_GMEM_ONLY;
>  }
>
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
>  {
>         return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
> @@ -2550,7 +2550,7 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
>         return false;
>  }
> -#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> +#endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
>  #ifdef CONFIG_KVM_GUEST_MEMFD
>  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
> index b282e3a867696..1ba72bd73ea2f 100644
> --- a/include/trace/events/kvm.h
> +++ b/include/trace/events/kvm.h
> @@ -358,7 +358,7 @@ TRACE_EVENT(kvm_dirty_ring_exit,
>         TP_printk("vcpu %d", __entry->vcpu_id)
>  );
>
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  /*
>   * @start:     Starting address of guest memory range
>   * @end:       End address of guest memory range
> @@ -383,7 +383,7 @@ TRACE_EVENT(kvm_vm_set_mem_attributes,
>         TP_printk("%#016llx -- %#016llx [0x%lx]",
>                   __entry->start, __entry->end, __entry->attr)
>  );
> -#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> +#endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
>  TRACE_EVENT(kvm_unmap_hva_range,
>         TP_PROTO(unsigned long start, unsigned long end),
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 794976b88c6f9..5119cb37145fc 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -100,7 +100,7 @@ config KVM_ELIDE_TLB_FLUSH_IF_YOUNG
>  config KVM_MMU_LOCKLESS_AGING
>         bool
>
> -config KVM_GENERIC_MEMORY_ATTRIBUTES
> +config KVM_VM_MEMORY_ATTRIBUTES
>         bool
>
>  config KVM_GUEST_MEMFD
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 89489996fbc1e..306153abbafa5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1115,7 +1115,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
>         spin_lock_init(&kvm->mn_invalidate_lock);
>         rcuwait_init(&kvm->mn_memslots_update_rcuwait);
>         xa_init(&kvm->vcpu_array);
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>         xa_init(&kvm->mem_attr_array);
>  #endif
>
> @@ -1300,7 +1300,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
>         cleanup_srcu_struct(&kvm->irq_srcu);
>         srcu_barrier(&kvm->srcu);
>         cleanup_srcu_struct(&kvm->srcu);
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>         xa_destroy(&kvm->mem_attr_array);
>  #endif
>         kvm_arch_free_vm(kvm);
> @@ -2418,7 +2418,7 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  }
>  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
>
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  static u64 kvm_supported_mem_attributes(struct kvm *kvm)
>  {
>         if (!kvm || kvm_arch_has_private_mem(kvm))
> @@ -2623,7 +2623,7 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
>
>         return kvm_vm_set_mem_attributes(kvm, start, end, attrs->attributes);
>  }
> -#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> +#endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
>  struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
>  {
> @@ -4921,7 +4921,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>         case KVM_CAP_SYSTEM_EVENT_DATA:
>         case KVM_CAP_DEVICE_CTRL:
>                 return 1;
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>         case KVM_CAP_MEMORY_ATTRIBUTES:
>                 return kvm_supported_mem_attributes(kvm);
>  #endif
> @@ -5325,7 +5325,7 @@ static long kvm_vm_ioctl(struct file *filp,
>                 break;
>         }
>  #endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
> -#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>         case KVM_SET_MEMORY_ATTRIBUTES: {
>                 struct kvm_memory_attributes attrs;
>
> @@ -5336,7 +5336,7 @@ static long kvm_vm_ioctl(struct file *filp,
>                 r = kvm_vm_ioctl_set_mem_attributes(kvm, &attrs);
>                 break;
>         }
> -#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> +#endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>         case KVM_CREATE_DEVICE: {
>                 struct kvm_create_device cd;
>
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>

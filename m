Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD4635A395
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858137; cv=pass; b=ndX6ikwz0LATR8JF6JX8hG4NrWTqzaJA6dZRsFklazNlWOUIlbZuFyMfaz3Q87LPzJr3hNZhg7yACpCtQdq+Bp81ZPmhUSNNrMtZ+lOQEtsoKnIkQV3Ovx6pC7z65rPeJk1lrB0aSVqk1HMytYqPsmUwZRoeg6Zq5TVnCsTcnoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858137; c=relaxed/simple;
	bh=/2P664m7jGEtDAIgqO27YOlQWepzpwSiTCXRoum/oLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wj+7wO7QNEjonU5b4yXVCFBaW0z7BSVPicBruDCXJS02SyQQsVLcnI7QeILAPncxOfiMHdadP+hqUifjkq1d+9nWaS3kgAenx7Kbp/vEPugDv66EmVsru5xHJH8wCh0uq6w/73EuNnGmfrHPUi+IdIE2jzEaWo8MbsdBnNSqLSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=udsHHS+i; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="udsHHS+i"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51765331535so124871cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 01:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781858135; cv=none;
        d=google.com; s=arc-20260327;
        b=M6qfVBFKdf8Log/kH07sD5EA4+J4CyS6WzspR24F8h1Ielpqzy8ybkculGzwyLehkU
         wMEevrHJ1CyifG80PH4S6g84avAiSThDZN9PkVX7fIBO6PU+e1a4BzPpzAZDg4QOg/sJ
         JOuRHn+6EK/LBilFayN6zUOH+JFQpD2ZepzWdow/+VjmXJrpUPsQNwhIej632av7gYb7
         iqdfjPIbBiqKRymX2E/Azfnr8fmdPVTpqlJ2F3mNq/cgl/aRwuQD11PgGQy+XSC+22k3
         AeAAJp6udqZPbZLdFxrJw/FXWYmhgLPSS10NQGuAPILSIDArADqRDGQVUcm2ZhsVmmQ7
         ar+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vJCNxtqxuBlYp3k8AwtzAL+0dBQBaE1Rgq6EFlCIf04=;
        fh=PHDXyAsnP5AiH/7namGogXrmIUr8Jp2M8z+p+71aiO4=;
        b=OiLGeXiFpkG4SFL2rsuTNk8NK+D4tV0w3XMYyBHWUf/GMXXVHwETaTF/aDOkasFtCD
         D38SfIuWwhPYx7+EdYb2MzO7RElGoU9E/ZHlhnZZ9niCLsd7Ded94TkujKpXqKI1zUc/
         WH2DLGMd7ykjmMaO0At/35Tgcv3xg5T+HtqXMhmlJuQtK+pYFc8q3l4Qz8iWjXK1jw4O
         j7ZnnbTOmu1SNtsb8UlH6YdNFCPvEi1xV91Lk15FzqYOykVtHXczxF12SJiJsxuLzWjn
         yV/WAjx9XVPRfiN32XPflxtPehfoXkkJGQknFF6ACbrct7bLGo5VKp6hCozdNB5pSKX1
         2zYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781858135; x=1782462935; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJCNxtqxuBlYp3k8AwtzAL+0dBQBaE1Rgq6EFlCIf04=;
        b=udsHHS+i25aggofArHhr2DS9m2ry8BQzgg3eT2kMYyLe77BdjoruBV9gi3qxkPzyA2
         PkXqN5uCS0x92UWIv/YoFDZdkGs2Me24stmBd4Gs7t8/WcOoTlenIh/DsAcRhBUzQiVF
         AiqwjI6X1AdurJ7DJ+MPiJVXQk6UQZzveYywVdOxc9JmVtEpVvOTMkmmRqu5ZA2tmpvr
         0dtawsZDq5vMfEk7UdMyxTWkko3CgFUaLoZSUwC3wWL3flZVOM1fU3o3pwNFwX3KQYNF
         k+AeXJ8NmaI1LUw1v1yF3qYIYX9kjZ8YQUErPGaNm7Ip6+fZIdcPG9RYAsWKHBzS/44e
         ZuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781858135; x=1782462935;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vJCNxtqxuBlYp3k8AwtzAL+0dBQBaE1Rgq6EFlCIf04=;
        b=iY+mRwvdbyZ/R9DjyosYXfMhKzzDsnf3tPSwHjJa9N/X0ew6kxpaeyA3E/Ms2Krktu
         qeerVgJ4LK1sqTIHMtApOqhkVDbjwTP5YEaVeDJPXUGmL1yzX5W3NH5ptl9NgpkY2B6r
         7u39hLKI7Igo1mK1ad+VHVWyYv2IngirB+NNoxqpERjSA4ZwiOEi3NGWgCuItI70tbw4
         MI+kA/4zAEaP7X7R+JsHDB5Ttt6/VFDzyhucHz8y2E51NJEZs1+gYTD+0l2mz8Qyg8uf
         HaEPX0ghO8nyD3OzJ48v43ZKuW0vh3vsSGyIRLJilNoPNMnQggmMk1jsDDyGi+6DxVki
         lRlg==
X-Forwarded-Encrypted: i=1; AFNElJ+lu+M5jzMJ2J1joW9/q4+ZYma989Pdo7GlRxvl7HW+IGCIUast0X4AjrQ4DJUN/ZMRmeU9FYCvJPTqceX0F44=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNu4sqRlBCDhilCR0BqIzq6QHRhegyQw/Uty8mmFXpJ+7YjRm+
	6YTzoZpZZ64Fv25ghj21TuFOp7FdxGBGipKEpBzyuFgoNd93FB1Juy1vIu/6y9HMee/y8dC+D4k
	yOJVWem5dPP3WXNaG9KUsiCmDmNmhXuoxprQ6LMIk
X-Gm-Gg: AfdE7clbE9/RAePEkRBhNhW9YrHs4bkRD2Zy7nKxN/GsMbysJ1hb1Ruf9OF+vqp/zUm
	zYfyteDIBDfiC+/eld4uezWX1FDHL2C5NFG+GDBDoDdePpUBlYfRjFhEQr8zrqYT+ATAm8eQVeC
	zmSm6p9ApbJaTSN5cJGEjEJkmuO5pXCki2ZCejNGxo8S3G4spwYPj4J8WWppb+5lp15p1DsWe0U
	gXWh5Nu+zZ4ntFO24Zou7LqLJ42QRUGpU6Wngm8tO7BrNad+wF9rEdl1fVoLZs7Wh2/EcGmxA==
X-Received: by 2002:a05:622a:8893:b0:517:99ea:ab7e with SMTP id
 d75a77b69052e-519e4a70452mr6973311cf.24.1781858134705; Fri, 19 Jun 2026
 01:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-10-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-10-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:34:57 +0100
X-Gm-Features: AVVi8Ce8UOYY3ibWf7EXz5J6tTWRIQf_RIk-gcXz8kRs-aLeFMDUqknE2c7ssDk
Message-ID: <CA+EHjTyGPo0JMsN8WFMer-2NWv6kNNUnyads+YHEXC20CwPjXQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/46] KVM: guest_memfd: Wire up core private/shared
 attribute interfaces
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> With in-place conversion, guest_memfd is able to track the private/shared
> status of memory. Use a global flag to toggle between tracking
> private/shared status per-vm or within guest_memfd.
>
> When queried for supported vm memory attributes, return 0 if attributes are
> tracked in guest_memfd.
>
> When querying for memory attributes over a range, look up memory attributes
> based on the flag's state at query time.
>
> For per-GFN memory attribute queries, choosing an implementation (VM or
> guest_memfd lookup) at KVM load time.
>
> The flag is always false for now and will be made toggle-able after all
> in-place conversion features are added in subsequent patches.
>
> If/since the flag is false, if CONFIG_KVM_VM_MEMORY_ATTRIBUTES is also not
> selected, the per-GFN memory attribute query defaults to returning
> 0 (false/not private).
>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  include/linux/kvm_host.h |  4 ++++
>  virt/kvm/guest_memfd.c   | 22 +++++++++++++++++++---
>  virt/kvm/kvm_main.c      | 12 +++++++++++-
>  3 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 27687fb9d5201..acb552745b428 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2560,6 +2560,8 @@ static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
>  #endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
>  #ifdef kvm_arch_has_private_mem
> +extern bool gmem_in_place_conversion;
> +
>  typedef bool (kvm_mem_is_private_t)(struct kvm *kvm, gfn_t gfn);
>  DECLARE_STATIC_CALL(__kvm_mem_is_private, kvm_mem_is_private_t);
>
> @@ -2568,6 +2570,8 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>         return static_call(__kvm_mem_is_private)(kvm, gfn);
>  }
>  #else
> +#define gmem_in_place_conversion false
> +
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
>         return false;
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index bca912db5be6e..e0e544ef47d69 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -926,6 +926,24 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
> +static bool kvm_gmem_range_is_private(struct file *file, pgoff_t index,
> +                                     size_t nr_pages, struct kvm *kvm, gfn_t gfn)
> +{
> +       struct maple_tree *mt = &GMEM_I(file_inode(file))->attributes;
> +       pgoff_t end = index + nr_pages - 1;
> +       void *entry;
> +
> +       if (!gmem_in_place_conversion)
> +               return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
> +                                                         KVM_MEMORY_ATTRIBUTE_PRIVATE,
> +                                                         KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +
> +       mt_for_each(mt, entry, index, end) {
> +               if (xa_to_value(entry) != KVM_MEMORY_ATTRIBUTE_PRIVATE)
> +                       return false;
> +       }
> +       return true;
> +}
>
>  static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>                                 struct file *file, gfn_t gfn, struct page *src_page,
> @@ -946,9 +964,7 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>
>         folio_unlock(folio);
>
> -       if (!kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + 1,
> -                                               KVM_MEMORY_ATTRIBUTE_PRIVATE,
> -                                               KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
> +       if (!kvm_gmem_range_is_private(file, index, 1, kvm, gfn)) {
>                 ret = -EINVAL;
>                 goto out_put_folio;
>         }
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 8b238e461b854..01761f6e25d25 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -101,6 +101,10 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(halt_poll_ns_shrink);
>  static bool __ro_after_init allow_unsafe_mappings;
>  module_param(allow_unsafe_mappings, bool, 0444);
>
> +#ifdef kvm_arch_has_private_mem
> +bool __ro_after_init gmem_in_place_conversion = false;
> +#endif
> +
>  /*
>   * Ordering of locks:
>   *
> @@ -2422,6 +2426,9 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  static u64 kvm_supported_vm_mem_attributes(struct kvm *kvm)
>  {
>  #ifdef kvm_arch_has_private_mem
> +       if (gmem_in_place_conversion)
> +               return 0;
> +
>         if (!kvm || kvm_arch_has_private_mem(kvm))
>                 return KVM_MEMORY_ATTRIBUTE_PRIVATE;
>  #endif
> @@ -2633,8 +2640,11 @@ EXPORT_STATIC_CALL_GPL(__kvm_mem_is_private);
>
>  static void kvm_init_memory_attributes(void)
>  {
> +       if (gmem_in_place_conversion)
> +               static_call_update(__kvm_mem_is_private, kvm_gmem_is_private);
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> -       static_call_update(__kvm_mem_is_private, kvm_vm_mem_is_private);
> +       else
> +               static_call_update(__kvm_mem_is_private, kvm_vm_mem_is_private);
>  #endif
>  }
>  #else
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>

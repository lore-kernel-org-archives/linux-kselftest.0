Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016EF3CA483
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776715585; cv=none; b=ZnZu06wu0d8JYFEcng/xnZ/ZEg2A3QFNSDkd5ZVi526jyOCTZaI5JkamNF6e8+xU0/DV/P9x5KAcBu2eoUKZRe4FlmJloFH6UBPYPPto5kkDIMTAqavL2MF/gnyFHezKsAcyZZ9b0onEcrBttY4WGjYbHEOPp3VdV2jMHpJrJ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776715585; c=relaxed/simple;
	bh=b89JOdWc2tHnz0JBm0XSYjGwA2IuoPpOvjwTZ1/Lux0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bkrXD82KPdILc8QX7TCP2uqm4QzkbUXEyMRPI388AClUIh6BFTzHBWONWaESkOBMf9tyqf+8BRK8AKijadTEXxRY29HjzwP/hKeBQdZr8bQkPh1wObWFXlMZmwQ1P7lkdBzdstfOe4OXUGw5P2tu5mnlMhMaVUkue8fE0kwe8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QaLtUNkG; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QaLtUNkG"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35641c14663so4135306a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 13:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776715583; x=1777320383; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZxYUqD2nNuvPN56vUHQyfWGRkh1zwfXr7oE1wyS0SA=;
        b=QaLtUNkG4C2izbFKIp82iAhLIPN4+kVc5zwSDSb1x8nQq1j0SaCXJlpn6x14uKBSlW
         7kfFrWGBM9SnKRmE07Dw764I961yx+zYX/5obhWTwRqwahb6QaIXBCNRC12kj1YCUus7
         PfPZwd7qMsDcNF7rOlAV16ojzwPSjgPZD9P9Pxo6OndTRFk8c1vTXJXWVQByWVd66WC4
         40jKDX8AnKp+fLItkoIFmE4Pc5+bS1kQ9OlFFFFpecV6OMm/B8nlYEqvJEo2JVtz8p7R
         Yjt7XxBXXgZAXrKgUbgUr0jQnRIEQl7gkEggH6YgKQ73hjpBJBbZ0nDay44Dpmuhgai/
         9kFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776715583; x=1777320383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZxYUqD2nNuvPN56vUHQyfWGRkh1zwfXr7oE1wyS0SA=;
        b=kzaY8GYMq+AGZ6ilvySo0zF2a/no4Hs4kbvKIsjd0CrtimNA0HPdH6Xf4YQ4WZAV0P
         JQXS608b+V0JA7Z22aXDnzXWPq4Ld4XUeLKZTkYiqbcZHTEXrXaqHcUHX+8xnB1p7l48
         ozQ7SKBsgo6UOjFtg5SiKf5yuVfI4nfa7Q5x4UiTL4/537f3kcfk1N9i7Guwy/5gYU67
         hCK5+F9yL5qfm32sgUf9fKdnw/x/tx7F9ajs7anbKmbWxwHuWlnXpN0v1df7J0d2chP0
         Bu2No+krayU0OTELVVDIaHHKp9bDDH/XriUgEzClm6QQt1cwyGYcOeDBPt3Nb4sX+i/j
         B7MQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ft7AnSzomXFRUDv2gBnFmpIuCErkqsEsYUSibZmPQnxE1ep8k4tyTqB9iCCrdZH5CHNAaMp93zDkQnPZBBNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSBk31MxTl/Mc0GKiQfjP137AuO1R+jtfzU+gukPkg+E9LiVRh
	3CHftBzUvW/8ZzEGn7JPziRvGLXqSCB3WMyHc6ehFkZta16Vnk9mLT5XExeIlGZq/rq/iTpM8Jb
	5YcRPzA==
X-Received: from pjbkx16.prod.google.com ([2002:a17:90b:2290:b0:35f:c299:a451])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:164a:b0:35b:96bb:47ba
 with SMTP id 98e67ed59e1d1-361404c0ca8mr14786253a91.26.1776715583185; Mon, 20
 Apr 2026 13:06:23 -0700 (PDT)
Date: Mon, 20 Apr 2026 13:06:21 -0700
In-Reply-To: <20260220004223.4168331-2-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-2-dmatlack@google.com>
Message-ID: <aeaHPYwzs0dhwX9-@google.com>
Subject: Re: [PATCH v2 01/10] KVM: selftests: Use gva_t instead of vm_vaddr_t
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 20, 2026, David Matlack wrote:
> Replace all occurrences of vm_vaddr_t with gva_t to align with KVM code
> and with the conversion helpers (e.g. addr_gva2hva()). Also replace
> vm_vaddr in function names with gva to align with the new type name.

...

> @@ -716,22 +716,22 @@ void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa);
>  void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot);
>  struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id);
>  void vm_populate_vaddr_bitmap(struct kvm_vm *vm);
> -vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
> -vm_vaddr_t vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
> -vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
> -			    enum kvm_mem_region_type type);
> -vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
> -				 vm_vaddr_t vaddr_min,
> -				 enum kvm_mem_region_type type);
> -vm_vaddr_t vm_vaddr_alloc_pages(struct kvm_vm *vm, int nr_pages);
> -vm_vaddr_t __vm_vaddr_alloc_page(struct kvm_vm *vm,
> -				 enum kvm_mem_region_type type);
> -vm_vaddr_t vm_vaddr_alloc_page(struct kvm_vm *vm);
> +gva_t gva_unused_gap(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
> +gva_t gva_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
> +gva_t __gva_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min,
> +		  enum kvm_mem_region_type type);
> +gva_t gva_alloc_shared(struct kvm_vm *vm, size_t sz,
> +		       gva_t vaddr_min,
> +		       enum kvm_mem_region_type type);
> +gva_t gva_alloc_pages(struct kvm_vm *vm, int nr_pages);
> +gva_t __gva_alloc_page(struct kvm_vm *vm,
> +		       enum kvm_mem_region_type type);
> +gva_t gva_alloc_page(struct kvm_vm *vm);

The existing vm_vaddr_alloc() and friends are pretty bad names.  gva_alloc() is
far, far worse.  The APIs aren't just allocation a guest virtual address, they're
allocating guest physical memory, finding a usable virtual address, and creating
mappings.

I don't see any reason to have vaddr or gva in the name.  E.g. malloc() isn't
virt_malloc().  But I do think they need to be explicitly scoped to KVM, and to
a VM.  I'll drop API renames from this patch, and rename them to vm_alloc() and
friends in a separate patch.  Amusingly, that naming scheme will still work if
"vm" is misconstrued as "virtual memory" instead of "virtual machine".

P.S. This is a great example of why I insist on one logical change per patch, with
judicious exemptions for opportunistic cleanups/changes.  If this has been a
separate patch, it would have taken me all of two seconds to unwind.  As it was,
I spent a good 10-15 minutes dealing with this.  In large part because I kept
making goofs, but that's the whole point: there was no reason to put me in a
position to make goofs.

The other argument against these sorts of "Also do xyz" add-ons is that of a
slippery slope.  Why rename these APIs in this patch, but not the myriad vaddr
variables?  Then after a few "I'll just clean this up too" changes, there's an
entire series in what is purportedly just a typedef rename.

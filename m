Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8953D8100
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781635637; cv=none; b=aMxrN617D80k1HDGyXbcc0ZikwsNL9rnlk2hr9iQJE5C2PNoQmKGfAzz7AexQ1WN5/TMTvfeaFD81d3UEdNpdZiefM87G9sh83rzMv2e/whkT3HX5f1cgsVhK0P3DiV6K5GW8sffcFg2pTqywuqrlzPOIotxeFviwBDQ97QMO7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781635637; c=relaxed/simple;
	bh=buTnY0ETqHFz9mHm8vPYqufrzuCw85DNR5Yn8mLP9Ew=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fvg1U1ZGnrf25frtLMipj5gnvaBPUgWe/mz52GQeHq/uWchiZTHFE38aMX7hx6Mbcp01zURAKFRRanxWkRqj34/KRrFZ9+YIgk5SZaQ0BHt0Ueb848WotOtagU39jtljUtRClj3YE9gvNm/KrVSkswZPZ+j4WtKyQ5FXSZNTHpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R3Enj1iu; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R3Enj1iu"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso5673410b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781635634; x=1782240434; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vkLeRGdGFIEMQT4xMcSv70D3LKPlWrgZN2ISeIkos5o=;
        b=R3Enj1iucfpyUZNtTsF3zszNyowO1vStfR4R6+2kDEYcvdl23r1y4YWCavpgpvVGOH
         NN2YcvdRUkdFeQHYzUVF+JtmxA3wEQOXCYrC9Hc1VjU4mameFNdau48TRJlE4sJOAFy1
         R+jKJOe9zRN7gKTmZ815oj3NNCVicbwWooM0oNfTeRG2sz8HFlvFWAKl9LSlbPCBlDqh
         W/0aVW+uRp/cvn4gqfGsWdVMhmWhw704/j5JBu3b7V3LxY1Up4RZrpbL8j8NqEbTNveJ
         vFmWFitJnIwJC5PLvxCDfji/VBbtFaMC2Fl+W9QhXUMAoFa6DhD9g9TPODUpqiqlVV0V
         tpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781635634; x=1782240434;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkLeRGdGFIEMQT4xMcSv70D3LKPlWrgZN2ISeIkos5o=;
        b=aJi7DDPsxCUd/+qcsCXl0jLSiSwZ2iZbkQAAIMd8jDP/KckP5JuchSO76qmPGnWALS
         m9AB51DhnnfR82lWjqmEvJaPD8Be6SSTpm57TQ4X4HYUUtEmxpZxlsHDdWROH3d+udlS
         8+gOivwenuyHSU0mGMqi+xvFmHm8c+1mfK6E/g+OvSYbX+Dwy+aMYMfDhKGKKFWoiYku
         YCq9PujkwZ76KbOejlmw2wvmlj4oOVRBSILraH/cq/2SqYeB1XvGTcAyEj1Pu+ijqge6
         qxi6FLNMBHfISjTfl05MEJF1xEe3QkttPN80e0BRqSgdJB2+a0Mud60Fa1uKYmSecxJr
         HY3A==
X-Forwarded-Encrypted: i=1; AFNElJ+YrA/FGPLm4Ptku8pFE8DXaMU/HB54u8yLSxZsmcNQ+CmI7D2RrHHUXtQ1ZSSIOIsdfHSkMM+eLDexac1FBzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKq8feq1e3W9BajoKC50qtu26YQsZMzcqhfWbJfOxPtvAQxXn4
	xZXqfPp5i7CsLU4meX2mFS3hyrWngVTgs9MyDQ+o8+09UlJKzCS2jXv69jM0OuIHaWMSlt/Xko4
	50KKTgg==
X-Received: from pfjc12.prod.google.com ([2002:a05:6a00:8c:b0:82f:6a26:5f78])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cd2:b0:842:6849:2192
 with SMTP id d2e1a72fcca58-8452459cb0fmr338659b3a.42.1781635634170; Tue, 16
 Jun 2026 11:47:14 -0700 (PDT)
Date: Tue, 16 Jun 2026 11:47:13 -0700
In-Reply-To: <20260521-tdx-selftests-v13-v13-21-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com> <20260521-tdx-selftests-v13-v13-21-6983ae4c3a4d@google.com>
Message-ID: <ajGaMb6Lrk3OS8B4@google.com>
Subject: Re: [PATCH  v13 21/22] KVM: selftests: Add ucall support for TDX
From: Sean Christopherson <seanjc@google.com>
To: Lisa Wang <wyihan@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, May 21, 2026, Lisa Wang wrote:
> diff --git a/tools/testing/selftests/kvm/lib/x86/ucall.c b/tools/testing/selftests/kvm/lib/x86/ucall.c
> index e7dd5791959b..c8e3418d53af 100644
> --- a/tools/testing/selftests/kvm/lib/x86/ucall.c
> +++ b/tools/testing/selftests/kvm/lib/x86/ucall.c
> @@ -5,11 +5,34 @@
>   * Copyright (C) 2018, Red Hat, Inc.
>   */
>  #include "kvm_util.h"
> +#include "tdx/tdx.h"
> +#include "tdx/tdx_util.h"
>  
>  #define UCALL_PIO_PORT ((u16)0x1000)
>  
> +static u8 vm_type;
> +static gpa_t host_ucall_mmio_gpa;
> +static gpa_t ucall_mmio_gpa;
> +
> +void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)

I think we should use an x86-specific GPA, not the first address past memslot0.
Unlike other architectures, x86 has a nice swath of addresses that are pretty
much guaranteed to be unused, thanks to selftests creating a local APIC by default.
On the other hand, the chances of a collision with a memslot just after memslot0
are decidedly non-zero.

Note, because CoCo VMS don't support read-only memslots, the TODO in __vm_create()
can't be resolved for TDX using the suggested shenanigans.

I vote for either the I/O APIC (0xfec00000) or HPET(0xfed00000).  We *know* TDX
doesn't support an in-kernel I/O APIC, and the odds of KVM selftests ever
implementing an I/O APIC are basically nil.  Ditto for the HPET.

> +{
> +	vm_type = vm->type;
> +	sync_global_to_guest(vm, vm_type);
> +
> +	if (is_tdx_vm(vm)) {
> +		host_ucall_mmio_gpa = ucall_mmio_gpa = mmio_gpa;

Drop host_ucall_mmio_gpa entirely.  "host GPA" is rather nonsensical, and KVM is
responsible for stripping the shared bit.  You can actually drop ucall_mmio_gpa
as well if we go with a hardcoded magic address.

> +		ucall_mmio_gpa |= vm->arch.s_bit;
> +		sync_global_to_guest(vm, ucall_mmio_gpa);
> +	}
> +}
> +
>  void ucall_arch_do_ucall(gva_t uc)
>  {
> +	if (vm_type == KVM_X86_TDX_VM) {
> +		tdx_mmio_write(ucall_mmio_gpa, MMIO_SIZE_8B, uc);

s/MMIO_SIZE_8B/sizeof(hva_t), because what you're writing is the address of a
pointer in the host virtual address space.

> +		return;
> +	}
> +
>  	/*
>  	 * FIXME: Revert this hack (the entire commit that added it) once nVMX
>  	 * preserves L2 GPRs across a nested VM-Exit.  If a ucall from L2, e.g.
> @@ -46,6 +69,13 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_run *run = vcpu->run;
>  
> +	if (vm_type == KVM_X86_TDX_VM) {
> +		if (run->exit_reason == KVM_EXIT_MMIO &&
> +		    run->mmio.phys_addr == host_ucall_mmio_gpa &&
> +		    run->mmio.len == MMIO_SIZE_8B && run->mmio.is_write)
> +			return (void *)(*((u64 *)run->mmio.data));

This needs to return NULL.  Either that or make this an if-elif.  Falling
through to the normal KVM_EXIT_IO check is not what we want.

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254141;
	b=Br8PFuZLbM5GscX/MRZ0EdpX0R671Gx1jLivNNUhyCj///6dxwQK/Boe55scQK3l8IGO
	 Y1tnKkToyDpwNNcgdDGeSbStBGjJyHtoaHTXhKSB8/JhbrDExkf4QMjUfiA5xemAgiE/K
	 45OVOlrrOPQX1p0VEfhUER9n1Q0C5Bf5hAzOOi1jcHDOk4VMxUHqBWdkQdZZigyk9P/3O
	 AX2QI735XgLk2U61bUO1WlxOeNiRl2bsqEvrBVnc1sK1Ki3AFul1j6fqPks44esJzo8SH
	 7JyAegEILu8w8+j9b9d4fS/u1IrtMeBbCi5FnFPKjEcaYRBvlu+O8uSmRJSWWhBI5BQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
	b=B9sK91o0t8+34zHLnDBDV9/U1/xr6SABmPDWUI2Hi6vaRZ0HAI73EDkMpIdXlQE/WJwR
	 /IfprOeKZScD0B8J6VPE1T3sPVcEraoGeaaS/Ns5WTfMpq9ZVpMoAfACzWBZQPgfrcejj
	 LHwd6EWC/lURyh9DhirS4tFYD96+E/pK4qBQp7hknYamqoDiEnKx9Pur0L7LJQbh7Mfja
	 KnADaPVH8tfH/77VnDe2oSPnYB5RmRrDQZGEaR4qj7kXovQatf7UE6m37Bd/CKrhPlO/0
	 j7Bxp/2tzgRPFi9SmW3hm6cXJ+X9xe/vYfAZSUMbpZGCdP2e+2QTKg5NcCNB9O76aLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bROolM0F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E8B606A33F
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 19:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E8B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bROolM0F
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93cc1ab5f6cso156537885a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 11:55:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254140; cv=none;
        d=google.com; s=arc-20260327;
        b=bYqlGWNV/gVwDe2p/zMK73NmxM9a2iu5/LGhn175vv4EhqoKSxbWTxLrqDvsWamvJw
         pY+aJZ+FuX/4609NtvgwGCp149MQqHt4vNHtcdW0JJ1einUJ6o17f4Vh2DjSNsOpcenR
         dSK8shXtn4GVwtJ0jq7mWG2PB1+ocgDlH4xZdk6pSFCjiDGhiR2cPM0v4Yu9mL1O1jiR
         3bwy81MyfUKLsku6YdasPceBwCznmUSmu9WhRvkyaJIovUdGweeDkm7h/S2RNE34RYmb
         fO/zhQexifkXj7wMaCIrEupedTV3s0gVKYAfgoPpx2v2RJIBiA+PJIKo2Sxthhfs9JHM
         d3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
        fh=mQCRa5KGW0T/Y0PhpdhCv58PAjMeCLplPmL507FjmGo=;
        b=AccHCtjb8+nF0DZMdyQj8QAAELAjsBSA3xTp7T0sMGh2GqJX7vwx4oD7F1NjgUQyQU
         hyl3yApFryxlhK91IUS/4ifrD/oKrdUQWK2z1zduu4PbdA91Rw+DbPvM55gZvYddmDYT
         hAp1bkzd2h4bkr68xFaB8/agbQObb7vnAhEWrRsR5ug0vYK9VBVkN/M1NvW5bV99u3km
         zjSPCukRbHXf3Mz6wdMxOeeGeQcrzyI4Jiv3YRMXqBXDXeoqSU80iWWDzZIfUNmP/eF9
         Q8zwsCJrO+5pjQNZjMR2PGZU4tfPntXelT9pX3JCUBijgVBnDWVRu8iHo0GU5xsAa3gr
         4/yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254140; x=1794858940; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
        b=bROolM0F2HqW6iNSQlactQ0hm1elz9U2+ljmZc41GaM/l/ChZMv/CAxKwElGKkZ8LF
         WwgoUI0E5lRtD3BUJ86zMRPgkb4O05HT0oW5wppm9DvA1qwlKhd0r7ObkEi08Kek/fBm
         a3bQj8pAWf5TUzVhOBIjnexLY437kCBtiYgaJlCryttsi9GAlFZN8iVpf+AQVNnFtS5r
         8GZKCIpKeThr0YPW1sh0/BuFQc2ScmF7V62ql7GZ4prPxwt5ctYgVcaaFxfFvBwpZooU
         XLqlNUtNZB1pzNfJJLafXmmxj5DaIEca/JY7kR7w0jgTYEAb7c2XHfKB0Dd3GYVE/gq8
         ZQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254140; x=1794858940;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsEcZqtV2lv2QZR9DYMmC/AF0mepkP+kQ617u7eTRdo=;
        b=fvqu7+ttkmi/hA+HXzTTXuEtmgOrC8OJgWeOs3Xa/ql4sRO2KFFM+iv48Qeo1VaUqs
         6T+P9kRTUBEJg/234qEXdPe/rodVrdp5PAFBogjbc/dGDXkELk4KcUbKgz9XTo1wjeip
         ZZFu6oFj+4GuTqskxRoMmlD2j5pKo85WfZvBIAnsW5omJiBlrPhu27Ar36ab3r7c/HAA
         gjDX/lQ4nBtJ+SkeTcSELAgBk2+eU5x2W/uCIC+57BJICU6CLr25WbHv/k1Q2c7YaeRV
         mf0Cdnr+Czm5o7vxa3t9PdhVbo/LpL0eB/Hu6ptswBmdV0f3cxTvaxM8rv7VR+OhO236
         dKIw==
X-Forwarded-Encrypted: i=1; AL+hErGumOMDf44uSTWPhNsX9e/7RZoWk97+nzTv0YquV+h34HY845ThFORgpd97QR4nyTzUs2xyziYAD2BPLDDwV2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eyW8dyPdhRopd9rKxXglJefiUgN1GdatlQaLtmh4udpy/9+cQ
	uDBWUrHW9ypxRvOckL6T6JlyT5kjOPaM5VE2KzlvztZYHELgOcRQ9jHCffheStm+t1yxRU2I/Ei
	hf013nV5PZcwKEUamRzHl2g9peZ71GNpzpFwYTZwW
X-Gm-Gg: AYBFou3BSu8yG0YaA/Dbo2cVcKFJ0HXye3+dZDOPtgUJ0TaGGVZF+bgkQcw+StcH7Om
	/yQndKhSkyeEEn80z3R8+3tizHcb8an+jAFpybNikLC5vphReeBm77jujacx+A59i4S4UEQ5FbV
	AY4RxTRDxXdITb2Q51wYixYYgNDSgYQwieFMt+JqSyzHSMWS1Gd/UABgjHMEJQ5OjUhyP+aXKnV
	oKz+9UucE1hcPm5iUlmppoJ/qT12dkVjshO5rd/8sQzdP3B6rz1ie4bJNb1yUpWyvUQEVPcu2TG
	08uPnH6wPG7bTP8cgvvmcJPPpk2bdDQ98U5Hw0B5FuOf9jSo3N/SVvAMt7E2QdHa+22eCp4GTNf
	SDOJBCpCQeB9/ZHibaXBSN84OUdbIDkwOsz3F48UzxqCeIyNi+5raIcvyU0w9es8CUmXRVQ7Y5O
	BO0m0Z8g7WyQ2QNfYDdmkcsVU=
X-Received: by 2002:a05:620a:710b:b0:93e:49eb:a274 with SMTP id
 af79cd13be357-9479f2fa7d5mr94788085a.23.1794254138721; Mon, 09 Nov 2026
 11:55:38 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:55:37 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-9-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-9-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:55:37 -0800
X-Gm-Features: AclHuK-fw27NEX4WLMeH0MQEMu23wQjUHEw6LG3xIqCQa_4vVj4k3LjJhmBS0EU
Message-ID: <CAEvNRgFvkWCM_JDxiamzQW=stgOnY0Xum5aphVv-Zo941zx2sg@mail.gmail.com>
Subject: Re: [PATCH v16 09/20] KVM: selftests: Set up TDX boot code region
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

>
> [...snip...]
>
>  /* Leave marker so size of td_boot code can be computed. */
>  .globl td_boot_code_end
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> index 564144c40f0a..b4a7089b3636 100644
> --- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> @@ -1,8 +1,46 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>
> +#include <linux/sizes.h>
> +
>  #include "processor.h"
> +#include "tdx/td_boot.h"
>  #include "tdx/tdx_util.h"
>
> +/* Arbitrarily selected to avoid overlaps with anything else */
> +#define TD_BOOT_CODE_SLOT	20
> +
> +#define X86_RESET_VECTOR	0xfffffff0ul
> +
> +void tdx_vm_setup_boot_code_region(struct kvm_vm *vm)
> +{
> +	const size_t total_size = TD_BOOT_CODE_SIZE;

This caught my attention because it wasn't quite reverse-fir-tree
ordering.

Naming is confusing here since there's both TD_BOOT_CODE_SIZE and
boot_code_size, so which is the boot code and what is the right size?

If the only use of TD_BOOT_CODE_SIZE is here then maybe we could just
directly memcpy (td_boot_code_end - td_boot) and not have the macro.

> +	const size_t boot_code_size = td_boot_reset_vector_trampoline - td_boot;
> +	const gpa_t boot_code_gpa = X86_RESET_VECTOR - boot_code_size;
> +	gpa_t alloc_gpa = round_down(boot_code_gpa, PAGE_SIZE);
> +	size_t nr_pages = (SZ_4G - alloc_gpa) / PAGE_SIZE;
> +	u64 gmem_flags = 0;
> +	gpa_t gpa;
> +	u8 *hva;
> +
> +	if (kvm_has_gmem_attributes)
> +		gmem_flags |= GUEST_MEMFD_FLAG_INIT_SHARED | GUEST_MEMFD_FLAG_MMAP;
> +	vm_mem_add(vm, VM_MEM_SRC_SHMEM, alloc_gpa, TD_BOOT_CODE_SLOT,
> +		   nr_pages, KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
> +
> +	gpa = ____vm_phy_pages_alloc(vm, nr_pages, alloc_gpa,
> +				     TD_BOOT_CODE_SLOT, true, false);
> +	TEST_ASSERT(gpa == alloc_gpa, "Failed vm_phy_pages_alloc");
> +
> +	virt_map(vm, alloc_gpa, alloc_gpa, nr_pages);
> +	hva = addr_gpa2hva(vm, boot_code_gpa);
> +	memcpy(hva, td_boot, total_size);
> +
> +	hva += boot_code_size;
> +	TEST_ASSERT(hva == addr_gpa2hva(vm, X86_RESET_VECTOR),
> +		    "Expected RESET vector at hva 0x%lx, got %lx",
> +		    (unsigned long)addr_gpa2hva(vm, X86_RESET_VECTOR), (unsigned long)hva);

TEST_ASSERT_EQ would work here, same for the == assertion above.

Not a huge issue,

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> +}
> +
>  static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>  {
>  	static struct kvm_tdx_capabilities *tdx_cap;
>
> --
> 2.56.0.455.g6c5a503b38-goog

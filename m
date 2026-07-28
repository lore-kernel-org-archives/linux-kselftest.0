Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E023AFB19
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 22:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785279378; cv=pass; b=qmvl12QK2oSGUfCNnPm8Pxkl1KpvXz++Yaefpfr9pVEDGCCiUpolpsl0b24UibBqzD19hCiySUYCqltI6bPDjAofv+Iv/SVJCkzy8eebx98usrTa1EZK8/mNj19YR7HiQkKgtAwU+US9HEI7gzd+dW81Ymf29Tciq5zUm+w+E1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785279378; c=relaxed/simple;
	bh=t9KvR2dL1m4zEK1lVjuJI6tVdJ4dqE2a/Rcy64SXybw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKHh1QZ0S9UlsO9mXctKp/fcq6Q2nLKnkEQdNqd5KefNFblGG9hnH1SxN0o1vt6IXG3XLgwgVUTB9603oTahOk+J5pd+xzZaf1J6Y2jC5FhoQvgxecrcAqFrubr8047FnrpbEOxKy2kVFAKSBJNADjYc1APT7Pxwl42OfbzWdJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iUzXIHmg; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iUzXIHmg"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so1077988a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 15:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785279376; cv=none;
        d=google.com; s=arc-20260327;
        b=KRLvDR00kNr7mMmowye5fMcO55u2x2CxvjZGKRuAehspv4kYrgZ+ykp9J1AV3uhVHK
         UKw2UQGegnCkNaRNn65aO9AesaSLUWiyXw85ALKaI9rlEpT71a4xXBzSBHJXG6Rfsm4M
         EoTjyvdkY8N6T174pRdFUBFXAQDE+sUJP964jHIZOgb2pCWcYCxzk29Q2FGh/IrYMiMS
         0d81BdGzY+wtWshezHs9gT650gyAo4pt2ONkmtEadzAr4FqlkO/JiMYI/1fRu0+1Ks74
         7INpZrJcbIOKC8ZIV1KlP1OMaKNnOufRHGeNvJ4OHG6DypsD3X0gO8TjaWmP6dpYAAol
         vYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=j0z3e8zTvHIk07OlT0xkJIAxTqUKptSj/yxfg7rVtqA=;
        fh=2RFMFQgN5uItuFUirfhtkPI+Q/Kvz0fONkQJVIMPhMw=;
        b=UDdgkHVf3vjJbsyZyUe19Rd7SjPcPc3K9NS00umDo8fKkdOP5jWnDvDX5/5tKBl753
         yo5pXRO4yVEj1IXdiAmb9tH5Wlhw47z7epJB/qXkOx1ABxG/caNifm9Wh7taUonKJ9K3
         TlAiJOeGbx6kNISnnzoUyNX3XFKWAUMg1Pu0Pa6DZlsKRBfCzzkGk98rtcU22gJYv8mm
         CbAbvaknxeulq+HFRCJKXktGrI7KJXRTh7O4nLkvQyO7y/pGtsmV2v9ho+vDrzmE5UTD
         mPTxTj77UXUXLIwu5VH5iqoUGqHJq6srdEDUaY/dxBrHqxgaYABNBgK2dePbi/hx5HZC
         cPKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785279376; x=1785884176; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0z3e8zTvHIk07OlT0xkJIAxTqUKptSj/yxfg7rVtqA=;
        b=iUzXIHmgH3q+ICwMCaVm2xy9Dw+14uRWHej6U5nZeoFMswYoMmHAElYE5TUShdRPUT
         lq2aKWtAgMxfK22XN+3aW4VsmI2hFjQpQDYayBMy3BtIWY+7CI3dNm88qJOCgf2dVt06
         R7gRPMyo1iGjM0nBbFrZX+2lNN6S63iDed0M9ArqIMKhLMcICCmrfOuhgPxtE3ISjsqh
         NBm6EaK6d/sf9BHvtHqCNvoR+H27B3k6x1kO0OSjpj20gMymgSg+0aWG6bZFyS9eMzlH
         SsZa1/rk2jU9iyqD56sPA3bJN0LCCVXwJhDn3qmrt9+YES9paGwYV0DeV4p+c4rfXFEc
         b0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785279376; x=1785884176;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0z3e8zTvHIk07OlT0xkJIAxTqUKptSj/yxfg7rVtqA=;
        b=mcECjFK9peFPaJ+4bN9FzAty+yWGFKMBGmHJmgQ2ncjuR6bgrQa6hjfiofo6CDGyME
         rvZ+UQoLtdeqvx1POo/U5P+9QrOw9hHk15e8EmbT/ulNKUyDinka6O+tshaFuFGLG1rW
         09wvojVNSl/W9RDn+7LMKkI6CVq2+boQLj0XGAxZlzwxs472XO3400pliElMBUh76/kS
         s2cTtfs8GdfyIxhZtgtmp7ueRKqjL8VB4yPM5Uq7M2Wneh6gXTErLjCG8MsZDY8baAfu
         5kHUUEk617vjuRQ9rbjAsLPmkxUxill4gpP4XsDSJUlZZ6qDdHYsKAQ8F7XO7CvJ6ShC
         eArw==
X-Forwarded-Encrypted: i=1; AHgh+RruZRrzglKqDvJhXYYBuqnJuQb0YUZIkpZ+iPNv27RqLtGOp7OZ+l/qcPuuWm+pr3EKZZFKYjPLL+8hjVRVzww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU4UIRNTCKsWIYI5PCIIB1XkSpfX/oTTccxXShLz6UaInA5uT0
	hCxlBhOkOVxSJYT9p44ahqMH0R5E9b7U5oJiXybQ2Mx8mzWFLymNfAPgLzMLgkYfYXPgtglenNN
	EfrOwfh8VVi26c6vyv6lVKhjYex6m3rKGhguSpzGA
X-Gm-Gg: AR+sD12w4SDuk2UoFCpWUIUkklEMVkJHzmB/fPP2Vpo1QBS0DQT5wB/Ko1ApPDO8QQK
	qHjK6fmU/ikCJpcJsUEmS0MukocLXUD5VhHpm6xKDrr8NyradE1FNJSigCUhJ7iJ3md9WvJA7tF
	05MESoVOzfE8F+2xc4PdXhsErK4AQTSgSIW9Qa2l1PxVZrLOzysm2nRy/En67tdXL/40Uk4pb18
	HWtZtS6YtOKDpfGBAsuOyluW/4nCFUkyFT2SPZfV1Hs0MvcLV7j7epq9rZt53zxiEF1k/nsFa2c
	kOMR30Bm1CH+ZMTKaskv6YIV5PJHe35jTEVgV/8jUskUcky0aFzZTXm8rlDo048gXsDLPwuNnon
	hEpEx8x6XiIiODUnPzP5m9IchoA/PREIIOK4=
X-Received: by 2002:a17:90b:51c4:b0:38e:a52e:a3c9 with SMTP id
 98e67ed59e1d1-38f6a2371dfmr4673531a91.8.1785279375292; Tue, 28 Jul 2026
 15:56:15 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jul 2026 15:56:13 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Jul 2026 15:56:13 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260722-tdx-selftests-v14-20-15ad654a50db@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com> <20260722-tdx-selftests-v14-20-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 28 Jul 2026 15:56:13 -0700
X-Gm-Features: AUfX_myT2IvN6iidckmuNazEnQKmStOxbwX6QxqpsFhVtfsB_eRaYA9iggDvkuc
Message-ID: <CAEvNRgF-B6pKMJnFv5xPkSSbz3wj01-LXTHrn+KnD7N1mp-+mQ@mail.gmail.com>
Subject: Re: [PATCH v14 20/22] KVM: selftests: Implement MMIO WRITE for the
 TDX VM
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
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

> From: Erdem Aktas <erdemaktas@google.com>
>
> Implement the tdx_mmio_write() to allow TDX VMs to request MMIO
> emulation.
>
> Follow the Intel Guest-Hypervisor Communication Interface (GHCI) spec
> to the minimum extent that a spec-abiding TDX module will pass the
> request to KVM. Skip implementing the #VE handler as described in the
> GHCI spec to reduce selftests dependency.
>
> To perform emulated I/O, VMs use the TDG.VP.VMCALL instruction to
> request MMIO.
>
> Signed-off-by: Erdem Aktas <erdemaktas@google.com>
> Co-developed-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Co-developed-by: Lisa Wang <wyihan@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> ---
>  tools/testing/selftests/kvm/Makefile.kvm          |  1 +
>  tools/testing/selftests/kvm/include/x86/tdx/tdx.h | 17 +++++++++++
>  tools/testing/selftests/kvm/lib/x86/tdx/tdx.S     | 37 +++++++++++++++++++++++
>  3 files changed, 55 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 645d9aac61db..28b33ed8c2e6 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -33,6 +33,7 @@ LIBKVM_x86 += lib/x86/tdx/tdx_util.c
>  LIBKVM_x86 += lib/x86/ucall.c
>  LIBKVM_x86 += lib/x86/vmx.c
>  LIBKVM_x86 += lib/x86/tdx/td_boot.S
> +LIBKVM_x86 += lib/x86/tdx/tdx.S
>
>  LIBKVM_arm64 += lib/arm64/gic.c
>  LIBKVM_arm64 += lib/arm64/gic_v3.c
> diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> new file mode 100644
> index 000000000000..6355a30bb47f
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef SELFTEST_KVM_TDX_TDX_H
> +#define SELFTEST_KVM_TDX_TDX_H
> +
> +#include <linux/types.h>
> +
> +#define TDG_VP_VMCALL_VE_REQUEST_MMIO    48
> +#define TDVMCALL_MMIO_WRITE		  1
> +
> +u64 __tdcall(u64 leaf, u64 r12, u64 r13, u64 r14, u64 r15);
> +
> +static inline u64 tdx_mmio_write(u64 address, u32 size, u64 data_in)
> +{
> +	return __tdcall(TDG_VP_VMCALL_VE_REQUEST_MMIO, size,
> +			TDVMCALL_MMIO_WRITE, address, data_in);
> +}
> +#endif /* SELFTEST_KVM_TDX_TDX_H */
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S
> new file mode 100644
> index 000000000000..dff48a3624a1
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +.globl __tdcall
> +/*
> + * u64 __tdcall(u64 leaf, u64 r12, u64 r13, u64 r14, u64 r15)
> + */
> +__tdcall:
> +	push %r12
> +	push %r13
> +	push %r14
> +	push %r15
> +
> +	/* Map C ABI fast arguments to TDX GHCI payload registers */
> +	/* RDI=leaf, RSI=r12, RDX=r13, RCX=r14, R8=r15 */
> +
> +	mov %rdi, %r11
> +	mov %rsi, %r12
> +	mov %rdx, %r13
> +	mov %rcx, %r14
> +	mov %r8,  %r15
> +
> +	/* TDCALL boilerplate */
> +	mov $0, %rax
> +	mov $0xFC00, %rcx	/* Expose R10-R15 */
> +	mov $0, %r10
> +
> +	/* tdcall instruction */
> +	.byte 0x66, 0x0f, 0x01, 0xcc
> +
> +	/* Extract status */
> +	mov %r10, %rax
> +
> +	pop %r15
> +	pop %r14
> +	pop %r13
> +	pop %r12
> +	ret
>
> --
> 2.55.0.229.g6434b31f56-goog

We've been discussing internally if there's a nicer way to write this
and let it scale to other tdcall wrappers in future tests, especially
when we run out of registers for passing parameters (input and output)
for other tdcalls.

Looks like the only way to prevent the compiler from messing up register
state before the tdcall instruction is to be completely explicit about
it, and to use assembly in a .S file.

I miss how readable it was in v13 [1]. Sean's comments at [1] are also
echoed in [2].

[1] https://lore.kernel.org/all/ajGUBQ3y8lvwM6_N@google.com/
[2] https://lore.kernel.org/all/YCFwo5tD3Jad6F69@google.com/

We can figure out how best to extend this when the other tests are
worked on.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

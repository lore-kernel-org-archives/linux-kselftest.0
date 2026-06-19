Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE2835E1A8
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856679; cv=pass; b=PNPB2FhVEDBwccSqxb1Vb5hWNb/lYrUYaVR1hzlKIWvgONKhhDKAmiN03/s6le5caQsGQgPRZLaBN7z+IpDRcC0So26vF0KGZY8qiCmc6TULNCQCG/B6PFwfyZPb7brN9Vi6eG7d+YxvB5r67Tgdz/XFNegHSiaTft4OJ9BaU44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856679; c=relaxed/simple;
	bh=pR0Zn2zvw6IcMAbbufKDgeBYie2BeloIDPjTlVVsmpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIK3qytOVcF2ghc4BbskLACjNRzq4oFKLsyemi5rv3E6vy+o3/VPTLSvARiyfja8LN9IJ3fkkT4cQgPOefeFp0zqyrl4KJ6FSaoeAwObTWOGJ4MGwZG5Q2q7Bu7IhTGAFRe3BArSV0xkaQOVPWel2dEOLTAKfgJ3O+e5vAU4qac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=loj6O+Nd; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="loj6O+Nd"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51765531803so194091cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 01:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781856677; cv=none;
        d=google.com; s=arc-20260327;
        b=H7lBleBM3sdeAni5pD3+A89zirBGFzAXv0n1swddJgeuBUO8UGRb2hUPn/b84Yeqhz
         UCLhh6qTWQyspH9OYpc+lVJpdHWP4P3dnt8an98m9zcfRsMi7ZaOLBASOpgmuykaapFH
         N7cwzZwdK2qR5hE/Z9cSt8n9cRMLU60jCcssP7+zlqTgQYP4oEidO/9y7uK7gnQkR+pj
         H5e1FRc5VwNB5tCUcfrt/LoVx+QhbBPXsQLsqZUMH7GXGCmpmh0X57aIAv30t9d+L1X9
         hvluxyiJDBX9wrAH+3gw8AzG0YGQK7eI/3Ly//DZOyuhwAiQ2hW1dcA3aiDZtYAhAa3P
         KIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iM+8nrvlghRqxLR5gEfhNSNnyjY3ZW8GVmgYtfXOYBs=;
        fh=EBWhofTu1hiXbue2mTT4Bo7X2u2Ev37Vh7MLtdpNSSI=;
        b=GYLTh1mULyo6UH66kmM2+vs+khmVB32GdqYW1AenSDDW183B2Kuq1RK1aNPv4eAYuG
         gYTpa5NyL1CJytzTrj1KVJHk4WMXS64+AeGUhzgaEcXRMJeSI3G15UCxFmjo6y10THnL
         OSP6TNg7wO8aB7a+rpAyq6USX49lWKJLpDuIcxnLQzwkCSQ3Xbs20p2MYHl4w04Fvb98
         ef3u6O9z3AhIxgw0efGxpCIi5IebsENdGKlfpyhH3dtG/HKSJkB+jGGqFDEZOYGFysIc
         Tghgi5noDawzsLfGG7e5OuCpbh3beJ0p9lsgf0Tof6OVhbRJqgLB6S4awS1K8EuRGFjP
         /4FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781856677; x=1782461477; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iM+8nrvlghRqxLR5gEfhNSNnyjY3ZW8GVmgYtfXOYBs=;
        b=loj6O+NddywcN7wL1xrCwqxjT4ZN9Ac53eU9ll7nxx7Xviu1AaXETFnmHI/NWxcXPr
         2tJOyD13+0Tc2mMvt/0jxvDCuCjQofn+Eu1lFwOxzQPdnek4cWrSyMzp69H5jZFbIiFw
         m2pL4MTAUSKIkrjvSWB4RIgyxLuYxhB4w0JU4cYiC64ASHdlO/8i+aQuJJ/04hbsN+UP
         CIkZGrA68OtXu619RPX4SuoMTzikB/Xhko55vP/fH4az0XznVHWuLwRXzWnVI33Ch5FK
         QkyQ18CymOUUlU5PsHCF5MaeIZWokQZr5ZD+UljGKqNfiM3VTMDvcyk35TUGjxVIQpru
         2+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856677; x=1782461477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iM+8nrvlghRqxLR5gEfhNSNnyjY3ZW8GVmgYtfXOYBs=;
        b=BweTkSavMkq/OfEoeDXl4ucl/BwVVSVWQ2foBhroAGnXjE1jOhz1FMGEyDil66Ubqr
         yid1ht2J3W2x0VOmd1gZTwaDc96zkvTmcpGJn6Ztn8mqqTjVtAGEZG8Ef4x62kxllXt0
         cGEI/uU6qsESsgYxT7ERVvEWohoJofFZ7rJS7G6sFmL+lqcO1yW9+AxTmzzutDjUgCpm
         ipQRoGV2AgDsl1RgFYMkyhbkWuGTQukZ3bhTbqoDEXqUjBt0IkdOSpmbW3b5gU0Y5GZO
         o4c5aEiy/rTjwtRUA/vklFWDcGjMYcQCsnzJ5jKB0/vHwlymgQvkXWcfBpCq6fAD3OmU
         pdkw==
X-Forwarded-Encrypted: i=1; AFNElJ/eQW2ZZ8UL4HR0tnynwWnBT27ODd4Gz3AKylQAvu2RKmbJWEUCy+iAVzwyZrMnDsVwOSRVAwJKv5fYJU0arX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQdvi/bkt1XVC4GTPIivo9Fek3laueNVmWSqnSbwyiLyv/GjYf
	90wG/G2lRCTWELlNpshKsEGdKJkuVBnMBeuYxa3nZOk56h0CU1Ls5O24aveTj0t//Zv4xXYkBya
	J50UCr3+ebXSS3yna8AzEiT43nbqtsVYrh1jMZm83
X-Gm-Gg: AfdE7cnkpoMiOup9PWp2M6jQKfD0WBV648USOMGt5qVBsFWyx/DVZjFfaM6QP/c/t+T
	UYMpVODZxIueOIJmvJiKUVO6wuNunohZ5SaTfdm0Avo+OxocQN0qsmn3QCNvtbHW6YQYcFwVDTf
	atFKYE/fmjolgwoyz+Vn4lY5utCpv6zaYmisSi7JFft5yXAYakneBThaJ9GFeE5HAp39jdqUjtJ
	07hxLeuOOiqWawbkEqX3Wckk/kx/TEOOIYrBc2py/F/IwRiyn6siM0UhVyZfiY9auffPs+rIA==
X-Received: by 2002:a05:622a:191d:b0:517:38aa:c2b3 with SMTP id
 d75a77b69052e-519e48d02b3mr6024501cf.14.1781856676299; Fri, 19 Jun 2026
 01:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-4-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-4-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:10:39 +0100
X-Gm-Features: AVVi8CdHX5FmAYr_l4a3mgee9sp6dg3wXgxt_dR1E7cWLhRy0b4A0kukfNDJw2g
Message-ID: <CA+EHjTxT9tcPk4HtyPXs1eo0bUQvwf3=G7P8ZTfJhDpXNm=ntg@mail.gmail.com>
Subject: Re: [PATCH v8 04/46] KVM: Decouple kvm_has_arch_private_mem from CONFIG_KVM_VM_MEMORY_ATTRIBUTES
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
> When memory attributes become trackable in guest_memfd, the concept of
> having private memory is no longer dependent on
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
>
> With this, on x86, kvm_arch_has_private_mem() is defined if some CoCo
> platform support (or the testing CONFIG_KVM_SW_PROTECTED_VM) is compiled
> in.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  arch/x86/include/asm/kvm_host.h | 4 +++-
>  include/linux/kvm_host.h        | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 8e8eb8a5e8a6b..1bde67cf6eb0e 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -2394,7 +2394,9 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
>                        int tdp_max_root_level, int tdp_huge_page_level);
>
>
> -#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> +#if defined(CONFIG_KVM_SW_PROTECTED_VM) ||     \
> +       defined(CONFIG_KVM_INTEL_TDX) ||        \
> +       defined(CONFIG_KVM_AMD_SEV)
>  #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
>  #endif
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 201d0f2143976..d370e834d619e 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>  }
>  #endif
>
> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> +#ifndef kvm_arch_has_private_mem
>  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>  {
>         return false;
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>

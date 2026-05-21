Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B153A48D5
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353046; cv=pass; b=SMERIWYwDAr82vbjcC4gYeFvoQEszEvPVBS4eRPAu9wHWZI16cBfo56Bo1kB3dn52z3yBEVFH1q+eSfmSegGsyT/8flnHK5wJXMGCHrXr8RmbLAA/oOICSW4fVqrwMxw36a5SIH5DjG4iL93e4XoL+osKDydvDRxMcfLSwHtikU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353046; c=relaxed/simple;
	bh=CmmmdhhayV/b7ulbjd3OCXcgROAzS38gRgBEkt+q41o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKKfeL0Rs73rx2YDvqnFEN9T38KfdVvMeZT7Uc8HgT4yTwHYMnhLH8ZHCcI6+lTFMhMFc2piD0Zj3Iwc7D3HD5tDKtrw6YPHpX5Zi79/ufeNlC5aoT/r/U56ruANKFL+AJERBy3YOK4qnGCBWFwL2vjXCIetji5BSl76OMPsCJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BdJyXLxI; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BdJyXLxI"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50e61648f10so4051cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 01:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779353042; cv=none;
        d=google.com; s=arc-20240605;
        b=FQXGyDZZTdlBE13TqSGqZzRwoZsMJmnJKaTnrQzisF9Tddk/heHBgwcSK36p9ieyd3
         Z+HnmwnGc/iVgFd2GsRyFXBm7/ddqsVJqTIkykZBQ8xvpqzJttv8BsUV8m3Zg+0XezgL
         zovlheELXwCHx6Bu0EVPcmwhBvh4cgo94fYgL/S7XPmNkLrtMC+sjSJbVBWIDL3h+giC
         IvTXZ3Y5ng/MzBA01b1htcwca1U+l6/oQhUvtZLKtwqTPLlwp3Km6UmNxHO3jKe9T9Am
         w7Xf+cIlXmCXz5Z80J+nH1GPy9i7wIb7ysw1dWADYsGM/2sqspvJNBHFlGBpFqkOLrA/
         4EHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1kiAAPdqT4PYHNduYcz+D7nl/8os61F/7CmhrRm2X2M=;
        fh=UcrnCQcPkHuJjPI33EqedWmOyVZh2DmyPXsM5h86Ulo=;
        b=Sdgho0UyDclVXYOLWo/8i7R072wMq056jwABoZIa/ERCvzX8r3nfSF2aoKVTNhBT9y
         9R43zLsEJmMzV2cFqzCF/i+dVFl7+7tQN2Wp9oOy4cofjosZircVGsbm0ZTUUuNPcPWS
         yz2XifSMmCoT8nW4OafpYvMDp9LdKXlV7M0QjAeTaRxxKPxKgX5bqcx+tzmHYMw6sUmD
         vs3NbP556++GZPDtd0X8qs7HfAt/BN/2aB7pc3VA7/RaiTSkQHdga0UhkKNF6pht+Nv9
         eS7dbX5KsAkg0QSLooAGq2TW9089l6Qyrbx+1+6SXImR2kygLYvn+sJ+O9ilm5JWvnpE
         qNEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779353042; x=1779957842; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1kiAAPdqT4PYHNduYcz+D7nl/8os61F/7CmhrRm2X2M=;
        b=BdJyXLxIZODpZDEXi3/ED0YpheRDMx3+7c2z/M1CFzjv8UFAYvcJwUxSSA2MIZd+og
         kXkY0LxL7GD/A+5usq5NoPVPbPr8+Erv37hEOb97S8au2OaQsw0Qor5YPrVbk+wvlBzt
         RxN69lnNj7h/r5v/tc4tWmYvCj5wQ9xgELlS/9DaK4rpYIV2/VwgOMPAgNvUz2CjupQQ
         k8Cayg6twhbCLiIFf9LX3Yn/zU1WeIXrBiJJXj8lCPsvykPoNs3mmWDN3LM9A84P8ohz
         +J2vUReGgrniiaMoix/RPegIBHWlIfAp2Fxrxh4dnGDRV/JfBVtyCFUg9l237p5dV6ph
         DESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353042; x=1779957842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kiAAPdqT4PYHNduYcz+D7nl/8os61F/7CmhrRm2X2M=;
        b=Wvo9swjXLfgIocp6RKB7kL/coqUngw3rZXH9kABqYdWiNArIqZBMLSRjRXLidzYJgg
         h55WxSExwv3CykICTQEcFqBPQIjHob7pJgAfK75szpPAmxgxaWT7Q8cTSHJ0kISY+HoC
         BkCsfMhOdkgPIGG6CMyfsM4dgHQUMslPDv31onGKOisbCffxmhCC0XQl/q8koSolb+Y3
         2b4Uvp+0OG6bwdCb6ohj2ViXkoPK6zO+/0k19YVOSO1utBMUfm2iEa7O2ixGkkaz1mUy
         W2AO81Lf21KPjBEtYjE94f2d1uY9r7GbQlZF+NgRgXRTX03S938bTU4s+cyaTYanYRby
         IKhg==
X-Forwarded-Encrypted: i=1; AFNElJ8w9hznbB+Zs1Haj3ZH3J492LRtFddQVmfrng+dZkLpf7d68N/EVyVSxq+TQ9crMdcOfonSDuQx4Rmjk+IjY8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC2QpclO31bM5UDTO7Osa8k5ieUHxTahYMeu7JYE0oOjSI8dIu
	KyRmecw5fdjxMa578cygSKtX+4GX2/Q4D3loO9iG/7/jpfDYjiBrIETXbm3nowPcLvxx72LoHK5
	QxgAUi6yRpQdpGUjcFV2bSwl9v89acAKUt6g+7ELe
X-Gm-Gg: Acq92OFEyXDtp/Y47K+yvlRdlUC/i6FZ1S3S2106rZRTVC6pl0CU9T4YK3XmySaW07L
	F0wQgOY3wN/Q9+Way2g6W8tWWW7MNSqFwNkKVzJ1SYfHlrh+5wgItT4oPiPmG3HgKa+eakBwHzV
	5OdappuM1+pA1cnO2UXdO8qJ/MSDGUXZAp/3xlf5zaVaACSaZsuZj0+/ep9AKAor0wy/xP10p4j
	SIGTw+h9augsT+fsdZkuphAsIaT9S9yL72nBsMG6qzxmnMPjM+9BWflrqjCDZyVsa8Bqk70J/DC
	25Msgw3HjAkPKHWfFY0=
X-Received: by 2002:a05:622a:4cc5:b0:516:4f62:85e8 with SMTP id
 d75a77b69052e-516c552713emr7157791cf.19.1779353041810; Thu, 21 May 2026
 01:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-19-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-19-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 09:44:00 +0100
X-Gm-Features: AVHnY4IQ5gCtMUjytcQydV2ClyWPBKSROIDG9-iOU8lHVPfTjxaIUJeWGPDUkE8
Message-ID: <CA+EHjTzu=28Sr3=9A9LmJEGz0tBEDbU9taznVV5kdL7s8Nw=Jg@mail.gmail.com>
Subject: Re: [PATCH v6 19/43] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
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

Hi Ackerley,

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Make vm_memory_attributes a module parameter so that userspace can disable
> the use of memory attributes on the VM level.
>
> To avoid inconsistencies in the way memory attributes are tracked in KVM
> and guest_memfd, the vm_memory_attributes module_param is made
> read-only (0444).
>
> Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable, only for (CoCo) VM types
> that might use vm_memory_attributes.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Config files always confuse me, but Sashiko might be onto something:

https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=19

I think this partially goes back to commit 6, the one I flagged
yesterday. But also adding "default y" to KVM_VM_MEMORY_ATTRIBUTES?
The default value should at least fix this issue, but I'm not sure if
it would cause other problems...

Cheers,
/fuad


> ---
>  arch/x86/kvm/Kconfig | 13 +++++++++----
>  virt/kvm/kvm_main.c  |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index b6d65ee664d0f..8b97d341bd33f 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -82,13 +82,20 @@ config KVM_WERROR
>
>  config KVM_VM_MEMORY_ATTRIBUTES
>         select KVM_MEMORY_ATTRIBUTES
> -       bool
> +       depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
> +       bool "Enable per-VM memory attributes (for CoCo VMs)"
> +       help
> +         Enable support for per-VM memory attributes, which are deprecated in
> +         favor of tracking memory attributes in guest_memfd.  Select this if
> +         you need to run CoCo VMs using a VMM that doesn't support guest_memfd
> +         memory attributes.
> +
> +         If unsure, say N.
>
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
>         depends on KVM_X86 && X86_64
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         help
>           Enable support for KVM software-protected VMs.  Currently, software-
>           protected VMs are purely a development and testing vehicle for
> @@ -139,7 +146,6 @@ config KVM_INTEL_TDX
>         bool "Intel Trust Domain Extensions (TDX) support"
>         default y
>         depends on INTEL_TDX_HOST
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_POPULATE
>         help
>           Provides support for launching Intel Trust Domain Extensions (TDX)
> @@ -163,7 +169,6 @@ config KVM_AMD_SEV
>         depends on KVM_AMD && X86_64
>         depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
>         select ARCH_HAS_CC_PLATFORM
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_PREPARE
>         select HAVE_KVM_ARCH_GMEM_INVALIDATE
>         select HAVE_KVM_ARCH_GMEM_POPULATE
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cec02d68d7039..ba195bb239aaa 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -104,6 +104,7 @@ module_param(allow_unsafe_mappings, bool, 0444);
>  #ifdef CONFIG_KVM_MEMORY_ATTRIBUTES
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  bool vm_memory_attributes = true;
> +module_param(vm_memory_attributes, bool, 0444);
>  #endif
>  DEFINE_STATIC_CALL_RET0(__kvm_get_memory_attributes, kvm_get_memory_attributes_t);
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(STATIC_CALL_KEY(__kvm_get_memory_attributes));
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>

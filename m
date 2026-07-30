Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298513A0E99
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 20:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785443712; cv=pass; b=M+9QSN1Yo2IHLShLzo3/UxCQ4zYCohIcEHTq0h9/JkfPQ7wz+3piTMBLUvIMc/pqzD8kIUq8pBaKfSTdFT8S+7/k4LPV0ZEWS1XzhFg9XcUe2lE4ltcVsoXuRk9fvHlHm0xsOUr1OJIxTuUn5W1bas3Y2k89qX/9U9Qzxci7Npw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785443712; c=relaxed/simple;
	bh=30g6+52vpLwa+w0jwIJQYFnjqb/F+49RsIdPCA/cCGI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHOrtr9aFet/rBeyQss+L39NbbM/Ffz3swEuOd7PG6Hj8KKSoboG+hPuNpsrtAtVxBx7lRfPb7g6qIhedxwK0Gc4dlwOUpamsAIkCPULa1Brnvz3dA7j+JORBGRRA9rAYsb5giOxGzPSpQ7GDzPlurEERPoeZwStDVVNpeW4OYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FgE6wtnm; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FgE6wtnm"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e58034d05so343490a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 13:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785443699; cv=none;
        d=google.com; s=arc-20260327;
        b=LMvJluploWVi/G2D/rNzDB8xrdhCtWz5CUvcdfnVmGDowHBSQstd0erP220lwRjlWU
         vnIE/NqKht7k+wWucjCKP95xsMb94I4FOEhGnNCPZA8KpfCOqSA83uyTtI4oYkKiX89q
         rS9M8O/3xsOTsL93vtIjb1o51LJdAoh2BVggYKbDfXhrnlEWVI0iDPXSFLkkWKV0vER/
         iwH1+sNhA/6xYfvIRB31sGN3VVjkfvhlVif4KGqhCcMFAQnR+bCcb563vTNFNE1yZfwo
         oB9xrf76bCxTzUsKeyY8yj0l8x2CWIKKr6HQ0jxxsX1ik4Rr4MscTA+oNHSBw1KvEYFE
         r6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ZeYSeUDQaPUMgdnk0OR676C/F3UEN+xBjEeugnIWfJ0=;
        fh=0KQqBqgVEeDyUNSu7vSDzqR8rhQSW32i3VtG+odr2XY=;
        b=Ztx3oUM+/PKobKPeoFgSI/k4FWYDhmHbcnYTDGAIHnokO4VLNQC5kIU9acigun9qya
         38wrMbGfdo05kyYgvbXwONGXdkZDaCp/iEpx4QB4eBNsKYR5n+Xi8OSw2S/HRv4ir5wl
         dKqHV0MYVERxAOn15Zx5P0NaFnH0PwQxORxBMVhU225lxju/Ar1dHtEOfqerUEpX9apP
         MCJxHt0Qv0U0cQ24eBsLbuTTdWqT0/RJqj9EpBDFGfIEyx75jOSA90fu/f/QNQToRxjD
         Ho1HupI1Gufnb68BsGBJj+E8sG3N3CPGsmq2FZ/sx7fqjb4R+JgLL/Rvehx5e+SsUWnf
         kg6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785443699; x=1786048499; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeYSeUDQaPUMgdnk0OR676C/F3UEN+xBjEeugnIWfJ0=;
        b=FgE6wtnmAFYvzjw5wFWRd6huJNE8KA8k4l1SKooUBzxMVVwd+7U7VXuCU5YcS8WEaD
         Vrwj8/c1KYuw8fdTLncr9hVfiFepcy6j5dRZ9fvrnW83jJ19GTz2sSIBW5+2Q4pS8K9E
         UMd5Cbdf8rR/SH0v4tJFusrjrjdeJC2sNbMGc7S8mBDr4DcOPl1y6QQ/mQ7maFIYlOxc
         s6IGf8HwDp9a14sShNX41524Nmf94qkwdPAAyMei1hm6JRQTUL/5daQAaLelttfr7ZtD
         0BL/uLBgdiJNBdhVo0kkOdd7FcaoTCcJqUMGRL11vNgFqkNQTxkeQhFa6HrH7JjPNZNn
         hfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785443699; x=1786048499;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeYSeUDQaPUMgdnk0OR676C/F3UEN+xBjEeugnIWfJ0=;
        b=XLoJEM7PcrQbOlTJb9qQRHbgA3zulGndr8uZ0PkMhVVq7kkYd3pPDGu2np1CqqtfZb
         dsNhLE6BZ9E/z508JCNm6ctxfkylEb/KpnfoglIoEd+gxQnY/DUx0nux/WYUhoBfyCid
         o3bpr8ZGs8fVewMTu2eWLGX2fF5Elk2EZYjcfBRIxlalgx4YMzPJi5pt92wcbMI5sVqX
         KOKPL0IVsxpJh2+H6YmUw/L6zEW9AH3m5d+ba923FlDYsfkGSNLBgOCpuMWqTnpZqF0I
         Q2r5S/PsmcGbCUEUNh2YA9D/IJATgkwID/V1AnnUtW11uUTEBWt7OI02YTXgHiB85n3V
         hYsw==
X-Forwarded-Encrypted: i=1; AHgh+RqkA1B8ZveV4xwlA+oZWelj9q71gt+GpI8zdTrmczic9jpy4qHsiWKSNyfIJSyZ/GmnhjLxXWQEcdVJzSK+r/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqI6715V147f26TaLLBKlHDfJdYjfBDkSqn1nYOVvVIoICy+Ey
	0opOzO+YnWV26Q5b3MUL8L26J6/nwOe3JxhZOPnZIrPeYlM2mpZ34RJrxtJwp5jU2HKL6ueUR0t
	fFSiUIiXvFSLnxstp0VJsltbPNWg1yXSK/rAFkqdF
X-Gm-Gg: AR+sD1306CepIxk+t21B6K1FC35V1avPsPpn5hFrmx7AHnthL6mkkKqmOFKzUNZyH3f
	wWSsivMZTfn1hjAOnDCBja6ZPdG5Gai0BZy6Dc7n3ekSmGdSA6HUciseJ2fxVM0CKhW0yB/pl30
	tVOjxgXs/Y/HhzNYm9wJcGGxmNptMZeFYvA8r4eOaKRgsM6Nmnati8sGAkUcmpPmfd3z/q68j2v
	VoPx5Bbj1tYBNEXnjfSCOpQx7f5wrygmrSyvbZtMCjMP749EgSQOhfB6JcwvUnFdY8HJyPrNd0v
	RPXL9XC673Gs5aibQwIJrlrSCekWImqvM0mIY9xOgqu5KptVguoRkl49bPqN2g5Q1pW7pBz3eo2
	I2Io8aAAdraIoldqDVe6wJaGwYd7P7AemSFI=
X-Received: by 2002:a17:90b:2c88:b0:38e:2c8f:a01a with SMTP id
 98e67ed59e1d1-38f9bda173amr3473378a91.11.1785443697893; Thu, 30 Jul 2026
 13:34:57 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 13:34:57 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 13:34:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <7dafaa90-f3d4-4be4-a5cc-472163f18040@intel.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-3-35f9aec2aed2@google.com> <7dafaa90-f3d4-4be4-a5cc-472163f18040@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 13:34:56 -0700
X-Gm-Features: AUfX_mzoiUtQGNkPMfuHgGb11yV4gcaKdQOzK-P2tpO8oMq-FVBJLM1nZe0Ady4
Message-ID: <CAEvNRgG3qXrG2ix2MEcyVo0GXaen-Pte4gFAwEN+9AY=VtGU5w@mail.gmail.com>
Subject: Re: [PATCH v9 03/41] KVM: Enumerate support for PRIVATE memory iff
 kvm_arch_has_private_mem is defined
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 7/29/2026 8:35 AM, Ackerley Tng via B4 Relay wrote:
>> From: Sean Christopherson <seanjc@google.com>
>
> Though the patch order and diff of this patch is adjusted to what looks
> in v7, per Sean's request [1], the changelog still looks somewhat
> confusing and part incorrect to me.
>
> [1] https://lore.kernel.org/all/akVGZOeR1ytfkamK@google.com/
>
>> Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE based
>> on kvm_arch_has_private_mem being #defined in anticipation of decoupling
>> kvm_supported_mem_attributes() from CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
>
> As I commented in v8, the "in anticipation of" thing is not correct.
>

What I think was intended here is that in patch 20 of this series, "KVM:
Let userspace disable per-VM mem attributes, enable per-gmem
attributes", this part

  -#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
  +#if defined(CONFIG_KVM_SW_PROTECTED_VM) ||	\
  +    defined(CONFIG_KVM_INTEL_TDX) ||		\
  +    defined(CONFIG_KVM_AMD_SEV)
   #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)

decouples CONFIG_KVM_VM_MEMORY_ATTRIBUTES from
kvm_arch_has_private_mem().

I get it now, so CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not actually being
decoupled from kvm_supported_mem_attributes().

>> guest_memfd support for memory attributes will be unconditional to avoid
>> yet more macros (all architectures that support guest_memfd are expected to
>> use per-gmem attributes at some point), at which point enumerating support
>> KVM_MEMORY_ATTRIBUTE_PRIVATE based solely on memory attributes being
>> supported _somewhere_ would result in KVM over-reporting support on arm64.
>
> 1. I'm not sure what "memory attributes being supported somewhere" means.
>
> 2. the kvm_supported_mem_attributes() will be renamed to
> kvm_supported_vm_mem_attributes() and it's still under the guard of
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES, what's relationship with "guest_memfd
> support for memory attributes"?
>

I think another way to phrase this is that if we don't make this change,
say, on the foo architecture where there's no CoCo and no private mem
support, kvm_supported_mem_attributes() would return true for the !kvm
case, which is over-reporting.

How about this, replacing the entire changelog paragraph above:

  Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE
  based on kvm_arch_has_private_mem being #defined. This improves
  reporting accuracy by not reporting support for
  KVM_MEMORY_ATTRIBUTE_PRIVATE when kvm_supported_mem_attributes() is
  called with kvm == NULL.

  Give architectures full control over overriding the default definition
  of kvm_arch_has_private_mem() by removing the coupling with
  CONFIG_KVM_VM_MEMORY_ATTRIBUTES.

  In a later patch, kvm_arch_has_private_mem() will be defined based on
  whether architectural features are compiled in, and made orthogonal to
  CONFIG_KVM_VM_MEMORY_ATTRIBUTES.

>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Reviewed-by: Fuad Tabba <tabba@google.com>
>> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>> Tested-by: Shivank Garg <shivankg@amd.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>   include/linux/kvm_host.h | 2 +-
>>   virt/kvm/kvm_main.c      | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 9f78a466c6f3e..c125d2e8155a7 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>>   }
>>   #endif
>>
>> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> +#ifndef kvm_arch_has_private_mem
>>   static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>>   {
>>   	return false;
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index 902aa166c9c0c..9501dd8d015d1 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -2421,8 +2421,10 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>>   #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>>   static u64 kvm_supported_mem_attributes(struct kvm *kvm)
>>   {
>> +#ifdef kvm_arch_has_private_mem
>>   	if (!kvm || kvm_arch_has_private_mem(kvm))
>>   		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
>> +#endif
>>
>>   	return 0;
>>   }
>>

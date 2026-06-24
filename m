Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1D332EBC
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 18:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782327488; cv=pass; b=Ij8Mynw9KQfPxRVbFov3c14C2uf2l1vDqwGyjYP8T9HGBXDqyWo4Liq0xwlbhslskceMpWWtKpaN3W8BUpuda4NHHrQeT5XYDizDBgDMaDUD2FFBpBDsGWX8bbt2Z7ZwpWgBmXKpUA7PSYLRmolbuB+VuwX8OBIy1amMTuKKCZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782327488; c=relaxed/simple;
	bh=nxiRjQbOPZYmEdcjYYgjgTTY9n8vy7cCQU+hd4oV7a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtdsNVgWPr+09QSwf/SsRDT5O+X+2unNHxQt1fAyI3hp0zEi6lfCXtLmPMnw7gPxDoXJc3xdWygzJVAPk3e9YNQmyYIh8uM7CfjNXgsbg6lQHe2rwl7XGm65PtrMd+C6oTxt+6DqUMDCLgp5Ev3pGfTAsOCBpS/TLD+sZf2zfPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AS/xcRRN; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AS/xcRRN"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51765531803so36711cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 11:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782327486; cv=none;
        d=google.com; s=arc-20260327;
        b=PMSYaRbQUK107Usk7I8Zhhb3P7ORHiA/Jpqe0Ub8U3j7NRDYqSpjkJreAh9Bk5a7Nz
         wwaT3t1XeasfGswSd/a2uR0O2/YSaW8JLWvt+d0wwMrs/lMV5YuwpcZu2KH9rzAmi7Xk
         UU/YgMF40dclpoJcNkOLyH6iFDxm3ZY+kBR8S747GjMDpi6gr2NyBDrLQoT8LwWNLa8Z
         IIABrhhruhu067h5W2Li/dllfbeJVR4HbQB1IJ/sGdcySAwr7rd+Ew5C7B+TO9IE973F
         IMVLASJRhe3erdv8qQkvck7DlhQ5o+hfkpKWzgCJIuujIn5yZhmrZ2tyPA5WEcM5L9NF
         lDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lYP2MIWClSeA6+M0aw+ZhWTqj4KB8PioFvb0d+sMqRU=;
        fh=E3WYPMNpXNfYA+Hou4SrpzkabB78G+GRc6suE9dxV3s=;
        b=f6UYd/yIPlpFSXWT7jKLjc79JebAcDlv14QPvV7JXsXoVnObd0jhrX74UV/b2b7eRL
         p4mVc9OSdUhixd+O1SFUAoe5dCgTDfePEXAUldYd7kAEKiKMtoIE9X+v5Ak/bdUFQSJ9
         Ka78fgW1i1UQrkQCEXyIsTC8prUPYS8ex4KGSqjUx9O10cyHLmex7fOlvU+0z9RezPga
         aoZ0jubSvqB2Pa5swYMVyoXEwpefaBwL74pAzIbK46e1B0WfX1QB/2SGVPLIO3eNcAVi
         kQV0z4H8hyHC1pU5LuVQ1L2sGe8uXq6BiG3d10dX6xR/b2l9U8PK0E2Tup2rlekAh+1w
         jTQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782327486; x=1782932286; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYP2MIWClSeA6+M0aw+ZhWTqj4KB8PioFvb0d+sMqRU=;
        b=AS/xcRRNmR+bDCVyt1I6w9zVKGijxhbJJ5vrAk/nwfRMsxdxVXrVDofaNYrh5uCJw3
         P13iTlLk/isUw/i5iob5fhAqiNsP3F6A/ynSmrXrQKsr4BXFTBe+A+6rGbys+c4fl+PN
         JpLXjcqg4atwKj3t1JRcC3LZY4ZeWa8G5hgE9bAqH0OkC9agCJwPBZUxGpHW3cJoCEcu
         ug7nIAL31EPFpLsQEIH4bOVvLiVwnA9xkhDfkQhTljGxNXa8OSdtaYzECfPhjlq48CgA
         eGZYt4ZJjbonTcG29ve/uyim3bqXhqC5PPcHE4/ZRhIE2OS+ZGCrxMuBF6/8lb6gmKj3
         A/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782327486; x=1782932286;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lYP2MIWClSeA6+M0aw+ZhWTqj4KB8PioFvb0d+sMqRU=;
        b=oEb9wI62Q9vDN2GtkT+wW9BIWTjW+7pSYiVDN4brpwpnRtl5tXNJVNWT9Q3Cm9zw6O
         joCwNQw0ZmOp4uy9qa8OwP9UW2pXammMvkj2FOR54HBH8NjqOwIJxXxkO07JuvxDc0dJ
         C3Y3fHqAE0ibyoIe3g3lGWP2AxqkTBes0I9BRPLqeOfOzsX9gs87J72CoC2KLno6eoJU
         PyTdkWG8Fw0qh1m7oqgNWES8yavsVmt/xEXaL7vme0nC6Iq9264K3BIVhWCF8scf1dqz
         gHiLvlRddNwNj81w6G2dgMTwnI3h2JqphmGNHVWx0AFi2NQrTIdqyCXWdXwTbYOZ2cQc
         7wpw==
X-Forwarded-Encrypted: i=1; AFNElJ9YAGu1ZAB5gDxwsHC2qVU0EC6mGFW58hmgiF5tqjqRuHMz29ucHyUxV+xdAkh5R7U7jbJzjX51T46BIaYDyAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8kqqWEZIE+36/o9d63cE2qgycofd36/1aU4tdWqcWQOUhQrq
	kvmJhsIXl2xsIhue/qS6MaDBhbtNaeNBbz09XnHswCULE6fi8SZrVBlmg9vibLXsz0dq88Bjorq
	QKxexYGOLZNCKW6TBGb/U17CkxhecFFg/0A6EeuFS
X-Gm-Gg: AfdE7cmfWp0lVd75oeI5Lg7Gf6B2xmVUwnlBgeT5qG+tga8OdNq+qOZ5Xrj6EjLmVQ9
	pH+3JfioxsHmenTUruaMoHLolwAN1SjU6jQEWJcjsO0LgXV8z5yuzVy1W8kLvueE7o+S2LxLG1j
	L0QPPMvNNF9I8iGcKVIyUEV/MdlMrTX479+i1nxhdC3lhRnX+GwkDv3j3t8D9fL8dlzajB3gAAm
	ZzT0YGg0B1lP4Gq2K04gNi8LAZ7MDjD8lyVReK9rblM5E31EpGW7/cowVo1X0grK8uKamZLDnlu
	kXVnECKt
X-Received: by 2002:ac8:7f51:0:b0:517:5ac7:332e with SMTP id
 d75a77b69052e-51a6e99e871mr1220721cf.6.1782327485393; Wed, 24 Jun 2026
 11:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 24 Jun 2026 19:57:28 +0100
X-Gm-Features: AVVi8CeYyqolczp9quGS2mTDT-o2xHvKCexfoBhgu9RXIzSIPhnTHlePhYz9Iw8
Message-ID: <CA+EHjTxUeGt1XR=7MEsGnHC7agndtN2O+N=4+4iQ+a48vPWP8Q@mail.gmail.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default
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
> From: Ackerley Tng <ackerleytng@google.com>
>
> Make in-place conversion the default if the arch has private mem.
>
> The default can be overridden at compile type by enabling

compile _time_

> CONFIG_KVM_VM_MEMORY_ATTRIBUTES, or at KVM load time through a module
> parameter.
>
> In-place conversion also implies tracking a guest's private/shared state in
> guest_memfd. To avoid inconsistencies in the way memory attributes are
> tracked between the per-VM or by guest_memfd, make the module_param
> read-only (0444).
>
> Document that using per-VM attributes for tracking private/shared state of
> guest memory is deprecated in favor of tracking in guest_memfd.
>
> Warn if the admin sets gmem_in_place_conversion as false when
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not enabled. Add warning in the code
> path where guest memory is populated for a CoCo VM, since that's the
> earliest point in a CoCo VM's lifecycle where memory attributes are
> queried. Unlike other query sites, this site is exclusively used by CoCo
> VMs.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

> ---
>  arch/x86/kvm/Kconfig   | 7 ++++++-
>  virt/kvm/guest_memfd.c | 5 +++++
>  virt/kvm/kvm_main.c    | 3 ++-
>  3 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index c28393dc664eb..a3c189d765150 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -85,7 +85,12 @@ config KVM_VM_MEMORY_ATTRIBUTES
>         bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
>         help
>           Enable support for tracking PRIVATE vs. SHARED memory using per-VM
> -         memory attributes.
> +         memory attributes.  Using per-VM attributes are deprecated in favor

nit:
are->is

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad





> +         of tracking PRIVATE state in guest_memfd.  Select this if you need
> +         to run CoCo VMs using a VMM that doesn't support guest_memfd memory
> +         attributes.
> +
> +         If unsure, say N.
>
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 86c9f5b0863cb..5cb73543c03c8 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1193,10 +1193,15 @@ static bool kvm_gmem_range_is_private(struct file *file, pgoff_t index,
>  {
>         struct maple_tree *mt = &GMEM_I(file_inode(file))->attributes;
>
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>         if (!gmem_in_place_conversion)
>                 return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>                                                           KVM_MEMORY_ATTRIBUTE_PRIVATE,
>                                                           KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +#else
> +       if (WARN_ON_ONCE(!gmem_in_place_conversion))
> +               return false;
> +#endif
>
>         return kvm_gmem_range_has_attributes(mt, index, nr_pages,
>                                              KVM_MEMORY_ATTRIBUTE_PRIVATE);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index dd1d18a1d2f68..46e92b5dc3804 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -102,7 +102,8 @@ static bool __ro_after_init allow_unsafe_mappings;
>  module_param(allow_unsafe_mappings, bool, 0444);
>
>  #ifdef kvm_arch_has_private_mem
> -bool __ro_after_init gmem_in_place_conversion = false;
> +bool __ro_after_init gmem_in_place_conversion = !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES);
> +module_param(gmem_in_place_conversion, bool, 0444);
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(gmem_in_place_conversion);
>  #endif
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>

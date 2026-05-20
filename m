Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B873EAC84
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290613; cv=pass; b=BDZg66ZXSposo0pWJ07E1qGQeQVZpLZiM0ShgEn1VbDkabkqYhZBKFQuENiPulyGp1eSSMmWbDomS8sZCVv7s8FKI+M2K8qsUyR5tGao2fMNWefzcNIjgioMYt0FZ1d5Hssgezkz1Fih6TWoYnvYeAeyj2Zc+/FQzhyl2DV04IQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290613; c=relaxed/simple;
	bh=LTvt0GO2IIoMdW77kPYbGLjxm/bcueNLJXl7aSycoec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cahm+a9WvpEqPliFQtKU+0PgLoxiiORUYgRMDOuNRH0pW97aeMj01SjRHF/xpKnvToBjEzdJfyvSnkdu+TBcyXoOwrnZhPYNk/ud0J0KkWrSdEDWVwdZkLyPPidbpy+kJwJG49FowIKByFrLv+IQ69UBNLd8a7iIMcjzYUS+Fzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F7HBBnkv; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F7HBBnkv"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d864c23bdso23801cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779290611; cv=none;
        d=google.com; s=arc-20240605;
        b=KfsEGdmk8iATgHWv/F91dVZl5KRuXCaieUOpkgGimUPwzzVPHeJD1rJMohlSHQ+UUO
         kvsM67XgEnnHSNwtjFroIwyWghqa8UBMYV/KinRrI+p/UX+2pJhXotogL+d5NlJ3WuaX
         URRRhc4FLh9zE2cjbipOXxtZc39qnmhyWppNmmh5AHUWXwkpDZgT3pv26DajJl+nabJo
         /ondaiFN0tKnUsKQKakPDrY//dCh+3dxbPp0zhVrHUptmUwu+31FLvki8WCp/lP8/LBa
         pOX4931wOSjDqQ1/W00SMDKrzFuhSpSszWtwUxRQX08nMng4suolo1As8VYP/Wt1/QFz
         osIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6WbZMU4miMiF9vdr/q40hrIlWLS/zCvaA9/R/fFQvCg=;
        fh=LSM7oOvMePuzJ9ZN9zNm3QIM0MzO5UDgMwmAUwfO/u8=;
        b=UToRMGUsaqWQudoV91MHC+OAW4TdvlYqSIHIc8CXQfbl66uGYZ9rDn3f+P+BRrtgxu
         h3CRukQ6bHSRo0DDyYG5S6dNTyrb6p3tmO4jKdM7llC6I0VCdfoDz7pTa0YE1wIMjkNv
         EcbaTqoueiUotmkQu66e9E5VUpyCgmLFeqLvqljv1IkUSE3/miMA/4xLGjL/INcjbHb+
         USEuWzPuIIauRSatBXlwLZxgFeo77gi7Zt3jAun2mYFMq0r7vgNfy0PtED3FDHajkdc/
         +vmWY0MzD+NEacn80HkyTF1BDyrIih7eT8L88g/wM65rlplbqz4J3YqQ/Ni9T6+cLrWE
         hmYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290611; x=1779895411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6WbZMU4miMiF9vdr/q40hrIlWLS/zCvaA9/R/fFQvCg=;
        b=F7HBBnkvkFRQMqLuWY6Kbo0xGXRcUz0mWhP6k/OQAWOveJeB2o8zicxm5Ihsg8sWDy
         6fw3/KWVWY+8FQ2fvwmpNC/P/7CBYBvPtq8eAMMFXPVdb/P7Wh/0t+eepKBfBZYitKVG
         waDA+TRtX7o4Hxu1vVuiTjc30nQsUmgmMpsKpekyQ4UC/NyMsm4hrnVqTWg0qTUOpBrl
         f2yoplNes41Gg/n2l970f5E58hUPVLx34S2x51imEyaO+QGBNJPm97/lKLXgmn9ZeIAX
         uoxLLYphaLLjTuisdoKT1FsCvEatnjQvUkAzFX9h5GhM46Ix+cg+7heP5iNmiub7dw+H
         XU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290611; x=1779895411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WbZMU4miMiF9vdr/q40hrIlWLS/zCvaA9/R/fFQvCg=;
        b=ct0XxdFx76Nx4Ikbb+M+hEbmpV9iQv74nsQRIqbMK0ZGMuJ1tKXJ/u4bG+NF36vWSv
         dfki9Hx3vrThquedBK9V+nCzNX1zx+2OvPCfB+ZygOBYnEC2qBEpkTgPXSKaJUZv9i0t
         FeU+KMPqbbKcKVZV3sT1Cg0OwKD0kbY0qRFA9nUT3pqYRBbB8y1zzFKbelRQlBex19Th
         cc3G9ykZHiNoKR9YeqWt0ZrXHOieb9VDDBo7Szafj89AIqBC3GO/Ggm7gnFtElPGG1W/
         0ZpfJhdClm1glNSaUWYzayTv87pWOflf44BMWwCDcTvWfAjDbh72XTgcxPEfRc+lKz0R
         w7tw==
X-Forwarded-Encrypted: i=1; AFNElJ+reqwWDdDMUzJZcFr4oLIoMeLjthMdIZPeaDFa4aec/c8rSJ7mmSNLy4HCqrVzfZip3gVTtIsWJu39mZtt0zU=@vger.kernel.org
X-Gm-Message-State: AOJu0YySJTAUy4DY13yKiFfoCfeB1taKVKDY75HX8g+vKHNy96PRQQZB
	yGABvf0wK0Hz+PhfnsXHAuT+psLtGpdRWM1p2P1ihw6+B/V2SwvrJxzJ0nZUQKey6dm0U0EUHBL
	W4hODAwiL7vgphFGQv89OXTpNDzMeRRDwK9haB8PS
X-Gm-Gg: Acq92OHBApVhZMPfh2i3SL6ROH+Pd+qb3gbsm8LuNn68rJBOJwvy5lOdtri2Qv9FwUJ
	akE2BxvrEHWpGXdzbo0s3+XhzsaR2iefsMvnotb6KZk1UrPtRteKMzc/9BImiuH6iKJKNLwrFjv
	ZlT+6w5csH5bPjLGqwx8akGHKaI/0kY+Px+CZjzWS4u7g1pm+A0ZAmiNNsuJ4FnU+vDz3JiOKL4
	6VCYAKePdQdDFwzY85PJ0HVaFVKCSSCmKdMAPQp00oaG13qk0uG8pbNUlLAMEwQiT9Ax8VDssMT
	/YTefjG9T/VcE/Ipcqk=
X-Received: by 2002:a05:622a:900e:b0:50b:8d3c:5bd7 with SMTP id
 d75a77b69052e-5167b669c3fmr40334771cf.9.1779290609929; Wed, 20 May 2026
 08:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-14-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-14-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 16:22:53 +0100
X-Gm-Features: AVHnY4LJuKw2B0K-Cm-8YOXgihnw0Pgc0Lt4U2X1C7F6RPo0tjkQqSgizt_3rx0
Message-ID: <CA+EHjTzf6Bc_YgSNv0d+Rm=ALuwYuCaS=EPhrjFKDes8=+0QSw@mail.gmail.com>
Subject: Re: [PATCH v6 14/43] KVM: guest_memfd: Advertise KVM_SET_MEMORY_ATTRIBUTES2
 ioctl
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
> From: Ackerley Tng <ackerleytng@google.com>
>
> Introduce KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES to advertise the
> availability of the KVM_SET_MEMORY_ATTRIBUTES2 ioctl.
>
> KVM_SET_MEMORY_ATTRIBUTES2 is a guest_memfd-scoped version of the existing
> KVM_SET_MEMORY_ATTRIBUTES VM ioctl. It allows userspace to manage memory
> attributes, such as KVM_MEMORY_ATTRIBUTE_PRIVATE, directly on a guest_memfd
> file descriptor.
>
> This new version uses struct kvm_memory_attributes2, which adds an
> error_offset field to the output. This allows KVM to return the specific
> offset that triggered an error, which is especially useful for handling
> EAGAIN results caused by transient page reference counts during attribute
> conversions.
>
> Update the KVM API documentation to define the new ioctl and its behavior,
> and add the necessary UAPI definitions and capability checks.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Suggested-by: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  Documentation/virt/kvm/api.rst | 78 +++++++++++++++++++++++++++++++++++++++++-
>  include/uapi/linux/kvm.h       |  2 ++
>  virt/kvm/kvm_main.c            |  5 +++
>  3 files changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 52bbbb553ce10..55c2701d9ed49 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -117,7 +117,7 @@ description:
>        x86 includes both i386 and x86_64.
>
>    Type:
> -      system, vm, or vcpu.
> +      system, vm, vcpu or guest_memfd.
>
>    Parameters:
>        what parameters are accepted by the ioctl.
> @@ -6361,6 +6361,8 @@ S390:
>  Returns -EINVAL if the VM has the KVM_VM_S390_UCONTROL flag set.
>  Returns -EINVAL if called on a protected VM.
>
> +.. _KVM_SET_MEMORY_ATTRIBUTES:
> +
>  4.141 KVM_SET_MEMORY_ATTRIBUTES
>  -------------------------------
>
> @@ -6553,6 +6555,80 @@ KVM_S390_KEYOP_SSKE
>    Sets the storage key for the guest address ``guest_addr`` to the key
>    specified in ``key``, returning the previous value in ``key``.
>
> +4.145 KVM_SET_MEMORY_ATTRIBUTES2
> +---------------------------------
> +
> +:Capability: KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES
> +:Architectures: all
> +:Type: guest_memfd ioctl
> +:Parameters: struct kvm_memory_attributes2 (in/out)
> +:Returns: 0 on success, <0 on error
> +
> +Errors:
> +
> +  ========== ===============================================================
> +  EINVAL     The specified `offset` or `size` were invalid (e.g. not
> +             page aligned, causes an overflow, or size is zero).
> +  EFAULT     The parameter address was invalid.
> +  EAGAIN     Some page within requested range had unexpected refcounts. The
> +             offset of the page will be returned in `error_offset`.
> +  ENOMEM     Ran out of memory trying to track private/shared state
> +  ========== ===============================================================
> +
> +KVM_SET_MEMORY_ATTRIBUTES2 is an extension to
> +KVM_SET_MEMORY_ATTRIBUTES that supports returning (writing) values to
> +userspace.  The original (pre-extension) fields are shared with
> +KVM_SET_MEMORY_ATTRIBUTES identically.
> +
> +Attribute values are shared with KVM_SET_MEMORY_ATTRIBUTES.
> +
> +::
> +
> +  struct kvm_memory_attributes2 {
> +       /* in */
> +       union {
> +               __u64 address;
> +               __u64 offset;
> +       };
> +       __u64 size;
> +       __u64 attributes;
> +       __u64 flags;
> +       /* out */
> +       __u64 error_offset;
> +       __u64 reserved[11];
> +  };
> +
> +  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> +
> +Set attributes for a range of offsets within a guest_memfd to
> +KVM_MEMORY_ATTRIBUTE_PRIVATE to limit the specified guest_memfd backed
> +memory range for guest_use. Even if KVM_CAP_GUEST_MEMFD_MMAP is
> +supported, after a successful call to set
> +KVM_MEMORY_ATTRIBUTE_PRIVATE, the requested range will not be mappable
> +into host userspace and will only be mappable by the guest.
> +
> +To allow the range to be mappable into host userspace again, call
> +KVM_SET_MEMORY_ATTRIBUTES2 on the guest_memfd again with
> +KVM_MEMORY_ATTRIBUTE_PRIVATE unset.
> +
> +KVM does not directly manipulate the memory contents of pages during
> +attribute updates. However, the process of setting these attributes,
> +which includes operations such as unmapping pages from the host or
> +stage-2 page tables, may result in side effects on memory contents
> +that vary across different trusted firmware implementations.
> +
> +If this ioctl returns -EAGAIN, the offset of the page with unexpected
> +refcounts will be returned in `error_offset`. This can occur if there
> +are transient refcounts on the pages, taken by other parts of the
> +kernel.
> +
> +Userspace is expected to figure out how to remove all known refcounts
> +on the shared pages, such as refcounts taken by get_user_pages(), and
> +try the ioctl again. A possible source of these long term refcounts is
> +if the guest_memfd memory was pinned in IOMMU page tables.
> +
> +See also: :ref: `KVM_SET_MEMORY_ATTRIBUTES`.
> +
>  .. _kvm_run:
>
>  5. The kvm_run structure
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 0b55258573d3d..f437fd0f1350c 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -996,6 +996,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_S390_USER_OPEREXEC 246
>  #define KVM_CAP_S390_KEYOP 247
>  #define KVM_CAP_S390_VSIE_ESAMODE 248
> +#define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 249
>
>  struct kvm_irq_routing_irqchip {
>         __u32 irqchip;
> @@ -1648,6 +1649,7 @@ struct kvm_memory_attributes {
>         __u64 flags;
>  };
>
> +/* Available with KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES */
>  #define KVM_SET_MEMORY_ATTRIBUTES2              _IOWR(KVMIO,  0xd2, struct kvm_memory_attributes2)
>
>  struct kvm_memory_attributes2 {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 4d7bf52b7b717..cec02d68d7039 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4972,6 +4972,11 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>                 return 1;
>         case KVM_CAP_GUEST_MEMFD_FLAGS:
>                 return kvm_gmem_get_supported_flags(kvm);
> +       case KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES:
> +               if (vm_memory_attributes)
> +                       return 0;
> +
> +               return kvm_supported_mem_attributes(kvm);
>  #endif
>         default:
>                 break;
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>

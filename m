Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00383E3175
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285670; cv=pass; b=aRMEFOuLhMENIR8nLbsXcOLxn8jILvPgNOzJ8qDMj8++goY1F2Boax5EMEPN5nAdcVMdzJHmtH69UXSUVsZEd/UYJR39CRsIZEhBbmyKJXBP7ma9gzvcyVfn8OBKcmutx+7FJwPZ9kHy/dDUmhE/0pnwUhWgXaKTwehvrIKpfYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285670; c=relaxed/simple;
	bh=KqI0zLZ17ytNsiHeOhQjRgEAJF/6Oy8iX9IxWvab55c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INr5E0ARtao2tw6wNnwGDkZS3f7b9t141WmnRzUouU9zXetM/sKNlSXfpe1D7mZg5kZ8LQ1+8Gp8utcpvDRAv/e2SOARIgumNgAfslqVb+i3e7hHYo2HkVkO4sNN0+hiosBApqTD0cIlHeeekYn9unP0CCp7Weu1/MQ6R5c4FCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ERKjAc7P; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ERKjAc7P"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-515548f390fso1121cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 07:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779285668; cv=none;
        d=google.com; s=arc-20240605;
        b=fJy8qZ0z43+DJ/IIyVTwxemtl7sH80jznH3Q+jjy9UQOgd6YXFOXdgpZlt7TmtZJlI
         MDpTpTl51QCHsbhYQ62Vn+tWXYy9NkUY1hoxcmBtH4C3y7dhMzuW3x9Y77l/QH3rAJoi
         Ck4ii/+mBxCGbzUbscxjI89cHbSBEWC6uzD3oW+vtc6JzmClJh+E1ZzrcMIaOlWAu6ve
         u1f3K2571cgRyqtlu3vVhSxY0YFoxVqfnli6CZf3LE7KC/eWG2sUs1RwdCK0LJ53NcWS
         Y3oka6mloztMcoj2+0ZYrQmtgEyp0/PbNdGZgpZBQlbSm9APFnfD6PocfS/dt67m1R4U
         tpww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AI7U3CC1NzngQuPdfdvr3Q6fVVGPJz6btgu2++gP6TU=;
        fh=FUQCbGi1pRu2svoQqksVkzKSAAdrePIkEsPgKKsmBBQ=;
        b=J26XmPJUo03k9cEvkI94EPOlhdwDj20bai+51l7kYSWOnHGqcGPsfvtD1fimVlzMYR
         RSF0iqO4nt1HesGXiKUG+iniCEtwoHjjMK32fieNwITk1o5+NBiFICwJZ8118UGTb/Ze
         g7cCKli76nFdKsV0U5QJB8J4TUpr53zI2XDx79gf3601+ndb5QEljE6EAh2PXbah2Z+s
         bBfl6oFPB6Ave9HqVSKzrPyZV7Oa6tJvSrsUYVH8Fzxz4MWfIeCB7+oVf+2TOJzlAAtO
         gAthXnCJiqgNes4MWhsZq1Wqil3uXGDVlpJIaLOLlJyW0htRqpM5eAHpfsL2TBozHcmP
         1R6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779285668; x=1779890468; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AI7U3CC1NzngQuPdfdvr3Q6fVVGPJz6btgu2++gP6TU=;
        b=ERKjAc7PL6fYz5pAuZ+JoytJwk4NKW0/jdQU8Qsy6SRjvo+TeIzA5UlaBhoWoUXJNq
         oT+zSmRfvJO7Bv2nRfSNnqO9Q0skzdOF6TLe27/culeC7YheeWxj2CKx/yoO3Kwn6qfY
         zFP4uimhYl1k8NdUNRACFYD9CK2aSkKgkpoqfm2iob5tu947ZR4jJzGzIVpLmK2gRvQn
         eBm2Mk1yal29sbC56yseAAl2+vJpfsyyavqu1y0bNyuVctalJtno2KJIZ2jkfdpH7qKd
         uh3Ji2p6FwR5yc3X6SHy6EMSpBOwDM01nctneip0+AY/SZ6qOQPYbCmovmKaE4pfAERx
         ob2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285668; x=1779890468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AI7U3CC1NzngQuPdfdvr3Q6fVVGPJz6btgu2++gP6TU=;
        b=L6ThYfYXNg9QpjI/mBxX6tL/UeF+inJZAsoPebDFPDhRK+VEMS2KOlGvtc5vxl0S0j
         pOVTsnCwf7Cb4sIGKI7ISiBAG6p36vYeiSEjqoDPBDxGaXQA31hpIINOv9K2bts8tmwl
         U28oANQWKPfFh8MjhRoPBx3QnN2/2zzKYCt2jrijZ1EcEmHwvh8CBgt8tDGyg8521Zh0
         jSjyFktTe8UIvDSMbHSKn+UhbdARsYHL5ree/++X8N2/HIrwx3HEH3mTpTgAABI5Beau
         kee2meV6sCkksxZNjkoBvaW8zJH7hzD3r5skuSPpvNUWbmCwbL4uhUZKCIsV5uOOrKiB
         XqoA==
X-Forwarded-Encrypted: i=1; AFNElJ+m8vvUorxPqPwSPMZj0pta673VHxdDJCZGVXBBeMrs0nohU9VxoUNuszFeEVn0H2uYqML7gZqql1kHA8v3HBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTsMAoGgaVl96p3H+xVCfi88ParJ/5Q2ayJ+wccMnsDz2XlWEq
	XEL0Olg9ipXMqF1lZ9l3HpmjvIIegYPJyTFaA+kKjLsbhdxR3h0l5ZoXoCuoEsrnB5aHdX/p2xq
	J6GiuiuUf2cjHutp4EFFi7q4gmQZUTzIt1xmCtNe7
X-Gm-Gg: Acq92OFAEHQx0EGIHJu36knhV0ZD8o55++01ZFPAvlwPX36nJyG+R9ndAVMuPgniNzG
	XLu3F7tgcE8EhvtfYK2cAkaVmFdZ+AJ2cY4xB5K8/ACfhFnbQuetB+Lw/t2ihpvdG0904u6apqD
	bVEkzs62XXQcjtgaeiyVXSdupBARGqBVYvNwcAxrWcbS8c32FlgOus4uw4zakPLwNWHhsNuKQZ4
	uSe68+LocXUdwlkLRI9snumrh/5SbTRI3rSd+x4ghSwOJDGeR73hRlfu3uk5d/asI/dNJe12T+J
	jhzmW1u3l6EoGXcplMQ=
X-Received: by 2002:a05:622a:900e:b0:50b:8d3c:5bd7 with SMTP id
 d75a77b69052e-5167b669c3fmr39500301cf.9.1779285665976; Wed, 20 May 2026
 07:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-10-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-10-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 15:00:28 +0100
X-Gm-Features: AVHnY4I1xsx3pMBMFSzeQ0uJ_eCgUqjv6x_jwcWrLBSoaR3lsTGttyhku4viwLQ
Message-ID: <CA+EHjTxLXxtgTdhLnNiFwhjQWt25QWPxCqRgFRJoUBhOtSFZGA@mail.gmail.com>
Subject: Re: [PATCH v6 10/43] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
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
> Introduce base support for KVM_SET_MEMORY_ATTRIBUTES2 in guest_memfd, which
> just updates attributes tracked by guest_memfd.
>
> Validate input fields in general. Guard usage of KVM_SET_MEMORY_ATTRIBUTES2
> by making sure requested attributes are supported for this instance of kvm.
>
> A new KVM_SET_MEMORY_ATTRIBUTES2 is defined to support writes (unlike
> KVM_SET_MEMORY_ATTRIBUTES) in addition to reads so it can provide error
> details to userspace. This will be used in a later patch.
>
> The two ioctls use their corresponding structs with no overlap, but
> backward compatibility is baked in for future support of
> KVM_SET_MEMORY_ATTRIBUTES2 and struct kvm_memory_attributes2 in the VM
> ioctl.
>
> The process of setting memory attributes is set up such that the later half
> will not fail due to allocation. Any necessary checks are performed before
> the point of no return.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Sean Christoperson <seanjc@google.com>
> Signed-off-by: Sean Christoperson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>
/fuad
> ---
>  include/uapi/linux/kvm.h |  13 ++++++
>  virt/kvm/Kconfig         |   1 +
>  virt/kvm/guest_memfd.c   | 114 +++++++++++++++++++++++++++++++++++++++++++++++
>  virt/kvm/kvm_main.c      |  12 +++++
>  4 files changed, 140 insertions(+)
>
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 6c8afa2047bf3..e6bbf68a83813 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1648,6 +1648,19 @@ struct kvm_memory_attributes {
>         __u64 flags;
>  };
>
> +#define KVM_SET_MEMORY_ATTRIBUTES2              _IOWR(KVMIO,  0xd2, struct kvm_memory_attributes2)
> +
> +struct kvm_memory_attributes2 {
> +       union {
> +               __u64 address;
> +               __u64 offset;
> +       };
> +       __u64 size;
> +       __u64 attributes;
> +       __u64 flags;
> +       __u64 reserved[12];
> +};
> +
>  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
>
>  #define KVM_CREATE_GUEST_MEMFD _IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 3fea89c45cfb4..e371e079e2c50 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -109,6 +109,7 @@ config KVM_VM_MEMORY_ATTRIBUTES
>
>  config KVM_GUEST_MEMFD
>         select XARRAY_MULTI
> +       select KVM_MEMORY_ATTRIBUTES
>         bool
>
>  config HAVE_KVM_ARCH_GMEM_PREPARE
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 4f7c4824c3a45..91e89b188f583 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -540,11 +540,125 @@ unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
>  }
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_memory_attributes);
>
> +/*
> + * Preallocate memory for attributes to be stored on a maple tree, pointed to
> + * by mas.  Adjacent ranges with attributes identical to the new attributes
> + * will be merged.  Also sets mas's bounds up for storing attributes.
> + *
> + * This maintains the invariant that ranges with the same attributes will
> + * always be merged.
> + */
> +static int kvm_gmem_mas_preallocate(struct ma_state *mas, u64 attributes,
> +                                   pgoff_t start, size_t nr_pages)
> +{
> +       pgoff_t end = start + nr_pages;
> +       pgoff_t last = end - 1;
> +       void *entry;
> +
> +       /* Try extending range. entry is NULL on overflow/wrap-around. */
> +       mas_set(mas, end);
> +       entry = mas_find(mas, end);
> +       if (entry && xa_to_value(entry) == attributes)
> +               last = mas->last;
> +
> +       if (start > 0) {
> +               mas_set(mas, start - 1);
> +               entry = mas_find(mas, start - 1);
> +               if (entry && xa_to_value(entry) == attributes)
> +                       start = mas->index;
> +       }
> +
> +       mas_set_range(mas, start, last);
> +       return mas_preallocate(mas, xa_mk_value(attributes), GFP_KERNEL);
> +}
> +
> +static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
> +                                    size_t nr_pages, uint64_t attrs)
> +{
> +       struct address_space *mapping = inode->i_mapping;
> +       struct gmem_inode *gi = GMEM_I(inode);
> +       pgoff_t end = start + nr_pages;
> +       struct maple_tree *mt;
> +       struct ma_state mas;
> +       int r;
> +
> +       mt = &gi->attributes;
> +
> +       filemap_invalidate_lock(mapping);
> +
> +       mas_init(&mas, mt, start);
> +       r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
> +       if (r)
> +               goto out;
> +
> +       /*
> +        * From this point on guest_memfd has performed necessary
> +        * checks and can proceed to do guest-breaking changes.
> +        */
> +
> +       kvm_gmem_invalidate_begin(inode, start, end);
> +       mas_store_prealloc(&mas, xa_mk_value(attrs));
> +       kvm_gmem_invalidate_end(inode, start, end);
> +out:
> +       filemap_invalidate_unlock(mapping);
> +       return r;
> +}
> +
> +static long kvm_gmem_set_attributes(struct file *file, void __user *argp)
> +{
> +       struct gmem_file *f = file->private_data;
> +       struct inode *inode = file_inode(file);
> +       struct kvm_memory_attributes2 attrs;
> +       size_t nr_pages;
> +       pgoff_t index;
> +       int i;
> +
> +       if (copy_from_user(&attrs, argp, sizeof(attrs)))
> +               return -EFAULT;
> +
> +       if (attrs.flags)
> +               return -EINVAL;
> +       for (i = 0; i < ARRAY_SIZE(attrs.reserved); i++) {
> +               if (attrs.reserved[i])
> +                       return -EINVAL;
> +       }
> +       if (attrs.attributes & ~kvm_supported_mem_attributes(f->kvm))
> +               return -EINVAL;
> +       if (attrs.size == 0 || attrs.offset + attrs.size < attrs.offset)
> +               return -EINVAL;
> +       if (!PAGE_ALIGNED(attrs.offset) || !PAGE_ALIGNED(attrs.size))
> +               return -EINVAL;
> +
> +       if (attrs.offset >= i_size_read(inode) ||
> +           attrs.offset + attrs.size > i_size_read(inode))
> +               return -EINVAL;
> +
> +       nr_pages = attrs.size >> PAGE_SHIFT;
> +       index = attrs.offset >> PAGE_SHIFT;
> +       return __kvm_gmem_set_attributes(inode, index, nr_pages,
> +                                        attrs.attributes);
> +}
> +
> +static long kvm_gmem_ioctl(struct file *file, unsigned int ioctl,
> +                          unsigned long arg)
> +{
> +       switch (ioctl) {
> +       case KVM_SET_MEMORY_ATTRIBUTES2:
> +               if (vm_memory_attributes)
> +                       return -ENOTTY;
> +
> +               return kvm_gmem_set_attributes(file, (void __user *)arg);
> +       default:
> +               return -ENOTTY;
> +       }
> +}
> +
>  static struct file_operations kvm_gmem_fops = {
>         .mmap           = kvm_gmem_mmap,
>         .open           = generic_file_open,
>         .release        = kvm_gmem_release,
>         .fallocate      = kvm_gmem_fallocate,
> +       .unlocked_ioctl = kvm_gmem_ioctl,
>  };
>
>  static int kvm_gmem_migrate_folio(struct address_space *mapping,
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index ff20e63143642..4d7bf52b7b717 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -110,6 +110,18 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(STATIC_CALL_KEY(__kvm_get_memory_attributes));
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(STATIC_CALL_TRAMP(__kvm_get_memory_attributes));
>  #endif
>
> +#define MEMORY_ATTRIBUTES_MATCH(one, two)                              \
> +       static_assert(offsetof(struct kvm_memory_attributes, one) ==    \
> +                     offsetof(struct kvm_memory_attributes2, two));    \
> +       static_assert(sizeof_field(struct kvm_memory_attributes, one) ==\
> +                     sizeof_field(struct kvm_memory_attributes2, two))
> +
> +/* Ensure the common parts of the two structs are identical. */
> +MEMORY_ATTRIBUTES_MATCH(address, address);
> +MEMORY_ATTRIBUTES_MATCH(size, size);
> +MEMORY_ATTRIBUTES_MATCH(attributes, attributes);
> +MEMORY_ATTRIBUTES_MATCH(flags, flags);
> +
>  /*
>   * Ordering of locks:
>   *
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>

Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8019B39E9DE
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350278; cv=pass; b=YRy+PMH6ufL9LKE/3fDcas7UXVQ0jAc/oqpqlK/4na674tkfp/AFPs9HJN19YSJwk56A+X4Mg54GmKYNrLAxwgCOImvxlFIlIOm0qhyo70ojpezvugTPpGTfGn2BElE97Vb9q7lsfDgXudpQh4G1dWFZH/DFyYupjua467aTLCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350278; c=relaxed/simple;
	bh=4KcT8rdA6d07iJNq3wBXNazPyISKqsHOcKPYno1GuIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEyiNFyAuIy8A3GOGJAR2/TMQ/xcM3XFuQQO7Z4bg9eADPvaoYvj7cUoqgDO6XVm1i8te9HUi9ROavjjo6gn8SDmcqQdhSr4PGhZXl62PBP8Q7DdUxCGDA/kcdp3FX6lpISw+9idOtvYTVSqXwLykp/7od6Kf7IHZHos1uiiI2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PkK3X4dc; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PkK3X4dc"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-515548f390fso801cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 00:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779350261; cv=none;
        d=google.com; s=arc-20240605;
        b=MkZNvXYoKe+VrnQ+o+Z8XE/avSVY5MB3M8B7ZZnAwuTonMv/N7yYqRbQZdf1ZPavzC
         orL3FRa3QVJ78M1z4LBfXG1lbCu4kE5staVIwbeNz5jLICuKQ4qK+Ri2MEJZtZXstaWs
         aLQzqMw0LzNjZ2umDds1cU4L6ZWGQz9SjfMZ0iAYUR8dEgqMI1V+3jr359XScqDvjX8z
         eadkOlhGQZPr+U1Di+5wZZ83yuRz6248HBVQFcr/0lW23lqfOVrMcCCdsLCB6y8Pj34H
         nINDw/BdmZeh0G+7EVL9Dgx4kZnoDlzWh88fqpJliL3jPs8ltUXefPUvDYOrtrGsmk7U
         sLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tSn2g3kUTBO9UyvrMevDMplllFpiZxqy7FxTUXL/Xlw=;
        fh=zaqIS6bOUE1ydW1Em3pRYha9u3M/bq4MXs91zXf91wA=;
        b=GsyWjTTKBGI8+diRf1/32Y01737DEX4goQz9YuMrK2gbue66MZTgyvLExNqT6waGIs
         xBvFH5QT+VTAxDAswkmnK0Ve8wg7khiSZaJM2M4+eVpVHuLKd6thEvtbJyLFubqEq/f6
         h0zg/8zwrdX8jbTi8jgyf/lKy+9kkqUdgt6HR9QknyUFm4d2UAN3iiQiOhQxDA+7H+I9
         S1fVlYwMAp0BYV9lVos9cbqRx8DtfBuf4AOR1f9wosSUVYc+78E2tFixqGLLJk7zRbAU
         jUYSS3kQwRSWHCSa5d2/O3nTfqIFW5CO5NbOzinrqNj4f/cikvYAkwZJ6QfBLBsJa+8T
         kbiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779350261; x=1779955061; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tSn2g3kUTBO9UyvrMevDMplllFpiZxqy7FxTUXL/Xlw=;
        b=PkK3X4dcbhXxrjoJ1fcTfQCLtnoA6MwpGGLw/Nqy69HN+eFeKKnsX92ARB5CK7/YrG
         DXfmjOlnO6qjQFt8qZ5I85bxhc9gbSWZUx+RKVeYhiN+IIakoeunnIow5DYBRSJzH9fY
         EWEeu3gHxlH8+iQ3eU1Y16A1prp7cTfIfVAjjpEESLlYX02fqBvuN+Gi2EfEQPy+Liqx
         xrAI64RCYUX8ZKse/1yUNRQ1NCZHtjtkDWnZCN0ZXeR8MQwI3fKs/Jefh8hQfSmvQvwf
         QCZantvkGbwFbT4UqXcxyf3i05FWqvJezxEtDZ86TnXNGIPY5UR1qmgHsWC7T5pUHsGl
         PTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350261; x=1779955061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSn2g3kUTBO9UyvrMevDMplllFpiZxqy7FxTUXL/Xlw=;
        b=ZirStpGxLfV7vD1h9iIqlC8oYqFgj1rj8ZDzQsb6xyGcOEr8PEBLT3+rUaWce6ZZR3
         7BlOYjaJigZBUsqfhU87WwEdpnBOiRtqEiFvlqRqncXZWmRBSHvECcUQRg74q6AyRUPC
         aBRTYXyHnEXoiR73BEW8wzkKJV0KxNoiHGiR5srL0Yjii/PPExrGMfPjAwoI0GfBQ0i0
         S7qlnIKzRjrsqqKA0GiGFmpVfJvsVjG1uwYXun7VAUvhabBLP3z5yKSUVVr/6qTd1Yjb
         PFSPr0XtGCfV/V6AgWPkcVf1Wgq8ggVA5t6x9YBtWalJyU/09Jsb/xACMFuKiKo7DTLM
         LU5g==
X-Forwarded-Encrypted: i=1; AFNElJ+cmJZ1HzBWdHP4cbM2GF50iLluRscAE46wnGtj0S+FmvT9EJanD+2VxsFZLqYYHw+bU5H0p7eklrf4CEupEOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfn4lSOGa1fz61iLGOm77tkTGDMU7rjk1FkW7pw1nKIyRXzAmb
	0TP/TiU/1d/xOeUijY1+ZtFvh/7Bb68ifn2okZNG7DCKhjDs2Q8MW1K77wVEdjVxzW+dYwIu2Z4
	D2G8KUMG8OMxNSvKeJPm9WZbFcLowkQwAk/J4oz1S
X-Gm-Gg: Acq92OHhTJ9xVKds7ZM5YrYOGyuAY1U/XGYyQAnXwhY2/yx1smSC47ELx+E+4GaSl1h
	Q1fuUiQ9f+Q6LoVLT7w+EX5osr8PkLV1GPb2DXZR1QxJnPqiDpp+IDPa1nrlvshbXbVBA1lPBL7
	9w/9LONfDM9YvpPz5O0GJgyh8b/mkO2xVrIa11bjlyrWz+n4wVVsuqiQiAqanaqyrcZYE8394Yd
	hFAvxYGn6tB+4VK9bBy4GADboQavd1Fo7k6IJfEPC2R7BFO9wVE3Ce98UEhjhs8OJAG+Q4PRZFD
	pE6s589s35xReIu86PzHMMqaTxvAzg==
X-Received: by 2002:a05:622a:9005:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-516c53118ecmr5321871cf.1.1779350260836; Thu, 21 May 2026
 00:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-17-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-17-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 08:56:00 +0100
X-Gm-Features: AVHnY4ISxUZam6iBDjV_4hOaNzbNB8xZ_iFXhRAdE4nHy2L3vqI7KoUo1cTBaB4
Message-ID: <CA+EHjTyArkNd7cWC+OAkvkcPyM9=XUxzjg1fxFFV4GSP4wLALQ@mail.gmail.com>
Subject: Re: [PATCH v6 17/43] KVM: guest_memfd: Determine invalidation filter
 from memory attributes
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
> Before conversion, the range filter doesn't really matter:
>
> + For non-CoCo VMs that use guest_memfd, they have no mirrored tdp, so
>   KVM_DIRECT_ROOTS would have been invalidated anyway.
> + CoCo VMs could not use INIT_SHARED, and there's no conversion support, so
>   always using KVM_FILTER_PRIVATE would have worked.
>
> Now with conversion support, update kvm_gmem_get_invalidate_filter to
> inspect the memory attributes maple tree for a given range.
>
> Instead of determining the invalidation filter based on static inode
> flags, iterate through the attributes maple tree for the specific range
> being invalidated. This allows KVM to identify if the range contains
> private pages, shared pages, or both, and set the filter bits
> accordingly.
>
> Update kvm_gmem_invalidate_begin and kvm_gmem_release to pass the range
> parameters to the filter helper to ensure invalidation accurately
> targets the memory types present in the affected range.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 9f6eebfb68f6b..c9f155c2dc5c5 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -193,12 +193,24 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>         return folio;
>  }
>
> -static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
> +static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(
> +               struct inode *inode, pgoff_t start, pgoff_t end)
>  {
> -       if (GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED)
> -               return KVM_FILTER_SHARED;
> +       struct gmem_inode *gi = GMEM_I(inode);
> +       enum kvm_gfn_range_filter filter = 0;
> +       void *entry;
> +
> +       lockdep_assert(mt_lock_is_held(&gi->attributes));
> +
> +       mt_for_each(&gi->attributes, entry, start, end - 1) {
> +               filter |= (xa_to_value(entry) & KVM_MEMORY_ATTRIBUTE_PRIVATE) ?
> +                         KVM_FILTER_PRIVATE : KVM_FILTER_SHARED;
> +
> +               if (filter == (KVM_FILTER_PRIVATE | KVM_FILTER_SHARED))
> +                       break;
> +       }
>
> -       return KVM_FILTER_PRIVATE;
> +       return filter;
>  }
>
>  static void __kvm_gmem_invalidate_begin(struct gmem_file *f, pgoff_t start,
> @@ -244,7 +256,7 @@ static void kvm_gmem_invalidate_begin(struct inode *inode, pgoff_t start,
>         enum kvm_gfn_range_filter attr_filter;
>         struct gmem_file *f;
>
> -       attr_filter = kvm_gmem_get_invalidate_filter(inode);
> +       attr_filter = kvm_gmem_get_invalidate_filter(inode, start, end);
>
>         kvm_gmem_for_each_file(f, inode)
>                 __kvm_gmem_invalidate_begin(f, start, end, attr_filter);
> @@ -367,6 +379,7 @@ static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>  static int kvm_gmem_release(struct inode *inode, struct file *file)
>  {
>         struct gmem_file *f = file->private_data;
> +       enum kvm_gfn_range_filter filter;
>         struct kvm_memory_slot *slot;
>         struct kvm *kvm = f->kvm;
>         unsigned long index;
> @@ -398,8 +411,8 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>          * memory, as its lifetime is associated with the inode, not the file.
>          */
>         end = i_size_read(inode) >> PAGE_SHIFT;
> -       __kvm_gmem_invalidate_begin(f, 0, end,
> -                                   kvm_gmem_get_invalidate_filter(inode));
> +       filter = kvm_gmem_get_invalidate_filter(inode, 0, end);
> +       __kvm_gmem_invalidate_begin(f, 0, end, filter);
>         __kvm_gmem_invalidate_end(f, 0, end);
>
>         list_del(&f->entry);
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>

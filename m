Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9E73EDE7D
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288330; cv=pass; b=fNmGa1eRIHY8ODd8qIbt08h8zP371PO7ifNoMfGTJD+knVbjnnPkHsgk4tAyXoUOf/mO9pms9wMLNfAY8uW/Aa8dcU//kbAEY+py+Ht4nHUbwQIi0lW6pGidX2MBWOwvPDpnErInbarKsrb6ijFjXo19B3fs9fXEl6yDysINs1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288330; c=relaxed/simple;
	bh=mWVxXGnAXrLsmeGW6dcs9mbi7yfF/v+MCyKGHC9nj44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fs8kMWAsXwhCha+ttQARA5gdCKXTSgd7/Njxq+v/B6yPUfeqA/zwq92Tzuc4ZD+aYmpX9ihpUbC3i+k93qFrCDnUDYO2pr7qwCx09JOVbEk/RqV3hKSkbYBTYtKO5IH9udFY298biuA9bp1KoN3Clx70cViRCWL2A5FJEV63lqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HrgJw6lz; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HrgJw6lz"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d864c23bdso19561cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 07:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779288325; cv=none;
        d=google.com; s=arc-20240605;
        b=V1kBxvPEN6zihWp9+NJ+dBj4esmmVOsHLcQGgkcz/veza0Dpd6qv63rvHo3PNHdYIR
         30cKwct/JYNu16zDpQlg1hwszrieOxgpl494EH8MuJXH6Tlob46Vt8ucSA3M3ILH7CPL
         jyWqrA+epG0u9QqqsSOM9Q1Of5nQqpCHzGp5Ef6i0tYdPLUStkB5CyFdOuwHj+DgSg4S
         cugAfwnh//H09Zphpk5PyoFmIRyhfKj4WkWwOGBOV0zd1P06Qpvg9+7jdrYWrbj9kIZT
         Cpa0vSL/V4nzmcHZbBJjakCkP3SMWYFAPiIFMtvqgXF8T8bRNNjfPX0dgpcb7ujQ1OZp
         A+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BXmdRbmYCHoIn3PGJ6dUolIetDSUosv3AORcVct4e6A=;
        fh=Ec5LDVHBgWDsnzyM4fXqWX6GSWXhAL6pxsNicYI5vu4=;
        b=Ch2T0tVExzwNtUt9Qsl9e9DU0XDPhaDLFkFC/PV7EgDT5lz7unZe1gOYyhoxTGvtTc
         LFmyJzrD9kKNlc0wlpI5AyspSugCCTMwPCIIRzuO09cJx9oJIG+9sovWIRPBE7pd8nGS
         2LjpmdGN9SqtV58dKh8kua9T8fBKvfqHGe9bnSJLmO7oygBaFI3qaPYYema0434ZjwW/
         /ynh0SxQM9TZSmE/hxZC89yqn/nY+PmMhbXYa9afA6+Mkx1iVV4yyk3hpyc6/I4SOJBF
         gjYTavwatjleRleaJZHqWqik25x2X3dh4jw2zkcRARs4dho4a34lMpn9I72upXrng7fg
         cISw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779288325; x=1779893125; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BXmdRbmYCHoIn3PGJ6dUolIetDSUosv3AORcVct4e6A=;
        b=HrgJw6lzSpp3OTjOPsfe07y/5/LGj41QMshFbBcCCovdB/gwd0mgKix6USycrkSb7f
         rvgylZ5JWzygWvTi/b0MwpNN47/8Y5ePHiziLvc++o1GPEPbhdNb4kDQn/z/RxYZ8y4e
         U6/wbsWDtsLSYsOki9uUIsSmadDDrDB1rn3oV3g5al8XmO4QM2alR8DWEZBE0ppShA9R
         szTjJsRJqBb7H8molO7D5QofGuQKi6W9O8G8R5u9Gj+Zq93cSDV04CHIdMUJa6XfH+kU
         GL63mQwpAev3N3npvPtVW61A6MaLJVm0DQKoN9eYGlPvg8rmjsrsdllGq7aR5MdL0Jeu
         5d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288325; x=1779893125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXmdRbmYCHoIn3PGJ6dUolIetDSUosv3AORcVct4e6A=;
        b=GNYmAUA0MNPX+i4ESzPdOxn68AVuP38kQ2uJQhaiXMwmQ0XwKnSFg6FmPqV90vMP0i
         t5/u+cmdDBYAudVbFHB715sLfjIgLC/X11sr5d3s/IWhWTuHQlRIwIzZFH+w2ViUVHck
         dbx20VTaoabQ98xHFQNZvHFHK10e7urL3Fw7cL+zHdKDHHlk69nRh2z2cCJneQSqbXzX
         vZXpfqsB+DZmdahUWY/MO0lec9slyOiY2dS62Qhx+7NOCWG7g4ftPcP1fk3wjsWU2aNf
         nYV4gASb7wHnOS2pliH6OUBS7tIG4Llq9brtkVAxzryQv/Z/XPnK2FCFKB9HTj0w4eki
         Fykw==
X-Forwarded-Encrypted: i=1; AFNElJ/8BhK1EZ9T/ka4JPtUCTCkEcmTeZAc4FU5V8uKJn263RpQpJGX1dVXPlvNiLTqsioerKMBViuJhHS3NtGr32s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkNmWUzO8OM4NpLaVKpJ0I0boCoE74Z8XubvGjHNgw2nXT/o7D
	e4It6JJRQwdWI2EohWx4tfN9EA8yQQ3lk2heiEEwzfLf4Mh63xi2lWGsZ/lvlLV22zR+vB1x73H
	LSEASxSELVfGtE0b2taeqXH4spRE7akYqI4lOq5l8
X-Gm-Gg: Acq92OFGQEQ7AvcFavS1GpBiquWphyOqOvLiDXMFMVuQIUi7dxdd2O7ipH3aF7ALzdg
	MRS9aMwIZBvKd2tjLiw/SwjhK+wMqNiUxd/l4mN1UP/5peEM3fjuZe2Z6MH3TrIrelvXJwDQF1V
	y+Tw5oBm4dlEv4bSjEJcl3AN/qWtO2NjWEGz3ySQlxw6wTTyRGlufe3lzDbmRGQ8q1PeYrQJ3g1
	oALCfwGg5kkIi+YeG+Rc+IBb3+kiWCkcxEAKSmjvDel18ISugozvFmpSe3VvYXEwAUVXap2tXQU
	fpc+ksKTXfBJhSZ0S2eavAEI+H9SIg==
X-Received: by 2002:a05:622a:5d4:b0:516:4197:361 with SMTP id
 d75a77b69052e-5167937f111mr20387831cf.4.1779288323895; Wed, 20 May 2026
 07:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-13-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-13-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 15:44:46 +0100
X-Gm-Features: AVHnY4KqHADZuRuQJRLOmHo6Gq8ybi2wyD-GO9LIDMQsvWy73n-zAaUp_TqUxxQ
Message-ID: <CA+EHjTzDx01W5Xy=eMg54DGe8-+Pfz9u8XDgfSDiAJYu8MznmQ@mail.gmail.com>
Subject: Re: [PATCH v6 13/43] KVM: guest_memfd: Return early if range already
 has requested attributes
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
> Extract a helper out of kvm_gmem_range_is_private() that checks that a
> range has given attributes.
>
> Optimize setting memory attributes by returning early if all pages in the
> requested range already has the requested attributes.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index baf4b88dead1f..034b72b4947fb 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -86,6 +86,23 @@ static bool kvm_gmem_is_shared_mem(struct inode *inode, pgoff_t index)
>         return !kvm_gmem_is_private_mem(inode, index);
>  }
>
> +static bool kvm_gmem_range_has_attributes(struct maple_tree *mt,
> +                                         pgoff_t index, size_t nr_pages,
> +                                         u64 attributes)
> +{
> +       pgoff_t end = index + nr_pages - 1;
> +       void *entry;
> +
> +       lockdep_assert(mt_lock_is_held(mt));
> +
> +       mt_for_each(mt, entry, index, end) {
> +               if (xa_to_value(entry) != attributes)
> +                       return false;
> +       }
> +
> +       return true;
> +}
> +
>  static int __kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>                                     pgoff_t index, struct folio *folio)
>  {
> @@ -649,12 +666,15 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>         pgoff_t end = start + nr_pages;
>         struct maple_tree *mt;
>         struct ma_state mas;
> -       int r;
> +       int r = 0;
>
>         mt = &gi->attributes;
>
>         filemap_invalidate_lock(mapping);
>
> +       if (kvm_gmem_range_has_attributes(mt, start, nr_pages, attrs))
> +               goto out;
> +
>         mas_init(&mas, mt, start);
>         r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
>         if (r) {
> @@ -1140,20 +1160,13 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>  static bool kvm_gmem_range_is_private(struct gmem_inode *gi, pgoff_t index,
>                                       size_t nr_pages, struct kvm *kvm, gfn_t gfn)
>  {
> -       pgoff_t end = index + nr_pages - 1;
> -       void *entry;
> -
>         if (vm_memory_attributes)
>                 return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>                                                        KVM_MEMORY_ATTRIBUTE_PRIVATE,
>                                                        KVM_MEMORY_ATTRIBUTE_PRIVATE);
>
> -       mt_for_each(&gi->attributes, entry, index, end) {
> -               if (xa_to_value(entry) != KVM_MEMORY_ATTRIBUTE_PRIVATE)
> -                       return false;
> -       }
> -
> -       return true;
> +       return kvm_gmem_range_has_attributes(&gi->attributes, index, nr_pages,
> +                                            KVM_MEMORY_ATTRIBUTE_PRIVATE);
>  }
>
>  static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>

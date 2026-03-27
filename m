Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120F5219A8D
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 02:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774578824; cv=pass; b=o/4afhcKXmzJ8oO2peakY7TNCD4QcqDgalgKLJ17typ+Eu6IkQ4txT+R/ElrZ+H8TbAE/XlX3qJa683ngPjCii8KvVOjuPhbnPYr8zd+4SQGaEUueU2DH8lgdVJn7Bv4eZr7KeNggdAjUD+brcR1yasRj1DChjwcIUkojTTDLBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774578824; c=relaxed/simple;
	bh=V8VCXLly4w5+0+MPhojVHILnNZjHzCfdHzsAew3W6M0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpwzLxCkFNYb56/TtxuT/tKW3b/xvn0x++l0jkbuQUrd2q9IxtTs/QL/BVLX6RNo50X2i1PWDOvENfXWWZkaWJXiQ6DOk8PDQT2YmrUHzd9tJropGn82pAb5Ndob13XU6XH+65I310UOevsOQqv11E/4plA5vKjF/CNUiYt7cjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WNAez2j7; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WNAez2j7"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b979d16dd0cso286620066b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 19:33:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774578820; cv=none;
        d=google.com; s=arc-20240605;
        b=RjK9oaucPAXf+STfjhF+I0N48BP/uAL2bCMUYWO1zjv2/XydFob9sabQWjbR4GM4MK
         wE4/9Rw9IrOp1Skg9cZbrsZRjGbC+1o6z/jl6FOS9FDfOtjfHqcIuiFIuSZRxDujX7V4
         USCg83QcMny1Nr3IKg86vbGXLbFtMhotNsJF57n+NqOyLSPC5fYfhf/FgwfL7rcTdCxU
         gEIYVfZ2hTInmI0Vfv/76RB21GOsG7Y9HVn5Qh33h580leW8lns+KGQDFfrPdA+zRy/r
         FUsLNSOgm/ahrOAD2TfHHHZYqLlFEubc4ewDRmjtaQI04SmncYJccj3GCla1gMdJ92N4
         kUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J/j2LL2fzZ3HqKnkSg4Q11VeHoSjD2aRYX2gqfSMp8c=;
        fh=TYeuxZdLr/pAuqlGew9FPspvR09/JfDn90tJSbEBSPA=;
        b=FxuPcZHL7unmbEwtnBLJczRIF6F6O5e8/EEfVsc/tYZQG4ebx+hXh/8yqF9WFu70jT
         QDnq8E7gPsRaF3Ejp4fdHqvQLPy8bQ3pxIT/Xio0Zui9LwqgEEFBkUgyQ0B95Ax05ZEJ
         xA9tzI9Ax8mIGiW4bEFarZGmKww93HRUk9rYT+drbBYngjV2gpdC1uPZtA8RVWmxLwyi
         93YOsKZYvjhlcfWhOCo0A0+WXcoSGwwkgEQimNLTpY+i/Qy6lQSxY0+Ru1a7SBnMOMZ9
         xfHdS8iCArtiUMlJMzvjmW9Ix1fVYcV8e/7HLem+xUO5kZbeqiji89yxzPrPFPR6i2AI
         1iGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774578820; x=1775183620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/j2LL2fzZ3HqKnkSg4Q11VeHoSjD2aRYX2gqfSMp8c=;
        b=WNAez2j7Hs+E5z13vNZS8hdcy3gAlLN1o2gKpSHjUFWrW4ShBHkWJ+8oDxMR8qTXk9
         mg5b+ZgXKwi6InYIVPzakcE6xOqmFAgai+JQ9xtT/+gYsg1g3c6XAOQh9Yb/iEscLT4X
         09dUQFCbfpwd3AlzHpXl3ydIZBEu5VSbCEH6QAJcMWpmu5VyGZDecO2XpbabrBywJ7Fz
         zFKDWRSnu46EBDzWBEhluHD4rJiDfE4DtPUUrHJsQUC/IBqzqshdvwWVgpDx6t11bW88
         IQ2Skxlze1MA4TitpUDDxubgEYs0C6E9+PRvqHYcfUmjsr5eia0wf87c9ebwOHlAjLbu
         +Clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774578820; x=1775183620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J/j2LL2fzZ3HqKnkSg4Q11VeHoSjD2aRYX2gqfSMp8c=;
        b=SoqqFcl7U5RCWhyHBfoGggSfPf5PHlfWO8NtHwU1M5Zy5lA6UOQQU0TpUZJUWh6PZw
         P9szUSUgNTWo/G7gxFOOX4X7FvfCNrMH/jwcVQn/H67Xy/yGz8bEed/E8F97nx2n/Zpd
         ABQbh5VhdKeYnmsMQbBoCtq2PwJPcC/u6kIb16v+b+C9qhrhf/LDa9SdHrWXJy8/Qzz/
         cTVRvSvx39ZVuvI9IKAu0yxCPdWzDG2ymZU4ZTeoW7QWTmGOj57ctCjky03Mvdcxppzm
         2PnZCj3xEnOALYUhUWOjenAUDmqhA/dYSkD7S8pPv1/wPPhgUyQljMSrhZF9tal1EBeP
         AXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqKv9Z7y/W+j7Bdts+umnKz36yYxYdZsQncRTmen+E5ZDAty2/Ct4e/XkGkBE5nDYcoDcDMJEW/PmEH/rekY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWaS0MfMR50ZwHBH5vq13poH+Ex5nfQtX2Dn06OZY3Ao4DqSUB
	NHtVoLuot0KF+OeukGTO4/VfB6jKASF0yXegd8AxAqcA8q5WHmj5zMJGkK28kyvv2wVjAnHiicQ
	e/0kcwAQ9IcxIIwPpgPqqTTzmANrRp+VrAnnNqA2y
X-Gm-Gg: ATEYQzzy7CKqvuXn2StFGKgjt0hXH0QdG8qCN5Mq3wHoAH547E7/9L10OcF7w3teMGG
	ACD57nGf8jP2nxJ9NPfSLgGLC8nhZUjNJGcBQ0XxjWjO9ueXCcl3rvt1us28PbFPcSbgUVSNUGz
	JMXBMsTzDNPZB0uAjWeK6v2Fv/RyCuFp1YwHwymnnSkncG6cpCXbKob2zUx+gxM6VGQxK52eH4N
	CsoFinweQYECbMrzF45LIdSSP8nebvLsMgyE+QHdFasS8684AiXutNm4W/RGj6C/GUH7a+pBhtU
	6JfAP4xKaSejRKssCY7OpRJQcBErYoEKqT+SDk6fPqyJHT16Zg773xSAlyzFVGMog/BHmQ==
X-Received: by 2002:a17:907:7207:b0:b97:cebd:8273 with SMTP id
 a640c23a62f3a-b9b5032239amr41546366b.24.1774578819995; Thu, 26 Mar 2026
 19:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306171815.3160826-1-rppt@kernel.org> <20260306171815.3160826-14-rppt@kernel.org>
In-Reply-To: <20260306171815.3160826-14-rppt@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Thu, 26 Mar 2026 19:33:03 -0700
X-Gm-Features: AQROBzBsDaVhxDLiM-NXiOxOeLuYc-OBfbNaKVq7AIOmeniABMQbpvif4NJ_3-8
Message-ID: <CADrL8HViJ_GaRUd-k9MyM0S8b7sz3whGJHNwvFfCk+pw0+kRgA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] KVM: guest_memfd: implement userfaultfd operations
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andrea Arcangeli <aarcange@redhat.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Oscar Salvador <osalvador@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, kvm@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 9:19=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> From: Nikita Kalyazin <kalyazin@amazon.com>
>
> userfaultfd notifications about page faults used for live migration
> and snapshotting of VMs.
>
> MISSING mode allows post-copy live migration and MINOR mode allows
> optimization for post-copy live migration for VMs backed with shared
> hugetlbfs or tmpfs mappings as described in detail in commit
> 7677f7fd8be7 ("userfaultfd: add minor fault registration mode").
>
> To use the same mechanisms for VMs that use guest_memfd to map their
> memory, guest_memfd should support userfaultfd operations.
>
> Add implementation of vm_uffd_ops to guest_memfd.
>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Overall looks fine to me, but I am slightly concerned about in-place
conversion[1], and I think you're going to want to implement a
kvm_gmem_folio_present() op or something (like I was saying on the
previous patch[2]).

[1]: https://lore.kernel.org/kvm/20260326-gmem-inplace-conversion-v4-0-e202=
fe950ffd@google.com/
[2]: https://lore.kernel.org/linux-mm/CADrL8HVUJ5FL97d9ytxp2WXos6HS+U+ycpsi=
5VxffsW9vacr9Q@mail.gmail.com/

Some in-line comments below.

> ---
>  mm/filemap.c           |  1 +
>  virt/kvm/guest_memfd.c | 84 +++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 83 insertions(+), 2 deletions(-)
>
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 6cd7974d4ada..19dfcebcd23f 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -262,6 +262,7 @@ void filemap_remove_folio(struct folio *folio)
>
>         filemap_free_folio(mapping, folio);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(filemap_remove_folio, "kvm");
>
>  /*
>   * page_cache_delete_batch - delete several folios from page cache
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 017d84a7adf3..46582feeed75 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -7,6 +7,7 @@
>  #include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
> +#include <linux/userfaultfd_k.h>
>
>  #include "kvm_mm.h"
>
> @@ -107,6 +108,12 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, s=
truct kvm_memory_slot *slot,
>         return __kvm_gmem_prepare_folio(kvm, slot, index, folio);
>  }
>
> +static struct folio *kvm_gmem_get_folio_noalloc(struct inode *inode, pgo=
ff_t pgoff)
> +{
> +       return __filemap_get_folio(inode->i_mapping, pgoff,
> +                                  FGP_LOCK | FGP_ACCESSED, 0);
> +}

When in-place conversion is supported, I wonder what the semantics
should be for when we get userfaults.

Upon a userspace access to a file offset that is populated but
private, should we get a userfault or a SIGBUS?

I guess getting a userfault is strictly more useful for userspace, but
I'm not sure which choice is more correct.

> +
>  /*
>   * Returns a locked folio on success.  The caller is responsible for
>   * setting the up-to-date flag before the memory is mapped into the gues=
t.
> @@ -126,8 +133,7 @@ static struct folio *kvm_gmem_get_folio(struct inode =
*inode, pgoff_t index)
>          * Fast-path: See if folio is already present in mapping to avoid
>          * policy_lookup.
>          */
> -       folio =3D __filemap_get_folio(inode->i_mapping, index,
> -                                   FGP_LOCK | FGP_ACCESSED, 0);
> +       folio =3D kvm_gmem_get_folio_noalloc(inode, index);
>         if (!IS_ERR(folio))
>                 return folio;
>
> @@ -457,12 +463,86 @@ static struct mempolicy *kvm_gmem_get_policy(struct=
 vm_area_struct *vma,
>  }
>  #endif /* CONFIG_NUMA */
>
> +#ifdef CONFIG_USERFAULTFD
> +static bool kvm_gmem_can_userfault(struct vm_area_struct *vma, vm_flags_=
t vm_flags)
> +{
> +       struct inode *inode =3D file_inode(vma->vm_file);
> +
> +       /*
> +        * Only support userfaultfd for guest_memfd with INIT_SHARED flag=
.
> +        * This ensures the memory can be mapped to userspace.
> +        */
> +       if (!(GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED))
> +               return false;
> +
> +       return true;
> +}
> +
> +static struct folio *kvm_gmem_folio_alloc(struct vm_area_struct *vma,
> +                                         unsigned long addr)
> +{
> +       struct inode *inode =3D file_inode(vma->vm_file);
> +       pgoff_t pgoff =3D linear_page_index(vma, addr);
> +       struct mempolicy *mpol;
> +       struct folio *folio;
> +       gfp_t gfp;
> +
> +       if (unlikely(pgoff >=3D (i_size_read(inode) >> PAGE_SHIFT)))
> +               return NULL;
> +
> +       gfp =3D mapping_gfp_mask(inode->i_mapping);
> +       mpol =3D mpol_shared_policy_lookup(&GMEM_I(inode)->policy, pgoff)=
;
> +       mpol =3D mpol ?: get_task_policy(current);
> +       folio =3D filemap_alloc_folio(gfp, 0, mpol);
> +       mpol_cond_put(mpol);
> +
> +       return folio;
> +}
> +
> +static int kvm_gmem_filemap_add(struct folio *folio,
> +                               struct vm_area_struct *vma,
> +                               unsigned long addr)
> +{
> +       struct inode *inode =3D file_inode(vma->vm_file);
> +       struct address_space *mapping =3D inode->i_mapping;
> +       pgoff_t pgoff =3D linear_page_index(vma, addr);
> +       int err;
> +
> +       __folio_set_locked(folio);
> +       err =3D filemap_add_folio(mapping, folio, pgoff, GFP_KERNEL);

This is going to get more interesting with in-place conversion. I'm
not really sure how to synchronize with it, but we'll probably need to
take the invalidate lock for reading. And then we'll need a separate
uffd_op to drop it after we install the PTE... I think.

> +       if (err) {
> +               folio_unlock(folio);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static void kvm_gmem_filemap_remove(struct folio *folio,
> +                                   struct vm_area_struct *vma)
> +{
> +       filemap_remove_folio(folio);
> +       folio_unlock(folio);
> +}
> +
> +static const struct vm_uffd_ops kvm_gmem_uffd_ops =3D {
> +       .can_userfault     =3D kvm_gmem_can_userfault,
> +       .get_folio_noalloc =3D kvm_gmem_get_folio_noalloc,
> +       .alloc_folio       =3D kvm_gmem_folio_alloc,
> +       .filemap_add       =3D kvm_gmem_filemap_add,
> +       .filemap_remove    =3D kvm_gmem_filemap_remove,
> +};
> +#endif /* CONFIG_USERFAULTFD */
> +
>  static const struct vm_operations_struct kvm_gmem_vm_ops =3D {
>         .fault          =3D kvm_gmem_fault_user_mapping,
>  #ifdef CONFIG_NUMA
>         .get_policy     =3D kvm_gmem_get_policy,
>         .set_policy     =3D kvm_gmem_set_policy,
>  #endif
> +#ifdef CONFIG_USERFAULTFD
> +       .uffd_ops       =3D &kvm_gmem_uffd_ops,
> +#endif
>  };
>
>  static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
> --
> 2.51.0
>

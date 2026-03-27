Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD45D3B28D
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 00:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570070; cv=pass; b=AennzG4T0Q6TxgFvdiL7takXd1YWR9CS55AlNic/hdX2tfieiRqhDqoIBb2fZ/Jw1mRyk5hQ48R+Gs4jZgZ3ocMH9vmSMdDTiA7eKVbq/DKJpukZFdT+zNGsykEutUMJxrA/qhgMob4SXVo6uFmjbCFbHhjG/kN7TDwwff1kYfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570070; c=relaxed/simple;
	bh=FgSHeD7wYVhfNs7LKSuGcvVjUut1LetO1k8SBQQEkrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xmjddrri70fIufak7+5EHs/+jlKqZVoidpo0XXpxA2MOBbBaC1cfEAtfs0CtlFnqAedzNbzENOthuz06shfh12QQJ4VCfuEhPIeIAVCutD7W3mI3Y/NQ3BNHuPKjzSQBPmvDf+AXUsei5vC5htxrn/32KzJlLYK3oRvC2R76B/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bhtaijhj; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bhtaijhj"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso201111566b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 17:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774570066; cv=none;
        d=google.com; s=arc-20240605;
        b=cUpiCbIk/5+aEEfAreyyFto3jN+3fHMZ36pZuT8F5BZx23yln9kPZLlq14z/YjdByx
         oy+whn0UTuRvGSdthk++/HFYnufydDik2Vum1yzv82uaqiOYgRBNECpH2dySrQEnRh9R
         7fyAoX14/vEZF0EK9LhDPcfhdr25oxgvhP5qYuelSqRGROhlatpQ0pcceQcHaCOVD7CN
         nD4z/oF1cIRNstg9wMxNbern6OzwVW6ZIjPRXkVpCLftWoACexya0mLSjQWEDHD2n/o5
         sovl5cunR6SsH5fxHIKXCwk/mJ7C8ljQYwmCx/R1iDBwP3OH0akSBNWIacNDSh1otcY2
         TCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l6bohw50RBT0u5gW1o6sQ8ESS0bizoR3I3eC4aqE/wA=;
        fh=WmK7pJs2OgZ8fUoSp6igIwfq4lmXaPS0YRpJ2hxhyHY=;
        b=gIz7tmR6rkFGM6it0zJc1s4wwmbBI5ppedim0zGQPbE/ZpUmTXQUAulxVQrFLABG9w
         gaTA+KuXFLNMKLi8/OWLM/WwKM++EdyC+RE28geYv4JcHS1ar0BjGnntIahBTJOnnmop
         5R7anRvIhFxw7H/kzJ8k0NESD/Oao1rawkKZiHk9jiLUQiIbRbzMkS+ykEHlq/DdYgBe
         43lyKoed8C3oHADllc41nk7xfiO2elOdcWv0V5pokGMM0BKLQSyGyYl27Yb7pSvB6HaX
         HtPn3eKZcwd0SRIf8iWYOfrexu7xsYELG6v0KKMA97O9iVf+vpddRRTq/jD+47xYay6A
         JbvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774570066; x=1775174866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6bohw50RBT0u5gW1o6sQ8ESS0bizoR3I3eC4aqE/wA=;
        b=BhtaijhjxqzdmzdzOSvBrg9pKaD3KcRtwHwkeDs3VGAo9HLlkCQHsJ/Xs2MFsoX9G9
         YS0rLTD+MmChs6WvHbFdgvaBSv/d2ek6caPeFNGjeaihw96aKwDfPEXivta/d/uidxUW
         O6M0pztauWA1Sr5CPVgVaujYO9umKik7z3SNCsFZAhtjCgdZwVcyGCFcSUL5Ux5ACRa6
         bMoJW9mRs//UDKXsJUhbdCMIxTx1eLzMDCjdKsk/zuZTsGyjMCdR7K3l/rweRuSinWoq
         NQOdDlftaqWZmzgL0PvLXrA4Z7QnHvUXDHDvMMhTXxLdE94pGdYiDJ7KtwRYnuIza+HT
         lcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570066; x=1775174866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l6bohw50RBT0u5gW1o6sQ8ESS0bizoR3I3eC4aqE/wA=;
        b=deUbtFQQSva/GGbFLNdRFSaT9bGWwpvC+4UVZCB2ZieDENapK+AgtUZP4CvAeDiUmH
         RvYYn9cIGBrl75aLeZXms4B98mt1DlSPHqR6+XaMfdvknOWCed2TLOgZj7NhMoBi6jLz
         +aXZCwliZC3/B2bXvqIiGzq061F7l7YGDpDrl990OQcVAZZyFUpy+Msi3UF/IQz8vs06
         hB3V6z3CWdy7z2abDr6P/d/eXq7pWsRSsU/1mDzfnK3O7ZMcpS7+WIlaVyFbqv9pGMd0
         LVffF4ZbWyrtj9+AQp6VbPTRPTKe7SFJaVPe419ESU488iymMSEg5SHtltPqoEBgase9
         pgMA==
X-Forwarded-Encrypted: i=1; AJvYcCVYJpFWiHJgMhHfHrKU+eb02U1N1F3g4DeAiFMqzA2jHsbw61bELhutQ0d+hhIZURDbl6bDA+k9/xgVudTq3BA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJelW0tryxvFLMfygR3PrISIHGvMOt5SEv1jSLrLGYJ8t4LOCV
	y5kn6T3LjdUeR3ff/0nh1CvOZ/ayvUEatraopOXlOYAZwuo8McSZU9zwuM2rJSIMWcLeNUeqxXB
	mMTCSrQu92aJYRFrLbSGiG3V8Ovip7L9y9LVJnaOt
X-Gm-Gg: ATEYQzxN6hAJlCvhkPsW2s4+xcfn6C3fGwdsYdDM0PXQWmX1y76FRppiN6WsriRm3gk
	G4OwJUDDnbA1vp+Zih5Q1N2h73301CmjXUimnhAty983RCA6DC3gi+ECGXSQY+SPvn+uBD7BoLf
	wVf2v9ZvG8/BIfVqheFsIR5Qtu6caexOkhS5aGfotbsaZcJTuBWglSMj6wOZa1Pvgmwmmv4wJjz
	xT3OsmP2H12M3BqJ1nyuu8ITD/5ox7UoW0gXk1dqo202F4Az+Xcs9p4izG3AugkZrDBkQ6ybp9R
	0GgWdrECly+OMbMXylmExOxNt1fSt/aG5EqhnO5vwP3FCnOnQsbGJKTVgAtlkVwjR+VuFQ==
X-Received: by 2002:a17:907:7b9f:b0:b97:b0ee:34ed with SMTP id
 a640c23a62f3a-b9b5226a311mr13471466b.22.1774570065298; Thu, 26 Mar 2026
 17:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306171815.3160826-1-rppt@kernel.org> <20260306171815.3160826-10-rppt@kernel.org>
In-Reply-To: <20260306171815.3160826-10-rppt@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Thu, 26 Mar 2026 17:07:08 -0700
X-Gm-Features: AQROBzAFCjzaDdbadwVNMyg-TBL1aRLjN2g4Sfb-4vpKogbGWYvxURBEW8LNmxM
Message-ID: <CADrL8HUE1iBSPPDQZ3e-1gxN0Ts9kHAzb4o5X_XqSmQy2y9dRA@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] userfaultfd: introduce vm_uffd_ops->alloc_folio()
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
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> and use it to refactor mfill_atomic_pte_zeroed_folio() and
> mfill_atomic_pte_copy().
>
> mfill_atomic_pte_zeroed_folio() and mfill_atomic_pte_copy() perform
> almost identical actions:
> * allocate a folio
> * update folio contents (either copy from userspace of fill with zeros)
> * update page tables with the new folio
>
> Split a __mfill_atomic_pte() helper that handles both cases and uses
> newly introduced vm_uffd_ops->alloc_folio() to allocate the folio.
>
> Pass the ops structure from the callers to __mfill_atomic_pte() to later
> allow using anon_uffd_ops for MAP_PRIVATE mappings of file-backed VMAs.
>
> Note, that the new ops method is called alloc_folio() rather than
> folio_alloc() to avoid clash with alloc_tag macro folio_alloc().
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>

> ---
>  include/linux/userfaultfd_k.h |  6 +++
>  mm/userfaultfd.c              | 92 ++++++++++++++++++-----------------
>  2 files changed, 54 insertions(+), 44 deletions(-)
>
> diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.=
h
> index 66dfc3c164e6..4d8b879eed91 100644
> --- a/include/linux/userfaultfd_k.h
> +++ b/include/linux/userfaultfd_k.h
> @@ -91,6 +91,12 @@ struct vm_uffd_ops {
>          * The returned folio is locked and with reference held.
>          */
>         struct folio *(*get_folio_noalloc)(struct inode *inode, pgoff_t p=
goff);
> +       /*
> +        * Called during resolution of UFFDIO_COPY request.
> +        * Should return allocate a and return folio or NULL if allocatio=
n fails.

"Should allocate and return a folio or NULL if allocation fails."

I see this mistake is fixed in the next patch. :)

> +        */
> +       struct folio *(*alloc_folio)(struct vm_area_struct *vma,
> +                                    unsigned long addr);
>  };
>
>  /* A combined operation mode + behavior flags. */
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 98ade14eaa5b..31f3ab6a73e2 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -42,8 +42,26 @@ static bool anon_can_userfault(struct vm_area_struct *=
vma, vm_flags_t vm_flags)
>         return true;
>  }
>
> +static struct folio *anon_alloc_folio(struct vm_area_struct *vma,
> +                                     unsigned long addr)
> +{
> +       struct folio *folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, =
vma,
> +                                             addr);
> +
> +       if (!folio)
> +               return NULL;
> +
> +       if (mem_cgroup_charge(folio, vma->vm_mm, GFP_KERNEL)) {
> +               folio_put(folio);
> +               return NULL;
> +       }
> +
> +       return folio;
> +}
> +
>  static const struct vm_uffd_ops anon_uffd_ops =3D {
>         .can_userfault  =3D anon_can_userfault,
> +       .alloc_folio    =3D anon_alloc_folio,
>  };
>
>  static const struct vm_uffd_ops *vma_uffd_ops(struct vm_area_struct *vma=
)
> @@ -458,7 +476,8 @@ static int mfill_copy_folio_retry(struct mfill_state =
*state, struct folio *folio
>         return 0;
>  }
>
> -static int mfill_atomic_pte_copy(struct mfill_state *state)
> +static int __mfill_atomic_pte(struct mfill_state *state,
> +                             const struct vm_uffd_ops *ops)
>  {
>         unsigned long dst_addr =3D state->dst_addr;
>         unsigned long src_addr =3D state->src_addr;
> @@ -466,16 +485,12 @@ static int mfill_atomic_pte_copy(struct mfill_state=
 *state)
>         struct folio *folio;
>         int ret;
>
> -       folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, state->vma, ds=
t_addr);
> +       folio =3D ops->alloc_folio(state->vma, state->dst_addr);
>         if (!folio)
>                 return -ENOMEM;
>
> -       ret =3D -ENOMEM;
> -       if (mem_cgroup_charge(folio, state->vma->vm_mm, GFP_KERNEL))
> -               goto out_release;
> -
> -       ret =3D mfill_copy_folio_locked(folio, src_addr);
> -       if (unlikely(ret)) {
> +       if (uffd_flags_mode_is(flags, MFILL_ATOMIC_COPY)) {
> +               ret =3D mfill_copy_folio_locked(folio, src_addr);
>                 /*
>                  * Fallback to copy_from_user outside mmap_lock.
>                  * If retry is successful, mfill_copy_folio_locked() retu=
rns
> @@ -483,9 +498,15 @@ static int mfill_atomic_pte_copy(struct mfill_state =
*state)
>                  * If there was an error, we must mfill_put_vma() anyway =
and it
>                  * will take care of unlocking if needed.
>                  */
> -               ret =3D mfill_copy_folio_retry(state, folio);
> -               if (ret)
> -                       goto out_release;
> +               if (unlikely(ret)) {
> +                       ret =3D mfill_copy_folio_retry(state, folio);
> +                       if (ret)
> +                               goto err_folio_put;
> +               }
> +       } else if (uffd_flags_mode_is(flags, MFILL_ATOMIC_ZEROPAGE)) {
> +               clear_user_highpage(&folio->page, state->dst_addr);
> +       } else {
> +               VM_WARN_ONCE(1, "unknown UFFDIO operation");

"Unknown UFFDIO operation. flags=3D%x", flags

seems a little better to me.

>         }
>
>         /*
> @@ -498,47 +519,30 @@ static int mfill_atomic_pte_copy(struct mfill_state=
 *state)
>         ret =3D mfill_atomic_install_pte(state->pmd, state->vma, dst_addr=
,
>                                        &folio->page, true, flags);
>         if (ret)
> -               goto out_release;
> -out:
> -       return ret;
> -out_release:
> +               goto err_folio_put;
> +
> +       return 0;
> +
> +err_folio_put:
> +       folio_put(folio);
>         /* Don't return -ENOENT so that our caller won't retry */
>         if (ret =3D=3D -ENOENT)
>                 ret =3D -EFAULT;
> -       folio_put(folio);
> -       goto out;
> +       return ret;
>  }
>
> -static int mfill_atomic_pte_zeroed_folio(pmd_t *dst_pmd,
> -                                        struct vm_area_struct *dst_vma,
> -                                        unsigned long dst_addr)
> +static int mfill_atomic_pte_copy(struct mfill_state *state)
>  {
> -       struct folio *folio;
> -       int ret =3D -ENOMEM;
> -
> -       folio =3D vma_alloc_zeroed_movable_folio(dst_vma, dst_addr);
> -       if (!folio)
> -               return ret;
> -
> -       if (mem_cgroup_charge(folio, dst_vma->vm_mm, GFP_KERNEL))
> -               goto out_put;
> +       const struct vm_uffd_ops *ops =3D vma_uffd_ops(state->vma);
>
> -       /*
> -        * The memory barrier inside __folio_mark_uptodate makes sure tha=
t
> -        * zeroing out the folio become visible before mapping the page
> -        * using set_pte_at(). See do_anonymous_page().
> -        */
> -       __folio_mark_uptodate(folio);
> +       return __mfill_atomic_pte(state, ops);
> +}
>
> -       ret =3D mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
> -                                      &folio->page, true, 0);
> -       if (ret)
> -               goto out_put;
> +static int mfill_atomic_pte_zeroed_folio(struct mfill_state *state)
> +{
> +       const struct vm_uffd_ops *ops =3D vma_uffd_ops(state->vma);
>
> -       return 0;
> -out_put:
> -       folio_put(folio);
> -       return ret;
> +       return __mfill_atomic_pte(state, ops);
>  }
>
>  static int mfill_atomic_pte_zeropage(struct mfill_state *state)
> @@ -551,7 +555,7 @@ static int mfill_atomic_pte_zeropage(struct mfill_sta=
te *state)
>         int ret;
>
>         if (mm_forbids_zeropage(dst_vma->vm_mm))
> -               return mfill_atomic_pte_zeroed_folio(dst_pmd, dst_vma, ds=
t_addr);
> +               return mfill_atomic_pte_zeroed_folio(state);
>
>         _dst_pte =3D pte_mkspecial(pfn_pte(my_zero_pfn(dst_addr),
>                                          dst_vma->vm_page_prot));
> --
> 2.51.0
>

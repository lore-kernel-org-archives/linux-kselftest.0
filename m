Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FF33C061A
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 23:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774568648; cv=pass; b=Cy7wO7j/NTkAH1zKHYDjM02U0hLG7pJXW2ip6dNKGeU8lsHGC2pt0QJE2bZGQwWgm0H4h7PTgj0KpoGX4itaOFGyl36iN3hXcK/oqoQtPrFAcanm/ifgk1gi3HFlBZS9rP3VXzJZ7+T39owNz7IQuYsL0FOu6kspAxOP68nrZsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774568648; c=relaxed/simple;
	bh=Pb0JOisSdNLe/Vp8GXuqJ/O1myBVWi0RywN0o64B5XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VH9SZA1sPEiH/zgaEqc0lz3oQiCLxS9RYUj8rbg3kocj/U055dfuTqegkV3J1YgOMwCt0farKrAfNQdb8mC9hqlR2FR+YNk7UH8Yt6lgpDF1w236G4RxSSa6RLQdsx5eAgzFo2w7OMfvl1JrPc4nOBvM1T1dYAWr5pu8OMdRNG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tInVYKBT; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tInVYKBT"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b93698bb57aso272539066b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774568644; cv=none;
        d=google.com; s=arc-20240605;
        b=dtGvr+N85TrJ+6OhSznqju8kmIB+m9iMAYDYzacGdXu9Dkx8glLOHl0/Vx7VEgVcgM
         nmx2h5TvXF+mjPaiXrpaQJsZr2Bzm6wb+Fvq5IJB/ahhZTwzuTJHol+zWJo5ZYv/nFZG
         1VfOgBOnOnN+0CvZQU1NfXnfIg+Ucs1NHRbkAcEfSmSpEo2zZUuWRVLLkTSrn+2jDkDG
         j80pdj6ohZ5w2KZUErp0dpruxdjSpkQgRyyCeQe5lz6lBedV7ytru9ejXFC16jCRYYFn
         kmbpcgfWCnYAUB+3+IDakBTescU2111SfJMpMLSXOuqT2cLa7Dhy6eQ9BXQE74e82jSI
         epmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L68mNlQ2aNktAeGDkbTqCm2ejfgTC0J1kW+t2jekoYA=;
        fh=ZYQfXGkuCBIZbw8UoB8+QqGIpqcDLOT731A3SQYFFS4=;
        b=HPrKvuFVd9RtHBXbwaP00kkYkb1aK2r9Y+YUtwmr9X8wbz9iWp1E/Vju2rjDT8olG1
         Jxt1LRRp26YGaYvarpdhFmb6HUsRkhiGyXIuIM2KNrh3k1jVtDlHYJ+Wphh3OSlnY4Hh
         /qiXu75skcJfcxF3DVB1btXDyrtSs5U8fFvBPtFbebVTxlY9E/0LnlHLariz+1wFljsT
         yDIf9RBA7PLlM4jMHR9LlhmgxgmBgVSUK9MIpaL6zgFjlIr9EDsbtFVPJJL8Z15/XzmH
         a9VZ+p1SMVhgFbuaz26PwPr/yCwibVKlSN8xEdpEOkJa0gTbd4mNL4xOS48ba42yh7kJ
         M5UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774568644; x=1775173444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L68mNlQ2aNktAeGDkbTqCm2ejfgTC0J1kW+t2jekoYA=;
        b=tInVYKBT7wF+WFSBhJm7VkrKNwAuxwm6+UXuuhLhfW7gcgiLvoyVaccHtIoKEV8QWh
         vzHj+lGcQSylFFuCAcjQiHxHF3DW5SR0RaCLfit2tTUu7JTRtuRU9e3owqrXfa7smHUE
         hC/EOx6aV71JUABWH+xyoBcc9HE8A9YieOsg9BYKmA4tAwkK3WgdoxaxtRaZCeit3QrJ
         xYwzOf2EnQD2g8ehUZaoubwttOmEWyx6YczyCFd/Z5x6QLZNjussgkybQArgdadMwkx3
         tQ7cyRlkRZXZcJHFcR0yutfeWlv4ziSYwjrbyY6ButKua2q4sMej/oTExIN7fTOqHRaP
         6hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774568644; x=1775173444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L68mNlQ2aNktAeGDkbTqCm2ejfgTC0J1kW+t2jekoYA=;
        b=VL9kyBdBhSbXxkAZPb1jW5IuJrhA2lmnK32/yHzUBSB+5Rb83enFYVUYBcpMasheAl
         DSjsTZUa4MzF6+nHQPLap5jpl8Wi9AErpUmfpz3KoKsQDsK08WkDwXv/txBa9Ns86MA6
         Cpe80WES3LBobNiGRgYuq0/eUySvGE1l+ezTjQdl1mPqR469SjP8o5lclhfxxKQG8Wj1
         CX4mXEpinf4xi6+a3vZbBBsGQBJsTdEvnWz1qwZplgtZ71cmgWDuptN73tsMQqG5YEcZ
         sD5tBwfpR61YfmQaNfsC2y2PLMcSysohs9zb80q2fxOONp7TNBZ6zNQ8UZE6wZ8O5GzH
         WNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNXzeDxQPuyXEOa8xjgUhAIzKV/TKWR9Fn0JjZkXWx15z9D7bYotdmq0rwJRj9wGuh7DXX+qHbhd4SlPuH1r4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9TZh2a8NFLP2cs1gCdfv9T3S1goGc3SA0BsM0e7907xlpjWNq
	wBv1DY7nVKqs2abBpE5IR2PvQukyD53IJY/P0cvBkMfvOhqumVSNCtOoHDNaYNLlGAMCib2vZuj
	W3eCVAbsI2akZi6yrO58z4TOF7dBb/CD8F7AzvXfd
X-Gm-Gg: ATEYQzx11+du0w/gK+C37o5fpRNp3CNc6umeGHfxzfe8NVUhPD9bAV3hMazDjCvH0fE
	v5DFmYFynSTiUkYRDKGwRmO7Sxuxz8Lz9TQW0ynEK0V3yr31j2s9Z42WCMagFCcXpNhgeyAbAYH
	rYHsDLDmx1VgtW231T9t1nae7k3rGqdd3MvH53ND8nQPm90mwyep1MFFaaAwFhtcDkWtBMMLx2C
	7XcF1W/v/nrCnQgGz/eo5u9f7oNJ2424N3Yz9NDAzAZ1EuMTSSp6sB3FnTKRBTjCYFYVZI65Yox
	iTjn9g1hPBA6YuaqkzpTTpKII0NoPy2rw1vl6EY1Pywnj0W2urxeFFnoPIS6w1lHDnPu/w==
X-Received: by 2002:a17:907:869f:b0:b98:783:e3a6 with SMTP id
 a640c23a62f3a-b9b51c182f0mr11471766b.2.1774568643684; Thu, 26 Mar 2026
 16:44:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306171815.3160826-1-rppt@kernel.org> <20260306171815.3160826-9-rppt@kernel.org>
In-Reply-To: <20260306171815.3160826-9-rppt@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Thu, 26 Mar 2026 16:43:27 -0700
X-Gm-Features: AQROBzDUH86W_vbaQ5IFMdgkIth43YWmx8PcWXXGMYiTu68hLc064Iju9vJWs6M
Message-ID: <CADrL8HWLnuQHEPFN9SZbAd_Lq1USJDV=Di4fsQuztwp4v5oXOg@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] shmem, userfaultfd: use a VMA callback to handle UFFDIO_CONTINUE
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
> When userspace resolves a page fault in a shmem VMA with UFFDIO_CONTINUE
> it needs to get a folio that already exists in the pagecache backing
> that VMA.
>
> Instead of using shmem_get_folio() for that, add a get_folio_noalloc()
> method to 'struct vm_uffd_ops' that will return a folio if it exists in
> the VMA's pagecache at given pgoff.
>
> Implement get_folio_noalloc() method for shmem and slightly refactor
> userfaultfd's mfill_get_vma() and mfill_atomic_pte_continue() to support
> this new API.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

I found myself asking why HugeTLB wasn't included here; it's because
we call into hugetlb_mfill_atomic_pte() pretty early. It would be nice
to have HugeTLB implement get_folio_noalloc() and use the same path as
shmem, but we don't have to do that now.

Feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>

> ---
>  include/linux/userfaultfd_k.h |  7 +++++++
>  mm/shmem.c                    | 15 ++++++++++++++-
>  mm/userfaultfd.c              | 32 ++++++++++++++++----------------
>  3 files changed, 37 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.=
h
> index 56e85ab166c7..66dfc3c164e6 100644
> --- a/include/linux/userfaultfd_k.h
> +++ b/include/linux/userfaultfd_k.h
> @@ -84,6 +84,13 @@ extern vm_fault_t handle_userfault(struct vm_fault *vm=
f, unsigned long reason);
>  struct vm_uffd_ops {
>         /* Checks if a VMA can support userfaultfd */
>         bool (*can_userfault)(struct vm_area_struct *vma, vm_flags_t vm_f=
lags);
> +       /*
> +        * Called to resolve UFFDIO_CONTINUE request.
> +        * Should return the folio found at pgoff in the VMA's pagecache =
if it
> +        * exists or ERR_PTR otherwise.
> +        * The returned folio is locked and with reference held.
> +        */
> +       struct folio *(*get_folio_noalloc)(struct inode *inode, pgoff_t p=
goff);
>  };
>
>  /* A combined operation mode + behavior flags. */
> diff --git a/mm/shmem.c b/mm/shmem.c
> index f2a25805b9bf..7bd887b64f62 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -3295,13 +3295,26 @@ int shmem_mfill_atomic_pte(pmd_t *dst_pmd,
>         return ret;
>  }
>
> +static struct folio *shmem_get_folio_noalloc(struct inode *inode, pgoff_=
t pgoff)
> +{
> +       struct folio *folio;
> +       int err;
> +
> +       err =3D shmem_get_folio(inode, pgoff, 0, &folio, SGP_NOALLOC);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return folio;
> +}
> +
>  static bool shmem_can_userfault(struct vm_area_struct *vma, vm_flags_t v=
m_flags)
>  {
>         return true;
>  }
>
>  static const struct vm_uffd_ops shmem_uffd_ops =3D {
> -       .can_userfault  =3D shmem_can_userfault,
> +       .can_userfault          =3D shmem_can_userfault,
> +       .get_folio_noalloc      =3D shmem_get_folio_noalloc,
>  };
>  #endif /* CONFIG_USERFAULTFD */
>
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index b55d4a8d88cc..98ade14eaa5b 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -191,6 +191,7 @@ static int mfill_get_vma(struct mfill_state *state)
>         struct userfaultfd_ctx *ctx =3D state->ctx;
>         uffd_flags_t flags =3D state->flags;
>         struct vm_area_struct *dst_vma;
> +       const struct vm_uffd_ops *ops;
>         int err;
>
>         /*
> @@ -231,10 +232,12 @@ static int mfill_get_vma(struct mfill_state *state)
>         if (is_vm_hugetlb_page(dst_vma))
>                 goto out;
>
> -       if (!vma_is_anonymous(dst_vma) && !vma_is_shmem(dst_vma))
> +       ops =3D vma_uffd_ops(dst_vma);
> +       if (!ops)
>                 goto out_unlock;
> -       if (!vma_is_shmem(dst_vma) &&
> -           uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE))
> +
> +       if (uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE) &&
> +           !ops->get_folio_noalloc)
>                 goto out_unlock;
>
>  out:
> @@ -577,6 +580,7 @@ static int mfill_atomic_pte_zeropage(struct mfill_sta=
te *state)
>  static int mfill_atomic_pte_continue(struct mfill_state *state)
>  {
>         struct vm_area_struct *dst_vma =3D state->vma;
> +       const struct vm_uffd_ops *ops =3D vma_uffd_ops(dst_vma);
>         unsigned long dst_addr =3D state->dst_addr;
>         pgoff_t pgoff =3D linear_page_index(dst_vma, dst_addr);
>         struct inode *inode =3D file_inode(dst_vma->vm_file);
> @@ -586,16 +590,13 @@ static int mfill_atomic_pte_continue(struct mfill_s=
tate *state)
>         struct page *page;
>         int ret;
>
> -       ret =3D shmem_get_folio(inode, pgoff, 0, &folio, SGP_NOALLOC);
> +       if (!ops)
> +               return -EOPNOTSUPP;

Perhaps WARN_ON_ONCE(!ops)?


> +
> +       folio =3D ops->get_folio_noalloc(inode, pgoff);
>         /* Our caller expects us to return -EFAULT if we failed to find f=
olio */
> -       if (ret =3D=3D -ENOENT)
> -               ret =3D -EFAULT;
> -       if (ret)
> -               goto out;
> -       if (!folio) {
> -               ret =3D -EFAULT;
> -               goto out;
> -       }
> +       if (IS_ERR_OR_NULL(folio))
> +               return -EFAULT;
>
>         page =3D folio_file_page(folio, pgoff);
>         if (PageHWPoison(page)) {
> @@ -609,13 +610,12 @@ static int mfill_atomic_pte_continue(struct mfill_s=
tate *state)
>                 goto out_release;
>
>         folio_unlock(folio);
> -       ret =3D 0;
> -out:
> -       return ret;
> +       return 0;
> +
>  out_release:
>         folio_unlock(folio);
>         folio_put(folio);
> -       goto out;
> +       return ret;
>  }
>
>  /* Handles UFFDIO_POISON for all non-hugetlb VMAs. */
> --
> 2.51.0
>

Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA079400DED
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 23:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530603; cv=pass; b=TbXXP9mOgi2NFrruqJp3+p4ZGH3cAFIT/NXAW4W7HkL/UBYDYJA8aMIw0ImBPnl+tjpSqwL5AZI8G6BVgBWWW70O4OgzcBHBXvVXLu0XJLCagaiQn8vv2G6YYV68SWiD74XnAk8KwkqDEcpXCVtos0wwODML4E3bPyWjLg4HVgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530603; c=relaxed/simple;
	bh=B4G3Qhqjg2Ms/0nstUSSQu+IApTzMeVZ40pV9/LH4sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPc4ryEf4ohWVGLwgi6UuIacqhZnUOXS8yQbPw9xePCEGzUe1J7URG3rnDhu/CpIK4iWv0jP/R0l7JWHbhpACPG823Q0lWa6v6RiiZwdZPwB9HLWLt+6zZNivrdlIYRryJFJFj17mNGK3G1sPjBahIjor5Qp3x0Z/tVz5Ms9Na4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BDD9ckZB; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BDD9ckZB"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51765531803so273861cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 16:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530600; cv=none;
        d=google.com; s=arc-20240605;
        b=khizqOJXsKNFrCffaS5SCOr1hJEAJ8v9fpeNQ1Bt76q+bMadhk4msc3nMqurpN0RoM
         jpWi+MjqXFF8l3lhmVW2Z5HTuTlaMz8rmRSJSwl8DGOVIMeDdT+R2wIzp+b+L/BXQubP
         lKVYNeB0D2mSiYUH7TXXbzJyuLF5XuiKkcLIicAefHhtKm+Sb9XteYL9nsabmel3ghin
         D93+9e05db5CG/3XdXCEYRRSw+OMh+tG57Frevio8c1msg4OfcG5klkZJQG9vT3rBvPB
         XCRZvV2vNQlXc8i0pTM3/wgKxVNk36Y71ayzWd8hDBZVsTOeV4Y3Hjk+Imf0Ew87ffIU
         7o2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+STNoqDbTOil7FnpxSpmT3xZ1M95B5vs/FtTNlIr02U=;
        fh=4bXbPDcrlt+eOgHVR6iNBgUjqMJisnhSLsJ2rRfTOrQ=;
        b=N3o5jNfQhT3ulfrQPn1QuZeTW+rRd1A21um7Ed61YBZivwYWSWrAql8O4csv/pwYvK
         LffIsMFmyKtkAIm3/9Lu+8b5MwIDXVLOsqQJaakJOCHQgkJYj0SAeLD7vM0S4EadU1H6
         ztTWwaroElLsMmE2vIGeZRZsAp6IvCUtjHceuokNhGTERTNbgn1BpdY0BDFGx4PqXQSq
         17iwL/uCuuAEHj9B/+EucB3P4IOXHDDFR4Me5FIAJCelvOUh2H0txsMYcecBLZ0yaQys
         9jbLRCGyZdwqd35JiLu8iwWQekGAj3xcVXXBawEk6xU5AxRcoAK1qyvYY2gEBtFg7SuS
         n+vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780530600; x=1781135400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+STNoqDbTOil7FnpxSpmT3xZ1M95B5vs/FtTNlIr02U=;
        b=BDD9ckZB7xT1LaAZ5rbcH3gY07RHTJ+yEnzoQvLPKHS6gFUq4df3Xi/mRAufIINIYe
         BGY14/v0lNgUprLT+eHt9KwIBuhEqn9/C2ko2q2ltBJA7WQtF7Jf1XbWBIi0kfQs7Fo7
         t22HPRxfedizDT0MEgj9F02BQkc6cxOYZ8ArqBEm6Jica2LsAcyiZ+EAVdEljuJ5UKCm
         alAueZoeSfMRDWwPjwophWCsoX7jh2smgoXyhF+xmxIWI0v2Ap5f7Oc+wvuvgaqLJ79F
         gGx6Bz/wbNxgwxgRa5ga63gBWa9IrHPCimr68ITVj+0XP5/OA3tAteXDtGOX92aGPTNq
         Q/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530600; x=1781135400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+STNoqDbTOil7FnpxSpmT3xZ1M95B5vs/FtTNlIr02U=;
        b=LrIrjNhgu5TnyQVl3JvwTklIKdsmoLDWy9SXSJUTux7A8m6Sqb3G4OfrRoJBiN95AZ
         tKrdv9yCISmIWoo2wrU9qa2/38KvTdyqERtciBiQEYHkz9pmKL7mT+5tDjBu+jfzphee
         wV0qF36aooDYdwInjUDKP3suuAq5XcwUTMSmlyENFLBT3h8JleW6GyPLV+y80qI1vhxD
         Haeb1ishRUtsDTYjyTwkP/Uo9eqMYSfIIGqcfCwzu060UuFCQ1XEl/3zXqwXIJLXRmMX
         BdEtmqd7ZAbid0wVuqCo2Q2sf+f4bupvV9NiVV8NpGulMN47BXZuoRNcxBvL/BsPkCpS
         2kkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bShjQy9f7gOGzTytKujFKWEs09Uh/T/p+CBH9xMBoJQr7vcLe3oI7uvQlSLrtgYbSPhpYyc/SHrTZ3SkI42k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWoDK5mmrQYFiWNaHGaO+3ykovfOlgwq7KeEZzP1ft61fA+m4N
	gpFmUo9tmu+ZKkCNUs9ADqOPFRnBcrfDl+aV3IhZE0rvbVbe1TYQQwuL1zijrR3TXF7pQeGGADj
	/Bi0OH0YAkUm/kIHXA8m8vi3fzYF9e32Oi9s7xPvT
X-Gm-Gg: Acq92OG0aBQjFkH4i7DLvcJwirsWG3xOn+uabtgP5Vy/GoAx5QxB2a6yrkuT8oltSWF
	JWSBOl0RSQDJ9W57YmFAcQ9dvHQpLwc9Fij0sT6fPD1MhHirnymKTKX66DKNthCZMvqI8fkZ++Q
	jB5tCMAd408+yAUj6PBH3G9uubNeBNFWeqsr5/hCUjLeNJr+MhvTpqdFM/dzG+FJrTriOuiLFF1
	MlaV9KTLZQqy8ThXGbQo1ppefR50oFe1y+/bZrQkIF9tmTKlo7LekNArLa5yYhl5Qbs81Bs3LZq
	K1oOfDRb073f21ZM
X-Received: by 2002:ac8:1492:0:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-5178924ac87mr1917311cf.5.1780530599046; Wed, 03 Jun 2026
 16:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426062718.1238437-1-surenb@google.com> <20260426062718.1238437-2-surenb@google.com>
 <ahhMEBYM9bixF2Lg@lucifer>
In-Reply-To: <ahhMEBYM9bixF2Lg@lucifer>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jun 2026 16:49:48 -0700
X-Gm-Features: AVHnY4LVowgcCqyS2rWzIKKmBhNJYxjGPWjhqH2BDatgz-xDpLvblbN-53wH_z4
Message-ID: <CAJuCfpFJvuFZkgKwJ11RjDXYhTz-a31HO9-5C+Yc=KxbsGvB-w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] fs/proc/task_mmu: read proc/pid/{smaps|numa_maps}
 under per-vma lock
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	david@redhat.com, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, shuah@kernel.org, hsukrut3@gmail.com, 
	richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 8:17=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
>
> On Sat, Apr 25, 2026 at 11:27:16PM -0700, Suren Baghdasaryan wrote:
> > proc/pid/{smaps|numa_maps} can be read using the combination of RCU and
> > VMA read locks, similar to proc/pid/maps. RCU is required to safely
> > traverse the VMA tree and VMA lock stabilizes the VMA being processed
> > and the pagetable walk.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Liam R. Howlett <liam@infradead.org>
>
> The logic LGTM, some nitty things below but in general:
>
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

Thanks!

>
> > ---
> >  fs/proc/task_mmu.c | 195 ++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 156 insertions(+), 39 deletions(-)
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 751b9ba160fb..1e3a15bf46f4 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -132,6 +132,22 @@ static void release_task_mempolicy(struct proc_map=
s_private *priv)
> >
> >  #ifdef CONFIG_PER_VMA_LOCK
> >
> > +static inline int lock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
>
> NIT: But these inlines are unnecessary in a C file. At the kernel optimis=
ation
> level the compiler already decides whether to inline or not.
>
> However in the kernel we redefine this so we lose function tracing and al=
so we
> don't get warnings about unused functions [0], so this is actually a bit =
harmful
> - you can end up with dead code and not know abou tit.
>
> Same goes for all the other static inline's in task_mmu.c.

I see. There are a bunch of these small inline functions. Once the
dust settles, I can clean them up. Dave's series and my folloup patch
to change smaps_rollup will be changing this code. Maybe after all
that is done?

>
> [0]: https://elixir.bootlin.com/linux/v7.0.10/source/include/linux/compil=
er_types.h#L235
>
> > +{
> > +     int ret =3D mmap_read_lock_killable(lock_ctx->mm);
> > +
> > +     if (!ret)
> > +             lock_ctx->mmap_locked =3D true;
> > +
> > +     return ret;
> > +}
> > +
> > +static inline void unlock_ctx_mm(struct proc_maps_locking_ctx *lock_ct=
x)
> > +{
> > +     mmap_read_unlock(lock_ctx->mm);
> > +     lock_ctx->mmap_locked =3D false;
> > +}
> > +
> >  static void reset_lock_ctx(struct proc_maps_locking_ctx *lock_ctx)
> >  {
> >       lock_ctx->locked_vma =3D NULL;
> > @@ -146,25 +162,11 @@ static void unlock_ctx_vma(struct proc_maps_locki=
ng_ctx *lock_ctx)
> >       }
> >  }
> >
> > -static const struct seq_operations proc_pid_maps_op;
> > -
> >  static inline bool lock_vma_range(struct seq_file *m,
> >                                 struct proc_maps_locking_ctx *lock_ctx)
> >  {
> > -     /*
> > -      * smaps and numa_maps perform page table walk, therefore require
> > -      * mmap_lock but maps can be read with locking just the vma and
> > -      * walking the vma tree under rcu read protection.
> > -      */
> > -     if (m->op !=3D &proc_pid_maps_op) {
> > -             if (mmap_read_lock_killable(lock_ctx->mm))
> > -                     return false;
> > -
> > -             lock_ctx->mmap_locked =3D true;
> > -     } else {
> > -             rcu_read_lock();
> > -             reset_lock_ctx(lock_ctx);
> > -     }
> > +     rcu_read_lock();
> > +     reset_lock_ctx(lock_ctx);
> >
> >       return true;
> >  }
> > @@ -172,7 +174,7 @@ static inline bool lock_vma_range(struct seq_file *=
m,
> >  static inline void unlock_vma_range(struct proc_maps_locking_ctx *lock=
_ctx)
> >  {
> >       if (lock_ctx->mmap_locked) {
> > -             mmap_read_unlock(lock_ctx->mm);
> > +             unlock_ctx_mm(lock_ctx);
> >       } else {
> >               unlock_ctx_vma(lock_ctx);
> >               rcu_read_unlock();
> > @@ -213,17 +215,45 @@ static inline bool fallback_to_mmap_lock(struct p=
roc_maps_private *priv,
> >       return true;
> >  }
> >
> > +static inline void drop_rcu(struct proc_maps_private *priv)
> > +{
> > +     if (priv->lock_ctx.mmap_locked)
> > +             return;
> > +
> > +     rcu_read_unlock();
> > +}
> > +
> > +static inline void reacquire_rcu(struct proc_maps_private *priv)
> > +{
> > +     if (priv->lock_ctx.mmap_locked)
> > +             return;
> > +
> > +     rcu_read_lock();
> > +     /* Reinitialize the iterator. */
> > +     vma_iter_set(&priv->iter, priv->lock_ctx.locked_vma->vm_end);
>
> OK good that we reset this :)
>
> > +}
> > +
> >  #else /* CONFIG_PER_VMA_LOCK */
> >
>
> We need to pull out the patches from Dave's series and remove this option=
 and
> default VMA locks on by default :)

I didn't see any followup after Dave posted his v1. I agree it would
make things much simpler but I don't want to delay these changes too
much.
I'll ask Dave if he plans to continue his cleanup. If not, I'll pick it up.


>
> > +static inline int lock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
> > +{
> > +     return mmap_read_lock_killable(lock_ctx->mm);
> > +}
> > +
> > +static inline void unlock_ctx_mm(struct proc_maps_locking_ctx *lock_ct=
x)
> > +{
> > +     mmap_read_unlock(lock_ctx->mm);
> > +}
> > +
> >  static inline bool lock_vma_range(struct seq_file *m,
> >                                 struct proc_maps_locking_ctx *lock_ctx)
> >  {
> > -     return mmap_read_lock_killable(lock_ctx->mm) =3D=3D 0;
> > +     return lock_ctx_mm(lock_ctx) =3D=3D 0;
> >  }
> >
> >  static inline void unlock_vma_range(struct proc_maps_locking_ctx *lock=
_ctx)
> >  {
> > -     mmap_read_unlock(lock_ctx->mm);
> > +     unlock_ctx_mm(lock_ctx);
> >  }
> >
> >  static struct vm_area_struct *get_next_vma(struct proc_maps_private *p=
riv,
> > @@ -238,6 +268,9 @@ static inline bool fallback_to_mmap_lock(struct pro=
c_maps_private *priv,
> >       return false;
> >  }
> >
> > +static inline void drop_rcu(struct proc_maps_private *priv) {}
> > +static inline void reacquire_rcu(struct proc_maps_private *priv) {}
> > +
> >  #endif /* CONFIG_PER_VMA_LOCK */
> >
> >  static struct vm_area_struct *proc_get_vma(struct seq_file *m, loff_t =
*ppos)
> > @@ -538,12 +571,10 @@ static int query_vma_setup(struct proc_maps_locki=
ng_ctx *lock_ctx)
> >
> >  static void query_vma_teardown(struct proc_maps_locking_ctx *lock_ctx)
> >  {
> > -     if (lock_ctx->mmap_locked) {
> > -             mmap_read_unlock(lock_ctx->mm);
> > -             lock_ctx->mmap_locked =3D false;
> > -     } else {
> > +     if (lock_ctx->mmap_locked)
> > +             unlock_ctx_mm(lock_ctx);
> > +     else
> >               unlock_ctx_vma(lock_ctx);
> > -     }
> >  }
> >
> >  static struct vm_area_struct *query_vma_find_by_addr(struct proc_maps_=
locking_ctx *lock_ctx,
> > @@ -1280,21 +1311,75 @@ static const struct mm_walk_ops smaps_shmem_wal=
k_ops =3D {
> >       .walk_lock              =3D PGWALK_RDLOCK,
> >  };
> >
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +
> > +static const struct mm_walk_ops smaps_walk_vma_lock_ops =3D {
> > +     .pmd_entry              =3D smaps_pte_range,
> > +     .hugetlb_entry          =3D smaps_hugetlb_range,
> > +     .walk_lock              =3D PGWALK_VMA_RDLOCK_VERIFY,
> > +};
> > +
> > +static const struct mm_walk_ops smaps_shmem_walk_vma_lock_ops =3D {
> > +     .pmd_entry              =3D smaps_pte_range,
> > +     .hugetlb_entry          =3D smaps_hugetlb_range,
> > +     .pte_hole               =3D smaps_pte_hole,
> > +     .walk_lock              =3D PGWALK_VMA_RDLOCK_VERIFY,
> > +};
> > +
> > +static inline const struct mm_walk_ops *
> > +get_smaps_walk_ops(struct proc_maps_private *priv)
> > +{
> > +     if (priv->lock_ctx.mmap_locked)
> > +             return &smaps_walk_ops;
> > +     return &smaps_walk_vma_lock_ops;
> > +}
> > +
> > +static inline const struct mm_walk_ops *
> > +get_smaps_shmem_walk_ops(struct proc_maps_private *priv)
> > +{
> > +     if (priv->lock_ctx.mmap_locked)
> > +             return  &smaps_shmem_walk_ops;
> > +     return &smaps_shmem_walk_vma_lock_ops;
> > +}
> > +
> > +#else /* CONFIG_PER_VMA_LOCK */
> > +
> > +static inline const struct mm_walk_ops *
> > +get_smaps_walk_ops(struct proc_maps_private *priv)
> > +{
> > +     return &smaps_walk_ops;
> > +}
> > +
> > +static inline const struct mm_walk_ops *
> > +get_smaps_shmem_walk_ops(struct proc_maps_private *priv)
> > +{
> > +     return &smaps_shmem_walk_ops;
> > +}
> > +
> > +#endif /* CONFIG_PER_VMA_LOCK */
> > +
> >  /*
> >   * Gather mem stats from @vma with the indicated beginning
> >   * address @start, and keep them in @mss.
> >   *
> >   * Use vm_start of @vma as the beginning address if @start is 0.
> >   */
> > -static void smap_gather_stats(struct vm_area_struct *vma,
> > -             struct mem_size_stats *mss, unsigned long start)
> > +static void smap_gather_stats(struct proc_maps_private *priv,
> > +                           struct vm_area_struct *vma,
> > +                           struct mem_size_stats *mss, unsigned long s=
tart)
> >  {
> > -     const struct mm_walk_ops *ops =3D &smaps_walk_ops;
> > +     const struct mm_walk_ops *ops =3D get_smaps_walk_ops(priv);
> >
> >       /* Invalid start */
> >       if (start >=3D vma->vm_end)
> >               return;
> >
> > +     if (vma =3D=3D get_gate_vma(priv->lock_ctx.mm))
> > +             return;
> > +
> > +     /* Might sleep. Drop RCU read lock but keep the VMA locked. */
> > +     drop_rcu(priv);
> > +
> >       if (vma->vm_file && shmem_mapping(vma->vm_file->f_mapping)) {
> >               /*
> >                * For shared or readonly shmem mappings we know that all
> > @@ -1312,15 +1397,16 @@ static void smap_gather_stats(struct vm_area_st=
ruct *vma,
> >                                       !(vma->vm_flags & VM_WRITE))) {
> >                       mss->swap +=3D shmem_swapped;
> >               } else {
> > -                     ops =3D &smaps_shmem_walk_ops;
> > +                     ops =3D get_smaps_shmem_walk_ops(priv);
> >               }
> >       }
> >
> > -     /* mmap_lock is held in m_start */
> >       if (!start)
> >               walk_page_vma(vma, ops, mss);
> >       else
> >               walk_page_range(vma->vm_mm, start, vma->vm_end, ops, mss)=
;
> > +
> > +     reacquire_rcu(priv);
>
> OK I was going to say that this RCU lock dance is a bit iffy, but I see
> that we're sharing code such that this is necessary.
>
> >  }
> >
> >  #define SEQ_PUT_DEC(str, val) \
> > @@ -1369,10 +1455,11 @@ static void __show_smap(struct seq_file *m, con=
st struct mem_size_stats *mss,
> >
> >  static int show_smap(struct seq_file *m, void *v)
> >  {
> > +     struct proc_maps_private *priv =3D m->private;
> >       struct vm_area_struct *vma =3D v;
> >       struct mem_size_stats mss =3D {};
> >
> > -     smap_gather_stats(vma, &mss, 0);
> > +     smap_gather_stats(priv, vma, &mss, 0);
> >
> >       show_map_vma(m, vma);
> >
> > @@ -1413,7 +1500,7 @@ static int show_smaps_rollup(struct seq_file *m, =
void *v)
> >               goto out_put_task;
> >       }
> >
> > -     ret =3D mmap_read_lock_killable(mm);
> > +     ret =3D lock_ctx_mm(&priv->lock_ctx);
> >       if (ret)
> >               goto out_put_mm;
> >
> > @@ -1425,7 +1512,7 @@ static int show_smaps_rollup(struct seq_file *m, =
void *v)
> >
> >       vma_start =3D vma->vm_start;
> >       do {
> > -             smap_gather_stats(vma, &mss, 0);
> > +             smap_gather_stats(priv, vma, &mss, 0);
> >               last_vma_end =3D vma->vm_end;
> >
> >               /*
> > @@ -1434,8 +1521,8 @@ static int show_smaps_rollup(struct seq_file *m, =
void *v)
> >                */
> >               if (mmap_lock_is_contended(mm)) {
> >                       vma_iter_invalidate(&vmi);
> > -                     mmap_read_unlock(mm);
> > -                     ret =3D mmap_read_lock_killable(mm);
> > +                     unlock_ctx_mm(&priv->lock_ctx);
> > +                     ret =3D lock_ctx_mm(&priv->lock_ctx);
> >                       if (ret) {
> >                               release_task_mempolicy(priv);
> >                               goto out_put_mm;
> > @@ -1484,14 +1571,14 @@ static int show_smaps_rollup(struct seq_file *m=
, void *v)
> >
> >                       /* Case 1 and 2 above */
> >                       if (vma->vm_start >=3D last_vma_end) {
> > -                             smap_gather_stats(vma, &mss, 0);
> > +                             smap_gather_stats(priv, vma, &mss, 0);
> >                               last_vma_end =3D vma->vm_end;
> >                               continue;
> >                       }
> >
> >                       /* Case 4 above */
> >                       if (vma->vm_end > last_vma_end) {
> > -                             smap_gather_stats(vma, &mss, last_vma_end=
);
> > +                             smap_gather_stats(priv, vma, &mss, last_v=
ma_end);
> >                               last_vma_end =3D vma->vm_end;
> >                       }
> >               }
> > @@ -1505,7 +1592,7 @@ static int show_smaps_rollup(struct seq_file *m, =
void *v)
> >       __show_smap(m, &mss, true);
> >
> >       release_task_mempolicy(priv);
> > -     mmap_read_unlock(mm);
> > +     unlock_ctx_mm(&priv->lock_ctx);
> >
> >  out_put_mm:
> >       mmput(mm);
> > @@ -3291,6 +3378,31 @@ static const struct mm_walk_ops show_numa_ops =
=3D {
> >       .walk_lock =3D PGWALK_RDLOCK,
> >  };
> >
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +static const struct mm_walk_ops show_numa_vma_lock_ops =3D {
> > +     .hugetlb_entry =3D gather_hugetlb_stats,
> > +     .pmd_entry =3D gather_pte_stats,
> > +     .walk_lock =3D PGWALK_VMA_RDLOCK_VERIFY,
> > +};
> > +
> > +static inline const struct mm_walk_ops *
> > +get_show_numa_ops(struct proc_maps_private *priv)
> > +{
> > +     if (priv->lock_ctx.mmap_locked)
> > +             return &show_numa_ops;
> > +     return &show_numa_vma_lock_ops;
> > +}
> > +
> > +#else /* CONFIG_PER_VMA_LOCK */
> > +
> > +static inline const struct mm_walk_ops *
> > +get_show_numa_ops(struct proc_maps_private *priv)
> > +{
> > +     return &show_numa_ops;
> > +}
> > +
> > +#endif /* CONFIG_PER_VMA_LOCK */
> > +
> >  /*
> >   * Display pages allocated per node and memory policy via /proc.
> >   */
> > @@ -3335,8 +3447,13 @@ static int show_numa_map(struct seq_file *m, voi=
d *v)
> >       if (is_vm_hugetlb_page(vma))
> >               seq_puts(m, " huge");
> >
> > -     /* mmap_lock is held by m_start */
> > -     walk_page_vma(vma, &show_numa_ops, md);
> > +     /* Skip walking pages if gate VMA */
> > +     if (vma !=3D get_gate_vma(proc_priv->lock_ctx.mm)) {
> > +             /* Might sleep. Drop RCU read lock but keep the VMA locke=
d. */
> > +             drop_rcu(proc_priv);
> > +             walk_page_vma(vma, get_show_numa_ops(proc_priv), md);
> > +             reacquire_rcu(proc_priv);
> > +     }
> >
> >       if (!md->pages)
> >               goto out;
> > --
> > 2.54.0.545.g6539524ca2-goog
> >

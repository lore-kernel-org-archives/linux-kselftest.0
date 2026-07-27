Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A4337B00E
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 21:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187607; cv=pass; b=YGT7DJPXEEsTFttiteeT3duC4L9BMe4TNFGYg+hlMSOH/be415sJNtR70gYKoFQ1gFrDENDDYfTeEQ+WewJVsFfiL4iUBEWPgUU6QeAKoPUqM4P+HSke3897L1a93/BycVy3UEACgWcI+c3DRIfRQJvkoKzAEb4B7w39V8rYo2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187607; c=relaxed/simple;
	bh=JW5kB5qB30chtuMEzFwn4BgecT+7iXIRLKy94iBqk6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyt7liipZMs/48xLJjMpyWxu3hBeHvZ/jnawbC1EfcGcmeASJUANvkEfD5KQFFVJrAkIMsq0xQtlkOLp6wtmh0CF43DFA4PzbZJy0KOAktliv87HdJAODvl5kF3O820Bus9Rlu7Qd2u0UNBJzPQ93tZVyI6rEAGfRxHw6BrS9hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itMHIBsn; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itMHIBsn"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c197e7e4e94so546974166b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 14:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785187604; cv=none;
        d=google.com; s=arc-20260327;
        b=e1OxOnAG++DLihpOBZk8ntOyZdswU2Ewz2SEspqaR5yLhwLD6XLqK5Z8/YetAtSbE9
         2e3XLP4u4F9gZfs+rifjLjVOBMKyBMEsMiunZkxnFhE4pQNpjLL4yo5mJeux+mbxKCB8
         CVoIsAJ+/giUOgvhT52SIG5qTLeT4u9tqJEX5uoZFurt6oc2KDDopG22b4/ocAmT0juf
         W6uR/KhZnY1Xhc4udfKjtgxwJ18Hm2Sa06c/+S0yZquVg5M0hxlvm+/J4+StjXS2bRxU
         Y9/IVQXu7fXCCYEeYLEiMr/YACVfDM82zwU71EBg8bEmmu6iOo0yXImh1Z5ofCXu0lJc
         tYrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N9bsPZ3HZQvmOrzVVgTiiLwY68paYMuFlINsGlL75lg=;
        fh=l5j05Ysu0FYOxHRRl2XpY+c5g6hJn9z3W3VgCqTlZCY=;
        b=gkDzTGHwcVQlVbTax6MnE5GdEqhWQSrIlARDfuGl2e7uzXtr22T3mHqPdo9EpuCbCB
         eqJJrzbtCJ3054cBRTH0c3ZLrB54oUo5GGSZmnZXkbgtlB7RVvRPTUD9NSrc7bB56/E8
         TL9mkUT9ruMYhA2I8iClmbuTcgWc6BcJfKu93x8+uuSXzYCxO0RKKpPzxEvF6WocA8HE
         gy4PdRJEH0aZu01cP7E/OEDUpDqSqG39U2Id3ko2bwCQqE+V3cFTIcvVAeDnpxXAHRPo
         Ib7boH/niW/jse5MQlFc3X4o3PflLaHyImsWFmUUheFKWU6gsOr3YOPlWfhgVxy4+ivb
         W8qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785187604; x=1785792404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N9bsPZ3HZQvmOrzVVgTiiLwY68paYMuFlINsGlL75lg=;
        b=itMHIBsnPMwO/HpiV1sEX7rDv8tpVV2zz4vAYB7iFuRkA5sBbCy9UbOwzVq6FTSPHX
         Be7fe+Opki1puZWEFR8va7ejzCH4ft5B6UlWc/cRDXQuj/SqZ/Me44tbtEO/zPuPDSDn
         j8X30/b6HeUuqxBCXWN+Cy2dp0tmosR1/Wo7qp/habAnPdrGr0Gl0dLYvvUm5snQ17aC
         JrSTXyURQS8rStoX+COUnzBPw0mocF2sK8ItfP+17lVMSYyPxa2qyV/m0OYuH6V0JcFC
         LEImOct+puO02IEY6xGt7pWwpOwZZAENWm0AEOXJMlVRiGlEfN3GejCE2jz/uYtOZ4K4
         oMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785187604; x=1785792404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9bsPZ3HZQvmOrzVVgTiiLwY68paYMuFlINsGlL75lg=;
        b=nVllNELcsUekzpUwWTCfzddG/Q0h3qzhDfLq015eMdSie2is7LTpmyS5/FGfg0Xh56
         VlRv2XVaQqb00nP+EbawKLlxTc1TCClCtriBuKKT6N+ZoPheKp2u7s1GagwUYHzkdNS9
         cFaQ0cCAQBjTaRV2/TKVYahmJfEuK8Ta9DNxKm9iEivuR7A1nzJ0g545ls/4xpq+GL4P
         GCY3Bn2/6JYKqGfEv+QnqKrTjYqunOYvf9hYWZF19jYaFacXH+sdE0wI0zTqBLnSlgdk
         L2p0FrPFVjmBDlXIRmom+d7D3t5ST3V1RxhcSK7X9p2pxRMtrembvuG2HUJmaOYR6/lQ
         xWTg==
X-Forwarded-Encrypted: i=1; AHgh+RrLmjT2+CdQd/G3KvQNWaehzyAYuLXuviaNb8nRGg6rarkyT713KaSOIkwt3dKXPl9+onCeQFVOtnJGWWP23/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTxrTdGOtG8+eIklE2nk9n4ouGTzV3OI0jTWqjK0VJUmlaFBrs
	9dOaM8ZUH0cGYGffKF6Gh95twIqzgoL1gmgRPZcma8Uc3IqsAPFRIwSY+xb9xptJXftK9ZOQgbT
	Tgmc5T3eh6HQTNksBztXdPPL7z2n/vpk=
X-Gm-Gg: AR+sD11VQd4Ov/5CwvCa8qds54zzYg+FETlhLx4st1/QiS4307E+pJ5TqFZ7l5eKJ5a
	cMotY6Ppq4GZit3KoyoQCl211Usk/NYBoD2dFYBEXvbvnPzAFIsScKrBExe7EnbPr3DrBeAhE6M
	UHuX3+qlz3BpDHsQep98PVRUb49UlTuMp2h9iY0weinBZlNNC4t7/cAz5lVbZdFluwo3Rtswmpv
	3YDAl7of+QJ1JoDf8srjNHtB9K2RF2G5EqwlX31iBCKGuuTMi3ugRUe
X-Received: by 2002:a17:906:7948:b0:c1c:26fd:4f31 with SMTP id
 a640c23a62f3a-c1f1eeacc9emr434831066b.26.1785187603944; Mon, 27 Jul 2026
 14:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-b4-scalable-cow-virt-pgoff-v2-0-2d549757a76f@kernel.org> <20260720-b4-scalable-cow-virt-pgoff-v2-13-2d549757a76f@kernel.org>
In-Reply-To: <20260720-b4-scalable-cow-virt-pgoff-v2-13-2d549757a76f@kernel.org>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 27 Jul 2026 14:26:32 -0700
X-Gm-Features: AUfX_mwcnd_-Gd85nb0fGnZa3ykBWA_00Dmo7Y127h_GI4bez2zlh-yWo1OAW4w
Message-ID: <CAHbLzkrCjALeXSuO7dgho9=W-VZQxD-CXNS8iOva=oCCi1XV1A@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] mm/vma: make MAP_PRIVATE-mapped /dev/zero
 mappings truly anonymous
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Kees Cook <kees@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Usama Arif <usama.arif@linux.dev>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 8:30=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> When mapping /dev/zero with MAP_PRIVATE, one ends up with strange VMAs
> originating from Linux's distant past.
>
> These have vma->vm_file set but NULL vma->vm_ops, meaning they satisfy
> vma_is_anonymous() but otherwise resemble a file-backed VMA.
>
> The introduction of virtual page offsets and their subsequent use as
> indexes for MAP_PRIVATE-file-backed mappings mean the rmap does the right
> thing with these but we are left with inconsistencies.
>
> The vma_start_pgoff(vma) =3D=3D vma_start_virt_pgoff(vma) invariant is tr=
ue for
> all other anonymous VMAs, but not these.
>
> These VMAs are also observable as files in /proc/<pid>/[s]maps but
> otherwise behave like anonymous mappings.
>
> Therefore let's make these VMAs actually anonymous at mapping time which
> will activate the anonymous code path for mappings.
>
> This means we no longer have to account for this discrepancy anywhere and
> no longer have to think about these at all.

I'm glad to see this is solved finally. But /proc/<pid>/smaps will not
show /dev/zero anymore. It is user visible. I recalled you were
concerned about it before.
https://lore.kernel.org/linux-mm/c98f68c1-4bfd-4410-9b65-1eb5a1efe271@lucif=
er.local/

Anyway I don't think it is a big deal. It should be harmless. I would
be surprised any real life workload would care whether the anonymous
mapping is backed by /dev/zero or not in 2026.

Thanks,
Yang

>
> A previous commit gave us map_is_dev_zero() to positively identify these
> mappings, so we expressly only do so for these alone.
>
> The impact of this change should be low as likely very few are relying up=
on
> this in any case, and in using them are asking for anonymous memory, so n=
o
> longer seeing these as file mappings in smaps should have no meaningful
> impact.
>
> Update assert_sane_pgoff(), the comment for vma_start_pgoff() and
> linear_virt_page_index() to reflect the change.
>
> We make this change in call_mmap_prepare() alone as /dev/zero has been
> converted to an mmap_prepare hook and we do not permit nested MAP_PRIVATE
> mapping of /dev/zero.
>
> We also remove the now defunct vma_desc_set_anonymous() and eliminate the
> temporary bisection hazard fix from the previous commit.
>
> Also update the VMA userland tests to reflect the change.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  include/linux/mm.h              | 10 ++--------
>  include/linux/pagemap.h         |  3 +--
>  mm/vma.c                        | 26 +++++++++++++++++---------
>  mm/vma.h                        |  3 ---
>  tools/testing/vma/include/dup.h |  3 +--
>  5 files changed, 21 insertions(+), 24 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 7614afe99c96..7fabe6c66b4b 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1554,11 +1554,6 @@ static inline void vma_set_anonymous(struct vm_are=
a_struct *vma)
>         vma->vm_ops =3D NULL;
>  }
>
> -static inline void vma_desc_set_anonymous(struct vm_area_desc *desc)
> -{
> -       desc->vm_ops =3D NULL;
> -}
> -
>  static inline bool vma_is_anonymous(const struct vm_area_struct *vma)
>  {
>         return !vma->vm_ops;
> @@ -4352,9 +4347,8 @@ static inline unsigned long vma_pages(const struct =
vm_area_struct *vma)
>   * If @vma is a MAP_PRIVATE file-backed mapping, then this returns the
>   * page offset within the file.
>   *
> - * Edge cases: nommu does not abide by these, MAP_PRIVATE-/dev/zero sati=
sfies
> - * vma_is_anonymous() but has file-backed page offset, and MAP_PRIVATE-p=
fnmap
> - * regions have their page offset set to the first PFN in the range.
> + * Edge cases: nommu does not abide by these and CoW MAP_PRIVATE-pfnmap =
regions
> + * have their page offset set to the first PFN in the range.
>   *
>   * Returns: The page offset of the start of @vma.
>   */
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 3307c0551a0a..4e8b2b29f6d3 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -1136,8 +1136,7 @@ static inline pgoff_t linear_virt_page_index(const =
struct vm_area_struct *vma,
>         const pgoff_t pgoff =3D __linear_virt_page_index(vma, address);
>
>         VM_WARN_ON_ONCE(vma_test(vma, VMA_SHARED_BIT));
> -       /* Account for MAP_PRIVATE-/dev/zero which is only semi-anonymous=
. */
> -       if (vma_is_anonymous(vma) && !vma->vm_file)
> +       if (vma_is_anonymous(vma))
>                 VM_WARN_ON_ONCE(pgoff !=3D linear_page_index(vma, address=
));
>
>         return pgoff;
> diff --git a/mm/vma.c b/mm/vma.c
> index 103a6a134dec..d3e0457a11a1 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -2622,6 +2622,13 @@ static bool map_is_dev_zero(const struct mmap_stat=
e *map)
>         return imajor(inode) =3D=3D MEM_MAJOR && iminor(inode) =3D=3D DEV=
ZERO_MINOR;
>  }
>
> +static void map_set_anon(struct mmap_state *map)
> +{
> +       map->file =3D NULL;
> +       map->vm_ops =3D NULL;
> +       map->pgoff =3D map->addr >> PAGE_SHIFT;
> +}
> +
>  static bool map_is_private(const struct mmap_state *map)
>  {
>         return !vma_flags_test(&map->vma_flags, VMA_SHARED_BIT);
> @@ -2629,10 +2636,7 @@ static bool map_is_private(const struct mmap_state=
 *map)
>
>  static bool map_is_anon(const struct mmap_state *map)
>  {
> -       if (!map_is_private(map))
> -               return false;
> -
> -       return !map->file || map_is_dev_zero(map);
> +       return map_is_private(map) && !map->file;
>  }
>
>  /*
> @@ -2664,7 +2668,7 @@ static int __mmap_new_vma(struct mmap_state *map, s=
truct vm_area_struct **vmap,
>
>         vma_iter_config(vmi, map->addr, map->end);
>
> -       if (is_anon && !map->file)
> +       if (is_anon)
>                 vma_set_anonymous(vma);
>
>         vma_set_range(vma, map->addr, map->end, map->pgoff, map->virt_pgo=
ff);
> @@ -2682,10 +2686,6 @@ static int __mmap_new_vma(struct mmap_state *map, =
struct vm_area_struct **vmap,
>         else if (!is_anon)
>                 error =3D shmem_zero_setup(vma);
>
> -       /* Temporary MAP_PRIVATE-/dev/zero workaround. */
> -       if (is_anon && map->file)
> -               vma_set_anonymous(vma);
> -
>         if (error)
>                 goto free_iter_vma;
>
> @@ -2814,6 +2814,14 @@ static int call_mmap_prepare(struct mmap_state *ma=
p,
>         map->vm_ops =3D desc->vm_ops;
>         map->vm_private_data =3D desc->private_data;
>
> +       /*
> +        * MAP_PRIVATE-/dev/zero mappings are an ancient way of getting
> +        * anonymous mappings. Rather than allowing these mappings to be =
odd
> +        * outliers, simply make them truly anonymous.
> +        */
> +       if (map_is_private(map) && map_is_dev_zero(map))
> +               map_set_anon(map);
> +
>         return 0;
>  }
>
> diff --git a/mm/vma.h b/mm/vma.h
> index 94277837ce6e..44fbb50dc3fe 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -267,9 +267,6 @@ static inline void assert_sane_pgoff(struct vm_area_s=
truct *vma, pgoff_t pgoff)
>          */
>         if (!vma_is_anonymous(vma))
>                 return;
> -       /* MAP_PRIVATE-/dev/zero is anon, non-NULL vm_file, but has file =
pgoff. */
> -       if (vma->vm_file)
> -               return;
>         /* If faulted in, could have been remapped. */
>         if (vma->anon_vma)
>                 return;
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/=
dup.h
> index c617ee2532bd..c5191b9718fd 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -1648,8 +1648,7 @@ static inline pgoff_t linear_virt_page_index(const =
struct vm_area_struct *vma,
>         const pgoff_t pgoff =3D __linear_virt_page_index(vma, address);
>
>         VM_WARN_ON_ONCE(vma_test(vma, VMA_SHARED_BIT));
> -       /* Account for MAP_PRIVATE-/dev/zero which is only semi-anonymous=
. */
> -       if (vma_is_anonymous(vma) && !vma->vm_file)
> +       if (vma_is_anonymous(vma))
>                 VM_WARN_ON_ONCE(pgoff !=3D linear_page_index(vma, address=
));
>
>         return pgoff;
>
> --
> 2.55.0
>
>

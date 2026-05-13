Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABBD3ACA45
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699068; cv=pass; b=LI13MIeBewaqx5o2GAThw8qYqBU0Ex8yFkKOpyltGE1wYXUwty3CzfqG89PBK+QUD1iujLuFQIj4fgrMsq6vZs0TtkTaKmg4JSJCayyW/qyzd2yDmotWlDixfHywoVRLQ5tgiQcnr6DxJM0mON5sdgvJMiXwXBLhl6qVBnp9Icw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699068; c=relaxed/simple;
	bh=BDGXWsEhgyjSIJMWbJkv5zZr6cmbxD8QsvMf8ntDbaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eajPjgC8wBLMAdyrtoiv13VPfn1yENUgDxsiQx2qtcCmWYL/fkeyPDRBCAnypp5RyPAojqxru4bSNOf3RY1YGVLz4+8VvZl7l+qtWcs+ZLr1htQku0VVjCiOxPgQTr6H7uzrQpLy2iy7tQWJg2mbwuQVwHUtevKkjr+db3/NqE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWLdjLcG; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWLdjLcG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d7e23defbso4303690f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 12:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778699066; cv=none;
        d=google.com; s=arc-20240605;
        b=jZ1R0BtmHaK3k6sj+puhxK+/Td6LdZLusQuafHZPNqPPbdoNPWWr9et4dQ0K+pdrG/
         1TgA/ryMZSOmwS44Oi0vx01e9SVs7bISy+36eEXRNPihfrTNfQJUnzn4MNqyBnhSgClF
         Dsm3mDb5pqcoL9SWpzFd8tbCbnns9SzLBWF1Qsu0BkrC+VP8jANsfLdHgLQr08LsRyc6
         FyYvFfnUHxQpM97D7C7S4ygK7V4eTH1TlIyYUn/CSsjKDgdsTqOA9VeLMXKTSNU2zU0z
         TSW0JSTJjfdmeKD8Udt6SGaGRwyB4JvNFFW2IbC28sIfdMftMVQ2qCFITNnLPMMwUGxr
         R8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YNq/o4IU8ikyfmt7nA2sK4MgLgtGuKDEcxYMsskEhxc=;
        fh=0Tv46676AY2BU8QogeBk44Ai15ZSXSv6y/mXBAx0Y4I=;
        b=JSeDun1f5r0p8Pdl5+23HZhQ1oc4BsfgTANZup4HneokpAXl1L7kNOMQSB12yBZEtr
         WeCbbXQTekpTE/yN2Tavh9KCQBkQQcxaZKq/+UGo7dlPCFMKHYgtA1yU1suzOm+mSy3c
         oTy3OWESbk63ksv/CyfA8EtKMZtE+EpQbBPWsCWU6flweyEcNIVsSRUzbxa5tTttqntz
         nOrsDcJcMYd+Xdozt/afheXmkuhFiJkrTmC59DrXoizo8BWLzDNTNHQbC1BluHbLD4WT
         UfYl8QF0CqwJIhxRbMkjuc2c/O2k4dqQRG71o2Vi1Fjn6GDIEqd6mTnYpTEOV3tUeWXQ
         8kjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778699066; x=1779303866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNq/o4IU8ikyfmt7nA2sK4MgLgtGuKDEcxYMsskEhxc=;
        b=nWLdjLcGWFsmAI7i4It1eVbrx0JFlxD392FKOxbQX7qC/7rC6MvuqqM8IUCZ7qHBHr
         4a9yNS3H6ouo3mfhAun5RrqTSM18Sj0olNAEdotVP0NfvQoHN4yUhDeIWA3C5/wntWKi
         782dweZBpZNNBs6iP8eibQcoRYT58iKgppZiaPHh2uywEA5UvH8x9075JTGnbRKFvKHK
         Ljx5Bo+Ps1ntJIj039s1xBt6OIec4XteaVEu1tomUuOgwjxhIVu4QxV0VuqtRTPME8Aq
         xwa/6VjDQya28VO09GP0SxLG1sfZ9G2cVWLpCPBe65lusZ53AIf6TdG4q7tgLabAvh7B
         vQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778699066; x=1779303866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YNq/o4IU8ikyfmt7nA2sK4MgLgtGuKDEcxYMsskEhxc=;
        b=K/4thoazzTxqonE9Vl0eY2euxUldzO0E1Z6c6FlGc+RsCFhsqH6GZnz6kcEMtgcNXo
         hORWN9rFzKM91xJJWjDeHJ+b4hWdHYVRdVvTXA76ljivqgJ47yN3JG5oKhy3/fAZ13G/
         eZF99fXt0CXMO3SMCuj4icKuuKbnGVqdhT1KjdfhOPrjUYd9ty0ZPqdt2GWG/Ku4iyUZ
         JuhacNPDAH0YRzjOM2nm4W3isB3xdQP2svpCld3uJlmRzzVnEU6cmFt/CHNH5yMWysFY
         y9Kkvy14bOHt6M87SHstSRUoRKnLLrcXOLv+U25bRdPrqLEMedlJIadVnCyEBUmfjhAT
         5okg==
X-Forwarded-Encrypted: i=1; AFNElJ/n5fdmuIyGvhiFXCi5Uvpq0NLZP+dCv9wooOae3dfg6T/mm50mm1WXNzm1DVfKdzYPSHzZvY6Dr0td/GCpHOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5FnkkhbO07pnrcmCYvnmOMVKeE7zVoTg1spWBa2Qz2VeKOQFP
	0050FjALLZmUvqvGmy4tlXx/M1/Mns5XSSrqj3m341sQOQAYAKu/4GpXQ7FzPHEX7nnlSZ0J91i
	AeN/JLNotabxDP0hcke4oMLUmv1M1qWI=
X-Gm-Gg: Acq92OHKTzdaFV/8UH3LVQ5HmAHnRmgA8UbiH1Ixdkfs+ysBYpMEWJngpYfVhDuz6cC
	b8FoTY6Iw7vWWRJs6UGsLLOcpOZ62iFR13CNG2RmZPOINhFpf2Mx3WR0A8w/vJzlyrypTNdLCFQ
	Exhbl4Rfa6ysyDzo5XP7+IJzr3zyJyr1KLQUCVpEGnxphCT2XmKqqpstYyodJB9zs+NWRhqJ6r/
	HMzQVbNfkHXmft84Aon12ZKkHjb6fdTF8e76nm3XkTXHcDXMcT+CKbFvjiGC1rgD5bRoTSPSjNG
	Hzv93PSUm7EPWX0M5NgplL0hmlA1MjG6TSH9LEM/MMIE4p9zoBAJExuTwGyPeb5UrWNUnMYBLxI
	uk26WG80DmobSIF/xzU9FfZ3D/NHW+9uM/Fhv
X-Received: by 2002:a05:6000:25c4:b0:441:1fa5:4577 with SMTP id
 ffacd0b85a97d-45c59228f72mr7616112f8f.26.1778699065337; Wed, 13 May 2026
 12:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513180923.628644-1-hodgesd@meta.com>
In-Reply-To: <20260513180923.628644-1-hodgesd@meta.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 13 May 2026 12:04:14 -0700
X-Gm-Features: AVHnY4LfcVX8iBceeRYxIgtjYR67WpOHjfZTDthTIat8qiTykkQ3tQdztDwqcGI
Message-ID: <CAADnVQKgWUK+tEHrb+teNXTdpR-zfoKajcoGfivuYDM4yCb2Dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] bpf: arena: fix use-after-free in VMA tracking on fork
To: Daniel Hodges <hodgesd@meta.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Barret Rhoden <brho@google.com>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 11:30=E2=80=AFAM Daniel Hodges <hodgesd@meta.com> w=
rote:
>
> arena_vm_open() only increments a refcount on the existing vma_list
> entry without creating a new entry for the child's VMA. After fork,
> vml->vma still points to the parent's VMA. When the parent unmaps
> (arena_vm_close decrements refcount but doesn't remove the entry),
> vml->vma becomes a dangling pointer. A subsequent bpf_arena_free_pages
> call reaches zap_pages() which dereferences the freed VMA via
> zap_vma_range(vml->vma, ...), causing a use-after-free:
>
>   BUG: KASAN: slab-use-after-free in zap_vma_range+0xf2/0x100
>   Read of size 8 at addr ff11000113ec9b10 by task test_progs/198
>   Call Trace:
>    zap_vma_range+0xf2/0x100
>    arena_free_pages+0x6de/0x970
>    bpf_prog_a2b540a82b1066f3_arena_free+0x8b/0xb6
>    bpf_prog_test_run_syscall+0x3d3/0x8a0
>
> The same issue is triggered by __split_vma (partial munmap) and
> copy_vma (mremap), both of which call vm_ops->open.
>
> Fix this by giving each VMA its own vma_list entry instead of sharing
> one with a refcount. arena_vm_open now allocates a new entry for the
> new VMA, and arena_vm_close always removes and frees its own entry.
> If the allocation fails in arena_vm_open, vm_private_data is set to
> NULL and arena_vm_close handles this gracefully, meaning the VMA
> simply won't be zapped during arena page frees.
>
> Fixes: 317460317a02 ("bpf: Introduce bpf_arena.")
> Signed-off-by: Daniel Hodges <hodgesd@meta.com>
> Assisted-by: Claude-Code:claude-opus-4-6
> ---
>  kernel/bpf/arena.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 49a8f7b1beef..a3c46100dd12 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -310,64 +310,71 @@ static int arena_map_check_btf(struct bpf_map *map,=
 const struct btf *btf,
>  }
>
>  static u64 arena_map_mem_usage(const struct bpf_map *map)
>  {
>         return 0;
>  }
>
>  struct vma_list {
>         struct vm_area_struct *vma;
>         struct list_head head;
> -       refcount_t mmap_count;
>  };
>
>  static int remember_vma(struct bpf_arena *arena, struct vm_area_struct *=
vma)
>  {
>         struct vma_list *vml;
>
>         vml =3D kmalloc_obj(*vml);
>         if (!vml)
>                 return -ENOMEM;
> -       refcount_set(&vml->mmap_count, 1);
>         vma->vm_private_data =3D vml;
>         vml->vma =3D vma;
>         list_add(&vml->head, &arena->vma_list);
>         return 0;
>  }
>
>  static void arena_vm_open(struct vm_area_struct *vma)
>  {
> -       struct vma_list *vml =3D vma->vm_private_data;
> +       struct bpf_map *map =3D vma->vm_file->private_data;
> +       struct bpf_arena *arena =3D container_of(map, struct bpf_arena, m=
ap);
> +       struct vma_list *vml;
>
> -       refcount_inc(&vml->mmap_count);
> +       vml =3D kmalloc_obj(*vml);
> +       if (!vml) {
> +               vma->vm_private_data =3D NULL;
> +               return;
> +       }

I'm tired of seeing the same garbage patch from claude for the 3rd time.

Please make sure you use claude on the latest kernel.
The fix 4fddde2a732d ("bpf: Fix use-after-free in arena_vm_close on fork")
landed a month ago.

pw-bot: cr

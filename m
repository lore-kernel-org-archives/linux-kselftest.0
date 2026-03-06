Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F182BDC27
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 00:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757415; cv=pass; b=d7gtAXSAzwjMDTp3YiAhsAma3xBkOcLBJWp0zVfEUB/Z8NVboumkgznz1Ym+cF06BvY84bgdJoSIuVZrFlFVMVs8/T4hCe/aMI0AAhbIdOPVX7YJKaJMnTR1f+iCpMfjBot9uwrYofpJ7R/71J4fQqn1HggPKXvFshaRNZcyY9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757415; c=relaxed/simple;
	bh=RbZw6MhqPnT2RbFj1WddPQWGkVpMd4AG3XDQjFCI2NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOkhpXf/V2DpxRPrpIxgOtQ6+zZITwtD0fv47DJMSsDUlZ6lnXP9hR8HqQmmWc0vIL6+9qF9OWbsV38dedX4JpaOw19HLw3lCiGm/7DGhBO3i+Y4ki12l0wicaF2xC975xdjlgcSAGFT/Sv/WpovQZa4v7cPssr/sexGlkWCTB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/4U/fY+; arc=pass smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/4U/fY+"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-439cb5af25bso2081489f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 16:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772757411; cv=none;
        d=google.com; s=arc-20240605;
        b=PT9Djjfj0IOR0hx6i3klXkJpOLop+f3PPr8OdbZy3uPOsVlYpp3XoXhZ2EeLd/sy3x
         oFRffYDZfEuwm+Zv94HPOi7busgRWgWed/BE4khLqMQcx0r7VECHQ1eeqKz1uNdvB8lv
         MA/6mSDCTUZBU8WyFaTmm/WBe6YL6hhR2KJNUNy6ZzTknwehpbRI5U+qkX1c1VOEMrK2
         kAkuS9aEuMJze4MYvBx1NtAEaTeYKRwuNZlIYx1isPhU1mnjv9qrEcY67zoUkX1srAVa
         dS7Ihl7+D2brp51AhKTqEYGu9Xa5XtIkTUoYBgaxZYsg7lmJW2S43Wr2W6bOhJAZAYAO
         ELzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RTSe32IZkDPz+w+ci/R6QctvR4dtcR+PwGTbrsp0C94=;
        fh=gqZfIHe3U0bfcHnNTSzKEOYOWgYrvFOSVLrCG74T2Ps=;
        b=KPiBHqEDBUM+bRU8h5UrnGRXGeuxpbaq4NDSSziTI1VDnJzCeZeLpssadPkFP74rNv
         RGmgC0FQkOaIe9Zh/Y7TH2VfkSHaf0WcyPIZtAgLc2CpY9w2O0fh8yIE6U708x0eI4xY
         oId1/ubP8zrnLLM/PLmGFGqqs6kYsgr8YUwJajBbfcK1wKqR4pgZ8tAo9DhLf8Ltb8vx
         6Svy767YF0owmE+fM7CMuwPZ2Ohx5WMeLkwEtFpmFLqHrUjMiZZRHmHoiDeEHs9EWQf8
         2LDpWcVxoVkfHa9tJ7NEAEdxy/FYDdjO0+IswKbOvxaP+WwDHjdGogtJ4/OHkUPp+3TX
         m+ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772757411; x=1773362211; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RTSe32IZkDPz+w+ci/R6QctvR4dtcR+PwGTbrsp0C94=;
        b=e/4U/fY+lF8eLRxeo0PojkQhhM2rExLvHAN2Swhrxbewxcs+KqBVpwe5hg3MFoNc89
         K9RywTaRHIshAnyVnm3kkXNgTnDuPjJl7VfjTLAY+/ZJs1jPifkSuvuLMRTWJrn9dhyM
         pVE88qy0BnWWUZYbi2/NGmORDrLGoFbh29CTVyMUVx72IKJrhz+T2FXJYC4qPx+R6TL0
         p+poNTVztvzvCk1Unf4yMkGc5wuw7rcxX8LN9kh+8I0F7ejnJZj4ZwPDCvnNQprDgMK9
         L1psfINkSY4gYkvLP8i5kKyMB7Mpyx1AJRSBli2aPjk1+3GaNxsF2i0qWbOgGhnv9fmY
         iuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757411; x=1773362211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTSe32IZkDPz+w+ci/R6QctvR4dtcR+PwGTbrsp0C94=;
        b=W3JYUtLUJ+8XrqyqnkDmM4NhjflOTW0c4tLPhZG+WLf+rAupg2z0Ik7I8BVGgCIceW
         LWHv3vN2ej7plu8bQPe6rZfYIP/1x3jkIyfnLYrGRpvh+y5VUuIw02hVtvzUrkkgbpAA
         HRByd4DATzuNyJJprT1wDXgW/ng91IupLzmwYDIi5RGuh6ZG3e3c84he+71jih92tE29
         43iADb4L15lqXe8jl8/lU5zTm95cHf8mceTRd6jQkmWg+mONxpHzhjH6EurqzZd1uLhq
         X/I8p3jalXD2zdVfpwdEYMgC4+89baEkThtSpV5rRTknk1kc4iPwrVYWUnkXV5KRnV3z
         ftjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/dzl5QTfOLPSxB2K4hd1k6B6GTW/MAECgZL3Nc5LqtjbuMR03RCv546zbK25vqvyEEteer3dbooK3hAUppkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRiUGEMjOQq8vIs+UkK2dbR17RPVltNgPWCKRZRJZDKBtStMci
	d/YgY2GeuoQQrVKqROY43l00sIMo+K7O70mZYmqoJkpxbSwmsW4fjY5v3QNsWqZq9h8Omd6+t02
	z25K9+2An0oheceXuhCrNKhA94cdgTvI=
X-Gm-Gg: ATEYQzyS2/3luZYX85MW+BS5yTv7f9Kbld0htLgqT96aZyt9HzTbP+tx7vEep9dcTyr
	PygA3gR1B72AniYr4MWigjvH3oS3y+RwmWlsHXj0mJv8dLQBC1z/W1Ltc0k13FAsBmG/tdORKU0
	JnoMwWOLvH7S4zssIWlBm5XwyBQGBc4hlTfP6CXErypSP/ObCJp3is2bK4fK46qb/ZS6abzcw3I
	WHyR1VG/HnQsWPFtYjTP9C5pJOhmF4DI3bQGzspwpIg95CrC3NgBOLNOroS3lkkRVDfuytXkaur
	91280GgptaH3xbUfIhI9xyGLkcyWr8yMXbdsgSnatKJJSFVP/6yLzkwlFiHjE9quzAEgxQ==
X-Received: by 2002:a05:6000:4310:b0:439:cd26:ce0c with SMTP id
 ffacd0b85a97d-439da35fa66mr428103f8f.17.1772757410967; Thu, 05 Mar 2026
 16:36:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304143459.78059-1-pilgrimtao@gmail.com> <20260304143459.78059-3-pilgrimtao@gmail.com>
In-Reply-To: <20260304143459.78059-3-pilgrimtao@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 6 Mar 2026 01:36:14 +0100
X-Gm-Features: AaiRm50wuqcWBX3i79eyR-zjLLwAkDsOm5FDWp7tn3eAvbjTDBPzPOp4oStvcGA
Message-ID: <CAP01T75A31a6w_j6kT-Sui9Rq1MT0kMo2zt4bYpV9HJyQ8JmMQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] bpf: Add bpf_list_add_impl to insert node after a
 given list node
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 15:55, Chengkaitao <pilgrimtao@gmail.com> wrote:
>
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> Add a new kfunc bpf_list_add_impl(head, new, prev, meta, off) that
> inserts 'new' after 'prev' in the BPF linked list. Both must be in
> the same list; 'prev' must already be in the list. The new node must
> be an owning reference (e.g. from bpf_obj_new); the kfunc consumes
> that reference and the node becomes non-owning once inserted.
>
> We have added an additional parameter bpf_list_head *head to
> bpf_list_add_impl, as the verifier requires the head parameter to
> check whether the lock is being held.
>
> Returns 0 on success, -EINVAL if 'prev' is not in a list or 'new'
> is already in a list (or duplicate insertion). On failure, the
> kernel drops the passed-in node.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  kernel/bpf/helpers.c  | 34 ++++++++++++++++++++++++++++++++++
>  kernel/bpf/verifier.c | 17 +++++++++++++----
>  2 files changed, 47 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index cc1a096a1f64..740b53024283 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2505,6 +2505,39 @@ __bpf_kfunc struct bpf_list_node *bpf_list_back(struct bpf_list_head *head)
>         return (struct bpf_list_node *)h->prev;
>  }
>
> +__bpf_kfunc int bpf_list_add_impl(struct bpf_list_head *head,
> +                                 struct bpf_list_node *new,
> +                                 struct bpf_list_node *prev,
> +                                 void *meta__ign, u64 off)

I have pretty much the same comment here, there is a lot of
duplication between this and __bpf_list_add.
We can write list_add_tail in terms of __list_add, and then unify all of this.

> +{
> +       struct bpf_list_node_kern *kn = (void *)new, *kp = (void *)prev;
> +       struct btf_struct_meta *meta = meta__ign;
> +       struct list_head *n = &kn->list_head, *p = &kp->list_head;
> +       struct list_head *h = (void *)head;
> +
> +       /* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
> +        * called on its fields, so init here
> +        */
> +       if (unlikely(!h->next)) {
> +               INIT_LIST_HEAD(h);
> +               goto fail;

Not clear to me why we should fail here; why can't we continue adding
after initializing the list head?
E.g. __bpf_list_add isn't doing it.

> +       }
> +
> +       if (WARN_ON_ONCE(READ_ONCE(kp->owner) != head))
> +               goto fail;
> +
> +       if (cmpxchg(&kn->owner, NULL, BPF_PTR_POISON))
> +               goto fail;
> +
> +       list_add(n, p);
> +       WRITE_ONCE(kn->owner, head);
> +       return 0;
> +
> +fail:
> +       __bpf_obj_drop_impl((void *)n - off, meta ? meta->record : NULL, false);
> +       return -EINVAL;
> +}
> +
>  __bpf_kfunc struct bpf_rb_node *bpf_rbtree_remove(struct bpf_rb_root *root,
>                                                   struct bpf_rb_node *node)
>  {
> @@ -4574,6 +4607,7 @@ BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
> +BTF_ID_FLAGS(func, bpf_list_add_impl)
>  BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_task_release, KF_RELEASE)
>  BTF_ID_FLAGS(func, bpf_rbtree_remove, KF_ACQUIRE | KF_RET_NULL)
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index c9557d3fb8dd..e458cf3b1dd1 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -12464,6 +12464,7 @@ enum special_kfunc_type {
>         KF_bpf_list_del,
>         KF_bpf_list_front,
>         KF_bpf_list_back,
> +       KF_bpf_list_add_impl,
>         KF_bpf_cast_to_kern_ctx,
>         KF_bpf_rdonly_cast,
>         KF_bpf_rcu_read_lock,
> @@ -12525,6 +12526,7 @@ BTF_ID(func, bpf_list_pop_back)
>  BTF_ID(func, bpf_list_del)
>  BTF_ID(func, bpf_list_front)
>  BTF_ID(func, bpf_list_back)
> +BTF_ID(func, bpf_list_add_impl)
>  BTF_ID(func, bpf_cast_to_kern_ctx)
>  BTF_ID(func, bpf_rdonly_cast)
>  BTF_ID(func, bpf_rcu_read_lock)
> @@ -13000,7 +13002,8 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
>                btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
>                btf_id == special_kfunc_list[KF_bpf_list_del] ||
>                btf_id == special_kfunc_list[KF_bpf_list_front] ||
> -              btf_id == special_kfunc_list[KF_bpf_list_back];
> +              btf_id == special_kfunc_list[KF_bpf_list_back] ||
> +              btf_id == special_kfunc_list[KF_bpf_list_add_impl];
>  }
>
>  static bool is_bpf_rbtree_api_kfunc(u32 btf_id)
> @@ -13122,7 +13125,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
>         case BPF_LIST_NODE:
>                 ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
>                        kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> -                      kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
> +                      kfunc_btf_id == special_kfunc_list[KF_bpf_list_del] ||
> +                      kfunc_btf_id == special_kfunc_list[KF_bpf_list_add_impl]);
>                 break;
>         case BPF_RB_NODE:
>                 ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
> @@ -14264,6 +14268,7 @@ static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
>
>         if (meta.func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
>             meta.func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> +           meta.func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
>             meta.func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
>                 release_ref_obj_id = regs[BPF_REG_2].ref_obj_id;
>                 insn_aux->insert_off = regs[BPF_REG_2].off;
> @@ -23230,13 +23235,17 @@ static int fixup_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
>                 *cnt = 3;
>         } else if (desc->func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
>                    desc->func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
> +                  desc->func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
>                    desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
>                 struct btf_struct_meta *kptr_struct_meta = env->insn_aux_data[insn_idx].kptr_struct_meta;
>                 int struct_meta_reg = BPF_REG_3;
>                 int node_offset_reg = BPF_REG_4;
>
> -               /* rbtree_add has extra 'less' arg, so args-to-fixup are in diff regs */
> -               if (desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
> +               /* list/rbtree_add_impl have an extra arg (prev/less),
> +                * so args-to-fixup are in different regs.
> +                */
> +               if (desc->func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
> +                   desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
>                         struct_meta_reg = BPF_REG_4;
>                         node_offset_reg = BPF_REG_5;
>                 }
> --
> 2.50.1 (Apple Git-155)
>
>

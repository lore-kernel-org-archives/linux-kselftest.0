Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14792BE7D1
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 00:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756945; cv=pass; b=Dn71yIHJhNotoOdxFedq2kfdL2gOqmOdoKWKef4JbcKgzWmin51I3CzQm9aCOE16BahNqolA9jKxamoyGWxH5P1E1tF6d6MAndH+v8xHtGHyCQ4UXUdy0dWwvOIki3ktyNEhzJHCOTjtidKxWT1qGT0JY8EYogKQ3BhPqNyvgVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756945; c=relaxed/simple;
	bh=XiKFz3NSS2GNv0XyH/17O4rXg5FulZKIUJED+ry5tuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hw3D85bnjfz9RySlDrm5Y/e/xpwiMTSP3mHJMwFGN5Zm35HhGxMyN+rCC+Fm5OqvwM9gbj8VcCnsgSooFFNHCoqURHN0lZItAvrDM3If0fd2Or0uMXkvl+TzsOeJ5WHEA+35vVnsQqcD8BZ1mlZx1gmFG8Y0n0hdzdCZL/aGjCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1AR8QQa; arc=pass smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1AR8QQa"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so98819305e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 16:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772756942; cv=none;
        d=google.com; s=arc-20240605;
        b=VDThnBGG76etTr/QRi9Vd1GNmS7bvhf0o5VawsxWdLcVx2dnvAq/8a9ynR0Kw5MAO5
         EHPBmn4AJaZdnZX9t/5jGk1ssd0GY6j0/ccvmhrNKsVtTMGsTUq/h8w0bfNSeZ8Ck7GH
         kBAWgl+Idgz7Bx8EUJNEtM27ymk+P+gpJztW0wGH9gsSpc2fmEXPfN8JMQM3npGLUAQo
         s7ryhbx7S30n6i0LTm+ukjxRzpuSzJ+L+N5DGUyUKP5u7JJP8DLpWxm/6Wj1uXjkcoBm
         ZmCNWKZHresIUI3VaStfy3bLMkzM/37oCC78wN9DUvuZbGqCTVEaNIv2CJrdpkdqx6R2
         j8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uGiaxYm5ImeOCKYL6fc2NAkH9q7e9f/RWh+/TVwJexo=;
        fh=hmXBy9fmQcxLc/pclCd9HfO5Syk+jWZ7HnYhhzkHE/I=;
        b=Ht5k9OuOipMx+ilAJGhsuJHBvB0qB+DImgOmaFH7OBJYSJwx9489B8ZR6dbcSUmCoA
         jy0QTksA5DjRRqh9s/id7Jninwnptwa3eCZqGW5gAja2SmZKI5nbeu7gMlkFCqC6ptMF
         silB9w+7i56NPRKLAdJsjOopaAFDCgTFVyyJ0cY2LXmqAUSmM45T7RJXggu88ulSXynh
         GgBZsD/9izrVZ+N9D0cEGYn7Z3QOHs/2VcdbkMRJWH4sjSZOrd/63hX4A9Q794AUVLpL
         Of3tAd2BBeQ5V7DicP1yOg8fkpch2lniuz+QcNzRIXY/I3yWvTjOPEQb1GSC2xkIJGXC
         9maQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772756942; x=1773361742; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uGiaxYm5ImeOCKYL6fc2NAkH9q7e9f/RWh+/TVwJexo=;
        b=c1AR8QQa9Ps8Q34Sjl30ZUQ5hf946jkSr9Dd6MdkEABhMdS1ewOGuF/6dwdpPEADxS
         CsxKY+n/O2Y3bFxe1OjgRuTQT30Xb/8DZ3WEuDzK2mvMcS6P/uqE2+WjHQ8xP4us2lQi
         aQVyg1Cv5NQYAAA6bu+nQ1x7ztyLMHxUAZfQTnf4dyD1MSeXV7qnJN5o2Y+2T3E5ik9Z
         DSu9/dAzeTWjBIoro56JT+xLAfXhLmIYn9o1T8BXDP69/uzx8y2iGWk1GwTReW8oa88G
         83iuDYurWcY8uTd1r+My9x5ufW88lQd4YBba9qj6xSC9J2ibyQcA6tFmeNJXWnsISFej
         CAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772756942; x=1773361742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGiaxYm5ImeOCKYL6fc2NAkH9q7e9f/RWh+/TVwJexo=;
        b=s56EEg8WsELSs1+2GmRhRoQ9iI0qSXmwTQKF76fThKppLJJv+VAHvrtndahEJ/+K6j
         Yk1OJ47vvz3Ybb0oiyYycPsewjZDi8jzlxupOdlYC36jYAZARJNunIaUbjvWp21aT+5E
         JOJ334TWdjIxU4xfL2kksCR3zkL5AP1XyHI46TI+vNYEp68knDUwzch5vm29K/59u2Xt
         YsGWDpkRs10PjL6jVx9BJlUjTtLF8pPrPDeQyPz5OGU0hgnGIUxO7NIBfj4ImfKq9+vw
         wLkDtLJA3P1XC32ekFwfa3g8m+aojeug2TzgSNXhLIOOzh+YzD3h9hU/6r5eFTicsgFB
         nsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt1Kwlq/k4osmorb9gsLnFOn/UcGrX5ISWNb57AkwtbEAKpHNTQhAt/eIq2D3SsCoYw6C9DbtsKIBkWl93hCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxylsbKXqsznq6tOPXYZwlin8C/F7eh5kCmeBm36fFfnzpYpRpi
	rsOXJiPdh8R5anj6tA8J8EQuUphkzYNwFukz6r3gatxtrNoTjlyMgX8wNzntAA/NLEYAtHuCJ4F
	dTU0reqWw3keUD4vZ3bPx4iUFkMhxyJU=
X-Gm-Gg: ATEYQzxmBpPG2QaIh2jwVNWZImPslakiAEFaWlYHrweA4Nm0kCQBsiCxeq30PRfp3JA
	X64lCB9zR/scGsHPhKBVUl5ryQGghy2bQXh4lf2maB7j7Hp9VYdwV1mMVsvtCSD1P1Zfs1lPtMr
	uTdC3s+0Xyfa0z8+ZbPSNviDWAmz0gOkaxlO22TVA6Q4P3+cNgVgO9LxHfc9UAe/f3zEwZq9opw
	LKry7qarDMT7NehoZ9zf7Syen/bUR8kZMilmYvvYYnbnS4lKjX9w3vAEEKkr2oSDhiIRVx5Nh3b
	L4Vj6nJVtu/HWYlAminwenBWdfrQrcXJlr+DeR5t1Pwfrct2eL45yD6l1Hg=
X-Received: by 2002:a05:600c:1c08:b0:483:afbb:a086 with SMTP id
 5b1f17b1804b1-48526967ad4mr1934295e9.29.1772756941926; Thu, 05 Mar 2026
 16:29:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304143459.78059-1-pilgrimtao@gmail.com> <20260304143459.78059-2-pilgrimtao@gmail.com>
 <CAP01T77B_Rae71cYgZ7b+xbYG+qaaUNscLe2c6gpkDj+o6B0ag@mail.gmail.com>
In-Reply-To: <CAP01T77B_Rae71cYgZ7b+xbYG+qaaUNscLe2c6gpkDj+o6B0ag@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 6 Mar 2026 01:28:25 +0100
X-Gm-Features: AaiRm53ceFPu9wI3wikRYo4swDAwjCVEzxIlKQu93tGMaRc6eOn6nkEQJ_Z3FPo
Message-ID: <CAP01T75uZchsNZfvUDP3Vq5iVUwMky-SfdEBNVbBCmK0hdsB+Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] bpf: Introduce the bpf_list_del kfunc.
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Mar 2026 at 01:14, Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
>
> On Wed, 4 Mar 2026 at 15:50, Chengkaitao <pilgrimtao@gmail.com> wrote:
> >
> > From: Kaitao Cheng <chengkaitao@kylinos.cn>
> >
> > If a user holds ownership of a node in the middle of a list, they
> > can directly remove it from the list without strictly adhering to
> > deletion rules from the head or tail.
> >
> > We have added an additional parameter bpf_list_head *head to
> > bpf_list_del, as the verifier requires the head parameter to
> > check whether the lock is being held.
> >
> > This is typically paired with bpf_refcount. After calling
> > bpf_list_del, it is generally necessary to drop the reference to
> > the list node twice to prevent reference count leaks.
> >
> > Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> > ---
> >  kernel/bpf/helpers.c  | 27 +++++++++++++++++++++++++++
> >  kernel/bpf/verifier.c |  6 +++++-
> >  2 files changed, 32 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > index 6eb6c82ed2ee..cc1a096a1f64 100644
> > --- a/kernel/bpf/helpers.c
> > +++ b/kernel/bpf/helpers.c
> > @@ -2459,6 +2459,32 @@ __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
> >         return __bpf_list_del(head, true);
> >  }
> >
> > +__bpf_kfunc struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
> > +                                              struct bpf_list_node *node)
> > +{
> > +       struct bpf_list_node_kern *knode = (struct bpf_list_node_kern *)node;
> > +       struct list_head *h = (void *)head;
> > +
> > +       /* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
> > +        * called on its fields, so init here
> > +        */
> > +       if (unlikely(!h->next)) {
> > +               INIT_LIST_HEAD(h);
> > +               return NULL;
> > +       }
>
> nit: I would avoid doing this here, just for symmetry.
> If we are part of the list after the owner checks, this should be
> initialized correctly anyway.

Hmm, looks like I should take my ack back (just in principle, there's
no bug here).
I see you copied the comment and check from __bpf_list_del.
I was looking at rbtree_remove to see whether it did RB_CLEAR_NODE(n).

I think it's fine to keep this init, but let's try not repeating the
same logic twice.
I would make all 3 (pop_front, pop_back, list_del) use __bpf_list_del.
Just pass h->next, h->prev, or node depending on which one is being called.

>
> > +
> > +       if (unlikely(!knode))
> > +               return NULL;
>
> nit: It seems like node can't (shouldn't) be NULL, so we can lose this check.
>
> > +
> > +       if (WARN_ON_ONCE(READ_ONCE(knode->owner) != head))
> > +               return NULL;
> > +
> > +       list_del_init(&knode->list_head);
> > +       WRITE_ONCE(knode->owner, NULL);
> > +
> > +       return node;
> > +}
> > +
> >  __bpf_kfunc struct bpf_list_node *bpf_list_front(struct bpf_list_head *head)
> >  {
> >         struct list_head *h = (struct list_head *)head;
> > @@ -4545,6 +4571,7 @@ BTF_ID_FLAGS(func, bpf_list_push_front_impl)
> >  BTF_ID_FLAGS(func, bpf_list_push_back_impl)
> >  BTF_ID_FLAGS(func, bpf_list_pop_front, KF_ACQUIRE | KF_RET_NULL)
> >  BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
> > +BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
> >  BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
> >  BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
> >  BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 67c09b43a497..c9557d3fb8dd 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -12461,6 +12461,7 @@ enum special_kfunc_type {
> >         KF_bpf_list_push_back_impl,
> >         KF_bpf_list_pop_front,
> >         KF_bpf_list_pop_back,
> > +       KF_bpf_list_del,
> >         KF_bpf_list_front,
> >         KF_bpf_list_back,
> >         KF_bpf_cast_to_kern_ctx,
> > @@ -12521,6 +12522,7 @@ BTF_ID(func, bpf_list_push_front_impl)
> >  BTF_ID(func, bpf_list_push_back_impl)
> >  BTF_ID(func, bpf_list_pop_front)
> >  BTF_ID(func, bpf_list_pop_back)
> > +BTF_ID(func, bpf_list_del)
> >  BTF_ID(func, bpf_list_front)
> >  BTF_ID(func, bpf_list_back)
> >  BTF_ID(func, bpf_cast_to_kern_ctx)
> > @@ -12996,6 +12998,7 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
> >                btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> >                btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
> >                btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
> > +              btf_id == special_kfunc_list[KF_bpf_list_del] ||
> >                btf_id == special_kfunc_list[KF_bpf_list_front] ||
> >                btf_id == special_kfunc_list[KF_bpf_list_back];
> >  }
> > @@ -13118,7 +13121,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
> >         switch (node_field_type) {
> >         case BPF_LIST_NODE:
> >                 ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
> > -                      kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl]);
> > +                      kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> > +                      kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
> >                 break;
> >         case BPF_RB_NODE:
> >                 ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
> > --
> > 2.50.1 (Apple Git-155)
> >
> >

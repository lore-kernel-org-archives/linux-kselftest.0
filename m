Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6322B3E8C6A
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 20:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173480; cv=pass; b=K1miJt6X2TH3WGjAdb0ICTAvVDnjkP9B9eKLiCe5c+xI+JQiPxVHJowHMEbQgn1cfOaUCiop5H0UlxK9T668JnaxIl0WLEUcSXNOE0b0NCsnniSGQktodWKDvPjqLPpe4LO6NwjDuJsuf3zJYRlfitu7LtqyTcovZxh6lAlYEDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173480; c=relaxed/simple;
	bh=VcbIZ/WmA7ETF97AV4CjkC1KQDUJSW8FrZRfP+0Kr5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IoxspfR5QsQpZ/H1EVpUq1PtnWwiW+6ZuYDAuDU8kjoYQH9+Kf/8OfntpxOZ1cELXzQPWiVjaubHZ7XDRqnbcaQrPlApjT48wUU/VxxZMpidsUFe5/b+3DtFsQ3U/S9PCN01BZkmmqFHjB8JVf70pG2ieUgzgkI+ykHQ4Oijabk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5jsQ1Zg; arc=pass smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5jsQ1Zg"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-439b790af67so224296f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 13:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773173478; cv=none;
        d=google.com; s=arc-20240605;
        b=UtkAaTCO9joTDzEhE3gzsxxgkEpi5mEN0ENOIS9G+TBRpPJeLcApD0jTBzZv9YCvZ2
         pqQLVNZWBzDAcwdJ8X90fgteAviswdwaKYOGwZp8qKC6HTlSgpvtQBF4DhNGQ9G0kCfQ
         zJhben1ZM9UdRgomDyBzs0W2aFDfOrmSVeBhkw31oiZo7oIoPQ/G+rOkeeroIeUnXygb
         eCC2R3+qajzHxQzVrfk6El3joXOCAGK/EclxAs6yTG/sT0fqhabKgkg0TRiHCVRaym5f
         xoK3Hb92+X5/WqxxJLzywPDQkb8lMGW8PumN2Mrq+rS3RQwGgMWX6M2ru4uMWDranWav
         OKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T3umR3Cr9WiTS9b+qrsYcPDG6mxvuCgn4bszgUuEQ+E=;
        fh=Go0Py532vqhbeQ9t3l0YmQZzLbbAZdsWSgCdFabjph4=;
        b=SXYFXx4R5K8JezRY+dI5Nr66Hp+ocMH0GraUkGgP6dPZfXDdHZEmyAhCtk5p5IXBJf
         wuaXDDQ+1K5Ck6JXI/7kN1JgnZkyAGPtBUw4rNP/MvqSpmP7uoEhmaJzyJA31POxIIL+
         Amylbx5gC4r4wg2ifS9iCoN3vpV3gIshBe+PXXRlVgqVrVHSncHR3Wn8GX5xU7Nw9KsC
         GAo+X4T2222KHblgOs6qeLdCB97g9VsVnBtDfusb/Pz9jzSPTbqcd01OLq4rVePXHmGS
         64YW5TVt4ED8v7iTEYRrKMnmM4LAVF6RuU6x02mRRP8SIewtEAkB+umg6QSFhYLLzmyE
         xudQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173478; x=1773778278; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T3umR3Cr9WiTS9b+qrsYcPDG6mxvuCgn4bszgUuEQ+E=;
        b=i5jsQ1Zg61Tx7lePkczxOQRbEYo7tGlcBq8ut93ipLGKUjdwZv1koSbOe1DGGmTRAp
         o5LanPg+yOaxI+xgLW4b+w39wVo6AyN84GGwsMDdxFk7VFNkGYAUWhsDvsf+YlruGiik
         5icwM1xTIC/svhzRhU8uqaGXIJl0vG5JNwBEKoM+j2MWefRCY/GfI27QIaKkavT4uwH+
         o0tbFA268F8cLdfKpPictpJyRsg9zVgzpe0Sd3p05h5J1o24gTlPtBZLQ75ryf2xMebp
         BiZm5E4PBa1fH172eiU0pNrFyUxuswz3fFsmGN+wHWxySCjUvuJABQgqO4C+YWerhoh9
         d/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173478; x=1773778278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3umR3Cr9WiTS9b+qrsYcPDG6mxvuCgn4bszgUuEQ+E=;
        b=IsmT9Enw5GZkNXg+ZmX2b01os0DfUP2enQ+O9k8wGlEnKighE03tye9zt6OwBYzAYF
         tPovO2ZwwDC/NyJ1cC348+6DFakRPNff6NmIWiSr+X3lpwX2ryFWUyMqXxbgS9o/EBDf
         /hehRSQ1Hbnuboacm5kW84Jglv3n0O2ePNdEtwVPJN4gsIfeQddWpORphpkUG269YXcT
         rEZ1d6Mqx8lWNCyy0hnZLIWTS7BG7QzUh9PssD0SUWeaycKwq+qqKXWZ0a60A7bp3CW0
         F2Yn/rzgs8ZJj88wD4mBwxWXSzA6rKzIYd88mtCW783MT8bDyQtkCIQ/AZ7Eo/7kn7OP
         O2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPmmYSHXqvVxiYcYbOV1mE1Wqos9KGOEptRm5pLtfruY6N7Qjss1QnfRzrdO/Q0jmUkJuNpNwbbaFhKWslNv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEWjXfbbEBYRLkawbMG8KkBbTswka0VyQrgeU/BR9jl3UnpQCU
	AYxHnaKFiG7sEtsrlBaYaeB430EiLM+AAtOdg++WGiDXMisMOB6i4m9PdT0/OkvEBYifSQCrND5
	WASgzsIQpgPMffX47SERj03ho8crqZZc=
X-Gm-Gg: ATEYQzy90u6AWdWoTh0bqILLV6pM+va/yl47Mz2WSPSzEoZ1m+YeYbHEqpAB2yw/agc
	BzfY7K5vyeBLM5uEwUSdC8iy4L9q+1ZiUc/oJm2OEtcpsYE6S4ikK4yQzBISdbZ2tGCenA2oQ+h
	zbHzuImgt1QnqJdMChejBdVgLIohbd8dGkFhbanzoQ6tkP+Yi8f8HQUPYmEehLAC32WLX/6tIoQ
	GQZfrX9M9hl0/m3IF1dCzIvaeFyPBDwqkJyGNaPTVh+VHO0ICXk5IqHhB3RMIocL90IiFf1wtpD
	SXet2229v7YKkru57slu7JFuIECW4nrR5m5eskt9t14FOB7kFE3abYOvtYie8DUNOeeR9TA=
X-Received: by 2002:a05:6000:2584:b0:439:d084:9e48 with SMTP id
 ffacd0b85a97d-439eff12b5fmr8927182f8f.5.1773173477509; Tue, 10 Mar 2026
 13:11:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308134614.29711-1-pilgrimtao@gmail.com> <20260308134614.29711-2-pilgrimtao@gmail.com>
 <8f97dbb5-de94-4ac0-8b3c-e0ce890fffc3@linux.dev>
In-Reply-To: <8f97dbb5-de94-4ac0-8b3c-e0ce890fffc3@linux.dev>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 10 Mar 2026 21:10:41 +0100
X-Gm-Features: AaiRm51DzLYNqWfe42hlK1YZj_mIKI1_ZQ9yMcurPyOpM09KQOLqEoROpBYmAQE
Message-ID: <CAP01T76Nxy28ZAMi86Ez-WcCpiHKe2EBz4Y2j1XJjrRs=Qp-CA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 1/5] bpf: Introduce the bpf_list_del kfunc.
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Chengkaitao <pilgrimtao@gmail.com>, martin.lau@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Mar 2026 at 07:34, Leon Hwang <leon.hwang@linux.dev> wrote:
>
> On 8/3/26 21:46, Chengkaitao wrote:
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
> >  kernel/bpf/helpers.c  | 30 +++++++++++++++++++++++-------
> >  kernel/bpf/verifier.c |  6 +++++-
> >  2 files changed, 28 insertions(+), 8 deletions(-)
> >
> > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > index 6eb6c82ed2ee..01b74c4ac00d 100644
> > --- a/kernel/bpf/helpers.c
> > +++ b/kernel/bpf/helpers.c
> > @@ -2426,20 +2426,23 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
> >       return __bpf_list_add(n, head, true, meta ? meta->record : NULL, off);
> >  }
> >
> > -static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tail)
> > +static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
> > +                                         struct list_head *n)
> >  {
> > -     struct list_head *n, *h = (void *)head;
> > +     struct list_head *h = (void *)head;
> >       struct bpf_list_node_kern *node;
> >
> >       /* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
> >        * called on its fields, so init here
> >        */
> > -     if (unlikely(!h->next))
> > +     if (unlikely(!h->next)) {
> >               INIT_LIST_HEAD(h);
> > -     if (list_empty(h))
> > +             return NULL;
> > +     }
> > +
> > +     if (n == h)
> >               return NULL;

Couldn't you keep the list_empty(h) check after INIT_LIST_HEAD(h) as before?
And we don't need n == h either. You could add a comment that n will
never match h.
The verifier should ensure it, since it distinguishes the head and node types.

Let's say the head is uninit. Then list_empty(h) will catch that case.
Otherwise n might be NULL.

After list_empty(h) says false, we definitely have non-null n.
We just need to check list membership using the owner check, and then
we're good.
It will be a less noisy diff.

> >
> > -     n = tail ? h->prev : h->next;
> >       node = container_of(n, struct bpf_list_node_kern, list_head);
> >       if (WARN_ON_ONCE(READ_ONCE(node->owner) != head))
> >               return NULL;
>
> This refactoring is worth, because the "struct list_head *n" seems
> better than "bool tail".
>
> But, such refactoring should be a preparatory patch. Importantly,
> refactoring should not introduce functional changes.
>

I think it's fine. Let's address this and avoid too many respins now.
It isn't a lot of code anyway. You could mention in the commit log
that you chose to refactor __bpf_list_del though.



> Thanks,
> Leon
>
> > @@ -2451,12 +2454,24 @@ static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tai
> >
> >  __bpf_kfunc struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head)
> >  {
> > -     return __bpf_list_del(head, false);
> > +     struct list_head *h = (void *)head;
> > +
> > +     return __bpf_list_del(head, h->next);
> >  }
> >
> >  __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
> >  {
> > -     return __bpf_list_del(head, true);
> > +     struct list_head *h = (void *)head;
> > +
> > +     return __bpf_list_del(head, h->prev);
> > +}
> > +
> > +__bpf_kfunc struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
> > +                                            struct bpf_list_node *node)
> > +{
> > +     struct bpf_list_node_kern *kn = (void *)node;
> > +
> > +     return __bpf_list_del(head, &kn->list_head);
> >  }
> >
> >  __bpf_kfunc struct bpf_list_node *bpf_list_front(struct bpf_list_head *head)
> > @@ -4545,6 +4560,7 @@ BTF_ID_FLAGS(func, bpf_list_push_front_impl)
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
> >       KF_bpf_list_push_back_impl,
> >       KF_bpf_list_pop_front,
> >       KF_bpf_list_pop_back,
> > +     KF_bpf_list_del,
> >       KF_bpf_list_front,
> >       KF_bpf_list_back,
> >       KF_bpf_cast_to_kern_ctx,
> > @@ -12521,6 +12522,7 @@ BTF_ID(func, bpf_list_push_front_impl)
> >  BTF_ID(func, bpf_list_push_back_impl)
> >  BTF_ID(func, bpf_list_pop_front)
> >  BTF_ID(func, bpf_list_pop_back)
> > +BTF_ID(func, bpf_list_del)
> >  BTF_ID(func, bpf_list_front)
> >  BTF_ID(func, bpf_list_back)
> >  BTF_ID(func, bpf_cast_to_kern_ctx)
> > @@ -12996,6 +12998,7 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
> >              btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> >              btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
> >              btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
> > +            btf_id == special_kfunc_list[KF_bpf_list_del] ||
> >              btf_id == special_kfunc_list[KF_bpf_list_front] ||
> >              btf_id == special_kfunc_list[KF_bpf_list_back];
> >  }
> > @@ -13118,7 +13121,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
> >       switch (node_field_type) {
> >       case BPF_LIST_NODE:
> >               ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
> > -                    kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl]);
> > +                    kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> > +                    kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
> >               break;
> >       case BPF_RB_NODE:
> >               ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
>
>

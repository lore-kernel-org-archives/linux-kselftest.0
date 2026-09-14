Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3B039280A
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 23:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426959; cv=pass; b=H118GA3RUlGp/1g8nv6mqhRdmOy3oz8aR2ZE7dcfjjxjlg2oWW0Q+Z7lSE9J6X372NkgakE5TNd+uiEEnvRvIhF0yyz2CvAAZHk1ThDqFW3GXGHzS/RJsYw82XZ0aReQv5PMzetoE5C2M2r9fLvtWZ052dnGJXnIfOeIltJEcTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426959; c=relaxed/simple;
	bh=HnZj22pjlGHIEfM6bhLJdkIF85ojkiFcxZaEA0PyVZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6EGNR4y1PZEfl347Lva842mrJ0JCBpO/W/8xYJpTh+FCEDHJ9Xls0htlJCy6KEZobUitMFr/n3cA+/crEtGwzSPjmN/IgeIN84pLK1g2RcIsvrD1hcVVMonQ+GoKshsHAOZR0yzda7IVaBXfA2Nq0B1GMMUWUWZQek+0gRVVRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njLUo9f6; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njLUo9f6"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8049e44d0c3so3594976a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 16:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789426956; cv=none;
        d=google.com; s=arc-20260327;
        b=MkUdPK6UP7HFhuAeqEfoDhX0mLti6s1cMkRPwbRNWx9oZwbzqcK5R3ILzJl6mkcF9S
         RU8BTeGc5P6Bmy91MxnHwqTTL//xFRExV9IYXM/IuD9YpPJ2IAgcKjisEaKn2mo0IGnz
         LvpxV7O7OLg9mZHYPntZT/s4QNA+i/CoCUBvzb2L7tN+AWN6LjDMPB+eNRd2Bq89xjoH
         YBjaamFGtqGDWytZ26ZJXeHg1o8r1W4GHJEf/J5JhCjNrqf3k7D0ggg9bhF3+KaZGSZc
         UwnFeg6vz2Rgm0Q+3b88bmiJn8N/bo+TJirrZ/8hzHJ68AwW0h6il8egaWdhmaD7sXui
         Rv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pOUFKWLA82ZDA522DpGzRiQP4xIkyg70D3qyVuxPWKQ=;
        fh=riDHZxYniWZrY5Meb4yAV1eJ8OFjSX8F8c/Xc6kGNew=;
        b=fKRBsSNFuWV/eVeknD2eRCGUavcI6+yh0nJFlmq1ESLTojdZkfalI9M+3GahjsaTvZ
         hVcW66o3LSoRFUeyDosTZum47xnxfPWXHORP15oshTryI0lD8y39WpXcvsaco3scH9ka
         0Up30z3m0gqHmGjFIdSHkaSiI8Rh5pmEYFjmHkrympEvEne/3Hpi6r82MYpD5qIWjZgJ
         IdWoxVoS7m/XUMXVx/c6GrB5fJVDY1nwuhfPB+f3StkHqw4MntpK9IBKxLdY5mmQHDTN
         i0bCWS38RypYM9e1VOZHceWYVthKjwIPh3g8chdQcQAUZdYY8eZvX6dXs1z708j1XE0U
         /7XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426956; x=1790031756; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOUFKWLA82ZDA522DpGzRiQP4xIkyg70D3qyVuxPWKQ=;
        b=njLUo9f613ETcTM0BuZQ/4VcFKGxPrUlgbNcdOnqGn1fpgDzwp1a5Q+vdz6tDUJDrZ
         McuIdpwa0U1GX97oEpWaoSnjchGBZ7wpohw1URwfNZm95eWAWjrRuVaLSWzierLNoTi0
         07PqvdfTBb0sG5IDKXJU5B3jrSJ6LT5fF7Otz6TywYI0cAVi9GHmD5F73G7dSpsA0/UK
         C8Nev/wxrYSqIl1F2SGoL2XAUbw5kndaG/pvZsUAv+fIpulOoU6upAXBL1e4JR1qFzfX
         fdlzqM4JazG9sFpLcubUSpj+hVWNfnpd7fZf5lthjq/189Fw0GAzdh+dQQXrgjGoldfV
         9qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426956; x=1790031756;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pOUFKWLA82ZDA522DpGzRiQP4xIkyg70D3qyVuxPWKQ=;
        b=QsYp8AtXmudhtox/jiSszfwP0v4LrS/j4qg/O6viNynA1exviVvXZgqn5RIyypvXxB
         fm7zWk3WMhu7QBVzSG9twhLd7xreVgbsBONLRok+ruiir/nvg+SKumAe/PtCs3gKyD7h
         BFniK20N2ASFUStK62UtFI/sPNtCKHhNmZMCj/a7Ai8K4vfAgMYEJqYXK0+PIeCrqLyB
         rTw+ZcHOvt5+eAt3gCQ8Wgmd3fEELrnK8TfFxG7+nU5T80nqUq7I3kQFX8/YypM921q0
         kHELBrMoG1/DCt1Iodnu+NHKqBbpsgC8SDnFeJ9TIwKZH2N1H+6/0W1NXL59kHCXhP8U
         MrXw==
X-Forwarded-Encrypted: i=1; AKwUvBxkB52Vjgr3hJhCeqinwvqBFA2Jx9s0QFG5jwfJZheOJNirRbVu3OYTbTouXq3wmWNfbZCC9RCaPp1QoxmXcpU=@vger.kernel.org
X-Gm-Message-State: AFuF++nQgup02L7wVPfbiyAU/zboq5Xxs8D+Pg4W57pDRm3y8AYk1a7c
	/ulTtw4c5bJexKtxGMv+5Gyx1pjUCaYkIbknGUVU1On49jeZSk2FNVUgVSEcSr6GVRfDkZS7BGe
	zHJZR/58FogU+PtXqteZE7IpRW+M/qh0=
X-Gm-Gg: AYBFou2/rpd1iO+A0z3tPf47g2grb3sypzWn1LNOowY7YSVu6SkXODdXyIzedHRkzdT
	OlHdnSZv4QuC2172gw2zwUl45llgHH26h8mGbYMDp7V0zU/TuEarvff8PfmXX/NIfJ9YouW+3fg
	geLjCiReexXv0z4SPnP3mEFje+NTdDmp9o+AFozT9qkIl83VRoVU6AZVCgAijxHeMPDH9LjFF/n
	g9uWZ4sTC9O8HeDaSNzR1DiAmN3XA/bGMwxvTvXs+JwpXOUj0YTjDQ9cxtAdEfD56lBGOC6t1Iq
	HdAHtRi6Psq5f3moWuW79VaKk6Go4ciLlt+KhJTEsk9iea5EknfTGXQ=
X-Received: by 2002:a05:6820:2226:b0:6ba:1878:2a6c with SMTP id
 006d021491bc7-6c540088554mr2619502eaf.4.1789426956040; Mon, 14 Sep 2026
 16:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914073356.791518-1-cui.tao@linux.dev> <20260914073356.791518-2-cui.tao@linux.dev>
In-Reply-To: <20260914073356.791518-2-cui.tao@linux.dev>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 14 Sep 2026 16:02:24 -0700
X-Gm-Features: AcwNN1VZkBQqQYfMVd7gQUm6WpRn7TeG3A6jO20_KXpKUTM9cv8b_LakI3YB1JE
Message-ID: <CAMB2axNkTS-UuH-KctiY+5qh-JZZkKsiyQr_KOnGJt1bPoL3eA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] blk-iocost: add BPF struct_ops cost model support
To: Tao Cui <cui.tao@linux.dev>
Cc: tj@kernel.org, josef@toxicopanda.com, axboe@kernel.dk, 
	cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, andrii@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, linux-kselftest@vger.kernel.org, 
	cuitao@kylinos.cn
Content-Type: text/plain; charset="UTF-8"

I mostly looked from a struct_ops perspective.

> +
> +static const struct bpf_func_proto *
> +bpf_iocost_get_func_proto(enum bpf_func_id func_id,
> +                         const struct bpf_prog *prog)
> +{
> +       switch (func_id) {
> +#ifdef CONFIG_CGROUPS
> +       case BPF_FUNC_cgrp_storage_get:
> +               return &bpf_cgrp_storage_get_proto;

This seems redundant. BPF_FUNC_cgrp_storage_get should already be part
of bpf_base_func_proto.

> +#endif
> +       default:
> +               return bpf_base_func_proto(func_id, prog);
> +       }
> +}
> +
> +static int bpf_iocost_check_member(const struct btf_type *t,
> +                                  const struct btf_member *member,
> +                                  const struct bpf_prog *prog)
> +{
> +       /* calc_cost() is called with RCU read lock held */
> +       if (prog->sleepable)
> +               return -EINVAL;
> +       return 0;
> +}
> +
> +static int bpf_iocost_init_member(const struct btf_type *t,
> +                                 const struct btf_member *member,
> +                                 void *kdata, const void *udata)
> +{
> +       struct iocost_model_ops *ops = kdata;
> +       const struct iocost_model_ops *uops = udata;
> +       u32 moff = __btf_member_bit_offset(t, member) / 8;
> +
> +       switch (moff) {
> +       case offsetof(struct iocost_model_ops, name):
> +               if (bpf_obj_name_cpy(ops->name, uops->name,
> +                                    sizeof(ops->name)) <= 0)
> +                       return -EINVAL;
> +               return 1;
> +       }
> +
> +       return 0;
> +}
> +
> +static u64 bpf_iocost_calc_cost_stub(u64 opf, u64 nbytes, u64 sector,
> +                                    struct blkcg *blkcg, u64 model_flags);
> +
> +/*
> + * kdata is seeded from the CFI stubs, so calc_cost is never NULL; a
> + * model which did not implement it inherits the stub, which prices
> + * every IO at 0.  Compare against the stub to reject it.
> + */
> +static int bpf_iocost_validate(void *kdata)
> +{
> +       struct iocost_model_ops *ops = kdata;
> +
> +       if (ops->calc_cost == bpf_iocost_calc_cost_stub)
> +               return -EINVAL;

This should check !ops->calc_cost. CFI stubs are used to construct
trampolines; they are not copied into kdata for callbacks omitted by
userspace. Also, should the reserved name "linear" be rejected here?

> +       return 0;
> +}
> +
> +static int bpf_iocost_reg(void *kdata, struct bpf_link *link)
> +{
> +       struct iocost_model_ops *ops = kdata;
> +       struct iocost_bpf_model *m;
> +       int ret = 0;
> +
> +       if (!bpf_struct_ops_get(ops))
> +               return -ENOENT;

struct_ops core should hold a map reference when calling .reg().
Calling bpf_struct_ops_get() in reg() and bpf_struct_ops_put() in
unreg() doesn't seem necessary.

> +
> +       m = kzalloc(sizeof(*m), GFP_KERNEL);
> +       if (!m) {
> +               bpf_struct_ops_put(ops);
> +               return -ENOMEM;
> +       }
> +       refcount_set(&m->refs, 1);
> +
> +       mutex_lock(&iocost_bpf_reg_lock);
> +       {
> +               struct iocost_bpf_model *other;
> +
> +               list_for_each_entry(other, &iocost_bpf_models, list) {
> +                       if (!strcmp(other->ops->name, ops->name)) {
> +                               ret = -EEXIST;
> +                               break;
> +                       }
> +               }
> +       }
> +       if (!ret) {
> +               m->ops = ops;
> +               list_add(&m->list, &iocost_bpf_models);
> +               list_add(&m->lifecycle, &iocost_bpf_lifecycle);

This seems to contradict what the changelog says: "blkcg
online/offline notifications follow the model binding, not the name
registry"

> +       }
> +       mutex_unlock(&iocost_bpf_reg_lock);
> +
> +       if (ret) {
> +               bpf_struct_ops_put(ops);
> +               kfree(m);
> +       }
> +       return ret;
> +}
> +
> +/*
> + * Unregistering drops the registration reference.  When the last
> + * reference is gone (no device bound), the node leaves the lifecycle
> + * list and is freed; otherwise bound devices keep it alive and it
> + * keeps receiving blkcg online/offline notifications.
> + */
> +static void bpf_iocost_unreg(void *kdata, struct bpf_link *link)
> +{
> +       struct iocost_model_ops *ops = kdata;
> +       struct iocost_bpf_model *m;
> +
> +       mutex_lock(&iocost_bpf_reg_lock);
> +       m = iocost_bpf_model_lookup(ops);
> +       if (m) {
> +               list_del(&m->list);
> +               if (refcount_dec_and_test(&m->refs)) {
> +                       list_del(&m->lifecycle);
> +                       kfree(m);
> +               }
> +       }
> +       mutex_unlock(&iocost_bpf_reg_lock);
> +
> +       bpf_struct_ops_put(ops);

Mentioned above. Doesn't seem to be necessary.

[...]

> +static const struct iocost_model_ops *
> +ioc_bpf_model_prepare(const char *name)
> +{
> +#ifdef CONFIG_BLK_CGROUP_IOCOST_BPF
> +       const struct iocost_model_ops *new = NULL;
> +       int ret;
> +
> +       if (!name[0])
> +               return NULL;
> +       ret = iocost_bpf_model_get(name, &new);

It looks more straightforward if iocost_bpf_model_get() just return
the ops ptr and ERR_PTR on error.

> +       return ret ? ERR_PTR(ret) : new;
> +#else
> +       return name[0] ? ERR_PTR(-ENOENT) : NULL;
> +#endif
> +}

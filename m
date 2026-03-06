Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D252877CB
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 00:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756123; cv=pass; b=FzbXgnXxC3etVttXn/nPykBAJphuKIfNocYeTtSu+yhO0c2ytZ8jEsbNxDtf28SZZYAY2xYCW+fXEN3uOZ+foKtP58cfYTLqRQWFeHWnZQ3IpaSd6P/yWm9p1YWrIwlWm2/eSUbPHapn6H9LRg95HA3bwOKIRF2i2OCRcOcZSkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756123; c=relaxed/simple;
	bh=FgiWZMdtwShVHnqKD3SYB4X6xZAczCl2quXIiR0wP9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2ErsuDEGKlMA/m9y3WnuMLXSWbOYP4ZSDVEl+aUWXm+vR2Ee3ZeVBumwIRVk+QWBIsiCOgX1QkcOGH3D/D3DIDTSWYvu7MlBr95a0pgr0/Qpoz28ibPgSfKlwItQPUaO2ZBiWuqAerB5mcN7jNvrhS9YFbrW0pryr5oU5rXKVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRJ7LDsF; arc=pass smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRJ7LDsF"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-439b611274bso3352363f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 16:15:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772756121; cv=none;
        d=google.com; s=arc-20240605;
        b=E4mhDfvBEFzD2Hzq91wvSDi8Emo/xbcrZ9iLiOO3doMVHz8lufLqVypHn5TP7U4l5I
         BX2Qc8L52T+HmcLx+UkzJn689TQllWQdj7tj4bi3ljNtb+E244H8kWsI7JHwlOkvVqBZ
         9pI/MKZV28k/KIJ34jsbZ1ft/jkEmnw2X16tdj9mLuyQx6WlgOZZhxm+71b4wUFhQ/3r
         qX5hFVR9EVxCoe5SadzcGoqqcYnIVniul67KNTU0UpbwcT2nIiE9x5IQ5+3AKrkaT5kn
         +/2He00dDccJmckmJFKmiesF9bcfCk9EflfLVDsZLv9Korop9JTlJGiCcI5DAXUmknMx
         tXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+jYZ0VJCdbCj+ca5cxk8pP3RkXjQYsLYUpygAtW+QI0=;
        fh=zSOqvTcJJ1mZTY3CC0FYqysdmCBubbdwB3x+jfCf1UE=;
        b=XhjgQ8tHwoUwSkUxomjsnWk5WxsUyYwEQT25u4ohtjGct6RbWUY1o0tVWUwjvQDOVr
         QbNq0iFbAk24DSIMLssxI9TLcvaGqPequ7KnUMccEecZj48ej9g48Y1O0GU7eezWQAXv
         mYkFszccLojyeHGVbB/3bspk3K1Xx0ZdiRALliyTlBAkvNNRnjdhdsGTxpt6dOf+vqws
         HJJkDCV+YLN+jgwuU+ljdvt9dCyxx+l1+q91LmM98GfOWWonjBNxHRU514/OBbVCcGvz
         B1Z/iebynekiOPrjEf2uqiNWfKE/XE7b3o7L0Y0TW4xz0ZP7RNOXPRAjoWTi5hEYDBod
         3wnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772756121; x=1773360921; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+jYZ0VJCdbCj+ca5cxk8pP3RkXjQYsLYUpygAtW+QI0=;
        b=nRJ7LDsFXC6A6m9PZJCEPRtusE8FI7oFSVp5kB/JICPJeyM16zrqaLRcRcKYDRhi37
         XvYc1uENPuBAsUm4by1TT6gsAlO9E7gqGGU6A04fZQgOrtoG5LskCpzuzx2uy83dk8Ok
         y4Ehb8VMi9zyaO/PxJNHOdpjPZEhkhtdx8NZom95qEhI3/YdZ01mD7aAWfOgqsqTvSrd
         pM+Y04qMl0C6fDl8pFzncyQpkroEBk9lBlRlzDlm0M6YaoDSH4gifAvelOF+n8ITKmHQ
         0Gnqc/SxvmK1AhwT1hqQmvZRKXz1LiZjfALT5Q1ee1hqHl05BqZPpGfX3oPckdkwfute
         HsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772756121; x=1773360921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jYZ0VJCdbCj+ca5cxk8pP3RkXjQYsLYUpygAtW+QI0=;
        b=cdkU3Dp0f6DYc9eMOS7Md4R6kG/Wlf6Qn/dB/18+EBahK9ZFmlfv2AKAd+FlKMYc4K
         /On1Q3wQWjvF5OIv9zqw49Ovn7TXxQhMxJMZkS4rYXtsvKTrQ0eFSTZ2eCCNKL5db1yE
         Iad+GO+WyTtdoJv5pveP2bN9GOmlCGdmTZaS0aI+dIdnCy7q2LoY3KW781ZiX/+C2B6o
         5CpRb4+zxYZ5drurA6uWaNptQXC068iUd03FZbH+yNbDRYUWfjWHfRYyPCGhRTYZ3Rwp
         ypcc/8Kmv52i9zGVq2HDdDlRil5Qa8GtErVWMu2H3qPZHm71PcMPg/QY/F2wBUBmJt1U
         eU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZlqlD8l3Syb67vxXoBU9YoPSma6zLANfiiKnnpCOPRN9IQF+GfjgaW98Wd3z+h3wpXyoap5mMfcOO2DY7I7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqlhIQio6W+KOYVDYoyy1P1RKU9DEAd9y7NgSYsdVIgJGekc5
	D9vw6Witr1h9ZB7xLKcRFoFYYPreQelYfL07QcklR+iX6BDvWrc+HNxTqCBmKJt8SU6A47wQ7Up
	+Znavy7HqXPWaPxCgUvubukHkEHSdFiI=
X-Gm-Gg: ATEYQzzfpjUen7FU5PAahUNTt8r8c0uzV1NU2T1HuvD7COOlqkOpiRkK/lmjTKD6Von
	ZAl7XWwwms2mbThuuO+fb0bSsu2gbdnt/yD7OQP6JGFmNQ5FXLWPiCIAMiAcx5kdfyWSwlTY7yN
	xdvus3iMZZn/buuy8ambPxFH/0Ci036LIfrBTmoHqcyBz3Vo/9eFdDg2F84vECGDsOZDqktWUca
	tklZAHPnq/Z3CxAsyt16cxi7eu1v/3Hpzwto9a8U0DrEFErGlQCJRCqHfj7Wlz/KP5Sd8u1cyPK
	yNlxv4QJMTdzrKRnu8MDUkX8mfSNYpszyuNW4jBr0PjCqM9wdM/oO6dEA8NJAZr3i6qHGQ==
X-Received: by 2002:a05:6000:400f:b0:439:be3d:e6d7 with SMTP id
 ffacd0b85a97d-439da89542bmr310661f8f.49.1772756120540; Thu, 05 Mar 2026
 16:15:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304143459.78059-1-pilgrimtao@gmail.com> <20260304143459.78059-2-pilgrimtao@gmail.com>
In-Reply-To: <20260304143459.78059-2-pilgrimtao@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 6 Mar 2026 01:14:44 +0100
X-Gm-Features: AaiRm50Th3E02W_Z0Fo703BJmpmkDRot0Ta26jBExNdWMNb-bf4B_RiNpHtvE4U
Message-ID: <CAP01T77B_Rae71cYgZ7b+xbYG+qaaUNscLe2c6gpkDj+o6B0ag@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] bpf: Introduce the bpf_list_del kfunc.
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 15:50, Chengkaitao <pilgrimtao@gmail.com> wrote:
>
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> If a user holds ownership of a node in the middle of a list, they
> can directly remove it from the list without strictly adhering to
> deletion rules from the head or tail.
>
> We have added an additional parameter bpf_list_head *head to
> bpf_list_del, as the verifier requires the head parameter to
> check whether the lock is being held.
>
> This is typically paired with bpf_refcount. After calling
> bpf_list_del, it is generally necessary to drop the reference to
> the list node twice to prevent reference count leaks.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  kernel/bpf/helpers.c  | 27 +++++++++++++++++++++++++++
>  kernel/bpf/verifier.c |  6 +++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index 6eb6c82ed2ee..cc1a096a1f64 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2459,6 +2459,32 @@ __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
>         return __bpf_list_del(head, true);
>  }
>
> +__bpf_kfunc struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
> +                                              struct bpf_list_node *node)
> +{
> +       struct bpf_list_node_kern *knode = (struct bpf_list_node_kern *)node;
> +       struct list_head *h = (void *)head;
> +
> +       /* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
> +        * called on its fields, so init here
> +        */
> +       if (unlikely(!h->next)) {
> +               INIT_LIST_HEAD(h);
> +               return NULL;
> +       }

nit: I would avoid doing this here, just for symmetry.
If we are part of the list after the owner checks, this should be
initialized correctly anyway.

> +
> +       if (unlikely(!knode))
> +               return NULL;

nit: It seems like node can't (shouldn't) be NULL, so we can lose this check.

> +
> +       if (WARN_ON_ONCE(READ_ONCE(knode->owner) != head))
> +               return NULL;
> +
> +       list_del_init(&knode->list_head);
> +       WRITE_ONCE(knode->owner, NULL);
> +
> +       return node;
> +}
> +
>  __bpf_kfunc struct bpf_list_node *bpf_list_front(struct bpf_list_head *head)
>  {
>         struct list_head *h = (struct list_head *)head;
> @@ -4545,6 +4571,7 @@ BTF_ID_FLAGS(func, bpf_list_push_front_impl)
>  BTF_ID_FLAGS(func, bpf_list_push_back_impl)
>  BTF_ID_FLAGS(func, bpf_list_pop_front, KF_ACQUIRE | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
> +BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 67c09b43a497..c9557d3fb8dd 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -12461,6 +12461,7 @@ enum special_kfunc_type {
>         KF_bpf_list_push_back_impl,
>         KF_bpf_list_pop_front,
>         KF_bpf_list_pop_back,
> +       KF_bpf_list_del,
>         KF_bpf_list_front,
>         KF_bpf_list_back,
>         KF_bpf_cast_to_kern_ctx,
> @@ -12521,6 +12522,7 @@ BTF_ID(func, bpf_list_push_front_impl)
>  BTF_ID(func, bpf_list_push_back_impl)
>  BTF_ID(func, bpf_list_pop_front)
>  BTF_ID(func, bpf_list_pop_back)
> +BTF_ID(func, bpf_list_del)
>  BTF_ID(func, bpf_list_front)
>  BTF_ID(func, bpf_list_back)
>  BTF_ID(func, bpf_cast_to_kern_ctx)
> @@ -12996,6 +12998,7 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
>                btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
>                btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
>                btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
> +              btf_id == special_kfunc_list[KF_bpf_list_del] ||
>                btf_id == special_kfunc_list[KF_bpf_list_front] ||
>                btf_id == special_kfunc_list[KF_bpf_list_back];
>  }
> @@ -13118,7 +13121,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
>         switch (node_field_type) {
>         case BPF_LIST_NODE:
>                 ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
> -                      kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl]);
> +                      kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> +                      kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
>                 break;
>         case BPF_RB_NODE:
>                 ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
> --
> 2.50.1 (Apple Git-155)
>
>

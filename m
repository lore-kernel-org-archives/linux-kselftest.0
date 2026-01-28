Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE93298987
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 02:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567268; cv=pass; b=BeYH6YECijuTesdG2vS8X1sW91LIyfhNQHlgR9cg+hhmVjah13+N9mF64XU82F77U3ZW6NLDiwumaiadNZAJRXLGoE+arIPC4To0wjivbAzu9vPvYH0PULBmol9grv7sqGE/A5nFzERICLXqWMoiG3uLvYhWolUMhueNkDT45tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567268; c=relaxed/simple;
	bh=kQKMO3NnDjf/7HVMh5zxEE6uTYJTGgTPj+DSv/vkZ70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJZI1fTx0RghjW+IJYRhAOCZimp4u139iqrL5zqf4bhh0Q1JUIer40BJXb6HrpWignWsWFDU5XiNoqCEmNQlfwfrpI7aCW4b5wM9uyZGJ2MeCAnaXIpRz5PqKQHXVQlvvNO8J5Lmz2Dgw6I47DvBbkzILw1ARgG/8Sw9fea+9HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iqf6N3zp; arc=pass smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqf6N3zp"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-435903c4040so3884585f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 18:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769567265; cv=none;
        d=google.com; s=arc-20240605;
        b=X4S0IZdYx5uIiKAe4dIhAMSkZjRK9p51WI5sYYQBpvvl2t01JhPH7XUjQcufu4HwBt
         5vXbTPtUOJdNr+dEoFFpehOi9XPBrsqgYlajdIW5hfjrlMgSEDw6eepNvwVv7UvjfuWm
         v9jepUpcq3NXNIARLSxE2MxtP5XtAdpCdY8m27RDUSQ/T2FatTYTDx2/PClN46loKJNi
         r2W8G03GFrKSSZT0orPq0rQs6FvEfo6nNEWgk1P8DCTFQrUYoxoEwkY5dFvrwDIBE/CS
         dhVz26uiW4tVVV4XiIop3BHeQhfGmj9utT/xEsAOHU1a4QOdKysLVnAvkICMw4eq6DJ4
         cFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gao4ipUlmOIwcq99MQVTnaBelmvpZVAv6HM5nyo0jY8=;
        fh=kp4iTK57Yp3aFgYPZ9BnS3yxB6oL0+wEOaOq00Ah1EM=;
        b=UW+V2MWN60sROguY4J+bsCigT1PFtXbR+gaiL3u4VLtJ7VV8IAa1ONqIseP9L2wW6G
         rbEIYSrj7xt+QRkTuawb+XlDHLlefiiijiTaVS4VBJ0s4P6dUQED6SNiOd7+XSeIyevH
         I69NoQMNPZfShoX08OXw06r+jxFmsXtJm758chWQXl9v9vPcmzfK67dXxrRnN/xDVNln
         Vnr47//OkGQkwP2rgyEwoANV1lMlF1GMZ4InZMWwxu6W87z4D/X0bKBYCWnU1viGyKuh
         2preazPuc2I8z121UbDDtT0hQr55/dP4SXt7cuE3MT2p9/LvxNiBa+fxLiE3/BTXX79a
         qltg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769567265; x=1770172065; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gao4ipUlmOIwcq99MQVTnaBelmvpZVAv6HM5nyo0jY8=;
        b=Iqf6N3zp8/WrKFCZScK0KvtjfzSmRpGAjSf+Pb7QzFaaGFyG+5WjHXunDygawvTqor
         oTd0RKmGYDaQPyQJbWPNegxVI95QmtnBCA7j5aABA7OcCthsdS4QfSZNIhSuK8s1zuq7
         bp8+xy2et11HnpLGxjQI+SB3cmvTRKg0+09jPpamCJbyqWLKCi6KgeVhyvZBsl0lD2Y5
         3SsbmK0quZGYoLxa2vyXcKstN3GaSkdCwc9m8ApcRvXOo6qy2xJiqIZoMQMWs+r+1RdI
         pwtKQxRxZK5Pyu3mJD4E3PB5V0n6MsMgVwjWHJeOPjrp1ua52sO5n7PphNFht4eiKTG2
         NqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769567265; x=1770172065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gao4ipUlmOIwcq99MQVTnaBelmvpZVAv6HM5nyo0jY8=;
        b=X1ECzyUN6DDJearYX1CcGivU5OJ5q+7DZhlolBbFVWL3krixNirkOisn2iQ1IOe0N8
         pbkGmD7BTo10pOgA+YA7E0lSsXh+8iV1y6BkI0TgYgFdYV/f2XnnSctFwUhoxm4W5nJO
         IJYYjYOpXPwVlDJMQtFxXP81qAeHUcE7+6vVdBgo249Jk6JbbMWHGi+riQUqG4FOMqKr
         GauA9aLcXUMDpBpXEcWcCHMwnrGzgyGJpcjYnG7BYfj8MuBn0R0j9UEeLCkWjMSApsxD
         sBMERECZWcu25hAhndWFyrpD5ZnbekpJGsaUDaA+NtGzi7Z7C98cl8wdLVq64Oa859Dq
         w/tw==
X-Forwarded-Encrypted: i=1; AJvYcCUemSeREQRVBflBr8AvMuG8j1XKkh2uxlF6qvXdtH9wciLlyXMCTDkbC3eCl8bVcsj5mIZKDcvdMeeBTN9OaS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVesxTqLmsaFGxpAFIiHCMUv2TfilWPEzD1j0Dc9dI77STwmwt
	9Co+YwMJjJH0oQWbiaPXx75t19Phb2W3ebUkic6d7Zx7il86be9XPwDoFCub8HxehGK8jW/V0kr
	uR3iBAjQIwhAxPAGRpm2ciBCh2XFwhiI=
X-Gm-Gg: AZuq6aKiyL2+ge0PIq04vvwRBUkZA1uJronVJu+T3kst+9nEzHfvlu0Oeg9tenG8W0q
	Inp94YdOLDqB2nPiXrfcWcJ+8lmCtMhd2BJInjG5g+53fnUzKDf56MXpKGByR9KcnZuk6Xq2t/B
	vM4UiAfa/U++fNj+waFmyNBW2piF6yd7STf1WGCinfsV5KIe3+ZrUAhL8KcA/c+NHoCLp6D3YiN
	dQZLhkTvhjS1qPo0c53IupkOVkOq7JG/XFHIult6Zmxnl+Xyate+N8jZcqge7By54/fbGsyuy9X
	T8LRfCq7hqZ4oWsfJjA48/V73Y2mnsMVzJsGbJw=
X-Received: by 2002:a05:6000:2c0f:b0:435:a52a:6351 with SMTP id
 ffacd0b85a97d-435dd06fdcamr5571699f8f.28.1769567265043; Tue, 27 Jan 2026
 18:27:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123055658.372869-1-leon.hwang@linux.dev> <20260123055658.372869-2-leon.hwang@linux.dev>
In-Reply-To: <20260123055658.372869-2-leon.hwang@linux.dev>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 28 Jan 2026 03:27:08 +0100
X-Gm-Features: AZwV_QikRELPKkiHav8bifJDmZ5LbpBRmz_K7m2jmSCN-B7jXjXSAiP6UeRts0I
Message-ID: <CAP01T77UY=FjNg9RDFQP8UYsS67gJBEsJjZBobu=Dh-fHG-+Yw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Disallow BPF_F_LOCK with mixed
 special fields and centralize flag checks
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jan 2026 at 06:58, Leon Hwang <leon.hwang@linux.dev> wrote:
>
> Disallow combining BPF_F_LOCK with map values that contain special BTF
> fields other than bpf_spin_lock (e.g. kptr or uptr). Such mixing may lead
> to subtle or undefined behavior in map value handling. Reject these
> combinations early by returning -EOPNOTSUPP.

The commit log is really suboptimal in giving context on why you're doing this.
You should summarize the discussion from [0], otherwise unless people
go dig that thread they'd have no clue.

Also, I would remove the 'undefined behavior' wording. It's just
semantically different, in that the update doesn't free fields,
but there's no undefined behavior.

  [0]: https://lore.kernel.org/bpf/CAADnVQLib8ebe8cmGRj98YZiArendX8u=dSKNUrUFz6NGq7LRg@mail.gmail.com

Please also increase test coverage for other maps in patch 2. Even if
covering all local storages is not practical, we can definitely do
task local storage.

>
> Centralize map update flag validation in bpf_map_check_op_flags() and
> reuse it across array, hash, local-storage, and task-storage map update
> paths. Explicitly reject incompatible BPF_NOEXIST/BPF_EXIST combinations
> and invalid BPF_F_LOCK usage to keep flag validation consistent and
> eliminate duplicated per-map checks.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/linux/bpf.h            |  7 +++++++
>  kernel/bpf/arraymap.c          | 11 ++++-------
>  kernel/bpf/bpf_local_storage.c |  7 -------
>  kernel/bpf/bpf_task_storage.c  |  3 ---
>  kernel/bpf/hashtab.c           |  8 +++-----
>  kernel/bpf/syscall.c           |  4 +++-
>  6 files changed, 17 insertions(+), 23 deletions(-)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 5936f8e2996f..c5863487ee73 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -3935,9 +3935,16 @@ static inline int bpf_map_check_op_flags(struct bpf_map *map, u64 flags, u64 all
>         if ((u32)flags & ~allowed_flags)
>                 return -EINVAL;
>
> +       /* BPF_NOEXIST and BPF_EXIST are mutually exclusive. */
> +       if ((flags & (BPF_NOEXIST | BPF_EXIST)) == (BPF_NOEXIST | BPF_EXIST))
> +               return -EINVAL;
> +
>         if ((flags & BPF_F_LOCK) && !btf_record_has_field(map->record, BPF_SPIN_LOCK))
>                 return -EINVAL;
>
> +       if ((flags & BPF_F_LOCK) && btf_record_has_field(map->record, ~BPF_SPIN_LOCK))
> +               return -EOPNOTSUPP;
> +
>         if (!(flags & BPF_F_CPU) && flags >> 32)
>                 return -EINVAL;
>
> diff --git a/kernel/bpf/arraymap.c b/kernel/bpf/arraymap.c
> index 67e9e811de3a..1cff40f109cd 100644
> --- a/kernel/bpf/arraymap.c
> +++ b/kernel/bpf/arraymap.c
> @@ -366,10 +366,7 @@ static long array_map_update_elem(struct bpf_map *map, void *key, void *value,
>         struct bpf_array *array = container_of(map, struct bpf_array, map);
>         u32 index = *(u32 *)key;
>         char *val;
> -
> -       if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST))
> -               /* unknown flags */
> -               return -EINVAL;
> +       int err;
>
>         if (unlikely(index >= array->map.max_entries))
>                 /* all elements were pre-allocated, cannot insert a new one */
> @@ -379,9 +376,9 @@ static long array_map_update_elem(struct bpf_map *map, void *key, void *value,
>                 /* all elements already exist */
>                 return -EEXIST;
>
> -       if (unlikely((map_flags & BPF_F_LOCK) &&
> -                    !btf_record_has_field(map->record, BPF_SPIN_LOCK)))
> -               return -EINVAL;
> +       err = bpf_map_check_op_flags(map, map_flags, BPF_EXIST | BPF_F_LOCK);
> +       if (unlikely(err))
> +               return err;
>
>         if (array->map.map_type == BPF_MAP_TYPE_PERCPU_ARRAY) {
>                 val = this_cpu_ptr(array->pptrs[index & array->index_mask]);
> diff --git a/kernel/bpf/bpf_local_storage.c b/kernel/bpf/bpf_local_storage.c
> index e2fe6c32822b..80b50091cbbf 100644
> --- a/kernel/bpf/bpf_local_storage.c
> +++ b/kernel/bpf/bpf_local_storage.c
> @@ -493,13 +493,6 @@ bpf_local_storage_update(void *owner, struct bpf_local_storage_map *smap,
>         unsigned long flags;
>         int err;
>
> -       /* BPF_EXIST and BPF_NOEXIST cannot be both set */
> -       if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST) ||
> -           /* BPF_F_LOCK can only be used in a value with spin_lock */
> -           unlikely((map_flags & BPF_F_LOCK) &&
> -                    !btf_record_has_field(smap->map.record, BPF_SPIN_LOCK)))
> -               return ERR_PTR(-EINVAL);
> -
>         if (gfp_flags == GFP_KERNEL && (map_flags & ~BPF_F_LOCK) != BPF_NOEXIST)
>                 return ERR_PTR(-EINVAL);
>
> diff --git a/kernel/bpf/bpf_task_storage.c b/kernel/bpf/bpf_task_storage.c
> index a1dc1bf0848a..21d84818e64e 100644
> --- a/kernel/bpf/bpf_task_storage.c
> +++ b/kernel/bpf/bpf_task_storage.c
> @@ -125,9 +125,6 @@ static long bpf_pid_task_storage_update_elem(struct bpf_map *map, void *key,
>         struct pid *pid;
>         int fd, err;
>
> -       if ((map_flags & BPF_F_LOCK) && btf_record_has_field(map->record, BPF_UPTR))
> -               return -EOPNOTSUPP;
> -
>         fd = *(int *)key;
>         pid = pidfd_get_pid(fd, &f_flags);
>         if (IS_ERR(pid))
> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> index 3b9d297a53be..2f6ed3e80308 100644
> --- a/kernel/bpf/hashtab.c
> +++ b/kernel/bpf/hashtab.c
> @@ -1093,9 +1093,9 @@ static long htab_map_update_elem(struct bpf_map *map, void *key, void *value,
>         u32 key_size, hash;
>         int ret;
>
> -       if (unlikely((map_flags & ~BPF_F_LOCK) > BPF_EXIST))
> -               /* unknown flags */
> -               return -EINVAL;
> +       ret = bpf_map_check_op_flags(map, map_flags, BPF_NOEXIST | BPF_EXIST | BPF_F_LOCK);
> +       if (unlikely(ret))
> +               return ret;
>
>         WARN_ON_ONCE(!bpf_rcu_lock_held());
>
> @@ -1107,8 +1107,6 @@ static long htab_map_update_elem(struct bpf_map *map, void *key, void *value,
>         head = &b->head;
>
>         if (unlikely(map_flags & BPF_F_LOCK)) {
> -               if (unlikely(!btf_record_has_field(map->record, BPF_SPIN_LOCK)))
> -                       return -EINVAL;
>                 /* find an element without taking the bucket lock */
>                 l_old = lookup_nulls_elem_raw(head, hash, key, key_size,
>                                               htab->n_buckets);
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 3c5c03d43f5f..49e424e5f492 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -1780,6 +1780,7 @@ static int map_update_elem(union bpf_attr *attr, bpfptr_t uattr)
>         bpfptr_t uvalue = make_bpfptr(attr->value, uattr.is_kernel);
>         struct bpf_map *map;
>         void *key, *value;
> +       u64 allowed_flags;
>         u32 value_size;
>         int err;
>
> @@ -1796,7 +1797,8 @@ static int map_update_elem(union bpf_attr *attr, bpfptr_t uattr)
>                 goto err_put;
>         }
>
> -       err = bpf_map_check_op_flags(map, attr->flags, ~0);
> +       allowed_flags = BPF_NOEXIST | BPF_EXIST | BPF_F_LOCK | BPF_F_CPU | BPF_F_ALL_CPUS;
> +       err = bpf_map_check_op_flags(map, attr->flags, allowed_flags);
>         if (err)
>                 goto err_put;
>
> --
> 2.52.0
>
>

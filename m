Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B2C45FFB6
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588105; cv=none; b=K9DkPeM1CG2zG8ALieZ7oVwHyWBzZqXC33Lco65j6hW10geFgHvM/xJmglNmZMNH+P0AIALnkMWaBaSP9DNN9ILUUX+K7K4rVDQloFibCF72tH+I/0qeGnjk1rbmBAF49UIN43ASHl4OOHG9NQJuZGdcxS6lQfUWGB1A/n32Suk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588105; c=relaxed/simple;
	bh=R7GI4VMbvu/twWiiCDvfgzLFCDIO+nNwNcCBjJMHIT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cBmGoK+PTBAfvloKbfqXLCumgbZQVlA0uDCcm/0JUaDiBFb45eUrCz0p5zKzmmuWgp22eufzXwp2h2761W00vp1oeAdLSHpINNkPFp/In3eWBSaMzwwM2c/G/Z2jPd9ytroETObFZW7riWty3hZfrF14RvZa3p2Z9MkM/Cqfj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdXExFqp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdXExFqp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482c58a8683so1422964f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 09:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787588102; x=1788192902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TIIL6cFp9EGhRh5AI53UlQfVdkS/qav3l3R7BStzUx0=;
        b=PdXExFqpNcgzS1PJ1Fsp003jAGQAd+9itD92Uw6Xz5olpqpY0i8dKsIcZAyqcOU6Mn
         qyeAdZNVAMEIH5ulWZoSmHMOi/mpxoLPOYTO9ZT/2TmNvIDZva1Ajg9KppTNS4yDsavB
         Gc/eSLsdBzUvRE1O27qCgSm+GLsh0TReNonhioC4gnldTxGRJnE96NIHKPXp7trcUCTi
         RfjHAf7l5cbg0g69cT+YPSuaMKOK2Ryb1K8qAG8FeKeU75KiwmD0UK7JKmkgqOP0SPIV
         SB0hjW/S7fXSlztHfQF2pkjHAujP7h5CuietHh/GdKGFx9N28FmSHh4af+T1KHBrUYTh
         Zk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787588102; x=1788192902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIIL6cFp9EGhRh5AI53UlQfVdkS/qav3l3R7BStzUx0=;
        b=S14O+8yHIm5fMxamj2qM+LN4vxzs+GnD/9zou9y6uibcUn6eisA2rHVbkvNjjXiU7V
         l8Nx4D5vL5Or/eb5MuxhE/BdNaxiPq+Zf9RC2dTX5u96LDHrvcmgyptTL4xKNCoFir4M
         QDT0iG0FDED9HNDC3WZMfA2BAbdJr6w+JGX2OW6N9thUSqByEWGRMIC0BitSNdXNHy9G
         iCrAnno+xzR49NU1pS48X76D8nBgYbyQSAVP6bcBEGwKcMXchReGNzW+dYi6p938ymYI
         ode+B0eDtzC7wOerQWBFH7Cn5eN42J7vFiMsaUoDR0jWQBrXMdTiwXxgCgYdq83Ljkjx
         /Tcw==
X-Forwarded-Encrypted: i=1; AHgh+Rq48arfwtAqA75lwlbTeC4v3Yw+aoP2Gm9VhpGCAt8A/VjYTm5crH6+giXDlY4a2wwp1Uht709EzODPKKX0MIw=@vger.kernel.org
X-Gm-Message-State: AFuF++lFEimZH69CwcdtR3ndZgsiLR+WFqcQkhAhyNCgnwik3cv/FAKw
	11X3aQH0HUM/jniilC6vNKjNqnNYaA5V4V9h6i68L0Sz02JPA4XzTI4r
X-Gm-Gg: AR+sD12DUxSxliuT6YrtLxD0Fcj3J5tSje6nOca0+Xxd6VLOUCGsqlV2xNtqjk0bXFq
	CEjQ0D3B4aNAi3lZacwbLxf1GOblZGC5H0KMVKDoW9W71SjhbTzdbGLqledB1KpbKXQh468RGDb
	okxx69CsxzkL+BCiSHMZhM38pKLdeXmK1sL+5NbnSekoq/UKsD3sI9jQvrqxj7fvs85o4FFAHPf
	ygGQWXvb5dL/3Tx1CJhj4+s5ZmshgiV7wAp9wt+PGBizXoOhxEbNKaRqMeqMKGTRbRUVYjkj0BV
	PUWSq40uao46hUbRt56xcP9jJWSmNmnysttrdpyH8YW91AZbViXlM41JitGWl8aRgISEmePbJKX
	eV+ma94xAJKIaerWMD/sDrN/LK6UnmX+8ue4dKj24FC0p5LnnTngL4N6hJli5Uir0/4081MYQ/u
	bH+fZWs8Vk1vBS0mrtFWGoI5/aPon1fjtWPeAS5aTa6/RspKdXbuvnUMVTjYAW/07ba5d43xqew
	zWFnCw9qObRoTZZNZNgy1/CmQ==
X-Received: by 2002:a05:6000:290c:b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-482c0b9488dmr35035906f8f.17.1787588101646;
        Mon, 24 Aug 2026 09:15:01 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:5c63:74d0:c7a3:a419? ([2620:10d:c092:500::4:7337])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69d7dsm8621351f8f.4.2026.08.24.09.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 09:15:00 -0700 (PDT)
Message-ID: <0560a24d-2cf9-4e5b-aa61-580af1e56de1@gmail.com>
Date: Mon, 24 Aug 2026 17:15:00 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] bpf: Cancel special fields in resizable hashtab on
 recycle
To: chenyuan_fl@163.com, bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>, Yuan Chen <chenyuan@kylinos.cn>
References: <DKM6K95EN9OF.3O9XNYWVLYHDE@gmail.com>
 <20260824143621.2098856-1-chenyuan_fl@163.com>
 <20260824143621.2098856-2-chenyuan_fl@163.com>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260824143621.2098856-2-chenyuan_fl@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/24/26 3:36 PM, chenyuan_fl@163.com wrote:
> From: Yuan Chen <chenyuan@kylinos.cn>
> 
> rhtab_delete_elem() and rhtab_map_update_existing() eagerly call
> bpf_obj_free_fields() when an element is deleted or its value is
> replaced. This runs kptr destructors in the caller's execution
> context, which is unsafe for BPF programs running in NMI context
> (e.g. perf_event programs attached to hardware PMU overflows):
> referenced kptr destructors may take locks or otherwise cannot run
> in NMI.
> 
> Commit a3a81d247651 ("bpf: Cancel special fields on map value
> recycle") switched the hash map and array recycle paths to
> bpf_obj_cancel_fields(), which only cancels NMI-safe fields (timer,
> workqueue, task_work), but it missed the resizable hashtab.
> rhtab_map_update_existing() even documents the intended "cancel"
> semantics while still calling bpf_obj_free_fields().
> 
> Fix the resizable hashtab the same way:
> 
>   * rhtab_delete_elem() and rhtab_map_update_existing() now cancel
>     only NMI-safe fields. Referenced kptrs stay attached to the
>     recycled element and are destroyed by rhtab_mem_dtor() once the
>     element is eventually freed, keeping the reference accounting
>     balanced.
> 
>   * rhtab_map_update_elem() initializes the special fields of a
>     freshly allocated element. The bpf memory allocator may return a
>     recycled element that still owns a referenced kptr, and
>     check_and_init_map_value() would zero that slot, dropping the
>     reference without releasing it. rhtab_init_map_value()
>     initializes the remaining fields (spin lock, timer, workqueue,
>     task_work, refcount) but leaves kptr slots untouched, matching
>     the hash map semantics.
> 
> Verified with a selftest: a perf_event (NMI) program overwrites a
> rhtab element that holds a referenced task kptr, and a second phase
> deletes and re-inserts the element to exercise the recycle path.
> Before the patch the NMI update eagerly released the kptr and the
> recycle path zeroed the inherited slot; after the patch the kptr is
> inherited on both paths and the probe observes it non-NULL.
> 
> Fixes: a3a81d247651 ("bpf: Cancel special fields on map value recycle")
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
> ---
>  kernel/bpf/hashtab.c | 70 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 60 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> index d40cb5dd446c..0df8db27cd8c 100644
> --- a/kernel/bpf/hashtab.c
> +++ b/kernel/bpf/hashtab.c
> @@ -2864,14 +2864,56 @@ static int rhtab_map_alloc_check(union bpf_attr *attr)
>  	return htab_map_alloc_check(attr);
>  }
>  
> -static void rhtab_check_and_free_fields(struct bpf_rhtab *rhtab,
> -					struct rhtab_elem *elem)
> +static void rhtab_cancel_fields(struct bpf_rhtab *rhtab,
> +				struct rhtab_elem *elem)
>  {
>  	if (IS_ERR_OR_NULL(rhtab->map.record))
>  		return;
>  
> -	bpf_obj_free_fields(rhtab->map.record,
> -			    rhtab_elem_value(elem, rhtab->map.key_size));
> +	/*
> +	 * Only cancel NMI-safe fields (timer, workqueue, task_work) here.
> +	 * RHASH values can also carry referenced kptrs (and per-cpu kptrs),
> +	 * whose destructors must not run from arbitrary BPF execution
> +	 * contexts (e.g. NMI); leave them attached to the recycled element
> +	 * and let rhtab_mem_dtor() destroy them once the element is
> +	 * eventually freed. This matches the hash map semantics introduced
> +	 * by a3a81d247651 ("bpf: Cancel special fields on map value
> +	 * recycle").
> +	 */
> +	bpf_map_free_internal_structs(&rhtab->map,
> +				      rhtab_elem_value(elem, rhtab->map.key_size));
> +}
> +
> +/*
> + * Initialize special fields of a freshly allocated rhtab element, but keep
> + * kptr fields untouched. A recycled element may carry a referenced kptr from
> + * its previous life: the delete path only cancels NMI-safe fields (matching
> + * the hash map semantics), so the kptr reference stays owned by the element
> + * until rhtab_mem_dtor() destroys it. Zeroing it here (as
> + * check_and_init_map_value() would) would drop the reference without
> + * releasing it.
> + */
> +static void rhtab_init_map_value(struct bpf_map *map, void *value)

Could you please double check if this is needed at all?
I think bpf_map_free_internal_structs() going to reset
special fields to 0, so immediate reuse by __bpf_async_init(),
bpf_task_work_schedule() correctly identifies fresh fields.

> +{
> +	struct btf_record *rec = map->record;
> +	int i;
> +
> +	if (IS_ERR_OR_NULL(rec))
> +		return;
> +
> +	for (i = 0; i < rec->cnt; i++) {
> +		struct btf_field *field = &rec->fields[i];
> +		void *field_ptr = value + field->offset;
> +
> +		switch (field->type) {
> +		case BPF_KPTR_UNREF:
> +		case BPF_KPTR_REF:
> +		case BPF_KPTR_PERCPU:
> +			continue;
> +		default:
> +			bpf_obj_init_field(field, field_ptr);
> +		}
> +	}
>  }
>  
>  static void rhtab_mem_dtor(void *obj, void *ctx)
> @@ -2963,8 +3005,8 @@ static int rhtab_delete_elem(struct bpf_rhtab *rhtab, struct rhtab_elem *elem, v
>  		rhtab_read_elem_value(&rhtab->map, copy, elem, flags);
>  		check_and_init_map_value(&rhtab->map, copy);
>  	}
> -	/* Release internal structs: kptr, bpf_timer, task_work, wq */
> -	rhtab_check_and_free_fields(rhtab, elem);
> +	/* Cancel NMI-safe fields; full destruction happens in rhtab_mem_dtor */
> +	rhtab_cancel_fields(rhtab, elem);

Let's directly call bpf_obj_cancel_fields() here and below, 
so it is consistent with htab.

>  	bpf_mem_cache_free_rcu(&rhtab->ma, elem);
>  	return 0;
>  }
> @@ -3022,10 +3064,11 @@ static long rhtab_map_update_existing(struct bpf_map *map, struct rhtab_elem *el
>  	 * BPF_F_LOCK, matching arraymap semantics.
>  	 *
>  	 * copy_map_value() skips special-field offsets, so old timers/
> -	 * kptrs/etc. still sit in the slot. Cancel them after the copy
> -	 * to match arraymap's update semantics.
> +	 * kptrs/etc. still sit in the slot. Cancel the NMI-safe ones after
> +	 * the copy to match arraymap's update semantics; referenced kptrs
> +	 * stay attached and are destroyed by rhtab_mem_dtor().
>  	 */
> -	rhtab_check_and_free_fields(rhtab, elem);
> +	rhtab_cancel_fields(rhtab, elem);
>  	return 0;
>  }
>  
> @@ -3066,7 +3109,14 @@ static long rhtab_map_update_elem(struct bpf_map *map, void *key, void *value, u
>  
>  	memcpy(elem->data, key, map->key_size);
>  	copy_map_value(map, rhtab_elem_value(elem, map->key_size), value);
> -	check_and_init_map_value(map, rhtab_elem_value(elem, map->key_size));
> +	/*
> +	 * Initialize special fields of the (possibly recycled) element, but
> +	 * leave kptr slots alone: a recycled element may still own a
> +	 * referenced kptr that rhtab_mem_dtor() will release, so zeroing it
> +	 * here would leak the reference. Fresh memory from the bpf mem
> +	 * allocator is zeroed, so skipping the kptr init is safe there too.
> +	 */
> +	rhtab_init_map_value(map, rhtab_elem_value(elem, map->key_size));
>  
>  	/* Prevent deadlock for NMI programs attempting to take bucket lock */
>  	bpf_disable_instrumentation();


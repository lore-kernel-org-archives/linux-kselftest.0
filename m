Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420DE34DB52
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639431; cv=none; b=uBxa7Roh86CyeADPWoYUhybGDaUs01AWiCJVHse984SsX99AW1G5Ox8J3yfYso28bbhs7a2RaZb0JFbOiQmfT7HwBcEQB5p36TLPNLM1EtyJvZB03ePWxo5wB5zLaEqdhRKmYeoSWlHxwNrdHKi0O3+h2bnjxq17Gjco8Gy5xqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639431; c=relaxed/simple;
	bh=w6LqXOQUcB1wsH+GmlLg2ewkK/aAuJHDY9tvSj/ttcY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TbpNhDjBD73lJa42F8ryFrbVgIi00grsLE/28kItbXLCbN0QJU9JUl5vKuDDLLvwrmyC4FGYh37RQyT8u826M5wIFVt1G/GHUXiu/1CsFeMSGY9PDKREvMX8Ip8BaRluqBYoX6al2+ZKzfJmqqi0Sbv2h8JIsupF1j1aVzx4VpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFhtM+2F; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFhtM+2F"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b93698bb57aso532341166b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772639428; x=1773244228; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ok/YTE+I3sK+ILjnFMurIUPcQGqFnacHImE0I6telA=;
        b=SFhtM+2FRGueSxeHmFUNQB+SEjVuMhJq9nZkFCziikE8BKOgr68pNn4/ByoDblBm9i
         AabcvnzHhbN/zvbbqGdWWbBjmR13f2XJkcAA4Xp9WcZ+Q8lW/9gjsUvHjHTKDY30OLkn
         LgPEZJuSGemyN6LW0OiFyDsPJyYRADQ5vCL64NjNwhhs9tjrvLzAVWaPweAQNxXspyi+
         nhCCbXPWjCgSvyO5wOml7xcGkciwmCjKr5A9Vm/hk2YVwHUDuoTfRW6L2CzSdJRvrtRS
         MqN01XcHZEui6Lz7/M8Btw49hwCRrsabNZblQFmK45l9CGN4jIpmPv6LZCJTkBpex22Y
         ofDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772639428; x=1773244228;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ok/YTE+I3sK+ILjnFMurIUPcQGqFnacHImE0I6telA=;
        b=BgCTrWoo9EX/9La9JcSGu7VGvCixPW4lhqHoKxVaYa2x/Vk69A1zOc4pAQousVRPkp
         h7nMDEU9DStpU/ruC6gch4wxKgdmWy3jRf/Meid/xFDRq5rytuyOnX2fcPVu38up8KEV
         nnKPQppeEwSXKjgmToOjM+XF8EUCVcVDGheftYJM1R8aUc1DHnnmy0VZ8EvcYpH0Fe3f
         ph7Djpze/a8vI0/xPl8bYDlsnEztPd08p/6KpocFueHC9BEd6JzkXnnnIOz8oQc3xw+/
         MsLJrCXZJNejgmByH5DG+NslIChbdXRWw6bCX1MMk7nEAOSrH2z+xbJQ6PnmVyvRCCnd
         ZF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE6VERrZqO7kHaZMn9VqXxgd5rowvCItxoBOqSbjZBX6X4N7Ueqfim5SVdpKHDUVV7NL12W+9ZyBr0mrOqzRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZQip/7BhDP/iP3+QmweLJoMkVuACPrIeAAm/JJXXfmyhWlL1m
	/RfoxZw6DKmHpOC4zjKqpIK3FWwF2BMBt3IIbzG85SQ+pm5mGpC4XiOZ
X-Gm-Gg: ATEYQzzuYLWRakXObZYmKKjMQxN3ph8nxYeK8CrlzXyoMse77Q7//+8GC9215pBKw/O
	VhQjgCKXtF0gV2thaH9uiU1EpOygp0ra4LCOLo3KQnbGY9r/iicMpVCjKJJC+bO7G4G228DV5XX
	xenTU27PfYB58JoAAPtFg8o2hSlhtyUno7CxFloiU5I/JiWwJGMf54hJVuLyzoOR2hs8z9Lhugt
	fReZok50Mi0dq6e8xpotxMT9qgvQNkNuC0CQ/8bl0R3fnlJ2X0Hr8K4qsYtBTpNm1unyRkMXFwP
	8qa92jvk/OL6xAbnAahRR4CZGhJlqlju/BjZmxUfRORCJIAK1W63vt6EM3TRJOcX/PY9WOiZqIa
	h16ydWUe8iD+nTuUsGa08/zmvBSMlKrZ5qRxFIv+Wk3tjpB05/jafh7vk0H1T4MgLJ20rMAsyOi
	vm0QkoBlcdARIBYHWAnqRu5/u6xDlaCsq6KEXqqQ==
X-Received: by 2002:a17:907:1c1f:b0:b90:bd3f:7c0d with SMTP id a640c23a62f3a-b93d4453848mr366157866b.27.1772639427435;
        Wed, 04 Mar 2026 07:50:27 -0800 (PST)
Received: from localhost ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66005566561sm4351946a12.30.2026.03.04.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 07:50:26 -0800 (PST)
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
To: Chengkaitao <pilgrimtao@gmail.com>, martin.lau@linux.dev,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] bpf: Introduce the bpf_list_del kfunc.
In-Reply-To: <20260304031606.43884-2-pilgrimtao@gmail.com>
References: <20260304031606.43884-1-pilgrimtao@gmail.com>
 <20260304031606.43884-2-pilgrimtao@gmail.com>
Date: Wed, 04 Mar 2026 15:50:26 +0000
Message-ID: <87wlzry4ot.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Chengkaitao <pilgrimtao@gmail.com> writes:

> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> If a user holds ownership of a node in the middle of a list, they
> can directly remove it from the list without strictly adhering to
> deletion rules from the head or tail.
>
> This is typically paired with bpf_refcount. After calling
> bpf_list_del, it is generally necessary to drop the reference to
> the list node twice to prevent reference count leaks.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  kernel/bpf/helpers.c  | 19 +++++++++++++++++++
>  kernel/bpf/verifier.c |  6 +++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index 6eb6c82ed2ee..19d88da8e694 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2459,6 +2459,24 @@ __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
>  	return __bpf_list_del(head, true);
>  }
>  
> +__bpf_kfunc struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
> +					       struct bpf_list_node *node)
> +{
> +	struct bpf_list_node_kern *knode = (struct bpf_list_node_kern *)node;
> +	struct list_head *h = (void *)head;
> +
> +	if (unlikely(!knode))
Can you pass knode==NULL to this kfunc?
> +		return NULL;
> +
> +	if (WARN_ON_ONCE(READ_ONCE(knode->owner) != h))
it looks like you can just do READ_ONCE(knode->owner) != head. owner is
void*, what's the point of defining struct list_head *h?
> +		return NULL;
> +
> +	list_del_init(&knode->list_head);
> +	WRITE_ONCE(knode->owner, NULL);
> +
> +	return node;
> +}
> +
>  __bpf_kfunc struct bpf_list_node *bpf_list_front(struct bpf_list_head *head)
>  {
>  	struct list_head *h = (struct list_head *)head;
> @@ -4545,6 +4563,7 @@ BTF_ID_FLAGS(func, bpf_list_push_front_impl)
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
>  	KF_bpf_list_push_back_impl,
>  	KF_bpf_list_pop_front,
>  	KF_bpf_list_pop_back,
> +	KF_bpf_list_del,
>  	KF_bpf_list_front,
>  	KF_bpf_list_back,
>  	KF_bpf_cast_to_kern_ctx,
> @@ -12521,6 +12522,7 @@ BTF_ID(func, bpf_list_push_front_impl)
>  BTF_ID(func, bpf_list_push_back_impl)
>  BTF_ID(func, bpf_list_pop_front)
>  BTF_ID(func, bpf_list_pop_back)
> +BTF_ID(func, bpf_list_del)
>  BTF_ID(func, bpf_list_front)
>  BTF_ID(func, bpf_list_back)
>  BTF_ID(func, bpf_cast_to_kern_ctx)
> @@ -12996,6 +12998,7 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
>  	       btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
>  	       btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
>  	       btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
> +	       btf_id == special_kfunc_list[KF_bpf_list_del] ||
>  	       btf_id == special_kfunc_list[KF_bpf_list_front] ||
>  	       btf_id == special_kfunc_list[KF_bpf_list_back];
>  }
> @@ -13118,7 +13121,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
>  	switch (node_field_type) {
>  	case BPF_LIST_NODE:
>  		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
> -		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl]);
> +		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> +		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
>  		break;
>  	case BPF_RB_NODE:
>  		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
> -- 
> 2.50.1 (Apple Git-155)

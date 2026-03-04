Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2113635B63B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639999; cv=none; b=kWDWvOti540Jcrm0pLDPdKBE+foAkqI0j2UIbhuCcDUgQetGkAF21jPgOEw7h2JoDTuJOadxW+Elxs9LJyQvqmjqfu48daHVz81W24H5VYGc5/ikGq7fSdIDNIa3QTuPzzgSnLyekBpibYZEdeHcZdi1ib/Hy7Xy15Yr9YbiJuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639999; c=relaxed/simple;
	bh=DR72l5rfmF9woJgiiQ+SUs1tFCC5L4Em4zqGl0Tn244=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qs9Z4pTo8DyZiijDbkELIMFS3ZkG+jgCprO1oFhQokVcrZmFQ/94l4u2MEruR16FvC3oSbnn8slINV1F486oFQwfTHLNspUvxOR8PmZnA65hCc2MLpCCHUlNMAS++KVT5rthcsqeia9BbYR14EZEtPdt9eeVrchVPRAOPP8v+5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9JBwHVl; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9JBwHVl"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-824adc96ad2so6789564b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 07:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772639996; x=1773244796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lkeTvPf0E8KU750qZQOM/g+J3nMAURhvhN+ETGDpHsM=;
        b=Y9JBwHVlonc4R/ur4Tv8GErnNM95ue3EbkXwkbjDEtRfO39TlGxRB7xeJMGoBjCYuK
         PsHqhht6FMzOEuxsY6ilPBCbWySDWQmhGcy8nloopD0r/50J74MaEYJkjFfcNBBELgK8
         216FYfUcAxM+Lg5SMSroArDf0+W1Qn84sZkkCYvGJu5z9/UO/bOL16/jYGWhKxdrGueP
         dYHthiJPgFuxr6xe7GZ28wo5bJVHvuIOS+n0ITPxlT2ePHIUx8qe1QSO7HCVzEYDnp+U
         i5h+5cMvn9XHPobayo9K32gny9m2YOX1jLbSGY0gOa6mrPzNl3c8J3Kz5qemvKVwLBn2
         492w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772639996; x=1773244796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkeTvPf0E8KU750qZQOM/g+J3nMAURhvhN+ETGDpHsM=;
        b=adkghxsFuLKiqfoS6Q3+tCn+UTjbF6AQeHtkECyw7NKptHTVtyRnUJRbbNi7fCRdAe
         WoNwGhHl2FXZnWGnymeSGMGcTQFMGPVRPFCDo6kpjHUSDVCV87MrjB1PkmRi5Xr5nyiP
         XEdv6af5VKUGVPpQp64ALdUQLJIw9r4VJKDnog2UkcsNU6xriZARXZJGV4h2TyQBIv05
         AOEpXaaxSwAROPGu3i4oD89JDEuZQXQrZMwjnRS0YyRJkK1izZdmc+fDHJmk1wLgTJqx
         2CZJSzVtOsuzQvqFJuHiPG5wVgjR57PO7i/p9BeOxXdrbRrQJrdAjjRp8VssjX7lRBd9
         WEHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNPopERWQbWY8BTs0p/H26raM/YQC+XHBgmX15oeVFXkVm9SSWHOlFF1B34Z8hKhSNQfXFHQQt5USMODraqHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXkv+mYJZOp3zSBmR6a2SZPtnvlC2cfStRsRE2uTfijNMfQrE0
	PqP4vXlGTuz7zS1kh/ehC00JyOcHNVd//+zZCfV6sCPWPNAXB13CTvC8
X-Gm-Gg: ATEYQzwUFqJo3aZwMJbGOiJpksRw2Z1LLBt0+LuaUQPQqkzfvW6Rgu3SHHrmY91BqRh
	aRZYvweX2gaV0hl61JL5tbO+UQ6w9QU6MbdhXooMt1eYhKk835WxO35nUxVVMcFJ3NNWi4PqhcE
	TTkspZ9DCvxjr3Uzyl9AujP7PbCFtT6mS+KtoMgPnPN8Ble9OuUUCFRHW5Anf6S1oyNO0woG0rB
	GF2Bc76Ny6TbeXSuEnB8UYvrabaFEBYVoTi8tR2Un1TNzNxMkTIELsmP8Avw9KllbDMUVc5MBTT
	mlPNCcW2VUC4MERn6m0ABtSRm9zEEuBxWfTnp1rkJbPdQn8gAgYwbjJaVq7upPsKgRLElX4Niqh
	nuDhkYwHBB9iA8L2ta8UobIPFDtcfJ9Msw8NotN7LM95xtov9IXagYZY4T4n26rDB2TGFJMaOrd
	H5PT8nIoNHO1v22fDO3t/cE7I5ftOMIs0QQZqo
X-Received: by 2002:a05:6a21:7a96:b0:38b:e3c1:db44 with SMTP id adf61e73a8af0-3982e23b3e7mr2314723637.58.1772639996403;
        Wed, 04 Mar 2026 07:59:56 -0800 (PST)
Received: from [172.20.10.5] ([117.20.154.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73818d9502sm1352139a12.21.2026.03.04.07.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 07:59:55 -0800 (PST)
Message-ID: <927c59b1-acae-4013-b552-2d03cc77562b@gmail.com>
Date: Wed, 4 Mar 2026 23:59:48 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] bpf/verifier: refactor kfunc checks to
 table-driven approach
To: Chengkaitao <pilgrimtao@gmail.com>, martin.lau@linux.dev, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260304143459.78059-1-pilgrimtao@gmail.com>
 <20260304143459.78059-6-pilgrimtao@gmail.com>
Content-Language: en-US
From: Leon Hwang <hffilwlqm@gmail.com>
In-Reply-To: <20260304143459.78059-6-pilgrimtao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

NIT on the subject prefix: instead of bpf/verifier, it should be one of
bpf, libbpf, selftests/bpf, bpftool, and "bpf, x86/arm64".

So, the subject can be "bpf: refactor kfunc checks using table-driven
approach in verifier".

Thanks,
Leon

On 2026/3/4 22:34, Chengkaitao wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> Replace per-kfunc btf_id chains in list/rbtree/res_lock and graph node
> checks with btf_id_in_kfunc_table() and static kfunc tables for easier
> maintenance.
> 
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  kernel/bpf/verifier.c | 93 +++++++++++++++++++++++++++++--------------
>  1 file changed, 64 insertions(+), 29 deletions(-)
> 
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index d133d18aa0cc..25961cf83a67 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -12600,6 +12600,60 @@ BTF_ID(func, bpf_session_is_return)
>  BTF_ID(func, bpf_stream_vprintk)
>  BTF_ID(func, bpf_stream_print_stack)
>  
> +static const enum special_kfunc_type bpf_list_api_kfuncs[] = {
> +	KF_bpf_list_push_front_impl,
> +	KF_bpf_list_push_back_impl,
> +	KF_bpf_list_pop_front,
> +	KF_bpf_list_pop_back,
> +	KF_bpf_list_del,
> +	KF_bpf_list_front,
> +	KF_bpf_list_back,
> +	KF_bpf_list_add_impl,
> +	KF_bpf_list_node_is_edge,
> +	KF_bpf_list_empty,
> +};
> +
> +/* Kfuncs that take a list node argument (bpf_list_node *). */
> +static const enum special_kfunc_type bpf_list_node_api_kfuncs[] = {
> +	KF_bpf_list_push_front_impl,
> +	KF_bpf_list_push_back_impl,
> +	KF_bpf_list_del,
> +	KF_bpf_list_add_impl,
> +	KF_bpf_list_node_is_edge,
> +};
> +
> +/* Kfuncs that take an rbtree node argument (bpf_rb_node *). */
> +static const enum special_kfunc_type bpf_rbtree_node_api_kfuncs[] = {
> +	KF_bpf_rbtree_remove,
> +	KF_bpf_rbtree_add_impl,
> +	KF_bpf_rbtree_left,
> +	KF_bpf_rbtree_right,
> +};
> +
> +static const enum special_kfunc_type bpf_rbtree_api_kfuncs[] = {
> +	KF_bpf_rbtree_add_impl,
> +	KF_bpf_rbtree_remove,
> +	KF_bpf_rbtree_first,
> +	KF_bpf_rbtree_root,
> +	KF_bpf_rbtree_left,
> +	KF_bpf_rbtree_right,
> +};
> +
> +static const enum special_kfunc_type bpf_res_spin_lock_kfuncs[] = {
> +	KF_bpf_res_spin_lock,
> +	KF_bpf_res_spin_unlock,
> +	KF_bpf_res_spin_lock_irqsave,
> +	KF_bpf_res_spin_unlock_irqrestore,
> +};
> +
> +static bool btf_id_in_kfunc_table(u32 btf_id, const enum special_kfunc_type *kfuncs, int n)
> +{
> +	for (int i = 0; i < n; i++)
> +		if (btf_id == special_kfunc_list[kfuncs[i]])
> +			return true;
> +	return false;
> +}
> +
>  static bool is_task_work_add_kfunc(u32 func_id)
>  {
>  	return func_id == special_kfunc_list[KF_bpf_task_work_schedule_signal] ||
> @@ -13000,26 +13054,14 @@ static int check_reg_allocation_locked(struct bpf_verifier_env *env, struct bpf_
>  
>  static bool is_bpf_list_api_kfunc(u32 btf_id)
>  {
> -	return btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
> -	       btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> -	       btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
> -	       btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
> -	       btf_id == special_kfunc_list[KF_bpf_list_del] ||
> -	       btf_id == special_kfunc_list[KF_bpf_list_front] ||
> -	       btf_id == special_kfunc_list[KF_bpf_list_back] ||
> -	       btf_id == special_kfunc_list[KF_bpf_list_add_impl] ||
> -	       btf_id == special_kfunc_list[KF_bpf_list_node_is_edge] ||
> -	       btf_id == special_kfunc_list[KF_bpf_list_empty];
> +	return btf_id_in_kfunc_table(btf_id, bpf_list_api_kfuncs,
> +				     ARRAY_SIZE(bpf_list_api_kfuncs));
>  }
>  
>  static bool is_bpf_rbtree_api_kfunc(u32 btf_id)
>  {
> -	return btf_id == special_kfunc_list[KF_bpf_rbtree_add_impl] ||
> -	       btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
> -	       btf_id == special_kfunc_list[KF_bpf_rbtree_first] ||
> -	       btf_id == special_kfunc_list[KF_bpf_rbtree_root] ||
> -	       btf_id == special_kfunc_list[KF_bpf_rbtree_left] ||
> -	       btf_id == special_kfunc_list[KF_bpf_rbtree_right];
> +	return btf_id_in_kfunc_table(btf_id, bpf_rbtree_api_kfuncs,
> +				     ARRAY_SIZE(bpf_rbtree_api_kfuncs));
>  }
>  
>  static bool is_bpf_iter_num_api_kfunc(u32 btf_id)
> @@ -13037,10 +13079,8 @@ static bool is_bpf_graph_api_kfunc(u32 btf_id)
>  
>  static bool is_bpf_res_spin_lock_kfunc(u32 btf_id)
>  {
> -	return btf_id == special_kfunc_list[KF_bpf_res_spin_lock] ||
> -	       btf_id == special_kfunc_list[KF_bpf_res_spin_unlock] ||
> -	       btf_id == special_kfunc_list[KF_bpf_res_spin_lock_irqsave] ||
> -	       btf_id == special_kfunc_list[KF_bpf_res_spin_unlock_irqrestore];
> +	return btf_id_in_kfunc_table(btf_id, bpf_res_spin_lock_kfuncs,
> +				    ARRAY_SIZE(bpf_res_spin_lock_kfuncs));
>  }
>  
>  static bool is_bpf_arena_kfunc(u32 btf_id)
> @@ -13129,17 +13169,12 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
>  
>  	switch (node_field_type) {
>  	case BPF_LIST_NODE:
> -		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
> -		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> -		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_del] ||
> -		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_add_impl] ||
> -		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_node_is_edge]);
> +		ret = btf_id_in_kfunc_table(kfunc_btf_id, bpf_list_node_api_kfuncs,
> +					    ARRAY_SIZE(bpf_list_node_api_kfuncs));
>  		break;
>  	case BPF_RB_NODE:
> -		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
> -		       kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_add_impl] ||
> -		       kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_left] ||
> -		       kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_right]);
> +		ret = btf_id_in_kfunc_table(kfunc_btf_id, bpf_rbtree_node_api_kfuncs,
> +					    ARRAY_SIZE(bpf_rbtree_node_api_kfuncs));
>  		break;
>  	default:
>  		verbose(env, "verifier internal error: unexpected graph node argument type %s\n",


Received: from mail-wr2-f2.google.com (mail-wr2-f2.google.com [74.125.225.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB56397E8E
	for <linux-kselftest@vger.kernel.org>; Sun,  2 Aug 2026 23:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713565; cv=none; b=FVPuoAzYhFA8zl3loh7+QIklrFb4td3gZpyNQ3kaBqVHGdgIgh69P4Lb3M9NNnCuBP5JJ3BPW3EfRiu5CFH+mmsbRPXUrZRlNzlHrow97GjZkrpo8ZkcIzDI9cQmsFtYGcMEuStsYsKOIN54VBk3sG9a7Wm4GaDDvOT2dfEJjvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713565; c=relaxed/simple;
	bh=dFJcQMAil6Rc6y/t5g1S2gR4M4zDnqkrhPL4MIUApg0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fx2uEdRSQl86O8MRwq32uyS+NDHNSRBehVINRJc45Zux15BxtlZEn0Vi/svFRKMzVvJYWtQHMZi4l6MB0gwBarxkPMwkhjF4T8O+MzPNmOGn/ccs6a/6Dj1YKnFvnTEdnPnWRRwh6xkNCiuwTVvL3R77j3MeYeUdKqNrjlgd8gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ax8bQ1xY; arc=none smtp.client-ip=74.125.225.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ax8bQ1xY"
Received: by mail-wr2-f2.google.com with SMTP id ffacd0b85a97d-470713a9053so806180f8f.0
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 16:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785713547; x=1786318347; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wuve+ygXJV5dqDNQOvrNoXCyKoiwGqRf0o6QCP7Pj5E=;
        b=ax8bQ1xYBhjLsBwDYruD3cX8/vFLfnNykwubARwGVFU4GpRQGTdojcel/RfnAtW8zb
         kyvl32Qv+z3rHwAfClKIOOlreKdWEAgu+pq2jhIP3J6bZMb2T66YABHZIFzob2CmgDiC
         HYkfWX63yoG7t5Q9pesklur09zMeTnCojnEHTOZ9x4iUOXGNY+JJI8ESN+//oVXb2TPH
         BSwZZ7kGBVtak2SbUedTtWVNr9zdWD4hvBkw04DoBSZRPEZhrIv/WtS6hahAz5r9sLpd
         wOuAKNrKZAPu4ITi3gwBQ+v/tdkbCKeQc+i17fNpk+O1cWgYyMNwcLNxzd+l0GTYExOA
         TqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785713547; x=1786318347;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wuve+ygXJV5dqDNQOvrNoXCyKoiwGqRf0o6QCP7Pj5E=;
        b=duSlUO7BuaFKTiai8+xsNergoRuj1b7eQiVk2M6qJt8TLYwjVNTvlD0vviZ062kNOW
         DrJkSmuLTCouWlLcwLVLEI/3102NqHZCeeRalx+pCgNP+782qLojlpiAfzOF/j4b7Uuo
         xkjgmfaKBq4+1WDzfnUDVza6VYUNxqiTjwTiWkrSB2/58enR8b31Q8pNr9oDwoGWeKU+
         Xl5uqboIp4GBsOWCVZKUB49fclupKE8huHk4/DOFXXjAgGPU+CcZiMJfTikZZVKS44yj
         cznFK3cmiOtt3l70I0ZfnB+IjHijaYTGNF+yLgUWuUmByGFcE8qiLy19kIKVxI+Jq19t
         wxsA==
X-Forwarded-Encrypted: i=1; AHgh+RoohCHHAGn0jO5jB/HWZXcdtCcQlKzm5ymA+QtQQ8TN3dK++krxiNHbjMUtj+GsGEWVLBCISmmycvCY9hAYJko=@vger.kernel.org
X-Gm-Message-State: AOJu0YylGCmlZOpITWmrteY6aPAeY97+fOdMoM6qtSKWPq7W6/7hgzGm
	WxK9VqYD8IHmHNfqY5L2rJ4Bl/juKjQMZ7JONOLo1nNgoolKxzvTxH/3
X-Gm-Gg: AR+sD12kWm02dk2NcdQQ1DeIYKGGNzxJNzs3X9PUwsvgNiQYrCKZ8wN1Qt0IkonXJoB
	Ti8T39enO2Pe0LBFUeYE4gv4KwamwDz4qEvTJHeWyPftkZqapSwoBMZiirpppcIt5Iy32albJp2
	dfxrHLqYGT691eTcpkwAduCmEVAlGVFcTifVutWxyVBsbKwqmja88pSIgav/fKv+1JWz4xLrgy1
	SOe6CtIrF0EtJ/OfwChEm9JSfCKPnPSR2xi/Gd/px2gfBXnF2osWOYvpMJj64Q1EKsq252tce6z
	LkPQia+ZPZZuIg8TGe/5lRUuaFFTt8uVAriqjrOyTVUrkt5KnqF00ZJBB4UJWZIp3ZwnB2yXdPZ
	AcsaYtkCE73MKDZ1VqSm3gWA2RTUVeINuthmMQtHeHwZjx7MOg2KSByADlossJb8WLy6FeHbtWd
	mdlZtbbM9ghuheIuykAfgucWgHPdKMvbpweUYjFQtnUW5uEFX/5Isqs89kdJfl0MBkShTqc8hHe
	FW+tMT5bpwreVYFJ4Ns0As2J2MfGfnvJGRYPyyGWi0CJwUnAlXgv2wMY8qchwr/lMpjLjfgd6Cv
	Lw9CEZsCCHKaSNDyNjTA7bAooG4=
X-Received: by 2002:a05:600d:8492:b0:496:c2fd:1731 with SMTP id 5b1f17b1804b1-4980c64b96dmr114476095e9.1.1785713546677;
        Sun, 02 Aug 2026 16:32:26 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5f007sm166475845e9.6.2026.08.02.16.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 16:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 01:32:26 +0200
Message-Id: <DKEUME1DRKOR.2R2XVNQDZKVSR@gmail.com>
To: "Ning Ding" <dingning04@gmail.com>, <bpf@vger.kernel.org>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <john.fastabend@gmail.com>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <martin.lau@linux.dev>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <shuah@kernel.org>, <danieltimlee@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Reject writes through untrusted allocated
 pointers
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260726021304.97ED91F000E9@smtp.kernel.org>
 <20260728033837.1466123-1-dingning04@gmail.com>
In-Reply-To: <20260728033837.1466123-1-dingning04@gmail.com>

On Tue Jul 28, 2026 at 5:38 AM CEST, Ning Ding wrote:
> A kptr loaded under an RCU read lock has MEM_ALLOC set. After
> bpf_rcu_read_unlock(), the verifier marks it PTR_UNTRUSTED, but
> check_ptr_to_btf_access() still allows writes because
> type_is_ptr_alloc_obj() ignores that flag.
>
> Reject writes through MEM_ALLOC pointers that are PTR_UNTRUSTED. Reads
> remain allowed and are converted to probe-memory accesses.
>
> Also skip the owning-reference check for these pointers, since they no
> longer have a live reference after leaving the RCU critical section.
>
> Add verifier tests for the rejected write and permitted read cases.
>
> Fixes: 503e4def5414 ("bpf: Replace open code with for allocated object ch=
eck")
> Closes: https://lore.kernel.org/all/20260726021304.97ED91F000E9@smtp.kern=
el.org/
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Ning Ding <dingning04@gmail.com>
> ---

Same comment for this one, split kernel and selftests into separate patches=
.

>  kernel/bpf/verifier.c                         |  6 +-
>  .../bpf/progs/local_kptr_stash_fail.c         | 58 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 7aa47342dc65..24c151ad2e62 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -5804,13 +5804,15 @@ static int check_ptr_to_btf_access(struct bpf_ver=
ifier_env *env,
>  		 * program allocated objects (which always have id > 0),
>  		 * but not for untrusted PTR_TO_BTF_ID | MEM_ALLOC.
>  		 */
> -		if (atype !=3D BPF_READ && !type_is_ptr_alloc_obj(reg->type)) {
> +		if (atype !=3D BPF_READ &&
> +		    (!type_is_ptr_alloc_obj(reg->type) || reg->type & PTR_UNTRUSTED)) =
{
>  			verbose(env, "only read is supported\n");
>  			return -EACCES;
>  		}

There is a PTR_UNTRUSTED check already earlier in this function, why is tha=
t not
working or not enough?

pw-bot: cr

>
>  		if (type_is_alloc(reg->type) && !type_is_non_owning_ref(reg->type) &&
> -		    !(reg->type & MEM_RCU) && !reg_is_referenced(env, reg)) {
> +		    !(reg->type & (MEM_RCU | PTR_UNTRUSTED)) &&
> +		    !reg_is_referenced(env, reg)) {
>  			verifier_bug(env, "allocated object must have a referenced id");
>  			return -EFAULT;
>  		}
> diff --git a/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c b/=
tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c
> index fcf7a7567da2..d7b8cd6458bb 100644
> --- a/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c
> +++ b/tools/testing/selftests/bpf/progs/local_kptr_stash_fail.c
> @@ -8,14 +8,22 @@
>  #include "../bpf_experimental.h"
>  #include "bpf_misc.h"
>
> +extern void bpf_rcu_read_lock(void) __ksym;
> +extern void bpf_rcu_read_unlock(void) __ksym;
> +
>  struct node_data {
>  	long key;
>  	long data;
>  	struct bpf_rb_node node;
>  };
>
> +struct plain_data {
> +	long key;
> +};
> +
>  struct map_value {
>  	struct node_data __kptr *node;
> +	struct plain_data __kptr *plain;
>  };
>
>  struct node_data2 {
> @@ -31,6 +39,7 @@ struct node_data2 {
>   * [35] TYPE_TAG 'kptr_ref' type_id=3D34
>   */
>  struct node_data *just_here_because_btf_bug;
> +struct plain_data *just_here_because_btf_bug2;
>
>  struct {
>  	__uint(type, BPF_MAP_TYPE_ARRAY);
> @@ -82,4 +91,53 @@ long drop_rb_node_off(void *ctx)
>  	return 0;
>  }
>
> +SEC("?tc")
> +__failure __msg("only read is supported")
> +long write_untrusted_alloc_obj(void *ctx)
> +{
> +	struct map_value *mapval;
> +	struct node_data *res;
> +	int idx =3D 0;
> +
> +	mapval =3D bpf_map_lookup_elem(&some_nodes, &idx);
> +	if (!mapval)
> +		return 1;
> +
> +	bpf_rcu_read_lock();
> +	res =3D mapval->node;
> +	if (!res) {
> +		bpf_rcu_read_unlock();
> +		return 2;
> +	}
> +	barrier_var(res);
> +	bpf_rcu_read_unlock();
> +
> +	res->key =3D 42;
> +	return 0;
> +}
> +
> +SEC("?tc")
> +__success
> +long read_untrusted_alloc_obj(void *ctx)
> +{
> +	struct map_value *mapval;
> +	struct plain_data *res;
> +	int idx =3D 0;
> +
> +	mapval =3D bpf_map_lookup_elem(&some_nodes, &idx);
> +	if (!mapval)
> +		return 1;
> +
> +	bpf_rcu_read_lock();
> +	res =3D mapval->plain;
> +	if (!res) {
> +		bpf_rcu_read_unlock();
> +		return 2;
> +	}
> +	barrier_var(res);
> +	bpf_rcu_read_unlock();
> +
> +	return res->key;
> +}
> +
>  char _license[] SEC("license") =3D "GPL";


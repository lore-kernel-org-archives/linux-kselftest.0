Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605878;
	b=xepVzjXfTUEXY/J/fOek3scDxph14TQW+LrtzkkgIownpUwcn4phPFYeaqXSyNaKdx9S
	 bk+NqPcN6oQ32Ly/XbI3PzbR7U5sa7HTK4NzDwAwyfWGY5i7hGqNFAm3pYRPauaqBqROM
	 fkX+Twh0RQrrK/w6768AIpkY5/L2fuIpXIfmD9L+INbzgGWg9+82PBx2fc8PGjjvaXYF8
	 ga8vdEoeg6WYdRdGy90swpPwYUpS6tZoJoGJwzcEnwJAWavyB9bNnD+dTMCJe0wBL/5cE
	 0Nw+4pafxFFX7rpfkEG9fSaOpCqdWh0a5pbM6ysYCoyETWjTqKhB/Qixt+VXegwVhBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=qFmWwE/MyJZ42ZQHTeVUHFZv3R+Of1XsGPpIbsWFJaI=;
	b=iS6GruHBgztmtjZwWvtMMvQHOl/03WubpmxLO1u4CIN1Oq6ajYIujfa7xjbhHmEzuSBy
	 5h3k72vkjhfAvM95H+++KDWmeIY57CRJLLDfCuBHjqSaZnO/hiBL+Qak87A8jpxouHg6r
	 np/sgk7r+rGHsK3JnoUArZ7wyQ8rnGZGLY3I1rTMmdmZ8eblC6Er4c2nbELN45zU4vOlB
	 s8JDHCryykKuZxNGC54MXGSBjORikYrbR5blLAFJBm6nFauWNgDMOBMWf3hNh+EC4fLcV
	 2oKxaX7gUQeX0DTG2M6c5fPHzONEX0xurjBHB88PScVdKJDFLIrjcJ+9px6t+e3zJFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=etsalapatis.com;
	spf=pass smtp.mailfrom=etsalapatis.com;
	dkim=pass header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=MSRrhXCb;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35775606A32C
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 07:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35775606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=MSRrhXCb
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1189031b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 23:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis.com; s=google; t=1793605877; x=1794210677; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qFmWwE/MyJZ42ZQHTeVUHFZv3R+Of1XsGPpIbsWFJaI=;
        b=MSRrhXCblmmK3m7i40Azvryyx/ncgyk1l0Z9OyvkL0wOUxRkhJvZnOiaJCEryuTub4
         PqaHL3Fy8zbcAl6+6ka9G45bqWPShSBijC1vWtrx4/a9NeOLINs7iHhoEZ1gWJ2hxAv+
         LJJUfyx/5xcZze/HPHq8oVhHyEws0ej9Fx9izJ4hmSDidMOaUSbzxctdk0PNS9eqxzDK
         K9G6SxxKRV/qtdKf6dv5Jx8DrDFkbJAjzjERdzmMzXUA1rn+FVgRosrS5Rbe6k55WaOS
         iwk0ffBS/JDKTshteG6uA9E6wjrSoHe7CQQ28Fhk1DYlC7/ul50P//1L72VWMe8wunmg
         TZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605877; x=1794210677;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFmWwE/MyJZ42ZQHTeVUHFZv3R+Of1XsGPpIbsWFJaI=;
        b=2MxMmcMgJSBO62MgTcUMcoXNCFDGe6EGIBjPRfX/Qcey04ZejrH+rw5JBRkt46myZL
         i5rsxLqeVHCVKQmxz2K9vJlxLK+nU3ouicfW+3sjc4+cMDfpMXL63L2+TRy1TazJkR7N
         KQ58/au3dbX1QVdE8/48LtVCNEqR0tn0Z1ZYu/7LAdQ3Zlu4vYXY5ta6SpMi0fNRhPE7
         3xn+pVYBIRDBj2KxPnpJFwBli+UU1+lQmkzYx2+iMiH8EhpT2BWmBF7+Uq/LILKW8u7F
         4iTzf5gY7X55gtaDrA40o0IakaapLvF8+Ij0TbfrpOJfWo2MjvA8V0GCvZI8loW2nIM5
         hGXg==
X-Forwarded-Encrypted: i=1; AKwUvBwo8RBbFc2WcIIrWy2dfnWTSPejDdMVmkrptgWdq2IMSywdDtTICuRIGHsB/5izeSo+NZ/9hfnw4yetLDmvt40=@vger.kernel.org
X-Gm-Message-State: AFq9FYItq8xbaGpB31Uzufd4033zeTq8MjLnr6YB6u/1oW8klc1BzA++
	M0tmIrmoRqk+NwYkgOR3mCRguyR+HMEzIw31mPbuJMoirCRkr0iRH31z9r5yz7fkEAc=
X-Gm-Gg: AYBFou2pRSCprk+NlItkfQefCJbUOoIzdQ4noA9ubt2Idl1zlawg/5ts7mST6j+oG5y
	cZWIU8O7pI6QXJyf0lnh2seBLOjPC4TumkoMtK//kw5m3byXtqzwhRnq5ujOKjOpZ9zd9lJBwR1
	ddOhSD8/DsnCiAC4lhbHItdgRJIsxTTeQctbY5N9KzC2dkFIiLk7Z90jSf8+zJ6shwFby9Q+J3w
	C/FQaVD7GrtcVbd3KbalqGcDxWYHilph1CfO3mFNfjDQX2EYEAW1dqdfIF3KNiE2cdubWxV70/3
	ueOdPJDvqYqx2eY1ppB48xlLedOjdZwxlAJTvGWTVm5hgTe1h0i6UR9wcNLZA13l7byUg/XqK8k
	XpOzCQfznYnEiCQuqyEADzC0+IkoXW0/m2mdvY3qH+xUkPwP7prxNVKRZLJRDPGM3INaXBOUxfv
	9H+YFxun/DCTKm04uKXSgrJXoNM59aUfZD4DDDaMDa6meg1D84G53uFLutxgCsM0KAbBqOvkyPN
	qjr/s9ODyv6lNRTzU1aTtoodiNLsspSrHiBWDyd+/pJ03hVbxY+G6RHqrxnY7g7pcSMLq0oEvFw
	NqppwB+C00fyYoYnvkWtOsu7WhVhpO9ImM3wi6IKA/uqT7cXoG1+tuf1uA==
X-Received: by 2002:a05:6a00:4f8c:b0:874:705d:f63e with SMTP id d2e1a72fcca58-8a9bf0472a8mr7293625b3a.32.1793605877437;
        Sun, 01 Nov 2026 23:51:17 -0800 (PST)
Received: from localhost (107-190-31-93.cpe.teksavvy.com. [107.190.31.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d047d2sm1658546b3a.25.2026.11.01.23.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:51:17 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 07:51:16 +0000
Message-Id: <DMKK7WGBASS7.2VBQTIIX6YEGS@etsalapatis.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, <david.dai@linux.dev>, "Gavin
 Guo" <gavinguo@igalia.com>, <bpf@vger.kernel.org>,
 <sched-ext@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH bpf-next 1/3] selftests/bpf: libarena: Order equal
 rbtree keys FIFO
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Changwoo Min" <changwoo@igalia.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0
References: <20261028060046.549097-1-changwoo@igalia.com>
 <20261028060046.549097-2-changwoo@igalia.com>
In-Reply-To: <20261028060046.549097-2-changwoo@igalia.com>

On Wed Oct 28, 2026 at 6:00 AM UTC, Changwoo Min wrote:
> An RB_DUPLICATE tree links a new key to the left of an equal one, so
> rb_least() and rb_pop() return the newest of several equal keys. A
> queue of tasks keyed by vtime should instead serve equal keys in
> arrival order, as sched_ext's vtime-ordered DSQs do.
>
> Send equal keys right on insert, as the kernel's rb_add() does. A new
> node then lands after every node with an equal key. Rotations and
> removals preserve the in-order sequence, so equal keys stay in
> insertion order without a tie-break field.
>
> Add a selftest that interleaves equal keys while the tree grows and
> checks the pop order.
>
> Signed-off-by: Changwoo Min <changwoo@igalia.com>

Hi Changwoo,

  Patch looks fine to me, one nit below.

> ---
>  .../bpf/libarena/include/libarena/rbtree.h    |  6 +--
>  .../bpf/libarena/selftests/test_rbtree.bpf.c  | 37 +++++++++++++++++++
>  .../selftests/bpf/libarena/src/rbtree.bpf.c   | 16 +++++---
>  3 files changed, 51 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/libarena/include/libarena/rbtree=
.h b/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> index 486428911d96..00e63b12d82e 100644
> --- a/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> +++ b/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> @@ -45,9 +45,9 @@ enum rbtree_alloc {
>   * the existing node.
>   *
>   * RB_DUPLICATE: Allow nodes with identical keys in the rbtree.
> - * Finding/popping/removing a key acts on any of the nodes
> - * with the appropriate key - there is no ordering by time
> - * of insertion.
> + * Nodes with identical keys are kept in insertion order, so
> + * rb_least() and rb_pop() return the oldest of them. Finding
> + * or removing by key acts on any of them.
>   */
>  enum rbtree_insert_mode {
>  	RB_DEFAULT,
> diff --git a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.b=
pf.c b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> index 856c484a009a..1e2a0fac1e4f 100644
> --- a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> +++ b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> @@ -248,6 +248,43 @@ __weak int test_rbtree_duplicate(void)
>  	return rb_destroy(rbtree);
>  }
> =20
> +#define FIFO_NR_NODES	64
> +#define FIFO_NR_KEYS	4
> +
> +SEC("syscall")
> +__weak int test_rbtree_duplicate_fifo(void)
> +{
> +	const u64 per_key =3D FIFO_NR_NODES / FIFO_NR_KEYS;
> +	struct rbtree __arena *rbtree;
> +	u64 key, value;
> +	int ret, i;
> +
> +	rbtree =3D rb_create(RB_ALLOC, RB_DUPLICATE);
> +	if (!rbtree)
> +		return 1;
> +
> +	for (i =3D 0; i < FIFO_NR_NODES && can_loop; i++) {
> +		ret =3D rb_insert(rbtree, i % FIFO_NR_KEYS, i);
> +		if (ret)
> +			return 2;
> +	}
> +
> +	for (i =3D 0; i < FIFO_NR_NODES && can_loop; i++) {
> +		ret =3D rb_pop(rbtree, &key, &value);
> +		if (ret)
> +			return 3;
> +
> +		/* All of key 0 in insertion order, then all of key 1, ... */
> +		if (key !=3D i / per_key)
> +			return 4;
> +
> +		if (value !=3D key + FIFO_NR_KEYS * (i % per_key))
> +			return 5;
> +	}
> +
> +	return rb_destroy(rbtree);
> +}
> +
>  static inline int
>  clean_up_noalloc_tree(struct rbtree __arena *rbtree)
>  {
> diff --git a/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c b/tool=
s/testing/selftests/bpf/libarena/src/rbtree.bpf.c
> index 7f0f6dc3e17d..e6c9430f734b 100644
> --- a/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c
> +++ b/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c
> @@ -161,8 +161,14 @@ struct rbnode __arena *rbnode_find(struct rbnode __a=
rena *subtree, u64 key)
>  	return node;
>  }
> =20
> +/*
> + * Find the node to link @key under. Smaller keys go left and everything=
 else
> + * right, so a new key lands after every node with an equal key and equa=
l keys
> + * stay in insertion order. Rotations and removals preserve the in-order
> + * sequence, so they keep that order too.
> + */

I think this description is more harm than good let's remove it. Can we als=
o keep the
old name? The new one sounds like we're inserting a parent.

>  static
> -struct rbnode __arena *rbnode_least_upper_bound(struct rbnode __arena *s=
ubtree, uint64_t key)
> +struct rbnode __arena *rbnode_insert_parent(struct rbnode __arena *subtr=
ee, uint64_t key)
>  {
>  	struct rbnode __arena *node =3D subtree;
>  	int dir;
> @@ -171,7 +177,7 @@ struct rbnode __arena *rbnode_least_upper_bound(struc=
t rbnode __arena *subtree,
>  		return NULL;
> =20
>  	while (can_loop) {
> -		dir =3D (key <=3D node->key) ? 0 : 1;
> +		dir =3D (key < node->key) ? 0 : 1;
> =20
>  		if (!node->child[dir])
>  			break;
> @@ -255,7 +261,7 @@ int rb_node_insert(struct rbtree __arena *rbtree,
>  	if (rbtree->insert !=3D RB_DUPLICATE)
>  		parent =3D rbnode_find(parent, key);
>  	else
> -		parent =3D rbnode_least_upper_bound(parent, key);
> +		parent =3D rbnode_insert_parent(parent, key);
> =20
>  	if (key =3D=3D parent->key && rbtree->insert !=3D RB_DUPLICATE) {
>  		if (rbtree->insert =3D=3D RB_UPDATE) {
> @@ -278,8 +284,8 @@ int rb_node_insert(struct rbtree __arena *rbtree,
>  	}
> =20
>  	node->parent =3D parent;
> -	/* Also works if key =3D=3D parent->key. */
> -	if (key <=3D parent->key)
> +	/* An equal key goes right, after the existing ones. */
> +	if (key < parent->key)
>  		parent->left =3D node;
>  	else
>  		parent->right =3D node;


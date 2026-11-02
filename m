Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606754;
	b=M1qXRZxj/IH3GswskcRHTuiPdec3zD8blBqIB/u5aJ7ssRn3FCagIC/86zcrym0eccR2
	 MdJQkzDAb1uDz9NttNJRd1TwoyQFubmSbDCQVBDIP+wv5Apyrk/5SMgG4hH3rWU2SaXpa
	 L4im998seugSWrFiasgec6cHueVclcdyL/LsG1WsUNRLkK9DnFgI+6UvCIIE6yqsqQvzc
	 n2kiT4GGIu1wHfx+pufRgghxrQrtiJ6taBB8gWRpBdwycWG2w/f1oLGTi8Kg+Zt06weH7
	 ZyOduyneqWZAdw7CQ3JW/CM1nCfwvxCYFHp8HyOPDH4qYHCeJGsIqCjqSKrBqAhAQ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=GX1t9pMXs769JkYcNPsWNbN+V/MYmi7Av1eem4JHDLU=;
	b=JhPKRvTY3Je3gefauMQGSIRWS7CrK0SBxoXylW0qm8ZG+nptwl/tmzuctFWICzY9ZEL9
	 ++mWH1R7vHlm+hUKCwRauu7RzFQrWMUy93cZaQNKZrFbWYLnqPuAhypOdNOq/E7DwFwjk
	 1cTPtJ4GjwgE4FYvlz5kCZBNlapCR5w9fdbtU+SbZekVn5Vy4+9fMJwqiOxI4Py4dp6Eu
	 ++4Hc/0BTofmojSRqtHwohdGPXjXziuBpOgj7RrUQjlU8YS9O2E/ejbrlY2gEky9asy4+
	 CjIoiSdCfwgF3bolpTF6ks6OwAaNYp2bJMX8UIJjPJnQ5WVEPvvSd9Va1nol+RKaA6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=etsalapatis.com;
	spf=pass smtp.mailfrom=etsalapatis.com;
	dkim=pass header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=AtHMd82K;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C0F606A32D
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 08:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C0F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=AtHMd82K
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1921549a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 00:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis.com; s=google; t=1793606753; x=1794211553; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GX1t9pMXs769JkYcNPsWNbN+V/MYmi7Av1eem4JHDLU=;
        b=AtHMd82KQtTlxZKQvyocgi/7KzwrbxwY6eHIW+a5RTeXBq6IeIl7tv62TdvAZUHdQZ
         3jJDbdV+7D6/2x2Ih7VXjOgsSTP4ePWEO/AN+6bb10THadEWzXQIimRdTV6Npyv7/V0F
         1o2aj6OuU35EnmDLUhqgTKx/iBwgU6NyzTsvCx+myZ+w2+9T3KuVTDZT4yn1+yQHyaCg
         rviyfPVnppkn7Q3bsudVcdnJGbmVvg4u7MwEB3JuCGul5MyBd6w05eK+SQpLZ9BSnfRJ
         FrNawPIAoZLb0cXePjXnH/wMmjGnT+lr3xiAjkhc3pRx0yaE7VIsLo2Y37LHnJyHC39D
         dJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606753; x=1794211553;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GX1t9pMXs769JkYcNPsWNbN+V/MYmi7Av1eem4JHDLU=;
        b=RMNkIrBywRSriXfgEZgbL64fOETV+P/qHySQiAas4jcHI+K8Ww4GCzEHObUAlbvehB
         iQQmJ6bQjLO0bEHgZxziqt93L76E/dH4fxxkL4ouOqYAObXCuCYY0onabOJQcVvwI2No
         MQVrK4jlnk0MtKs0jWJxX0c6fO367tG3z+CP+CYX0DIUhKye5ZVv2yH/lwPeEclcAeFZ
         Rro+stC7crHK0Jg3GX1D4XqWQwGuwD7xAEAA3ZCo14gjBkTbBobp48GVv9NgZsviTDO9
         +aDFRmbjuD6qucHPCOgVOXcxhGjPy952hehxAzjx4e3UxW58haJz4KTUXMJZp/TB1NJB
         1Bsg==
X-Forwarded-Encrypted: i=1; AKwUvByOXqUilIgE7vi3l5KqLxnP6nmlVm+id1+7Sn09V8LOjAugo+sAQ9DVxSM4/envXm70G2jqTgoHYCmRvl4tRAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0ZqyrtzT9DvzH1hl1UV8ffZiziuVnHKK1ExE2U5x6DCHNNZW/
	8WZLiKECk4TqKqSZhW+yDsY7Pgumz+sYTkzGLuTLqAKiBAuGXeoa3MSMBVDbqb/RxOI=
X-Gm-Gg: AYBFou2H7SJqewfwlvAEbqTWgVMrEX19QGwPK9pgc1aTRtFwOS7CDGgDwlVhr97+ove
	mtCfesR2oHOi4PkC+oEdZukXmNzboaklp582wH/CYO4VXhr/0vNGXmBLIC5YHjY7E8R6RNTVWaQ
	p6QEUPc2h//6/0/vrZ+/DurXLnW7SePM128gSIqPWPdljLRlMl9TjGt9szx5WZLAxmOSH8J/QSV
	G6qlHoUq1rzfiTmABcAphtgJp05AATn/Sh3pl4pxD4LlbNZWHiZYsizh8ZXgIjI8Nshcws57B64
	dpcW+yoT9kTQLLa0DnVehw1DEzYsdyjk6MKSs3vWhQX+hBtKTy7NHi7TlVmispP/DzSPKNoZcpR
	3IjhvS2vztJmzggt6Lf6BN0zJIJ+VyZQJ26q2XG0K6kwNLiwE9DnebIJYw/uYMtiPpD21zXzn4G
	2o26LNVQewdKe243WhoUlsgpyrgvyKoXuUWmSb+ci0RSaerz3lvFr7N0URiqHIHjNoUAJkuAnGU
	/wdnAbZEPjJGm/zpCHmWLJSAicL+2nqzhE/0m+Mf2edRc1d4oBAothO8ChwYj/h7MARt022ixTn
	2St1x+C68CyBLpiO/PaObL5z541hOnb6rWhHLr9flr5vIqsm6NgYEYHd2GEC/hZG836hCFjzG9+
	IHwI=
X-Received: by 2002:a17:90b:448c:b0:3ac:a7ee:6766 with SMTP id 98e67ed59e1d1-3ae8980ed36mr7796437a91.36.1793606752945;
        Mon, 02 Nov 2026 00:05:52 -0800 (PST)
Received: from localhost (107-190-31-93.cpe.teksavvy.com. [107.190.31.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f662basm6501183a91.1.2026.11.02.00.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:05:52 -0800 (PST)
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
Date: Mon, 02 Nov 2026 08:05:51 +0000
Message-Id: <DMKKJ2IWG6RV.2ZCAR6J19F5XF@etsalapatis.com>
Subject: Re: [PATCH bpf-next 2/3] selftests/bpf: libarena: Cache the
 rbtree's leftmost node and count
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Changwoo Min" <changwoo@igalia.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, <david.dai@linux.dev>, "Gavin
 Guo" <gavinguo@igalia.com>, <bpf@vger.kernel.org>,
 <sched-ext@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
X-Mailer: aerc 0.21.0
References: <20261028060046.549097-1-changwoo@igalia.com>
 <20261028060046.549097-3-changwoo@igalia.com>
In-Reply-To: <20261028060046.549097-3-changwoo@igalia.com>

On Wed Oct 28, 2026 at 6:00 AM UTC, Changwoo Min wrote:
> A run queue built on the tree needs lockless peeks at its head and
> length, like scx_bpf_dsq_peek() and scx_bpf_dsq_nr_queued() for
> sched_ext DSQs.
>
> Keep the leftmost node and the node count in struct rbtree. An insert
> changes the head only when it links left of it, and removing the head
> hands it to its in-order successor. rb_least() and rb_pop() use the
> cached head. rb_first(), rb_first_key() and rb_nr_nodes() read them
> without the lock. The head pointer, published with release ordering,
> decides emptiness, and the key is read through it. Both fields sit on
> their own cache line.
>
> Add rb_init() for a tree embedded in another object, such as a queue
> that keeps its lock next to the tree, and rb_fini() to empty it, since
> rb_destroy() also frees the tree's memory.
>
> Add selftests for the head and count across inserts, removals and
> updates, and for an embedded tree.
>
> Signed-off-by: Changwoo Min <changwoo@igalia.com>
> ---
>  .../bpf/libarena/include/libarena/rbtree.h    |  53 +++++
>  .../bpf/libarena/selftests/test_rbtree.bpf.c  | 209 ++++++++++++++++++
>  .../selftests/bpf/libarena/src/rbtree.bpf.c   | 122 ++++++++--
>  3 files changed, 365 insertions(+), 19 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/libarena/include/libarena/rbtree=
.h b/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> index 00e63b12d82e..a8dd8c2e7596 100644
> --- a/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> +++ b/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> @@ -4,6 +4,9 @@
> =20
>  #define RB_MAXLVL_PRINT (16)
> =20
> +/* Cache line size assumed for keeping the lockless fields apart. */
> +#define RB_CACHELINE_SIZE (64)
> +
>  struct rbnode;
> =20
>  struct rbnode {
> @@ -56,14 +59,34 @@ enum rbtree_insert_mode {
>  };
> =20
>  struct rbtree {
> +	/* Writer fields, on a cache line of their own. */
>  	struct rbnode __arena *root;
>  	enum rbtree_alloc alloc;
>  	enum rbtree_insert_mode insert;
> +
> +	/*
> +	 * The leftmost node and the node count on their own cache line.
> +	 * The writer keeps them current, and readers may read them without
> +	 * the writer's lock (see rb_first() and friends).
> +	 */
> +	struct {
> +		struct rbnode __arena *first;
> +		uint64_t nr;
> +	} __attribute__((aligned(RB_CACHELINE_SIZE)));
>  };
> =20
>  #ifdef __BPF__
>  struct rbtree __arena *rb_create(enum rbtree_alloc alloc, enum rbtree_in=
sert_mode insert);
> =20
> +/*
> + * Initialize and finalize a tree embedded in another arena object.
> + * rb_fini() frees the nodes of an RB_ALLOC tree and fails with -EBUSY o=
n a
> + * non-empty RB_NOALLOC tree. It leaves the tree's memory to its owner.
> + */
> +int rb_init(struct rbtree __arena *rbtree, enum rbtree_alloc alloc,
> +	    enum rbtree_insert_mode insert);
> +int rb_fini(struct rbtree __arena *rbtree);

Unless we are constantly creating/destroying trees, I don't think this is n=
ecessary
- allocations are in the 100ns range. Is there a reason to require being ab=
le to embed
the tree into other data structures?

> +
>  int rb_destroy(struct rbtree __arena *rbtree);
>  int rb_insert(struct rbtree __arena *rbtree, u64 key, u64 value);
>  int rb_remove(struct rbtree __arena *rbtree, u64 key);
> @@ -80,4 +103,34 @@ void rb_node_free(struct rbnode __arena *rbnode);
> =20
>  int rb_integrity_check(struct rbtree __arena *rbtree);
> =20
> +/*
> + * Lockless reads of the head and the node count. They need not be calle=
d
> + * under the writer's lock, so they are advisory: the tree may change be=
fore
> + * the caller acts on the result. The node rb_first() returns may have
> + * left the tree, or been freed in an RB_ALLOC tree, by the time the
> + * caller reads it. The count is a separate read and need not agree
> + * with the head.
> + */

Can we somehow communicate in the function name that it has nonstandard sem=
antics?
Also sorry if we've discussed this before, but what is the exact use of get=
ting
the node address back speculatively if we cannot guarantee the validity of =
the
pointer at all? Doesn't rb_first_key cover the case where we locklessly pee=
k
the key?

> +static __always_inline struct rbnode __arena *rb_first(struct rbtree __a=
rena *rbtree)
> +{
> +	return READ_ONCE(rbtree->first);
> +}
> +
> +/* -ENOENT if the tree is empty, 0 with the leftmost key in @key otherwi=
se. */
> +static __always_inline int rb_first_key(struct rbtree __arena *rbtree, u=
64 *key)
> +{
> +	struct rbnode __arena *first =3D READ_ONCE(rbtree->first);
> +
> +	if (!first)
> +		return -ENOENT;
> +
> +	*key =3D READ_ONCE(first->key);
> +	return 0;
> +}
> +
> +static __always_inline u64 rb_nr_nodes(struct rbtree __arena *rbtree)
> +{
> +	return READ_ONCE(rbtree->nr);
> +}
> +
>  #endif /* __BPF__ */
> diff --git a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.b=
pf.c b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> index 1e2a0fac1e4f..57c4395c046a 100644
> --- a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> +++ b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> @@ -285,6 +285,215 @@ __weak int test_rbtree_duplicate_fifo(void)
>  	return rb_destroy(rbtree);
>  }
> =20
> +/*
> + * Check the lockless head and count against a walk to the leftmost node=
,
> + * which does not use the cached head.
> + */
> +__weak int rbtree_check_first(struct rbtree __arena *rbtree, u64 nr)
> +{
> +	struct rbnode __arena *least =3D rbtree->root;
> +	u64 key;
> +
> +	while (least && least->left && can_loop)
> +		least =3D least->left;
> +
> +	if (rb_first(rbtree) !=3D least)
> +		return 1;
> +
> +	if (rb_nr_nodes(rbtree) !=3D nr)
> +		return 2;
> +
> +	if (!least)
> +		return rb_first_key(rbtree, &key) =3D=3D -ENOENT ? 0 : 3;
> +
> +	if (rb_first_key(rbtree, &key) || key !=3D least->key)
> +		return 4;
> +
> +	return 0;
> +}
> +
> +#define FIRST_NR_NODES	64
> +
> +static struct rbnode __arena *first_nodes[FIRST_NR_NODES];
> +
> +SEC("syscall")
> +__weak int test_rbtree_first(void)
> +{
> +	struct rbtree __arena *rbtree;
> +	struct rbnode __arena *node;
> +	u64 seed =3D 12345, nr =3D 0;
> +	int ret, i;
> +
> +	rbtree =3D rb_create(RB_NOALLOC, RB_DUPLICATE);
> +	if (!rbtree)
> +		return 1;
> +
> +	ret =3D rbtree_check_first(rbtree, 0);
> +	if (ret)
> +		return 10 + ret;
> +
> +	/* Pseudo-random keys with repeats, so the head moves and gets ties. */
> +	for (i =3D 0; i < FIRST_NR_NODES && can_loop; i++) {
> +		seed =3D seed * 6364136223846793005ULL + 1442695040888963407ULL;
> +		node =3D rb_node_alloc((seed >> 33) % 32, i);
> +		if (!node)
> +			return 2;
> +
> +		first_nodes[i] =3D node;
> +
> +		ret =3D rb_insert_node(rbtree, node);
> +		if (ret)
> +			return 3;
> +
> +		ret =3D rbtree_check_first(rbtree, ++nr);
> +		if (ret)
> +			return 20 + ret;
> +	}
> +
> +	/* Remove every other node in insertion order, head or not. */
> +	for (i =3D 0; i < FIRST_NR_NODES && can_loop; i +=3D 2) {
> +		ret =3D rb_remove_node(rbtree, first_nodes[i]);
> +		if (ret)
> +			return 4;
> +
> +		rb_node_free(first_nodes[i]);
> +
> +		ret =3D rbtree_check_first(rbtree, --nr);
> +		if (ret)
> +			return 30 + ret;
> +	}
> +
> +	/* Remove the head of the remaining half, emptying the tree. */
> +	for (i =3D 0; i < FIRST_NR_NODES / 2 && can_loop; i++) {
> +		node =3D rb_first(rbtree);
> +		if (!node)
> +			return 5;
> +
> +		ret =3D rb_remove_node(rbtree, node);
> +		if (ret)
> +			return 6;
> +
> +		rb_node_free(node);
> +
> +		ret =3D rbtree_check_first(rbtree, --nr);
> +		if (ret)
> +			return 40 + ret;
> +	}
> +
> +	return rb_destroy(rbtree);
> +}
> +
> +SEC("syscall")
> +__weak int test_rbtree_first_update(void)
> +{
> +	struct rbtree __arena *rbtree;
> +	struct rbnode __arena *node;
> +	int ret;
> +
> +	rbtree =3D rb_create(RB_ALLOC, RB_UPDATE);
> +	if (!rbtree)
> +		return 1;
> +
> +	if (rb_insert(rbtree, 5, 1))
> +		return 2;
> +
> +	if (rb_insert(rbtree, 5, 2))
> +		return 3;
> +
> +	node =3D rb_first(rbtree);
> +	if (!node || node->key !=3D 5 || node->value !=3D 2)
> +		return 4;
> +
> +	ret =3D rbtree_check_first(rbtree, 1);
> +	if (ret)
> +		return 10 + ret;
> +
> +	if (rb_insert(rbtree, 3, 3))
> +		return 5;
> +
> +	ret =3D rbtree_check_first(rbtree, 2);
> +	if (ret)
> +		return 20 + ret;
> +
> +	if (rb_remove(rbtree, 3) || rb_remove(rbtree, 5))
> +		return 6;
> +
> +	ret =3D rbtree_check_first(rbtree, 0);
> +	if (ret)
> +		return 30 + ret;
> +
> +	return rb_destroy(rbtree);
> +}
> +
> +struct rb_embed {
> +	u64 pad;
> +	struct rbtree tree;
> +};
> +
> +SEC("syscall")
> +__weak int test_rbtree_embedded(void)
> +{
> +	struct rb_embed __arena *embed;
> +	struct rbtree __arena *rbtree;
> +	struct rbnode __arena *node;
> +	int ret, i;
> +
> +	embed =3D arena_malloc(sizeof(*embed));
> +	if (!embed)
> +		return 1;
> +
> +	rbtree =3D &embed->tree;
> +
> +	/* Poison the fields rb_init() must set. */
> +	WRITE_ONCE(rbtree->root, (struct rbnode __arena *)~0ULL);
> +	WRITE_ONCE(rbtree->first, (struct rbnode __arena *)~0ULL);
> +	WRITE_ONCE(rbtree->nr, ~0ULL);
> +
> +	if (rb_init(rbtree, RB_NOALLOC, RB_DUPLICATE))
> +		return 2;
> +
> +	ret =3D rbtree_check_first(rbtree, 0);
> +	if (ret)
> +		return 10 + ret;
> +
> +	for (i =3D 0; i < 4 && can_loop; i++) {
> +		node =3D rb_node_alloc(4 - i, i);
> +		if (!node)
> +			return 3;
> +
> +		if (rb_insert_node(rbtree, node))
> +			return 4;
> +
> +		ret =3D rbtree_check_first(rbtree, i + 1);
> +		if (ret)
> +			return 20 + ret;
> +	}
> +
> +	if (rb_fini(rbtree) !=3D -EBUSY)
> +		return 7;
> +
> +	for (i =3D 0; i < 4 && can_loop; i++) {
> +		node =3D rb_first(rbtree);
> +		if (!node || node->key !=3D i + 1)
> +			return 5;
> +
> +		if (rb_remove_node(rbtree, node))
> +			return 6;
> +
> +		rb_node_free(node);
> +
> +		ret =3D rbtree_check_first(rbtree, 3 - i);
> +		if (ret)
> +			return 30 + ret;
> +	}
> +
> +	if (rb_fini(rbtree))
> +		return 8;
> +
> +	arena_free(embed);
> +	return 0;
> +}
> +
>  static inline int
>  clean_up_noalloc_tree(struct rbtree __arena *rbtree)
>  {
> diff --git a/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c b/tool=
s/testing/selftests/bpf/libarena/src/rbtree.bpf.c
> index e6c9430f734b..2622c78302af 100644
> --- a/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c
> +++ b/tools/testing/selftests/bpf/libarena/src/rbtree.bpf.c
> @@ -15,14 +15,12 @@ static int rbnode_replace(struct rbtree __arena *rbtr=
ee,
>  			  struct rbnode __arena *existing,
>  			  struct rbnode __arena *replacement);
> =20
> -struct rbtree __arena *rb_create(enum rbtree_alloc alloc,
> -				 enum rbtree_insert_mode insert)
> +__weak
> +int rb_init(struct rbtree __arena *rbtree, enum rbtree_alloc alloc,
> +	    enum rbtree_insert_mode insert)
>  {
> -	struct rbtree __arena *rbtree;
> -
> -	rbtree =3D arena_malloc(sizeof(*rbtree));
>  	if (unlikely(!rbtree))
> -		return NULL;
> +		return -EINVAL;
> =20
>  	/*
>  	 * RB_UPDATE overwrites existing values in the nodes, but RB_NOALLOC
> @@ -32,19 +30,51 @@ struct rbtree __arena *rb_create(enum rbtree_alloc al=
loc,
>  	 */
>  	if (alloc =3D=3D RB_NOALLOC && insert =3D=3D RB_UPDATE) {
>  		arena_stderr("WARNING: Cannot combine RB_NOALLOC and RB_UPDATE");
> +		return -EINVAL;
> +	}
> +
> +	WRITE_ONCE(rbtree->root, NULL);
> +	WRITE_ONCE(rbtree->alloc, alloc);
> +	WRITE_ONCE(rbtree->insert, insert);
> +	WRITE_ONCE(rbtree->first, NULL);
> +	WRITE_ONCE(rbtree->nr, 0);
> +
> +	return 0;
> +}
> +
> +/*
> + * arena_malloc() aligns a block to its power-of-two size, so the tree's
> + * lockless fields get a cache line of their own.
> + */
> +struct rbtree __arena *rb_create(enum rbtree_alloc alloc,
> +				 enum rbtree_insert_mode insert)
> +{
> +	struct rbtree __arena *rbtree;
> +
> +	rbtree =3D arena_malloc(sizeof(*rbtree));
> +	if (unlikely(!rbtree))
> +		return NULL;
> +
> +	if (rb_init(rbtree, alloc, insert)) {
>  		arena_free(rbtree);
>  		return NULL;
>  	}
> =20
> -	rbtree->alloc =3D alloc;
> -	rbtree->insert =3D insert;
> -	rbtree->root =3D NULL;
> -
>  	return rbtree;
>  }
> =20
> +static __always_inline void rb_set_first(struct rbtree __arena *rbtree,
> +					 struct rbnode __arena *node)
> +{
> +	/*
> +	 * Publish the new leftmost node with release ordering, so a lockless
> +	 * reader that sees it also sees the node's fields.
> +	 */
> +	smp_store_release(&rbtree->first, node);
> +}
> +
>  __weak
> -int rb_destroy(struct rbtree __arena *rbtree)
> +int rb_fini(struct rbtree __arena *rbtree)
>  {
>  	int ret =3D 0;
> =20
> @@ -63,11 +93,11 @@ int rb_destroy(struct rbtree __arena *rbtree)
>  		 * the now freed nodes. Throw an error instead.
>  		 */
>  		if (rbtree->root) {
> -			arena_stderr("WARNING: Destroying RB_NOALLOC tree with > 0 nodes");
> +			arena_stderr("WARNING: Finalizing RB_NOALLOC tree with > 0 nodes");
>  			return -EBUSY;
>  		}
> =20
> -		goto out;
> +		return 0;
>  	}
> =20
>  	while (rbtree->root && can_loop) {
> @@ -76,11 +106,22 @@ int rb_destroy(struct rbtree __arena *rbtree)
>  			break;
>  	}
> =20
> -out:
> -	arena_free(rbtree);
>  	return ret;
>  }
> =20
> +__weak
> +int rb_destroy(struct rbtree __arena *rbtree)
> +{
> +	int ret;
> +
> +	ret =3D rb_fini(rbtree);
> +	if (ret)
> +		return ret;
> +
> +	arena_free(rbtree);
> +	return 0;
> +}
> +
>  static inline int rbnode_dir(struct rbnode __arena *node)
>  {
>  	/* Arbitrarily choose a direction for the root. */
> @@ -255,6 +296,8 @@ int rb_node_insert(struct rbtree __arena *rbtree,
> =20
>  	if (!parent) {
>  		rbtree->root =3D node;
> +		rb_set_first(rbtree, node);
> +		WRITE_ONCE(rbtree->nr, 1);
>  		return 0;
>  	}
> =20
> @@ -273,6 +316,10 @@ int rb_node_insert(struct rbtree __arena *rbtree,
>  			if (ret)
>  				return ret;
> =20
> +			/* Same key and place, so only the head's identity changes. */
> +			if (rbtree->first =3D=3D parent)
> +				rb_set_first(rbtree, node);
> +
>  			if (rbtree->alloc =3D=3D RB_ALLOC)
>  				rb_node_free(parent);
> =20
> @@ -290,6 +337,14 @@ int rb_node_insert(struct rbtree __arena *rbtree,
>  	else
>  		parent->right =3D node;
> =20
> +	/*
> +	 * The node is the new head only if it went left of the old one. The
> +	 * rotations below never change which node is leftmost.
> +	 */
> +	if (parent =3D=3D rbtree->first && parent->left =3D=3D node)
> +		rb_set_first(rbtree, node);
> +	WRITE_ONCE(rbtree->nr, rbtree->nr + 1);
> +
>  	while (can_loop) {
>  		parent =3D node->parent;
>  		if (!parent)
> @@ -410,7 +465,7 @@ __weak int rb_least(struct rbtree __arena *rbtree, u6=
4 *key, u64 *value)
>  	if (!rbtree->root)
>  		return -ENOENT;
> =20
> -	least =3D rbnode_least(rbtree->root);
> +	least =3D rbtree->first;
>  	if (key)
>  		*key =3D least->key;
>  	if (value)
> @@ -578,8 +633,8 @@ static inline bool rbnode_has_red_children(struct rbn=
ode __arena *node)
>  }
> =20
>  static
> -int rb_node_remove(struct rbtree __arena *rbtree,
> -		   struct rbnode __arena *node)
> +int rbnode_remove(struct rbtree __arena *rbtree,
> +		  struct rbnode __arena *node)
>  {
>  	struct rbnode __arena *parent, *sibling, *close_nephew, *distant_nephew=
;
>  	bool free =3D (rbtree->alloc =3D=3D RB_ALLOC);
> @@ -765,6 +820,35 @@ int rb_node_remove(struct rbtree __arena *rbtree,
>  	return 0;
>  }
> =20
> +/*
> + * Remove @node and keep the head and the node count current. The head h=
as no
> + * left child, so if it is the node going away, its successor is the lef=
tmost
> + * node of its right subtree, or else its parent. Take it before the tre=
e
> + * changes; the removal and its fixups preserve the in-order sequence.
> + */
> +static __always_inline

We don't need the __always_inline for static functions, they are there to h=
elp
with verifier limits but upstream libarena tracks bpf-next which can verify
pretty much anything. I'll re-add those as needed when importing to Github
in the compat branch.

> +int rb_node_remove(struct rbtree __arena *rbtree,
> +		   struct rbnode __arena *node)
> +{
> +	struct rbnode __arena *next =3D NULL;
> +	bool was_first;
> +	int ret;
> +
> +	was_first =3D node =3D=3D rbtree->first;
> +	if (was_first)
> +		next =3D node->right ? rbnode_least(node->right) : node->parent;
> +
> +	ret =3D rbnode_remove(rbtree, node);
> +	if (ret)
> +		return ret;
> +
> +	if (was_first)
> +		rb_set_first(rbtree, next);
> +	WRITE_ONCE(rbtree->nr, rbtree->nr - 1);
> +
> +	return 0;
> +}
> +
>  __weak
>  int rb_remove_node(struct rbtree __arena *rbtree,
>  		   struct rbnode __arena *node)
> @@ -813,7 +897,7 @@ int rb_pop(struct rbtree __arena *rbtree, u64 *key, u=
64 *value)
>  	if (rbtree->alloc !=3D RB_ALLOC)
>  		return -EINVAL;
> =20
> -	node =3D rbnode_least(rbtree->root);
> +	node =3D rbtree->first;
>  	if (unlikely(!node))
>  		return -ENOENT;
> =20


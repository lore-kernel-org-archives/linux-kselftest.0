Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606829;
	b=0dJN02A+OQvYTwlPCLcet4YfhGr95SXpLsuJqxwJCBLo7gAm/nqTgZJs/Bf8cYTOFJ1R
	 g/ZaJH4xSJmp7buCqwM9OFF+AafQJBvZk6gTlKrTosBefPum3Ob29Jwy7Xz+hlyF3YuU/
	 2aDnL8DCfYYRGocXWbuPT2I67uLirA6y7qIzd4Ii6k0zHTZpkb5Lg28xor0bq0d3eN8tD
	 0atzr2jiE3ecKRY89bfB2OhB74y2PEn09zdwOb7t6sVAjvvzBspJ5VZX1o/nSLtV1SrFe
	 9wHQ36iMlzGz33R5xcWCGxzlH0+ESCSfjTAS1LGjHniOx8/KD8+dkovGPoayQm+siZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=ZFKEz2Iu0aOPt9Nq3i/pKYGCNKHVigLA2BmD6KDbRRo=;
	b=r5fPGC3krmJH4G1Miv16Lh0kT3MqF+wJ6VvumAyvmaGsnb50gLYcn3M0C0a3oNcSgW0Y
	 F6N7DSYsGmQjDfwrzYetgEUm9zDednQ+dPORca+Ay2PXMDgGrtzceYI5g8GQplF6RFMhP
	 zkHHREvzPjf7Em+lKFJE6f5Xuu9GOFN6JIa+J8BBOJhld78UYut6GpDPZE1SBIR4XQywY
	 7+fHitUuCxMvbPNkgDDM6eaR0J2/QK35d0YT5PSHoP8yqeazfWXqz5edxziz97OsdhKDI
	 nBOp6XROpvILh/iIWpAD583yQjd+VTZK/g/QYD1SSxpexwCIHWhDOVxpd8go15o0pJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=etsalapatis.com;
	spf=pass smtp.mailfrom=etsalapatis.com;
	dkim=pass header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=oYOQJQwo;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE430606A329
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 08:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE430606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=oYOQJQwo
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e985106c0cso25517475ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 00:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis.com; s=google; t=1793606828; x=1794211628; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFKEz2Iu0aOPt9Nq3i/pKYGCNKHVigLA2BmD6KDbRRo=;
        b=oYOQJQwoCDvsXxt2wNBL0Qu4ZX7aOeuq5MtfITPE1td7BT+iegjg9OjLdxBT/HisCV
         q8rqC54AX7s6PfNUe1eERfL9dfJrtAP1S+7wTT6DSc2DdMkhjAJbYesWgoQABQMkl1iH
         TsA80djQxuoZchaxQNp2eToC+qtWu9DHtFvlmY4ILdtFH5d2zEYJoijiIwC2Co7/iFXF
         jXV2HvbJZqC5kATgAWvJhsutbCGf258UBq9uA65fdjIIf+b1wMhtGBnptXqV+fYuFZqy
         xc/emEngGzDn7fHG2e1nzK8/7uxztaoTiGmxEvZeckvFcsJTRs96+2sb2WM58mZhfQol
         cZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606828; x=1794211628;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFKEz2Iu0aOPt9Nq3i/pKYGCNKHVigLA2BmD6KDbRRo=;
        b=dHSEEZNOL7qf4BBCjSHXnwmmXkR3RUMcowvJU9YoUe9YK3FBB3AuXuD47cKuB14kss
         upp1XXAPYUD61Dvax67jMMRXgdw2Fj6s0ywuFA8g07orJEPJWHu2IMPjXYEpPwU47W8D
         oJi5xCoRceqnB7l5RghoOBfg/u9M3TGOknZ/H7rkQr9F2Eby9kCJsU4kVRqFAUSebXun
         DMXpK5m21Ga7QOxkteOiLis+rx3gw4JjrSXxKSSQAcWWNXZbSSvxO0XO1ldLIEPKMx7k
         ldJX4OTph07KKYMCYEL49acy7JHSGnOsjlqZrG8aqIyqyEehe/5wROrs3AbeLw6755rZ
         FBww==
X-Forwarded-Encrypted: i=1; AKwUvBy0IH6ikg4A5b1TBUyjNa7Z5Layb2Be22u90uwOIIj3LeqRn0/69SAeef8B9ZqH9Z00yKiWcNHwNGbkt9auaEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oakD7sHiShcbFM6qs6wXY2n7YXoa/pe1BLcjqwbYhO4HNWLee
	xUNFvI6Om5rZITMOqZVwVA/URYdnl5Gh/J1hQ4iKoi9QBiSfpZoXsbmdMRi0mzR3uec=
X-Gm-Gg: AYBFou30yactGNo+liMvPt1l99x06BIB+YACOxKgZNHcFzetWIU+9pyqMqzHnY+u7BK
	sKaEWou/iHqLSRrGXs77PX2xDmMxXEh9HyU07iKSvSkRdcYGeFzeuadKQ9KkR436PsbsXOnKS6b
	kcqyG9LmexFPt0rjO0uqZ6Ssmj8IEm+s//G+zPM8zJKQAeOcwhOxf9nH9Ua0yJaKiWh8BQEibGJ
	MzR9IMPhr74Hz3Qkrj5KgL8dYSemXkhdeTVDXjWwNB5t7fF/XPDo7HuMkUa2UigsLf6XBqmiHRY
	5dGGgI4YA/JLKgm/KmdOgl0T4Ukvr3Mj1rAfBHtxA1vG10NRAe1p4Eq67aqRjNp3c847+jksu7Y
	sD/ejd6F21myKzi0mmIUeViIIKBLA3vWkDnBe7+GXLlzfxhB2EGFTX2GqiZXFeD5MhJxMwoV55Y
	r26nQQbOdFHRmpcmJR00CRBwkaJnlJvqebjvo0ls9vV6QPQ+DkdGzYz53m3IQKoz5DJbzVPxmv8
	upsbDqhZvnCqAejWka46ibW9HHJpfyfudo7EpdpkHU4euEnHNA4IRb7m6J7h+Mbw6DT1hI4YAUe
	2XVzvZNTR4Gl6xowoICd3IyZovDG7KhRshV2dA9tXb2lKhl81l7buXnmvaFduu7ytSC3PvLxEFe
	QtB6y
X-Received: by 2002:a17:902:eccb:b0:2e5:d2b1:c70b with SMTP id d9443c01a7336-2eb36536d3amr90256725ad.60.1793606827873;
        Mon, 02 Nov 2026 00:07:07 -0800 (PST)
Received: from localhost (107-190-31-93.cpe.teksavvy.com. [107.190.31.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39265090sm23623165ad.41.2026.11.02.00.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:07:07 -0800 (PST)
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
Date: Mon, 02 Nov 2026 08:07:06 +0000
Message-Id: <DMKKK0ZLYSKU.3UZ614ZC9DH05@etsalapatis.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, <david.dai@linux.dev>, "Gavin
 Guo" <gavinguo@igalia.com>, <bpf@vger.kernel.org>,
 <sched-ext@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH bpf-next 3/3] selftests/bpf: libarena: Add rb_next()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Changwoo Min" <changwoo@igalia.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0
References: <20261028060046.549097-1-changwoo@igalia.com>
 <20261028060046.549097-4-changwoo@igalia.com>
In-Reply-To: <20261028060046.549097-4-changwoo@igalia.com>

On Wed Oct 28, 2026 at 6:00 AM UTC, Changwoo Min wrote:
> Add rb_next(), the in-order successor through parent pointers.
>
> Add a selftest that walks a tree with repeated keys and checks the walk
> against the order in which the head leaves the tree.
>
> Signed-off-by: Changwoo Min <changwoo@igalia.com>
> ---
>  .../bpf/libarena/include/libarena/rbtree.h    | 23 ++++++++
>  .../bpf/libarena/selftests/test_rbtree.bpf.c  | 54 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/libarena/include/libarena/rbtree=
.h b/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> index a8dd8c2e7596..956b4a24b52a 100644
> --- a/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> +++ b/tools/testing/selftests/bpf/libarena/include/libarena/rbtree.h
> @@ -103,6 +103,29 @@ void rb_node_free(struct rbnode __arena *rbnode);
> =20
>  int rb_integrity_check(struct rbtree __arena *rbtree);
> =20
> +/*
> + * Return the in-order successor of @node, or NULL if @node is the last =
one.
> + * Walking from rb_first() with it visits the tree in key order, equal k=
eys in
> + * insertion order. Call it under the writer's lock.
> + */

Let's move this to the main *.bpf.c file, with the rest of the traversal fu=
nctions.

> +static __always_inline struct rbnode __arena *rb_next(struct rbnode __ar=
ena *node)
> +{
> +	struct rbnode __arena *parent;
> +
> +	if (node->right) {
> +		node =3D node->right;
> +		while (node->left && can_loop)
> +			node =3D node->left;
> +		return node;
> +	}
> +
> +	/* Climb until we leave a left subtree; its parent comes next. */
> +	while ((parent =3D node->parent) && node =3D=3D parent->right && can_lo=
op)
> +		node =3D parent;
> +
> +	return parent;
> +}
> +
>  /*
>   * Lockless reads of the head and the node count. They need not be calle=
d
>   * under the writer's lock, so they are advisory: the tree may change be=
fore
> diff --git a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.b=
pf.c b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> index 57c4395c046a..784cc9edea17 100644
> --- a/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> +++ b/tools/testing/selftests/bpf/libarena/selftests/test_rbtree.bpf.c
> @@ -425,6 +425,60 @@ __weak int test_rbtree_first_update(void)
>  	return rb_destroy(rbtree);
>  }
> =20
> +#define NEXT_NR_NODES	64
> +
> +static struct rbnode __arena *next_nodes[NEXT_NR_NODES];
> +
> +SEC("syscall")
> +__weak int test_rbtree_next(void)
> +{
> +	struct rbtree __arena *rbtree;
> +	struct rbnode __arena *node;
> +	u64 seed =3D 0xcafe;
> +	int i;
> +
> +	rbtree =3D rb_create(RB_NOALLOC, RB_DUPLICATE);
> +	if (!rbtree)
> +		return 1;
> +
> +	/* Pseudo-random keys with repeats, so the walk crosses equal keys. */
> +	for (i =3D 0; i < NEXT_NR_NODES && can_loop; i++) {
> +		/* LCG using Knuth's MMIX constants for determinism. */
> +		seed =3D seed * 6364136223846793005ULL + 1442695040888963407ULL;
> +		node =3D rb_node_alloc((seed >> 33) % 16, i);
> +		if (!node)
> +			return 2;
> +
> +		if (rb_insert_node(rbtree, node))
> +			return 3;
> +	}
> +
> +	node =3D rb_first(rbtree);
> +	for (i =3D 0; i < NEXT_NR_NODES && can_loop; i++) {
> +		if (!node)
> +			return 4;
> +
> +		next_nodes[i] =3D node;
> +		node =3D rb_next(node);
> +	}
> +
> +	if (node)
> +		return 5;
> +
> +	for (i =3D 0; i < NEXT_NR_NODES && can_loop; i++) {
> +		node =3D rb_first(rbtree);
> +		if (node !=3D next_nodes[i])
> +			return 6;
> +
> +		if (rb_remove_node(rbtree, node))
> +			return 7;
> +
> +		rb_node_free(node);
> +	}
> +
> +	return rb_destroy(rbtree);
> +}
> +
>  struct rb_embed {
>  	u64 pad;
>  	struct rbtree tree;


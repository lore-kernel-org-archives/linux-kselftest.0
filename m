Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793494990;
	b=kszKXwhezRpIc75Fc1LlOJZ3xL8aj/0maRKaR7V+ERJIVT4TN9jy8WCB7oqmfcrD88z5
	 zemKBh+BMTYH3R/9XES/y4RwCRoUtuAUSkbQNDzlE10MxXsskcS6MebHZRtY4Yv5QvENN
	 3zYddsvMZWyAJUAqhb6v1BRuLbHgx8m72huc7VFetsVe+53WjMx8TPhkpwtBOS3NKjVF6
	 3Wz7VELJQNwL63NMK16OR7pUMAq+YXC+OjIcLl8o0cqdGqCIkR8wN+gTzRyAK2vV08LpR
	 vBBG8FYXligOjGypyG9NA+I790BYAZ6jnA7uOZVV6sv1BP72pEeHBBjx9li9CbiFQ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793494990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=/U+dm6O7ibLuqp1u5mfZ05KhbMMiFWjnF5fZVcet2uE=;
	b=UDbv8jAvpF/CpcWrdVnpHEtE18wqc9+Tvt5MMb6KUhC1Kmdyzfy6aa9hbPbdpUeisxet
	 zyFP3In0haT2v1C2Qfjrl/+0w+OyzsZnltvKZzID9S7lmnIRqbr4RjIQ4KbYiG7HoXO/Y
	 lclNtxxrCJlK9VeXyg1dGtqnKSEHH/rRr52f0Kn9aAbp8pQEyh7fMc70QmLDp661rkkTl
	 chj4TRwtB8O32+yyKxEAGcFIKQQWegBsK/bnedU3whPNvPlBddLG8Xq10YstpFvcv1xye
	 Lrx6z8ZggYfEUsB7sBibAWrfMS1hwNmcKhJqdMVyRpD3vywBTuMiednqMkalYrVUqnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e80VcSTP;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F33606A31A
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 01:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e80VcSTP
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e5378b281aso10580625ad.2
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 18:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793494989; x=1794099789; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/U+dm6O7ibLuqp1u5mfZ05KhbMMiFWjnF5fZVcet2uE=;
        b=e80VcSTPEtt+Rqb+MVQ7zyTHE1DjqfAfg4HaJ1qxZqT47NXqiL0RJkcrMzTz7Jgw2q
         BNgkv1CdagEzyEPK9CqJ3ElM6tP4DsQGcuQN9c5U+5/rElou5PiS0yMPgA+csE0rLTrS
         RRf7Lj6ZW3STr8rwnVdX0snKtXHEC6K260p8EhcOijSK5hOLpVkfSJjm98tpv5UtgdF6
         u7oIy2ErClch2aW+dXVQrAan3ZSNhGsO/4iU9QU944mQr38Kgktm8k/X0n51TyeQXjWN
         iIuJJ2uHNYdOT4SC6ODalg6slpVi5JFxDnEfmx7LtADgEaHhLxR6TWzXfJP4/RPxbg9R
         rkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793494989; x=1794099789;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/U+dm6O7ibLuqp1u5mfZ05KhbMMiFWjnF5fZVcet2uE=;
        b=mwe4/r4mnavBeoBaX43DFPwBRgvQDITkRVEcAQf7ynPZJdb2ZFmuTQSGoA9cDFMbuO
         EoVIGx3rLcdhb9GQSsdZNbeRdpGyQcTSOSq+ZANn0hgfvmtqe7OdNY2P5sHgOXoaQjQb
         +iyUZdaruobPY/PZ0VFDPqjykBNCzCasQHgHxHzAK9vFhyiMf2gT6xHeBjHSinZNinK2
         xg2dCpiC2j+ZNAIaWqatW4UMBaKf6GjKt9g8/kxmgFLUDH7h/xe+4sey2tdgnD9nbvSL
         97P260pHyzeGL9JYrUg6VpDPUCZL8wkD8Ep5C+gufIqkEk6xkRdqlSM5go7J9S31IrXi
         bl2w==
X-Forwarded-Encrypted: i=1; AKwUvBx/BuHRzECNF5qHd8nJBJjqZ0jNCfNgy1jWdgt0souaU4zLlj+G29jIhwiObAoKXpYPWyH6uCfC5HzBmPeziyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nh6RCak7VftHPqbGdmmdX5dBg3d/oDasZYY0nuyDFLvR6p3l5
	mzbWymQMhTAD/zqKwzfBmbmzbdouZBsmCv3gAImY32gvfAmbgn1S5HMr
X-Gm-Gg: AYBFou2RfEpT2lugE4ttAdMOlH968M11YEd9uY4gh/kv6efdnnGI0I20JVciG0jdF/3
	QTt5Or1FalJ9KIo7cdNdyud4WVEy+mOcmiLH0BIRCZzvzNtsvTQ1GCezuFcdwuImjbKAP7HWWKK
	PnF1C2Urd8aa5X4ReXlLUmIMKk73FIDesOJvDmBG8GKY7u+gxwt6clwUMk0HVGH/tIg/M4szYUa
	hhan9G5VZNKfiaLzFzsqPpp3kVBjP2y1W6wuEgVxl0fVXQBct16J8owMUwdCy9BRpnDygCbH7iC
	5xChz6fe+avYfY3NBqcBG1CuQTwS/e7y6jds0+ZClkDaoiJPnWcApYwbX6UpavcTicHqHbVC3R1
	4YpDgKsklY0GmGD5AImyjjDX6WwT70Qu0STEbwGNWs0mdBvso0ACIaru6M0aTtY0+LIqA33RCx7
	XiM7hk4V3qRH/v4G/US+R7bpkUzScx/db/Q1zfMWvggAqs5uVGIgkQaNZJQEIsNiLCY+omR8YAK
	IRwuzsYJoiS1yecumot7yHhMd6YNmG1dD8qIqk6g8lpHZkM3O9EBL7tk+atJWvTzGKJrkjwaYza
	g40Nw3PnNcVHmudcL4Y5Xjr+Rl+CVnlVv3oOcM76CF8ujdtkLlZ8Ho4lyCeA4xFAUfct1dNuPQO
	OFFLBXn0A4UE9qqgHksfgto7Zb202ofig6h4X0fBy1SrWPf085IflU70=
X-Received: by 2002:a17:90b:17cb:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3ae89736030mr5688613a91.29.1793494989295;
        Sat, 31 Oct 2026 18:03:09 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98afe3sm13151497a91.12.2026.10.31.18.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 18:03:08 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 01:03:08 +0000
Message-Id: <DMJGWV96Y5SV.33OTYFHFZQ1WT@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, <david.dai@linux.dev>, "Gavin
 Guo" <gavinguo@igalia.com>, <bpf@vger.kernel.org>,
 <sched-ext@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH bpf-next 2/3] selftests/bpf: libarena: Cache the
 rbtree's leftmost node and count
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Changwoo Min" <changwoo@igalia.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Shuah Khan" <shuah@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
In-Reply-To: <20261028060046.549097-3-changwoo@igalia.com>
References: <20261028060046.549097-1-changwoo@igalia.com> <20261028060046.549097-3-changwoo@igalia.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Oct 27, 2026 at 11:00 PM Changwoo Min <changwoo@igalia.com> wrote:
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

That's 16 -> 128 bytes.
Without perf numbers it's a premature optimization.

> +	ret = rbnode_remove(rbtree, node);
> +	if (ret)
> +		return ret;
> +
> +	if (was_first)
> +		rb_set_first(rbtree, next);

In an RB_ALLOC tree rbnode_remove() frees the node and then rebalances
the tree. first points to the freed node all that time:

  CPU 0, holds the lock            CPU 1, no lock
  rb_pop()
    rb_node_remove()
      rbnode_remove()
        rb_node_free(node)
                                   rb_first_key()
                                     first = rbtree->first
                                     first->key    <- use after free
        rebalance
      rb_set_first(next)

buddy_free() poisons the node. A prog built with ASAN gets a report from
rb_first_key().

rb_erase_cached() moves rb_leftmost before rb_erase().
Should it be the same here?
Move rb_next() from patch 3 in front of this patch. Then at the top of
rb_node_remove():

  if (rbtree->first == node)
          rb_set_first(rbtree, rb_next(node));
  WRITE_ONCE(rbtree->nr, rbtree->nr - 1);

and no need for the wrapper, was_first and the rename to rbnode_remove().

Patch 1 looks good.

pw-bot: cr

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981906;
	b=OxeDLGxxwnDfZCg2WL8SurpxD4HA4XbRJDUZvWVb/e3JFbQtGAs0T9on+IdZK12ys2ZX
	 uJDDGsqGXPImRSoz+M9k7nYvcNH1JkESQZOtLbiaQeVRtKvoeqliD84gr1Z8rPoTTRC7a
	 lsH9X1jK+QnU/+Gu/XrexLGLPiEntPsYKfrpBkruugLH/QPqL1qby75eYMjmOcdZfUOOC
	 rcMMTsILti0DOEiyJ5TGfxVO/9J7JtCJnXYqCNkENHzzzBeZeQmltw8lhuvIDnRzQ5oym
	 ihrqC1sPapt+bMh1RT3SwB0AR4w9/kAF8N79dBppDqZqFgY19U4+jIGA38eYsLQj5vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981906;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8UxOlUwurvltrL8LywXYchF60RvSL244Iq18WBoKZQU=;
	b=xGjSCqdfjGr1aOt4cHzChJq/LPGnUvYzxVsA/n07pS/ipBMdLB/mFEj9w7WPFETS0wXr
	 ezeuvLKSKcbmY8Jb0nUxWRbgkL1xQbHzJkc1oi+oh98FiEWuIIBtx/3n/oxJjBC6CdRQ7
	 l7LY7s4VkkHn8lrUtKOalGeDzN3dHBL2mhTyPT3MPkENsM//RtgqL1i4hNzbEIBhDQq9E
	 jArVuqF4xBfEKdPyFg2A9M+rBi9iAClwx2kidHoAu6SI9XdYha5v14xexW2bXveOUH79f
	 ullCMMGATynXwFNUjhXeGLGD8xk3h8kq2gyx2h5stzGMUiOIpgl2RZ5ZKgFrrgSGePQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dg/Om8Tj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E9606A332;
	Wed, 18 Nov 2026 06:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dg/Om8Tj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF061F000C6;
	Wed, 18 Nov 2026 06:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794981906;
	bh=8UxOlUwurvltrL8LywXYchF60RvSL244Iq18WBoKZQU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dg/Om8TjN11NRsuZFFRkEdgzh6GRD86UQQJstuppFBw1A0AtU/WC0jQhsDE/7H3tk
	 UBVR3Haq5Hu89t7qSg6hniWwfO/o93o2Ih0Z/0CR+EjftOnlCC2/7TF/dOfEnK4ETC
	 960QN7yGod/Qg+YAEdlf5U/HefDcoeYnh4EmwKf6hQ4kWnine5SoiRSNm9HHpETUHD
	 pZ01eB1HnCe3Is8HY08WdWdMapbFu5WA1fEw7RxGDd97RSmMR6M1WdDOdnNrRlUyev
	 P3yHic00Gh039y6+ISl1Yy5p0dlhMwxjcMLLES7WhEOUn1yTcQArFFluaybigEWTW6
	 umqXmsmYEYFGg==
Subject: Re: [PATCH net-next v4 2/5] psp: support tx rekey operation
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, willemb@google.com
Date: Wed, 18 Nov 2026 06:05:04 +0000
Message-ID: <179498190470.3136.17804985440456720671@kernel.org>
In-Reply-To: <20261116-psp-v4-2-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-2-1a599df2aefa@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In the commit "psp: support tx rekey operation", the
  documentation and the code disagree.

Pre-existing issues:
- [Low] Retired PSP key material is freed without being zeroized.

--

psp: support tx rekey operation

This commit lets tx-assoc be called on a socket that already has a Tx
key. A new psp_assoc is allocated with the same Rx state and the new Tx
key, then published to the socket with rcu_assign_pointer(). For now,
devices that store Tx keys on the device (SADB) get -EOPNOTSUPP.

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index c1e38845f08c3..d497f41c483e1 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -280,6 +280,53 @@ psp_sock_set_tx_key(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
>  	return err;
>  }
>  
> +static int
> +psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
> +		  struct psp_key_parsed *key, struct netlink_ext_ack *extack)
> +{
> +	struct psp_assoc *new;
> +	int err;
> +
> +	if (psp_dev_has_sadb(psd)) {
> +		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
> +		return -EOPNOTSUPP;
> +	}

[Severity: Low]
Should the documentation updated in this patch mention this restriction?

The tx-assoc doc in psp.yaml now says, with no condition:

    If the socket already has a Tx association, rekey its Tx direction.

psp.rst says tx-assoc "installs a new Tx key, which takes effect
immediately". The only rekey errors it lists are -EINVAL and -EBUSY.

psp_dev_has_sadb() is true for mlx5, which sets
.tx_key_del = mlx5e_psp_assoc_del. So at this commit, a Tx rekey on the
only in-tree hardware driver always fails with -EOPNOTSUPP, and the docs
never mention that errno.

The next patch in the series, "psp: defer tx key deletions for SADB
drivers", removes this check and adds deferred Tx key deletion. After it,
the code and the docs agree. The mismatch only exists between these two
patches, and the commit message calls it out ("return -EOPNOTSUPP for
now").

> +	if (!pas->peer_tx) {
> +		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
> +		return -EBUSY;
> +	}

[ ... ]

> +	memcpy(&new->rx, &pas->rx, sizeof(new->rx));
> +
> +	err = psp_assoc_set_tx(psd, new, key, extack);
> +	if (err) {
> +		kfree(new);
> +		return err;
> +	}
> +
> +	psp_dev_get(new->psd);
> +	list_add(&new->assocs_list, &pas->assocs_list);
> +	list_move(&pas->assocs_list, &psd->stale_assocs);
> +
> +	rcu_assign_pointer(sk->psp_assoc, new);
> +	psp_assoc_put(pas);

[Severity: Low]
This isn't a bug introduced by this patch, but should the retired key
material be wiped before it is freed?

The replaced association still holds the old Tx key in pas->tx and the Rx
key in pas->rx. It is released through:

psp_assoc_put()
  call_rcu(&pas->rcu, psp_assoc_free_queue)
    psp_assoc_free()
      kfree(pas);

The kfree(new) on the psp_assoc_set_tx() error path also frees an object
that already holds a copy of the live Rx key.

Neither path uses kfree_sensitive() or memzero_explicit(), so the keys
stay in freed slab memory until that memory is reused. Since a rekey can
now happen while the connection stays up, this can repeat many times on
one socket.

The same pattern already existed before this patch, in psp_assoc_free()
and in the kfree(dummy) in psp_dev_tx_key_add(). Nothing in net/psp
zeroizes key material today. Reading these keys would also need a
separate kernel memory disclosure bug.

>  int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
>  			  u32 version, struct psp_key_parsed *key,
>  			  struct netlink_ext_ack *extack)

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-psp-v4-0-1a599df2aefa%40gmail.com

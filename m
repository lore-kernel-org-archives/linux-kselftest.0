Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6975123D2B1;
	Sat, 12 Sep 2026 00:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789172947; cv=none; b=CUsFZ423B1v5r/Go/EXd9Ju5uNAbgTYXvd5hVgVARBo1yfCtbTJoTusDeo8DXI/a/j8GXC+sOWNn+oXSe5ICaFRYfMFU6SAqRJFGXWTBY1gAIf2DWgEmzMlHDaECPKJmeI9ZLLbnTrJc3YYd5JyScrCu/qeriUodGK7MBXqLv3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789172947; c=relaxed/simple;
	bh=7V+1FQXJSpysw+tUgbWJ5tg5hki9iB3nsAHB4fDlLAg=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EjZKDujlL3+JS238kLti6g8udTUKsewX06ni0Re+pVKylMEnBG2/0QxJCC4ofUeAAPed8sRgyvzD/BzDcJRw6EVyuMkCwo/MzRIY2Zh554L6dMgVq0BUtl/xwyG7cIfVBN0LMfgmJgl0g2/2i1nO2FLnMsQUuiJdJ3q7ga2nvSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxqY6qAT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxqY6qAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C6B1F00893;
	Sat, 12 Sep 2026 00:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789172943;
	bh=cD53z2Pns1P+7sJ0xqddc3cQaAGdODJ7m6lHfTDi/ec=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AxqY6qATDQCLSJCQ4yaaGmRALvwGp72k0e0KXFiZSzzQaARaBBn+VyfNdx5HbJDQO
	 wADi71gLgsxfFBGf2eEXQnOIyHYpJNY6Yk4EiQOuTjT0q4Jx2sJH7k4Cwtz1zuSh5j
	 DWaoP10hOe9VK0iGMklw7fBlLrWn75otHH2bozW0oRyU2Q7fTURB0qYo9NOsvDWMc5
	 n4LOlPF/9a+yydgb9R9XQ4YRFpxpeOmMaxjIlwzb4qt3pkVyNh4KPz6VtvMIq8cvaz
	 N8UNEuIwOWvVEG9cKqmIw0Kve75Q+eo9vNv/iPn+PDssRfBIwTiRmpUaUGByBpowLJ
	 LqRs7GkKW+IMA==
Subject: Re: [PATCH net 1/2] net: psp: avoid conflicts with skb->decrypted and
 sk_validate_xmit_skb()
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemdebruijn.kernel@gmail.com, andrew+netdev@lunn.ch, shuah@kernel.org,
 willemb@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 12 Sep 2026 00:29:01 +0000
Message-ID: <178917294180.219967.2431474539892551274@kernel.org>
In-Reply-To: <20260910-psp-ktls-fix-v1-1-e3f30aaeca4e@gmail.com>
References: <20260910-psp-ktls-fix-v1-1-e3f30aaeca4e@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] The new mutual-exclusion gate keys off
  `sk->sk_validate_xmit_skb`, a function pointer that is inherited…

--

net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb()

This adds a mutual exclusion gate so that a socket cannot carry both PSP
state and a TCP ULP, since the two conflict over skb->decrypted and
sk->sk_validate_xmit_skb(). The gate is applied in __tcp_set_ulp() and in
psp_sock_assoc_set_rx().

> diff --git a/include/net/sock.h b/include/net/sock.h
> index 51185222aac29..ba5e5092f192c 100644
> --- a/include/net/sock.h
> +++ b/include/net/sock.h
> @@ -2312,6 +2312,17 @@ static inline void sk_gso_disable(struct sock *sk)
>  	sk->sk_route_caps &= ~NETIF_F_GSO_MASK;
>  }
>  
> +static inline bool sk_has_validate_xmit_skb(const struct sock *sk)
> +{
> +#ifdef CONFIG_SOCK_VALIDATE_XMIT
> +	return !!sk->sk_validate_xmit_skb;
> +#else
> +	return false;
> +#endif
> +}

[Severity: Medium]
Is sk_validate_xmit_skb a reliable indicator of live per-socket state here?
The field sits after sk_dontcopy_end in struct sock, so sock_copy() copies
it verbatim into a cloned socket, and neither sk_clone() nor
inet_csk_clone_lock() resets it.  By contrast, sk_clone() does explicitly
clear the PSP association:

net/core/sock.c:sk_clone() {
	sock_copy(newsk, sk);
	...
#if IS_ENABLED(CONFIG_INET_PSP)
	RCU_INIT_POINTER(newsk->psp_assoc, NULL);
#endif

So a socket accepted from a listener that had PSP Tx state installed ends up
with sk_validate_xmit_skb == psp_validate_xmit while psp_assoc == NULL, and
sk_has_validate_xmit_skb() then reports true for a child that has neither a
PSP association nor a ULP.

Can PSP state be installed on a listening socket in the first place?  The only
socket check before installation appears to be in psp_nl.c:

net/psp/psp_nl.c:psp_assoc_device_get_locked() {
	...
	if (!sk_is_tcp(socket->sk)) {

and neither psp_sock_assoc_set_rx() nor psp_sock_assoc_set_tx() inspects
sk_state, while psp_sock_assoc_set_tx() does:

net/psp/psp_sock.c:psp_sock_assoc_set_tx() {
	...
	WRITE_ONCE(sk->sk_validate_xmit_skb, psp_validate_xmit);

> +
> +bool sk_has_decrypt_user(const struct sock *sk);
> +
>  static inline int skb_do_copy_data_nocache(struct sock *sk, struct sk_buff *skb,
>  					   struct iov_iter *from, char *to,
>  					   int copy, int offset)
> diff --git a/net/core/sock.c b/net/core/sock.c
> index fa60b7494c586..9489d9c479493 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c

[ ... ]

> @@ -2670,6 +2671,12 @@ void sk_setup_caps(struct sock *sk, struct dst_entry *dst)
>  }
>  EXPORT_SYMBOL_GPL(sk_setup_caps);
>  
> +bool sk_has_decrypt_user(const struct sock *sk)
> +{
> +	return psp_sk_assoc(sk) ||
> +	       (sk_is_inet(sk) && inet_csk_has_ulp(sk)); /* for tls */
> +}
> +
>  /*
>   *	Simple resource managers for sockets.
>   */
> diff --git a/net/ipv4/tcp_ulp.c b/net/ipv4/tcp_ulp.c
> index 2aa442128630e..f3e0c9d379bb6 100644
> --- a/net/ipv4/tcp_ulp.c
> +++ b/net/ipv4/tcp_ulp.c
> @@ -136,6 +136,10 @@ static int __tcp_set_ulp(struct sock *sk, const struct tcp_ulp_ops *ulp_ops)
>  	if (icsk->icsk_ulp_ops)
>  		goto out_err;
>  
> +	err = -EINVAL;
> +	if (sk_has_decrypt_user(sk) || sk_has_validate_xmit_skb(sk))
> +		goto out_err;
> +

[Severity: Medium]
For such an accepted child, sk_has_decrypt_user() returns false (psp_assoc is
NULL and there is no ULP yet), but sk_has_validate_xmit_skb() returns true
from the inherited pointer, so setsockopt(TCP_ULP) now fails with -EINVAL for
every socket accepted from that listener.

Before this patch the stale pointer was harmless, since psp_validate_xmit()
reads the association from the skb extension and treats a NULL association as
good.  Should the check key off live per-socket state via psp_sk_assoc()
instead, or should sk_validate_xmit_skb be cleared in sk_clone() next to the
existing psp_assoc reset?

>  	if (sk->sk_socket)
>  		clear_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
>  
> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index 1a2a6b7516b0f..509035617894a 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -143,6 +143,10 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
>  		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
>  		err = -EBUSY;
>  		goto exit_unlock;
> +	} else if (sk_has_decrypt_user(sk) || sk_has_validate_xmit_skb(sk)) {
> +		NL_SET_ERR_MSG(extack, "Socket has incompatible state");
> +		err = -EINVAL;
> +		goto exit_unlock;
>  	}

[Severity: Medium]
The same inherited pointer hits this branch too: the psp_sk_assoc(sk) test
above passes because the child's association was cleared, then this else-if
fires on sk_validate_xmit_skb and returns -EINVAL with "Socket has
incompatible state".  Does that mean PSP itself can no longer be set up on any
socket accepted from a listener that had PSP Tx state?

Also worth noting on reachability: PSP_CMD_RX_ASSOC and PSP_CMD_TX_ASSOC carry
only GENL_CMD_CAP_DO in net/psp/psp-nl-gen.c, without GENL_ADMIN_PERM, so a
process with access to the PSP device can install the association on a
TCP_LISTEN fd.  On a listener the preconditions in psp_sock_assoc_set_tx()
hold: psp_sock_recv_queue_check() walks empty queues and returns 0,
tcp_write_collapse_fence() is a no-op on the empty write queue, and
icsk_sync_mss is tcp_sync_mss from tcp_init_sock().

The follow-up commit in the series, "selftests: drv-net: psp: test PSP and TCP
ULP mutual exclusion", only touches tools/testing/selftests, so this case does
not appear to be addressed later in the series.

>  
>  	refcount_inc(&pas->refcnt);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260910-psp-ktls-fix-v1-0-e3f30aaeca4e%40gmail.com

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C44BFE70;
	Wed, 16 Sep 2026 23:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600397; cv=none; b=EnaLb65Ab6FNDhchz/9Zuu69AP3Qp5K+CU5bXPCT2kTfL/o9df6aIrt9gOmGg0TNSaeq9xZD8XnWhY6eiuahiHAOhR/LqujwlxIGnH5Zsw8yIoMpyqYes8oXCvMeUqWdPnQvxJmHjoRM9NKnhRnW4asbdzLyXoHvli6RzPvUifA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600397; c=relaxed/simple;
	bh=hjkGM2zdmuCse4dU+00e59Su7KRbR8CtdDg/PSnVGNs=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EvLcDw0d4FWFNDWKFLwLMoxTwWfC1/Lnwi0IGVGJxCbf7dKxv4q5hKOIzRJ9bsAfyNy4Dp9JaeCflJGwG1AfC34bWyD/vkxhCtiVMCc0PaEI/J69xC/574dlkqX5Dpk+ZzM5u2/+lAksZSL3lanRxPkwVp5OLkGy8PEAs0NnzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5eE6isa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5eE6isa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0591F00893;
	Wed, 16 Sep 2026 23:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789600395;
	bh=zgwACDUmsEsIZFeLuEO6jSWesbf2TJU2npHT53JnMoM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T5eE6isaGXNzlgz0pSAEEHsqpPajk7xpGyoibp2oC5I4G4yRQG3HMAf4XbSfbduSM
	 l4SrVJ7sUDAzUvehhHneUES8//96YtBy5e5wOPuN5c9+av5maqJNreXMW/d5qRJBY6
	 8WJqnTcn973qaumt9BTemYfvd8hEZiwOPr4UDlkeGf2bgyZLAITg8cgAW8uT8NtPHN
	 WxAyR+05jtwTgI2mwz8z5wQLGF5oAMEIkMyvlqZBnQ1vFGdMkwRGv4ufb8Gp1IBsHp
	 v0wRadUCuOpkbk+219FIAZL4M9yNr5+gCvjHuS4fqiQAsYsrBmXoffNqdmklxstDWD
	 ul1AVDjskjmlA==
Subject: Re: [PATCH net v2 1/2] net: psp: avoid conflicts with skb->decrypted
 and sk_validate_xmit_skb()
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemdebruijn.kernel@gmail.com, andrew+netdev@lunn.ch, shuah@kernel.org,
 willemb@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Wed, 16 Sep 2026 23:13:14 +0000
Message-ID: <178960039456.22033.8739239860645875280@kernel.org>
In-Reply-To: <20260915-psp-ktls-fix-v2-1-0eedc3b148ec@gmail.com>
References: <20260915-psp-ktls-fix-v2-1-0eedc3b148ec@gmail.com>
X-sashiko-severity: Low
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

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] The patch adds a new, user-visible restriction to two already-
  shipped interfaces without updating Documentation/networking/psp.rst:…

--

net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb()

This makes PSP and TCP ULPs mutually exclusive, since PSP and TLS both use
skb->decrypted and sk->sk_validate_xmit_skb(). A new helper
sk_has_decrypt_user() is added and checked from both __tcp_set_ulp() and
psp_sock_assoc_set_rx().

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
> index 2aa442128630e..b58045df101e5 100644
> --- a/net/ipv4/tcp_ulp.c
> +++ b/net/ipv4/tcp_ulp.c
> @@ -136,6 +136,10 @@ static int __tcp_set_ulp(struct sock *sk, const struct tcp_ulp_ops *ulp_ops)
>  	if (icsk->icsk_ulp_ops)
>  		goto out_err;
>  
> +	err = -EINVAL;
> +	if (sk_has_decrypt_user(sk))
> +		goto out_err;
> +
>  	if (sk->sk_socket)
>  		clear_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
>  
> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index 1a2a6b7516b0f..e9b53eedf8dba 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -143,6 +143,10 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
>  		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
>  		err = -EBUSY;
>  		goto exit_unlock;
> +	} else if (sk_has_decrypt_user(sk)) {
> +		NL_SET_ERR_MSG(extack, "Socket has incompatible state");
> +		err = -EINVAL;
> +		goto exit_unlock;
>  	}

[Severity: Low]
Should Documentation/networking/psp.rst be updated along with this?

Two already-shipped interfaces grow a new failure mode here:
psp_sock_assoc_set_rx() now returns -EINVAL for the rx-assoc netlink
command, and __tcp_set_ulp() now returns -EINVAL for
setsockopt(TCP_ULP).

The "Securing a connection" section enumerates the restrictions of the
rx-assoc/tx-assoc sequence:

	PSP encryption is currently only supported for TCP connections.
	Rx and Tx keys are allocated separately. First the ``rx-assoc``
	Netlink command needs to be issued, specifying a target TCP socket.

but does not mention that a socket with a ULP attached is now rejected.

The "User facing API" section also suggests a TLS-then-PSP bootstrap:

	The expectation is that higher layer protocols will take care of
	protocol and key negotiation. For example one may use TLS key exchange,
	announce the PSP capability, and switch to PSP if both endpoints
	are PSP-capable.

and "Kernel implementation notes" says PSP "follows the TLS offload more
closely ... and the use of skb->decrypted", with nothing stating that kTLS
and PSP can no longer share a socket.

One more thing worth spelling out in the docs: the check is not restricted
to TLS. inet_csk_has_ulp() only tests icsk_ulp_ops, so any registered TCP
ULP blocks rx-assoc, which is broader than the subject line suggests. The
commit message explains this is intentional, but nothing in-tree tells
userspace about it.

The follow-up patch in the series ("selftests: drv-net: psp: test PSP and
TCP ULP mutual exclusion") adds tests for both directions but does not
touch Documentation/, so the gap remains at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915-psp-ktls-fix-v2-0-0eedc3b148ec%40gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794766560;
	b=cgutWME+5xCYvyEZQXATOtCwCp6Zce7x30YaSL1aLBNecN4kcZkOzKKqlydUg7QhEZam
	 2AHp1yjESWSM4JFdd2ALq12IGcs/GuM5YstF9upoLP1Kc1lgFJvmTKIi7fr+KC+VlpPvj
	 hxBIfNk3E0zj8Zzzl55Mrn+4PtnFOxke16zMU8NV1lm6ihIjj/oTiO98Jp/890vQSLctm
	 fUkQuVSVZiIV3HMlYtZ8o4LzsvIGXMAeID6rxY2hrOM4ICp7enT4BDXJkAw6oN0ABI6O4
	 o9/qLWnrb9Fh2s1qpoobOzAQ4wcZCG893NaqZtVrNc461FO1q5EoQc3tSulfwAkpVhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766560;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ALqxl7BK5WNsyNSlxc602DJmMV8b2cEMDj7sWULgqJM=;
	b=c6iQtZqFnwhMixfyYYDeRSFhFER1y7Rfftu5M9qsdV6WOMyVjYgbbKAd9M3E5mOE3Thf
	 9c9UoSf8XQPmvSHoUvWDZV61EPIGVcTLunnttbZnjfAsdFCxol8HL27BLqt/f831O6no2
	 RgnltkjkoMGYCpVWIbBAyKthMfRJCFy7lxdZWKZsqPYCncctTAiUY+4j9sbjc6N48V1dw
	 Zsy6HEBbVuUSjr1yEkbcCxljcP+W023He31LZgjiMYsfIZsRO2brUrxUtFkkKZk5TpmUy
	 LTmVT2MVgNgSgycSlH748Bh/Nf+iLdrfrEbXp1ivkw9GoHcyM1nZRCqKDtgwa+J7Yyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dv1RhaD/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F66606A31F;
	Sun, 15 Nov 2026 18:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dv1RhaD/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5271F000C4;
	Sun, 15 Nov 2026 18:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794766559;
	bh=ALqxl7BK5WNsyNSlxc602DJmMV8b2cEMDj7sWULgqJM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dv1RhaD/uIlDqLMwurh+RmZLMkdy2CWEBTSoQgalFD4PzOpkaeSVp7+wQkbfSmjaA
	 kfC+yPhSpdU5w8X6cvkGhvT4mtvKYWM2XKWOZtkLkNCxgTVlCxvodOuF79HLW+5Ftr
	 SQ2bpkfEUhXgl9A8n4qflWSCcLmpyTygZoX78AhdTPJJG8BBMWWqRB+o4fMJbtCY9G
	 gpDN92OLyXFWsIy0Lsy0FYIa0sQ6xHhH0hdkRFkZj9Wd5Mpr8jzMv3yZyb8TQkf20e
	 bILxJtxTbB3nrC4cF+NlRlf3WMNFCgDvijn01eTbajK4aWu9fiHjvvJ0siejFtdmDG
	 JUKRZXaMsJT0g==
Subject: Re: [PATCH net v2 1/2] tcp: Fix the SO_REUSEPORT bind cache admitting
 a conflicting socket
From: netdev-bot+sashiko@kernel.org
To: juanagusnicco@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 josef@toxicpanda.com, jbacik@fb.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 18:15:58 +0000
Message-ID: <179476655840.3136.16698637030692656920@kernel.org>
In-Reply-To: <20261111174704.24312-2-juanagusnicco@gmail.com>
References: <20261111174704.24312-2-juanagusnicco@gmail.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix still lets the SO_REUSEPORT bind cache admit a
  conflicting socket.

--

tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket

This commit adds fast_sk_reuse and fast_bound_dev_if to struct
inet_bind_bucket. In the FASTREUSEPORT_STRICT state, sk_reuseport_match()
now skips the bind conflict check only when the new socket matches the
cached socket's family, IPV6_V6ONLY, bound device and SO_REUSEADDR.

> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> index e56beec438773..70b8662b30048 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -420,13 +420,18 @@ static inline int sk_reuseport_match(struct inet_bind_bucket *tb,
>  		return 0;
>  	if (!uid_eq(tb->fastuid, sk_uid(sk)))
>  		return 0;
> -	/* We only need to check the rcv_saddr if this tb was once marked
> +	/* We only need to check the fast_* fields if this tb was once marked
>  	 * without fastreuseport and then was reset, as we can only know that
> -	 * the fast_*rcv_saddr doesn't have any conflicts with the socks on the
> -	 * owners list.
> +	 * the socket they describe doesn't have any conflicts with the socks
> +	 * on the owners list.
>  	 */
>  	if (tb->fastreuseport == FASTREUSEPORT_ANY)
>  		return 1;
> +	if (tb->fast_sk_family != sk->sk_family ||
> +	    tb->fast_ipv6_only != ipv6_only_sock(sk) ||
> +	    tb->fast_bound_dev_if != sk->sk_bound_dev_if ||
> +	    tb->fast_sk_reuse != sk->sk_reuse)
> +		return 0;

[ ... ]

> @@ -482,6 +489,8 @@ void inet_csk_update_fastreuse(const struct sock *sk,
>  				tb->fast_rcv_saddr = sk->sk_rcv_saddr;
>  				tb->fast_ipv6_only = ipv6_only_sock(sk);
>  				tb->fast_sk_family = sk->sk_family;
> +				tb->fast_sk_reuse = sk->sk_reuse;
> +				tb->fast_bound_dev_if = sk->sk_bound_dev_if;
>  #if IS_ENABLED(CONFIG_IPV6)
>  				tb->fast_v6_rcv_saddr = sk->sk_v6_rcv_saddr;
>  #endif

[Severity: High]
Can a socket that never went through a bind conflict check still fill the
STRICT cache?

The rewritten comment in sk_reuseport_match() assumes the cached socket
has no conflicts with the sockets on the owners list.

__inet_inherit_port() breaks that assumption. When the child's port
differs from the listener's bucket port (the TPROXY redirect case
described in the NOTE there), it calls inet_csk_update_fastreuse() for
the child. It never checks the child against the owners of the target
bucket:

net/ipv4/inet_hashtables.c:__inet_inherit_port() {
    ...
	if (tb->port != port) {
		...
		update_fastreuse = true;

		goto bhash2_find;
    ...
	if (update_fastreuse)
		inet_csk_update_fastreuse(child, tb, tb2);
    ...
}

The child copies sk_reuseport and sk_uid from the listener, and
sk_clone_lock() clears sk_reuseport_cb.

Suppose a listener without SO_REUSEPORT owns the target port. Then
tb->fastreuseport is 0 and sk_reuseport_match() returns 0. The else
branch above therefore resets the bucket to FASTREUSEPORT_STRICT with the
child's uid, address, family, v6only, sk_reuse and bound_dev_if.

One possible sequence:

1. user B, no SO_REUSEPORT: bind(0.0.0.0:P), listen()
   tb(P)->fastreuseport is 0

2. TPROXY steers a connection for X:P to listener L (user A,
   SO_REUSEPORT) on port Q
   __inet_inherit_port()->inet_csk_update_fastreuse() puts the child
   in tb(P), which becomes STRICT with fast_rcv_saddr = X and
   fastuid = A

3. user A sets SO_REUSEPORT (plus IP_FREEBIND if X is not local), uses
   the same family, v6only, device and SO_REUSEADDR as the child, and
   calls bind(X:P)
   inet_csk_get_port()->sk_reuseport_match() returns 1, so
   check_bind_conflict = false

4. user A calls listen()
   get_port() matches again and skips inet_bhash2_addr_any_conflict()
   and inet_csk_bind_conflict() again

A full check would return EADDRINUSE here, because inet_bind_conflict()
sees !sk2->sk_reuseport for user B's listener.

The new field comparisons cannot catch this, since the cached values
really do belong to the child. The setup needs a TPROXY rule configured
with CAP_NET_ADMIN, and the attacker has to run as the proxy listener's
uid. The final bind() and listen() need no privilege.

The selftest patch that follows in this series does not touch kernel
code, so this path is still open after the whole series.

Should an inherited child be kept out of the STRICT cache unless it was
conflict-checked? For example, this path could set tb->fastreuseport = 0
instead of resetting the cache to the child's attributes.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111174704.24312-1-juanagusnicco%40gmail.com

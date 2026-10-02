Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C32773E4;
	Fri,  2 Oct 2026 02:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909274; cv=none; b=l00CuVU+JXFEjVl0Egfm/ake5EfL9XkZJIB7FL9nWL+Ef5BQiDgmqzZoSAxbMfV6luK15iMTNyIM7HG9+eze24mvAMNQWzcGcj80qk4Yz/xE+WrfOFSDRm+xKO/PjWheE0d68jXDbqbPL336rO88JNVeY0/owMjaRyPuOR/FR6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909274; c=relaxed/simple;
	bh=bWQMMjFCLJT+LQY/dD+5ZU3Or6kaEjdJyJk1c22aGww=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jVuMIdxDKe5clvZUrWCIbFs5Cq1wQ/C0rajnVrB8fPYY/Mu+ivIq5JJFo5ngpbM0CJlw2skL+FeH19UxAFXtSz7OyjHd6jeJYsSOANXhDVQQWxyHOCcJytkw3YAzVV9O/HZV1N+XzgdglkhBQeZ+yhR8D6hoR46rBARZ95OHIUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d118uBz0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d118uBz0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7DE11F000FF;
	Fri,  2 Oct 2026 02:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790909272;
	bh=VNJsfJYPtH/XEbZiMG8LbvQ/0uU2Ul/ZxmyfHAlvgds=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d118uBz0ho9ne0gOJwGjydTXeDMv646EX29yD7bYIedcTXtDD+Fk7chPEG2qZjCW2
	 S8zVJJAyKlN2PFz80dcikT+o9EwPl4zwc6eWIZ6rIW/yO8hHqntRhUIM3calfCDUIy
	 kjr8vKrQoJqIIEVMw/jmqqBtw1ayk9cwZh09+jAvKiCm7dyFo0t/b+b4XKoXFNiJKQ
	 jw+wj+3re1fYJ1se6bb8nox7pXDEsiZaWB/vhRm4VR5+Ap93Ze70PGMtwS7Wd+HIOb
	 QsZGjQlQ2ZOm5wQiYgaMJ8N8lhjcZlUs2zh3CTYCbqUPcCNZy1FEDKSGOxDjIcUi0X
	 PZh6qJlyoVatQ==
Subject: Re: [PATCH net-next v2 2/4] net: psp: require an established
 connection for association setup
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 willemdebruijn.kernel@gmail.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, kuniyu@google.com,
 willemb@google.com, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Date: Fri, 02 Oct 2026 02:47:51 +0000
Message-ID: <179090927139.434549.15378852090892678294@kernel.org>
In-Reply-To: <20260930-psp-defeat-v2-2-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-2-f266e7447129@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new check in psp_sock_assoc_set_rx()
  (net/psp/psp_sock.c:162) rejects every state other than…
- [Low] The commit message says the new sk_state check in
  psp_sock_assoc_set_tx() (net/psp/psp_sock.c:261) fixes a bug from…
- [Low] The new psp.rst text (lines 139-141) says "connect() on a socket
  that has PSP assoc state will return -EINVAL".

--

net: psp: require an established connection for association setup

This commit makes the PSP rx-assoc and tx-assoc handlers reject sockets
that are not in TCP_ESTABLISHED. It also makes tcp_v4_connect() and
tcp_v6_connect() return -EINVAL when PSP assoc state already exists, and
drops the PSP overhead from icsk_ext_hdr_len in the connect paths.

> diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
> index 4ac09e64e95a5..0f9b6b73f2447 100644
> --- a/Documentation/networking/psp.rst
> +++ b/Documentation/networking/psp.rst
> @@ -132,6 +132,14 @@ numbers in a way that deletes a prefix of the PSP protected part of
>  the TCP stream. If userspace cares to mitigate this type of attack, a
>  special "start of PSP" message should be exchanged after ``tx-assoc``.
>  
> +Upgrade to PSP must be done on established TCP connections.
> +``rx-assoc`` and ``tx-assoc`` will return ``-ENOTCONN`` if
> +``sk_state`` is not ``TCP_ESTABLISHED``.
> +
> +The PSP assoc state of a socket is not reset when the connection is
> +torn down. ``connect()`` on a socket that has PSP assoc state will
> +return ``-EINVAL``.

[Severity: Low]
Is the -EINVAL statement accurate for most connect() calls on a socket
with assoc state?

rx-assoc and tx-assoc now require TCP_ESTABLISHED, so a socket with
assoc state has sock->state == SS_CONNECTED. __inet_stream_connect()
returns before it gets to sk_prot->connect():

net/ipv4/af_inet.c:__inet_stream_connect() {
    ...
	switch (sock->state) {
	default:
		err = -EINVAL;
		goto out;
	case SS_CONNECTED:
		err = -EISCONN;
		goto out;
    ...
}

FIN or RST teardown leaves sock->state at SS_CONNECTED, and
psp_sk_assoc_free() only runs from inet_sock_destruct(). That means the
new psp_sk_assoc() checks in tcp_v4_connect() and tcp_v6_connect() can
only be reached after an explicit connect(AF_UNSPEC) disconnect. Every
other case returns -EISCONN.

Should the documentation say that -EINVAL applies to reconnect attempts
after an AF_UNSPEC disconnect?

> +
>  Rotation notifications
>  ----------------------
>  

[ ... ]

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index a9cfeebe4ba1b..a6b1c42dd626f 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -159,6 +159,12 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
>  
>  	lock_sock(sk);
>  
> +	if (sk->sk_state != TCP_ESTABLISHED) {
> +		NL_SET_ERR_MSG(extack, "Socket must be in established state");
> +		err = -ENOTCONN;
> +		goto exit_unlock;
> +	}
> +

[Severity: Medium]
This check in psp_sock_assoc_set_rx() rejects every state except
TCP_ESTABLISHED. The commit message only justifies this with closed and
listen sockets. Does it also remove cases that could have users?

A TCP Fast Open server child returned by accept() can still be in
TCP_SYN_RECV. It already has a dst from tcp_v4_syn_recv_sock() or
tcp_v6_syn_recv_sock(), and it is the same socket that later becomes
ESTABLISHED. The point that the child does not inherit PSP state doesn't
apply to it. On that socket, rx-assoc now succeeds or fails depending on
when the final ACK arrives.

A TCP_FASTOPEN_CONNECT client also returns from connect() while it is
still in TCP_SYN_SENT.

The commit message also says:

  "establishing PSP state prior to connect() will result in a
   PSP-encrypted TCP SYN sent to a listening peer"

Is this true when only the Rx key is installed? The SYN is built by
tcp_init_nondata_skb(), which calls psp_enqueue_set_decrypted():

include/net/psp/functions.h:psp_enqueue_set_decrypted() {
	...
	pas = psp_sk_assoc(sk);
	if (pas && pas->tx.spi)
		skb->decrypted = 1;
}

With only an Rx key, the SYN goes out in plaintext.
__psp_sk_rx_policy_check() accepts plaintext as long as no Tx key is
set:

	if (!pse) {
		if (!pas->tx.spi ||
		    (!pas->peer_tx && psp_is_allowed_nondata(skb, pas)))
			return 0;
	}

So the handshake completes normally, and tx-assoc can follow once the
connection is ESTABLISHED. With an explicit dev-id,
psp_assoc_device_get_locked() allows rx-assoc on a socket that has not
called connect() yet.

Before this patch, setting up only the Rx key before connect() appeared
to work. Should the commit message and psp.rst say that this sequence
and the TFO cases are being removed as well?

>  	if (psp_sk_assoc(sk)) {
>  		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
>  		err = -EBUSY;
> @@ -252,6 +258,12 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
>  
>  	lock_sock(sk);
>  
> +	if (sk->sk_state != TCP_ESTABLISHED) {
> +		NL_SET_ERR_MSG(extack, "Socket must be in established state");
> +		err = -ENOTCONN;
> +		goto exit_unlock;
> +	}
> +

[Severity: Low]
The commit message says this check fixes a bug from commit 6b46ca260e22
("net: psp: add socket security association code"), but the patch has
no Fixes: tag. Could the tx-assoc check be split out and sent to net
with a Fixes: tag?

After tcp_time_wait(), psp_twsk_init() makes the timewait socket share
the same assoc:

net/psp/psp_sock.c:psp_twsk_init() {
	...
	if (pas)
		refcount_inc(&pas->refcnt);
	rcu_assign_pointer(tw->psp_assoc, pas);
	...
}

The original sk is then in TCP_CLOSE with sk->psp_assoc still set. If
only the Rx key was installed, the old psp_sock_assoc_set_tx() accepted
the request. psp_sock_set_tx_key() then wrote pas->tx, pas->upgrade_seq
and pas->drv_data. Meanwhile the timewait socket reads pas->tx.spi
without locks from softirq, in psp_twsk_rx_policy_check() and
psp_reply_set_decrypted().

The commit message says the patch targets net-next because it depends on
commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between ehash
and lhash2."). That dependency only matters for the rx-assoc and listen
socket part. The tx-assoc state check works without it.

As posted, stable kernels with PSP would keep this race, and backporters
would have nothing pointing them to the fix.

>  	pas = psp_sk_assoc(sk);
>  	if (!pas) {
>  		NL_SET_ERR_MSG(extack, "Socket has no Rx key");

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260930-psp-defeat-v2-0-f266e7447129%40gmail.com

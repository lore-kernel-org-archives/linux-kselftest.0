Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482F51D416C;
	Sun, 27 Sep 2026 01:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790472681; cv=none; b=las+hzUZKKfsFoTf7OIO/ocaMQKkGJFA+dBfe/lqJ+nfu4q2/owZ3sYSwcAjWfi/9ec65b12mF72FuIc3fC4oIJkP5dl5+9X87NRj4/bIMXBj0AYouwKUR8dRf8aGkNtxNOh6gej9Kz+gihlw0alq+PrE2GHJDEp6pkKAgjDLLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790472681; c=relaxed/simple;
	bh=IUDk3OXEOO/29J2HyHmyw5NbxDmAKQO1MPGfTHJG+NY=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gra9ndLP5P2xM99v6UhttnLtFyg9IcjwRilvInh/sQ5U7esfexs8Fq1WrDkxtL9aqrr/c8x+0DAtSxZgNLc7CbsQFZ87i7z54VvZUda0vwSe+bWo4C/Od3JJtwf9ET9sjtKS2SHJvfCVtFtuNZLxyms9h9AsK7f7VdU0sIA+ZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3QAbfAE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3QAbfAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECFB1F000FF;
	Sun, 27 Sep 2026 01:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790472679;
	bh=KMt6xvQWy01OPrvR1c7Utr1iExem1j9ytI83aTpxV14=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=H3QAbfAEIPpwhMzQBIunposN6WlghxJKG3cYzWMCiFVNXm+dUNXyaRSXQQ07cxqch
	 yq6GklXUTiYlN+lj64Z/DBBhr7fid0VPRElCcbpU6hAEcZeG4qXHiuGTNb7tcT1UHi
	 SQxAI0/T83+wZlycP+9dUI8jcBfNtHGUmbJdWEsD1n1fGE1oLHDsyt0YMnOaIoL859
	 MloEj/xAsAeXSDLho+aso/DXf+3E3TDgM83PiSF2YItVdMu1YQO+O79jwNgn8q03tI
	 PKiJfbSc6I/VtdBzGzu/Fh0yn2nDmsFt7rJI9FpXPfj5Ta8aX3mdyDCIxH44/v+D97
	 do2VRFdBLPziA==
Subject: Re: [PATCH net-next 2/4] net: psp: require an established connection
 for association setup
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 willemdebruijn.kernel@gmail.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, kuniyu@google.com,
 willemb@google.com, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Date: Sun, 27 Sep 2026 01:31:18 +0000
Message-ID: <179047267826.2160803.3880931721750245623@kernel.org>
In-Reply-To: <20260925-psp-defeat-v1-2-9f0b430107aa@gmail.com>
References: <20260925-psp-defeat-v1-2-9f0b430107aa@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new `sk->sk_state != TCP_ESTABLISHED` check in
  psp_sock_assoc_set_tx() (net/psp/psp_sock.c:261-265) does not close…
- [Low] The commit message says the tx-assoc check 'fixes a bug in commit
  6b46ca260e22 ("net: psp: add socket security association code")', but…
- [Low] Baseline decision: false positive, kept only because
  requires_validation=true.

--

net: psp: require an established connection for association setup

With this commit, rx-assoc and tx-assoc return -ENOTCONN unless the socket
is in TCP_ESTABLISHED when checked under the socket lock. It also documents
that the upgrade to PSP must happen on an established connection, and that
disconnecting a socket with PSP assoc state is unsupported. The commit
message describes the tx-assoc check as a fix for an unsynchronized write
to an assoc shared with a timewait socket.

> The check in the tx-assoc path fixes a bug in commit 6b46ca260e22 ("net:
> psp: add socket security association code") where an unsynchronized
> write can be performed an assoc shared with a timewait socket when the
> socket is in TCP_CLOSE after shutdown. This commit is not included in
> net, because its premise of preventing listen sockets from holding assoc
> state depends on the net-next commit 8cc3aef0cb19 ("tcp: Do not allow
> buggy transitions between ehash and lhash2.")

[Severity: Low]
This is described as a fix for 6b46ca260e22, so should it carry a Fixes:
tag? Documentation/process/maintainer-netdev.rst says the Fixes: tag is
required for fixes regardless of the tree.

The dependency on 8cc3aef0cb19 explains why this goes to net-next. That
dependency is about listen sockets, though. The tx-assoc case of TCP_CLOSE
after shutdown does not seem to involve ehash/lhash2 transitions.

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index a9cfeebe4ba1b..a6b1c42dd626f 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c

[ ... ]

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

[Severity: High]
Does this check fully close the timewait sharing problem that the commit
message describes? A socket can return to TCP_ESTABLISHED after it has
already shared its psp_assoc with a timewait socket.

psp_twsk_init() shares the assoc unconditionally, even when only the Rx
key is installed:

net/psp/psp_sock.c:psp_twsk_init() {
	struct psp_assoc *pas = psp_sk_assoc(sk);

	if (pas)
		refcount_inc(&pas->refcnt);
	rcu_assign_pointer(tw->psp_assoc, pas);
	...
}

tcp_disconnect() does not touch sk->psp_assoc. The new psp.rst text says
the same thing: "Disconnect on a socket after rx-assoc will leave a socket
that can be reconnected, but with potentially stale PSP assoc state
present".

rx-assoc and tx-assoc do not need admin permission, so this sequence looks
reachable:

  connect(fd, peer1)
  rx-assoc                       pas->tx.spi == 0
  shutdown(fd, SHUT_WR)
    peer FIN in FIN_WAIT2
    tcp_time_wait()
      inet_twsk_alloc()
        psp_twsk_init()          tw->psp_assoc = pas
    tcp_done()                   sk_state = TCP_CLOSE
  connect(fd, AF_UNSPEC)
    tcp_disconnect()             sk->psp_assoc left in place
  connect(fd, peer2)             cleartext SYN/SYN-ACK allowed, !tx.spi
                                 sk_state = TCP_ESTABLISHED
  tx-assoc                       passes the new check
    psp_sock_set_tx_key()
      psp_assoc_set_tx()
        memcpy(&pas->tx, key, sizeof(*key));
      pas->upgrade_seq = tcp_sk(sk)->rcv_nxt;

Only the new connection's socket lock is held for these writes. The old
timewait socket is still hashed, and packets from peer1 go through:

tcp_timewait_state_process()
  psp_twsk_rx_policy_check()
    __psp_sk_rx_policy_check()

That path reads pas->tx.spi and pas->upgrade_seq and writes pas->peer_tx,
with only RCU protection:

	if (!pse) {
		if (!pas->tx.spi ||
		    (!pas->peer_tx && psp_is_allowed_nondata(skb, pas)))
			return 0;
	}

Apart from the data race and possible torn reads, does the behavior of the
timewait socket also change? Once tx.spi is set for peer2, the timewait
socket would start dropping peer1's legitimate cleartext FIN retransmits
with SKB_DROP_REASON_PSP_INPUT.

On the timewait reply path, psp_reply_set_decrypted() would also see
pas->tx.spi != 0 and mark the ACK/RST replies to peer1 as decrypted.
psp_validate_xmit() then resolves tw->psp_assoc to the same pas, so those
old-flow replies would be PSP encapsulated with peer2's Tx key and SPI.

The new documentation calls disconnect unsupported, but nothing prevents
it. Would the fix need to check whether the assoc is actually shared, or
reset or refuse assoc state across disconnect, instead of relying only on
a socket state check?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925-psp-defeat-v1-0-9f0b430107aa%40gmail.com

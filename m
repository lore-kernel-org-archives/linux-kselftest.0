Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C8E406261;
	Mon,  5 Oct 2026 23:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791242546; cv=none; b=LAoBQSr7lyijc09TSAXWM8ueW+OIk5FSVyUR6wRIBrdbMrrKf05/hW7+nDKO4eLPsfG3fbcnkb1JE4e46IcxguSAmxuaSx0cm4YZ7WIDRI5XjVCQEG7Ro1qDJjIpKODehBKSEkccF59QlKk1dpjw2dhIq3jpxyOAHYp0UdvyzT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791242546; c=relaxed/simple;
	bh=6ebE/itixZZca8kVZZgrZOvx/bsvWjcUNW61xHshh2Q=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gU2qcC3tJlIPDg09McxoY1DlDRYnQjd/MJP2oYXgyjDXFPyJwmQTRDqQaGqLG42gspauUUuJfYmTMJhQ3lJpMUvYnUvYFxld//Wnn/Y1a1VkCcVX57wV3oyaGe8oCUES2KQ7XsOVQM8fRQZXr6JdkKUvLHNB5e+Ap2/wq1w0Sdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPqdPYUS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPqdPYUS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2941F000FF;
	Mon,  5 Oct 2026 23:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791242545;
	bh=9jtOZ5VL661UKyCCQ1f0rikYn1bprgEFKnlr/2UQEYc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BPqdPYUSgiNBHjSLnT4MjsPYtMZ/ao+FHWdMkyxkIjJcyNVRhpXuU5C45i8iTl8+s
	 VvgAERkfDPtXk3wstln+GoxYhYYDOFvcaOBa+zRZVxnQmZabonACIjN6ByFoziNAfV
	 plZYA+L/F24F/nBzOWC0qKVlc1K1Nh+1aD/svtGSERpYnl9d4Pv8sQLFAVLV6AeyZd
	 yIFe8uAdOf1NVgoWP6x5NwItu1C8uC6HR2OUm1v8R6TU6cmRwxLZxRT0Ogh+Zk99Qj
	 oyoe3ZoigO8cS5dxDvrO2h8iwQiD1DrgSo+1TzGveVP2pKtOXIb0r6Ilwo1oA3IqM4
	 aU8kJBMgm478g==
Subject: Re: [PATCH net-next v2 3/8] tls: consume empty data records in
 tls_sw_splice_read()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 05 Oct 2026 23:22:24 +0000
Message-ID: <179124254419.434549.8522300166361298125@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-3-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-3-2dd1947bb642@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This commit introduces a new blocking point in
  tls_sw_splice_read() (net/tls/tls_sw.c); a later patch in the series…
- [Medium] The new `goto retry` loop in tls_sw_splice_read()
  (net/tls/tls_sw.c:2069-2079 at this commit, 2088-2095 at the end of…

--

tls: consume empty data records in tls_sw_splice_read()

This patch makes tls_sw_splice_read() consume zero-length
application_data records and fetch the next record, so that callers no
longer see a false EOF. A signal_pending() check before each retry is
meant to keep the splicing task killable.

Closes: https://lore.kernel.org/netdev/akaoXcfamBp8_mYe@krikkit/

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index ee50b9028264c..79a807e51bc7d 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -2031,13 +2032,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  	if (err)
>  		goto splice_read_end;
>  
> +retry:
>  	if (!skb_queue_empty(&ctx->rx_list)) {
>  		skb = __skb_dequeue(&ctx->rx_list);
>  	} else {
>  		struct tls_decrypt_arg darg;
>  
>  		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
> -				      true, false);
> +				      released, false);

[Severity: Medium]
With the new goto retry below, can this wait now block on a socket that
has O_NONBLOCK set?

Here the only input to the nonblocking decision is
flags & SPLICE_F_NONBLOCK. On the socket-to-pipe path, do_splice() sets
that flag only from the output pipe:

fs/splice.c:do_splice() {
    ...
		if (out->f_flags & O_NONBLOCK)
			flags |= SPLICE_F_NONBLOCK;

		ret = splice_file_to_pipe(in, opipe, &offset, len, flags);
    ...
}

tcp_splice_read(), by contrast, honours the socket's own flag:

	timeo = sock_rcvtimeo(sk, sock->file->f_flags & O_NONBLOCK);

Before this patch, an empty record made splice return 0 right away. Now
the empty record is consumed and tls_rx_rec_wait() is called again with
a blocking timeout. It then sleeps until the peer sends another record,
and SO_RCVTIMEO has no limit by default.

Take an event loop with an O_NONBLOCK kTLS socket and a blocking pipe.
Could it hang in splice() after getting EPOLLIN for a single empty
record?

The later patch in this series, "tls: honor O_NONBLOCK in
tls_sw_splice_read()", appears to fix this. It computes nonblock from
both SPLICE_F_NONBLOCK and sock->file->f_flags. Could that patch be
ordered before this one, so the hang does not exist in the bisect
window? Or could the commit message at least mention it?

>  		if (err <= 0)
>  			goto splice_read_end;
>  

[ ... ]

> @@ -2060,6 +2065,19 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  		goto splice_requeue;
>  	}
>  
> +	/* Splicing zero bytes reads as EOF to the caller. */
> +	if (rxm->full_len == 0) {
> +		consume_skb(skb);
> +		if (signal_pending(current)) {
> +			long timeo;
> +
> +			timeo = sock_rcvtimeo(sk, flags & SPLICE_F_NONBLOCK);
> +			err = sock_intr_errno(timeo);
> +			goto splice_read_end;
> +		}
> +		goto retry;

[Severity: Medium]
How many consecutive empty records can this loop consume while it holds
the socket lock?

After each record, tls_rx_rec_done()->tls_strp_check_rcv() parses the
next one. On retry, tls_rx_rec_wait() sees tls_strp_msg_ready() return
true and skips its wait loop entirely.

When the receive queue runs dry, sk_flush_backlog() refills it, and the
loop breaks out before reaching sk_wait_event():

net/tls/tls_sw.c:tls_rx_rec_wait() {
	while (!tls_strp_msg_ready(ctx)) {
		...
		if (sk_flush_backlog(sk))
			released = true;
		if (!skb_queue_empty(&sk->sk_receive_queue)) {
			...
			tls_strp_check_rcv(&ctx->strp, false);
			if (tls_strp_msg_ready(ctx))
				break;
		}
		...
		ret = sk_wait_event(sk, &timeo,
				    tls_strp_msg_ready(ctx), &wait);
		...
}

sk_wait_event() is the only place where socket ownership is released.
__release_sock() drops only the slock spinlock, and it calls
cond_resched() only once every 16 backlog skbs.

The only exit is signal_pending(current), and that helps only the
splicing task.

Suppose a peer streams minimal empty application_data records (under 30
bytes each) at least as fast as they are decrypted. Could this:

  - leave other tasks that call lock_sock() on this socket (sendmsg,
    setsockopt, shutdown, close) stuck in uninterruptible sleep?

  - make the CPU busy-loop through back-to-back AEAD decrypts on
    !PREEMPT kernels?

  - pin a nonblocking event loop inside a single splice() call? The
    O_NONBLOCK fix later in the series does not seem to help, because
    nonblock only matters when no record is ready.

Before this patch, each splice(2) call handled at most one record and
then released the lock.

In the same series, "tls: bound consecutive no-data records in
tls_sw_read_sock()" caps this same pattern with TLS_RX_NODATA_LIMIT.
Should the splice path get a similar cap? At the end of the series this
loop still appears to have no limit.

> +	}
> +
>  	chunk = min_t(unsigned int, rxm->full_len, len);
>  	copied = skb_splice_bits(skb, sk, rxm->offset, pipe, chunk, flags);
>  	if (copied < 0)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-tls-follow-on-v2-0-2dd1947bb642%40kernel.org

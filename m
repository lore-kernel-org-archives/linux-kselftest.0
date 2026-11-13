Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528025;
	b=PwY5+dZOfQVN6jJ0NvcPxzG56nkuM2xK+h9jO4XfzLRsiwKxIEHbZPr7ZywvQC0+Vkjt
	 S2LMiYLWyxWt+7cIBdfW5xpDy5maXhvRzcB7+rXJb1h3xeCYafp0nD9WGYNhk9mOAx/c1
	 LBqVvzHq3J6Cj68k0szM6I3QPQoozTdlXgJD0LpMBkiqQTmIKWkbFC0blypGoMQgPUFNE
	 WUonJ8sa5QwLjg9rqLjJ2GOPWppgks82RVAyKnSvqHFI+udgxhE9G5gJJoiZ7SFqZTxHA
	 ZSfTvxKtZqxsm2jJ+/aMg6p+tjdHrCqaMkVWg/pxYTJCB4h7ShHkCXHfDi0hMggkOuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528025;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3fKTPaObLfsI/K0nIHQXB5gyzh34XnELd6l9fgF3nwA=;
	b=wvKD+ZikT9Ec5/+iMYyX1bRQEsGDfIIbJSXG7FjqwN3Og8bZzG9lfxWmMUrL/Tl6FINv
	 nnnY/9OWSqqa9OjM8WH1UgHSbHf+Xb7y05v5Isw7xhU9KL2Xbmc//W8ZDM0215n1DPQGg
	 6d9oF3FjZjqBh1UqggUxVeC0fVmq0rE4FWd8LSi5bSRqbtw3j+ZVzomZR9jBsu7rA1xsh
	 lQniXIJkK9Z3Ufyu9vuy4JDWYozqGdd5km3ME/Arex2BlgJwS2sLx7iuHHmPi0jMxirYd
	 PLTCjAJnSI7JkHTN2NjGxWBS3yQF3v+b9o0SIaMlmTRqRIqnheoB+FNKZPEdMNZXsPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlNe8WmM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC2C606A335;
	Fri, 13 Nov 2026 00:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlNe8WmM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E811F000C8;
	Fri, 13 Nov 2026 00:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794528024;
	bh=3fKTPaObLfsI/K0nIHQXB5gyzh34XnELd6l9fgF3nwA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hlNe8WmMjLzg/isKRIvGyPn6iC0EPPW68k58kVdJ/8T4f3Tm6ZqRLJ0hMmuSCS3tx
	 m5liCNvyr+8XwJB+CAh0s05wYZ0f43ME/GHe2r7m8pyDX6o10yWge5mmBeXrkKvFbe
	 Zi8exqdJzWhkgTCr20FXrh+6zoEdLuxXv9VcMHdSE9TcegsVKsb59LQViLqVczu3nA
	 NoJmnRr4MiY7JyFmzgHZRgL0wLU2VlqbfctJPdAovrzO8WbJzj5GWpeTk8xMT/IOjS
	 YqatRCMe+PQm/h490113aDtM/162fYt+dKku+BirFFqNfn4leT0pELRlQt2VctDGJf
	 alXAloP7w73Zw==
Subject: Re: [PATCH net 1/5] tls: break the connection after a burst of empty
 data records
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 sd@queasysnail.net, shuah@kernel.org, cel@kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 00:00:23 +0000
Message-ID: <179452802349.2199510.8387208380266716491@kernel.org>
In-Reply-To: <20261109175836.1246840-2-kuba@kernel.org>
References: <20261109175836.1246840-2-kuba@kernel.org>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The empty-record cap triggers on any backlog of empty records,
  not only on a fast burst.
- [Medium] In tls_sw_recvmsg() the MSG_PEEK path now frees zero-length
  records of every content type, not only empty application_data records.
- [Medium] The new cap 'breaks the connection' through
  tls_strp_abort_strp(&ctx->strp, -EBADMSG).

--

tls: break the connection after a burst of empty data records

This patch adds a per-read counter of consecutive empty application_data
records. When the counter passes 128, it stops the strparser with
-EBADMSG. It also makes recvmsg() decrypt empty records synchronously and
consume them, even with MSG_PEEK, instead of queuing them on rx_list.

Link: https://lore.kernel.org/all/20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org/

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 771e02bff5199..adf3b26b8a75f 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1582,6 +1584,19 @@ static int tls_rx_one_record(struct sock *sk, struct msghdr *msg,
>  	rxm->full_len -= prot->overhead_size;
>  	tls_advance_record_sn(sk, prot, &tls_ctx->rx);
>  
> +	/* A peer may send empty data records, e.g. as cover traffic, but
> +	 * a burst of them traps the reader in the kernel. Treat more than
> +	 * 128 in a row, without the reader sleeping or returning to the
> +	 * caller in between, as a protocol violation. Stop the strparser
> +	 * before the next record gets parsed, so the reader finds the
> +	 * error in tls_rx_rec_wait().
> +	 */
> +	if (rxm->full_len ||
> +	    tls_msg(darg->skb)->control != TLS_RECORD_TYPE_DATA)
> +		ctx->empty_run = 0;
> +	else if (unlikely(++ctx->empty_run > 128))
> +		tls_strp_abort_strp(&ctx->strp, -EBADMSG);

[Severity: Medium]
Can this cap also trip on a slow, legitimate sender when the local
application just stops reading for a while?

ctx->empty_run is reset in only two places. One is
tls_rx_reader_acquire(), at the start of each read call. The other is
tls_rx_rec_wait(), just before the reader sleeps:

net/tls/tls_sw.c:tls_rx_rec_wait() {
    ...
		if (!timeo)
			return -EAGAIN;

		ctx->empty_run = 0;
		released = true;
    ...
}

Suppose records pile up in sk_receive_queue while the application is
idle. The next recvmsg() finds every queued record already parsable, so
tls_rx_rec_wait() returns 1 without reaching that reset.
tls_rx_one_record() then counts every queued empty data record within
that single call.

For example, take a TLS 1.3 peer that sends padding-only cover traffic at
one record per second, which RFC 8446 allows. After about two minutes
without a read, more than 128 empty records would be queued. The next
read would get EBADMSG, and the strparser would stay stopped.

The commit message and the new comment describe this as a reaction to "a
burst" from a peer that is "either broken or malicious". Is the idle
reader backlog case meant to be covered as well? Also, no MIB counter is
incremented when this triggers.

[Severity: Medium]
Does this leave the socket in a state where only the first read learns
that the connection is broken?

tls_strp_abort_strp() sets strp->stopped, writes sk->sk_err once and
calls sk_error_report(). It does not set RCV_SHUTDOWN or SOCK_DONE, and
it records no persistent TLS error.

In the burst case nothing has been copied yet, so tls_rx_rec_wait() runs
with has_copied == false and returns sock_error(sk), which clears
sk_err:

	if (sk->sk_err) {
		if (has_copied)
			return -READ_ONCE(sk->sk_err);
		return sock_error(sk);
	}

After that, tls_strp_check_rcv() returns early because strp->stopped is
set, so msg_ready never becomes true again:

net/tls/tls_strp.c:tls_strp_check_rcv() {
	if (unlikely(strp->stopped) || strp->msg_ready)
		return;
    ...
}

A later blocking recvmsg() or splice() would then sleep in
sk_wait_event() on tls_strp_msg_ready(ctx). It would wake only on
SO_RCVTIMEO, a signal, or a FIN/RST from the peer, even if the peer keeps
sending data. A nonblocking reader would get -EAGAIN forever.

tls_sk_poll() also clears EPOLLIN, because rx_list is empty and
tls_strp_msg_ready() is false:

net/tls/tls_main.c:tls_sk_poll() {
    ...
	if ((skb_queue_empty_lockless(&ctx->rx_list) &&
	     !tls_strp_msg_ready(ctx)) ||
	    READ_ONCE(ctx->key_update_pending))
		mask &= ~(EPOLLIN | EPOLLRDNORM);
    ...
}

EPOLLERR also goes away once sk_err has been consumed. Could an
application that reads SO_ERROR on EPOLLERR before calling recv(), or
that retries after EBADMSG, end up hanging?

This seems to differ from the subject line and from this part of the
commit message:

  "The strparser is stopped before it parses the next record, so the
  reader gets the error from tls_rx_rec_wait() and no later record is
  delivered."

The existing read_failure abort in tls_rx_msg_size() has the same
weakness. This patch, though, adds a new trigger that legal records can
reach, and its stated behaviour depends on this mechanism. Does the abort
need a persistent error or EOF state, so that later reads and poll() see
the failure?

> +
>  	return tls_check_pending_rekey(sk, tls_ctx, darg->skb);
>  }
>  

[ ... ]

> @@ -1918,7 +1936,10 @@ int tls_sw_recvmsg(struct sock *sk,
>  
>  			DEBUG_NET_WARN_ON_ONCE(darg.skb == ctx->strp.anchor);
>  
> -			if (async) {
> +			/* Consume empty records, even when peeking, so that
> +			 * they cannot pile up on rx_list.
> +			 */
> +			if (async && chunk) {
>  				/* TLS 1.2-only, to_decrypt must be text len */
>  				chunk = min_t(int, to_decrypt, len);
>  				async_copy_bytes += chunk;
> @@ -1939,7 +1960,7 @@ int tls_sw_recvmsg(struct sock *sk,
>  			if (err < 0)
>  				goto put_on_rx_list_err;
>  
> -			if (is_peek) {
> +			if (is_peek && chunk) {
>  				peeked += chunk;
>  				goto put_on_rx_list;
>  			}

[Severity: Medium]
Does this also consume zero-length records that are not application data
when MSG_PEEK is set?

tls_rx_msg_size() accepts a zero-length non-data record (alert,
handshake, or any other type). In TLS 1.2 that means data_len ==
cipher_overhead. In TLS 1.3 it means the plaintext is only the inner
content type byte.

Such a record can only be the first one in a recvmsg() call. So
darg.async and async are both false, and chunk == rxm->full_len == 0.

Both of the new checks are then false:

	if (async && chunk) {
	...
	if (is_peek && chunk) {

so execution reaches consume_skb(skb) even though the caller passed
MSG_PEEK.

Before this patch, the record went onto rx_list. The next non-peek
recvmsg() then returned it, with its TLS_GET_RECORD_TYPE cmsg, through
process_rx_list(). Now the peek returns the cmsg and frees the record,
and the next real read returns the following record instead.

Non-data records don't seem to be part of the pile-up problem.
tls_rx_one_record() resets empty_run for them, and the loop already
breaks after a non-data record:

		if (control != TLS_RECORD_TYPE_DATA)
			break;

Should the consume path be limited to data records? For example:

	if (is_peek && (chunk || control != TLS_RECORD_TYPE_DATA))

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109175836.1246840-1-kuba%40kernel.org

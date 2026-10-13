Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B8651A128;
	Tue, 13 Oct 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907903; cv=none; b=WKkxYT5m815bzvNUsB9UHn2LzVd6nMWwAU4eFj1aU91o9y4OkxI6FX0u6EFq0sE4Chv6XJ32A3aBtc+t9M/JItrXHIhOpdmM7ceLcLZpOTDRfBxnxVYpYWmkA7JjL+6GLS0ZgCMbxhWiKo4ZniHgoZ1Fpa6Vx6N9RBvhyXf9Rf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907903; c=relaxed/simple;
	bh=y35iHL2TgzB88EI4xLvs5w1UPIzJNG2I7uvwVcsO4Bg=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bU+md3kvKQkW3r3yiDktU+w9WjXrxBHdwzaMhogGZWreh1EfD26RPXuudF5DdiwtznMU8D/IQcSkUYh3Eb2hLcN42SbM5pFKvFYnnCJ/pMk2wCz1eL30XLuMpX9s5q9RlEEtoum9/RuW6Ak7LVdPi54vjUmwKbEylmp3AgnBx9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apv0+BIO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apv0+BIO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1128A1F00893;
	Tue, 13 Oct 2026 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907901;
	bh=VR2D6cS1kWgyrkAsfzjuwOOMq/Wkb+ljfZmclFOAl0Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=apv0+BIOztomZ8rI5UJl6RuScN2GkeyaekT34WQXbXJ0JXENOY1U4D0tu7y+P+rPO
	 rUzSvzs/NsxqzCrXl3u3q0rNkNruaA6YZDyPhwFbbAgNxtjOMXSE+HM5cmrui8buAv
	 pnEPH56c+K0Og6MNs6OvK6FrXBxHoXQs3hioK5B46XsvY3YA4gEzzDU3ApiqWIxk/P
	 rYrCBNas1p6MF7Q8OPct9sq35ofNO0T/6c+Cfw3bugcaxxKGEwECVosYEVe14GrY3A
	 5WjzP34qIlKFq8DqrNiaxu1fo4kWK0lmCUWWeD8Py8Rqr10ik6Zrf5bjtZaJURnTaT
	 gkBkD+N+KAdGg==
Subject: Re: [PATCH net-next v4 4/9] tls: Consume empty data records in
 tls_sw_splice_read()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 13 Oct 2026 16:11:40 +0000
Message-ID: <179190790064.434549.9638297306862394280@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-4-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-4-8cea429565da@kernel.org>
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

- [Medium] In tls_sw_splice_read() (net/tls/tls_sw.c), the new `goto
  retry` loop after an empty application_data record calls…
- [Medium] The new `goto retry` loop in tls_sw_splice_read() keeps
  lock_sock() ownership and the TLS reader lock (taken by…

--

tls: Consume empty data records in tls_sw_splice_read()

This commit makes tls_sw_splice_read() consume zero-length
application_data records and loop back for the next record. Before, it
returned zero, which the caller treats as EOF. A signal_pending() check
before each retry keeps the splicing task killable.

Closes: https://lore.kernel.org/netdev/akaoXcfamBp8_mYe@krikkit/

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index f5e329b75976b..0fea14224cec4 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -2057,6 +2059,9 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  
>  		tls_rx_rec_done(ctx);
>  		skb = darg.skb;
> +
> +		/* The retry's wait runs with the socket lock still held. */
> +		released = false;

[Severity: Medium]
The socket lock is held across the retry. If the peer keeps sending empty
records, how long can this loop keep lock_sock() ownership and the TLS
reader lock?

After each empty record, tls_rx_rec_done() calls tls_strp_check_rcv().
That parses the next record from sk_receive_queue. On the retry,
tls_rx_rec_wait() sees tls_strp_msg_ready() as true and skips its whole
wait loop:

tls_rx_rec_wait() {
    ...
	while (!tls_strp_msg_ready(ctx)) {
		...
		if (sk_flush_backlog(sk))
			released = true;
		...
		ret = sk_wait_event(sk, &timeo,
				    tls_strp_msg_ready(ctx), &wait);
		...
	}
    ...
}

So the loop never reaches sk_flush_backlog() or the lock release inside
sk_wait_event().

Each pass does a synchronous decrypt, with an skb allocation, a
kmalloc() and an AEAD operation, and there is no cond_resched(). The
only scheduling point is the cond_resched() in __release_sock() during
a backlog flush. That flush runs only once the receive queue no longer
holds a complete record.

While this runs, other lock_sock() users of the socket are held off,
such as a tls_sw_sendmsg() thread or setsockopt(). So are TCP timers
deferred to the socket owner. On PREEMPT_NONE kernels the CPU may also
go a long time without rescheduling. The signal_pending() check makes
the task killable, but it does not limit how long the lock is held.

Another commit in the same series, "tls: Bound consecutive no-data
records in tls_sw_read_sock()", fixes the same loop shape in the sibling
reader:

tls_sw_read_sock() {
    ...
			if (++nodata >= TLS_RX_NODATA_LIMIT)
				break;
			continue;
    ...
}

Would something similar help here? One option is a cap on consecutive
empty records that returns -EAGAIN or -EINTR. Another is to release the
socket and call cond_resched() before the goto retry.

>  	}
>  
>  	rxm = strp_msg(skb);
> @@ -2068,6 +2073,20 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  		goto splice_requeue;
>  	}
>  
> +	/* Splicing zero bytes reads as EOF to the caller. */
> +	if (rxm->full_len == 0) {
> +		consume_skb(skb);
> +		if (signal_pending(current)) {
> +			long timeo = sock_rcvtimeo(sk, nonblock);
> +
> +			err = -EAGAIN;
> +			if (timeo)
> +				err = sock_intr_errno(timeo);
> +			goto splice_read_end;
> +		}
> +		goto retry;

[Severity: Medium]
Can this retry make SO_RCVTIMEO restart with every empty record?

Each goto retry calls tls_rx_rec_wait() again. tls_rx_rec_wait()
computes a new timeout on every call, so time already spent waiting is
lost:

tls_rx_rec_wait() {
    ...
	timeo = sock_rcvtimeo(sk, nonblock);
    ...
}

Suppose the peer sends an empty application_data record a little more
often than every SO_RCVTIMEO interval. Each record wakes sk_wait_event()
and decrypts to full_len == 0. It is then consumed, and the wait starts
over with a full timeout. A blocking splice(2) or sendfile(2) that never
moves any data would then never return -EAGAIN.

A nonblocking caller only gets -EAGAIN from inside the
!tls_strp_msg_ready() loop in tls_rx_rec_wait():

		if (!timeo)
			return -EAGAIN;

What if empty records keep arriving at least as fast as they are
decrypted? Could a SPLICE_F_NONBLOCK or O_NONBLOCK splice then stay in
the kernel until a signal arrives? That looks like the event-loop stall
that "tls: Honor O_NONBLOCK in tls_sw_splice_read()", earlier in the
series, set out to prevent.

tls_sw_recvmsg() also restarts the timeout for each record. Before this
patch, though, splice handled at most one record per call.

The loop has no iteration cap. tls_sw_read_sock() already limits this
case with TLS_RX_NODATA_LIMIT. Would a matching limit make sense in
tls_sw_splice_read()?

> +	}
> +
>  	chunk = min_t(unsigned int, rxm->full_len, len);
>  	copied = skb_splice_bits(skb, sk, rxm->offset, pipe, chunk, flags);
>  	if (copied < 0)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012-tls-follow-on-v4-0-8cea429565da%40kernel.org

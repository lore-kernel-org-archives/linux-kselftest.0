Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6457A3932DC;
	Sun, 18 Oct 2026 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351380; cv=none; b=cGSSoScV1bTBKSBiMEm1Y8fw4Y6ue4kIti+k+fsysTeJib5wuVVl9pQ6f3q5GCsLj5zxkachFGUAzLjbJr4zFwwpx6CXTO6iEX7S/uaR0i8qOAw7D1tfKnSnjKrJHqY5mYF78rxv/6s2TpunZBEy4OZ+rbQc1JFgP6qJlDEwjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351380; c=relaxed/simple;
	bh=smX1Mpme+twCJ5nbmEayg++bHGv6YedC3OtpnM6FGnE=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a4jYq6+8kJpl4RoEWfg2BA3wQS05U3cbGJydeDCrAyiBM3UgBaIumB/HNx64m6rhojmx4zWt7knbV47kPoJmvCgJ9l8L7XHqbqTfOyRiOY6tix+VvFQsN/MGLkVexzmE8KASbktUgNdPFsaMb9/BuQdhxhEol5CmWP6EcAdPYIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imurRCbx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imurRCbx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473981F000C5;
	Sun, 18 Oct 2026 19:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792351379;
	bh=MpA9sQ+iR5oAFjAkaVKUK+Vs51yAQO+roaWvX2bHFI0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=imurRCbxu8Y52MytTy+tf6cyJTdwLpMni3PXTGT8zw4ZZmNVwuKUbr4JrdWWgnNCl
	 4m4E8vODwscLvTdtt0v2uUJA6dUrNpgFcSsiyatlvHcAaxFZ+o2ooW70dURe4USma0
	 1ignAehBUd/wzzZUGTjhiCUVbactBS2wHbSYT0VRJfGqWc8rT8gMoX5CTUDazHol40
	 Ycymo6ScInN+n4N0eqFCuQoJg6ootiZxxKyZDFeW09dfcvkPJ+5X0bcex/5zW/+5mz
	 aHMrrMEP0slBQIqPclxtbzNplALZbmL4crrRR5H59fT0pDA+vc23Sr38hs9ZUDuYwn
	 3gjEsZnXHTK4g==
Subject: Re: [PATCH net-next v5 04/10] tls: Consume empty data records in
 tls_sw_splice_read()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 18 Oct 2026 19:22:57 +0000
Message-ID: <179235137784.3135.3581519897998654848@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-4-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-4-e76c301d4f05@kernel.org>
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
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] tls_sw_splice_read() (net/tls/tls_sw.c) now returns -EAGAIN
  from a blocking splice(2) or sendfile(2) once TLS_RX_NODATA_LIMIT (16)…

--

tls: Consume empty data records in tls_sw_splice_read()

With this patch, tls_sw_splice_read() consumes a zero-length
application_data record and fetches the next one. Before, it returned
zero, which the caller reads as EOF. It now stops after
TLS_RX_NODATA_LIMIT consecutive empty records and returns -EAGAIN. It
also checks for a pending signal before each retry.

Closes: https://lore.kernel.org/netdev/akaoXcfamBp8_mYe@krikkit/

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index cb5a2b29bced7..53a4af9eeeefa 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -2042,12 +2044,13 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  	if (err)
>  		goto splice_read_end;
>  
> +retry:
>  	if (!skb_queue_empty(&ctx->rx_list)) {
>  		skb = __skb_dequeue(&ctx->rx_list);
>  	} else {
>  		struct tls_decrypt_arg darg;
>  
> -		err = tls_rx_rec_wait(sk, nonblock, true, false);
> +		err = tls_rx_rec_wait(sk, nonblock, released, false);
>  		if (err <= 0)
>  			goto splice_read_end;

[ ... ]

> @@ -2070,6 +2076,24 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  		goto splice_requeue;
>  	}
>  
> +	/* Splicing zero bytes reads as EOF to the caller. */
> +	if (rxm->full_len == 0) {
> +		consume_skb(skb);
> +		if (++nodata >= TLS_RX_NODATA_LIMIT) {
> +			err = -EAGAIN;
> +			goto splice_read_end;
> +		}

[Severity: Medium]
Can this return -EAGAIN from a blocking splice(2) or sendfile(2) on a
socket that has no SO_RCVTIMEO set?

The nodata counter counts records, not elapsed time, and nothing resets
it during the call. Each goto retry goes back through tls_rx_rec_wait(),
which recomputes the timeout and can sleep:

net/tls/tls_sw.c:tls_rx_rec_wait() {
    ...
	timeo = sock_rcvtimeo(sk, nonblock);
    ...
		ret = sk_wait_event(sk, &timeo,
				    tls_strp_msg_ready(ctx), &wait);
    ...
}

On a blocking socket with no receive timeout, timeo is
MAX_SCHEDULE_TIMEOUT. sk_wait_event() drops the socket lock while it
sleeps. So 16 empty records spread over minutes or hours would still
end the call with -EAGAIN, even though the lock was not held the whole
time.

The commit message says:

    The cap stands in for the timeout the retry defeats, so a blocking
    splice with no timeout set reports -EAGAIN too, as a timed-out
    receive would.

If no timeout is set, is there a timeout for the retry to defeat?

splice(2) documents EAGAIN only for SPLICE_F_NONBLOCK or O_NONBLOCK
descriptors. tcp_splice_read() returns -EAGAIN only when timeo is 0.
RFC 8446 section 5.1 and RFC 5246 section 6.2.1 allow a peer to send
zero-length application_data records, so a remote peer can trigger
this. A blocking caller that treats an unexpected EAGAIN as fatal would
still tear down a live connection, just after 16 empty records instead
of 1.

The new selftest variant 0data_x16_data shows the cap also fires when a
data record is already queued right behind the 16th empty record. Later
patches in the series do not change this splice code, and the final
selftest expects this EAGAIN.

> +		if (signal_pending(current)) {
> +			long timeo = sock_rcvtimeo(sk, nonblock);
> +
> +			err = -EAGAIN;
> +			if (timeo)
> +				err = sock_intr_errno(timeo);
> +			goto splice_read_end;
> +		}
> +		goto retry;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014-tls-follow-on-v5-0-e76c301d4f05%40kernel.org

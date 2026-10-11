Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBE235C68D;
	Sun, 11 Oct 2026 20:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750923; cv=none; b=LRmbnyA0COpuGU32SonCOIVjz+EVUrmAkjKDixBpXgSEp9BGICe40zHR0sMCGjPcukvKTsez+6BtTJ7rPvNnMWzyJZh9w4411eUXww8mz6Xt8CS2MUWTcNslxxNWvvVu6mfjVSwwVTnoGpbLD5nEG4g6WhZNybfoIpddjpTZzlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750923; c=relaxed/simple;
	bh=9nMi5zgazey3gy3jzvoyCBNFDVUm4RHP09NApHAzCDs=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f6IrPEsskOF4arEeG5o/Yvg4M+TybPutS8NHj4WIlenk41boSZpHlR9H9j/XiYOwPbJ/60MYI8gx1USCe3DsBYkh4g9w0MR3CvxGsfXyGOIGlvWHJZn4UOP1AMnwq9ZVrtXC30XiNIbz/yzGAsdll5NmvGzWkMqUqOfzYAm3ie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fml7Bo8g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fml7Bo8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810AC1F0089B;
	Sun, 11 Oct 2026 20:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791750922;
	bh=Ms+L+mtW6FVGc0oHFaicoiv0wHDaGQkTrFtomDliaRA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fml7Bo8g21HbRFWgZD/72uDrr0qSGb6MxgmPGJCogrGSl4nSUabqa/vM09+kU8Mks
	 DFlY3/h4ZBcloU0LCBwJgP9tMLrnBDxYAfyLuh3H4Yjr/eZqOmcJQWL+WMrkK3pm6v
	 94kdFIBqtLUvvIXCJjBkOzn5x3Seq9fHqStgxnGv51xO7cTNufDAF6GRZTs1RdJwsV
	 /viLr8irQuIgT1Ut0JnR85wqSwrAanxvqaVYpaPcy7XO0IICY46msqFL0AkThT4G4A
	 AGm+fWSA28eGGKlbDD0ikUv1g42H4/JohNGw+Vv5hIdW9+yE3M+pIrxm+dlgW6p2K0
	 HiVhvB0Q7Oz9Q==
Subject: Re: [PATCH net-next v3 4/9] tls: Consume empty data records in
 tls_sw_splice_read()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 11 Oct 2026 20:35:21 +0000
Message-ID: <179175092109.434549.9909737533057193878@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-4-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-4-6d52d98389b3@kernel.org>
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

- [Medium] tls_sw_splice_read() (net/tls/tls_sw.c) now has a `goto retry`
  loop that a peer can keep running.

--

tls: Consume empty data records in tls_sw_splice_read()

Before this commit, tls_sw_splice_read() returned zero when it hit a
zero-length application_data record, and callers read that as EOF. It
now consumes the empty record and jumps back to fetch the next one. A
signal_pending() check before each retry keeps the splicing task
killable.

Closes: https://lore.kernel.org/netdev/akaoXcfamBp8_mYe@krikkit/

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 6c21897b03ee5..ff82e2f4e9e52 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -2038,12 +2039,13 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
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
>  

[ ... ]

> @@ -2066,6 +2071,16 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  		goto splice_requeue;
>  	}
>  
> +	/* Splicing zero bytes reads as EOF to the caller. */
> +	if (rxm->full_len == 0) {
> +		consume_skb(skb);
> +		if (signal_pending(current)) {
> +			err = sock_intr_errno(sock_rcvtimeo(sk, nonblock));
> +			goto splice_read_end;
> +		}
> +		goto retry;
> +	}

[Severity: Medium]
Can a peer keep this goto retry loop running for as long as it likes?

Nothing limits how many empty records one call consumes, and nonblock is
not checked between retries. The loop only exits on one of these:

  - a non-empty data record
  - a control record
  - tls_rx_rec_wait() returning <= 0
  - a pending signal

Suppose the peer sends authenticated empty records at least as fast as
they are decrypted. Then the next record is always ready, through one of
two paths:

  - tls_rx_rec_done()->tls_strp_check_rcv()
  - sk_flush_backlog() followed by tls_strp_check_rcv() inside
    tls_rx_rec_wait()

In that case tls_rx_rec_wait() either skips its wait loop or breaks out
before it reaches the -EAGAIN exit:

net/tls/tls_sw.c:tls_rx_rec_wait() {
    ...
	timeo = sock_rcvtimeo(sk, nonblock);

	while (!tls_strp_msg_ready(ctx)) {
		...
		if (!skb_queue_empty(&sk->sk_receive_queue)) {
			tls_strp_check_rcv(&ctx->strp, false);
			if (tls_strp_msg_ready(ctx))
				break;
		}
		...
		if (!timeo)
			return -EAGAIN;
    ...
}

If so, would a splice(2) or sendfile(2) caller using SPLICE_F_NONBLOCK or
O_NONBLOCK never see -EAGAIN, and never get back to its event loop while
the stream continues? The earlier patch in this series, "tls: Honor
O_NONBLOCK in tls_sw_splice_read()", was meant to prevent this kind of
event loop stall.

The task also holds lock_sock() and the TLS reader lock for the whole
run. Other users of the socket, such as tls_sw_sendmsg(), setsockopt()
and recvmsg(), would be blocked during that time.

Blocking callers have a similar problem. Each call to tls_rx_rec_wait()
computes a fresh timeo from sock_rcvtimeo(). Could one empty record
arriving just before each timeout expires keep a splice with SO_RCVTIMEO
waiting forever?

Elsewhere in this series, tls_sw_read_sock() caps the same pattern:

	if (++nodata >= TLS_RX_NODATA_LIMIT) {

At the end of the series, tls_sw_splice_read() still has no cap. Would it
make sense to cap consecutive empty records here as well? One option is
to reuse TLS_RX_NODATA_LIMIT and return -EAGAIN to nonblocking callers.
Another is to carry a single remaining-timeout budget across retries.

tls_sw_recvmsg() has the same unbounded behaviour. The patch "tls:
Consume empty data records in tls_sw_recvmsg()" acknowledges this.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261007-tls-follow-on-v3-0-6d52d98389b3%40kernel.org

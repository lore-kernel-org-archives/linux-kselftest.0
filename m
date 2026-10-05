Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9895448392;
	Mon,  5 Oct 2026 23:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791242549; cv=none; b=d0v+dIJ3vtz8Qu7VXFhVWyjMSnFbRk/Dufp8vMZOrdOOrm4VTA6zQsYgVVF0DjUeCsSd0wdT/rtclDGsU3nvW8mKShY/AORVdXuR/VY/DgxUF+oIEsYrFggR2G81WoPF0wP+IC9k37ap5d5OPrkoG3XH6TZhvqhzo2XCCjB7S2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791242549; c=relaxed/simple;
	bh=80lGjJ0Fz4HtCOrtjS5WPqqrJXMMIN59Y5Cl8XLK2G4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CxiRTcQ+LTTmJG/e/6IQZmCM7ksFha95jMeGQDy2Chqe/1E7U78CdU22YCy4ohlZ2mr63bc29Ds146Tjef+R50dUxjStPrVz38j/HKY0p/nVTCbnItLftD2Ddi4I6I4vVBlZfK7Ubi3F0dq0nA9fC8WlIgDooSqaujrTRzkv9aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlkH4mMO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlkH4mMO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174781F000FF;
	Mon,  5 Oct 2026 23:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791242547;
	bh=JKzxyQOnpnoqzEMI0g7VcyTkBn+a+4D59AE2PjJuecc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SlkH4mMOYywyPLWyFXHHOSohSq5EJ4ngk1LX9uhOp11kkE4G9XSAxT7hOLcVBrwyd
	 Psk7AWQxqG1MrN6xpiyIdVWn8BX3bY0OI5Ypp/pB/FRXQdU4IfG6Kil7yy1R6OuC0s
	 02QHLcPFSaih09fo6MwsxOt9vh1ZTVLwvukfQ4wSR/k17csIFn1ZC9s0CQgaNkjbWF
	 TaxPVGXXQhjvqlsxAB3OVguV5RZUWV+5pg7ashAWudKOAvbbjZ/dS2Pa+rWVXaGVIV
	 4HHF2XBjWXWh8swOZbaWD5lcBkTVx1KPSUwAra9oQ65YZp2HNe4eab/b5Po7PXUg8Z
	 A7yJunBNBCBmw==
Subject: Re: [PATCH net-next v2 5/8] tls: consume empty data records in
 tls_sw_recvmsg()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 05 Oct 2026 23:22:26 +0000
Message-ID: <179124254665.434549.12245680127262431659@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-5-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-5-2dd1947bb642@kernel.org>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch stops empty records from piling up on rx_list, but the
  receive loop in tls_sw_recvmsg() (net/tls/tls_sw.c) still never…

--

tls: consume empty data records in tls_sw_recvmsg()

This patch makes tls_sw_recvmsg() free a zero-length application_data
record as soon as it is decrypted. Before, the peek and async arms queued
it on rx_list. Empty records are no longer decrypted asynchronously, and
the new branch sets MSG_EOR itself.

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 6ca1e9f4e5040..4fecac8a0b0da 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1924,6 +1927,19 @@ int tls_sw_recvmsg(struct sock *sk,
>  		nodata = !chunk;
>  		tls_rx_rec_done(ctx);
>  
> +		/* Keep an empty record off rx_list. On the zero-copy path
> +		 * the strparser owns darg.skb, and tls_rx_rec_done() has
> +		 * released it.
> +		 */
> +		if (!chunk && control == TLS_RECORD_TYPE_DATA) {
> +			if (!darg.zc)
> +				consume_skb(darg.skb);
> +
> +			/* An empty record still marks a boundary. */
> +			msg->msg_flags |= MSG_EOR;
> +			continue;
> +		}

[Severity: High]
This keeps empty records off rx_list. Does the receive loop still fail to
make progress on them, though? The commit message describes this part of
the problem as well:

    len never reaches zero, and tls_strp_msg_ready() keeps the second
    loop term true while records keep arriving.

The new branch does not change len, decrypted or copied. It also places no
limit on how many empty records can arrive in a row. Once
decrypted + copied >= target, only the strparser keeps the loop going:

    while (len && (decrypted + copied < target || tls_strp_msg_ready(ctx))) {

Could a peer that keeps sending zero-length application_data records hold
the reader in this loop forever? Three things keep the loop supplied:

  tls_rx_rec_done()->tls_strp_check_rcv() parses the next record right
  away.

  tls_read_flush_backlog() flushes the backlog on every pass whenever
  tcp_inq(sk) <= max_rec, because done never moves:

      if (done - *flushed_at < SZ_128K && tcp_inq(sk) > max_rec)
          return false;

      *flushed_at = done;
      return sk_flush_backlog(sk);

  tls_rx_rec_wait() returns 1 at once when a record is ready, so the
  loop never reaches its -EAGAIN exit for nonblocking callers.

So during such a flood, a MSG_DONTWAIT caller would not get -EAGAIN. Bytes
already copied would not be returned until the flood stops.

SO_RCVTIMEO readers have a related problem. tls_rx_rec_wait() starts a new
timeout on every call:

    timeo = sock_rcvtimeo(sk, nonblock);

    while (!tls_strp_msg_ready(ctx)) {

If a reader has copied nothing yet, can a peer that sends one empty record
per timeout period stop it from ever timing out?

The only way out seems to be the check added earlier in this series:

    if (nodata && signal_pending(current)) {

In-kernel MSG_DONTWAIT callers never receive a signal, so they cannot use
this exit. One example is svc_tcp_sock_recvmsg() in net/sunrpc/svcsock.c:

    ret = sock_recvmsg(sock, msg, MSG_DONTWAIT);

This same series already limits tls_sw_read_sock() with TLS_RX_NODATA_LIMIT
in "tls: bound consecutive no-data records in tls_sw_read_sock()". The
later patches in the series only change selftests, so tls_sw_recvmsg()
still has no limit at the end of the series.

The zero-copy arm could already spin like this before this patch. Since
the commit message names this loop behavior as the defect, should the
empty-record branch break out once decrypted + copied >= target? The other
option would be a limit on consecutive empty records, as tls_sw_read_sock()
has.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-tls-follow-on-v2-0-2dd1947bb642%40kernel.org

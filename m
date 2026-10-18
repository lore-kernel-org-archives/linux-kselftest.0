Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0155422523;
	Sun, 18 Oct 2026 19:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351382; cv=none; b=YvtfHBGfYw0u1ZXcZAWl1hzqneLCEsxHpbEzxqORWTwx4RZFvnpC7PrDJPh5omkID8Ji9jw3Va5zTsoYhILeW0EOqIu48dkaFdO8wHEkGNrzjI6LfiFXeZU/DoMQ6oTyzJhjtJyJ37dPwf9auTVMsig6sLeCibUxX83jlENc8iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351382; c=relaxed/simple;
	bh=0z0Ny/G9/rOvktdYD9GkzF/o+/3011Bb/LvMfqR/43c=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XPbZQhAxq5qFRfSs2iBIAHCbyAKjxhzZ+8/8RwyvSSQPJC/OhjRT74LZ9Fih6ounomkrAC32UenMczQlQXcyrWlnU8eq5xJk9iNcVa6bgDW4b1huHds5f9Fljh0ciG23E5RTBNBFoK/qAbPuER9Z3c44DT//v5ZL5zUbLg9GtIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSlTk4om; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSlTk4om"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AC11F000C4;
	Sun, 18 Oct 2026 19:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792351380;
	bh=cctQewy0s8XtGAPalOeflkz8/Z+aaAZrwWmhpSvZNIk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fSlTk4omxLrFoJKUUr7NgvyDRjYLzeKZm6DHHADAKCQjrFanFjE8HWC2aKif7Vw8m
	 9lZ4uxWpuPJYajvy42/6Jn024g4xF7qEIyhkkEe9/TSvf0OQ99uqpdenQEiM7Sm63G
	 N0E82szn0AtbSBfCAahQkt0XMUJuJNg2w4kPZJ6ANOf9O+hX1+jwV1muRwmX6viQ/g
	 GCrHlnFjRrMjj0ftmbe4iUaxpEbbl3YnrdCltZr46DlcEVGC20NrPtNsesYeBX/usX
	 5bjmPlivc8pPEWJiw6Cm2kyNVHTofGK2wz/rN1njwDK1hwV3T0aNNkh/uSD7BrlYAW
	 BpPBzSdad269A==
Subject: Re: [PATCH net-next v5 05/10] tls: Consume empty data records in
 tls_sw_recvmsg()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 18 Oct 2026 19:22:59 +0000
Message-ID: <179235137916.3135.16553916944020990232@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-5-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-5-e76c301d4f05@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message gives a reason for the new MSG_EOR: "The new
  branch sets MSG_EOR itself, because the record no longer reaches the…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  tls_sw_recvmsg() still has no limit on how many consecutive empty…
- [Medium] This problem wasn't introduced by this patch, but
  tls_sw_recvmsg() still returns 0 (read as EOF) when empty data records…

--

tls: Consume empty data records in tls_sw_recvmsg()

This commit adds a branch to tls_sw_recvmsg() that frees a zero-length
application_data record right after it is decrypted. The branch runs
before the zero-copy, peek and async paths diverge, so empty records are
no longer queued on rx_list. The branch sets MSG_EOR itself and then
continues the receive loop.

Closes: https://sashiko.dev/#/patchset/20260630191551.875664-1-cel@kernel.org?part=1

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 53a4af9eeeefa..153ff135a395e 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1929,6 +1929,19 @@ int tls_sw_recvmsg(struct sock *sk,
>  		nodata = !chunk;
>  		tls_rx_rec_done(ctx);
>  
> +		/* Keep an empty record off rx_list. On the zero-copy path
> +		 * the strparser owns darg.skb, and tls_rx_rec_done() has
> +		 * released it.
> +		 */
> +		if (!chunk && control == TLS_RECORD_TYPE_DATA) {

[Severity: Medium]

This isn't a bug introduced by this patch, but can tls_sw_recvmsg() still
return 0 when an empty data record is followed by a non-data record?

When this branch runs, tls_record_content_type() has already set control
to TLS_RECORD_TYPE_DATA for the empty record and emitted a
TLS_GET_RECORD_TYPE cmsg. The next record might be an alert such as
close_notify, or a TLS 1.3 handshake record such as KeyUpdate or
NewSessionTicket. In that case tls_record_content_type() hits this:

net/tls/tls_sw.c:tls_record_content_type() {
    ...
	} else if (*control != tlm->control) {
		return 0;
	}
    ...
}

and tls_sw_recvmsg() takes the err <= 0 branch with err == 0:

		err = tls_record_content_type(msg, tls_msg(darg.skb), &control);
		if (err <= 0) {
			DEBUG_NET_WARN_ON_ONCE(darg.zc);
			tls_rx_rec_done(ctx);
put_on_rx_list_err:
			__skb_queue_tail(&ctx->rx_list, darg.skb);
			goto recv_end;
		}

Nothing has been copied and async is false, so "return copied ? : err;"
returns 0 with a DATA cmsg attached. Callers such as OpenSSL treat that
as EOF. The control record stays on rx_list, so the next recvmsg() does
return it.

The sibling patch "tls: Consume empty data records in
tls_sw_splice_read()" removes this false EOF for splice. The upstream
selftest variant zero_len/0data_0data_ctrl currently expects recv_ret
{0, 11, -EAGAIN}, so the recvmsg behaviour is encoded there.

Could the empty record be consumed before control is latched? If not,
could the commit message say that recvmsg keeps this behaviour?

> +			if (!darg.zc)
> +				consume_skb(darg.skb);
> +
> +			/* An empty record still marks a boundary. */
> +			msg->msg_flags |= MSG_EOR;

[Severity: Low]

The commit message says:

  "The new branch sets MSG_EOR itself, because the record no longer
  reaches the assignment at the bottom of the loop."

Is that accurate for the peek and async arms? Before this patch, an
empty record on the peek arm went through this:

			if (is_peek) {
				peeked += chunk;
				goto put_on_rx_list;
			}

The async arm also queued the skb and hit continue. Neither arm reached
the msg->msg_flags |= MSG_EOR assignment at the bottom of the loop.

This branch now runs before those arms. So a MSG_PEEK recvmsg() with
synchronous crypto that reaches an empty data record now reports
MSG_EOR, which it did not do before. On the async arm there is little
visible change, because process_rx_list() at recv_end already sets
MSG_EOR for fully copied records.

Could the commit message mention this flag change on the peek path?

> +			continue;

[Severity: High]

This is a pre-existing issue, but should this branch limit the number of
consecutive empty records, like the other readers in this series do?

There is no counter before this continue. TLS_RX_NODATA_LIMIT is defined
after tls_sw_recvmsg(), and only tls_sw_splice_read() and
tls_sw_read_sock() use it:

		if (++nodata >= TLS_RX_NODATA_LIMIT) {
			err = -EAGAIN;
			goto splice_read_end;
		}

The later patch "tls: Return copied data ahead of a run of empty
records" adds a break once decrypted + copied >= target. That patch also
says "A reader that has copied nothing still reads empty records for as
long as they arrive."

Empty records advance neither len nor decrypted. While decrypted + copied
< target, this loop condition stays true:

	while (len && (decrypted + copied < target || tls_strp_msg_ready(ctx))) {

The only exit from the run is then:

		if (nodata && signal_pending(current)) {

While tls_strp_msg_ready() is true, tls_rx_rec_wait() returns 1 without
sleeping or checking for signals. It also recomputes timeo on every
call. Because decrypted + copied never advances, tls_read_flush_backlog()
does not see progress either, and sk_flush_backlog() keeps sk_lock
owned.

As a result, a peer that streams empty records keeps the reader inside
recvmsg() with the socket lock owned. That defeats MSG_DONTWAIT and
SO_RCVTIMEO, and blocks sendmsg, setsockopt and close on the socket.

Kernel callers cannot use the signal exit. For example, nfsd reaches
this loop through:

svc_tcp_sock_recvmsg()
    sock_recvmsg(sock, msg, MSG_DONTWAIT)
        tls_sw_recvmsg()

The read_sock patch in this series treats the same behaviour as a bug:
"The caller cannot bound the run because read_sock() has not returned".

Would the same TLS_RX_NODATA_LIMIT cap make sense in tls_sw_recvmsg()?

> +		}
> +
>  		if (!darg.zc) {

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014-tls-follow-on-v5-0-e76c301d4f05%40kernel.org

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF5D3932DC;
	Sun, 18 Oct 2026 19:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351376; cv=none; b=iu7MoFupf2J1yXCWPADwHZcBz7LhZCfcCzGcWlNwhTXToTJ7cl1tYe08uv1fuN5AzvuQYbEeW4fln/bIxsprqh4GSw7UOLCYleQhjtHRDNhTidA71Dgr+YNBrb+Ligv6kuyBAoI9/U/H1pvVwSITA6LRL/sDUb53/DYEPjEChgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351376; c=relaxed/simple;
	bh=wTAtlfNyc/+8+hBnAHdv9hylqiUClzmQnp5hdItR1K0=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U5e2Gz8RTxymNmAVmso/f3BpmDv3ZzVuTomDe8/Pe9e19VBdJuEjm06I+BXg9ucmszC9QTwz6bEOsrWgTY5HnNJOmFLpGkJ6feC7A63XTKzuMm4XIXC+HIEC80ptrVDBnFvr97xrxg6uAf2Ai3tlb7O2VSukT29EocEklVtCOjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arolshh9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arolshh9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6441C1F000C4;
	Sun, 18 Oct 2026 19:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792351375;
	bh=9SMjdtbh2rN4mcpNJo9gUpkv4BKrvaatwTj8eYOs5ic=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=arolshh9c6vEhrXXTJYOctrfxFuF6DYNaXW9J9du8yxrXaQSb+RutVJ7EMsiZvIg4
	 WL0pwqu2vE5xeFAuiVWYndv/8cX+13dhRVxYFTwW1xI75iDR+Kh3QRsZiOh59SOZeo
	 I6K+NoIJWLtFlQ/3CAY4JY10y9CCoi9bgXKeT1oqTi+F9Obz62ezG/neIrnCy4uzGy
	 pNrnGzVf6mSKwZAKMeXRRGuSgbuMkJBGT+RgnNkyq5abBzc71RTl5Z5vITHgjdJlGV
	 nLvbyRBfNoruRlR+kjysz72sRjJ1jWacR55oJ6XByEFOPLF0dg5UNB3yT1kyiqiaWn
	 38vnsywDbz3Rw==
Subject: Re: [PATCH net-next v5 01/10] tls: Bound consecutive no-data records
 in tls_sw_read_sock()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 18 Oct 2026 19:22:53 +0000
Message-ID: <179235137390.3135.8037803967508250404@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-1-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-1-e76c301d4f05@kernel.org>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new limit only counts consecutive empty records, so a peer
  can get around it by mixing in small records.
- [Medium] When tls_sw_read_sock() stops at TLS_RX_NODATA_LIMIT, it
  queues data_ready_work only if tls_strp_msg_ready(ctx) is true…
- [Low] (Baseline: not confirmed after checking the end of the series.)
  At this commit, the wake condition at the new TLS_RX_NODATA_LIMIT exit…

--

tls: Bound consecutive no-data records in tls_sw_read_sock()

This patch makes tls_sw_read_sock() stop after TLS_RX_NODATA_LIMIT (16)
consecutive zero-length application_data records. Any record that delivers
bytes resets the count. When the loop stops and a parsed record is still
pending, a work item on tls_strp_wq calls the socket's current
sk_data_ready(), so consumers such as nvme-tcp get woken again.

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 312e51270f293..37fcca95c0467 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -2136,14 +2153,23 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
>  			goto read_sock_requeue;
>  		}
>  

[ ... ]

>  		if (rxm->full_len == 0) {
>  			consume_skb(skb);
> +			if (++nodata >= TLS_RX_NODATA_LIMIT) {
> +				/* tls_rx_reader_release() wakes only the
> +				 * callback saved when TLS_RX was set up;
> +				 * nvme-tcp installs its own afterward.
> +				 */
> +				if (tls_strp_msg_ready(ctx))
> +					queue_work(tls_strp_wq,
> +						   &ctx->data_ready_work);

[Severity: Medium]
What happens when this limit is hit after the parse of the next record
was deferred to strp->work?

After the 16th empty record, tls_rx_rec_done()->tls_strp_check_rcv() can
reach tls_strp_read_copy() if the receive queue layout forces copy mode.
That path calls alloc_page(strp->sk->sk_allocation), and
nvme_tcp_alloc_queue() sets sk_allocation to GFP_ATOMIC. If the
allocation fails:

net/tls/tls_strp.c:tls_strp_check_rcv() {
    ...
	if (tls_strp_read_sock(strp) == -ENOMEM)
		queue_work(tls_strp_wq, &strp->work);
    ...
}

then msg_ready stays false. The new break skips data_ready_work and
returns 0, so nvme_tcp_io_work() sees no progress and exits.

When strp->work parses the record later, tls_rx_msg_maybe_announce()
sends the announcement here:

	ctx->saved_data_ready(strp->sk);

That is the pre-TLS callback, not nvme_tcp_data_ready(), which does not
chain to it. Only nvme_tcp_data_ready() schedules io_work.

Could the received record then sit unread until unrelated traffic or an
I/O timeout runs io_work again?

Before this patch, the loop went back into tls_rx_rec_wait(), which
retries tls_strp_check_rcv() right away. Hitting this stall needed two
allocation failures in a row.

[Severity: Low]
Should this wake condition also look at ctx->rx_list?
tls_sw_sock_is_readable() treats either of these as readable:

	return tls_strp_msg_ready(ctx) ||
		!skb_queue_empty(&ctx->rx_list);

At this commit, tls_sw_recvmsg() with MSG_PEEK can use put_on_rx_list to
leave 16 or more empty data records, followed by a non-empty record, on
rx_list while msg_ready is false. kcm_attach() only checks the family and
protocol, so a read_sock consumer can then be attached to that kTLS
socket.

In that case tls_sw_read_sock() would consume the 16 empty records from
rx_list, break without queueing data_ready_work, and return 0. The
decrypted payload would stay on rx_list.

The later patch in this series, "tls: Consume empty data records in
tls_sw_recvmsg()", appears to keep empty data records off rx_list. With
it, rx_list would be empty whenever this limit fires, so the issue goes
away at the end of the series. It still seems reachable with this commit
alone.

> +				break;
> +			}
>  			continue;
>  		}
>  
> @@ -2154,6 +2180,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
>  			goto read_sock_requeue;
>  		}
>  		copied += used;
> +		nodata = 0;

[Severity: High]
Can a peer get around the bound by resetting nodata here?

The commit message says:

    A zero-length application_data record does not deliver a payload, so
    tls_sw_read_sock() never runs the read_actor for one and nothing
    decrements desc->count.

That implies desc->count bounds the loop for non-empty records. For
nvme-tcp it doesn't seem to:

drivers/nvme/host/tcp.c:nvme_tcp_try_recv() {
    ...
	rd_desc.count = 1;
	lock_sock(sk);
	queue->nr_cqe = 0;
	consumed = sock->ops->read_sock(sk, &rd_desc, nvme_tcp_recv_skb);
    ...
}

nvme_tcp_recv_skb() never decrements desc->count.

The loop's input is also not fixed when it starts. tls_rx_rec_wait()
calls sk_flush_backlog() when no record is ready, and
tls_read_flush_backlog() flushes the backlog periodically inside the
loop.

Suppose the peer keeps repeating "15 empty records, then one 1-byte data
record the consumer accepts". Each delivered byte sets nodata back to 0,
so the ++nodata >= TLS_RX_NODATA_LIMIT check never fires.

Wouldn't tls_sw_read_sock() then keep running with the socket lock held
for as long as the peer keeps sending? That is the case the commit
message says this patch closes.

Would this need a cap on the total number of records per call, or no
backlog flushing inside read_sock, rather than a count of consecutive
empty records?

>  		if (used < rxm->full_len) {
>  			rxm->offset += used;
>  			rxm->full_len -= used;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014-tls-follow-on-v5-0-e76c301d4f05%40kernel.org

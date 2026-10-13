Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB783D79EF;
	Tue, 13 Oct 2026 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907899; cv=none; b=PzeJTIXh6FQf6wB7tTiEuidoZCn2vA+F8bYa/mokEvwDv6oi1gZMIHGvNdJdjusb8BEtHszWGpt/u3554VeHB3+hB0DxOEN5KZJ3ZFVjvLaDludxhdWuN73jl3gIexcwrrmql8CnC8PbDn2A1XkkoMgPYKvWCjOyQQPwK9Ua3z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907899; c=relaxed/simple;
	bh=BGpBaMpEeQAhqcK1AUaV+5gF/far8/BgkMEO/HmQUaw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rsMoJ7X2pQAw06RPha7bdE+KoVg3l0+MG5fv/J9OmkbQk4qROUFhVPtAk5Om2wpYZ4kiAtQC7iQ6s01zsbAhUwSaBchiMJuqGU/3c+ZcVjXg7pDM3Cl1fivDe90gHZnpsTP2Wst7DjYusr8MslCe+zYh9OH6zEvIq3j6LCd9LQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PauOGlYT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PauOGlYT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6221F000FF;
	Tue, 13 Oct 2026 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907898;
	bh=JALgFIEtZTi314vC8EFvQtJSd3bvGFTDAaMbWXYNWrU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PauOGlYTpTXb5+rVWEfavGaBnlifQLl4PZlxUj9lan+6FTTxGfg74g4dUWeM12021
	 SmB55dSmjCjgSCfy+hP961Q1z28YR63kitr+UeRwN835N+6G3jZt1x/aOEWIldYeZc
	 KpuYvNICbeeys6aZqwCKasah8CuxFoaI7cxU5HqKoUoPO+iu+ohuA1hVRaetv1cNcW
	 CFSfhAPP4TsSevsSZSlajdQO8IwZKVnkkhd6KNAGk98mNVTX3FQGFyamsJDudvHCML
	 mkV0hSNfmLEoOBQu30/7a/m4TFPT9UozAym+yp+L4sd/lXW0Bb777Tm9K33aMjhGT9
	 q3shmyd1mBQiQ==
Subject: Re: [PATCH net-next v4 1/9] tls: Bound consecutive no-data records in
 tls_sw_read_sock()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 13 Oct 2026 16:11:36 +0000
Message-ID: <179190789686.434549.3175866622034449660@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-1-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-1-8cea429565da@kernel.org>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new limit relies on a wakeup that never reaches the nvme-tcp
  host (or KCM), so a pending record is not read and the receive path…
- [Low] Rejected (fixed later in the series, kept here for the validation
  policy).

--

tls: Bound consecutive no-data records in tls_sw_read_sock()

This patch limits tls_sw_read_sock() to TLS_RX_NODATA_LIMIT (16)
consecutive zero-length application_data records in one call. When it
hits the limit the loop breaks, and if nothing was copied it returns
zero. The patch counts on tls_rx_reader_release() to announce any record
that is still parsed, so that the consumer calls read_sock again.

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 312e51270f293..a64244566af44 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -2136,14 +2139,19 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
>  			goto read_sock_requeue;
>  		}
>  
> -		/* An empty data record (legal in TLS 1.3) gives a zero
> -		 * read_actor return, indistinguishable from the consumer
> -		 * stalling; the used <= 0 path would requeue it at the
> -		 * head of rx_list and block all later records. Consume it
> -		 * here instead.
> +		/* An empty data record gives a zero read_actor return,
> +		 * indistinguishable from the consumer stalling; the
> +		 * used <= 0 path would requeue it at the head of rx_list
> +		 * and block all later records. Consume it here instead.
>  		 */
>  		if (rxm->full_len == 0) {
> +			err = 0;
>  			consume_skb(skb);
> +			/* tls_rx_reader_release() announces a record left
> +			 * parsed, so the consumer is called again for it.
> +			 */
> +			if (++nodata >= TLS_RX_NODATA_LIMIT)
> +				break;

[Severity: High]
Can this break stall the nvme-tcp receive path?

When the break fires, tls_rx_rec_done()->tls_strp_check_rcv() may have
already parsed the next record, and read_sock returns 0. The commit
message says:

  A record parsed during the call but not yet
  delivered is announced by tls_rx_reader_release(), so the consumer
  is called again for that record.

However, tls_rx_msg_maybe_announce() only calls the callback that was
saved when kTLS RX was armed:

net/tls/tls_sw.c:tls_rx_msg_maybe_announce() {
    ...
	ctx = container_of(strp, struct tls_sw_context_rx, strp);
	ctx->saved_data_ready(strp->sk);
}

net/tls/tls_sw.c:tls_sw_strparser_arm() {
    ...
	rx_ctx->saved_data_ready = sk->sk_data_ready;
	sk->sk_data_ready = tls_data_ready;
    ...
}

nvme-tcp sets up kTLS first, in nvme_tcp_alloc_queue()->nvme_tcp_start_tls().
It installs nvme_tcp_data_ready only later, in
nvme_tcp_start_queue()->nvme_tcp_setup_sock_ops(). That leaves
saved_data_ready as sock_def_readable. sock_def_readable wakes sk_wq
sleepers but never queues queue->io_work.

When read_sock returns 0, nvme_tcp_try_recv() also returns 0, and
nvme_tcp_io_work() does:

		if (!pending || !queue->rd_enabled)
			return;

So io_work is not requeued, and the parsed record waits until unrelated
TCP data arrives. On an idle queue, wouldn't the NVMe command time out
and trigger error recovery and a reconnect?

A target could trigger this by sending 16 or more empty records followed
by a data record. Each empty record is about 22 bytes in TLS 1.3, so all
of them fit in one segment. Before this patch, the continue delivered the
trailing record in the same call.

KCM looks similar. kcm_attach() replaces sk_data_ready with
psock_data_ready after TLS has saved its callback, and do_strp_work()
only retries on -ENOMEM:

	if (strp_read_sock(strp) == -ENOMEM)
		queue_work(strp_wq, &strp->work);

Could this wake the current sk->sk_data_ready, or tell the caller in
some other way that work remains, instead of relying on
saved_data_ready?

[Severity: Low]
At this point in the series, can the same break fire while ctx->rx_list
still holds decrypted records?

tls_sw_recvmsg() with MSG_PEEK puts zero-length data records on rx_list:

			if (is_peek) {
				peeked += chunk;
				goto put_on_rx_list;
			}

Suppose 16 or more of these are followed by real data. read_sock
consumes 16 of them, breaks with copied == 0 and returns 0.
tls_rx_msg_maybe_announce() only checks strparser state:

	if (!READ_ONCE(strp->msg_ready) || strp->msg_announced)
		return;

So nothing announces the data left on rx_list. Nothing announces a
strparser record that was already announced before the call either.

This only matters when MSG_PEEK recvmsg and read_sock are used on the
same socket, and no in-tree user does that. The later commit "tls:
Consume empty data records in tls_sw_recvmsg()" in this series also
removes the precondition: it consumes empty data records before anything
is queued on rx_list. So this only applies to the series up to that
commit.

>  			continue;
>  		}
>  

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012-tls-follow-on-v4-0-8cea429565da%40kernel.org

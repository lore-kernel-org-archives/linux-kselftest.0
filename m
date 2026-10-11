Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2054035C68D;
	Sun, 11 Oct 2026 20:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750921; cv=none; b=HZ4/wnc/ojuzQ/hr/RuJKPYjj1noaH2/RjdrMoby67ZlFhVElyW7NCHyT+0XeINY51djqfxuO6eEXs7Iz3W1GXAaTD9+KS3PvgcrbPx0HUFEmBDfSdB3ke3Aw7jFiMDG/xm/LriqRHw3GVDrbLl1gcfre8cMoggMdwNbZAgg8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750921; c=relaxed/simple;
	bh=NOTqc4jLHqIZ2R0yahfyW8eKb8GSDxSmLGpwenvOYMM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=USRKoT8zUtd7jSt5pxQ6cN/Zh3lQSUFxtCttWhAWGqhkka9Vuc4R7Mqv76TknH/BjYUm1S62FyMbnYVmDDwcapxWOKuk+f7STdSjq9Z7eap9+C+AJLIpzDrdWeLkxBuOS3+vSQeEGnZKPu3u56mrrf1r5NGim9/SQpG1pAuEoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxPMj3oL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxPMj3oL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108B71F0089B;
	Sun, 11 Oct 2026 20:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791750919;
	bh=xhnuKwa6ZzypXCErad0gx6ScBd79TlcFxNQAJVk6U/o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YxPMj3oLSyfqYhAKpjQ1sBRVHlSDuyn+db0vF5wM6sSTuG0spYUV2dgPR8OmBbWQr
	 KtPPTZ9lb5cM9PqI4N1S0YDcod1iYuJ3GD5Bh9UspQpB/E13F9c/O46v9dL+lp2Wf7
	 32SVrCGzTQzOhcCJwMnzFLem1/K9kpqonbN83dwF8cCnXCIS9s3rYrxouBQ6+sYOno
	 AhD79GNq9h+wXm71kjgRvs6PdGdbKJ/G6Xw0QBqclgHhXACLOoKjA3oVqC/46SHKRg
	 186H+isD36EATXBCnVvPpfFdmewqrUdDKrAgf47x7JXSXIMRdT0XZDK1LEZ0OX3GfO
	 wtBYYCrgBQE9A==
Subject: Re: [PATCH net-next v3 1/9] tls: Bound consecutive no-data records in
 tls_sw_read_sock()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 11 Oct 2026 20:35:18 +0000
Message-ID: <179175091859.434549.6003999701782227362@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-1-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-1-6d52d98389b3@kernel.org>
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

- [High] In net/tls/tls_sw.c:tls_sw_read_sock(), the new budget exit
  rests on a false premise.
- [Low] When tls_sw_read_sock() hits TLS_RX_NODATA_LIMIT, the only thing
  that restarts the read_sock consumer is a work item queued with…

--

tls: Bound consecutive no-data records in tls_sw_read_sock()

This commit limits how many zero-length application_data records in a
row tls_sw_read_sock() will consume in one call. The limit is
TLS_RX_NODATA_LIMIT. When the limit is reached, the loop breaks and
schedules a work item that calls sk->sk_data_ready() under lock_sock(),
so the read_sock consumer can resume.

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 312e51270f293..275a6047da9e3 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -2070,6 +2070,20 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  	goto splice_read_end;
>  }
>  
> +#define TLS_RX_NODATA_LIMIT	16
> +
> +static void tls_rx_data_ready_work(struct work_struct *w)
> +{
> +	struct tls_sw_context_rx *ctx =
> +		container_of(w, struct tls_sw_context_rx, data_ready_work);
> +	struct sock *sk = ctx->strp.sk;
> +
> +	/* A callback that finds the socket unowned reads from it. */
> +	lock_sock(sk);
> +	READ_ONCE(sk->sk_data_ready)(sk);
> +	release_sock(sk);
> +}

[ ... ]

> @@ -2136,14 +2151,22 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,

[ ... ]

>  		if (rxm->full_len == 0) {
> +			err = 0;
>  			consume_skb(skb);
> +			if (++nodata >= TLS_RX_NODATA_LIMIT) {
> +				/* tls_rx_reader_release() does not call the
> +				 * consumer's sk_data_ready, which can re-enter
> +				 * this function.
> +				 */

[Severity: High]
Is this comment accurate? tls_rx_reader_release() begins by calling
tls_rx_msg_maybe_announce(). That function calls the consumer's callback
synchronously, and reader_present is still set when it does:

net/tls/tls_sw.c:tls_rx_reader_release() {
	tls_rx_msg_maybe_announce(&ctx->strp);
	...
	WRITE_ONCE(ctx->reader_present, 0);
}

net/tls/tls_sw.c:tls_rx_msg_maybe_announce() {
	if (!READ_ONCE(strp->msg_ready) || strp->msg_announced)
		return;
	strp->msg_announced = 1;
	...
	ctx->saved_data_ready(strp->sk);
}

The same concern applies to this part of the commit message:

  "Records left queued do not raise another sk_data_ready(), so the
  consumer needs one."

The new break seems to produce exactly that state. By the 16th empty
record, tls_rx_rec_done() has already run tls_strp_msg_consume(), which
clears msg_ready and msg_announced. It has also run
tls_strp_check_rcv(strp, false), which can parse the next fully received
record without announcing it. The loop then breaks while the consumer's
strparser is not paused.

Take a consumer such as KCM that installed psock_data_ready before TLS
RX was armed. tls_sw_strparser_arm() saves psock_data_ready as
saved_data_ready and installs tls_data_ready. In softirq, under
bh_lock_sock(), the outer reader is reached like this:

tcp_data_ready()
  tls_data_ready()
    tls_strp_data_ready()
      tls_strp_check_rcv()
        tls_rx_msg_maybe_announce()
          psock_data_ready()
            strp_data_ready()
              strp_read_sock()
                tls_sw_read_sock()

When that call takes the new break:

tls_rx_reader_release()
  tls_rx_msg_maybe_announce()
    psock_data_ready()
      strp_data_ready()          /* socket unowned, strp not paused */
        strp_read_sock()
          tls_sw_read_sock()     /* nested */
            tls_rx_reader_acquire()   /* reader_present == 1 */
              sk_wait_event()
                release_sock()   /* spin_lock_bh(&sk->sk_lock.slock) */

Can this self-deadlock on sk_lock.slock, which this CPU already holds
through bh_lock_sock()? It looks like a peer only has to send 17 or more
consecutive empty data records that arrive together in the receive
queue.

Before this patch the loop ran until no record was ready, so msg_ready
was clear when the reader was released.

In this configuration, does tls_rx_data_ready_work() reach the consumer
at all? There sk->sk_data_ready is tls_data_ready, not psock_data_ready.
Under lock_sock(), tls_data_ready only queues the tls_strp work, and
tls_strp_check_rcv() then returns early because msg_ready is already
set. The release-time announce goes to saved_data_ready while the work
item goes to sk->sk_data_ready, so the two notification paths seem to
disagree.

> +				schedule_work(&ctx->data_ready_work);

[Severity: Low]
schedule_work() queues this on system_wq, which lacks WQ_MEM_RECLAIM.
The existing TLS RX deferral uses tls_strp_wq instead:

net/tls/tls_strp.c:tls_strp_dev_init() {
	tls_strp_wq = create_workqueue("tls-strp");
	...
}

Some read_sock consumers, such as nvme-tcp over kTLS, sit in the memory
reclaim I/O path. After a burst of empty records, this work item is the
only thing that restarts the consumer. Could RX stall under memory
pressure until another event, such as new TCP data, arrives?

Would tls_strp_wq, or another WQ_MEM_RECLAIM workqueue, be a better
place for this work?

> +				break;
> +			}
>  			continue;
>  		}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261007-tls-follow-on-v3-0-6d52d98389b3%40kernel.org

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0925D3C2B8F;
	Sun, 11 Oct 2026 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750922; cv=none; b=DzcnyWgn/Q+0pta2Xfn7JS5veClCKTKNXNIxHnhkBwoAbqsbe1E0aOFWwJIUxycgDz3Dh4ZxIcHO1ajAcX3y64e15qt8OFtHvn4OtOjayY2F4Db0xoE7LswHAme5l7o60iiOugRQm2X45kc95ageRBRL+Z2kvTm8r6XoB2oGLk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750922; c=relaxed/simple;
	bh=Pzb0125bu/BFojokRpFZI9bIpkLCBhlMUhi6VThSyyU=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IZ95Sd9fvTFaVsdbkPHYHD1WrXb8588kzgcPKeMUf9KjBScnBAU7xdtG5eJbn/oFbxoOP+QIcIw55UPYHlCV5t13sE8uepdltDL9NcpFpwk+UWy2YXGKZOiYdpvNGUmWET+EwQWpnAjJLsN5ejHIovDWq99h/x/K3z9YjmfLm4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ghe53PxA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ghe53PxA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D671F0089C;
	Sun, 11 Oct 2026 20:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791750920;
	bh=DeF8GQVa9XVoL3qk5CifQa5s+Fc+u8mip92kal5KsWM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ghe53PxA03AYv1W3lxX85qki2ZHROtMeIr5WzcuqOO1esSfEQS2uIy6ZoqOe83jrY
	 Z9d2u1qf8rE/k4A23UD0QIgIkhnLcshbi1hDbtrCKUtXRBH87L1IWV7dwYsRRw2YJa
	 0YTPIxhw08U0VTJPOBrTyerRGFIlMXzm+TdfqoHdqr7TinpMj6LY/UkZswvckLf7Rk
	 +kLwh1O4CJWXAwQH1VHBUjo3HYUNDnWLHwhshHIdvK1ujtibjsmt+aNxFpLXmR9pNW
	 /5KwYPniuAk8DQnXQurGRhVG8v4PaTC7CqXI9ETw+54gKZw8dpnBroVBGskhsUGh8Q
	 oTIJkS+TsEeEg==
Subject: Re: [PATCH net-next v3 2/9] tls: Check for a pending signal after an
 empty record
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 11 Oct 2026 20:35:19 +0000
Message-ID: <179175091986.434549.854005976353552945@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-2-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-2-6d52d98389b3@kernel.org>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In tls_sw_recvmsg() (net/tls/tls_sw.c), the only new way out of
  a run of empty application_data records is `if (nodata &&…
- [Medium] The new check in tls_sw_recvmsg() runs before
  tls_rx_rec_wait() and before any `!timeo` test.

--

tls: Check for a pending signal after an empty record

This commit adds a signal_pending() check to tls_sw_recvmsg(). The check
runs before the next record is fetched after a zero-length
application_data record, so a stream of empty records cannot hold the
caller in recvmsg() regardless of signals. The commit also decrypts empty
records synchronously, so the error from that check is not overwritten at
recv_end.

Closes: https://sashiko.dev/#/patchset/20260720-tcp-read-sock-v2-0-29545d034f3c@kernel.org?part=1

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 275a6047da9e3..32be5a8f80ed9 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1858,6 +1859,16 @@ int tls_sw_recvmsg(struct sock *sk,
>  		struct tls_decrypt_arg darg;
>  		int to_decrypt, chunk;
>  
> +		/* A run of empty records advances neither loop bound, and
> +		 * tls_rx_rec_wait() tests for a signal only after it sleeps.
> +		 */
> +		if (nodata && signal_pending(current)) {
> +			long timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> +
> +			err = sock_intr_errno(timeo);
> +			goto recv_end;
> +		}

[Severity: Medium]

Should a nonblocking reader get -EAGAIN here instead of -EINTR? With
MSG_DONTWAIT, sock_rcvtimeo(sk, true) returns 0, so sock_intr_errno(0)
returns -EINTR. This check also runs before any !timeo test.

Elsewhere the nonblocking -EAGAIN check comes first. For example,
tls_rx_reader_acquire() does:

    if (timeo <= 0)
        return -EAGAIN;
    if (signal_pending(current))
        return sock_intr_errno(timeo);

tls_rx_rec_wait() and tcp_recvmsg_locked() also test !timeo before they
check for signals.

signal_pending() is also true when only TIF_NOTIFY_SIGNAL is set. io_uring
rings without DEFER_TASKRUN queue task_work with TWA_SIGNAL or
TWA_SIGNAL_NO_IPI, and that sets TIF_NOTIFY_SIGNAL on the submitting task.
io_recv() and io_recvmsg() issue inline with MSG_DONTWAIT and retry via
poll only on -EAGAIN. Any other error fails the request:

    if (ret == -ERESTARTSYS)
        ret = -EINTR;
    req_set_fail(req);

Suppose an empty record arrives from the peer while task_work is queued to
the submitter. Could that now fail a nonblocking recv, or end a multishot
recv, with -EINTR even though no real signal was delivered? Before this
patch, the record loop did not return -EINTR to a nonblocking reader.

The same pattern also shows up in tls_sw_splice_read() later in this
series.

> +
>  		err = tls_rx_rec_wait(sk, flags & MSG_DONTWAIT,
>  				      released, !!(decrypted + copied));
>  		if (err <= 0)

[ ... ]

> @@ -1910,6 +1924,7 @@ int tls_sw_recvmsg(struct sock *sk,
>  		/* TLS 1.3 may have updated the length by more than overhead */
>  		rxm = strp_msg(darg.skb);
>  		chunk = rxm->full_len;
> +		nodata = !chunk;
>  		tls_rx_rec_done(ctx);

[Severity: High]

Does this put a limit on a run of empty records when the reader has copied
nothing? nodata is only used together with signal_pending(). Nothing
counts consecutive empty records or checks a timeout. With
decrypted + copied == 0, the loop condition stays true:

    while (len && (decrypted + copied < target || tls_strp_msg_ready(ctx))) {

For MSG_DONTWAIT or O_NONBLOCK readers, tls_rx_rec_wait() returns 1
immediately whenever tls_strp_msg_ready() is true, so it never reaches
this check:

    if (!timeo)
        return -EAGAIN;

Because done stays 0, tls_read_flush_backlog() also keeps flushing the
backlog while tcp_inq(sk) <= max_rec, which pulls in more records during
the same call.

If a peer sends empty records faster than they can be decrypted, could it
keep an event-loop thread inside recvmsg() indefinitely, with no signal
ever arriving?

For blocking readers with SO_RCVTIMEO, tls_rx_rec_wait() recomputes
timeo = sock_rcvtimeo(sk, nonblock) on every call. Each empty record
therefore restarts the full timeout. By contrast, tcp_recvmsg_locked()
uses one timeo for the whole call.

Could one empty record per timeout period stop SO_RCVTIMEO from ever
expiring?

The commit message says "a nonblocking reader gets -EINTR". It seems a
nonblocking reader is still held unless a signal happens to arrive.

tls_sw_read_sock() in the same file already caps this case:

    if (++nodata >= TLS_RX_NODATA_LIMIT) {

Would tls_sw_recvmsg() need a similar limit, or a check against an overall
timeout?

A later commit in this series, "tls: Return copied data ahead of a run of
empty records", breaks out of the loop when decrypted + copied >= target.
That covers readers that have already met their target. Another later
commit message in the series says "A reader that has copied nothing still
reads empty records for as long as they arrive.", so the copied-nothing
cases above still look open at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261007-tls-follow-on-v3-0-6d52d98389b3%40kernel.org

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4903F4DE4;
	Sun, 18 Oct 2026 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351377; cv=none; b=fLsIyzXb1hQNuQd+x+WbYvLqaCeVt88inkhnUN/fAy9vbs4cMeTvkIvK9EHOKgFzJRlU+arPvbPxt+tcJ5kTMVvgS1fcQj/fye6YOHaUoZV3BFJ84yYVm5gMZdRpaeXbI1FvgFyiy/w4DsEUTidBrbcLGMYTbpuegRsbpd74SrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351377; c=relaxed/simple;
	bh=UNHiYhkvaU116pu8IEDCdV81wP/B0R3r401wWts67mw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S9hymChTOVjoja/rihHLkm0SCfQ2q92BEOG7KJykWENFOsiXPyyOrNEAG8STrT1oMDlTk5h4Zdc+R5inXpca4V2NTkDQgKPaZK6+cbdxqqovgWG/8509ptvyZxVzyct6EEppOxEisCZrePwYw45bi82XV5PHFj3ifNQ5iUG22LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lotfOvix; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lotfOvix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD79A1F000C5;
	Sun, 18 Oct 2026 19:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792351376;
	bh=M/jp75aFWhYc7efXUyhha86fwypkGoGHZ3rTLZLN5nY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lotfOvixE17R3cHztZ8dQhtT60cQ5Zw8InnVDNNeGxnNIsOfb+V3JCN4zbnm5+m9a
	 jH340aidWKOQ0tgmNaaovfYAMFfkvU2tsxBrdjqaDn4PJDH8Nk/9iPUI5/uiqkB+f2
	 MuAgakeuS7HMRhTzZsBJrWdSmPVakIDsBJwIMkiFc/ascRq3L+vAsd2q+CHNptJP8o
	 ykgiFpv6SmMG7ZmLSj6asNt8gRrEgxGV3dvyxmhLKWzCffF8K0MpV0fYzAT32sKFvu
	 XmxkO6MIwxlXdpinNpRQsaQfWFxSjq+jMxzAvpPdpX2vhchcBPtidLfCv4UR9JXwrB
	 sBWHeT3tOMwWg==
Subject: Re: [PATCH net-next v5 02/10] tls: Check for a pending signal after
 an empty record
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 18 Oct 2026 19:22:55 +0000
Message-ID: <179235137532.3135.15441856709185004990@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-2-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-2-e76c301d4f05@kernel.org>
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

- [Medium] tls_sw_recvmsg() (net/tls/tls_sw.c) still has no bound on a
  run of zero-length application_data records for any caller that has no…

--

tls: Check for a pending signal after an empty record

The patch adds a signal_pending() check to the tls_sw_recvmsg() receive
loop. The check runs before the next record is fetched after an empty
one, so a stream of zero-length application_data records can no longer
hold a signaled caller in recvmsg(). Empty records are also decrypted
synchronously, so recv_end does not discard the errno.

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 37fcca95c0467..ac4da28ed9c89 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1858,6 +1859,18 @@ int tls_sw_recvmsg(struct sock *sk,
>  		struct tls_decrypt_arg darg;
>  		int to_decrypt, chunk;
>  
> +		/* A run of empty records advances neither loop bound, and
> +		 * tls_rx_rec_wait() tests for a signal only after it sleeps.
> +		 */
> +		if (nodata && signal_pending(current)) {
> +			long timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> +
> +			err = -EAGAIN;
> +			if (timeo)
> +				err = sock_intr_errno(timeo);
> +			goto recv_end;
> +		}
> +

[Severity: Medium]
Can a run of empty records still hold tls_sw_recvmsg() indefinitely
when the caller never has a signal pending?

An empty record sets chunk to 0. Neither len nor decrypted moves, so the
loop condition stays true for a reader that has copied nothing:

    while (len && (decrypted + copied < target || tls_strp_msg_ready(ctx))) {

On each pass, tls_rx_rec_wait() skips its wait loop and returns 1 while
tls_strp_msg_ready() is true. It never reaches either of these exits:

    if (!timeo)
        return -EAGAIN;
    ...
    ret = sk_wait_event(sk, &timeo, ...);

It also recomputes timeo with sock_rcvtimeo() on every call. So
MSG_DONTWAIT, O_NONBLOCK and SO_RCVTIMEO all have no effect while empty
records keep arriving. The socket also stays owned through
tls_rx_reader_lock() the whole time.

The only new exit is signal_pending(). A remote peer cannot make that
true for in-kernel MSG_DONTWAIT readers on kTLS sockets, for example:

net/sunrpc/svcsock.c:svc_tcp_sock_recvmsg() {
    ...
	ret = sock_recvmsg(sock, msg, MSG_DONTWAIT);
    ...
}

nfsd threads run that one. xs_sock_recvmsg() in net/sunrpc/xprtsock.c
is another: xs_stream_data_receive() calls it with MSG_DONTWAIT from the
xprtiod workqueue. Userspace nonblocking event loops that are not being
signaled are in the same position.

The commit message says the tls_sw_read_sock() callers "cannot act on a
signal", and the recvmsg callers above cannot either. Yet
tls_sw_read_sock() and tls_sw_splice_read() each cap consecutive empty
records:

    if (++nodata >= TLS_RX_NODATA_LIMIT) {

tls_sw_recvmsg() keeps only a boolean for the last record:

    nodata = !chunk;

The splice commit later in the series justifies its cap this way: "Each
fetch restarts SO_RCVTIMEO under the socket lock, so a stream of empty
records could hold ... the lock for as long as the stream lasts". Does
the same reasoning apply to recvmsg?

A later commit in the series, "tls: Return copied data ahead of a run of
empty records", handles a reader that has already copied target bytes:
it breaks out of the loop on an empty record. A reader that has copied
nothing still loops. Later commit messages in the series say so: "A
reader that has copied nothing still reads empty records for as long as
they arrive".

Should tls_sw_recvmsg() get the same TLS_RX_NODATA_LIMIT cap as its
sibling read paths?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014-tls-follow-on-v5-0-e76c301d4f05%40kernel.org

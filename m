Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85537515888;
	Tue, 13 Oct 2026 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907900; cv=none; b=WN4Ja7flXqsJYKhwFPk/yxLAgpBQFUq58ZhSw/lcdZxrYwDNOVfHWnsWllqDBB/+1OTBc4dTG5gxdLYzqlQw8UWrYi97/Rkh3J9FtlP0fOssh3Li8nuhC2SuUBAg11/hROMWp/R3jHpm2WZoYrNIAC9bh/QpmR7a5OTFJQtBQpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907900; c=relaxed/simple;
	bh=cAEZzZgR7Fepl0SIOj7WeyqXGvhC6eWsgu41O/qVakE=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fFCAtILLXcU7XPBXsofib006h81fZFJ087yfXpDHzc3F+tiNZLIRwnqZ1+FiFwNGVhVepEvfZb8DSqmtg/9hYw/vnfj9ZiOJO7BPnb5JYBO7hsr+mnAnbrjJ7Qj9U5lvhJWOITmzJMapqClUehzWCnNLkw6RGAx2qGhLc/U0M/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gF4pufeM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gF4pufeM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8365A1F00893;
	Tue, 13 Oct 2026 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907899;
	bh=XSKcX9vUBn5iF+ncEVBlqT78Ess0cKMzIW7/045pST0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gF4pufeMiF9UMkuW2QqMFfdXCD7yLoEkFPU5bckMwqE1jGT5XYr4LeZSv7youoxA5
	 BmdRy1zg7OjE9n2YCfrFDkrE9zuWLWnDwa484K5l5Tkufb0Cv+cQYX1v5KLiTbnq+/
	 SGlXLw9zG7XTn0CK7YepSvJBP6sf7AOYW8dEnAfIk8bYXkiGQh3DiT4mjhlqAkci1m
	 wOWmxWAKuIDChXCCw0qIcOcG/Zqb4pVGIWB7apASILqVDapjoT039IBAojsknC+tYT
	 zhWNh8aiWU5KOFo9GN6VBtJcp5Qhi3f+z/JAAdvz42mtvyt5P6ScM4GgcbxKTIhZuY
	 Sg3mca8gCf12w==
Subject: Re: [PATCH net-next v4 2/9] tls: Check for a pending signal after an
 empty record
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 13 Oct 2026 16:11:38 +0000
Message-ID: <179190789812.434549.8665010768729351575@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-2-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-2-8cea429565da@kernel.org>
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

- [High] In tls_sw_recvmsg() (net/tls/tls_sw.c), the patch adds one way
  out of a run of zero-length application_data records: `if (nodata &&…

--

tls: Check for a pending signal after an empty record

This patch adds a signal_pending() check to tls_sw_recvmsg(). The check
runs before the next record is fetched whenever the previous record was
empty, so a stream of zero-length application_data records no longer
leaves the caller unresponsive to signals. It also forces empty records
to be decrypted synchronously, so the error that ends such a run is not
overwritten at recv_end.

Closes: https://sashiko.dev/#/patchset/20260720-tcp-read-sock-v2-0-29545d034f3c@kernel.org?part=1

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index a64244566af44..f2062e141512c 100644
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
>  		err = tls_rx_rec_wait(sk, flags & MSG_DONTWAIT,
>  				      released, !!(decrypted + copied));
>  		if (err <= 0)

[Severity: High]
Can callers that never get a signal still be held in tls_sw_recvmsg()
for as long as the peer keeps sending empty records?

An empty record changes neither len nor decrypted, so the loop condition
stays true:

    while (len && (decrypted + copied < target || tls_strp_msg_ready(ctx))) {

tls_rx_rec_done() then parses the next queued record. That means
tls_rx_rec_wait() skips its while (!tls_strp_msg_ready(ctx)) loop and
returns 1 straight away.

The !timeo -EAGAIN exit, the SO_RCVTIMEO sleep and the signal check in
tls_rx_rec_wait() all sit inside that skipped loop.

The commit message says:

    A nonblocking reader gets -EAGAIN rather than -EINTR.

>From the code, though, a MSG_DONTWAIT reader that has copied nothing gets
-EAGAIN here only if a signal happens to be pending. With no signal, the
loop keeps consuming empty records. A blocking reader also never has its
SO_RCVTIMEO enforced.

Some in-kernel callers use MSG_DONTWAIT from contexts that do not take
signals:

    svc_tcp_sock_recvmsg()
        sock_recvmsg(sock, msg, MSG_DONTWAIT)    (nfsd threads)

    nvmet_tcp_try_recv_pdu() / nvmet_tcp_try_recv_data()
        kernel_recvmsg(..., MSG_DONTWAIT)        (nvmet-tcp io_work)

    xs_sock_recvmsg()                            (sunrpc client receive)

For these callers, nodata && signal_pending(current) is never true. While
they are stuck, ctx->reader_present stays set, so every other reader of
the socket waits in tls_rx_reader_acquire(). The peer only needs to
finish a handshake and then stream zero-length application_data records.

The earlier patch in this series, "tls: Bound consecutive no-data records
in tls_sw_read_sock()", limits the same kind of run with
TLS_RX_NODATA_LIMIT, and that limit works whether or not a signal is
pending.

Would a similar count limit in tls_sw_recvmsg() cover the callers that
the signal test misses?

The later patch "tls: Return copied data ahead of a run of empty records"
adds a break once decrypted + copied >= target. Its commit message says
"A reader that has copied nothing still reads empty records for as long
as they arrive", so the case where nothing has been copied still seems
open at the end of the series.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012-tls-follow-on-v4-0-8cea429565da%40kernel.org

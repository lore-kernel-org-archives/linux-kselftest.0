Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A32942C518;
	Sun, 18 Oct 2026 19:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351383; cv=none; b=mOPwU9K6eXKZi0DyI4soYdqFxLpBW6q5KvcRAATSkqJSrH9urQz0TqY+AtjA0M4de936gymbM504kbjUB/+ojuJp2kuUiNd7lFKlytavym5qQyHmbWnxYbMQY/3R9gTvUvocTKV5vmfXaCeKtlsXdB55bWIq5hixy554BfxOYMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351383; c=relaxed/simple;
	bh=B37RTulw4RX1Ff9FqeqMQ+FAneV8Yl3f0jLUHusMLF4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ntrb7vCw0jXFn3lKTJGHvz+svJkjZJhc3eRxvK1tmnJyk4Qaq7+fe275JR2YdvqljAlwjcVrlSAdvidrvkmTVx4XM9f9JQkqJm3vy2OFJNg84AbNX/1LDPX00G4k+EobLn3fC9WPkKyIrI0VE9GcF9x/vU4kMXbO+Kj7hbYiuJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jE6CClyV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jE6CClyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333B21F000C5;
	Sun, 18 Oct 2026 19:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792351382;
	bh=mEcpHdoCCwqcpv4/GZZ9AiedtffME2iXy+yfQZbjY4I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jE6CClyVU4vSTbyhoNYVxzgGywNENIcYeLJUwid9rPOAUYR97VUeFZjY40qBe7XyG
	 N5IaTbQRzF9VGU5Du7Bj8/UxamIbtMfks1YDYftXnGRNYkNafEcRSm/IisPvDj/3Ko
	 x35qehsaLq4F8y9TZ4IbTGPtYYYNx6nA1p5KpzaRED4PaWZVBzoxRku7iHhRwrgsjD
	 VjfZMrbBRTeChdmXETg9g3Rz/refv03fdCgd6tGpTkyB4alsFDTzSihBfuV+OzWBg8
	 gx8KIAa0rRTyqMNgwF9CULm+0SpgbsuHtiflBHjyDmnsJeuv/s2T8Fc1w5X8RM/wXY
	 HOTf0zpjBzkMQ==
Subject: Re: [PATCH net-next v5 06/10] tls: Return copied data ahead of a run
 of empty records
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 18 Oct 2026 19:23:00 +0000
Message-ID: <179235138070.3135.12865177018877469954@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-6-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-6-e76c301d4f05@kernel.org>
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

- [High] The new early exit in tls_sw_recvmsg() (net/tls/tls_sw.c:1946,
  `if (decrypted + copied >= target) break;`) only fires once the low-…

--

tls: Return copied data ahead of a run of empty records

This patch makes tls_sw_recvmsg() leave its receive loop at a zero-length
application_data record once the receive low-water mark has been met. The
goal is to stop a stream of empty records from holding back data that has
already been copied. A reader that has copied nothing keeps reading empty
records for as long as they arrive.

Link: https://lore.kernel.org/r/179124254665.434549.12245680127262431659@kernel.org

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 153ff135a395e..9b4e66567ee8d 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -1939,6 +1939,12 @@ int tls_sw_recvmsg(struct sock *sk,
>  
>  			/* An empty record still marks a boundary. */
>  			msg->msg_flags |= MSG_EOR;
> +
> +			/* Return data already copied instead of holding it
> +			 * through a run of empty records.
> +			 */
> +			if (decrypted + copied >= target)
> +				break;
>  			continue;

[Severity: High]
Does this leave the same stall in place for a reader that is still below
target?

When SO_RCVLOWAT is above the bytes copied so far, or MSG_WAITALL makes
target equal len, the check above is false. The empty record then takes the
continue. An empty record changes neither len nor decrypted, so the loop
condition stays true:

    while (len && (decrypted + copied < target || tls_strp_msg_ready(ctx))) {

Each pass calls tls_rx_rec_wait(). That function recomputes the timeout on
every call and skips its wait loop while a record is ready:

    timeo = sock_rcvtimeo(sk, nonblock);

    while (!tls_strp_msg_ready(ctx)) {
        ...
        if (!timeo)
            return -EAGAIN;
        ...
    }

As a result, MSG_DONTWAIT, O_NONBLOCK and SO_RCVTIMEO never come into
play. The only way out is this check at the top of the loop:

    if (nodata && signal_pending(current)) {

So if a peer keeps validly encrypted empty application_data records ready,
can a nonblocking or timed reader with partial data stay in the kernel?
It would hold the socket and reader locks and withhold the data it has
already copied.

The commit message describes that outcome as "the reader does not get the
data already copied until the stream stops or a signal is pending". The
same applies to a reader that has copied nothing, which the commit message
mentions.

tls_sw_splice_read() and tls_sw_read_sock() in the same file already stop a
run of empty records with a counter:

    if (++nodata >= TLS_RX_NODATA_LIMIT) {
        err = -EAGAIN;
        goto splice_read_end;
    }

Would a consecutive-empty-record cap like TLS_RX_NODATA_LIMIT in
tls_sw_recvmsg() also cover the below-target and zero-copied readers? It
would also cover the case this patch handles. TLS_RX_NODATA_LIMIT is
currently defined after tls_sw_recvmsg(), so it would need to move up.

>  		}
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014-tls-follow-on-v5-0-e76c301d4f05%40kernel.org

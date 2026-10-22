Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699058;
	b=okzTeKlB2mqchpeXQdbWPiyX2TU7F+167CRcnR5RxvhrxRJz9KYN995jov6tPRxOECtU
	 Dq0J3coBB8SMrZF6+ylLDaPd2BaiiFIq9/zfjBTPF60mehqkuZIBAVdNBi7GRorDxtf+/
	 3b14I4hLehNj3w5CDwroyCkZNhLmImcf6kX4JqUb/DCKyIqiSlynfHSYbchdHsaWuaB6e
	 EJNQLc9GgTSkOF1/Q1IdDD9ydJ29pKHvCudS9q4w2S5v+mKODT5eiiKU+O6/tcQCiLMlg
	 pA5NlGZfFdGmzz+cB4qIgoQrvAeC7+8s0ErbtgJW9vnlnC+GbowIs5Me8Go2Pegpf7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699058;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5p+y2S2mC9iOR/GfKWW8kITIvewfkyWN2yMY8Ty11uc=;
	b=gmhYVhXpLvKeLsMlLHzab3Ouzqng5VsMreOdY6uJtFj9MsGZYt2Z44U1Zd9IRP0hor0d
	 1On97RXnVuoViUUhQFBpU/MEpRnBM2JkKU4+xtS1YA7vqvLCTX6XLrQqLEkuhAcfyQ1eX
	 mRU0sLtHHISDQT4BEP8EGW+C8IhsDTZgoo1HFpVAl46J0oz8IeSn5gZtcJi3gCrnX6o6s
	 zlUnajdNIOXk92Y6tXHWXT/24jnlEN2yQhGH9+ZWDdcIOaaTY1yqYJBm3Zzjwh+02v4Tp
	 jk6dA/HI7kqbq7Ah1g+Ul86ZqEuQiCjS1Dw48pRJQZcinp/68zHHhwIY7OZVQcel7Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXBcLFXe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA7606A31D;
	Thu, 22 Oct 2026 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXBcLFXe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC451F01828;
	Thu, 22 Oct 2026 19:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792699057;
	bh=5p+y2S2mC9iOR/GfKWW8kITIvewfkyWN2yMY8Ty11uc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eXBcLFXeekSk2eJG1IfF7g4nPXzvPf8hKR0x6kyMzpUzC8FWTqrZcgGXyK2E06cya
	 mdrFH59p9InTDMZMN8Swk7gUvsQylgkXTJsi49I7eghN1hJjfZK+mbYkjl8wLOjWmv
	 m+xjsrsNSOz/QEntN6SL2zENL86FTXq0Mz7/yqApShdFqycVRDyQpO/gN1jSw/Xjdh
	 QxnI4T+Ul2w81/iq9ps5LhhXgE2nYijdyWZcQLHy+/5blN1cFK0mbfG2Be3vcF546r
	 TatgpGqfHwu+zrB+SJMcttBsFSmD3osXiGpytUVFdeIsDfnNpkpF4JA4pMN1h6cRlI
	 8Zvz6TUS5WXEg==
Subject: Re: [PATCH net-next v6 2/9] tls: Check for a pending signal after an
 empty record
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 22 Oct 2026 19:57:36 +0000
Message-ID: <179269905670.1189532.10172561334611048258@kernel.org>
In-Reply-To: <20261019-tls-follow-on-v6-2-ab01c4ecca0c@kernel.org>
References: <20261019-tls-follow-on-v6-2-ab01c4ecca0c@kernel.org>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The only new exit from a run of empty records in
  tls_sw_recvmsg() is `if (nodata && signal_pending(current))`.

Pre-existing issues:
- [High] At this commit, a blocking recvmsg(MSG_PEEK) queues every zero-
  length application_data record on ctx->rx_list as a cleartext skb…

--

tls: Check for a pending signal after an empty record

This commit adds a signal_pending() test in tls_sw_recvmsg() before the
next record is fetched after a zero-length application_data record. The
goal is that a peer streaming empty records cannot hold the reader in
recvmsg() indefinitely. Nonblocking readers with a signal pending get
-EAGAIN, and empty records are always decrypted synchronously.

Closes: https://sashiko.dev/#/patchset/20260720-tcp-read-sock-v2-0-29545d034f3c@kernel.org?part=1

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 0ef0edd51edd..e8a9f0c91e81 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1858,6 +1867,14 @@ int tls_sw_recvmsg(struct sock *sk,
>  		struct tls_decrypt_arg darg;
>  		int to_decrypt, chunk;
>  
> +		/* A run of empty records advances neither loop bound, and
> +		 * tls_rx_rec_wait() tests for a signal only after sleeping.
> +		 */
> +		if (nodata && signal_pending(current)) {
> +			err = tls_rx_signal_err(sk, flags & MSG_DONTWAIT);
> +			goto recv_end;
> +		}

[Severity: High]
Does this close the hang for callers that never receive a signal?

An empty record changes neither len nor decrypted, so the loop condition
stays true:

  while (len && (decrypted + copied < target || tls_strp_msg_ready(ctx))) {

When another record is already parsed, tls_rx_rec_wait() skips its wait
loop entirely. Neither its nonblocking exit nor SO_RCVTIMEO is reached:

    while (!tls_strp_msg_ready(ctx)) {
        ...
        if (!timeo)
            return -EAGAIN;
        ...
    }

That leaves signal_pending() as the only way out of a run of empty
records.

Two kinds of caller appear to still be held for as long as the records
keep arriving:

  - nonblocking readers (MSG_DONTWAIT or O_NONBLOCK) with no signal
    pending

  - in-kernel callers that do not take signals. One is nfsd threads, via
    svc_tcp_sock_recvmsg()->sock_recvmsg(sock, msg, MSG_DONTWAIT) on
    kTLS sockets (there is no allow_signal() in fs/nfsd/). Another is
    rpciod workers, via xs_read_stream(transport, MSG_DONTWAIT).

In the nfsd case the thread spins in tls_sw_recvmsg() with the socket
lock held, so kthread_stop() is blocked as well.

The commit message says tls_sw_read_sock() has "callers that cannot act
on a signal". The earlier commit "tls: Bound consecutive no-data records
in tls_sw_read_sock()" bounds that path with TLS_RX_NODATA_LIMIT.
tls_sw_recvmsg() has callers of the same kind, but it gets no count bound
and no nonblocking exit.

The later commit "tls: Return copied data ahead of a run of empty records"
adds a break when decrypted + copied >= target. That covers a reader that
already has data. The case where nothing was copied remains, and the
series says so: "A reader that has copied nothing still reads empty
records for as long as they arrive".

Could the run also be ended for nonblocking readers? One option is to
return -EAGAIN after an empty record. Another is to stop after a bounded
count, as tls_sw_read_sock() does.

> +
>  		err = tls_rx_rec_wait(sk, flags & MSG_DONTWAIT,
>  				      released, !!(decrypted + copied));
>  		if (err <= 0)

[ ... ]

> @@ -1910,6 +1930,7 @@ int tls_sw_recvmsg(struct sock *sk,
>  		/* TLS 1.3 may have updated the length by more than overhead */
>  		rxm = strp_msg(darg.skb);
>  		chunk = rxm->full_len;
> +		nodata = !chunk;
>  		tls_rx_rec_done(ctx);
>  
>  		if (!darg.zc) {

[Severity: High]
This is a pre-existing issue and was not introduced by this patch. Can a
blocking recvmsg(MSG_PEEK) grow ctx->rx_list without bound here?

MSG_PEEK disables zero-copy, so every empty application_data record takes
the peek arm further down in tls_sw_recvmsg():

    if (is_peek) {
        peeked += chunk;
        goto put_on_rx_list;
    }
    ...
put_on_rx_list:
    decrypted += chunk;
    len -= chunk;
    __skb_queue_tail(&ctx->rx_list, skb);

With chunk == 0, neither decrypted nor len advances. The loop keeps
accepting records and queues a cleartext skb for each one.

tcp_read_done() has already released the TCP-side data, so TCP flow
control does not push back on the peer.

The later commit "tls: Consume empty data records in tls_sw_recvmsg()"
fixes this. Its message says "The peek arm and the async arm queue each
empty record on rx_list, and a peer that streams empty records grows
rx_list without bound". At the end of the series, the empty-record branch
consumes the skb before the peek arm is reached.

The async arm also cannot queue empty records at that point. TLS 1.2
empty records are decrypted synchronously, and async is disabled for
TLS 1.3.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-tls-follow-on-v6-0-ab01c4ecca0c%40kernel.org

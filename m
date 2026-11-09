Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244715;
	b=rVu8Dl6seG0xY8XhNz7vARSfGZYtWWkkjSIgDxibBuxkPkYGOyLKYwMEtyJLIei4BqiW
	 pP9Yvv4qhYxPKcftuEdapVNIvcsKk2GGC/lKCtfqs84FruUD9YG8YNFoApfMzbUVVZxuQ
	 G8oIjCOaAbh17ymfnPBsBR7SHKiVhXE5bGJNjyjwCi3wR38P9UDYQvr/vXOEMbkVeRttB
	 3pwlIOzCG5yuVKjYXK/RBnZbYseyrCmme1bitbjgevyp0PkMd5AdqKBx31QqQqUGrJfBj
	 VKanLM8PvEy5mRsavitzF1aBxuhT4YXuW1pMULm8opmJTJpMeLfen+KcieiuMvhjMrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244715;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NKBythzzX1X+qqWFUaZ4bSCXV58wist4G0vUQRYy4Sg=;
	b=T8N48/otVnZ9a77k/E5IDy2y1JwpakmDZhloPpF1E5OsLV622+gyjcTmqP29ilbxcScZ
	 taPGetumVIUEHldOJ91nLkcsxUg+HgiQ1ANwQKg7kPLtTqhsMwdsq+MpRVuMlxVtDMuZd
	 Dan5/sbUrCz/xhcwXxe/dg8w6HyziOjM3MT4jBswwAnIvVHuqa4eAi62fsLp3jp0UXNj+
	 4aFG77lmEhaTwagsnNq0u5jI2nJ2zvOoUhxifkQJHEHWM4g2UwSoQrA6nwtYyil2fDZhH
	 h7y+lQbdEf5oX0uk+XgGQY37Zg6fqaady5Rl0A4GhDR5y3DoyeUAusdXbVy9kbvU64w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eTU1b/MQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FB1606A33A;
	Mon,  9 Nov 2026 17:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTU1b/MQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BD81F008A2;
	Mon,  9 Nov 2026 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794244714;
	bh=NKBythzzX1X+qqWFUaZ4bSCXV58wist4G0vUQRYy4Sg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eTU1b/MQiWfOTY9kq3PDF01WZGqx0cZ2OWXBYeQNJ1PVuoSZkV0UwFA42RS0cRIJy
	 39jz8Plu/GLK0lK2h3CiaY/B8Z69IF5n6AZq7Yb4ipQVCfOGQeWz9Lnee961PdVj8p
	 dwtVOxpNr3rTSPPmQPepRnSc9NHJLbf9Jm4VkyZ1GVhWnnc/5XYscvV+2xeEdjk9f9
	 pW1a7w2OOyJl5lDT1id0rqLk7juHAIFJSq3VAcNWXBNGsjQwLrz3LGijeaA+r79mRS
	 8n1ohVzbusBcWl4LEKyxWGfvBRM+atXqHq/J+YkWuSaF/z3pWcsSle0KiQxnmUVlAD
	 UsLUSXLmGQztQ==
Subject: Re: [PATCH net-next v6 5/6] tls: send a KeyUpdate at the record limit
 and on request
From: netdev-bot+sashiko@kernel.org
To: martin.nvme.dev@gmail.com
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, hare@kernel.org,
 cel@kernel.org, kernel-tls-handshake@lists.linux.dev,
 alistair.francis@wdc.com, martin.belanger@dell.com
Date: Mon, 09 Nov 2026 17:18:33 +0000
Message-ID: <179424471332.994134.12793914111732564453@kernel.org>
In-Reply-To: <20261105-keyupdate-rfc-v6-5-99b695f9eb4f@gmail.com>
References: <20261105-keyupdate-rfc-v6-5-99b695f9eb4f@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Race in the kernel KeyUpdate path: its state can change while
  the socket lock is dropped.
- [Medium] The record limit is wrong for AES-128-CCM.
- [Medium] setsockopt(SOL_TLS, TLS_TX_KEY_UPDATE) can block indefinitely
  and ignores O_NONBLOCK.
- [Low] Documentation/networking/tls.rst does not match the
  implementation in two places.

--

tls: send a KeyUpdate at the record limit and on request

With this commit, the kernel sends a TLS 1.3 KeyUpdate before the next
Application Data record in two cases: when the TX key has protected 2^24
records (except ChaCha20-Poly1305), or when the peer sent
update_requested. It also adds the TLS_TX_KEY_UPDATE socket option to
send a KeyUpdate on demand and, optionally, ask the peer to update too.

> diff --git a/Documentation/networking/tls.rst b/Documentation/networking/tls.rst
> index 2e011bd1ce4ae..69752a6d67df4 100644
> --- a/Documentation/networking/tls.rst
> +++ b/Documentation/networking/tls.rst
> @@ -326,6 +326,23 @@ direction is then left to the application again.
>  
>  The secrets cannot be read back.
>  
> +With a registered TX secret, the kernel sends a KeyUpdate before the key
> +reaches its record limit (RFC 9846, section 5.5): after 2^24 records, except
> +for ChaCha20-Poly1305, which has no limit. It also sends one before the next
> +record when a received KeyUpdate asks for it. With a registered RX secret,
> +the kernel processes a received KeyUpdate and does not pass the record to
> +the application. A peer that sends more than 8 KeyUpdates in one second ends
> +the connection.
> +
> +TLS_TX_KEY_UPDATE
> +~~~~~~~~~~~~~~~~~
> +
> +TLS 1.3 only. Send a KeyUpdate now and install the next TX key. Needs a
> +registered TX secret. The value is an ``int``: 0 to send a KeyUpdate, 1 to
> +also ask the peer to update its key. Asking the peer needs a registered RX
> +secret, and fails with ``EBUSY`` until the peer has answered the previous
> +request.

[Severity: Low]
This isn't a bug, but two parts of this text don't seem to match the code.

The text says the reply is sent "before the next record". In
tls_sw_sendmsg_locked(), the check only runs for data records:

    if ((!ctx->open_rec || !ctx->open_rec->msg_plaintext.sg.size) &&
        record_type == TLS_RECORD_TYPE_DATA) {
            ret = tls_tx_maybe_update_key(sk, msg->msg_flags);

Suppose tx_key_update_reply is set and the application sends an alert or
handshake record with TLS_SET_RECORD_TYPE. That record goes out before
the reply. This matches RFC 9846 section 4.7.3 and the commit message
("before the next Application Data record"). Should the documentation
say the same?

For TLS_TX_KEY_UPDATE, the text says "Send a KeyUpdate now and install
the next TX key". If the value is 1 and a peer request is pending,
tls_sw_key_update() calls tls_tx_key_update() twice:

    if (request && ctx->tx_key_update_reply) {
            ret = tls_tx_key_update(sk, TLS_KEY_UPDATE_NOT_REQUESTED,
                                    MSG_NOSIGNAL);
            ...
    }

    ret = tls_tx_key_update(sk, request ? TLS_KEY_UPDATE_REQUESTED : ...

That sends two KeyUpdates and moves the TX key forward two generations in
one call. Could the documentation mention this, and also the EKEYEXPIRED
return?

[ ... ]

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 027c32edaf850..433a43d13a872 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1005,6 +1021,153 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
>  	return copied > 0 ? copied : ret;
>  }
>  
> +/* RFC 9846 section 5.5 allows 2^24.5 full-size records per AES-GCM key.
> + * Send the KeyUpdate a little earlier.
> + */
> +#define TLS_KEYUPDATE_TX_RECORDS	BIT_ULL(24)

[Severity: Medium]
The comment bases 2^24 on the AES-GCM figure. However,
tls_tx_maybe_update_key() applies it to every cipher except
ChaCha20-Poly1305:

    limit = ctx->prot_info.cipher_type != TLS_CIPHER_CHACHA20_POLY1305 &&
            get_unaligned_be64(ctx->tx.rec_seq) >= TLS_KEYUPDATE_TX_RECORDS;

tls_traffic_secret_len() accepts TLS_CIPHER_AES_CCM_128. An AES-128-CCM
socket can therefore register a TX secret and reach this path.

Is 2^24 the right limit for AES-128-CCM? RFC 9147 Appendix B uses the
CCM confidentiality bound (2l * q)^2 / 2^n. With l = 2^10 blocks and
n = 128, that gives about 2^23 full-size records for the 2^-60 target
used by TLS 1.3. At 2^24 records the attacker's advantage is closer to
2^-58.

Should CCM get a lower threshold? If not, could the comment explain why
the GCM figure also covers CCM?

[ ... ]

> +	/* A control record closes the open record first, so all data
> +	 * written so far goes out with the current key, ahead of the
> +	 * KeyUpdate.
> +	 */
> +	ret = tls_sw_sendmsg_locked(sk, &msg, sizeof(body));
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Nothing may be encrypted with the next key before the KeyUpdate
> +	 * is encrypted with the current one.
> +	 */
> +	ret = tls_encrypt_async_wait(ctx);
> +	if (!ret)
> +		ret = tls_keyupdate_rekey(sk, 1);
> +	if (ret) {
> +		/* The peer expects the next key: the connection is lost */
> +		TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSTXREKEYERROR);
> +		tls_err_abort(sk, ret);
> +		return ret;
> +	}

[Severity: Medium]
Can the TX key state change between the caller's tx_secret check and
this tls_keyupdate_rekey() call?

The nested tls_sw_sendmsg_locked() can drop the socket lock while
tx_lock is still held. For example, when the send buffer is full:

    wait_for_sndbuf:
            sk_set_nospace(sk);
    wait_for_memory:
            ret = sk_stream_wait_memory(sk, &timeo);

Pushing the record through tcp_sendmsg_locked() can drop it as well.

In do_tls_setsockopt(), TLS_TX and TLS_TX_TRAFFIC_SECRET only take
lock_sock(), not tx_lock. A TLS_TX rekey from another thread can
therefore run inside this window. do_tls_setsockopt_conf() then does:

    if (tx) {
            memzero_explicit(&ctx->tx_secret,
                             sizeof(ctx->tx_secret));
            ctx->tx_key_update_reply = false;
    }

When this thread resumes, tls_keyupdate_rekey(sk, 1) sees
secret->len == 0 and returns -EINVAL. tls_err_abort() then aborts the
connection.

If the wait happened before the KeyUpdate record was copied, the
KeyUpdate is also encrypted with the key user space just installed. The
peer then receives a KeyUpdate that user space doesn't know about.

tls.rst documents handing KeyUpdate back to the application with TLS_TX
as supported. The application can't tell when sendmsg() will insert an
automatic KeyUpdate.

Should TLS_TX and TLS_TX_TRAFFIC_SECRET take tx_lock, as
TLS_TX_KEY_UPDATE and TLS_TX_MAX_PAYLOAD_LEN do?

[ ... ]

> +	/* A reply must carry update_not_requested */
> +	if (request && ctx->tx_key_update_reply) {
> +		ret = tls_tx_key_update(sk, TLS_KEY_UPDATE_NOT_REQUESTED,
> +					MSG_NOSIGNAL);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = tls_tx_key_update(sk, request ? TLS_KEY_UPDATE_REQUESTED :
> +				TLS_KEY_UPDATE_NOT_REQUESTED, MSG_NOSIGNAL);
> +	if (!ret && request)
> +		ctx->tx_key_update_asked = true;

[Severity: Medium]
Can setsockopt(SOL_TLS, TLS_TX_KEY_UPDATE) block indefinitely on a
non-blocking socket?

Both calls here pass only MSG_NOSIGNAL, and tls_tx_key_update() keeps
only these flags:

    msg.msg_flags = flags & (MSG_DONTWAIT | MSG_NOSIGNAL);

MSG_DONTWAIT is therefore never set on this path, and
tls_sw_sendmsg_locked() uses sock_sndtimeo(sk, 0). That is sk_sndtimeo,
which defaults to MAX_SCHEDULE_TIMEOUT.

If the send buffer is full, for example because the peer stopped
reading, the call sleeps in sk_stream_wait_memory() with tx_lock held.
It waits until space frees up, an error or shutdown happens, or a signal
arrives. sendmsg() turns O_NONBLOCK into MSG_DONTWAIT, but setsockopt()
has no such conversion.

tls.rst doesn't mention this blocking. It also lists only EBUSY. It
leaves out EINVAL (no TX secret, no RX secret with value 1, or not
TLS_SW), EKEYEXPIRED, and send errors such as EAGAIN after SO_SNDTIMEO,
EPIPE, or EINTR.

With value 1 and a pending reply, the first KeyUpdate can succeed and
the second fail. The call then returns an error even though one
KeyUpdate has gone out and the key has moved forward. Should this be
documented, or handled differently?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261105-keyupdate-rfc-v6-0-99b695f9eb4f%40gmail.com

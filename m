Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244713;
	b=UNyciplS9tZKdbeuyfPFK1dm9sHWVlLCtDqUx9TOVvVD772jZyQxvLboBmm9nPn7GerP
	 VfeSZjcutMp4Dx9papca8H3TfTILoVD6d8RoiqZYCe17IEGLcrf5AN++HQsAgjpV/m8wy
	 TAsvD10UYO/rmatVHDNCFAD60nZMEQTlusNCgks+oEU775YT01+wrQXDN0I+KqGBgehmh
	 InKY3uQv3TohNmMbEE5/Vrq0wboLFVe8UJXFF/IchDHrRpVrmsxUpbvdTyxwthMtYgUYz
	 izdFSI5mn0dEGCzOP3a2k8mgadYPz1FJQhq2lww01/DCACG+jhHoYO16jHM1ckoFhMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244713;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dg1Ve1k2D0p6y6YYcXLXFfE78VpkQJQ3K0MdRazN2QY=;
	b=z5DJWSoAp/SczU0/8JHvlG7nADTjEjIpo6Dqf6D31T5BTKgVq9bsoN3T559xb+9QSZeK
	 BYkTtTm0hriKx0Uh3jUQhmTRoDTIqpHqzjCCn8TA9962RlARHoEPmQHMBA3tQWEtUA5M9
	 qzQz9T976fhGEvzmOo1ZjCgmHfOdAfK31wuQB+nw5/Rrvepi81Li/8P2enBcKoDAmVm79
	 aiBjSwOrpzdc/8tf1u2u+MYzNawx6feEvi1madTqqu2yOXCf0RgshxuZfKcE+rYAc66U7
	 RGPOf0U+nGsOsEvJBgXTlwL9XqRA0vP+ni/7P1Dv60MssXOWvrtFZcNbvXZPOP85VZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfON09Jd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C40606A321;
	Mon,  9 Nov 2026 17:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfON09Jd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7141F008A1;
	Mon,  9 Nov 2026 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794244713;
	bh=dg1Ve1k2D0p6y6YYcXLXFfE78VpkQJQ3K0MdRazN2QY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hfON09Jd0iy6t6ZTrMm7u+34/+uA/BnnF89owaEXylIpsOf9uD237sNCSeKfC7mRH
	 YM35sKa2Hus6MzfJrfplNWkun5sl9v77CVThpP7WvpJJQwhSz3GJOMq6ODP4uPfJpu
	 I+V93CBC4pU7PywKaYcX9eTWP774r6c/LbZAC3HzNgFxQb8Jp191Rl0BHPWqUa4Lb4
	 XP7RV2DV7VO5U5XBdfWJQCpXVTbyOEK9pAw/xM+JZgvIydZ3/tEymYOgb4z36U5z/Y
	 N1w2/Mrjby365TuIJTO2kdmIH0dGPiOJEB73XlUaRdj6tKkfNZI9/gajxEA27wGdBn
	 2ShTpTDcgDoyA==
Subject: Re: [PATCH net-next v6 4/6] tls: update the RX key when a KeyUpdate
 is received
From: netdev-bot+sashiko@kernel.org
To: martin.nvme.dev@gmail.com
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, hare@kernel.org,
 cel@kernel.org, kernel-tls-handshake@lists.linux.dev,
 alistair.francis@wdc.com, martin.belanger@dell.com
Date: Mon, 09 Nov 2026 17:18:31 +0000
Message-ID: <179424471155.994134.17986033334400694237@kernel.org>
In-Reply-To: <20261105-keyupdate-rfc-v6-4-99b695f9eb4f@gmail.com>
References: <20261105-keyupdate-rfc-v6-4-99b695f9eb4f@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch only detects a KeyUpdate when it is the first
  handshake message in the record, and the commit message describes the…
- [Low] Documentation/networking/tls.rst no longer matches the RX
  KeyUpdate behaviour added by this patch.
- [Low] The kernel-doc of tls_keyupdate_rekey() in
  net/tls/tls_keyupdate.c says: 'On error the installed key and the…

--

tls: update the RX key when a KeyUpdate is received

With this patch, kTLS handles a received TLS 1.3 KeyUpdate itself when an
RX traffic secret is registered. The kernel derives and installs the next
key when the KeyUpdate record is decrypted, and does not pass the record
to recvmsg(), splice() or read_sock(). A malformed KeyUpdate, or more than
8 KeyUpdates per second from the peer, ends the connection.

> diff --git a/net/tls/tls_keyupdate.c b/net/tls/tls_keyupdate.c
> new file mode 100644
> index 0000000000000..49f45d892262d
> --- /dev/null
> +++ b/net/tls/tls_keyupdate.c

[ ... ]

> +/**
> + * tls_keyupdate_rekey - install the next key of one direction
> + * @sk: socket
> + * @tx: non-zero for the transmit direction
> + *
> + * Derive the next application traffic secret from the registered one,
> + * then its key and IV, and install them. The record sequence number
> + * restarts at zero.
> + *
> + * Return: 0 on success, or a negative errno. On error the installed key
> + * and the registered secret do not change.
> + */

[Severity: Low]
Does the installed key really stay usable on error?

tls_keyupdate_rekey() calls tls_set_sw_offload(), which calls
crypto_aead_setkey() on the live tfm (aead_recv or aead_send):

net/tls/tls_sw.c:tls_set_sw_offload() {
    ...
	rc = crypto_aead_setkey(*aead, key, cipher_desc->key);
	if (rc) {
		if (new_crypto_info)
			goto out;
    ...
}

The algorithm's setkey can fail. For example, the generic gcm setkey can
return -ENOMEM. When it does, crypto_aead_setkey() does this:

crypto/aead.c:crypto_aead_setkey() {
    ...
	if (unlikely(err)) {
		crypto_aead_set_flags(tfm, CRYPTO_TFM_NEED_KEY);
		return err;
	}
    ...
}

After that, every encrypt or decrypt on the tfm returns -ENOKEY. The old
key can no longer be used, even though cctx->iv, rec_seq and the secret
are unchanged.

Both callers in the series abort the connection on any error: the RX path
here, and the TX path in "tls: send a KeyUpdate at the record limit and on
request". So nothing depends on this guarantee today.

Could the comment be reworded so that a future caller doesn't assume the
old key still works after a failed rekey?

[ ... ]

> +	/* msg_type, a 24-bit length of 1, then request_update */
> +	if (msg[1] || msg[2] || msg[3] != 1)
> +		return -EBADMSG;
> +	if (msg[4] != TLS_KEY_UPDATE_NOT_REQUESTED &&
> +	    msg[4] != TLS_KEY_UPDATE_REQUESTED)
> +		return -EBADMSG;
> +
> +	if (!rx_ctx->key_update_count ||
> +	    time_after(jiffies, rx_ctx->key_update_window + HZ)) {
> +		rx_ctx->key_update_window = jiffies;
> +		rx_ctx->key_update_count = 0;
> +	}
> +	if (++rx_ctx->key_update_count > TLS_KEYUPDATE_RX_MAX_PER_SEC) {
> +		TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSRXREKEYERROR);
> +		net_warn_ratelimited("tls: peer sent more than %d KeyUpdates in one second\n",
> +				     TLS_KEYUPDATE_RX_MAX_PER_SEC);
> +		return -EBADMSG;
> +	}

[Severity: Low]
Should Documentation/networking/tls.rst be updated to match this
behaviour?

The "TLS 1.3 Key Updates" section still says, with no exception for a
registered RX secret:

  To prevent attempting to decrypt incoming records using the wrong key,
  decryption will be paused when a KeyUpdate message is received by the
  kernel, until the new key has been provided using the TLS_RX socket
  option. Any read occurring after the KeyUpdate has been read and
  before the new key is provided will fail with EKEYEXPIRED.

With rx_secret registered, tls_check_pending_rekey() consumes the record,
returns 1 and never sets key_update_pending. So the pause, the read of
the KeyUpdate record and the EKEYEXPIRED failure no longer happen.

The statistics section documents TlsRxRekeyReceived as "number of received
KeyUpdate handshake messages, requiring userspace to provide a new RX key".
LINUX_MIB_TLSRXREKEYRECEIVED is incremented before the rx_secret.len
branch, so it also counts KeyUpdates the kernel handles itself.

TlsRxRekeyError is documented as "number of failed rekeys on existing
sessions". Here it is incremented when the rate limit rejects a KeyUpdate,
before any rekey is attempted. It is not incremented for the -EBADMSG
returns above (full_len, the length bytes and request_update), which also
end the connection. Is that split intended?

Later in the series a paragraph is added to the secret section. The Key
Updates section and the statistics descriptions stay unchanged, and they
contradict that paragraph.

[ ... ]

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 7f7a2f70b02ae..027c32edaf850 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -1551,15 +1551,28 @@ static int tls_check_pending_rekey(struct sock *sk, struct tls_context *ctx,
>  	if (hs_type == TLS_HANDSHAKE_KEYUPDATE) {
>  		struct tls_sw_context_rx *rx_ctx = ctx->priv_ctx_rx;
>  
> -		WRITE_ONCE(rx_ctx->key_update_pending, true);
>  		TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSRXREKEYRECEIVED);
> +
> +		if (ctx->rx_secret.len) {
> +			err = tls_keyupdate_rx(sk, skb);
> +			if (err) {
> +				tls_err_abort(sk, err);
> +				/* callers free the record only on success */
> +				consume_skb(skb);
> +				return err;
> +			}
> +			return 1;
> +		}
> +
> +		WRITE_ONCE(rx_ctx->key_update_pending, true);
>  	}

[Severity: Medium]
What happens when the KeyUpdate is not the first handshake message in the
record?

tls_check_pending_rekey() only looks at the first byte:

	err = skb_copy_bits(skb, rxm->offset, &hs_type, 1);
	...
	if (hs_type == TLS_HANDSHAKE_KEYUPDATE) {

RFC 8446/9846 section 5.1 allows several handshake messages in one record.
It only requires a KeyUpdate to end at a record boundary. Rejecting
[KeyUpdate][other] in tls_keyupdate_rx() is correct, but a record holding
[NewSessionTicket][KeyUpdate] is legal.

For that record hs_type is 4, so this function returns 0. The rekey is
skipped, key_update_pending is not set, and the record goes up as an
ordinary handshake control record. read_sock and splice return -EINVAL
and requeue it.

The peer then encrypts with its next key, while the socket still has the
old RX key and a sequence number that was never reset:

tls_rx_one_record()
  tls_decrypt_sw()
    tls_decrypt_sg()   <- fails with the old key
  tls_err_abort(sk, -EBADMSG)

So a socket with a registered RX secret can lose its connection to a
peer that follows the RFC, which is the failure this patch is meant to
fix. Could this case be handled? The code still checks only the first
byte at the end of the series.

The commit message also says:

  A KeyUpdate that is not alone in its record, has a wrong length or an
  invalid request_update value ends the connection, as RFC 9846 section
  4.7.3 requires.

The RFC does not forbid a KeyUpdate that ends a record with several
messages, and the rule the code enforces is in section 5.1, not 4.7.3.
The comment in tls_keyupdate_rx() calls it an implementation limit:
"Another message in the same record is not supported".

The code also never detects the case where the KeyUpdate is not first.
The connection fails later on a decryption error, not in
tls_keyupdate_rx(). Could the commit message be reworded to match what
the code does?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261105-keyupdate-rfc-v6-0-99b695f9eb4f%40gmail.com

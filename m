Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F721FC0;
	Wed, 14 Oct 2026 01:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940904; cv=none; b=RUaB74YAqa5oP1yh+mj3r5AZKs2hQA4ARmyG9nGWKDdxZ6Cyepe1oig6OPGWz7CKhqGiHMMrtNoSoJ1c3iUowpqw7OaN8pyWmjSj33b/inpJJlksIqdx8UTIBlGFQWaiBCwr5AlXMU7blIfsjlRCQkk9yuAtfA9Ru8qh2KqP6z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940904; c=relaxed/simple;
	bh=E06UaZEEYDOqLXIg2z3poDlld5rlZXnb1hMTYy5iu90=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NhIqZT4MnEDdvQfSbdklWFEBbSpTZYhJX10lN62Yxrzuho+EqWqudYJw5qGb4gMT4C8XkoIgilHTjsPp4DoA/4Y50u4d+I1Kv/HgqrVmy8xs3P+iO3JDHSqYMfSuVTLONPzbn7Qf0RQI+vQR2yC2kH8DKZSMBKFO8IWFhe4hffE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUbay7Jc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUbay7Jc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085661F00893;
	Wed, 14 Oct 2026 01:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791940902;
	bh=gY0DyDgCYnNR0H8Emy8FKMcqfudo14vB5dAjOuB72j4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DUbay7JcXMiM4P+Kj7zukFfAScfofLOGawlMHV2gHHD8itushbLpZGittJYapk5Dp
	 pccFnTxKh6B896qbId0SAHh58+Bym5mwUyTRnXk49pGJx6ByB4IKWpWBv6zjfyprbR
	 l5YyVgdTAXtz5qgpNs+KQ3izlm00VSgEaAKxUdOxsNlWk8z27wRmicjYgWG+iGvgp3
	 6Mz/Hn2vTga1qP0TMAYe6p/3DbbpRsuYh2S/yWx7LkUfZDZTlFGPGRS5qtj79ikgfw
	 lj5Cc9a18wU01bOA7QtoXJu3PraNK0p6JrUECwFLpCl3xtzP8KV/fBd/KamqebSC9D
	 4O34XUACLrhVA==
Subject: Re: [PATCH net] tls: refuse RX records after record-number exhaustion
From: netdev-bot+sashiko@kernel.org
To: rjethwani@purestorage.com
Cc: kuba@kernel.org, sd@queasysnail.net, john.fastabend@gmail.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 14 Oct 2026 01:21:41 +0000
Message-ID: <179194090158.434549.7645021195460838677@kernel.org>
In-Reply-To: <20261013002701.1957686-1-rjethwani@purestorage.com>
References: <20261013002701.1957686-1-rjethwani@purestorage.com>
X-sashiko-severity: Critical
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 1 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] tls: AES-GCM IV reuse on TX sequence number exhaustion via
  SO_ERROR bypass
- [Medium] The new KeyUpdate exemption in tls_rx_one_record() decides
  whether the final record 'retires the key' by checking only…
- [Medium] The new rule that blocks replacing an exhausted key ('Only a
  KeyUpdate may follow the last record number') depends on…
- [Low] The new section in Documentation/networking/tls.rst says that
  after receive record-number exhaustion (unless the final record is a…

--

tls: refuse RX records after record-number exhaustion

This patch adds a per-key rec_seq_exhausted flag. The flag is set when
the RX record number wraps. Once it is set, tls_rx_rec_wait() refuses to
wait for or decrypt more records, and do_tls_setsockopt_conf() refuses
to replace the key, unless the final record was a KeyUpdate. It also
documents the behaviour and adds AES-GCM wire-vector selftests for TLS
1.2 and 1.3.

> diff --git a/Documentation/networking/tls.rst b/Documentation/networking/tls.rst
> index 980c442d7161a..4b3c7a5a07806 100644
> --- a/Documentation/networking/tls.rst
> +++ b/Documentation/networking/tls.rst

[ ... ]

> +Unless the final record is a TLS 1.3 KeyUpdate, the condition is
> +terminal: the socket error is also set to ``EBADMSG``, and a ``TLS_RX``
> +key replacement fails with ``EBADMSG``. A KeyUpdate in the final record
> +retires the key the usual way: receives fail with ``EKEYEXPIRED`` until a
> +new ``TLS_RX`` key is installed, after which receiving continues.

[Severity: Low]
Is the TLS_RX replacement errno accurate for TLS 1.2 sockets?

On TLS 1.2, do_tls_setsockopt_conf() returns -EBUSY for any second
TLS_RX setsockopt. That happens before the new exhaustion check runs:

net/tls/tls_main.c:do_tls_setsockopt_conf() {
    ...
	if (TLS_CRYPTO_INFO_READY(crypto_info)) {
		if (crypto_info->version != TLS_1_3_VERSION) {
			...
			return -EBUSY;
		}

		update = true;
    ...
}

The new EBADMSG check needs update to be true, and that only happens for
TLS 1.3. The rekey selftest skips the TLS 1.2 variant for this reason.

Could the documentation limit the EBADMSG statement to TLS 1.3, or say
that TLS 1.2 returns EBUSY?

> diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
> index fbb274287aa5f..63bef0153182b 100644
> --- a/net/tls/tls_main.c
> +++ b/net/tls/tls_main.c
> @@ -730,6 +730,15 @@ static int do_tls_setsockopt_conf(struct sock *sk, sockptr_t optval,
>  			conf = TLS_SW;
>  		}
>  	} else {
> +		struct tls_sw_context_rx *rx_ctx = tls_sw_ctx_rx(ctx);
> +
> +		/* Only a KeyUpdate may follow the last record number */
> +		if (update && rx_ctx->rec_seq_exhausted &&
> +		    !rx_ctx->key_update_pending) {
> +			rc = -EBADMSG;
> +			goto err_crypto_info;
> +		}

[Severity: Medium]
Can this check reject a valid KeyUpdate?

key_update_pending is set only when the first handshake byte of the
record is TLS_HANDSHAKE_KEYUPDATE:

net/tls/tls_sw.c:tls_check_pending_rekey() {
    ...
	err = skb_copy_bits(skb, rxm->offset, &hs_type, 1);
    ...
	if (hs_type == TLS_HANDSHAKE_KEYUPDATE) {
    ...
}

RFC 8446 section 5.1 allows several handshake messages in one record, as
long as the messages before a key change end at a record boundary. So a
KeyUpdate can be the last message in a record that starts with something
else, for example a NewSessionTicket.

Say the record at UINT64_MAX is such a coalesced record:

- key_update_pending stays false.
- tls_rx_one_record() sets rec_seq_exhausted and calls
  tls_err_abort(sk, -EBADMSG).
- Userspace parses the KeyUpdate from the handshake record and calls
  setsockopt(TLS_RX).
- This check returns -EBADMSG, so the connection cannot continue.

Before this patch, userspace could still install the new key after
reading SO_ERROR.

The commit message says "RFC 8446 lets a sender retire a key with a
KeyUpdate as its last record". Should the coalesced case be handled
too?

> +
>  		rc = tls_set_device_offload_rx(sk, ctx);
>  		conf = TLS_HW;
>  		if (!rc) {
> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index d1ad31986cf2c..cd1590e1f20fa 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1580,9 +1585,18 @@ static int tls_rx_one_record(struct sock *sk, struct msghdr *msg,
>  	rxm = strp_msg(darg->skb);
>  	rxm->offset += prot->prepend_size;
>  	rxm->full_len -= prot->overhead_size;
> -	tls_advance_record_sn(sk, prot, &tls_ctx->rx);
> +	err = tls_check_pending_rekey(sk, tls_ctx, darg->skb);
> +	if (__tls_advance_record_sn(prot, &tls_ctx->rx)) {
> +		/* sk_err alone can't stop the next record, SO_ERROR clears
> +		 * it. A KeyUpdate in the last record properly retires the
> +		 * key, so don't treat that one as an error.
> +		 */
> +		ctx->rec_seq_exhausted = true;
> +		if (!ctx->key_update_pending)
> +			tls_err_abort(sk, -EBADMSG);

[Severity: Medium]
Should this exemption also check prot->version == TLS_1_3_VERSION?

tls_check_pending_rekey() sets key_update_pending for any handshake
record whose first plaintext byte is TLS_HANDSHAKE_KEYUPDATE. It does not
check the protocol version:

net/tls/tls_sw.c:tls_check_pending_rekey() {
    ...
	if (hs_type == TLS_HANDSHAKE_KEYUPDATE) {
		struct tls_sw_context_rx *rx_ctx = ctx->priv_ctx_rx;

		WRITE_ONCE(rx_ctx->key_update_pending, true);
    ...
}

Say a TLS 1.2 socket receives, at UINT64_MAX, a handshake record that
starts with 0x18:

- rec_seq_exhausted is set, but tls_err_abort() is skipped.
- sk_err stays zero, so poll() does not report EPOLLERR and SO_ERROR
  returns 0.
- tls_rx_rec_wait() checks key_update_pending before rec_seq_exhausted,
  so every later recv returns EKEYEXPIRED.
- setsockopt(TLS_RX) returns EBUSY, because TLS 1.2 cannot rekey.

Such a record already left a TLS 1.2 socket stuck in EKEYEXPIRED before
this patch. However, the wrap still set sk_err to EBADMSG then.

The new documentation says "Unless the final record is a TLS 1.3
KeyUpdate, the condition is terminal: the socket error is also set to
EBADMSG". Is the TLS 1.2 behaviour here meant to differ from that?

> +	}
>  
> -	return tls_check_pending_rekey(sk, tls_ctx, darg->skb);
> +	return err;
>  }

[ ... ]

> diff --git a/net/tls/tls.h b/net/tls/tls.h
> --- a/net/tls/tls.h
> +++ b/net/tls/tls.h
> @@ -307,17 +307,26 @@ static inline void tls_bigint_subtract(unsigned char *seq, int  n)
>  	*p = cpu_to_be64(rcd_sn - n);
>  }
>  
> -static inline void
> -tls_advance_record_sn(struct sock *sk, struct tls_prot_info *prot,
> -		      struct cipher_context *ctx)
> +/* Returns true if the record number wrapped */
> +static inline bool
> +__tls_advance_record_sn(struct tls_prot_info *prot, struct cipher_context *ctx)
>  {
> -	if (tls_bigint_increment(ctx->rec_seq, prot->rec_seq_size))
> -		tls_err_abort(sk, -EBADMSG);
> +	bool overflow = tls_bigint_increment(ctx->rec_seq, prot->rec_seq_size);
>  
>  	if (prot->version != TLS_1_3_VERSION &&
>  	    prot->cipher_type != TLS_CIPHER_CHACHA20_POLY1305)
>  		tls_bigint_increment(ctx->iv + prot->salt_size,
>  				     prot->iv_size);
> +
> +	return overflow;
> +}
> +
> +static inline void
> +tls_advance_record_sn(struct sock *sk, struct tls_prot_info *prot,
> +		      struct cipher_context *ctx)
> +{
> +	if (__tls_advance_record_sn(prot, ctx))
> +		tls_err_abort(sk, -EBADMSG);
>  }
>  
>  static inline void

[Severity: Critical]
Does the TX side keep the same SO_ERROR bypass that this patch closes
on RX?

The TX callers still go through tls_advance_record_sn(), which only
records the wrap in sk_err. tls_do_encryption() calls it for
tls_ctx->tx, and the device path in tls_push_record() in
net/tls/tls_device.c does the same. The send loop only checks sk_err:

net/tls/tls_sw.c:tls_sw_sendmsg_locked() {
    ...
	while (msg_data_left(msg)) {
		if (sk->sk_err) {
			ret = -sk->sk_err;
			goto send_end;
		}
    ...
}

Say the TX key was installed close to the limit:

- tls_do_encryption() encrypts the record at UINT64_MAX, and the
  advance wraps tls_ctx->tx.rec_seq to zero. For TLS 1.2 AES-GCM the
  explicit IV in tls_ctx->tx.iv wraps with it.
- tls_err_abort() sets sk_err to EBADMSG and send() fails.
- The application reads SO_ERROR, which clears sk_err.
- The next sendmsg() passes the check above and encrypts new records
  from sequence zero under the same key.

For AES-GCM that reuses nonces under one key, which breaks both
confidentiality and integrity for those records. A Linux receiver with
this patch would reject them, but other peers need not.

The commit message says the Linux TX path refuses to send the wrapped
record, but that refusal also rests only on sk_err. Should TX get a
persistent exhaustion mark too, checked wherever records are pushed in
both the software and device offload paths? If that is better as a
separate patch, could the commit message at least avoid implying the
TX side is already safe?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261013002701.1957686-1-rjethwani%40purestorage.com

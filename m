Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197185;
	b=OuCwIqB1rRbGXEr1uWByWFsCNyxEtq6BG7WwY5VblcDHjL3WVLdG7vc1ChbXTbf6Gf/2
	 HAf73yU9ZDJMFztM5EaHzfhhYM9k30Ro5/COtuztoqH4xkwm2DfSCbbZjNSNC9uO1BpZ1
	 XCLGUOiZ1+Nmq2HdjIagr5Wmj1fvl9GAkzluY2oy0KZQ9FrK4+sFJxrlbl0ddRqJPqzsI
	 gTYoS9UuqdkbjfwUq48gzLWITpLKCFFkU3giWNV4XWQFA4vP+6PSm7KoO9uZqO6fX/vBC
	 xAVVcs3r07fQ9HdKpKM7vYcmoGfxO/7m4+YeTG2RhhRLGIeVkiCSJRlnnACvmqy3EOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197185;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:
	 X-Spam-Level:X-Spam-Flag;
	bh=IE1dQwsn2jE0gasxRrr5PsQumz7V2Y62yt7VQg4tzAA=;
	b=nOTEnsao2xngRXqDzKeU5VHP7u/bIGOLkkOIfEnHzj7Cq2c6oXa0SVbgge3RN+tSlDH5
	 GGy89Clqt84sSnmeDoKd/SeHqWfAmZBz/LgnTt9PiBX00QWC0omeTAAa/tHGzJKZbir/m
	 WgBQLbEZbQyr3taeJbM+R/ybk2H3YX3LLXtWSHfGltTNTk1xPH3iLQjNjDFM1cbxJQHWB
	 O6Wd/8AuXEkq9K21OthVUXEVFskEqnYxpBCSyYQOF89p7f/LhcSg9iRxConyd6R36BiMs
	 rH4xxYwzxdFKAnCPb01fnAY+UNvHIr+Vcvy+fVdWzjmRuRmnM1TxZb+Oyt0mPKGfv6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jBJ+2C0C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="wpfC6k/h";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jBJ+2C0C;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="wpfC6k/h";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C269606A32A;
	Wed, 28 Oct 2026 14:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C269606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jBJ+2C0C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wpfC6k/h;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jBJ+2C0C;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wpfC6k/h
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3504222132;
	Wed, 28 Oct 2026 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793197175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IE1dQwsn2jE0gasxRrr5PsQumz7V2Y62yt7VQg4tzAA=;
	b=jBJ+2C0CA+qyDkA0CB561g20ng/HzIXP8LicitMnPnmkVQx109zC5tZ7+5aKPEhsLeisdE
	jK5yhq4ickEqFV1X2ltoMA4ix94r2PKrrwNisrfZPSCHWfRRpgQeSz2GEPxuXQSHO3GCVp
	XXasBcH/Buv10rv+VSJ+/jdcrD7sC8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793197175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IE1dQwsn2jE0gasxRrr5PsQumz7V2Y62yt7VQg4tzAA=;
	b=wpfC6k/hOGuRFig+KmkT9a8yH5KF3FrFuiKJ+5fGuWA20iGoMR8OXaSKyNLq5t7ueSZ+am
	hrcNIHe58AkzyIBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793197175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IE1dQwsn2jE0gasxRrr5PsQumz7V2Y62yt7VQg4tzAA=;
	b=jBJ+2C0CA+qyDkA0CB561g20ng/HzIXP8LicitMnPnmkVQx109zC5tZ7+5aKPEhsLeisdE
	jK5yhq4ickEqFV1X2ltoMA4ix94r2PKrrwNisrfZPSCHWfRRpgQeSz2GEPxuXQSHO3GCVp
	XXasBcH/Buv10rv+VSJ+/jdcrD7sC8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793197175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IE1dQwsn2jE0gasxRrr5PsQumz7V2Y62yt7VQg4tzAA=;
	b=wpfC6k/hOGuRFig+KmkT9a8yH5KF3FrFuiKJ+5fGuWA20iGoMR8OXaSKyNLq5t7ueSZ+am
	hrcNIHe58AkzyIBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 859FF1342F;
	Wed, 28 Oct 2026 14:19:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j3khFXYE4mrGbgAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 28 Oct 2026 14:19:34 +0000
Message-ID: <b50b1b89-9a8c-4527-9a6f-e213952853d7@suse.de>
Date: Wed, 28 Oct 2026 15:19:34 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next v2 3/5] tls: update the RX key when a
 KeyUpdate is received
To: martin.nvme.dev@gmail.com, John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
 <20261028-keyupdate-rfc-v2-3-eb5143b4c487@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261028-keyupdate-rfc-v2-3-eb5143b4c487@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,queasysnail.net,davemloft.net,redhat.com,lwn.net,linuxfoundation.org,infradead.org];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -11.79
X-Spam-Level: 
X-Spam-Flag: NO

On 10/28/26 2:52 PM, Martin Belanger via B4 Relay wrote:
> From: Martin Belanger <martin.belanger@dell.com>
> 
> When a KeyUpdate arrives, kTLS blocks reads with -EKEYEXPIRED until
> the user installs the next key. A kernel user such as nvme-tcp or
> sunrpc never does, so the connection stalls.
> 
> For a socket with a registered RX secret, derive the next key and
> install it when the KeyUpdate is decrypted. The record is not passed to
> the user, so recvmsg(), splice() and read_sock() go on to the next
> record. Without a registered secret the behavior is unchanged.
> 
> A KeyUpdate that is not alone in its record, has a wrong length or an
> invalid request_update value ends the connection, as RFC 9846 section
> 4.7.3 requires. So does a peer that sends more than 8 KeyUpdates in one
> second, the same limit as GnuTLS.
> 
> Assisted-by: LLM
> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
> ---
>   include/net/tls.h       |   7 +++
>   net/tls/Makefile        |   3 +-
>   net/tls/tls.h           |   2 +
>   net/tls/tls_keyupdate.c | 150 ++++++++++++++++++++++++++++++++++++++++++++++++
>   net/tls/tls_sw.c        |  43 ++++++++++++--
>   5 files changed, 198 insertions(+), 7 deletions(-)
> 
> diff --git a/include/net/tls.h b/include/net/tls.h
> index aacc6d12226e..a5bc28a7d1f5 100644
> --- a/include/net/tls.h
> +++ b/include/net/tls.h
> @@ -63,6 +63,11 @@ struct tls_rec;
>   
>   #define TLS_HANDSHAKE_KEYUPDATE		24	/* rfc8446 B.3: Key update */
>   
> +/* KeyUpdate: msg_type, 24-bit length, request_update (RFC 9846 4.7.3) */
> +#define TLS_KEYUPDATE_MSG_SIZE		5
> +#define TLS_KEY_UPDATE_NOT_REQUESTED	0
> +#define TLS_KEY_UPDATE_REQUESTED	1
> +
>   #define TLS_AAD_SPACE_SIZE		13
>   
>   /* SHA-384, the longest hash of a TLS 1.3 cipher suite kTLS supports */
> @@ -142,6 +147,8 @@ struct tls_sw_context_rx {
>   	u8 zc_capable:1;
>   	u8 reader_contended:1;
>   	bool key_update_pending;
> +	u8 key_update_count;		/* received in this window */
> +	unsigned long key_update_window;	/* jiffies */
>   
>   	struct tls_strparser strp;
>   
> diff --git a/net/tls/Makefile b/net/tls/Makefile
> index 6edcf1271b75..ce8ac6a59f8c 100644
> --- a/net/tls/Makefile
> +++ b/net/tls/Makefile
> @@ -7,6 +7,7 @@ CFLAGS_trace.o := -I$(src)
>   
>   obj-$(CONFIG_TLS) += tls.o
>   
> -tls-y := tls_main.o tls_sw.o tls_proc.o trace.o tls_strp.o tls_hkdf.o
> +tls-y := tls_main.o tls_sw.o tls_proc.o trace.o tls_strp.o tls_hkdf.o \
> +	 tls_keyupdate.o
>   
>   tls-$(CONFIG_TLS_DEVICE) += tls_device.o tls_device_fallback.o
> diff --git a/net/tls/tls.h b/net/tls/tls.h
> index b2061f6bf065..63ece8074985 100644
> --- a/net/tls/tls.h
> +++ b/net/tls/tls.h
> @@ -149,6 +149,8 @@ int init_prot_info(struct tls_prot_info *prot,
>   		   const struct tls_cipher_desc *cipher_desc);
>   int tls_hkdf_expand_label(const u8 *secret, size_t secret_len,
>   			  const char *label, u8 *out, size_t out_len);
> +int tls_keyupdate_rekey(struct sock *sk, int tx);
> +int tls_keyupdate_rx(struct sock *sk, struct sk_buff *skb);
>   int tls_set_sw_offload(struct sock *sk, int tx,
>   		       struct tls_crypto_info *new_crypto_info);
>   void tls_update_rx_zc_capable(struct tls_context *tls_ctx);
> diff --git a/net/tls/tls_keyupdate.c b/net/tls/tls_keyupdate.c
> new file mode 100644
> index 000000000000..543bf57599c7
> --- /dev/null
> +++ b/net/tls/tls_keyupdate.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2026 Dell Technologies Inc. or its subsidiaries.
> + *
> + * TLS 1.3 KeyUpdate, RFC 9846 sections 4.7.3 and 7.2.
> + *
> + * A TLS 1.3 peer can change the key of the direction it sends in at any
> + * time. It sends a KeyUpdate message, then encrypts all later records
> + * with the next key. A sender must also change its key before the key
> + * has protected too many records (section 5.5).
> + *
> + * The next key is derived from the application traffic secret, not from
> + * the current key. User space gives the kernel only the key and IV, so
> + * the kernel cannot derive the next key on its own. Without the secret,
> + * a received KeyUpdate goes to the application, and the kernel stops
> + * decrypting until the application installs the next key with TLS_RX.
> + *
> + * With TLS_TX_TRAFFIC_SECRET or TLS_RX_TRAFFIC_SECRET, user space also
> + * gives the kernel the secret of that direction. The kernel then handles
> + * KeyUpdate itself. This file derives and installs the next key, and
> + * processes a received KeyUpdate. tls_sw.c sends KeyUpdate messages.
> + */
> +
> +#include <linux/jiffies.h>
> +#include <linux/skbuff.h>
> +#include <net/strparser.h>
> +#include <net/tls.h>
> +
> +#include "tls.h"
> +
> +/* A peer that sends more KeyUpdates than this in one second ends the
> + * connection. Each one costs three HMACs and a new key, and carries no
> + * data.
> + */
> +#define TLS_KEYUPDATE_RX_MAX_PER_SEC	8
> +
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
> +int tls_keyupdate_rekey(struct sock *sk, int tx)
> +{
> +	struct tls_context *ctx = tls_get_ctx(sk);
> +	struct tls_traffic_secret *secret;
> +	const struct tls_cipher_desc *cipher_desc;
> +	u8 iv[TLS_MAX_SALT_SIZE + TLS_MAX_IV_SIZE];
> +	u8 next[TLS_MAX_TRAFFIC_SECRET_SIZE];
> +	union tls_crypto_context tmp = {};
> +	struct tls_crypto_info *info = &tmp.info;
> +	int rc;
> +
> +	secret = tx ? &ctx->tx_secret : &ctx->rx_secret;
> +	cipher_desc = get_cipher_desc(ctx->prot_info.cipher_type);
> +	if (!cipher_desc || !secret->len ||
> +	    cipher_desc->salt + cipher_desc->iv > sizeof(iv))
> +		return -EINVAL;
> +
> +	/* version and cipher_type; the rest of tmp stays zero */
> +	*info = tx ? ctx->crypto_send.info : ctx->crypto_recv.info;
> +
> +	rc = tls_hkdf_expand_label(secret->data, secret->len, "traffic upd",
> +				   next, secret->len);
> +	if (rc)
> +		goto out;
> +
> +	rc = tls_hkdf_expand_label(next, secret->len, "key",
> +				   crypto_info_key(info, cipher_desc),
> +				   cipher_desc->key);
> +	if (rc)
> +		goto out;
> +
> +	rc = tls_hkdf_expand_label(next, secret->len, "iv", iv,
> +				   cipher_desc->salt + cipher_desc->iv);
> +	if (rc)
> +		goto out;
> +
> +	memcpy(crypto_info_salt(info, cipher_desc), iv, cipher_desc->salt);
> +	memcpy(crypto_info_iv(info, cipher_desc), iv + cipher_desc->salt,
> +	       cipher_desc->iv);
> +
> +	rc = tls_set_sw_offload(sk, tx, info);
> +	if (rc)
> +		goto out;
> +
> +	memcpy(secret->data, next, secret->len);
> +
> +out:
> +	memzero_explicit(next, sizeof(next));
> +	memzero_explicit(iv, sizeof(iv));
> +	memzero_explicit(&tmp, sizeof(tmp));
> +
> +	return rc;
> +}
> +
> +/**
> + * tls_keyupdate_rx - process a received KeyUpdate
> + * @sk: socket
> + * @skb: the decrypted record, which starts with a KeyUpdate message
> + *
> + * Called with the socket locked, for a direction with a registered
> + * secret. The caller does not pass the record to the user.
> + *
> + * Return: 0 on success, or a negative errno if the connection must end.
> + */
> +int tls_keyupdate_rx(struct sock *sk, struct sk_buff *skb)
> +{
> +	struct tls_context *ctx = tls_get_ctx(sk);
> +	struct tls_sw_context_rx *rx_ctx = tls_sw_ctx_rx(ctx);
> +	const struct strp_msg *rxm = strp_msg(skb);
> +	u8 msg[TLS_KEYUPDATE_MSG_SIZE];
> +	int rc;
> +
> +	/* A KeyUpdate must end its record (section 5.1). Another message
> +	 * in the same record is not supported.
> +	 */
> +	if (rxm->full_len != sizeof(msg) ||
> +	    skb_copy_bits(skb, rxm->offset, msg, sizeof(msg)))
> +		return -EBADMSG;
> +
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
> +	if (++rx_ctx->key_update_count > TLS_KEYUPDATE_RX_MAX_PER_SEC)

Hmm. I see the rationale, but the actual number falls a bit out of
thin air. And closing the connection with no indiation is bound
to confuse users.
Please add a WARN_ON() statemen there such that the admin is informed,
and I _think_ we could just leave the connection running instead of
closing.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

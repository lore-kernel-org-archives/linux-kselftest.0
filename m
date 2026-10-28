Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197414;
	b=frCkEdaSp5/prldCnTSDRTILt8C7aWBHHarOq0T8ecDj0UKi0GMptroPluKD2lEwYdJU
	 tufgjq1pwh4QzZhGUIF7quYiuQcpF5L/GugFNB5aCATstqfNoIpehAGauVxY10l4QZM0w
	 uJQXneo2sfSqJqxRCASSVjBnVRVuVZipcuq5Aa0GGIfA4ZNsFyLGxg+zWyq/vDUeAr5W8
	 YmLmvrMmWBBn3MFV1wCobFIQBp1ZYo7xv33KDdRK/NTAVO7jH0Gtc9LjKPUaVD/m1olNZ
	 idlrKUKQS1vlx5jLtbrGlzrEZQaJCtQUYBAcMfA2spVV2ioAh4pWsaqB7bqEoyClATA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197414;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=cRK12u2tpS8pv4Qu7l/2Lv04F7sgjnujZa5m5czkUM8=;
	b=ljHLsm80yXywL0GMMO/R2IzYc5QhBlpce0j7CBBTQEi2EV3zFzHAZAma0zGdRDGfwRcs
	 LcTUh2BoZpAWNV1O95Sfx9fmQPFHT5d0JX5okYWhiuYjruKo8sC5Ir8jULZ9j5aIxCcMl
	 Z73FlmnUFjacKX2DWJ0aBZ790GtUOfWYT8X/OUPai+p2jl3TdKwhRPPL4J9Gn6FUyn9kB
	 jzRub84xuzEzEw6YHilxK1CfgPUqw6yyKbbsea1xvjCQH75iSjdWrEfxirkwiH/ql13x9
	 bbbJ4fbr89UDYSWoQjdmPfydwjBX1S0xhA7yVwygb2ey1+FQntpIgXR+b4RNhvk5cMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1yWKnVox;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p0M0BG+o;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1yWKnVox;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p0M0BG+o;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8A3606A330;
	Wed, 28 Oct 2026 14:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE8A3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1yWKnVox;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p0M0BG+o;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1yWKnVox;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p0M0BG+o
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D92941F7A9;
	Wed, 28 Oct 2026 14:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793197403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRK12u2tpS8pv4Qu7l/2Lv04F7sgjnujZa5m5czkUM8=;
	b=1yWKnVoxXvMZR+Gm783QC08Qa1MN4ATGKaqudljhheZR2SKCf3ITSgMFLQZZCC+ScCTGlk
	5W7zX6Rn636wOdjRUlGrDsxiGILtoFMU0lowFd+Ywn3ObryFB9xra0Zrx2uoOkEGhuApxq
	cp3nQS6z85tOD9muSkiY5Qm4mviPf3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793197403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRK12u2tpS8pv4Qu7l/2Lv04F7sgjnujZa5m5czkUM8=;
	b=p0M0BG+oxYN4Vfid0fzqA1LjphWoHJR/YzrL5RhGibyU1ujUWpf3JTvZZIjdmULsKH/Jp2
	kIkdvCFyDtUjOVAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793197403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRK12u2tpS8pv4Qu7l/2Lv04F7sgjnujZa5m5czkUM8=;
	b=1yWKnVoxXvMZR+Gm783QC08Qa1MN4ATGKaqudljhheZR2SKCf3ITSgMFLQZZCC+ScCTGlk
	5W7zX6Rn636wOdjRUlGrDsxiGILtoFMU0lowFd+Ywn3ObryFB9xra0Zrx2uoOkEGhuApxq
	cp3nQS6z85tOD9muSkiY5Qm4mviPf3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793197403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRK12u2tpS8pv4Qu7l/2Lv04F7sgjnujZa5m5czkUM8=;
	b=p0M0BG+oxYN4Vfid0fzqA1LjphWoHJR/YzrL5RhGibyU1ujUWpf3JTvZZIjdmULsKH/Jp2
	kIkdvCFyDtUjOVAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C9EA1321C;
	Wed, 28 Oct 2026 14:23:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dE64GVsF4mrCcgAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 28 Oct 2026 14:23:23 +0000
Message-ID: <82963fe6-e908-4c1a-b963-ac1ab86f2bdc@suse.de>
Date: Wed, 28 Oct 2026 15:23:23 +0100
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
Subject: Re: [PATCH RFC net-next v2 4/5] tls: send a KeyUpdate at the record
 limit and on request
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
 <20261028-keyupdate-rfc-v2-4-eb5143b4c487@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261028-keyupdate-rfc-v2-4-eb5143b4c487@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.79

On 10/28/26 2:52 PM, Martin Belanger via B4 Relay wrote:
> From: Martin Belanger <martin.belanger@dell.com>
> 
> RFC 9846 section 5.5 requires a key update before the key reaches its
> usage limit, 2^24.5 full-size records for AES-GCM. The limit counts
> records, and only the record layer knows where records start and end.
> Section 4.7.3 also requires a reply to a KeyUpdate with
> update_requested, sent before the next Application Data record. Both
> need a KeyUpdate at an exact position in the record stream.
> 
> For a socket with a registered TX secret, send a KeyUpdate before the
> next record when the key has protected 2^24 records, as GnuTLS does,
> or when the peer asked for one. ChaCha20-Poly1305 has no record limit.
> The KeyUpdate is sent as a handshake record, which closes the open data
> record first. Pending encryptions are then completed, and only then is
> the next key installed.
> 
> Add TLS_TX_KEY_UPDATE to send a KeyUpdate now, optionally asking the
> peer to update too. It can only bring a KeyUpdate forward: the record
> limit is enforced either way. Following section 4.7.3, a new request
> to the peer waits for the answer to the previous one, and no more than
> 2^48-1 epochs are used.
> 
> Assisted-by: LLM
> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
> ---
>   Documentation/networking/tls.rst |  17 +++++
>   include/net/tls.h                |   5 +-
>   include/uapi/linux/tls.h         |   1 +
>   net/tls/tls.h                    |   1 +
>   net/tls/tls_keyupdate.c          |   5 ++
>   net/tls/tls_main.c               |  38 +++++++++-
>   net/tls/tls_sw.c                 | 150 ++++++++++++++++++++++++++++++++++++++-
>   7 files changed, 214 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/networking/tls.rst b/Documentation/networking/tls.rst
> index 2e011bd1ce4a..69752a6d67df 100644
> --- a/Documentation/networking/tls.rst
> +++ b/Documentation/networking/tls.rst
> @@ -326,6 +326,23 @@ direction is then left to the application again.
>   
>   The secrets cannot be read back.
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
> +
>   Statistics
>   ==========
>   
> diff --git a/include/net/tls.h b/include/net/tls.h
> index a5bc28a7d1f5..d3123b17030c 100644
> --- a/include/net/tls.h
> +++ b/include/net/tls.h
> @@ -282,9 +282,12 @@ struct tls_context {
>   	union tls_crypto_context crypto_send;
>   	union tls_crypto_context crypto_recv;
>   
> -	/* Registered for KeyUpdate, protected by the socket lock */
> +	/* KeyUpdate state, protected by the socket lock */
>   	struct tls_traffic_secret tx_secret;
>   	struct tls_traffic_secret rx_secret;
> +	u64 tx_key_updates;		/* KeyUpdates sent */
> +	bool tx_key_update_reply;	/* peer set update_requested */
> +	bool tx_key_update_asked;	/* we set it, no answer yet */
>   
>   	struct list_head list;
>   	refcount_t refcount;
> diff --git a/include/uapi/linux/tls.h b/include/uapi/linux/tls.h
> index d1b136ecea96..c85408cb6ce7 100644
> --- a/include/uapi/linux/tls.h
> +++ b/include/uapi/linux/tls.h
> @@ -44,6 +44,7 @@
>   #define TLS_TX_MAX_PAYLOAD_LEN	5	/* Maximum plaintext size */
>   #define TLS_TX_TRAFFIC_SECRET	6	/* TLS 1.3 TX traffic secret */
>   #define TLS_RX_TRAFFIC_SECRET	7	/* TLS 1.3 RX traffic secret */
> +#define TLS_TX_KEY_UPDATE	8	/* Send a TLS 1.3 KeyUpdate now */
>   
>   /* Supported versions */
>   #define TLS_VERSION_MINOR(ver)	((ver) & 0xFF)
> diff --git a/net/tls/tls.h b/net/tls/tls.h
> index 63ece8074985..d12c9278c814 100644
> --- a/net/tls/tls.h
> +++ b/net/tls/tls.h
> @@ -151,6 +151,7 @@ int tls_hkdf_expand_label(const u8 *secret, size_t secret_len,
>   			  const char *label, u8 *out, size_t out_len);
>   int tls_keyupdate_rekey(struct sock *sk, int tx);
>   int tls_keyupdate_rx(struct sock *sk, struct sk_buff *skb);
> +int tls_sw_key_update(struct sock *sk, int request);
>   int tls_set_sw_offload(struct sock *sk, int tx,
>   		       struct tls_crypto_info *new_crypto_info);
>   void tls_update_rx_zc_capable(struct tls_context *tls_ctx);
> diff --git a/net/tls/tls_keyupdate.c b/net/tls/tls_keyupdate.c
> index 543bf57599c7..851d5b54b336 100644
> --- a/net/tls/tls_keyupdate.c
> +++ b/net/tls/tls_keyupdate.c
> @@ -146,5 +146,10 @@ int tls_keyupdate_rx(struct sock *sk, struct sk_buff *skb)
>   	}
>   	TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSRXREKEYOK);
>   
> +	/* Any KeyUpdate from the peer answers our update_requested */
> +	ctx->tx_key_update_asked = false;
> +	if (msg[4] == TLS_KEY_UPDATE_REQUESTED)
> +		ctx->tx_key_update_reply = true;
> +
>   	return 0;
>   }
> diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
> index 8bb1b2773f3f..d71de99d8890 100644
> --- a/net/tls/tls_main.c
> +++ b/net/tls/tls_main.c
> @@ -765,10 +765,14 @@ static int do_tls_setsockopt_conf(struct sock *sk, sockptr_t optval,
>   		/* The registered secret no longer matches the key. The RX
>   		 * secret also needs the TX one, see do_tls_setsockopt_secret().
>   		 */
> -		if (tx)
> +		if (tx) {
>   			memzero_explicit(&ctx->tx_secret,
>   					 sizeof(ctx->tx_secret));
> +			ctx->tx_key_update_reply = false;
> +		}
>   		memzero_explicit(&ctx->rx_secret, sizeof(ctx->rx_secret));
> +		/* the answer now goes to user space */
> +		ctx->tx_key_update_asked = false;
>   		return 0;
>   	}
>   
> @@ -987,6 +991,35 @@ static int do_tls_setsockopt_secret(struct sock *sk, sockptr_t optval,
>   	return rc;
>   }
>   
> +static int do_tls_setsockopt_key_update(struct sock *sk, sockptr_t optval,
> +					unsigned int optlen)
> +{
> +	struct tls_context *ctx = tls_get_ctx(sk);
> +	int value, rc;
> +
> +	if (sockptr_is_null(optval) || optlen != sizeof(value))
> +		return -EINVAL;
> +
> +	if (copy_from_sockptr(&value, optval, sizeof(value)))
> +		return -EFAULT;
> +
> +	if (value != 0 && value != 1)
> +		return -EINVAL;
> +
> +	rc = mutex_lock_interruptible(&ctx->tx_lock);
> +	if (rc)
> +		return rc;
> +	lock_sock(sk);
> +	if (ctx->tx_conf == TLS_SW)
> +		rc = tls_sw_key_update(sk, value);
> +	else
> +		rc = -EINVAL;
> +	release_sock(sk);
> +	mutex_unlock(&ctx->tx_lock);
> +
> +	return rc;
> +}
> +
>   static int do_tls_setsockopt(struct sock *sk, int optname, sockptr_t optval,
>   			     unsigned int optlen)
>   {
> @@ -1020,6 +1053,9 @@ static int do_tls_setsockopt(struct sock *sk, int optname, sockptr_t optval,
>   					      optname == TLS_TX_TRAFFIC_SECRET);
>   		release_sock(sk);
>   		break;
> +	case TLS_TX_KEY_UPDATE:
> +		rc = do_tls_setsockopt_key_update(sk, optval, optlen);
> +		break;
>   	default:
>   		rc = -ENOPROTOOPT;
>   		break;
> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index cc0177320e7e..4fe78624859d 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -40,6 +40,7 @@
>   #include <linux/module.h>
>   #include <linux/kernel.h>
>   #include <linux/splice.h>
> +#include <linux/unaligned.h>
>   #include <crypto/aead.h>
>   
>   #include <net/strparser.h>
> @@ -1005,6 +1006,151 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
>   	return copied > 0 ? copied : ret;
>   }
>   
> +/* RFC 9846 section 5.5 allows 2^24.5 full-size records per AES-GCM key.
> + * Send the KeyUpdate a little earlier.
> + */
> +#define TLS_KEYUPDATE_TX_RECORDS	BIT_ULL(24)
> +
> +/* Section 4.7.3: the epoch must not exceed 2^48-1. The application
> + * traffic secrets start at epoch 3.
> + */
> +#define TLS_KEYUPDATE_MAX		(BIT_ULL(48) - 4)
> +
> +/* Send a KeyUpdate with the current key, then install the next key.
> + * Called with tx_lock held and the socket locked.
> + */
> +static int tls_tx_key_update(struct sock *sk, u8 request, int flags)
> +{
> +	u8 body[TLS_KEYUPDATE_MSG_SIZE] = {
> +		TLS_HANDSHAKE_KEYUPDATE, 0, 0, 1, request
> +	};
> +	struct tls_context *tls_ctx = tls_get_ctx(sk);
> +	struct tls_sw_context_tx *ctx = tls_sw_ctx_tx(tls_ctx);
> +	u8 record_type = TLS_RECORD_TYPE_HANDSHAKE;
> +	u8 buf[CMSG_SPACE(sizeof(record_type))];
> +	struct msghdr msg = {};
> +	struct cmsghdr *cmsg;
> +	struct kvec iov;
> +	int ret;
> +
> +	memset(buf, 0, sizeof(buf));
> +	msg.msg_control = buf;
> +	msg.msg_controllen = sizeof(buf);
> +	msg.msg_flags = flags & (MSG_DONTWAIT | MSG_NOSIGNAL);
> +
> +	cmsg = CMSG_FIRSTHDR(&msg);
> +	cmsg->cmsg_level = SOL_TLS;
> +	cmsg->cmsg_type = TLS_SET_RECORD_TYPE;
> +	cmsg->cmsg_len = CMSG_LEN(sizeof(record_type));
> +	memcpy(CMSG_DATA(cmsg), &record_type, sizeof(record_type));
> +
> +	iov.iov_base = body;
> +	iov.iov_len = sizeof(body);
> +	iov_iter_kvec(&msg.msg_iter, ITER_SOURCE, &iov, 1, sizeof(body));
> +
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
> +
> +	TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSTXREKEYOK);
> +	tls_ctx->tx_key_updates++;
> +	if (request == TLS_KEY_UPDATE_NOT_REQUESTED)
> +		tls_ctx->tx_key_update_reply = false;
> +
> +	return 0;
> +}
> +
> +/* Send a KeyUpdate if one is due: in reply to the peer's
> + * update_requested (RFC 9846 section 4.7.3), or before the key reaches
> + * its record limit (section 5.5). ChaCha20-Poly1305 has no record limit:
> + * the sequence number would wrap first.
> + */
> +static int tls_tx_key_update_if_due(struct sock *sk, int flags)

'_if_due()' ? Hmm. 'tls_tx_should_update_key()'?

But otherwise looks good.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

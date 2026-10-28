Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207587;
	b=B5qsw2nHs19pEFBsshGOkcB7655rCdSlDom3qAQwPGYE/obMYQU4UahggmU+OVp4EKNZ
	 Fb9I1WBxuvfgdPmHFd+Q5DxCDH076d1Jfo2qBeM8jGc1kF22JdW36gF9ZKKmG9VtFfN/j
	 hJzdMq+q5NQjOrqjEUDlTCF5EbyYlrsWTcQZIsZxKWG6OTq6Fh9cEGslCegmd4oT3DOME
	 fyYFTYvF/VLvurPf/iAwu1suurnwZLfwnmW6EwPr9alqFxBQ7dyNjl+My5J6H6atorTlm
	 UX4ru6io3axlcymgDoxB6chjiYptM8CSS16KbiehD3GA2O6CBjsyX7SkqHYyKTN1GDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1R8NIiT70unifmNSK+YD3vXF5jqH5gNy1IalaJ/toP4=;
	b=vNdr9t7C7PGCNyMS4ldpVUPKEKDezDbLuuKiPkmi1NzXWH/7XzndKYOwsigBNm3Mb6Iv
	 SH9vUmEsRseLPkUsHIqBueANyjLn9W2KdMSjU3kecMHOEUjoT1feqbYzQcnzIe7ERmO0V
	 E1PItMWwA7c7FB6vCNdpCDyhItQjssay3Dnl1YmV0sdjrctiWzkTcENFkNmPZllkPk4Te
	 NNOgTLiGuzmszFyLUyo1xEMFaONUXNSLWiD1i4WnhFpCkSCHowCssErkar6AvNFtrUJnB
	 GC6l5jqEKCnewRWy7mf8jscYSy5iSwpm3GQRNhCJj8ynyKp9Rkyt3xjh1mEobQebtPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJ77k7o7;
	arc=none smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0DB606A322
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 17:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A0DB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJ77k7o7
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-67a3f0c460cso453514d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 10:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207585; x=1793812385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1R8NIiT70unifmNSK+YD3vXF5jqH5gNy1IalaJ/toP4=;
        b=NJ77k7o7xUIgv+tAptRx8gB0YOiMl0t9OPO7Gr7t6dadR5gNv9D58zMn5+ry6LhM+4
         NalXatK8AvgkxwxNorlRiOtupkvWJHHFwkZzhqGroeEFG5rr6GNZ45iZzc76aeTpheNj
         VYG0yUh5boKmi8pJq3z8MvKFlaHBQ7ph2Z3HrFN/LwW+dydofyFDbMIchAe2H4S4r0Yu
         Di2JC9ZtOWMyIu0gmWYgQllWHdoIKPhRXkB4lT5jWjfT+l9pD+h7nJsrgmLqZGegIQnY
         x8v6j1s5c0mOcfBMTtjIWhIrpMOhLi26ZhhF65ylXplXJEorftMqRHr0OcXeU4MyipHG
         ufDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207585; x=1793812385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1R8NIiT70unifmNSK+YD3vXF5jqH5gNy1IalaJ/toP4=;
        b=Nczq9qsXVIMF6CC4VQwVXMNlvbZfWlFJYqFGfyTzBKNV270kTOThsq6bHN3xQirxAb
         wW6jAlOzdOlfCfqUpg4PrlCnp0SZRUFls1pg2tKoIfjoCoAzCrUH3XzTYwl77VG89HtY
         4kU506QatZaHvvua6Fg4R0McSPIGmMzYNoCNiwpUvutvs7gfbPpmIFUDiHoofvHQS164
         tZqRERLYsmHO/jS6uiL5rUFdf7R2JQrSfwzi07SLbMhcCwMRoWWp/QFpp7lTeG/IfQ5h
         KoTp28Thu9l3xixtYUo5ZP2Ozz1fcLUMjOnV30ouOA4PGFqoDg8qydA7OPiREG714DP3
         UEkw==
X-Forwarded-Encrypted: i=1; AKwUvBwaL/ChT1MfXca16a++eSeKJsZVyJdkLOh2IDh9rvhawFrpBtYkPjGsE54MapVa9ADYUICnWFFX9NdMi3zWRZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfXGAnECSW0ICaHG/ui42vvQNVu068h0BtWk5wW0eUPNnKD8bx
	mg/3Le0+lEbab4ErYIIWmsNV7UJsKKxwriEtF84aoORmbwBzSU3xwblD
X-Gm-Gg: AYBFou2s8Zz9VwIdgodk741jIX6AOSEycfaDUyUsGO7XxWdTanIsjUXmm6H4Fs13isD
	K1sRnexXqkXT6+Lh9v5tRJuaeydZa3MjfEh5ieXSR8fyf4Sg7XERc780ZYCFRHTpK0mR3Q4qQUo
	dHlTdeFrJ5P7x4Q/O+wpv0PODmRxVJdnrNFkCrbZurVfuLHgTMBHhpsK9uFh/IgwEhmAV7Jvc+K
	rT6p9bT0woD/FRpO6Qy0BEicToBRsRi8Ux58LGs87XkmNjdcawN81Mj18jq7KL6psGyKiRoqk2v
	PzsHvcBcioIAdNUUP6XMerVg7haa5VvevHWNj1GVdVZQM2F23b0Lm7NMcz/fRw4KIfTgrYCsB3R
	tQIX7eVECL1ACQ6EA4wcZ5BBO1omrbqXmlBlLiIkybdRLDXWduYcqFOv3OL9hfA50mZ0bgjJXpT
	QQPKzpb+tyGTB7O2wGsE1j1X/7q1b0B0GfZGaR/UxeSHIdFlneNUtMAFkAt6HLuz6JYEdhK5Cgv
	ZXYqeo9bU8CSWlxALb3KLuPGdBK4azuDuvKMZzZ+tET67VKn7MIBk3Ys65AgYYmeP3gCZ0OmDY6
	RNL1g3bg4f9eN1xJpBpUdrceP8LnuOEGvVE=
X-Received: by 2002:a53:c812:0:b0:673:af18:3471 with SMTP id 956f58d0204a3-67a7bd52d38mr1499889d50.84.1793207585044;
        Wed, 28 Oct 2026 10:13:05 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a07f0afsm2058023d50.6.2026.10.28.10.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:13:03 -0700 (PDT)
Message-ID: <15b492a8-f504-4294-b359-6943076d151d@gmail.com>
Date: Wed, 28 Oct 2026 13:13:02 -0400
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
To: Hannes Reinecke <hare@suse.de>, John Fastabend
 <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
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
 <b50b1b89-9a8c-4527-9a6f-e213952853d7@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <b50b1b89-9a8c-4527-9a6f-e213952853d7@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/28/26 10:19, Hannes Reinecke wrote:
> On 10/28/26 2:52 PM, Martin Belanger via B4 Relay wrote:
>> From: Martin Belanger <martin.belanger@dell.com>
>>
>> When a KeyUpdate arrives, kTLS blocks reads with -EKEYEXPIRED until
>> the user installs the next key. A kernel user such as nvme-tcp or
>> sunrpc never does, so the connection stalls.
>>
>> For a socket with a registered RX secret, derive the next key and
>> install it when the KeyUpdate is decrypted. The record is not passed to
>> the user, so recvmsg(), splice() and read_sock() go on to the next
>> record. Without a registered secret the behavior is unchanged.
>>
>> A KeyUpdate that is not alone in its record, has a wrong length or an
>> invalid request_update value ends the connection, as RFC 9846 section
>> 4.7.3 requires. So does a peer that sends more than 8 KeyUpdates in one
>> second, the same limit as GnuTLS.
>>
>> Assisted-by: LLM
>> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
>> ---
>>   include/net/tls.h       |   7 +++
>>   net/tls/Makefile        |   3 +-
>>   net/tls/tls.h           |   2 +
>>   net/tls/tls_keyupdate.c | 150 ++++++++++++++++++++++++++++++++++++++ 
>> ++++++++++
>>   net/tls/tls_sw.c        |  43 ++++++++++++--
>>   5 files changed, 198 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/net/tls.h b/include/net/tls.h
>> index aacc6d12226e..a5bc28a7d1f5 100644
>> --- a/include/net/tls.h
>> +++ b/include/net/tls.h
>> @@ -63,6 +63,11 @@ struct tls_rec;
>>   #define TLS_HANDSHAKE_KEYUPDATE        24    /* rfc8446 B.3: Key 
>> update */
>> +/* KeyUpdate: msg_type, 24-bit length, request_update (RFC 9846 
>> 4.7.3) */
>> +#define TLS_KEYUPDATE_MSG_SIZE        5
>> +#define TLS_KEY_UPDATE_NOT_REQUESTED    0
>> +#define TLS_KEY_UPDATE_REQUESTED    1
>> +
>>   #define TLS_AAD_SPACE_SIZE        13
>>   /* SHA-384, the longest hash of a TLS 1.3 cipher suite kTLS supports */
>> @@ -142,6 +147,8 @@ struct tls_sw_context_rx {
>>       u8 zc_capable:1;
>>       u8 reader_contended:1;
>>       bool key_update_pending;
>> +    u8 key_update_count;        /* received in this window */
>> +    unsigned long key_update_window;    /* jiffies */
>>       struct tls_strparser strp;
>> diff --git a/net/tls/Makefile b/net/tls/Makefile
>> index 6edcf1271b75..ce8ac6a59f8c 100644
>> --- a/net/tls/Makefile
>> +++ b/net/tls/Makefile
>> @@ -7,6 +7,7 @@ CFLAGS_trace.o := -I$(src)
>>   obj-$(CONFIG_TLS) += tls.o
>> -tls-y := tls_main.o tls_sw.o tls_proc.o trace.o tls_strp.o tls_hkdf.o
>> +tls-y := tls_main.o tls_sw.o tls_proc.o trace.o tls_strp.o tls_hkdf.o \
>> +     tls_keyupdate.o
>>   tls-$(CONFIG_TLS_DEVICE) += tls_device.o tls_device_fallback.o
>> diff --git a/net/tls/tls.h b/net/tls/tls.h
>> index b2061f6bf065..63ece8074985 100644
>> --- a/net/tls/tls.h
>> +++ b/net/tls/tls.h
>> @@ -149,6 +149,8 @@ int init_prot_info(struct tls_prot_info *prot,
>>              const struct tls_cipher_desc *cipher_desc);
>>   int tls_hkdf_expand_label(const u8 *secret, size_t secret_len,
>>                 const char *label, u8 *out, size_t out_len);
>> +int tls_keyupdate_rekey(struct sock *sk, int tx);
>> +int tls_keyupdate_rx(struct sock *sk, struct sk_buff *skb);
>>   int tls_set_sw_offload(struct sock *sk, int tx,
>>                  struct tls_crypto_info *new_crypto_info);
>>   void tls_update_rx_zc_capable(struct tls_context *tls_ctx);
>> diff --git a/net/tls/tls_keyupdate.c b/net/tls/tls_keyupdate.c
>> new file mode 100644
>> index 000000000000..543bf57599c7
>> --- /dev/null
>> +++ b/net/tls/tls_keyupdate.c
>> @@ -0,0 +1,150 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2026 Dell Technologies Inc. or its subsidiaries.
>> + *
>> + * TLS 1.3 KeyUpdate, RFC 9846 sections 4.7.3 and 7.2.
>> + *
>> + * A TLS 1.3 peer can change the key of the direction it sends in at any
>> + * time. It sends a KeyUpdate message, then encrypts all later records
>> + * with the next key. A sender must also change its key before the key
>> + * has protected too many records (section 5.5).
>> + *
>> + * The next key is derived from the application traffic secret, not from
>> + * the current key. User space gives the kernel only the key and IV, so
>> + * the kernel cannot derive the next key on its own. Without the secret,
>> + * a received KeyUpdate goes to the application, and the kernel stops
>> + * decrypting until the application installs the next key with TLS_RX.
>> + *
>> + * With TLS_TX_TRAFFIC_SECRET or TLS_RX_TRAFFIC_SECRET, user space also
>> + * gives the kernel the secret of that direction. The kernel then 
>> handles
>> + * KeyUpdate itself. This file derives and installs the next key, and
>> + * processes a received KeyUpdate. tls_sw.c sends KeyUpdate messages.
>> + */
>> +
>> +#include <linux/jiffies.h>
>> +#include <linux/skbuff.h>
>> +#include <net/strparser.h>
>> +#include <net/tls.h>
>> +
>> +#include "tls.h"
>> +
>> +/* A peer that sends more KeyUpdates than this in one second ends the
>> + * connection. Each one costs three HMACs and a new key, and carries no
>> + * data.
>> + */
>> +#define TLS_KEYUPDATE_RX_MAX_PER_SEC    8
>> +
>> +/**
>> + * tls_keyupdate_rekey - install the next key of one direction
>> + * @sk: socket
>> + * @tx: non-zero for the transmit direction
>> + *
>> + * Derive the next application traffic secret from the registered one,
>> + * then its key and IV, and install them. The record sequence number
>> + * restarts at zero.
>> + *
>> + * Return: 0 on success, or a negative errno. On error the installed key
>> + * and the registered secret do not change.
>> + */
>> +int tls_keyupdate_rekey(struct sock *sk, int tx)
>> +{
>> +    struct tls_context *ctx = tls_get_ctx(sk);
>> +    struct tls_traffic_secret *secret;
>> +    const struct tls_cipher_desc *cipher_desc;
>> +    u8 iv[TLS_MAX_SALT_SIZE + TLS_MAX_IV_SIZE];
>> +    u8 next[TLS_MAX_TRAFFIC_SECRET_SIZE];
>> +    union tls_crypto_context tmp = {};
>> +    struct tls_crypto_info *info = &tmp.info;
>> +    int rc;
>> +
>> +    secret = tx ? &ctx->tx_secret : &ctx->rx_secret;
>> +    cipher_desc = get_cipher_desc(ctx->prot_info.cipher_type);
>> +    if (!cipher_desc || !secret->len ||
>> +        cipher_desc->salt + cipher_desc->iv > sizeof(iv))
>> +        return -EINVAL;
>> +
>> +    /* version and cipher_type; the rest of tmp stays zero */
>> +    *info = tx ? ctx->crypto_send.info : ctx->crypto_recv.info;
>> +
>> +    rc = tls_hkdf_expand_label(secret->data, secret->len, "traffic upd",
>> +                   next, secret->len);
>> +    if (rc)
>> +        goto out;
>> +
>> +    rc = tls_hkdf_expand_label(next, secret->len, "key",
>> +                   crypto_info_key(info, cipher_desc),
>> +                   cipher_desc->key);
>> +    if (rc)
>> +        goto out;
>> +
>> +    rc = tls_hkdf_expand_label(next, secret->len, "iv", iv,
>> +                   cipher_desc->salt + cipher_desc->iv);
>> +    if (rc)
>> +        goto out;
>> +
>> +    memcpy(crypto_info_salt(info, cipher_desc), iv, cipher_desc->salt);
>> +    memcpy(crypto_info_iv(info, cipher_desc), iv + cipher_desc->salt,
>> +           cipher_desc->iv);
>> +
>> +    rc = tls_set_sw_offload(sk, tx, info);
>> +    if (rc)
>> +        goto out;
>> +
>> +    memcpy(secret->data, next, secret->len);
>> +
>> +out:
>> +    memzero_explicit(next, sizeof(next));
>> +    memzero_explicit(iv, sizeof(iv));
>> +    memzero_explicit(&tmp, sizeof(tmp));
>> +
>> +    return rc;
>> +}
>> +
>> +/**
>> + * tls_keyupdate_rx - process a received KeyUpdate
>> + * @sk: socket
>> + * @skb: the decrypted record, which starts with a KeyUpdate message
>> + *
>> + * Called with the socket locked, for a direction with a registered
>> + * secret. The caller does not pass the record to the user.
>> + *
>> + * Return: 0 on success, or a negative errno if the connection must end.
>> + */
>> +int tls_keyupdate_rx(struct sock *sk, struct sk_buff *skb)
>> +{
>> +    struct tls_context *ctx = tls_get_ctx(sk);
>> +    struct tls_sw_context_rx *rx_ctx = tls_sw_ctx_rx(ctx);
>> +    const struct strp_msg *rxm = strp_msg(skb);
>> +    u8 msg[TLS_KEYUPDATE_MSG_SIZE];
>> +    int rc;
>> +
>> +    /* A KeyUpdate must end its record (section 5.1). Another message
>> +     * in the same record is not supported.
>> +     */
>> +    if (rxm->full_len != sizeof(msg) ||
>> +        skb_copy_bits(skb, rxm->offset, msg, sizeof(msg)))
>> +        return -EBADMSG;
>> +
>> +    /* msg_type, a 24-bit length of 1, then request_update */
>> +    if (msg[1] || msg[2] || msg[3] != 1)
>> +        return -EBADMSG;
>> +    if (msg[4] != TLS_KEY_UPDATE_NOT_REQUESTED &&
>> +        msg[4] != TLS_KEY_UPDATE_REQUESTED)
>> +        return -EBADMSG;
>> +
>> +    if (!rx_ctx->key_update_count ||
>> +        time_after(jiffies, rx_ctx->key_update_window + HZ)) {
>> +        rx_ctx->key_update_window = jiffies;
>> +        rx_ctx->key_update_count = 0;
>> +    }
>> +    if (++rx_ctx->key_update_count > TLS_KEYUPDATE_RX_MAX_PER_SEC)
> 
> Hmm. I see the rationale, but the actual number falls a bit out of
> thin air. And closing the connection with no indiation is bound
> to confuse users.

It's just to prevent a flood of KeyUpdates.

The number comes from GnuTLS: lib/tls13/key_update.c has
KEY_UPDATES_PER_WINDOW 8 in a window of 1000 ms, and the ninth
KeyUpdate ends the session with GNUTLS_E_TOO_MANY_HANDSHAKE_PACKETS.
GnuTLS logs it only at debug level. OpenSSL has no limit.

> Please add a WARN_ON() statemen there such that the admin is informed,
> and I _think_ we could just leave the connection running instead of
> closing.

The peer controls this condition, so a WARN_ON() would let a remote
peer trigger kernel warnings, and a panic with panic_on_warn. I would
use net_warn_ratelimited() and a MIB counter instead.

Leaving the connection running is fine with me. The peer is
authenticated, the cost per KeyUpdate is three HMACs and a key change,
and OpenSSL accepts any number. In v3, I will drop the limit and the
close, and count and log a peer that sends more than 8 KeyUpdates in
one second. Does that work for you?

> 
> Cheers,
> 
> Hannes


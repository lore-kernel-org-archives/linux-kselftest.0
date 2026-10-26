Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014116;
	b=lF6cKR+2QhwwJX37ia51qxFrAc/VCVda2HW5zoVOCf5W3m0J1Uf3C2UXnPkHFy2SYNnY
	 ZvsArBPiKMeFZvcDrWskAmbCeRwXVMQ0ncbgt7wJuXZCbidgtsezsLgNwnfZazywcWNyY
	 cOFY5WPABRRQ1Eu5SOxzjhw/Ljghp94J89LRXs2tPE/cWBaAq6dG24vVZn9mgFFz4rExP
	 oAQ+VNagSKtm7Ulvw4F8Ivhl3GZPFg/DVVawgCjJ53hPyrIvaRKQwKgoPCQp8Xdx9VkKG
	 JLlEYdwptQk2LoDuBDWqzW49VIrkQawAenTSyHw5MR7F3GDoQPYnvMgUD8zqAym6hpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ifcJOVQksIbT4LRSAR+fBN2obWCcURFUjY4fZfdk+Kk=;
	b=xrYlIQXYRBTfp7E+L1IV3ZtuBJ+V0yT1gyVd6Q2eQofrtodW2nFuOqhKhA1pzBXpqWPW
	 oE//vRO2hR1NmuHyN1rISy32eBNgzqLOXna8lIIEHhQdWno7k3pWpbvX1/8jPe8DJRILy
	 ePtwyfFj4DrjpqIZ3A0Q97zOg85fHvRzY7Cb1ru4h6RTOYi8Z94j7HmSb5DuJov1yhsZ7
	 HCqqGaPYhit8VO1NtH9iMCY4McfQKdqFyZf5e7bm8UXrCQFlmK4XUhRrL9W9JVnNiPzod
	 SlbebKI+mWYvkkBpxSprUJ4r80n6kvJ203/n1bMdqnHuvplGv45gOHWJ9oKttwm3Cnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QvYW1IQW;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85825606A321
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 11:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85825606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QvYW1IQW
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a19a2621dso1255557d50.0
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 04:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014114; x=1793618914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifcJOVQksIbT4LRSAR+fBN2obWCcURFUjY4fZfdk+Kk=;
        b=QvYW1IQWJwyBJH5cbSUFFe9eY59cCU71FavjFvkc4yZ2ghhx1ZfPq1iECSnEzxjTv/
         VOkSOuCkA2p8UKqY0PoUhuFJUV3ZlBpxwIvK30XM+mm9P2P8XGA2dGjVvxBmt4/kx7xj
         w1xJSiU2WXnFTxh+ioCygvCWVpdLApKF5Mi/k/2MD9C/5wLorxlOOSJ1ytHYTBhtIRxW
         M160lCzItACaYZDC7gZthdDhr7TxXRgLapEsDqCJphqSn8z5CINRgxGLaM+NZo+efrT4
         xy9RReAg7dh1r36t9O+o9mRdISsFqqfwyiU52oF3ZwkTGAXtGZkLs3N+BTAl1l086Wof
         pZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014114; x=1793618914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifcJOVQksIbT4LRSAR+fBN2obWCcURFUjY4fZfdk+Kk=;
        b=r5iBO0AAegdMzUWcKjpyif8ZSsTgTc3rKdKUnrwf7uvHxCJTRANsUYfUZQO4/laRTk
         CXAWV1gEQxTmqQ4YMESnRt2BJJZN5tTZX12/0+XPrph9QxeVc1T32a1GLowChn5JKw4G
         z8WpVakt/RH2e+BUw8UhfrrSVqRXsc+XLSM2P8LHMt7UJ1q5KWiOdzEvKhSm9PXl5Upw
         tLQtYLkmt+o/yHBYcFJ9RaFqirHTXmMALp6k2/BR4znI+XVsX3bqe14rV4v3yo8BGrKW
         j2S0xBsu0pTCOjOhAhEg6UnTch8tZ3uey04CD5tBlEUjBCeuzBkphCXYZV9biEzRbR8U
         XpTg==
X-Forwarded-Encrypted: i=1; AKwUvByj94MP4AduKY8UMex7Fk+G54uc34tjvBbgCgcYd2NW07n4ToYvvJ2tUVvQfPgntt1Wy+C6Gi/w4xfyl2Gadtw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAeLL/E52gxmyONoIpjYTZa2wfHM/U5IVXDSrkOg+LtmxHwJcj
	y2QDFlP/lTvE5SX9aVXPkjspxbwfYnsZBzV/mPiECNAze2Y0tkM3c5jA
X-Gm-Gg: AYBFou05iN5vQ2hG8//sw6O1BehJngcZZ0kVXJ3KvSI/CPHtKeKPfr8VFmeHGvzXH4i
	KiGHWJBvRjR2amaAuFiqL/wzi+vwraCiit8Lq7OqSLWRNHcjiC+SKMnJDN39oH6RXz2BgPovAEq
	yd6pZUmIHsygWoGNd7LnWzsObtinSemokDMyADt+dExD8i/EkYg7nNsYr4gpWUg6DW+/rwvheHp
	J3rxKnVln72Nuq4m8wwSKpzDmByO0Ou7QipkY9zln2fzulGKAKXkDicwpfpmG/YkLsGQyMdCkIH
	2q5S0QHaqVZ7rq57ePdD4dqNmNSVah53TOKUgCmKYlCQNUyU5OnC02qX3WtW+JcVW+w/WSpUOoS
	4LgCB88yok4rzJsHm2zG6JempT72f9S091IYfRQxbXK3GRwAcBi2aMTVEAQw2+Ixa9clB1l62zr
	CUQbuj9HWTyaMIyNaKFCJFsO0ChgvXDfeZThCs1bKb0sL0j3UF59UTR8MBA09BxTHpsekfai8ER
	D+eWEhb32lHZ8rEn1p4UAiAcsVEgznQ15kGYMWkntqm2ln7cBPvfMAmn4c5Bg==
X-Received: by 2002:a05:690e:169c:b0:679:a58:148c with SMTP id 956f58d0204a3-67a4519368cmr5729731d50.7.1793014114235;
        Mon, 26 Oct 2026 04:28:34 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a45ff8d6dsm3266096d50.1.2026.10.26.04.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:28:33 -0700 (PDT)
Message-ID: <69ac84e1-14c6-44bd-8eb4-a228918f9b61@gmail.com>
Date: Mon, 26 Oct 2026 07:28:32 -0400
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
Subject: Re: [PATCH RFC net-next 3/5] tls: update the RX key when a KeyUpdate
 is received
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
References: <20261025-keyupdate-rfc-v1-0-60b7756eccbd@gmail.com>
 <20261025-keyupdate-rfc-v1-3-60b7756eccbd@gmail.com>
 <8af172e4-0039-4dbb-970e-ab91b3d6e149@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <8af172e4-0039-4dbb-970e-ab91b3d6e149@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/26/26 03:53, Hannes Reinecke wrote:
> On 10/26/26 1:36 AM, Martin Belanger via B4 Relay wrote:
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
>>   net/tls/tls_keyupdate.c | 150 
>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>   net/tls/tls_sw.c        |  35 +++++++++--
>>   5 files changed, 190 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/net/tls.h b/include/net/tls.h
>> index aacc6d12226e..a5bc28a7d1f5 100644
>> --- a/include/net/tls.h
>> +++ b/include/net/tls.h
>> @@ -63,6 +63,11 @@ struct tls_rec;
>>     #define TLS_HANDSHAKE_KEYUPDATE        24    /* rfc8446 B.3: Key 
>> update */
>>   +/* KeyUpdate: msg_type, 24-bit length, request_update (RFC 9846 
>> 4.7.3) */
>> +#define TLS_KEYUPDATE_MSG_SIZE        5
>> +#define TLS_KEY_UPDATE_NOT_REQUESTED    0
>> +#define TLS_KEY_UPDATE_REQUESTED    1
>> +
>>   #define TLS_AAD_SPACE_SIZE        13
>>     /* SHA-384, the longest hash of a TLS 1.3 cipher suite kTLS 
>> supports */
>> @@ -142,6 +147,8 @@ struct tls_sw_context_rx {
>>       u8 zc_capable:1;
>>       u8 reader_contended:1;
>>       bool key_update_pending;
>> +    u8 key_update_count;        /* received in this window */
>> +    unsigned long key_update_window;    /* jiffies */
>>         struct tls_strparser strp;
>>   diff --git a/net/tls/Makefile b/net/tls/Makefile
>> index 6edcf1271b75..ce8ac6a59f8c 100644
>> --- a/net/tls/Makefile
>> +++ b/net/tls/Makefile
>> @@ -7,6 +7,7 @@ CFLAGS_trace.o := -I$(src)
>>     obj-$(CONFIG_TLS) += tls.o
>>   -tls-y := tls_main.o tls_sw.o tls_proc.o trace.o tls_strp.o tls_hkdf.o
>> +tls-y := tls_main.o tls_sw.o tls_proc.o trace.o tls_strp.o tls_hkdf.o \
>> +     tls_keyupdate.o
>>     tls-$(CONFIG_TLS_DEVICE) += tls_device.o tls_device_fallback.o
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
>> + * A TLS 1.3 peer can change the key of the direction it sends in at 
>> any
>> + * time. It sends a KeyUpdate message, then encrypts all later records
>> + * with the next key. A sender must also change its key before the key
>> + * has protected too many records (section 5.5).
>> + *
>> + * The next key is derived from the application traffic secret, not 
>> from
>> + * the current key. User space gives the kernel only the key and IV, so
>> + * the kernel cannot derive the next key on its own. Without the 
>> secret,
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
>> + * Return: 0 on success, or a negative errno. On error the installed 
>> key
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
>> +    rc = tls_hkdf_expand_label(secret->data, secret->len, "traffic 
>> upd",
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
> Hmm. So this calculates 'iv' and 'key' from the traffic secret.
> But as it does, why can't we use it to calculate the _initial_ 'iv' 
> and 'key' from the traffic secret?
> IE wouldn't it make sense to allow for _just_ the (initial) traffic
> secrets to be set, and calculate 'iv' and 'key' on the fly _always?
> That would remove the possible admin error where the admin sets a
> set of 'IV' and 'key' values which do _not_ match the traffic secrets.
>
> Hmm?
It can. I kept TLS_TX and TLS_RX as they are for two reasons:

- Every kTLS user (OpenSSL, GnuTLS, tlshd) already derives the key and
   IV and installs them with TLS_TX and TLS_RX. The secret is an
   optional addition for KeyUpdate. Code that does not use KeyUpdate
   does not change.
- The crypto_info of TLS_TX and TLS_RX also holds the version, the
   cipher and the record sequence number. An option that takes only the
   secret needs a new struct for these.

With the check from patch 2, the kernel refuses a secret that does not
match the installed key and IV. So the error you describe cannot
happen.

Martin
>
>> +/**
>> + * tls_keyupdate_rx - process a received KeyUpdate
>> + * @sk: socket
>> + * @skb: the decrypted record, which starts with a KeyUpdate message
>> + *
>> + * Called with the socket locked, for a direction with a registered
>> + * secret. The caller does not pass the record to the user.
>> + *
>> + * Return: 0 on success, or a negative errno if the connection must 
>> end.
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
>> +        return -EBADMSG;
>> +
>> +    rc = tls_keyupdate_rekey(sk, 0);
>> +    if (rc) {
>> +        TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSRXREKEYERROR);
>> +        return rc;
>> +    }
>> +    TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSRXREKEYOK);
>> +
>> +    return 0;
>> +}
>> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
>> index 312e51270f29..a314fa638dc3 100644
>> --- a/net/tls/tls_sw.c
>> +++ b/net/tls/tls_sw.c
>> @@ -1551,15 +1551,26 @@ static int tls_check_pending_rekey(struct 
>> sock *sk, struct tls_context *ctx,
>>       if (hs_type == TLS_HANDSHAKE_KEYUPDATE) {
>>           struct tls_sw_context_rx *rx_ctx = ctx->priv_ctx_rx;
>>   -        WRITE_ONCE(rx_ctx->key_update_pending, true);
>>           TLS_INC_STATS(sock_net(sk), LINUX_MIB_TLSRXREKEYRECEIVED);
>> +
>> +        if (ctx->rx_secret.len) {
>> +            err = tls_keyupdate_rx(sk, skb);
>> +            if (err) {
>> +                tls_err_abort(sk, err);
>> +                return err;
>> +            }
>> +            return 1;
>> +        }
>> +
>> +        WRITE_ONCE(rx_ctx->key_update_pending, true);
>>       }
>>         return 0;
>>   }
>>     /* On decrypt failure the connection is aborted (sk_err set) before
>> - * returning a negative errno.
>> + * returning a negative errno. Return 1 for a record the kernel 
>> consumed
>> + * (a KeyUpdate): the caller frees it and does not pass it to the user.
>>    */
>>   static int tls_rx_one_record(struct sock *sk, struct msghdr *msg,
>>                    struct tls_decrypt_arg *darg)
>> @@ -1883,6 +1894,11 @@ int tls_sw_recvmsg(struct sock *sk,
>>           err = tls_rx_one_record(sk, msg, &darg);
>>           if (err < 0)
>>               goto recv_end;
>> +        if (err > 0) {
>> +            tls_rx_rec_done(ctx);
>> +            consume_skb(darg.skb);
>> +            continue;
>> +        }
>>             async |= darg.async;
>>   @@ -2019,9 +2035,8 @@ ssize_t tls_sw_splice_read(struct socket 
>> *sock,  loff_t *ppos,
>>       if (err)
>>           goto splice_read_end;
>>   -    if (!skb_queue_empty(&ctx->rx_list)) {
>> -        skb = __skb_dequeue(&ctx->rx_list);
>> -    } else {
>> +    skb = __skb_dequeue(&ctx->rx_list);
>> +    while (!skb) {
>>           struct tls_decrypt_arg darg;
>>             err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
>> @@ -2036,7 +2051,10 @@ ssize_t tls_sw_splice_read(struct socket 
>> *sock,  loff_t *ppos,
>>               goto splice_read_end;
>>             tls_rx_rec_done(ctx);
>> -        skb = darg.skb;
>> +        if (err > 0)
>> +            consume_skb(darg.skb);
>> +        else
>> +            skb = darg.skb;
>>       }
>>         rxm = strp_msg(skb);
>> @@ -2118,6 +2136,11 @@ int tls_sw_read_sock(struct sock *sk, 
>> read_descriptor_t *desc,
>>               err = tls_rx_one_record(sk, NULL, &darg);
>>               if (err < 0)
>>                   goto read_sock_end;
>> +            if (err > 0) {
>> +                tls_rx_rec_done(ctx);
>> +                consume_skb(darg.skb);
>> +                continue;
>> +            }
>>                 released = tls_read_flush_backlog(sk, prot, INT_MAX,
>>                                 0, decrypted,
>>
>
> The rest looks okay.
>
> Cheers,
>
> Hannes

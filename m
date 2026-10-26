Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014073;
	b=2YMZgO38Wl4iKMRaVlJY1hYirixRIlP+dpYAgh1GBNOBDkwTyoy6CYTx2++EiErcHoyT
	 YUd+GCvBxknla4Wx7QToykP7bA6FDSNrA6/7J2W0iZJTsZN5jkJ9wAuFkq71mMiFghOzj
	 mmn9il+QkBxA6r9uDy71muCLfuEYmcGmmOmltg/7rRY2TzCBfPOJshMbWJobm7TGE0U91
	 gJAA9nDB0Nq4dch4PyD8MjNn27SHo65ymqiykTYXHvth4fz8Cnvs/kcs9xfQDQpUZTpeT
	 CKLKrAfjjwMUkNdujb0zmiTShRS1g+UaBizrrv0I0q3SEk720pzggaJTiRxjjKSNk7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+KAqS8M+/qoJA2pnACOUntqjOG8j1ld8MRFk1qGoTjs=;
	b=N6n7p045kFX41Y2fgJGdi82v5DVMb3bkQpISrLrl32AhgOZz2vBVOuH4hZVQMuXrkHfz
	 SKI4LH/q89PJ8/rmmB+4nMDUTzWSmdG1HQqIb72HpyaL18UqTSdDdlp+5lrpxxRfei/mc
	 M+kheIJ0uYa0DgUUw1Eyv9wA67I4y5d+hPBT92K2yKXracXUZlKX4cMGwbjhS4MkWDPgW
	 hCvU/bCFT0AJucqtKlmxqmxmgpPQ0SZLyCilVSZVBWLJm8/ee+NRxGeUExPTQjmXWhw2+
	 3GrWfb9xfT6UAHH3cutwwutPQFsDYr/UntN+5JOQUCaPAiY7vFk3ytT87iQH6qmJP0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O3sQe44L;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6452606A321
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 11:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6452606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O3sQe44L
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a3d39e406so1162692d50.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 04:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014071; x=1793618871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KAqS8M+/qoJA2pnACOUntqjOG8j1ld8MRFk1qGoTjs=;
        b=O3sQe44LEw3wLqxdMypsQXCjVgUgPkv9JV5RPjnQtyId4fP+SlVok6yLNRtx3psBFf
         DHpRFLamxTj7ZCg29O3A7HI7td+axiPUZF/vIPw3AJakZUvd26uOZs6b35aCnOLq7csx
         sz5luyeqiEMD6R4h20SXeAuB3wfydhoBExvlI2ls9ssM/TcF0HJlMESJ8tvaYj+a3yOC
         26XvlSf91bsRC4n2xfHLglF15K2rFQl1DTv44CLmD0Mlq1zeSGfb72iGIjEUbus1jbks
         A2s0CSUk6oV4hKgUj66aNR1KW+dvVHchrgnRAnvzoRn9NTDpJJ/nTW+VrXRZQJgWyf4E
         rdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014071; x=1793618871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KAqS8M+/qoJA2pnACOUntqjOG8j1ld8MRFk1qGoTjs=;
        b=PKb5p5iVNHJMObkpPrpvwDV0zbQtw1N3J/pyGBV0rfQClzt2qLsrsDFMdfQ28po2ZC
         HGdk/OQS+6lzlOtr+2cUDMBjtzIgX4cZy3yW3WDU202RCMB/fxhDi0Lr6h/soKcBQAiC
         6lNCE93JhAQbKxaX4GW6C2Mr0fjsPrTsbZ4VkAZbt2xFvHD3aoDyqki/7pquwR/bgd8p
         3arunz8CRK56KL5GKGtAIuFK3pTeqYM2XgNrMNWiS59NGJq8F+KJpitY6mDT1ybCqye2
         QMCBKd6uGQPsbBqDBToHfjgUT4QVAfaHJwr5kjRHclDIZwuR9l0ZhqEdPvlXbJX2L9pW
         +RmA==
X-Forwarded-Encrypted: i=1; AKwUvBz1GnWU37r3JEGH8McrAiuK2xdF8V2iZQ/rn9bW+J0Y8Ag1kQT21WYf8v8sMAKQ+gsljz4wwdE0qtAyxFKoit4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsELsQ/BzfOrNzOiytPjX053RloDeVlHGckFx+u/fdIngOr8jH
	5XHCnhlGU23pabHAa4OL6b31So+C+6vWc/B6Yt9QzDPNR5Ik1yE7jJ5q
X-Gm-Gg: AYBFou0yC0HJNy2yZ9H8lTgswAoMNJk9vTaitq7ZwZty+N/6l2VE1m+XuJjmNBI6kv2
	YnXFwnBbK8aJ7A3Qtb+ypHv+3kdZsnhDzv+Xj92T/moQjwttybIwvhgMMUvk/6UXUfzup8LgqNP
	JTw1hguAstYa6wJINmns6jJt2ZC0pAlC2oslQu2khNWWzfms4RkumzUAc+UXLSEcQyTptBmsGRH
	EjyTgz7kwpNloS0LGlivAIGm2IrC/m9gOd7jVBB/5CN56EHrKxwbpbkDu+l413XdX5m/gUDSI+q
	7t4iOYt71IxtS19q7Y6Nles8iEI89782JWjJDvHa9hoq2DlZsZ3dEgbeENlyGhFIJbvpIwF3WRM
	K9lA0V0IxXKNxn9CiQ1XOUUC27xVEZ4r9fy1PGSEci8u7HCti+AloV99LNflwXpEjMsxc+/4NgC
	1SL53rVZfwG6ng2i5XCTY/G8yYZwy2pYGdDOiTDGI5Y1JpqgMi3lGR042qE2yUTBBk7dprWWTNn
	Q+PYjz1ZcXSwoHRl0uU4Uv93QV5YsYa/AAIZBpCemJGKlSOT2VfD3N6aVgIBjA=
X-Received: by 2002:a05:690e:144a:b0:67a:5e25:607b with SMTP id 956f58d0204a3-67a5e2565dbmr2989868d50.54.1793014070886;
        Mon, 26 Oct 2026 04:27:50 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a46235de1sm3114048d50.13.2026.10.26.04.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:27:50 -0700 (PDT)
Message-ID: <6ad9cd0e-e5a4-4b8b-8b5f-c93f6b249647@gmail.com>
Date: Mon, 26 Oct 2026 07:27:48 -0400
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
Subject: Re: [PATCH RFC net-next 2/5] tls: add socket options to register the
 traffic secrets
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
 <20261025-keyupdate-rfc-v1-2-60b7756eccbd@gmail.com>
 <131fc354-ff38-4aca-ac3d-8e3a6f3716f4@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <131fc354-ff38-4aca-ac3d-8e3a6f3716f4@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/26/26 03:37, Hannes Reinecke wrote:
> On 10/26/26 1:36 AM, Martin Belanger via B4 Relay wrote:
>> From: Martin Belanger <martin.belanger@dell.com>
>>
>> kTLS holds the key and IV of each direction, but not the traffic secret
>> they were derived from. The derivation is one-way, so the kernel cannot
>> compute the next generation for a KeyUpdate on its own.
>>
>> Add TLS_TX_TRAFFIC_SECRET and TLS_RX_TRAFFIC_SECRET. The owner of the
>> socket passes the TLS 1.3 application traffic secret of a direction 
>> after
>> installing its key. The cipher of the installed key selects the hash, so
>> the option takes only the secret. A socket without a registered secret
>> behaves as before.
>>
>> The TX secret can be registered alone. The RX secret needs the TX secret
>> first: a received KeyUpdate can ask for one in reply, and since the
>> kernel consumes the record, only the kernel can send that reply.
>>
>> Installing a new key with TLS_TX or TLS_RX removes the secrets that no
>> longer apply. The secrets are cleared when the context is freed and
>> cannot be read back.
>>
>> Assisted-by: LLM
>> Signed-off-by: Martin Belanger <martin.belanger@dell.com>
>> ---
>>   Documentation/networking/tls.rst | 26 ++++++++++++
>>   include/net/tls.h                | 13 ++++++
>>   include/uapi/linux/tls.h         |  2 +
>>   net/tls/tls_main.c               | 86 
>> +++++++++++++++++++++++++++++++++++++++-
>>   4 files changed, 126 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/networking/tls.rst 
>> b/Documentation/networking/tls.rst
>> index 980c442d7161..2e011bd1ce4a 100644
>> --- a/Documentation/networking/tls.rst
>> +++ b/Documentation/networking/tls.rst
>> @@ -300,6 +300,32 @@ extra byte used by the ContentType field.
>>     [1] https://datatracker.ietf.org/doc/html/rfc8449
>>   +TLS_TX_TRAFFIC_SECRET and TLS_RX_TRAFFIC_SECRET
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +``TLS_TX_TRAFFIC_SECRET`` registers the TLS 1.3 application traffic 
>> secret
>> +of the transmit direction, ``TLS_RX_TRAFFIC_SECRET`` that of the 
>> receive
>> +direction. With a registered secret, the kernel performs KeyUpdate 
>> for that
>> +direction itself (RFC 9846, section 4.7.3). The value is the secret 
>> itself.
>> +TLS 1.3 only, software path only.
>> +
>> +Install the key of the direction first, with the ``TLS_TX`` or 
>> ``TLS_RX``
>> +socket option described above. The cipher of that key selects the 
>> hash, and
>> +the secret must have the length of that hash: 32 bytes for SHA-256
>> +(AES-128-GCM, AES-128-CCM, ChaCha20-Poly1305) or 48 bytes for SHA-384
>> +(AES-256-GCM). Other ciphers return ``EOPNOTSUPP``.
>> +
>> +Each secret can be registered once. ``TLS_RX_TRAFFIC_SECRET`` needs
>> +``TLS_TX_TRAFFIC_SECRET`` first: a received KeyUpdate can ask for 
>> one in
>> +reply, and only the kernel sees it. ``TLS_TX_TRAFFIC_SECRET`` alone is
>> +allowed.
>> +
>> +If the application installs a new key itself with ``TLS_TX``, both 
>> secrets
>> +are removed. With ``TLS_RX``, the RX secret is removed. KeyUpdate 
>> for that
>> +direction is then left to the application again.
>> +
>> +The secrets cannot be read back.
>> +
>>   Statistics
>>   ==========
>>   diff --git a/include/net/tls.h b/include/net/tls.h
>> index e57bef58851e..aacc6d12226e 100644
>> --- a/include/net/tls.h
>> +++ b/include/net/tls.h
>> @@ -65,6 +65,9 @@ struct tls_rec;
>>     #define TLS_AAD_SPACE_SIZE        13
>>   +/* SHA-384, the longest hash of a TLS 1.3 cipher suite kTLS 
>> supports */
>> +#define TLS_MAX_TRAFFIC_SECRET_SIZE    48
>> +
>>   #define TLS_MAX_IV_SIZE            16
>>   #define TLS_MAX_SALT_SIZE        4
>>   #define TLS_TAG_SIZE            16
>> @@ -224,6 +227,12 @@ struct tls_prot_info {
>>       u16 tail_size;
>>   };
>>   +/* A TLS 1.3 application traffic secret. len is 0 if none is 
>> registered. */
>> +struct tls_traffic_secret {
>> +    u8 data[TLS_MAX_TRAFFIC_SECRET_SIZE];
>> +    u8 len;
>> +};
>> +
>>   struct tls_context {
>>       /* read-only cache line */
>>       struct tls_prot_info prot_info;
>> @@ -266,6 +275,10 @@ struct tls_context {
>>       union tls_crypto_context crypto_send;
>>       union tls_crypto_context crypto_recv;
>>   +    /* Registered for KeyUpdate, protected by the socket lock */
>> +    struct tls_traffic_secret tx_secret;
>> +    struct tls_traffic_secret rx_secret;
>> +
>>       struct list_head list;
>>       refcount_t refcount;
>>       struct rcu_head rcu;
>> diff --git a/include/uapi/linux/tls.h b/include/uapi/linux/tls.h
>> index 1245ab38afc1..d1b136ecea96 100644
>> --- a/include/uapi/linux/tls.h
>> +++ b/include/uapi/linux/tls.h
>> @@ -42,6 +42,8 @@
>>   #define TLS_TX_ZEROCOPY_RO    3    /* TX zerocopy (only sendfile 
>> now) */
>>   #define TLS_RX_EXPECT_NO_PAD    4    /* Attempt opportunistic 
>> zero-copy */
>>   #define TLS_TX_MAX_PAYLOAD_LEN    5    /* Maximum plaintext size */
>> +#define TLS_TX_TRAFFIC_SECRET    6    /* TLS 1.3 TX traffic secret */
>> +#define TLS_RX_TRAFFIC_SECRET    7    /* TLS 1.3 RX traffic secret */
>>     /* Supported versions */
>>   #define TLS_VERSION_MINOR(ver)    ((ver) & 0xFF)
>> diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
>> index 8bdb78718a8d..1c6e993ec012 100644
>> --- a/net/tls/tls_main.c
>> +++ b/net/tls/tls_main.c
>> @@ -31,6 +31,7 @@
>>    * SOFTWARE.
>>    */
>>   +#include <crypto/sha2.h>
>>   #include <linux/module.h>
>>     #include <net/tcp.h>
>> @@ -325,6 +326,8 @@ void tls_ctx_free(struct sock *sk, struct 
>> tls_context *ctx)
>>         memzero_explicit(&ctx->crypto_send, sizeof(ctx->crypto_send));
>>       memzero_explicit(&ctx->crypto_recv, sizeof(ctx->crypto_recv));
>> +    memzero_explicit(&ctx->tx_secret, sizeof(ctx->tx_secret));
>> +    memzero_explicit(&ctx->rx_secret, sizeof(ctx->rx_secret));
>>       mutex_destroy(&ctx->tx_lock);
>>         if (sk)
>> @@ -757,8 +760,16 @@ static int do_tls_setsockopt_conf(struct sock 
>> *sk, sockptr_t optval,
>>           ctx->rx_conf = conf;
>>       update_sk_prot(sk, ctx);
>>   -    if (update)
>> +    if (update) {
>> +        /* The registered secret no longer matches the key. The RX
>> +         * secret also needs the TX one, see 
>> do_tls_setsockopt_secret().
>> +         */
>
> What is a bit unfortunate that we don't have a direct link between the 
> key and the traffic secret. So a user might set a key which is _not_
> derived from the traffic secret, rendering the KeyUpdate non-workable.
>
> Can we add a check here?
> It should be possible to calculate the key from the traffic secret, no?
>
Yes. The key is HKDF-Expand-Label(secret, "key") and the IV is
HKDF-Expand-Label(secret, "iv"). When the secret is registered, the
kernel can derive both and compare them with the installed key and IV.
A secret that does not match fails with EINVAL. I will add this in v2.
>> +        if (tx)
>> +            memzero_explicit(&ctx->tx_secret,
>> +                     sizeof(ctx->tx_secret));
>> +        memzero_explicit(&ctx->rx_secret, sizeof(ctx->rx_secret));
>>           return 0;
>> +    }
>>         if (tx) {
>>           ctx->sk_write_space = sk->sk_write_space;
>> @@ -857,6 +868,72 @@ static int 
>> do_tls_setsockopt_tx_payload_len(struct sock *sk, sockptr_t optval,
>>       return 0;
>>   }
>>   +/* Length of the TLS 1.3 traffic secret for @cipher_type, the size of
>> + * its hash. 0 if KeyUpdate is not supported for the cipher.
>> + */
>> +static int tls_traffic_secret_len(u16 cipher_type)
>> +{
>> +    switch (cipher_type) {
>> +    case TLS_CIPHER_AES_GCM_128:
>> +    case TLS_CIPHER_AES_CCM_128:
>> +    case TLS_CIPHER_CHACHA20_POLY1305:
>> +        return SHA256_DIGEST_SIZE;
>> +    case TLS_CIPHER_AES_GCM_256:
>> +        return SHA384_DIGEST_SIZE;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>> +static int do_tls_setsockopt_secret(struct sock *sk, sockptr_t optval,
>> +                    unsigned int optlen, int tx)
>> +{
>> +    struct tls_context *ctx = tls_get_ctx(sk);
>> +    struct tls_crypto_info *crypto_info;
>> +    struct tls_traffic_secret *secret;
>> +    int len;
>> +
>> +    if (tx) {
>> +        crypto_info = &ctx->crypto_send.info;
>> +        secret = &ctx->tx_secret;
>> +    } else {
>> +        crypto_info = &ctx->crypto_recv.info;
>> +        secret = &ctx->rx_secret;
>> +    }
>> +
>> +    /* The key must be installed first: its cipher selects the hash */
>> +    if (!TLS_CRYPTO_INFO_READY(crypto_info) ||
>> +        crypto_info->version != TLS_1_3_VERSION)
>> +        return -EINVAL;
>> +
>> +    if ((tx ? ctx->tx_conf : ctx->rx_conf) != TLS_SW)
>> +        return -EOPNOTSUPP;
>> +
>> +    len = tls_traffic_secret_len(crypto_info->cipher_type);
>> +    if (!len)
>> +        return -EOPNOTSUPP;
>> +
>> +    if (sockptr_is_null(optval) || optlen != len)
>> +        return -EINVAL;
>> +
>> +    /* A received KeyUpdate may ask for one in reply. The kernel
>> +     * consumes the record, so only the kernel can send the reply.
>> +     */
>> +    if (!tx && !ctx->tx_secret.len)
>> +        return -EINVAL;
>
> Hmm? What is this? Doesn't that imply that you first have to set the
> TX key before setting the RX key?
> The documentation says we can do either way ...
The order applies only to the secrets. TLS_TX and TLS_RX can still be
set in either order. tls.rst says "TLS_RX_TRAFFIC_SECRET needs
TLS_TX_TRAFFIC_SECRET first".

The check refuses an RX secret without a TX secret. A received
KeyUpdate can have update_requested set. The kernel consumes the
record, so only the kernel can send the reply, and the reply needs the
TX secret. An RX secret alone could never answer it.

An application normally sets both secrets one after the other, right
after the handshake. A KeyUpdate is processed only when the socket is
read, so it cannot arrive between the two calls unless another thread
reads the socket.

Question 1 of the cover letter, one option for both secrets, would
remove the order. I will wait for other opinions on it.

Martin
>
>> +
>> +    if (secret->len)
>> +        return -EBUSY;
>> +
>> +    if (copy_from_sockptr(secret->data, optval, len)) {
>> +        memzero_explicit(secret->data, sizeof(secret->data));
>> +        return -EFAULT;
>> +    }
>> +    secret->len = len;
>> +
>> +    return 0;
>> +}
>> +
>>   static int do_tls_setsockopt(struct sock *sk, int optname, 
>> sockptr_t optval,
>>                    unsigned int optlen)
>>   {
>> @@ -883,6 +960,13 @@ static int do_tls_setsockopt(struct sock *sk, 
>> int optname, sockptr_t optval,
>>           rc = do_tls_setsockopt_tx_payload_len(sk, optval, optlen);
>>           release_sock(sk);
>>           break;
>> +    case TLS_TX_TRAFFIC_SECRET:
>> +    case TLS_RX_TRAFFIC_SECRET:
>> +        lock_sock(sk);
>> +        rc = do_tls_setsockopt_secret(sk, optval, optlen,
>> +                          optname == TLS_TX_TRAFFIC_SECRET);
>> +        release_sock(sk);
>> +        break;
>>       default:
>>           rc = -ENOPROTOOPT;
>>           break;
>>
> Cheers,
>
> Hannes

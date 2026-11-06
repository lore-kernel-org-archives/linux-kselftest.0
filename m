Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993542;
	b=NZsUwZ6mkKp2AGv2PKpGXGg3DdhbXV8s5nsfR/tDmE/dr/q1J9aLbDsHSHfgcJRXJ9rZ
	 I0sHeKiNlcivP/Tu8ZvYilVNaEzUYeoik/oyGbprnZ7X6pdghf5tFbxgpQBJR9h8fyhRY
	 khajzh6gzOgKvThAu3rxE4aR8sI8u5fD5xckB2yY7yD2I95BVJsYeyR8lVDRO1tuIKTjN
	 MvYILz2ItBvkZo12Ew3iGvHY/rvBuVKjvR4peiwuQE0uLeh+knKuQO8BIMitCPr+DojHb
	 C2GhRGZRj65YEpq1Hxbho4d4dNW5DPElD0TBqnSHbnElV0JSAU8UMXXonaO1CQmSjlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8oWRxGJ7JRX83dhFy9OyjZ4hFKtbgD4sIEDwt+Jk+oE=;
	b=eggDZlsgqBKM8HBHeJREkSAxciQu5MFLF82v+DuiR/ymW3cdCHv/AoOzEATHinkFmNgY
	 OhHYC4I5rsLbhwnrXuoL65RNJXPFXk7KBL3PDoej2tXvnw7dUaO60Kws2P7tQo8Sn/lS/
	 Q70fWVpVmgkjYkHa5Sb3lqDJsxo8UjuTjUW20LgUnxvSiKi1/duMGzERrAH+J2OKyXZlh
	 QquC8LlTpXLtqfcg+gcup2nPLxY3EWGiL2KCzvBVUUqY2K0+D98Mzhz8MMqZS2UufJ1xz
	 eSFTCTyI/aDRa97bR/vNTWJTikhWVz59On3pF3Nb0mSLmpDyTLpu6VMIMbI2fGOF68g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eReaRoZj;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0880F606D802
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 19:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0880F606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eReaRoZj
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso433228a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 11:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793993540; x=1794598340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oWRxGJ7JRX83dhFy9OyjZ4hFKtbgD4sIEDwt+Jk+oE=;
        b=eReaRoZj/+PPfgXJOc7CpmAiCwwiWKl9CaM3vPVbmIH03fMsj19mLn6Ko5A4GabAsE
         sog6ybxT1PcEshur15EY9SZGwUpD6eb3SwnrKdB598DJzHjnTT5wrBgOe5He0oFbe0ff
         HHm6cnr0ryAcry2GtFFPqjH2gu6ZnOWeifBP8o8uffqMCfluZo3T8RBRGvxa4j+J2aEb
         puIyZQZB6Cjq7Zg8a6GoFFfDc6XbEsN4Lt2EiJhKeRwgIe17Aa4v1/O0DdtohAQaXJi2
         BNR8/q08PDGfdQnH5/esQUVKscN/SkcRddGzCTe00zD9GEvNhVg+O1tltPj45NnQlvFV
         DCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993540; x=1794598340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8oWRxGJ7JRX83dhFy9OyjZ4hFKtbgD4sIEDwt+Jk+oE=;
        b=QSpFTaH3qePFiz6unaxzI/uuFKL1NGFKNngded5quioMYLHc1DVREEljj70q8ZDd+V
         9+hLxpJGydCDKGSpq0HKJbAGWlUMj4A8ehglY0hzUWj6+MFbw2Nu4tyglrENZFRLncmo
         O1c7vXK1AM+JDoCTBx3uVoJs0Ezc+Cr52FKg8urdBnbKKkIG764zeFHBxaNpI1C8GSx5
         hkM2VFKv3Xd4UTZcLIysDskWhZqD9z1m+k7Umdj0jKg48tNMq4UYCkOIDSlsOgBmdRyW
         2jHaEi1hca4ipJ1KvHqgXJf0msNgkflT2gyFab0Wcs38OrkJGhQe71HaAnsowiBMWxr6
         G07w==
X-Forwarded-Encrypted: i=1; AL+hErGcshjFNNobbW3ItvjVUn69lPCzGgQbrRmr8qFOVy38zkCu9/JXrshXTd9P9lxcsUK85woIhj43QP76px5qH2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cxjrV1l1BpI7C8FFGVyBDWDLoeqvwTnxU+V0bQ46qvucyE+bC
	LotTqYss8pDKAR8orgGv6TjjKXchB2W8mMCpZiayvZ8SE8ASw0MJNo/SXYdAcdV7w6ul/W7/D7X
	rACu/HkqdBgRLbT4yUWoTcwsqh9UnTlF8OYPx
X-Gm-Gg: AYBFou32Wi3SaQizKPEQELQ7xSm429lGPlJ51FeyKUkC9XRuvzRC+zecxZkN+M0Icme
	F1nUINh/wTn0j93iNCxLV0Ww/IushiT9nC98VAcyjk7uoLVSo9RZGYZh0pXrbvGFrtFTyD3c49r
	rcTgFqeEBlstxm+UkU7d4ZWgJVkgmMPs+m9PdEBnug52tIraM3t6IJQBRsl8JGpiCQslvOnzrgL
	ON+g1ZUfVmJlhmU8n/XreP5oWeMave36qGt5YLWWy1aG0qIi3rtrhIXZPA+AbOp0vma6rSxp5bq
	o/uieeInrRcse8mVD1t4dXwHPZ2Y4WC0WvaCA0rtb92c8JeomlERoYm7zPktaSQ9Rt7qMw5R/gj
	/ob3XINK4fxP0Ry1GATWgVgIzbenujusRH4w=
X-Received: by 2002:a17:90b:3846:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3b0db6218d4mr3586351a91.4.1793993540299;
        Fri, 06 Nov 2026 11:32:20 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1058d4f27sm53275a91.3.2026.11.06.11.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:32:20 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 7B5A940152;
	Fri,  6 Nov 2026 12:32:19 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 784EBDCE11C; Fri,  6 Nov 2026 12:32:19 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 2/2] tls: make the record number wrap abort final
Date: Fri,  6 Nov 2026 12:32:09 -0700
Message-ID: <20261106193210.1152577-2-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261106193210.1152577-1-rjethwani@purestorage.com>
References: <20261106193210.1152577-1-rjethwani@purestorage.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a record number wraps, TLS aborts the connection with EBADMSG, but
only through sk_err, which is consumed when it is reported, by SO_ERROR
or sock_error(). After that the socket carries on under the same key
with record number 0:

 - RX: tls_rx_rec_wait() only checks sk_err while no record is ready.
   After the record with the last number is decrypted, tls_rx_rec_done()
   lets the parser pick up the next record. If it is already queued,
   recvmsg() keeps going because a record is ready, decrypts it with
   record number 0 and returns both, without an error. sk_err is only
   reported once the parser runs dry, and once it is cleared, receiving
   continues.

 - TX: the record using the last number is encrypted and queued, then
   fails to go out because sk_err is set. Once SO_ERROR is read, the
   next send transmits it and continues with record number 0.

Add tls_err_abort_final(), which also records the error in the TLS
context, where nothing clears it, and use it for the record number wrap
in both directions:

 - tls_rx_rec_wait() checks it before looking for a ready record. Data
   that was already decrypted can still be read, as before. poll()
   reports EPOLLERR, and EPOLLIN only for that data.

 - sendmsg(), the device push and tls_push_record() check it before
   taking or encrypting more data, and tls_push_sg() before handing
   anything to TCP, so that no queued record goes out after the abort.
   The device push doesn't count the refused record as sent, like the
   SW path, and tls_tx_records() doesn't raise sk_err again for it.

A KeyUpdate may be the last record received under a key; that already
pauses receive until a new key is installed. Don't abort the connection
in that case.

Add TLS 1.3 selftests. tx_wrap starts TX at the last record number, as
recseq_wrap does. The RX tests can't get their records that way, since
TX now refuses to send the record using the last number. In TLS 1.3 the
record number only enters the nonce, so TX instead starts at record
number 0 with the IV XORed with the second to last number, which
produces the last two RX records, then switches back to the plain IV
with a silent rekey to produce the wrapped record number 0.

Suggested-by: Sabrina Dubroca <sd@queasysnail.net>
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 Documentation/networking/tls.rst  |  19 +++
 include/net/tls.h                 |   1 +
 net/tls/tls.h                     |  24 +++-
 net/tls/tls_device.c              |  12 +-
 net/tls/tls_main.c                |   8 +-
 net/tls/tls_sw.c                  |  44 ++++++-
 tools/testing/selftests/net/tls.c | 197 ++++++++++++++++++++++++++++++
 7 files changed, 293 insertions(+), 12 deletions(-)

diff --git a/Documentation/networking/tls.rst b/Documentation/networking/tls.rst
index 980c442d7161..ef1a3bacb72f 100644
--- a/Documentation/networking/tls.rst
+++ b/Documentation/networking/tls.rst
@@ -228,6 +228,25 @@ The number of successful and failed key updates is tracked in the
 ``TlsRxRekeyError`` statistics. The ``TlsRxRekeyReceived`` statistic
 counts KeyUpdate handshake messages that have been received.
 
+Record number exhaustion
+------------------------
+
+A record number must not wrap under the same key. When it would, the
+connection is aborted with ``EBADMSG``. On transmit, the record that
+uses the last 64-bit record number is not sent, and the send that
+completes it doesn't count its data as sent. On receive, that record is
+still delivered, but no record after it is. Either way, no further
+record data is sent, not even the rest of a partially sent record.
+Unlike other socket errors, this one is not cleared when it is reported,
+by ``SO_ERROR`` or otherwise: every later send, and every receive that
+needs another record, fails with ``EBADMSG``, and a new key does not
+change that. ``poll()`` reports ``EPOLLERR``, and ``EPOLLIN`` only while
+data that was already decrypted remains; that data can still be read.
+
+A TLS 1.3 KeyUpdate may be the last record received under a key. In
+that case receive is paused as for any other KeyUpdate, and continues
+once the new key is provided.
+
 Integrating in to userspace TLS library
 ---------------------------------------
 
diff --git a/include/net/tls.h b/include/net/tls.h
index e57bef58851e..c945f697fc91 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -251,6 +251,7 @@ struct tls_context {
 
 	bool splicing_pages;
 	bool pending_open_record_frags;
+	int final_err; /* set by tls_err_abort_final(), never cleared */
 
 	struct mutex tx_lock; /* protects partially_sent_* fields and
 			       * per-type TX fields
diff --git a/net/tls/tls.h b/net/tls/tls.h
index 60a37bdaaa25..517dcc452c67 100644
--- a/net/tls/tls.h
+++ b/net/tls/tls.h
@@ -142,6 +142,7 @@ void update_sk_prot(struct sock *sk, struct tls_context *ctx);
 
 int wait_on_pending_writer(struct sock *sk, long *timeo);
 void tls_err_abort(struct sock *sk, int err);
+void tls_err_abort_final(struct sock *sk, int err);
 void tls_strp_abort_strp(struct tls_strparser *strp, int err);
 
 int init_prot_info(struct tls_prot_info *prot,
@@ -307,17 +308,30 @@ static inline void tls_bigint_subtract(unsigned char *seq, int  n)
 	*p = cpu_to_be64(rcd_sn - n);
 }
 
-static inline void
-tls_advance_record_sn(struct sock *sk, struct tls_prot_info *prot,
-		      struct cipher_context *ctx)
+static inline bool
+__tls_advance_record_sn(struct tls_prot_info *prot, struct cipher_context *ctx)
 {
-	if (tls_bigint_increment(ctx->rec_seq, prot->rec_seq_size))
-		tls_err_abort(sk, -EBADMSG);
+	bool wrapped = tls_bigint_increment(ctx->rec_seq, prot->rec_seq_size);
 
 	if (prot->version != TLS_1_3_VERSION &&
 	    prot->cipher_type != TLS_CIPHER_CHACHA20_POLY1305)
 		tls_bigint_increment(ctx->iv + prot->salt_size,
 				     prot->iv_size);
+
+	return wrapped;
+}
+
+static inline void
+tls_advance_record_sn(struct sock *sk, struct tls_prot_info *prot,
+		      struct cipher_context *ctx)
+{
+	if (__tls_advance_record_sn(prot, ctx))
+		tls_err_abort_final(sk, -EBADMSG);
+}
+
+static inline int tls_final_err(const struct tls_context *ctx)
+{
+	return READ_ONCE(ctx->final_err);
 }
 
 static inline void
diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index 4cdfbb57ecff..5e95710e53fb 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -430,6 +430,7 @@ static int tls_push_data(struct sock *sk,
 	int tls_push_record_flags;
 	struct page_frag *pfrag;
 	size_t orig_size = size;
+	size_t rec_size = size;
 	u32 max_open_record_len;
 	bool more = false;
 	bool done = false;
@@ -444,6 +445,10 @@ static int tls_push_data(struct sock *sk,
 	if ((flags & (MSG_MORE | MSG_EOR)) == (MSG_MORE | MSG_EOR))
 		return -EINVAL;
 
+	rc = tls_final_err(tls_ctx);
+	if (unlikely(rc))
+		return rc;
+
 	if (unlikely(sk->sk_err))
 		return -sk->sk_err;
 
@@ -550,8 +555,13 @@ static int tls_push_data(struct sock *sk,
 					     ctx,
 					     record,
 					     tls_push_record_flags);
-			if (rc < 0)
+			if (rc < 0) {
+				/* the refused record isn't sent, don't count it */
+				if (tls_final_err(tls_ctx))
+					size = rec_size;
 				break;
+			}
+			rec_size = size;
 		}
 	} while (!done);
 
diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index b8d5a843f761..d5605df59334 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -190,7 +190,7 @@ int tls_push_sg(struct sock *sk,
 		bvec_set_page(&bvec, p, size, offset);
 		iov_iter_bvec(&msg.msg_iter, ITER_SOURCE, &bvec, 1, size);
 
-		ret = tcp_sendmsg_locked(sk, &msg, size);
+		ret = tls_final_err(ctx) ?: tcp_sendmsg_locked(sk, &msg, size);
 
 		if (ret != size) {
 			if (ret > 0) {
@@ -414,8 +414,12 @@ static __poll_t tls_sk_poll(struct file *file, struct socket *sock,
 	tls_ctx = tls_get_ctx(sk);
 	ctx = tls_sw_ctx_rx(tls_ctx);
 
+	/* the final abort outlives sk_err, only decrypted data is readable */
+	if (unlikely(tls_final_err(tls_ctx)))
+		mask |= EPOLLERR;
+
 	if ((skb_queue_empty_lockless(&ctx->rx_list) &&
-	     !tls_strp_msg_ready(ctx)) ||
+	     (!tls_strp_msg_ready(ctx) || tls_final_err(tls_ctx))) ||
 	    READ_ONCE(ctx->key_update_pending))
 		mask &= ~(EPOLLIN | EPOLLRDNORM);
 
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index b4535139438a..37ba09055220 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -78,6 +78,18 @@ noinline void tls_err_abort(struct sock *sk, int err)
 	sk_error_report(sk);
 }
 
+/* Like tls_err_abort(), but the error can't be cleared: SO_ERROR and
+ * sock_error() consume sk_err, final_err keeps failing reads and sends.
+ */
+void tls_err_abort_final(struct sock *sk, int err)
+{
+	struct tls_context *ctx = tls_get_ctx(sk);
+
+	if (!tls_final_err(ctx))
+		WRITE_ONCE(ctx->final_err, err);
+	tls_err_abort(sk, err);
+}
+
 static int __skb_nsg(struct sk_buff *skb, int offset, int len,
                      unsigned int recursion_level)
 {
@@ -458,7 +470,9 @@ int tls_tx_records(struct sock *sk, int flags)
 	}
 
 tx_err:
-	if (rc < 0 && rc != -EAGAIN && rc != -EINTR && rc != -ERESTARTSYS)
+	/* a final abort already reported its error */
+	if (rc < 0 && rc != -EAGAIN && rc != -EINTR && rc != -ERESTARTSYS &&
+	    !tls_final_err(tls_ctx))
 		tls_err_abort(sk, rc);
 
 	return rc;
@@ -628,6 +642,11 @@ static int tls_push_record(struct sock *sk, int flags,
 	int rc;
 	u32 i;
 
+	/* tls_push_sg() would refuse it, don't encrypt it */
+	rc = tls_final_err(tls_ctx);
+	if (unlikely(rc))
+		return rc;
+
 	if (!rec)
 		return 0;
 
@@ -802,6 +821,13 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
 	}
 
 	while (msg_data_left(msg)) {
+		int err = tls_final_err(tls_ctx);
+
+		if (unlikely(err)) {
+			ret = err;
+			goto send_end;
+		}
+
 		if (sk->sk_err) {
 			ret = -sk->sk_err;
 			goto send_end;
@@ -1106,6 +1132,11 @@ tls_rx_rec_wait(struct sock *sk, bool nonblock, bool released, bool has_copied)
 	if (unlikely(ctx->key_update_pending))
 		return -EKEYEXPIRED;
 
+	/* checked even if a record is ready, unlike sk_err below */
+	ret = tls_final_err(tls_ctx);
+	if (unlikely(ret))
+		return ret;
+
 	timeo = sock_rcvtimeo(sk, nonblock);
 
 	while (!tls_strp_msg_ready(ctx)) {
@@ -1582,9 +1613,14 @@ static int tls_rx_one_record(struct sock *sk, struct msghdr *msg,
 	rxm = strp_msg(darg->skb);
 	rxm->offset += prot->prepend_size;
 	rxm->full_len -= prot->overhead_size;
-	tls_advance_record_sn(sk, prot, &tls_ctx->rx);
 
-	return tls_check_pending_rekey(sk, tls_ctx, darg->skb);
+	err = tls_check_pending_rekey(sk, tls_ctx, darg->skb);
+	/* A KeyUpdate in the last record retires the key as usual */
+	if (__tls_advance_record_sn(prot, &tls_ctx->rx) &&
+	    !tls_sw_ctx_rx(tls_ctx)->key_update_pending)
+		tls_err_abort_final(sk, -EBADMSG);
+
+	return err;
 }
 
 int decrypt_skb(struct sock *sk, struct scatterlist *sgout)
@@ -2182,7 +2218,7 @@ bool tls_sw_sock_is_readable(struct sock *sk)
 	struct tls_context *tls_ctx = tls_get_ctx(sk);
 	struct tls_sw_context_rx *ctx = tls_sw_ctx_rx(tls_ctx);
 
-	return tls_strp_msg_ready(ctx) ||
+	return (tls_strp_msg_ready(ctx) && !tls_final_err(tls_ctx)) ||
 		!skb_queue_empty(&ctx->rx_list);
 }
 
diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index c4203401c4bf..e7dd77b4f3ff 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2421,6 +2421,203 @@ TEST_F(tls, rekey_poll_delay)
 	}
 }
 
+/* Record number exhaustion, TLS 1.3 only. The record number only enters
+ * the nonce there, so a TX key whose IV is XORed with N sends record
+ * number N at its own record number 0, and TX never has to wrap.
+ */
+FIXTURE(tls_recseq)
+{
+	int fd, cfd;
+	bool notls;
+};
+
+FIXTURE_SETUP(tls_recseq)
+{
+	ulp_sock_pair(_metadata, &self->fd, &self->cfd, &self->notls);
+}
+
+FIXTURE_TEARDOWN(tls_recseq)
+{
+	close(self->fd);
+	close(self->cfd);
+}
+
+static void tls_recseq_keys(struct tls_crypto_info_keys *tls,
+			    uint64_t rec_seq, uint64_t iv_xor)
+{
+	int i;
+
+	tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128, tls, 0);
+	for (i = 0; i < 8; i++) {
+		tls->aes128.rec_seq[i] = rec_seq >> (56 - 8 * i);
+		tls->aes128.iv[i] ^= iv_xor >> (56 - 8 * i);
+	}
+}
+
+/* RX starts at the second to last record number, TX sends it and the
+ * last one at its record numbers 0 and 1.
+ */
+static void tls_recseq_set_keys(struct __test_metadata *_metadata,
+				int fd, int cfd)
+{
+	struct tls_crypto_info_keys tls;
+
+	tls_recseq_keys(&tls, 0, UINT64_MAX - 1);
+	ASSERT_EQ(setsockopt(fd, SOL_TLS, TLS_TX, &tls, tls.len), 0);
+	tls_recseq_keys(&tls, UINT64_MAX - 1, 0);
+	ASSERT_EQ(setsockopt(cfd, SOL_TLS, TLS_RX, &tls, tls.len), 0);
+}
+
+/* Silent rekey to the same key, so TX sends the wrapped record number 0 */
+static void tls_recseq_tx_wrapped(struct __test_metadata *_metadata, int fd)
+{
+	struct tls_crypto_info_keys tls;
+
+	tls_recseq_keys(&tls, 0, 0);
+	ASSERT_EQ(setsockopt(fd, SOL_TLS, TLS_TX, &tls, tls.len), 0);
+}
+
+static int tls_so_error(struct __test_metadata *_metadata, int fd)
+{
+	socklen_t len = sizeof(int);
+	int err = -1;
+
+	EXPECT_EQ(getsockopt(fd, SOL_SOCKET, SO_ERROR, &err, &len), 0);
+	return err;
+}
+
+/* All three records are queued, only the first two may be received */
+TEST_F(tls_recseq, rx_wrap)
+{
+	struct pollfd pfd = { .events = POLLIN };
+	char const *test_str = "test_read";
+	int send_len = strlen(test_str) + 1;
+	char buf[3 * 10];
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	tls_recseq_set_keys(_metadata, self->fd, self->cfd);
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
+	tls_recseq_tx_wrapped(_metadata, self->fd);
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
+
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), 0), 2 * send_len);
+	EXPECT_EQ(memcmp(buf, test_str, send_len), 0);
+	EXPECT_EQ(memcmp(buf + send_len, test_str, send_len), 0);
+
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), 0), -1);
+	EXPECT_EQ(errno, EBADMSG);
+
+	/* reading SO_ERROR clears sk_err, the abort stays */
+	EXPECT_EQ(tls_so_error(_metadata, self->cfd), EBADMSG);
+	EXPECT_EQ(tls_so_error(_metadata, self->cfd), 0);
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT), -1);
+	EXPECT_EQ(errno, EBADMSG);
+
+	/* the parsed third record isn't readable */
+	pfd.fd = self->cfd;
+	EXPECT_EQ(poll(&pfd, 1, 0), 1);
+	EXPECT_EQ(pfd.revents, POLLERR);
+}
+
+TEST_F(tls_recseq, rx_wrap_splice)
+{
+	char const *test_str = "test_read";
+	int send_len = strlen(test_str) + 1;
+	char buf[10];
+	int p[2];
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	ASSERT_GE(pipe(p), 0);
+
+	tls_recseq_set_keys(_metadata, self->fd, self->cfd);
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
+	tls_recseq_tx_wrapped(_metadata, self->fd);
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
+
+	EXPECT_EQ(splice(self->cfd, NULL, p[1], NULL, send_len, 0), send_len);
+	EXPECT_EQ(splice(self->cfd, NULL, p[1], NULL, send_len, 0), send_len);
+	EXPECT_EQ(read(p[0], buf, send_len), send_len);
+	EXPECT_EQ(memcmp(buf, test_str, send_len), 0);
+	EXPECT_EQ(read(p[0], buf, send_len), send_len);
+	EXPECT_EQ(memcmp(buf, test_str, send_len), 0);
+
+	EXPECT_EQ(tls_so_error(_metadata, self->cfd), EBADMSG);
+	EXPECT_EQ(splice(self->cfd, NULL, p[1], NULL, send_len,
+			 SPLICE_F_NONBLOCK), -1);
+	EXPECT_EQ(errno, EBADMSG);
+
+	close(p[0]);
+	close(p[1]);
+}
+
+/* A KeyUpdate may use the last record number, then a new key takes over */
+TEST_F(tls_recseq, rx_keyupdate)
+{
+	struct tls_crypto_info_keys tls12_1;
+	char const *test_str = "test_read";
+	int send_len = strlen(test_str) + 1;
+	char buf[10];
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	tls_crypto_info_init(TLS_1_3_VERSION, TLS_CIPHER_AES_GCM_128,
+			     &tls12_1, 1);
+
+	tls_recseq_set_keys(_metadata, self->fd, self->cfd);
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
+	tls_send_keyupdate(_metadata, self->fd);
+	ASSERT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX, &tls12_1,
+			     tls12_1.len), 0);
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
+
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), 0), send_len);
+	EXPECT_EQ(memcmp(buf, test_str, send_len), 0);
+	tls_recv_keyupdate(_metadata, self->cfd, 0);
+
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT), -1);
+	EXPECT_EQ(errno, EKEYEXPIRED);
+	EXPECT_EQ(tls_so_error(_metadata, self->cfd), 0);
+
+	ASSERT_EQ(setsockopt(self->cfd, SOL_TLS, TLS_RX, &tls12_1,
+			     tls12_1.len), 0);
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), 0), send_len);
+	EXPECT_EQ(memcmp(buf, test_str, send_len), 0);
+}
+
+/* The record using the last record number is never sent */
+TEST_F(tls_recseq, tx_wrap)
+{
+	struct tls_crypto_info_keys tls;
+	char const *test_str = "test_read";
+	int send_len = strlen(test_str) + 1;
+	char buf[10];
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	tls_recseq_keys(&tls, UINT64_MAX, 0);
+	ASSERT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX, &tls, tls.len), 0);
+	ASSERT_EQ(setsockopt(self->cfd, SOL_TLS, TLS_RX, &tls, tls.len), 0);
+
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), -1);
+	EXPECT_EQ(errno, EBADMSG);
+
+	/* reading SO_ERROR clears sk_err, the abort stays */
+	EXPECT_EQ(tls_so_error(_metadata, self->fd), EBADMSG);
+	EXPECT_EQ(send(self->fd, test_str, send_len, 0), -1);
+	EXPECT_EQ(errno, EBADMSG);
+
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT), -1);
+	EXPECT_EQ(errno, EAGAIN);
+}
+
 struct raw_rec {
 	unsigned int plain_len;
 	unsigned char plain_data[100];
-- 
2.50.1


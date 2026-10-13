Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B4379C44
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 00:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791851268; cv=none; b=hpkrtr/IxhnQ0DQn/JQ8Q4Aq9/qrXdDopqbHpKUlZdVrl59XTZsz2U2T85S2i2Qmt+z4cLxQPCA4g9TfuOeJEhdPEabTRLD8TV5ZWoGUc6wCq3ZGBu8eIswFco74OdL+CKxvcMiifC6CjaY0ERNqt/TSwbFFeVWJKIrx8th3npc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791851268; c=relaxed/simple;
	bh=qn4BzWlSyl1lV6aXLg810BY1gHsy0tO4U3eIBblIpHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJD0PYkbRgJg1jVRJWAIzgmwQU0JHrS1CB2AmMkbP0HiwmtJnSaVhlMyF9fwfidQeWx0sW8QSntF4sLMI5ty9wBTlKtB7ZnDsYibSnrBjEHCOVZabG1NO1ojPh5r7SH2j6gFJJpgsKPU6q1DkBHAYHQd2gywITmgecHIRiRauZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=RJfufFFQ; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="RJfufFFQ"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6dd7070699eso1749833eaf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 17:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1791851263; x=1792456063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLl+K5JelDXLCvIb6zgluMIer9KZQcOKUZY2UeWHu8s=;
        b=RJfufFFQrrV3MExjACYXCN/6v21X+48tbUGRmUy5S7uE0HEFCAeoqypx1h+xzjSYKG
         5lenxuxvHK7sFRBT58cBqdkw7kT4hGtQZPfDMmq/uOnan6hHcUT5ljqgxANNgt2kNFf0
         x8BlLclXEXqJ2CCAHlq8qXrX2JlCwj8Ied9JmoOdeWcI9F8Dwcswal0ctdnQ0z9uJU1C
         6fdPlo9KGN8JLZvQ9rDL+ybbSKt0Q6eqhtmT7it0Bz5nEG8SW7YPnykomjd9foSVjlUl
         0SBknk+VdvN1UjcZpAKuPjUwza0e6lLQ/CvP5nui0+Q1ANPWC5bzs1JCmPmwOTMVt6OB
         qcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791851263; x=1792456063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLl+K5JelDXLCvIb6zgluMIer9KZQcOKUZY2UeWHu8s=;
        b=t0DAOBgJ/u0xiVP9EQYyWdjo6b3EvG3EspUNqoEyUa3/03vu0+LdvxfOOEA6IrV1Rz
         9spnakwBlrCVD3ZDRLNgCJWEE/GsPLQRokEY6fAqBrPUpb/9rTIRBpRTi/8COd974NZn
         7wHMhlznZUH+MNuQ5d23AtIuWg0ViWXhIJr3JcmvbnS0TxJS01y+RynNNFJHJkxlyeRZ
         9gjbJr8F4zikIUgBpH92lGFwir9g+WpPtkiWXvQBiVL9S3Zna4ADt7F9dSKubltwWQkW
         PKYRKsjTqa7EKIIw12ZWZqJjumf4OyZiSxQOso6J78vb9+Gd3uMISyF8Qld3HjNeTubh
         2gCQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2P9lfLsOeaUcwiay1ResfCENo69IUznVlXUH1c91NF9/2SUsG7GPxulU+DCLjsv3Ec7cr1uhV7jnKR8teYpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFB+2lWb+8iy6b/oRHVUCpWlvwPgO9tsJm7VwnPvDBkZzAtnVt
	2lD3zO5/kI7kRU4DtucmINoX8aEE6K8gkuvR3z3YJm1TrXFboG/kFJe8V2Pufn/yUEg=
X-Gm-Gg: AYBFou3FeVGs81Co3iJINfwRwZWpdkQtrdjW7fKo+AcmYl0hNAbv2b5JL70ENE0b2J2
	UQr5JC4IyQqQehkNncXhuXh3WTAX7QC/X6s4XuHEyL46j5whxe/Aci5dVqCwxiJ3pI3+PhuhhZS
	ho4ipI5tH/bZA6dWjWE4+hIdGnyNCo/mLZ0DPIsuQOgaI8CB3hlHgby5CIQKpN3aGyjohQKnJoI
	Jj9WYRHhkxPGtigOPOuJcf66oqmHZqrj3ioxRsDQW65N+ZPEhBUjc4GGX5x1WeAufCczvIEn8vG
	zF+cMQeSWHFYMJazn0ZGJHA6PJgpRoc+5FzHxO/UGgUjFKnB7oYSZAQstC5iNSvbDoh7ABSGbPY
	NZNjqMjQaup24IZHcddrkKzEiN0Oy4DyjzBM6YqSTxEnBhc3puDiUysF+2Q/vC0L4BE0fH0Wf2c
	pCh2LiKFCFXpXPHGK/Ozg9YIgakNqKBLwIc26eJkYIH3cDYCifDb/yqP1lS87S2Y6JnLz85ngyW
	asnufL0jiCczx6FY0y+z1nD4V26AiI21dyQ2DHW7O4sKlhAsCHoENJ7iYcDTNHtgz6CD4ochxBb
	wfWDm5w+eAbqQUAVQYUoUzieHmv74orAIfLBwM+pJbp12I9jEjEMTXNV4bTIV2RyPId4dmvLFbT
	05Ktv8nFV7mRYfClz9blG6rmiUbB2
X-Received: by 2002:a05:6820:4dc9:b0:6dd:4a4b:1843 with SMTP id 006d021491bc7-6ef0eec8926mr9177943eaf.14.1791851262963;
        Mon, 12 Oct 2026 17:27:42 -0700 (PDT)
Received: from dev-rjethwani.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-83038f82468sm11455402a34.11.2026.10.12.17.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 17:27:41 -0700 (PDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	John Fastabend <john.fastabend@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishikesh Jethwani <rjethwani@purestorage.com>
Subject: [PATCH net] tls: refuse RX records after record-number exhaustion
Date: Mon, 12 Oct 2026 18:27:01 -0600
Message-ID: <20261013002701.1957686-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A receive socket records sequence-number exhaustion only in sk_err.
After processing record UINT64_MAX, it advances the counter to zero and
reports EBADMSG, but SO_ERROR or sock_error() can clear that error. A
parser-ready record also bypasses the socket-error check in the record
wait. The receiver can then accept a record authenticated for sequence
zero under the same exhausted key.

Getting there needs an initial record number installed close to the
limit, since 2^64 records cannot be exchanged in practice, and a peer
that sends the wrapped record, which the Linux TX path refuses to do.

Mark the RX key exhausted when its record number wraps, and refuse to
wait for or decrypt another record under it, or to replace the key.
Plaintext that is already decrypted can still be read. RFC 8446 lets a
sender retire a key with a KeyUpdate as its last record, so in that
case leave sk_err alone, report the pending key update as usual and
let the new TLS_RX key clear the mark.

Add fixed AES-GCM wire vectors and TLS 1.2/1.3 selftests for queued
wrapped records, SO_ERROR clearing, splice, peek, partial reads, TLS
1.3 key replacement and a KeyUpdate in the last record. Every case
first verifies the penultimate record succeeds. The vectors avoid a
userspace crypto dependency and the TX path's refusal to generate the
maximum-number record.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Assisted-by: LLM
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 Documentation/networking/tls.rst  |  17 ++
 include/net/tls.h                 |   2 +
 net/tls/tls.h                     |  19 ++-
 net/tls/tls_main.c                |   9 ++
 net/tls/tls_sw.c                  |  19 ++-
 tools/testing/selftests/net/tls.c | 258 +++++++++++++++++++++++++++++-
 6 files changed, 315 insertions(+), 9 deletions(-)

diff --git a/Documentation/networking/tls.rst b/Documentation/networking/tls.rst
index 980c442d7161..4b3c7a5a0780 100644
--- a/Documentation/networking/tls.rst
+++ b/Documentation/networking/tls.rst
@@ -202,6 +202,23 @@ received without a cmsg buffer set.
 
 recv will never return data from mixed types of TLS records.
 
+Receive record-number exhaustion
+--------------------------------
+
+The receive record number must not wrap under the same key. Once the
+record with the last 64-bit record number has been received, no further
+record is decrypted under that key: a receive that needs another record
+fails with ``EBADMSG``, even after ``SO_ERROR`` has been read. Plaintext
+that was already decrypted, such as the rest of a partially read or
+peeked final record, can still be read. This applies to both software
+and hardware receive offload.
+
+Unless the final record is a TLS 1.3 KeyUpdate, the condition is
+terminal: the socket error is also set to ``EBADMSG``, and a ``TLS_RX``
+key replacement fails with ``EBADMSG``. A KeyUpdate in the final record
+retires the key the usual way: receives fail with ``EKEYEXPIRED`` until a
+new ``TLS_RX`` key is installed, after which receiving continues.
+
 TLS 1.3 Key Updates
 -------------------
 
diff --git a/include/net/tls.h b/include/net/tls.h
index e57bef58851e..73f2d0f24e54 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -139,6 +139,8 @@ struct tls_sw_context_rx {
 	u8 zc_capable:1;
 	u8 reader_contended:1;
 	bool key_update_pending;
+	/* record numbers of this key are used up; cleared by a KeyUpdate */
+	bool rec_seq_exhausted;
 
 	struct tls_strparser strp;
 
diff --git a/net/tls/tls.h b/net/tls/tls.h
index 60a37bdaaa25..3b2af529d977 100644
--- a/net/tls/tls.h
+++ b/net/tls/tls.h
@@ -307,17 +307,26 @@ static inline void tls_bigint_subtract(unsigned char *seq, int  n)
 	*p = cpu_to_be64(rcd_sn - n);
 }
 
-static inline void
-tls_advance_record_sn(struct sock *sk, struct tls_prot_info *prot,
-		      struct cipher_context *ctx)
+/* Returns true if the record number wrapped */
+static inline bool
+__tls_advance_record_sn(struct tls_prot_info *prot, struct cipher_context *ctx)
 {
-	if (tls_bigint_increment(ctx->rec_seq, prot->rec_seq_size))
-		tls_err_abort(sk, -EBADMSG);
+	bool overflow = tls_bigint_increment(ctx->rec_seq, prot->rec_seq_size);
 
 	if (prot->version != TLS_1_3_VERSION &&
 	    prot->cipher_type != TLS_CIPHER_CHACHA20_POLY1305)
 		tls_bigint_increment(ctx->iv + prot->salt_size,
 				     prot->iv_size);
+
+	return overflow;
+}
+
+static inline void
+tls_advance_record_sn(struct sock *sk, struct tls_prot_info *prot,
+		      struct cipher_context *ctx)
+{
+	if (__tls_advance_record_sn(prot, ctx))
+		tls_err_abort(sk, -EBADMSG);
 }
 
 static inline void
diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index fbb274287aa5..63bef0153182 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -730,6 +730,15 @@ static int do_tls_setsockopt_conf(struct sock *sk, sockptr_t optval,
 			conf = TLS_SW;
 		}
 	} else {
+		struct tls_sw_context_rx *rx_ctx = tls_sw_ctx_rx(ctx);
+
+		/* Only a KeyUpdate may follow the last record number */
+		if (update && rx_ctx->rec_seq_exhausted &&
+		    !rx_ctx->key_update_pending) {
+			rc = -EBADMSG;
+			goto err_crypto_info;
+		}
+
 		rc = tls_set_device_offload_rx(sk, ctx);
 		conf = TLS_HW;
 		if (!rc) {
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index d1ad31986cf2..cd1590e1f20f 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1104,6 +1104,10 @@ tls_rx_rec_wait(struct sock *sk, bool nonblock, bool released, bool has_copied)
 	if (unlikely(ctx->key_update_pending))
 		return -EKEYEXPIRED;
 
+	/* no record can follow the last one under this key */
+	if (unlikely(ctx->rec_seq_exhausted))
+		return -EBADMSG;
+
 	timeo = sock_rcvtimeo(sk, nonblock);
 
 	while (!tls_strp_msg_ready(ctx)) {
@@ -1566,6 +1570,7 @@ static int tls_rx_one_record(struct sock *sk, struct msghdr *msg,
 {
 	struct tls_context *tls_ctx = tls_get_ctx(sk);
 	struct tls_prot_info *prot = &tls_ctx->prot_info;
+	struct tls_sw_context_rx *ctx = tls_sw_ctx_rx(tls_ctx);
 	struct strp_msg *rxm;
 	int err;
 
@@ -1580,9 +1585,18 @@ static int tls_rx_one_record(struct sock *sk, struct msghdr *msg,
 	rxm = strp_msg(darg->skb);
 	rxm->offset += prot->prepend_size;
 	rxm->full_len -= prot->overhead_size;
-	tls_advance_record_sn(sk, prot, &tls_ctx->rx);
+	err = tls_check_pending_rekey(sk, tls_ctx, darg->skb);
+	if (__tls_advance_record_sn(prot, &tls_ctx->rx)) {
+		/* sk_err alone can't stop the next record, SO_ERROR clears
+		 * it. A KeyUpdate in the last record properly retires the
+		 * key, so don't treat that one as an error.
+		 */
+		ctx->rec_seq_exhausted = true;
+		if (!ctx->key_update_pending)
+			tls_err_abort(sk, -EBADMSG);
+	}
 
-	return tls_check_pending_rekey(sk, tls_ctx, darg->skb);
+	return err;
 }
 
 int decrypt_skb(struct sock *sk, struct scatterlist *sgout)
@@ -2518,6 +2532,7 @@ static void tls_finish_key_update(struct sock *sk, struct tls_context *tls_ctx)
 	struct tls_sw_context_rx *ctx = tls_ctx->priv_ctx_rx;
 
 	WRITE_ONCE(ctx->key_update_pending, false);
+	ctx->rec_seq_exhausted = false;
 	/* wake-up pre-existing poll() */
 	ctx->saved_data_ready(sk);
 }
diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 9d3cd4fff062..f69c3a736b94 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -26,6 +26,7 @@
 #define TLS_PAYLOAD_MAX_LEN 16384
 #define TLS_HDR_LEN 5
 #define SOL_TLS 282
+#define TLS_RECORD_TYPE_HANDSHAKE      0x16
 
 static int fips_enabled;
 
@@ -300,6 +301,261 @@ TEST_F(tls_basic, recseq_wrap)
 	EXPECT_EQ(errno, EBADMSG);
 }
 
+/* Fixed AES-GCM records avoid a dependency on a userspace crypto library.
+ * Each authenticates "test", with zero key and static IV, at sequence
+ * numbers UINT64_MAX - 1, UINT64_MAX and zero. TLS 1.2 uses the record
+ * number as its explicit IV; TLS 1.3 appends inner content type 23.
+ * The last record must never be accepted after counter exhaustion.
+ * tls_rx_recseq_ku_record is a TLS 1.3 KeyUpdate at UINT64_MAX.
+ */
+static const char tls_rx_recseq_ku_record[] =
+	"\x17\x03\x03\x00\x16\x49\xd1\xc7\x79\x45\x74\xd7"
+	"\x12\xe8\xbf\xe4\xaa\x70\x17\x58\x60\x66\xa0\xf9"
+	"\x5b\xac\x6a";
+
+FIXTURE(tls_rx_recseq)
+{
+	int fd, cfd;
+	bool notls;
+};
+
+FIXTURE_VARIANT(tls_rx_recseq)
+{
+	uint16_t tls_version;
+	size_t record_len;
+	const char *records[3];
+};
+
+FIXTURE_VARIANT_ADD(tls_rx_recseq, 12_aes_gcm)
+{
+	.tls_version = TLS_1_2_VERSION,
+	.record_len = 33,
+	.records = {
+		"\x17\x03\x03\x00\x1c\xff\xff\xff\xff\xff\xff\xff"
+		"\xfe\x62\x3c\xf3\xee\x4d\x18\x45\xf7\x62\x62\x2c"
+		"\x01\x9a\xfc\x47\x3d\x82\xb0\x9f\x7f",
+		"\x17\x03\x03\x00\x1c\xff\xff\xff\xff\xff\xff\xff"
+		"\xff\x25\xb4\xb4\x0c\xf7\x4c\xef\x86\xa2\xe1\x2d"
+		"\xa6\x31\xb5\x64\xf6\x21\x81\x7f\xad",
+		"\x17\x03\x03\x00\x1c\x00\x00\x00\x00\x00\x00\x00"
+		"\x00\x77\xed\xa9\xba\xbb\x29\xb7\x1a\x44\x35\x46"
+		"\x0f\x55\x94\x07\xdd\xc3\xe4\x91\x80",
+	},
+};
+
+FIXTURE_VARIANT_ADD(tls_rx_recseq, 13_aes_gcm)
+{
+	.tls_version = TLS_1_3_VERSION,
+	.record_len = 26,
+	.records = {
+		"\x17\x03\x03\x00\x15\x62\x3c\xf3\xee\xd7\x87\xd1"
+		"\x21\x46\x96\xc2\xfc\x59\x1c\x4c\x15\xec\x57\x6d"
+		"\xc8\x0a",
+		"\x17\x03\x03\x00\x15\x25\xb4\xb4\x0c\x52\x2e\x4d"
+		"\xcd\xf4\xec\xc2\x7e\xb8\x85\xed\xb7\x79\xf8\x39"
+		"\x68\xd6",
+		"\x17\x03\x03\x00\x15\x77\xed\xa9\xba\x77\x59\x33"
+		"\x88\x89\x13\x8d\x3c\xb4\x2e\xe0\x64\x72\xa5\x17"
+		"\x71\x45",
+	},
+};
+
+FIXTURE_SETUP(tls_rx_recseq)
+{
+	struct timeval timeout = { .tv_sec = 2 };
+	struct tls_crypto_info_keys key;
+	socklen_t len;
+	char buf[4];
+	int err;
+
+	ulp_sock_pair(_metadata, &self->fd, &self->cfd, &self->notls);
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	ASSERT_EQ(setsockopt(self->cfd, SOL_SOCKET, SO_RCVTIMEO,
+			     &timeout, sizeof(timeout)), 0);
+	tls_crypto_info_init(variant->tls_version, TLS_CIPHER_AES_GCM_128,
+			     &key, 0);
+	memset(key.aes128.rec_seq, 0xff, sizeof(key.aes128.rec_seq));
+	key.aes128.rec_seq[sizeof(key.aes128.rec_seq) - 1]--;
+	ASSERT_EQ(setsockopt(self->cfd, SOL_TLS, TLS_RX, &key, key.len), 0);
+
+	/* The penultimate record must still advance normally. */
+	ASSERT_EQ(send(self->fd, variant->records[0], variant->record_len, 0),
+		  variant->record_len);
+	ASSERT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_WAITALL), sizeof(buf));
+	ASSERT_EQ(memcmp(buf, "test", sizeof(buf)), 0);
+	len = sizeof(err);
+	ASSERT_EQ(getsockopt(self->cfd, SOL_SOCKET, SO_ERROR, &err, &len), 0);
+	ASSERT_EQ(err, 0);
+};
+
+FIXTURE_TEARDOWN(tls_rx_recseq)
+{
+	close(self->fd);
+	close(self->cfd);
+};
+
+static void tls_clear_rx_error(struct __test_metadata *_metadata, int fd)
+{
+	socklen_t len;
+	int err;
+
+	len = sizeof(err);
+	ASSERT_EQ(getsockopt(fd, SOL_SOCKET, SO_ERROR, &err, &len), 0);
+	ASSERT_EQ(err, EBADMSG);
+	len = sizeof(err);
+	ASSERT_EQ(getsockopt(fd, SOL_SOCKET, SO_ERROR, &err, &len), 0);
+	ASSERT_EQ(err, 0);
+}
+
+TEST_F(tls_rx_recseq, queued)
+{
+	char records[80], buf[8];
+
+	memcpy(records, variant->records[1], variant->record_len);
+	memcpy(records + variant->record_len, variant->records[2],
+	       variant->record_len);
+	ASSERT_EQ(send(self->fd, records, 2 * variant->record_len, 0),
+		  2 * variant->record_len);
+
+	/* Both records are queued, but only the final valid one can pass. */
+	ASSERT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_WAITALL), 4);
+	EXPECT_EQ(memcmp(buf, "test", 4), 0);
+	tls_clear_rx_error(_metadata, self->cfd);
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT), -1);
+	EXPECT_EQ(errno, EBADMSG);
+}
+
+TEST_F(tls_rx_recseq, so_error)
+{
+	char buf[4];
+
+	ASSERT_EQ(send(self->fd, variant->records[1], variant->record_len, 0),
+		  variant->record_len);
+	ASSERT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_WAITALL), sizeof(buf));
+	tls_clear_rx_error(_metadata, self->cfd);
+
+	ASSERT_EQ(send(self->fd, variant->records[2], variant->record_len, 0),
+		  variant->record_len);
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), 0), -1);
+	EXPECT_EQ(errno, EBADMSG);
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT), -1);
+	EXPECT_EQ(errno, EBADMSG);
+}
+
+TEST_F(tls_rx_recseq, splice)
+{
+	char buf[4];
+	int p[2];
+
+	ASSERT_EQ(send(self->fd, variant->records[1], variant->record_len, 0),
+		  variant->record_len);
+	ASSERT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_WAITALL), sizeof(buf));
+	tls_clear_rx_error(_metadata, self->cfd);
+
+	ASSERT_EQ(send(self->fd, variant->records[2], variant->record_len, 0),
+		  variant->record_len);
+	ASSERT_EQ(pipe(p), 0);
+	EXPECT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf), 0), -1);
+	EXPECT_EQ(errno, EBADMSG);
+	close(p[0]);
+	close(p[1]);
+}
+
+TEST_F(tls_rx_recseq, peek)
+{
+	char buf[4];
+
+	ASSERT_EQ(send(self->fd, variant->records[1], variant->record_len, 0),
+		  variant->record_len);
+	ASSERT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_PEEK), sizeof(buf));
+	tls_clear_rx_error(_metadata, self->cfd);
+
+	/* Plaintext decrypted before exhaustion can still be read. */
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT), sizeof(buf));
+	EXPECT_EQ(memcmp(buf, "test", sizeof(buf)), 0);
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT), -1);
+	EXPECT_EQ(errno, EBADMSG);
+}
+
+TEST_F(tls_rx_recseq, partial_read)
+{
+	char buf[4];
+
+	ASSERT_EQ(send(self->fd, variant->records[1], variant->record_len, 0),
+		  variant->record_len);
+	ASSERT_EQ(recv(self->cfd, buf, 1, 0), 1);
+	tls_clear_rx_error(_metadata, self->cfd);
+
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT), 3);
+	EXPECT_EQ(memcmp(buf, "est", 3), 0);
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT), -1);
+	EXPECT_EQ(errno, EBADMSG);
+}
+
+/* Only a KeyUpdate may introduce a key after the last record number. */
+TEST_F(tls_rx_recseq, rekey)
+{
+	struct tls_crypto_info_keys key;
+	struct tls12_crypto_info_aes_gcm_128 before, after;
+	socklen_t len;
+	char buf[4];
+
+	if (variant->tls_version != TLS_1_3_VERSION)
+		SKIP(return, "rekey requires TLS 1.3");
+
+	ASSERT_EQ(send(self->fd, variant->records[1], variant->record_len, 0),
+		  variant->record_len);
+	ASSERT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_WAITALL), sizeof(buf));
+	tls_clear_rx_error(_metadata, self->cfd);
+
+	len = sizeof(before);
+	ASSERT_EQ(getsockopt(self->cfd, SOL_TLS, TLS_RX, &before, &len), 0);
+	tls_crypto_info_init(variant->tls_version, TLS_CIPHER_AES_GCM_128,
+			     &key, 1);
+	EXPECT_EQ(setsockopt(self->cfd, SOL_TLS, TLS_RX, &key, key.len), -1);
+	EXPECT_EQ(errno, EBADMSG);
+	len = sizeof(after);
+	ASSERT_EQ(getsockopt(self->cfd, SOL_TLS, TLS_RX, &after, &len), 0);
+	EXPECT_EQ(memcmp(&before, &after, sizeof(before)), 0);
+}
+
+/* A KeyUpdate in the last record retires the key without an error. */
+TEST_F(tls_rx_recseq, keyupdate)
+{
+	size_t len = sizeof(tls_rx_recseq_ku_record) - 1;
+	struct tls_crypto_info_keys key;
+	socklen_t optlen;
+	char buf[16];
+	int err;
+
+	if (variant->tls_version != TLS_1_3_VERSION)
+		SKIP(return, "KeyUpdate requires TLS 1.3");
+
+	ASSERT_EQ(send(self->fd, tls_rx_recseq_ku_record, len, 0), len);
+	EXPECT_EQ(tls_recv_cmsg(_metadata, self->cfd, TLS_RECORD_TYPE_HANDSHAKE,
+				buf, sizeof(buf), 0), 5);
+	EXPECT_EQ(memcmp(buf, "\x18\x00\x00\x01\x00", 5), 0);
+	EXPECT_EQ(recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT), -1);
+	EXPECT_EQ(errno, EKEYEXPIRED);
+	optlen = sizeof(err);
+	ASSERT_EQ(getsockopt(self->cfd, SOL_SOCKET, SO_ERROR, &err, &optlen), 0);
+	EXPECT_EQ(err, 0);
+
+	/* The new key resets the record number, so receiving continues. */
+	tls_crypto_info_init(variant->tls_version, TLS_CIPHER_AES_GCM_128,
+			     &key, 1);
+	ASSERT_EQ(setsockopt(self->cfd, SOL_TLS, TLS_RX, &key, key.len), 0);
+	ASSERT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX, &key, key.len), 0);
+	ASSERT_EQ(send(self->fd, "test", 4, 0), 4);
+	ASSERT_EQ(recv(self->cfd, buf, 4, MSG_WAITALL), 4);
+	EXPECT_EQ(memcmp(buf, "test", 4), 0);
+	optlen = sizeof(err);
+	ASSERT_EQ(getsockopt(self->cfd, SOL_SOCKET, SO_ERROR, &err, &optlen), 0);
+	EXPECT_EQ(err, 0);
+}
+
 FIXTURE(tls)
 {
 	int fd, cfd;
@@ -1839,8 +2095,6 @@ TEST_F(tls, recv_efault)
 		EXPECT_EQ(memcmp(rec2, recv_mem + 9, ret - 9), 0);
 }
 
-#define TLS_RECORD_TYPE_HANDSHAKE      0x16
-
 TEST_F(tls_basic, recvmsg_nopad_retry_iov)
 {
 	char payload[32];

base-commit: 8e2fbe0e75d38690d551456658194c632933cb57
-- 
2.50.1


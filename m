Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423328;
	b=WNSb9OO2rWm9r0T9RJXXfAZlBfofAp0Y03eJR7cq+Mc9RdLthUY63wcZCRH7ToERIWpy
	 9Lp8kwJnb35OTas/gAP8ryhVWlnOUCCXRwnJrDm/sNikz2551K8kkRa9hoGlr7CWlcP9y
	 /1RuMmuxudtovy5YNXOWqN5Esu569RbE2V860q0NjctworcSC70aNfKobEKqp5+52nmbF
	 5sIy6Tz9z5Va7CQ0V7MbxLbBpUqzibwXmQPpPWIBjboY4WHeD8X2D/3OUd/sriFICkh0e
	 gQKKhWT1sMY6rIWIiL85xJeeWDgxboH6yS++4AyhlFl3s43F8ny81ogjTf1WeXXN9BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423328;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ci4cqnZZ64d+2U3XURPPoF/V/1lZMvGbT2QamEimuCY=;
	b=TCtt93pIUhVZjqsjEkcS5hKL/1Utmr5838X6QYE0evqSGf82EtC0gr3zGGPOPEvZ7cYV
	 47bpCg6jeUxmeytwe0GuIkt2Fab5tYBZ30WpBBoAoD9AwOm38xFKZozSn6kmofZ9yWU27
	 wCI56uCAyF+4TR1Gqjwa3NoSL0nDVo6UEyTeEhYCsaO6Th+KFLI9mU3+UhpkCvMmAuEf+
	 qyEjMf397owBThBl/VfBYH7ldiOS9G3sUMSVzJpg2jqbeIeR61JbS3NdcR5zAbAOTuGfw
	 nW5nDMzE/josF/Z9l9+DGSJ5KWXpmqnJz9Os39QwLdEl6qUk8AI1DqNrkTPi2wsyivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=akDdb6K7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEF9606A335;
	Wed, 11 Nov 2026 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=akDdb6K7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F9E1F00A07;
	Wed, 11 Nov 2026 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794423328;
	bh=Ci4cqnZZ64d+2U3XURPPoF/V/1lZMvGbT2QamEimuCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=akDdb6K7pMn8tt3whg1v/OzfHFT22Xor7RVmknokKvRPjO1Ix/xapAw+y6L80Klqr
	 J1hrm7N7/97twF02vwPiLY1KaMMUiLS9K91mZ5yGIDmXH8i2TOlimKnl8ZAnmdBFcu
	 vT3yBKMYcOdApG9ZXSasmuarXwgR5TA1Es2UKyLBDdI17KErOAZ9zWrRuiHKA/YaB9
	 uimOIGEsmdWTOqvvWWnIs6spZyM5toTZop1zdIRY0oGMEStEKUQWH7QWp1mikMqhj6
	 yR/ugkBrMMxLRW1Vs5nbTmZXjPfJ/b+mmWqJp6DgE8O+a0YPqSMPEcNvrkh73KeupK
	 1gpREveO25lMg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sd@queasysnail.net,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	cel@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net v2 2/5] tls: Consume empty data records in tls_sw_splice_read()
Date: Wed, 11 Nov 2026 10:55:19 -0800
Message-ID: <20261111185522.2859004-3-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111185522.2859004-1-kuba@kernel.org>
References: <20261111185522.2859004-1-kuba@kernel.org>
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

From: Chuck Lever <cel@kernel.org>

A zero-length application_data record decrypts to full_len == 0,
so tls_sw_splice_read() splices zero bytes and returns zero. A zero
return from a splice read means EOF, and the caller tears down a
connection that is still live.

Consume the record and fetch the next one, as tls_sw_read_sock()
does. The cap on consecutive empty records bounds the loop.

When an empty record precedes a close_notify, splice(2) now returns
-EINVAL from the control-record test instead of a false EOF. A
splice that reaches an alert record already reports -EINVAL.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Reported-by: Sabrina Dubroca <sd@queasysnail.net>
Closes: https://lore.kernel.org/netdev/akaoXcfamBp8_mYe@krikkit/
Signed-off-by: Chuck Lever <cel@kernel.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2: no change
v1: https://lore.kernel.org/20261109175836.1246840-3-kuba@kernel.org
---
 net/tls/tls_sw.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 65e578c8c612..0bab7175c9d9 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2044,32 +2044,40 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	if (err)
 		goto splice_read_end;
 
-	if (!skb_queue_empty(&ctx->rx_list)) {
-		skb = __skb_dequeue(&ctx->rx_list);
-	} else {
-		struct tls_decrypt_arg darg;
+	for (;;) {
+		if (!skb_queue_empty(&ctx->rx_list)) {
+			skb = __skb_dequeue(&ctx->rx_list);
+		} else {
+			struct tls_decrypt_arg darg;
 
-		err = tls_rx_rec_wait(sk, nonblock, true, false);
-		if (err <= 0)
-			goto splice_read_end;
+			err = tls_rx_rec_wait(sk, nonblock, true, false);
+			if (err <= 0)
+				goto splice_read_end;
 
-		memset(&darg.inargs, 0, sizeof(darg.inargs));
+			memset(&darg.inargs, 0, sizeof(darg.inargs));
 
-		err = tls_rx_one_record(sk, NULL, &darg);
-		if (err < 0)
-			goto splice_read_end;
+			err = tls_rx_one_record(sk, NULL, &darg);
+			if (err < 0)
+				goto splice_read_end;
 
-		tls_rx_rec_done(ctx);
-		skb = darg.skb;
-	}
+			tls_rx_rec_done(ctx);
+			skb = darg.skb;
+		}
 
-	rxm = strp_msg(skb);
-	tlm = tls_msg(skb);
+		rxm = strp_msg(skb);
+		tlm = tls_msg(skb);
 
-	/* splice does not support reading control messages */
-	if (tlm->control != TLS_RECORD_TYPE_DATA) {
-		err = -EINVAL;
-		goto splice_requeue;
+		/* splice does not support reading control messages */
+		if (tlm->control != TLS_RECORD_TYPE_DATA) {
+			err = -EINVAL;
+			goto splice_requeue;
+		}
+
+		/* Splicing zero bytes would read as EOF */
+		if (rxm->full_len)
+			break;
+
+		consume_skb(skb);
 	}
 
 	chunk = min_t(unsigned int, rxm->full_len, len);
-- 
2.56.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A42135C5;
	Mon, 27 Jul 2026 00:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112431; cv=none; b=UfZViB86mink1WkTspzx2v0EByXcmzqwnbzQa/t6xBVkx5LyKTWGsdkYF0XdkwnJFYn/dxeEByspAreGwAvndRKHdV/5raI+smQHNjLhukQ/sfsJq5x8zPfTh99L1hknZ4knXwBvcO8DFtyS2E5hakM2gQy98Whkfsww4hkH5oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112431; c=relaxed/simple;
	bh=jrYaPjGihVitXjCdnMRaVUkXjUeGBlmOzsigsWuitpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcvxrFgJy///qQMUk3XJqxkg8q0pZB4aeHLUeAzMQphNQbM9TBYDqAaPzPzSdxtOCSco2QN/uu2oXLkWgtGVsiQWs0KyWIduoSBFYSECSKHLkqZ5gfbFYkY4vbeg5NDqu2SOG//QzCQf6Oz+gpuLHC++DmKH6BSofd3dbIBtdOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAgx+dQr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAgx+dQr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8696B1F00A3F;
	Mon, 27 Jul 2026 00:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112429;
	bh=i6cHuJmkP3oOteoPuZx2jAlGqTrbBq7wb1D+ar5ygw0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QAgx+dQrHYkngsLZwLkqP39y28HUDbfe80JxM+erofsw0UEZITqNSDcbBCeiU62XN
	 DZyiqHEnRE9nSVf1+Fv9IiBgwZYlOYwU4e77Ih9EVLEBRuhG1zSYQtTX7uLr5lW10a
	 7xqwNVsja4hbesY+8ul9KCAqv/9DZ8j0ef7SHyL3/NAplXOd253s/p9Uh46Hv+xMfn
	 PHxldsLGmkHItda55gDslYb+Adu0UFRUsueOHtadaG00ybHn+fb2tMok0amf17aZrL
	 YEnN4uS+B1scSxTSyFX6Hwwy9D/eT5M3UovS2mWV+g13bzEkCUVDxq6n8Us8Q77e6H
	 UD44Fb8DmFKMA==
From: Chuck Lever <cel@kernel.org>
Date: Sun, 26 Jul 2026 20:33:30 -0400
Subject: [PATCH net 2/9] net/tls: Consume empty data records in
 tls_sw_splice_read()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-tls-follow-on-v1-2-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Chuck Lever <cel@kernel.org>, Dave Watson <davejwatson@fb.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=4658; i=cel@kernel.org;
 h=from:subject:message-id; bh=jrYaPjGihVitXjCdnMRaVUkXjUeGBlmOzsigsWuitpU=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqZqdpWpV5GssARsCVhaOgg7NkRrvL3mV/OsiJX
 grcanhCOZyJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCamanaQAKCRAzarMzb2Z/
 l/LXEACZDg3IOwxWw0ZdVGKovNPY/SlahKL3wrqKM6LKg/Ym8V9BsBhkqYvh/6/u23K6NSRrExl
 AHeByeEy2jRsk4XevnSbmN12kJ7kmKubk8NaHFgDzgZf8LRMauYx/3oCjMVe/t4oz+YRRb99X9J
 MMz4gINHweNlEIII7vCnXnkkbIm1jAD+J0gd6LxoIDhqvjR5LUVYFxsQ/iNCfQNt+tTlfnz7MQE
 oSEpvLA6yNzs7q7TMJVLsCiluG4FfxpLtLGjkyUF/kAA9tURE/sVBHTd//0qOWWzW5XBZ0Ta+Kp
 zhY2yA6u7rPp8mrBHS0XwmEkDeDLydvwsch03z/C34QzOWXS4ComCne24bG5Uq4fzfZnEDX4QD9
 5mYUuJH3tpQs5COewZABzYJruaIcv6skouLhejLSYLcPLEgcuo7orrNJCx0fBKzjs22DDbLpnVo
 41sMzk8RYGK74qPmlcHjtJ1EgiXe5HZrDBYlkI7sOJP/kZ5XpvQ+U1Ex2670LKDAgpIU9zs0p0f
 QCQiYvY6zw+3To7/wQCSlTVl/XYOafq+Z2NMbSbnsX71HjRJmznHoZtkKJWi+b5vec3I12YgxlU
 Y2qdQpx/MfopWfrPBOXtz/YzKd/Ce5c9l1OagtaM1OJTw8tQJYU53z+rxE4fX5Jxos+O67F/R7Z
 A+jebH4hToYL9uw==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

A peer may send a zero-length application_data record. After
decryption such a record has full_len == 0, so tls_sw_splice_read()
splices zero bytes and returns zero. A zero return from a splice
read signals EOF, and the caller tears down a connection that is
still live.

Consume such a record and fetch the next one, as tls_sw_recvmsg()
already does. A peer that streams empty records can hold the
splicing task in that loop, so test for a pending signal where the
record is consumed.

Where an empty record precedes a close_notify, splice(2) now returns
-EINVAL from the control-record test rather than the zero it
returned before. That zero was the false EOF this patch removes, and
a splice that reaches an alert record has always reported -EINVAL.

The open-coded test in tls_sw_read_sock() becomes
tls_rx_empty_data_rec(); the tls_sw_recvmsg() paths reuse it and
tls_rx_intr_errno() in the patches that follow.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index d45c945a3d1d..44ae0fad780d 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1788,6 +1788,24 @@ static void tls_rx_reader_unlock(struct sock *sk, struct tls_sw_context_rx *ctx)
 	release_sock(sk);
 }
 
+/* TLS 1.2 and TLS 1.3 both permit a zero-length application_data
+ * record as a traffic-analysis countermeasure (RFC 5246, Section
+ * 6.2.1; RFC 8446, Section 5.1).
+ */
+static bool tls_rx_empty_data_rec(int len, unsigned char control)
+{
+	return !len && control == TLS_RECORD_TYPE_DATA;
+}
+
+/* sock_intr_errno() maps the zero timeo of a reader that cannot wait
+ * to -EINTR, but such a reader has no blocking to interrupt. The rest
+ * of the receive side reports that case as -EAGAIN.
+ */
+static int tls_rx_intr_errno(long timeo)
+{
+	return timeo ? sock_intr_errno(timeo) : -EAGAIN;
+}
+
 int tls_sw_recvmsg(struct sock *sk,
 		   struct msghdr *msg,
 		   size_t len,
@@ -1991,6 +2009,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	struct sock *sk = sock->sk;
 	struct tls_msg *tlm;
 	struct sk_buff *skb;
+	bool released = true;
 	ssize_t copied = 0;
 	int chunk;
 	int err;
@@ -1999,13 +2018,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	if (err < 0)
 		return err;
 
+retry:
 	if (!skb_queue_empty(&ctx->rx_list)) {
 		skb = __skb_dequeue(&ctx->rx_list);
 	} else {
 		struct tls_decrypt_arg darg;
 
 		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
-				      true, false);
+				      released, false);
 		if (err <= 0)
 			goto splice_read_end;
 
@@ -2017,6 +2037,11 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 
 		tls_rx_rec_done(ctx);
 		skb = darg.skb;
+
+		/* The socket lock stays held to the retry, so the
+		 * anchor this wait loaded survives it.
+		 */
+		released = false;
 	}
 
 	rxm = strp_msg(skb);
@@ -2028,6 +2053,21 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 		goto splice_requeue;
 	}
 
+	/* Splicing an empty data record delivers zero bytes, which the
+	 * caller reads as EOF. tls_rx_rec_wait() skips its signal check
+	 * while a record is parsed, so test for a signal here.
+	 */
+	if (tls_rx_empty_data_rec(rxm->full_len, tlm->control)) {
+		long timeo = sock_rcvtimeo(sk, flags & SPLICE_F_NONBLOCK);
+
+		consume_skb(skb);
+		if (signal_pending(current)) {
+			err = tls_rx_intr_errno(timeo);
+			goto splice_read_end;
+		}
+		goto retry;
+	}
+
 	chunk = min_t(unsigned int, rxm->full_len, len);
 	copied = skb_splice_bits(skb, sk, rxm->offset, pipe, chunk, flags);
 	if (copied < 0)
@@ -2122,13 +2162,12 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 			goto read_sock_requeue;
 		}
 
-		/* An empty data record (legal in TLS 1.3) gives a zero
-		 * read_actor return, indistinguishable from the consumer
-		 * stalling; the used <= 0 path would requeue it at the
-		 * head of rx_list and block all later records. Consume it
-		 * here instead.
+		/* An empty data record gives a zero read_actor return,
+		 * indistinguishable from the consumer stalling; the
+		 * used <= 0 path would requeue it at the head of rx_list
+		 * and block all later records. Consume it here instead.
 		 */
-		if (rxm->full_len == 0) {
+		if (tls_rx_empty_data_rec(rxm->full_len, tlm->control)) {
 			err = 0;
 			consume_skb(skb);
 			if (!nodata_deadline) {

-- 
2.54.0


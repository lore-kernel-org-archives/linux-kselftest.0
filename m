Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428938;
	b=O4H2GTgX/M6/KHgsa8ipQVQ522kOsrWbTGwjj3YGzcurkDKly7iXr1ub3bluLeKulNf2
	 jk+lKxskDYFZjzwELtOkCLp9eLAYNMX0EUVKpIM7af4aPilYDMUUlhYv0nEM+5QEnVWSb
	 fmeCdzr860E1jdbOJuhKuzxRYvgaIOtNIPXDouLZT617NEw59+6Jyl2/xUFoHyyapDOT9
	 RroVK/5akDBjWrV98BpCqUlu86Ox6HdiKLkqIhKmMWBWfvCGrSWNrDR2OOcYxDz/I4Jt5
	 GeitGpacwqCYuXBs+P8HCXMk24eoMVrbg521hHnJMmwmom89T4We/aZydMMO975Zdrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428938;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2cv7bJfUcaIBjGrRsDqv5Yol4S+o/AxGDGck8+o1zuA=;
	b=N0GrdAvFMCiH/gCNNIPuUxUp3ruwR2n2/P0k7cceYgaviMBXOIW/PzyMjf99ljMOFEIb
	 4OG+8Zt+Dc23b1ifupygshdIBVPEAFvNmqtz+Uh0tcnVUgRoAYBeGdtOQmFm36YcnBc3x
	 LikhYm/NJjqWtnFrkvy+6881MznGjGYO3tOnCicPq1LQCBu3MvMnpYzH3bJ209znMrCaJ
	 mcsbXn8cU4HEiTJcT2nVyKbTg/eEavJeWfGGgwBwzm5duYYALS2SGR+myFKv1P+EZuS70
	 TFYqnW72xyVEuqLQ8H6sa0LVw42dMHvmuziaB33XKAsmGM6UHhnqqOA5GjPOhz5kGSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=byjzF3lM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8B8606A328;
	Mon, 19 Oct 2026 16:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=byjzF3lM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AA71F000CB;
	Mon, 19 Oct 2026 16:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428937;
	bh=2cv7bJfUcaIBjGrRsDqv5Yol4S+o/AxGDGck8+o1zuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=byjzF3lMBhYcICuDWyuCquhcT9+19SlgQ+Or3yjJz7pfjxmA6h5QL6wo2izI9a4Xt
	 Xtfs/beJY1fqe1wfdlXTnSZDQ/rUJD+nWpd+mnWaMCFMPnKrXCeLU8Iw3kp05s/eqk
	 hZ6AlKLkdgidwR83N2QfJwZ/u0TCtjGIdUXAxLuJVgDb9BqVFsw0QXZDhisCarLwxj
	 /68ExOYwXCbzIfD7R+J8H1wYUWIdwA6X8EmKt4rVyqnf89OjVg1I2FIPbcdDsBXRdY
	 kw0FJjIICis+q730V5vk4EY80zsBnTGvdqDWWeSwByyz1VV0FBLyrMcsAAgvo6+QLR
	 bt5Jf7mbBzh0A==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 19 Oct 2026 12:55:21 -0400
Subject: [PATCH net-next v6 5/9] tls: Consume empty data records in
 tls_sw_recvmsg()
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-tls-follow-on-v6-5-ab01c4ecca0c@kernel.org>
References: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
In-Reply-To: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=3908; i=cel@kernel.org;
 h=from:subject:message-id; bh=MRIT96XOzXd7GVVaIRMwwipOvG943c51X+TZHw4zjKo=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBq1kuBTO8PKQBBSxtajr9HNVf4e3vAwOkEsT2Ww
 JLfiF5aKJOJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCatZLgQAKCRAzarMzb2Z/
 l23dD/9YQlcIXrmnUIYXkKKe5rl6LWSstzZ1d4yKWZbqfJTc/FgQJIP+tLw8ZpVzNa+5tcYX2L1
 Rz+jukokLa9JWyeo8vEQo1vIwYvlUtzXyrdjFKJiGnIOwSQokHo8liguLsJQWAFOjcBIEsUqRcy
 ECx0oF7DJtc99nlK6okAT2MZGSPfFsOEJeHwsjRZfugH8qVgUCnFYEh4qwSHBl8y5JGLsoENhky
 /t+jt4z+eI4Oj2W8H5G14udxmNvNtXOalE9+e7ewdN8/B908MMs6zUwJZVs2x3fWTqwR6O3f1Nj
 bG3Y3UpL3DTrIm2Z6xsTt0Yqf4sIJBW7Q7samJS9qg1UXeyPq+xRv6Y0I9a2PmhZGj9Daur++Uz
 JpkIYNQgvEOu6ffzrvIA4h30OVl//QbqEUVG7culfZ0L6B3ChvUL2twrO+mMzFrYy76alV3R0Bi
 hh7UcK3VWgjNHpHldlGI0ErCDDLE1pyaOFVNn8H+/0iWz9cjoT9qfbpsE8pc+oZl3CQuGrw5W4V
 qcn+ZXxjVZcn0sgFxyZK/z0cwA6IlW1AgiIpD6+NIzcsTPihCZTnhBTmlGDvo5rAdo9m9h2JtNj
 tqzNEdViePK5vpIcjLgCIKgmAcCvFRNj9IzdYSXR8YmulOaNkwdO490ENRbEQ54ff8hBx90ZMwF
 SdqESPdkbrxUjLQ==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

TLS 1.2 and TLS 1.3 both permit zero-length application_data
records as a traffic-analysis countermeasure (RFC 5246 Section
6.2.1 and RFC 8446 Section 5.1). A record that decrypts to
full_len == 0 advances neither len nor decrypted, so
tls_sw_recvmsg() keeps reading empty records for as long as they
arrive. The peek arm and the async arm queue each empty record on
rx_list, and a peer that streams empty records grows rx_list
without bound. The growth has not been reproduced.

Consume an empty data record as soon as the receive loop has it,
before the paths diverge on darg.zc. Freeing the skb requires its
decryption to have completed, and an empty record is already
decrypted synchronously. The new branch sets MSG_EOR itself,
because the record no longer reaches the assignment at the bottom
of the loop. The peek arm does not set the flag, so after the
change a MSG_PEEK receive that reaches an empty record reports
MSG_EOR where it did not before. Test for a pending signal in the
branch as well, and drop the flag that deferred the test to the
next iteration.

After this change, tls_sw_recvmsg() still reads empty records for
as long as they arrive, until a signal is pending.

Fixes: 692d7b5d1f91 ("tls: Fix recvmsg() to be able to peek across multiple records")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260630191551.875664-1-cel@kernel.org?part=1
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index fe9c5c21dadc..550308410ff1 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1832,7 +1832,6 @@ int tls_sw_recvmsg(struct sock *sk,
 	bool is_peek = flags & MSG_PEEK;
 	bool rx_more = false;
 	bool released = true;
-	bool nodata = false;
 	bool zc_capable;
 
 	if (unlikely(flags & MSG_ERRQUEUE))
@@ -1867,14 +1866,6 @@ int tls_sw_recvmsg(struct sock *sk,
 		struct tls_decrypt_arg darg;
 		int to_decrypt, chunk;
 
-		/* A run of empty records advances neither loop bound, and
-		 * tls_rx_rec_wait() tests for a signal only after sleeping.
-		 */
-		if (nodata && signal_pending(current)) {
-			err = tls_rx_signal_err(sk, flags & MSG_DONTWAIT);
-			goto recv_end;
-		}
-
 		err = tls_rx_rec_wait(sk, flags & MSG_DONTWAIT,
 				      released, !!(decrypted + copied));
 		if (err <= 0)
@@ -1892,8 +1883,8 @@ int tls_sw_recvmsg(struct sock *sk,
 			darg.zc = true;
 
 		/* Do not use async mode if record is non-data or empty.
-		 * Once a record has gone async, recv_end discards the
-		 * error that ends a run of empty records.
+		 * The receive loop frees an empty record's skb, which an
+		 * async decrypt would still be using.
 		 */
 		if (tlm->control == TLS_RECORD_TYPE_DATA)
 			darg.async = ctx->async_capable && to_decrypt;
@@ -1930,9 +1921,29 @@ int tls_sw_recvmsg(struct sock *sk,
 		/* TLS 1.3 may have updated the length by more than overhead */
 		rxm = strp_msg(darg.skb);
 		chunk = rxm->full_len;
-		nodata = !chunk;
 		tls_rx_rec_done(ctx);
 
+		/* Keep an empty record off rx_list. On the zero-copy path
+		 * darg.skb is the strparser's, released by tls_rx_rec_done().
+		 */
+		if (!chunk && control == TLS_RECORD_TYPE_DATA) {
+			if (!darg.zc)
+				consume_skb(darg.skb);
+
+			/* An empty record still marks a boundary. */
+			msg->msg_flags |= MSG_EOR;
+
+			/* A run of empty records advances neither loop bound,
+			 * and tls_rx_rec_wait() tests for a signal only after
+			 * sleeping.
+			 */
+			if (signal_pending(current)) {
+				err = tls_rx_signal_err(sk, flags & MSG_DONTWAIT);
+				goto recv_end;
+			}
+			continue;
+		}
+
 		if (!darg.zc) {
 			bool partially_consumed = chunk > len;
 			struct sk_buff *skb = darg.skb;

-- 
2.55.0


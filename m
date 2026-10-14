Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE070569F2E;
	Wed, 14 Oct 2026 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002534; cv=none; b=ERHdNUhAWuJv8QOQcYGnPYNSnsIzTPqM+xHwqO7qloSQXg5sVJfZcE7zCQcj24ZaKhZESrdl7T73r3eTxT/oXQXBSVVRJoTYX+ISQTsBLi3nKgwI3X596elFPsgved7nRuH1nHolCn6kOHn+nhSN4YIhmnb3d0cnZSib4HgHryI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002534; c=relaxed/simple;
	bh=VcxbbhpgVT0/2Wf/Y61MjutPv6aM6MUdYmZOtoctlHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEmfCwA97kgv8q7T6lH69SKZkMuBo1D9caLc3mbVCwfBvc5esU2vKtLfvvN6Tp2z5TRf2yhmTZFzNj1eDZXnG9SIaJxaypJ5pDGi+3fxsZN8BNpASC2dO+g98y3Xs03mbkGS7Hmb62LA8qsvAIA1OI8JXTOeCPYc3Zo0oZsW1Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0SZ0i+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0SZ0i+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AEE1F000C7;
	Wed, 14 Oct 2026 18:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002530;
	bh=cM/V1HvSO33pz7+uP8HeiajczoeROfjpXYrJIAwtS08=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S0SZ0i+tuN/i9C4qpe0yGsxomvwKTRXRklnvAHSgKJoBaF4g+atfV4FU6RN6wgnXr
	 6p1hylHnkwPUZ3uxG0nAXQBISPFoh1NLklJPGjd33sE32dBU732bAALwGGLuBcMWo/
	 uqx0k8kVCy/AG4ZCb+/sIfOgFBcO2qwV8IZGK0cKPGGyIY93cCNPt6aA404wm9Trmb
	 0q4YlpjNrykvWCvNnPu4Mo6Z2jiB3H0VOubdffHVRx2xulDh0nTlk4ljkK42IKX4AD
	 0MuFEcH/7HP1X+sv+Ver2czUaKXHzsNNIzNCbft/Fsyld7Btv6WMtSOhnLmyamebCy
	 BELJ3tQDnc6Gg==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 14 Oct 2026 14:28:32 -0400
Subject: [PATCH net-next v5 02/10] tls: Check for a pending signal after an
 empty record
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-tls-follow-on-v5-2-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=3230; i=cel@kernel.org;
 h=from:subject:message-id; bh=VcxbbhpgVT0/2Wf/Y61MjutPv6aM6MUdYmZOtoctlHI=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqz8ndtlPLm4pm0zJKhm4VppsbComzE6T3BJcfa
 /xX672MVNaJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCas/J3QAKCRAzarMzb2Z/
 lzlsD/9L2zS741EkuwcxXXPBi6mMq4IceC9QIrbupeZCw+XSFrUIiRVhsa03vlkOwyQLR6uib9M
 5RLnTlMjec7mctFwkCq9n+0Zk2BiJ1TJEHbYysIjyfeardnV7lRkfsb7zmjfBBiNyiAmN3LXlPF
 ev8W+ZZ/fpFcqZH49ZeQw96uysTbLpancfKXQ+wMYdp7Xnnkedrbj21nVLK6SPmGXX0nT8GbZ8i
 +NBcLKeO+1OgMWQWT2ZGYPH9iGLBXpU5Wr3q6pG2SNjqW5GdUiFDEJRYplsFYUUq3bsgxGUYqpr
 CWwhqd+5vmCRIoJ9HEyeLC4Kk2pXv7Mvcrs6OpQv6e6TeK959MUlTmsHZys9lopgw5R0gG6BG+z
 gMzL8BRphLt5/6M8mjIGuberjizhnyKyRHeb/pscP8FXbAS+melLlV2MgiJGgOWKlO3oN8RzHSq
 /bgMk2uMEn/xlo5saXZrvvOlT0YySPLvCugbEjY8WRnlTNj3nz96wYvCiv5d7E5uaoOCQIYJ0ad
 j+x3zy5QshjoiRYP1EeB8rOUNTcag68u5HqVRRBsZAUds1IbUipGoVBAh5UKGen9/vS5ehMV/qE
 SvitriZY9Ilgi1DdJC991tBrb5QDZImNhfn/72ecmtjoszRMl/B20nQdDISrQWmbhtgw9aOKyaf
 Kgk0W+EteTCwqwQ==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

tls_rx_rec_wait() tests signal_pending() only after it sleeps, and
it skips the wait loop when a record is already parsed.
tls_sw_recvmsg() calls tls_rx_rec_wait() once per record, and a
zero-length application_data record does not advance either bound
of the receive loop. A peer that streams such records holds the
caller in recvmsg(), unresponsive to SIGKILL, for as long as they
arrive. The hang has not been reproduced.

Test for a pending signal in tls_sw_recvmsg() before it fetches the
record after an empty one. A reader that has copied data gets the
data. A nonblocking reader with a signal pending gets -EAGAIN
rather than -EINTR. Pending task work alone makes signal_pending()
true, and io_uring retries a nonblocking receive only on -EAGAIN.
The test stays out of tls_rx_rec_wait() because tls_sw_read_sock()
also calls tls_rx_rec_wait(), from callers that cannot act on a
signal.

Decrypt an empty record synchronously. The code at recv_end
overwrites err once any record has been decrypted asynchronously.
With only empty records queued, the reader then gets zero, not the
errno.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260720-tcp-read-sock-v2-0-29545d034f3c@kernel.org?part=1
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 37fcca95c046..ac4da28ed9c8 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1824,6 +1824,7 @@ int tls_sw_recvmsg(struct sock *sk,
 	bool is_peek = flags & MSG_PEEK;
 	bool rx_more = false;
 	bool released = true;
+	bool nodata = false;
 	bool zc_capable;
 
 	if (unlikely(flags & MSG_ERRQUEUE))
@@ -1858,6 +1859,18 @@ int tls_sw_recvmsg(struct sock *sk,
 		struct tls_decrypt_arg darg;
 		int to_decrypt, chunk;
 
+		/* A run of empty records advances neither loop bound, and
+		 * tls_rx_rec_wait() tests for a signal only after it sleeps.
+		 */
+		if (nodata && signal_pending(current)) {
+			long timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
+
+			err = -EAGAIN;
+			if (timeo)
+				err = sock_intr_errno(timeo);
+			goto recv_end;
+		}
+
 		err = tls_rx_rec_wait(sk, flags & MSG_DONTWAIT,
 				      released, !!(decrypted + copied));
 		if (err <= 0)
@@ -1874,9 +1887,12 @@ int tls_sw_recvmsg(struct sock *sk,
 		    tlm->control == TLS_RECORD_TYPE_DATA)
 			darg.zc = true;
 
-		/* Do not use async mode if record is non-data */
+		/* Do not use async mode if record is non-data, or if it
+		 * is empty: once a record has gone async, recv_end
+		 * discards the error that ends a run of empty records.
+		 */
 		if (tlm->control == TLS_RECORD_TYPE_DATA)
-			darg.async = ctx->async_capable;
+			darg.async = ctx->async_capable && to_decrypt;
 		else
 			darg.async = false;
 
@@ -1910,6 +1926,7 @@ int tls_sw_recvmsg(struct sock *sk,
 		/* TLS 1.3 may have updated the length by more than overhead */
 		rxm = strp_msg(darg.skb);
 		chunk = rxm->full_len;
+		nodata = !chunk;
 		tls_rx_rec_done(ctx);
 
 		if (!darg.zc) {

-- 
2.55.0


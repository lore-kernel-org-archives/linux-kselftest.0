Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428934;
	b=C339tM6iomPSSW+I8gU3rYKOhFFLd4Rumc5cA0+EtczG9TUj0hN9SEl8MhYSzgSrgHAi
	 f9w7JhZORkoxCCzVEE5WCGAtU484kX5xch10SVr83deEtXuvGjzdNHNkVhHpu3DcLMfKP
	 R1mD8V1P2QOfARZG8GbtGZaiPyy37Hbg4BJrb0MwegzBdpgj1QKPgywG/fR96tyPM8O1G
	 xCPg+Jb5QTPWx+HoWIWDgiqkfACG3u8UUh1wa81bOggXBgEMphmMuqnGYq+WEHlC/ntS+
	 n1BHTF6ZIB8BUrTjgZnlIPPh0d7WSe5J74VKiwUEl+kmKifsmCFmkgijdXD38MM32YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428934;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=413E26pmnObogmjRvlgsF2MjO9P7v6cLOObeHeXQYEM=;
	b=xiMjd5TNjQ0jBaT7NRix5wgXMfGZ3/Glvd7h9zt1APEkBiNCr3X+Ee0dfCnTmDV1tkJp
	 l3ZvgF+rrx3FXuOJW5XaHHpjroQUtJGJz2WkWIhTYcZXeW2GBUn4O6e/wNBjLHxvFGzHV
	 ZT9PK8VciP8sodUGHYtDgIf/+Maax9BdqnuOSoItB9tBBdkSBv/0DwyHP3WLQyBTdFgIT
	 fA2BK3oj7YNhH9c1JpR8LWOruJJQBDAV8zYCZpu+3/midi44tbLzddld95On1mTL0PAR8
	 i2vp0s5kzmgBA14UUmY9nBYIWImFhqkrIgE8aqp0/jufKrquUXcvBZ4BIonR2FK7I+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M80EyCNj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229C1606A326;
	Mon, 19 Oct 2026 16:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M80EyCNj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4A61F000C4;
	Mon, 19 Oct 2026 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428934;
	bh=413E26pmnObogmjRvlgsF2MjO9P7v6cLOObeHeXQYEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M80EyCNjt1dhH5PqJSqka27fUsXHw/kGwa6VmQPSq87VkhaTqww6P9JA9dluOOjWm
	 ce0kmBfk6+s/csK2TmxsbA3gVZL5BQeI6N8c+zIYGJoA/ShbQXvofO2J/yCFZqQHtD
	 1OVR7j4fNGogiasxt7/8IhQV6C6aMZVrVW5Av/+eQZUKjVs6icaO9fv+eoJJVP5cLC
	 ujmxH03iGbRcEPpB1pzEAdru4OhLDCDAdvYZYgg2o/MPj/9WT+AG/M0bxIccr259S4
	 9xxClp3pb4vIV+F74b8S8uKdbOsWzGrdEE5s0O+8euf9RpT5fRtygEyTI9LZsklBGV
	 P5GeX6cBUgjQw==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 19 Oct 2026 12:55:18 -0400
Subject: [PATCH net-next v6 2/9] tls: Check for a pending signal after an
 empty record
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
Message-Id: <20261019-tls-follow-on-v6-2-ab01c4ecca0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3923; i=cel@kernel.org;
 h=from:subject:message-id; bh=LEaa/zPrbZyrUKVGzo2eVQ0L46Z0zDzVvnXIjPTfq0c=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBq1kuA1hhegB5Ns5vw93gVtegy/E5yvwD6wvI2g
 dDNykOHg3mJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCatZLgAAKCRAzarMzb2Z/
 l1JzEACehNO3EK7cRrxaxX93kl+d3b2bAf8o5v3OilOajEK6cjuM3m1KryzcCgGTbk/b+iWO37x
 QH4MWooKXyHjf0G/0I1DA8QmBGdbnMbNeS7fQaqkxpDlV7vqA6GoM5BgVLZciD7y88YJPSOyavR
 /+5lKXVwWNDFOd37kWUudU3miro0OHUh08htabaL2oqdqOK7d2cxyox3oEcHSHLHsqShKBdkYeT
 F1GfOLbkcgWmryYkBjHvCt631YN1GcLhDDhShLWj+RD+FhOxQrTZb9jIs663fy4CJeGeDhOSSWD
 crFeNUVMkS3oWo1gr2qhEWt65nRdMuE3j8ZIVX5zl3tAx2cWQ3ESRTTyNQQ6q9bxAjzQdHu3UKM
 54k4hR1DNp+z5xMzSI9w9L8KwKA1U+ut79+W/p7LX9HxSxoUTf3YqaEfhugX+dbRql8aN6c9jTk
 Kn2jJBCpgyb4g2ZzyLJa8sny4XPSCZG6U+JrmC9JWqhRBO1uXbsYS+tLqB8hk6u37Dd3NoaIx7s
 aiV8ffihecQAniRw+gtA089ffdFXYtF5XDwtoP5SW8UJ/pTmHHCmNv/+9SswGG1KdXVog1vfaLO
 Bj1irtcO1XVx1+5Wp3ti5/g0jniPnHWR7AUtkvjS1ynrPaRNQ8nVBnE4mAj8nEOeCfT/LiOHLH4
 +/oWYG9npkpqHFQ==
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
 net/tls/tls_sw.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 0ef0edd51edd..e8a9f0c91e81 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1734,6 +1734,14 @@ tls_read_flush_backlog(struct sock *sk, struct tls_prot_info *prot,
 	return sk_flush_backlog(sk);
 }
 
+/* io_uring retries a nonblocking receive only on -EAGAIN. */
+static int tls_rx_signal_err(struct sock *sk, bool nonblock)
+{
+	long timeo = sock_rcvtimeo(sk, nonblock);
+
+	return timeo ? sock_intr_errno(timeo) : -EAGAIN;
+}
+
 static int tls_rx_reader_acquire(struct sock *sk, struct tls_sw_context_rx *ctx,
 				 bool nonblock)
 {
@@ -1755,7 +1763,7 @@ static int tls_rx_reader_acquire(struct sock *sk, struct tls_sw_context_rx *ctx,
 		if (timeo <= 0)
 			return -EAGAIN;
 		if (signal_pending(current))
-			return sock_intr_errno(timeo);
+			return tls_rx_signal_err(sk, nonblock);
 		if (ret < 0)
 			return ret;
 	}
@@ -1824,6 +1832,7 @@ int tls_sw_recvmsg(struct sock *sk,
 	bool is_peek = flags & MSG_PEEK;
 	bool rx_more = false;
 	bool released = true;
+	bool nodata = false;
 	bool zc_capable;
 
 	if (unlikely(flags & MSG_ERRQUEUE))
@@ -1858,6 +1867,14 @@ int tls_sw_recvmsg(struct sock *sk,
 		struct tls_decrypt_arg darg;
 		int to_decrypt, chunk;
 
+		/* A run of empty records advances neither loop bound, and
+		 * tls_rx_rec_wait() tests for a signal only after sleeping.
+		 */
+		if (nodata && signal_pending(current)) {
+			err = tls_rx_signal_err(sk, flags & MSG_DONTWAIT);
+			goto recv_end;
+		}
+
 		err = tls_rx_rec_wait(sk, flags & MSG_DONTWAIT,
 				      released, !!(decrypted + copied));
 		if (err <= 0)
@@ -1874,9 +1891,12 @@ int tls_sw_recvmsg(struct sock *sk,
 		    tlm->control == TLS_RECORD_TYPE_DATA)
 			darg.zc = true;
 
-		/* Do not use async mode if record is non-data */
+		/* Do not use async mode if record is non-data or empty.
+		 * Once a record has gone async, recv_end discards the
+		 * error that ends a run of empty records.
+		 */
 		if (tlm->control == TLS_RECORD_TYPE_DATA)
-			darg.async = ctx->async_capable;
+			darg.async = ctx->async_capable && to_decrypt;
 		else
 			darg.async = false;
 
@@ -1910,6 +1930,7 @@ int tls_sw_recvmsg(struct sock *sk,
 		/* TLS 1.3 may have updated the length by more than overhead */
 		rxm = strp_msg(darg.skb);
 		chunk = rxm->full_len;
+		nodata = !chunk;
 		tls_rx_rec_done(ctx);
 
 		if (!darg.zc) {

-- 
2.55.0


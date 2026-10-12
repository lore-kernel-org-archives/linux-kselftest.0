Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E3E4A0129;
	Mon, 12 Oct 2026 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819009; cv=none; b=A/KDKo0Nv3PlWCmcI43kRfafWO8e7l5lvKmcDTQ5v6oNKt2DSK2veRiHnUpA4k+dueAF40RuDDEG/8QLN6fFhDo/Jl6lwlVPPAgyprMGbqOk8o4kWrwtM+vv/p7iz3WUpT39Qf9MSvB5RzH9G3IzJw+aaRp+UmrB8J81womrTUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819009; c=relaxed/simple;
	bh=mOepAjr//54ldF1UryFcMVOT1lu3Ngq/1OgW50HIwBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tw4Gp+4DsyYmZpEBSfuwxHEOPkXKnFSP8kUFnTaiFxUM/fJwOEomoP5kTEyaSulOrBVODZh2gJnT9QKt/2Ujgw6nkC34rR/zoOPPlZ7b5WWhmwvzsY3l7NV2Mfn4tgsRUBKTQXIzk+4luui+Ooj9fv0yhjehylAzKZl1sOLeIVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQLe2+W5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQLe2+W5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A4C1F0089E;
	Mon, 12 Oct 2026 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819007;
	bh=mUVftk9YWXAVqs1uJSVHJuCxdiqbHnEl83BwT4U73+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AQLe2+W5mwzRPjmkR4elrkHAb4xDtSQrHPN1y+4K+ZDix5wVTcRYsvwVm1ZNUt64I
	 R1B/PtyVr0n9DfphWT5OqtysPKr6atmxqBJo0tc6I7NKXEtrTt0I1pWjhtAn6RfgKx
	 XUH8Unuzw95z0rloElj9pYCjKE8cDsy1oO122FA0ouEKYklIx7VM0ebPh0OFwSUO/T
	 0iLdxyCyfdqx769Q2Zh35hMPHAwEFQgP9AvE5H0M1b5joxs3G9vx195mLJIYghOsdC
	 8IaZWKwF4MtknhGcQd5D/CLAO27MV3Wl2kjqLW9HfU+v7uHPveLxcFjnt06k8B7Chm
	 kVJ119IDDVxRQ==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 12 Oct 2026 11:29:50 -0400
Subject: [PATCH net-next v4 2/9] tls: Check for a pending signal after an
 empty record
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-tls-follow-on-v4-2-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207; i=cel@kernel.org;
 h=from:subject:message-id; bh=mOepAjr//54ldF1UryFcMVOT1lu3Ngq/1OgW50HIwBk=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqzPz6bmv26F2M95nea1XJtmuUUcSBT3Bi1mpom
 QEb0PNd1mKJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasz8+gAKCRAzarMzb2Z/
 l/DpD/96pV/7+YLnrwtLbl8KOpnS4N46ueR1AE8K7JrlPqz8bvYiqBNEiZmd1jSOJ29acl7AIzX
 eIx+jtPKBF0rrP/czVcPV1eR/mgLTBZ2tYGi9F7yGlW+pT+iX/D1sOaREJx/vOdAnVfspIwr1jx
 mY3uEMNQIlLq7MR+wtPo63UIedLVXppCv1X2fVHUrFO1ZPazdCfR3MDJoqBEVAiqmYy4rXLFdDa
 biopXsTGgb8Fk14Xppic2aukpAFUvHW0q+rDR6M2D/J3dTfYkVAk8nUV2Tj1FFyn0Wjb6P0TLNp
 /I6IbHcIUl+5OraWdShlMTHIpdUmRQ9K/JPcBsyOcZXqlfleYTodYtOPpCAZhQlynqX69aqlXlT
 8KZsSb2G3eScbvk3vpus4CZrv7IsPsGFLPDbqJ8g78mZTBtKlFHH8QkBHiIBIRHQWnFVamdX8Jp
 MpCH5q1GOsQSJN//BpxUrCbF8+LNUjCwI7qxYJc8EZCxKkuaxX4fZK56WdwtpBCQeZ9pS1MTTtm
 OZJ+lFhbCJLEPL0V3ypHAsmsW1hc6S00S9Ugl8IeE6rOH19xGfex3MyfXJeYpt25gZFSlpoVZh1
 kRguZRK7Q3x6AgXMR7GPQe51sjwM2Dn4TWhNJ6Vvm2vBJra9uqNjsawANykZ9Fnt/dcYVIEKakr
 5g34W8DREQXE1uQ==
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
data. A nonblocking reader gets -EAGAIN rather than -EINTR. Pending
task work alone makes signal_pending() true, and io_uring retries a
nonblocking receive only on -EAGAIN. The test stays out of
tls_rx_rec_wait() because tls_sw_read_sock() also calls
tls_rx_rec_wait(), from callers that cannot act on a signal.

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
index a64244566af4..f2062e141512 100644
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


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2874A2A6A;
	Mon, 12 Oct 2026 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819012; cv=none; b=uZ3ReGWudxtV5JBJzP9MbFeHbYDGV0u+psm38yG+WYYIHnX1r6kMpAchfYVJVWLGaSrA/K/WNWCGdZkcvPbVKOAZ6yzf0OcxDUb3N4BBy3n2whBTGKLXNoCznIH+W0ODoMd2C7khBPYY4gmNuQ/wB8+GIlH2Hfgp+wFmBUNGVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819012; c=relaxed/simple;
	bh=KNpvGjNU56U4IYe3h99UZ/mofzuz5B76V5T2Gv3lsvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFFHry+yzf+Ld8yN+rCYEjBQDZtCVjY6WuzUa0pSikprx3uBguK/Z8chl2PL3+1IQvYeYxc4RYpUVhltJFPOkb/721QG8ShIMo81NAJgQ1jCvkCZiQT30uZRtl6h1gbvHjzYTHjN9DSMbB2mXmrf2Y8ShkY8IQShCTPXtBHE7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PA3s8HYZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PA3s8HYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9F41F0089B;
	Mon, 12 Oct 2026 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819011;
	bh=FvnobASVsgF4T6W3K2WTgnNlxdHbGEGd09Za18+pplo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PA3s8HYZAVzhg1foydz/HoqrkhKcmxntG1/RLWcwH1NcA/IY1wrIGMUZpy1H20B/N
	 mNXjudWg0imVkFY4eK0dLFWT0mF3TUrE4QayKAyriPvfAwHs0SAj6ymdERHrpTyyww
	 ASk2VJpCggN7AJpi7YSSnxmRrTZazU5j0Abs4ySERJ6wP9nht1evlI3Uo3tgEQq5nQ
	 5+3AKKKv8xEhDWDfB8V+jhLxUMFTNJg95ZkHjIoPlYjAoVufUeO4xdD2FlATD2+s0D
	 zWDd28W23iyreBeG47dP2U1rpH0mamsy/29OCNvBuBMDQ6qrsK6LXbn8iWaHGHQQMI
	 nPI8wnxVayuJA==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 12 Oct 2026 11:29:53 -0400
Subject: [PATCH net-next v4 5/9] tls: Consume empty data records in
 tls_sw_recvmsg()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-tls-follow-on-v4-5-8cea429565da@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2529; i=cel@kernel.org;
 h=from:subject:message-id; bh=KNpvGjNU56U4IYe3h99UZ/mofzuz5B76V5T2Gv3lsvE=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqzPz6tJ0Xbkm1GP/EaB+36N9K56P22yzB4kLny
 XRibbfOIyOJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasz8+gAKCRAzarMzb2Z/
 l75gD/42IESslsLl5VWFFWp+hhW0WqHVsoVWRfwApifywO758iLiUfgEU5n4JnaP4L4iN2aWZ2x
 SOvrUJMngeGQ0GrXjnIHLEpZngSHaTkLfg6bHGRtULq5+ZmmLfMZsKHUBgML1ZFc7tkHRJYS8NJ
 4JcU1AeNOGZPAq84KVNNAu7ycudzAvsXkJAjga0ETOZlV5b+mGIqCCPstroMsB0gWtJVn4j6tPT
 KdbJJCoPGah4tJBZvIiYoMvhoC5i9BgvXZtesirzAElnQ4Hl9pkr/LstKQhNwdL/ebjzZKxxW+O
 cfgdzYUsVLV2kkZRl5kgrTqFdkNlS8/qe2Bl7MXkHnBkODAQY8ehpRkQQmyzLCiiSQZ40T2rICI
 mN7XxKNN4BrvlWXy/BDurCHPhbVIu2/bdp4xpeVPMwi8sZ1cGbOSDvDokRd4vxlZjPd6KHgN4O5
 6p28n+O4ZcO6+ALhIVKV2ZLyO/y1O58u8/SFSQyUl9Bjy/qESsImEQiVkkUzK3QXQpuQu4UDXRW
 +8YXMEEPpLOGHiC+98qcTINmxutoetpYLwpFf3pdvSOE9Ll0yzWePvwgeu4kYwI16RTaxQnvENR
 /DQU7L/SUJQwQTdT2eCOMZtH/axQ8AeXnxGUi6by5fgaQUvV3Od7sv5Ea8fzkERvHLStTU3YfAc
 3i4NidmV5FiDddQ==
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
of the loop.

After this change, tls_sw_recvmsg() still reads empty records for
as long as they arrive, until a signal is pending.

Fixes: 692d7b5d1f91 ("tls: Fix recvmsg() to be able to peek across multiple records")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260630191551.875664-1-cel@kernel.org?part=1
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 0fea14224cec..b7790b17f79c 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1888,8 +1888,8 @@ int tls_sw_recvmsg(struct sock *sk,
 			darg.zc = true;
 
 		/* Do not use async mode if record is non-data, or if it
-		 * is empty: once a record has gone async, recv_end
-		 * discards the error that ends a run of empty records.
+		 * is empty: the receive loop frees an empty record's skb,
+		 * which an async decrypt would still be using.
 		 */
 		if (tlm->control == TLS_RECORD_TYPE_DATA)
 			darg.async = ctx->async_capable && to_decrypt;
@@ -1929,6 +1929,19 @@ int tls_sw_recvmsg(struct sock *sk,
 		nodata = !chunk;
 		tls_rx_rec_done(ctx);
 
+		/* Keep an empty record off rx_list. On the zero-copy path
+		 * the strparser owns darg.skb, and tls_rx_rec_done() has
+		 * released it.
+		 */
+		if (!chunk && control == TLS_RECORD_TYPE_DATA) {
+			if (!darg.zc)
+				consume_skb(darg.skb);
+
+			/* An empty record still marks a boundary. */
+			msg->msg_flags |= MSG_EOR;
+			continue;
+		}
+
 		if (!darg.zc) {
 			bool partially_consumed = chunk > len;
 			struct sk_buff *skb = darg.skb;

-- 
2.55.0


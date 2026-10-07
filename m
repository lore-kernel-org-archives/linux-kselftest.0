Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008E03E3D92;
	Wed,  7 Oct 2026 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402591; cv=none; b=HdNlbumh2M4P7rvU5MaXtBAka0EH1hErFmxTN+PF74PmMh9kIh5PhBouLEOopu550cGqiUTFAX5pDBW+XvLD7uhurCyHvm9A4k2+rAXkUZyQWAtCbyEOmhqmOrnu7fzJkZKx9dOOzsg8CLfA/JeM2xrLDVEwHOZX/aHm5FJS1rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402591; c=relaxed/simple;
	bh=ClzqSWLCJ0hFYn0dwL+oWMxjWqqddPdz1Pu2jKUG+UU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJaxvBsUP2IYeZyhZ3dbNheY2J/S6nUjDFY7iREKaWrUO1i7NIAMr/ovXpYhC7C5baRX9sUPWNrPuoSQxCrNGo0yJYZ+kLYGLdwO4ZIiVBb1Gva88zpWaoDnprT48YIDn5JvYrkI54UGN5ykngTgkDUeng8Zkv4iqD+rwf1l80A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7bp7h0T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7bp7h0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A671F00893;
	Wed,  7 Oct 2026 19:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791402588;
	bh=PRga6hBsx8xSqPqyknHPiMcwKGOX6nG50CJMFUKX3Qc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=m7bp7h0TRP8ExkOPagNNzT2f3UH+hAEQ6s0/iALBhswaETcxnO13clwxnXre/CEAF
	 nci4XFRJReqx+UTJJuPRrFyqCdi8fFhyzdj4FVbejdlYutH6rnlfH41a/JVIhWphG+
	 Ie2BIg/9qHf9/XH+fbcQci9ojlTTX17c3WUtlrWukh+5Yp8nJd/frVEMLahOs7TRSd
	 BxguzS0NJ8TMSz9hT8e+Iek+0yZkgOZzPxOemOZckdkM/3/gn6tyvO7grRWAFWgyg/
	 3qv231x/FLFW2xsIR6zWGY4zWexF6PGs43u0gej3RnP13NSiwA4C7FzQcZY/TO69hH
	 Li5tupJmPQ1vQ==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 07 Oct 2026 15:49:30 -0400
Subject: [PATCH net-next v3 1/9] tls: Bound consecutive no-data records in
 tls_sw_read_sock()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tls-follow-on-v3-1-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=4489; i=cel@kernel.org;
 h=from:subject:message-id; bh=ClzqSWLCJ0hFYn0dwL+oWMxjWqqddPdz1Pu2jKUG+UU=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqxqJZAngukwhWHSR5i9ccODCa12LKu/WUkAZXz
 nVqtzFAkqCJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasaiWQAKCRAzarMzb2Z/
 l9KUD/0VXj64pj6uulnwo5iNoJQSK1cW0HajZyllsUP7c6sxJjtG8Wv0abzSZ2xTazab38Ix0DB
 JSUDTkvkWJWZU7MjbNNyDXWq6AMYzkiZWDUuXe3pJZL/XBWjkzFcXYVFok6nVTFEwYC7+Bp+6kS
 sqtKGK3wYi46pNemAtWGVeDUEJemqb4/hcQu0EUl2MBUtBZh7UBujxYfUPHNLo7MikmaK9waggz
 MlD3aaIukSeXyD2WPxApxaxvAW/GURGEE5EQqC0BO+5aw5+pNs74grHum4svjnzPr25dpCJPQRm
 MMPktEWVMafv5XCjL6wAgPIu+D2tgOcEN9XrPRSR1D6cDJ2P7K87T5xxv/qdXHCnXe7VOUcow8I
 2G0nibjoB/nNTjwRpY0lOS4bdxxXWI/9B7FAdLZ/K6hcyMLKslNnVvv72m+D41kaPbNYGkCCJpm
 9kPzdxdc+Tbdz5P1jEq098Zhyli0uaFE7E7nOtawh1GATvRHW3XDrmYU6Zincrh4Tg//aJBTSjH
 ssY9g/AOeRAFUaaZtq/qVgF9RuPKHgQwdhSey04xFeB2B5rbLn8gsIHQMxA/ewQ7O3BlAhm+/TK
 9DvyglPEhcD1RLoT4Bl+Sz79qwEcOxRKE00RNwQceGQ/MzouQIFGMnPyHrFycGWKjlCOzqaJ0cr
 v95vuU4cjbYZrqw==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

A zero-length application_data record does not deliver a payload, so
tls_sw_read_sock() never runs the read_actor for one and nothing
decrements desc->count. A peer that streams such records keeps the
loop running, with the socket lock held, for as long as they arrive.
The caller cannot bound the run because read_sock() has not
returned.

An LLM audit of the TLS read paths found this defect. The defect has
not been reproduced.

Stop after TLS_RX_NODATA_LIMIT consecutive empty data records. Any
record that delivers bytes resets the count. Stopping with nothing
copied returns zero, which a read_sock consumer takes as no progress
rather than EOF. Records left queued do not raise another
sk_data_ready(), so the consumer needs one. The consumer's callback
can call tls_sw_read_sock() itself, as strp_data_ready() does when
the socket is not owned by user. Run the callback from a work item,
after the reader has returned.

Fixes: 3be28e2c9cd0 ("net/tls: Consume empty data records in tls_sw_read_sock()")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 include/net/tls.h |  1 +
 net/tls/tls_sw.c  | 36 +++++++++++++++++++++++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index e57bef58851e..42fcb9792bcc 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -145,6 +145,7 @@ struct tls_sw_context_rx {
 	atomic_t decrypt_pending;
 	struct sk_buff_head async_hold;
 	struct wait_queue_head wq;
+	struct work_struct data_ready_work;
 };
 
 struct tls_record_info {
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 312e51270f29..275a6047da9e 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2070,6 +2070,20 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	goto splice_read_end;
 }
 
+#define TLS_RX_NODATA_LIMIT	16
+
+static void tls_rx_data_ready_work(struct work_struct *w)
+{
+	struct tls_sw_context_rx *ctx =
+		container_of(w, struct tls_sw_context_rx, data_ready_work);
+	struct sock *sk = ctx->strp.sk;
+
+	/* A callback that finds the socket unowned reads from it. */
+	lock_sock(sk);
+	READ_ONCE(sk->sk_data_ready)(sk);
+	release_sock(sk);
+}
+
 int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 		     sk_read_actor_t read_actor)
 {
@@ -2078,6 +2092,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 	struct tls_prot_info *prot = &tls_ctx->prot_info;
 	struct strp_msg *rxm = NULL;
 	struct sk_buff *skb = NULL;
+	unsigned int nodata = 0;
 	struct sk_psock *psock;
 	size_t flushed_at = 0;
 	bool released = true;
@@ -2136,14 +2151,22 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
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
 		if (rxm->full_len == 0) {
+			err = 0;
 			consume_skb(skb);
+			if (++nodata >= TLS_RX_NODATA_LIMIT) {
+				/* tls_rx_reader_release() does not call the
+				 * consumer's sk_data_ready, which can re-enter
+				 * this function.
+				 */
+				schedule_work(&ctx->data_ready_work);
+				break;
+			}
 			continue;
 		}
 
@@ -2154,6 +2177,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 			goto read_sock_requeue;
 		}
 		copied += used;
+		nodata = 0;
 		if (used < rxm->full_len) {
 			rxm->offset += used;
 			rxm->full_len -= used;
@@ -2345,6 +2369,7 @@ void tls_sw_strparser_done(struct tls_context *tls_ctx)
 {
 	struct tls_sw_context_rx *ctx = tls_sw_ctx_rx(tls_ctx);
 
+	cancel_work_sync(&ctx->data_ready_work);
 	tls_strp_done(&ctx->strp);
 }
 
@@ -2476,6 +2501,7 @@ static struct tls_sw_context_rx *init_ctx_rx(struct tls_context *ctx)
 	crypto_init_wait(&sw_ctx_rx->async_wait);
 	atomic_set(&sw_ctx_rx->decrypt_pending, 1);
 	init_waitqueue_head(&sw_ctx_rx->wq);
+	INIT_WORK(&sw_ctx_rx->data_ready_work, tls_rx_data_ready_work);
 	skb_queue_head_init(&sw_ctx_rx->rx_list);
 	skb_queue_head_init(&sw_ctx_rx->async_hold);
 

-- 
2.55.0


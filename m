Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4B256C638;
	Wed, 14 Oct 2026 18:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002531; cv=none; b=Md30T1uWThYN2aHH0BZYTWtNKaGs/QGQ4SkjRQ5uI3+VgQK+8Id9t9lqp8EhkW9gioJ1/6TF/0UZbLu7vbbRsoH9HAExHQXQo/WwGoRyGgBkRNuyDb5sYEaGYg1Wv6GonN71kp31xIi5BkPwD5hT2O2paH3NDXFTq6M/Hs982Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002531; c=relaxed/simple;
	bh=tWwgJXLTkHZv7MqCqlvpcSxZfJGR9bP0Fbwi+4CYquI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9QGoFy0HWMDpc1rVOmeJgmlWVnimuQpW/PIMibk0G5AeAGhrZddrjvwFi1kXu28KWYw4qtbc1oYTC6sDMQp+ddUVDS7YqU7T7FJdJM3qtPeLGd1eOKqcLgKf/+4STyg/W6RxSo8azBGx+w+J2K4EcDpUyn65mVmNhv89lLqX10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coo3kmOF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coo3kmOF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F55D1F000C5;
	Wed, 14 Oct 2026 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002529;
	bh=97q1McmgNH0yiXwXMGalpq/U4vEcTgnLmjiCiGPDg7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=coo3kmOFKi2Pg2hpw2C4ACZbRFupTomAptj4OXFZ8asSafNVhjWm64raADRZqLVdi
	 tTORsdlKuTCPWIeCUJX1Hg3VZrtTNkdzLLKUOhmh+8isnKEYBr8oVmFSm7p/BguSlG
	 KtsJCvRqRdEbe8rVOE+O05eDNH/34VZKiAchc88xsEXifo6cXKyZjFdKEoDuKstiqz
	 rEzqaQRHZYlfVMGbZyYnujsGZrbBdo89Ew+Ej6t3bicUR/DCznE9hXAbrIkw5VQkxK
	 nS85ggjR/kxcUHLTirNHUSaAmlXNvyNi8YUYqC6KVftWjhNaMIGLoBmltyNM0OLlkg
	 pqtwMmtL4X50A==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 14 Oct 2026 14:28:31 -0400
Subject: [PATCH net-next v5 01/10] tls: Bound consecutive no-data records
 in tls_sw_read_sock()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-tls-follow-on-v5-1-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=5991; i=cel@kernel.org;
 h=from:subject:message-id; bh=tWwgJXLTkHZv7MqCqlvpcSxZfJGR9bP0Fbwi+4CYquI=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqz8ndBlgL17TRMDZPhgElekxSt7OGstUpKI/9D
 L2EGtJYHceJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCas/J3QAKCRAzarMzb2Z/
 lxMdEAC8LmQ/pW4X1KirkzJzMXVSbEJA6gsVjJFwohXfr+fnlPrY0mfWcPqBSUcRbLmSvhK5Crf
 U2Td64iS3ZSRuhRu1qya/fbJLbzop6qu8vlb8KmCdjd/vICY3FjXFkrNIqi4/xBRPbOlwDIaLBo
 auG1sjMSBU/2DBppS2yuP/O6Cdn5nJk37z86XyON04Ctv80CbPGfMTgj42EGSFgyxMro04geRYa
 UShNBDRZHE8KX/ZKjVshlnSX5G7SbRtef5ScpQOK+bqMmLugJeLHWt2TXypmmv5L1m//w+mdqTn
 GW3pVB7hZHJ95QTQvU0TFRYF0b4R15SY6PCo9Z+kRtMDl3pJlkR5freewOK1S5BoVA44Ez7tR8Z
 bZtuR8D/nVq1zP1UxnWbyGrOAcAO761SxYVCerXUaMiru5RbDyhFnT6QEViKumYPZt+RZqqoz3P
 5U8tP4iwZIJ3QHnclQQODRz8FLiM+yxynx2Im97VLy5fvhfhiOeEqc+VzXF/usWvUHZ/QYPQlmL
 yUWT7sQBfdvJTgjOMKh8BoUsoMq+NzbV7PKkUGCJ68PZ0tYjyg9YuwNQOA1iDBPebhqLvR4anSD
 V317fWNUnUWcai47wLunlZ3iWOTWbhsZ66zQN5hBPKQ3r91zeSOVTHlcWsqNzDiE6gk/M23rwai
 opTsgAKCPhRDp9g==
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
rather than EOF. A record parsed during the call but not yet
delivered needs the consumer called again. tls_rx_reader_release()
wakes only the callback saved when TLS_RX was set up. nvme-tcp
installs its own callback after the handshake, so that wake does not
reach nvme-tcp. Run the consumer's current sk_data_ready() from a work
item once the reader has returned. A direct call from inside the
reader can re-enter tls_sw_read_sock() through a strparser callback.
The work item runs on tls_strp_wq, which is WQ_MEM_RECLAIM, because
nvme-tcp over TLS can sit on the writeback path.

Fixes: 3be28e2c9cd0 ("net/tls: Consume empty data records in tls_sw_read_sock()")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 include/net/tls.h  |  1 +
 net/tls/tls.h      |  2 ++
 net/tls/tls_strp.c |  2 +-
 net/tls/tls_sw.c   | 39 ++++++++++++++++++++++++++++++++++-----
 4 files changed, 38 insertions(+), 6 deletions(-)

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
diff --git a/net/tls/tls.h b/net/tls/tls.h
index 60a37bdaaa25..c9e3d02ac2c2 100644
--- a/net/tls/tls.h
+++ b/net/tls/tls.h
@@ -184,6 +184,8 @@ int tls_sw_fallback_init(struct sock *sk,
 			 struct tls_offload_context_tx *offload_ctx,
 			 struct tls_crypto_info *crypto_info);
 
+extern struct workqueue_struct *tls_strp_wq;
+
 int tls_strp_dev_init(void);
 void tls_strp_dev_exit(void);
 
diff --git a/net/tls/tls_strp.c b/net/tls/tls_strp.c
index 6cc222008d95..ca8cf8ad80a2 100644
--- a/net/tls/tls_strp.c
+++ b/net/tls/tls_strp.c
@@ -11,7 +11,7 @@
 
 #include "tls.h"
 
-static struct workqueue_struct *tls_strp_wq;
+struct workqueue_struct *tls_strp_wq;
 
 void tls_strp_abort_strp(struct tls_strparser *strp, int err)
 {
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 312e51270f29..37fcca95c046 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1996,6 +1996,8 @@ int tls_sw_recvmsg(struct sock *sk,
 	return copied ? : err;
 }
 
+#define TLS_RX_NODATA_LIMIT	16
+
 ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 			   struct pipe_inode_info *pipe,
 			   size_t len, unsigned int flags)
@@ -2070,6 +2072,20 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	goto splice_read_end;
 }
 
+static void tls_rx_data_ready_work(struct work_struct *w)
+{
+	struct tls_sw_context_rx *ctx =
+		container_of(w, struct tls_sw_context_rx, data_ready_work);
+	struct sock *sk = ctx->strp.sk;
+
+	/* A callback that finds the socket unowned reads from it. */
+	lock_sock(sk);
+	/* Past tls_strp_stop(), sk_data_ready is no longer the consumer's. */
+	if (!ctx->strp.stopped)
+		READ_ONCE(sk->sk_data_ready)(sk);
+	release_sock(sk);
+}
+
 int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 		     sk_read_actor_t read_actor)
 {
@@ -2078,6 +2094,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 	struct tls_prot_info *prot = &tls_ctx->prot_info;
 	struct strp_msg *rxm = NULL;
 	struct sk_buff *skb = NULL;
+	unsigned int nodata = 0;
 	struct sk_psock *psock;
 	size_t flushed_at = 0;
 	bool released = true;
@@ -2136,14 +2153,23 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
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
 			consume_skb(skb);
+			if (++nodata >= TLS_RX_NODATA_LIMIT) {
+				/* tls_rx_reader_release() wakes only the
+				 * callback saved when TLS_RX was set up;
+				 * nvme-tcp installs its own afterward.
+				 */
+				if (tls_strp_msg_ready(ctx))
+					queue_work(tls_strp_wq,
+						   &ctx->data_ready_work);
+				break;
+			}
 			continue;
 		}
 
@@ -2154,6 +2180,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 			goto read_sock_requeue;
 		}
 		copied += used;
+		nodata = 0;
 		if (used < rxm->full_len) {
 			rxm->offset += used;
 			rxm->full_len -= used;
@@ -2345,6 +2372,7 @@ void tls_sw_strparser_done(struct tls_context *tls_ctx)
 {
 	struct tls_sw_context_rx *ctx = tls_sw_ctx_rx(tls_ctx);
 
+	cancel_work_sync(&ctx->data_ready_work);
 	tls_strp_done(&ctx->strp);
 }
 
@@ -2476,6 +2504,7 @@ static struct tls_sw_context_rx *init_ctx_rx(struct tls_context *ctx)
 	crypto_init_wait(&sw_ctx_rx->async_wait);
 	atomic_set(&sw_ctx_rx->decrypt_pending, 1);
 	init_waitqueue_head(&sw_ctx_rx->wq);
+	INIT_WORK(&sw_ctx_rx->data_ready_work, tls_rx_data_ready_work);
 	skb_queue_head_init(&sw_ctx_rx->rx_list);
 	skb_queue_head_init(&sw_ctx_rx->async_hold);
 

-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428933;
	b=v2jM1P0c+H/mYpxWUMOAvxJh76oxh7mjWsr2cV5b5Z7u7ncWvmGKHepr2706MgDU4eAp
	 ZlJqLhqS+gFcE6MUKpwD7a6ikLIdYanSWpJtpBjId2f9+RsnOVD14xoGDvrPU4sQbMpNV
	 7d5JM38U+S21iM7kX3f3ZRo69p/Bi2trpPGmJAXqDe9AjU81zyX9S15ohQFd3jVGV3J22
	 7rBD7r8l21yEG4BRbz+NWEh9YypwoNJQ+H+80n/8NJKFMq4aId0iGTq/UR5Ok9cE9yOJT
	 6rKPAhR50t9gtOmWxjLwSZkWJg+6vKR7nVeIl5HT6u4R1GnaTPDaNJfyTAsB/ao6tVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428933;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=M9riDG9KBXETT7o07dJnU23g1wPXeNG735KdfXO6M14=;
	b=JFC8b2PaqN14EF3t/RIGCkDycqMj5VBvLkgxItsn3nF7ViY7vhPD0lc7eSUamvkBWhQm
	 RrsSb0P2dLtRMlYom97q0JeDN9YszultrstjFdWtphLCB25RHWTOQwgCz6zj0Ge5w3Yf1
	 cgNRUztm+tqUcJlylk2tby/0VASJfeGuFt/aDOr/XXlKtISGLQcDFkVqB+fPlHzVxHvtU
	 ob+3Z37gVbTWrdQk5QU4X+B12J9s3pZj4Xh4/9TcH5DHcI1EypftQvOJ1KM4toLFJ5G+T
	 1/N61UV0E7VrcHMMTrgKfAN6zvywnBObhPiWAbXXWbxtY4mtL/vpzULzF7Q8jcKhdzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kRPI7sJg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7183606A31A;
	Mon, 19 Oct 2026 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kRPI7sJg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A732D1F000C9;
	Mon, 19 Oct 2026 16:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428932;
	bh=M9riDG9KBXETT7o07dJnU23g1wPXeNG735KdfXO6M14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kRPI7sJg7LJYsv0v/aXTVeG1Jf/69rEjV20gKHlVHj48RbgOiXaItUJ8OV47moks4
	 VYHN/4GZWRy1FPUHu+jgWwqpbuIRF+UEGNUQ0eW4xBmFcwA6uOFWmv7nfQJPob867o
	 DC0Kfufw3eXV+hnyfX3W6N670V3rvXxaE/OQ6er6ba6FLqinpm8p9qHMNHjM2xZa1v
	 yloYCbw5hBq8FPBNrBVQRQme7O88U0RCK04byjctkP7E9DcOEPS4UuoEtQyPqDHqOv
	 n9956GbEiPbXw7j0YrOB52RIdOi5ZDCuKeT3OPj+EZNeQpR9KgY9zXcnCu14OfNge/
	 tcSfAGawL9TIA==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 19 Oct 2026 12:55:17 -0400
Subject: [PATCH net-next v6 1/9] tls: Bound consecutive no-data records in
 tls_sw_read_sock()
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
Message-Id: <20261019-tls-follow-on-v6-1-ab01c4ecca0c@kernel.org>
References: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
In-Reply-To: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=5266; i=cel@kernel.org;
 h=from:subject:message-id; bh=5xaKY6NnkaYQYVwKiXIANzSAjX635VGh7hvFulUzU5g=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBq1kuAh72GZPBpk/WUOtXyrnv1AluVc/kFI6Wnk
 IUTDGADSn6JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCatZLgAAKCRAzarMzb2Z/
 lynlD/4qHWRxMUzZfT9yJ9VYJpFzBm1WtNSkHyOcM9LtjTgRkMpZH2Gtlf2OryAbgknrjl9D+WZ
 zQ/9XLC7CbWbpBAuf+w+7ueH0ta9ynsUkHCH83Y9cQh+zwTTmoK3C49W2634kpPNunrizHvW4FY
 rCQjfr93+6oxPA75BXMj/8dXHg9UMhFn/CevSIsvq1XDSy3dJUys+ehAe9yM3iMNkxrFqPyUHtu
 ryopPpjzP/pR+prVcsl5HppNhSw9F/DumDOKCYGZzM1zp+ULCb1Emudt6IOCvrlBiyPvThu31D0
 mdaH5iO5XypuqzQvHM0ar9qLUEhqx99HNmOqEw0YikG2LnkPtalw4QDeAWYSnd+sJJ1o/Dyl0JH
 XVt4PrE5v1aVOG7ev7nT9anNxuYUw8In8LtR71Q4yz7naxPpwA1jR5R1d3/ALT36g6mOc9CNDWi
 J6s4kP14rc8PIX6cNiOXsC1+EIa+OBfbm/jh5QrEFvIQJhvFxotOvrLcPMwdWgvfMKZUFJ+sk+P
 8h6cpX034XKXKaSNOGnRZjjOC+QohJXKkNTnuw2OrNVjhvsYK8r8HESGU62MoN2M9qmwv2DzeL8
 3ppYwwHaofBghwLSKppwjhJ4FS+o2UXGKcduiSEQlN+WjmP4u91OZhKWkT5ghjDU7a1rllyUv+J
 Kf2kK9GA9Xx3MLA==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

A zero-length application_data record does not deliver a payload, so
tls_sw_read_sock() never runs the read_actor for one. A peer that
streams such records keeps the loop running, with the socket lock
held, for as long as they arrive. The consumer regains control only
in its read_actor, so it cannot stop a run that never calls the
read_actor.

An LLM audit of the TLS read paths found this defect. The defect has
not been reproduced.

Stop after TLS_RX_NODATA_LIMIT consecutive empty data records. A
record that delivers bytes resets the count, because it runs the
read_actor and the consumer can stop there. Stopping with nothing
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
 net/tls/tls_sw.c   | 30 ++++++++++++++++++++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

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
index 312e51270f29..0ef0edd51edd 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2070,6 +2070,22 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	goto splice_read_end;
 }
 
+static void tls_rx_data_ready_work(struct work_struct *w)
+{
+	struct tls_sw_context_rx *ctx =
+		container_of(w, struct tls_sw_context_rx, data_ready_work);
+	struct sock *sk = ctx->strp.sk;
+
+	/* strp_data_ready() reads in place from a socket it finds unowned. */
+	lock_sock(sk);
+	/* Past tls_strp_stop(), sk_data_ready is no longer the consumer's. */
+	if (!ctx->strp.stopped)
+		READ_ONCE(sk->sk_data_ready)(sk);
+	release_sock(sk);
+}
+
+#define TLS_RX_NODATA_LIMIT	16
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
@@ -2144,6 +2161,16 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 		 */
 		if (rxm->full_len == 0) {
 			consume_skb(skb);
+			if (++nodata >= TLS_RX_NODATA_LIMIT) {
+				/* tls_rx_reader_release() wakes only the
+				 * callback saved when TLS_RX was set up,
+				 * not one installed since.
+				 */
+				if (tls_strp_msg_ready(ctx))
+					queue_work(tls_strp_wq,
+						   &ctx->data_ready_work);
+				break;
+			}
 			continue;
 		}
 
@@ -2154,6 +2181,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 			goto read_sock_requeue;
 		}
 		copied += used;
+		nodata = 0;
 		if (used < rxm->full_len) {
 			rxm->offset += used;
 			rxm->full_len -= used;
@@ -2345,6 +2373,7 @@ void tls_sw_strparser_done(struct tls_context *tls_ctx)
 {
 	struct tls_sw_context_rx *ctx = tls_sw_ctx_rx(tls_ctx);
 
+	cancel_work_sync(&ctx->data_ready_work);
 	tls_strp_done(&ctx->strp);
 }
 
@@ -2476,6 +2505,7 @@ static struct tls_sw_context_rx *init_ctx_rx(struct tls_context *ctx)
 	crypto_init_wait(&sw_ctx_rx->async_wait);
 	atomic_set(&sw_ctx_rx->decrypt_pending, 1);
 	init_waitqueue_head(&sw_ctx_rx->wq);
+	INIT_WORK(&sw_ctx_rx->data_ready_work, tls_rx_data_ready_work);
 	skb_queue_head_init(&sw_ctx_rx->rx_list);
 	skb_queue_head_init(&sw_ctx_rx->async_hold);
 

-- 
2.55.0


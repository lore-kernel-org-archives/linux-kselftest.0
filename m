Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA023CBE74;
	Wed,  9 Sep 2026 19:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983505; cv=none; b=JDsf+88m2AMg6qznIcyFD8L+u27MBJeW5M9zlfGccc2Vu6Q/1qRxiP04hu4FEasreyL2BFL9BkiPEA5myIwG6PbJFtA83f83AT0AhLwjyTLYo+/XSHborzd3h32wtLaGUe8L3VOoxI+lG2GCKvkCrtu56tkwhdCM8Y2a5QofFok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983505; c=relaxed/simple;
	bh=TnGOTeHOpQnlOMbnZeMUyzEkwl71yr/clWBahcf36xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcrCpYQrl6JkM0xY3uEcVOqtAe7R1LLo8kNk4YeMRqV+tMgAWFiv3VaoqJPMzTRj8Ra/q9w3MQjE2UQZg7oLfiR7Ilk3QNCwHvll8Nm8hHjX7LwJhnroAAan6OXA0u236DefzqkOfqE+T4YQ6pGd0Dira9PSgu+WHobmwWLaiFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=awt0HPSw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Oo5YhAaL; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="awt0HPSw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Oo5YhAaL"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 358C87A0071;
	Wed,  9 Sep 2026 15:51:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 09 Sep 2026 15:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1788983501;
	 x=1789069901; bh=xzwIf4EWiDNrEYqQJEMyFEKaTAoeALpkRpyeCr/FZBs=; b=
	awt0HPSwJ785qJVgKxy8KourgSOqMK1be/6o3t1vhY4/4ZWD6JXmkqKLnNcBGkqs
	cBok1u8C0Z7SZv6Lhsg8zzdWxfJEYpiiiVSDYkPz+cXwEqr6bXmuX2nMJi31SoQM
	yllWybDUs+9WEMCoFSD0kuHBy30eTYBD9TH9Ui4gPWE51O4YrSgbw+NEu7OX3a+P
	UXjRAMFu+CfSzu5o2KddvcSGE3aqFBwavUr8pHGKN7Jyu4bEZ5AJADh8xVZrtE4+
	Bj67dx4QiobiXh+w2NBKTuI+RE/gWYtxk7Uc+ZMwmgisVrMNHeKE0uBrpkhbiMQ1
	GMKwzrf4BQRCV21cF6a9PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788983501; x=
	1789069901; bh=xzwIf4EWiDNrEYqQJEMyFEKaTAoeALpkRpyeCr/FZBs=; b=O
	o5YhAaLNJv3OOLuCG7NMjDxvq/mnfq6B8L+Adetk7zIJ/QZvvw/yBcXjzHmyxRG7
	u0ZwfDOjoLKkP36rXlR3DiJIbPjURhmcom5PYjM3y7JRdYXC8V4FVNWJMykvfv/S
	TKJnAR+r3IeQhfwrpSeLHutQfdMCV7PjrUn1JNpmWKzRpHOmR167i6KBk/JCYifv
	x1QSwvNRFzXZgLZGSUPofufHLXa3AQ0kvmvEVdH0Y2qkO/n+qsa/G/JF4g3nMv31
	xAHQM12tB5UPSaf0B65o8Jvpk1kjvEPhYWuoYO8S6TDXAFZRvmDGV0Z/n9n5JLAs
	+/frrRMBDgcqoKPIe6Tfw==
X-ME-Sender: <xms:zLihamGOTEFaF2htLzU5oy66bQlYRiEfE79EmqPENWwwdGgCE_K1QA>
    <xme:zLihavjVYbdCcHfNU40m6gnGv3piGcd9IHp410A3YChEkJ7QyO-eVUtj96pIv2nmF
    ixSVXpsMeG5iZi80ks_kSS7535nmDgahBMsTCXR6rrEwmPOwmL1br54IA>
X-ME-Received: <xmr:zLiharus_9R32m4_jRKOHiakVwMYk7zAItxTA_ZCwJ9AQi8LGaf3xPjJNTMlPIWp>
X-ME-Proxy-Cause: dmFkZTEnhrolNfQ4AYw8TgLeB94Mda0JkhAUpDCtNqjs3dVrNQ1Y3y24lWMKgZmP8M95oP
    2gJq/DMxnaGsu+6QjX7RRo3FHFhH6qoL0nA6qxBJ/BKeCqKtSa8UiT1st0s+WommnsIVhR
    zrryFxfOfOJ0iCZOrtpYmWbPt77+adxEoHzrpoW7jaVPoJlPv6OXuqYmf4qa4Y1qM+8fCm
    eYhl3u7jduesafENw0QWE6trJLZ5Zoi4rrkrILiuRWncZXKRmZFbqyobdaP73cf8kUgU+Q
    MkXKfM/U7z0W4xl9fkxpVSW9Mi2tlQIyMy71z6GBm7ROkMxBwnd0DjX6DU3w6BN8RSa0K7
    jovXoWPLuKAGaRp8xVUci6UkQ85w3GH+Ral1izHPJsm1UOAoKxOD1xmIC+YBVPSJdOVQqX
    iRAfnAAfoj+BxDNRvTILQlrS5BZQYu/FKgaSLLRGGnU69Dn3G8sWLBv8UoAOn7KBVCfkao
    WQ3k03UQHvXbpbWaXZ8G3NTdW+3W5k3Pub22u+7y2+tjEYTFnTC5asu58vuG/189eo6Grl
    seKYqn6LIn22m75+kw+Sk6OC1A5/32Yj1mCOQ3mY8HUZfMn6UVQlN/8aTyRv9HNXMqw/JW
    Y1+ArUBCXAbRxhB4DdfIsJ/POh5ZR9IvkiPPKZXxZ8c7EXYGzjGSp2w8znCA
X-ME-Proxy: <xmx:zLihaqsT6S6Nq0CyHDggOH_Q53dKrjVlM9Y12u93qIzgQtZ-FJMe6w>
    <xmx:zbihaoFF28M02X4IZ9CsXZ_2sxuY1UEDVEbzwpozvsCoefLae5nI_g>
    <xmx:zbihatNQn0xR7CVQHQaB8vyDPHrfoRg5tCVtLFHpQeMcZ9D3zMZK2w>
    <xmx:zbihavIWwg7fNOkL2CM0Si_uN95Rew8k32uC16ArF9b5N4TCDEOi_A>
    <xmx:zbihatu4AT8ksyvT7X1ShZP1byQMF7MATjZqrHKXnJ_eqlXfKJmaVC8t>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 15:51:40 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Wed, 09 Sep 2026 14:51:27 -0500
Subject: [PATCH net-next v7 5/6] selftests: net: add multithread server
 support to iou-zcrx
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-iou-zcrx-v7-5-6b5d48a2a922@fastmail.com>
References: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
In-Reply-To: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12887; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=TnGOTeHOpQnlOMbnZeMUyzEkwl71yr/clWBahcf36xk=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFkLdxz1Clj778B19yZpNrU7KmnHey7bazgyPjas0+At5
 LDjS3neMZGFQYyLwVJMkcXjpUiLxtSKxruqEYIwc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6BjjEDF6cATPUkToa/gjPXTXo+P2y9vfxWzin9SaL/9nr8i/d6WDXBv3KzytWPhgz/cw+wr4t
 JepF3bE3Hdc1/eh7LWmMOq8yXO7hsomVj875EbgA=
X-Developer-Key: i=juanlu@fastmail.com; a=openpgp;
 fpr=48E9148428957881DD2558116FF739276A6BB0D9

Run the iou-zcrx server as N worker threads, each owning one receive
queue with its own io_uring and zero-copy receive (zcrx) ifq, so the
test can exercise multi-queue zero-copy receive.

The main thread owns the listening socket, accepts connections, and
dispatches each to the worker owning the queue it landed on by matching
SO_INCOMING_NAPI_ID against per-queue NAPI IDs.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 tools/testing/selftests/drivers/net/hw/Makefile   |   5 +-
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 278 ++++++++++++++++------
 2 files changed, 210 insertions(+), 73 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 69be4d052ef5..8aebdc6feb17 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -18,10 +18,6 @@ else
 $(warning excluding iouring tests, liburing not installed or too old)
 endif
 
-TEST_GEN_FILES := \
-	$(COND_GEN_FILES) \
-# end of TEST_GEN_FILES
-
 TEST_PROGS = \
 	csum.py \
 	devlink_rate_cross_esw.py \
@@ -80,6 +76,7 @@ TEST_INCLUDES := \
 YNL_GEN_FILES := \
 	ncdevmem \
 	toeplitz \
+	$(COND_GEN_FILES) \
 # end of YNL_GEN_FILES
 TEST_GEN_FILES += $(YNL_GEN_FILES)
 TEST_GEN_FILES += $(patsubst %.c,%.o,$(wildcard *.bpf.c))
diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index f793a6c04e41..91b025a8771e 100644
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
@@ -38,6 +38,8 @@
 #include <sys/wait.h>
 
 #include <liburing.h>
+#include <ynl.h>
+#include "netdev-user.h"
 
 #define SKIP_CODE	42
 
@@ -90,6 +92,8 @@ static int cfg_num_threads = 1;
 
 static char *payload;
 
+#define MAX_CONNS_PER_THREAD	64
+
 struct thread_ctx {
 	struct io_uring		ring;
 	void			*area_ptr;
@@ -97,9 +101,15 @@ struct thread_ctx {
 	size_t			ring_size;
 	struct io_uring_zcrx_rq	rq_ring;
 	unsigned long		area_token;
-	int			connfd;
-	bool			stop;
-	size_t			received;
+	int			queue_id;
+	int			napi_id;
+	pthread_barrier_t	*setup_done;
+	pthread_barrier_t	*dispatch_done;
+
+	int			connfds[MAX_CONNS_PER_THREAD];
+	size_t			received[MAX_CONNS_PER_THREAD];
+	int			oneshot_recvs[MAX_CONNS_PER_THREAD];
+	int			nr_conns;
 };
 
 static unsigned long gettimeofday_ms(void)
@@ -146,8 +156,8 @@ static inline size_t get_refill_ring_size(unsigned int rq_entries)
 
 static void setup_zcrx(struct thread_ctx *ctx)
 {
+	unsigned int rq_entries = AREA_SIZE / page_size;
 	unsigned int ifindex;
-	unsigned int rq_entries = 4096;
 	int ret;
 
 	ifindex = if_nametoindex(cfg_ifname);
@@ -199,7 +209,7 @@ static void setup_zcrx(struct thread_ctx *ctx)
 
 	struct t_io_uring_zcrx_ifq_reg reg = {
 		.if_idx = ifindex,
-		.if_rxq = cfg_queue_id,
+		.if_rxq = ctx->queue_id,
 		.rq_entries = rq_entries,
 		.area_ptr = (__u64)(unsigned long)&area_reg,
 		.region_ptr = (__u64)(unsigned long)&region_reg,
@@ -224,53 +234,32 @@ static void setup_zcrx(struct thread_ctx *ctx)
 	ctx->area_token = area_reg.rq_area_token;
 }
 
-static void add_accept(struct thread_ctx *ctx, int sockfd)
+static void add_recvzc(struct thread_ctx *ctx, int conn_idx)
 {
 	struct io_uring_sqe *sqe;
 
 	sqe = io_uring_get_sqe(&ctx->ring);
 
-	io_uring_prep_accept(sqe, sockfd, NULL, NULL, 0);
-	sqe->user_data = 1;
-}
-
-static void add_recvzc(struct thread_ctx *ctx, int sockfd)
-{
-	struct io_uring_sqe *sqe;
-
-	sqe = io_uring_get_sqe(&ctx->ring);
-
-	io_uring_prep_rw(IORING_OP_RECV_ZC, sqe, sockfd, NULL, 0, 0);
+	io_uring_prep_rw(IORING_OP_RECV_ZC, sqe, ctx->connfds[conn_idx],
+			 NULL, 0, 0);
 	sqe->ioprio |= IORING_RECV_MULTISHOT;
-	sqe->user_data = 2;
+	sqe->user_data = conn_idx;
 }
 
-static void add_recvzc_oneshot(struct thread_ctx *ctx, int sockfd, size_t len)
+static void add_recvzc_oneshot(struct thread_ctx *ctx, int conn_idx, size_t len)
 {
 	struct io_uring_sqe *sqe;
 
 	sqe = io_uring_get_sqe(&ctx->ring);
 
-	io_uring_prep_rw(IORING_OP_RECV_ZC, sqe, sockfd, NULL, len, 0);
+	io_uring_prep_rw(IORING_OP_RECV_ZC, sqe, ctx->connfds[conn_idx],
+			 NULL, len, 0);
 	sqe->ioprio |= IORING_RECV_MULTISHOT;
-	sqe->user_data = 2;
+	sqe->user_data = conn_idx;
 }
 
-static void process_accept(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
-{
-	if (cqe->res < 0)
-		error(1, 0, "accept()");
-	if (ctx->connfd)
-		error(1, 0, "Unexpected second connection");
-
-	ctx->connfd = cqe->res;
-	if (cfg_oneshot)
-		add_recvzc_oneshot(ctx, ctx->connfd, page_size);
-	else
-		add_recvzc(ctx, ctx->connfd);
-}
-
-static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
+static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe,
+			   int conn_idx)
 {
 	unsigned int rq_mask = ctx->rq_ring.ring_entries - 1;
 	struct io_uring_zcrx_cqe *rcqe;
@@ -280,8 +269,9 @@ static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
 	ssize_t n;
 	int i;
 
-	if (cqe->res == 0 && cqe->flags == 0 && cfg_oneshot_recvs == 0) {
-		ctx->stop = true;
+	if (cqe->res == 0 && cqe->flags == 0 &&
+	    ctx->oneshot_recvs[conn_idx] == 0) {
+		ctx->nr_conns--;
 		return;
 	}
 
@@ -289,12 +279,14 @@ static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
 		error(1, 0, "recvzc(): %d", cqe->res);
 
 	if (cfg_oneshot) {
-		if (cqe->res == 0 && cqe->flags == 0 && cfg_oneshot_recvs) {
-			add_recvzc_oneshot(ctx, ctx->connfd, page_size);
-			cfg_oneshot_recvs--;
+		if (cqe->res == 0 && cqe->flags == 0 &&
+		    ctx->oneshot_recvs[conn_idx]) {
+			add_recvzc_oneshot(ctx, conn_idx, page_size);
+			ctx->oneshot_recvs[conn_idx]--;
+			return;
 		}
 	} else if (!(cqe->flags & IORING_CQE_F_MORE)) {
-		add_recvzc(ctx, ctx->connfd);
+		add_recvzc(ctx, conn_idx);
 	}
 
 	rcqe = (struct io_uring_zcrx_cqe *)(cqe + 1);
@@ -304,10 +296,10 @@ static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
 	data = (char *)ctx->area_ptr + (rcqe->off & mask);
 
 	for (i = 0; i < n; i++) {
-		if (*(data + i) != payload[(ctx->received + i)])
+		if (*(data + i) != payload[(ctx->received[conn_idx] + i)])
 			error(1, 0, "payload mismatch at %d", i);
 	}
-	ctx->received += n;
+	ctx->received[conn_idx] += n;
 
 	rqe = &ctx->rq_ring.rqes[(ctx->rq_ring.rq_tail & rq_mask)];
 	rqe->off = (rcqe->off & ~IORING_ZCRX_AREA_MASK) | ctx->area_token;
@@ -320,28 +312,137 @@ static void server_loop(struct thread_ctx *ctx)
 	struct io_uring_cqe *cqe;
 	unsigned int count = 0;
 	unsigned int head;
-	int i, ret;
 
 	io_uring_submit_and_wait(&ctx->ring, 1);
 
 	io_uring_for_each_cqe(&ctx->ring, head, cqe) {
-		if (cqe->user_data == 1)
-			process_accept(ctx, cqe);
-		else if (cqe->user_data == 2)
-			process_recvzc(ctx, cqe);
-		else
-			error(1, 0, "unknown cqe");
+		process_recvzc(ctx, cqe, cqe->user_data);
 		count++;
 	}
 	io_uring_cq_advance(&ctx->ring, count);
 }
 
-static void run_server(void)
+static void *server_worker(void *arg)
 {
-	struct thread_ctx ctx = {};
-	unsigned int flags = 0;
-	int fd, enable, ret;
+	struct io_uring_params params = { };
+	struct thread_ctx *ctx = arg;
 	uint64_t tstop;
+	int nr_conns;
+	int i;
+
+	params.flags |= IORING_SETUP_COOP_TASKRUN;
+	params.flags |= IORING_SETUP_SINGLE_ISSUER;
+	params.flags |= IORING_SETUP_DEFER_TASKRUN;
+	params.flags |= IORING_SETUP_SUBMIT_ALL;
+	params.flags |= IORING_SETUP_CQE32;
+	params.flags |= IORING_SETUP_CQSIZE;
+	params.cq_entries = AREA_SIZE / page_size;
+
+	io_uring_queue_init_params(512, &ctx->ring, &params);
+	setup_zcrx(ctx);
+
+	if (cfg_dry_run)
+		return NULL;
+
+	pthread_barrier_wait(ctx->setup_done);
+	pthread_barrier_wait(ctx->dispatch_done);
+
+	nr_conns = ctx->nr_conns;
+
+	for (i = 0; i < ctx->nr_conns; i++) {
+		if (cfg_oneshot) {
+			ctx->oneshot_recvs[i] = cfg_oneshot_recvs;
+			add_recvzc_oneshot(ctx, i, page_size);
+		} else {
+			add_recvzc(ctx, i);
+		}
+	}
+
+	tstop = gettimeofday_ms() + 5000;
+	while (ctx->nr_conns > 0 && gettimeofday_ms() < tstop)
+		server_loop(ctx);
+
+	if (ctx->nr_conns != 0)
+		error(1, 0, "test failed: %d connections incomplete",
+		      ctx->nr_conns);
+
+	for (i = 0; i < nr_conns; i++) {
+		if (cfg_oneshot) {
+			if (!ctx->received[i])
+				error(1, 0, "connection %d received no data", i);
+		} else if (ctx->received[i] != (size_t)cfg_send_size) {
+			error(1, 0, "connection %d received %zu of %d bytes",
+			      i, ctx->received[i], cfg_send_size);
+		}
+	}
+
+	return NULL;
+}
+
+static int query_napi_id(unsigned int ifindex, int queue_id)
+{
+	struct netdev_queue_get_req *req;
+	struct netdev_queue_get_rsp *rsp;
+	struct ynl_error yerr;
+	struct ynl_sock *ys;
+	int napi_id;
+
+	ys = ynl_sock_create(&ynl_netdev_family, &yerr);
+	if (!ys)
+		error(1, 0, "ynl_sock_create: %s", yerr.msg);
+
+	req = netdev_queue_get_req_alloc();
+	netdev_queue_get_req_set_ifindex(req, ifindex);
+	netdev_queue_get_req_set_type(req, NETDEV_QUEUE_TYPE_RX);
+	netdev_queue_get_req_set_id(req, queue_id);
+
+	rsp = netdev_queue_get(ys, req);
+	if (!rsp)
+		error(1, 0, "netdev_queue_get(q=%d): %s", queue_id,
+		      ys->err.msg);
+	if (!rsp->_present.napi_id)
+		error(1, 0, "netdev_queue_get(q=%d): napi_id not present",
+		      queue_id);
+
+	napi_id = rsp->napi_id;
+
+	netdev_queue_get_req_free(req);
+	netdev_queue_get_rsp_free(rsp);
+	ynl_sock_destroy(ys);
+
+	return napi_id;
+}
+
+static int find_thread_by_conn(struct thread_ctx *ctxs, int connfd)
+{
+	socklen_t len = sizeof(int);
+	int napi_id, i;
+
+	if (getsockopt(connfd, SOL_SOCKET, SO_INCOMING_NAPI_ID, &napi_id, &len))
+		error(1, errno, "getsockopt(SO_INCOMING_NAPI_ID)");
+
+	for (i = 0; i < cfg_num_threads; i++) {
+		if (ctxs[i].napi_id == napi_id)
+			return i;
+	}
+
+	error(1, 0, "unknown NAPI ID: %d", napi_id);
+	return -1;
+}
+
+static void run_server(void)
+{
+	pthread_barrier_t setup_done, dispatch_done;
+	int total_conns, accepted = 0, connfd;
+	struct thread_ctx *ctxs;
+	int fd, ret, enable, i;
+	unsigned int ifindex;
+	pthread_t *threads;
+
+	ctxs = calloc(cfg_num_threads, sizeof(*ctxs));
+	threads = calloc(cfg_num_threads, sizeof(*threads));
+	if (!ctxs || !threads)
+		error(1, 0, "calloc()");
 
 	fd = socket(AF_INET6, SOCK_STREAM, 0);
 	if (fd == -1)
@@ -356,29 +457,68 @@ static void run_server(void)
 	if (ret < 0)
 		error(1, 0, "bind()");
 
-	flags |= IORING_SETUP_COOP_TASKRUN;
-	flags |= IORING_SETUP_SINGLE_ISSUER;
-	flags |= IORING_SETUP_DEFER_TASKRUN;
-	flags |= IORING_SETUP_SUBMIT_ALL;
-	flags |= IORING_SETUP_CQE32;
+	pthread_barrier_init(&setup_done, NULL, cfg_num_threads + 1);
+	pthread_barrier_init(&dispatch_done, NULL, cfg_num_threads + 1);
 
-	io_uring_queue_init(512, &ctx.ring, flags);
+	for (i = 0; i < cfg_num_threads; i++) {
+		ctxs[i].queue_id = cfg_queue_id + i;
+		ctxs[i].setup_done = &setup_done;
+		ctxs[i].dispatch_done = &dispatch_done;
+	}
+
+	for (i = 0; i < cfg_num_threads; i++) {
+		ret = pthread_create(&threads[i], NULL,
+				     server_worker, &ctxs[i]);
+		if (ret)
+			error(1, ret, "pthread_create()");
+	}
 
-	setup_zcrx(&ctx);
 	if (cfg_dry_run)
-		return;
+		goto join;
+
+	pthread_barrier_wait(&setup_done);
 
 	if (listen(fd, 1024) < 0)
 		error(1, 0, "listen()");
 
-	add_accept(&ctx, fd);
+	if (cfg_num_threads > 1) {
+		ifindex = if_nametoindex(cfg_ifname);
+		if (!ifindex)
+			error(1, 0, "bad interface name: %s", cfg_ifname);
+		for (i = 0; i < cfg_num_threads; i++)
+			ctxs[i].napi_id = query_napi_id(ifindex,
+							ctxs[i].queue_id);
+	}
 
-	tstop = gettimeofday_ms() + 5000;
-	while (!ctx.stop && gettimeofday_ms() < tstop)
-		server_loop(&ctx);
+	total_conns = cfg_num_threads * cfg_num_threads;
+
+	while (accepted < total_conns) {
+		int idx = 0;
+
+		connfd = accept(fd, NULL, NULL);
+		if (connfd < 0)
+			error(1, errno, "accept()");
 
-	if (!ctx.stop)
-		error(1, 0, "test failed\n");
+		if (cfg_num_threads > 1)
+			idx = find_thread_by_conn(ctxs, connfd);
+
+		if (ctxs[idx].nr_conns >= MAX_CONNS_PER_THREAD)
+			error(1, 0, "worker %d connection overflow", idx);
+		ctxs[idx].connfds[ctxs[idx].nr_conns++] = connfd;
+		accepted++;
+	}
+
+	pthread_barrier_wait(&dispatch_done);
+
+join:
+	for (i = 0; i < cfg_num_threads; i++)
+		pthread_join(threads[i], NULL);
+
+	pthread_barrier_destroy(&setup_done);
+	pthread_barrier_destroy(&dispatch_done);
+	close(fd);
+	free(threads);
+	free(ctxs);
 }
 
 static void *client_worker(void *arg)

-- 
2.50.1


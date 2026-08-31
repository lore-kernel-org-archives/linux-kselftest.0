Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3054A3BE631;
	Mon, 31 Aug 2026 17:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197714; cv=none; b=R83dfVsyUw2GvBlhZC18eGLbjOrIdI9Ni3719RtJfHy37YwPGdR/wAGH5uxh032/h9ewB7s26eefALIBzON0AHfqJTQw45wgKR3X6wl5gcyIaCoC0/ae6jxVepFqvrsoIDdd6+m35nBnuQLBxWSKMVLgp7Pn8KkJTHcyH+mwZSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197714; c=relaxed/simple;
	bh=xLCE8Kuj9dovNKPEMSHmEarO76mTLGB0Dpq5UhMAiq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VkUmRsBBi3f7XfSzJIj/IP+RfxbZcQraEkWgke9E8qKIcHCL5+NPzt7uMRfapKqM7iuFzgJkk/G3/kAuVIBYVHZrVxXmJxFu5bjYkh8RNyCLgtheZ/5/nM5hZmN1Fsa/pPbBNyJbehnP/WMvIJhiRJ+mzE6oyL/bOlhK9Ww2Z6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=HZuLRu4Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i9WZMOKG; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="HZuLRu4Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i9WZMOKG"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 41F9AEC020E;
	Mon, 31 Aug 2026 13:35:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 31 Aug 2026 13:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788197711;
	 x=1788284111; bh=eaNL8hyaxT1y3CjXq3GhutXkgbRGGEaFe4AygAITepg=; b=
	HZuLRu4ZuwDASuFqF/WDz5sNSmTKH720dCd00P1TuXcLkF4He7rxadrGkGBTn8SD
	Bsmo4HphxHLze3z7AADhPUK+PD38YIR4Yqw1ooJHewzhlIxXGYL8XOnX0IJzmU4X
	ox6Wc2Z0Gymic4wM965tQ85SLYv6hhTaONZtMAdAWyOCjlXZYPz4YVO/BeGH8hIT
	j5DhhYkDmXcuoXJ8m8uaGPYw7jN72shxr6raHdC7UVV4Wp8UWRJOMQoSTYhHq0K9
	18hX3iBnDy+tX9+DyIj9JDacEJ+e7olz/p2255hvDzCp95Zxq0WQxJRWeuTemW8r
	hFNw+s1ioYaT/A0z3C5SKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1788197711; x=
	1788284111; bh=eaNL8hyaxT1y3CjXq3GhutXkgbRGGEaFe4AygAITepg=; b=i
	9WZMOKGGswJnAHUk6cI1lgZTpKjHLaMbO8MN16CBlMKE6BJAHnEtBJh5ed/KMoI5
	ioF5Ds/zyppni1+nFfeajAgApkImbiZCTOJGBdrwNFNq6luj2zSMzy4J21QPPsgQ
	A7PFHjbeWkH3V8LsH/ffvy4fNi8/qTcq5Vy6sR0Yr8NzkjXhdiKvjRzpcqH6QYfI
	B/55YZya1jkrAnLM8dsQpRbJsT5K6AYrPRyXUuJMm+w41eAhVzoF7jnmbBPWZYqD
	tu9xN9mg2+pqpmrBkqxOlzJ6MXyl+ltYLw5HKSnEpCBKq0demO2ChaAyFq3cjJvl
	gtl17+Wy7wkw8KSRZQjKA==
X-ME-Sender: <xms:T7uVakDPkd2e-LHfTojj3TX38RB7WbDXivKCkItSHye7PibtAQg_6w>
    <xme:T7uVauvOuqhTeUSHBFn4lkgvluRZKolVX_qwGnqRpt3rmWdKAAfNWoNcijMgN6KKt
    0fJ-QuujB0v60qTd0EWffv3wFaB43V3h52M0lIotrkjVw78COx11JSd>
X-ME-Received: <xmr:T7uVajL-j8HtWlq4uef5-vavnEGWWr0I3v48TQqGlrVzaLSv3ClYJul-3d5p8q9sxEVSBqTDEx2wjEmx6COzMHH5f1vzIQ>
X-ME-Proxy-Cause: dmFkZTEp27eOetQrqTmJC5SHiFfUBMTmNliYS5usWCzbYkapLLUT52hl/N0MEbDKvhqySC
    qb98TYqpPMc1L/YY7qg+ez+FKPHclEYBCAPi4LkD2FgZwMQJ1vvcuEdHHSMyatCrytrnqZ
    qqnvWMlkn2zCaM/cdj3BkyqZs/wgMZ4RfB7zCw8rNpd620DMYF/hW05Abczi/uQaSelA5p
    pL/P6TP9nSvEgS7w6mv0XtKLh1EQFIiqynWSHx/A0q+tznPq8O/R7BfF9kUkpjnhmD1Rp+
    Laxp4qnByQrRpHvji8O28xVYzSgBWD42NVZH+GTr4mQD/t4TfIFYfV2f1E2ZJLdo2aR7UH
    IdbLp8QZDsPNmPTep301jIgASfjDNe4iDdh66z4ZZMvtwustYFDEbHyiBjl+QNRhhFT6L7
    Ik14mfRdF2Mgp9DD8mT+ZeBiSo9/vXCme+qkyj1ENntifuy+LaOZiO9avjculq/kDz4kdj
    zagSia/gPsXP9qoeFz5ye4UActgDa+V8063kcc59lj7Hl31uyn2PndyqJKxy/wBFtsgGtO
    g96suIK4U06++yEoreanSV9mgXoMgYQkKhqf9FmoZfhK0Sk7x9OEup5Y8hfjEAVrv/ypGg
    W+EfPNp51cX/n9kDW6RSt4mEmpGMRdL2weHZB2wDmIjbDo1ahvU9sPgsnvBg
X-ME-Proxy: <xmx:T7uValatQN0V4GqQFdks_PpnNfFnCtDzRsrdu7cxjl9jLbgTP4iasw>
    <xmx:T7uValBV26b1pcS4mWR7g7Drd0QG3vGf8NoQBR9QR9h7sf1Pmi3Cfw>
    <xmx:T7uVavYFrhYe--CudIXy2KV83zBhHX_EcLgNuBmS6888WrD5UkePUw>
    <xmx:T7uVatmoBqSivxvrK4g3WEVYxcWpPltLq0xQLN3lspqsNld_nKXXYA>
    <xmx:T7uValKyOJGj2rua7sGsnbFmn6TCM4Utk-2oKBoIbx6zu57OGFidQCMe>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 13:35:10 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Mon, 31 Aug 2026 12:34:41 -0500
Subject: [PATCH net-next v6 5/6] selftests: net: add multithread server
 support to iou-zcrx
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-iou-zcrx-v6-5-02d1d012f0fd@fastmail.com>
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
In-Reply-To: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12202; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=xLCE8Kuj9dovNKPEMSHmEarO76mTLGB0Dpq5UhMAiq8=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFlTd3tpV/IGnN3uIHbxrEzO6orOdZsnz3i99u/lD1EPL
 jup3fXZ3DGRhUGMi8FSTJHF46VIi8bUisa7qhGCMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEy1hSDD//yHR08mv7+ezxx7Py/8PNs2g7PBWU0LH75LmmTrxRqWLs3wv0LP58d
 Bu1aV04cNdnF+/jL509P4PYxCGxc+FxFgmCjylgkA
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
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 263 ++++++++++++++++------
 2 files changed, 196 insertions(+), 72 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 37023ba580de..f613c88fffc5 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -13,10 +13,6 @@ else
 $(warning excluding iouring tests, liburing not installed or too old)
 endif
 
-TEST_GEN_FILES := \
-	$(COND_GEN_FILES) \
-# end of TEST_GEN_FILES
-
 TEST_PROGS = \
 	csum.py \
 	devlink_rate_cross_esw.py \
@@ -74,6 +70,7 @@ TEST_INCLUDES := \
 YNL_GEN_FILES := \
 	ncdevmem \
 	toeplitz \
+	$(COND_GEN_FILES) \
 # end of YNL_GEN_FILES
 TEST_GEN_FILES += $(YNL_GEN_FILES)
 TEST_GEN_FILES += $(patsubst %.c,%.o,$(wildcard *.bpf.c))
diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index f793a6c04e41..29905cb3b243 100644
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
@@ -320,28 +312,124 @@ static void server_loop(struct thread_ctx *ctx)
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
@@ -356,29 +444,68 @@ static void run_server(void)
 	if (ret < 0)
 		error(1, 0, "bind()");
 
-	flags |= IORING_SETUP_COOP_TASKRUN;
-	flags |= IORING_SETUP_SINGLE_ISSUER;
-	flags |= IORING_SETUP_DEFER_TASKRUN;
-	flags |= IORING_SETUP_SUBMIT_ALL;
-	flags |= IORING_SETUP_CQE32;
+	pthread_barrier_init(&setup_done, NULL, cfg_num_threads + 1);
+	pthread_barrier_init(&dispatch_done, NULL, cfg_num_threads + 1);
+
+	for (i = 0; i < cfg_num_threads; i++) {
+		ctxs[i].queue_id = cfg_queue_id + i;
+		ctxs[i].setup_done = &setup_done;
+		ctxs[i].dispatch_done = &dispatch_done;
+	}
 
-	io_uring_queue_init(512, &ctx.ring, flags);
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
 
 	if (listen(fd, 1024) < 0)
 		error(1, 0, "listen()");
 
-	add_accept(&ctx, fd);
+	pthread_barrier_wait(&setup_done);
 
-	tstop = gettimeofday_ms() + 5000;
-	while (!ctx.stop && gettimeofday_ms() < tstop)
-		server_loop(&ctx);
+	if (cfg_num_threads > 1) {
+		ifindex = if_nametoindex(cfg_ifname);
+		if (!ifindex)
+			error(1, 0, "bad interface name: %s", cfg_ifname);
+		for (i = 0; i < cfg_num_threads; i++)
+			ctxs[i].napi_id = query_napi_id(ifindex,
+							ctxs[i].queue_id);
+	}
+
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


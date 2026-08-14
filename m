Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6005330BB8A;
	Fri, 14 Aug 2026 01:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670653; cv=none; b=KZ6P0izUkDvnoig0KB/pm6Hxrokg80cjp4hgNkpfVaw1JPGWTblPxeW+eUruehkg9cjUpoVIkgj9Kq5Ki3L72w2TNTxgOUXpIKvb+wGf3SeEynBCcaqfiuK4vka8H1UNtx5VtBXlzDO4tJBGDbqVApoxm7TWXsggg3ZoopHHPU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670653; c=relaxed/simple;
	bh=lm7tP/MI8jTGE0bDgS19j+jpDgaR99C/xxfzfA99Yfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csy0lmWZO6CJFbfcx1GB8Y9hb57D+aqP4Tik87PtFmqpNvEF0yFcdZMuZaJAMdW3Gk03vkKSXMziLa0ArEN8B8TZV4RjaVtZ9VxRBjvSLRauSpsFRmmTwLnFxjVhyr3wnA+c20WBxh0hXLkEP6pN3r0dIHCPR6A0t7BNZEcsyW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=lsdVsz7h; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l+OIk4eY; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="lsdVsz7h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l+OIk4eY"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7F1497A0173;
	Thu, 13 Aug 2026 21:24:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 13 Aug 2026 21:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786670640; x=
	1786757040; bh=YD53kWyId63F2OwSI2bl+nEdpALFJL/gzrCxuCBPERg=; b=l
	sdVsz7h8UJPWZmxHdiLVsltsZUG+r10DyLRIhIqZyIH7NjNgU0fjtvQTywnAbYa7
	NA2OVfppnYvFOBwSEMUvmex3PoFblAtvow2eAOUOoIrB8YVSpNYeLgTSMhjSrcyQ
	ITOCpB/Ry88nYTCXsnl4M8+p7wlCR0Zl/Lpe2dH5eKYh+D1yk3pXGXVaTAhMFXP9
	WMTEI9AvLZG7f2iRzqXE7TTx5Fexb6vePkdRgjcZe4uF4fbSwxT613LWADEI5h8m
	ijKXbfbfo2qoRP4HiMb940J/y3ylaqWYBLJ9enSVOhQrnd2+UoC6S7lakZbDJrpN
	0m4zhsJj4xmqvIdn+ZH+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786670640; x=1786757040; bh=Y
	D53kWyId63F2OwSI2bl+nEdpALFJL/gzrCxuCBPERg=; b=l+OIk4eYHrljb/0rB
	PdqS8X6QGCrlT0l331yukGMHSRLj5lte6nDPp90OLzk1KOaLUUSLNSzlQF0dE68+
	IZBY574DW0i4ueS4+trPGQPpiEiZv35C0bXFelWs/oiPfeSFBMqhnDLQfjkO1GS+
	4XJBJO6oN4eVj70Mozp6ZBwtYE+e2yNxsrj3essd6tD0AJqEjUeQZuKfvfHHV/xl
	nuJ34RSG+aZagDlhx8Jbbub1SwZYeEWQObRMwFfKkXXMLH0YJKgWgXJl1CC3xPDQ
	U09pt1tFANXxd3KDd4HWLsZDkiiy+uwnl+iVFwELjsz3LK2IS+3EG/5JTrxUAfQN
	HCZFw==
X-ME-Sender: <xms:MG5-aqZLGdqxUl9mCcUIG4hBg-Op6SvgULtlZMWcwIAGdFHs_RiWEQ>
    <xme:MG5-allqNgoxqE-PH7yGsMLvCb5Y6TFCmNlzVA61czP284saGGKY4QxofvCkpMQUf
    PO4fjq3HSs7pwdD5Hnb528sBqoZL8NjB8BAvmFTTPv5aOjO5e3OHS0>
X-ME-Received: <xmr:MG5-aggAPv6Cq9sIzmR-jxHtjRm-1ewaHcBXcgi1y50L9m24qNL3zJV7BHoGQZoHsxRkTif2eDdF8X0c-IFs71bVXgbSvOM>
X-ME-Proxy-Cause: dmFkZTEm22De8ExjFQylpDaiwWPsj5UCBWcTiW8VSFtTxcd6DQsif/Q5uZX/68BEELxHbF
    9VL3TL1IqvF5ntXobI2WW3MOEpGRFfamwLo/wpTnxOYmN7ZXjqxzqtjGjIghxkLoKgqcde
    QPoOMaE37nHLjG459U4VH0F4UpJg9Uu7GB++Bs6TY5nsmUHvvI+qELVqqeZ9Z27Evvo5Y7
    4TQw/2EuVuymM0bYdmaMXY7mryuPj6akSkzc4asecrlitNxL1LvgtMmo7hEg+Y7f7/mWZ+
    +V4CzSxUQeZFzanVg7gCfxkG1FRxGTq2OYQxe2tO5CIicEWBE8aAlDjxRfn5g0rMpaJYmc
    qIGlSxqUABWndhBMPVlJBWJFftk8oCOKLD/xgCZc4is94ZjH1oJ+taOCOsAVYiBjksz39P
    flfJiZdLe9ogfliw9xSmyd+eEH74ETJeC9nm6iRBLFXpLFxiH+zQ+clsl4dD1mptfHRwM+
    W92PIpTHhvWoMM361LzpIKgJaqeLiw1c+jLW4sPMqDX6bKmjP1eCCNXCJMi3Af6F/JBo2f
    kHXtxSLKO2/8fAziFRrIsEFItMP3cYaYlQLafyJhjlL6vWQuLG7XVPWhKuwEO+4i9hFY6E
    5fDcyiPQz89qez53Ay3VM4FuuH/7Crmj/Wveac72clBbvB7cV7+QeUhst33g
X-ME-Proxy: <xmx:MG5-anS5RU5JENCs1QGCRYBfrHEhP8oQmxBgJNXpCS-7ifAG0m3QwQ>
    <xmx:MG5-ahZyjH47HK8D_Kp_7qABmAcnzv15sQQLnQfxq9YIxAnLtT1f2A>
    <xmx:MG5-akQqeUc3spjmu0kBr18a7Je29n6rBnOsTTqJS9HnCIdkxiMCEA>
    <xmx:MG5-ag8yCwkIgTcpAbz-6fkPte0BkeegQWfBHGzfqvZClpRJ2OtrXw>
    <xmx:MG5-arT0X_aPnlJoV_VZe9NVxZ8mOAAywCBKO1daaos_QTf32ofLvD3d>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 21:23:59 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
To: netdev@vger.kernel.org,
	dw@davidwei.uk
Cc: io-uring@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	asml.silence@gmail.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	Juanlu Herrero <juanlu@fastmail.com>
Subject: [PATCH net-next v5 5/6] selftests: net: add multithread server support to iou-zcrx
Date: Thu, 13 Aug 2026 20:23:47 -0500
Message-ID: <20260814012348.46958-6-juanlu@fastmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814012348.46958-1-juanlu@fastmail.com>
References: <20260814012348.46958-1-juanlu@fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Run the iou-zcrx server as N worker threads, each owning one receive
queue with its own io_uring and zero-copy receive (zcrx) ifq, so the
test can exercise multi-queue zero-copy receive.

The main thread owns the listening socket, accepts connections, and
dispatches each to the worker owning the queue it landed on by matching
SO_INCOMING_NAPI_ID against per-queue NAPI IDs.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 .../testing/selftests/drivers/net/hw/Makefile |   5 +-
 .../selftests/drivers/net/hw/iou-zcrx.c       | 262 +++++++++++++-----
 2 files changed, 195 insertions(+), 72 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 37023ba580de7..f613c88fffc53 100644
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
index f793a6c04e412..008d3f4b76263 100644
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
 
@@ -289,12 +279,13 @@ static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
 		error(1, 0, "recvzc(): %d", cqe->res);
 
 	if (cfg_oneshot) {
-		if (cqe->res == 0 && cqe->flags == 0 && cfg_oneshot_recvs) {
-			add_recvzc_oneshot(ctx, ctx->connfd, page_size);
-			cfg_oneshot_recvs--;
+		if (cqe->res == 0 && cqe->flags == 0 &&
+		    ctx->oneshot_recvs[conn_idx]) {
+			add_recvzc_oneshot(ctx, conn_idx, page_size);
+			ctx->oneshot_recvs[conn_idx]--;
 		}
 	} else if (!(cqe->flags & IORING_CQE_F_MORE)) {
-		add_recvzc(ctx, ctx->connfd);
+		add_recvzc(ctx, conn_idx);
 	}
 
 	rcqe = (struct io_uring_zcrx_cqe *)(cqe + 1);
@@ -304,10 +295,10 @@ static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
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
@@ -320,28 +311,124 @@ static void server_loop(struct thread_ctx *ctx)
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
@@ -356,29 +443,68 @@ static void run_server(void)
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
2.53.0-Meta


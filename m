Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A10E3CD8C9;
	Wed,  9 Sep 2026 19:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983502; cv=none; b=dWt1iJu7+dxDH1CG1NOCd8oglcudgtSmNKt2Kkh6k+utVZ+EIKdULBiOaB0P9ThCfdEYYE322zk9Um4zxy0ME9fyR4iHnCL8oLBx5pU9hYXTaNJgx84wIGdNKQVCxhxWDbHKSJ1DTeZdOlNnOwTMcTJ7YnewouaKMmm6mZYHjRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983502; c=relaxed/simple;
	bh=V5x5X2nHvvvZQCsSoOWemQ5m72sWuJ8qNxbbVbklroY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REutB05lCeNVHFtrOG0qV6ZgLefVJgws/ccuccoCZzJgeP+Uo5g2rm27oQd1tZm1JlxPxaS4FPH+CYxz0tvHwo8aGY0aqjbrU5vCQEVIHQxh8oufNy9q1lDf4jmPiirKKi3wvmtOcqsQQ5uYe6WZ1v1Tebcvo/4bFJCVWqBs2gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=eQqZmVKJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AtU1WJDp; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="eQqZmVKJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AtU1WJDp"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 978851D000D6;
	Wed,  9 Sep 2026 15:51:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 09 Sep 2026 15:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1788983498;
	 x=1789069898; bh=Tny55NvM/7lMtt+PbOywShwYrqDkMtQcT8Jq6pCvGAE=; b=
	eQqZmVKJrFFoUUsnX0QaC4ZbVJ6b6TMVqOdHc6vGW927czX0cZ6THU+RcbZp9Koq
	NbemItWJ3LCmaHXgfajCZX/tWnf2gAemSliEOYg+BYi1us9CiQK4QGD8tlhEWUYQ
	DZ8aXBO13UCLrWb7GArhStUCXNVUVJs9jY1xyQa6RMwzBzeg88Cr/LQdm5SSedgK
	So+gRxxOfCLCj1tlwUaUsnlX+kbaHhKxJ/b6mH8cwtU4GHMZEapV8nsQ1yd7Cdt5
	cEWocKtBoBD+3tzitPtDEFEJJmCOUPSbSj8KqkkJ/So210sWG7lNBu5N/5jRhB1b
	Fiuy/yWnBeNS7H5aopfrbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788983498; x=
	1789069898; bh=Tny55NvM/7lMtt+PbOywShwYrqDkMtQcT8Jq6pCvGAE=; b=A
	tU1WJDpsEBNoFYd11uPLANdZzUnF4QWLwvTMxSTxBSwUJgzKv+eqaHpzkAo3lEpf
	86KBMr8qQM33aPkXd34r8nFC7uKK2R94ZY5MTTdKL4FFsHyOXYWDpjKkf0G7r2/+
	vPv0MGcf7VI0XmsBZG2sDyHaTThEzq/CvppGk9xBcH6HrZanW/esA8LUPgqKipHG
	J0c1E1Vlw5KGuDltFu+ZdDi2vI/k8PYxn2P4htOGWgUQt0GtEtxKiratsQfPvVTG
	iJ4ygSHcyjNG+tZ1C52VqIGB9CLQrlY7OVToqur3Wwrfo2E9q0+Uec+ahqEuMR4n
	oEdUfqVORB8ZKvECdMSYw==
X-ME-Sender: <xms:yrihag9DoGYtcDhluNGtf2lA0kf7lwrCrYs66Aajc3H-GX4lXCAIHA>
    <xme:yrihag4YwkRZIdR8JAjwvacIKkHoko1DuSa4ltMR-GiD-xs_OeVvMtxwPRLEO2STs
    N9UtSngVrRPfhvYBD8hkB_dKjtO3aU1v-0YUfxRdPVCM2itdKJcOQjv>
X-ME-Received: <xmr:yrihahmUo4KU107UPzeWv1MNS3QKqbowyYK616E1jyMQAnH_-suv6j7QQMOb4eTF>
X-ME-Proxy-Cause: dmFkZTErJXQT89xdNSpbfG162S52xmEnv9hkTSgvQMpTW0DT7OWpo1xulYU1WJr+H/t/6c
    YxU8mCV7tzNTPWCtrK+C0aefe9D+fIiG8Zwe3e5360Kmzo6PwgnF4zLkhYIqtiFcLHNz8k
    8kG/AdTFqH4mn1i25MWHJD6Y7FW4VS4FnquBG5AbU1b3tpmwsfwuSnobwaN1Xelf708tGu
    KesOufeEfTmdIFrM5T122D4yfOMT2EDLVwpbyJSpx2lsVxxQ6YIaPR83tP7tJog5tFdC3x
    3PPTA3Dgs+0xXrQrjzcZsH/7nbizYjypIVUt9+dLhSQqBsJNdG+VtoaGxFw6+6Yqq+AbbX
    YN7nioXxXtKm4B180V3G0w8CulK+WBz0AXXk75T0dDqzj5kzkKv+dSOxZOXJAEUm9QV/E6
    F8GA1kWWdrAS6WV8gsnfQNY7zoN762HIkD/fE4xv67zZOAeHH+zLzQV6IJEI32ODSRfmmF
    fvZkKRHTt/P5tp138KNLG78kPrQAABSD50SJm+Zi4q272ur1cAUaFCmqA2iSVpetymZQqM
    zv3dnvXl1L3od0Ukk4nVRZqwGZ9f6ScHKrHsnxStK96CVlHyPjgrkgo9fLqZEiy2aFE74n
    CrxBpoU4jrBU/8ltvJL5NqbDDgb3/LB8mytT1X8whqsEV8+GVo0eYJyb7YiA
X-ME-Proxy: <xmx:yriharEKOS4vlI8XEwvVGnLGUjK-6y1rcc_1RYKj5BHITWqs7_uM2A>
    <xmx:yrihag_XXj5qlz2xl_u6XbUR3q7YnwhznzEdmdzUlQGxSdq7O_FIuA>
    <xmx:yrihakneUf6gUGE9Ohky63VFlIyjOb3KgDak_zcqcRrDckwnTEs-qA>
    <xmx:yrihajBWqN8YY4IFmNtv-IY9q-8yGTiJi8cPzD0MaLM2yxzikSEJNw>
    <xmx:yrihaik16jcNdpelZlTVtVHm7wsMeuB3xpJZDRRQNOHQgKGY2fwodo1z>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 15:51:37 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Wed, 09 Sep 2026 14:51:25 -0500
Subject: [PATCH net-next v7 3/6] selftests: net: refactor server state into
 struct thread_ctx
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-iou-zcrx-v7-3-6b5d48a2a922@fastmail.com>
References: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
In-Reply-To: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10208; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=V5x5X2nHvvvZQCsSoOWemQ5m72sWuJ8qNxbbVbklroY=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFkLdxx57TUtNi4m23fP60c83TzfT3ssXvH/c/QFb7sS6
 yMdZ/86dUxkYRDjYrAUU2TxeCnSojG1ovGuaoQgzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFP9O52R4X6/6o3CnU9iNdMnaVjZXbl0b1+f66RJ5yR6Pxf9PBnNncHwz27nXY3
 uze/NlF9+/nGCL9Vi8uEFswLivyXMS9ZdtOf4Vh4A
X-Developer-Key: i=juanlu@fastmail.com; a=openpgp;
 fpr=48E9148428957881DD2558116FF739276A6BB0D9

Move server-side state (io_uring ring, zcrx area, refill ring, receive
tracking) from global variables into a local struct thread_ctx. This is
a pure refactor with no behavior change: run_server still allocates a
single context on the stack and runs single-threaded, using io_uring
accept and recvzc as before.

This prepares the ground for the multithread server support in the
following commits, which spawns N worker threads each with their own
struct thread_ctx.

Assisted-by: Claude:claude-opus-4-8
Reviewed-by: David Wei <dw@davidwei.uk>
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 156 +++++++++++-----------
 1 file changed, 80 insertions(+), 76 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index c6dbd0ad5368..9b62fd0703e6 100644
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
@@ -87,14 +87,18 @@ static unsigned int cfg_rx_buf_len;
 static bool cfg_dry_run;
 
 static char *payload;
-static void *area_ptr;
-static void *ring_ptr;
-static size_t ring_size;
-static struct io_uring_zcrx_rq rq_ring;
-static unsigned long area_token;
-static int connfd;
-static bool stop;
-static size_t received;
+
+struct thread_ctx {
+	struct io_uring		ring;
+	void			*area_ptr;
+	void			*ring_ptr;
+	size_t			ring_size;
+	struct io_uring_zcrx_rq	rq_ring;
+	unsigned long		area_token;
+	int			connfd;
+	bool			stop;
+	size_t			received;
+};
 
 static unsigned long gettimeofday_ms(void)
 {
@@ -138,7 +142,7 @@ static inline size_t get_refill_ring_size(unsigned int rq_entries)
 	return ALIGN_UP(size, page_size);
 }
 
-static void setup_zcrx(struct io_uring *ring)
+static void setup_zcrx(struct thread_ctx *ctx)
 {
 	unsigned int ifindex;
 	unsigned int rq_entries = 4096;
@@ -149,44 +153,44 @@ static void setup_zcrx(struct io_uring *ring)
 		error(1, 0, "bad interface name: %s", cfg_ifname);
 
 	if (cfg_rx_buf_len && cfg_rx_buf_len != page_size) {
-		area_ptr = mmap(NULL,
-				AREA_SIZE,
-				PROT_READ | PROT_WRITE,
-				MAP_ANONYMOUS | MAP_PRIVATE |
-				MAP_HUGETLB | MAP_HUGE_2MB,
-				-1,
-				0);
-		if (area_ptr == MAP_FAILED) {
+		ctx->area_ptr = mmap(NULL,
+				     AREA_SIZE,
+				     PROT_READ | PROT_WRITE,
+				     MAP_ANONYMOUS | MAP_PRIVATE |
+				     MAP_HUGETLB | MAP_HUGE_2MB,
+				     -1,
+				     0);
+		if (ctx->area_ptr == MAP_FAILED) {
 			printf("Can't allocate huge pages\n");
 			exit(SKIP_CODE);
 		}
 	} else {
-		area_ptr = mmap(NULL,
-				AREA_SIZE,
-				PROT_READ | PROT_WRITE,
-				MAP_ANONYMOUS | MAP_PRIVATE,
-				0,
-				0);
-		if (area_ptr == MAP_FAILED)
+		ctx->area_ptr = mmap(NULL,
+				     AREA_SIZE,
+				     PROT_READ | PROT_WRITE,
+				     MAP_ANONYMOUS | MAP_PRIVATE,
+				     0,
+				     0);
+		if (ctx->area_ptr == MAP_FAILED)
 			error(1, 0, "mmap(): zero copy area");
 	}
 
-	ring_size = get_refill_ring_size(rq_entries);
-	ring_ptr = mmap(NULL,
-			ring_size,
-			PROT_READ | PROT_WRITE,
-			MAP_ANONYMOUS | MAP_PRIVATE,
-			0,
-			0);
+	ctx->ring_size = get_refill_ring_size(rq_entries);
+	ctx->ring_ptr = mmap(NULL,
+			     ctx->ring_size,
+			     PROT_READ | PROT_WRITE,
+			     MAP_ANONYMOUS | MAP_PRIVATE,
+			     0,
+			     0);
 
 	struct io_uring_region_desc region_reg = {
-		.size = ring_size,
-		.user_addr = (__u64)(unsigned long)ring_ptr,
+		.size = ctx->ring_size,
+		.user_addr = (__u64)(unsigned long)ctx->ring_ptr,
 		.flags = IORING_MEM_REGION_TYPE_USER,
 	};
 
 	struct io_uring_zcrx_area_reg area_reg = {
-		.addr = (__u64)(unsigned long)area_ptr,
+		.addr = (__u64)(unsigned long)ctx->area_ptr,
 		.len = AREA_SIZE,
 		.flags = 0,
 	};
@@ -200,7 +204,7 @@ static void setup_zcrx(struct io_uring *ring)
 		.rx_buf_len = cfg_rx_buf_len,
 	};
 
-	ret = io_uring_register_ifq(ring, (void *)&reg);
+	ret = io_uring_register_ifq(&ctx->ring, (void *)&reg);
 	if (cfg_rx_buf_len && (ret == -EINVAL || ret == -EOPNOTSUPP ||
 			       ret == -ERANGE)) {
 		printf("Large chunks are not supported %i\n", ret);
@@ -209,64 +213,64 @@ static void setup_zcrx(struct io_uring *ring)
 		error(1, 0, "io_uring_register_ifq(): %d", ret);
 	}
 
-	rq_ring.khead = (unsigned int *)((char *)ring_ptr + reg.offsets.head);
-	rq_ring.ktail = (unsigned int *)((char *)ring_ptr + reg.offsets.tail);
-	rq_ring.rqes = (struct io_uring_zcrx_rqe *)((char *)ring_ptr + reg.offsets.rqes);
-	rq_ring.rq_tail = 0;
-	rq_ring.ring_entries = reg.rq_entries;
+	ctx->rq_ring.khead = (unsigned int *)((char *)ctx->ring_ptr + reg.offsets.head);
+	ctx->rq_ring.ktail = (unsigned int *)((char *)ctx->ring_ptr + reg.offsets.tail);
+	ctx->rq_ring.rqes = (struct io_uring_zcrx_rqe *)((char *)ctx->ring_ptr + reg.offsets.rqes);
+	ctx->rq_ring.rq_tail = 0;
+	ctx->rq_ring.ring_entries = reg.rq_entries;
 
-	area_token = area_reg.rq_area_token;
+	ctx->area_token = area_reg.rq_area_token;
 }
 
-static void add_accept(struct io_uring *ring, int sockfd)
+static void add_accept(struct thread_ctx *ctx, int sockfd)
 {
 	struct io_uring_sqe *sqe;
 
-	sqe = io_uring_get_sqe(ring);
+	sqe = io_uring_get_sqe(&ctx->ring);
 
 	io_uring_prep_accept(sqe, sockfd, NULL, NULL, 0);
 	sqe->user_data = 1;
 }
 
-static void add_recvzc(struct io_uring *ring, int sockfd)
+static void add_recvzc(struct thread_ctx *ctx, int sockfd)
 {
 	struct io_uring_sqe *sqe;
 
-	sqe = io_uring_get_sqe(ring);
+	sqe = io_uring_get_sqe(&ctx->ring);
 
 	io_uring_prep_rw(IORING_OP_RECV_ZC, sqe, sockfd, NULL, 0, 0);
 	sqe->ioprio |= IORING_RECV_MULTISHOT;
 	sqe->user_data = 2;
 }
 
-static void add_recvzc_oneshot(struct io_uring *ring, int sockfd, size_t len)
+static void add_recvzc_oneshot(struct thread_ctx *ctx, int sockfd, size_t len)
 {
 	struct io_uring_sqe *sqe;
 
-	sqe = io_uring_get_sqe(ring);
+	sqe = io_uring_get_sqe(&ctx->ring);
 
 	io_uring_prep_rw(IORING_OP_RECV_ZC, sqe, sockfd, NULL, len, 0);
 	sqe->ioprio |= IORING_RECV_MULTISHOT;
 	sqe->user_data = 2;
 }
 
-static void process_accept(struct io_uring *ring, struct io_uring_cqe *cqe)
+static void process_accept(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
 {
 	if (cqe->res < 0)
 		error(1, 0, "accept()");
-	if (connfd)
+	if (ctx->connfd)
 		error(1, 0, "Unexpected second connection");
 
-	connfd = cqe->res;
+	ctx->connfd = cqe->res;
 	if (cfg_oneshot)
-		add_recvzc_oneshot(ring, connfd, page_size);
+		add_recvzc_oneshot(ctx, ctx->connfd, page_size);
 	else
-		add_recvzc(ring, connfd);
+		add_recvzc(ctx, ctx->connfd);
 }
 
-static void process_recvzc(struct io_uring *ring, struct io_uring_cqe *cqe)
+static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
 {
-	unsigned rq_mask = rq_ring.ring_entries - 1;
+	unsigned int rq_mask = ctx->rq_ring.ring_entries - 1;
 	struct io_uring_zcrx_cqe *rcqe;
 	struct io_uring_zcrx_rqe *rqe;
 	uint64_t mask;
@@ -275,7 +279,7 @@ static void process_recvzc(struct io_uring *ring, struct io_uring_cqe *cqe)
 	int i;
 
 	if (cqe->res == 0 && cqe->flags == 0 && cfg_oneshot_recvs == 0) {
-		stop = true;
+		ctx->stop = true;
 		return;
 	}
 
@@ -284,56 +288,56 @@ static void process_recvzc(struct io_uring *ring, struct io_uring_cqe *cqe)
 
 	if (cfg_oneshot) {
 		if (cqe->res == 0 && cqe->flags == 0 && cfg_oneshot_recvs) {
-			add_recvzc_oneshot(ring, connfd, page_size);
+			add_recvzc_oneshot(ctx, ctx->connfd, page_size);
 			cfg_oneshot_recvs--;
 		}
 	} else if (!(cqe->flags & IORING_CQE_F_MORE)) {
-		add_recvzc(ring, connfd);
+		add_recvzc(ctx, ctx->connfd);
 	}
 
 	rcqe = (struct io_uring_zcrx_cqe *)(cqe + 1);
 
 	n = cqe->res;
 	mask = (1ULL << IORING_ZCRX_AREA_SHIFT) - 1;
-	data = (char *)area_ptr + (rcqe->off & mask);
+	data = (char *)ctx->area_ptr + (rcqe->off & mask);
 
 	for (i = 0; i < n; i++) {
-		if (*(data + i) != payload[(received + i)])
+		if (*(data + i) != payload[(ctx->received + i)])
 			error(1, 0, "payload mismatch at %d", i);
 	}
-	received += n;
+	ctx->received += n;
 
-	rqe = &rq_ring.rqes[(rq_ring.rq_tail & rq_mask)];
-	rqe->off = (rcqe->off & ~IORING_ZCRX_AREA_MASK) | area_token;
+	rqe = &ctx->rq_ring.rqes[(ctx->rq_ring.rq_tail & rq_mask)];
+	rqe->off = (rcqe->off & ~IORING_ZCRX_AREA_MASK) | ctx->area_token;
 	rqe->len = cqe->res;
-	io_uring_smp_store_release(rq_ring.ktail, ++rq_ring.rq_tail);
+	io_uring_smp_store_release(ctx->rq_ring.ktail, ++ctx->rq_ring.rq_tail);
 }
 
-static void server_loop(struct io_uring *ring)
+static void server_loop(struct thread_ctx *ctx)
 {
 	struct io_uring_cqe *cqe;
 	unsigned int count = 0;
 	unsigned int head;
 	int i, ret;
 
-	io_uring_submit_and_wait(ring, 1);
+	io_uring_submit_and_wait(&ctx->ring, 1);
 
-	io_uring_for_each_cqe(ring, head, cqe) {
+	io_uring_for_each_cqe(&ctx->ring, head, cqe) {
 		if (cqe->user_data == 1)
-			process_accept(ring, cqe);
+			process_accept(ctx, cqe);
 		else if (cqe->user_data == 2)
-			process_recvzc(ring, cqe);
+			process_recvzc(ctx, cqe);
 		else
 			error(1, 0, "unknown cqe");
 		count++;
 	}
-	io_uring_cq_advance(ring, count);
+	io_uring_cq_advance(&ctx->ring, count);
 }
 
 static void run_server(void)
 {
+	struct thread_ctx ctx = {};
 	unsigned int flags = 0;
-	struct io_uring ring;
 	int fd, enable, ret;
 	uint64_t tstop;
 
@@ -356,22 +360,22 @@ static void run_server(void)
 	flags |= IORING_SETUP_SUBMIT_ALL;
 	flags |= IORING_SETUP_CQE32;
 
-	io_uring_queue_init(512, &ring, flags);
+	io_uring_queue_init(512, &ctx.ring, flags);
 
-	setup_zcrx(&ring);
+	setup_zcrx(&ctx);
 	if (cfg_dry_run)
 		return;
 
 	if (listen(fd, 1024) < 0)
 		error(1, 0, "listen()");
 
-	add_accept(&ring, fd);
+	add_accept(&ctx, fd);
 
 	tstop = gettimeofday_ms() + 5000;
-	while (!stop && gettimeofday_ms() < tstop)
-		server_loop(&ring);
+	while (!ctx.stop && gettimeofday_ms() < tstop)
+		server_loop(&ctx);
 
-	if (!stop)
+	if (!ctx.stop)
 		error(1, 0, "test failed\n");
 }
 

-- 
2.50.1


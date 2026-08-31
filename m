Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548343B83E1;
	Mon, 31 Aug 2026 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197712; cv=none; b=DFZhV4r3z1jbsyuRwH1T1hZ1RG+C4yfAj020jgvkA1T5TIbpwiOXXuG+b1EQT7fQE6LfLXc+z5/qOI/UWpEHUW/q5javb1r7O8R1CL0MZnqhnuuiMFNXNK6mZtfPRbc/6FJuWkx8eipZavo/CFHjApM7xWGISkSuIwhTTjKDMxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197712; c=relaxed/simple;
	bh=V5x5X2nHvvvZQCsSoOWemQ5m72sWuJ8qNxbbVbklroY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/14/ZAdcy52HUu2dX8JPM59LRClmwqVHbv/wlpwDBILPF6UQZdJlKGcE7S8wRJqNz+qdOaejyXw7b0uQ41X1gb80tiM/P0elLXjF9Jp6xy1rx9fnXKtybGPjeHiDyt5tgi82YWAj5rP1n40XQE9lziDccJUaobLRzVwE1J6AA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=YMBFmqFk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M9PMylyR; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="YMBFmqFk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M9PMylyR"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8A15A1400141;
	Mon, 31 Aug 2026 13:35:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 31 Aug 2026 13:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788197709;
	 x=1788284109; bh=Tny55NvM/7lMtt+PbOywShwYrqDkMtQcT8Jq6pCvGAE=; b=
	YMBFmqFkklfHWqhSfkt5Fwegx0SDjgXkCcsw3v4bflVe/H3l0JzRqfxbHAlJs+jR
	l3Zf/LGJLGTM4e4rDbjKLFGl190Zq/+SWe+fpeq0fpa4AVqx0woafL9cKjuM0Ptp
	ufAibDzVNAneyOnfWwulmiWwxuSdDQx1Ptr8AnM9LCpXxBnCvdlyvYQbMdpWenXj
	DYJte31M2RdObKj+sJwwgF+iA2l9rObZP2QUT47nDuR2gfC0NZEXd9BLRLj7qrpH
	sgwr1RDsIaa5PQbYp2gCkomIrYa9vrKehs0mHKgceJe4Yo5KatjFUhyXOUIHEmQy
	9GARnApALeEsRvyZnkNVzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1788197709; x=
	1788284109; bh=Tny55NvM/7lMtt+PbOywShwYrqDkMtQcT8Jq6pCvGAE=; b=M
	9PMylyRC0b48CdN+V3zVjOSM4inOP16urV1azUP4o/lccLAVVYjAuNnHL0kcUy8u
	QUzZgnN5As9Vy8UDHVcRUinqUMShRvAggu8BZvv9emkA3Do74OK2ype4ntFj3Uch
	WSD5wba3Jv2K+ZOHZ5cqR87HbIUZGTPwtukuaH97jqLebIjm4hzUXYXCu+owaifC
	EVkb26KcQYpMsSW/8w49jcTeDMeBGSDdg7LC6pEMi26QOE69tv43VbwD8DK6FQrN
	StWuTksQ22W31XMbhPk09e4bHO0dAfJmyHnmK5Zn3ASHRmnwnJwn6EfoskxKmNpK
	fepGz2ZAjio3gTyy3hkYA==
X-ME-Sender: <xms:TbuValr3_AYIkactO5HAK_xcZt5ZfvuKhSlNYSrFL5ElxUxSwz0_9g>
    <xme:TbuVav09WhVAISYWmBBnCtT3ckFvG8yJjTyBnVxLAXpTRnu1bqDbzgUvG6cu_O9ks
    BMFrx6oqIZpFOwSfr25cFjvscgHP8yi8t7dbErjLPTuahsYYFOY8SI>
X-ME-Received: <xmr:TbuVatx01D9d1SMFD_EqlFUQXmasZ5nTP1I1qUMyvKdSiBhuMXBJXT7HAA0yLAk7e74Nfn7_eNG1RJ6kBF6276EReMEjJQ>
X-ME-Proxy-Cause: dmFkZTEp27eOetQrqTmJC5SHiFfUBMTmNliYS5usWCzbYkapLLUT52hl/N0MEbDKvhqySC
    qb98TYqpPMc1L/YY7qg+ez+FKPHclEYBCAPi4LkD2FgZwMQJ1vvcuEdHHSMyatCrytrnqZ
    qqnvWMlkn2zCaM/cdj3BkyqZs/wgMZ4RfB7zCw8rNpd620DMYF/hW05Abczi/uQaSelA5p
    pL/P6TP9nSvEgS7w6mv0XtKLh1EQFIiqynWSHx/A0q+tznPq8O/R7BfF9kUkpjnhmD1Rp+
    Laxp4qnByQrRpHvji8O28xVYzSgBWD42NVZH+GTr4mQD/t4TfIFYfV2f1E2ZJLdo2aR7b2
    GZ1s32XryOW0UATzYmS3V52orI2Z/MgHaxej2I4gYCVu+0qBk9uYBVeTrJqmmTQsvDFh19
    LFJU/zJU+c9LaEPQE3aYtsNKqSAP5X3o60rfzaW9i3Ib/r77M+x23MmGLzH2+BCTO0b8Vr
    voCeJVGD4peZ4cLQ/o801ONaCGHBTK9/4CilNOHKTmc9/h+uho/TL1V8/y05olhl1hZdlp
    TDHvOtZnNX8KHnJ79PGZKgriZxhF3a4U3WrJ8HzozD6ODWN3oxmxFoRWY9cJol6Ccxn+3s
    2BLsXkCoUxNsyhySge5i3d4yLvh2byYkw75Lu9ET4jM0mEYJUSLUeqtal9Sw
X-ME-Proxy: <xmx:TbuVarjvu_NDOkLapMsL1ebhqUXmefXIb_j1EK2_Le3m8NZKTAlu_Q>
    <xmx:TbuVagqlUiXw3ITBQHpZIwcm1VgaeAEZJYBXiJ7zcnlJYvDMzTOO-w>
    <xmx:TbuVaigUlOzUnSMazwSu2Sxzi_N0_0GRT-c_0qBcn8IQ9zG1Ewg8hA>
    <xmx:TbuVaiOg09k1ObituSbqoNQxxAvl1aVkQlWx6g206LEKuKRSKa1Mhw>
    <xmx:TbuVapzKW6bMr7B4Uc6l_gzSUS8Og5-LDCiSUVOFFtr3TncK6GaOy76o>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 13:35:08 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Mon, 31 Aug 2026 12:34:39 -0500
Subject: [PATCH net-next v6 3/6] selftests: net: refactor server state into
 struct thread_ctx
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-iou-zcrx-v6-3-02d1d012f0fd@fastmail.com>
References: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
In-Reply-To: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10208; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=V5x5X2nHvvvZQCsSoOWemQ5m72sWuJ8qNxbbVbklroY=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFlTd3vmJt4OU9Suf722q31L78yFFyrTTa+/d96qcutb/
 W7J781fOyayMIhxMViKKbJ4vBRp0Zha0XhXNUIQZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKluEGT479s3p+TAVU/jhQ9XVZrplLzTrX2nl2LzSyTBVdXNZfm5XYwMU6JFIj0
 +mqkZOS1e3Cy9ct1HZnPJN6urj7TWNdz9eoyTFQA=
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


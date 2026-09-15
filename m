Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DE634CFC5;
	Tue, 15 Sep 2026 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496496; cv=none; b=jklunzA/c0TmxNM1dxnsXW6BHwyjGHBLYorWOlB64ZsJYpBMPh5FcXbPLrvgC8n555COHXMqMJik2ZTDD9726mpYUuyqtbYt+puZ6NlPYGDRQ9Gwa7rJSM+fL7kQjeaelA2cTbUP0Poj32tYCbgyNdvKkRbeFboUISXUhh+vMXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496496; c=relaxed/simple;
	bh=XRYXCQfWIjDw5bx4tdU2eOo0jTbznHXbhRj2biZwt8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbHJ5U+rpK0egqAAur6lHDXg4oRsqR5ZNxWuHaaxlabFP76bcu6CPq7dgHJ2eQ8HJXMKFDVn2Y9PAABS8j21847y8jkjkYf8peP8SZ0n4k+Pz536DYzrXv0jWjbkd0Xod8OtttXOu+/kTI1XNRQWsXprjxPOSIA0Jw6mqlaVVYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=neftiFQJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="neftiFQJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471BF1F000FF;
	Tue, 15 Sep 2026 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496494;
	bh=p043FqupHzdNqZPcZN3Qe1HchTLFLCDKGpseJpLlxvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=neftiFQJlMF9YkLFR+DjG3/aDqbhM3eTXLDClRP9F1X2yp7s+Zq3Sl7X40QZiLnTF
	 Z+wNYi0AVvQdhxAx6O883I7UynS+C17E9OXxvLcSsn2AQXWkLUGHmaUW5HjWdgDeNb
	 pxRvbQlR92iT4xHrCvoTyOQ+1lbZsMQWo9igW5Wh91BEUytNHgK4d4wkCznPCZJ0am
	 UEVGkqNBOes1CxGosTHjOaZKlcl+hrF4cAd76bGcJYIAWclgyShYbjZFT7m6vmWXiq
	 zHWVsRmOUXs1rbTyfJyfgi8xbWVLptclEQtdZuIyvzWkuWM/349weJKgqVlvSQck4z
	 hDCOHKE3SOHVQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Tao Cui <cuitao@kylinos.cn>,
	Pavel Begunkov <asml.silence@gmail.com>,
	David Wei <dw@davidwei.uk>
Subject: [PATCH net-next v3 2/5] fbnic: Track BDQ device-page geometry per ring
Date: Tue, 15 Sep 2026 20:21:00 +0200
Message-ID: <20260915182105.4162425-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915182105.4162425-1-bjorn@kernel.org>
References: <20260915182105.4162425-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fbnic derives the BDQ buffer layout from PAGE_SIZE. That decides at
build time how a posted page is split into 4 KiB device pages, and
uses the same completion decoding for HPQ and PPQ. That is wrong once
the queues use different posted-page sizes; completions must be
decoded with the geometry of the queue that produced them.

Keep PAGE_SIZE as the posted-page size for both queues in this change,
so the descriptor format and runtime behavior stay unchanged.

Signed-off-by: Björn Töpel <bjorn@kernel.org>
---
 drivers/net/ethernet/meta/fbnic/fbnic_csr.h   | 34 ++------
 .../net/ethernet/meta/fbnic/fbnic_debugfs.c   |  5 +-
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  | 83 ++++++++++++-------
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.h  |  6 ++
 4 files changed, 72 insertions(+), 56 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_csr.h b/drivers/net/ethernet/meta/fbnic/fbnic_csr.h
index 64b958df7774..2b9f8644b132 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_csr.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_csr.h
@@ -109,34 +109,19 @@ enum {
 
 /* Rx Buffer Descriptor Format
  *
- * The layout of this can vary depending on the page size of the system.
+ * Buffer descriptors describe 4 KiB device pages. A posted page larger than
+ * 4 KiB is represented by consecutive device-page descriptors.
  *
- * If the page size is 4K then the layout will simply consist of ID for
- * the 16 most significant bits, and the lower 46 are essentially the page
- * address with the lowest 12 bits being reserved 0 due to the fact that
- * a page will be aligned.
- *
- * If the page size is larger than 4K then the lower n bits of the ID and
- * page address will be reserved for the fragment ID. This fragment will
- * be 4K in size and will be used to index both the DMA address and the ID
- * by the same amount.
+ * The address field stores the 4 KiB-aligned DMA address. The ID field stores
+ * the software page ID, with the low n bits used as the device-page ID when a
+ * posted page spans multiple device pages. The driver increments both the
+ * address and ID by one device page for each descriptor belonging to a posted
+ * page.
  */
 #define FBNIC_BD_DESC_ADDR_MASK			DESC_GENMASK(45, 12)
 #define FBNIC_BD_DESC_ID_MASK			DESC_GENMASK(63, 48)
-#define FBNIC_BD_FRAG_SIZE \
+#define FBNIC_BD_PAGE_SIZE \
 	(FBNIC_BD_DESC_ADDR_MASK & ~(FBNIC_BD_DESC_ADDR_MASK - 1))
-#define FBNIC_BD_FRAG_COUNT \
-	(PAGE_SIZE / FBNIC_BD_FRAG_SIZE)
-#define FBNIC_BD_FRAG_ADDR_MASK \
-	(FBNIC_BD_DESC_ADDR_MASK & \
-	 ~(FBNIC_BD_DESC_ADDR_MASK * FBNIC_BD_FRAG_COUNT))
-#define FBNIC_BD_FRAG_ID_MASK \
-	(FBNIC_BD_DESC_ID_MASK & \
-	 ~(FBNIC_BD_DESC_ID_MASK * FBNIC_BD_FRAG_COUNT))
-#define FBNIC_BD_PAGE_ADDR_MASK \
-	(FBNIC_BD_DESC_ADDR_MASK & ~FBNIC_BD_FRAG_ADDR_MASK)
-#define FBNIC_BD_PAGE_ID_MASK \
-	(FBNIC_BD_DESC_ID_MASK & ~FBNIC_BD_FRAG_ID_MASK)
 
 /* Rx Completion Queue Descriptors */
 #define FBNIC_RCD_TYPE_MASK			DESC_GENMASK(62, 61)
@@ -151,9 +136,6 @@ enum {
 
 /* Address/Length Completion Descriptors */
 #define FBNIC_RCD_AL_BUFF_ID_MASK		DESC_GENMASK(15, 0)
-#define FBNIC_RCD_AL_BUFF_FRAG_MASK		(FBNIC_BD_FRAG_COUNT - 1)
-#define FBNIC_RCD_AL_BUFF_PAGE_MASK \
-	(FBNIC_RCD_AL_BUFF_ID_MASK & ~FBNIC_RCD_AL_BUFF_FRAG_MASK)
 #define FBNIC_RCD_AL_BUFF_LEN_MASK		DESC_GENMASK(28, 16)
 #define FBNIC_RCD_AL_BUFF_OFF_MASK		DESC_GENMASK(43, 32)
 #define FBNIC_RCD_AL_PAGE_FIN			DESC_BIT(60)
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_debugfs.c b/drivers/net/ethernet/meta/fbnic/fbnic_debugfs.c
index 3c4563c8f403..7f23a0f97e63 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_debugfs.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_debugfs.c
@@ -181,8 +181,8 @@ static int fbnic_dbg_tcq_desc_seq_show(struct seq_file *s, void *v)
 static int fbnic_dbg_bdq_desc_seq_show(struct seq_file *s, void *v)
 {
 	struct fbnic_ring *ring = s->private;
+	unsigned int i, desc_count;
 	char hdr[80];
-	int i;
 
 	/* Generate header on first entry */
 	fbnic_dbg_ring_show(s);
@@ -197,7 +197,8 @@ static int fbnic_dbg_bdq_desc_seq_show(struct seq_file *s, void *v)
 		return 0;
 	}
 
-	for (i = 0; i < (ring->size_mask + 1) * FBNIC_BD_FRAG_COUNT; i++) {
+	desc_count = (ring->size_mask + 1) * fbnic_bd_page_count(ring);
+	for (i = 0; i < desc_count; i++) {
 		u64 bd = le64_to_cpu(ring->desc[i]);
 
 		seq_printf(s, "%04x %#04llx %#014llx\n", i,
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 4cf87b39829d..fef51d454102 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -872,19 +872,31 @@ static void fbnic_clean_bdq(struct fbnic_ring *ring, unsigned int hw_head,
 	ring->head = head;
 }
 
+static u16 fbnic_rcd_bd_idx(const struct fbnic_ring *bdq, u64 rcd)
+{
+	return FIELD_GET(FBNIC_RCD_AL_BUFF_ID_MASK, rcd) >> bdq->bd_page_shift;
+}
+
+static unsigned int fbnic_rcd_bd_page_offset(const struct fbnic_ring *bdq,
+					     u64 rcd)
+{
+	u16 id = FIELD_GET(FBNIC_RCD_AL_BUFF_ID_MASK, rcd);
+	u16 page_id = id & (fbnic_bd_page_count(bdq) - 1);
+
+	return page_id * FBNIC_BD_PAGE_SIZE;
+}
+
 static void fbnic_bd_prep(struct fbnic_ring *bdq, u16 id, netmem_ref netmem)
 {
-	__le64 *bdq_desc = &bdq->desc[id * FBNIC_BD_FRAG_COUNT];
+	__le64 *bdq_desc = &bdq->desc[id * fbnic_bd_page_count(bdq)];
 	dma_addr_t dma = page_pool_get_dma_addr_netmem(netmem);
-	u64 bd, i = FBNIC_BD_FRAG_COUNT;
+	u64 bd, i = fbnic_bd_page_count(bdq);
 
-	bd = (FBNIC_BD_PAGE_ADDR_MASK & dma) |
-	     FIELD_PREP(FBNIC_BD_PAGE_ID_MASK, id);
+	bd = (FBNIC_BD_DESC_ADDR_MASK & dma) |
+	     FIELD_PREP(FBNIC_BD_DESC_ID_MASK, (u64)id << bdq->bd_page_shift);
 
-	/* In the case that a page size is larger than 4K we will map a
-	 * single page to multiple fragments. The fragments will be
-	 * FBNIC_BD_FRAG_COUNT in size and the lower n bits will be use
-	 * to indicate the individual fragment IDs.
+	/* Posted pages larger than 4 KiB use consecutive device-page IDs in
+	 * the low bits of the software page ID.
 	 */
 	do {
 		*bdq_desc = cpu_to_le64(bd);
@@ -929,7 +941,7 @@ static void fbnic_fill_bdq(struct fbnic_ring *bdq)
 		/* Force DMA writes to flush before writing to tail */
 		dma_wmb();
 
-		writel(i * FBNIC_BD_FRAG_COUNT, bdq->doorbell);
+		writel(i * fbnic_bd_page_count(bdq), bdq->doorbell);
 	}
 }
 
@@ -960,26 +972,27 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
 			      struct fbnic_pkt_buff *pkt,
 			      struct fbnic_q_triad *qt)
 {
-	unsigned int hdr_pg_idx = FIELD_GET(FBNIC_RCD_AL_BUFF_PAGE_MASK, rcd);
 	unsigned int hdr_pg_off = FIELD_GET(FBNIC_RCD_AL_BUFF_OFF_MASK, rcd);
-	struct page *page = fbnic_page_pool_get_head(qt, hdr_pg_idx);
 	unsigned int len = FIELD_GET(FBNIC_RCD_AL_BUFF_LEN_MASK, rcd);
+	unsigned int hdr_pg_idx = fbnic_rcd_bd_idx(&qt->sub0, rcd);
 	unsigned int frame_sz, hdr_pg_start, hdr_pg_end, headroom;
 	unsigned char *hdr_start;
+	struct page *page;
 
 	/* data_hard_start should always be NULL when this is called */
 	WARN_ON_ONCE(pkt->buff.data_hard_start);
 
+	page = fbnic_page_pool_get_head(qt, hdr_pg_idx);
+
 	/* Short-cut the end calculation if we know page is fully consumed */
 	hdr_pg_end = FIELD_GET(FBNIC_RCD_AL_PAGE_FIN, rcd) ?
-		     FBNIC_BD_FRAG_SIZE : fbnic_hdr_pg_end(hdr_pg_off, len);
+		     FBNIC_BD_PAGE_SIZE : fbnic_hdr_pg_end(hdr_pg_off, len);
 	hdr_pg_start = fbnic_hdr_pg_start(hdr_pg_off);
 
 	headroom = hdr_pg_off - hdr_pg_start + FBNIC_RX_PAD;
 	frame_sz = hdr_pg_end - hdr_pg_start;
 	xdp_init_buff(&pkt->buff, frame_sz, &qt->xdp_rxq);
-	hdr_pg_start += (FBNIC_RCD_AL_BUFF_FRAG_MASK & rcd) *
-			FBNIC_BD_FRAG_SIZE;
+	hdr_pg_start += fbnic_rcd_bd_page_offset(&qt->sub0, rcd);
 
 	/* Sync DMA buffer */
 	dma_sync_single_range_for_cpu(nv->dev, page_pool_get_dma_addr(page),
@@ -1000,18 +1013,19 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
 			      struct fbnic_pkt_buff *pkt,
 			      struct fbnic_q_triad *qt)
 {
-	unsigned int pg_idx = FIELD_GET(FBNIC_RCD_AL_BUFF_PAGE_MASK, rcd);
 	unsigned int pg_off = FIELD_GET(FBNIC_RCD_AL_BUFF_OFF_MASK, rcd);
 	unsigned int len = FIELD_GET(FBNIC_RCD_AL_BUFF_LEN_MASK, rcd);
-	netmem_ref netmem = fbnic_page_pool_get_data(qt, pg_idx);
+	unsigned int pg_idx = fbnic_rcd_bd_idx(&qt->sub1, rcd);
 	unsigned int truesize;
+	netmem_ref netmem;
 	bool added;
 
-	truesize = FIELD_GET(FBNIC_RCD_AL_PAGE_FIN, rcd) ?
-		   FBNIC_BD_FRAG_SIZE - pg_off : ALIGN(len, 128);
+	netmem = fbnic_page_pool_get_data(qt, pg_idx);
 
-	pg_off += (FBNIC_RCD_AL_BUFF_FRAG_MASK & rcd) *
-		  FBNIC_BD_FRAG_SIZE;
+	truesize = FIELD_GET(FBNIC_RCD_AL_PAGE_FIN, rcd) ?
+		   FBNIC_BD_PAGE_SIZE - pg_off : ALIGN(len, 128);
+
+	pg_off += fbnic_rcd_bd_page_offset(&qt->sub1, rcd);
 
 	/* Sync DMA buffer */
 	page_pool_dma_sync_netmem_for_cpu(qt->sub1.page_pool, netmem,
@@ -1258,12 +1272,12 @@ static int fbnic_clean_rcq(struct fbnic_napi_vector *nv,
 
 		switch (FIELD_GET(FBNIC_RCD_TYPE_MASK, rcd)) {
 		case FBNIC_RCD_TYPE_HDR_AL:
-			head0 = FIELD_GET(FBNIC_RCD_AL_BUFF_PAGE_MASK, rcd);
+			head0 = fbnic_rcd_bd_idx(&qt->sub0, rcd);
 			fbnic_pkt_prepare(nv, rcd, pkt, qt);
 
 			break;
 		case FBNIC_RCD_TYPE_PAY_AL:
-			head1 = FIELD_GET(FBNIC_RCD_AL_BUFF_PAGE_MASK, rcd);
+			head1 = fbnic_rcd_bd_idx(&qt->sub1, rcd);
 			fbnic_add_rx_frag(nv, rcd, pkt, qt);
 
 			break;
@@ -1604,6 +1618,16 @@ fbnic_alloc_qt_page_pools(struct fbnic_net *fbn, struct fbnic_q_triad *qt,
 	return PTR_ERR(pp);
 }
 
+static u8 fbnic_bdq_page_shift(u32 page_size)
+{
+	return ilog2(page_size / FBNIC_BD_PAGE_SIZE);
+}
+
+static void fbnic_bdq_set_page_size(struct fbnic_ring *bdq, u32 page_size)
+{
+	bdq->bd_page_shift = fbnic_bdq_page_shift(page_size);
+}
+
 static void fbnic_ring_init(struct fbnic_ring *ring, u32 __iomem *doorbell,
 			    int q_idx, u8 flags)
 {
@@ -1611,6 +1635,7 @@ static void fbnic_ring_init(struct fbnic_ring *ring, u32 __iomem *doorbell,
 	ring->doorbell = doorbell;
 	ring->q_idx = q_idx;
 	ring->flags = flags;
+	fbnic_bdq_set_page_size(ring, PAGE_SIZE);
 	ring->deferred_head = -1;
 }
 
@@ -1895,12 +1920,12 @@ static int fbnic_alloc_rx_ring_desc(struct fbnic_net *fbn,
 
 	switch (rxr->doorbell - fbnic_ring_csr_base(rxr)) {
 	case FBNIC_QUEUE_BDQ_HPQ_TAIL:
-		rxq_size = fbn->hpq_size / FBNIC_BD_FRAG_COUNT;
-		desc_size *= FBNIC_BD_FRAG_COUNT;
+		rxq_size = fbn->hpq_size / fbnic_bd_page_count(rxr);
+		desc_size *= fbnic_bd_page_count(rxr);
 		break;
 	case FBNIC_QUEUE_BDQ_PPQ_TAIL:
-		rxq_size = fbn->ppq_size / FBNIC_BD_FRAG_COUNT;
-		desc_size *= FBNIC_BD_FRAG_COUNT;
+		rxq_size = fbn->ppq_size / fbnic_bd_page_count(rxr);
+		desc_size *= fbnic_bd_page_count(rxr);
 		break;
 	case FBNIC_QUEUE_RCQ_HEAD:
 		rxq_size = fbn->rcq_size;
@@ -2566,7 +2591,7 @@ static void fbnic_enable_bdq(struct fbnic_ring *hpq, struct fbnic_ring *ppq)
 	hpq->tail = 0;
 	hpq->head = 0;
 
-	log_size = fls(hpq->size_mask) + ilog2(FBNIC_BD_FRAG_COUNT);
+	log_size = fls(hpq->size_mask) + hpq->bd_page_shift;
 
 	/* Store descriptor ring address and size */
 	fbnic_ring_wr32(hpq, FBNIC_QUEUE_BDQ_HPQ_BAL, lower_32_bits(hpq->dma));
@@ -2578,7 +2603,7 @@ static void fbnic_enable_bdq(struct fbnic_ring *hpq, struct fbnic_ring *ppq)
 	if (!ppq->size_mask)
 		goto write_ctl;
 
-	log_size = fls(ppq->size_mask) + ilog2(FBNIC_BD_FRAG_COUNT);
+	log_size = fls(ppq->size_mask) + ppq->bd_page_shift;
 
 	/* Add enabling of PPQ to BDQ control */
 	bdq_ctl |= FBNIC_QUEUE_BDQ_CTL_PPQ_ENABLE;
@@ -2863,8 +2888,10 @@ static int fbnic_queue_mem_alloc(struct net_device *dev,
 
 	fbnic_ring_init(&qt->sub0, real->sub0.doorbell, real->sub0.q_idx,
 			real->sub0.flags);
+	qt->sub0.bd_page_shift = real->sub0.bd_page_shift;
 	fbnic_ring_init(&qt->sub1, real->sub1.doorbell, real->sub1.q_idx,
 			real->sub1.flags);
+	qt->sub1.bd_page_shift = real->sub1.bd_page_shift;
 	fbnic_ring_init(&qt->cmpl, real->cmpl.doorbell, real->cmpl.q_idx,
 			real->cmpl.flags);
 
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h
index 98bb73765587..1f4e9150f2ef 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h
@@ -131,6 +131,7 @@ struct fbnic_ring {
 	u16 size_mask;			/* Size of ring in descriptors - 1 */
 	u8 q_idx;			/* Logical netdev ring index */
 	u8 flags;			/* Ring flags (FBNIC_RING_F_*) */
+	u8 bd_page_shift;		/* BDQ: ilog2(page_size / 4096) */
 
 	u32 head, tail;			/* Head/Tail of ring */
 
@@ -172,6 +173,11 @@ struct fbnic_napi_vector {
 
 extern const struct netdev_queue_mgmt_ops fbnic_queue_mgmt_ops;
 
+static inline u16 fbnic_bd_page_count(const struct fbnic_ring *bdq)
+{
+	return 1U << bdq->bd_page_shift;
+}
+
 netdev_tx_t fbnic_xmit_frame(struct sk_buff *skb, struct net_device *dev);
 netdev_features_t
 fbnic_features_check(struct sk_buff *skb, struct net_device *dev,
-- 
2.55.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB670576EB3;
	Thu, 10 Sep 2026 18:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063791; cv=none; b=TkObBrEqLGem/Q8IGBMRBB/IG0or0WnQ3mv8dxl2x4GLTULnxtJiwoLlYGmyKQUR2qFh3zAqsPsAfVcBekII1YMxwW9RQpSYpdUEKWhP1RORMSfd7zUIyvyMij+lyhV/uXKcgCaJAe8ubEtkHOQvnJ0rG0JLcjb6/Yjjke8IPf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063791; c=relaxed/simple;
	bh=sZa9nUo7GWRdbbbuX7Xm0T+s+CXjr+TdOMHiDkK0v1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WP8icwjJIxWZtW34ujAvK/X8efuaK41hcd/LNQEQv+fYUS4iwzBOqgZzdcQKzOIqcZRhJSVrPe8tsABGZa+4Hi2EPWjrRwyklpjE4rPnHzS8k/4cVfi/cxzYiVtCIOC7p2fOOZmTsutK68QoEI/c4uMPCFlC82obfKx4T9MTyiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDWZrxWm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDWZrxWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875481F00893;
	Thu, 10 Sep 2026 18:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789063782;
	bh=EEf/YWzFHZGKhM2Jy30+UZPxNnpabVz+Ru9kLig3LpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BDWZrxWmaGPU2Ss2z8cNmu1Ymbj0DLHxuFbSH3PNuw5A7T3aAVgq2nBP6XIqHT4vg
	 hbWGYXmwsfTUmdv4e9eFxzGPDeXadN0sP/d3K9JWPDY/v6edfwEigQxFllBlf2SRau
	 MvkHRsXUGUdcpn9YXdK5Q1FM6GXfLU09sA4fB+ExgN7HpfMRuULqQLqe4cEH5Weu/F
	 R2Wc+N6AWrQgZ6T1YQXG2AMvl8+OpRxnyMo0GEYamVPQSq6T+w1wF4dNsbn4xhKf3E
	 Y2csL0jJX4EDbELVzNcvKmd3VyiDS9qf+oPoogMxtg0ywZzUCpWnOxD9/ZIKKN9d5T
	 q1UcjmIx4/Zgg==
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
Subject: [PATCH net-next v2 4/5] fbnic: Support larger memory-provider RX pages
Date: Thu, 10 Sep 2026 20:09:04 +0200
Message-ID: <20260910180908.1506533-5-bjorn@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910180908.1506533-1-bjorn@kernel.org>
References: <20260910180908.1506533-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Memory providers can set the receive page size for a queue through
QCFG_RX_PAGE_SIZE. fbnic creates PAGE_SIZE PPQ page-pool allocations,
so larger rx_buf_len values are not reflected in the PPQ BDQ geometry.

Use the rendered rx_page_size for PPQ allocations and completion
decoding. The NIC still consumes 4 KiB device pages; a larger PPQ page
is represented by consecutive device-page descriptors, and completion
IDs decode to offsets within the same netmem allocation.

Validate rx_page_size against fbnic's fragment-reference budget,
device-page geometry, and rendered PPQ depth. The page size must be a
power-of-two of at least one device page, its worst-case payload
fragment count must fit the page-pool reference bias, and the PPQ must
retain usable software depth after expansion.

Signed-off-by: Björn Töpel <bjorn@kernel.org>
---
 .../net/ethernet/meta/fbnic/fbnic_ethtool.c   |  8 +-
 .../net/ethernet/meta/fbnic/fbnic_netdev.c    |  5 ++
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  | 88 +++++++++++++++++--
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.h  |  6 ++
 4 files changed, 94 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
index 0e47088ec44b..2def4c26207d 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
@@ -334,10 +334,10 @@ fbnic_set_ringparam(struct net_device *netdev, struct ethtool_ringparam *ring,
 	struct fbnic_net *clone;
 	int err;
 
-	ring->rx_pending	= roundup_pow_of_two(ring->rx_pending);
-	ring->rx_mini_pending	= roundup_pow_of_two(ring->rx_mini_pending);
-	ring->rx_jumbo_pending	= roundup_pow_of_two(ring->rx_jumbo_pending);
-	ring->tx_pending	= roundup_pow_of_two(ring->tx_pending);
+	ring->rx_pending	= fbnic_ring_size_pow2(ring->rx_pending);
+	ring->rx_mini_pending	= fbnic_ring_size_pow2(ring->rx_mini_pending);
+	ring->rx_jumbo_pending	= fbnic_ring_size_pow2(ring->rx_jumbo_pending);
+	ring->tx_pending	= fbnic_ring_size_pow2(ring->tx_pending);
 
 	/* These are absolute minimums allowing the device and driver to operate
 	 * but not necessarily guarantee reasonable performance. Settings below
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
index 10bf99be3f24..8bc5e6e5c59e 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
@@ -773,6 +773,11 @@ struct net_device *fbnic_netdev_alloc(struct fbnic_dev *fbd)
 	fbn->ppq_size = FBNIC_PPQ_SIZE_DEFAULT;
 	fbn->rcq_size = FBNIC_RCQ_SIZE_DEFAULT;
 
+	netdev->cfg->rings.rx_pending = fbn->rcq_size;
+	netdev->cfg->rings.rx_mini_pending = fbn->hpq_size;
+	netdev->cfg->rings.rx_jumbo_pending = fbn->ppq_size;
+	netdev->cfg->rings.tx_pending = fbn->txq_size;
+
 	fbn->tx_usecs = FBNIC_TX_USECS_DEFAULT;
 	fbn->rx_usecs = FBNIC_RX_USECS_DEFAULT;
 	fbn->rx_max_frames = FBNIC_RX_FRAMES_DEFAULT;
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 28b962307c08..5e22905a6373 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -1022,7 +1022,8 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
 	netmem = fbnic_page_pool_get_data(qt, pg_idx);
 
 	truesize = FIELD_GET(FBNIC_RCD_AL_PAGE_FIN, rcd) ?
-		   FBNIC_BD_PAGE_SIZE - pg_off : ALIGN(len, 128);
+		   FBNIC_BD_PAGE_SIZE - pg_off :
+		   ALIGN(len, FBNIC_RX_PAYLD_ALIGN);
 
 	pg_off += fbnic_rcd_bd_page_offset(&qt->sub1, rcd);
 
@@ -1030,6 +1031,9 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
 	page_pool_dma_sync_netmem_for_cpu(qt->sub1.page_pool, netmem,
 					  pg_off, truesize);
 
+	/* Consecutive device-page completions from one PPQ page are adjacent
+	 * ranges in the same netmem.
+	 */
 	added = xdp_buff_add_frag(&pkt->buff, netmem, pg_off, len, truesize);
 	if (unlikely(!added)) {
 		pkt->add_frag_failed = true;
@@ -1564,7 +1568,7 @@ void fbnic_free_napi_vectors(struct fbnic_net *fbn)
 
 static int
 fbnic_alloc_qt_page_pools(struct fbnic_net *fbn, struct fbnic_q_triad *qt,
-			  unsigned int rxq_idx)
+			  unsigned int rxq_idx, u32 rx_page_size)
 {
 	struct page_pool_params pp_params = {
 		.order = 0,
@@ -1599,6 +1603,8 @@ fbnic_alloc_qt_page_pools(struct fbnic_net *fbn, struct fbnic_q_triad *qt,
 
 	qt->sub0.page_pool = pp;
 	if (netif_rxq_has_unreadable_mp(fbn->netdev, rxq_idx)) {
+		pp_params.order = get_order(rx_page_size);
+		pp_params.max_len = rx_page_size;
 		pp_params.flags |= PP_FLAG_ALLOW_UNREADABLE_NETMEM;
 		pp_params.dma_dir = DMA_FROM_DEVICE;
 
@@ -2028,15 +2034,18 @@ static int fbnic_alloc_tx_qt_resources(struct fbnic_net *fbn,
 
 static int fbnic_alloc_rx_qt_resources(struct fbnic_net *fbn,
 				       struct fbnic_napi_vector *nv,
-				       struct fbnic_q_triad *qt)
+				       struct fbnic_q_triad *qt,
+				       u32 rx_page_size)
 {
 	struct device *dev = fbn->netdev->dev.parent;
 	int err;
 
-	err = fbnic_alloc_qt_page_pools(fbn, qt, qt->cmpl.q_idx);
+	err = fbnic_alloc_qt_page_pools(fbn, qt, qt->cmpl.q_idx, rx_page_size);
 	if (err)
 		return err;
 
+	fbnic_bdq_set_page_size(&qt->sub1, rx_page_size);
+
 	err = xdp_rxq_info_reg(&qt->xdp_rxq, fbn->netdev, qt->sub0.q_idx,
 			       nv->napi.napi_id);
 	if (err)
@@ -2097,7 +2106,11 @@ static int fbnic_alloc_nv_resources(struct fbnic_net *fbn,
 
 	/* Allocate Rx Resources */
 	for (j = 0; j < nv->rxt_count; j++, i++) {
-		err = fbnic_alloc_rx_qt_resources(fbn, nv, &nv->qt[i]);
+		struct netdev_queue_config qcfg;
+
+		netdev_queue_config(fbn->netdev, nv->qt[i].cmpl.q_idx, &qcfg);
+		err = fbnic_alloc_rx_qt_resources(fbn, nv, &nv->qt[i],
+						  qcfg.rx_page_size);
 		if (err)
 			goto free_qt_resources;
 	}
@@ -2864,21 +2877,75 @@ static int fbnic_queue_mem_alloc(struct net_device *dev,
 	struct fbnic_napi_vector *nv;
 
 	if (!netif_running(dev))
-		return fbnic_alloc_qt_page_pools(fbn, qt, idx);
+		return fbnic_alloc_qt_page_pools(fbn, qt, idx,
+						 qcfg->rx_page_size);
 
 	real = container_of(fbn->rx[idx], struct fbnic_q_triad, cmpl);
 	nv = fbn->napi[idx % fbn->num_napi];
 
 	fbnic_ring_init(&qt->sub0, real->sub0.doorbell, real->sub0.q_idx,
 			real->sub0.flags);
-	qt->sub0.bd_page_shift = real->sub0.bd_page_shift;
 	fbnic_ring_init(&qt->sub1, real->sub1.doorbell, real->sub1.q_idx,
 			real->sub1.flags);
-	qt->sub1.bd_page_shift = real->sub1.bd_page_shift;
 	fbnic_ring_init(&qt->cmpl, real->cmpl.doorbell, real->cmpl.q_idx,
 			real->cmpl.flags);
 
-	return fbnic_alloc_rx_qt_resources(fbn, nv, qt);
+	return fbnic_alloc_rx_qt_resources(fbn, nv, qt, qcfg->rx_page_size);
+}
+
+static void fbnic_default_qcfg(struct net_device *dev,
+			       struct netdev_queue_config *qcfg)
+{
+	qcfg->rx_page_size = PAGE_SIZE;
+}
+
+static int fbnic_validate_qcfg(struct net_device *dev,
+			       struct netdev_queue_config *qcfg,
+			       struct netlink_ext_ack *extack)
+{
+	u32 ppq_size = fbnic_ring_size_pow2(qcfg->rx_jumbo_ring_size);
+	u32 bd_page_count, ppq_entries, frag_count;
+	u32 rx_page_size = qcfg->rx_page_size;
+
+	if (!is_power_of_2(rx_page_size)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "rx_page_size must be a power of 2");
+		return -EINVAL;
+	}
+
+	if (rx_page_size < FBNIC_BD_PAGE_SIZE) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "rx_page_size must be at least 4K");
+		return -EINVAL;
+	}
+
+	/* Payload fragments occupy multiples of FBNIC_RX_PAYLD_ALIGN bytes.
+	 * Keep at least one reference in the bias until fbnic_clean_bdq()
+	 * observes a completion from a subsequent allocation.
+	 */
+	frag_count = rx_page_size / FBNIC_RX_PAYLD_ALIGN;
+	if (frag_count >= FBNIC_PAGECNT_BIAS_MAX) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "rx_page_size can produce too many fragments");
+		return -EINVAL;
+	}
+
+	bd_page_count = rx_page_size / FBNIC_BD_PAGE_SIZE;
+	ppq_entries = ppq_size / bd_page_count;
+	/* The PPQ is sized in 4 KiB device pages. One software entry tracks
+	 * each page-pool allocation. In addition to the unused entry for
+	 * empty/full accounting, cleanup retains the current allocation
+	 * until a completion identifies a subsequent allocation. A two-entry
+	 * ring can only post one allocation and cannot make progress.
+	 * Require at least four entries, since ring sizes are powers of two.
+	 */
+	if (ppq_entries < 4) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "rx-jumbo ring size too small for rx_page_size");
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static void fbnic_queue_mem_free(struct net_device *dev, void *qmem)
@@ -2980,4 +3047,7 @@ const struct netdev_queue_mgmt_ops fbnic_queue_mgmt_ops = {
 	.ndo_queue_mem_free	= fbnic_queue_mem_free,
 	.ndo_queue_start	= fbnic_queue_start,
 	.ndo_queue_stop		= fbnic_queue_stop,
+	.ndo_default_qcfg	= fbnic_default_qcfg,
+	.ndo_validate_qcfg	= fbnic_validate_qcfg,
+	.supported_params	= QCFG_RX_PAGE_SIZE,
 };
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h
index 626729b1a8b6..12b3a684f461 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.h
@@ -49,12 +49,18 @@ struct fbnic_net;
 #define FBNIC_RX_USECS_DEFAULT		30
 #define FBNIC_RX_FRAMES_DEFAULT		0
 
+static inline u32 fbnic_ring_size_pow2(u32 size)
+{
+	return size ? roundup_pow_of_two(size) : 0;
+}
+
 #define FBNIC_RX_TROOM \
 	SKB_DATA_ALIGN(sizeof(struct skb_shared_info))
 #define FBNIC_RX_HROOM_PAD		128
 #define FBNIC_RX_HROOM \
 	(ALIGN(FBNIC_RX_TROOM + FBNIC_RX_HROOM_PAD, 128) - FBNIC_RX_TROOM)
 #define FBNIC_RX_PAD			0
+#define FBNIC_RX_PAYLD_ALIGN		128
 #define FBNIC_RX_PAYLD_OFFSET		0
 #define FBNIC_RX_PAYLD_PG_CL		0
 
-- 
2.55.0


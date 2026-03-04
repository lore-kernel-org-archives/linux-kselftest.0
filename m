Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DE3306B05;
	Wed,  4 Mar 2026 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630352; cv=none; b=Tqv8Mlj6bw/RmcTwUtrUt2JIny5Lq+ePTLhB/OVvZM8S4qWPa26vupZU6vQqYwGTt+mUkgIrb+5p9XnCX1heshvEDPOQsOB1mNMX9kopiEBZDpVdDkTdZ49W3/ksJJe18BL5bwx8lP0zkjR9d5zRUXBscb5QM1bw//k+xioUfHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630352; c=relaxed/simple;
	bh=liM9aKRaCeLeCmRb8zzZkPZAQMDFRbi1yJdJ/iV4U4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqyltzrMO1cRPVTwMFiolxNdu8QrP8i9pVUwhZAhyx4x3kDxOBwpaNmxjyK0Q1tB+ECPFgwq0H0khekwyN+5Bt/XnFhGjfcgaPDPxW5r1/sjH2utImdUWnZ7SGQYmqJeJR4oN2vbKnVq4avdyitarzy7/kIJb3fqguewHqpgJnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AL6fWosZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AL6fWosZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056C5C19423;
	Wed,  4 Mar 2026 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772630351;
	bh=liM9aKRaCeLeCmRb8zzZkPZAQMDFRbi1yJdJ/iV4U4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AL6fWosZofn9K1Pxv92DjCtG1Lr9mlCFKH7SKz9AAzH9Dtb5PjQV9CWKgEJ+HCvfe
	 dMhhSjNGstHSYsuYqKbuFzEECVi6JxpBe5yhLq8hEOb4vFle9v1zPfoXZ44/sFxq5Q
	 /65Ifs0q0ka0gNDluMIj9oedS3ceT8yRsKDLb2kjKcsrRZu12MhtpenYleTK7xOC78
	 /4DVKOmEb4kCyia61wp4f9L78FHSFoHjw4YD7/0tVy0FcYih5WkBiDoR1yRl35VT6h
	 X1pwh2UoEJ/LZAQHRSvb18X8CY5RH6f/xglC3zFrekW4QN0Kp0eMRUk/iMMXDIrH+N
	 iL7WriPwQloAw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v2 2/3] bnxt_en: Resize RSS contexts on channel count change
Date: Wed,  4 Mar 2026 14:18:52 +0100
Message-ID: <20260304131855.3225539-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304131855.3225539-1-bjorn@kernel.org>
References: <20260304131855.3225539-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bnxt_set_channels() rejects channel changes that alter the RSS table
size when IFF_RXFH_CONFIGURED is set, because non-default context
sizes were locked at creation.

Replace the rejection with the new resize helpers. All validation runs
before the device is closed; actual resize is deferred until after
bnxt_close_nic():

 1. ethtool_rxfh_can_resize() checks context 0.
 2. ethtool_rxfh_ctxs_can_resize() validates all non-default contexts.
 3. After bnxt_close_nic(), ethtool_rxfh_resize() applies context 0
    changes, and ethtool_rxfh_ctxs_resize() resizes non-default
    contexts.

RSS table size only changes on P5 chips with older firmware; newer
firmware always uses the largest table size.

When context 0 uses defaults (!IFF_RXFH_CONFIGURED), steps 1 and 3 are
skipped; the driver regenerates the table via
bnxt_set_dflt_rss_indir_tbl().

Signed-off-by: Björn Töpel <bjorn@kernel.org>
---
 .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c | 36 +++++++++++++++----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
index 26fcd52c8a61..1bb0dd5bb683 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
@@ -942,6 +942,7 @@ static int bnxt_set_channels(struct net_device *dev,
 {
 	struct bnxt *bp = netdev_priv(dev);
 	int req_tx_rings, req_rx_rings, tcs;
+	u32 new_tbl_size = 0, old_tbl_size;
 	bool sh = false;
 	int tx_xdp = 0;
 	int rc = 0;
@@ -977,19 +978,33 @@ static int bnxt_set_channels(struct net_device *dev,
 		tx_xdp = req_rx_rings;
 	}
 
-	if (bnxt_get_nr_rss_ctxs(bp, req_rx_rings) !=
-	    bnxt_get_nr_rss_ctxs(bp, bp->rx_nr_rings) &&
-	    netif_is_rxfh_configured(dev)) {
-		netdev_warn(dev, "RSS table size change required, RSS table entries must be default to proceed\n");
-		return -EINVAL;
-	}
-
 	rc = bnxt_check_rings(bp, req_tx_rings, req_rx_rings, sh, tcs, tx_xdp);
 	if (rc) {
 		netdev_warn(dev, "Unable to allocate the requested rings\n");
 		return rc;
 	}
 
+	/* RSS table size only changes on P5 chips with older firmware;
+	 * newer firmware always uses the largest table size.
+	 */
+	if (bnxt_get_nr_rss_ctxs(bp, req_rx_rings) !=
+	    bnxt_get_nr_rss_ctxs(bp, bp->rx_nr_rings)) {
+		new_tbl_size = bnxt_get_nr_rss_ctxs(bp, req_rx_rings) *
+			       BNXT_RSS_TABLE_ENTRIES_P5;
+		old_tbl_size = bnxt_get_rxfh_indir_size(dev);
+
+		if (netif_is_rxfh_configured(dev) &&
+		    ethtool_rxfh_can_resize(bp->rss_indir_tbl,
+					    old_tbl_size, new_tbl_size)) {
+			netdev_warn(dev, "RSS table resize not possible\n");
+			return -EINVAL;
+		}
+
+		rc = ethtool_rxfh_ctxs_can_resize(dev, new_tbl_size);
+		if (rc)
+			return rc;
+	}
+
 	if (netif_running(dev)) {
 		if (BNXT_PF(bp)) {
 			/* TODO CHIMP_FW: Send message to all VF's
@@ -999,6 +1014,13 @@ static int bnxt_set_channels(struct net_device *dev,
 		bnxt_close_nic(bp, true, false);
 	}
 
+	if (new_tbl_size) {
+		if (netif_is_rxfh_configured(dev))
+			ethtool_rxfh_resize(bp->rss_indir_tbl,
+					    old_tbl_size, new_tbl_size);
+		ethtool_rxfh_ctxs_resize(dev, new_tbl_size);
+	}
+
 	if (sh) {
 		bp->flags |= BNXT_FLAG_SHARED_RINGS;
 		bp->rx_nr_rings = channel->combined_count;
-- 
2.53.0


Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16013E715C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846207; cv=none; b=O9okj1ULx/eJyQQ5K/fpaKUaZfw2BrJgG1ceznpjLqXMLx3ieIMA6Iz21OVhpJpGVvomGuva43CGf/UEBKVjv8YK+REUW+9SOSudEmQIfQFi6LuuMxkt9SxfzG79b57+pTubex8/RsGfJDnJY5GtooGEEYxBwjXG1KDNsJ1hzoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846207; c=relaxed/simple;
	bh=tpq4CPEg4PF7xY4vX/qaHiEsjc2ICDqk3bHyi4H6/ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8l3a3AuSIjDsx8bRKGrhoMNbTB0e+XcMPlx9PdfE5ldJGF2HaD49xuT19wJ/QxNqZ9tCNvCVwJOiSON2kjha7IaHZTiBEIqQ1wyNNQMBmoWmghBGR9m4bw3k2yUXV9ipraosUt93xJf9DDOdhcW2x34bjERY+TKtnhnOVxQQkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c0bdf1988cso41607eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 08:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846204; x=1774451004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZI1/cLnyDnVOs4qvF1/y00bhWF98dmH7Q3P7jVrTCz8=;
        b=Op9oi+ZxCfRSiqA0YOQFFyzuzfeoE3CWaLp5jYhGfGvp30suPQZytoiUBit8twgPXn
         QLtejOsjI2MAW6dlMcK8Fr1UcN+6y0LZT1rKoY49ltUdv+M+iJMaqduxK+zwPbTX2IbJ
         kb1Dl64cPGS0MASNIlXpRdBof3aI7ZPq3AS6/DojRjmEp5WKgrf9AnQzQKb2B0S+ElF3
         IdC3UqTA8hvXZatKXqJ1fKcOgBrIN5hxEA3+vYvTdnEx1p7rCv3klN9/lnK5tPunIfUI
         JkdiDeZdOqkJtAHvf3BFY9KshOm44ve+scWRKsKhM3apXcuVFnAUTmmZukPbTKLtzqd2
         ZVaw==
X-Forwarded-Encrypted: i=1; AJvYcCURCtLssb9UYoPaA/cdvsfBUZg8+NEFAuWHqW6wwez5fm84lh++47V7kP8dA4NQ9t8SiA86COAQI3DtiU4yDfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo7YsGbasrQuEF6TfFZFoH5Piu/Ct0vQvHdkHGFh5AsI5UttnS
	1AGoXEN33AN7X6LpvJfpKo0HLdYAC2ElFLUHPRCp1imRh8i3HoH+lfA=
X-Gm-Gg: ATEYQzxw+GYVg2RKk3B0I2xBHJd8ZMX1EoFTP4g/aA3UUsASuU6Sg6YTv4e++O1kkGE
	Ymkiy966ahebsbPx9xlEEB0lvYRtKb0CdHSAabpHU+HTsMdIFmpmqy2HLRMHeBPuAysB5NRXiZw
	ZfTzczKorV6/qqcZMcTjDno6RAMEBJJdKVr7iLDVKAbbcEgPHNSqcEcw/O4aIkfVe5ZBq/Pl6a6
	1R1+V2Xah0JonLdiUmTWpaEvuJd0iou4IgkexIXVALvVzxzc/jHLqaXX5NCO8OINUrSJyp5wwXF
	U0L60aWgIvqjeQm9Fxw1FpvL/57ip3teFKfP5M7oqxC41w0fo8PtUeMEoIrx19GyyYmp+618jYt
	XNw5PsmPiBrhmOuXPG0gfKUYU6joZf2Wt163U56jSncNqjD+T30mGrdrwfFgEPwZn8NQRYQvXIl
	ST9UWY7QdZFQRtE5M6jrCrrjRhnnJlKjBzJLSCYswxi1jz711BZ43o4ac/wWtb6WgUHgVr1/IYy
	SZphW93u5Uj2EsB8w==
X-Received: by 2002:a05:7300:3724:b0:2be:126c:e335 with SMTP id 5a478bee46e88-2c0e5011ac8mr1873924eec.10.1773846202672;
        Wed, 18 Mar 2026 08:03:22 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm4123423eec.30.2026.03.18.08.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:22 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v2 09/13] iavf: convert to ndo_set_rx_mode_async
Date: Wed, 18 Mar 2026 08:03:01 -0700
Message-ID: <20260318150305.123900-10-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318150305.123900-1-sdf@fomichev.me>
References: <20260318150305.123900-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iavf from ndo_set_rx_mode to ndo_set_rx_mode_async.
iavf_set_rx_mode now takes explicit uc/mc list parameters and
uses __hw_addr_sync_dev on the snapshots instead of __dev_uc_sync
and __dev_mc_sync.

The iavf_configure internal caller passes the real lists directly.

Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/intel/iavf/iavf_main.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
index 7925ee152c76..6632d35ad0fe 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -1147,14 +1147,18 @@ bool iavf_promiscuous_mode_changed(struct iavf_adapter *adapter)
 /**
  * iavf_set_rx_mode - NDO callback to set the netdev filters
  * @netdev: network interface device structure
+ * @uc: snapshot of uc address list
+ * @mc: snapshot of mc address list
  **/
-static void iavf_set_rx_mode(struct net_device *netdev)
+static void iavf_set_rx_mode(struct net_device *netdev,
+			     struct netdev_hw_addr_list *uc,
+			     struct netdev_hw_addr_list *mc)
 {
 	struct iavf_adapter *adapter = netdev_priv(netdev);
 
 	spin_lock_bh(&adapter->mac_vlan_list_lock);
-	__dev_uc_sync(netdev, iavf_addr_sync, iavf_addr_unsync);
-	__dev_mc_sync(netdev, iavf_addr_sync, iavf_addr_unsync);
+	__hw_addr_sync_dev(uc, netdev, iavf_addr_sync, iavf_addr_unsync);
+	__hw_addr_sync_dev(mc, netdev, iavf_addr_sync, iavf_addr_unsync);
 	spin_unlock_bh(&adapter->mac_vlan_list_lock);
 
 	spin_lock_bh(&adapter->current_netdev_promisc_flags_lock);
@@ -1207,7 +1211,7 @@ static void iavf_configure(struct iavf_adapter *adapter)
 	struct net_device *netdev = adapter->netdev;
 	int i;
 
-	iavf_set_rx_mode(netdev);
+	iavf_set_rx_mode(netdev, &netdev->uc, &netdev->mc);
 
 	iavf_configure_tx(adapter);
 	iavf_configure_rx(adapter);
@@ -5150,7 +5154,7 @@ static const struct net_device_ops iavf_netdev_ops = {
 	.ndo_open		= iavf_open,
 	.ndo_stop		= iavf_close,
 	.ndo_start_xmit		= iavf_xmit_frame,
-	.ndo_set_rx_mode	= iavf_set_rx_mode,
+	.ndo_set_rx_mode_async	= iavf_set_rx_mode,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address	= iavf_set_mac,
 	.ndo_change_mtu		= iavf_change_mtu,
-- 
2.53.0


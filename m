Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF233E1213
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846206; cv=none; b=NL2LhKb2YoLpllZGnWo4Ega+yTPoNJ/tZouNHgfxqLEojqXJfNNjKK+JrvVl/k3OK9CJEZK7l9sbyJcJPhtSc52bjqjobBwqw9zdMhlopDsx+mc/9uQDBp4gulRvqTLLLQc09f/88yUh/ypqGYD8KbxBXsZkqyAhjWS5YAMblI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846206; c=relaxed/simple;
	bh=kmwCimBJS+SWU8B61KoU5L9nhpuZjJHve7vQIDv7gNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTo5IX1tFFb+zWPHbh50yiPXyPBMX9JW6icf0//Lhfmwf2vTcZxAf8QxybHn2NZ2Jxgk9gt53WxIArcb5zUUcGHrgqwYMN3lLKWA9aonnNW+IYU8BAt44c7ca2i+AlUsS8e6he6PLIQ3qqvFNRU5PJ12yUbLHC3ARtMeXgstm6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2beab594d8eso18449eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 08:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846202; x=1774451002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yuVySmXB1N20uvWlkE4WXWJqrOPMyoG70opz84fOKRg=;
        b=d8+cBYV2GDgugHznjRsL/Cqu8jA8ZmpGpj9HC+2BVwPMG9us07eoooR/SPOSY7x+EP
         0ws2CoPzVWurKaByZXOli3JDLyGZdyLQSFsaduGZU+Y5YF6+KE0YRSJVMIXvbwVFXv+W
         DqP05YRUGGnd/Szv4x68dk46R8MORI3rK2MXMqZh09B/Kxdg19D4pdsyd/nAKaLFdug5
         oPa1lfG9mYe+X9OH/gh0O+5REbSqYXoXlJjogKjgnCceSNzK+D7HNMnsMA4gvTFD9vkh
         l9HC2vo0Ikycfk9qSvGIwvcFXmGF/HyaN3+j89gCtnceR/OajU9e/NRDARustVBr4wj8
         tuIA==
X-Forwarded-Encrypted: i=1; AJvYcCVi0b9QuaQ/EJhpNpYMHHJ+AkSEy55BKXDze58/x4f/qIKqWBa7VYnlMabL5aK03aNVnP/Pa6dgD1YtzLOlOf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyktXkJxxrHEqzUml3r3Exx2USiCs0mQjyGKW021Pnf/uc6MFr
	I6G5KgP0PANBhbpcajbS/xpyPJupXYjfL+SZRoYfTS4qFdQp8HIBFw0=
X-Gm-Gg: ATEYQzy14S55mTUadrHY5l1+/B5jj74gkpBZtTs5TucuoA117aujcdIgx7xx2vvH3gu
	1b9bdzGkzawQaV2JO0zkHBlzaptBwRPBC9mY5WXICOxRH7uTyIK0dcnIsg+ewJZmjdrpoyVG11C
	5v48OXMlrlTkYcei3tzsuxKxFZZieamI9z0bv8vDfzw+8I0/tqvUOunyBelr2Zaena7L0AB+RZz
	IuAf2h3c+A4OoVsyn42FYJ+znzncl6i9AQK2wZN/hoS2kU533cKtmvl2y0auMzW9pICC0JgW5Z9
	9rm17KGre1gFtmNFJGfr3t5Jhu0Fy3L5dsqNmDkhFmEpZFMDK1yLudbxYs90NnNTVzGqIR3Cneo
	2JfLH9uVcVkJoz0DJi4kt3ZmD2CraPIv+Gz5k+lVcSXRw8/RtMVjNuhDcXGG7JHajaKHYKb9eOo
	8aIX/56kQvK4VFBWFOXYIMpcc7KVK0ABuAetXFtuqKcedANVt96EUhxHZ5tcg+DkWQegG+2cH5L
	5yTi2iM9bf1oJ8npg==
X-Received: by 2002:a05:7300:ec11:b0:2c0:c96a:a4db with SMTP id 5a478bee46e88-2c0e4f5b6b3mr1808937eec.4.1773846201496;
        Wed, 18 Mar 2026 08:03:21 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55ca0f6sm4007492eec.25.2026.03.18.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:20 -0700 (PDT)
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
Subject: [PATCH net-next v2 08/13] bnxt: use snapshot in bnxt_cfg_rx_mode
Date: Wed, 18 Mar 2026 08:03:00 -0700
Message-ID: <20260318150305.123900-9-sdf@fomichev.me>
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

With the introduction of ndo_set_rx_mode_async (as discussed in [0])
we can call bnxt_cfg_rx_mode directly. Convert bnxt_cfg_rx_mode to
use uc/mc snapshots and move its call in bnxt_sp_task to the
section that resets BNXT_STATE_IN_SP_TASK. Switch to direct call in
bnxt_set_rx_mode.

0: https://lore.kernel.org/netdev/CACKFLi=5vj8hPqEUKDd8RTw3au5G+zRgQEqjF+6NZnyoNm90KA@mail.gmail.com/

Cc: Michael Chan <michael.chan@broadcom.com>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 24 ++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 225217b32e4b..ce430690efb5 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -11039,7 +11039,8 @@ static int bnxt_setup_nitroa0_vnic(struct bnxt *bp)
 	return rc;
 }
 
-static int bnxt_cfg_rx_mode(struct bnxt *);
+static int bnxt_cfg_rx_mode(struct bnxt *, struct netdev_hw_addr_list *,
+			    struct netdev_hw_addr_list *);
 static bool bnxt_mc_list_updated(struct bnxt *, u32 *,
 				 const struct netdev_hw_addr_list *);
 
@@ -11135,7 +11136,7 @@ static int bnxt_init_chip(struct bnxt *bp, bool irq_re_init)
 		vnic->rx_mask |= mask;
 	}
 
-	rc = bnxt_cfg_rx_mode(bp);
+	rc = bnxt_cfg_rx_mode(bp, &bp->dev->uc, &bp->dev->mc);
 	if (rc)
 		goto err_out;
 
@@ -13610,11 +13611,12 @@ static void bnxt_set_rx_mode(struct net_device *dev,
 	if (mask != vnic->rx_mask || uc_update || mc_update) {
 		vnic->rx_mask = mask;
 
-		bnxt_queue_sp_work(bp, BNXT_RX_MASK_SP_EVENT);
+		bnxt_cfg_rx_mode(bp, uc, mc);
 	}
 }
 
-static int bnxt_cfg_rx_mode(struct bnxt *bp)
+static int bnxt_cfg_rx_mode(struct bnxt *bp, struct netdev_hw_addr_list *uc,
+			    struct netdev_hw_addr_list *mc)
 {
 	struct net_device *dev = bp->dev;
 	struct bnxt_vnic_info *vnic = &bp->vnic_info[BNXT_VNIC_DEFAULT];
@@ -13623,7 +13625,7 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
 	bool uc_update;
 
 	netif_addr_lock_bh(dev);
-	uc_update = bnxt_uc_list_updated(bp, &dev->uc);
+	uc_update = bnxt_uc_list_updated(bp, uc);
 	netif_addr_unlock_bh(dev);
 
 	if (!uc_update)
@@ -13642,7 +13644,7 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
 	if (netdev_uc_count(dev) > (BNXT_MAX_UC_ADDRS - 1)) {
 		vnic->rx_mask |= CFA_L2_SET_RX_MASK_REQ_MASK_PROMISCUOUS;
 	} else {
-		netdev_for_each_uc_addr(ha, dev) {
+		netdev_hw_addr_list_for_each(ha, uc) {
 			memcpy(vnic->uc_list + off, ha->addr, ETH_ALEN);
 			off += ETH_ALEN;
 			vnic->uc_filter_count++;
@@ -14600,6 +14602,7 @@ static void bnxt_ulp_restart(struct bnxt *bp)
 static void bnxt_sp_task(struct work_struct *work)
 {
 	struct bnxt *bp = container_of(work, struct bnxt, sp_task);
+	struct net_device *dev = bp->dev;
 
 	set_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
 	smp_mb__after_atomic();
@@ -14613,9 +14616,6 @@ static void bnxt_sp_task(struct work_struct *work)
 		bnxt_reenable_sriov(bp);
 	}
 
-	if (test_and_clear_bit(BNXT_RX_MASK_SP_EVENT, &bp->sp_event))
-		bnxt_cfg_rx_mode(bp);
-
 	if (test_and_clear_bit(BNXT_RX_NTP_FLTR_SP_EVENT, &bp->sp_event))
 		bnxt_cfg_ntp_filters(bp);
 	if (test_and_clear_bit(BNXT_HWRM_EXEC_FWD_REQ_SP_EVENT, &bp->sp_event))
@@ -14680,6 +14680,12 @@ static void bnxt_sp_task(struct work_struct *work)
 	/* These functions below will clear BNXT_STATE_IN_SP_TASK.  They
 	 * must be the last functions to be called before exiting.
 	 */
+	if (test_and_clear_bit(BNXT_RX_MASK_SP_EVENT, &bp->sp_event)) {
+		bnxt_lock_sp(bp);
+		bnxt_cfg_rx_mode(bp, &dev->uc, &dev->mc);
+		bnxt_unlock_sp(bp);
+	}
+
 	if (test_and_clear_bit(BNXT_RESET_TASK_SP_EVENT, &bp->sp_event))
 		bnxt_reset(bp, false);
 
-- 
2.53.0


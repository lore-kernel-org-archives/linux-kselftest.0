Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBAD378D7D
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845244; cv=none; b=OmNkgyHilKp1yvT41JYTOt+G+otYI1U4RYv29cFEUI8qni3PtsCH92c+JPwMsxBhyTj6kXRWyRyPB0sxiqzfu4Bpg0rt51+PHGhb+S5aMP5IqbphoP1y0nCRqakfvNgYU4oiY5MLMsX5yrFGF+QTf4V6h6yV+mCIg9C70Q3dCd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845244; c=relaxed/simple;
	bh=OVAxsYtMwS+xYpN4RB/GP7KqacvWf7bU6GaHsxqTBPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBIXwhx/UWbzf6Tp+/xZvM4zL10vOmcoRDX8GV5LX60qI16RB1TOuzaKP5/bbZemfAXK44NecBjBe9UZqvCjUfuanRDUWVNu4ysluwdbAYFKcGzNGnaCAmh6yZ3HWflTT7iEtPO+RzM+sZAEdbW0Dq23nhwv26QGaBEEyPMRD4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ib7Crh1f; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ib7Crh1f"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so4549637a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845242; x=1789450042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0G6PBNCNI9Yj3CIpfLEh1JaSFXkOQqLFV+7Mz1Okng=;
        b=ib7Crh1f8VhReMh072khkSSY27geHcaRHtuGEKHtgtOhRvp/bFC32bYF7dKa9K3VPs
         61ivPMYO7hK0B/hHdLip2zGjEJCd6DEQISKmXYBoum6sS2rXUcE9sTZkGFR0KMu3Cta7
         8ImjD68aGRKtTUqIz+lNygdlJIxd6wbc61NwqhoW2eejmXhts1stnqTUQ8pekkD9ZZbQ
         QdkW0Co8/Cy8m2MIGtoqBNZSuc8SzH2R2ACD9waHE4zQRP2QLWFfq+b5YMoW8fYJlwDs
         AUL4KORL2aSKTQPzPpGkHYw94Bqj+4psjt0IJ/zlZBjh+51/r63HjIbMFVAMS3ConRLm
         DrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845242; x=1789450042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0G6PBNCNI9Yj3CIpfLEh1JaSFXkOQqLFV+7Mz1Okng=;
        b=kOpPjnYeAkQCEhxcQc+YLW8M4Qjb60iRDfwVSzM/Po/UIfZ8OoHYv8t44xPuJtkwvV
         DtuhPtgocMWkCzQzhMsSFABsGJRl2hgZk8sTx9Ms+sYQ/IarXmm7MjDh05KRI+tdO/pu
         AoJ25xP2fw2npIU42W6ZQZVJrHyG8pjlE2avTHGzSkq8EK91Rya0k2bTdgbyvVwAYYAv
         yiI8P7D0/AwukkwtdY1vLe5dLZtp8ZgsrWJCMBINW/4N8Sd3d1qEAL9n39Cm9fKfLMax
         C8l+fsPSKE2BzxeeyREo4eYiCoZvEUij3VvgfcfGzIla4oAW41LUmQhfrPOUNUw/Ir0y
         kSYg==
X-Forwarded-Encrypted: i=1; AKwUvBzsj1+bQxd6PAk9CGnEVPeRD1P45GRn0NWe7SaHBNhEbBkvF1vwWplxSLNg6ujUyjDcVMItaDkcoKZMmiUrPp8=@vger.kernel.org
X-Gm-Message-State: AFuF++nDZjMlV5Y3rXxH5FRem95b2J1ejLNLMZXku+mLO9dS948RbS+2
	De4quQj6EAsqqdCfxQMQOcnNgIJHdF4mforvQkZJj6mjhosr5OWDbY7O
X-Gm-Gg: AYBFou0aGEkURqZIdA2BWOfFpPqhxgXixO7btPSkSRurh0WA24cVlnVnhRZ7lvRM7bh
	D9Gz8IxjoMykqaQdC0i5dgiFR7DMCGU5cCvD9ItlTZSYa/R8uMlU3G1yEq5TmDNYr20QfKefAn4
	wysJawCexHQboe7HESI1WzrtdclEzHRBWCyvTY0FqTUqYAH9e7waBLRgC2ABnnB4eHiHSSoNI1u
	0enZAtw+jDa1Hdsad4YCS1U9JMwg4AIye0WZ7yp9rpaf666E8tagvEPmGsSFXReJHxzLqI0AlTQ
	ddwc3bgT4MS7e/giG01PIBxwEa+gyTrZKlWFq2PB/l36he1Jja+X/wB5KGHxsWhG8c1RYGtgEeC
	pMmjvuggo+yRQNaG/XLygi0T2hdJP30arN+esvlhTxZmNsL4HfD88d/OBPm4kfyaRhbMccXXNvO
	4qLqf05nx++bSRX/MV/vPDG4cP3oJ3rEn9NAzhsi47otBMmIJt9xvymR4IdcrsD7czA9w3+Buzz
	btVpCxeZIketA==
X-Received: by 2002:a05:6a21:a38b:b0:3d1:deec:9265 with SMTP id adf61e73a8af0-3da39b5832bmr46064670637.6.1788845241699;
        Mon, 07 Sep 2026 22:27:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:27:21 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 08/10] net: hisilicon: fix typos in comments
Date: Tue,  8 Sep 2026 10:56:00 +0530
Message-ID: <20260908052602.27497-9-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings in comments, found with scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Jijie Shao <shaojijie@huawei.com>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c        | 2 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c         | 2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c             | 4 ++--
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c   | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c     | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
index 91391a49fcea..a59fd280a045 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
@@ -591,7 +591,7 @@ static int hns_mac_config_sds_loopback(struct hns_mac_cb *mac_cb, bool en)
 #define HILINK_ACCESS_SEL_CFG		0x40008
 			/* hilink4 & hilink3 use the same xge training and
 			 * xge u adaptor. There is a hilink access sel cfg
-			 * register to select which one to be configed
+			 * register to select which one to be configured
 			 */
 			if ((!HNS_DSAF_IS_DEBUG(mac_cb->dsaf_dev)) &&
 			    (mac_cb->mac_id <= 3))
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
index 5013beb4d282..408d36d85fb1 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
@@ -139,7 +139,7 @@ static void hns_ppe_set_vlan_strip(struct hns_ppe_cb *ppe_cb, int en)
 }
 
 /**
- * hns_ppe_checksum_hw - set ppe checksum caculate
+ * hns_ppe_checksum_hw - set ppe checksum calculate
  * @ppe_cb: ppe device
  * @value: value
  */
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
index e905f10b894e..d819d2bb3450 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
@@ -1230,7 +1230,7 @@ static void hns_nic_update_stats(struct net_device *netdev)
 	h->dev->ops->update_stats(h, &netdev->stats);
 }
 
-/* set mac addr if it is configed. or leave it to the AE driver */
+/* set mac addr if it is configured. or leave it to the AE driver */
 static void hns_init_mac_addr(struct net_device *ndev)
 {
 	struct hns_nic_priv *priv = netdev_priv(ndev);
@@ -2317,7 +2317,7 @@ static int hns_nic_dev_probe(struct platform_device *pdev)
 		ret = device_property_read_u32(dev, "port-id", &port_id);
 		if (ret)
 			goto out_read_prop_fail;
-		/* for old dts, we need to caculate the port offset */
+		/* for old dts, we need to calculate the port offset */
 		port_id = port_id < HNS_SRV_OFFSET ? port_id + HNS_DEBUG_OFFSET
 			: port_id - HNS_SRV_OFFSET;
 	}
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index e6af939c1c19..bf35f55f5b8f 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -10527,7 +10527,7 @@ static int hclge_get_link_diagnosis_info(struct hnae3_handle *handle,
 }
 
 /* After disable sriov, VF still has some config and info need clean,
- * which configed by PF.
+ * which configured by PF.
  */
 static void hclge_clear_vport_vf_info(struct hclge_vport *vport, int vfid)
 {
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
index 00c3f2548bf6..bf533b8f46ae 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
@@ -35,7 +35,7 @@ enum hclge_shaper_level {
  * IR(Mbps) = -------------------------  *  CLOCK(1000Mbps)
  *		Tick * (2 ^ IR_s)
  *
- * @return: 0: calculate sucessful, negative: fail
+ * @return: 0: calculate successful, negative: fail
  */
 static int hclge_shaper_para_calc(u32 ir, u8 shaper_level,
 				  struct hclge_shaper_ir_para *ir_para,
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
index 063a692c2b41..5d14d29b0296 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
@@ -1880,7 +1880,7 @@ static void hclgevf_reset_service_task(struct hclgevf_dev *hdev)
 		 * from PF as cmdq would be in unreliable state i.e. mailbox
 		 * communication between PF and VF would be broken.
 		 *
-		 * if we are never geting into pending state it means either:
+		 * if we are never getting into pending state it means either:
 		 * 1. PF is not receiving our request which could be due to IMP
 		 *    reset
 		 * 2. PF is screwed
-- 
2.48.1


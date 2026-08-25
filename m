Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29B0383C83;
	Tue, 25 Aug 2026 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787676390; cv=fail; b=b40JwwDCida8qK+zaTIQGoDO5hoKjCoIEjsPRh2A0gChwyDcx03+g9iBRl7IXZga0H8NJt8/c1+b2ijKqsKtf5q5txDMoBwvOpuZXVls9ZkNEhut8lz9tQ3/6vqyyuAdss99ftrVECnv4o5+uyBqGX/EborhRrMry1UNcrhAXNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787676390; c=relaxed/simple;
	bh=JzTust4gedoUs6WCQzgElpORrTpcI4ljTzxjoNG9UaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k57zreXiJ/r40HZN1LMtggnFUBwOfsFGaAdyji7TPPOYjTscF3ekdpEHxx+dsgtZ+HmegXKg4gJx6U1XRPaA/pwFScRtLeEP8YmL+xA5UAWHe9dGlJNKP7zQNoy7Qt7CNe9Bu8luFfSC3hvBcef11vWKyIDtN2xrVxsLClk1cDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Up8vUiKc; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Up8vUiKc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbqZLsFR6q8IwZnI4RDQEIXRanApZvYj9kp/exH/qtZaYgBL6WcbfNHNQ77kljTla21RJMef9BTsBMcBP8didehUSi5gU+5Ocsilo3ipn7xi+OeiG7GjHNbUXdjF81qiRJ/TQYFpCVUk7LqXnQptm/EyH0LRH93qdBaOz/bEueVA6gFu+l11OzV+piwsvYQglZPbgIBECPD5Hu1/a31dAA8cXt+Jo/YN7K7te3DKVUouNqsBjjPGYP9ucX1TGTj9+/zdpaTTaDxYoObxcigdtCUjCLk8k3o60NjQGRLHa/ZL8DrW1bwI35QFn0Zpy4CZuPPf8SsiVcBHcinTsqlhuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DbbL2ptfkQyCFOAtwfIdRZAHeTGITuogdBaiB787SQ=;
 b=mBoPq0vnfYVM7F9Z2yoKXQV6032LX5dyvuYBsb0+xFGPyVfGeJGVbkMqhnFcuh+uLbt77wmZQYCY3wHfxpSyUsKigSqQadyySxDgahYtQA8goGEr6PjuOcmkojPvfoX72u08ORvjOjqoADfGW6NwbvMOVts4+Hn05KWnGYwzegLS0BbXhSCuj57NY3zZexkMJ4Udq6yyvZKoj38IzFZw0c4NVxT9YjIITLaxL3m5PMOA+LSB7ZApJwm9NA6gQJTT0F39JZtBOgtdPy2OnKzvDrQr/Jz+AZhujDxwNhjG425evMQr17MCPpxJ5YLPhIvvRQmkPm0Uj1Vj2jXp2CrsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DbbL2ptfkQyCFOAtwfIdRZAHeTGITuogdBaiB787SQ=;
 b=Up8vUiKcU43ufk0KA7ktttGS7yfE8vlhKef+uE77e1kZW4+VN8owtkgoqbuL9q9FrxO4P+vqFT4wJ12Yyc5FVrRiah3SRHZBWcq2N3eJVvPcW+Cq1oCPbrKh+DZ726/u4mzdpMX8ATSQ2AnO0fX7ZL+yiLiW35rtD7hr3fRKSq0=
Received: from OSTPR01CA0056.jpnprd01.prod.outlook.com (2603:1096:604:222::20)
 by TYVPR01MB10815.jpnprd01.prod.outlook.com (2603:1096:400:2aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 16:46:18 +0000
Received: from OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:222:cafe::7c) by OSTPR01CA0056.outlook.office365.com
 (2603:1096:604:222::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 16:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20E.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Tue, 25 Aug 2026 16:46:18 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.185])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 77F8E30001CA;
	Wed, 26 Aug 2026 01:46:12 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shuah@kernel.org,
	joabreu@synopsys.com,
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v3 2/5] net: stmmac: Move double VLAN handling to a dedicated op
Date: Tue, 25 Aug 2026 16:45:19 +0000
Message-ID: <20260825164522.4244-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20E:EE_|TYVPR01MB10815:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 97ee0ac6-8d6a-4093-539b-08df02c862b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|921020|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ueBvlJendqFYxS5yU18NxHH8B0aGP1AUAEW3yo3JgOM/VcBrJsTXw41uNGzvPvHjn4nZbdb5jURI8uxZem6e3hRQq8WYWUaXCDONyce7pdrZlrasqcAtRd4UFLMk0mhVl0pReNwH9PGPDly+EDl1h4l7aWnVXfSf0qkK1ao0Q1UIyPzL8HT1QZnQ5pX6MaVCTtL4WNwUhbnQA9OysprbuesZZhTvn86cWe3pKQQJC4VUoMxss+nE6Q9XzViL6hKnsLwOQhfCpsgP5ZHx4zIDBQ5h1+HaKvXYRILtK/9oEh/hyBgtZgtkp4uhbk71iaIjBPaC12zgSxkq2SEO3UzYe9sR4pTkvofAmhnZVrQ3FJkEoeIPUcvs7hj2Mwp9AK58guEJ6+joBAwhUaNQtMlGxkof/NP1A9n9sL9mSsyqff8FfHhFmKFsWEui0RIuSqFSovTKRsgBekIb3RHBlmUrch0mjNrcij2GkTY7bepTFsn6syL6NwTMMY25eQhA6De3+d+QW3IvLcKUYk+anZNc2aSZp54AD5TiiGpQy26WNDbvyDpdiWGhgAfslNVefXUK0FuKjiDPFaXlB0pMoh+5FFqQN0bTdZzJ1T+tlCaODz5YbD8WLMggnYqB1kdKZRNG7D5u0g1Nrikj3Faz6H1g/2340NU6kbjRJWko31hhAm79xNRN6UwI+Sj9UJiy0T8qYk7XJoTDZ1zV1eC1oQqPe4Nfgqm42Q6/RnegWMnY13j6dru0tO4Ime9ud3oMsIqy
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(921020)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B9EBrKKmwuxWnecd8jJHZn+ucV/FVsdXAMO9HsV+Yqyuha2u7l6umU5dA1mccsHtTx4ihIgnSMOjW1BmV8TIHQ8757UfQ6xqpPg9wx6XAJcaXJF+xTMZDndg05o2CP6IFRTJ5jBfi9YOzuIvFLSP/2BHhnb7zZy0faTsNQgoB60dZYQxmsujVLAdOEA57uj29a52u+A8vt/X7TdvRWlW9v9KhiecMMAGAIEeaNcQnaCmbtTUozV/ARIqefFOrzavTNZLFGnT/l2HycNr2cHAvAoc6MF32ysiLC88Ejr+mrq9jg3UCkQLJdreZKhf/Ydk4K63wrSuf3nzkmC6npvuIIHpO+/Ne0wyy3Mh0yhP3E8c0JhHros+6Vk9TB7vSA16+wPUO5W+fiZx4KO4UkeQgb5Anqk97FSMqH4H/DILJuNNxrpSa7jXGyc/7PPncnYz
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 16:46:18.2028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ee0ac6-8d6a-4093-539b-08df02c862b5
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10815

The double VLAN bits (EDVLP, ESVL, DOVLTC) are currently handled inside
update_vlan_hash(). This ties the double VLAN state to the hash filter
update, even though the two features are independent: hash filtering is
controlled by dma_cap.vlhash and double vlan by dma_cap.dvlan.

In preparation for removing double vlan support from dwmac4, move the
double vlan logic into a separate update_dvlan_state() VLAN operation.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v3 changes:
- Rebased after dropping the dma_cap.dvlan patch.
- Added "Reviewed-by" tag from Maxime.

v2 changes: None.

 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  6 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 45 ++++++++-----------
 3 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 6f26dbf95ce1..66837caafa84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -632,8 +632,8 @@ struct stmmac_est_ops {
 
 struct stmmac_vlan_ops {
 	/* VLAN */
-	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
-				 bool is_double);
+	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash);
+	void (*update_dvlan_state)(struct mac_device_info *hw, bool enable);
 	void (*enable_vlan)(struct mac_device_info *hw, u32 type);
 	void (*rx_hw_vlan)(struct mac_device_info *hw, struct dma_desc *rx_desc,
 			   struct sk_buff *skb);
@@ -650,6 +650,8 @@ struct stmmac_vlan_ops {
 
 #define stmmac_update_vlan_hash(__priv, __args...) \
 	stmmac_do_void_callback(__priv, vlan, update_vlan_hash, __args)
+#define stmmac_update_dvlan_state(__priv, __args...) \
+	stmmac_do_void_callback(__priv, vlan, update_dvlan_state, __args)
 #define stmmac_enable_vlan(__priv, __args...) \
 	stmmac_do_void_callback(__priv, vlan, enable_vlan, __args)
 #define stmmac_rx_hw_vlan(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 16fe56a1f617..e79b37fc716c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6820,7 +6820,9 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 	if (!netif_running(priv->dev))
 		return 0;
 
-	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
+	stmmac_update_dvlan_state(priv, priv->hw, is_double);
+
+	return stmmac_update_vlan_hash(priv, priv->hw, hash);
 }
 
 /* FIXME: This may need RXC to be running, but it may be called with BH
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index 983a90cb9767..1e47ae62093e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -161,8 +161,20 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
 		vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
 }
 
-static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
-			     bool is_double)
+static void vlan_update_dvlan_state(struct mac_device_info *hw, bool enable)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 value;
+
+	value = readl(ioaddr + VLAN_TAG);
+	if (enable)
+		value |= VLAN_EDVLP | VLAN_ESVL | VLAN_DOVLTC;
+	else
+		value &= ~(VLAN_EDVLP | VLAN_ESVL | VLAN_DOVLTC);
+	writel(value, ioaddr + VLAN_TAG);
+}
+
+static void vlan_update_hash(struct mac_device_info *hw, u32 hash)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value;
@@ -173,21 +185,9 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 
 	if (hash) {
 		value |= VLAN_VTHM | VLAN_ETV;
-		if (is_double) {
-			value |= VLAN_EDVLP;
-			value |= VLAN_ESVL;
-			value |= VLAN_DOVLTC;
-		} else {
-			value &= ~VLAN_EDVLP;
-			value &= ~VLAN_ESVL;
-			value &= ~VLAN_DOVLTC;
-		}
-
 		writel(value, ioaddr + VLAN_TAG);
 	} else {
 		value &= ~(VLAN_VTHM | VLAN_ETV);
-		value &= ~(VLAN_EDVLP | VLAN_ESVL);
-		value &= ~VLAN_DOVLTC;
 		value &= ~VLAN_VID;
 
 		writel(value, ioaddr + VLAN_TAG);
@@ -236,8 +236,7 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
 	writel(value, ioaddr + VLAN_TAG);
 }
 
-static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
-				      bool is_double)
+static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash)
 {
 	void __iomem *ioaddr = hw->pcsr;
 
@@ -253,15 +252,6 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 		value = readl(ioaddr + VLAN_TAG);
 
 		value |= VLAN_VTHM | VLAN_ETV;
-		if (is_double) {
-			value |= VLAN_EDVLP;
-			value |= VLAN_ESVL;
-			value |= VLAN_DOVLTC;
-		} else {
-			value &= ~VLAN_EDVLP;
-			value &= ~VLAN_ESVL;
-			value &= ~VLAN_DOVLTC;
-		}
 
 		value &= ~VLAN_VID;
 		writel(value, ioaddr + VLAN_TAG);
@@ -275,8 +265,6 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 		value = readl(ioaddr + VLAN_TAG);
 
 		value &= ~(VLAN_VTHM | VLAN_ETV);
-		value &= ~(VLAN_EDVLP | VLAN_ESVL);
-		value &= ~VLAN_DOVLTC;
 		value &= ~VLAN_VID;
 
 		writel(value, ioaddr + VLAN_TAG);
@@ -285,6 +273,7 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 const struct stmmac_vlan_ops dwmac_vlan_ops = {
 	.update_vlan_hash = vlan_update_hash,
+	.update_dvlan_state = vlan_update_dvlan_state,
 	.enable_vlan = vlan_enable,
 	.add_hw_vlan_rx_fltr = vlan_add_hw_rx_fltr,
 	.del_hw_vlan_rx_fltr = vlan_del_hw_rx_fltr,
@@ -295,11 +284,13 @@ const struct stmmac_vlan_ops dwmac_vlan_ops = {
 
 const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
 	.update_vlan_hash = dwxgmac2_update_vlan_hash,
+	.update_dvlan_state = vlan_update_dvlan_state,
 	.enable_vlan = vlan_enable,
 };
 
 const struct stmmac_vlan_ops dwxgmac210_vlan_ops = {
 	.update_vlan_hash = dwxgmac2_update_vlan_hash,
+	.update_dvlan_state = vlan_update_dvlan_state,
 	.enable_vlan = vlan_enable,
 	.add_hw_vlan_rx_fltr = vlan_add_hw_rx_fltr,
 	.del_hw_vlan_rx_fltr = vlan_del_hw_rx_fltr,
-- 
2.34.1


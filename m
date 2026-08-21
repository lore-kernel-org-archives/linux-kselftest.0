Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF61742E423;
	Fri, 21 Aug 2026 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787332234; cv=fail; b=c95iDgzhgd/H3zyrWwbRltJYE3kY/7q0BCZH7Yw0NfWqAtvPdyGbTSRm9Tnzgv2wdTt8/mz0A8Kl9UU8wyzv77E87B8KmTWwiraLJrW4SUH2oDrvDxwllKkc9vVhwAxdzyAkrwVxcZKhX7PXcEL4yzOYT6hVoGsIoUX+bzusqoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787332234; c=relaxed/simple;
	bh=1SFKp2BkeSsWiBFYhdaiy9zh3VCxPs7YkEgTJvBEEO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iS052cZGX8A42zi3+v0AMHHRI5s4QMkJ6DPc0keSYGilNtHV5DGpnYymT/LVXYdd+j+A9zyMmSIhJUaOos+nhU9nDonslrG2t+XB6EmpUrE7UX+VQ/IUobW8FRHG2p+CqmrYNIIZkRB74GQFbZArMVUTqKJy6auxc0+FaLbfsIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pgQUa5bm; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pgQUa5bm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tyttzk3sk9IfTYzqNCil8PX8EFip9ZVhTDi8ScfIyEdjflflH6DkiNaIGN2JXE12tguhIQDGzmJiFaj6+ef3M7Iwq0UN5Eeu6AX7cHcJoh5TVwBDFChCZGKjcXUzFnSTFGvBXzZdGIoMyCAjFA6h1bpJ1njk8srYesMawZqeJuTKfkdkdTJSF0Lpf3Oj9kAYeu4G74HPsZg9U/v8fTRaG4+xQMOoclgEIDddN4onv7E1S/eVEIfWHxwR8uzo4zlTn9x6CdAFD80jNMxbw6PAmJQsv6lfjY6HLAyOXGIA+JoMVk741FKSm8LilRlhbW1LQeCaLEOYydFDdZPEnveNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5h6t3MwxwJv6t22KXsGtSYnMXB/EIyfh5902o8eaxo=;
 b=n/GqbSqTvy6iEJeBZ/UwrdJknX73xlaKw4i2v5aL+LC41G6MiacdI6JnpMZLrNJ83rvdYZOUQylsWvxp7UGr+zKG3ksIk3rG3vJBFZVwWpucf49bWaalv6zowGQogI7XOi0+O9T9Kl3YbQj1K8MHWXHKKm/Yc+8UCUwjj1tZT1LWOcekt8rQAlUl2qdVcxrkcFlaNMV/0u5KK/Wb34bAgJgxtSMltKCVAj8fn9EjpgzQh2H5myYPxg2EKPZrO+LaaTkvGwuSQv3xs8s/07zblMeNImP06AfC5tHsSfl6cXPVyv2JUaYeDbpVsrka8c0H+NsGJaf7XBnZ1U3JWIGVWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5h6t3MwxwJv6t22KXsGtSYnMXB/EIyfh5902o8eaxo=;
 b=pgQUa5bm6XGHG1YSX6bfmCJh8blP/vOifjlGJiK2qCNe2Iak2SUhy6uWDoBxH1OCUwcfT8u5KT8cn68XfMeyCQJ6dNp1SyALxjyStD/HckTeCvFAkapG3dz309v+6ZtpgW9WR/NPoNBNpxy7tuMHdBGx1avh0GQdmgu0ByyBNZo=
Received: from TYCP286CA0040.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29d::15)
 by OS9PR01MB16457.jpnprd01.prod.outlook.com (2603:1096:604:2bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 17:10:28 +0000
Received: from TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d:cafe::62) by TYCP286CA0040.outlook.office365.com
 (2603:1096:400:29d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 17:10:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD8.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 17:10:26 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.76])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 4802730001F8;
	Sat, 22 Aug 2026 02:10:21 +0900 (JST)
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
	yi.fang.gan@intel.com,
	jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v2 3/6] net: stmmac: Move double VLAN handling to a dedicated op
Date: Fri, 21 Aug 2026 17:09:56 +0000
Message-ID: <20260821170959.79708-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD8:EE_|OS9PR01MB16457:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0e2175ef-fa21-408a-4f83-08deffa7187a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|7416014|22082099003|18002099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	CicOuP8yftll6oXyqyAb1cwUSmX2whw4M+83W+0YortkwP8jwcrVwUZb3u8Elni4/Qikg/wFsKKHIC7YWt+VNi25YCRptEAP4QQsXDGipJQF+culTdWcv7TyM/0NapqO4/m0lshn4hkkhpx3e3//jfhPm0vVcjhpSOKNhY8jrLUc+YD5Tit6LdIDl6aGfJVZGdxD7wD5zNsG0lB9TA8Sr+UXHTo+gJUDXLd0tPVinZ+9Jl2OT9qJg20OthCnDqsv0UJcaYJJ4ErEyRi2FKyyvtgtTzR2kbpK6DVE3LKq/+TvmbYki5D3nbCOqrkbMW91mavY3wSZ/K8My21muOo07LEi1ApowrCg8k7t6nbfDyzuJsjFntN7mp8Kw6FYBoUwiafpy9iwKK5cs5K26Ub8IiAIr9mVqIoMgLnoIHyH62ih20A9oiKE+Vm05HNttI4iMtBBNxgWpO2UNYPzOycXL8hMu6NnEQ85QlBdJ8RvGeiswijCGxfaef43ZD9Zggg3DfPceqmT8h/yG3QyNr6agCYUWsanMOGW5idD8rBIRLbrcZFgEBkWqfrvZa60kvnghf048om8eFmH3mznOz4kZhlS9knX+tPESEYfXMvC7JCz78G6PHjqAvh69PORuIqRavfQ5ua1b5UIv/orjSOBNH2lGcKYN6rZEavJ/FGLN7AAMMdCix9iUFuFaWbPs57C7MW1Yzpi/dMK3O20a5bw+dmhjOV8Ztn/0YLakovmWf6b3F7BGEahhUV+5B1Ae765
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N2vV1tscMVAKjAaPpjn+MlqKxXaM7xjLe97AhfjuXG1LjsWceDFyLa2JtIrRVtEJhsr2sFE04G7YWbANP7aoVVY8kKpvJtc5LNGqElmQHRtK1MCX2Uy1o3tIkpYPXcZdQE7G7p/BryJrKLVi1SmlzRZS3t5Fslx3T32+YmVBsC6D2IQVCzsEb2jY3zpwhJsaeL2DqPLwxZU57uOJrZm44+ZS/PKZerqpLnJaAoAAHSckePEs6MmYSBqFnlSRNIWQFCaieN7y/we1HhrACPiQ64h+JNEDn2uTVBqPiU64cZbVHUjAemnaovZQ/DaIRXkdwEXkEJ1scyZ/w9koM8d3o/9/dKAiP+k/YKBs1SjW9ZlLotg1uAwcxDR50xmXrZtq+Jy3nFGuiv0UQRS6xg0DgkE6u1sUjp2WG8WdDVBdtJsoyK4Jzvt2886TED5mqRo6
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 17:10:26.7955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2175ef-fa21-408a-4f83-08deffa7187a
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16457

The double VLAN bits (EDVLP, ESVL, DOVLTC) are currently handled inside
update_vlan_hash(). This ties the double VLAN state to the hash filter
update, even though the two features are independent: hash filtering is
controlled by dma_cap.vlhash and double vlan by dma_cap.dvlan.

In preparation for removing double vlan support from dwmac4, move the
double vlan logic into a separate update_dvlan_state() VLAN operation.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes: None.

 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  6 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +--
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 45 ++++++++-----------
 3 files changed, 25 insertions(+), 32 deletions(-)

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
index 880cf3fab913..802f9e67a4bc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6820,10 +6820,10 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 	if (!netif_running(priv->dev))
 		return 0;
 
-	if (!priv->dma_cap.dvlan)
-		is_double = false;
+	if (priv->dma_cap.dvlan)
+		stmmac_update_dvlan_state(priv, priv->hw, is_double);
 
-	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
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


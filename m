Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD4582BA4;
	Tue,  8 Sep 2026 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885841; cv=fail; b=GN+CF50qlDUSFLrEH00mEkWvqygf6M/JhVIdypurTkN7wsjYzfmxZaCOYe5i5DxEgEuoHEZiBfByRrIWpgRYPfjbk1bGYVpjy3K4PM2Ul0MrKDQ6RayIG00dK6U4SXLK6Je0nYJDkdnpYvAAPB58RwkfhSmk21qbMY6LjFW4zuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885841; c=relaxed/simple;
	bh=gcO88G0eCIoWVIuyI3fTGIOyY8wY+0fFMbErkN52Bog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXKKJPiKHwHT4k+//dttmztvYK4V5nUkxzptnxerQPy9467XEhhZSye7DV9+dr4KLhO37Iddrn6+/OwbJGn/j1uLgHn1orINLJ7OeIAdYIpODKs67sz16wNPg1WhwL/5R/0kl4Eux4MXZaRvvzPnzi7YpYzP13ynLiL9QGCh3YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fjJe3sdG; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fjJe3sdG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWWCYgjm98cbUsMzzYMAMk1eF2AtF9BOc7bJvQdUALw2laiGavS0CHWwOkuSGCaFX6d99oXrlT0dwyttlNkYvK7vDyKRDuMbOILVUZVM0xPaJUwAo3+uuFtwFqUiDL/YTAKP6hoqVbOXnIQXaHu7yICO5iuShcztPp2OuSbsrPBfLQZNBLXT0xzlMrU8W8/RNhBJuNDJ+lLCZDyWqzYlUbI7KKA/W5z/3+8LxoHDp93a8ldsoEHA/xslcVUZ3H8x+FVGaxxlbe22H6Ho59gj1ZpeRu/zZD0wyFU57yadl09ZP8CkQIydvUbOfRl1/Xm5i9gLUnjv9n7qoM6p0+QW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUbDH/ZLw3gCQh8hLEflFD+nCbuDOKX0lc4242CRbGI=;
 b=et5iv8OnK3KdEPhmGKN61ypi7UFb8DA/LQ6gLihlLhGMFG37KRQ5hW6ZzqZsTAeq2b24i7cvw/NY/BtbIbvu02iYR/BE4IUEY/tw75R+anD2BXnnEmMk6PkiJCfOaQU4NfGBOxSGqh/PI5JWCJ5FsEcXCn4QznmcmWgyYvv2B6Qn6iv11NpqwzZP1dMmE1ATk31TRbZAcyo9+hkleC3oi6zgqfapuziQdWx2IN/PIPKcLmc+glsOHddA3pDBdZriFfZjn+KSPnW0YLiJ9JDyDZ+Z1SDH9l1o+f7lT1oHnhdBQ9Obyqe+6336DHbW2/WitnVeScJqrco+LvgXvrv+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUbDH/ZLw3gCQh8hLEflFD+nCbuDOKX0lc4242CRbGI=;
 b=fjJe3sdGd5QqqQPwcG1CrzK2chV6a2o4eiu94Jpw/5z7fUpG18D36mqSvagSruuPpbMXOp4nV3irtJEuxhJ8i5ELXQeOgGJj9sq0g26T6iUxI5fYZqSpM6oSYKmzNBBVE+WyelHuywQssfkzT28e1oI8x6COt5SuLJ916jWjnSM=
Received: from OS7PR01CA0002.jpnprd01.prod.outlook.com (2603:1096:604:251::11)
 by TYCPR01MB10651.jpnprd01.prod.outlook.com (2603:1096:400:293::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 16:43:51 +0000
Received: from OS1PEPF0000D210.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:251:cafe::8b) by OS7PR01CA0002.outlook.office365.com
 (2603:1096:604:251::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 8
 Sep 2026 16:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D210.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 16:43:50 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.55])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id F42213000450;
	Wed,  9 Sep 2026 01:43:44 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	recv.jo@gmail.com,
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
Subject: [PATCH net v4 2/7] net: stmmac: Stop toggling the EDVLP bit
Date: Tue,  8 Sep 2026 16:43:04 +0000
Message-ID: <20260908164309.59282-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D210:EE_|TYCPR01MB10651:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f47e976f-d4b0-4ff6-f7da-08df0dc85c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|921020|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qTrFH5faIrWlvmTi6OyoFvvu75BkqcxBoBAmWz4HlxnIVQcQ9JQ9EsrvTcBgBopqfDNukvIo6TQwwrIDsmsJaFIypP8lRorxQeTUtRKMwWGFFPEWWnUks3KVzSKLj1jM30x2R5+bUBQmtXy+9lkJ8Y0X4HL0xdr+0K55IOvMlGqlA/1mtDdY6wnmZbEXfNN1W+jDUkY49BxYY4dxLdtPP0lXXHruakN9L4PSJVfSYwN5fMG3xcNCASJNcu/CQnnRZ82ECvXWzjgX76a45JC7jQDBUcM6IpgCoV+UWfRHfhBxGGyf3iaj5AYqYICFLulGqjghwOulE7MYc/uqoXOVVr1he52J3r6eEJasgMtYTI4nJGi9rq7WOA27w1E8HlnRDY8t1OLYT83d1Jyaq4Pkzs1x/2OTnqnVbYajrSuhtxKXZHoNTcZgRBRFmyK4bKBsQS7VcY4mENMatGqEbJfCm0JroSympAwRkyAppkwRB07nvOO9hRl40b84MC+psuo82ME0IvQUBuiz7iGVGnIu87FvtFCvLPbKIxqKjomjLxl06nVqTJMCFRpx+GNMJfVXlL/xikMXM5SVIIG+Z9A05ldbBYKVaTPgYVrjmiEJybwouG89we/KY9MBh/x6wWAHGBPHEZ1KCED1RnV/OZF9puKUXZegoTjeK9pxYrHv0PJA7cP5ectgkQOIgt3OYbp+kyhUDdwYSqaOKu5tpVpLLsz6XlBBj5EdKOI/yU7ppQ8EnVJs98XRxEbU8RDZA6gd
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(921020)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zjTa/mfX5yC3aYO+/VqOfywA8KLT/++i3PttQSNhPbYOsvsIH1dNqurfnNabAWTtF7Kg11/vn9XtcK5naFNm94yAg9X+0VizgLSGXuYFCSikszCpMFncVihn18dJuPvAE8gpHOak9e5P8iH3A4ZlfSy6aqM87iXrlMg16tcEZsPFnkqaOM1ne2Rrm+j5jr5Uz7SFzTmQUPpGB9Kt5jck6RjvozODvc0a83b92Za7ll9hNx5/UjC1h0onD6zmeOyl7EbduqEbokdNi9oiM4pjwSTXCxX6JIIohhr7X4KCmznDn7OOrnkkkgRPDueu76R+pkezEAPBNskonZYBnWJh65JHgyuSpJGaj3gn7UI5om8568zzKLEpKG5e0f7J8SIY2voMKRQy18AFSYMkqt7sYIV1UXmMvpVLCiRftqrCyPYLCvKsA0Ewn+OCTRPXEBwE
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:43:50.7092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f47e976f-d4b0-4ff6-f7da-08df0dc85c93
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D210.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10651

Currently, the EDVLP bit is toggled whenever an 802.1ad VLAN is
registered. This bit enables the double VLAN feature, which provides
a way to insert, extract and filter an additional inner VLAN tag, and
has nothing to do with S-Tag handling.

Move EDVLP handling into vlan_set_hw_mode() instead, and keep it always
enabled, so that COE can work for packets with an inner VLAN header.
Add a dedicated callback for dwxlgmac2, as it doesn't implement the
set_hw_vlan_mode callback, like the other cores.

Suggested-by: Joseph Steel <recv.jo@gmail.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v4 changes:
- New patch.

 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index 983a90cb9767..200b34588c7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -174,19 +174,16 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 	if (hash) {
 		value |= VLAN_VTHM | VLAN_ETV;
 		if (is_double) {
-			value |= VLAN_EDVLP;
 			value |= VLAN_ESVL;
 			value |= VLAN_DOVLTC;
 		} else {
-			value &= ~VLAN_EDVLP;
 			value &= ~VLAN_ESVL;
 			value &= ~VLAN_DOVLTC;
 		}
 
 		writel(value, ioaddr + VLAN_TAG);
 	} else {
-		value &= ~(VLAN_VTHM | VLAN_ETV);
-		value &= ~(VLAN_EDVLP | VLAN_ESVL);
+		value &= ~(VLAN_VTHM | VLAN_ETV | VLAN_ESVL);
 		value &= ~VLAN_DOVLTC;
 		value &= ~VLAN_VID;
 
@@ -222,6 +219,7 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + VLAN_TAG);
 
+	value |= VLAN_EDVLP;
 	value &= ~VLAN_TAG_CTRL_EVLS_MASK;
 
 	if (hw->hw_vlan_en)
@@ -254,11 +252,9 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		value |= VLAN_VTHM | VLAN_ETV;
 		if (is_double) {
-			value |= VLAN_EDVLP;
 			value |= VLAN_ESVL;
 			value |= VLAN_DOVLTC;
 		} else {
-			value &= ~VLAN_EDVLP;
 			value &= ~VLAN_ESVL;
 			value &= ~VLAN_DOVLTC;
 		}
@@ -274,8 +270,7 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		value = readl(ioaddr + VLAN_TAG);
 
-		value &= ~(VLAN_VTHM | VLAN_ETV);
-		value &= ~(VLAN_EDVLP | VLAN_ESVL);
+		value &= ~(VLAN_VTHM | VLAN_ETV | VLAN_ESVL);
 		value &= ~VLAN_DOVLTC;
 		value &= ~VLAN_VID;
 
@@ -283,6 +278,14 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 	}
 }
 
+static void dwxlgmac2_set_hw_vlan_mode(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 value = readl(ioaddr + VLAN_TAG);
+
+	writel(value | VLAN_EDVLP, ioaddr + VLAN_TAG);
+}
+
 const struct stmmac_vlan_ops dwmac_vlan_ops = {
 	.update_vlan_hash = vlan_update_hash,
 	.enable_vlan = vlan_enable,
@@ -296,6 +299,7 @@ const struct stmmac_vlan_ops dwmac_vlan_ops = {
 const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
 	.update_vlan_hash = dwxgmac2_update_vlan_hash,
 	.enable_vlan = vlan_enable,
+	.set_hw_vlan_mode = dwxlgmac2_set_hw_vlan_mode,
 };
 
 const struct stmmac_vlan_ops dwxgmac210_vlan_ops = {
-- 
2.34.1


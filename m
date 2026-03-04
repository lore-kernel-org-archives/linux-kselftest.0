Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4423F366DC5;
	Wed,  4 Mar 2026 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641472; cv=fail; b=HB6VFqVxwGDJR2Q0E9vqOX017Fp7FzbxJYsz1ChzbtKhW2YJPQvuEvv8oZb5PFstZ7D8wfWnbJZrmZkNb3Bg0wWzNpnSFOxMpZiJARsc2GoHkPEDUv9qAXhgYCO1GZ7HZQ++ZieiObd6wpxIGjfii+MG1qzNU5tRPN3UmwdqOCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641472; c=relaxed/simple;
	bh=T85rMFDEw6ywSVLcTveVzRasSaNBB8DlwiMHBy3DKLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tcebp988Foc1PPUFfgEqlUiZfyOa+dFS1UKhVvgIoAiMBnpvGfdxXZJcdjPVXJRa04Lt252ctx/r/mhHt9+cm0KhoxUYTqOVLA5xqc4sK4DErKD39XZRufPilXp5QrY2Lshbc1AR02DNXp7GkVtAtCvETwGxl1uDae8e+fGlHcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KNMqqpR0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=K2aTSBWf; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KNMqqpR0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="K2aTSBWf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6243vN4C1677153;
	Wed, 4 Mar 2026 10:24:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=T0xHQ3djXeDr1H1/RCg7qZSveVnh4K4Kbbjpk/nTpwE=; b=
	KNMqqpR0JYRbHxUCEWiZtnTFHSqxrjCbXvnkIDfx0dCso0rRi8FbSuTJmstMF+cW
	tdk/wKGx4bIPwe7tPhnPgt932yPPsg7M6QbqaF8bI1nY/oEQYe4Dfld7hqeSy1kK
	a7IUyKTF7UIiY68FEL0gkUWvFTdPIRoZC2ZTyZXVNUOX6XG/bwhcAYCYfy8WtIVg
	wK6O3C7OivUphA+YtQyplD/2whDyeNnfBe4RWKWgbUGurLXIWkdXLVwIHCB9J1Vj
	HnoSzfhD855cPIVClryz2FfHv/oaOlPw1+DPfe3COq5wHdrvwzRTt16Xbk5CG33S
	t5NxXIpe2MbNhYrrqHKmfw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020082.outbound.protection.outlook.com [52.101.201.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn050am-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 10:24:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zK+JiAFUJr5lEtam6PYMrafSmBWtIR63dZp9DqIiCahFqsSQlzN9VaFOwq/1Ol95wORfENE8ISFSxu9jd+9arkmac/+bthq/hRQgbsvnL/YTrOp/1e0NP6DJhFb4KVQ7oDt2cTYwfHHI/lVrwKVYfF68eRtn3Gci8nipx+5/UI6nwcDlmSmqtN5kdYqyJYjwfIlngeMhNVd0/8BqQD2HCOUnGYVePam9SlnzAfwrCarT7WxIsmV/Gk31yqWFm3eaDaC95L3CuhMHyTvjtR4wzY0RGPH2Vem85QMtdKi5JHJfnt0b0NLqVIR3LlYQSlRsZOWiPUJQC7rcVjFNKyF6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0xHQ3djXeDr1H1/RCg7qZSveVnh4K4Kbbjpk/nTpwE=;
 b=AMoUKwZbzCvBTjREELJRdoghilzh3Evw9sUIqQfLZeaAsQ5HjTSmS8yy4F5If4yl2EX1N5EGl9iHkZL19fDkpTBTuvRYwMB4vuyPUoQuy2iZNfB3MSO6Osr20HIIuRtVL79y5AMHrZjHveVCYUQBaqtAaxu7z11yJ28VAvp2827UkRuqrCBO4xtL3DTtzHKL4t8GFfEcd1HByeJ/xbMcdYRYbgZMFOR472HYu6Ezpn9xvcX2wxAjXfnqXxVJxKPMcJChmTWneLj0rDQ3CWa94/UbJeQMD+FJDvgHhGk08QqZSQPA8Arpn0f2flf3ncRq4L/I8WTpxXDg5u4tx3rQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0xHQ3djXeDr1H1/RCg7qZSveVnh4K4Kbbjpk/nTpwE=;
 b=K2aTSBWfmTR5+UWecQTKODbHMRNFN6K44iavVqNuJ4vGQQ2/PUF2ZzLIDVmUmOw324FsdnESiZ2i8tQdCzy4UoLNUpBChZyZCXILV1Jef3sgv2XU/IRAOI5hNWMEbFbsn0l1o4B/lODrY3dqp17p3MDuqxC3GH+HTyzxdQKFsLs=
Received: from BYAPR06CA0021.namprd06.prod.outlook.com (2603:10b6:a03:d4::34)
 by SN4PR19MB5469.namprd19.prod.outlook.com (2603:10b6:806:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 16:24:06 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::3c) by BYAPR06CA0021.outlook.office365.com
 (2603:10b6:a03:d4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 4 Mar 2026 16:24:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Wed, 4 Mar 2026 16:24:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 11A6E40654F;
	Wed,  4 Mar 2026 16:24:03 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E0560820257;
	Wed,  4 Mar 2026 16:24:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, brendan.higgins@linux.dev, davidgow@google.com,
        raemoar63@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/4] ASoC: cs35l56: KUnit tests for setting dsp.system_name
Date: Wed,  4 Mar 2026 16:23:59 +0000
Message-ID: <20260304162402.1714759-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304162402.1714759-1-rf@opensource.cirrus.com>
References: <20260304162402.1714759-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|SN4PR19MB5469:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0ca9eeb4-4e4a-4119-0792-08de7a0a7403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	FfndES+wNrFRVVBASvzgWqwAAWQdDYYWC4KimMQBygAjrslm5FmBOd/E8f8Q0g2atrXoNZ0lTpjNkJkGttIYbHaXWFzKPDMh95FtC05XnlhThmuPX1NaN2UqcNN6+04kRb5GYtaPalDpwZ+PbCQcXYGtuB3T3DDTZIUrGTGviszp9YMdvNuMtIOiqHNdC0V16ymayKS4jDnwO35kc5vGObt+fKFfH8bMoML3yPhcC7bwjbx25n6ENKVM/M9Whz8kIpzjU74xeyIXtQcboedgmDar9GxsCSvBxB8lFjifMtisk9WuDeqCcUlbNO8OiI9m2I12JFXrwqik8zqzDWn+cKx+gFFl3nhtly64poDOkfqbosPMIhLCD/EJL4wu2A8e0gVAhOL7mJu8vTQYMV327gAB8coAmn4HRTRyOLIne0LdaBp32UiiWKyynsJ1k9CWu3LRSar1WPKZtA6AOo6VHBxqn1waedD8bgql/sVNPFA7M20wkQoYKEHSAtO0csGS83kq/NUUtMXzojNCNIl0dWsriIUn4y3tcoObOydGxPr7J4CXuIgm2vIB4R1nPEQvpvMPzri5hRz/8NctNjoZ64opIjXwJuDD1MEkCmhMywMsc/SryBEAzvfvidZItUrprsvJ6yqL1Su3180Opm14rzVfuiQoDdyeZbAaRhPGT2VVUfTVrh62WxeYZ86fpGb9TTJuZM1rAcBVsgOuuw+7sF+D6dxpyyLGnfL1wru170LPQmFtv6Z/XmpeT4TbziiOSXkO+M8Qkc5vwDydhX/OAw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Iywzr6NUKEOGsDiK/YVlamEBte65cmBUnnkDzNdl8uQJHt8cSZro9iJAkt+wgqspJ+NLNVqzKfC2WKSQ2nORiKvbhHFkxFsUFrPOWFu/Q0HzgIwBEqCekAswrKE4/aRxB4WJ2rlH3NgoEwcX/2v0GHRleQV9SX9C3DTzk6EwA3g0FeZji3WbypXMnyPgolFX9v5mv8UhdUCT8GiCdh74y6SpIz8oltUhdOH/lKNYJ+UzvjRJroX/WwraD9VLv4Kj/a9EcfXZTqSqC9gACfhUY/APFcL/ByCYmhBxMlJyrGuifHoYLLmDkC+5JXAvDPlicKtE2WWE9IpmRxbEwj+IM2udagwcM9QPtoUvnkEULBDM4zrvX6KmT7frEMlqT6DDchYEvu/0v9qE6agzK8B9L7lbzkjrtS0gAYxjVeSHp/Ys7dRv5onVcj1W72BLPJaJ
X-Exchange-RoutingPolicyChecked:
	eFQ4hF+mb04bDQD8t9RlBA0/AAX/XTFMvOPs6coRQ6kGmiD0VjjOga5hzCAbSUsq096GuCjDK6xGv7SzQIJC+pFBC6I/oC5LGu/WPG9FuIWuFBkxNK26mydq/p9tw57TVQogPxNIH/sVZ9xF/X1ZkWaMaRGtxv+7y24P39ebr41dnP9V4S3Wl207V7XSRRmGQUVT8nQf6RF7UgWJChB/B6W1qxEhz5a5njzwu7KZw6GY+6fGY6OlGmkwqWuDnAZSWTvlHoCFJNfUNXg1W8/TVQ9sUOehJdxirJ3qE1dgO8ZmBDzUBoiO5ptfl5eu4m9kRtxoheXm/VWdSHyP22YKGA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:24:04.4486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca9eeb4-4e4a-4119-0792-08de7a0a7403
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB5469
X-Proofpoint-GUID: g3k27OVwptk9tiZ_GK2oNcscFx2YUH3T
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69a85cab cx=c_pps
 a=UUrofF6GnltCzEOzQKub5w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=QcELtSb__itFNwugZkUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEzMyBTYWx0ZWRfX2WgsqcvXId6N
 SeidLP1DXBNMdSLQaBlZBjqlJCRmAYC37pDF1lDCBq0txOcpBvn9V7h15BF+nSX9gyMOL3anUOL
 yt/im+BmlljjeNOAFs0Fkn2Hof1mWzDzihbxG9nNTRcKJohVIfxnDm0X2raYWtghmL7qYJMSyWW
 /Ysl9pz2UJqpsSovL2t+vg0u+jtbtoIqaFr9ujkH8xHXwMUu1A3wliZVCplhvuvLfsjW56TUWyw
 ieAfwulRGcUC3Z5/cijQvXzKetYrzjUtZ0nFJ9BwTVnA7pxVm/5rIkvbRRCQE/vcU2VGSvkrycO
 /moCbfP1EVuEdUHQLUpFHydx7E8dDh2fSvQZzATRMxZ/Kz4iTIxhk74ZOufpG/gpzAcuq2fR7Dw
 Qm8/aQUFqqLJMuLeODBZXSIAS2s4IBKw1blUDR/STyx8kAMKEvqnt/TcCOLuLprOKqm7WJFfDQf
 gX7UWFIEK0FsLnC4wUg==
X-Proofpoint-ORIG-GUID: g3k27OVwptk9tiZ_GK2oNcscFx2YUH3T
X-Proofpoint-Spam-Reason: safe

Add KUnit tests for setting the dsp.system_name string.

There are two sources of the string:

1. PCI SSID from struct snd_soc_card.
2. "cirrus,firmware-uid" property.

Either of these can then be qualified by a speaker ID integer.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-test.c | 80 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c      |  3 +-
 sound/soc/codecs/cs35l56.h      |  1 +
 3 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index decedf76847d..ac3f34bf8adc 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -74,6 +74,78 @@ static const char *cs35l56_test_devm_get_vendor_specific_variant_id_none(struct
 	return ERR_PTR(-ENOENT);
 }
 
+static void cs35l56_test_system_name_from_ssid(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	cs35l56->speaker_id = -1;
+	snd_soc_card_set_pci_ssid(cs35l56->component->card, 0x12b4, 0xa7c8);
+
+	KUNIT_EXPECT_EQ(test, cs35l56_get_firmware_uid(cs35l56), 0);
+	KUNIT_EXPECT_EQ(test, cs35l56_set_fw_name(cs35l56->component), 0);
+	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.system_name, "12b4a7c8");
+}
+
+static void cs35l56_test_system_name_from_ssid_and_spkid(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	cs35l56->speaker_id = 1;
+	snd_soc_card_set_pci_ssid(cs35l56->component->card, 0x12b4, 0xa7c8);
+
+	KUNIT_EXPECT_EQ(test, cs35l56_get_firmware_uid(cs35l56), 0);
+	KUNIT_EXPECT_EQ(test, cs35l56_set_fw_name(cs35l56->component), 0);
+	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.system_name, "12b4a7c8-spkid1");
+}
+
+static void cs35l56_test_system_name_from_property(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+	const struct property_entry dev_props[] = {
+		PROPERTY_ENTRY_STRING("cirrus,firmware-uid", "acme"),
+		{ }
+	};
+	const struct software_node dev_node = SOFTWARE_NODE("SPK1", dev_props, NULL);
+
+	cs35l56->speaker_id = -1;
+
+	KUNIT_ASSERT_EQ(test, device_add_software_node(cs35l56->base.dev, &dev_node), 0);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  device_remove_software_node_wrapper,
+						  cs35l56->base.dev));
+
+	KUNIT_EXPECT_EQ(test, cs35l56_get_firmware_uid(cs35l56), 0);
+	KUNIT_EXPECT_EQ(test, cs35l56_set_fw_name(cs35l56->component), 0);
+	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.system_name, "acme");
+}
+
+static void cs35l56_test_system_name_from_property_and_spkid(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+	const struct property_entry dev_props[] = {
+		PROPERTY_ENTRY_STRING("cirrus,firmware-uid", "acme"),
+		{ }
+	};
+	const struct software_node dev_node = SOFTWARE_NODE("SPK1", dev_props, NULL);
+
+	cs35l56->speaker_id = 1;
+
+	KUNIT_ASSERT_EQ(test, device_add_software_node(cs35l56->base.dev, &dev_node), 0);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  device_remove_software_node_wrapper,
+						  cs35l56->base.dev));
+
+	KUNIT_EXPECT_EQ(test, cs35l56_get_firmware_uid(cs35l56), 0);
+	KUNIT_EXPECT_EQ(test, cs35l56_set_fw_name(cs35l56->component), 0);
+	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.system_name, "acme-spkid1");
+}
+
 static void cs35l56_test_l56_b0_suffix_sdw(struct kunit *test)
 {
 	struct cs35l56_test_priv *priv = test->priv;
@@ -596,6 +668,10 @@ KUNIT_ARRAY_PARAM(cs35l56_test_type_rev_all, cs35l56_test_type_rev_all_param_cas
 		  cs35l56_test_type_rev_param_desc);
 
 static struct kunit_case cs35l56_test_cases_soundwire[] = {
+	KUNIT_CASE(cs35l56_test_system_name_from_ssid),
+	KUNIT_CASE(cs35l56_test_system_name_from_ssid_and_spkid),
+	KUNIT_CASE(cs35l56_test_system_name_from_property),
+	KUNIT_CASE(cs35l56_test_system_name_from_property_and_spkid),
 	KUNIT_CASE(cs35l56_test_l56_b0_suffix_sdw),
 	KUNIT_CASE_PARAM(cs35l56_test_suffix_sdw, cs35l56_test_type_rev_ex_b0_gen_params),
 	KUNIT_CASE_PARAM(cs35l56_test_ssidexv2_suffix_sdw,
@@ -613,6 +689,10 @@ static struct kunit_case cs35l56_test_cases_soundwire[] = {
 };
 
 static struct kunit_case cs35l56_test_cases_not_soundwire[] = {
+	KUNIT_CASE(cs35l56_test_system_name_from_ssid),
+	KUNIT_CASE(cs35l56_test_system_name_from_ssid_and_spkid),
+	KUNIT_CASE(cs35l56_test_system_name_from_property),
+	KUNIT_CASE(cs35l56_test_system_name_from_property_and_spkid),
 	KUNIT_CASE_PARAM(cs35l56_test_suffix_i2cspi, cs35l56_test_type_rev_all_gen_params),
 	KUNIT_CASE_PARAM(cs35l56_test_ssidexv2_suffix_i2cspi,
 			 cs35l56_test_type_rev_all_gen_params),
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 37909a319f88..9d35797e000a 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1669,7 +1669,7 @@ VISIBLE_IF_KUNIT int cs35l56_process_xu_properties(struct cs35l56_private *cs35l
 }
 EXPORT_SYMBOL_IF_KUNIT(cs35l56_process_xu_properties);
 
-static int cs35l56_get_firmware_uid(struct cs35l56_private *cs35l56)
+VISIBLE_IF_KUNIT int cs35l56_get_firmware_uid(struct cs35l56_private *cs35l56)
 {
 	struct device *dev = cs35l56->base.dev;
 	const char *prop;
@@ -1694,6 +1694,7 @@ static int cs35l56_get_firmware_uid(struct cs35l56_private *cs35l56)
 
 	return 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(cs35l56_get_firmware_uid);
 
 /*
  * Some SoundWire laptops have a spk-id-gpios property but it points to
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 691f857d0bd8..747529be3e2e 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -78,6 +78,7 @@ void cs35l56_remove(struct cs35l56_private *cs35l56);
 int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56);
 int cs35l56_set_fw_name(struct snd_soc_component *component);
 int cs35l56_process_xu_properties(struct cs35l56_private *cs35l56);
+int cs35l56_get_firmware_uid(struct cs35l56_private *cs35l56);
 #endif
 
 #endif /* ifndef CS35L56_H */
-- 
2.47.3


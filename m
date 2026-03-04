Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158C33644C8;
	Wed,  4 Mar 2026 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641463; cv=fail; b=XM/vCwJmi60byLdOxNE7HWgDdYUavNSViUfpavyLtDRes6cAaek/cn+acmrPGfQdATi0tgSzCeoDgeGrYx2g/Opeet4XloIfBa3iG58LyYDOAr9kbrXPMI5c+2AgIguUHwqh+f/LZvP14GPpr+/xdlGD840SqeI55FNQur3aVjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641463; c=relaxed/simple;
	bh=07+nRWjkZVXabPkWdT0dm7S0daLud5UTsw1d8e9f+vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJAQmNCpTKJa8QUe8IsEwDygJgo6Qw1LtMhp/Xv1N6LsLX1B2NliOKlFEMHXlz+NBCOr9E/80hIIVztj8WgJefPf6VRkk+J3LN1quJOnaSLEz3pyS1XMx1owTrlgUkUWMnJflSo0D+Wv8h4G+fvVq3JfMeJwrlk5X5SfdT7TWJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R3T3N1/L; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=i/84lEsE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R3T3N1/L";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="i/84lEsE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245HEKj2857071;
	Wed, 4 Mar 2026 10:24:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=I6ZSgXgMlFE3q5KmKAiRiaxFeLNt4MAO11khx8ePfHc=; b=
	R3T3N1/LMolagQ5QP3vRttR3F8V31rGWxnBjUACoMNfhg93omUIGabU7Zz3va4ia
	jh/Wm+AAeeKDgK0wgjfhU51YIJUB3F7j+uOXEf5jvbRkLyjOmlwVWRZd+blY5G4t
	D37fWZ1jle13dsmS6X2KBDpNGxi+pUZ78R8SFRyrO2OL3G5QdAtL+5Y4D7JwPo3E
	N6rSLP6y1YSk+FqsB0x+TpjJXpZ3AZKadn1UJNAPRWuba/6ZIpsjKcYk/zWlUSAC
	sCI7Iin6gz3badWILfgZ/4LOnFHqaW7Uzk/+mVaTDGLOmekXk9T2QO07tS3kEFjF
	GTNZguXyCgwCm2pedLcxFg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021141.outbound.protection.outlook.com [52.101.52.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ckwnn51m1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 10:24:08 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMAc9PmQdMTmh2/y+ms0rGe9aJT3RbF9+Wl67VAHt6eWpeUbBvbARjIEroNC1OfmVsJX9SRtzU/dP6d2z0j9vI4mFNeruoBP8QDg/uv9bRwTs+NurpOuwX5K7cZ0khD7LjyAedLPqE5IBznwOlZwhk11D5ZbGBv3lNM3dElxCUYxAVFBjlJrn1k9ypUi0vql8ra6bPNeTwJpMSeWv0VFOm5Av+8EGdghGBzySOcPHcSuRGqhlLMmGGNUyL+VRDGqMbHCHpwOEeJIX10eWLdVc7yQBr5/ScHXleZeZasrVaROutxyN/UpBDTe/Y4c2TBEcb+GFzPNmNgBNfLloYsUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6ZSgXgMlFE3q5KmKAiRiaxFeLNt4MAO11khx8ePfHc=;
 b=HjayBkseRaWQAwp7IkZphIZgqOKyr/jQA8/2rJuep/NS7LP+yzcK/mP3EpvsGEt2ZsRPTpf0DF5KaoTQFMJwFAHLse2faNzvYkNNfwhRwobtDyPh1k8DQjF8/vSBdzemBSCXpL2Akx5u5OzMAtZC867S9IyFXVTaHByfjwvc7jQSGobt2zZSn9s7z6+jBmkRMcolQP2ADzxfFNUWvfXjY8QGImFCuBRHujpFSvsIqyb3KT/hie8mWo/Zka8RjLsjCttaOBss3pxj3wUigtbdDPp2kPRd5393R8cw3FqK1hueVt3rDaJZCLsYhRPuKippu2BBj/RyFTxP7C3TreSF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6ZSgXgMlFE3q5KmKAiRiaxFeLNt4MAO11khx8ePfHc=;
 b=i/84lEsE98c/aLskl9HLJb5f5kjuwTLiVCiBNGbPX19lE7ezO2rjfWCKs02v9WYtiWBJjoMME6JTUVKCLDdl0PvZyDy0oJOJwQTR4or6BD6ES10w4nTaLhLUXpldO/yHTf6liOnZagbCer082E+HN+dHh6TGTu/9mIjP7xRuxzc=
Received: from CH0PR03CA0102.namprd03.prod.outlook.com (2603:10b6:610:cd::17)
 by PH0PR19MB5195.namprd19.prod.outlook.com (2603:10b6:510:94::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 16:24:04 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::af) by CH0PR03CA0102.outlook.office365.com
 (2603:10b6:610:cd::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 16:24:00 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 4 Mar 2026 16:24:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1A69B406550;
	Wed,  4 Mar 2026 16:24:03 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EEE01820258;
	Wed,  4 Mar 2026 16:24:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, brendan.higgins@linux.dev, davidgow@google.com,
        raemoar63@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/4] ASoC: cs35l56: Some KUnit testing of cs35l56_get_speaker_id()
Date: Wed,  4 Mar 2026 16:24:00 +0000
Message-ID: <20260304162402.1714759-3-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|PH0PR19MB5195:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 39e831a2-bea8-4dd0-7db3-08de7a0a73b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	YFPKdf3KfLPkE89jHFxmUPIzVgV6TOVFwPWoMuR7J1QvbKq47KFYxxrhv2hvkx6umS1cQ5kZXkLvoXE7YTCEK1dvHwOoWfbJxnoNwx07w2tQclE+kuCFa7Hl49x1Zyf4V+AMf+uWSE8mclvYgG8BGOhTMc3eEPctX+b/KwMAsqWmbT59zVEHY4p2dHwI4Wx/FAOxlL1soERZ5TwQAKvtVClquQeuLSdeBmWAhBi7QxCLURn3adRC3ANlatBW62pvyHAfvklbL3xHsPFDV6HS17Jr+AwA+HSHZVowRqVDozAXg6hZxFIkk24M6KzRx/7RQ106RfOI12a0pA/gcS/FU376eO3+V437Sh1skAEHhSIDd+SEjq+5RYjfShVvYW0hhX/UlJSbQSCRKYzwiDisFlyIv68rern3D/Ix56XdIgx/6GfyNTLXYh5mQHzu3rKi7YRtdsDb9NIGEiKuaYL1C35boo6g5JKrZ6sQj6e+4zBMkB3cDSTrvmKNb5AQfC66eyz35ty1nZqJ7pHHkCW0mZX+g26Go/jlCxac66RF5BPTmk+/sYYJ1il+HsGULHB8a4VxX05dtT5RgKYyHqAjm8Sx874ygMBZIakCz+jzF+SzBSEKZs04l3QSnGQjxxJHZGBq9z+J0Q9RVSqLiZK6+I03bgCqAszCnB/UdAPQ/YnvcYEUiWJWS9JUzKv97+ratQXzczf36dqFywZ4KIuEeXyEI/3vjq8Q3R/KaSJIm1Gsbag5x41XTjitOplqvsr3c0cr/29xA0y0fSCjMtaRsw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SS2aYB+dtHwqySnu2XE4Hy3auPE0RIJEixznvpATms7yUQVlTBRLW2XfwfFIKIKBJv8FTX7xswbPTOFI+v2Wz9Jx3eqtNOBmmvvgMGmSVV64EiKr5UtzXSUA2zeIqJtmra9EXPCMPovgPaICHmJy/uELhFQO/w05IiukslftEc1sOMgGf0fax8sTajOtA40VGXbzs60BGatcHM2+BwQdWkUbdS/5KFmz1c4hV58NILTnBx7dss+GOXNlsfO2q3ZgUauWe1V//2QmtmWBx9nCzrKYVo5rOX4kI2GT+7OcN2XBNOp6ORLBRzjFtFAlMJtqILc+RQ4XZOWZ9Sn1ZSDBfgDFvGgQcUQV99ZpTRLPR/0whItE7pVPZw+VK1HaXGdrjaJDnaNDip2zqTslnVacegO2SZbZ5V+JaoCob5fhdAiwybw0ZcxZAoLAGzU642kO
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:24:04.0080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e831a2-bea8-4dd0-7db3-08de7a0a73b0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5195
X-Proofpoint-GUID: -jLvsNQdCTC6ZwX37ItmdjATx9TzNjRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEzMyBTYWx0ZWRfXxcKy3vck+Kpn
 oJupcnYSTUGqFPTOOHH0b6KOKUJcA4DEtmkZ1XbNk+Oow35nn7C1vo5VYHJyreSgDSbmCM64gnz
 FTiDWeydbowL1CQWjXiZoOkpABxzl30YXsCHiWU/zlMcw/n0p5+k/KKIVUNeejcqyHZ0QrA/X4G
 V5IZrtwBUs/GR1USmna/33JkLjzdVVgCRaGGIkbkrMImt2mt4CQcN34W64oXvVEzX80cGbJyRke
 XRuF8eB5/xOglIY+JavMx6u7M+LyHLem4V0UoPewDsu0kgHtzryAi52Vc0sQ3v9MSDrvuC8fg/l
 mqkQxm6Z1ySfs7kU70CXtG2qEmR20mO6yVD+4Y9fGC+2HFHBCqlJsqH7qv7mpZ3Y2W3H9eacfcX
 P0LjE0MdsljPw9G/FxCBSNLun6ogpg3WLDtDyWwuFowR7qNrRT5/UrDgfY0MO++52TQdMWg+BIn
 ncBBmDDCXzcNnDRrklg==
X-Authority-Analysis: v=2.4 cv=ZaIQ98VA c=1 sm=1 tr=0 ts=69a85ca8 cx=c_pps
 a=ATTLtrtrxPgGSLD8O921vA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=kJm_cqfxpSTBmBWTWoYA:9
X-Proofpoint-ORIG-GUID: -jLvsNQdCTC6ZwX37ItmdjATx9TzNjRb
X-Proofpoint-Spam-Reason: safe

Add some KUnit tests for cs35l56_get_speaker_id().
These only test the simpler cases of reading the speaker ID from
cs_amp_get_vendor_spkid() or the "cirrus,speaker-id" property.

The untested case is reading it from GPIOs, which would require
a dummy implementation of a GPIO driver.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib.c          |  2 ++
 sound/soc/codecs/cs35l56-shared-test.c | 43 ++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 8b131975143d..b34b1f5f121f 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -716,6 +716,8 @@ int cs_amp_get_vendor_spkid(struct device *dev)
 {
 	int i, ret;
 
+	KUNIT_STATIC_STUB_REDIRECT(cs_amp_get_vendor_spkid, dev);
+
 	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE) &&
 	    !IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST_HOOKS))
 		return -ENOENT;
diff --git a/sound/soc/codecs/cs35l56-shared-test.c b/sound/soc/codecs/cs35l56-shared-test.c
index 94db02aef7dc..d510893dcd44 100644
--- a/sound/soc/codecs/cs35l56-shared-test.c
+++ b/sound/soc/codecs/cs35l56-shared-test.c
@@ -37,6 +37,10 @@ KUNIT_DEFINE_ACTION_WRAPPER(faux_device_destroy_wrapper, faux_device_destroy,
 
 KUNIT_DEFINE_ACTION_WRAPPER(regmap_exit_wrapper, regmap_exit, struct regmap *)
 
+KUNIT_DEFINE_ACTION_WRAPPER(device_remove_software_node_wrapper,
+			    device_remove_software_node,
+			    struct device *)
+
 static const struct regmap_config cs35l56_shared_test_mock_registers_regmap = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -410,6 +414,41 @@ static void cs35l56_shared_test_onchip_speaker_id_not_defined(struct kunit *test
 	KUNIT_EXPECT_EQ(test, cs35l56_read_onchip_spkid(cs35l56_base), -ENOENT);
 }
 
+/* simulate cs_amp_get_vendor_spkid() reading a vendor-specific ID of 1 */
+static int cs35l56_shared_test_get_vendor_spkid_1(struct device *dev)
+{
+	return 1;
+}
+
+static void cs35l56_shared_test_get_speaker_id_vendor(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+
+	/* Hook cs_amp_get_vendor_spkid() to return an ID of 1 */
+	kunit_activate_static_stub(test, cs_amp_get_vendor_spkid,
+				   cs35l56_shared_test_get_vendor_spkid_1);
+
+	KUNIT_EXPECT_EQ(test, cs35l56_get_speaker_id(priv->cs35l56_base), 1);
+}
+
+static void cs35l56_shared_test_get_speaker_id_property(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	const struct property_entry dev_props[] = {
+		PROPERTY_ENTRY_U32("cirrus,speaker-id", 2),
+		{ }
+	};
+	const struct software_node dev_node = SOFTWARE_NODE("SPK1", dev_props, NULL);
+
+	KUNIT_ASSERT_EQ(test, device_add_software_node(priv->cs35l56_base->dev, &dev_node), 0);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  device_remove_software_node_wrapper,
+						  priv->cs35l56_base->dev));
+
+	KUNIT_EXPECT_EQ(test, cs35l56_get_speaker_id(priv->cs35l56_base), 2);
+}
+
 static int cs35l56_shared_test_case_regmap_init(struct kunit *test,
 						const struct regmap_config *regmap_config)
 {
@@ -616,6 +655,10 @@ static struct kunit_case cs35l56_shared_test_cases[] = {
 			 cs35l56_shared_test_onchip_spkid_pull_gen_params),
 	KUNIT_CASE(cs35l56_shared_test_stash_onchip_spkid_pins_reject_invalid),
 	KUNIT_CASE(cs35l56_shared_test_onchip_speaker_id_not_defined),
+
+	KUNIT_CASE(cs35l56_shared_test_get_speaker_id_vendor),
+	KUNIT_CASE(cs35l56_shared_test_get_speaker_id_property),
+
 	{ }
 };
 
-- 
2.47.3


Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9977A364941;
	Wed,  4 Mar 2026 16:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641464; cv=fail; b=JZ3H6KI33pcVJY3XhxbZmp2Wk11GM0eEvfeBZ1ngVU//VRwAh4DQZoTWgdyOAX+wewtubAdN7EJOIXGMHee9ztAvZ1ViHmhRw57/6cN3BQN01kagCFMSzozN76pjOBZaNknmJcwaWuaEdGW7EIdZyBJGmMa9QWF85JjzKaep57s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641464; c=relaxed/simple;
	bh=2F6QLv86kFcnTfFNtSGBXenLtI9iX2Zso9HqgTooeMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FMO6MmAJ0sj77YC//NYuGDHUxMUHHUyllvMbjzHDBzdforDfGrvevNDbH/CB0rH2aAMLG7NxS4+DoMPbHIp324nPA/sneMZVYJ1trLQ6MgJoA7ieJDD4IH0kGXbEHh84qgPwxqCfxnWkAQIkBaJN4lcgq7K5lT5I25T2HEDKES8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MIGb2UrQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DuPftnx1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MIGb2UrQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DuPftnx1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246k9Pb3004047;
	Wed, 4 Mar 2026 10:24:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rtl1+0mqGT9CWMc6648JJtGdmrua0bxHnnb0kwEGnM4=; b=
	MIGb2UrQq7HLIDnMR60w5/srY85czyAIjHHbYroL+Z+lOQ6SqYdqKedCU4rciuMD
	YqolI3YvSOTYeInudQKR59wxdQP7tT50hzSb7HIMazNM/CEnftmPC2bmIi+rzEky
	HbO7s13CaquoZoB9Oc7ALehVPmb1dFyDCtB8+RIs1XYEygb5U39LVlqDDXidzMOX
	Su713GzNyz7XPe9zM3Ol0nLTVCAjRcBjXfMPSZV+1Xx4Gk0g1ImJF83egEAaO2sn
	suhDGmrrjx5F0qA82d5nNVi3UnCv5rYrg3zGA3ozSQZlAt9ctJsJkOC0Z97sYmgd
	F22eDEhv+zBkFidjrWDi0A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020086.outbound.protection.outlook.com [40.93.198.86])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ckwnn51m2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 10:24:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNvSkp6zqxaO+b0p5cAfO35tM5o/CuJY1VkyEPaOVbf6CGvFvYyrb+7GF2xLUbaqVatvFlIKcsacWYA7YsEa5EuUgCteo4yLOBAOr06btY9apzigERNn4P18rS8PSNM2ul3yP2DS1v9Z28FILrlVrugzusay3Cfs0CLQ9dgv3oFCi0ki7/8JdBEPAqmyc4+e8uAdZAnmXWMwLbM0j4wXG5vBFfwj5PyRuKEw6WNgALqhOWHYFWo07V+VHJkCylz46D3adCuoK3wZHztGTxktW3uXhnKMHDYskNrFFYnwCQplvg3GwaDcuoPkXgI0RzcYx8Ujvj9XV+/S5Qk4FZmqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtl1+0mqGT9CWMc6648JJtGdmrua0bxHnnb0kwEGnM4=;
 b=nlaRapKiyI9GyzSIlXEMHqlilJNjLt8dg6ZSBVH3N5bRIwx6W1ahBDpqkhr8zFFJJB+2STjFvb5RagKMMei980BmdH3MHe5RCZvd2EYku2TMPd/F9WLnUzH+7f0768JeY3qat0IMRe07I3NDpAw1VxEOhxLwKycR3XkpyRxR3N6LpWGlQAdegNlMjuUXNosSrJ5vYwDd0P0adYes2/JGXIUM7i4PBEWvMj+vAOiQ2bK6c7sthM/Nm1mtBBWUroF2W3A4fyxRwFoUDaK+j8RSt0cTLKzdcgVDn9VPe1m0Ym7Wf1a0mA+SVLWYDQYCrOFIkv+uyA+JhHDRmPWsrsdgyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtl1+0mqGT9CWMc6648JJtGdmrua0bxHnnb0kwEGnM4=;
 b=DuPftnx14grTnN2yG9FAB7RwMYd+pUTOPsiEdpIE0QT4x9gRwPGn1tBDNkfwrFOBXO2iHBgHTTv2L8NFWVlUOZNUqCrtmJdBafaay291TtFqfchygx6N8ZgfeiMhU3vuf50cuy+tLwu5WY6r0xVT6gUHtZeaWSvy1ey+saf4gcc=
Received: from SA0PR11CA0143.namprd11.prod.outlook.com (2603:10b6:806:131::28)
 by SJ2PR19MB7557.namprd19.prod.outlook.com (2603:10b6:a03:4cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 16:24:06 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:131:cafe::a3) by SA0PR11CA0143.outlook.office365.com
 (2603:10b6:806:131::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 16:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 4 Mar 2026 16:24:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 22C32406554;
	Wed,  4 Mar 2026 16:24:03 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 07C2E82024B;
	Wed,  4 Mar 2026 16:24:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, brendan.higgins@linux.dev, davidgow@google.com,
        raemoar63@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/4] ASoC: cs35l56: KUnit tests for reading speaker ID from host GPIOs
Date: Wed,  4 Mar 2026 16:24:01 +0000
Message-ID: <20260304162402.1714759-4-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|SJ2PR19MB7557:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 05a9b0c1-c003-4f32-4d36-08de7a0a7451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	a0mXCOS0e8P9XDBnHdR3JVUsOSlxlliL9w7e7i2DJ/Qwy4YGdN0MfPKrVYxQfKZMhScwgRQqA5edHWYcOH+mw9aMsC8CBGJ93Sithq1XT+819LS36F7/8H8tlBAJmRkHcJpsg+CNHO/N+dpS9iMyRu3iblryp0oO5UK8gGIKlLmR5XYNj72eLUPASK+2Tf/ujE7VnwMuLr62qDtpZ1G2wUw7sTdjxt8K5QC8Wrl3RCmJkLfUx3nhcFpcTh3MwA6w5YXB8mFSbt+eqsQQNM3DS4XHWKV1dUSZbwh84brT9E4i4OYkzoDSpSgAZkyqdIXTmp1IX1I3zvTi49ftpdRPvqKJHPhE0W38kqSXKp05ScOTbBcfPqtQglhMOY2fbOx+zDHPcdZHVP7n/DmYQdrJ1aDoXEIT43OQ04+l6Fe8k1Ti+bSbcTfrqrULGEbJz6PlYiq6ZSs1jX5HlRORDWxlXmfoDGM1qec0DGQrxutLik9k2Jc4fNFWAtbnG5gla/RA4ABGKdfGyXnhmGIq1X2HOxbXRl74h76J49Lhn076CmbY22JLtPCmuE3talb1uIaql5Dd/KrMpIR3+xZdQbh1yOkak82A9iiIXkPuXqjGh2wuo5ySpsVntZ0Vr5Nur55T69nY1xM81W2aWBHN7gzG6a9Kz+z81BWWFNAjTdyWhPWEtW+0ebjeQ5jJIs8W7Yx+IsEvzbobIwAKafYG7x2zz6Khtv1+plbqaK921TgSRbp1RHhsk7KQXHZ2wfDm2BwcjGLoygsIArYnHZfiYjtu2g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BcahqG0EhjOOXHUmY7TaDX47XmopdC1IY4d+PKDMx3UOFzhw+C3JZ5Kziv0FXuwBJ2q3HquV8zeE1q+laiilwPx4yBcZp00Wc3+rL+XvD+CHSMQKI9bacplMoIg9/2qZyyp+W6ITQJJYYCnjDRBiB7WWU8m77Yn9GpDfLqCFxnLtEbAiHhl3WvxzThFMIpin/P6tBvjoaNbtaopfe/QjzbZxSr9I3ZLRnWBXuMFvI4LZAbod30OSB/QAegjZm+H6V7Nc7/DKqA0vmEdOYoYBSPT7SxOA6z3NBLFidIOdVIZjwLu6i7NZJIOw20fvq/Ru94gN99u1jzLzzlpJlyzsMlbo4KH8QlkC1At/VNZWZuQBmW0iFd9J0PavccchNoj7OrN/89hqnCI4vAdM+3OmQp6FG2W1Uuo/mec+XAjZMP/LP6S/6Tm07qKhqfz9U1UR
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:24:05.0064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a9b0c1-c003-4f32-4d36-08de7a0a7451
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7557
X-Proofpoint-GUID: 1Gzm16i4K7sIqcSoK2m9m8KrYbyHWuSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEzMyBTYWx0ZWRfXzJpyH1Bw+/gW
 LcmYqlCWho1WlAE84VquXYMdnVijBRTPbIzmxDAmo+GR0g9y3jWhxO0h9AXG2eUrg62NBmc86lb
 tN4uRh87LfgElClMhHGQK5lAuCrVdHtyEGjL1wOD/L8xZ/UEEmq4AdMk6Pbas7smDsT9N8ndv8/
 26TZ2ofWj0Bc1EAQoNtRHPzoc7Pbv08ZhTTAye7peWJuZWgfelyunmmGFVsspJzLXpvhwUbMa1v
 +Ser0ypsCxngdU1yTjKFw4UDJxP9nJ2siGmEoz0ydGAWMn0za94vviFxSJsZ6Jt+DuApjPaK1p8
 6I+hXkmQtRYVCH0gsTXCyC7MR9WDT8DQMMx13hoahNDPTCX8tYGTf+5GDX0n2wd5SRWTOfpZRc+
 zPLCJU5CXTLeByifPRUs+ojxOEwUB0kBhggy0SJ+1N/XEU9hMv7KvtWtaqCHN7PWsonAjo7YJHv
 ln3030IdJbze9agXVJQ==
X-Authority-Analysis: v=2.4 cv=ZaIQ98VA c=1 sm=1 tr=0 ts=69a85ca9 cx=c_pps
 a=lEAsXE5stpqivpVhnk0CUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=nv8Dcbm2-SvBrymBcg0A:9
X-Proofpoint-ORIG-GUID: 1Gzm16i4K7sIqcSoK2m9m8KrYbyHWuSe
X-Proofpoint-Spam-Reason: safe

Add test cases for the spk-id-gpios property used to read an integer
speaker ID value from a set of GPIO inputs.

There is a single parameterized test function,
cs35l56_shared_test_get_speaker_id_from_host_gpio() that does
the following:

- Create a mock GPIO driver to simulate real GPIO inputs.

- Create an array of struct software_node_ref_args to provide the
  content of the spk-id-gpios property. Each entry is a reference to
  a GPIO on the mock GPIO driver. The GPIO indexes are taken from test
  case parameterization.

- Create a software node containing the spk-id-gpios property and set
  this as the node of the pseudo codec driver device.

- Call cs35l56_get_speaker_id() and assert that the returned value
  matches the expected value defined in the test case parameterization.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared-test.c | 197 +++++++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared-test.c b/sound/soc/codecs/cs35l56-shared-test.c
index d510893dcd44..cfe7938065f9 100644
--- a/sound/soc/codecs/cs35l56-shared-test.c
+++ b/sound/soc/codecs/cs35l56-shared-test.c
@@ -11,15 +11,23 @@
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/device/faux.h>
+#include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/random.h>
 #include <linux/regmap.h>
 #include <linux/seq_buf.h>
 #include <sound/cs35l56.h>
 
+struct cs35l56_shared_test_mock_gpio {
+	unsigned int pin_state;
+	struct gpio_chip chip;
+};
+
 struct cs35l56_shared_test_priv {
 	struct kunit *test;
 	struct faux_device *amp_dev;
+	struct faux_device *gpio_dev;
+	struct cs35l56_shared_test_mock_gpio *gpio_priv;
 	struct regmap *registers;
 	struct cs35l56_base *cs35l56_base;
 	u8 applied_pad_pull_state[CS35L56_MAX_GPIO];
@@ -41,6 +49,90 @@ KUNIT_DEFINE_ACTION_WRAPPER(device_remove_software_node_wrapper,
 			    device_remove_software_node,
 			    struct device *)
 
+static int cs35l56_shared_test_mock_gpio_get_direction(struct gpio_chip *chip,
+						       unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int cs35l56_shared_test_mock_gpio_direction_in(struct gpio_chip *chip,
+						      unsigned int offset)
+{
+	return 0;
+}
+
+static int cs35l56_shared_test_mock_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct cs35l56_shared_test_mock_gpio *gpio_priv = gpiochip_get_data(chip);
+
+	return !!(gpio_priv->pin_state & BIT(offset));
+}
+
+static const struct gpio_chip cs35l56_shared_test_mock_gpio_chip = {
+	.label			= "cs35l56_shared_test_mock_gpio",
+	.owner			= THIS_MODULE,
+	.get_direction		= cs35l56_shared_test_mock_gpio_get_direction,
+	.direction_input	= cs35l56_shared_test_mock_gpio_direction_in,
+	.get			= cs35l56_shared_test_mock_gpio_get,
+	.base			= -1,
+	.ngpio			= 32,
+};
+
+/* software_node referencing the gpio driver */
+static const struct software_node cs35l56_shared_test_mock_gpio_swnode = {
+	.name = "cs35l56_shared_test_mock_gpio",
+};
+
+static int cs35l56_shared_test_mock_gpio_probe(struct faux_device *fdev)
+{
+	struct cs35l56_shared_test_mock_gpio *gpio_priv;
+	struct device *dev = &fdev->dev;
+	int ret;
+
+	gpio_priv = devm_kzalloc(dev, sizeof(*gpio_priv), GFP_KERNEL);
+	if (!gpio_priv)
+		return -ENOMEM;
+
+	ret = device_add_software_node(dev, &cs35l56_shared_test_mock_gpio_swnode);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, device_remove_software_node_wrapper, dev);
+	if (ret)
+		return ret;
+
+	/* GPIO core modifies our struct gpio_chip so use a copy */
+	gpio_priv->chip = cs35l56_shared_test_mock_gpio_chip;
+	gpio_priv->chip.parent = dev;
+	ret = devm_gpiochip_add_data(dev, &gpio_priv->chip, gpio_priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add gpiochip\n");
+
+	dev_set_drvdata(dev, gpio_priv);
+
+	return 0;
+}
+
+static struct faux_device_ops cs35l56_shared_test_mock_gpio_drv = {
+	.probe		= cs35l56_shared_test_mock_gpio_probe,
+};
+
+static void _cs35l56_shared_test_create_dummy_gpio(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+
+	priv->gpio_dev = faux_device_create("cs35l56_shared_test_mock_gpio", NULL,
+					    &cs35l56_shared_test_mock_gpio_drv);
+	KUNIT_ASSERT_NOT_NULL(test, priv->gpio_dev);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  faux_device_destroy_wrapper,
+						  priv->gpio_dev));
+
+	priv->gpio_priv = dev_get_drvdata(&priv->gpio_dev->dev);
+	KUNIT_ASSERT_NOT_NULL(test, priv->gpio_priv);
+}
+
 static const struct regmap_config cs35l56_shared_test_mock_registers_regmap = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -449,6 +541,74 @@ static void cs35l56_shared_test_get_speaker_id_property(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, cs35l56_get_speaker_id(priv->cs35l56_base), 2);
 }
 
+/*
+ * Create software nodes equivalent to ACPI structure
+ *
+ * Device(GSPK) {
+ *	Name(_DSD, ...) {
+ *	Package() {
+ *		cs-gpios {
+ *			GPIO, n, 0,
+ *			...
+ *		}
+ *	}
+ */
+static void _cs35l56_shared_test_create_spkid_swnode(struct kunit *test,
+						     struct device *dev,
+						     const struct software_node_ref_args *args,
+						     int num_args)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	const struct property_entry props_template[] = {
+		PROPERTY_ENTRY_REF_ARRAY_LEN("spk-id-gpios", args, num_args),
+		{ }
+	};
+	struct property_entry *props;
+	struct software_node *node;
+
+	props = kunit_kzalloc(test, sizeof(props_template), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, props);
+	memcpy(props, props_template, sizeof(props_template));
+
+	node = kunit_kzalloc(test, sizeof(*node), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, node);
+	*node = SOFTWARE_NODE("GSPK", props, NULL);
+
+	KUNIT_ASSERT_EQ(test, device_add_software_node(dev, node), 0);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  device_remove_software_node_wrapper,
+						  priv->cs35l56_base->dev));
+}
+
+static void cs35l56_shared_test_get_speaker_id_from_host_gpio(struct kunit *test)
+{
+	const struct cs35l56_shared_test_param *param = test->param_value;
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct cs35l56_base *cs35l56_base = priv->cs35l56_base;
+	struct software_node_ref_args *ref;
+	int i;
+
+	if (!IS_REACHABLE(CONFIG_GPIOLIB)) {
+		kunit_skip(test, "Requires CONFIG_GPIOLIB");
+		return;
+	}
+
+	_cs35l56_shared_test_create_dummy_gpio(test);
+
+	ref = kunit_kcalloc(test, ARRAY_SIZE(param->spkid_gpios), sizeof(*ref), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ref);
+
+	for (i = 0; param->spkid_gpios[i] >= 0; i++) {
+		ref[i] = SOFTWARE_NODE_REFERENCE(&cs35l56_shared_test_mock_gpio_swnode,
+						 param->spkid_gpios[i], 0);
+	}
+	_cs35l56_shared_test_create_spkid_swnode(test, cs35l56_base->dev, ref, i);
+
+	priv->gpio_priv->pin_state = param->gpio_status;
+	KUNIT_EXPECT_EQ(test, cs35l56_get_speaker_id(priv->cs35l56_base), param->spkid);
+}
+
 static int cs35l56_shared_test_case_regmap_init(struct kunit *test,
 						const struct regmap_config *regmap_config)
 {
@@ -641,6 +801,40 @@ KUNIT_ARRAY_PARAM(cs35l56_shared_test_onchip_spkid_pull,
 		  cs35l56_shared_test_onchip_spkid_pull_cases,
 		  cs35l56_shared_test_gpio_param_desc);
 
+/* Note: spk-id-gpios property bit order is LSbit...MSbit */
+static const struct cs35l56_shared_test_param cs35l56_shared_test_host_gpio_spkid_cases[] = {
+	{ .spkid_gpios = { 0, -1 },	  .gpio_status = 0,			.spkid = 0 },
+	{ .spkid_gpios = { 0, -1 },	  .gpio_status = ~BIT(0),		.spkid = 0 },
+	{ .spkid_gpios = { 0, -1 },	  .gpio_status = BIT(0),		.spkid = 1 },
+
+	{ .spkid_gpios = { 6, -1 },	  .gpio_status = 0,			.spkid = 0 },
+	{ .spkid_gpios = { 6, -1 },	  .gpio_status = ~BIT(6),		.spkid = 0 },
+	{ .spkid_gpios = { 6, -1 },	  .gpio_status = BIT(6),		.spkid = 1 },
+
+	{ .spkid_gpios = { 6, 0, -1 },	  .gpio_status = 0,			.spkid = 0 },
+	{ .spkid_gpios = { 6, 0, -1 },	  .gpio_status = ~(BIT(0) | BIT(6)),	.spkid = 0 },
+	{ .spkid_gpios = { 6, 0, -1 },	  .gpio_status = BIT(6),		.spkid = 1 },
+	{ .spkid_gpios = { 6, 0, -1 },	  .gpio_status = BIT(0),		.spkid = 2 },
+	{ .spkid_gpios = { 6, 0, -1 },	  .gpio_status = BIT(6) | BIT(0),	.spkid = 3 },
+
+	{ .spkid_gpios = { 0, 6, -1 },	  .gpio_status = 0,			.spkid = 0 },
+	{ .spkid_gpios = { 0, 6, -1 },	  .gpio_status = ~(BIT(6) | BIT(0)),	.spkid = 0 },
+	{ .spkid_gpios = { 0, 6, -1 },	  .gpio_status = BIT(0),		.spkid = 1 },
+	{ .spkid_gpios = { 0, 6, -1 },	  .gpio_status = BIT(6),		.spkid = 2 },
+	{ .spkid_gpios = { 0, 6, -1 },	  .gpio_status = BIT(6) | BIT(0),	.spkid = 3 },
+
+	{ .spkid_gpios = { 0, 6, 2, -1 }, .gpio_status = 0,			   .spkid = 0 },
+	{ .spkid_gpios = { 0, 6, 2, -1 }, .gpio_status = BIT(0),		   .spkid = 1 },
+	{ .spkid_gpios = { 0, 6, 2, -1 }, .gpio_status = BIT(6),		   .spkid = 2 },
+	{ .spkid_gpios = { 0, 6, 2, -1 }, .gpio_status = BIT(6) | BIT(0),	   .spkid = 3 },
+	{ .spkid_gpios = { 0, 6, 2, -1 }, .gpio_status = BIT(2),		   .spkid = 4 },
+	{ .spkid_gpios = { 0, 6, 2, -1 }, .gpio_status = BIT(2) | BIT(0),	   .spkid = 5 },
+	{ .spkid_gpios = { 0, 6, 2, -1 }, .gpio_status = BIT(2) | BIT(6),	   .spkid = 6 },
+	{ .spkid_gpios = { 0, 6, 2, -1 }, .gpio_status = BIT(2) | BIT(6) | BIT(0), .spkid = 7 },
+};
+KUNIT_ARRAY_PARAM(cs35l56_shared_test_host_gpio_spkid, cs35l56_shared_test_host_gpio_spkid_cases,
+		  cs35l56_shared_test_gpio_param_desc);
+
 static struct kunit_case cs35l56_shared_test_cases[] = {
 	/* Tests for speaker id */
 	KUNIT_CASE_PARAM(cs35l56_shared_test_mock_gpio_status_selftest,
@@ -658,6 +852,9 @@ static struct kunit_case cs35l56_shared_test_cases[] = {
 
 	KUNIT_CASE(cs35l56_shared_test_get_speaker_id_vendor),
 	KUNIT_CASE(cs35l56_shared_test_get_speaker_id_property),
+	KUNIT_CASE_PARAM_ATTR(cs35l56_shared_test_get_speaker_id_from_host_gpio,
+			      cs35l56_shared_test_host_gpio_spkid_gen_params,
+			      { KUNIT_SPEED_SLOW }),
 
 	{ }
 };
-- 
2.47.3


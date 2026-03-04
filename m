Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123F3644BD;
	Wed,  4 Mar 2026 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641463; cv=fail; b=CechUrhG+sARu3jA0PTLHzE9gzWBr/HZldiH/CtfSzqzWvN3OpzaAuwBOMwNS3Hprfiu/SNywPwK7G6j/yFUMin7wY6NHWrNGbVUanaZeS+rb7LCm7cUNmJJ8zvNK4sPvVNbkB6GpvPMT697d212/RDVyif4cm4oo5AEjeTOpIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641463; c=relaxed/simple;
	bh=t+gQEFwCOHDzVaHK+/exe21dLfbV9ApvzKeYNAdrMCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MacE9nBgdXAnxl/qG/Ko5uEbHnhbqSMzqQ3O/06EElPGc0BDuuMLJSObX4k2KPfMuYIBVdbp5gjL3hm2BnrDEyffpXgYc5/V30ipp8ZVnfbi6CLw40J3Pya2U7dBJNO31ql5zPFyFu0loKr8ciEq7P9GnbBJniaiHZzR6Pymwc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SEtc7Ohk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UXbg4J9A; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SEtc7Ohk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UXbg4J9A"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245HEKi2857071;
	Wed, 4 Mar 2026 10:24:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qotDDPxrdx6prtoiJ7qDijcVj6FKV1rOsh312783bPc=; b=
	SEtc7Ohk2U1u7lTOEABxnLwl5LX/QE+KKl25B61H0W1saOb8RtSEP+mz0ZICV3JF
	r6uIPPUpFFaINrexTQlXicok+jKzQ2NOGJ+m5fbc1dG7dJO0E8rBbiEF2lCWxqje
	UlYhzbS5JE3yRR5UFZuF70am7g8nygnIpJOvq1kuNVRJREzUrPTilxL6aKxFeORN
	et+9b089StkudOI7aIfK1hCyFwKIwl5BvLCXGFPN9/7b94FjUG61HJK9f0PSJgAC
	lRuMTx3NL5zhqw8ErmOEwE4gP+2H9ldeXyJkM2Y2ybsunVXELhFck3RXMkawYbyk
	QRxaR4W5mqRE1aI3tQ2qEw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021141.outbound.protection.outlook.com [52.101.57.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ckwnn51ky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 10:24:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAKv3Hs3Vif5wgt3wDx+/0ypFSpW74Z7NwbqUJocQ33DxbsP1JqstBDaAN20Ok2OCCi35pySMzsVe4Jbyd0gN9LkvNQqhE7ICRheScQ1AojaPHpAsjdvB1qjotVOyKoVVVni2XSML/oW+udf/0G59LHKDWQaLIhNFYGCTQ3RxGN9wQKXZ+UU2ImGHFUISTZb35o51XS748QzgJ3549/S4PUphWsIjC03lkc8p2NSWXWfqCuz5AJc+zWq2pdMo/0Ty8l0yZQ5IXDF6rlVJecounTQRYbktE6QDCieFhTzm19hpqbFzdostAd85zG5y6uHp95M43TwT36Ym4d9eiauBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qotDDPxrdx6prtoiJ7qDijcVj6FKV1rOsh312783bPc=;
 b=KaGx6lgM58X9RIXFNQT+xNf1joKSOzrlxsIO2D3+W8j0Fpc6HRimzsJn9tEK/+h4fG0i86pvaQMXdiqTzLxZkCCJCuGET+xE39Ha5nGvKeQrOT/n3GXcFeW4ucDHHp1hImdBcZafMqE2VCyYLABSEuXHma23zh5zhjKDkAsXHBrm1kozY9RaAgGKXYG8/iFHB6rSJR9GZ4WlDeQGORSLK2HL7MeZHzqIhL2eBOJLd0fhQSDHX1wNyrbEIlOXfwhdZ9xE3HHBwZuaeCGvkNgNgS2++/lOjf4sn+lWjjV2vVgWt4u9tI65TaQFZhGGUWHI531w3eIWisIDs5HHxj6Ljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qotDDPxrdx6prtoiJ7qDijcVj6FKV1rOsh312783bPc=;
 b=UXbg4J9ABVRtLftej10mSRSHPSn/uEfSYS2W3OWLQHiloE0VLqm2hC9TjnhxqfUC6RMpZIuudFCP7KpCqPyJNoURxui5RXNZ/UbqHtKZ7RP8rW3DANl49GF1K5z9g3AhxcfFxHE9253VFWfqiNsUBirqtlK/n9PF3ESjBDvTksQ=
Received: from CH2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:610:50::25)
 by BY5PR19MB3956.namprd19.prod.outlook.com (2603:10b6:a03:22c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 16:24:05 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::c2) by CH2PR16CA0015.outlook.office365.com
 (2603:10b6:610:50::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 16:23:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 4 Mar 2026 16:24:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2921D406559;
	Wed,  4 Mar 2026 16:24:03 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0C84D822542;
	Wed,  4 Mar 2026 16:24:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, brendan.higgins@linux.dev, davidgow@google.com,
        raemoar63@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/4] kunit: config: all_tests: Select CONFIG_GPIOLIB
Date: Wed,  4 Mar 2026 16:24:02 +0000
Message-ID: <20260304162402.1714759-5-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|BY5PR19MB3956:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a1d2826e-c69b-4e1a-ae59-08de7a0a7429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700016|54012099003;
X-Microsoft-Antispam-Message-Info:
	Rd9rtBs72Xb0AwAIXJB/51vyXpqw8voabY98MghluqnHa0lEmkzBpxxMf2PPBeo+b8HNGGJ4B6niYTKA+BKlDXCrqETcpNKnmklLkgVFNkxS1xCFWs1f2AJe//4sqnqC0/E8IA/4OrSyfCMEILvkEHKbfTZOVkqbvmADE4j46NibR6BDLcaRyd9PnqyD1rnV+qXlT6a0vC3BgmQz1+e4kRIuNYtOKV25RXLNmMcYtywGLKRqAlo1jsTkXM/VLTTtzvG2gtBdkDFYRJTrKdUm/ubOd+Y8txUSzRWllogK3/aGOr6HzoIHwCXYzLXuEcQ8OEd4X3KfGuJnrj99pBlJNx38UzQbLUdhl800IWDAJ2BEtuStvmV+CtUUzubJZmrIaZTb9/83F8F0iejyNvtu6wD43dymi1NK7Ie0LV2P1+YMA7jhEPESJb3wnSTyp/Xk6jYL2B4LxgDOdsxQNgxzR4SHbXu1YSjJoAoeWdPoiuSlCrFilf5Y0vApmvDH8ACNvp+GcH0UpAt+mOZvQq10rZwZGYIZsTj+zJCAKgH6M+wRWuPJysQhNBKrb66gaYoovKl2V0iy4d6+jq7zQsnkTungpTK8JxlsClW6WpwwvqrlAMFho/ZaeHs8xb7FW+QvZB9t/+275kfrbhd9EVsW8i55xV48mmUs4OS3F+1dd+c1Xs/gZvmUL3pv2rsYeQPXkSzOT5/4A2H3AmMuWvw4hPrYlYvt03fT8M29J5erFEU7uqDCzJNbFKfrI3D0xyo+TjJsBK76/748z7z/oVPUqA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700016)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	27M948WWrCJnkBm2EhCfwitQgz1rRjW1EJPcATKDVKloWPhwvlNGLUbKHdE4//1n0BMtYAzIkBoN7uBKP4LFpHEnfVM4kwF0XaduEAEe0xtaWQ0I4YR0rr+f8C9DTTKnRaAnQwPPGgwX7nzBMPC7Qg2i5aL13UJZGJGtNoRvrMt8C8fk/Ek0zbnbnThvGRh3eTV1WDX0adOCkAdUiUxWboku6inFzWqkE4apdidi5jHXB+LM1yJTIpq9y/faG9tv2NETPVIS++U2lS7nf/hqLnaM5se4PWlDUpIQRdoykKVmt+97pGXbzutkcE4169Ocza1uEFfZda+S8zT/DcHFPmByaWG7+EB63m0/WT8sY1P92ccLvjpfbfZYmIedaDQuDb7f6gW3huoA5D5buXB0jK+4hTMBtY1O+eEJ4Cy0xBN0sMSmwj4fU0lBr5dspbaY
X-Exchange-RoutingPolicyChecked:
	jlonwnH586p/5uKj8M2+U40GzOIUNI7z9autjT19Shl/fzZ7+rPk4n0s8xShMXpkja3qGxFR8Va0t70ibMfUS1mQu37phXTWpOE6pFMG8wsuvy7qpX14TJWwBkYlrGeamVKPtcoVbqbi6qEHX2QXCr4C+575yXLdNwtB3HsAQebZuk7LMWCtIUkCSr+NHytv2NXTyNT8EV6pe52++/eaV9Fu3aPxilx52D8cnnnsh181l3Qsr7+JCcsR+K6bKNsmFmEGUPKmSNX5H9ve+BwsFIrNQGDB+jTRxyA7QEC2hydkkQQK3xzbV9drBup+e+Ok0jOHr3vFT5rdXfBF1zljmw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:24:04.8018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d2826e-c69b-4e1a-ae59-08de7a0a7429
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3956
X-Proofpoint-GUID: yjv-DFHTxreGSHzgQ9Rj75hGg9fGH9EN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEzMyBTYWx0ZWRfXxXW4Dty3yJfY
 K/jYhggEAVq0BGrPWpZqSIPVTNX2/ulIZecaGH0HLmnq6L7MJXe4AWAqcwBwTV8wf0/TQfHHCQE
 Plm3azbXHg0JvVSbBUjm4zjI30ldIDD5KV7SqC1jynZ23wdycYzvKmfYvWcCKtK3Pe+yej6qUdd
 uMDaoJIgBb+06I6rv0rFB8EHjwIHKnJodGp2EXIv6BekKftORdNik2Ell2K6O0Pcz7ldYm7Om57
 pBQWP23qylLChGfjXTbIHlz3ow59Px7M9axp5h85PLmxO6EmrJjQYI86pP8ToScV2D459yZaq+b
 vAZjYN/7MQwX8EU4qrrzvqB78GtFGKXrmQCzDN7kB3Ym4MCq1CInC/Ptzw2oz01w+AkY25PWKwQ
 J4hGm42uv5/7xWEGcrO4vhkEWBST1Bc1u8cpS7NCvOvT7wQLebkgFNxHp3uhpvmYIikQy7jKrQ4
 rYX/EeC3mTyV+y3QZ7w==
X-Authority-Analysis: v=2.4 cv=ZaIQ98VA c=1 sm=1 tr=0 ts=69a85ca7 cx=c_pps
 a=IXZk8buBm3K+4cvqFqH88A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_pdQjNNs5VuZOEkv458A:9
X-Proofpoint-ORIG-GUID: yjv-DFHTxreGSHzgQ9Rj75hGg9fGH9EN
X-Proofpoint-Spam-Reason: safe

Add CONFIG_GPIOLIB to the all_tests config so that it can run test
cases that create dummy GPIO drivers.

Some tests for the Cirrus Logic cs35l56 ASoC codec driver and
cirrus_scodec HDA driver create a dummy GPIO driver so they can
test driver functions that read from the GPIOs. These tests will be
skipped if CONFIG_GPIOLIB is not set. Ideally we would like them to
be run when selecting --alltests.

CONFIG_GPIOLIB does not have any dependencies and only enables
generic library code.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 tools/testing/kunit/configs/all_tests.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
index 422e186cf3cf..e21239dc6fae 100644
--- a/tools/testing/kunit/configs/all_tests.config
+++ b/tools/testing/kunit/configs/all_tests.config
@@ -40,6 +40,8 @@ CONFIG_DAMON=y
 CONFIG_DAMON_VADDR=y
 CONFIG_DAMON_PADDR=y
 
+CONFIG_GPIOLIB=y
+
 CONFIG_REGMAP_BUILD=y
 
 CONFIG_AUDIT=y
-- 
2.47.3


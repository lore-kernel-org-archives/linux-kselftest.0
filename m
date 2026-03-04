Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3D366828;
	Wed,  4 Mar 2026 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641469; cv=fail; b=WCEzqEWjOnGXq9TO/0oYE5dLn6CL0376bI59uA6iui3WClEI+AKOHn8MSmQr1IcZdgWZHJ5Pq5XmbHVJQk1dmTCoS34il868EOwvRg1BPvMIGLSWXZvDOSwT0q+qDJzpywqbjw1/1kO5e4gK8Jai4ECbj3ZJzOxUVui0kOQ4+LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641469; c=relaxed/simple;
	bh=BGGzHjDC+RtHMMdtUa0BtPWtWLkDx2ud1sEwib4pDLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WSAFEh0lZTHOrDMK1OP104un9/aVZypjk5hJSZS3YMnULycw3vx0+fvc4NQrXf4chlnrFw07hdXzdVtSPwPW/Q65RW5qu8/e1irFPFud0c8sVpV+pdvpmiQgX3XLNxh7kK4ZqDt/SyEPPhnFiUXSTWRBY60RLAnNY7xJf+HQ1cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DzxVUly3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=St+pIPM8; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DzxVUly3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="St+pIPM8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624G8gc9242648;
	Wed, 4 Mar 2026 10:24:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ZzqYU0b6CzR84M4Z
	k9aymbaytEXKSGBHjNagKg27k20=; b=DzxVUly3M/FEHjM/rY4PLMOnA0OB6lm0
	Jas5HBxeEjgdyB1EOIbG4VHiUMmB3agR2eUZgN8xSl9DtmjkYg2RyR3Matf7udzl
	o0+atavsoZrjdXM/R9SeECo1EWrgWlqJhl5cPR8p7ZzNAtHeL29JI+SspuJdcT24
	KtVvKlJ+1AUr42Hzl6OmuocjAny+acVXS8SGeXzMbHtjQu4I65jNcSS5LkRb9UIk
	QghO1vfRFfHyHPe6VJF0Co9XOn2MFuNnbUG90m7nGoaFgH4TBSVJn5MvciVxVBkC
	QQDbkanh/1iKrgk515KlESXenXVIcwe618pORUbgj8bUS+/tOdAb5w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022079.outbound.protection.outlook.com [40.107.200.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn050ac-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 10:24:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GryZiC5BHDl31fPRRzibTtFJEPjRA2+Lz7DItjVmXPwowkE7QA5+BytB4vGe30RBFYpJyClfsZfvhyE8z55kMbJnS9UQxAljzzYjTc15bmVx0zj4YMvDha+XvGilp/ygQrIqji5tcIqyUEuHDktK3DC9JxdT8LGzN3J3JgzRJLiGIuIH/o8LLGZrMDztzj+cV6GNIKE5jNEr7jHErZjICdqr5EBPP7nevNM2CBHoeOirVt+fw13GghSOTQkRgtAXxPZ98UALTjt94WiwpHNKX+sqlI2AwyC6WAIUaZGsUZDtGQao/CcyqfLqq/eW3CzyulIRqkPvdBHtl5Ft2TIZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzqYU0b6CzR84M4Zk9aymbaytEXKSGBHjNagKg27k20=;
 b=UQUPYsNz3vcDmegGbxpAKBysTG07Hn39LzrmWJwc7JXMfgf8pr66wn5XsvBl+bw9ebNp78zzElRU+DqNc4PLVD2X3ZCulXf/ir6RgRhjj8s5uBk4dosQfHh/AmrKwpbTdi3Vtj7JN0m7wkCRC8LJghABPDcRjYxH5yT6O7FsKvPh5P5xQ+oGuu9VpvaKRPnBeolMn6Zh5ZSxsrl4B37D6slLIYmqfEnKHMltaYGbXMhmg72r+m3kr3vDiLF4A13Ow3MddNdXz/14PxmhGtjin7fhnRAU6AVKNnCSPPsyJgyeMZ4Yaop+BBWaUH/m6j4B969QCQ2q6j386Pjd6RqsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzqYU0b6CzR84M4Zk9aymbaytEXKSGBHjNagKg27k20=;
 b=St+pIPM824DkXEtNLLSpV54onEjj1gZh5SIudtZ6X8PK+QddrFfyppQiJK5VNDMIlCWrJZVPpjIgyYbRk+WjaOpKQmSJUexQOsG4Vhdq6gEzmf7T4JBR+ctVWrjh23G0vlqgoqEBoC0wvUdqxhWT2p9fZxsMLOORMd4wYU9elyg=
Received: from CH2PR17CA0015.namprd17.prod.outlook.com (2603:10b6:610:53::25)
 by MN2PR19MB3872.namprd19.prod.outlook.com (2603:10b6:208:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 16:24:04 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::ff) by CH2PR17CA0015.outlook.office365.com
 (2603:10b6:610:53::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 16:23:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 4 Mar 2026 16:24:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F3F7C40654E;
	Wed,  4 Mar 2026 16:24:02 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DA92382024B;
	Wed,  4 Mar 2026 16:24:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, brendan.higgins@linux.dev, davidgow@google.com,
        raemoar63@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/4] ASoC: cs35l56: More KUnit tests for speaker ID
Date: Wed,  4 Mar 2026 16:23:58 +0000
Message-ID: <20260304162402.1714759-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|MN2PR19MB3872:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9a35c2e5-194b-48d8-e8f4-08de7a0a73a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700016|54012099003;
X-Microsoft-Antispam-Message-Info:
	wcMuC6FCeZLnkQluRbJT9rXBOuevllQa3KAHfd9t+EoYbf4CgfuYv0kSj61fRcZ7iYRhO1ViMsf8Xeod7V7T8izxeS0BZcAQb071wB5LXTh/ScXSi7Y6C12MfpLf56at+8A2cHRpeFU5kOi4A2D3s35VIY9+enHVB/DoQPJTSaernEsGTrR437mdm0fAfVJ4HJoaIupBKrdPrPbx0naVnn4zCIJ4U0B7gWCzotWRTbLTOf5tZUgDEarblXKj263KN55Cjm/Lw7IzLAUkNLpCFprX9lG1UKrNjnLOajsqsS3sOJJMx4jis8GzXwY2ZMmxcnyeltZhturUT6yJXzlT/elMoFAJgo4iG16KofHg2sxRcGyoj+JRORmNeZcvgfUT6FPl6zNKfgyfRk13avk6PzUXQbGK7u7bdgY32tzDR5YlSVs7r2LEQKt2J2kUX0VmAdbqDCfg/JFAtUnKVnCZOkLV0Ra0/6hE6yJjOuH2109DaWYnhzAZrzTUGlg6jaH843UNQVaRco8u6w+q0qktFEEkhSnxp7G5j4zyiCp0p28psFyz7Ey+AN2+MOZBN+zpwvOk1DvxnmKDYpbEqpJsTpfg7AweySW4IkncV079pspEGe1+7//ivPOmJEiqIrPiYYLXrIYSWJqCuhxwPCs4+pmDmgJbke9OLmyonTkRJ5aPUsLh7FvY1FNdLXeKjjbk7VyMg8FlgbE0SkT3Q6Em4LdqFWtaFQkdnXZxg+mP1hmvhLB3k/350SzhwYBj4ZaKlGRIuQCmf3g8ckNFIT0myg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700016)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aHywNHzl6nNwc5ND9t1blw1fHVm/VD0Y6nBvPfh0u+ZeJ1DUbpUq+WIg/VbsJ2G38vxN10EbU85YY7mm56ie1vkSF+shi4W8HN+iJ0fyx6UBVN2iz8FY1HweQx0J3JUN8jvkTKZBb621gooAbqVTjhh/96snDWmErYUvkuvS+OsOKzel6Y06fRTL7ntej90HEoiNYTBtiTKjm9Dc67HMVNQ7A7XnMBO2tfjDChrsC3sn4eCLZGYLBCskjoN7bZv3jC4FGIy7hTHPGeLNAiEUR8urMMCRQAXY1KtbsNpwKMQth7GjyC5FonCwr8IYgLhxlirsvInppmzuMMnDjngKmOaxrXVersFcDmEzyYrApKZWab0rY2SiDFTFkzLg5aG/aao9F5/7XY87vapcQHYjyrG81QP4P501kJ113f7x88VfbwIBVc9i3P9D9YSlIw45
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:24:03.9392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a35c2e5-194b-48d8-e8f4-08de7a0a73a5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3872
X-Proofpoint-GUID: 6GlEkP4XnOqSavbF3X9yVuNE07rnDwSO
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69a85ca8 cx=c_pps
 a=Dyvhhyvg6Mi4AOvI5LET7w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=upak4faaRWoB21xjb9oA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEzMyBTYWx0ZWRfX2HjYZFYsZgv3
 k7lDbgvlEaFO4V1x3DeeP1/Btw4eSynXJS8jLg3+cbwvnc/cKi46dIcWB2OmZ5hofCKCbEJMrKm
 CZ1fJKPW+kwcWFnZB3/QgfEDaVgkEnzvu0Cv/wyLxouJUpwWFDxUCXrHiujwk3GyNce+a8qrT7D
 o04ouy0s/chCJimaBOErtkkmTofL16UPRMbTpc8berKJFAo92r51jHd6joPTvR6AIK3lOun9gWe
 YSbqd9M3ItYlfHwZ/7UK/7nOkoSIRiYZzdd0VEqK/cBQwPSIUU/QIjiXrDuFJvq9gqOd3YQJgR/
 KMI+B1qrgCuzIIQu6u4yRQ2KCDioL+uui0x5zkEZVUpu0Cv6Y2mkp4+kveG+J2VZUoKgsfGbR0J
 S2k3lWzxT9aQ75iY5Pswu7i37gb35E/dLXuSlbJZ1PzABadelWVJAlEh5pNpl7rKr1DGsWKcYW3
 yMDMCNotUMY5jssguyw==
X-Proofpoint-ORIG-GUID: 6GlEkP4XnOqSavbF3X9yVuNE07rnDwSO
X-Proofpoint-Spam-Reason: safe

The first 3 patches in this series add some more KUnit testing for
fetching speaker ID and combining it with the system name to create
part of the qualifier for a firmware filename.

Patch #4 enables GPIOLIB in KUnit 'alltests' builds. This can be taken
separately from the first 3 patches.

The GPIO tests will skip if GPIOLIB is not enabled, but obviously it
would be ideal for 'kunit.py --alltests' runs to include these new
test cases.

Richard Fitzgerald (4):
  ASoC: cs35l56: KUnit tests for setting dsp.system_name
  ASoC: cs35l56: Some KUnit testing of cs35l56_get_speaker_id()
  ASoC: cs35l56: KUnit tests for reading speaker ID from host GPIOs
  kunit: config: all_tests: Select CONFIG_GPIOLIB

 sound/soc/codecs/cs-amp-lib.c                |   2 +
 sound/soc/codecs/cs35l56-shared-test.c       | 240 +++++++++++++++++++
 sound/soc/codecs/cs35l56-test.c              |  80 +++++++
 sound/soc/codecs/cs35l56.c                   |   3 +-
 sound/soc/codecs/cs35l56.h                   |   1 +
 tools/testing/kunit/configs/all_tests.config |   2 +
 6 files changed, 327 insertions(+), 1 deletion(-)

-- 
2.47.3


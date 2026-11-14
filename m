Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794664891;
	b=lYj+hQWS0UMSBscN3LfVo6RI0ZcqSUNd5ijAFnq+kx4q5RTZvsofkwlth0vQQeXofvg6
	 qoBL1nZjH/aK3YCstWQF+/qd6oiptii82OlAVLWDzGRwAN53z0dZKfPywcklhScGgRWPB
	 APCWEzG5J2xY0FGpYLNO9PZ+r7aXUEOKt/dVRi4eYUxax7cnbDVoGcEM5ErYqAh4Cy8nN
	 M3f1t8zAClM6dRbFK9q3w7E/95RUHeRQVlvuy8/I19Q/hTEXE70WVRjmwGT16ZhsZtG8k
	 N5VJzJQ5IqhL9VqlTY0xCv0Ylmy8ytuYQw53iZk0gvNmhGSvtVd4sl0IDroTCZxkjdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664891;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=nGRkhBOm0acFfiSEmh9UF3jmdHKOK9XTOIMbhkg3R1M=;
	b=Vru2l4/PkkzC+NellsMcEhQKdbQHOdSF6stmwNtXH+kPqn5IG7/qVrfqgdD3gvICVtJN
	 ikJPgGiLibfDioCafWB3Tnt/5zFUj8rmoteWM6PMW59p+4jEItav7G0F8VZRGGF7bL2YQ
	 UJQrlP19Ho3NIzfqhbCTXhNBIsu88wi/Fkh279+VgHslHn9I/H8VukTfdJLtzXLnKavk7
	 v182cpGmS0LsnBb4gEDrlveY2QD7a/kjSvK00lVOjkgEOokzIxP747UqPmEvKmWEN0Owe
	 lE1XQVyFIaIVpJObMeUyx46jitxvzro75A1F53q9BeXeHexSz7Ggpv5FEyi6S9OHQMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bnPdxBkk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.18
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011018.outbound.protection.outlook.com [40.107.208.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F230606A327;
	Sat, 14 Nov 2026 14:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F230606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bnPdxBkk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koyNJlcqgfgLtszatgoUN1FTE64l+QYik5ZigExlIw6mpQMUILXXy61JYexMs8sFFm/1AT1G+8p7YspObCz/ip7gTatllaQt3shN5eiiGSFUmjoSbso0aN95x8W1x9yuIY1w8SFJsnDGiBdV04KYRw9WwBk9V2CiN2jKLdUOApA6YB3hzJbx37//MVFhL2i6HYqRvJLDow7zSBZ41BLGdb6k3cptwlY07PGwEqRi8hkA1oKSjZI8bCgo1l1sLv+DgNN3XVizQOu0Mvb7OCiZhpAoqm4NU+hPmC5EUpk5Bi8kaGYq5glp+KuEYHrj7ZG7BpE1YYGSR37x5i/BIx73RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGRkhBOm0acFfiSEmh9UF3jmdHKOK9XTOIMbhkg3R1M=;
 b=U2SZTEHGtV5NWizYqb524gCcgoJYwae700YtTghhNInGIvAg6cgrWn1o/C/g/MRsrfzEgoEJuWwgfzG+SkvJlXh+pNZhfffE0SD5ekNKcBT44MTkeHZgFDqBegcWiFM3lJKvs/DfcN8nWvFyOaroZjz1sbV1mXr54zydVHvy0NW4N6JQ/JDMr2ykvo8n6zJyS62RD4FuJElU4Se196BipxVq25GnGQSDl8ULnHTE6OD1pRlM0coXgKIZ6PnyISCH7xlOA4e9Z5Ur26OwTMHF1y3GMGCb3UajAZv6vI4uqJu0j1l7YkJoybbuKGUOm4Jt5qfFXs5+2OFjvBTFDlnsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGRkhBOm0acFfiSEmh9UF3jmdHKOK9XTOIMbhkg3R1M=;
 b=bnPdxBkkkOEgynJJZcMVu3vhZKTHCM7z2DSpYsEIbEtBdjUi+818zZlSzw4kU+vhpc0ZRPQrhnB15+K/bWUWZtHMIv2y6UwjoeXz+PL5fYWqPlQcx/YuzHiTdQhfgLvdWxyOTkvxJqMGnbTtZJxEv+ZSiDX+pKhkxGkzohLQ/GcQKvKZh0UsAe1rHWz0wTWvl9DpRmiwXOLrwDLmLGKOSuZGEhQo1VATish8MvpnK4LFVXYmnPxm2JGxH8EtSwWR26vm76fEbfcfy1AOWeNLAxuQbPLzcjB7JBp+KoKZNLd6BxoeuaFuNCha1c7nBrSD7H65jgN+kaV9BQtifaYQjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 14:01:21 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 14:01:21 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	shuah@kernel.org,
	ben.horgan@arm.com,
	fenghuay@nvidia.com
Cc: x86@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v6 1/2] selftests/resctrl: Fix CMT test failure when all cache bits are tested
Date: Sat, 14 Nov 2026 22:01:07 +0800
Message-ID: <20261114140108.36954-2-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261114140108.36954-1-icheng@nvidia.com>
References: <20261114140108.36954-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0050.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::12) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 379688df-3d63-4170-71ca-08df4257c2e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	vnPsYHUOha15lg0Mcl6Ft4hZuVRoRg9QGXasS7YBXw2rKh4h4vb8+46UQH3TnivazAPLhKcQevf31lRXT3OePmayewY+nQVBeJ7GvP3Shr9RK/EyqDqCn5SCqjrvUdL0bjRWXxKyr53Un+hbVmZ/kome1QwcpxxUe012ftOBftDj3ZvN8OeQQFOFrmnFdbR5BjapgfIDZXSL72lqPaEBv8GyO+yTWtXc1Ww60gCL9Tnf/sz4G80YBhm8atbjsa9DMRfEv12HuP2Vhvw8/rxVOadVEe8DfhA68bVrw9Iy+L9H9qw+bsjVkmzYvPVnWo84r5EwvNWgrRktX7AgM8SybuMceyrtRtWMbOUEzhpdZJFbEswuKf/4O2t+s0UhzT5rpc7ZS/Rc6Fm5s875u1TiWbTfzA4xDA23ScxDV1SQWV60KIzRktmDLy76X9Ap+IwWwF/BrQk/lLykK8LpV2ydpJvcdkznhhFQX7aetpDkqwFM4P27oxu+8MSUHkPpPTrq2FyAOLjpoPzRZ1+apjfeZ+gNHBiwkmpimEVgfw6dYXMTVj1jQx25xFYSSNGb4ACoPRLui7EctbM+7DD922ao+TfHZpT6/d9SqXVl4k91/0DzA1LWD53ldOlt+Uk2TUNWO82z9SuNHjDrLNWh7qYmcS0oWoqArbdHne9wn0rIpnk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ArshEaXuGz1g8AT6NblYOhSMecrzhE9LUnJu0iYivQXAn+wr2Pde7atc2ebq?=
 =?us-ascii?Q?4aYYoM4o4WyUWS/+0oQOCFdnaI3ss6kHfkgecbK62n+ObjQ3AbfXc63AKOAq?=
 =?us-ascii?Q?Tgt18ev+HBnHjUPIDYNDbea8er7B5udKRcp/Ue/0Klw0GZEwOU+7W2c9sdY+?=
 =?us-ascii?Q?fB/+lEGUaDzsK2HfnuCIZ5KWUj6w8cfkVIlzvc4B/QQ3fpqLuFETcj+OOtoY?=
 =?us-ascii?Q?aEEQalUQ8tR/yWpbngYa13r5QatdDOZBCdckjE3GSomV71CDrme6oTphueat?=
 =?us-ascii?Q?aBywIZntOyyymZhov4muHv7EEsFZaXvOM0UrLGyxIGs3tzHJqv7EmYq05ily?=
 =?us-ascii?Q?OTvSxuAY3ymL2ovPIw/UkzNcVTic+a37uLW7CJZgJi1jqSlb4b8sGIiJcczW?=
 =?us-ascii?Q?CcG4FsYI4ZDBQwuUTCw/D9PNvxZ0NJl/NOr77xOdhZkxzBc9RXCb/32IOaSX?=
 =?us-ascii?Q?YpJHIZI/epH1AC12UrmE98lcrSEGGTXM5G98mG5u1sUmWIRX0dLCy7Ar5qdb?=
 =?us-ascii?Q?C6JJqMIwm0OWPXVfu8oFHpk6R8c+BGHOvNX01CBW390SzflJHu0Lon4AwVka?=
 =?us-ascii?Q?Q48flTD3tiGq1kvcL0mtdW18H0jdCuv9nvmgL6Xz8mp50DRworCB8rY2D6me?=
 =?us-ascii?Q?yYNFLVkY3hlZxsVWUI3zOXjhXeGCd3QMN7r30FkQM3gv0vTZcWU87azNQGk7?=
 =?us-ascii?Q?heYNSOpKtw/v1jTgTrS3yvcuJWkYHnE+umxLICHppBJUfzy3unI5YMsN5Jyl?=
 =?us-ascii?Q?8qFfTqKn6JiU7YjxiiSCiAORqtuC5ytUctYh3EdBiBjYMcuP4qBBVBjNm3Ht?=
 =?us-ascii?Q?r7OapIuVd5kB+ItNjLtw0rqIfwhtUJsDcAxuFIvxqTiZEScr1WCL5vDgzzLk?=
 =?us-ascii?Q?VPmfkHKxiaecrC1egyrkF1CqLU5SC5TGk47spodUI0Pp7IZ9ea6OBV2bJQlE?=
 =?us-ascii?Q?qAWOYcc/9WClW27jmlJTBVnZIpdopWmOUBLYF0GTvaE7tFKZ6bb/jszsQRCm?=
 =?us-ascii?Q?WFrT/nIx7v5wxTVRtgXskEefDziqSTeiT2Jh5MJXSbERrZtWr51CnCgU36MU?=
 =?us-ascii?Q?YbLN50KyxsoByog5bCWmxYl+7yh3fuPqRxMVmKLdy5N6YoXQZyESXGk5scSL?=
 =?us-ascii?Q?n2IdKOIprGh+RogmbOLbxsY3av9FxZN4gMS4XK7Pw4hVu3eSu/AunDC4IA4N?=
 =?us-ascii?Q?CNWRdvVVD52l4ElqpT4hBVW/EDBshPEF1btatvI6ZEJbr4qTVa8N4L5bLQkR?=
 =?us-ascii?Q?+ScBj3nQkuNVhE0uAGkeNdyXdaGbB6iuQBqgf/H20gifJZtcf/Ufa7/pA2qc?=
 =?us-ascii?Q?rFS5HJ1a/ZbyhGaBbr3Paz77YdrKSr+eigpk89usp1KPwPbZJRdwKvAmvvg5?=
 =?us-ascii?Q?L5J70+HwElpq5BC9kTiUl+v36kGlW/AVnkxKOwjSVeHxVMmtJGvW697qlb+M?=
 =?us-ascii?Q?4mxKtWed9b++oAL8r6RuL3HFiHHZN/Y6hgkFPx9HwNZInFYkOiMQx1nDvwhz?=
 =?us-ascii?Q?pap3Jx3Exwm48MagzqqdIpV2tJz2G7uJRNO58SfqHhU5ffVWvOot4eI42YSl?=
 =?us-ascii?Q?XIz0ufBBQsfzKQiu3ZSelxtHrwYzyDwDCRNQCvZmlfGqYt3sRwcSNIhhSfGE?=
 =?us-ascii?Q?0qr2K9Wu8gYMovAJiMjf2FnnQ/nSW7yeN4kwsRxBl+eyIoVv4QnMSnKHUmEf?=
 =?us-ascii?Q?u9FRj0OzUrJ1ECliyKK6TlAxCw3a+oocqPun5OxTZU4rnEA5HeyeJC7YETe8?=
 =?us-ascii?Q?a1mEUy/28w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379688df-3d63-4170-71ca-08df4257c2e8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 14:01:21.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqKe92L8mNIgl40rIDI151rOyDsRxI3vRPJPaAdmNunC6CtuqhgAONLFQjJMN4N3bbfS2eHHTFlHs8JKfCmhug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613

The CMT test accepts any number of bits from 1 to the length of the full
cache bit mask via "-n". Since cmt_init() gives the default resource
group the inverse of the tested mask to keep other tasks out of the
tested cache portion.

When all bits are tested the inverse mask is empty. resctrl rejects an
empty mask with "Mask out of range" on systems that require at least one
bit to be set, cmt_init() fails and the test fails before taking any
measurement.

Only write the schemata of the default resource group when there're bits
left for it. When all bits are tested the default resource group keeps
its allocation.

Fixes: 7a214b4ec1c9 ("selftests/resctrl: Improve accuracy of cache occupancy test")
Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cmt_test.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cmt_test.c b/tools/testing/selftests/resctrl/cmt_test.c
index ccb6fe881a94..5d0bb27b7817 100644
--- a/tools/testing/selftests/resctrl/cmt_test.c
+++ b/tools/testing/selftests/resctrl/cmt_test.c
@@ -42,10 +42,13 @@ static int cmt_init(const struct resctrl_test *test,
 	if (ret)
 		return ret;
 
-	snprintf(schemata, sizeof(schemata), "%lx", ~param->mask & full_mask);
-	ret = write_schemata("", schemata, uparams->cpu, test->resource);
-	if (ret)
-		return ret;
+	/* No bits are left for the default group when all bits are tested. */
+	if (~param->mask & full_mask) {
+		snprintf(schemata, sizeof(schemata), "%lx", ~param->mask & full_mask);
+		ret = write_schemata("", schemata, uparams->cpu, test->resource);
+		if (ret)
+			return ret;
+	}
 
 	snprintf(schemata, sizeof(schemata), "%lx", param->mask);
 	ret = write_schemata(param->ctrlgrp, schemata, uparams->cpu, test->resource);
-- 
2.43.0


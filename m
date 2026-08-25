Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F383F3284;
	Tue, 25 Aug 2026 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653323; cv=fail; b=fSBU98/4yJ9J7pB8ecL29AK3rJYiTmBQwu+iCd56vB+L6srGOfCyoLnQGojnmIheM6howfnipRhn/kYXbBwKDkeVWGrjfEzpjAiRBZI/TPQiwpZlBc6hW2ZAnzDhVO+yfsYuQvL7aFZ000978rgdGBgGrOLaGGBLaotOlBHfzlA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653323; c=relaxed/simple;
	bh=+twC+HclDqRkZ0d6y20XAitnu2ljnbHNU2eXRv9ke88=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N2K0geQ/REDUWtEciy5jT/jMJHcoSI0nErk7TdnDRx10eTBV7tAT8mW3L11yORJs0mzROV1h++Z+WIxfkQ2BqtgcMPSrd9z9oKj5tIM+saC/d35tIZH9OZmZT4IPuel3MdynhBPfbDiJTvUxO1OOqK12oA6b9U08i0k8aeQX+LA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QWjrAy+J; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QWjrAy+J; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QWjrAy+J";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QWjrAy+J"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jZmUdL87rcZ2WBMNgrWMZm4JYskPnMYh/G5EGveNDA2OsPCMuYhUclOOjIuf1PNCuG3CLDsh2GM9mNpSaIwOIurCpoqbxxI73hofFyPVr9nLyjLxLgdsBqsyyUfVZgJlz5IGLXV5xjpZCxTgt5NH5K56siU+aKWUZ347qtLs5E9PKqHU7igX9tGboKZmu0h+0cJRyT8x3o/DGbN4j1tsjYmSbjOPwu41lRIvaWScs4Cbd352jVTKLR9jzR2Yqmy5uTmlIJfMibmFRbvZa+Up+WUJmLx1e4dJ5oELndoqJzJJGtzcZeskmMckX7Spsyzpnmy///ZKc8u4P5NWkkMV2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDLgq0A+viYb/JGEo/jJBGtLXdOIgbK4Kp7QWGgspWo=;
 b=AZdt/rDvyr4pkJXih7tZhupFYOhvS4ww0LTb0dOu+7WMf5iOlaOCl7CzutZ6M1VzmaUq7X5EbSrs1WG0f38ahGzwJBg3IlMCOkvj5xC8/PXDAh+1c9RiEHN+eFmFHMMBwsx92HnWZLDaG+9rl8/0v6UgPeSQCZ7HFkF/pbn0Rmgyo00YS+JxwaCLuUP1z2M5PY9uML3oBhRdxm4qbMDhs8hEju4cjQu4kYlSnfp3kyPMhZ0A7nbvzTy+1I4cDrsCSzFWrcuSLUUca+vJklVuv4JqJhd7uIKTcXK/TCx9l1XGsD7T/y5sreDchfuKugG04vl0MAUi9YwhrX6399gT7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDLgq0A+viYb/JGEo/jJBGtLXdOIgbK4Kp7QWGgspWo=;
 b=QWjrAy+JPz3U/erkGJsMCbcJJAvyHzFn87NzlLLYkIDQ5cEaNfLuUK24FbQznJCDXZzYCMG3s1rKX9em62dzOMDlmJ1wpPwPnPOnWyeWohFeGSzD5OriYOb02ggHaTOV+tfvYaD0wxf2j1q6npxmVYXj0a3vkgjmmq1aVS2whbQ=
Received: from AS4P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::14)
 by VE1PR08MB5693.eurprd08.prod.outlook.com (2603:10a6:800:1a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 10:21:55 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::16) by AS4P192CA0014.outlook.office365.com
 (2603:10a6:20b:5da::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 10:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Tue, 25 Aug 2026 10:21:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGmJVYcVogn0GxQmnZXhB/08m9B4xeHtktCaNqxDx/QdCYbTydrA5gTTml7Qi4pZ9upkGnG7UVa6PCtz0nRF8sDMsfvgfGEPbOCRw7MDAI49G8EEEZe/79uqL/bJf7k5uEbJDSACsWeP8Zlh/zKmvmcpBZEktiZnRBTC2xE4gBJFiMlI29O13iFzxwpeg4iPLPWEJrigKM+vddiK1iB7c49MjLhOgJiitBcVm/Oba7FD+TW1rLp/cGIFDZRVTmBcA/ULGldisx9C7iah/vIMoi3SHP66LscfXAuomrBIU4rgGuTvoHV9O7H5ScrBjWpFlBjX5BX7EMKVWWeyoGlvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDLgq0A+viYb/JGEo/jJBGtLXdOIgbK4Kp7QWGgspWo=;
 b=W3bnMdRr+3heAunNDmJj+doPUXZrd8JnBCQW7yEjY6RMJkyBLkBe4gRzf2JBefmlB9Er5v7/wV9+6h9U/v4020f2GTaIDM84pUno4lXZGg0znBTdhd+8y9NAWeonVEIH11Ix7NBvam5RUf6QQzRlZR3H9CvFRHzMt1xE6g7X5c+gDPowEFM5CACQusOpqOkAHSD4bRjd1ncnLPPFcQVlRBm69OPsZdejJZl9+Nqv7at54Ne0B79EneSwc+dupeV9OAUQhTuEGkbeseH07P5ZR41a6gC1z1ITGJ+a6406B+1e9RA7+w/R/eI6ityLQV3PxUgX/XxmaEg0DMamt4iJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDLgq0A+viYb/JGEo/jJBGtLXdOIgbK4Kp7QWGgspWo=;
 b=QWjrAy+JPz3U/erkGJsMCbcJJAvyHzFn87NzlLLYkIDQ5cEaNfLuUK24FbQznJCDXZzYCMG3s1rKX9em62dzOMDlmJ1wpPwPnPOnWyeWohFeGSzD5OriYOb02ggHaTOV+tfvYaD0wxf2j1q6npxmVYXj0a3vkgjmmq1aVS2whbQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by PAWPR08MB9056.eurprd08.prod.outlook.com (2603:10a6:102:333::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 25 Aug
 2026 10:21:22 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 10:21:21 +0000
Message-ID: <6b34dd9f-b65f-4384-9e43-4bf0a83be2a5@arm.com>
Date: Tue, 25 Aug 2026 11:21:20 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] selftests/arm64: Print missing MTE TAP headers
To: Mark Brown <broonie@kernel.org>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-3-usama.anjum@arm.com>
 <b95d6b82-ce25-4d89-8d8e-8be1f111812f@sirena.org.uk>
 <dd3e1cec-1177-4b34-946e-20f0cfeaff7b@arm.com>
 <988acb8e-2918-4f88-99b8-a0b1a09f4793@sirena.org.uk>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <988acb8e-2918-4f88-99b8-a0b1a09f4793@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0681.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::15) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|PAWPR08MB9056:EE_|AM3PEPF0000A796:EE_|VE1PR08MB5693:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7dd1fa-e44c-4714-98d4-08df0292b03d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 1uVLER2z7EJAOqE+BwPH3hDjS4sl8wfxUWVNt/cDBnDy9MjgqiWilCValx1cPcLxBAZ45+9ZTv3MUeBvYkQRHW5h6/V+d07072311uM5GbvV6AcEG6WAfACTwqrimtmjSaTiCRlsHZiMie1/5wM1a/pDyxISh2pN2omph2zjbIJSkL60AD0Ku73KG12e/fKY5Agdn9dqSGa/7LMp1816E2dAHmLbVv6brPoGW6MzI9ws/hfoB4CtNolaWZqF2074AWBLzSEJnndc6zrF8MwfCLD4mEv3yIehPnuCvDznjLGttyEfiFFQeFwbr3tIDW+1psZDY0gy+8yY/pqg8m1LhSvwZwuI6FxLezUjHdcUm7RMXCANILVzoh85CcIKPRE3K3QtjUC0XDsuTzE+rCMXUUev+MutW3n4vbm4p8J80IothB8+ccY5C2RAHJSbnsbjZf6FnuRBliHuRM+YtQ8eWvs/HStOE4s8PUgFOjgFg/eaWToK991ygsPByDv6Ulo6g4/NQHZQh+oyTwrB/Q6iZjwbmKex+zgmTeTqrL4yNkzU8PTDa/N5ESa5Jvmhj9eBxMO9/RMAYw8PjZh3083qvVEkbiL6uUl0SiYMBjrVPH3S20epmXPekLGp/GXfx8K8AqZjerNqcX1jeMHnrE53YVmlKeBp7XL7e5oisD6JO9A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 ZCwZcCk03+UVtcGkjmb5nD3AwQKnWId8nweUxvYWsAUBY1lBC60UrIZ5CoCDd2UPj8tQREY4tnkNSdMcuxBR4xSyICrdtVT8sdsfH5YZdi5hvFnpIFbUeeXUual5JLC4dvxJWR7Z3bvm5avRYO1DDU9ByrbubBTz+l6TGXaHPoKZzkv4qcJCtib7eAM05fVk6aL2152H2JiGFnTNQvM8XAWFou2Y9yNRdan6nWoC0bb0jPav5yjrFvzR45j7OObQhKfNcSXW6DMWHcWNNUl+pinYEEf+zrXDi5jNhSKcUuUIRzo2k174tM3k1P0/LLdb2FlBiUdbSFLBc32Aj5kvwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9056
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c941b706-1a6e-4ad8-49ea-08df02929bf9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|14060799003|36860700016|82310400026|35042699022|1800799024|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DCrSHIvaBnHEZKsqx7KnytPkNRRHpXU5h+xqhEMZaKPvYMrqfbf5QmnXAMNVJlb7D5UvFuZgDjRvSpdMfsYoldTemXFszt293FY6seY3vH8TrQ2y+tH4FAryZk/AuzOgcv4vyhydjAl5xgFvigMG4gW+qmBWE5zjGuJygIbNIhplS/zsDXjBjuDkQaL5PipT5KlXa7c75vLuhdQVp8qcjzgJRdJs4QhcbJvVJ43MkMEbeUenixKOj4SHFN46BSIHACZju0TyDP3eMFvCJn3GskvmL0utV9B2lqtOMRTDtOFqZTnIFY0KZ/AphRiHA07XrqtqZR4RQLBYD6ym3UoyH7sWJD3FUqt8R1U48xueLJd4qZYv2iTcAzwWwJKkJhVBjuMUQeqYRE3a6fipJYROs58DjP4qdmsLWJC4Aa4YzzSriE4iEny5naNGbL+svRGZ91iq6v5lcsHwd9NBwc74ELjvi2CFEyaWqsZZMgXttrjguqwuNwRNravYXNUQPS/2qkkjpKDKrJ2akcrKrNkV53Z6+Pc/5cBLZiWUgCJABbIo8cDFLb/tZbSjnxQNY2C+qrMonHEylCNEszNsNfOJtsf2ESh8jbygNl37NuqscDp/xtOzCnhzyxgKXDLPtn6BkTQ7LKIPZ3PyJA6cAMNQpGDQdrctEy2yr0eDq43dEGwYgee9BSn8eqFx931wTw/3
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(14060799003)(36860700016)(82310400026)(35042699022)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Csitey3eZq8C/VsgRPZSddTr9YkZ0/ZjbD2YH3/R8oED050gf5UHsSQ7/X8V2V/JFZGH4NDFSHQNDVP2FqE1WhHccqLy+GsHildlnUdY+4fdpRjyV5gfgPPwSmzIDePJ60GmE9pH39wbrwBzksyfVf4yp1AT81cb/hI+J22Es9WMuqlC3VuluL0emNHS038IxiRWL/dMF3CNjkf7WvYK16BheZ7m9v6X0UVQKn/18StE1t69pSeX2y9scRUebJLQZqbQKZ0QPdVvdvYz4ZYM/mAubmtHOgMyGRynXXo1HYM96sn6x7Zru0RsP11exTTATeA/maAaLyA1NIohL6PEf1HX2OgRTJunSUmG8YplRHOGOktDvwnTRsPehBlqrIM4fPvWfy6dhCq5TewV6HlI/aGISzno+bAvXlB6mYzmyrZJmPf1Uz0lRyqSYMkNxdVe
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 10:21:55.4269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7dd1fa-e44c-4714-98d4-08df0292b03d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5693

On 21/08/2026 5:21 pm, Mark Brown wrote:
> On Fri, Aug 21, 2026 at 05:11:28PM +0100, Muhammad Usama Anjum wrote:
>> On 21/08/2026 5:04 pm, Mark Brown wrote:
> 
>>> This should probably just be a single patch with patch 1.
> 
>> My idea here is that the first patch would get backported as that's
>> true logs cleanup patch. (1024 lines of 1..1 are avoided with that).
>> This patch wouldn't get backported. Its just formatting fixing of the
>> output.
> 
> I'm not sure there's any problem with the extra backports, and it's a
> spec correctness fix for the output which given the existing scope of
> stable backports is probably reasonable.

Okay. I'll merge this patch into the first patch; while keeping the first
patch's fixes tag intact.

-- 
Thanks,
Usama

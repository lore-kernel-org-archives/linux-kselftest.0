Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CA8379C47;
	Fri, 21 Aug 2026 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327815; cv=fail; b=rUICcj/4FoqcxX5HYG++Btv0aTejIOa2B3I0ollOCzUvGCMMaoFmEP13UCg6rWEgGY8Ahpm58hC7VLP6P231RcM6cCn6XOgE/r7y6uKCRpwSuUqW1K1t4ek8zsVf4qv0xQ4BWX1PkWaHWDWUSm19fZvX7tmi1pegqMW2TKcapHY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327815; c=relaxed/simple;
	bh=ccJJ1FcP9y6HPC565UyyWEAJOkHbgOhM7LTClYZvlVM=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bkq2A76XbXVpECuzJRzPkR3elPxPAaT/zqc21XDeb3kTPDVghAPA5k1P97soUAQ1EEyBALZeX3arksG5qAiKsj3elbb8zBBvSrklwSy+rtkpUq54yOMEmZrMZtO1TGOFKFuqZoesG3IdL7yW5TSzVWPRBe1Zo9fX/WfGmP6ZrY8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WDTk/E37; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WDTk/E37; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WDTk/E37";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WDTk/E37"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CAS4NhtwI1KD4zf4ogfSi1cA1uoFcG/jXzp618aksjRTjyXtsjJPD/K+ML6toucfD5gFY9IrGLheoJubvNXRya/tFaX7PnYSl+O0SwF3SIp1ZAKajA7pNmnnj4BSbS3jr9x3PeQc3bO0oWfTrTPypk9ZWdZ9UaZtf6YBL4NVAGWwjSleV5ouJa+mTHicP1uUMIySSdsh2IHdYBOcV2/lD7CZ4mbbsFafn+sUXQoOz0nGwVcDkCGXVRJAGmetD8t2kZD3kV0wnrMFJzQPPisOUZ7o9ArG9O4Se/ymYbXGUa+9YkkK3Nkjd+VhQdcUpwZUwcfP5Nqyao2cPvip58KljA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zz7L9lBqx10QP+x7xpX7zPNpKi/NPjcnTPWOfSgVr0o=;
 b=l3kqSKrv6gJ+A/2wDww/EG0s/cPLl3d3PoY3YnXu+Afnpx3zSEZibrVIWoZwDi7uDn/TBm9gzj3z6D3urlpeH7h2XfnxptpUkkQ2Z59RuxfZeSeYA2QKHvmaGEpThx7jagpcsYQgpgo0DfimEsCIDyAaHxbV46B7JL4QyyGp/yyvb0vGV5x6g0KNHAsI0jaFoWaO3GHWBcda12R+mdX7cBlIJYwpRXO/i+SjugrmD4Gv/WVSD5zv/aLvQbvCl/gbe2DBRRkgxF/cE9OIa/cVpDrdXB7WPVLRSs5tA0v6szHIbM6hdzccoQHYaDMihERS/13DDkE/mTuV22ZkZxcwfQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zz7L9lBqx10QP+x7xpX7zPNpKi/NPjcnTPWOfSgVr0o=;
 b=WDTk/E373o3TGLKIcrvNjpnzJmjXrgfhGtgHkevvG/nUqDUyJ+IO5ahug4X8L7yy4Op8EDkjKaoUxA441D1An6xNixbgrbtO5HpUwM2DJCNKcd37WAQlK1N3d0AfbmFb8CcLBLzy9vI/FIrPRTYSJshk7N7jPt5MtUt+ONvyyzY=
Received: from DU2PR04CA0246.eurprd04.prod.outlook.com (2603:10a6:10:28e::11)
 by DU0PR08MB9420.eurprd08.prod.outlook.com (2603:10a6:10:423::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:56:46 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::66) by DU2PR04CA0246.outlook.office365.com
 (2603:10a6:10:28e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 15:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 15:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW05vba7XcTGQiIY+Y71OsWjl7bvPsmGWFpfXnLK08txlNq1lOpy3hf2KEXeD5o8lWCFJ8cPaVSunqGLm3CyioKuJFg7OTm6zxB4/d77VbjXUxP059xCHzzRiv+VxaOq1KX93iD+Wjys3MvxMQ5gS5jw5+8te+zCeGZv1ZoLnPQ/SS59n9suar+k9OnVRXz4fPfzTbDJHa+VQcW5lDOM7k2xV9T+vErlVXY+1PnGjcxeClWPt1wWoK2pwMzrL1PR76t8RluI+nKyLWhFuq7EUBGhsEPt0j4uukIeG3ADdqUaZg5awrzP8wfqbBDl2at7ugJGpghTW4TwjgilHWa2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zz7L9lBqx10QP+x7xpX7zPNpKi/NPjcnTPWOfSgVr0o=;
 b=fYRilsZtuPdLJCDuI3dq+/W2h1gGSoTUaciL4jIZbTFsif6STiPd8fBZhtceaDyHaH1oCFINXicfzfhnyLcKEdZhDzhpB3swoy8t7KYm4QzS2zaVK5xcZzIf7hOOeMXDRJ/I+f1ZP7x3/RPSbNlKdpa4Af/V/BC9k4CP+rbDW+tits6tjmW8izljTNbyZgl3T9QOEl/9wCcCK127jjnml6JmcXYXb81EdYj9BllVOCFqW6lafnKCCRd4xajTsMQVMYrKrnjmjRnMnCRXQJpBxM3kQfgQmnRezdylj0bOlh7NjNdFDDPteB1RtSO5uecXHrzA9J+vRes6G1KFebE+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zz7L9lBqx10QP+x7xpX7zPNpKi/NPjcnTPWOfSgVr0o=;
 b=WDTk/E373o3TGLKIcrvNjpnzJmjXrgfhGtgHkevvG/nUqDUyJ+IO5ahug4X8L7yy4Op8EDkjKaoUxA441D1An6xNixbgrbtO5HpUwM2DJCNKcd37WAQlK1N3d0AfbmFb8CcLBLzy9vI/FIrPRTYSJshk7N7jPt5MtUt+ONvyyzY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3410.eurprd08.prod.outlook.com (2603:10a6:208:df::33)
 by AS1PR08MB7404.eurprd08.prod.outlook.com (2603:10a6:20b:4c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 15:56:14 +0000
Received: from AM0PR08MB3410.eurprd08.prod.outlook.com
 ([fe80::b6cc:973e:a807:c3d3]) by AM0PR08MB3410.eurprd08.prod.outlook.com
 ([fe80::b6cc:973e:a807:c3d3%6]) with mapi id 15.21.0339.007; Fri, 21 Aug 2026
 15:56:14 +0000
Message-ID: <e076f415-f785-48de-81fb-8f475253ac31@arm.com>
Date: Fri, 21 Aug 2026 16:56:12 +0100
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
Subject: Re: [PATCH v2 3/5] selftests/arm64: Treat KSM merge_across_nodes as
 optional
To: Mark Brown <broonie@kernel.org>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-4-usama.anjum@arm.com>
 <918c46fc-f6ca-43a7-9629-0d8abb1c1e54@sirena.org.uk>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@arm.com>
In-Reply-To: <918c46fc-f6ca-43a7-9629-0d8abb1c1e54@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0078.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::11) To AM0PR08MB3410.eurprd08.prod.outlook.com
 (2603:10a6:208:df::33)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3410:EE_|AS1PR08MB7404:EE_|DB5PEPF00014B9B:EE_|DU0PR08MB9420:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad7ff13-8fe6-40f2-7bb5-08deff9ccdc0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 +yn5Id/9L3yVTGV6gqZneGEct0/Kwjde2KNSO4Ry9lqXJYC6uBlSyh11qW44LsjTZLDYRn/AM/i3tC1qpTrx1LMf+dj1I9svMiQ1qj8gyBaxR/X0xlqsdZHRU0UkNisoIsAeXq+pI2MrRz+nyNvP8UxuHOkUybN2y6oqBaf8xQP+/TEHffZOvE/FfkaHykvBted9XFa6YL/PhZAsuwcFfn1UQgjiY+InW+/7N5B20872kNm+O7zz9BWhR06fVfvAeTTj5TePkcRHRsdIUbkZ4ZLL+MAj3Lr5sy88Qo0eI1PIUFMM9IOwophTO6DpLAHcr3zLGr2AqIDrSPlSeMC9Wuj6GpvCuXP9PwfvXFPi2abLsPF+XfydtYkzNVgk63LvBPny0/2+eURT6v8JUrrWKXEXkPvEXZhQ5WNtchHD4e+2I16gUjPCgmJCw6a1YTU+I2BKbKWRlFRoO4v7K0RVIKNhMmB/SmEPkvh2LquZFEfLC5RmTTHy33KGSa/MoJKOj+GWUCWR1WQnwtmidRtufayM1dCV8CcVhA69KJJogsJ7F/u0B0V+E8pYvbw2xhcH9wwBy+htY3Z46TYuPUFlhWHUaKE+8i00Lfse0QnoTXuXnWW5zFR+iXF4AWg9Q9V0/t7vQ7gysVEMJytWyv6maVAtvq4yDkoS+MKjePAnJ/M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 T1PtOE3qvuNwrBWzfFT+2On+3+4/fXENrXTFp/YrT018akV/8VSSO2D6LsXwUIeS06nD7KLg99e7xLMbJErcXbbm4IlSs23R/vIymYMYALhsT9uB/eAfhl3SPOV2Ii7z9K7XUEX6C9HnFi/DD20qvA5vHl5kBSVkobD7/KMHXEBpUr22Ycp4XzRU1O7BsMIDMRH2apMyf5E8IwKLfh6awGkCrFDQhm5HHAiCFjGes3ssDDGJlwTFvghyc1/MfRAy2qz47gSXjr2l+nLE9a7DBUg/45egi4D06cxdZl7KDhN9TOALFfWBn/loEd+swH0R97iUk9zzDNEaMrpCol8j9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7404
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71b53633-387b-4435-c09d-08deff9cba51
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|23010399003|376014|82310400026|14060799003|36860700016|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	hSIQlruPds1FRDpgFcc13md7jM0S6glSxJIcv08wa/menHRQch4oV1vAo5nFkaGmkb6qcVFY1LIkbIYv2u7gXACegqHKN0OubLm6tY8paT35ilbr3S3siVGIYSGU1W15xgvpFzx8nryAeQv1XI693LMaWMWL8QisRmhr+yssK7irKGcsdA6R18K3jPn6TWx/n69JRaBI3vy6H0zCcn113VuyU/7SmZaBA/XWYybVOYRrLUFcW4zn0kmMmGKeor3/qCJHRI0FrYoec2QDqMRSLuKLk8jK3BnQcA5r+5BkdnWhCw9aH1XW79EyykiRelBuis2+sPJTgYi2etszJCyOf5L2Ry6no5PiUVT27o1Or+9yy8MQGrDcAVM7pDR3h+EDysv/pDqU89JNo9WPPFYUnit+uv6h3pMHBSTbFBQroQpoUJ/qecVN1KHph7dqCzZj1h/sXg7l3sI/xpq2ARc+/QANwwTFgYQMQB+1/QJ7g7cv2EO0bcB/ph5IDnr5a4XNkGtjot7YOX4ZwerhCV3fgT1LbSEYDFJs3wG5Lk/n860qkg8FjPcssmv5iMRgcAXcz8IeSIYt5CvwUXZWTSgWKqPdehTy/goVvICyqC1xCZvJ7y+h5ee/FKrbGlNzenXuxyTMIPF/LjKUA5ptErEyG7Y0xM00QTdRt/RMdoStuiV5h66o+K7JjYQDok+UjvetqPGxVawQcwfg+sBHLMq3WA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(23010399003)(376014)(82310400026)(14060799003)(36860700016)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oV194W4i/Gc3mDRE4u6FPoaIs99O/EtTVcrRo7gwUmY14PCX7IsLP2nlXJ2GrDOxfRjw11Oasyaenw4aQ/UdWVhUZzB2qdJZiDtX2utTsCIyZPA0A+F6NrkWu6FNkEAgSaEO/ippH+gbzketvYzllQjYDYMXLpZowD0F5lqsiK5vouKY2TyCAEFmvrCLbiE5aoKrOfxSLeC7azLwl9vDWsFhlECv8JfIpiDFpX4+L41qsQiQYF5tLG/J1eWVMlL+JW0dlAO5SkzhckVu9Bshm/abQ2kZMgDg5DVFva9H9PPwIBAIPyu/+HVq+qTwQF1HvesEmJXp73n0OfR9xJnmzurAdwHDWsjWL47BM09jdsJGX/28enk2cU1ALEXW4hYfL4wlXvsCVGB8PZjJAmklSb4UlTH98Iml3RnhfcEzFh7JCkU6lAznXkSw2cj4B6zx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:56:46.4136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad7ff13-8fe6-40f2-7bb5-08deff9ccdc0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9420

On 21/08/2026 4:43 pm, Mark Brown wrote:
> On Fri, Aug 21, 2026 at 03:15:51PM +0100, Muhammad Usama Anjum wrote:
> 
>> +static bool merge_across_nodes_available(void)
>> +{
>> +	const char *path = PATH_KSM "merge_across_nodes";
>> +
>> +	if (!access(path, R_OK | W_OK))
>> +		return true;
>> +	if (errno == ENOENT)
>> +		return false;
>> +
>> +	ksft_exit_fail_msg("Unable to read and write %s: %s\n", path,
>> +			   strerror(errno));
>> +}
> 
> If prerequistites for the test aren't available I'd expect this to be a
> skip rather than a fail.

You're right. Access to the attribute is a prerequisite rather than the
behavior under test, so I'll report access failures as KSFT_SKIP.

-- 
Thanks,
Usama

-- 
Thanks,
Usama

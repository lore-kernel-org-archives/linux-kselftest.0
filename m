Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2E396D0D;
	Fri, 21 Aug 2026 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299418; cv=fail; b=GPR26anFAziLtZk482ZmSTT8vPUq4MBQNg18gEjMauvJmMTiEAaTcbEf/HIC3ABx+1q+nSmTeMqL2c4xNRb5VSVNlLlw+3ACpuSCnj9OFr0+uTCBdD6lYsi+7yvOfe/vyNi8AI3b5qgio6tTYtjpOUCoU57vkw9q9Ke446jfVU0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299418; c=relaxed/simple;
	bh=FzU5BmTCx3dtBiA4E4jg3bPWCkCTODvRv7ADeuUzhzU=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xfmiir1jOnkZ3Z7I+vsgufXPRsYzQp+ifLaazw8B1/q4/I9QkvQwjSIpg2L3tnxJOSxonZMUAUyVjmlChCdfnIvqZHymC3kmlYjsQFmteTB2+DBG3iQWNr+th939IWTOi8HdJAqcmZs4wBKtCwnLvViTA5mPOxdqvZMVaHoTUw4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J+Hyonuh; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J+Hyonuh; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J+Hyonuh";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J+Hyonuh"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mK5RWEyuMn/dWfmw0uvnBGMWw31yA+yVPJrqAfYqqlYJTt4XNfFRsnzh5HEjcr7QzXGL6BaBWB9Gaa2VbzDE9hmfF0FAn3kzkoiuJ/Z3XyNCRki/VijINjrFihc8uL5h1CDuOV4iPMnt8hIHGPsKNUdioDarZ4CZvYFiWWFYUzuFpbZM7sxk6t7UqZg4ct9mLEao4215kwPtrVo74rnsB2g7Ptj+nO0CoX2mTVTf+1F26jQ50eMMppeKp8Nz+TxBsdAvhCGzKyUN7WwD8gLQBtRIazvTU7opbkal94KJj8jqP/B6es95S52P4UF07reNgO/Q3v7UoWPFJ9ke3i4sSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGPS2eQWmXs1O3rDZ8NrIlJ3BVy8MOKbNxwAPOVl8FA=;
 b=am51YIQdJg7j+znsV8i9VZuDr5oK5f+wHPDVgw6KkUg7Y02l6yD9bzHywTG2gYcoTd/FdCXs0bxKVW2H5rm8WsTJVCDx2c3FysZLS3aii31gPrg88A+1uzfiw9ouY5Msyu2H08Z02hw5rel6ehZdxtNYE96gIWI3vilHIxvQffgWhn0VLL8e31E4tGv2sX95PmH2TquYdZ/Cjb4amUw8tS2JGoh/RakQsQPWyZfC+2yQMlII/hmddhdtOCHH93ltNzZUnuLmwOIcimcBirjqm4Cfheyf4nM+p0tdTkBWHoEmrPglcbLN/xyqNImr1+Gg0De/Tl94XlqN4djPlXBJ3w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGPS2eQWmXs1O3rDZ8NrIlJ3BVy8MOKbNxwAPOVl8FA=;
 b=J+Hyonuhm/ihyQ8TvuOcT0IqXDYtxkaF2vmf6a31VQWEILOEpTEWBvz96IqeXWv/vdyIkjk6MXvB/dF5mabjO8a+lC7WUe/ULYRH/hp9RbavbjdQ7aM5LWWcnC1WybDVWgdOoFux/QCqnMOYSkEAwxiVWjQd7aEs5I81phqGOMY=
Received: from AS4P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::6)
 by DB9PR08MB6361.eurprd08.prod.outlook.com (2603:10a6:10:261::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Fri, 21 Aug
 2026 08:03:30 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::22) by AS4P191CA0021.outlook.office365.com
 (2603:10a6:20b:5d9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 08:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 08:03:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMnJdUoqux1XHJoER3G+ydD3JASMgWz8ELu/R+9spVK5s/ocyB1yB1LZJKVBnyGaDVWDo15zj1uIerqHbHXUzjZoCVZJcd7i1jvxuHF3djF5ZjaYSAmwGmx0qBWdcT8kTrxIKbKXh4ZUV+ci0c+6Hxdwl6hne4KIVmIcTEqlmbYTlFcTNZ0WDPpP6gtqZCRfCjCF0z/4KREoPtM8+UrwyIjIPsIFOCzQr8OxHood3pFZefMd86LCiTDivQLt3mbI+u6oFXT48fARL18TGSBDsXPpQ6O7MCiWDMrIhUkgemACVlt5cBfXQPI30uyMHgpt0HWb2wIqA4reSYiDou5rlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGPS2eQWmXs1O3rDZ8NrIlJ3BVy8MOKbNxwAPOVl8FA=;
 b=c8fdn2/noa8fHoK2PBNTNtPnNtxpCzxvymjhd6xY30g/0jClIx9FgXg8LoK2Bdlwx6FWBbCZuf8/jg/w6vkggE/ysShV93P3xktQral4NVR+dSHHbwEOQkKfgZ9A9e0uS8d/0rMlLbh2W98hmBSOdYgPngzOek5dZd2L5bT3aeIhX1rFruurLJu6jdRHuowK7V+IuvkVlbSZeEJo67AzYN6G1KeWFGDegsxbHkTCv7ySlPC/R9P4DrBbjrb3izZnzKHqWT5n+4nwl70EbJrLhmZvVpWAp2wSznKPew40Ree8q5CW8xMZjj7p1UzdLbhN+YoRisfelT7g8nWLc/WchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGPS2eQWmXs1O3rDZ8NrIlJ3BVy8MOKbNxwAPOVl8FA=;
 b=J+Hyonuhm/ihyQ8TvuOcT0IqXDYtxkaF2vmf6a31VQWEILOEpTEWBvz96IqeXWv/vdyIkjk6MXvB/dF5mabjO8a+lC7WUe/ULYRH/hp9RbavbjdQ7aM5LWWcnC1WybDVWgdOoFux/QCqnMOYSkEAwxiVWjQd7aEs5I81phqGOMY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3410.eurprd08.prod.outlook.com (2603:10a6:208:df::33)
 by DBBPR08MB6172.eurprd08.prod.outlook.com (2603:10a6:10:1f4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 08:02:55 +0000
Received: from AM0PR08MB3410.eurprd08.prod.outlook.com
 ([fe80::b6cc:973e:a807:c3d3]) by AM0PR08MB3410.eurprd08.prod.outlook.com
 ([fe80::b6cc:973e:a807:c3d3%6]) with mapi id 15.21.0339.007; Fri, 21 Aug 2026
 08:02:48 +0000
Message-ID: <b0edb8cb-5f8d-4b87-a6ec-74003422cd2f@arm.com>
Date: Fri, 21 Aug 2026 09:01:52 +0100
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
Subject: Re: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
To: Mark Brown <broonie@kernel.org>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com>
 <3c469ee4-cc64-4d79-8e78-deeff30c59a6@sirena.org.uk>
 <630beb10-66fb-4d9e-9b86-df406ef585a9@arm.com>
 <04a6555a-7def-4a2f-b91c-91483f7d3b28@sirena.org.uk>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <04a6555a-7def-4a2f-b91c-91483f7d3b28@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0214.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::21) To AM0PR08MB3410.eurprd08.prod.outlook.com
 (2603:10a6:208:df::33)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3410:EE_|DBBPR08MB6172:EE_|AMS0EPF000001A9:EE_|DB9PR08MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a73914-2d45-4a2a-8d26-08deff5aaf4f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|4143699003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 Ibjnjf0xFu1NWUkxbu5NpC2rkJ2SpGc0xhSjjkOfNG143ZOh0e40I6AyZyaVAbR6dsjRMqknT3/IylApc1XiuWUFCOnStLiCx/a8SDdDB3Wl42b1Z1tGP3LWSxAZk49N7XKLQXzP9sGnsC+FcVuRnSfT01nSP81i46P2SvorRgF+05UZxXZd3x7R+d+PmaeT6bKiHSKCNlfFHdcU5lVhN4v3wLyLQKSDru5BSPz7Fd6yJPgckBWHD0iJrO/ppuVWXTp5yEOwEHOIjRQzM7nEBQt/GnQFCzXOtwYm4VmvQ0bQ5HILeaSXXRSOhGE7nM5aecxWYUDSBmfKnWYnq2wb1VqgL1I/hs1OBkSyHmXmhJdOs1JQjvhgewBX3PNF/68ZQUg0W/D436wz0UazBSnoa/UYnuGS9/bIrlIFmX2BM5TO6ZC8CYNpKCc4TiH2iLsW7i6kTDBr6e/L1IMQSUvxR8mo+YS9jbaG6rfPQ2rs/NnQVMOA1LCOYU73IXJ3NHL8ZnywzHqOpelr5t4wFED0Q5nWqAsuQgN/tDJGWcCdRFBr14rQRkyg+mDgoj1MUBdTihqCw/1xIJbsj90tZ62ddKn5r7YAMy+kajnRLzZb5VjbkFS4oWNKQSacDgiY63s1rs0YGMOMp2Pu541j5zyL4so34eFmPRY6jIy6TS+PNmk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 Xjp1T49arT4kfMRkhlBLy+wu9wCbcWFqG+HkHVCM9ELG69p5v4uhfuaf/EOCfOrL+juhCWuOvmYdPsTmK0pz9mXIhe9EOXvWU6MJkc2l8vgsD1arn8UfOdFHcfbCBXv4nmU/zstIotxHBTFo9xeLvkIydt8/zaKcylM0rc3/50F7TDIcjsob+tFv0iE22Yl2d9flLu1uaCtZcbdgRPps54KxUsPUCisqciYoE8fjvQF1wPvJ69wk2eadJFAFRqiYXQmYrL5x0+SKxTVjFxXpFRabn38bS+OIv5rjSZIFHTFycMVnaRdcKduUm4eP1wnaKCwRDWnOHgtyYHQv23krKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6172
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95075a82-18b2-4f73-ca5d-08deff5a817c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|36860700016|376014|23010399003|35042699022|56012099006|6133799003|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aPV/3gfgOCM83/1QxDFVZO9K1Q5pQlmNbngUmuB86yf265NoOrUq1c/tuAQGp2TJPntj/9CkkcTmZQCTlWDyKejV2ehcJvF1zQtigWSVJOMDylWgf3Ha+E20Hj1IGzo3x5iK8AghqNTrHyPYCR+a+W+EmzseKrO6I0wAhX2nihbfUaONvVFGVEqQXJhB1bNLcuHvNM6qjfp2woYguDeQsi9jqb/P2n+RiFzk/0JuLM/24ZDfcgsBnBibQ1LctVmu2hlt9dVqDDrNkJi0yiXOEzRAq0wDfvDOALRuab4LwVncw0FTXsj84G1A7mljFnQSdSbaUgvG//yomRathzX1J5ElS1i1DJuxIqa1fYkPphMl25/NvlsKxkiUFeC2TF+JVkioUl6p4u5PTqOVYoBcarIIhCQHQcYFk4sxNE25PW+W7AWcYxOUgXHF+blowbqIv1tRf2bf7G/KhhxE1ddguoljp87kq94MBeJiZ8mYw9PRmBfyx7WWZ3wNWvYpKn/kmSxaBI/IlXwHu3rhecaYh4eslHDVF/UnHy9c2UnE8ZBWl+oOGNSQMSCLkyYnwPIjtCL9QAovFUvwUV5BNfDsMJ7OR32YxJLxaxK6ulbRZCV7DlzMZbmLkiJN6SLe0sKkaa0trVNQFBjEn/cVreFJluNDw4nxvZ3LDPpIc6axccBLlC+U8EXlJU7OT4qECcFBtCT/VWDtI+BnAXmHS9ZVKA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(36860700016)(376014)(23010399003)(35042699022)(56012099006)(6133799003)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PDp2ur0YKmaR7U1QGVLVL4YfL39j77IKZAxGvZRZIMqqjW3NP//OszCzRndrI23jZSYyXFc9G0q69pPX7OG0WNZA5jKLcDr6oNKNFKR5f5mSV95ZlRTwhqgaykwsyqe4ojAWs9N1Ai+jtiQ2CWeWVpSzLHuV471ugcRWEUHGOJ0PyqVlRGpTiD06x5ZVd18UicBmruOy1y/yX5whL/k+sFFl1XuiDRuekNFYDOI0MM5E1rdKzdpkziGVnws117iRaDvuUClItBfT0jR5EIJaHGKlI5kWS9RNJh8HYDwB3p7IjlD076xw0cywaxThUvC6r7yFBg2t8762z4qXIFAqaDUZV4Ruk7oQusbZJ0ss4Ud4p7w3U5cMu9SzVzkyn+nE51xDUuWfoot929hrIrmuiP2tEhr/foMi+e9to5AajOr68qLa1ozcd1jaC7Ws9t5Q
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:03:28.5659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a73914-2d45-4a2a-8d26-08deff5aaf4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6361

On 20/08/2026 5:42 pm, Mark Brown wrote:
> On Thu, Aug 20, 2026 at 04:42:16PM +0100, Muhammad Usama Anjum wrote:
>> On 20/08/2026 4:38 pm, Mark Brown wrote:
> 
>>> Is tooling going to pick this up or should this be at the arm64/ level?
> 
>> Yes, it will be picked up. The top-level kselftest-merge target recursively
>> finds every file named config under tools/testing/selftests, so
>> arm64/mte/config is included.
> 
> That's good, though looking at the list we have requirements for
> CONFIG_SYSFS in other tests, probably some of the other stuff as well so
> we should either do something at the top level or decide we're going to
> do this independently for all the subdirectories.  Top level seems
> easier TBH.

I wanted to keep limited scope of this series. Hence was just looking
from mte's perspective which is narrow. You are right on putting one
config file for all of arm64. I'll run/look through all of arm64 to
see which more configs are needed and move the config file in top level. 

-- 
Thanks,
Usama

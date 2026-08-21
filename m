Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013049.outbound.protection.outlook.com [52.101.72.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B674756C4;
	Fri, 21 Aug 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.49
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309030; cv=fail; b=SP/e2sjZrPR26TEGDjPpKOb/7K39c1/aaBZpcXpb+Myd8gnwUKUAFURhoVxsCQ9wrfBPj+KRkz2kXmPKKrGhEnAbZeMxVnaTP9rdTJpyIaM1pIe+ry0hayE8OXllZflt3O8zw3rru4hr31GvTR16+0yvsJj27QYYjY+7ro3fU7g=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309030; c=relaxed/simple;
	bh=FRMaDmYpoo4LL6XdB2Ns48S8TMI4pa11yVQvFUzGIq0=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J5vJUiWMNxfLz5NeL30fU6RZWWYfERGVIQIPD9ZR5l2X+/lQrx0yr/j5D2cgodf/fyz9PFnxCcJgYw0ZJ9mTyGFanNKX4orianCqCGoTrw8Dp+97+c2FdvH7Yg3fy3bgvwtkzTQbrC66i6L54sL5d7x3bD7PNuuI12+KuZOskhw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sOkXRB/w; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sOkXRB/w; arc=fail smtp.client-ip=52.101.72.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sOkXRB/w";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sOkXRB/w"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QsMYnxnztxU9AXrBjriw38LTasuF/89qtt5uYnIEYvAHdj0BXmINyVL3yA/tVceuiniAqg3SXTkShBDtYUDGlRlx+Bejzp6v56udJJ0jMIjVBlcZIXj5SeHZBA/kCgzzxXvSzqRNRqaWjZA5ANKtMmeAzE9eN5O/oEwYSrcgC6LT+LrevtXvpVsKrtAVAQoRfp5gU+ApegN5NqcIA8Gaq6R25UxnWSCEhINs5c+mVMFC5saQ7sP2uTsrcI/br8UTIuhzF+iudo403jpjabCYotkCQJ30wHI9Ooq8Ut56+zVUxwXGujDcKxkMv0FkdyD73q3+SCVW3URb66QjM7sjjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhsGg55M5pWciEoheldJXTLWKPf8tEmhFOiiqExt29A=;
 b=jQMvOdOcxAtIZbHSrxbUV2WBVI8nrXWyXyYx+1Oyf38QutQTlAyGn61rUflettWrDHG5faiI3ka7SaHUdZ5WwagLGleHKnFerAXdI4MDdk4YPwDOUwDaaGEqS20tSw/wxYI2jmQ/+yUxXUShcqIARzWJtcNTf9ktgbs0K6JwrJyjRN7GqrE8QYeR872LZFkH8uXjBd6W6In5psfXz9d+OXsX4JakrkIXpdugaKxNnzZ6emZS/ABgds/Sqhxttdns6z+RIF2FUIcuKKxgNXP9dKk9wGcbgn7jHZ4TP23cdmm0to4fNYhX+dQcLhvZJ5XGmvmEJ/jpd6sUKm3221i8JA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhsGg55M5pWciEoheldJXTLWKPf8tEmhFOiiqExt29A=;
 b=sOkXRB/wghs2vf4FUbXDoftF1R/NG7ax43f2OI1yv1Ic8PbjsTKGgM43gmcL5PzQZk2DmfOJN2xOLDDEDbnuYFJUG9qd630emramnbBu9np3J6JL+CTHU5jJ1kGFTd7p/Z0Z/+UjaVfX4p/lCK8rHu1FGoLD/CX5J1EBguJzrcs=
Received: from AS4P192CA0053.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::17)
 by VI0PR08MB11685.eurprd08.prod.outlook.com (2603:10a6:800:316::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:43:38 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::5c) by AS4P192CA0053.outlook.office365.com
 (2603:10a6:20b:658::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 10:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 10:43:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoWwAZv1nJNK7qmncOC8Yda5TL2EeTNSq8a7X8h+IdPPyAEAHknejqco38c7Pm67zgq27Yjnz1/GCbtr/yLj38tOo4DO53lsuO+FqWs0joXE576tqwxGFHBfwNrckFMwasiEJ4qvk0brz0mpg/yvbJjnHwl0i8UBUKqyO6vYlOnS34ZaO1qt3SF6PwlRWO20XYqVfUPy5rhRNQ3voIZY59SHCXmZa7h1ZCZHsSZ5RETuPlWfIKRKU+Jutx85JFQIfWAbUTAVPXuIoWRYTu+xMxTCZiDnb3m9YDK8I+/6Iy1n9C3ixEUVSXHYP8DR86zl3K77qVJgXck1BA9mXgPGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhsGg55M5pWciEoheldJXTLWKPf8tEmhFOiiqExt29A=;
 b=rrl8KVyj5uyoL6yTpq/ahGtZA6iZNhkZj+CK6baWBA3nCwGnTg08XqgRCfYVOZWm0LZyQ7UG4VkV/if3XyrnWrIcchn77uqDjLTi86RcYUKKBoTyFI9ky4RZAuYvKKdF6NOjckjIxBHZuCZmpGThWeoUTApRo3xAh4K2e6ODRYaKmBvvgdoEhohVpURITfRUCjWh4rOkWZwSdr++SHnhXHOI9jjx0iVIflHNd8cHVJdGbDrse7i1NYaof4EOMSmGKWLCY0t9LrPU7RinoYd1e9NJ3TLXIRAI57fyt7U3+0O481o7fdPpLuBG3bLN56ypIeBUjJ8cV++B63dBxkuZOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhsGg55M5pWciEoheldJXTLWKPf8tEmhFOiiqExt29A=;
 b=sOkXRB/wghs2vf4FUbXDoftF1R/NG7ax43f2OI1yv1Ic8PbjsTKGgM43gmcL5PzQZk2DmfOJN2xOLDDEDbnuYFJUG9qd630emramnbBu9np3J6JL+CTHU5jJ1kGFTd7p/Z0Z/+UjaVfX4p/lCK8rHu1FGoLD/CX5J1EBguJzrcs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3410.eurprd08.prod.outlook.com (2603:10a6:208:df::33)
 by DU0PR08MB8206.eurprd08.prod.outlook.com (2603:10a6:10:3b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 10:43:04 +0000
Received: from AM0PR08MB3410.eurprd08.prod.outlook.com
 ([fe80::b6cc:973e:a807:c3d3]) by AM0PR08MB3410.eurprd08.prod.outlook.com
 ([fe80::b6cc:973e:a807:c3d3%6]) with mapi id 15.21.0339.007; Fri, 21 Aug 2026
 10:43:04 +0000
Message-ID: <94385fc5-a5f5-410f-87c4-471957e3ae26@arm.com>
Date: Fri, 21 Aug 2026 11:43:03 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>, Mark Brown <broonie@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com> <aogSkJxWf9QndjuE@arm.com>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <aogSkJxWf9QndjuE@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::16) To AM0PR08MB3410.eurprd08.prod.outlook.com
 (2603:10a6:208:df::33)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3410:EE_|DU0PR08MB8206:EE_|AMS1EPF00000048:EE_|VI0PR08MB11685:EE_
X-MS-Office365-Filtering-Correlation-Id: a38d1d16-8312-4e74-8f54-08deff710ee2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 yZxxU+YVwC1MN0Mlq5mXcClDtUf6Vd7Io4phtKFb+OnD79WCylTpVX7/Tp2KLQTh98IhzVlsDrZ32CoikvDNti467GmzDyoEh5RPu3PHJZZgN7c3k7tXuYfilR5GsdZoJWGKZ3JOB8+CLBzpr303M7P2ELn/Wz8uwdnvbc1SmVoFSkr7cNy9lw0aHxAKNU/JQD3SQ24oPAfE+voq8rRAd3KOG6AMCD0LX6bgqh0OZNOlyWZ7duYk/DmyPaBrVtBO+hMPKgu1SxTG50d6gNZEj4AhENPn3rISm7tRSfZ/br1QB8ei2cepIZWWhYe2O735ma+RISgjGWAxsxdYl3vpBpYvj4zaRxlFZqsGTI0aWwO0v2rDSj21y/5r8rL+uoyY9h0hM3iSP4KisYgWRT7UbTESpTfzqYj3Nrolr7IuEEpGi0Tjq/J366TKiaGKvX+1yznQS6LLgOuIZ2lN5+8l4Y+pt2y1J6z8qXVfH1yRwPUEfqmlwS9EZZ55wGAqN7tFv2LAlklAJJ6XNM5VqI/CKuyJEA7NpuUanzKCnGX4OF2fqFBN6d6VKoHpvOITOj3CFPk/oF/6xxCXadX/EFNS764D1WtyAao2P1AWVjedu71Mv5770ZHG0zGAnQLXOEAev45yP3Wb96GkwXpU9h4PpYTMUySt4cl9AdKpGz21Jbw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 bQpCXB3tRDEMYMjrRrEpys1G18+e398Y49p1LvEQyN4vlq8oK7AwjX1i/ZOqI6MAfVOzgio8GqYf95hCkFXNj7pg/7QmPS2899yU6xrU3eDCn65aXRolyMErD/JGTEVTddku0yvj06Rg1gxPAVXZS9zahN4v1sF/6Rqz2c+VEriHe9TLmj2dyhm70VXaMwZC0hlxWd6UpmMv3SbljMY66If+4fYWTFfsIaWaZn2ukVit8EgSRDPJzCWmBgfRGccG3oyS6Ly5VXSUeYUV0APcNbvjsVz+yabC0+FYt+9RRE1K27vjf8FZgYeIPdo0rDFBGgI3ZGDLH6oxkUvGUVG8OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8206
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7532d13-ee78-4014-c1dd-08deff70faf3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|36860700016|23010399003|14060799003|82310400026|1800799024|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hu4sveUOIl8kXEOwOBy8StAv/K5vjgQ5zXYgEWN2dqjccJCcXE/Lg0ukMN/3b1nD64HgftEgNthmZScUtoK9CbQTypgCoLuN6nPA4jOExwkA2LDhk5rGzAoOnui3smY+mdpt9gpAk25vTyMz/KPJUw7jpL2Wkw0NSyafyBTwGyStwpzehUDrwqg+TUzqt4cJXqKXx8U0XRpxS/H2AAZJO5K+8LA31OLbU50JbOToi1IARlDV4EW3DOu7ACtYcj3OrCi4ykjttNSCD8vTDfmWyuVwUF85Iijr/XjLk7D0WBNWGx9fSHQm/qkO04aPLv+yv84pJ/ADwGs1JoSBxSP4rFR0z3sMBEiOfeXsTDWwjRFO28XYu1LIiCiuJdHAfe/WirRGKIf+cTaviPRFwBsj/s8k2BzArkiPf6QvJLR0tZemcys+JtKWXVAi1atp9gAimPNdsnd0X9rLCqJ0xVvpm7OqsncJUXTKYbkGlGMcdh4SMBeBBKs41qXlN06rTr3HSr9RegSCsM+moVM6fpNKNexvmiCb3R9DDfQtGFByK91i+Wcs5e17LQ3cdnjxO2tu+n1fnAdZ2uWuFJR7dhBajR7EfbKh+VxTiXnZIXVxUv+RTUe+7jO1vIXILvmUpIzg7gsOQ0aBZOh56GGauplPo2KrMsBK2+XxJ2dZmrhp5SeaOrmGevdLpMyoaSNlYCRRnHN6x08s7jjCc4jdEf1wKg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700016)(23010399003)(14060799003)(82310400026)(1800799024)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WtXydiqliHuistm6Bf73UysRLPmyNUwpz/zD0sf9LJaESEyNoW8wHL9It55B+QFee6T6+26w/UjNHUbjNbsS/DbHP32r2kQS8qrVm3SYsM9KHZ636nUfkVpYwlFMSbFnhInhXFlB/6BsrWQeLt17YZBmhvz/bJsGLX1O9zjUdiiK0qRfCLkIbonk6xwFEEIIXKm7M+jDHq6BlkBIns5qOLPVWFm9CWmLCYOpyf1yp4IG19nw7GBPLTNCw/d5UyJwtwIOZnbehXiSbKuVbTxckcDTSsYr/vMiabIibKs7GQhG3BTZHul0feomT00s7h1PCn2d5+nnIvOtjOhxATCES3zr7rwC2wCR0xDx3NdeqNR8Xo+2BfAZgbwhn22JpKxYHEwv+0MSCyoyFHpzw7gmXvdqAR+kkSGeqzLlAwTSlSmp0eGPsk0g00lremX/rnE8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:43:37.8189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a38d1d16-8312-4e74-8f54-08deff710ee2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11685

On 21/08/2026 9:55 am, Catalin Marinas wrote:
> On Thu, Aug 20, 2026 at 04:33:26PM +0100, Muhammad Usama Anjum wrote:
>> The arm64 selftest collection has no Kconfig fragment, so kernels built
>> with the selftest requirements are not guaranteed to provide the support
>> used by the MTE tests.
>>
>> Add a fragment covering the userspace MTE and tagged-address ABIs, KSM
>> and its sysfs interface, explicit HugeTLB mappings and their proc/sysctl
>> interfaces, and tmpfs-backed file mappings.
>>
>> Do not request NUMA solely for the optional KSM merge_across_nodes.
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>> ---
>>  tools/testing/selftests/arm64/mte/config | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>  create mode 100644 tools/testing/selftests/arm64/mte/config
>>
>> diff --git a/tools/testing/selftests/arm64/mte/config b/tools/testing/selftests/arm64/mte/config
>> new file mode 100644
>> index 0000000000000..8587ce70c294a
>> --- /dev/null
>> +++ b/tools/testing/selftests/arm64/mte/config
>> @@ -0,0 +1,8 @@
>> +CONFIG_ARM64_MTE=y
>> +CONFIG_ARM64_TAGGED_ADDR_ABI=y
>> +CONFIG_HUGETLBFS=y
>> +CONFIG_KSM=y
>> +CONFIG_PROC_FS=y
>> +CONFIG_SYSCTL=y
> 
> You may want CONFIG_PROC_SYSCTL.

CONFIG_PROC_SYSCTL no longer exists on the linux-next base used for this
series. It was removed by commit 8d75c338f0bce ("sysctl: remove
CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL"), so CONFIG_SYSCTL is
the corresponding requirement in this tree.

> 
>> +CONFIG_SYSFS=y
>> +CONFIG_TMPFS=y
> 
> These are all covered by defconfig. Are these fragments still necessary?
> Or are they supposed to work on custom configs? If the latter EXPERT may
> be set, hence the PROC_SYSCTL above. You probably also need SHMEM.

The entries were added based on the interfaces exercised by the tests,
rather than only on gaps in arm64 defconfig. The intention was for the
fragment to supply the MTE test requirements when kselftest-merge is used
with a custom configuration.

CONFIG_EXPERT selects DEBUG_KERNEL and exposes many unrelated configuration
options, so the fragment should enable only the concrete options required by
the tests.

-- 
Thanks,
Usama

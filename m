Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066E3E8C74;
	Wed,  9 Sep 2026 20:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.13
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985579; cv=fail; b=rJ3bi6m1bkEhA81/EDb9j+5qUSx47CUxznF2lqZ/aGh5j09h8Z7EQPt0efPz2yYOvCTHcHsOnzsyq2R39j+p7+tLL9tDT4AEN4m5EEY9btm0/h5QS38HBpHtRGv8fwCUzP1C7WT27wdyQQNtLukZr42dH2BZvck70iTMEmo7V8U=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985579; c=relaxed/simple;
	bh=qmIFnkK6GYjtvNHq6E5svViOidceqBga62ZUtk9f4bM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uphDCnfqazAIGri11SewW7Pn9SE/a3beNEsawi8H6O2aFnutTvMmLuqCW1IvmvZ33SvLwVD/heqALlCTpZJ5/Mb/WrvgdkURWBc1WaQQ3FOmyB58v1liCrON2oDcwM8hOchwM6NNAdd4PWkDp7tcU1WXplxVuXh3VXEp/FYlRyw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fCLOdNqd; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fCLOdNqd; arc=fail smtp.client-ip=52.101.83.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fCLOdNqd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fCLOdNqd"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EK9s1y36hqr47ZB5+73y3AZjo/i+77DIANipqrgXpjFieNw89MB8P/ma2AoQp3pYbbKPJ7VKrPao6EYqZlXRI2TIikG7FmhlJ5FsF3+jsAQGcyv3rpeQx0pip5bg6bs48A/wphYy0zbSyIQICJhhHGFEkLS/tYGr/nUMLmivV+toLvFjp70jM1P6Oexu/QkUv40eD4dbid+mcz6Y2wQMeKWUtdL4V66aoyBAfKKAqxBTzXfb1YIzLssZFqeMS0diEHh8Oe59tbE3iXHeDq5fKy7Pbah8Y8PFwzn6wblbyrdqAaFJerd1SkqGnBVRPxeff10pfSw+4DL2h0AcJnZsXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox1dnxGjFlOBWEeW59tfcWyGBH3ddPV+1cbdkMdGQo4=;
 b=BBIGWqcgmtMbUOuHKkQ1BJ7rtqtFsJv6V28Cn2uAse+EPkY0iZWuRtiygC/CzTIVTu+fWyU1I0dBcfdTr67EIOgUtRdUmBNo2fuFO9zBRk1eDNSuoN6raFdEl2zJTbtDlYy/6NYYBXezn56Fd8lgP9GAYDLv6IPvzn0sJpwGS+jtB3YszpPLIeJgCXHnjW5Goq+hazKla03cEaIf5qtbMN/IhwHigf1S6U6mEITK3uYqGgfqLuEJ3N3z65zTJhmI9HX3QeIl6AB5svPj+zXE4HWLsGnT4BdNq5402ShrjVU0R8O6WWeuqlTPw+eWBGkt371VGo5Sl3sZjybG/oyUYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox1dnxGjFlOBWEeW59tfcWyGBH3ddPV+1cbdkMdGQo4=;
 b=fCLOdNqdyzNkOiynKvlUHRoOizYWePuc4f0sbrQEYWuNPyDMJSSXA7oTut8JLs9L4O40CiuOElGNdNlxW9rMLtcGK9a0L3tSiyk7XHilKbGrFeycaKDK/UDhuu7U9nigByj0JCgxzfB1PP30wXUACoHN9aX9mKpDqFvn16r7AlI=
Received: from AM9P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::15)
 by VI0PR08MB10797.eurprd08.prod.outlook.com (2603:10a6:800:212::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 20:26:07 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::3b) by AM9P250CA0010.outlook.office365.com
 (2603:10a6:20b:21c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Wed, 9
 Sep 2026 20:26:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Wed, 9 Sep 2026 20:26:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ME/OfdVUkyoR4NWVk/cIks821O6G63EhYXWRWZ0EgZTlGFsy9LiXuhGv8CunRN/xm3zkuitZBgjzOcDD+b+plTOvPLb1p6R7Lzj/UXZ8vDxGNjIk0cLnDIZ/7mSi9v28pNvOpklVgrnc/6HEHQ97LUuhoL/drrO6e6D4fzVJeoAmqzPUAymrtvzI3/TmvKnDfQtI6r5W8G3vLyo8SNMBtNDsKYvoN5ch5p0UCLOorqVfVEDEkHxw8Ly/fPI0bqbJDzTchOFXK5aHvSiaijst6y7gBw3/EWeX1VmgzXn6uRmyJI2p4MleQ4RogWJjXYpni3PS0cRz6SHNfwCsk1lGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox1dnxGjFlOBWEeW59tfcWyGBH3ddPV+1cbdkMdGQo4=;
 b=vpGQ2feFz1U569cgofg/Dzqo7ElIyq8XzP3wRj1Ry5HLoHoO37vvIKl886B0otkU3Y0wXGWAMAFelBGBLo3/Zzcq94Fr5IWApDsNu6lO3atAO46jAVubllDUXSyXh4cVcwftx3Ja5ZsLjwgNknmfn7h3ULOlSKDauvqEgy+h6/iPbOsBG0ME0Te/OHbtTFUqLWrXBzv3BkBmXMNmXHdzPriqKGVEf8VCVbgcCUsfDThrsR2aQWCgd4UvCUmJdDHLF6G6egxRkEE5chFYJzZA4mFdgxATQRZ/Lyivz9TEgAjl8gGOpnVGiBWXFI1Rk6XzPRCB1FUyQUmrExInuo49pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox1dnxGjFlOBWEeW59tfcWyGBH3ddPV+1cbdkMdGQo4=;
 b=fCLOdNqdyzNkOiynKvlUHRoOizYWePuc4f0sbrQEYWuNPyDMJSSXA7oTut8JLs9L4O40CiuOElGNdNlxW9rMLtcGK9a0L3tSiyk7XHilKbGrFeycaKDK/UDhuu7U9nigByj0JCgxzfB1PP30wXUACoHN9aX9mKpDqFvn16r7AlI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by GV1PR08MB10533.eurprd08.prod.outlook.com (2603:10a6:150:162::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 20:25:31 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%6]) with mapi id 15.21.0428.004; Wed, 9 Sep 2026
 20:25:30 +0000
Message-ID: <19ee1440-e140-4f1e-bc39-9d2cccfa9c78@arm.com>
Date: Wed, 9 Sep 2026 15:25:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "shuah@kernel.org" <shuah@kernel.org>, "mingo@redhat.com"
 <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "tglx@kernel.org" <tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
References: <20260707191136.1732277-1-bill.roberts@arm.com>
 <20260707191136.1732277-2-bill.roberts@arm.com>
 <440cdd41a203589b31e287378de146e18e620176.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@arm.com>
In-Reply-To: <440cdd41a203589b31e287378de146e18e620176.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0224.namprd04.prod.outlook.com
 (2603:10b6:806:127::19) To PAWPR08MB9829.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB9829:EE_|GV1PR08MB10533:EE_|AM4PEPF00027A68:EE_|VI0PR08MB10797:EE_
X-MS-Office365-Filtering-Correlation-Id: 7decb926-0c96-4cc3-a2c3-08df0eb0939c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 M3r5k+PRKYu1mP3/iiAEqKdH5tRCh6avXdKl2pss6N79aXsnxXv7NjXGPI2ffkamyKDqUmIiV4yc/3rC//qup1oGIbQyRkS3361Qdwny9dj/c38PZCozjMFeRGZYZGE+IXUCRkMVM5v10Bf0mtuFqM00xpJ08m/OaNcwtMPl/g/bDM2ug5CnXGaFhPhR3gtBSqTTutz6woXUV57ezfQWLCPYUwPFsM9/IKYdh1rWTye2vqHBCGMCl8wKe2B95pMecY8L3i5R3nUJBBOnmIkJ27P/MUgrLOSsg73aSpcjrtJCQ8U0XezjfD147ONRjvhMFhVvNvqIo9eQEUlHS42s1JqDQ9u9QIqa9BumY6S2Ea1jaMGx6WtnPGC8CjDZX4ViBjGoY6DDf4Qozq09LRkWK7MXpS64ldZU6xG2UljvJirpUPVQANGVMstlBUKyMKGt5nVHVTFwfKuYUiF5g9CMggl7xhDdcckegTgtZkhvZQbN8lTBa8MwkUQw4kAdhcWJ1717EdGYsIx291H0wnSxaln1H5KDuk4r3g4/NpAWz7A6AOcnVyCk0n4qT0oEgVptJ9CzbDji53AFsc211rY5coU5UPJdSG9Xmo0qFlUnCvot5JPRJKLuLIjjC3JJvQID3RM/lj6RVpQSXTRTHj1OTp1GfPSiBNwjQcG+4G3uUpg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 T7dcvhj0r0DSH6A9UBMiWaaT1GISnkAg201RMMzQLWQ7d23qV7G/GTrCyEXnfDaca7AIn0euqr4ap0wUGK7za5YVzCK1RHaxn+pJarWf31zExPGo2EckBedu1Dr6zeIjgh4Bt0pAL49X0S08NxLTguBpPa4vfwygwOxKHyVl19MAaLz0vxg2ABscEYBah+cLaD79Lvzf21YF+ZiRCz83LrqLjnqbwlcvmqZk4vJLSCSRtPVcz3Y8EHeore/oGIf4E3M7+Hgefb1jsyBhsbAdiSI3DpN5cVnlwl2N1/sEj6XvWnKMtvvso68It1tv6QX8p49ZD/5Dh/fIm1Y/ODPxmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10533
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2876266-7411-4cba-bca4-08df0eb07e31
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|376014|23010399003|1800799024|7416014|82310400026|35042699022|56012099006|11063799006|4143699003|10067099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vjulkiC5/DnyyAj41fSyJVlSG39apFlTeIPR0zbifiLQ1MTSGxV+UeQKIKQxvfeATJHc65FXlE2LuZNy84pfKep2/ziJwo2+EBjqZXjLQckcaOnPU6bYuYB+5dRYHdRJfbTBE/R3rGDwFDjAvTYKzmg9rmAm9PYdRwoVWCQhakGNkbm+/FW2OkgwJMAy83T9LL82egupQvO/Yv1lqt0XrrQ5GXvEcdfJRt+1F7yUbcTaXWoLP1kjRq6dDbZ81BeND6ZK8vW4LsX0m176Z64Db6yYizapwV7goe8x/sPKMUfTOSc2tQSOE2w3h4HlANG5O7LTKqiSEBI6S87JxU4025+TD63LwsG19hf/t8ipQz1he0zYsIyIs0wTtdl4QrUrk4Il/XAdxi0XeeEUiBEBcX3yvbf6gyA/4FDTxt1OnQ5aCtGO3LrY2d4k9d0lnor3heNnBgML3ws4w0wXHZI+gEY+/7CZjuc24uUfsQCmrclXyVnQ0BdcjbfVOpt8gOhIReNqyAnA7FR8gqpOua6IOazBr9eYe6RnW/8XnVDpA6NcUNDK3nyhjIS72N5ZRui7BjR16dEyHFgSv3cjZ9WKULCNvqHdSL3ByINzhpX5K3kmtqQo6BJRz0PLD4p1JVnpZ+MBEFYhozK3hdIVFsK8Ipg/FciV199WGJmoUiV5K3psCDquVDkM4whmj+9hQnZvV63dGP3V8AKn802nu6Dlpg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(376014)(23010399003)(1800799024)(7416014)(82310400026)(35042699022)(56012099006)(11063799006)(4143699003)(10067099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zXAqHrHyRn01YuxRAaMlYrKMge0PpkUnFsGsup54+TkAQ9k8iwfkYhWbsD6XUHIWWcxoxQhpaMk9J9j/e5I1fb/2lPiD+fIfMZixgeGZaaXo99frYhRpt+TPnBdGzFEhIHaFExHaUSycP5nRtibDbGLpR87l3T6RPVdyzvN1WoWxJX2N2P2sTuWX0D8oe/xQyy45HYiYti76TIbfizfUiE/b8u9NYN4KdBqMyzxZF/svDRjAhgAlLwQ5SdCMl3RLRruoN08BzAZq6DkHaOUvcUK258QAb4SxT2PtJgifeHEV8iNRiMRtAVTv7zmmjFuJYbbO4sQEKr/PL/Xua1GHwhqTb46SIVy0oJXmVDoLNjvFIZvKLSyVM+Gr2ok6Sv+qKatFSpVpU80IZR/V/XQw0EAwSElYqpGsATKJxH4Yf6X+umKAJbavE350VHbmmNnd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 20:26:06.2510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7decb926-0c96-4cc3-a2c3-08df0eb0939c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10797


On 8/27/26 6:32 PM, Edgecombe, Rick P wrote:
> On Tue, 2026-07-07 at 14:11 -0500, Bill Roberts wrote:
>> Test that ARCH_SHSTK_UNLOCK can't be called from normal (non-ptrace)
>> context.
>>
>> Signed-off-by: Bill Roberts <bill.roberts@arm.com>
>> ---
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Bump, I don't see these acked/staged anywhere.

Links in case you need the patches handy:

1. 
https://lore.kernel.org/all/d223c3e24650c3d29f162bb7faaac74ccb7bf65a.camel@intel.com/
2. 
https://lore.kernel.org/all/440cdd41a203589b31e287378de146e18e620176.camel@intel.com/


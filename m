Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003EF2DF68;
	Tue, 19 May 2026 04:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779165981; cv=fail; b=Sn2El5A5XOoemUcLiFQOL7UHPRgpYl4kZber5gE9jq/jH2PpqcglcUeg2BvtuWBdlSkYdykiMMWc9fdumOKbAYzIjbeFRdslk0xTeVoZI3bth2ZU2EEbrQJzYuNFMFUArB8hBlOmjTwf7pd6qm1x0nm1r/jplzA0BhGFeuoBtSg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779165981; c=relaxed/simple;
	bh=LjeJHTQFv35oEhzGx0Cpb2+Wxf9yY/GIkK1gMuL/a1w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rWbi1/alxlK33NMjWN2+blQOa1tYaCmfhS1Yt4wh1Ud3U5LnV1Ed1qOU6a/jWmCE4eq0YH8sxt9fDkmDJtQo2vl3poAtLulJ4D/ZiEY8hNlrjXGjuKj0wgmmSe7ICOhl3pknW5Sq/3IW3A7zdi82/fZ3iERsub6YBwLAx/ExDMM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mF8CzTp6; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mF8CzTp6; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mF8CzTp6";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mF8CzTp6"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ebCk5uLvdz80wJd10fkq4Ef/eO+9hVzURkDXouiHXc3V49LsswTXsX/HgvoJRAod+LbepjI65LX1H4BfHqOUYDrn/rJgeLY71akPAAGa3BbL05IgF8H0CyKMn6iKFVRtXphiGuvoLc1p78bsolfGQo+Ja/iy3mfxe6ZG5lpG6qELOAn9lEAgHgCi1VjsaMzP7NhbZ1S/fKLCzhmtheOPWUC/WqaE0iCiF1pDfbUI4ONFOBhoUGYGARAfiY70lZDP2fHtPXnrsCXVwTd/5is42v4tEJrCshoSA6yzbS/0r1VjYhkAcAyuH9oSzI70bE3cWz2CPRhLdzOLkbYD0kRXDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I16up0kS1xs06pmWzlF+rPgp1WV1RMbhkYAvYkRxsUA=;
 b=ZR6U/YCyolx9pGmAGSFknIFi3Xpem1jWzqU2AcBmCaqUMEP5ytnwHf5zNep/26wbhJ/SHbPSyulvEf7++Krr+ijkqeQU8PXP50WHltwx0eakO0M4TY4Ps2uNtUm6gRi/00qyOnKfPbg3uaAUNvX9pdtycX/4r/VFioQEGvuL4jYLT7jcdk2bcFJmjejvagnKUYXUm4QE8nsx58cAc+pjPJudK1q5Vq7Hi9IpI5WbiPe0+Y+irXx/vRPpzPiZS05+olzGyicKWfwkPHhaLDfqlwfuqy2vnYF/qeQUEYbdoXr7XkrHkgsLKG0NfH4yM+LacPnUuxyfzzMJuWnIWNvIMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I16up0kS1xs06pmWzlF+rPgp1WV1RMbhkYAvYkRxsUA=;
 b=mF8CzTp6PpkdJQhEoZzuJ3xTiPc4gdF6r/vjI7notygl4HkHeQBy3/9a+IQVT8P0k5eqCy0604Qee3x8QmPW35k3UbkLVWoXnGqp02IySTbLgO5ibA1KQj8fyWWxmOMIcoAiYweiABBrjjriMMoIIq2iE91tF9W4aKoeh2lv7MM=
Received: from AS4PR09CA0005.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::11)
 by VI0PR08MB11451.eurprd08.prod.outlook.com (2603:10a6:800:2fd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 04:46:14 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::9f) by AS4PR09CA0005.outlook.office365.com
 (2603:10a6:20b:5e0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 04:46:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Tue, 19 May 2026 04:46:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUC/S9EymvpjLg+1w4lIyK0sD4wupMN0H2yVEcu4fbM+6c6NkbaBNMIkVWymrT1nSmAvp4JY9q5kiA4vBtD3xqy7Sbump2DFgUcnQ78MItmYV7C40x6AIt8L53jfZZ7Rhncp0BtAWxGiS3yiRp60RJyUNsAAgnWYFPSxUYpQrGfgQZ+gXFaOAU79Yf3kISIUPhrO8ysQEaGg0XEixRRpi6la9wHOYBdV46XWRwlh7sjY91mHETPBe/hSquDUFw+LPE6vmzrUEDOk4g1mGi5VpmVMmWhOS/i0CZv7pQCMLNiw5WbBWXohdseJwFvEkHB9JbtbYu7wrrQdsZrd0CoaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I16up0kS1xs06pmWzlF+rPgp1WV1RMbhkYAvYkRxsUA=;
 b=mhD3Yn4KIJs+MIfmVWk8b+4JcdCfF5xry9lWVHaTYD++EKIcwxRngDGNFjr7ssZB/60ct+d3ahw4QcsS0cr7D2xhXtWUILoWVRbjYYz334P6AR3SYnyQXlkWt2FArKK+/YuGaIaTLpNUAIirg7gjlFNCyDOuAQnipvtco31Fyds7grMlLSi8y/9i/qDaX9H2qRB6qVuGryI8kP/33aMNK0DIt+YOo2z6sGU7jbUYkE3YCXvynADxCekJujV8vi2HwBHjghFPKStaQRD1ZarrBV3Qbia522H8f8jIkHTqYLZiW70YPrJzkIb2k2FGc9/LsCW2WSfDrT97ErH5jiovoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I16up0kS1xs06pmWzlF+rPgp1WV1RMbhkYAvYkRxsUA=;
 b=mF8CzTp6PpkdJQhEoZzuJ3xTiPc4gdF6r/vjI7notygl4HkHeQBy3/9a+IQVT8P0k5eqCy0604Qee3x8QmPW35k3UbkLVWoXnGqp02IySTbLgO5ibA1KQj8fyWWxmOMIcoAiYweiABBrjjriMMoIIq2iE91tF9W4aKoeh2lv7MM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV2PR08MB9207.eurprd08.prod.outlook.com (2603:10a6:150:d9::5)
 by DB3PR08MB9110.eurprd08.prod.outlook.com (2603:10a6:10:428::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 04:45:10 +0000
Received: from GV2PR08MB9207.eurprd08.prod.outlook.com
 ([fe80::2b02:74d1:3b86:99a]) by GV2PR08MB9207.eurprd08.prod.outlook.com
 ([fe80::2b02:74d1:3b86:99a%5]) with mapi id 15.21.0025.020; Tue, 19 May 2026
 04:45:09 +0000
Message-ID: <e4a3bf00-2b9d-4656-89ef-0144700e32cc@arm.com>
Date: Tue, 19 May 2026 10:15:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/mm: rewrite gup_test as a standalone
 harness-based selftest
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515084840.174652-1-sarthak.sharma@arm.com>
 <20260515084840.174652-3-sarthak.sharma@arm.com>
 <4f158e11-a7a7-44ae-ad6d-e381bee72b6c@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <4f158e11-a7a7-44ae-ad6d-e381bee72b6c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::7) To GV2PR08MB9207.eurprd08.prod.outlook.com
 (2603:10a6:150:d9::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV2PR08MB9207:EE_|DB3PR08MB9110:EE_|AMS0EPF000001AC:EE_|VI0PR08MB11451:EE_
X-MS-Office365-Filtering-Correlation-Id: 597121bf-80a1-4f9e-4cc3-08deb5618e64
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|18002099003|56012099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 cbgPNjg3Pwd1Lsxr9++ivDjIBcX38qHvS/SVzKsYeurmlGAn7FtAt7nrXvRl05Y6VTwTk97ihhPEQJRbLKmwKz1VIWD9hq+NC3w/FQ6tz+PFPsxezd9GYvvMGxbpz4J1+Z91geI5E6nWMmnD06iMQ6HAdTTXzNN4EuVWC8ooHc5kV3iB4pGiGYrAjldBPCCyQ4lZplh8CCPTa+ztD+fl79UEcYVljXLY1VXFP0ZNfEZwoMOxzGM/TKtIBjTeJfAkbDhJp7x3AfYwmS1h+dLWR7IAdKqzSNwnD9EQu1SSUvtTrA+1ypUCeueR5eBFFl/Bi3VmtgH4Ig0jPsnu/puvosF1SAaiMTW65MiWk/RRr3qHUdhrYVUTg2ZYlg4hqhZtXLmoUUSqcjazVeeCM5lHPpPNzuZuQUEGggbdiIburS5bRIr42aIUSBNrhUgZJ5hajLs60XW73T13IJG+2988sndZ84sSbdYlG+jWFWgKVRAZ3sQvnsHZn6t7b+Jbw+M/dU6bsHbJ40cMhx/Q5Edb3XBeunRyJ8wUwK5+Obc6MHPy/tlNWyNAYAitXJ9HiVb16kAnd81J5QQU1D6KLPNcx2RZEdLimGlwXubiO6AT9E9/BpusAU7IyuTgJXF1R28bOBPo7Vy7TQYtjO+HGCAaAIAx6VYiBU8JncJN46ilSCVOIupKHtAuxU/VR4zxwUeZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB9207.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 p5QU0O4eRE5fCyF891b+lFxhz2v1Ggh1dDuz5CdWP1o1D6Tz8Rv3FYZyraNTt5cLmxtHnBmPuUTViWR4IdpMm3YtxHXdbx+7LkasbR4ZojLuemD2v4wbh9SWmE6X958fsU/GmunFL3PS0IEVZfdc0A9yO7Eh6w5Yhlo2TsSPXefh4aT3Rm+0IPMXtXS/iCL+umpMsXD8SQNuunCaGAXBY3nmuLMzX0i5f1V9844oq+uhtBDKXAAxTXv/X4EYfpX0vc4LLsObDif05dX3GlF8ZWjKl64OSHe5khkntwzB8dVci0m5zaS61RLqIVRvVbpW+P5g8Mb8DpslQzICWMjgtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9110
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	78270619-88c4-43e8-e41d-08deb561677b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|35042699022|36860700016|82310400026|14060799003|56012099003|18002099003|22082099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	7JaJPcNGXRHqaEyGA+NNFSP8ajWdWajXCNEAiLnsWrXoJpJQvf4p3B83zW1JNGuba7Ka6C0aViNcePLtDUm59lwloNuUWQUgA0diLFsZUSBns+RoKWX9ysNgVj8I2Ty0D7wOAcNU7LFM8WJQm0MIQNCLdKGAdov6JYVuLaSQxJf0IMGCK9ZCLszLG9/NbG1HjnvBe08Zu2fVMxSdImfcD+NOkCFTymmnrC0y2PM5GiURrQ5DOVCLFOAsheQrnDRydIkLqrxKfrgBp3JWkAe6HHoBG2wURDFFu+A5gVQmAeCI41e4lgkkdR8eLxb5JSCxq2uCOS4+HXXTBMN9fdJeV78DIpAjURkRdMkh8hMYDiiqYb2XdhmoWMAoihvz18uJMla17Bu+WIVI0LDOWmZQPllAWL0Qiq0IyUWRheyQCwz2O4Ikt+oeJA2BF1ytY/CU0y7VEVYTJxTdKWLxWKonj9rU+scqf6tr4+0G+1IA64R6+AQxw0MODEnduRcryKI5o8qDujOpK5tL1AIwU4aLA/+j82UkDjZVBxW1gDndS+FBUTt5tdBYo3+ef1r8g6BM1pDCvdr1y+4w9ZAuFMEC0diVAKwO+pcBopBzwAzSu9qFylDNId7iUdlK3S5BYGdxnt92m6paB0mmdVqVmEeHSfv5M1Oaz+LgvXzv3HVJtNrx7URAMG3NQQjNEq9ql1r6+w4e+d0LDHpTrJdg9r1AmyVRoLC8yBbS190BRnJ+t98=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(35042699022)(36860700016)(82310400026)(14060799003)(56012099003)(18002099003)(22082099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RlaFKuLqGPrpXBWDpbMJlCfvpvqH0XFCkJp6AKs2xIZK59M1+t2i00cxyWMUVyi0V86FY0+sQQDyjjt6kCEm+x9qCJBh7GI6IAhfIlfPdc99V6ruOy9LV8exReUMs7w5pKN3CsUjawDDlumaNsW7/O9vCs2p8gXpv9/z5qIBRyqzgBcRUZWIxRjLk2E2PxvcrJuex11SyWRisyuj9265MxqP5XQowffKov4/yuM4OvVK0713rLyE0ua3EdkN5PtercMB+iKeKL8LOXqvGDk2EvlsB5plGyVi8U6YXZKRU4dIIybnbSdM7kgrlgdeV9ABE3mN8TKe06zC27a9DJcvMsILBpz6zkHN5QTvaJ3ZLEM7Zp+qFXNzixi4F7bZmz06t3f8FriszK2EWO46G5WS3xpnxJVHAzeQXbvRA3VOIjkzCVBZ/Q4SZjALqvz/sDyk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 04:46:13.7700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 597121bf-80a1-4f9e-4cc3-08deb5618e64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11451

Hi David!

On 5/18/26 9:10 PM, David Hildenbrand (Arm) wrote:
> On 5/15/26 10:48, Sarthak Sharma wrote:
>> Rewrite gup_test.c using kselftest_harness.h. The new test uses
>> FIXTURE_VARIANT to cover seven configurations (private/shared,
>> read/write, THP, hugetlb) and runs four test cases per variant
>> (GUP_BASIC_TEST, PIN_BASIC_TEST, DUMP_USER_PAGES_TEST with get and
>> pin), giving 28 TAP-reported cases in total without requiring any
>> command-line arguments.
>>
>> Update run_vmtests.sh: remove run_gup_matrix() and the multiple flagged
>> invocations of gup_test, replacing them with a single unconditional
>> invocation. Benchmark functionality is handled by tools/mm/gup_bench
>> introduced in the previous patch.
>>
> 
> Thanks for working on this!
> 
> Compared to the old test (e.g., matrix) are we now performing less tests? What's
> the runtime of the new test?

Yes, in the current version we are not covering pin-longterm, gup-fast,
and pin-fast tests. However, after going through Sashiko's review, I
realized these can be added as well since they exercise separate code paths.

I'll also restore the coverage for all page counts similar to
run_gup_matrix() and send a v2.

> 
> Would be good to incorporate that information in the patch description.

Sure, I'll add that.



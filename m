Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9B31355C;
	Wed, 12 Aug 2026 05:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786512962; cv=fail; b=XE9V3oe4qk1311nCooMSd4oNgmB3IHe2p6/yWZ2a1QTuKKHxzaTu+/X7gU8fs0gznRA/t1vqnws0kD9GW9JvrZortuJcFwwwqBUQsJOWnrJ09sgQfm24ZJIfC4CteYVDixEDqV2KGTklVletaMiUJUq+vXREmB7FHfYhg2rl8BI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786512962; c=relaxed/simple;
	bh=SvSniyGISCpHidNUa5XauH5N93vY9rQMy4rDNFqihmY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XDXCmJyMtt7q+qfYuuq4X33ckUkdsp7Dl/VxT9JC15d+pkOkU9Q8EYWYIZgjkyE/5rvLZrBtU12BrMNuQ4L9aDQpBYQXd+1e23pZWoc1gnW5lEE1C1g7Oaxtsgwvf931qCvRgD/Q+uZatc5SS4bf4QLoVWixgTWlgA3RXjJu5Jw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GLwwzmkM; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GLwwzmkM; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GLwwzmkM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GLwwzmkM"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WUVK98Gz8JDexSMDkPV793ya2HIT3i8nbFbOIpUotceqe9RKa4EdwGlVg1zUeMxle2P+ZGStWNA5fFmYsaVvr3FFjjXL+PPZm4/t7dPhnW+I4pCHZWxfAFs+V2nzRzH98fW2rWEkLqYdav/kuwvf9BANwIAU3MgbDRIABZ7171M9iGBfFKBY/mPxnmZ/nnAac6IQ38fOFEKr1MsJQv1pOeNl0xTuI3kWXuBrC1m0IgGNjxGdBtxVaRgtxK6rdxg0p74Edhn++jsUPhv+maC6z15y9KxgrPmMY19cRROpP0z8BqD1AhBLCcSGcBSA2XDGHpqKu6/g41fe39fLebZwkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlidU8puFBodwuJvyJaBj0gilBCPJI/rAdjKP2RePvQ=;
 b=wpCV7Wupizy7gqlvT6c6fd6Jl9gtulAqRXL3fUoU7mkipttdTSkxchQH1f8H4qQmYylP4mi8cdaUXmxontjTMPjGkHk8gSfntT7xcTyEv1HUMlkahY3S1cxsmaKYqROWr6xMYD0BU1FDMCeAssG1Ek3jMIYSkFP/UFw03SxhovkoWXa3gP/+o0j65ZGaJExE0mv+HAJaXAMYDnh46PMQg6FgZ0yRx8H6qSRtGxkwehDSpH3dyqg4Mj7nJLd4SFAfw6uzK/tfgCUt33uA7fMnuAaJjX8O3yIl8/Y5jj/jDIzQJB7So4noHRDYAQbk7xvD4UOoXf0YXx2ygHhAiRWdug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlidU8puFBodwuJvyJaBj0gilBCPJI/rAdjKP2RePvQ=;
 b=GLwwzmkMWWfhK8S3MywvYJPPoBuYwKmXuourZegUOVnr4FMvl3h5HdiifVZeO7W+mSig1rqx/WQJfrQlnt7Ou7s59mpwx1lnMHa2smcld3aKGPrS5jCqvgYb+Q22EeHBopS4wSBubon41uIR0WY3XTVpNYzDa+1qsAFpyWJ2oW4=
Received: from AM0PR10CA0060.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::40)
 by AS8PR08MB6552.eurprd08.prod.outlook.com (2603:10a6:20b:31c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 05:35:54 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::47) by AM0PR10CA0060.outlook.office365.com
 (2603:10a6:20b:150::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Wed,
 12 Aug 2026 05:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Wed, 12 Aug 2026 05:35:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJm1hQy2ej1aPm+qd9XfEO9V1yYlNHngsYXmhdLGVFzHi2GHVUwatnsw+tybrFYx7C6XXRBkE9dML7Jkxr6q04avrQHMn+Hd0vPIYBcw+pzpe0cCMWR90llyZHQWdO9YWAYSB41SA+QS+OmubOVlrCj83oIyW9wOdEekUQC6d10eqqjIubF4xeYaWKvniAgFWCaR2D4k8d4cXW2icmTIq3L0jiwL5kds1rHVghHHWTnzUo7cqnGdGVaj80A01cHMI4/wPcpfjyTLKzPW7oUYWcuIdAiO7Fvf0k+4ikBdW9rMru0J0U+l0XGkBcy0HE89T6aXbFVl4uC+S4P7t/m6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlidU8puFBodwuJvyJaBj0gilBCPJI/rAdjKP2RePvQ=;
 b=fgRSoJKqdUDxiRXleV9wyybDVBJVciqh8MOoWC6QCtGX4Zqoox5ZCFQqyFCdS6Y/wcW6MT3JTI2c1H6XSCAsH2St4HFvziQVNiQQwNhBoMCYGgchhTLG3ltHYErY3xViDLZ8VxRHZL5e77l04+gdpyZ6x6Y7KlaBmkdFj/DUzn0ZZdFts6WgRAenYZWA1LeOFdDO6TXJ+ia90I2GtqaxKso3yrMT0ciZj9XPFP7mKvFqf43DJBw1z7R0qqQ3rPqvoLV1VjoaxcxO0pmbCt6YQfvmNukeTK3IpRMGG34SR7uShip0w7ln/1oTm6c2K2TQMq4+lh1wnUOoyEeohLSr7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlidU8puFBodwuJvyJaBj0gilBCPJI/rAdjKP2RePvQ=;
 b=GLwwzmkMWWfhK8S3MywvYJPPoBuYwKmXuourZegUOVnr4FMvl3h5HdiifVZeO7W+mSig1rqx/WQJfrQlnt7Ou7s59mpwx1lnMHa2smcld3aKGPrS5jCqvgYb+Q22EeHBopS4wSBubon41uIR0WY3XTVpNYzDa+1qsAFpyWJ2oW4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by DBAPR08MB5592.eurprd08.prod.outlook.com (2603:10a6:10:1a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 05:35:19 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0315.008; Wed, 12 Aug 2026
 05:35:19 +0000
Message-ID: <11e2f110-21b6-4436-92e2-b998d4d45de5@arm.com>
Date: Wed, 12 Aug 2026 11:05:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: thuge-gen: fix test_shmget() for PAGE_SIZE
 check
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
References: <20260809-selftests-thuge-gen-fix-v1-1-1919f4b3d12f@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260809-selftests-thuge-gen-fix-v1-1-1919f4b3d12f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::16) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|DBAPR08MB5592:EE_|AMS1EPF00000094:EE_|AS8PR08MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: c0672974-8df1-47a6-0cbd-08def83393c7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|6133799003|17002099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 k5rAViUxukr0xE5Of55APcDjUzRnc12LCWQ8/udH4rmcSiY8jhpXsLkep35Xc5kDYheq27b8ln3v2hBbXL1co8QySXFl9t9UIa0bh50ULN+SOcRThO32rQIqTgMe8yypF18xRBo379OSshiKoc/JNOeRdFBQdRynZvuiGg77Y+r/bQrpRErb6KCxFKz6CxWorqkjUNSYFXjVeUTmP2uyGTA2AhR9mCu//BKG78rb5FJNvsO5HNBC6OTTI11MWWDeyt0dQdrhVSBnlZgjeJYIrrWSxrfQbWNKbBn741nzv24aAOF9VYpIpdZV2wyQkDRAc7RvPO3XAF4dyYn8Ue2ucpYkNRqWlZk3m7OcoNGAQ31UF1hOASxcdwzAqf1oCjicahA8CLU5fsnDzq9dRmS1ahnKQfwDDnA+Uz7tq75RLBgFLoOF8P5hSwdGbbiuunlzirHEXPZ/VeHJNm3QInBEH/iw7r2I+bAaD+aWbw9e0++Nsuc9oZ5e1v8bfZpktxtRpUo8gxdLnUo+eIPDZq2zFtzyOM0rq+ltZ39q86Os26h2SRXXiDBe/FTTv56yOKdGuCSpFmjLFrHupTUs0kKxEkU3bXF3rbWHwGAK7b/bcH88I2o7Uur1am24cCgNm6VKF59Mm+dmQXWGEYwfxRad1F083nb0eHN3OTQVSJWEX00=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(17002099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 NNV6Eee3ZJ8DV0AVTtBmGuOoWmNXHDY/nfK7iw+weDfGqFC9CL/M4aRy3o/M2BpADkIf+mYF97eR5nSAR+3rKAydgL8No4JH6uVPn+8+CZRJEjEy7bzQX5B8cHqjQwmdYW3QUB6axivrPuCwPlGmkQNdX2PbFARCXaWn2j8Z1fDlXpUMK5mgtrV2Tei5txnqlJsvCEpMqEF5iqW6EgCCqAyjI5tJzqfV9bPm4XQKqIJmiYXUc0uhgNK4mBzgfYrRansBainfAxRnbypGz+2pxhB+TvZwACH0In12imK6EQxhlWuQ3WEMSKZaKcod19bFO7B6B4sp01gxhunErM5Ugg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5592
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bfc9da56-4308-47fc-eceb-08def8337f19
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|35042699022|1800799024|7416014|376014|14060799003|10067099003|11063799006|6133799003|56012099006|13003099007|17002099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gWyFqg8mA5joLLMWCeCWR/ktiOXksrJdo/ILXSrlQc5TF5dk8rrq5VgDOcZp3adgXEiuAjuJZAtm4c2eUid7lbNRC5AsjM63ckV7NFO7Auqo0A1WOjFktg20Kg4GE3AZ7ISCJ2ItS35cyGhkrc39UaC6W4FIktOJkFVh/VRogthcLvVeQxVfchXH1+oGA+rgR0pemP+3lkszlItc6h8ni+wTMUVWbMl8toMzvREcjKTe4mpZEWRroUScEb6FidVAmyhd2A2hjEhljGV+9dsyyJkGywX02Wza7Z0IC3xbSaNTI5i/CNfqSVOPeVgejhPN3a+2/CH2pV8l5Rqzu/cp+0z0/k3JQa4LZE8PHxMSxnSGHZ0ZCg+mj1NExGnOylK9c7e636UX3N+wf7vfuLnNJ8ukO59yfDabfgEnUt2TCYlfX787ccEJQHWoCiS++ENA7GAuKC171tsPgYVrw3apw2s/Nb1eKF2sN4M0rPglM2/8RQq4YUFlTBtwrFJN8/fwDxUpf28bUMzDgXjk7cHrkKEa+XVl9Vn9NEhwz9cMVbjhlI7TvMgM/nqyxs8j8GR9QVQ9oolwp9NnLBrPXXM0WW4gfBzBS8s24SPB8nY+DMRnWiM202BDO7JARIF3ngYLnKKy27VdZquCSlIWj4V/WGpSb6djYHvnJT8VAZJFOU8krhiIyOB2TMuwA48DA0yPecYAGVTvYpdWmISvxpN84Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(35042699022)(1800799024)(7416014)(376014)(14060799003)(10067099003)(11063799006)(6133799003)(56012099006)(13003099007)(17002099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OydCL5AfBnZm1JR5BBLOUJ9et8qnXCOqr18hfsO5RrttRv3iSN1WDzO76baCfU0Bdn8m4EQwtorzK4IlCOMytGGv2VfQJK80VW2HGC4ZNQWD1T1raK+OhETUhp0TN951zH1T9CfGkvdLBREN9sQ/gEIawZko567bVUakmcizkcG2qBVC9ZvdIDWFjeAp2IVw1boJFLuzZxl6LwsH9WKJRlNARyGTonLKxZviF3OsoB3Qx7oQp4+y5AaM3kU1VQa0T2NtZxg3mxrLvjL3xwu+NSh87RrbbBj3ZF79q2xf5+O1kw25VrnmCAVItWXAmPDk0o2IXNjVHu8RsuswtfTwqlkkH6Zl6LoRa4RQfa/G5kcnvcRwns0gGAKQj2lISpKLdTHxyzymxxmfQJwsS8DRi866pgXSbC3WA5HLt6YCJI+ZMmjuh8zI6FcfU7U/S9tL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 05:35:53.8597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0672974-8df1-47a6-0cbd-08def83393c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6552

Hi Mike!

On 8/9/26 1:33 PM, Mike Rapoport (Microsoft) wrote:
> Commit 49a4e7186b08 ("selftests/mm: thuge-gen: add setup of HugeTLB pages")
> changed thuge-gen test to use common functions for reading hugetlb
> attributes from sysfs, but it missed that the original read_free() function
> special cased PAGE_SIZE tests.
> 
> For PAGE_SIZE tests, failure to read sysfs was ignored and read_free()
> returned 0.>
> This allowed test_shmget() to essentially skip the check of how many huge
> pages was consumed when it ran with PAGE_SIZE.
> 
> Commit 3199b0c09efa ("selftests/mm: fix read_file() return value check")
> fixed the common read_file() to actually return error on failure and this

This commit does not make read_file return an error, it just fixes a
"read_file() < 0" check, which can never happen since currently
read_file() never returns a negative number.

The patch from my series, "selftests/mm: make file helpers return
errors" [1], is the one that changes read_file() to return a negative
errno on failure. It also exposed the same test_shmget() issue and
caused the CI failure [2]. I also debugged the failure and traced it to
test_shmget() [3].

I was planning to fix this in my next revision, but I will drop that
change now. :)

Rest the change looks good, so:

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

[1]
https://lore.kernel.org/all/20260730140825.238130-2-sarthak.sharma@arm.com/
[2]
https://github.com/linux-mm/linux-mm/actions/runs/30553882784/job/90909219578

[3]
https://lore.kernel.org/all/9eb7852a-c14f-4bbc-86dc-4775f882fe27@arm.com/

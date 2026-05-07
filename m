Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2DB3CF69E;
	Thu,  7 May 2026 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153365; cv=fail; b=eI1UXh5Jh3v1TU2CWyYiEq4f/hLTlmmwgkToLo+Y+C0+L2CK7ABk5mczTkoA8KWIK1t1FUIEqCI8Ay2tHzpt9m5hKnQRw9NlOmrjAFdAu3UFcB+XTjosSan4GHq81AQ0KKC/6TPv5g3CqzCL0xakdLbrI4mNjjFG2OWgC/1TZ2g=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153365; c=relaxed/simple;
	bh=W6ofm59VO7Mi2U6XUvW5A+L+KqKure+AIKYaZxCrKYQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pxuq94B86BSy5f5ArBky97t9elA7j9G7qun6Rixk3hVQfmzL4J74ZGBY16HDY6kNTzouSG0uMxIuA7BaI/d7Z6vgfisuWA21n5o0L3zu+STIneS4uPja3K1qBvugs74XFV0GTQsoz3Bsq928IBnO66Qznqm1dVyMWcBruQuKDoo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o0P1Leg7; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o0P1Leg7; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o0P1Leg7";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o0P1Leg7"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XkF8jE8ynovcbD4QJXElJuNyyJCBwm0d2nB1ekCbw1n3OHOnyxf/HG3wpRCUo9Z67jV8OwVKzRhaBf/5l/HIrERH2zlYnbyP/NyRSaQ+zHYpJwj/l0i8QvMyT2DP89yU0AvxHmswFuGIOcRyA+brY747QVebbY2oFaCLblY6onDEMfbmaSnp54phDKS8dxsSu3QKjZzZuTZYh9iKIMOAJIz/PzKMLeZdQZOpGTx9FWABTS9rFtv8f2IKPWBTt0X9tKzTdIYb+/sQu9qEmaj6YqVhktc6HlpGXuUKmOXwx3uWdPf1QGS4YRMKEev58G78VtqWfqSYW8uaCkEIw6W6zA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JvQBfhJNpN0XR39gKRvYHD+Ka2JO1yG87gKCJz4+CM=;
 b=ommvsOkIytC7DwNQZPZbLT7aPB9WUUjOtdkpZZ78xnJYR3CQa5JDzC4MN3vO5A53s1SeDnZvkw8u581CTiMa23lq6Mhig75npS8Skq1kjl2ySoXRwZKTQQRrfpfOUEEAmwWmK5HaPm8nSseegi5sDkbvdzRtTpJAQqhncqbcdcB/0eMnoSqIWU7zeVvchlolTCneY1Miq+APlFwijxoTpOdXqAt0TA3ofHirn4tdSMo+b8l3eR0xGyJ+lgBgrIByxHx/nFAZreUL84Amwuvy2tmhghmpbHhRh0fTo0twauWP90k7df4yLLsYnF57vS42y3NI85EukyUevdkaTDn+cQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JvQBfhJNpN0XR39gKRvYHD+Ka2JO1yG87gKCJz4+CM=;
 b=o0P1Leg7KyKgjPtv082v6B0F3wZ7JE9KtL09aPhUWE3iarm5nMVsZIpLQ5D6VYekr64yvPPlcQHv+FKsUQlbijMe9UzfVWtJTFVzkEmOFheSFMnnQxKdxj9G8ct8k85uyrvXgv7pA9StIoG5GbKaTRbAd7RIqAyAEym4y6n9cg0=
Received: from DU7P194CA0002.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::33)
 by GV1PR08MB10534.eurprd08.prod.outlook.com (2603:10a6:150:160::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 11:29:12 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::1d) by DU7P194CA0002.outlook.office365.com
 (2603:10a6:10:553::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 11:29:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18 via
 Frontend Transport; Thu, 7 May 2026 11:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+MpnaA61Y+S2Arht2050vfs47uWcQeCS/NKGvGI3aSnBnwFHGgZDqijetAk2m6cYg62VUmpC61v/EerKPqcn+OnO6PhstB3WNXA6LWTKRkIdDhX4cDcGBdTUhxhtf1qcRotjrT8hmcO0pLRcLSpApsKuqyBgFy0tg1rHvwt9QZYbmK5jFIRpfLuJ20TUTqAuNh1xmhXsZRb0Y4C/iTOGjxHm4giivDzTkKIX8xOwqcD1/0ndqquxmXtj4zxqCHoXDwufO5JKYyTO89mChrSZ7G+hvZbEd7d4bS3IjPoXbmixdc2XpW/SB9uOsj1L2RURpyAUxSRA4W7ujlt2c9Qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JvQBfhJNpN0XR39gKRvYHD+Ka2JO1yG87gKCJz4+CM=;
 b=xl5PK5swbTQrmTheSlfglVSm5XpY+tZ8oagJYrPJkHfZ7s3CB9dzd03+uMcDmrr5Lt7cl3OsrVAmgyibd6dJkiiNvHja0gVQ8DJI/Cs1nDCUFozvaeyeIg/PgAsv04XOqHH5zvYhL+aqrc+eRUkm7mK0OVPmeluL1lvy5p1ApwPv6ackrO8PTxc0BWS3WDmwdw+ZAgPeGsXfEuC9P769fVnyMW2XSQoh7JLCxeGt73H8J1+EVLARhIFfoUN5UAJOzKcewCRGE9D6kSLUxJZ2/BuaEBl9xa8dZyYJDHUQEHftXVhh6sU8hsghkywjNJWkFjgedmmyCXwOKZbxjxOGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JvQBfhJNpN0XR39gKRvYHD+Ka2JO1yG87gKCJz4+CM=;
 b=o0P1Leg7KyKgjPtv082v6B0F3wZ7JE9KtL09aPhUWE3iarm5nMVsZIpLQ5D6VYekr64yvPPlcQHv+FKsUQlbijMe9UzfVWtJTFVzkEmOFheSFMnnQxKdxj9G8ct8k85uyrvXgv7pA9StIoG5GbKaTRbAd7RIqAyAEym4y6n9cg0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by GV2PR08MB8271.eurprd08.prod.outlook.com (2603:10a6:150:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 11:28:05 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 11:28:05 +0000
Message-ID: <3f6e4282-d745-437e-83fa-81a84f2c977a@arm.com>
Date: Thu, 7 May 2026 16:57:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 43/54] selftests/mm: hugetlb-vmemmap: add setup of
 HugeTLB pages
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Luiz Capitulino <luizcap@redhat.com>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
 Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-44-rppt@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260428204240.1924129-44-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0213.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::11) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|GV2PR08MB8271:EE_|DU2PEPF0001E9C6:EE_|GV1PR08MB10534:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad0a9b7-c0dc-40f8-c33b-08deac2bdc7f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 DI2UXDWlIYcDgZa1cmtH4ZCtpdxX3K7j7hxSMG6HZaQp6dHpJBTZVmfMTCqbku+sQ4EQrkUhqTMxIyhpGZgXiZWXM4OzEU7lOaEAu/GfQaf0zvgm3YZlReK1OloA2ZXoQ22ImkpHAS6iGAmN/8l12D+uh+gkzKe3EEW8KM+YatkTceXArl0K7Io00d5czYn1jNz/f9N7B+ADbBBXqjVoFtF5JfhtF/0x1gW3w0rVX1WMKnp/6+CEaYw8nqX9YFMJWRbIqUWEg8TUmvoFiv/QyPLh/g9lnE3V4i8m+RGogctm6AySATvqiVs/3Ojd5sSso2s/sWkCVPe1u7LcgBWWBWDWsgz3hHdjloAMRK98eEJi4TEkw+8r34i36rPZz+pF9Nv67JNVfIl6tuxJqgYVnBJqFt8dnKH3Zn3f9ZZ8n1Msydm4s0TpJzeaB6ooiV6HDK8aO72ioI1jGm8UQpRQUxiWKoxflPHmO4NIEZA9NvwI70lsl3BQR9+WvG2G4ARB8lzwU3TBIypAgpUEakeTQqiQvAe1rkTn65h5bbJ4j66dqquraKavxXfno9abO6vU55vdUoIYZYKbGsYeOAYq479Xye6UGSCkXLHIHx29MyWwvU3tRRpLDY4Ko2Cvo5FFDiAJT9OB8rdSlc04bi7vFov2AMsdgCQbX2kN18coB3GZ0IpwITzf+hwT14noKU3b
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 rlQL8Iww+G3xVPTdGUQ36gXq6tlxXhhz1hS6y68lFWA+OVG6kpZloOpkxzCHuTtwW05SbfjYPYbAOVucadOoxGweK0dObjtYTQ7lWGOA2GJ/82yPPLQ7PnwF0YCvNUl/ivOsT3OTq4v2ip7Qoq0NjhNksxzPK0PqgY3Q5RAuY2we8Q/9ihvgQrkLAZc17PJ1cbCOEw+K5J0M7u4AhGyZS+IIKpeszkk6190OH2gV5NRgTqCdXnWEOjkYC8ZSER/O41mV6beoEIfZTpXhCrKeYfcv1W3NKgj/t5tsqEc5Ko+uXIZhHTw+8rVy9yPf4iJxfufp7/0b7ilyJd/NwDWpcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8271
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04d61cb4-e51c-4b1d-bcca-08deac2bb491
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|376014|1800799024|7416014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VprgmtcdAauA1XgIXnXOa2kcQKLlq3e3C6BgzsQIMceZigkKqx+ZLKrEAOItHu0mXvnSXXCGQArvgPN/vhr8wPuAzs9qDaxi2/kwIbQiYIm02nnDbDPA1zV6fOw2Aeyk/OlyXLeHog9AzpmCXsKK4XsaAExUzybNYuTlTh5YWzroCCfhjPf83O4ioq3zNN1TE7Fkpp64e5aSEwiYu6EoyDSG/j5vVr8QJ+O90ilRiSQVmWfeXmKS0jG09iT5/7/VCsCeIFpT7quNzA/BoriBins+oqqSPQSV0XZmJZFk7VGOym71jwO6qZq76rsJ5qefgHZtxKWDUum+1u2kwDFifnXnDEjHuqDsiqfRFM/DczkMkOaeqPTjyHzmHbUL5tW5UNSp7bfTXk+DNIln/NZxsiPJ8wzCNyrCfExJ05csRDq+Mt9+IkOIM65uDsF5UvyV1rPICJNVuBlIhCbyGlHbh59uFvkN5pLmQlgSAFgW+FQdWRgMUHJ4ZFjwMwuLlPM0MZnxkH5JlHzw9CwDrtjVgeTj3Dbg2HP625np1i26JUB3x5aVM0mHth6JHEE39BkmLzZVDtZmz11SvIH1b5i4/+VaR4P32jge8t8oarasWjNTyTfZDI9YFPHHKcVQpSkOyuWWY27wCxvihiRpW0pcse9aUYZt++3saZZWJ+YZlIeATJM1E9dFaBAD1XwboBtOThwIGh0m+ybfYDdO2+6Dv/cpYKG0q4EmYvjtvvZnhCc=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(376014)(1800799024)(7416014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m99CHo786pP4+YR/cIkmbtdrw7h0kFzZzOcWZwLCGp2rvOcs8s1Qdf8LBoH91UmfFR9ljnCQzs+dzF0R9hUPJ6yFSXUho54Nk2LSpAFdlida7vuV5SQSYxmiOP5qAadjtTAsN6seJuyZfPuDndqtTlby21/ZjyzZFm7LaDbSnLlBBWYs1XS7Xp+hr25RozL07ZMx0ow72REpupJAwUljU0CTvpk9tzBOv2XyUKl81FT5yO4EGHEt9fGuS4WbSZw8BV4Hjc4b31vWDDRnyUltkbC6YEPK2EV5Rz/NO40k4ZIhTePn67/YkiMlurJc/VLPYBr6A/RSrAjkMy9UzKH47jOyvEMfW25uvwEmRKgda0Pfs1BpizBU3fgXFgVGF77VZxB1h5u0JHi+d1P5jGdZXHdV1HPwyrRnEoVFTjapp6165tJJekXQUEekawxuu0nl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 11:29:11.5113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad0a9b7-c0dc-40f8-c33b-08deac2bdc7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10534



On 4/29/26 2:12 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> hugetlb-vmemmap test fails if there are no free huge pages prepared by a
> wrapper script.
> 
> Add setup of HugeTLB pages to the test and make sure that the original
> settings are restored on the test exit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

I have run the test before and after applying the patch. Before the
patch, the test bailed out with mmap error if there was not exactly 1
free hugepage. After the patch, the test correctly allocates the
hugepage and successfully passes, restoring the hugepage settings at exit.

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>

> ---
>  tools/testing/selftests/mm/hugetlb-vmemmap.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb-vmemmap.c b/tools/testing/selftests/mm/hugetlb-vmemmap.c
> index af5786bebfd1..507df78a158d 100644
> --- a/tools/testing/selftests/mm/hugetlb-vmemmap.c
> +++ b/tools/testing/selftests/mm/hugetlb-vmemmap.c
> @@ -97,6 +97,9 @@ int main(int argc, char **argv)
>  	ksft_print_header();
>  	ksft_set_plan(1);
>  
> +	if (!hugetlb_setup_default(1))
> +		ksft_exit_skip("Not enough free huge pages\n");
> +
>  	pagesize  = psize();
>  	maplength = default_huge_page_size();
>  	if (!maplength)


Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731362BE02C;
	Wed, 22 Jul 2026 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722651; cv=fail; b=iSmQwTpxRIYkb/ym/Me+wFyi245IfuP7phGbMHgf2TqVNme2ERzGJmMtJn4K7gA1YS5t1SAjedKI+ciwqqSqJfT5dmxmWZ0IISMZpdvdMUbhmQBbq1/lecMiJqEkLqucPRGmjohLhmfVSdwdlOP8k18N77kcU9c4oc8mhg/eo8w=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722651; c=relaxed/simple;
	bh=SKQcHxlM7GA7juvQ/a0fkbZ1U32JWs0i+/3eopAS1/o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ksufXUl4SXIgYDhQ8p6hqS2nF0cLQTbnjMYNJBE3xxk0tzDXDqE1rAw9usAh8NSfsIK4yn3qOXHqrhlE1nxhur58t4XHyizbY8oJloOVnBJVNLRKzCJ7KKpzfWngHTiEHauoksNGtnh+0vdQyjDn1XUKD03jrDjkyv8XLf7qdt0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OeqAdSs/; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OeqAdSs/; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OeqAdSs/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OeqAdSs/"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VS2RIlEMxScTxpdBjSpOyoReV+J43FSZt9x5mHyq2QWCknLqtePIgI7EiugXab9MD57RwY55JzgjaxUErCDK6aMUyAQVVzf6oFhvyu7wI8s5h3J0iyO6WYPS+4r1AVu4/tPQNE6KsKf3QsyX3FeAoN6YTIF9g9cr5aBxoZZFD3//z0aiTEiF9655Fhvps91PvNbEhKWeO8xm/5C7euXmM87u9aY92NSM4zx0W798v1sdNwMoflrHJgYPblId4WeCxOdMF/S5tcXEZIcigfGlYILzQM9j0r1gRMrSExZMiXZ2EKxYl4PuHac6mL4/udb98pU6bawCd0f8GxHsSUTqOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TylMCfepPzlwidjc+CefN9A8lZB+U45c+LoHyf86wWk=;
 b=RNSTNtLJl53mA+5Va9RFdp1NpWy6T69gdWZdqRoBJFONCMpOs/SKYn9re+6XxmeEttBtfIS5eF7g4sQC2QNMeNItOZqGGLFhLwcHv7nIylA9FC0I/J314HlH8u5Qk+kDzI7nTr5lp/IMnZvqwkWTx7j6wifsEEJZ3bkyfkDAGVmwnC8QwAvWgI1sc2gd2NCBFbit0WoYTZSAArRqVHGA+xrKr4erwbqd12gUiRx2rOkcefxeywhuCYM7ywdwmnR+jYVh8uNtgiLbogoHCv15pFBzjnsrgtcQZHK67zF+01gDbSmVE7hQEN8BTtB8+p6smsfMnctu2OitYr6KeMYE+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TylMCfepPzlwidjc+CefN9A8lZB+U45c+LoHyf86wWk=;
 b=OeqAdSs/jJKYFxzl0VWdhl/3b/nZOrhE4onk4L2TbQ8pFRxfhKkxrbmeFgjGUkYgV30jMLGxlsJGjlzmWKabAIjZg1tbSwuVID+eaFZZSS0KS/sI35UROKIvKdw+qZmzgXaToj0STWL2S7guWfHOcBOiOlJ3gRfjTAsDfqwXH0I=
Received: from AM8P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::33)
 by PAVPR08MB9115.eurprd08.prod.outlook.com (2603:10a6:102:32a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:17:14 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::12) by AM8P191CA0028.outlook.office365.com
 (2603:10a6:20b:21a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 12:17:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 12:17:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sI8D4VYgTJ+YMq/obHlB469ikPf285zYKRQWCBTS0BAo/U7RUXI87OBuQu1SWDS4ZP2CaDfjA0Zmubtq42xpoyMEiWXSH+qv7M9wIF+66jXybPhl73iQe4C2i2IwnTFhCCX/XfLPmr6sNdTvFIKKM3DhK49zDm8wr9i6vVt7e8y/h//soeVD10UqwuYOXsmOz0aTmaDZwtlxU7/bbK3puX+b+gd0Exfy3Dxu5QC7Ez2ros5++couf2ayNpbubF9srHladv9Mi3WKOXAir5Lg+4uq3cxT/nzfXJ7QmUeouI1DMJa5QWj6jwBrNUBPiSwywdhuwQbyaucU43MFegwf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TylMCfepPzlwidjc+CefN9A8lZB+U45c+LoHyf86wWk=;
 b=T+Iqaw/C3P0DKuEzBBXWT7lkqbeRqAmrU2AcQ3Kapaj1LUdhVSSnl7EBdYL1KXHr6Kxqbte+LwcNwpXDj51q54dBKfWEYQg0DJkPpo75Ch3+C+Us2HtZ1wsRcjtnj3Qb0fQ6d4WEpLxTGT+vdnkJMyX8qDnrMg/3yIDv05faqX/fjw5x1yTnM18t0m4j0yihGbNm90QWb/2C/qfHJCsgVHqlBjKXPJa6PLGyZfYB1fdva5EYMo5xHZJnMGzj22af95F21KglXiD8JDF2ikb50lgeGRZlMa2KLr6mx6UxS1hdE9QxteFBHw/vysElRwwUzhQfONl1JVh509h9pLXp9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TylMCfepPzlwidjc+CefN9A8lZB+U45c+LoHyf86wWk=;
 b=OeqAdSs/jJKYFxzl0VWdhl/3b/nZOrhE4onk4L2TbQ8pFRxfhKkxrbmeFgjGUkYgV30jMLGxlsJGjlzmWKabAIjZg1tbSwuVID+eaFZZSS0KS/sI35UROKIvKdw+qZmzgXaToj0STWL2S7guWfHOcBOiOlJ3gRfjTAsDfqwXH0I=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AS1PR08MB7516.eurprd08.prod.outlook.com (2603:10a6:20b:483::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:16:10 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 12:16:10 +0000
Message-ID: <9bb01e21-159a-427c-9d64-5db7070f0209@arm.com>
Date: Wed, 22 Jul 2026 17:46:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v1 3/5] selftests/mm: skip khugepaged swap tests
 without swap
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722091219.61504-1-usama.anjum@arm.com>
 <20260722091219.61504-4-usama.anjum@arm.com>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260722091219.61504-4-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::11) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AS1PR08MB7516:EE_|AMS1EPF00000091:EE_|PAVPR08MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d146514-9449-482e-bc9f-08dee7eb29f6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|22082099003|18002099003|4143699003|3023799007|921020|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 7lvgbjJCT5OV50LXtFNtKGWRYQx7U7nZeIKtL0xZP2utjJtO6QF/MmBYrj2GVUf6EXoDVsuV614DmfpigpvFQdQuDSJWF91kXoLMxFVlniP52jMZED10CesZfQmr89HIUScTCxuK3VpJ1A+lF0dDGfnDJBPP5EwG4GPpQTvwZrrNtwbTjpA48qzBmC5DMPsyBtTuWxvw/3bpx0PnbQjPV1E4l8dvFwjMxW34Eh771OsTp7lt1BekXFQ1xLVwy7Q6rtgO8czb7LWKYalxt0mibgkLAgQWZzUxl6ynbGx9doWByEIFRYXYNK7Ygb405IuFUz9ZWCZAo7GdVVW0gn745AuqARi198LtnO++WJMwWvde10irodwNf8wWBmvPb53mNR/nmIXehkeav2Cgix1rF2xSTtqfc1Js/8L67v3Q9ymHUrPkx2HJzUGt52E01ftIjVqqYNZhHDishW4+5qWrw7c33jrgQLcIGgRlRkNLFkoOE0QtN5o4gofSVLaMWnDN2OovgqyrlPBA+gTag3oKR7w6j7rkwcV1+ng5vO+YxG5ow5bZYEPk+OtubAywNZQYFb8ZYYAJPG+GM4jihbhhA0EfG/ta1h/7klyy6zYu6hMQ1AKkmCxu1fSQ7R75LmXm5dRNZdBWboAu/bUJO8MhnsbH/8rfGYza8whqR0TYgkqhVrODExUX1VQtGJXUJScTx0twxJKdPKHT41LbyDW2Yw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(3023799007)(921020)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 YNP0cyL3b3mR4VdoWSbIo9Z9CvX65ZYSNzHrl8ZBSL5rYt7Vzioh4bsKFlziXYdFLgL+wSUswfCKM1m8EqTjQjlglLj5PKJj3b1PHxqaI9Cn+N9HYzdvvhe4e+b1bPfYGf0fc5E8dAlGAV9QHKL3CAMvzogqEYg863bdQXgApvY13Lhr9h/35EQ8tgRaWfQeZ5VJjPamvqr0bVZpgbMjWtrn8FhHO4oyF7A+LeU8IrMCpkqxPl0RyMxVSYaTucZZrMNak7lNvgE0hhu5P3pb56xhIaG69GD3VdFLO6VKtJBTO3Gt98V5HeXE3U1ZFPXd6m5uBqoJbPYDne1eVPCOUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7516
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	594c04f5-6b7a-4cc4-4b4a-08dee7eb03df
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|376014|7416014|23010399003|82310400026|1800799024|36860700016|921020|6133799003|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	6cPBOn+nanZnxCJDq/w/5WgbDixyE16GyrpszaeDTjMa2IDPy/RqO80TmM4bCgZoOq5lqq0TkhepjU5slzq2dTtEtspGkfew2GMFXo4GIq/mVLsD6aKEWfb6OBuOkP8hOD6Fu3X6AFyeJ//4B2zEBuYk5C5jGwPHKtr58utciWqdAiXflyEfDTigJzLt0fmVTXCYGrpKlm/j368rSC0t21L3vba+ydL5ZupOBccWvMNpdQ+BYBUxifFaaAh1xrTBETlJ8Z6NB55lgK3Hhlu6/cEGJ+ydhCEISntWYDmTXwPDvestkycs635ByQprb0VdgBRTlu74RX9eerlUqIe6pwC0VkIVS6UAaNLnSYO6hztQ5KI5aEO62DHmkyy2A80Nw5+uNzSf26MjsBkUf0a4+8EvkGrJoCsKrNe7w/O7tFFSB4pScYPkaWFSrP8xHA3OQJTTvYtqT/4abxqJ3xbhR9TGIYd4llpbNKfM6f8BoH6kAIkvCkl1flOg+WM6Fa7hJ0l5g8w0dK7Mvus1aO3r9dC8PD6zAzi8i4bfMLa7zCbfWzYOcR+FAqljPTtq29hkVcXJzMMgwdA6r3FfX3i17M8VL/iFjQO17VZb9rJMfkTyOsVgw4MQLjZvTg9zE/lENlfJmLXsJ0Iun4fAlAF/uKc4xz2KVNcUQ7Seoc5O9X+xMRnrTpD7ZJhEHWsG6N+XkwLB0Eal+VXeD9AEzZm/jzJxXh9+UJhaSZJz7QnBIvpOGHH8jYL9eP1uZMfgcrSS
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(7416014)(23010399003)(82310400026)(1800799024)(36860700016)(921020)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AwMUYxaD11OpjBUJVvFdbMPk3LBZqi7ENeCnij0djUm1tRHgt2iV8uqBtFY33b/VXYUgLXZ6TNykHXETc5Ck/JuF5573WlJNMff2qm5HYToritgtor1J3W3LhocabenBQKRYkVTiQ1RQvBL+BNCxuXAw8b2MIVjGi6giYjXnpYaVbZD+laL0r5Xgg4h2l/hW3qLLeZ2YbikThG7KAAju3P/C7L/2GI1ZOpN4qo8P0o2bto66yKYaGLHs4X/6zGNaP0ZItj1IVsnkYtnWIWRd71eviibHisL6ZReP+jnJ6uq7iANpvv+djNySNM3ug/IVuj/u96siNqPSvVQLfYUjnerVWikrWPJsQo6FMrsmbFGjOqXdXrwsx1rms8JzMehN0WcF7QrGpqATud6oXOXWQF/uz5apTE1pLedXJEId/19CFbPj814Ng7EYs9tGXBCd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 12:17:13.9610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d146514-9449-482e-bc9f-08dee7eb29f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9115

Hi Usama!

On 7/22/26 2:41 PM, Muhammad Usama Anjum wrote:
> collapse_swapin_single_pte and collapse_max_ptes_swap require
> MADV_PAGEOUT to replace anonymous pages with swap entries.  On swapless
> systems there is no backing store with which to create those entries, so
> check_swap() reports missing setup rather than broken khugepaged behavior.
> 
> Swapless configurations are common on Android and other constrained
> test devices.  Failing these cases obscures actionable results from the
> rest of the khugepaged suite.
> 
> Check /proc/swaps before either swap-dependent case and skip when no
> active swap area exists.  With swap present, retain the existing
> MADV_PAGEOUT and swap-entry assertions unchanged.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
>  tools/testing/selftests/mm/khugepaged.c | 34 +++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 10e8dedcb087d..a152cec59fcbd 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -100,6 +100,28 @@ static void skip(const char *msg)
>  	exit_status = KSFT_SKIP;
>  }
>  
> +static bool is_swap_enabled(void)
> +{
> +	char buf[MAX_LINE_LENGTH];
> +	FILE *file;
> +	bool enabled = false;
> +
> +	file = fopen("/proc/swaps", "r");
> +	if (!file)
> +		return false;
> +
> +	if (!fgets(buf, sizeof(buf), file))
> +		goto out;
> +
> +	/* Check for first active swap entry. */
> +	if (fgets(buf, sizeof(buf), file))
> +		enabled = true;
> +
> +out:
> +	fclose(file);
> +	return enabled;
> +}
> +
>  static void save_settings(void)
>  {
>  	ksft_print_msg("Save THP and khugepaged settings...");
> @@ -734,6 +756,12 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
>  {
>  	void *p;
>  
> +	if (!is_swap_enabled()) {
> +		skip("No active swap");

Can we prefix this skip message with a #, as recommended for KTAP
output? Right now it is printing like this:

# Run test: collapse_swapin_single_pte (khugepaged:anon)
 No active swap
ok 16 # SKIP collapse_swapin_single_pte
#
# Run test: collapse_swapin_single_pte (madvise:anon)
 No active swap
ok 17 # SKIP collapse_swapin_single_pte
#
# Run test: collapse_max_ptes_swap (khugepaged:anon)
 No active swap
ok 18 # SKIP collapse_max_ptes_swap
#
# Run test: collapse_max_ptes_swap (madvise:anon)
 No active swap


> +		ksft_test_result_report(exit_status, "%s\n", __func__);
> +		return;
> +	}
> +
>  	p = ops->setup_area(1);
>  	ops->fault(p, 0, hpage_pmd_size);
>  
> @@ -760,6 +788,12 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
>  	int max_ptes_swap = thp_read_num("khugepaged/max_ptes_swap");
>  	void *p;
>  
> +	if (!is_swap_enabled()) {
> +		skip("No active swap");

Same here.

> +		ksft_test_result_report(exit_status, "%s\n", __func__);
> +		return;
> +	}
> +
>  	p = ops->setup_area(1);
>  	ops->fault(p, 0, hpage_pmd_size);
>  


Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9EF1E2614;
	Mon, 24 Aug 2026 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566360; cv=fail; b=EFYvCMR0pLCodS6CU3k6GHchJFnuHrUp03uFqPG4460Oevw7mcOw+e/W2hoKHhyyqMNHOvUmL9qUmH5d3s+qoQVBsYbISSsE7CSBzrkpx5IQl1l51BUGPuKK+xtMyPjVpPH8dWmBfiEuPacvkekEWaUDdEbd4vTTfQPIw5KTuYI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566360; c=relaxed/simple;
	bh=OGLYr08LylbOQKkN73w/UxGcHo/GhMpKRUVC7FGnV70=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dmCUbz6KloGV6WBIpCeAqwHVy8t+ZLmqOgqu6YzXNO3YYYocCKLl6IZF0sBo9DzYg717qjy84DAQTIHWGXRnTPhL8uZuWn1ls9i2V91QtCOZPb2de1NxhuG+sMdU8RPeBFa1tTZmTENz674QV961p0a+ihcxJ8YSgWBMewtanWI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qwPXqtNh; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qwPXqtNh; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qwPXqtNh";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qwPXqtNh"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=daUMZFBe3IY0KHWt8FwxDAzrK8czkrpFWUm9b2qhsoUfEa5J242EILcLmC3mGxpz0AZ8lkLnTIJvHJf8kW1WTbDH7wndnUPayxYryfLlf6z88LMJKmucGCEnsQX32hQAHEDfFlsTmff/VJqFNzhQRZxaH4FYNfdwvM/rfHqO7j9dhyrAEyYxfqUB4nUnRc7rpgkgwif5NJVDaVKiB3CckI7m5Udj+L4QJTmLQf22eJLmGp2ljwFDG/Tey5oKB84D13KIAsibbpHgjlj+fCOJ78kl7HZNBU5h+Qnl8vlnLChQxe+IV/LIDakN5wRo3wCxphksidNaQOXGf0tZUFUgzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2je1/7rMO6Rnc1HvGQPrzCXVYHo1NvNhGpDEgrmcbOE=;
 b=gk6fooevsXZPFwZUqpsG6tVa1IUlqNsMt+INgvKaRGDU9p3QeWC8KjD1BlMF0OZ2t4jEGIacalviaiTpoVnK1etFrStZwQ8DRiSIScJi3To/NYUUjBEq46/HjX/DpjxKHD7GxNuig82XvrmZ+1/qs21Nk2KtH+UzOf1zXAhY/JOPm7UpsViAFxlF98PfTv05qUpsGA7XMWvcZhaN5S/BB2PVg/P8AwHdc2+zfpYuaiXhEUS26aE8Hq1LbNCm7OVGhdxHGqfDj0TAyfP5wxMZ83nuYZlOgBKcKP9HYNcxFyxJAIehhDGH2hum+QcyH37/aq5O2a0jX0UAgGmystOBRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2je1/7rMO6Rnc1HvGQPrzCXVYHo1NvNhGpDEgrmcbOE=;
 b=qwPXqtNh4o6Cy9NRluFh/fORGWQdPdssAFUP8h35lX7DpyUfVSNKd8KDAN1S4gIz3qcu5bDDPgHtoMFywu2CnTnujS9NRhLWK0rXiMBdDJhjy7sa/TvQ00zn/9JpZGMLh1pKTU+ONbXPzikJ4Faf7WndIXVt3VsYKKE+4zDWYQY=
Received: from DU2PR04CA0156.eurprd04.prod.outlook.com (2603:10a6:10:2b0::11)
 by AS8PR08MB6406.eurprd08.prod.outlook.com (2603:10a6:20b:33c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 10:12:33 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::49) by DU2PR04CA0156.outlook.office365.com
 (2603:10a6:10:2b0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 10:12:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Mon, 24 Aug 2026 10:12:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzF2eUNiMoi7/gPNUAgQ6CH7ucgNhHoFWILefbSUDOYQdT2OfEKe2N7i4Gum/r+818FL0PNR6hyzd9H4AmjZg3YATWix081f+QW9RAE4XRJRMp8zforkMPVUPO97NIh4HxhiSj0pj7Q3Vjcp1IKCaqd+CEGf+jA8TWGwkz/Msayy0rDGh7bl6wA3wc3RjK7iIan0RMCg5qBBGhPETW+K1r9G7N/ucdU1RGZoYyESjq+/Tr5KZikc97Qpj8p3NL4atSccUEXcE64hH9DEpDg5ZrSraD+uffUjlj12HlxlvhhQjPPljLqvKSpgrIMIxI3p6LG1ywpRlPq1MtTTQULbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2je1/7rMO6Rnc1HvGQPrzCXVYHo1NvNhGpDEgrmcbOE=;
 b=Kl5k4GtxN1csCNmPlst9z7rP3uMe/1oNfuua6ULppvmG4BTBTQWdaMGYrabaMAIZaZ8o1/onO0Nflojk3xP4vj7cP8yngrfC61iVEwy/KLS+9awRV0dtdZ3n3VNYgFtJwe0AhiQXUUVr2CRtydMloKKER4n6XZZ7OJ6v5GvJaDsFFCA0OQGer/UrwQ3MHGvaBEPA8qiYjzThpup7Ztp2SQHgwIN/Yxjdmz8nr26uRkWCuIBxuoxS3UeU54GgqS1iCl3N0NJe1v0fBTXzqR8CC+Sj43MhnG8YzlnL68dhuVs6UCdx5CQhvUNZKtZA4e3KtgY75Ye7mDA95v+tt7AJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2je1/7rMO6Rnc1HvGQPrzCXVYHo1NvNhGpDEgrmcbOE=;
 b=qwPXqtNh4o6Cy9NRluFh/fORGWQdPdssAFUP8h35lX7DpyUfVSNKd8KDAN1S4gIz3qcu5bDDPgHtoMFywu2CnTnujS9NRhLWK0rXiMBdDJhjy7sa/TvQ00zn/9JpZGMLh1pKTU+ONbXPzikJ4Faf7WndIXVt3VsYKKE+4zDWYQY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by DB9PR08MB7793.eurprd08.prod.outlook.com (2603:10a6:10:398::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 10:11:58 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 10:11:58 +0000
Message-ID: <10989749-0acf-4013-b7a6-3044fb20099e@arm.com>
Date: Mon, 24 Aug 2026 15:41:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] selftests/mm: add a GUP selftest
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
 <20260813181230.483746-7-sarthak.sharma@arm.com>
 <178755834511.3606540.7162032713017782533.b4-review@b4>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <178755834511.3606540.7162032713017782533.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::10) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|DB9PR08MB7793:EE_|DB1PEPF00050A00:EE_|AS8PR08MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be81cfb-c31f-4d62-5d5d-08df01c836e2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 mKJnIrCrwEBJjcc/WIYT1xwUZD9IQAQeOwIZC90buggUhYdgqud9p4NiFBcpTx13nmWtsSkzPgK7AsMllE1YilwJ1K/A50IZcaw8BrGZUAJc6gEUhhG+VJpNdVSA5/ammLEx5p8t3j7fVYHoxqEkleBrxigIOn4rGkHvDO8z04LgshHnglyuBQk2bh6dsm0haHUmiEyoah4op/ByyldBngAd5vf07h4KDO7VybPL2wKjsA+dpfezMwVxCGuT1GTwTtZ3WnvqHubnrnawHF1UIfjaCncVBEi5OIB9FsgJ+EK1xWBh6AVIUBI81HtPzFdm1DeNHco9l2d/fNhYewdfOQgxTPx/YwTTtLROLKO0GPxSldL4JyyVrfkJH0djLRtR1SspQFQoax0pCBD+LcoOe+kczL91RYSLL2JFPqP5Jqjy5axUqzqX2j+3B1pHuzcXemWB3mnJwsrtElYqth1X8RB+AwETuHJc0K4opeogUTXe+bmZYdBbUIsZVlqO4fKZqbgdh329A9hyQEI8y1bZYaqzjXzsm6ljWWioF2EHB27GPW0UmA8nkaLdP0C4p1/7BOBOSWgSNBoICYoKlc7qvWRjHlgFrsfQ5zeNyxD5jzkyOQ1RrqmiIllZfnk6C/Lksnl8sJ0aL8+fZqH/ZG77tCNRFBiMwZEDSsNjEdfC0FM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 fXgXLQVaVihgkSEuFdhuI2hewVT8dju8Y1iM0tabArpmYDSPTbT+Wl/JGUAgVfKGsX4UkDhVpqHdSgkCEZ3jHtvL0WZN6JJOKlQqBOPSQrahoWGYRWZlbQtZlsvgvBNuMR8N+PWYgfEuAs8bT906CzjgZXJU1FYKmyJZpb3a8NrCKvBGTsAc/olv0g1GoZeYkpx5QqPMd5j9Oibys1pATuoyqd31JpXlNf+94EVHkor+QG1V/ihw3z8Zp9rtGZZJUwh2uONog8n2hff0aOYjvslEGlm5sUfzUtMXrhcy6fM+gcBdR2TQ1fKeopSEPUPHF4cRmWW2VMQY8DykwcRYIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7793
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb122185-e215-49c6-c103-08df01c821bd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|82310400026|23010399003|7416014|376014|36860700016|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DXhcLgSrWtmyvCsmXeg9FUUT580IkxmSOzd4SDQsKbaY0P9chxV1hxYiowoOdgVyZJQNQ7GOrEBL5bdUzS/+yRM2JwUQIODxKzrtyEoXDZmEhPnePM2ZK/VJgZpzEk+cYklHB6RKe2rAsCKmEIIW4UYoBYqq3ItQIFTtRNvLYYjxN8f+GQNAVMS/qkvJJ0FSemX1SDYp+m0K0LfkUsBAmJjr3lHeBEidTFTWjDXygnitgMc27yGHHYKe1JIQoDmm5GgSeAm9TjLwD5M3MJnj+FYMyeRuHnMoMHBrfjK50Y7+Puf5PDfF3KGpY08Qoq+B0rxVhVbhMDOI1fQzLqjZjspJ7pONkeiAnRYMVunERc14YnwfpBqXxmVpxXGtZ87Z+g/dmXj2EbcBj6/oQEOWB9qhdAPGo8XMVMmbK1Jkxbt2m7Nkkc2MA1IYxvZpCdY9tCShyVyiMXNWNeZRWC18JwLcfgVv23MHyxPBuKZIyBw156Aztkt6IjyHSBywB8phE+9S+o45bOvz6NxUfh/UabTbIlEvPXl1JDO7fQ2IH34epZBBKo/+E86mzSZ7x2lc0vRHM4SUhYFV60acY5YwMM6WfrwY8yBwNH3O6j+kE7bWI82ns5+iA5Cyg1DWBWaxqTj+0BWaQR8J9iHNGpL1GS9eG2raT67YtjJh0XIhh/5gCx2LrR5WgUPeLhYkKYudUeLftKl7PmV38hK4FTIorQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(82310400026)(23010399003)(7416014)(376014)(36860700016)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZRiFUtZi1/R30dXqyCJU4TAq3FJMpYxTQQG4k/CRslzfLB3rXXuXY9RE1ElUgyzwrZxqSmcAogEZKARutwOO7O/wtlNLMdUjEy4XRU/r/kJKhNT1vBPrpcEASD6WiACD5wNPlk4whSkOpSU7vEPVNI3x6n42Jlrl6Ut4cI/gL4Ol3sbtlQag/ejqWOiZ6k8v0r5bDVGLHj3Sp3YxNyeScoRYfKGPytMoL2sPyRXnj74sP18PA4ooize5tp3dlpxYvIEdXLFpG8G7McC00IE9GjdReoTx4C9HLoNsfuONY3AVIXfNtk1V87ZPDbLEZn4p9SGtx2Wfiey2DY0ex16XJHZ8TAFVouSn2nv73gBlm4sQQCIj1rnEVL0qKsjZcwSuVa2wFdlw/JpZ4lucuyfKVt/6e68UW9rSLmWoceBFSz7n3hLvL3xJbfHVtM3EvooW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 10:12:33.4679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be81cfb-c31f-4d62-5d5d-08df01c836e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6406

Hi Mike!

On 8/24/26 1:29 PM, Mike Rapoport wrote:
>> Add a new GUP selftest which uses kselftest_harness.h. Cover
>> 12 mapping configurations: THP enabled, THP disabled and
>> HugeTLB, each across private/shared mappings and with/without
>> FOLL_WRITE. Run 7 test cases for every variant: get_user_pages,
>> get_user_pages_fast, pin_user_pages, pin_user_pages_fast,
>> pin_user_pages_longterm, and DUMP_USER_PAGES_TEST using both
>> get and pin.
>>
>> Set up 128 default-sized HugeTLB pages once for the HugeTLB variants
>> and derive their mapping size from the default huge-page size.
>>
>> Sweep four nr_pages_per_call values for each test: 1, 512, 123 and
>> all pages. This preserves the coverage previously provided by
>> run_gup_matrix(): 12 mapping combinations x 5 GUP/PUP operations x 4
>> batch sizes, for 240 ioctl calls. The two dump modes add another 96
>> calls.
>>
>> Preserve the previous sparse dump coverage with a standalone test for
>> pages 0, 19 and 0x1000. In total the selftest reports 85 TAP
>> cases and issues 337 ioctls.
>>
>> Add the new gup binary to the selftests/mm build, run_vmtests.sh and
>> MAINTAINERS.
> 
> There's also ksft_gup_test.sh ;-)

ksft_gup_test.sh runs the category "gup_test" of run_vmtests.sh via
./run_vmtests.sh -t gup_test. Both gup and gup_longterm belong to the
gup_test category. So the new test is already covered when we changed
run_vmtests.sh.

> Other than that,
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thank you!


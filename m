Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013005.outbound.protection.outlook.com [52.101.72.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D920A3EC6A8;
	Mon, 27 Jul 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.5
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144090; cv=fail; b=FMosvJ0bW1TfEPSkbS+0VTgTxGBXdq6+5KCprmL5Rmu/jxQAJ0izblUc+wCVfgbboWQZ55OQpHLcMbx09EW9PU8LZN6u9dHvYCt+5Ng6ngPhWsL3CkyIxFQXGzWjnsbKn+sOD5PvvHEs+dqV8ddD4yOP1y+0n2OouzsbU1MrAno=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144090; c=relaxed/simple;
	bh=OUYMDs6iUASf9FLLBc/3bwnOfCFqLkWNjdAlaNzBFHE=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZeQEnIsn7d0BgeZRFHGeO+aXSa8qbMWni1IfTTt1ctpGaulzQuryphhqlOWdoB5pYy3HIviGmDwoJFW5tveKy5ql+xiWWUdwZ1aHpG6sSK4KY7m4HtvocXuxktCtgaTn0TPYuGzkCiozuHMa4/VhDsNUchfR618w0GTA+bHX9P8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ji9+005H; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ji9+005H; arc=fail smtp.client-ip=52.101.72.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ji9+005H";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ji9+005H"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=b+w+VZy33oDYBIiugoYFyyNK8KbXshZsisXCtXdxy2URSKJgdcgDVueXcmZ4zf+ymxPiP1lqH1+ZSwmnfU+3n3CoEvGGIVN3ALD5d0D/1+OlDmUaZpNiGli5bH5PRR3MGDVgFdk/o4ky6ZtESYqV9qYjM5ElScXAUpYpXgWQfbMbWmEP14fRijnxSZ+g0eSBuxTxiScRdYP7WgNc196e57v2R5U1O1fM3cSjqQ+7g9z/rsq4nWrX+VD8hDmEakwKkR+q+NdABXD42KVnANgZemnh1AcTjDwepBgpWZa31OnZMEyW5PhCHOBIJZtOIVqcMIF2oRa6bACKm0oXhxQXYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RogA/2/jkzF61/fbnsLH7v16AFYfhoguWmOexgWw76c=;
 b=tqxrM7i5mmSjUWBr6XYKWn9zRJ9nGK0CgKIDiIeDZkrZ5fLL3lssITvdEZivFSKrP6KrOvPzFqdhb9+hyPRUiqAryVPF3SwZ4GcowcF6HCETCLt5phMK6C6GljbMAT2iFAXJSISg7M9+Lo29DD+2LPXIDnNo0yNb0H0aaspaKsKq5nMyN52rEu2G1AW5DgjsT5MrF1sTyUFo8CqyF/igASmz/FhqgA5C+YgkBfdjL8HtgfUmVs0gNvtfUDNhuC1lWlFL/a9CQwbe71CKU6GUWEGmKcrfX4xF7krK8zy2vmx0/3sNKW91TDFCTzjgAtw/HsgPTRl7bczTt4q6703xKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RogA/2/jkzF61/fbnsLH7v16AFYfhoguWmOexgWw76c=;
 b=Ji9+005H03BH4VWzXwsLm0gU6ngy/lgQjAOzncNzR5qkiYNmdZE9TsY+IKPnBPfHC6r6DgqjNyL8sRiMUPmSdHXdEtj1fae25IIcsFsj0mEZfjctgdWpOa0FNr29NAAp+Cmrea77ekuRhlCg+eeCoO77mp/zxp9KwA5H8mJUvmU=
Received: from AS9PR04CA0086.eurprd04.prod.outlook.com (2603:10a6:20b:50e::24)
 by PAXPR08MB6382.eurprd08.prod.outlook.com (2603:10a6:102:15b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:21:21 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e:cafe::7b) by AS9PR04CA0086.outlook.office365.com
 (2603:10a6:20b:50e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 09:21:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 27 Jul 2026 09:21:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlOH/MXsXddeuLf+rbONxPlpDmU7VMBJOw9HiUJjj9DZAQV4TAN1G6frMgDhBcXkM+BPO+NMN6KgSdL/kAsrtS/oVEiEKlwqOCyzDHeXFO/IA3L7mg0crjBA0madkYOE7X9J2Y1qyZc9eo7PVCPZcxkHjq5fcefIa5Tpm2kKX29CytS4VTYs2vOga2AHa7rYC6lGJqs6UKJrv6ooL+ToY7QX0EgpuR1giCTXJolg/SUY7fo1eLtLomSAjhW/u8PhC/UbQ6PDJckhMaXGvOMfnb2i/zYdZJ26S58h2H1H4sacWMO+CXU87wdnoQtPJGvWX3x5O8lR+XwjZZK6+2r4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RogA/2/jkzF61/fbnsLH7v16AFYfhoguWmOexgWw76c=;
 b=cG3AJDD/3YF9hK8RntFCx8Sn3h7vXT3nLGAXWm6kbB/Vd97FVSktHCJYugj4/GcxjE35Ua8BegICIhhXvFYumxY/ACWbnAS73d50MEovO8AgkV7y6Mfpg3nHJhziVyuSIT9eHs9leMMt3Ohu1Yjl1F2N36JZL4h1MGQdZ+HSohKzjN6zRVT3h+9hp6CGuCuRpB0/oL3yhAqlgnjmlCRZoST71hpmPvcqNqcFla9MKfS6Rta4uztaqHDLelzkbdopoLx4+kz/Hk19J97bP9ysurkN0X2o88DHt4AUTjjhey0QIVyUoNeV2Mz4IQxCMM0eziDqWQjGvMnau2VpZ0O1ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RogA/2/jkzF61/fbnsLH7v16AFYfhoguWmOexgWw76c=;
 b=Ji9+005H03BH4VWzXwsLm0gU6ngy/lgQjAOzncNzR5qkiYNmdZE9TsY+IKPnBPfHC6r6DgqjNyL8sRiMUPmSdHXdEtj1fae25IIcsFsj0mEZfjctgdWpOa0FNr29NAAp+Cmrea77ekuRhlCg+eeCoO77mp/zxp9KwA5H8mJUvmU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by DBBPR08MB10481.eurprd08.prod.outlook.com (2603:10a6:10:539::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:20:18 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 09:20:17 +0000
Message-ID: <c8470ae0-fd9f-4364-bcbe-282b2423bac6@arm.com>
Date: Mon, 27 Jul 2026 10:20:15 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com
Subject: Re: [PATCH v2 5/5] selftests/mm: retry migration failures for the
 full runtime
To: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 sarthak.sharma@arm.com
References: <20260724102431.1199519-1-usama.anjum@arm.com>
 <20260724102431.1199519-6-usama.anjum@arm.com>
 <15111e85-4143-476a-830e-9f7d47cc236e@arm.com>
 <a3ed6793-8285-4043-a0bb-10bd3890be19@arm.com>
 <6e2236ab-2cfd-4e61-98cc-4e4de9f76bd9@arm.com>
 <1c5b5101-1bf5-436e-a0dd-10b6cf81ff59@arm.com>
 <58b824e7-dafa-4a8b-a8ca-d38151c97df6@arm.com>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <58b824e7-dafa-4a8b-a8ca-d38151c97df6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0176.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::16) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|DBBPR08MB10481:EE_|AM3PEPF0000A78D:EE_|PAXPR08MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: df8461ef-70c0-499f-dd12-08deebc06c50
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|921020|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 FA6M+yByzLBxHrFmHqHmSFGFh2s5B/k1MoMUflQDv0/1sUgAPLWyMGPas9L7eIMW0zzwmU+kK3tTv4n7I7WJ9YPhABgN6x3DpVBg6chE9DhILbKCHENBPE2bhQhXfqIYiWVUkHlBPvdcvCpDeMELpT36JZNoGJvRN4Q7LXBjfYrQXn9SL+snyfuSX79G5uR1bOnHY1wZwwC3CuBUGXr/Clfx3Chz4CtDImlscchfvuiFJNF3J6/3j/4e8oSAeEHyhErZMZ0RC6+IIcUvoec23JDBaSO1IC2c00p56F6mfDgkcOdEs0jOpjAJhyPu4UkvVTyCXHrEF/3Ny4pBamF7PL73zMoVn6lsUTdsdFoCjYftSZ+se/Lg/WjMsqlIHdNXFMpGEj4Tff7vJl+Ad1U8t7aZXn1eYRGVidnKUOuKmY3o4DqJDr14YRm93qKsL9nBJ5JRFvFLbrPgx2y7zt+d8aaT1VS5YOUXY6ylOWPDFPbBmvtDGy5J9qTlJ9bocsy7o0r6MTW3rUnGBlVs1fj9FR7hn+jlrTIxG9SExcB6WApq0fmR0pJG7WOx1DoGp91YXjemCzo73RZK00OWyb1lno3P3Rcnwtz/Bt92ZiegNkZnN4KCU8FSGBcyHb+GZnDfq+4akE51YuwJ56GFAjKsb92qMtFssJNM9gub6iQqUWHeRIfVDeGzHXAYzoL1zBBynSd3wku+bIXouZiM+wSePw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(921020)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 jmgqC4OUS0SoFL6vVBSguW7/2wY+zuRZocYPGUYQZeoh7qGF4ZVnUid6bBXvvMcV2vb20jw/Y5BsS0c2BHTqgR/K9G5jrnp7rY0cBGoF8BaDHcQQGVQxRG6t5A2aiPCJxm65pDgV+isWK0gWvDB+gHqZYBVpHr0OoUFeCJMzluQ+ODBmcxB6vUM5eQMinxWVLdbZ9abymWKcxCllGCvXNUYMqLg7c687acDZ9g5DHVTX7cNZ8dqjDHcrkoJ1Est5epvzXQs3EK6plTpxv1TGZtP5W3MKYJank1fB2eQ1GNtIWGKInSx8CDd38etOuTkzCSo2RDkMp9ZWRTIAXzuxaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10481
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	222e5697-35c1-43f8-bd87-08deebc04610
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700016|23010399003|14060799003|35042699022|921020|6133799003|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zf19MNprqGTxtdIl3miuQLIKQUZ/MhY5EiMGC5JDaNs/H7OeEEXCFJYY94J+7pTMTMcMWbc9LLeWtKevMhi945Dno2UCJJQaTl1gVyEPPnEu/nMeNC9V137pJgExXji7lkU0LXn+HFq41yfhnipYUfgB+9voCyV9PRUERIbTH/atudkM9MLkU31fLN8Wsj5aEmKWG6CQeNnrRxGbwR5U2ax0IOq8qazFsoo2Vk03TTFl/JuzU9+8aG8TIePxDL904agUWqq3aOsBQpyxzstr0rPLcqMyL4UW9KYV3P+5IKVyzbQgVgQVCJP+r9yRirOZgxkslTgmIJ1+Eu7vEmGIXDykTL0m3uO7x4o9xdj/Hs0Ohg91LxWqhaHXCqqpD4JdnnTT3fAj99+hkOUZi+HD12uT5WZ2DNaqzuOQVDchXHrHc+YXUL9Q1u6dHvsRZiRTKsFgQapQ2SgrZJtrcqeZu3ViedX4rMoetM8rOuxqnyeCakWdWhkUxOrgqYXyw7IpLxWe3ePLRk32khZ5aPvJg90nrJWVNaYiJHToc3GQmt5APGLE8J4Cmv5cd4NWnL2vWZkr8PLNIoHbo0Z6Zc/MBWrcjh4789v1QB277XnB1rbK7EquhaOOS30+Xl+uX62zKizilqXDEzv4G0jFav/xYCYTqEvc/8ps4hUhJEJNGSM8+5c5yEmi52KL9AK6PPBb1Y2Q0rhs7914qzNCbflqvGDqb4flB8MoavAPjNv8Hi170dYc/QoZA48UITQLc0AS
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(14060799003)(35042699022)(921020)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RApM3Ifl4OevJx0C2tp7smFgzCfC6UIEryv5LMIcLfO/QCgoXkIKWbasdWNAmUCXwebenrjc6Dsx29Q1+UXlHu4Yi2VtfcuHNE56dgJaDXZX+EdKc4JHMLckFpL1MDqPW4iwK9XGdwlDKsz46+S43+RLJPaCe3IGFJl6YmzOJIQ/a7Y7W9aWCcMSAjVN8QqMrJ5FfqcZbLbG4FrCSQlv78xjaJKVMjnXAPBBe0ScTeCjr101xYhilPqleXE+xHkbqH/R89qtG6MxsPMwtMF1STusswPk6RkpHPhIjR+o7KElaKfqs8X5Jf+MRFC9WJPSDrjiB5VBD+qawFyErgiZYf+x63okqgANHK+o/fovHReJt1DVJq3T435uKymjLmVaBmo4OC7aOq+P3kS+RHXTR8rRa3v5iO0FuUJvBZ2mBNZLjFpkekiMvAjvSQPLKSf1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:21:21.5696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df8461ef-70c0-499f-dd12-08deebc06c50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6382

On 25/07/2026 10:25 am, Dev Jain wrote:
> 
> 
> On 24/07/26 9:27 pm, Muhammad Usama Anjum wrote:
>> On 24/07/2026 4:23 pm, Dev Jain wrote:
>>>
>>>
>>> On 24/07/26 5:23 pm, Muhammad Usama Anjum wrote:
>>>> On 24/07/2026 12:46 pm, Dev Jain wrote:
>>>>>
>>>>>
>>>>> On 24/07/26 3:54 pm, Muhammad Usama Anjum wrote:
>>>>>> move_pages() is best effort and can temporarily fail when concurrent
>>>>>> faults race with page unmapping. A busy shared-anon workload can exhaust
>>>>>> the current 100 retries long before the intended 20-second runtime and
>>>>>> produce a false failure.
>>>>>>
>>>>>> Use the full runtime as the retry window. Since the initial page location
>>>>>> is unknown, require it to reach both alternating NUMA targets to confirm
>>>>>> that cross-node migration made progress despite transient contention.
>>>>>>
>>>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>>>>>> ---
>>>>>
>>>>> Makes sense, but see below.
>>>>>
>>>>>
>>>>>> Changes since v1:
>>>>>> - Retry per-page failures for the full runtime
>>>>>> - Verify that both alternating NUMA targets are reached
>>>>>> ---
>>>>>>  tools/testing/selftests/mm/migration.c | 39 ++++++++++++++------------
>>>>>>  1 file changed, 21 insertions(+), 18 deletions(-)
>>>>>>
>>>>>> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
>>>>>> index 29f7492453d43..4d55a424058a9 100644
>>>>>> --- a/tools/testing/selftests/mm/migration.c
>>>>>> +++ b/tools/testing/selftests/mm/migration.c
>>>>>> @@ -7,7 +7,7 @@
>>>>>>  #include "kselftest_harness.h"
>>>>>>  #include "hugepage_settings.h"
>>>>>>  
>>>>>> -#include <strings.h>
>>>>>> +#include <string.h>
>>>>>>  #include <pthread.h>
>>>>>>  #include <numa.h>
>>>>>>  #include <numaif.h>
>>>>>> @@ -20,7 +20,6 @@
>>>>>>  
>>>>>>  #define TWOMEG		(2<<20)
>>>>>>  #define RUNTIME		(20)
>>>>>> -#define MAX_RETRIES	100
>>>>>>  #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
>>>>>>  
>>>>>>  HUGETLB_SETUP_DEFAULT_PAGES(1)
>>>>>> @@ -110,7 +109,7 @@ int migrate(uint64_t *ptr, int n1, int n2)
>>>>>>  	int ret, tmp;
>>>>>>  	int status = 0;
>>>>>>  	struct timespec ts1, ts2;
>>>>>> -	int failures = 0;
>>>>>> +	int success = 0;
>>>>>>  
>>>>>>  	if (clock_gettime(CLOCK_MONOTONIC, &ts1))
>>>>>>  		return -1;
>>>>>> @@ -119,29 +118,33 @@ int migrate(uint64_t *ptr, int n1, int n2)
>>>>>>  		if (clock_gettime(CLOCK_MONOTONIC, &ts2))
>>>>>>  			return -1;
>>>>>>  
>>>>>> -		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME)
>>>>>> -			return 0;
>>>>>> +		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME) {
>>>>>> +			/* Reaching both targets verifies a cross-node move. */
>>>>>> +			if (success >= 2)
>>>>>> +				return 0;
>>>>>> +			else
>>>>>> +				return -2;
>>>>>> +		}
>>>>>>  
>>>>>>  		ret = move_pages(0, 1, (void **) &ptr, &n2, &status,
>>>>>>  				MPOL_MF_MOVE_ALL);
>>>>>> -		if (ret) {
>>>>>> -			if (ret > 0) {
>>>>>> -				/* Migration is best effort; try again */
>>>>>> -				if (++failures < MAX_RETRIES)
>>>>>> -					continue;
>>>>>> -				printf("Didn't migrate %d pages\n", ret);
>>>>>> -			}
>>>>>> -			else
>>>>>> -				perror("Couldn't migrate pages");
>>>>>> -			return -2;
>>>>>> +		if (ret < 0) {
>>>>>> +			perror("Couldn't migrate pages");
>>>>>> +			return ret;
>>>>>>  		}
>>>>>> -		failures = 0;
>>>>>> +		/* Migration is best effort. Try again */
>>>>>> +		if (ret > 0 || status < 0)
>>>
>>> Also what if you migrated accidentally to node 0? In which case you
>>> will return a false success below.
>> What do you mean by "migrated accidentally to node 0"? Can you give an
>> example?
> 
> I meant it can happen that ret is 0, status is 0. Then you will pass
> "status != n2" and the function will return 0.
> 
> So probably just return -2 instead of status?
I see. Interestingly, it seems sashiko caught the same thing. I'll fix return code
in the next version.

-- 
Thanks,
Usama


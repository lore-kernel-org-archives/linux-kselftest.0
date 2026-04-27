Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013028.outbound.protection.outlook.com [52.101.83.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC23A382A;
	Mon, 27 Apr 2026 08:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.28
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279854; cv=fail; b=ptfErPKykWqnOCWYiZajVNk7vR0vZvE+ihfZpquT39LWNsq4b/OamzeFKO1H2nIKU51UuhuvWRNPH+4dfcnwq0YrDpe563z4J1416+yBozlXyZeM1rKoiN6Y9+drqNN00QNsoCDwWvaAmFBPwd+RZPLRGN2S2gNHr5TTisSH25g=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279854; c=relaxed/simple;
	bh=Pb5XzyCzfBK7MDj6FUMcflq6K9XvQeZWkXLksvFehTc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qe1fTmSrr7oi51g87/S1zgnk4eH56WzAKwLuEHbuTAHhDTLGtoEjAkwMxFP+gKKp/ME0+89ShA/WzxA9Es4aML59+1i3LkaND6s1EyPambw3fXy7sW3nnQRQfnDacWUU6Fe4RDZrfrJCBetdi/3TmFTTmpSmKQInbee3lExyAEY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HteeHGJn; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HteeHGJn; arc=fail smtp.client-ip=52.101.83.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HteeHGJn";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HteeHGJn"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QenCz0sWwLONJZT3J5ias6iI6tV21drNmIEZdewd+0ufIoNgOJ9BPUP8rbO8TGPtXaYkbOJz5vFsBKgcSpUeGtGoWTyO1IKSpHk39zNdZl/nvYHX5XhT9s7K348d6f+JTP53q1ryOALux4wSgB2tS8VfL76438mOx6boVAgFSDdcNADqzqs+QYwaKpPpXFxoi2/ixta73yDhsl+L10gf3Iv0vyOJza5JgzavycFWxWgz4K0TrxhrSAq3OHh6v4daxUY0FoWHf0iq5qHpRVjUD+WQ+SRfqtU8ANwtQZUAoLVs2f7a76Sz+GrpdpXn6Fwa4GNKi/uR/JavFfUk9AxN2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mcdy2g3ptyrTz4NAYhZK9zgdwqqUySFWjWGsj987vHo=;
 b=NIcNGALaaqJ953ZRKy5OgHOW1THdxUlbRyAT4HuAh9Ntth56OgJb7Tgy1F8zXfduLRyxHvBM5xgXwElcnshmIFpJBwLDLn+MZw0UC6exa/Th39ZFG/AW797b93ouc6PRQHhbUGT8PI5u57mjJPdw+qC3+MQ+lG8c1nW6S3/PptC29ZQCIdvOF9iLXM4gpehgZkSbbjyj0H6lYEHCG5uoMeppV83cL0a4m2LywVN+LUbAJuiOXS6oacqxOspB6wWz7V+o2PhqqfStAqhj3kLnCQySPcFT3XYh6+EkVw03f36O7QvegRWLR9Q6wQgVP08sG1Aj5/kbM5O+a9wN9yDFog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mcdy2g3ptyrTz4NAYhZK9zgdwqqUySFWjWGsj987vHo=;
 b=HteeHGJnuM56BMKKfM5a29ebP0mh42wMl5sbODW/KMypO/vpbSXZ21LuamMLPeC7jbsnL/TjzSx73YBYQYAj35V/M0v3LJVKdBER9HvMowfe5CdkK6X04RJ97/Bo3W8Ho+LhLceYKTvkfT2Opu35RoJUXNfxoM2oePn8u+b3yVQ=
Received: from CWLP123CA0099.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::15)
 by AS1PR08MB7516.eurprd08.prod.outlook.com (2603:10a6:20b:483::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:50:39 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:401:5f:cafe::37) by CWLP123CA0099.outlook.office365.com
 (2603:10a6:401:5f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 08:50:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 08:50:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChWFPa/p6DBxLFm1Z8YBRt4hmhe46gB9tJTIBYA+OfXMVFO2PdsYskRF/qZG6qiWL6vIos3LJtbuoRZgtPVhhEdcQO6HT4+5OQ/dMKxFsTwEyPI9JvZiOFTO+Hhd+6BJzMZGMFu843qbhTUMLJP8UhQgTOvGZeQG5W/KMd/l1xOOSzUM/Apda6x8cWSvK5UV/K40fX9DYbQbOGTXe5Xzqm0zf4ScDSE7jY5O+josyCjFTGQJewbWw9Sc7zmLD2nAfgH1ztJ2OWO4Z5ikHAjbpsI0oipG4Fz9RHYiYRgNrAzKzR8S2LLC0CR3T2D48zVJ1NBCdrVp541hxdQbLQnNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mcdy2g3ptyrTz4NAYhZK9zgdwqqUySFWjWGsj987vHo=;
 b=RwoY/JX4/UjdaPAphwmQTdkEpDQYTtWbc8xHIiTWm1fQcfNGXm8XTAl59d5kGckuq6onIMLgejj6uk4B9A9Tu5ThqsRou33czGOjRwVwlDhnbijORW1czO3M2uL5iQTUdlY2YljzbFILizGix38soIGTj6XFWhbsB8u7JrnvVNRx/JrM28MJjT/wwoKaU9An70X12eUzeK3pZW9yTl0hW5Wf0EMtkBn9Y7qc6GFkGmLbxArQEolmQamLxEdWme8bHqrTU7xqbyFcWPWqqfANZ+7E1h9OH25prU1Kq1xlhBNzVbS3K8+JZ7O1G68fpAax4Fj080YARyUFpVQS8J5T3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mcdy2g3ptyrTz4NAYhZK9zgdwqqUySFWjWGsj987vHo=;
 b=HteeHGJnuM56BMKKfM5a29ebP0mh42wMl5sbODW/KMypO/vpbSXZ21LuamMLPeC7jbsnL/TjzSx73YBYQYAj35V/M0v3LJVKdBER9HvMowfe5CdkK6X04RJ97/Bo3W8Ho+LhLceYKTvkfT2Opu35RoJUXNfxoM2oePn8u+b3yVQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by DB9PR08MB6731.eurprd08.prod.outlook.com (2603:10a6:10:2a4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:49:34 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 08:49:33 +0000
Message-ID: <4d25a566-1e37-4e31-b304-8fa6ce7e3ec4@arm.com>
Date: Mon, 27 Apr 2026 14:19:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/53] selftests/mm: hugetlb_madv_vs_map: use kselftest
 framework
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-11-rppt@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260418105539.1261536-11-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0207.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::15) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|DB9PR08MB6731:EE_|AM4PEPF00027A61:EE_|AS1PR08MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: b2611cd6-2e8f-41c3-2f4f-08dea43a0ea2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 iBkjRjof0DPmM6GeVlgXFOUcUNhAS4EOWRMHIOVFo4uNUfP6ltMgrqi+EmC0I65cyC+vf9ctseX76dxcyNiX4Uqzo8MZ9edunlo4K1pyzkD8fElt+5Bi/ASyogekN3p3uGnbD7EUi6QBXH0aDCEME4sKRHELPcp+Rs+SVNTN3rmh9bSx2LBGxNRLXVGMLD4gDRvvPqVcUZ8HhUQsrmB4mmCfc7P9x1Hkq07lGi4f2ausn6byY3XhLqlNB5dgugdddrUIiCS54RHZ1D08MolYgv16SGwK8XxZ8qUo7IJoMPJdkUuTe+cyEKhqml2UXCEB2t1x9JXetUA0nrrqR8fekyvvLfjrrl3aUqq4G1Gd6QNDBWERp3PrDVOexkbo1e5oY1AoZ/a/ibb5A/9qJGKjyoeEFKoKRdKynEq/4ALee9JClbxby7lhbIhT4BNRDQNgjD+DcffbN4ZLhoQaiXs3q46eVgMObv/HnRMi/VWjaarphgTFY0T+18xTiRZmQ5jautzkj62Zj9vSF+qxbi9343RnpAmfNdQyHJGx1EtNBDUv+shVAPfMItUhwHOErGQ0ZsG9wwxiHUCrYgCo2/Ht/vpti9rekpvdMpQqjCjvw1kQiHfEdEzkaRiUTObKRSCgVjEYUZOA8tF5hvCTIPBydxRLgvepJKZKZ7LP5x4/GnSUsIYgosXDtpRoEPwMFCerkpKgnWPJykst+sqIipx53I8EawFAaF0OD7X19hOTN7I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 hqd1jR2/rMjHuHYOMdCzSSybjd9Q6BCQ8t/TPARuImpAb91LRGkjvzyV+lyyZRw1vSq3l6ydPOGTjuXWSyFrX8CkJJQHDV3KB0xbI9+wLfVYW2Ri40fWWbwIdQ8qG1j/jWfOlEyTnJRUc+ccmM9r9QFILE2FPJ1uZmwn2AWkkVUAHtsyvxUAFBVm0A6MB9DIhGxbTTqrBw0h5NahdmzhbtB7g3N2ilk1f4ir/6HsjR8UFJoEzP4vk+PF6MJYLugLpB0dUAEJhtyMTC12//DBbCtBLUr+LgVO3RyJBarSCEVgYSBAEPhmfiRok5rR9hMtQ/3f79fMSZrYH4cq330Y5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6731
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5229e5e2-cb99-4f2a-d9c5-08dea439e758
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|82310400026|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/LcdUsxa1/JugzCZyqsDxB6Oq5riV92xZnybmGUsUZkT3g6il+C+1X68VZOG+3j+W4nYd0aC5jnRuMpXALtIvTKPi9D04tZA8cRL2OTB4wJCa/I4sOK0QNHm2jQHVhATWZQJ+qIwzL5zpBHL6Lwr2xYOkiINNg9ScLFsRFhxnMvJ2EOT7sqKV4izrbQOupS9Tf2AZH8jARxqB78Gljnfej0bD2yqkKk+Y1+YPI7feIy1/nYdIm+rjK0cxECRZpWVX4SIKk6F8jeBgcY9pBDkVq2358w8Jrq9NiGBzgc9Tr2OwXreNLgzt85miIOw+FRXqtgVzjB/lNG3zULTjR2wKNFpSlJuvrASLsAQjY4k3DpXRtCA3/GOZ4OAp/C+adWQG6RW0zTAIbBXmCHnIgC5BwcnKvPihducfV2RYSgInA9r8hQIwcYZBFJUozFpBpq/K97t7msa3hAmEakOLHKg0D/6PqfHrFLqyygApr2JqD6KP7aLL2cqyANUuBPCCvgAi45/xDgHtzFSJI0VuefZdJo12b/mPaGspvPMW1b2EnSVzFLu54rwS8cQDI+vdXgzHTO0hKfTbdboyQaoJQoi6atA2fxzU9LAkibDXZ9EcC70uzSO8Db0quHjiriYlDWqZrnYgO6cVaP0yFJZWIWFioeg9jL7ZZuaH7B4IduzzNE3HH4L7Mf+OzrJEupgk7NOcmpQT0+lPWbQYc8JfD9fo57NTCm9ndOZ054XhDl3ae9z7FcHYnZX5Rmx3Lw1QbMs6m1I7u90I+01zou6CtHd4Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(82310400026)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aevGnhbJjEBnW8Oxnl8ZG5aOO10/EC68OUpyVxtDhRqSP9FZuS776NnF4tRXhVgVLI+OrQEqoKvOeRje84VKtj2ropntvaHhNpcYyVjGvuwKz+DHGuU+H9lOcyWhxFw7B9gNhxJRK2aW2hHcGywaZ2QMWEpxLjdj0f0C87mZ9evEd4rHAoXOXy/jvQ5+qQBvO/yWgOsmUmwLVYrMGscODmmPG/rpxQXH07o8umnmu8hAQt8LDCkbEWOcHB8Sb45szV+FiJO26lgae2QmPDmjm8bbOr5alP/i2Z2IvHOJjq2lePmpQYXvsV3yruiOLcO+47CLyzdqdFfpsNJ7o7Z8X4m+gkTPhOsVqNpmfF86P9TKFGEHMUCRCuiBAQFpJB9YjdH7vSxiAkLVl94Q0hy7kXb1IJZI+tvSMAB5GB6MzehG2a2TzK5lWvbae9qVdzwt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:50:39.2823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2611cd6-2e8f-41c3-2f4f-08dea43a0ea2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7516

Hi Mike!

On 4/18/26 4:24 PM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Convert hugetlb_madv_vs_map test to use kselftest framework for
> reporting and tracking successful and failing runs.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  .../testing/selftests/mm/hugetlb_madv_vs_map.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
> index efd774b41389..c7105c6d319b 100644
> --- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
> +++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
> @@ -25,7 +25,6 @@
>  #include <unistd.h>
>  
>  #include "vm_util.h"
> -#include "kselftest.h"
>  
>  #define INLOOP_ITER 100
>  
> @@ -86,12 +85,14 @@ int main(void)
>  	 */
>  	int max = 10;
>  
> +	ksft_print_header();
> +	ksft_set_plan(1);
> +
>  	free_hugepages = get_free_hugepages();
>  
> -	if (free_hugepages != 1) {
> +	if (free_hugepages != 1)
>  		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
>  			       free_hugepages);
> -	}

There is a comment in kselftest.h which says "
/*
	 * FIXME: several tests misuse ksft_exit_skip so produce
	 * something sensible if some tests have already been run
	 * or a plan has been printed.  Those tests should use
	 * ksft_test_result_skip or ksft_exit_fail_msg instead.
	 */
"

When I ran this test after setting nr_hugepages to be anything other
than 1, I got this output:

TAP version 13
1..1
ok 2 # SKIP This test needs one and only one page to execute. Got 128
# 1 skipped test(s) detected. Consider enabling relevant config options
to improve coverage.
# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0

where the result should have been reported as ok 1, not ok 2.

Seems like there is something wrong in ksft_exit_skip(). Should we
change this ksft_exit_skip() to ksft_test_result_skip() followed by
ksft_finished()?

>  
>  	mmap_size = default_huge_page_size();
>  
> @@ -100,10 +101,8 @@ int main(void)
>  				MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB,
>  				-1, 0);
>  
> -		if ((unsigned long)huge_ptr == -1) {
> -			ksft_test_result_fail("Failed to allocate huge page\n");
> -			return KSFT_FAIL;
> -		}
> +		if ((unsigned long)huge_ptr == -1)
> +			ksft_exit_fail_msg("Failed to allocate huge page\n");
>  
>  		pthread_create(&thread1, NULL, madv, NULL);
>  		pthread_create(&thread2, NULL, touch, NULL);
> @@ -115,12 +114,13 @@ int main(void)
>  
>  		if (ret) {
>  			ksft_test_result_fail("Unexpected huge page allocation\n");
> -			return KSFT_FAIL;
> +			ksft_finished();
>  		}
>  
>  		/* Unmap and restart */
>  		munmap(huge_ptr, mmap_size);
>  	}
>  
> -	return KSFT_PASS;
> +	ksft_test_result_pass("No unexpected huge page allocations\n");
> +	ksft_finished();
>  }


Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F1A3EAC68;
	Thu,  7 May 2026 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.22
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150044; cv=fail; b=LIFg7SgpGa8JP4PaH1/z0eflJmsqPGvVh7hjCDo/JqCZWp1ddA4b2HGpsGG5RJHSCVa7hhAHoZs0lTFj0lQudVxiUH2rpBOZtWEXHjTl/h2xTkZvdTgv3B8SBmZ+y9WoedMFbzPn8CsQxcAbn2JpjrWGmIUdRnD6ALlxUCJ7mr0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150044; c=relaxed/simple;
	bh=yElPhgBNp3oUD/XJ3rmJcIs37txMTIYQwsWYTrItHz8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dwG76jcw+IgZ/+Iya/LORWcQdAlfHxAH9AQCWIlhXNngztyk7rvp8Lbugw+HGJxb30b2jb8BD0c1VsFcbCavst7az9e7fUcQAQSOiaJ/3hP09aeJF3vh/sQOrIm114u63wht9GAvqcMqv5IXXRKAwpC4JZFoTkdO2ph/vY2K+e8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XxN9RdTe; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XxN9RdTe; arc=fail smtp.client-ip=52.101.84.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XxN9RdTe";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XxN9RdTe"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EBjkxOifDRJQS7oa8vNJHCfHZtcr0mDLH+60d6nfE3uEm+YrzIQ+rSBP4pOKroXVXsI0nNJwgrNk/CXIc2MEg05lZ03Df/Bdv3c88s+94euf1W0uIz0TElzg40qJlmLLzklB+/vy8w3tGjC7ibLA0rmuXhoRzU9sTYui6/0xX9rX3c6YR1w8UIHb9vlZjxFb3+ziJ+BBeNmprZIn7Mu+cHyCA8DMJlPIDBFY5yh16IuEfSc18PuVL6Ej89pGWtOAnznXkolAnkkOacCv6huPp6hjB7mzezb+P5W9VWlgb5SqHOY8GRsOyyvAvYvfnq32ULSq1xpurEOEBGyYn9/sjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22foA3dwaYicG8ahxWgLgBKsI0ETZG+yZ+dDrufYEqM=;
 b=Acu/Yvq17TGN5kdS3j47LxfFoblmdv1Nsw7M4kst125bzn5pXlTGJtz6uX5rN3p3bowUgHPhUJMlWK2L8bTK/kAV4lxSkMi2txMPkDF1NuJAQKu5E75XA6kc30yRKHmRZL0uF3fPxPwg2xkJS00d2qxTa7ArFrPrMQR8k0W+K9/90T07NWaHQ59NceNEzx5FJna5qW/3PnQfDsjjRfjR63JOckYu9dSo1D290WbdFr886A4pJX/+5eKjn17G7rRLZk0w5sVfy9jtQTNMXlcs6Fq29q2Cnkk5GN07h4hByuh5g176zJ0GC3a16jrAKCk18DmSw6SZi443ft1OL22Uzw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22foA3dwaYicG8ahxWgLgBKsI0ETZG+yZ+dDrufYEqM=;
 b=XxN9RdTepnpCJou9HsVqTUR6xr8M41CQOl3vhTY0BH1tk3wNlU4dRjGMfDUP1SbmEOXddfNEalV73L7HoxVcEIH+T0Ivb22F4wlrsIdB6Izk5py5VvlWexFCJwt0Mzqr5W28SsyyNPLXJDT0634HW3JL+aVJoXLl2HctZFUY3jk=
Received: from CWLP265CA0296.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::20)
 by VI0PR08MB10488.eurprd08.prod.outlook.com (2603:10a6:800:203::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 10:33:56 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:401:5d:cafe::98) by CWLP265CA0296.outlook.office365.com
 (2603:10a6:401:5d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Thu,
 7 May 2026 10:33:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 10:33:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMBOxDbMKybPpGhbcjYuKRWHiEEZ5RVtOl9Hg5zfUe7A0HwdSDOCfXzF2d9MjD/aH8ISrgzTuT+ybeEHMke+mEe41uEIrNN3toLsCFFEGZ5dY5DNiQorJVNHXN+T8sTlDLAqG8cP7Fr+QDeeJjqC1HgPqcIfYyKUZYuQci4nDP40JtMA+wgP/49hwkISaVPzS3r90UYg0DyArZpFRgy3HycT2qVn9HO93+Z8qduprnH9k/G6cZ/lmlCeAZQUvOW2FG7lOAB3cvtF0oQ6r7LTjy0f1FgEUp4St3lmaNwjfkBQBLLfg6Q82pJ3aZUslDFjepC4vZdEgaM0+0peSGfgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22foA3dwaYicG8ahxWgLgBKsI0ETZG+yZ+dDrufYEqM=;
 b=ouiuJ+Jq2Cm54IPJ3RJx4dr+Pxnz9agyRqVhx8GQGaOTXN/cnycS/HI8txwrDyAp+7/fxMo0GBL7r4OhU+zPJUpqnOHzJETtYjdgc2vFu3jGaR2GuPnQumgleFOIsF3KnJ+FoR+DkuuzwLzhh1BvsjujzTblxA9qG6ausfLPUoY2GP8FabPs/9rkbIwCX9od8+FRnH/UiCy8xlcCytY6ZTsN/EjUQuuK5i1Pufj3z5QAvPw8wTR9mPkpzxb9ZQzwkXjG5mVMi6rLKZR3jM/0u6uc1iEBYF067syjML+Vo9qXG9PkNqJKW87LRkmykli2EDg+6lD9z3q3GxTqGwvSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22foA3dwaYicG8ahxWgLgBKsI0ETZG+yZ+dDrufYEqM=;
 b=XxN9RdTepnpCJou9HsVqTUR6xr8M41CQOl3vhTY0BH1tk3wNlU4dRjGMfDUP1SbmEOXddfNEalV73L7HoxVcEIH+T0Ivb22F4wlrsIdB6Izk5py5VvlWexFCJwt0Mzqr5W28SsyyNPLXJDT0634HW3JL+aVJoXLl2HctZFUY3jk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by DBBPR08MB6267.eurprd08.prod.outlook.com (2603:10a6:10:20d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 10:32:52 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 10:32:52 +0000
Message-ID: <49b6e371-909d-4d62-8402-5f0fbd5daf86@arm.com>
Date: Thu, 7 May 2026 16:02:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 38/54] selftests/mm: hugetlb_madv_vs_map: add setup of
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
 <20260428204240.1924129-39-rppt@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260428204240.1924129-39-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0233.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::12) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|DBBPR08MB6267:EE_|AM4PEPF00027A6B:EE_|VI0PR08MB10488:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ef4c3c-6063-4c20-dbc8-08deac242450
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 nSJNxS0dl9ZBrCokdo8cTtJLgYQzH8Z79xF+bXJ8kZ/OnpLvMZnR//MzqTWhePzk5miwb0rGa6qUSuuRJHXNq8u9QRgJvW6XvS/FEQCI3CahAXLb/rqDT96cOE71CAVHkO48rlPw42qPQuCd1P1HpHNjQcYTXFfKP+vVcehiE+5lu6M/i5VsCUNIbUbZvlgu58dM5y7l6npN7CgG1wc4HSCSKhcWRWYgOj+wz40KYBGlP7LeZFJi3pq6SJ86SAF3GsiPCVlKZUT+cRDertfixhOPCzIlaA9ADbk/KhFzNRfZp4x0Hl9hEF2wzZ9g8PewTR2FWytW+dxoHeUuCzkf9GP9JoIq1oTin2dTQo7WLSKb1U2paiA/5y268ggr9BbsSL1t4ASpRqxPR4YtIEjEXxmf8dDQNZPhGz5J24Is+Exqr/rI262CaHMmywd9djHQbBtINoLV+lBeEsN7smV8NlDRHfymIZa8GlEeUxwm54o5fQnLCAgmZ8zgWIATgZNZ42MhDEKTGHM++GssrEbRoOd7LUINTQPfQnr9ai0tOaNy9P1OIB6C0XbUiNdNqAA2la8ugVmdEx9GpvLr5UxqIASgm3NaOamyjhRIQxBYgc++VGxF2fKruj9IxwwHJODTYkbR6Yop2mJoVKfU0/LQTS42GdlzZlUadxRFZ5W3W6J/4g/KsVsOOsXX94szra6j
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 aSTG8M1EhO/eIi8T70NKXWlBPK4WFBQcuKyL3mzX6SXO0aCRGcZnMdPrgLNqEkDAq8GRDr7PQH5PrDlPp9dkFqVcn3BKrvFrzPz7bYlgGNPH4+liK6TU8s/SoFEnezTML9Rhmsz9oO0pN9jApFhxLowPuowdydM2+NaUPlwLx4MGxvIKgD0CuCND/2PDaMCSoDqjZjPj76xH6IOePDDsAGIYyIKuWo/cJl+EAK42Xg09N0ZEUYCo7GjX57+ZROKDI74zGwao1++JsmN6xcmdfUYbr0ESHJfMvtqiosNUqhRdiUqVKGceBLU2VgH2fRj375cAFDwzYoo1u8eJyqswcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6267
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6373f1d5-8186-4f2b-d2f2-08deac23fdfc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|82310400026|7416014|35042699022|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Bt1P6GIBU555QtCautv7af6CaKNVv0GdV+apaX7Vl6mxcZXaVTyisNElI4Bp+SznHgYGC+MNKu9iFvkBMz1VrgzxYURGZGrMWRpze1y2qWXiwz7Y7jzQoT7UQIsVSWxXDv5868LAGaGO2IyRTsJQGQtndltiF6ux7p2dlQbVuEgoPQ5xSzk2AW2i4VM33Rh4zfqJx81+kr09eHgI8lmfBpo3gWeRJYjvRoRdOQyyb66VYAeVtL6IMOzk/TbMymbew4RsC8TYSSk55U1rUmf2T2FoJb60q+8yZ2xo5TQRA1iZvCOdVOAVrgr2iprMBlbRpTM3Otavy1US/sgJt3jWx6bPtBqBT5dxfAmmXROhGQz1Wc6WqJsfBKJeLsYZdAolgyCOEj//4Rdp0tq8wNpLAx0gVPm3t55xaX5lm9rJL2zowGhYP33e/FPro50Fm+XBpb2tQK/BfexQzEfLHX051IhcqGz/gq8Qjgpp+MeGnK3HxIfb4rMs2M8J+Ey+U2AiGL82UK9pxzZRbLXUcIJYrJxvxhGkM8D8VKLKBQGcKRmibQSngiq+jTWDL9HbqYtYmzh6nHT73LqHB7mgqPQ4Duyjq9jOCrEMLildpP9rMpN+kVmRoOSOuprt5MXsVpoz64nLt+y/Eyhu2izSTYEs9CyenhY0RW1+doGUww5QRhJ65Va5ONw2fntD4pKArO+Svjy9PaDJmQppeif0KUxEXjJwZApvyxld0iD9uDsjWUw=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(7416014)(35042699022)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HGpezJ8BZCpBHsl2UZK79YFuuG7v/fo4ZnBkQktrkdHTkQTuqrCZQlQ3Sm3wpS3T9d1NZpe+atKDxrHpctqfbqV/b8dhEP791lEWtHvDqh0FQfPnsnNWggfit3OsStahKn+1HJ6yqLq10ikvgfs75kN/lNiNFXkviXhcmK+H/xVdtNwkQv91ZQ4oy7tGJejQh7ndvRd0Y4xMjubMXidp397etlf0LIwtiEF30AYhsO0DQNnc7O0oaHG6Fc7xUyCFltdsN+YLjtWr/bQ7uC72Q4Yji2GK/gnNPh/pbfAKx8ckXHMzVaISdLR0TcCTYu2B7eufkCReFxbdyzc4Mckr+GTbjA2b8dLbCbGTUHkPACwdSgNAohO7/nNtg8ctcyFTuYRZGXE9LGWs7DMy17cX6RwJT8SydHMuRW55HgmZw5jVRMuY4R8oy/9622sitox6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:33:56.0341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ef4c3c-6063-4c20-dbc8-08deac242450
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10488



On 4/29/26 2:12 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> hugetlb_madv_vs_map test skips testing if there are no free huge pages
> prepared by a wrapper script.
> 
> Add setup of HugeTLB pages to the test and make sure that the original
> settings are restored on the test exit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

I have run the test before and after applying the patch. Before the
patch, the test skipped if there was not exactly 1 free hugepage
available. After the patch, it correctly allocates one hugepage and the
test passes successfully, restoring the original hugepage settings on exit.

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>

> ---
>  tools/testing/selftests/mm/hugetlb_madv_vs_map.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
> index dfbd71a7f709..6c95dd23ca81 100644
> --- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
> +++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
> @@ -77,7 +77,6 @@ void *map_extra(void *unused)
>  int main(void)
>  {
>  	pthread_t thread1, thread2, thread3;
> -	unsigned long free_hugepages;
>  	void *ret;
>  
>  	/*
> @@ -89,11 +88,9 @@ int main(void)
>  	ksft_print_header();
>  	ksft_set_plan(1);
>  
> -	free_hugepages = hugetlb_free_default_pages();
> -
> -	if (free_hugepages != 1)
> +	if (!hugetlb_setup_default(1))
>  		ksft_exit_skip("This test needs one and only one page to execute. Got %lu\n",
> -			       free_hugepages);
> +			       hugetlb_free_default_pages());
>  
>  	mmap_size = default_huge_page_size();
>  


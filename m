Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D594D3B47C9;
	Mon, 27 Apr 2026 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284839; cv=fail; b=lnO/NItjV/fBAqjw1fs6D9v04qoDe/sBaVyzHRxjUcuj+kHLaANIXUgTr0azg15C8I2v98qyeWVd/vUEG6ynr7eodTDmFB+ePdj1sXHgUZ90vsZK0i6+jCwf2ik2S8cO3A0q49v0z9B2kjX1pTJgLBDYiMTaYloVb/t+ZRsisBU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284839; c=relaxed/simple;
	bh=te+cJZQkwqPtR1FyYcdZZP+74WSrw+uJ1NGbb/psJ9Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pw7HWoyPZzXMJjCB3+T8w9ZweedGdJmLGdTNX7CySgqtEe5/FuKO5HSuqPPqjPTUHcKAxAlWqyJtacHSiZDUvR4eQpes8oT9Q1MxezX162iGQJk/GaPLHEn/TO69+sFK+gn/J6XJYm10mlec8sXcJ3YuUN9xtZAg2Hlk/XHxbAg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EZtehXAc; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EZtehXAc; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EZtehXAc";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EZtehXAc"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MzqqGbrp8TlGzvKgwvxsE3ITMPJsrCbOkJANmlFyiTwWQ2kK6GgnLPJEsko0t1Ir0CnAhyj61+yuzsdcFqjg6cWo+9YjAWmF0usNgrKfClnquz/tKpOJ9hjNGle9ROJwF9FSa5t6OCgZRmqm5q1DZDHjpHScX8hrrdG8aG7plnDQoxa65T2AHaxAZABVMXkkhnkJx20szPrUGNTcnKTjWZSKEggxNXFNteFjQZZY5nNxSBGyn2/KQCUvSxMALOTmIIc4vXorUaOQDuTAN4qrzVAbh+EpRW2Pq7RtzVBFyU5s8RVb3vvven0+5dPrrUWINU/ZHJZZe6lYL9GA2cgqhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n/A17gmF85hbF/APO/XsBmCzn+iu/V5nFQtqBgOXP0=;
 b=mFNSUaO3kfL5lsVrotXYC8W5J8Rp/hlWQQ8+GwoHV6EuQbumisAykBtCiTNnMkDlpmz4WHkC2Y5R5amjwXhrqHPCuX4OMtAp0WyUacVWV50jH34soSHbj37SF7c9T6J8Wzu3PRb2WEGVOuEE+GyZzLXSvS77XxAmIz2HO2nfS5y2ORB66IbfaHID8ml4CtEqUjRgPZh0kIUs+9Lh2FgH7voUAbG0IgerWHbTSs31h3uosYSzXNbOFNFwrD5QR01uVdFmjuLft1U2Sns437cu1vpFiUlL1TLzOfxS3tZhjvZ+rvNRk8NbHbU7tY988h58EUWRJ9GIahmGv8p3zMQDVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/n/A17gmF85hbF/APO/XsBmCzn+iu/V5nFQtqBgOXP0=;
 b=EZtehXAcLXF8IL3Q02/jkMPE0q9ybszAgZZbe03gmLmzjVQgd/81VRyS5vsvEspaK7aa1DkVMcdWkoZjRsBdIlwmV9IuRRzCVunFMxDga+3oTdjwc+aWFd8mF93t+673avOwD4Yk7UsBzlcGWFuTjJLYIDJxB4kuCrtfs4HjSQY=
Received: from DU2P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::35)
 by VI0PR08MB11222.eurprd08.prod.outlook.com (2603:10a6:800:254::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 10:13:48 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::bd) by DU2P251CA0023.outlook.office365.com
 (2603:10a6:10:230::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 10:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 27 Apr 2026 10:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVr/4FRHGHvUVxhT8CtM2xt/qXcc5kilYG3svtVJZ4I7EN4ioKD1WOuDJ6I3YViuTAUeYOLcUlM7s5nlJXsc1AeRH/e3VrY5rzeircTj4UQ2Fekj/bUdHeaBfH/nHI5WL9dQzViT7VzKWOW0ZGFSk2ehAJhdwbA+CQ/DUJdfMpRu6WG81wpZBkIhDisx20BRx7Vtzu+fny+mEYOXgOStR9fksK+w0cON5umLsG+/9tzcAERCNcqi0D9vSk3PCeN0W5CF+P10HN7DjfvR2C6yjhD7fVe0b33dy6r55Y+9ApXEYZkPK++zLOfE3QucXowjDx6gtyFJ+NhydJT6QxhFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n/A17gmF85hbF/APO/XsBmCzn+iu/V5nFQtqBgOXP0=;
 b=P7QHB780/KNwcIsUBVbddSRqfBDucpBJdUKTPKWRAjSelq/VnvP/jLygmb7P4SGH8KS7qhXERK80siJUzYSMtrhZYBrw6pf5v6KsN9VYchG4oOyOEYVUyHO18EXleYFEy0o/FhRe+amEaFV7vg+18RWr1ZOQA/CaED0Otqup25j283dtG/4rjgtf+KomHv31hfdeBXXRy+aZS6+DeTC6he/ncG+u9vTrPe6bFUY7QI6A7XrPYOo4ILqmI2K1ZmMDU5rIG9RGGxnzQPdkAT7+qG5qlKih4gZc9aE8wivG7ef5VJNp/CJgKK/VIcR/6DCgonn1LQrwCaHV4nkcIaihyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/n/A17gmF85hbF/APO/XsBmCzn+iu/V5nFQtqBgOXP0=;
 b=EZtehXAcLXF8IL3Q02/jkMPE0q9ybszAgZZbe03gmLmzjVQgd/81VRyS5vsvEspaK7aa1DkVMcdWkoZjRsBdIlwmV9IuRRzCVunFMxDga+3oTdjwc+aWFd8mF93t+673avOwD4Yk7UsBzlcGWFuTjJLYIDJxB4kuCrtfs4HjSQY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by PAVPR08MB8968.eurprd08.prod.outlook.com (2603:10a6:102:32f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 10:12:42 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 10:12:42 +0000
Message-ID: <f1ca78bf-f33b-44c6-b67d-17865ab6ca8d@arm.com>
Date: Mon, 27 Apr 2026 15:42:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/53] selftests/mm: hugetlb_madv_vs_map: use kselftest
 framework
To: Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Donet Tom <donettom@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lance Yang <lance.yang@linux.dev>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-11-rppt@kernel.org>
 <4d25a566-1e37-4e31-b304-8fa6ce7e3ec4@arm.com>
 <ae8wUSJusD1u_grJ@sirena.co.uk>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <ae8wUSJusD1u_grJ@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|PAVPR08MB8968:EE_|DB1PEPF000509FB:EE_|VI0PR08MB11222:EE_
X-MS-Office365-Filtering-Correlation-Id: e5459b11-afe2-41ef-5961-08dea445ac7c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 uPJnd13ITeGz89gprwR4ZCzJ+0Fk6FBEzIbcfGpAaaN+tAwJKK8VHSUbKcuzvD9GiuVALQRtrz8IHejIspjdk7FcexkocfoV+NIpsKy7SLpTIVUyNUrHOoAuHiYr/IxEUrG47/pZXa6TiCkcyvg5/gQ4oIc3AtFzKYSNJwX8FBktqO28n89f2T+svMib36gBNcYDCIYFGSRgpNbR78EXAhBLd2GZWAwMNG3oJWQdDTXHR//O19BLms3AZIR+AggQFCLmOwlRFVlwLEf2Csl2FxdYAexyygdVUCCuKlpUoBrpqhX6gJgOQi6NNwQJxs6S2uVDOvE343UzHbuvFgYE1vcPVsszGGMAHdJwsOgzwXsvUm28nvx2KUjpWmfkmGHLiapnjS1vEl3XUQgE9w2lRelXeY1XfTDGmWzvX/gEIPxR7Up+7BFvmEh0/Zw+wrGhosuKC46Ne2RLIH+3RjsO79u97QLaoIBtjGf6Y9ViXZHqDIMV6ZorfMNBKmLRnJbQL7suOfv7eLegl+7S60mrAwwWD7LQqI4ivs3286t9euuOUl+8ELr2lrG+8henqw1NhtK/JbgkbNAOlwR56rtdB3U4MKXpagxkxyCBEj7MyZDCVGHABE62T/uu3HAns0F0V30jOxbcPMARkL/tIgvvD9TyqLRmp3LCInuUAnwxSh07mnyMpqc9/wBnFeClXyS3fOLYCIeKRzxtze+klKwEk0GChuZKb8EpTD/A/Nn1EIA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 eduQuXy4g+mNbWlWCjzTrgKHp8clawLaJ1ymP+y0of4wB5yMq4CUYhqP9JHCFSRQrNoSKr4t6KFlWDT+f6VcMKVgzn+ixeGeYuUpZtGxm5YTx41nABTpj8X/Ub2P+rLPDZDqAOMUjc+lQTUULdwyGYUaouO73GylBbFAKuldvFUQx4zFEZwx+91Op5umlRRWJbvKW2Qq8EUJ89r2hpjiTL3BJ274swQWYpLY63ycHObqFQjFh1bkM5zXmaPmdRAuM0pyqKv9zroAxAgN2S3r837qDH2r+f4ew40Mxhy1Ns7CBfLSfUcXG9CuxhTguYN/PeMWAy83+8IwuAHC0fHF/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8968
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4e9b786-d16f-4e1c-eb85-08dea44584a7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|14060799003|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nr3jswPnzJ6d303NUZeVRymh+yMQhDiMNzBOQ1uFLkvgfVBEzlrkPSX7NCd2b5xZELQSuxh3jbdENeoTGyDyfjS2C1K5+LGWAKwH2dWK8b8FHCDjqnXcFIOrZoRaJbgNrADGDN/obvXP/SBfFf+du6iTHE1Y/SWAj2u3ivCUmoVaCdcsfoZ33SUNuB6A0tyDmjSGLrFTkf0GNh3FkzPS5h30utfrKYNVM9w3fCVwdzSo+s7ZfHYvAY+EPSbX0r1k1mqfbFFez3trcDN6WcPb/GOLg2gpIhNq0LuoYJLM3fUH5rznESvscg8fz9/YA4TaaLRLogRh/q9APXyaUdMLaBRlRI2rdzWaXv7jbD8FvW66iJVxML8yfDCqMaUR0bU6ioeUWuD1zSN/uvVWZBTrrshP9ladLntXQy9JA2qMvJPRV/vHXjh7cYrqXEHi8BeOaaUiT69dNTJ1O2Zhez3ZkslP2dPqoLhDzLDSFtb1bNmD24YeKMOpXyMJ4aTi+sMUbTYOEVNTNeCjNRL0tB5uegSh8kPfKmTKKrsiADWODrwzbpH2uZWbkjJ6LCJjaltKVn6Cd/u6mixOXWE5oYkUI/moPqEfr/B0PmKqve+C1Lythud3lok+wPizHv3kPSheatpDRp0FhfhnUnAfx8j2++bOxPMvSOr91q3bJ/i3aW81wxw8MHhrDNGYGSFbaBHZSIWhEBVmhscNmf6NXLo20ZFOTqy3aOy34bkpAVt27MCvMfl8AryiIFPdsSE6MxKdf+tNi3vkbO9W5YkI7n747w==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(14060799003)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C1bsJ9tQHsMFvGI7aN8TOptcO8/FuMGRhJOfHDD7aJl6PkJtu8rlflty/G9vLesZzmCcPi1ex7OPb3mnwUG7SY95FADf00Ms+13DXKAVeCaqrEXPpBIaP0G1VRj1OBz+2xeLP4qG5aMCMpCIw6kFNvaUm44jn/oGu+ZwoOMKCYAyruerlcrHwqQvUyOqyTL09DRY7CuetLmnjk80r+Wr/KgWcYfiwCW2q9mRvgVEdl3M3gfqw3RrHZ4tl69UsAIDbJEh5bgmhJHlkFhglnnqPyyVXdwcKEsywvenCM1Y727qBlYx08mRV53lfbq9LFRPJPmT50tXPSh+KOVWFV4sHZ0pEwkEkjt4g4HxLJYwPcIzIUGKj4Hd16+jode7Lo/EilcPmmFW5qC882Ui+J5UEUirwIqd8VYtIYlQ6JbKgoQi3N4vjhK/W1ICzP3g7fvx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 10:13:48.5729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5459b11-afe2-41ef-5961-08dea445ac7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11222



On 4/27/26 3:15 PM, Mark Brown wrote:
> On Mon, Apr 27, 2026 at 02:19:25PM +0530, Sarthak Sharma wrote:
> 
>> Seems like there is something wrong in ksft_exit_skip(). Should we
>> change this ksft_exit_skip() to ksft_test_result_skip() followed by
>> ksft_finished()?
> 
> If it's causing issues we should probably just fix ksft_exit_skip()
> rather than open coding a fix - I think nobody bothered because it's
> mostly used during setup before having planned anything properly.

Sure, I'll look into this and send a patch.


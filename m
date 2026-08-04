Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BD930D41B;
	Tue,  4 Aug 2026 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829140; cv=fail; b=nb74zmwX7b7bjpA3OKEwnPJaqPhmAGxox+vLkhsPACyrDMpc/yoYwxAGByxlC6OYbiXzu5MsVHl1cNrTfMw0Pa53pOktdZNFLM2TyV1I4ABkJ3kjfabbjghyguekUxhlfRRv1VIAQ+14LCxTW0+gxxhdjs9fvt+7G3OMx6eGAB0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829140; c=relaxed/simple;
	bh=3BwR8nh1IQjf8VMcJKTC0HNkmYceATU2xJbnDN2Cq2Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n+omoP3tDILHkuk8ceLcLwnIBLeJbuCa+SQuTeI1khFB8tX6TNw9MmvI5Gu2+kVl2jHI5i4tD43wpgzx4lvOdSlkeKJF1lMhuHOztsjyQLYlFYDZsoO6g6u1SihCzOmoz4U3BTF/I/7o2xT2aa/K+hNO/67NOhMGHXDlB0sInmM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QJnF7KpL; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QJnF7KpL; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QJnF7KpL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QJnF7KpL"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hp3cXZKBAEpxGk552irQVr6YZdYMpHLjjvAYI/n5ab7hcYlfD5nDfq1UqO/N4jsz5J0FpSHRV+zhVfId44G+DV7C8eAwy85qKHD4zh8fAD+ubxuiAFH6KVDGa53FeWVa2JzhiBMoUpEg6utB/F7pFhZ8dP71UEgzUfCDBNkikzQ55oUfon9FLJRvj46CS807xp5dur8fpzuHGasR4oG+SeX12ny0zX+ZRdQ9vZImtoWYAUz6JRy2DGQSUR9jtWCsA4Rlvn8pIkBtIZV+x6LSXomQN4/RAIBNhj1wcAo4N5W/dRJ7OOj+4J4mZKcdcDAHNN3K6QmrLodupRL/RN1QVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjuLcc8Mfc+Up0i4FM4sNF3AGM2W3N52xTa04iR9E/U=;
 b=CHrH2rqb6ITu6Hu/+VVuexFYILWrqNzhFPRxwJPsPfGKlsY+q46wt8CFI1g4q2/MW1L5ZGah3L2VpE8RnCqI3Nb6Mu2sqk5X7ml1NykaV3PXDoIGVmZovDtikj2bEGaf/RtWc8RfeyDNOU9Fr1y1h1GXY0gUiC8fuEUj9UBPpO7qwu4CrkDUgaLe7xkZm+/wi/c5nK7x7jb/Sz5K1SNJcrd23RVkHZ2L19WzxKB7OdnM1i+uybCG6iJ41gRWxHJEWB9oCMuqM+iUWfqAq6YhJv8e1UV+2Wfmhy38cDLB//qGs5pHfeICAGMOzNkgpTqIKIElJdRhVru1ETv4zrOliA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjuLcc8Mfc+Up0i4FM4sNF3AGM2W3N52xTa04iR9E/U=;
 b=QJnF7KpLuHjaThDYybNgByWUfR1T5mHiVvt78SW0u/802f12TAaJkcxZdyZnykBxkxlHNCus0xtgj5OinenhZTNmG6CBw1ts7uMUsMoujyKJvo0ueM/ZPM4TTw9+IeANbuBds0eS8gMIftR5+By8BLR2tmAFrkikInPEKHwVBMQ=
Received: from DB8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::21)
 by AM0PR08MB5425.eurprd08.prod.outlook.com (2603:10a6:208:17d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 07:38:50 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::a1) by DB8P191CA0011.outlook.office365.com
 (2603:10a6:10:130::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 07:38:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Tue, 4 Aug 2026 07:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2zKq508zKaqpSD78wgkoP7DQ6Yd3vCZCP9BU8GiuOEKk4eSf8MHiQYUrpYnXQ8JA/vK9+bi00GXlg13KMwHHndZkJXiJSDVVSkIme2aPDaXqpifpcwn/ilyjjsjx8gBt8sPHSshh8Vyp6pddOpgyU4uwixudXKm3yZ+oGm+Bg9JzhI9a579NzHKTQXD4Z7Il/SZOaoYhzDUgD/FlwJvhLo6VsRSR8qoi6P2WQAddvSm1/01gYl8YgNW67j8idgllQwdYe9PWTotrXAhnaaT2LeqZ6MfbbZ9pcgvj3miOYPUjqMrSbHDsjfP7Mh324ArK6we/lglGFOcB51uez5fRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjuLcc8Mfc+Up0i4FM4sNF3AGM2W3N52xTa04iR9E/U=;
 b=duz6t5EGbpUMgLCylW0PTh/3Ty3nVNxkOMHWG+jJ1qX8UOqRcJ33ihpx4bUdb0NwH10tqWv8aPf2B95+H4an7bntANRwGnIjQ416MwaMHTn/pFJ2xEN864g1m5Gv4jTXfLtfvEWOxUuPZ5LVDfpaPKMegLaFywNWmA30ahbMtmfs/m/qORa8xrueAW5ceYasqEmyp91iKVc0gjQmerhdi4fMia39CglZ2seWX6FtugbY7/zhkdAuYiHB8i941GKRHGNZKFnH+4BdvFsiT9AKbXFQrC6bMSRDz7+Utzv2j95czt1K2hC2Q0VZQBUXqcW+pETn1zuwzkV/kzRBpXFW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjuLcc8Mfc+Up0i4FM4sNF3AGM2W3N52xTa04iR9E/U=;
 b=QJnF7KpLuHjaThDYybNgByWUfR1T5mHiVvt78SW0u/802f12TAaJkcxZdyZnykBxkxlHNCus0xtgj5OinenhZTNmG6CBw1ts7uMUsMoujyKJvo0ueM/ZPM4TTw9+IeANbuBds0eS8gMIftR5+By8BLR2tmAFrkikInPEKHwVBMQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by VE1PR08MB5599.eurprd08.prod.outlook.com (2603:10a6:800:1a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 07:38:15 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 07:38:15 +0000
Message-ID: <34e3932c-aaf1-4b69-a3c4-398784aae290@arm.com>
Date: Tue, 4 Aug 2026 13:08:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] selftests/mm: add a GUP selftest
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
 <20260730140825.238130-7-sarthak.sharma@arm.com>
 <178574760162.1561566.17560239060453947110.b4-review@b4>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <178574760162.1561566.17560239060453947110.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0077.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::11) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|VE1PR08MB5599:EE_|DU2PEPF00028D0D:EE_|AM0PR08MB5425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7f0e27-0a51-499e-1f77-08def1fb6cf8
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|6133799003|11063799006|4143699003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 8OF+YUIvhFUK8m9dV497e3PP5u+lRdac7R37J+nnuFFCBzsUQfoH6yvWQS+ukqA2a+LdWmXXUmd+4Xnou9L5k1FZqZsvwohKts0OCYtfETHvvsOPG8cHjA/kXiGZtMzlyT/XrFWDN3Y8KDBgGdb/0DMe+ynJTqyCgQ1rUCcX2vFp2+y1TZLlAj3rie0zqUAurlRG8Bt7rcn2ExBaSzHhdJY6iq43NPfMeYYwEiZWe3tRBNHz7sWeOJ1TFRd36LoMSAkCTTl788d7zvh81/Mslo5ZVHwNLfbZ15oNVaM30FYYLH3sl18g8NDP9SHfq9ekG3/Pn0ucyGWOPvcmPQ7YaSkDmuZ7wwsPNgKEXv8N5Igcl7qz04pwnpcoUZenMVEaMNtwzI5SR67dFsm8e49NMG5f2aIbqI5WJBJWD/WQfQ00yT7c2Cml5Ttnt0VXz/2/3H93R+/Pjd53gqkFhrUjF0TrKdChqGo9yyo8dNGbwPrDPYKxn8sYxQCDgugFeiIHCBZk0I/h5JP81E1XAM/Sx0USdzgDjZ7ThLcSe15VEE9nSY1i1jYzIzVLn2O4WjNpT3h6s4Wy4rebklh1qxfIZe0Vm3KRz+aQNt93pCa90wlN/bzQce+aYtaIyVs+iPs3tmDOdgsiyGhre0k1TkCtZ4nqhFCeD9+ze6tkgRxU28k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(6133799003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 JumtjBpAtN4956n2s4BGslR7NgghC4lC/jXHiYGVkD2GZnK79J9EpatlDAV0chABY/Vs4d7VvEdntzavYoddio0L/r+tIc2IP1eRCOnWi5JJRZ1Wr491MErPUIuPxS3ULVhvz/n7/H9JSV1IpjL8HEgmx1ZctS31fQY4byFNYW6F+We/PaMkgfeuku7YZekf7U1Jzk5SzjJuZWc+WCaV6w7nOhyNiQFBsQUx6inqZ/CoE5Qx9WbWZhwZ1xgqRw6o9DmHSyCoJez0eGGcas8UUpeWTSWsEVNK1xiyuZ5HczvUTb3ILXuTqEYDg2CFbK/ZJy9J2kjFG4vaY8Mw4lCZvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5599
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1c0e41b9-b4f2-407d-8808-08def1fb584e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700016|23010399003|376014|1800799024|7416014|56012099006|10067099003|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C/PdO7zoRJes8Qh51ejQwEIiH2oA+q9LH3dnoxn5ETTk0ed9plU7FCh7fwFPUBnUImlXZrvz4e2O6zIMEExsFr4tra78J4LF4dNAsAH3f13RFMWTB47cB3LKenTdW1UM2Bir+xHAH/cI6SFbF6mE3bI2bEziE1aGHPK3m2oI3sEIsUQp7LMaGiBBYeKJ41qSpxAbEdEhBc7T7SRybpO2zdNWRai2GPuxE1WDvKzLIJ4oErYj/WpU1MyEipAQ3tBmKHmBhEzbASg7wTfYjvjVfMn1u3WV61AW+aRDWlrbwt/U0pmut74apo2ILH69GVoaexDCV4vKqHV8uPkA3o74+v12o1D91zdNOaF02p9szbAV96A3ROpn9Ode7unLPkqcsrzbO54GG+dorgvnpasZ7KrExbM4NsMF9jiQnaP0wIgn3dCJHl6Ue+fRzXoX3lW5AB76basq+K5WaCNXbRTS4JbZp1nCKxGhGyGsRHvPnm1CIcNAQLxhak+DIP3eiNPVAsM84HFgW7bD4Co1erGSc27A2ECrPK9x8cBmTTo5fhy9I9T0fkeH0HzfrA518To41mIvB+kASMaB2bKX3VDbTlWcWRY94aDMQpJ3D6w3wnihGzCzKB/H+LoP2sWHwthXGD7vnFWxy6URpOrlH2AScqB90VqCsa47ydsyhPj40N3FnIpC2x1F6xNr/uAw9IjXC/ocYYT3l2Ni7+TeU6uJgw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700016)(23010399003)(376014)(1800799024)(7416014)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AEvrPY7d2VwAzRgVSKf3B+uMNqWOSDj66iNwD/W+gxA0Xp+Z8taQwMAhjTSzG4bfZlVfy2JngfeKLoPQ91WJtn1iTj1HhkBaRtPkZubA4f7lxYOA0oepuDjbqIbHdLfWVxqvDZZbiQ/yirA+R9UtvEdFC7NeyBVzTMF+EynQ36gCGqQ/gZKhz1IlUjl6Q7TVrNavZtcKulz7zWlVqim6XaBbraoOQ319UfxqHdwclAx/19WqprJ7iPFxRfR+fTWzJamp+qrgEZhmvCxmVSjLzODpytrN3OJe+v9NLrbgFfzAqiDpy/wvOkZyJCTCAByUTgV5CSIousIaFRJ+5GYf8ILU//5ONKLGGAUTt021td+UL3bItkUWf/QBpNsfPvj7ty+LfA44GM0vhDTLs7CuhhOrgov5K7oMmgHvfc4EnzBNjG7b+zX0ETFNQo0bP6Vf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 07:38:49.9351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7f0e27-0a51-499e-1f77-08def1fb6cf8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5425

Hi Mike!

On 8/3/26 2:30 PM, Mike Rapoport wrote:
>> Add a new GUP selftest which uses kselftest_harness.h. Cover
>> 12 mapping configurations: THP enabled, THP disabled and
>> HugeTLB, each across private/shared mappings and with/without
>> FOLL_WRITE. Run 7 testcases for every variant: get_user_pages,
>> get_user_pages_fast, pin_user_pages, pin_user_pages_fast,
>> pin_user_pages_longterm, and DUMP_USER_PAGES_TEST using both
>> get and pin.
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
>> Add the new gup binary to the selftests/mm build, .gitignore,
>> run_vmtests.sh and MAINTAINERS. Update
>> Documentation/core-api/pin_user_pages.rst for the new test.
>>
>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>>
>> +
>> +FIXTURE_SETUP(gup_test)
>> +{
>> +	int mmap_flags = MAP_PRIVATE;
>> +	int zero_fd;
>> +	char *p;
>> +
>> +	/* zero_fd has to be >= 0. Already checked in main() */
>> +	zero_fd = open("/dev/zero", O_RDWR);
>> +	ASSERT_GE(zero_fd, 0);
>> +
>> +	/* gup_fd has to be >= 0. Already checked in main() */
>> +	self->gup_fd = open(GUP_TEST_FILE, O_RDWR);
>> +	ASSERT_GE(self->gup_fd, 0);
>> +
>> +	self->size = variant->hugetlb ? 256 * MB : 128 * MB;
> 
> I'd derive the hugetbl variant size from the size of a huge page and
> predefined number of huge pages.
> 

I was following the existing logic that run_gup_matrix() had. I can
implement this. Any suggestions what number of huge pages we can fix?

>> +
>> +	if (variant->hugetlb) {
>> +		unsigned long hp_size = default_huge_page_size();
>> +
>> +		if (!hp_size) {
>> +			close(zero_fd);
>> +			close(self->gup_fd);
> 
> You can move hugetlb setup after opening those and save the headache of
> closing them.
> 
> And in any rate prefer 
> 
> 	goto err_do_cleanup
> 
> to
> 	if (something_failed) {
> 		cleanup1();
> 		cleanup2();
> 	}
> 
> 	if (something_else_failed) {
> 		cleanup1();
> 		cleanup2();
> 		cleanup3();
> 	}

Got it, will change.

> 
>> +			SKIP(return, "HugeTLB not available\n");
>> +		}
>> +
>> +		self->size = (self->size + hp_size - 1) & ~(hp_size - 1);
>> +		if (!hugetlb_setup_default(self->size / hp_size)) {
>> +			hugetlb_restore_settings();
> 
> No need to call restore() here.
> 
> Also, if you use a constant number of huge pages you can just add
> HUGETLB_SETUP_DEFAULT_PAGES(NR_HUGE_PAGES) somewhere in the begining and
> you won't need to setup and teardown hugetlb explicitly for every
> hugetlb test.

Ack

> 
> 
>> +			close(zero_fd);
>> +			close(self->gup_fd);
>> +			SKIP(return, "Not enough huge pages\n");
>> +		}
>> +
>> +		mmap_flags |= (MAP_HUGETLB | MAP_ANONYMOUS);
>> +	}
>> +
>> +	if (variant->shared)
>> +		mmap_flags = (mmap_flags & ~MAP_PRIVATE) | MAP_SHARED;
>> +
>> +	self->addr = mmap(NULL, self->size, PROT_READ | PROT_WRITE,
>> +			  mmap_flags, zero_fd, 0);
>> +
>> +	ASSERT_NE(self->addr, MAP_FAILED) {
>> +		int err = errno;
>> +
>> +		close(zero_fd);
>> +		close(self->gup_fd);
>> +		if (variant->hugetlb)
>> +			hugetlb_restore_settings();
>> +		TH_LOG("mmap failed: %s", strerror(err));
>> +	}
>> +	close(zero_fd);
>> +
>> +	if (variant->thp)
>> +		madvise(self->addr, self->size, MADV_HUGEPAGE);
>> +	else if (!variant->hugetlb)
>> +		madvise(self->addr, self->size, MADV_NOHUGEPAGE);
>> +
>> +	for (p = self->addr; (unsigned long)p < (unsigned long)self->addr
>> +			+ self->size; p += psize())
>> +		p[0] = 0;
>> +}
>> +
>> +FIXTURE_TEARDOWN(gup_test)
>> +{
>> +	munmap(self->addr, self->size);
>> +	close(self->gup_fd);
>> +
>> +	if (variant->hugetlb)
>> +		hugetlb_restore_settings();
>> +}
>> +
>> +static void run_gup_cmd(struct __test_metadata *_metadata,
>> +			 FIXTURE_DATA(gup_test) *self,
>> +			 const FIXTURE_VARIANT(gup_test) *variant,
>> +			 unsigned long command,
>> +			 unsigned int test_flags,
>> +			 unsigned int which_page)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < (int)ARRAY_SIZE(nr_pages_list); i++) {
>> +		struct gup_test gup = {
>> +			.addr = (unsigned long)self->addr,
>> +			.size = self->size,
>> +			.nr_pages_per_call = nr_pages_list[i] < 0 ?
>> +				self->size / psize() : nr_pages_list[i],
>> +			.test_flags = test_flags,
>> +		};
>> +
>> +		if (variant->write)
>> +			gup.gup_flags |= FOLL_WRITE;
>> +
>> +		gup.which_pages[0] = which_page;
> 
> Can't these to go to the static initialization?

Will move both which_pages and gup_flags to the initialization.


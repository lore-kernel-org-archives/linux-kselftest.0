Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88113A1689;
	Tue,  5 May 2026 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.10
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981808; cv=fail; b=IBJcbcN12Rj1i8Kn6cGrZxZhOGmtjYnd+8s/RSqGXcRfvx5kFy7GX9xcfwAPPH5q6fmc6ux2uXTU9XW0jfYEb8XKzExotHiREBf9uAmWwCyGVCGChQUn5nzG7wjPyTV/HhBE+J1cHj5Xw9Ego8ypQg3Gm7tsepmMc2OnEmHchv8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981808; c=relaxed/simple;
	bh=BNAufaJIZI5oNlGBgvm1JoNmK0ti6S2igrJYJWjsR1k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pv2rsa7iWu1M/PQ5qzvwVnxA2KigzvtoEOOtugHwy5xf/WpvI1cfEFv1Rj//DbgWYg0Nxfc/K0uR4Krldlm7U9XTB/sqN4bguJeySo6rr7nE0+SnW7zaMDJ4vnNKm5aixGB5rmWRT7tywsHUZRfZq9MU+ZEWcIfVP8ReYPmVl6o=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Hx+08OnH; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Hx+08OnH; arc=fail smtp.client-ip=52.101.84.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Hx+08OnH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Hx+08OnH"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w9nW74fktSEUgTZ0AvBUPk0FmFWnYWGcHNduWe6v5eplMyqBmSrbov+cn4zJxJVPnt+TsUd/wJvry3WaGcHeZ1+FnYODB48TAyA0OPomvD9cwEA8CpIiM9wC4xETEe1ZoWCsrciCjOX5yNr/IznIu97WCa6PutWf73ZnU/jRBlf87i6k8t+vCJuxIxaNtDHsCjMVPC1F7F3ivMwXZ5dIADgIHkF+k1jgrLaiLXv9NS8GbYDXpnUlMqde3zoaytPnVS4msfqvoj/0Au77AYiTUtHN/obnpI6hI6XxG/YV49jaHve4d76nqBKyyrC3/HVqRY7DINrk66afZ5/DCzPVxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDqG7H6R5+qpJzJH8Ug1hlKwqToOJAIWrf1Fyu5iRW0=;
 b=xXxuDJ40dsPJdXRDmpAjzPEUYg/ZmURXpa+1cP4zUn3jGqe3RmNmBHRR/McrpEZEVT9ecpF4xZk3wA6C7K8QCo5nOVATx9WCCXhUwpNiVz5g+WYjmiFxB7O+lWVTfEQBPUo7GzXOEjzGGBmydFIfRxg+9CrZBq0ydyB4HeCrMvieECN9U9r79JC1ACVD/TWnEyTe9mxY2x97/Srre4BTxalymy3bOLuhe46zuPQpjvO++ZLrb+IxEM/xdG0BWLzUEeZxB8+x+tQST9ok/3IcHRNYL0IeeV/zuO/aDUKefdGodZF0oCrnMHwgbpfODUt1Vumrw+MGE/pI25r1n9BZVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDqG7H6R5+qpJzJH8Ug1hlKwqToOJAIWrf1Fyu5iRW0=;
 b=Hx+08OnHBE/OLoe2DsLuh1uv+oTKJecHcsvjH/u1LBLRvAN6KJy8dr48BM7fVnshrAE0ofu4aBrODKK6Cx3hUKt3D1V0FmtqekrHaT4/hfLy5WZ4aPaogolJtlMaXN/rdJ+tdbr8IW3zxrJVDjor+MOTVHAioAEbthAkBWb7bu0=
Received: from DUZPR01CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::8) by AM0PR08MB5298.eurprd08.prod.outlook.com
 (2603:10a6:208:188::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 11:49:58 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::60) by DUZPR01CA0052.outlook.office365.com
 (2603:10a6:10:469::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:49:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22
 via Frontend Transport; Tue, 5 May 2026 11:49:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1runsJNuOhjGSyW81RspAFWwxyAHYRuS9jayZszykEbZDOQHtqS6Kd6acF6BaTQUdftnvIVH8TNhiLbWe69ekaHpOCWbgxbrFDX56nZpO8gUuBjAVt/T3jax/3ybExk27oy+oY6r4sdlcxH4vcE5ZDVvviC05VMW1HMaR7F0sb9FZxE0IZI5koGF3FTUaiI2y622hTj/0JarXOpX8GDqRK708thfs1b4fpqSZkuJOXV5V07KrK8Q7CVsZzzD0HbmOkBMSTxaOJVOxeKBAKwJce+/wT27XC8dgb3au3DnedBg/FkNOzHI+6ctwtHPNLwsqb0uLTsoBkTc9LMfD7eFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDqG7H6R5+qpJzJH8Ug1hlKwqToOJAIWrf1Fyu5iRW0=;
 b=qzt6QNKeEwA1QVz0EJbinGVyQiYVEGZKPqsC/6u9FdTDZSALovb0DJ5/Lk3YoNhjdFA8qhva+s16zAhiT2ivGjKOwBivJDQcBZ1sKNI1c4fIOiY/nCwURQ7sTroFro+0cBH6gEKebd6uN2jzb7h0v1XVJ+NEgSAStK1pl1HbxkoEuLQkuqApBUx9MJWpb4h2gqJjL78xZN5ghS82rz9m1+aKN30cqAMHB7SYMwOsXx5PvYmp1ac5D4OZ43OfiNb11hyybk2eqtAp2TCrfGNLXrbT5rOPdsUaLl11pVg1jtZ2pG+MVNQZxtdPyvqgycOjaRi2F/vy6h9PvUAy/WHfqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDqG7H6R5+qpJzJH8Ug1hlKwqToOJAIWrf1Fyu5iRW0=;
 b=Hx+08OnHBE/OLoe2DsLuh1uv+oTKJecHcsvjH/u1LBLRvAN6KJy8dr48BM7fVnshrAE0ofu4aBrODKK6Cx3hUKt3D1V0FmtqekrHaT4/hfLy5WZ4aPaogolJtlMaXN/rdJ+tdbr8IW3zxrJVDjor+MOTVHAioAEbthAkBWb7bu0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by DB4PR08MB10343.eurprd08.prod.outlook.com (2603:10a6:10:3fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:48:48 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 11:48:46 +0000
Message-ID: <2d31eca4-9ecc-4a7f-9359-2c605858ce11@arm.com>
Date: Tue, 5 May 2026 17:18:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 49/54] selftests/mm: uffd-unit-tests: add setup of
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
 <20260428204240.1924129-50-rppt@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260428204240.1924129-50-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|DB4PR08MB10343:EE_|DB1PEPF000509E6:EE_|AM0PR08MB5298:EE_
X-MS-Office365-Filtering-Correlation-Id: 675d6bd4-c68d-447d-1733-08deaa9c6eb1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 T/kBj6sM6szzf8B6kQRgKkua3dmdL7PW92Tcj/S8e3B/AvIgPZ7bCAsFUaziFZND1KfG5yF/lNukvU0HjLpsBFCFXEvzHJICz77rPcvwTPckJ9kgkSb/o3qp9FEgGA8kfrg9WEiU4IOwrwCfv0ujnGGxbZzhZRY4jB+O9h7Et8jeSXHlkk6m2dQBuD8+qpLRTtGdodzffAlK2e7KEcyVE6LrnSWw/ocPw2wTPkY6Bhh0WTsYkEEljjNwvFFZmrK+RNbBRLyiSimJngb4mlFWdvlGuuDq9ja9K8uzEu41VorVizsL4jqCl7Av/KTR8FPNnL7LTad6zfdwvK0ck1f/M/2Z9ExRA2giGjQ3PtOPGiUUJHuh3rJVuztKDjyADM2LmJ0dpFYpJZgWLOVb6w1UHrK7ac61tXGlaudBN5W0Qo0FYiVl4YJ4ALhsQRBovwqrx0+pdVMJX6qdJ8s3IJFBD88Dl+pZKHKfxOVAf6vA7QtLPVQNXxAqzfOgB7t3DDOcydCS+akwkYdODkWNYYTeF4LCi0xV4kSH5Z9Z5R5w18UJdCzXOsTXHEQinAJQ9dcXTz0obCgYoQgG3Yx35Bh2nVdWjzTeo3P8zfmxfpk6J1U3tmpEB0HiAXPMSCdYkXXLMvkyTGDcMwiOV1CeyWBKsspqPq+hvjKByPVi8Ap6Dxhudn0gv1AIz4xO6mRM/G3b
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 E6a3xUQCxhVfDbqCRL1+Y2aos1Zx/VHNHjv5Zkh6AEyf3G86Y5M64Lkn1dyIV+f7IgWmQpBQmerp8hUbzePUQV4JyWHERqIqFOcJUdt2doUqGi2MslPHhbGz7UZMFwcmGksYtttEyqDQY8ZdJfj+HMCRE2cThYs+ebjl8ErFzfEaXCYkba+28GugRb6lGrxiaFDC/PasAvP1q4tsToIKzsRuQ4lNDd7DhTfIjHxD/I3g1/hzkmrCTyLKgTeverytwG2fofwmPneQObPET7YL10Oxc3WOD4x4B1L1NtLVOM2rwIiwYetcBqjRWZg2LrlEVhLMwCUEeTN5/DMBuJDR1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB10343
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97f10e66-c758-400c-e063-08deaa9c43ed
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|7416014|376014|1800799024|35042699022|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	q7HoFTni4PCHVhwJT79RYRrloYtPz5RtP0z2R4LZR+M0aPWoMBZE6WPmB7GNfoB8UXFCS9R24euaMLZBwFWjaMffJvYa+PUso5g8rkBDiZtaQZo3bCG5ozMqrUtriM4JHr6967kwYLv4jjb3I5Gytzzv9d4BwEJU9wh0MkbfOT+f5u7uyStfSPaIDysZ26MC5/5leYMOxo+xSrWASDxljPzDjF5jUpWmH/HdU0AUP449JQ50EFggtUcMxsfONIX263X6F0GMIGe0fBH5Cn8+aWpiPjFkSqUtMuizYJzvr4uUbwbh/zanjp5T6qzTh6UEWEilD2TYqiYdSiVEP+Q1ykBt+hf3IjIlcRtw/igccTHiMakeeYy0tIStFHijAKlmHdnDviOSZJOuPIsmDdiektVo/01tiVnjjKTpGCQCtclVcVfGI9nonVblKWEbzcEaY+0stgtrFWAn06VH4qvd6wgsAmJVp1qWxTRmNTvcXy0lUUFywWEFloCv5NU9VTZYatbzhAKnATVYyTJzm9+CfxhjkRh/mW9aC7ixfTN4kstfNkkTDha15zgYvn6fE4yLOSpaPC4eESYKtH862hlUdvtLIk9vRWqTTXTR3UpnIHgfFo9BxOmg72XGQSQIridXR51rrgH3ZkT0fbXJ0M5pzffMoh65Abm50fX7621wx2r/jwlVg65Rc7Zo68ah1wUxlW9MbqgMpMGf3Nym9gy8qopOSok/lfkbUiJyNcMbojs=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(7416014)(376014)(1800799024)(35042699022)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Abw+yNuzd/+BnztPjfGehlagwpmR0Pon/5/c333LI+VDw1CBWSQ9Gp4OP6v/52j7vj/LkbojT4bWFjKVTRlkK4yR5TGqX3xeDQE62CNxGcXBg4TctXLiXgFDfre39H72kOX9UQ07DyyZYFY0q8glSfHbgo3P4LCHO3O/13bSFsHYZWHc8XTZuTmO6elkrvNWA6AWQiwUnisNM04cikggl+fLnguzCCGcQxYbrCMQdvcMUgLWlwcbeIMONVhGueDUBqDH7rWuJHuGaTe4FFQuw/KJqyQsQ/ewnTgrnvVWXVSDHy2r/y0mbzrRchHd7J9jTeLDtSqIp7KZlPv/MNBrWq8piHZSFVhb/+DlT4AlSsQJJgdG5Fl2HNFuikCTzo83Izfql0vc94CRfHXET4L0vxN4u/OS+LX6LSR2HfTOHzTQp/p5UyEltfkY8ckPklWg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:49:58.0894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 675d6bd4-c68d-447d-1733-08deaa9c6eb1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5298

Hi Mike!

On 4/29/26 2:12 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> uffd-unit-tests skips HugeTLB tests if there are no free huge pages
> prepared by a wrapper script.
> 
> Add setup of HugeTLB pages to the test and make sure that the original
> settings are restored on the test exit.
> 
> Replace exit() calls with _exit() to avoid restoring HugeTLB settings in
> the middle of test.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  tools/testing/selftests/mm/uffd-unit-tests.c | 31 +++++++++++++++++---
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index 1a33db281f8a..20e1829db91f 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -305,7 +305,7 @@ static int pagemap_test_fork(uffd_global_test_opts_t *gopts, bool with_event, bo
>  		if (test_pin)
>  			unpin_pages(&args);
>  		/* Succeed */
> -		exit(0);
> +		_exit(0);
>  	}
>  	waitpid(child, &result, 0);
>  
> @@ -773,7 +773,7 @@ static void uffd_sigbus_test_common(uffd_global_test_opts_t *gopts, bool wp)
>  		err("fork");
>  
>  	if (!pid)
> -		exit(faulting_process(gopts, 2, wp));
> +		_exit(faulting_process(gopts, 2, wp));
>  
>  	waitpid(pid, &err, 0);
>  	if (err)
> @@ -827,7 +827,7 @@ static void uffd_events_test_common(uffd_global_test_opts_t *gopts, bool wp)
>  		err("fork");
>  
>  	if (!pid)
> -		exit(faulting_process(gopts, 0, wp));
> +		_exit(faulting_process(gopts, 0, wp));
>  
>  	waitpid(pid, &err, 0);
>  	if (err)
> @@ -1706,11 +1706,32 @@ static int uffd_count_tests(int n_tests, int n_mems, const char *test_filter)
>  	return count;
>  }
>  
> +static unsigned long uffd_setup_hugetlb(void)
> +{
> +	unsigned long nr_hugepages, hp_size;
> +
> +	hugetlb_save_settings();
> +	hp_size = default_huge_page_size();
> +
> +	if (!hp_size)
> +		return 0;
> +
> +	/* need twice UFFD_TEST_MEM_SIZE, one for src area and one for dst */
> +	nr_hugepages = 2 * MAX(UFFD_TEST_MEM_SIZE, hp_size * 2) / hp_size;
> +	hugetlb_set_nr_default_pages(nr_hugepages);
> +
> +	if (hugetlb_free_default_pages() < nr_hugepages)
> +		return 0;
> +
> +	return hp_size;
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	int n_tests = sizeof(uffd_tests) / sizeof(uffd_test_case_t);
>  	int n_mems = sizeof(mem_types) / sizeof(mem_type_t);
>  	const char *test_filter = NULL;
> +	unsigned long hugepage_size;
>  	bool list_only = false;
>  	uffd_test_case_t *test;
>  	mem_type_t *mem_type;
> @@ -1745,6 +1766,8 @@ int main(int argc, char *argv[])
>  		return KSFT_PASS;
>  	}
>  
> +	hugepage_size = uffd_setup_hugetlb();
> +
>  	ksft_print_header();
>  	ksft_set_plan(uffd_count_tests(n_tests, n_mems, test_filter));
>  
> @@ -1771,7 +1794,7 @@ int main(int argc, char *argv[])
>  			uffd_test_case_ops = test->test_case_ops;
>  
>  			if (mem_type->mem_flag & (MEM_HUGETLB_PRIVATE | MEM_HUGETLB)) {
> -				gopts.page_size = default_huge_page_size();
> +				gopts.page_size = hugepage_size;
>  				if (gopts.page_size == 0) {
>  					uffd_test_skip("huge page size is 0, feature missing?");

A small nit, after this patch, uffd_setup_hugetlb() can return 0 in 2 cases:

a) default_huge_page_size() == 0
b) hugetlb_free_default_pages() < nr_hugepages

The skip message only covers the first case and would be misleading for
the second case. Should we differentiate both these using different skip
messages?

>  					continue;


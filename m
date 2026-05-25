Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A733A785C;
	Mon, 25 May 2026 06:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690654; cv=fail; b=CFMwKHhYeAec9z93p7yT+sJbAVhXyuRJnmkzJ/wYN8NsPxwOhbwcT1e4jACCAC/4q/TUOwZtjnm/iKt+bdaO9RvCLpQR9L1gDwF7cpbEEU82T7luF3Hy/lZDy3f+voVvTyAov1VfQ+Kh+OhV2orGiiZPp96Arsd8A4P5M7UsLQU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690654; c=relaxed/simple;
	bh=1+aVAksHGvY3/KLDZsyqomu9BN5PEmZfStK36OE0f6Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=db7qQ/ziesP3OTI9qOguTaJgwmGkbqKdMU/s/lc6htoxpxyEWSsi+lxQymzAYMIVXqegdXuUpZ64z4EDciqhXZjt6d5KfUWm6b0pSmXWtyrmMayJWQnk2KcPdMiZLb5rB6A/ebsLWa4dt/N1CMMXJDYVk+Wy7v0TaIjgzj0zzX0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GFA2Sazt; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GFA2Sazt; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GFA2Sazt";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GFA2Sazt"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=UOXlhTFXxa4ER+Cnj3qa8aGAM98v/yjnvxp/IE9UZoPw9oj4PgM/BhHHyyWVjoWuBs0k0EV8YUFydLtQD0Xa3hPkDUvirXA35jXK7FN4QHMmaIHyAVCxqe/dhlupqc//+PSEu0biRVQ6jbNsF6uOB2Fi1kJ0F4ZulAMEZPpLUn+zx+MD5XprmC/IidJniu3r5HJvsA86xf4dhLvc+jpnLoKNfzwh4IPqaXU1MN7FyOyfdwL0lsL4kzlhJeI41Rn2Z3Rb7njm9vdv2heeissiLOvW5FcqWzGogFpzVHT9MoIxK7e72BY6+faKpHYy6ZE5IEqhuS/cCGrcckr12/BDmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60QFARCbZniavoKYLJydv5qpRYfPa9jMaJz3/K8gHRU=;
 b=X2ktT/mW1W+HgduE5labw8Eyag3Dhzv4i2Zvi8ENiHVzHUalWSuuzHkLlD5H8LAxE25JaVqfxZcVT3S+xdk6MCuDeEM3fBLOKyOYmIarJTb3JbQ6fLwQsMsm9yNNXPO7U7I9vM+/qOIcjuG2HDIokBqKpMBiC/CKxQ8yYF9ES7wpSBytPYWeThIupAtapm28Tv1mbIWCr1pxOrZZ0TPzTQDtIxH8h/+AcgZWmox8KI5nmlOuVpOSW1Q7bHTgGzcT/x7YM8xsjiNdS7uDzjgd5Nr+dFHjMsuP+poFpi9BK7fEk9tgTaU6m9vyORAJAAEvric4sOKEjwQsEOSQTXcqTQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60QFARCbZniavoKYLJydv5qpRYfPa9jMaJz3/K8gHRU=;
 b=GFA2SaztUSyOtp9+Yakmts+f+d+e4E8rv9DEs3FszBNZapQcMZD6miWbFD4DuHPgM4YMTquutqW6E0V8btLct8sTJzHuWPSLIpTbk91L6HPpmf/5tjT//yXZWsbd/yFp/OUdKzPdipZ5neNtTbu2jxxDDQiZ6i2pHdlf+jPo8zs=
Received: from CWLP265CA0504.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::23)
 by DU0PR08MB8810.eurprd08.prod.outlook.com (2603:10a6:10:472::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 06:30:46 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::fd) by CWLP265CA0504.outlook.office365.com
 (2603:10a6:400:18b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Mon, 25
 May 2026 06:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Mon, 25 May 2026 06:30:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUvKVO1d7TmwZrXZ6D3XBaACD61L/M07t9moS8buxderoRaxeuFIQowL/RnLXMACbucMz8+HwBniDT2ZErNiUeQ1xlm01DzQxCWd/dopqGP79pt5yrJHpp3W4UvV8H7Yi7f7HJGBQZIGlP4/NwhGdu7RoFxJz/MR6hE13H5Jf3aqaLaou2pkRbimkQyz50jBdCCK0LZI0qsH2KgwW5/0tPFA1+ASWsIKBNnYKG9n2FiXdKJT+wh8LRMmeD+u3jm1FIEn5Nw+JH4ocqm6W4E7NSBW9Fagmtk++iHk6UK9ay5xRcl9NSKg4Jr80gXUcKTeKNNbQvzYarRYGE8zpmyeoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60QFARCbZniavoKYLJydv5qpRYfPa9jMaJz3/K8gHRU=;
 b=lzbQElVs1ow/pHmnCnB5JDUB7OiINplkrapsngTTk2v/fdYTOpNNljqAKt03BkiT89rwIEgqKcM8JKm/b6cGItOi8c5wDk1kN5cbhjxYrCFzn32N06g8RycudpQKdxkG+yZzAXecQtdJbg/oIaRkx1PY+b7durRUezrM3HPbG8madi3HrSvy51Fm6NPdx6FgafK+bTamsnvZJrgz+ByggcJl7JJA92xXH87KHFZM7gKb462wY9p/5e9vU/OMPtdoWvLEh3Px+V1DTQZdVYJwFVgAXFc5YoDPWWr6nxYf8Ybu4xwoQW66BE5iOgX2tPZoe5sNXrDFAZSAbZwiZusfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60QFARCbZniavoKYLJydv5qpRYfPa9jMaJz3/K8gHRU=;
 b=GFA2SaztUSyOtp9+Yakmts+f+d+e4E8rv9DEs3FszBNZapQcMZD6miWbFD4DuHPgM4YMTquutqW6E0V8btLct8sTJzHuWPSLIpTbk91L6HPpmf/5tjT//yXZWsbd/yFp/OUdKzPdipZ5neNtTbu2jxxDDQiZ6i2pHdlf+jPo8zs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AS8PR08MB8135.eurprd08.prod.outlook.com (2603:10a6:20b:560::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 06:29:41 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 06:29:40 +0000
Message-ID: <ff7d212c-d3e0-4476-8903-ffe88fb7048c@arm.com>
Date: Mon, 25 May 2026 11:59:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] tools/lib/mm: add shared file helpers
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260521111801.173019-1-sarthak.sharma@arm.com>
 <20260521111801.173019-2-sarthak.sharma@arm.com>
 <177964236205.4000040.3083558454897469696.b4-review@b4>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <177964236205.4000040.3083558454897469696.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0253.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::17) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AS8PR08MB8135:EE_|AMS1EPF00000041:EE_|DU0PR08MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ed11fe-473b-4359-f81f-08deba272680
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|6133799003|4143699003|11063799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 Sqk5zyN3/nBSGO5HfVPjxLTGG4Rh6+FiJTHBW5128jeCbX6K48MmLARmAkBvMqMvMbO1VXxnbIMF0lnLkBl37179q9JBXkiis4reukqlTKIjBpl29vMECcHBW8ibhmhSI/s24alrs8jWcZ5/0AOccvohdJUJCRpe7JK5utVu/nHyVPtB4XIgphQzONoU2nVgdxDHHl6QohYD+mskovPIlIZcsvAVy0+XOvnTyK9x1/nUXq/WFc86NtUaa1M7oGHwI5RLacifQtAnsV937nHIg5Dy71Twub+K00W9YpFpCNFibzRF2vxVINOs9uEJgge71QorH5BDI/zFKUxAR3d4ga4THivetx+f0vFwXNdJ9asJwUoODhqmUmjl/eh4RfUZDl+47kiwFa6E9Ng6xIlHi3vNHwHCk9dApc6HnLOnzu4fhJfkKR4W4eKrmc/4KC2YfKQIqWK8uOoUUTNAh03uJlryaPKicT8P+L5UIN4LZyl5+hNYNkdvw/EfXFWYpHckC/aGaNoMKT8rXqTpis1bx8c06Q7FWok/ty6Iv6/YTBy9FPyzIUijxcBD4mwIdm9TM2DGvzZ1bpn1u3V7fh/aXqI1HB4tikXrAw2e335C70jDa+ZqpOF2DVsJKzyY4PFA4VRmz3YxYIz0LG4FXjlnH0EsFSwFEmxLfLJuv+l8Mf1+kQ/MGYw/GTv8zuARNyqk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(6133799003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 rX0wkpBlqPRAw7e0xgwQzyOPz5CYC7kspOo18hEjGMDok3UWnPoqEu+gn1+Cs75CWUV4OQo6spbNy3EZBVPAeKTdQUGm0fZ9uJ0HhMKz0IyoPVX+TFqJTQktFGWtkOGAzPWsmHeS/0YBq+9QrUGCrwl0PpMQpXgOWi1Iqf0B9hTgr1wCvp3CESIqqMswpDkqCrO7N2Re42lF0GDRtGTvEGV96pzmYi0oxqrGxXKvmw1WSaXoxABIQtvflsBNAfOIAXjKXradIMaSLDQt9i+o4ft28Ctp9JXbwaZUZIvfXA2ki7dBLvpaM+Tk+k8th+0RalDd5ObHM0aad0ozju7cgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8135
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71bba106-c06f-4933-213d-08deba27006e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|376014|7416014|36860700016|14060799003|1800799024|11063799006|4143699003|6133799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uokl4oZ8HZ0wsKwGW0EFMijXTIvlLCbjr2SsvyO9csKCkQrSgmTRXt5bW1l2/9HyzT9GbcI2oHepI9XFgdlcCX03o47ppyxm9AZ45XGlzTIbgdz0PegeqbMG4s6yJKNFnZUIqpGmgUFVevD9cyUwskkCEbFJeKXEh8obiToh6SZdfrwGbF0b25N8IQgpc9vCVG7I0MUlfujHkta/YStQy797nGHQzj+AdIsywy4wW4j3DPIa4UK57zE/FqCFx+mtgSe9flzM3Av+PZglhKJl4msKfq21h9ahvORYe2ApTMRGOVM5x84hpU3dOil24C3TwRFdTbapcP4To7M4vp9HYuGoLieDYjwqtduOluepi1/2IlN1lVTy7u+epMb9mD6noKvX/Y/5tYevB7uhz9C6ra8AkRJbSRKAFFV3dev/1Du5eBPj2nXQ+BOkteCWxQ/w/BU80oQK9JV7k6fP4aghA+qpZ8OAMXvCcE6mMu/k8+olARfmbuXr2QnIF4TFEhqohmbt+snJvk4HoRTaeRckC0VW1vrLXcutI5nsC0SyOJzxzRDR3LWsHHPjDHv6OKANm2GYfl+ZDIXa9O8uurlyXMtAkFCzlzs6P1wS41G2d4UAMTbUbYpQl8EhTcE2C4LSuvVRhYatrr5JxLo0GOBnU7msPG+xTo4YmWILeLf2HZCkW8lCAQBKn7TWlqM3adHrc7EyXqMzslU5W8FLTjApuexBqNQfGPr5sHM6fmrekuA=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(7416014)(36860700016)(14060799003)(1800799024)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q8nI1lt1SE58MaC9eP6PUoeWEBVDzXgh6kIkHjSSFVsPVW8fKjFHtLhneT1b9z2FuaOlIkWifcKYTt86OQof6cNzntrp7B08OMs1I5yyywbJk4qSzT974HWBmMZrrfrlHlqazdFgenrGFzlkKzM0bCMBXqKbXxQ/oeTxGESN17SpRPJvFnMg/4YF3lix03C6TQSrExfvsaLZlq/N9ha6fPJhWnamPDCm1CvhRCGQETVp2YPuhI+oLWQIA8Hbw+M3J1GUlgLKRaEs5jw1Oa75otIUaCz9o3iqeC4ksfyHHU38nBLUVndGrbJJ9hc9PCWVYgAExFBggWShp0oDYCWW2hQyuEzqUCB0LGXo7tVepNCdRPXJ9MfxLEeldA+iYIIjjKyt2FoljYDuK6PI5sibH4tfh4ZSSsJUxpNElShOif0nimxQuLQk8Nhke84LmnLR
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 06:30:44.4718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ed11fe-473b-4359-f81f-08deba272680
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8810

Hi Mike!

On 5/24/26 10:36 PM, Mike Rapoport wrote:
> On Thu, 21 May 2026 16:47:58 +0530, Sarthak Sharma <sarthak.sharma@arm.com> wrote:
> 
> Hi Sarthak,
> 
>>
>> diff --git a/tools/lib/mm/file_utils.c b/tools/lib/mm/file_utils.c
>> new file mode 100644
>> index 000000000000..0f9322f2cf41
>> --- /dev/null
>> +++ b/tools/lib/mm/file_utils.c
>> @@ -0,0 +1,83 @@
>> [ ... skip 48 lines ... ]
>> +	saved_errno = errno;
>> +	close(fd);
>> +	errno = saved_errno;
>> +	if (numwritten < 0) {
>> +		fprintf(stderr, "%s write(%.*s) failed: %s\n",
>> +			path, (int)(buflen - 1), buf, strerror(errno));
> 
> This would break TAP formatting for selftests.

Yes, thanks for pointing it out.

> 
>> +		exit(EXIT_FAILURE);
> 
> and while EXIT_FAILURE == KSFT_FAIL I'm not sure it's robust enough.

I used EXIT_FAILURE here because the helper is moving out of selftests
and should not include kselftest.h anymore. The helper already
terminated the process on these paths, so I tried to preserve that
behavior while removing the ksft dependency.

We can change this to return errors instead of calling exit() and update
the selftest callers to report failures through the ksft_* helpers. I
agree this is cleaner, but it would grow the series a bit.

If you feel strongly, I can include these changes in v4. Otherwise I
feel we can handle it separately later to avoid growing this series.

> 
>>
>> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
>> index 2eab2110ac6a..5e947abb7425 100644
>> --- a/tools/testing/selftests/mm/hugepage_settings.c
>> +++ b/tools/testing/selftests/mm/hugepage_settings.c
>> @@ -8,8 +8,9 @@
>>  #include <stdlib.h>
>>  #include <string.h>
>>  #include <unistd.h>
>> +#include <mm/file_utils.h>
>>  
>> -#include "vm_util.h"
> 
> I think it would be fine to include file_utils.h in vm_utils.h and avoid
> further churn.

Okay, I'll change this.

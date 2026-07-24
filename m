Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CDD325495;
	Fri, 24 Jul 2026 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908737; cv=fail; b=gthz1ENjL/wFQrMQeZWmCNaIB2F+0XyB/+JPjptEeg3vp4zt/oCdngUzIXBJPHg9euqpo2uSYySr81dlUiXWqCEimLgZSVwxCNDSQeQrGPr37N1pR3WvmFscC3VFbnCaatEEVHAfmatAvhdjCKGJEilx+NbN9abT2WXV50Znv7M=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908737; c=relaxed/simple;
	bh=zIg8Ku9Rvt1EyWNNR/tQy6btF3dP/GNWuGXzwl3mVVI=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HNzzzhHm7S8zc4QH2bwR2idhlMlm0Kxl3UhwsIeYf9B9AwWYKjToEDZW+U/25oeF/Y5bfIQQVKEvcG2tEUHOD+YPklXojXqvMSm/4BE12QgbQo5JZIO7u1ACHgvmlR3vgLcWtCmAl/CbzzXJ/rIdLK7YPXTl5QzaVCwORS9/Mmg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P6/WxjIF; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P6/WxjIF; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P6/WxjIF";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P6/WxjIF"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SSqjB6hdzhDWtpZajx7AvUctKFuqVpSj4PSPmCd59waIxGbf+M6PDibgWm1OXDj1VfT+vZ7kIDgCj7/myneG5HTEhxZKKxacDsNbZSF3M8s4KRoo0zDO2SeD9535f2BHqKwETCbDdkGN2s+hrSrsqYawoY8hGZymsh18f1hzEi0bZymjsRfIyqRN/RN0m2S0yY8ke5+JNSmfcQBG4z+44/dR1rvAlRbJK21zdnH07vIsXVtQnnp2Bix6vlGejWSWP2jF4GYsfwBeM57aWxcTWKmOPfQJs8zr5as7b0ABvn/uorXReguQxdnObkVRBOAM0le/86L0E6Pyulofut83rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxQIJGX9pmB8n2McoRttrvOf46IHfVDjUfB2rWp9/ZI=;
 b=i9gIk4k5nv4pn705IC9CIJQBrR5ZnQ2GSZuRDYezkyAeIVy1QxSKTvCwB6AoivAjDwAP2JhV7lGA8rM7YejL8vYJyyyHi4hNPDr0OUrAVtkWO9pGuRzE8w1n63DDa6uTXm+DH1FOjnZfR4cVUSBx3bYbOYwL0awelfYEkB/qz/7MCfKISkjnQdby9W/tIcIGnLKRJGv47ibZ4/TpJZknKkyEPw9lx/A87EowTuYkbbTV5W7XWW2CYsTMeceg8ag6Z9VtW2rk3u2e9x/v+6woa+8j73mx6IvUPmriWKZm0BUE2QTjzaBmZ1WRtTUlNKkvPuEEVudJ7znWMPGfcqir5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxQIJGX9pmB8n2McoRttrvOf46IHfVDjUfB2rWp9/ZI=;
 b=P6/WxjIFb0JHiEcEgCp+zlidIbJkumfW+eINvScRgfekGIMU0UAT4a4YDgQXl4nTdlyu2WrKMvA9SI6ofC5M42GwZjGR3C0yTcTJ6R5/JzmZWLNX9oRx0PqleDJRUXYePPuI7Rx/1jLLiv9dcmEtE7rBd6RvYd1MZ6Zy6BFLPQ0=
Received: from DU7P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::8) by
 AS8PR08MB10151.eurprd08.prod.outlook.com (2603:10a6:20b:628::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 15:58:47 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::29) by DU7P250CA0014.outlook.office365.com
 (2603:10a6:10:54f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 15:58:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via
 Frontend Transport; Fri, 24 Jul 2026 15:58:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPFAGugf5pTb7bpghVdVbAFHaQP3es/h6AGTLMZ8RWfcn7sNzn5FMb4SfkFKUgXPpJHlBb9OkDpUXBRiEzlxn5aKVuje1qPkzVT06xDykxt6BrMJPuSHnFhPRZM4R/rTzrS++5XAeRfgPoyha04Cc12I4+vM7k3rDCc/2Hy34Ucf2Jw+nR4Nu8B0Sjl1EvrTVtaZtEz4TQEUODBHr9uz446P8vLUNx0fmXVLAwxDAnMDaRwJ3zlvuF++HqX1/TSxbTIKU3B4hTq425qd6meRyOaGl6G4DVvlLFKytmrdnbOZY0foCXjIoX0DAiJxm05aD6ui73dtxRFjUDnek0l5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxQIJGX9pmB8n2McoRttrvOf46IHfVDjUfB2rWp9/ZI=;
 b=j2MQAI+MsThy3HXRVCiRdNKb/Jtg+m21XaeEBNLc6jNYM2jJtwWHDwLjm35cR806b8bV5MgL56TQ8xvJap36JWxlyAo4uIjHnAJFMx0LW6hnnoj9Zo+qQHjl3kq1sxfa8+E+Ljpdgau5kIl3yUNs6w/B/vyQNJJxS8HsB5GIgu0V+SZAVsO4XwQtPk/1GJdi1rFOHGoj0k9QvB2+0mewALFu7sUh84JvX7rXC0jA9gPcG4wz3tK/Z+NMk/Kbcu+ziUec/KeRbTEIyIAlCKlwDZD29+fDI7IqfV66U2V/S2tB1UuK1uiQsQz4Xk2kh4mVGW1aUsqiZRLla/+Paej9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxQIJGX9pmB8n2McoRttrvOf46IHfVDjUfB2rWp9/ZI=;
 b=P6/WxjIFb0JHiEcEgCp+zlidIbJkumfW+eINvScRgfekGIMU0UAT4a4YDgQXl4nTdlyu2WrKMvA9SI6ofC5M42GwZjGR3C0yTcTJ6R5/JzmZWLNX9oRx0PqleDJRUXYePPuI7Rx/1jLLiv9dcmEtE7rBd6RvYd1MZ6Zy6BFLPQ0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by PA4PR08MB7548.eurprd08.prod.outlook.com (2603:10a6:102:26e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 15:57:44 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0245.009; Fri, 24 Jul 2026
 15:57:44 +0000
Message-ID: <1c5b5101-1bf5-436e-a0dd-10b6cf81ff59@arm.com>
Date: Fri, 24 Jul 2026 16:57:42 +0100
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
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <6e2236ab-2cfd-4e61-98cc-4e4de9f76bd9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0198.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::23) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|PA4PR08MB7548:EE_|DU6PEPF00009528:EE_|AS8PR08MB10151:EE_
X-MS-Office365-Filtering-Correlation-Id: 6693ff86-4406-4e73-c2e4-08dee99c7212
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|22082099003|4143699003|11063799006|18002099003|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 38h3ugjmbripRlA2s5oFU42k/kTzjZ5cIaS6EVukd82Yj0tA2SoAvqXpAsALdwsio1HleJ9fFKUW+hpd0E/Y6rPBiOL5hsUaDL7xiHadlcE5lQjWV9RBGPRMk+Vi27hxMETI62OreKiF+8JlhRzW7ljzzRrDUedLJjtonuX/YjOlMABsXy0ti/Iq59Y+R2jsCV2baT2hpqdGRTHyq/jOYaRAl+ouT9ZEtDT674JQvqPHVN3PhstZkbto6v1n265fkjQ/vkFvHUZCOMBc6OT4XfS9wrNhekDtOwoyGwGVs5pyMK33TxH1UDPtY6e2igkoj++kUCVU21iXYijoPTPpI2qpJ1smxh6gl6raUrWJt/yvCe8TG/wgmzGor//rHGPNvvt0i8neO9rzj7uzHMq94Xkcc4zEdRO4NiDSb9Sg0jfipgY2FFgq9hUkTeo2+USJveWKyILPs5H/m0ogyypc6wxbxXYD9c8PYeIn1TAuBrqUtifUnQ3m3mgEIA+4XK5KU5z+enKjblxh3WhL48rq2djhPN0zlQwlQU8aNGWZ93YTjhhR9gOtBsrTEHXsGiJH8MDLFtJv7zBV9BMuXYRwlOgv+TH0xDzENBJpJgsb39AkYhGVGCcxRrwWlRR9/yEA+7PjHpjOPjWBeAQk8CYlAc7+VDRkhEwUSMhQB80uzR1hCvxKi4VG3FHMKzufPPdwP+j+O9rcaUmF+z0CUTmVGw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(22082099003)(4143699003)(11063799006)(18002099003)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 fEg7Tkm+M9CMG5mSthzycJgKG1uvPID5tvN6JQz5GYIwelLQmE6fOOXo7QeDI3aN+0NMerhBGnqUvswgKT032lWu15TmNB7bVAU3GeYZdQ/cTM62QfC+8FmYfDo/vlBoMSBgIgKdAPLN37TpAr35XKrZvywe4ItPBfHm2WYCmwAcOOnFuSGD20MweJhs+eNqilFPm5DQ9OSyZXNlDgKy8PBCXyaTe9srbEYj8vdn4sMsfO0fQnIarRVuup/tP89hs6oAtcb81PKM2Mtcji2nZ9OSCiWst8Y9BloRvFBTCkiJ96fhqN1Hy+ofMGJ+ia4ezIj0vOVqPbI5oatCf5zhUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7548
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88bbb268-ca15-4ea0-f76a-08dee99c4c4e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|14060799003|82310400026|7416014|376014|35042699022|10067099003|4143699003|11063799006|56012099006|6133799003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aaxBNEWt5xT/rmOTu5l+XqE1SHJWYsFeHLiPBRgFYaTIxngKhTZUgR2BtPD31/GLtH3mRMs9N01oztenp+uh597BV71K3b5sRIa0Xnl9lAgrm5dc8SCTrJndXlzR7rCMTsnCiQFDuLsmexF2Jb3On2dMJzxl9lRLg4lojsGeDV3wfufVoGKyzifX7Mcb0xEwliFrKwvOt45UYVcosUpMZoo8XS337ZyqttmLIIMmf08Ejria0I1Z7EkKSRuSPFWwltCYXRpBvNmNAYV5EahyzfBYdCODa3mCWHUSYqIZl93vxLmW8PkVZyeRcKqxfj8T+lUK4cssp+CfCcmANwTV4RPdeEZEg1Vh/pqpvqddgWwCUzSoODuXmectAmrUADCjt8n8BjXKKTg58F0+aerQdynG1YyJ8Q0dFsg1F/mrbdQnZ5+ZJcDZtTBfqwh9+BYuK2F5jzi8jTaisZXkgdcnlyT/DGrg12MDyosHoilxyqwiMdPVo3PaPq9MgDpMsqCMx+TxOWHh5UR3KcTOPnZXzj4gSICsKIbyQ+YMNbRwruZJhvFAbgABOLEeEp/J5Og25MFwJhL3exAiVvPG2Znkns4D9Mp4jT/FWYaH63IGZgtFLyVgqW6HQD1Eu4WZh5SG/xW/8XaceSDCz4sMjjpIjmpL5EyxSmSQdhrrtw1SKxl6SCXnmX+7krobQYUviOsRwXtsyA8o3BWvNG9ZUMXru+5C41iyWrNEKtN5O1dP7/NemzR1ilwi4QiIuRlkxZx1
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(14060799003)(82310400026)(7416014)(376014)(35042699022)(10067099003)(4143699003)(11063799006)(56012099006)(6133799003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iGQ3hbnV45EZp0R517OoxhQVCncI3oX4vePgT87i0dhBr+/A09d6egMDkJnsHsbIkDAIdphjYbJJC+NHLL4Womn4uxl8b8JWle2pTAj3Ce7jdXWf3IjzFKj9AdhGwCdJDhdss9sDisym/xYVCCgiRa4FE7QV3UQ/Ty7pzdl+3Mufscotpicpk7WxfiG4qoBh027YZUU1EpUS8Lmp0oJdpfeyIDbHJuNV9LTPCx3dYlxs7YbmKjWUKT2jjEH0Ng8Y7Jlakh0eI0r9Y6jGjjxQfka4ok/OrIPfllWOdNgvn77Y1fQAhTRQvTeiUTfdUzCuSW/kcnn46p4AQ8wrQdPdT2L6a7/YGvsjgJci4vawFadYtfjS69GZkjll8uYqQV4U2In3dh6mQmcRY5U7vRD90yfkB8kzs0F+P7By/51/bLpGCkbOnKWBSZ5cq9FgF8Tz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:58:47.0035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6693ff86-4406-4e73-c2e4-08dee99c7212
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10151

On 24/07/2026 4:23 pm, Dev Jain wrote:
> 
> 
> On 24/07/26 5:23 pm, Muhammad Usama Anjum wrote:
>> On 24/07/2026 12:46 pm, Dev Jain wrote:
>>>
>>>
>>> On 24/07/26 3:54 pm, Muhammad Usama Anjum wrote:
>>>> move_pages() is best effort and can temporarily fail when concurrent
>>>> faults race with page unmapping. A busy shared-anon workload can exhaust
>>>> the current 100 retries long before the intended 20-second runtime and
>>>> produce a false failure.
>>>>
>>>> Use the full runtime as the retry window. Since the initial page location
>>>> is unknown, require it to reach both alternating NUMA targets to confirm
>>>> that cross-node migration made progress despite transient contention.
>>>>
>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>>>> ---
>>>
>>> Makes sense, but see below.
>>>
>>>
>>>> Changes since v1:
>>>> - Retry per-page failures for the full runtime
>>>> - Verify that both alternating NUMA targets are reached
>>>> ---
>>>>  tools/testing/selftests/mm/migration.c | 39 ++++++++++++++------------
>>>>  1 file changed, 21 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
>>>> index 29f7492453d43..4d55a424058a9 100644
>>>> --- a/tools/testing/selftests/mm/migration.c
>>>> +++ b/tools/testing/selftests/mm/migration.c
>>>> @@ -7,7 +7,7 @@
>>>>  #include "kselftest_harness.h"
>>>>  #include "hugepage_settings.h"
>>>>  
>>>> -#include <strings.h>
>>>> +#include <string.h>
>>>>  #include <pthread.h>
>>>>  #include <numa.h>
>>>>  #include <numaif.h>
>>>> @@ -20,7 +20,6 @@
>>>>  
>>>>  #define TWOMEG		(2<<20)
>>>>  #define RUNTIME		(20)
>>>> -#define MAX_RETRIES	100
>>>>  #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
>>>>  
>>>>  HUGETLB_SETUP_DEFAULT_PAGES(1)
>>>> @@ -110,7 +109,7 @@ int migrate(uint64_t *ptr, int n1, int n2)
>>>>  	int ret, tmp;
>>>>  	int status = 0;
>>>>  	struct timespec ts1, ts2;
>>>> -	int failures = 0;
>>>> +	int success = 0;
>>>>  
>>>>  	if (clock_gettime(CLOCK_MONOTONIC, &ts1))
>>>>  		return -1;
>>>> @@ -119,29 +118,33 @@ int migrate(uint64_t *ptr, int n1, int n2)
>>>>  		if (clock_gettime(CLOCK_MONOTONIC, &ts2))
>>>>  			return -1;
>>>>  
>>>> -		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME)
>>>> -			return 0;
>>>> +		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME) {
>>>> +			/* Reaching both targets verifies a cross-node move. */
>>>> +			if (success >= 2)
>>>> +				return 0;
>>>> +			else
>>>> +				return -2;
>>>> +		}
>>>>  
>>>>  		ret = move_pages(0, 1, (void **) &ptr, &n2, &status,
>>>>  				MPOL_MF_MOVE_ALL);
>>>> -		if (ret) {
>>>> -			if (ret > 0) {
>>>> -				/* Migration is best effort; try again */
>>>> -				if (++failures < MAX_RETRIES)
>>>> -					continue;
>>>> -				printf("Didn't migrate %d pages\n", ret);
>>>> -			}
>>>> -			else
>>>> -				perror("Couldn't migrate pages");
>>>> -			return -2;
>>>> +		if (ret < 0) {
>>>> +			perror("Couldn't migrate pages");
>>>> +			return ret;
>>>>  		}
>>>> -		failures = 0;
>>>> +		/* Migration is best effort. Try again */
>>>> +		if (ret > 0 || status < 0)
> 
> Also what if you migrated accidentally to node 0? In which case you
> will return a false success below.
What do you mean by "migrated accidentally to node 0"? Can you give an
example?

> 
> 
>>>
>>> old code wasn't using status, so why now?
>> The old code not using it does not mean we cannot use it now. ret gives the
> 
> I never implied that :) The observation was because I didn't see it mentioned
> in the commit message, this change is orthogonal to the description.
> 
> 
>> aggregate result, while status gives the per-page result: the destination
>> node on success or a negative errno explaining the failure. In particular,
>> move_pages() can return 0 with a negative status, so checking it prevents a
>> failed move from being counted as successful.
> 
> Crazy stuff. So move_pages() can return zero but that return value is not
> really the return value and you have to check status.
> 
> The man page reads:
> 
> "status is an array of integers that return the status of each page.
> The array contains valid values only if move_pages() did not return
> an error."
> 
> But then says
> 
> "On success move_pages() returns zero.  On error, it returns -1, and sets
> errno to indicate the  error. If positive value is returned, it is the
> number of nonmigrated pages."
> 
> I don't know which one to fix, the manpage or the ABI, I suspect the latter,
> storing error codes in a variable and then returning zero sounds wrong.
> 
>>
>>>
>>>> +			continue;
>>>> +		if (status != n2) {
>>>> +			printf("Page is on node %d instead of target node %d\n",
>>>> +			       status, n2);
>>>> +			return status;
>>>> +		}
>>>> +		success++;
>>>>  		tmp = n2;
>>>>  		n2 = n1;
>>>>  		n1 = tmp;
>>>>  	}
>>>> -
>>>> -	return 0;
> 
> There is no return statement after the while loop. I suspect on some compiler
> config it is gonna complain about this, or someone inevitably will run the
> selftests with an old compiler and complain about this :)
The loop cannot fall through, and the minimum supported GCC and Clang versions
recognize that. No trailing return is needed.

> 
>>>>  }
>>>>  
>>>>  void *access_mem(void *ptr)
>>>
>>
> 

-- 
Thanks,
Usama


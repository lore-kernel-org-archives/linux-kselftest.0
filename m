Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54903FB7E5;
	Tue, 25 Aug 2026 11:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656213; cv=fail; b=DNeLZLGalUgQZdNBLPOeJftEdvCredP70af9QjmEKQ+XLHh7grsggP2U8sbbLvGljqkauuKHt7v4/RgdsIWD3rwxMH5nngjlMYY64FKq+09S6AyaS/NS3xO7dV078oVFIMXSKKFIOaRdk8q9fkUzV0u85rC/STvmGmUzevYYSqg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656213; c=relaxed/simple;
	bh=o2T4a0xAPQl47A7s0Ddus0XpgwhCTZ24q6GSY1GU5J8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AIfZRm6Y4fQyvuVGqmj5o2A3TT9x6x9voVMWtSd6lVZCncvuQ0zDCuau1ECQgLzGDDVpzcqhgq5WlnI8aNbbxm80G11FThSgvpaf5WEdpgpMGjY8ZETtNtRAYc6LtpY43i2p5Ql2Abp1jcDzvMT32FVpbKN/fHLFZ0uolg1hJJM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jq8oUNVp; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jq8oUNVp; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jq8oUNVp";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jq8oUNVp"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rLJoQst4bjyFEAz6KaCLCRURbfNOLJYsExyAtsPLoxMiLCN9sFjdbLK5FR1L+wxl3lGUgtQ+Gh1qeC14ZAFPzlH5Arael72pGKw+Ec8Vj2HlGCH50VlRxDiR8jSr50282jcBwD/1+TqB1nU7TuJvpje5UOTyoD+isMMV2FZLyDtvt3WO+QqcRilaG8+LKlPGyG8Y75VxCc4JwXkhRMhGmOdmGE0XbPS/z0z6IUj2APB2a9W4HmZVjWER6tjx2cAvCgBppZeduRJ/0uioYEOwozkW7NeLiow4CNoRaEkZTsXj37I2GxCv9Kc3q598KOj+92psHq27Y9kICSq5CwL+VQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFKQkluQFy43CLwy/LH9k6zMYSt89pToT1vKjZL19XA=;
 b=ngVDS1pUOrDr9ENQCFQsC5pyWLn4EeFlQqFsbFU+KwadIpXffHTusSEw4/M+JOrV6oIUl8S2MANRIxZGaBCPNMMZpOWjnWkfrekpQzSlVSyiv//2qG87PWlIzvEsfB8kE38gNbyV3R6mx/bR4oFO5YKoueZnABijY02nw4uAlltki/E1N2tIw6ZfKhN63abXzKH2ATDYvoiaviwp1nFurEQiiOQo1ALUfpsA9PWI4YiKqC9XTs8zluy9d33tFuo7BcK9enRSSZ1fks/p557syulpgCfT3tjXLS3tKdWc6vMolKWUeipZdvuzzjeGV/v26W741EJhWLsMuPmH5Tx9ZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFKQkluQFy43CLwy/LH9k6zMYSt89pToT1vKjZL19XA=;
 b=jq8oUNVp+V8kF/DgyvrxyeZiPjaMrI6yjxNzmLqg3h7R38O8taG5IHV88NBrdkRU/yRpwXqLIAjJ9n7ywMXVVUx2R6G9ysHxZ2qvuq+b5/l3qQK3Ps6dIbHgOwJnZ5Co3SlCG66OKw8v+5VvtDq53EdLBgFQyfzkLw+FYsLoqQc=
Received: from DU2P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::24)
 by BR0PR08MB525520.eurprd08.prod.outlook.com (2603:10a6:2c8:31::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 11:10:05 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::4) by DU2P250CA0019.outlook.office365.com
 (2603:10a6:10:231::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 11:10:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 25 Aug 2026 11:10:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDIqXM4dO3CTWjS/3+QWFTZJ7Kwi/I2BpE0obpleUWgz+jpCu4lzm5zPJVkg+ZCwktUp50t09gjqw9NdvuFkYHn3LK62ZipmeCxN1sxYGZv2CtcEhfL140I4XHUtgaopGtdZwOiOqG2ZGz3FmrVe97UO7lj+FuFye61VQGIDQmlJOY+TQB3rcv1/pkYXXYxe2gTS2BCSIcTCtqSp4miklDPh24KKB+/ZmsiMdl8B/jGbj+ZS8R3n4MK3PKObpRpAty6cnfTxus0mxusEAeXcU+GbZ/S9GtNN+I5LJ7ZIJ3Qf0Rimum+LCglS+59HxVsJbn0XvgKk/vD298cneBpF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFKQkluQFy43CLwy/LH9k6zMYSt89pToT1vKjZL19XA=;
 b=x0vKO/dnRB+kVhSBa3wWi7SWAv2YZ9BGuEfwyjM0jxKFBEEtkVrWFgGug9YQ9PQnMff6sb2LwLNLRDVub42nMinZJ50D11C1VRaPwkgCqLr0vLME/1tVV0ojmKuFoeKuEEB/c+gspjvJTOySSyBWE0Vh+JByg3sdBEBshzlK9tuinyqCyUgEj42E//XB3797NCAm/OgIJ4wVAK4C7ZDvAeTi9NKaV8Cz9vDjD8DT7nQ6wtorSBg4eK2yXuegzXvYW9wiIKDoVRRj+RACtkqSKfiSYxlz0OyFAFl4muVOSOqraI9XXN940TTDP2x4mh4dxD3M42V1h2WI2YwDZuRs1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFKQkluQFy43CLwy/LH9k6zMYSt89pToT1vKjZL19XA=;
 b=jq8oUNVp+V8kF/DgyvrxyeZiPjaMrI6yjxNzmLqg3h7R38O8taG5IHV88NBrdkRU/yRpwXqLIAjJ9n7ywMXVVUx2R6G9ysHxZ2qvuq+b5/l3qQK3Ps6dIbHgOwJnZ5Co3SlCG66OKw8v+5VvtDq53EdLBgFQyfzkLw+FYsLoqQc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Tue, 25 Aug
 2026 11:09:32 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 11:09:32 +0000
Message-ID: <b97ab786-fc41-4ba3-a2df-16d32c6fe99a@arm.com>
Date: Tue, 25 Aug 2026 16:39:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] selftests/mm: add a GUP selftest
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
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
 <787b5acb-978c-453a-be81-812269f47f40@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <787b5acb-978c-453a-be81-812269f47f40@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0064.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::13) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AS8PR08MB6693:EE_|DU2PEPF00028D13:EE_|BR0PR08MB525520:EE_
X-MS-Office365-Filtering-Correlation-Id: 457e4b64-ede7-4c47-d952-08df02996ad9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 SrxrRdMqEZFW14vIKkdQoMQE3IvtfcWSqBVs4SBp0f6UZJY5Ey+v4kG4TVC/bheodkSgjtl1fwbT6VZ4rKc0J5wRESsYqfTcXgyXym3JPSy+0tUtK1wA8llnBw4Hk+i8oKa6v8iVldp47gJvIN6BJwcnaNagMY/nPtdPvom2GqzAQFjh/aDUuPKZXQrx6tBsYvBKloqIVBY+/KFgol5Weu0l5OoQVc23lRjvYpUm2FqnNjCLXdair9zqR3fx3cduByNUqOI2h7UZ2JO/ulELGxdjgi95g9WDNZmPEhzXfj1ADpnLv+fbS5SJNtZJITnU5LbzRZ4OkLSbmnom9GokZ4gkYwZvXDEInZ/Rge44FGyelNBtJibYn+mGI/gEcZ6iLIglYyGjysBZYQVM2rna5jgehK+pBdscGxDVDT0x+HQdQG6++ZNrQi9C+UQ4ckvh7KE/rZUyLDzFcS8yAN6WSaOxpbUEO5axdhXFSsLv0AXkPIJY+maSWRD4mVesvTviDIr9CpC2JxBHfO0bWAZTYFheyJIiTuXdwp0gBYK5o7p1geVzzZE3f064EN+aseSF4soEL9JhcxURzZYZAjETSPBXCk0e7tPvMzSYX3m9nBh97KToQbOwWyovb+0KCiGKeEEHR6DRXqYeIeghrJWuRDA6G159kRBk3cV5j0jtCXE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 1LNASgEQfnrFgfjuT3AD0yjShoH38ZGnqOKHWLc3YOLMkKY+Sqlzy2KmX6u+O4WzY1L0aQo83zyxo+tNoKIyPqM7jaRQbtzbYtM4NHmXOjPBfNxOktnwFbnE0xc8wc/d9uWZ90krilcmdx4zKwIPlqjaE7MRRmdTi52tjjz3NcrEcUP3IVMnEnvc1spJW3kexwZ/6P7M5EXyPGL/TZXyRCDZdzVtFWL66rHuxon1zpdxTfjecKPzshOXcUQW+eH20XU8I0xouvFRB76n1w3ZjGcf1nOQnm2Ktma+XHr4izVlkO0TKvFmxg3/itbMSK7eEdK/SxjMMEfCHz5HU9CqZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7a40497-fe41-4072-2f19-08df029956d3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|376014|23010399003|35042699022|7416014|82310400026|1800799024|10067099003|6133799003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BKsuvBZQmnEk+URIdcbDS1A62N1tmkMbg0V8/Nmq+jW5XI8q6MJTmE4SivHOs8rOJi5l1eDMAUy0PTmI9EUDrB5OezqjoG2JIvBaGdje2t5uk2fVbYfkLcrqx+Bc3MGuO0W4lBdWaT4OkslMrlUX55Ood6IDEUhwwd9H1oMlDMjc8yFL8ijCIo+BBmsnKiN7cH5Kp1/mmvHeO5yaHb9qNy9P0Qgi5BTRgWtvPbqj+GVy8Kn8ptnXV2e94/3oYp93VBHTOdqWpo0AYUOQk6Yr4FHrEBC2LdOdeOM5otLODG1oqStxyEVOdQNZAULh6teYSK93Dsgusa+eO+NLk31sCh3jo2iLwjDTKLbsW8tVQAfhIEJ5wVQ+cVnZuXREJIdIc0AYqZfVk2ZbHKw99A1bzyvVT1cNcrTWTsg8xbgAoABR8r5IaVC7hWfNfEjilZEs9MVeW1fuPbyPD3d5aVEDuGfn21+O6gp+wgl7dtYCJ6e4HjEQA8fzIcsyY/mN2Di7pwKRRJNKVCkTo8as3p01O2Cr7wLg8uQSvnGBy5pIC0PQI3P+SHPalCJp4YTe4Rban71oP7shcpDcxNV5ykzBBznLUkfUsXOR7YyMLesETRnFgsS8L5EhLoI1TRWdUqfEORLgFuYRxrVpErl2e6Wk52UhUlp97HQEPcl7ympSBYu4e4IXtpnv7gQw0139xsQssp9HQAczvuu1YsPk6T7a/w==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(376014)(23010399003)(35042699022)(7416014)(82310400026)(1800799024)(10067099003)(6133799003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1P1ygmDo+cOzWnFSWHpv8i9Y/9KHIIfnvscrm11NRaB6p7QpBLPAExb60T97DTwGfxLG+Vchzckf7qUqS5Dc7bcHUyTBCR6C8qw25GbtHxfM6Ex5FFpqck9FPcp7npj0A07F5ZTlaFgZ/uhr9tKRH9jwuG9nlOiEWKj1+kc4FyC31HuOhShpIx+56UsTcUgH57I9jQWPx6VpBi7pVhSiL5GbDj8rbhkjLbEOCV8NQTZADvQrGGh3RPomlgi/QBXeDRe9j1L3putCdeaCo+Dklz5qaePN6fxtQapQ4KLyvCxmdTdMCYRxk1R1C9kvGXQ//vJZFxa3bzjKTvgY0V1ztXG3/X1zN0rKPEoV5AOVK9zcb46Ud6JIlKtyb7o8A92IIPXiBUu0X6M2BBojy193g3vYxULZJMXvb95DY91HgRAhqWWQENXMuVwxT8e/sza7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 11:10:05.4690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 457e4b64-ede7-4c47-d952-08df02996ad9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR08MB525520

Hi David!

On 8/25/26 2:56 PM, David Hildenbrand (Arm) wrote:
> 
>> diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core-api/pin_user_pages.rst
>> index c16ca163b55e..1564b16994ad 100644
>> --- a/Documentation/core-api/pin_user_pages.rst
>> +++ b/Documentation/core-api/pin_user_pages.rst
>> @@ -228,12 +228,18 @@ Unit testing
>>  ============
>>  This file::
>>  
>> - tools/testing/selftests/mm/gup_test.c
>> + tools/testing/selftests/mm/gup.c
>>  
>> -has the following new calls to exercise the new pin*() wrapper functions:
>> +contains the following test cases to exercise pin_user_pages*():
>>  
>> -* PIN_FAST_BENCHMARK (./gup_test -a)
>> -* PIN_BASIC_TEST (./gup_test -b)
>> +* pin_user_pages via PIN_BASIC_TEST
>> +* pin_user_pages_fast via PIN_FAST_BENCHMARK
>> +* pin_user_pages_longterm via PIN_LONGTERM_BENCHMARK
>> +
>> +Run with::
>> +
>> +  make -C tools/testing/selftests/mm
>> +  ./tools/testing/selftests/mm/gup
>>  
> 
> Can we just remove that testing part in that doc completely in an earlier patch?
> I don't really see the reason for documenting selftests that way.
> 
> In particular, now that it's a proper standalone selftest.

Makes sense, I can remove this section in the 4th patch (tools/mm: move
gup_test from selftests/mm to tools/mm), since we're moving and renaming
gup_test.c in the same patch.

> 
>>  You can monitor how many total dma-pinned pages have been acquired and released
>>  since the system was booted, via two new /proc/vmstat entries: ::
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ed9a8549ae31..861504fa2e31 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17032,6 +17032,7 @@ F:	mm/gup.c
>>  F:	mm/gup_test.c
>>  F:	mm/gup_test.h
>>  F:	tools/mm/gup_bench.c
>> +F:	tools/testing/selftests/mm/gup.c
>>  F:	tools/testing/selftests/mm/gup_longterm.c
> 
> [...]
> 
>> +TEST_F(gup_test, dump_user_pages_with_get)
>> +{
>> +	run_gup_cmd(_metadata, self, variant, DUMP_USER_PAGES_TEST, 0, 1);
>> +}
>> +
>> +TEST_F(gup_test, dump_user_pages_with_pin)
>> +{
>> +	run_gup_cmd(_metadata, self, variant, DUMP_USER_PAGES_TEST,
>> +		    GUP_TEST_FLAG_DUMP_PAGES_USE_PIN, 1);
>> +}
> 
> I really don't like DUMP_USER_PAGES_TEST: running the selftests just fills the
> kernel log with useless information. And it's not like there is real value to it
> beyond what the other tests are already testing.
> 
> ... or that we would verify automatically what is being dumped makes any sense.
> 
> I'd vote to not add selftests that use it.
> 
> It was added in
> 
> commit f4f9bda418ab8b4dbc5372e9e2a28162f7777154
> Author: John Hubbard <jhubbard@nvidia.com>
> Date:   Mon Dec 14 19:05:21 2020 -0800
> 
>     selftests/vm: gup_test: introduce the dump_pages() sub-test
> 
>     For quite a while, I was doing a quick hack to gup_test.c (previously,
>     gup_benchmark.c) whenever I wanted to try out my changes to dump_page().
>     This makes that hack unnecessary, and instead allows anyone to easily get
>     the same coverage from a user space program.  That saves a lot of time
>     because you don't have to change the kernel, in order to test different
>     pages and options.
> 
>     The new sub-test takes advantage of the existing gup_test infrastructure,
>     which already provides a simple user space program, some allocated user
>     space pages, an ioctl call, pinning of those pages (via either
>     get_user_pages or pin_user_pages) and a corresponding kernel-side test
>     invocation.  There's not much more required, mainly just a couple of
>     inputs from the user.
> 
>     In fact, the new test re-uses the existing command line options in order
>     to get various helpful combinations (THP or normal, _fast or slow gup, gup
>     vs.  pup, and more).
> 
> 
> I can see why we might want a dedicated dump_page/dump_folio test that either
> 
> (1) Is ran automatically and actually verifies (somehow automatically) what is
> being dumped checks out. More tricky.
> 
> (2) Is ran manually by a suer that verifies whether what is being dumped checked
> out. More feasible.
> 
> But as is, for an automated test this doesn't make sense.

Agreed, I'll remove the DUMP_USER_PAGES_TEST cases from gup.c.

> 
> Maybe we'd want a dedicated dump_page test tool in tools/mm that would make use
> of DUMP_USER_PAGES_TEST. But maybe we also want to remove DUMP_USER_PAGES_TEST
> entirely and have a different way to trigger+test this.
> 
> Ideally we'd have a proper automated dump_page test that actually checks
> expected output (somehow).

I think we can take this up separate from this series since it would
extend the scope of the series significantly. Does it work or do you
want me to incorporate it in the same series?


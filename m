Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1F37B415;
	Mon, 20 Apr 2026 06:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667924; cv=fail; b=hk3Myt706mkTp04NT1Lo1zJ1n3bikHXYsiHauTB1FDLF7i1Ka+4Ki3j+RlQ8pSLYdVrh1hRCn3yv5mdV3zKl7bM30qq4TB5lAD9TY7adw1nsOcQzFl64R6owBuM/CrhbclpQgCqeRFXcmvJGWe9JvkIEImQAfCAUqMfA4gJcRmQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667924; c=relaxed/simple;
	bh=Y26j+0L6XuWvC3X0cZAVstRgQwY0QHvPZOO9HD9w1cE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qgmXJQMyJLt7dyG2CQXlmK5CSKnWqc4NzZgYY46QpWS/Zw2sCUZUyNma2wlHT5lZUiE7qjT93cOuc0H7F7eVzCFruEW5m0ti0Ko7FtgD9YjDDbP8O0Px9V711Xe7vRDQ0mm9IptzwTYsd/lczl/ayu96XbwHBIa6m7q+sz0tBA4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iOmsc6ru; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iOmsc6ru; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iOmsc6ru";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iOmsc6ru"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cjKBlKulD4CoIvrRubvU5XnaR2zou9UMpj2Vo5EiBpnKE0oilDDY6FhfhuUM0wyQxZ3TokVi3TtlUl8goykXlhTjcFuPjpeG+Zwpu5sFfC8ubEmccEbOF8rQG8q+rBCdZu3qGs5SD2HrL5asiadZR10C2bJfbNG+nE6EEeAtzsDeo1Z90WXakMdbfPYtqIfESlag+5gJPXBijycMQiCmk2xpmhANLDns0Umxux94Mu7ATv0PVbZ2PLXQ6xKbzKazwoJR4l8ka5erABfrB0eJmBbKvfJz3xsGOcgXgdoHSAkoB0PQlnCyIPrI1YFcCNdW94yStC2J21fLbXDFen3gfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEwgSXsJw4mt+TA5+6wliVTF5wQb1tG4b4mz+vthu/E=;
 b=UrQ8KR6uomZcfe4Ga6Tew2D5YtL/jFLub6tjrETTj1ZIuRIa4O7L74fcMl7dD2yxZqeKfSDbAuh0EkGVm4F2BJH+eyKmrI9auRc7uM6JEOxbFn8jHHrOtM/dqEFTEgUhPUw02CZhPke0XkopBc96KjZdmLZZNjUTOHkAKi2+YhDTPD4MvkYipcyrkQ/hDeqyvg+1DrhJxtdzhAqm9C6zT8hbMyDWzT7DT8fGbGwVs+E18o4FV+B2MPpV8ymRtdWBotRk1GwE4ew17LmiANrXTztHO3kA8sI6kuRp+VJgylhCMGnbdCSWZn5HGLX2EARclhidWkc0uVq0TSARfVrPQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEwgSXsJw4mt+TA5+6wliVTF5wQb1tG4b4mz+vthu/E=;
 b=iOmsc6ruSvG5ntu6qr+abUMGWZLByDH310IhsfY6bP0gQKyvGPCxzLhohJDx0rGSKvIqr5RQmB7Q185cLPUau+vmc4YosK56jl/AF8HHNMheWeQloLYS0QTH1AM5UqfPMEu1V2IaoZNifWuzsjHhb6nPfd7AHR3dur2udZqmsWA=
Received: from DB8P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::16)
 by VI1PR08MB9960.eurprd08.prod.outlook.com (2603:10a6:800:1c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 06:51:57 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::e7) by DB8P191CA0006.outlook.office365.com
 (2603:10a6:10:130::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 06:51:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 20 Apr 2026 06:51:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJeVlUdDbo4miOQrqBBG+UEJeeSrgSLtZJ6onK4aU43xSJ32xi0dYRPYS/CIAnprIRiBBkiCfTdsugrCFhlk0ddGaAkkV+0ygA1RIE8cn0oZlybJnywh7sxRdR0N9EStIKMWeIYadMZdO+ZPtjlbwRNiOYg0qXUODIcPtdq6bD/UHRQ0v2ejwn4BQPdgAbq603XfJ+vxuHhqvAgXxLtAMNd96w9ygNwTriNICjatALa4RpsPCDmkJdKpexrHJCyIFx361PcGGdK5J/floS68x1f5gdFg/a3tfJkK4l+a4Y5/oZNgfWXoUl9E1NYIy91+DIn3Exc6D6SCnD2chVBjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEwgSXsJw4mt+TA5+6wliVTF5wQb1tG4b4mz+vthu/E=;
 b=dDXu45GQH7DD9GGX6Tx1tU4CqdHqWJfTr5IFY0O4fNNZV2jKtDUEIxIBgpoN7zTxHHv4LTV2vV6/KZOLNZ2R9VUQmfFLsD8aSk7j0TJP1fqtriwFYYTvdNSkSHmbRhmqQi/0ot+SKLnkKZL2Q15Ccna2TKUKJbjeoj2Zp1PNn+NEc7uksoYIdit7tvrPw7NphzSHjFXwKmWWasowH6OLlMa5laMQv9ulJKvd8p6c4foTfTHT3bS5TphFAuIDG4b4k8flRtHlsWZkbC9oV8b/Tj88IsJB7f7imWy0zW3sOBb5J69anIkTx4vJh+1D5VJJcmoUe/lK/jxbKtFzQYQVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEwgSXsJw4mt+TA5+6wliVTF5wQb1tG4b4mz+vthu/E=;
 b=iOmsc6ruSvG5ntu6qr+abUMGWZLByDH310IhsfY6bP0gQKyvGPCxzLhohJDx0rGSKvIqr5RQmB7Q185cLPUau+vmc4YosK56jl/AF8HHNMheWeQloLYS0QTH1AM5UqfPMEu1V2IaoZNifWuzsjHhb6nPfd7AHR3dur2udZqmsWA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by PR3PR08MB5755.eurprd08.prod.outlook.com (2603:10a6:102:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 06:50:53 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 06:50:52 +0000
Message-ID: <a44aa2d7-5eb9-468a-a0ee-ee10b2b73502@arm.com>
Date: Mon, 20 Apr 2026 12:20:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/53] selftests/mm: khugepaged: enable
 collapse_single_pte_entry_compound for shmem
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lance Yang <lance.yang@linux.dev>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
 Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-3-rppt@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260406141735.2179309-3-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::15) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|PR3PR08MB5755:EE_|DU2PEPF00028D00:EE_|VI1PR08MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa7adba-231e-4b71-3da1-08de9ea95071
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 +PN54jM49bN1ij3TzreS1VeMh5ucKJhPCUOczc0OoBt7fuaMh6ycRG2FtywiBIzu7dAUgihBvedqJEFo1YrDgoA1T0Hj03FF4lCjjQFv0Q3hVArArK0U09VnBWKM0eFJ+ap5pFch3bk56eLXh54YV/uujUT6CJ9uP23w03TmM8S2T+YWMMEHErhmKf8hQAtEnhQWq4Jgr6Eci7kmRocChEGfuIjU7C7B2UWFsgsEMFsgZP78+tN3tifju4tYengzXTpkLp4h6X/j80JIZ4ePLpoHS9wEDYyYMCfYyND0Z2yp/bmojKiCDPzoK70kAjr20AngLzuklKsxkxhrq6Cw+/fk6hAEA9uuBQTUIVPZPSQFN7hmZ4mbzHcN1SPK2PAWVqDGhNQFZq8z+lQgPAdgOmvwQ1toxJLyrLoJgYwVHlYSmSRyhAogt8PdAz6smPvDrix+out1JdIa/1jLJVYtZbIX5BEkvR6vxGdZT6NsrI5WNT8A4rTRQFpQwP79rQQgG2ReDDqnzcUyVwZO6bGO0U2rnl7lxIkaA7EScKpKeqmvpYvF22JhoQ5SCHLi3mAEwybfpBqwT0e8ar5+Z5GsbIePWwulRDE7sXp6ryTqkkw/YQhp6/E2cqPFPdp4GfQqNO9oHDu+jLkwomTH1IRhcx6FjHvfank35yHpjFZu5+49m+X9Z16sqe7aRKHDL8p0hOWDyXlUbvx9Ovd5adYgvEo2wT5hCe+mC45TpEI6ybc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 rAWjhvPQWASH1zyUm4BH9wnVGliRJqAMEtfAQcGqTRUiOu+g8crhbejO+4COz7gR4TzgaUgGI2qSUOK1jrLYGM0npML1pdsG36XxLu4jfDIIfOYXmq6q3y6wo0KzpvMf2zkVoF4jdLh1MHrVxZH0lgtvL60hwz0Hgds3mWh/YqdmuiOAdoLabDeJlJuADPwcm7g7dAi0NHW6oxiZH8R2gc8iFSOg9NqeIMO7tEggXgO7h1qhq0HSlSxw/3KiGODQ0SMjGZMJVXmwAFBV4839/6NEIOwfPuxzzFtIMdjTPV6WeWyc3S4CxoKnerkJlXiVigUq6dHh6za1ZuiO0hseAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5755
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d172fd0e-5684-4c0a-fc61-08de9ea92a03
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|7416014|14060799003|35042699022|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EldmdsHrXcuBYnbBiGSGzeAp5xGLBA4XkIq4BiDK95Bkuos9CTsnbUBRRKfxbmHaOiy3O4m9vbemWir5HT57SUBCpSCLO+DkMPQqVqUxogYyKGUyIYpmExxQnhQNNfvLEJGHNNMVo+DiaFxcd1TJpX9DKVBToVbSz1BCshOgBRsplYSAT4NfnsS1Kroutwd9f8u6JJuK//C1mAIOs4+tAXQsYbVlvMNR3oSTY1U5nJCk0RwH4VnibrtS7Fhb2UVALge1+XenARWgFlp/rt7BiPAiX9/1i1xnCZV2SwnmPgmA5+Z3t28NOrErZVMN9kkT7TCz+fA9lkVBA4t8GaJhWCROHH95MicDiVQ0jFx0+0p8jPlX6sjaXm2oYnXycrOJIoGlAGGqu79zS7zmIZjA0YeLrYitcnD+M3+4yzgupEx9dWvvpCTKY9kFsl8+yl0+RQDlP6DhtvYNUDRIYuP3sA6libsYPTyl1nLMaml5BKMMjJqtjjB6EMhJqBD/iKkKYHqxxTo6r9rUkpxzxOhRv44jQ06fYidF+foWuY7kDErv29/2kqZzz3o91tzmFPmHlWOLAZ7I/Q79lWrGKk7SpYX7zxxVAIWwI3ewHYLKZKn+DmJDQ8XO5WVV1kr1/8+Z8A/eJc5eGfmePTwElAjTbfQt4mOvkmE/2DRLqEZBLKykYS8NAiMWqG15ew4zTm5HN2789WNCzQwqJSURh1BlsdKEgfB104Q12FCZBSgVcOtbaw0L68jy1hysBm78FPQc3/fG7IkPSNnMJ6zSmjbvSQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(7416014)(14060799003)(35042699022)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AE7Fl9CldDW4eyx2CrhdXNNl6N18pnnv3d45s7oGQbOE+H/dBlosCQVDivCUAU/NpbT82+8Dgd2V9oE2lZF15j6p3brPsN+yyKbq9KpzaIXFEBVOnAmpzyyfz5HIcFqFGO/B/4u+lzRlmtrfyo+ec5l9Pb703JppO8TXuyaX3nrRnKW15KKJTJwG2ZSlBaguMueaw3WkCWCXTLIcIm2YZot5K6w/DWshMaCzTOaSqtRoCgf53mF/tD4dQYvuXLz4KoGyGXroIBV8w9q/it+ETHPtEx4KVWsx0mid/qzG660/TRESXMdW5qo52nUXAtGSDfBX2ydPuVhmNPFamvmI2vcuuC5y1XYri5JVAerYN84gSQri0r50tYXyc7fXR+wvmzxUsDvQULbcze/PpqEmHF8IbFtnrQQLAaNJJqJvKs9SM5NfMUr5SFRUXKQiT/Le
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 06:51:56.8464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa7adba-231e-4b71-3da1-08de9ea95071
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9960

Hi Mike

On 4/6/26 7:46 PM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> A comment in collapse_single_pte_entry_compound() says it can't run on
> shmem because "MADV_DONTNEED can't evict tmpfs pages".
> But MADV_REMOVE can!
> 
> Use MADV_REMOVE for tmpfs to evict pages and enable
> collapse_single_pte_entry_compound() test for shmem.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> --->  tools/testing/selftests/mm/khugepaged.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 3fe7ef04ac62..e6fb01ca44ed 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -783,20 +783,17 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
>  
>  static void collapse_single_pte_entry_compound(struct collapse_context *c, struct mem_ops *ops)
>  {
> +	int advise = MADV_DONTNEED;
>  	void *p;
>  
>  	p = alloc_hpage(ops);
>  
> -	if (is_tmpfs(ops)) {
> -		/* MADV_DONTNEED won't evict tmpfs pages */
> -		printf("tmpfs...");
> -		skip("Skip");
> -		goto skip;
> -	}
> +	if (is_tmpfs(ops))
> +		advise = MADV_REMOVE;

is_tmpfs(ops) will always return false for shmem_ops, since the function
definition does not handle the shmem_ops case. Therefore, this advise
will always remain as MADV_DONTNEED.

Also, I am able to run the shmem tests using MADV_DONTNEED and the tests
succeed. So, perhaps we don't need to use MADV_REMOVE in this case?

>  
>  	madvise(p, hpage_pmd_size, MADV_NOHUGEPAGE);
>  	printf("Split huge page leaving single PTE mapping compound page...");
> -	madvise(p + page_size, hpage_pmd_size - page_size, MADV_DONTNEED);
> +	madvise(p + page_size, hpage_pmd_size - page_size, advise);
>  	if (ops->check_huge(p, 0))
>  		success("OK");
>  	else
> @@ -805,7 +802,6 @@ static void collapse_single_pte_entry_compound(struct collapse_context *c, struc
>  	c->collapse("Collapse PTE table with single PTE mapping compound page",
>  		    p, 1, ops, true);
>  	validate_memory(p, 0, page_size);
> -skip:
>  	ops->cleanup_area(p, hpage_pmd_size);
>  }
>  
> @@ -1251,8 +1247,10 @@ int main(int argc, char **argv)
>  
>  	TEST(collapse_single_pte_entry_compound, khugepaged_context, anon_ops);
>  	TEST(collapse_single_pte_entry_compound, khugepaged_context, file_ops);
> +	TEST(collapse_single_pte_entry_compound, khugepaged_context, shmem_ops);
>  	TEST(collapse_single_pte_entry_compound, madvise_context, anon_ops);
>  	TEST(collapse_single_pte_entry_compound, madvise_context, file_ops);
> +	TEST(collapse_single_pte_entry_compound, madvise_context, shmem_ops);
>  
>  	TEST(collapse_full_of_compound, khugepaged_context, anon_ops);
>  	TEST(collapse_full_of_compound, khugepaged_context, file_ops);


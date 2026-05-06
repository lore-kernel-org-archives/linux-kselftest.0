Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA843D4E1;
	Wed,  6 May 2026 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067509; cv=fail; b=slHOPffAWE5bx9IzHkUVL0orNIUqh3ZnUWLTUioTYhe1qbMaWXsAB6uuq83FE92KErn8eL5LHAoaLg+IWBb1YLu4nQ4CwaGjsFCiffzOcACfvneIMvf2EE9kSu+pAPW8bCob2/qr0uyvT9IDBH2unpzN2TD21kLeep5kEF2dPNs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067509; c=relaxed/simple;
	bh=smk77rBw47wxjrJ8y1XHiCIIVZpgSQ/q/bL4BuGSQag=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PND4ZV88G3hw9fS3tuHy0xcF/ukE3t1nahnhp/jaLinHY1HPdB9yr57vCyHNcFW6/TOrSznpnpiaEcvkqFZa/U1YY/7ZyEQjZVO+Wo9+39TEOaISDb4kHxJl1vkpLYrX6avSGmGQlld4I64vyeeXO5JzP6G/8n7cRKm4NPFh2eQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ztv3dkRo; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ztv3dkRo; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ztv3dkRo";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ztv3dkRo"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Xr1A3zygVcM1HUoA2bALb/oJuifpIBHw3lDl4dbyhtbmqnX1unRxb/TLaBGThzr18x/9FtCmFWamyqziqY3RfYRvrabZiH3cJbKI7pfpVJFrkyN94BhQ54Qim5MC53fpl1lq8D5lF4i/YMhQ67ntPksc/4o3IcJqfxl5iK9mEmtO0+hg0tQMuV0ePaOREodtMhNHtGcrydDsfpxD4/QZ7AnyZCO5cXWurBiRmpcSJAUdYziQlFAPtNgVY+6MXeec/LIzUZXB4wdvXtNSeCyApFRevgNaOb4Nka3lyBBQ30H52tJdapurEYEi4yzrG9VnV8Opn5A17MNJKjjdnGOoXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2ot/QWGgE0PEDMSgGGiwM73+j+WzRGAI9uqwD6VNsQ=;
 b=OvHzvVdmim9eIJQQdqTL7xviRY+eCMFrUxd7khzmzcIFcH+SKbiFAg8fi8aKmJ4hm91V1ie8DrOUxiKhHTMLatpw7aXVgplDFQyZdGSX/L0l8FX15YfPvqCruYJ1JgF1Lp4z1fUhFeax3JZ1m0/FrvcbPskMJIa4y3v1PSQEx/MvgMd3zeWz04d/RO7ZKRiGNOypV9Rifdgf52LyF7KGQA414Gsa7PYQYchXmmW2dx53tWXkj4FB4iDT5AavOazxt1jW4AjmQ39ahaKcJ/KDX7OVELHPoG5TXGtj9S0tYoa/9onk1M30Uel8BzEJ3qXzQGBFmJsGZit3F80Hx5g00A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2ot/QWGgE0PEDMSgGGiwM73+j+WzRGAI9uqwD6VNsQ=;
 b=Ztv3dkRoThcuNWdbXi6f8QRRqVW/4B+THMZL6plDBpgfSku6E7pJSD1S4GsPc4jmPqyshul8JVX4NjIViKcKksHpiieswH4r/eoPOIHludiLAyDADRv8lSPodOSe4qLxYOuxHuAlANsTtLsxtA0TsDdbnsIoEYNl5fublN3aumU=
Received: from DB9PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:10:1da::29)
 by PAVPR08MB10338.eurprd08.prod.outlook.com (2603:10a6:102:30d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 11:38:09 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::47) by DB9PR05CA0024.outlook.office365.com
 (2603:10a6:10:1da::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 11:38:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 11:38:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuEMIx37mWes1onMtdgIJfvsbQ8tt2Viwov6HXaH1q6uWhqXIlNUv4Qzy0Io5JzmKY391yCvDHKwY+f8MlP51rDAKY9azpDw4vwM/doLxLi2WGEaqlOYznsdQDnq2b18Mrzgf7Ntd5l1gmU+gEZkLwjYqWQKd84yvEf9aVLtjcEjMT8PAXkOCQZTbxy6rdHtDSiG0z/4eEshPSHT39aNiIYqDcE8bDWOo2bWAuKMWoeotVES1wxJ/Rm9r1SL2UmgqLymCkgitUflkCXgAu1X6LJattsOitwb5tMySd5WP10V2eNVBHGf/pfuE8XmN01DsV8VzVWRmcrGc32bmyxDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2ot/QWGgE0PEDMSgGGiwM73+j+WzRGAI9uqwD6VNsQ=;
 b=FIcQQy+VWK3wqqqEyQJ5HAizkMWKfGyNXXeMEpRgGLZ1wlK018Sk3dkMNi4xcNHcjJOeebYf+WdqiiwcD3k0/nDe29Q29HCbuHziX+RNQF6elT+n9YXFkIMazKakXTv3B4Snkrea+PznO6TdfH+r6TE7VShzPC4G6qpOMdJBmg/gjgPCh98k9Pd/2zG9zxx8yEtU99U3tgVUClZYHEssHK1aVPdVd6ZOCRJWjomEMQWxC895zRIduznzD/uwg4z8lTGE0bgacOXlGEZrwbFBef5gC+zOTVOyHtWvsISDTLamvK+jYkLun4/f5pgf7uRnH+9DRTx3Vnup+69NutY2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2ot/QWGgE0PEDMSgGGiwM73+j+WzRGAI9uqwD6VNsQ=;
 b=Ztv3dkRoThcuNWdbXi6f8QRRqVW/4B+THMZL6plDBpgfSku6E7pJSD1S4GsPc4jmPqyshul8JVX4NjIViKcKksHpiieswH4r/eoPOIHludiLAyDADRv8lSPodOSe4qLxYOuxHuAlANsTtLsxtA0TsDdbnsIoEYNl5fublN3aumU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AS2PR08MB9246.eurprd08.prod.outlook.com (2603:10a6:20b:59e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 11:37:04 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%2]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 11:37:04 +0000
Message-ID: <c555fa74-a479-4907-8e9d-70c3f9d9d6f4@arm.com>
Date: Wed, 6 May 2026 17:06:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/54] selftests/mm: move read_file(), read_num() and
 write_num() to vm_util
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
 <20260428204240.1924129-29-rppt@kernel.org>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20260428204240.1924129-29-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::13) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AS2PR08MB9246:EE_|DB1PEPF000509EA:EE_|PAVPR08MB10338:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d7f665-1fea-4991-f9c1-08deab63f2b3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 QItlRCucs9Xcrl9YuICA2y+2SGGsV+HCnLMcw9l9uFjCM55eZL5MlWygIJA2N7FiJ3N6OfTe0vLId1u0QURFAG5neCIwJ/paZ5C5wmgII/FgVK/NGuv7q2cEAweWH+BesCSwVMD3gY7+48hQtQOc7XdH+5rLTUoR3w89Mbb8++gRYtx9TyRN8i3jIPKItsSCmmP7aOvStE/zhVzJ2l/DvXC8q4TB3lPDls21ffqV/LB4a7lg3zkx4tP5B1QewMvQ85xpa3WJEFt7JzN9SoHYDnnwGisNgjz1Ylc+R8qRb8J4Xfb59qJLrycYbEnH3CVylAsfxIUbg7KAG25h4e8GQAan7Uvwsns1zKkUPtb6OPyLQ52cgpFLSZcFIX91pdFERp+FTm8prO2JcDcJG7Olz+ukf7NbZbLCMYKkO8L2ox1lehGPwwFMHjaOUC6mVsKgaY706hS9ASmxez+fHjM6GMpMwM5DSK9SJYl9UbfasiPT+2h+BDgsrHmmaN5DPGH1lpd2KqNiaQ5qrL+lbzORM5ZIJ+ff5celYcCtqKofYfyXHQN6+tBuI7F7tJBYf16NDF/u1BbZUczc42MsoNeiL9RJtvCEW1YoOOXtoU4mQD3Oaz1bUUd7zXDEvmFyAcRINTI1M8bG4OZMuLXft63RDeF1+AITXoq4RHc42LzfxuG9VRaq16u6kubBlmvfmM/d
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 ODxhcSuBE2PJ7UyniZfO0jXhqqOi7gOlp3mm8iU/DFBuJ6NDox2PirbLbMdlp2EL22qqKz3L1qj1LP7bGEhLcQ+bvB77HYUjR4mRQPrU/+bZ76xkYh8U2fq5SC0H5dI1EWx7HIybbuz+8KdtFxLCeYOFT2zRet7X1AxyRvRQO04AF9xb61i3Pea1rlnMETweggUTFtmB8i/cyPnd8Ezet8CYLGmbWZWlkHuHcILfI3Ftu/XMr04up9qZLlT6T1zg11bX9XOEeg5+1mGbGDUgONSlUve6YXzr0G+kdsK08IaMjpbuPU6tWN+1PJGK573wk2TzkmyPq4AsgMRPYHo2hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9246
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e20ff50c-5a55-428e-00e8-08deab63cbc4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|7416014|36860700016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kvE8j808VsF4Exh9OvKbJC1aloQ1+xa8anAebCopsACvKPQ2hz/0MCZgk5nwYor1jVTOEfWIxdJkaDrAkVJWyJFUwJPagF3JynbmbbtOn3v3oKqtBvQ8yq1/ZnTHBSxu4YQJAkYJTwxIxzeEu6h/p4SkCHB8YJ30aAamnXsyy815VRaAP7QXUHVpXAMdouhxlauP0lpBgmZnL/zrFhNFf+iHCQBUm32v4oA1yZq3pYDOvoAJUo4b16GtQBrbOVrvgajlKdV8GFNPVqBJj6h/MBPeWF6s0SPvcxddajVoMapKaOjtYHDfVyGejTB4AffIhL8hVD7Otye1hHOSgyOwyc7U6p8oqKsz1ssuTRC5Qh/A6y9sKVoo8UF1/hlwm2WqiAc0w5BGfW9ImVwnsclN2EfiBoiKUUXSRRq3c7zGi2kMLuT2F9PlOYkqobLFHwL8l5YuvACkvjirtxgDGEaw32pJffWEJM9HYZ+t3vqAzsPNSqrXhY3JalP8ygMcgPcD/YBbtPSlVQ+I7ZSI7MhiXhvCg+XOIh48SM+XjdVzr1xfe6x5F1MRFt9m+ozw3cRT//KylRDpDR/a7BWQjM5BPvciK7cY+1wEtJJ//APVsJl5ianhia00TghW5E0D8b9pmRIp9zJ/JVgpYOAqNB6hPudycZOOlTSFkmma7FAzXVS1wyL4YfFBcPZtIlIuUbFl6cpYnzQFvtmUUhpnXCFkUj3PaVwh25WJo/THdxIgUVI=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(7416014)(36860700016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RMtmO6faWonQFnLHiPcoWw4bdo6j2mvYpNnOGA9anakJk4Op9X2s8Jtz4hXRIc7AegWfZW+AQKDefcWralypTzdcgYgrPiEY62TAisppiceWjaW1lT4xD0dzpv+2QtPPj7yD7hb2oiprwD5R4C0LdD4FPKqwIvcv2UKRH9ZsWx3yyE3PdW6c+3okY+bzGHPwDIZQrdFoGsLafxxmE5vrOpklQ6JCxcQX3RkI9ZVNdxLyCRBctWgmWRp4q75KOpCcXna2awVB27ldW1EhNy+GwzRL3ILn4a3KxLo16zwLJvWLdjiOolQxdpM5eROstqH0iylhrERXovTFIgiFvoWYXazETS75btJ1jhV86E17GGuOc8uIEOWwFDl1RwGdwfD7l3W2XjlhX9EXLVAtPFyZXx+DNAtuDUIWS3VeFWtzX/+G1YBs2y0Js2d0kWKRXwC1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:38:09.4203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d7f665-1fea-4991-f9c1-08deab63f2b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10338



On 4/29/26 2:12 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> These are useful helpers for writing and reading sysfs and proc files.
> 
> Make them available to the tests that don't use thp_settings.
> 
> While on it make write_num() use "%lu" instead of "%ld" to match
> 'unsigned long num' argument type.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

Looks good to me.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>


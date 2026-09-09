Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65173C3F7C;
	Wed,  9 Sep 2026 18:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979687; cv=fail; b=qva1wmw/YmIMDBfkD+z/puYIC9do42X1U1eaMUVzGV1BBvkfopHUN3Ip8mPjp7ka7e5/kCYuckvjUHqw4nfBNkzMX9wkMwHEs1xcqUv+GDUQORgcqJYxlJqaHz0h4qnvTaXlKlsoaXSe4chU9Qc8xtu22Kt09Epla15WOmRM0Qs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979687; c=relaxed/simple;
	bh=iW4I8cwJYntjlBt4A304dyt6IVbG2MYKCdOyANyFw1Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B9Szey0mMw8GqSWMDLnEJM3b+/CqFfAxoz/w82DaIDC/aQxF9ua6rtBTo1TVFF8roxXdatNPKX6c9SQwQUfN/bUzq0PN1cBrYYb0UlCWLmJTixUfO6j/mf6Zo38BwHyZG4fJnzL6sDaLhFlfzONebK41Q5fvc6VR8upUlJ+X2tE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N6m16E1C; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N6m16E1C; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N6m16E1C";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N6m16E1C"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qkBXbNbqZimrI19i7Ng8aKGe1HyMERtIa4xUcre8l21Cbs0Vbo7dJbz03V8tNbRbU244WXcUJ+Pw5as/MUuNmGTdfGxWpoykugKiEG4X4gzsPnf5jA6mpHP/ghRcqcXOR20fIU0luR0jP2apG5rIyeXi6NACWxedw0p+nTECg6x+AOEeoKONzj7nW4lOAtxPVDBsY87L2dMnuzMjYvOB0Q9YPHJpnd8kUOtr7/Zokgm+89EwsBeaFmf65fNqTBopz4PzYFNojvawdqFFn5jw5uKDSTMnl+sUirKjgpMloxU3KWfejOHLGH/VKf0Z4VIwZqL5FO3zSleFg5V1Bp/G9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rlt+lXC4x/kFY2mM0Tf93RYSx0nmtQkvxKfjunCUpJg=;
 b=oLyag8EMkJmryWegI+ZJutXoYSwtUSLiWb7k1Y8n0PJSIipshwaNVaCeHLb9TrX6QqojXD7rggdDGyw71xqHe/+w/WCPX2BBFaFrC0Lz9+KpaX0Oo9vXdDwDb9DZcwNbdZ+W3daKLqzRijD13gIeUGcj1LPjBbrD3hLZn5+TDHQirfBBl90rmebzCSwUtXDNBg+3/AVHTBr4wpvCKZmvyO75X30hPZs8Czz37FEFaK1LORQSl8t6ZHlHdcZgnBXoR2Ovecv/psJxX2u0ZhgxPZc3rfSG0DOgKHT13J0JfXpltZiAR/zn61tZfgilSXerTQXeKQEcjZunYetHuNT/Mg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rlt+lXC4x/kFY2mM0Tf93RYSx0nmtQkvxKfjunCUpJg=;
 b=N6m16E1Ce3bPxR2gSIOOk+S2uTqPIRiCd6Ys6Lkdirzt5a74aCFo7LxumN3m06SQWq1waqt7tPQ2+lJwUnCO18rY5soI8xV+055etPo+jD5ncXTY/B1ZwzoC4YQmpHKBjGcpnveeZv1B43xrKbhRMxdId3SgrbIFu8MK902spS4=
Received: from AM9P193CA0011.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::16)
 by AS8PR08MB5958.eurprd08.prod.outlook.com (2603:10a6:20b:299::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 18:47:57 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::49) by AM9P193CA0011.outlook.office365.com
 (2603:10a6:20b:21e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 18:47:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Wed, 9 Sep 2026 18:47:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J00PEp+H5fuH02TyiLTX4qH1q/7opZT6w0F28r+F4IQpKhUAkOik1z3KRs19WGTbwQDIGOAnLlabEZLRRaV2rLe9/5daYbd0tyypcCv3ppfKtifT9joIZGZRJnPWmf6zxndgR4jIoBBzF/NGw2QBu0rZs3AGt+r2AXGRwoBGhVaZlcmuO9zGbC8/Y2FKGZMjtFt8g0TSwtmcxBcQszSauVZFOAWmgVqdkN2p3H2sCQrdbSHfPKiwQplnpk9PRTb3IMqczXWVyHEepx9N0qAD70V+eAsrXKOVKrqi3cSVvfDh3pijCSK9TAQwdQWoHb5nO6M+657A0vLI50dascyEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rlt+lXC4x/kFY2mM0Tf93RYSx0nmtQkvxKfjunCUpJg=;
 b=gI53BTuyYqcO1JQFGWZ7GOfiaF2SEYwEOKLdHVKGqT5mnANgQgJPXxY2gLMF4xbz7K7kmH9J8kRCZk+WSM1JDfcz4yuKDIatwpAuTvinSqbeP4DgK4xdv0OyEwuf2oGCyq1JUTpM8OE6rwI3DV4k8nA9BEuBfiz5th8o3TJPzgf+hgqoTSIBbskwGO18+CNAKhPkouMEMq7nniCONIJoi0ifzbEh0czXfnhcxvUU/Htv+q+3SnuBrXsEeL8l/fgdtn24rAsrkk9RPhnQ8s085qntuDY9rfLlersxx0CvSxz5lXuMyJTFoJaAtFkiQcsBiXf5zJECCe5IgiB6pd10jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rlt+lXC4x/kFY2mM0Tf93RYSx0nmtQkvxKfjunCUpJg=;
 b=N6m16E1Ce3bPxR2gSIOOk+S2uTqPIRiCd6Ys6Lkdirzt5a74aCFo7LxumN3m06SQWq1waqt7tPQ2+lJwUnCO18rY5soI8xV+055etPo+jD5ncXTY/B1ZwzoC4YQmpHKBjGcpnveeZv1B43xrKbhRMxdId3SgrbIFu8MK902spS4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by GV1PR08MB8401.eurprd08.prod.outlook.com (2603:10a6:150:a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 18:47:17 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%6]) with mapi id 15.21.0428.004; Wed, 9 Sep 2026
 18:47:17 +0000
Message-ID: <855fe434-c663-470f-8303-a84e7617c0f2@arm.com>
Date: Wed, 9 Sep 2026 13:47:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "shuah@kernel.org" <shuah@kernel.org>, "mingo@redhat.com"
 <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "tglx@kernel.org" <tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
References: <20260707191136.1732277-1-bill.roberts@arm.com>
 <20260707191136.1732277-2-bill.roberts@arm.com>
 <440cdd41a203589b31e287378de146e18e620176.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@arm.com>
In-Reply-To: <440cdd41a203589b31e287378de146e18e620176.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:44c::15) To PAWPR08MB9829.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB9829:EE_|GV1PR08MB8401:EE_|AMS1EPF00000045:EE_|AS8PR08MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 62234e4a-064c-4238-3add-08df0ea2dcf1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 12EForsc6vJq8oGbXa3Y3uvQxKl2AS0xM6bLSh0Gvd68ZxWmYJT4XtP6N31VcNBxu5X0Ta9pWtsxxgs+yGtWdRl7y8gmeLXd71WA7BZ91ym5lM6bjqz+CJ19OdOjDYwtqCRlouwCa4fWHPNukOJ7ZvQ1DvjpPFa+jh2A9vVU9LTUcad1auneeH9UavWYgfmqYO1kZkkyCQhJU7kgpoTmm8+loRi6OuGoLLt5U6XkIeMovvt6Abek4lbGWfA6mQ1p49JwR3e1nz/Q1Dix3uY5WIo0CFzm6YLrA6LM4L+3YVM2qIbr8hVy/1ycPoYJzwga9Ubt4crIN6FBeuUV7tGLYaJxasddfgvy/uVIF1QINVkdfQEjCFHX9BSkBaKy9tE+GTsgJT28hhGQu4a5vTlV0v4GhgF6yyheLLzSAIHubCA5R4XO1yGb6IjTPaELCyC3tXkT43bMVSRBMW7nb6RgnoB8nZy6O7RTAtAS1pWBCVvTZpRNe9WL50UyWFI1+TQgfydJ8eOh22GKyYMpmKcYjBbUofEikZ0jtsJdkl6s6yX2nDws3WGlwZZQrrx0yQC0ANoZVyAox2Y0feS+geIiGVzbevqrfHVhDnsM8SRGKco5uaZf8cjcQCJqbhYkpnF0A3vbTV8KYfcm6Fiq0c9/dgVxUXg91n6femdH7GVZOMo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 uCob/7KDI2nMIU+dCex5KuiEfWfsu8F83q7JUMJ/h5kjXV1YxnQV0yFD855lu8LT3OsnvvatB8onl8tMtxZl7K4ZvKwk4ouxlA8/qbj2Q3Psqh7yZnHNATyDTX0pPwTMee31btbZ8pQHR7EOBps1ccLSe+SKKCM6GpeOk6BLWCfV/+DY9J4imFx5vM0QLQPlIxbHjgdcZZ3kYPKDVK0emB2RZigaL2pDalEG9Kyj5G7FVKlW5nfmLDMoGq4CHJp+OkBo1o3+srTZ76Fdg5NWxYvTuDqleEnB8oCkyB8HVGUmuaFY69xoj+kg1O3jNEDbNBgOW2KiAh89D3rSSg1Jfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8401
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c93d3a8-b039-451e-754a-08df0ea2c5c6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|14060799003|1800799024|7416014|82310400026|35042699022|56012099006|11063799006|4143699003|10067099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Kgtl1e+JktSAx5fZHaApR0+lEhdlhFHkWCYdFrlkKZQKNNAlpTEa07s6Bh+NAArQAmzt16klTIXJ6wM0VYIbD/JUfllcA4US4LWyVcXT16g0IctlKuV8/FmeOVLnU6HgGd1/4PDTEuuv8NnNyOCDhhaZt+poCym39h3k0iK4OCfBT86bMRpIggyzWeSGUeo0NyMuFRMdS1rreViMvLu6v/9HbNn4/VpqDkhTS+Fl2I9OISjBOsXemgUmIBIF53vYnUTNBy6DrG92evjoHImOEnOGZWXiONYDCAO1y3C8iiCZ/xiI4bLuwuZuGCPXuH1DtMH0/55FXVp/X6sMcD462wQlScAEhJxHZpqGYGbaL01uNCSDpoe/lLkR+M3KETwHTCQaYKA/4XjyedMIH1RxZfKnQL3sMnpEjjzuUsGQr3gHRptOb+X25JcbNiTcc+QWIvalifRaCMCOhpSNysabvAUW/UiY3QBMCSv6C+P+pnGgiJRpvxR1ihla5ju/hN1NK4l1rtbY04c8OJ31KZWsWW0xDVSXecoE4CfyqLWJYzvcEmpcJ6CB8MMMZQUzHTJrxkwMnXVg8SfjwW4MXsi79luVdcF8Dl6CYICyMrP4zK5k1mHZ+uJuH2DlxP5hXVprST3S0IgIZLe/V6ymeFl0BfWRVdpFrI/zk0M6+zZ+oojQhq1TqVdlZK0VBcQyFXy0oerUeBJOqkFXolrFBP52fg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(14060799003)(1800799024)(7416014)(82310400026)(35042699022)(56012099006)(11063799006)(4143699003)(10067099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gQ9Y8nRXyV2r4MMju5sppSgrt6Lbp8QVAf67pGCOtvEMuhClVs0ebM62C/qB6DplqBkaUer+i1ks+8MnGmuwPoOQnvPCXeprkBqRpuvQcobCKoSOEp5mYI/sEDlyDF3fPi7H8xZ3pXNDyfNgcaCQGI2B2Y+GPi4+5j0jwSOIwnqLsk4NNSm2aEGYSgvjyuHYauOgiX/eCkBI032gwp3eGy1gAj+br6MUu9MSrlRrzcEmUOUkapgAxAxnxfn4kPSgnJp2M4wzNNRxS6fxic4dIsgVSHWrjevRzmm+2TQNIV1apUozfo0jpmBe/TNqDRgHrG345PlKmg8yt2HaSmbV/2y4672iRzLDQgVdsbYaXe1iAc7mN/2vaH9iz+8f9GRHKn4g0a3pmdmDAOPe7Gg48bKVOTi4SgAmJxRcz0c9R5aRVK7q6bD2LU1kZk3jPEAi
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 18:47:56.3269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62234e4a-064c-4238-3add-08df0ea2dcf1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5958


On 8/27/26 6:32 PM, Edgecombe, Rick P wrote:
> On Tue, 2026-07-07 at 14:11 -0500, Bill Roberts wrote:
>> Test that ARCH_SHSTK_UNLOCK can't be called from normal (non-ptrace)
>> context.
>>
>> Signed-off-by: Bill Roberts <bill.roberts@arm.com>
>> ---
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Rick/Dave, bump, any love on this patch series? Thanks.

Lore links for convenience:

- Re: [PATCH v2 1/2] arch/x86: handle ARCH_SHSTK_ENABLE explicitly
   - 
https://lore.kernel.org/all/d223c3e24650c3d29f162bb7faaac74ccb7bf65a.camel@intel.com/
- Re: [PATCH v2 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
   - 
https://lore.kernel.org/all/440cdd41a203589b31e287378de146e18e620176.camel@intel.com/


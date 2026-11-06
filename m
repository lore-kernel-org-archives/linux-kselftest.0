Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793972351;
	b=IcCcDIfxpOtvV9Rp4F3mrurvGMkOIlbSVcuDu29+/0W3ndCUJUCwW7pVZqvQEN+FmpuH
	 w/z77yx95/UI1Go83Roxf69xlGrpK58Ksf/5sGUJBFTBck4OQ9Cscar+fiMcJXWABt5LJ
	 R5jsM6zSe1id0mI5ghEKIX5Woss8IOPuDCOrzzDF0NB+y2imS1vFR+0Z25eJRaI3neNBB
	 LyDAtG1Gca9v7EzoBDUzePD/WP6n5ncL8bWZbp0afSnke7wFxXb3MelOexQc3WtY27vLt
	 NGRuR2RQ7bFc1JlFDHXuM8lPuJzg+IbK4ZEngMZtFAeyVAIe7AovtNRuw6TwhnNk91w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972351;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:To:Cc:References:Subject:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cEiQvqc14MNSlM20VHN4CWryBqpmQ5rN2g+vIeO+Llk=;
	b=C93D8s1/ZVoKCSqmdZMgSz8zNz1juu7A+j8ewm+jD4rizI2Hp32sabM+AlqKfY2UuoAU
	 LFmv9NOv6Pm3KzYEr7EN7bVvbNBDPShKHSwac4Nzb+UvR7D92JZqf9mKe/tuY7xRHX7dU
	 dXCDhX5tfNJwm2wYYSXip9A8dXikhogiayi2GFR9R9OnZtxF3cDz+ctbU234D4uHtzT4A
	 aS/Y9BSZSZ4D0THt0gBqdhs3YyfJsESAXQ2Cf+n5QAusRPrSelrqSTttsgSuyvqiOTeRK
	 r77HjVOsUkYfleuWMZhNl39uBqdPaSgod292Fd0vehabKo9MoXCgNOUYkyR9lEuOyjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=cD78eJqM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.29
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011029.outbound.protection.outlook.com [52.103.43.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B154606A326;
	Fri,  6 Nov 2026 13:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B154606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=cD78eJqM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Io3YquN+JxW/pMB2KFithRr8Af6spUj+V/X6A9hExCQb1cBgaqLmXYYuSrvolBDKexMnB1AsKUK2NftkkjjzyyoaUWTyJX/cFYgAbCwY9HJX6SlzUyFeGJ6aNg0hPd+W7Nv2Wbf99oD6hVYbwwzRPZL91iSGUYg5tRd6SyqFcg2oB+3Kp4gKaNhoPHKvrE2JgblRxRAMS+KwJBspb1KGSHyNc8vvQX2Ruj8YxH6cRa0aTj/B7pfwjX29E1JiU+3t0uVvDTH+JOY3WZvtLRQMWA8Lr4IHRe0WSDeWvTkClUKKnhyhlHYdW5y/oVdLngrqCGx+2I3w0Lle55u09a/E8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEiQvqc14MNSlM20VHN4CWryBqpmQ5rN2g+vIeO+Llk=;
 b=l6xjYM8cpuORlIQL++d/QF104r4Hfu3SmRp7eKJg0o9dugMEAtZcLP9r/ulUNSCmBv9mP3dxpMxMCMQPbsrVbh4kDVSVyVrJhUURABSpNuaGtgvX/NCEX1UVfOq9OHRnv9a8di/fXr1D7BN/3BzuaYUU6jRZZ+DJPYBrf84oDDevWr52TuqS/oaOWluF6PWW/UP9VuaKsbNe7tb2ewY4IzJGJ3ix++16JaQd09OiG5jzaGO0uHndAwQtbSXExdUnAqizEzJzynb0F+Fv8ZonhlLLfWRQN9viHgEcyDVn1SKecfqZwVzZmggUbv7H/QTy9Ydbt3WLgaRakRXIk03xfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEiQvqc14MNSlM20VHN4CWryBqpmQ5rN2g+vIeO+Llk=;
 b=cD78eJqMaw5/4vvt0JuCLwNXHsJTOuh4PRAseF57VimCAwcQbqMqfkqIvWO2Q2lPqoA5RQTipAWCdHzlWtkXjzE7Yy4zhngMN472gQD+yL7uM/72/EBhmR3zUkx7DiX5oHKPelc3eI6gaiXbVnYDA3e18ekvdR1ArVvHf6Kvo03td3Jux8YjjXmA0BxlxV/goUVuyNA7QnG5M2HfZ0JhmMDd9uAqY6JEq5vJ6owgV2x+GYWXCOr/Kgwoc30QfkJqA7JOQKIXdjTopUnqmqsXQXLA4I0I+EVQ/AqcMxAcYjkUC1PjEMrjRkGk/nQXdytsx2lMz7Uj6Gd47LYPK3RCKQ==
Received: from TYCPR01MB11008.jpnprd01.prod.outlook.com (2603:1096:400:3aa::9)
 by TYRPR01MB12666.jpnprd01.prod.outlook.com (2603:1096:405:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 13:39:06 +0000
Received: from TYCPR01MB11008.jpnprd01.prod.outlook.com
 ([fe80::d61c:732e:48f9:fb9f]) by TYCPR01MB11008.jpnprd01.prod.outlook.com
 ([fe80::d61c:732e:48f9:fb9f%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 13:39:06 +0000
Message-ID:
 <TYCPR01MB11008CF54ABDF98AFA4CAF30ECA762@TYCPR01MB11008.jpnprd01.prod.outlook.com>
Date: Fri, 6 Nov 2026 21:39:00 +0800
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
To: ralf@mandelbit.com
Cc: antonio@mandelbit.com, davem@davemloft.net, dxld@darkboxed.org,
 edumazet@kernel.org, horms@kernel.org, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org
References: <20261024092532.172005-18-ralf@mandelbit.com>
Subject: Re: [RFC net-next v2 17/18] selftests: net: add ipxlat coverage
From: Xavier HSINYUAN <XavierHsinyuan@outlook.com>
In-Reply-To: <20261024092532.172005-18-ralf@mandelbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0075.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2::8)
 To TYCPR01MB11008.jpnprd01.prod.outlook.com (2603:1096:400:3aa::9)
X-Microsoft-Original-Message-ID:
 <089b459f-ff75-4d45-8f43-9c9ab7bfccb5@outlook.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11008:EE_|TYRPR01MB12666:EE_
X-MS-Office365-Filtering-Correlation-Id: dca2e94d-7457-4196-985a-08df3c0b53e4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|4140399003|25010399006|24021099003|19110799012|23021999003|5072599009|15080799012|51005399006|8060799015|6090799003|25031999004|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ti9yYk5YcmZHcm9qUVcrMlRqRFNMVmhsaXp0UTFCMUFWbFRueklRR0cwSVdI?=
 =?utf-8?B?WHBFMVBvYzZBMWdQaCtiSFRjbXNmUE5hUVRWS2ptMVF3ZnZDWTk1ekZYeHli?=
 =?utf-8?B?Q3pickEvS213bUFTWUhPeGM3OVNydlhpSnF6QnZXMjNlYko2bCtsd0ZZWlFj?=
 =?utf-8?B?VmsvSWE0dWJXQnE0MUR0L0I2OEl6QW1xazZEWnhlSDF5dFU4dW5FMzNmQzk1?=
 =?utf-8?B?a2RJQThLcFZXeHhvK29WZUxFdTdGSXZzMjJsWUpsNVpueHhNWTNEZWNBQ2VR?=
 =?utf-8?B?YlBMTFBDUlpOUmN2bmx6SjFxdC91ZzVRS3k4SVdoczhEODRteW5Qd21PS25a?=
 =?utf-8?B?cUdmTVNvOEtmT0RqYysyWjVYTmh5VEVVbFVqVDJCYkQ1REhWN3llbVNqTmdm?=
 =?utf-8?B?U2srU3JlaGlTQURUWkdiSStubXorNmZlaFBxVEhZU3VYT0VJWlljazZPOTN2?=
 =?utf-8?B?SjZaWVBEcGFQbjcybnJieG1tdE1DYloyMGcxdm91Rk00dzhBdHJNYmo3UUtH?=
 =?utf-8?B?QkpEVW5zeUMvb2REbWsxV1dVOG1VQUhtNmp0VEw4L0tTeVUwZ2tvMUVKRWZE?=
 =?utf-8?B?RW9MV0RsUk0rSUR6b2NoZkFLQVZDNzhQclplRSswK2dESlY5UjVwVCt6aEVq?=
 =?utf-8?B?Mk1OMmNmV25TWUZ5YkxzSnQ2dlBYeDgxSHJDcmxNMHBWUndZZEJBeWc1QWFm?=
 =?utf-8?B?dXpGTWVucnJaUi9yREZ3cjJhcDZHWi9OeDVZZElFQTNtM0JhQnZ4eUhMeTZD?=
 =?utf-8?B?OGp2NHVTYWE1VmJtb010VlBxN2FsSVNtM3dLcHB4ZTE0RE11dHhCN2FucGJx?=
 =?utf-8?B?Z1h5MnBSM1kycmdsTjU4eVpkc0tKREJkZUlGOXhCWlFHeUhvSThhZE1QQnpm?=
 =?utf-8?B?ZTJEdGIzcXMxMDVSTTdqSkwwYnQ1WUxzY3JFVE5VNVdSenkvWlJrS2p2WGRJ?=
 =?utf-8?B?enF2cjhRUFpNRUU1M205bWdMMzlDVEVmM2E0dTJibGNmaThXdjdzcEV2YXha?=
 =?utf-8?B?KytySWkxM1BXaVRwenhTeGw0NzArcGNZT3BYUzhnaENoekhFQ2RZRjFMZjYx?=
 =?utf-8?B?dUhVRkVUblY3cVc1czhYN21mVzE4QkVVVGV2NEdYeUZJWnlXbUR2QnNVVFFh?=
 =?utf-8?B?cFY3WW13SGdlWGZta2VPUjdkSm4yU3Q5UCtHNkg2MzBVaXY1SHIvL09WZ2dw?=
 =?utf-8?B?SXdYMGJsaWRETEZ3Y29CNk5sN0Z6Ukt2d1pnM2VjdzIrUnVRZHgvR3RsTnRv?=
 =?utf-8?B?aVArRWFXbVphekNRSWZWSlNqTHpGaW9wR2gyZW10T0FhejlZcjgrcmpadUdL?=
 =?utf-8?Q?QPO2Xi9M0y28PO4eAEkyAlxdu+JSGaCNUJ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clN6WWQwTXpGM3Q4Vy9mbVV0U2dOT25FUWZFYXNoWTR3WCtzWGZEL2dDSVRy?=
 =?utf-8?B?ZjZweTNZQmd2SlpmaEI1RUFoK2NKd2R2aHlnVEQ5Vms4NEo4Wkl4aDJSczha?=
 =?utf-8?B?Y254SnhOUk44UUxhY1o2SjNEK1B1WjJzYktUbExFa0V5Yk1QSGpURUVKUDhk?=
 =?utf-8?B?cXFhTk5oVWhQN3BiUC9OTU9TNG5uSDhNeUxac2FEZ1VCNW9PQjVXdlhQb3hj?=
 =?utf-8?B?VUhIV0NQcFltaVgyRWg2WEQ3N2FIZTFSajhHcU5QOU55MGw5VkppNHRWUzYw?=
 =?utf-8?B?cDd1U21Ja3FpV2Jkb1N3SUY2dldpVFN6VTR2dHJqdHRuaVVCTlY2bGVHYzd2?=
 =?utf-8?B?N1cwWWplWUtEbW56OHNURmo5TWtsa3R6OXVMSXljUHUrZlZQWHBteVNDdGdL?=
 =?utf-8?B?cTJuaVdiY0RQOXZqN2h0Y0JrNHpSK2doWldNS09XMHNaV1I5SHgzdEpseUdk?=
 =?utf-8?B?YmhRZm0wbUg3OCtFVTFQTm01ci9vS0o4dzBSejlRQmtndlhMVnc3QTNvTEQv?=
 =?utf-8?B?VGdLc1JIbXFMd1RXL2N0ZlpyM1QzNUYvU1hlcnZRYWNtZHIyNFYxaGJ5UGtC?=
 =?utf-8?B?aHZMbVpMcWYrSUxWTVFXQ2plQWJsUGlLb2JjL1d5NllIMzRsMXFza0ZBMHk1?=
 =?utf-8?B?Vk85WW1DZHpzdUZ4aGZKOTl4TU5WRDJxVUM2RlJmY0h4cHlwelJnd2V6MTl5?=
 =?utf-8?B?dkxWOW8xMC9yUTh5ZXNoSjcvYitMZ0VUUjNDaGtOZW1JVlNXL3FwZ3loYTZK?=
 =?utf-8?B?bTRCZVMzbUtWeFJ5Y25YYlk2UFVIK1dGM2o3dDNPWjdHVUphVk1zaWp2Rm83?=
 =?utf-8?B?WEZtd1NZcURwTm5JV24ybUMwbVlVOVF1WUt5VTRyOUs2RlZFdWZ0ZktvVERP?=
 =?utf-8?B?U3dPQ2RYTllmWWV4YnBXSWdmV1hFWjJoeTRZOFRmbWQ2UEhseFlzM0ZmZnp0?=
 =?utf-8?B?Nlc2djhyWm1Ba2dZcHpFMmxVNXQzbGZacCs1OEpkTlpENVZyYmFNZG5ZMXJG?=
 =?utf-8?B?QmcvK0w5VDFOTVZtVEtLMkxxMzMzWnpOTGczakRkZlFnQ0xJN3c2VnZNT1lT?=
 =?utf-8?B?NlpkMW5ISTBtbnhMN2FmZ2dFc1dBbHVUN3BoaHFPcEhZYkJob0IrRU9VOHhx?=
 =?utf-8?B?VW4veWErSU54dU1Rb3E3T3R4eU5YS0tMSmtrN1o1c0hDMWlvdmppb2ROMnJn?=
 =?utf-8?B?aitreHdQeExLN2pISndhbzVEN0FRSGduMnl4NWwxZlMvSEExZ01Ma1llTFVN?=
 =?utf-8?B?eUZDdVNwZ2NsY0xRVy9EZ252ZTNNWVVpN1lPdnFpZVRDaFF6N2owUEtQNXpR?=
 =?utf-8?B?Y0Q1QTZzSmF6OXh1NnFIcVExWlVoQmdhYjBqYTdoQWZvRUlrcHJoUmppMXZ5?=
 =?utf-8?B?Vm9MZ2d6OUZsYVo1UkJLc0hHekRVWXM4TU9yT1l0bEpRWUR5WjVTT2hXNjlq?=
 =?utf-8?B?NmNXMkRKcmRqTVROeDFNdm5FT3l1RUZ0NWxNblh2d01RVWRaMjc5N01Jdm9L?=
 =?utf-8?B?dGMwSitUQzhTdG55L3Q1NHhSL29YVGQxSGFZcCtrdFdwdmRUWUJYdzY4MHVh?=
 =?utf-8?B?bzFNTDFiSWpyYzV5emN2Q1cxRDQyTnJmdlF6a3BQdHVRTUZZZjQ2T3ZrUGRr?=
 =?utf-8?B?eDZBdU5PUExzdXBVSm4zZ25hSHlLQ0p2Q1Z4c2k4RlpWdGlJUERTNGNnOVNj?=
 =?utf-8?B?RUZyUnpoS2wwemRtQUNwS0M5UVB4QlY3c1QwTkxtcVNrQWJuU1FSNHc1UlQ0?=
 =?utf-8?B?elNnckgxdzZWeGczcFp2MEVINjB6emJhY2pkSWF1RkhJSGxiaHUrYlE5Vnkr?=
 =?utf-8?B?YnhEYjlXNGhaUndFWEYzeHo5QXVwZE93VWtOcThTK2pXZkJ5LytJZndxZVJ2?=
 =?utf-8?B?aVkzdmt1ZldzakMrUHZGdG1DT3FWOERkdGtORVBGYkZ3azdmbUhWazhrTG5u?=
 =?utf-8?B?Mjl4ODVBMW51cy93ZkFhRnpUSVIxL0RCd2MyQVJvM3RtSGVTM011Nm5zbjNC?=
 =?utf-8?B?SGRFdzl3ME13PT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca2e94d-7457-4196-985a-08df3c0b53e4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11008.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:39:06.2339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12666

Hi Ralf,

How about adding a selftest variant that forces software GSO? This may
help catch checksum issues.

Best regards,
Xavier

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795101653;
	b=zvcvFO2f1BPsjSU0xyEsDssptEcNVu3MP4vWVE14Oz3XV5zpdyVVvr9U9LOxoEnL2x+U
	 oWHzy6JmQXhJzQiskjvylJuNT7Rej1PeHwQwG+rWfxUKVwWmfgHPtduCXGpozfgoip2d4
	 WYYByPnwwNoR1OwyuYYv/UzBhHNEFJcab3np59xAck5X3OuSUX7HU9IxHbBjoXytH6jLl
	 939SnTTIyHQ/chPi0sf60tk/ivhIirsLOYzgbNMsVs8e27xMMb7J5lxzNeTNoZI1YkWQz
	 N/xp+yvfer+CMiJyKm3LkZbh/n0jDQpKCPloEIaIEhu8JEeUBj6tPMMg3dP7OHK1c4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101653;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+gnpbqVRckoJa8Drm8ll2Y6QL50Sw6BVn8Ej5LjTHns=;
	b=l4my80zLaaw3Jjs7eCjHSBhtkTPoLY4Wc5EUPh+/5PwiZSo6F09eQaPh6M/IXd+U//OM
	 MuUf+zU+/hFGptxdDeRg4pdyq/KZeydy0n+aWkMWFFs9RQvTjdWyaAIfU/VirGc50FxMN
	 5DWS56G7BtI/nfJi1a1ASGp+120xHqOb6iND18jR9ZI+VXiEKJH5VY+LWBUD6CKR0EWC+
	 Bj/Gle6lZP441pOieYrwORnc1yo+oSzY3VF79iCQ1vRKMSSGw26l0VOcab6+HsJn5+k9L
	 AA0iBu1ZxY6tInnUbDf+XXcE/gUBB/Fj71sicAezl38NIpUTzETB1Fq7A2h2WZFjxBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rzr6mj34;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.5
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C080606A325;
	Thu, 19 Nov 2026 15:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C080606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rzr6mj34
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsCfVjjCsvfvFk8nOI7iPTto+Kg42V6tfwg8cpLAf4iSeFRr9sx0Eg1rGfbm8dpIa7Vwd0exI8SYAuJKYYLqq9+WC2EbsN/J1UoLJF7EMwtUa5jcERCCbU8NKU9JhXeruMYL7CZs/AT2eI9mCqGzzU1UMGSUi0GxEqj9liNrtWV2aWTyWZqWfEVzSo7tXKlpljgxJZt23k/dQ6r3ZMl1s75fEXtLpnEbYGneHHOCzk3yrGKhB/d/bommnSmSriGjOt7JRTJI+ObcoHKW0R7Ae23iRI3bGGehDHBRgOXwTczwqzYmUiLZ6gx4u7LKJlZtbuV7IiCIN6jGjpNut0hZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gnpbqVRckoJa8Drm8ll2Y6QL50Sw6BVn8Ej5LjTHns=;
 b=ENfI9QmArQ9Iz2v3VEIR+pMKL9S13w7tx+NrwNKiOkQz59AiWCojG/bcoTv/SKW7sayXIsg4YoKQDU2KU2l4Ll86h7AqTtlZPAtKTA+zeRhfX56MB2f73hiNH62il7d2PeIfiQS52oFYWfkWEu5TEKmVInqmun+D20ZjRaAp/PQo5dBdshrGoBq31UDg25+G/BmauC3vGM1xUwe6ej74TisyI9fyvZrdhOYn7aCzEFSLoGqpnDJts8Y8XtPyCr3sa80fJpbjrFGn+JhJOI6aCAA1Q1p6cQvOgS21t0PjS2AmiFpAWq2KGenPpDUI1n5lumqex9+E2EL14zQa0L8wlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gnpbqVRckoJa8Drm8ll2Y6QL50Sw6BVn8Ej5LjTHns=;
 b=rzr6mj34ZeOZlQq612uaksNgg5xMgI7QJ/h1TasCYo+yRUamNhXtzuCMVOYvvyNpH2l1CiYNaWPlSJ7mV3JQ6umON5pprUMNZ9v5ialTBxztfzv8BMIEd2u6KD5j9bhgfHn1TlTOCuhOSLoeTYusNKm7s1NQQy3kU9lrvbw2cS8QGN+r6ytwrRRkksCXX4fEFu9xg95QGJgLa7wXye9jK2zxFuHffTckYIH9QwtYWzvWl5yVwQijgzSaKLnveeFKIYSIqZ745QgiCelMoMS5OVqTP9OzBY3IRECGZ2B4HN+RCWh2g8P2BmUc2NeS707RrajCj2FkE73obsO1dNLPQg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 15:20:49 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 15:20:48 +0000
Date: Thu, 19 Nov 2026 17:20:39 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: netdev-bot+sashiko@kernel.org
Cc: liamsmith827@grapheneos.org, netdev@vger.kernel.org, dsahern@kernel.org,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	liamsmith827@proton.me
Subject: Re: [PATCH net-next v5 2/4] ipv4: restrict on-link fallback to
 lookup misses
Message-ID: <20261119152039.GA1980872@shredder>
References: <20261116202741.13106-3-liamsmith827@grapheneos.org>
 <179504450812.3136.16231358596487999009@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179504450812.3136.16231358596487999009@kernel.org>
X-ClientProxiedBy: TLZP290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::10) To LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e6927b-4dcc-41c5-c620-08df4650b0ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|18002099003|22082099003|3023799007|4143699003|11063799006|5023799004|10067099003|56012099006|261022075727099003|261022105027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261021135927099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	vZn5u5DWOdgelW8XBZ0kkN8JG1KZs5oDqVm9lWqgoqEh/2mnwoyPEG/LWmPc32HLsMCg+BZs4YurEjGcvgGMeGE82UXzGDRNFl+fxm8l5GRrnb0mIMs8Ea6YC++K9+ih2MbJvE78zMior4oO3LK6TliOwnfYs/85K0k0dJBAnYiwPc9Y1Pwe4MoCoP9EvxySZmdDCeRdx4kMZEolPVi+qP5ghRTfMWXmO2gKkS90Sax8jWnP7oGeyD2MlhJF94yx788hNRLOM0OKuGocdd10RDmMuLU222dX6MvHqNc6xnCfr3JnqWLcFhK/+mMlFTyTAzGaj0nibcAphs6u0YU7dnMEngGHRf3spLAeIcJ/WmOHPLtYSBXyubDKyt8OC1oabd6WWYXY/3CFx5cDt4oVsUC6v+zKOHaM8SB+UHd2/G1SJiionziEPilsmDA7JLytm0zPZNAz1RgyAMIk+hbwsooGILKqcLqA2F+NOjm2Y/XAQAMyQvovMVuI8S1/XwVEsAflMhXf+cSOdS0SX0e0XJomw4Tb54fVEeSK2KVXszOXWObtpOQ2fPKl+BkY01XVmSzQY/Le/u8Gyq9NF9OHpR8bPlaUr1zk9zj6g+DA+7FJw9uciQrU+FXbTRBy0JMa0nd2DLmDpzbHn8lTXA1j6tVPeg9KymCVi3BLZFGnkTc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(5023799004)(10067099003)(56012099006)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261021135927099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzlTdzJYczZaZUdPUG9kVVUzN0tLMEF2VEJ3azJUcnI4RFVISFVvRGIrMXpZ?=
 =?utf-8?B?MGJBcHpZNm5weTQ4MWJ3THlmdFpPVVBackVvc0dmNUx3QkdRczhBZ3hQN051?=
 =?utf-8?B?dUhCcDhGWCttVUhSODZJZ2lpcWRYSmcrenoyUFgweWdBN2ZSYmloMjdQTXR3?=
 =?utf-8?B?ZlpnWWxGTGhFelU0L0x4QzZ3TWNhdWNzMG9oQW9lQWZJVlliOVY3TXRvdmp1?=
 =?utf-8?B?cGJVclRpbjA5RW9RMFN3cS9qU3lVRDRSNzNQMjdVNE94WnBOeEt3UHcyZExa?=
 =?utf-8?B?cGtDRXozQ3BxOUxSeXh5bHNiUlBpcTE4L29wQkVBWG1ldmloOGQ3Q2RrM0VN?=
 =?utf-8?B?ejlvR3ZqZjZnbE1LTm5WdHlrdmh4cEdvMGE1M2g0OUw3bEp2R3JzQTlxR2Uw?=
 =?utf-8?B?SktVZkRNVWdwVFJpalhUb0ozWGhTU1pPc2lWSVBLREFSNW9BbGs5UmtET0pw?=
 =?utf-8?B?d2NwaFRhTlFRQkRLdmFETmtIajZESFFTUjArTGVKeHRDTVl5YjNIT2NBdCtI?=
 =?utf-8?B?TGdhamdSNXlIVnJZWHBFcHp6QWtmcVpyL0ZUSWF5R2RqN2tqTmpZcXNIaUpr?=
 =?utf-8?B?QStFclphSWN6UFU0U3YxNi9ReStnaUhMeDFGVnRFVmNWZVV4ZDlBYXU3cEVJ?=
 =?utf-8?B?c1QwMm1rbStKOUsrcVRlekVVZFl6MHVKelpqVUpBUVRTTTdQcUFQSXVTV0VC?=
 =?utf-8?B?SU43Wk0wSlUwYlkvaitkV2hnV0ozaGFzdlh3bkM5bzBwN2lENk9BYzlVM2pX?=
 =?utf-8?B?Y3YvRC9wRjYxU2RacG5MalV5OVQ3YW5PK2MzbUUzTW9INTFrejJ0ZC9Jb1Fj?=
 =?utf-8?B?bWNjbjZFZzdiQk9DZEZ4bHQ3dzNaS2EwZm9vSEVhRDVkUElVMDZjcGVDN3JD?=
 =?utf-8?B?ZURsd1NYZUNubFVOZlZxUXU0Q0ZaUndPVnZEZ0c4TlNEdHZqN2dhQjZ1OUtU?=
 =?utf-8?B?SzBFSDd1czVDNituWWFXRG84TXBaMHI5dDloWUhjcS9mUGc0OTdhN3VXTU8z?=
 =?utf-8?B?aERneHFoenVEZk5IYmFyMmswMW54dk1UcUhVUmxuQWk1UGtZSXRia1RuSlQ2?=
 =?utf-8?B?SlJkWk0wQStBTWJ5Z2E3SzZ6bGVyc2pOQkl1ZlRWbmZFaTlnV2wwQ3Y0Qnlr?=
 =?utf-8?B?TjdVQUhSWFpDL2hVS0ZJeWdVZlpKeWdhNEowYjl6aFYzQUZFSzQxUk9vS2Qz?=
 =?utf-8?B?YjBlUjdvZWhEZVJGNWQrUjdLWUdGMmpWUHYyVkE5aXhmSUpWTFcwb2Q1c2lM?=
 =?utf-8?B?bjJmL1ZmYVJGUllPakJvWmdRMmZLYnFtb0VWbWRCRTFJcDFXTUZQazQzdXNa?=
 =?utf-8?B?eDJ6U1ByN0Q5cDgwbHI1RTZSeTJ5d3laN3haM2s5UjlaMUZHV01xWm00Zzdh?=
 =?utf-8?B?YXVlYWxBNWE1dnM5c2hVb1lTOUhXYnc2SFZCN0N5Y0JMbzU1SDkyQ3dSUjQ4?=
 =?utf-8?B?K1o2Y2paellzNUpxV3lmU2dxdlRrMVZTZUNsdjA2Q0NvSGI1V0pnMlA5YUdI?=
 =?utf-8?B?dThyWnhvUTJoUlVjUGlxb1ZONG53cTh3aklrM3dmRFMxaldGdVZXaU1mZmRl?=
 =?utf-8?B?ckp4ZmhZMk5NTkVpMHFGbGg3VytOb2xVRlZvbit2MGVCLzdsWnJYcUpaQ01n?=
 =?utf-8?B?VGkvTUpXUzdKUlBjdzMxbEs4STgrZUpHaHZ6cG5HVG9vV25lZkJWbHJGVWt2?=
 =?utf-8?B?cGRqT2NhdXloWjU5amdvNU02aEZhRENIUzEwM1VXaVRNUUI3QXpNWDhydTZG?=
 =?utf-8?B?Z0FWTG5BVDAwWVBuWlBwTUt3a2RjWEFlcTdENEQ2YnBNait2S2FUS2Z0WjJF?=
 =?utf-8?B?U2U5SzBweERZNk9Oa2haeUpVRFVyMEY5djZDMHlVaUlldGF0SmJsaTlTeHB2?=
 =?utf-8?B?TmFOaXVmSVN5UmRGNk5HejFzaVo5TW1FaXlIdG9hSEJsd1pmUjNaaW8xcHJo?=
 =?utf-8?B?Ykt5RnkrZkYway9Nc2lrR2tCcUhDWDErSVlzeU56Nm9GVVAvUGFEVlBFb25T?=
 =?utf-8?B?em8vcysvS0UrT1JZb1NPNnBqcjBBWHNQSS9LREE1bGVobU5GQWZKU2J5MWVJ?=
 =?utf-8?B?cWFZeURMVlNua2RnMElNRVljdmd0R1FqdWk3VzA4aWJvNFQyOGJ5QkFlU3ph?=
 =?utf-8?B?QWIrZXBvV3g2M2hJdHA5SFdUUjllakt1ZGhBUmoxNmgyR1lZSW42S085eHR3?=
 =?utf-8?B?MFBGNGVLUzVkOHRWZitKazF3aUxieDhRWWZ5U2FhMk9hNjFudXFpUm1ZeDlC?=
 =?utf-8?B?V2JXbGVLVmlBQUh2L3gyM040dkJYRUhwZHpEOW5pUExsaGJkQlU0QU9kZHRs?=
 =?utf-8?Q?q6TyJ+UGZjcJVQ+CW3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e6927b-4dcc-41c5-c620-08df4650b0ab
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:20:48.7919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvMCU0qu1p+d5RLgBEpwNeb1VeO+58wuobSy/SVhpB4po8bTP3aoFgJqMbAzicOjb6H3fA7z+s8m4IJX0H6ODg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819

tl;dr - I believe the patch is fine as-is.

On Wed, Nov 18, 2026 at 11:28:28PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] Route-based restrictions can still be bypassed by an
>   unprivileged process after this fix.
> - [Low] The commit message describes a security-relevant bug that users
>   can see: unprivileged Android apps can get around a VPN kill switch…
> 
> --
> 
> ipv4: restrict on-link fallback to lookup misses
> 
> With this patch, ip_route_output_key_hash_rcu() takes the oif-bound
> on-link fallback for non-vrf unicast only when fib_lookup() reports a
> real lookup miss (-ESRCH, via FIB_LOOKUP_REPORT_MISS). Errors from
> blackhole, prohibit and unreachable routes or rules now go back to the
> caller, and -ESRCH is mapped back to -ENETUNREACH.
> 
> > diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> > index b9f5397336d34..b71443e4b522c 100644
> > --- a/net/ipv4/route.c
> > +++ b/net/ipv4/route.c
> > @@ -2859,12 +2859,13 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
> >  		goto make_route;
> >  	}
> >  
> > -	err = fib_lookup(net, fl4, res, 0);
> > +	err = fib_lookup(net, fl4, res, FIB_LOOKUP_REPORT_MISS);
> 
> [Severity: Low]
> The commit message describes a security-relevant problem that users can
> see: unprivileged apps can bypass the Android VPN kill switch. There is
> no Fixes: tag and no Cc: stable, though.
> 
> The unconditional on-link fallback in ip_route_output_key_hash_rcu()
> dates back to the initial git import. Should this carry something like
> the following?

No.

> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> A Fixes: tag would also make it clearer whether this is meant for net
> or net-next.
> 
> This change also depends on the earlier patch "ipv4: add
> FIB_LOOKUP_REPORT_MISS". A backport of this patch alone would fail to
> build, because FIB_LOOKUP_REPORT_MISS would be undefined, so it would
> not misbehave silently. If this is meant for stable, could the
> dependency be stated?
> 
> >  	if (err) {
> >  		res->fi = NULL;
> >  		res->table = NULL;
> >  		if (fl4->flowi4_oif &&
> > -		    (ipv4_is_multicast(fl4->daddr) || !fl4->flowi4_l3mdev)) {
> > +		    (ipv4_is_multicast(fl4->daddr) ||
> > +		     (!fl4->flowi4_l3mdev && err == -ESRCH))) {
> 
> [Severity: High]
> Can route-based restrictions still be bypassed here when the flow asks
> for link scope?
> 
> The commit message says this fixes "routes and rules that are supposed
> to restrict traffic (blackhole, prohibit, unreachable)".
> 
> An unprivileged process can bind to a device (SO_BINDTODEVICE,
> IP_UNICAST_IF, IP_PKTINFO) and also set SO_DONTROUTE or MSG_DONTROUTE.
> Neither needs a capability. In that case ip_sendmsg_scope() returns
> RT_SCOPE_LINK, and so does ip_sock_rt_scope() for connect and TCP:
> 
> include/net/ip.h:ip_sendmsg_scope() {
> 	if (sock_flag(&inet->sk, SOCK_LOCALROUTE) ||
> 	    msg->msg_flags & MSG_DONTROUTE ||
> 	    (ipc->opt && ipc->opt->opt.is_strictroute))
> 		return RT_SCOPE_LINK;
>     ...
> }
> 
> In fib_table_lookup(), the scope check runs before the reject error is
> read:
> 
> net/ipv4/fib_trie.c:fib_table_lookup() {
>     ...
> 		if (fa->fa_info->fib_scope < flp->flowi4_scope)
> 			continue;
> 		fib_alias_accessed(fa);
> 		err = fib_props[fa->fa_type].error;
>     ...
> }
> 
> Blackhole, prohibit and unreachable routes have universe scope by
> default. fib_create_info() keeps cfg->fc_scope for reject types, and
> iproute2 creates them with universe scope. A link-scope flow therefore
> skips the reject route as if it were not there.
> 
> The table then returns -EAGAIN. Because of FIB_LOOKUP_REPORT_MISS,
> fib_lookup() turns that into -ESRCH, and so does __fib_lookup() ->
> fib_rules_lookup() when custom rules exist.
> 
> The condition above then holds, and the code jumps to make_route with an
> RTN_UNICAST route on the chosen device. For example:
> 
>   ping -r -I eth1 <blocked dst>
> 
> That packet would still seem to go out eth1, even with a prohibit route
> for that destination. Before this patch every error fell back. After it,
> the same bypass needs just one more unprivileged socket option.
> 
> Rule actions (FR_ACT_PROHIBIT, FR_ACT_UNREACHABLE and FR_ACT_BLACKHOLE
> in fib4_rule_action()) are not filtered by scope. So the kill switch
> built on prohibit rules does look fixed, and only the route case
> remains open.
> 
> Could the fallback tell a real miss apart from a reject route that was
> skipped only because of scope? Another option would be to not apply the
> scope filter to reject-type aliases when deciding whether to fall back.
> 
> A later patch in the series, "ipv4: replace obsolete routing comment",
> adds the comment "Non-vrf unicast honors restrictions", which does not
> hold in this case either. Nothing later in the series changes
> fib_trie.c or this condition.

This was already addressed in v2:

https://lore.kernel.org/netdev/2503cfd2-5629-448f-bb9b-111ea239efb6@grapheneos.org/

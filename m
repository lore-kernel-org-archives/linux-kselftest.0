Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794661171;
	b=CPruJt8BoowGglupI8NCdQHFiD984Pg9iAiFBlF0O4f8X4NU83DF7grGMH507RkNBGyP
	 U3ky96/UQ1cN06c6XwLDDaqhwgMTfI8BIivCjP7IV9QThR2N6lhaKHgWP6tCPQspfN0jR
	 O+Vk/O6AY1jnuGu0Xt76DVK8zr86ReQvgkg5dhfVc0I5GnRSSX2TInynix3m+NIE4aDUu
	 AJR+koDe0jWRrO2D/FXfgD5rfTyu3I/OaUPsn3RCLPfqvEnfwqXrfaHICPD07JTwPIEVG
	 WBVawbOnNNSqh+HX/AxmfrW2xeql11AT0obarx6HTWG3vqp2arV55rtwHRTaHiHAe2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661171;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=iIlHbzz9irDmCGn2cenOpI0VONULecj9Xu4zZNgTalQ=;
	b=0Z4UB7+Z1ctHxSbZgjfWuuj+o6dQxmsp+v5EmlFGia3Nd9NMFgO/DuH4dibtN8zkp/1K
	 5eTrYwJ8dxi49KNEdxjT2hV3VpH8886pKKIfpOFAJ2WyGDbVkr374mmQGXPVkFngexK+n
	 +tv4SXORKjq2d6ORqqzh+6odbwRtrniE4idizMybzSdDWzxeYvL3S7MY02340NdFMvDo7
	 L1XJCamKeN2bICDZGdfzQEmFXm2lJs94AHMcJsktPymwPHYAoXRl8sKt4ppLlVaACsalP
	 AIMWz0yV5q+9oZ6y1rm4P2/GVSDSzK/vc6fYF2v+p6V6Op6GucjU9G+VwOu3wWT6v7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ffvFcqAe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.69
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EAC606A329;
	Sat, 14 Nov 2026 12:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46EAC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ffvFcqAe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAeZpsrzFHydttrkWnkj4J33q0YqwXKlYYee4y9TaRfLiS7ml1MFgcEfIGdAjFAI1hwdOvttxKwzOMAEK4ByZvz4Uz0ntkCuDqjF3DZ5PeGKHcoHbeldd5qBw7UdF6+nNcExHrBeGVz0EQ7DJpTrNu5X8DKr0UUP6Vc8Lau2QYRJD7qxBlWv92z12PBwyDyjKxFo/UdoQ0m9i8U4WfNe0PiodNkjAKG/g+8JhJk9xo2b0EmQLgqOqbW8mJ2uO4XHjVa/F9McVo4jDyqi9WTWrAVI5EqfWXR/BjkMCMBPdVOjyvqlTNLJpe+DxTUB+3RqUw6CO36jdq9vVwTXG2eBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIlHbzz9irDmCGn2cenOpI0VONULecj9Xu4zZNgTalQ=;
 b=lXtP/KA0eLK1zHnKtTkhMnTKv3sgQan4nIylTCtwHwkiRlvSvrgdeXY4E2K363OoRzjokhJBACGgmOe4XUpLeia4TJxtQe3fK7R4Fscd29mSerwCddU/rS8N8WrJ3zmH96zgXYHyYx4Xy3h2xAT46oVUS0xGyC9GQrpryX/Fi5zXs09U+UMqV0ULkoV+rprJRKeCUJ+S5Cl03rkF6WHuD3DiFtTb2pmYOLkzdKatZENktaN3xg4dwDEP8TtLu5Q5l32zk7n1kRozeJlBCGzeVBs3s0Ys7Hx17JUd8xrNHgojwRvKMN0D77GDY4Be+QIyVEMMq/ybgVf1eWWhsQlCwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIlHbzz9irDmCGn2cenOpI0VONULecj9Xu4zZNgTalQ=;
 b=ffvFcqAeCTwDniq0oNz6C7252y3RuezPQnFhELrZWSwTX1CDrBAA7nYyvGMwz6tTc7EfUggv6m5QP3gtXuAcptINWCZsiWV1wTv11dtWSfpy4i7x6h2QS8+aBrmf85pKb9+Q7LcBxbmsTbuGg3PJDnD3BCvrcgcraHnnPvIPjar6BB7a8EN0P54J4QMz8MdA41OWewBPuyCNVbod8Jig9vMbMBolQq5gzZGLoT19zDY/osnlXdUbsFj5KvAQQFWjcjNSQPytx81WQfCUhq2MqXT2k9ZDImBBnY8EuKytaLoOUpTcq8DkZN9RqnNmFX0mnxWqC2LL3VEeUdaoD7+Yug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by IA1PR12MB6139.namprd12.prod.outlook.com (2603:10b6:208:3e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 12:59:24 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 12:59:24 +0000
Date: Sat, 14 Nov 2026 20:59:18 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com, 
	x86@kernel.org, shuah@kernel.org, fenghuay@nvidia.com, Dave.Martin@arm.com, 
	james.morse@arm.com, babu.moger@amd.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kaihengf@nvidia.com, kobak@nvidia.com, newtonl@nvidia.com, 
	kristinc@nvidia.com
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
Message-ID: <avhZnuz2caJWIfLo@MWDK4CY14F>
References: <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
 <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com>
 <aurOz7iGKInyjddW@MWDK4CY14F>
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com>
 <auxM9hVAgp61Qbgv@MWDK4CY14F>
 <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
 <808923a4-0a6e-4d8f-8ace-d3573aa125e8@intel.com>
 <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
 <0583dad3-f761-48d5-a9a2-f2ad39567a6b@intel.com>
 <7501303c-d304-47d4-8150-b1efc8554d36@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7501303c-d304-47d4-8150-b1efc8554d36@arm.com>
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
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
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|IA1PR12MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe7b34c-0110-463b-d4e9-08df424f1b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|10067099003|5023799004|11063799006|4143699003|56012099006|261022105027099003|261022075727099003|261022113327099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Ws2ZSasYZra6RrshzxTcgHkdCndC9sSPsWJUo5fwphRIwIhcAHbtPTaMRNX9wtOHC4fWxcxbJY1M4uQQIdUSOxGTgu1CTo3anWE9nsuYBI9FGA2oJVHnwXqFA1aPMOdqen9ixfbE0zMnx/ygsXdYRC6hrTtlO30C9lnIAIA498mMj3RdB96O9In30qW6vgcQXCI7YH1PUN+hAKiWqnVio1WHnmOWgT0aqezLBXAYE0fp3WTqndc4ylWXR/AribxkV24mlZmj5uNAnJSOJIWRjzBGf6UA9rAA/PpT1bxYb9M+ouBDJqb2WYWmNdoRkwRboTByDgLmwLZ0ge9vNg4KBlDYjdw9ap0S/eFNouTGeWv+VH/P/l7rqV2trNtrrJJUo5XeP5idwFZxhygmPlqPulsVIif4SeguU9RyVltaMFYtb9HD9fpeM+LuN0kp/3xzoWGkX1T4mUjevs4UNNvoF4yqfvR6D5HUNefRzqfA/luBHBfvjaHxxDhjBitwUECzYrsv+XzMOdKbWJJTLaO0MpADg4XBlsYdSZ74AupMwAyANON0lub6GItzwH7rXIt+6zIiNpEFyHSwyQyNkgNYUr8XD6z4mv4nS83I7Bs2zJBHKajYV/YxO5qlVtxLlGEjT1Do2+/p5r4hKUar1LAnUCTBu0hTWWQYHqdrKtZUfT0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261022113327099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DyqlwUirfislw9mgOcxsyorbw8gKTo8ocPclpHbIEdNrJoh9TwJcKhQP3GMY?=
 =?us-ascii?Q?EcC2hza6YlMG/UEdi4nq9sIfsau1uJU1CD5hnjie+WzVzeq4O1revHLrETpk?=
 =?us-ascii?Q?g19yXLS9Q6JRokVb0X2hRHzsVbyGlHvd9uXGFdQW/WmYqw8LYQx3epb4jaik?=
 =?us-ascii?Q?GiUnC31I1XBXajCaJpE8LhX5C0YNISakbthFPRhu/r0AFUvmV69529m7nLjZ?=
 =?us-ascii?Q?SaOGrkmpKPNbQpIgFOCgF6aX+A1vkjT+AD9C0WeuLRBq9mts1rV9p9279gpo?=
 =?us-ascii?Q?zcjqgXVVqNUH7fy779IeG/eMGwiPpQPbB7EFokuhtP4MgyM/tdf6cW1VTtI0?=
 =?us-ascii?Q?CnufeCiqmFtt2QxfOdkFxSju7H+v8Tx0X86yLv4qt8tMAXhOYAO+rJrqxRg7?=
 =?us-ascii?Q?knxJmJBNWHER6Sxv2pqHxTcd2/mEdTvPLgRmGJDnVrKVGNKpU4VNOZlcpyK3?=
 =?us-ascii?Q?hl2aPAaYtmel3ALTZxyKqbz9WNNyEIccr4WZzyJSI2f3cyOKF32/O4lO7FlG?=
 =?us-ascii?Q?+p3Lt8ssxE86QNU9s3FUaz7NWYVjr0Wwuap+GcZysU4USUjAeroq7QwLjPDS?=
 =?us-ascii?Q?ABVtlCFXiTaef57ezKYnNItdBfJ5EJY5Bzt7IKOZ0X/QBteDNY7EKlFvE2y9?=
 =?us-ascii?Q?9fHpt5L6uDOnWgcNKEP8h9Ld3J/S4spy7kEX8y9C+AdQAhMJoUr5/bIK64fh?=
 =?us-ascii?Q?nIypkUzsrsvuLzwdEUY3qVHBzB/ZHMlcsSwJNmI4FeETZF/+EKRNJDCK8BmG?=
 =?us-ascii?Q?XLTnyHqRNj9q24Yc4Z/nRNlTJj09K7pV6j9kH5rrqnyRlzJOPegEHYVN2Z8L?=
 =?us-ascii?Q?Tc8kgZoO7yT4/u9tI4vztjdUD6KJaVzTueyDbETar9dXk+7aP+juApDpZO60?=
 =?us-ascii?Q?HBg9vbw5dfhQQS5oWIIclz9xy71/poPsgvTWs8a6nucONhJaICDBkegIsHFw?=
 =?us-ascii?Q?Ke8pMIDN1KPsWJm61pAAn4Bs4xRL9l1a/PULlWmiNM9K+E9APe3Z+9Iux3Xe?=
 =?us-ascii?Q?ygQA3SszwycOOQhWL09bw9KlDpHwDPiwA0cJRXD2hqDzVFONubouLW3Eo35Q?=
 =?us-ascii?Q?ln7Sy5MQE1rxYOG/FLvGx5UqLf7WdQWSk5w3Vvo6hk48OSFxZM1yD4k3Np55?=
 =?us-ascii?Q?2ZIuw12wz6SZmOALYDQFAV/RdcSErjVCSROCaK15YTdQLzQuFvItU/4Glmtj?=
 =?us-ascii?Q?mp7c2E1dWu9xJZoTaG5nZG1yLI1AELkFe5rz2D5okkymjWYiD0CRdVvYMKjf?=
 =?us-ascii?Q?NiarX5pUraAB0sHZcmFviQVND+sl7r9yagu5StJP+2Qp/y0I5eHD9lBtbUVR?=
 =?us-ascii?Q?rI3aOntp+1KWS797Im7RTmsOvDVU49S3X9bQ2eulzgfvOiLHshchZNJrLUgD?=
 =?us-ascii?Q?xwr3Ez54YH7aXpfamE9oB6q4g3nX8OnHU7GM59MC7Tc+TFf12WgnuQbOuYNx?=
 =?us-ascii?Q?UTZolGbN+ANN3lLk2MC+WUdb6s0IMXoAVR7pBUuCEE+avOdR3bYT1ZMU4WJ3?=
 =?us-ascii?Q?XX3jO//pSbSmLB50Fywl9XCgAbFaIOvPn+7W4jut/MDMRdSBDsNuO8WjFw2A?=
 =?us-ascii?Q?wS545Oqcw6e/5R35PIxyhg7Jci0cONEtA+nOtdLmb5nWP5dxkDsRNJmAE1M2?=
 =?us-ascii?Q?xioYJyuAgMlKxKNEPyNnSuR1GEwiSux8oVkWd4WeVefXDjqV2BlsRwLj05IK?=
 =?us-ascii?Q?DYm8MoIJx/+zINbwPNjbIkOL6UHs67NiBydncqwsucAUGU0OR/7PBbd9huYI?=
 =?us-ascii?Q?hp2JxDyDUg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe7b34c-0110-463b-d4e9-08df424f1b39
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 12:59:24.3314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tevs7Ay1fXZdgSlljaQA3kfla6WtkXwp1P+IFbYchns7FI8Atr8uQhRvUm1ppoJFMVI9r+m1h9JTPnUVvbgSFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6139

On Tue, Nov 10, 2026 at 12:35:48PM +0800, Ben Horgan wrote:
> Hi Reinette, Richard,
> 
> On 09/11/2026 17:01, Reinette Chatre wrote:
> > Hi Ben,
> > 
> > On 11/13/26 7:16 PM, Ben Horgan wrote:
> >> On 07/11/2026 00:29, Reinette Chatre wrote:
> > 
> > ... 
> >>>
> >>> If you do end up using a benchmark I'd suggest to make the checks as forgiving as
> >>> possible. For example, instead of checking something like "LLC occupancy needs to be
> >>> X when bitmap is Y" it should check something like "LLC occupancy when bitmap is all ones
> >>> is larger than LLC occupancy when only half of bitmap is ones".
> >>
> >> Do you think it's too strong to say that a bitmap with n + 1 bits set
> >> has higher occupancy than one with n bits set? I think it has slightly
> >> more utility in that all bits of the bitmap are plumbed down to a
> >> working control but I'm ok with a weaker check if a stronger check will
> >> just be problematic and maintenance heavy.
> > 
> > My comment was motivated by the recent change I needed to make to the CAT test
> > that uses cache misses measured via perf instead of cache occupancy. Originally
> > this test incremented the bitmap with one at each cycle but incrementing it with
> > two proved to be more robust.
> > 
> > What you are proposing sounds more like an enhancement to the CMT test that
> > uses cache occupancy as measurement while following the same methodology as the
> > CAT test. 
> 

Hi Ben, Reinette,

> Ok, then perhaps it's best just to enhance the CMT test to also check that the cache allocation
> bitmap has some measureable effect rather than a new test. In the spirit of making the checks as
> weak as possible we could just check that the measured llc_occupancy is lowest for the minimum
> number of cache allocation bits set, higher when half the bits set and highest when all the bits are
> set.
>

Agreed. I'll enhance the CMT test instead of adding a new one.
Please forget my "must not exceed" idea, as you said there's still an
absolute number with the same accuarcy problem.

 
> This brings us back to the initial subject of this patch. For MPAM we need a new implementation for
> memflush() as cl_flush() doesn't have a direct equivalent on arm64. There is an smmcc based option
> but the kernel support isn't upstream yet [1] and I don't know how widely it is supported in
> firmware. As such, we need to use the writing of a buffer from a different control group. This
> should be distinct from the default control group and have all cache portion bits set, as the CMT
> test uses the inverse of the testing mask for the default group. The llc_occupancy of the testing
> group can be used to check the group is clean enough, i.e. the memflush() had the desired effect.
> All this does have the disadvantage of using the same features we are checking to to help with the
> testing interface but there seems no easy way out of that while staying generic across even MPAM
> platforms.
> 

I think we can avoid the flush completely if the bitmpas are measured
from narrow to wide while the same benchmark keeps running.

Two reason I can think of to backed it up.

- Everything the test group has in the cache after the narrow step was
  allocate using the narrow bitmap, and the wide bitmap covers those portions
  as well. Nothing is left in a portion the group may not use any more, so
  there's nothing to flush before the wide step. Only going from wide to
  narrow can leave such lines behind.

- The first step doesn't need a flush either. resctrl_val() moves the task
  to the test group and writes the schemata before the buffer is allocate
  and init, so the buffer never wasa in the cache under another bitmap.

I'll work on v6 with patch 1 of this series, and patch 2 does not depend
on this so I'll send it as a standalone patch.

Best regards,
Richard Cheng.


> [1] https://lore.kernel.org/linux-arm-kernel/20261021224557.1827361-1-smadhavan@nvidia.com/
> 
> At the moment the CMT test just uses a single cycle of a hardcoded
> > (unless user provides something else) bitmap with five bits set. Even with this
> > I needed add enhancements to make it more robust:
> > 
> >  commit ca0ea39288c9 ("selftests/resctrl: Reduce interference from L2 occupancy during cache occupancy test")
> >  commit 7a214b4ec1c9 ("selftests/resctrl: Improve accuracy of cache occupancy test")
> > 
> > As one enhancement highlights the accuracy can be managed better on a system that
> > supports L2 as well as L3 allocation. Not all systems able to run such test will have such
> > capability. Also, looks like CMT does not require there to not be interference as the CAT
> > test does but with MPAM systems having each cache portion as shareable this may also be
> > a big influence on accuracy.
> > 
> > I am not able to judge if a test that uses LLC occupancy and relies on single bit increments
> > will be robust across all platforms of all architectures. Even so, I do see several risks
> > for such test to be reliable while I do not see how such fine grained increment provides
> > insight into resctrl kernel subsystem health.
> 
> Thanks for sharing your experience on the testing robustness. I now see that being as permissive as
> possible with our testing is the way to go.
> 
> Ben
> 
> > 
> > Reinette
> > 
> > 
> 

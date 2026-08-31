Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9E22DB7BF;
	Mon, 31 Aug 2026 12:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179030; cv=fail; b=tQ/j8zBK0qG21nRVL0ArqrfP1M7TMCmdSssaZogUGpvLgsqoyTYkK4xwHWMMOSNchyloa8CnDLN0JUI8dFPFc89QQlPJA0JJSkCu1kh3Wr2qq5ORvH1CqllkSg24PvnWx/+/lZh5+TIQ+/dLe/WHWMeEfQH1+YP0Kxdkj3Vr2TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179030; c=relaxed/simple;
	bh=PHUrRn5wGbVa9GBDr/8smct+JeqRt7N5tBFp0b9wkZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qaFHRCP2YvOAoNh/l1WbVxBeZliiEeGA/jP2NrBhNMUCKH1VfOFmYiUL+w13/bwZu1QzqTH/yxULg6ykIWyx3kxlbQ5WjXs/CZE/xJk254FVurUHsqxlwAcLIKJWdQ99bD4UtO/TZHMOWCT2nwTxFZYjWN+WLV+DKPL1NKq/Xhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V68hSAHU; arc=fail smtp.client-ip=40.107.200.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V68hSAHU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVqJZH5AHv2ENUAz4v18HPVOKkDSKvhiyVSOY4BRLGSefgoVTnsDJ/bm1x4ltainkd+N2AwOe8BF7Z1jcdiQpPbqXY5gp0jybjQOnaiyExCI4jeY8EnMgPHjL1zvPunyeZka2niyEWGqOW+zFwDxB0+KzgiOwgr2CEfRZJeiTwHRWVV6AGXkXINgAKIHbsZDwPDrYiCQyIB0x3iTClCLXFwHkeQmrdGWhnjmHC0ozzo+YoFrQdzBv7vslO+3NAw+TnZi8pPwxhUCX/qplJF9SfpcZvDqz46I2OvFC3JIyLRibEsdKvvsU7AIl/wqwRhGx5dypMxrrQxrlKcwm5sliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7ndMjWuKalxmuaKlrPvCqQ2sJOZ0hGesgk7M72UK+E=;
 b=xLGGHp9vqyUJlepXZruh+CJRRYxju3HTu/bK/t2tvK/HeOqBez1PwmhriujbLlKiFw2h2MiLjvECns508Wn8GZTb+AxuGiDU/ow2JUWW5HLrU/bn7IT6I7v5iJqLJyWwXoD5t3hlLcPHIt8fZLTKdJZJgNzhuSua8BGzCle+fPZfE70T+nQ3ucOxMtxfMjDKnkWOtnpMCHGKgfD+IiNTVlPZVz0+wLctl66NL9saULNf9sMIaYVBLmPg6ldMfN1QiRLF8jwzTfe1lRCLa/EYkY5bisbh8EQj9ZKAAAbmgDnhLm3X1FqE0QBAFczh7ZnECinnLRXX+w0WhUkpb0xm1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7ndMjWuKalxmuaKlrPvCqQ2sJOZ0hGesgk7M72UK+E=;
 b=V68hSAHUz4RjL58SdFQ43YVHRlabnb7XBuNdApvEG3Lk2rBfY+zOOAd5UAeg8Juxmrn3/ydsCKPcyrlih1tWIRIuTd40rD6ygHcTfm1MLBVNrT9ZSD8vB8v8o+IUBe8ftQBat6LdfJC1vWmV5NSkenF8skj3oEX0GD2ACI55WmYEsKidqKnQqJCNfvYTD5y9E1bAV9LZr2+YZ97bmS5yZ+3B01bVhbGoEvGX1V7GnbVv5EpbN/FuGilXUxodlyX1M+fovoa+2+bUW/MDfH5NvCjuF1Rm2xvXhEUb8zfxR/oY7bmDa85heZaPgfjG0q7Pw/sPUlht4n+u42cTpfeZgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 12:23:42 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 12:23:42 +0000
Date: Mon, 31 Aug 2026 09:23:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Konstantin Sinyuk <ksinyuk@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jiri Pirko <jiri@resnulli.us>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Francois Dugast <francois.dugast@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Ilia Levi <ilia.levi@intel.com>,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	jhs@mojatatu.com
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <20260831122341.GG4157646@nvidia.com>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <apAsfOowcG0cTvT8@FV6GYCPJ69>
 <apG3Gsk1TeMD-oCc@intel.com>
 <20260828170301.GA4157646@nvidia.com>
 <fabric-jason-reply.1788176463.ksinyuk@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fabric-jason-reply.1788176463.ksinyuk@kernel.org>
X-ClientProxiedBy: YT4PR01CA0433.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe18861-5a3f-46fb-1cd2-08df075ab1df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|3023799007|56012099006|5023799004|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bpWt2Qud3Kb6njlPlvbd2QArpqdSs0LVYBjYPIV+IIDBMncoOhEC73BBMfAGbCrOBv5yMMoNLMGyMPweRG/3+bnYqxHr2CxnUAFVtVRnXlnAURMs+z9w4t4EAlAGnfwm2DDHrFz57dhjteUZo1P5j8s4M9bExkU6mCYDJMUPLj30IysYfteVjS9aX5KW2hPcIBsPr2LYs6c+5EDMxTuIFAf4BvM6OCBqkNZ63o2BSj9C0xcTPnXJeCEKPi3cFcVsOiHOUKyhsZeVms+4KABN6tBXzKO7ZbHAkHvjUq03rHAGlZSmsHL0N6EXzkP9T07CBk2JHXlyNrZhdYwo/IMpMib4UK5P4AAvrxTUwCGn/IAD7hCptBmGSgKLU9pAtHMzyo4ojYTiJ//jlOu50TVyeL0mNIweYX6IBAZRt3hHxYcyo1l6cBBwq6nOh0n0686Qi3aor8Sh7UkR/u26uJKMNoVmOGobATNxi90GQvOioyu69J0uIcieXcxAt6kI3ycDcKTQ67+Jb+OgKOJWwwdOvgSnZuHsV1hTaFB508Y9as2L4XM23fkwikJuRWGUKHTAIUmgWwjH+a6Eb6kj+5j/WE4sQiB+I7iLaG9sqvGu6NR2KdJPba7rxE6JHS2WG4lS6H9BoA+0xWJ/ExxKeyn6ZwVePyD1n00zbtMNKJ7k9Og=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(3023799007)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iWmGbay1kQGhyfKNqkuZoP9vbjgo5thSs/8e9ffDVDmc3u5+xl5eF+FbXhLp?=
 =?us-ascii?Q?+xqANUl5TjBpP/89dpprtMtYYeKKRIvlw5SQ8R4z0giuSHE4ZPJjxlyC9B2H?=
 =?us-ascii?Q?Pj4DB8UvCBJbhOUMzrm3lOGCmGSgSxulVh2+NJDdTVgXNh9PqDzl/4jr+E6/?=
 =?us-ascii?Q?Z4iV9IguiXWB6fDPf4mXRZYOftxaMLhvdPDXYkhjkbi3jKhdOVL0x6Bdt40Q?=
 =?us-ascii?Q?UDZJWpQmZ0b8DPblh6Usi2BeeZKKLeaXGdzX3o10YsHlLE3X0SDUFrUYi3xq?=
 =?us-ascii?Q?OkepNnCCr6N7E6eOp+zzRNuYBl5ANAe4WWP+Es61ZJtHYyEXaQ/Rtow0YdCk?=
 =?us-ascii?Q?lVLkPdygfRT3t5aVo84rD9b9ERPf9JkZVioZE7oJpDa2wc/BomMChQak4Pti?=
 =?us-ascii?Q?4YCLxYlimZYdzMTmyRzFgkU3lQqckktNaggLRbrs9DcKuaXhkRp8kTYyJXvB?=
 =?us-ascii?Q?0uHbJlar98SHoVaWObB7c4sEEqyNCBrtqTLXnJcbSVXt17M8mNY+QyHib2Zr?=
 =?us-ascii?Q?gFkRsUHxJvtJE+uRVuXpwD+kwvWbEbkVKY4Z9wrNPFXelSzuCguiWUM0+vIC?=
 =?us-ascii?Q?Kh3UPKRrZNPKqkp/Pxlq3W7X7uma0uTAv362ozpwSrgrfamY30Xw0QFc0ysH?=
 =?us-ascii?Q?j8EFmYqYOw+l+AsHn/7Vm9xvnDAfC5JATovjdI/u1NPYXhc93eLb6exior1Y?=
 =?us-ascii?Q?/jSRsSu0zUeKu8l2Ui6/sgZWUudnh03YKrB97ULL/s1n1MAGHq2/rsSckN8L?=
 =?us-ascii?Q?yd+O01TpNFeVXFTqTCtlAQdiqWdt37i2B+eokjPr/KaiLlw46J5Zg+HBwyq0?=
 =?us-ascii?Q?lBpW/HwxidHXbKNFYwEbKfIGlgGpUszckGN1wuE/ej/tI8u51VkbEQjwgG4y?=
 =?us-ascii?Q?XPGianpArg1wCEfPq33HP6ZZbNuvEVgYNWS9KABojphWow02P8SVQoy3FsmM?=
 =?us-ascii?Q?Zg4SF8sixRedA6k/ZUxSAz2ZHgziLsHPr4dN+u85sHVzGpweSA+uZugfjKng?=
 =?us-ascii?Q?t8AY3T/VQewlmxW65aue4ofDsPL2JAEXSw9YIdB98G8hjNm1qpKGYgbDBqEm?=
 =?us-ascii?Q?CE5uUiJlKC5Ot66VWxDQ5zC0ZMEQ9C+0SYzZexs3QaZB3sfeWyg17M8jhMyN?=
 =?us-ascii?Q?VeRZPdgqAOcZBuku/CP5PG2kRFl4MgYPBWJqxprrmJnloqILnSx7NpDIOxPb?=
 =?us-ascii?Q?uzXFR74Z03kUn6nirbsQeDP1tLeez/60IhCJP3tM5TrVbzV7zb/bnlrV6QtK?=
 =?us-ascii?Q?NpIPMaKuId8rrAD1fZKW7pT+e8Hwx6DyQ9ck0CvJvH/7Nuqhg9I00t6vAxVl?=
 =?us-ascii?Q?Hv2759Jw1YneiDOzfVQuOZl1yVX4OtrhIZRFd7ArkyXzKSqI3YHcCQiO00Lv?=
 =?us-ascii?Q?1CJL1O3xFIApknRCGv6Y51lXPfhSIqPuC7H3fOhf/RE3uOfcdLqRDAKf9x9L?=
 =?us-ascii?Q?ewFrtXDQeDVHjgcdt7GdDiCLVBAZKOIJJMe/vR4a7A4MBF/UgdvgJapVqH/+?=
 =?us-ascii?Q?wbgGcRdYp/kWGx0qzck4k2CchVGDawn3M0Oj0xa8ncW5J9OwXwWmbviMVqE8?=
 =?us-ascii?Q?zJhSiDd6DMlvH25Igil3HpIT+nO1AOwvRJlFaAY2lVaurMY7ap6W9Z16u/nM?=
 =?us-ascii?Q?muT1GN6oEOjQ5qWhznZI6IxUPJg0xHUm3AZH5AAaSyFkzqvGVWpUo8rxH2L9?=
 =?us-ascii?Q?9USb6GInNNHQ51izaA9O9Hq3aZ0jiCP/x76WO1xIhTLOgDrX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe18861-5a3f-46fb-1cd2-08df075ab1df
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 12:23:42.3502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKL1k6kwlkVbt1iZ5hXp8u9N5eLphBQGdAyCWei/NIOi/6HLWma+GpQjWx3ig2a3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523

On Mon, Aug 31, 2026 at 02:45:05PM +0300, Konstantin Sinyuk wrote:
> On Fri, Aug 28, 2026 at 02:03:01PM -0300, Jason Gunthorpe wrote:
> > For something complex like this, if you can't concretetly tie the HW
> > to a net namespace, and follow the net namespace rules for visibility,
> > then it is going to be a painful choice. I speak from alot of rdma
> > experiance where net namespaces have been consistently challenging.
> 
> Agreed. The series does not provide meaningful namespace semantics; it
> is host-global and confined to init_net. I would rather make that scope
> explicit than invent per-netns fabric semantics that the hardware does
> not have.

For namespaces and permissions you need to decide on a granual of
control. For something like this is probably one of:
 - Whole machine/subsystem/fabric
 - Per ASIC / end point
 - Per ethernet port

I would kind of broadly guess you'd have one cdev for each fabric and
one cdev per asic or port...

Then you could shove a fabric into a container sensibly..

> against. I would not switch transports based on an early pre-RFC, but I
> no longer consider the transport choice settled.

It is a good moment to collaborate with Jiri so it can work out for
this use case too.

> Switches are the difficult case. A UALink switch is not a DRM device,
> and complete Pod topology may involve information owned by the Pod
> Controller and switch-management plane, not only accelerator drivers.
> If that information has to be represented as first-class objects, DRM
> may not be the right final home.

Well this series looks like it is all about telling the kernel the
routing and address map to presumably program into the HW. I guess
there is a bunch more to actually do the network trafic to get the
routing in the first place and some userspace to bridge beween the
on-link protocol and the the kernel objects?

Then there is probably another big swath to get metrics and monitoring
out of the end ports..

Jason

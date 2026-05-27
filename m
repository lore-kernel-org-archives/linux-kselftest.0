Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F66FBF;
	Wed, 27 May 2026 04:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779855341; cv=fail; b=jJMZGNr3oRu3OvH5ImnT9QgCGNWzyx4gbLakNMCrD41MyU3m8pFriAwwCeYHNbeikP5j+IMvFWhkFB9wJsjqOCGvsxUoGbBhfU2vT3VM80e15snwyz1xfZM21ybtCaNNPw/Dp7WHdgNR/25dLdLsXIQaEr1GNUgoGIxc8tmrfWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779855341; c=relaxed/simple;
	bh=sQ4vKsuCfNJ948yopXUVUobekedMQhNWy4TwXpVGE90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q9i7iOVwFPtVq3ZPVGQEGaj57UYDofyu61SLgtKazdSNjLPwxLrMndaPssEICjSYh2JagAG9otPUqZFgxHl47zASlV/Gk6xNrG2GdZ/qcChEZnEXXS5t6U0vjBKyPXlsMLE/v3znEgG7js3DsG8Piqhet/8JCHg6LVI9KHocVmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dzpWAymV; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dzpWAymV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEgSXtE86lOfOb+y0qfruBYrjiPbwp1epTolN6fjqIH9ccCJicGnV+duCQgVNcqcNJorKllIxrBHbl4ZBCUtDudZeEzVOAH4oln4ucXfA3mYbX3g7MeNU+Zutrn+KeySWe/ah3YxUd+ohQ/vYkKwgmen/wcXtCwg7z+0TDK4gdasU2C1yENQZmalWSYg7XYba/vI51GPK6m5vW/HRsb3FLJnE7Z3+jAwz1FS7cQ5/2ikg7eFd4CE6GayPRk1EU58yraNYADfBTkBGeVVXUpFEXVj9c2AdF10aDGgcIG07bLu3PktDhblZQ7uaVkOOrWrJ38h92JJUsN2dYOGWUWhpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuoqCtD5A2u0hChJnvlmmKwhyWpldzzbs2V+eDnRg8g=;
 b=Cgi1GbI6Te0qNibZmaCs9NlmtvPdJtZjKvFeccY8dFL9UvhkpWE0kY49Bmv9Rveb7k5wF9Q5cfRbuVrqryd4tRcGMmgGhxRSoYwu/eP9nSKof9vyCInqzxaLB0jBZb+RtuG9yhOvNFtbOJVxkBrYb/DyQzC2n1GHqDp49qbvtlEz2lbnsiknDXoGnjQdVy2TfBf2qTS5tLYDEf4oQTj4g78JAzAL1SGMaiAwtL1kRCZ6mfsoDG2lxxl4Ch+5q9cjrau1/k/ExQ7guhj4XHfYSbx32xDpm9v6qFs1Apu1Ea8zyumqlb4chtJcXyxIdm+M1oki5oJT+y/pJOR061noVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuoqCtD5A2u0hChJnvlmmKwhyWpldzzbs2V+eDnRg8g=;
 b=dzpWAymVTd9mdgexX1QFzaPv8gzZVJw2v0j4daoaT8Y0uHPuIL3vLffYNc9EKB4vcM7SjbuHmHgeeDArquW4Nh7wpuEAG36BKMxR7fkx4R/EBPoutQrQBtDf5Ld33Im/itCT2SfJ/B59HfFNdxIIm7z+mpsnvP6CdtmZKTZOQnz+tUxh2p4BeXy7C7rMnuX6f9Kmc9e7e3hKUt5aXwdmEBixJ0eAQ9WC9/pKmNYxlPil+4zG0smsPJLC9FCNfOOCiGP9JPi2poRrqDsJjwnXHv4zotxN2igM4xdpRAFrHtwKPBWyGDwRUThTMo4uKJy3M3EO/Gzuo2fzF2gW3KFLQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DM3PR12MB9350.namprd12.prod.outlook.com (2603:10b6:8:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 04:15:33 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 04:15:33 +0000
Date: Wed, 27 May 2026 12:15:26 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, shuah@kernel.org, 
	Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, newtonl@nvidia.com, 
	kristinc@nvidia.com, kaihengf@nvidia.com, kobak@nvidia.com
Subject: Re: [PATCH] selftests/resctrl: Add ARM vendor detection and fix
 non-contig CBM check
Message-ID: <ahZvf6_MOWOhU9BJ@MWDK4CY14F>
References: <20260526023955.7681-1-icheng@nvidia.com>
 <b1dd5e10-9121-458b-bce9-0955aa658b40@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1dd5e10-9121-458b-bce9-0955aa658b40@nvidia.com>
X-ClientProxiedBy: KU2P306CA0051.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3d::12) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DM3PR12MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d639aec-3186-4d6c-d2b6-08debba69848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/5a4eDEjDo76M3WNP5F4bb0lpuqkfYJVP1bTSUnolWqHXl4d17Bv7pSbQ0sGgRdCParyAHS9mNpzVYQgRO0XQxt0dL9PKwrlY8oBycSAU3xt2/WtZ9MkIlWCQgMOMN9cmXoitC9qTp42+AI9iciUZ/TxDQXgp3LhuTKr3D1GSOJnYUbnzl+4zJsqS8HBbF88i6MyikA+X1KMZM3M4DRG4p9vDsiiWJMVUyCc/05wTb08G8J3cGVGppavjm/RIK3j9eK7xh0HhECdrIWqXau9G36DterAqDT1kBv902b+HNp/1r/l9sA7PEkPt3gJdr7OzJUT4h7lQIVZoAu7sLoOfOsabhrBWv3L6QkksuYyIyH1tMhWOojFCfCs2dyDSWHRkCOgEWdy0eHiXlfehDRkwvP0TTxioUxdLHbIUr/luZ5yvM6L5FgN9qc1ApuZgrlbKb6wv06+pCT+xf41ZL1msc+2v5Sb275h9zrD+YVazJKR1UVipqrO9HdniKMsFRxN6eaa3uarXTYM2UDyLvLekUWy/Kns+r5c7L7+Z4KZBkjj4/UaNDKma4f+nDzmGGyOkvgJoYVIs7DwWOJP2GlAUaIm3bqXZ7xXeEo56PPU9SVv9jY/vYCCwlUFT+ErecVX/qHCVQd+vbO5COWp6W8VtDD5IkERM4arz/S0KjFNdhB3+cpXW6HmIMzmtcacA1B8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+MuyQvRhbMdmbgAi6it8T7RCXRNe6ay7YLU40Un01ZTMnv9Y3T/dbpnpltv6?=
 =?us-ascii?Q?XJmnIHmVut/JM+b2SeP6XndLicBF+c9ftZAsiphvGkhW9bTrWzJTG+YUGkM/?=
 =?us-ascii?Q?LOiLFsqd9x/XHdW5Pn83Gg9lT8qd87ueN04+NoudBV1FPTu4B8IQNidA+WFN?=
 =?us-ascii?Q?TuQlSyyLkGKoax5DbRP5VFi2kvreVgvPd1lUZ1A+6PyHdBJ34PW363F5YOWI?=
 =?us-ascii?Q?q0YcnaR0D9LhUkbmvvVhuE0JCd9YuanoUSmZqKT92dqVrfYxfayxVdtxC+Ag?=
 =?us-ascii?Q?cdfxSLIVpP9HkZCEFbLv0XqG+aOwk5oluf/LmH5GAyri/7ql2yRkQ1/B8YeM?=
 =?us-ascii?Q?rj2jYcsmLeXjEuK+8Z6qCc4sQKeTXoFP3FTkQ5Lu8/TT/KTPizN/NAvAvz4G?=
 =?us-ascii?Q?AF18nJ25R8BKuD6Im66J02C/FBM4vz0soLYqMWXEAvoWkL8GDh4clxE1nxVH?=
 =?us-ascii?Q?p/5YgTP23Jub54UgNmwbCvbpqNdnmVtuHzuG2Bhiz0fBUI1YOUjyb6EAOutB?=
 =?us-ascii?Q?U8thhjbvoug2wFaWD6mNkS0o3ACzRkqfHKRJBnh7LrOxUzCarH1FOv/pWh64?=
 =?us-ascii?Q?mYSOSW02QZ9pAxqPa/B2VVDaqeeWSqbagSir8GGxj6e7feuuGPR6oqWOIpdD?=
 =?us-ascii?Q?6h0CFfzdH1qLUbZQ+qo0hZ88YQ4GSvCCUE11NDyvpB2OHsCK27YyKXBULItk?=
 =?us-ascii?Q?uIxeBTCJbyhgntDJyUgs9AYs1gRNcBgnJzoErbXlPYJJhkLrIP2L9LMQczOI?=
 =?us-ascii?Q?eyc09SHZFiVyp+EUTc9n4L78olI8ilhRa0QsQTcpFJjCi2XF3aIu3LYsuXxU?=
 =?us-ascii?Q?OMpiuUXfuQ7+D5SsPihmivtzymPjkQG1QNyEVcsVZpAd1h0uUo5PeC8lKMbj?=
 =?us-ascii?Q?Qs3iVqrHKgKEnqCXFWHvNfrlJGJDLVAJBl0BQ7YxGM+x/1dvfjAK5TiCWpDm?=
 =?us-ascii?Q?8BdzxTkyyW+Fe/whHpRrCHlA/i0nNFK8ToyQYuIKanB1W2F89SpXKrmsE3YV?=
 =?us-ascii?Q?Uxmh+diWA0PY6yA0QZA7hH7cDEpP/qA3MkdKTRGxADngFQyJ+d/Sl5zNRkIU?=
 =?us-ascii?Q?z9T0oI6yGl3NRLFpoHOTENRDXBVDUhFk2Id9xpH44xgzNs/q62rM1O2uu6ma?=
 =?us-ascii?Q?jMjAqvnvMa0VFw5eahzLjjHPRUbFU7JN1/s+1yUXsFEh38L16RMU61kRRuZZ?=
 =?us-ascii?Q?J12CigUfqka9fz+aWtaaEHAj2iidBQd+lxe/4em6jD5dxCeip1ufL9JakW5h?=
 =?us-ascii?Q?Q7lMob5EO6hG01q1+m0yyKaEpbkQCirgRbN4EU0w/7HSzRNhV/i2ddQJNO46?=
 =?us-ascii?Q?xNWxoNveFA6rIQAhd0QiG06wBROjwoh28xy5V9fcaf60jUq5AManMbZM0/dK?=
 =?us-ascii?Q?4agRkLowPpRZCvMR+Jk/fbExXqh7QssiFKzc7jc3Tek5wDPDVrChl22241t+?=
 =?us-ascii?Q?qjhFVZlAQ/uy/iwFm7ojKXPY+8ER9S9u7tEXqRVo/+urcwfUuI8R5dGsmM30?=
 =?us-ascii?Q?51MWN9B/PN1rlcHzCX8WlYv76FPxFgf2RaM2VJML8FtLTT5+NhpReqwN8nQy?=
 =?us-ascii?Q?HS3mZwj/X/+9/CWqbHjFwGTS+So1gzwgpQbyZiRajRMHuhvDcr8qIDhOS54b?=
 =?us-ascii?Q?8G2EuqMRDow4Y1bpmfrhVVe04HSSM1Llu8kLPprw6z0Wk9My9gXiCNwlZz9Y?=
 =?us-ascii?Q?Qv699/+TVRuLtxqBngw2j+R4KcBhC0KhB5iKiYBxVztyYha7bHCbvXfySZlj?=
 =?us-ascii?Q?5WY2/o5SMA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d639aec-3186-4d6c-d2b6-08debba69848
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 04:15:33.0772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEeU2GBse4fF6p02N9lC5a4zrcmaTPwEukhoxjE789B6ZR6aXCHcwBcS34h02S75N414Llc6AieKxVYtjC0guA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9350

On Mon, May 25, 2026 at 07:51:16PM +0800, Fenghua Yu wrote:
> Hi, Richard,
> 
> On 5/25/26 19:39, Richard Cheng wrote:
> > aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
> > and arch_supports_noncont_cat() falls through to "return false".
> > L3_NONCONT_CAT spuriously fails on every ARM MPAM platform.
> > 
> > Define ARCH_ARM, short-circuite detect_vendor() to it on aarch64, and
> > add it to the AMD/Hygon alwasy-supports early-out in
> > arch_support_noncont_cat().
> > 
> > aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc...) but MPAM
> > mandates non-contiguous CPBM uniformly, so per-implementer bits is not
> > needed here.
> > 
> > Signed-off-by: Richard Cheng <icheng@nvidia.com>
> 
> I see you have three patches for selftest. Seems they are together. But they
> are not assembled in a series like [PATCH 1/3], [PATCH 2/3], [PATCH 3/3].
> 
> Could you please send them in a series?
> 
> Thanks.
> 
> -Fenghua

Hi Fenghua,

Thanks, I'll organize them in a serie and send a v2.

Best regards,
Richard Cheng.

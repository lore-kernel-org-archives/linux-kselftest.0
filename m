Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012048.outbound.protection.outlook.com [40.93.195.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB70023A564;
	Mon, 13 Jul 2026 01:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783906561; cv=fail; b=M1cnbWLNaVAPA73OvowS/9zImk2ikuw/94VEHDjvghzyvOyBaCUP4jtkHBHHbvt3ro5SC4jTLcF09i5+7VunLReWbP7+z1YBlNLAs66eVzPDoj9UoDIx3f+sN+2SAeYSlxbff9SNA7C06+yLwA3JduFhH3T+NNWKTeCdeRzU8sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783906561; c=relaxed/simple;
	bh=lP5HDYpxOdTCaP6yPxVOqcDS/dhpCEIsU53/R7VjWVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZQYTzO8jkFwcjcTIwVhvDv48xN+aSGwKLU+Sh4HUIQSWFoIMhIs8GuwBXMm3emovzbYrBePBjEMbLSWO5Nhthg+lBYS3e8AknI78VOgScSLxwAuJU6psJqocyCU/tmAPeKoVyHNWaLS9ivjxwPuKeQimJ+0jTqWkSdLrwgGdt+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V/ESUSAr; arc=fail smtp.client-ip=40.93.195.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V/ESUSAr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oO8MxAn5TK+2AE0DkQkULasWrh2EfHEGJeU0WOpkh5ALPaBJSHoBj1//blxtZv9kyicNQe3jj23n8eXhnxnVEyJb90YX7wLJj7YLBo0OBEjsWSQMY69YdymIIm5wIcwPzydVd9/vKrfNczQQ4nOQNXHZIZNIfeg2mR+qJQxyrqP6FmnsCSqLP8HW7nwxGnkAeW6ZoilFSqt9Jvm014U+y14+Wb+m/InKiCglO9w/rPGIZK+rBsE7cpiyyVcjn6zG+99KT+oo9ez57bzIWOJk2frl/uGTeV6EAtRlonRJsXzfEHQ7L3zRmIglnoCNc6N6FhRZSjwGC+aDK5kCLttGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+6tft/9e3XwymgV9dO/L+ZMECpCe0LuMjUJ83Wf9IM=;
 b=gD0cEE22MVhu0bo0d0b2eXWX3iRo71t06HFbM94QgoeIugARk+DHpF1B2q5tjXGmRTuMfis0givqEJWguRm2WjmBqt+uXkG5+MY+jvKrch+S+ohERhdOE6PIKnO1HTvkP4KufwOconQtzyERVX1H5aFSxOyDMmTnAINQPkxVGxhd40V5Fcb3JdWiRy5v/06DOtRJX3OJU7hxnTIW5T6E2wVjqHsAiwo4h4rVP0j4pgWHFJG7FEhb/HLX7ahZ6FdA40/3u7n4S3tU2rOM58OfbcKYiUsvaAFlltDHQ/rapG1cXffuMBobg1fNT0wU/+N5Bke2V6v873pLssXz06D+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+6tft/9e3XwymgV9dO/L+ZMECpCe0LuMjUJ83Wf9IM=;
 b=V/ESUSAryFWRyrtvmvfM8feg6o7Oa5UTU5b6zXwIDWlN29aHnmCBNpMwmRWU8wlutvHA8Z81/5DvMts/qMbuCf/ubN2gfRii64aL9wqWNe/ecZudUk7IB/zqPJemycFevqlMPq6TjYvXDuFTw68TpPIuTwJUKz/kxa9vzFaVNYp9YwwWM5YI+40tzEvG0LhV+G0E3rAVFU9CuEkq0UoGc0jHKNfKAVnHjgfoleCXZ91x7/QOcCaT+wyfg05o+lnohTsXIpPQgJsfEcFCY1vVzX2HJRBdQKWr1TQfxds212u0IyyEk8RCrpYsJw3mrrJGV/woELpvkQPYn1fSDJedtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB5001.namprd12.prod.outlook.com (2603:10b6:610:61::18)
 by SN7PR12MB7300.namprd12.prod.outlook.com (2603:10b6:806:298::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Mon, 13 Jul
 2026 01:35:56 +0000
Received: from CH2PR12MB5001.namprd12.prod.outlook.com
 ([fe80::89e3:6df0:de90:8dfe]) by CH2PR12MB5001.namprd12.prod.outlook.com
 ([fe80::89e3:6df0:de90:8dfe%3]) with mapi id 15.21.0181.014; Mon, 13 Jul 2026
 01:35:56 +0000
Date: Mon, 13 Jul 2026 11:35:51 +1000
From: Balbir Singh <balbirs@nvidia.com>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: jgg@ziepe.ca, leon@kernel.org, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hongfu.li@linux.dev, SJ Park <sj@kernel.org>
Subject: Re: [PATCH v2] selftests/mm: Fix memleak in migration benchmark
Message-ID: <alRAtI7BfpK7Toy2@parvat>
References: <20260709081843.1451202-1-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709081843.1451202-1-lihongfu@kylinos.cn>
X-ClientProxiedBy: MEWPR01CA0267.ausprd01.prod.outlook.com
 (2603:10c6:220:1ed::11) To CH2PR12MB5001.namprd12.prod.outlook.com
 (2603:10b6:610:61::18)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB5001:EE_|SN7PR12MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 7088d594-ad24-427a-cb2d-08dee07f159c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UzbOnOqg7JNMdeND5CQ/TjzA+IZos93OfMwU7S2c2BY4DdAmnaKvaqLEjSbyyxaWo++ocYMOYWIz2+psSoKR4rTZjO/8UKrU3dQiBNZXSa0mFFyZA8nXLrV2/AgOPpVPQIsFzhOpMODOEL+5qPvvtNscb6jE7zTbvmDaIRsRUAf79sfQKDyZQaQeWIqjs9hJRAaqtwS6aLDnOjOyjbmhRxKnohUcscL7s1fmGYi3O16p6fBxTLLUTxQRrm3DO+997ClajuspH9G1zlcGKhfq8K7jtdZs2wjRexbhm1ogVyFcz4seAVsynPiNodTrcNdsFNNRZqEmHuRFUiWAAREj3APm29fATtbnomz6Cvt12km3exGUGPPHWf/feoEDgU6wXoYdJ08JQ7DapUevKiOTTrfu0gHq0gi4NauwsIjIRL37u37I6eBDmOO9kKA0iX4hDK4VeDkH/tzBG7zU/thwbohS1778iDqJHMsB5Ilvv3c6dwARJWAdT3gsicshrm+HYqllwkqqvBjuLH8krtEpUBo37Fk3wLZ7E31++PxVFYw01gpN/6zKOSIlJa7f07vKd9g8+dPEtVRMbhooauj+oT6fLGj14GRrsxeARjqNrUFLmyurmp7fjpmjs06dmaMnNVnYotBetcgeYeX2MvAl1SHID+rVExJUzBRlxnLwaeg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB5001.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3iP3xPdEZh5rNlGAhDt5PgsD766j64OCuoVL3/k1jDGav8YgLvQdOaqInnMZ?=
 =?us-ascii?Q?69QyIPFD73BMPDuLPKc7aORfBEF5Hgk19clP0e0zb77vhVwjLhbH2z1ji7fy?=
 =?us-ascii?Q?UGGdjMdRDKu+NjVLNOFE7036o3HjqK2eAJ0kanOpQej+oQyZAiwF8jafXR6A?=
 =?us-ascii?Q?V2syF1lI09+t79IcqY6lRxrw8+eC0/q/9Y90vjS2Ds2cOeO61QWzQCulLOo0?=
 =?us-ascii?Q?PfGlqoIspFb28snECCdMHSfLlkc25+n4OrLDT3+nJD0gBuEmFMd08CjvubZ0?=
 =?us-ascii?Q?jOV+AGzBy+M0vJUGg8yzr/5O51CcM5K5dv5EkYXzsgqgeI51u5C0fvs113FI?=
 =?us-ascii?Q?8ilSjLU3d4APGvA71mqVqJxLIEYB7WayzFNK6rvuyA1pIqg3TNmOyr2iUMxR?=
 =?us-ascii?Q?2vy0zcp2As8+cju6N1SpUla5qkNi69IbsGlylYfk7rQ8FGZ29uJCqUHNKQE8?=
 =?us-ascii?Q?1uOb7DQ1hlrSnCnpvru6kjNleX3pdOvfQX900+oL4s8oO6cyyN7eqGf261na?=
 =?us-ascii?Q?ph1K1wII6weJTCwnGcbVc8zqHHIFdqc7d5eBCgZuZqdlpYFeoxxaAaSA635a?=
 =?us-ascii?Q?HXiL72ACFDq9x1TmhT7pbfJlySNiipDafvB4Y+39JSoe017P+mazVExvsduk?=
 =?us-ascii?Q?sskyTEAKdpG3MusHyQivdMu95lv20nc3SP+bZTX2+KBfpNIwFrHwaUkMQY9l?=
 =?us-ascii?Q?T3jC6lth/kT0uVmSbKsWkaYt+/Q249LYGKoCeWGwI+vpUIrF2U3yQ38p6UBX?=
 =?us-ascii?Q?gl3p8QmPgvbdZH4GXuILuFX8EDdOEqFrHjBxgOLBO7Tv+SC+paG7Pd3XePIJ?=
 =?us-ascii?Q?JvdUlpa5w4YUyFJfC2Z762ulplj8mKKnKIJGexQwmt1j7uS4UfXyaPDmdGa5?=
 =?us-ascii?Q?iWqO+vfZoC/xyICUa5kkZCr5bcOH1iCjBHYWy8YCDSMVaPHtjSAFQz6FwVWm?=
 =?us-ascii?Q?ZMT3pY81TuNWbYjLu7bSYKG/PoygRgASB3agre08R3y5wVSxM+skuLmmfYlP?=
 =?us-ascii?Q?u8uCV/fK1L1/inuSCMNV8fFj8tluV9MYFb1JTFDweQwhRUATkTY9cblxfZd+?=
 =?us-ascii?Q?ownGkOnlyusLOnaxsw5DHjg/noTNg9Y+kt8kFtu/v3Ng0tgV3V4/m6vVLrAD?=
 =?us-ascii?Q?yyOEZSGAOixXnX9J0aPmm5nYXOq6x4rhED0M5diwjM91Lx7/T9Fopbpn57dT?=
 =?us-ascii?Q?shVO30syVIBorFKxCokYFCrzuW5wjmUGFEKwu1xbCtDc4w7qUIZJUo/taZbB?=
 =?us-ascii?Q?5CP001dlizdCvHGOz7cWFvuGohzpvxqOSozVvI0yR5HoHwiSgjKG2cNVWLHT?=
 =?us-ascii?Q?l7DahULc1BbJsnY925K7ofht0BKuRAzbArNKmG/q7AMKOg08yAtJYBpRze2Z?=
 =?us-ascii?Q?jpt1VFdBP9LFkvAFnlwGt4BTbqPROIqVabbShup3kT7fqvWdS4RxGWJrKuBf?=
 =?us-ascii?Q?fcBrftQ8jCjB+fQ7HdqMAURjQ9bM6MoMpt+VeTZ0OIa1c8v1dFz10iz5rDUn?=
 =?us-ascii?Q?eubeKW+5hyBsn6kaLvs94M/W5U4V0Uz6sc3wr8mOfPm50HfMxG2mRcnpXhz8?=
 =?us-ascii?Q?TJ2ii0XwfFvgcfMX+1WDTNwWSdT/eMYx3AXFzba8VmBSEaIpzoAD6/fZE/+4?=
 =?us-ascii?Q?BONIyHIBI1PjPyliR1ZdmsowdjvrWE+WhTiknERDP8EJO8SCh4/EItGjM0Ah?=
 =?us-ascii?Q?GbKUzMI0iR7ZovF7hNOKJlItKj+It4Q6FIUJ9EILcY1a1bNb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7088d594-ad24-427a-cb2d-08dee07f159c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5001.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 01:35:56.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RB7verAbpHGStHJWmnBL8VZ6R6kwN+axHTE6mcpMCpgCHCNH98Yey4DHaz5mBcvuA+oj4JS6MGTN5Zvo31ZTXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7300

On Thu, Jul 09, 2026 at 04:18:43PM +0800, Hongfu Li wrote:
> Several early return paths in run_migration_benchmark() skip
> hmm_buffer_free(), leaking the buffer. Replace with a single cleanup
> label.
> 
> Fixes: 271a7b2e3c13 ("selftests/mm/hmm-tests: new throughput tests including THP")
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: SJ Park <sj@kernel.org>
> ---

Thanks!

Acked-by: Balbir Singh <balbirs@nvidia.com>

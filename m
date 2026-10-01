Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013028.outbound.protection.outlook.com [40.93.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B154EA361;
	Thu,  1 Oct 2026 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846581; cv=fail; b=ddqfk9N51hUOhEfh7DqUUrNEc8KtQ6ffJc16kw2JzowQEt/WkmZgmCCEHrSL0u8mjss1791xWKg0KlnbUyXcsj6agdR/a+7Fd409zb5xRsIOcas7buZEv2lwQzSfe8W7iLY8+vXHcw24XvFpWsIjAbqZUTzGWB9S2m7/gkTlSG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846581; c=relaxed/simple;
	bh=7jw9w/z0WM8LOpiZr1BwL+EVKcn4QIjNwqRj4qmRicQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mt5FvbDOQgWGSK9a02hf/JpYQv5/gCtTSnkh5B26WBv/LshwP1YHy6371cog0vUXDqvaYGHOiNHdy/B29zER1xnk3lJ/63VdhOtVAgYcvywAcf5HOdhqzSJlXXw9txJCIDGYLfZGYZLwX+XeHmJJ+8t30awm4y9Lc+ik/aEpspY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FoI+FjNG; arc=fail smtp.client-ip=40.93.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FoI+FjNG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+nIwVHp1C4S9R7Orl119s5HkSqLL3jy+MBYyHi+ugDSWAp9P3RSiiKiknqiF5aqGo/pcbitaPq9NjQV084q0duWgIwvdFuY/m/3crhuKzmEY89rJd9B2gSwMvR81FsKKajjOwqGyMPfgnZ+MRvO4JNNi7nOp4tNizGbblfvRDf3l1oWgC8lwwMQQiDi3AIA54lkYBtUBW7rGKqumIIfpfNocvFofPY6/XVdA9a55gmPk+H0nh+AJW9bHWxsAAEyrVzvABpwcCFq3UaJG6SmIjec2bLFqvUzrQoiF6iczgXvSPFgzR7ciCLGjy1JtpAwQ4SW81dwGakYSw1zdFHNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avZhAoHEj1eIIJYFxCnNe0if1ABPZXtrfVgMzPO4Mao=;
 b=LDil4ub2k3u3zSS51ZyXQsQKNkUKDdu7T0EK49cFDmT+GTXx2kmBE7lDcspmUEH8ksdCoT5MtMWsa9Y7OwHooGRSg1rXFUztHlJtW+ufU0u0f8gmYcBORmZFbfOu0nDviTXT51YGshtYmuyGMaGnglvKXox7gBoqDSJ5wthk4tOuGGsSLeb0M4q/YC4chBbIM24mObI7S6M14PGhsEvPrr87GJQqSjlRKnVHHkjFXTIz+eYUHhy4ZM/7LMHNKsRFC+N5V1kpZFMo93Ib65dLWJnX5yM3agHzaePGnRbSggKqUeZ8zrLJ+heoJGKFQtibMcl5JSwE72HZpPiMCW0pPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avZhAoHEj1eIIJYFxCnNe0if1ABPZXtrfVgMzPO4Mao=;
 b=FoI+FjNG6QD1iIXyGrfchtEEuiaBjtCNuRpnysAHvDK0hLSL36B8L7WPkcn7uZq0olJjdy+VCI2VGmNOVO4vqXcxYnQyhqUW02Z1oRkwBgBB26HyAdkOjV+3QMAa6WUXKSkEFS5EX7VpMbNFgUsieH4FhigU43rbJLXEL9xmQ8h3BMmFk/ZpT4jGBuYl4VYLMxPDE6cG9AjohpQywtw/Pynt7mJ2ClNQa5r3GHdYjehmZD7O35cogYTDzBZWLZQquMl9BOUE15RkQsfJJAlvb63MkYNjxrVRVC5bRxvzjMkRoQKRkw5+Psg8QUe3vJBGSsMfprTUkyL3PWWwgZc8bA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by CY8PR12MB7147.namprd12.prod.outlook.com (2603:10b6:930:5d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 09:22:57 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0451.014; Thu, 1 Oct 2026
 09:22:57 +0000
Date: Thu, 1 Oct 2026 17:22:51 +0800
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org
Cc: Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	newtonl@nvidia.com, kristinc@nvidia.com, kobak@nvidia.com, kaihengf@nvidia.com, 
	fenghuay@nvidia.com, ltrager@nvidia.com
Subject: Re: [PATCH v4 2/3] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
Message-ID: <ar4mRqEfvM49QgMP@MWDK4CY14F>
References: <20260722035943.32337-1-icheng@nvidia.com>
 <20260722035943.32337-3-icheng@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722035943.32337-3-icheng@nvidia.com>
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|CY8PR12MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb398af-db12-4c13-c0a2-08df1f9d9447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|4143699003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	eWp+qiLWxkngM0a3fdz5bOyJyHFfovP37ea3HVGpyiY6EhH6vc80d9uj1wbihdFuGkZEC2hCaE1q7oylQk6NM4Y9DoXLnrbaJ9wCJFTHN8zWfjdsvB/sX6CJJgh9g/Wmo7PCkpinLcJcfdvDZuDruNmucWQBVfgixalx/TFJwPlZK6bLOHA2ImxonfZcY4uL+M8YIoNt03nKC2FTT3TRnDoE8ed1f3cJ9ECnm+iug6jw5peU+pg2zqjrso10M5CElUGRhrkSQhL+L3zosfdgY1bLwz+H7zT/evk9BVGdufYi+1C16uE1eZdzLeUvb1WtRYnvxyjegbu02Xn0T4R+76jfGOaUx7skZ1aTlqZgLNyWqhqJt0xZ8wY74/lDI+tH34tESGW6Jw9D/FHdb0ifoIubsLvCGz6sqqwYmUDdVb3eHIMyn8VLqgSFrwweVm8wxfJ4/Nw3JAkytRQosPpA766cNjKSiL75ol8YETVYmHvEJJuOjCONveiNthZD6paJdalSGgNOSWgAj2RDIldB3um2b7QJbQbg9K4/o+sb/B7X8ok+cXQnVtMOFNFaj2NqbuBtaGix3YZrykcPkIqtRy+g7qVUfLUb7rUBGniFqCxBUD2he5wdd11wTx5kVGBu4rYE3K6zrQVTgNjZ1jt/J/1s+HbimpnBZOX2ban6HGI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QHi9zBScZRSzlMmoAKOSQUQ6HlmaviuYX+l4r+SaoxLP9FqtmxJ2M+iOU9uo?=
 =?us-ascii?Q?JdMx863zaChAfX6W1DXrrMletOZohsnHghoBJ+wPoyXTmKNRN+qpVcxCqzQs?=
 =?us-ascii?Q?MAXIw+PCFzct4XtGIu2Zz4kdqAoIsseplLRIUTO1k4eOSGoeFcaQ6wn0EUDz?=
 =?us-ascii?Q?qUCJZfKza/tFWidmJnFrIIA6bHokWD1mwlk+SS9ISypliUclt86ABlw2N3qq?=
 =?us-ascii?Q?wysouYbucSwNsCyhtZFVShoTpLvPuQLBWL8mMjFdP6oxhiul4bBJKRFzgdRL?=
 =?us-ascii?Q?eo4xYaSlw1ponTtoWs+E9+Z+EzYZKlS7Dgzjo2Un1eDAqaEFtf7MJAAEQh9s?=
 =?us-ascii?Q?kZt82DvI9KN3ByumUqCLpKzG+/y+AwPFbTIGfrw5c2DOOUQ2oK5YrYUa9vR8?=
 =?us-ascii?Q?zvog+dIjCKquzFHyF4UdHMiW71f4TsXJXkYj5lnUSaQB92DzNGhVFl8ZNVO8?=
 =?us-ascii?Q?LYye3G7z5oIXOyceA6UGUtogc0Lfp7f4BwB+lqjPZU8q/VeMq0AJwPU7QPV9?=
 =?us-ascii?Q?o0WRR/nyqFgtpW7rcYuXEi/AiHWCf2WwFgvWDRYneVwi6DnCMHiDr1gxNcgb?=
 =?us-ascii?Q?vCHJtzmbWHT0o2NzDBqPjLKy6PPxefXaCVO72Njn3WSv4bMs/+/sbo/9GHF1?=
 =?us-ascii?Q?PDr494SRy+XoEOekUCs6cloc+SQDpkXkvqdCv4fJILDIcfGlBICnlJYwCirQ?=
 =?us-ascii?Q?pFM+kSyclSU0Wepgu/XAcUWZzjNqthkNvBFRDTBT8IapuN4xivB291GDa6GE?=
 =?us-ascii?Q?+exX0mt15GtDswAOC/4lav7lSwND0L5k8VBTpn/luC8MXYrVQKatIuORG5a2?=
 =?us-ascii?Q?ve9+Oc3aeV1O1iW3wknHCAK6YQMiNRqYWYmWIHGrlm2yJhFj8pi2DoFl5kpd?=
 =?us-ascii?Q?dUOyHvAx14ORnLl4vAvmALtbFKUt9AscOM1ihpc2TRCS+qR7iZGr1wbRjQT0?=
 =?us-ascii?Q?9NKQiQ9dXbZ4skGRQVY62zQ4/3dQNBskjaXB3saS1joPnC5arq14ravqjRZB?=
 =?us-ascii?Q?G2lI/bjO2PvIYhmzExre+M5lOq76M3TvrXr1MvNHZIiZAA6V4SWzd10jRD9f?=
 =?us-ascii?Q?vfg6KeGM5Z3VINODY21oEcvi4IwZKuk6a+DkJmCyuO3ZSuWMld6WXmX22M5U?=
 =?us-ascii?Q?JlHFtF/k+QcU1YIQ+X1IQaizRV/mqYq6rmPMJBje+PzGY5AJEOQhPHiNNoW/?=
 =?us-ascii?Q?ultNgKAJb8ly9bTmHEcK0Eow0AnaxWcJwHLXJeSRHidoKVqomAcCpsCjCsiU?=
 =?us-ascii?Q?WUv76hkIDkjJfu8037jlzPjNSXXlAppB6NVmj+iiQXKwRDK4RJLxJv6oQCVR?=
 =?us-ascii?Q?9U9ZFdKldlTwCSYkrJkLMLDZKjsQEmCkA31iRlcTEFGqGCcLNE6akYxC/1XF?=
 =?us-ascii?Q?ffDUHCuLS3FgsLjOXuVTnEfpEeSSaf0ci4j/LH1DU0WXFNXhi8mIGN0CxtnU?=
 =?us-ascii?Q?qzzzFwJRCr6sezVdbDZzyMXMR8v1vW+Bfqnk/eNIAEzwBKlEFqJOoGUtcfwC?=
 =?us-ascii?Q?t0/yh+/Ia8izTjcW4Hsev43nd2q9xmB1zzuarUTAjiEJ7rIhUfJuf9n5jZED?=
 =?us-ascii?Q?F5dav1BXdm8hSZdazjw7VVBmmQYvE9V1kci5VXNdDtkzFg9VtW/p+E4oWIWf?=
 =?us-ascii?Q?rSaH/m6E7iymVU4zr6GjLsyWKvRkROdIRdU3sZVezt9LgdL3/RX2KfRDCxDw?=
 =?us-ascii?Q?7JmpPc0f23pVySGxXK3HGmZwj+dlgBrYWTa0T95GpksQzGiJk5XJJgp3E8QF?=
 =?us-ascii?Q?nbpj7ndQvA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb398af-db12-4c13-c0a2-08df1f9d9447
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:22:57.1264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2ZGnisPS7SoZKh//H8wdgVYBfkapcBApqPwyQOtzvRqD3YfDC8kid+LSpgsd5yvVWGzv3mk38Eit/baWXwwfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7147

On Wed, Jul 22, 2026 at 11:59:42AM +0800, Richard Cheng wrote:

Just a gentle ping on this patch, thanks.

Best regards,
Richard Cheng.

> cl_flush() and sb() compile to empty functions on aarch64, making
> mem_flush() a silent no-op and leaving CMT/CAT tests operating on
> unflushed state.
> 
> Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
> loads and stores.
> 
> For cl_flush(), "dc civac" only reaches the Point of Coherency, on
> ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
> platforms. Instead, dirty each cacheline with a store so that
> mem_flush's full-buffer sweep evicts lines from the SLC via LRU
> pressure.
> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
> Changes since v3:
>   - cl_flush(): replace "dc civac" with a dirty store. dc civac only
>     cleans to the Point of Coherency, so it does not reach the SLC
>     where MPAM cache portions are enforced. Rely on LRU eviction from
>     mem_flush()'s full-buffer sweep instead.
> 
>  tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
> index b9fa7968cd6e..eae0262fe265 100644
> --- a/tools/testing/selftests/resctrl/fill_buf.c
> +++ b/tools/testing/selftests/resctrl/fill_buf.c
> @@ -27,6 +27,9 @@ static void sb(void)
>  #if defined(__i386) || defined(__x86_64)
>  	asm volatile("sfence\n\t"
>  		     : : : "memory");
> +#elif defined(__aarch64__)
> +	asm volatile("dsb sy\n\t"
> +		     : : : "memory");
>  #endif
>  }
>  
> @@ -35,6 +38,14 @@ static void cl_flush(void *p)
>  #if defined(__i386) || defined(__x86_64)
>  	asm volatile("clflush (%0)\n\t"
>  		     : : "r"(p) : "memory");
> +#elif defined(__aarch64__)
> +	/*
> +	 * Dirty the cache line with a store. As mem_flush() sweeps
> +	 * the full test buffer (sized larger than the SLC), cache pressure
> +	 * evicts lines from the SLC via LRU replacement.
> +	 */
> +	asm volatile("strb wzr, [%0]\n\t"
> +		     : : "r"(p) : "memory");
>  #endif
>  }
>  
> -- 
> 2.43.0
> 

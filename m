Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012050.outbound.protection.outlook.com [40.93.195.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3680D4DA559;
	Tue, 21 Jul 2026 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647101; cv=fail; b=OjRR26rkiCBjGcyfJdndaTaMdrYSkomr6um5THa/B18vmH7wyylYTwt+rAjVnUbWDuQ4hO2XSq6C6VOimumY723+d+nHeeneRsUqnigdtflKwBnOvvKUCRnPkUBjHVdlj6V+uZ+QJlBGpRCI8Wl8nKTKrnnN/rJHILkcqPXmX78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647101; c=relaxed/simple;
	bh=sUEH92Fg7+zv+GT55A9wkRODx0fjGiyOvV2cX9d8YKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aMwzD62VqI5Y9P1hG1oUAPAYmt3grV6169BpduUWiaPhvOheNTdDm/w+Dtfmib2Av08l15fElTf44Op2wkNPWhLzpWZ5eKYLnVBgxVX3FlbAcoP0BFnE9tgBz22kyszO6GCx7CdVADp4DVfsaSNTLYiLm61DvRBt/kbOSgso+Do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o+OhFtsB; arc=fail smtp.client-ip=40.93.195.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o+OhFtsB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeIf+AeGm+QLAlgVSkAn49QwRRFfVwnBIj8SNsvFSAUdbiySCGWxsXd/sW0f1t6zGFX0rER0UjyIU4KSRuyt/dplymBT/UMhQrVtU1xhuxYmVc+xJ05SzWhIZa/pYiKZNjpB3SOBU+Gqc4AMSdeIgirkeJfYe5qIrUa6NcQ/fi3GMzgk4Tw1TacqktVudL7Yxx843ONHm2tN0ryjyBcimKKbGcUdkzxG8KXTC98WHot84mwgl+iUnkVWk5yjGv73SpG87K0/OW4E/F4YXWsY+6DQl5pxSuE8gXtU9P9Q+IDewgclAdXZMuoBZ+JoSbjs+6+QHK9yjtnreGx9SFWq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrH6ga1LLchYlKVmRTvSwXFGl81qZ86/4r/Jkjf4mek=;
 b=JPTQpozUcrMK9f6Wxi0tnHD7q+2xu93Hepb91d5Yi+VHo2v+RcLZrYPDlX409fW0ph6kEGKqfXjbh7ipLjRI+QxvhMbjz6xOGzlRTCDyiz4+OqrV510wfChsSQjg0kL7KuINyT4Jvik6dak8VF3Xy6fgro97zpIErE8MFpRfhZxayn9ia/4nCbTpRqkM9Vj2Nab+JKlokHS73gX6Bt+ZcFZAWX/Ew4/RvzWsYDfCK0Mzu0qsi1zWCkbgyfKWKnj4dv9D/MrPw5NufdzPn61uU+CPNifnj7CVsJFSelzyTfHWHuztqjixgqYUUrmxUih9gIU0UzU8Sk90kmlNVcLiiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrH6ga1LLchYlKVmRTvSwXFGl81qZ86/4r/Jkjf4mek=;
 b=o+OhFtsBB7//OVv84s+ggbh+aF8SIX4MLZsjtMg3ZO61l7+cHRYYcl3InM+GcnCgiUmhDZ2oS6USBgxEzzs4FTS/adr0JGyrAs9bNkruyjVKjHZ6BFtsJfgrA+GIdTUzWqf10x/S21U91hjbBk0Z2yeXqCIN4Obbu2FUmrwdi7mIz1vbvWearP3LqqX6+dHho4/Eshm56dxqhwhvnRVVG7Rcrks9zcio04FQXmFi//FtTGFFlJHXwZO0+FKfb6p+ohSLbI8szgJxfck6y2UzJGrQT8WVsnwBQ8HupdNMOFs5YOZrnhO8TaH5m6pU5S4b5J0W8yYL9+I4CUcXFWnPwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Tue, 21 Jul
 2026 15:18:16 +0000
Received: from DS0PR12MB7900.namprd12.prod.outlook.com
 ([fe80::3033:67fc:3646:c62f]) by DS0PR12MB7900.namprd12.prod.outlook.com
 ([fe80::3033:67fc:3646:c62f%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 15:18:15 +0000
Date: Tue, 21 Jul 2026 18:18:05 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jack Ma <jack4it@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/3] vxlan: honor per-nexthop fdb destination
 port
Message-ID: <20260721151805.GB2667735@shredder>
References: <20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com>
 <20260717-b4-vxlan-fdb-port-v2-2-f4862e8fe867@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-vxlan-fdb-port-v2-2-f4862e8fe867@gmail.com>
X-ClientProxiedBy: FR4P281CA0288.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::19) To DS0PR12MB7900.namprd12.prod.outlook.com
 (2603:10b6:8:14e::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7900:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: 36cd0cd7-a948-4f16-8338-08dee73b4989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	gGIOLO66YMevSRJ6o7OO6A/psmshwwSDegjVhIgVqMlYCsZ63DrXvjMfpx1ZSjlVGY8wufL9wRtxnyvg12BZStiU0YL2NpD8U7d6AuJtkATBWvRk1ay4WLO+4aCuyWdPugd9sahQhya5ZI/4ztr4fiwMxU452oUt2NQ6JZaW56cGR7jifzc0UlPAZYrWgrdmpZUXEoGCVsmzlSD56UhKjWGQH59fUU9KT9An0fa9490eKkImq+xovKb7k46W6Pn5sn5uqYcvybhOhhmhRXU7Kx4OkeLdkc8NkPybAWO6KBgrbEAtNGLTNekpRLJPfYGJG465a9SGctM8MHecK6vWo0scHOx6FE09rBWOtjd0KrUTBKpcn4mfhiaDpwrZ0C+3lQNopj7i1GCkkG/LtsGkcwklIdGpv09ST3XfjB/seqpdwgwA2kYSrjBxpuosXin7INnz5haOSzwUViMkCxCCVRGF/rlEbcBxNKWl1jaV+jK2DUzd9s2bNxcibtD1UUsPIFiPZP3FgFZIQfp2qctv+hBDyIbEvNn1ApkLEXzZ8JjZzn2XIKEOYH+xxZFioCqcgrSkEMgvkY78g+XajnOaOI0FPwWZJkdfl2VeoubIqqtiMR0/rtDD1qFB31N19JNBfUOCNC5U+brFn7CxJhHR7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7900.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zWffTM+RLbbwSYNljHKtgkjpfit1K/uVuCwvM3Oe66R5k1YHxj80nEEeW0H7?=
 =?us-ascii?Q?kx9uMnUCKPaKgNrgjkP/7b+qgQDL/qbzJ064VTT+774puurMZ868ut1+AZ6B?=
 =?us-ascii?Q?LZkwJezltaKGrP4f2W16D0FI9nhDhj3pSQ/MZBT95k7mcKwoFW9LYU10jr/X?=
 =?us-ascii?Q?7noW05R1H4BkuPxn2pnG4pnZSM8BFxwS7+P024bYZsC9XLylD4qUUY1G/E1d?=
 =?us-ascii?Q?49o+JojiXPJ5M9bbfbOacuPlARLyY4j3Mh7XPBSoivBVLadT/rAxZItdERrs?=
 =?us-ascii?Q?YEsF1waVM+N80hVw1/XmQ9WyTXL6G0rJTtWK2cGeYv3zptushFGAjq3B+YKQ?=
 =?us-ascii?Q?vT08nMQfNWfu+4+tBplfVJFnt6wn8QwHA1tSWVdYFHZfQJyc1FSKGBRoTAH4?=
 =?us-ascii?Q?BinO1oOSXigFLZqYv1SFaJlVIEnKIKJT0YnB2lY22HGEmwYrGtc9Sk2aVNWI?=
 =?us-ascii?Q?gS4ClZ0HF1DHJEPJgEDxIQ6WeXrrYF41Pb6YI9zX40Olz25EY/XoLmEoPWMF?=
 =?us-ascii?Q?CWZlyAvgTdJOpebbxRHvqemEjfXFMuBigpGu64cr+AJYqNxJsxZSP9pATLzW?=
 =?us-ascii?Q?Y1v5R3E0hyffZNquZ3ZAARjHITjGLuEl001tHH5XS7p8/WRjETeZ2tayUhKm?=
 =?us-ascii?Q?6yRfXx0YgSRU2FE85y1mbyojBdxRW8mImYOFaFFcqQAXRc02A7FD+gG9YFya?=
 =?us-ascii?Q?pF38oL+G1nIhCabeNgxPth0PUpHux9wAGI6Jpl0RsE7+q3esyVTZePUVDMFP?=
 =?us-ascii?Q?iVfhhQXikEuen0NXUfUwIg3J1kufVIjRf1Ymw4q9MgpZijiA7H8/7OrnFtla?=
 =?us-ascii?Q?lErmZxY8QyYS6Xy2+1iDe+7Eszep71S9YoNV06MXxF7qcHJYE2roUDliTe1v?=
 =?us-ascii?Q?8SyJIGFDFw5SBuYF7JbkMTpNXgi7lwxgIjYNQeIP6jNMjdMflmQ7VATN8fZD?=
 =?us-ascii?Q?ywtXVnMik43e053Y/nRFqyYB1GW0X5carM8eJ6gcRbjHRiHlgr9dqeRsN4ef?=
 =?us-ascii?Q?/jgHEZUsNFgBfSU803NOwPsiNuDhcdVLD3XcJjYnomLu43/kdRVh/YiyQ1/W?=
 =?us-ascii?Q?pn4+lde3VHFRNH6esDSRs81PVqXjAUKOaZW1ft86R4Jxe8cfEWg1yUDRXE0U?=
 =?us-ascii?Q?8UBwYkT04A3iKn22gPrcXM9p9+PsaPXk8r9GyCPLS5Azjmc0uKW7G0fG+MBx?=
 =?us-ascii?Q?2b6dN8XrjGffYwypsAZZQOknxydJwIJKy8zVBMS6OF22l0PDgU+bW9caNbPJ?=
 =?us-ascii?Q?DExTXgX0zvVAFvqCdrCqOh5YjSN9Lx+GNBo0BEcqt5VhbhH0PLiJvg9oC7T8?=
 =?us-ascii?Q?o8c2iAY7hH/DuobifxZdxxqP8jFiJnAAFec0NsnrE6hAz8gainN0/LqBrQiL?=
 =?us-ascii?Q?x+QZR/6CQwG1AD8SRq/7AXufyN3YtfqQ4lFANsSQirzRmmag1zLDgNkoNM07?=
 =?us-ascii?Q?CXNZxCOAn9yTINp4uUZNCC3xydEUKK1ePSvWTirf3xWu9btDf0LO0+Gt4HGS?=
 =?us-ascii?Q?Hz8UaF3zpy0a1w1ss5Om0SmFJ1F12dEXGSgMajIgLkssveyRAdGg0zgWb2YB?=
 =?us-ascii?Q?9E588uj3XEcsmRmP5MZmhRCsp8X7mGvCSqtxRAs0SkMqEJU07HiOdT50ny2V?=
 =?us-ascii?Q?mdvOXQzQ+gChPTbpP0niX89fL24gESt3v4qaG9q4JWaMKakIesE4GJUp31+J?=
 =?us-ascii?Q?hyjt+1KWgJ+bMnpiH9JeKFuourEAS8AMXcHveX8SWT/9+mtoG9I5/FKDs7ir?=
 =?us-ascii?Q?iq0VYa5Dcg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cd0cd7-a948-4f16-8338-08dee73b4989
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7900.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 15:18:15.9249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvJmJUqhp3fxlYvD6guxYiQN8OrpaCBPTtW0xS6VpqBtfJA5ILQZAPUC1IUjYSI0CY/rIgquKUPWIXf8NExHrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447

On Fri, Jul 17, 2026 at 06:45:17AM +0000, Jack Ma wrote:
> When an fdb entry points at a nexthop group, vxlan_fdb_nh_path_select()
> resolves the selected leg's remote IP but leaves the UDP destination port
> at the device default (vxlan->cfg.dst_port).
> 
> Extend nexthop_path_fdb_result() to also return the selected nexthop's
> NHA_FDB_PORT (0 when unset) and have vxlan_fdb_nh_path_select() store it
> in rdst->remote_port.  vxlan_xmit_one() already prefers rdst->remote_port
> when non-zero and falls back to the device port otherwise, so nexthops
> without a port are unaffected.
> 
> This lets one fdb nexthop group load-balance a flow across legs that
> share an underlay IP but differ in UDP destination port.
> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>
> ---
>  include/net/nexthop.h | 5 ++++-
>  include/net/vxlan.h   | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/include/net/nexthop.h b/include/net/nexthop.h
> index 9c8227996..7fb612a73 100644
> --- a/include/net/nexthop.h
> +++ b/include/net/nexthop.h
> @@ -576,7 +576,8 @@ struct fib_nh_common *nexthop_fdb_nhc(struct nexthop *nh)
>  }
>  
>  static inline struct fib_nh_common *nexthop_path_fdb_result(struct nexthop *nh,
> -							    int hash)
> +						    int hash,
> +						    __be16 *fdb_port)

Alignment is off

>  {
>  	struct nh_info *nhi;
>  	struct nexthop *nhp;
> @@ -585,6 +586,8 @@ static inline struct fib_nh_common *nexthop_path_fdb_result(struct nexthop *nh,
>  	if (unlikely(!nhp))
>  		return NULL;
>  	nhi = rcu_dereference(nhp->nh_info);
> +	if (fdb_port)

Remove the check given 'fdb_port' is never NULL?

> +		*fdb_port = nhi->fdb_port;
>  	return &nhi->fib_nhc;
>  }
>  #endif
> diff --git a/include/net/vxlan.h b/include/net/vxlan.h
> index dfba89695..de41b3746 100644
> --- a/include/net/vxlan.h
> +++ b/include/net/vxlan.h
> @@ -567,8 +567,9 @@ static inline bool vxlan_fdb_nh_path_select(struct nexthop *nh,
>  					    struct vxlan_rdst *rdst)
>  {
>  	struct fib_nh_common *nhc;
> +	__be16 fdb_port = 0;
>  
> -	nhc = nexthop_path_fdb_result(nh, hash >> 1);
> +	nhc = nexthop_path_fdb_result(nh, hash >> 1, &fdb_port);
>  	if (unlikely(!nhc))
>  		return false;
>  
> @@ -583,6 +584,8 @@ static inline bool vxlan_fdb_nh_path_select(struct nexthop *nh,
>  		break;
>  	}
>  
> +	rdst->remote_port = fdb_port;
> +
>  	return true;
>  }
>  
> 
> -- 
> 2.43.0
> 

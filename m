Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6163E1925BC;
	Sun, 18 Oct 2026 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324123; cv=fail; b=fZYAxutdWlHW4LrlL0bkiynqq5+iyb/UK5Mb+pYVbDbfnVS6XiiCPoP5yFcILW4+pzmUPhPOy1FiWXjQABFu/qF5gZMkKJZe63bouXtJAFe3Z3CQodf5aTPv+OvO+wbxMdMRsPQ0/CB5i5GuWFNJPaM7BiGwueisoxHW5Ve18L4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324123; c=relaxed/simple;
	bh=WySZdj+XkoTbpImWOktZIunbukpz5kuNVOr/NJl7ZF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JVbs/GSAZIACvhtl5JWnY/UKJG62G+GYyycuR3eOnYnFIMBnH1bo+ML1VJhhR0mU/JKOSZiXlDRZyji0IwxR0u60NhbGtRqETEYhRNPS/MfYP/SwT7id0RcEx8mICrsVCZ4VlPbQq4lj1YPNf8D/GOJlQEg/uU6zx+eqBMihNRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uU+S+FTS; arc=fail smtp.client-ip=40.93.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uU+S+FTS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMn1Ye4W3oFjwlH8kUX3PAwAcYS5sEEmx6GSQk4TnJHn5I8QeSYHM7tusqQGDkEOjCbkfp20Cs2vkcToKXqdEeTFjN2yKWbvaejMu22jRk9qE799J1ptieodH495JzlUv8/L90LgSaMpKxGfMT+HE4EMhuuJBV8rR203zKAlnuY2BksCRNgDz55y5t4q20EOusTeVOiVnFTIRSbSx2c8IMe/3QoHyb+BbZu4FF0fVy/SUVuodgTTmHq1eVJWRkqFak+MaPHZgfRDHYysBOw5EoJlyBjsRwJiYs3ahgNdHwkl16zR7Ql+09gg+Gj9ZhPfpTFn4PUB1lfiW15S45605A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7iGkahoRITktd/x14YL2+mIAtbknE0K5N1FV2xE/Sc=;
 b=lS0xph3QIO/dh7hYCYKEvnu1bpsxKPYcb7SOxVwuqsx5MWqUIslWhj7LWVi3MgPnHvWllXBYkzW6zwBdDTefnigNAR4iH1sE+QC08UsiFFk3IvNJ4v1COvQ4maquyuNKfazyiijka9QB8KXp2msvP1bw0RfoWwEbdL/lVUwp8TEAKmvzHWgI5VOQ9ooGLub9qLnzUcw/Q0S/YzdJnKr3wV8N8/nO7fWdj65MLk0AcWsRvgoVxisN0+5fA0/jMYOFkUULsPNaxiqpF4lqK/560qyloLb6M6dwq+RUDWn4zXJ+vsB96p9ZWYLuDHneXn3gYmQ5qW79e80YvfiY8JK4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7iGkahoRITktd/x14YL2+mIAtbknE0K5N1FV2xE/Sc=;
 b=uU+S+FTSLS+3l2dWtQpjSrWfUrskRWch78Q0ApuIrGnFp0UtkCgF7ubSD/TM5pybqxlxMknqC8ZBKewF5CnbKKyUO3Er+SHMdprSHLzvXOW0Qc6kWmEIuLM0UFNntYj+0EKmF1NE21AVjsRsd+MNYzwjLRLbP4ui30BfUt9kWaY3ra0fQkRRSK22FA8ZKAWJ3QG5qhhCL0MkFZcQukwfoA81FSIQYC7cXHcOTULSn6hZsZiA6dD/1tvSe3ewCWiKKu2xzI82uadi3yo4jgOwMLhdw7NSjytw9GO1XZCVLvDkJFAqayzDjpUb413lZNTVgJTA1KIiPq2xFEJnAf441g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Sun, 18 Oct
 2026 11:48:37 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 11:48:31 +0000
Date: Sun, 18 Oct 2026 14:48:21 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next] selftests: net: exit with test failure status
Message-ID: <20261018114821.GA2470373@shredder>
References: <20261014-self_ret-v1-1-6b5a95ba6106@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-self_ret-v1-1-6b5a95ba6106@kylinos.cn>
X-ClientProxiedBy: TL0P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::15) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|SJ2PR12MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d78f359-4ad8-4fea-6e1f-08df2d0dbb37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/Bvmt/90tjZF5TimHySVl3nn9KBOr+2MKPH/KIdI/L3Pidifm4qaGUs8uTbO2hVbC4vgGcA+Sxmsk+BoYHfVFHwW30yOo/+9ADHVROwfu4yz5MVWzpNsG00OogwO1yudK7ed5DMgtKk7ne78te1lFp7aVqpm7HMeGTMaN1ojFx+DiaR2bjWrNzLCUIwu9bT/fMCk3o+YYlcmXSX6DpWC4Uim/DQJmVZuFnaLWAYrBmo+8ODpjU350TUUbbJ30nAyZLAFrEzbaLIaK90/svdCQGKFXsn4cijGGPnMKDYqna17b6dU+YCtKLf3DlgUgvVba2TvkyzyDFigIQSeOO7Z3a/Bf37118fnmGOLYFapw9iILAkqJNT6aWNb3Upm20VdjWVD961NYXSJ/gTtwLOwaUOrVMY2G9ojvnH5hDWJ1+I7Wf9yPPIkFHGbAncsn3Y55opemKvluqghKdGgpWumruTI/JDjykFjjbD+SeJepOF1C/uewPeUxzcd/OPNkL5eMgyQVqO2t3UnKusDKL/TTbX6XURDnkFsHYf57YDx3If0kLTEZ6xzdB3Nyhivf9BLA0R5pOxd21aaIYdW0SfeuBW7dzvSXyTZ/4uoEeqsMtO0fPcxYbnGvQ6hMfbRo4cGjDTVc9ChRsu/NBymi1LP84RCvDHBQBuHN2VdHdh6Lac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PMe+oiwf1snnLCBo5tMy/MYIuOwbnDgRCMNRvPcIE8ypDu+7btJIwE9ZBh+p?=
 =?us-ascii?Q?kpxVsv5yguDHG2fsgeWzojEZ1Nl8Ou/kMGvumRGLMpUEr1zRgtahnStWmKy0?=
 =?us-ascii?Q?0KYRDiGr1aMB6diu/Tu+89CrQFbA55uvlTm581uuxJ+0Q3htoS+vwq4htecv?=
 =?us-ascii?Q?TO7lJHY/9227yaQGZbpuF46iBlggu+ngcW2c9HlCbPirx7osnPnLM9ecatz3?=
 =?us-ascii?Q?/clNiFIqFhvtG5n54PqtZ6kHq9SVKroF0rOZ0i+z3R1/W5/F0gmkfcindWih?=
 =?us-ascii?Q?mtM/SOgC4JtGrO/tPBaUdOnJRs5Harqo5rIaQgBCeUORreVTHgCEUlUOrnIy?=
 =?us-ascii?Q?Np/+jGxqHyl5pp20vgfC8cWasqVyvz31hXbkR1IizwVlfJPQTmTLDTmLEVgP?=
 =?us-ascii?Q?TV7cYh/X8ubzg6vq1FrpCr26tiRX3hf6zh9J0PQ33jetEqJcWiGJLvR+cxPb?=
 =?us-ascii?Q?SEUXlv6pz3OnlCZkNDLlvssuOy4bfJYWKNy4qzypg5LPqmHCS+SxOx6sPmi+?=
 =?us-ascii?Q?zJFl7ef4P4wBLEteyF7Cq4E5ByEn/eoegJ0Vino3rQgpoYIzYmuOH9dkAh4i?=
 =?us-ascii?Q?L1sPPT5NHjYysZEbRBAuF/qHb86b+qJCwfwPxGz6OPNsyKss4X430ps2Voiy?=
 =?us-ascii?Q?sJl9aliJ7J8GZQGTNS7S8CdL6eRwrA7ZWMzHJPf2jd/slxH+A7agGnkcg0Lz?=
 =?us-ascii?Q?2fRU09wUJ7kg8SPpgUrrXy5s14IiyOXTu3zt8bcc62r3drN5ZICsvnMs3TRg?=
 =?us-ascii?Q?aQoT9/90MBmKmfiju7Htb0yQdEYc5gjFqpyEuGB7DKKthQxiGLasyVaDXBMX?=
 =?us-ascii?Q?Zzvce/1ktN9ulY9HLMcjeKC2t3NbWp1s6wheseOECuMxj9NrAp94+1qDV5L/?=
 =?us-ascii?Q?8yWRnDTVgJFZpwTSiLfzVwHmR4PEGvH4MKdoj6U/dO1WdfInT3TXfcMYi/Xb?=
 =?us-ascii?Q?TiDw04g5H4s1ZiHUwG+otw2zXSw7HzK1dBz5e1nIqDqoj5rYhNhwx/4uTi8S?=
 =?us-ascii?Q?IDxZD/mPC0bftLLgiMPxXw/uRVefZbkpIlX6kBdxAmemD17WLKa6XfTwmNMu?=
 =?us-ascii?Q?Y2pH41vw2O7pWrUGbu7D5+M8UP6f78x2EyDjcVuTgZ8Br2CRqz9lzfCZr/Gg?=
 =?us-ascii?Q?x6iXL2IOO62JQ3Y7Z6NiJyxIMUltakRUuszXiPWVRC/2UiOonZFMHBhPfm1q?=
 =?us-ascii?Q?4AnZ1XrBiwY4lkOeZ/Y0FW0eybG6KT2yB6nL0Ji1VgAwBSLB64rv+b2vNnUk?=
 =?us-ascii?Q?CL2KjAtIX0KloScG349GfeewfeP+pB8rBAZwocwbUeksFlK2eXEAEUKy19r2?=
 =?us-ascii?Q?nO1Gou82oWflTPUwlDigPCEePGqWOmy6yV9nM5Wn4a5WxmcY20db1zkWRt1L?=
 =?us-ascii?Q?fZsvdKpf5/L8CDUv/B8HbR18kbwoKhLqKV90PcsTM6xKK/GSEBParZkvVHqY?=
 =?us-ascii?Q?VnQDj108lHNkk/3TnQZwEz68/jDSIzG1kiQxauX78uy6GWIWE/+tweqbZdYK?=
 =?us-ascii?Q?LpFitARtM12Mpv7JYBnrJXRVHZ2xQBdhD6v+pOPJrrGWgphKiQfhlX399VIN?=
 =?us-ascii?Q?ug1beKlixX56Si8vSFMb06toY7DDpUy95mYJEURGB/AZen/L60ish8aCswAn?=
 =?us-ascii?Q?XPfaGNNpPcwAO0hEvT2zJ/+u9PE39moyJBbnpQIWzI2Q/yU5+cEkOdlObyk0?=
 =?us-ascii?Q?/oWLWqZx8J81g1BEFJxWl72w8tcixHAE/GIF16SnJpwb+8al?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d78f359-4ad8-4fea-6e1f-08df2d0dbb37
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 11:48:30.9893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p99/xjB/l/prZF9Q9gQS6DJiGjoCl+1YG3OPryT/iDiYljRTfKqvCryNzwvsBX3T+cw0Z5x9425xEj/YMBNXwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8109

On Wed, Oct 14, 2026 at 01:32:24PM +0800, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> fdb_flush.sh, fib-onlink-tests.sh and l2tp.sh can print [FAIL]
> subtests while still exiting with status 0. Their log_test(), aka
> log_test_expected() in lib.sh, helpers record a failure in ret, but
> the scripts never propagate ret to the exit code, so a kselftest runner
> treats the run as a pass.
> 
> Initialize ret and exit with it at the end of each script so failed
> subtests are reflected in the exit status.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

fib_nexthop_multiprefix.sh seems to suffer from the same problem

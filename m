Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010038.outbound.protection.outlook.com [52.101.46.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567BF3290AE;
	Tue, 10 Mar 2026 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168248; cv=fail; b=XH8RpXu1hSfFULH58LsEXB8351/7DdJSy1EfUeKKKocRxA5Obl1p2eLSyThUVVFU1m8cvi6eY5eydqjyv8z6I93qC47K0RBWLpsMnqLOpOGoBUVxQm3rFHF0G04TVSiCNod1aniK8xpUnAnpj56KnuwlXL1BMq724RBMif9nQHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168248; c=relaxed/simple;
	bh=OxU27SxM12InenjE8JD2TgIPMlg1mI5DgI4ipvAAXo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FCx4ABDRe/7ZdUl4TVt7WtjWvEYxnreUft3t2F5K3GLCE3ABTjs3GGsIrEnEjUzdhAtnUmnZop2TuwRE7xuWlfTsP9dK9T+I2q4P2j4dt83JUqGFNkQCxv89cP7USO90MNz7c3/6UXfaAVm18MbL6rLVPsK7mVs4UYH8LlN33Vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pro6G2Oi; arc=fail smtp.client-ip=52.101.46.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pro6G2Oi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3XsW40hKvFc8VBhupKE5k6kghuEJEqBYvBkLfFQejEWg09DkWC08ip4afKSGJTXg7EyBtRFwecbJcCekFBGNxGTJx/UOisCQQfoK6blOaT2jkoppYfYCGkdF0XlpjSTLO6xalslrTYtsWNuvpHDKPHgRpOgCV4beoONZOcvgOkloEkDOGdWD1BhueaVM6NZG+DSX6roba+qgBa6AKshIgeJ1Pc6nWU94p2cK9zWdp9DfZAyz2DwFuvBFNMruEL3XkAgREUZGhCjVGGDKEwe1qtfxFnd+B7Uf5PrBzgx5P7t+meWskswDXOSnC0dX2mgzk1BHCiccM/BxOUCdZC4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAXJolwbgn+bGmGIWfxX0Afxa+qR0XjsmZtMO26rDJI=;
 b=pUIP6e/Uc7Qwsi3EiS1dvkH3Sw9vKTzHMaioyC9fZLivg5iiaV/bC0XZ6f8pB5yrCDch0cWdbn7BQn8+rO//MSkXNqStXZsv+n7cAewdh0jiBETUWsvuz5/K52bazAEB1wDParzvtTnIIUxH9COJyM6OpKqYsyjdTUL6pPoaitNQI3Y6sj5pb1Q37+T2/hvF2xXlid72ybHvcXYuJlQbpozqXsL28LLi65i1DgtCX6IkbA1aOZNuwXh3KobLu+0IYJv7k3hWiyNnRXLZhWBUEZ3oqr4fOfdAxcFRvuPpuSQ+7e2MKlTFXhlu3271ywAMGOpdMzwdYUJYSEl3vMlRYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAXJolwbgn+bGmGIWfxX0Afxa+qR0XjsmZtMO26rDJI=;
 b=Pro6G2OiP4FoN2KjPbGOgnjFm5cdBED94upOK/LXDTo+fV0l9j4Ga6mfUTFQopM2AI/DFiQFvagJRHFVN5c2Wy/q0WRP7ifE+Kj5vt7MXtRFakp/FIUpHoj4bXNbzI4opW1eSeS8H04ir5k29OfR6updL0ibozMc0jlc/f2loX2DFy88O/UD3zpikRLOmyauL0mzkpYhMx39eMmdyOmKZVmr3VmYGFO5ER2AfcloDX6psn59ia0wnhTnCLB8sOy/r6DNIeT5LhAvxlTWHLcskvO1wOe1PrY3GmvhH/btDMKL58ADTDBXMidGlorHHGHCqs4CLc0DJwpn6mWbr/S+rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by PH8PR12MB7302.namprd12.prod.outlook.com (2603:10b6:510:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 18:44:02 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 18:44:02 +0000
From: Zi Yan <ziy@nvidia.com>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>,
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>, Liam.Howlett@oracle.com
Subject: Re: [PATCH 01/13] selftests/mm: restore default nr_hugepages value
 during cleanup in charge_reserved_hugetlb.sh
Date: Tue, 10 Mar 2026 14:43:56 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <263A8848-832B-46F3-B6D5-948B6C27A433@nvidia.com>
In-Reply-To: <aef8d9c1c6fb2b80af90543be21e15030e720733.1773134177.git.sayalip@linux.ibm.com>
References: <cover.1773134177.git.sayalip@linux.ibm.com>
 <aef8d9c1c6fb2b80af90543be21e15030e720733.1773134177.git.sayalip@linux.ibm.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|PH8PR12MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 718814bc-c1e1-421e-1cfe-08de7ed4ffce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lLxS+/jfEh2AW/3ejB2N9Yk9l7X/VPCKVuwla1MUVkQ53m9bYS/Rqxa6fzv6qGP+Ud2vAJaRIUEjI3qz19T3DNklMAPhIQsMNkhAL5eL+MnK80sg/tJ3NjYAbVed+Fb6f2E5cYxuMsvR8NDpghxT5SdMKgTH69KhvJsMcBoohwLElLQo8jIPIAfVcagws9mHJ4+rDQ2syywb2vzro+xuaizxdYr6U0/nmOcj7GQ1AYDgKvUUzkVNJWo2qh0gp6SHkstSCaiuFPxR48hJwYcQ0F0OwXy6OJDqgAJAyjXjdhZJB/yhGDCaYgGl+IZHMsQvjKa/SwNQ71IYir8buLo/dcewMfYEa2gwzzyN/+Ht70tIW3Y0d00LTAO3t+eRn8AFbgxmIQQ6gSSlgph1Jx4LWx+mZKwwevy1jmI3zBjOVqDGMRVcUWrPPQubqid70E+cv1UPPWvVfYBYLhwn59BSQjWQLtWo5FlTiiCzwaZsfKbQBuNFzgmiIXV+UD9D4jwUvl1s40cVfgomgmrgKHQu0BrtW2CxghGZyzFt4TtGREckkNQeJHGkgViJ49LenO+6/Q2hf0TCbYhwSnHxkmwrn886gC5s+1fZaL+2k+IE6HDdIXdMkolQhEhBDoVMV/Vk91d+PHKrfZj68Z9qJOb/bTwuyHPOIxL99zUhQvrcqKygmLHWOEjza9hu9CEvbEo2y6q2oEArojMSKTNexVUGIOzPe+jpoi2f6AVAzcSX6/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uVt1/moBJR9YEEhT+vukqqhTR0V1B5YJDe2+XNHxsU0g7bLB3QY+WYKepnkv?=
 =?us-ascii?Q?N+M+UsTyjozmwUVrRyhB26IkcKW63+GJgZOXRt96Ud4KOcZd84F+5jnyHxOf?=
 =?us-ascii?Q?jLd0M5kJKYuJz0N5ym7B47ByMxwL8IWmK8VCOmPnpMMF04bnprJ7xPNbatW2?=
 =?us-ascii?Q?tSU/YHpwL+CFBJ1cj2/dv4RYxndpwaqXcGOCSCu4gQFMtgzWNA3Sems/27eh?=
 =?us-ascii?Q?aN8V1tL3ab8hz3zftCXSv9ZYPOhRTEfd52p5/Fv2oO+1lO5g/c9Sw54jvc6N?=
 =?us-ascii?Q?Zn6jk2IZuS8ZCXajeMVbm2V4Y4uVAoagOGVMRDnt2bVkghg6QAxH7mQzDabd?=
 =?us-ascii?Q?Jfg8egCCh+o8IfbhPAjv5Z/TREMv6WXWf0p8vzFz8/chp5R9edi871l5u/Dl?=
 =?us-ascii?Q?YW2qOhjZkm7tnm0aNUF0W83XFnQ8hSU3FVf09XsXk/lpycIeWBWq2HKQimwZ?=
 =?us-ascii?Q?45YhOUHhbSLP6xW/4h5wGu+YGCrN+wb+2uVlNimX5vM+3an7DhFi+T1JnaA4?=
 =?us-ascii?Q?ATNxASk0JwXRGsm0B5LzDoMiKZs/xlPjp+Zvue1qc3Y064g7Fk2ZiHl/IspY?=
 =?us-ascii?Q?1xv4CJbjEqd/f2nAsRsbuOWbxS8M+eYYyUFuk+sY9HECXegXQENY58WuyLS5?=
 =?us-ascii?Q?mWYZcqQrC5y6Er7voA6+zRcF6QQ9bQedRVHG1GmA+feTCg7b+8Tkj82toc4M?=
 =?us-ascii?Q?0Nig1qx3PPGMxyLAeREk1uhbemlu346LiRbBVXiacRD7/0akBmvhgpGsc60D?=
 =?us-ascii?Q?LHb+Q+FJ0+KNHAgeT9V+WmvXEK2N+lGK8HukqhjEe7QS0OhPjztk8aV0mU1E?=
 =?us-ascii?Q?kLJri6VNPIfkKJC5K8DtZKEvmJMzj7RBuXzHat1ohTUy821svdFMjVp/S1ML?=
 =?us-ascii?Q?bXk6gPQ81W6lv7KlLoVuvoGtOpnnSOZQSz0MT9q7wNhnfMNAH+lRc4Jt/x2g?=
 =?us-ascii?Q?4ePkeUeSDWga9icHxmmQNiSE981UXGrY31M7pJpHdx/61og81prYuzURwG74?=
 =?us-ascii?Q?fYaITdMrTLHqvaXjXNYh9sridQbUy5iDRDOGUgmjR/a40EhLP+EvAI9G4bJb?=
 =?us-ascii?Q?vesTj5wZKuPVSSHg7qZ3CqhHQLeiSo9V5D8i602OrT781SQ0UF97vbxHSPFB?=
 =?us-ascii?Q?fv/GTO1MushsgJzNfF+uFUenkUJPZHzmani2DX6EtSz3GN6OBwBQM/HV3auB?=
 =?us-ascii?Q?9fo9/kN98X7gT9wFptJG8ZiwzH+BRGAaZ0xs8zObkdtmOKZTUrVBpbvxbgCX?=
 =?us-ascii?Q?x8hLMgCyD1sRiFxuBz8+u6YXpcjLYmCWOFQ/m+A+v6wlpbiT20/Lk+OII1cR?=
 =?us-ascii?Q?/+cSldouQR5E/rZIV99DnaQNWed0vO9NjASxyvmhpbntMP3oAuXLLMw/TgOF?=
 =?us-ascii?Q?BkVNL7ID9FD3ZxXYnrEzi0oGiU3EQRDbMXGrBD+fHCiYRsHrYbMZBuU8BQZL?=
 =?us-ascii?Q?hGqEPSObd2N6WLYj0qxPy4jSw5jP2l1tLNri11PyLViAYA2n1JudYU3rfSMw?=
 =?us-ascii?Q?xA2YuTRL/Y2cQuAz2Ac3qL6tIbBBaVBrXr+zZLonbSgY/pfP8WumpKgM1nX1?=
 =?us-ascii?Q?9c1VDV1FT6tnJX1NwbUaZWPA2uBN0vw/931IyMqOuzwgf9+bFvcwFEY4JAky?=
 =?us-ascii?Q?VAV7wOaly2TufEZ3Ak5HtaedWtVHvbm0LyoZyjC3SsRe8umJhfFzgpmdlidc?=
 =?us-ascii?Q?A1lxpXJuoG0QY7zc4ZBGVAdvmCbNtPgJSPuQgOm4fPk9vRwQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718814bc-c1e1-421e-1cfe-08de7ed4ffce
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 18:44:02.4195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/fP1bo/xh6IcaqcBkGSGHv+F/B8FPfd90ophGye5Ngh9QXv99zg3B6TS6ufqsj8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7302

On 10 Mar 2026, at 5:49, Sayali Patil wrote:

> During cleanup, the value of /proc/sys/vm/nr_hugepages is currently being
> set to 0.  At the end of the test, if all tests pass, the original
> nr_hugepages value is restored.  However, if any test fails, it remains
> set to 0.
> With this patch, we ensure that the original nr_hugepages value is
> restored during cleanup, regardless of whether the test passes or fails.
>
> Fixes: 7d695b1c3695b ("selftests/mm: save and restore nr_hugepages value")
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
>  tools/testing/selftests/mm/charge_reserved_hugetlb.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

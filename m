Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33B83A9D99;
	Tue, 10 Mar 2026 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169321; cv=fail; b=XUrx/FfLlF9yAvF6YRAReIu7ger41NjjCJWknoaPYDSDDNVXQ76WliazESG6D2dxH/CdaqDrvG5AvuZmrUZxVXBTOqME8Oq8IusWXSUrGxLG22abGuQR/42VBaR8EBGVHBeVsYbSI3X8GL6uv4DQq+47jNe/I7hLSWSo+I+t9yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169321; c=relaxed/simple;
	bh=Yvig3T62NNLM0urkdrnkIRv9hr+1wvHrwuAuu4lp4ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MOzpVcQ4C4/LRcF7wtQOl82DYWyp/Fll8+nm4shoCNYTHZ/cV40l1RxxlRegRZSmrKbifgveHSN5qY/NrK+jyUy5GTh0EhN4posg5b5sbKBQmLcMvMICiu3HkoAMlCEe4ek1kgowPN48GIYNepMXQ3zC7r8x1kJn0JyA6XkmG1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mokUYE9i; arc=fail smtp.client-ip=52.101.57.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mokUYE9i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlOsGfKoCtZJOa/2BY8mdEjtK5DPnFZjqxTNDFD+Po2PFFKFwr3GNvzwsztv1D8VkfUoqWS+9oDbPsTorDMW8xqy2JKxUQzwnrbOxsJ5tlKNQVUMsZIHU5fed2fo8qeH1MFgi0AObcD5rrfaqTGivatf7pXrg6dx1wP6ucQQRdDlj+qM13MKkWoB53RvLgd/vwQhVSjBAhKXZKWDqD6scqDSmqJC9mglM8hCInp8UerNNwEKnOLwto8pyb1dBJP/j6wYdX1pXedWX/8qd84bq3bLgqHgDt1tMxpgkwNKfZUn5Ek1EnO14HrhCJ28v1WErRvfncELtIOZaq9NRwyw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uw0yaTTSbFiOXrrmJGmWpCrRAmTUyzh6kSL0Ut4kvhA=;
 b=gEk/AalluktlFRp37DxF92I+6h2MBzbBbauMR8HpSBA7PRV+a0SCfkkC3CoLxXLF1eP/Nv01Rb5KEV46XyW1K8aUcUR7mgP+0f/4rVLUDhoaMY5tCzb6K1W+cU/qU5FqWv/0DFjf+ns92TlcoTZUL0mWNcAnt9VJf25TI7f+T6voXT4ygFPlS76ELq1ahAJhns9eUkRSziDVNcYrKRjT6kB6SWMxTXJjcLU0briAdv1kd/Lgl/J1RMBcOXZv/zrfIQC7b6/MDPAu64yPwWBWN5n6vSbyDE7naqyV/r1YLz0ZlIW5AOQKeM6oQxgXMfj3srBfrL6bJyX8B6DyBS/Vtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw0yaTTSbFiOXrrmJGmWpCrRAmTUyzh6kSL0Ut4kvhA=;
 b=mokUYE9ifFPokWPu0+4kp3KPwAiR3W0RQU0cmAPJ4WfY9BDYKbgWBI9ZjQ29A2D9M/ge++LPAAqx1EtltLKc39bxNXyEj/1xErPs04uUXoMsVdl9A9tySnSngSY58+4VLU6XR1ssaxdHGP/X+glC8q3HOUv61QGdGj9giYc9PcUNXf6h+UNWBgLsdrb5EtDZ+ZPi10Cl4IduPmfsIAGcJjwQ48LQ9bBHV5vCkEetzF1J20G5/q1sTaR+bN0gk2ttHYysOTltI5BGrN6Og6LcxKUBRW9TzOhYDpRx2ud8mkoB3bCLjh31QCKnTrihQEqsaVbVDZgdoaHNYE3ypX5clg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by PH7PR12MB7455.namprd12.prod.outlook.com (2603:10b6:510:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 19:01:36 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:01:36 +0000
From: Zi Yan <ziy@nvidia.com>
To: Sayali Patil <sayalip@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>,
 David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>, Liam.Howlett@oracle.com
Subject: Re: [PATCH 06/13] selftest/mm: adjust hugepage-mremap test size for
 large huge pages
Date: Tue, 10 Mar 2026 15:01:30 -0400
X-Mailer: MailMate (2.0r6290)
Message-ID: <8EF5A556-0131-456A-8372-51EFE42F4109@nvidia.com>
In-Reply-To: <a5fc759e5896898bf930382f4a353771f4249204.1773134177.git.sayalip@linux.ibm.com>
References: <cover.1773134177.git.sayalip@linux.ibm.com>
 <a5fc759e5896898bf930382f4a353771f4249204.1773134177.git.sayalip@linux.ibm.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::29) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|PH7PR12MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: a66d9395-b5dd-4a10-d1c8-08de7ed773b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pXjTDKYb/CHDfNBn0IVQFFlDBMf9FWvfsAmq+sLB5EvmkNDmGHnBX2ck+GXC335CGhDifYfRmVKBTzKJ40f95K1s4EoJDDSDu9oxTr6RAekBnTEiXYNwVkzf3llJR1yc0nATdseJiLMdtKN3bzPIibmVG4Pm8qH2jZPa/veOH2hFaydogmhITTH/rLU252TqX6z5xc8wQquI1xpVGEwEm0wx8TpcM0HM87fLtQE3FVuhXBnkOLzf0DkRmXJKAnQq+iNOxj7saktiR/LPAuPtQn9BPzL3fQj3vfciVe6/HtCRFcv/Vh9Z8Aenp4WilwJdghD+wC7uqeBq3C9UoqMgj43jNfK1O7WAoVK+KTS+Ex8XYaSAk+LqdjCK6tq57AWFNSIMmVvr6c+OQR3lYKxupitlMDEWllK/mZlaMbwYMiCoqKmk7QLVEk9F1ChLBcZEw2bYLueLQv1uHoB2/G1fXczVVH8rAuDzRHSbr7mhP+ige54Kau6TUgo7fAcpM/BGJopkL+Cyt3ep8U2F8SkG4enwfN30AQI8Lr1j1zVQXvQFxGuki6v8Su64MIqyFIIv6DSfGPABzbxa8IMAijWb88G6cgk3UWmutGh3mfzcXDvdMdBSjLtLzGAvNpzCC/DowFOQTmZRGjqqx8oYGkXT46I3lkE7ghUufQjID9UMs/4mjSui8WjW1S1VNEe2Wv74RrVFr6d3jwtjWCLpBTaJ6EE4YULzc7DAZhV1sMoy42U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ue3ndD+kRp12YWlT85b96J1+q4Gk6XZXvuQsWxRW9T30o3C5Dj/P8i6ftUCa?=
 =?us-ascii?Q?C6i//Uy252Mv1g/3QHoLFawIB7d4XrAaG+KLkq4oAfFDXsE2rrDz/DLTc9s2?=
 =?us-ascii?Q?NzE/Mn/MSwFwneCHYOPbRSeDfMuNUiK9HgA0yBTp6BlJtjTQh6rUJJorK/2o?=
 =?us-ascii?Q?8xGmpa9pviXT7Cp1ZLucPS6XMvtx6aLJX2hVLglJNORPV84ItVaDxIQml/30?=
 =?us-ascii?Q?Gf0ck3o64pCD90VUOIBqT2830MaIQJAB/O8D7ETsOMpGETDX8lYI//JAClAF?=
 =?us-ascii?Q?Tsl4uOE09ItUBd5aTonJzuatGl39l65ZLiEpAJBtlqwzL82S20DKFpMdbN2/?=
 =?us-ascii?Q?XQ23kRmOUTLy/pw4AxF0PomvXlItyMoIEEFzN5PwYrIjv9zkcf21tuvTP/t4?=
 =?us-ascii?Q?Y8Fpp3REbdrALA5KXXb7V40J/alk3AwAnGuFc4Og4ECz8NgVkYJfls41M7+p?=
 =?us-ascii?Q?3fhGFhEF8DfNjM02zBqs+2cYRYERgqIdfmXDRdtxl1F8sBhGIDZPMfqxeBLz?=
 =?us-ascii?Q?TDXdPu/4HgBgSFGxNOYDmoAa9u/8Z4eHq3DLxcJ/Gsg/KoiFcmAeSB/+mRpm?=
 =?us-ascii?Q?B8yE1pl158vT38bGl9xidKquQL7Dy3fnyuVfXxyZL3+3OZcxvPWnABcw4zS6?=
 =?us-ascii?Q?dM6R65ftXtMcKUQq6UeV8YJoHAoN492OOJrsDz46C5GZn70WWYDVY4sy+Ov4?=
 =?us-ascii?Q?tofcX9m0sehQm75I1SI3/KcvuZy2g7gySajWJk/4lKtW3qnmaVbR+HflmcBW?=
 =?us-ascii?Q?Aq/3UeKRxXI5Yx0ljuXmkxPQzvdvgf2NFwG34WzkLQXCsmyK/8bhAFsK54T5?=
 =?us-ascii?Q?B6BrIu7DI9cgK0wyTGjKR3/AYnZx6nTLxwps0LfQFw38AhM3oKWgYiqMxFU6?=
 =?us-ascii?Q?Jct+taPHH62Yr4F5Wjg0cMLS6mEywklTqO9883zvH9SjRvbcai9mu6kA+xL9?=
 =?us-ascii?Q?APWgDwM4LsEeM+643RYjNPz7GYZ6J0dMsYz24BVnZ+V+fpwbb2oWsfDLmavl?=
 =?us-ascii?Q?oFykNZsjxKUIvofZOPVjfnmUHPq0pIzJGWsgKytAK360BnRCukyTMi0ihfPu?=
 =?us-ascii?Q?L98SrbR/WQXPSX+qdyRc4zwFqUeMqfEFiUsVs6c3LiCiCUj9kp8Y35NlvXM+?=
 =?us-ascii?Q?nYM5+m1OY/HXtB6EZddNRqzDeqPWkapbXDYEJQCJIaogJQcq8eD+s0P/Esro?=
 =?us-ascii?Q?TBsfneAuKqtqCCDz9CDF1xecVn053V606F7j2y1s8mlgy4VdyRHEVpVfH5hs?=
 =?us-ascii?Q?fmBpfJOMEHgQg5v9D9qfcfiOtzm8UIm6rhXl3sCx+38j0c1Uk03sMizqTnrP?=
 =?us-ascii?Q?9EqPT/JmyMedY3ggvl87EubxWakho8Y5KO2fjDqN2E7fCXnlhRptyDLJ7UIx?=
 =?us-ascii?Q?kX2OHWNu526VZt/FubCFTe7N+0ata+OAjOmaAO37bzpPt2x8kJ0uod8I4l0K?=
 =?us-ascii?Q?7GSPjhN/dvADKfuQWadFpp/mj1XCHV9+N6J/BpUNE1L+cpOqMNN8hCMViioP?=
 =?us-ascii?Q?N/jUfAmVT1GI6tfKepT1pVHwz120Te6aatzncea2GWctu9j/Kd4D2FwL+ORQ?=
 =?us-ascii?Q?XwJEKhJgcs1JDmlMhif7Dph24y50PL5IE1M+tqLly5CPD8khVWC1+agNAp8q?=
 =?us-ascii?Q?/Cdb4LVfMIwS1tL/Ko2T43AoKtgSaWqhLdFQFiiWHDGrsK1BYNvtgzjbII3p?=
 =?us-ascii?Q?iNgj5urSuk8Tktp8hT1Ut2IM3o/ctKeaCyIRBxNW4oRbKPFbPAwDuIje5brR?=
 =?us-ascii?Q?ivk1yCPOnQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66d9395-b5dd-4a10-d1c8-08de7ed773b8
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 19:01:35.9135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNHnopXjF3+1NMyXnYHUbgUR24+qe4eGiloqZKn5jYpbFPnsylXuqdaR1u7huw4O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7455

On 10 Mar 2026, at 5:49, Sayali Patil wrote:

> The hugepage-mremap selftest uses a default size of 10MB, which is
> sufficient for small huge page sizes. However, when the huge page size
> is large (e.g. 1GB), 10MB is smaller than a single huge page.
> As a result, the test does not trigger PMD sharing and the
> corresponding unshare path in mremap(), causing the
> test to fail (mremap succeeds where a failure is expected).
>
> Update run_vmtest.sh to use twice the huge page size when the huge page=

> size exceeds 10MB, while retaining the 10MB default for smaller huge
> pages. This ensures the test exercises the intended PMD sharing and
> unsharing paths for larger huge page sizes.
>
> Before patch:
>  running ./hugepage-mremap
>  ------------------------------
>  TAP version 13
>  1..1
>   Map haddr: Returned address is 0x7eaa40000000
>   Map daddr: Returned address is 0x7daa40000000
>   Map vaddr: Returned address is 0x7faa40000000
>   Address returned by mmap() =3D 0x7fffaa600000
>   Mremap: Returned address is 0x7faa40000000
>   First hex is 0
>   First hex is 3020100
>  Bail out! mremap: Expected failure, but call succeeded
>  Planned tests !=3D run tests (1 !=3D 0)
>  Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>  [FAIL]
>  not ok 1 hugepage-mremap # exit=3D1
>
> Before patch:
>  running ./hugepage-mremap
>  ------------------------------
>  TAP version 13
>  1..1
>   Map haddr: Returned address is 0x7eaa40000000
>   Map daddr: Returned address is 0x7daa40000000
>   Map vaddr: Returned address is 0x7faa40000000
>   Address returned by mmap() =3D 0x7fffaa600000
>   Mremap: Returned address is 0x7faa40000000
>   First hex is 0
>   First hex is 3020100
>  Bail out! mremap: Expected failure, but call succeeded
>  Planned tests !=3D run tests (1 !=3D 0)
>  Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>  [FAIL]
>  not ok 1 hugepage-mremap # exit=3D1
>
> After patch:
>  running ./hugepage-mremap 2048
>  ------------------------------
>  TAP version 13
>  1..1
>   Map haddr: Returned address is 0x7eaa40000000
>   Map daddr: Returned address is 0x7daa40000000
>   Map vaddr: Returned address is 0x7faa40000000
>   Address returned by mmap() =3D 0x7fff13000000
>   Mremap: Returned address is 0x7faa40000000
>   First hex is 0
>   First hex is 3020100
>   ok 1 Read same data
>  Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>  [PASS]
>  ok 1 hugepage-mremap 2048
>
> Fixes: f77a286de48c ("mm, hugepages: make memory size variable in hugep=
age-mremap selftest")
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
>  tools/testing/selftests/mm/run_vmtests.sh | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>

Makes sense.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

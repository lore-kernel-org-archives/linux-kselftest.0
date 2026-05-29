Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD9221540;
	Fri, 29 May 2026 02:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780021718; cv=fail; b=D3ipBvI3CwxAHkDel2+Wngb6JFl54oebdIr2qHEPBU99wOM94p0pRg99ST05BRdzIKjLEKUOSaBNDuk2fB2fCcVsW5W9y6Uf9tP1chM4sR2EILzCkZlTuRKmnLWWdmdqjCeaRi54an0A9TA9/LRKl3K2e6mMhXOL1m+24/QH3pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780021718; c=relaxed/simple;
	bh=Eroz29vSoP7ta0qTKH4PAj9ALcNHXWws85CFVc3kDZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BOxANT/gB767pZF+HPmCFONYDzIUD7BaTc4zB3qVHwJjcFM3wQvoUorlMzj0jY9nFpdl+8rx9UKh0dmc5rl9IHoaEUtsV1rNJnu3O3wnhz+mK4UqDnqzlH40LdB1PhBXyEhBYDRVZLLBNUfGMIkP9rBFYgz8GUHIsCIQh4rSEZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cSVZyzTO reason="signature verification failed"; arc=fail smtp.client-ip=40.93.194.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cSVZyzTO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQceDuazDNfzjFySLMANQ5wECXato6FcyA52zBoCJwDpf2VLF/e/FTrT/g60hYt+i5Lt5dE3DaTO/xxZ2smJM9KWYhCCyfvbIQfvpjAsJCosMVsUX35KtrHAc020qlidFKGqkvNCneZQ4wLUtGRVfTZ6EjAep7k7cQQlFV7Iwyc5ERjZRAdNcTdhjL2qyqQ4qd3e4a39cO5dTyRq/3BsWpBU+SKqEaCuAvTlzN1AQuUgD+M+d03vHLrFhedPrB+PvrAjlj0WzjkGXD5cVUXw0DoJfkDaWv/zikhWipwC+U0g55s6WtmaD0EK4tJayBrRbRyLVP5J2AZdUnoBJOLiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIEA7ek6Y+T0GU7Mxa0d/Lg9vYoqaJKyGR4cJhhhYZA=;
 b=qHSE2D1z84/hV7OL3KNXVCqklo2h4bo0NEkOy/KE8lqCvwAR7PYo7nIKMdlU/PAdr+4PjlEE7eAhHp6DqzXaNhwu8nTpJfv6GAnmd73GeRmnUEJFh/rOZCmrwUqusUG3uReZVNaAPsFB/nTvGCO9PL0zRCaIgaSyVoPQHq3JAKWsJkr/Wd7TDD6PjSw6fimz0oKFpglTJjb3BkW0UGFSNHIVF9wp2+LSRmQ8ThnpxqIMTvDc7IWspddWheU084g4xEFxXRrgjLgNGJpi6/OMsEpzoZ59+IH0w71mWevkZEj3XgFkK3Uf5iedfll/p8eTL5iNxEyze5EXYmkSFZaG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIEA7ek6Y+T0GU7Mxa0d/Lg9vYoqaJKyGR4cJhhhYZA=;
 b=cSVZyzTOYE9IImORnsafx/ol1EsGb+KxFts7WNjwtE+Lt9/R5TonA+/w1UzGM4GgCYdjNKbZc4gXE5a35tvwDYnASwv9kCJzN+GSczj9ctcZd0vSxxX7hLUJipB9wxnBG7DrAW1HUsr4ZIquNwTn5EibCp0//1Wo+F5NDWc1TzapnisTaOzcuglIdiGFatkhds77B9Tlwm67pnExyZGVBcYMrT0hoyEDXwRGbfhpJ2FnenanQtl2FddeayqAoXK5k/264cYKpXi48LjUxhITX+NqR8GKH0H9UQbib/J6q/XsYdt4MSVqWulU+EW/Yk/0ahzsYOw5xZLEHHElaa2nqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by PH7PR12MB6788.namprd12.prod.outlook.com (2603:10b6:510:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 02:28:33 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 02:28:33 +0000
Date: Fri, 29 May 2026 10:28:26 +0800
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com, reinette.chatre@intel.com, shuah@kernel.org
Cc: Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, yu.c.chen@intel.com, 
	fenghuay@nvidia.com, newtonl@nvidia.com, kristinc@nvidia.com, kaihengf@nvidia.com, 
	kobak@nvidia.com, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v3 0/3] selftests/resctrl: Fix resctrl selftests issues
 on aarch64
Message-ID: <ahj5bJRxN2ecghus@MWDK4CY14F>
References: <20260529022352.8308-1-icheng@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529022352.8308-1-icheng@nvidia.com>
X-ClientProxiedBy: KU3P306CA0016.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:15::10) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|PH7PR12MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b46114-f545-4ae1-30f1-08debd29fa85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|22082099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	jr4Key8+CpjR+/EeU2hR/ayop2LjmirE7UAaKcC0l2op22IKA9N7V5a7z411DdfXE27DVYR63vrnDYrRwIRkwxZO3DH596xjor2+S7HYBsfTHjH+cVeICuDRNurTlNgQIkwOAcZ3juBDSBUxqPi57K+wmWGSDu+qQdSiPHhTYXm3mCSDgWLYeywDwDTQ5iObjh+c0cHnxyjzhGAhg4TlqTnyW6VoKoBBgMuvAdMbqx18EB54JvY3N+uvOXLXG3i3EQAszYwr+xCXGX3Mc9rliBVhau6i9VCZWPaq/OfxsjA/g2fu+5QDUxu61jHHa16AIkPrrEcjMidVkDk5zzRAWEAtjHbHUtExfAGhXLsf2oCeF77VUdTn5ZzyfIuLExHf3M5L045QpUZwYc0OmRtK1YUivAsdliJUdcM6L6OmQzkCjzXcQ3t5MsZA3C8B7gRvDFKP4TCxZRupyXLe+VYXdcEUkKiljlDBiIQQvO+qniyvoiT+TjWRI0quSOQDb8eiv1+2l8JKAO2RFX32x6Np57n0G4VxREOqN22c0u0CQID2BimWgok+MDZlhuBVRlEYv36UI2NkBx1hI1l39zXCYzcxcdCDrwov/XE1eUPs1ygMbY3apEiHJ1i5L5Bwm1qGmoXgYPiM00PMNx4cuxy5rp2IdC/c+F5H9Y6nKEwIXgys8bPHnXADqKgjiniaQGg3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Xqgf2KE56TEJPVHGWYXmmSswLKgTz4hT8/lDNM3dKShLDYSg2grg69yu8h?=
 =?iso-8859-1?Q?9NI+imUn/Uy6nK3cbmHu9r3JTRBVCAqe9XUNcYmQe9z1ygX1337GSXUU//?=
 =?iso-8859-1?Q?JlCwHELdZB0A8O1bvGQyj0DPACTzxTLCeGte+ekEU9BKOwgWodnsE3zH9Q?=
 =?iso-8859-1?Q?d/cuJzZr5Fh3PD4jWVo90rdrygnCsV0N8BtTiVls6c59ARKjDjTsTS2S9S?=
 =?iso-8859-1?Q?USeQIF627ElZruCGmZAGuoBM8oqbomt2BJtPjgCCzKj5LPhRALofMEpU6C?=
 =?iso-8859-1?Q?XgxN4PjK0k5p8Ydg+pvYrUNK5my1VjV5LwY0CpQCXWfwz9On9/YPFU/dxV?=
 =?iso-8859-1?Q?zYt0Z9Ge1ijUPSPn842zKzFdrzebqeHIR1Fi7hz8uNuvq5AYj9MKyg9MsL?=
 =?iso-8859-1?Q?fNffR2I4hE1NKRFp4KrtHvz1z411YiPradAIx80aB+EBmHtZZIC9nt4TzM?=
 =?iso-8859-1?Q?7cDlsPn9+ZUXZMSyFHox6lQL8HoEyIBzR6eKK8YFiD3y8gYiXrC7jEKFwn?=
 =?iso-8859-1?Q?6AZRnUMXEnf0lStR1/teTea7QUh8sCpkn0IFr3LA9ImY+R0V3ndMJlV0qM?=
 =?iso-8859-1?Q?Ul1NrI9REtLqycU+X7g58ALO8gWV4riQxATUTuTjeNeQjRjwkTxGxczj1e?=
 =?iso-8859-1?Q?tIOwdRLyjuNz6xTiWl6mx3wZ5LtQEJIUX76Px/aCYozvIIjF3odCPGFx1s?=
 =?iso-8859-1?Q?yQ869QhMwB7aIxx3eKHlV03K/mULcXwVJkgHi9+c1ywqnpA6gR3Gfmtbfx?=
 =?iso-8859-1?Q?lZfi4f7EtQIJgYoIb7KmSw6EuLxjx1hRBNm7RgmB/9uvyDacIqgXTMw1Go?=
 =?iso-8859-1?Q?xbUk0YeKI/auLLoodkF54evZeTwn8V6/SOaDeswa7btS7LKeVEP0nA1Fk1?=
 =?iso-8859-1?Q?eZQbw23/yoxCAAsQ9xGGKnd9NsNgZVdbIhNGDDpAqnY66ZplMegfMWHYNi?=
 =?iso-8859-1?Q?AkFLnlLkAMqtMWo/EoevUZ046tH6e//MkR63BaKIb1DI3RmdvWSWxBzsAQ?=
 =?iso-8859-1?Q?cUR3BO4onz91E3L+K3iUWsXtu8BDoHKEd+hHqcW7a0NN6rAzmEWlh42tB1?=
 =?iso-8859-1?Q?w1ucaA8wZ6YEJyT+wUCXYJyhZX4YSAQd0goJg4CLrBjiPeLR00CRYbAMPG?=
 =?iso-8859-1?Q?s+rGp+dMiSt0TNp87C99rceyYMlmf7CYZOa7Y8+Ej1JNWHZV6OpVPF09+i?=
 =?iso-8859-1?Q?9ioXad1cbpH/62EUV/9RubeQ6or5byZXWPvim61uW+tXp496Gx9vQZDwAw?=
 =?iso-8859-1?Q?ldM2EzvA1ZJfKZP+HFo6GsHEMI4HfvwLulPdMHEzktqfZQnGHxPbU8jPft?=
 =?iso-8859-1?Q?3yB132xHWy7hRq9Ms3j1Z/dbkBGsTcT/nD+2qzVM1Y061gAeLYRiqpoH2C?=
 =?iso-8859-1?Q?E9AX6A9fi4UokGu5SDAXwyaDpHU4A+U9NvwaYxyeFIoousTRNj6VkPsRCU?=
 =?iso-8859-1?Q?zU0REMPX/psbt2JYCOOFSBzOHSiVCHftNwsFoHv4jpN6kPObKSlU/Lebv+?=
 =?iso-8859-1?Q?cuqD18m26LxTJV+K9e4u7CKl4XVQBQG1w/1Hr1JiqVC0XVvNq465ZmFwgE?=
 =?iso-8859-1?Q?ASHgzSlHVYnK33piB6Xj+dXgmQ4R6DE8GPDYgzV0o5X5wKk8aC9DPqdb34?=
 =?iso-8859-1?Q?0tHO1z8Mto8GcxKtvBxIfB8kMS32PDe64ZB/het7xdocrW1l9IH/apNbhs?=
 =?iso-8859-1?Q?lWRu7qbMY/8FHXmxlYZjqX6TO6mvVZmooI1jRBWpw36h3c1GxpAFxP2so+?=
 =?iso-8859-1?Q?b4rNkrONBqh1SlYW0FWAtrjcQr8F9pXv7mnJKIaLYLOoVYQ3f8s9a1jraW?=
 =?iso-8859-1?Q?NbyTSdjXPg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b46114-f545-4ae1-30f1-08debd29fa85
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:28:33.0689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWWQlds3ehJ3eFbgeL09exRQHI7zEWtomNq9ABdjKqjW+4UsouIFtGXw+IrQEPr0kG655FUTclQX5xPizsdzpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6788

On Fri, May 29, 2026 at 10:23:48AM +0800, Richard Cheng wrote:
> This series fixes numerous issues in the resctrl selftests on aarch64,
> where they currently misreport failures.
> 
> Patch 1 skips L3_CAT at feature-check time when MPAM legitimately
> reports every CBM bit as shareable, instead of failing the test.
> 
> Patch 2 adds aarch64 implementations of cl_flush() and sb() in
> fill_buf.c so cache flushes are no longer silent no-ops.
> 
> Patch 3 teaches detect_vendor() about aarch64 (which exposes no
> vendor_id in /proc/cpuinfo) and lets arch_supports_noncont_cat()
> return true for ARM, fixing spurious L3_NONCONT_CAT failures.
> 
> Changes since v2:
>     - Patch 1: add Ilpo's Reviewed-by.
>     - Patch 3: factor the aarch64 check into a detect_aarch64() helper
>       instead of an inline #ifdef in detect_vendor().
>     - Fix the patch ordering in this cover letter to match the series.
> 
> Richard Cheng (3):
>   selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists
>   selftests/resctrl: Implement cl_flush() and sb() for aarch64
>   selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT
> 
>  tools/testing/selftests/resctrl/cat_test.c    | 32 +++++++++++++++++--
>  tools/testing/selftests/resctrl/fill_buf.c    |  6 ++++
>  tools/testing/selftests/resctrl/resctrl.h     |  1 +
>  .../testing/selftests/resctrl/resctrl_tests.c | 21 ++++++++++++
>  4 files changed, 57 insertions(+), 3 deletions(-)
> 
> -- 
> 2.43.0
>

Sorry forgot to cc Ilpo.

+Cc. Ilpo Järvinen

Best regards,
Richard Cheng.


Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010021.outbound.protection.outlook.com [52.101.46.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960E4CCDC1;
	Thu,  1 Oct 2026 09:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846624; cv=fail; b=gVIS97VRtoKlIQaTe6MG1IdL7acuO0qWMB9OArDgHL9IlrE6Sn8lqOyBAHAg2DjZDBSY7YAs5u0BIVr8pMYJYzYE9IwC/ckF6CurkUjYE+HGaSWDxJHLlJCOTJjxCh28RKenzAywS6d0pPVPiZnSfPolWAwTDGsDaE06YS3TbKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846624; c=relaxed/simple;
	bh=x/+Vv2uH42f6vNDGHdPZMJ/tRSNV2qNEpOdNgNoPeqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=geKNsu55DpVGPpSyXJ7MwM5kveGVYHjZB+FrTk6Ty0da2oaO6tRyXNH0Z56t4sO6Wrk4vpoB96eHsgDsm0kiEEcZF9lzCdrbEbe2auHWDO6HXHQnHzIOZLDVtdY9qIS/b/6t8zYg/EvD5QuyFRQ7BkHGtjVq7r9gT2UDplCkI40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q5exMkT6 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.46.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q5exMkT6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8iVunx0YXxN2XasYsHkJbYmhU/+NnxroSYBMH22r58qWDYrm3uuI84DYmUEWtueXqUrTiIRynvftwbVL10dStuO0sHISctAsucp8J86gM+6l3jxFmxpRKdQ6j21+IxEe6qVTzuYmafA4lIeq6OL1leevuG1QWQxpafVj8rCLnKzwUifMD+JXXll4DH8IE3s8i8N61SJHlgeXI8fZl3zDgE6B9c/4uEiwagmVFGPgHM1m7FnMfr6lfC8Pm5beKdzFOXMPR8Jy/8b6Vxh8CRXXEIN+RLL42F6hfW4te+sXlgTjM2oxqvhPIDPap3pfH5yjvBGs3v+/Igx5+VqWI7PIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DbL6O2RumirCP5du0DABCeYeuvs8mMhKrppvYfJiTI=;
 b=UkPZoQn51vcaK1Q9THMj4fmiy9jjwghlmdZerUyiQfNPADN7kqhLQSKf3yHfSnGVDzl8hRicQ3ghyNdhfqHWPUYsrk7qa4l00fR1vVW5cy7c2w3niynzTenE8k2qdyA50J5lAePW+gzvy9Y6Z4a0WyUjw3aLZ4AdUWDb45MTVs+KZI6sPRuyZ8TUPqgtIq1MbTcyxmH+ukkgfaP1ydJ/uvKw5VyExDglSJ0k65R0i9lCb+d98BEAySUPbv6S8/6VOpF6C0/JBPMsax0w1sui6XkSAyLKQnDHLDF9Q2ROomqbgntY3Uy/rjKjIc6D6S3lQ/KXvH3bsaeOqEq1/pGaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DbL6O2RumirCP5du0DABCeYeuvs8mMhKrppvYfJiTI=;
 b=q5exMkT6sYFelzxkAKJbax/R95VkJ1cSsVJWqmjrxhYO0iZUujsf8B66v0SzrLmVoqAMO6xbpUheOOiBmf/DT2oGJ3huAoiOyKFpZmaEEMfFD1THLxAy72jxVrA6mjG8JrKl8HsJMjvF1xV72HfaSUhJ4XlG8aGfqWN1NGs3VNvBQWw4NH80CmTVBGZjqKZwotk8MXufkHSl1+bOyduw/1j6V5/pWDvsGIyLisQSw4zkBB0pFkk0YCM2o7BywHvRPYj4zpcrJUDU6TLlPhj9CqRD+BYafnsvpWdx+rvDph1uASR+3UDdXnTZoXcyFEF1qoA6xa5MoKQ+vImCYESeJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by CY8PR12MB7147.namprd12.prod.outlook.com (2603:10b6:930:5d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 09:23:40 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0451.014; Thu, 1 Oct 2026
 09:23:40 +0000
Date: Thu, 1 Oct 2026 17:23:33 +0800
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org
Cc: Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	newtonl@nvidia.com, kristinc@nvidia.com, kobak@nvidia.com, kaihengf@nvidia.com, 
	fenghuay@nvidia.com, ltrager@nvidia.com, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v4 3/3] selftests/resctrl: Recognise aarch64 as a vendor
 for L3_NONCONT_CAT
Message-ID: <ar4mfJWO8zHTRluH@MWDK4CY14F>
References: <20260722035943.32337-1-icheng@nvidia.com>
 <20260722035943.32337-4-icheng@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722035943.32337-4-icheng@nvidia.com>
X-ClientProxiedBy: TPYP295CA0036.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::8)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|CY8PR12MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 405eea4b-2f73-4026-e849-08df1f9dae10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|18002099003|22082099003|4143699003|6133799003|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	Buv1584upwwdcqVlJ9s9/X6kMzIMOjg0g9YWjXM5LkNqXml2vb0QsrZD9d68Kikm0tgFeYWrMSq5RTEu3O+iiBzMm73ow6o/ztykJ//mdz8N54L23J3IrGx3zzjZ68hJH7dpTCzPFXppsvmQTp/Mg6bHMwLb5YZDzoblFelw9bCfzPCz8W/u6J3jHfpZBi2wkAPp+6bj2yEPvgbUa8PQ1mhchXUfCn0EDBZ7X24WbYLsdfgqbEz972Bab/Y1Oa9HsLQHQmEWrHB5yDhNZ2kLG49oBpROR4LV7bErMEai7Z2JSWuhJPTwFt22WDU12C4jd/YClYUKYERW69QCOhrGi/9k/YtPL0fAGXqvLOvvehYu/gqlJ4MJH6hb+vwyESlddE4WVnQoNzbppHL4fQ+ZqtKHu0ef5+n/i2Ss2Zjij+vJ3qqHQYO5vkI6/wSBxqtNThGtzVmxJj8x7wILHJbnBKw3KDDCbY+pdZxTh5QZU6lXnFj3kkeius8Bl1n1iNcBHsdS47s4sNbyQEFhztURlyOLcMWtE5WtesIFLDxDkVQ0mLpLydwpjjDpERMUenKcP3HYICXJS6XeZ3od8CY7GK6raiYuRSeeWSS8a2uPoLbt5AHiyX2mJr6GubsTd8/R+Ty9Le2U+leE/26KXN7FVMwcLqdsnHVpfPZJw4bsp8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Y/w5+0GSlWLZp7bfK32S4geB2qQ128JCaq6ckD5SB6YmBylnUOplekDcUi?=
 =?iso-8859-1?Q?Mr2cf+9nsOu90PFOiJ0W+8fegKyt/ZzXkBC3s1CWSBOnWBxY4r/gySBRo7?=
 =?iso-8859-1?Q?jmbr9V6APAV2gcXYJMAk3ZYw1YApTZIka5P0/cQqyIpieAC3+KPnBfWD2T?=
 =?iso-8859-1?Q?I7FZ3IzSjeMYMU+MK2HnqQhkZLQJAwZ/I0qjyUPhw5FayBEKxoq8ain+YZ?=
 =?iso-8859-1?Q?7umcyIqLe0Tzwbg+4nfHK2yveQBs3r3pFj/9gmzwEOi8kQ2Z2QqltWwmah?=
 =?iso-8859-1?Q?AkylJZdUSg+jjbenbTYQyf7Ok5r1iGybqdYBDi/d8QN8CpFK6MgsJBFyH/?=
 =?iso-8859-1?Q?Eut8l/TBxuVG2v4+3zQx00gjj3UpVFH1D97+V206CJpmEVU8WRALewWpzI?=
 =?iso-8859-1?Q?yB27ysGoVaAike/8NE3SCn1TqoIOZej2I6pdSDNtPE7Hnuo88LsKOnszHq?=
 =?iso-8859-1?Q?mvypcGqnqQ7iJIpwmlTDCQVg4nBTCoVpRAvnR6zBYeThF+s0U/57I23mmm?=
 =?iso-8859-1?Q?/pXrl6NqJuxUn7vfvxsy57fUBdLMQuVmi/sVkqs0PtVo3hkBl3s1tcZWJe?=
 =?iso-8859-1?Q?nPGQzx4gcakiP+DPZRCH+9WCumDW23CREhuYVJQyZCxtH+KIA8ioeqs9NJ?=
 =?iso-8859-1?Q?JaouMgvWtI5vIiZgjB2s6V66U8eakTAZEvWBX29WUyJX4SKyUnnE7Nmmz6?=
 =?iso-8859-1?Q?OSZdFjZ6CyoX+6b1LyHFLDMrAn4YoTjeavliqZofdFy21VB8essFwD26B1?=
 =?iso-8859-1?Q?3dOqfL/37JrkfA/0WalxERx8kpUntvv/eKRcsNUCpJZ1TgPciCnHNECZgW?=
 =?iso-8859-1?Q?+KXeLVllZM+dQsfebQy3s6NrruHLrRxTbtzmJCEioe7Y+sCsXvhxDBfkUR?=
 =?iso-8859-1?Q?4wOqiF5bEQsQlI6Q5bBefjpAtusaINnVjJRlgsT784myJdjrI1LucrzIJY?=
 =?iso-8859-1?Q?4Srhs39svcZ+fvKLfl93okWmpL8OjIQ8zR9KsfPHHGv0EyKmovkVqQHAaC?=
 =?iso-8859-1?Q?+5lYUY4WfFCiPH4KnThZCSJx91aQTXfh/DadVBrlYkeh9GQSaQgg5O+9Sr?=
 =?iso-8859-1?Q?LgC84Vh4TWwKBFQECojCYHF6ZROPwGGNEFHWAfgBaUXxZHVGyERn1LJdgp?=
 =?iso-8859-1?Q?WsfrinmbZCreC7bDHAh8SSTTm5fzkxrKA5mYaJFnNpUSFbZ4BUkWzvI+iY?=
 =?iso-8859-1?Q?YFsCrOF9jqNdhic+FtgO6HoZehu6Y+8sPVjw6FFgTNW5jnxEsGhq0ETrJ/?=
 =?iso-8859-1?Q?O5qnppr/uvpJW1G/aQi6BUyaNEFdbFezwTcbSjsztQyb5ZAgj5UIvDAhGI?=
 =?iso-8859-1?Q?VEpD5gL4ZEDaJc44KC+qjE8fuVNGREjNYfM4QgoQ8G8CBFVDi5cPzjYLQJ?=
 =?iso-8859-1?Q?wpftRaLS+7aPHlEkyftBfKK90EfEzfhqV8oF0+WiM1zXDQPEsOeluqhud9?=
 =?iso-8859-1?Q?l4WiPlxDKeomCxbFPHSwgOCJp04ufoogr0oVtzFOPy4djabdMxnN1Vnf04?=
 =?iso-8859-1?Q?RoMyl/B6X8W49I8CyS8ij+5JbYAJNyA7zwT9WDGixmShjFIv6OkiS32bhq?=
 =?iso-8859-1?Q?puNdpJAOwxFmkMiPfwhUJyxS+Iix6p98NY9jEg0JA9/O1TGpTg8UtO8vJ4?=
 =?iso-8859-1?Q?3QIBtoAcYtvVb9ptUq8PGudzNgJO7EKuwJ+vQEs8PapaJH9+QrbyLSwnic?=
 =?iso-8859-1?Q?tDrJfYq++xPZA0tYDD5uMBR+HYEy3Oy6jOJigZP54b2Ist4LsRJd/ERxeC?=
 =?iso-8859-1?Q?wLww4kmapR60lFm2ZiBfRTeg1P7BYr9D9hYIeGOR3Bibn5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 405eea4b-2f73-4026-e849-08df1f9dae10
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:23:40.5081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihO8EZ98WMIfnCSESXZBlTNHHl4plPz3A3aobXwp8uCbcj2gLYBy7o+6PnRMolZ8ESHy2VZEMybfPu8YSIAQ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7147

On Wed, Jul 22, 2026 at 11:59:43AM +0800, Richard Cheng wrote:

Just a gentle ping on this patch , thanks.

Best regards,
Richard Cheng.

> aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
> and arch_supports_noncont_cat() falls through to "return false".
> L3_NONCONT_CAT therefore spuriously fails on every ARM MPAM platform.
> 
> Define ARCH_ARM, short-circuit detect_vendor() to it on aarch64, and
> add it to the AMD/Hygon always-supports early-out in
> arch_supports_noncont_cat().
> 
> aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc.), but MPAM
> mandates non-contiguous CPBM uniformly, so per-implementer handling is
> not needed here.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c    |  9 ++++++--
>  tools/testing/selftests/resctrl/resctrl.h     |  1 +
>  .../testing/selftests/resctrl/resctrl_tests.c | 21 +++++++++++++++++++
>  3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index 692860c7ce59..55aca0af02c4 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -271,8 +271,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
>  {
>  	unsigned int vendor_id = get_vendor();
>  
> -	/* AMD and Hygon always support non-contiguous CBM. */
> -	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
> +	/*
> +	 * AMD and Hygon always support non-contiguous CBM. ARM/MPAM defines
> +	 * MPAMCFG_CPBM as a bitmap with no contiguity constraint per ARM
> +	 * DDI 0598.
> +	 */
> +	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON ||
> +	    vendor_id == ARCH_ARM)
>  		return true;
>  
>  #if defined(__i386__) || defined(__x86_64__) /* arch */
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index ad1c17c0b0bf..5c752fc5d470 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -40,6 +40,7 @@
>  #define ARCH_INTEL	BIT(0)
>  #define ARCH_AMD	BIT(1)
>  #define ARCH_HYGON	BIT(2)
> +#define ARCH_ARM	BIT(3)
>  
>  #define END_OF_TESTS	1
>  
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> index 593f0ca5251b..57f9f9c0992b 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -24,6 +24,15 @@ static struct resctrl_test *resctrl_tests[] = {
>  	&l2_noncont_cat_test,
>  };
>  
> +static bool detect_aarch64(void)
> +{
> +#if defined(__aarch64__)
> +	return true;
> +#else
> +	return false;
> +#endif
> +}
> +
>  static unsigned int detect_vendor(void)
>  {
>  	static unsigned int vendor_id;
> @@ -35,6 +44,18 @@ static unsigned int detect_vendor(void)
>  	if (initialized)
>  		return vendor_id;
>  
> +	if (detect_aarch64()) {
> +		/*
> +		 * aarch64 has no userspace vendor_id in /proc/cpuinfo.
> +		 * MPAM-capable ARM implementations follow ARM DDI 0598;
> +		 * treat all aarch64 builds as a single vendor for the
> +		 * purposes of resctrl selftests.
> +		 */
> +		vendor_id = ARCH_ARM;
> +		initialized = true;
> +		return vendor_id;
> +	}
> +
>  	inf = fopen("/proc/cpuinfo", "r");
>  	if (!inf) {
>  		vendor_id = 0;
> -- 
> 2.43.0
> 

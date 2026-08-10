Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704F3403EE;
	Mon, 10 Aug 2026 04:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786335756; cv=fail; b=sqemu+uPxBxo7sa/57oD/eq+FjI1XrxNVt2r0OgK25mJe05YO2PW5l6/4hNFmT1LFFuBzZt2q6QVL6CKL+OL/VZaLSAkTPlJ1t5xKyabtZejKggfkoakQF3Y9Z7dnubICcRQW0a+cyIeOy2JJC6Zzyf07aYC+cRhTFYzI1tQrdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786335756; c=relaxed/simple;
	bh=HKemT4Q7PlqzveTBRsttdsywVsNlRrGLUmV0PNSonhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A1uh2QG4y2Vn4D8pDEZ1e+sRniLZ30CGLbUujna5dwKxHxUXf8kzPPsWo8+5S4jtA4ruWs8Vf+0Lg3ieNyoyrD+4dp34mTSKL3HZEWb3egh5Ef2EXzguvFBJmhQOl62y3/ng6/pHn6qhUiR49br3CXGdK+4jxXp62EUB0c1wWHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B9Te/IIX; arc=fail smtp.client-ip=52.101.48.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B9Te/IIX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9blhQegW/BBz/zdkNV479VWGcUrZqKvcBsEbK4KYT6D+hlexV6HynNqkPrGSDJlV2+599h6ua76wlGmUS415O3yEGjrMTcXy7I4BaN2E9mr6keiAp8WJUdQUmnhQXrYmyQaZ7dA766UjMUBV/T8md/+pvWbu84+IiFqCUn5jdd6o+7sOdLSX/eL0uRl/DnnoVXoUNeU1PlUJdY1X6dBqV5p19rKCI3/+UpZDzlWqNvJLxkSOZyKW1qU64XxMugWpVdVh+bYb8Ro3rW4faJnfsUrUJABm4f1Ui0RzJXuhQA3iQ32bNr6Oi+UdCm1uz+bpmeRdnlwXCINWmXpAJT4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jIfgqpBJXznAuNPcYygyHy661gpgmk+lGrtabJ+JwA=;
 b=JfX1fV0jr8RIUBTExvLQlPH/zjBmZnfe/AcdshUkOBc4rK9t+WUGYRhpJ97dmnobB70qNfpC52loMf16N26m34b7/IicV15JdeNAhO2D2cjsmbvW5unpK8CIf3fopVEThKUsEJv9Cxs4STWznsmE7fGW9lAInMupInn9LocWwJzcnqcuJr5AeO3cFmWyp4omjoTXnr05ghLoybbRdodqmJAd+bsQuBEQWT3YIW9/3a/z8bjd897DbKm7ua/C0ll3LZZOPAeECGRgYMGdU2jHQI5SCeWttNOIiUx2IUMZwosHNGkQju/7Ci5V0VDeByix1370MQ7zG6BTJfEwsZHehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jIfgqpBJXznAuNPcYygyHy661gpgmk+lGrtabJ+JwA=;
 b=B9Te/IIXca4/6Vp3eMLETuczeEJi09G5qdbHrefyq2FGB59YLDJPSSnOvfB9X+4a8FE+QOEjZryqxCwJc52E8ZyzXyB9hpY5t+xr8cpNpH2BxmLHV18gkE7g2ZZ2zf4VX799b8n+dKMUD7V3j7paMUH4cn8DGsOrGW3GCB64TzviLUyK+9++PAvTMTQg7wLc388kBFsv806SejovBqgg8jflQuPXi0OGSYS4utVucE6MUcccSoKGh02byOcWfXRgD3NeGTVIsGE+PmPizxLzG8ajPA+0TMUUqI5GVsNkn3BWMdswkGrva9xMcErXp7xozHzLeqioI20ZvIvzHpDmng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by CY5PR12MB6059.namprd12.prod.outlook.com (2603:10b6:930:2c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:22:30 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 04:22:30 +0000
Date: Mon, 10 Aug 2026 12:22:24 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: tony.luck@intel.co, shuah@kernel.org, Dave.Martin@arm.com, 
	james.morse@arm.com, babu.moger@amd.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, fenghuay@nvidia.com, newtonl@nvidia.com, kristinc@nvidia.com, 
	kaihengf@nvidia.com, kobak@nvidia.com, sdonthineni@nvidia.com
Subject: Re: [PATCH 1/3] selftests/resctrl: Add L3_CAT_OCCUP test to verify
 CAT bounds occupancy
Message-ID: <anlRQZSpFfmDyk_Y@MWDK4CY14F>
References: <20260608110641.44457-1-icheng@nvidia.com>
 <20260608110641.44457-2-icheng@nvidia.com>
 <5836583e-baa8-454b-903f-d7364a346165@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5836583e-baa8-454b-903f-d7364a346165@intel.com>
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|CY5PR12MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: 669572e0-1d98-4c76-fa59-08def696fdc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|10067099003|56012099006|4143699003|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ttBxKIbJPCv7CWQVBl3DJ1Ic+rR4FiwgAPLbUvA+cNFp5Fa4bOI2/bfLUc6KGCznhDY7Wnn20qBXwWvLdQtq5MynnG8cjniWLQlSi6FnEFG87VgM2cshhrtnu9FKw6YVveK2+ySHAI7LOXnE06PQK4XdphbUuqHDKwBCfFE3A2fo5TI1s6T2rP792nZ+Y32QUKGvwMizPlLRMuSE/z88YlBKHa0mh/+Q7PTeReYNmp/n6LkmbcBnNnYdW2AVcMIxyuPpCR865wT6AmbhEeNbV2XPT0JCegf3Uih/RACoyKA/UFl22QFgDi7XNAzlMz+rcm1sAl0kVdilx+bF1eu40yxQ+g6h3l9rRYCh9yKLkpVmRc0VxPsfHs61w4xptETj1D2iomjMoCI3XWHHrN8i27dRdKqRELBAumxJZwP+2TpALUjQyBmq51myiiwQx1QbHID7TqX76Bq4OcvwZ3uUCSNouUNEV0Rm6ObF37MzrbCrpxiwd8fFT0MIsc44wN+4HJoKy1CxpS/AbXPttsvzVbzczJjQeSy+m0A4nCKYiWX8IL4YIjN/TSUGhpIuSJ/nFho7fBF0K+RWzUhF2S1yYorFxuezDxv/Ra/N0lyYd2LGU4PrJGpvdQE0ofjk5/aV0GnwcQI18m3ze7GhWX4S+s57L+UjNHpZwMDsBTlDm6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BnG/mhiTz2PgaW6LO9oRGeFHGUv8Kj/vASwBOqnMIYra2YEldxa1W03bXJI4?=
 =?us-ascii?Q?Uo5ux+fGNOn2ESG/lNVev4QHxYkwA6fxf7xezR/htKp+nuqUO0Kvcv5l9wOD?=
 =?us-ascii?Q?PyjLQhpoyxGRSpp+IklNBVbtNMm2fgd6/2VR8zsYLmD19otEUSfER5QjfIK3?=
 =?us-ascii?Q?glwcoBFG3/fioi2mEyuFMZLNdkdeqfGOjARi0peCZdPr2numMN43PYk/0Hl0?=
 =?us-ascii?Q?dyeW+3njdAN/idB2owZw45WS9ceWOZFHOKbZYuEBU4mtyzQBbdU7VHLRCeRY?=
 =?us-ascii?Q?AjKWmsPWT7SEOLFD/ez+CCkr/VTj9VWVseEiyBokSlsE2fizWFuQdcfyaiq0?=
 =?us-ascii?Q?FP2yLJfJ1l5gfqWjA9DlriRl/Yvj69V4GPPaxlGonjP3YT1RfJe+xobZ5dg9?=
 =?us-ascii?Q?g4h3AAD6ur7xQKdaGnUYqY7lqz7EieQOVy2p9tRc4TdMqO5wk6KqcjLkYYTT?=
 =?us-ascii?Q?xtrUOIi6r0c49td915PBm0SnEsZLHMHbuRWxjVVu8A/vAuTLjikV6zHNEepq?=
 =?us-ascii?Q?s+3hQ5R7RUVqtJtEo2dP4pHPJsZAA/V0Bx2Stp699QgTgqkMSb+fgmMGrnoS?=
 =?us-ascii?Q?n7Ifblbo2p9aS1yse+DsgviAshvt2dS0BLIBydNUt88IaH6VgmLp6BH1WLgx?=
 =?us-ascii?Q?kOQ/N5t1YWlfsBPh2ZEqIOVDLRONiVjyWGxLYqs+feFzEFmsrsvAmSJNvP1p?=
 =?us-ascii?Q?ey+oaAXi+Q6MsTab3LmtrYTLgwxvcOKYH+9UVZCayNrBJ67r553cIs7ds06T?=
 =?us-ascii?Q?g46YwxjtTOBNcnsZ1CTP7g7FYmPGSGpF55VuhHuKJT0yOGskNfp7dvuU4GMk?=
 =?us-ascii?Q?rHtysDxPlR+/182iZeZgPpej+yLs4MKOmpG/MCdrcoicbGbA9xui169in350?=
 =?us-ascii?Q?G2lupMewcq8Nw0SkzfCH79H4LAnbbpeGy7YVW2kd2lk9GlI7SJsrcLfS09ZD?=
 =?us-ascii?Q?QPsQKai5UAKIc8F8yuYhNhZusXJsYxsIUz2BPY3ad6/ioB4gM+YF3mYKKRvl?=
 =?us-ascii?Q?o4UJymNWeS+awvtizg030/L3EkGAXL54lcULyzA2Vz4tqypvi0XEup+i1m3x?=
 =?us-ascii?Q?1uj72ME1qjUHP3v4mihuNRIdCL5/EtGgdY6Y9rIPiNiMDV8/5pbQ8vUVza/r?=
 =?us-ascii?Q?p/XHiVH1DWvX9HWBHF+tqC1iYtGaZzoGirx4upksWaiD/K7OxQB3i1lid9XW?=
 =?us-ascii?Q?mEwSUbEokJnj2ydpX1UBfY3fQIDQP8xrMTQdHU68rfzlfbFPTtYgxOGl2ax9?=
 =?us-ascii?Q?XM2qYaRkAdTaBVZxnLEUb9munN4vVyC5Bx6VhPxouMJvAkkaMRg63syf3yat?=
 =?us-ascii?Q?xT8adoUN5kqsSJMf0eLYLn9s01zDZxKVjQTj2LuYH5mK3vckjaMhVkASAPfn?=
 =?us-ascii?Q?K6W5IOJZnyB/pP+TVlde1K7ew+oPTSzfAMgLAqPfYbjQ1YKBUPLVZEMWq6Tl?=
 =?us-ascii?Q?6o7Qv2EhyTrQirirh2sEBKhcranKoMr33ewrz8OJ1f58nuEv9ke9X8brjBug?=
 =?us-ascii?Q?9lrVifwur2B3uh4mz5Nxa11+m4aQULAyAShBKrgKo4FDvfTEH8rV4mV1GFNQ?=
 =?us-ascii?Q?DNMXr8E3e5V/SPLdilEeqwfIrJ+tbyimzXqpzUrRLjmsrE15pAWUamyHmsQM?=
 =?us-ascii?Q?3LWPvq13QnkkOqF3eJtZEWBBTJajacFybiJaZDXkxbKH10jGCAucWr9cg0I8?=
 =?us-ascii?Q?AHGqWkRYsZwWp0l4mv5IqsYhnO2cczMm5NIlfUiX2vzmdu+D/TNhU8o4bt1R?=
 =?us-ascii?Q?cuasG4Gmzg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669572e0-1d98-4c76-fa59-08def696fdc8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:22:30.1384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itbQSh2o1wGf3KKJ45FWQisLaFZmoP4eXE/2rAYzO+C7NkF8Lzb+w7UJ2CsfRCOav9WP0+mv9KPA91pp5ukHDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6059

On Wed, Aug 05, 2026 at 03:18:40PM +0800, Reinette Chatre wrote:
> Hi Richard,
>

Hi Reinette,

Thanks for the review !
 
> On 6/8/26 4:06 AM, Richard Cheng wrote:
> > L3_CAT needs a CPU-exclusive cache portion, so it's skipped when MPAM
> > reports every CBM bit as shareable, leaving L3 allocation untested. CMT
> > only checks occupancy accuracy, not that a CBM actually limits it.
> 
> hmmm ... CMT test ensures that the LLC occupancy is within a % of the size
> of the cache allocation. To me this implies that it indeed tests that
> the CBM limits the allocation, no?
> 

Yes you're correct on this. I based the patch on older version of the CMT test.
After rebasing, I see the current CMT already uses a workload larger than the allocation
and configures the root group with the complementary CBM.

It now covers what I wanted to test.

I think we're good to drop this patch in v2.


> > 
> > L3_CAT_OCCUP gives a group a small CBM, run a workload spanning the
> > whole cache, and check every occupancy sample stays within the
> > allocation. An unenforced CBM would instead let occupancy grow to the
> > full cache.
> > 
> > Move CON_MON_LCC_OCCUP_PATH to resctrl.h to share it with CMT.
> > 
> > Signed-off-by: Richard Cheng <icheng@nvidia.com>
> > ---
> >  tools/testing/selftests/resctrl/cat_test.c    | 201 ++++++++++++++++++
> >  tools/testing/selftests/resctrl/cmt_test.c    |   3 -
> >  tools/testing/selftests/resctrl/resctrl.h     |   4 +
> >  .../testing/selftests/resctrl/resctrl_tests.c |   1 +
> >  4 files changed, 206 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> > index f00b622c1460..16a947f1ed16 100644
> > --- a/tools/testing/selftests/resctrl/cat_test.c
> > +++ b/tools/testing/selftests/resctrl/cat_test.c
> > @@ -402,3 +402,204 @@ struct resctrl_test l2_noncont_cat_test = {
> >  	.feature_check = noncont_cat_feature_check,
> >  	.run_test = noncont_cat_run_test,
> >  };
> > +
> > +/*
> > + * L3_CAT_OCCUP - Verify that a CAT allocation bounds cache occupancy.
> > + *
> > + * Unlike L3_CAT (which measures interference between groups and needs an
> > + * exclusive cache portion), this test gives a control group a strict subset
> 
> Please let comment just refer to what this test does. These comments are unlikely
> to be updated if L3_CAT ever changes.
> 
> > + * of the CBM, then runs a benchmark whose buffer spans the *whole* cache -
> > + * i.e. much larger than the allocation. With CAT enforced, the group can
> > + * only keep its allocated portion resident, so llc_occupancy settles near
> > + * the allocation size. Without enforcement occupancy would instead climb
> > + * towards the full cache. This works even when all CBM bits are shareable
> > + * (where L3_CAT is skipped).
> 
> hmmm ... these statements state as fact what really depends on system load and
> interference that this test make no attempt to avoid.
> 
> > + */
> > +#define CAT_OCCUP_RESULT_FILE		"result_cat_occup"
> > +#define CAT_OCCUP_NUM_OF_RUNS		5
> > +
> > +static int cat_occup_cpu;
> > +
> > +static int cat_occup_init(const struct resctrl_val_param *param, int domain_id)
> 
> Please take a look at recent resctrl selftest changes that provides more
> data to the init() that will avoid the cat_occup_cpu global.
> Even so, why not just use cmt_init() that reduces interference from rest of
> system to improve chances of workload's cache occupancy to match its
> cache allocation?
> 
> > +{
> > +	char schemata[64];
> > +
> > +	sprintf(llc_occup_path, CON_MON_LCC_OCCUP_PATH, RESCTRL_PATH,
> > +		param->ctrlgrp, domain_id);
> > +
> > +	/*
> > +	 * Confine the benchmark to the allocated portion *before* it starts
> > +	 * filling (resctrl_val() calls init() before forking the benchmark),
> > +	 * so occupancy reflects the restricted CBM from the first sample.
> > +	 */
> > +	snprintf(schemata, sizeof(schemata), "%lx", param->mask);
> > +
> > +	return write_schemata(param->ctrlgrp, schemata, cat_occup_cpu, "L3");
> > +}
> > +
> > +static int cat_occup_setup(const struct resctrl_test *test,
> > +			   const struct user_params *uparams,
> > +			   struct resctrl_val_param *p)
> > +{
> > +	if (p->num_of_runs >= CAT_OCCUP_NUM_OF_RUNS)
> > +		return END_OF_TESTS;
> > +
> > +	p->num_of_runs++;
> > +
> > +	return 0;
> > +}
> 
> cmt_setup()?
> 
> > +
> > +static int cat_occup_measure(const struct user_params *uparams,
> > +			     struct resctrl_val_param *param, pid_t bm_pid)
> > +{
> > +	sleep(1);
> > +	return measure_llc_resctrl(param->filename, bm_pid);
> > +}
> 
> 
> cmt_measure()?
> 
> This test has a lot in common with the existing CMT test since it 
> duplicates cmt_setup(), cmt_measure(), and cmt_feature_check(). From what I 
> can tell it can use cmt_init() also. Could the implementation be simplified
> by instead considering it a CMT test, move code to cmt_test.c, and avoid
> all this duplication?
> 
> > +
> > +static int cat_occup_check_results(struct resctrl_val_param *param,
> > +				   size_t alloc_span, size_t cache_size,
> > +				   int no_of_bits)
> > +{
> > +	char *token_array[8], temp[512];
> > +	unsigned long occu, max_occu = 0, ceiling, floor;
> 
> Please follow kernel coding style (throughout this series) by, in this example,
> using reverse-fir tree ordering.
> 
> > +	int runs = 0;
> > +	int fail = 0;
> > +	FILE *fp;
> > +
> > +	/*
> > +	 * Check every sample, not an average: CAT is a hard limit, so a single
> 
> hmmm ... "is a hard limit" does not match what the code does
> 
> > +	 * sample above the allocation is a real violation that an average
> > +	 * could mask.
> > +	 */
> > +	ceiling = alloc_span + (cache_size - alloc_span) / 2;
> > +	floor = alloc_span / 2;
> > +
> > +	ksft_print_msg("Checking for pass/fail\n");
> > +	fp = fopen(param->filename, "r");
> > +	if (!fp) {
> > +		ksft_perror("Error in opening file");
> > +
> > +		return -1;
> > +	}
> > +
> > +	while (fgets(temp, sizeof(temp), fp)) {
> > +		char *token = strtok(temp, ":\t");
> > +		int fields = 0;
> > +
> > +		while (token) {
> > +			token_array[fields++] = token;
> > +			token = strtok(NULL, ":\t");
> > +		}
> > +
> > +		/* Field 3 is the resctrl-reported llc_occupancy value. */
> > +		occu = strtoul(token_array[3], NULL, 0);
> > +		runs++;
> > +
> > +		if (occu > max_occu)
> > +			max_occu = occu;
> > +
> > +		if (occu > ceiling) {
> > +			ksft_print_msg("Fail: run %d occupancy %lu exceeds ceiling %lu\n",
> > +				       runs, occu, ceiling);
> > +			fail = 1;
> 
> KSFT_FAIL is available to avoid using magic numbers.
> 
> > +		}
> > +	}
> > +	fclose(fp);
> > +
> > +	if (!runs) {
> > +		ksft_print_msg("No occupancy samples collected\n");
> > +		return -1;
> > +	}
> > +
> > +	if (max_occu < floor) {
> > +		ksft_print_msg("Fail: peak occupancy %lu never reached floor %lu\n",
> > +			       max_occu, floor);
> 
> I think this test should be dropped. We cannot control the environments in which
> the tests are run and legitimate interference may cause this test to fail without
> it meaning that there is a bug in resctrl. 
> 
> 
> > +		fail = 1;
> > +	}
> > +
> > +	ksft_print_msg("%s CAT confines occupancy to the allocated %d-bit portion\n",
> > +		       fail ? "Fail:" : "Pass:", no_of_bits);
> > +	ksft_print_msg("occupancy=%lu alloc=%zu full=%zu ceiling=%lu floor=%lu\n",
> > +		       max_occu, alloc_span, cache_size, ceiling, floor);
> > +
> > +	return fail;
> > +}
> > +
> > +static void cat_occup_test_cleanup(void)
> > +{
> > +	remove(CAT_OCCUP_RESULT_FILE);
> > +}
> > +
> > +static int cat_occup_run_test(const struct resctrl_test *test,
> > +			      const struct user_params *uparams)
> > +{
> > +	struct fill_buf_param fill_buf = {};
> > +	unsigned long cache_total_size = 0;
> > +	unsigned long full_mask;
> > +	int count_of_bits;
> > +	size_t alloc_span;
> > +	int n, ret;
> > +
> > +	ret = get_full_cbm(test->resource, &full_mask);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = get_cache_size(uparams->cpu, test->resource, &cache_total_size);
> > +	if (ret)
> > +		return ret;
> > +	ksft_print_msg("Cache size :%lu\n", cache_total_size);
> > +
> > +	count_of_bits = count_bits(full_mask);
> > +
> > +	/*
> > +	 * Allocate a strict subset of the cache so the benchmark buffer
> > +	 * is larger than the allocation and CAT has something to enforce.
> > +	 */
> > +	n = uparams->bits ? : count_of_bits / 2;
> > +	if (n < 1 || n >= count_of_bits) {
> > +		ksft_print_msg("Invalid number of CBM bits %d, expected 1 to %d\n",
> > +			       n, count_of_bits - 1);
> > +		return -1;
> > +	}
> > +
> > +	struct resctrl_val_param param = {
> > +		.ctrlgrp	= "c1",
> > +		.filename	= CAT_OCCUP_RESULT_FILE,
> > +		.mask		= ~(full_mask << n) & full_mask,
> > +		.num_of_runs	= 0,
> > +		.init		= cat_occup_init,
> > +		.setup		= cat_occup_setup,
> > +		.measure	= cat_occup_measure,
> > +	};
> > +
> > +	alloc_span = cache_portion_size(cache_total_size, param.mask, full_mask);
> > +
> > +	/* Benchmark buffer spans the full cache: larger than the allocation. */
> > +	fill_buf.buf_size = cache_total_size;
> > +	fill_buf.memflush = uparams->fill_buf ? uparams->fill_buf->memflush : true;
> > +	param.fill_buf = &fill_buf;
> 
> This prevents usage of user provided benchmark. Please compare with cmt_run_test()
> initialization. You can find more details about how the workload and parameters are
> communicated in e958c21e2ede ("selftests/resctrl: Make benchmark parameter passing robust")
> 
> > +	cat_occup_cpu = uparams->cpu;
> > +
> > +	remove(param.filename);
> > +
> > +	ret = resctrl_val(test, uparams, &param);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return cat_occup_check_results(&param, alloc_span, cache_total_size, n);
> > +}
> 
> Fundamentally this looks like a duplicate of cmt_run_test()? Only differences I see
> is the size of the buffer and how the test results are checked for pass/fail. Looking
> at the pass/fail I do not see a big difference with what the CMT test tests. I do not
> see what value this tests add beyond what the CMT test already provides.
> 
> 
> > +
> > +static bool cat_occup_feature_check(const struct resctrl_test *test)
> > +{
> > +	return test_resource_feature_check(test) &&
> > +	       resctrl_mon_feature_exists("L3_MON", "llc_occupancy");
> > +}
> > +
> > +struct resctrl_test l3_cat_occup_test = {
> > +	.name = "L3_CAT_OCCUP",
> > +	.group = "CAT",
> > +	.resource = "L3",
> > +	.feature_check = cat_occup_feature_check,
> > +	.run_test = cat_occup_run_test,
> > +	.cleanup = cat_occup_test_cleanup,
> > +};
> > diff --git a/tools/testing/selftests/resctrl/cmt_test.c b/tools/testing/selftests/resctrl/cmt_test.c
> > index d09e693dc739..ef51daa8061a 100644
> > --- a/tools/testing/selftests/resctrl/cmt_test.c
> > +++ b/tools/testing/selftests/resctrl/cmt_test.c
> > @@ -16,9 +16,6 @@
> >  #define MAX_DIFF		2000000
> >  #define MAX_DIFF_PERCENT	15
> >  
> > -#define CON_MON_LCC_OCCUP_PATH		\
> > -	"%s/%s/mon_data/mon_L3_%02d/llc_occupancy"
> > -
> >  static int cmt_init(const struct resctrl_val_param *param, int domain_id)
> >  {
> >  	sprintf(llc_occup_path, CON_MON_LCC_OCCUP_PATH, RESCTRL_PATH,
> > diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> > index afe635b6e48d..ce3abf0bdac2 100644
> > --- a/tools/testing/selftests/resctrl/resctrl.h
> > +++ b/tools/testing/selftests/resctrl/resctrl.h
> > @@ -31,6 +31,9 @@
> >  #define PHYS_ID_PATH		"/sys/devices/system/cpu/cpu"
> >  #define INFO_PATH		"/sys/fs/resctrl/info"
> >  
> > +#define CON_MON_LCC_OCCUP_PATH		\
> > +	"%s/%s/mon_data/mon_L3_%02d/llc_occupancy"
> > +
> >  /*
> >   * CPU vendor IDs
> >   *
> > @@ -244,6 +247,7 @@ extern struct resctrl_test mbm_test;
> >  extern struct resctrl_test mba_test;
> >  extern struct resctrl_test cmt_test;
> >  extern struct resctrl_test l3_cat_test;
> > +extern struct resctrl_test l3_cat_occup_test;
> >  extern struct resctrl_test l3_noncont_cat_test;
> >  extern struct resctrl_test l2_noncont_cat_test;
> >  
> > diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> > index dbcd5eea9fbc..324a60818aa1 100644
> > --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> > +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> > @@ -19,6 +19,7 @@ static struct resctrl_test *resctrl_tests[] = {
> >  	&mba_test,
> >  	&cmt_test,
> >  	&l3_cat_test,
> > +	&l3_cat_occup_test,
> >  	&l3_noncont_cat_test,
> >  	&l2_noncont_cat_test,
> >  };
> 
> Reinette

Agreed for the above comments, I'll drop this change for v2.
Thanks for pointing this out.

Best regards,
Richard Cheng.


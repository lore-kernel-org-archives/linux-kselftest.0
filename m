Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010045.outbound.protection.outlook.com [52.101.193.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA785446C00;
	Tue, 18 Aug 2026 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051027; cv=fail; b=a1CdjjpYStgrc8kTZfYvooh8Mb/1ZugB19iDkiPWRqq4i2db7geZq1MBT7o6Eg/XoZ7nNO5FMe3qzouS3/hNy7Ym6PQlCo+2F7dBREwLds/ZFcxgeixw2LIatvJv6yBtRFrRwOn8u5dCHrhhIIErdE3gtmKugk67bRojteah+Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051027; c=relaxed/simple;
	bh=yfz3KiUL+5Vih7iRjzGJTJhi9+0m73dwa8seyEetjoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jsqu5dL4A2IIrYbJwTNPSJ3lS09QSvNzFBaYA28Ta013jsnU4tnlgLE04II0KoSUlN0OxhdzkBzXsBw6A9ADcf31KB1KqpNYpfN2fR0LDcjEb6DjRzdPVyIUup9vJTuyHC7NrYOXyAt0ojXRTXLISAkhIPCfuGAbSsKloffeqaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HgZKNchL; arc=fail smtp.client-ip=52.101.193.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HgZKNchL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+eEoFeYclexE4K3zCfogTSeLkK+3A0UedeVOC7Ll/JfO8ihWPTx6TR7JrVef9hlVNa9TwYNTNaw2+PnIooFHNPphgzvhe/msndTWEq8u1BkwDxqnbUUvmXKbKZf6ZA2pPBlLnjMwiGmPzm6cP49/c1Bjbgmc4JdmOHgfJoILMiUYyPLP8m7LgiYL8/BYrnRXI9TM8ubwdLTvB9H/BM7ILJOzo8iCBhQrub5lkdC6twBRON5B1bLx05526u5+8WZe/qURqbRryVBRwuml5ObmoZQ/zpUjKJRjmrB2HFTGA3X6fnJfDf3t25NL6oPQ8ZLy9bFG5NepiSOhhnJgLeydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ2z1GnAbWIiYqp0kBpNL1wRrr5E8lINHxCt7CZ1SAE=;
 b=tk0cRUIXzU6nBjwz/Xmr2ZTVB/9x13MgNRJvnak/le/J/oj/vI7ySQ0339WEqWHyHs5XLDkbCWWhuEpDhDced3mOmAYyTWXWTlfI4dtRzBr5rqguMH3tZVwivHlJoC35IjnFP99+Uo0QZFVQDOvLqdVRiV3wrV2fTMb+b55bHqvu+aaSPPFsJrZ/KuNabUEcVvOeNumOgwID8EBLC4NOj/97WHkkTIAsbFc3zMXjQYd4T+Shc+FTShaw/330i8cbWaM5b35U8HNfyuocc0d6S9nZNAHyNLuiED6SSKr5AWTvr6DMHwmaTkVUtdC1zK9SPatUpSdZQ17sRJuerxGqIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ2z1GnAbWIiYqp0kBpNL1wRrr5E8lINHxCt7CZ1SAE=;
 b=HgZKNchL3btxFMAGryJBMVo1dvcHUFEBTkLBZhcfbKan6h1Scpw0T9yzMuXQMtT2WBwsyI6SvwOYlh+SZJTBNYbcsIAGnaPRo0PTpCOQj8X8KPNh4JK71imzs8Yi+xDdZhBc7OvCjsaZkTIeLmCFrmVfOdgJn6baJCJyR2xAmXdrtgDzZ5X48rmBFCU5FwLe+7rpcl6ahzo9bSv/MGmxa4qgAbGCBu64F+vNII9PxvX09IzEt6Df7qDbe8TdQIgDxnWsu/SKNlKM1chZRh4HBFQ9TUyoHcSmLVH16HrpV1dOL6FSIWlbz1/ZoBTL/0pilv2l4uJUzJ/WWAcY0De5kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by IA0PR12MB8325.namprd12.prod.outlook.com (2603:10b6:208:407::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 11:03:42 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0315.014; Tue, 18 Aug 2026
 11:03:42 +0000
Date: Tue, 18 Aug 2026 19:03:37 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: tony.luck@intel.com, x86@kernel.org, Dave.Martin@arm.com, 
	james.morse@arm.com, babu.moger@amd.com, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, newtonl@nvidia.com, 
	kristinc@nvidia.com, kobak@nvidia.com, kaihengf@nvidia.com, fenghuay@nvidia.com, 
	ltrager@nvidia.com
Subject: Re: [PATCH 0/4] selftests/resctrl: MBA schemata ABI selftests for
 MPAM platforms
Message-ID: <aoQ75dI9W214sOEe@MWDK4CY14F>
References: <20260722021057.9370-1-icheng@nvidia.com>
 <b2928db3-76b1-4556-b0fd-8278154ddf2e@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2928db3-76b1-4556-b0fd-8278154ddf2e@intel.com>
X-ClientProxiedBy: TP0P295CA0040.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::13) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|IA0PR12MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: 19df13c0-046b-40f6-0159-08defd185d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	HQzYE4Gr6jkR8FLu++sGM1sZMNGskyfhPAxY7NvsAoJwjIDEO7McV/iI5W+LPO3X5Er2ajGU7F4jLVDvzV265GF8ZTedbzons2I0eIeoDhS1FgtjivqwHaeVuuXGXITM2XdxXJj3QX8AOzr/20SiFDanWx/tV31Xn+/mNw+6hjvs1LycZd/BiOlCLI4y3yB8dJf+FQ64FWa+//8p42GgtvhHqoVrqUdK0s+Kq94FJnkWMP+P6LTBUrwEgZVyHnVosZSP3rKnyva9BRJRSeYydz8fPPqiyBwdQohZBi24O/qePVG68u8UDDSAvh36U4qq0Jgcaf/VkDa0wgwblrBcTGFKAn/QyjQJllMeKUzx6WlTEDRkV4lqgVCwSoFt9ul680NU5o9723TrmW/T0aQEym/+sLhFNIVLqft2ewmKNfH0XIMgyS8zpTzKo2x68ncMJC7783fej+QlxDvFAXeOyR9tyvlNnuSFygpuEnM2uWaoj0ILEIW2vEyk/661JG9kC4g93w1gZNuBB2PWZ8PJib6AQqAUzK4tev8vO2Rc/FEuifXqZPL32jWUWv2onVW6p3wNlBx5WTPkLXjMi015mfghNDtJcun7ZcigPZIua4ZE4mHoXGex2SKP1M7iEjc5boQMIKwBJ3MCtHGKk/RqUY9zovYu1dfxfXKSXTaOIKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Shpol3dLHmneRdkzYNy3j+yBIJUCqL3It0X48dFODR4iKRU6HarFl4KYwkR3?=
 =?us-ascii?Q?byMfZaQxrs6AmO3hxul5AWw0QbNCPqSjEHOO6ks1vT6vs6idwv15eoXV7SIS?=
 =?us-ascii?Q?FsqKfM/+qyKFr6sCdDa3KpQiXILxi+K4egPOmf1rheaoCmcoWQpwSosT6tim?=
 =?us-ascii?Q?MKBjMtC4XmBh2cxJffjPWSZd/Lqp7PZrD/Ol6zTuAHJ3N1amqAfQO08I593z?=
 =?us-ascii?Q?q+KG0MfSn9qMHs4ZIhoLIYsdNo137FGKDjht/sXnF60iyoD0ktf0Jb2hHq4a?=
 =?us-ascii?Q?HfI0f71sFiGOoSMh7+5Yk3wv9VWlgKrLh1kResC6f35nhipMdXFFmTy7UhIl?=
 =?us-ascii?Q?dpy2ym/N+59Y22mIhUHB65CksHlLO8bDVou9OvM9aQlNAJEuIDemnUtyoKHt?=
 =?us-ascii?Q?XLMsGmV7qLZ7+QONioRaDtO+bGJ47xsYM8k+tgf5FKQ8yYKFLEFLAnV8lVhF?=
 =?us-ascii?Q?mPER/iXvjbFNnwjysnoHO9R/lh7Gl2moaGB1Qp8RIR8zEH2QEoVdqlxuucJb?=
 =?us-ascii?Q?6zLxBKyXK8jN48VVcrebtaQIGSxvsZJSniBDuU47iEBvMH6aD2XyUU5Pqr7V?=
 =?us-ascii?Q?B0XVxMSmgczFahvty7nIkL8hris2Al8LAYnVGqUOx86/ftOt8FUz8c6CmPNy?=
 =?us-ascii?Q?vgCimLG4BAD+6zxERqQtFdF/ouuwswqmiE1awXWVcdIP4Om/PdPDwzCyGZTT?=
 =?us-ascii?Q?q9gx8/4btExklaCLhlEyFDAGnL6mYrg3CFnrp3A5uwfc1o2k7iNVQh/TzASv?=
 =?us-ascii?Q?2oC+cDSBq6q23BcGD/CrhNVpthI6Y7efhwBca8lNzWPrseYwzqDY2DiL8GU8?=
 =?us-ascii?Q?agg2aqGUKigwmlbmIW4aYR4l9Bsy7Az7v91yKxsDRAOnUiAlT+l8cgZXNVC6?=
 =?us-ascii?Q?a7CXWW1SrXy6z5MtaZQ2wj0zAK+3xluHFHPv3lgMni0+FBYyR2VxQLEkEFt3?=
 =?us-ascii?Q?UnadBDcDX+L+mM9ztsZCawtaSwHWmQsaScVMmRuaz2s/wZJAG/hk6112A8vW?=
 =?us-ascii?Q?0XiJQBxYEPvnEKK2bDv8JkE0A0ME/cbayUD83mBoJgz6027qhiwXxu76fiG+?=
 =?us-ascii?Q?GKZcUwvjUhlp9ddKoc5IgDNimQ5N0AmBwqP5GAGeVrvSI0xSp+ccV3XtdSga?=
 =?us-ascii?Q?sGv2B/f9Lh2A768tMbFph72zCD9p5w3ucPTLyf3WrC98/SvXJ0eTcct3t930?=
 =?us-ascii?Q?+CVorYVEjLgL5dQy0eGSvAWKDg/ocGqQtOoagwInm6s9IopVAqVLgqJreIp6?=
 =?us-ascii?Q?ZvFEPjv9ibZi9g7B9xZ9ANDeQRNjc+a/910eT07d6Lhz3GQFzXJkx1CstA63?=
 =?us-ascii?Q?Vv4YaF1LQJgyRhfpxfaydsLbVa6dOUU08HOkYvffQEl5qdgLviUCG5URhgo6?=
 =?us-ascii?Q?cxGMktmiuVD80Sn8IdrK9MfH9Iwf/yO+PMCt9F60yQELmP4mV37zroIjneZ7?=
 =?us-ascii?Q?+YNpCafuePvwwYmXwwdn25gIUIcR0O7lHROo+dtvWRUsVWYg+5JhMz+LAr/c?=
 =?us-ascii?Q?Vw2OBgxMv/mAgIuIQSWcBRt7kHOqXCWvUD0k5ySz1iDwHwsjQQr+rZqzbvHw?=
 =?us-ascii?Q?vgpvY8O+uAFdmMHW46LzeffITasp7fQJA0p/9cwiO6czGD4atsZsKXQ6uHXy?=
 =?us-ascii?Q?0Jmhu7+G9bAknzLhDbtjm8uw4shKKVAYsQJ1kxuEmGclYonWhd2N77/Q4ZP7?=
 =?us-ascii?Q?Gt7dm472esDaMQ8ljSv/xGl/dLFUsnNauaQdVxeijtx7p6Ao6uznnJ2LJPI3?=
 =?us-ascii?Q?5Ax4R87/tw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19df13c0-046b-40f6-0159-08defd185d0f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:03:42.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moGcoITyi7eE4tFFjLWv0YbDJU1NaOZN9y9WjLKJnAy4XCHJcAcx0INVOJ2peuT6CJF01ptG7uV/g2U07uB1fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8325

On Wed, Aug 12, 2026 at 10:58:07AM +0800, Reinette Chatre wrote:
> Hi Richard,
> 
> On 7/21/26 7:10 PM, Richard Cheng wrote:
> > The MPAM MBA enablement carried in this tree exposes memory-bandwidth
> 
> "this tree"?
> 
> > allocation through the resctrl "MB" schemata, but none of it is covered
> > by the in-tree resctrl selftests: the existing mba_test/mbm_test are
> 
> ...
> 
> > The tests are written upstream-shaped for eventual submission.
> 
> "eventual" hints that this submission was not intended?
> 
> > 
> > This series applies on top of the 26.04_linux-nvidia.glue.others.
> > cpu_less.hardlimit branch of
> > https://github.com/fyu1/NV-Kernels.fenghuay.baseos
> "this tree" referred to by first sentence?
> 
> I peeked at the first test and it seems to rely on features that do not
> exist in upstream resctrl, for example an info file named "schema_format".
> 
> Considering all this I do not see this as a valid upstream submission.
> 
> These tests do seem useful though. When they are ready, please submit
> against "next" branch of
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
> 
> Thank you.
> 
> Reinette
>

Sorry about that, please ignore this for now, I'll redraft later.

Best regards,
Richard Cheng.
 
> 
> 

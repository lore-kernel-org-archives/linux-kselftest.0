Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648364C956D;
	Thu,  3 Sep 2026 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450468; cv=fail; b=Ev6jzltrXXrUkYXQ5Z6ndp0T+eC46kwaKk2y/bBTCDGoR9DO0ajt2bH4w9e+4/NeVBfLjWjRl5hcEF256SpON7POwNS5mX/v44wooCMIpYQDJibGeUYjEo7BlTwiw004b9dN6d7ehut8zOZEY/kOCLOLEswJbp/+vr8cQPCXFeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450468; c=relaxed/simple;
	bh=xLWMyhDTH181PgttHPh/PGa8eZeQVy26s4Ukz+sFbP4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c9RUczTywOyDJ6aez+OESr57r36f4ax5gBqAo7ybvd2KZgZdg8q/k5+QX6vR6muQLd4p2tlSKjRVwm+Kp4BjUpUGY672xuhvm4KicSx+PzJuf5Kdd9dDataKVy3BG3WBNOtmrwQcXdUqmxirmxLDD4bersaBZl1OU4B2iexh8dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehcz9PbG; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehcz9PbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788450467; x=1819986467;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xLWMyhDTH181PgttHPh/PGa8eZeQVy26s4Ukz+sFbP4=;
  b=ehcz9PbG4a51EC3ZMtEftWmhivnBaTb3WhfRbylUo0wqQdF98m0qHoDD
   y5bEVjpYe4VRYsk1N8X7vBwWmKXOj42PLwBsJdhAk3sXzlZZDCvhpReil
   OYlFci8eM4JCPVsrAOkimRpAs92Ewi009SQ1PPiuT0T9188fNlb7grzWf
   38cu+b1FqVh6hH5UM4uk0NGBxbxD6PSyJgwyDlh59aVz1KNIkoirjhW54
   37USO3ejcHZ7uYBy3cVnxzUBFq3WP73ACdYY5P0m0oAHJzGEzNkCipik3
   vOmpkVOLS8d0+Zax3L8wjjPrud32tFoAxc6Ls/PlwHIP0smzZQtY8PBJV
   g==;
X-CSE-ConnectionGUID: b+LiVj2fTRedVpQddpVxvw==
X-CSE-MsgGUID: whG5/hQHRY297Yk04wc74Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88971178"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88971178"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:47:46 -0700
X-CSE-ConnectionGUID: WXHKy+DQQUCjZxI90bU82g==
X-CSE-MsgGUID: u48lezWMSiCu80G9XFgdQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="266524425"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:47:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 08:47:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 08:47:45 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 08:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8cQw8qnGnxLyfvtDDnjnKgciPmyEuLFc/SatA1S5LGZEmE8tKayKdrzVgpWq1JeO0ennGhhdJIcfi90XZ6vSWoV+dtlTuf4KNJKhpwl/ckdZQyE9tp/Md0Ev+IcdvwNwGtq4xtynsTBPDsSba7fNijDp59gHV0WBh6ogQ3bl7+CDVWR1eieCtGhZCFt/8s3DdBy/TsCQCpZaqf4bh2jT2uZU8kgp+jnQarG8CH7+MctqQ82vdaYvtmNeEzL2kfPrx2kczfwShWHG0gQkI2ktV3Px9kLleMXei4cJECRDi7zSstnssuaU6nTMjBYiTjMAu7x2CzbLy2GkbMnHoCK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLbT9JDRMmlEOm4sNh/qdrnd3NYCuEr/2yM+QKemCZE=;
 b=CY13jl2ewho+zLckaHE+gT0Du2FzcuIRknjvHxva3WdTd2Ck1oFc7s5AwI3Oybh386RmvToY0kWNxNBv0oUhUDF4NGNYWNJFvP02PTzTnUynh0RstEODNcTtgsYHw9PraQv7OZL4pPhmx7nco4s4pzNS5iAaRTgJawgwrZS5NztConPHMjxTRezXembEfJlVWNKS5Q0zwwmb1/aGdwJNnI4e2g/D57kGGrTZgKqzIvSNlVlZIrGIJ5X0SsPQSU3MB8IScFWbFhvCWiwiNgiVgry9QyZ13KIY0b8kYo6DNnHBGugaBFPg3mk4Q9f0wlJ5okbdQS1kFRsVjuHbfwk//w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:47:42 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 15:47:42 +0000
Message-ID: <53fadc0d-a8f6-4ce2-9a96-ec6ca149ccc6@intel.com>
Date: Thu, 3 Sep 2026 08:47:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] selftests/resctrl: Skip L3_CAT when no exclusive cache
 portion exists
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.com>,
	<x86@kernel.org>, <fenghuay@nvidia.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<newtonl@nvidia.com>, <kristinc@nvidia.com>, <kobak@nvidia.com>,
	<kaihengf@nvidia.com>, <ltrager@nvidia.com>, <yu.c.chen@intel.com>,
	<ilpo.jarvinen@linux.intel.com>
References: <20260821003908.12977-1-icheng@nvidia.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260821003908.12977-1-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0109.namprd04.prod.outlook.com
 (2603:10b6:303:83::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ0PR11MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: bc65315f-e42c-4133-adbc-08df09d2b06d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gBYER8MEpTZvlc2vs+Ln4ScCGu+YlX78PkJjOkTu+93UvTB695gl5lILHx3bewbC7Ka4LU9VxpVSLZM6UtFqKhkcyotYOKKMkiPCMxYlBsx/L8nZ+EQGlz3Y5uwng6l7U5H0PCRMWhgwm6Qu8yemN+0GeZjLss7GxO7cPnTeggpEsMUarFl3JwoyvEHIfcDSo6vBrxJhOmRRfSLjgukp9jhLMv+QpyVl6EgKT9cqIgE561obXwn6MMEgULmMzMd3op//NKnmtkFVHLsecl3efIAd0fB6bnPUzRFJiBv+3L0clXxXqBYDvYlMcNmRvmrmYVTCmKXlfA6I88xQdF+4nbfi6P1idGytfuv9hPEAAXbWyFS6LAsgXyisGD0/403GNwE9Hrk9801tIRuzIGq8aVmMcyYzUOusR6N5w3F1/jUGQLDJEinHc9g/W9JV1rJtbiKcea8jrNrfi/DiqmUYppXe8QDoBRiQKrK3dzIa0ElTMYl4bZFbr7Jwvhdr6Tih4xrIj1A/zBwsh0lJNKJFqjvovAymygJ7bQGb1Ge+qq0luMgGxbRIMBZt2VdUPRcrbXeSXRLBtJY75yFVz8fO60Dbswhibsi6b4NXQBNBFJwDKzikCBHLWgovXvVYSSbyW1dLxzKFKh5fT0rlZb2R8BBPydew4WQtjuS+TtOBHtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFdSRkIzaGdLRnZhbllRUmZRWlBuQ1hyZnhkb2pmQjFvT0ZYU1p6U2VtRHp1?=
 =?utf-8?B?V1RvdnJJa1drdlZERFhML040bkZrSFd0eFVZM05PYnI2eTRLVWFIOGtNZ2VX?=
 =?utf-8?B?ZVI1SWNHZjFXRkgrSlFEQzB2c1hpVmJUVlFrWE1CV3RoUDNMWk5DQmdIbFZT?=
 =?utf-8?B?YW9VVVN4a1VSbjk3SVlZMmpCdUxuQXJxREorOGkxcG5TdkRhd21JV080VnV6?=
 =?utf-8?B?bXRIcko2eDYzRCsxVHJDMFRNVHhDaW1iSWd5QW5laEgwb0tZcFR1Ym02ZXll?=
 =?utf-8?B?aHBRZlNkbHFDb29kdkdySDdkTnNrR0xubUQvTUNqOHE4cG5oSWJzNmVQTVZQ?=
 =?utf-8?B?NFdJQVdzNHFhdVpjakVpUEgxK2pidHVKdHhpdGdBYXB6emkxNEtmZVQyTkls?=
 =?utf-8?B?YndKdnUrQzM0bWU4Vjh2a0VZY1RQR04vai90cUc2Q1Vac3JwdjZEYmxaeWVQ?=
 =?utf-8?B?MkZ6M2tCSTNCVmp6Tk9FY2lQeWF5Mll3bXBMbmVGVnJIOW9QVUdOcDU3RVJ5?=
 =?utf-8?B?cStpM3F6clVQVGtITy9MMUFxb2l3MG5xVEptc1VQbUhPR0VqM2VHc0V5L3JK?=
 =?utf-8?B?RkVzc0lmaXJrOElZKzN0MTIyZmM4dk5BNy81SUNaSkhQZlF6Zi8yUkxsTVli?=
 =?utf-8?B?czR3NW42R20zUVRGa0JQanhEWEZHZjdPeTdReVFLdVNFcG5ic2xEY0dSMFRM?=
 =?utf-8?B?a1FkY21UUFpBaWNTcTc0bXIwNlhYRGZsNzByMjUzNFcxZXg5NUxacnJuNkhH?=
 =?utf-8?B?aVBwNnE5S3gwZlNmZ2tTMDgrRGRsVy9DbEd3ZkkyWVpJSm1ldWIvSW1Bam1S?=
 =?utf-8?B?cFFwdDdrQUFMTFBodkNjbE54VEtNanMwSVhZUmxtby8vM3RXSzZ1cGZKRmJD?=
 =?utf-8?B?Ti9yUzZpYjcxOVNlU0tPYnF2ckFiU25XZ2NQM3pDT3dsdytRQlVkWk0yeDA3?=
 =?utf-8?B?NERNWExyeElxcW9FUmdkL1pLczFtVGNGQmZLVzVFa29iK01XWW80Ym9tUVlJ?=
 =?utf-8?B?WjcyTVM0aE5pcUt6RUYwelVqbG5sLzJEMTZ5SDhqd2tTQ2VZQkFybkNWY1Qr?=
 =?utf-8?B?U21wM3RyM0lWTXQ1NTRmdWM0czZwTjg0M0kxcWhNbk9sTDdOMEtzZVdPT0wv?=
 =?utf-8?B?ZFdBUHh1R0FCQmZ1NDE0ZkJKVXdmOUN0bkM1K2Q5OGlDYmZqK3Nabjg0WHhu?=
 =?utf-8?B?M3VNbEZnejlvbFA4OFllOGFPUyt4emYvdkRqTW04dk5KNXBUM3YzR2l5ZWVk?=
 =?utf-8?B?VmJ0OVkvRGV2VmY0c2tuT0V4cit1UU5HRlBIWjBVZTVHcnpiRVo3ZGw5Y2hN?=
 =?utf-8?B?Z0NaMnplYmFvbDJ2M1RPSk1VVEdOcStrQnQ1aFYva3FSd0RFWk1EVjdmcXNP?=
 =?utf-8?B?RlMwL0V2ejE5N29LZlRsbDVJSGdhK0U3TXpsbjZxSi9yOUdOUkNJL2ZKWkNH?=
 =?utf-8?B?UkRHRlNOQmFkY2FNaDQzdGVrNVFSaTFnYmIzWjlQQmE0Q3cwRTJaNDVnU3FM?=
 =?utf-8?B?NXdDbjdJeHgvTXJrZDV6Y0ZlK2h4VGlsUEtxRThpUzh3cHVMM1l1azZ1UmNm?=
 =?utf-8?B?THZGQkNyd292dmJvVUJyWndDRzM4TEJ4Z3hCb2VpckhtdlFhbVZ0WlowRWF2?=
 =?utf-8?B?WXNuSWJmRHBxU1M1bGVkSm5IR0s0dzlQSjdxeUtXMlBuMkVEQUVaYnJTS2Zu?=
 =?utf-8?B?bHFlQXVaWTBwYmxFdjVrNVhLN0p2dmJTeHByZ1VqbVNnLzhJM1lhRG91ZG1q?=
 =?utf-8?B?YTAreVJzZjlZR0xlTjZZc0JqQVZZckVyQkM0cmhQZC84NncybjR0M1BUU09M?=
 =?utf-8?B?UllybzNML081RHYwRm91eEhyWUpPNDFuYkpVMHYrZnBNRXcycU5jRmgweWd5?=
 =?utf-8?B?dExoOVNBdDlMTWZJbVV2bDVmenQ3NmdIUFFtSjV1L2VOa3ZPREVrcGxYYVdk?=
 =?utf-8?B?WnVrZmVLK2lQcWc2VGFydDFKQnc0RHhWbGx3QnpZdWhMcENXOFNCNHdkY2dt?=
 =?utf-8?B?VjkyV2RFeExVaGRMTGFrU2M4NG9DM0xucEZOdEk5clVSWFpIeEhMbDM2WHZD?=
 =?utf-8?B?SS9FcllJdlRUTmtkcXFVWDZUMmpZU1p5Sk5UajdsQ3cxdGJ6eXRxMWIwN3l5?=
 =?utf-8?B?UUF2STBYcTJSYk1ScmFTcDA5TTdNandzY2t2U2MvSWJzeHdRNzNhMjV1NGs3?=
 =?utf-8?B?MnpxREZhc1J4V3ByckE5WnBWaW5ubGlTbk5SYVI2cElIV0ZjN1dxekc2OExa?=
 =?utf-8?B?OGdpcXVlaTZlYWVJNHV0bDFDZGlIODdSejRSY084dlF5ZnZTNkR3OW9IWkI3?=
 =?utf-8?B?YTNsQzhNbEd3OGhNTURNei9uQ3k1STVRSXRJNWs2T1Q5My9xc3hROGF1eHda?=
 =?utf-8?Q?cz3q38mt9R30EbiM=3D?=
X-Exchange-RoutingPolicyChecked: 0/m2DG+XLyjZRaLJ/qiCfw+aggVLYix+QMeWSOJflNnmOn/eci+T9a4KEtpLMCGb1ysSW16UEnVzLVvOuz0VHqwA6eqAz4IiHUrGrU4L+Ctnsr/YTP5QSZiUToAP97LBPT/BhxALHvWnVsN9aDozCtHXIrttXhWc0n4AGag9HeBzx1vSMkNqx6sqHkhnMH4VKOplbIo2r1V4HEKF5mSlYaC+axRahXY3PJ/sYxqBAftYGEu4psPwE63s1WkkHHHuQG2DBAjevKhDDDdJrpgfGSDkVMdOAE4M8DkilIjJjXpYX7d6ov44tKngb9S9ExjKbGpCqCQNWsJWgASjot2Jlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc65315f-e42c-4133-adbc-08df09d2b06d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:47:41.9694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmM5FxSLbvYpTPE33p+T5WqIldeCiY6o+HRYlASFv/I8TmuTmrCNWtSA/SNmAwRydDypgXu+fyj1T2Tp4EWfYDTVGHSMoM88L+zxkTPSUPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
X-OriginatorOrg: intel.com

Hi Shuah,

Could you please consider this patch for inclusion into kselftest's "next"?

Thank you very much

Reinette

On 8/20/26 5:39 PM, Richard Cheng wrote:
> L3_CAT requires an exclusive cache portion to test cache allocation.
> This means that the cache portion used by the test can't overlap with
> cache portions into which other agents may allocate.
> 
> Some platforms legitimately report every cache portion as shareable,
> leaving no exclusive cache portion for the test and causing L3_CAT to
> fail.
> 
> Skip the L3_CAT when the platform has no exclusive cache portion that
> the test can use.
> 
> Tested-by: Chen Yu <yu.c.chen@intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
> Changelog:
> 
> v4 -> v5:
> - Split the patch from the arm64-specific series and post it standalone
> - Reword the commit message
> - Make the code comment and diagnostic platform-neutral and describe the
>   exclusive-cache-portion requirement.
> 
> Best regards,
> Richard Cheng.
> ---
>  tools/testing/selftests/resctrl/cat_test.c | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index 371a2f26dc47..0a417267dd74 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -357,11 +357,32 @@ static bool noncont_cat_feature_check(const struct resctrl_test *test)
>  	return resource_info_file_exists(test->resource, "sparse_masks");
>  }
>  
> +static bool cat_feature_check(const struct resctrl_test *test)
> +{
> +	unsigned long mask;
> +
> +	if (!test_resource_feature_check(test))
> +		return false;
> +
> +	/*
> +	 * Test requires an exclusive cache portion. Some platforms may
> +	 * legitimately report all bits as shareable, skip the test if that
> +	 * is the case.
> +	 */
> +	if (get_mask_no_shareable(test->resource, &mask)) {
> +		ksft_print_msg("All %s bits are shareable, test requires an exclusive cache portion\n",
> +			       test->resource);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  struct resctrl_test l3_cat_test = {
>  	.name = "L3_CAT",
>  	.group = "CAT",
>  	.resource = "L3",
> -	.feature_check = test_resource_feature_check,
> +	.feature_check = cat_feature_check,
>  	.run_test = cat_run_test,
>  	.cleanup = cat_test_cleanup,
>  };
> 
> base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc


Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794243723;
	b=Sx9ykUqvADjmgmDtlTGooUKwIjKyPJewXnWyMI7mYvmHb4udTj6cInzaFA/AL25XnmJw
	 DfHAhQVVWFgbPAS/KrvOsIncE6/FTsLcaAJFIKYe0iPyNnFO7vzqyJjYGNI4nFvzwhY+5
	 8uLAaTiZNzw8Lmx/ChtsRezMN6ok83ppiSctOlQqIiclNupMUukUSXlx1u5uhpSAdROWo
	 FCAUoqDk8Or244UCvqBpDIUHSMscwMbkdGDl4IoVHbP7Ewh2ZUqfjip/I7smfK6wI4s9c
	 Q6uRNxtWqXGn4xupvMrMhYbqBc/ujyly1BNcoaNCXuinovc5drFH4eNdOF9ki/28ldA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243723;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=kCt/7VDrtsaDNpN9HEppOBS5AdC6XKPbkO9vgBTssCk=;
	b=RujvBneaN6jiv/oRtViXtDhXsyqIFbp/kZCEVvoZ6kpEJsZiU1L9BkV1rihRLsd4h71J
	 MuDY6eFRsGnsYe5PGeqjFQF6+JbPjr4hUqbV9T2b2fy9zl1osFL8S/udTWQoXPhSczpSd
	 WWSYp4gukwZAGPDkANvO6C5BXTricIfopjxfEDbBU02g8j7DzZVvuuY1H2sTpcKnQ7y7a
	 SgGY7bsJMd+t/5bxz6A446G9rd40PyoDltRHz4zEFoRw+12QN2akRQk9IOsdmYqhRi4qR
	 EAqmKVP9UGvci8neHvhiKjovhT6T+JktRw5ceCFZjkKUUtAMpXnZ/7QkSfvM8uUy0HA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lvmrSFlA;
	arc=fail smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C964606A32A;
	Mon,  9 Nov 2026 17:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C964606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lvmrSFlA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794243723; x=1825779723;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DrTPBPHAwGLR0ltz81aKw4AkYcLRfHFbCvF95C7vNIA=;
  b=lvmrSFlAVNsDjGC1ASyEcpbWz1qG63/LlVH9ntbyuwVeRdl93lfzOSTm
   A9eCx9jQLxhRAexWXuKqDzgsp4cbOqKPlODx/Op58iRd4CpjGDy02818u
   ut7S0EGgG2cJq7yFAZIl/qWXMI4rXxj+CNMsUSfMSpHA2Bu2Z6UPSCjp7
   iLjtsm0OUgoeQ32CTZy9mhNip/eoKX8rIMzcFKcSe2TnE3hxg6VhD5NrO
   MYrVeTS2HPRJLR+6nO1d/uvw9YX4nk0KRtrhhYoe6dU0MLyg1onsOLswg
   mTbe/zeoH54gDWMLLyckLZbLQBG2iU5J3dpThBWcEtlQNUXSqmkkMJ+CM
   Q==;
X-CSE-ConnectionGUID: nxCzNxIRTSurmEUO3tJggw==
X-CSE-MsgGUID: E/hj6CS8ThSK5tlN5GLQig==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2855621"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2855621"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:02:02 -0800
X-CSE-ConnectionGUID: YCTqQIZFQZmRnI4mw59k5A==
X-CSE-MsgGUID: 5m3jlJ4ET2K+1Q225tWJgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8234034"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:02:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 09:01:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 09:01:52 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 09:01:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOf6VoPFaOrd7vBPQ1NuS+dhcdLqM+IVziDYi7pUBrcKMoF/V2q2CSGvrGdAXl4cOmqNSTf0zNeefAUQyvN1u7/58TVKapXHioGsQUWrsz2Q7BhBshElfCSpd6EOGTtzVrG44cXQ42CQIKhoQ7Wy8jl/vkwe4z8BDuc7un4NQvtVPn3OpZcs2Qg5vZc4+pieFoUwQRXur+bwcgqFD29+Kc5ux07IJ4sK1t+sUTuu4uIyfe6sGZ/K2JX0NndMIaESG5sLYUyk0UrCtGxS2gKxOzibM7FfEXSGARgs5aVZ7J+xLRV+B7DgPOkFhpZyEEqADC1Cj8D25KqrOFn5i8ARxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCt/7VDrtsaDNpN9HEppOBS5AdC6XKPbkO9vgBTssCk=;
 b=uAouVtAjF54pAVUiz0vzrA7k/gyhqkdSi8HhowF49SrEt0xx6IWv2Ek3+772cg5BOgQzrggAUdBWTRgsbianouPpS3Vs6kWBpk0+nfL+9YrZODncPtAGGo9HF6wS+0nk2JUMiqBfypJba7fZqiY4XSpRwal+WGECiBDBCV98fSbhRSuP8hX4NwtCjPAReJ+IKX/LAyNFDDaDyQ8HXrqXYnYKis+wQ+jLRba+Dh2ZaqD/l649DIbYpWJUfFePg/ftTEdCj4a8SB9QIgQ/rsRI6MD7AwSoavFciVso8x8yjYxyl6iAtbhFsA2Js3DbtUdDsNGzrc+XJNloV9XAeqxHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:01:21 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 17:01:21 +0000
Message-ID: <0583dad3-f761-48d5-a9a2-f2ad39567a6b@intel.com>
Date: Mon, 9 Nov 2026 09:01:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
To: Ben Horgan <ben.horgan@arm.com>, Richard Cheng <icheng@nvidia.com>
CC: <tony.luck@intel.com>, <x86@kernel.org>, <shuah@kernel.org>,
	<fenghuay@nvidia.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <kaihengf@nvidia.com>, <kobak@nvidia.com>,
	<newtonl@nvidia.com>, <kristinc@nvidia.com>
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-2-icheng@nvidia.com>
 <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
 <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com> <aurOz7iGKInyjddW@MWDK4CY14F>
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com> <auxM9hVAgp61Qbgv@MWDK4CY14F>
 <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
 <808923a4-0a6e-4d8f-8ace-d3573aa125e8@intel.com>
 <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <89549a38-4764-466b-b66e-98bab801fefc@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:303:b6::16) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f7c6de-6d43-4cb5-2cae-08df3e831449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|11063799006|56012099006|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: D52wVdKOGEKULoouoe1Oy9xeOG6rB45rSkPG92LwAaPtZjrQeq9XPyDMdHUts7lcq/hdWrXzzylmcubkk1+/2R2rJzJ0WeaBK2o6esAXsFeUAS2VSMVfDrv9bsWa4mPIlYnyi3GwPA275GFq2aWrNJDVrV+J4c8BAx+T4/CkWR38QHKt0c/q0QLqq3HZgvU6XvQm2rXeJQWNhyQlYUP6OFa/ywZIBm16wyaxQZfuDHtGfuhQTnog3vP3ysSckDEPPff8q/blzpNtiPuD1VTM3/dWDGWkGZyVmL9Qe6otizMna+EZ+pmuG9SQRovk4C/Ij+LAk7/eolOouz52GML1uUvI/6MUK3cDRyIjKtUfwDEEZMQJoFqcmktqNB9d1jVxvxgy6okPMEXBVPy3PVb+j13Bp/rGJSH3Z7PUlmp69YnBHorDUtFV7qzch0CPYm+RZV9z/+qNfRDhAnLtSubhPoVtBaZtccZ865DZsb0oo0meT2OZGHWSaIDVOljSQ00O2WhSw2RhzBTV60wLEdNZ8IgE2M2C/aeb475ekCedTHVF9F53pB58CU4I5mWTqHD8DhyR4mVMtOfRHW8u8l0O/GfkMbuzVEoZbVOtqzzKzsjfcICF+dAkvbCbnRSfIK1m2cCsbvsk037na4ParGMK57rbcefWdTqGD6UnuZD0qQM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEx1NWRlUEgwNTRrSTduS09CTUo2NmxNeGVINWhmWUY3WVMvYTNrdXV1S0RZ?=
 =?utf-8?B?aUNudmZFM0NxbHhEUUJ0TU1TN1JkWDF1WkM4OEZRQ0J3NVI5cmZwN2ljN1Rt?=
 =?utf-8?B?RW8xTUJEQS8yRjJRcjFmY2h0L1N0Yjl4UmdYUFYyandOK3NRcTloUWdabGI5?=
 =?utf-8?B?RUpsbHZETFVUcVJvZTMybW1LRDA3Wm1FRzJnTmlBem50VGRMNnR5ODdUQ1Vh?=
 =?utf-8?B?RForSnFMSUx3UU5FdFU4b2daR2RBMkJqb1liTEJKeFhLR3VMbmVXa2ZzSDR1?=
 =?utf-8?B?WXl3UDFFcGtraGdwclo1dWZFWkQ2b2xQTWxvYTVkZFVLMmtnL0tlenh1VmZz?=
 =?utf-8?B?K2ZJOUkwSkVvS0ZRbHRqZlFCS0ZVL2tvay9uQy9QaUZZcnRMUjFHZzlQNTZJ?=
 =?utf-8?B?WUpNL0hXQjY2a0JjUWdzNmE5R0ZDN1Y2SnU0Y2tkVzRvWk9Tb0Evc0dhcTNT?=
 =?utf-8?B?MC80R1JXbEtLQVNnVVo0L2U0bkNqclQzV3ZYa0s1Q3UycE1VTGNTWlhBSHZS?=
 =?utf-8?B?Y3c0SllOMUJHNkNXck1xSlNqSmxxSkpmQUJNeGFxZTVXSmpSODF5RXFxK1Fj?=
 =?utf-8?B?eXp2bzUrZkJ0V05FcGh0OEVTNzNLbTNFYnFBeUVmUHpzRnZiUm1XVi8xa0dv?=
 =?utf-8?B?VUVMTGFFNzR6VGRtakY2K1R5cEhUSkJsQWg1M2dxeDc3SEZBSTRxWGFGYThN?=
 =?utf-8?B?N1RmUVJ6SXE3cGpOSGRETFJnZERMMkdiTFNnakE5ak44RGd0ZDB2SXRGdWN4?=
 =?utf-8?B?RkIvSGM4eWV5NjVWRGFNVnJNRDA5YUwyWFVmdEcyNnAvNUdmaWlHVVpZd25r?=
 =?utf-8?B?VE1lUGdtU0lvdEo1NTR6Q2ttaXhYaHFoN2ZHSmNxWjlRT0V4WG4vTEhEY2pT?=
 =?utf-8?B?NnUyYm5KUUxCQnNPUy9MMUFHd2c1ZUxmNzlxSVBKMUJCN2FKbE1WMDJ0d2hl?=
 =?utf-8?B?MkEzTDJxRUlrN3NPNWpZSDFIbENET0YvZHRKSGFDRUFOQ3R6SVVVcFp5dGh3?=
 =?utf-8?B?WldvZSs4WTNhSTEyb3RyQVBSUnhHQXphekpHOGkxdTRodjkvRlVsT3J1Y0hG?=
 =?utf-8?B?ZVpuQTEvd05Ib2MyRFk1TDArVmpEWDN0Q1pzL3g5ZlZRUU96LzNvOGhYSXdx?=
 =?utf-8?B?amVNdys3b21jTDVTY0kxQnFZKzBxdnM0WnUzaFpFY2U1bmRqTmYzckUwQjJo?=
 =?utf-8?B?WnZMUEVJK2RSZkQzMWd3eVVER2pNRE9JS2w2eVdTRnQ4T3daNU1oSHhTVEE4?=
 =?utf-8?B?T25HQWNFYlVBQXFWdWYvWnVFUEhjbVpkeXJ5YUM3cjNvTkNsU21oYTFMaDha?=
 =?utf-8?B?M2Z6UUVmRTUwWkV1YUNGSm9KdGFKS1hGM1RjcittcFFDdExJRDRzZDd5cHVi?=
 =?utf-8?B?N0dUemN3YzFDR3FWR3orbXk0OEZVU1l0MUJQdHRKbHc1b2gwdC93SGxvZ1JL?=
 =?utf-8?B?NzB6TEZudmJuZTVxV0tEQ3FKYWxudFNpanMrcnVlRW5HR28wN0Q1U0l3WGY0?=
 =?utf-8?B?elIyQlRpWXI4UUtJWHc1MEpWa3VpWjhrbDFnM2x4dTJLK2p2U3E4cEx3d2NZ?=
 =?utf-8?B?QmFNclZRZUpENVpqVjBmczZsNTIzcXJWTEJqK1Y2NHZUVzFyZzlkSUZiUG85?=
 =?utf-8?B?MDUwQnR1QXpuWnRNUnY3c0dkVGh2MG50UVJMaHVjeWlKRE8waEsyVm9nVmpK?=
 =?utf-8?B?d3VlTXRtR3ZzOGcxeTlpZ3FWQ0l2ekU1Q0thVUV4RVdvakU2QW9QdzdPYmZx?=
 =?utf-8?B?Z0lEamRQOG9SOHhidmJDdUNsdFJtbW5PTk1hZm80SWE3d0pYdnVxN0ZFRjRu?=
 =?utf-8?B?UWpGT0xKQ3I2SHlDRjJvN0tsZmZVT1ZGUlh2bHFSRlYwdjNQWkdPUS9nTmM5?=
 =?utf-8?B?K28yN0R1MzBDT2tXK0ExNkNHelJaaG1aVjY3MHZyeUZQbXgwTTlxYnhMME9W?=
 =?utf-8?B?bHQvYWp1ZndMNm8vKzF0U0ZxU0V3ZGplUERRRjJDZTU3VXJwdzFJellVUVNz?=
 =?utf-8?B?R3VWbE4xM1V5NnlvVFFNOUZiMUtISUx3ME8weXZCTDlQUHE1NnpsWnZudk9R?=
 =?utf-8?B?RzNsMVpTeW1iZXQ0dnNldDZIRm5LWlkrRlpOYWJ5Zzg0dkRqT0xTdjA2dWxS?=
 =?utf-8?B?UnE5cVVZL09JNW5aQ3hWT0lMOSs3VjIxT3JwTUoyNHlLY2JoUldyV2EvMmN1?=
 =?utf-8?B?TkZFTmVrQVJGK1NIY1hybmlSUUtRN1lzc3pxRkZsdXFHR1lmZFNNWFFnWVFz?=
 =?utf-8?B?cktqV1BKUE5tZUJUQzRhU3Y1MUdRRWxXeTluNGsvSjRCVHNFcG5BSkI4WkRi?=
 =?utf-8?B?ang1YkVQMHZnclJDdisrOC8wbE9EQjE3TnFMN2xSNW1MUHRpanJHLzkvL242?=
 =?utf-8?Q?1/18kRk84DkdQQXU=3D?=
X-Exchange-RoutingPolicyChecked: 5UsN146pNUygzA4st/5Ru152AYd7mxzTdZvQFOgnkPIgkYkfe7RssC4e84SAF5L2GNSoEKhR597ZA9pazqhIOdF97payS/a6nsBz9vrTfn8S23ftbTXF5tPyXKtTGk4Xv46+yHBiKqHbHIVD4LYflI2m/kZUi8zVyQvHN+k2kYab5AmX+r46+AsHoWcP7faqgqIkvdvwQmnCC5QNtCNimk6JoIEXoFn5WCEyzOEIC/i5kI8PzGFFFuuIxzlsi0ASUeKD+mqo45hO6cek9Pf4Ga/D0e+SHtSfzxZkns4OUL/My/Y8k7cM2FDp0P/CGTk5rsdxGF80BhMqGDuhSQ9loA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f7c6de-6d43-4cb5-2cae-08df3e831449
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:01:21.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyxMMtko1NOKlVBLTA/r5ganQYGuD3oqtzJj2B3jBvhQLz2NOOXmazU0PRUYhS22NOQchAhCTtjxHxkBhzlWPqYOncQlqvzq88yjClnjnI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
X-OriginatorOrg: intel.com

Hi Ben,

On 11/13/26 7:16 PM, Ben Horgan wrote:
> On 07/11/2026 00:29, Reinette Chatre wrote:

... 
>>
>> If you do end up using a benchmark I'd suggest to make the checks as forgiving as
>> possible. For example, instead of checking something like "LLC occupancy needs to be
>> X when bitmap is Y" it should check something like "LLC occupancy when bitmap is all ones
>> is larger than LLC occupancy when only half of bitmap is ones".
> 
> Do you think it's too strong to say that a bitmap with n + 1 bits set
> has higher occupancy than one with n bits set? I think it has slightly
> more utility in that all bits of the bitmap are plumbed down to a
> working control but I'm ok with a weaker check if a stronger check will
> just be problematic and maintenance heavy.

My comment was motivated by the recent change I needed to make to the CAT test
that uses cache misses measured via perf instead of cache occupancy. Originally
this test incremented the bitmap with one at each cycle but incrementing it with
two proved to be more robust.

What you are proposing sounds more like an enhancement to the CMT test that
uses cache occupancy as measurement while following the same methodology as the
CAT test. At the moment the CMT test just uses a single cycle of a hardcoded
(unless user provides something else) bitmap with five bits set. Even with this
I needed add enhancements to make it more robust:

 commit ca0ea39288c9 ("selftests/resctrl: Reduce interference from L2 occupancy during cache occupancy test")
 commit 7a214b4ec1c9 ("selftests/resctrl: Improve accuracy of cache occupancy test")

As one enhancement highlights the accuracy can be managed better on a system that
supports L2 as well as L3 allocation. Not all systems able to run such test will have such
capability. Also, looks like CMT does not require there to not be interference as the CAT
test does but with MPAM systems having each cache portion as shareable this may also be
a big influence on accuracy.

I am not able to judge if a test that uses LLC occupancy and relies on single bit increments
will be robust across all platforms of all architectures. Even so, I do see several risks
for such test to be reliable while I do not see how such fine grained increment provides
insight into resctrl kernel subsystem health.

Reinette



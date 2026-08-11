Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB8C2A1BF;
	Tue, 11 Aug 2026 23:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786490292; cv=fail; b=QrkAO2p//LeL+P7TuUBorPOMyAbDRr6FkDuDDUn8NCzkcKHq6mlGcM4C20UPWDDLRHB95Xs4gj2uoxsgDXFXBw6MykFZ7A5I5B67DlGjl5XOSI/KmNtcc7YwgUPsNFgnkC/UyQThNVT5iqYKPqSvLB5SbLofn1IvJs4q/XC6bZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786490292; c=relaxed/simple;
	bh=998dQbOAJ1bB+4MxjQXo9Gw3R1chHBZeHfQpVrrRzy8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G+W34S82NIquHK3B7f8Y5MRdrzNXeH030546FI31jSYlziZ1MAlQSNnNj4QpWyo34T6dw7NMJ5CTAwqt8jMJeTcdhMZlGP5kDgmrsC0SJZNB+eR/P3T9L0fZ9Az2EE7xmm2nFHdTdltHXYZZGB6Q+YvQY1ozRqTvhioHvhf+xow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuBoy1tw; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuBoy1tw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786490290; x=1818026290;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=998dQbOAJ1bB+4MxjQXo9Gw3R1chHBZeHfQpVrrRzy8=;
  b=UuBoy1twdqoegz/0Bs5nxGmG660d03U5E4itCXm+NuaYJnChOVdXWl68
   W+9uzhF0Dz4EPTuWpJBCxmEBq/MYbpiruOy2IcYhS0tbJIgbTLYNu6o9M
   ejxNnyg6L5K1fgReNmPf7okS2rPwlEnd27PfvqEluLEY9EIdThgfoACo6
   BiVLmb/3qyoAe1eiHueQV4Uec+5kbvRiuVCh3BNYjHkiN3stOaJgpFgyz
   fVBxesHQUjGCXyg3chxofPMjRiMiDLv1852N+zGaGape7L9Su+UUOFAob
   7U6BtgY4J+QmMi6QVIrNryU7MoXMkfxlVUzbs/rlAbAJZ0NKtRlgfDmo4
   w==;
X-CSE-ConnectionGUID: E8R/THPpR7aJjn78O/oCQw==
X-CSE-MsgGUID: j3xwiErZTHSrpDkeUjDReg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87156465"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="87156465"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 16:18:09 -0700
X-CSE-ConnectionGUID: izNwS+fBRSaSzyaUA8wXlA==
X-CSE-MsgGUID: t6XMxPS8Sumq4mzXIaP+fA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 16:18:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:18:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 16:18:09 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:18:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lj1/bEupuhJi4zD8FyqLEcJew6acwVmjL4TH3er49Vt0PpSqhSLFGzUUFaeMrZ8lCqeNS7yYNMtE/VrXaEy2m1dijp5Z2cngFXB0oyE7T+Dh+sfNe1uaOZ2Nwr+cFWHJD6eHidMi/EOsXTRFtiK8ivCIm0FbeEHJyKrwuNfnJgDh2XjH4B1ybUQMHWjMxGcE79HqXzU7IihPLHYACE2ZvoThocKangCkwkCRhhznVCHnEiS8mEdpl5PYmsWIMCB8tn5MD1hKugPeRcgMLrirzB0enh+bmTgSUz+VEE8Gdgx7N7g/1/TgYu9JczupoxZ7mzOOJ7Esb0TzxseGxQhjYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8H7m9kWqbX5S/1XpyDiMt+0AygXrs1R9Oqb11Uv+pDA=;
 b=bZgw+8WoN2jnwpgXFLq0RDMssb9x2KCeR3qQ+qv4ZWYnUbUDWvwEMfHy+Mmq+qaYYKizzhwy3R+B8d0SavCuTLEyzHC0Ve96krJrCiNH0zgU+wGVQoN6MJusHrnPo3Sg0CU4yqpgnIH0/BxRQxsvMe/gx4WNLdmpiV9FcnHgmqHauG8m+bIwQFyUFDJE8YF4qSmR0iPiSepPt5k9+AsWlt0rZ849bxxD7PcCjtHsqbABI69iumTgW2BNlhF3uT6zGBw9T5LEWOyoBc8v8qDX3HMrM6zxNXTmJTtMysdqDArf+/sbE9hGq4bLbWuBC7cvHmpKiaciGtDcs0Rfybyf9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA1PR11MB6711.namprd11.prod.outlook.com (2603:10b6:806:25b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 23:18:03 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 23:18:03 +0000
Message-ID: <fb1cdc69-9fa1-4df9-bd66-70337118a4bc@intel.com>
Date: Tue, 11 Aug 2026 16:18:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] selftests/resctrl: Add L3_CBM_VALIDATE to check
 CBM writes
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.co>,
	<shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<fenghuay@nvidia.com>, <newtonl@nvidia.com>, <kristinc@nvidia.com>,
	<kaihengf@nvidia.com>, <kobak@nvidia.com>, <sdonthineni@nvidia.com>
References: <20260810095124.32244-1-icheng@nvidia.com>
 <20260810095124.32244-2-icheng@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260810095124.32244-2-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:303:b6::26) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA1PR11MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b4d485-73fb-44ae-a3b4-08def7fecabe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|3023799007|6133799003|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5+VY3OeimuqeFLZNI3WF4LRNBzdYHQWJsYd/yOPqp/4nQonpd23tL22GinZL6JKQfvLmlU/CPd5Jl72mm4pFTXISZ+D1BMshTD0zy5pHjfP0owajfmr/hnj7QzdfWNrHsEUtMwJXdmqNlqxCDC9Kuow9trvKpE7dL671jgPTxuE0GkOL4wJt3ZL7qp4ZpWLRpskPdyXMM4wbCsD6xGDcZUgvbsY2XmQAyubcZfIIEKTF1PXQJAaTd0TN1HPD4VLasSy5yanWXWcniPJ9Qbz2UXHg0szLF/01C3JvJt2YGmGCxNKmGDmRpse1OMpKdL97BvTrrnaq2Nx/1eFOexBPLmcq68Kz9bmSyocdLSypuox6mB5QoLYge8DeoWLqih2CO+1Py/wrgFKsi2Nb/GryHth6djM+8CY/DifIfut+I9Ch4RlDpGNYSQBZED0nRwtI2na03XNCgoRWxXgA7lRQ5LTzDP+BxRv2gqcBzBt6q5tMpot0tPY7zT+X+6D7K76Aj8GkbzJOwpB9acLC0AzV5nfN8+T00LV96aSV40uQNso3LffraLMClmCdxTfQBBgAPncDAqqFphP6f3rNybq44lTn/qb7Z6ucxRmZLKa5lNUAf1bEGYQeX2QfiF76V8xzFWYE4kFUaT3xoJFzy+sFdBPoMQuECKA/JvhHvG9XRqA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(3023799007)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUZacnE4RVF6MGx3TkJ4aWwwMG9uRHFSTjFwZytFRmJwY0lFenVTTjBwZ1lT?=
 =?utf-8?B?Q0hPaGlzZzZwK0M2ZEYyVk5kVXJmZEczZGMrdkRhYjZBeWxyVzd2aVZtQW1j?=
 =?utf-8?B?VUtsbnFsK0hrSHo1VjM2VmUzRVNoN3IxWVozU3dFbDArY0ZMcjdrWDNEbnFT?=
 =?utf-8?B?YXp1eld0OUxyNkw2ZmZpdEZWRDIzYUxldXQ4NG5KNGtUYlpYS1hUcDZIL2Uw?=
 =?utf-8?B?QjV1SmNxZnlpTS84bU5sYUhlMTVxYndJUld4TlBSMXN3UU5VaUdzRWt6STJl?=
 =?utf-8?B?UUJLZ3NJeUFhM21aMFZxRGRkMXVwazRyczNYQTRDazg1cFhubTZ0RldCUFhR?=
 =?utf-8?B?ZXN3UzlQeFB1bi81aVlJbDRnMmg1RXdHVjBvUWpFcTZubFZFMmF4bjlOYTRp?=
 =?utf-8?B?RFBOU1U3SG8xUEVvVmVtbDRSYVczbVNGblBQVHE0QVFOMlNLYWwxR015UC9N?=
 =?utf-8?B?cEE0b1YrNzNyZkg0anR2Znp5VXBOSUVBT2E2V2ZrRUdubXhFV01QMFV1SlJI?=
 =?utf-8?B?eGptcUdjU2QxWGxiQ0Y2b0kycFNMd3U1cVVzUlB6MEQ2M3NoMWV0V3NuSjhr?=
 =?utf-8?B?STU1a3FLYUh0VG5YaXVNd2hOTi9NVkE4b0tzdjczcWsvWGs1aVBidUtwSnRG?=
 =?utf-8?B?ai81T21BUGU1QkhHeFkzeUJKbkU3SFdYUzFDQWZ5SG1vZVVFV0VzWDVhS2VC?=
 =?utf-8?B?aDFOQUp0RUJTbGZDMXVmeEpSeU1xdXVReFRMb1lIT0phekZUaFJHdi93b0JG?=
 =?utf-8?B?WnRzK2IyanJFY081ZWtJVFoxUEo3QWVkWFlhbjY3Y1hJRzVET1Z0UUJiZXFS?=
 =?utf-8?B?MDE5aU9vM0FWcTFha2pUZWkxeW9UNGFDWHU1RWxGUnA3SmVpWTZWdkxRRmw2?=
 =?utf-8?B?L3hEakU4TGJBRHpLc2E5UUVwdGdBaGQ3QmpxbHNYZU5YSTl4c2x1ZG1Xa0pi?=
 =?utf-8?B?NE5iYzFUTUJoT3ExbHNGYTVha0Z1YjhtL1EwMDJZTktrbnI0YkRlZWxtQzVK?=
 =?utf-8?B?WXhkNndIdXVvQzdEVm05dm5GbnVIRmZoM1Ztc0QvcnN0bzVmaEUyWFNqOFpu?=
 =?utf-8?B?c1k1T0VKdUlKSmt1a25qNXhjMmNvK3hOMXo2SVZIbjJOalRTSVR1SUVIRytr?=
 =?utf-8?B?eE9ZYUFacTVObUZSaGN4QVVlaGExNjREZExseUlFemRuZHZmeG05V3c2WHN2?=
 =?utf-8?B?VFlCMlJLWCtZcGFHT2ZkVHNFTmdlNDdVempaVW9nZEE4VFVMb1MwS0dWUk44?=
 =?utf-8?B?WEJzbVd5eHRDdHZBL0U3T3hGZUtKRHprZDZNdnYvN0VyWmp3TFhYd1puaTFv?=
 =?utf-8?B?a2hML1dINXE0SEcySmx6TTBGVHcxZVl3NHdhT0ZXYThYd2JKWDZ6cGNzaUVU?=
 =?utf-8?B?MEdIWjB2Yk9tVE56Qjl0dzJENlpseUdHZ2NzaGwvNmtzaHpZTXZjdlJQWitS?=
 =?utf-8?B?MTRCMDY4SGxISmc2aVlveDk1aG8wMWVBNjc4MW5jK2V0M0MwTmlPOWpkaWZH?=
 =?utf-8?B?ZE5iV3VGdW9hSzFlWkxLU0JWcmtMOWFaK3FVTitPRWE0ZHkzWFZKNkVmVXo0?=
 =?utf-8?B?MlZBNTdEMDR1TXhvSDZCU0NJUDF0d21Eekd3QnBiWTV2Q2Nxc01LRzF5TXNh?=
 =?utf-8?B?OUExYUtVWnZGeGtGMDRXYU1Cb0cyZ3VvNGVqazc1bzV2b1BTRm50QjFtcDlR?=
 =?utf-8?B?b2JhV0ZvVmN3WmRHczZ6VW51MlFXaWNicXpScnlVTXNDV0swYjVRQXZpbWhG?=
 =?utf-8?B?OGh5STVobCsvQ2RHWTJvdDIzeDBHTGNnb2J4dUZ1SW5kakJxWGtCTkExY2JB?=
 =?utf-8?B?RzV3UkoxcGV4KzFaYkNiaEZLOXJJTnhGM3B4NUkyM0RFbG8rVk5DUStIQk5m?=
 =?utf-8?B?NW94RkNCbDZKcFlPMG1wYzlLcVhmenlvUFRLZWtNQjJCMTExaGpUQlR0NVVk?=
 =?utf-8?B?bThjU3BlcUJoZjZMZXVQa0x4K1RWWTBJZU8vME41alBJUHRpVjIxeWJ5bWVt?=
 =?utf-8?B?SlFwNkFpRzB0V2s4SWFCbG5kbUxWSStQZHBWQitUbjdPZjRSZXRxeWxWWkFp?=
 =?utf-8?B?ZkhtWk1BMy9KZ200L1F1azVWc1pxcWluemFKZHNhblFxSDJoVjBpd2grTmhi?=
 =?utf-8?B?a3FER2E0bXdacmNaUmhJMEVuNXh1SFNUN3BmZmkvcHFyaTZiTkJYbWszdUx3?=
 =?utf-8?B?RzVLL0NETnhtS2NJS1VQdVhYM2NVT0lNN1NWSEtLQjNPZ3RNc05SRTVEMFVr?=
 =?utf-8?B?NXp6aXFKeU5GMGRWSXZaa1Bnc1hjR3p0eTE0Q09SNEh6ejI0VlhwNkVoMGZX?=
 =?utf-8?B?Qi8wcE1NNktzTXFLQ05FdmhaUngvRE04YXpteGZoTlpwdjdLazFQa3ZVNzBv?=
 =?utf-8?Q?k3rQFPMsma371Ba8=3D?=
X-Exchange-RoutingPolicyChecked: eXoyjgyNiBnnBcvhZqHWye9hMsC0bMq6q0XJoHP/1PZZFl2QwVvbt6PTobKIXvJ3/cfib8k0DGoMMr2K2v9UiRLAgyeEI3Kp9Vk5G4Y00TnHuXO1KLg3m3+q7ShBQKBO/ziByR3KBHKo/tRMzOgPC/y9iUuJJ5mwbMRK21VCRHUGLQMc+RnHxExnU46IKuNApbSME4AMTFo5fKBMEteeWo5oKClx6I8fPwlEh5du93OlH20BVoArhHJOlTolP1MgQGOvUrnwGuRJujDq70TYypL0Br0JrlVCIaxLPFQqzIovXmshBEuUW0YMYbqEovRqg1jTLzOhazIZPm1wzKZLJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b4d485-73fb-44ae-a3b4-08def7fecabe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 23:18:03.0103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5iZztNC2pG/i6WO7LGnLTc2rUyNQg54Wwzs+8lii8oi1TVxB1PZh00tO6T9bqGbNmA8C3X+qxqcZfLdS4T9MJ752JOaE3Z7sX54UT1Zb34M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6711
X-OriginatorOrg: intel.com

Hi Richard,

On 8/10/26 2:51 AM, Richard Cheng wrote:
> Add L3_CBM_VALIDATE to verify that resctrl enforces the L3 CBM rules
> advertised by cbm_mask and min_cbm_bits.
> 
> Confirm that the full mask is accepted. Check the empty mask according
> to min_cbm_bits, and confirm that out-of-range and undersized masks are
> rejected.
> 
> This catches inconsistencies between the advertised capabilities and
> schemata validation.
> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---

....

> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index 371a2f26dc47..a06c57954740 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -357,6 +357,89 @@ static bool noncont_cat_feature_check(const struct resctrl_test *test)
>  	return resource_info_file_exists(test->resource, "sparse_masks");
>  }
>  
> +/*
> + * L3_CBM_VALIDATE - Verify L3 CBM write validation.
> + *
> + * A full CBM must be accepted. An empty CBM is valid only when min_cbm_bits
> + * is zero. Masks with bits outside cbm_mask or fewer than min_cbm_bits must
> + * be rejected.
> + */
> +static int cbm_validate_run_test(const struct resctrl_test *test,
> +				 const struct user_params *uparams)

Nothing about this function (except the hardcoded string in the final "Pass:"
message) is specific to L3. It looks to me as though an L2 variant of this test can
easily be added with just a new "struct resctrl_test l2_cbm_validate_test"? (more below)
The "Pass:" message can just use resctrl_test::resource instead of the hardcoded "L3".

> +{
> +	unsigned int min_cbm_bits, contiguous_bits;
> +	unsigned long long invalid_mask;
> +	unsigned int count_of_bits;
> +	unsigned long full_mask;
> +	unsigned int start;
> +	char schemata[64];
> +	int ret;
> +
> +	ret = get_full_cbm(test->resource, &full_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = resource_info_unsigned_get(test->resource, "min_cbm_bits",
> +					 &min_cbm_bits);
> +	if (ret)
> +		return ret;
> +
> +	count_of_bits = count_bits(full_mask);
> +
> +	/* A valid full CBM must be accepted. */
> +	snprintf(schemata, sizeof(schemata), "%lx", full_mask);
> +	if (write_schemata("", schemata, uparams->cpu, test->resource)) {
> +		ksft_print_msg("Valid CBM 0x%lx was rejected\n", full_mask);
> +		return KSFT_FAIL;
> +	}
> +
> +	ret = write_schemata("", "0", uparams->cpu, test->resource);
> +	if (min_cbm_bits && !ret) {
> +		ksft_print_msg("Empty CBM was accepted, must be rejected\n");
> +		return KSFT_FAIL;
> +	}
> +	if (!min_cbm_bits && ret) {
> +		ksft_print_msg("Empty CBM was rejected, must be accepted\n");
> +		return KSFT_FAIL;
> +	}
> +
> +	/* A mask with a bit outside cbm_mask must be rejected. */
> +	invalid_mask = (unsigned long long)full_mask | (1ULL << count_of_bits);
> +	snprintf(schemata, sizeof(schemata), "%llx", invalid_mask);
> +	if (!write_schemata("", schemata, uparams->cpu, test->resource)) {
> +		ksft_print_msg("Out-of-range CBM 0x%llx was accepted, must be rejected\n",
> +			       invalid_mask);
> +		return KSFT_FAIL;
> +	}
> +
> +	/*
> +	 * When min_cbm_bits is greater than one, a non-empty mask with fewer
> +	 * bits must be rejected.
> +	 */
> +	if (min_cbm_bits > 1) {
> +		contiguous_bits = count_contiguous_bits(full_mask, &start);
> +		if (contiguous_bits < min_cbm_bits) {
> +			ksft_print_msg("Full CBM has %u contiguous bits, fewer than "
> +				       "min_cbm_bits=%u\n",

Please do not split this message across two lines. If you want to appease checkpatch.pl you
can merge the two lines and drop "fewer than". For example,
			ksft_print_msg("Full CBM has %u contiguous bits, min_cbm_bits=%u\n",

Just merging them as-is is fine also. You will find this file to have messages with even
longer lines (see noncont_cat_run_test()).

> +				       contiguous_bits, min_cbm_bits);
> +			return KSFT_FAIL;
> +		}
> +
> +		invalid_mask = create_bit_mask(start, min_cbm_bits - 1);
> +		snprintf(schemata, sizeof(schemata), "%llx", invalid_mask);
> +		if (!write_schemata("", schemata, uparams->cpu,
> +				    test->resource)) {
> +			ksft_print_msg("CBM 0x%llx with too few bits was accepted\n",
> +				       invalid_mask);
> +			return KSFT_FAIL;
> +		}
> +	}
> +
> +	ksft_print_msg("Pass: L3 CBM writes were validated correctly\n");
> +
> +	return 0;
> +}
> +
>  struct resctrl_test l3_cat_test = {
>  	.name = "L3_CAT",
>  	.group = "CAT",
> @@ -366,6 +449,14 @@ struct resctrl_test l3_cat_test = {
>  	.cleanup = cat_test_cleanup,
>  };
>  
> +struct resctrl_test l3_cbm_validate_test = {
> +	.name = "L3_CBM_VALIDATE",
> +	.group = "CAT",
> +	.resource = "L3",
> +	.feature_check = test_resource_feature_check,
> +	.run_test = cbm_validate_run_test,
> +};

As hinted earlier, something like below (with supporting changes in resctrl.h and resctrl_tests.c)
should be all that is needed to expand coverage to L2:

struct resctrl_test l2_cbm_validate_test = {
	.name = "L2_CBM_VALIDATE",
	.group = "CAT",
	.resource = "L2",
	.feature_check = test_resource_feature_check,
	.run_test = cbm_validate_run_test,
};


> +
>  struct resctrl_test l3_noncont_cat_test = {
>  	.name = "L3_NONCONT_CAT",
>  	.group = "CAT",
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index 175101022bf3..a6fc688ed997 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -240,6 +240,7 @@ extern struct resctrl_test mbm_test;
>  extern struct resctrl_test mba_test;
>  extern struct resctrl_test cmt_test;
>  extern struct resctrl_test l3_cat_test;
> +extern struct resctrl_test l3_cbm_validate_test;
>  extern struct resctrl_test l3_noncont_cat_test;
>  extern struct resctrl_test l2_noncont_cat_test;
>  
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> index dbcd5eea9fbc..57a4d0815b67 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -19,6 +19,7 @@ static struct resctrl_test *resctrl_tests[] = {
>  	&mba_test,
>  	&cmt_test,
>  	&l3_cat_test,
> +	&l3_cbm_validate_test,
>  	&l3_noncont_cat_test,
>  	&l2_noncont_cat_test,
>  };

Reinette


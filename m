Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FA947010D;
	Wed, 12 Aug 2026 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557497; cv=fail; b=W+MEgQsXrVOsvhILT9nTkTpAP2JQYmj60iykwvSeAZbZhKhjTC8QS2cvq925NRB7x4+/0lv6coARkFeYnP3uKiBMSCf3sGB4YupvQHtjylQRdlebLuQ931NoQk5595kmgMrtdl4uIG2Ssg3Ws/eLR3vroWvgmCvBGT1tNmwVtCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557497; c=relaxed/simple;
	bh=Vh7RvfqBARBMAISDGSpfDoVEGCUxoAvf1omNIEbbQHk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lYIglSeQ0EY2qTIvYujAjQKzrEI6A12RL9vZbOBhr78V1+o4iXuxCBh2SjXyNHrmye9uoaFlTDt1SS8u+0zrycn8ArSsa2kKAM7HtJBuhJSVbxtWpJMvKT4o87mkGvmvk6N7pSCrhCNwbJn1RIna7Y8KKHWmWaDKLMKTN89Fn4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKsBwJP9; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKsBwJP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786557495; x=1818093495;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Vh7RvfqBARBMAISDGSpfDoVEGCUxoAvf1omNIEbbQHk=;
  b=oKsBwJP96624hXrlbT/DZT6ZZVAl3pYhTbMlWq6VsF+zLeRbM2yBDHpe
   Ce+mUH5Tya/HbFdFHIXk6jIkah61XOpyqzEEgtUEzyU9M0JN0bjlWuEAQ
   n5zmc1spBaBx8vIsQaL/awus2NRuwD7DRzkOjwxGD1jeSP3F/wNIcqN2B
   xNmwwadeZ6mPGkhe0ijHDmtk3Zm5RVy5rvCKqoiwb9NKH0KfsP+BNl//A
   j2fF9Gd8jqD6HohX3GMRjF95nopcGgQrCovNTfvb+/1cX13sJ14PYOS+e
   Hcj8jiPix3FyLsWi1y5lrL7C2XmCD5hYnpcMkHREmKXfe8tkk6ylOuvNc
   Q==;
X-CSE-ConnectionGUID: DlhqzNdERGyk5yhIW8gPVQ==
X-CSE-MsgGUID: 5OAw/nKMSuWtcUh0dNxtBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87198134"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="87198134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 10:58:15 -0700
X-CSE-ConnectionGUID: zlY1vNpBR6yNgM/Pq0miDw==
X-CSE-MsgGUID: Kjm5YZ7lRAWY5rESpB53jg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 10:58:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 10:58:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 10:58:13 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 10:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqxyjI2FvhR/z8ZyIL6aMjzIf0kpvVVSg8+DQzbD0g4EyilxY9qrGjmEPitphihcR2jbTlZglSCnACqfcumyyMem/iye/EUBLwrxknIeZMwXd3pnpWAgGz7GPDLiWbxZe1N4EE9XYYCjt6NsKhSpEsNRDmaJwxra+9uZwuxd6Xi9PVaM+q3kFpi5v/ySGKip2+Gx8beqZcA2w3MAKGPgVpOTJ5jyYFUleMQxgg2eW2cx2zaAVdlRNV/E6rZuCE08XC6hzrheqLhLqThY9IkRFG1alpJiDqYlhTQ0KAlmmXFqOgHQGXVXALAKq2SfvjRn0BHR8XnfdZhJAFgOOUsh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MquDINc/63iuGaPR3mYYoyjwROLTNP9TZz+ch0yjXD0=;
 b=Grb7SH7AgEp78vCBcPBU7zQnmMx41+Fx7HzqlZsRPrxfhncyJvdg3udBxk0xMYXKZco5auEM3UcXP8vYaDcyaoYDh5/fU/jxEA2roE+eY4hTscWadTSUQtRRbiQW+b9jzlrlD9LzuEzXfUCanudPV5WNMdJ5Zz600vkR9P+39GCUYWF95UKrsuwLBHyNTXb9Ij6sDxSzO7r6jHjr1xR0hhb4yaL50T9kRrgziGEcqbx3bJCG7m2ohBLa0aBvFRfNP1nfP/pNwow3ywaNX+33d2Z+lzI/aPm0vRyeO4DXFtxinRcxEQsdSbc3ZFGBcdEGNg7I4t748cBYJj/BLrcBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 17:58:10 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 17:58:10 +0000
Message-ID: <b2928db3-76b1-4556-b0fd-8278154ddf2e@intel.com>
Date: Wed, 12 Aug 2026 10:58:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] selftests/resctrl: MBA schemata ABI selftests for
 MPAM platforms
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.com>, <x86@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>, <kobak@nvidia.com>, <kaihengf@nvidia.com>,
	<fenghuay@nvidia.com>, <ltrager@nvidia.com>
References: <20260722021057.9370-1-icheng@nvidia.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260722021057.9370-1-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:303:2b::22) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: b336deb9-b757-4ddf-d1fd-08def89b4528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|376014|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 0Gg0ZqxkCcxsN1wH5ooRkZe1KdxGkMg1XZonrkBNm+2ceyaNTdzGJsaPvwnMdPbTegBcH2E1N7ACE4ciKuB0aS1tPIMmIIkiqvaoEZLP7QULkh3DiKMfs6yzcTK4lHfjV792IJHw8a47KLw4bzF6xiM2RyQywVa5A4s+r+7fP0uDNWyPzOaoJKwku5LKDpDqzO2+4BYLyhh44TaR0g2do6IxK/wggZhocpAxNUmNzMNacbalIiqoMXZfRb0+IXPC3CrJT5v/r7FvXWupV0N3/KEddv8+tHAVwQfxy0Xjp94r+/gy9dHkdmgUGNwDhvgwojB7sXWrZAWrkFJehdaRCwAtniR2G1OEdGWdBvfyIF6p8NWaXtYqLMYAMq8PYtZu/HjpKT6krmdAKmv90ZALt1k/l65JDIWJe66Eh76d28d6BQ+nfpy4Lx9EFG932pnAZny02mdTk+KB79k0rgKfaT4NJTaJ34D1ogUurzKRwSCGTi2WvC/BS+r3mM4XpcY1G8VWxfxBu+xgyCMMryPm7dq5cS4mYdmIPSWeHkoT4YgB/wMSXYeQhU8rs+0Efxkv63NqDrZtDdxyQmnfyHKymwPCJArXTKk8WVjpL3A2q6/Js1Bftq1TPdG8RmkqQgRFlcESnsl2wXsrJeJkBfWYepHLb0JDxM+MnB4K/JOApPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(376014)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0R2WXhaOGt0cE81Snc2a1UwNXhyL3lQMVExQjBoRkhMd3hJekd6VEtjbzlM?=
 =?utf-8?B?SUR1N05WNjRTR1ZEYThkbDd2NzlUQkh2OEllOERIL1lQM3pURk1CZ3hyK3Vx?=
 =?utf-8?B?RWJTcUVkUjZoK1B2d2ZSWnN0SWd0YjJlYjVtUTgyZkE0TkgxOTJZUVZXUjEy?=
 =?utf-8?B?NFhIRUhDODN0clVNSCt4d0dGR2xIUzBjOFVUMDdZYktDN2RFcjNsdUF3SnNH?=
 =?utf-8?B?a05sVWdJTEw5N3F6K1hKTjgwSWpaNTNIRm0wRHRmNUM3NXB4eW1teWRJVitq?=
 =?utf-8?B?bXJ0c3h0UGdTZ0crTTI1ekQ4bUM5Z1RpS2hMRFFHdklWczBCTWs5Ny9XTVVP?=
 =?utf-8?B?em5xYW9mZmpmeDkyOStPc1A3SlNnVWlWeFh0dlAySml6U0tnMzBjMkU0ajdH?=
 =?utf-8?B?VGlvcmVYK1VDa3VXbGZrY0duQm1RZ2JpMUJ0L1RtKzNiNGYvOGlnTUQ2TmxV?=
 =?utf-8?B?MlNxQ05BNlp0YUw4UXZHakV5bHV4OHNYMFg3VXg1dUVmM3R1QTY2K0dCQnNH?=
 =?utf-8?B?NXNuSEhVUFg1czVjbHRDbWJZekp0dWJxdy9NMUpJUFhIMTF1bElNMmE3VkZ3?=
 =?utf-8?B?d2p6Ym0wTXN4djJEZDE0TlYxMmMyQjdLLzYyUlM1OGlQZ1lxU2hYaEVYUHhu?=
 =?utf-8?B?b2Q4c1pYTG5mM3FpVVJBZEt1cWlaeGtlci8ydElhWmU0SVRhTWFDZjVPUFNO?=
 =?utf-8?B?SHNjcWRjWVkzS1dVNFlxZE9uYndFRWxodFVFWGhYLzk3RFJ6OEd4OW9TQTZv?=
 =?utf-8?B?bTE5Q0FCeFlmQThmNTMwQ2g3dms3ZnZ6cUxCTnp5eFZDeTJmL3p1NXFnNjkz?=
 =?utf-8?B?eC83d2QvQUpFbXVOdWpDclE1dDZMS1BFWmoyMUlQbVhLbk14elFKcWc5UjAx?=
 =?utf-8?B?aFRRUlJ1WmdvWlp1cVhuM3hUYnNrRktXZDgyMjcyb0hobGFza3VrR24vcG1n?=
 =?utf-8?B?NGt6N3JYRmhablprMG5yeDRNWXJFbTE4bUwvNTV4U1FXblJmRC9ubDNzMmg3?=
 =?utf-8?B?WENXaWtycys3bFEwOHRmQURSQTB2RkUxYTd2Ni9ScGRRbXNpUERoMUtxTHEv?=
 =?utf-8?B?dnZGN29ZTFZ3UUhrekY4Wm5Kbm5DdklaMXlIL29aZ2l5YUF0MTk5Nm1CMUdl?=
 =?utf-8?B?N2xZVWV2ZVpyNlBHQ1EzVmUyd2F2QmZOY2dUZVR0OCtkaEs2Y0k2Q3V4R0lQ?=
 =?utf-8?B?TjZqWXkyRlovRmdxMGdHUTZwMWhsZGxyT1Z4b1FnY0l0UGk0VDdaRG1CRDlp?=
 =?utf-8?B?SFZTQWIrUWh4VkYweWpucU5sMU0ySGRjRHY3b2t0YVY0ekovTVlyVUluU1Rn?=
 =?utf-8?B?Wml6aCt6YXU5MlMzOXU2dSt6THY5RGN4N0tDRU4zdlV3MVpZNk8xQWNxQys3?=
 =?utf-8?B?cTJKclk3YU05M0xvSlJZdmdZanZwL0N0c3EwQ0tGQXkzM25nNnRyUTNpUU1F?=
 =?utf-8?B?MWozbnBlYlFtZEwxYi9nb2gwR1ZGcTNOTWUzNElYMXJTYnRpYU5ieFgrakF5?=
 =?utf-8?B?RlZGZWJIeTdXdlYzbWlMYVVyTjEwY0RTak9NZlkvcFhBSjIxQWgzN2tFUlZo?=
 =?utf-8?B?ckdxcUVVallzSTFDUlNqSm41eXl6VWxVZzMweGVwVDB0ZUF3R3hiNGVBTWMr?=
 =?utf-8?B?SjMxN2x5bTNqTDZiWEZ1U0h6cmxvTjdBS2wva1JaN0FrN3k1SlNvYjk4ejQr?=
 =?utf-8?B?V21TaklaZnlRMDhLWXVoVFYvTytCWmpWSTZYYkN5emgwdDM0ejZ5dDJCRjhT?=
 =?utf-8?B?Tm5vTHAreUNGWlVzckN0ZVdOV25EWVJ4K08zZnVHTzhwRk1VcGZBck01azJy?=
 =?utf-8?B?MXQwbnFqRkFUTkJWWHBBeWJ4aXJ1RkFpWmFvb0M3MTVtZE41RVJlSEZPaGRa?=
 =?utf-8?B?TlZxdFdlR3JjU1kvdjU1dFZrWmVpdnJhaExpRWVvNEo2S1FzazlxWTVsdlE5?=
 =?utf-8?B?d2ZFUXBOMVhidU1NNTlSNGVDdHpzZ3BDSDJKWXBrdmNFclh5OEJRNzVZUVdk?=
 =?utf-8?B?cGxLa05yZlRvendsRUNMdlBRaU42NncrRGlZMThlQmU3dFZES3JtbTd2ZkQz?=
 =?utf-8?B?Y2x4Zk9XQkdzZVdrRitseXhub2hqN0JIRUl6a2VmckljZUxKeno2a3NUazYw?=
 =?utf-8?B?YnhCVktEdDl5YTZ0Njd0MGF3bEY2SHJFR0V2cGtRUkR3bHh6dW5VTUcyT0V6?=
 =?utf-8?B?dGU0Y0IzbjRuT3lWWnBueUFKQm4xY210Qy84L3R3b1B0UEMyVjdaZTYwVDNr?=
 =?utf-8?B?ZTJmOWhaVTdHdStYOFYzdVV6cXozUWtvQTgweGgyclU1WjhtS09jYjdwQ29S?=
 =?utf-8?B?TkI4bzV2UHlHUUNkbVFQeFBTcGtWenJXR21DenowNm92eTI4WnAxMmtNQWN1?=
 =?utf-8?Q?jOgEzJuAZJi7DRbk=3D?=
X-Exchange-RoutingPolicyChecked: fTiMaOhGWs71dUYHK7CH7ILwx4gEW+qUNNh9+eS4de4BZZqJAHnEgWIYGbUZc8AZa4w6eTU8xl58dcOrT0/aB9VGsDwoFNyc3GF0WeP+F9VzHTrM5N455LXfins5SEA2Dg3EafWUgze80Kkfwu8FD5LBgUN+qqoPE4FXfNizDJ9ToSxapHWwGNBCrkr69yLJdPQ7cdrx1WF9N7vWaF/H+3IMjlYLgrdBmVCclhZHqVrB3JVo1WYzDmNlHWtHdwtFKIg6pzQ/CtInB0GCoXB3Y+GiVVaXY7uxV3ECcDvqlslqiT2Jbc+EWsyX9svJZIrHTq9alvJXbBr8ImQk2Op4Ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: b336deb9-b757-4ddf-d1fd-08def89b4528
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 17:58:09.9686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVStWlYicPE7VpaaxX+yIi8Z23D9Y3Qmsj5UHCo+QgyJbDk8e6Cs3s9aV1OJ+qdUyklgZzxP1V47NAt2+drkFrHqnC0AvlviU9Tjqdy5cCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
X-OriginatorOrg: intel.com

Hi Richard,

On 7/21/26 7:10 PM, Richard Cheng wrote:
> The MPAM MBA enablement carried in this tree exposes memory-bandwidth

"this tree"?

> allocation through the resctrl "MB" schemata, but none of it is covered
> by the in-tree resctrl selftests: the existing mba_test/mbm_test are

...

> The tests are written upstream-shaped for eventual submission.

"eventual" hints that this submission was not intended?

> 
> This series applies on top of the 26.04_linux-nvidia.glue.others.
> cpu_less.hardlimit branch of
> https://github.com/fyu1/NV-Kernels.fenghuay.baseos
"this tree" referred to by first sentence?

I peeked at the first test and it seems to rely on features that do not
exist in upstream resctrl, for example an info file named "schema_format".

Considering all this I do not see this as a valid upstream submission.

These tests do seem useful though. When they are ready, please submit
against "next" branch of
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git

Thank you.

Reinette




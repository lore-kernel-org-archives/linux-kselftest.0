Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42173783DE;
	Tue,  7 Apr 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591935; cv=fail; b=EkqFExiIJ0Uhfioe9ZCk97+f/yN+D5w7XLwx/FgefNeaKjNYl/xvqGMv1QO7GV8V30NahyUSHshDBJIPn8duueBBoHxowMYR+airK4ycuAKgumGvy6AxTpzk6Mhzy5AmuOH085LaP/MLDl3w8mYXo4Qk43DS/dcLFogF4eeWir4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591935; c=relaxed/simple;
	bh=NcykX5gIqERgVlXXLfADAn6a79pwybYgWxUxNFpToF0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F+gmkyJPonb5+ZNMMW2/FZIl/i1aA96Bqcil5RTvAIyW6+nGDo9+9RswndmJ+1t/HUmVO/Ouy6H4MNsh7VasT/5uvbuGnbpANuQE9S5oZgX4BEyhBROa29DWN54e3PKARO32VDX8Xga8qUE9vElExra1zH/tF9GRqsc3RgagpSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnHC8jE7; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnHC8jE7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775591933; x=1807127933;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NcykX5gIqERgVlXXLfADAn6a79pwybYgWxUxNFpToF0=;
  b=cnHC8jE7wdfbJ9b9s5RFmGHl5ehALCBXIHsCEcNFOXtYm5OnPKTCWRMG
   oRcAGKxaXTc5cE3sp6qCgT8wvNgz25/GrHn0LRSSL4TSbR0RbAGNOl9VB
   0Qd5SvvizlXxshlsofnrePncgjrnJ32teBvG4dfSDrUZB+kylCtDBBovn
   RJh0RJq4rcyBBXgiOqejzshzICdFgk6vqz+yHT7yokglXaQVE7vFTVsVF
   YCJtsDWyabqqXQB+EFc2xoO998NEFjYX4zQ6oLuHVLErHiXoFCpqpkPtr
   ZVQPCtgb8NTuizdJAaTtxgkW8BmUwDcoHkV/tuB2+JsFg7WR824IolhKD
   A==;
X-CSE-ConnectionGUID: l9o4QDn5Rh+34V/4r/RUWw==
X-CSE-MsgGUID: PNhQy2bURaWRPG5StP3b4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87639581"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="87639581"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 12:58:53 -0700
X-CSE-ConnectionGUID: 2pSsdcVxR5WzZ8x72byOOg==
X-CSE-MsgGUID: W2hb24XjRwSQpwogE4mbDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="223491120"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 12:58:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 12:58:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 12:58:51 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 12:58:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjyCisycg1y1Fx6tDBvzAn+B+Fevo/wMYLPxa4arNy3JsavT4P28E0gqBeLu8Zriq8vI2ASzh6j0lGxust+d3Al9eda6rzAHNcr4t6EOk/4MQXsrD7lCP54GR81ciPSjwMeRnJ6Y5S6RwDNTWHNBYGeujSYJE4XdokLTd08ZclzCrh+2XYLi+oHH9arxwezXoWXwnDIxnNy1srCfAhXG3lhiEKQhZ/4aFphTNFqjrrE+t0uGrgkkmnw7yIgt11t8rXeVRMEXP4+fFrziRRScnfz36ei+3NruG5lfszi1gcANNVZtUsX9BQalJiRoi+O84u9LmwoRGKkxJjyYppXOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anOrB2jmCZIuDn5wypcgOjs0I9E8mFAw9wj0fy5PvGY=;
 b=ZGC0lcHzq4JHOCbgGcqLT8+loQ/B7QFlEe6IFBCK26DNW4wJC96iACKbgAsL81vy92ULh5XIfP6Qj5zAV1uINfwb75byKZN1EC4MKhs7M1kTgjZQESYAqboQ7eylfLipf6jCJKidN3pgngH9icGoCb1iX9oI3gKgUk948DBCXGSOCsKjhrl/gZ7ncpzFtwI0CUXZVKAZbWmDNcFnN2Q4ztcH3jaDu6jB12oy0aqiAL41vSWSJDIZSNl8vxODV6yRTAISkv5zmrATPA9xGjHu+/G5JzsGfBNa8brcoISnqfUUiwLGXwKn2RdBJOuX4BTE0r5/H98ki7SVbO3DoSniJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 19:58:46 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 19:58:46 +0000
Message-ID: <02369542-cd43-44f0-9e36-647db7908b24@intel.com>
Date: Tue, 7 Apr 2026 12:58:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] x86/mm: Cleanup comments where LAM_U48 is
 mentioned
Content-Language: en-US
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
	<houwenlong.hwl@antgroup.com>, <dave.hansen@linux.intel.com>,
	<ryan.roberts@arm.com>, <nick.desaulniers+lkml@gmail.com>, <bp@alien8.de>,
	<will@kernel.org>, <maciej.wieczor-retman@intel.com>, <david@kernel.org>,
	<nathan@kernel.org>, <justinstitt@google.com>, <seanjc@google.com>,
	<perry.yuan@amd.com>, <oleg@redhat.com>, <tglx@kernel.org>, <hpa@zytor.com>,
	<james.morse@arm.com>, <mingo@redhat.com>, <akpm@linux-foundation.org>,
	<jgross@suse.com>, <peterz@infradead.org>, <morbo@google.com>,
	<ilpo.jarvinen@linux.intel.com>, <xin@zytor.com>, <shuah@kernel.org>
CC: <x86@kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
References: <cover.1775581451.git.m.wieczorretman@pm.me>
 <bc0901ae4561a00d95f99daa3d5d7406cf58aedd.1775581451.git.m.wieczorretman@pm.me>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <bc0901ae4561a00d95f99daa3d5d7406cf58aedd.1775581451.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|DM4PR11MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: a92070c6-e768-46c0-b74c-08de94e01413
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 04cyNKJjYjURyr9NRg/GbQ1VQ6xH7HK1kUeCWM4I8PLRPqL6egn43pjPIKpY/Jc2x5MVeDSs+gxoAeRvbsXdm5XYDRMklDN0lyMILLaAcdawtj6sBH/08GV+CDLyVGbo6VNZ+baRN34+Wf6ibD8A+rH7vVS9oytHslRhE9jwHwZf9nFGbw0FDssVdmL7FxXbGQyGOfGPzYagZhqSapHG/X0N3w3Cp8sXSYSTWJpRcVz4klNZgx0q2FpJx7cOM7jdtPlECVULzxklxiAiXj/S2zi1LCR914rOIC2Cm1foccz/ggAoO80bzCmO3XckXlfF+N4BWI51Ex1d4t3xtqLp14GVf3yaYC8NOnTUlm9P61sIzuNF7kCXhDFFs4OkX9dmUdfmd4Qq7x4cp42PFzvlI0bU1BQ2tYVr/uF9aYGrbDXnzz6VPAyOfZUAPrjgSEouuCe1+lMFtf8M7uarY9fWw7WunSfArfU40aVeNGoz686M5JZ2XhVAKme6Z8p18uPCFppF85y9vE4Rp5JGg8KWmmKarhCFa6+kGjDT3CUTlFpGKhFPqnxJvYYx1OoyIHFJOezXGICEiRZhuanNZhNvU0S+GdwznWNBO2wnp46d2nn7qzqb2WSpEnbx4VxDpPUqYD+maWRzye24Q3cuYRt+hJB6WPOzmc7EhhltW5FH/ZutXGVkx3BUxJQD3UWDKsrRGgQXxKsR+1jJqvuovEG1GE4pxTqsAtcUqxgYyzJxJW1WzB3bHXTxKV66GJfaLBiYm9mcEFTgqKnWcuWvn5pkTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFFLb09DakZnK1NBRE9BcUl5VXdZbTNtTVN0ZUs5U3crUDl5dWFHN1F1UW5J?=
 =?utf-8?B?MWVoR29wMXdOR2lGY0tJcG1TM1JWR2g1bkNSSGMvWFRDeXk1eFpTU05uUjNn?=
 =?utf-8?B?RWdac0tYMW1MUlZiU3h6enMzY3p3Zm9Gd3FqNE83QVdFVXcvZ2pUNExkTzlx?=
 =?utf-8?B?eFhMWHBSTStnZ3YrdWhZQ1hmYituZXBSR3dheDVTQVhMdEJua1p0REVGM1Mx?=
 =?utf-8?B?Q1Z0em83aTBWcVlNVGMrNU04WUFIdkZMNWRnSjJQajBPS0xVQ2RadnFqSGhB?=
 =?utf-8?B?ZXYxSEl4YlVwOXpRM3ZkMG5qUktpdkkvbkQ2Q2t0M0gxRTdiT3VGcUM4cmpC?=
 =?utf-8?B?b21pQXE3RjE4Vk9lUTd1ckpPUGxYUEZPSTRlQTExTjRXbDNvOGZHS2xUNEda?=
 =?utf-8?B?TzRpK25LNnNKR0JGWjJOSzVGc2p3UDJaTEhnMVpwR0NZaVI4allxaUNseVVI?=
 =?utf-8?B?T2ExRlZ2c3U5WlFUaE9EVFRSRkFZQlR0ek84SUR1UjZXZmg4Q1IwcU5DbFhV?=
 =?utf-8?B?ZU9JaU5VeFJ3eEcrUjlKYzQ5ck13am56eDhKNmtJODM2b0ZYZ3JzY1IwYnNW?=
 =?utf-8?B?REhwM0NLNzZiUHJSdnVQbHZEazdJbmR2WHljNGJ3blB2VXlLMG5OWDB0bHFK?=
 =?utf-8?B?c2lCY1crSEp2NWVvTUExU2crOWNPUjVVYThQQXNMc2NMRVFraUwwbHIyL281?=
 =?utf-8?B?WlVlZ0N0Njk1T1l4MVR4K2xDTlowOUhvL0dWbFEydjRxd0kxOFFhaHo0STJT?=
 =?utf-8?B?NVlXNmxkYXNyQjFRR1RYOWZLRlk4NmNzRVRwZE12MnRCUS9DRE9JblloMkxW?=
 =?utf-8?B?R3pnMU1GRlVHWlZuRWZZd2I2bXJLRzBXWnZkNE85YW1SQ1MxcitnTDAvV1dB?=
 =?utf-8?B?M3pNSmFPcTRyZUxYOGVHMExOd21wbkxRS2hWU1NoNmk5WENHV3JQalhVeGhq?=
 =?utf-8?B?TjlQc3BkQmVLVHVEb1B1OGNUUGJLNEx1OVU0RlkzNUF5K0tEWUd2b29DOHdk?=
 =?utf-8?B?YnYxOXA3S1hpVXAwNDdyb00xMHZ4NTVBK0tweWtkbTVvR2d4MWI5KzgvTjA1?=
 =?utf-8?B?eEtJeWlMWC84UFpvS25HWWpOUnRlL2hxQjBEVGNuNVd2bzBTY2F5aEFvR2Vy?=
 =?utf-8?B?VTd6bm40Q3pET2JHOTRRN2N2d2FvVGI2VlhxNnVUenkwM2VNYTBaRnJSODNv?=
 =?utf-8?B?b0ZrNmswc0szSTZHdlU4aHhtR2dCN0lvL3orazVJUUZGWVhqdVc5QURqZ2xV?=
 =?utf-8?B?elZrS3B6c1VFaFNBTFpsYzhYVWErNU1lV2l0Z3ZGM3pMM1ZWWGE3TlZqK3Ur?=
 =?utf-8?B?Rzg4cjhyenoycFdkanFYdWtLa2RJMUNLa0NLMDNPMGRoLzZMVjlwb1d2WXBF?=
 =?utf-8?B?ZmJFWm1qUWhhZXNaR3dTeWZDbThKNll1UEMrczRnZkd5MUZNY0V4NEZxQXdC?=
 =?utf-8?B?SDdidEJlSk02THBHckZuZHlMZ3FSeUl4YkxOTzMrallvV2lsV1cxczhXTWpm?=
 =?utf-8?B?K290MFpzUVhPdklyL0FPemdKSjZ4d05Ld0hINDhPNWxXaUpqK0R0T0pqL0w5?=
 =?utf-8?B?cHdHNFlXSW5Vb2lGenl1Q0F6QkZ6SnNFV3YySWlaVUI0NGxsbzFJNmlQa0xZ?=
 =?utf-8?B?WGY2c3ZsSnNkM2VwL24vR1ZHdUtVVVdsWjNYQXlFQlk0Z1BBek1OOTVOb2du?=
 =?utf-8?B?T1ExU0dwaFRHalg0d1EyWk40YisyTHM0UzFrdVFNaTNqV2dlcGo3V0pIcHhk?=
 =?utf-8?B?ZVkzSmttNkRieWgwL0YvOStuL21XY3h0eTdKd09NVk5YSFA1Nm44L1J1a3Bs?=
 =?utf-8?B?RGRzZ3ljbVZoeHJKNzNBck4zRElZUi85NXhadGluRDd2T3FENVc2SUJRenhp?=
 =?utf-8?B?clhoMUJjK3Q0SUd2VHpaTFFRUWtDdGZ2d0Nsa21vUVRRSml0WHU2VllHK0la?=
 =?utf-8?B?R2xLSXpEVnBxa1JKUmJZbHB4c2IzRmlTVjJPOFZnN1ZqRmJ3eEJtTU1jVFNw?=
 =?utf-8?B?ZEQ4YzZpdlkvSk5Sbk8xc1VtVUdoR1Bab05CS0NqL0wwTlBaRTA5amY1N2dW?=
 =?utf-8?B?UDdXVkhDVCtjcHJiWDNTYXlmV0JvTlNMSkdIZUFKMms0alRKVlIvaHRGNXZE?=
 =?utf-8?B?OE4wTmNwalVJbVFhQWFiK3YyVTZpSGVwUG8vb2pLN1diNURndkh0YTArVklZ?=
 =?utf-8?B?K1Z3TVk2ODhlV1VLSDhXNlpUUENTZmg5emE0TDh3d2M2TFlUb0Z3WThTR2l1?=
 =?utf-8?B?Q2ovaCtlRFdjd3dRTjI1Z09uS1RRNVV6RzYvRFM5MyttYVdjTGl5aWFuVHN2?=
 =?utf-8?B?M0s1WmdvakR6QXFCRVJHZ3Ewd2VTVUlINHRweXVhQjd0RE13aUUxQT09?=
X-Exchange-RoutingPolicyChecked: bgeS6xDSYJrdopcr79CssFLmXhH2SNF57W6PqkUTK1oupOalSGzjCLS1sIA/JB0P4lSxdKMSEoLkPxdILxP49H5vp5OHh0s3S+ldeDBIIcYicZMgdp1wp+iMGVVbwk6UukaYzjn5lwv0NrobA1BHIEDUAK8x0rmnM40/z7ZQepGuURUQSBV0jS7Tup58jlTEAjSKC9SZl2sgfwEc0uV65+oowx12Kv+IzPMQSI07M1F/z6SnOmDeOIrI5ayJXrrEPpaQYTG/TrYFIiwOuuzqlaOLypGJ2VRxfdQSAcu24Z9ECqd4DCAbEqOXF34NvI0hpXjQBcVbu+hZN7wFibzJFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a92070c6-e768-46c0-b74c-08de94e01413
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 19:58:46.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEvwMTHRfKgI2CigyhoB1cM9HiufbTVmnWAxgY0xDccD+XJ09cNTGuaWkILF1kj3NDRPHw71m7ZjqufHrwPPHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
X-OriginatorOrg: intel.com

On 4/7/2026 10:45 AM, Maciej Wieczor-Retman wrote:
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> 
> For simplicity only the LAM_U57 mode is implemented in the kernel. No
> matter whether the enabled paging mode is 5-level or 4-level the masked
> tag bits are the same as on a 5-level system.
> 
> Remove two mentions of LAM_U48 which implied that it could be enabled.
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  arch/x86/include/asm/mmu.h      | 2 +-
>  arch/x86/include/asm/tlbflush.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

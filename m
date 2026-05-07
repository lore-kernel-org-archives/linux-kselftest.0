Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6D0421F06;
	Thu,  7 May 2026 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170451; cv=fail; b=V/BiyZKg0Pa/JmoZCSeQn1vfnejhhiNqBM/PO8+vQyB8xhyqGEbxJhNENY57wH17iqbo6vsWe6EUtKMVUhVm1I4NbR/fx3SasIFW9K5XI4eAAPfcKexlwDwpOGJh8kcCdlS1wXiI304fx60fsJwMXt1qf5TmeSY0rHr0BL8KbVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170451; c=relaxed/simple;
	bh=ex8pDV11kQntBh8nRv7SYGa7jxm9fmUFHmdpXdbpepo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V3IdQgNzC9l4aR91Q16WC7tmjO6gWSidsTNb5RZisn0jAiZXG58b93yLHtypzbytBQ1CyrNWZIq+LiTMwmLyFJnYYBfVITLkDWph8Yg0t6PxkKsaLOinLW7pa7cAU7/pffhXew3fa7UYX1/ynw/DexPOIhFWdSQoiTD2FvmRPNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdrxC9tX; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdrxC9tX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778170449; x=1809706449;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ex8pDV11kQntBh8nRv7SYGa7jxm9fmUFHmdpXdbpepo=;
  b=GdrxC9tX/N+Rt3HaNFTEg1h0zuSViNH3VZbvI677bkYunY3tbmLryMA1
   DM+oVB2YrSo9PaqyNrN2ELvWxHjJSOY4OlpMnXe1HnfxJC3rotnOguEOv
   G5duhfR+Yih3yYiY5mIDbMbtBU1x+worekqQFXFTD/HExW5TF4b+80o2a
   NtDy3N8gvKW0DPlsz9v4SA4Yb1A/7FeAzIDLHafRO9WmQDQwAmTUc9OOY
   X8EmRCW+jO3cp85AILv7HSeMQ8czm6vdki3SteYRQXR96mTf+AAFGfo4O
   Hx6MGXE4bsiLukPcj2Sy3DVjLF53E8+EPKPMFtvADZkaAK/IBePHds+pA
   Q==;
X-CSE-ConnectionGUID: VtP05nUaRUKXcRmKGaUNfA==
X-CSE-MsgGUID: ekuS1bflSsav7VWdk8MBFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82996260"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82996260"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 09:14:08 -0700
X-CSE-ConnectionGUID: D5iYOKRBT2SYdvyKQOFnLw==
X-CSE-MsgGUID: EHpvgogtS0iJRv0w/CEbDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="240837540"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 09:14:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 09:14:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 09:14:07 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 09:14:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+dalqwmXf6gyXqC2TeGnAdecGZQCOC3ENKuvsuZOHd78FvhMowIi4b1qndhwBwb1mwDpJ6DLbqsXeClXYpuVblrnC4ZOWCJKnIcPZXe1giwZ2Luu+Vi1AcauCGFPYTSJDKLJ3l9wa7fC1LV2bWnd2Z66NY9bZ1ChIaDpJFmlIEuzrhDyf+mtETIipv4RzABXm2FQpcNgVBaMRwcgFXKkdVX0PYvHC5Bpl+p8JfDjVeS9g0fitJIeAfgNMaLSZdl01IP9fGqLCTolQ/GmHhjRFWYJpo7zWPLjDw7qTMy1JIEHlipICXC4p31RcbUxEcsu0d9G20tJfb6Tay9Ah+kuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7ZEP5OrzgH/g3NJWlrSiw3vSYgaw/8QTLE/IGr23w8=;
 b=DObj+VEhZqx68toy0czaiqor12jmc94Sv8O7Pa4ms9pOe6fwi/joYjjyiUhgVfDlz26OISF4eewQsIPgukIhlBGYXccqMNaEXA5U2LIfZqNHg6cy2P72pI60cnwxsYJScc4HlR7nMFc5rnNWfIAJIfmEqesx3cdEKqWS43xNzbriPkr2+QJhAPGVXgqwd6Qps2UHBSTNiG2oMAjf1XURNxgCBOlifIfjSlfko/jeoSO5/SBWPYdlsgb5sHMhDPWXdG9lYugxvplZD0gseOUArOWHudBm3jskLJqlkOX2j6jM9uhoErSh+h2sVm1+CE5HvxbiyQvdTnfbXlocuJgK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 16:14:02 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9891.015; Thu, 7 May 2026
 16:13:59 +0000
Message-ID: <4d600e39-686d-4f0f-8a74-6d55bffac70a@intel.com>
Date: Thu, 7 May 2026 09:13:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] selftests/resctrl: Introduced linked list
 management for IMC counters
To: wuyifan <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260410093352.3988125-1-wuyifan50@huawei.com>
 <20260410093352.3988125-2-wuyifan50@huawei.com>
 <b1d3a653-79a5-44db-8d57-c052ae537823@intel.com>
 <e4a2b49a-0efe-4942-9683-9c9a5af1b12a@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <e4a2b49a-0efe-4942-9683-9c9a5af1b12a@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:303:b4::20) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA4PR11MB9251:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f22afa4-c223-48e1-b8fc-08deac53a5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: FlahzumTjxuEUgf2wnsrHp2ZK2J9zYIcCViZfiB+oJLLjfcaotNdiDpD80CVv5VIf+J23TqjU99WgHmz7AULXfb05O+RnZl37gxwUlDIJcg1v0ivgJ503i+GuKppf+8KJ2MOFkCmANcHQIrJt+c14lp85cjOJHsYa75/dBwTbAPNgbwoSKZ5y9gua5OVjUIKar4LMTiwTeT8rygMyd3nMwO45RKT31vhoXV1VBbNUL64bKbDn3VhvtVInr2oLrUSZJ77mtzFcHxVPijf0+YvkIVOAichDvppy3VLq03tMghu0CFuKvWXIQnbriHPdl52FZeYhJdiCgJPJqVN94rsLjQOfF7Xk8oBun0LEmA+eABOxWX4z9M2+Y7i0f/YHmFnJM3R/dP7tGwKLoMBHUBFpQlv+2qumz084a43aCn1odI39xin0m4Z1VvuvSPt51IXuMs7BNlqtBc2+UcTgaRjWSnyqo/bDaoe3UQqBUsXzbDhZQTaelkjWYWbZzrtETW6HRh4X/kBUUH/TF0+Epuk7+bqqlUYV22fivd2GLXnK/PRm5lLhIH0X2M3clXBhxuUpC7Euqca5Ud+/rezyJ1oU74x41YCgJnUO1TO3J/VLIiqG3AgySUAuGHFNnKG7B8GOrE1wxxUBfBlsCzvZkxRlp40UBPqbl/6REFgpAFoa9MfhDDyrrnFwEEyMWsX/z5OnGclBl4K3eN8UDfI3saBdyk85xtG9AZX2Vz0YETncy3+WgRa+hjTsyyfHgmmjYOn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(56012099003)(18002099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODhMcHdIR2ZkMFUzUUN6R0VEOTBLQm1PSC9kRFlESm16UkRvM2haVVZKT3lx?=
 =?utf-8?B?QkxzOVpWbG5nRVVPeWNxTFkwTW9FN1REdXhpdWU2amZOQTE2dGFQK2pCeWhK?=
 =?utf-8?B?Q09iNGZzSDdCYWtwaUtmZXlwQUplQm9ia282N3B5c3dsYXI2MWdFKzNuQ01y?=
 =?utf-8?B?SVIwNVhWNXQ0VE1ZWE1IZnNPTVVxZkFBSHBTZjBCaG16NERZc3d0VUxIUVRM?=
 =?utf-8?B?OVNISXVuYVpZUnZrbXFtd2lvUUFNSS9LV2dqRGN4VFZSSVJKU3ZVV25GZDh2?=
 =?utf-8?B?MWUvdGpuZEh1UVl0cEFpUS9wYWMreTliOGRzWkpmWjBGK3c2a0lMK2hRdzk2?=
 =?utf-8?B?RExJNWFvUFord2VmanY1M1A5cThsV0tqS25HdnBuSHBTZzJ6V1hqL1RUZEg1?=
 =?utf-8?B?UzNWNDZsSFZEZGFKMVRUam1WdGJaYXU2Uk04RitMZUx5NDhrUGEzV24yZnox?=
 =?utf-8?B?SjhUaFRYcHRGS2VEMW9OU0gxOFZCRStZTzBjSXE1c0ZndCs0L2thNnZjREdG?=
 =?utf-8?B?SFp2bW1ycS9NVDFJdHR1TWVGeE8rYUFZT01uTzVLdW9VN0RsR2RxMWhZVXpU?=
 =?utf-8?B?MXlTK0V4RnAvN3V5cEFSTFRZcDFybzhPdkNvUWhreGs0RVV3OXliUmJrTWZ2?=
 =?utf-8?B?ZlhSUVRuRGc5cFAyMDM1K2RmVHlhdFFieHdEN3ZWd2hzZ01ZVjBSa2tNenFX?=
 =?utf-8?B?TjJJQldRRGVNRzBrbTZJMTMyblNNR0oyYSt5ak5QN2F6YU9hK3l2SkphOTdF?=
 =?utf-8?B?QzAxZWhkdTVXQjFSMXNBZytrdlBvTFlPNEFEVi9CSFV6QXpVZmpTRjRxUVBV?=
 =?utf-8?B?Sk44Mzc2VElXeCtqakw4VHNDN2g0ZzJPMkxQMC9UVm5FSE9SSjF5VGdqZGZx?=
 =?utf-8?B?RkNVWDRHcHE1bTNsY2lBQ0g1eUhZc0Z5a1luRHVjeUtuL1VGV2lkTmlZeEMx?=
 =?utf-8?B?NWFUWE1JSEE4WGdFZXZ3ZVo1bi9VRzNYaWIzMEhzeEFTbEFsbWNCZmtmTC9I?=
 =?utf-8?B?Sk1JUXJPUXJZeUVsNld3WExsL1EydjdlNHpOTjZ2L1FzdmtQUlY3T2pSUHRJ?=
 =?utf-8?B?T0tDWFFjUC8zL0NaZEluamVkUzJLUnduOXYwQ2d5MnFOb1l5UXFsS3RqWUg3?=
 =?utf-8?B?RnYwd2ZCeW04VTdvWEdGSnY1WDJwalcySmlPelh6b055ZWxqTjZ2Vm1CN1Nr?=
 =?utf-8?B?M0JMN21SYVlVa3lrV2dPOVlEMWVteFFid2d5Rk9pTm5EWXlnQTVtZmhFNWxD?=
 =?utf-8?B?ak9QN2JQeDFnemgrdWc1cCtaUkxtaFIvOTZ4RFZmOGN4VjNwdStBenYwTUVY?=
 =?utf-8?B?aDhlYXkySXlieDJDb2ZsY001TXNJYmd4cXc3cDZqSjl5eEp6aGl4T2RKUHFz?=
 =?utf-8?B?aFRHeXUrTGRLdGwwZG9LRlR1WE1Ka0puZWpvM2paTlpBRFRJS3FKK3FjbWRN?=
 =?utf-8?B?WUd1MXdPMVA0T1MzVkN2YlBIcTM0SnRKUmtCVkZPMkEwb0NmY1YzdDd0bm83?=
 =?utf-8?B?bi9IeTdaTmhQc1VDWHMzbVRTbGRiVVMwMXRZaVdnY2pSQTBxYkQ4bXE3dHIv?=
 =?utf-8?B?Z0hlT0tnM0luUWxBek5icU5aK1Ewa25jNGZ2Uk90ZWNkOFFOcGZyWmlKQkNh?=
 =?utf-8?B?TzV4Uk5xU2tFckVqVzh4Nk9hTk5RUHU3MlE4a1IzSFJMd3JzclhacWM1UXFT?=
 =?utf-8?B?NnNtd3JBNTR4dmtjWHdTeGZvN01EN2lSOVppaGFCSlpZZENUc2lXMG80VjRV?=
 =?utf-8?B?QmJwMWR6ZDhOb1lIeVN0T0N2V1A0YzNWL25GMlRwdlhMbG9VMmVkTlU4ajBR?=
 =?utf-8?B?Q2RiaEp0NTdDRFNBS3hUeDMxekp6eHp5YVVRdlhHbnNSSWZkZFR3MzRjZ2hs?=
 =?utf-8?B?OGoyOUl1aGN2WGJBSmk2RW14RnhrR0lLdGI3VWpEMnkydDlDZTZudW1YNVNN?=
 =?utf-8?B?d2UvdXFNSHBsdGIyMzcyNGtlVkdZTFFpY2lvRTJ5Snlib2pETjV0UU01Q0w2?=
 =?utf-8?B?K2lhdGk3dkdKV3FKaHhlOURNR1RIZEh5TUFZek5manlFYzRZNFZQcDRNQVlH?=
 =?utf-8?B?Ly9tQmU3VlFEUGFJZE5zV3d0TUlaUXIzRC90ZkREekpIREdyQWE2b3pSekJq?=
 =?utf-8?B?OXFMUjhmQmwrK0QvMGNUdkswaGRtOGd3VWF1THQ5VmJVckJ0a1FrS1JSajE5?=
 =?utf-8?B?b25KM0JvYUZXZHBRYjRUaklaWm5xWjZyd203UUloWnN1N1NLa1B5L2I0SVBG?=
 =?utf-8?B?bHNCUWdES3gvcVUvUTdCY1pNMmpJN0F5MWRkV3BOOGN1NU0vOGp3cC9lK1Vz?=
 =?utf-8?B?dEpvSFYvWWhUTHowbmJJZjd3RnBNQnpUWDhYeVF1OGlmR1ZVSkpjSDdBSDBw?=
 =?utf-8?Q?buzJ6IbXUvfsFF50=3D?=
X-Exchange-RoutingPolicyChecked: cGGazu7AoQvrKwzEGLq47r/UiPhX9WZsyo7qBndA7mIgued6KeY0QAVeZqUc7LaqFKnZlMV3ATxLRdDYvvbmxX4BlRAkKUtH2u6YA/JC57zam/3aHDzI+N1jsCZu7FD1GJ6flYi6yTFM9NLHa9G4LptUFOR7Eh+qmZfk0TzO5Eb6agagGe5jXY8jdDkk1aq2wWhB/Pb3qRNkFQEG40HwoT5IpGxZsDoXIWDoBCZpRhlSr03ZY491rmxb6Myt2fslUl+CX0gRZtCbz2X2+PfQANRuReM+F1gLyBqeHUGkLsmtZqC3kE6qqkrb2bpAz1qyUbYFR75w3CObn6HgAI+CKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f22afa4-c223-48e1-b8fc-08deac53a5b2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 16:13:59.7078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/8I6Edjqt2stFrSVCY6uGDqLgjxHSYOkQdVnBOLuvGcmbSH2IuXrjY7lE2LLwGUyfMypqFvELxOvsxjKovMs19kSqugDuhaY5bDAtTg7ZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9251
X-OriginatorOrg: intel.com

Hi Yifan,

On 5/6/26 12:17 AM, wuyifan wrote:
> Hi Reinette,
> 
> On 4/23/2026 12:02 AM, Reinette Chatre wrote:
>> Hi Yifan,
>>
>> On 4/10/26 2:33 AM, Yifan Wu wrote:
>>> @@ -113,6 +115,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>>>                       unsigned int *count)
>>>   {
>>>       char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
>>> +    struct imc_counter_config *imc_counter;
>>>       unsigned int orig_count = *count;
>>>       char cas_count_cfg[1024];
>>>       struct dirent *ep;
>>> @@ -167,11 +170,17 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>>>               ksft_print_msg("Maximum iMC count exceeded\n");
>>>               goto out_close;
>>>           }
>>> +        imc_counter = calloc(1, sizeof(*imc_counter));
>>> +        if (!imc_counter) {
>>> +            ksft_perror("Unable to allocate memory for iMC counters\n");
>>> +            goto out_close;
>>> +        }
>>>             imc_counters_config[*count].type = type;
>>>           get_read_event_and_umask(cas_count_cfg, *count);
>>>           /* Do not fail after incrementing *count. */
>>>           *count += 1;
>>> +        list_add(&imc_counter->entry, &imc_counters_list);
>>>       }
>>>       if (*count == orig_count) {
>>>           ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
>> Should cleanup_read_mem_bw_imc() be called on error exit path?
> Thank you for your suggestion. When parse_imc_read_bw_events() exits with an
> error, the linked list imc_counters_list will be cleaned up in test_cleanup().
> 
> main()
> └── run_single_test()
>     ├── mbm_run_test()
>     │   └── resctrl_val()
>     │       └── mbm_init()
>     │           └── initialize_read_mem_bw_imc()
>     │               └── enumerate_imcs()
>     │                   └── read_from_imc_dir()
>     │                       └── parse_imc_read_bw_events()
>     │                           └── calloc()
>     └── test_cleanup()
>         └── mbm_test_cleanup()
>             └── cleanup_read_mem_bw_imc()
> 
> Calling cleanup_read_mem_bw_imc() in the error exit path may be intended
> to prevent resource leaks. However, this results in the function being called
> repeatedly in both the error exit branch and test_cleanup().

You are correct and calling it repeatedly is ok. When cleanup_read_mem_bw_imc() is
called from test_cleanup() after a failure in parse_imc_read_bw_events() then it
will find that the list is empty and just be a no-op. This is safe.

> 
> Is there any specific intention behind calling it in parse_imc_read_bw_events()?

The motivation behind calling it in parse_imc_read_bw_events() is to not leave this
memory allocated when this function fails. A function having a single responsibility
is easier to use and maintain since a caller does not need to take into account that
when the function fails it also needs to have additional responsibility to clean up
the state left behind by it. 

There may be some patterns where caller needs to clean up after a failure but that is
usually done in an obvious way where the caller _immediately_ does the cleanup on failure
but here this dependency is well hidden in this implementation with test_cleanup() being
called so far from parse_imc_read_bw_events(). This hidden dependency makes this code
difficult to use and maintain.

> Or should the cleanup be uniformly handled in test_cleanup()?

Handling it only in test_cleanup() may work in current execution flow but if the code is
ever re-factored this would result in a memory leak. It is not custom that callers need
to clean up state when a function fails and since this allocation is buried deep within the
execution flow I see this as a latent bug just waiting to be triggered.

Reinette


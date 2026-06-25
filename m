Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962FF2FB969;
	Thu, 25 Jun 2026 22:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782425664; cv=fail; b=KGzJtCH8/QsOCPUyrDNwi21yGxWn8V+k/a0yfZzmRPKAsvWRvPLatEqgvEGLA4sz71VOIgb7f/EaqqOWSZ9ks3t7gVBC5n7pczF2ApK1L/JWQKo7TdAAQiwvfJPlQjVlIMfosd45rMJ3hxvuCxBVNcFpuzdkvzlNL7IQO7dPG1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782425664; c=relaxed/simple;
	bh=8GNQZ/EH8WItvDn6Ul09tRI9skPL3+kmpqYSs6CzKTI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QKb+qGcTD6hssZ1Nk/8RKNvpZbgoAbhFkyF3hCi1rRmIm3suqUsia5XmV1TUYmA0lL+FFQ9dgG0PXxauD2tOvoZ35CPQyUheIv7M1nx3phl/4xXDZsdEjil6+0XJlvEnjK4sru687nKiu1lEPDKLtq0bso2zXvt0pvQefv0B/gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCNpVNh8; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCNpVNh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782425663; x=1813961663;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8GNQZ/EH8WItvDn6Ul09tRI9skPL3+kmpqYSs6CzKTI=;
  b=CCNpVNh89nsoE4lfGIGWCKc4zloDAhulpXhThmSlRfdinM6pDT+jLEnC
   TEoLlURNQ9aYTu5ahvN/kVSk+ALmorm2gj/+86udj7tmJCdiXbRMnEiOy
   BZWPUCeduoRU3l//qSm8jI0m/QY1ND/MFzMZskd8O1gF7Yuhf+qbgByXu
   uawI8J8OrV6HIWClpEf8aN0dbu3xdy/ugRIcS0ReeQwbH3AqSE6bTmqer
   aPR94BtlPx0dDZ3ZvUhD8Xfem2WX4kHBWFXITb5hyYzEFVNlD5S9SnHIV
   5HX2RwZHQNS3TUdX9ywKQNnF92Cf/Ctkp+fcdK/mdRBf4eTdG71oH8HpD
   g==;
X-CSE-ConnectionGUID: LgnVtAfQQJOJgcHjfw1imw==
X-CSE-MsgGUID: iY9ShUzVSZG2ZmB9f4TPOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83097354"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="83097354"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 15:14:20 -0700
X-CSE-ConnectionGUID: ZPWy2aRpRKiDfRCxu5BV+A==
X-CSE-MsgGUID: et1Yn+6QRJOsOoQ45SBlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="247139115"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 15:14:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 15:14:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 15:14:04 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 15:14:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVB11Kz4RTZMFnzFrs1gFaRH885RtYz0FFyoR0O8YxLxB//T8+2OMxsIHlzelD1a/ATXUkFVmKRdRwuk8TcHwcyQ8z2G7dkqGuW0Gf7ZCn9zLH2RlI/uVUZd+YX74jSQ1tGO/qOyflrOpyJuZ7OOcWao1EKEtNQ8ElDHPksDY8kSkmsZkvgeMJpfn2HW0Fjo8cY8kiRUTuE5ofFFVpYYa20kC9NpU0SSwf3JTR3rPu1z2WC3jx8gGvREs0ysslslYHF5EIBqYgOTTGRQC+Tc3Sjfs91UuBf2sVSIf+sGagayRYWDba4BFaG1D9wUThvziUGJ+1+1OhbhtPiGwY9fiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+Inq7vuSL4uoQ7jANJteDP5/2UtCt+/09fWPVMb5sY=;
 b=Nhu7TsNKBq8gw1sa3PftW96Xqvs5vVCrI53quKD6kLwgynQnedMMI2NicI8lucWYl524S8ct7tOrshJRHi6b6gmA1WWsx/9fX75J7Fm2SZBxNx4pQKaME10700vubdrFL57pI0yfKiF8W4jdh9t0stHrhIy7u3tKFCO6Zihz4CkK0MKkP02o0LJy6/0YKgIdNV6x9O88PoGfUcRl8zChKU9IxSk6FO2pUGTi1R0Lm8HoJ3Q9veoTN6l+nL5NkAdoW72vTj+IQD+8sJLVe7RrrvtLIZ4O8ITnEorOsmJHxxSDTFuljchxeWk8PgrvYVnZXwKAsxsgxx/9PequvXLRrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SAWPR11MB9709.namprd11.prod.outlook.com (2603:10b6:806:4ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 22:14:03 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 22:14:03 +0000
Message-ID: <f7c42bb7-4557-4667-8b52-3db2ab839e16@intel.com>
Date: Thu, 25 Jun 2026 15:14:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] selftests/resctrl: Introduce linked list
 management for IMC counters
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <zengheng4@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260522090540.444554-1-wuyifan50@huawei.com>
 <20260522090540.444554-2-wuyifan50@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260522090540.444554-2-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:303:b6::21) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SAWPR11MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdc01ab-49a2-44d6-2814-08ded3071099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|921020|22082099003|18002099003|3023799007|56012099006|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: y9Xh7RuTq8U+65F5Qw+c2LK76DOSNg4ISgVOCW/va0UxIL6GqjeZNigBffxFixTNjUjIIwmLymvH9aVjMJebu3BRQmCJ7MFpq2CRpvzCJaExJHzauOLaggRWuEYDfWOwnulkifFwBElQSja/HDFZM9vqGs/8ct/mJ0FvrYHCJnRj26zUMeUEYIh198+Zcf8W1WtGf5vbExROc/8RMt6/cxMtBAL0WCJARuPflEIKg9u+wGDaRHrN29EvJwd+hdt8sa6lthpYQJH+PDDSs8UOb15D7aoDapvrpbIUo4NZNXgpcFO6drMusZp1zHZKbIcv9Lzieyt5dxnBrCxlyJqBGZKjkeuBIURhdQAopWyrQfr/PXwRejbgfvZboMRMEkRbtsope1ogJuALJ4XsEJUz3o6ABCaRwbznxGV1ycj83apm+x4bSt1U3q5xbjxoYuG4cLi6Mal4wnyNlLWRwP69XZxTzLpKsg1IrzbYDfU4uIAaKeCd+ndHC3YlwI9B0zJAa7H0EjZoODhbb0XhajvHmwSYN5j2WQu2yb+M6O4AYBdulqnK/A0juuAmxYmKHljVvLsgk6Liqfw324pTF0Mk8rs78aAlVdNzrL3e5vWjGllrMZ47APyBU3jDskZ6g97Xm6cx7figMDsFLPiad5QcnQOJGn3XYaEVXyDWgL2DA8/2uoWLjbxVM12WhGl1yjeCYtJEiRw9FU4aTaRBcZZ0kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(921020)(22082099003)(18002099003)(3023799007)(56012099006)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkRjdFJEQ215ZmNQZG5qY1BhbXJmMDEwU1V1QXlZR3d2aVlTOXgrV1FSL3lH?=
 =?utf-8?B?SXlUNEFhanNVUnY5WEtiVGVCYWlDNXpHdVFSbGc5UGNkTm94bWJJenFhUTdS?=
 =?utf-8?B?UHB0TmtvajlLYXMrUWlXTE5UZGNMUFlZMGoySDl5N0lLaWpHbGEzaGoydklq?=
 =?utf-8?B?MzdEYjlFVE9wQ0FBVzFTNkxWQ3VielowTWt0cENGT3BPVGJ0WHZ6VXg1ZVVT?=
 =?utf-8?B?WXh3YVZDMHRQR2I2SDBGR1hsNE1STTlsZ3hmQ0FxUlRzc2Q1cUhKbENlWEln?=
 =?utf-8?B?ank0aWlaUnhnaWxSZVB6QlNHVEk5YVV5aHp0czIyazFMM0JLZm9BNG9ZUFhv?=
 =?utf-8?B?R2VOR2w2aFRVWThDUUNPZmJ6ZmZaS2lBT3ZKeTdHenYrOE9wdlFLWXowOFFN?=
 =?utf-8?B?d05Ra3doVi9rSG9yQzB2dXBVZVBYR2lUNkdKdDB2TEUwN082L1doTWM2VUNP?=
 =?utf-8?B?ZEhJbnFyVzR1TUdldlYzRUZOTVVRclZ4enkycktHVlpoTndQL2xXNGpRQk5t?=
 =?utf-8?B?Z0RnN0xackFnaVo5OVNmdFcxaW8zU3ozMjF0Yk5lVEllalhabytZV2JUSmNy?=
 =?utf-8?B?YU9BdGNGNmcwR3JudDV3QkpQYjN6UWxiR1JDOStSdlRnQmJNMjAreXR5Ni91?=
 =?utf-8?B?VTlwcDZhMlB2TmdwY21jVHJUZ2NyM24rOXJ3bjdHVndLYyt1SWxBdTZIeWx4?=
 =?utf-8?B?ZG9OTFducHU4LzVBSU9KUzJ2dGdyU1duZ21DQVJUK0xlQUF2R2FrV21YbTU2?=
 =?utf-8?B?SXpvSVZpci9xYnU2QUhPU0p4QWxOZUd6REE0WXpTSGVKN3pTWlMrL3A4QUtD?=
 =?utf-8?B?U1FkSVBHc0hVOVJIR3M0UHA1dENOS2ZNZDh6MW5hOTFqTmI4eEx5OUs4SlFU?=
 =?utf-8?B?elBjcDNxTXZ1N2pqTDhJbXhObzhYVXRVM3ExRVBGQStrNnJib3ZTZllqWGR2?=
 =?utf-8?B?WHdzOUtROFpwcmRESWJ1UlBEUkJvb2FadjV3TFNVOVFDNFhUdHNFcVFDUHd6?=
 =?utf-8?B?S05oaUM2dlhvdjd0RU5SSUpzSWFZSmllcTE4bzg3bHlxMjZYOGlMcDBaalNu?=
 =?utf-8?B?SjVtcEhwYlNMZkVxUmYwWnZhbWo1MjJ5UGlQOTluRGFSTG9MWkRLTGh1bXJo?=
 =?utf-8?B?cktibDljcFI0bFJXVlh4di9CTk84UHorUm1xb2ZreWl3UHV6ZzlYV1p0NlN6?=
 =?utf-8?B?R2FlMlVqWFF1NUhMSG5uaHZhUkdnOVJCVGFKMVNOZUZXMG1qK05oMTFUNHBT?=
 =?utf-8?B?ZHlhUDExT1FYTnloNFZ2QlpESjV1TmRNYU11Q0hXeU5MUUhtaUpFakNLTDNz?=
 =?utf-8?B?WUlZVnFLRndPbFJUa0EwS1EvR0JaOUJXUjlaNUNlbFU4dmxuMVlYanRrS2FC?=
 =?utf-8?B?SVpqTW5wMk00MWI0TENURUhmMjBZdG1kdHl6ZmVlY0tEcVpBTkFnbnVHVVB4?=
 =?utf-8?B?RW5UdmtJWkI5cENHd2V1b2FBUkQzQ01FQXlYbXpXNEpXOWxnQ3lPdDVKdEZm?=
 =?utf-8?B?N25RVk80Ty9iZGxGQjBkYjUzNHVLZDdkU0RGU3c1SFVWT0ZHMVdnbWkxVGlE?=
 =?utf-8?B?WGFuWklwcUFyaDcrNUdTa0x4VzBoeWx5UmhQbC9WY2ZReDBVVjdZUytrY21S?=
 =?utf-8?B?VGp5M1RDeGxLL1BnckxaelZva3VUV3RWZGZHTHdHZUtkRGZxK0R0UkllUDdE?=
 =?utf-8?B?eFhHL3pVSExyb0pkR1FuSjNnYXAvWExUN2F3eitTR3BJMXZqWS92UUZtUE8y?=
 =?utf-8?B?andaSmwraDBkNldCS3lsTUVlK0gvTDFBMUNaL0RwSlg5NUs4TlFjeXBBUEtQ?=
 =?utf-8?B?ZGtXTVdRcFNwcW1zUDZCSHNSeWc0Zi95Z1VtNmNML1Zib1NzK1ZPN2xOMTRz?=
 =?utf-8?B?TFBrZDhWT201cUVHSkUxb2NwUXdLYlJ0eU9sT3pPZHVIL0lMdG5XeHIxamFD?=
 =?utf-8?B?NFBmTTdVZkNncGdURXNRWW5zdU5sNnZXazlNQml2TlNMSDdwYlNwKzh2ZUhI?=
 =?utf-8?B?MEFTUVJ4TE9JSVdQaUhpSXcvQUZUTnIycUlFQjVzaEJMcVZFY3daeHRjdXNS?=
 =?utf-8?B?YUM5TnVKODJ0R0E3dUFqK1IrY0x4T3Z2YjZWNG1yR1REZ1gwc1JpcWNqRFlD?=
 =?utf-8?B?VDQ0cmF3dG91cmY3SVp5TDRwMDRGUUI3U1UxYm8yVDV0Q0o1bTJKVEpZVTd0?=
 =?utf-8?B?Q25nMVZWUlhCaWVxV2ZUalE0RVB3UGhOU2ZIQWl5SXduNUMzTnlNUlVnRDNW?=
 =?utf-8?B?bS9KK3Jva0hyaHU0YmxSMnNab2xMUFZ0WG5vMlBqdVJITWlaNlE0L3VJSTk5?=
 =?utf-8?B?RlBqQ3M3a285YnZLVGQ2WEhuNk9sK0pxck5mVkRIaWJDUGtsRjRSRVIydE8x?=
 =?utf-8?Q?mQeRW7juJjco8X1w=3D?=
X-Exchange-RoutingPolicyChecked: ivAqGGP3PmVOxS+I8TwSZqS+Kktdl72ZyRTrDFyay9urtVYyK1/Z3JXvs/ITo0jKM4viUYLBmSmT2HBDn4A1yMvGdYvJcIg0pKgtnFPljsc7AxLTGQvFYLnZCrzWCAdPZQ+R/iOCYJ4QLmg99LCLig9Zc5ow8VAYXBy3EzgaiXsmK0b/GLd7/799DtDlo/SQGpxKqqMAommej9yL3eWezVdxrVVyoJjBeSoA8TJLN10uiKLysGBeOeD3ueiX80w3OF8XZbBt/nx5bX9GaYJ3HT7wo0lIuajKjbjhXlDcNd7gIl506gdnbMHAxPpXmO0UGhbLHZ9da7ivdzbwgI37TQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdc01ab-49a2-44d6-2814-08ded3071099
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 22:14:03.2148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpPgSTQABBhz7SbfC5A3gQ0kFI/DuuMG+fsUejih5YON3Y3ug3YNuecsqdjD8FIxt/gaODMr2xoRYYyOzSBBx1OBgwBniTordof2+tIXWAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9709
X-OriginatorOrg: intel.com

Hi Yifan,

On 5/22/26 2:05 AM, Yifan Wu wrote:
> The static array approach to managing IMC counters has fixed size
> constraints and limited compatibility and scalability. Introduce
> a linked list-based dynamic management infrastructure to address
> these limitations. Add the core data structure definitions and
> memory allocation and cleanup functions for dynamic counter
> configurations.
> 
> Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
> ---

Thank you.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette


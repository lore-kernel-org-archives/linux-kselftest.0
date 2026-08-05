Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EBB3F4830;
	Wed,  5 Aug 2026 22:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785969328; cv=fail; b=fLRbrEw9+kudf18L3tlGAC1Wek9EGFmtpb/8S2ZXDdUXkUi/hSgdmTs/ugNfs/YjWol/EAc+q79KaVksJo7nvEk1d3jgIb2zZP4vOb9c5aYXGSmHrWIt8/+cf2afg74QO0lkoG5tl16+QkGnwR6Xl+YAb7DD/ZdKizzaAOvnLXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785969328; c=relaxed/simple;
	bh=c31xmSgLgJan7QfuVUGlV6PH7dcBKp3yrazQ+EST5/I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O3m2JQkbBbhqiXv31eZK/TBP2UhgSrEBuTvm8ZWzK+fJQu/uZREKc8xO0LKmAMCFk7CmpzuHWf1eLr2YAJBb/ecb9sj8CyE3YsUdWbAnX7X1mgqnL1IIjCq0vgNIBH8jHkEvjMgHzjX+HYQ3R9tWI+yry+IJRkh75dxAyh+AUT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9Geo45q; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9Geo45q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785969323; x=1817505323;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c31xmSgLgJan7QfuVUGlV6PH7dcBKp3yrazQ+EST5/I=;
  b=d9Geo45qgSDelQI0666ToLkmXw5S3Gkq8fPlC11jtC41Skx0oOKbCsY9
   7RxOdVG7cL1dIBkvsqieNWXtT6YELfCqMqfWfrYdZSa2U58EGSrD2FNdd
   iOafL5PgHv7JrS++2EHxDaXmBuwKictKZdjDSdf0y9svXla1E0EovNNOT
   mjL0sIlaTEmOUaeBNLaic93dfcK1CelQzzBsMZkV9AzQmxVB7Uz7wDNeG
   MlnQ20zp9Cl7dOpnoBHj50ofY5iT4P7/Xzy6H/NaSBfdhgZIw3WDTn5dZ
   NWJ6snIiMoLxs7f3HdX42I/R96/rQ0+O6Rvxl1V+2F8nCq7OsZnItAtDd
   Q==;
X-CSE-ConnectionGUID: mdUGoJvCQeyU6i8yO0wLag==
X-CSE-MsgGUID: rNFKXpIkSHWPTGo+qZEYSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86326128"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="86326128"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 15:35:21 -0700
X-CSE-ConnectionGUID: vKGCkrjhQ6GkQ/woWjK1dw==
X-CSE-MsgGUID: b1hCcotzT52A7l/yr58R8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="285300620"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 15:35:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 15:35:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 15:35:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 15:35:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXXOel5bJzFeM5aqQVIVJBNjszRn3J8+HAt3PYHwalclmgiZ1YzK41LlMAtR4gkLT6gs5rGqYd0zFRxKApV7iZgDodQ+x3RqqZy6amsSqCwVz7V/5Qv7zB0lraUM6GcbDn18d7wRuwGbXozwJNcO6PxcwJbmZxN3afxWhlGps6b27fdXJRyaHNa/XWJ+iUeVJvEg0+ZWeOadzxf74VWSiyFFkIcaA2qvpb+ODfKm3boofccuwid2m+pybMmWQgVDLBHX5edWbxuIY6q12NMk7lsqI5zTi9eyKP7E2N5MpSJ5AeicjV0Zw0BN7rY6c80p83TW0VG9sSjXVLPpBEFNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fA0oY2x2V73+4qGOZl12PJxZfJV+XNSTmnV1r/6uxWE=;
 b=moKgYQHgUsQ7vylDpxy19R/DSwMZ4PrFM8Ayv67WqndiztbMhU//Yiw+jZ3MjO39s5waCVr0xMXUoG4Y2ECPl2w/LxZtlEzpU22da/poTUdB9sACDNI566n34AAq7a1BQAWt/k9kVpceYgPy0SvtNzu3dM3FLe5WtTglXo7DzQjPSFPdwPRxEh8nLIi4ARJVm0gEli6HAi11LU7klNy7NzWOexIoJnVYnX2vkKTSmQ76K329gh3XcF0I9SlZogZ04BICEqZ5dBX29GvkKFIMIt2Ab7aU1GcdLHzQY4hpbmsWovCJ2f03I1YxJCGodxA6jnpLnWFpOBubrz6KDmrF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 22:35:10 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 22:35:10 +0000
Message-ID: <23a738a3-85dd-4fdf-851e-3b875f48e70d@intel.com>
Date: Wed, 5 Aug 2026 15:35:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] selftests/resctrl: Add L3_CAT_VALIDATE to check
 invalid CBMs
To: Richard Cheng <icheng@nvidia.com>, Tony Luck <tony.luck@intel.com>,
	<shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<fenghuay@nvidia.com>, <newtonl@nvidia.com>, <kristinc@nvidia.com>,
	<kaihengf@nvidia.com>, <kobak@nvidia.com>, <sdonthineni@nvidia.com>
References: <20260608110641.44457-1-icheng@nvidia.com>
 <20260608110641.44457-3-icheng@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260608110641.44457-3-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0217.namprd04.prod.outlook.com
 (2603:10b6:303:87::12) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|MN0PR11MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: fa365d39-38fb-43eb-ab97-08def341cede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|5023799004|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: UjA78iS7lgKkHgB3G3cMc/VLV13cz+xTOld2PlqbMWK9oRDoOAwig+x3fKRcfRILKKE8JPdZyiNxtpY2iv0tCf5MUNNq8fje97Do5AyW6CZq/7ZpHCSx5dm58xe+t6NmMuBHe9n5/1sMZZZQHfJXPb9zqg5gHxOg2UfHKAoPqtMEpqAZF+3tK7G1lTK85l8I7A5457IvIYlyKIAggpUuyz4UsH/AG5T81GKo/JikOfn3tBoF3VQvlM3pk/Q0GcewOfhBBgMs0MCUwGOsjHvImCQdJQm/jrw3SlG56fUyJlmgth79MmygYv+NgHhADWoKiPQZKg4hXBv0bqU/bFmLSx91x+G2e5EwriEbNanbM7u9tgvyUTBnceZ6fqAdtToaeF47IJluAPAjVndRy2rJuElepL0V1vPx6gChBICHAy21gMeW2xNliNTugaQWc7tpi2DZhCJpFAB16pfln0xpUR2XtA5RS3QfhUf9LcyabmvitokHSDtxJHNrersFuEZQEfdGSk147t3WmWw67f5REWXX8MZy5D1UvHbcRhzd4ajC09RDdKqvngyM3d558QFahd4iinZC5KkrHtYClaSW4Z2U59/kwc7jxi199HP8dUExUKQQTkHaL4ORPzwUTACF5K0SF/OV48sGLVLVjIC6y+BXXhOx//jFp8VQCTzAVCw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(5023799004)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZFVEJtVFlUaEtlRkNwWXhiK1g3VDdyTytYcG8wM3JRWVM0VWhnRXlJT2RV?=
 =?utf-8?B?cWlocGRvU2lyUGNNZy9ZdnRPd0VCc1FJN1JqeFptY0E0S2REZlZFUGJhbFYz?=
 =?utf-8?B?MGt6aTVseGVydSs3eFBaSUJKSWVVb0htaGFqc2tnQXllK2s1MDRkMnZ4ZFRo?=
 =?utf-8?B?RjJtWW8zRXl2RzFaNllkSXJDUDZaWWNtV2ZoNWZBNENIcEVUN3hWM1BkVkJP?=
 =?utf-8?B?MUx3WUJrdkRNQmFGQ0JaS3ZrTTcwNng4VTJpem5ZU1p3SzBjVXpyVVNUV2Ez?=
 =?utf-8?B?OUNtT3JGUEhIc2FtQm5iRnd2L3VubG9zQkFKMzRpbUFuVnB3WHNHOXJjKzQ5?=
 =?utf-8?B?M2VHN1h2N1RXbkQvSXlZVGF0WHdtalB0bXQyRENNWENPMWZaZW9QMWd0dDdF?=
 =?utf-8?B?cjRJWUlzeVpnbTNWRFgveUJXQkdhT1dnUXFwRnEyNjdsd21KZHl3NDFUSk94?=
 =?utf-8?B?VTNkZGhZWXJaSTk5UUN2M3FLTzdwYURlSkxzZ0ZLUjd5UWtnYTBWdGsxaHhV?=
 =?utf-8?B?dTlrUHBjRDJDNkxhWlh6R1ZtbnBnN3RLU0o2TFZVYmNBQmpNTzVFNEpsakEv?=
 =?utf-8?B?cm5zMXA3RFN3QVNGSTRzNmZESzV4SkNBUjZVbE55dHR4MU1KYmwrWEpoVHRp?=
 =?utf-8?B?NE5qcGJzdGlXVDJpNmdLYkdoM3hZdG5DVWZ3NXRaNmxKeFZranNPem9GejRY?=
 =?utf-8?B?cWlkUTZzU3RxMEpKM0Z0WURsMFQvMExwQmVWRTlldkxZZkluU0lUVUxFaDN4?=
 =?utf-8?B?SVdyZFFaM1FOeDBSMVVFZFdnblUyeHUzcmVVcTM3TnRsbWg1Ni9aMzdqenBh?=
 =?utf-8?B?Q2IyNjl5SDM1bFNEb1BzQU9HWlRkUEdmOEVGN01RTkpTVXNxOWMzVDFlR0RG?=
 =?utf-8?B?MkVMTHhXT0lESm9RNU5jaG55WVkzM2h6elhZd2s0Z2Jud2NudzBueDhlVFRF?=
 =?utf-8?B?YWdzOTZFSmdraWFocmhzMG12OWlsamd6TnpYVGVSSEtDend3TVBBaXkxR2VZ?=
 =?utf-8?B?b0xyOGxSM0U3NlZFWTZnTEVwdXdRSGZ2c1llOXlpQVhpS1hvdk1CSVJrNVAv?=
 =?utf-8?B?MURmZEVBMFI1aFA4azlEOS9NclFVMUZQUFNGTTZ3MHBXdXNlM0tlcDR1bWo4?=
 =?utf-8?B?aWN1dWdoNld3RFBPbFl5ZnhhYkFvRDlsZEo4L3BHODhEU0ZiTm4xSmN2Qlc4?=
 =?utf-8?B?bkNYM0U4VzliWEFuRDQ5alltSGlFQ3RBNStXZWlqWVVZWmF2eHBUcE81NE4y?=
 =?utf-8?B?Y2pva0FKZDVLSERjQVZzbUZoaTI2a25TQ1d4Z1dQMW9xZTFRekd5SGRzUGp3?=
 =?utf-8?B?MTF4NFkxb08yMDQyb0xGTmRCSGo5R24vNXBxdDhhSVFRR0NjUUV3ZytkWVpu?=
 =?utf-8?B?M2pTT1UxWW9KL205WVNkb1JJOWdQV0NqNHd6cUwzeHIwWVUvSzk4YXcrK1By?=
 =?utf-8?B?NmgwN2VmQkt0Sm5KV2h1UUJDOEFWbnZIUTY5MmJ2NVdxc2ZETFdVaW5mdC9i?=
 =?utf-8?B?NEo5cWdlWHhlSC9ORjUwQWhzc1ozcjk0ajgycUJBT2VxWGFSQi83WFFRaHR1?=
 =?utf-8?B?SGorMElqL2VkSXE2VVUvTHdJRVRRZ040enFBdkdHRkVBcDN6V3BHcGt2clUy?=
 =?utf-8?B?R2NSamIwV2locStaejRVRnJoYkZYNEQyZ0pBS2pHQWNPRTZkMWJmQkF0cFpq?=
 =?utf-8?B?ZW5kcGk3aEUwZkRkUm9pTEIzVlNtVktOTXIvYlVxR0tkeFB3b2swejg0N2dT?=
 =?utf-8?B?SEYxMEVaTVRkaGNYS3RUS2ZhdDlQdW5GKzNrckljOTBpaU5DZHVEbzk4RHlh?=
 =?utf-8?B?UG1CaUpPd2xsRUszeXNBY1MzaGVKTWtVUWZtUmZzc0UyWGNoUnlRT2N5MnlL?=
 =?utf-8?B?aHR5MDNSeGVaNzhDcm1Yb3dqV05XbXdYc01JSE1EWWgyZXdrKzlnM3JCVTdW?=
 =?utf-8?B?aktPa2p1RjU2bFZ1TjQwVCtKdDBrN3VuK3JtNmZlclJzOWU1Q1krdjN3clRi?=
 =?utf-8?B?UHVQQ0x6eVZQOEorVWU0b3l4UnB4RGx4alVMWjg4d1ZJQWdBaFlSUkJhZ3Bv?=
 =?utf-8?B?SHljdFZQcFBTUHJHdjR2WTNZWkZVZ3ZvMUVXS1VpekFRcGtlNG0vTGU2ZDVR?=
 =?utf-8?B?Vk9jdDdHTGNVRnExOUJCN1hqRy8xNU1KM3Z3dVdzSzVvTHdyQTNoWnpVc0JR?=
 =?utf-8?B?SmRWNUJpanVtUnZ5RGc1Z0NyeFNLb3lCUGROMXozdHZhc1hnV2VlZEs1Qis0?=
 =?utf-8?B?U0szazYraitRbTR0STRTcmJvSmw1WUtiMDRFelNNTXVmSzlxcDBXNWxtNi9D?=
 =?utf-8?B?SWxXbTk2a3BjVXN1VTlsQjVwYlJQdGY5UzgvV1hXNHhOWmQvWEVuUURJMTJG?=
 =?utf-8?Q?3ItLuNCvnWc6avko=3D?=
X-Exchange-RoutingPolicyChecked: tLBLcxFuPB6RxKptxrubkphlDeKTmjLp5TzRurw1rWEvxl0NJYtdDuCkIVUJ+swjeuHrHbW2tF+ZOBz4hSt6jj4s8c+ua92KJHmNnRKXiEIh4mglsdP/m6ObHYYpRlZefvS5NYBXax1FSPWWM8z2P3mo2DAOdIEPx4dy1n4DL/sp/akJ78XwpI8U49fgRxytrq6+yjwtDai2hjtML0aUTk3EWiej+kHN4CTJ3bkEDGGJhTPja43xiTug9KoOCzHQZu94q/FeWdpDt6eLZ33+XNnjCUPeEvEAdTlOifoMuoeMig/toa+mrH6y/POh4wHv/C16tuM23dLok3erevF77Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa365d39-38fb-43eb-ab97-08def341cede
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 22:35:10.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSbB3fl4pEAbUuquHbZDVp6b9+h6c6kOl/ESbeKo0amDpGNz96YIQ+dQKdGYUsJuPEEd5L7HioTzpxU+LmhJsPv26E80tw4nxQpt9O+Y2lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6207
X-OriginatorOrg: intel.com

Hi Richard,

Thank you very much. This is useful.

On 6/8/26 4:06 AM, Richard Cheng wrote:
> A CAT allocation is a CBM, and the kernel must refuse masks that can't
> describe a valid allocation. Nothing in the suite check this.
> 
> Implement L3_CAT_VALIDATE, first confirm a valid full mask is accepted,

How about "L3_CBM_VALIDATE"?

> then write an empty mask and a mask with bits outside cbm_mask and
> confirm each is refused. A mask below min_cbm_bits is also checked where

The empty mask is not always a valid test (more below).

> the platform needs more than one bit.
(nit: please write changelog in imperative tone)

> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c    | 79 +++++++++++++++++++
>  tools/testing/selftests/resctrl/resctrl.h     |  1 +
>  .../testing/selftests/resctrl/resctrl_tests.c |  1 +
>  3 files changed, 81 insertions(+)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index 16a947f1ed16..d236988916d9 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -603,3 +603,82 @@ struct resctrl_test l3_cat_occup_test = {
>  	.run_test = cat_occup_run_test,
>  	.cleanup = cat_occup_test_cleanup,
>  };
> +
> +/*
> + * L3_CAT_VALIDATE - Verify the kernel rejects invalid L3 CBM writes.
> + *
> + * CAT allocation accepts a Capacity Bit Mask (CBM). The kernel must reject
> + * masks that cannot represent a valid allocation: an empty mask, a mask with
> + * bits outside cbm_mask, or (where the platform requires it) a mask with
> + * fewer than min_cbm_bits bits. A rejected schemata write makes
> + * write_schemata() return non-zero, which is the signal this test checks.
> + */
> +static int cat_validate_run_test(const struct resctrl_test *test,

All tests in this file are "cat" tests so this function name could be more
specific. How about "cbm_validate_run_test()"?

> +				 const struct user_params *uparams)
> +{
> +	unsigned long full_mask, bad_mask;
> +	unsigned int min_cbm_bits, start;
> +	char schemata[64];
> +	int count_of_bits, ret;

(reverse fir please)

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
> +	/* A valid full CBM must be accepted */
> +	snprintf(schemata, sizeof(schemata), "%lx", full_mask);
> +	if (write_schemata("", schemata, uparams->cpu, test->resource)) {
> +		ksft_print_msg("Valid CBM 0x%lx was rejected\n", full_mask);
> +		return 1;

KSFT_FAIL?

> +	}
> +
> +	/* An empty mask must be rejected. */

Some systems do support an empty mask (AMD) so this needs to depend on min_cbm_bits
being larger than zero.

> +	if (!write_schemata("", "0", uparams->cpu, test->resource)) {
> +		ksft_print_msg("Empty CBM was accepted, must be rejected\n");
> +		return 1;
> +	}
> +
> +	/* A mask with a bit outside cbm_mask must be rejected. */
> +	bad_mask = full_mask | (1UL << count_of_bits);
> +	snprintf(schemata, sizeof(schemata), "%lx", bad_mask);
> +	if (!write_schemata("", schemata, uparams->cpu, test->resource)) {
> +		ksft_print_msg("Out-of-range CBM 0x%lx was accepted, must be rejected\n",
> +			       bad_mask);
> +		return 1;

KSFT_FAIL?

> +	}
> +
> +	/*
> +	 * A mask with fewer than min_cbm_bits bits must be rejected. When
> +	 * min_cbm_bits is 1 the only sub-minimum mask is the empty mask
> +	 * This case only applies when the platform requires more contiguous bits.
> +	 */
> +	if (min_cbm_bits > 1) {
> +		count_contiguous_bits(full_mask, &start);

The return value should be checked here to ensure that the create_bit_mask() below 
is valid.

> +		bad_mask = create_bit_mask(start, min_cbm_bits - 1);
> +		snprintf(schemata, sizeof(schemata), "%lx", bad_mask);
> +		if (!write_schemata("", schemata, uparams->cpu, test->resource)) {
> +			ksft_print_msg("CBM 0x%lx with too few bits was accepted\n",
> +				       bad_mask);
> +			return 1;

KSFT_FAIL?

> +		}
> +	}
> +
> +	ksft_print_msg("Pass: CAT rejects invalid CBM writes\n");
> +
> +	return 0;
> +}
> +
> +struct resctrl_test l3_cat_validate_test = {
> +	.name = "L3_CAT_VALIDATE",
> +	.group = "CAT",
> +	.resource = "L3",
> +	.feature_check = test_resource_feature_check,
> +	.run_test = cat_validate_run_test,
> +};
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index ce3abf0bdac2..e2e3cf7833bc 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -248,6 +248,7 @@ extern struct resctrl_test mba_test;
>  extern struct resctrl_test cmt_test;
>  extern struct resctrl_test l3_cat_test;
>  extern struct resctrl_test l3_cat_occup_test;
> +extern struct resctrl_test l3_cat_validate_test;
>  extern struct resctrl_test l3_noncont_cat_test;
>  extern struct resctrl_test l2_noncont_cat_test;
>  
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> index 324a60818aa1..66739e96f33c 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -20,6 +20,7 @@ static struct resctrl_test *resctrl_tests[] = {
>  	&cmt_test,
>  	&l3_cat_test,
>  	&l3_cat_occup_test,
> +	&l3_cat_validate_test,
>  	&l3_noncont_cat_test,
>  	&l2_noncont_cat_test,
>  };

Thank you.

Reinette

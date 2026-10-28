Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793212706;
	b=WwSiSFvm3ZgyC0ELbIvNGN4vBGI3EaOSoLdlYU6Y9lM27eukHR+DQKfRkXk2u3ioknkf
	 gtOp62dDgo+BY/K0Xvqex8MIItGkSrPJwWcLcRAYGE2Mj44mGWYPJTDNAuovywdPsOMgL
	 6UbhOap680Oqtftfdr9Q23VkIydIAIRedM5tn7ydFKTZRyxNVrV2fjYlahzdicg+eE18l
	 2B82F1dp4wxZqbs7iVPd2StrjSz0FD1K/f6xWphvtGUQm9K5ZL9C3WIGhZFiGvx4P632P
	 tROzbhZ8VWTxkLskbpvOcG23ewnf0HL9NqQedk4g0sod8HCEnJ0O6h3FZiTnf4YM6lA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212706;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=TMq4FA5hRvxfrRPOpgcobQeA6dQkXOkVR0ajgvxEO8U=;
	b=uQKNblCahWLrmrKmk14wcuK1zjMXrmdLLTaIDX2HPaswIYBbu6E/iQHA2Jd5tJTuFI4f
	 bYPzEWtwwFAa7vSqgjicdAIvnONoV3yuhGtfLgVoNYN18X58y1zJtvn8PzVs2BmoceEvI
	 HecXF7uKk/4nLsxuTgO9bn/QzLncotMD8IYPpMoTAAxEKxt83axDmCMwlrIcWhmpX/crA
	 OPdgRcOHm9veQ0kR2PqjpHcYOxEVfv8I5JoDesodr8Rbhq6/sd5iNODMpgu1fVZa1xquF
	 h+FPIstDjyX3jd3tdOIFL1CIpHXUrTG4G/yB1gELfthvM1ApBf7b5C0R4q4stmoevCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ilCgvZqm;
	arc=fail smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8C7606A320;
	Wed, 28 Oct 2026 18:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8C7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ilCgvZqm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793212704; x=1824748704;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WNNjPRSV6zF9IP9zMgEfhap5/IbXCtdgl1LJ9T7dqfw=;
  b=ilCgvZqm6UGWbk20hXrzNH9Ee1brYrF5npZAmujdsx9EttXKFEt50/3v
   Xu2ZdAEC1cDXjXjPvSKtKRKcDklZMShhXHqtbgNEjSt/cazlau0cA5h3Y
   LQoet+KoTAAWb3v4U41nL5mhWIE/kGv1tiG0VV/G4v89oKkmnUWzEJPMj
   HKCEbHfBiOsuLFSsrH9hYfEWdVH+5pZh531BplkrNf8hSKwRd4MxH5Fv1
   By7OCdgcDEDMzsRL0NHx5UH6ZVHCBLiLJaXRyrEgAty046ooaAqRnbWeh
   noknbCRB6S7wLIpGsMTDyqiGQl3AaqsKcRPF3KjHtTBEvIEpsLTFhijzx
   A==;
X-CSE-ConnectionGUID: Qx2CXnhkS1WBnhCOZUPxhg==
X-CSE-MsgGUID: LPredNa8S/6acyJx2RWFjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1831012"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1831012"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:38:23 -0700
X-CSE-ConnectionGUID: y8OWbOurSrCUrErY0BGPWw==
X-CSE-MsgGUID: AZwQ2keXQe24N5dD4yNQFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4943758"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:38:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 11:38:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 11:38:23 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 11:38:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3Lu5H5/gf3s+ozA+QsZQcTKRv+gJPycA0vDJOGFG+LZ/H0iiIzTHW4e/Q1QA29GJc3KWH3jS+c9D7eK5qr7ovUF4tb1r0vOZWc5pYeFIb+PONFD+ZUrB93Kvj+ta0HndW352s7xiHFy6YjParnjBW52NtJsOxC6rCrgLClIQCsNY00caTGjLXc1Qip1rU9t1JOhlWNWelke66x8rdGtC9ilgXK9ZmTm+lrT58aL0GMsyow61p1WSA2p+0ZI/4uzeweIMkIxiMvPiVxZgoUCAeeqSQ9dbOqOPnAoVNLX1PLdf+ThYIMzHI1LAPK8KNo7tXMevfcm+i6PYq4wjG7t8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMq4FA5hRvxfrRPOpgcobQeA6dQkXOkVR0ajgvxEO8U=;
 b=LveZES/7ooagw1ho0GVH+Mzn5RMNRY6s35gljnEHO5xBhTlsWYIdaslEfqzr0LlQ1naFoijhiUEoh20EXoZxVQlR0fmoEfegjB7OA8XDGlRnNvp/NjyXy+mDP7GX5ce7BXnQ0011+urLGQxwqmwy7b5YdwGCiHsHt52htz14/I+gszRpk4ZFnE8udrxDuObhn9cWhdTpILs/DMdPQa7/25Ovl7QGusyBwiAXJj96ezoqPfenGfC8dMNregKYuM4IbnrSSUOdB+0QpnBkz7GgcovMXf9FT5Ul/5C91qlHMAToye1ZMKi17T+E5M+YdxCfUzWmxSJZAJ9iyadOZnI/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 18:38:12 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Wed, 28 Oct 2026
 18:38:12 +0000
Message-ID: <94608581-10a8-4967-be6b-1842d4146223@intel.com>
Date: Wed, 28 Oct 2026 11:38:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] selftests/resctrl: Rename variables and functions
 to generic names
To: Swapnil Sapkal <swapnil.sapkal@amd.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-2-swapnil.sapkal@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261022132517.46805-2-swapnil.sapkal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0133.namprd04.prod.outlook.com
 (2603:10b6:303:84::18) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SN7PR11MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 77769eb6-1f48-4098-9194-08df35229ee6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|18002099003|22082099003|6133799003|261026121527099003|56012099006|11063799006|4143699003|261021123027099003|261021121427099003|261028144727099003|261009223027099003|261022105027099003|261022113327099003|10067099003|261022075727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: NBJVfTmhIuG7bSXb3Zkp/CoV9GfONOVZIo71tzOM/nxEidFGfx7hiKF29tcfD+s1D29AV3PujLANlpGjIbxcDYXX0YAtFxN1yIFXZ/6hOU5Qg1PPsH9NTVwsLysL+rNpODrOLGQ1cngIA2Ih/VSxal4zJ5UmF04u0l06+YUdhTHFZnloTtQZDO4p6yGk/l9vesY2C6RJ3H8gWQx9Ns7KohYgq60glrTpBR8Jy9VvHc2d173uEmzLhoLx0Fgqsew4pc7qMNVm3/dhD9l6ZCol++QPJCm8H5dRaNXZ2rISpj6EKXcS/QPkbVqjEL+rieX1m2rkV9o1Lf29JbgU3/pRAhYPXwTVu1iVOC3nkt/rXl92nl+ZqpCHXDKwDYPTaEzu29dAPCNi0joFYEpuS0W46ImzdGZh+rB0gvJlBJAWMfICEvNcvTtU1EnWUJgpMBCfetBTPjQQaqWUD2ao6YwlzE63bEViQBxSNvLWQh3eq/R7mQZzgTn6i2AHgpBKELVDhYaZJ1bu/kSCo3NF/r5c6j/08YIELQzAUSqVEcdhw7on/l7Or8u6VJiGf0rnTfsVSuOW4MK3f8e2pQAOVSR0VdssyY5Vy+lhn/H7PWEY/DFvqoiZE9ktFv5wT/9Gml3prfaMuQ2qcZuhTZv3tdFVN9wLIDVQFrHFQrQSSo3I9+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(6133799003)(261026121527099003)(56012099006)(11063799006)(4143699003)(261021123027099003)(261021121427099003)(261028144727099003)(261009223027099003)(261022105027099003)(261022113327099003)(10067099003)(261022075727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bS94VFhqc05GcGlSb2VXK2JJd2JTS2RidG1jNXZ4WGl1REd1Q3FMSkp6dkZr?=
 =?utf-8?B?emRmU25LRkY3eGxhVHY1b2lHcnovQ2k1cVp4TWlFbTArV0p6d0o5LzV5ekg3?=
 =?utf-8?B?Q1RvM25ZR29zYlhoNU5FajFVeWpxaUd1cEM1aDhBQmxKcEhlRnd3SnBEU3Nk?=
 =?utf-8?B?Z2d5L3FVemZTb1JQenpWYjVwS0RpS3c5RFB6eEpWY29rdXh0L1h4UGlSZVBo?=
 =?utf-8?B?L01yUDRad25WZGxsWEIxSE9NLzlUWWlSaU5wYXIzaVJmbC80SGdYRWROZmU1?=
 =?utf-8?B?SEsxaVhQYWk2LzlJT2JsUGcweVZBc3dFTUFjSWYzYUZpYkJJa0w4MDd1M3J4?=
 =?utf-8?B?L2tQMmM4UjZBZWdZRkVlK0JkS3pFQncwOFNwd1k3UjEzNlRzOXE5bVhhb2U4?=
 =?utf-8?B?TmJoTjlUMGs0ejZxZlVRaUNMZ3ZLS01CSXV4T3JJTlRtMHA0VDFQeG9zMUxs?=
 =?utf-8?B?ZS8vYy9qakxwdmNMdjBYbXFaL3k2Mkw1Y0RqV0NNc2d1ZmVSR2x1WDlWYnBl?=
 =?utf-8?B?aWU1MzN1cjFuYlQ4LzA0cFFQS0FrcUdFRUxNdkNJVmRIeXRqalY4NWdFWEdD?=
 =?utf-8?B?SDBnZ21JQ0l0ZThRMDBmbUZJcDNuT2hNT0I4dFdmRVJZejc2V2pXemNUZVc4?=
 =?utf-8?B?RlNvd25aUHNYTTlKbVcxTVl4alEyREI4REpkY25Pa2NTZW0wWWcwdVV0Q1c3?=
 =?utf-8?B?RXhhU3JSNjJQUlJ1NGtKNGliOW5tdmNxS3FDeU9wdFlsc2JkVWdYUVpobnJm?=
 =?utf-8?B?TVlRNWJGVlpheUpYcUxTOUpPakNtdldsK2dZN0ZWUmxsYXlGcmpqT2dXWUI5?=
 =?utf-8?B?d0NnckUyMlhabHJiSGtib251OTFyUnlCU2lnVy9tZkpkdXdOYkk1ME5hNFNH?=
 =?utf-8?B?d1NPcmdzeXc0UnBGMkpVS3QyOHRGZTdVcUdKcnBlSk96M3pNVWUrMkdDblIr?=
 =?utf-8?B?OGhvb1JCKzdLb0ZUbEdYMjhmTUZEck9qYnVIcTZab3g1NnJBRWdJcXNhbElu?=
 =?utf-8?B?SUloZ1RRS1djWjZNeXdRTWZwcjlCcG9mdjB3M0FESWZFdW96L0NvRk54ME1N?=
 =?utf-8?B?dWlzZGxiT1pNRTBkcmIzcHViUTNCK05YOXpqZjV6NVphUmJOR3hZZ0c3RCsw?=
 =?utf-8?B?NzlFaTFEWlJoMFVWZ2E2cXBuTWpuQzFESksySTBvb01tMzdzblNyYTk3dUdD?=
 =?utf-8?B?NHdMaXJsd2R5ODZQRW5obVpYUXhRcklkTFBPMWorOUdOWllsSVpubEV6blB2?=
 =?utf-8?B?RFNWWjVQQk1IM29UdHZreWlCWERoNnJ2aGxWUE8zY21iWUpDMm92Tmk5RzNn?=
 =?utf-8?B?MzhkNGNlaVBoQ0IvM040SjNSekZuU2NEWVUvTWIwNXQ1R01sRG1LQVpwSTVE?=
 =?utf-8?B?ak13ZTVpbWoxWGVibCtwb3c2dTBYRG5Ha1paR2F3aDd5dVptanlsZzJKUEY4?=
 =?utf-8?B?N0JyejJ3dVJMYlJjRklHYzdDRTZGSlpjSk8xWS8ydnBlQ1U4M0c3SHhlT0g5?=
 =?utf-8?B?ZVViNVBoTnQwdUpxYVdVcDZJckFtdit3VEZ2SUJ5UkcxZ2RCalJvYWZiTXpi?=
 =?utf-8?B?R2hlNFNLSTA3blRub2lwL0h3VXNrbzQvckRXRE5OWjIrbkdtR25wY2VDQUZy?=
 =?utf-8?B?bU5BSnZkTk01emFjVHpYbzMxQ3A3Rm9UeDNKZndaNHZkWjBjeEJqNTdzTWdv?=
 =?utf-8?B?UmJQWkNBbU5TMHUzSm0xS3d4NHBCcERtN1NRSlord3ZSd1dGTE92YmhLbHd6?=
 =?utf-8?B?cFVZNnk4NE15blV1dDh1UFV5Z2pHOHJrK015ejFFTTNzbXYxdFRQYnUyZW11?=
 =?utf-8?B?RHN2Z3c2Wm5aamVHeWdRSEh5K1V2OEpxQ3l3MWFkR2RxZkFhS3FIbTh3ZEd5?=
 =?utf-8?B?cHlTMjY2OFA5TEo1dGR0UjdBTGM0RGJlZUFGU1hJeVhzWE9PUFJNaGpONGdZ?=
 =?utf-8?B?alVvcHk3cWt5cm1EbDdOME9CYm44OURtdnVyM1ZraHhpS2tmRE5LZDZ6c3RK?=
 =?utf-8?B?UGZuMStkNXA5ckR4cHhZYTZEczRyZ21GSUhFU0FuWlBSOU84eXRXTk1aN1VU?=
 =?utf-8?B?NHZuQXBETVd5Z0xoWGdnMk1qcm8yTWFLcExzeVc3QzlDQTBIUk5OcXk0M1lO?=
 =?utf-8?B?SW5EYXZ6bnI4STdkRkxrOXY5Ujh0Mms5VTE0eWxGQ0FIdDdLd0pQUzJzRGdY?=
 =?utf-8?B?VHl2V3VTdjBlazlqem5Wb1B2TERPV05DbE9RQjZPcUZTYUlQUDgySnArKzNI?=
 =?utf-8?B?TUJHM3ZFMmpaLzNtV3ZPVzl1b1NpdzFHTllJQzJpRmRHYzg2eVpzOE1NR2VM?=
 =?utf-8?B?R1E3aTJ6bUphVUNqRFRsNHJZOWs3bFlWTCtXUkFraEJjRFZ2Rmd6N1RDU3NG?=
 =?utf-8?Q?tZzC1MJMI8eKOaE4=3D?=
X-Exchange-RoutingPolicyChecked: uqQHnpjgohSWAlU6lc/CYu0qz91vyo5k42huxdObUFLO5jkZXLC2keC6ImxQXnZ200XahUX6ObDdwlogCvDuJfNlYybjEz4UdgJ9LN1HcT5Czg2Zk6x5nYXGfO2K1TNLtTmBT9fgDFsa2/JfuVvd5Mm4bKbca0CLbXT4tr6lX4CIiSiv+gDs9SwLqBxCMjVFHTMOYD9ikY2LI78tcUy5sJZQwyoBMnD5UUzo/ZbH8Liy9DQJ8Mcg49pR2eeP6snwM2yizIbuRDmbaSR8/IFwXTSW7J3QJVNguTj+KSg7ajijs/T1ak3Mcr7n/wJj02eiTdyR29q2uP7nVJr/DI4CoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 77769eb6-1f48-4098-9194-08df35229ee6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:38:12.2323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DA8At5jq+qa43kbBFvpmoHvsXCzN0fD2T7FnAIrCiYmcn6Ni/s3NVCPxKFH0TizbExqDHw9t6QKHAd3YNZtik3v3AtOOuSatbt/wFuvqTB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
X-OriginatorOrg: intel.com

Hi Swapnil,

On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
> From: Babu Moger <babu.moger@amd.com>
> 
> For Intel, the memory controller is called Integrated Memory Controller
> (IMC). For AMD, it is called Unified Memory Controller (UMC).
> 
> Rename the variables and functions from imc (Integrated Memory
> Controller) to the generic mc (Memory Controller) in preparation for
> the support of MBM and MBA tests on AMD.
> 
> No functional change intended.
> 
> Assisted-by: Claude:claude-opus-4.8

There was a decision at LPC that this tag is no longer needed. This was
formalized with the following recent commit:
	1e035297ffda ("docs: remove Assisted-by references")

Please remove the "Assisted-by:" tag from all patches and instead add
a statement to the cover letter about how AI was used during creation of
this series. 

> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Co-developed-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
> ---

>  tools/testing/selftests/resctrl/mba_test.c    |  28 +-
>  tools/testing/selftests/resctrl/mbm_test.c    |  24 +-
>  tools/testing/selftests/resctrl/resctrl.h     |   6 +-
>  tools/testing/selftests/resctrl/resctrl_val.c | 256 +++++++++---------
>  4 files changed, 157 insertions(+), 157 deletions(-)
> 

> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
> index 7e7d0f9cc249..c9cac957726b 100644
> --- a/tools/testing/selftests/resctrl/resctrl_val.c
> +++ b/tools/testing/selftests/resctrl/resctrl_val.c

...

> @@ -83,20 +83,20 @@ static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_con
>  		if (!token[i])
>  			break;
>  		if (strcmp(token[i], "event") == 0)
> -			imc_counter->event = strtol(token[i + 1], NULL, 16);
> +			mc_counter->event = strtol(token[i + 1], NULL, 16);
>  		if (strcmp(token[i], "umask") == 0)
> -			imc_counter->umask = strtol(token[i + 1], NULL, 16);
> +			mc_counter->umask = strtol(token[i + 1], NULL, 16);
>  	}
>  }
>  
> -static int open_perf_read_event(int cpu_no, struct imc_counter_config *imc_counter)
> +static int open_perf_read_event(int cpu_no, struct mc_counter_config *mc_counter)
>  {
> -	imc_counter->fd = perf_event_open(&imc_counter->pe, -1, cpu_no, -1,
> +	mc_counter->fd = perf_event_open(&mc_counter->pe, -1, cpu_no, -1,
>  					  PERF_FLAG_FD_CLOEXEC);

nit: please fixup the alignment with open parenthesis

>  
> -	if (imc_counter->fd == -1) {
> +	if (mc_counter->fd == -1) {
>  		fprintf(stderr, "Error opening leader %llx\n",
> -			imc_counter->pe.config);
> +			mc_counter->pe.config);
>  
>  		return -1;
>  	}


...

> @@ -344,54 +344,54 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
>  	return 0;
>  
>  close_fds:
> -	perf_close_imc_read_mem_bw();
> +	perf_close_mc_read_mem_bw();
>  	return -1;
>  }
>  
>  /*
> - * do_imc_read_mem_bw_test - Perform memory bandwidth test
> + * do_mc_read_mem_bw_test - Perform memory bandwidth test
>   *
>   * Runs memory bandwidth test over one second period. Also, handles starting
> - * and stopping of the IMC perf counters around the test.
> + * and stopping of the MC perf counters around the test.
>   */
> -static void do_imc_read_mem_bw_test(void)
> +static void do_mc_read_mem_bw_test(void)
>  {
> -	struct imc_counter_config *imc_counter;
> +	struct mc_counter_config *mc_counter;
>  
> -	list_for_each_entry(imc_counter, &imc_counters_list, entry)
> -		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc_counter);
> +	list_for_each_entry(mc_counter, &mc_counters_list, entry)
> +		read_mem_bw_ioctl_perf_event_ioc_reset_enable(mc_counter);
>  
>  	sleep(1);
>  
>  	/* Stop counters after a second to get results. */
> -	list_for_each_entry(imc_counter, &imc_counters_list, entry)
> -		read_mem_bw_ioctl_perf_event_ioc_disable(imc_counter);
> +	list_for_each_entry(mc_counter, &mc_counters_list, entry)
> +		read_mem_bw_ioctl_perf_event_ioc_disable(mc_counter);
>  }
>  
>  /*
> - * get_read_mem_bw_imc - Memory read bandwidth as reported by iMC counters
> + * get_read_mem_bw_mc - Memory read bandwidth as reported by MC counters
>   *
>   * Memory read bandwidth utilized by a process on a socket can be calculated
> - * using iMC counters' read events. Perf events are used to read these
> + * using MC counters' read events. Perf events are used to read these
>   * counters.

nit: please move this dangling "counters." to the previous line.

>   *
>   * Return: = 0 on success. < 0 on failure.
>   */
> -static int get_read_mem_bw_imc(float *bw_imc)
> +static int get_read_mem_bw_mc(float *bw_mc)
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette


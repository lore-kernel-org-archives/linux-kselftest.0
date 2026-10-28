Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793212766;
	b=cuyTEPn/RWGB2bU1dUDrpCA7Tz6YatomrR4h2+zbXHBsskl7QxxzW4G6W0Pi/Nfzks5N
	 Mx6968z8nZxGRcRXHSvIQetU4BnUZWdh5l2VhaxwwhLltH469/7oONfgDVl9aQOHTEQyH
	 YaneGpJ1ojMD1e/IkdNIMn1id+/gJ/vr2bRhC34eNownAoqCUU4E1ELBkzelRXfF8egf7
	 B+ZAyxgSYH+uJ1GuEIMpNX0NTByi78v7KGJ2wLub2icVd2sbDt6MsnZUob9VLpGYgtCHV
	 eDhl4ayGViyZfobMJ/UsR0DAeDQguIYPTaDUsFarzman42yiZ4fliiTFWErxZaUVKQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212766;
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
	bh=F9RZNBNbFhKoyDAO+D9dcapaBULXFBsg0lo4D5AXl4o=;
	b=LdavAg12y98h0hoJXeMwxNS9uIsPuquQjhjbr24ps3Bwzdd+5Pezf5xcJWe0nZqDGjlZ
	 x7c50lX3L74H0Eiuaq3u7v6hVErVV7N33rRYZA6IQU6idW1Ushtw3veRR7HmIUQA4na9K
	 M7pqOfKxKQ04vsKN5fn40IQYuSNdB4tGnV0c/GIPzvWcAUeDfumJkq/qPZs3zzxSwkhJm
	 Z+/VXVEfxafgC0JvJy8qxTPfGQypj9jCDuqPUAyIqAmfn6nHCrtfrQdTGNRp2+WfBSPI7
	 TKO8TYzFvuOSo3VSiSg3/NLEKbaTzJ0FhfySWmaRe8tLdDhD5ZK3QlpnaZEmD3NXASw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TZm14tVX;
	arc=fail smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF43606A31C;
	Wed, 28 Oct 2026 18:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TZm14tVX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793212765; x=1824748765;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XHwI7EExRTijZuR4iu6QDFJsoiNZBimq0dEhxyaLW2c=;
  b=TZm14tVX2BKpwHytRYMlF9ztx7Xasgp3Vdkdndnu71um+Zj9sgiKFaaA
   mYyh15i0NeWR3TqXx7v92G9raFgjCySzmO50bat6CS3OTA49cxY00lHV/
   4I36SIVDbiorSfJ+F0zPQfLPmTtfIF207c5bmJl6P5WEPeFd/EGRSCGeY
   oS0tpxi0wSnRUj4fDcLvKPAFVw37s/QGxn4+p6J/GuRUhSIQojgkdQaOR
   /zbMccnIidfJ2xZCPMseh77AeZ0BQboBu0Gt8Ei8WNqMD2kVNsSBeVlqj
   L8CGWs9fqUmLPbM7jzUuoqlOMq5IzvvlLEcV1oJZgQHRzf0jAAn+bpEFH
   A==;
X-CSE-ConnectionGUID: PyX39yL+SVKMrMW2/dsbyw==
X-CSE-MsgGUID: CNR3dNSXQvaf1q1OjhKsmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1976563"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1976563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:39:25 -0700
X-CSE-ConnectionGUID: 40tjnXsDTpK5rLfKIhmHGg==
X-CSE-MsgGUID: CBHi2dOYSEWm6pqnCKM6Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4850248"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:39:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 11:39:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 11:39:24 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 11:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTHim7NbCf+76gLcsRcvG0DHTVaseWZoVFR4tDKzD/X6inhnE7XIqa4uhMhzV6/Ov4qXW5MWJIUr9WqQQjZbm7fbFGWsxn4zrsai346+FCqzgb2xRtFbYD6bdQ+zL8d7iVqzKW/bLcQ8XdnN0TTGYAenbCIdqNv/TcYHafJbFbL8HVb7oUSzhqQ78vUMwTe8OgjC1X+A9tThfUcPneDhdQL3kcb/PUGFvak0cCNaxUoH0Oa+bNCXJlv94VfhRtEHfKChSpkxsECLO5JwSWrKQlr2dnZqLpHNe4TYNVgq/c++/Y9OmnCOOlCS1Blbl5hC1q0ke19KmAOlWIeSJ3hRKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9RZNBNbFhKoyDAO+D9dcapaBULXFBsg0lo4D5AXl4o=;
 b=wtVUJLn0hhGqEBavNUwAjCZ+kMVrdf55Ww/0v7a5OS9JDtUAHa2OoC39w7d3wUX3u+xlkTxzTarKYTk3xDMc35qahu+0EUIrIJ17jat4UBaWDqz90JIKWdKHx1t559rlIlpfUObn3J9YaQgO1AxiWebGpAaURw7/06xDzF6ir7Pf/8KljPlJLZbn3FGh4PEncXOQ9DSu9mVZk65KkrXK4qNb4uLX+NKJJwN0gtddOVUjbR1cZxP7L7Yl7VWTp2qazeQEePCBNSUnWJgCjnp0YTDkl27TH5ekfwRKwW2sONoZkR3W5P2rDo84kW8V+QKzF82r98VrgyAhiaqz/4Ia9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 18:39:19 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Wed, 28 Oct 2026
 18:39:19 +0000
Message-ID: <a0dd7ad2-06da-404f-9d4b-dc50e4b9a9df@intel.com>
Date: Wed, 28 Oct 2026 11:39:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] selftests/resctrl: Detect vendor to select memory
 controller sysfs name
To: Swapnil Sapkal <swapnil.sapkal@amd.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-3-swapnil.sapkal@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261022132517.46805-3-swapnil.sapkal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0127.namprd04.prod.outlook.com
 (2603:10b6:303:84::12) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 34cee5b6-aa1e-479d-5820-08df3522c722
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003|261021121427099003|261009223027099003|10067099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: SAUmd0CiMpJjZA/g5PCGRsvQkGsTUs88MNsvfk2iBeRwRNWe+l6ngQF946HaOdCbM9ysyJsMHiTBonSscYZdowcLM2Jy06e7eWLY6Y7escGHml8rn+0sZmY/EdBn+zlzomnOm5iAPAU+UVLZUPSLZxaCNfztd8StzPPOdfS5DRRHe2Fn2VTTirdauIEshTnHEArbNDpubD1cWFyRwVKIIMXhdjlJKOnvkJqqO+wGkg1mLpl43Q4DYMSSBqpyor8zg+gSrrYXKouathLetgwXna6gmsITxBUIW4qSn00oCxtesWjcyTuOA3JSA3sKyg/LVWDYl+cnYdjWlbj6l1xmn3Ok1t/55330LtfH3dAEbopnad1lNG165Ch0iEOZw+AFnCBTa2X+J4yC8+4WvXeCGypxZKsTLwx6m9+7+VMHGNXo5SvsjKAAxq7bI++5ReOUfPXpBADk9OXjXs1X1LBAMT/EDM5wa5DO/VDMFIdeXUjCO8GpBT3IsvKb4gjSoXmLI6BJ7HYU++kOiCeHcvA9nbpB/S2OUE7L5cTkOaNxNboprAR+fizpb73G/TvkZW81dfu+Bhg1/y+yz/+rsRf5A/62jZSkMAW2d9jZls2cEjvGlOCFymDq7cQUydgaXpYUsxgb4unJ5Kw9jRUIgjs8nWpQPV2EopRLRsNhV1K6cL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261009223027099003)(10067099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlV1REJOTi9VaHQ2SEgrMGk5anU4bk9RK041OFhMRnozVldUNnFzRVgvRXZM?=
 =?utf-8?B?dXMzakFTeStBOU9BL201NTNqY1Flcnl3SExTM0ZwcGRHWEZCT09KQmFkREcz?=
 =?utf-8?B?U0Q1VzhKK0dxb0J1UUNFNy9pSXN2NXJCR1U3S1NtSDJGOW5HOFp1YkM4QU1q?=
 =?utf-8?B?L2RxaEZrUm42YjcxNCt6NzNXNFVkNzZ6VHFGRzFlWUdQRHBpWEVLODlWcHhL?=
 =?utf-8?B?ai8zNlczVU0yMHZKVGNPOUd6OFhrOWVGOEFsZlRaSXh2OVYzSlh4MnIxS0lw?=
 =?utf-8?B?c25aaWlkQ0FudktCeGxud0JYVkc2U0U2T1prdktGMkN2a1VsRk5UbWF6SDFL?=
 =?utf-8?B?b1VDUU81Rk9JcnM3dkdUc3czbEVUcGRUVUZpUTYxZzFNbjFMa1Q5SzEwZmVC?=
 =?utf-8?B?dDBhNEV1V1JVelArM05UODQwZitGdCs2VWhEeEMzbmZ3WG14WEVTdFdqaFBa?=
 =?utf-8?B?eE5nT1NwRXp0QmdzMm8wanhuK2N5YWVCa1gxTWRxb29ua0R5ak9QVXNWZEMx?=
 =?utf-8?B?VStxQ0wyTlduYzh6N0RtN2dOSkNoUzdjcHJLZ0Nlelo5cncxTWp3L2ZuVHAy?=
 =?utf-8?B?UHJsS0EzdlJTcGoreDl0cWFSZXpxc2UxNkZVenA0dURqWlo4MnBGMmVCbWJD?=
 =?utf-8?B?Q1NlcWFUNVJYdnF6VE0vdHlRZ0Y0azNBTDlVd1cvWURuYXgxb0hzcVFkb1Jx?=
 =?utf-8?B?am1RWnhNSTdWVHBZbHVCMzZyTTRRcWZvSktoTWlyU0RLSndTQjFNSXl2ekUw?=
 =?utf-8?B?K1NvU2NpaGhEVU82NE16clhObFVQZU5NdzN4ZVRoT0JONWh4VHdUdXhYamI4?=
 =?utf-8?B?dTB2VkNiUUtNY2sreGpteERHQlZjU1BMc1dlMGthWkxJR1RYYnNJMDFYSWs2?=
 =?utf-8?B?Z1FzUldONWN6czZZcUN4Q2UxZWs0NjhNUUNBclNYdzJxcUlBS3pzaFpVbXky?=
 =?utf-8?B?LzNRMUFWcWUyY1JLM0p2K3BpdTcxajdhby9kVGlSTXZvRGw1VXZKU2c3TDRj?=
 =?utf-8?B?RCtSNkZYNkluYnpuQmNHTWRJZ0VYM2N6RTNLRU5TRGtHNmhsRXZDVzExV1Zo?=
 =?utf-8?B?cUhFc1ZhcWczM0dHYkpmNm95T1JxRFV3WDIrd2cwQ05Gb3lDY3QxaVJUVTN3?=
 =?utf-8?B?Z2ZPSzZVVU1kWk9zdGpHa1VsdzBQZTlVWlRkL3Z0ZHZBamlsSlVuc2pDZkZv?=
 =?utf-8?B?SFNkc3ZvaDNIQ0Z3RGJXMTZyWmVpeGF1VWsyQ3RvZUJDMEIwNUtoQWJMWm55?=
 =?utf-8?B?a1JuZUVVemlYS3ZJZFVkekxSWmtaM2xxSEd1TzFCcExieGFUOXBJblkxVDEx?=
 =?utf-8?B?bDJFNjc0QTBid1FDbTdKeXBWdkE4NURFcW45cUJZdWt4Q3RrQ3VwaW1ZQXNT?=
 =?utf-8?B?MURGangzd1g3cllOeFhwanZJY3Y2ZWR5N1hwZTJ1YmVrVHFnWFVBS2p1eWJw?=
 =?utf-8?B?bWs3TW5jQmhaa2EzSkRHVXdEd2tUV0JRMzM5cERYSGJCVXpWOXd1REtady9F?=
 =?utf-8?B?WElPaVRqek1SaExQTHd3SS9BT0locndyN2VtMk5VbzJxdlhidE5sWFdNSDh4?=
 =?utf-8?B?SW56WUZRc283TllHNUJXMnQvZ3lmeEVqU3orWDVicVdxMGxKbVZMb01OSVNq?=
 =?utf-8?B?KzBGR2NOL0tzNktPUnhXWXlvdDdhZ0VmQjFoM21hU1BtR1d1VkdXY0FtMjlQ?=
 =?utf-8?B?OUVrZUhHc2ZmamozQ3JjeDFkbTI1d2ZRdHFyS1NqTTF0Y2tJbUFwZllZakov?=
 =?utf-8?B?a1IzMGhvUWhIbGd5aXNzTW1EYWt1MHQ0SVprOUU2YTdkUkpnaXkyNFBDeGpr?=
 =?utf-8?B?bHdoVHZxWXhKNGFxQTAwak1Fbmtoa3MrVy83NkhHV3N3RGdLZzlXWWpVMHV5?=
 =?utf-8?B?T3AzUW8zRVJXd0Rab0Zza2JuVXZWczJqWC9VQWJQMDJyY3ZYSWZPbEdXbW92?=
 =?utf-8?B?WU9YZjZ3ZGNCaFdMTXFTR2xWcHlZSEs1a0cxVTBBdDkyL0xidW1UdWd0SjFq?=
 =?utf-8?B?amJJellYTGcra1FvNWNON2JocUJCUE5UeFdHaE8zK3lwejVRNmxzZ0d6MGVG?=
 =?utf-8?B?eDdLYkxUQTAwWWk0aytTbUl0a0tKa3gvMUxzMnZua2N0bUI5UVp4M2taK0pw?=
 =?utf-8?B?d2lFRGJIczNHUzVOdnlaN25QaGdSdkZ4SjdoeldYU1JWSGNlS0liZWVRUmQv?=
 =?utf-8?B?aWQ2cDQvSzFIckNIZzFVSGFKU3BiRlF6Z3hQVWx5Qk5DOUFhWjRyUnVMUGha?=
 =?utf-8?B?N2c5M0FTWmRoMUJMSXNiRmFRaU9SQXBOQUxHMTB3aW1BTTZhdnRoSDBLbGRM?=
 =?utf-8?B?blZ3dHBiaEUrbDJqeTJnUkRMSndzMUx6eVgzYjBRcGJCRDZkOERxSC9SQjZT?=
 =?utf-8?Q?Y5Bu4v1uPLytTuZA=3D?=
X-Exchange-RoutingPolicyChecked: KvpZgSdn/9XA8TS+YgInnBmxQSpvievJKCvND68bJMf70PHLv4VuRQ9Tsauhrh3nXmjTHVnBmsw7icE0Jt9NZPtKFtQYVEkiamWSD2NHxFEvUpp9KtJSqqZHdrV7ODxm6aAoRcUOp1s+WMTMTGt/8gCMYkgahxFoZGdT30a46Glr2XU4ROJ6xCt04AOiVM2setXVI1Up2LDXjPhIjoHOysnFgT4OATxHjtb7BktM6j4a6BAqhn+c93RdavCIeh5IIoHw7QkrIrl6CbAAUkYxEKtEG+yZfiTHScteacBdYGgEgtZO0oZKk8P9RZjGDMLiI5J651X3vpoVJhhQ86dq7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cee5b6-aa1e-479d-5820-08df3522c722
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:39:19.7278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MUx6uRyQoLJ0Sv+2T3a/xBBI7Sbp5bExffNQ5XHK4139NHwZg72a0RU5cK3lTUnzUtdI6dqTaJeKHfuNBsMw9sqX3Q3tzY/CMan76YsTTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
X-OriginatorOrg: intel.com

Hi Swapnil,

On 10/22/26 6:25 AM, Swapnil Sapkal wrote:

> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
> index c9cac957726b..fdbbe2155cea 100644
> --- a/tools/testing/selftests/resctrl/resctrl_val.c
> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
> @@ -10,7 +10,7 @@
>   */
>  #include "resctrl.h"
>  
> -#define UNCORE_IMC		"uncore_imc"
> +#define UNCORE_IMC		"uncore_imc_"

When considering the next patch introduces "AMD_UMC", could 
"UNCORE_IMC" be renamed to "INTEL_IMC" to better support how
this series ends up managing the architectural differences?

>  #define READ_FILE_NAME		"cas_count_read"
>  #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
>  #define SCALE			0.00006103515625
Reinette

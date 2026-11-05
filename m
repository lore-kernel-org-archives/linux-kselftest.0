Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793852177;
	b=SsEGvlRm91FH0AxZKwWl4iWy+NjIfIXTeKW8HaoAbo5A2TJWci5K+/PdhjTUqmKUjmz8
	 rZu0QrIgPCosP/TDOK+hQ3tOeCNJixVeCBb4SkvXX5+nn/dTgwKiaOu3X5ebTKSyT8hyl
	 PoVvO1tcC8TXwh4aZ4z/MMQ5ipX67eJ6Nx9vOHpW74nSFK3H7jtJmRg7O6SH4KOspSnz+
	 4AtxVuOBexRHyk/gpIpRjh+/891P532t4N/FxFOvuJl/pHDeq6r+Aid3n/jII6l+afS4w
	 6WsO9k2eEBfXpY+souCcbhOd5MhID7qgTL0W6c7VYTAVSC4w5zMUzAYNl0Gn7dw/MAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852177;
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
	bh=psycsy1aTDaTbHGWKYPiAKWGnJgC+yCsi9uYfVUI2Ag=;
	b=Sg4k04MfQ2taWLf9YeaINV3lnOmAkJ0iZ+IeITcDdhEr7DAltfEHzHogRWHz06A4yeh1
	 vr4lxkFW8BUduyBk33C9/TkjkUU9TDWIH6fkM6GFaEMgnyiLQce2T53gqrNRLnijn5do1
	 IkSP1ZYUL4/fnhs+ASRrTkX3lyhTpQiWHBFhm0mkjN/yZ70u5f0XVyxs/PZhPcfghmVtM
	 biZxQu1yxzQ4in6UKR4t2W2DjIFR+4mvOSeffhtm7yryCiXJVtU395MCJ5K3TNKv26+kY
	 hXWvdbELJfTKsi0i3BbfWciu6y38Y+WH5Psb6JxGbFTAIVQenHwdV+18bTE0englBHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L6p6fN7e;
	arc=fail smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC7606A328;
	Thu,  5 Nov 2026 04:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CBC7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L6p6fN7e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793852175; x=1825388175;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Xr7tkDqxd7XayxpXkT7+qSyc5eLl3MN7vpioFLlgJcQ=;
  b=L6p6fN7e7RXoG9KyUSV07jjaKz0LWXyZXIfOz1reyZxFmSfuw7wLVnNc
   w+QPLmpkBw16e74XZqTIzfnQAgR7hY1oYT0BDFVHiT0tV8Kp1iMi56OQp
   6DHARumY8Qo5UyLwAi7vxUSpU+ILoOdEBkLlaWSOxEMZV4FgyeBQxWGvj
   sKFWLo7uNVGv8Unjv620spBkotYhJ/yzNmTYiVlPTmbo67LOeAomf+lAv
   VmeM796yvq/A8LBGWdCif9D2yTsjWqFNwLp2FV557+6kw470IvCG+eBPz
   qT5oOhnuvSB46UqHcyZ1p4kn0gRYUGLFKIC4FohgCnwLgobRcUCtlRfPY
   A==;
X-CSE-ConnectionGUID: ihYzMQVSSsKSiNaFtJ1fMg==
X-CSE-MsgGUID: 2OUYNEY/QzePZuUKlQ0HPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2661947"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2661947"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 20:16:14 -0800
X-CSE-ConnectionGUID: Emgvm6HXThaRfd7yjCdsPg==
X-CSE-MsgGUID: VdC9XYXxTmSO9rMhcFXx2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6776954"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 20:16:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 20:16:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 20:16:13 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 20:16:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rs4EiA48Jw87qdoOgVu2WCzQ6ShwlJKulmbs6L1Z7m/XGewu9gsoyiGiyOxD1/cqLSXqXXJguvDu32xo9W5SZkrSj8rEgGAnMwE+ETszpwDU1SnJnF+ILGkUOShHTDUj5qmwZnkDNrR6uvw6qErfToxIRg5GOsSqUioLxBPwBDbhZfimBkrVEWigZaH8e9SOboHPIRr/TzJIBwK/kZvA5D6Vex7/UjQRgKXQ4DByMbrMMux3ql9TmYW6ebKMaV7zQ2PCcpAioB2Gc4/ZBnk0NAivNNLpB/7GyZqCW8lnUr3GRxn1+2eEn+p4N6cysNiVPtLYvJeAxkOEyuKWYnH0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psycsy1aTDaTbHGWKYPiAKWGnJgC+yCsi9uYfVUI2Ag=;
 b=idpKpIcvDHcgXt36lUDhOWUUF8sC2nM1y440dvQ/P/oReRLDxGg7JIA5x8tsHFWksBipY0aRJbA9N36JjU0cMlEHN8x+puF6mBpXLEg+HFa7CnfEES06t7ddzTlpMaFPHmT/nE5ZK90weaGSNtIKSPExL71kvczTruFXGNIpR2sdsc1+tdyvNqoL1XVz4IalQZiU4l3FXBIi7cC6zjvDx3kARQo0KFmWvFG/ULemV/071HxdcSHeGZhej3a0thkGKVSNAJHlAC0EIyUrxog6XW3l+jwEWAg+IvLUyb6ZPseb1BjDg252D73xJ8qz4wMSZeXvge89pM8zGv9u8+VdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by DM4PR11MB7759.namprd11.prod.outlook.com (2603:10b6:8:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 04:16:08 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 04:16:08 +0000
Message-ID: <4f656f59-9f2c-4774-9d9b-3a4d7b7b509d@intel.com>
Date: Wed, 4 Nov 2026 20:16:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] selftests/resctrl: Use bandwidth values for AMD
 MBA schemata
To: Swapnil Sapkal <swapnil.sapkal@amd.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-5-swapnil.sapkal@amd.com>
 <b250f681-5726-403c-86af-cb4bc35b9d1d@intel.com>
 <e30b8e81-938c-4426-8b4a-2a3a8d5163ad@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <e30b8e81-938c-4426-8b4a-2a3a8d5163ad@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0306.namprd03.prod.outlook.com
 (2603:10b6:303:dd::11) To IA0PR11MB8379.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|DM4PR11MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: c05bd084-aa00-47d7-6276-08df3af38480
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003|261021121427099003|261026121527099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: eTpnYgt+gaH0mbsjjgyeHKtNCtosh+j6CprAzb9o70msAdBLb4xvrMCcBv8jd3oC1rFKSzZOr3Zchf3HUI39lXhCTh2OCy60ib9KL1N+B+jbTVRDSZiWL6ejY5qLysIu2gKXsbsTV05e2adZIdEsBDXS/SaAPgXdjqsGeEWDPcKwePoAqxJTmsFvb+kIaIcsTn8MD3fs1QkEQPlBpFkupUW6UNSuLZZ5yy4jNgT/pVbmXNMKbk9Iw9CdM59TZWJ53G4fGLhDFylQF4/iYOOG0fdYji66RR8xbPCw0SneADiddk/KOcshc/EupwONJFKMlN5ClkuA4MV60Hbv/sLjClx1/jXMh/ITz+3miLOGuqfSqpVxdcODtMiHheFhhwxcj+iAZCmahi4SsY2ZmH3fuC0bO/nwKfYiBpimbEPz0+175ehxkDO3ZNj5MzegOzxCuUbXkFDa+l7PEMJDoPAlecFHf194VkQE6nIUfG/BCWxm+mnw13u3xXfLP5B9poRxX0Z7zVVAgIYK5W81dKf76gVWLiqrFHJDfrRre/J+EXXdyGcSL0zp5zMkqn6CQkIR7lPHJHuTWCqtjyCX00laTFRndA2JijH/eLi07Vzax5TBt4f/lQLMYurvGi0Zz+VWqHdPLUIguX0HsjwSkXvjR4zDPjxpIvqA5yMolEOxUao=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003)(261021121427099003)(261026121527099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFZYSFdIYWEremZ4dkkwTU5jbGFxbFpIS0RrZ2xSOHBsRmRGUzh4L2Rqdjg1?=
 =?utf-8?B?TmpyZFh2MTN3a1gzNktDbnhwUTlBNjY1djlJQys3eExBbGd1Z3VuWjl5QUhm?=
 =?utf-8?B?NU5oNGtoQnYwWndJMnlobm5LUnJvUHhwOWVrT0szVFlEaGVxZU40N0xrSXJT?=
 =?utf-8?B?VkFnSURvVERsYW1mVHNrY2tyeWludW5mNjVVcjMzSHZKbTRUVFpueGpvZThu?=
 =?utf-8?B?eXovazVDRE1vTmYvTzZxa1ZpNFpTVi82TCtzNlo4a28wTW4zTUVNTFNGNGZS?=
 =?utf-8?B?K0h5cG5pTnNPcnBxWWRZMDMraXYzUkc1ZWplQkNYMXNrcHVXWjJHNXlMeGIv?=
 =?utf-8?B?ejdDd0d0cmdmbmQ4OEw4V284MjBEVTh5dUFsNDRhUmxXQSt5VUg2dnFHcmtm?=
 =?utf-8?B?ODVQK3VMNWVkbkNQQ3FqUFNJTEllK3JWQVJMQlJaZG14OEFXc09yUHpDenZm?=
 =?utf-8?B?bnlhY0Z4RFhVc0xYVTVVOW94bkRseFpIUEZBS1BLcEVYcTdMQ3RJVkduRkNE?=
 =?utf-8?B?bGlSSnc0dEVRcEdMYTNJWE9YMjcwbTAxNkljcnRjS0ZzOVVvdm5Vbm9EK1Ur?=
 =?utf-8?B?eWVmTHQ5NFBBTGpiRmpKN0dEUmpmQk1HVWh3SzkrRTRQU1dxa0V1RWJMMnVQ?=
 =?utf-8?B?T1JZOE1SV3lZL1ZBNFc3cTNZZW0rY0RKU3ZiYng1ZndIbXErYzZIOHl3STFm?=
 =?utf-8?B?ZUFuVjl2U0YwNkZBc05MVkV2M3F2M0tLTWkvbnExLzRYenFYUno5ckRlbTF2?=
 =?utf-8?B?dDRIcit2dGE0YUgra1o3ZjVhWStKTm5XOGp4b2V0V0Rza0prUzJyQUo0S1Ba?=
 =?utf-8?B?TkZVaFpWWHNZNmFsRXc4SVBXb3ZFQkdzZFJTY2hvZmJkdW5hQkNHUmxVOHlw?=
 =?utf-8?B?aUFmeWkyRFVUQnZvd0JuSVByYlRwTUNzS2tHNHdDSjcwd2VUZW1uRTJ2ZGtY?=
 =?utf-8?B?ak83OVVRa1RRM0NFemZodGJlMDVzK1BBeG92MktyNFUwVU93Qjg2aE5yQU1m?=
 =?utf-8?B?ckZPVjkzRkZsOXVhek8yWjc1QUNDMmNXM0huQVpmLzNJOUJIZEpDZUhGU0Va?=
 =?utf-8?B?RmpCMENybkk4THZpMVkxNzVmZ21ObEdqd1pwNmhmU3hWMFVFOS9qTmQ4dm80?=
 =?utf-8?B?NHlTSUFjemVTbTlrR2tWT2srZnN4a3RvbkNtUXZtZDBxai9QZmRpQ1JoMU1I?=
 =?utf-8?B?Vzhtc1IxejFBcmxmRmlwZGJFcHdPNGVmN0M5VVZsMEQxd3IvL0thU0p1VStT?=
 =?utf-8?B?ajJmb0VLZitLdk9rQk9kOUtGZHVNRnU3UXV0dnN1ZkN3eTVRQXZraDA0VDVS?=
 =?utf-8?B?VWNXZlIrNFRTeU93RmpzT0R6dWU3dEpERFJEOWhHNDJQYTFVVVExLzZURWlh?=
 =?utf-8?B?c0wxZkRWZ2RGWXRGT1dDd1FwMXozS0xjWnk2MHVyNUpSdXA3N3hnQXV5Slda?=
 =?utf-8?B?QyttNVA1ekFoSGRMSmJ3OVpmVUpjQ2tGS3pZTU9zWjAyY25LMGEyUnRRT3E4?=
 =?utf-8?B?M3l6NSsyZ0pudDh2RURmRTdNOWRBUEhOVm5acWdKc1Rhckh6ZHFablhMRk5L?=
 =?utf-8?B?R2dGRDFUaFRuMWU1ZWZEZzE3NU9LTldzc3ROWmx6MElobjVQNWprZTdIZkd1?=
 =?utf-8?B?emlIMlZBdnhIT3ZZbDM0RlhsZkdQSXphSmZuaU9GK3BHRThpS1lLcWlnUlVK?=
 =?utf-8?B?K2k1azViVGEvUFVyU2g4cXZvSWJDbnMvMlZGNnQyT01kd0JvMHdpSlNjbWlF?=
 =?utf-8?B?OXJGeGgwUzlXV1QzcTFHUE00d1o2MGdIb0JhUUxEeW1IdUFSbzhtRExCRVJH?=
 =?utf-8?B?NXdleHBEWWpBSmpGd2dhb2V6L3FlNU1pZ2JIWjd2UFpiSkJabHZEUU1sL3Vo?=
 =?utf-8?B?SGFiZXFlUVl4QjdBQmk0MTdIb2FqSU5MRGlLaW1mWVV5ejlrS0Z3bVFjb3p2?=
 =?utf-8?B?aTdzTEUxbzFTSmhMNHI1TE5CeHVuOVdOZmxOa1VBVUVqRUpUVjdPZ1JaY2pw?=
 =?utf-8?B?NkxaYllLa3lkYVRrQU0wYjBNZTNaRENPYmVTZEtKTDkwN0QvSHp2a0RNSStv?=
 =?utf-8?B?emhUN3JBVVo2QVBDbmN2ZHE0aWdYc3NBazAyU0ZaYXd5ZTVZbGt2NXN0NjdV?=
 =?utf-8?B?TlV0S3F5bE4yMHY1QjVVb0I3UWV2QjhNdXlYaXNabUhheWdkaE8xWnhrNVZ5?=
 =?utf-8?B?V21MUkpkTjR4Z3JQOFFsSkJDUjREZnBLcUpGclpRQS9LUUxwNWlyWlNoNjEz?=
 =?utf-8?B?OWxSV0hpUUZ2ZXdvdTVHcm0xTzhGdVRIaVpkNWNQbjVtQmxQQjI2L2RvbE1l?=
 =?utf-8?B?aUQwRkNkMTg0MGdQTGtLNE43R0pWdWh1U0w4L09LcnNtVG94eEZpdUI4cmZX?=
 =?utf-8?Q?CZL8pFsk4vUIKQWg=3D?=
X-Exchange-RoutingPolicyChecked: BhTlvbYzdrU/Iq9l5FxZsgst484N/Mrae4PkaF0Hn4DWBwCusZIPY7xIlxAAzrj2dEVGd+MF9SU5lQtRhKL4F+Y6Zha59B6KXDxONAs1lnUyV+2eyNsNbK2KJLe2As3Niv43EwjmcZwzrX50BaGTLnHTPHXFy7v+uU6odREWbWAh8hjeXjAnzej5lQLMZe3Wbiy+A7JfjC+LxBzuqOnR/IhDEfzxuTdPptyXRkEc/mooVBn6aPsS26vXOZMifycyCaQB5lSU9Er38xkd9sHTWys5UHgM9U/F/ti7Ahby6y3OR1gC+P88vYQv90FrDjXlDBD9BOzIqA8x3tJIFNQpcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c05bd084-aa00-47d7-6276-08df3af38480
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 04:16:08.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5vplTSmcYytb7bjAgeUwJXh25PTDZwBTQG63HoJSePBKtkdZO31aZqXkKG3s8zOf3FNDztyjUCVd8kQevkI95wpYqFM2V+7+VW04L5dZ18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
X-OriginatorOrg: intel.com

Hi Swapnil,

On 11/4/26 8:05 PM, Swapnil Sapkal wrote:
> On 29-10-2026 00:15, Reinette Chatre wrote:
>> On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
>>
>>> diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
>>> index 17ae73d3476c..947735e26099 100644
>>> --- a/tools/testing/selftests/resctrl/mba_test.c
>>> +++ b/tools/testing/selftests/resctrl/mba_test.c
>>> @@ -13,10 +13,51 @@
>>>   #define RESULT_FILE_NAME    "result_mba"
>>>   #define NUM_OF_RUNS        5
>>>   #define MAX_DIFF_PERCENT    15
>>> +
>>> +/* Intel MBA is specified as a percentage: 10%, 20% ... 100%. */
>>
>> The percentage based interface is the generic interface and not Intel specific.
>> You can drop "Intel" from references to this interface.
>>
> 
> Sure, will do.
> 
>>>   #define ALLOCATION_MAX        100
>>>   #define ALLOCATION_MIN        10
>>>   #define ALLOCATION_STEP        10
>>>   +/*
>>> + * AMD MBA is not a percentage but an absolute memory bandwidth value. The
>>> + * test sweeps the bandwidth from 4 GB/s to 40 GB/s in steps of 4 GB/s,
>>> + * which the hardware represents in units of 1/8 GB/s (i.e. 4 GB/s -> 32,
>>> + * 8 GB/s -> 64, ... 40 GB/s -> 320).
>>> + */
>>> +#define AMD_ALLOCATION_MAX    320
>>
>> The AMD maximum is enumerated from hardware. How can it be ensured this is
>> the appropriate maximum for all AMD systems?
>>
> 
> As Babu mentioned, it's difficult for a single-threaded workload to
> reach the hardware-reported value. For that reason, I used these
> values to verify whether throttling takes effect.

Just to confirm, my question was not about needing this value to be the actual
maximum of a system. Instead, I just wanted to confirm that this "320" value that
is hardcoded here for all AMD systems is a _valid_ value. Since the actual maximum
value is enumerated from  hardware it is not obvious to me that all systems will support
this hardcoded maximum.

Reinette



 

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DEC4477E7
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 20:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368830; cv=fail; b=WGw7kAaxNaXXW/pGzkYTayPMb1rfczDSo0G7SU+31/G15NsGsgO7SfWkgTKyI/ploJxDDw3cyOcASaF1RdhI9yLcCr/RL8gkVbP5eINUsZAyfQyvrjMOnyS94axpVWyq+r0vvvOFSAN3LdqqQnnvA3gPBhS5XrUJOuqOn/+kUoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368830; c=relaxed/simple;
	bh=uU2h4r5V659hP3oQpbnWmLbfUtnV34ZMCP55NUa6E8Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZY3AGCnAuE/eFzcI1vUQSB4NBMyaerA+CUCARei6a2FiT5huGxOS5r7dcSnVUedqp87haSIKmG18i8uYHYL4KlPG3Px0qsy+kLjtjOHvtofSd7yvCA6UvBjHIzV34Xv31ouyBH10iAAZSrnbq859SQtsJD/O8+q8WhOgYIQ/2aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W14PrYUX; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W14PrYUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790368828; x=1821904828;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uU2h4r5V659hP3oQpbnWmLbfUtnV34ZMCP55NUa6E8Q=;
  b=W14PrYUX2wLBBn4ihHHIqY1wSuVQxRytn10coPGwXVh+RIty1wF5TywQ
   0AjVTR030clI1O5V2HFOBPp6TGKSp9I1EL4aEjpL0ujeiUX2E+eMajdD2
   kvS4Ok7p5uEXnsdUDHCnR3KlLT/gZOlIPC7m/Wnj8A8Jnl9wkRNHAETjr
   1fE2DojyI0He96TuWDzJ8nsRHluSxeqk0nUSr5uOkY+ylKDamoIvxZ2/N
   /Ga4nZSw7hiVeHbYEJ+Myp0UM2jQbbLvWdhJwuNbbs4Ifs4Nc3ckrShQP
   hn5BtX7ltNNYsmKvuut0UNffd3icg0E2AX45HrIDHqcOfIgQnnE06DUEN
   Q==;
X-CSE-ConnectionGUID: IPz3HPMcT2KqPemWW3mQiA==
X-CSE-MsgGUID: ka+5ruEkQU68g0ByG0pyag==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="78722108"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="78722108"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 13:40:27 -0700
X-CSE-ConnectionGUID: 2pEtOr6lQlGnmepCrMe2eQ==
X-CSE-MsgGUID: ntwcq5QlRiCbmJQ72HcjwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274584183"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 13:40:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 13:40:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 13:40:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 13:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4HAzEgoCoJS4kf7yzuJAOTPpEtOmAGHQncVbfXQ7HkAGFagZA9E9k6TV24n2Dq7CiugzfacJemOw9fQ+ohcvqZ+2359ksvfqCbkePpJtZWvzXIi+YJfwRrIz8aY2m7P0eqleIqliFZTd07SRco6wkFS8cR7pZmQ2VzB6dQ82k501Lbsg42KPL2an3ekmlEHrwsTiS3JQ/J0hh8iqyJG/sjQbjslB7j4pNz85uXVaBAfCnlYmXXXoz2AZhKclPLcMGoR3iZRyBhFj4D0T28N3fJlBS9Dx79HiSV1eqc3omsb8WMmPB1wEAuCZDAMGbji8CtD28oCuDfNtD29k+bk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLQ16NkOT42fFMPcWv2NlwbWp8CPDA2FwmEcjVWAZos=;
 b=Ct4hyoP/eYTfjwZp1TqUGGzaH77D6c5YPupkplqlGUXJh66z2GY3hmObTovM1jR7jbZb4T802VoPoAwy2KmsJ5taqOWYnWRnL8XgQ2NMXUycbq/CjcAiGqN2a8SXZ9BQGsBPHpxvu2snIfdZLoNHR3V14hb1pzgBrkzZg/jWiQfIAcB5O2BGuk8mOHXTlK7TywjZhjdW/nk96w2QC2C0s45iV6kl97eNHAALFsl/ZzV5XWWGOART405/awxeJGyCi5rP8q+g/rVANukEWLEBqknkrFDImZiqRbKaudrr/+NVChOpvfvi7e2M5BzZo9NSbj6H5POYgONooDKboGABnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA4PR11MB9278.namprd11.prod.outlook.com (2603:10b6:208:563::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 20:40:24 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 20:40:24 +0000
Message-ID: <3aeee5ab-8a58-4702-90e5-0e69171a5e1e@intel.com>
Date: Fri, 25 Sep 2026 13:40:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: resctrl selftest patches ready for kselftest "next"
To: Shuah Khan <skhan@linuxfoundation.org>
CC: Shuah Khan <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
	<linux-kselftest@vger.kernel.org>
References: <92c35a79-1c8c-4543-8fa0-0ab78b05faae@intel.com>
 <CAKRRn-d+72is6hNnyTvxUWg0mRWm_BDBcqHZY0+ahdzoNJV=bA@mail.gmail.com>
 <78508c04-c9f9-403e-b13f-220a3d74e956@linuxfoundation.org>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <78508c04-c9f9-403e-b13f-220a3d74e956@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:303:b9::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA4PR11MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: a9591a64-5cd5-4a43-dbab-08df1b453969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|13003099007|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ugm8VKZ4Fzq0CARo23zuDix3qItNOd1hguKowTbF8wn94K7EIa/acd4mxxw0/s4KL4cjrH5DKSFkexR8jUXXcQlAa5sce56nluEJMW87qEGhtgF64ZwaX5O8kr0JSC2aLWPNkt55YqMxrOLQ4pZI477vgFWI1PUgSoTcTEBR0DfmcDRMzIDBqfI0IVEiBESi+PiyhRCONeX0q42pmp0AyDFhTXiUSb5TXIJIkX4uIBv9/2HuNHldWeXakf7fYEHZlI7dhos+54BicJCT/ZOVr1vxRBPBREmj92dcCAX3iz0r7Abf1OtbmNN3UavaZROuqMA3eWyVJcEku7loxKS0NZOM/2PxoSrMuseFnn7S3rjLGlbSuDPEtRoKqtMpDYF88rjBR7ozvu04HMGMO68HgQeUpSxIyQEpXIjDNaLbypu2bt2Ub44ye5IPONlZACFc2OyQO1GAyvh+8I/iTm4OK3qBZJYcBzAmS8579XJxx+g2RMMeSbfGh8/BRjuITCevw8h3/MT5RqgnVwssZ2IVBcD6EttPlZAEbA5kNT92xOzYsb/dnpCqEgFpvOB5OL5HnYcVB8LSO8j00HGFnP+8SCOE0vzjEG9w8SNAZfQ7xBkXqMmQ2Tn9qPElu3mBtZDo1QhqRttvDx4GcCQ9PHQaKOueQFaL7ZrIUJruhDKiRLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(13003099007)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW9sVzIwcm1VRFJkZTNiY3F3bkxUUmQ3RHNSUkp4d2RxYnptdlRZVVZYL0Vm?=
 =?utf-8?B?OURleFFGNEoramMwWWVpVkdsWEJuTStJTllVM3pONVVxeTlWUzFPL21kUkJW?=
 =?utf-8?B?VmZvVXdCRjNweDEydXR6bnhSZlE1VVFsWTZYL1JwcjNDdzV4RUNPT1pwdEFD?=
 =?utf-8?B?Lzd2aFJUeEY3b0NuZU9WQ2hxREExNVpYQWU0SHQ2MzhZRGhXUnd1b0JKMWND?=
 =?utf-8?B?VFlmNngwdjJKdTZMdXFIR2Q4N1JPTDd1aHVXem5NZzFScWtGSWlHRk8wWkt0?=
 =?utf-8?B?N2lmVE5UWGd3Q0hlbkJlcmMwYU9jdmNJRk0zNHdnWXpycEVmWGxtY0kyZGs3?=
 =?utf-8?B?Z3hYeEV4WjA5WkpZV254SGoyeFdQRjFpazBtWkRqTHMweXJSanhyOWFGdE5L?=
 =?utf-8?B?V3hOVktzMFF6d2VXN2tZSHB6TzE1TDBVczk0OEc0TitIY1gzR1REU1dLTFlm?=
 =?utf-8?B?bDhOcGFrbzNDY2lnQXRULzkxMlhXbFdvL0kySCtINHZ1ZGJ3bUtodHZWZGlH?=
 =?utf-8?B?N0dWcHI5RUhNNEVsT0ZoZ2hmWWdWTUFzYjNVN0dxb1F1NmpOeURRK1ZISDlh?=
 =?utf-8?B?MHhxeXh4akZTR1RMVk1wNEpORkI3Vk56aDhvOEJ3MnY4a2xHeEZna0R5WUpJ?=
 =?utf-8?B?eTd1cnVoNFF6NUd6eUoySmRhZXVaNERCZkl3Q0s2dWhYRVhlYm53a2JRc3hY?=
 =?utf-8?B?dXlwOUNJaWdnUm1KWGFpOGNLaklCTDBhVm05U3ZCckttdVVwN29UTE1udWJE?=
 =?utf-8?B?MVUwUFhzSjJoNG10STR5U0hHWWZSbEpDQkgyTmpYaEl1MzJHaENQa2x4YTZD?=
 =?utf-8?B?TmkwUlRKb3NqMDRWcTJlbGt1TVRsNU8vanNiUXpTUnJnYkNPQkRjRFpSb1B3?=
 =?utf-8?B?VS9OZHpsVHdpaEFyZ2FwK1U5VS81Y1dYUmJoQ05JWmJMYzFZazJId1VaeTVO?=
 =?utf-8?B?R2pYUUEzYm00clI1WkJteGI2T3RwZzVNc05iVW9Ib2YvYlh2M0lkVFp2bGJt?=
 =?utf-8?B?UWw0Z3dnTGMwQVpUUU9SV1BxcHhnV2gzb2YwdDN2NHJaUlNJa042ODR1TFlJ?=
 =?utf-8?B?Y1IwQzJGUThULzdaQWMrNlpubHdjNUQvZ2tRdEJZeW1yTk03aVJjTlNqTHk3?=
 =?utf-8?B?TGJrSWsvTTN0dWNqTVNpeEg4NXJXd0RVbWx4THBxYkpzNmkreXJIVVpsZkJQ?=
 =?utf-8?B?VnJBcmppNC90em5QenVDQ1dzanMxUkhad01xR1YzNkllOUxuK0RZYy9RZUlk?=
 =?utf-8?B?Y2ZyRjVqMWZkcEV2LzlmVTh4Ylp5U3VnQmZxL2ExSjhtQ2ZxZXkraGk5aVRG?=
 =?utf-8?B?YTlqaldOS3lQa2J5eWx5Y0lIU3RYdEpWckEweTh5U0NuNUJrOU9DVHZqekRQ?=
 =?utf-8?B?Tmc2akZnc2NKTDkvcS9MUVdNbzM0ZmE0QVJGZVMvalBBSUNUYUJSNWJybkdL?=
 =?utf-8?B?OXE3U2Izb252TlIwc3Y2LzlSWStXekJpbDgraE1vTHRBRmhKQzNxSVpzQXRM?=
 =?utf-8?B?b2JuM1FCclNaMFg0RnZLYWFORkNUVVQvbk0zUTZIRHk0Q3lGVUtQYXB5am9L?=
 =?utf-8?B?YnM1aHkxSnhpS2JuWkpSUWYxOC9Hc0JtNWpZWlMwaVArYURsS1ZmajFwZWdl?=
 =?utf-8?B?ZVk4a25RSmxQb2M0diszQ09SZkZLNEJUbkVqK3NWaDRMeHlCYXNRaE52dVBz?=
 =?utf-8?B?RE1wTk9YdmNuYVZVMHMyZysvNjlTK3MvamhlTWlQQTFJY2NQa2dVYmY1bk41?=
 =?utf-8?B?c0RoV0REc1A4SWRzWXlUNG9YSUEzUDFnSVRHT09MeXo3R201aFdFUDZKZ2Fy?=
 =?utf-8?B?VGdDa3NiWUlVT2xKWXM4VEZQK1hPZFJ5c0lwZlZ2UExSMmJ5Nnk4YmhpSmhF?=
 =?utf-8?B?Q24yd2VjYytHdVNSdks5TXR5c2lvQkZZQm1QU0J6YTNaRzNnK2JJWkhNK2VR?=
 =?utf-8?B?Vnk3c2lYTjRFcW9JQ2FxeGo1QW1WOHlHNVNPS0lESWlpeVFIa0ZBMjVYcDZx?=
 =?utf-8?B?bFE0SFd6R2JDYVV4b1RCWlU5Q0p4ZnZwZ0hMTTc4c29iU3I4R0dreDkrTEZL?=
 =?utf-8?B?VUc0WFVVNFF6TDlaNjdkeE00bTUxVGd2N3hVT20rZnpaZnRBSldnbDg4ZUFE?=
 =?utf-8?B?TmdkUGczMkFrQzN1NHRWblFaM2NldkZOR3lXNFAvVk9JVnJxSUNISTY4cThG?=
 =?utf-8?B?T3lLZ0d3dTgxRWxLbHBzVktBWjkxVEN2anpEZGJKT1dVS2NyMktTdFFmemt5?=
 =?utf-8?B?dDFCY2FIUTE4Z1RuckFML3ltdDVwNlFid2ZZTlZNdGhxc3EyTXhSM2JGL2lJ?=
 =?utf-8?B?dVVXY2FsV09LT0cwQVhyZ0U2NEFvZ01WbEhka3lTMjNkUUtEUTZDOU8xcFJM?=
 =?utf-8?Q?6vBHtqlhg00HBkXg=3D?=
X-Exchange-RoutingPolicyChecked: DMMlMmeEQaDIfjz2O5Hlb3S2OL6IUsrvE68GfYSk0UUWi5O/tSMQhogaqipfkYbUh7nkcvHIDVaRpi2OsLPyQeLFjRlHCX0nOxGmnJKWzIjaNfyTMfmMRgiWM2ZtGYznkAibwX17GcN0ZJ/Qat1L12mkkGNWBeqkoFGzoHAsNEZxHgtbh/mL7/ofbNMHjjtlCWHwuPMTlRYcTYz9mTWdQ2Gh/99IZPw6swRvecel/FrFrZjb6tgti0uMOBaRUastdafOkiWTMjFn6idAbyGgd8DOKfO2FKY9p/71mlxDN4ifFuEgCeoG2r0Yc9UNU0f+pZGxAk+ipWTBq/Je476g7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9591a64-5cd5-4a43-dbab-08df1b453969
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 20:40:24.0971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSpbi4NNFAgUsQJwZyDvq2JTLzoGpFY83Izxy38Yy7mjlQGORTxWarZxPXdxCjRXSgSjw9Hkhh3uyC7f2For5fvfriikE7JY5tm2/7Pu2dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9278
X-OriginatorOrg: intel.com

Hi Shuah,

On 9/25/26 1:07 PM, Shuah Khan wrote:
> On 9/25/26 01:56, Shuah Khan wrote:
>> On Thu, Sep 24, 2026, 11:54 PM Reinette Chatre <reinette.chatre@intel.com <mailto:reinette.chatre@intel.com>> wrote:

...

>>     There are a couple of resctrl selftest patches that are ready for inclusion:
>>
>>     "selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists"
>>     https://lore.kernel.org/lkml/20260821003908.12977-1-icheng@nvidia.com/ <https://lore.kernel.org/lkml/20260821003908.12977-1-icheng@nvidia.com/>
> 
> Applied this to kselftest next branch.

Thank you very much.

> 
>>
>>     "selftests/resctrl: Add dynamic linked list management for IMC counters"
>>     https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/ <https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/>
> 
> This didn't apply. I am guessing picking this patch depends on others in this
> series?
Apologies for not being clear. I intended to request for the whole linked series to
be included. When I try to do so all three patches from this series, specifically

	selftests/resctrl: Introduce linked list management for IMC counters      
	selftests/resctrl: Replace counter index references with pointers                                         
	selftests/resctrl: Enable dynamic management of IMC counters via linked list  

applies cleanly on top of kselftest "next" branch, currently at,

	9793a67915f2 ("selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists")

when I run:

	b4 shazam  20260801092429.533956-1-wuyifan50@huawei.com

Reinette

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE21C695;
	Wed, 27 May 2026 03:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779851856; cv=fail; b=RoSHnulfSKWb+KpRzma/KCFDFYATxhI05LEfnId0/hY8SGwM9MQnXsfCp9H0m8YmD3Ikbk5j5m0drZVLRfxg7/n8lr2yulGiubNw3u7zj9BiT8cSAG1RyvO5KrxNPMCN0FrdoXlToKv0eblZX+yRdjv7gtprOmg2Wt3giarui0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779851856; c=relaxed/simple;
	bh=ai0LbiKF4r6GhsyLYC6GQc7Ew2Nil0hHQ30iyAcd5EI=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OiWE63/npJvG27QJdQpf2LyCNYXcFZdTQtRaZhY3I+HQJZpt9JaFuE6PUGrhUoaqZ/gAzG6hNYEmDn2cuW2P3MbDYkXY4gXlSGZggKhtJCNYARgXsBdHMjZtHXuhd2Sk9dLYhk75lrx9YUFk2G/qR98a36x16hOs2Kz3BEhbkY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJJXbmvr; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJJXbmvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779851855; x=1811387855;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ai0LbiKF4r6GhsyLYC6GQc7Ew2Nil0hHQ30iyAcd5EI=;
  b=SJJXbmvrNeDT+kFVOxE1OWgJNtfOJiaWDj/8w+X0oKCJ06B0BqcuqAkd
   w9ZCzgR+xAFQgmGVsMEqrp/T77i1tnrkscjOZgDhCX5eC+S6xKQDhTKl/
   vmvxqZcRxd8YlyGAJodhkvL2O1tWbwzl/di10Sk01Ml2rv7sdcKMTSgy0
   cVrrZgQEp4N3lueEPTIixKlMFNbfEPITbF7FkQduhNV39q5PgHm1rkw42
   IvJfmBS+llkLSpTUFhpBMqLOHumEOznkxZgRbE4zUB7jFPx74WRUSDMgL
   Df9KQHkvRaKnJoSczzAILh2tSNFdGqqdbWfftkcquSBSdf5nP8zcGZAf3
   g==;
X-CSE-ConnectionGUID: i6h+wyJ8Q1Ofz9gdFwAX6g==
X-CSE-MsgGUID: SMlPgSg1TAquygDt669zNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91366443"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="91366443"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:17:35 -0700
X-CSE-ConnectionGUID: gHJq97+fQyGNojG2nlei3A==
X-CSE-MsgGUID: F5YRRSMoQYOecGvijL6J1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="247055714"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 20:17:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 20:17:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 20:17:33 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 20:17:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m98CwRVFp8GJ/0BWW0frGWzeTRccdWnidi+KIKAkBkOU0vk8Vkl23x7gSg6gyR/bTT6qEVlOcSFmLx1VjU07vMFzVGipzc2fUlKdsk1p/wXnzrLBpaNEcvhz4vGrTWDrwqiB4jYNTOegotNtZ1BFkG9b0Fsxsc0LX2eLGy57zE0fLUyEvwyAd33CRi/GqGeeaLNL/3WAMwnltD18wyWuIETtZa26oXi93S7+FpYF8FuK6KBHogH95nNUK9MhcQUvCrQ9d4bNBY0bXLh0vNmagcNbtynEyvGZIqtnx0vs9pcX2AMU7IudKpkFbkZm3aSg/386gh6UYxdLJyS+OAY/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ig1DuaNfVJWu21Pt/pIDBf9hmb0Ib7USfFvCd2s1aTo=;
 b=ZV08rkG+8mlXy6zhnm7YtYvFz2FlgSoOpcP34Zm+a2+MRPYF5Py5jONJ8eYhDJQxDvV+UdtCzON4xAKyi14OBomW4Jm3gfriaG8eEhbmMKgADQB5AaRdc/EF3uCvCHsmep8C1L8qK6BnBn9bWEpxr1D2h0qt+1ZqQ9j27iYS7K9AVacZrQOqZ1geLI86Dq9bWiaaw5S6WeLtfWcKYavd8Wq+tbZSzwjho+cw27WdvQtkmQxpiVvC5ZSm9R2IugirxMYYnqaPBPz10U7yU4bNwnED1pU0iumhgrzPTctlRuUWzztfJM8bId/nW1EtofLHja/63au8g0oQDGGEpsN3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19)
 by SN7PR11MB6852.namprd11.prod.outlook.com (2603:10b6:806:2a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 03:17:29 +0000
Received: from PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae]) by PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae%6]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 03:17:28 +0000
Message-ID: <c9bee1ad-10f8-4e69-8d90-609cdd72580e@intel.com>
Date: Wed, 27 May 2026 11:17:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/resctrl: Skip L3_CAT when no exclusive cache
 portion exists
To: Richard Cheng <icheng@nvidia.com>
References: <20260526024251.7895-1-icheng@nvidia.com>
Content-Language: en-US
CC: Reinette Chatre <reinette.chatre@intel.com>, <shuah@kernel.org>, "Dave
 Martin" <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu Moger
	<babu.moger@amd.com>, Fenghua Yu <fenghuay@nvidia.com>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>, <kaihengf@nvidia.com>, Koba Ko <kobak@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Ning,
 Hongyu" <hongyu.ning@intel.com>
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20260526024251.7895-1-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6005:EE_|SN7PR11MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 3858e255-e0f0-4a1d-8fbc-08debb9e7314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IZFmdNFkwwjCPQEq9BtcuGSW7gdrmr1APcn5rbQ1lKQHM26X2LuFKpbhwbIPkoRIU0ARTVGDaajczoAs05ZCNAT4JPusYVozIOHlOVa3YDK8qsEJ9+ExRAJFDknMC9e2x9dKGvwJ0Yf0LMVP/GWqtC577Czfnk/0v30wPY6vJbBs/AjRse0aa9FDjS3dlRjfExk+CLOMWuA2auHnmEDmhBkLY5KcNQzBQd+uSNLZEbBRB33gktU/nBEkRpNsOFA7yRJgbf70ivFZKQ8p1mr2zwaIhgX1mytHOEeabA2kyaTRMVvyc9/UmAjaMCVlVt8S4+mDu2udSD5MPCmVS/7aF+0Pvb/B4Y4F4V9TjAYFQ6L6Kx7D1F00whO2JG3rFvPNbHLc2pu1QBvIPQSYdD8HWc0jokxXnvb6CUH+djl6Er+q7fkWgrjMPplxb0LynT/8Hvcd8+DEJfdpKdPGDSzHGbDMv43T/f7WEpQtBNnBVUBqy2AKhW4hEh2caUwRUDT1L8I1vQjTb9uBh0xdEsCOySFzTlofSo4+QPyTRsmECJqq3a1Tdr/z2Mz0MCh4cimuBLzre+Kd7Wa+vOBzsG9YfKOBtAHhOh2BmcAU5uVlN7JtpHfgsbJTThkSha33PkIYisPuO9Qnm+i9SXorWiKCm7LaGnGDRp9HPKMg66kFBIE43vzx4qNDY7LB/SVEgPaN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6005.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qy9JVFV2dm1TU1JzYm1KZEVBTXg0SjhRR0JEVmdJZXJFV0xCQURJY293V2Zs?=
 =?utf-8?B?QVRHeWJFdFpJWnlMSTMyQ2Q4VVV4Tm5rNmZqY1h3WXJFMEc4dWZ6d1RacVVE?=
 =?utf-8?B?YVA3NmZ5Z0cycjZSTzZsUFBwSWVNelJqbDNYbVdCbTlBME1iNDkyaVFaNkRi?=
 =?utf-8?B?R05kUXRsQ2VjK0JqQ002Q0U0a3ZjeXpUTUZ3TnBHR2FpMkxSWmkreUlpWXZB?=
 =?utf-8?B?US9Va1MxRU5LK01ja2VHblRKSms1MDg2NUNkMHZQNzV6aDNJLy8xZDk0Ymlr?=
 =?utf-8?B?NVpiQmZoUmx1VFNTditXc3BkL3JZYmZYdXJEYy9rV0RGd2JpWTZJb3A5OHVr?=
 =?utf-8?B?TEJ6ZU9ha29DQkJBaHE3L3RKbFRxUmRnekV3c3haOTV1OGFhTjJVb3VtdStM?=
 =?utf-8?B?Q0ZRejd6cWlERXI1elEyUUFaS0tvU0VwMVlJd0FUQjlQUGlBb01YdktRZXh4?=
 =?utf-8?B?VllWNytubU1WdGtWRS9VZlc0U0pHZFBNeEtvTzVIdzZPeWMreTNkelZuSHdR?=
 =?utf-8?B?UGh2R3l4YWphb3VUZGFla1QxRUwzQkJJK3poZDFrSGl6Wm95V2Q0M01XQjcz?=
 =?utf-8?B?NTE0UVVtTmEvUjQ5eHQ2YjJYc0RJMUpNWEZaeWcxb1ZJU2dJdVVBM1BuUWto?=
 =?utf-8?B?UmFUVzNhYy8rTWIyVE1hZVh1MlpQK2s1R3FtZzcxWmxQM09hSTZUeXVDdUtE?=
 =?utf-8?B?MGhiRGRBOUoweTRaVDZsUHN2ZkVHUTJ3cEEvUHdPemczUnZYVmR0amJQdDJZ?=
 =?utf-8?B?NW1ObmRoaWhvV29ueTJEdENzQlBxMWlVVnF1Y3RobGI4NDZxS2xkWERUOUNL?=
 =?utf-8?B?bHdrSFpoUE9JRkJVWFFPNTBQZXZJSGpTMldVcFd2aFQzY0hrWmc4ZWlNNTZZ?=
 =?utf-8?B?M05kWDQwcktVMGVSK2Z0L2cwR0NudTlqbkpzSkNoc1RlYlp0dmlsblVOZzlX?=
 =?utf-8?B?dDF3K0JReitqMW5OdEwxNlQ0RWhuWi9rNVFCMWRrdjBXVUhTU1pQbTJOdnBr?=
 =?utf-8?B?U3pOd2pkVUxZVC9mNUJ0aWVXNjhWNHN2R3RqZTNSdUJFZC9jbDdlalVpN0c2?=
 =?utf-8?B?UmIvNVliL3B0SXFTQnd3UGlzNFpDQ05IVkhoUFVWdmpRcGZpOWpBcm1BY09y?=
 =?utf-8?B?Y2VNUndCZnozQjJmVVV6cXJtd2QzYzY3eEdQQUc0d2hadEVsOXVuRXBBcUh5?=
 =?utf-8?B?YmRYYnpQWVdKV3QrL0RlS2dWVSt0aTZubGtrTVB0T1dkaUJzSW8xNlY3MUJp?=
 =?utf-8?B?ckJHanI0bjJsZWx4Z2RpaG1weWZUMWFWditETXIzTTBUSmxmODVTSkEwQmZs?=
 =?utf-8?B?Z1BaYUM4NEhMb21CTmU0V1VJanZ1cktrYVlvSEpRQWlXZEJuQWxIdUljRFhY?=
 =?utf-8?B?TzBYS0JwWDZXRjYzbGJhZytheUtCVFhHUEpUaXZQeWZRbE1aOUVqZThURDg0?=
 =?utf-8?B?MUZYQzlwUGFoNmdnL1Zob0l4WkdRN0RldzUyU0NsRUo2YTBrSDEwb2VJSFcr?=
 =?utf-8?B?SVB1TldDb3Z3VTNiQjlYaE9IVnVLWUdFYXROUUVEOHRaK2tnaHRQUG5VRlZo?=
 =?utf-8?B?bjNsZzdXUVhYSGlwTzl4cXJYT21aZm5Ka3NkNk5kUk1NM3lIdjZicW52d2o3?=
 =?utf-8?B?VDlGTDhrNDFNaVZJbExWQTZlUEw4ZUZJdFlUQS8wT1Z3b1NpMk9xbG4xMEkw?=
 =?utf-8?B?Mk9VMCtQWmJ5d2JabkRhTCtYVURuZkpUaldwQnhJSmR2ZjVJTllkTnZuSEJl?=
 =?utf-8?B?V2IxL3ZJaStCTUZ5M1Rrc1JWbWJCTGZ5aGVYeWNpYm5MN245eVpIYlNFdDVs?=
 =?utf-8?B?MGJDYW8xdHQrRWI4QUF0bFZITmF0WTNmNXJvbkVzSlJ4eVpSWm1mQ2wvcmta?=
 =?utf-8?B?VW4wWE1xaWhlMmZiRjB2SEhuajdZM051bDRCYnAvaDZ5Ni9kK1dzenF4dzVv?=
 =?utf-8?B?SmozRTlqRUdreWh6TklkVUxSVEt5Qm0zRFhONzIwUjVoekNiOWlFWlRPZER1?=
 =?utf-8?B?d2dRRmZralp2aUVwTFNzSXQ5SEk2WjV0VThIOFVYRWZRSkkzQ1BEdXlxeWFn?=
 =?utf-8?B?NU5ReVJ4aVV4Y1ZxOWdyYlZtaEVEdmdmUXVmRmlrRmM4aHQ0N3E3Q3B3akl5?=
 =?utf-8?B?a3puWTZZZStRcDU1WERpRGhNUEIyMHV4Z2VKQTRRaThJa3JJZUxNYlhYbko3?=
 =?utf-8?B?dDhpMkYwRG5xUmVLR0pGa3d1QU10dU5xVVZieVVGTG9GV0J1dTAySjNGY0Mr?=
 =?utf-8?B?c3l5L2xKS2xObGJsVW9uajJMNlRsMCtzTEgraXl0ME0zTDY0Y3U0bEtkcFBP?=
 =?utf-8?B?Z2tNZDdJL0w0MEUvblBCdE1xNEtDcmNLMG9nZGxVVGdyMFhId1VoQT09?=
X-Exchange-RoutingPolicyChecked: XH5yd2O0R63a3TeZ/J+efMNazAUMXt+GdcWODb0w8gZvJLGye8zuYFox2MWKspK4KubjGiZYaMpY7k24ZvpPpNynT6SJpdJN8crRb4C+edBB73r2g+TJVJh3Qd31VPqe2uDgqC1LDOBtKyh/yzb97hUrrBrHxkp5BJifU9hx4TuD1+0AlBlv0WhdhlmSAOwi261HUrvgeBkAXiyX/N7sJ21y96KwuLGBfN+vEhf3/RR4yymWu80Z4Gb/xNY0ItwqMkyMqjF8WurwxnaDgaoPOCgbZ2LD8vUZ/y8AkE8H9Q289De1p7SVpgCo/ExaEp6QG5sETZpLzKJjwo5yU30QTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3858e255-e0f0-4a1d-8fbc-08debb9e7314
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 03:17:28.7374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUlw63BV/qGw3eDleKxik+6vOxFr3P0086u70Uh3QVLk7nfGlRg68mFPo5E3Dc0xXTMJYNoz5fTB1Itw+S9x/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6852
X-OriginatorOrg: intel.com

Hi Richard,

On 5/26/2026 10:42 AM, Richard Cheng wrote:
> L3_CAT measures cache isolation, which requires at least one ache bit
> not shared with non-CPU agents, i.e. cbm_mask & ~shareable_bits != 0 .
> On MPAM, shareable_bits == cbm_mask is a legitimate state, so there
> might be situations that no bit can be reported as exclusive.
> 
> Previously get_mask_no_shareable() does the check inside cat_run_test(),
> which returns -1 silently and surfaced as a failure for arm64 MPAM.
> 
> Implement cat_feature_check() to run the same check at feature-check
> time, it prints a diagnostic and return false so the test case itself
> can know when to skip.
> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>

We have also observed this issue, and the patch helps identify the root 
cause
of the CAT test failure.

./resctrl_tests -t L3_CAT
TAP version 13
# Pass: Check kernel supports resctrl filesystem
# Pass: Check resctrl mountpoint "/sys/fs/resctrl" exists
# resctrl filesystem not mounted
# dmesg: [   43.705792] resctrl: L3 allocation detected
# dmesg: [   43.712878] resctrl: L2 allocation detected
# dmesg: [   43.719856] resctrl: MB allocation detected
# dmesg: [   43.726800] resctrl: L3 monitoring detected
1..1
# Starting L3_CAT test ...
# Mounting resctrl to "/sys/fs/resctrl"
# All L3 bits are shareable; cannot measure CAT isolation
ok 1 # SKIP Hardware does not support L3_CAT or L3_CAT is disabled
# 1 skipped test(s) detected. Consider enabling relevant config options 
to improve coverage.
# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0

Tested-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu

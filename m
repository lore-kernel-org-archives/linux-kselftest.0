Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A83603E8;
	Wed, 22 Apr 2026 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873790; cv=fail; b=lnUPO73n8Jj9WJNtZiS3oHhI9ptQT3kTNlstu82eTvqDxYFp5GtdTKwJ6yLstwO+GqK6XnLmKkIZz5DTxX8M44NN6lsGBZbMSUFIt6H+e+tGne/XBqZ1vl6KHybmKySH8DaJjZJ63Je/h0S7Il8RyzI2jsudKsRdFIXjH6V75fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873790; c=relaxed/simple;
	bh=ggpwMmdpD9AXuwQhxNEGiONmp+m9u6TDoLBnwuzJ3PY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zg6zhhZVGxDwbJqUUYoEGVatrFetyUXfl4Y8qK9SV2YmlfC/GYKRpYbBSxCfTEuCLMUuw31uWuBmQCrsEcealU/a6/bgY94ja4LrSIrkx4l0YlOKQdqGNwXmZ7z/jA7l1z7c7cA5DHduB/feG0aCYyUd4WTH6LeDuKXKMWFjwi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/BfNTlG; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/BfNTlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776873789; x=1808409789;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ggpwMmdpD9AXuwQhxNEGiONmp+m9u6TDoLBnwuzJ3PY=;
  b=T/BfNTlG/cybeOzU8njrOOFZsIWUeHYp6SEiVEAdqyoZfbflslwZen/V
   YKHL1WffH1SHN6HRfcgApujpmfg9dBwBd6uD102WllvQg3pWC3ANqbA+a
   gw7KGHglFtrex2Dq05GV4DGWbncSgiwxrwXQU5ZFOSpxjthjosgm5nXCh
   mXHzP+G2SFcOxGLdmFc5jKqcFyCP1Sw3ryEEybbZHc+Y91ZlpLye5fq9Y
   PomwQv/lEs1hzCH7VzxVlRhujYUf+IGvkbP1YgfwoOoIvvRPtSd+e85EB
   ohoa1518vIO110LUCr2oR8lml+2tiw3RZAxCgs7uRJySg+3XVHv30O9PX
   A==;
X-CSE-ConnectionGUID: V5Tqypn4Q6mOpFpSTP2Jiw==
X-CSE-MsgGUID: SQ7yISrXTwqIt945jDx50w==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77951425"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77951425"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:03:08 -0700
X-CSE-ConnectionGUID: joDyLmnGRHSyAbfGGjvPTA==
X-CSE-MsgGUID: WCE2qyIiSpSlGfDXWvfFyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="270507897"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:03:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:03:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 09:03:06 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcMbScRL9Wp7oqzo+PCpA1IrjLODV5bE6gWOy1R0Aw0gOodwjhn5tvcoSZSS4uRhKDFYJf1cawALETdypfeNyifUa3x9N+3e/kdNdrsLhI46Tnv2P6MLOuEfkx/MeNVwJ9oX99neNHcQOBUxXqtZpH6lyFJm+tM99bpE7zHzN4oiTEru4hwH/xBh1ijqfFFCEirxoyFpw6NuJz732FZSZBizZaXEtM5d3T54Y11yqgGu5emTSIx4p8pv7Nt86tRQmGK+BeS9+H0zpQiAwnrRBISZN7ZxBf4SZS5BNVNmyrB0f8GitUPrXaMGiDU29wO7DLop11LWFywSEpoHXjpfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOVsmbforFEcWZneYbF+w7M54jDpein1P/UwtH0PjN4=;
 b=RRsJjITykl66UtrEmGBX0/sDfD0mslQjD0mK6i8FY5qqA35CHH95jwwm4dfvi1/FsCu/FQ9rZ5Nc60oT0k3eLEOJUTLn+oLwNQqdTPCAdKiiQv3pwJ69CJOw0sHX/Hli9NUFfRIXBJnc+d48QCHYmh5/5tHeQlbeMdtJfw9A/iOEgIr6Fo7o0C7uWTosWH3U7EgCghJ4Uv5yuc3+4t7l+z2P9it8WpPN6rdXbehmWEc52YiZakXuhgEwZ4F12teJefCmc+VVm/BjwIQWBHvr2HlL+Y1ggIMsGQBuxLDfNyVeiaSnFM3un8m1F5vNRdnydnZdhcHCqC0iAtpphv33HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB5898.namprd11.prod.outlook.com (2603:10b6:806:229::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 16:03:01 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9846.014; Wed, 22 Apr 2026
 16:03:00 +0000
Message-ID: <b1d3a653-79a5-44db-8d57-c052ae537823@intel.com>
Date: Wed, 22 Apr 2026 09:02:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] selftests/resctrl: Introduced linked list
 management for IMC counters
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
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
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260410093352.3988125-2-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:303:b8::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c72f91f-7129-448d-10a4-08dea088a0a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: NqobMOr9YMKAa9SWkBmPcg7oRuRdVFCIFz0Q+I8LIE4zV3ZVyEr+OXNx5vg+1x6+vWEOkhatqFu3tFT68ZLF5+OMKs5QKqcgVPJQu16GhpxUr3deGS3d75bYUAKo/HBgnALPGawnla+cNXqtYeMJPzK8skSN3n/XR8bkvurKS8KMRTT+7uSAcMsJUcerMyqwS/UVwVr3nVFZkozQfpCuCJBXo0pTtY0y9AKOgHuNh6/njnhZafqbk/xCr+uw+VjESKL+7ddq9Y3c57jGfeFSU62gMof0gFCgQG7Mi+m2SvNqYsE2iBsNilQbsOp66h93skz8mBRfiqIv/5Ptbr1u42LAnE/2tD2RsvCzK+Cu2jX7RIG2wT9hXxuqvrgbvUnTHoNlGijbGh8NmjsMcyz+UPbXruG1iWgH1URS7LFPb6hnaF04Orqw+QUhsbpv7MLJ8bDKfCuXvngoCDvfhtpD9GFCBTOQUp7nS/e+IWg1SHa+gRgatUuuBEzdRQgHb4j1ZLWyVqPk/xoDA495+PkEpOOR4wXowmXGiHLhpqdLQCiz6CYOGzDBkpUs3agVmixdmrpFMJ3eP2eHxyLRNPXotpXBSkvu3c6ETOZUlzwOKii9LMpwR0DPt+tj0tRw6hU41fh7nyY0WU7vz1tt7lsj9Wr59VNrb13ICIzD0L6Q2m+bwG7YPmXHwf0CNiBVAoO24Tb5EaavkDHcjPj0vjXS+q6nkbmkWiW/uqqhsQ7kroyY8KNtCPMD/vevtHxshsOsmwmm9FGdZLLzcsVWczWBiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWpzWnh0aUgzVTVyUGZHUi9jcTRtVVRXbFgwU0NEZWsxaEN6dVppUnE0QmJa?=
 =?utf-8?B?TXg0dUV3Tmoxb2N3NnhsZVBxRjRHZFFHUW1NTnIvOWNodHJkbklpTUQ2SHVk?=
 =?utf-8?B?d0lsa3V6eDQ0R2dMTkdzeXdEQ012KzczZ2M4UDlKQWVXYzQ5NEZBU2tUazJL?=
 =?utf-8?B?VnNzMG8xYkRtbzBOZFdaaFZ2WHdSS3h3dHM5NWpsb0hEOUtHNlJEOW5GQkNt?=
 =?utf-8?B?OUN6dlE1UHk2Rys4N0pTS0dUMURMaUR1aHhQM1Qwa1pOWkhKUUZHS1ZhNUFK?=
 =?utf-8?B?NHZKZTNhSk1aSTFxMnZKY1RJd0pHZ3B3Z3V0RVowT3JjNVZ1VXJtZm5ZbXJs?=
 =?utf-8?B?YkVsZEEwNk5Ed29Ja05MenNCL2JtQ0F4eWdCV09CcHpsbFRSR2c0WWhzR1Vx?=
 =?utf-8?B?Q1V1WUVuTnNpYS9NUVoyY0ZqemdTeTZSRkZLT3M2alBzRFJyalVVSDQ1ckJE?=
 =?utf-8?B?Z1hmQjEyY3dVQVZ4VnJVcnBtbFNDSzl3VXZWeFpXNkp6QWJHQXgwVERxSmo4?=
 =?utf-8?B?YmdwcWJBcTZMVEdDNmdPb1BiOW5xRUlPVVFhTDEranI0bnhsNU94cUxwcDV5?=
 =?utf-8?B?R2pKckpLZEpTUFhqRFFSS1hKQmdDVU51VEkxNllPa21uSjVuYzRCUmhMYlBr?=
 =?utf-8?B?aTgrZzJYelBUZ29rVnhGVFprekZWaERyNVl6SFRBM1V5UVdSSjV2SFU0OHE1?=
 =?utf-8?B?R2htaFRpaStRbm5mWldpbDEyM0U1d1JkbVp5d05RdVMvWng1MnIvc1VhNWRk?=
 =?utf-8?B?MFEzdmF0ZmpEbmZpNlNITUxvR3RUWVd6a0NOZHpwUUIvOUx0S3JRZnB2YjFz?=
 =?utf-8?B?ZHAzRVQybWF2WTkzVTFUK2VSL2V2R3kvNTBvK2dlc0dKSFRmS2JWa2g3SkpX?=
 =?utf-8?B?N3RkdHlvRGVRdjVQWEZiVE51V0luZnVabmwyUXFUUlhGZ0pocFNtWTNlZ3ZH?=
 =?utf-8?B?YXVSa29pbmJJTEhuK3Y0dGp5U0RUenQ5Z2dIaTBYVFhBdlhrL0JES1kxc1JO?=
 =?utf-8?B?RWZ4dytwcnRvQXJOQ0xzKy9MOHZoK1NEaWwvSXRNbG9hR3Z0elEvcmQrYndC?=
 =?utf-8?B?YzFWSzhHbmxHT2trR3BlRklyKzFEblkvMXloTDQ4Y28vOTBBaEd5M0hkLysv?=
 =?utf-8?B?NG9OQTYwOUgrajdRRGNKVjRKRDQzSE5hU1A1ZUNPUDBuR2M1NEp4YjNLVnVX?=
 =?utf-8?B?UGliRld2SGtxZTlObE4xWHFJbWJ2SHN6blA1UXVnWFZBbldJdXc3UDVTN01Y?=
 =?utf-8?B?UDZZOFVXNG81bGxDbkl3SWp1S3BGc3lVMU9ld2M3bnMzOFdyUGtqQ25PS21R?=
 =?utf-8?B?dHhYUHdRM1ZkbGhPTTQ1Z1NKak1lQUFibmc5bUdNUDhxQ3RsZ0NsYTVkZ1BQ?=
 =?utf-8?B?cnp3K3JJQk5uSDluMWtWNUN0eFl4THpmU3FtUjBpYmhxTDQxaWNGTjk4TDZn?=
 =?utf-8?B?aExOaGZUVnlEQkhvVGQrcmZXUU1hdUZUR1ZuQ2gramdSb3g5cURCWUd2NE0w?=
 =?utf-8?B?Q1BFekVMVGtXRXFwS0ROVVBzdWp0WmZ6NmtTVUlhTmJ3QUdzZVVuMFFEbHJE?=
 =?utf-8?B?Zk4wUVVvakxxTG90UTVIUFV6RzdOcEpaZndDMm1WeUxHd1Z1ZnEvekFjZUtq?=
 =?utf-8?B?UzFqL2ZsNndjMjFuZ2NNbXNoRmxqd0JzU1RSQWJoWjk0cEFLMmJwMjRqSnlk?=
 =?utf-8?B?Y1dPZ05Xc1pUWU5JR2pEQXBmYWdiNG5YUFVnUDdoMSt1b1hHeDk1dWN3cnpv?=
 =?utf-8?B?Q29PRGpIVjNqcENGcDZ3MWp5WEpub0JSZ25PS1h0SGoxNHIvNjk1Mk9zaEtu?=
 =?utf-8?B?R3Y5SDRjck5wRUgxM3A4L1dacm0xay94ckxINDZ6eU1iWkpUUEcyR1ZBUkhI?=
 =?utf-8?B?Ny80KzJtOWVJUWFSNzVCWWNndWZ4Nk5HWm1ab09Ec2l6bHZEdFVpLzFTSkI4?=
 =?utf-8?B?M2dLWGhwNmFFbGtNeVJxTGRTRWxsREZHSk5DOXJjblByb3VzSWgxUG5CazBK?=
 =?utf-8?B?WDhqRnNvOTZudXVnRTVyR2k5amd4aGdMVWllVG1HRVhuYUg2Y0dLcVBIZS8y?=
 =?utf-8?B?emtVemdYWlVIcmNkOWlTT2tobERmcXdLYUVUdGpiMFF5SFFVQTRnU21MUE5U?=
 =?utf-8?B?aWZuaFhDOGRXV1NxV2ZiRDJUZnlURUpkQVJNMS94L21lM3RtRU04UFRTcFpy?=
 =?utf-8?B?V2VPbzJsUVZ5NHdZWHljb0N2K0RJZE5rU1dKUVdMNkNwSEQ0dmQ1TXp2aGVB?=
 =?utf-8?B?endUbFlqM2g3YjlaU0s0MzU5aDdVc28xQWJtdFZML283Tmk2cFhHRkZqeFYy?=
 =?utf-8?B?UitTem1MWE9Hc3MzeS9NYlNLYjBkKzJ6UnlRcVdxekRVRG1mK2VsUndBeTF1?=
 =?utf-8?Q?JOzMwVh67FKkfnTY=3D?=
X-Exchange-RoutingPolicyChecked: pdnqmik2jr0EtR607PPx0HvDhUiOmZWpBgAkyU1K47iqjwcKxz2assm/y/rR/BmEEYErGPDb+TW3ws3CoP9ygtuydGNVuhbnBdohHQUVlzZ/1wb8UxsW0COn7FJ552ULkAh/oCSzuPq+IbC23HuMMb19Ym71/j5gNw8cGRDq+eGRjYvdH8LrrlWSsscBugN8NweyqvskPmc4kcGcgR17SarboKPIKpDqi6Qgg8X9O6sqKVRxz0CG9sH9ZHCEMf2pSa2KOPJt6uc27I3g358VwUtksN28v5Wl5UT4dpbYcYs5aHEwfNneJk/4CPWuLbU+Te0kc6+ZYue8GA2f5e8x3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c72f91f-7129-448d-10a4-08dea088a0a9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 16:03:00.7317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THCg156siEn4M4SxX1g3JvWv1o7angNpqe3UdsFIQrXbFJRDhDx0smEvmnvJb4QTzfzrIg6/pVH4R3LdKzFpJ4hyGP97k8AI0Q8yyewXXHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5898
X-OriginatorOrg: intel.com

Hi Yifan,

On 4/10/26 2:33 AM, Yifan Wu wrote:
> Added linked list based management for IMC counter configurations,
> allowing the system to dynamically allocate and clean up resources based on
> actual hardware capabilities.

Above provides a motivation for this work but it does not help reviewer understand
what the patch does. Could you please expand with more detail about what the patch
does and since it is incomplete, provide insight into the context of this work to
help review it? For example, above just has "Added linked list based management
for IMC counter configurations" to describe what the patch does (rest is motivation)
but the patch does not actually do this ... it just adds a new and unused data structure
with empty elements in parallel to existing data structures.

Nit: Could you please write all changelogs with an imperative tone? For example,
"Introduced" -> "Introduce" in the subject and "Added" -> "Add" above?

> 
> Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
> ---
>  tools/testing/selftests/resctrl/mba_test.c    |  1 +
>  tools/testing/selftests/resctrl/mbm_test.c    |  1 +
>  tools/testing/selftests/resctrl/resctrl.h     |  2 ++
>  tools/testing/selftests/resctrl/resctrl_val.c | 20 +++++++++++++++++++
>  4 files changed, 24 insertions(+)
> 
> diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
> index 39cee9898359..4bb1a82eb195 100644
> --- a/tools/testing/selftests/resctrl/mba_test.c
> +++ b/tools/testing/selftests/resctrl/mba_test.c
> @@ -166,6 +166,7 @@ static int check_results(void)
>  
>  static void mba_test_cleanup(void)
>  {
> +	cleanup_read_mem_bw_imc();
>  	remove(RESULT_FILE_NAME);
>  }
>  
> diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
> index 6dbbc3b76003..68c89f50a34a 100644
> --- a/tools/testing/selftests/resctrl/mbm_test.c
> +++ b/tools/testing/selftests/resctrl/mbm_test.c
> @@ -125,6 +125,7 @@ static int mbm_measure(const struct user_params *uparams,
>  
>  static void mbm_test_cleanup(void)
>  {
> +	cleanup_read_mem_bw_imc();
>  	remove(RESULT_FILE_NAME);
>  }
>  
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index 175101022bf3..a7556cdae0de 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -24,6 +24,7 @@
>  #include <linux/perf_event.h>
>  #include <linux/compiler.h>
>  #include <linux/bits.h>
> +#include <linux/list.h>
>  #include "kselftest.h"
>  
>  #define MB			(1024 * 1024)
> @@ -183,6 +184,7 @@ void mem_flush(unsigned char *buf, size_t buf_size);
>  void fill_cache_read(unsigned char *buf, size_t buf_size, bool once);
>  ssize_t get_fill_buf_size(int cpu_no, const char *cache_type);
>  int initialize_read_mem_bw_imc(void);
> +void cleanup_read_mem_bw_imc(void);
>  int measure_read_mem_bw(const struct user_params *uparams,
>  			struct resctrl_val_param *param, pid_t bm_pid);
>  void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
> index f20d2194c35f..d9ae24e9d971 100644
> --- a/tools/testing/selftests/resctrl/resctrl_val.c
> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
> @@ -28,6 +28,7 @@ struct membw_read_format {
>  };
>  
>  struct imc_counter_config {
> +	struct list_head entry;
>  	__u32 type;
>  	__u64 event;
>  	__u64 umask;
> @@ -38,6 +39,7 @@ struct imc_counter_config {
>  static char mbm_total_path[1024];
>  static int imcs;
>  static struct imc_counter_config imc_counters_config[MAX_IMCS];
> +LIST_HEAD(imc_counters_list);
>  static const struct resctrl_test *current_test;
>  
>  static void read_mem_bw_initialize_perf_event_attr(int i)
> @@ -113,6 +115,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>  				    unsigned int *count)
>  {
>  	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
> +	struct imc_counter_config *imc_counter;
>  	unsigned int orig_count = *count;
>  	char cas_count_cfg[1024];
>  	struct dirent *ep;
> @@ -167,11 +170,17 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>  			ksft_print_msg("Maximum iMC count exceeded\n");
>  			goto out_close;
>  		}
> +		imc_counter = calloc(1, sizeof(*imc_counter));
> +		if (!imc_counter) {
> +			ksft_perror("Unable to allocate memory for iMC counters\n");
> +			goto out_close;
> +		}
>  
>  		imc_counters_config[*count].type = type;
>  		get_read_event_and_umask(cas_count_cfg, *count);
>  		/* Do not fail after incrementing *count. */
>  		*count += 1;
> +		list_add(&imc_counter->entry, &imc_counters_list);
>  	}
>  	if (*count == orig_count) {
>  		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);

Should cleanup_read_mem_bw_imc() be called on error exit path?

> @@ -303,6 +312,17 @@ int initialize_read_mem_bw_imc(void)
>  	return 0;
>  }
>  
> +void cleanup_read_mem_bw_imc(void)
> +{
> +	struct imc_counter_config *imc_counter, *tmp;
> +
> +	list_for_each_entry_safe(imc_counter, tmp,
> +				 &imc_counters_list, entry) {

Looks like above can fit on one line.

> +		list_del(&imc_counter->entry);
> +		free(imc_counter);
> +	}
> +}
> +
>  static void perf_close_imc_read_mem_bw(void)
>  {
>  	int mc;

Reinette

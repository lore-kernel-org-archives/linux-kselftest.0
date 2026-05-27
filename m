Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7348534F25C;
	Wed, 27 May 2026 02:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779848708; cv=fail; b=DOqJ4zxYDd8u7iczvgVHLpStmJW+ROmQLndoKLS7bspRHuNIGjf5Oceg2PNOt9VMln15UwnmnchPIUP+j5iiqItZ+r983GtcWpRHETz58k9i6YsY0qgd7oONSkcl0+bOuyWflU2oIimwotdMFdIBf7f1Gf2ihjgMbJ3dV72pdzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779848708; c=relaxed/simple;
	bh=/TM4VCulernnor+n11WGveuKL0cgmikLT7wyk7Y3B3g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HiIFizayetJmP2Pxrhbh3/0KNB0ieq2EGTZvTiaruHJ5D+DPZTWV3Lw757cnUiU1zbNwxRt8No+LXh+MoMJ1O55nQOJBGClOwTurKe6Q9qyjpqvvAcQzGjLGg1iB7AoNC7hbnjJfs2OPhpNfUhDmgRgsry/mS7BJ+YlG0VFOe+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+wG7iSI; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+wG7iSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779848706; x=1811384706;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/TM4VCulernnor+n11WGveuKL0cgmikLT7wyk7Y3B3g=;
  b=T+wG7iSIsr0dzTYPpQqG/dc0xY9NTwaC0ZKLXBpnV6gVAURR8B0KMaY2
   Bm0r9l5d/N7tk4JqxVanYEsSFer9VzNYaxtt9PZ4GjT1Q5jePbzQBK2Jg
   eVNydO8qLVq0sU8hXfSbpOKbfhWJdky4OhNivWm94ORp3RQF17voWWbEd
   LPSHk4ip1olmGuhuiMqabjPkNeuP6mu9gsjkOF8Lue31zRMc2VXLc2HSP
   z/x13/sXE3bBITaDk5xH8Rw4pjRbcJ//0kgeYdA081TLeq3ukWP6YLSjm
   FrrtNCdn3raEfQPqmidw4h3eDUV5a6/aA4gkgW1+WSNI+XWdx2LYYKRhf
   Q==;
X-CSE-ConnectionGUID: NsxisiVnRymSrCFI2YY0Fg==
X-CSE-MsgGUID: g+IE2K2KR9CbxYhZRYFHGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80522142"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80522142"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 19:25:05 -0700
X-CSE-ConnectionGUID: DxJMdq/FR3WRRV3eMFvj6w==
X-CSE-MsgGUID: FIgEGsX0TNS0/wpT63XKOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="246358152"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 19:25:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 19:25:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 19:25:05 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 19:25:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZ3NVcCnIh2IG3uGtY8EWt9GvdG2vV07HM6McFfRXGWW1mkPJCNAYlRf5/GIDwHqpEJLnq4W9aIgPbxfCfLN3UeZD/Dwv/j9i+yl2SM+Sn8UzCGXdGy4uh30+RWx8fbGwZ9Lj2PfsMVirFBBLhX/mDwljCpPwSPo5YVu3qjeD8zqorUXbfmgwLCRdwuaERMjfF/HLY3i/O8V5M7TyU7J0hXI1HSFtFN7Kjh8OgpS7DnaZ5XLQZDkzwJ7L2raroAPbeyuhx4uEHUNdifb12bI+3pN6uC6qi3VtNzOyP8G3YnGs4FYAGNmcf1MwkA9Y7wP24Tciu6CJhOac7QT+wAbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+tYP4zcnvPQwVjblJPqju5ER+SVhBGliOiruE8BH98=;
 b=SCLB/h3GLSCyZdirOQiG3k4Ci6ZRXsxPbuPUcAVqjyFalDcsd+bQqZ1VW5yi6dOm3yQS7QhbQaOPOTcaaqUE6Fhz1i/y1NkoDsLHhPA7M3cvnu6BjI53/e4ralU1urNDpNJFpFt85gTjY32x305dSK3tb6cLrg91qkyfwvUtMH3/rqV9fq94dztaG/g1eik0/ksQ0I2q6N49Ah+vnF7kBo+qSqauWlI0Mu+75SYI5IAyyjKK8/TLrth4jVMkBJzVXVeLby/yH/iwR3M1INaZ78EkZj6FMSQ1pRzW95dR4vTzyodfKw5D5qWT58bOKTbkYix/xK94bfORWXvWhyUWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 02:24:57 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0048.019; Wed, 27 May 2026
 02:24:57 +0000
Message-ID: <c1c9c019-81b2-4d6f-a2b6-30e63c99efb1@intel.com>
Date: Tue, 26 May 2026 19:24:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/resctrl: Allow CAT testing when no exclusive
 cache exists
To: "Chen, Yu C" <yu.c.chen@intel.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: Tony Luck <tony.luck@intel.com>, <x86@kernel.org>, Dave Martin
	<Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu Moger
	<babu.moger@amd.com>, LKML <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, Hongyu Ning <hongyu.ning@linux.intel.com>
References: <20260523101715.3964456-1-yu.c.chen@intel.com>
 <db89b830-997f-8f74-012c-9aece7fa5c34@linux.intel.com>
 <09c77f99-0c8f-44c3-8971-aaec094053ca@intel.com>
 <3fbb001e-bc78-45d6-92fc-4a8dcf708c58@intel.com>
 <a5473762-fbd8-4aa9-85ae-8bc8108e1d3c@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <a5473762-fbd8-4aa9-85ae-8bc8108e1d3c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0208.namprd04.prod.outlook.com
 (2603:10b6:303:86::33) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS0PR11MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f2be46-dd34-40e7-eca7-08debb97253e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: f5EKOVPSUQntgOv4rZsbCLRyoubLE5ibazLHtLMboRXfHZRjmcS/pn6mPLXBXD6x3RRB+E5bSDGb8/BaSlJnUzpPVuAeGTdox70uqFS/P8YMmx9o6rF+9L8fP1CkkucCl5XXo0SxX0lLtjQZp4Eawwd9Md+OWdkijIbc1wTIh4bLs9Mu0DFfsf97qrORjiJA7jXkZsVBPLM+sa+h5uVDa5EqoFeu+b96XrHTr5ZqJnXaoV097/hzamQhXK5E7VNnZXsc2Eqxb0v58/+ryxnxgGhZic2yGY9LM3PVgc9UwydfCCD/nqFtXL2O6234d7FvUeu4gbJqo6b3l8LkCndUaUS/3e0f9CJSWaMXpRlHaSUYUgc0srnWyw/I2GrDsvXEKZSIBkWmkSkd63RSLXmzws68QOPSM2LgF3p6KqgQCa1VyW+KVmVLM8lqT4ijLafQSFpqMTClHdk14xzgOi9xHzWqVJ031W9NuoFjtXi1+KN1lZKO1MjbAEiFlUHuNuj/DE3tuKe4mN+cDPnfNj3IUVTgFDCxuTFBGpdrN2JoLxw6FSfLGF8fZiokCh4jji3ykTm3CoF8bUjc3yLxXFzd83JVWJRf1noAjiKnLwcskfmt4OMQOfPR+aoeomrET1bqxK38wrVttyjCoa6MsvIfkP526kokFlgHToS9/rLTQ4I64Vf/aH+JFbcACYXxn6yDfqNFQb+HlUl55gHAc+n2ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFJTVy9sRXV1cFhzK1RmaHdoaU5ld0Nodm52YkRqUkdhUW1hM1pXejREaUt6?=
 =?utf-8?B?WDkwK3J6ZWJQbGdoQkRCeTVCMlRDUXZmd0NHMDZVYUVFWTJSMUllNWpLK3Rw?=
 =?utf-8?B?Rkl4NWVwSXM4b2lETUR2WnByRnNaWEJCRHBCMjdZOXhVR3l3Z25NV1I2a3Zu?=
 =?utf-8?B?ck9NZHJsay9zWDhBcE56cGpWcXNBZWF5OW9ySkswQ3lUQjd6TG10MEo3L3dD?=
 =?utf-8?B?UGJnUDRlZG5KTlYvQmtxRGpnWDlmY3VyVEFVUDVOdm0zUnpCcDg5aHg5K05V?=
 =?utf-8?B?WFFnc0JVUEFtVFNMRmV0ZGJvdUlua1J3N2ovdGN3NmQwS1FFNStnZ21NVUJ3?=
 =?utf-8?B?WHZyOVd2MGlKdEQ5WWt1MzYyYVBSaGpuSkptNUNWVTVOb2oxalRET1QvVlBn?=
 =?utf-8?B?eGNhOVVpeWtlTEtwQ29FZUhCWUkwNEpaeWJoZSs3Smd3a1dXOG1sL2NtNC9O?=
 =?utf-8?B?TkxhempVOExKaXlnTzFQNDd0VmZkNklML2FrUGlTYUpoczFhaTZuYTNMU2Z1?=
 =?utf-8?B?d3VIQWRhRTNtSUwwN3M1SCtXa1l5Z3hGR2d5QmhNdFJUWnd3Y0syd2FodWJR?=
 =?utf-8?B?dm5zcTZVVkUxdSt1UURxVllXSFBUNjhKY0gzK1ovOExqRnFua24vR3E5c3Ba?=
 =?utf-8?B?WUdjQnpEVkhCYmE1Q1lxaWE0U05xMVNmV3hKRnlGbkgzTVhrUWNMSXlFd3Nw?=
 =?utf-8?B?LzNkWW1zdVJZSFFpRktVaHNKUTl2Z25idm5EYU1ZRWs1SEpkOHppUHo1cGE3?=
 =?utf-8?B?cWRoVnNCTnpjNHZMajlCN2JBRFpqSDZUYWlINmdHRTBVVkxxeEI1d0lNSUwz?=
 =?utf-8?B?dHM0LzlHQzdKbExLUHB4Z0VqTVY5U0RSYldvQWVVN1VnUysycHFvT0dYWTZJ?=
 =?utf-8?B?ZCtWTTlTSHMrL08rMjFsRVpaZ2V5Wi8zNzlLU1M4VnRaTnVkTEROdDNFaUhH?=
 =?utf-8?B?OFF5enlYeStRN3pNZ2lzMU80UXVyN294c3pSZHJpQ21YRzNkTHE3cml2Zy9w?=
 =?utf-8?B?TGRWcXA2ZGZrU1BhOFJZU0FCZWdNVmRHRTdqcHFUVlEwbzhHWHNISlJwNXpi?=
 =?utf-8?B?dGpoamo2cWFKTWtZNHhVeXBXTUdQMGl3am9lekFjMGUwRW5yaFlQWHYyaHNv?=
 =?utf-8?B?SFA2Rmd3My9sZWtRdlROZFp3Wk56UEQza0xTQTI5TjlxWHBFTVYrTVoyQ2VK?=
 =?utf-8?B?ckhpVGE5LzhrR1pteVRNa0dqZFpVVGU4MGc3TDlla3RYcWNjYnZxNUQwTUtL?=
 =?utf-8?B?c0kwSURtSTRTQlI2RFdJeXFub3hSMjJXWlI4bm1tZFQ3MnZwUFk2Zk5VT1d4?=
 =?utf-8?B?cTA3VmllcnhQeGx2Qk02Ky9iTGsyRTE1cGY5bXJXM2haK1NHSEtPQm1EaFl1?=
 =?utf-8?B?bXZ6c3NTS2VmN2s2OThSazJOWFJMOVRIVUIwUTgrancyeGV2U2xnTytZYTU4?=
 =?utf-8?B?Lzg0Ui96VENzRjVNd21vRWF0cy9DZnQxelNjVzlWQUIyYWlvWGZoQnIyUkNx?=
 =?utf-8?B?QjJkQUY0U01RUGVIRVR5NTcyNWVOZ21oLzd6ODdNT1RkTHBvWitsM3kyYzlQ?=
 =?utf-8?B?L0s2Y2ZZaVl2M1VOZ0w5SkZ1QjdCcGdKVmh6QjB1bHk3YzM1ZjlUcGFKZUd1?=
 =?utf-8?B?WEwreUhYOTljOEgvQjJkYVdXNTlYWWhxV3o4N3dxdkZ3UXhidStZZDBsZHNH?=
 =?utf-8?B?bTR0NXc2WlFYTzEwSDZScmNwWk9vN25XV1N6S2JtTVhJUGoraWZBdWtZWVZS?=
 =?utf-8?B?T1YrK25DZXJQclF3V2FOK3R3NlU1OGJOa0QzYndyQmxxKzZxeDZKRzJISlNB?=
 =?utf-8?B?Q0Z3b0cvYStQZFRCc3FmNGwyM3B4NHBiaFNBcmVTL0tzdThMaSswQ1hoZm1M?=
 =?utf-8?B?N3RTUkRKdnc3Rkl6My9yOUM4V1ZBbVZ0WlE3M1RWOGo3UEhYNVBHS1dLb1lV?=
 =?utf-8?B?cC94WHg1MlRSZFJmYjd0OTJXcEV4MTBreUhBV0g0WmNNaDdTUmtFRWpDM1Rh?=
 =?utf-8?B?cmUvWkIxQWJmN2YxNVl6b3dUM2ErRERacDZJYlVzdWJERVd0S2cxNll5NVN2?=
 =?utf-8?B?ZHV1Y2lDSjdaeUhhckdxT2IxSk9WOG9kK3VjNFVUdlhXUWtzUTdIM2xsUjZH?=
 =?utf-8?B?aFdsTzdRbUZMWnVXRTQ1VDI0Undib1ZuRjRCazVQd25yT3RzRHJrYlVWVzhw?=
 =?utf-8?B?Mm1uUjVKMXBzdmdDNkFkZnU5SHZNNUtWZElSMnlqbmdYSS96dVhheUJ1QmNX?=
 =?utf-8?B?Y3pFaUdDRW5XYVh0Z0h1QlJLSmVZNTNmMFFUcWlmRDNubG0xODJ5bVZkbnNT?=
 =?utf-8?B?eVlZYXhwSStQRzNxSUZ3V1NjcGI1eTJBSmhiVVZyMUlRY096UzFwRUVzbDdr?=
 =?utf-8?Q?LhgzXEtT+7Gr5n7Y=3D?=
X-Exchange-RoutingPolicyChecked: hi7tgBCNw71k+b5xAnoCW327mpdhwRv/hS30XdoHC27pSU6tFuBT0/mGRrcR3v20oGxqiWxl0FsieAgXJNQSexVcdssirYWnNmNzLWBrO2ehPDd5f6rboNaqc7coRw4yGIDwxzCOvqh7HbybqamLTqrkMUngBfGrC4hbbaAFfCyJmjClUSMpRv74/6FyaWVyHqfeeSRYnHKXg++H/T3W5YPDcQ3EogtHhebw/vTlBxNKQAvyKJESeXhdMcF8wN/KCXHp8rpZqLYWu0nyFr3ySNjAYZplBHFLF4Nt9NiFGSPVjWo2yFicsp+gJ4sQRvwev65Fls+yee4eNtwMCfN06Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f2be46-dd34-40e7-eca7-08debb97253e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 02:24:57.4392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfzgcIb1937213wtWhyKaYwYSbg8XOzeMwDAtN+NbTBL0ZyfHsse40vsA4Licev+zlgC7MXSQalJGHywBbLPYxaARf2cVbqyI2dEVCvcdZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
X-OriginatorOrg: intel.com

Hi Chenyu,

On 5/26/26 6:57 PM, Chen, Yu C wrote:
> My thinking was that shareable_bits only describes portions that may
> be shared with non-CPU agents, and on an otherwise idle test system
> the CAT miss-rate trend can still be observed even if all ways are
> marked shareable. But I agree that this is not a good assumption for
> kselftest pass/fail.
> 
> So I agree that falling back to the full CBM is not the right fix for
> this test. I will change the patch to skip L3_CAT when no exclusive
> cache portion is available, with a message explaining that the performance
> test cannot run reliably because all cache portions are shareable.

Sounds like https://lore.kernel.org/lkml/20260526024251.7895-1-icheng@nvidia.com/
does what you need.

> 
> For platforms where all cache ways are marked shareable, do you think
> providing a extra parameter to ask cat_test to "ignore" the share
> restriction is acceptable?

While resctrl tests support command line arguments I do not know if they
are actually being used. During a previous rework we found that they were
not behaving as intended and we did not receive any complaints. Even if
somebody uses the hypothetical "ignore" parameter I do not see how the test
result can be trusted unless this is done as part of some hardware validation
that resctrl selftests do not aim to support. resctrl selftests are intended to
test the resctrl kernel subsystem.

I think effort is better spent on creating an actual CAT functional test.
For reference: https://lore.kernel.org/lkml/20250616082453.3725-1-ilpo.jarvinen@linux.intel.com/

Reinette

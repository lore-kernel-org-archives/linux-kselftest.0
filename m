Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A10F362139;
	Wed, 22 Apr 2026 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776878675; cv=fail; b=Hz1r2Jn4E7MNat6aAVzigJjy9jWi2u4EGF9mZ8WZEvro+unIUmTXf2EwUUyyNTN+Xi5cvnpdiej5lRq/lINafeeU9fVqX7GLl8epN3WbCgmL5zWRqecLIbsLJrv2N/X4Dq8KjcuSa7dz7BhVVe0a4rq635vTghBiXkofEsFDwAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776878675; c=relaxed/simple;
	bh=SbqcpHC/x9pRrzFSt+hP7gAkpAwzYMtYw3jt0BntnJA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RGF8tDIKBGrPToTsCyr/J6Bdcn8PH8xARGdx3b9k8D9uVIVkIgFoIrUaWR9o6aEXywuNn1q81I6VD/UW7kWclRkDw460qZL29FllZLEVloKkeURFB1/rhNUWwcof/yJHEZxAc4Mb8sVmIw6HTgxYmAE+6eQ71jzKkxSLa9HPJec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvHwKbQL; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvHwKbQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776878673; x=1808414673;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SbqcpHC/x9pRrzFSt+hP7gAkpAwzYMtYw3jt0BntnJA=;
  b=GvHwKbQLwyoJ8T5X7unF0Z1EzW/QdusNxv8rNrf3FA3qi2/ZVFyylkNy
   4Fzo5vKpHUqfygXvGUe1pXoz6R/xBfNHqksS8oXW6X53O4GHFse1IVR0U
   Y1KJZEiJTtbn2tu5pVy1MiC3WvZmbVUAXHKjKVdhz89bS0K2dY6MuAFMm
   yvdEbBcWF5yA0VCgHgLbdjdGr6LV6Ub2QxaI1UC/Z4afpXo7DCbXQpnhZ
   wVHucFRasLK40D2dfp4qSvbnIojkFMHPVrLBG29j9hgmAPQJXjlrb/rsX
   dqUkRQVaFGC2iYQPj+0e89qRfE2ff2QV/Gf/ohvsJlc9qHVSs3wO6eBO6
   Q==;
X-CSE-ConnectionGUID: AgRotw0ySqObaY+Uwb/oTA==
X-CSE-MsgGUID: gzF7O0FSQfuSl8wZtiWudw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81702446"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="81702446"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 10:24:32 -0700
X-CSE-ConnectionGUID: LQcO8TygTZi82XUcxPVnZg==
X-CSE-MsgGUID: SiSwippTR8ivvrKSGzcFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="231522478"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 10:24:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 10:24:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 10:24:30 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 10:24:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KagxXdP2Mt3HPYUcjd3ghMUZR4XN9ZFio6ykh6luHb4XdMJJLXdzPFMo8aTWNoXL5Airprs2aoJX9Hiya+aJy4Ntw+aPQ+or3aDyp5TgSaUA2iAJvPjgYRHcpLdBPiht/sx68XdpPLBnh7HMzoUhYHEZg4mAP3RFQtW2PAHDSzXOJSpBYXlcLfv/JHESYbVgLIpIfExizRV3A8amnG11fBoGUaYycCJMAiy11UULBGqAmVYcsbQA2jtRnv4r98Yx9blvvs+Y8wuWEniA9VQ/5L2/kGJH8Hp3QiaDTaPHZFoNxhO6XVG//L5h0WUBDlOS+9Fzqb8BrBrQF966NkmwzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUHQAvB7H9eSY+NdKvZUrtO1HazuZ5xo0Sv+tbjSYQ8=;
 b=R8mYo7C90fa2K26+Qqzhjm1uTl5zEpkBarGVtfnGeouR5CzRZ0NkN2itVl6mnfskljr1fZ3YaqRlgWJLlAkCAELpGpiK3IVN+wt+hgmsURFsy+C/qZgtmoho61C9mAsBdRMIwa3zrQd76ppKA9YDgOYsZY1zBo8Oc3kKhNbk8jZXTtg0yVPmj4dMk8o0FeBuXalnwNKCOhvhijd2vIahQw1+AjrLvO5erBaV8O/Wpv9wtaSqqz/GeJK+sRwfLwqzrYmpCuyubsJL82gudRcb0sGl3FCPAb4LJ0XgabbpJVXEnhUUBlKVXRRSogknR7FYOeXekcsoGoUU5es2x0ME7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by IA1PR11MB7941.namprd11.prod.outlook.com (2603:10b6:208:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 17:24:23 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 17:24:23 +0000
Message-ID: <e12c21c4-8de5-476d-b1ab-8bee4c1aedb5@intel.com>
Date: Wed, 22 Apr 2026 10:24:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] x86/process: Shorten the LAM tag width
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, <peterz@infradead.org>,
	<ryan.roberts@arm.com>, <ilpo.jarvinen@linux.intel.com>,
	<maciej.wieczor-retman@intel.com>, <jgross@suse.com>, <morbo@google.com>,
	<mingo@redhat.com>, <ljs@kernel.org>, <nathan@kernel.org>,
	<shuah@kernel.org>, <akpm@linux-foundation.org>, <james.morse@arm.com>,
	<oleg@redhat.com>, <houwenlong.hwl@antgroup.com>, <xin@zytor.com>,
	<justinstitt@google.com>, <seanjc@google.com>, <hpa@zytor.com>,
	<perry.yuan@amd.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tglx@kernel.org>, <nick.desaulniers+lkml@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<llvm@lists.linux.dev>, <x86@kernel.org>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
 <79720f2640839b15f22e3618136b084cb376456b.1775813245.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <79720f2640839b15f22e3618136b084cb376456b.1775813245.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|IA1PR11MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f8c178-33e3-4f23-efff-08dea093fe99
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: +TEWXBzZ766LMTxqIc0RVUrtgCfAsegUByOXTRRj1Per56QHFiqK6TTfIcii5gfsww3ddPZ2UMdu7D8JytiP/W10ex8JxciuyH3xxqX1djd0CPy0i645gWTGeTSeYaQguALz5kF3TxYgRvIxCxppUkD2lqPrA6IkfoVQilEgXEa2+ty1tH9QdzbK0dIB6/XiTPTwcZHBhBHXWsRlUpaiEhW4xruq1qU8C5wA0b18i8hsg6i69zThrgGHlnGEtCMx39XJS9cUsqRpwomM+u6e4enhqg9gW399Wq+kAOEYd5JYEvyAdu+6mfz3LBRaeS7DhHBOaX0yBliWYO9w+6EWpIz7E7YkTCJbIkxZImVnYBQp1TIxZmHslGJ/WXciGr4Lpi04Mgf8Ryx6PGE82tYtwsd7UvERqRSDbqrR9C0StgME/aR2XBZdUxqV1AlmHloyupPhi3QR4BMYlNaJj3/YDPNXaJIp6asvRLx81n1wNvyyi35+L411KbjmQxn9XtpNXy1Ix+2XVfCM6YioCsNPW8Cb9CqvQWkvvz7pPSQzHK3+UtNYGIq0kwyXcY9j3Y+NU8fGJHNrOPKSjK1XfoZlEsY/vwy6KF8pSBEijEvmjqoPn4GF8Q+Zueygx299MwCO9Ih2wk7LUoiInguWvPYMofKzK56wm5t8o+Aac3iu9fH/7XZx+rhMo9Ar5dYT6BCCEFC6bpnBZ1RXAb6SVQvZe9HxUDQAsifXMeuDfe7APwBKBpcGjtYsE+wgbV/Wn8lcftaj8CJOYdYoCFH1dAyB/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1JQdUZwQzhVZUlyalZodmNkSlBRL3pFVjZ3dzgzKzlQTk5tVkk0UlJjck9G?=
 =?utf-8?B?Y0REcGVQaDFqdTBwSXBPQ29Tbzdaa2djUkVuU05FS3k2U1cwS3ZkODl0aGMv?=
 =?utf-8?B?bVRSQU14aTkwaW9MbC92VFRiLys3THNZUzJ2NFIvQm9mWkM3dU04VTNTRysy?=
 =?utf-8?B?S3V5NHZrNVJXaVpsc1hadTQzZXlucXhpTCtMSXF1NkxWMXczL3dJLzBlcEo1?=
 =?utf-8?B?U1d0RlBNOUpaNE9VcDdERkwyZ0ZTMDlFbzhCTVVKMGUzVEthWmEyUk50YWY3?=
 =?utf-8?B?Y1VYUlhQRjJza3lwZlJNOW5IVG1WRm1vR2VkUit6WnFRTThQdVBianZTQjA5?=
 =?utf-8?B?Ni9GSGFDeHNmdlB1MGdka3lzQTVjQnRJM0FnZmUwTXhxN2ZXU3c3WVJJbnVE?=
 =?utf-8?B?QVY0R0E1OHVCajNKd2RPd0VoNXlIcm9hMFJmUXpFT05Famllc3R4cFQrZElr?=
 =?utf-8?B?SUxhNnI1NVp3aVVPMk0wNHpVVGdXMVdCM2lKTmFCemJtRnVxTVcrbXhhMG9l?=
 =?utf-8?B?cHlBQ0JhUjJMajRTdTZzQWZEYnkzUTJPcVVvcUNXbW9jemhiZldIMXhMWjRM?=
 =?utf-8?B?NnJKYklTZXRCeEJiRE9EdDNpMHNtWmRsUmtVcUVTVmZteWRpK2lxWHJvVmFk?=
 =?utf-8?B?cnF0a3JjRHRVRE8vZ3ZhTXFwNjNhY2FCYXJoQlhiVU9yNkVIZEk0eUZzYWFh?=
 =?utf-8?B?ZDVHTHhabHNmbHF2UXYvYVZnUGF1TUVSVG8reUFNdUJqSnEyYzJwL2NwWlhY?=
 =?utf-8?B?bkxNQnNnMS9wRlBsS1FEZVF0OS9Cc1NuVlltMHlVam5GVlV3SExXZmhvRFFW?=
 =?utf-8?B?TGN2ZDFaWTBYMkVEZnQ4RlNveXJydk01SnJiUTN4NXlwRHJXSUhoMVUzMzJj?=
 =?utf-8?B?ZkVXUXNQVGttQUZTa1hXdlFaczVXaWZqeUE1cjRjR2ZCR2VxZ1FBQmFPYjk3?=
 =?utf-8?B?TE9zWkVFRjFqMCtmZlRCSXRHU2V0RGRhWWhBNWk1QzJ2bnppRkV1azR4QVJp?=
 =?utf-8?B?UTJVSjBSY3BvV0VYWlZPblIrWCtaeFB5ZkxORTJIbHN3REorR1VwWG9MRmR6?=
 =?utf-8?B?SThIc0RYS0p1dTlZemhOZ1p6NmQzaHlmUDFVay9aQmFEZGYvMDVpSVh4UThE?=
 =?utf-8?B?dklKYVlBbll6cDZmRFRsdkZRc1hXTmFSWkNDbTlWZkd0UHZKR09SaGJCMU5n?=
 =?utf-8?B?aEhkK0tsVzc3NkdxTUVnWHA1aW5lT0NyajFCQTlxNTBJczFhTjFESGJtWm5T?=
 =?utf-8?B?ZitIYjdjTnRpU1BJNXpDc2ttUzlZT3BwZ2pCQ1FCWDA3UWpWeE5OYUtXaHl6?=
 =?utf-8?B?VjFhNm85eXFlMy9mV1IvVFhKZFIvYzBYWmFsenJQUnNPcmtIM0g2NVQ5Q3cv?=
 =?utf-8?B?aWRocEloZFJxc1JOMTBjYVNzbHE3Q2lKcFZCTm8yN1RqNDRReHQ4ZjRWNWhj?=
 =?utf-8?B?SHZ3UWNwWXJLMW9pUkJ6V0YrMFlJY0pyTVFHckFWQ3RzRkREZE9McmdaV1JO?=
 =?utf-8?B?UGNBOC9GNXVRMWFjTktwRTBWSTlUYTdmY21mYmRwbnFnT3J0N3lIdkdjYTZQ?=
 =?utf-8?B?OWZjTEU4M3loVWo1akptYlZGa1pkdXN2S29STHFRSzZxRkpZeHZIV1hSUTR1?=
 =?utf-8?B?K0V3Q3VkRFA2emw4bGVjcnlIMkVha1JGOTNVTmcyTmNnWmFoVWhpVEprV251?=
 =?utf-8?B?eFlzdjdwS3AxZnFBbWNwb2E3ZnFwVG5BZzNjeW42ZzZEZGlOK2lzUkhNa05K?=
 =?utf-8?B?Y3VvZW1odUFtQTI2Z3BLTGM5NGhSM2JHeW1Gb1VZWXU4S0g3cENmMTl2L2pR?=
 =?utf-8?B?dGJpdm5rMGFOc0sxUGtBeDhQYnRhMnc3eGRHbHdBcmg3N0o2Q0xheWFIL1Az?=
 =?utf-8?B?V25meUJwVUd4ekZPSHhrR1dsMlgzNzFRTFFVZVFPRFRDaUZ3NEdhdEFTTEJ0?=
 =?utf-8?B?VzZramF3dktqSHhtTEpBOXFYUVRicmwvNEVTZzUxY3RTUkMreHRZWjRyb3lR?=
 =?utf-8?B?bGVJSXFrNlVvcmhqS1NkVDd4U2JVRllBRzM2MUNrWjJaS2dEUjk1Z2VaUk9Y?=
 =?utf-8?B?QXhIc29qWUdlWk5RbDRvZ0tYNWNOYjBRdUxkRUVxaWRmLzI5TUxPZjlLekFv?=
 =?utf-8?B?U3p4Y3dHWTNUa3YwNXJqb21GSDMxOGVQZzUzcVhsdS9Db0cyNFBXOVRHSFYz?=
 =?utf-8?B?aGsyVXlFT3BTWlpuMFJ5amJCR3drZ1FJNStBVFR3dmIvZ0lzVmxNSGo2UWFa?=
 =?utf-8?B?UlRQb1NhUXkybzBRQ0tEOTQrWXlEd0h0QTRrUVd6Ylh4L014V2pnUExGeWpU?=
 =?utf-8?B?N3JxajlWanNTWHIyUHpkS1JUK3pJRXdiUjNIN09pc2hGamw5OFpUZz09?=
X-Exchange-RoutingPolicyChecked: wGIamd2S1rU4b0oux4qk4ELB7fvLqqCMhSsMl28XdPHN8YJN+ENIHNyNk7MU5RxIqMswRWS4UmwDrjos2SCto0V2l+4SSHcvRc3OVTH/QCi69Yw3axuGEcMWAow6ZWhoP/UDp06QCjFhYeSycvlDL72axHH13GT2SyaYzDXEKTgPK4zRnJR4Hp4Evjk1MvwdcQVU8+N39VaUzZkzPYCKi4d71Lnsuk3dwSnGIw5AYyyYGfei0LIAJqbKUCgxNWe0/Yrxqo5VEWDN+RoS1yAZoTX8ZuOq5LhNwkRPim6/FRHnSEWGa4YZAVVufcYRjAwD5nxPK9ARBDZrQwZTKgQASw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f8c178-33e3-4f23-efff-08dea093fe99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 17:24:22.6894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75cCu+7iJcyyMdlJYfm6wOhpdgZD8eI6ButUSmWKo/XKnHkMQiUObijEFSvnG/0P9RXDeVjfhlGLLXZKs9soUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7941
X-OriginatorOrg: intel.com

On 4/10/2026 2:55 AM, Maciej Wieczor-Retman wrote:
> diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
> index 08e72f429870..d6f8e71156cd 100644
> --- a/arch/x86/kernel/process_64.c
> +++ b/arch/x86/kernel/process_64.c
> @@ -797,7 +797,10 @@ static long prctl_map_vdso(const struct vdso_image *image, unsigned long addr)
>  
>  #ifdef CONFIG_ADDRESS_MASKING
>  
> -#define LAM_U57_BITS 6
> +#define LAM_TAG_BITS	4

This makes sense as the tag width would be fixed at 4.

> +#define LAM_LS_BIT	57
> +#define LAM_MS_BIT	(LAM_LS_BIT + LAM_TAG_BITS - 1) /* 60 */
> +#define LAM_UNTAG_MASK	~GENMASK(LAM_MS_BIT, LAM_LS_BIT)
>  

This seems overkill. What we essentially need is 4 bits starting from
bit 57. GENMASK is the right macro for that, but it doesn't need these
extra argument macros and tail comments.

I think using direct numbers with a simple comment on top would be
better. How about something like?

/* Must use the 4 lower bits from the LAM_U57 tag bits 62:57 */
#define LAM_UNTAG_MASK	~GENMASK(60, 57)

You can probably add some explanation in the commit log about why only
the lower bits can be used.

>  static void enable_lam_func(void *__mm)
>  {
> @@ -814,7 +817,7 @@ static void enable_lam_func(void *__mm)
>  static void mm_enable_lam(struct mm_struct *mm)
>  {
>  	mm->context.lam_cr3_mask = X86_CR3_LAM_U57;
> -	mm->context.untag_mask =  ~GENMASK(62, 57);
> +	mm->context.untag_mask = LAM_UNTAG_MASK;
>  


Other than that,

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

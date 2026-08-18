Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5449F23D7DC;
	Tue, 18 Aug 2026 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070660; cv=fail; b=P5F8TTVNfAak/ylVXK6LORaj3mzEwCw7lfkS6ev2/C20WpiwZCfAqccyASX8lkeZd+twt7No+08GY5kG1e/5Guc1g6wgU2GhhzA4qhYdTIXXCwryO8uiqJT5gfifTpxQuyutO9eciv13PQVRGJbSEMF/BuK+MNsxcCMlnDQREJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070660; c=relaxed/simple;
	bh=GQlkAotrDGyhkONcyyWlHRHHFCuBOd7hOwP+wLkgqdw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LOzDRzBpv+BQel6AMGnO+/3t9bQEvoYN6GoIyskCun3z26k04O4QUIXgRifGvyRGTtw2ha26sTfv1l0/khA8+BO3vtVKo1WWxGLW1jHcxCCMXN4TGdNbHYah8E8w1WDZhVwqYH19OtCnlnMnp7EXJhcP47aD+fcVRt5C8u6qTs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7evmkpc; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7evmkpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787070658; x=1818606658;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GQlkAotrDGyhkONcyyWlHRHHFCuBOd7hOwP+wLkgqdw=;
  b=C7evmkpcsrou1qASNBsxjoSNJchNpiXIMdYQY6/yTg2n34kerwbXwsSX
   BpJ6gJKjoiZ+f1zeq90G7jOvlDA1BA8Rf6NbZRmGIfph4MhKCr09SV5JT
   AbluZYVcrAnvsxDJvqt6KqB/3OZO0Qgmf5ITeiPpW7kraSrrNWxZa/u+s
   97gQ9hnTbTnT1O0K4wBLyxmCLC3ZYs78gf2KWw3Sevl0fjMC7dOToZxos
   TPoKHe3tRO46/lHHSQOcjQCwhJsK5osKnnljdN7Hpw9hS3PxzJkeim0Fc
   zTz/x2VjwYK63Hkwob4xiFIadSEbytF3Vfy/rENCnr5p5T4K2nyM8D3wU
   g==;
X-CSE-ConnectionGUID: w5Eet4wASPqoKwKYVfCywQ==
X-CSE-MsgGUID: UPK+iJV6SeGaBQlVWkOJKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87332946"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87332946"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:30:57 -0700
X-CSE-ConnectionGUID: Y5mCjhtFQw2UvDu5ItDRJw==
X-CSE-MsgGUID: w4UoC+P8QgugDTWGbAPy9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="265304543"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:30:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 09:30:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 09:30:56 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 09:30:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTuY4EVMO4fEgy84VR247+RLcn5zFvrptf8RxgPbnt/DOn4bt+Om9qIl8Hcq7k/eLjWpI5iDpjYz2i8nwX1WJfCXP/7Hf2y0rGMfjT8s53MF9R3LAJ76dTM+XHx33hj3jgFUwLKTL234sGQ+GJ72ra3M+nMY+lP9zJ8ICG8TpQ26weNyb5KGj2udpjet0dOu21A6dVYVKlrVb/N4sXOAf7/DqzElx8ssJjjp+VrNhJXhlv6LyL8tqn1J/qGIXgM2K8qssR0Gg2rzOuh7syHGjtKwEfm2AfDlVrrGiu9Ponv1WMVtOxwdY1j3JTl0w4ajpn4MKBPGF9FFm5cRCQA8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIE4w/5o1flGKzLIDgmBMQOlqlZC8r/ZxK63GMdxbBA=;
 b=VJBrIJnv7moDQ7sYyhbyHEX84V3N/iQTbWkE7krza3W3yX3XdchtI8VC7+XrDPrvC8C4y797soEM0ZCKHnb33s95nUjqaHjiyZ0a2FMs6un7uesgwzXT/t8RFfqra8Kph2t5ZGR3skPuZ1JcqUNYwfDRKFCcG5pbz8U06BDfZomqm3PEYEXcqOAHMrYz3lDXyyhdW77dxLFm4CnFyS0+WFHUt4WRvdGy7egnME0se4+s6Z+Ii47pCLxTDarK/WV22D7bgNYf4XmHpZWRLrvzqF1UoAVFIGbCRdhvHJ5xQSja6gpwEOP4MS3RK7zwbYx1S3XwVri1ouUiyumwqblB/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MW4PR11MB6617.namprd11.prod.outlook.com (2603:10b6:303:20d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 16:30:51 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 16:30:51 +0000
Message-ID: <d3281648-acd4-4852-a85b-96fac1ceacac@intel.com>
Date: Tue, 18 Aug 2026 09:30:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] selftests/resctrl: Skip L3_CAT when no exclusive
 cache portion exists
To: Richard Cheng <icheng@nvidia.com>
CC: <tony.luck@intel.com>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<newtonl@nvidia.com>, <kristinc@nvidia.com>, <kobak@nvidia.com>,
	<kaihengf@nvidia.com>, <fenghuay@nvidia.com>, <ltrager@nvidia.com>, Chen Yu
	<yu.c.chen@intel.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
References: <20260722035943.32337-1-icheng@nvidia.com>
 <20260722035943.32337-2-icheng@nvidia.com>
 <1eb20140-66e6-4e2e-b6e9-5172cfa29bbc@intel.com>
 <aoQ4hFvcOkU-44Ot@MWDK4CY14F>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <aoQ4hFvcOkU-44Ot@MWDK4CY14F>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:303:b6::17) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MW4PR11MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a505751-b035-4979-1198-08defd46111b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|6133799003|10067099003|5023799004|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: QaMeEcxwbPFGtwo2AsPeOMUgtRlRn3WkgN8pkBhFkCoMyqRPp5tNC+lfFvTwVWyH/ECRxA44OSnxs5wxnhH7n7Ql8SRuZtkCaip91kRv/lU/5P5Lw4xRG53PuihEekl8ZCFqimCF5TTjM+aEWdVfwaFYwCy2RwsEormau9Vn6+xwizjSftzAufHRzuCuIZAlWhGZbramVy43WU5/fMtTElwqRbqAiwA7GCmR7EU7NYg0fpiV+z2g7wBRXGFl0RkK5K1vvIjPjH5hyxNLclylV1ZMMpSJTcFv+unxoiL2gWzUtt9wU2+XWHofoxPbXHmCQ8U1M/52vkrl8rI6lKZB6w39T6sDoaEI3BZjOnSUbtYHl5yAQ4RnmNSiTnBNx1YlhiMrEzYCxOkaHWxcTGzBWVTtSdWCqhRLmSLzdR1dovXFy951AV/NSjpfdwTe5QcQVW4v1kyamEO6x4bPWNw1H8Foh9aVXpCpGrCFsLSFZXUeblukOWl+zo52SJ0CINhEBcmRKw5MMalEO5NVfW97jxO6+3a2rWgkX1ldpw7ivu7jX4CK8ymE59w/2L70q7lx6M/MAQw3HOL/8kfq0EHDAY/VZyCw32jR7xES95hSPCpo5iuiab7KRaBbCJNAf5FKibDjZLUEPyl37gNDyQthUtoJOy3XElQaHtgharBDsuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkR5SzVBRlMyU0xCSmM1cTMzVEFPNjd5aEZwRGdiYVJlRzBZSW9QU2Q5UEV1?=
 =?utf-8?B?b2o0ZnJ1T1dHQUpPamFBS3UweWFrT0R4SXRWZ3B1a28vS09STkdlUjRlUCs5?=
 =?utf-8?B?VThMcWJaZmw4UFJzRXdrTm0vYkM2NHhWM0hiOFg2b3NWSWxVWUh1N1VEd1dR?=
 =?utf-8?B?UUxXT3JsaFQ3OXVUQ1gvNnVRdlI3TFdmY2ZhY2Y4VEJESFc4akxERW5FU3ZF?=
 =?utf-8?B?MFpNckQySDdxUEttWENDeExWWDgrSGszaFBneEk1dVVIV1JIL0FoSWZreUs5?=
 =?utf-8?B?SjhLWUJ1ZVhhR0duMFFSbW9lZjVLbjcxMnRhWExSakhoNEVHVjJKMTd5NDV3?=
 =?utf-8?B?RnVRNlhpNEhWZXVMcWU0YmFsS1B4RXlFMnMyZUQyam9LWnVhMk5vbDQ3Q2pV?=
 =?utf-8?B?Vjh5NEYxREc0WHo4cjRnaEFxZ0MwdDJLeCtvVk9jNHoraWNPQkM0aXNPdGda?=
 =?utf-8?B?SDQxSU5WdEl2Qnh1b21raE1QVkRvaHBxMEpEalJTbVdLZkozeWYzWUlNYnhz?=
 =?utf-8?B?Mjc1UjFFNTcvc3VkQkRtSGxTMjZJdWQxMGswNWNSUDArWmdpbVg1UTV0QjFD?=
 =?utf-8?B?T2pMR3NoMGVIQWl6bDJ6QXBzNUk5cDlwLytzWXd5UXROT1RJb2daOFVqNk5a?=
 =?utf-8?B?dHJ4UExEbEttdE9kTVBJRGdIT2twZ2JLN2QzcWF2SXN3eGhOalJGMHZZc1k2?=
 =?utf-8?B?ZHRQN011Y3FiZ3Q3MTg5Tkx5amFIbkNIa1FqOTd6T3NJTGM0cGpTeUtHSGh2?=
 =?utf-8?B?QkZzMUh2VEhLYW9hbCs1U2pFVE02SG9ZZFUrYWx2eUR3SThLM3JqeXJ0d1VL?=
 =?utf-8?B?ZVpYK0ltVlM0NStjczRlV0hJU0VGcVJCWFZUUUUxZlhmZEF1QWdoMEdzaW52?=
 =?utf-8?B?Z2ZXRHhjblhJcFE1Szgxam1lVlV0SEJ4bzJSNjJZMVY2Y0NJeTh3U0xVMFJr?=
 =?utf-8?B?dDFycDlISU5jL1VCdHR3UzZiZHhJaTNKdThFeWxwZXRlUFFzMXVmbXR5aDF1?=
 =?utf-8?B?RUJpd3JxMDE5UmdlcUdQalBuSVk2bVQybTkvaXAxc21UdytFV1B2eEROVHBB?=
 =?utf-8?B?aEpucHVyRVR6amxFKysycFpNRkh5R0x2KzlJSmtQeFJoanVNdXM5ekVDRnJM?=
 =?utf-8?B?eW1BUDRyZHJVbkhMZVdKamJRUVBtQXdpUzU2c3YrM0tLYnRrRUV5LzBzTnZS?=
 =?utf-8?B?Qjhrd3J1QUtCbmlDd1JvZW1HSEYvSXBrUmhWWjZhQ2FIYktJVjlhWUFRcEtq?=
 =?utf-8?B?Q2gzR21LWXhGbm1VanlWa2NJc3AzNXFwNC9lS3lpeVJYdVZYMlFORUNNNTh6?=
 =?utf-8?B?ZGlyWnRJZ2JGQTByWUI5cjRjdnVWZUQ4ZVZlRjBZeHdZblVpa2VwVDF3Kzlv?=
 =?utf-8?B?VUd0UnV3a2loU0xKbUtJQkFDMHpqQXh1Szd1ZjNpNnFHRTJVcE15V2VRdzVF?=
 =?utf-8?B?cWhXRmU2RUZTQy95Q2VUSmswRHhHc3pRMmFVMERRSmNtbDE5NzhpTmd6S1c1?=
 =?utf-8?B?MlpRdVlPZ2wyT2UvWVNxUGo5eVMvejNPV0VwYmg2bHZhdUtRSnAzeVMwQjJE?=
 =?utf-8?B?VVNwd3pMU25pbHIxMVJ3S2ZLV2VxZTNyTFlXVURHd2dBS1hxVlZKZ3V6b3Vp?=
 =?utf-8?B?ZVk0Qld3U1lOOU8vd3ZEV1JXYnlQaEJMRnJ2SzNIR1Y0UndCNStvYjVrc1Fo?=
 =?utf-8?B?cUlKMHNLR3dPK0oweTNldG1RcnBDUlNmUkxHZFB1U0RvZC8yejhnR2FCMFRm?=
 =?utf-8?B?dUhVaUhyQVY1dEcrdE5taldLVUVHTWZWTmVXS09jTHRzZHlVakpRelhiZUlZ?=
 =?utf-8?B?bXA1Rm0yZDYxeWh5UXoyRm5tcjE5QWZCanplUTRDT3ZuZE5LL2plZThWVFFW?=
 =?utf-8?B?eUtLQlFXeXE3ek9DdEkwMS9PM0pUOC9hRjVCM1pBOVRqUFJuSnUwTVpTNkpv?=
 =?utf-8?B?RXJJUTNBREU2bjE3NDVZSmZzdUppRlJ1WDJSWWtwWFdKeWkrN3R0bGR5YVBh?=
 =?utf-8?B?d0xZL002eTJOUHVIZWNTUUx6WHdUT3Y4dmN2V3g3TDJNU045VE9tMVF5dnZ4?=
 =?utf-8?B?U2Q0TFNiOWJQYkdMWDhGZEVKVG5TU2FJVlRnTDRiRnpZbGpHVWlOWTl5TDM2?=
 =?utf-8?B?ZW5vTDlmYXdYYXltaHVMMzUvK3B6VDl3aXFKaVBVQ3hOQnhEMXBpK1B6L1VP?=
 =?utf-8?B?VGV1cDRaaGJXM25TZFZjM3hnUUovN3FsZ0lHV2gvUVdMSUIwLzBxSTB1dmNK?=
 =?utf-8?B?eDlscHF0RE5NN0p5em0xNHk4eC85RFBGaTFuNFkvSGxYKzZtRDNpRXhVQXV5?=
 =?utf-8?B?OHNwNUx0eVFLUWtoS3lZQkhidmJRTVZoQU9FSEJNYlB5M1lqd3J0a2ZYTVdp?=
 =?utf-8?Q?xwO+GHucXGqoIfBo=3D?=
X-Exchange-RoutingPolicyChecked: JKr089RuIvBI09O97Yr8W8VojnwqxLEQGlh/6kefVdM94sCTWmrQTfenSWlmH/3sFUB6bppk09/F3E4RXXkpMlCiYlTx4WK90v7chS3x+e0VOzv8tt939she33bWC6/Lf7QPrQnscCMQxupbg/7NK7bIkvxyTJ0zNEId2NWvsNo1hY2O3jVdSK8U5S/wRT9CTGXWA9EU+gL621vl6vDVir6wcdlNcR2WE/+eb7C0V7IzkH1Wxr2rqHWMxIpkXymJATc8SJEgUtYswRKPVzPfjxdvWpMCAndNnB1Byr6iu89Cn1+6N0HB8OP2DB4JanpWsersLfmKMwkzjQNyBcQNFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a505751-b035-4979-1198-08defd46111b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 16:30:51.1392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTuN0EY9rEecrqxYzzlV0+8sMSZ2JT+eFkfMIVhdQIj60lCtUy83Lm4nNlBKo4TRF0WM95GvKpPA7AGy+RYl4jNZQYui+CkouktLGqBnW/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6617
X-OriginatorOrg: intel.com

Hi Richard,

On 8/18/26 3:54 AM, Richard Cheng wrote:
> On Wed, Aug 12, 2026 at 10:22:03AM +0800, Reinette Chatre wrote:
>> Hi Richard,
>>
>> On 7/21/26 8:59 PM, Richard Cheng wrote:
>>> L3_CAT measures cache isolation, which requires at least one cache bit
>>> that is not shared with non-CPU agents, i.e. cbm_mask & ~shareable_bits
>>> must be non-zero. On MPAM, shareable_bits == cbm_mask is a legitimate
>>> state, so there are situations in which no bit can be reported as
>>> exclusive.
>>>
>>> Previously get_mask_no_shareable() was invoked inside cat_run_test()
>>> and silently returned -1, which surfaced as a test failure on arm64
>>> MPAM systems.
>>>
>>> Implement cat_feature_check() to perform the same check at feature-check
>>> time. It prints a diagnostic and returns false so the test case is
>>> skipped instead of failing.
>>>
>>> Tested-by: Chen Yu <yu.c.chen@intel.com>
>>> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>> Signed-off-by: Richard Cheng <icheng@nvidia.com>
>>> ---
>>
>> This patch is unchanged from v3. My comments against v3 still apply:
>> https://lore.kernel.org/lkml/5d76e776-82d3-4f02-8384-a890349ae96c@intel.com/
>>
>> As noted there, this issue does not just impact aarch64. Could you please
>> split this patch from this series? When it is ready I would like to make a
>> request for its inclusion in the next cycle.
>>
>> Thank you.
>>
>> Reinette
> 
> Hi Reinette,
> 
> Thanks for your patient and review.
> 
> Just to confirm that I understand correctly before I send v5.
> 
> I plan to
> 1. Split this patch out of the arm64 series and send it as a standalone v5 patch
> 2. Keep the code change the same, and udpate the commit message to make it clear that having no exclusive cache portion causes
>    L3_CAT to fail, and simplify the desciprtion as you suggested
> 3. Change the in-code comment to platform-neutral wording

Sounds good, thank you.

> 
> About the editted commit message, I plan to write it like the following
> 
> """
> selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists
> 
> L3_CAT measures cache isolation, which requires at least one cache bit

nit:
I do not see L3_CAT as measuring cache isolation. Instead, it requires
cache isolation to test whether cache allocation works.

How about something like (please feel free to adjust):
	L3_CAT requires an exclusive cache portion to test cache allocation.
	This means that there cannot be any overlap between the cache portion
	used by the test and the portions of cache other agents may allocate into.

	Some platforms legitimately report every cache portion as shareable,
	leaving no exclusive cache portion and causing L3_CAT to fail.

	Skip, rather than fail, ...

> that is not shared with non-CPU agents, i.e. cbm_mask & ~shareable_bits
> must be non-zero. Some platforms legitimately report every cache bit as
> shareable, leaving no exclusive cache portion and causing L3_CAT to fail.
> 
> Skip, rather than fail, the L3_CAT test when the platform has no
> exclusive cache portion that the test can use.
> """
> 
> Does this match what you imagined ?
This looks good to me. Thank you very much.

Please also consider the above feedback when adjusting the in-code comment.

Specifically, the original comment:
	/*
	 * The CAT isolation measurement needs a cache portion that no
	 * other agent shares. On MPAM the kernel may legitimately report
	 * all bits as shareable; skip the test if that is the case.
	 */
Could be something like:
	/*
	 * Test requires an exclusive cache portion. Some platforms may
	 * legitimately report all bits as shareable; skip the test if that
	 * is the case.
	 */

And the original message:
		ksft_print_msg("All %s bits are shareable; cannot measure CAT isolation\n",
			       test->resource);
Could be something like:
		ksft_print_msg("All %s bits are shareable; test requires an exclusive cache portion\n",
			       test->resource);

Reinette


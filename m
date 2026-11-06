Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794008265;
	b=PE4gZ/H2Qhfen8jmazCFvwo6yIkSc753Pw7AcYzK0NrFjqiXdGdRIEeZ+5E5pFE8uk58
	 bf8axJQesaqvob2cDDKsx+QSaR8IjGkHOoXAGUCSd+GLvx1r5zjObJZnnXCbSYjEAZKhI
	 iK+OP9M/UpwqAN1LqR4WXZLQ9amecsRwaXs6SZsNd4U4sQtFK4+iXEK4V4s9Mn8R6A/5W
	 q5Ipu5RyLJvx040JWgTOnznx7toNZB8kawTQ1Vegs7+blOmcqVrbEg1jFtHfqj5A7OUO4
	 iekGe2MzDXwXFRgeAnfwnTzQ6iy8icJsbJYyibwXBxCRlT5kaVSzmN+gosCF0J+yUfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008265;
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
	bh=tz9E6RWQg9/NjI+w5rv6AX5xHAYbYOVRHbCR4eu8ezw=;
	b=dLR7L4qzs8KfU8DddBbqeFBLoWM5iaCIE/bN6QztFvaayymgL6p6QC10iJPtOhDA6hlU
	 HAK9hjsILfutww2gecs3mhopUYWzlYcx6rl58LG/mMofDOQR63pUkmEF7FlfYRvBQtZKE
	 VyvEYcALuuDcAPqev5+K4p3AfhYyn3YIpk0tFmf4D2nOQUdikE+NXCwMvkjFamRCXoPT2
	 mbb7bi2QotuMby5OXh5EZ7iEdivvf27H6Z+tgn/Ein3SpyVugiAGX7dn98NdM1lHTM8Y/
	 KJZ4nzsjhWGvjpGXrtWRKveoRo0/lreGYbfbtJLfQ3SlnkdksSBY6h3+ffUrnhsD/Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dB32Quqd;
	arc=fail smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9779B606A326;
	Fri,  6 Nov 2026 23:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9779B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dB32Quqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794008262; x=1825544262;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WVxRLx/GIcQ1KFAilNqZguSj4AumDQ3UUTkTFlACgek=;
  b=dB32QuqdnPA2uOUzdNtWiAOme37rXfBbZiH4cuNsDGmHPD72kirHj4WB
   BDpYM1Bd1FXPxBRph5JJEuAI6U/seoEzeJ5t985DlB4wAe3+OtOZusBuG
   7l+6ywFE+ReHkiO9xXSUwzM12LO3Cdv1lu9FlbuQOOb9Gl5MtlDBtJia4
   72V1warpi743hQpLQGea2h1KYOJCw4NlEJe9+CSmQa1j9zX0plSqFFzR9
   O7I4Y3NOowCNqwSl57NBO8Ca8FFScUdqZJfUazYPzz6svSkxkB5Rhfzyl
   fIZ2qjt5NrmsxHRkg6+BDXVw/llGGJS3+mVccIvO/O/6n46/FIcOXn2XJ
   A==;
X-CSE-ConnectionGUID: QceJ3ypiRRSZL27n/k2C1w==
X-CSE-MsgGUID: KGK1gEuaRCy3s3EScZMIxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2872002"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2872002"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 15:37:42 -0800
X-CSE-ConnectionGUID: t5ILzsIvTuaNhmekfW4AeA==
X-CSE-MsgGUID: VHxVjGKnSRWVP2wploalmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7501993"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 15:37:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 15:37:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 15:37:40 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 15:37:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwL+vfmwAdd5+YYQuYTYay8QczkRnRyj9rh0y1gX10IMOb2apEWdd0YRNafhc+KKD80xlq9+O+djQbJ1YXMFTpaiwqgqxPFp3Q8ZCABfUKcLHxoiVseKZiZex7yC0qCljXvFUH8/X34f4S8QO187mA4vkSA36J12gegRycDIlzCb2qarJ1EPP2WPhWO7QSYXeDnm8ZqEaSl3IIuCaSA2g5QFU/YqC/gwZVH1CKKe4W2JrO2M4AbRYXKvuC5Xbbmubo4KJEdHpsJxA+6PmREjqgwVBsWPrmsOkD9kMW+dQf2Y+nxab7TEV+xeE3edEFy02x/021TZAPbCfpjdqM5pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tz9E6RWQg9/NjI+w5rv6AX5xHAYbYOVRHbCR4eu8ezw=;
 b=HGVbCm9M7JX7WN94Vgie4AEXzKiO1TunY1x9SXIUUArFIejY0HnAfOgZjMZr28Jkaf4DmRCmCMrNQ5NdiHhKKMDKntZNMQ8AOdKVYOzfmC3y+osgQ9ZghbhseRNSkb8EyJa9tz2uSyQUh5e0N1YhfE30+NCkx+/3CJBHwD53qzRygCxvNQ35ErV6UlJkQMlIMgP9LMbomPLELJDbUg8zjXXU9uYB7Xv8t8Pkp+djNHbgWeSkPES/4Yo+5RED9R6WelDi5NxLdpDbtxcK/RzDQz5/0QcV+XaL+h80J7TfxnrtDGXx5YI8SrB6ObWz/uOLFZcWKgle9JNOX/khL8jCOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by SJ2PR11MB8567.namprd11.prod.outlook.com (2603:10b6:a03:568::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 23:37:31 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 23:37:30 +0000
Message-ID: <857d915f-9439-408b-9109-82143bd96ace@intel.com>
Date: Fri, 6 Nov 2026 15:37:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] selftests/resctrl: Use bandwidth values for AMD
 MBA schemata
To: Babu Moger <babu.moger@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>,
	<tony.luck@intel.com>, <fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-5-swapnil.sapkal@amd.com>
 <b250f681-5726-403c-86af-cb4bc35b9d1d@intel.com>
 <e30b8e81-938c-4426-8b4a-2a3a8d5163ad@amd.com>
 <4f656f59-9f2c-4774-9d9b-3a4d7b7b509d@intel.com>
 <39598840-29b1-4524-806f-9ef9dc2a3944@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <39598840-29b1-4524-806f-9ef9dc2a3944@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:303:b7::17) To IA0PR11MB8379.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|SJ2PR11MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd5f319-74fe-4909-2af8-08df3c5eecac
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|261026121527099003|11063799006|4143699003|56012099006|261009223027099003|261102123227099003|261021121427099003|261022105027099003|261028144727099003|261026140227099003|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: lh/cWlD1tXgTbz9rEcxB47rtumPR4vo5gXOiXlXSZVRn/mJue3eJhaGcBQaEAMpItps7QmvPhmHFR95uM83ZM5WgOoWmnIEkgV7pDkOBKS8esMCVXPsb+kwueGn6LYkwuo0DJmYMyy7HVXcEcKmBbPzYwSnYltjA5RO/4AKdGPARxBfYxPnJ1FtfymrK8Yj95oJxro7ifWfb1JxX7Ex/dbuoPqfy0ZpPY+rQ92V9dNgDaLCSNBPXG794kMhc4Co+nEavrooFAJa2limJjfvdnNQprz0HOyAW2HV/WvpqlPEpbzAXPqTHHhKDkuSHSwS0pXqKB5pgSs5B6YY9yCBa43XAv1swZFUnwvvTx8udeNk7Cz3YtRDjyR1e7zTmYobb4tfiIH80WEXG3beRmj8J+CwC+mgDP9EiSMemNvts4V//0uMzlkz3dDBvxuFX2W6/yHNKkEkyAO7zkbU20eHfyYJFMdXk3WOWRF/Hi4sqYebmLpqQPsDaBFEXDW8wog32Td5uVoBxULmYnPIHCQxUrmeeXKec1zVQQwbbIwMfGk1gH33Zs/oxzraL83I1k6ORoBelbIkas8P8lO9d4Cs/rEfdT2qIFZ/5BVZKoP6aKb8mCqJwp9ilkCDZ+4iVEvTWoT6js3ZCunBB3yPQCMCdHpR1ZdSJxzbhNmkgcW5I2j8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(261026121527099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261102123227099003)(261021121427099003)(261022105027099003)(261028144727099003)(261026140227099003)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K25aWlBxa2d3WS8zU2kzUFZFZnVpdkZsUzFwdXpCMXZ6ajFGZXB2bDlDbU9p?=
 =?utf-8?B?VUt2OWdNVDZzQlZnTHVIb25jQU40ZzFvUWlmVmh2OEFxZC9YS2svRTNESm41?=
 =?utf-8?B?ODlzanF1YXQ3aGFzL3BPcnVKTy9XQitoNGw5bmhNODZvaXdTYkdsd2ZCWE42?=
 =?utf-8?B?a2pjY1BTK3R4aHlwRHBqdmdqZUg3T3dhOHNaWVA5dWwwd2dpVEdLbWdKcU5j?=
 =?utf-8?B?STNNN3kvczJ3cU9ENmQ4R2F6Znhobmh1TksvVnhONllUV1lHRHI4eUVWek1C?=
 =?utf-8?B?UFJ2ODI3V1grUG1HL2NCZklwK2FZS2l6UjAzZUUrVkd6YzNrWVRtUkZUTWtv?=
 =?utf-8?B?d2kwbTFxVFlGaWc0UUloQ25vUUF3eklQVnV1QzVaU3pSWWZhZlJnV1FNN0t6?=
 =?utf-8?B?SEpvOHdOVDJPTm9adStmT0cwSzhIL0xRZ0xLcXJoUzNodlNBZURJM0FPMVlw?=
 =?utf-8?B?cjBrRG16bjdQcHovcDcrd01UbG90bGxHMUVVa0k5dkRPZ1RSSXhVYkdiWW9Z?=
 =?utf-8?B?bGxReWdPdVppYUVINU9tTWFjbzNULzlUSTc2Ykx1bG5xMVBES2tndVlKcFhY?=
 =?utf-8?B?R1Bzczk2VlY3WUtQZTBSZUZMb29rVVREdHNSMGlWNXJqSmh1WGM3N2N3dzNZ?=
 =?utf-8?B?R3RxQUduNVZITEQ4eXNnRVZvVWJxQXdwbFZZLzVwd3lRaU9MM2JoN29TVW5X?=
 =?utf-8?B?N0FMVHFwdmppR1piSUZnSEdVUGJFcHF4dXE2NkxFd3lOa2laZnEwa2g1dG1s?=
 =?utf-8?B?Z2VHZ092ZGx3M1hsbUcvZ0h1L245RVh1S1h6VGN5QzBTVzZ0bkdlK1c5ZHl5?=
 =?utf-8?B?SGJmUTJSMnZhalJaVFdYNlBnZytrQ1dHYnZieUhCR3ovRkhDSnY0eWZFd2d6?=
 =?utf-8?B?aysyYkp0Y2cyajVlcjFEVllFbmtUMy96ZTFOMEhWYUNXUk5tR3lWS2JId0NQ?=
 =?utf-8?B?TlpEMGMrSmdnVEJuRFZTR0ZsTUpaS1lHczZjT2lMSk1iNk80SGhFRFFCOXB6?=
 =?utf-8?B?dDlzbmx5TXVRVVBCVnV1NlM4WndJZnRwSHFiSlA2aG01YU1VV2tJeVVsL2dG?=
 =?utf-8?B?RTNlNkQxbVVQMVpKbGJpUUM0dlcyM1ZoOUJ3cmI4dUh0YmdiSWR6Z3NKay9P?=
 =?utf-8?B?bU1CNzljb2w0VzN6Rlp1YUVTOEdwNExUK0pLMU1KSDUvdFF6b1VFSXpOWGJY?=
 =?utf-8?B?U0IyMG1Jdis4Zk94WjgvdHdFWGxYSjBvYXV2UllISFE0bDZRZ1hrR1lZTlVT?=
 =?utf-8?B?NDNnZlVQc0g3QnRyaTY0M3hvZndrSDRDTE5SZ3Y5UFFyVDByc1pkclVGZGIx?=
 =?utf-8?B?cGV1OEdCWjJ2YllIM0dkYmFkeG1DSFR2MmJSZHNucGZtSXdWNDRHK0dGQ0gz?=
 =?utf-8?B?Z3YrSmM3bm10Z1JUZjRRbmtmSHZZaWJicENTczJZRWFvK2ViQmcrd3VrVm5Q?=
 =?utf-8?B?RzI3c3MzdW1MeXIrcnI2NEJoRHhqWFVxWStiaGRodHdkNFJHZm1mRTNtR3J1?=
 =?utf-8?B?UkpOQ3g3Q0lPYld6aWRxUi9zMnRTV29LNlpvUEdxbjBSZ0VPM1NDa2pBOWli?=
 =?utf-8?B?OFUxdVJSUlZ4SE9MNWNnTENuSVdDU3kwRFVncTd0em5wRVZrNGdYY1BHdFBr?=
 =?utf-8?B?K0l6M2kwdzJaSGU3QTkzaElCU0dZT0lIUzZacGZLY3d0OWxIZVJQS1Q2cVFj?=
 =?utf-8?B?K2VhMWwzUVdVSjRaSlg2WjNoU0d5Yk1rbkoyak1zanlrUWw3K2tLWFlxa01r?=
 =?utf-8?B?U1dHL2preE9sZ2t0QWM5akhsMFR0eEgvZ0ZPRXhmd2NhekQ3MGo5Yk1JMDdM?=
 =?utf-8?B?YUFxRXpoSGN4cFB3UUUxZnZWd1F2S1d1b3IxMGpwU0l1WUlOTnIyNExHUi80?=
 =?utf-8?B?TTcydTdGMHhXQnFQK1l3VlY5Rml0c1lKdnE4T0NFUk9jck9kRWhwbzArSGdS?=
 =?utf-8?B?RHhtWWJsMjQrRTF2WVpOQk5OaW50MmpYM1ZkcDZuUzdrZFo1QnY3YWpuTWFa?=
 =?utf-8?B?K3lMNENqZW12dDdBUUNJWkl0eFhscTJwNWxtbk1aRXhQT2JOUEs1RHBZM1JX?=
 =?utf-8?B?aEI0RW56cWF5U0VJMTlTYWlldUNPTVJ5eDVSR0ZIa2RZS09hSmVXdDZaZDNo?=
 =?utf-8?B?bEhEcUtQekdvTlE4Nm5vZkZwZG5GK1R1V0VxODRPM1lpdWllRlhlZjFLb25P?=
 =?utf-8?B?NHZuWTNITlBLUC9QRVhxamlFK25zTXlMWEtJZFV4Q3ZVeTBLMmppZ1VQOEtV?=
 =?utf-8?B?L2piQXZzTVVaSGw0OFdONmd4dlpSVytUcmEyVUlNcmt4MTdPM281QjdjNVNx?=
 =?utf-8?B?Qnh5dE5GU21Kdnp5U3UyQzZJL3ZkcGpBRlovZEI4QnNWTnZpL3dXWGhoQlVE?=
 =?utf-8?Q?/yUVUPcX08aTZq+g=3D?=
X-Exchange-RoutingPolicyChecked: y3PeS7I346spCUVO+1nDeGdoZgbtjeSb/kWORuucvqcZHHYlg0QuqAXVxpgsLfno52RF0fL/DLvgiAqEszkbcxRRBgrgvO5Mbio01t+5y2Ksjg9xC7uQQ81Y9zaqXAHpss+ZHxcerNtTrDu16pn+i7NmDqOAPq88+TQYUQZ383ykxKyBimLrWRvk6CLBkHCVuacRpNDZFRFDaObYGan5lyeaBbO6HxyDDjMviKpTZP8vbi2PI0qCSMcAoDbn+d9sUoYIST5IZqfwG0uuqxsD9obJpinlepboqDSghJR1FOgFg76lUCSPgBZr7923MN9qREJiZj6NXAqFYQFTS38rvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd5f319-74fe-4909-2af8-08df3c5eecac
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:37:30.6929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOzk2f59P/RE/kY8pNEt7mRcyVBPCPpRDz1bEu7rbtYSRlsvh8CAOpgCyrMDyDxNj+j/lPbwEH5jkjdJrJVc78/puZlroGKbb1dUIN/NeuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8567
X-OriginatorOrg: intel.com

Hi Babu,

On 11/6/26 1:25 PM, Babu Moger wrote:
> On 11/4/26 22:16, Reinette Chatre wrote:
>> On 11/4/26 8:05 PM, Swapnil Sapkal wrote:
>>> On 29-10-2026 00:15, Reinette Chatre wrote:
>>>> On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
>>>>
>>>>> diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
>>>>> index 17ae73d3476c..947735e26099 100644
>>>>> --- a/tools/testing/selftests/resctrl/mba_test.c
>>>>> +++ b/tools/testing/selftests/resctrl/mba_test.c
>>>>> @@ -13,10 +13,51 @@
>>>>>    #define RESULT_FILE_NAME    "result_mba"
>>>>>    #define NUM_OF_RUNS        5
>>>>>    #define MAX_DIFF_PERCENT    15
>>>>> +
>>>>> +/* Intel MBA is specified as a percentage: 10%, 20% ... 100%. */
>>>>
>>>> The percentage based interface is the generic interface and not Intel specific.
>>>> You can drop "Intel" from references to this interface.
>>>>
>>>
>>> Sure, will do.
>>>
>>>>>    #define ALLOCATION_MAX        100
>>>>>    #define ALLOCATION_MIN        10
>>>>>    #define ALLOCATION_STEP        10
>>>>>    +/*
>>>>> + * AMD MBA is not a percentage but an absolute memory bandwidth value. The
>>>>> + * test sweeps the bandwidth from 4 GB/s to 40 GB/s in steps of 4 GB/s,
>>>>> + * which the hardware represents in units of 1/8 GB/s (i.e. 4 GB/s -> 32,
>>>>> + * 8 GB/s -> 64, ... 40 GB/s -> 320).
>>>>> + */
>>>>> +#define AMD_ALLOCATION_MAX    320
>>>>
>>>> The AMD maximum is enumerated from hardware. How can it be ensured this is
>>>> the appropriate maximum for all AMD systems?
>>>>
>>>
>>> As Babu mentioned, it's difficult for a single-threaded workload to
>>> reach the hardware-reported value. For that reason, I used these
>>> values to verify whether throttling takes effect.
>>
>> Just to confirm, my question was not about needing this value to be the actual
>> maximum of a system. Instead, I just wanted to confirm that this "320" value that
>> is hardcoded here for all AMD systems is a _valid_ value. Since the actual maximum
>> value is enumerated from  hardware it is not obvious to me that all systems will support
>> this hardcoded maximum.
>>
> 
> The value 320 corresponds to 40 GB/s. I have tested this on several systems and was able to achieve the expected 40 GB/s bandwidth. The tests did not fail.
> 
> There are some older systems where the test is not expected to run because AMD UMC support is not available.
> 
> If you are concerned, since we are no longer depending on the maximum value, we can be conservative and start with the following adjusted values:
> 
> #define AMD_ALLOCATION_MIN    32
> #define AMD_ALLOCATION_STEP    16
> 
> This allows the value to reach 32 + 16 × 10(num_allocs) = 192, which corresponds to approximately 24 GB/s.
> 
> Hope this answers your question.
> 
I seem to have trouble articulating my question. Let me try to ask a different way.

Consider the scenario where:
	#define AMD_ALLOCATION_MAX    320

If the below (kernel code) snippet is run on all AMD systems on which the
test could run:
	u32 eax, ebx, ecx, edx;
	cpuid_count(0x80000020, 1, &eax, &ebx, &ecx, &edx);

Is it possible for eax to ever contain 8 or less?

Reinette

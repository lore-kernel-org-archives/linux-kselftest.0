Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209319;
	b=NLYO3MBUfIGyMiAJF4YO3dU07B3vKEu+2KE+5hAkC3YilwMKpMjFdLdkP94j7tKa6U/U
	 PQnKK1hRr9J+Z8oobW396DOIsXdbJqfvy4SHIc2DJ2HNZJTAHsXyxi1BnheqTJwC9ftWx
	 8yCh6lm+mWMIuNHIV7Kawr+7uSJJs/p2ghJglikjJNJwSrXBHaSewHU2oE336OU0ytXIS
	 za+hM2AWc96wbTn9B3+AGEE7x4F+ePYXkNb5vPubtmFnoBTiJLI7xUeaFm5htcdnpXidV
	 9awG5M55wB5SKmGnTWPatyQhQ2OEKJXSuFf7A5pkx4u4MIgStAMuG1qij5ccw2p6wSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209319;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=ZUAeJWw0kRQmavnOeV3k3ZpXUkxR8UamJmU+8C2Ub7M=;
	b=BXZx75BvB9WcgoYxQCy04+xR/3VRdzeImhJ/c/sXVVMRn/rFqFiuqQdRgYAzdzLjW33O
	 eOEWQnOKfF7Jocy1JCaLcPCOMN1YT4b8a83urkB9h9yPy8KkSbLrtJqI0CrfbzWdKwaRn
	 60I+5eOX1YTK0ib8H06wxHj8SFYkFzzIfMMVjm4DYkNpVk9nASzhtTXcz6LJfyT7ACq3q
	 IZpMTsSbeQoJaTEeci6vd/DrBQDEt5DMPclGyTznMVGazhgrcnLjw3Pr/K5+wP7OmBZzF
	 RDI2Pf13t9kTOxGj47GelnanlDXpedjGS3o6a9WouoyHTTItmOi33jb5v47yWGlkS+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dZHcOz6I;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WNVCaFAe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D7A606A6AF;
	Fri, 20 Nov 2026 21:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D7A606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dZHcOz6I;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=WNVCaFAe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795209313; x=1826745313;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4EGbHyOeKXpxekEq74MVD7rDrfslD9FJlxYbcoZHviA=;
  b=dZHcOz6ILNK/1yrdRAlbdCkR+6tkZ6FzYOfg0GdIT8E/WyI/DKnNkE6y
   DC5OevRVRdk1azEsK1g6dfzaDzJPXSHG+vrhSw5aHDU1HpXi747Kbslae
   glla3AY4I8S2thlLS1tYmvi6F/aBAaTe5o8h3RQeKjlAzZDaLqnhyP5o7
   N6QN1xmS6skPj6i5B6A/0H1FelK7iBDBOzL1Rjacvue/1GG5oc3VKpVud
   iLYn6F5wSeFdFzDnp+qYOaMd8gebYEOyr32wvtM6VO0kG2Rl9+S7zDdEq
   o7lwTOBFFIhUZfeGh5onCkqCJtMb+rA4U/r8iilMt292Ko94ZtacXgLUY
   Q==;
X-CSE-ConnectionGUID: 5K+bbTbxQEq/o47ExewO3A==
X-CSE-MsgGUID: YUz/SUL5QoSbcMgDjh0oJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4137960"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4137960"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:14:56 -0800
X-CSE-ConnectionGUID: 29A3RIepQTecBfQRjn6G5w==
X-CSE-MsgGUID: ivfLIvwwRUC4L0uhrChkwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10913006"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:14:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 13:14:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 13:14:55 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 13:14:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ao3nPYwhnkOZJvFtDv23AKrCdn7CRshzKuKW8lVIIi9gyOIuglY6psg+wrhlLJOuye3gBiNvdg7TPKEhWxdCFncKUqhdTLEuBwA7dCXx9czMeNImc4l16QrTGOlAqGcTOHnaq+VzfaHOQTqcXmNpeQrFArvY/nK0NEE+2J1kwxOZ4thEjGBB02HfFN/ioOYu36fN6eB4PFzcPHXySyjRu3mhYlRES3ZltSPaOW2zd+9w7ggnkVYvFtzCDWFl4VxYCjC3l3sI5dXOTm/4t9IJr2H2s35k7lHdjXq2fvJ3aoshh9XjNPutSKn2OWP1NReCjYg2sCrMRod3L9G2SoHLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUAeJWw0kRQmavnOeV3k3ZpXUkxR8UamJmU+8C2Ub7M=;
 b=eCIQX/CKwsL5tc1hGu6Y+0aGCMaFYD/9Llps2UXroS8FZG+GZ+VKwY4ADJkPS920JxqarxdhCU3dtvm1B/+jOiES/pSgWrx7337XfdQXBSPSHi/JbzjR+bIjUgu5+dI/qpYPwzCh51/gaMVBjQOXT+gzhjoAiqifUhy7Erq2N+MQUgocP9Ga8W4e97oewSCM0kch9DBqr3HbbT4P/VZpnYGxF9OP1azx4jl+zbjCwtnQsGSOBV6h0187CwAInsYQCBVEH2zRJcwi3vS8ENw0N/HWXOplzNW1G0UoRQZTgks+1x3z/+WxXT9hYVxO9dt2pVJ1696HHqRWt5LA+Syn2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUAeJWw0kRQmavnOeV3k3ZpXUkxR8UamJmU+8C2Ub7M=;
 b=WNVCaFAeGwIOt5Xqt8aCAwDcCaBA7gU8SK3Z58Zg3ohIinb4IxKjz2mk6PaL+kfjL9eYCjkReR+vn2V01xIiQv2Xsf/ob7AVUNcd/yXracgo5i4WlLYBz2e29HQfvIUVNUKqfS02NPvyJDiq37LHru7G4g8VAQB1Rs7gKYXNFg8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LV3PR11MB8676.namprd11.prod.outlook.com (2603:10b6:408:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 21:14:52 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Fri, 20 Nov 2026
 21:14:52 +0000
Message-ID: <aee5eb9f-2003-4c4d-804d-7571b9658d89@intel.com>
Date: Fri, 20 Nov 2026 13:14:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] selftests/resctrl: Recognise aarch64 as a vendor for
 L3_NONCONT_CAT
To: <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
	<linux-kselftest@vger.kernel.org>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <linux-kernel@vger.kernel.org>, <kaihengf@nvidia.com>,
	<kobak@nvidia.com>, <newtonl@nvidia.com>, <tony.luck@intel.com>,
	<kristinc@nvidia.com>, Richard Cheng <icheng@nvidia.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	<ben.horgan@arm.com>, <fenghuay@nvidia.com>
References: <20261115081245.8622-1-icheng@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261115081245.8622-1-icheng@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:303:2a::20) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LV3PR11MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: 42116489-bdb6-48ec-18c4-08df474b5133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|10067099003|5023799004|56012099006|11063799006|261021121427099003|261022075727099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261022115727099003|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 8N6gnmnEw18pbrEF/JWpdHeKkxdsTtWE5a5sIYtohP58LleB50NehI/wL7lAQDPgfMeGn7O3uxCtuYM6FTbrxh7zPpQOVGKWUA6vkiqIBYTRUX6BemiYQwO5UdLI1axYwUOp1kfAgb/Bm9KSqg0XAO0qqB0tf6NKeOmmXJRnoYe9mxLtVQ4NN0gHNy8CUzORgEG75hMSGQzTM3mUAuap0KfjfdtyMe8WqE6z5WDcLFm1ATssG2CLSivHHtEwQ2n8u5yb1rhyTwx4O2Utg0b7r2BSDUGdyAtQLtrk3B434iZHlHlNhce8vtErOTj8D6I5Rspnrrh+Z0e5XzmoEKxNGMc0sTPH1BTUQnRwBpGUyk3ns7WxmXwSNDKpZ4y78BD6/p22d08OZGhmQsujp34v0PIyIKcVyOg/wmmwY0k80HL75WwjXfXzUCpdttFHnemu5TAETML0tefdytAckJV27Y7DTzf+Xw5OO3v8XMFsTdqQLlMqkvGMiGX/jEIXaTG3o+Cm4jEOMsZOg6iOzS576nUjbUrXygrO/BmOTfJRlspYUO2K42RcO7NYSmYgxYdz3GJdsS8fS6xh77/lge5O4rIRe7N+KVJI1Z1m19gRFjIyLfnWTYRlbpF+tmS79THg5C2xcV4J+1aQAFfcIe/1xcugoufALCAQzqzVI8nJFEU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(10067099003)(5023799004)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022115727099003)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzhQL0pFazhVNVRQTkoyRkg5aDNSQm9hQ1I4Sm90b2oxb3ZwaFQyN0MrbXRZ?=
 =?utf-8?B?dXYzUUJsTXpZODcvMDJxM3N4c2dlUDArbHREcFFqMVhXdU92YWZSNU9tRGE1?=
 =?utf-8?B?a1gvLzA0NTBxZ3FnZEUvZlBDWjlnbktKcStpVlYyeHlhVEV3Kzhkd2FvWEJp?=
 =?utf-8?B?TjZkVyt6a2hmeFppNzM0MURVRERMMG9HbjdCZC9OM3RhVjhaOEZSamtnZ2Fr?=
 =?utf-8?B?eVhqVS9BN1poMFA1WjcvQm1ac1Z0RjlJV2FpbzYyTVprZUlmb2tzbmFJb3BN?=
 =?utf-8?B?MkNEN0lwU3JuaDFHOFlObk9xaXZyZzhWb1g1cE0vRWJxU2dURHRTOVJIM1ZU?=
 =?utf-8?B?Kzh1U08zRnpTSTl5aDY5VFdOQXREMnZyUmljM0NoUDFONWRiYnBCMGY2QnIr?=
 =?utf-8?B?eVpvS0lEdDdhQnZjUHpoNmdBbzJFTkhFemtCMEpsNjhETUQ5aS9jL2FWdGFz?=
 =?utf-8?B?VlVVOXc5NjVzTGpRVGIrbDQ5OEt6MnUwVXFOSytVdGZGdEptL3BQeHFpUTZJ?=
 =?utf-8?B?bVlJT3pLYXdLWUtYdFdyanVJV2loWDRBQ2pTa2RNWlU0c2ZuWWdESFFUSG0z?=
 =?utf-8?B?V201cWNFdC9zdjBlblF6cGt2NnUrYlYzL1VUUWZxdnpUTlBXNGpxaEs1MEIw?=
 =?utf-8?B?NE1UZFc5VWwyZS85ZnpSVlNrRGhIRGtxYzZlWS9MOXVKNDdLaWtBWTNWTlli?=
 =?utf-8?B?R3QvMGdOZ2tKcUNoZ0ZJOEgwQnZkWDdPZlJoUFUrdHE4NU9sLzVYVzM1UFJl?=
 =?utf-8?B?ai9teVRoQ3d4VkJlZTcrUldSK1I5Qmo4NEVIYmE5aUZDYlJBWFpOdUprbUdW?=
 =?utf-8?B?YWdTMFlJUWFoVXI4dE8rait6eDlnWGRkUG9ZQkp2NTd5ZXgzRjQ3RnlyUXds?=
 =?utf-8?B?TklOaUtoSjEvMDdmTmZKWmkrMmxxYi9NVFBVcVc4K29ITEN5T01lcFkyMDll?=
 =?utf-8?B?VGdzU3BBY3NucHhVM1YxVEdOd050L2FGSWI2MWZRQzFPL3V6akc3NnR5M09C?=
 =?utf-8?B?eUdVbVppMmxmN1UrZ3dxNjREOE1wOE5vbmZiYWZhblRJbWhHMFhrZW5LVDJu?=
 =?utf-8?B?WFliTkdudjN4eUhsSkFMYm0xUU9qQ1JaNHNtN0tFUVVFVSt4VWdxRUVVbms0?=
 =?utf-8?B?UUF2cXFjaEFJNlZtN0s3cy9QMTFqenNDZEVWQkovQXpvQlJ0Qk1kcTRZdDB3?=
 =?utf-8?B?Mmk0My9CU01jazRKb2ViMnhyMDVQckczT0RQU0E4b0tpN3N0TDVlWjcxR1gy?=
 =?utf-8?B?ckVWOXJCOGgvOTNyRXRTOCtmTnN0TG5PUWF1blozQ2dZS3o0S2dUUDhtSlpH?=
 =?utf-8?B?NC8rM09XSzlnTDZ6SlQ3andBc05Bam1uVWdhdTRvb29qalhXRG1XS04vQXJD?=
 =?utf-8?B?VFpEcHZKUk5IaGZGSWl4eHFzL0VEeVY3aWNhVVRMYWZDb2V1RGNQcTFhUUY5?=
 =?utf-8?B?dmZ5UHc0b3dZeTBndXN5ZkVjMmJqOXRtaHRNcUpsWFBwdGo0T29QbWEvc2Nw?=
 =?utf-8?B?R0NGMU16Z3lPS3JsNUZtR0tTd1hLWDIxUVd1eVRqTVAzTXJvZzg2T0xVV0Ri?=
 =?utf-8?B?YkNxYmpxMTc0Zzd1UUdiaVIxL2toN25nTGxLby85czBmdm1iWFJJcVNIVlpW?=
 =?utf-8?B?STFOMlZjd0tmZGQyTWJGL2VyOWVhY1ZCTjZJazVIeVlwRWwvUGlCVGh4alNG?=
 =?utf-8?B?VjZ6REVzeVl6SXlyMXJTTGF4L0JxaHZ3UWUxSVFPNm1MNUdiTEdLSUpscGwy?=
 =?utf-8?B?Mk85Ymw5RVlUUktFQ21tdVQ0TTREWHp0VE82c1Fhenk0cVI4TXIyeWprbjlk?=
 =?utf-8?B?UzBQSlNQbG5Tb2o2TFNFaDFIRWRQVjNVeTk5VVdiTGNaYjVDUzZXbTJDZndR?=
 =?utf-8?B?VFY3Z0x5UmZ6Q0k3YXAyRkFveFFpQzdjL1BKU0w1K3NpQS9DZUJSam5jeXBo?=
 =?utf-8?B?ZmJ1T21hYm9YZkN1WVF0M1dQWEJPbENuWHZjU3NMbkdkbzUxRUQ2WTBKcm15?=
 =?utf-8?B?Z2ZrdUNJZFVQbXk5amlZNUJ1WGx1MThyY2RNZ3VsMGpnK0RrM0JBa21mb2V6?=
 =?utf-8?B?dzlZYnRQUk9OZ1lqdFJPUU4wRmJwOFB1cTI3ZFJPenpsUDAyMkZucTRxYmxp?=
 =?utf-8?B?ZDUxY2QwM1B2dlNKSllUcVdCaWNRUXJuVVFBbzU2NHliSXYzSTl6dTlQK1VY?=
 =?utf-8?B?eVRDTjgzcTk1YWJWSmZMajMrblQzck5zTUdjQTl2aVNhcU4rM3ZZRnkvdmdM?=
 =?utf-8?B?NUFnY0ZiM3dhMXpPaE80ajdNTWIzMmdQZHY5RlUzZ2dkYk84TzBmVm1FODlN?=
 =?utf-8?B?MUZyRUJQUDZGQ1hUUmgwWE5iSUdXVWdaa0RQb1NIWVRLTFdkMDNnZXdkKzNV?=
 =?utf-8?Q?TZ6FzWyrxUiU6YJc=3D?=
X-Exchange-RoutingPolicyChecked: OxV4r5HkBA3WZVGV+L5/fDl7Ff/xLjz9lWoXl/eIO0ClzMW+H5WMaYm4DPbCrXHINuJPzmn9qwJ2mXam3wZ2qkMsYQ6UnN5B1qrcIU+oP5xUquJ1VDjPnVuxPaeXYyF95rIbNCJpxuXV66zKuTV8GqPq4Wh83S2qDU8tZKn73aYp5RmWk7IE/dkR1q2tiQZkMqS36qeWfHJWg12+LPHZSYxP2s/MOc3neAVdMe042sDloCQuhx2xjctRWsy7RFS3J+h5W7ZzPDdqsyD1CUYlNWvFfT4/76AoJavWhUSQHaeRImq5yb6vZBYTu0HOMsVwD8r1w30T2DlcMtl+Yf7mkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42116489-bdb6-48ec-18c4-08df474b5133
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 21:14:52.2846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9OELwi0mYn+Mfka4g8nLPoyxDj5Tp76e7ds1fSpteWGC9NgkJp9HbcrpN23gcaialzGa5PgTubamTj+dc7RZxemQS2Mv9O2tmRSOn5tDls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8676
X-OriginatorOrg: intel.com

Hi Shuah,

Could you please consider this patch for inclusion?

Thank you very much.

Reinette

On 11/15/26 12:12 AM, Richard Cheng wrote:
> aarch64 has no vendor_id in /proc/cpuinfo, so detect_vendor() returns 0
> and arch_supports_noncont_cat() falls through to "return false".
> L3_NONCONT_CAT therefore spuriously fails on every ARM MPAM platform.
> 
> Define ARCH_ARM, short-circuit detect_vendor() to it on aarch64, and
> add it to the AMD/Hygon always-supports early-out in
> arch_supports_noncont_cat().
> 
> aarch64 has many implementers (ARM 0x41, NVIDIA 0x43, etc.), but MPAM
> mandates non-contiguous CPBM uniformly, so per-implementer handling is
> not needed here.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c    |  9 ++++++--
>  tools/testing/selftests/resctrl/resctrl.h     |  1 +
>  .../testing/selftests/resctrl/resctrl_tests.c | 21 +++++++++++++++++++
>  3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index 0a417267dd74..7501ecef52f9 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -271,8 +271,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
>  {
>  	unsigned int vendor_id = get_vendor();
>  
> -	/* AMD and Hygon always support non-contiguous CBM. */
> -	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
> +	/*
> +	 * AMD and Hygon always support non-contiguous CBM. ARM/MPAM defines
> +	 * MPAMCFG_CPBM as a bitmap with no contiguity constraint per ARM
> +	 * IHI0099.
> +	 */
> +	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON ||
> +	    vendor_id == ARCH_ARM)
>  		return true;
>  
>  #if defined(__i386__) || defined(__x86_64__) /* arch */
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index a7556cdae0de..03b4500c1f7f 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -41,6 +41,7 @@
>  #define ARCH_INTEL	BIT(0)
>  #define ARCH_AMD	BIT(1)
>  #define ARCH_HYGON	BIT(2)
> +#define ARCH_ARM	BIT(3)
>  
>  #define END_OF_TESTS	1
>  
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> index dbcd5eea9fbc..02894ea79bba 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -23,6 +23,15 @@ static struct resctrl_test *resctrl_tests[] = {
>  	&l2_noncont_cat_test,
>  };
>  
> +static bool detect_aarch64(void)
> +{
> +#if defined(__aarch64__)
> +	return true;
> +#else
> +	return false;
> +#endif
> +}
> +
>  static unsigned int detect_vendor(void)
>  {
>  	static unsigned int vendor_id;
> @@ -34,6 +43,18 @@ static unsigned int detect_vendor(void)
>  	if (initialized)
>  		return vendor_id;
>  
> +	if (detect_aarch64()) {
> +		/*
> +		 * aarch64 has no userspace vendor_id in /proc/cpuinfo.
> +		 * MPAM-capable ARM implementations follow ARM IHI0099;
> +		 * treat all aarch64 builds as a single vendor for the
> +		 * purposes of resctrl selftests.
> +		 */
> +		vendor_id = ARCH_ARM;
> +		initialized = true;
> +		return vendor_id;
> +	}
> +
>  	inf = fopen("/proc/cpuinfo", "r");
>  	if (!inf) {
>  		vendor_id = 0;
> 
> base-commit: 30af56a227e27b892d34bc44c23298b5274913e3


Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793212914;
	b=PodaRPy/zgtybPQ1Pi/weDPHr9Tz/gjCMRu6UoQiLC+s/ZbLU3mbl18MunoXX9r2DFEQ
	 TNNWhzvs7KV9O+Au+DXB7Zk5GZE/gQs1q7HFsJIFXQZGlPEOA4snU5NND4K1ICXF3N7T2
	 6jWGjEeGvcw8lYYx+jdRXTgzrTE+mclydW185Q9tj+7Nv0TtXbWalYS1PgDRbSC6G11Pz
	 oXFihOjAsk88eWiX/Y/+ZXDTn4Ah86PWLzuOPSAa+zhvbqtN4kJftCEX8KX41vyVUlHRt
	 BCzL5qmp+JJLtAoKG+BTbv0tvW5EeLbzUeLqJQWWzMaDh2akn1TrgoRQb6GZlBRPbNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212914;
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
	bh=pZjSdxglP8K/HTprQmoijCfoHC8s7E6h9Pki9teqbBY=;
	b=L6QS+hfV6dI6iwN6+f9xhp3TT4jeSyiufiYQiyDqkkrmLmQsdGLs0zX2AQQMJ49AjtW3
	 BWuKxiP+xV4Hs3JBVkmEQcMMQMtAI2E2mctJjcuSyXnoNVUqIZv2bVZk4ZaUQC3YJPbNV
	 L+iLIeyur+iVfYX34pKOXILzHM2DLpV7a/TvHP7Zn+MANALId2rc2gKpGV6oqaChwiOsq
	 Ph1nHe6likApApE22TSpoXFnAnh5rGzx2f826zge/maLj8EJN7ouSYNnMsMOuCZAponXf
	 x7vCFmqu8+olgyF+jHCL4RU128pKeBjWYL1XIyDiA1+9WrZoUKaQUrrrU8HVg28Uf2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YHeRZZEj;
	arc=fail smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297AB60A2600;
	Wed, 28 Oct 2026 18:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 297AB60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YHeRZZEj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793212913; x=1824748913;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2TiVUkAScpyaMm1d+hQ15etWkXLe+mOPiNnoNgKT6Qg=;
  b=YHeRZZEjvDAgWJrWvTomAQUjpUa2gYzeyDaoQc6QGz9v+Wzf42LZBJdS
   lbilKuwAIsvadqx6io1lM0D+Bxq1bSFRT+TKCIdGcVjX3+nMLYENG9swR
   NSjHhXs6BzYyeQKVeFXDmcVBHby9x7RIwHUab6kjr7g6sB+hc3GCOiBeg
   lNkzU1hcs5FkTFETOsFSCAKWVz/trKek3tLo6Rj/bQ8/tmE7B0w9LdcZK
   ofQmZwIle2NrQMMC2NTdmIHhaNvsjzys5IhJ/iGCsKUIi2xIWj2Xjs/+r
   Ykx//eKlcPKuRGvyKkev8giiCOkmQIdJiG7GTAFfeiiJeFCFf7wEwSkW0
   Q==;
X-CSE-ConnectionGUID: pPRkIgyeR8Okxd27IajWiw==
X-CSE-MsgGUID: lTBf/q/UTHKYE37RrRttlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1839617"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1839617"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:41:52 -0700
X-CSE-ConnectionGUID: v0YgX3PYREu3m6owTYJ4HA==
X-CSE-MsgGUID: s3BQMOQIRiGuZnj5pO4C6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4905781"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:41:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 11:41:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 11:41:52 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 11:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcttaHoYZ6Vrm/b7bXCmDHdLaoUipmyqb5Sj024V8+ixC3iL6rr0SjwwQ9XlQTMFlts8m+AQIflPMSqVf7uSZMnXWXJwu/Kqm4f0a4I9MfAabH/ai/4agajA6PgfGxNYH78ybDch//7JLXop50WzqeLnqPBH8I0Re4Jo1/ZzuuapqzEZjOgDKYCTzfTB7YfaB1277TOeZSJRgX4gaiAiAYHBE5rnE2eL2UgE5pCQbIc/qsuHAOlttQFAcIrU+QA0KHia/uFa3LA6L8emBh4nEDtv0VpWSz33UOSm9KnOZNZyLrjNIzOaCD1gBkMDIY2HM8EyJXFNpNAOC9lQtSwjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZjSdxglP8K/HTprQmoijCfoHC8s7E6h9Pki9teqbBY=;
 b=Gra0l0g0AGWZnZsS+PzN+nKXWhEDPw7ss3DZDF8eHrJ3i762XPKpv/+eZSh/Njydm3R+uE1jal9N6n0DY0tmZan5nRREQkMOkRqxCHws9ssj6wkMk1VqOtcfMDh2ADsflc5QbUtxZk156U4SMPTkM0zCtHKI2ok7xRhPya3ZegF5yKfTeDSxde7DlPemKtbEA60Ht+5mTCzE7y4TdWuuT7PxDeMa0T+LlprGiS8aBRChYvw33WVQqF8LFhA4Y7Tmyk+o3+mW2t3OyKMNqGSxRUzHn/eldrcm9aq7jbyOAYPAzaJP53emBX5ue7OlhJWV5G6mNtmH9dFKMEApCItZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS6PR11MB710370.namprd11.prod.outlook.com (2603:10b6:8:468::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 18:41:47 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Wed, 28 Oct 2026
 18:41:47 +0000
Message-ID: <c57f0d76-8fa7-443c-8ba4-2a18eb0ba7fc@intel.com>
Date: Wed, 28 Oct 2026 11:41:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] selftests/resctrl: Add support for MBM and MBA
 tests on AMD
To: Swapnil Sapkal <swapnil.sapkal@amd.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-4-swapnil.sapkal@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261022132517.46805-4-swapnil.sapkal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:303:b9::16) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS6PR11MB710370:EE_
X-MS-Office365-Filtering-Correlation-Id: 207cc7f6-9a5f-4cf1-4c1e-08df35231f43
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|11063799006|4143699003|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: HNsc0dYjSbQZkNtI/FEHh8YD0/9vo1Jm6+9auchZtFMfcCtBzkiqQLUktDFzPFMAb32Vt4kq5wY7LBMEH+z1upABPPJOYAPXGfFCxrhGWPZWWwYGvyLCK5OhGArYz8vdG1mPN2SpZ2kTY9wpizgEizAsuq+j8HFF00wtjHucTRrq9o57mYmRAaM3XSzKFm8W6c0DrSQQQxyr90PIMBq8WpmWQzHmN0Fp0MHq8Ug+7VANtALu0H0L3v3A2iIa0tLD0V2hzK0hhvUzJe2u4987wVAw+M5nvpKEhYuuOKfHWfYJJpPWK8GyDJvXrjLOhlCOijLCaybY/X+UGkMNV0iRw71+aoGTXHmuURP/seLZ/GTWY7iW3Srufl97aoVihRiNnW/uHsvPDiGI9BX/Fyyv4wa/gjxR5iZi4V2NkbfExbPJ/sHLT77lFDTXLb+jZDhw162opvs9iOe9llOZUDFbFbanDoXIKLfUrxbaa2PKmMW7YjPKcOO5OtUA6ZvUbv6t7WXaVpeL+Bdq1YbAIL7J/xWhCs9s139QdNGyFVIBytp7H3u/qHfjJDmB+pyCRPw2Ota/VyLewrORE/+2yZTc3W8Z/3XQxlT5XntpNYd3+l9PEayxggRd2KK7K6NC7tcyV8NVcOXxNo59BtHSzYHh/apW6I+kDG5Lai3kGJ4cc2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SitscFkzU1hveGpoWm1ybGx4MWhaWGdvNzRPa2QweEZaT3p1WGZ3YUwwNkdK?=
 =?utf-8?B?RHJ4VjRCRzRweTZYSGQ4cVdoTVJHanBDVk1nUEllcXVNZW1CRWJaa3FXbnBB?=
 =?utf-8?B?bTRhK1NxUDJHMTAxdHBKc2FjZUdlWW9ucitLSlliRUF2d2tWbEVuVGo2NWsz?=
 =?utf-8?B?OC9wbGxnTU4vcjlWNk1KN2xES0U2Z2hKZWkzaWVVVTZRaTcxWk1MUHJ5Rmtm?=
 =?utf-8?B?dHNQVlNiWEd0NWQwS3l4UWxHYXUzS0k1dmRtbWxxb2wrZFBVYzlZemU2ZXhY?=
 =?utf-8?B?bzNaTWVvSDJWRTVDZ3pmWTljU1FaWjd5NWd5ZnQwKytENlRadVN4VTU3TGFH?=
 =?utf-8?B?aklWV01wMnVUa0llSmtCSHpGOU4vTTViS2V3akkxckE4bEtxUy9hT3pIbFB4?=
 =?utf-8?B?dVdxdW1aOFpvUloxZVBjOEwxOW4yNjdlQkc4eUFUT013RUl5blpFV1NzOGx6?=
 =?utf-8?B?OTBoU0xvNnNRdXBaSEdDVTlIUEVnUTN4c3FEdW9sTTMyaVZuL1ZsdjZOdVVJ?=
 =?utf-8?B?N3ZxaWcrdERkays0MllmYmpHMEJTaE1OblZBSk0rWFRiSUY1VDIzU3JOWFRI?=
 =?utf-8?B?RG9FUUtEWTBLY2VuREo1d1BvSWdIa1lkb09PNlFsRXRXeXl5STJlelpIdXVB?=
 =?utf-8?B?ZEFtNC84RFJ0MEsraFpwU2o1MjBYNHJvcVZKZVlNdHA4T3grSVMvZmZJdHM3?=
 =?utf-8?B?SS9wU3FxNUY4aTRMRnRqSjNrYitkSXB0TWpsclVEYTFiSnB1dUp0M3EyRUY1?=
 =?utf-8?B?ZW55bFJ5SzVZbUNHMHU0dUc4MGNqYnl6UVdWcjZ1dkloRXdubDRVWFVyM1hZ?=
 =?utf-8?B?RVZqTjBxRmNuZ1Z3dlh0REM0WG14T3R3dzROc1dHVHptNkdlazNHYmgxaFFx?=
 =?utf-8?B?Y1JVUWMraitsR1kybnFKMWJjUTJremVFVklDYUtuWVlYZzJDUkJOR0NMOCtV?=
 =?utf-8?B?UUxPNUJGcTlUZ0M3UlkyNXp4MUhoL0dhLzdiNW1tL01TU29OVDR2aXJIb0M5?=
 =?utf-8?B?R09CMklMckVPOFNHSllBb044OVRQdVlWM0RBTks2NXlNbmdvRmZwZ0ROWVJ1?=
 =?utf-8?B?ZldyVXg4TjRFRjNXRXFKb01IbU5VUTcyNklKVkZEY1FQSzNYeDVyWGRKMzV3?=
 =?utf-8?B?V2k3Q3R3dVZ2cW1IemNVekVOMUZQVTBqb3ZuQ3pqYk9EWUNoSEw4ZVRzeDI0?=
 =?utf-8?B?Ty93anVaMVQzVDdTbDJHY0dOR0lXb3lXTjAyeWlGbEMvbVRiQ1FjV1dzaGVo?=
 =?utf-8?B?QWg1b3FxczlTZHEvTFl5TGR1cW9ZTVpUR1JwcERkL3NqV0E1Yy9NYjVHd092?=
 =?utf-8?B?S200S1gyQWRScmVCQnhzWXVvRldFWXJZMU1uWlZGMWVsVnJndGdkbG45dThL?=
 =?utf-8?B?UzhuTUo4UkxGcnJoeDN5bGhHajA0azlJazdOWFFxR2ovMFhDM2tFMVFycU5K?=
 =?utf-8?B?RG5MY3I4UlpXdTJtRjRRNVhHN2lES3FyNVNUbDJGWTRaLzJwVDhMZ25ZU0JX?=
 =?utf-8?B?NWNyb21BNE8zQUw5cFEzREtnbkltbUhPYjRySFBBOHJpdkxDRFNSNC8wSjlP?=
 =?utf-8?B?dmczdEE1RFRpZnhuUVJtYVdmbGhtR1pheloyK3ZOQW1VTkxTTVlxRDVIWDVT?=
 =?utf-8?B?bU9XSmVGdFdTdWtqRmlsbVdRTDRkaktFcWNhUkdMckduVVpEajVOVHF6NDdZ?=
 =?utf-8?B?RmZQRXFxVW1qRjkxUmphRmQ4NVpwSlY4bHFhU3lSeUdQdjJOZjArRzc3Uzd1?=
 =?utf-8?B?ekQrb3hCYmVrcUxnZ1BmZjhUa2pweXBaczZOSjNBaU5BSnhRcFkyNGx6RjJQ?=
 =?utf-8?B?a1E0UmJJUUFDRWNiUzBPaWp4aU5TM2dMQ3FBVlRUc0dFWmZGcythRmJSY2Nj?=
 =?utf-8?B?NDhMclBMaGtNTW5xS3M3OWxVQ1JEZzlVRGVJbnlSK0NURlFkYlllTitreFln?=
 =?utf-8?B?eEwvRWpudjk4eWgzRHFsRHd0UGdZQ3FwS2JUaUFHTytqdjBMNnFFdXBLcVJV?=
 =?utf-8?B?SXg5WG5aWU9Ca0gwY3NLdkk3RFZnY21HVXRzTkJUNXJCMXVVQlAya1BkUTZa?=
 =?utf-8?B?WStIclV3aWR3Z3QrTHpXbnUrNzh2OWg4bGNYZVMvZ3pwVEhSN2Jtc2pvRlZG?=
 =?utf-8?B?T2h5THA1bXNPbU9BT0RENVQ2MTR3bGFRTWNKM2RyOTVJQlpxYjBXSUtDTkth?=
 =?utf-8?B?WDJnemhZWU81Z3ROMnRlOXRGZi91WjQyaTUzdGNlT3ZlV3BsQjVidDg0RjFq?=
 =?utf-8?B?Ni8vMDhwMmJVS1UzcE5KNm80Z0dFb1dtYnBGWDQ1RTF5cVVyOUFURnNnOWhm?=
 =?utf-8?B?U2xiQkwwamRnVzRuYnBHTXo5MnBUSXVJNVgyWnhkckhEVERZZ2o4QVc2b3Jv?=
 =?utf-8?Q?hRPkKtScD0kp77Dk=3D?=
X-Exchange-RoutingPolicyChecked: djHlMsDUttd7SvljikDB5wVkp4oAZi79dkgVfFHP173zdOEMQ1L/9Z0ou6guxxgqwr4LVgoM2r9Nah79gMCR51YEkXszGw+kfb8RrxwMgmtLnqcG1jEqxz2mTn666y6hLAXZjBqMWAjyTTl3DG2UqEVv2fmDNSdZ1h54DbM6HJg7d1O8+kdp0lF6G9DheWLfSEuz3+89naSj405SwGpsqIPhul3slH6/9PWkGcvvxwX61pzm2quVSK84GQXNFyBbQVLKFAxhAObmroHItYv6Liit2l9hww9GeexpCAt81TwjNAs7IGDnWj/ShArafKz8yH04K88M2tKoiEyow7j3FQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 207cc7f6-9a5f-4cf1-4c1e-08df35231f43
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:41:47.5611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTEg5b36F6Xq9prB8CzvVtC5zelglr6B5FtBJJweSj+OMqgnv5VTBL7zvUf8Iq0WqVn2ISwUtwbaqwOKs5TCyPMv02EpyTgZx679I4vubP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB710370
X-OriginatorOrg: intel.com

Hi Swapnil,


> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
> index fdbbe2155cea..38cf58c41be1 100644
> --- a/tools/testing/selftests/resctrl/resctrl_val.c
> +++ b/tools/testing/selftests/resctrl/resctrl_val.c


> @@ -233,6 +277,7 @@ static int read_from_mc_dir(char *mc_dir)
>   */
>  static int enumerate_mcs(void)
>  {
> +	int (*read_mc_dir)(char *mc_dir);

Could this be named read_from_mc_dir to avoid the unnecessary churn?

>  	char mc_dir[512], *temp;
>  	struct dirent *ep;
>  	char *sysfs_name;
> @@ -241,6 +286,10 @@ static int enumerate_mcs(void)
>  
>  	if (get_vendor() == ARCH_INTEL) {
>  		sysfs_name = UNCORE_IMC;
> +		read_mc_dir = read_from_intel_mc_dir;
> +	} else if (get_vendor() == ARCH_AMD) {
> +		sysfs_name = AMD_UMC;
> +		read_mc_dir = read_from_amd_mc_dir;
>  	} else {
>  		ksft_print_msg("Unsupported vendor\n");
>  		return -1;

...

  		}
> @@ -335,15 +387,40 @@ static void perf_close_mc_read_mem_bw(void)
>  static int perf_open_mc_read_mem_bw(int cpu_no)
>  {
>  	struct mc_counter_config *mc_counter;
> -	int ret;
> +	int ret, opened = 0;
>  
>  	list_for_each_entry(mc_counter, &mc_counters_list, entry)
>  		mc_counter->fd = -1;
>  
>  	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
>  		ret = open_perf_read_event(cpu_no, mc_counter);
> -		if (ret)
> -			goto close_fds;
> +		if (!ret) {
> +			opened++;
> +			continue;
> +		}
> +
> +		/*
> +		 * On AMD each memory controller (UMC) has its own PMU that is
> +		 * tied to a specific NUMA node, unlike Intel where opening an
> +		 * iMC event on the benchmark CPU always resolves to the local
> +		 * memory controllers. A UMC PMU can only be opened from a CPU
> +		 * that belongs to the same node and returns -ENODEV otherwise.
> +		 * The benchmark runs on a single CPU, so skip the UMCs that
> +		 * belong to remote nodes and measure only the memory
> +		 * controllers local to the benchmark. This matches what
> +		 * mbm_local_bytes accounts for on the resctrl side.
> +		 */
> +		if (ret == -ENODEV && get_vendor() == ARCH_AMD)
> +			continue;
> +
> +		ksft_print_msg("Error opening memory bandwidth performance counter: %s\n",
> +			       strerror(-ret));
> +		goto close_fds;
> +	}
> +
> +	if (!opened) {
> +		ksft_print_msg("Could not open any memory controller counters\n");
> +		goto close_fds;
>  	}

As the comment above highlights, the test runs on a single CPU. It is thus not
possible for the test to change which MC it needs to obtain data from. 
perf_open_mc_read_mem_bw() is called several times during the test run and
repeated attempts at accessing MC that are known to fail is unnecessary. 
Considering that -ENODEV can be relied on to indicate that the MC is not
valid for the test run, could it instead be used to drop that MC from
mc_counters_list? This will avoid the subsequent unnecessary attempts at
accessing these MC and also simplify the users that walk mc_counters_list
during the test run since they can continue to rely on all MC being valid
without needing to keep checking if the fd is valid.

I suggest switching the list_for_each_entry() to list_for_each_entry_safe()
and drop the MC's from the list on ENODEV. This also eliminates the need for the
"opened" tracking that can be replaced with a list_empty(&mc_counters_list).

>  
>  	return 0;
> @@ -363,14 +440,20 @@ static void do_mc_read_mem_bw_test(void)
>  {
>  	struct mc_counter_config *mc_counter;
>  
> -	list_for_each_entry(mc_counter, &mc_counters_list, entry)
> +	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
> +		if (mc_counter->fd == -1)
> +			continue;
>  		read_mem_bw_ioctl_perf_event_ioc_reset_enable(mc_counter);
> +	}
>  
>  	sleep(1);
>  
>  	/* Stop counters after a second to get results. */
> -	list_for_each_entry(mc_counter, &mc_counters_list, entry)
> +	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
> +		if (mc_counter->fd == -1)
> +			continue;
>  		read_mem_bw_ioctl_perf_event_ioc_disable(mc_counter);
> +	}
>  }
>  
>  /*
> @@ -395,6 +478,10 @@ static int get_read_mem_bw_mc(float *bw_mc)
>  	list_for_each_entry(r, &mc_counters_list, entry) {
>  		struct membw_read_format measurement;
>  
> +		/* Skip memory controllers that were not opened (remote node). */
> +		if (r->fd == -1)
> +			continue;
> +
>  		if (read(r->fd, &measurement, sizeof(measurement)) == -1) {
>  			ksft_perror("Couldn't get read bandwidth through MC");
>  			return -1;

With unusable MC dropped from mc_counters_list all the above fd checks are
unnecessary.

Reinette

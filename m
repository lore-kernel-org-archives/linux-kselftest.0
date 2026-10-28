Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793213143;
	b=dBMtav9KwufEnHpQEj86xGk/mEB5BOB+82CsttzlCpRRKaUMDehhpFzKCr6DQGlxFAi3
	 eUEXtqL/sAHeivcYw4z6F5uzhV9toJehdB0u2yrZs6VlXdbIioNlTR+NIcErOj7t3NHl/
	 SXcMTlYyFae745baLspf1g8jZkDlch7TbqD8uyFQyY74RpVM6G09DJs1rSTN2/lyj+hzU
	 oT2+5OKGKiYbF90xlfLwQqGBXQZrW7hhU5OHEZ6uK9rZfPw6Ucnvw0T3F9aUzDg3GhZ/8
	 S0tiwnzqWHrBFugOFhKCRax4h26+da8CT7YWZfx0xfxuLSOcpaOOJ1Ax/TDcbh4/1FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213143;
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
	bh=r75iEfhF5UObPyxuTAtfB25YrHBaQVtRCE4NfbE72BM=;
	b=eHAhraWHw6pnrGxCa0Wixb8n6lnBQ5AeMhl8U3eUaQNIMxubzKHDL5zjoQSsPnsKRibh
	 YVAVOSM1CozoWhUls+c8oNgssJhzzlfm1apsBw5RlALl87BtW78ZZO13qszKLC6SPeshR
	 dpQfnL2y5U2hzIPJomJZI50Q2ZpNymOiho6u2aIYWFiVzOIThNnx9v1JYwUYs/RwA5bVD
	 KYn0ZfOJLD1ssnaTNiIuSeWFi1RsC5B6Lh6XKb4J66Xyf8eXTvNyy68TnBhDeGWlwykRx
	 eSCWfqgmPnKh8/XMo54qdLTfSNoX3rUHuLuAwCYW+5Evfrz8yu+1MnUrdTniKEP63aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AoPuZswC;
	arc=fail smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F2A606A31A;
	Wed, 28 Oct 2026 18:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F2A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AoPuZswC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793213142; x=1824749142;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q54PJ+vlv3LL8jPnvRyf8xkadbVYbHrO6Y9a2AktS00=;
  b=AoPuZswCNqRIQLg05W4+WLgAQ3qc0NX/MG05y2VcyYlXJUvcswMXcenT
   n9z0Q4KcLrrBI3/4dZFP3bz5/lCU4c2qe0GYPlpXxWyBhJDhrqVI5hV9F
   KBiuWVS1y6rMhKs6EwzYmCVIjOB7L53PQDJi0qYLX5/8IN3EXhqrvSHcU
   +pyqM460JQmt+GzFoGurnqe8rpDXP5gpjnu8SbG7z9+zVbG+PoGyvTVlH
   fuzgEqnkm/Jnft5udDJo2QRlQPjYe3ktMVYxdBKaKIO0PCDEoF/Xfvg4u
   VIPmmX8l8n0hybkfC0Han6l5GiQ9XcQ/TY6ducbFTCXLzW5E3bl73KvCS
   g==;
X-CSE-ConnectionGUID: O/VfPg1JRdaD400MSxXMSQ==
X-CSE-MsgGUID: iQ/azibkQuSmnUx6xUv/hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1827980"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1827980"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:45:28 -0700
X-CSE-ConnectionGUID: N//QE9YsShODAFto/aUcLQ==
X-CSE-MsgGUID: vqVtI9a+TeiLfqDwd1yPYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5025381"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:45:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 11:45:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 11:45:27 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.45)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 11:45:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeA2fZbkemqjmzlvp3xCiOllkqqPzrtaEoMIKsNDqlYHKlK34om+U7PN+7EZ8HDtZB/W9X/ifho7Egd4Rr/p1MgUt9oae1vsvdR3gbAzzp2ee3alyTwxh0l2xXF0dTkmauRhgSrjGjT88lZYQl/ehfPoIpZzhNyHccp1S2o/l7WXa+AP3rsMdviejvZLb5PqKgYRd5MrnEYnDgBb1ahS0a/Y5wxhxtr1aoed5nqRYXT9qLAlC6B2CSsrzQLNhwKzPaswxoWZPzTzRTttaAjFswbQI8oTGXxavas+RP90hgykh5BDqr45E+f/uAZHmEGDiI16SI9s2FxhlzuDExhS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r75iEfhF5UObPyxuTAtfB25YrHBaQVtRCE4NfbE72BM=;
 b=bRBCkJvh4dOGqEOS4aHYIFFebSG9UnJLvCtKMBNUinvkFek1pvzaLntQhpj/zcFtFfJKT7MXGyMr3GEW5O9H7HoXKZeOFriFivscdU98veDEZDL+It24bAi9YBLLjzFAgNCJF2VWAlS7DUwFR0x4pV4acsQKVmp4l0n5SS3Oo9sOlD75wJaGZpYsLFCgfaKOGGbO0fjNYucHIM8iksyeHefFoqF6nOj5VAJ0C8Q8O75DgYKuLfzYmPghyx0DEGr4+3fpeGZpB9sdxCUArmI53cvxDSS/FIgleIsF22jrqo0SL4LAe5Z5bJXIsHC48yTDeATrkJxLYJ81U+HnjJEhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Wed, 28 Oct
 2026 18:45:17 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Wed, 28 Oct 2026
 18:45:17 +0000
Message-ID: <b250f681-5726-403c-86af-cb4bc35b9d1d@intel.com>
Date: Wed, 28 Oct 2026 11:45:15 -0700
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
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261022132517.46805-5-swapnil.sapkal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 647e721c-5848-45e5-6a76-08df35239c17
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|261026140227099003|261028144727099003|261021121427099003|56012099006|11063799006|4143699003|261022075727099003|261022105027099003|261009223027099003|261022113327099003|261026121527099003|22082099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: ih1mBt/Yyp62hidETS/Srnn8y3+m5D3zv5YWH088apHXui7qK0PGwvU0ZnPIHW2QAApItTzQeYdKxJ9vBykO0TMYbHfgVra2H9X8sKxoH/PIDa2vuXdqgLp/tJDnUQyfcm9TMXnaj5qWo/jSecYiQpUFEHoXT+Fm3r0jlFzUgEnEiyySiY23Ds0JyHZhF7f7fLsLAl18YOeFX7cAa1nPKp2PBUPe7BghJsL0EQE2w4rm18a4hugxDW2fbOoDR988H3r5mnCTvR2mU7w/tPg4qr6hCRt87qXMZ6DOAIRlgdMJaVR2BK6z6gnwvFOPMh2tmmM1yWIxz0UrLg1CT9XfIApCLO5xHQgW7QbjQST6GdUYtwYZClJJKjbDyEYDChDmjS4SBxkAMww6nnyCC2LWVqkq9bGWInk3GFsgpAqWr8fJGpuLBvfde794BhuCRf+NYhctKv+cRFIzoLvZWYyGEMewJ/25vnIub1TbC4sQNlA5jSWhmVxdzZMZ5PpYUmZjL1/jMZIC9WubdcNd701ukZ/tkghOmr3HIgBwJ+IbR37W0d6rvvUNDAu1QX2DSWib8N29V7DhTtgPyF+vBYK/sewIPZUfrlK+Gu4mBUiL19Jz+2bH1poE/xy4hO0gdwd3bo0sYKnTasXKwPegCImRVYcnJuRZxZzCCiQOj5mCnKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(261026140227099003)(261028144727099003)(261021121427099003)(56012099006)(11063799006)(4143699003)(261022075727099003)(261022105027099003)(261009223027099003)(261022113327099003)(261026121527099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejZnMEpSSVRyZEVrdUdKN2hOb2lTTW9PNEwzOURiWmtrdUtiLzZxZkN5N1ZR?=
 =?utf-8?B?ZzJhU2lsMnVudXBmTGFDLy9CUHBCM3VCSkN0eWdWWE8wVXlOYXlLaVc1U1FX?=
 =?utf-8?B?UE0xaWJNOVF4ZE5UcEg5WjdsdVBMNEE0QWUxNFQzWmM1TE5TTGVkbU1CZHpy?=
 =?utf-8?B?Yy9mWHZwK2h4NmtyYldNbm9ubm40bGdZaVF4d09KN0sxeE1uQklsbGVZYjRX?=
 =?utf-8?B?NkFzVFlwVW01MHhMMXVjbStCTERXTnJ5aTlLRk1nb2xvVGN5eHJsUlRWMnZn?=
 =?utf-8?B?V29MWkF2Y2JrVVFYTWxDcFRaSnAxTnNZOXFqUEhRN2l2aXFVUnhJVE1vcHZa?=
 =?utf-8?B?RDAwbjFwSW5qVHZBazRKYkZLbXB0R0xidVNWM3RrZUdxZjRSSVl1R0I0dUox?=
 =?utf-8?B?MmFyU2ZLTVBlUzVMYkZZUS9tSWhzdEZVUUtnOUczeWQxV25aZXZQcTNMMXJr?=
 =?utf-8?B?LzBWSkVwWlV4dHd1VjJBUEVrTjIzMkhxWlFzM0xwRG10V0c0dWY1RnBoZFdu?=
 =?utf-8?B?TkhVaXNXMXIvc05MaTE5NERJU3N6SFVlNFFOL1AwWGdwdURISE5hcGpTdXlZ?=
 =?utf-8?B?SWZSL0N3WnFzNDltYTFCbnlRT254SEVZaEFPeWJmZUgrRWVFSzNMdFo0OGdL?=
 =?utf-8?B?OXo2dy9oTmdBY1ZnOU1qSkJzSncxS05IeUdYV1craEpjTWcvdURDMEZCVGR4?=
 =?utf-8?B?Qm9La3NOaVJkSWlQbVJvRG1aNE5HSE40WGpZaVVTamM4czhvRWZmWWZxVlp0?=
 =?utf-8?B?RUtGUU9WMzNNVU5LZ1YvK0MreDBDYmovRXpzY0RRZTFsV2k4UWJud0xORzVD?=
 =?utf-8?B?Y0VORDVlUWU3MlN1b2hpMDVuWEpzbFFNaXdDV0Y0Qk5BUXhkUWhNZVo2MzFt?=
 =?utf-8?B?U25FYnovaFlzbzAwcXYreUFSTDNJaUlqYWhTZ1lMTDBpc2hqblAyQkpFcVRP?=
 =?utf-8?B?dHB6L0NuQTBtVjZUR1JieS9jM2UwU2xodVVjWmU1RmVpT0RrK28xM0tIU25T?=
 =?utf-8?B?c3RkT3hHbi8wbWdaRkJVbEgwRVBRY0NLQlFTbkl4TnQ5ZmF5MGhSOHhOK1Rz?=
 =?utf-8?B?VUJ3VVZsaWo5dVpVQWtZMG1DNHYvUWlaT1pmdXVsMmRWek0xQ2VsRFhlVzY3?=
 =?utf-8?B?RzZzZng5aXd3TVdTN3d4SGRGWG9zTGd2Y2paMlkxK2lCa0dWNzM4VGpMaFRp?=
 =?utf-8?B?WElnMjgvUGs0dEdPcGY2OWpMdkhYcmlGT3l5UDNMSlRBRHM2Um1QcmhUbHh6?=
 =?utf-8?B?Q0wvdDh6Tm1DcjFCSmp4K0xQZmlvcFFzSWRtWmhRQzBSOUpRWXN1VHpGMG95?=
 =?utf-8?B?Sy81SXRCamk4ckh0WWpIWVdDSkZiYTRkNEFMdU9zNUNIKzcxR3FQaEZJaDlo?=
 =?utf-8?B?UzlZMnYvQ2dXYjc4bHptWFc3QWJzUitETXZPazcyR0pSUzFWenM4R256VFFN?=
 =?utf-8?B?alhNNEVBTHBSNTdOTm1XNU1BcVhVUzRJTzJ4TVIzcS9EM093TkRKdy9Oeitq?=
 =?utf-8?B?d0Fsb29pb0V0YmFXM21RQWNaOVBWTzluMG9ZL3RoOHhrNkcwNEliUHM0OUhL?=
 =?utf-8?B?VUhTbjZNaGFBZXVGT2VTVThueEh3UW55SFBScHhGWGUvNjBtOEtjS3ZibXRN?=
 =?utf-8?B?WXhPcVdBMEZLSnhNRkgyeEdjSmtKQTgxRmxqV0xISnc0ZzFiM1FNcDNFbnNy?=
 =?utf-8?B?T2d6Q002OTFVQ0JEK1EzYzJ0TFZwVHA3VVZSVWV5c0RZekhyQWVsMDNXeXp4?=
 =?utf-8?B?ZVhTWkNEVGtsd2tobS9pTFc3VWFrSkM5b0JyYkN2TGJON3B6Y0lOS1pHUXNk?=
 =?utf-8?B?NGRJaTJneVVhb3l0bG1HeDJPOHNZTW1Cb3VzbzYvTzJ0UjlZZnZZeXc1WkZH?=
 =?utf-8?B?YzZ6L1ppSjhycGlrOVpUdk91UXFDeXNiT0JqcEcwZi9PTVlJNlVRay9IUnh5?=
 =?utf-8?B?VU9GS0N5czZkVEJPM1pzSC9CbEVuTlN3eWxBTXNIMGIwZWZBYjlDQW01NTIx?=
 =?utf-8?B?bHlXRVRRRnZLRitISUxmeG9jOG1kK25yOEN4R3JCVndPcEdud3M4c01pWGpn?=
 =?utf-8?B?M1FJSUFiRXR2eWVIMEdNQ01UeEVkVkNjTE5zVTllQTNKSHdaajc3U3o3VjJE?=
 =?utf-8?B?SjNkWTJXNFFSZmV4K2dyKzhPM3dXblZjMlYzbDFOY2E0R3V4czNQb01WMDhv?=
 =?utf-8?B?S05hVTdYdEdTZDYwYzdpNDZ0Q2JjcmF5NmNDc0sxNHRubG91QzhRUzVWVE4x?=
 =?utf-8?B?N3BYdE1QMjh3cWJGd0pIUFE3RHpkWUwwamdIN2V0N0ZNUHUxUk92eTN1SlBp?=
 =?utf-8?B?Z3hMSEpyUUVCQWJKbGNuNmoyTHhPZG9LOEZjZ1QvMjNNclRGR01iczV5Ryt3?=
 =?utf-8?Q?7x0CdRn+XzN0Ulr8=3D?=
X-Exchange-RoutingPolicyChecked: IrLYfQz6QiigoN//zdrczfJoAOx/xvl4BGsyLf4tQfn6/2JEOShRLKnjANVtCGRKBZG88vBeZx7dL5x8YhEWtSJT2mOqNCgUvGJSRyxjo7ZUAQ3UQIj98sTLaI/ojCUn+HiJN7h9XLNur7Hpda1rP4+WM/PcW7Ms4F3z8C9zoD2Ni9VSXhsTDld3/Qg5LcNHBaB9hsod1JtsAW+UqfodacUHcKg4aZKhP1YnwAelW+qBgy5nQTP0UpT/gEh9ZOdTedbJBYu8NzFGFHVQ8RfxXvHwTv0wdfrjn0FfGJh6/rt7YOJAS+0X5BTAAQb8niZkxk9f0BX6hw+lYHOgbBo7zA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 647e721c-5848-45e5-6a76-08df35239c17
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:45:16.9978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Me8fEWTMMGRNSYjR1Td3Z2nmndofoPvHDVOI5tEa+quOLnGnNDB+fZqDtqG7f0aFRjYjEiJcpU2kC/uF+hwx24T1h7ecmnbapsVLcxidccI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
X-OriginatorOrg: intel.com

Hi Swapnil,

On 10/22/26 6:25 AM, Swapnil Sapkal wrote:

> diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
> index 17ae73d3476c..947735e26099 100644
> --- a/tools/testing/selftests/resctrl/mba_test.c
> +++ b/tools/testing/selftests/resctrl/mba_test.c
> @@ -13,10 +13,51 @@
>  #define RESULT_FILE_NAME	"result_mba"
>  #define NUM_OF_RUNS		5
>  #define MAX_DIFF_PERCENT	15
> +
> +/* Intel MBA is specified as a percentage: 10%, 20% ... 100%. */

The percentage based interface is the generic interface and not Intel specific.
You can drop "Intel" from references to this interface.

>  #define ALLOCATION_MAX		100
>  #define ALLOCATION_MIN		10
>  #define ALLOCATION_STEP		10
>  
> +/*
> + * AMD MBA is not a percentage but an absolute memory bandwidth value. The
> + * test sweeps the bandwidth from 4 GB/s to 40 GB/s in steps of 4 GB/s,
> + * which the hardware represents in units of 1/8 GB/s (i.e. 4 GB/s -> 32,
> + * 8 GB/s -> 64, ... 40 GB/s -> 320).
> + */
> +#define AMD_ALLOCATION_MAX	320

The AMD maximum is enumerated from hardware. How can it be ensured this is
the appropriate maximum for all AMD systems?

> +#define AMD_ALLOCATION_MIN	32
> +#define AMD_ALLOCATION_STEP	32
> +
> +/* Number of MBA schemata allocations to sweep (same for both vendors). */
> +#define NUM_OF_ALLOCS		(ALLOCATION_MAX / ALLOCATION_STEP)
> +
> +/*
> + * The fixed-size result arrays in check_results() and the aggregation loop in
> + * show_mba_info() are sized and driven by NUM_OF_ALLOCS, so each vendor's sweep
> + * must produce exactly NUM_OF_ALLOCS allocations. Enforce this at build time so
> + * that changing a vendor's min/max/step can never overflow those arrays.
> + */
> +_Static_assert((ALLOCATION_MAX - ALLOCATION_MIN) / ALLOCATION_STEP + 1 == NUM_OF_ALLOCS,
> +	       "Intel MBA sweep must yield NUM_OF_ALLOCS allocations");

Considering how NUM_ALLOCS is defined, could this ever be encountered?
Could this instead be
	#define NUM_ALLOCS 10
to ensure the sanity checks is accurate in both scenarios without deriving a
architecture neutral count from Intel counts? 

> +_Static_assert((AMD_ALLOCATION_MAX - AMD_ALLOCATION_MIN) / AMD_ALLOCATION_STEP + 1 == NUM_OF_ALLOCS,
> +	       "AMD MBA sweep must yield NUM_OF_ALLOCS allocations");

Could _Static_assert be the more flexible static_assert() (and include assert.h)?

> +
> +static unsigned int mba_alloc_min(void)
> +{
> +	return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_MIN : ALLOCATION_MIN;
> +}
> +
> +static unsigned int mba_alloc_max(void)
> +{
> +	return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_MAX : ALLOCATION_MAX;
> +}
> +
> +static unsigned int mba_alloc_step(void)
> +{
> +	return get_vendor() == ARCH_AMD ? AMD_ALLOCATION_STEP : ALLOCATION_STEP;
> +}
> +
>  static int mba_init(const struct resctrl_test *test,
>  		    const struct user_params *uparams,
>  		    const struct resctrl_val_param *param, int domain_id)
> @@ -33,15 +74,17 @@ static int mba_init(const struct resctrl_test *test,
>  }
>  
>  /*
> - * Change schemata percentage from 100 to 10%. Write schemata to specified
> - * con_mon grp, mon_grp in resctrl FS.
> + * Sweep the MBA schemata from the minimum to the maximum allocation. On
> + * Intel the allocation is a percentage (10% .. 100%); on AMD it is an
> + * absolute memory bandwidth value (4 GB/s .. 40 GB/s). Write schemata to
> + * the specified con_mon grp, mon_grp in resctrl FS.
>   * For each allocation, run 5 times in order to get average values.
>   */
>  static int mba_setup(const struct resctrl_test *test,
>  		     const struct user_params *uparams,
>  		     struct resctrl_val_param *p)
>  {
> -	static unsigned int allocation = ALLOCATION_MIN;
> +	static unsigned int allocation;
>  	static int runs_per_allocation;
>  	char allocation_str[64];
>  	int ret;
> @@ -53,16 +96,20 @@ static int mba_setup(const struct resctrl_test *test,
>  	if (runs_per_allocation++ != 0)
>  		return 0;
>  
> -	if (allocation > ALLOCATION_MAX)
> +	/* Set the initial allocation once the vendor is known. */
> +	if (allocation == 0)
> +		allocation = mba_alloc_min();

This does not look right. "once the vendor is known" does not look to be the
real reason here since vendor is known at this point. This just seems to be
a workaround to assign a function return to a static? It seems risky though since
0 is a valid minimum for AMD and that would cause problems if ever used with this
implementation.

show_mba_info() already treats the allocation as an index as opposed to an
accumulated value. Could this be simplified by using an index while also making
it consistent with show_mba_info()? 

Consider, for example, something like:

  	static int runs_per_allocation;
  	static unsigned int alloc_idx;
  	char allocation_str[64];
  	unsigned int allocation;
  	int ret;
  ...
  	if (alloc_idx >= NUM_OF_ALLOCS)
  		return END_OF_TESTS;

  	allocation = mba_alloc_min() + mba_alloc_step() * alloc_idx;
  	alloc_idx++;

  	sprintf(allocation_str, "%u", allocation);

I think having everything bounded by NUM_ALLOCS instead of mba_setup()
bounded on accumulated allocation would make this overall easier to
understand.

This would make mba_alloc_max() unnecessary.

> +
> +	if (allocation > mba_alloc_max())
>  		return END_OF_TESTS;
>  
> -	sprintf(allocation_str, "%d", allocation);
> +	sprintf(allocation_str, "%u", allocation);
>  
>  	ret = write_schemata(p->ctrlgrp, allocation_str, uparams->cpu, test->resource);
>  	if (ret < 0)
>  		return ret;
>  
> -	allocation += ALLOCATION_STEP;
> +	allocation += mba_alloc_step();
>  
>  	return 0;
>  }
> @@ -75,14 +122,15 @@ static int mba_measure(const struct user_params *uparams,
>  
>  static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
>  {
> +	unsigned int alloc_min = mba_alloc_min();
> +	unsigned int alloc_step = mba_alloc_step();

Please maintain reverse fir order.

>  	unsigned int allocation;
>  	bool ret = false;
>  	int runs;
>  
>  	ksft_print_msg("Results are displayed in (MB)\n");
> -	/* Memory bandwidth from 100% down to 10% */
> -	for (allocation = 0; allocation < ALLOCATION_MAX / ALLOCATION_STEP;
> -	     allocation++) {
> +	/* Memory bandwidth for each of the swept MBA allocations */
> +	for (allocation = 0; allocation < NUM_OF_ALLOCS; allocation++) {

As reference to earlier comment, here allocation is an index limited by NUM_OF_ALLOCS

>  		unsigned long sum_bw_mc = 0, sum_bw_resc = 0;
>  		long avg_bw_mc, avg_bw_resc;
>  		int avg_diff_per;
> @@ -99,7 +147,7 @@ static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
>  		if (avg_bw_mc < THROTTLE_THRESHOLD || avg_bw_resc < THROTTLE_THRESHOLD) {
>  			ksft_print_msg("Bandwidth below threshold (%d MiB). Dropping results from MBA schemata %u.\n",
>  				       THROTTLE_THRESHOLD,
> -				       ALLOCATION_MIN + ALLOCATION_STEP * allocation);
> +				       alloc_min + alloc_step * allocation);
>  			continue;
>  		}
>  
> @@ -110,7 +158,7 @@ static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
>  			       avg_diff_per > MAX_DIFF_PERCENT ?
>  			       "Fail:" : "Pass:",
>  			       MAX_DIFF_PERCENT,
> -			       ALLOCATION_MIN + ALLOCATION_STEP * allocation);
> +			       alloc_min + alloc_step * allocation);
>  
>  		ksft_print_msg("avg_diff_per: %d%%\n", avg_diff_per);
>  		ksft_print_msg("avg_bw_mc: %lu\n", avg_bw_mc);
> @@ -129,8 +177,8 @@ static bool show_mba_info(unsigned long *bw_mc, unsigned long *bw_resc)
>  
>  static int check_results(void)
>  {
> -	unsigned long bw_resc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
> -	unsigned long bw_mc[NUM_OF_RUNS * ALLOCATION_MAX / ALLOCATION_STEP];
> +	unsigned long bw_resc[NUM_OF_RUNS * NUM_OF_ALLOCS];
> +	unsigned long bw_mc[NUM_OF_RUNS * NUM_OF_ALLOCS];

Please re-order as part of this change to maintain reverse fir.

>  	char *token_array[8], output[] = RESULT_FILE_NAME, temp[512];
>  	int runs;
>  	FILE *fp;
> @@ -147,6 +195,11 @@ static int check_results(void)
>  		char *token = strtok(temp, ":\t");
>  		int fields = 0;
>  
> +		if (runs >= NUM_OF_RUNS * NUM_OF_ALLOCS) {
> +			ksft_print_msg("Got more results than expected\n");
> +			break;

The message is worded as a failure but the test continues. This is potentially
confusing. If it is a failure then test is expected to stop with an error, if it
is not then the wording of the message could be adjusted to not imply so.

Even so, this change does not seem related to enabling support needed by AMD
systems?

> +		}
> +
>  		while (token) {
>  			token_array[fields++] = token;
>  			token = strtok(NULL, ":\t");

Reinette

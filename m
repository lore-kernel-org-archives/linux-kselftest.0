Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1021147F77E
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347171; cv=fail; b=TNd1qno5y9NPFPMyQWSIITtx+VTd8JtKt/9I/vaDGOQeMtodj1UcYezs5Ub+I9UelZiryP3ivTCohycCTXFs3jdZdXP6s/fsFzp5N6hgqJdUVgPXaXsAbPaQ6DvVlJDm1GyVNRGYuussEvFyp3fD/ydD0SuMuDEE9kAvsCAkVTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347171; c=relaxed/simple;
	bh=oDrY12txaHnCLVOnSPeKQaPGw7B2enqJ8MzGOi3FdTU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JcvcZdrv23eOrEHE4W1Zy3+1Y9kMutASwxSxq6cMrL++5Amu4TojZUaRFDajspJseFqCX/wFcWzkHF4cLQqVU9ZShdSyLN+AyeZaJmTjhrwIZtd70kqh1igyvaA2bah4IVTrOKCtJiKz7/mFxNGcacZTBhEjmlA9q9aVo7Mg2Js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6FISzUp; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6FISzUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790347167; x=1821883167;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oDrY12txaHnCLVOnSPeKQaPGw7B2enqJ8MzGOi3FdTU=;
  b=C6FISzUp3K/MAgs+rPHYP8h4FJLnAlIUOxeEBkP6PIkCqqs+3IqOJi/x
   WCQ/YHe0YXAq3gYbqqoOaMawrUF5Gm7ABQbZzED1ByjeKXitI9qn4vzaY
   4232/xcEcoO7a/m+PltCv/OukMBoLnJ+3cAwPC2WrJQkz2vYbNRIt9qYu
   2GbL9zRf0IdTH5K52Nhjs3Q988j5Oii5JHB13dUKFfANQNBpN08DepST6
   sX0gHE84zPrHOQWLoj34EShuGFO7T688lZCEDTf0UTLkmBthYykeiC+Qc
   r0o5WmFR9nnCx3Qo9lMEc4LKH4HqE7bGM0mC9Db1ad2SMMZg7Y6RjXK9B
   A==;
X-CSE-ConnectionGUID: 2BggBpR/TSemlDRJasBnIA==
X-CSE-MsgGUID: tpUD6FywRseeN51tMJKiQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93851598"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93851598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:39:21 -0700
X-CSE-ConnectionGUID: lSFzVSVHR5aFGyaX0Q/8dA==
X-CSE-MsgGUID: 7KNDmnPESrGdXmy5e8VjoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273909819"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:39:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 07:39:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 07:39:21 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 07:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0vIO0leWyipGDwhFN6CK19ChXCgTXj+227Pq5SmQkRar64RnpBPALDojeYZCUkVWdq3QV263SE7IfRTA9/nAYh2M6+c5ePVnTUtn8j+i+Mmc2W/+xvrK+y2ggcTB82h2U5+piPLysiqw/wFJqJPMwy7o10+897TzF3imrlismZei1qq9ZZ2vG6eS6LHAtD1lksnbAvSrbZlHTxZ0jCm1pASC3DvaUfw6qB9F1sMLxzdJ4b2gvaMKM8AFcfkzNZ4kEd9T9Ewp/dTxymkzhMMIuq2uUyMA/YS/FCjHhjfEhbrsx7TdL+d/4T7t1EYvOvMp/gQcVwNiwOhlf7d6UC5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSNjyn5dvvOBgZsPawru13JZZOWB96BotjUY8gRXr78=;
 b=MSwOTGEiRqmHwiGOQQT/i4Y+Ia5E4Yc0vFSU9kEgZa4EzJvyYlbjQODMYc18FHmj90O93Tz7PcNL5bsrQx8guMZWGE2lbXODJ4MCYZnmFpiBvcecsl2Ajlaboab+QA+dG45TY2bWx56Vc/M0F1jlhei1I7Y+cln8sSSO31QdAIV/VTmjKtTlp2WQ97203yZgEpFjWwbpG2nAM9US/SZTe/oW+cNUWyjWEL9bAt09K3mZdlcuxOrFbbTtPc1wfGxA5gto0z8sRTFzA2RK4sO3KhT+G+Cs0sr+BYhOy89gzNSjAoiYX4R2FLrOCTCMTg0Q9sDzMV9d34YXOAfl0qlI2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 14:39:12 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 14:39:12 +0000
Message-ID: <f74691a4-c42a-4054-898b-a2813c20b1bf@intel.com>
Date: Fri, 25 Sep 2026 07:39:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: resctrl selftest patches ready for kselftest "next"
To: Shuah Khan <skhan@linuxfoundation.org>
CC: Shuah Khan <shuah@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
	<linux-kselftest@vger.kernel.org>
References: <92c35a79-1c8c-4543-8fa0-0ab78b05faae@intel.com>
 <CAKRRn-d+72is6hNnyTvxUWg0mRWm_BDBcqHZY0+ahdzoNJV=bA@mail.gmail.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <CAKRRn-d+72is6hNnyTvxUWg0mRWm_BDBcqHZY0+ahdzoNJV=bA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:303:b9::25) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: 26882c94-083b-4f7d-f055-08df1b12c3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: kBHgCMOuTzyur3bmDm6hWiQJEXFps62+h4PXNW650t7CHJ2355LzTDC0eDIzPi7wcxyKtSLnvXliBVDXUUbQdN3nbkK1JscZBU9eOCeQ2qrW7KTOj5eLhLBrZhx90kP6EdGJuNBvYkX1qTnA/qQgkzU5zdWAoWs5fck7jK0NNz9pe+GahQb5Drr7wphRRE20mHJoYFQNOwd7wG84nNCTpIJ/QhXTfSjFYEU5HJZ+LABX7IJrIuVbFjcWjWLqKs0dtaWaXvhjXVzTVCM4YHXvmi/NWPfL737N65nl99zXKJ6x66erjmtKfka+Azjxi/HjmgINN26+rXFGoyEXtQcQuj3SOPfXOR4rW1zE+/uMS+99KwqF/+vHorTXtJmSw4RC9YRb4OO7qd7nbvVr+H3aeyJnYKfRM8RQ0b88dynGwTohlrq0GDpaLqSVgYT/aGBSniZdKCAEUUD/l+V/of98X9WF/pvGG9b7+tV5zitgIXo5KS+cz5nss5bNsACHwfaPLOKtYKRaFpsKDjbKhuf7pIQv6/6MtFBV1iV88JmWh5T0zj+xS9wHTndHxXDzvI7yUd4xosbAbtM7TlwGWHAkiAusRqM1S4Scy1arnWdoDHyFMAHa3HhI7hlV/e0Pgg3p1jCpgdenwVd45/LNP8y0TEnWy5c2A+lJ/sOyPbq/tfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mi9tZ0hicFBuRDVJZlpCN1BOLzUrbTFxWkpaUUlNV3NaNzhpazh1RHRzY0F5?=
 =?utf-8?B?K1U3L24xclh4VVBxRFZhOW52Uko2VC96dFdNcnNyUWpsb3EzVkI5dVBRR3pJ?=
 =?utf-8?B?dTNJd2VLdklkaHJrLzNNMkFzbGRyTGQvbUJVVE5iVmkwQjk3ZkZzWUhnajlF?=
 =?utf-8?B?QnZHcEJBTEdsY3pQY2o1RWlIazUxZU9NNU00bmp3NFNLaDJXd1hrWGdTWXR4?=
 =?utf-8?B?TDhISko1cUZzVytwc2xkMTI3L0tmaWduRGphNXNPclUxaTY1dktKODRhbHlr?=
 =?utf-8?B?VkN1KzQwSEpITkJNdnNhL0ZtZE1qUnM3M2tYUEl2ZzJia3VvdUZCbkFhcWpO?=
 =?utf-8?B?ci90Y0RmYTgvVlRYK0lQZDNHRE1rMWUwSmN3bUg3OXFyU0N1QlNkSjlPczE1?=
 =?utf-8?B?ckZPTVF6alBzZ2VjMGZzSTdyVlRnTGd0cU1Pa2dzUEVia3dWM0R1MXJwZTdp?=
 =?utf-8?B?K2dWclJLRkF6UTg5RGgvcDNITENWYkNoMmd1M3VWWExtN0RtcUVDdksvRmdD?=
 =?utf-8?B?REZwUXR1dWM3RWlpajR0SHR1U0Rwdm5ycVQ4NWlFQzlsMUNsalB3YzdweWZq?=
 =?utf-8?B?Q2ZsVVc2OXdDOGFCVHB0S1dBcVJYU0l4UjRCTnVocVhsakxZdzQ4OHJjbTUw?=
 =?utf-8?B?WldvNlBQdVJJRGxmeTF3YVk4QnBhTWU3TC9UbEpvakRHYUd5VHI0MFZuR3dl?=
 =?utf-8?B?U3oxQ1RYN3JycHlzdzM4R1lwR3JCRi9HQTVPOGc1NHdKVWVvMFVER21uL3Nq?=
 =?utf-8?B?YnJUT3ZLY2R5aERQME1uNGVPS3BQTWpNN3FJTnRkdm40UmJPOERGODlkR2d0?=
 =?utf-8?B?RFlPdWxrd3FhbEcxd0xpc3hTT09SNHpvNGxhY0xXT0tTU1VQMXlHRTE1dG42?=
 =?utf-8?B?dUlSUWhia1lWRktsT0JsaXAyQy9xS2dCY25OMjd4SUYxbGZZazJsYWJWOFV2?=
 =?utf-8?B?YlBveDl2Q2duaHNPN1FQTTc2VnhPQ3AxNk9RaGZmUFZ2K1MvbUJRTWJ6ekZM?=
 =?utf-8?B?UEpIa3k4d3RJUHAxYW1COFNYeVk5OTRYRWZGdXBUc3VMcCtQVTAzY0lrOVVK?=
 =?utf-8?B?U1pOaWZLakxxY1pHMFZEa0xWMnA2cFhlSFZaYmZ3dGIwOTZ4ekxvZFgrRnBJ?=
 =?utf-8?B?YndxbUVBQ0s2WGROVUtlejdzWVIwWk5Tc0ZDTmIrVWF1SUdmTmQreldVS2hY?=
 =?utf-8?B?NHVhdkxJaDNJdUcrcW1pTVpkYWMwZlowREpqYzE4YUxyaVIyZ1ArOGMwZllM?=
 =?utf-8?B?SG5QV0tMbXBObkZOUmkwOVZZLzh5OExodFg3UWlIWDBCS0tIcklOSUJZMkNo?=
 =?utf-8?B?eFMyaFN5K1R4QUk2d1RyQ0w2REtwbXFWTndaSDhxci81U09LTDBGSnE5Ty9W?=
 =?utf-8?B?Y05Odjd0dlJUbjJnRVl0TUp6aGR5dE8xKy82Mzd3NFR1ck5KZi9IMVlXSE8x?=
 =?utf-8?B?SWZFY2JvUmVSNnh2ckRFczBCVFA5Wmk4ays1TlBQODI2V0trVERSSzVGQkNo?=
 =?utf-8?B?VEhkR0hvNHlwYk5aMlk1cEl0dFljWnBtVWpFK2wydWlzTTRXbE5oTlJnSGIy?=
 =?utf-8?B?Wngyb2VqTExLK0VyZU94TGk4V2d5bEpiSENNdmNla0o3aDFiYmh2YndmWjZH?=
 =?utf-8?B?QWVtczJHb0Z3MlVkS2U2Q0RCMFNoTGxwSjFnTC9mZGxTOFlaSk0zbnlCcEdP?=
 =?utf-8?B?cm1RTVZtNndqZmxwYjQ2NjFBelJJenVLZWZFWXpEREhTb2ErRThnNnNoUnBR?=
 =?utf-8?B?NjhLMDJxcDNHWUdkRmQvQWllUXNxM3lRR1p3aStPSG5TTm90eURWY09heWVK?=
 =?utf-8?B?eUVuSHVtQ09EbnVQTGVjV2xGNmhqRVVsUkphVW9aYzNEeWkxNG04NHY0OWtY?=
 =?utf-8?B?WEVUZ2g0ZFg0b1pBT3kwcEIxeWI4NFc0WVhEd1AvWDgzRDgwUTF5aVV5cURF?=
 =?utf-8?B?U1BzMWw5WXZEdC9jT013Rlh0SWtTVURybTQvd3VvQ0p6RmNaV2p1NmV1R0Vr?=
 =?utf-8?B?Zk5CcEE4MTN6VWJtTEh0STBXTWY1dUpYTjcyL0NURFgxT202R29tRldkeGRI?=
 =?utf-8?B?Q013d1BmeW4vM3luY0pZSGh6OGdkNkVuU1NOMXh3NVlwTlBtYjF5MFAxVmda?=
 =?utf-8?B?dU52dWlKOEpIWktGQi9ubWtjLzVHZ040YUxGa2pkUGlIcDI5SUI4dmlIbzVq?=
 =?utf-8?B?NHI0OVpqVUFtUkVMdWdQVnU4SjJXZWRqbGtad2UxMVM1Q01lZDdEclVyTTdK?=
 =?utf-8?B?SEdYWk8xNE9DcWU3a1VMTEJWZkd4T28vc1pJdWlJR0FiM1JibkJWek9wcXVy?=
 =?utf-8?B?d1pkbVJoUUZmSTVGK1NXU2dKZFByUFVhbTYxd3dFclVvbTNSb282aHV1Ritw?=
 =?utf-8?Q?tpaNF5Af71saYII4=3D?=
X-Exchange-RoutingPolicyChecked: DDm0ELQGrCxKmUCYfVkD4UfmaFfB/ARe31uNGwOYDPo/jiX8VbjDysdG2DD8hoWriBeTq5LjwzFDfd7SlEt1ZUHHn39zskJYCOEc1NfE1+aDGcJ9apUhhhYsrpLrGCyHuwVQ1ojhLeoHyIIv++EtzfSwqz2NRwYP+he7J3V+UvzBywiQegFRsJ8rg5yHcH3PK9BFifoT52vsLu7FL4S7ZXI/m8D8XvV1RRxEKrPyFeeFiWMrWnMQ4dPzMPwQBb5Zy8L8nH+7LcpJIUuhiBp1xEaifINUf7PTxOX0KmbK8FyWDqKyM0ccbu9HEemIClVm5eOqyaa28keH/AMyJJ3gog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26882c94-083b-4f7d-f055-08df1b12c3e3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 14:39:12.0686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFjyQl2weOnUig+vp9FplEY8wkMB5RyWmSD/tLbIUCjOC1e/zH8fr5IQnHK41VNakNkBYU6pzKMXVITG0Gj/LsoqINqRoY+VttLx3vc3KTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
X-OriginatorOrg: intel.com

Hi Shuah,

On 9/25/26 12:56 AM, Shuah Khan wrote:
> On Thu, Sep 24, 2026, 11:54 PM Reinette Chatre <reinette.chatre@intel.com <mailto:reinette.chatre@intel.com>> wrote:
> 
>     Hi Shuah,
> 
>     There are a couple of resctrl selftest patches that are ready for inclusion:
> 
>     "selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists"
>             https://lore.kernel.org/lkml/20260821003908.12977-1-icheng@nvidia.com/ <https://lore.kernel.org/lkml/20260821003908.12977-1-icheng@nvidia.com/>
> 
>     "selftests/resctrl: Add dynamic linked list management for IMC counters"
>             https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/ <https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/>
> 
>     Is there perhaps still time for them to be considered for inclusion into kselftest's
>     "next" with the goal to be merged during the next merge window?
> 
> 
> Absolutely. I will apply them for the next merge window.
Thank you very much. Much appreciated!

Reinette

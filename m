Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B121B1DF248;
	Thu, 15 Oct 2026 00:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023563; cv=fail; b=lVa6nYqqeKjP+XTLlRALU7SLo5eaSgUQpa9nOwX9nuf0a/cc8/STMajUiO8aNDXCVZSm0jrQX5pJ1/cn7th0RHhrG9pk5ySJPfeawhPtWgBJddMuBExMpLFp6CkCgsVUgyucRtbbC7atk1xMglAeQCTwuJcCYtaHu1ahsTEWXwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023563; c=relaxed/simple;
	bh=2tc+c3Mhys6x2wmC/zICnvpMRXS6B2kg7JI+6qtoX/E=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sYj1v6MrcRxnSwoi5txV9d0k5FmhrNxlpr94CEcdh3XZoumYq1/ZExy2iqJisv+ChtfwheM42SzIDw05MLc7XawyDlpj/p74cW1W/+RxzV4kzxVuapCZXHFcO4yMnXzaUB58LLoTef+WVGAM3jaPjLHX7vIejPJsTeudtTnveI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Za4IN83g; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Za4IN83g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792023561; x=1823559561;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2tc+c3Mhys6x2wmC/zICnvpMRXS6B2kg7JI+6qtoX/E=;
  b=Za4IN83gMV+w4eyAqUSDie1cil4YfEtR/fPkcSmZY86O9QqeYjsgbcHm
   b06/9dod8nWROpzufx3y3jNB4GdF6t9mVdpC5mm6mtbMrj1xHXgxKaO6i
   m0DG28mzo0OgNIeRyrmvh8+4p6U2ck9V/cKzeGfavKPVw9rndJBMosY5T
   phDCl9vOyI/phcdRosfpVi5/k6gOJBZO1aD05KJ27ll95XpWQusQ9rig2
   dslxQkPUKc15+vY3fhKNBD3TIpipIvCZJF2vfbSxVGz1ahiTnpz7/GU5D
   716ITLbd/sBa0jVPXVbya3WIrUCuwTnt3qqQccN6K5acUeHed889ufBFN
   A==;
X-CSE-ConnectionGUID: hf6oMcDAQCa/gJY2Xs3/dw==
X-CSE-MsgGUID: BehMKz2iRvWQH8oXmEggPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="781042"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="781042"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 17:19:21 -0700
X-CSE-ConnectionGUID: Vyf1i2pGSAWuy3w0F8NgKw==
X-CSE-MsgGUID: p4w4MeTYSleN/JnLQrDPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1908906"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 17:19:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 17:19:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 17:19:19 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.68)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 17:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3C395v7I4DpFMo687PWyJxVdMXJ4TQRoYaNOD7+QOYd7V62VPxm0RYqRCoteWZyrGf5tlU+38Hl1/jmzEycJBaUKXchijKws9mF9zi3cjgb2jMg/nfJ6yMsOTHAghKBRadkye2So++GmPTx1xgskciO8GP+rirFC1VNdu8fdpzcopcI2abfl78rOpUdRL/ReVT6I8/Lszp2Vp8opboCSbsoEduAwuEHEzj3nYQVd6R8399M4FxLWJq3wWA6R/ADipxqU7mXrj1NgXAPokpUzi2OoAXctgLJYB7MO50bdP8fqnPDX7LwZ+ghx+amX4gnT5Xi9sfC+au0ePNZKBWS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2T/JpbHfE6ihgg8jIpU2wWvWTmIaO6kLONgDIR3R0DU=;
 b=Ui3Sj2I2YLC4VcksBBHGKj5LikZ2YeFGQqQwBTOpedoKi2NZ3ORIfXAtdZcAjHHmD6bm0FKuhdi52mTzDeHgwCFnyjd+BOcyOwRF2Pi0M1jVNH2avbIErHltX2vjnxKkd0doBmtJAVOpAfokqpJH7zIEE715Sqfshz7x0OalRdfWPFxAMuOsk4MHiMQe/yWk7pVkmJfQt+4DYlRk900liBPHR8HKDBAEe9nyem75z4ilcrdqPbdheBLkWU3ns7DfKg7xvl6NrWd2ZJ+JWcmU+VZDhHme6MafCjdvHtC2PihTyDqiEBUI9xFSoiY1nxO3WkhSgQiu858nH07M45B8zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 DS0PPF0A1E7F360.namprd11.prod.outlook.com (2603:10b6:f:fc02::504) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 00:19:17 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0496.015; Thu, 15 Oct 2026
 00:19:17 +0000
Message-ID: <1c19df7c-76b2-4dd3-b280-d6ab8bb45d4e@intel.com>
Date: Wed, 14 Oct 2026 17:19:16 -0700
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH v2 2/2] selftests/x86/amx: Test dynamic fpstate cleanup
 across exec()
To: Guixiong Wei <weiguixiong@bytedance.com>, <x86@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H
 . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <cover.1791428412.git.weiguixiong@bytedance.com>
 <11ea12962bda75b3e8ef845084546647f79eca38.1791428412.git.weiguixiong@bytedance.com>
Content-Language: en-US
In-Reply-To: <11ea12962bda75b3e8ef845084546647f79eca38.1791428412.git.weiguixiong@bytedance.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|DS0PPF0A1E7F360:EE_
X-MS-Office365-Filtering-Correlation-Id: 843bc42c-aea5-495a-dc77-08df2a51f334
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|11063799006|4143699003|5023799004|18002099003|56012099006|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: rYjXaz/prgW2P1pXTEzJitr2ntSpkx85HBRynHIs7NQCtSWSCatPRv0uf7h5Lg54V4z+93aZZQlEex8FXcDmpYba9dA6uSGGhQ1PjcvmwGPKOpnm8FmIrjBXZjgxkC0AourCO3HZQjzQIwssNoykNc4LrWPDevj1fLdfCNqlGEVJWzXH+L6gVCTl+MReT6GRiYq8elKk8xZt5xY7afJMkwtT6xDHUz+P7MxV/X83XWICyKaisJIHPHo+fVZHyNkV0c70W0W2Ws2o5cn7lJRndHXRpr67cR1HQss90lzaAJ6zT2y8IVgqHzEhu3ogRf90tiRFMYbKk7i3JwySPUtSNP9rtfRmkPiX7zD0uUkQDiN0qjXiPKRDeEm65rCLdN0OyEsVz6KgcPGoK02HMyWnUYs0p8Bk1TsNL9H3++8NQl5ZMZ1ftIxDhHCKFbqWcHII+SK4EqMRFVQMP7d+y9eZT6QKyoFpS9LTm3NRcyr6uwZtBHstFgNQSnSrJzTEt+ZEmKtBgakLlcyI/xgmBaXYbR4wYgvAvdhTNKfsd3KpBE/iAsMl0wXHJuNQbZ63jjqpR6NzzpZIjFsZ52gVYLQ37Tk6J4UUJ15xBbKxcASH0eQ0+ZT80j5KzXjg2FEzsCLSnBl+kXEHW9pAXAkntvc9EBbrTT1dT4hAXdTD8+/Lg/k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(5023799004)(18002099003)(56012099006)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmJsak1rbjZ1bitUV0o1dVI0TzlZQUZmcFZQWDlZVG1WdWFwNWd1YW9sY1VC?=
 =?utf-8?B?SmFwaUFPaXlrZUdjZkREQWtqc2tEMVhqWTgxTHJ1NExVYUdkdllKdkZtTmRh?=
 =?utf-8?B?Q05tNGx1OElDME91Vk1JbHVzbStxNGxvZGJ0V3RRd0hlanFuZ2FueDl2eXkx?=
 =?utf-8?B?a1Rmcys5cWF5Y2UxTFI5TmY1c2FmWWVRRTVzNEl2U2hkakVLWkZFL3lsY2tG?=
 =?utf-8?B?Kyt4THVMeVY0SnZsRWtIa1Z4ODBoUndQZUJGd21RQyt2aDhmSGxjWHJiNUhE?=
 =?utf-8?B?cFRmc1IyckI4d3RyMEthaHJkdFJXNVZ1R0JvU3J4UTdDQTY2SFRnbm14RmxV?=
 =?utf-8?B?TUh3ZElhQjFaYkNDTGwxR2N1STljUEpFYU03WmpGZ1lQYU9pM2o4TXNxdU5n?=
 =?utf-8?B?UjFycTFlTzJGQ3JybEVpaEpQRzF0VmN4WmZReGxmcFJpUk1ucVRhV042Y0lY?=
 =?utf-8?B?ZmFQeDdrWUI0dGgwVkNtZnQzWmZ5Mzk3aTBsSklqVGVLYVpKUDB1NmM5YThJ?=
 =?utf-8?B?YnAxUmVHSFNPc2ZSeC84d0dJVlhHcDlPZmtoNFJXR1FWTmtPQkhRRXQ3R0gz?=
 =?utf-8?B?UEpmWFF4Rm1VTDZqZUVOSU9lcTZEcTZLWlExeTJUdVIvYXB4YVMwNnJ3TWlm?=
 =?utf-8?B?dVh6VDRyQnBHaDNpenNlSlhVaTZBR0liaEZ2dk04VjBRYXdnclNnb2xWZkh4?=
 =?utf-8?B?SFdEMEkwaVQ4VGk4bWhTVURsZGZvRDZnWTN2L3hCeCsyb3NSUG1uVUhjY0dB?=
 =?utf-8?B?dzNiRXAyZ3ZWRDhBby9IamRTRVFFRW9oamNRUFh0ZFhTU1lUaW1YMXJML3dh?=
 =?utf-8?B?VUhZTElDZFJpSGVqYnh0dTdOTXJUcmNHY3ZCOUdMSDFETkk0TVFTQW8xYUdj?=
 =?utf-8?B?TG1oL21DcEU5VGl0U1dSa0toMlhuU3lqUlNMcy8vQ3MrN3VVVDllNXFENEV4?=
 =?utf-8?B?Z05mZTNQaDBIZk5MN0tBSHJ0MndXQmxmbEttU1FBVFNnbHFkTDB3bkJ1Y0pp?=
 =?utf-8?B?R2dLTHNWN2JVTXc5d2p4Q093MysxUHhGNVR4dUs4d3NHMDVnK0Y4bW5kbjYw?=
 =?utf-8?B?YVNTajlqVlZlOVRYUXF5TVRDODFSbW5ySlRJLzJKMkhENCtNWnJ6dklOM0NC?=
 =?utf-8?B?OGJqc3czS3N1ZFZIKzRJazhFUVBIaHZSM0xseFFIUXZRNXdsWkoxKzZuaG1Z?=
 =?utf-8?B?MllOcWRpR216Zm1YZTdGTXNNVE5rN1dNL0hEZTZYVDJpYVRLL3dUZlZXTnhu?=
 =?utf-8?B?QmJzUUtsYys4cTRsYS9hMDZnaTVJVlVDQlZUaFc0cTZ4M3RyaW4wUDFmSE9E?=
 =?utf-8?B?TVRIYVkrU2dheVFVazhWMk9zYUZZUCtWTVIrQ01lMzZqK2dCMHZpOUFBQVVy?=
 =?utf-8?B?b0VISTZkUTF6d3JYaXArSWI4SVgzYUR4RjlHOWNzeGdGMWQwSDloNE1KcGdn?=
 =?utf-8?B?R2cxdHI4YTFxYTZ4WURQQlBMYUMwZnc5ajJNaWRmNGlpaWM0RytjenEwUTNm?=
 =?utf-8?B?cmVONHhpdEFDYlA1K3R2dUE2V243SHlXRUZUa09hb1BUM3Y3bkRUMURYSTJo?=
 =?utf-8?B?ODl3ZkltZSs2cmpoVGZZYlFPa2ZqeWYzbnhCSWk0c2ZEWkxxYkQ3U3pKY1BR?=
 =?utf-8?B?eXZSRm81UGxBRWRmdkQ0QkY4WFRHa2ppejJ0RkNPcVlnNE9MbG9wTzFWT1d3?=
 =?utf-8?B?ZVNxaWxXMStzOThCTWRsR3VubU52VWVISTZvR0lWT09sWllraEhEYkFaUzFM?=
 =?utf-8?B?NkdseFl1WTdrZndtVXBySWpUUEZpZXBSYmhiZEJ2L0FETnBPd3ZaZEQwSlJN?=
 =?utf-8?B?M2NheVN1U3N5TE8vS3hyV3U2cmExSG1JSTZIeThsYjVkVnV1bm1tNTFHSGVI?=
 =?utf-8?B?SE5mbXdrekRFSEovS1lzeDh2S0pJcWJOdVhCTXN3Y2QxcHp2WjduQXFPU0p1?=
 =?utf-8?B?Y3I2SlJZeU5RNWt3aktvTmVodHViWk5EQ1ByVnN2YjlsQTVTbHZNdy93dWNV?=
 =?utf-8?B?Z245ZTlOdkM5ZDV1OGVjTG9vVzJzYVlFT1gyVW03clFwbjJMNzBMdXkrNHZO?=
 =?utf-8?B?UHVxd09ZTUxNc1JHMkpQS1FxVVo0b05MM1loN1hWT1VoMG11S3EzU0s1eXJa?=
 =?utf-8?B?S042VldUZllBdjF3TEFkNVVmZHE4d1NxZFY1OVZHMDVNR0hLQlVCZ2hKSTZ5?=
 =?utf-8?B?VEkvZjlXcVNHZHZFN2E3NWUwYVR4YXRYNXVRYzBpbzhTc0VrYnMwdTlrODRx?=
 =?utf-8?B?RW0zR1hjck5XN2RDOTA4aW9UZEZ4ZDRHRHI0bUQrRlFod3FWaUZ6NFA5SVZI?=
 =?utf-8?B?YTg4WkNDTlUwQnMyMEo3T3ZjK09pM2R0N1JMeFZKbzJLajVwWUN6dz09?=
X-Exchange-RoutingPolicyChecked: eIbhHjdUjvvl6VW9Elp3CqDbEoVIe3JiP1HTcIIpidcglCz9j2AuchjNznogwN4FUMzrgG9lvy8SVf9IJcfnc60YDZ5DFNERmnAjx+EVRjXb9Q6dS4ql5B5H+9KI/NIxByUmrfbAyYepKIFJzxle+GFe1VsYChojIoBh8D0q2iUIHoJOr8yfct7wxME4EcM7nO30Fbc5SVlLkPRs33WcTrofjAURf1P4FpvVspWw2NWgiWK3RoxA3vuwrS9jRsUIfL4q2Do71CZmqg6JcDUSeFwYY3CbnEKHmJEyXjqyKooUE0T88zjhT8G0IfZ4S807uThHuGvMTzzCUApt9J5U4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 843bc42c-aea5-495a-dc77-08df2a51f334
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 00:19:17.4113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fv0YO+kUQoMn0r0RwRFVx4yk/pgHPfSTIolUGBNEBdk4Vo6g1zdh6Ecs+54PpW+zTzgy7RH3Hu/IJx2/5Gm2mbomUhdxkoILzyLz4AGxfRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF0A1E7F360
X-OriginatorOrg: intel.com

On 10/7/2026 10:59 PM, Guixiong Wei wrote:
>   
> -int main(void)
> +static int count_dynamic_fpstates(void)
> +{
> +	char *line = NULL;
> +	size_t line_size = 0;
> +	FILE *fp;
> +	int count = 0;
> +
> +	fp = fopen("/proc/vmallocinfo", "r");
> +	if (!fp)
> +		return -errno;

The call site doesn't interprete the error code. Instead, you can simply 
call fatal_error() here and below on an IO error.

> +
> +	while (getline(&line, &line_size, fp) >= 0) {
> +		if (strstr(line, "__xfd_enable_feature") ||
> +		    strstr(line, "fpstate_realloc"))
> +			count++;
> +	}
> +
> +	if (ferror(fp))
> +		count = -EIO;
> +
> +	free(line);
> +	fclose(fp);
> +	return count;
> +}

> +static void test_exec(void)
> +{
> +	char iterations_arg[16];
> +	char baseline_arg[16];
> +	int before, after, delta;
> +	pid_t child;
> +	int status;
> +
> +	printf("[RUN]\tCheck dynamic fpstate cleanup across exec().\n");
> +
> +	before = count_dynamic_fpstates();
> +	if (before < 0) {
> +		printf("[SKIP]\tCannot read /proc/vmallocinfo: %s\n",
> +		       strerror(-before));
> +		return;
> +	}
> +
> +	child = fork();
> +	if (child < 0)
> +		fatal_error("fork");
> +	if (!child) {
> +		snprintf(iterations_arg, sizeof(iterations_arg), "%d",
> +			 EXEC_TEST_ITERS);
> +		snprintf(baseline_arg, sizeof(baseline_arg), "%d", before);
> +		execl("/proc/self/exe", "amx", EXEC_TEST_ARG, iterations_arg,
> +		      baseline_arg, NULL);
> +		fatal_error("exec");
> +	}

This nested exec() with passing numbers via arguments looks more 
complicate than necessary.

Instead, you could put the fork()/exec() sequence in a loop. Before each 
exec(), call load_rand_tiledata(), and adjust main() to return 
immediately from the exec test. I found this also reproduces the 
increase in /proc/vmallocinfo.

> +
> +	if (waitpid(child, &status, 0) != child)
> +		fatal_error("waitpid");
> +	if (WIFEXITED(status) && WEXITSTATUS(status) == KSFT_SKIP) {
> +		printf("[SKIP]\tDynamic fpstate allocation was not isolated.\n");
> +		return;
> +	}
> +	if (!WIFEXITED(status) || WEXITSTATUS(status))
> +		fatal_error("exec test child");
> +
> +	after = count_dynamic_fpstates();
> +	if (after < 0) {
> +		printf("[SKIP]\tCannot read /proc/vmallocinfo after exec(): %s\n",
> +		       strerror(-after));
> +		return;
> +	}
> +
> +	delta = after - before;
> +	if (!delta) {
> +		printf("[OK]\tDynamic fpstate allocations were freed across exec().\n");
> +		return;
> +	}
> +
> +	if (delta == EXEC_TEST_ITERS)
> +		errx(1, "[FAIL]\texec() leaked %d dynamic fpstate allocations",
> +		     delta);

errx() terminates the entire test, preventing subsequent tests from 
running. Unless this failure makes it unsafe or meaningless to continue, 
why not report the failure with printf() and let the remaining tests run?

> +
> +	printf("[SKIP]\tDynamic fpstate vmalloc usage changed concurrently.\n");
> +}

Thanks,
Chang

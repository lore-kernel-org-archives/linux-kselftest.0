Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56F436F41D;
	Tue, 17 Feb 2026 17:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350755; cv=fail; b=uxDOb+PjCTlvmmKtjX4H8XNnCHUN8psIOA5YXjUOBnBCmODjD3bvMhnPpfS50IbHUVoVk0+bX9wjXcQw6yoj7fyBzYjuScNQyZevtqvdg46JgbN8+bltAHxMELdF3mOt33aomsFVGc/e3CMpw1YCH6UqYJaT/FPigqLnCsYnmY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350755; c=relaxed/simple;
	bh=E95uirvv8oW1ta4a0lJ6o92sTTkFQcKKivmnVpK7/0s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qKLl47OEP5itdre1RrPJhfzV7ahZk3RgUEdr559UdJdhtfybFDPYouoxgSUBmBg+2ChU5Ub/M9pzd81WAVyeQPYFT56HBZmqmbxj6ZiHBqtszJahwRq64NWrB0YhdFAGvEFwftOsi2O2+cBebJ6S3UQxbZqXAaW9VT23sRbEqcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMztzMth; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMztzMth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771350754; x=1802886754;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E95uirvv8oW1ta4a0lJ6o92sTTkFQcKKivmnVpK7/0s=;
  b=lMztzMth0XQZl5zA0fG64HMxa172c684x0t+/IWqwV1zUDoTEN4AXhlo
   c38LzwmngvoDrVIBzNeGdQ8sJyufsUs+807sGA9I6S3mU5hg9SkVpXkp6
   SKSJIAVD8hZEb4AaBTmSuCxi+3oTKDcsBEI8jz21DeSXc4n6zQwbXvSbm
   bpGSyDzhahsTNEf1aYg34gyjwoSxz9a2k0FLR14nJjqJgZzXqG6KkqUWE
   otpPZ+sV5fOcTXRSM4SYWvdLXvyl5Z0j02/G5jmeEWdaACz7/xaSBmmJ9
   8B65TdljIKIMWKF6Tdy4in+dMr6AEPtz4EzbEHtbILHaaAHTVbPkPGvy9
   w==;
X-CSE-ConnectionGUID: gxQnP/fgRc6ZKiwWQDI4ig==
X-CSE-MsgGUID: ujsotHI8RUuT1Ie2xcHCBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72472207"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72472207"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:52:33 -0800
X-CSE-ConnectionGUID: NeEm0SdARNmlvKQTJviwNA==
X-CSE-MsgGUID: Uz86H5qrQP28GGW3bOM1Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213194284"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:52:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:52:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 09:52:32 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 09:52:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBtUbldqB5Jl0XAumhh92BZXkqK00BcSuMto/PqvHRsPiuuU/gBEIijmmI+9M1djz1kJeipxINolHtVC9MDgNUcGVFhx76upFusCsUT/PkMo8R8KRoWcWkhIL1qS9MWfiszPlXqdb1mudKOkWMKYV4liYvMPcGc/MyTuvsoG9LGllAulEV79m50qNLwBSBauNom8tz9SwKc7AqsnneSDoo/pGr2jC7wZogPoHThAaEU9oJHT1Ry9yywYQTyuYvT9K77oMneZxCnYtXUybEA7PvkSAQQ3Jy1TJTPlrfoG+eFU3U1PfOJKaJlcYA6lMczBFjLHO4HpfXW/1T/SeS1k5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4Mh7xLwf4CHmiFPE2+E7ac4ic9XmbsruNzp8IXhbMc=;
 b=IuhhznJnN+dx3ka6dfamqzM6gQiPXvpn5LIEbliTIkyNZzPTonnhUPsJTVC+OlP3a1VLSYJ8RVAX4woNL1IxDqGdVfM7atNRTw9DaSf/ovSL9FqHEbh+YRwdAHV27pvVXEOx2okyRVquw3/FaQtuDZc9cFQZ1CB0pIwAk+GIsmoboS0swp3UrmvsPN6rdPOn8ISmLHG2ofQm2mpKikQcwVRMUBwucL0ABf2pQiqchae+LWUuxKTNmJ3RyMKQbjLJw6MFxlni7GVAqvMAzp8ndubkOs8L5RDwYDwPHTRTAkyv8pbrEfisrfbrafuhW4nO/9XpMESIv1YLSyPIedIFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 17:52:29 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 17:52:29 +0000
Message-ID: <30089eab-dcfc-4903-9c04-ad3312629e65@intel.com>
Date: Tue, 17 Feb 2026 09:52:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] kselftests/resctrl: enable noncont_cat for MPAM
To: Shaopeng Tan <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <james.morse@arm.com>, <shuah@kernel.org>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
 <20260123044034.141247-3-tan.shaopeng@fujitsu.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260123044034.141247-3-tan.shaopeng@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:303:b7::24) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 292d3e94-8f8c-4e91-c910-08de6e4d5147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm5TaVVqSmpPYnp0TWU5T21iNHJOL1IxUi96N2xCWHp6dE16SE5GWGxUWk9K?=
 =?utf-8?B?dnNhdFF1bUpYbWE2Y2JqUk9BcDdGQ3V6YnNoVHR5cytXZDV2MThUcnpqM3lM?=
 =?utf-8?B?b1AzOUZZbjRDY25INjRHM2VqSnJwcUxMUGF6RUM4MzNQYWlDcU5hVkZUTjFp?=
 =?utf-8?B?ZDU2d0phcmU1c2YwOWYrSnFIelhoNk1hTlFZblhYZ1JxMHNQSzltdUg1amlq?=
 =?utf-8?B?Q1dodjgySlFXcXpkVENpRk5jNjhieGdCdDZMNmxyb2tmRGZWNWpyTGlpRFFC?=
 =?utf-8?B?c3pzVGZDeWhWdG8vOUFuZnNseC90MUdiKzZaMkVSMEpDWXBaRGRJKzcvNEZF?=
 =?utf-8?B?eERwR0dkNkFGYTY2M3ZXLzhxbUI1Vk1KY3RkaXV1ak1peWhCRTRCL3VnZlNS?=
 =?utf-8?B?b1h4bXgyazA1VGtVZlJyZW04UXYxYWZQZFhiai9wZXFNUUdpQ0c3NlgyN2RM?=
 =?utf-8?B?S2dVd21DWmVtUVFZbmJ1dnYxWXpvQ2ZRSGVxWE5BcDNxM29lYXdPbDREaEFY?=
 =?utf-8?B?dkZTTk9vN3Z4MkxDQmZ2S1hOTkZRc0hGa3ZrcWpzZHdvOVE3ZWo0YjNaSGsy?=
 =?utf-8?B?WTZiVDVsdHJQcGVBQ0prZTZWOUI4MkVnZjZnS3QzRm0rNituMnJoNE5kVjJr?=
 =?utf-8?B?d2d2anZFckl3RlBVU2c0SlBVVFJZS2pFUGhleWlyVSsxL1VSSGlCYng5MFoy?=
 =?utf-8?B?cXJFUHNHejJXMDU1eWlEN0NxZjIxZEdXNEN6Y1NwVHRuVU5WRU0xbStiK2gz?=
 =?utf-8?B?dVJwUlVRMVZGT1EwUFI3aHYzbnJqODdkZzdwcTBkNG9qbHRGeVc5N0FRODBl?=
 =?utf-8?B?Q2pDK2hMeUN0QXViV2daZFN5a25VSDNZSFRYM0ZmZkdwWkhRbG1SK2VqZy9r?=
 =?utf-8?B?KzlZOWtieWpiTkpkTmMwdEFkSFBPNFJkcmU0ZEJxN001b0dSQXJPcjZXeVVR?=
 =?utf-8?B?WVArS0dLTnpMWmVibDNwVkgzS2tZMWhTbmpyTkZ1NmIvMk85eGlJWjlwYmFJ?=
 =?utf-8?B?aVpSWEZWbzJvNkgwYmlqTmJxTzhPL01YbjJkYmY2aFUrdHo4T2hvcElkK0FQ?=
 =?utf-8?B?dTY0UXJYbEk0TXNaSFE3ZFUyRGxzem1mTCt0ZGN3OUNFdXd4THNtVU9RRldB?=
 =?utf-8?B?WC90RVdRRTRHQXRpTDRnR3NlWGlweU5pSnJ1OGIxUnd1VjhNa2d6MXdkQ3da?=
 =?utf-8?B?eEV3Zkh0ZnczZTdHNU9wMFJCckkwakhzMUVhbWZNa3NHdnludFlkNUNYVHBL?=
 =?utf-8?B?cFpOVTJTclBZbmpINHRiQzhqVGxYb2ZKeFVhRURleCtxTzFRbmsrVldjT2Fs?=
 =?utf-8?B?cjRhRlQ1UWJjNFhQd1FRMUxvMUZpWXROSUlhZWhNK1RaK2l2VWJuWjl0Q0Nl?=
 =?utf-8?B?VWxhaHJKMEhxcjNHU25GWmJIbFgvejRsaFVqQlVZZzdFQVp6UGs1RTJxbFZQ?=
 =?utf-8?B?SE9QdGJGSWgzWFhVeGkyOEIvNE9OeGZDa3pPU2dkWHFFTnBxZy9BNTl6eXZI?=
 =?utf-8?B?V2cvVVdtR3VPSW1BWnhIMC94dHZ2ekMzZ3dZYXlSd1NMa200Mnd1WkNOR3Yw?=
 =?utf-8?B?MXQ4cVh0d3JwaW83RGhvaTc1OUtPVkdmU2pUMm45alE5d2E1YWp6blE3blVz?=
 =?utf-8?B?Zm5LWjdoSGFId1NsNXZoNWxVL3FoU2YwVkRla1p0eTVBV2lZZ3EzTHBJOFBt?=
 =?utf-8?B?QlRCSWh5b01RakdPRlBEQzZIcFVWT3ROTmdwSVZUdkY2NHI4TkFkVnN3NUNQ?=
 =?utf-8?B?NENQcHF3NU9CYTVrL25ZQVNkR0JrOTk3SHdIK0pseGlXKzh0aUxRK1d5YWt0?=
 =?utf-8?B?Y29QcUl1R3hQcG9RYWdCWFNCSlBZcTBFWndEb3ZRaGY1MmFmZ1lFMmo2eWtL?=
 =?utf-8?B?ZWVhQkhvZ3NiUUJIdmN4LzRZRXlqSFBYRUJyNGJLbVFqZGwwWC9UaTVzc0FW?=
 =?utf-8?B?aENzNjgxYXVQOFR6RTZKemdROTNQdFUvY0ExNGtJYUo4d3RzZk1TK0ZhMkky?=
 =?utf-8?B?MHFWaktsaU9rc3UxNXRLaXZwUldpZEsvTnY1MmdzM1E3elAxWjVkUzV4K01N?=
 =?utf-8?B?RzFhQmR5NUZiSmJtTGRnTjN3U280ZGVhSkRUYkFWOXl6NFlWeFFjZVJsZHZs?=
 =?utf-8?Q?4xUI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU9XR1VPOGtwVjNLd0ZvK0owa2h6MW5VMTJGZHNVZW81bS95WlY1RVJnc0xp?=
 =?utf-8?B?aXdENFRqNHViaVplcmVBcThkR0c1b1R3aTBqKytCcmI0V3FGa1loZ1p2WHh4?=
 =?utf-8?B?MVJPTkxRN0RYVmZXa2lqYmtGekVLZDY1OWRJcUdqb2tnZXV5SGZEbDd4dkRw?=
 =?utf-8?B?S3ltZXJKS2pQRXZ1bVVodGVLVDVxQklkdk5UMTA0Nmhpd09iUW1UbnFOWStE?=
 =?utf-8?B?WWZSakZIa2pWTzd2azcwUXFYQ1ZHaDc2UzNMYzVIZTNubHdUeFhnMTZwQU00?=
 =?utf-8?B?U0FoZnRta2JFbTkvOGdoTzk1dEFxalFhWjBrOVhETGR0OWsxZmRFckcxTTRo?=
 =?utf-8?B?YzQvN2xmcHNOTk1nUnR3TkdnZ09sNHlFMmZITmdNblJmOFhGTzJkVWtGRHc0?=
 =?utf-8?B?OXpiSjlqTlk5OGJVOEhXMlZDRUkzQzVzS0lpRVh4WnIyVDhsdEVyMlYwOTd2?=
 =?utf-8?B?VTVpczFBOXZCaEMvT1o1WGdaTlpjb3FCZkVHS2c0OE5GNEVBQmJ4c0dvR2hQ?=
 =?utf-8?B?MVhSNWcxSXNQUTlBR2hKNDFxYUtDbUNPOTBzVEJWZGEvQkovYUJaalJaYkpO?=
 =?utf-8?B?SHZqOXdEMjl2c3JqOGJIME1XYXNkWVBha0crcnV1aW5pVElueFlINVNQUEtu?=
 =?utf-8?B?SEVxT05RcklJVURHV2RUdnBoOWs2UG44aHFLQ2V4NkE1TExwUytxSGU2OUZu?=
 =?utf-8?B?RHlzcndDWkwwNGlwTEFRbkRzNWhabmJUTDhmOXAzY3ZnNkhJYVQ3N2NxbTVC?=
 =?utf-8?B?WTBkVHhzYUtrc2Y3OFlWMU1ycSt3b3NoL085Q2FTaGZ1ejd0ZGsvWlM1OVJD?=
 =?utf-8?B?dnBMWmthaE9vZnNyQVNmYXVYMEMzU3BTUE9VM3QwaXVBa1A1T3l5T2haNFJF?=
 =?utf-8?B?bjRick1vVzN2bkM4NGwxOTRqUUJlMms5UCtybVpMRkxGeXVlQXFaU3d3UXN2?=
 =?utf-8?B?bCtNaHEvK2FtN3JJa2tmR3I2ZWhneHVCU1lwREo0Z3JwcnhXWHhRWlpQbzBO?=
 =?utf-8?B?dnUzcGxNS0RLNjRWUmdhckpOSUFYNktsVFhTQ3Y2amV6b2wvQlJkZXJua3lB?=
 =?utf-8?B?UzZSYWE1SlNUTnBJeDVwb0FFcnJOVkFIRTU5YkRiamdSbjg0VG1zbHhRZ0l3?=
 =?utf-8?B?dDVlT0cwYXBnR29WUlNwdVFMZlpHKzlXZ3ZPUzN3U3hXMElKWlR1K2xTOUVs?=
 =?utf-8?B?bFc2U3pRZnR3MW14UVNqVVI1N2taSnBqL2VLQ20vL0ZJck43SkszODlwcXVL?=
 =?utf-8?B?VEpOWHNXYlV2eUQ2L0JtcjZPTmFWTVVERUQzb0l3cTZsQ1A5ZXkzU3NKWGJF?=
 =?utf-8?B?VXNxaTRDd2g2SlkrelhMbzVhOStyUnhCSXJ1MFIwOGxBZUtvc3dYKzliV0Vj?=
 =?utf-8?B?d01zc1F3K21aMXFIVUQ1S0hUQ2J0VFRDNUs2SHc2QTFMbXVUdyt4ZnE4NkFZ?=
 =?utf-8?B?WjNqa2ZIQTNiMWJvSEdRajFuekFmaVdESlVZK0kvM0hTZHB5RDVSQXdEOW83?=
 =?utf-8?B?R1V0R1E0YnMrTlJsdU5pNUliRHo0bWwxVlZ2TFRKWGU4N1lzbjVNYzFkVmdH?=
 =?utf-8?B?aFlkaW5BVHVTd05CeDBMQXhYbnF2VW5PYWhBQi9vVjY5ZFdWMG9vVnQwUzYv?=
 =?utf-8?B?dzU2SEFEN0RPS1h2R1JCclc4VzlRcVRhUFJEZ3VQSyt1ejl6ZDlyYjJ5eHZE?=
 =?utf-8?B?M3RFcmcyQWVNc2lGaTJQZENCeWhqVnFGU0JPdXd2V1ltZTR1WFBsb2tReXNy?=
 =?utf-8?B?ZkhhYnpGL2J4aWk3eUxFR0ZVYWQvc3dHM3hkNktPckk4OXVxeXJKODlxYy9E?=
 =?utf-8?B?N2RNOG56elVrY1hzZnZQN1VoNlBSVmRsbzVEbjBWRENXM3JYOFRqV25PME5Q?=
 =?utf-8?B?ZG56WjUvMTFMYzRqT0JpdlhUa3owZUR6UmJpaC9XazhzM1QwTlNwUy9zOUZL?=
 =?utf-8?B?aVZyaGJoN0JuTVlyb0hUTnU1Q0s2QlRJOWdGQzAyVk8xVVJzYnFTK2NyTURO?=
 =?utf-8?B?L3FaZC8vUFZ5WjJMLzV1WFhiN1puTWxOOFVsR2lYMUg1Wkd0UGErZnFLdnNi?=
 =?utf-8?B?ZEpsR2JhNUFvNzFRNjIxNTdUaWs4RURGSmxpWlM3T1FJNU5xUFYzeGlYa0FG?=
 =?utf-8?B?Tk8rYXdiZGR0VFRUZWVoYjFqaEplVHk3N0ZQdHhCcDJjWkpXNFRvVEQ5T042?=
 =?utf-8?B?c2RqWnNxT0s5T2o3ZWE1d0NYOTVNRi9YZG5LMkJUSFcvcGlxN1Fsd2JrVThH?=
 =?utf-8?B?czIxeEUvU3Vma3NMZklNbnZDcGFRWmYyeG5mS1IxVkhaaFU5c1lRb1BkbmtC?=
 =?utf-8?B?N0xENzQxU2dGdStTWE9aVnVwREl5MGpOK0FVMXowK3haN00wQmVwTzVyVG5o?=
 =?utf-8?Q?FnAby9WLqpHD+p7Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 292d3e94-8f8c-4e91-c910-08de6e4d5147
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 17:52:28.9395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iYvGX3wZV3pUNUeh05yauZQiWydCB4jHSBgKdA+mnHQb+0319BzUBgAtHzqG83qTsbxhCVUYcE+c5h9w6PQmnDt1EtZ5ALMuDzzlByNhm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
X-OriginatorOrg: intel.com

Hi Shaopeng,

On 1/22/26 8:40 PM, Shaopeng Tan wrote:
> Arm(MPAM driver) also supports non-contiguous CBM.
> So enable noncont_cat for Arm.
> 
> Signed-off-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
> ---
>  tools/testing/selftests/resctrl/cat_test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index 94cfdba5308d..e1b30ab4cef5 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -291,7 +291,8 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
>  static bool arch_supports_noncont_cat(const struct resctrl_test *test)
>  {
>  	/* AMD always supports non-contiguous CBM. */
> -	if (get_vendor() == ARCH_AMD)
> +	/* ARM(MPAM driver) also supports non-contiguous CBM. */
> +	if (get_vendor() == ARCH_AMD || get_vendor() == ARCH_ARM)
>  		return true;

As an enhancement could you please use a local variable instead of calling
get_vendor() twice? An example of such can be seen in:
86063a2568b8 ("selftests/resctrl: Fix non-contiguous CBM check for Hygon")

Reinette

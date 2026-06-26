Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB833ADA3;
	Fri, 26 Jun 2026 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782444397; cv=fail; b=mnNXO5ozeuLDxySZIQjNIFzflvOVieje8rNiw3gAGp9NDZrsYxC8fWeBOU3EYf84fsIj+7GcTQrDM+FaqE64sPK/wAhIilGgPe7zoCNKPPye9muojZaVG5FoNcmMBTnHsRqdiAFwA9fnhbAwPGr/5fSZFzrkROLvdTerI3oCHNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782444397; c=relaxed/simple;
	bh=ps4cSeVdUx42gYewIXI9jwj7JThaWtCIgiy3hxG2b5E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tK/KBeZXHx6bMDYoqeQ/vvKcAW5EuAyV8ZsBF6z0Yo5d+4q81LZChbQa3bbRcmHMNgxaEheihQC+nmNh9NIatO7ALMzJ9ffNHDYF+C9W6rxPNTmntiUiondOvKfWtLVLGUnPC4KUAg8e4TRFdWXnGL7XEzZifz+T+PP+JceMJpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLaom782; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLaom782"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782444395; x=1813980395;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ps4cSeVdUx42gYewIXI9jwj7JThaWtCIgiy3hxG2b5E=;
  b=cLaom782HJ4hMUK5QaBxcSQIDmCCIRmOC7f2Ij8f358HGMsm7ARUETZF
   4EVB+gqiDw+tOFu1SA6weMU0e5D76PmEaJoq+2mLvH5sIj+xpsQPVaxlX
   t31ebF0w8dO0rQqLzvm6UeSCEZ1wSklI5c0msz5nS7iMDLIF1wYLmCos9
   cYiG4i/8afEMiJeRFl1Nmd9E+CJRFb7SGPhQ9JWA9VL+1JCRFGQDDRkrd
   v2fojsnC8YUxcQRryoKY+weK6QRWq4JnRLNxVJkAiEJ38V1BYVy7Mpxd2
   +Qo96xbjQA+IrYjDisLLov/wY1PiIiwiGq+4bxR3mpVRPrGO8hUvNw6bY
   Q==;
X-CSE-ConnectionGUID: t2STDIHySsCkK3yON/sULA==
X-CSE-MsgGUID: gR27zNrTRzK8HRUjavJJ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="82231081"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="82231081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 20:26:34 -0700
X-CSE-ConnectionGUID: r+JmV/WHTGW4FAQrCRccAw==
X-CSE-MsgGUID: h7OW4aEWRmeWUAO9kR1q6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="248587358"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 20:26:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 20:26:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 20:26:33 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 20:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uasKIJX5RdwQGzgaf/p8z9EFiv4YsejIOic4ZdLCnfiApIIaQVEsiMCbZBJmpDwiPe2xqoKmu4uiYyem4gliVweGbT55t5VwZOXrEpJ9ZMT0DEycKwpXCsJmJ3V/AJ5jQhn8S31L7jNrlY9dGE1fLFbsaG0vzLHvFrmSJhH5cg0C2PBANs/oU8wXqWQ+HR9oW/ON9IafatTMY1qjkn8jiodTP9CrZBSf01bUWFILtLnY+EHivmUA6B28yHN1zePh6mAzwdwqFvGd3IHET6X0FjKtPQoS/mJtuJuRkcpPdc7Zb33HvodMd/vzpgT1RRkkaI7L8wXUul3/ZPt78PNjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIv5bKZfpQBRF8GBNKXlK7uG6R+L9JvUCOZ0yzeFWpw=;
 b=QE9ZYYCz0MmjAeewg0LZbz7YKp029xTKHdWrjjl5s6GQCLDQ/oyuG7gL52TliGQ30/g3Ebr1njb5DfnFVt+GeRMbcGAmPom0Bdh7keUcWLfO60E+SuOffX3btg+jPeA+FqTBNIB0fhmBU2h3Ji4T2ethsD4Ed9TMNGh9MOiQg5orvtmv5luJ+7LD3qVfptgnNSsCQiqckW1gCvfnPx69ROoiCNIQminu/EdTF7S1MyxjG4bQ3hc/HRE0W8wSdGNCI167RyyQgu/RnZypr2fAJ2BqEKDJnRU4Uvy9/qyu1x5PCzf0qJoihxIl8LYqou+L69gjOxVsMoxbpT/4vh1DPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA1PR11MB9850.namprd11.prod.outlook.com (2603:10b6:806:4d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 03:26:27 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0139.018; Fri, 26 Jun 2026
 03:26:26 +0000
Message-ID: <8d5a7235-f75c-4266-9deb-44465ff3fe42@intel.com>
Date: Thu, 25 Jun 2026 20:26:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.com>,
	<shuah@kernel.org>, Ben Horgan <ben.horgan@arm.com>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<yu.c.chen@intel.com>, <fenghuay@nvidia.com>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>, <kaihengf@nvidia.com>, <kobak@nvidia.com>
References: <20260529022352.8308-1-icheng@nvidia.com>
 <20260529022352.8308-3-icheng@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260529022352.8308-3-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0097.namprd04.prod.outlook.com
 (2603:10b6:303:83::12) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA1PR11MB9850:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bab1a8-2d9c-48d0-7942-08ded332b496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|6133799003|22082099003|3023799007|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: XH6C9YuuqnArOPxMhSBoA3niaSoKSaY0+vw2Q8WBQoMEMyL8SYlO6lLVKwdzwX3D4HQ+Jw4dg7s3oFDt1x/5mBH3zT0pVDzDYSpXFNVh+Bbvcpl6sHF8ZoH8LaJbo0zjHeUiNhBB3oQvTte4FuMkGd0dE/tpz/vUYrNp0zW2X3K7mgHuwdWDSNV7SvIRjinRAc8XS16XPGe+JCViRdOWarSiNL1OtWx7mu1uoliAQSxGhFnJ/XVZeajUfm9fv6o1Hrxkl/hUSAXYyKdAvzUFhQNncsCkG8KdPLOPgTnJUbrZ3ymX1/aZwOoX/85ON+UpdAQXaMCTao+6MVd2PEecedzA4ZdQEuQEJIRwGrANwkBzXOPWGOb05fE8hBcPWvxKw56PhAQQ88XH8/0oI8bGRkopVcaDvzTx2cujy3rlJT8ae5prAAgYRMfYdAMvGopgsOqOkEcZ4ty+ICF4dTNv6RS/ZLiHURbwrkur7nHNl3EI/eYATC77pX/Y36UYfVaLG87Omv9WIvFIK4BHBt0/jo0/ymTvXlFQUmGnvXUUta3u7uzplWQyXipvaodqFZxZYIfauPespt14v5o/WbAocV6rE6ABzZko34kJIpncEAdr95YEEUKNPdVhhhhxJshORkWqzGzxCmpwKY3Chn4o40GI7zPSUr00M4Z7Zb1xc3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(3023799007)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlgxVS81ZTl1czF0OEs5K2tMTnJ0cVExRnFaVytOOFR5bkRpRGwxTDdZZHlP?=
 =?utf-8?B?TUkzakZTY0NGMHU2UFlXL2xkYm9xdE5VdUtSRDM5aUlQTUkveXdIaHBwVmZJ?=
 =?utf-8?B?Q3o1cktVUlVoVVFvQWtNK0dZTWhRV2FzM1Q3eFh6QXpORld0dmFZNmUxQ3Ur?=
 =?utf-8?B?T1dtSUhQZHFuRzFjT3BjTTJydGt3Q3VWQnRCeXVPUnRLdzdGNWtuUnduVGRp?=
 =?utf-8?B?WXN1eFZuN0d2VmNEOHpJRzdLT3BMVjZQQW9ZWkZLdkhKNjFjaWRzeUpBWEQy?=
 =?utf-8?B?VDg4RTR5V1ZXdHJaTnZjcjcyLzJVc0Z1Nno5TjVRd29oem9VV2NUbUNqUGJo?=
 =?utf-8?B?R093Z2hVOUZGZWRIbEw3MkFkWDhRRFJ2b0sxUDNIQ2kzbTM3b0pMUHRrSzZP?=
 =?utf-8?B?R1l3eXM2YklYaTFZN0xaNzNyR3UzTVN3SHdCNjVHQ1JHcXBvYzhBWE5UMFMw?=
 =?utf-8?B?NlNPVm9EalB2S05LM1pKN3I4T0VSSnpBeDJ0YlhTNWNlWnM4RVFSclBlN1hx?=
 =?utf-8?B?eitUNHg3YW92TW92OGlIVGRDODQ0RzQ2S2crM0N0c3F2ejEvOTQwMXZCTXNS?=
 =?utf-8?B?d3Nrekx4QU5mSVBlK25PeWxubUgzWDEyNDdnWm9ra0xiQktxWlN2MjlkRFJl?=
 =?utf-8?B?NCtvL0l5SU9rSmM1TEVEdHhlTGc1QnB6QkdSczNPYU9HQjA5WExaZXJhSHI1?=
 =?utf-8?B?RVZmVVhYdS8yanFENCtlQWtxUkJJT0RIVzFOeHpqUW14TjZiNWg3aXVRTEp2?=
 =?utf-8?B?d2lIenpXYzNyVWxkQy9ZY0RHUUtUSlpwaTAyT0xFVlpJbjhqQ1RRaG5CMGJp?=
 =?utf-8?B?M3QyQTMvZVozNkpjRTJDc3l2UWpzNHQyanJVdlVkOWtaZmx5WENGenUzdTk1?=
 =?utf-8?B?STZDRW0vZzg3MjN1TlZXWlFtZGJ0a0Uxd05JU3plOTBUaktvdmMzOFpDaURa?=
 =?utf-8?B?K0NHa3hHUGZGbmFNb0h2RXdHTS9TRDVXWXRkOFJhQWIzOWNQR2VNb1pSMm55?=
 =?utf-8?B?MjhXam5PakFISDlRdzVKaTY4OTVYamZVWHRBekxVcDNQaVVFK2kwY3pjU1lu?=
 =?utf-8?B?OEg1aG5VbG9UQy9ZSHBndHh2YitoYnFjUWEvcG9CMDN5U1J1OHRxZ05xTFJq?=
 =?utf-8?B?MjdWNm5WdXJyQ29tVFhzQ0hqSGRyZEFZLzN6MjZWejZja2Q0RnZDVVhuYTdN?=
 =?utf-8?B?N3paQ0YySm1kdUpEOU9qTXBTVkI4Z0E1MDBSNHdNUnU0UlNNU3ZSQnI5MDR4?=
 =?utf-8?B?amEyb1I1bkM3QVR6NENHdHZWM3kwOTJsdktwOXFWOTRNMjdsdDBhRTBpZTlI?=
 =?utf-8?B?bEFveFJ0SVRrUVdYb2NYcCtRb1FRMXI4TnkvcXM5QUNmd2RuWncyaXBPYVZF?=
 =?utf-8?B?M1lNZ2lRMWQ0YnkycUk1VU1ySDNDZ2JuWDhpczlmdnMvZzdSQ0dBYlZzNlZ6?=
 =?utf-8?B?MXExVHJETHJteWk1dEp2cGpyOFlNNGp3ZjJYOWc0aVJsT3QxcGVHSi9NQ0tp?=
 =?utf-8?B?REZqUzdoTjFVUTlqcHFnQlA3MCtvUHgrRDl1UkJCU1hoQUoyYUhqTXByeXB2?=
 =?utf-8?B?U2RNbnRYSVJJQi9ja3dQczlXN0c4NGRqQUFPMjhscjdvZWxwejhpQ1VITjla?=
 =?utf-8?B?clFPS2JtTEhuNTN1UnZoekRYVTdKcW5Mb2JoT1Nvek1Cam04TFNiZ3RzWGx4?=
 =?utf-8?B?aksycW9OUjJDTzF5U01zZ1JvWGJQQ2RvZDNkend1ZHpvRjlqTVQrWVJVN3J1?=
 =?utf-8?B?L0xkeG1aSGFQK1M4U1E4ZC9VRkdUMnY4aVBwOXhsdDFPeXJoTzlpcnhuOE5P?=
 =?utf-8?B?dS8vQU5heEYvdS9HdjVRUFo2ZTFpYkFHV3Y2M3hPTjBEQ1hzdDNGeHgzdmhB?=
 =?utf-8?B?Qk5xdS9ha1F3djMrN2ZkcEZzaWJOUHZsUzRNcXZuak1hS0RaYm1iOXJ4Qmdx?=
 =?utf-8?B?Wm5CZURGWGpZeHQ5YUxBbG5DcnFQOW1qblY2elRqNUYyUytPY0xubFNkd1pl?=
 =?utf-8?B?LzBsMmpKNjRVK2dzdWFETTlZOVIrNXFSN1g3ZUVGZlpqeVRlcTEvcmhHbU5C?=
 =?utf-8?B?eFRMYnFzOEZMN054ZHk2YlBLMGhWTTBLTmh4UzFpd0dBYmVRRDVaWDhFSVJo?=
 =?utf-8?B?RmR5UXFoMENOQ3BMZTFaa21JNm5oNWlJcGordkFaRTJVdlBrZkVEMlY4d0pK?=
 =?utf-8?B?YndXdHllMHZOUE5QZmpOQmp6SmpwUm1JU0dPcWtEZkpxMFZtbk90Mkwwd3o3?=
 =?utf-8?B?ZmZ5eTFxSFZxNm5Uend6dUtVRWN5Rk9ibkZUcktZSDI2U3VIWlcxWnRNbE9h?=
 =?utf-8?B?dTNFRDg2REozR2U1bFJEWlkvZnVtVnBndi96QURKY05xbmZoeEc0ajM4ak5Q?=
 =?utf-8?Q?ErdcfoWregTvN+p4=3D?=
X-Exchange-RoutingPolicyChecked: jIrnARLBhocvYj9sEhnPu32TBxAmyqPtaprpfmuqs68d7kWQnik1AdPa3heyiLZp9ZjdibjVkd5NaC9JD9L8xSA6CivY9PWCz6ZuUx3dqVSDRuUH8/rQyuWMgcsOgtqWtYgkE77AbY9mPrEldzZGEmmOpsOx2dE/M0iLwtzKpfLHTeTiCa5g0AcaErsiMhP5L7YPNkbT4YRxJYd8Cm2jtuK4WGWyqVs44kwyb4amvpZRbB+CKf/EQCUVvjNSdF1YjdgC43AyfnF2z1/MpE5J+EvWATTcFK04lXDS78MF5q029TASWm3/C8sL5gGWbI77oLOvGbMl5q/EhBsV3D2Tyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bab1a8-2d9c-48d0-7942-08ded332b496
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 03:26:26.6029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AnX/BNngIV5nbfBLEagcCOsz7eKxQCHsBpYS8vFyEghLrd58WGJHupfWvWxEo+c3B+ayBM5wMgbNPTRH45lQIJvU5ZxWKLSbZdNPEDqy90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9850
X-OriginatorOrg: intel.com

+Ben

Hi Richard,

On 5/28/26 7:23 PM, Richard Cheng wrote:
> cl_flush() and sb() in fill_buf.c only have implementations for i386
> and x86_64, so on aarch64 both compile to empty functions. mem_flush()
> then walks the buffer calling a no-op cl_flush() per cache line and
> finishes with a no-op sb(), leaving any caller that expects a flushed
> buffer (e.g. CMT, L3_CAT) operating on unflushed state with no warning.
> 
> Add an aarch64 code block using the ARM equivalents:
> * "dc civac, %0" for cl_flush()
> * "dsb sy"       for sb()

Calling on Arm experts here since my superficial check found sfence to
be used for __wmb() on x86 and the Arm equivalent per
arch/arm64/include/asm/barrier.h appears to be "dsb st"?

Even so, it looks like the changes below were considered by Ben during
a previous submission but I am not able to tell if his feedback was taken
into account here.
Please see:
https://lore.kernel.org/lkml/4449219d-186f-4b5e-9f72-958d1af80f58@arm.com/
https://lore.kernel.org/lkml/5aea412c-9c7f-4692-af3e-79937956ef8c@arm.com/

> 
> Both instructions are EL0-accessible on Linux aarch64.
> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/selftests/resctrl/fill_buf.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
> index 19a01a52dc1a..a41d21e5a64e 100644
> --- a/tools/testing/selftests/resctrl/fill_buf.c
> +++ b/tools/testing/selftests/resctrl/fill_buf.c
> @@ -27,6 +27,9 @@ static void sb(void)
>  #if defined(__i386) || defined(__x86_64)
>  	asm volatile("sfence\n\t"
>  		     : : : "memory");
> +#elif defined(__aarch64__)
> +	asm volatile("dsb sy\n\t"
> +		     : : : "memory");
>  #endif
>  }
>  
> @@ -35,6 +38,9 @@ static void cl_flush(void *p)
>  #if defined(__i386) || defined(__x86_64)
>  	asm volatile("clflush (%0)\n\t"
>  		     : : "r"(p) : "memory");
> +#elif defined(__aarch64__)
> +	asm volatile("dc civac, %0\n\t"
> +		     : : "r"(p) : "memory");
>  #endif
>  }
>  

Reinette

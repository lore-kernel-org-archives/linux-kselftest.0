Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38DE36403C;
	Wed, 12 Aug 2026 18:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557787; cv=fail; b=oH0TOch7LOVfD06zk7+b0ID9ywgdrNoU7KRj0qoOh2XXBB9+Tt24gaWk3iHvVdNf/lbEwduf07Wea1CBzRzNdNnmC9lpx+Nd8KfADPXsO4mp6ARFqRRcBFElce1/3dDBjNtPd9oN3lYN9E4mtP3SmD0HyVVpP7tCEBjuX4rZGF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557787; c=relaxed/simple;
	bh=8zE6kiguBDpTred1Fgq95C177OLmGaXeZaflWcqxE/c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s+qcJiMef1YWu2vwmJpBGse7d8lCu2qoR4Af4zOl0aecLdwmuBe27csXPtGZpiKPnZ3TyWOrsjEM85LrNu1OY1ihTLeQV7zQc2sp4VB2VTLwy0UCKCy+Nhv6b+tSfQa9bDvXtZ6W/jgpK0GOMymYwGOOCQcl4iJuCpreCFKjC2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNApxbkA; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNApxbkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786557786; x=1818093786;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8zE6kiguBDpTred1Fgq95C177OLmGaXeZaflWcqxE/c=;
  b=HNApxbkAgXWXevZwmbS3+kwKdq6PrM9DiJfL1rDtddPNCpRy1Ni7XosU
   pSz+eghVstGTMBAwRu9dnLSfItw0AgH3D8kJkPd0eTEW+FU1bVMovkXcD
   Ri55mD1o31Qxe2GIPBnIX67RQUD3rruryigwLkL+OMhZ/TzNDLUNqdkFd
   wRxyEPAh82G5uPqh8MOJqy9i+6dunuJ2/ZrvZ9KiC4fCj9QT+xl5a9Edg
   kmLlgcvmizi9BDo+h4V0hwlpLJfkZc47m5oGDf9a4JasiMiFAV7Hr1sN1
   ZBmd7tmVy/cHCrh1I7V+lBNVnab4myu607m9Pk1YETKUMWMWxyk1bQceW
   Q==;
X-CSE-ConnectionGUID: h4+LWaUDRWeHfG6GY5S6OA==
X-CSE-MsgGUID: 976t6FQ9QhiRmiBAK9NRJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="90801007"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="90801007"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 11:03:06 -0700
X-CSE-ConnectionGUID: gCGvI6cVQHWPwF7KjyTIuw==
X-CSE-MsgGUID: bWKskkaWTTGINV0FfLU07g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="267213625"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 11:03:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 11:03:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 11:03:04 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 11:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phFPTnmnVcQ1uRThJMC7LXALxC5GbLWnfgFam48rDQnRoPNxsyMy+oGnkK2CRFaBywdl0KT2wibet6xpXD9Qahy9cMBhFFEjpINvaP1Bc4fj7QSpckzK+HDWufweKRNVrFkR5YB7jvXUzK4kw8i6jYjYxXIcgAEI4srTBhnd8hZEogUgnduqUg/TNCRbPRhhLG7e+aL7WGzvpOHxk7ShKPqdgyohogQuPxXnMoO2Hld9yFBwS6NKezBl4PJ8xbndZf8A8r1XkyEP4SOPgT4OUqSgfsK6dn1Dn2GxQUWOGQkrCYrv2O7xAtAC7MAljPQRjrSlFM15D93r0YRJ/BYVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWeUqFUPuAMvF3Wa/REa2XuXtxay6RDgrqoCBNlnl10=;
 b=C8RmTgYVPrtmBgX/H1sJa4zGkFFD2gQKWThDOVFxEqc/pgmM87OSPNMbuoEOsLqU7Gfh0UtJXb26P47B/pq8JXu469tmGYBPCRYpgXq+k4WBInceHvadvm4tRNUNoR7Hcs64s6eeN+VSJBSpekQVhkVriidNgx9JPg2iukocpjn09jJbzXph8h8XDdAm0j+Ogpn265GO4hWjCD3+Yj2vo7BpIVp0umEl8JWj1a/ZuuvPZVYqZCCGn5XERxH4C6nHha0Ggwh3H+b9Qe62mYCVso0e3R8duLjo3Fi6BwZC0i2o3e/1KydQJABGq6ncQbvH0KP5L2zHi3jgv6yW/mZMkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CY5PR11MB6486.namprd11.prod.outlook.com (2603:10b6:930:32::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 18:03:00 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 18:02:59 +0000
Message-ID: <0fe3a409-cce3-41e8-90ae-84ee3dd61938@intel.com>
Date: Wed, 12 Aug 2026 11:02:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] selftests/resctrl: Run the MBA test on arm64 MPAM via
 the NVIDIA SCF PMU
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.com>, <x86@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>, <kobak@nvidia.com>, <kaihengf@nvidia.com>,
	<fenghuay@nvidia.com>, <ltrager@nvidia.com>
References: <20260722021303.9471-1-icheng@nvidia.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260722021303.9471-1-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CY5PR11MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 8096ea4f-9175-4b66-e5de-08def89bf191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|22082099003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: fN6X4iVT9nm8DBkqqZzQHubYnIsO7ZPixK0bxE/SVFq89d7bsN3Jes/HJTlVPJY1k1FxOLy+tILKEcK6uh1VskRLuA7xSuCs+4uQNgA1mIQFdl7UegSN+jOKn+A8/IrdKghWscgRChAlfdfdKrYMYfKrvtYwagxMJvS7e7s/6nrWPPsgfSQ0wTnEiSXVLacDU6ahdsgF5+eJSQx4O2md/lmZGc+fEGoB/Tjs/mrPXsSnPwqmTJy0irnkzPSmRYcM/fQ5bBr1R5C/it3LOa6HlGF2YxUY62WIg+/9KAEjCznofzNYeKMWEuqTnkjbOhbJcTgOek2ZU5ko6MZiWM9hZCp2xzKGyIGlbwysaSeUYEEShEuUd9UqqQufKRc7L2fFzrJ/KWbVamzfMWKk+8+EHiDHWeBE/LK1wB1j4B3m7mNgfU4VgA2C/iL5DhtANUTVVDSF6ifGpU4ZCsM/ShhXSynPRoJzmHxGkF0z8PVIceUoCi1X3Oo/1nYI+g5t8Q/MSyDh0w26Q1BRjmpS9Nknr0UQ1jGDGJQ52BpfdcmYsDv6giRPropRHPQIlD3myTPmJliKtku/OyQGW/I9seb8iPvZcI5oXVDVglYPBcoQr9+rtEQxEGPrNTN1l3oVH1wFUskwMtd0Zmy4MG18x8o8L6b27lyBG4zc7D3E0jeQYSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(22082099003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzd0RlRFbHBUOXdnVmdKS0ZTSTJ5aXk0VGk0bXRLalRCUXhUK2cwWkRRNlk4?=
 =?utf-8?B?Tzgxb1hyZkllN2ZKR2pqdzByUGxNSGVLU3paOUZkVWpCbHBtQzhxa1EvVXFQ?=
 =?utf-8?B?bkJESHpOVVdGcUV6dThWdUE4WEMyME5TOGhmcklmekdwQmpVT3JWM3lUdXND?=
 =?utf-8?B?aDdQMTJ0aE5CL3doM0RNaVJEM2tmakxzRzhZaHJNOUgxWkZkK21nRkFub0Rn?=
 =?utf-8?B?a2ZoYjBoVjVTaVZ6bzI1WVZMZjZOeE1nWlpITFR2NktMN3g2U3VMNWNUWDU1?=
 =?utf-8?B?OGFTUWpQdWdaalM5OXNSb2p6alpjenFzR1AyTGFISmNEVnIxSjNVS00zN1Jo?=
 =?utf-8?B?aHVCZG5jYjZ2UWZiVzFVbS9sdm9zOFZtQWVXRGt5d2lqYytKNTRoOU9pZTRy?=
 =?utf-8?B?Qmk1ZlV4WWVNYjNWQ3YyaUlNOFRpV2tQRFRGckhOTXpUWG9obEdkQ0pQSmdK?=
 =?utf-8?B?bHg4eHdESXhWaCtrUHVzeVphejR3MzJXd0ZTZ01iMGlBWGFLa3JoODFZbVZN?=
 =?utf-8?B?SWFvcFROd0FTUzRwY1UvQjQ0R0JOTFF0ajFwOU9TNldDZlhUbEhuNERUZ0sv?=
 =?utf-8?B?VStHaUhkY3Yrbkd1ZVc4NUNmY0oxdStyVUhwNk5hckcwcTFCdHpKZGs4am1l?=
 =?utf-8?B?SWdXODBBR0ZSMG1EN3NkUXErQzU2SHBHUWJ0S0ZoUy9rbWpJRnZBcHlSNHZ2?=
 =?utf-8?B?NjRWN1phdzIzWHJERkwrNmN6TlhDWlRyZjViKzh3OVpLS0FVSndYV0x2MkVs?=
 =?utf-8?B?ckhMdEttYVZNa0o3bjRUckl3OVFpWkpOcDFKYXE3MlNDSjlNZWR5TEMxUUlE?=
 =?utf-8?B?U0RxZUorckE2Y2ZhTUVseU9lVVYzaHVYRDNIbFh2cEs4ZnhQVnNOL3l0K1F1?=
 =?utf-8?B?V0JxQmpMRzcxUTJTdkxJK3RHUE40ZXRGVUFvWU4xaldtMlpQVm9LNTlVUjRv?=
 =?utf-8?B?OGptdzZRenFVbHlpWFZQZk5nWkx6aWdwdjhuWnZvRnNnNUMvMEtnOEZLaGlF?=
 =?utf-8?B?SndwS284Z0tKaU0vOHpneE9jRVNEU2J2c2xVZWI1WVcwUjd0emdkSjNYOGpj?=
 =?utf-8?B?cThxYXE5WDdZWmdIM1RuL2htWEFRT00xNkwwaEw3N05UbUFFOHNqVFAzbnhG?=
 =?utf-8?B?TXgyVjNMYmRUYWQzY2RlZzg2NDNIV0lMRGJJazYwYVpTdDhqM3cvWTlhaXox?=
 =?utf-8?B?cDVzRnVPcXVadTlienlwZ2RQTmdlOEpySEJVemRKUFY5U1ArVk1ZNkFGdlRs?=
 =?utf-8?B?M1o2UXN0QmsxVEtJL0l1ZVlPWGVXeXRQNTBQLzJNK2J4QlhvTjFXaUdyMjVP?=
 =?utf-8?B?eFMybno4b0RYaXpQZ2lOcll0WHlldU1CblpIOTIrcGtUSE44Ui9lSXplcFN3?=
 =?utf-8?B?clhTSyttekdobzh5M2MxalkzZ0pNQWtXY0JSZlVjNkg4ajVIYzkxeUF0QTNH?=
 =?utf-8?B?RGV3aU1Ua0pkOTQvMHZLUDh2RXNtdndtb214L2ZFMklUSGRMK3N3MkFrUWVU?=
 =?utf-8?B?V0FTTU1ZMmhsWXRnN0Rmbk9MZmxJTFZRcmwycEVZdHgrMVNOOW14RmFiMnF0?=
 =?utf-8?B?M3NQeXloRzg4NzFsUWd2aDJiVDQ0eHNncnR3anhQU0NJcXBsN0FWdlhRQ3dB?=
 =?utf-8?B?MWRSaWJoUnFITUhNTVl1Z3VJTFJFejA2RzU1amJwVUtManBHTGRhQ01GaFNm?=
 =?utf-8?B?YzR1enBQdGlob2tUMUdNYXMyZkJneGh6Ump1OHY4eCtodzhITVJ3d2R0Qm04?=
 =?utf-8?B?b3puYmlFRVhYd2tHWDFKYUdvSEpidWRzV2p4cStXUmI1dGk0M0pOYnlsQkNj?=
 =?utf-8?B?aXM0YmRiZmxKSGROVDFSaURlQ1NjNnB3TUs2M01kdDZncDFrbWZzMnIxMEE3?=
 =?utf-8?B?WWRIOXUrODFIVisxSWhESmRkZi9ob0xobEJlK3FIQy9XVkRNOEg0aTlBaWhx?=
 =?utf-8?B?TUJpblYyR2h3T3lCZFBxR3NUbTJIUm52d25NS3RyTVhNSWgrMHQrMkNWcXpm?=
 =?utf-8?B?TjJDS2s2ZFM5NWpRajRpMk81aHVjY2pqSFptSVpmT0pHUElwa3EvL3Y0a3RT?=
 =?utf-8?B?cXJQREdIU1RJN2dvbXQ4MTRab3hUTzB6MXg4YmlpemFGUVJqSlE1Y2NhYnNm?=
 =?utf-8?B?SmxRaXpReFZQRGx0MVFPcXNUZjNqVVg0N1daM0dtUGJRRUF4RzBLT0xFZk44?=
 =?utf-8?B?dDRoNDFqV3VVTTZTRFVXQTZFQ2dPNnk0YWpHajIzNmNuVnRKUVpZYWp2R2FF?=
 =?utf-8?B?TGxYZGVRYXdheVAvbG9NY1NJTWFGUG85aEllOHBBdjM5V25HcCtUWGFHS0tF?=
 =?utf-8?B?Y203RFMweEJtMGppd01Zbm1DdVoxRHAvYVFIMDl4THkyYWhWNjl2amFMUjVF?=
 =?utf-8?Q?QrUApk9Kio8Fqzok=3D?=
X-Exchange-RoutingPolicyChecked: CLMi2IjF/HS/QxRVqIbwrGD7XUHBD5Zo3WDvfBSVA106m3no6zDTrjf2byduQjVGAsc27FpNuLHndnY2iSn50zJmn1HdJX8SKH26EgcMlvtT+vBGvLzRTOVxzLFviw/yPLJqWGcEFi53PVr0VwLhJ5rVjJJ+sjgRY/Ayzxlpccgq/3JkIhPtQaGPmLceS2ntNRPSL36hcQYqjNlHDYmLMNDpxmaR+GRXFFk+HWX3F1wcfZvAwwrHIewiVASlw+vOYjUq5Mqf2f6XR8oTKN5vV0wHNJ/XVu9DFC/SOlAM8cm4w6Lin7SqJ2ceVFghLhGx4pNRHU9CsH1h10vcSzBLRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8096ea4f-9175-4b66-e5de-08def89bf191
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 18:02:59.2141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dD6O1g5JIfyYH371ZYIvhxeavPSheVAY7tonGJARpmiIBI2atUiNw2Vz9+2Z619dF6naSKVHi2H0IgcsC1OijjrtnXfgwjxdDDuew69/7BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
X-OriginatorOrg: intel.com



On 7/21/26 7:12 PM, Richard Cheng wrote:
> 
> This series applies on top of the
> 26.04_linux-nvidia.glue.others.cpu_less.hardlimit branch of
> 
>   https://github.com/fyu1/NV-Kernels.fenghuay.baseos
> 
Appears to be another [1] escape?

Reinette

[1] https://lore.kernel.org/lkml/b2928db3-76b1-4556-b0fd-8278154ddf2e@intel.com/

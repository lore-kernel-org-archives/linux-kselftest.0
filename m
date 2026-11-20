Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795215949;
	b=VMNKNgr2czuatrjGLIUfP6Oc07P1I50m+gSi6dYRtkeNsr6CBHmE8vfANFYVaAesW/0w
	 1zJkDhYXdT983f59zAR31kM7S3KnbbJ60LHl3RvOzfPmJDtOvlYWOrfVWvP0GXf3PGaCA
	 A5rNFaSETFQ0a1chOs7CGqORP44tLpixO9h1uO525NoKuFp0gmttklRDyLgHKjveKlyvL
	 aAmD209Klp112u1j65ZiDtZF10FApMFrorPz2aHvRAiBSnCmqccYvCQkmYq4V+4BTLNIA
	 ioqifoKwwshPq+qyCB4sIMLnTZC7CTtXS7rAwusCgklVnZ//Z7GeScflZq+1sDdcAVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215949;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 From:Subject:To:CC:References:Content-Language:In-Reply-To:
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
	bh=y4mrT02J+rBu8ckVtSvDQ+vhBu3pPC5G8jiFFJp0r4o=;
	b=BqADkUxSviD+IYY9WIFJj6MbC490zv4fi62OsfWOgV8zIZWRnbZi+fcUE7nwcMWO8dmm
	 9lji9ypiPSHCjQ7mqk/oxf9IBFk8W5tBv2OUlcRuh0uEft5m6VVM16RoaAcvAQqAXOwqK
	 G6c0abUtJTvHCR6qp//RbTZ9KsSuT6DvjjzkR1L5erT+hLyzoDQwhsTnCAhhLhvnwp1dq
	 WK8uMZsHssHEPo3lIlfVNhuu8APTPOPIKr/SUjSvmMZYGRZrg99qrv2IAfzvpTWWdmWVG
	 V4Ux8u/b2fK/tCKZM4fMfjZgbbDTlaIE/9PWmrwtyTMjG5wkc4STgCB2g/7GwTDFupg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hrPoL8Ww;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=RVqHfPqb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A3C606A69F;
	Fri, 20 Nov 2026 23:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A3C606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hrPoL8Ww;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=RVqHfPqb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795215949; x=1826751949;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5ND0BOQ8sZ/McOApmqwPWx9qa1zGIAGxo+glyT5KflA=;
  b=hrPoL8WwFyi8YHsRTvtgwV8LnmDXdls6Z02SumtzhL8teGYl4xnGqm7X
   Pe2T6UNfSJEId8EHQkTbHcU3GLUe1D5Tr/p4c64TUzIdBOYMSTXzakj9e
   pyoRYJiCE13pLRcLap4HG83BKsasB8o6W4cUPJ1EGGow8VPjAqGF+axyF
   WRqDwA+VBjZ0/CW0TneCBEOWVEIZt1FOwa0DqQLCoZPJ0BC4KLpPUYTxE
   x2mSe2Di6XBfqEVdmocBq88gEsIVZ16rFECPVywxZSaWiAFQelg21TTa4
   RkUzdczim+3nVepc5FEPS9knQMPl+hKOPv+VUnM2y6mBMUbJVLm7a0RfG
   A==;
X-CSE-ConnectionGUID: nxrv4VbFT4WQN8GZ1kvZAQ==
X-CSE-MsgGUID: WX88wnOVT9m62ilI26WyOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4096895"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4096895"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:05:49 -0800
X-CSE-ConnectionGUID: jdhrNfVGSJqdQDi2iOUqqQ==
X-CSE-MsgGUID: De6AT4ZaSKCr9bdA4edxMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11130237"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:05:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 15:05:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 15:05:47 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 15:05:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nH5rcdIYSh1AluGyRFBoZp0Y81qQlmfCpbrlyflQJDdUaikzePaatO28a/o9asYltMCxBp0fkshikDR8Y5spm4UqStpVObijFIUmmf1erYdl2unZEGdi0IMgp2R0jtxw4rRpnaMh1ED5CMIyK8qBKp84rEzPcNBcOvfmg3zwNojBYmMOwMKjD4960Wxc5YGIDPr2x1QL3tnlx6COiC8LEl/Ng2dZTOIymx5DwRUyx8v+Hhu9Bqthx9g6yNOPtKNdUZjFWDH82JvRmQ7T2WVhMhaxGrStz+3S+4j9Nz9uobA5BCsu/etZ7Dpq3PAXzyrtHPS0jczrGFQvHsF7/gy8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4mrT02J+rBu8ckVtSvDQ+vhBu3pPC5G8jiFFJp0r4o=;
 b=x2IzMEzLjCS0HBjHx7npobR7RplyNxiGmSvilJn8eGMDapsORauoJPuuk7iJcxXILBJNHojs46WcSp8aMzV7HNhIb0PXi7Q4gaCz0ttjomk5D26j+iiVVNWp9Q8M2TIqihFu3kG5T/rsqjvJxHFfyxJKGuE3s8CQIbl6rJD9lmc9gqE6SI1DUNskqN4/M/9r3piWDqXQukbGUUcN2qcTrzvu4RpXPytNCZj22csqSHoqtq5Rt74mSYHYwyzR3WNVYqgHd4PnvdJrIR8BcerooVYQBvbNiQ+Lw/qSv4qN0g99xUJnCQJTnpI7mLKhHnowzeAF+d/Zj9m43tbAhlY/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4mrT02J+rBu8ckVtSvDQ+vhBu3pPC5G8jiFFJp0r4o=;
 b=RVqHfPqbNbGKpoz5VrDsrYAHxv0v3aZOVgQ2iv+LwFz+IIuhnoVfp0xj3cDgzJXJLnv/i+/0E32ZlzRcjDaxzxAXCyZ+L101eZ/wb5LS3ESn3ZKrH2dZQ3N/i94qA+ITHQ7mFMbLtuJncm/RR/YDj4sPbX2fPTZ5HYz6/Przyqs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 (2603:10b6:806:518::11) by IA3PR11MB9276.namprd11.prod.outlook.com
 (2603:10b6:208:572::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 23:05:42 +0000
Received: from SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2]) by SA3PR11MB819107.namprd11.prod.outlook.com
 ([fe80::e8cf:3b9e:d98:ee2%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 23:05:42 +0000
Message-ID: <fd5b2bb9-30c8-435d-b046-5be706e43292@intel.com>
Date: Fri, 20 Nov 2026 15:05:40 -0800
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH 3/6] selftests/x86/xstate: Validate XSTATE_BV in ptrace
 test
To: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <shuah@kernel.org>
References: <20261110031603.698635-1-chang.seok.bae@intel.com>
 <20261110031603.698635-4-chang.seok.bae@intel.com>
Content-Language: en-US
In-Reply-To: <20261110031603.698635-4-chang.seok.bae@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To SA3PR11MB819107.namprd11.prod.outlook.com
 (2603:10b6:806:518::11)
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
X-MS-TrafficTypeDiagnostic: SA3PR11MB819107:EE_|IA3PR11MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e6eec6-f1a0-4473-2b54-08df475acd24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Wdle8CulrG2+cZFIOZiVQx6P61LAwza88YSkkXQrq/Ssrt1eKDEOtc4LzO4f2J+sloy7hghNSDoIrgI/zrzCConSKpHpgGj00Kv+XKrdNwkNDj045RJoP00tHp7gWBjsnZMfyb2+F2ECHhkifERwgWcZfUH076y0IvoKfUGzcUawRQKIz/yHxyQ0qSb/pqlLMGlrAtWQFuzA4MpnIE5z2dRbYuciaqcy8Mt1dQ/NG9iaEWciNR/P4ZDup38aQu4cNGaj7jlhsJ+wx5qjBaZB36le8MXnX/cvkuwT66X+1Sr/7eRrsoGlKY7IfZlBHWytrshT9tfj7oRC4A9HHgckF24oZqInYCufYLvLJVnX8AATG+IMXvRS3Ej30OBixa6T4GgNsckVhsjTZH1NIzDg45OEpI9a6zxQj8KodxnLvq+1daNPKH1idTeLrWtPnjC5b0W0YqxHsYvfXzLz+f4e+1gNZ1K6q//+7q+M87D1/p7dIzsMqs5e5D5YwnLHd8vOanVitHUWKNVe+iFD0zplz4w5QnWVMHQxsTtp9aeobMq6B98YhuQM4mmwfMbKBeLPw+J5+yXLIF0M7bc4ZUVgVnhAfjbCTpdu17WprE9F3vxqmBRc3Y2bmWGse/nMQvxBq3oV2fZTqalDDw9GMtNIjoJjf01juJRsoGGB6FVWT/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB819107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEpjQ3p0UVdQNjc5RXZyYWMxSzBCYW5iY3l3RDJBNFpEUVFGNGhPNkZBQTBz?=
 =?utf-8?B?ZXZhUGpNOVB2b3czMVM0UW9OLzlpcVhWeTN4bFA3NDVrc3IrUHdYN1BmQUdx?=
 =?utf-8?B?eE9vbjhqVXFRYU5sNmJRek1oVlZPcFo4ZTcxdkFHNmgwekJmOFpraEtiTG9B?=
 =?utf-8?B?WmZBdG4yQjh0RkFyWU9kcEc4a0pocG9zTGpLVkloKzBwSzJnajBaK1EzeFhO?=
 =?utf-8?B?WlVUOWxVSHpaMU5tU2FHVnIwNnZLZHo1bTNMN0pHUFFGOGxsK0U2Q29BZUlJ?=
 =?utf-8?B?TzZXZUZya1M5WkJzWkMxTEMyZ1RTM0tWb2JRU0E3UFdXb1FOd0tLd2ViMHVK?=
 =?utf-8?B?TGVwNm1CRTVNRHhDY3pEcnJDWjBYYTFtelQwS29rTWhyYkFoallxYTN0RVQ1?=
 =?utf-8?B?bXRWVW5hNkl1TEl3UXo2anNEZkNrZ053K0FYMW01ZVdXNHlsUCt0TjZJemRT?=
 =?utf-8?B?UFNMeHZidFBXL1J0bDA5QmVmRzVKVXRkS1ZrMEw2OWR4NjZZbGhTQ3hXV1pa?=
 =?utf-8?B?elZFZ2FCb0c0WTJ1d3g3SHlUMkI2NUFZVHFCbE5ZRTYzc0xlVWdsSTJoVVAx?=
 =?utf-8?B?VWpzTnZmV2paS2Z4ZVYydlhYOXZ2YTBGRDJPMVdsMXBpQnhtQUgwMFdDQ0FL?=
 =?utf-8?B?bUFlZ0g1TkltdjRQMC84S2UyYjBRekhPdUZhbmg5ZlptNkw4R1dFZW1TVUJU?=
 =?utf-8?B?OTUrRHp0UkZJQjVwZVdKTTVpUW5BSTVKeXNYUDdiZEJ6VXZsejQwbVJRdm1x?=
 =?utf-8?B?SFhZVUZudi81UlplVHBPSGZ2Z2NNTnU0bGlUMEI2UzV1aFZuRGE4VnV1QmlH?=
 =?utf-8?B?cVhkekd5MjV6dng2MWg3VDdxN2Q4aVpQSzRnTWExNmQrV29jQ25iQmpWQ1Vk?=
 =?utf-8?B?WjFwQ2Q1NmtaL1RQVFE1ZlBvVGQrOXJ4Wllsdkp2QisyZ3Q1YVlGcWdFU3NJ?=
 =?utf-8?B?dmd3SWgrRkxQSjVGckxvQWhsYVhyL1BUSEdabVVwbWRINkt2MjU2RXJPZkNF?=
 =?utf-8?B?NlpLME1jbkNMZkxKU3JTSXN6RFNvbEhla3U5eW02V2R5WEpFY1k5NkJGK1Ro?=
 =?utf-8?B?QXRsc2RxYTBRempYdlQzZmVzK1NYRlVibGxPMzJPZVV6K3pYQkJiTmZXL1dJ?=
 =?utf-8?B?NlVPcU5LMDJUWU5QeEh5TVNjVEtUUm42QVpQREZuL2tpZUl3YTRPSDl2WGdN?=
 =?utf-8?B?LzFwdDY4a0ZNOVh0TkZXMGo5NU1TdmdSVGhMNEM2VjdiMEs1d1ZzS2ZXRnRr?=
 =?utf-8?B?QzllSHEzbWM5SnpCRG1NanZacldKZ2l3RzZzQWJiUHlNdS9TaVdibFVuODg4?=
 =?utf-8?B?VE9EekZMeVkxRUtCZnE1Yk5kMnExMlFnOTZPbEYvNzVPbEpySHVLTGZKMTAz?=
 =?utf-8?B?WkhoOFQ1MmhuaStwc3hOVjZVVCszc2xsajltbHRCc0hJSURLdU9wVTJ2UWVJ?=
 =?utf-8?B?NG5HVjNtS2RGUlphM014Q3FmdHJPNmFJK0lDbmlOcFF0bXlhTmNHRkthM2o3?=
 =?utf-8?B?SjJVZTg2MFBYa2pCRU12NWF3SlFlcjJqdnNYSEcyN0NRV095b0N4NTA3RHkx?=
 =?utf-8?B?UldqS2lqdm4xaEM1T3dqczZGZ21pd2NEOWc0MW9TQW1MMjBuU3JiZ252ai9t?=
 =?utf-8?B?NUJnUmFGN1IxbnlZamlWRW5KNDJmazZDdzY2UWZIamdKb3FuenhVTDdpYmsv?=
 =?utf-8?B?aUFMNFVFN2lCWG5vVTdFd0hRb2d1c0twdWlqZlFiNGpTTXpLSDR6cnRra25C?=
 =?utf-8?B?eC9rVklGT3Z3R243UHpHR2pFSUdlR0NzdzI5RXl1cnFoVzJxK1dEN2FPOC9J?=
 =?utf-8?B?aTdXS2N4RDUvb2IycEpTWGVLb2l2bklFb2hlODZ1MnVGK2g4eXJTKzVuNzZU?=
 =?utf-8?B?OVhTUE5FZVdwVHdQYUhNV3ZtOWNxdytvTHZmUFJLU2E2d3hOa3FJN2ZFYmRK?=
 =?utf-8?B?WnVaQTdLZWJnSTJKaW5nRUNGWkNQYlhPM1hIOVJtWXpSN3BGVmNjQkpnWkpJ?=
 =?utf-8?B?eUU0QTY5U3BsUEIzaERReVkzcnVTZDBXdlp2QmNzMWpQY202UjhFSE1jT215?=
 =?utf-8?B?U2NzQWVsOWI2M01sOG9sdXo0dHRBU1JBY0E1WUp0UHNHK0lqVDVQSzVwaUNx?=
 =?utf-8?B?RWsrYUo5K1dGQnZZd1lHVXE4U1FqanRaSm5mZWs3YXJEMG9xS3JlUmhDbnps?=
 =?utf-8?B?aC9ZcjQ5RG9NTVFKMWUrZ3JIYlhRR2VtL2ZrVmtNQXVzZjNWUXo3WS8yK3VM?=
 =?utf-8?B?L1Z0ZHI0eHBySTkxQXIzak4xUDlvbE43TUNOWXk5RU9zSTZlQWxUcE5jQ3No?=
 =?utf-8?B?dFJEanJHUkQrSjl1L1lwdFB1M2ZpNVFnVHBaUVdMaTlISGlqaGhNQT09?=
X-Exchange-RoutingPolicyChecked: Lp81wXKk+I7OxbWIXAbQgXdavPJdNYWHWPSR66SdYaaiAW+aFZXCJGyH5WGi2kRlZ55U5Qc9bYJsr/IurYSueS0+bEBQSMPHihay2vOvlYYklowd3Y9yle1BDTGOXRhZ95cnTye1ITTMzZHfh+7qk/McTUSNd6/uPhyk/R+iSHL7lkqwLepKR5I/fq4GZkFvK502+CTsnEsn1ex7gtQhn4cilfg6Y5mzMAwNi59lL7TAKlzJdb96uh2DYnypgpZlvTNJLX1xA4z9hh6V5Mrm8mzeN6z301FLSm56JS7NU/dW6f98CJG1R9Kg/x4Xv4IGcIpmrwIW9JXTXNiZWzFQ/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e6eec6-f1a0-4473-2b54-08df475acd24
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB819107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 23:05:42.5315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LejXtyag6v+oswdbL1HmuEY2k3DV1OXxbzt2MBsQbAWLNFi9qNeie3aKeY4vfJJerf3cUZO04kCGSrqPyovSbIJ+K5SH9xLHOE7x5cc/Y5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9276
X-OriginatorOrg: intel.com

On 11/9/2026 7:16 PM, Chang S. Bae wrote:
>   
> +	if ((xstate.mask & get_xstatebv(xbuf)) == (xstate.mask & get_xstatebv(expected))) {
> +		printf("#\tok\tXSTATE_BV\n");
> +	} else {
> +		printf("#\tnot ok\tXSTATE_BV\n");
> +		failed++;
> +	}

This check looks excessive because of the XSAVE behavior.

If the kernel ever falls back to XSAVE instead of its variants like 
XSAVES, XSTATE_BV may be set even if a component stays in init-state. 
Whether the bit is cleared or not depends on the init-tracking 
implementation.

So, the most this check can do is ensuring XSTATE_BV is set when the 
state actually carries non-init values. Let me fix on my next posting.

Thanks,
Chang

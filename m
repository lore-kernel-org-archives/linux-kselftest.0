Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD442C50D;
	Tue, 11 Aug 2026 23:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786490298; cv=fail; b=lK6/VYsSqKXvKyVqx/eiSjkdR30z4wvCv8qWmmIUjxS0OGluPX9pVJTdP91qRfx2789SlklpiMzVuiYEhCMgTjdrcE4t2nYw6QoswQb28g8unGr8ktQ4Zh8yFo64gBzX/kWD+fBGjmjp1vVVyKHfx877VrZIkXuE1bUdgT7GZLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786490298; c=relaxed/simple;
	bh=ol9UjbaciB7DvbhZakN5JfNn8YYyctddk2nMuG2knzE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hS4LzKfzUTUEmo8yU+7ixUi4xD/WBQ0eeXKc+5Z/5b3AZdHh+5HK3jZGWG+Q+3GvO/e5OHkIkvG0+jSdlgeYvuoAbDQ1uJarLkucsmNQjvqkvr9BrlrANbrygqkTMsdT2c1g+NK4n/wT562l7YmoTStgGXyQp2ZY1bf3tIF8IS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYmM6opH; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYmM6opH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786490296; x=1818026296;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ol9UjbaciB7DvbhZakN5JfNn8YYyctddk2nMuG2knzE=;
  b=iYmM6opHrmkQ4SxiD6ro3JL6kUxNM1uipxE967QgqwEQvWJbiF9ZOqDq
   0UnZlyl/jG5WLGWyDWgfnzspNl5cJjoeML1lqsyErPUiwlOE3Rsq7Ozxh
   xDrKNmfyMUKeAnzkcZ+rZEO5erxZ780XkibosPTln0KfDHdVLTTi0h8yH
   1BRpGsW/lsjyDMWspws/aJzjgFHeSIKh16rSaorYLl90m0/wSyfR7LFRK
   zV9qq//7UP7/l3DEwlY9V0zwbqctr+vbeZEnCHkld6ybdVE03FEzTQ+Ny
   yKgPzYf6Xhd11IFGxdnBl93r5gdtfw65/dpKJJuXI8UpPboO6l6465mES
   w==;
X-CSE-ConnectionGUID: V+1rjHHVQQeu43+NQ5J1Cw==
X-CSE-MsgGUID: QthmP4T0RB2bpMkiEpQbpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97695673"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="97695673"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 16:18:12 -0700
X-CSE-ConnectionGUID: Lu4WVPv/TyCUoL1nK2FQnA==
X-CSE-MsgGUID: IZsxBs/jR5qVlzEx+XM8jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="260830156"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 16:18:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:18:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 16:18:11 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:18:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+JY5Kw+kw9KZGJ9v98MvRO618gg2fKH2UYWCIQjrg5b+osaNqg7UV9i1N0Vcd/+KZSJx6M+d9mpY9jCQJ4hxuxjSh0sSkiCdPLoBA1Q//+SAKxlIYhQyWSWK+TLDoaJXXnmPWBNCRy1lm8PX4c7R/xciVB3NcXiZeebF5dwg5JY1jtqB8d5go+XHVfKimQg+8NGFXkokM8Roe9y3a2wBop35jSH6zWed+ned0hWnIM9kUG00YCsUz1iIres/pp4Chql30Z9qaFwolD0LfEjcFr+0l7ONUt33okhDc0lxzROK159sbGytTNJF6aqVXKzXzruCt6byu0WRkj5hEq99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TS6r4+0sbrWlMzhygHz/Wg3yFPZFEth39/ZiaqRo8GY=;
 b=ZmxcamGkACjlMHevtK+e5In9C7RmdujFu50tV55gFs4gBWv/COaGdMt6UF2x+uNOC9YlhhQpgmRMofK+/8Jvo+KnPqATsbvzXeTIMt36w3VKr+iOZ6MWqUqTXi7TeWzxS6y8+lvnqrzTXaHxdAATvJ6wwXQOCMe//YrTp+b6qjt00Zm1MECMRzWDnQ+ABeQZp7yhiDfU4Ri72IY7QtXyiV5xybZB8IMiEJPjQq5197RxM9nPNjcfeKMeUlR+R/am5tDrGp8Z1MTqkqada+EBbTV/YE1JfolvPToWGmfVQXFf2nLkWKNyZSWUN01l+/86y9Twg2RWrMj2wzxw4Fh5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA1PR11MB6711.namprd11.prod.outlook.com (2603:10b6:806:25b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 23:18:07 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 23:18:07 +0000
Message-ID: <5b013f98-caa7-442e-9d9d-626e627e1059@intel.com>
Date: Tue, 11 Aug 2026 16:18:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] selftests/resctrl: Add L3_BIT_USAGE to check
 allocation reporting
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.co>,
	<shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<fenghuay@nvidia.com>, <newtonl@nvidia.com>, <kristinc@nvidia.com>,
	<kaihengf@nvidia.com>, <kobak@nvidia.com>, <sdonthineni@nvidia.com>
References: <20260810095124.32244-1-icheng@nvidia.com>
 <20260810095124.32244-3-icheng@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260810095124.32244-3-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:303:b6::26) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA1PR11MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 65595627-c634-4af1-80bd-08def7fecd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|3023799007|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: O7RAPS+PvxDB4EauE6HY6gNMb9DM13oB9Xwe2/1gcn8NmTsWLxn4YZGf38GLjv8AKF7z2EX/m+YwYVcwUO5K/Sb7ZGn6rbdVlAQZAGJpEHPFT6w88PG8rdBNKsBL0GlONhc0lmRv0TaJUj4GBgVzeJnvmA7SykZg7SLrqg5Eqr2mp1OnmBhT944bnoWIVMMfjEpXHjJyUUTCJ4t7JF8zB2oN607poIdb3Sab7N7D0eP7KzE+4PoScix0j9ZknmConlhFwWjbqCpDKCDYANRrLU98cZxH07GyPSuP/9bPg/9esLAeo72MNJJD5xJhP4yCAGwBCdef826obqqX+zHPKEVYd9N4kt1jHiV9mvDHd10h5pQuEhn0zP03J/7o6podryoyZdBevnL3bAHpcdGO84a6CVlVG6SX0TYIT/qTh2MBfCVDSF1wyd1UcoyHTI3nYqY16gSg7gAQBWH7Y7tCkisFFlbRVO1/deGNOX4KawiRmyaVtRgrOiZDe7h2HRlBNP5kQcWXDGHsOQFzgc0UR/rT2SxdKC2m30Oitlu5raC0w057LynTqSB8kXC6AkjO1XfQSt6Hh7/0IIQOmVInM/G7p2Xfj41FmLu0I2vU4BOimHyFyY3X2V3rCDxyEsWj6N9z+xojrSf/e8GcHulTkNX0rE0DGjIePvYfZ0AiGzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(3023799007)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVY3MFlTSGp6TmRocm1IWGxDZG1ZSklIQ3RHR0IzR1phdUx6SC83MzFxTEEy?=
 =?utf-8?B?OFZ3aU1BYngxeW9qV3lCN1F1dytQY0RFR2daRXU2UEliSkhUYUJXaEFCeTlu?=
 =?utf-8?B?RytFM2doY2dIRjF4Ulhxd2hadXNDaUo5YU95dUVsandLMGFsSFRXSlV2UmVt?=
 =?utf-8?B?Y2IwWW5Vb2pjbHZ5OGFoUnNZN3pXVU1BSk9GTHVaQkJ6ZzJyaU5kdExHRW03?=
 =?utf-8?B?Umh3WTIvMFVuaCtEcWFiWW44RitFWDBkaWxHSjE0VzFiaVdCdnVKWWJJSUls?=
 =?utf-8?B?cThKRHpYSVZhN2dnS0IxdWloUENVNFMxbmpEd21qd3VMTStNUjZPaWo0NWpH?=
 =?utf-8?B?T0Y4Rk1udXhXSllzM0hKaU0vS1RzdDFnRkRaT1g4Nm1lcmU5cjdRZHY3cnhY?=
 =?utf-8?B?QkowMHlNeEtDbkphNUJLeFFJVmtIT1krYjBScjFtY0ZIbCtqa1cxYXhlVmV3?=
 =?utf-8?B?eTZmVFEyK05aTm5qd0lKRnZQSFh1cU51UGNuRzdwenEwc0o3MEI0bWVWWVdT?=
 =?utf-8?B?WWhjRkVXVXRRdVN0ZmtPanhhQWlRdkRGQzdpTDFhZHZrZ05ycC9VdWMyTHky?=
 =?utf-8?B?bkZIcWhKTzBZRlZ4QkxQTW1qSWlyUTF6cG5TcjJFdDhvVTE4SVhtektON0R6?=
 =?utf-8?B?Q1BmbVMyTU5SSHdxUUVBajRKck10WGVCYXcvc2dOcWErdU03VnJ2ck80VGF4?=
 =?utf-8?B?cHdiNy9aZW9GT1R1VlQ4dGFBSlc4VEVUb25kSFBlRkpPb0o0aTJpRmluTnUw?=
 =?utf-8?B?dkQxQWRLd3ZSMXFIam4rT3dsaG1HcVJwYmk0ZFhwTWdCZ1FUbEQvdFVFQktM?=
 =?utf-8?B?REJqTmRYRlBxU0oxT210azhldFpseWd6NDZrSmpCSTZqRXFHZHRrQ21XS2RD?=
 =?utf-8?B?TGV5bmhwVmlNUkdnZU9WYlc3dmtCSlE4MVNDTWYxektTVVJjelVsN3VldVJy?=
 =?utf-8?B?Z0l4ZDRSQ0ZmNGxaYjRuRDhSbkNsKzk4a0dINllhNDlNOGwwRTd6SlQ2VVlT?=
 =?utf-8?B?cHE1SmtjMFhKd21kMjQ3cE1DYnJDTkVkTjVmcktUQ0k4NHNjc3Bua0RNeloz?=
 =?utf-8?B?UWxIbS90aHRZZEV6bGNZMWNBUW9GaGNzV1hIcWl0L0tzZ1RDRWh3dmxWVFp3?=
 =?utf-8?B?bUZIRHdLTVVJOFBiVjVlbElQdEFGUWMrL0x2L1MzdUR3RTQwZHZCMjgvNTBC?=
 =?utf-8?B?KzY5M2QxZlA2bi9sVytwVFo5ZWxFdVEvVHJXOWdUZXJYakxLdUpaeVU3K3dj?=
 =?utf-8?B?azhTamRQUzZTZ1owMW9uYnMzM1ZsT2JKV2VjVWhRQ0tHc3F3UUo1eExFSlBO?=
 =?utf-8?B?UzJHTGJKOHYrOW4zSUhPR1UwTUZ5QktRMnRPakwxVnpBa2dXSkY1dHJLeVNm?=
 =?utf-8?B?Wk9JZTdJbkJnckQrNFJpOGErcU1aQWYvVXZ4ZTdiQ25odnNQNmNReVoreml6?=
 =?utf-8?B?NDRTNW9XVWY0anRMbG05dmZUZ2NEc1c4cFF4NVpHWUhmK3d4MGIyRUdHS1Fj?=
 =?utf-8?B?TlYvYlZML0h6cGhUMWMxZHRvbW1saDlUdnIzQWhnaVIzOWtlOW9uVHRGS05q?=
 =?utf-8?B?dkp6eWQ4YjdzenlHTFBOOWFqUjJoL0d5QTNlQTc0L09jSkhlcndpSG9ncXRE?=
 =?utf-8?B?RXlhbk8vUGNkUHBMK1RSc1BBUllKS2E3ZWR4NDNvcXp5bGJ3Q3BmalR1Nk45?=
 =?utf-8?B?b2VSNGhtZ3poUlZSdEpld3IyQ0tHRnI2cDhxb3hldFExeXRIRW84bjBXd0E0?=
 =?utf-8?B?K3JScXhzb3NQSHcvcGNNOTN2REpRRGtiTmNqNzdreUgzaHBGTDdOQ0huazY2?=
 =?utf-8?B?YjYrSEh0L2o3Rnpud20wSU8wMGI4QS81MFkyYU4yTTBrZ01uRnREUnpLTk5a?=
 =?utf-8?B?L0o5bzZ2bWY0Q05hMkRkWFZNTVBmbkpjejRldWdGeG1KU0JuTklESi92cWtW?=
 =?utf-8?B?S29YakpucTRpVXl4KzNyM0V0WVRwV0IvOXl5Sy9uSUdvd3V2UDh4Q0c5dlNm?=
 =?utf-8?B?SXB2cVRFQmgvdEcyOU9ncE02YU41RHBiTFVuYUxCOTBHTUxLMFJ5WWRjcTgz?=
 =?utf-8?B?Vm03a1kzdVVDOTV4TlNZb1RXaERBQkN4Mjk0Yy9OeDhua01tTmk3RzRLOXow?=
 =?utf-8?B?QlhPYXN2N2cyY25hYytYVklWWDhwZndVV1V0WGtKVGRwRWVFK1NlckFCYmx1?=
 =?utf-8?B?WVJieFEveUVVL05BTFVBQUNYeGRQZklGRVVPQ2FWYWp4QWZUR3I2akltMTFB?=
 =?utf-8?B?bWtyWk9Uam90VnJrM3VSOXZCUWhONlhvV2V5Wkxya1cvSjE4UnErZ2NadlBT?=
 =?utf-8?B?N1pnWVVDM3NOVk9YSC9GRW5QNmtZVE5tSG5GazhBWWJtWG9XdFhDTzFnQ0l6?=
 =?utf-8?Q?eQlu7GEb0zWQHJEU=3D?=
X-Exchange-RoutingPolicyChecked: LRjGw0SKwDVQM3HmOSYEfQUC2Gxq6YH3BKxvvqynrW4Yi6QIcjTzJB8THnYLtv/99AphQubTjH75cCtIMTajGWfW2usfBOLF1+0oad1E56hS7M4J2UheD0oxcF2+ho02cSU9yHa43iL7sQEXDhKOd8cshC/RnqcwGzWVf9WOnEfgLd6cTWdWc35JEwCFrNPxa5chb3xNc7cGCFxOCyhxaBwtQiqz9IuKreEBSPFv8BS0qjhNKYDnILwC5hRAUo46sAh+jETvKAtZxjiV1X3fbDfrxy4Ug/eFyPV3E1Sw94i1h0MLaxCHVvK6zeJcq8XW+tnrPxL/XGwI0MDU6pwHJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65595627-c634-4af1-80bd-08def7fecd35
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 23:18:07.0676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgQpcDqB4Fda4ErSXrAU5jisEQTkOFlKVGgMzFJ61hiXMhO9OK2L/aeDXX4l2F0/cii3NgvRF/tTkmc/sp6VZXtXdQAF/TZaT56d05NooG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6711
X-OriginatorOrg: intel.com

Hi Richard,

On 8/10/26 2:51 AM, Richard Cheng wrote:
> Add L3_BIT_USAGE to verify that info/L3/bit_usage follows the root
> group's CBM.
> 
> Write full, low, and high valid masks, then check the selected domain.
> Require X or S for portions used by SW and H or 0 for portions outside
> the allocation.
> 
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---

...

> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
> index a06c57954740..9205f93fd669 100644
> --- a/tools/testing/selftests/resctrl/cat_test.c
> +++ b/tools/testing/selftests/resctrl/cat_test.c
> @@ -440,6 +440,192 @@ static int cbm_validate_run_test(const struct resctrl_test *test,
>  	return 0;
>  }
>  
> +/*
> + * L3_BIT_USAGE - Verify info/L3/bit_usage reflects the allocation.
> + *

Similar to the previous patch I do not see anything unique to L3 in this test. Here too
it looks like it can be expanded to provide coverage for L2 with just a new
struct resctrl_test definition.

> + * bit_usage annotates each cache portion. 'X' and 'S' mean software uses the
> + * portion, while 'H' and '0' mean it does not. With only the root group
> + * present, bit_usage must track the root CBM bit-for-bit.
> + */
> +static bool bit_used_by_sw(char c)
> +{
> +	return c == 'X' || c == 'S';
> +}
> +
> +static bool bit_unused_by_sw(char c)
> +{
> +	return c == 'H' || c == '0';
> +}
> +
> +static bool bit_usage_valid(char c)
> +{
> +	return bit_used_by_sw(c) || bit_unused_by_sw(c);
> +}
> +
> +static int bit_usage_for_domain(const char *resource, int domain_id,
> +				char *out, size_t out_len)
> +{
> +	char path[PATH_MAX], *line = NULL, *saveptr;
> +	char *usage, *endptr, *id;
> +	size_t line_len = 0;
> +	long parsed_id;
> +	ssize_t bytes;
> +	FILE *fp;
> +	int ret;
> +
> +	snprintf(path, sizeof(path), "%s/%s/bit_usage", INFO_PATH, resource);
> +	fp = fopen(path, "r");
> +	if (!fp) {
> +		ksft_perror("Error opening bit_usage");
> +		return -errno;
> +	}
> +
> +	bytes = getline(&line, &line_len, fp);
> +	fclose(fp);
> +	if (bytes < 0) {
> +		ksft_print_msg("Error reading bit_usage\n");
> +		free(line);
> +		return -EIO;
> +	}
> +
> +	ret = -ENOENT;
> +	for (id = strtok_r(line, "=;\n", &saveptr); id;
> +	     id = strtok_r(NULL, "=;\n", &saveptr)) {

Could the pattern be '=' instead of the comprehensive '=;\n' to make this more robust?

> +		usage = strtok_r(NULL, "=;\n", &saveptr);

Could this pattern just be ';\n'?

> +		if (!usage)
> +			break;
> +
> +		errno = 0;
> +		parsed_id = strtol(id, &endptr, 10);
> +		if (errno || *endptr || parsed_id != domain_id)
> +			continue;
> +
> +		ret = snprintf(out, out_len, "%s", usage);
> +		if (ret < 0 || (size_t)ret >= out_len)
> +			ret = -ENOSPC;
> +		else
> +			ret = 0;
> +		goto out;
> +	}
> +
> +	ksft_print_msg("No bit_usage entry for domain %d\n", domain_id);
> +out:
> +	free(line);
> +	return ret;
> +}
> +
> +static int bit_usage_check_mask(const struct resctrl_test *test, int cpu,
> +				unsigned long mask, unsigned int count_of_bits)
> +{
> +	char usage[sizeof(unsigned long) * 8 + 1];
> +	char schemata[64];
> +	unsigned int i;
> +	int domain_id;
> +	int ret;
> +
> +	snprintf(schemata, sizeof(schemata), "%lx", mask);
> +	ret = write_schemata("", schemata, cpu, test->resource);
> +	if (ret) {
> +		ksft_print_msg("Failed to set CBM 0x%lx\n", mask);
> +		return ret;
> +	}
> +
> +	ret = get_domain_id(test->resource, cpu, &domain_id);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = bit_usage_for_domain(test->resource, domain_id, usage,
> +				   sizeof(usage));
> +	if (ret)
> +		return ret;
> +
> +	if (strlen(usage) != count_of_bits) {
> +		ksft_print_msg("bit_usage \"%s\" has %zu chars, expected %u\n",
> +			       usage, strlen(usage), count_of_bits);
> +		return KSFT_FAIL;
> +	}
> +
> +	for (i = 0; i < count_of_bits; i++) {
> +		bool in_cbm;
> +		int bit;
> +		char c;
> +
> +		bit = count_of_bits - 1 - i;
> +		in_cbm = (mask >> bit) & 1;
> +		c = usage[i];
> +
> +		if (!bit_usage_valid(c)) {
> +			ksft_print_msg("Invalid bit_usage character '%c' for CBM 0x%lx\n",
> +				       c, mask);
> +			return KSFT_FAIL;
> +		}
> +		if (in_cbm != bit_used_by_sw(c)) {
> +			ksft_print_msg("CBM 0x%lx portion %d shows '%c', %s allocation\n",

portion -> bit?

> +				       mask, bit, c, in_cbm ? "in" : "not in");
> +			return KSFT_FAIL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int bit_usage_run_test(const struct resctrl_test *test,
> +			      const struct user_params *uparams)
> +{
> +	unsigned int count_of_bits, min_cbm_bits, partial_bits;
> +	unsigned long full_mask, high_mask, masks[3];
> +	unsigned int nr_masks = 1;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = get_full_cbm(test->resource, &full_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret = resource_info_unsigned_get(test->resource, "min_cbm_bits",
> +					 &min_cbm_bits);
> +	if (ret)
> +		return ret;
> +
> +	count_of_bits = count_bits(full_mask);
> +
> +	/* Every cache portion. */
> +	masks[0] = full_mask;
> +
> +	if (count_of_bits > min_cbm_bits) {

I would argue if count_of_bits is less than min_cbm_bits then it is a bug because
the hardware claims to require more bits than it claims to support. This test can
just fail right away if this is encountered.


> +		partial_bits = count_of_bits / 2;
> +		partial_bits = max(partial_bits, min_cbm_bits);

These patches do not compile for me. I needed to add
#include <linux/kernel.h> to cat_test.c to obtain definition of max().


> +
> +		/* Lowest valid partial allocation. */
> +		masks[nr_masks++] = create_bit_mask(0, partial_bits);
> +
> +		if (partial_bits) {
> +			/* Highest valid partial allocation. */
> +			high_mask = create_bit_mask(count_of_bits - partial_bits,
> +						    partial_bits);
> +			if (high_mask != masks[nr_masks - 1])
> +				masks[nr_masks++] = high_mask;
> +		}
> +	}
> +
> +	for (i = 0; i < nr_masks; i++) {
> +		ret = bit_usage_check_mask(test, uparams->cpu, masks[i],
> +					   count_of_bits);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ksft_print_msg("Pass: bit_usage reflects the allocation\n");
> +
> +	return 0;
> +}
> +
> +static bool bit_usage_feature_check(const struct resctrl_test *test)
> +{
> +	return test_resource_feature_check(test) &&
> +	       resource_info_file_exists(test->resource, "bit_usage");
> +}
> +
>  struct resctrl_test l3_cat_test = {
>  	.name = "L3_CAT",
>  	.group = "CAT",
> @@ -457,6 +643,14 @@ struct resctrl_test l3_cbm_validate_test = {
>  	.run_test = cbm_validate_run_test,
>  };
>  
> +struct resctrl_test l3_bit_usage_test = {
> +	.name = "L3_BIT_USAGE",
> +	.group = "CAT",
> +	.resource = "L3",
> +	.feature_check = bit_usage_feature_check,
> +	.run_test = bit_usage_run_test,
> +};

Could this be added?

struct resctrl_test l2_bit_usage_test = {
	.name = "L2_BIT_USAGE",
	.group = "CAT",
	.resource = "L2",
	.feature_check = bit_usage_feature_check,
	.run_test = bit_usage_run_test,
};


> +
>  struct resctrl_test l3_noncont_cat_test = {
>  	.name = "L3_NONCONT_CAT",
>  	.group = "CAT",
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index a6fc688ed997..765aa5d5814d 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -241,6 +241,7 @@ extern struct resctrl_test mba_test;
>  extern struct resctrl_test cmt_test;
>  extern struct resctrl_test l3_cat_test;
>  extern struct resctrl_test l3_cbm_validate_test;
> +extern struct resctrl_test l3_bit_usage_test;
>  extern struct resctrl_test l3_noncont_cat_test;
>  extern struct resctrl_test l2_noncont_cat_test;
>  
> diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
> index 57a4d0815b67..e6e948d55f38 100644
> --- a/tools/testing/selftests/resctrl/resctrl_tests.c
> +++ b/tools/testing/selftests/resctrl/resctrl_tests.c
> @@ -20,6 +20,7 @@ static struct resctrl_test *resctrl_tests[] = {
>  	&cmt_test,
>  	&l3_cat_test,
>  	&l3_cbm_validate_test,
> +	&l3_bit_usage_test,
>  	&l3_noncont_cat_test,
>  	&l2_noncont_cat_test,
>  };

Reinette


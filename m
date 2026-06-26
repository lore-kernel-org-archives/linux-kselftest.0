Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD93426ED46;
	Fri, 26 Jun 2026 03:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782444422; cv=fail; b=fVORmTbTLbh4x/kkT97gqW9i4YRt2P0KflclR5beuXz67+CO1Mf0+gLt32dnG3M/b+r/bn+HxWzj9vkaR6Nm9lCWsXX16Q/ZsW2DBHhk4YwWqbv1vWiRkByCNmGvvsOKNOZeT0Oq6W4EF4yfaX++sEazl/hVNCtoAvxfDTZtUSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782444422; c=relaxed/simple;
	bh=eBERP6fU5X2a6EG4HR8u4k7YF8qVImdy/xf1vV7WVj0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HlXryqoE+SgoYiAaTmgBajwoGyYJEvJLHvG3XudWHmrfncxzXmdAXuv6baB3LJTxr9yH52wRNe+uX+t4Dynr4kyJDSYZElvEpC5l1zPxSyZDBfUlIiQdiI/g6P66UhTr73FQ+93Q7ngVGwoZ8VNpOlyoF42n8g8sLZN8oGBrh9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y58fr+nS; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y58fr+nS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782444421; x=1813980421;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eBERP6fU5X2a6EG4HR8u4k7YF8qVImdy/xf1vV7WVj0=;
  b=Y58fr+nSeHMIejvwbuGjd1VTTkYfH8hx8ySSAO+7n+lmmw8S7PpNs/Um
   n6OKOerpMlD7z2X1cW/eVozx632RDHkjJhiN6PPw4KfH528OyHNktdOBT
   N/OlT0glhC59z0iKfYT9AsrSfi1f3orU/e3u56TNUdsgvdHEM6xOHh09N
   q+HlXtQ5TcGXVPwub5D47H4Th598+np+zDWLtb4j4qbY6H/zJYIylo+//
   qCSIJLEKZKvMC4vs4d3arlWMZBlas9fdk4wbuwqkUFGKoz61N9i7BjcnF
   Jj48LEaxKorYuqm3q4hafLHYYes0blKtCiJVHAEg/WMrHsQrykN6LT+q2
   g==;
X-CSE-ConnectionGUID: o+0Qjz/kSJ+WGJKgBtcwlQ==
X-CSE-MsgGUID: ulHEE6byTiW8w4q9XZKMiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83371735"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="83371735"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 20:27:00 -0700
X-CSE-ConnectionGUID: MnNSUpGEQ+Oszmp0DR5OyA==
X-CSE-MsgGUID: Eds8PN6iSie6wkLMFB862w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="274423846"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 20:27:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 20:27:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 20:27:00 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 20:26:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqKuMlkAqIaieXV239yZZEN3E6V8N13oV6Xv3yy3UgjscEWGbCkI2yKLhH7V1zYpPehDVW74/HUSrXnR9Lo6QKFVN2wZsScyRqtLVFClKEpyfwkeYRACQLdJStva9XWb0QUyYjit4+lXlIgjgk5dbCHrSZ8zGy9vFNRQInklI5a5lSBLSxSXMZrA2ebrHQ1h6Z0udh2jPmg0N6rNu+FggyocZfYFCiFpoYvdMCQoXhSWEPdG3bt4+GeH0hqVFA9qq8tc1SbyR6xL3QULzja+XcrNEzew9mBsLizf9Mi9v2UhbQpCwYcadhlYRFUnWvsC0XwT2I8UPqoSPq5d0hgeUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjnNmUCtPefUx8WxxM3bHVOWYvlqStrR4kWrojG5h7o=;
 b=X43M/NEuhsF/zDk+oWGcxht++HT4M87Z9DshclWBPLdVqWJC7hwWmxn7oPtKqnvMqDrl1iMWnlQGT2iD/aGFDovdB90hDoQ8dnQRykfAw1kNm16RatloVDdBJL76pNUGZbTts7BBFnsbBOBy/M3m7Q0tLYCq2I8ZeGN78xX2eY19aLxcLKfKDUNmccUZjtkY00r11XrCaXOe/8Oe8axd4SuX46Lm5bj4rRrnq18eDA09H+my8HsXk8dVKzRaM1v15H8CoUevCEm5oh2TRhQaS/bsS6DweGigEm8cLljiRAZOX67IRcaUOetvsKEsIccIUHEdKGSGpqG8zg+QrcqBwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA1PR11MB9850.namprd11.prod.outlook.com (2603:10b6:806:4d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 03:26:53 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0139.018; Fri, 26 Jun 2026
 03:26:52 +0000
Message-ID: <87f09c95-15a1-45ff-8c3c-61b383499d62@intel.com>
Date: Thu, 25 Jun 2026 20:26:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] selftests/resctrl: Recognise aarch64 as a vendor
 for L3_NONCONT_CAT
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.com>,
	<shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<yu.c.chen@intel.com>, <fenghuay@nvidia.com>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>, <kaihengf@nvidia.com>, <kobak@nvidia.com>
References: <20260529022352.8308-1-icheng@nvidia.com>
 <20260529022352.8308-4-icheng@nvidia.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260529022352.8308-4-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:303:16d::17) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA1PR11MB9850:EE_
X-MS-Office365-Filtering-Correlation-Id: 4696e12e-a656-4c7a-d9d0-08ded332c43c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: SY05XAjhSFLpFeOhrUsSjJWgaM2bFXrDC46/jfY8w/5LsbRCRUev+pUd+6hzVNm0iK7agPjaHGYE8QGnQlEe46z7JgzVjEKzTglLKIuacg52tbc3JiHxJeFzwuXpvt5RkUvd9RJLhiXDlNYQELfU2xQBHd391SCxzR8JCeAEhdb0FhURe3yZ6CZv7e3B+ucyODE+MuFqdnCrqs4a4Xxv4d4OdTl/y6kpDJD7OIW1ns+Y1NQCo04fPFGZqbLz2jMkBH+pKBRaGQ0V6HfI8XRRTYV4kOdMklBoKJY2QH3zHaCKGR7SxnF5OkvfyMphOzUoMFqY7Hy+XtkYZwkWBFrmjOYkp/0B39+a0FiZh+GEmmwLWnVKPFoMJDm2mfEeKthq6L6vK2T6h0Qh6i2R2TaAjGZ3dAgtaDZVU06EN3mJPVlf6FZ+UCb7zZhIRH0hkUJxIAcuerTI5qrEQ6Tt11kfO/RnmkfjU9wTJ38yHM2rz9SS1BHtffLeEgUvuLSFiI6RkYz3h/eb4BnGKhDj1CHRmVi8jnlMY++J6a7mNd6gB4wD8nsgNzAs0RuFGaOX7ndJhqrU719/cHErPYqDWZq2MJ82+Kvffayn8IYc3rybjcmeNTRRzIUB+hKN07GKtuc/V2bkQ1EEzR5WVWT507T6fncPpvk0YSzNesGtr5fMxz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm5OT21KVk0xMk9xc2xXN1R0OHgzelU1ak1jWUFUNFpydUd3TXpWNkJmRi9U?=
 =?utf-8?B?ZTFIMWFLdVZYR3FiWGpFUWNyMXBxZmxjbFQvZXJRc1NXRU1vQUJSQmtCNU01?=
 =?utf-8?B?VVdON2tuUDBlemp6UEhpWkZNQ3RsNkx2S2xGUEhsdUkrb2NzZ3lZVUlTTEZT?=
 =?utf-8?B?NENuTlBVVXdkakY0dEgzSDh2dXVsODJqV1lpdXZKbVlJcG11YTAzSXFyYytG?=
 =?utf-8?B?Z25HbUQydWozR2xHUzVLcE43NW80dCthY1gwdFdZakY4ajJJbklUWWV1cHFO?=
 =?utf-8?B?UTNLQ2gyR3BicmtmRWJ1L3FHeXc4c3ROeFovWWU4VmUxNng4UWlXZjVkYzhR?=
 =?utf-8?B?VGV6YW9oaHVYZmd2S0FleU8zeFFuNSt1d3l3MXRRcHRuUWFiMUZLWVFFZ3NX?=
 =?utf-8?B?NUJMOGVwOGdjOFNwak55ek4yYWxtdGtQemFKYXYwWHlPN0R2cUZ2eG0wUmh0?=
 =?utf-8?B?SWlTVFZVZ3g3YUNvZTBteUZMYzV6c0tKbXVKQUpsck5ka0g0VHp2OVladlBv?=
 =?utf-8?B?Q1JYOEJvWEV0UCtLcldDLzFEWUxSV2hyT1NtUUs0bEJseWd3RVo1V1ZwMTFn?=
 =?utf-8?B?TGhzY1Zuc3lFaU9hNStzL2ZqNis5akk1bUlLSlFOZjgzK0lGdC9mM1ROYjNY?=
 =?utf-8?B?OVFVNzVtamdCeUsxTHdEQXVLQVdzNnFmZEk1bFUrbTg3aHFnVDAyaU5YVG1l?=
 =?utf-8?B?QTFPb1daYlMwY1cwSEZjdHI1NytBYmVlK2VRdUY1aVVzaWIraVR5SDRYTVFO?=
 =?utf-8?B?dHdpdXlWU04zSTJ6ODhqa09mNU9DVmZyK04wZ252VzQ3OHpjV0t6RnJ1YnlR?=
 =?utf-8?B?ZngwRFVPdnYxMzBkUzFmbWN5TDZ6T1dEUGFIckJuUnBCMjYvaVhNQ1pKQyt5?=
 =?utf-8?B?VlBCZ3BkQWNXVEt4UVBwZm1aQW96VXo5NCt5L0l1SlZnWEoyVzN4Z1UwM2hk?=
 =?utf-8?B?TTU0bTluYzlVNFRPN09MNURyeTk1eTJHVHIyUnZvcTd4akxqZWpCdXhwUnJX?=
 =?utf-8?B?VlBPR3VXc0tqdUFFRXR2QkdlanVDUXkxSy8ydStNeVJGRnNQTjAxYU1YNTBK?=
 =?utf-8?B?WTZCMWh1Ykh2VEFycVg2OGxsdThFbnAzRyt3MVVoWUNHSTJzZnZ6OEtCbXYx?=
 =?utf-8?B?UExhY2pvNlpGQW84OTBVL2JaTWdnZWRJOXFqZ3FtRkFVSDhkNTNDV0dSTmZU?=
 =?utf-8?B?VVE2aG0wd3lZdVZtczhpbXRHbU1DVUxZY2N4MEl3cHVLaUNBRGMwT254MTdM?=
 =?utf-8?B?U3Q0d2JIM1dCNWFnbndZZ3dkUi9CeGVLQlZyMXk2bDRuUE5TVlZ0UFdVWlJu?=
 =?utf-8?B?Qk9oME02QmM5T1JVcVp6TnRKZkJGM0NBeXRlYUFyZ1dKcktrMVN1VFRMeEdG?=
 =?utf-8?B?WXF2ZmFvMHRGZGVRT1hSWnplVnhmMUxkQ3ZZM2dVNzFuNEtJTkpzNTJ4ZDN4?=
 =?utf-8?B?Y0ZLRzlLc2lRNnlqbVdNY1lYUVN2dmdRWnh2cm1OSHFySDBFOU1sWUxRaEdv?=
 =?utf-8?B?S0JlcXZYcWdLekNxbVNQWXFtK0UxZkhYUDZidVIxRUJ1bzFCNlVna1ZzNmR0?=
 =?utf-8?B?cnc4aGFwVnJ6RFo0eHhFMVFnNkVubUZ4YzFZa0UrNEd3S2h2TkQ1VVFCaFhx?=
 =?utf-8?B?bXoxaHBGVkNENm1oUVJSNTNOaG5hK3h3bmtYU0kzQ1J4REdRandBTEZya2tK?=
 =?utf-8?B?SUw1UnBXY1M4SVE3amtoUmpJaUc1Z2YwaFRNNWhsdjJBZGM4bEVTR2JxZjdx?=
 =?utf-8?B?NStNRWFPNUtXVjl2T3huVWI5VUsyVmFqK202aHBuOHk0VWlCUFBreFlmV29S?=
 =?utf-8?B?YlFFYUdSYzJrNFdIVlN3K0tKTnl4SDRnd01FRnVOTVZ4SzFNVnpqRlVZVHND?=
 =?utf-8?B?K3gwUXRYb3F2UzZzZXJhcldFckZVV05GSW5JL1RWWWRiMUZoNTRlSjRhWC9o?=
 =?utf-8?B?Zk1CZ1A1YnJKSkp6MFZKYkhMRXoyM2pCQ1hTa01DdjFYTjNaaXJab3pZK0VG?=
 =?utf-8?B?WFM2c2hRZnN4N1FieWNRdGRRTWtETnlpYU9JZk9NR01uNS9peEtYdExRZFhQ?=
 =?utf-8?B?eXlOQ2xWOHdTdmI5RmJ4V1JUYUFPTW9LWFpDZGdoTzJiRUM3TW0zSUMxb0RK?=
 =?utf-8?B?NGJNQ0t1eWI5TDNQUlF0U0U0UHl3aUtzellCSE5GbnpLS2ZXM3J0ejFxTWhz?=
 =?utf-8?B?MXZWMnJBQVNrWlcvd0F4WGVscUFYNDEvdkZaSE9uN1BFSC9MYlQwaGtxek1j?=
 =?utf-8?B?RUlHT044Z05tQ3JjS0hYTXY5Zi9lN3F2OGpSWUxKZUV5dTVFY1BldVhnc2dM?=
 =?utf-8?B?R1crTVNIdUdqQ0Vhd0Fna2ZhM0x2MGtIdGYwa056elNPWm05Zml2MEkwZTJ3?=
 =?utf-8?Q?JU1+MaEj5Xj6A9dA=3D?=
X-Exchange-RoutingPolicyChecked: HfQ4TPyUNW5/FWMZ5NwNZ/Axq99T+MA+YQV1ct+JABuF140vSx3buCDkM+woJnzNZZJYAiGF9llXBEm3JLH9BNzzUhjjOfOwITu0Cob/S+11//I55TdiH04U8bFf+Kt0ad89Hl/K4MeclZX+UGwhIYz7b91ITNMnfLsVf4L9hhVFd4vOQHnAz/OPCv984dtR9//7RokkdLOW+nwvCiqP7suZHDP3Dw+gE7xcbKeTE2eC5yIJlR0JkP1NX9RVjF0TrftNh9rIJ9ANH5c8ddRb2yqTEunjr+ZxGk9xpC/vYNZ5atxT4BWwUFS/+oQqbTpQf0DkTNefQVkIXzGL7/hUVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4696e12e-a656-4c7a-d9d0-08ded332c43c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 03:26:52.8382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDd4/afQ9JYoWTyFV7qIACABVDJITePH/vkj5BZ2AIMxMtlF8jy/8n0Q8M9WTRFLljAo9rMtinsFYspHesvJrLuNQw1pwHDvxXuwbqM0R24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9850
X-OriginatorOrg: intel.com

Hi Richard,

On 5/28/26 7:23 PM, Richard Cheng wrote:
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
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

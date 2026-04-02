Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD132D5C83;
	Thu,  2 Apr 2026 17:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775151752; cv=fail; b=noOahsGlPmTRTDhtjn3ibP4mNA6F3J12Pqq8vGsuLK1zpXj9yfiPrEWuBxeL8qXmYAaxMyEu27vJT3vLZqW3jWyPdP2JIws9AIo6WAeB4RWvI3ujJMPPtawoCXDfrND29qxafnm/lXwsmiWzueaHqmVZhahT7MBGpSdFo1CBxjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775151752; c=relaxed/simple;
	bh=HikSm6b/EpIJQiTNvC61xScuVUq3o77O6ZBgdHkM8tg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NB6bnEJfkHgx+tUKOaz80vpLKmGCpPO3/cqswEEPWrkY6h9e5jM3N3YW19q6A5qwa7fB9bQSIfGbe2PaPx2bcvRoYgaIVqR9ScXsOlAzCSH6KtoBlOLAJ+8gjSoDOctSWl5DEGqLx9FjVHRssF+JiNqM7Y+QlM0y98cH6rd46js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrfwjbnn; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrfwjbnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775151751; x=1806687751;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HikSm6b/EpIJQiTNvC61xScuVUq3o77O6ZBgdHkM8tg=;
  b=jrfwjbnnHhKI4UedgO0gxnQLT8n+jHLWrrHOaEYyuvtFaEXxRZTACcKi
   PJriS67ypuI3sjui8uu/tuzf/gnIwOjqo6/BHkCwEGBAQ2KPb3rX87oAy
   iVw3pygSzeweXIoCwjOeRJFUIOC7TdpsRckK22K9G84EXQOzdEmCcWl33
   4cucnIjWhPEO2qMNFhZHp5AYqHdx1bfLiTRRL9C47+jefHgY30ktsyCBU
   izT0wqDGUcdbBB16pMAccPF9QfAydR9fX7I4rl0t7FftviZPr+fI4HxOA
   HT1K8RRk3rvrybknculebVUdVu/4EzfBSK39Iz2NkN4GlxQw83vcyuWZE
   Q==;
X-CSE-ConnectionGUID: jqBTusLpSY+Yn0uQSjnsBg==
X-CSE-MsgGUID: auN3FmG6RTWJzjYoFPnrHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="80107135"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="80107135"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 10:42:30 -0700
X-CSE-ConnectionGUID: 0+oEJrKYQw2QCITh2vjbWA==
X-CSE-MsgGUID: DlHcGPsZTNKaDrKJQK7pog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="227288503"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 10:42:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 10:42:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 10:42:28 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 10:42:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jShCQdvm/4X+MwHK2LMVXo62RLx8gYcjx4D0yX/Q5ACuJ7d/jwU5o1XfIV8FoJb+BTo04+SNqSqR0scnjHbzrnX4T09gvax2alP8QrrkbySeR2dYaiZWUW22/N2zr3NPMaxJUHGOTT/oBKD2qTa2qGREHdfGQCUOCh2Kq78wv1HjFiD8ZFGVtkBnCsL/gO9WmTS4Mxy52j68H+Srqbs/xHoHT1eD9AA1uiYgZuaHuXPLsmhS45JcvU66vlg6zs5WaZz/+XiRoLfkzLAMwErssqyF7dFwP+UB9xYOpfrSpPs8NBWcT5Lv8CFZ2sm63eGg3ccNwdCRTZHmjQcmrW7OvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kgioNl5kTwqaaX2RFdJjYYqLGwpEg6QOG0rfWy3MRA=;
 b=bKLgDUbNXrfpSPu4AfTXu0BSR92A8xg1Ocl9xwTlrfV6PJfJOGAHrKiomEjmkWjyDSMP9Sjapv5NEKPaDw5QoXA4G23LYrBlUQt2daRwYSHzsOCcqDUyfnHR2pcd5KTTi4p6Cj7jDihbWiAjUABk099JXeDV2E+FltESKQX67sh2DptuY3vPU1eqClCGrsI9dFTnolz2CTIsvG13P5Dnk0dRWsc2R1G/8Y2DyCosOUBz3A8htedOQmC7vUqN0HZAcT1zjH8C8BJH1DTAhZjCCSpsYI7NHHq2WaTOwDawBx3GhSTayC9zamZRETaZiM0VKHjCSl/Ckoy8HjyBsOe/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 17:42:24 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 17:42:24 +0000
Message-ID: <c5f0b831-1d05-4374-b968-46a27778a809@intel.com>
Date: Thu, 2 Apr 2026 10:42:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] selftests/resctrl: Introduced linked list management
 for IMC counters
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260324125034.1509177-1-wuyifan50@huawei.com>
 <20260324125034.1509177-2-wuyifan50@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260324125034.1509177-2-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aac7206-f0bb-493b-ca23-08de90df32dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: y42uG3GnXcOUU1tC1Tj+YCvxsGJRTkQUStDduDVpuUiyqzfWwwJNrJWcJ+3e9xMlTGa+yVcHEebexT5lg7do0zNlB0jWWDJPOLgzdLj2OnDqDCiMG2OnViALfUwH8G/rlF/Eq9cCg3Iyl8LCR7+dYaSKD7gfwOo/1DN57sS6Pvsb0p6VYjuKQyFf/TP8YKo5oQkUSiOooSRyLJ8bAJW91PgPJeJXXpirqU92blzZKssOc8XgCvemH4Oh0BMa/AorwYHxBINNz9O2kov2ucIgivXJWgsmubQuoeAP7lxQXmi+M0jQVG26/TLg+ElOIe13UDSs+O+qrcusIgr30lKfV2VCSpkwROQF/shu5SLB8msCInTwmIP5q+TmkQnZ2aNvCAg7kKS9A1OLgLV61DdbI08C85AA2sAbPJ/xpdzA2rt3+etBITybWqlybwS/H7YSlOGH/+HyJtoOucmanQRt8MJHweL2Xk/73IxON9zpZFc2lLFWr2oHnOMkzTuTSHPcfnv6Zf8qiNbAtt9q8/GVlZ0J3T1VCou38Ro2skiH+uP/3SkxNBa1kdt8uCaDSKG1BNtXH3XnSKDRp+/Nf8i5BvuagXYqE+uaBxY3zFrgyHUZTxEHRj/43TMFiSiOKvQeVrsBLwc+eOFMb8rbZLKu3hbWlKGMHh2z48c3iiDUmDO5DHGJaA5Sl67v2W3agSEuQqLkD5r4boVdRFFuUqJeV00T/531NHJEddeSt/YKpcSiL1Hepkr7u8O46AuWw5NjrXbjga+0pXifrq/bRQCHCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnhQYU5vRnNDTnFnNVJHc1pJU1lYZlQ4a2VnMm1HeGVBclNENnpZSE1HUlR2?=
 =?utf-8?B?VDJLaWdKNFRVdHQ2SEUvMlBNVk03dmhLcUhZZVJOVm5mWHhwRkRSWlo4Wm5J?=
 =?utf-8?B?Y2RwYnZ0Nk5rdE1RUFEwaWQyWWdVQnkrSzdyYWdRZWJmVEk2ZU4yM3NiNXVv?=
 =?utf-8?B?RkRhN2ZMc2JrbE0rRFU3amNqVkNaakpwaFU2N2QzQzl6bFhHeU9RSlk5UlF0?=
 =?utf-8?B?QWZaS0lPck9tT2JHQm0vemJjZy9FWDRPcnU1M2ZaeFVlWHh6WUNKYTlsTmdu?=
 =?utf-8?B?Qk84UnZPTXZMeDFMUDdoVkdPeS9GUG15emdhQm1raDBQcjJhbDJqYzdjTCs1?=
 =?utf-8?B?ekNHUi9raW9LZUtLQ0o3UEEvODIxcTQyejdnNU1UVkU1YmxxZVlrSllYMVNr?=
 =?utf-8?B?d1phbHlmSTlHMys4azNjcEFRclFkcWRtMzF3dVkveGQrZnc1ang2QUhDNE43?=
 =?utf-8?B?a1UzTGp2VGpPdERxcU9SVUNRZ0VuNk5SaDZ2MTduZGtnUW9zSkd3UjFVWmt6?=
 =?utf-8?B?NzByQmhWem1aQXRWL0hBVWhEOUkrUlNQTVZJWHhFS005Rmc4UFZOcW1mMTRP?=
 =?utf-8?B?VG9YWjB6bElwZVdkcmtUK2QwQ3gvOW8zS2JNOVFzVENIYTVNNGZoV3lRMlla?=
 =?utf-8?B?VXJWM3JaZTUwdVZqRWZ4UVFaVGlaV0g1VWcrV3JVUy9HWWxDQmVkUzVUaDhh?=
 =?utf-8?B?by9yVkRaL0twTlBnYitPQm9RbjZSbnNoREovSjVkVDRRdzRodzJOWFoxaUhE?=
 =?utf-8?B?SVFpQ0d0eHhodWJMbGxhZnNXeWNPVGYwTEdjRXBRckx0ckRNK0U3YWE1VWh4?=
 =?utf-8?B?azBQeFdtZkIxUVFnQlBZSjF2RmwyZm5XYkJXV2UxTEEvYlhmNTdnUXZVV1di?=
 =?utf-8?B?VWNoS0lEZUw4em5aUzhVdXRDeXFxTDk5TnFBb0VVM2hVelFNZUdSSmw2aEky?=
 =?utf-8?B?b3ByTTdDeDFDMFoxNWF6YUF3V2pGZGR5L1d0b1BhanJsRWNPaGVERmVEWjBJ?=
 =?utf-8?B?RVdUS2tyUHdtVGtXK2Nlck1JYVpzVlBmaC9FcDFOOXJ2bndIbEhTRk13dGY5?=
 =?utf-8?B?UmFBSStMRWVKdS8zUVNYajVUOHMwb0MrdlJ4WHA1QUR4NCszVmgyd2VOMzdW?=
 =?utf-8?B?cHo2WHM0U2p3Y2VWTVFWd3E1WmMrM05kaFNTQytraHNkVXRWUUxQUU9kQnQz?=
 =?utf-8?B?MTlXZFlPYlJEYS9vQWhZRkxaa203RjQwYjdCQjJYQmJ6VmJ2SUpkZFZVVkNR?=
 =?utf-8?B?NVhRVmdua1hQK2QvZnlFdWF4RGpYdXZYdnJ1ZWdvN2ZPTHplTmZ4T0Y5WlNm?=
 =?utf-8?B?eDhxRTJSd2NxbndTWDhnRjU5bDNmVkNmVTEyUmxyNGh4L2kxcnVlZFNQWDd5?=
 =?utf-8?B?bFhtL3Fid3daZFZOaXlJNjV6TzY1UkplL09LUWI5TkZXVWJNYU1aVDl1Z1pw?=
 =?utf-8?B?MUZXS2NKWVFDdUVheE9qY0NIVUpxdDRqLzRLTVgwQ3B5NFJwbWQ5c1dLb1BK?=
 =?utf-8?B?c2Y3WTViMjhKdjNRS3VSZ2xESFU3dHJMKzJQT3g2YWkvNFdrM0VHUngwTm1D?=
 =?utf-8?B?Wk82QTN4RFIxWkdzTHJIcEM4ZjVtVzBPb0ZINmlZNXMzdGxGNHdMa2hQcWE1?=
 =?utf-8?B?S2pDeDVEb1dBdEl6a29pVWZnd0EyZ2JZYXFrc3pLVUNFQkg4cGZ1WnFVMTZ5?=
 =?utf-8?B?dkRpb0Q2UC9KdFQ0YWp2Y3FrNWdNbDBaNmV3bXF3S01FQnQzMWdOMEVQT2ZM?=
 =?utf-8?B?K1grK1hVays2SFRUcHhNZUZFM0lXMGhjUi9CZ3FHYkE4N2ZXK1NIek9uNDJL?=
 =?utf-8?B?QUFydm1jR1VZaktFTDltcjRNZFV6a2tGeHFCSCsrU0x0QUswZ0hGRG0xUXBU?=
 =?utf-8?B?UzVXck4rZU1wMFl1STcxL1VhQlgxRnd1dlJTdGpHWHlyNjF1STZpSitpWWNN?=
 =?utf-8?B?RWUweE1VTEhZVFVWaDhqSmV3NlZCblIzUmtZV01JVXY3OEdFeXFHazFETzBl?=
 =?utf-8?B?SEx6VnhWVGJJRkdxRlQzVVZNU2ZvSnFHSU16amloMHJHbzVMRzJTbTFLTUJt?=
 =?utf-8?B?ak1GVEt0aUV4bitUU0VYN3FsWC85SmR0WVg0S21vckxCMFNZcHVMTDVFYk1t?=
 =?utf-8?B?Ukt3SDRScGNoalNycGx1NFpXZHVMRHhxdHhuTUNHbnBnTjFlRExVMHFuVGl3?=
 =?utf-8?B?cUhQRTh4RUJkbDF0aFl1NDdzSGE4MVNJekZKNXRQQTU4TlZ1TW1qVGNCTDJR?=
 =?utf-8?B?MlduZTREWXZrTnZjWGFtNDgreXdtMVdvMnNBUzRKY0lwSlhYWjV3Y0pEUjlM?=
 =?utf-8?B?ckpQVjdlbHFwOFhnQmxtdjRtWFE3Tk5FOTJEd1JYaUU3Tmp2QkFiU3ZWTFFB?=
 =?utf-8?Q?E0ImwlscS8uxax2I=3D?=
X-Exchange-RoutingPolicyChecked: pR7K3XEX9pFBlK53pbHtS8SmpqFGKqMsvC/XTfMJQZTQXZV+wrte2moKmc4Lo2F0JoMZiz1F0cMLXKnQF+DohzIdNGNgDYOh6AwTiIXYBqcQ5Ma2gjsk6jGPqzNDha7YLqcPcs4lj6lI656/7JHLkRSiIXgQcQLdzgjkqUQ+VerTQWM9MrZa4HNHemnlUuuDMuPcR/hPnZemQk145yyfpde+UIwqa4p+3l8u032JaVyEMIxqRlx0uGcPGD1ZG5eqR8pqyPItFYwVzAWsqKbSKK/vWqeOfVuIfisMRapCfY9K8GWGNdW0msgubg2/UsG9WKzihsqHgFUFtpjVhytlXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aac7206-f0bb-493b-ca23-08de90df32dd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 17:42:24.0038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSWa9B/EEv4uDIYPhJZXujBfkUa9jQKnIspbtryOSRTHdtGbt1pTcSbONlW517kT8BFO5QEGblUhBIYIdvClOtUL/7Y9Qax2qeS4ApXgH9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
X-OriginatorOrg: intel.com

Hi Yifan,

On 3/24/26 5:50 AM, Yifan Wu wrote:
> Added linked list based management for IMC counter configurations,
> allowing the system to dynamically allocate and clean up resources based on
> actual hardware capabilities.

Thank you very much for taking on this change, this is a good addition.

One note on the customs, even though this is user space code it is the Linux kernel
developers that work with it mostly and to support this the style is expected to
(as much as possible) match kernel coding style. Specifically related to this, please
follow coding and changelog guidance in Documentation/process/coding-style.rst and 
Documentation/process/maintainer-tip.rst.

> 
> Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
> ---
>  tools/testing/selftests/resctrl/resctrl.h     |  1 +
>  tools/testing/selftests/resctrl/resctrl_val.c | 25 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
> index 175101022bf3..29c9f76132f0 100644
> --- a/tools/testing/selftests/resctrl/resctrl.h
> +++ b/tools/testing/selftests/resctrl/resctrl.h
> @@ -24,6 +24,7 @@
>  #include <linux/perf_event.h>
>  #include <linux/compiler.h>
>  #include <linux/bits.h>
> +#include  <linux/list.h>

(extra space)

>  #include "kselftest.h"
>  
>  #define MB			(1024 * 1024)
> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
> index f20d2194c35f..ac58d3862281 100644
> --- a/tools/testing/selftests/resctrl/resctrl_val.c
> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
> @@ -28,6 +28,7 @@ struct membw_read_format {
>  };
>  
>  struct imc_counter_config {
> +	struct list_head imc_list;

To make it obvious that this is an entry/node of a list as opposed to a list
header, please use a name like "entry" or "node" or similar.

>  	__u32 type;
>  	__u64 event;
>  	__u64 umask;
> @@ -38,6 +39,7 @@ struct imc_counter_config {
>  static char mbm_total_path[1024];
>  static int imcs;
>  static struct imc_counter_config imc_counters_config[MAX_IMCS];
> +LIST_HEAD(imc_counters_configs);
>  static const struct resctrl_test *current_test;
>  
>  static void read_mem_bw_initialize_perf_event_attr(int i)
> @@ -235,6 +237,7 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
>   */
>  static int num_of_imcs(void)
>  {
> +	struct imc_counter_config *imc_counters_config;

Please avoid variable shadowing.

>  	char imc_dir[512], *temp;
>  	unsigned int count = 0;
>  	struct dirent *ep;
> @@ -263,14 +266,23 @@ static int num_of_imcs(void)
>  			 * first character is a numerical digit or not.
>  			 */
>  			if (temp[0] >= '0' && temp[0] <= '9') {
> +				imc_counters_config = malloc(sizeof(struct imc_counter_config));

One example of the kernel coding style applied here (see "Allocating memory" in
Documentation/process/coding-style.rst) is to use pointer variable and
not typing out the struct.

Even so, this does not look to be the right place to do this allocation ... (more below)

> +				if (!imc_counters_config) {
> +					ksft_print_msg("Unable to allocate memory for iMC counters\n");
> +
> +					return -1;
> +				}
> +				memset(imc_counters_config, 0, sizeof(struct imc_counter_config));

Please use calloc() instead of the malloc() followed by memset().

>  				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
>  					ep->d_name);
>  				ret = read_from_imc_dir(imc_dir, &count);

read_from_imc_dir() obtains "count", which is used as index to imc_counters_config[],
as reference because it increments this counter. Doing so enables read_from_imc_dir()
to initialize more than one array element.

Only allocating one element for the list thus does not look right and I would actually
expect this allocation to be closer to the initialization where it is known whether
a new element is needed or not. Having new list element allocation within
parse_imc_read_bw_events() looks more appropriate?

>  				if (ret) {
> +					free(imc_counters_config);
>  					closedir(dp);
>  
>  					return ret;
>  				}
> +				list_add(&imc_counters_config->imc_list, &imc_counters_configs);
>  			}
>  		}
>  		closedir(dp);
> @@ -303,6 +315,19 @@ int initialize_read_mem_bw_imc(void)
>  	return 0;
>  }
>  
> +void cleanup_read_mem_bw_imc(void)
> +{
> +	struct imc_counter_config *next_imc_counters_config;

This could just be "*tmp" to make its usage clear.

> +	struct imc_counter_config *imc_counters_config;

I find the "imc_counters_configs" and "imc_counters_config" names too similar
for comfort and makes the code harder to follow. A short name that is obviously
different from the global list name will make the code much easier to read.
How about "imc_counter"?

> +
> +	list_for_each_entry_safe(imc_counters_config, next_imc_counters_config,
> +				 &imc_counters_configs, imc_list) {
> +		list_del(&imc_counters_config->imc_list);
> +		free(imc_counters_config);
> +	}
> +	INIT_LIST_HEAD(&imc_counters_configs);

Why is INIT_LIST_HEAD() needed?

> +}
> +
>  static void perf_close_imc_read_mem_bw(void)
>  {
>  	int mc;

This patch allocates memory but never frees is. This is done later in patch #3
as a fix but that change would be better as part of this to make it easier to
consider the memory management.

Reinette



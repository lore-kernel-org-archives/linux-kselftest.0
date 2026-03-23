Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020B0282F35;
	Mon, 23 Mar 2026 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281133; cv=fail; b=uLjQrGYuNJwqWpnuZRatYa5+Ja5dwObk+fBD1O+dRN+YYK9NDbFCl7OMLakiWoLDyFXi2JcoqpFG1do3FzpbpOo+0a8hJ1t4O5U7gX+J/CrZcJ2vNAGAMVinYEtqvdtoCKlzC69y0V/qfA9h8uz8odV9ICJxyEf2U3xeWzwskp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281133; c=relaxed/simple;
	bh=xjKY0rUNG9/usOi4PzXBcmAZzqXAqnhqUWFpRmCSD18=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JVVCvHqhy5bARajFEBhihfS+5lsZdmocILCpseSjbzL+P1mrIbG4pl9u29QgFkYD0ApPb4hhz+l6r/hnwMTjv2KZ3pJkjV4RBYmAM914o5lsVekgT+DhLyDuuLJ4CTRccbWquv7hGFjGi8z0iGSLjktbR3Dzm8F+uPW3W1Ho1lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DD9hZXPo; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DD9hZXPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774281131; x=1805817131;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xjKY0rUNG9/usOi4PzXBcmAZzqXAqnhqUWFpRmCSD18=;
  b=DD9hZXPokIzUjSm7tcaXmYJ2cXHOcy+Nod1bS3FGI3izRrFn9VPhPXy5
   of3ESZRLRxFB3wpvE5YaRHBGE1iXAxTrcE0zAIBjCcBeQ5bfXxI18eUS9
   n1JkTn3wxSP9G5Xj5KpMNaw+c355jltAxMdovOilJzcZb+7a1OJwZljHO
   13wX/HOKeHaf6vu2eDCEfUGSgh8YL3Iix/7Vp7CvoEQHzmpxxDOIA7+LG
   T6H0scpYziv8XSD11GkDMfof4NVjq/y/8RBNA5l5hBC1vWx4eGwhMAyM/
   MdP3Sx+Cxb2t8zcYO16EnaJdw8rx6y94jknhE5US7dVFiRsiMloVW8TFi
   Q==;
X-CSE-ConnectionGUID: uYKYWafLQfGWiw5El2D2ag==
X-CSE-MsgGUID: lPeHNQc3SPWHeZbzBUIrNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75304282"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75304282"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 08:52:10 -0700
X-CSE-ConnectionGUID: EVa7rib4QCmhCUftbg3TcQ==
X-CSE-MsgGUID: 5doWJtrbTR6nU2d0wzPq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="225772503"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 08:52:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 08:52:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 08:52:09 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 08:52:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUjPrtPgHm5k2qqAiWzQk+nh7p7Yvh1A4ajFyvGTz6p2zV/KlVBqoTCNuWJchbRXfLHCKyF9YAfRhyfY9v/K2pAADbmLut7TeckfoZPERvJy5Y9N0leFXIwRajkidJcR7XjBBgo4UlZuLzyxSag2bxCm8kwU4/PIghWoE6lFen1z+qGQzVDFcALzPPy0F6GQVZJl1AaYilnz+26gugvHQWCTmyhBeUBIru0rt3I4vIg37B0iv3CuTHhGu9sfoJmxLO86vlT9dVRaZwnEihe4/3rJ6a0ShUs9aQsFAv14MLTsE/EpWT2UA5kauf19tUBx+45qdL0LhUA6yxClqE/FFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEB01LHLrObMVAaVk8UvbYqIN6RpeTSWitp56ndL46Y=;
 b=N2a/yGcdzf3BgoQMFumOfrueOc1iY1UxuIED2ZwE1zltIK4FIrpKAom/qLwIcnDlU5S6oIjf8JHwWmmmNDaCmN38v8p0iVVBg18SmStTX2ygu5a5aGF+IQVzyx8FHogqDOkkQwpAMmzpFkkxGixKMCzPTkIZDbwzPG336uOZxzU39Bi5nKiYQZ+CAjCuMch/mewfPGC9lmjyXsvUQ1G6hmcrF6Z5A8LDGslbzyWekSwHDEM1WzX2d4vQZPM/xlcFsYRuVXYVBrIvO6OdSovpQKw5DZ8ltxpLEU8lN5/Bmyqvmr9sYxsWB8vZHYAZNllFZ2eXqp14+/uu/3gmw0VjxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by BL3PR11MB6412.namprd11.prod.outlook.com (2603:10b6:208:3bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 15:52:05 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 15:52:05 +0000
Message-ID: <27737fa5-0f32-48df-b9e4-cce8e7cdd18e@intel.com>
Date: Mon, 23 Mar 2026 08:52:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 8/9] selftests/resctrl: Add support for HiSilicon
 MBM/MBA test
To: wuyifan <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-9-wuyifan50@huawei.com>
 <c0bf5728-55b5-46e5-aced-4f856144f746@intel.com>
 <76186614-aa16-4a73-8fa9-059bb0a70486@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <76186614-aa16-4a73-8fa9-059bb0a70486@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|BL3PR11MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: e9fe00b5-42b2-45c9-3f03-08de88f42193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: mXnghPaW+sfZAL10n+HqKIuTNvE4htzTX9Vzl8/bNqVFuNdj0FLPtH8aiCqvlIP+ZW6TdiY24LKcplG2Uk0rcRYntFLZPDHd0n4X2kTPqV5UfUIemcuOFoOsm37dYamHo0OFXwbKqcSz4ty7Ig21VhNbOjCsipSfaeWPUzjFq6YeK3/78djT7zejgRS26H9fBj8h6QpeSM/fXK5tSVyUuxSf2ViKQPeCg3rEynU0W2iWSGuSwi/zIcivGNZQWAywctJEv2xXILt7vYUnx916cj8X8Ktx5KNV7hG+1fx9D7Sm1IJVfPJVslz5jgRB+dyCHODPMAx1eOrHIEBqM1+JqwFQTEHzpm3HTBTuHXBxcbh58CGVsi+LNM2zOiiV2KL+Hjx/7rf7WLEn9rK5CGb33T47Sgu4IJS0MM4z1lqjwe3CFUOfY1Y9UJl0WZlQqqC+s7Zq8NBlYwPZk+Chhd6A2kppEmlqEmsYYPeT6gYFlQE/84wC4HQvq8MFFUslipDKxk5gg01+cq7iEiSadgAXqBC2/ByYmj8vuIrtlPVu8cD8OcNQhcK845BmJJG62WuKqDMtGZvMKru4eriCZ3wqloNOohXRcO9pTzmxpWpzvmW8d4xsezEg5/m537kY9rhVY4FXnI9KdnVlXpkyYwhCv42a+/4DQN+DGw1pWuhD8ITI1HL+5X4yqa3WfK6bRUg1NuYOyTAvKfpoaHTPKLW7WMu9IDDihAeu1NrceBMPyhQM/xnf/ceVn5M5eaewikWF+i2Wn35Hovb3UzXQVxfvXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzU5MHhwYnZEMGRSdGR3LzdKVmkxQUlmMVdFQ00zbVNyNFI5VmFVSWhvUE1a?=
 =?utf-8?B?Z3dURzJmZUQzdjl4Zkpob3N3Q0ZmZ3VUcEg5RzJacVJGYzRoMDNiK1NWZkl0?=
 =?utf-8?B?aVBOeHk2WTBHSnNpK2JteW1HeXFTbm16L2s1cEdwejNzWVhybHpJMTM2Vzd2?=
 =?utf-8?B?QjROU2FEL0JVSHJ4NW5uT0lvbEtMV3N3VHN4L2ZIL2QwRjNFL09qYzBHNXh3?=
 =?utf-8?B?WTBpYXdKTE5pcjBRZGdVVFo3RFBLYzVPMlFxNld1YkpMNHY4b2E3d0d6SE9M?=
 =?utf-8?B?cXNzU2hzdmFablIrZG5weHhzVTBnT2I0eXZlZkJKRUJONFZxdjI1cEFISnNw?=
 =?utf-8?B?NS9sN3B3RVBvVVNrQjBMTC9seHhTQ2pQYmM4Vm8zZVNNb1JUMFd3Q2dXUU9X?=
 =?utf-8?B?MC9yOThGUml0ZnFnT1B5QnQreVp2eUZTa3FRc3hOZVdTVU55SUJxMmxycGRs?=
 =?utf-8?B?QWVJenRKbUtJZzhna0w3d29jNmVEa2Vsb203RVlDa0NrNHErcW1DL201RmIv?=
 =?utf-8?B?d1BvUE94VDJiZVk5UDZ2aXVoWkJMdndHcVJFRlRXazJpUXpJSVNpZTMxa0xz?=
 =?utf-8?B?bmdBZ05rd2tSdkdacnQwRTlPb2JJeXdQM2NTakQ3ZExnNE9uQkZqdkJ5dnV5?=
 =?utf-8?B?K0Z2TkxkSkRUQldtWlpWQzNHU2NlcFhrRUl2RC94VmhiSENMMmxhdThFTFdL?=
 =?utf-8?B?Nnd3R1d1L3FTOHlKNmFzaVB2bHpsU1JIdFdKY0ZQNW9MSHhjWllaRWhGTm5j?=
 =?utf-8?B?UTFUR1NQY1drcU1TeU5vdDBoajd2TVpSU3hJVnREMjBWUjJSTDFPYnVpUVpx?=
 =?utf-8?B?d2VUNDAwcDB6NE5rRWN0THcwMEwvZEV1dVV1ZS91dldhUC9YK3JDbHVmZXV5?=
 =?utf-8?B?bW1NSy9wNGI5NmtHMy9QN015dGtmbUZCTUpKUTUxUk1yRmFvcTViSHpiMkNU?=
 =?utf-8?B?R2lKUExrN0JnNjVqWjh4TnFGZTc0WXR1TUJXT2lQZWNad0dUWXNDcU9ZYkhR?=
 =?utf-8?B?R1RLU0N6bTYzNDZ1MXl6anNLQlFMVDY1Z3ZEQ01uUUtFTVk4WGxzMGxiRmJp?=
 =?utf-8?B?ekJreEJ2WG5SNmFGa3pLNkVkTU1zUTVaVGNLTnp1ZlFhUWxXMzAweWY5STJp?=
 =?utf-8?B?cFJsbTlJLyswcDcvT0RSNEdMNGUyMDc3bk5FSjRIeTZqNnJhc1hUTkVHSGVr?=
 =?utf-8?B?M1oySWFldW1pR2UxR0RaQ0szSXVxSE5WV041OHk0eWc3RkxWV3NZSi91S1lY?=
 =?utf-8?B?RU9oQnJpUUhmeEFFQjROVG9vSktvaklmNE84Q204KzE3NVQ3YWo4aGFDZmpw?=
 =?utf-8?B?MUJxRHlsZHZQeXIxSGs2N04walNMOEdoU2JSMVlWT0lWRXZpVUcydGx6NlVI?=
 =?utf-8?B?M2RaSnRUMDlYTDZ2akJra2JNYkg0VHZJbHNuaVlZNXU5SnBIc2VOaXhmSm40?=
 =?utf-8?B?R201YTFYZ0RYbUZxM0loU2tJYmRwZXFXcnhldi9oOFFvYzVET3dLRDJYZG4v?=
 =?utf-8?B?TkJDN1RDV1VUa0FTWnRpdVFUdnR5V1ltcnQ1WU1WejZPTlUrQlk5Sm5sM3FH?=
 =?utf-8?B?a1J6bFNSUnhVdlNMaHBXdzRRQmFlV2ZyV2hoVjdrdTVXRzgyUW1FUXEyL3BT?=
 =?utf-8?B?M0RkL1ZHRlYzZlBUR3NINzhYN2E0VmRtbmdqM3hWbjhRN29lcTVQUjBqMEx2?=
 =?utf-8?B?OEJKWEtoRU52RXkrYVEwSG5uNjZRTmFEaGhJY29hSXRFdCtQZnNBMjVUa2JU?=
 =?utf-8?B?RXlMZytVOXh0WEtqaEFNWE84SHgzZHg3QVBLR1B2dFNxeVdyRFNvZWdNR1hu?=
 =?utf-8?B?ZzNlamE1M3NTeVFpU3V1cTlmQ0JGZ09NNDN3SXJNNVJIcVE2M2dtemJleWU0?=
 =?utf-8?B?TzZYUnpuM1JYUEV0Y1BIUHpvWTJZdU1NRlFWTkluSXluMHBmaFpaUkhranY2?=
 =?utf-8?B?NlVBQVpLUlhYYW5kZXh4ZWZHZEt5NEV2UVlQWlpJV3cycEt3REttSm5GdjNv?=
 =?utf-8?B?ZzJ0MGd2dmkwY2xiK3kwbEhoWTA5Q1RkbEo3ZWo1YWswUkNLcGFjaGQwUWhN?=
 =?utf-8?B?OVFEbEZHSHM4alUzcHAvREx0em1pbXJVQ0VOUkZaSVRtUERMakZQOWJSR0Jm?=
 =?utf-8?B?TG8zMHFTc0R1eW9aL2dCYnAycVMwYlZGZ2JiRURXbEJ5bGNkd3gwWkNnZnVB?=
 =?utf-8?B?b2kyYko5WnZiZzZoMkRrVGdvTndBbmthNTU0OEF4OHEzNGVkMEpKekxlSUlV?=
 =?utf-8?B?TThwMzR4Z2FVNHJYa1ZKZitmQTUrcFVLT1J0YmJGMGdmQld2NCtjNEhQSHNl?=
 =?utf-8?B?VVVnM203RlEvOG9tVm9sRUNiZUxwTmdoSnk3ZlRUa0JpNmtBNC9kdkMzZ3Ay?=
 =?utf-8?Q?jrbBvm5lItPXYc4E=3D?=
X-Exchange-RoutingPolicyChecked: M9peO3XygTtYBt5HcGAPCAKawcjh4T100vyR/KabM1xmxxxdhFb69nA5dOBcV+eHInLzDHk32VeM78HpexX12Yh0MWToFZRop4CUffOMTcr/g2W+bmMKVuQBQ0qQoy6HEnzzSeCWJt1UfkPoELiDiHAMOZu/Dt5x3iMQFnveRhygbq3WB+BKgwXc1vD4ePQjNgur296/syXwbC2O/OAYOgVgVy5uDJqE0RW9phvdUWR3Il4zMbKEWH6E3KODxOKpLfwbvrA4BcUZUaTaWCK/2CIGmDv5bTYkPDh/qq9fU8q8xHCHw/j79mJrDJKLW7UI28CC4ZTh7/a3t8vuOmdTkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fe00b5-42b2-45c9-3f03-08de88f42193
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:52:05.1178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTr+3LdLBgPeTu1jld7m0j4MyvNb7yswmMWEy2+GyIiau/NIFrYBNx6+YjiZV39ScsrObSfXFXgvXkJcf7nqpm84GjxSKfeaitEAFLGs8nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6412
X-OriginatorOrg: intel.com

Hi Yifan,

On 3/23/26 2:19 AM, wuyifan wrote:
> Hi Reinette,
> 
> On 3/13/2026 5:01 AM, Reinette Chatre wrote:
>> Which baseline exposes MB_MON in resctrl?
>>
>> Reinette
> In the MPAM architecture reference manual, the memory-system component
> includes the cache and memory channel controller, among others. The memory
> channel controller can implement a memory bandwidth usage monitor.
> I noticed that arm_mpam maps other classes to l3 in the resctrl glue code,
> so I will fix this in the next version.

Were these tests written against a spec as opposed to the actual MPAM enabling
code? How could it have been tested?

Reinette

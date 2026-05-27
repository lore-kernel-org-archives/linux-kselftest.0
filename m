Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24018250C06;
	Wed, 27 May 2026 04:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779857561; cv=fail; b=p9SWB21XIvRB9RcLp+npXgchi5f5wI3ih1qtpUI3xvrow/kxsfCJnSTcdQrplgNClHmpbTXUdo3TPd5LTd9HBCZZudy6mHpZOqw9D7JM28qC+X1f15fsxc2Q7I95fppUelbmeNvIzh4J4D8LgWh5Ce1s6N0w3vX20ZKBq7nmjmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779857561; c=relaxed/simple;
	bh=oq8HghSP4lDsYgjYqrGttwuW+sNAnY80UTisijXnT1o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bPtwSU//RW4srbL0zG8eDWruR8hnxka0IWZ7Hljp5RmZ1he4ASlJSLULGQnrpBU60at5xXQwV6C2xUXJq7ka+9w1bigRmVkuqu8Obv17kmFow0L8H5NRMBdWuA9DeXqyNoAiooSQgZt4u9eZljOsJdGvmgFgbVB/cIuAjN9zX9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=az3EU1Tu; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="az3EU1Tu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779857560; x=1811393560;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oq8HghSP4lDsYgjYqrGttwuW+sNAnY80UTisijXnT1o=;
  b=az3EU1TuuqQ4YyK8vDGwjqii/f4tsWwMO8e02L+QuE8grcBAvffajeg5
   g2Lce+11whd+SqCpt+YMLWEYGyxtE6u3i7fM/eHR3EMC1YcISwU2r0mM3
   n4cP6p6/qqGxI/9/HY8xwNdoGGDL+OxCqw/TuT2t+Eg+J3xIKXo7SJETK
   fz6f4ETC3WZW3z3Of3iYBILXBuknrM0v9pLS2NIu9muchUq+MP7VnSt1C
   p4HPADl8b6+uGw918gAV2NvoO7TpEeCX07dOnxYOZad2Xn3XFvgQ7sXdV
   gKk0A2xX57WyZAIJKCRHZ5WA3/WCWQhOngrlPN0eUHREgjFQ/Tu36Oat0
   A==;
X-CSE-ConnectionGUID: xLgYe0zPSZKJ3BiinmSSUQ==
X-CSE-MsgGUID: HhTt0qPASk2oHTuhwdmrug==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80529045"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80529045"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 21:52:33 -0700
X-CSE-ConnectionGUID: +JSO1oHvRymCLjEOXYnqDQ==
X-CSE-MsgGUID: xrybDgOUSe2ue3KGEviXAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="241962385"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 21:52:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 21:52:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 21:52:32 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 21:52:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3VY7TyrcMcaNzj2MEHonr53Lx8nK38+eOPe0k2RVWTPZh3GwaqR3t8h3ytWtjXzZIOeE/PRsGlTAgXl3Lm/s6fef/lFO09hEb5CIrYbuBAZdddCKHgitsGJ+YOka9WzbhDz/xtCnDJtAfnKz0yk8i56dmhUw9yBcqEyLcFbbWMUTp8poQcnzzd1TCcTUgNCCTU9Zfi6wiDh8RTXdPTpyHyDRLVa0K62W523jRKNljfDhdi1lOEwaWFzh8fcbsIw3XbEXLv1MZggpQIvXkpl1B7knZnOb3rTpZKWNYjvicAAyuNsT06fxp3XEm+hciuG7fwCzYAZip1Ya7USJJTWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LDjvBuM9xlwUjsHsgH9tDw/pVI7uPhwgaa3XDnfUI4=;
 b=inKH2486yN9mIDMaEEOA7Qjsb1VfNEIUVA61MgToeOC4LsWDReb+P54L1LqVwF6lq8OKLOy+rcjQXfY5TfbNXWX8vP71QoTlqksP9Ovn43yQZhTAvJT4gPMpwV8uESU5rLtERzbJ7omqdMmxEKLRhLp6BfKo3ybeYoQMqYF02qqnod0obeawGAq+w4FS1PagtaCLKLn2iV+jfCugCf63fH3hLIST6hp+ddR6MKfKGNED/KfPva7jielutsTP0v6OcF7q5tt1LjV5nUF/VITpIcBtXZcLPqH5qE0WxbQsb6D2i0rthtXBJtfDvloLithrM4QCuOva3Sot1dgmxnMjvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH3PPF018EB8BEC.namprd11.prod.outlook.com (2603:10b6:518:1::d04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 04:52:30 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 04:52:30 +0000
Message-ID: <17ef8f17-fe81-4915-9447-69e551700551@intel.com>
Date: Wed, 27 May 2026 12:52:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/resctrl: Allow CAT testing when no exclusive
 cache exists
To: Reinette Chatre <reinette.chatre@intel.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Tony Luck <tony.luck@intel.com>, <x86@kernel.org>, Dave Martin
	<Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu Moger
	<babu.moger@amd.com>, LKML <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, Hongyu Ning <hongyu.ning@linux.intel.com>
References: <20260523101715.3964456-1-yu.c.chen@intel.com>
 <db89b830-997f-8f74-012c-9aece7fa5c34@linux.intel.com>
 <09c77f99-0c8f-44c3-8971-aaec094053ca@intel.com>
 <3fbb001e-bc78-45d6-92fc-4a8dcf708c58@intel.com>
 <a5473762-fbd8-4aa9-85ae-8bc8108e1d3c@intel.com>
 <c1c9c019-81b2-4d6f-a2b6-30e63c99efb1@intel.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <c1c9c019-81b2-4d6f-a2b6-30e63c99efb1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0050.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::6)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH3PPF018EB8BEC:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8e4071-8d2d-4ee9-4022-08debbabc1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: pJ+6WzBrj9kzQVFpC7FNv97E5dX1FHwNRIerraBPWhoiyOjA3WIjEDIXpgZn8Am9mp4vlh3mQgxAgEe7C9w8RvZ5dLM7xJgL+jkfX45acuzaX8uuoojjn469oWk3L6FGnAIkUh4t/Byx8he4gx5WjjQfs93rbxsJbDx2N3qlxVjR0UpkkmIg7GZR8AmUodTggNtzJJfSf8ffdRm4rPlP705vuIxF9N86+XlTAGduN3dV5hcwAPWuHMeHjeZGJV/hGJAR5GVSc6Sxe+LyvYIHnt37PHzoQB6iUAS+iw711UnR7GCngW0HVuRCCFwIERnUn/oMXWHOR0hZzlLfqvVgLMaELiYxxr+9ccsB18cHdt5nm+0tJ81mrGvtZe2yHQwi453XObkPKA3qDQGGK7XUzfnzvoxYRvDBDwwrN+4asmy02gfQBCWSbgbK0n2ELxIvlny5kbq/zvegd0d0Pc+KaqxFCRFATm6FWIbu+ra7aXH9Eh6NmcdJbrPUppS7lfzO3HSTRe9TZ8QhM87mCoSpewN4wG1vqgorwcIdrGDwYAbu1H6/dXuP9PID/ld5kgZ/kSFFZf7LKnT4RQKdSi32FZs+SXvuiHE8cby80IPuKFGNrFPlc35q8i4Jz9pCfK1INX26xrqIZaH+d5BfpMZLPcN+94liaYwUQHRM91V7GImluS5q4IHf67FYOtcR6Zq3bBdn40TA4ht3ZUXdO8KJ5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alR2QVkzR01KWitiblppMEM5STRnTm9EQnZXajhzQS9oT29LVUxJR2d6dWlj?=
 =?utf-8?B?eUJoeFRqYlZNSkhtUFZ2UnM4U005RU5NWXlWNzltckI1bGJlWjlVb0xwa1RL?=
 =?utf-8?B?NWtOQ2RraTZXZ2NaUVo5c1lCUzFNUTJ0NTRLeEhhL3dTd1NYdm9GbnF5d3pL?=
 =?utf-8?B?dGROQnplZ21qbitVUXgzMU1TU2E4c1JmNWZKUXoxbTEzZ2RKekIwWWpPQjRw?=
 =?utf-8?B?elNyemU4RVNHTUNLWGM4QmlYRkpTR1ZRT0p1TWozWGdENU01OW42YUwwYUN2?=
 =?utf-8?B?Unc3YU5KQWl3TlVsS29kNlVKYzcwOVByRHM3UlRjT2lPWjU3WS8xQ3JaN1di?=
 =?utf-8?B?alpSUlhEOVJqYWc5SWZ0UTczNS9jRkpMSGlVUkJXY3FNZUNvem05cWVqeHQz?=
 =?utf-8?B?Mlk1OUNOV01FWlNDVjc1cXVnOThrcmRLZUUxcnhraXNNWExKaTlzSU9GTTZa?=
 =?utf-8?B?VnNMSzRZZ0JmUy9yS0tBOS9PSlFkbXluYTNrM25FWm1Hb3kwVERtcWtORm9O?=
 =?utf-8?B?MyszUzBrOUxSWUVLZzdYZmtMTFZ0ZkU2Snc2eFN2c1RkU1dwSFRSN29VcDNv?=
 =?utf-8?B?OStGMUFPRDZ1YTUrVU8vSWw4R0NKV2Q4VWc1NE1ObU1TbitwdjVJT3I0d24x?=
 =?utf-8?B?d1MrYjAxRmJrejBMNFMxbUFMdlJyNVdaMmxKN1JKbVpCc21rZWVzRjFlbUtt?=
 =?utf-8?B?UERYQWtCT3NqRFhBVmZrQ2tMdXlTeDBSWHg3VnNtU2JpN09wa2ROZ3JPVzRR?=
 =?utf-8?B?cUNuV2QyMzQzb3hzcjNsWENieDN2RVpVYjYyaEtRdEpzMHFHd2VoMnBKODVC?=
 =?utf-8?B?eHVud1EwUEdlcFlOeENkSEF4QXZMS004ZWVkQ1Q4SFA0aXJ4dWJ3S1dJNHJT?=
 =?utf-8?B?dEU5M05pWEx2R3kvVzh3SlZRWXlTRUM0WHVWQWRpWXRpK1RkRGJiaUNWalMz?=
 =?utf-8?B?SUQ5QXphdFlpTE5jNXRVNHpqTitoSVVDK2l4b1R1TWFoV25tbmZrNGdiNnY4?=
 =?utf-8?B?bFhoS2ErdkJEZG1kbkJ2dzBMWFp6WWdBcHlOKyt3V0V2Ni9uQk5nV0pGMXYv?=
 =?utf-8?B?WFhyU0JtYkNqVmJsSC94S0JGT1dGRGRBeUhRNGphRzNpejZXNW85MFdhKzJH?=
 =?utf-8?B?cTJDTzRNMVFRcEdRN1BCdWhOVk41dE5kclhVZzZUdmJyRm1ZWjI4aGhBcUx3?=
 =?utf-8?B?aHVPdForVWw5WDdySEF1SGtrR25YanpQZTRZUWcrYU11Q2x2MXNkTGtxb1Zp?=
 =?utf-8?B?TzhVQzAyMk1jaHREUGFnajJCY1dJeTczdjM2QzlXWDRmSzU3ZDFIWkoyZFc5?=
 =?utf-8?B?QWZoeENWNk1MWjhlQkFaNDFLcGRmV044ZWo4bHUyOEhWME1iRXErMTdySE5G?=
 =?utf-8?B?bDNlckI5M2pQMElpTHBQdFA0V2pvVSsxVjlPcEh3Mk03c0tqOVoxazBzREdO?=
 =?utf-8?B?V3F2LzBTM2pyUUVPVmZzSGZnNTNaQWlIdjJDNzhHWGpEbWcrdTQ5dEl2UmQ5?=
 =?utf-8?B?RnJzbys0SVlEVnF0eW5aQW5heU5HbGpsRUVjNXgxWEE5clljYVJkQ002dDVN?=
 =?utf-8?B?SHZTRDVwWGRjc1pMNytNR2xXMDJ2T3dBR2lUMHkrWjVrSCtQYUloL2UvTG9E?=
 =?utf-8?B?M2haMmVGNjlRV1hGMmxUdzVYRzBkVjZHYnBKNFgyY1hqSXQ1aCtYSjM2L3Vs?=
 =?utf-8?B?TWtWaFNENzhYYi9JU2dHaXh6MkhvbnB0eVBWQjhNY3Y1MDQ1U3c5a0VkSEl2?=
 =?utf-8?B?YUNpRGNhT1dCTVZzbjhsMi9xUmFKNkVtZFpOUXUzb05WeU5TQUgxYjNpS1ZG?=
 =?utf-8?B?MGpwZDhVWWw4d0pkdTJrVFFVbVRaMHB0RmhaUDhjZEg3K2h5NUY2QStKWTlJ?=
 =?utf-8?B?L1NMR21vaW9SZDlrZjNQUEZOaFhwQzNsUTFORHJraGZIZ1BYcEQ4TkNMUkgv?=
 =?utf-8?B?bEd0amxQQzc5M1dQWklTNHBZTC9qQmJlb0JZaE1CamhCRytuTlZsK1Q3U0po?=
 =?utf-8?B?M1JwSDBaVHgwMUF2VVBZc1ZRWEpueTNWeG1YMFZjU2NqcEk4bWN6ditHelI4?=
 =?utf-8?B?TkR4dGw1K08vTXlRd0t4b1FyV3h3anEwcSsxV0lzbHpEZEprRG4xZlNjSGdo?=
 =?utf-8?B?MXQvSnJqbHRtUFlLSHAzb3E1WS9FeUJQdnMyZjBEdjVXSGo1OXNtR25STXpY?=
 =?utf-8?B?REdaRDZiOUY1OGhjZnA0Vk9EQTRoS1FhQjNHdmY5dVpKS21sOEMxZEwwWEhS?=
 =?utf-8?B?bElXaWg2Y29YTWJlV0YvQVd5QjA2T0FXOU1iRW1BOHM3Nk5yZE16VDlIb2th?=
 =?utf-8?B?OUZMRzU3NVg2YzNNZnA5Wmc4YTdmYm40UVIySVpVRTN1N2oxam5rZz09?=
X-Exchange-RoutingPolicyChecked: U0GgSIxfqcjOTZbZrCU25HTQYTOT0tahLsjxDOMIcnOpob5tQxFlM2o4V9NHP8PHljL8l5Bx/b9PKHEuutieKZP+ea9AC+BJwgJQdoGCEbYmfBTRnehP3rXMJ0+szluo7v+2taTOdPB60Ns+9w8l9ZEs035XcaL9SzDAnspm9QZQ0gCG5HZq+T/rRuJAYbxomVXyTRppNi75MlGSEckopUgBfPWoz6NWIpv7coUyRFz5hzXcdX7T1P2hIyxyWyVod9A7Fro1C4vPmsJTgfTdk34F8sN5wc/GfXd8Xp4Z9fb/Krn6NK8eyEfuWFrmsqL5uiMlc0Ge6lJEyPPNyjSYnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8e4071-8d2d-4ee9-4022-08debbabc1d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 04:52:29.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVPMegow33Fq82ccCdsDGEgMzgHsC/ivoxxIed/uID77OSh+XnglF//Mo6Vl9oyyp5IT0OyF6eoEAHUfwW9RFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF018EB8BEC
X-OriginatorOrg: intel.com

Hi Reinette,

On 5/27/2026 10:24 AM, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 5/26/26 6:57 PM, Chen, Yu C wrote:
>> My thinking was that shareable_bits only describes portions that may
>> be shared with non-CPU agents, and on an otherwise idle test system
>> the CAT miss-rate trend can still be observed even if all ways are
>> marked shareable. But I agree that this is not a good assumption for
>> kselftest pass/fail.
>>
>> So I agree that falling back to the full CBM is not the right fix for
>> this test. I will change the patch to skip L3_CAT when no exclusive
>> cache portion is available, with a message explaining that the performance
>> test cannot run reliably because all cache portions are shareable.
> 
> Sounds like https://lore.kernel.org/lkml/20260526024251.7895-1-icheng@nvidia.com/
> does what you need.
>

Thanks for pointing this out. I’ve tested the patch, and it works for me.

>>
>> For platforms where all cache ways are marked shareable, do you think
>> providing a extra parameter to ask cat_test to "ignore" the share
>> restriction is acceptable?
> 
> While resctrl tests support command line arguments I do not know if they
> are actually being used. During a previous rework we found that they were
> not behaving as intended and we did not receive any complaints. Even if
> somebody uses the hypothetical "ignore" parameter I do not see how the test
> result can be trusted unless this is done as part of some hardware validation
> that resctrl selftests do not aim to support. resctrl selftests are intended to
> test the resctrl kernel subsystem.
> 
> I think effort is better spent on creating an actual CAT functional test.
> For reference: https://lore.kernel.org/lkml/20250616082453.3725-1-ilpo.jarvinen@linux.intel.com/
>

If I understand correctly, what you suggest is that if the machine does 
not have
exclusive cache ways, it is not suitable for kselftest performance 
tests. The
only reliable tests are functional tests to verify that the CBM is written
correctly, and so on. I'll check if Ilpo's patch set could be leveraged on
this share-cache machine.

thanks,
Chenyu

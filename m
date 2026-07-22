Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E50647141A;
	Wed, 22 Jul 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713521; cv=fail; b=tiEW0pjQOMz5zWU4uGIBwI4LFz7fTpJizsoW3lqbgoifN2UIKhbkC+8XdgLnnKKyukwfdYitpSHv+1eaqkuJRtCc8G8C6ujQ89CADfNx4iz8tlgijmwPeATzcyu0DwollRNY450OIAizMXYu7KXxZv2UB60Z7P1pXO7yA8JZpaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713521; c=relaxed/simple;
	bh=JipqE+jfkPp/VkTsyuKaDsLCPlIcSEx67Vx3/++HJOU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mTXdZAn2FMiG//Iwd6mpoQz3gNRJZ9dzNuxRUxQCSZ3TlZYebRvuKE7xinrVTiZCW3/qie8a9Ngk8j3VuFDizsvYHiD2O28lMLTT1ATpULWrPBiNHMfHqGzVjpPSv36VMaV3MqcwpBSTIznaw6ysRY95nglyboP7q3q6GRi8o1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2nbNOyT; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2nbNOyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784713520; x=1816249520;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JipqE+jfkPp/VkTsyuKaDsLCPlIcSEx67Vx3/++HJOU=;
  b=T2nbNOyTYx8TBmuT96rqia/IR5+p4qGKBF0n9EdpYmY/Id5IF/PNiIb/
   Ximt2klSDcFGW8nxgTlBz+QDwYqDX2TjPI/kYRlHuwea+G7yfZrKK3iH/
   OPoscDSEigzd6Vpgn0VY9PWSPULWNqqoRJKPVINbDE2nZWbTdEuxbju0U
   QoqAfISTIyNmVMmQKk/uEE2FSBOSCNqZQpkJ5Ri5pF/wiLOrRbuDNmlK4
   CUeMjes+C1RMUs1SdKBeStuJJzTKB6pQy1NEpI75UoaH6Y+8AMDBgaw42
   pPJ+tSgvL96YGyye44GWNhQK/pJZovnp9gXJ4NvZ9kpYTmCLlYECHwTuX
   A==;
X-CSE-ConnectionGUID: g1INllNnQgCyIDiW21UR9Q==
X-CSE-MsgGUID: 04kFKirGRnCd6P30Em/4uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="87879892"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="87879892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 02:45:18 -0700
X-CSE-ConnectionGUID: 6NFil9/6THSdI0+9DSEs5g==
X-CSE-MsgGUID: 2macCuL9RPacnbzUg9PWGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="253684291"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 02:45:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 02:45:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 02:45:14 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 02:45:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7RjrEDtCkugmIjZ7vEjL1v2880SfF1MHeial1YluJEAtaIA+Cs4nqQ9vlSw05DYxwQQBwpV/qgb3aXcg86QUkIK1zIxJxWK2qIOYj8XMa24X/ltCMqBB1rnU03Dh0o6BLAz9eUaF/FszYZEpxxnGtvBeN4ZhvVMBfJ+wu2GWsUYVpH+yQMI020DGTs5Y3xPQb4dQDxGQsdJDjsNfiyhNPyfrsEyvVn1clmqRa4l2K02RGN0oBY/BPwS8jtuW0hbvlzVqJj03c1GyFDrqZq3/FFquIPBixreHE8xpOIIaIuQtWJGDpzCWrzYGwvg0K+KrEE+pjP50pwi4R/fD3o1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L99ra2N52L2ws31+ScPquPdjVMHvkxb06NaPWM0AERU=;
 b=yjbhJjEJSk96CxSgSHEvFQ0rDh77vDvbAbShdG6e3ed7Fo4/Gl0unAQeFtutDt0VomIAED6OPzGeljd25jXO5xSWl5YeMZvwNLfi/cukMr1TX7sauNr1ALJy5mJX2sg9Cehnd2UGXdAoGSUmNs64rZj6dJVLNzkquRtSCpMkThGY6n2vS7WdntHdL/nGpFdM7CZfmJCfQi6Gt/MgyktuNhT1g7QbPT24DeZHLARvjscgWbLEnc22y35Uryi3aJNVlEsI0id2Epzrs5cuZDJVC1/M+BDchb/SJsCRg7LCQbuYto/mG5DxgOT3wkzUVThOfgkxVdYOP7Wkw/l85yWBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:45:06 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 09:45:05 +0000
Message-ID: <719cd113-11a8-463a-a145-59f2b7460a84@intel.com>
Date: Wed, 22 Jul 2026 17:44:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] sched/cache: Add PR_SCHED_CACHE prctl for per-mm
 control
To: Yangyu Chen <cyy@cyyself.name>
CC: Tim Chen <tim.c.chen@linux.intel.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Yangyu Chen <yangyu.chen@intel.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, "Vincent
 Guittot" <vincent.guittot@linaro.org>
References: <tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com>
 <tencent_4F460FBE0B41016D2247455CEE988A90D707@qq.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <tencent_4F460FBE0B41016D2247455CEE988A90D707@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0035.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::17) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA0PR11MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8dd5a3-fcd8-4948-196a-08dee7d5e902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: TADB1/jkQW/SiRMicfSk++PvdI6lxzykYPdGjik6ORHV8cY2GbiNhZ1oFKTFcSEtEgJEMUPtsmbudk5zJiHHuOCU20PaYL7MSxLogchxNQv3hIba8Qs5gDrigm6Bj+kHbDRDuZxg4k3ubqpPX+lY7cf9bS0Ka5pCa2DKrQdnf7xpEGTz6bIbd4c4OQl8fS2O/OMAVrpHFdurpVazeWqy7W3/tnDl74D4LfT418SsQjEHLYcXdhq2aQsJvYGoF9MzxyM34JoJe5UJV9sVdGNu+w/spYLLXOg2zxTH8JjD98Y1lOT5QqaCKhuFkbqQ/dD5oSb5dHQh7tlUzuBkU/4jeqJ6ax3kxHr4QweNWHSgsZLjVKqWbuJB6D4tZE4cIX/zcaa2Dh0qpQ+KgwgyAygneg44547U893C0yc6u32v4to2S2ZZdkIb3UoywkjjzPtzdX8u0UHGocPiTRteoPnzQyuxYTcRbR+GO8qddizYoO7FD/mK7a/l4yApkh2dwJHAoSbDbfJVHSO6ygQKvS9LJ3NONa7kQYVjNHhsKaRqPwSNgKe2Wr7yyAWn4YQECHYA1HltYArzEYLl3RAux7SqetfGZtZqYQtHntB4QYrHjTEQKydjCEs8QORJNscs/ZTDGp3OEoN9qDKtkflipHkSecEsWEzzKGQY5i+cWH7YjZ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEZ5d2JhVFRtM21nWWQ4dHYzKytHU1dpR0JsMENLT3hsekx0M0c5VFB3NE0z?=
 =?utf-8?B?ZXh3RGFkY3ZvRGNXQ29NdFFkVzRvcnRPeC8rdGwzTHpnK08xUnlVRWhaMERH?=
 =?utf-8?B?aDRDSEFGZEdVUDcxV1ZOdy85VCtLdUZtUFRqNkdDKzNodDlMcHFWR0Q3N1lK?=
 =?utf-8?B?N1ZFaDYwSTlGWmNodmtIUXJibW9kZlZqL1MyT2Zia1lEendYSDhmcEMxbVJ5?=
 =?utf-8?B?RFNJU2RBaVdzc0RRY3RRN2JoN0ZiWG9BZHNvemdPOE1aU1NTOWFOUzA2VFpJ?=
 =?utf-8?B?NXBEZFRoSzJVbTA1WGtGaDdTTDEwbVFsL09YYXNIbDdKT1RFbDlRZzlRbCs2?=
 =?utf-8?B?cFJPS0M5MzZWQ2tjQVdvV0ZzTW1UeDQzVWRtL3hwTm1zSmplcWxmZnNUczk5?=
 =?utf-8?B?WWtkUHl4VWNsbUMrd3ZkTHhXcytSZWc4aks2UHFhQlB1Qmd2eUFZSG01VGQ1?=
 =?utf-8?B?MHlTVk9YWVQyQTlzS24vSkNFYVhqNFlsWGM0UGtEdENVaDhoTTM2TXFib0F0?=
 =?utf-8?B?QkxZbTNZKytOd1kveTJiUFlXSFM4dXlFYkZadk1hMSt6cTBTVGh0UGtCajNY?=
 =?utf-8?B?ZVNMWkhKVnM5cEVWWklJd05QZzBPK0F4aGR1blZGaE9SaFpPSzZCNGhOWHpT?=
 =?utf-8?B?cm1XMWJWM3ZvUlZ2NkNTRmpsRnVzRnRoc0JVZ2o1MFZ5RHlqSlNuT2h1Q2lh?=
 =?utf-8?B?dXZXakJJQVBXVnhMdlJ1R2RUbi9HbHI2UjVHTUE4b2wxbUJPOVZPbFQxTllR?=
 =?utf-8?B?djBrOEhreGRWQjZIdnNpb0Y2TWZEZGp5RXdHMU9xcitURTh0TVdTRW1oTG00?=
 =?utf-8?B?TnRlUEVnRm9oZkVyNVZCZERTUy9pN1FxNnRyWVFXTUVGOG1Zenh0ZjZYb1Jq?=
 =?utf-8?B?dDZwVnErbUxBQlRVMSt6cUZXTklkVm1SNnRwQUppQkJTZ0ptaXRudzg0d1RJ?=
 =?utf-8?B?aG95bEZOVmNUQkE4eU02RzRUcHVFMTZ6L1cvYkZGNG1wbElyR2VhTEIzazQv?=
 =?utf-8?B?MVlzWEhDTXhFdjE5WkYvbFg4d3BQVk9EQlV3eVE1cXQ4RnVNNzNZMkJaNEdP?=
 =?utf-8?B?SDNZb21XNEwyNm1uWThLVlJFa3hiemxMc01YRnYxaXVIYjVXZXNTKzQ4UzE0?=
 =?utf-8?B?YXZnUUQ1UXltTDA3ZGk3QS9IcFhYalRiaHBvY0JyMFhNOFhibDBCZStIMm1P?=
 =?utf-8?B?dm11T3VRSE0yRmlkeEMwR3JPazlaOFFNbFd1N050VnYwRjRyZWc0eDY0T0VX?=
 =?utf-8?B?WTlJb1UyTUVBLzROYmdDM0FpSjhDWnZjQ0J5K0JqRWJoM2RoZy9TczhYWXl0?=
 =?utf-8?B?NGVjK0ovQXpIZWhodGxoS1h6QWRhN29DcnRIOS80citRQ3dqQi93UjVtdmtT?=
 =?utf-8?B?ZUFwSGYwelhuMHFUT3llTTN6c0FKSWd1dythSE1heDhpWlQ3WGUydTRQd29B?=
 =?utf-8?B?QnNXVWMxWmMvV0FBSXU5UnFoMnhqWVJYbytVVTQ4ZlNha24zaUZ6bERyWE9B?=
 =?utf-8?B?cFpEZHlFZm9FVTNveUQ1Wm5MTjN4ejhtbGlOdGdqNXhaTWZ5ODVSRWU1S3p1?=
 =?utf-8?B?R0YwOThqK1c5Rkh1b1R3SGxnS2VSUnJiRUgwTTFmU3BQSm41Y0E0bXB1bUxl?=
 =?utf-8?B?UEExc3d2SlVydHBuRE96RlJlVFU2d1lFaWVyazk0elh1cW95MmFXaExUYmhs?=
 =?utf-8?B?TWdZK29CcmRnb2xPbzZnVHdVeGJheDdzaHNvT05CM0FKc25lUVozdEZYa2Rk?=
 =?utf-8?B?cTRzSU42ZXhyb0lLTit2dVhXNXd6MjRUcExSanI5UXV4QTlkdjhOWXk1bWRs?=
 =?utf-8?B?bFcxdElWM25EMDFJejkxRmN3Y1NnVkF5RzQwaWdDT29sNG9lanYxdTNtSHhP?=
 =?utf-8?B?VWE5c25INDlmbG10d045YmppRGtJLzNjVzhuREpKTGVyUVRtRVlxL0M2QlNR?=
 =?utf-8?B?UHNDVzBHSWorcElOaUVSekVHYVVwS0R3QWo1VlBtbDY1cExXVkE0ekhXd1Mr?=
 =?utf-8?B?OVJvR3FLSElraWhlZUFxN1J3K1NDdHBhU1pIUHhCSG0wMUV5Vm5lOW1hcTc1?=
 =?utf-8?B?WFgvSVFsU1pESHlkZEx3Mkkvc29qc29BWHpvY3M1UGs2cXVYYUJxSVpzaG85?=
 =?utf-8?B?VDh3Q1ZmWDNEM2dTVk9pK0pSaWszeU40UElHSkRqbTJiUTduY2x0OHNCaFYx?=
 =?utf-8?B?c3AxamhYSFVubEF1eW5UZW8zSFJwK2I5SzI4Zkp3anJwUkpic0RrTEJUWElp?=
 =?utf-8?B?RW5GWDlscktWLytTZHhidzV0Um1vTVFidWU0dXprN2FrdWM1azJFL2k2VWVy?=
 =?utf-8?B?clhLTFkveEFOckhwMitGbWowSzNuVkhXQWhpV21lODZyUktDYk9UUT09?=
X-Exchange-RoutingPolicyChecked: SMirWqbyqkO9QkUA0NiCR7B82L3sVB4KztV7o8hoxqP8tOQNhJHpFOk5i8skZk0Gv8VrP5El0q5dJmWVf+QmRHTPzyLFbqYknk5vcwPCWkksQofjHEXRHiGYKtUBBfogT17o/crXk6FFnHyvKSSQWJA0alUO43njxKmBqV2nFi1J9jPC1gxZ4a/cRD6e77277k4bNrzx5ergGYIMB4lU6Wi+gz976ZsLIgjc+ow4/FbGfWb1buZIyB2NoTmxpuMlG2qe5d7F/uYXtICwEmHuSa0cLN5gmgwl+WahVkvgwqLr5RIL9xCgC9mtvkENj3/vwf3XuzeesF3LM3sN25g1Jw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8dd5a3-fcd8-4948-196a-08dee7d5e902
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:45:05.9065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ig3tJxwcbQyZzjLa9WqXzZ4laoaWA5lPoB4VrJ4Z523DYvyNmFyifXVuAQWMF6x5ZI6w8jeh7U85b6VvqerJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
X-OriginatorOrg: intel.com

Hi Yangyu,

thanks very much for enhancing cache-aware scheduling,

On 7/22/2026 5:10 PM, Yangyu Chen wrote:
> Cache aware scheduling is currently controlled only through global
> debugfs knobs, but the right aggressiveness is workload and platform
> specific. A multi-threaded Verilator run is one example: its RSS is
> large while only a small part of it is hot, so an RSS-based footprint
> estimate should not decide whether it is aggregated; and packing its
> threads onto the SMT siblings of one LLC beats spreading them across
> LLCs on some platforms (e.g. AMD EPYC Turin) but not on others (e.g.
> EPYC Milan). Such choices cannot be made globally for the whole
> machine. Add a prctl interface to override the knobs per process
> (per mm_struct):
> 
>    prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_SET, attr, value, 0);
>    prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_GET, attr, &value, 0);
> 
> A single prctl command implements both directions, like
> PR_RSEQ_SLICE_EXTENSION. The attributes are a per-process enable
> (effective only while the feature is globally active), the two
> aggregation tolerances, the overaggr percentage (applied where a
> task's own migration is admitted; group level statistics span many
> processes and keep using the global value), and an inherit mask
> selecting which attributes an mm created by execve() keeps. fork()
> always inherits everything, and the mask itself lives on the
> task_struct so it survives both, which lets a numactl-like launcher
> configure a workload and exec it.
> 
> The overrides live in mm->sc_stat with -1 meaning "follow the global
> default"; GET stores the raw value through an int pointer so this
> sentinel round-trips without being mistaken for an errno.
> mm_init_sched() gains the creating task to tell fork (p != current)
> from exec (p == current) apart. A disabled mm has its preferred LLC
> invalidated at the existing invalidation points, so all group-level
> statistics self-neutralize.
> 

We are working on a version that uses prctl to turn on/off/share
among tasks, which performs similar operations to core-scheduling
based on cookies[1]. That version decouples the mm from
cache-aware scheduling so that processes, tasks, or cgroups can
tag tasks with different "cookies". We are also exploring how to
leverage schedqos (from Qais) to take advantage of these
interfaces.

Your enhancement for tuning the parameters could be applied on top
of that, I suppose.

[1] https://github.com/chen-yu-surf/linux/commits/cache_aware_prctl_v1.4/

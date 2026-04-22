Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AB354768;
	Wed, 22 Apr 2026 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873900; cv=fail; b=tG0qWaEP1nN2M+wQYbEaU6iOvBepBMzh+2PL6YjLe5H0hxHWiUda4n1lFZvCemb2LQnH3U/VLkAVoedcTgXiI3wEqnCCr6AOKaiX+goWW+7f0YG7Rko8pbfZTyDP0uCP1EeQa/ewGBZ+fZD+uKLs33Dxsty3vYs1BF+5JknBCzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873900; c=relaxed/simple;
	bh=UEN3dsUHf+9QdW7kAMn1S/elbXo+rs4vCgzYebczDlM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uNrTWVoEGc3flO4VsrdrL0HeOAdlarkA6Fc4jaJHLWcs90d/ZvhbziFCY1KNpY+NpUpP86VqX/58uezc8SAfIVoL+rXvH8/djjDTMFjW2HAfycS/tmIDnCCx4JsyrFfnPUC/KGu2TYUblCyEeaV+HwKJAiFz3RjnHfxZH0qo8Wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHw1Etyu; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHw1Etyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776873897; x=1808409897;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UEN3dsUHf+9QdW7kAMn1S/elbXo+rs4vCgzYebczDlM=;
  b=bHw1EtyukZY+CKzhaNAIbNOqpj7kvDEWOOmEEki5awqIoB+nOxg6EExK
   UFiTj14HBXYx0a4asmPukwscdX6zY7l08C8eRlWpfO65GdKhIjgk7SK9A
   x0q3jkbJQsBNhB2NyJII8X4Wz+VH8kt1VaPQmWhF7UiVsye85JQhPw+eC
   TAyjdxmqLR2t/Ga3SEYhqF+Nof46VTvorjYKFdpF4dXdeluUD1mIHQcue
   KEl7ZhXoJcF7KpHd+UoKo/FRQAasjNg3QO0cE2xKsbMVUNSa75mu3LwLz
   JDYGud2/91b5V7Wby3VZEPGGHz4D9szKNjozYhmidAm9PwJcFhocf1+H1
   Q==;
X-CSE-ConnectionGUID: 8OkXCZSUQLikz2aOsleh2Q==
X-CSE-MsgGUID: oNFHJdDURaG0Hir1ZanoPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="103291469"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="103291469"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:04:53 -0700
X-CSE-ConnectionGUID: 2UoEGsvrQIS6nmPxd4nnrQ==
X-CSE-MsgGUID: 0sAgNs8jTkitpiFH4QCFFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="232705381"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:04:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:04:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 09:04:52 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:04:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQjwbxhxaEHj/62pb1BU8Jff613CKXQTkgLy9xC4i0QeM1EYiV5wUwecsVj+QZiuOIwazoSS2k9D7Hkuv5x4vCy7FdeyCtP9fjs5yYkOQeykKjnFQ8/DkmMk5JhWtqT6U9Mi7JOcyecbc5Y1sNBCIWZ9GzL/oici5hHJ7dLUc5b3wvkymn07fQWNsLk3NWHy0pqF+J7lXUxc55rpG2OoWYZ9aKypYwaiwOg33oN7HXDvpIqooxnucqu55ael0sWhHa7HcAkoEHHxw4cFnald1J2Bvv2QHeCRhqRG3IQNOgaX/bqK9fHWmexsoZ7xV+ICXLgZ7FsbYZy6iaLPP/Di/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNayEIm3pNv3OZBH1unu6KAfWZwx6b/OKutTLs+QMuo=;
 b=UQbpBJ9V+lCLMfQEsSliYpKGCCVehQMG8DXmFwJSoZUhKCNjNvU0pdKZRn/ipI91eN8s3ykBzgKsl/4wc/8WVKxrdn+3FDkvfHeQVbxUYYUpoc+/qTwK9zD0ak1BxZaOYeWqRoO3gzejjN2fHx/NDDKBvvorLrOjdF9Q5AeYeaPHUyW8pcgDw3U53dI3QVU1V3jJ/aQQcwebzgcCfk3GS152r1TFXvINqROaJsb0zgitsIgQ2dZpqPOcP+4ZEYGlNMUc9qsdIpWmjN1Flo/gekF2xQceAZ4XacRov7wa+KbJjFfwyKS8CVQBKdI2wYGzqW4p4h51fwrPAhmxeHLC2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB9518.namprd11.prod.outlook.com (2603:10b6:208:5b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 16:04:44 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9846.014; Wed, 22 Apr 2026
 16:04:43 +0000
Message-ID: <f68d0015-6b44-489a-93da-ff44f172584c@intel.com>
Date: Wed, 22 Apr 2026 09:04:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] selftests/resctrl: Refactor the discovery of IMC
 counters using linked list
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260410093352.3988125-1-wuyifan50@huawei.com>
 <20260410093352.3988125-3-wuyifan50@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260410093352.3988125-3-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:303:b8::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a8d456-f70d-41fa-be4f-08dea088de19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: DKYsJdkGdspcqoXfKuy5/WB4ctaGT2uHAz+dwfHt+vhjmqAprEEH8Wpsy51eeKSNBmV3hEVzAZdPTMifNXh5St50KakiV8mLMkC7SAshKlFqPzBHwv2jremoCcMq0R4ThQ1vPmv/EJdH5xq+cM67KLI5bNYeg9bM5ZsOc/EdbgfvCwOU4ehj4ppo7qX6+K/Tm6XMjd9hnRjoeRNbq3jfj0qFYYYEPF3gyOiia8B7qTAVX7wPc/3k8caoFvxhRfhIXFCNmdaItCHXwjoE0ogG8WsRMq1CNjlFcgfhuufPTTMWB28MrUR6fkf3w1ibSZQcmXlldn/nFBtkDLO8pAEMTGHuwuUwpZC25s1JyU0pFw+KBfHqXTgunTBWo9eXPDOz4UErEY+fR/YNT6Cmn7ZP1tmKzkDwH4LJlEGKdx7mQBAWwMKqE9Y7gW983lsfoPcWIzb1u9WfKnEJOSlXSwCVOmyal6T5tkqgVSxzuNFCymptL2OKhZoYyIFQImxIl4aRC0ZZPLxdCV9bNQwc2xKJNFq17A1upxu7zhImXCAeXocpCUFDqOoNb7p8PKEKy/Sd6oRYog0U15113qZIdTDK8RxXvNNLClfp//1RboJL26jofscIkFbThv3+FY36GEoTqwZKwGLabw2CnmPq4endB+ei9aLMK3AGYqUeHfJ/iZb+XtOqeBAAPo6vk/yHpQ8ep/Oggpv7VQcVVXVkDOJ741Ka2d9PthnSS7If3CQtS6xR0n9O85Q4wwIshe8SPniGsolr3yvQPjo/OfumoR+oFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkxRR0ZoUkJqK3Z2UzdmQS9YMWE5Lzg1R1YrdUZ5M2o2ZjBpMmM4UjNPSEN4?=
 =?utf-8?B?WDZCb2k1Y21nWERIQ2Naa2xCajU2RlRka2NVaTd5eGlVTjJNbXRRV0ozSG5J?=
 =?utf-8?B?enFVRHVIZlpUOFR4V0tpUFgwL081akVmb3p4QnR3cE5jT1UyYmFSU1NId3BF?=
 =?utf-8?B?QXBGeWlSemlUKzU2eXNjMXBDMkt5cWRGRTlXVlhJRVRnMVhucEJOQllMWFlU?=
 =?utf-8?B?ZFV6ajk3MFMxdkVRQjhRWE94UjRGVWtUV2tObkliTFQ2aUZBS3k5TVBvOHU0?=
 =?utf-8?B?YzBlSlo1NklBa25wbVVicTRHTDlXZC9SRFgwQkJsT0o3Tkh0UXR3UGR3Z0dU?=
 =?utf-8?B?cGpPb2FYTS80WFBuS2pGTjV0ek41OEtGRlNta1dFUHdTVnRMdHdpaVJreVdM?=
 =?utf-8?B?NXk0S0p5YzhydXdDWEFZQlNEUm82SmowajJBWnhHdWxGcmJMSFh5alMzdTNy?=
 =?utf-8?B?NHlSS2pBUlpkK3c4dkNacldDbTN3ZnZKS1VmUnEzN084OUo4Tm5SSjdCRGU2?=
 =?utf-8?B?cThCSVo1RlZmTGhEckw1OHptcWREMlFhTm1rbVRKSGFZK1NmeXVHdng0T2R1?=
 =?utf-8?B?RnFXK2MxOXNEeWtCc202cnNUMGFxOTluSnVzL1h6MnZvSW45SFIzL291b085?=
 =?utf-8?B?RWdYeFA2VjhDTmNQUTYrT244c3U0UXU5Y3JoVWNnM0VSYTlMNDhIWCs4U2hT?=
 =?utf-8?B?bDdmTXFuby9xd3ZPVDVCWE8yR3o0anpvejhUNzVGcmxoWklFbFpWcDNUNkxW?=
 =?utf-8?B?M0FVOUlCYXd4elI4VXdZcnVoQTY2SFBmV0FidGhxTVlWMVJtSWJMbTlOYTQy?=
 =?utf-8?B?WFlFejJtb3JyQXhhT3VjKzV4U3ludEJYTzRRK1FCRTdTZ1MxaS9iY1Z2NXRh?=
 =?utf-8?B?eVA1czNYMm1nQXBpejN2dURrZ09WRUJITmFYdWVLQ29taGl5UkV6dWlBbDFy?=
 =?utf-8?B?R2tkS0xyYThveDBXZEl2SWxuWHh0UDFZVm0rQytEY2NWZS9RT2EyMWJmaUNh?=
 =?utf-8?B?TFFoL3lvbVdQdjN4T3UrUUpkU0VKQmlPZzZIRGtwWWJHbmtRTzFBb0R4ZzdU?=
 =?utf-8?B?SW1XR3ZqeHdGejczaFdEKzZiNWlFeG1jdnNXYXlPaUgzcGZLNGZRcHBZY0Nn?=
 =?utf-8?B?VExUUzdtZU5ZZGs0K1MyR1RKdk9HZE54aTZXcGU4UGI4SkZhODZWd3kwYTJY?=
 =?utf-8?B?Wk9IOUVrOWNuU21uRjNVUG5WWXZhTmorS3Zva2xaQzRDaTZqbW5JRFcyaGxi?=
 =?utf-8?B?ZVZzbUVtblV5ek40eUNBM1hUNnhXWDZ6YU8va1ZuN0NFVjVtZXlnUm9JWVdL?=
 =?utf-8?B?UGRSY09zRUQxbk9vOXhWTDZEUzR0b29OK1hEeUlJOHRDcjFsUHFEN3VMSHNq?=
 =?utf-8?B?TWJZVjR5WWl6NjJjSlJOZmJVdW5YODROWTZLVFU1cW5VMFNXcGFoNWxPcnND?=
 =?utf-8?B?eG9NNXVXZ1owSkRiK0w5RFFlOUlHMGJmVzdFeVNyR29aemFKN01ESmlBTzFM?=
 =?utf-8?B?QU41QkJBNEJ1L080WnRUVGs5bVQzSGdvVjlDNDBiUVY2WWU1MHRaV05pL21i?=
 =?utf-8?B?YTNRNkF5SzkralFXT2NPemlRU2cxdHRQa1dTSFVVNDFQaGxXZlYvNjEzdm1k?=
 =?utf-8?B?bytJMVFNWm95RkMzdjBKVVp6dk1hdmtRQUhPQXZ5Q1VmUFA3WjY1dURQdElo?=
 =?utf-8?B?WEtra2FQbkIzNjk4ZUdpTFp0QUFnTnBzTnU2MnRwLytiaklKUEJ6cXltNXJE?=
 =?utf-8?B?akZUQUQvT3IwY2o4R1hWMzJyczhrZkx6aTlob2lCb0RkRmpPL3BZTHF6b1A5?=
 =?utf-8?B?cmZMeXk5c0J3ZUJWaVVPbW91bUhFSHNVTVp4TC9NMVR1dnhwOGZrN3RmdElu?=
 =?utf-8?B?dVFqZUErbXZCMDFLa0FnTy9tTEFZNWVHb1kvWk9lMkMzRVplUlQxMjY0WHE0?=
 =?utf-8?B?Mkkrb1RkS0MvWWlZQUZiajJDNDhnTTJGbVJJT1JHZHdYRzEvbkVsVGxma1JK?=
 =?utf-8?B?QTYwWGh0SW96ZFhlQk1GM2swOWFhUTZwNElzSlhmUjdwUGNUbGdwQXljR2N2?=
 =?utf-8?B?ZXpDWnd1L0tqUWpISTY1WW1zQ01MajJ1T2w5ODZmZFUzYWl1NmVzS0tWbFZC?=
 =?utf-8?B?dC91KzdzaXd0Ky9LQ2JEdHhYRTV3R0JvYVl2VngyWGhSazN3bXRmTmM5N1hF?=
 =?utf-8?B?cER4QWd5aE5DcldhaElCR0FJNXIyMjFJVW5GTU5jdDNpWGJPekJwakRuOWsr?=
 =?utf-8?B?aXdDSklWcXJVMlpYV0VLdjRzSG1XbWNJN3Z5b3VGMlB3aTcvVkZYbGN5QmJG?=
 =?utf-8?B?Wm1yN2U3aTBEMEZyZzlqODh2QU5tMWxpT1pGaTB5QjYvZ3NuUEJyUTVMZE1O?=
 =?utf-8?Q?TNElCAT1szqxBGpA=3D?=
X-Exchange-RoutingPolicyChecked: d/iwhOz6E+XFBH+mVPVGo8dAFHe60w1pDh9Eyc4j/axXdsuKHY3bHL1FlC2+g/qIZusyOkCNc3vm3uVsJXvZm9OGsJKdE39zLDrrUijaeffafrf9UZT4yZ/tkVwjG9NUsVXvlDcRxPjgdm4px5XhHBIJAMp9nBP68SSbKGzdHD/0opL9nmF8qCJxEnRCP0cyAqSrY/jrOIpBUhVQqI67idCDESr13j/BSJyJy1rE6JMrX+QPf9kXqUHHgvK4SmNO3mlaO/HPAfkqCH4MHj2z7bTPRYe08p9JyXlpHgEvlpkhgBxemfHy5tCDt2zqeNcUgSCTQvX1DCyggffkRI3VAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a8d456-f70d-41fa-be4f-08dea088de19
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 16:04:43.8497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auRotmpFktV0XEGglO1sibOlpwH0Jt92i2Z+Rkci9N9WkGK1YgX34Flv6WyONxhePu1bb1cfaZt2m7IiPByEeNygy10H0+LpySi0AYsQiEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9518
X-OriginatorOrg: intel.com

Hi Yifan,

On 4/10/26 2:33 AM, Yifan Wu wrote:
> Use linked list to refactor the discovery of IMC counters. The counting
> during the discovery and the check on the upper limit of the number
> of IMC counters are removed.

Please apply the changelog comment of patch #1 to all patches in this
series.

> 
> Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
> ---
>  tools/testing/selftests/resctrl/resctrl_val.c | 35 ++++++++-----------
>  1 file changed, 14 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
> index d9ae24e9d971..60cda2214c13 100644
> --- a/tools/testing/selftests/resctrl/resctrl_val.c
> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
> @@ -75,7 +75,7 @@ static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
>   * @cas_count_cfg:	Config
>   * @count:		iMC number

Note function description above containing description of @count parameter

>   */
> -static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
> +static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_config *imc_counter)

Since above replaces @count with @imc_counter, please update function description to match.

>  {
>  	char *token[MAX_TOKENS];
>  	int i = 0;
> @@ -89,9 +89,9 @@ static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
>  		if (!token[i])
>  			break;
>  		if (strcmp(token[i], "event") == 0)
> -			imc_counters_config[count].event = strtol(token[i + 1], NULL, 16);
> +			imc_counter->event = strtol(token[i + 1], NULL, 16);
>  		if (strcmp(token[i], "umask") == 0)
> -			imc_counters_config[count].umask = strtol(token[i + 1], NULL, 16);
> +			imc_counter->umask = strtol(token[i + 1], NULL, 16);
>  	}
>  }
>  
> @@ -111,12 +111,11 @@ static int open_perf_read_event(int i, int cpu_no)
>  	return 0;
>  }
>  
> -static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
> -				    unsigned int *count)
> +static int parse_imc_read_bw_events(char *imc_dir, unsigned int type)
>  {
>  	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
>  	struct imc_counter_config *imc_counter;
> -	unsigned int orig_count = *count;
> +	bool found_event = false;
>  	char cas_count_cfg[1024];
>  	struct dirent *ep;
>  	int path_len;
> @@ -166,23 +165,18 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>  			ksft_perror("Could not get iMC cas count read");
>  			goto out_close;
>  		}
> -		if (*count >= MAX_IMCS) {
> -			ksft_print_msg("Maximum iMC count exceeded\n");
> -			goto out_close;
> -		}
>  		imc_counter = calloc(1, sizeof(*imc_counter));
>  		if (!imc_counter) {
>  			ksft_perror("Unable to allocate memory for iMC counters\n");
>  			goto out_close;
>  		}
>  
> -		imc_counters_config[*count].type = type;
> -		get_read_event_and_umask(cas_count_cfg, *count);
> -		/* Do not fail after incrementing *count. */
> -		*count += 1;
> +		imc_counter->type = type;
> +		get_read_event_and_umask(cas_count_cfg, imc_counter);
>  		list_add(&imc_counter->entry, &imc_counters_list);
> +		found_event = true;
>  	}
> -	if (*count == orig_count) {
> +	if (!found_event) {
>  		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
>  		goto out_close;
>  	}
> @@ -193,7 +187,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
>  }
>  
>  /* Get type and config of an iMC counter's read event. */
> -static int read_from_imc_dir(char *imc_dir, unsigned int *count)
> +static int read_from_imc_dir(char *imc_dir)
>  {
>  	char imc_counter_type[PATH_MAX];
>  	unsigned int type;
> @@ -221,7 +215,7 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
>  		ksft_perror("Could not get iMC type");
>  		return -1;
>  	}
> -	ret = parse_imc_read_bw_events(imc_dir, type, count);
> +	ret = parse_imc_read_bw_events(imc_dir, type);
>  	if (ret) {
>  		ksft_print_msg("Unable to parse bandwidth event and umask\n");
>  		return ret;
> @@ -245,7 +239,6 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
>  static int num_of_imcs(void)
>  {
>  	char imc_dir[512], *temp;
> -	unsigned int count = 0;
>  	struct dirent *ep;
>  	int ret;
>  	DIR *dp;
> @@ -274,7 +267,7 @@ static int num_of_imcs(void)
>  			if (temp[0] >= '0' && temp[0] <= '9') {
>  				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
>  					ep->d_name);
> -				ret = read_from_imc_dir(imc_dir, &count);
> +				ret = read_from_imc_dir(imc_dir);
>  				if (ret) {
>  					closedir(dp);
>  
> @@ -283,7 +276,7 @@ static int num_of_imcs(void)
>  			}
>  		}
>  		closedir(dp);
> -		if (count == 0) {
> +		if (list_empty(&imc_counters_list)) {
>  			ksft_print_msg("Unable to find iMC counters\n");
>  
>  			return -1;
> @@ -294,7 +287,7 @@ static int num_of_imcs(void)
>  		return -1;
>  	}
>  
> -	return count;
> +	return 0;

Since num_of_imcs() now returns a code instead of the number of iMCs found it seems
appropriate to change its name to match, something like "enumerate_imcs()"? Also
please note that num_of_imcs() still has function comments that needs to be updated
to match the new return code. Please check all patches to ensure when a function
signature is changed its description is considered also.

>  }
>  
>  int initialize_read_mem_bw_imc(void)

hmm ... this patch changes how iMCs are enumerated, now placing the data in the new
linked list, but the rest of the code still refers to the (now uninitialized) array.
After this patch the tests are thus broken and if somebody ever needs to do a bisect
and happens to land on this patch is will cause inconvenience.

Please split patches to be incremental changes where tests continue working after
every patch. You can do so with one patch where utilities receive pointer to
array element instead of index as parameter and another patch that switches the
code to use a list. (If this sounds familiar I just copied&pasted the previous
sentence from the v1 review.)

To provide more detail on what this would look like, consider the changes to
get_read_event_and_umask() in this patch:

@@ -75,7 +75,7 @@ static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
  * @cas_count_cfg:	Config
  * @count:		iMC number
  */
-static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
+static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_config *imc_counter)
 {
 	char *token[MAX_TOKENS];
 	int i = 0;
@@ -89,9 +89,9 @@ static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
 		if (!token[i])
 			break;
 		if (strcmp(token[i], "event") == 0)
-			imc_counters_config[count].event = strtol(token[i + 1], NULL, 16);
+			imc_counter->event = strtol(token[i + 1], NULL, 16);
 		if (strcmp(token[i], "umask") == 0)
-			imc_counters_config[count].umask = strtol(token[i + 1], NULL, 16);
+			imc_counter->umask = strtol(token[i + 1], NULL, 16);
 	}
 }

A change like above can be made as first patch in the series in the code that still supports the
array with the callers providing a pointer to array element instead, for example:

	get_read_event_and_umask(cas_count_cfg, &imc_counters_config[*count]);

All the changes to utilities similar to above that simply replaces the index with a pointer to
struct imc_counter_config can be grouped into that first patch of the series. For example, the changes to
read_mem_bw_initialize_perf_event_attr(), open_perf_read_event(), read_mem_bw_ioctl_perf_event_ioc_reset_enable(), etc.

Grouping such changes into a preparatory patch is simple to review and reduces the churn when
switching to the list.

Reinette


 



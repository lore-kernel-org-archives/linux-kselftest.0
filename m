Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296BA2FB969;
	Thu, 25 Jun 2026 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782425700; cv=fail; b=ZNPXu5W9/9SMUwGT60WemDgyOzlPn/LGxM2vQ0YeGrYqRi4KzTlDa2Y0Bgn6//pecAZj80sy9ozgg40g28UGv9LrnjfhLmTUpBrIqwQ52r5D13TX8/yO4z2yLlWOvzf0sR7j/zbTcby2dSBBNajf6Q+zkFU9c/eKBt12NRd9Y+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782425700; c=relaxed/simple;
	bh=DTayBRbtIy5Cz6AGdhNU2CXCrZu9vNXzUfThcnLMoB0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f4ahxT1/i6WJUcUBhGHdtb0zaTq9p+s2U9P+wGLy4mD2tXhBgMV4ytpDJ/pX2Yj4ZNnqnW5zGqPfqXqu9cA8j1taqVt/tONrslD4NufFz2wjjN0yh+1PtQNMBBeD0kx34MOlYg4AX9HPeYiA5TSXmfEONDmS2aJZAL/J5wvSCyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhlLJrUv; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhlLJrUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782425699; x=1813961699;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DTayBRbtIy5Cz6AGdhNU2CXCrZu9vNXzUfThcnLMoB0=;
  b=dhlLJrUv142VnD2ZdT0u3jqGrDNaHR+d5tbrXF4KvoL5Y8XM43Z8fw/h
   HxIHJvMCUUN0kLe7+5bZFwP8IXriy6PtUdbv7YNg+F+P6QLSEc87qvHH1
   HG7HpNimLdKqj4o54gQl1rQpO3k2tOu8/bF1ovieSRaSFwLVIYymX3tYU
   q6fqyDItE+i+OkiYM1H7aNlQ9mjWTKXhGPVneguOtTKhWRxtMciI2vHjE
   9aWNL0BszBbCSrOj6D3dj1gAyi8ph6gNeImeUBzIXTqYzZsFwUTQ6dHD+
   dM5UGZAjcgajh6Irla2wN6X0g2NTwmry5BGjtDvJf3FHN1y3tvVXggFq7
   A==;
X-CSE-ConnectionGUID: 8N0txgbOTjG4rCO4kur13w==
X-CSE-MsgGUID: eeTxV0UBSzWWV0am1msfQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="85771958"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="85771958"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 15:14:58 -0700
X-CSE-ConnectionGUID: ZM+Wep8SSgSblobpFB2vGQ==
X-CSE-MsgGUID: WdL28uO4QlmyauHnf0DxDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; 
   d="scan'208";a="255537528"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 15:14:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 15:14:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 15:14:57 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 15:14:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeJDkwXzJbzeghijPOQ/92v5Q5I/pDPyg57Fe1VCUzxQRS2iyPc/3LoQk1zwWd2qceQmhhBMEfR4H9P6X5whTyGdmxh1fd+hMqFAd2AEBvtkJ8QnbM2oR3+4Jq8H42kqFI0DRf1J+Y4gZuaW50EyJ7niwLLeNZ/li9QsH2+Sv1DxiEzhIzcm7cAmNZxr1CPaD0JT+23aFdUqHogccAtPrEP8XV7bboRQcjOkcpmeHgn3lzoQQRSSWNX2gyD2D7BbfMj0Gvin+8FGHScOGyTmX9cvxNbDTTV+tNoPbYHRIFwdODgaNZ+3dlfjRau/rGJMZaESnLrzWcZqwsY7Pn3PUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkgmVaCaXqnJp9KuHVO6zlOwI94/Z1gx48v1z8E5lic=;
 b=RcG1h2ywSuPYaZzDq9yJiRhQvSgqjWSORYq97sC1MdGtxgd1p2chr54uDLv9xLFccWhPOKWUxnKtHboQw7LnOu5z/i5mzxgZotdtJG0Fmoe5M2QhCxYKCYipn9qxNZ94qy0ubaPT10YZAWhBWaarZ2fWXkXba33+lRks/b7TkZG7HrQ8NeS9rdEC9/AjBo2aGYldERpa+qWcYoxHU1RL3U48n11gpnjQj3fHcALj7VAapvtXjgk9o/v7OiC3dLCQz/TwNSoWsSI+BmvmtJY6CN6YjnAd3CeKsY7Kiz25wl/DIQfomHPuv/t+aXrc0QgsFhU1RUtc1ztGRMHXpZsYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SAWPR11MB9709.namprd11.prod.outlook.com (2603:10b6:806:4ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 22:14:56 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0139.018; Thu, 25 Jun 2026
 22:14:56 +0000
Message-ID: <8b51dca5-d1fe-492d-8d54-7709aee4a6c5@intel.com>
Date: Thu, 25 Jun 2026 15:14:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] selftests/resctrl: Enable dynamic management of
 IMC counters via linked list
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <zengheng4@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260522090540.444554-1-wuyifan50@huawei.com>
 <20260522090540.444554-4-wuyifan50@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260522090540.444554-4-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:303:b6::34) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SAWPR11MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: fe12d93f-c6c2-4715-2fdc-08ded3073036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|921020|22082099003|18002099003|3023799007|56012099006|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: MqI7YrIiZRXUIMyx6a3MF5fcR5pw7KMsMzSQU6cihdWtYtvxZVf3BTEwtnZAnfTuoecK+zgKAhkY4xhwgNgqwKRVB5nd1L9SgOiz206oOoAFhijTwH1D9js7H23rrheKb2BdAyWg5i43JApMunjkSJw7LjSbjVBOjorsYXBTRp0wi+DkNOp4efj0mkzMlfojrgYD1cBXBJIzSE2FclI3AnWI30AjkKQoGsEYefRo2AAyrk/jZ8pW5Evf82iGuIxsFOi1DpL9c3QsP/czY6NN73WdVYGYAL0/6yqFg2AziOa49FJ2A7XEK5TiyZafWVuWKJPnfTPot/6+P/oMPTf7Ufxiez3Nx2VvxS5MrIcp/gj09To5G8cQnimssi0u7NdEDReg3wTvomQesMpcxhtl+OQGBfp/XwhNIkmT0mFLmo9mh1+K4cmF34lsiCEFnw7jM6LZTyv4peGAYpQGp16gFpUOYJhToqZlWopymSjodYEORbJfurWkW762AzCjR1OYvylcg/L2CexkAiQrBWc3v15drfLDAJIrFWI+YfmOKelAHzsv5BMkZKPopPcamUbyUwAfLaotkCKPFdbp2rgXg9OcQk4thRlem9QNk4iTduNNzH+lyRV6Cypqu9OBJD1hU/Q4/vh3TL2Pu0zzEk7byFG+5pzZBJrQqRUnhUzylWayiT4hwFvuiqKPyPhRObPQjQyLAbSxl/tpjvkxB0x5dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(921020)(22082099003)(18002099003)(3023799007)(56012099006)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC9qdXF0dU0xZFdOUDl5WmdoNlBHd3JHSFFKWnpOcGxUK1ZyNkpZRDZ0azR6?=
 =?utf-8?B?V1B1SkduQWV3ZGUrZlRua3RqSkF6Y1p5WFJWL1B0RkNDU3J3OHR4R1F3SVpY?=
 =?utf-8?B?Rm9EaU1LWk5BNmJ2aXlXZFMzTnIzblRJVjQzWWxrS25jQTByMnFIZU5GSmdv?=
 =?utf-8?B?bldwOURweWRiRmxzWHh1WkZRSEpTNDBnb0h2YlpUK2dxUzByUzlQeHZwS083?=
 =?utf-8?B?N0Q2NjBSbWtPM2lMaDJRRXEvSTVKWURZNVJnNnpxV1hieWtSZ3NoSGZJRzM0?=
 =?utf-8?B?ZUxod0lPWjFDenhyN2dEMEtCNTZmTVU3RjRlMFhlaStNOFNDQUx1TjVORVJx?=
 =?utf-8?B?dzRTQ0dRU2d4cTdlQ2xEZXprYzZEeTJRYktieDR1TnVUKzQ5RVhJam1iRHBL?=
 =?utf-8?B?aGlMOGkvUG01dFl6VEg0UklyeUFhbWd3S3dEYjRjaHZta3BCM2RhTW5Odmg4?=
 =?utf-8?B?TUNzdkpPNlBCa2VKVkFrL3ZubmlGdVlKbW43K3o1NW9seVduYnI1R2hSTkc2?=
 =?utf-8?B?WlNtYXNvdGhpbGxrWkQ2SnhUTm9CdC9DdHpvdFJuTDlpL09DWTZjNGNYSWJF?=
 =?utf-8?B?alc1eW5FdVpnbW9QbnlzU3pCakd2Mk1kcUdXbGpkU2pGdEFZY21sYmNaMmla?=
 =?utf-8?B?QnJ2eHpNTW1XdERTL0ZJMHF5d1cxblJvNUFHWGNwZGNNMGt6VzY0bzZlVzQy?=
 =?utf-8?B?WGgxb2xZUGNzWTRNeXJkVEF5UzNiY2VwbS81cHYwU0k0bHQrZjRBdW9yNEFJ?=
 =?utf-8?B?NnE4VEF2ZjZ2eHFvWWUzNTc2TDBHVUJCMnpQak93TFlFdGt0UjhYamdHYjNo?=
 =?utf-8?B?YStqbXdoMWFsWEhTcUlxMlM0eEtqL2VOYjh5MlBkNTNqWmQzdHNUQ0tKRDN0?=
 =?utf-8?B?cVhjcFVFM3dHVTNueHJRRlBHaWR0dWpZdnBUbGZ0REJvVTVnMzJkb0M1cWZU?=
 =?utf-8?B?SSs1eFhUZWRCRCs2THBPQUpXNUpVYUtOK2RkdVZOdFRRRkw2Tmpha2lhOEZx?=
 =?utf-8?B?R2c1OHRRaGF3eW56WUZNRVBIRmkxSGRVK1gxL2RxQkp3Wnc3UG9XWFdmQ2lD?=
 =?utf-8?B?UDcxL0syYlloVXNqNXYweW9FWi9xT3VRa0VwaUVlZC9qWE16MlpmY0dTb2tS?=
 =?utf-8?B?MHAvOGZBZzRYVE9ndXV0cysyRzFsa2pxVkNiV1ArMjBka3Uza1gxQjdEME9X?=
 =?utf-8?B?T0RBRnkvdjNJeGRwSThVenZsZm03MG16TktxS3dCZHlLdk4xZU9wVXdtcC9o?=
 =?utf-8?B?ZWxIQXM3bUpBR2ZCQ0NyNWp1M1lrY3ArSW5lanEySGgrNlZOUHVTSFQyTHB3?=
 =?utf-8?B?RWQ0Zzk2RXZxUFZvMkJLbFFNZ0lLR1grMGxaM3k4TFJZRjVZNUE4UEpNMFdP?=
 =?utf-8?B?Ry9uUk5kdjZPRVVtWUQvbWIvMHN5R2JsSkp5WVBKdFpoSmszVUFpZlN1V0R3?=
 =?utf-8?B?OG1vV3RMYjZibXBNdGFuc2hQazBmcFliUW5sbHNKRnRFWVAvb2srZ01zM2oy?=
 =?utf-8?B?ZGJoUHZaclpPdDQxR0kxdUh4ZEdqYkZJRW5rS0x3b1dOUWNQbHZ2a0NRSDJr?=
 =?utf-8?B?c2RwdGN3QWlWU1JTa3BIYm9yaEsxYmxLcHEwTG1nbFJxa0FERFJ3bmJaNWhy?=
 =?utf-8?B?NlNSbHJlZXFkVmU4enFMeEE3ME0rZ3c2b2F4bnhrSzRsMFFHeFRtaDl0cXlZ?=
 =?utf-8?B?bWsweTZnSE52b1haeVhyOFFZQTBnK2ptclVTdGZvd2h4d1Z6cGFkdWJyK1J4?=
 =?utf-8?B?U0M4bWRzZ3ROekY5blhrcFdZK1JnNEdoeEtWM1YyS2VkQ3JCN25xc2djakRn?=
 =?utf-8?B?eE85VWJxczFlRHBTTGhkTG9hUExEaGs4R2Q5WGc3WUFoRnF1NngyZmJPRjlD?=
 =?utf-8?B?bnhHeXVGbkdGMmNSQlVtME5WVjE0Qmd3dlUybTlOamtSRWZLbU1HejFnNENT?=
 =?utf-8?B?TkhVMjZaUUlJRU1vYXQ3QW5jYmFxajlKNHh4eXMzNldlREZOdEdOUGZkZGJj?=
 =?utf-8?B?UkdoL2xiaTl5aUZRRHovNFBZakM2MHVjSEcyN01uQ0w0ZUxobFVRZ1E3TE1Q?=
 =?utf-8?B?bjhPczc1c2JNOUhneTVBRXVOWi9BSkVoaTh3OXMvclhaWllUeXZydE1Zd0VS?=
 =?utf-8?B?NWg5S1ROOC9VaGFEYU0rMTNpd1VoVERoTzdjdFU0OHIrUm1VTnEvU21kRE5E?=
 =?utf-8?B?Yys3T25KamlZWG5rRUtDZ3JXaDNERVZXQjM4NzN0bGlqLy96Qks3b1laV0VZ?=
 =?utf-8?B?NDFVZjc2TW5mTEREYk5OUUtJbW4wZUVUU2dMOGZjZjU0ZEwySjdybW5qdzQ0?=
 =?utf-8?B?aUZaZmpDRVFDdllJYnlBSG1oZXdDcyttTjI2M1VLRnkvY2RCdURxdTN2YTQy?=
 =?utf-8?Q?4p0NW2lBwi/lScvo=3D?=
X-Exchange-RoutingPolicyChecked: J//Q5rjRgmcZ5q4d2kjgC6+6ByFIpm1luvrC4vpxpMRlX/UZ5ZSb+EtyRNqDCEbewxJJFdQCgBMdJUC+bzpU7IYqVbSduoWiTibaZVrOqDpbm2ZBnHrr1g3FQ9Qo9DIjWl24ABMc0prFc7tmsacm5dQYuWUEFZcUkJ5e4yvDMQEK2bduJOnT2OE/o/vc3tFttv+M33AFrq2YfOFC8ONZNDQOwVqkx5jhl5AzwJzqj+dmr6qdsZzrMpY3gQGCJJ0dkejxjPJ+gKYiNXEUydAQaRWR1PebJnEGUlpDLvYqxEKVHvs3gEhIcB8BXtUTj+zLbsi0gxNeoYlnYH0LMg+esw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe12d93f-c6c2-4715-2fdc-08ded3073036
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 22:14:56.1559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMjSkAHIcl7qA07ivobubWu+Prsm+1dMCybbfknTsSpUKbyBBK8FzZLUCTX+5H5pVrwj4U+Z3oSQQusE8HjTWCAuEozcBZI3v+kFuOByMbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9709
X-OriginatorOrg: intel.com

Hi Yifan,

On 5/22/26 2:05 AM, Yifan Wu wrote:
> @@ -242,14 +233,13 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
>   * counter's event and umask for the memory read events that will be
>   * measured.
>   *
> - * Enumerate all these details into an array of structures.
> + * Enumerate all these details into a linked list of structures.
>   *
>   * Return: >= 0 on success. < 0 on failure.
>   */
> -static int num_of_imcs(void)
> +static int enumerate_imcs(void)

The first sentence of this function's comments still describes the behavior being
changed in this patch. How about a fixup like below:

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 129e8d76222a..fe3b3517ae49 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -226,12 +226,10 @@ static int read_from_imc_dir(char *imc_dir)
 }
 
 /*
- * A system can have 'n' number of iMC (Integrated Memory Controller)
- * counters, get that 'n'. Discover the properties of the available
- * counters in support of needed performance measurement via perf.
- * For each iMC counter get it's type and config. Also obtain each
- * counter's event and umask for the memory read events that will be
- * measured.
+ * Discover the properties of the available iMC (Integrated Memory Controller)
+ * counters in support of needed performance measurement via perf. For each iMC
+ * counter get it's type and config. Also obtain each counter's event and umask
+ * for the memory read events that will be measured.
  *
  * Enumerate all these details into a linked list of structures.
  *

...  
>  int initialize_read_mem_bw_imc(void)
>  {
> -	int imc;
> +	struct imc_counter_config *imc_counter;
> +	int ret;
>  
> -	imcs = num_of_imcs();
> -	if (imcs <= 0)
> -		return imcs;
> +	ret = enumerate_imcs();
> +	if (ret < 0)
> +		return ret;
>  
>  	/* Initialize perf_event_attr structures for all iMC's */
> -	for (imc = 0; imc < imcs; imc++)
> -		read_mem_bw_initialize_perf_event_attr(&imc_counters_config[imc]);
> +	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
> +		read_mem_bw_initialize_perf_event_attr(imc_counter);
> +	}

nit: unnecessary braces

>  
>  	return 0;
>  }
> @@ -328,11 +320,11 @@ void cleanup_read_mem_bw_imc(void)
>  
>  static void perf_close_imc_read_mem_bw(void)
>  {
> -	int mc;
> +	struct imc_counter_config *imc_counter;
>  
> -	for (mc = 0; mc < imcs; mc++) {
> -		if (imc_counters_config[mc].fd != -1)
> -			close(imc_counters_config[mc].fd);
> +	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
> +		if (imc_counter->fd != -1)
> +			close(imc_counter->fd);
>  	}
>  }
>  
With fixup applied and nit addressed:
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette


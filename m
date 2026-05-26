Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A47733F8BE;
	Tue, 26 May 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809158; cv=fail; b=I4NcgdgcNYPGanOdFlkqIEaIrYIs0z0L9qdSW1qgbdd723fed4Y6EKUZZFS8OApyTFxoQqIuu3VGZQ608mOUKVVx4/mMNmavl97XTBnq4kRUXIYaPDDMviEyjZIlLeF09vqKL1OU/b5OhwQaItjJ/6JTwG1kIKkO87Kvm/gq5AY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809158; c=relaxed/simple;
	bh=TsbGl+BD5+JTZmOkbOiuRSP9SoVzoudGyppQAsoNw9U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jZZyVdlrEfBXk1FHTPHBWEi0Lkmrt1BfsoL6C8AkiLaa4Et8dAgaQNEHEP5djsunSF2QDhP1uh8EyIJfqGBPrjrbbxejzzb6tscU68oHf4tl1OFHlaltaMq/AZDOtgOypCaMjmZqiTsaO14pu7Phuz/iQjyuifyc47kOdWFYLg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Isqv6usa; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Isqv6usa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779809156; x=1811345156;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TsbGl+BD5+JTZmOkbOiuRSP9SoVzoudGyppQAsoNw9U=;
  b=Isqv6usa2rfS+m3YoCsnSI3yxWIw0UJsV6jUN62u28m0tY2xH6C4Aiyz
   JXQ+QR6wQBO68OuqE+oXaj8wZVmo61vxvWQhuQp61irUBmhkX23rkrlbC
   E+Q+YJvrxQnKy3brnGtFDxTP1BG/fYHyOEGh+aTb6d59L/fZ1Fl0VY75j
   NNqLNs9dpo70ulzCifqI2RFLfI2wKM61uZhn/6bk5ReqkJtIjEbIdDrOd
   NA0LLFsED72GG0SDvh0zNUOsACbT/I4SSakr8wb9CMbkegpXAOwaf0K6J
   hLYkWtKENLMlMr/6DSES0BE04+A8MoYPZbUW6l/tlTyC9hpN2NWrdN4q6
   w==;
X-CSE-ConnectionGUID: stbd2/Y+Qee0XiO1oh3Sng==
X-CSE-MsgGUID: tVM7RI5qTPimdmmVo2JT5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79659483"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="79659483"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 08:25:55 -0700
X-CSE-ConnectionGUID: sFpr5D6jRXCfYxNC8y2aeA==
X-CSE-MsgGUID: LL/IaWtSRD6VZV0IqfSH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="239346660"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 08:25:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 08:25:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 08:25:55 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.26)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 08:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlRcWcu0JvipQhLmrRZk5OcI2ZhEcv9tA9i68/uhjWNm6B3VKtIw28KhhSKZCYG6T+gfdcGqreWW0l9xrB7Som3O9VAXvthyN2Fu0DbeIQ2ykyEZDROO4MsuTmYpoUKFPA5T7Zo6yYpJrgdPkSxk43C15Sc3CyK7FzSbIIud2g5fCXz1kWJYg8Abm7UjBUkhFJv3WVKcabYPN6Ee/IzPu9s6ARvRn/6LmgySbhoDAcF0D81hHuIlQPye4lw6Ikp9smOHsi56ExzJzKCPQn1DNd8BRmNcEH+nmU/KvnOkxSzhlvNC9t0vlXv9XNbTgGt6YFOtl7LgAjP+uj1izTUuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ixl28Wfkz2TnDqWPysHruItGPbWry/WWdZNW1lNd+Gw=;
 b=gdrvegSUypnXHXlGTxire9dKOXRAbbAFzJciaFrmi0ZsMePiI+eQB++SWiWglB+LU5XgoclowE+GJcJxzsFjnhvZyL+S5GGKisJeIYVq9DqFUrVtBbIfykxLEO+wy0mL1BKFFdNu3GPK+jZUBq/8EgVojT+TbiIJcjm1Cktt8+IxTwS/yZsk+Oq8yhrEn67K03mRySnFQCSivV4Cix+L2JX52vq40CEFnLSrw4BZyedQNZvgidiBh04a5F4fdto57kmeyHAbh513H6CPfXbz+K4Q7lwNLpd3hkKGewXAlvKrhWJildDxjUPAaKnL0SbL4MMXTFBTPChvms/aCR+12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB6979.namprd11.prod.outlook.com (2603:10b6:510:207::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 15:25:52 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 15:25:52 +0000
Message-ID: <3fbb001e-bc78-45d6-92fc-4a8dcf708c58@intel.com>
Date: Tue, 26 May 2026 08:25:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/resctrl: Allow CAT testing when no exclusive
 cache exists
To: "Chen, Yu C" <yu.c.chen@intel.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: Tony Luck <tony.luck@intel.com>, <x86@kernel.org>, Dave Martin
	<Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu Moger
	<babu.moger@amd.com>, LKML <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, Hongyu Ning <hongyu.ning@linux.intel.com>
References: <20260523101715.3964456-1-yu.c.chen@intel.com>
 <db89b830-997f-8f74-012c-9aece7fa5c34@linux.intel.com>
 <09c77f99-0c8f-44c3-8971-aaec094053ca@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <09c77f99-0c8f-44c3-8971-aaec094053ca@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:303:b8::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ba5e9a-af90-4f01-3749-08debb3b129c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|3023799007|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: t188lT5yHyIAZYB7N7ohc9Evn2LPnl3QbNYD6+Z0sIZlnn2gTBbmRQrwoqoQyeWpBzQcbP5XhbpHL307SwSO+SiZoiLQ88w767ZRt+H8piKTgctZjAPj3vYexCq48bplKwDYsm8ruwBx4aCJiQBxnP/6ILKepqEBZ/lMkfCpFwND33GBmfWXGIbPckiKrNnj4H0J+bAvIxvfSY7XtvZHFSW4Exz7JLfYHOcCXAGqDONG+/4uwbhf4WUWrPjNGSjE5rnormqpANCCiF6JElqmGFjIwkql+e9qR3sGcLP4ioS9SXIWZmCqzppT6CFe8P2lx6D6LIaIjO24S4Sk7AvBhzVsJu0omxRTg5+N79gRkKgfwmAe7DyZbSNoqW9XxAmCnLIL6zG6CNXLvH774rdzmXrqHekDxj6RU7x2PDUJxl0RqvHh6CrYqPzFhTscFJmys5cZSb3glXOjEYlbqfEoh/rqjUkMGZ+oGHzxIPAHHuvfWq5ltoUPEYuBieA0Qenz+BDlXvcfQU+Bq/uC0BWH6y+c8ZC0wxw+xsituuo2f4862QWKTCM3TrubPLvYcjXLWSQExI4oVH6ZMcxKdvgcl1zFMQrYBe3vw4qtenmGjeIZAqE6Ff6FCSPr/OAjLN6pXbQQR/y7ETpXaFwTwa2kFhxN9TP2TmG4NZpREHVFX2TC7Pa8nZketYq1LkE1EgbU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(3023799007)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2NzUTduRmQ2OHBGOW1EcU5MVE5OMExBYjUzcWVVQkxLdE1SSjRaYzEwc2Yr?=
 =?utf-8?B?WTZKSnFvRXZwa3YwUHp5emlTTUFydDU1azIxQ29NMndISXcvMDFiY1VPeTBt?=
 =?utf-8?B?bWVYc2o3b0hzMmttdU4xVU5jZTc3ZVlsb2JtUEdRMjRKOC9YRU1yNDVYeVQ4?=
 =?utf-8?B?dTZjZU5maW5uMS9oQ0RUM2NlSHNqeVFwV25rZmRRQ1d6bGtBcmtHbG01ejFK?=
 =?utf-8?B?ekZNYmdXbWQvWVpYNFhoUGg5R05oUzZKMiszcVVETGY4bXVFaUhIK0VON1h0?=
 =?utf-8?B?U3RKWVRFSXRpbnNtTldTajNuaGViNEl4eFdkQUFHVVlST0d6U2oycm9EWVN3?=
 =?utf-8?B?T1lIQ3JSaVB1WjFtcHFoUnFraThhMkU4VDdBY2hTeEZNUURvdGtiZ2U3Qitq?=
 =?utf-8?B?NUVEOTBCcEx0WEpTOXNGNTZNM2c5UXJidkpySnh4dGpSWjRuV3FGU0FmMnd0?=
 =?utf-8?B?WnU1MFgrTjg5MUNZRm9Ha0EyMmlyL29BSnRDam5wSkRVOWllY2htZ2QyRjcz?=
 =?utf-8?B?bWdkZHgxZFQ3UldZMnpuOGJGdW1abUNra2swSDJkbmJTWjNtQmYrKzVsa2My?=
 =?utf-8?B?bng5VlRrNWJHUlB4eVhUR29aZlRFMFJja1loZGRSMW5TU0ZSajl6OHVYZzd5?=
 =?utf-8?B?R3RYY3ZKQXlFOVlYZEtLSzEySGdUQWVvNVNDS1kwZVRETzNGc0J6b2tSQVlr?=
 =?utf-8?B?aGJJOWJQRzQ3bnhEeituamttbjh4RitTZm43TGhoVjFEcUlTVmdpNHFiM3RV?=
 =?utf-8?B?WUk5MTZ6VGNmSGs0WGRtRUcyb1Z0WWYzOC9KNzBnYWdUTUc1NStQdVYrZEdr?=
 =?utf-8?B?dVZZUG9VODljZXF4dTQ1Mzd6SkNJYlhlWmorWG9YalRORTFOZWdtYVNpa0wr?=
 =?utf-8?B?L3ltREJHTnd5bTJ1WlhkemJDbzVHMU1BajNOc3VMMDBDQjNIM3ZMUnRuYkYz?=
 =?utf-8?B?Y2dycnZNVVBPMDZMV1N5eW1yT1I0b0tyaWtNZ1pkYlR6NVhzVjdRdUFIUVNh?=
 =?utf-8?B?djlubUpmUElqbU9pT0MvNk5hY1NraEo0NG5obE9KWG1PcHdBbXJPNXBnYTFz?=
 =?utf-8?B?VHdhM0Y4TXJLbXVCdEZ5c2dmRENhUjI1bzhoQ2NvSDJGdVljWjJxdGlCZDl1?=
 =?utf-8?B?UTNOTHNZbGxiSEFmMmZ2TDVWTHhMQlJnU1FVcUFYOFBkWlh5UHhMbmFSUHBM?=
 =?utf-8?B?NzlGbjJpWkhVV0d1RmFkUTlTRDQ2TFd4NUVjdVhkd3VHRWk4eWdUK2xtZXBF?=
 =?utf-8?B?WFovMUd2NDhCUU5YeXRoVUkzN00wWFFtU0tJMm9NdXhncFRjTW9xY2puWm1t?=
 =?utf-8?B?TDJBSm9FeU9WRDNkTUJZT09IZUE2cWZNeldFYWVwR2ZlRWtlbUMrVUtRM3Aw?=
 =?utf-8?B?RlRXcEtya1NQbjNXNjdkeXlteDA3S3htMzM4OFJCcmJ2Q0FkSW92S0FtczRU?=
 =?utf-8?B?eGIzYXFuUTBVeDhqTXFVcVo0UVV1N0RNcmRia2c1WFpuY1BHbldhYzNqZmQ0?=
 =?utf-8?B?TStvOGNSdHM2SThJbVpYeFdZcWNpUW51eGtndEhZN1BDWEhCYmRpK0owNDN2?=
 =?utf-8?B?RStFOGg1K0pyWmtSUlF4U0pEc2FDVzFFemFVTEw1V04yemx1REg2SVF2amd3?=
 =?utf-8?B?Sld1TWNLK2hNYVYxbXdTbERaSW1makZvZWYzODhOVWVhZFR5STdYSkxDRCtK?=
 =?utf-8?B?S2FMNmJnS2o2VlU3MzBiMCs3SjJmT3ltZk5aRGx5Ujk0RGUzR2Z2MnczWkZM?=
 =?utf-8?B?QnlodkdBS1E3V015bC9ldHcrcFdhUURMQ2VNeEllMURSNEpHZWwxYlcyNWNW?=
 =?utf-8?B?Z3locnFZV0ZBazlOcmI3bzQzOXBrOUxzQkN1QjRvM1hpZ1ZpSGxmWE9tT1FN?=
 =?utf-8?B?ZkprU2ZOOURjbmZ0cTdYTzR5WmtSVkxyLzg1bkRNTVJ6WmR3Ti9zNXJOdkVP?=
 =?utf-8?B?SWR0aENKMWF6T0NtSW4zRnVmMFZ3WjlQRWI2cjNPUTBvSjRrK01PUTFaL3Bw?=
 =?utf-8?B?cGNkKzF5c1JRMTNyejhNQng0Y1A4NHdZRVlnN29nNVdoRmlvYm1ZbkRXTU9T?=
 =?utf-8?B?elRnUGNyUzNpY1l0TEM1d0NERFdWdEdjSkZRcCtSRG0yeDIzNWxXMzEzYnJ3?=
 =?utf-8?B?VmxPN2dhUWEzaTNaTzlCa0w0QkhWOEVxeHJweU1TYXAvaWV4dGM5Q2VWeW1G?=
 =?utf-8?B?M0NON0VFYmd3ZjIyL3JWRVlhMDlHbFpQQjJjTDNpMDZMeCtDaHZuSitKc1ZB?=
 =?utf-8?B?SGY1ZFZlR3dqT05WNUEySXlhZE1TbmtFYk4xY3dZbnMzTXNRMUkzQWJzVlpk?=
 =?utf-8?B?L0E4RDA0a25iVlZWMnpMbnljMHhHMm9mTlQ1YVpsUW42TFAzb3M2cnM4RFdL?=
 =?utf-8?Q?JRRHauOkH3fNOi5U=3D?=
X-Exchange-RoutingPolicyChecked: hqA5NU3B5U43PH8aRUDcl2j2duoPcNxw/zOrDYPv8Pcz3Y0eq/rtl3PKtLBBtKEqHSTkfVrONrqUGy/zseKYqmtaiNaQn1vSfcbH+3JOZDcgxN1GkQ9Y8m9FN3Hy3DFjubDBEawKvD6bx37QInONft5L8DWrnu8fitwokRNNEFlX5GyQKEEzQw1NnrHZhjX/r+BNIiVAhSzif3iea1vK3ggoL1HDwOboBiKDZXtR7Fov7PwBJILkOLwLbB6s64i98IW+45QkHrYWXUDZS4At3K5yhon46eVGgkayYZ32uYLFBCkSvcgNZiPL/GRuot/Y8rHPu360uqhhfZzeFp0UXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ba5e9a-af90-4f01-3749-08debb3b129c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 15:25:52.5301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEXz9iz7amiV/ebLqRcDQZrBoKOf5nLcm9NzCAf1NWmzZZHOuOZ6FNE5HTFsqim/oWYD4mv88hdrv8Ww6MgOKoRb94Sir95PdHbusQiUmeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6979
X-OriginatorOrg: intel.com

Hi Chenyu,

On 5/25/26 4:59 AM, Chen, Yu C wrote:
> Hi Ilpo,
> 
> On 5/25/2026 6:01 PM, Ilpo Järvinen wrote:
>> On Sat, 23 May 2026, Chen Yu wrote:
>>
>>> The shareable_bits indicates which cache portions might be shared with
>>> other agents (e.g., GPU, other I/O devices). On some platforms, all L3
>>> cache ways are marked as potentially shared.
>>>
>>> The L3_CAT test should fall back to using the full CBM mask when no
>>> exclusive portion exists, since the test logic (writing different
>>> schemata and measuring cache misses) still works. The shareable mask

How do you define "still works"? Allowing more interference will impact the
number of cache misses that is used to determine effectiveness of cache
allocation, no?

>>> is a hint about potential interference, not a hard exclusion.
>>>
>>> Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>
>>> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
>>> ---
>>>   tools/testing/selftests/resctrl/cat_test.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
>>> index f00b622c1460..b6994ba4504b 100644
>>> --- a/tools/testing/selftests/resctrl/cat_test.c
>>> +++ b/tools/testing/selftests/resctrl/cat_test.c
>>> @@ -248,7 +248,7 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
>>>       /* Get the largest contiguous exclusive portion of the cache */
>>>       ret = get_mask_no_shareable(test->resource, &long_mask);
>>>       if (ret)
>>> -        return ret;
>>> +        long_mask = full_cache_mask;
>>
>> Wouldn't it warrant to log something when the fallback occurs? It
>> certainly looks something that makes the results less reliable (so it
>> would be nice to know about it when looking at the test results).
>>
> 
> Got it. Let me add the following message:
> ksft_print_msg("No exclusive cache portion found, fall back to full cache mask\n");

Allowing more interference will cause the test to fail while the system behaves correctly.
This log message may help a knowledgeable user running the test manually but I expect would
be confusing to folks not familiar with resctrl and definitely does not help test automation
that just looks for the pass/fail.

The test can be fixed by skipping the test, instead of failing, if there are no bits
available for the test to run as intended. Of course, this will prevent CAT mechanics to
be tested on this platform so to test CAT on this platform there is a need a new functional
test since a performance test is not appropriate.

Reinette

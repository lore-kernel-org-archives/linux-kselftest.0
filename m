Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B8938E8BA;
	Wed, 12 Aug 2026 17:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555335; cv=fail; b=sTQq1c8HAMYeRNAX8+9j9scbkDOk0XkhmS7igWhJmGm42cgA0qIOaVpiq/euCWsA0lB/ExgsWraH2RUIdkpxOnWGvz9cjk+guWSmT1yiJrBxqYTNkyqxgOoc9pN6jm9p7c997RIQsBLM6MPdqNJ1CfaDSiapoDsMN2SxwbLDfo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555335; c=relaxed/simple;
	bh=gtZUh8ui5AQdf/vz/2XY2umMt3NtsF+dcX02kslEEuo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iW1p/IxFzaK/NrvYm3cULe/1w8nDpOjDxs9aEFFjrXG2oJMZI010Js6KHW4nv0/0+AgdZuAXt0qmRCXiFSwRqDI9Il1tv2kZTVcqbS0RAKmByuidMsRy4nagmGteSrgWJ5oE0LDnEjo665cEqF6b4qBc3ikA27C9Xh541LBVK5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrxBEKEx; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrxBEKEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786555332; x=1818091332;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gtZUh8ui5AQdf/vz/2XY2umMt3NtsF+dcX02kslEEuo=;
  b=RrxBEKExLsiGHrrFRCNvonXSFFzZHGq/T0jThV+pZXUXMv1ZnWgO0enS
   ema3dng7IzokckFPYTfs6k4SAy/O0vC2KUqHNuhbQ3cyNrdj97cNeME3+
   y2YxL7ehWTV1cz34ztnfVXA6Fu29hRU2aC3Qo7kN9uhlK5aRK3s14SdVP
   DcV+hiDGMskqmrBZj48eZBlyD9DsqA3V3lEieeMJarPcgCvEZXZRP2u1B
   3xDWN1h1MwjNWf+BgZT3NoFRkRHDGs/8ie3/7Elue1OHWSih+NiX5vEud
   2hv5s7+FiVyukaGnDhf3PAsj52gJeASiihTlSa6HMqNX3XCMDm7J6bYf2
   Q==;
X-CSE-ConnectionGUID: RK/JEDYyT5ezxZBEnI6MsQ==
X-CSE-MsgGUID: fTWmM/tnSYqbaBcY6FNA+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86996957"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86996957"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 10:22:10 -0700
X-CSE-ConnectionGUID: sZg0fln2QtK3w7Z5rCDInw==
X-CSE-MsgGUID: gYQypG+9RSa/d1YTFK3Rpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="263748395"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 10:22:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 10:22:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 10:22:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 10:22:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcfS1VWngBEYVWUXbkc/2WGmFX1/v9xh3SR46ffUHcXIqfrSp/7tuwwz8BioTfUeg0M40oTLap4JmXvLy6IEld1QttYnuWl7sgIyIUOJ8IvdHXunKRfHdhq4UuaEep5ey2EyRP0aM9djMaQkakJOLi0pMK0LDkEIvl4/VPw2b6LKFtVRQo1d90ZDR9YMKeF3RqnUbMXCjKsXd5o8ac4QMGCT57SwxQEdGnYhP0akJpzhCV4HS7QBvWkzjKoyqm8pxF8BGYC1jtv9HXsnY/l28MnFuw0s1U7RRdrHScgRsfDmifWB0JVGz+D8eR16EfjelVzTtqerB0fXZXExE2x8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0HFUkoPeL19FiBk1Gh0ZAtMdRJ63EVruGcSI7e0wJ4=;
 b=E1qmWJ9LSf9vKwga1vnf3ErQ8KOgt4fAfsKv69hapCk3SfVD8J9cRK/b7P8qgB3qSS82RzKNEHI04BlZoQz638d4NKosOfjvEh5qcufbNH4Uzi1ZLEYVK7ByKzXHj+emF57cQcEGkufBr+93Htwa2TpOSjRenKJoMfNLCtBgVUZhVqN6cWabqSUqag5M5aI+UWsrWrOXJqH9hURM3gg5nVaEYwbU7oTTRUEs3ECvU8+pct6QPWwuHqyAwNJNWDpBP9WYgCfaUPVOQfQlTaB7xaGe8HNNlh0iWIoB8oys10GWL/L9qauDS085nkL/+nT0PiJbmFwgrlHEIAAmKafdKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH3PPF2CAD058EC.namprd11.prod.outlook.com (2603:10b6:518:1::d12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 17:22:06 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 17:22:06 +0000
Message-ID: <1eb20140-66e6-4e2e-b6e9-5172cfa29bbc@intel.com>
Date: Wed, 12 Aug 2026 10:22:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] selftests/resctrl: Skip L3_CAT when no exclusive
 cache portion exists
To: Richard Cheng <icheng@nvidia.com>, <tony.luck@intel.com>, <x86@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>, <kobak@nvidia.com>, <kaihengf@nvidia.com>,
	<fenghuay@nvidia.com>, <ltrager@nvidia.com>, Chen Yu <yu.c.chen@intel.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260722035943.32337-1-icheng@nvidia.com>
 <20260722035943.32337-2-icheng@nvidia.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260722035943.32337-2-icheng@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:303:8c::12) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH3PPF2CAD058EC:EE_
X-MS-Office365-Filtering-Correlation-Id: 954a91f0-b07e-4d78-53d4-08def8963b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|18002099003|22082099003|5023799004|11063799006|56012099006|4143699003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: yzXiwsE7h9Lm8UkL49udzEPhD2682rr8VxP/ldoqGBMmTEGXgip0Vjl/6t3qhvOOBU4hrjuJcXxh90Zx/EJAG2vP6+UVAOwrR9jFvYwVMZoEY/qo4w5gZJfVug2U2NaIReoOOt1WWlOH+o8+ieQmporPoA9u1wN52GBt2bMoF3aLf0MZfMcwuzmR5xCDRBsOBOWFkSbLS8wcjBJ8b9Ft4LwU9/kDP9wrG9vQ772AEsTuTygUpvMzDwy0+Jm7Ns3HdKMFP3k+HSQt6TC7ZBUHRDddmdvNlw6jwEUcn9TX36DpmhHEMunvlKbgcr67OZ4O6f6sqmCPmk6lIzECjP2PeFr3pBB1BbYV23zja9CWgfe7u+O5WbjGeVhguMyZeBCZq2iqwtAC0zxhZJK5tLaM9N+JuZHEPSWrTuSxa3p9RtcSDW29XOwHc3eDcTf4xy4woUFZghFoS2ZnPaxc6SniGdd371GMa0nN6v5QvpoSD5vfTKzmAH/XWqkeOew181slnr/K5LRDWMuonIM7uKHS2IZmPjK8arGifi4p9hyoqEAnZo748TV/4RwVDcB+Exf1nL2RmOOTSCeB+CN/1Ke0ZToDpfvsVtDi05CR79sF5ye+1NxtENuMdUrRjN5hiEusO/AZ59lSIIM6zg84StcFBgRMvKj9Tlt0CYLpySBtuHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(4143699003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTkxSTVDT1FVcXNDVTJiZG1INkJNQ2VEWUUzV3JKUlpFSUNBQlF0di9jbi8r?=
 =?utf-8?B?S1JPaURLVVd5ME9VNlVIdUZPcC92VnUvOEEwZzRzOWNpZzc0NnhGOWpPUzhu?=
 =?utf-8?B?b3JMOGRsamNwekt1UFN1ZGk4SzZyN010MVV4dkdLa2IwYTdDbGpQSXpkL2ZH?=
 =?utf-8?B?MkJvakVsTWpBdkNHbzJON0VQcGNQdnRMWHE4ZFZHSVptSWFoajFxekt5NXZH?=
 =?utf-8?B?RzA1ck4xT0VRdnNHY2VPZVdtcUdpa3J6VzlNbEdqc2lSUmUwZVByRDNtUVNB?=
 =?utf-8?B?NWRaOXFNQWdmUDV4K1FTYXYzTHFuYkpXUmpvN245R0xHSkwwdjUvZ3R1RXZZ?=
 =?utf-8?B?b3RMT2pkWjZBZWY3VTRNZjNJMUJCd1FPTUdKblVxeStlRDh2cmc4dU50R1pk?=
 =?utf-8?B?NnUwd2pLWVRTTnIyZW5zUVBYT2ZuMGJKekIxeUFjWE1kVE94VndQYVUyQ3Qy?=
 =?utf-8?B?dVFDR1Buc2ZjV0NqcVlOeitVaWprc200eWlhWEkzaDZWd1J2NkVoY2pwNHE3?=
 =?utf-8?B?RXlkQzlFVlo3KzhuaVJNWXoyZHR6YWRXcVhWMnRUbXVYRGNZYW1mTTE1Rkdq?=
 =?utf-8?B?OHNvL0xmVHFlSWV3MGZFU2lmVlpteDVzbGtaVFFvM1NDdUhpUFoveWdGV1VZ?=
 =?utf-8?B?ZmgyZE5FVjRENDZ5dHpDVGhGYzBvTGo1azIvL0tpTEF0TzFXczFvaTYrK3Ji?=
 =?utf-8?B?QVJrQ2UyNWdTTUg0RWMrSUpDUmRUMmpKQjBxYXI5NkthMjZsRjd5Q0NjZ0t5?=
 =?utf-8?B?TmFOMkwwQ0hrT1BtaEl0WUpwa2RnMnBqTWVpK1NWRTBnKytvdk1ybUE4cmV2?=
 =?utf-8?B?QXg0TENuaXErVEE0am1lRG1za1lQcXhWQWZaNElYa1ZGdnI0UzhrTWloOG1H?=
 =?utf-8?B?aXFkOXg3VW5taXJ5RFJvUzJBMUozTGoxQUhsc09xOHd4emxtdjgyblJLcm1G?=
 =?utf-8?B?OHFRNjdOdkJYUllhaFZWd01tajVqVkxKYjVkNW5MLzNOUmZ6WVNJamhMeHZy?=
 =?utf-8?B?SU1ZRWRDRHQ2S2NEeWNFNjdiMVlHZlRTNnp4TzhEZFpzanFrTUpIa052SC9o?=
 =?utf-8?B?ZjgrbXVvUjI0NjcrbFJhVGtNdnZUc2ZxaWhrbEdSaWNQSkV5NjlaRCtmN0g4?=
 =?utf-8?B?cjVSNnpsUkNmdE5TYUI1YjBkdENGa0Q4TVl3ay9vZmNlbHlzQUI5cVhYVGRa?=
 =?utf-8?B?eVBRT1RjV1BhdE9hdE0xNWhsWDd1NVNVSWZGUndUN002TzNTbktPYlBVd2Z0?=
 =?utf-8?B?bzM3TkkwVGk4dHZ6dmQvOGszMGtmNlp6WU9pOXlTMkxCVkV0cWtjY1FVRC9H?=
 =?utf-8?B?RmRZYVh6M29nSGVDNXBmRkJ5VlBvNXRITkozUFJkRGluc3NmQVJIN0JnaDhG?=
 =?utf-8?B?SitDTnJFVXYwcXRDSVkwMG40LzVqOWd1Sk54Y0pBUkthcGVpVzVTcDJjYkRz?=
 =?utf-8?B?ZVRwOWNMYjZzdjY0UkZKQWNlenVSV0dlZ25UMVUvczF2ZnJzd3MxY20wQW1E?=
 =?utf-8?B?Kytsbjk1bW8vRTBtbnVNeVNubDN2QkVHcTVSUUx6dWg1czUvM21URXVoUzd5?=
 =?utf-8?B?YnNFM2ZPRG4zaGhqbEN3V3JFV21IUU9QS3RTVy9PWVVmaUh5Y05XYU1oVGxr?=
 =?utf-8?B?bkdpSDBhb3JIa3hyRTZ1NGt0YU5Cb2NFcjlGZjI0cGh2NGgrenJJNDhiVEt6?=
 =?utf-8?B?QlVockN1THhmVGVoVHhzSys2WWtIcGtLR24vL3JxOFFmU0xTcndIZDlKd1BJ?=
 =?utf-8?B?RnRtOUhINllzcFRjQUNmcVhMeHVlOUVJT2RyVHNYa2xpY01jUmN5NmsyVk5y?=
 =?utf-8?B?TmJvSENUb0VuRFBEQjRaVjdXdXlRU2dUR1E0YWdBUkNjdEVYNHhISFNDMklj?=
 =?utf-8?B?R21OejJRNkdsWTdVajd5MWJHWTdHQU84RlBEUThBS3lwemdNUnNBZW1XUGFY?=
 =?utf-8?B?QkU0ZG5DV0FESTRySDZaL2lxKzV4djFnQWY3dGxFSWV4SXdJaWpOSW9tZVVv?=
 =?utf-8?B?Ly9DNGVUaTZSSUJzVU9Ba0NTVnhocUpLc1lnbzR0NlJJSlJ2Qk1JMFk4a25o?=
 =?utf-8?B?MzBjb0VsUE5aSTFyVGl6V1RDd2RSZU8rOWJsQ3Y3c3FIaWZpWTlmd04yaVRq?=
 =?utf-8?B?bVNDNkJ3STJMTTN0UmVlTk9vZG1hRU9ETUkyM3lKYkpJRVpqT0VTVTI1V09j?=
 =?utf-8?B?a3dlYllOamVGTWNaTjdlSGZMUFVZczBvWDhKVmFLZkhjSGhWUGFpWGhPa2Fr?=
 =?utf-8?B?TExnelJ0S3lIL1BLem1LMTlZcjB6aWVYTmVwNG9ERGlESjlxMGhncWdTMlhs?=
 =?utf-8?B?UWdKWCsvbnhYZ3QxUlhhRGYzbTI5YnE2NGRHWjFuZHRaaDYyeGZQdWFDcjhC?=
 =?utf-8?Q?fPeavewqq1qhcUBM=3D?=
X-Exchange-RoutingPolicyChecked: rPuWZ02EjD7bskEl65njKKvPD6JgfX2ZhBzuydU2sfC29BHxltBiCH0JBzzma47a/WFydSKvXAQ/Yt7VTJgfRYtqtk7tOxEd1qvzrdbn43F8EKkJM1sDlQjaOVR/h79In++3Knydfbfvl+2yQmz8u7tw3q3Cd7JuQWp4DI/X2UfXo+hTLNLQQVTk0xYZIPg8M9t/smDTNXH7Zq2gas3pgjjYf166WKa//ej7cRmHK5fxFvA6fysYXfk2hCBCeCnnWN1yybRcryyG0MrDArO3ac1gu0TxqW331iqDaUNyvjFb0LQIMTK16QI/r28WZToJr/Pybl+pnRCN0zk4pOZFEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 954a91f0-b07e-4d78-53d4-08def8963b2f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 17:22:05.7333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xR2GLc9deTQmO5PEUiPuhBWZLn3PPhNDsoZbJeFqLLQt/CO+z31lkBArHURuV5/RRhfhHHH5vvqo+dLa1ogHGBzrWp+3dtZj2pLHVUtYEkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2CAD058EC
X-OriginatorOrg: intel.com

Hi Richard,

On 7/21/26 8:59 PM, Richard Cheng wrote:
> L3_CAT measures cache isolation, which requires at least one cache bit
> that is not shared with non-CPU agents, i.e. cbm_mask & ~shareable_bits
> must be non-zero. On MPAM, shareable_bits == cbm_mask is a legitimate
> state, so there are situations in which no bit can be reported as
> exclusive.
> 
> Previously get_mask_no_shareable() was invoked inside cat_run_test()
> and silently returned -1, which surfaced as a test failure on arm64
> MPAM systems.
> 
> Implement cat_feature_check() to perform the same check at feature-check
> time. It prints a diagnostic and returns false so the test case is
> skipped instead of failing.
> 
> Tested-by: Chen Yu <yu.c.chen@intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---

This patch is unchanged from v3. My comments against v3 still apply:
https://lore.kernel.org/lkml/5d76e776-82d3-4f02-8384-a890349ae96c@intel.com/

As noted there, this issue does not just impact aarch64. Could you please
split this patch from this series? When it is ready I would like to make a
request for its inclusion in the next cycle.

Thank you.

Reinette

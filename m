Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794011388;
	b=VI9k+V5mlhxrdnNHo1DoMMdJQC8OY7ILLqH7Qs6nuWbjVmUU2+09h6hHn/CVv2REEs67
	 csox6qkuI2PrQNboTAFZJ/fgZTHQrZf/NuXxBWmq2DuNwZ7P1HCooFu5Q/tDU7LDnfiBS
	 v9YsXFP7JD2NzidHriBVAHqeHExPMlrDNMoaRTy0sMrwT0bRfzuh6IuzqaKydKXTO46FB
	 ltphhCN1pFMG3SlTnALWqtmr4tqVy9aQDa/y9QmIdeQYrQt87/rnyxwDe3vRrfUZnrNK+
	 tiUKmD3aWiqrALOTqdbaqkoLAF7t+osza1lCT46NhhCu6GOJZbAjbXGjLLMahzUPauA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011388;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=eLjIrIz+B9gxEx5DejIidZbO4jheWMCwZXdFswVlN50=;
	b=dgXA20DFZ7rk4rDoYTXqyQ0JZOnJG6bY11B1rC+kNHvLJ8jopVbgShfOW9VX4XV05/8P
	 /76Wci3q2n67qj/fRq12Fz2ezSy5nd7hQJRBmuKvIkDyrkNQavoiqilv7h7CeBPz8/9AQ
	 OoVgcebit0PEOb6ca/JYqPGha7v4dr3RKBChv97TAuyd6MeV1dbaSbicIb7hiRiWD66ih
	 9xEMHWJatBudMB5l2AVweV9kyvin4pJSkqnDaCTahNTEwGEibILCY8GOKvId7JeBYGxcj
	 n9zTOXiWWsldib6JgTYDE406TQWTnWdOX55DHxAGbzLQxFUN0fY75B2aLb/vP84fnOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="I7Q/bkPq";
	arc=fail smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12811606A326;
	Sat,  7 Nov 2026 00:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12811606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7Q/bkPq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794011386; x=1825547386;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FuzJDcxRBddNUcFp94RJG8t58z0m6YnZ7OU62ZC1Bbc=;
  b=I7Q/bkPqL7QEErvaXVof8P1WbnnegU82CN/IILM3Ip3UNC7iu+PfPZBx
   Z64gYM81bl515eZQ6M4M7tK3aKwG1iM15MuYhO4UcjC0sPYxfUjo07rjj
   OFrQOWMdM+VM1VOSdHld4OpzWVBOGaR6qltfGda78v8zTGP/fdCvNwxbo
   Cii7oATOqlxV/vCOC+LOH4C0dGfRXOhRov+UP4GzYdamxmaY9Uf6vdd9E
   HopI9BtcgA3qXV+BaPVZjPb+8Gm6sKf+BJV4dUO7vyeUBTxKXZapTR5xy
   khL9VJkX3EjL7PjLHd6gGxJsWOIOVJUFkRNQGZiHZHPSOP9pd/cOwJVYl
   w==;
X-CSE-ConnectionGUID: hSO3m4D5T1yCOV7NXBg/aw==
X-CSE-MsgGUID: W+XO1kYMSeefQfUhrWEl3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2748636"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2748636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 16:29:45 -0800
X-CSE-ConnectionGUID: V1JZ8D66Rw6fdIJx1Yw4lg==
X-CSE-MsgGUID: jwpPvb1BR3CimCtosteFew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7559702"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 16:29:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 16:29:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 16:29:43 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 16:29:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7kCRgdzpPfC0w5XKpLyoGeinjKmgjvSUDsBKMgG6lBFpf6aGcu3QKUdnHRRIb/7/9cuNt6io7dSdO5mc0KlTQxz7CIHnzz1XFLjOOs7vGwsDlaTu5jxTjQf1drG4Y8QSWMYGI0QYNKu6sdgsVs92CHG/edgP7SI4A97Xxbn/N/m9OMKnDOTWE4mnXijyTmBpOf2h/UdBEwTW3p8UxMMVcvMxmIZG4Fvn3k5jo+LO9xYsk1BdfIl+5MDT/yUkO8Tt+obxMwDly2JDt82PDtYU8rbUzc83zhWu8btSo0lEoI1gNbeCRQ615CWX88LvD2dYcEToggK/8dHXIS+mnJ47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLjIrIz+B9gxEx5DejIidZbO4jheWMCwZXdFswVlN50=;
 b=OG+CGb+rwBIuHUH3cnJX8LPDPdKIUSp66T5XlE009Pi4GeWRb2D10eVYACzqtCTZhngiHMytF4KXUHQ2p3AV54RBZ2DM849QwH6v5avF2/X4Nd6xFkxIz1i39mx08f0wZsb7SIOe2yYWe4qTLrkazS6pZnr8roCO9+1Sy6L158UZHdWxjJqkN6ss8eIlPtSHFZu61Xuc+w0aK2qa2zy1FvWnSlTPG8lp0sYyF/k+jEnkEiKWBuKtRXw4Otj1wtXbskBwcoS4T48XUsCppDjFqroj+N0yGNfqo0u/bDAuq/vEC9z+Myz8F0rSUoPicrPqDoRCAmwKL8qWnx2c7YalXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by IA3PR11MB179642.namprd11.prod.outlook.com (2603:10b6:208:61f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 00:29:41 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 00:29:41 +0000
Message-ID: <808923a4-0a6e-4d8f-8ace-d3573aa125e8@intel.com>
Date: Fri, 6 Nov 2026 16:29:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
To: Ben Horgan <ben.horgan@arm.com>, Richard Cheng <icheng@nvidia.com>
CC: <tony.luck@intel.com>, <x86@kernel.org>, <shuah@kernel.org>,
	<fenghuay@nvidia.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <kaihengf@nvidia.com>, <kobak@nvidia.com>,
	<newtonl@nvidia.com>, <kristinc@nvidia.com>
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-2-icheng@nvidia.com>
 <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
 <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com> <aurOz7iGKInyjddW@MWDK4CY14F>
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com> <auxM9hVAgp61Qbgv@MWDK4CY14F>
 <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <c58c397e-26e4-4866-be80-59d9bd861654@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:303:8e::31) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|IA3PR11MB179642:EE_
X-MS-Office365-Filtering-Correlation-Id: ea05834a-80ce-43a5-a420-08df3c6636cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|260925021911599003|260925021311599003|260925022911599003|5023799004|11063799006|4143699003|261022105027099003|56012099006|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|10067099003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: XbZM649b+WVoJPtOtvIwcN//r0uaaLcaS36lEMOrSYC00R7htokZADmQYtESQZ8VaMife8RRmEdIqKD53qe5xj7bJoiRv3O65e1bCcWgvWXiUy6VDkQp3AmRQiaQqRusO0dn68MEBQXHYKN5ePOw7Ki7Eg0juMgNdV2KWn+91x0khbnN0THWfrBnfzTwq6jXyJ4eiqsoX+ccSyAXFP8k/U5eAI6CiNmxOQPRGrjF0bPpBmho7i92AGRBE6jG6hOmgPF1+qyLA9ai+hPkVMXMxUpnnBY250fI9GyY3RSqB5TSSGQlaJ4jseGjCTmisR4uGtbF2RJMn+eKu8iBi3xjifR9TbtknB9S9I3jwzKjwRiaJ5MIf/ni+aEZIi47sOk8K3Fhxe6IWizISRSFROxDQXtHLpod5cdtkBg6dfUC+QPYUUwqmiR3yh80+5EuWJgd//ZbqgbWioL6hnHgQRTdDvExGFj4+cViFlBRH214qbWh9nCkNzh5BwoLcwjZRAmQ41qNsb0mLLmdV1f32LCo56sFeQZ/4SP9X84iJFSQBHXw3gwCg7O+tCoX/hxfElv3x+G9FCv+lcb7Q/S1g0is46DMu1/Qk3qE1eYnToSY5E9+bHgz7vrJFVFygl+AcGwP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(260925021911599003)(260925021311599003)(260925022911599003)(5023799004)(11063799006)(4143699003)(261022105027099003)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUFJV3dMbndLWStBZTZCVktTVkE0L2pscitlTFZWVFlnTWFJOUtrZ2lSMnpt?=
 =?utf-8?B?cmlvNTA4L3lwUXBhYTJvbVk3R1BNaXhXU2dYek9ieHE5WUpQamlMblE1UmpX?=
 =?utf-8?B?Vk1rODVScnJNejJOS3Y3UTdzcU5DdzEwTHBxNXFBUzNpOFpJanlHYVcxMHc1?=
 =?utf-8?B?RFVVaGkxdkhZZFI1SHNPTHM0Z3JobzhqMVQ2UW5TMjczMi9TclN3cGZEZlZx?=
 =?utf-8?B?NnNpeC84Vzc1dUVZaFZiZVlFWWhFVmsrbHY4WVJCR0xuM0JlWWJ1NmtXelV4?=
 =?utf-8?B?cnk0ZThzL2x1YTN3ajJ5S2F2YTBBbkxvb3hmcm8xWkFWT3FLbHNJVVhzV3Rs?=
 =?utf-8?B?VXFCT3pUaWFaRk4wOENKY0U1YzYwSmtpaEZUY2kvT0tJWFAyMG96eXZIU3dQ?=
 =?utf-8?B?YnJ0ZVhPNU5LQmFvV3dCdWhpYWJkWldjTTI1Yk9pSHZxdlFwUGF5ZndaVHA4?=
 =?utf-8?B?eXUxRmxvMW9GVVVhZFZFblRIRHdjdkh4clpNb3hHVjVycnI4eGhBY0pBTVQr?=
 =?utf-8?B?d0EyS2JKKzdmZ0d5enQyZVZRMzd1MnpYNk5BVVJZVEcrcVhkSlNxajV0b2xs?=
 =?utf-8?B?cFJ2aHpNVWlxMzcxQmhJYWcyRktXRVp2Z1IwYktkb3FHSEQvcTNyL2JVVDRw?=
 =?utf-8?B?YkZYRzdwTXB4TVI3MjNMUE42bXNDaEF1WVdtYXNFSEZtd3NzUWJaRXUrc1gr?=
 =?utf-8?B?bWhlSDlJczMzcVBmM1czSlJTTnhJYVRTSDRUZk8wOSt1ZDhuall2TlVFSEhl?=
 =?utf-8?B?NXg3dVh6cFkyT05COXJZbXh5enhYREcyMW5pTXVsWkxOSDRXUi9SSzFwRjVG?=
 =?utf-8?B?YjNVeTlPWHp1dkhaUGRSNVhzdDlVNGg2cGl5MVlNMzIzUEdiVkxwNDY4M3Rj?=
 =?utf-8?B?OGFtYy9maUZpa0pGTGs2bE1KREdrZHM1ZFRRbjBHM1B3VjdJcVhYbzJycXl6?=
 =?utf-8?B?bHpQSlZWWDJwQndCTUZQcTYyV0JMV1gxZytkdXNoVHhXNDhjTzB0bjE3ZGlL?=
 =?utf-8?B?cDJtUTB1YmJVUEE1WUUxeFEvTFpjQzZacDhRVWRDVGVRMDJFTGo2Ykk1cjBE?=
 =?utf-8?B?andCOTZXM1FJTHcwV1k2Y091V0ZQcWJUTjNmcDV6K01DYURFWjNZcFJSV1NT?=
 =?utf-8?B?TVRsaTBmazJES1UvWDFWL0NUUGdkSWRjbGlSdUNsa3phdmNLUDBreXY3c0hR?=
 =?utf-8?B?UXpCUDFSWkdvME9VUXIvdCs5SWYvejFyc2lpdWRQejdJZEpWdnpVSVdQVHZK?=
 =?utf-8?B?Ry82MTJxaVdHRDdQZVVjdnRlaGRkb2dmNm9HdmdJYzh3Z3psY1ZHUlpHazZ0?=
 =?utf-8?B?Nk1EZ3hldG1JeHlneVJhSzBNV3IwTm0wRHc4K3MvbFhybTUwZ1JQRHNFUlBC?=
 =?utf-8?B?TmJuREpXaVYxV3YyNnJaR0xIaE5EeE1mN0NxWDloRUk5ZWp5Z1E3RHpGbTZ1?=
 =?utf-8?B?eE1nS2VTQlo1WVA0cnZnTldHMG5XR2tyb3hRcWtsamZ0NFRGQlZKeERnYy9t?=
 =?utf-8?B?VDhkd0tpSGExcDdFR1FEVmpxM3gxcEZvMVJxNXJIUGZvVTMvOHZvMW9wWld4?=
 =?utf-8?B?T2pCMnhkUDd6YzJPdGpURTFTNXhpRlI4V3BlMGhtUmF0SytHa0F1Ty9vUXE1?=
 =?utf-8?B?ZzZDNFBqSVloaHdYTEhBTlZNNnFPT09MeHJucUt0ZmtHYkdEMHc3ZGd2OE55?=
 =?utf-8?B?WHU2TThJczRwblEwekZBaTZwQmJBTVY1akNHdDBtOFBJdzJVNmlZODlMYWpJ?=
 =?utf-8?B?Y2g1c2ZOOGJrKzN6VmcrWkFCTmpreEw4TmNCWDNVd3FSR0VuYVJwem5ERkUy?=
 =?utf-8?B?alMwYjdYN01qQ3lSYUp4M045QkFCMUF5bmh2eHVwcVFuL3pYellIN0UwYm94?=
 =?utf-8?B?L1RjTlB5UUhaZHBVeHJGTjB1bm1YQjhUOEMvaGxSaDdOWHV5QWlDbFJaNXlX?=
 =?utf-8?B?YUM4d1NnZWJzRGw1TlFhOEtaZkl4LzdqUEg3MDg1TFJ0WkF5VzkrSkdoV0Zt?=
 =?utf-8?B?bjlHMWduRXJvNG9WT3hFN2x4SkVQdXVGM2JEVXhCZEVwR3VEK01wMEk2TXU2?=
 =?utf-8?B?ZFlITnF5cVJrYjEyVEZ4QWtTMlluYkpXTUJXYW5aalpiclJhYmt0TVdqQ2lk?=
 =?utf-8?B?NUJuTkppV1cra2gyUUNGdEZ3WVNVV1h0UXExK1IvbGV3QmYxeEt3dXowcFN1?=
 =?utf-8?B?dDBvK2ZHS1FTRVRtZVVsK2ZKSHZ4bWN6UjhDSlZTOVhTZ3hTUkpDcnRzWTVy?=
 =?utf-8?B?bUs2RjhsdlNXb1ZSM3E4NkhOM0NyNmxwYVo4QlM2NHowVzZCR1lxZis4SmtC?=
 =?utf-8?B?ditIdmo0TVdCcnMzQXQxUzhoVmJpYS9sMlg5SFh0QzRyTjZscm0wSHM5SWN2?=
 =?utf-8?Q?Hlfz/eCEu6GF3eG0=3D?=
X-Exchange-RoutingPolicyChecked: CjyOA3xIh97nFkGrWM3JyxSf1WlLPeEBncaYMuO9Fc1jE2KnO9GbvPglpSbc3EEqHW1x/XLBcrzjiAqG9sZVSBqqdRK7kdIwJbZpi1bsnWBb2nbLbfzw1Mavf37tp0vjWj5stgNlE3FBGAl04hXGXsGyoJKHiZ0DKPTrHI0BDtpWenzkqaHwaj+sZxbwU5jjJSDGhj43N1u5CeMxarqbCCu67bg+6KhAMzb9Ll8QFIC1/RZO1VsVIro4BKMiepctKJVdKkH5ZaCgF2JiAGMybRgTpL7uayof16mvPrGF0XVhH/WT1dmoVysr+GJ66+egghPTvf0MOQsrewDlpdIsjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea05834a-80ce-43a5-a420-08df3c6636cf
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 00:29:41.5616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vY7NqO47ZqGt/+xgX/MKFlKJtxX7ROQaZjNBf4d8ptPR/YtuGDVQsiLUTOtDZrj9SvWo0XcdXATjkN/xM6tN5EjKjer3yv7gEkWdLPaBWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB179642
X-OriginatorOrg: intel.com

Hi Ben and Richard,

On 11/6/26 7:53 AM, Ben Horgan wrote:
> Hi Richard,
> 
> On 05/11/2026 09:41, Richard Cheng wrote:
>> On Wed, Nov 04, 2026 at 05:09:28PM +0800, Ben Horgan wrote:
>>> Hi Richard,
>>>
>>> On 04/11/2026 06:43, Richard Cheng wrote:
>>>> On Wed, Oct 21, 2026 at 10:55:35AM +0800, Ben Horgan wrote:
>>>>> Hi Richard,
>>>>>
>>>>> On 20/10/2026 17:30, Ben Horgan wrote:
>>>>>> Hi Richard,
>>>>>>
>>>>>> Thanks for having a look at the arm64 side of the resctrl selftests. That hasn't had much love but
>>>>>> it would be good to have them working properly.
>>>>>>
>>>>>> On 12/10/2026 08:47, Richard Cheng wrote:
>>>>>>> cl_flush() and sb() compile to empty functions on aarch64, making
>>>>>>> mem_flush() a silent no-op and leaving CMT/CAT tests operating on
>>>>>>> unflushed state.
>>>>>>>
>>>>>>> Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
>>>>>>> loads and stores.
>>>>>>
>>>>>> I guess this is referring to the synchronization required for the cache maintenance instruction but
>>>>>> that's not what you are using in this patch.
>>>>>>
>>>>>>>
>>>>>>> For cl_flush(), "dc civac" only reaches the Point of Coherency, on
>>>>>>> ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
>>>>>>> platforms. Instead, dirty each cacheline with a store so that
>>>>>>> mem_flush's full-buffer sweep evicts lines from the SLC via LRU
>>>>>>> pressure.
>>>>>>>
>>>>>>> Signed-off-by: Richard Cheng <icheng@nvidia.com>
>>>>>>> ---
>>>>>>>  tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
>>>>>>>  1 file changed, 11 insertions(+)
>>>>>>>
>>>>>>> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
>>>>>>> index b9fa7968cd6e..eae0262fe265 100644
>>>>>>> --- a/tools/testing/selftests/resctrl/fill_buf.c
>>>>>>> +++ b/tools/testing/selftests/resctrl/fill_buf.c
>>>>>>> @@ -27,6 +27,9 @@ static void sb(void)
>>>>>>>  #if defined(__i386) || defined(__x86_64)
>>>>>>>  	asm volatile("sfence\n\t"
>>>>>>>  		     : : : "memory");
>>>>>>> +#elif defined(__aarch64__)
>>>>>>> +	asm volatile("dsb sy\n\t"
>>>>>>> +		     : : : "memory");
>>>>>>>  #endif
>>>>>>>  }
>>>>>>>  
>>>>>>> @@ -35,6 +38,14 @@ static void cl_flush(void *p)
>>>>>>>  #if defined(__i386) || defined(__x86_64)
>>>>>>>  	asm volatile("clflush (%0)\n\t"
>>>>>>>  		     : : "r"(p) : "memory");
>>>>>>> +#elif defined(__aarch64__)
>>>>>>> +	/*
>>>>>>> +	 * Dirty the cache line with a store. As mem_flush() sweeps
>>>>>>> +	 * the full test buffer (sized larger than the SLC), cache pressure
>>>>>>> +	 * evicts lines from the SLC via LRU replacement.
>>>>>>> +	 */
>>>>>>> +	asm volatile("strb wzr, [%0]\n\t"
>>>>>>> +		     : : "r"(p) : "memory");
>>>>>>>  #endif
>>>>>
>>>>> One more thing that occurred to me is that if this is intended to evict all existing data in the
>>>>> cache then it would require that the cache portions bitmap for the control group (PARTID) in use is
>>>>> set to all 1s. E.g. 'L3:0=0xffff'. Otherwise, you may not affect the whole cache. This likely means
>>>>> that the cl_flush() function isn't the right abstraction for MPAM and the test needs a bit of
>>>>> restructuring to get this to fit in elegantly. Similarly, to the limbo handler in resctrl you could
>>>>> then check the llc_occupancy() to check it's under a "low enough" threshold.
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Ben
>>>>>
>>>>
>>>> Hi Ben,
>>>>
>>>> Thanks for the feedback. I checked the code and ran some tests.
>>>> You're right, my implementation writes into the benchmark's own buffer using
>>>> the same PARRID/PMG, and the buffer isn't always larger than the SLC.
>>>>
>>>> I can't claim that it produces an eviction sweep 100%.
>>>>
>>>> I think what are want to do is to check whether reducing a group's cache
>>>> allocation causes more cache misses, thus the data left in cache from the
>>>> previous allocation must not affect the next measurement. That is also
>>>> why I want to reuse the concept of Intel's test with CLFLUSH before
>>>> warming the buffer under the new allocation.
>>>>
>>>> I'm thinking maybe the assumption can't be achieve on ARM, I ran tests to
>>>> measure occupancy before and after each preparation method.
>>>>
>>>> I tried this patch's implement, and "DC CIVAC" since I think it can affectively
>>>> invalidate cacheline without throwing old data away, which should left
>>>> occupancy almost unchanged.
>>>> And one more method with a separate large buffer in another group.
>>>>
>>>> The result turns out like the following
>>>>
>>>> Preparation                     Before (MiB)   After (MiB)
>>>> DC CIVAC + DSB SY                     51.19         50.47
>>>> zero-byte stores + DSB SY          53.12         56.43
>>>> Separate-buffer pressure             53.25          7.14
>>>>
>>>>
>>>> The current method increased the benchmark group's occupancy instead of
>>>> reducing it. "DC CIVAC" left occupancy almost unchanged.
>>>> The separate buffer method reduced occupancy very much, but still left data
>>>> behind.
>>>>
>>>> It makes me think we should reconsider the test method. I think the goal is
>>>> to check whether the MPAM allocation limit works, clearing the cache is only
>>>> how the Intel RDT test prepares for that check.
>>>>
>>>> How about we set a group's mask before its worker initialize the buffer and
>>>
>>> We'll still need to make sure that the PARTID used for the test hasn't got high occupancy in the
>>> cache before running the benchmark.
>>>
>>>> then run sustained cache traffic and measure occupancy after it settles?
>>>
>>> I assume the occupancy is measured via resctrl, llc_occupancy.
>>>
>>>> Maybe compare full, half and quarter masks to see whether the allocation limits take effect.
>>>>
>>>> Does that sound like a useful direction for MPAM test for you ?
>>>
>>> Yes, I think so.
>>>
>>> Would it end up like this?
>>>
>>> 1. Choose a test control group and ensure that it doesn't have high cache occupancy using llc_occupancy
>>> (If it does have high cache occupancy then clean it. Probably by using separate buffer with a
>>> separate control group)
>>> 2. Configure the L3 cache bitmap for the test control group
>>> 3. Run a benchmark
>>> 4. Check that the llc_occupancy is as expected
>>> 5. Repeat 1-4 with different cache bitmaps.
>>>
>>> However, it doesn't sound specific to MPAM but more like a general test for the cache portion
>>> bitmap. Possibly it can be a separate cross-architecture resctrl selftest that compliments the
>>> (somewhat) intel specific cat_test. (There isn't a platform independent way of measuring slc cache
>>> misses on arm64.) This depends of the resctrl selftest maintainers view.
>>>
>>> Thanks,
>>>
>>> Ben
>>>
>>
>> Hi Ben,
>> I like the idea to make it a general test for cache on different arch,
>> but yeah let's leave it for resctrl's maintainers to decide, I do not know other
>> arch's cache topology and such so what I'm designing is very likely to overfit on ARM64.
>>
>> Anyway, per your suggestion, I tried a few experiment and came up with the approach
>> like the following, and still have some points needs to discuss with you if you don't mind.
>>
>> We'll reuse one test group and buffer across tests for different bitmaps,
>> and a separate group and buffer for sweeping.
>>
>> 1. Set up. Create the test and sweep group, assign workers, init buffer, give the sweep group the full cache mask.
>> 2. Prepare before each mask. Keep the test worker stopped. Run the sweep worker and check "llc_occupancy" repeately,
>> until it stays below a starting threshold, I set it as 4KB on my testing machine, we can discuss about it
> 
> A starting threshold of 4KB on a machine with 164MB cache seems lower than required. Assuming, the
> maximum number of cache portions supported by resctrl, 32, then each portion is about 5MB, and so if
> you are measuring occupancy to check if the cache portion bitmap has the desired effect then 4KB is
> in the noise.
> 
>> since the value should fit on different machine. And we'll put a timeout for cleanup time.
>> 3. Stop the sweep and apply cache maskWarmup test workload for 3 sec
>> 4. Run the workloadRead llc_occupancy and see if it meets the expected value ( that's what we need to discuss )
>>
>> So on my machine it has a 164 MB share cache, no matter what cache masks I use, the cache occupancy won't be 100%,
>> even I use some mask like 0001, 8000. I'm not sure what kind of expectation should we apply on the test,
>> just not exceeding the rule's enforcement is enough ? or should it exceed certain amount of usage ?
> 
> 
> I'd say just sufficient precision to be able distinguish between a cache bitmap with n bit set and
> one with n + 1 bits.
> 
> Does checking which of these intervals the occupancy in give you a reproducible way of determining
> how many bits are set? Hopefully overshoot can be sized to make this reliable.
> 
> (0, size/num_bits + overshoot),
> (size/num_bits + overshoot, 2*size/num_bits + overshoot),
> (2*size/num_bits + overshoot, 3*size/num_bits + overshoot),
> ...
> ((num_bits - 1)*size/num_bits + overshoot, size)
> 
> As you mention above, making this reliable across architectures and even across arm platforms means
> that you can't be just be looking for precise numbers or exactly repeatable behaviour.
> 
Using benchmarks as a measure of resctrl health keeps giving problems due to the differences
between systems. I cannot recall these tests failing because of an issue in resctrl self, which
they are intended to test, yet they do fail and then need to be "tweaked" to accommodate some
new architectural nuance that has nothing to do with the resctrl subsystem. For example,

	https://lore.kernel.org/all/6de4da5486354c0f25fef0d194956470cb744041.1775266384.git.reinette.chatre@intel.com/

Please take a moment and consider what you want to achieve with these tests: what is this
intended to test? In a way the benchmarks seem to be testing the hardware capabilities and useful
to hardware validation folks more so than testing resctrl subsystem in a useful way to
kernel development. 

More specifically, if this test "fails" - is there *anything* we can do about
it that does not involve "fixing" the test? 

In the end I find these performance tests valuable in how they interact with the
resctrl filesystem in different ways, not the actual performance values returned by the tests.

Of course it is up to you, I am just concerned that you may end up (as I have) spending a lot
of effort on work that does not end up being a deterministic measurement of resctrl health yet
is used to produce a "pass" or "fail" verdict about resctrl subsystem health.

If you do end up using a benchmark I'd suggest to make the checks as forgiving as
possible. For example, instead of checking something like "LLC occupancy needs to be
X when bitmap is Y" it should check something like "LLC occupancy when bitmap is all ones
is larger than LLC occupancy when only half of bitmap is ones". 

I find work like

	https://lore.kernel.org/all/20260810095124.32244-1-icheng@nvidia.com/

to be valuable as deterministic measurements of resctrl health.

Reinette

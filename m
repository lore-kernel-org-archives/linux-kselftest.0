Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2616E387347;
	Thu, 12 Mar 2026 20:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773348822; cv=fail; b=UK/SK9fR5MhxUtX3nNW4wlUAUv34zGF+emgb9IrLnJ27DetGkaFIE8U1Bzm0yKWV7kp1tzBY6Cv1jGwDYrAB0+r8yQ51OfPvvi3238yl+s4bBRM7o2W9ktKEaMVRSVdYxBKOHhIpb0HV1pQZC+yEL6WiRuNz0/JJlOqdcFFPW1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773348822; c=relaxed/simple;
	bh=G8Xvd/aGuRRhAHyqZWkb+0QzoWCAERz8SM0DDU5pBwU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I1+dhP44wXDbC2Oh6/a9NupVtFjK87+QDYrKqRRlH/wdF9zNC0VmLGZxWiN+Bdb1q5QMHHXvPYusD05JrBGcvHWBzxXwpE+C2Joi9tuPCgBrxH7y2EXdJCtu+cb2eGpwFxcfC7hC1d4Gfx6iez1porr9ntrCXOGsRu1wGP8CE6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHpIGEgd; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHpIGEgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773348819; x=1804884819;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G8Xvd/aGuRRhAHyqZWkb+0QzoWCAERz8SM0DDU5pBwU=;
  b=iHpIGEgdpcUD7WQzS8VHUni9XRLCxcoVPsuqKRTPmIlLCpQyZ0AOkfAU
   ZIG+L4GCDnsF5rmdnCcvaATE9lFfMRvpByjEi+f+/dfhGUnHms1tqMIQd
   ZY7Px1iHvMwRg1qU66xsqH5oqDjUz5AQmbZv5d3v6f3SBFuvw2iFCdJVp
   76QiQcz9EQvlYypX47ZN4LEt7k2f5bozrJVbqzIs4nzqssSITEJm1aHol
   Gvm0nXMk/ENpqswZX/VzXPvcMMF8YXFH43aJbvsbhE6gtGaXHvUKyBmi0
   pujFiuYU55qFPgub7WMcRkQZksAlpwuDiknx8kXwfTeTaE26QKW2Dga9d
   Q==;
X-CSE-ConnectionGUID: KFL5R/o7TqCTWlrb5Bbi+w==
X-CSE-MsgGUID: N/TBMmeKQ0qFBQKEvdFCEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="92029872"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="92029872"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:53:38 -0700
X-CSE-ConnectionGUID: Da/f0Od7TBGSoI60YPFnqQ==
X-CSE-MsgGUID: J8aVaGeWQo+0iETnuSFYBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="251463288"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 13:53:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 13:53:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 13:53:37 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 13:53:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rglw8css728U6L7H9kr2NYsja7evXIcb8PnpkecxWUPRnwGNisaSRCQQ/tiSalqYGGvU9D2g3BhduYiO/SCGr2B9nCkwEFnRwk4mfK1yKgvP/EzBBRFPCcBdmQaOt2DzGWmafXEM8meGE8OPrr58ivY1jkzRZWd/3T2skOrvLvlFta3ECRR1vn+YA1o4LQTV2JkjIykjSOb43ghsyZjgfM2PoA2EzIXfKDa4EC7tLaU3jmPPOKjq9I5cxJzMyPDOex3sun0su9S2ILANjp6k9wlpz6Y2K9ZzgzG1JGcfldAHFM51I3jaPgkEEdsaMNRvMkTVfesj4VNs9IguzHyDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6XpXMWWIJC59WUfiQSSk4695Kg4bso/yGQ382ZqrlM=;
 b=I9S4/FEujTEG6RSiPc2ypTQthmUU4bTbizWCHKyFGZqrZJMQQCSNcZ8hHlK8p7Lea2YdHoIVGtXQ3Zd4palqFlLu/mcjioF3P6umVERdoJc/oM9S/E+K6Cw1WkFFR+PGoJqY2xIQ3mdle07gtg9+DnlEzsIhxXolvsnhOLFkTuL9a62O4MmtZPD+WmJkKg+MLtb7woxUkguP2v2PMolG4KGbFY4uS6E9p2V/9MDLg52IDcd7qjOf9+kimuD7peT3z4N+VRURDWQNBBYG7wvLoeqXK7UtFVUucFg7W1P8wTPbx/Ls2Kw02NCRl5E0lVmH4nB1LKbhMXsy2L0m5VrC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA4PR11MB9179.namprd11.prod.outlook.com (2603:10b6:208:560::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 20:53:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 20:53:34 +0000
Message-ID: <33a9c54d-565b-4de9-b525-1390bfd50593@intel.com>
Date: Thu, 12 Mar 2026 13:53:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 1/9] selftests/resctrl: Move CPU affinity and resctrl
 FS setup to child process
To: Yifan Wu <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-2-wuyifan50@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260304040334.765860-2-wuyifan50@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:303:b6::15) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA4PR11MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 66637cf6-7fe2-4a5f-c239-08de80796d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UASpax1o9eaKqkx67z1mZ9WV7bGboZOcRlU90llIw18pba3N0oJia702P4yM8xAbMXEBZYqmTbBUkst9SmDhuT1WtZIvm/ignnAGjTN5vFh2d7vi82RCQcxLybOgxAn9B4zJ9W/8tJW6+Gc8cYuJkOwQg79+oIXyewZhHKE3uvHdspw+wkP0TZe68SbqkB/VmYp7ns1fUTlPNobmrcfF+rTZq8QvAJ2fzbSw53hmSbpr0Bumm5t0J4j7K3/u2mlgwEdIZ8W8VHiAOT2bKtK9/nkP9R4XHq5lXy1v79qu9/eyjQuCBBXbfCkLzxEWvUWgICEuaCXMi78qO4EVIdNTEziTLSGwjjHDIuChfbF3IfUccfpdwmHd+A7zpAgt53H2/7K+ivOp4zKsvs1kQFqunk/5L7XQMtKXCu/eIN6EuJO79YrzitoLVbkBX3H5Q1xoQPnSQXb6yaN4JBYx+J/C2NfEXkR9YZwJzURKs/8CgbNCMPWJnA8SFl5XNfNiS2lyzR9PjrIZWge+3HZ63MKJLbFxR8q0j3jNq1ccXwjsRlYUFG7n9Wgsr+ZqvDQWvWtuj/0kh+lZZVfSAkpU2W6CRnCtrnetQnz7047u0hWCX3+MbCxWH0J2unYzjikz7duUpPWyYW9Psgi8NO20AB608zsohNjyFMrTTe7yBmIuoaeSh5erycuwOevS2MUbNYj4kNt5RuY0MBm82beTxP8LVswf2HmUmliGgjRO2XEk1gyR5nL1gx3Hk56XTCxipRpHE9TTbZdf2KDSueCNXFMHFAgC7ATEqj1Ox1d/QqzIC9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkRuN216QWltMVdmN01aMTlhUzhJVHg1WlZ0RzNXRUNuWGJzSnFVTkVDalZu?=
 =?utf-8?B?dUpjRHpCTTlSMzR5SGdjaTdFQndqbmVkWTg1ZCtNOHp1blpHQlNQL0drUXdx?=
 =?utf-8?B?WEp2ZzZWS0s3aWhpWmNEcUJpS09KaHh6aEQ2TXB6V3pOUmkzTzVqVzBpay90?=
 =?utf-8?B?Q1ZqaHBhVnVzc0ZneTBNZlFId2s2WnlXakQzWkVYTW5UQU5yTG5abTkvV1Y3?=
 =?utf-8?B?WkMwUHg4Qk8wc0hlejluVi9DVlJKVGFRNnU5L0xQMlRIekc1VHo1a1FkZXBo?=
 =?utf-8?B?OE9wSGZRRCtmVXJvd0dJUTBMbFV5MVBBcENRZEhaNksxci9ibm93YlRybzBD?=
 =?utf-8?B?anBPRDdtTTZ1RlJSYTJtZXY1dXBhUk81dmJUMzF6SWZ4Q2dCdXNoTE5nK3Nm?=
 =?utf-8?B?Yi9NN0hwZm9UY3pEa0RPNUtrVzZLRVM3QUZxU3VZUHY3U2dCdjdTVDNTb05J?=
 =?utf-8?B?SGo5ZnhlTUpqQWcwTkZMcWZ2NzBFMGxzdXFUNVY5VHp1ejVPVkVkUTRBRGw4?=
 =?utf-8?B?YmtIRjlVQWhGTW5Tc2VaQjdjTjdCQ2NyTjg5SG8vN25kUEEzQXY0RmJIajZ2?=
 =?utf-8?B?cm9FbFZKdzdGQVc5NytQY0liOCtrK0NXN2NrcWxVRnd2VTZnQlBYeEVMWmJQ?=
 =?utf-8?B?cDc3SVJSaG9HY1c1SmljWUFmd2hJN0NESGZoUWcvV2hUUnpLN2tJRDNxaXhC?=
 =?utf-8?B?VkdSQURHbFlkQ3E1Sm5mSVBYMHpqNjVITlRtWkVqenZTaVVrZTg1cE1wa0ZD?=
 =?utf-8?B?OTljOG5Yckk5VURac2dhbndhSDBSMlgveEFRRFVaS1R1WFk5dHZsdGxXNGt4?=
 =?utf-8?B?WWJKQlNTQVN2clN6TldTcmpQM2JjOXdQUm0rNHpYVUlNOVdxS1VqbWo2RlBJ?=
 =?utf-8?B?R1h1SEFrVkVuN2lCNkdXUGN2cnBtZGliRXNacDBTdG1ReUdCVXo4QTQ3akJ2?=
 =?utf-8?B?dlBpWXVsUC9xUFNKVnIyaVVQcGdWM1g3TzQvbkJTcUFrWkJlMldYR0NzTlNY?=
 =?utf-8?B?UjZNdHp6cUtTcHQ2Y3piWHdIeFJmM3VuMWY0eHhFNzJVQ0xiV1BGcHRJaXhN?=
 =?utf-8?B?MWJZQkRNREUyZDlhbWUwNHpCOG9XUWVkaExJVVMrek5NNVBidW1SWGh4N21r?=
 =?utf-8?B?V0QzV1MwemZ0L0pUVFlTSTI0ZDlDZ0FCa1hkNmpyOVk1UEVPWFpaK1YxSkNI?=
 =?utf-8?B?dzFEWm5nVWRqZkw4VU16QmpleUZ2VTh2RUk2aTg1VnZ1Y3lRNU1UczJ0Qm5q?=
 =?utf-8?B?RkFmanRRNU1JcTNLOGNWNlluYlpEa25MQ2xhcnVuU3VJV05LODNMbkpRTG5H?=
 =?utf-8?B?MWt2d1hobjJHZ3BRbW5QN2FmeTF1QlZEaXE4c1lVM0NzdFFOTnJ5ZGd6MTMw?=
 =?utf-8?B?M2VwZlpBSkJyZDJXdjF3RUZLM3RHK3krczFkWlJja3pCY0VNRGxmSjVMcTJv?=
 =?utf-8?B?andnWWV4NkFuYVh1M0d2dDlnTjJvSVIwK3lSM3AwQXdCN1gvdk1KQytDSExW?=
 =?utf-8?B?eTRnUVJEN1Vyc2FBYis0bFljY2tYMjJjeTBSaXlxZkV5djJycHBvTUtkYlFy?=
 =?utf-8?B?Z1c4S2R1Z3FYOC9ka0ovM3B3UzlQenpoYnZpMktBYmRzQmlKQ3FBY3BMTlFT?=
 =?utf-8?B?a1VtMnE4c1Rwek9RVHdQb1RKQ1JBV3d5QmZ3QmJJUGxPZThvOFVFbGc5RnpS?=
 =?utf-8?B?Yld5ak5XOWs5NCtqakZNVVdBZHRaa0w5em5BbjN6MkNQakxYRmFPK0Z3elky?=
 =?utf-8?B?cmN2VGhmTjFqL0UvdXV3ay83MDA3b09MdmVnQ3NPNElJTk5xT2JXWkp5dDEr?=
 =?utf-8?B?anBuTEFwNS85OGR2U05YMkFpUDREOHRERGFhbHpaNnpoNVN5UytIQWx1eEUy?=
 =?utf-8?B?UzVNa2taeGRaSmovekM1akNPRldqUGNHMkUwZjczTjlZcXY5b3lkRmpPM1BR?=
 =?utf-8?B?VEtwRkpIMVVISTA1dVVka2x1RUYwNm5VVTBPZ2UwbUZxNEczbEJFRDlzK1k4?=
 =?utf-8?B?R0NtWnZaQUdXNGRJeW9FTHlUMkNQWEVYZnBMRi9DQmtqYzFYdFBUbnd0K1RP?=
 =?utf-8?B?dllEclFZRlJmWHM1akl1eWVNYnZZa2xIejVXSEZlWERScjBkb3l6Szh1RG5U?=
 =?utf-8?B?dkNhVWF5QWkyWUU5QXIvTE0vOXFLa1FuQUF4dWhsU0wweVlzRlkrZ1g3Tlo2?=
 =?utf-8?B?WEx0bmovMGs5YkZvM3czZ1QvYThJMkhEZExNQkNvNUpzTXV4U2Jqb0FsVlNp?=
 =?utf-8?B?SEFFTWd2aHhnakFNeTNzSVdmSFlKUFY5MUZZd2tCUExlZCtFMkZYUlVaV2ZG?=
 =?utf-8?B?LzhXbHdXVFZwbGJKYVRJSmkxU0VPT01PemZGU2ZzZWdDdTZyTnkwcFFRMnlm?=
 =?utf-8?Q?KKiKvIZt75/cmi+c=3D?=
X-Exchange-RoutingPolicyChecked: BIbNeoDYiMGJM7Y9w47aHsWEjHc6a3xBs++Aga0ZAVQz7SQ7VST0OB3W0DEZqYgvi01NZF+f2hrPeZKNhPzNkzUlRJXTSBYzgmH25ymL1tB2TYStJQd4/qPRlSOL1kZbCg9gmYHcXXpoyNpR1NJJC+IRNKaKR+8iHd2r/tcjBgeg/dMrqyIb8jivlWiWc9lO0SMfiHJgQE5Liyv0KN+VtKOndWmsrb3HXZ6+iCG4+unTsSiQfQZVpE8I81ke7Xria7wsDgHMYfmQxsz5U/NA5GsNYFzlCrHbaW/S7o71k7bqIaiFDRKKcic3p6jjJIudr3TW2YXxscWg5uQLI0Zr2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66637cf6-7fe2-4a5f-c239-08de80796d50
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:53:34.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2J1Mk5UnCCsb/DdQ1+tT1PAZvge2yVrcn2D9/iZbftJfBzKehl0zlSywb6AbQdUoqwL69KlA7cHEGXZevZGxcyNI8NQ3YEjyUrznMz+ctTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9179
X-OriginatorOrg: intel.com

Hi Yifan,

On 3/3/26 8:03 PM, Yifan Wu wrote:
> Currently, the resctrl_val() function sets CPU affinity and writes
> the parent process's PID into the control and monitoring groups in the
> resctrl file system before forking the benchmark child process. This
> causes several issues:
> 
> 1. Writing the parent process's PID into the resctrl control group
> unnecessarily affects the behavior of the parent process, while the
> control group should only apply to the benchmark child process.
> 
> 2. Writing the parent process's PID into the resctrl monitoring group
> introduces the parent process's activity into the bandwidth measurement,
> affecting the accuracy of the monitoring, which should only monitor the
> benchmark child process.
> 
> 3. Since only the child process is monitored, the CPU affinity should
> also be set only on the child process to ensure that the PMU (Performance
> Monitoring Unit) can count memory bandwidth from the benchmark process.

A child process inherits its parent's CPU affinity mask, no?

> 
> 4. When the parent and child processes are scheduled on the same CPU,
> the parent process's activity may interfere with the monitoring of
> the child process. This is particularly problematic in some ARM MPAM

Which tests are encountering issues? For MBM and MBA I do not think this
matters since the tests just compare perf and resctrl numbers and perf
will already contain all bandwidth associated with the PMU so isolation here
may require to potentially take all traffic off a socket.
CMT tests may see some impact since it compares cache occupancy to the
size of the buffer being read. I do have a pending series that aims to
address some issues with the CMT test:
https://lore.kernel.org/linux-patches/cover.1772582958.git.reinette.chatre@intel.com/

> implementations, where memory bandwidth monitoring real-time values. When
> the child process is preempted off the CPU, this results in inaccurate
> monitoring.

This motivation is not clear to me. Could you please elaborate how inaccurate
this monitoring gets? The child process may be preempted but it should not be
moved from the CPU in its affinity mask.

> 
> This commit moves the CPU affinity and resctrl FS setup to the child
> process after fork(), ensuring these settings only affect the benchmark
> process, thereby maintaining measurement accuracy and making the
> implementation more portable across platforms.
> 
> Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
> ---
>  tools/testing/selftests/resctrl/resctrl_val.c | 68 +++++++++++--------
>  1 file changed, 39 insertions(+), 29 deletions(-)
> 
> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
> index 7c08e936572d..85ac96c7cb8f 100644
> --- a/tools/testing/selftests/resctrl/resctrl_val.c
> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
> @@ -545,7 +545,6 @@ int resctrl_val(const struct resctrl_test *test,
>  	cpu_set_t old_affinity;
>  	int domain_id;
>  	int ret = 0;
> -	pid_t ppid;
>  
>  	if (strcmp(param->filename, "") == 0)
>  		sprintf(param->filename, "stdio");
> @@ -556,22 +555,10 @@ int resctrl_val(const struct resctrl_test *test,
>  		return ret;
>  	}
>  
> -	ppid = getpid();
> -
> -	/* Taskset test to specified CPU. */
> -	ret = taskset_benchmark(ppid, uparams->cpu, &old_affinity);
> -	if (ret)
> -		return ret;
> -
> -	/* Write test to specified control & monitoring group in resctrl FS. */
> -	ret = write_bm_pid_to_resctrl(ppid, param->ctrlgrp, param->mongrp);
> -	if (ret)
> -		goto reset_affinity;
> -
>  	if (param->init) {
>  		ret = param->init(param, domain_id);

write_bm_pid_to_resctrl() does more than just write the task ID to the tasks file,
it also creates the resource groups in its parameters. By moving it after the
param->init() callback it prevents any test specific initialization from
being done in the test's resource groups.


>  		if (ret)
> -			goto reset_affinity;
> +			return ret;
>  	}
>  
>  	/*
> @@ -586,10 +573,8 @@ int resctrl_val(const struct resctrl_test *test,
>  	if (param->fill_buf) {
>  		buf = alloc_buffer(param->fill_buf->buf_size,
>  				   param->fill_buf->memflush);

This is the buffer on which the workload will operate and by having
different CPU affinity between parent and child the buffer may be created in a
separate domain. 

Consider for example if I apply just this patch on a test system and try out the
MBM test it now fails:
1..1
# Starting MBM test ...
# Mounting resctrl to "/sys/fs/resctrl"
# Benchmark PID: 6127
# Writing benchmark parameters to resctrl FS
# Write schema "MB:0=100" to resctrl FS
# Checking for pass/fail
# Fail: Check MBM diff within 15%
# avg_diff_per: 100%
# Span (MB): 1280
# avg_bw_imc: 50
# avg_bw_resc: 0
not ok 1 MBM: test

What happened here is that the buffer was created by the parent in one domain but
the child's affinity was set to another domain. The test assumes that it can
count local memory and all of those counts are zero for resctrl since the memory
is not local. Similarly low numbers from perf for same reason.

> -		if (!buf) {
> -			ret = -ENOMEM;
> -			goto reset_affinity;
> -		}
> +		if (!buf)
> +			return -ENOMEM;
>  	}
>  

While isolating just the workload to its own resource group may be reasonable it is
not clear to me what problem this patch aims to solve. 

Reinette 


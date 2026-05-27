Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AE9625;
	Wed, 27 May 2026 01:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779847054; cv=fail; b=oLfeD7IIY/CUb55ThfiFFW3yeWLUVSTsAybs1owTPKqHjMqalTM0UeqTSYYK5WuH7DaHhYa4QF0MGR9+6SSuM2RN3VClNZdJIbnZVM9CfDWMXKX1W28sBouu36oTGK3ullUhm/PTnSSPqiatOplzgIYTcFu8ANrzVTFdptWe2P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779847054; c=relaxed/simple;
	bh=xYUbffEUr/XL78DXTYGTKOkAx99WX7AQRhYfBShUdlE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CDjLMune0CuuMCtehmhXk0/WvYpW0D6c4g844LTr0foA6z6Qafj8IjgxESFxSA8kyLckQBKWrnEd7bcwZumeziRdgqwG3AzR/hBkpmOrsBAvTnLdW2AH7cp0HbvyJlXmfwtL1T3dZOAzv6PmL7b6CmGg+GKZfFWjsy56ESVEq8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cA6PfoOO; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cA6PfoOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779847052; x=1811383052;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xYUbffEUr/XL78DXTYGTKOkAx99WX7AQRhYfBShUdlE=;
  b=cA6PfoOO/X6/nBnTBi+3W6RyMQfbDFwj0suAmX4J6OvRL4nYmSGq+fju
   IOYijnCqJbCfqbNn/FGvSWnGH1+ZaFydb2yVXAiC9lNfOVEhEVEzrilCG
   l1/ogBe6HQIfaszAvwK12Bupg3YI306ZMeGpnYwo2DE98gIfDkTUDjRS6
   pNGrlUjH4ulYjLnSmvhDHhnyEmRYJupxqWCYzRWVKFzk4yNS5IbVqqUJF
   /60dmOSu+KGX6BDcDqvgsASn+d9JVYvcI7UACkEvo6w3Luu4Jorx3yu5q
   B5WSZJW1adoWgK1LpSwKsCXb3Dn+wcEZEyNHR8ZoW/TOFRYxbjd/Qhj9u
   g==;
X-CSE-ConnectionGUID: 2EZx1RWFS56LfWTfsj1WWQ==
X-CSE-MsgGUID: 1f93dWcpTaSIsr+zWZeD5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98097236"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="98097236"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 18:57:31 -0700
X-CSE-ConnectionGUID: PRgDU6jvTUGJoMY9LSdH7Q==
X-CSE-MsgGUID: 0FfwXMY6QXug2le99usp4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="242159250"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 18:57:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 18:57:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 18:57:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 18:57:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6KmeqRHlN41DZUZ12a7S9SRkiYlL+h/rCOwzjBKNJ+NEHNqdrjhlAB8z5yQDkj7EPCs8x9zFn7vkpW/vAO7VUbgkkTEbZ0fJF04EO+hr6xOcZmlvGvxYH0h4DUoR61VFckrfOE2RkfxMIA968WRklmHoH2DUSIqJQwTegcrJQ8cRrIT8+5yQX322tJoEZMjT0cgtn2r4q84ZEIFEhTgJSRMeY+7kWokFgkADAXcl2vpDWkyUJeCPhX9u+0g7J6y005OgAUFZyQmDSSZxY/dqX93Oir0mj3CaBYz4/j2xt8Vmb1PATWn4rhVLzPjHOzFG/7J/CHD3NXiFl56LKc2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNsiwn+vLL+c3oijK+n7j4tpE3i9MJkKbnsgOEvdB64=;
 b=p1eqQgNo3LiVvW88Q8P7RyVNfJhscs5UbxAxmUUMjLBY8qREj5z+/qRkX8IuAtzyVpLvYGHoROPuUvr0iUZQnybfr8v74bGuA7HAth4tY0kwDnMiX3/sjWEufZ52ILo2R4nj1zmMXrYfhhTib/zsBvdSJ+HvbrbHaiyNftuZO8uJ+y9L4D4/NC81zjEsYMy2xixltG0/rl7uiJWm1/RZnH9gBmV5whD4A7N96GX/SVbkFtXYU6iwPtZLfRlVwjFVIvov3RwVYkWeyaA7KVfkIGqn07HStUlu0yWQSfDcDvSBlZ3OAjuLMfFZ4ghnm5p/BNVmwhkg+kRXCeeieoelfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS7PR11MB9452.namprd11.prod.outlook.com (2603:10b6:8:263::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.12; Wed, 27 May 2026 01:57:25 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 01:57:25 +0000
Message-ID: <a5473762-fbd8-4aa9-85ae-8bc8108e1d3c@intel.com>
Date: Wed, 27 May 2026 09:57:16 +0800
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
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <3fbb001e-bc78-45d6-92fc-4a8dcf708c58@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS7PR11MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5fe9ff-ddfe-4a3a-2eb4-08debb934c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4143699003|11063799006|22082099003|18002099003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: WhKLTsuz/Pn1+86NeFl2oQgD/iuUaC2Q1X21mA+FNOd9ab9tQoMau7N0X8aB+fMGo4Oxb+lEBzKF8RPF1XJtZ51sjh74Let8X5t+LoNQINBs4kOSjBJaAcpDfaEysbWyaSVyhcyDktN1PJE3lEedzLUrYWHp7UffxdpqfaR/cprVzITI/EWl8fOPONfUiRwmcfbpdnXVqc2nb6y1TY5qaSQ/gExjQKLp0Icd4CPsMRR/IYmuuyrxn6grvrHkATAe14Xs4LpWoQIhnadsadXSLiFwQKhSG0GjUosLdgHH4Koz+hcJ/2v33QddK6Jr3w0THWKiyZASnnrsIJGZo8c48LLfJiTkM6ygFCtiegjOJd79lAwMotOI/R368PSu0MH527D5v/jP5gosrWimf5SrOm2VLC2w7HK3DLkCOzz/O+V+hHCELC2lxuSL3fDNiHnSe7fYuKirbNjSxNkOYUE5fz2Kd7eFQYT+oT0hzyGLNoA3h9qqlOsXmrFg43QI34wjXo3Tfvn/zbUXql3oBGF8WH+uajlWHLRwHjZ2ljuCAOdXD/Re8mOcJpgJdlIABfZRpetPE+u7KuSUabyl7pCwnoDSVYgeGL4w39V++zy72dMk6twGQW6terapFrhFAWAaloJBiJDHiQpRselFPKwvrqok/kmBS8PQzv5upkDNbliC/pfGR+CEhrwyRKzUNIxe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4143699003)(11063799006)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGxGOWwreWRKSDZQN2h0K1JIMjJkaFJ6RTdnZFd3N0RXYm44ejQzckduQUY0?=
 =?utf-8?B?MElETGJ5U2t1emZEa3RiOW9KbFBzVFVic0NneXNhLzk5U01LYkJsNTFQbVFi?=
 =?utf-8?B?c1JxL1V4WmlsbS9HOCtmQ1NidVJEdWtLMWFLTVJmMGRHZDY0MnhMV2doc0JG?=
 =?utf-8?B?TVpUbEl2VDQ2dlBZSW5EdlJaN1lrSHI4bnpERzFGd2h6dHI1OXlBaGxjRy80?=
 =?utf-8?B?MVdpbXNiUkJQQ090YlVPSjR6L2h5VmIzck1Ed0s3cFVlMDhaRWEvbGJ6Smw0?=
 =?utf-8?B?OXZta3FSb2V3WHpkMkh6K0VWeUMwV25lN1dnL2pXaWN5S0Ruc3lTZ1IwaHRu?=
 =?utf-8?B?SnhYdkZDNk9abGNRcjVNNjkzcngvOFNtUms1S0ZGSE9QMmsyY2FZTm9BV1A2?=
 =?utf-8?B?REhnV2dEbk1udlM4UFJKWkZnWHM2NFNvSFJsUlhXYnpPbEdERnFqcUNlVWlo?=
 =?utf-8?B?WEhkWjNQVnR3UXR2T0o5U3RuNEF6QUlXQzQ0c0NEL0pTcTVidWlhYm5NTWk0?=
 =?utf-8?B?VHdqcEV5dlhaR3hpZUxHQmd0bktCRW9xK0hSYU1MSjNQT05kMXVrbmVHWGdE?=
 =?utf-8?B?dFhaemxybXhRdFFtTUliWWRGS1lZMnZhdmtvVkdqWGRLbmRmTk1vbmw0SXB4?=
 =?utf-8?B?S0kyNko1V2Nmc0Z3d2RZNkt3MHl6bkhjTlBqTm0rZzd2YXVDaGM3NXN6aE5j?=
 =?utf-8?B?dHp0R0RiL3k1UWFBWXFQMEY3S2w3MUJWYmNYZFAvL2FISG93NENnMmpKYkgz?=
 =?utf-8?B?VThyN0dDU000ekQwL3hWR2s0cnlDY0hweGk1WlUrV2hsZWJ2Ny9QQUpEcHBt?=
 =?utf-8?B?RDRjRDBWVFFtY3BLdFRXQ05jbU5uakFlaTliaXVBNCt1SkxGTTV0ZDlEU2l2?=
 =?utf-8?B?WloybFBEOGthajFWUWZwNzdSKzdpQTRYdUd0NlY2MEEvanhrTmFCNTFBT21k?=
 =?utf-8?B?V28vWXE5YWx3VFpWM1RrMmxscnhRSEs2N3MwMldQb083cFU3cnE2Z1lBNS9J?=
 =?utf-8?B?cFVyVFlTZzRURjg4VFhnVnpJeDlRNzZRUlVmZHN1SlczMVp1Sy9KdHYwTmtx?=
 =?utf-8?B?TCtEdzZWcWkyejVVcjVWUmEydlV4NWdBU3dlTG1XbHpZcXB5ZWZNdERPaytX?=
 =?utf-8?B?dUxvaDVGVGJORGQvUEdVMzMxM1ZNL3lwOXNGSXh1Y01zYi9QWjJZUmFkNy9O?=
 =?utf-8?B?NzA4VXZIUW9XSG9PTWlZRWZXOFRFUEczUjhjak5QK1RUa2l4QllreWprMVpy?=
 =?utf-8?B?bjlWTHkwcitGSUlQNWw4YmxMT0xVTytXZWFQVzh1bjZsZmRGZEpaMUFxYzVG?=
 =?utf-8?B?VzBTY2VLVkt1enlxUmhreXFnNkQraStXZ2VYeERvankzcjRWUVp6akNnSUQy?=
 =?utf-8?B?R0FDVEhPaGFkWGthYzdXakZoVC84VHNoWC9lL2Z0ZVVvZzR2NG9rSXZuUUlT?=
 =?utf-8?B?MTNaYWVnWXhtckZCS2x0UkkvRHI5MTdsT0txMzBNNjR4enBSeDFIejgrSnpr?=
 =?utf-8?B?VWptcHluTG5xOWR1Mm9lSzZ6cTNpcWJoUE1tcmhJcDNGNXg1SitXdnNVZ1ZZ?=
 =?utf-8?B?Q1RsVXpoS3kyTWw2b3JYZCtVVFAyd1lsUzIvTW9KbjNOUWc2S1FTOXozYTBh?=
 =?utf-8?B?dzZUOTRET3l5L3BQTkNwdnc5NTRXTS9hWVVLMG0wTWFxemc0MUN3WGlvSTBm?=
 =?utf-8?B?U2x3c0xMVC9QNm4waVNjOGJjQUJ4UnNQYzM4cUZVdU04UnRVOUZaQTd2OS9G?=
 =?utf-8?B?NmMrclUvNDN3bHZoaUFQbk9pUmFUNlp2V08wazJEK3VrZFc5YXBiZ09FTWhv?=
 =?utf-8?B?dDNmb1JTS2I5ejNpUERGZXJsMnY4MmVJM2VPdGt6aDZUajNuaHQ2M0Ira3g3?=
 =?utf-8?B?eWlBZHB1aUlsc0E1SnR1YWxYOHB6WnBZUU1oQzlWbFJSb2xuVVdBc3l6WjQz?=
 =?utf-8?B?RVRFellRMTNBM3ZQTTBXbHVzMFgrTUs5aVRoUWMyempJdlBYZ2V4NHIybnhY?=
 =?utf-8?B?NVFTcmRQaWszS0J3K2JKdzV5MzA4T1Y1a1ZVenUxUzYxUVRkRFlpOGNUYk9U?=
 =?utf-8?B?ejVsTGRESkI3K3F5ckZJYjkrMDIveXlJYmd1MThSSHRLanBRY1hSZFQ5cUIz?=
 =?utf-8?B?aEFneXdhVFVoS0N5cGQ5cHJEeWQrUDh0Vk5FTUZHSjFWcFQ3N3dzTnA4TWF5?=
 =?utf-8?B?a3RqbFVLUlFtSzdRZCs0clczL0JNQWtaUmdiRFNBY0EzRVJmbk5KSVRGVTlo?=
 =?utf-8?B?dlNtL0xVek1qaUQxaTE1TlFDZk5aenRqenJ0SU1GM0FUeDBUYmIwMGIxV3Vh?=
 =?utf-8?B?Y0VNY2JwTE90K2xqaDBFOTEwdUNVb2NjOTFWbml0NnJHd0N5SUdEUT09?=
X-Exchange-RoutingPolicyChecked: KCI6mnSwFVX4LteUPz7wU6eRt48iM4NQmkXwI7IcKGeG+j3z1oSzuYvDkYZh0DOlSBuPgQQBg2prOiKlQ/yXUBKeqTnOv55VQsnBpelfNgRfp4wCiuNet7NyQTSLPMcInYVCq6yLbmVaNR5CR2+Wn8bZlHa2prwI86xeejeEI8aKNhbjgEPHgansrgHDa5S0h13dRfC3sP3nZWg/Q7PCQ7EJnhI1dMmhKZ/OGjlSiPpFw9+CB3ocoEdeXftamsseMkg0wThaMdfE2g1Rl33tYu/m/vURS9JvbIGUkTiUGYoRNGCyvmARFsrora5BPjRR4v1y9drp0PvMyQnAq3JT1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5fe9ff-ddfe-4a3a-2eb4-08debb934c86
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 01:57:25.6049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaeEe1XHLHW/x/DSfalus/6URAOKuqmcnSSkV3O+tcQTVSZGzTulrebWlrsym10BWomrjxvOpJ1WcchAB4fkIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9452
X-OriginatorOrg: intel.com

Hi Reinette,

On 5/26/2026 11:25 PM, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 5/25/26 4:59 AM, Chen, Yu C wrote:
>> Hi Ilpo,
>>
>> On 5/25/2026 6:01 PM, Ilpo Järvinen wrote:
>>> On Sat, 23 May 2026, Chen Yu wrote:
>>>
>>>> The shareable_bits indicates which cache portions might be shared with
>>>> other agents (e.g., GPU, other I/O devices). On some platforms, all L3
>>>> cache ways are marked as potentially shared.
>>>>
>>>> The L3_CAT test should fall back to using the full CBM mask when no
>>>> exclusive portion exists, since the test logic (writing different
>>>> schemata and measuring cache misses) still works. The shareable mask
> 
> How do you define "still works"? Allowing more interference will impact the
> number of cache misses that is used to determine effectiveness of cache
> allocation, no?
> 
>>>> is a hint about potential interference, not a hard exclusion.
>>>>
>>>> Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>
>>>> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
>>>> ---
>>>>    tools/testing/selftests/resctrl/cat_test.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
>>>> index f00b622c1460..b6994ba4504b 100644
>>>> --- a/tools/testing/selftests/resctrl/cat_test.c
>>>> +++ b/tools/testing/selftests/resctrl/cat_test.c
>>>> @@ -248,7 +248,7 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
>>>>        /* Get the largest contiguous exclusive portion of the cache */
>>>>        ret = get_mask_no_shareable(test->resource, &long_mask);
>>>>        if (ret)
>>>> -        return ret;
>>>> +        long_mask = full_cache_mask;
>>>
>>> Wouldn't it warrant to log something when the fallback occurs? It
>>> certainly looks something that makes the results less reliable (so it
>>> would be nice to know about it when looking at the test results).
>>>
>>
>> Got it. Let me add the following message:
>> ksft_print_msg("No exclusive cache portion found, fall back to full cache mask\n");
> 
> Allowing more interference will cause the test to fail while the system behaves correctly.
> This log message may help a knowledgeable user running the test manually but I expect would
> be confusing to folks not familiar with resctrl and definitely does not help test automation
> that just looks for the pass/fail.
> 
> The test can be fixed by skipping the test, instead of failing, if there are no bits
> available for the test to run as intended. Of course, this will prevent CAT mechanics to
> be tested on this platform so to test CAT on this platform there is a need a new functional
> test since a performance test is not appropriate.
> 

Got it.

My thinking was that shareable_bits only describes portions that may
be shared with non-CPU agents, and on an otherwise idle test system
the CAT miss-rate trend can still be observed even if all ways are
marked shareable. But I agree that this is not a good assumption for
kselftest pass/fail.

So I agree that falling back to the full CBM is not the right fix for
this test. I will change the patch to skip L3_CAT when no exclusive
cache portion is available, with a message explaining that the performance
test cannot run reliably because all cache portions are shareable.

For platforms where all cache ways are marked shareable, do you think
providing a extra parameter to ask cat_test to "ignore" the share
restriction is acceptable?

thanks,
Chenyu

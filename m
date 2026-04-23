Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29910386557;
	Thu, 23 Apr 2026 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971466; cv=fail; b=jAm2HoIfSxfKGIcajJbiSeGOIWF4oNXs+cYPd7sg/mvPmmdz6Bt5214U7hEuaKKXpBDYQLl6LE0v0K0MByCnTQzH6waSFrGTY7YgoChCx5DW2ZaQ43zGPFgDtrCAhwX0ekwV4idoUrJ9VAxc+1sw1HwKGnxC6aALKMoByBQZt90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971466; c=relaxed/simple;
	bh=yemhZBPL9MnDgTkokIeNoy0YT+hc/h3OB+py+IhENZQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qf+P/b9FIIOEdhMWnGfTqTb7tsvAuAPzpThlqegnSezivdUOocALAWcvVYZvGprNSqaTaUa1wnev0jCvS20xHopOlDeOhdaPfd+AiTf905k056CZFwauauoHVfbn3W1yM57aQCZeO7rtlLWoId70Nzt2yQvS6H6FF5ylTUu2gSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLgz25He; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLgz25He"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776971461; x=1808507461;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yemhZBPL9MnDgTkokIeNoy0YT+hc/h3OB+py+IhENZQ=;
  b=BLgz25HeS4dvHtQXbUP+uu+8l34TNbrAHwfSXjuzTCtraoTuD2RJTUae
   qLJPdJ1qWShNQuiG/hI0oCDb32Owi27ah6WbMwwRZ+kPfJquW9BwMzTNh
   hsBFdaGCV9cgGuHzhTKsMIyyUKH6abcYzAyW4Ki5tjdHLGOAfYaLNx39+
   AFgQl8KdW68nh+3i9rG1cd7gxjLV9G6eWL8HvSMyvx4Vl1aXHbFz7/Ie8
   q2CgHZt/SpEt4eIJGjjcWn7dte1XU1y7Rgf22b9sk6sjzdNUDjruRxN0D
   0UVltPktnFj1LeaZwg5oGjStARvtFKU9kDz4v9Cet7fdseH83Ord4z/cL
   Q==;
X-CSE-ConnectionGUID: QpqbBZNyS6GQrslzbnGEBQ==
X-CSE-MsgGUID: cMDM8hOfQsCo3O8GzfhcbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89032294"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="89032294"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 12:11:00 -0700
X-CSE-ConnectionGUID: MxOQxsPRSkKnV4H3uIl3/Q==
X-CSE-MsgGUID: bjJbBk82RMaXCH/IWtU95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="233051245"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 12:11:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 12:10:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 12:10:59 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.36)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 12:10:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nenjF2PVzfcj675WlIeSz1hL9OA7b4lB1o1bSmNubljUm7oy/viux/PR0+L9x9b4Lps/UdX4/ekJRBivwYCqNFKJRqPPA6Wfjp2ncG19uk8pePZCo7MtUYbn2E9QWszOrCL3KaP3VkR9Ma+WB+3czBrwl3bIzNcAIQCCSeX0nxqR4HiqVKYXjMlq2/lNcRbR/WROj0clkSykxcQYjzxIZtb9kOEKUOVZ37ZR8X9/cskwVn9yi0I+A7FOr2MzcY1eU7SqqakIB6N6rvSzrWX5qxbQos4FhmoczGyCa9PY0cZO6NZEZZyiFaTph8o16Sfq91/zmKeEW/FAxaUfPr6KMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDJHJHmNrKFE0mB4XcNbBpyGnEifagrihb6DkiMHGPM=;
 b=fEfzMls0JwU8fEhfHWE7Fl6HByZbSd8Ls4atgo3BnzUbf5XDxfA7fISa4BIWObop7T0+4DDhWyUxz/tDFPXo7zT9YstZixji2I6BhBnvRyN8vrZ0Yrl/secGUgfnMyBe3XlXYYc/x+hSWM8J+mdKePJBriuklsCv4S4aPr498838x4YwqnZtpTrApGGjWgmT1Udp8K0hNvjcuuHewBbnXDKDCrurqGj+7X42QTufXMjO0U6zspP3FsGzlkQGRhuCQu8puQjMr8I5D9QhQ0rRUpWKOOrPMZ2kKR2ku/FrK7SPjqm9wSnjBu/dGYm3zjNvmaHfltmKpH0O/DH9kPUFnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3288.namprd11.prod.outlook.com (2603:10b6:a03:7e::33)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 19:10:55 +0000
Received: from BYAPR11MB3288.namprd11.prod.outlook.com
 ([fe80::e3e3:c791:111:6904]) by BYAPR11MB3288.namprd11.prod.outlook.com
 ([fe80::e3e3:c791:111:6904%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 19:10:54 +0000
Date: Thu, 23 Apr 2026 21:10:16 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
CC: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "justinstitt@google.com"
	<justinstitt@google.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "morbo@google.com" <morbo@google.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "xin@zytor.com" <xin@zytor.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "oleg@redhat.com" <oleg@redhat.com>,
	"hou, wenlong" <houwenlong.hwl@antgroup.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "m.wieczorretman@pm.me" <m.wieczorretman@pm.me>,
	"peterz@infradead.org" <peterz@infradead.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "bp@alien8.de"
	<bp@alien8.de>, "ljs@kernel.org" <ljs@kernel.org>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "jgross@suse.com" <jgross@suse.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "Mehta, Sohil"
	<sohil.mehta@intel.com>
Subject: Re: [PATCH v6 1/3] x86/process: Shorten the LAM tag width
Message-ID: <aepo-p27DTkfv7tp@wieczorr-mobl1.localdomain>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
 <79720f2640839b15f22e3618136b084cb376456b.1775813245.git.m.wieczorretman@pm.me>
 <8bc4ff4b7491c6fea6e17583a6fa249961c08275.camel@intel.com>
 <aemzYE5td11cWydN@wieczorr-mobl1.localdomain>
 <9SMcunyTlDhM7RmqVxv1D6_-EFNAkpMDrOeGldomGlyOaM9JuGJz3Uk0Csp8zLqss6xQCL6OCrrXeGQkUnRkTQ==@protonmail.internalid>
 <9ef71635a84720f22290699d9f0606e1736b7638.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ef71635a84720f22290699d9f0606e1736b7638.camel@intel.com>
X-ClientProxiedBy: DUZP191CA0034.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::11) To BYAPR11MB3288.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::33)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3288:EE_|MN0PR11MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c08955-bc5b-4afe-b0fa-08dea16c0aa0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: NaVnJvDVLdpCfNR6HnUb7c2HZhykmnl0M6yoR5+IENog76qW7uYnYD8BG+QEJmnL4kBcWxhh4hgNdcx61ZXBuRgOd+WnOvRLB4MQRMKBo99Jm8q8tBD8ASkp/GQd9mBJc3YX16nJoEDA9efD1K5GTdVDtXsCx3Os/Qq2ycYpKclVSMdK21xqyqeVOLOoiTIA6/SuyDC03M8pcv7DV/GnTfFluoHPN6q3A5e5bZ9R8XDuu3WYcYVSykNkodcMrEuWqaon39YcjvxUUVXwkJ6c0fPQ2ouBQam1ePuFmbqx7nbZnHcuU4BvmmsrPASTSO5O59Pn1A7m/ilmn3fsys7UlADSp1tpInDqHGm94XLOl8wYwx0sRV7tqIXHzinriU34VmAxXLLMl/owFR0RrgXhukn9oZqQsdjuNzF25MbGnkzgAFptttP7+85AtryS2rRqgHEXwIFYSih/v/H05P47qB3yupUJ5YvWDxhx7zbRabatmglKJb4x6nBAe2opZASD25/QbWw1s9TzBNzQ8qDy6AuukLR8JitjdWB2zsoxqDmAM3M51VR7otOQ2AZms5t4qXzb1lmS/bcfd9TBoqFlUlHpyfo/cgrBCqBui138rbSvSMoiWTLdzr+Zx8LQwRar8zHYlmY/PXsyAPZjztgd3DrT378S1D86ulPlBr2rlDivwZKxQdzt1aSXv/47IsKmQNuvav/P+4I9L7Iw1qMdZZPUBS8NTmIyO+AH5vHTk5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3288.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?S9hsGjZ2GOS1lGl2vUeneTO6aeZtTlyMPVnDdOcLTKEmKGPvi2teNIeWbE?=
 =?iso-8859-1?Q?61GB5KvTu0ZrlTVKR9DJ2LEpwVCxcItJDaDk1m6f3IB9tnY+FA8EzepRKx?=
 =?iso-8859-1?Q?uerK3K0B/BmA9G/0ZzLKnL+6ydfazdEKjf6begOFP7zukGvVf+ENUrAK8q?=
 =?iso-8859-1?Q?LQVZWjt5td4toVuQBnSBRGyw9Gjw61BQXp3zaOkHZtbPfDWbSYGZrC9xsF?=
 =?iso-8859-1?Q?lT3GFahmCYBnm0uwI7Cfg4tJsxPbEGGbe4mrb4whn75UPmMtXs6tbUSlkv?=
 =?iso-8859-1?Q?LWQZkxcuBMqc8sHqY0Kp0fEMvmtBY6MNkXBUZxWC803Lxm8J4vZMq8wUn4?=
 =?iso-8859-1?Q?YMKwdTqCxQrX/UkVWsiIc23VNrunmQmUfGLOpXV/lFSGrgsJ9UYQsl60FX?=
 =?iso-8859-1?Q?dCLEazPsZkVcPziBml3r8orMTVBmB7RINFHu4scfbH4iz+slnXsmQvsRXQ?=
 =?iso-8859-1?Q?Or0Hfhn8bxSAaNcHDT+vKP7FsCRNVMLzA+avnfuE7Q2KT7wDqEEMdk0iNw?=
 =?iso-8859-1?Q?jsTdwmNVjIdCOG/iUj4ZwfBaP39EZ5Z9MJKgcKhy9ic7M7+2V2SOfvNZge?=
 =?iso-8859-1?Q?g3gUslAewfcyshxjJOT9ohB5GhpjWtds3EOHcn6Ce13zTcfxrg2H5dtMC0?=
 =?iso-8859-1?Q?Oa8eZuzKe9etoffrW3POYupToAK9mJUCqD3MTFRLnrnDWgZNP2Fgzy4DJH?=
 =?iso-8859-1?Q?cNRGqYiKKS/ALCtsHSnDURCLfvUK/fLR3tNmTYXJ5A9tfJtsbsIitKTZ42?=
 =?iso-8859-1?Q?k9cKS7XWhr94rUWgl2EMP0fb7TEnFqGUGoElVrKcZGW4LldR9hYtolJ0xn?=
 =?iso-8859-1?Q?FuvODTFdMUSRdoMztQ3PMwTEPQ6TgB2R6vIRm4O3Js3g0G+Swnq+HpRtgW?=
 =?iso-8859-1?Q?lxuxrt9bo74pJ5wO8HzNo17Dme61lIttZY10sGQ4HtqW9eZTW8kIZJl5xc?=
 =?iso-8859-1?Q?OGE6ird3dSzFvJEdEcdWV3AdicNPINpSweMZmCi5K3HPElRJ3jHjfAihNp?=
 =?iso-8859-1?Q?FKWLfxAAifAsCdj6+0mZp5U/OOG4CWvUpjFMPzypj5BzgsW74FZmHVIAzW?=
 =?iso-8859-1?Q?uPeg98uDy13BVVZHTN9+gqslzML63i/ltTi+x0gdVrHJSVSvHnKbdAG5pU?=
 =?iso-8859-1?Q?9miFu7BUvXgBzYrqV44gMDNwuZ+Hc8X7cpVXY2ZC6Iil9nkn/Kr8uCS7SX?=
 =?iso-8859-1?Q?I926+/0xx47g965icb+gIHNBQsXpHdmADNK9EZODa0+jLWfPQobcNZrd0+?=
 =?iso-8859-1?Q?fUC7d0lP/c1n/vVBexaphqU5c9qE0LcL9XQOay6lqnsKv7OonuQYpz7MNX?=
 =?iso-8859-1?Q?nI5Tr0snkrIhTf7GW2na6CJ5tsXpBHomtK5XXsch5dIz6b277St5Fy9yoH?=
 =?iso-8859-1?Q?OXQxG8qpLlq/LSrcbzlH3h4mn3VryaRFTmmfNtd9IvUwyO9vaCHnAz0CS2?=
 =?iso-8859-1?Q?Hk06aFg0hXK3VRygbtutupcfo47THOYRZJIp6u99SyVu99Okc9z3Gq0ZsK?=
 =?iso-8859-1?Q?SfttjwDDn/zIMUcniHPcDBGEenUwPtgIT38SGGBHek3BEj2PvYvgUmFC+2?=
 =?iso-8859-1?Q?d8MZ5d0csoKdF+OvZueMEqKR/QFvGwYnFfpedTK+JDqT3LgllCMzM1YZ3W?=
 =?iso-8859-1?Q?0fHYkWlpdAs1YvdcKpEqydgHQKJGZEWApJXT0v9A3+sMmQZlu1HmzBPIUM?=
 =?iso-8859-1?Q?RiKv+tUZTl42I1y2LJKwAwx3h54YkMgsQdvHfXoNhXxo/08LnJkxw63AvJ?=
 =?iso-8859-1?Q?JbvDSBdMDBMxzhyI206O0pIdhiq+UHcIXyuQ92tDTd5/0EGXIjfPCZpRFI?=
 =?iso-8859-1?Q?qmrx29wAX9uwVYASlbcH9bqfvm7Fe4aBGMZaIdPL2h4hzeh2uKj5?=
X-Exchange-RoutingPolicyChecked: uDH1tRb5qvfObRju2FExawmj8kG45Zl63//xf1Iued8lMTr8ACOszGvY4N3H0pyoREc5K61/RVrIFXrTNK/RT02yjXZBoJecT1cImwzf7YlhLfYEyYeRao23UO+ZlcH+lIhrOYAJEO/2MDPohnzq5qcsmGWntQ/wXMLgrAc9cizCe4akxhuLhMtpOqrv0IW+O6xGS4O3NHbH9A1pe8+xnb9aYKMi7/fLV8aM9H/XQn1+V6NAEoLeW5cBke8cajObsbtTBTxRn4JOazsIV8nJFga0kyDaY94+MALgd+01I2Y7nKnAqOUu94QSgovy3Lznxb7ObsX4iNaJnmEc8r5V9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c08955-bc5b-4afe-b0fa-08dea16c0aa0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3288.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 19:10:54.8117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +y0g2p56VJBJkpdUftwcKVBYVJsvpR8UoR0gyWu+82nX4oXNRiaQFT0eMddNu7GLV2lGUJesVD4PQ8sfyAwGSjPenSAKCoJqt0dvznjLSOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
X-OriginatorOrg: intel.com

On 2026-04-23 at 18:07:57 +0000, Edgecombe, Rick P wrote:
>On Thu, 2026-04-23 at 10:09 +0200, Maciej Wieczor-Retman wrote:
>>
>> > If so, then there will be a difference between userspace accesses to a
>> > pointer and the kernel's handling of a user pointer (mmap(), gup, etc). I
>> > don't know that it is unsafe, but have you thought through the implications?
>> > Besides that though it's a weird ABI.
>>
>
>For LAM (forgetting about chktag for a second), I see three things that are
>linked today:
>1. What gets communicated to userspace about which bits will actually be ignored
>2. What bits the HW actually will ignore.
>3. Which bits that the kernel will strip in all of the places where it processes
>   userspace addresses.
>
>Yea, I guess I think they should stay linked.
>
>If 1 doesn't match 2, userspace will have trouble understanding what is going
>on. GDB, etc will not be able to make sense of things.
>
>If 2 doesn't match 3, that is what I was calling the weird ABI. I don't know
>about security issues, but it seems confusing to keep track of at least too, for
>the purpose of making sure the wrong memory doesn't get accesses.
>
>> Do you think leaving the untag_mask as it was (bits 62:57) while advertising
>> that 4 bits are available would be better? The untag_mask would be more inline
>> with what the hardware is doing currently while ABI would promise to long term
>> only stick by the 4-bit tags.
>
>Some properly coded thing that does this?
>
>diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
>index 08e72f4298701..a01f935872348 100644
>--- a/arch/x86/kernel/process_64.c
>+++ b/arch/x86/kernel/process_64.c
>@@ -965,7 +965,7 @@ long do_arch_prctl_64(struct task_struct *task, int option,
>unsigned long arg2)
>                if (!cpu_feature_enabled(X86_FEATURE_LAM))
>                        return put_user(0, (unsigned long __user *)arg2);
>                else
>-                       return put_user(LAM_U57_BITS, (unsigned long __user
>*)arg2);
>+                       return put_user(4, (unsigned long __user *)arg2);
> #endif
>        case ARCH_SHSTK_ENABLE:
>        case ARCH_SHSTK_DISABLE:
>
>I think it meets my (suggested) goals above. It is weird to hear that the max is
>4, and then ask for 4 and get 6. But I guess it's not going to break anything?

Yeah, I think this should be the simplest way to not cause any problems. I
suppose the returned tag-mask (ARCH_GET_UNTAG_MASK) should also report [60:57]
while keeping the current [62:57] in the untag_mask variable?

But I'm not sure about keeping the bare numbers, maybe the expected user
constants should be as is now in the patchset? LAM_TAG_BITS and LAM_UNTAG_MASK.
LAM_TAG_BITS is only used for returning to userspace so no need to change or add
anything, for the untag_mask we can leave it as is I think, with ~GENMASK(62,
57). And then we could match these defines in the selftest as is now (naming
for easier keeping the values in sync).

-- 
Kind regards
Maciej Wieczór-Retman

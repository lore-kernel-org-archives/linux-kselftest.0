Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B653391835;
	Wed, 22 Apr 2026 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776880457; cv=fail; b=eJnkvubEHDp9mTKN+JItMFsPaHu4//SRoNulkgs5Bl2awHfTnRtwUyi2y+Kw/cXndh9/6NFde8Lnn2TQbbBy5AQ1E7BNuH3atlbyFR0aEs/7urqRh6ihEh/RWgK8hveVEl4hYQJyiLHTRuVeVOtNC+2uBRW4Adh1cS4lBSJ36fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776880457; c=relaxed/simple;
	bh=zvTHGncBxBvXalopfN9AFN8WVeyt0yrDoM3i01jRsEE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bq5fR+IBYkS0BbPKihsplKsXr0xE49/LQ/ir3QEAhHfJDJC9FT6CGhjQVO6HRcWOUnloZRyX34M2adgALT5AWkPp9XkkYIHf30Y9zi4RMROcJDzyGbKkOT1CqY4TSsVd4s0QOfsnLt2Lqj+jcTkezjOpT1G7EFD6FyZYmstn3Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ynfa9e7Q; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ynfa9e7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776880455; x=1808416455;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zvTHGncBxBvXalopfN9AFN8WVeyt0yrDoM3i01jRsEE=;
  b=Ynfa9e7QCo7LJGIvadB2iW6MWGNxodu+6KpXuWuZ4sQOsIBQNgXAi3fz
   zAwW/rEyviEsWhgS/oJ1641fttzuDXysPP6ePtB7xk2kJu6y5ymZCQ5vU
   raNHrii7+HUXf8HT9YGzwA06W7hZlGlI+mGOwvwHCcA4D7Q796I5x4y4u
   i2nS1/67ZMIkk2TvvITOJpFXvzDbdeWtxR7vwh4sUrmKpSGOeSgwMidaz
   rirWksk+rHiWNyuMXCQSlVrGkpuA6GQsA1LqAoPvoUiw02vDlw0ReZXzk
   mU9KTd4RwF+5NZLGN5DOnktgdQgSV1bEJdX1HaZFstYrJWYVS5tnhozKK
   w==;
X-CSE-ConnectionGUID: kV8zuhYDTNWCB6Va/9f38Q==
X-CSE-MsgGUID: TLCY3MU5Q1+xAR0OO+Opkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88145725"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="88145725"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 10:54:14 -0700
X-CSE-ConnectionGUID: qO3iAe89ShCt6yAfQqq8dQ==
X-CSE-MsgGUID: /WdFEdBCROaSoYfQdvwkmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="262807188"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 10:54:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 10:54:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 10:54:13 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 10:54:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYfMWvCL+fILUg1W5YaowLyNY+w833EPN+8K62h96A+Xtj+YSkREm94HJwBcd4lvZSzL/rtc1Gnhvuk9Yz0b5O6gBh6hQOuT7gdJiuYJUFujUesoTn2Z3l1ox77DMWEAqV4yeGACC1g3xqEVpJIrKo6t8OPJqHqo7+8YzWoQttpvPFc9HdGtSoPBWftbTheGhzC6QjRLpInccAFwtwcy1a0KJT4wIXWyp5+KovtTaVTzrU2aGHCzQr9X+DlsI/Z/sLajknyg0fua718MOJQ8cFOiaDADA9DQZGw90EhZqRj1N6+v8/5TORj4Tnk0GlobTZ4yFidjgUvw93eovf7KzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvFMlDQDOJIjIADB8rUj4r+2XkCkkxjtPqcGhLs7UAc=;
 b=nbqyWMJrcsqFZ5r5EEVFWycrCLYb6y6Eqa/aEg6TJBTGcyQmkVKb9QKErzIoxHPxB9j+gMn82efgTsxaj3bYwoxmsMd4t+7WyWnYOZkvBhcyGoBsNM6PRXmEzPf8JO3DXWDf03ImoN5CnbIl5dPpOUOXMlG1DDLkzNC13CjK4c+SAyeRrZTl1PluNerVEIs32cC7IjnhNonwzIesonn+K6OoW+0kPP87nTCTtiDM/qJq3addKNn3kWw1se50Lvfj1Vz2ggdmZ46SOa7/waozG6Y10KLD52AuV828CyLNjBTSVNN23cLIT8OfTeelDGWv6XhsI+HTMn6yasexv9R3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by SN7PR11MB7137.namprd11.prod.outlook.com (2603:10b6:806:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 17:54:08 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%4]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 17:54:08 +0000
Date: Wed, 22 Apr 2026 19:53:37 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Sohil Mehta <sohil.mehta@intel.com>
CC: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, <peterz@infradead.org>,
	<ryan.roberts@arm.com>, <ilpo.jarvinen@linux.intel.com>, <jgross@suse.com>,
	<morbo@google.com>, <mingo@redhat.com>, <ljs@kernel.org>,
	<nathan@kernel.org>, <shuah@kernel.org>, <akpm@linux-foundation.org>,
	<james.morse@arm.com>, <oleg@redhat.com>, <houwenlong.hwl@antgroup.com>,
	<xin@zytor.com>, <justinstitt@google.com>, <seanjc@google.com>,
	<hpa@zytor.com>, <perry.yuan@amd.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tglx@kernel.org>,
	<nick.desaulniers+lkml@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <llvm@lists.linux.dev>, <x86@kernel.org>
Subject: Re: [PATCH v6 1/3] x86/process: Shorten the LAM tag width
Message-ID: <aekHByJW4y4Bvqsz@wieczorr-mobl1.localdomain>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
 <79720f2640839b15f22e3618136b084cb376456b.1775813245.git.m.wieczorretman@pm.me>
 <05hBDMNpU9b1xxnZOxl2Np1nqJ8XmhyBn755ppv5nXMcit21g86_YUiJ1JSib2ahCPtVnZwE1FeBuCtC57krtA==@protonmail.internalid>
 <e12c21c4-8de5-476d-b1ab-8bee4c1aedb5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e12c21c4-8de5-476d-b1ab-8bee4c1aedb5@intel.com>
X-ClientProxiedBy: DU2P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::16) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|SN7PR11MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 1990e572-3f54-432d-f444-08dea09826dd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uypzry3IsczxligtE83cyjgWvNbVL3f9F4pMax7aM9BI3L3ldM+s56KHQV+WwvCX0U/BwMxHZxFH5BELCN1OjqCtlUQTHPK8PGdfE3USy16mCENkZBNUTSnyC/V0HujOMoWJ148UGTy88idWmL/xIfNvqUKp9U7brdSIGcRYp38TwlFHsmgUNCJ1CzWBA5Hx0XuTGkfRP1WRB08pJtLEsOoSkINI9sXujZ7vf/nuyce5Ehh41yrTb4Viv9zEXC/U9VRJoYZ8IdSi7aChuO/nMRrk7Or4h6LuDyyURmbbK9PFqrCfTC5kgFzYAEzC/n9D8gHKEv3YSxxVrREj18Lctln8gCeNA7bOieLoOMGETBuGWOnM9hH2KBdKFALETrvRzR6W3Cqa52NhvJ7tzp8mQWFk3yYtM49vUf7xhbzJLFr7yFo7ohDf3K++9fdlvY6sB3VdYVaaNWgXh9fLDqkr4oJ+T61yiBU0vts2KSmZi3wtcGbtEE7Oy9BT1OvbcTeq4wgouK4nAax18LYxOoDqn1whqGvQCfbZq5SfpCZ8rUzRvMH/bklYOzYesYcHcUR7waB72coVR9s0gDfTqrS6LsWdZ2fOqBPVdTf/fASKBAe+KGeFyhbmEdg5+1AomV13it+yA7klI54WHKUjTSzcq1e1j+9TeFcUCzDj2B0MKwiFR6fEbe4423z4nex3qHcS0NZJFtQbP8hc52jCLi40kGmbabGAAe/tJQ88NJW1Bm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yhLSEWksHv9y6Dxq5thkA9ZKtOyN8GMPiFIkmp32/EIiFUmw+LY2QPgXdl?=
 =?iso-8859-1?Q?XrlpzzCC5iDDftm1iRDjN03SDqInxGo4Y0pv+gb3Yi+6iMvaQuT6zsW+F0?=
 =?iso-8859-1?Q?aDYvewuEiF1c3P/uH0f+IQnZXiQKCNxqnZFC0vCzH9sqqWbkPm16ac1u7f?=
 =?iso-8859-1?Q?Oq424ycjqwKL35kmiCoFa8aWfjMl50WrT7zvre7a+VfQvQCW7LtSNYP3W2?=
 =?iso-8859-1?Q?FtJXGMFipmKcwLYLQoMx0mauG8KOr4DWZXLrZdCQMXXwQe/rj2r0pfsv5f?=
 =?iso-8859-1?Q?JayNuvy4V6x1fkCi9DuXQd/FKS01mUf3IO3AOsCtLVAROum5t1RkIAeb1v?=
 =?iso-8859-1?Q?tTe5HqF85y8BhxOC5S/rYHST2BWtwHlUo775FtGMc9LejovQCuN9wSlBGK?=
 =?iso-8859-1?Q?ZUYjdbDZYaB2nTKQOyG5BLoSwn55ZcH2geKWR6v/ZVkWkDRTicR5o+T/LD?=
 =?iso-8859-1?Q?9Sf9UWdKUKaSSx+onfG557PcJc93ykJeFkk5ZHkmUAozZmPXeNrolzVtkj?=
 =?iso-8859-1?Q?3dx6WZzQ0qHpH66xMkuq2/Yhb7jWvcfMbAiIXJdwhL7ELKPVEjfNUitW2D?=
 =?iso-8859-1?Q?JI5W1fvEgij1k+4Pi27AZyRqGIbL7QJZUw7miXv77gBBJtg7NwpiOAP6hO?=
 =?iso-8859-1?Q?TAmXcZU1fmMr1dv8k5qx21xrPXpJkrDwi8NhTBkYs6ps/TbKGLs5ROkWXl?=
 =?iso-8859-1?Q?f3/QX1Gf/e0C4/PR1vl9wKpnTFu8fEjU3Lk3R6LRTFpEYUlfi9GLkGuNyN?=
 =?iso-8859-1?Q?5RYvosV6ANXRMTt/amLVuDRZAvJsUSviv1FEDTI4m5rvF+NxdgqNLtSjzO?=
 =?iso-8859-1?Q?D6mPdHA/74V+xMRMNg50SxUiK/NdXwCrBxMEBSmz+i4CgSzAxauW4mYCSc?=
 =?iso-8859-1?Q?lEUyHCmA23qmBNUMQmzoadago8Nd1HOBw3rXFGo33NBbiIGd1Beng4wymV?=
 =?iso-8859-1?Q?NDBzeUnBzB4u8+wnJ1hGXrNgvh+RK4f+zjUIsJeA9nm9Mre/AppTe+DH2v?=
 =?iso-8859-1?Q?BnWT2aX3keasRwu2TXBTGM95ZZ8kHYLkEHHYdQuqjrLovT+2oCIqeC5tK9?=
 =?iso-8859-1?Q?+LoCj/F8MaVe0S1qi+15xHZ/Sk1dx6zDupEEf63802kir8hGWKJcjzF1NB?=
 =?iso-8859-1?Q?73tBLecSZf0p4NGzIdHQ5nBAzzQsQxC0oxixcmhHm6CyAgE+QmBEj1UDYP?=
 =?iso-8859-1?Q?xz9ezfhw237g6dD3Wgy+NkGISe0VCWNm9Hjnk1GIlgUTVij+hjc9Phy4il?=
 =?iso-8859-1?Q?UxzjCrue/ULOncdbSbXfu8gRN0s03zj7jimBJoUBaGtxPDfRXetMafh/8c?=
 =?iso-8859-1?Q?bhXCTYtI4cOvvOh6pDyZbgZubbskecoYyEk0gzxICazZg6FEua4FHRnqMF?=
 =?iso-8859-1?Q?m7j/N9WceHqAtIv/kJBHeYASzV0R+7ovVVsElAqX+XLt+FNl4FqAZgqCLZ?=
 =?iso-8859-1?Q?bHv+cUonnZa/2t4xYZ3VLb137x5qACS8IqaXo6r3TGf3UzJ/XMcFS30gIB?=
 =?iso-8859-1?Q?13MUIw/6eewv99PQ92Wh3zmSd8yn48fNSEhzGS84KAvwgrLn7jksTWVjvq?=
 =?iso-8859-1?Q?XPhlLpFzwzD+9ZPFDP5dhFJqqLB9S/lqjlNsl6Vf0KVEUgVxpRs2alq8VX?=
 =?iso-8859-1?Q?wTplT+KddG4jy/q5ZwAXiFOImykfPCUhqpW3OsJS1/PGVcK3XBWGbrbK09?=
 =?iso-8859-1?Q?1XNvAI8h0EazbnZ7S8Gx+IeJKG7kL9fIV4PmVqEohnM4GMRkR4DqfkYz2y?=
 =?iso-8859-1?Q?NtLNL6wH8R8wV0neZonzHLk4rP2X8WGVkLHtcWadCowzzdZexFJ1anMN5/?=
 =?iso-8859-1?Q?kiETQYuLVLb+AniHYX9rjfyRcTPiHv3cAkoFJ4N2CmzwSbHVTU9N?=
X-Exchange-RoutingPolicyChecked: F2bnqjkxfLGkXoGjQjEPWfIvMCi+8gmdwJ66aRPOY/Mb+gCnNvESW7A1X1uxNpx4WPRIqtP0Zhu7poVOMrAkaaTQsuS9O8cO0bnckkYgjfTfG8HxBF0Id4z3GnqhC0FLI4tikO60ckOyDuAiNhDNpQ+ovI8FIprkhzJxdrTQUw0xZhphyPGDe3DlgRHqnO1OEcsSpZs+giYOxnTBg9dp01UcBCj3YrYrzcjQQPT0gyHwy4yHsmTRl6VktcQ96Vvoj9COMwQX0Vxw5xZAg8GQEKMaDdGFpZ7bphlH7walceoUopCGmiSK3hWbODIC4JqcN46q4Qzyo4P2loy+Mb015Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1990e572-3f54-432d-f444-08dea09826dd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 17:54:08.3481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rO2NniAujKzisBf1A8kFhKs85mL0xb60Bo/t7/VCj2C6powiRFQ1e8z2/Eq5N0u2h2rP2F1+0IKLr/6c1pDtmsdDbESC9BWJ5JxRf0hNWyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
X-OriginatorOrg: intel.com

On 2026-04-22 at 10:24:19 -0700, Sohil Mehta wrote:
>On 4/10/2026 2:55 AM, Maciej Wieczor-Retman wrote:
>> diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
>> index 08e72f429870..d6f8e71156cd 100644
>> --- a/arch/x86/kernel/process_64.c
>> +++ b/arch/x86/kernel/process_64.c
>> @@ -797,7 +797,10 @@ static long prctl_map_vdso(const struct vdso_image *image, unsigned long addr)
>>
>>  #ifdef CONFIG_ADDRESS_MASKING
>>
>> -#define LAM_U57_BITS 6
>> +#define LAM_TAG_BITS	4
>
>This makes sense as the tag width would be fixed at 4.
>
>> +#define LAM_LS_BIT	57
>> +#define LAM_MS_BIT	(LAM_LS_BIT + LAM_TAG_BITS - 1) /* 60 */
>> +#define LAM_UNTAG_MASK	~GENMASK(LAM_MS_BIT, LAM_LS_BIT)
>>
>
>This seems overkill. What we essentially need is 4 bits starting from
>bit 57. GENMASK is the right macro for that, but it doesn't need these
>extra argument macros and tail comments.
>
>I think using direct numbers with a simple comment on top would be
>better. How about something like?
>
>/* Must use the 4 lower bits from the LAM_U57 tag bits 62:57 */
>#define LAM_UNTAG_MASK	~GENMASK(60, 57)

Perhaps this is for the best. I was trying to keep some aspect of variability
here but there doesn't seem to be a point in doing that anymore. Thanks, I'll
get rid of these bit definitions.

>You can probably add some explanation in the commit log about why only
>the lower bits can be used.
>
>>  static void enable_lam_func(void *__mm)
>>  {
>> @@ -814,7 +817,7 @@ static void enable_lam_func(void *__mm)
>>  static void mm_enable_lam(struct mm_struct *mm)
>>  {
>>  	mm->context.lam_cr3_mask = X86_CR3_LAM_U57;
>> -	mm->context.untag_mask =  ~GENMASK(62, 57);
>> +	mm->context.untag_mask = LAM_UNTAG_MASK;
>>
>
>
>Other than that,
>
>Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

-- 
Kind regards
Maciej Wieczór-Retman

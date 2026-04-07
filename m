Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0C2857C7;
	Tue,  7 Apr 2026 20:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775592415; cv=fail; b=LMha7yRDj4t0HZScUoxeKfEgbwX9poj8CIaIqy5bnHITfIQdExe6wO5t9WruSUhZ8GeqSr958B1j2dtymzPGQXR7nHwfbbZtUDowkkdUvo5P5oGJuRn54Y6FQ0hocTguJEauQ2gSm2w2laaRy2Ft8xnbqQ8CPsVwAFxtmUOrPDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775592415; c=relaxed/simple;
	bh=A5J2gZAkY4iiHBzBL9LjqDzP10yh2cZTn7tAxiDUnjs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H2rv89FhfD+4sGFUVyjc6mQqqecku3UfYJ5iPuQixJVdFKT6PAWqhJcQf0tnuvoQtHSLnMM1E2nmUutpgP+xGk/F31s/VVctYK4KMMGRwzBs+nKwjTc6T/EfNMn0adV93/LsZDgUzXb03Oi+DhC1fOjg+LLlXCfvf6G8aotM2ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jzilss6A; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jzilss6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775592414; x=1807128414;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A5J2gZAkY4iiHBzBL9LjqDzP10yh2cZTn7tAxiDUnjs=;
  b=Jzilss6AnDWYC71xQxorZCyIP2g8j5S8xd6QquqZg8fqloZsXkAoOUZE
   fccrgTlI/Q5h9kzAjPus8m8Jr/Uo49DkcPYWv+gKNf7IE957xHX7OsoaG
   MRcXWimX53GNXQGUQflYc3vJB/FawDhN6Iw9CbIuz4tYEfcHODTNHhU+R
   7mbOnPTe0NczGW+z6BksDDgeBYpgb5PZovxNYL4EYutieAUqXfA+EPSQQ
   Ki1oQJBMO4Np8x8RW18VOhKAzc5bKPavIVO4s2W8b1HqDMjQ7+VDsXjbk
   yeGM2TFy4lNsxWDTFefc/mXYrnsfRmItykXik6H5toM6IMmwZwEoVSRYM
   g==;
X-CSE-ConnectionGUID: z2f15ePNRs+MCu+r5zo7xQ==
X-CSE-MsgGUID: YHNjbpgkRmek/a71l9E8AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87267114"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="87267114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 13:06:53 -0700
X-CSE-ConnectionGUID: dRKYZSyCQJWO62+7z6YEJg==
X-CSE-MsgGUID: XnL0CHSXSr+MP5MA7TSv7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="233229917"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 13:06:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 13:06:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 13:06:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 13:06:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFDwdahU2LkFcG+cL+q/5Z92VWKrFAInuNmDeJO0up770rl4DsH4b00zLjt5leKyzG5HzO5uUbXUA2AmWL6LeH6dPY4NjNDD2wdG+uhZbDn/LjIU2gKUMoXvgDb7ayz/kHXlAI6lzF6n68CQOF45KoqG0dLyAbpXuiX9NeulbY3KzXEhzdaqpbEsOQ4ROe2aNJIeHoV4B4JoFRAuMLR8nRhjbya8xHYCSeHt/3A5/XGlckVi7Y7x9+g3N4qWyt9jA6KLY84bmLUk81GkY/t7VyejV/24QEaUSqQ4d7yVkyb3QDWpZzefniWXpFmxjM46tR6aHjXpJFaQUpnpa8/ZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OqGQBw6L9PmQCDpo59w1J2T2Lr9Ts/rLd+GyvVEPDU=;
 b=NgpPz+1/L1CHtZcRUVaJ19PuvVHE9qNlgRNY2BANpkq6M0RaGvNTpuMVIJM9s2NB4tVXO7OC8YIjj0ocJrFEh5XQlhqohq52Qtyn3VduTXvwgaNrsJYi3PHXSuu7i2h71dSysw49vAiFQ9IXeV3pK9eZu1kH94GjXuGt3fzukkuZ3l6uIth4LQGR3wFC/8yGDrlESu5DPYJtKLzyWAkCecYUxWusLfSsmYNzPr2fpGBg1k0QQa3ByBSr9yJPzDxFxjGDiiosr4MtLUSGwapz7j8PoPLWHYfKr6FF/IBvuhu1YHWJT+8N+yUIuHE8l0c/PI5bcBq1dz5f4TNUbOOaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 20:06:44 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%4]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 20:06:44 +0000
Message-ID: <39edd67c-c718-4005-87b9-f16392fa4841@intel.com>
Date: Tue, 7 Apr 2026 13:06:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] selftests/lam: Add test cases for different LAM
 tag widths
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
	<houwenlong.hwl@antgroup.com>, <dave.hansen@linux.intel.com>,
	<ryan.roberts@arm.com>, <nick.desaulniers+lkml@gmail.com>, <bp@alien8.de>,
	<will@kernel.org>, <maciej.wieczor-retman@intel.com>, <david@kernel.org>,
	<nathan@kernel.org>, <justinstitt@google.com>, <seanjc@google.com>,
	<perry.yuan@amd.com>, <oleg@redhat.com>, <tglx@kernel.org>, <hpa@zytor.com>,
	<james.morse@arm.com>, <mingo@redhat.com>, <akpm@linux-foundation.org>,
	<jgross@suse.com>, <peterz@infradead.org>, <morbo@google.com>,
	<ilpo.jarvinen@linux.intel.com>, <xin@zytor.com>, <shuah@kernel.org>
CC: <x86@kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
References: <cover.1775581451.git.m.wieczorretman@pm.me>
 <91141bc8dc7241b0c77208c743a7e051c782ccef.1775581451.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <91141bc8dc7241b0c77208c743a7e051c782ccef.1775581451.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0053.namprd17.prod.outlook.com
 (2603:10b6:a03:167::30) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|IA1PR11MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e48f1cd-fd8c-4e1b-4e85-08de94e130aa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: SNsUl6RfUhrpQxXJNlrJ4xeSgXJdRe4ps5QXoj+X0zwWAlU+83PzzRnkCPnB03+wZa7OcrH1/0eE4V+JqHV7BnKBBcJ6am3vagDwjvNL3IoemLS9Me+yIx/ACd1KdTYL8fFpBUpmu4qRPh1xWmQTCO4dN2nfOIyQ6AT2ikvQPwYTt63yzUMXHwZSgLvnikfoc+XdzNr98vRzvKD6xdRExOP4+r7sIHCblfHpFBIPKqXlP5Xd0qV1NEQd79rQls3nip6U5vaOnLBkkMD0LzTvhGJacsrU7e/iPxHqAzQ3UQqKk7+i9MjDIHb33T2qQ3ngyQDWoMs8zIfEiV46jNuTB+Q6o44wWzw4Ufhbg/cmZCLzjHaVfT+5YVN0uPLR11+LI7AKxhJz5OeI45BJqQnEP3dam1p0cH9A3GIN0n+USXTxvR1TAX6Pk2qiCZtW8T0U8+zUpUueQP9U1hNPfkWXu4vAhAXeQd4fPYttjeIFsk6DhqwcAUCeKs3XqgE1buRV8RBYnt/odfGHDxQlnTym11ZwPUVRjzXgDjiw+d3jbAAqIomqmJWDGmYlvGGeX8TUYAMtkOaP7kbqPnRk6k89IsIYix4jsTy0RUdoKYLMBNnqwpC4cOaiYQOTHOkNp2/mhJe5IcJgDzeoFVn7/Wrq1JZoVQRJlnNhfakaG8qaEdhMtA+PDIMKMcPAZU/92tfJms0c7G6HAkxqhCkezBrA/fiOAQ/zIe84yDN6gRpLvYApTAnlWmOUuAVUlKfYke1qaITZnqtAavFCNZzVyNS0GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVc1T0ZVYmp4cmd5SUhOak1selBkUm95ODh6QVRucFdWcHhQV2FLK3FYMmMr?=
 =?utf-8?B?TWlHWEU3UkRuL2lXT25ueDNzVy9UTmtZSE5GcHhBQWZ4b05GdHI1dnJyZEF3?=
 =?utf-8?B?SFcxUllxU2NwbTYrUFFZaE1aNUxjcTdsQ3lsK1pSTzh2NVZqK0puMSttVFNJ?=
 =?utf-8?B?QUtDeW9ieHBNOGQwTzllVkdxZ0NJb1dwN1dPNHJGb2tuN0E5TEZLdFI1Y0V3?=
 =?utf-8?B?SE4yOVoyeUljTFY3V0lSV0VISXZEVXFHZ0RITFBuNnN6YzhxejdKK0hWRzZo?=
 =?utf-8?B?OUoyY1VLVUxudUVhdEQ2NG4rNnN1RnQxOVlJdXUxeGdFdUJkVm81RnJmcURv?=
 =?utf-8?B?Qkc5ZW9KTUN0azBTTGJtL1h4SkxzYko1MnBUczVEVTViMkMrLzc2WktFZFg2?=
 =?utf-8?B?cnlaaVZ3OGNCY1JQTkFNclpxNGNEVHJiOGc4YTNyYXR2ejFzQzljektCV2Fa?=
 =?utf-8?B?c0RTK1pUbWlqM3ZseVJuZVBxamdyUkdmNEpMOUhmT1ZnZWFZckRjUlpicTEz?=
 =?utf-8?B?TDltSTVEa3FrOXFqWUk3K2V6R3hSSHBaeC9SWnJmQ05LMlZqQkFvTjEvSnJ4?=
 =?utf-8?B?U3UzbU9OZDBtZExUaEtOYUN3YnBERTNRSVdBYTM0aUJzbDBpUnh2YU1CVlU4?=
 =?utf-8?B?Q2FYK3dEWVhpcmc4UXJ5NzRvWTJhWGxvZ3dKbmEyUjc3QjI3RlA4TU0zd2E4?=
 =?utf-8?B?Zi9sdEtkUHhZMzRPN3BhYW90YmVRY0ROOElQTEhJdExlTGV0bjJFcUdITTdx?=
 =?utf-8?B?cXVlQ0s0a3FYVXh3UUdreGNyamk3ZlppY0dUNUhRTVlKcng4MFlLZlk1eUg2?=
 =?utf-8?B?RWtEVWRycEpJdTY1TTdwS09HRXFTQlNoMUJSbStpNUJmMVdZK3kvanMxZndu?=
 =?utf-8?B?R0dONDlqQk9OVHBRQ3hNaE1rWlkyT1Q2ZUJKNHdwaDZUSVpRcGJKL0srVFh5?=
 =?utf-8?B?NkhsYXZPSTk4eERWandWZWlGSkQ4QmRtVGd3dHpNanVnb1hGZzdKWHVVV2hm?=
 =?utf-8?B?WDVpNGNYbXhhUEdKc3R0N1hLWnNPV1Q2VXVaZE8yZDB4WnordjRCNG9hVXVZ?=
 =?utf-8?B?SThoNnFlSDZzMzI2dXRRTGRnUWIxUjhodVFoeVM4U2VTV2Z5YUF4ZFUyWU5J?=
 =?utf-8?B?emJ3SDVEOHBwNURuTG90OS85WklLV2Q4WXFIS2R4T3IrNlV2eVFRZm1KRW54?=
 =?utf-8?B?Q293TlgwTTlnNUdHNVBkVGkyaXJxWUQ1L2xYQUxnRysrZlhFaEJXMzliL21Q?=
 =?utf-8?B?Y2REVnQ4T2RtNGd3bXVoQjBKenhPTG1EQmhLNncvV1lmS1RFNDE1ZVBXdDc2?=
 =?utf-8?B?bmRIak50YlBLbnFURU5YVmhvdGt5RW4rcTMrV0RSODhFR2FOQmM1R3QrZnpG?=
 =?utf-8?B?U0tmc1FlQnBCaWp3dlpEaDJVdXJKRWdaY0FLUXlYSitmbE5qTXhNSXZyWThv?=
 =?utf-8?B?ZlZIOWlXN29tQi91UDJiTy96TlgzMy9vcmY1eXlWTWdpMUEyTWhYZG9HZ1JS?=
 =?utf-8?B?OXdncEJjQW5xVHpVMGZacUhPeHd2YzVZbXRvWklXT3pwUC82S2s2THEyNEo1?=
 =?utf-8?B?T2ZoLytkVWVSV1hhVUZndmJwQm92cmdwakdIRFZjeE9mYTNkL3ltU3pKRUh3?=
 =?utf-8?B?YU1sdnl5UXhhaVJSc2pRRVhqeklMNFMvdGpWcWJEZzZpZUpKRUxHZHNEWjRL?=
 =?utf-8?B?MXJLM2xlNjBQU3RYUGpHS3BVYW82dlpoTThlaDZxaFNUOFlRSUNmdnFtdW5k?=
 =?utf-8?B?Qm9LQlFOMGtOU2ppN2w2YUtiNWJMNE9hVnJJRldITkkzc2VFSGNzZ3pZSVFZ?=
 =?utf-8?B?LzArTlhKaVJ1MmIxbWNsSTJRTVJyNXBzamdocG9ndTdiNStndDBDWkoza3dC?=
 =?utf-8?B?NGhiRFlWeWFoYS9XMXFudDJENXJ5dUhwWGpxNWRwbk9Lc2ljU1c4SGJVcHND?=
 =?utf-8?B?cXlYbVJMb1JGSXhzR0MrWnY4OU1YOS9XV3NDd0FwNkRrZmcvbDUrM3c0RHlC?=
 =?utf-8?B?T2xDZVQxUHZ6Ung0ZU5IZXZhbTVaY21tYUwzSEVXVlJIcEJ2WTkvZHRyQjJ6?=
 =?utf-8?B?dTM1d2c4VVRqY3E5amV6RzhBWitPLzJCTDliS0tMWGowRmF4cDJLSE1DNnZ0?=
 =?utf-8?B?aktydUlpenlTd2xEM1lJcnIwNWx0OG1oWlF5OFJuSnRDRW5FZjVaditTQUNs?=
 =?utf-8?B?b0ltOXB3Vko3REx0c3VOdHI2Rk1WTHBMUlM4dGhCajk5M2UrNTcvd2pYQ0p3?=
 =?utf-8?B?Wkx6bm9UVUF4ZTZjSVJyTFN3R2llRDZDTU9VZEc4SHhGbERqTHc0RUd1V0Ni?=
 =?utf-8?B?ZUh3LzQ4WTBpTkxTYjY0MGRtTksvdnY3Y3NEcTJGSWZTUEg3Q25Xdz09?=
X-Exchange-RoutingPolicyChecked: dSLfUhHUlpLEzrW/toSyPX97DfawqZqRincHB0GEJ47oIqXKT3iDZECxbwK5r3uyJSBCEx2xJ5u2DcrQ/EGj3GXWxAHl9e8I8qoD1tgoSe6iqYjK1QM73oXEZX9nC3inawhiwoaI/n+5/3W5qXOealemIgpJlBI8oFpTCpPCNd0WUzb9pPY2YQ79seuZe4ASJ8ByqKD+8u7eEbgwMQuuE/HEf/ciTnwOCusF6Xh8EjQnwVjcJSyId6fK7+rbQmWlYYvN8XVr53UgyafP7gvhzdUljmc7ua2vkawXPjEgFgpqrtCsytlfTRgw04cncKyJYgyIN3GSQqwD4gyBtwm8yA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e48f1cd-fd8c-4e1b-4e85-08de94e130aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 20:06:43.9988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tg55QbGDyF5hmY3hPfMmWvY6AwIzU95tV7+YBlpJeNgYY7APnqz8SCq0FQ57H+yoAIWWyBvpmB7sItvq8RV1uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467
X-OriginatorOrg: intel.com

The subject needs a change. No new tests are being added now, right?

On 4/7/2026 10:45 AM, Maciej Wieczor-Retman wrote:
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> 
> diff --git a/tools/testing/selftests/x86/lam.c b/tools/testing/selftests/x86/lam.c
> index 1919fa6daec0..d27f947ea694 100644
> --- a/tools/testing/selftests/x86/lam.c
> +++ b/tools/testing/selftests/x86/lam.c
> @@ -26,9 +26,9 @@
>  
>  /* LAM modes, these definitions were copied from kernel code */
>  #define LAM_NONE                0
> -#define LAM_U57_BITS            6
> +#define LAM_BITS                4
>  
> -#define LAM_U57_MASK            (0x3fULL << 57)
> +#define LAM_MASK                (0xfULL << 57)

How about calculating the LAM_MASK from the LAM bits similar to the core
code in patch 1?

Also, when copying over the defines it would be useful to name them
exactly the same as the core code. That way any name changes would
happen in sync.


> @@ -247,10 +247,10 @@ static uint64_t set_metadata(uint64_t src, unsigned long lam)
>  	srand(time(NULL));
>  
>  	switch (lam) {
> -	case LAM_U57_BITS: /* Set metadata in bits 62:57 */
> +	case LAM_BITS: /* Set metadata in bits 62:57 */

This needs to change to 60:57 similar to the change below.

>  		/* Get a random non-zero value as metadata */
> -		metadata = (rand() % ((1UL << LAM_U57_BITS) - 1) + 1) << 57;
> -		metadata |= (src & ~(LAM_U57_MASK));
> +		metadata = (rand() % ((1UL << LAM_BITS) - 1) + 1) << 57;
> +		metadata |= (src & ~(LAM_MASK));
>  		break;
>  	default:
>  		metadata = src;
> @@ -291,7 +291,7 @@ int handle_max_bits(struct testcases *test)
>  	unsigned long bits = 0;
>  
>  	if (exp_bits != LAM_NONE)
> -		exp_bits = LAM_U57_BITS;
> +		exp_bits = LAM_BITS;
>  
>  	/* Get LAM max tag bits */
>  	if (syscall(SYS_arch_prctl, ARCH_GET_MAX_TAG_BITS, &bits) == -1)
> @@ -719,8 +719,8 @@ int do_uring(unsigned long lam)
>  			uint64_t addr = ((uint64_t)fi->iovecs[i].iov_base);
>  
>  			switch (lam) {
> -			case LAM_U57_BITS: /* Clear bits 62:57 */
> -				addr = (addr & ~(LAM_U57_MASK));
> +			case LAM_BITS: /* Clear bits 60:57 */

Just like this one.

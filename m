Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5238D6A7;
	Thu, 19 Mar 2026 17:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942183; cv=fail; b=BxqcTVHcZG4bRns44X/m+ggt+SDJ09j1BZfW5/jEw/ByXAcRv9qf4taJK6Wkds5HleCm3mSq8/LcRMnUiAAltz5gFfdLmj7pZ/jd0BcW4IJj0CBuUUwYcWFgs5jgWW52o+CsSt6RNJMMBAOVx3E1J3WmTPM50JkBzvlAKIDQsAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942183; c=relaxed/simple;
	bh=kgWavyxbdQjMhtRPU/GDhu+mdi43Vf3Hot0dMT3xuL0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gIAsIy5iZC2AX1jxzba4p9pAm8uW+IWQjBFRERCBHYqkffnwtWD1lgxbem4uRT3Kwi2ZrvcFB5DodruhTwE7HrFDItcD3v64UcgdjdbIqg0H9NWb+j+b4vCZ3wOzc/UkCYScRB6EAvB1ffXGjqNlPtmhGvb8vA6dQRw6CftXt3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9dKq58F; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9dKq58F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773942180; x=1805478180;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kgWavyxbdQjMhtRPU/GDhu+mdi43Vf3Hot0dMT3xuL0=;
  b=G9dKq58FdDzlWjCsIKaYzkBwqsS4ClheaYiJv9IOffwXftvlYFMPer5l
   o+w/2pkr3tnpaWi5M7OtXRD8X/D3PU/NeS2IvC0MdHmIhhIxbcUHkTlZY
   fMEVRpd5p3e7mjgcSpafzLG3oDKJZUn6Otqah+TItnd0y9/eyuY2fY2FS
   18H1DBknFdWSAjrUJjrYIGdzbaifV5T2jp1OZOX6L1c9VH5nubu9SVueq
   Yw5N3fOTZ6PtKFwxyDeiX6xAHi3ptxgRtB4g7yYf2DTLXN+oO7Mr4VjM5
   l7V4kHqiY9Q0c1YJ7sa3wRPjFIe08eBgDoBtyS5/QbJX1UF6ro6zjeD8P
   Q==;
X-CSE-ConnectionGUID: jJPLHjXaT+qYFD4n21HIEw==
X-CSE-MsgGUID: TjXuqYoUSAe3zSW53XrQvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86386365"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86386365"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 10:42:59 -0700
X-CSE-ConnectionGUID: W4Do9hsSSQWVm9rHqi7tlg==
X-CSE-MsgGUID: yZmMCijbRompHRx/7Lj9Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="247284807"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 10:42:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 10:42:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 10:42:58 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 10:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKh9gccLAemOAccHPFgh+0LSY9uojmscEd4zs5vxyW/DH1bIp+yL0UlEdzOTml1H8ENyiaqx+39tAejSjeRvcAsq67NVtc8ySkfhrO1LTlDBUItzeDnBBvXXblY5jPnWDjmKNt84c9YxSmbPSCjqfJWPpHk8ztfPiHPK9knWVwvXMCdBNqu5Awlx3iOl5E8+HGx4sNVPH9SEtPZw9UFZ/ZWGG9NAnclo+Uk760gmuMvS6D9NxkBzh3MdOqjpCBWpN4yncq7qmDnL/nn1ob64Zi7PhkAar/Wt5Ii/WH7B8XzO44rvqtvaTyjdRZ8FdSsAxZ6AYSd6LI6uRN+/RIZvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgWavyxbdQjMhtRPU/GDhu+mdi43Vf3Hot0dMT3xuL0=;
 b=kIcv9VkxSUmEU9WGoq3yiSeuLtXFKQN2NA1Zb5lM1Grob0gyvRk8crJQ3iNEA2Ym2/UAI+6Jn5QQlmwY0yvOXOHP/5FAKU739bS7pxTZG/c1uI0XbafPhkNI8qoPG7cKpvFVj8zjiWj2cb9O44ai6djJR9LdtmwamAnvRiUVaR3o2k2Gx+/h1HTiUGXELFXrf62szA0YHu5a2oDrV68gZni+pmqbemA/m2XMEVQrfWEMGHFnyDyrFC92hlkJkTiu3H/iO7VNoZdFw2XcHBvdsJ39FfJ/ziXTlCcItDFaLE2Vzd1Eyvi7wH1ncQbTZ8H+kmnV2YY4OgilFuSzZoI8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 17:42:50 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 17:42:50 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "aleksey.oladko@virtuozzo.com" <aleksey.oladko@virtuozzo.com>,
	"ptikhomirov@virtuozzo.com" <ptikhomirov@virtuozzo.com>
CC: "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] selftests: x86: test_shadow_stack: return KSFT_SKIP when
 test is skipped
Thread-Topic: [PATCH] selftests: x86: test_shadow_stack: return KSFT_SKIP when
 test is skipped
Thread-Index: AQHct77YujKQvqesrE2L06NTnMibgbW2IB2A
Date: Thu, 19 Mar 2026 17:42:50 +0000
Message-ID: <5a977040caae42e41e3fab53efdfdb9201b67e3f.camel@intel.com>
References: <20260301014733.454260-1-aleksey.oladko@virtuozzo.com>
	 <d3932934-3dd0-4296-8ac1-f06b818624f7@virtuozzo.com>
In-Reply-To: <d3932934-3dd0-4296-8ac1-f06b818624f7@virtuozzo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DM4PR11MB7277:EE_
x-ms-office365-filtering-correlation-id: bd904e27-02da-48e5-caf4-08de85def0c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: dyyJxM8t6d2HY3NW4tOe9i7Xqzdn/eLYqf+0gJqCKngtYkfArRJPrq0xWg3aibknTRsZjlwt7cXdKIe9q2Cuhp25FkbV3+deVQ/6e8SFsBSp5BfR/ZYNRAacqPFpUK8gPlrrGlnBYUH807VA856OXj/tNenqhR4elfbGTrSJn9v6Ff9Izm8U1WHvq+eTx/cadwyQoOCxuNja0KKCS6bh6XnG6pOz5OQ/4aIm0zJYAd/FnWk4yBHpIettBR4y+e0JoQmaH4yiZxW9hutx6sY15/Geggc9OB3P57vFr9jiTIllkAGef1YESLL9RjQas/RAyoYvu9k2E9u+zqDsGFZvlk2P30Qw8eNwPXf5MvuEel2xeMarg8COkDgkygFbmY7eflh7FH/ZCIz3C4LD7DOkabH9oHknIJZC/rV20YJ6I4un4q2Z7AWvCmKpElH8oGnfQM/zi30I/AFlceT7nJdKlrgQIeTibsPn7r3gzPay5pflO/9tgBpY9bGICrO78s736JGqEVsjjepJLboSwoUNOE2olCZp9nPX9s0VvUI9w1MLvTvfMhyEH1EYmeGVP8BAgXsdIHrjoQ4VBeOrMMnH7fFLe1K2no3n1o3qKHiRFpM3EfPy9DeMn6m3ujI56BfNajqEHEkiqE7isWBqOx71BclFtpQEp3sE9qfHGyHCPxkZ8wp12rgP2ABiw93lOz7xKkUwWx4nCYUnwpmgQn3CAHuKTzOAjElRop73XtqIwECK3IuIgg+91BEd4U9UYMcCxBMRx4PPJG9+M3NkoO8nDaxaqFqoqiSyblSkLvBWLFE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmR2QWZGN2ZXY212MUhCSGRtUlRCck8wR01Nd0F3VWMrNjhiYU1TdERlNmJL?=
 =?utf-8?B?bFVtS2JnU0c3c2RzZUN4ZnZhc1grU2xZL3NYZlI5ZUZtRzFyckZwa1plQkdW?=
 =?utf-8?B?NG5OdHh0WDh4L2hCSzliVU41NUJRdkN5cm5RWld4eElERlRBUUx3WC82V0Rj?=
 =?utf-8?B?TWlETjRLczBmQTNWWXAreGh1Vkt6cXB6d0NCMHdjZDJqWHpkK2kwem8xaGVh?=
 =?utf-8?B?TWg1cXRMRyt4aEJyem9WdmR0RkhrWmVUb3FnaVlzNTVDa1JGV0NMWmRkK0R3?=
 =?utf-8?B?S1dsNFNkTlQwVXpvT3kzTEtjZmNTYkhhdkR1KzV2a29OczZPZEFBSTRSaHYw?=
 =?utf-8?B?YXV2b1djTUJGYmEzOTN4L1ppQ2RyZWJ3R1Jlbk5aYmI0eXNzeTF3aTkxNlYr?=
 =?utf-8?B?QlhFb1djN2pOK0wwdGhaYXl1T3NjbEVtRlVtU2hxMmw2NEVNQk92VVdiU3pQ?=
 =?utf-8?B?T1QvZlJoY28vOVdBL2dNcWJGNHlLZHRvekVzRXdzNjYrN1czSm9idnZjRGhn?=
 =?utf-8?B?dWpEcWlxRjN2enlhaTRsZTVnOVA3YmdtbUZ3dGpYanJiUENPSm0wZXpHOVNP?=
 =?utf-8?B?YVJvaU9mbDlER2F0YTYwSG9qQlRMbkV2SWVUbjdwNnZWOG0vZGlzV1FoREE2?=
 =?utf-8?B?aVJDMlc0TGt3cmthcDFJU0ZDaGlYRVFSMm1SaktBaTdGTGcvVXlOdWVtWEoz?=
 =?utf-8?B?UGJqUUtBS0pGWVFjS2pxSlcrWCtZYk5tMzR4NzZ1a1NuOCtIRjhRZ2VMcmxI?=
 =?utf-8?B?ZGZURFF2b2xya1J6WHZxd3FlZ2lFaEh2dU5Jb00yRFF2bUhLandqems0K2F1?=
 =?utf-8?B?RVdISGI1Vno1MTJFejc0endBdWJDa1JDRlFaUkJCMko3RWFDTFBPZk9TWnZh?=
 =?utf-8?B?VTh5NkE1NnU4dEhyTWR0Q2JLeWwvMmVXaGRwVG1CT1VhenlaMXhJb0Zwb1dz?=
 =?utf-8?B?SkVMY2x3TWNaNGNOWGZYdlh3T1lEdXdIV0VvM2g2bStHd09sbUV5UWI5OHdz?=
 =?utf-8?B?dU96cTVnRW0rd2hMWWlmclFTQ0lhWFVJMXppRTZSVlpQWVBOdlBRU3JIL0VN?=
 =?utf-8?B?SSs4WEovbUFkZ2tTRGxJMHVXbi9GN3RjTjl5MGUveStnS3JnZnJNV3I5WEZk?=
 =?utf-8?B?bkI4ZXdWQkc2eWRYN25XblY3K2thOXFUVlBudjAyWm5mM1E2aWoyeWlBVHRm?=
 =?utf-8?B?NGMwUy9uSnkramIxcEhoRXo0WlhrYUZieFpvVXV5cTloU2ZQamUzcUUrVE9D?=
 =?utf-8?B?YkpzdXpLL0tVQ2trOUF5L1B6NUZuQTY3SFllaERXV2Y5dlhMYWJUNnphR0dQ?=
 =?utf-8?B?T2w0S3NIdTZWNnk0UVcwVlA5aGhBNHIxM2hvelNmbkU2dGFITkJ3TkN3OENG?=
 =?utf-8?B?VVhVVzJWZjRQZzFNSHQxVU4wZ1BCeldtaytCcEVHTTVZQVJCZjZZcmljQVhk?=
 =?utf-8?B?eHZlS25iZzlFdGlXeDJ3alVsMFdYb0hNSEpSUVZCL21nbUNBelBRS0tjTXJv?=
 =?utf-8?B?cHRjb0lwSmM2VW5KNmd5WjJmRWNuTVE0NFhkaUR3enl0KzdLU1FXZkpETUM4?=
 =?utf-8?B?TWpKVzVZc1p5NFZ3SzA3QmUveU9aSXpEdXZaVThEQTVTaEVYWUZsNXpycUpv?=
 =?utf-8?B?QmtnaStZUWVPQ0tTd3NJcU9tTWZyWDIzMHc3aHlPSm1rUlpuYmVxcGxtYmtZ?=
 =?utf-8?B?aE5jekRMaS9MS0pNVkN2cmo0TDF5SkJkV0JXSkZYU0hWNmdYekJZczhMSTYw?=
 =?utf-8?B?MWNFOFFiU25uc2hRelRwRlk4ZnFMMkplVngrWXZqaWVQajVEdFZFaDVraFdo?=
 =?utf-8?B?akhiWWhCUUl2UFJJMGx0S3VwVkNpMHQva0E0ck55eHROdytFbkZJNWZGMlhY?=
 =?utf-8?B?dGExL3RWZURBUFIzbFlsNW1SMXdyeXNGMlFTd1REWlRqbjN3Rk9wMUFUNWpO?=
 =?utf-8?B?bFZqNmdXWnJZQlRudWMxUkVBRWtLYTk3dmxXUkNsNUNQNzRUcXZKd3ZudzNw?=
 =?utf-8?B?VlhONkljQjNSamVGRHZiSGkrcGZGWG1TWDE4bSs3a283Qk1KMW9tVlVKZzJu?=
 =?utf-8?B?a2JOSHcxYVNjVjJzZ1ovek5LeGx0K2dqRzNSQ2lOS3dhVEM0UTJqSXpYZzZG?=
 =?utf-8?B?U0IweXJUcWlUUmU3M0I2U0RJWVN1N25lZUZjRksyRkd1Y2xKN1NXeWg4OTRo?=
 =?utf-8?B?UDlUSkY4cGtvN1ZodlpKZFk0bk5nQlVJMmFBYUg5RVh3RE9mcjNHeitoc0li?=
 =?utf-8?B?L2Z6QjhnbThUNGdJTjMzTDh3aFhZam1xalhVa3NkWllrOTVHNU1jMW5lTEVX?=
 =?utf-8?B?TTltTERqbGpxd1N4T3RERUt2RDVCd0ZlR0VBZU1jWS95VWQvK1RadVByd25Q?=
 =?utf-8?Q?zU7ECritZHW2c6Ks=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B99DC94B3330EE42BBF500091C440F3E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: S9gCoxqF4VZcb3UnRQia71fZdKzJqdm6RiDSu4ba2c7hIcsmIGePWMS2t+4JSk6FMW3qjbDYQPF/IeO5Kdfb6wlr6mpYMQ/vMb+tuTGoRppRGKWVgqj/hjiiZ1/htBELZVKNK6ygVSJBR6xS1zsiRsQehrZ0ebOEqDrN/vJFKJxeh1cHMheNTfikAJpnogoU/1qurhSS0M6mm2vcLFUkzOYbtaBq0g25xnmHO9D5iRmBZZmM+U4fz7bmnZDiCZD9Bzx1o5HKqJliPo0i6NInIwxrgYa69WG/Fy1hq50PNqOLN/261gHdeBURSHcREBJaD6OZYQ21bVAxl79UQe4/bg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd904e27-02da-48e5-caf4-08de85def0c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 17:42:50.1865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJV5M8+5XfIu3bPqdK515fD7Kb0YSifIcaImrULJ0FQDt20Px2rx55OpLbe/IFhTbw82Z46wPOAZ2b9D6PEcoe+7upeVgfmvixR8m822pk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTAzLTE5IGF0IDE3OjM4ICswMTAwLCBQYXZlbCBUaWtob21pcm92IHdyb3Rl
Og0KPiBBZGRpbmcgb3JpZ2luYWwgYXV0aG9yIHRvIENDOiBSaWNrIEVkZ2Vjb21iZSA8cmljay5w
LmVkZ2Vjb21iZUBpbnRlbC5jb20+Lg0KPiANCj4gTWF5YmUgaGUgaGFzIHNvbWUgaW5zaWdodCBv
biB3aHkgd2UgaGF2ZSB0aGlzIFNLSVAgLyByZXR1cm4gMSBpbmNvbnNpc3RlbmN5Lg0KPiANCj4g
T24gMy8xLzI2IDAyOjQ3LCBBbGVrc2VpIE9sYWRrbyB3cm90ZToNCj4gPiB0ZXN0X3NoYWRvd19z
dGFjayBwcmludHMgYSBtZXNzYWdlIGluZGljYXRpbmcgdGhhdCB0aGUgdGVzdCBpcw0KPiA+IHNr
aXBwZWQgaW4gc29tZSBjYXNlcywgYnV0IHN0aWxsIHJldHVybnMgMS4gVGhpcyBjYXVzZXMgdGhl
IHRlc3QNCj4gPiB0byBiZSByZXBvcnRlZCBhcyBmYWlsZWQgaW5zdGVhZCBvZiBza2lwcGVkLg0K
PiA+IA0KPiA+IFJldHVybiBLU0ZUX1NLSVAgaW4gdGhlIHNraXAgcGF0aCBzbyB0aGUgcmVzdWx0
IGlzIHJlcG9ydGVkDQo+ID4gY29ycmVjdGx5Lg0KPiANCj4gU2hvdWxkIHdlIGFsc28gcmV0dXJu
IEtTRlRfU0tJUCBpbiBvdGhlciAzIFNLSVAgcGF0aHMsIHdoaWNoIGN1cnJlbnRseSByZXR1cm4g
MD8NCj4gSSBndWVzcyB0aGF0IG1lYW5zIHRoYXQgdGhvc2Ugc2tpcHMgYXJlIGN1cnJlbnRseSBy
ZXBvcnRlZCBhcyBzdWNjZXNzLCByaWdodD8NCg0KT2gsIHllYSBJIHRoaW5rIHRoZSBmaXJzdCBz
a2lwLCAiQ291bGQgbm90IGVuYWJsZSBTaGFkb3cgc3RhY2siLCBzaG91bGQgcmV0dXJuDQowLCBi
dXQgdGhlIHJlc3Qgb2YgdGhlbSBzaG91bGQgc3VjY2VlZCBpZiBzaGFkb3cgc3RhY2sgZ2V0cyBl
bmFibGVkLCBzbyB0aGV5IGFyZQ0KbW9yZSBpbmRpY2F0aXZlIG9mwqBrZXJuZWwgaXNzdWVzLiBU
aGUgIltTS0lQXSIgbWVzc2FnZSBpcyB3cm9uZyBmb3IgdGhvc2UuIElmDQp5b3Ugd2FudCB0byBs
ZWF2ZSB0aGUgZXJyb3IgY29kZSBhcyAxIGZvciB0aGVtLCBJIGNhbiBzZW5kIGEgcGF0Y2ggdG8g
Y29ycmVjdA0KdGhlIG1lc3NhZ2UuIEJ1dCBwbGVhc2UgZmVlbCB3ZWxjb21lIHRvIGZpeCB0aGUg
bWVzc2FnZSBwYXJ0IHVwIHRvby4NCg0KQWxzbywgIkNvdWxkIG5vdCByZS1lbmFibGUgU2hhZG93
IHN0YWNrIiBpcyBhIHByZWx1ZGUgdG8gYSBjcmFzaC4gVGhlIHRlc3QgY2FuJ3QNCnJldHVybiBm
cm9tIG1haW4gaWYgc2hhZG93IHN0YWNrIGlzIGVuYWJsZWQgYmVjYXVzZSB0aGUgc2hhZG93IHN0
YWNrIHdvbid0DQptYXRjaC4gRnVuY3Rpb25hbGx5IGl0IG1ha2VzIG5vIGRpZmZlcmVuY2UgYmVj
YXVzZSBpdCB3aWxsIGNyYXNoLCBidXQgaXQgaXMgYQ0Kc2lnbiB0aGF0IHRoZXJlIGlzIHNvbWV0
aGluZyB3cm9uZyB3aXRoIHRoZSBrZXJuZWwuIFNvIGhhdmluZyAxIHRoZXJlIHdpbGwgaGF2ZQ0K
dGhlIGNvZGUgbWFrZSBtb3JlIHNlbnNlLg0KDQo=

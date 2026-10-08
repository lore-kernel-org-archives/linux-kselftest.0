Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CB9439F95;
	Thu,  8 Oct 2026 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493226; cv=fail; b=psqgVnfJ4R+r/11/s5SydbO+UdxzvVNo3HJu/+Lbc3SAVqXU8fBe9T+HpqTLzrTqUSCPHtbDWBYbbKstD9NGVaA09nyGVGAD5yLuQJHbR/I1xxInT3H/mmJ84S4bVentQo5D1Hfjs8wgSE+LXk8OLpLWNeVV6cMbAxaTgWqRkqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493226; c=relaxed/simple;
	bh=LvX6k9aCePtl27gxHWXIPv2IfWmJe7YQDbWvnLPiXrE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OEKy6QHgFT27rtp9f8BfL+ZjbWVm3dJVwSUhGbBx8Lr74Sp8mKA/KIhCXHFCAynbWTDcftzbt3VcNcV0ArpTINsWepVD1JXgCiNs9cTIAoqoamWMRITdKcF42lzXazYxCHn//ZM+1gScIPt34s6JP3CuJFArcpBXKPzbSVr6ASA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDV7VtAV; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDV7VtAV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791493225; x=1823029225;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LvX6k9aCePtl27gxHWXIPv2IfWmJe7YQDbWvnLPiXrE=;
  b=dDV7VtAVQIn8Njr7lwd93RA1nzjTMe0xG69EghaYY/uSjc/Td9/+5xlY
   JilWVXa1lgxhDun/oi0grMV5XGqfviHtM+c57xIO2dYPbm++UaCvu20lq
   B01RrOG5UnEbutvufhYCD7prBCx9s1uyNj4YD1+hqFVwALNI14zbYKlD4
   A5qtUym/elHFl52jlEeCWgk/CTJBraBsJdIPfUQrFa5uXOrkg5m5VjQGW
   5Iuy75NKEgp7iLKYgMgK6nohQhw6pBkC9ssyyY6++fWDt4mZiO0uVrXd8
   54SIOdA17ymKtZuur0xNMeM0h1GoJK2m9Mz4A3M1T6d2JEr6QKEN9WdK3
   g==;
X-CSE-ConnectionGUID: gLw5/q7tRjmo9sRYEth2XA==
X-CSE-MsgGUID: kkud/d+GS5SsVHLUeINf6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="298544"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="298544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:00:24 -0700
X-CSE-ConnectionGUID: 4YpSdbciSLSWQgOKHwBnew==
X-CSE-MsgGUID: vAsF3fu2TNKU2zfUj6qRtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="506641"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:00:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 14:00:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 14:00:23 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 14:00:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bz2uyhQO/KSdTjna4SY4l9Qf6XEbuGO1nBeYZVrAn6FlHr4WejXXs43rMLKU1yV3ud8w/K2anitDI9t3U9/wFSTRClvdw+twOMAVTUNEDNSJUP/3gF7Jru8GMJcmc3QDToVmjkQi0oI+FLj7IMsNEqth5u9lwxh17fd9EMAA/Nj/Fpw1zEgXdZLJfccIiD6ZYEhdq3d76n8gbGpWPXK+ioCOKhFCfk/Y9NgmryD0DT71GxBPazo9qn4hU8wDfZQQvhre/e6QjlytsqsECCZp8+4qEvjsZa2Laam9H3v9FhkWvPYxhN3BTv0yR5EuaaZJbS2ejq4MbqU6EnWgo1zbDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvX6k9aCePtl27gxHWXIPv2IfWmJe7YQDbWvnLPiXrE=;
 b=qrk4vnmsm2kGOdIEbcX29UtkcDn8Sc9w7aU69+O8UhLvF/30zAeU6mtFAcAKHRKs1sBG/UE18bFtXrKdmpRLjjOV3fMEyKdAI1BzrTgEbi2wCAM1KsXvfBF6fjp5YPmoXzOiF2cpDU+Sk+zSl7HTUT9V5MiP1EpZ97CAAXa9OcpmymMa7jgnTNvBnECo/2tIOn237FuQbn7Ybf3I1Z9hPTE2NQ4d0aj1+gWI1j4X9eLuoy+mNID7lTIMjxHiTIm2tmBEpVZNhpRpIHOIj7SVlktJUWk2FXldugJ6FtaJLyxQTojF/gthTQEP9ct2msJQ6hWdB5Tw8H5+66S18cLuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by DS4PPFBF67129C1.namprd11.prod.outlook.com (2603:10b6:f:fc02::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 21:00:14 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 21:00:14 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "x86@kernel.org" <x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"ripatel@wii.dev" <ripatel@wii.dev>, "tglx@kernel.org" <tglx@kernel.org>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>
CC: "hpa@zytor.com" <hpa@zytor.com>, "kees@kernel.org" <kees@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 0/3] x86/shstk: ban ia32 sigreturn
Thread-Topic: [PATCH 0/3] x86/shstk: ban ia32 sigreturn
Thread-Index: AQHdV2IBUC4l7H9Ys0qqfi3kVnVtwLb0IUKA
Date: Thu, 8 Oct 2026 21:00:14 +0000
Message-ID: <2aa256e2547087f3551a6340a99e2cad103ff3d0.camel@intel.com>
References: <20261008201610.1003569-1-ripatel@wii.dev>
In-Reply-To: <20261008201610.1003569-1-ripatel@wii.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|DS4PPFBF67129C1:EE_
x-ms-office365-filtering-correlation-id: b1c8813e-000b-432e-d65e-08df257f2621
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|23010399003|376014|38070700021|56012099006|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: m36FDqVZJC1tTMID139thVVZxI0E6TyPryRn+LIfFXtL5OLckEQ08yK+IwDUPtKt500eSmNM19ml07rcboaO8/sFkTgn3Y+M07P5hWH4+ZNiOZXvqnq+80kSAFMYWMZYHfT9cZrBZC1nUQ2zXBtDziRUiaCQ/U+ag3x84Vu3PdEOfY3Y+Cmu3it0NfqXUa0zsgTFvagnqOjefvixrIf1POuTLBJszg4Wb4btU+LV2HDiYy4ZWCT/TNqwEh4ntQCTCbklR4jspBPu9a1cDkHIBqf4Z3hXpMjHENrLuHYCLOn39CQa+asyzAhl2Oy5rNdthtWqJLNom7yY/8ZSm3T2jbI75wIDmgbtkboRsRFHUscvnZ5r9I/ZwfFIg9oTQfCYyWJ1AEUXk89JWkm25yq2nPMvJPhxhy085Vf32KANTvcuvCXAJwGuGXPx1BqbllTt7JXhC2utSK559rag0W1ywzxis2C+drXsAq+oNoOHHnO9SqE8CUogPMszSTtSCbDjCu835j0tU3rkjTdSbrUjpDtdfRpLxqAg4Mt8rxBk8+9MGS0+zgKA2gKJ0Pmvm75CSkvgkYRHrcg8IoejILHOXW3u3qRRuk7/AIwePVi4w1KTfG5K96e535t410MB3VYUgdsd+CofIEdS4UYveoF6De0rf7iaQFR86vSeog60aexlOWWNTadNweSUx1Srx+b1fUjRyAsAKjqV61Tn9euDxrBiQCINkSjNzyn68MJQmco=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(23010399003)(376014)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWhFa2Q3Q0gxNjhaV0NKZSs5dzJiM1BsQmVWMVdsbjNuMDNUVGlyanhYNXNn?=
 =?utf-8?B?czh5bDU2ZUlhVUV4RWNhRjJRMUJFQ3c5VmM5cW1yS3MvZlpZSGlacWZZNkQv?=
 =?utf-8?B?RlI0eDEzY0JtZGQzaWthVEhJb1FDRFVOTk1ocnVYbjZQVGpWdVk4UWUxVHZw?=
 =?utf-8?B?bFhiNHZUQnJVQmUxWkRDekdOQmdIZ3pjSGtoTU9EWmY0ZmllTGVFb3NSM0U1?=
 =?utf-8?B?dmEyOGNVeHlPU3NWV0MyVXZPaDloTTIyN0ZQMFkyRk8zbS9OTzJVK0s5V1Fm?=
 =?utf-8?B?ajl6b2tOUXF0MUx6N2xtVUtueVFFWjdrZ0hmaGFiQ1VIRk9TMVNHRmp3YUR1?=
 =?utf-8?B?Wmw0cmpzSkphWUZOZ09GaUFUZWRhYVNTUGkwbjFaZ1Irck9iNkhOTjQzTHBn?=
 =?utf-8?B?WW1xVzlIWU9PYURaS0pVL0phMUg0M3FqNytMVUhnZExRVUlrdThuN3U3N1lU?=
 =?utf-8?B?SmJuNElOUTdPdnRWSkxpNElWb2pYNkxzck4zRGNUYXU2SytyeUVybEF1MkhS?=
 =?utf-8?B?QUJRckpyd1hySzQxM1JJWEtTKzNaZjkyZjBtYXhFeGowdVd1RlMvQXd4bGpG?=
 =?utf-8?B?Nk93VTE4K1JDREpXRm1pQlRWc05la3E2ekczalRiYzJ0STE5eTRubW8wSmVP?=
 =?utf-8?B?RlhKM1pEWlNobXZ5VDhtR2dyVkZLTmZkM0pJVUpRb256YTA2YW9kZE51dVV1?=
 =?utf-8?B?M2laeFhRcldUcmIyeWVtVGJlNHF1cVdKbGpmTFhsYlRoZjQzSTRJaGh2Y25C?=
 =?utf-8?B?SmRPbEpXbXc5K01Sbk1wWlFGdW0wYXMwZytvaXJvcE1vM1h4Q3FFOUdHbXhL?=
 =?utf-8?B?SjFQM1ZpeXloSWxpa2RINTRlRUxRMFhBam5ZMFRUWlRtVmNKbVFEQmNvU3Br?=
 =?utf-8?B?bHU5WVgwT2VQQmNNOXpGMmxSb2xXUW5uTjdrclRQaXFSZWNwOTBxUDBXNWdm?=
 =?utf-8?B?cjJXOXRjNmNLK3lTUEE3YkVBWnZkc09HTDNKbDkwaU5XYVZlRWlJcDVMckIr?=
 =?utf-8?B?TWNwSjZYdzE5V2RTWjBHeWZmeDZyM1Voem0vL0t3RU1kR3pCbWFUWjVKaEY1?=
 =?utf-8?B?NGVVdDE4cVJtOTVhL3h1UVJYZWpvUkNuT1pSRDVoa29rclVmSFZ3L2didGtE?=
 =?utf-8?B?VU1TTkxmVU5mV0ZjWnc3ZEVyN0srb29ObXhwQ2djSyt1bU12c3l6UHorV1No?=
 =?utf-8?B?aVBlcndOTFVwMkREekZtQWRsOCtQd2IxZndTZ2pqbUJpVjcrWFRFcTdYWnVh?=
 =?utf-8?B?QVN2d2ZJN1hFaGc4T0l4ck1OajBFSkQ0YUQwNUZvZTdpbWtVTFBzZDA5TWkv?=
 =?utf-8?B?Njh0L3FoU3ZJNlJBSUk3aitScDNvbTBIb0VxMDZMSng1aWlLaGMyeUNQSmlF?=
 =?utf-8?B?NTNWNjUzdDh5ditSSkJjZzB5M0lVa2gvN0VUOGVyL2xkQVFUNHpoNTlZaCsz?=
 =?utf-8?B?NnJqb0lwL3R4bHRXUVpOVlJZb05UMndseUVNaUN2eXNrVVBkbkVzMG5xdXJR?=
 =?utf-8?B?YnhIZVF2K3BXTVYzLzZIcmdRRkhDZmRYQ1N5Z0J5cHRzbnRyWGVQTDdnd1RY?=
 =?utf-8?B?N2ZPUlNEdEJBaDRJdnc0bWFVdHZTVGRQTnk2d08yaGFFeFhhVlNqNHJhdkFW?=
 =?utf-8?B?RkN4Mm9MR3BIT2kyZ25NVkxCM2dsU29sN3NIdzl3QTVqaWhTcUZDUzM2V3Ix?=
 =?utf-8?B?V2M1cEpkY3ZUT2NBSGtlRzlPTjBDalBobWFENi9kYUNjOXhWRko4THU0U0U1?=
 =?utf-8?B?M0dDbHBwb1JiUkNHcDlaZVczdmZCS0JoOUdjUlQzL1IwM3FPV3FzdE03bHNT?=
 =?utf-8?B?dzZXdFR6Tkd0aDdXeng0cjVidVFXN3BsWkhFYTl3RVRMY3FWWFU1RmhHV1hH?=
 =?utf-8?B?ZXZmRGlwUFdXR1BKZTE5T1kxM0R0V3N3Tlg3eUxCV3N1STluUW1YTFVRNUdq?=
 =?utf-8?B?UGhiMFNnWlZzeUR3Y2w4SjlNeEMzYk5oSHJ2MEhFa2d1emxDRkwwVnRtYWFm?=
 =?utf-8?B?NkQxR1VySVIvM0pnVDFkNE1UQzB6U1Jkb1ZKZm9WRjdJeWZFeDFVU3hhMG1y?=
 =?utf-8?B?eTlpWXEraXJtRm55MStMRUdCWFZZUnpsVnRDQ2J0UmRVUGhsNUl2MXVLQmlt?=
 =?utf-8?B?OU9QYVdwWWxiYnhoc3FZSFlWQ2FxMmM4OWVJY2wrcGk4cUtpWlVNeWdpZlcr?=
 =?utf-8?B?RnJ1ZERBOEIxbkpENngrUjhGa1Nkd0xQeWdBUWFZQS9USzRoV1NGWVJMZ2hr?=
 =?utf-8?B?K3dzMGlCUmdPdDQvSStuN3RCTy9DeXhmOWFWeTliY3dhTkEwMzR1bFQ0Y253?=
 =?utf-8?B?VmxHMHJibmcxaGJvaWl1S2F4eGdSWjBveUlFRVpZaXo0cmp3ZDVWNU96bWJH?=
 =?utf-8?Q?Ho6GxQ0V8+cljGpI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BAD62112F46FD41860AADDA7A72139C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Z2TekTfQd1e8MVwlg/x5/pR+ajhT5L1z2dCbfox1jfYPMgcl80Ng9YbYbey5vb//u7y0zHWwGGWWZlWpf4/Gz1Zxi+qOenUIME5h/1N8pR9RJ6FmMB1QhJp90aQVS5p16P39RbgAlUb/0P+U06d9i9jEKcpfrzif4nDbOzR9IIAHQ590xj2lrg1qJKPUaaZPzjF+ro/7Z4X0euoLDQS5VsfqCeCxOpDtcTiS//qD84UrmeiVblkGl5uvXzs9jleNwRafkeQgs4E6mGT+T3rTv1uC1CGRxb3bLwYWE/z/HcM0sqaQRTA70myb14Bcsq0LQcx3pBQ8YM2d1Q9R6VcYIw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c8813e-000b-432e-d65e-08df257f2621
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 21:00:14.0377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0UwUX/tjbv6jHCLaEHFNZ0hoOU4YqZmKO9JzH6ZyspgQlP3id+HUjvB1bqVzHLS8b6WqW01os4Z18+6bUCaJYWCJP+nAB3FPxij6SL1z6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBF67129C1
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDIwOjE2ICswMDAwLCBSaWNoYXJkIFBhdGVsIHdyb3RlOg0K
PiAoVGhpcyBzY2VuYXJpbyBpcyBiYXNpY2FsbHkNCj4gaW1wb3NzaWJsZSB0byBvY2N1ciBpbiB0
aGUgd2lsZCwgYnV0IGl0J3MgcHJvYmFibHkgd29ydGggZml4aW5nDQo+IG5vbmV0aGVsZXNzLikN
Cg0KVGhlIG9yaWdpbmFsIHB1cnBvc2Ugb2YgbGltaXRpbmcgaXQgYXQgYWxsIHZzIGp1c3QgbGVh
dmluZyBpdCB1bmltcGxlbWVudGVkIHdhcw0KdG8gbm90IGhhdmUgdG8gdGhpbmsgdGhyb3VnaCB0
aGUgaW1wbGljYXRpb25zLiBTaW5jZSB0aGVyZSB3YXMgYW4gZWFzeSB3YXkgdG8NCmRpc3N1YWRl
IGFsbW9zdCBhbGwgdXNhZ2UsIGl0IHdhcyBjbG9zZWQuIElmIGl0IHdpbGwgcmVxdWlyZSBwbHVn
Z2luZyBhIGJ1bmNoIG9mDQpsb29zZSBlbmRzIHRoZW4gSSB0aGluayB0aGUgY29zdC9iZW5lZml0
IG5lZWRzIHRvIGJlIHJldmlzaXRlZC4NCg0KSSdkIGFsc28gd29uZGVyIGlmIHdlIGNvdWxkbid0
IGRvIGEgc2hhZG93IHN0YWNrIGNoZWNrIGluIGRvX2ludDgwX2VtdWxhdGlvbigpDQp2cyBmb3Ig
ZWFjaCBzeXNjYWxsIHRoYXQgbWlnaHQgZ3JvdyBzaGFkb3cgc3RhY2sgYmVoYXZpb3Igc29tZWRh
eS4NCg==

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6A38DD3;
	Thu, 22 Jan 2026 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769064483; cv=fail; b=ZUhCJ2B/xiprmdiaffA/sX2Xk1v67dIYT6W5aU7RvqW9fc1q7ULm70mmZmlqg9W7ZifizSZjy2v6i/nLf858JMcZqp7bxIlGkq0jGzZAniZ7mIuog/kD/dMf0nIVDwSHedaHjxiivhMIlqw72XerN2vfzfa4nhExOp3g30CIxVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769064483; c=relaxed/simple;
	bh=P54IIOwNnxmBXVyjK2gXJKnvpDyhdGniyHu3vu0bd5k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E5KWPZwbLYiXwVkA+XsJxoXm+OZiBlRycyEJPW5KSHLyFBCoZwR+cghtjTFOtkOJjjdpN+AGtghRinXHAtbvHCoTJj0rHetEO+QiQEnr17Ru0xVR91qKjW8206LbuBY3V1XLjWM9ED5Y52GJ7tl3o0ikd5AbrjZQXrhh7CcKxOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwseV4eB; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwseV4eB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769064481; x=1800600481;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P54IIOwNnxmBXVyjK2gXJKnvpDyhdGniyHu3vu0bd5k=;
  b=kwseV4eBm0SzTMKaX44e92FxFWgDQyRlU+Bc4dMRfvkZxyX2ycmKYSCe
   o1pOTMVuG+XNhMEMmLnjUfoPcHBikndCE5MOOh7/LstxlxT220LsvzrWY
   3phnb2C9wYqfe9iWI18c+IMZ+QZInqjfMDm0CKbf7F/a6kCUQY6BkirVs
   CiVgvqIzoPTp77ydguhLSJy10YmrF9xdAYS+cHxGyQrmCJ3XNCqILD20x
   YRb1+cze7S0Q/RYFj7agegQ9t3eboYb6q3MGOCh30Nxs0kCutxtbjPTOk
   e6dGbsEikP7qKYYJj/2w9OY/goY2ApcJbAXvQdWw7aTwjByLi0m+zpV7X
   g==;
X-CSE-ConnectionGUID: Vk+m47/NThGEMmk9TH/iCw==
X-CSE-MsgGUID: VGcqjyryQ7GFf7PYXf1NaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87715305"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="87715305"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 22:47:59 -0800
X-CSE-ConnectionGUID: 7nSPll2PRFqTBVo8o/4vRQ==
X-CSE-MsgGUID: KYx43lalRhauLiAPKkMBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="244248569"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 22:48:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 22:47:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 22:47:58 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 22:47:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdbEmFjMgMF280rOs8gX3BnIrn6wZr7bJ49vp6kewVIAcXcUsipUqbOLwtU92TSjja3nrt7Lt0P3aAjLYGOucaMCoAKdBKCoHUBZ0HIlypVSVcxRyjKvjdWDvEpzAheVvZ3GxE7RDa47xYfQvhUQeKfvpgvF91otw+ntLDJLa4tWQ8h0Zh+SxRmRSsW3TRZnBGu4ntaXVXWVapHHrIKJAq2mTN4KOkTxN1VYvqX5GnitQq96wsQ6GfJ3kifwd5DK+cj4BMOK82XP/pwd+0hEvY9tji9oB9SyQuedNkEyZAfGId6GLMJ3Be7c099SPBCNKwOQVv/5y1oKesLi5FIHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KRUfFc4kFi223C04pEprkimhEnB8qZT2qTOych4+OY=;
 b=NeNNAihU1IWaG2PtGdw2TKsjGLZqBMIjahzli7ckr+THvAPx50lawJu8VbqaRykxo+KbfN5RiV0BjqbLL+6Mny7t/o6xqHTsWjJlfgeEjbrWbQ3zYzJrbugtti+V5gXwyN2+MnlaVHauBQLCJMtc5kYlu/zdkIbYbyVryvMmXNJeuAuDap/CNN06ZIo/ad7Ghixkdw4BqLRSaEe6TQQF+aZ3re4wtdT01jEgEYS2p4BXIcRF8PqL46JM+G+y8VWU2k17vGP96RxG7YAdlTPIn+4gs134IXTqXMG5MQTBLQWnhC0S/gc7TyBZmfYnF535WLnPgeRd9ZL68tqUy5fv7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 06:47:55 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 06:47:54 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>, zishun yi
	<zishun.yi.dev@gmail.com>
CC: "shuah@kernel.org" <shuah@kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "richard.weiyang@gmail.com"
	<richard.weiyang@gmail.com>, "reddybalavignesh9979@gmail.com"
	<reddybalavignesh9979@gmail.com>
Subject: RE: [PATCH v1] selftests: udmabuf: fix hugepage size calculation
Thread-Topic: [PATCH v1] selftests: udmabuf: fix hugepage size calculation
Thread-Index: AQHciIGVs8cZuGkfXk2K7YHCN0gPfrVYY8aAgAU/c9A=
Date: Thu, 22 Jan 2026 06:47:54 +0000
Message-ID: <IA0PR11MB7185798382D21B45FAC56044F897A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20260118135126.102472-1-zishun.yi.dev@gmail.com>
 <20260118123825.c124bd2e01fabc1d78620d87@linux-foundation.org>
In-Reply-To: <20260118123825.c124bd2e01fabc1d78620d87@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW4PR11MB7161:EE_
x-ms-office365-filtering-correlation-id: 4bd5d1b3-69bc-4b5e-c220-08de59822bd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?IZjFT0p1BijBq9C9pubyFO3LxRKRoOubChrf39MPYVSB8iJ0iZy7/sPjwyY6?=
 =?us-ascii?Q?8EqDMOVyKYrsHu1D9yhE1kEfjyNSnujU8Xio4TzEL24/4Wm9mUVBzArhhyyC?=
 =?us-ascii?Q?NBZpbOX09+W6V3xkRh5GzjAP7MetJQyoao35dKztPkIRwelDfnDSHEk1r5QN?=
 =?us-ascii?Q?5JM63O4GhRHAUoygHTR9UbR+gDnVvb0nBUyvKQRMODYnPHvozal+MqnLljON?=
 =?us-ascii?Q?p+5MBVuL4A4FjKhJPPrZdkZBy8qU9pc1byg9qHhGwbkgYSU0aG2MBDOwLPSY?=
 =?us-ascii?Q?AovhruZMwv+zU0cqwcyHcXIUFfS46cwFTTcsyc1bcG/4492RwwzqNjlKmNBo?=
 =?us-ascii?Q?hEIsbo7NxxXbYYpNxo4jTco2dGl68yl5DSabCQZ7gOyNsPL4kj2Zp7ZFH0S5?=
 =?us-ascii?Q?Yvgx6lmMcdnBvStfyTsuMU2CUEgQsNwnnpquAtHFWRs0o1pZOJGMiOayGBhQ?=
 =?us-ascii?Q?cBE+ZnR2W51gwCHZomUyCaUDJmXB6fQRyumw9zOoppExU7Aeej+lsFfgBqt8?=
 =?us-ascii?Q?LokO3RCKRPiJn7AAzOnUOgqEqcPhdxPMJ9v1TkkySnuiFhvWDPJNFBPqXqdl?=
 =?us-ascii?Q?HRB/+yraFTuTYEJe+JxD1wreCeJjoYbl6GRJyiDJAtYLfwd0YP6gcJ82c5vR?=
 =?us-ascii?Q?+0HrVdy3lRnLUBDQjj8FdUNj94IKQMv2VBXtdiGHDeGYOThxVEtkDbOCUFid?=
 =?us-ascii?Q?Xs+fOqH6Afsls1CiWVLsXmJxq5IWjzwo1VoEcW1hcShRmlT0HisXoe+ptlCM?=
 =?us-ascii?Q?wL7m1LMs9CX230zVr4Pb8jHWUdoMJED65741a4WHpstgWl92kBeaE9JTsk2H?=
 =?us-ascii?Q?r74i1rLR+FtrWxSlqQjSo3ZEgEEbhVlmzqh7Jd9oqrOoPfaEllbHC1AmpXfN?=
 =?us-ascii?Q?d+8B8A9Sy83lDZPpFTKBmV/rX3+6b3fxGBSAFtoN1DORvPKnIa8yJ1lUxb4R?=
 =?us-ascii?Q?iO9l912egP3jbueAys10mc8gUNb889QH+lE4TBIbDx/lC13Z0JhsWF1dC98O?=
 =?us-ascii?Q?+AjsiyaihQhgyAWHNQYGyDIuSngTdZR/HoJUAd8lTlfblyQ3t7Pm+8LEgKT4?=
 =?us-ascii?Q?yrjKHnKbcqMk5bn8VNiQpeU2m4G1NKOu5XlG1pA1qtkuafHhiaMTqizNjG50?=
 =?us-ascii?Q?ho/ndrnl189+KiFh/wIAklazp2fSk2lIalPDEknG19AxY4DaBV8+WGL5q9qa?=
 =?us-ascii?Q?BMokQvAmoxmyyYpI65Ktf5LkOfqikQy8/NMW9NTBfRkOomBSqYJIC5HcGsmB?=
 =?us-ascii?Q?GhvdeyHhi06OZMFqD77hU3qmLU2xsXXEiTcIdcBYy7ZvytbT4cSYUYPF4qgS?=
 =?us-ascii?Q?242OwqBJ8WIhT5aea9yM/o4etY0i4SUPIQYC850LUUYQsCVMy3fhsRnZhr+f?=
 =?us-ascii?Q?Al4PFuC/LM8ZpeHSomo2T3fn4uEgopeaP1eXvNGTEjvgCOaS3AaFO7XQX5mN?=
 =?us-ascii?Q?143KnQuVtuGh+PCvDaAhjXV/yrkDDIkpFCGyrLufMPnQl2rT6uJUepxkUheK?=
 =?us-ascii?Q?hc7WwEycmMctxraGYa9qH7vEYSLrWPUyI300BWGUNlVGomOWytO8RlIGoQkQ?=
 =?us-ascii?Q?rm2BQh69Eyn/EQ+BuHa0IYXH78yelgYkYD7UZhesBRp3Rl9Zld0LS6aTzOGO?=
 =?us-ascii?Q?85IC5zXoCBaiy9MCr3iL2b4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?leABTiapmq/0gGGN7tR74K2VLlArsGffPeE3h6KF5MtN+J3QuGqh1/0IcY+O?=
 =?us-ascii?Q?6/9XmbjflvnjqiJ+nfdM17DTcmihewd+LwFybuAwbig8yEUB5Q4ygC53xp2w?=
 =?us-ascii?Q?kvB4xwVTb6GR8S28SGcjlMtn3lDbRYer8Ebxj9Wmx7NSH6kIt+NK6TB1Db4A?=
 =?us-ascii?Q?70zvBgJaXa0089P15Gp4M7l07QFwEEIndi1fXo7ySqk/10lXE6aB6lTcy8Op?=
 =?us-ascii?Q?Qs84UswEP1VJXn9PIN12Nf/Jbv3w2DyEdVdUl6p5AMXRU4QVbVsCDg3Kc1E0?=
 =?us-ascii?Q?0vIWkWWOfXif8Sp2eYRUwwLAlNAEPFseB8vBTefPZNAInhP9+TDZDfFThrxO?=
 =?us-ascii?Q?D69FZ2AcfZuWQiyo7cXlOnwCUwRxcnYHPvXx66bsbWJeEr1YCK3AFyeP7uPD?=
 =?us-ascii?Q?2gT5AuxQufGq8YiKYv4Le0GDQcbW7WHnYUrkaKTDL4iuFGBuWYuOO15XHKUR?=
 =?us-ascii?Q?Q63vSVHqC1Emtce4U0jKcFvHyK3L1QxzQOAEECW28sa85tiQd4kL8myWoGjo?=
 =?us-ascii?Q?7ak1Qdk/Pn1Q0J3j1w94pTde9dHsGvOyWyERC5egYlIbecmK9FnuJdHkdV/l?=
 =?us-ascii?Q?JoTlttQ+rPXgRlcROVcn526HABuIVz6o3x6KZ5RjMDs5AFliWpeWEsh/Jj8h?=
 =?us-ascii?Q?LN5Sibb7kszs8aFP9f2+gQ3zn65YyfwiGFShMKx/XPRrCoAap+rmPPBidcaU?=
 =?us-ascii?Q?4kVBmelWPhDjj3p+BJuS/D03OCfFZvahVxCq+IDZmkqCuV4KDqnmwbgY7n9I?=
 =?us-ascii?Q?zRq/iw6YHGA3fIhlDSP2Fn7bzgHIhUnO29MU+ZXJoRehU2JiEk4nPQdVu5Dy?=
 =?us-ascii?Q?iRQ/S3XgKcgQqPBSKVKzGSRnReryX0zYiZObV3gadf/ZgJjfS1WEwHm1R4N8?=
 =?us-ascii?Q?1nI62ZTN+Lbc1ITOPYe1sid4toWJLM2CsQ4AoixwvBORgPNGPZbjUlPLOnMx?=
 =?us-ascii?Q?jEmXTD8JXpQparBp/ndjq26Dh+cYFtZkxhobDljehoOu/h9sMS+KGU5lesZy?=
 =?us-ascii?Q?x9fosYFyEvUiMVdVJup5gDi7D4YCG1oR3/ylIguG9i5XHSv3FwQHLTTUftb+?=
 =?us-ascii?Q?x352IIKgQZszPB4urB75jY58GbaJs7g6paE5iWtIinuf4ZWkpupNCAoKL1ab?=
 =?us-ascii?Q?IGH5saMIN5ULsOamCCGv5q8/CW1eioeOeVmVYrsv28qFl9KkB3RdO975GbLD?=
 =?us-ascii?Q?tgaZ622pUae5b40IlW8WDPmOZFLOAyjFqRPKbP0EMBdROKnyxJWGw+VfBsAy?=
 =?us-ascii?Q?F2+po1H1SMxiozx0+QuKg4Cv4nZCXwgC3UATVFriKpXiLfyj6928Oz5RYiiC?=
 =?us-ascii?Q?iXSQ+Jr/IoqspkFQpMkWE6wzS0URHDC8jTCKdBSpFaf4tfnsMUWK47EyWzwB?=
 =?us-ascii?Q?6VxnMED12O3VH3KTDuA1VbbyTQ61+kEeo2uo++CV1bms64hMSBRu5FXrPzIU?=
 =?us-ascii?Q?O8w0/Y1Oe4261c9P6BOrBhAshMmm+vsHaXiYPQmybYmNM2dmxT+k1sU7MqD4?=
 =?us-ascii?Q?wvf8SVsSpaedKWJlMSOsEBpFdfNjssLwUWxXJmdAY0i+EcpzSOH+XNKaaaaa?=
 =?us-ascii?Q?goqJgatE6dhHwpDFLYGL7tsuOA1+Z+Sp+2cRSvePU9heoAoxEIUoIAMK+N5s?=
 =?us-ascii?Q?Xvoj68NwVFwSIE5HRfXxampZd0iOU0aj8bGJ1F2kvlv8LS4C4/CvBPsvuygX?=
 =?us-ascii?Q?4DBeoKAwhvtYIGQ/MaeAeDdRrz0+EDL/wwgfqzxk3g0elYGVyQVTU0RhlnEg?=
 =?us-ascii?Q?qE+i+WDJ0Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd5d1b3-69bc-4b5e-c220-08de59822bd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 06:47:54.9045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sh2BH4eWIlztkCvRHiPFlMhnAeT2thQ/u3w3pEqR3rwECPYf1TAMhDDM++75p00AeTXIZNB8mrWvbrtmbHJUCfXR6+MEFvgk9mxpx77C+Ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
X-OriginatorOrg: intel.com

Hi Andrew, Zishun Yi,

> Subject: Re: [PATCH v1] selftests: udmabuf: fix hugepage size calculation
>=20
> On Sun, 18 Jan 2026 21:51:26 +0800 zishun yi <zishun.yi.dev@gmail.com>
> wrote:
>=20
> > udmabuf's test 6 and 7 is intended to verify the behavior of 2MB huge
> pages migration,
> > but the helper function still calculates the size using standard (4KB)
> pages.
This behavior is intentional given that a udmabuf is often created for memf=
d
ranges that do not coincide with huge page (size) boundaries. In other word=
s,
udmabuf is not always populated with full huge pages. Instead, the ranges
mostly align with regular 4K sized page boundaries (which means subpages of
huge page), which is exactly what the tests verify.

> >
>=20
> lgtm.  Vivek, can you please check it?  Feel free to merge into another
> tree and I'll drop the mm.git ccopy.
I think you can go ahead and drop it as this patch is not fixing a bug but =
is
modifying the tests' behavior to create the udmabuf with huge page sized
chunks which, although not wrong, but is not the intended objective for the
given tests.

Thanks,
Vivek

>=20
> > --- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> > +++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> > @@ -69,7 +69,7 @@ static int create_udmabuf_list(int devfd, int
> memfd, off64_t memfd_size)
> >  	for (i =3D 0; i < NUM_ENTRIES; i++) {
> >  		list->list[i].memfd  =3D memfd;
> >  		list->list[i].offset =3D i * (memfd_size / NUM_ENTRIES);
> > -		list->list[i].size   =3D getpagesize() * NUM_PAGES;
> > +		list->list[i].size   =3D page_size * NUM_PAGES;
> >  	}
> >
> >  	list->count =3D NUM_ENTRIES;
> > @@ -115,8 +115,8 @@ static int compare_chunks(void *addr1, void
> *addr2, off64_t memfd_size)
> >  	while (i < NUM_ENTRIES) {
> >  		off =3D i * (memfd_size / NUM_ENTRIES);
> >  		for (j =3D 0; j < NUM_PAGES; j++, k++) {
> > -			char1 =3D *((char *)addr1 + off + (j * getpagesize()));
> > -			char2 =3D *((char *)addr2 + (k * getpagesize()));
> > +			char1 =3D *((char *)addr1 + off + (j * page_size));
> > +			char2 =3D *((char *)addr2 + (k * page_size));
> >  			if (char1 !=3D char2) {
> >  				ret =3D -1;
> >  				goto err;
> > @@ -126,7 +126,7 @@ static int compare_chunks(void *addr1, void
> *addr2, off64_t memfd_size)
> >  	}
> >  err:
> >  	munmap(addr1, memfd_size);
> > -	munmap(addr2, NUM_ENTRIES * NUM_PAGES * getpagesize());
> > +	munmap(addr2, NUM_ENTRIES * NUM_PAGES * page_size);
> >  	return ret;
> >  }
> >
> > @@ -240,7 +240,7 @@ int main(int argc, char *argv[])
> >  	addr1 =3D mmap_fd(memfd, size);
> >  	write_to_memfd(addr1, size, 'a');
> >  	buf =3D create_udmabuf_list(devfd, memfd, size);
> > -	addr2 =3D mmap_fd(buf, NUM_PAGES * NUM_ENTRIES *
> getpagesize());
> > +	addr2 =3D mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * page_size);
> >  	write_to_memfd(addr1, size, 'b');
> >  	ret =3D compare_chunks(addr1, addr2, size);
> >  	if (ret < 0)
> > @@ -256,7 +256,7 @@ int main(int argc, char *argv[])
> >  	size =3D MEMFD_SIZE * page_size;
> >  	memfd =3D create_memfd_with_seals(size, true);
> >  	buf =3D create_udmabuf_list(devfd, memfd, size);
> > -	addr2 =3D mmap_fd(buf, NUM_PAGES * NUM_ENTRIES *
> getpagesize());
> > +	addr2 =3D mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * page_size);
> >  	addr1 =3D mmap_fd(memfd, size);
> >  	write_to_memfd(addr1, size, 'a');
> >  	write_to_memfd(addr1, size, 'b');
> > --
> > 2.52.0

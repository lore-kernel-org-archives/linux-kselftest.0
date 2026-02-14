Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B16F57C9F;
	Sat, 14 Feb 2026 02:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771035966; cv=fail; b=IDKfmqyizou0GG2aPY2HgwIjDoUMxTRWSxKBA+9cu2BeFXkzIo++c0ckb5o7JjPnjCDeXqY3gTT0fYy8oks5NhttF0/c1Cyy9bTHN3tHJhNcH61RATfAfVm1vWFySqsE5tgLlMsaF73acvkj3FBdkydmFoLSi2VWsY30kkfSJg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771035966; c=relaxed/simple;
	bh=9UxEJPsk4lScmQJo9/sFa5OLkn28nmHJ9OaegX4Vz4E=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V/7KJoz9Z0sqXQTmBKGdYdBMWrxI0H5w9O2vy6HG8b+q+4+IHavQVBYymYzYzuA5n3Joy/aYcDlOvtBfaoAd9MMsGIA4AuUWU5W+mZLUT4kfPolAhmWUPdU2MVErmDoKA8Gusngie36OMFjqZL3Cxbn7h85v4k6pWZLE7X7Bews=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVjHCFMN; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVjHCFMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771035965; x=1802571965;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9UxEJPsk4lScmQJo9/sFa5OLkn28nmHJ9OaegX4Vz4E=;
  b=TVjHCFMNTQYaPNlDIXmbBDflClnHCZxaHuJvdkiQl5tS7tzKsBH/7vB5
   DTAr7lAehIZmIGYlEclboaYVgKwDglrPKWMHjq28O3S4ko1/VqyYfGb9o
   fu3RgIZSpYp0pYlfWT+fVZs5OcoHOLwssbnNjcSXBAYJUe0vO+KXP97zP
   FC1Z5Xd8YwKOY+vMGZRRpWECgxN3AQdi8gPQLydHq4fMlfotbmeQ0Mbv2
   MiFVWVD6hFiD0MfK9FA0aA7J0jo2N3kF7jpB6g2ODpkysv596SFSJleYq
   QNbB4GDE0UOzaGatyFeJFv94VzmBFNvGVBU44zKqef8TvcSXur67pnpMw
   A==;
X-CSE-ConnectionGUID: PfEDT30JR9y0Rd95/8NInA==
X-CSE-MsgGUID: kM/ZjrhbRy6zNSeDV/weXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82548597"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="82548597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 18:26:04 -0800
X-CSE-ConnectionGUID: NAMDbVCaTY+RumtylSEq2g==
X-CSE-MsgGUID: U26UZ/fJRpOsd/JxOo+Flg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212179365"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 18:26:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 18:26:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 18:26:03 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 18:26:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHl34f0rE1HmMAGYyrRUH69YUYFl3ALsQXG8JFcD2lFW+1/E8BFo4LYmCXmGYBMKKAOXNlxLwfURf/X0sdaz+oGyzRK/q/90bTwQLMaMOfhvz1Kx14sMw4vecfEPsQccme3+/F/7N8glRgSLdaVRB6/asuht00E2aq0j6Lje51qlNUB9AUhryKgM6VPKHUsBRmDddxOSFypQm9yVbvWy413EvJ5SaSb9oXdIkvpvzawaOOBtc13at7PAJ+sWxk8l8EqVP/W39o22CksW1g/gUUwkRusB3y8+2VWbhA/58y4dTp4kvZxdjHFQEehinoTa/rli0n+ERIQ/H2KdlCruhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hq5cTdgdEO8v2n5/eQMzNqSHGwSx1EGtQKKb1W0rl/Q=;
 b=f2kBX0vE2arBn7uQQM67KhpwitU+kmlNnMtbB4wTQ46UBimSP92ZonV5/vu9BeWPUeohgtfTeFvId9G3yc9WUWeSk5QFeOb5e0k0q6wyinXqlviAlzt1fi6eXmdahaDCa2pDToPefMPnbJqt8r2UX+NRRMnWHaFTaGccWED/IqwOM+z+9jb8WJHi/r28vHpKbjQWu6YdpOVEzUkvJfCFRvDJUeZ438CnRzHeeOXD6pEhAikE94F+of8rG6+Ij4oEAXlz2twoGHLmtf5RGrXL3jgRojndanJIDoX8h9gOBE/7jae2Rq3QGdoRzDd769rEZXKBtoC1dwu1j4Z+vPsN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Sat, 14 Feb
 2026 02:25:59 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 02:25:59 +0000
Date: Sat, 14 Feb 2026 10:25:45 +0800
From: Philip Li <philip.li@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: kernel test robot <lkp@intel.com>, Yuwen Chen <ywen.chen@foxmail.com>,
	<oe-kbuild-all@lists.linux.dev>, <akpm@linux-foundation.org>,
	<andrealmeid@igalia.com>, <bigeasy@linutronix.de>, <colin.i.king@gmail.com>,
	<dave@stgolabs.net>, <dvhart@infradead.org>, <edliaw@google.com>,
	<justinstitt@google.com>, <kernel-team@android.com>, <licayy@foxmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<luto@mit.edu>, <mingo@redhat.com>, <morbo@google.com>, <nathan@kernel.org>,
	<nick.desaulniers+lkml@gmail.com>, <peterz@infradead.org>,
	<shuah@kernel.org>, <usama.anjum@collabora.com>, <wakel@google.com>
Subject: Re: [PATCH] selftests/futex: fix incorrect result reporting of
 futex_wait test item
Message-ID: <aY/dKeRABv1uI6ZZ@rli9-mobl>
References: <tencent_7D6D776D157570FF8C9FB9DE9D9FE5257C0A@qq.com>
 <202602052333.1Bhrssu1-lkp@intel.com>
 <87fr7581we.ffs@tglx>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87fr7581we.ffs@tglx>
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|MW4PR11MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b18dac1-31e4-43d8-5afa-08de6b70640e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uIACdTBTreEk6mErm+ZyB4PQQokgl/lvNOOtAe+1zOh804H6swmDu2rWHFGt?=
 =?us-ascii?Q?bdLSegl8l+ZiE7rfhx4thERgugMSgL+PkOJAW1/N5R25EIH1CCbFo7cWm226?=
 =?us-ascii?Q?jo2j4sKPrjmvyFIqZ2F07Wn7WijnN4CZy5ILrg6uMyN0Z3DJdM9dq4Dgz5yL?=
 =?us-ascii?Q?M/u/wGezX5gPCi3arUvsbHPizANW7HEVmSRNWFUr1yTluip095lP55wrb2lv?=
 =?us-ascii?Q?k76nTXcZVhhMXTDtF74yinjkava9voALQDJKg/y0NzoNj7vHz+o5YIuhgEPJ?=
 =?us-ascii?Q?WYo5xgVHoWEELlkdsf3xxf9ms0Te86dwo/9fveMdODbsiQwmuD0ZK36mhxez?=
 =?us-ascii?Q?24/M8NsExHxZVb+XWG80s7XLzONmHKwWlIBD9sI2X3RAkAxInZI40JR2A3hI?=
 =?us-ascii?Q?/W6j+4cm993kTtWUfo5boKEZni69A4k+uFAOlzY0ZSztdBpn074OV0Zoaqbh?=
 =?us-ascii?Q?bqQ6zJzv9P9Dht2Nd7yxwmLoQvVYDhPf1YPVTcu+8GX146VwWdO0Ee1ExgUH?=
 =?us-ascii?Q?6UkxkJzIDDu9mM7QZUr+RdZPG725RabbY4oPy3DkiKLZiYoA7+g5H40j4uD/?=
 =?us-ascii?Q?FpCyTiOX/eIQ5BH3YHWsNarjPxmAJ3SPEjmuPh/dOTB7klrkb4/AvPgQKn5o?=
 =?us-ascii?Q?H2giY9fY/B/8692tIAXuNfHoWRNkB5BYw4mLoQokfwc+INRJCcW+qUeiUiQd?=
 =?us-ascii?Q?LOzSSKSJfKHIn6X/pzLK9/85A/nnG3akQhL2Dz5GrbAVaageZhJ8xAV/vHvk?=
 =?us-ascii?Q?RebnvCy88SM7SQZcxNIOqwzKbprOQ+Wi1RYwa+hAFFLOHCeV31x0AXn4SPC2?=
 =?us-ascii?Q?S03dWwxPco46hEmGUnot08n0+gPMDhhHNqN3XKXEnPy7D33bGyxPR6g3EEq6?=
 =?us-ascii?Q?n7fdGmvZlgvhDIJVi1nWQWA5oTVtTjGVGvcjBG33urltydrdKIoYf9oOU4VK?=
 =?us-ascii?Q?XP3hVtQHUNxojDEOaYTq3cCsCeo4LqrbeSbflYXg/BMyNaATxs/S/1ObPqTF?=
 =?us-ascii?Q?1PjwUfwdjAa0x/60UsooDR9X3WI/f4gIpNlBV4tSKVVx2mBBz0lKxmjxCIwF?=
 =?us-ascii?Q?KsMUKZ5a391Lpw+D840erAbqr3YmA16psHMyVcDUAtR1jSfKwGRkerv1O57L?=
 =?us-ascii?Q?6BIUftKQVhWGM/OJblcoG7YsI2txVV/3cCTyJSdCxobqZ131/v0DoIQzusb6?=
 =?us-ascii?Q?DV3GS6uSOwADU1ijaDF68sdaX2me5+alqznFkNpPk46SsRo0k9Skm1hhX9OB?=
 =?us-ascii?Q?H2leOnWfgVIka+Gkge6ReQXEoGCxQb/fgZxZCxPrgUN3qr/k4s6Sxb3x8vjZ?=
 =?us-ascii?Q?VsnshqnLU9RtshMc+xSbSap0iSSBjHBixyat829y6wa+TF6KmOvg07gc+Xm+?=
 =?us-ascii?Q?2wzZ6tlB5tg6FqRDoLlYcAYOmNx9V3oCfkokCnQ+tWcduouQU1gkJwAkSzZ8?=
 =?us-ascii?Q?ipCmca4rRJzsxyOBfZERmCFVWyKPCuIKkKv8v/hb/603nBB7u37O0vjX5AC8?=
 =?us-ascii?Q?IW2e8ul4vBJHFhRpvj5ZDr2LHaevoyH0ZyJNeYQvnxsAYJhacv7JTwnTe2pm?=
 =?us-ascii?Q?PzBFvPsAV5vGY6aGpEQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?abcoWO2oBPe9UjFhwEsSvzGBm3urGEMQESg3ANo15nXrwiv+GuyNJp9KA8R1?=
 =?us-ascii?Q?aqZLYMCIx4/rtOkHrJ1fgx+7ute20fE8KAtZDzuVOO7tb4ahYMK5xD6NUpVP?=
 =?us-ascii?Q?3PuIrnpmwPq3CJYZW5OHTswY4vH0WyPlyOZKi3xcTwo22rOEsr7IIao4uGCO?=
 =?us-ascii?Q?lFGeBZMWDrnaZOBbfR5CxmcDQGfQ3GsfUxMAzVtl3wVk7vO5m/55L07HHF4y?=
 =?us-ascii?Q?DaqZuJMXMSXlfXRY/Tax/mC4GkzsyzrS7FqwUGez/fSIytDT8LQYHocXVWls?=
 =?us-ascii?Q?C3JvFDk3fo4Yhwnnu4OXfJyookNUXK39D4SBeAlFMPqjVNMZxm9MFFAxFJFN?=
 =?us-ascii?Q?RzOKQBfH9nkJqH/lPkUY0hlHijzMEa84ev+kG7LPWaapaRxn+L9FTGOjymsH?=
 =?us-ascii?Q?mB68oVqTDg3DFvGYZr/G2So1/dAzuXlJCgiStCT6SHX0mDNK3vZzvt7zj86h?=
 =?us-ascii?Q?+ayRcWibmP2+Bp85IrEZDQqkpp2RQIhNbWyZvnLHAoB3+bZF3YOJkmI6dDW2?=
 =?us-ascii?Q?WgUPni59F+y0OchKdGX8/OHQR1tzRxHmkM7pD6mD8YgSzRn5S1elzZjWiI6Y?=
 =?us-ascii?Q?KDtXzs6SBYBDsVWjNro2+EVlD521pFiYZwRzSCTu+2XYA0Kqrr2XbHBCy3RY?=
 =?us-ascii?Q?RiNqYiSHx2LaJNuzLAFjff4/7i9pxxph743UfvuW2H0/OXTIR74SKZyezAYL?=
 =?us-ascii?Q?RE00it6jS4A6LkYNt5IqwB5Swbd9r1xbrY5FuGnJv3lyKnjEzQdkN2l7PsXA?=
 =?us-ascii?Q?J7JYI/qwP/ZXDa4BTt35liv7wSGGf5FMIgam6rBt207dn0JVCcLJtJge/fZL?=
 =?us-ascii?Q?WhiNqWXQlRGIKRM32J7UnBBc6+UjIjtZGqSw9MaOB33XSlIPB0BZVB4MvqPb?=
 =?us-ascii?Q?3W58tFmAr54NBY+9Lv+0JFvLljSrC59+XipkE306SMbsAdiOoIiYFW3RyG+Z?=
 =?us-ascii?Q?8kZkMZHbbBDVTd9oNZAZK/qH/ZOdnhYlkHinYobOf2jFClsNnGj6KgvZurf1?=
 =?us-ascii?Q?w38N5prkxwgZypppPrb0Wp9K4X6IzPc+VyK2tiNt3Oa2udRERaYJsVpfTHo8?=
 =?us-ascii?Q?DZ/tGDrtnOMT+U2LBuzxFgL4UH4PJL5U+GL1Aj9bTZ+eaXUd4MDDwmiKlagn?=
 =?us-ascii?Q?iws4P1czmPcQodBQhnloGUl73Yl4wfLcIMXiwQncBCi1LIw27qdiI1zdsq7w?=
 =?us-ascii?Q?KNelR5ZnkSikk3+s7MGVbsLQMY6GNmQMdUxFZYH0CN3zKRYiCFMA8mHAM/t6?=
 =?us-ascii?Q?DXCGJfhQpnVdfcoWxZhjM702UjefljzjInoZ0g/k1W79zzqWOzLn/VF0HX7n?=
 =?us-ascii?Q?R8T7Hqmme3dIVaUeZScr3LBtFwFaRiPUIrSHZ9EST/lbnoiDyTxYRYxUAKFX?=
 =?us-ascii?Q?WKto7h/dKAJ15lC/5lWCMSsnhSu7sZMgfPJbeDsvUKXjjakCeBYx5QJ6mgSJ?=
 =?us-ascii?Q?t1jF6on0TV80WdMSR7YnOID9Hz2Bax1H7DjulXJmsbuC6moAErcgrDjv52LZ?=
 =?us-ascii?Q?ec66Toxn+beTtGGX6ZhSpzxQ/PutbXM4pNiFfh7YwIkQcvLMSuyjTrDXZ0ov?=
 =?us-ascii?Q?Ny6M5Ws+j6FC+MCPsBVvO4E6BDFNHzkNIFsfqITR0Q4tSFdF0VAGMc4OQwtK?=
 =?us-ascii?Q?h2aCIUYm6nI/VPjQU2OVg6aBWfuN+DeUdyC1HLPgGd2Qnsrf9+5pURYlfLWc?=
 =?us-ascii?Q?gnao3Xj+r6IN5kZKgpjNRXjoFS8i5CM4gUU31DdKopJwIa/kkJjxRL0qu87t?=
 =?us-ascii?Q?tRweoEwd9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b18dac1-31e4-43d8-5afa-08de6b70640e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 02:25:59.5912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6t3i9wOSXBXKKuIP6Xn3L0u4H6WR1iiUiI88wCyp3+G4DFpYttyJeuFguF7cIqq1lZvgoPzGByyc+Wsh8woWhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
X-OriginatorOrg: intel.com

On Fri, Feb 13, 2026 at 09:48:33AM +0100, Thomas Gleixner wrote:
> On Thu, Feb 05 2026 at 23:29, kernel test robot wrote:
> 
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> 
> >>> futex_wait.c:48:2: warning: format specifies type 'uintmax_t' (aka 'unsigned long') but the argument has type 'uintmax_t' (aka 'unsigned long long') [-Wformat]
> 
> Priceless. Your compiler can't make it's mind up.
> 
> uintmax_t is defined by the compiler provided includes.

Got it, sorry for the false report, the cross compiling env in 0day is not set
correctly when building the user space kselftest, I will investigate and fix it
in earliest time.

> 
> Thanks,
> 
>         tglx
> 

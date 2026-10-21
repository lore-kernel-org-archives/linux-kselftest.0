Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792594595;
	b=ZTaBNkMvlBg7LGP9oNLx7qn+3/lyDNCfYOFK6pNhZT9FMsbZv7JkIk3i9r6D52GzLnQo
	 yNXM5oDcs829KIV5eeSZdI6WqZHmm07CFOtYIltZWV06aUWMl1+hsJuZ7ahGY/JLuAjSc
	 u/0G7few53ZyGwSBm4ux+rrgUKlbda4WSBUjaHr0d6cOgjodBdF6AblrUZEZPOhZmhl67
	 GdSoievxIlSvwRdbQo+NvTEPKoIT/2vtUtJX+G9Zlw57kTEXFOYuOfAAm+kw0OsM/lwb/
	 xsrSucYcLccC+KJe7bzE26vE4L4il8VCYWFqbbDKo/pozvHz1TgpT/SDIVW0uCwSE4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594595;
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
	bh=V6V/IX0Tt0iZMdm/Q7FZynBqpCJZO9l993iW+tEIVd0=;
	b=moNHhsUlLaIPQTcv32LPhtywjdoYwXuSHxv2npC/eursY4IJklvjRK2iz/qCfiku/vR4
	 lfXoS2jdv6m90texOjGkj992veULZEu84nrjxMAZioKRs3gmbN2ylZrwDOA10WkWTEL0k
	 LLe5ulueT+WZHkBesgjOaKTodyeyuV+aDWE0GN+ITYBvFJ11yB9D4gjkyTDPE+4iSVK6l
	 IxmAKxHBSBkNXqWVDzNiVh+EQ+HI//3HjBP/aQAjEqqK2hRTivTtWGp35gPvfuI5HNy0c
	 grqhzi6uKCHuG1aq2jn18IpooHxX10MtwsLa2aF3UMcaSi4LBAAUWOjOB3XrVOgnAdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W6DU5vNR;
	arc=fail smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB7606A32D;
	Wed, 21 Oct 2026 14:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CB7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W6DU5vNR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792594594; x=1824130594;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jmibhyZM5V8g64hw71DNVgwLTP1wIqDY72I5GKF+DIk=;
  b=W6DU5vNRh8ahGEJtb+OTHnO/1v/dRFAuu5jgXANFFwbuuiruZgFPJN/x
   zQFF0oWd/yjjCA1/w9FfpqpJVsKIlPRajTMWRFsVC1uQmjJrpltGAaBcB
   va39Q5PWL3xRSE7vH5+eTYFN5TRqNrkRDq7s2XS/fDAzSLuRVH/kkdV5c
   XHMCdkq5l1iMY375Jxs49xgTLWrEUNsjy5CknbUVAiF1+wJdLjZzKVOI8
   cEY3+Zc0vRgFXSAA3giDIO8m1qe3oB8DfFjBsmlbZM/otqHli8VoSfMs0
   RSZw70H1jpi/0e4v3mWk1AUa7FoGhvGzlNh3xYxCxryzd3Ll3tjvZH5/a
   Q==;
X-CSE-ConnectionGUID: 8gnELKZwRym/PPDTtK+96A==
X-CSE-MsgGUID: pl7DFT09RQu61p2mHXqKbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1197312"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1197312"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:56:33 -0700
X-CSE-ConnectionGUID: qMc45jxHSpqfz8OJX1dQNQ==
X-CSE-MsgGUID: 9iI7F3/sRG6ub17Yllrjnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3058862"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:56:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 07:56:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 07:56:33 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 07:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDXtcBvHoGiTm65BEdL/7N7D17srrEoWmtlOG+dU9Ow/G+pYGULP6U3fh8oAn3BkOSG4WiaTOfaOBcKaVq8pmfxvo4XxA6ezIk+UZpX6HQkBY0rP87I2lfeavkP53wgQzWEktEGccLPb6nZJcCTvfe5YtthGiqcc1U61TG1d/YFJW1sCXbVLia7RNQYT29ZbX4EJG6yD731iu/d8Pbv7KOkywPI03fGgX+6GWXwL6c8I4tUZeqpOhVY5nFwazJKwotlCOjX4ngPjCd56G467VoLW2LTMX+ek9VHJfXAF5L32W4B6WxkbM4pbv/Gt6arHA7eGyqT6cmTZ7g4dnLVHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6V/IX0Tt0iZMdm/Q7FZynBqpCJZO9l993iW+tEIVd0=;
 b=Bi02EOIGfKY21nt2gKwmqYITp07pyG5MYZ5LPrtTUvx0c08ZlQKQrLhlKLRDViwXmn8b0lzVCz7HrUM+7GU3ggviRI7g2VJqySwuNIzb5k/HS1dx8kEaFr83QMlWsOSBotDjsH09pOAgUMhTEpPKDd+UJoEqXH49Q0fGahSefKrGuX1jToI5VEQHy+gBekVHAjjpD489qRBSnyqIH4KDum92KMlJ8dEQym+oy4S+llOo/smr9XEMn4M0WO0+kdypYqNqjyA57QxmdnI2DPtMXvMcob9lFfnflt9HlBVQcqFgJBl5Y0OgrQvJFsHqT5432HzTIlVdRTNpg/hUgdZmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ5PPFEF62BB3A3.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:56:22 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 14:56:21 +0000
Message-ID: <801eeed4-6c31-40e7-8cfa-279d0740aa98@intel.com>
Date: Wed, 21 Oct 2026 07:56:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] selftests/resctrl: Recognise aarch64 as a vendor
 for L3_NONCONT_CAT
To: Ben Horgan <ben.horgan@arm.com>, Richard Cheng <icheng@nvidia.com>,
	<tony.luck@intel.com>, <x86@kernel.org>, <shuah@kernel.org>,
	<fenghuay@nvidia.com>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<kaihengf@nvidia.com>, <kobak@nvidia.com>, <newtonl@nvidia.com>,
	<kristinc@nvidia.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-3-icheng@nvidia.com>
 <415d1bf3-342d-45b5-b31e-ddc654510d85@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <415d1bf3-342d-45b5-b31e-ddc654510d85@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0204.namprd04.prod.outlook.com
 (2603:10b6:303:86::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ5PPFEF62BB3A3:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c7fceb-0cdd-4f10-46f0-08df2f837852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|7416014|6133799003|10067099003|22082099003|18002099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: Y1iGTslxk3/Ep1tgGd/8nWFBeEYI9hqkNJtsTV0K/XlKKNWhJ3VktkcbnUIhUCD5PBUBWE5GZtMEim6kKJoeiB/QFhXATOt5iNiqnHOmVEGiW9+MeGhBSCROaQjV8v/T3uDVJYEHgLijNwqiVFdDbWxElChsyLGIJ9B8gbvHkXfJhrxYH/NlQyFEy5mOW1njurdTUgNFjKyQXbg5QqM9kNkDjNEJ9U5ZGqB1l8DXrUNSmK+LWBDPBKx7LQB2AejWxEAmTixC6SGlCNHcaTZTvEAPIam13MZduO4W5mp4pXzoxKNmeIFXph3WrwZc0khFSpNuWbHGahNkWS/cb++fxZDcNGLZfSoh2YlnvsDkb/oewYGEMMN11g4qex94PmVLCiLMZ+4tEM3nqwuZAm+PVzDmdX4mGX4fRGqFuBFRxyL7Ry0R5jYtOD7X6ET0xLPYowvXe0BSQ6iH2XiSID03r1h3hKLNIEyJfXz3MXUjpOM1+IwdBVrLsmigQRfzg+LVysskqDJTZ7BN9fiIBeDaT5wRJxyMeMqCtr+UE5zk+H2k+kjV2YBFYzkbWyC+p0QxG10I0Wr9vfKGfJlfoplNq/z3iey51MZaCZxMTo4zgRPwXMPLxJ/TjE8gP7MinO9pjLdaVIwCDIPfBziyL1tuXvFVNnmUDlifm4lKIL2h0gI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(7416014)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hWMDM0ZmczZmxRcDYwTUFGcnBZeFkwYSt6bEJqTldnek9sc3M3U1FMamhm?=
 =?utf-8?B?VUdta1VhWGpOa1RjNU80TklDc3dLbmlOczdqMVJad3FYV05WUWZoYUUxaERV?=
 =?utf-8?B?ZGdUejhBL3N0U3k3aElBeEdZZHR0eWRtQXBhR1hqVis0elJLdWtrSENxRDJE?=
 =?utf-8?B?a210M0dBcmNXUHNhYUxhZTROblZCMDRtdldOWUt5MFc4SFEzb0ptMHZYNjFB?=
 =?utf-8?B?QXB3SmhtaU1IQlhxUTZ6OW5mRkkwVkZCbEM3WmUwQUNXN01BQVdaYjBwOHV6?=
 =?utf-8?B?bHRtN3FZeTFiQkVFS1ZqMlpNUjNjRHlRM1VydTBaSTlrdldUc0ZrUG9UZ3lE?=
 =?utf-8?B?OVlPTWpJWUkxOC9JandjczlrcHVkcm94S2NBVGt5K2RQem9TWCtiYzU4cm0z?=
 =?utf-8?B?bTUvYksxb3p3VmN3OEpBY015VUhVQnkxdnhwVDBrNi9KU0xuVlphQ3J6L2lF?=
 =?utf-8?B?a1ZDQWR1dmZrVXFROEJYRnljT09DbDVkb2NrU20zemhXT1Fwa3FrR3A4Tmx6?=
 =?utf-8?B?cDlBRU1WUHBKZ1Q4K3dTVGNMampMZnJmWFFuSzlweW1HNkcxSVl1VzdoY1Nj?=
 =?utf-8?B?dXlPZ20wdVdqK2xkM0dnNDRKVy9wdm1VQzloQWhQY01WVi9JV3RqRk1OREZV?=
 =?utf-8?B?UHVuY3Jyc3hhMFVTRHo4dSs2UTNCVWRkOWR1VndNZU8vOE5RdUNEWlBUNVVM?=
 =?utf-8?B?bUMwek93RnlxRmRJWVd5c0NnTVVGVFBSRXZrZ3JEakg5UXlFVVl6aHVxdGZQ?=
 =?utf-8?B?azRSL25FaWRIbm4yM0N5RWwxcG1vTEZlT1FUSTlxMFJEMzIwZjI4VW0zQmdx?=
 =?utf-8?B?Sk1JRy9wMmY4RUNzaDYxMzRISUhSdzFHRWttWDJIZE9xREZ3SmxyaGZOa2NR?=
 =?utf-8?B?Uy9wbVBHWXBJT05PVDcxNUZXQlN1aHBsb2QrTGFKMjdIcWVHcTBvcmkzd2ZO?=
 =?utf-8?B?R2dFZDVyOUoyY1JHektwVkZvRUdXYXdadWU4NjZzQzNrTEwyQnYrQVV4SENV?=
 =?utf-8?B?a3dUS1lCcS9YYTBpOGtSS0lzZEVPWmtzVS9Db0JKNEdWaEs4SndURjV6M2tu?=
 =?utf-8?B?UGs4eEdIZWhzL0ZEOFZrL3lWTGUwa0drS0M2bDM1SVNPZmpORjIzS1lvbkpz?=
 =?utf-8?B?eDlIcGFqd0QrTTJ2V2d6VHkzdUQ2M1krTy9qcjhGRkdzWnZscGlIaFVuMG0z?=
 =?utf-8?B?Y2VrSGxoOHFMdjdlTW5XZm11cjJGd1praVVTK2gxcE13L1B4SXE5U0NrMU1C?=
 =?utf-8?B?VW1uT0RTallWK0dFSlh2Q2xUeVg5bG5Hb1UySG9LVnhyaUY1LytQQm1qQ05N?=
 =?utf-8?B?SnVORzYvNFo5cytWVktyZlJEQUpkbHZRQ1UxcVB3aWd0V1dRVUVodkFTQUc3?=
 =?utf-8?B?UEZoYVNSbEtCK3JySGhhNlkxb1FGbVFabVRXZVIvNVZ5OE5lNFdwTkZveld4?=
 =?utf-8?B?Wm9NNVlkRFAzMjVmbEdMTXlmdnUrOWdyTFo3L1pLa2E5ZC9adWZQajV5Zlhu?=
 =?utf-8?B?R0MwaURWeXNyTVNEMVFsTmRUYmdCQ3dobFdUOUptZmJVMVl2R1V1azJrclN3?=
 =?utf-8?B?SjdEMmNXUlRhRmhNeHY3dEJkcy9TQmlIek9NaVVVL0YxbHQ2WFZnOEdvWkxD?=
 =?utf-8?B?UWR6aVdHQVFyM1NFSVUyVHdHbWVNUzZlbU43ajZ0OURyejliMWM3RTFhY2ZG?=
 =?utf-8?B?Rys2OVdHaGdOYnR3YTZoTWYrOHNUcVhYWFpjUXRBVTNueWx5elphSHVnQjJq?=
 =?utf-8?B?WlMwTjdaaGJ1NnBvTEkwNS9WWjlsVnQ3c3NMb2JrVGo4TXZhRHcxYWFTRklD?=
 =?utf-8?B?WjZZdll0R0J6T1B0U0RrdkRKU2xsSU96SXlSTnFXdW93cTh4U25RTUlFODRN?=
 =?utf-8?B?ZWJEeTM2MWZadFk4RVVQbXBOUHpaUis4RFVxbHp3dkJKYnlRY0R2b0RSZGp3?=
 =?utf-8?B?QlhKRnJMUGhHNzdER1FFWElqMUQ3Y0xCUmJjdDZyaHo2bUkrOVc3d0VsOTJ3?=
 =?utf-8?B?TFdRakV0UGl0OTBJclNIOWllRk5jakY1UEhjcWh6QVIxWk1aZjM5KzU4emZq?=
 =?utf-8?B?algraTlEK3BUTW51MklETlZOUWZRMDZ2T21JVzkwM0JGWXljY0dRNiswakZ4?=
 =?utf-8?B?Q2YzWHNJYmQ1aWNYaXM2SVNYUWIyUXN1Qm5pQi9Fb1ZOc1l0WkJVQ1FUYldm?=
 =?utf-8?B?RnBjZzh4ZHZSV0F0bFJBazRYb25BSk9SRGxhM2FDcnQ3SzlVek9YUFN1bFFP?=
 =?utf-8?B?Si9SMmZHS3VQdlBmWTUrWUFTdDhacU9mN0NuT0tiTEtrOWNybnJoczNvNFlF?=
 =?utf-8?B?VThORWFLU0tQY09QYy9SR0hXZ3FlbjBpb2ZFZnY0a0E0RHhkODVnTDFlVGd6?=
 =?utf-8?Q?0zq0EPxuj6Gg1oKU=3D?=
X-Exchange-RoutingPolicyChecked: DtWatimAp1Ed9iGv7q+G2bJ2VhTkupDdKRnQDmINxwc/3Fj1g/+qSqoypBUrD0djzUh5o/qbGhl70agI42b5j+Wxy6kEPzJrssaRHe0MmaqZmsYkJdJub2i2pVPVveXNE9uppMsxakg+OMjoGcKeRdCAJtTpF3binyRVH7hY/zlsEKPQFQEx7LBP1FWelXgETurd35h6OKjGjy9AilsHXuobV8T1AG84zEvJMbQAH3ExA22uc1HLI9IptD8d24qhC7pyMb4mDg7orTGnS/WmcUIYQKpqpiNhJWllp6+0VucxLwzB1wI0iGA2GPoq7ei7BqGHZUDYGX/gHJ+DRBDAMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c7fceb-0cdd-4f10-46f0-08df2f837852
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:56:21.7282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWYqeauSgYlkV/5g59BHsvnFA62C4WxpCFzjP4ZEJorWM/4zPy89NwDNqfjQe1cfK6SfnEhvsBXytJhBeBjwE3d3NseOtE7PhCjBl8ShACE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEF62BB3A3
X-OriginatorOrg: intel.com

Hi Ben,

On 10/20/26 9:18 AM, Ben Horgan wrote:
> On 12/10/2026 08:47, Richard Cheng wrote:

>> diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
>> index 0a417267dd74..f4b02b3eedd7 100644
>> --- a/tools/testing/selftests/resctrl/cat_test.c
>> +++ b/tools/testing/selftests/resctrl/cat_test.c
>> @@ -271,8 +271,13 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
>>  {
>>  	unsigned int vendor_id = get_vendor();
>>  
>> -	/* AMD and Hygon always support non-contiguous CBM. */
>> -	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
>> +	/*
>> +	 * AMD and Hygon always support non-contiguous CBM. ARM/MPAM defines
>> +	 * MPAMCFG_CPBM as a bitmap with no contiguity constraint per ARM
>> +	 * DDI 0598.
>> +	 */
>> +	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON ||
>> +	    vendor_id == ARCH_ARM)
>>  		return true;
> 
> Would it be better not to just to use the information resctrl advertises?
> /sys/fs/resctrl/info/L3/sparse_masks

The result of this architecture specific test is used to validate that 
/sys/fs/resctrl/info/L3/sparse_masks provides accurate information.

This test was originally developed on Intel where support for
sparse masks need to be discovered from the hardware. 

> 
> Is there any reason this test doesn't use that other than being written before its introduction?
Reinette

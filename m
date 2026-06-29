Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CC1BA45;
	Mon, 29 Jun 2026 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769570; cv=fail; b=BgQqEhwuv5T84C9LbHEH6exTUO5DTaXs5UwKyastiFQiw01snitXuLn/B9bhWLqenjywFHI9WN8cgpV7ZGO+RjbiatzDvGqhiPNYbqRXFyE1ECanrVaDI4M6QAxeP0BU1LvMHeY1DVM/GPPXWBgp2pg9w1GIHVg0kjUFhJ+NyoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769570; c=relaxed/simple;
	bh=PH261inkexFfjkGOmyAmE22pudBTy2blJxFd8Esh2Ms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XGvRcYurFF1cjwcTcYN/0HL/T/DngVEMFYN0Q7/VFtzwktJNNujwi266lcJ81pg6/xbq9dgoDJ2mmJ8mqhg3wCsbIoxf7BmuRdsFPDMWVkUNn6mlZOaZTGwlCX5HzyyLFJ0b4NNwy2J2YziHCSWI1JinuBc/Cjr8FK+FmzSj7XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dX/WUKxi; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dX/WUKxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782769569; x=1814305569;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PH261inkexFfjkGOmyAmE22pudBTy2blJxFd8Esh2Ms=;
  b=dX/WUKxiGL//Iz0fU0U+RW+m7jzT9yGeT6jV/NrkaFw435xCu9MmHrOn
   7DSUyb2fVM0m+Sfa16jr0oP0g/B3TgDadL4X/u4vvanD+ydyQIenCvGUJ
   lKHsPGpQfhlrXEZ+dIdZDk+zQm5ezcG22P7honD5qe7yBuuApanFaYJhJ
   8iupZMZsfjpbij8dPpHAQBuUIu0Ol4G1rTI404kp6Arm+EPQRRxsHcCLo
   Ml5UprmKYe1LPGHFtPQD7wjah6aCDsJsW8h63ObFfmSW1op6g6InPNN/+
   sxKdeTgUfnkFuAkgxINFIeH1Ehy7PRO7fG11YZCjx8Frpn5aaxOkbW/P8
   g==;
X-CSE-ConnectionGUID: 38wxDj93RQa6GEuB53qugQ==
X-CSE-MsgGUID: afNpnv7/Tz+thjupzOAw5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87316530"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="87316530"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 14:46:08 -0700
X-CSE-ConnectionGUID: bTUzegHGQruByq3P7cHaXg==
X-CSE-MsgGUID: QoancOYoTQS5Lek4oX01iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="275310079"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 14:46:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 14:46:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 14:46:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 14:46:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZM36ynHZnMOj3Gp6JWKkjwfoMgKkIz+bfYCvyVvBg3X1k4tc49U7IzdQQv1YeD4/zGtqmpHOK2+9axHa5u3TGwFaLqhURRyNv6RF24RUEHyxIE5Ol4IsylkQKTrSg+Dux7OclR6UOGHIVMjAucG6KJu6RgmZNMJ5xHyU27jg7Xg85xCcwFGJCGfRpVERewaaf1K6q4kzdbWKQniSr4R4w7Wl20Es5iGMvy8zdlWFguxz+a5f3NEnEGiOC2jP9wgPMIPKmqfCcC4zb1c8o+HGnbPo+Gj91p6e3Nt0w2lIwdCX2WcuoXDZmUOFV6PL3J3x+UlF50KmyzDlosdBZokbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PH261inkexFfjkGOmyAmE22pudBTy2blJxFd8Esh2Ms=;
 b=Jk6dLIqPoBsxmV66PRVyIiFg1q3uFkkePJqfdww8j7cqiiEdMCZDTNal3A+Sqqy7NybB+Ezm9sDOL/fcU2c38OvlsQLN5ao2UY//qBoNIxcqb+blrpY2Rp5BZaHGtAS99r5jie2twQ4vPyf+Ed8WzMQRWZtiLllvAIOkp4zKWm9+FMpJb/YEBo9qbIBu8aaNGph1J38N8TBWBOiV5Z3LQqc6w9snNZ9z2Xp+7cfhxbkVSRGM7mIUPm0tIyKxPB/pJC/5zdqrWWwsEcconvd3et1zksfvDKMINz2plMN5Mb8U7Q4c5nRikGt92n/e9OzpPI0tGL6uCnB/tK/WM7vBRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by SA1PR11MB8796.namprd11.prod.outlook.com (2603:10b6:806:467::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:46:03 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 21:46:03 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "x86@kernel.org" <x86@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "shuah@kernel.org" <shuah@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"tglx@kernel.org" <tglx@kernel.org>, "bill.roberts@arm.com"
	<bill.roberts@arm.com>, "hpa@zytor.com" <hpa@zytor.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Thread-Topic: [PATCH 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Thread-Index: AQHc/QCGO67nIHPcwU29qMal4CU9pbZWJ1oA
Date: Mon, 29 Jun 2026 21:46:03 +0000
Message-ID: <67e700c8bed2e082efaf68de33ee2c46d16033f3.camel@intel.com>
References: <20260615195156.257950-1-bill.roberts@arm.com>
	 <20260615195156.257950-2-bill.roberts@arm.com>
In-Reply-To: <20260615195156.257950-2-bill.roberts@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|SA1PR11MB8796:EE_
x-ms-office365-filtering-correlation-id: ef76d0da-d197-469b-9fd7-08ded627d134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|22082099003|6133799003|18002099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: rkprYF2kHLZKMBurC8jFMoZqkm626EXbntP6rdgOyetTCirkwwOnlk98w5BKE3hfMMAzhYh/fXeoNrWBDsyvysOPfOtO1LKvvMgvsP+n7SsSYpeYSxYeanyIOeq0sAANWTwGa6W2edDhzW2hfLkoKhVJzCZKzjLEnlSBbXbdwOeEZMCYcoxTb/09QFrkIzFMnxW2RS1DdQxSqeeeugxJ6U/sd3FZh9z9F+3vyGmCBzsnQpvr9cXaY8AAMQ5lO4AfThd/s+da7U5CuN/7/IEL9NI8MaM5rqMYFVXa/WzDAzs3GRhn/l035sRx98DnGCqY3h5g5rU5G97TmEcKQ+TWEHYD5Qz/PHOi0OQ4axsQ1CNCd+piLHrqCrricB3TNx8LapPlFkKTGV92SS+G6/4j3WqNLnLVRaYQ8m9s07igzul5322RmWFq+isrqLiiEd+5Ph8Q9Dck1gx0j2mn0m/8Ic6D9CxLpL7m1FHcrDwRYtL9TYXcTATw5zIOJAFt9R/MFVaOvumX4OZRBvgFKqTUWi9r2qdjXAkn6JYuefMDSo781sR9E08YC8a21ATNHl7VwJ43y4ygsP++oyRxes/s3MCvIT9YgBFdA2GcWhheoIHWXRztaMKN0FKpV0Ls5i8Kj2bZGzEtZz1B5Y2V4nnRMFl757li8Odn40YAYVVk7F86F4J5HikqfBzNUVtsTfOjkxMEyibimp0z5GATjWlfRQMqM7q/+J0FzDQxlpRZD0Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(22082099003)(6133799003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akwyTFVjUnhZOXdlMXpFa1R6RWpIL3NQUTh0NUh3OVBuaFNmZDQ4UXVKdU9M?=
 =?utf-8?B?VFRkMXdOUWpUY01SVVBLT3VXT3FZLzM5clhMT2FhdDI4Q1lhUzI2czZTMVN6?=
 =?utf-8?B?dzVRcXBOaS80Rmk3dVlja3lrV2FmUTBNUFVybGhBT0NGdlhsYXkvb0c2Mll3?=
 =?utf-8?B?eldmdit2RzJoY0hScGJweVpOcDFETXdhR2hQM2poWTdxUHY1ZXJCT0VoMWRR?=
 =?utf-8?B?Z0sxZ2lFVGhYUmpqMkxBK2dvOC9iWmxzU0VKYkdqRWlkKzRrTFFYYjBRcTFN?=
 =?utf-8?B?ZGlpTW8wbXpQdllScFc0SC9JY2pLU0VVdjkvN3IzRDFuWDBXTzQ1TXFuZG1j?=
 =?utf-8?B?WXBNbjZVV1hPeWtoWkVlbXB4LzJiQWlHSEgwckRjTzR2TEFzdXVTcjFYSGs0?=
 =?utf-8?B?cjdLTmg0ZkR6bFdXaVJWOTZjZnhiQlNxbDZ5dDBQNnIxNmluQ0hEdTZoREps?=
 =?utf-8?B?VjNaV3MxSnFTd09tTFFhNEpyenB4Z1djWjNTRUhIMFZ5Y1ViQWdEaTFHdzhk?=
 =?utf-8?B?NW9RSWl0VUlxQ0IxM3FycE9lR3BrR01zWUpJNnZ4eVlOcUVaRUFpdjVlcjI0?=
 =?utf-8?B?ZXVENmhHTFFVRlNOS2o1VmhZTHpDSEt1UDFGYmQxN1dhWmcvR1RkK1VCbWdH?=
 =?utf-8?B?VkZxNkNOZUxGR1FaYjRhR2IxT1FuY0xhaFNxZGRPd1Q0UHpmMXVHQWVFTFlv?=
 =?utf-8?B?cFFuN1d6MnRoeVMyNHdoV2djdnRzYTZ3L05OemVyM3dwZE0ybGdjOVlaN2NU?=
 =?utf-8?B?d3B1bE00VElFWmZzVWgzUEE2bUJRcitKMkxMT2wrY3U0Vm1KR3ErZjBZSWM2?=
 =?utf-8?B?VjNzUWJBdEpRdlk2MzZCWE5oR2kxd2JtS05KUk1SUnA4T2ZmQ3VIMVh3dzV2?=
 =?utf-8?B?RCt4NWFoU1lwS3ZoTUU1Mm90VEhERi9tMjNyL0hoaCtqbGkwcHhxc24zNDk1?=
 =?utf-8?B?K3ViZXJaRjI1RkEyUE9VN25VRm5IWFZTUHgycnlmY1IrUE51eHJWdUVMd21N?=
 =?utf-8?B?UDBibWRDRVVtTS9OOGZBWDVNZXowZ05iV3pycndSTGtnNGNURG5aOUJuQVF5?=
 =?utf-8?B?anFVMVZnYitXUEFWU2huNUY0c21KaXMvNmdUeTFybFpQRGR6amYwWWhwSXc2?=
 =?utf-8?B?dFVYYTZIQTU5RHNWZWV3WEhSd3RmZUFFWEljYXo5N3pZVnp2b0l0WUJZd0wy?=
 =?utf-8?B?YVJlSjRabFo5cSsvZmdHYWtUQUkxcm5pSjZxK0xVd3JNOFp3ZkYxeENhSGFG?=
 =?utf-8?B?dm1vcmMyMjZINmZUU0ZEb3ExU215Z0tneHlJTEp4OHJ5djBMdExPT29JNW4z?=
 =?utf-8?B?VXVncGlOWXRGVk9iNWVvUnFEWXc5bDVyL0h4Z213cmU5WWdWcTdTTlo3cllL?=
 =?utf-8?B?RUFrT3J1aFlrWnkrL0UwbC9Lc0QzU1FwUW5CSmxSQzQ1SWNOY2FFL2s1V29q?=
 =?utf-8?B?dldldUdUUVNzYlVYMEt6UHI4OUtiRmY4eCt6Rld6S25xblZhY3JwbHo3amJV?=
 =?utf-8?B?R2JJNlBOR0lFeU9XbjY4dUQ3YmNCUnZoZlpadXNYcC85amFXNldoNThZZk40?=
 =?utf-8?B?bmE4QjU2Y1R5S2hjY2JTb0UrWm11ZkE3enlYVm51UlVBOXlNMDcxRjBPV1Ba?=
 =?utf-8?B?NlNKei9Sb05tZFJjT0dEcXRaamVmUTJ1U3FwVHlXOGdXYmN1LzkrSjBzTTl2?=
 =?utf-8?B?ajRPU2RlUzdqS3dDWC9QZUlxNDJEMUlQUExYL3FBZjNWdTNmSE9wWjlZSVZr?=
 =?utf-8?B?MW1abWZRZjdEOUdmamZOM1p4SkwrdjJCZ1E3NENXdUc1cmVYWU9oZVV3OW1h?=
 =?utf-8?B?c3c1dXBERWloNVYyazZXQUwySUVCWWxqdFFaM0V5dDFaeCtxYThSOVdJcHp3?=
 =?utf-8?B?SzZFdmlQeGk1a2JEOWI5MTFmRzNVTC9KV3ZvVHcxbHlBRTFGMk1kMjFXcGh3?=
 =?utf-8?B?NWp5ZE9UMnU5dzEwTkNWbForRGZ1NDhlWkZ4TEtzUzhxYWxHa0JSZm4yK09D?=
 =?utf-8?B?UWVDRFZxb3RmOWZNU1BtNVhlR2wwZ2tUb2trcStCdVo5Qk81b09CVnhPNXFw?=
 =?utf-8?B?MXhIYStYcmJjN1BCbUhsVWpUWGt3YnJRQ1d4aGdWYW1kNm1uUGJ2enpaTVA2?=
 =?utf-8?B?aXZCM1NhRlJwdGFFZUlQQkdSTEZ5M3hGYnh6VVcwOExBbEVlYitnMlV1dGdR?=
 =?utf-8?B?Y0JxMEJQUmUyVG9vNEF0azJEbWh1bVhSaC9ZRHYwV1lnVkdzTDdiQVRIRFVs?=
 =?utf-8?B?RUVCM2RYNU4vaW1USG0vK2ZyYUd3SUMxQjFaMC94Ui8rN202VmtCbXRoU1Fo?=
 =?utf-8?B?b01uUHRnTlkzdW04K01YNDFMZndIdm9xNkR4LzM3ZzlJWG91dGh6RkY1UlZz?=
 =?utf-8?Q?oLn0zJokYUKNf7B0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DE97A161DF0E24B979F55A673E64E83@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CSAK9CxbKVe9waSq/Cgb55GZYeetBMwUsreqcZ3AnAWUiXrGrtf4AP5GurmGUkKIFuswYV6DxHuIrlmgCRTnxT3es0a/Z0ePKtfMSsAwqGRhax/k9miQCFJ4yHHT7PMo7+a067FJTOSVQK0vmdEpxBMA8pB0cEwWQhm8QfSgjB306/0lv+0FaT2JXZjbIaWqp/GO0QizRLecuknie2JrmW+jYzkFCKZ82ruLk8QrwMJ4Gy+H5xYXkZ1+20wva/prXD1NbR0k0W7aKhFFpL1BDU0QPlFCmgQ25R6vV5+3Txz9LL8b9TYR06qece5U2lBSGw5BbhpCWAkp8lqbvnzeWA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef76d0da-d197-469b-9fd7-08ded627d134
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 21:46:03.4808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f9KimGc3LM92MjZ0TJ9W1Rl8nxxv4MpKvpjS/5iDOM5aihV1mTnwFr1fHAtlZ/8BHARH6aXAZ8UCC0xNau9hEBPbZg7z2Xl3YgeG/Tw0uu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8796
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI2LTA2LTE1IGF0IDE0OjUxIC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
IE9uZSBzaG91bGQgbm90IGJlIGFibGUgdG8gdXNlIEFSQ0hfU0hTVEtfVU5MT0NLIHZpYSBhcmNo
X3ByY3RsIHRvIHR3aWRkbGUNCj4gZmVhdHVyZSBiaXRzLCB0ZXN0IHRoYXQgdGhpcyBpcyB0aGUg
Y2FzZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJpbGwgUm9iZXJ0cyA8YmlsbC5yb2JlcnRzQGFy
bS5jb20+DQo+IC0tLQ0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMveDg2L3Rlc3Rfc2hhZG93
X3N0YWNrLmMgfCA4ICsrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMveDg2L3Rlc3Rfc2hh
ZG93X3N0YWNrLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy94ODYvdGVzdF9zaGFkb3dfc3Rh
Y2suYw0KPiBpbmRleCAyMWFmNTRkNWY0ZWEuLjgyYTVmZWZhOWRmNSAxMDA2NDQNCj4gLS0tIGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMveDg2L3Rlc3Rfc2hhZG93X3N0YWNrLmMNCj4gKysrIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMveDg2L3Rlc3Rfc2hhZG93X3N0YWNrLmMNCj4gQEAgLTk3
OSw2ICs5NzksMTQgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkNCj4gIHsNCj4g
IAlpbnQgcmV0ID0gMDsNCj4gIA0KPiArCS8qIHRlc3QgdGhhdCB3ZSBjYW4ndCB1c2UgdW5sb2Nr
IHRvIHNldCBzaGFkb3cgc3RhY2sgKi8NCj4gKwlpZiAoIUFSQ0hfUFJDVEwoQVJDSF9TSFNUS19V
TkxPQ0ssIEFSQ0hfU0hTVEtfU0hTVEspKSB7DQo+ICsJCXByaW50ZigiW1NLSVBdXHRDb3VsZCBl
bmFibGUgU2hhZG93IHN0YWNrIHZpYSBVTkxPQ0tcbiIpOw0KPiArCQlyZXR1cm4gMTsNCj4gKwl9
DQoNCk1vcmUgZ2VuZXJhbGx5LCB3ZSBzaG91bGQgbm90IGJlIGFibGUgdG8gdXNlIEFSQ0hfU0hT
VEtfVU5MT0NLIGhlcmUuIENhbiB3ZSBtYWtlDQp0aGUgY29tbWVudCBnZW5lcmljIGFuZCBub3Qg
Y2hlY2tpbmcgZm9yIGEgc3BlY2lmaWMgYnVnPyBCZWNhdXNlIGl0IGRvZXMgbW9yZQ0KdGhhbiB0
aGF0Lg0KDQo+ICsNCj4gKwlwcmludGYoIltPS11cdENvdWxkbid0IGVuYWJsZSBTaGFkb3cgc3Rh
Y2sgdmlhIFVOTE9DS1xuIik7DQo+ICsNCj4gIAlpZiAoQVJDSF9QUkNUTChBUkNIX1NIU1RLX0VO
QUJMRSwgQVJDSF9TSFNUS19TSFNUSykpIHsNCj4gIAkJcHJpbnRmKCJbU0tJUF1cdENvdWxkIG5v
dCBlbmFibGUgU2hhZG93IHN0YWNrXG4iKTsNCj4gIAkJcmV0dXJuIDE7DQoNCg==

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E67191F94;
	Thu, 27 Aug 2026 23:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873549; cv=fail; b=TZHo2WgBm4Jm40iYxmaAB8zwg0kiOf7IAVlFcibo84W6JJttQg13/Vk1+GggAoFn4M64RGKfdwQUy9e089c6K8VYbr78fdclm0mkuRJEK8WobE/2bWdBzKvCswufuv7uTJdmpAgEfCinpwnU9gpQmg/HrUlnDbcAVRYzR1CPcvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873549; c=relaxed/simple;
	bh=6gybssmIuq/Xtoj1sqh/Wlkj2UCMWnHR1FlJ7qGm4a0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DuVndTJTRNvXZcJVm41bDsG/WVKu45ykoQyARfpk6UofovL2m0ia03Mn8b0cH6rBS3u1FrfhjuaiTReevESbFVfPkjVGg6gWBF1AN4WDV+K/Xq9Eui9zTrw3dp+SF1jOEBMMFClBqRptZrHM9yyiyVkM064lMBwvWj1dkGy/VJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKD3iWJ4; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKD3iWJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787873547; x=1819409547;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6gybssmIuq/Xtoj1sqh/Wlkj2UCMWnHR1FlJ7qGm4a0=;
  b=IKD3iWJ4NIC1wISvtHzfJi6vRp6KKFXlz153uF62AVav6pyVl+N0vqns
   2vl6yZYXAHl/Jwp8w6/rxm45lkh6OxwRPcrxyAcrPWOIAPMd/NkPWSR6Q
   6IQ1Fb1uYBo3NLHwZJ9f2PnswmcKYjXB2aHRi/SmVAa5zbQsnrhy1nbn9
   4v8AOgxsbPe6JSmAF2i5rQnpZdyf5QD/guPdHIPTfqDKvvTATJpN/D2XC
   z0EpcxEsSV6RnqTtnLGS5aREPcMPbSVWPkLEguL4inyJLXmDTzvdbSyQ2
   JKwBlnx0L8JYNTYPwZvbPj55rtMjSHKo2jbAZyVEpcHEfVo5Zzqq2LkBz
   g==;
X-CSE-ConnectionGUID: RVGuOfhMTlSir1mrYp3Gnw==
X-CSE-MsgGUID: 4pPHSRT1TlWz2wnQGGDsMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88588821"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88588821"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 16:32:27 -0700
X-CSE-ConnectionGUID: cNSC+DWHTcqhxqi8Gzq48Q==
X-CSE-MsgGUID: LU0AKh1uQkCx48v2euoZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="292822345"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 16:32:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 16:32:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 16:32:25 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 16:32:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MegBcHTF9AArPO1htRdkAE4UxUngTEyeUKu81mfkSEacr+HSPz0J+G+qyghz/61ZUDysoM1IBeeeNg5hGP/99NkvE++oY3jcF0ER4X5WydC8zUL+Hy5DrHHMI1+Z8q9HMqlRxdkwhW64KAgZ6atp+yLI5BVxDuYeXIzSKCW/puhzdOVmJE469MnltuEUjBzWPx1QTgCChrYDJYswA1GN7i8M/PbEn4Wv4n5ePPhKpMf1LCFYC7/+fmvjxDpZzAXPyYDK2xb5ljek6nUjcjIY+pBqXumzUt24TcMNKfHa6X3+tNNT0sZBFRd3felGRYCO1/JD4xmtTLwbw81ahHKsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gybssmIuq/Xtoj1sqh/Wlkj2UCMWnHR1FlJ7qGm4a0=;
 b=eYHJWYeI4txV5o4OzQkLrPJHBfPJeVAE+IXig4Xtwm4nbPjdyQLPLrQo26MvDYvgwnP32PvYIdgiRV0n0+ibTdy6pnImR2k/UZNgVw13cTRuVFYNWDnvq61dtT/xBh9nH6+hNqcsJrdT83y87B/czJRHl5pcI/BQp2SVjArtl7ti35btoXQ3kBin8o0dFniQLRYyJNfEVgGLfhtospr6TSvHjgUBZY1qesV0OxXY6F6DNv12qrudP6vhbhSB1BLirPpoK0L0yNipYmfu/vEV8/gFbj6OXJExjPTCr5g18OhfkPSHLmxa41Lwk3IBdKoTk3Z3gI7ztvDjlO109+gWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by IA3PR11MB9160.namprd11.prod.outlook.com (2603:10b6:208:57a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 23:32:15 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0339.012; Thu, 27 Aug 2026
 23:32:14 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "x86@kernel.org" <x86@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "shuah@kernel.org" <shuah@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"tglx@kernel.org" <tglx@kernel.org>, "bill.roberts@arm.com"
	<bill.roberts@arm.com>, "hpa@zytor.com" <hpa@zytor.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Thread-Topic: [PATCH v2 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Thread-Index: AQHdDkSBUGol+sBZJ0SdmNdWGtyvjray3AkA
Date: Thu, 27 Aug 2026 23:32:13 +0000
Message-ID: <440cdd41a203589b31e287378de146e18e620176.camel@intel.com>
References: <20260707191136.1732277-1-bill.roberts@arm.com>
	 <20260707191136.1732277-2-bill.roberts@arm.com>
In-Reply-To: <20260707191136.1732277-2-bill.roberts@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|IA3PR11MB9160:EE_
x-ms-office365-filtering-correlation-id: c4d672e6-59cf-4989-d756-08df04936cb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|38070700021|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: tv4A12+BUPu9o2n+yJ9DpWg4LF8xtfmCt0WYDIl0voq085KkhU32gvf+hNB45adLR8a7Q6JktBh1MVNhuDgc6rK6MWS4Mr578LvYYwZ5RlnT+Mw3Ho5bNRp21XQGfh9zQO4pwLcf/LTOpdzIhxQdwYFlJEEUBE/OgJXjWfheiGWRrR89hLK1055psV5uoLu8voPv17Z2zAA/QBMfDXI2LnxOxf9znhbiRWSOP3v2QWADVxdnKZePGx8BQyKkZ1bgXmvr61hzwAGETzGKmgLizV9h4zd4GGTNUKrqlBpQL8mi041BtWdHnDmpL9U7yV86QjwMVwLxhukR4LgXDxjU2cYBPnUAmMarCvUUEum8ZbGwGOwd2XxpqtaXN1/eGcsF7TqS4DYJBu+Kz180IFzzwBaEMDvBDVvKBfZxEwdkqCnBkap9/EXTEl5REMnCGivpbFq9Jt1l5M+RHhRctTC6mggKPsV8/vl8lbBtTcjwcaKkQoP0Q/77Y2jb9GyYBluvaqtGUD9p7wLBYBMLxGilfALCnV/hlTT4LqCsmIgDit6LxXEhgKFwrBfWNvxYTPu+dPTEbHtIsN2dW/quVz1Xgn+IcBoZIhxlJwusqT+I9Cf38jYWxmt6q3sNJBKsNHRqThoaqk+lNMdqCh+U7BdZPIW3Oh+xHE6qaCUUBg5KX0Onok61fTw+AE+7ojNNuLgAbwV+K0nwjUlGB/HeDbT6isUzsdpnpW4jrGOEJRCSXkQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3R1Mzd6MDZyNjBsUGFGOHN5N2RPbHVJcUdhd2JqZm1vdjI3Wk51Q1MrZFlJ?=
 =?utf-8?B?T0hSZG83NkQxYkViN2pqanJnZ3FRU0pHYUZZM1BkbThEdW85eXpyb0Z5Ylk1?=
 =?utf-8?B?dEVOQldxUWEvbnpYSDRzSktrWEhsbjliWVp1dFpZcWprSjVmdW03alk4aXVv?=
 =?utf-8?B?STVicUgzK045c3FFNHY0alFDeWxEdmtmdERPZWdjaGV5OU40VDEvQ3ViTkg0?=
 =?utf-8?B?ZVJHY0YxcWRSNlhrNWZIbnhRQnRyc0dwREI0NFdYTm82QW04bVBRdHN0a1BD?=
 =?utf-8?B?bUNJV0FReThiM01EWW5zZlliWTNjcERGbWlvenhnUUU2L1kzM0c4N3ZQWVlC?=
 =?utf-8?B?VDlhSldoTHpzZ2lQZUxvamJNazl0cXBzcitqUXRLcUVyTDU0TjRET1FlQ1pR?=
 =?utf-8?B?RnpIWUNmMXE3cE1LdjhJTXFwRlZYY2Q4Sk1MSXV6T1NmZlZjNXVlY3dBK2Yr?=
 =?utf-8?B?eGZqR2ZVQkh6M3huZTYrSDFicEdxNm81di9TZ3JoSWRmZmNMZlRMWEJpUk84?=
 =?utf-8?B?ZE90TVNiSEZBdHF2ZDIwN2pQeUJCRmlpbTMyRmZ3UTRSL1ZkVWdveitFREox?=
 =?utf-8?B?ZVBJTUgwN2FOUEZXa3lFRXdEaTNLMnFLdmxFRTEvZDZ3VXRWaUZCNndkZHRC?=
 =?utf-8?B?QW5KdkZ0VGFvZnJOaTdRYWJoMEx5dkpPWGtUZmFVQ3BPWC9QMEFnT2xHSmtm?=
 =?utf-8?B?RG5yUWl1S2pEV2NMMXEwSWc3L003aE1hbXVnV2FiaGd1TGUrWmNnTWVFZWU3?=
 =?utf-8?B?S3p0WXh2VzRFM3ZXS040NzlrNUM2RVFSYXVDUVhPWnR3OVNTZERtaHJCQjVt?=
 =?utf-8?B?YlJVMDd4ZHlPSUE1c092akhobmN2VVYvM1lweTc0RitXb3RKTFB5bXZhV01E?=
 =?utf-8?B?VWwvbnhsZTRIVHhaempDUkV5bk1INnpWYllBSDRURkVSRzhXeCtlYmN5YU5U?=
 =?utf-8?B?bU5aVGYxbHR0VUNWODMreW9EUy9NaXczeGVvMkVQaHZ3OWRWR3ZiSDVEOUZS?=
 =?utf-8?B?MEw3YktjVC96VDA3NHZNL0VBM1kxSmZKQVl6dlRwQTZsdk9Ma1lZRzdOVVNM?=
 =?utf-8?B?MEhUL1l5eDZxd0tGYkltVi9sQlZYOW5heGM2Mlg5WmJ5RXhxSGNmSDBjY0g4?=
 =?utf-8?B?dy9QdjRjN1kzdUZmK1hzQW1TSzhTS3BweGVkYUJwc2FvclZYR1NGZXYwWE5r?=
 =?utf-8?B?TGhkbmowSjFoa0hlbUZKYnN0OHRSTll3K0x1bEdMQ2FMaEpyTEVGZTFYZnlL?=
 =?utf-8?B?dGNMMVlxbDV0TWxKL1BONytEWjBnaVoxeSt1aysyQm5Zb3dycnNVb2lQd2dT?=
 =?utf-8?B?UGhZS215QmZpS1gwRzFsY0JSbEowWUNlcTFtQVppMlFWUW1oaS9uRW84ZjVP?=
 =?utf-8?B?dm13ZXBkVW1EV25OeDRvOWMrMkthdEx1K0FnRDJlK01EbDhXcEdDT2RJOU9H?=
 =?utf-8?B?OGhXT1ZiYUo0VlhSdkhHYTlIRTA3cHpMa2dTT3U2WkR0VVFzK2Q4WFh5RmNH?=
 =?utf-8?B?ZVlodXE1TnZiOFE3aHJsUjdxZUY0UXBhV3RuL2ljb053SDROeUZQRUNhbWgv?=
 =?utf-8?B?bHYxWCsrL3pDYSt2YjhnZlR1WlBvUGRlWW90M1hQaHlOdFJRQ095dGV3MUZi?=
 =?utf-8?B?MVM5NU10dkZZVFBQeDQySVJMNEQ4T21aT2hKZnpMSEM5NkpRZ01Ra0E1MnBh?=
 =?utf-8?B?b1F0a2UxdmtGMjRoV1N4LzBKVkNpQlRVY0daVjFqa0ZDL2lHWXBrK1ErYXZX?=
 =?utf-8?B?OFRCTDNYYXRScGRCOFh6bnB4SldMaDZ5Wld2NHJndmx0R3N2ZSt6MDRPeFVi?=
 =?utf-8?B?Z3hFYWljckJ1UkNqRldRdTAyUGpkbmZxaVhoT3NqUHBPUlJzZXlYWXpOVUp2?=
 =?utf-8?B?K3BoMVllbU5kUGwwNEY3dXIzNTlVMVUrWlJhenpKeXNOM0tzSFpsM0FaeURN?=
 =?utf-8?B?bVNka1RyemhuRFF2TmVFUW1JNm5kRHVOblJIZWNHU2NYbVZkTEVDeERGYi9r?=
 =?utf-8?B?K2lWQWlJUXBJc3ZpeEQ2ZTQ3RkdVcmZheDJDYXU3cjVPYjJBbTZYMVNlYlor?=
 =?utf-8?B?T1I0ZDU5R1ZRaWFObGN0MU5xTVZPNXNucng3Y2tzZlY2S2R2azZubW41L3Q3?=
 =?utf-8?B?OU81VXFDMTdhY1NYcXVDdlV4bHdFelVLYTdYeFdEK3hldU9Fd1BlUFpIbDVO?=
 =?utf-8?B?cGZwUy9UY2JFZ1oyM0xGbElNNnRkZDRXTXlBTjJtTHNwUFI5ZFZWR0NidDk1?=
 =?utf-8?B?cEgxc2Y2U0Vyd2tPOG1VUEdjUzQybU5FWDBmSXlKd0JBVWsyNTYwWnZMZzhL?=
 =?utf-8?B?cXlWR2wwMXdQL1ZzTDNjeWZtQUZFaXc4QmFndEE5cEtScm5mc1BQOWN0OGxQ?=
 =?utf-8?Q?CzdEb/49pBAHHnAw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <907A6036FAB4ED4BA45D17C7B80B10A9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zCp628+k/kReAcyV86Tcmfr6eX5WvgoLE4xCGEzsP+71l/NPO1e/7MU2gUYzp2acoM+46MvjIyyCzR5zDs6PvSvfrGeX6O4Zh3aiDR1TLctej/TDAuNCPd4Ie07nMretPGPbxwosRiYPXu86N36ocYU2NX0WTge92pHBHwm38KQ4/eeqNEzAQOT1nm2MpKYvPL9qD3jqUU9r52VbrMzbQMm54bw89h4jAEy7Wm0rGqPgfj6AG8qocctbVxEUuJfDJZqL5rFMyRrOV3de2IdmYuIZXh/T6NUei3B4Js4Uf2wyMDnL4t2OPiDUhWn2R/xgHt8S0zdTYiljxosSpwfJgA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d672e6-59cf-4989-d756-08df04936cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 23:32:14.0112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/wlsml1ogbHDN/rhKuRjNCQzUIWxdQb6jZnOQNZf/LeWWdWRLnLVl3DMT4rv2k12jc0JVjC/9wGFSrmLMKxaBZhP+PufT8sHUH8uxLRH3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9160
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTA3LTA3IGF0IDE0OjExIC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
IFRlc3QgdGhhdCBBUkNIX1NIU1RLX1VOTE9DSyBjYW4ndCBiZSBjYWxsZWQgZnJvbSBub3JtYWwg
KG5vbi1wdHJhY2UpDQo+IGNvbnRleHQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCaWxsIFJvYmVy
dHMgPGJpbGwucm9iZXJ0c0Bhcm0uY29tPg0KPiAtLS0NCg0KUmV2aWV3ZWQtYnk6IFJpY2sgRWRn
ZWNvbWJlIDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCg==

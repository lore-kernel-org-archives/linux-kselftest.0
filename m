Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E684457AA;
	Wed, 29 Jul 2026 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331764; cv=fail; b=SikfqS6EYbwk2+QfsDzV7i8wYyX7D0mVBUJSPqKxKoTaNsbEAymPmTpvszA3DZXvMe6G3qCIY9JiRSMqsA0QzCdp/Zdt3cMI/0OQJls2Fdwnl+a7kusRpd1S3geVZDxxsFtk+7Wf1zHd8bHHlKm5vWE3XzPSXuBykZ1LsHGDgyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331764; c=relaxed/simple;
	bh=nw5PcDQpjlE7e88UgDZmf+M7HkqYIuwjNnp6VjLOq+A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gmE2pq3iPBXibV5aiC837A7G2SYOFhmY5TH4pWTfXvOYGVqcdTtGCvjfBE/j6yLsdYX1zad2m/nN6Iozu8Ct3LGY+2F8nQktGyQh8nNuLrZAtC185dyyMjl5up2vyZ3nfQ54mlwkuzGzs3tT3fviOn3hGD8dzXDIl2Yq91ZLPOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9kyAW+o; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9kyAW+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785331762; x=1816867762;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nw5PcDQpjlE7e88UgDZmf+M7HkqYIuwjNnp6VjLOq+A=;
  b=X9kyAW+o8w3brXL5HZLasy0eVX+c6wZmyRDcTQG+Moua+r2e2DwHJYds
   gQa5kaMGexhRBfAYzzHEZ/0FCCA/8pVdkzI/1ZH607HKc5gGVjKrP8eug
   sFdEANm8Y6ihGygVTHxE442gS+VIyEYjC8SVZNj5uy2FmRy763iq+vC5/
   0hgoCWAKTPjMOHTblghUoIl34pCtKgOLXXhe/f0SQit1CxSu+sN6Da9Eo
   GFhHB1gcjL/geKortkqMnHUyKBFzCOY/V1LgYWa/4LK8nSFhzZB5m+ATf
   +9AgBDmsLFA/OzgBHdaoAjUWHKJ81vImpNAyMBlBUvgukOoDWx+WL22El
   w==;
X-CSE-ConnectionGUID: mQVWtP1WSAKXMj76FvxqNQ==
X-CSE-MsgGUID: RwugMhbYQHyd02gYjShlBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108731198"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="108731198"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 06:29:21 -0700
X-CSE-ConnectionGUID: Em0VUl8xQxu23taQ2Ic3bQ==
X-CSE-MsgGUID: OND/sbtuSpewCzUTShF32w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="256677227"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 06:29:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 06:29:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 06:29:19 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 06:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAtBme6uuLH38iqjNYQS60tzin/tn4RggwnazpY2RH2ryD834G3giFzEgDQiBOeO6j/WoszhnPjROwmGmjWn2l5h9CPh11HxuBqOukVu2KDaQXc9f38g9xDZydvwB10QJvBgxkiqtgxsvpMozGBo3otdjB90hMzJ+j9ABWhvCBe830x8nBnlCWB5eXhQXwpEZd8ti3wi6k5b1BwDdYnU9ycAZAD9a+aPP1AHrGppUIjBw67nlS0d+kJ/IiMB+SKPKVgOryVvFtYKxkOltYOar0FfEymYJUlkxXCrI7sMwreRPQ1ZLv2hDPgWhePR68p4n6zG9awHij8VFf/te1rEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw5PcDQpjlE7e88UgDZmf+M7HkqYIuwjNnp6VjLOq+A=;
 b=kHBYPvvPcC6sywm1znBPID+suSnMbZzvnZdEyaZLpAAizIENLsO3/qNRfhVudsS2lij7shbkv7Zrx6MzF1URDLISTv4sOFBrdpmoPXrBFcdOvx0kKtyJWsxhWwE3PBaQ7y4+q7ESUIEfP95Oc9UfeWn5dQmNWuvN82b5SnAyfFNhf1WK8w/2sYp9fsrMDTYj1rTXpMIMwbakhNqyr1dbK/z95Lyi/lrT5Z/tst16tmtcrGOxz4K6g9MLajPhn5lRAhzXmpPHFXnRy8FSSCuQsARUwiKfH/Tf9s/AKf58KsK0IFPNvDGvsnZfebsDJpg9uvIDXBUY5GOTSo5s6xMqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by PH7PR11MB6700.namprd11.prod.outlook.com (2603:10b6:510:1ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:29:15 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 13:29:15 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "mingo@redhat.com" <mingo@redhat.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"bill.roberts@arm.com" <bill.roberts@arm.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/2] x86/shstk: support via prctl
Thread-Topic: [PATCH 1/2] x86/shstk: support via prctl
Thread-Index: AQHdH1qLic+v9tAIz0KjQXVrF57uc7aEfrSA
Date: Wed, 29 Jul 2026 13:29:15 +0000
Message-ID: <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
References: <20260714154740.140431-1-bill.roberts@arm.com>
	 <20260714154740.140431-2-bill.roberts@arm.com>
In-Reply-To: <20260714154740.140431-2-bill.roberts@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|PH7PR11MB6700:EE_
x-ms-office365-filtering-correlation-id: 92974815-9981-44d9-14d0-08deed7562a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|38070700021|921020|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: a1O6+VJwITg/1EJdT29U4XUBBASZlw3oSs12T6uzgLDfP7QCn5KvcKP63fx25UMunE+Lc7V4KjLV/H78LW4h54oMoaWiSIGOQdmWIGfhZVi7IqUluDdNfqK3FO7Hn/8bO86T4fLxI+ZB/hhBrAD0whitn7f9sAb6ovH8UYC4nZrGPGPAAGu+cuEReEeItU7Zr3zgY+mfJbjwl4vYl1LZMLaghM40uW52HpVaCSahvL8SeCC1eOYMa+LiHLrNAGFCsfT+VC654VZ//dSMqST7gHOnXCmKZ8q/UVR7vGrk+mvmBShf2X0eHjPSVFRoHKKy8j0d6DfnxD6pLrxvubpw9NamMgy3g6+iOq+Gl+KfCZwh0F5NSVqBd3TAPcN/E4iI0C13TSzxiD07IxBzp5VkU0sAcjAxKYg1HxHOGZlKSjFG8x8FemLErKtw1q/huoxWhmKAemB01pRIa7/+teOy5ogmA5QI3J6PtPeFZq0KCE5RqkXgrM8FuvREi6AOIg9saSTkw7dKLyeulM8y1fNrVVEtVVZhyVDluVt5PfjyCyrIU/ptgvIzLFhjpG2VYnz8BIV3KafYyaKv+yGUyppXRJCfctOFkyCGr90d7fHBrS0qYgVuwaJIoi2fGxuCaG9GPXmbD5fvwZe0UbmxZ3WHQpZp6OU12Sxk9PlEXL+yI/wbJ6ZcdgpLv2FtPR824d4J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(38070700021)(921020)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aElRNUZOdmc5amsyQk45Mkp3TWhNQ0NsWGZBUk5ZcjlGc29URGQrWlRXOFNH?=
 =?utf-8?B?S3ZRYWU3Wm1mRithN2g4MjNHZUlVQk02SDl4enp6VXZMb3hkbGZQeDluZnNt?=
 =?utf-8?B?TkVvbnF2bjRsS3VIMXU4THN2dnlkUDliOHpLazlKMmo1VnBLNGtXOGM1SWVU?=
 =?utf-8?B?RmsxakZyL281dE9STGR5TVlJb0JaMktrejluS2R5N3JHMmFwUUpzbnVsb1Zl?=
 =?utf-8?B?Smx0amRiMTZHa0dnWG1DRjNrbDB1WVk5N2dNaFhVUTdKYzBodXkvOXhrRC9U?=
 =?utf-8?B?YjNKY0ZMZGlGRHhCZm8wQksrSitDTnlXNTl1ZFh1QXZYdldVWGltUDlRb2pM?=
 =?utf-8?B?WUxNZkkrdFhwbWdvS1lCODBaUm9FS0dVR3Yzdy93dXBGTWphdStCTWdQZ25s?=
 =?utf-8?B?MytXNmZKL2J5TnVuTjVpd01lWWRNNVd0Zk9BSVNVVnpjRlBDTG9PSnRNOFcy?=
 =?utf-8?B?SG0wekRvOXErUngrc0htamtPYmgyYm1qczM3ai9RWnhac1FJWmZ3ejN1VlVu?=
 =?utf-8?B?TFpMMmhGdFBuNkhJUm4raTJRZllhYzJKU2xLUFAzVXJpOWZESXVKd3hRTUtL?=
 =?utf-8?B?eCtUV2dWTWJ0bVRGMU1odEYwaGlpMGwyVXoyYWVEOVZoamVkbGN4aHNjd2lJ?=
 =?utf-8?B?K25vVXJVYzJjQnJqWFpBZDRXa3NWcGowL0J6Tlg1R1plbkE4dU5IMUUrRnJo?=
 =?utf-8?B?VCtQOUx4MC9GV2pQdDUxT2dVdHJneGwydTdnd05QakplUnIzVDF4REpWL3RG?=
 =?utf-8?B?MitFeVBEall2NUx4V2ZFTXNuT01kSFNnVXVyUElvUTRIelFDeUxoKzBEQ2Zy?=
 =?utf-8?B?UlZDNVlyaEJVYmxnU1hTY1BHb0p6K0lUdmk0eEdlbmJHU2hGcjNQenBvY2dt?=
 =?utf-8?B?bzdpUFdvb29PdXJ2V0JXV2MvN2gyQVg0NG0yWTJXY0pRRFlrcktoS2cwalBT?=
 =?utf-8?B?K0FQeFRMVnpyaGZTMW5HUnVYZzFPdVgvNDgyZFUwUktzQ3o3UFVGUFMrZFZY?=
 =?utf-8?B?QU9ZZFFlcTZYTnVybisxT1owUWpPRjZuUmZJTXFTRTVpNFV4ajlJbDRTL1kx?=
 =?utf-8?B?bWloRjFkVzdUcUFGVUFtWU9lM1dmVTcvUUNZWGtWSUVFbjRPYmRKdEllcU1Z?=
 =?utf-8?B?SUhoMTg4RWpRUW5zUTdabkhrWnVna083VkhkLzJ4ekw4Q0hNZDdrem9jc3Nh?=
 =?utf-8?B?ZjBVcHYyYXpONS93ZjdxeHNpL01oMld0K2NOSE1DSG1scmNja3J5dUEvVGY2?=
 =?utf-8?B?WDR3UkJTZ2R1YUltYWlJaTQ5cmZHU3pCOHVCaW03dGx1NkJtOGxBeVgzMUNz?=
 =?utf-8?B?NFd2cklsZjlkTnlZbklCd0p5K052NUgrU2NNeWR4bTQwdkR5ZlVjeVZhRnhh?=
 =?utf-8?B?dFdVaTZaM3Q4Y0szSmQrVGl1RGVOaG5Hak5Zck5PWlFwaGVram95b3NjeG1P?=
 =?utf-8?B?dW9UanhDT1BLRlkxMHZvd3ZSRCtlZ29URzFvUDNUQkFGamlGZzRGVWM5V2RU?=
 =?utf-8?B?WVdDMHQxVnhZWW5lWERqUTNqUzJNY3VvTklNaUN4dVNRSHNJMmFQYmN3d0w2?=
 =?utf-8?B?SkNZNzJId2dERW1ZcUFzcUpGcHMrZjVlalZXRTF0NjhZYlJzMFVqZTNiQ2d4?=
 =?utf-8?B?dXFENmw5VWVtVVpSYU9HUTZMc3pkb0ltMWprWjUxK0hIKzM2dlBQWHozZWc5?=
 =?utf-8?B?RnV4dmxHYUREbzIxTDJ5RG45TXJ2a01uSWRodWl6YU1XcTlHK3dCQXkxUjJ2?=
 =?utf-8?B?K2hxOThOMm81TTJRdFd1NDNEcW5lUW1tdFBQM05HUmpzMEFLVktuaDhncmRZ?=
 =?utf-8?B?Z1hNUStJOUlQY2VaQWFFNEI5SHBpYVZMSUQvYytZRWYvVmplY2J3c0o0bDRt?=
 =?utf-8?B?aGk3UmVhejBYWmxnQXZ5ZGpJV1M2OStqdnlNb3RPZjZLN0dCdlNGWjNMODlq?=
 =?utf-8?B?VmY5Rlc1ZENJbll0OUQvN1d4RENsL2dvY2lqZ3V3L0JrNU5Wd25ETnBQOE5N?=
 =?utf-8?B?QjlIaGxxSU55d1REbVhSRE9rTTl6N21DSmNLa21mQVZMWkwra1BkN0NDVHFk?=
 =?utf-8?B?SzFiVWZVV0NaZU5yS01EYUt6NUNtc2RmYWpoMXVaOWlFaE9oUXhhTDNWakpN?=
 =?utf-8?B?UmF6L3FrUFlBZDcybGNQcGdZMWszRVR3Ky85dUdna2NCc0pqT2g2N05zWkhF?=
 =?utf-8?B?UzRwUzJRbjc2Z3B5NHBqMWo5dmpPNlk3WEVQNndMUGVoeGFkUlMxQ3JHMjJM?=
 =?utf-8?B?MUp5U2lFNmJZcG1TUHBqTDhBSHVFeHlScnN0Q2Z5dTFZZk44S0VkOTIzODhL?=
 =?utf-8?B?d3hEd1luUHNVVFBxeHFXNmtWempBcWhKWDFSZ2NYTU1yemdsY3JscE54L3Uw?=
 =?utf-8?Q?9BH20GwDUY9oZrd4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F26B0C5F936414C9AF43661B082AF65@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qhYWh5rFmNfiVWDeBvIwv7jM4piZoBIbr1uHO/95dv1lGwOvLJyZCTRlwSPIVQl7/Uj80/y3MdhAptGid7gWFi/aq6p2Ad/Ci+J9WyHhsRmQMongxXmpyOJR9eopC6cmz64yiXNxpJdljACvKzV9wu8mGYHpKWQb5iT1uu5BRkKsGQyeZo3vYSfw+Mc1izcUnFKSGT2+YUTyQWY4dBde7T/pyb5S7qzmW0jaTpGaYMf+F1dbXruEiRPxpAxpuam9s5tCkvCj90MZZqaZ1BpdbkoeC5Qx+zh3ZDnzQsugsUl5gPH/G6r5RcsctLxCc105MXPyb0CknizMhdSEwpvbFw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92974815-9981-44d9-14d0-08deed7562a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 13:29:15.4789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4sz1ygeVpZsdCcd3Tvc2SRCa3czJ10ReRJ9g1uIBfu+BWCkh42jbeemEWJMnkMdfj5enlvCn9N/l7wmImkSmd641cDWnpRlLnNNgoaTUh6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6700
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTA3LTE0IGF0IDEwOjQ3IC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
IEhpc3RvcmljYWxseSwgbWFuYWdpbmcgdGhlIHVzZXItc3BhY2Ugc2hhZG93IHN0YWNrIHN0YXRl
IG9uIHg4NiBoYXMNCj4gYmVlbiBoYW5kbGVkIGV4Y2x1c2l2ZWx5IHRocm91Z2ggdGhlIGFyY2hf
cHJjdGwoKSBpbnRlcmZhY2UgdmlhIHRoZQ0KPiBBUkNIX1NIU1RLXyogb3BlcmF0aW9ucy4gSG93
ZXZlciwgb3RoZXIgYXJjaGl0ZWN0dXJlcyAoc3VjaCBhcyBhcm02NCBhbmQNCj4gcmlzY3YpIGRv
IG5vdCBpbXBsZW1lbnQgYXJjaF9wcmN0bCgpIGFuZCBpbnN0ZWFkIHV0aWxpemUgdGhlIG5ld2Vy
LA0KPiBhcmNoLWFnbm9zdGljLCBwcmN0bCgpIGludGVyZmFjZSAoaS5lLiBQUl9HRVRfU0hBRE9X
X1NUQUNLX1NUQVRVUyBhbmQNCj4gUFJfU0VUX1NIQURPV19TVEFDS19TVEFUVVMpLg0KPiANCj4g
VG8gcHJvdmlkZSBsYW5ndWFnZSBydW50aW1lcywgdG9vbGNoYWlucywgYW5kIGxpYmMgaW1wbGVt
ZW50YXRpb25zIHdpdGggYQ0KPiBjb25zaXN0ZW50LCBjcm9zcy1hcmNoaXRlY3R1cmUgaW50ZXJm
YWNlIGZvciBtYW5hZ2luZyBjb250cm9sLWZsb3cNCj4gaW50ZWdyaXR5LCB3aXJlIHVwIHRoZSBn
ZW5lcmljIHNoYWRvdyBzdGFjayBwcmN0bCBoYW5kbGVycyBmb3IgeDg2Lg0KDQpJIHRoaW5rIGds
aWJjIGRvZXNuJ3QgaGFuZGxlcyB0aGlzIGluIGFyY2ggY29kZSwgcmlnaHQ/IFNvIHRoZSBwb2lu
dCBvZiB0aGlzIGlzDQpvbmx5IHlvdXIgU0UgTGludXggcGF0Y2hlcy4gT3IgaXMgdGhlcmUgb3Ro
ZXIgY3Jvc3MtYXJjaCBjb2RlIHRoYXQgd2FudHMgdG8NCmhhbmRsZSBzaGFkb3cgc3RhY2s/DQoN
CkJUVywgZm9yIG5vbiBzZWN1cml0eSBtb2R1bGUgcGVvcGxlLCBjYW4geW91IGV4cGxhaW4gd2h5
IGl0IG5lZWRzIHRoaXMgZGVzaWduPw0KDQo+IA0KPiBNYXAgdGhlIGdlbmVyaWMgUFJfU0hBRE9X
X1NUQUNLX0VOQUJMRSwgUFJfU0hBRE9XX1NUQUNLX0RJU0FCTEUsIGFuZA0KPiBQUl9TSEFET1df
U1RBQ0tfTE9DSyBvcGVyYXRpb25zIG9udG8gdGhlIHVuZGVybHlpbmcgeDg2IGludGVybmFsIENF
VCBoZWxwZXINCj4gcm91dGluZXMuIFRoaXMgYWxsb3dzIHBvcnRhYmxlIHVzZXJzcGFjZSBhcHBs
aWNhdGlvbnMgdG8gdG9nZ2xlIG9yIHF1ZXJ5DQo+IHNoYWRvdyBzdGFjayBzdGF0ZXMgd2l0aG91
dCByZWx5aW5nIG9uIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBzeXN0ZW0gY2FsbHMsDQo+IHdoaWxl
IG1haW50YWluaW5nIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyBhcmNoX3By
Y3RsKCkgY2FsbHMuDQoNCkNhbiB5b3UgZXhwbGFpbiB3aHkgbm90IHRvIGluY2x1ZGUgQVJDSF9T
SFNUS19VTkxPQ0s/DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2UxMzYyNzMyYmE4Njk5
MGI3NzA3ZDNmNWI3ODUzNThiNzdjNWY4OTYuY2FtZWxAaW50ZWwuY29tLw0KDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWxsIFJvYmVydHMgPGJpbGwucm9iZXJ0c0Bhcm0uY29tPg0KPiAtLS0NCj4g
wqBhcmNoL3g4Ni9rZXJuZWwvc2hzdGsuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvc2hzdGsuYyBiL2FyY2gveDg2L2tlcm5lbC9zaHN0
ay5jDQo+IGluZGV4IDBjYTY0OTAwMTkyZi4uZWYzZGI5NGVlYzZhIDEwMDY0NA0KPiAtLS0gYS9h
cmNoL3g4Ni9rZXJuZWwvc2hzdGsuYw0KPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvc2hzdGsuYw0K
PiBAQCAtMTgsNiArMTgsNyBAQA0KPiDCoCNpbmNsdWRlIDxsaW51eC9zaXplcy5oPg0KPiDCoCNp
bmNsdWRlIDxsaW51eC91c2VyLmg+DQo+IMKgI2luY2x1ZGUgPGxpbnV4L3N5c2NhbGxzLmg+DQo+
ICsjaW5jbHVkZSA8bGludXgvcHJjdGwuaD4NCj4gwqAjaW5jbHVkZSA8YXNtL21zci5oPg0KPiDC
oCNpbmNsdWRlIDxhc20vZnB1L3hzdGF0ZS5oPg0KPiDCoCNpbmNsdWRlIDxhc20vZnB1L3R5cGVz
Lmg+DQo+IEBAIC02MzAsMyArNjMxLDM3IEBAIGJvb2wgc2hzdGtfaXNfZW5hYmxlZCh2b2lkKQ0K
PiDCoHsNCj4gwqAJcmV0dXJuIGZlYXR1cmVzX2VuYWJsZWQoQVJDSF9TSFNUS19TSFNUSyk7DQo+
IMKgfQ0KPiArDQo+ICsvKiBXZSBhc3N1bWUgdGhlIHByY3RsKCkgZmVhdHVyZSBiaXRzIGxpbmUg
dXAgd2l0aCB0aGUgYXJjaF9wcmN0bCgpIHNwZWNpZmljDQo+IG9uZXMuICovDQo+ICtzdGF0aWNf
YXNzZXJ0KFBSX1NIQURPV19TVEFDS19FTkFCTEUgPT0gQVJDSF9TSFNUS19TSFNUSyk7DQo+ICtz
dGF0aWNfYXNzZXJ0KFBSX1NIQURPV19TVEFDS19XUklURcKgID09IEFSQ0hfU0hTVEtfV1JTUyk7
DQoNClRoaXMgaXMgb25seSBuZWVkZWQgZm9yIGFyY2hfZ2V0X3NoYWRvd19zdGFja19zdGF0dXMo
KT8gU28gY2FuIHdlIHB1dCBpdCBuZWFyIGJ5DQphbmQgZXhwbGFpbiB3aHk/DQoNCj4gKw0KPiAr
LyogSGFuZGxlcyB0aGUgZ2VuZXJpYyBwcmN0bCBpbnRlcmZhY2UgZm9yIFBSX1NFVF9TSEFET1df
U1RBQ0tfU1RBVFVTIGFuZCBpdHMNCj4gZmVhdHVyZSBiaXRzICovDQo+ICtpbnQgYXJjaF9zZXRf
c2hhZG93X3N0YWNrX3N0YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQsIHVuc2lnbmVkIGxvbmcg
c3RhdHVzKQ0KPiArew0KPiArCWludCByYzsNCg0KSXQgbmVlZHMgdG8gcmVqZWN0IGludmFsaWQg
b3B0aW9ucyBmb3Igc3RhdHVzLg0KDQo+ICsNCj4gKwkvKiB4ODYgYXJjaF9wcmN0bCBpcyBzaW5n
bGUgYml0IGF0IGEgdGltZSwgc28gaGFuZGxlIHRoZXNlIG9uZSBhdA0KPiB0aW1lICovDQo+ICsJ
aWYgKCFzdGF0dXMgJiBQUl9TSEFET1dfU1RBQ0tfRU5BQkxFKQ0KPiArCQlyZXR1cm4gc2hzdGtf
cHJjdGwodCwgQVJDSF9TSFNUS19ESVNBQkxFLCBBUkNIX1NIU1RLX1NIU1RLKTsNCj4gKw0KPiAr
CXJjID0gc2hzdGtfcHJjdGwodCwgQVJDSF9TSFNUS19FTkFCTEUsIEFSQ0hfU0hTVEtfU0hTVEsp
Ow0KPiArCWlmIChyYykNCj4gKwkJcmV0dXJuIHJjOw0KPiArDQo+ICsJaWYgKHN0YXR1cyAmIFBS
X1NIQURPV19TVEFDS19XUklURSkNCj4gKwkJcmV0dXJuIHNoc3RrX3ByY3RsKHQsIEFSQ0hfU0hT
VEtfRU5BQkxFLCBBUkNIX1NIU1RLX1dSU1MpOw0KPiArDQo+ICsJcmV0dXJuIHNoc3RrX3ByY3Rs
KHQsIEFSQ0hfU0hTVEtfRElTQUJMRSwgQVJDSF9TSFNUS19XUlNTKTsNCj4gK30NCj4gKw0KPiAr
LyogSGFuZGxlcyB0aGUgZ2VuZXJpYyBwcmN0bCBpbnRlcmZhY2UgZm9yIFBSX0xPQ0tfU0hBRE9X
X1NUQUNLX1NUQVRVUyBhbmQNCj4gaXRzIGZlYXR1cmUgYml0cyAqLw0KPiAraW50IGFyY2hfbG9j
a19zaGFkb3dfc3RhY2tfc3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdCwgdW5zaWduZWQgbG9u
Zw0KPiBzdGF0dXMpDQo+ICt7DQo+ICsJcmV0dXJuIHNoc3RrX3ByY3RsKHQsIEFSQ0hfU0hTVEtf
TE9DSywgc3RhdHVzKTsNCj4gK30NCj4gKw0KPiAraW50IGFyY2hfZ2V0X3NoYWRvd19zdGFja19z
dGF0dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0LCB1bnNpZ25lZCBsb25nIF9fdXNlcg0KPiAqc3Rh
dHVzKQ0KPiArew0KPiArCXJldHVybiBzaHN0a19wcmN0bCh0LCBBUkNIX1NIU1RLX1NUQVRVUywg
KHVuc2lnbmVkIGxvbmcpc3RhdHVzKTsNCj4gK30NCg0K

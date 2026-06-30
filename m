Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EB6218ADD;
	Tue, 30 Jun 2026 17:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838951; cv=fail; b=P5ekILrrasaD6UZGMKC0EI3jhV/5ycH/OKrRbFEsEOrgw/AU4HgBtZ5TDxuyVR6JHmX59hnpj74qpCBZUgRXwKVxyZZXqtkvIw0bk5F9WacnwXyKNXCjVgcP+eirncRdv4NgzvLEKtLOgVYrORX1up3C5e4SkT+mAgSyz4zxNas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838951; c=relaxed/simple;
	bh=aP6D88Hg3ImkS3/GVj4oh5U0u59LRdwzIG5hvg18tXI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m3wSUjPKRhgmpuJv1s/b0TSM65GL7C1URJMpWOrSruBTewVXDwfNHefl4gDVNrXtaR2cH8EravvLBMKvto4kdVa0jsSkDsMuC3VdLdbqD9pP50Roki4R+nXMR6+0cqrN28aEthLN0c3ywEJGwhKtYLcH1svfQqxQMqy1DJS7b1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVFCsik3; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVFCsik3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782838950; x=1814374950;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aP6D88Hg3ImkS3/GVj4oh5U0u59LRdwzIG5hvg18tXI=;
  b=OVFCsik3qxecM2+eKNChi9g/WYNguSCbTrORZC+0Z7tUOI0XSdSWN/GR
   KCWZiyyQOOl/6BNeAtbE5OnxoR3YE0zjaOZuVdULp/DssZTWgfiKZtDJ7
   rDls+QuMLZWaHYPaE10ZeJ0v65NE8PwCbRJ1zV2UpYISNYlY9WNcMg3E7
   ULoDcAprn28KWOGMbQbDjWCJpjM/spv3XCp3gjenz8mPObN9HXBmV4jMI
   y4Xv+zXHByHBky7UDhIqE3wSZKV99lsxOWLkFL9ZRW5oKEvXQ0mV7Ukjq
   RiBQ3+dsvZPktrkYcdulPezrRPcX/SDafkjo+9uwZ1yHYsiG/XC8wWfjU
   g==;
X-CSE-ConnectionGUID: rMMOBaPpREWHBy6qwz1M5Q==
X-CSE-MsgGUID: a+xkmEj6SNuoQ7VlDsHV7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="82672976"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="82672976"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 10:02:20 -0700
X-CSE-ConnectionGUID: C6qoaNzYQei/vsqKdKj+7Q==
X-CSE-MsgGUID: 82vULcbJRXaDWNTO+XfbZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="250612712"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 10:02:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 10:02:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 10:02:19 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 10:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9LAe5shw6R2GFZXipYlnKt6dy0qkKDHABbdcf+2TlBX/Ck28nhVeK+oYlZ5fMxC6wloAQNTs+bQd8voKtEuP/dOgIXrCxwtAGc6XEuxCBrJvaen5LsmAvkrcPlHKbj61b37mA65C013SQjV1IDb8Hmq3YcEyNHIzlcm2a63Kr6pjZHoW1nHrcwV/nhD4WTQF0ZwD5Kh1Ff4XgIQMBmjYzw8PRApBfCfecmO892BJoft+mIv/ShRaAHNc933D50tOwNdmmwUfInGMnmHE1rEKHWjmrPQtSmpsql7DSqvGSt/wqfjGBElnLd8IL5TzMlEBWx3QyTzArzbVTOSXjmsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP6D88Hg3ImkS3/GVj4oh5U0u59LRdwzIG5hvg18tXI=;
 b=GCi+vK6TANuBUsOSAfjvPMoG+9bh6bsF5bJ9eDyZXyl3BfoYbenoDFytrrR0arPCprute5twHUXP/75XBBFGbne7FOqVFMHdYSDL0moItebTTb11QmEeJUFcQzm7kq/5rGBrNjMA0NWmemSuiUGpk2Hevjfh1FFwiEi390LwCUNaZnut9xZgNaMlG1AIAodGne2QkJA+Pu/x8vhtfHRnZrg2RMrr8dteoxKZ24uVn1YvxtaBlgLrmXSWTDcKNnBcyx2VGuJ7EKL9iHdwAWCILBmxwhd6x3W5dQziqEOHPycX+RE9OeD5Bo63DHC43Zmq2vNEvhONVa9jRhWnvSM2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 17:02:15 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 17:02:15 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "bill.roberts@foss.arm.com" <bill.roberts@foss.arm.com>, "x86@kernel.org"
	<x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "tglx@kernel.org"
	<tglx@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Thread-Topic: [PATCH 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Thread-Index: AQHc/QCGO67nIHPcwU29qMal4CU9pbZWJ1oA//+yuYCAAZBRAA==
Date: Tue, 30 Jun 2026 17:02:15 +0000
Message-ID: <bdc639141ffab267cc8adda78b15679a0b8da010.camel@intel.com>
References: <20260615195156.257950-1-bill.roberts@arm.com>
	 <20260615195156.257950-2-bill.roberts@arm.com>
	 <67e700c8bed2e082efaf68de33ee2c46d16033f3.camel@intel.com>
	 <9e3ca6bd-bd05-40b3-9b6f-85552009537a@foss.arm.com>
In-Reply-To: <9e3ca6bd-bd05-40b3-9b6f-85552009537a@foss.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|CH3PR11MB8443:EE_
x-ms-office365-filtering-correlation-id: 061d8d0b-57fc-44f3-623d-08ded6c955ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|18002099003|22082099003|38070700021|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: U/fN9yfjV9GHU+D3ReK+bxM0DfZOBOZaMIt0eqlTQrUQ1e+/TPszMhXUKP1zkA1eI5c9ObHLnlDv0CwItp5v3a+7nNJZi2vuV7Ydof0NQhTw5FYR47RRMeaR1Oa2Yw5juCq4KnOaT59nHrZtjfBXHld55+/mK0b9OA4jYv2HZyQECSjx1PZsUdhQbDX2edksJMTqNwFSqWkVffPyiadH7CRuQJmk4//1BkuVVHB1iJerneI2bXBC851JUEd0Ug1hNsofSNrdEWCMRgEEO5EVeNYeQwTsMNEOc4kltNlZpmMqtKg5w6mY2gayDS11XoBdwUy0H7fEgQRkWClo0+C6dOP99R/W37HkJnxiEx7oPkWWulCJ555ygaatM1ZjK8XxulBHklGNLrPp8NtXruXRhmI3HqMK4NpY4uyYnyWyyyMbxZvduSE2uQMWe/BzdKx5enJz30ik7dxIurRZ+lxBnKnl94Zt6uSYD13Tt8XWzUTdaRYsZZyrzSr45iBI5cJYwWCiyNW16y0E9RM+O5pvXgEVYwWHYJEGDrI+2c49IiI4HtU5pd2Bmb1CQM6v+AVOp8blpFxhfPXv8CvIhKdnCW3bF8LAgiM95p4udV68jPGjcDgWjsLbsarduzb0d9ejniSprrY/2HY2b/2NGISNMh68TMVitY0fEaxMNHp0jxnhQb31lYEv6Cy5ZySoyDCPe8PCfxHqU8m5Z3K9Z/N6WafYUftWn0uBog2vIqMJB1M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(38070700021)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEo5a1dWSTBFcjlzQkh0eFlLbXRHU2xNTnNhWmY1MUpGQ0lxa0tRbVdXTnJo?=
 =?utf-8?B?QXZMZUJCV2hzNklLRkl4MHhIUFhaZjBUWTN2dHZCaUJ1NVdNaDRuSzF6YU13?=
 =?utf-8?B?REQzTXBIelRRc1hQZTZGTUtJRmdmYVFQYXdZM1JWdDRVWDFsQmQ5SS83UjlS?=
 =?utf-8?B?Tm5pUDlzdW1MWVErYlFhU3lwd2YwSS9uck5EOXVUeDVzcWxnYTJ1OGgvc1RP?=
 =?utf-8?B?ZnN0NFZPNHZwQXFRWjdhczFyeGRoYlgvQnp3cWVoeUZEK1FiYmU5ZzVlbkpJ?=
 =?utf-8?B?MUdSSm85WVVQdXZpaHlKRlNDcXRvT2g2a2dBMEVpbEdnVk5mT21wUjExRTRV?=
 =?utf-8?B?cFVQdTJBNnhvcEV3SzdyQTRaWThQTU9mbFMrcmdRQnhubW5sY0VqQjRCS0Fo?=
 =?utf-8?B?SUhZSlJJNTEvcnZzRXg4TklCaEMxMGdzcVZ6RzRrbjJNb0ovUU4vODZEN1NN?=
 =?utf-8?B?aW83bHJpRTNxUFovdXZ1ZW4vUFgya0did01MZjZDR29KT2JOcllsOWlaRG5j?=
 =?utf-8?B?VzhWd0V4YXRyMElQMkdvUEt1NU02V2dIbkpVQ2U3VTV2OG90Z2xVMWRGS2hh?=
 =?utf-8?B?cllMazkyS2lQd0p1azZpVGs2Z01jcnFjaHlvSjhvK21VdFlPVHMwYmNBZHl1?=
 =?utf-8?B?aURVYk80UW1namo4RXNTU1pkSkJsc2JuWW03K3grUGVGR3llZ1cyTnFOaE5T?=
 =?utf-8?B?U2xHdWpjQXl3L2dKRkhYM3FaY0lkc2hydEZZaGMvUm0zSVBTdC9WSmdScmND?=
 =?utf-8?B?U3JGRW5FLzNxUU9KYkhuU1FHNnBYN3orcEdGQTBtbGlWeFFrYmxQZFFoWXhR?=
 =?utf-8?B?cmpXVVpKT0JWNm0rL1YrWG5qNUtxbDVWb3dJVHRvQzBNRzFGemhJUm53cXhV?=
 =?utf-8?B?RVFHcGVIeW5WUXZjT2J5YVgvd2JJcElnNzVOOEJMZ213SG9Gd1dEZ1cwTFRV?=
 =?utf-8?B?S2VzcGxuc3JTM3NaTmovdmVWcHpIbnVWaG9TcUJiZmtlL3UrVGVnaElNMGsw?=
 =?utf-8?B?c1pNcTM4ajJxd3NyZFphN2psYUg2MFRRclFQVFJGbnFWbUR3VUFTeWc2Zm1U?=
 =?utf-8?B?cWZjQitVV25qbWhtZnZZTHRvUC9Yb2JpMG52RUpTSURDRjJQVFZZM3gvd2h2?=
 =?utf-8?B?ZHhyYitTSENzcm9lcWl0K1pWZ3MxeXBWNm5uRENQQldnVndaSDRWQWhpNHRr?=
 =?utf-8?B?UnJ6bzVlKzRkUk1mQ0hLNUNYUCtoZDRuZ2VLbm9nV0xXVUNEL0plYnVqUFA1?=
 =?utf-8?B?RzE3ZzFtMDgwNFhxSUJoMWJJc3JLVWhEOGpVUU9IaXVYdlZLM3VQWjRtZThC?=
 =?utf-8?B?OWkyWlVPY2FkYXc3Q3BCS1VrRWdmSTZEWVpyck9Hd290eGNyVDJxa2tYWkdq?=
 =?utf-8?B?d1lxTGRRT1R5aENYVTBVNmwzRjM1RUU5ajBicm1kTXdNaVg2UlRZTTY3UjJM?=
 =?utf-8?B?c2NjM0ZMYlJIVFBkc0w3RXZsMHRUb2cxNnRTVXJ0a1p3N2RhVyttWWdvZG9Q?=
 =?utf-8?B?M2ZQbGRVSEp2L1ZVTmlyT1g0UDN6UWxVRXBPRXVjdk5LSk8vNHBPNkRqazVM?=
 =?utf-8?B?djNPWDFrbkZ0VHY4VmN3ZjY1Tnd6OXNPSjhaLzU5ZTA5ZnBNZWtDazhqWGtK?=
 =?utf-8?B?RTRhbFBEWGFsc3Z6SDM2VHlYQSttQXJaUjd0MmFBcXNjd2NLbnM2VWlmZ3Vy?=
 =?utf-8?B?dnpqRDF6b1ZyOGFFSjRVNU10c0ZES3pVQ0RmMHdPdnlweW9vTE5FUENrajc4?=
 =?utf-8?B?RGxGS3AzWCtsVWlzZUh1NC92MHczeEJCandOWUJVZXRTQWdvOTZiTEg2Nzl2?=
 =?utf-8?B?NkNkNWFHcVhkUTdtTFhyUVpKcEJWTzVJaEtKMHNTSzhaV1REYmtvdzJMNXM3?=
 =?utf-8?B?UDJ0OWJvU2I1Nmx3amVVZEtvT2YrOTc0MkxXNTdCWDBhT2YxMXp0cjk2QW9a?=
 =?utf-8?B?R2VSL29VNU44QTQ0ZWwvMUpsKzBKNHNtbm10TmdjWFlRUnZRdUN2SHpEaWwz?=
 =?utf-8?B?bXh5cUFRa3JrOFdRQ0tQSy96Nkg2V1E5MDhxVXdTeG9nWVNNcWcwWE1jSUpX?=
 =?utf-8?B?WWE5ZFpvQUlCS0Y5eUkxbzI1aXQrcUdUMEcySkJPMDN5VjM0OVdkWVdCYkly?=
 =?utf-8?B?Wi8xWVBkUUkyaHU1ZCtIZE1BblNDTnJwU1BYR21aRXpwcm8vcHpFK1dORTFR?=
 =?utf-8?B?eDZEdzEvVGo1UTd6WGpEd1RkbXVJdDhUSk1GeHhqMmRpcXA2K2J0R24wZThS?=
 =?utf-8?B?NkdDd2N0d2owYXg1aFIydDF0ajJIOVRnYWVGaW1RVVNIQWNCNDlWZzlLZjd5?=
 =?utf-8?B?cWppaFNOWm5ueUVxWnM5d05UK21NQjUrMjd0dUNHWlVvTkQ4T0lSblFsMXk2?=
 =?utf-8?Q?Io6ge1EAmOZXijiU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <282208D935A44C41AB72541AF652F6DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: F1oGs+vMeDSUcEoe4ysuBt9aEb6pTENwcgOlLtV76PtctfqVw1eTLb+O3e2YtiTv3yyYiMZv+id4VpPIjwW7k5VIM8t9BN4+6+lBkD1QZvQiB1kB1WybgokNysCyCuLjTjxDd1IWKAkPiTRzCorVCGY/7ScSIfbT787LQ4lFB4apTcYHEHhg/4TvNFk5Kth1n8H4k/VBrESxSg+Qg2d0PCCfw52bGhfNDiAQzU8MiAo4WL2sQlLrHW3QPRRtO/4nj95+kE5gegdqfG+0GJnFlWXD9MCt+9zRbsZ1J0eLj3lRR2C9Oi1vlNwbPZs7Km7QBC99JjgkFu905v2+X4QvBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061d8d0b-57fc-44f3-623d-08ded6c955ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 17:02:15.1374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8VBYT2KWQAUjKZRc0tqllgH7OzVcdYjrxNxgbf0niCCJ227OFxOa93Q0iMmzCCUHQnSrZL1Yes9wryH29IzXds7HebHzx5rUCxGKllZgjno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8443
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI2LTA2LTI5IGF0IDEyOjA5IC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
ID4gPiArCS8qIHRlc3QgdGhhdCB3ZSBjYW4ndCB1c2UgdW5sb2NrIHRvIHNldCBzaGFkb3cgc3Rh
Y2sgKi8NCj4gPiA+ICsJaWYgKCFBUkNIX1BSQ1RMKEFSQ0hfU0hTVEtfVU5MT0NLLCBBUkNIX1NI
U1RLX1NIU1RLKSkgew0KPiA+ID4gKwkJcHJpbnRmKCJbU0tJUF1cdENvdWxkIGVuYWJsZSBTaGFk
b3cgc3RhY2sgdmlhIFVOTE9DS1xuIik7DQo+ID4gPiArCQlyZXR1cm4gMTsNCj4gPiA+ICsJfQ0K
PiA+IE1vcmUgZ2VuZXJhbGx5LCB3ZSBzaG91bGQgbm90IGJlIGFibGUgdG8gdXNlIEFSQ0hfU0hT
VEtfVU5MT0NLIGhlcmUuIENhbiB3ZQ0KPiA+IG1ha2UNCj4gPiB0aGUgY29tbWVudCBnZW5lcmlj
IGFuZCBub3QgY2hlY2tpbmcgZm9yIGEgc3BlY2lmaWMgYnVnPyBCZWNhdXNlIGl0IGRvZXMNCj4g
PiBtb3JlDQo+ID4gdGhhbiB0aGF0Lg0KPiANCj4gSGV5IFJpY2ssIG5vdCByZWFsbHkgc3VyZSBo
b3cgSSBjb3VsZCBtYWtlIHRoZSBnaXQgY29tbWl0IG1lc3NhZ2UgYW5kIA0KPiB0aGUgY29tbWVu
dA0KPiBtb3JlIGdlbmVyaWMsIGFzIHRoZXkgc2VlbSByZWFsbHkgZ2VuZXJpYywgY2FuIHlvdSBw
bGVhc2UgYmUgbW9yZSANCj4gc3BlY2lmaWMgb3IgZ2l2ZSBtZQ0KPiBhIGJsdXJiIHlvdSdyZSBs
b29raW5nIGZvciBoZXJlPw0KDQpJIHdhcyB0aGlua2luZyB0aGF0IHRoZSBjb21tZW50IHdhcyBz
cGVjaWZpY2FsbHkgYWJvdXQgQVJDSF9TSFNUS19VTkxPQ0sgYmVpbmcNCmFibGUgdG8gc2V0IHNo
YWRvdyBzdGFjay4gQnV0IGl0IGlzIHJlYWxseSB0ZXN0aW5nIHdoZXRoZXIgQVJDSF9TSFNUS19V
TkxPQ0sgY2FuDQpiZSBjYWxsZWQgYXQgYWxsLiBTbyBtYXliZToNCg0KLyoNCiAqIFRlc3QgdGhh
dCBBUkNIX1NIU1RLX1VOTE9DSyBjYW4ndCBiZSBjYWxsZWQNCiAqIGZyb20gbm9ybWFsIChub24t
cHRyYWNlKSBjb250ZXh0Lg0KICovDQo=

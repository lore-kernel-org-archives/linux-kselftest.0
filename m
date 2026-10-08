Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D060D3B6BFA;
	Thu,  8 Oct 2026 23:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791501106; cv=fail; b=q506VNZR7B1nPdO6doSOGv2BryVVj8SeVewRxseneluFa64Yj7dD7+xClytjZbhgXMrElKn13AIVXw7f4UtchzmV0A63faQiovOE51NdeQmmT8Wa4gZxqdkVOlzW0EsCAv+DKat1wRZ7aym9JxgqKPxcv2hqNz8PlGHxrgkhlF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791501106; c=relaxed/simple;
	bh=4eU9Ysr5LvT6Rd5eVCm+qSfd1NyNztDeKEr3j8XcGTM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oTovW3olTx1esjdqFIe31RDbA7I+4CWBwfPVINn6cSQr6rvZVyuI+SjxDrgaflbknLpRFf7wxO0ztTG/6l3f5inLr8lbqoLsUVRNvE3esMVld1OXWKWW6L9hDddDeWbJ6IQsf/8axbPD4pZpFJc2w39wg41MFExV/pYm5eIucIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEx/RtUq; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEx/RtUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791501106; x=1823037106;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4eU9Ysr5LvT6Rd5eVCm+qSfd1NyNztDeKEr3j8XcGTM=;
  b=IEx/RtUq+30Gfhu72tivuzD82zYHRoOlF689GWZvGyAeaO/NmJo1OgRy
   lqVeE1L1685ucjdzK92uodryH5JKcDmCsBLYd0iKITWGJ57wib6ay/u7s
   knliXb2Hj9WS6rPjcQp5ZT27VHl4TnPMTgzQNz37BATWeePI8mWE6CcIL
   JFbjPXDfB5Z/YYZFnZfBNkMBAhr+ZPFI7mksajRovP4VmyCFlDCeFNzra
   Yzf+2r+ePKDM6YC35grMNaf10MCzmVhJgMnRfvsBaD0XE5lfdUfKPP5eb
   4cndIoOonXm5EZXPr3ojdSKDBmEjLeTP/Ey7/BvHjjzJyUaIG14xo1D2Z
   A==;
X-CSE-ConnectionGUID: 9NeHFY52Sx+l/ihdCTNfxQ==
X-CSE-MsgGUID: Mt48waiLTTKDq1+5gJMIDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="299127"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="299127"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 16:11:45 -0700
X-CSE-ConnectionGUID: twkn2lLYQ5mLR+HHdq/mYg==
X-CSE-MsgGUID: ee3znOhjT4eovZDqznb3Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="485254"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 16:11:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 16:11:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 16:11:43 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 16:11:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtvUm2mcD2JZvGl5ANSKYciBIwV24wTgOr4OcSlHhKDlswWPibq6G5HZi3hip57LFCi3x/ovOl9jXZPtJua/HYhW5jk3BTc1h/J5M6G1P6PngJpddpQflg6rg/vC1HXqY1g1FNhyu9JI5DCQ0faPqkHEDAC+uQtOKT7ONiUKXn3aM+brAp4obr0WUAjmfnr3DOvM+hT4taWS5glXtKtgLT+yHNFX8S5nNFBu+PswwHCCvFEh6miEXPwk5ogNCqQuRzZvHp4Y4Gc7fSIWLL7T0elhyU4oGTWuFuPeYPmoWFx7ZnCFYvoSQ52+uUcfXSelKEHBGpWBgHYQJc3Yn37VMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eU9Ysr5LvT6Rd5eVCm+qSfd1NyNztDeKEr3j8XcGTM=;
 b=l97u7SJ57y//GgEKH4qEv2rbLVGCVwNcWNIL9Gkm6V6LmFQnjfmXLYV5eSBqhlhspKihymCWgxWMkN7ZjAAoP0F76tbt9XGI/kHpiJRJPMJ8U1NZ3zAXFkztuq0rSoxlDohLC50TVBIWgkIbEpwlHLHZBKSLjQxUUMvzMFlHzpE2lA41eySPcYJtLPbfd3k8xIsYkUOviQmdKVeyUiXBwIbnM93jsNTF3c85lal76MGoFvk55HijId223pXM7XJqoK7eC1PdKymAyVjvihf9VXqGXW6dxH8e1JbTZsBMOJHk0/HmUA0+hemSn778XjjmiSyzUi+X1Siy7MteKoOZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 23:11:41 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 23:11:41 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "ripatel@wii.dev" <ripatel@wii.dev>
CC: "kees@kernel.org" <kees@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "shuah@kernel.org" <shuah@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "tglx@kernel.org"
	<tglx@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/3] x86/shstk: ban ia32 sigreturn when shadow stack is
 enabled
Thread-Topic: [PATCH 1/3] x86/shstk: ban ia32 sigreturn when shadow stack is
 enabled
Thread-Index: AQHdV2H/JX9B3LcQ60+tcfWPj/4EOLb0IS6AgAAOAwCAAAxGgIAAA9uAgAAGqgA=
Date: Thu, 8 Oct 2026 23:11:41 +0000
Message-ID: <f78ade122593ecdd686ec1b29340b0124b925c48.camel@intel.com>
References: <20261008201610.1003569-1-ripatel@wii.dev>
	 <20261008201610.1003569-2-ripatel@wii.dev>
	 <e1a26ac75c39673d043b2860f848827fecbcb843.camel@intel.com>
	 <asgQDlpnDwu04oZc@wii.dev>
	 <6deab6fec99c65408a19b9036d67ce7f1fab54b5.camel@intel.com>
	 <asgdlclj3MgtGrSp@wii.dev>
In-Reply-To: <asgdlclj3MgtGrSp@wii.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|MW3PR11MB4666:EE_
x-ms-office365-filtering-correlation-id: 1ab3d94e-b03a-4f4d-8aee-08df25918331
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|22082099003|10067099003|18002099003|38070700021|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: XzdoiBjVJ2nVKoBUQ0JccEV4Nswx2UTpmqG/nuML4O4q/ThlEOCaDPaqr6Gj83VQvDvZUDn+UA83lZDvDYoEtHZFHCyqgKcv/X11VCTPKeYoOlsG++F7A3Uc3dX/nJwxIXCxxAsYTwNdWNBZsEv9/L9Khojhb392rM4jdmPGmQ7VIkbGJpk7jtniClnIEp+P3olkb9QvNEiuPgS2RgwzMpOAX2ZDJzSAXPp9LK12e1XI9WziGblvObZbM7rQIIzYF55mZId6cgXf47W9pC4+tVZer4+wFE30s7mY3WIDnAbZLdKUki5fNC5XX8J9MhOfbe/tkqO98e0hqH4XPSQ6YG5c3lnw93G8u1R/H1YPml7utLRU5hrwIJ72DQ4MNTQCuweZvbuXlS+y9WdlhAfVjEZtfUs1BYH0sIY1eSSA9ASlez5nQ9hBkCNBZcbIzf35g4l5XAzw/YVerO4gD/uhGkY9XWGCanVzZmh4qWmenjtV95F63MM8Zi8R42cBd3LED/2oJVtMEr395t7djtuYxJUKhsdBAKgdefjgKDhGPJNUyFUgqeuwVDZ7mMKq9sHxiY+aSJU6IoM6X9DaMOFQiIkKqnS5tFzA6NibRQ2pL8UbxuuQfakUac7Y6SpaZq9K9ASBjDOTnDtYXghA3OupIAMsmc1Pn+td5MapbhL3McR57KQkr+SvmlJFs2cq74sFy1l1OKdpT5fVcIql/Wvla2+gaKYEpreW6CJtfQxba3s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(10067099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1J2TFJFU29Nd05ZY3l5WWptZ0VsRlBtdjBhbE55K08xcWczeW9PQ3BiblEz?=
 =?utf-8?B?dUJRT1JkMFRaVHpIcXorQ3hScWlhTXAvNnM5eWp0SVRialBjeWVqdHZVQmoy?=
 =?utf-8?B?QjdGZEIrS0E4eThIQmJ3SElDOVY4ZlFtSUhpa0JIK2grRG9KVUQrbEN3bXhO?=
 =?utf-8?B?eExFTzBvaXk5UXhxZ3ZsdEw4WnZFWjlRNkt4MWtFbnR2TWN0M3FCTEpsdXAx?=
 =?utf-8?B?N09mM0ZlVkxCM1FHdXMySWNseUM2MDdRelAwbXZYYVpTQ3cyQVM3SitGWTRJ?=
 =?utf-8?B?UFZRWCtmVnNQWERMRXI2MXBYSCtrMGpaKzA2ajY4dDBiUm53WERadlF5aTRC?=
 =?utf-8?B?UURCOFZDQ1BmeTk4UzVDbS80QVNOQ2FTajdIZ2N4d3c5VHk5b0IybnV0R01K?=
 =?utf-8?B?T3JzeUJzT1ZsUHh2RlpBaUJjR3N4c3NOVGEwcTdCS21SWHN1czdiVVErcGVJ?=
 =?utf-8?B?Y1RjOW0rY3U0RG1ldTE2ZEo3NXN1OTFjUGFFelBDeWhRb1dTQjBnejRZbU55?=
 =?utf-8?B?cGZNeVBiQnA5cCtEYlVzd0Zra0tuZG0ySWJ4R3dJaWhmdWZCeUdwdTIzbVBm?=
 =?utf-8?B?VDA5NkoyS3Y2VWtZb1Q4dUxhdjU1d0xDcHVHSWNsY2c1N2hIZ1JyVUYvZWlx?=
 =?utf-8?B?VHVTM3ZaMG5OQmtUZHpkT2d5L3N4bHN0ZHVHOVhmL1lVNFhXK3JFQzdKaFBE?=
 =?utf-8?B?RjM4RGY1RVRkZ05Zcm1WV2FiTms2dXlrbnJtdGNudmdUcTZYbWRaMEE4TFFX?=
 =?utf-8?B?TC9JcUZHbGJDeW8va1huWXYrSWpmdHpzTXFRTVRLQzFoV2Y0eXZ6YndXSTJ5?=
 =?utf-8?B?am1TN3VyREJ3QVRMbXN2NVJ6eVY1NC9lZ214RDVoOUZwRVdCYitVSXNhOFJ0?=
 =?utf-8?B?SHdBaGQwSkM2a0xxemFFLzU2dXQ2ZSswc25xcVBVTlNreHRMektlNjMrVXZ4?=
 =?utf-8?B?aThjTFVpYXh6eVcySTJXSkxadUFtZTg5R0xUYXlmVkdLd1MwbTRLQ291YmVl?=
 =?utf-8?B?Y1krR2xDbGtEOTQ4T1F6dm9EdVZhL0d3MnVicEVMS3JweExRU2xDc1ZuaHVS?=
 =?utf-8?B?MDZFUkxBVkd0QURSeGVxS3RWcVpMeDdmdEhqdkMzamhMNVBLTEhJNlRScElz?=
 =?utf-8?B?UjZCUTl3ekxVQldYVEh5ZzU0MzdxZEZwTFVMd0s5aEM3NEJ2RDlYK0Z3MWFI?=
 =?utf-8?B?VTgzTmErYWZldEMzbFEwL0NwVmR6Rlhha3ZuVDdFbi9wUGt2clQ2UXljUnJl?=
 =?utf-8?B?TGxhMGpSMXZTa1NQaUtkT3lrZ0JVWjZ1RDhVSjhWbnBXeUM0ZzR1cW11VGRC?=
 =?utf-8?B?bFBVYjlOUXNodUpML3hCNVp4SW1aN0VvM3ZWa0k5OVpsRWgrN3l6U0hjMUFC?=
 =?utf-8?B?cmJ1N0wySExabHZtbVNpY1N6bXRoZHNMWmk0M0pLT0Fya2FDOHhwcTNDRG5W?=
 =?utf-8?B?QzNFaFB0NnVTcVhiRTYvV2ZSd2ZuNk1jaEpiRVF1cGd3RFlOWEJlVUhVSHgw?=
 =?utf-8?B?dVRVZ2VicExjUDFnZW1RTG41cEZJS3JUVHJ1T1ArMmIwUld6dUpPSnBKVHBX?=
 =?utf-8?B?ZnE1Mk9XTnF2VW1GUDZWZDJ0cXlmRlhoM1NxYlRwZDdJaitTNG1sOER5dzJV?=
 =?utf-8?B?eDBsNnlWRzhsbDlTTThDZzhXd2xLMVdLZkZacGJpamtjT0pEYTlvMXg5U2Vl?=
 =?utf-8?B?RmNXWFlIRFZIZEplQjhnOXJwZFdqdDcrQmEzMFB1bWRRaUt0Q2l0VGEzOUhp?=
 =?utf-8?B?SzZnem80ekt4NlJ6a3k4MktIWnVUN3Y3dDBlMkozU3pTeVVRejZiVkQ0MnRS?=
 =?utf-8?B?UkVWeUJxNkRPK2NXV2hzTzV4Yytrd2xCOXpKZkRKdldjbmh1WE1PSG42bDVw?=
 =?utf-8?B?dFdoRGlsVk9CVUpuQVkvZjJRalZVQVRxR0JaM3UydnNCblJnOWdBSU9PYVI0?=
 =?utf-8?B?ZUNMekpiSVFhRWFuM1o0WW1FSVBKM2MzUEtKdzFqN2N1MVJWRFhTMVhxU1gw?=
 =?utf-8?B?OWdsbXU3dm9jZXR3eHhuRFNOZGk4bE9HMU1sc3BYNndIMkZHVmVEcUtsRExK?=
 =?utf-8?B?eVF2ckhyZ3orTThmbnRGVFhORDNUTVV4U0FML1ZvdHFhUkVjTDNpTXlOYlZz?=
 =?utf-8?B?YVI4RFBRU3o2TVB6eWUrWU5DTUJTTmVjUE9keERPYXpON0lmZmFhUmtGangz?=
 =?utf-8?B?ZFFHdTBGek1xNXVXL2Y0aUNzeXFqZkxMMVJWTW5QYUVDR3hQOUMvVFFqZjVa?=
 =?utf-8?B?d0ttTWdEZDl4d05UT0JpYldiZE40RkkwOUhBTnJIN3Y2RklEVVpBanF1SDMy?=
 =?utf-8?B?elZSUWJYVkg0N1JFZ1N2MDllQllHcmNsWERsNDA5a3pjUkpKZ2QvQ2RSYWox?=
 =?utf-8?Q?2lFY4wck2QkP5xU4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5EB6DE7E33BA444952DA9EB11DF87FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KT/1NUJtN5aMMRIFVV7z6DByut2qXcc61rc1g4BnSWpUkCXlRcYi7l9Ds9axreNmnrqRCT2UTnynQLIx616pqN7EseXy3mYkYY9djDxPKHzdh/75v6zam21bdDQGI0ilRacJV5kEuuRpJZjGIa6TxzC+qKB7WtOrVH8nAFXChOv7BGxbUECmObEwU1fshe4rkfMjGETWCwE7SkaXUsfG5PSZEmsZdn8p3N386q+23z7bG2MoAleHXsaqI0skKQLHOfNQGMpeuk1Fxf0GYNPiPy/1ZBhXEE5yLGVWW50zk2UYad1YPOCIZa/8fLYvxAu41jT+esgDlWkkmXQV7qCClQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab3d94e-b03a-4f4d-8aee-08df25918331
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 23:11:41.1135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJhmP7fOkbbjN3SXCHIq32cNyWOgWFJWsF+psasy+H4pm3PgN1/qUJgTOC+NpIHh11I2cI1awagDtGOxMhryYCJldHsBMgbMjtU9jmuKYYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDIyOjQ3ICswMDAwLCBSaWNoYXJkIFBhdGVsIHdyb3RlOg0K
PiA+IEJ1dCB0b2RheSBzZXR0aW5nIEVJUCB0byBhbiBhcmJpdHJhcnkgcG9pbnQgaXMgZmFpcmx5
IGVhc3kuIEJ1dCBldmVuIGluIGENCj4gPiBmdXR1cmUNCj4gPiBjYXNlIG9mIElCVCBlbmFibGVk
LCBzaGFkb3cgc3RhY2sgd291bGQgc3RpbGwgbmVlZCBlbmhhbmNlbWVudHMgZm9yIHRoZQ0KPiA+
IG5vcm1hbA0KPiA+IDY0IGJpdCBydW50aW1lIHRvIHByZXZlbnQgdGhpcy4gDQo+IA0KPiBXaGF0
IGRvIHlvdSB0aGluayBvZiBjcmVhdGluZyBhIHNoYWRvdyBzdGFjayBmcmFtZSBvbiBzaWduYWwg
ZGVsaXZlcnkNCj4gYW5kIHBvcHBpbmcgdGhhdCBvbiBzaWdyZXR1cm4/IEkgc3VwcG9zZSB0aGF0
IHdvdWxkIG5lZWQgc2lnbG9uZ2ptcA0KPiBtb2RpZmljYXRpb25zIGFuZCBwcm9iYWJseSBicmVh
ayBDUklVLiA6KA0KDQpZZXMgSSBkaWRuJ3Qga25vdyB0aGV5IGRpZCBub3QgcGFyc2UgdGhlIHNo
YWRvdyBzdGFjayBzaWduYWwgZnJhbWUNCmFwcHJvcHJpYXRlbHkuIFRoYXQgaXMgdW5mb3J0dW5h
dGUuIEJ1dCB3ZSBjYW4gc3RpbGwgZXZvbHZlIHRoZSBzaGFkb3cgc3RhY2sgQUJJDQpieSBhZGRp
bmcgbmV3IG1vZGVzIHRvIHRoZSBlbmFibGUgcHJjdGwgaWYgd2Ugd2FudC4NCg0KPiANCj4gSSB3
b25kZXIgaWYgdGhlcmUgYXJlIHJlYWwgYXBwcyB0aGF0IGFidXNlIHNpZ3JldHVybiBhcyBhIGZv
cndhcmQgZWRnZS4NCj4gSWYgc28sIHRoZXkgc2hvdWxkIG5vdCBiZSBhZHZlcnRpc2luZyB0aGVp
ciBEU08gYXMgc2hzdGstY29tcGF0aWJsZS4NCg0KVGhlIHdpc2hlcyBmcm9tIHRoZSBnbGliYy9k
aXN0cm8gc2lkZSB3ZXJlIHRvIHN1cHBvcnQgYXMgbWFueSBhcHBzIGFzIHBvc3NpYmxlLg0KVGhl
IG90aGVyIHdheSB3b3VsZCBiZSB0byBjcmVhdGUgYSBtb3JlIGxvY2tlZCBkb3duIG1vZGUgd2hl
cmUgZGV2ZWxvcGVycyBuZWVkDQp0byBjYXJlZnVsbHkgdmVyaWZ5IHRoZWlyIGFwcHMuDQoNCj4g
DQo+ID4gSW4gdGhlIHBhc3Qgd2UgZGlzY3Vzc2VkIGhhc2hpbmcgc29tZSBhbW91bnQgb2YgdGhl
IHNpZ2ZyYW1lIGFuZCBwdXR0aW5nIGl0DQo+ID4gb24NCj4gPiB0aGUgc2hhZG93IHN0YWNrIHRv
IGdpdmUgc29tZSBzaWdmcmFtZSBpbnRlZ3JpdHkuIEJ1dCB0aGlzIHJ1bnMgdGhlIHJpc2sgb2YN
Cj4gPiBicmVha2luZyBhcHBzIHNvIHdvdWxkIG5lZWQgdG8gYmUgYW4gb3B0LWluIGVuaGFuY2Vt
ZW50Lg0KPiANCj4gWWVzIHRoYXQgc2VlbXMgYSBiaXQgZXhjZXNzaXZlIHRvIG1lLiBBdCBsZWFz
dCwgdGhlIDY0LWJpdCBwYXRoIHByb3RlY3RzDQo+IGFnYWluc3Qgb2J2aW91c2x5IGZvcmdlZCBz
aWduYWwgZnJhbWVzLCBzbyBtYXliZSB0aGVyZSBpcyBzdGlsbCBhIGNhc2UNCj4gZm9yIHRoZSBw
YXRjaD8NCg0KRm9yIHRoZSAzMiBiaXQgc2lnbmFsIGJsb2NraW5nIHBhdGNoPyBJJ20gbm90IHN1
cmUgd2h5IG9uIHRoZSBzZWN1cml0eSBncm91bmRzLg0KSSB0aGluayBpdCBkZXBlbmRzIG9uIGhv
dyBtdWNoIHdlIHdhbnQgdG8gZGVmbGVjdCBpYTMyIG1pc2NoaWVmIHZzIGp1c3QgaWdub3JlDQpp
dC4NCg0KVG8gbWUgaXQgaXMgYSBjb3N0L2JlbmVmaXQgdGhpbmcuIEhhdmluZyB0byB0aGluayB0
aHJvdWdoIHdoaWNoIHN5c2NhbGxzIG1hdHRlcg0Kd2FzIHRoZSBwb2ludCBvZiBibG9ja2luZyAz
MiBiaXQgcnVudGltZSBpbiB0aGUgZmlyc3QgcGxhY2UsIHNvIHRoaXMgZXZhbHVhdGlvbg0Kc2Vl
bXMgdG9vIGhpZ2ggb24gdGhlIGNvc3QuIElmIHdlIGRvIGFueXRoaW5nIG1vcmUsIGl0IHNob3Vs
ZCBiZSBhbm90aGVyIHNtYWxsDQphbmQgY29tcGxldGUgdGhpbmcuIExpa2UgYmxvY2tpbmcgYWxs
IDMyIGJpdCBzeXNjYWxscy4NCg==

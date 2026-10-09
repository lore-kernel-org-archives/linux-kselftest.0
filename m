Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89432339B41;
	Fri,  9 Oct 2026 22:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584056; cv=fail; b=MR7pf+attRudDUvLDUe2hMHb9HfVHjceIKIQ67DSCdeHtoUpKxHtFPY5ndjNt7gOwXHCBebgK949ROIp+2wuDrVSJuWDndRjrXqtxTL+9qbaC9iCpigHW6TsyH5lvP8X+PWjb+Zy9vpbkeYeyypa6haj+3aRDpuKH5ZG/b2a/U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584056; c=relaxed/simple;
	bh=YrR6uGEErEII+QT3RHarEyFyLW8PBs8wtIh8WoEo4yg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W3MJxfFhkPe44dEcaOgeoCVjhnQbmFIewt4gglCGhGz172BbCbkxY/PDm/3ukdEl19XjYxk2pWIw+gpimCsozA6EU9HeVc03GVSAYrL2gxhI+jTz7QnmKR8qh4sMYrZjYtsu5Zrp4yAsV/PNbIkLIaw9dO2jv0nCNboSt5u6ilk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDzLGZKH; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDzLGZKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791584051; x=1823120051;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YrR6uGEErEII+QT3RHarEyFyLW8PBs8wtIh8WoEo4yg=;
  b=MDzLGZKHHCcIH13rtPmQrG7rF/zmFeipo5y6pIwcuYJ/W5j9bxNTeuRg
   NuqHxEoFOb1KDekzno/nmHmo8ZjrpPjzRr7LMok9rqXoYv/kC6VnRXhcQ
   iMqkxlrKw0htP8xXmekS1tL49sCwXIw95n7ue+N2CdcyGln+BgqEfJk2F
   T4rwBM+zVTZ/MWnefHVEG2FKenj8ZT0qd/i8fNMrbGBjTprZnJsRUocsZ
   zIEV/GWjBOPkm0G0nxrMdZf+dhzNO3jWFTE22ktkgL1wxy4JjDcjA6SMI
   3s0/xNnQp846GNXulVBD8eCwFmYn6ed8Ud3EMpbqInVWG5t5iUwnpHW47
   A==;
X-CSE-ConnectionGUID: NdqNlSI7Qr2OTaQM3YC3eA==
X-CSE-MsgGUID: KLDXfL4ZRuah+S8i16m9dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="290637"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="290637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 15:14:11 -0700
X-CSE-ConnectionGUID: KisxnExXQZyJFMc0vCz7dw==
X-CSE-MsgGUID: /Z+qgC+xTO6+iAHjsKfj2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="373533"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 15:14:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 15:14:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 15:14:10 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 15:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2p88VckhsJmIoXq2XvCxFgr8j9EyA35NwcrPX+i0ykXf081BI1E3XPTRov8H1k1h4FbhxYcBc6Be8oShOFTzP22MyfhqoT0IsnrVjpEeP9dqKZiPK8uWexuUjYJaswErU510Kq04i+eTgw82E0p8MDH/FRWh/8GsBJqJiqEuCyH9jc9yNG+LZ4NjleK23yeSoAxwvcNRQe0OFLCgutOyxov6uoEMWwgbZXkRFfz5M9ebb4P/hPqTgfDIPjquxk1Id56NkHWTKLw71MlD7ifVHSa4smifwA+c9PCCBGVW6IV8Rk4a71ASRUU+bia1nIpAO1tOJnPfrpTV3eFPON3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrR6uGEErEII+QT3RHarEyFyLW8PBs8wtIh8WoEo4yg=;
 b=DAWJHvNrS7E/xbFQhKLGVsLyWHztf3HM43sI3cOfBxamCjpeCP3nPdVc1kSgvcb8TYMCh5NKn/qqlw5CaThKUBVuAPfNMBenA37I0iaAraur0Stf5pkKDoysuzNH0sGJ5XiqdoCpt4eVQaDtxEFwmOihoswYihoQ2FTD7xFLkq/FxI8OTcKxgNaVZJZZ5xea+Z0Px8ZDXwE2HNYFRbwBAmqnZS9+eGhHoMFQNJz31EfgjxaqaCn9Qaqvq2UH91uk/SgwP7h7fWdULgqJipn5diKTnpPbiLksdLotaLy/KtZaFuL7ke5jVg8fKa+6LiYb/xfx1k+IBIXpY+vHgtVTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by DM3PPF3E6742BA8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Fri, 9 Oct
 2026 22:14:03 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 22:14:02 +0000
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
Thread-Index: AQHdV2H/JX9B3LcQ60+tcfWPj/4EOLb0IS6AgAAOAwCAAAxGgIAAA9uAgAAGqgCAANASgIAAsigA
Date: Fri, 9 Oct 2026 22:14:02 +0000
Message-ID: <bb352ccd1939c6e01f1e71a12fc457b8051bc04a.camel@intel.com>
References: <20261008201610.1003569-1-ripatel@wii.dev>
	 <20261008201610.1003569-2-ripatel@wii.dev>
	 <e1a26ac75c39673d043b2860f848827fecbcb843.camel@intel.com>
	 <asgQDlpnDwu04oZc@wii.dev>
	 <6deab6fec99c65408a19b9036d67ce7f1fab54b5.camel@intel.com>
	 <asgdlclj3MgtGrSp@wii.dev>
	 <f78ade122593ecdd686ec1b29340b0124b925c48.camel@intel.com>
	 <asjRt49FfzdP4pxk@wii.dev>
In-Reply-To: <asjRt49FfzdP4pxk@wii.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|DM3PPF3E6742BA8:EE_
x-ms-office365-filtering-correlation-id: a638eca9-0f26-47d4-aceb-08df2652a04d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|38070700021|11063799006|56012099006|4143699003|18002099003|10067099003|22082099003;
x-microsoft-antispam-message-info: BxadXYhigfBNNVx8X3QAhAmeBb8Or+o1KugsiCdfGzlnCdDoqt3GlsEZXroKUllsNSqDpMNo7cWu40jbWkY2xYDUe779ieKSCygC9JUzk4BUNG19EoRy2qDtm/c6yrVnyxkR6kZ5MylrgCIaAfRUWCLedeIckWG2WYh5i7El8PXEjFhcw7VUlmisnUZDApekUFZQqRoe2mowF4mnMg2N9k71ZpKfwh5cD8aWV50QX79xUYlR9P7/T73G7RlvCnu+j1ZWxBPQ/CPuNvBfGmHFgrHLV9UOPvGLUFPkQBqxoUeoPrD5qhK5KHF0ww+nubEeHwqFtOIyONXQlQSTR6Q+RMK+rFGX3TiWBb8LdY8yjvGF//yFRfezW66fo4NZYFTxnWPib5GW49MdDVdu1ibZwx+IIr3vbYfodTz1I7xi5dIVyEnrHfVKWaX1OhVjfsr6bPDa5R4HJzM0oxgjUoHV9bgXo2u3422k812xRBrrfdYsJEI3liqzya/hsgJn4Msnuk+Oh0o/iSkpmgzxxLnsifmDehH2IQZRiEljhgH9ptp3C5vLY9Cin5H1gJMSnMpkk9zJAAZajgl7DDYAxRLNm9wYWk9IRS+KCxFG1cn9LJlFbt23M1e36ACEpZcLrDS5EPXqAFjkvu4H9ELmnhW0mzeK4u633btntiwus9kYaCFpR8KWJuRuKdD6n8sfGrvHTXYqwJDMa6AD8JKZhb/nwYT6DBKPdg/WSUmru79W8iA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(38070700021)(11063799006)(56012099006)(4143699003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjlCQUhTNFNhNGxlM1phQWhMUmRDWTBjdGNqYWRVZVpFYVRWczcxQ290WUIy?=
 =?utf-8?B?c2svcmxDSDVpem9ZQ2Q1VjM1NjR4eFV4SDAvME02ejdOblhnaGZjaE1WOVJZ?=
 =?utf-8?B?czQ2S29ZaVNubStWU21PRGhiNjFsNndIVUZhSi9QeExOcjRyTW9PNTFFcXlF?=
 =?utf-8?B?MFFLNUltdUwrVWZRNndaek5vdzBEWG0xUHBNbW81T0VJNWtEWDdKS1hYRHRo?=
 =?utf-8?B?M1dRbWR6ZWo0S0RxaklnTnVOYVhBWWxYV0lCZlQyVVk3N0VhYW9oOTJDL0g0?=
 =?utf-8?B?SktQV1poVm5VS2dGWlZsNXh2c0VuN2dYZzB4RWVuaW1DSm8vNUpEU2hHNU13?=
 =?utf-8?B?bjdHdStvQ3hzcGpMbDdGT1pPY2lyeWdjM2IwZlpTbm5oczFQVzY2bEE1QXVv?=
 =?utf-8?B?STdMY1VrOWxCQXN6UG1zcVhQenQ3b0hDLy9oS2d5RTA2aXNJTCtwUzlUVyty?=
 =?utf-8?B?N3pXMXJPM2k5eHZwWk4yMVJZVWN2c0VPd2dLNVFlVlZNK1NoYWU2VFpYOU9U?=
 =?utf-8?B?ck1OL1RpV3h1cFF6RUQ0b09zeXR0b2NTYUlSMmNYaFFuL1NzbytNb3VCa3Vp?=
 =?utf-8?B?bVEzaXEwUyt6djRNOHBDcDJvMVBrTWdMQy9WcVRTdTBnc01pRHF5Vnp3dGxY?=
 =?utf-8?B?d2JCelZ0dEdocjdiZTdaWHlGM05GUER3dmd5YVRva0xya1I5NXNqTkZtbmsy?=
 =?utf-8?B?SUZCd1RSdnNnb2M3MXJkbTExZmdkd0Q3cnMvSW5wZnY1SWVXcHU5U3BSa3NS?=
 =?utf-8?B?VVNRVjNxc3FvcldXaG81K3dSRUtuVDkzbFhUQVVXS25ueUFDMUU2V0s0WXVE?=
 =?utf-8?B?Q2FUTGpObGErREVrZGtRYTU4TW85a2x4NmhqVy9ldzM0azJhMjZBMHRPek9r?=
 =?utf-8?B?eG1mcWZ2a3pMNDJ5cS9qVnpDT2dHdENNTkFURGVQMWNFQnErbExhYlFSUW8r?=
 =?utf-8?B?czZTMXhCN0hhMWUvTHFNeE9QSzlrS09QME1oWld5SWFoWkZld0g2K2MwK0tr?=
 =?utf-8?B?WnRnckxMZkdteXlyNzVvemNwRDViSDczWEphNDFHVE43Z1JFM3F4TUgwT3Yz?=
 =?utf-8?B?dHA3VDZNTjBhTDV4VzhGTElkZmhlYU5NYU15T0RodUErL01BbitIVm1VaEtu?=
 =?utf-8?B?T293THBjQVVoUUpBSk04b0NqdE4rWStvY0dac2NWMnVocGhramlabDA5bDRW?=
 =?utf-8?B?TlR0cEVnQzVuL0tlcUpqYyszSWJLZHhTL1FnbE1NSDNndXRlZ2F4MDQwQVdX?=
 =?utf-8?B?eEVwdTFhYUY3WVpHT0VrQzNZdUxwQVBVU0oxdTVKVGd3OFVkaVFpQ2FycG4x?=
 =?utf-8?B?UkpWK1NrZ0ZtaEs4QUE4Z2xmSG5FZklKSC9VVmptZVlDa242QW9JRGcyRmNp?=
 =?utf-8?B?NWR0SHhTbHMzakliMlVPV2lWMW8xaDFMVEJ1ZmFxR3ZmeEpXTHdhQ1dYdllQ?=
 =?utf-8?B?NUo0ZEYvUkdaMkkzMlJQNGw0OWd6TkJhQVgxNXJZNGFZQ3ZXZHJJMExwLzk4?=
 =?utf-8?B?Q29rTDVCUEZKQnNWTWJ6NC9qMTIwWWp1WFFNZFYwbURSSW4vaDIvb0poMVZ3?=
 =?utf-8?B?WGtiNkc2bHVNY2tjWnp5dzlQYW5qZHR6cHZaandTeUVOYWhhUjVmSHFxMFJk?=
 =?utf-8?B?dXg0RjJqWGVYUnRtaXJVc1BqRW9XMkRsY2RNUlRVN1ZONDNxWXRCSk93eldi?=
 =?utf-8?B?K1NZQzBxbTIxOFVSWVBQeUIweDZ1TkUyWDVpV1JzdnZibDJlKytuVFp5VW9C?=
 =?utf-8?B?Z0VyekVSWERDMUFXc3pmaisrdlY4TmpDaW9zN2kyNVprbEJuTC9QRzRnWWlT?=
 =?utf-8?B?bVNGUlFkYWlNVVdKR0hRRkhYWSt3d2pMUUJaQ0RySHhHdjdFTE1SYi9CcGZE?=
 =?utf-8?B?RTVJeGVISHVJUURlZCtRODZ1TjZldkF5R1ZMS3Nrb2NnVXF6M2x6WXVtWlUw?=
 =?utf-8?B?L0tkWE1QMzJtTWJsNjlmc2dDMGZZcWtBU0N3RjBwV2tPWjVxY3FOZlBEaEEv?=
 =?utf-8?B?Mzk4VHVPbFMrOFpWSkRKdnozaWljTXh5Y1BDbjBCcmFPeGUyUTUyZkN5eHQw?=
 =?utf-8?B?WjJQMk1VRnFNNmVUU2piSXBVazFFLzFVb0d6R21tSDJSQ0orVE5SckhXVlRP?=
 =?utf-8?B?b0tnUzZ4UmRYMEtuS1dQWFVqY3V3ZlR3VlY4OWRaTW11UXIrRWExMTV2dXVF?=
 =?utf-8?B?VFBtR1c4Ym85NCtPdmVhYmRuZk10dTZNSWszOGxtM3BqcTRMZGNJRWxLUDZC?=
 =?utf-8?B?VmFGV2JUbnkyNHhpU1NNRnU4RmZtcGE3ckswNTRHa2tJazdDZFZhTzlwZDMw?=
 =?utf-8?B?OTJQNHJ0MDlmcHRIUmJwbHhueVljM05YN3dEWnZQQjE3R3ptSHlUcnRZeStq?=
 =?utf-8?Q?NGbmGYTyBAtABSSE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05189F3CDE512E49A0A9477F46EE40CB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XRoFMp+EpHnoCwiYua6ccxzl7GvsDCyuqQK8QSCybxwBndaIlxluNLqr4TUSdok3qLEHgpKS4Si60aNw037Q/BBmP3RahK0nSSgY0iD8pqOvq+/pS4YMBpVhGXODt/W5ojRwMIyB8gp0J6kew3EZ+yvbUrlp8Ddg8n68YZt2KQCuFT2MTIbSds7Lzr4IWXoxKG8pDWjkNy8gx0wgXjLvwYJZcoxbTwyyJVpLQoyzdeMYWrlyJnuG93fM+xZELXx6sKQ7k+ViWi2dE/XLNeU0dBMLuSOcoxobFU7ZP7uP1qli/eDGk3Mg56rvBvM1SxJQanFMabbBRAAcJ2DX/9//oQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a638eca9-0f26-47d4-aceb-08df2652a04d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 22:14:02.8429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nIwIJYmzlPIUGBYVOI6aSOZWQLIg59kZz6blvD8MLU8nm76HlEuUlxnctZIfG60LS+GSwrahvxkyWsBVrF9l715hkaHCo35pgoFT4JWs1Fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3E6742BA8
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTEwLTA5IGF0IDExOjM2ICswMDAwLCBSaWNoYXJkIFBhdGVsIHdyb3RlOg0K
PiBPbiBUaHUsIE9jdCAwOCwgMjAyNiBhdCAxMToxMTo0MVBNICswMDAwLCBFZGdlY29tYmUsIFJp
Y2sgUCB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjYtMTAtMDggYXQgMjI6NDcgKzAwMDAsIFJpY2hh
cmQgUGF0ZWwgd3JvdGU6DQo+ID4gPiA+IEJ1dCB0b2RheSBzZXR0aW5nIEVJUCB0byBhbiBhcmJp
dHJhcnkgcG9pbnQgaXMgZmFpcmx5IGVhc3kuIEJ1dCBldmVuIGluIGENCj4gPiA+ID4gZnV0dXJl
DQo+ID4gPiA+IGNhc2Ugb2YgSUJUIGVuYWJsZWQsIHNoYWRvdyBzdGFjayB3b3VsZCBzdGlsbCBu
ZWVkIGVuaGFuY2VtZW50cyBmb3IgdGhlDQo+ID4gPiA+IG5vcm1hbA0KPiA+ID4gPiA2NCBiaXQg
cnVudGltZSB0byBwcmV2ZW50IHRoaXMuIA0KPiA+ID4gDQo+ID4gPiBXaGF0IGRvIHlvdSB0aGlu
ayBvZiBjcmVhdGluZyBhIHNoYWRvdyBzdGFjayBmcmFtZSBvbiBzaWduYWwgZGVsaXZlcnkNCj4g
PiA+IGFuZCBwb3BwaW5nIHRoYXQgb24gc2lncmV0dXJuPyBJIHN1cHBvc2UgdGhhdCB3b3VsZCBu
ZWVkIHNpZ2xvbmdqbXANCj4gPiA+IG1vZGlmaWNhdGlvbnMgYW5kIHByb2JhYmx5IGJyZWFrIENS
SVUuIDooDQo+ID4gDQo+ID4gWWVzIEkgZGlkbid0IGtub3cgdGhleSBkaWQgbm90IHBhcnNlIHRo
ZSBzaGFkb3cgc3RhY2sgc2lnbmFsIGZyYW1lDQo+ID4gYXBwcm9wcmlhdGVseS4gVGhhdCBpcyB1
bmZvcnR1bmF0ZS4gQnV0IHdlIGNhbiBzdGlsbCBldm9sdmUgdGhlIHNoYWRvdyBzdGFjayBBQkkN
Cj4gPiBieSBhZGRpbmcgbmV3IG1vZGVzIHRvIHRoZSBlbmFibGUgcHJjdGwgaWYgd2Ugd2FudC4N
Cj4gDQo+IEluIHRoZSBjYXNlIG9mIENSSVUsIHRoZXkgYXJlIG5vdCBvbmx5IHBhcnNpbmcNCj4g
DQoNCkFoIHNvIHRoZSBwYXJzaW5nIGlzIHJpZ2h0LCBidXQgdGhleSBkb24ndCBhZGQgdGhlIGV4
dHJhIGZyYW1lcz8NCg0KPiAsIGJ1dCBjcmFmdGluZyB0aGVpciBvd24NCj4gZnJhbWVzIG9uIHRo
ZSBzaGFkb3cgc3RhY2suIEkgc3VwcG9zZSB3ZSBjYW4ga2VlcCB0aGUga2VybmVsJ3MgcGFyc2Vy
DQo+IGxlbmllbnQgc28gaXQgd29ya3Mgd2l0aCBvbGRlciBDUklVIGZyYW1lcyBldmVuIGFmdGVy
IElCVCBlbmFibGVtZW50Lg0KDQpZZWEgd2Ugd291bGQgbmVlZCBhIGJhY2t3YXJkcyBjb21wYXRp
YmxlIGZyYW1lLiBUaGUgcmVhbCBzaWdmcmFtZXMgaGF2ZSB0aGUgc2FtZQ0KcHJvYmxlbXMgdG8g
c29sdmUuDQo=

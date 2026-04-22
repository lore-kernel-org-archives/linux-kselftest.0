Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339C93BED76;
	Wed, 22 Apr 2026 18:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881260; cv=fail; b=Ig4DveiF6C4E/JvHJphqcVLhKU44NpftGE0AEiKIfoM60wA5AENPvhrxUkSPQw5r9Dz0JTjxDoEJZADP3rj9C9V62WnMyoo5VH7rllu+QpgXl+Q3SLNlOJ6SPYUzzsvG6GgfOMWouzZapUqdqHZQnRvAHkQJCaNUdf2q1VLVw6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881260; c=relaxed/simple;
	bh=Tly38/xJrVqBWPiguC5kBa8iu2gi8OXWFz87vgSKYaY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SsK9jpgnJha9Gw6YW1Q8vJi7u7JaRQTKoeRJCDJt+8NquNiMbZb4hN8omL8YdyzlvMgyJd1TuZJRxpQba5MWGReBGiwDMw2HFawpfm2VkQNOlJkV7p7u0SRNNGOfixZfCJrNz/5eQoeVPOP1kDs6kTosZxEIZgQYH+wpsNdHAkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIVD/eXI; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIVD/eXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776881260; x=1808417260;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Tly38/xJrVqBWPiguC5kBa8iu2gi8OXWFz87vgSKYaY=;
  b=dIVD/eXITkUiWvwpnlE8pV8jhWcp84iLLpQttylHyNuOmcF++9rHNaY4
   +HhRvd20CzHloyzZ9AeKqtI9CYD9RwGcUIjEJJhKkQNxqYa8LRAbIY5Ma
   BTUih2Tw28h8QOXWRhrbri5H+5cAtJxypYCUUJqWpDyIO1VG95dwkO+56
   7OmlmH728pwdWkARmvgGi9TNcnY89ZSak+f+DkPopEG/bXPPmTypttgHB
   XNYjP9vHgScqMFmk9CEDEx+GaTeqPFPhxRt4zq1uNIU7cOkjU+6ULIG/f
   rAJMGN33osw1IiPHSg1JIdnbfMhlXARC/MgZn1DniBhpo2RrpaW8CqNfq
   Q==;
X-CSE-ConnectionGUID: VpEbNMgYTG+E9msHwD7HEQ==
X-CSE-MsgGUID: tqHDNfCeRLGGfhV902/Sbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89308521"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="89308521"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 11:07:38 -0700
X-CSE-ConnectionGUID: 3xMbbWvpTpaxhTJVF82kXg==
X-CSE-MsgGUID: MlbV1amBS+qAxdZSS2XbYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="234211748"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 11:07:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 11:07:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 11:07:35 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 11:07:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tx2ud3aLZgAMOAfuczN4sVeIGM+JLXFRz0xCjmYzkIpaSGQ0Uqr2EmEuU0zzDzjdHdSl8YObPJ25LlWFClLS7KTTwo8H8DEb9lFnTE7yLSLSkQEoTYFB2XuacLtKr2DNPzpVz7eFVPRfaFmRL3XSWtrYvWQeye32iPHR6Fksvhs0XIgyTZxyf41vY0hUUgP7EPEQ+zgvcdcLdLqIgb4ygk9sNSNCJ7NdahTQyr00eBHvbb9xaPbXYE5So7XJQmcuH7oHLB/iYlu20QCAVtJeT/6Y1zKYHEgUacoACLjoqxjDAOVmEW8RxD4gkmKNMgjYCaR+sp9XKD+rDne6Avv0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tly38/xJrVqBWPiguC5kBa8iu2gi8OXWFz87vgSKYaY=;
 b=Por7/Zsb/cX6Mqb+6umOEFiN2JLTMSbZVkJvDeuLwVWhy/BnQ+ggoxUaF2Lqmm0Iw98DfFbHEvk1xmU/lTaHWFLNr2EZJ438RDkExrfGuyBKgCvJLWDoqqtLsvjPkgu/IveFmFPAqHqL+FzVComlWrli5fpCYklhdJP4JoCm1ko5MGXXLYxK2t0tXz4PkDNDK7pH4VRJqi2I2nBaCF0MKPKiiHMdNiGK5zcBaES8wp4kBf9T/xi0AeYcKrl+qjZgf+R784iyJRvU28/XPcgug6LDzfqv3QP5CM0IUxmBwVJKtZD5R0yZ4/qhFmv9dVAIHiCmoWWuThvmRJnFeIWT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 18:07:29 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9846.017; Wed, 22 Apr 2026
 18:07:29 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "justinstitt@google.com"
	<justinstitt@google.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"morbo@google.com" <morbo@google.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"xin@zytor.com" <xin@zytor.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "Wieczor-Retman, Maciej"
	<maciej.wieczor-retman@intel.com>, "nathan@kernel.org" <nathan@kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>, "seanjc@google.com" <seanjc@google.com>,
	"hou, wenlong" <houwenlong.hwl@antgroup.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "m.wieczorretman@pm.me" <m.wieczorretman@pm.me>,
	"peterz@infradead.org" <peterz@infradead.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "bp@alien8.de"
	<bp@alien8.de>, "ljs@kernel.org" <ljs@kernel.org>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "jgross@suse.com" <jgross@suse.com>, "Mehta, Sohil"
	<sohil.mehta@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v6 1/3] x86/process: Shorten the LAM tag width
Thread-Topic: [PATCH v6 1/3] x86/process: Shorten the LAM tag width
Thread-Index: AQHc0n4pnk/2QsZth0eNvZ4fq7IcYbXrYMEA
Date: Wed, 22 Apr 2026 18:07:29 +0000
Message-ID: <8bc4ff4b7491c6fea6e17583a6fa249961c08275.camel@intel.com>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
	 <79720f2640839b15f22e3618136b084cb376456b.1775813245.git.m.wieczorretman@pm.me>
In-Reply-To: <79720f2640839b15f22e3618136b084cb376456b.1775813245.git.m.wieczorretman@pm.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DM4PR11MB6117:EE_
x-ms-office365-filtering-correlation-id: ba6e5b0e-368d-4caa-08ff-08dea09a0499
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|921020|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: bnEGWUi29Jp+nySnFJa0/kzJzWWHj/tlC4utaGmObmdkbSbX/50Ixz1lmXJg63nVdijh2cRByRYu4PBNHE87TcNsF0Dnuj77RGqkHLuGUdITQqQQNp97d+sx9gqTsGEwToLPR7VduiI2K/qQ4vtwJ2ngi3Y/C8dgn0oHHtBekz3AaWiHekoYQKnsgnJN0EHpOEPkvol4CiWbM5PZo/7r6EWoS6JEv0Uml//Tx0xrnz/6yRoluWo5JJZ1kFYYW5oYqHjfuVvML5EKymjLRNmB+0DjyyAkzTF/+TbeIbaGlqeR4aYyC76vtdM0xT2sZD3cJjSThWZrcn9fdnmXMuPMNz2O1NivqMuqMMgELfHPXv4nKu/BOQHq3gJqKqE1uCDMQnkurfFPn2niUWelMoExDQpn4Pk2o6TB9dVBWElr9TGBkA98eKBXLoNKUVoyzDDcMJBBpZCYjWSkWOCvr5WXrz4GbbtI9cp1IprWM+cQWA5ga/JLmi5pjoZ/IGLgUYg0GoCxrnCdiFv3+UW+7N0NGxTGwQxido2cTrpe9X/oGEDKqb4pWXBpOS9KrysmrNmH+vmW/VfVusidVkxDThO1+okrJOZoEjWU+0t0qDG467omw6/FTMiISYgLm+oivLOTFIXSnzhdtbhEBEZp2SkOytLnlRBjeCvVjsmgq5IS4vlRqspCgo4kxHkVZx38v+xaRjD62/M9b8tMT87m+eHpEoSj3IIoWfVvNV1U0U7vTi1bZM+8Li2d11A67n/RTM6Di2nol+rPem7VIxd2odeHp+mMABn1Q3m/bMKC6Gc5q580HfUNH2lWgwuaDGvYtLhj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0crQ0hvVjAvYWN5SThjTG9MWUhGbUQ3K0NhdERLdjY4ODJsSzNjSWxtcGFz?=
 =?utf-8?B?cXYxMzJ1NGlsSkF0MDF1WWo2Mzlkbmw3VDNYTkNuMjdtZUROTUVoTlp4V29G?=
 =?utf-8?B?WEJOR2xPVVp4dVdQek9DMVpxWVZNaFBBeHRySENnNWdrWXFTTE5ZQi9SYWs5?=
 =?utf-8?B?ZnZ2bytZelV1dWNxUWRZcG5BK2VacmZGUys3cktGd0srOE1tZVQwUWlQcnhN?=
 =?utf-8?B?M2Vub3orN013L2Vmck5KOTBZMzR4d2JCVjRhekZTMFVFc296ZDZaQ0t5RDBF?=
 =?utf-8?B?ekRBbnhrU2tVR05qQXRNN0Z1a2U4ekVwcWFVeVE0UlMyS1hJa3BmcGlIM0tz?=
 =?utf-8?B?Y1hKSlZXcGlETFdkSUZiY2hxbks4NnFGTjQwem04R2Z0RkJueXJrRnBMYlA2?=
 =?utf-8?B?MXdWY2lFYTBETm9Tak54T2FqVm84cFJXM2Q5MndIL0FxaG1yUjdUcXYvSTQ2?=
 =?utf-8?B?a2VjRHJuWU1FOHpKazVvWEwrSlVsblpUSVhueGdEZGVZOHd0SVNxWm9IbHNw?=
 =?utf-8?B?djRxRnFnMWovSlpyRjBxYmZqMUtyNFdBOExGVDYrK0VpQWVQczBPTDJBUWF3?=
 =?utf-8?B?YW1wOEo5SHcralFPOEIyZEFFQUJFRlBTNjN5Mi9IcElBMEIydVhZSWZzalYv?=
 =?utf-8?B?cnlIaE4wWVRSK0FjTmpvRVpBOUpnWlpwV2RMVFU4RUZ4NE9aSFB5M2ViSlY3?=
 =?utf-8?B?QUhLMjFWUkxqcXkrbS9oakVWcElFazFZSjRHQmF3MjdiNlJNRTdaUVMxRUNk?=
 =?utf-8?B?T0N1WTYwTnA0ZnA4bVNVNjRoUFRhWDZITklXcVN4MEM2L3kwSmphenVvQUxn?=
 =?utf-8?B?bnFuZ1VIOUUzRUQrRzJ5RVViaFBRenhIUGdEZHhHM0lkcHhQMzFKRGZoYUtB?=
 =?utf-8?B?VzhpTk8wOFRYUDRoTEo4OTBKL241NjVwV3dRNDJxb0U5dXREMHhob244YWkx?=
 =?utf-8?B?VytyZzBqbXBEamkxWll3RTV5dytETk13UG1qazY1MjBzT0dUaHRBcGUrWjBz?=
 =?utf-8?B?RHN1VnMvV29jSUZYNlhRLyt5NGpIbEtpMnQ5OXVpZER6ajgzdk5SUCtNNmlo?=
 =?utf-8?B?SXN4Ym9VNVpkUHVISXl1UHZHYkd5L3pjQ1A0ZUp2ejhxdUt6YmJQcXpUekhP?=
 =?utf-8?B?bzRMaVg0dm9BbmVTcXlCdFNuSCtWUDBDaU4rT2g5aWJjM29WK0xkaDVGNDlC?=
 =?utf-8?B?YWJNSnBaZm5ZQ2x5N3o2WU1OS09FOVV2UkdscGw2SkhRMGk0Qm5hTFJIcVpI?=
 =?utf-8?B?Wm9mamVjTmRxZUZCTUVDL3AvQ0xpTkN4bWtTNFhaMENrMUEvM1hzekNlTk8z?=
 =?utf-8?B?ai9FUHF5K21RZWpPemtyL3hUM0RqWGFHTG9jRGVlU0Y1S3BxNzNOTlh6SDJy?=
 =?utf-8?B?L0tMKzJBMHlkTEVaNXB6eHJ5Zkk0ZGhGaVZva3E5ckhTaXJ4aENYZ3hUc3hN?=
 =?utf-8?B?endIbTZNbXl2VVRpVFZ2OEtqQUFtZzBQZ1I4d2ZXSmE3Wk5SVWVIdzZGZTZK?=
 =?utf-8?B?Nk5Ta0ZPZXhDN3dTNTR1T2NCZXo1REc0UEV5YS8yQ2dLT2pNelVhUzlGQXM5?=
 =?utf-8?B?N1JtUURwME1JQm16Rkw5dVV3cVBvM0loSzBod1hjQjZQdTZhQ0V0RU1EdlJO?=
 =?utf-8?B?aTRQYkFkaTNnZ0lhcXZDSXJlU3l1THhDRnlOdkVsYVRVNGEvY1ZkZFFqbUxn?=
 =?utf-8?B?cmtZMlUrRDFyUWszd210VWpUcWtpNWk1TFYxazRhWDVYWks0K2hiYitTWXFX?=
 =?utf-8?B?eU5xL2ZST1JBNXVWZzJpRDRZYnFNZVpScFZHQ3lPQ3dodzFpYk9OcXBodnNE?=
 =?utf-8?B?SzVscHhWcXZTZnlpT2I1QkRER3hXZlJSMnNHaXBBZUpPbWluMFNqMS90TmtM?=
 =?utf-8?B?QjFyUXlzaTVVenRYQ3FBR3pwYllhRE00ZkNQTVVPaEtoQkVRd1phNVgvaFg2?=
 =?utf-8?B?RTB6cjhWYVl0ZW1vODliTGFpS2MyZ3JteUpZVzJVdGJmWVZXaHFCWWYxWVRC?=
 =?utf-8?B?TVdkQ05GeldyWGlnVWFVbmVJOElGcnlmL21mMWMrKzNJV01QMG5xMWFteVpF?=
 =?utf-8?B?ZDVwRERpRHJLVmJ3ZnFMV3laSzZjLzliSXBiVlJEMUZOcml1NTBPOHFOLzAy?=
 =?utf-8?B?UTFOazVuWi9FdzFPRXVjYU5tVStrdWhVUU1naldxUW1pN2lDa1ZWNXkyTXFE?=
 =?utf-8?B?UWNTcnYvdmFVTXNacy9RbisramwzWlBOd2hQSWpFS1RreGdnNXZXOHlBODRX?=
 =?utf-8?B?UmZEYloyOGJCdXJMNEJOL2xiSXdueHBYcG96WnJqNkY3RGZrUU5vSXNaaFZE?=
 =?utf-8?B?aGczUzh0WlpLaHFVZ1NqT3VRWTdBKytmZDEwOHluaDZpNHlRYXBBZGNXbkg1?=
 =?utf-8?Q?Q4f1pMo+1arFDk4s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5073908B700DB478FDD6EF75E7A5F99@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dcLtmTRlxup9M8vTNYEe6LM0Tz3Br/BoqxBSbXtC0Xo9h2HTVJnzibvIN1v3i3uevcuYeRa0LVvFZYAXYHxr0khAX5BSKriF/rYHFM3Vw/pX7Dv3czwxtf8pSEPVCZriFpPl/VwWRD3Ys3QUi4UBCnzS/zuFYp2By3oWhjdPxz36X4ZXxfqposr+/i872XddB3MMJClP4Sa8f4JmM0pzb3nXdzticqooogERLLQozhhsdhdrpcpxun78YyjC5OYp4VFu3WeJFEpHRLIiMhbfKDBLrafod+vsCMEg83y49wLHIQJ62pDELHnshhAHpyb8RvaOUCcE7MRoGUYCIDUpuw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6e5b0e-368d-4caa-08ff-08dea09a0499
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 18:07:29.5292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FcRp+d1Ekuu8JRMjSyQXpuYmgjHayMRRcOFpv9j0QNqYIDVJwohE0KdIJH7ub/XUKLTL6VSmYJ2jDodHeXibS7yz5O0+2aIjtjLjIzzoI+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTA0LTEwIGF0IDA5OjU1ICswMDAwLCBNYWNpZWogV2llY3pvci1SZXRtYW4g
d3JvdGU6DQo+IMKgDQo+IMKgI2lmZGVmIENPTkZJR19BRERSRVNTX01BU0tJTkcNCj4gwqANCj4g
LSNkZWZpbmUgTEFNX1U1N19CSVRTIDYNCj4gKyNkZWZpbmUgTEFNX1RBR19CSVRTCTQNCj4gKyNk
ZWZpbmUgTEFNX0xTX0JJVAk1Nw0KPiArI2RlZmluZSBMQU1fTVNfQklUCShMQU1fTFNfQklUICsg
TEFNX1RBR19CSVRTIC0gMSkgLyogNjAgKi8NCj4gKyNkZWZpbmUgTEFNX1VOVEFHX01BU0sJfkdF
Tk1BU0soTEFNX01TX0JJVCwgTEFNX0xTX0JJVCkNCj4gwqANCj4gwqBzdGF0aWMgdm9pZCBlbmFi
bGVfbGFtX2Z1bmModm9pZCAqX19tbSkNCj4gwqB7DQo+IEBAIC04MTQsNyArODE3LDcgQEAgc3Rh
dGljIHZvaWQgZW5hYmxlX2xhbV9mdW5jKHZvaWQgKl9fbW0pDQo+IMKgc3RhdGljIHZvaWQgbW1f
ZW5hYmxlX2xhbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4gwqB7DQo+IMKgCW1tLT5jb250ZXh0
LmxhbV9jcjNfbWFzayA9IFg4Nl9DUjNfTEFNX1U1NzsNCj4gLQltbS0+Y29udGV4dC51bnRhZ19t
YXNrID3CoCB+R0VOTUFTSyg2MiwgNTcpOw0KPiArCW1tLT5jb250ZXh0LnVudGFnX21hc2sgPSBM
QU1fVU5UQUdfTUFTSzsNCj4gwqANCg0KSXQncyBiZWVuIGEgYml0IHNpbmNlIEkgbG9va2VkIGF0
IExBTS4gVGhlIHVudGFnX21hc2sgaXMgdXNlZCB0byBzdHJpcCB0aGUNCmFkZHJlc3NlcyBwYXNz
ZWQgYnkgdXNlcnNwYWNlLCByaWdodD8gU28gdGhpcyBsaWVzIHRvIHVzZXJzcGFjZSBhYm91dCB0
aGUNCnRhZ2dpbmcgYmVoYXZpb3Igb2YgdGhlIENQVT8gVXNlcnNwYWNlIHN0aWxsIGdldHMgdGhl
IExBTV9VNTcgYmVoYXZpb3IsIGJ1dCBpcw0KdG9sZCB0aGUgdW50YWcgbWFzayBpcyB0aGUgNCBj
aGNrdGFnIGJpdHM/DQoNCklmIHNvLCB0aGVuIHRoZXJlIHdpbGwgYmUgYSBkaWZmZXJlbmNlIGJl
dHdlZW4gdXNlcnNwYWNlIGFjY2Vzc2VzIHRvIGEgcG9pbnRlcg0KYW5kIHRoZSBrZXJuZWwncyBo
YW5kbGluZyBvZiBhIHVzZXIgcG9pbnRlciAobW1hcCgpLCBndXAsIGV0YykuIEkgZG9uJ3Qga25v
dw0KdGhhdCBpdCBpcyB1bnNhZmUsIGJ1dCBoYXZlIHlvdSB0aG91Z2h0IHRocm91Z2ggdGhlIGlt
cGxpY2F0aW9ucz8gQmVzaWRlcyB0aGF0DQp0aG91Z2ggaXQncyBhIHdlaXJkIEFCSS4NCg0KV2hh
dCBpcyB0aGUgY2hrdGFnIGJlaGF2aW9yIGZvciBiaXRzIDYxIGFuZCA2Mj8gQXJlIHRoZXkgaWdu
b3JlZCBvciB0cmlnZ2VyIGENCiNHUD8NCg0KPiDCoAkvKg0KPiDCoAkgKiBFdmVuIHRob3VnaCB0
aGUgcHJvY2VzcyBtdXN0IHN0aWxsIGJlIHNpbmdsZS10aHJlYWRlZCBhdCB0aGlzDQo+IEBAIC04
NTAsNyArODUzLDcgQEAgc3RhdGljIGludCBwcmN0bF9lbmFibGVfdGFnZ2VkX2FkZHIoc3RydWN0
IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgbnJfYml0cykNCj4gwqAJCXJldHVybiAtRUJV
U1k7DQo+IMKgCX0NCj4gwqANCj4gLQlpZiAoIW5yX2JpdHMgfHwgbnJfYml0cyA+IExBTV9VNTdf
QklUUykgew0KPiArCWlmICghbnJfYml0cyB8fCBucl9iaXRzID4gTEFNX1RBR19CSVRTKSB7DQo+
IMKgCQltbWFwX3dyaXRlX3VubG9jayhtbSk7DQoNCg==

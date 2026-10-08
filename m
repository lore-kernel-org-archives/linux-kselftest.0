Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F33C305695;
	Thu,  8 Oct 2026 22:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498850; cv=fail; b=UVV8EIgaeMHGYcyapCa2ZBGsh7kq9fuhGCYUKLJA3rJq81I4jiF28cGuERiXLGVoay8xHuZbFcAeoB5Eam9wLnX3mK1zNO8pn3jcpY8losB72iP3lTR0Dqwb7pHe0URXmIXSVChwrFE3NQuVxcBsBYdZ8TT+yR8WcCrF3N/QYjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498850; c=relaxed/simple;
	bh=Zpstd54HUM6r/l68nmKWf4jE7C7Fr8ALAu/nG6EWHiI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e9OfxvcDe+9SVKHci8ajxfTLMKiydK+pyYDNfcosZa1JphntPQhL+ZU3TFc7Ezyk0uIvKL1TwhagWBsWmxEJ9sY7N455+VhX1rV2M9RyMGIKtCxaAoQ4SF/RU8a9rT9Xl2FOhzCtsFtYiU2rpHZ+wWUAx8E7IuAoFqp3b82VgIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwPP+Lnx; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwPP+Lnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791498849; x=1823034849;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Zpstd54HUM6r/l68nmKWf4jE7C7Fr8ALAu/nG6EWHiI=;
  b=GwPP+Lnxqq703OoeYQZXno8UyU01DoEd+z00QXU25+olpdLYfwxRcoDY
   HrLgp8CUEuOGqzKwZxPz60l04vo216sew8WP1GHuCCJeSuiwlRDrI0HhC
   Dli0F8FD9d6W5JMfJJs644U2PuGGfjO6228FeSBwNoWcMPd7i8tT3Qs9K
   tCB5Whpzxrt0SxpAa46VLUB/9m376lw0+3x5yTWrV5tje/0ZFTBMGhrpH
   odtD1isjXdADOhysvwM48X/mZnm4Jd0DJfgfW4CDXYOX6k8Ycz5UGZ/lG
   Za2Fbfe53lZwaoC0oefJX4/agqBdVgrKkzOhxTOCM5RGJPmYYTeEDlg4E
   A==;
X-CSE-ConnectionGUID: aqXNdJFqQ8SIgf/VznRLkQ==
X-CSE-MsgGUID: QYbDtUwgQ5Gc47R+ZCTNLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="303479"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="303479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 15:34:08 -0700
X-CSE-ConnectionGUID: KYWPD4i9Si+kTtw2uPWeWg==
X-CSE-MsgGUID: Set4bIj1TSWJz9hM518fUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="491445"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 15:34:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:34:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 15:34:07 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVXvJTkT49jfkaBK1mE1x2yynE0fHfLQ/AU+Npvz/LjNS6VPuwi7eorQoIudt3fSyFSVmbfwaCjeWdTqthIRgck/rbrXRLqc+oo9Uew5vsmh24GlqjVJBhjXq15wHIcMaDRQzZbuTYWAOd/2i/Q5XP7opfCGGgw/LL5F8ZO9COuXMBAXjYNbWRGyfq6NKezWluYttrPZrLszyymunN38hDTczEIsbGO6c2OKK0fiBmefjd3854Sch92tBudWP/W1BGDdAIKINHqzz4/SsNP+TzKMYIe8bAcYZzRl5MDj0Azex/u+RGX2l7PzfXiPr7WTQkWZTaXIAb6oaMPJjtlUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zpstd54HUM6r/l68nmKWf4jE7C7Fr8ALAu/nG6EWHiI=;
 b=GbxLLIMOYR3pNDSWjzcmBzAlgOfgNRQT6B3SdSYFuOxzKQ89BnNC/aOgWXcJCHmuLSUaomEm0E3G5woj9ezrixWiYAq70ja+RyXJYJt5HJS1MBx5aCiDh9eyh1+UnwEB8Nx04vIblD5XkV7LKKQxT8ZZDgz5dAi97rRn/C5biJhbTBvPquQVna8uJ/tnpdm2K2AvX9WcDLavsPnXJC3614E2K0ticSe4o0Vg+5C8eXlworN8oz0e1I2drX/bAWdisGcSpxz5B9Q5/wOTk859AJyzUUaEdSyElcXD4REtVnZqed/hdHHMeY9O9zHseEmoKiaI7EJo0jhwfeBjadkPSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by DM6PR11MB4644.namprd11.prod.outlook.com (2603:10b6:5:28f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 22:34:02 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 22:34:02 +0000
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
Thread-Index: AQHdV2H/JX9B3LcQ60+tcfWPj/4EOLb0IS6AgAAOAwCAAAxGgA==
Date: Thu, 8 Oct 2026 22:34:02 +0000
Message-ID: <6deab6fec99c65408a19b9036d67ce7f1fab54b5.camel@intel.com>
References: <20261008201610.1003569-1-ripatel@wii.dev>
	 <20261008201610.1003569-2-ripatel@wii.dev>
	 <e1a26ac75c39673d043b2860f848827fecbcb843.camel@intel.com>
	 <asgQDlpnDwu04oZc@wii.dev>
In-Reply-To: <asgQDlpnDwu04oZc@wii.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|DM6PR11MB4644:EE_
x-ms-office365-filtering-correlation-id: aac08f59-f19f-4490-95f2-08df258c40ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|38070700021|5023799004|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: QmRZlHUxrG007itCL6Twdk4KKwp2o9i42LYf+ZNQE2cpSD/mzqu7lNd/d4spojKCgwzY4hF+Ge/Nc3LxZo9oX3MMLWeXsagQ9H9uvH/Fqq8c1kbfDpZ4CjDbMwEyZrA4Jd0rnPiOvV3t5k0TwZ/J+WUZePLZdeVoghJC24cpHxVSEpDUN1HJDHRZXtqxwnV07E2QcsfEENjbOIbSItxlmBPMhBIKNWyFt/kNYE4XGW179sLXe4TpzGPoqhn9IUU0eSc2yRa2Ei+hx2PsZkn5xFZhcGUDajosztFFVHUAG8XLE72vkS4/X80f8nXALdQ46x1U+Fg3FT7nCa5WHkosFKEs6BmT8t4G5yHlKVHDROq11kwDbTKu2ohKqMFi+y8xzEmo9xb7/auvD1ZRW83OPMiyVydiTIFTqEolvP2F79pSNZ1DUNtB3zyliHFuTWC2J/fNrgtzKtyfz0YPJr5kLSMdUwHIoBHgSSl1Nqb3m167cflEMylloiQOJEAb5EkXiEXWLLjKlAycBn/6nMHdUz+MQwYwYOTIBoU2++byC/lY7UkASzBPGVHH0j2StIErQizpWoBnYogEX9XbbJtNKGoZY0fh3cGlW+Bc+IWoj0u1gsYutNoke1iHTicqL10//0ATAmHwmuDHsf82nXb22s4+MafhTAJUZ+VfV9Wfq5Nm6PmIi7dqA+P0h7XzAb+X48lSBkpVp48OA9X3+uZ74AvTXeFq83W/4d/zZBjJk/s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(38070700021)(5023799004)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N002MTZCRzBySU9scWMvV1llSzhLcmk0NlFONUdML0ZGOWdISi9BTk5UR1lJ?=
 =?utf-8?B?dzFDVFFlSDZpYUlXSW5rZjhDZmtETTdjU2YxV0U4R3JTSDJxbWVORFAyYnlz?=
 =?utf-8?B?MHl4U0Z1T0cwM2s3MnkzTExFMkJ0eHVscVIxSFVsbm0ycmxYbjVnenZnVFlp?=
 =?utf-8?B?bTRwN0ZVN0U5SCsxYjJHZ3lHNW5LcW1yMGJwWk5oY3lkRU85cjRwbUVoaysx?=
 =?utf-8?B?WUx6ZWg0S1QzT3hid3RKSWxLbzd3SUxzYU9GK0F0Qk1hOG1YQUxGemg0QkV1?=
 =?utf-8?B?bEYvRFNwK1BkNHlPdHFSRE5oSFhUbW9EUmpGRnl0aHFCOFZlTmxuK3JJUVpB?=
 =?utf-8?B?UEdLUzBiNTlkT3hrS0ZocWpKbUFUZTRaNzlmTEhQY3NGTC85QzB2dlhtZVBv?=
 =?utf-8?B?SU1MOUVFU0dSNU5LNHl3aFpoQnNwcVlrNm5nMUkweU5zcXIrU2JqWWVKaUFI?=
 =?utf-8?B?TCt5QjFLdHY4SkFiZ2Q5bFJnRncrTlFPZkdQck1DUC9EcmxGWTEyUkpkZmdU?=
 =?utf-8?B?YnB1c0NDOXVqYnBYaTcvR0dzK1lkaFFSTlVPejBOMm9kWVNuYlJGUUplNmdK?=
 =?utf-8?B?dWJrZ1h1cEtidE9OS3VrcWVnSjlYeU5tQ21FVy9IaGJkSUs1TFAxbzJQN1hO?=
 =?utf-8?B?cXpnb0lDK01yekQrNHBqU3IwNE5PNmlQRzdWajQ0ejR6ZFEreWhNcHdjY1FW?=
 =?utf-8?B?VVJMckhHZU9mekJ2SGhMVG9jcjZHckFDNThMbzFIL0x1NDVNNllBZmVXZm1o?=
 =?utf-8?B?ajhSOVpJM2VXRkNTRWhDVHB3b21VMFNHV2lhNmlEaWlWb1NyZmpHTlhUNjF4?=
 =?utf-8?B?RFkvYnJraXNBalFOaXR3NzBWeFhnU3d2TUhJWXhrVlFad1B1bk1jQ25OR2Yr?=
 =?utf-8?B?bE5EOWZ1THdncDh4TTl2c1BBdjQ3SzVOUnFiVm5Db25yeGNpQ2RPT3M1c0po?=
 =?utf-8?B?OSsvVTIwM3RTTDNQOHJ6c1lEYmdMWjlPR1JPa0VVSnJjTVVEdUJCSHBPR1lh?=
 =?utf-8?B?VGNPdTNVb3UyUHJMd1hBbWNkSlFaRzdkZkg4R1I4bWlTYU5WYTVSN0IyUjBl?=
 =?utf-8?B?cmpmeThNL3FjOS80TzR0VFRJbFZ4ZnVGRDVrakJ3RGxUZnhWUXZmRHNCTEpW?=
 =?utf-8?B?UzU4d3FaOCtQeGdIL3J6emdoSXZSS1RXVTZ6R2gyNU0zVSs4SXZtdmV3RU90?=
 =?utf-8?B?TWpNd0FzU1lCZU9jeGNkWE1vbHVsSEpROFZTUTBleFBOZ1Z1NmJKRzlnbDFI?=
 =?utf-8?B?bGtXL3BKSjh3b1EyeWhycG0rTGRQUDNzNUk3ZE9GeFdJYVNDcFBoK0FieUVE?=
 =?utf-8?B?cENNSFV4SzRwZXZxTGtYWWZhZEkyWjJKU0Mrb2srcHoyY3FZYVZncGRsV2NL?=
 =?utf-8?B?UThYMWJHdTloTmRoSXFDRDRWNHhGQVJNZ05Zc3lDVjRVMzBkaThoSlBWVHNr?=
 =?utf-8?B?czVMQ3lpM09TVkFPaWdMWkJJV1hGb3lBRmxpS1YrS0xMbThQNVdldFRsTlFw?=
 =?utf-8?B?STltWGlyV0NJNnUrOVN2VHBHNUU4cEM2ZmwzRWpzdkpxWVZzVHhDV0NmcE1h?=
 =?utf-8?B?RmdIaDBScWxBR3VaaTN1ZjFsOFlEUlhLMWNBdTI4NDgzZXFyZDFFR3I0R284?=
 =?utf-8?B?cExoaWRTNWtlK3BqeDJqdjdRSkVWRlc1bFQ2OHZqa1ZpNEFMcTFQaVgvNUFi?=
 =?utf-8?B?ZzZjY24ydFQxZURDazB0cjhzYkFjOGtIeFZUSE1DWUQvSlZkSjJ2RlY1NkZa?=
 =?utf-8?B?bEtWVS9PdzdLK0UvUzVPckRTdlBtUUVxSHV6bzBld0FuV0NZMDdWVkpQbXVO?=
 =?utf-8?B?RnowUFBjWnNreE42T2RadENOQzdTd3lJTTdFcWsrOHFpUkpPaEI3YzdHZmNQ?=
 =?utf-8?B?YkJBMHR6eHU5Y0x1amU2cGFlWVlyTWFQQ0RqOUdLOFo4d0VlM1ZUYzdqWjEr?=
 =?utf-8?B?UTZYZUh2T0VhdWlmYm1rWVRBREc5ZHZPL3FvUFprTFdLSVdXTDR4UlR5NmFz?=
 =?utf-8?B?bXpOQXNVUTFqTWprY0kyUjd5d2NsQ0hWQTBXSmFzS3dSU1Avclp3N3NETTZY?=
 =?utf-8?B?MnRjaTFkNzZTSXVQMDVQL2pKM2s0VGRZNDNoaE4xQ2gxMEgrL2JodmRiVU8w?=
 =?utf-8?B?NngrZTRqTVpDRTBDY3gzNU9xOWxXdGVGUTFzMlRTZUVwQ0M5b3hsMzJEVEpj?=
 =?utf-8?B?WityRDZrUzRUbnZGU0R5SW1QNVVNanplbUhWZEwxZG1YSzdXVnl2ZUhaK1ho?=
 =?utf-8?B?Y0dlNVYwdW85SGx0dkRvY0RKRDlTQXJlNDlacm5BZVdDdzhEOUJ4c1BaYVdy?=
 =?utf-8?B?Y0dpbGtMTkcwL3dBZlcxWkZkSytYTHczZGFmMXlVYWNSVTBVWG9JYTdheGN1?=
 =?utf-8?Q?PG+TsxFDBg2GdMcs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48856645EB66BE49B465E506F507FEC7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KYZvZs6v9pINVLMRogbeoGif3rQN8rM5KJ+LaMFGhFAUpu++w3/KSL5yTTD1crmVvGzE9SJk+igFUUgwblEZIe0lLOOTB5GGJRdpE43PSwY7h2oOfL6Y9yCsVvrLW6MxhClxHYOl48ftmWndvOdWEBagMz19mUmgRJLSHy4htATV8VAbkS4M8xoNbvS5IrBTS/Js8J5TinPeQya4qk5acuL1r02clVzoAzoAPZH5D/Xh/NCeOaMPYXFjFcJy0oUlJufsiJX52O+ZNJJ1K0zISAN+kwmmXQsTXbZaJUtkOyH8834F4IijyAcMRzjpK4wBQQ9M5br70/Uv6Pss0wBpUw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac08f59-f19f-4490-95f2-08df258c40ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:34:02.1222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGW6J9LThFHHgR270PLmszE42F4n67ZZe4MChILll74Ve8kmMnA2uhAEIANgtg6eeMjQvAljIE0HcD8TvtvxPdkU0hUr1IJkRqrscSULKts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4644
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDIxOjUwICswMDAwLCBSaWNoYXJkIFBhdGVsIHdyb3RlOg0K
PiA+IEhvdyBjYW4gaXQgZGVmZWF0IHByb3RlY3Rpb24/IElmIGRvZXNuJ3QgcHJvY2VzcyB0aGUg
c2hhZG93IHN0YWNrIHNpZ2ZyYW1lDQo+ID4gYXQNCj4gPiBhbGwsIGxlYXZpbmcgdGhlIFNTUCB3
aGVyZSBldmVyIGl0IHdhcyBvcmlnaW5hbGx5LiBXaGF0IGFtIEkgbWlzc2luZz8NCj4gDQo+IFRo
ZSBzZWxmdGVzdCBkZW1vbnN0cmF0ZXMgdGhhdCAnaW50ICQweDgwJyBydF9zaWdyZXR1cm4gZnJv
bSA2NC1iaXQgbW9kZQ0KPiBqdW1wcyB0byBhbiBhcmJpdHJhcnkgJWVpcCBpbiB0aGUgc2lnbmFs
IGZyYW1lICh6ZXJvLWV4dGVuZGVkIHRvICVyaXApLCBcDQo+IHdoZXJlYXMgdGhlICdzeXNjYWxs
JyB2YXJpYW50IHJhaXNlcyBTSUdTRUdWIGlmICVyaXAgaXMgY29ycnVwdC4NCj4gDQoNCkl0IHNo
b3VsZCBqdXN0IGJlIHJlc3RvcmluZyB0aGUgU1NQIGZyb20gdGhlIHNoYWRvdyBzdGFjayBzaWdu
YWwgZnJhbWUuIFBlcmhhcHMNCnlvdSBzYXcgdGhlIHN5c2NhbGwgdmFyaWFudCBmYWlsIGJlY2F1
c2UgaXQgd2FzIG5vdCBhdCB0aGUgcmVzdG9yZXIuIFNpbmNlIHlvdQ0KYXJlIG1hbnVhbGx5IGNh
bGxpbmcgc2lncmV0dXJuIGluc3RlYWQgb2YgcmV0dXJuaW5nIG5vcm1hbGx5LiBTbyB0aGVuIGl0
IHdhcyB3YXMNCm5vdCBhdCB0aGUgc2hhZG93IHN0YWNrIHNpZ25hbCBmcmFtZSBhbmQgdGhlIHNo
YWRvdyBzdGFjayBzaWduYWwgY2hlY2sgdGhvdWdodA0KaXQgd2FzIGEgZm9yZ2VkIFNTUC4gQW5k
IHRoZSAzMiBiaXQgb25lIHN1Y2NlZWQgYmVjYXVzZSB0aGVyZSB3YXMgbm90aGluZw0KY2hlY2tl
ZC4NCg0KQnV0IHRoYXQgZG9lc24ndCBoYXZlIHRvIGRvIHdpdGggY2hlY2tpbmcgRUlQIG1hdGNo
ZXMgd2hlcmUgdGhlIHNpZ25hbCB3YXMNCmdlbmVyYXRlZD8NCg0KPiANCj4gSSBkb24ndCB0aGlu
ayBpdCBtYXR0ZXJzIHRoYXQgU1NQIGlzIHN0aWxsIGF0IHRoZSBvbGQgcGxhY2UuIEl0IHdvdWxk
DQo+IG9ubHkgYnJlYWsgJ3JldCcgYWZ0ZXIgc2lncmV0dXJuLCBidXQgdGhlIHByb2JsZW0gaXMg
dGhhdCB0aGUgc2lncmV0dXJuDQo+IGl0c2VsZiBpcyBhIHdpbGQganVtcC4NCj4gDQo+ICJkZWZl
YXQgcHJvdGVjdGlvbiIgd2FzIGJhZGx5IHdvcmRlZCwgSSBqdXN0IG1lYW50IHRoYXQgdGhlICdz
eXNjYWxsJw0KPiBwYXRoIGhhcyBwcm90ZWN0aW9ucyB0aGF0IHRoZSAnaW50ICQweDgwJyBwYXRo
IGRvZXNuJ3QgaGF2ZSwgc28gSQ0KPiB0aG91Z2h0IGl0J2QgYmUgd29ydGggZml4aW5nLg0KPiAN
Cj4gSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZywgbWF5YmUgU0hTVEsgbmV2ZXIgaW50ZW5k
ZWQgdG8gZGVmZW5kDQo+IGFnYWluc3QgYSB3aWxkIHNpZ3JldHVybj8gRWl0aGVyIHdheSwgaXQn
cyBub3QgYSBzZWN1cml0eSB0aGluZy4NCg0KSG1tLCBJIGd1ZXNzIGl0cyBraW5kIG9mIG9uIHRo
ZSBsaW5lIGJldHdlZW4gZm9yd2FyZCBlZGdlIGFuZCBiYWNrd2FyZHMgZWRnZS4gSQ0Kc2VlIHlv
dXIgcG9pbnQuDQoNCkJ1dCB0b2RheSBzZXR0aW5nIEVJUCB0byBhbiBhcmJpdHJhcnkgcG9pbnQg
aXMgZmFpcmx5IGVhc3kuIEJ1dCBldmVuIGluIGEgZnV0dXJlDQpjYXNlIG9mIElCVCBlbmFibGVk
LCBzaGFkb3cgc3RhY2sgd291bGQgc3RpbGwgbmVlZCBlbmhhbmNlbWVudHMgZm9yIHRoZSBub3Jt
YWwNCjY0IGJpdCBydW50aW1lIHRvIHByZXZlbnQgdGhpcy4gDQoNCkluIHRoZSBwYXN0IHdlIGRp
c2N1c3NlZCBoYXNoaW5nIHNvbWUgYW1vdW50IG9mIHRoZSBzaWdmcmFtZSBhbmQgcHV0dGluZyBp
dCBvbg0KdGhlIHNoYWRvdyBzdGFjayB0byBnaXZlIHNvbWUgc2lnZnJhbWUgaW50ZWdyaXR5LiBC
dXQgdGhpcyBydW5zIHRoZSByaXNrIG9mDQpicmVha2luZyBhcHBzIHNvIHdvdWxkIG5lZWQgdG8g
YmUgYW4gb3B0LWluIGVuaGFuY2VtZW50Lg0K

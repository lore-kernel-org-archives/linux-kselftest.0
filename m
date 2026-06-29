Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5B93C9EF0;
	Mon, 29 Jun 2026 21:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782770243; cv=fail; b=CFuJjpZbkM5582C4/ejmuWxTGEcDNx71o9CHBwPCHAjQn/r0MCtv5LMYjKfB0l9fniGERqGkD2N3iEy5qBPrPA1n1AszS5mH9Gdogg6/Gk6rT5rhsmz8kioEos0UorXGZ+Enj+PkAzZ3PQY+oa/ebsDO2MKB3wR7BENfBH4tHe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782770243; c=relaxed/simple;
	bh=eH+bHxOJIBgYl6qpEeumKYTi1a+VNvpdPzaMvLDN6Po=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N3AFEmZcsHtxQyyq0tPD3nXQZJ2VKEOy/yCv7Y3kE7BrV6PjpZDgLSypmSntsLlc/jN4wKRN3xKZ8lp3G81f+Htd/882CroQWbGImDScf4d+pS6qzXZSogvVHr6zXsR3nYjc04sAycNhLGeZeK+5SUrM598DC8nu4LxSGIQl1GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jmj369GG; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jmj369GG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782770241; x=1814306241;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eH+bHxOJIBgYl6qpEeumKYTi1a+VNvpdPzaMvLDN6Po=;
  b=Jmj369GGI+pHrT+PxsRxhY5XtBipykUa+kOSJ/xevaqNGvRxFXOHucxp
   Pxem5IWrQ19Mlour1jwU9RSpcrgwIjH0GOEoCmJVaygR2aNmHuQhZNOBM
   6hHtfI5eYyKjtd62dPnka2hdBXXuhBa1DXK0bdKT1Q8aCEIJP+ZgtAFuv
   U8+R4ThEpgviuJ3VPj/izWq342NS04UtXkGG3aZQ2XwBHiVchoqpmvamQ
   fAERNGFU2QP008dtEPQdyFpDDqV3IB+HUFB8H06GUimAtQNQlH/7J1OEt
   xpoOwR1HD7ak45cbD4R9V6/UXB/7DHY071VBOefhQuiW8N6q9fH+NGNLu
   g==;
X-CSE-ConnectionGUID: HGLimReAQomATBcrjS4tEg==
X-CSE-MsgGUID: bUWie+3xTM2VsO25O0nQrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94859761"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94859761"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 14:57:21 -0700
X-CSE-ConnectionGUID: tUiZwq8vQVesarzLXd68aQ==
X-CSE-MsgGUID: b/twZTbJQ6eXK/0M0r521A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="249441523"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 14:57:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 14:57:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 14:57:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 14:57:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDwQ81yvVGR1YN2a0e4vPur4GQE4RvlWvTcfTWPx3q3tTYSO2oq+ajuR+p00cWqh+CpxXYvHHFNwGB7xHmbcRKOTydWvLxWM/07K5WTQXQuZjkYdmrgF4JqNMvik02xV5nSimsy6CrpyKWass4p0X1J1UBQDJpNsIXCbYLwNTpcQMoxi5j6YkPZPdJOQa7bnISZG+/5DccqeXgI2fd05lhLKmIifBx7W5stfM92YXwl735bv1opJubsF651ep6xUjp2+Truqzl/13T3UPMMf+usDSBOAu6lHrKc2Aki1uuNiU35jgtj87l4k5yd8DJuTuZ3mo5whJ2dFvBZ0iFeb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH+bHxOJIBgYl6qpEeumKYTi1a+VNvpdPzaMvLDN6Po=;
 b=V2oA8NTO22lJVLs+KX+W+FsbloZV4RR+pHa9hiHqJSz5ZAvNuJvO/b3DjpxdsLB9130mOIzjeKyrYpHayy1gV8HJpPwinUqHzNe12Ad+p9p6H0iwo5orl761rSZFfQ1+tEgLmNIuOauohQO+3R7ctNMgWjHtvPz0QH8tktfiKEV5QHZtNo85rW02F0Rp7AkrmS6IuesXctClAyTNepOTILFvCRWW3ZNlX7oyKvJt9dPQveLyRx2oGu3kmrsmhVpwkR8AZs++eYa6BCmiCFC8NiwYLP+koqIGwAT+PxklUIJiVCUlCBRX5amMDl4OMLghI0h3HsKIqkZia2l6+d5v7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by DS4PPFCCD6F4BBE.namprd11.prod.outlook.com (2603:10b6:f:fc02::4e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:57:18 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 21:57:18 +0000
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
Thread-Index: AQHc/QCGO67nIHPcwU29qMal4CU9pbZWKn+A
Date: Mon, 29 Jun 2026 21:57:18 +0000
Message-ID: <a16de9370b4ff397c4f006b402afad353e28f4bf.camel@intel.com>
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
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|DS4PPFCCD6F4BBE:EE_
x-ms-office365-filtering-correlation-id: f1fb565d-3fb2-4aec-b2d9-08ded6296363
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|56012099006|11063799006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: bvQ6zRYlvQefvdENItJIUx09Wxhu1K5kTl+Q2TYW8oBx2eSljbEigZ7z7uNv959n0uPj6AKYl55Fmod6I7e1daVwoFQGDN9PQB3IaBVF9jIkM+TvVqu0Hsi/0ftlwxE/hqSKxKt1hFJcD6TjgzDdQVbl5+i1YWPsilMHhxSO9+8KnUwqAKvrXtnCLSLQerjIehQvPXRJswhvJU25XFHiZFrvJUkVf9QKN1vkbaXu8I3MLTgN0/4SWaUrmoyZpN0uSOwKcnIurZZksecPgWp5CZp18P3TqwXmbgzV0F16JIoVovbHTdNdxkXHZKxHqQ4RUTa+OTXhymzXeZYQsVb3F1eqPvqCDjfS3LnOgHtxe/CCMrjDJ+NKi15LnZ0eCyWp5WyYk0alL2VPK98JgvjrBeaU8P2sotJf8dSpK1l6+PcTuw2p922PqKYojHEOp/9rYG/EvK9epcYmHg6ekx0ozFP/UuiynL0p1C1s9n/NEwsczoW3U1YLtN36b8O8XsLtaZBZf1vxd8/VFxwiyQHh9GWlyECw0gwlqkF3Bj7f/8ijEtSBr1msy784yiQJ+C86yLrwjxeTKJ0f/HBUjhCfStP3ZjZrOlo1rjPHi7Y5bHQfpJYmgq9ODP6hHXabSWz7/XnS97hMprbKltlQUz8o+medqcACr6tXxTwbqHBM0Fj8mputwE3pZ/Nz5keXsPrYVWox9Ido6jd7xsK+w5twmNwDxMxIvEsktBXt651PAqQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bU11NitnejN3Uk5FWDUrSG54QUFabWkreG1mYnFuZElBOStOcHZIeDRlWlhH?=
 =?utf-8?B?WkdRaE1xeVI4dkd5VUVWRllraXh5bW9TQzBZRWpPN2h1RnhZWXVmY1J4a0hn?=
 =?utf-8?B?YzBnMlRvQUhxZnVOcm1vNVRCQkwwQjczMmp6NXFzS21GWXV5NzNnbVRmbTJj?=
 =?utf-8?B?c3E3TkRWZk1DVEtSbndUemc1eU1jM1RReUUvOXJTM0VJZlJPN0JMVGVQTVo4?=
 =?utf-8?B?bE5HN3BTMmIxTkNmdlRBMHlpL2ppM01uZlNZZTRvbW80NVppcUlWV0dNU1pZ?=
 =?utf-8?B?cGhRWFRLdVFhKzgxVnlwS3dqYUwzVDcwSUNBVVQzM0xRM0o4ZUZRRDZDRkMv?=
 =?utf-8?B?Q0FkTWZ6Wkc5ZnJER1pQS1g3c2JBNjh6Q0g0dlRxaFdSclN6Q2xka0lqMG9a?=
 =?utf-8?B?VE1FLzdVMklPMXlNcmR1UTdiVFpuQ3pmWlQveTF2TFQ5aWE4VnlzNXJiQzVj?=
 =?utf-8?B?R0hHV1ZkaWRwTDc4OXlQZ1hhellmaFdmN2hja25GdGgxNkdmbVUzWWJCS1lh?=
 =?utf-8?B?ZWpWN3hCNXFya3RUT0I0M3l3TGlwOGlHWURvcVBIcDhzN0tUTVlkTmZoaVpW?=
 =?utf-8?B?YU5DckhwQkN3N1FoNU14RXE2L2VQNmFGbFNsMUtOZlN6endrdlVUUmJSMGdF?=
 =?utf-8?B?dWF1S0Y3alR1ZjVISG1VQTRFWWZpVmdCcEZQdjM5Q0ttYW9FaGpkejYzTzFF?=
 =?utf-8?B?NW1MeitmQWJoaHRtMytvVnFOOWJGQTkwMThPUEErc0Y2S3FiZWF1NTVNODlT?=
 =?utf-8?B?WHNhSEF0a25BdktmZzhteWxGcnJwbk5udGFDTDMrWGc3bXBGQXpiTlVBS2dr?=
 =?utf-8?B?MmtNRFNSdHZnQTA1Z29vZnN2MDY4b3JQbE4zeURCZFI0NzUrNGtJVXhvd3Z0?=
 =?utf-8?B?T3JxNkJGSzBHK0dSd09NWEVHeW1rUWtnMUpaV1dCb0N5ZDhLK0xabU82cTdy?=
 =?utf-8?B?cERqZHk4NFBnUUdBS1Y2VTZOYktRVW1zVC9yOWRKTFNUKzZrT1oydFlvVG9T?=
 =?utf-8?B?c0NQd1Q4OVRUc0pzb1ZIRytmQ2h5WEl1b3FWZHpVbVE4VUdhU1BDRzMwdkcr?=
 =?utf-8?B?TW9RZlc0SXBHTnNWY1JuY1RMMUptNVMwNSs4ZG5HRWMyUjZKdEFzSHhrYW0y?=
 =?utf-8?B?bjRPaXpES1kzT2FUc280ZlcrTEw4VzJsUFRRSStOU0VZNVorVjhLYkY5UDVy?=
 =?utf-8?B?alJLaVJjcUFOaFd0ejN5djRwSE5wdUM5UmNNZXdOa204TVZTdnA5TW04ZmJG?=
 =?utf-8?B?elY3L0tCZXhXdHVNTWx3a3FsSDhZWkJ5TXYvTnBGRk5WRnVuS2VNdmRqTUYr?=
 =?utf-8?B?YUlGQWc3a1llNzkzQng0cXJjL0pUYmJsb3dhVHJ3bmExUUcxeUlUNU9rNU5R?=
 =?utf-8?B?MnVRRHY1QnZ3VnVpUXJQOW9VRlF1WlpsM1RvMkVWdTBYMXJiSUs3ZVpCVWJ0?=
 =?utf-8?B?d1NYaWJOcTVidVpGenFnUnVVdHhWL3haRy9vSlRsL2pjL2lMZVpjSk14WjBn?=
 =?utf-8?B?YWluaHBaNUZGZjVBT1o1MXFyRnp1TTJ6NnNtaUtYZWxxem11dkJ0OTVYSmp4?=
 =?utf-8?B?QzA3UzY4SXkxZklUbStkU2JRN1RGeUR0SWM3bTNIalR2MVkvNjdRWWhDSTd2?=
 =?utf-8?B?Y0pMM3dQaEtpdUpQWTRhZzB6RVhvTXdBdTl4ZzNONGM4aDdkQWdVbEEzM0pj?=
 =?utf-8?B?SUtlSU1iaXNZeUt3elNldjJiK1hibzhHUSsxek9WYUxLSGtneWJnQXkxT0Y2?=
 =?utf-8?B?UFZyQ0kraVAvSnY1KzFFSEd3OUd3NXRBUWRMeXo4MG5QcHZuTVBNUTI1ZGlh?=
 =?utf-8?B?TWxvMkQ4OThEOXRjUzZwSUU0K3FjZU53NHdlck0yTTMyL2wzaER6bGxxVURu?=
 =?utf-8?B?Y1ZPb0RreVFnMFI4SUFDNnRyZm9va043RDcvSW9kQ2Y4T0dZc2I1cnlRcnkv?=
 =?utf-8?B?TnFCNy9RVmF0NGNaK2V2SlVPM201YkpBQVJVRGhSVyt5NGNpaUtLUkxJaGxF?=
 =?utf-8?B?ZFhuT2V2M0xDTDhJZ3J3eXQwWk4yUy94dEdkMFUrU0prWHZycVJYS05tMGYw?=
 =?utf-8?B?b2NseFJWaENaVnQ2dVdBR2dOK2dkQkpTbU5tdS9yQXl1dVFIcDJOL21VMUlI?=
 =?utf-8?B?a0QxN2Y5dUJrSWFIcjdQclFaUmJpVmd0OXVMV1I2ZnlCU1duT3JTTHJNZTZG?=
 =?utf-8?B?dkJjNXVXRmdsNWw3eWs1Y2dqSkF3VjV1ZFBRY3VyUzFCcXhSZ3VScXNuOSto?=
 =?utf-8?B?c1o5YTFDQ2laU2tySzBOa2xQK1dlQlM2UWhtc2ZhWDlrSjBMNVRVbkNmTGhh?=
 =?utf-8?B?QytaaFBKYk1WL3NQN2ZDUFZJMmVQTUNoUU9tbElBUnU3cUkyd1pray8xbHBk?=
 =?utf-8?Q?KJYkbxQRxsexfZ7I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9533A8A6BE95E43A588A57D4C5D43F2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bYn38frol/LTxXO5ZmkeDnve3wt23TqHK6BwCHrjQsOP05P5l6cYwQWwOLAYZAIFPyO+qWDXTI2+1FSxausWLqwK5NkoQ66wgaf9MUnmrD20YJ7naeh8nTRGOyfQkd5RIIqP8Iml9zxaLHNM3+QMHXqLAgujZj65DNlB7y9J/l8MTHsCqWWp05Sh/HoK+G6gCi94X1lcSeX5sVHavns7KEPSjuTUT1BeVzWahJOMac/T4Z+kOTklo6nyIWa+p0rD8iehi3kEbfqZDos+h76w3YcnsQGMr47SWFsIgWZXuV34KsVNxmvFoLo0+wj7bOS1JLDYi/eKjjwpY+1B14CBBw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fb565d-3fb2-4aec-b2d9-08ded6296363
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 21:57:18.2473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xXlQIbqsPNf6DO1XTt0s5Yc+/qZ7burZOAm293O9vvUTmu7diLphdDZpJHSSDEDov9kZ5BzSanwp5jw0QkEGnVVuEhGp0oUmxYKfWs+TjkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCCD6F4BBE
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI2LTA2LTE1IGF0IDE0OjUxIC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
ICsJLyogdGVzdCB0aGF0IHdlIGNhbid0IHVzZSB1bmxvY2sgdG8gc2V0IHNoYWRvdyBzdGFjayAq
Lw0KPiArCWlmICghQVJDSF9QUkNUTChBUkNIX1NIU1RLX1VOTE9DSywgQVJDSF9TSFNUS19TSFNU
SykpIHsNCj4gKwkJcHJpbnRmKCJbU0tJUF1cdENvdWxkIGVuYWJsZSBTaGFkb3cgc3RhY2sgdmlh
IFVOTE9DS1xuIik7DQoNClNob3VsZCBpdCBiZSBhIEZBSUw/IEFuZCBpZiB0aGlzIHBhdGggaXMg
dGFrZW4gdGhlIHRlc3Qgd2lsbCBjcmFzaCBiZWNhdXNlDQpzaGFkb3cgc3RhY2sgZ290IGFjY2lk
ZW50YWxseSBlbmFibGVkIGFuZCB3ZSBjYW4ndCByZXR1cm4gZnJvbSB0aGlzIGZ1bmN0aW9uLiBJ
dA0KY2FuICJnb3RvIG91dCIgYW5kIGRpc2FibGUgc2hhZG93IHN0YWNrIGJlZm9yZSByZXR1cm5p
bmcuDQoNCj4gKwkJcmV0dXJuIDE7DQo+ICsJfQ0KPiArDQo+ICsJcHJpbnRmKCJbT0tdXHRDb3Vs
ZG4ndCBlbmFibGUgU2hhZG93IHN0YWNrIHZpYSBVTkxPQ0tcbiIpOw0KPiArDQoNCg==

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F31F382F13;
	Wed, 25 Mar 2026 20:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472279; cv=fail; b=k9ZLrr7QeJothpXnIUCpEIHLpRb3jKusRn/hWD1S/XT+FCWzwcPOe9mzSdf7ZAY1GDxVUYq7pfUY6zdeSihNg1QfHQN5nmCAh5XWn6QUyV+gC/OtalJopYrw8psR7QF3WnFTX8DekIjJ6PrjB+zJf0TtPlfcAO1qJWH08k584OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472279; c=relaxed/simple;
	bh=AT+XVAloTIEjZMsIK25oDaFiNu3WB0h82/aP75oIZ6c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PFJaLyQIhtXFMDPqvgaBq4n0zshSG8PnLMQlVV7D2edY9ddmTHGWR0w/VH/JNi61pVoCosD2MpcVauJOtNG3HyZfm2WbgfvvVvMOGObJuXAfUns25+rqhMUW7d4pF/jPqfDwlqVK62OJh42CZO9e4POOFW6BsBF4tn6VPEt33Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqH4gGSZ; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqH4gGSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774472277; x=1806008277;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AT+XVAloTIEjZMsIK25oDaFiNu3WB0h82/aP75oIZ6c=;
  b=NqH4gGSZ2n3dN8W1/tx2n8d22lTq7OKiouMfHvjQrQZsQC+tkiY9BTqa
   tMvrYGqvZlkcq1LBPwPaOKxW4HLwLt7ktcg36JAYvyG0+97vESfvnox9T
   m7aJMeYa98nNCm8SFBUcVFSiBl9wp5psaP4LzhWEDhWZkYLbpCUNhZN5v
   Rc/gWRSETmSUvuCgnFCmIjMcYOQnqq8iUUjm+dXXuYCZ26lO8Vn5tOi2S
   ZqH/ucjQeIP3SurhUgcT25c7UpbH2TOOu7xfKeEc0FHrhXcKlSn7eDpVC
   Qeb7npoxqivAaavfQpc6aZXklmpI4Dt/w8zgeJwhh1EaTdFgl3gFl7SUx
   A==;
X-CSE-ConnectionGUID: mBW3V8imTeiTjQohI/Gv5g==
X-CSE-MsgGUID: 9iFwTLFfTY+/IGErW3g7NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="63071265"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="63071265"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 13:57:55 -0700
X-CSE-ConnectionGUID: BAz4VBgPTE2gLCYxoqL+LQ==
X-CSE-MsgGUID: 7XlS72OcQECUM9cEKLl2Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="225053424"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 13:57:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 13:57:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 13:57:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 13:57:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXkBlj0bvSFlagcHDZqpqsdUiobM6GhFjlIebLx0v22ud1fub80VfItTkX/uPUTu0bX5xZtvCXl1OgPThkjqrjhdoXkzZc4dFUWUvxJLotbb7D4KdYLrPQBwRBMSMhyLS5blKLGIL4nWjrUPBYZChpHkDLlm3NjZHrV+OYLmVzzhcPsvIKw3e3+JOT0nBy+gAj0KO/YTdwxJLCFYeLEIQr7DK+GngcgwJWN3qSDFmUP+5fKHMrQUnGHOfysNV5HkKMgQjtzy6n5ntaOqzZHdtCvZZ6d/flHn1CH6G1VQ7icG0mq/c/WghiFgThxZef+faqZe76vCViVW7u1vxWSC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AT+XVAloTIEjZMsIK25oDaFiNu3WB0h82/aP75oIZ6c=;
 b=eUTUF54xZMD6TgXpsLVNg7nlHvXZQsFn+K6DSVIBiht/6kDH9RlUw5gGd3r+rJ2XOPxJMDmjzZSCNBqdvS/WEWDsveaxMucg5FyQX8ZgIN9cMgHmjWeTAguczzhWMBO9oljU7dHlrun9s1PGPNUjuMPONIQ5ZQIzTUFxWiGtSWtNOBUnVxHtwAK1DQybhCA7iC44pLgpZBhEPmwtfvKPRoztSGmLYS7PWOjIRT7jcZ3lMwn36kMVpYKncC9UmbwhG1pTvUSYXty9TeDcxlhiS05SNq5tQ1bmfKnSrV4+kxoi3GTvxR247WRd+sWvZBJMd8ITIxgmI9Dlz0KQieDmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 20:57:50 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 20:57:50 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Edgecombe@dev004.aci.vzint.dev" <Edgecombe@dev004.aci.vzint.dev>,
	"aleksey.oladko@virtuozzo.com" <aleksey.oladko@virtuozzo.com>,
	"x86@kernel.org" <x86@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "ptikhomirov@virtuozzo.com"
	<ptikhomirov@virtuozzo.com>, "bp@alien8.de" <bp@alien8.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "shuah@kernel.org" <shuah@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>
CC: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] selftests: x86: test_shadow_stack: return KSFT_SKIP
 when test is skipped
Thread-Topic: [PATCH v3] selftests: x86: test_shadow_stack: return KSFT_SKIP
 when test is skipped
Thread-Index: AQHcurI+HGbcpJyNpkmxBgqtVTeFJrW79zMAgAPHcoA=
Date: Wed, 25 Mar 2026 20:57:50 +0000
Message-ID: <2374231591e8c952437a5dad68fd4b82e68fcc0b.camel@intel.com>
References: <20260323104536.198738-1-aleksey.oladko@virtuozzo.com>
	 <75496499-9ceb-449c-8a73-30d9ea1cc452@virtuozzo.com>
In-Reply-To: <75496499-9ceb-449c-8a73-30d9ea1cc452@virtuozzo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|MN6PR11MB8103:EE_
x-ms-office365-filtering-correlation-id: 5f2166f7-ad27-45b3-98fa-08de8ab12d60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|921020|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: LqGlcLflwlerSIN5aQJ2RajhjXRiQwIfRnKGbTd6q8zCPciAV1eyqAVVQcePIhmVjSnHlBiOrufgG96SAtY64ifngQ6zhhqmd9drCN+goT/Xt5s7fPsAD6uvPNRe42dJv22DdhJRr9fZpU58eS+vDJghxbdOh8QOUdSsE7OTMXJeA9L7Yh+/3RtzK81mdbN7O2IPJzSG+9mOOz8j2oUZ1U3H+w39YdebW5q57Qd/jEBeKYnlaNrPLgNeeiv/DGOgw3O60Qmx6sNQ0T59SswIsds1cMTheYm27uYP2rz+WLfMlhk8V5Nk58ufiNJ7q4yub+aVCIcKRWolxNyq53Xm2Csj6r5bd4mFHwDCJxi7QWqlBy37pFIzwN+OOirLW3Jh0jnQ7Bus09m/QuOfFgMcly+6J02F3f6kMQ0vGHsjMFhPdoU35fEkOsLYGcjZCZs+R26wHGhNARumwKcqoOz8wDNhIoNz9eNWa8O+LT77WhSJK4aoJAv6AwNwKfwGlGL0TwNegi2j7SUJqFbDmBLc7I6TcmK/XtW/Vsh5Zy84GcUbn550/VIZeBwiZrbL8wLkaK/9bCBvKzk34YvJbh/OIQ26xpkx8v7cRdpkp/vj0PflgnICpP9sMhqJ6Y7++FchzGDNxf0DpdiheB9GUXV9oKRznLqAlqCHU6GMK2toHm1rcn6/Gdonq9Wb6cv2AAlsNXhtOtXlzUe/N4lGDP5Panu1LRMQ5OZiFUoE6awPETCQzN0avzzJN41qm8/N2otR4ZeCDdH/qhRTedv5doOS897T9TQgnnJPQk0zY1L3mdeznNKGP6IKZYbcJRB610z5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3haSmJUaXhPSGp5a0dOMXN6MVNuOVNLWmJ5THN2NmNmU0YydWJRZGZtUXNO?=
 =?utf-8?B?V2hXMmJ6QjFaNFdIY2lZR2NGSEU1S0lsekp3cGQzVk5LNFk5WjFhKzlPcHZy?=
 =?utf-8?B?ek8xdE0weEpqbE1QOTJXZnhnK2p2eUJ6dTloR05FZW5Xd2hzS2h5eTJzTGVP?=
 =?utf-8?B?U2JzdlVFV09pc0RmY1VEdkU4bkhuU0pVeDZTV2MvOHZpQmp2MlMrRDVpdVFm?=
 =?utf-8?B?YzdyNlVwZ01YZVVSVmkwMlRGQUZKejFQMVRicHcrMlNOODB2d00zSC9ZbERV?=
 =?utf-8?B?YThHc085clNpelpRYXVGTzVkbVR6RXpJWnhwbVNGcjJGNDFEZmxnNXBtZmpp?=
 =?utf-8?B?M25zL2gwRE40a1JRZ0dDSGxHekFyaHJ1Q0tZVmFpV3BzWW1iWDZXTXlNcFB0?=
 =?utf-8?B?OGJUVTdsb2tzSkU1TUVDWGltSFQyb2RzUmN2bDMzeHo3Z256NDBlK2liWnFE?=
 =?utf-8?B?UjFMcWhFalhYOXE0eWM3b2dZcVpQVDhOcEJqbGxkY2FRaFZiRXJBSnJ4V1BH?=
 =?utf-8?B?RHNzckRmQ21yL0RLWnVESUh4MXh1anJPNGdubmpERTlZUGNzd20zRldrZEpT?=
 =?utf-8?B?dks0ZDlxcFVseUwwcDZmZytSQkRocTNyK2lvY3lxbUwrdzJDNTRkM1M3ZGJl?=
 =?utf-8?B?TlR3UE1UME5pY3pnaVBaSlg3QXlIU2NaTm1uSUozdFVIdFFiczlnQThWcGk0?=
 =?utf-8?B?ZmluTWNMS0lzd0hzS2J4a3JLWFdjSVFnVW5pZVdPd1B3OHZSSVdkeUkzTUk2?=
 =?utf-8?B?RkJiTHlGTkUyY1dNQkNZZnhZNUtnRnlXdkFGQXo1QnZxNWk1eVJ6SGRTUlpN?=
 =?utf-8?B?ZXd4b1A0aUM1bVRHQ1VNeHFRRWhxSjY5M0Yzc09GMWgxNGhlQmdzN3cxa0lm?=
 =?utf-8?B?MmhSTGtYcHF5aEpUY3NmcmlORllNRFpiQnpIMnpnY2NKYURTOXBIS3Bqb0NL?=
 =?utf-8?B?OU04OEtqRVF5T1RMSXlqbExJUysxY1hNdW5WaXE0NHQzU0ZRdldVYU40Z29w?=
 =?utf-8?B?ZDVUdW1XZ0JqNWN0U25MbXRDRWZUdjBxNS9pelMzcmxKRElyOXFNZzFlOC94?=
 =?utf-8?B?SDM1bjFWOXlmL1lDUmNGWnZpbEpMcHAvU21WS05WQllFaUVWTVNycFdIa0Ev?=
 =?utf-8?B?RzRxUmN0UFhuVGxqQlR1NldJQWdEdWtaTkN4UHcwS1RKTEJlTWltZlRseDAz?=
 =?utf-8?B?cDd0K1ltRkE5aVozRFl6cC9xM1pab2xEOXRtd1JXSnBBTng2NnNpelhPdlJK?=
 =?utf-8?B?cjJNVEszcEQ4bld1QzdQMUtXVFh2Wi9KUVU2THJqTzU3bEk2bUc1QU5XaDds?=
 =?utf-8?B?VVI2NEFTMnBwa1RQbTdkL1VNMjEybkxuT296QU50dU1XaXlrTGlnbDRWN1hE?=
 =?utf-8?B?cHAvSkZwbVd5UGRXZlQ4S010Z1I4OXE5emtQZGd1bXkzdlpTQlVzYlptMVl6?=
 =?utf-8?B?eE9SbDhTVzlMK2xNQWxLckdpYlRhWDM3OUtaMHR0a1I2MmtDWDZ0ZzZoOWxk?=
 =?utf-8?B?bVhuYWF6OU02MUc4ZVQ1eEQ3UnhPMnhDRmQybzl2UVhIY3pxY1Q5Z1hWTEEv?=
 =?utf-8?B?cnNyK0IyQWcyZTFpNW0wOVQ5aDdUdmNUNnFScHc1Ynd4MmZaK1V6OHpSSDRP?=
 =?utf-8?B?QUVrOW1ZdkpTditNemhuSXRybHhKZDVQV1A2enYzZ09BSVgvTHNtNXkza1R4?=
 =?utf-8?B?bXZyODIvTXpPUmdwNWxSKzNWTGQvYUUwc2VyZ2hoUW92RExTQTBMVHF3cm5P?=
 =?utf-8?B?RlR6RDl5OUxuMW54UjVnZ0lweE5iSzdPYlo2eHZrZGYrVWFnZ3VGMHQ0aE5v?=
 =?utf-8?B?ZnZHd2xweE15MG1EWmttZXZmNkRsdGUrWUNuQkgwUGFFT2tXVVBjemh6WWNJ?=
 =?utf-8?B?RFUydVpxeS9EeG1UM25uaStySXJnYjBHSXBKemVEbFV6WW55ZDdtdVNNSjNw?=
 =?utf-8?B?ejZlTWZoMnBMUUhTUTRic2FLVzdFdzVNTndXUmY1bXdoaCt6bzBEbVliOWhx?=
 =?utf-8?B?YXpzeUhld1JTamtIMHZrOTBwUzVOektBQ096d1BGZ3A0Y2lwRmJ3cEMrZlRT?=
 =?utf-8?B?L09FczBQTENjR3ZUaWNEalUxYUR1QzJFbWp6QjJCdkF6TUFLZGgxVFdXekJH?=
 =?utf-8?B?eUlpVE1mNHhYUHZjNlJ2cWk4eVExbVBvdWt0alJobjVWT1VYQXlFa3k2aFpQ?=
 =?utf-8?B?TVU4YTJ3Rm8zcnBIZC84UUxwMERwTHg2M2lxSk1EdFRRNWlDY201eXNLMDd5?=
 =?utf-8?B?cDl3alRsSzBEUnZHS0JhbHFDdTdIRUVXRDRrTWsySmF0ZnNrdm5XajlsYjdM?=
 =?utf-8?B?M3BrTVdrekdyRFhLNmlIMjA3U3JGbGptcERNSWhUdnRqS3VBSnlkMDNyVDls?=
 =?utf-8?Q?+F0u66WYd3Vh4Z08=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <058C1626C7E56D4EAED546823DE60078@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: e9d+HLS0rKsPqwWv9M05U/E8nKEhzQpaUFhmY6yHdaysRkJNUkQLAloMFY4M0rleEsmIRPJelUSzB8y6h9e2BOZL+3B5Suj2dyMGKV74LjnB/RUDuxMzlZRO6fOoE926EzyrSUQS0NRw9CIdzQh7N0R1YHZgygzL+0/M99eyn8xEKAN7G6CHeyd1aBLoBB8yREtJTgiW/j1otnzFA/yCD3lNzVRKu8LBDHDMfVgoriula5v2Y7KPtvtw1cQQEkYX07aE1389Wa5EXIYHO8dLiq+2Ey+kV8x6jGA1y/6nukfhu8odYxj+1XvRhgGETadE0X7uosEbT4P0uXDg3EW+0g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2166f7-ad27-45b3-98fa-08de8ab12d60
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 20:57:50.7947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mvCHU50KMHTJayUruq1OglT2yRxCvoEFUNEGIskSEr6rHB+OME6wZMwX581OzAFJeNjboEHPgtxRyecrEhZI/mf7ft+JmjO1nR4vZsYftq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
X-OriginatorOrg: intel.com

K0ppcmkgd2hvIGFkZGVkIHRoaXMgcGFydCBvZiB0aGUgdGVzdA0KDQpMaW5rOmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAyNjAzMjMxMDQ1MzYuMTk4NzM4LTEtYWxla3NleS5vbGFka29A
dmlydHVvenpvLmNvbS8NCg0KT24gTW9uLCAyMDI2LTAzLTIzIGF0IDEyOjE1ICswMTAwLCBQYXZl
bCBUaWtob21pcm92IHdyb3RlOg0KPiA+IMKgwqAJdHlwZSA9IGRldGVybWluZV91cHJvYmVfcGVy
Zl90eXBlKCk7DQo+ID4gwqDCoAlpZiAodHlwZSA8IDApIHsNCj4gPiAtCQlpZiAodHlwZSA9PSAt
RU5PRU5UKQ0KPiA+ICsJCWlmICh0eXBlID09IC1FTk9FTlQpIHsNCj4gPiDCoMKgCQkJcHJpbnRm
KCJbU0tJUF1cdFVyZXRwcm9iZSB0ZXN0LCB1cHJvYmVzIGFyZSBub3QNCj4gPiBhdmFpbGFibGVc
biIpOw0KPiA+IC0JCXJldHVybiAwOw0KPiA+ICsJCQlyZXR1cm4gMDsNCj4gPiArCQl9DQo+ID4g
KwkJcmV0dXJuIDE7DQo+ID4gwqDCoAl9DQoNClRoaXMgcGF0Y2ggbG9va3MgZ29vZCBhbmQgdGhh
bmtzIGZvciBmaXhpbmcgdXAgdGhlIG90aGVyIHN0dWZmLiBFeGNlcHQgSSdtIG5vdA0Kc3VyZSBp
ZiB0aGlzIHdob2xlIDwgMCBzY2VuYXJpbyB3b3VsZCBiZSBiZXR0ZXIgdG8gbGVhdmUgYXMgYSBz
a2lwLiBUaGUgZmFpbHVyZQ0KdG8gcmVhZCB0aGUgZmlsZSBpc24ndCB0ZXN0aW5nIGFueXRoaW5n
IGFib3V0IHNoYWRvdyBzdGFjay4gU28gSSdkIGxlYXZlIHRoZQ0KZXhpc3RpbmcgYmVoYXZpb3Is
IG9yIGlmIHlvdSB3YW50IHRvIGltcHJvdmUgaXQsIGRyb3AgdGhlIHR5cGUgPT0gLUVOT0VOVCBj
aGVjaw0KYW5kIGp1c3QgYWx3YXlzIHByaW50IFNLSVAgYW5kIHJldHVybiAwLg0KDQpKaXJpIGRv
IHlvdSByZWNhbGwgd2h5IGl0IG9ubHkgcHJpbnRzIFNLSVAgaW4gdGhlIC1FTk9FTlQgY2FzZT8N
Cg0K

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795623151;
	b=WJLmQzwjuYo9Eoiok/hkjOR5J3CRXslQHuVL/rEYRqT7p+NKbUToNNAXiWGqL5yl3V9q
	 PcE4st6/yjHQpPdt10qtDkXWIq0TWISFgNvf1gPZQFWQ6+nAfPTiXytBIT6HjxSneqHqD
	 upruNf/trllJLt36OmkfdHfY3iMjcAFtMHZwyOm43d9ihYbRSqafltN0mraFTJKDzz8+E
	 FJ2kxVKiAEiRmpQLiolc8Hn+LVRUsgFptKtQWakd3WRdQXPJy+wCZZ2bZ0be7rHrijrt6
	 wmA2R5RJNTNehXOCgtapIvH/Xj0u9PCDntZAi194WjQvWCc9ATxGn5DX0pIxwqrD/KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623151;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RUPZr3lJEpurGCSkGWIEufzy8zm+PT5Nzerewm7EPO4=;
	b=k6NeAqOBCnc9tPLMjUAqbHCyCeiklDUT03lscIJJ79tljR0Q9Xo1zxXM+innkwku+Q8Q
	 x/9Hia76Y7WdG78+iPzZWpeYsIB/SOguxIvoYHFnedTLnitHYeiFrMG85pEhRA9W16cHG
	 dpyeOiVP/nyNCBc82rWJIq+V5yef/XBD8a7KNTvdjhWF5f7vr43hcVfyeoAdobapyxAYX
	 O6BQj3Xm2uC9goTzKF+rU6k/3fIcxQjYgt4rew/A2NnB+uZTjT5NsjMjqjHasnQQCBa9p
	 4zcvGq2+059POv7kU6hZDWHm5icceCN/ljD22d7IEgWZ+YU7PlY4Xmmv+qd5A7k79UQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=s+Yqqy8p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.58
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DED606A321;
	Wed, 25 Nov 2026 16:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29DED606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=s+Yqqy8p
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vO5davv+rE1lODQ7haJxGENHBomb3zv3ToNxPHhxV/XBY4paAyvZEPUCwhm8bnYod3n9MgD9dPSwBKzJY7RKHLNfCbpj0UlrpyLpjja3GY5VJ9w4bUaakwPrRNdSV7pI0S9d4rCK1qVVuRbzh8JtbORwcrBxSFK7Z+6BbR/UUNr/TQE/1glk8XPFiBy/jEiRLQSKxQ14NzQPksw6PBZOuru0k23k+dCYMdQcXxLWF/1LLup3I15evbRPLxArN2tJqbCjKw2VobpBBMkg3zFvYgBhE2hFXYO8uIGpfa6QuYTil19X3ei1oRCRsi9A9bzI6qX4WVPypKUYnBPv9VNuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUPZr3lJEpurGCSkGWIEufzy8zm+PT5Nzerewm7EPO4=;
 b=Fp4JE7kZvB1dxw0l7ab1osxANviFBTgkKrvg5SYuuRAxIwugrFEY0q3nPTLGSrk2nyC3gl4pHmq0W8L5IUKhCUJjjwz1elnb3pwMWY4kd15ZdLDTg7nMQ//jKbTy9tsJm5SXtFhOu6g4xM2IAuw4wWv/jk9FMcjzYtVRL3q+oxq3Ts2O8yOkGizgS48Cuor6Ncbhxxgdknxhh8P6ZE23TZ00KniRSRJw897T6PJAJXR95VEE9PcPQdZ2SiN1i4AW6O/+5Ww5dcst1foc4OGW10ByjU5qtpi4fxxwt465czfRKT/CjaXK0XfMs5IS6k5Pu7lP85Dt0iY9pfW2wIn82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUPZr3lJEpurGCSkGWIEufzy8zm+PT5Nzerewm7EPO4=;
 b=s+Yqqy8p8vbwh/9DPyKl1vfA+loMETKkAnoLoIk7Ckwim4+mvVYiLix3yp01D7Kp5/jv3AO7dFUp5T0tBr96idM6Hslk1Ui8yAjN2zA7779KFPMoFYc+1vcQMx30Y8VldtGCwAs+z7dbN0f5Od+duxvkOZBMuLoD9HuCO5q7LWg=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by PH7PR12MB8795.namprd12.prod.outlook.com (2603:10b6:510:275::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 16:11:51 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%6]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 16:11:51 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "usama.anjum@arm.com" <usama.anjum@arm.com>, "nico.pache@linux.dev"
	<nico.pache@linux.dev>, "rppt@kernel.org" <rppt@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>, "Rao, Bharata Bhasker"
	<bharata@amd.com>, "yintirui@gmail.com" <yintirui@gmail.com>,
	"vbabka@kernel.org" <vbabka@kernel.org>, "emmir@google.com"
	<emmir@google.com>, "danjwade95@gmail.com" <danjwade95@gmail.com>,
	"david@kernel.org" <david@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "dev.jain@arm.com" <dev.jain@arm.com>,
	"pgofman@codeweavers.com" <pgofman@codeweavers.com>, "surenb@google.com"
	<surenb@google.com>, "peterx@redhat.com" <peterx@redhat.com>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>, "kas@kernel.org"
	<kas@kernel.org>, "ziy@nvidia.com" <ziy@nvidia.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "baohua@kernel.org" <baohua@kernel.org>,
	"liam@infradead.org" <liam@infradead.org>, "mhocko@suse.com"
	<mhocko@suse.com>, "ljs@kernel.org" <ljs@kernel.org>, "lance.yang@linux.dev"
	<lance.yang@linux.dev>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, "wine-devel@winehq.org"
	<wine-devel@winehq.org>, "avagin@gmail.com" <avagin@gmail.com>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] mm: fix soft-dirty false positives in mprotect() of
 large folios
Thread-Topic: [PATCH 0/3] mm: fix soft-dirty false positives in mprotect() of
 large folios
Thread-Index: AQHdfOGHEUgq95w8VUOHW+Vokl59fLc+zCWAgAAhPgCAAAgzgA==
Date: Wed, 25 Nov 2026 16:11:51 +0000
Message-ID: <8b1a6f9da685a0e0ef44c67e92e98e37f37bd42f.camel@amd.com>
References: <20261125-b4-mm-soft-dirty-fixes-v1-0-538e3cdb618c@amd.com>
	 <380e029a-2d9a-43ee-9048-c4b490c11f41@kernel.org>
	 <0308f0ef-9989-4a9b-aaa4-2a3169ac1f02@codeweavers.com>
In-Reply-To: <0308f0ef-9989-4a9b-aaa4-2a3169ac1f02@codeweavers.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|PH7PR12MB8795:EE_
x-ms-office365-filtering-correlation-id: 5f452acd-0294-4e3f-7b15-08df4b0ed101
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|921020|38070700021|10067099003|11063799006|56012099006|4143699003|261026121527099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Nckaq0Qd0ultOiOI8z/A4e+j38EMNqEtDwt64s8N8DGRfzDyyCQBoty0L6V6A/Vm+KOGyAn55p9vhtjitb2Vm9lOUBw8EvqHnWPXwftsLjCTP3JlChZLZSxBqk1BW01VuQqJS/C1JsQc3oRfR3v0yNbrUPJ3ArSWHC0QFCP48uIZfVn4F2AHJ51pM2cb9TBSMrk0o6SLjuu8CX3ouhqSrvtbNdNVka+2lk5NP3WkWqrmFkV0m0hs9/jsBGMZXDPAZzuyweeZnvXPSnzIHUChHdMYk25Dz8coUoXr8JjgEAJDUsHTi2Ae/teB6zs7HsvIP6xEQaolFTGgONDr6ohbDpy2y+YNGK61nmXHEXj5cGbM0VLSjlGmvyY62C7DqPoLx82RBSAr42ZdyDPkAAJ6UBM+/VvqsLvdshOqxegHD2v3RY/yXIyOIXfbdtByAVVOHcY30UxQKe14ijO9fopI3xWvGBRRuNZIL/9An0p6trSX+BbEhsZ7pGZOy6AXzMXEjwwKPcuXMa0+tqNpz8fgXOXVzLt8RndEjtGaINa9lXwA3BeNASbConC7raGMjNYWpsQB/vcDw1v4thMnJLtkA+iLJknUFJkfw2g8MGL2Hxx0GqUea9QA0AQn03SiRPMbc5XIxkc+9jXuYuVZqJhvUfTJ9oDSQGepvSkoj9KrhHh3y790U/Yh1Vyiax3FFw3SX9GRyABWzEVBfh+kYuvUQDWzb3Zvo9X2MEuSuTCBLqQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(921020)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXdMYVNod1V5aElRZUUzTEdxdEJaenFuQmlyRStzNkZwa0YvbVNmRVFpSG1z?=
 =?utf-8?B?R1BidkVzRmJONy9MSDdXaUdiOG1HL1ZyRE9hUWs1NXhnQ3pIWE9ZWXI0ZlIy?=
 =?utf-8?B?cGgvU2lkTWlaVGk3NEsrUUNHbnRQTHE5ZXA3Ti80ay8vK21QWVVZQ0t6TTR4?=
 =?utf-8?B?R1I1WlZMdmJqYXBPalhlYkxyd2xhb0Q4UWw5QWlWUmJPUjVnMVJaS045citG?=
 =?utf-8?B?SHlETCszS2NPRklQa2JsbmpLVWZYRWlneHJxSFdqdGZvUFhKMkF1eU1XY3l1?=
 =?utf-8?B?dU5NdVR0ZWNkc2pvRjQ3dEg3dDRBckthWFZKNVNKM3Z4WGlEdy9pNFFBUEQz?=
 =?utf-8?B?TmhZUjg0Uk9PWFl3Q2RSYkZuQjJ4UURzbGl0clFIeXR4cjJiN0xMNVpFL2ti?=
 =?utf-8?B?WHFVRTFGS0RKVElxVU1vZjdVdkJ5eS9lVWdDSUVsOE1DNWcvaTF0VmQ1TkZZ?=
 =?utf-8?B?MVhZVnhuMXhwT0NYOW1qQjlpTW9UWW1HeFpPMEhDNW4rL3hrRm1wWURwbDlt?=
 =?utf-8?B?TlY3VGYyaCswb1FtSmJIbVluVFMrVk96RUxiUDEvbTVGMDF6MVRCNGt6cUVz?=
 =?utf-8?B?cHZUcVlmT2ovY2U2K2RXRitHQ3BJRGhlT1BlS2p5ejI4SXMxbEV5UWZERlRL?=
 =?utf-8?B?dmJVbHMzb2o0bGQ1OTJTZ0dwNi9UQjNhYy9YdkxGa3hrYW8xTlpLUWN5YUFk?=
 =?utf-8?B?Z08vOVBxOFNXUGtPYUtYTk1uMDR1R0xXM0RKV2hKY3hoVU1sNGowZFFncjRi?=
 =?utf-8?B?Vm9tNmVqbGlSQTdOVzJEMkp1a1ZDamRNblQyL3FOM0VPb2FNb0xHUmhWWVdE?=
 =?utf-8?B?WkFhUEJRUGI1cEp4MzQ5dmhNVklJajVmUWNPR21jTXlvbFIyVWNmd0FyQVM0?=
 =?utf-8?B?YzNwZDFSaHpQeFc0Z0tacmR1bm1EM2NmQTdMR1h1QWxNWHBWSktzejhtazJM?=
 =?utf-8?B?cW1FSlNRY2Y2V1RXenFaYVFBUHZERXAvOUFBOG00OWFSdjhvWTJFdWtlM25T?=
 =?utf-8?B?UmxqVTAzVFIzK1JqMzZkREl4cDdvKy90dWVCcFdBbTFCSHhYQUNLVGE0eGhC?=
 =?utf-8?B?SmNvSGptdHNmcWRJdzBuYno2S1lKMURzWFNqdjhWSzdjMU5ZYUVKSjZieDlw?=
 =?utf-8?B?ZnVyV0d3Nk1LYlFNQ1VRSlY2WWljWGFCMHZCZnZEVWY1cm90dW42TnVRdEZV?=
 =?utf-8?B?RlNleS9ZVGFucklMQkp1bkxVVlpJb1VwQXJUajBoSHE4VWRYVHdMMlV6Rkh5?=
 =?utf-8?B?Ui9vblIxa0hsenowQmNPS1Zod2E4MnhrODk4cmhmc2V5NEVjVXJBaEYzdERh?=
 =?utf-8?B?citPaitCQ1h6WjRWNHBvekprelR2TzBzU3cyL3RrK0IwVXRiN0xsekU4bUly?=
 =?utf-8?B?aHc3OGkwcGZTR29lV2xNNmp2OXNXZHZ6RUxKbFQ2OUN4OFJwc1lMb2hrREdI?=
 =?utf-8?B?ZW1JOHp4dEpZcWxKb1hXc090WWhvejZzamlkMlkwNno5SWF6M3lWM29pWExh?=
 =?utf-8?B?eDJzbXRlVGVUMFdMQ0ZGN1hWaVE3MDJZclo2Wk55N1FLdGlzREsxUU5JZ2xM?=
 =?utf-8?B?czNIQkpMdjMyTlhSRjRIaTJ5SWRnK211N0pVaU5wRW1zSTNxNTNvZ05hTXhR?=
 =?utf-8?B?dzdwMDFndHN3eG9GVGQwL1NyT2lzNDZXVTFkaU1tMm56S1REZlBlYUwyWkNY?=
 =?utf-8?B?RmNIcGhCbEZibzNGK1Ewem9OTmxwN1lxSUJDS1ZIaVBqc1Jub3pXYUVnK2x3?=
 =?utf-8?B?bXVJK2hBQXgzc3diM1d6Q2pwdHoyLytBNDJTMmRIbnpUWHgvUzNpcWVkS3Q3?=
 =?utf-8?B?cENXL21lWU54Um5mSjdYZStZd2Y0eFI5aXN0Rzh1SFJmM3RHbUtuczBVTFNK?=
 =?utf-8?B?T1c0WlhCVXRaQ0NpczhxV2p3TmhZSm9TQlJvR2laY2FORlo4d1Y5ekc0MzRi?=
 =?utf-8?B?N1FMOEtzVnorVi8rSUpiQVdGL2dOZG4yRVp2a3B5TUJJTFNSaWpQS2FoaEQw?=
 =?utf-8?B?bjRJczBzTlM5bk5XSC9jeFFnUWxoWUkxYVUrVC82ek04cUY2VzA4cVZ4T3hn?=
 =?utf-8?B?QkRZUmlBOUUvMTNHVlNwcm5YMXB0TGtpY1FSV1gzOHhjVFdxblJRaFN3MXJw?=
 =?utf-8?B?d1dPMCtpUElCWkNKMzZHVlFWYUk4SHRuampvZFBneVh3SiszWGNmZ1g5UitF?=
 =?utf-8?B?ZFFsRmM4anFXWFBOV25nWDFrSlNMRnN0bnh6Ym1OOGFpZEw5THp1cGNGQ3Jr?=
 =?utf-8?B?NEJnVlpRT1JZUTZYWjhqR1ZGeE9MRFBJQll3ZnozUjZnOE5lQml4cG1JMHVu?=
 =?utf-8?B?RXQwalR5YnhuRWordU81OHN2bUk4SzBqanNQV0dSdlZ0RjQxek16UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F232C3D1F7A7D4B9D720FF7F9672010@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5259.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f452acd-0294-4e3f-7b15-08df4b0ed101
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 16:11:51.7465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZXkcK7CtjjHUJzUS8lDOPv3HccDzwfkr+r7kDuDuQpmgBvq+0bYcjEanM2Qca2tAAibpJSq3OO+0NOr8N0966Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8795

T24gV2VkLCAyMDI2LTExLTI1IGF0IDA5OjQyIC0wNjAwLCBQYXVsIEdvZm1hbiB3cm90ZToNCj4g
T24gMTEvMjUvMjYgMDc6NDMsIERhdmlkIEhpbGRlbmJyYW5kIChBcm0pIHdyb3RlOg0KPiA+IE9u
IDExLzI1LzI2IDE0OjMyLCBTaGl2YW5rIEdhcmcgd3JvdGU6DQo+ID4gPiBtcHJvdGVjdCgpIGhh
bmRsZXMgdGhlIFBURXMgb2YgYSBsYXJnZSBmb2xpbyBhcyBvbmUgYmF0Y2gsIGFuZCBtYXJrcyB0
aGUNCj4gPiA+IHdob2xlIGJhdGNoIGRpcnR5IHdpdGggcHRlX21rZGlydHkoKSBpZiBhbnkgb2Yg
aXRzIFBURXMgaXMgZGlydHkuICBPbg0KPiA+ID4geDg2LCBwb3dlcnBjLCByaXNjdiBhbmQgczM5
MCwgcHRlX21rZGlydHkoKSBhbHNvIHNldHMgdGhlIHNvZnQtZGlydHkNCj4gPiA+IGJpdCwgc28g
YWZ0ZXIgY2xlYXJfcmVmcywgbXByb3RlY3QoKSBtYXJrcyB1bndyaXR0ZW4gcGFnZXMgc29mdC1k
aXJ0eS4NCj4gPiA+IFdpdGggNjRLIG1USFAgb24geDg2LTY0LCBhbGwgMjQwIHVud3JpdHRlbiBw
YWdlcyBvZiBhIDFNaUIgcmVnaW9uIGFyZQ0KPiA+ID4gcmVwb3J0ZWQgc29mdC1kaXJ0eTsgd2l0
aCBteSBmaXgsIG5vbmUgYXJlLg0KPiA+IFdoeSBkbyB3ZSBjYXJlPyBKdXN0IG92ZXItaW5kaWNh
dGUgc29mdC1kaXJ0eS4gSXQncyB2YWxpZCwgYW5kIHRoZSB3aG9sZSBmZWF0dXJlDQo+ID4gaXMg
ZnVsbCBvZiBob2xlcyBhbmQgYnVnZ3kgYXMgaGVsbC4NCj4gPiANCj4gRG8gSSB1bmRlcnN0YW5k
IGNvcnJlY3RseSB0aGF0IHRoZXNlIGlzc3VlcyBvbmx5IGFmZmVjdCB0aGUgb2xkIHNvZnQgDQo+
IGRpcnR5IGZlYXR1cmUgYW5kIG5vdCBVRkZEIFdQIGFzeW5jIChVRkZEX0ZFQVRVUkVfV1BfQVNZ
TkMpPyANCj4gT3Zlci1pbmRpY2F0aW5nIHdyaXR0ZW4gcGFnZXMgd2l0aCB0aGUgbmV3ZXIgVUZG
RCBzdXBwb3J0IGlzIG5vdCANCj4gZXhwZWN0ZWQgYW5kIFdpbmUgdXNhZ2Ugb2YgdGhlIGZlYXR1
cmUgcmVxdWlyZXMgdGhhdC4gQnV0IEkgZ3Vlc3MgaXQgaXMgDQo+IG5vdCB3aGF0IGlzIGNvbmNl
cm5lZCBoZXJlPw0KDQpZZXMsIHJpZ2h0LiBUaGlzIG9ubHkgYWZmZWN0IHRoZSBzb2Z0LWRpcnR5
IGJpdCwgYW5kIG5vdCB1ZmZkLXdwIGZlYXR1cmUuDQo=

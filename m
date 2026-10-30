Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360733;
	b=mgPkCjXnXJ+fqmi4Wzyd9f34PrRwz5CvFTRSMGQrbTSxs8MI3b7yTKN7vtHPebdvK/bv
	 DFHxnOvKegNo6oTs0Ah1AmdnxwluX9Yz5gNnZ5Y1mxvZzrYcWv7ZQ3eaQNjRsdDIu+mmQ
	 q7O1mCi0PyhAePKcCkJ5Lx/QDTJ6SA0RvC43nRXz+NMxZ56dZJhUbh9vLnT9bPPVno194
	 gLWGELC3Wnddy0CBP43HfJLdaB3knhASaqmxUOEPZDg28VdPDoL9wpcHLpbc6AD4G9M7i
	 gQr6NpUeSPlEmj2M+ml3hMBa4eWxmUYPZzXhnEv6jxQqvSWpuHXfkB8LR4Kq0DK5Omg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360733;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bjqH0VIGHd3ARZvYWG5jWKNWC08sR/E0SHiBW0UZh5c=;
	b=cllgJnSE6yIhMQT7MKfVXvMr/CxFzseAElAbUHRUpu2IsEP/S4O5ObKqUCB6rxYpbztC
	 5UDlrjrVTFPtu1lCKAAyjRpSDzmu6f4No1fn1MHG5SlMuT29cE4nAsYHb1IiXb9Igffq3
	 QBUBa9xl+0VwUPlx5dYvvf8EjXv4AdqtcLPmISiON5MUpeBeElu247BTJ9h/YLwx5OKAt
	 auiHy3U/OQhlb12Fu29jqHz4+2eJrUV2uBo1zoFMiFy3jA4UACDDy6I/qBy2nTAeMWkGR
	 IlHhEduYl5kk1FXPhZYnQqqu1L1bAo4ANL+tWG/tbgDS612Tto8XJOdK3R2lq7M3nDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=tm16YaeD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.65
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012065.outbound.protection.outlook.com [52.103.14.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B721606A31C;
	Fri, 30 Oct 2026 11:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B721606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=tm16YaeD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0phzJucykHCIobjFRzW9YAYh7UKYcw32Tx+OJlbnIEOclfvbilruIIkrstqcgKfOIq3wReAuODYSVXqRM8fCywlpgjd1Qp1HB8DGcVm5EZQIBB+WrEKGNcYpC0wW+ik1mxx01IbtiXRc+A1wciP0NQ6bo+PyZ8xRQIAjQjlEI3dn5sNz09VaYgdQffZ/ztXlwKBeX89WTLzoJVzi5cY/tsTUM/lHE6U+XgvCdvvKGFImfYExeceqFPHql0kntHdGum+JiA7P25CQlJDCqemNhQe07XOSgyrq0UxuLfyVUd3wNCfJvV2PO6xHAmaJVasIVa5TXDPWPtNr2HQ9dxaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=bjqH0VIGHd3ARZvYWG5jWKNWC08sR/E0SHiBW0UZh5c=;
 b=bmFeU+y2HA/ImnqnEFgVoXzyf8PE42CoMpi+i6iZH4uITyAVs1eDIIfp2NIziBfoy2R2ykP8HKvFyA7w85kVjJ0NlG9O01XCjt7ywPyJRLJ6QyjS3pxJXBfayhNiWboaXCakQoFz11tjpjOI0D1f1kraciKxDnV0LeM307Tq1pHndMgVSeHFgQUUVIUr2HnzeXtXMhfNoBcZ91JmZOReuy3ZTgGPcYnEB6kXRxFBIo+nm/01mubbMj0qT4l/iLYJuAPXCHHJAzwSU/kZ9AlF1ODVhK/juo8vjAzmW7mJsCpx2cNiUU71optPfGxSWEP3tP0OEUF8CmS549Gx0rTiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjqH0VIGHd3ARZvYWG5jWKNWC08sR/E0SHiBW0UZh5c=;
 b=tm16YaeDU+Jh3mEyXwTkKcQd3ePfvPQKJ9JOGfNcaqhcfIcwSCrB456An7zgQFHTjrAt+0g1fUFvJgQAr8kcR8inP15VmZonLVm1ZoEDTLx4gok/rsCszNNbqvCKKmMiXYcWW+xS4Jvt4zMtYIXO2GmdBAirn9ZHuFUDfzrizrPmKC8ORNfDcJ+gM55bzEtUtRFHDstMHXzAYVh6ZOIpZwQ8G4hh0PMBsYX4UViHA/npicWsMnlW8j5lWxDVyG+GZXyXj67/Scj/2vKSx8UD8gPyx4shfoSjQnhA58zEkKw+hDjEyt68MR2aD6geipxjVIbNrYkCEIinVd7Oz2PALg==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by DS0PR05MB9517.namprd05.prod.outlook.com
 (2603:10b6:8:13e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 11:45:31 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 11:45:31 +0000
From: Yingjie Wang <x-professor@outlook.com>
To: Ido Schimmel <idosch@nvidia.com>
CC: David Ahern <dsahern@kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, Shuah Khan <shuah@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net 1/2] ipv4: devinet: update inheritance state only
 after parsed writes
Thread-Topic: [PATCH net 1/2] ipv4: devinet: update inheritance state only
 after parsed writes
Thread-Index: AQHdZ7IPJTb2bcK3N0ysi/DjIlIASrcU8E6AgAEInwA=
Date: Fri, 30 Oct 2026 11:45:30 +0000
Message-ID: <20261030-devinet-withdraw-87473af1c2fc@outlook.com>
References: <cover.1793283257.git.x-professor@outlook.com>
 <2b84b193384fd243fb70d9b0750cdcc9d695a158.1793283257.git.x-professor@outlook.com>
 <20261029195821.GA1467575@shredder>
In-Reply-To: <20261029195821.GA1467575@shredder>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|DS0PR05MB9517:EE_
x-ms-office365-filtering-correlation-id: d1bff259-1c32-4ca6-0e86-08df367b4ce0
x-microsoft-antispam:
 BCL:0;ARA:14566002|38102599003|15080799012|24021099003|51005399006|21061999006|24121999003|22091999003|8060799015|19110799012|31061999003|8062599012|4140399003|25010399006|102099032|3412199025|440099028|26121999007|40105399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y09TbEl0U1g0QTNIaTgwclN3eWt2ZExKK29VOFV0Zm5PazdvY1A0SjdBODds?=
 =?utf-8?B?bU1wNm1QZ2p0WW9KVk5MQU0rdng1SkJaT2ZMUDJSZ3ByV0ZCaTZzNkkvN0U3?=
 =?utf-8?B?TW5LMHFsWE04WnJpQm9KU1JDZ1hSU05oT1FwaUhPamJmeFNydHNYcllESDRY?=
 =?utf-8?B?UWY3SEIxTWRSdWR3ZDRwbXNlY3Vmcko5SVhKT1c5ZGJTYndEK3pQZzc4SlMz?=
 =?utf-8?B?V0VlMEdXWTFabWptVXVTNGM4SmdoU1dRSzQ4ZUZBUFhPOTlaTW1RNjBMcUQr?=
 =?utf-8?B?aTB6dXVsenhhNkdnUkZjTGJqVmtpRjd3K3ZXaVpJRngwWGM5TE1YbkI0L1F6?=
 =?utf-8?B?SW5mL2FkREZwSm9lbUNiWTU3NnRpOGc5YmFUMUFJWnc0UDRmYnc5YTVtUXBq?=
 =?utf-8?B?UU1pRHV1UmNidXhHZE4wMnhEdloxd0VvK3NON1NvR1pULzJMWUlCMDdySVdn?=
 =?utf-8?B?Y3FZdlAyRmtOU0x5dlZpd1Fod0dpcDJKUVJQOTR0ZEZiSEdERXJFbXN2Rmg2?=
 =?utf-8?B?QysycXVhNzgyV2hJWERGdC9DNXBTMjF6dWpxVDVvWDlpc3g1UTNmMWtaVFFl?=
 =?utf-8?B?ajBwclJWWlhFNWF1djA1QVp2NDRMcVZRS29xektRdkZPeCtyY1ZJWXIwUVgy?=
 =?utf-8?B?WVNkbCtTcDBPcDk3NmtHcWFMakNVUGlzdVVLZTlwQTVpcXdJcTV5aS9MYlBE?=
 =?utf-8?B?VkkyQk5wU1hmV0gzNlhDQitRUEgrRlJwdVNPWnAwMkd5dDhLWjgwL0R0ZmF1?=
 =?utf-8?B?dEhpNTRQMG10SDl4REUyWm9oUVV3ZEJKUHpNOTE4ZHZwT2JsdjMrbWk5WUU0?=
 =?utf-8?B?cnNBTExDSm9nT2xOR01ScW8rL09zZmdSTGJwSmtLTnFEWEdQZGxBeXVBcU1B?=
 =?utf-8?B?QkJhMGl1dE04N3I3dXFvL2RUWEpXa2R2Q1VBVlYrVjNkQ3IzY24vSlRORVpG?=
 =?utf-8?B?UzdEWjFycmdlMG9zQW9teFZxR2Vuek1keWZabUtWMmpkSEorMkhZc3ZINVlJ?=
 =?utf-8?B?QWhJOTZvWUZhY1RUaDJlaUFZMjZTL2dNVlZ3QzlET1B0YWZuWjloalkxcTBX?=
 =?utf-8?B?Y3J6UVN6WDJzWEJzbm1sRzFqOHQ4MEZnWjRkL1dHcG45QVhONm9aNFE3UkpM?=
 =?utf-8?B?NzZNS3RzY3J2ZWl4NzBVSTF3NkExN0FURi9laDU2cGt2dFdYc3A1SUU1REQv?=
 =?utf-8?B?ZmRyZVpYYXMwMEdzY0VDeld6NFVWaVZZVmk5dzQ4WFJYVWcvUUJuZ1prdmlB?=
 =?utf-8?B?Y09Weis3WmJaUG01ajhjekJXSnBUWXVFRnJPbS9ZVVowKyt2d0RUZjZRZi81?=
 =?utf-8?B?bEFWbzFyRVo0ZTM5MlM5RHZPSWdPUmZ4b1BOMmczV2p0TnBxTHUwejUvV0g3?=
 =?utf-8?B?WXd4R2FpTFlic0ZwMHFsWU5PYlBodHord3NqL0FQL0lUZ1puZnhpQUFETHpZ?=
 =?utf-8?B?NjQzNFdUVktnNGpkOXNoYWlnaG1laE1Ld0Q3dGl2aFh2cE9pMWVhVFByb2tx?=
 =?utf-8?Q?x3Q30A=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bElsNXd1amRMdzdmeStKTXNWUDV5ci9pTUlkdEhrb0x2NnFNRnlxa2FjWmk3?=
 =?utf-8?B?cDRodGtQcVU3bmFGY2kvWWY5cVZ1YURrejI5Qk5Wb2ZTVkdvUFJUanlNelZZ?=
 =?utf-8?B?UlIzc1c0aXErdWlESHlVWHBsVnBkMGxScFpndElxSlpKcWZZL0IzTVkvMzRT?=
 =?utf-8?B?ZFBheG5TdVZBTnFac2c1RDdHV08ybTFjSFdVbXZzQXNQOVlna2o3Z0EwMGo1?=
 =?utf-8?B?M1BFd2NMSmwwbEhNei9Dc2VGR0ZpV01MazRZVFp0NGVGK0kwMlpQVkY5clpL?=
 =?utf-8?B?RUxUL29IczBGdVJQaGozbzg4VldYdUlJVkhkWnZpMzR4b0YrNDF2cCtKdUJh?=
 =?utf-8?B?WE1SRkZrZ3grQUk1ZXZ6ejkxakVEMjV4VjYrWVlYR1c0N3lHOFlzREdKaG5B?=
 =?utf-8?B?dXRWOVppR0dLQTFNS0JZekR1ZnplUXJJU09kbzU3eUNSRWRJRngraVY1ZExy?=
 =?utf-8?B?OEJXUUlkU3h4ODkrMkQvS3VzQm94MWFoSEZRNW9KYlBjdEpnbCtJSWdnUnM4?=
 =?utf-8?B?RU83QlJRMW03OUEwRmRXcVI3dWdycnQ3RUxCVVk3K0FvRCt2aUp2VSs4YUNk?=
 =?utf-8?B?S1pYMmlPeWlEOGNncEY5Nlo4TjI2bmVCN2tJNGI4ZUNxMlNoWVVCaUY5Qkt5?=
 =?utf-8?B?dDBCcU1UdHN2Sy94Y2NvNExYVGNkVEllY3IycWtSTllLVklDYUtlb01leUxj?=
 =?utf-8?B?cGZvY2c1YVova3dsYm5jaDZtbUFSczlQSnNuVkdibFNkQ29xcFh2V2hacnhz?=
 =?utf-8?B?S2Q3cExJakt0ZW9MWm5LRU1vU0ljNWZxeUtON0k3SGdOODhVR2g1MktjNGVw?=
 =?utf-8?B?Y2xaVTdQVnRJcTJPb0JZWnFvTHJUSmFleVlpQTVzZ3hiMFhLaDlCVzZUUGxG?=
 =?utf-8?B?WXg2MVhFZVQrbURGaGI0QXlFT1J6SFlmZ1hvajhpTDVsbXZ1ZUQwbXhWSjhZ?=
 =?utf-8?B?S2xCQlFhbENBSXY4SFVOTzdSeUorQWxuZVp6MWEzYzQ0NjRqamVFVDQ1RHZp?=
 =?utf-8?B?Tm5wRXlaYVhNY0dNUXk4V1FTMDFEYTFUdWxnWkxtZlpaVS9wbi9iQ2JBeldG?=
 =?utf-8?B?RHhDMUlxb2JIbnQ5U25lSVdSZDBwSk5zYm5sZEZYN1N2QVA5UjVlckJYNW9p?=
 =?utf-8?B?RkVadlU4VTVSTzdHQW9iVmlHRE5uUUpFN0czQ2VzTHk1OTlxc2dVQmIzV2hQ?=
 =?utf-8?B?ODQ0TENoY1daV2wxUXRQV0ZNNXB2S285MjQzRnF4bWQwTGRpNm4xUGJPYmt4?=
 =?utf-8?B?NkZ6UEJOZno5YjJSNlo3ekV6UHpNOWM4Nnl2bnZ2THFHcjAzcFZmSlhlQnZZ?=
 =?utf-8?B?VE9sbGdSMit2RXJlUGFyTTh5SEZUcDladkpoL1htRHdUM2dIbUdnTFdtaDlw?=
 =?utf-8?B?VTZpK0VyRWJtK3B6Q3pwTWFlclgvaUQ1Qm9GTWZ3V2FvWEx6dFl3ZCtteUlM?=
 =?utf-8?B?YWVzc3hKTWpIaEZCSVYxeE1MYkZCSTArekZ3LzdNSGxJamlyVERieTFqNGNl?=
 =?utf-8?B?SG9XdzM3cHBNRDd1dTVKVFJlN0hRRFZnVlBQamdiWnE1N1hvVVdMaGNyMGxG?=
 =?utf-8?B?b01pSTlLZkYvK2JDbXdFZnZjMEVNK0MxWXozQmpkR3VFS21kOXNiT3JxZU5k?=
 =?utf-8?B?MTkrZ2M4ZXVUdzFhQkJ3VWFueENjWlgybTN4YUtKYUJNbVJ2b1FiVGp4SkNx?=
 =?utf-8?B?K2hkZUljSHd2KzE0RmpVOEJSanB5RlFRSEZ1UVgrMEkrOGZ2V1pXc003SXp3?=
 =?utf-8?B?VkRkSmdQTzRSVExQKzBRa0NoRkNsZng1RUY3Mk51bS9PZGRKZDZ2K1N0djFY?=
 =?utf-8?B?VEJScVAweUQ3b1VPQjZNN2F4N2k1MmNKOEhKby93aVlGdm9lV3FtWWRvTEt1?=
 =?utf-8?Q?rMnCcpTaqyJY4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EE00A56256CE14F8B9C28812BF054D9@namprd05.prod.outlook.com>
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
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR05MB10385.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bff259-1c32-4ca6-0e86-08df367b4ce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 11:45:30.8478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR05MB9517

SGkgSWRvLAoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgpJIGRvbid0IGhhdmUgYSBwcm9kdWN0
aW9uIHJlcG9ydCBvciBhIGtub3duIHVzZXJzcGFjZSBwcm9ncmFtIHRoYXQKdHJpZ2dlcnMgdGhp
cyBzZXF1ZW5jZS4gSSBmb3VuZCB0aGUgaXNzdWUgd2hpbGUgdGVzdGluZyBzeXNjdGwgd3JpdGUK
ZXJyb3IgcGF0aHMuCgpUaGUgcmVwcm9kdWNlciBzaG93cyB0aGF0IGEgZmFpbGVkIHBlci1kZXZp
Y2Ugd3JpdGUgbWFya3MgdGhlIHNldHRpbmcKYXMgZXhwbGljaXRseSBjb25maWd1cmVkLCBwcmV2
ZW50aW5nIGEgc3Vic2VxdWVudCBjb25mL2RlZmF1bHQgdXBkYXRlCmZyb20gcHJvcGFnYXRpbmcg
dG8gdGhhdCBpbnRlcmZhY2UuIEkgaGF2ZW4ndCBlc3RhYmxpc2hlZCBhIHJlYWwtd29ybGQKdXNl
IGNhc2Ugd2hlcmUgdGhpcyBtYXR0ZXJzLgoKR2l2ZW4gdGhhdCwgSSdsbCB3aXRoZHJhdyB0aGUg
c2VyaWVzLgoKVGhhbmtzLApZaW5namllCgpwdy1ib3Q6IHJlamVjdGVkCg==

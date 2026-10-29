Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284237;
	b=XaQTm53MjvY41pYAh4eGbvLwpGbjgKVVTb3zm4Ath2R4ifSGu4vGNAYs7Laxy8I7aQz6
	 M/w2mLmMCT6jMdYDyFyEFnqX3bc1MB7SwqaePU/Ok4sXoZlTRwBok0fJ9Iao2PiWKgbwG
	 siltlQjptWAc84ieAcpAtEVthORBfiZwuIl1aotP9KFmvFjhmGL0oM8nNMb5zOy9EnCVt
	 /WRxNeMHjJvVQqcbq0PECOtC0auKOEbHXDUzp6it1mG5CIhb/QTwf8Of8TknhZpw3E3Bf
	 kw3lOD4hcSosy5mHGEpgfqxfGnt+oO/xl2TQ6rkCfzjQWqkOBWF2udPwQ4eiuO/23UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284237;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Wl1Z4ugsOjmWZm/tCDc0sO2IPvk0SBJocTsqIFKicuY=;
	b=2f3U3fv4gh4DiRVceya0yAH0Ke4GO0OyBrp/nr9Ugy7tWn1i6C3SZ8s+Pi+/dV5KESES
	 siJiP10ae1Pu7gTaxZ0pNDRVF49aY1Ry01v3ga5SwbGdVA6+dR/uUvEDqf6wczgj0dga8
	 Cys/gAJuRmX22OY4iiJ42/RhpGnzBarMtmqtRSx00QIGZbZrG6XoRo6nlyg/7cJHKetXp
	 pn9XOg3oZ/t84iXIMiQrqhu9FUSa9p1MAJdXVVuMhTVND4w6ywMpCA6nEiIdjDo8EORaF
	 bgcw/n+6MrVEjUQCwIacYoWWZ1qXwi7p2DN171XZO6U6V6MdFYOnvuI+NtbXLcEsCzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=LbFe02Ee;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.32
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011032.outbound.protection.outlook.com [52.103.12.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8503606A31F;
	Thu, 29 Oct 2026 14:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8503606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=LbFe02Ee
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbw1kHLsA9r4z8o8/5w/x9LIOWDVIlMxUGumIcnMqKsZ9Bxt5KipZwmCrvXIqH6bAHwJwIrZOaEJs/0i2Gvlxcob17zlQn222UcqkNILpa4m5wACmt5Xi5z4gt7TBx2XMyDWoF8uM3MHZRWHscWwbP/dKqSvqZrQSyjTRCj2dVyvtF3w9puSl6vOIh1W8GEMAj3ZZapsNdF5P1NtsOEAWjwbFf3dY0Nx4oNpjhQX6tJdYcZjOMVWPJHJy1w86yQD0en6v+XkzNMupI7HLYUMgpxudqcNPBwFoVyLOzJpFyUdxfRBYwxRVpZWGvDhlSEwLCB8DHxb/3GuyaeorvuF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=Wl1Z4ugsOjmWZm/tCDc0sO2IPvk0SBJocTsqIFKicuY=;
 b=pEXOS6A4iTiRY7DXNmJKYmVoOoWg1tW6jzQh0jIgnxrApUdXPbP5hc0uRc5L3BbZvg3MiC0/wzR3uVV54QInrqtfgALXE74WxV4GGDxT8nvL5PMO9wvo7Q/fsdSmCzydOFa9iFemuuL4YpxgIxEjtGd0GU20CS6JQPV4Bb8kFZ2tsd4Fp8eO2VuuIIfmezEkW/ldKvNGkKx1OO5noVAKWtz4rld1g5lrp3+BYNCwvCwoJERsyRS+IsEcsOvvVaeLxGeEJlaJJIY4A8/u607nK84tk4qofeBnA3fBQMUfs3vi6POlxa0H0+OoROS3b48rve+6lBqGt8FNq4MJUiJBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wl1Z4ugsOjmWZm/tCDc0sO2IPvk0SBJocTsqIFKicuY=;
 b=LbFe02Eeoqkx6+JMA6soyyTKNntThexfPti7ZeXxeEPNc78Vu7H4GTIbttctSIg9R8T71mbeX5vJeHzDJrKcFYh8xaBIlQcuHVBPlew68OsGA4qkGa+7wzPnVjimV5vkAwI6eZ+ZzxM64VvxaqDe8Vk1NwwRvWTcp3xb89xQaNUKCWgU2DaZfqfVO4P4vNPTVNPL5/6O0w1Jkf/8OqOKth6bSi0IRdY881Qo2A0QeKSG0h1f1rE/rBuPLaN+LMVboHHvKg+kavyfpBfJ/sVXIsnYCKTO0N8Xdl9gB3o0tmaOgTd2JhcarZO5nKXkT/KZCKBqeWo90zZ6j2PtZx5Faw==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by DS6PR05MB587169.namprd05.prod.outlook.com
 (2603:10b6:8:52a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 14:30:35 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 14:30:35 +0000
From: Yingjie Wang <x-professor@outlook.com>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
CC: Yingjie Wang <x-professor@outlook.com>, "dsahern@kernel.org"
	<dsahern@kernel.org>, "idosch@nvidia.com" <idosch@nvidia.com>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@kernel.org"
	<edumazet@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "horms@kernel.org"
	<horms@kernel.org>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "shuah@kernel.org" <shuah@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH net 1/2] ipv4: devinet: update inheritance state only after
 parsed writes
Thread-Topic: [PATCH net 1/2] ipv4: devinet: update inheritance state only
 after parsed writes
Thread-Index: AQHdZ7IPJTb2bcK3N0ysi/DjIlIASg==
Date: Thu, 29 Oct 2026 14:30:35 +0000
Message-ID:
 <2b84b193384fd243fb70d9b0750cdcc9d695a158.1793283257.git.x-professor@outlook.com>
References: <cover.1793283257.git.x-professor@outlook.com>
In-Reply-To: <cover.1793283257.git.x-professor@outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|DS6PR05MB587169:EE_
x-ms-office365-filtering-correlation-id: f24df749-339f-47ba-b31e-08df35c93242
x-ms-exchange-slblob-mailprops:
 AZnQBsB9XmrTkIzDOCxR6E7nJ4I/6XZ7lI02pRhL3EFuWE34seQvH8C9aICvmh90EE09srN7rHu7f1mA1sGS9TfeMiYNOFLykKg3mV5k2PMGcCXW38x+OIn+j2RVnyAt+CSboiyGAhRDwO0AfMIqbRORu1QGcA8jYE2nG/MYKUuqmr9OR5N/LHKf4+4wONgJDZBRFfWlNa687TVOjA4oYcHe3GWH84R4nBQw2Rbp3o7uHKoog42vks3GBmDDLmOpYKBU/v8wt66YWwiFlptuge3RPpNH1lxcjJnkDN8xgs9DZynyamZFsO9pjsSEQMbHXBJ8mXDKcDPSAPdKmBD7Mx7Ier80axWbwMVB8qN7SzR7ZunffxQ/VRhXIOJCWC3utCWEJw3M/Bp1W688mRb3Px+VY6Z3yTR3OOgMnkuhgDi+nRiuNGsKoroL79kUZapx06gLz5Um4pZp+4/5LboXgm++L/szlgfe0jQLjYvFReeCCGnOGA+cg1FV9Wax6ahALhD8AH7YNbKGcjCScZwe4Tj/XuvkpwWo11OLoIJkmL83zV3W9F9M8Mo9RwQ+CUgU94mKeMXjca1JeLMw7dv+TYW+2VUPg7tDDJuHu/BOAhRg9HbatkSZw2TKHvHcw/7KSWKe76rOg1Dm/9IoMibL9Ef2+IGvHGgg/xWwwZTeNeclKBuM8sLHPCMUyQEDeusfLhlhMngMVTQPUEMHa5qM7sybotdUfx6YcRrlG4+9Jp68ezh0c7VHmPK+CgWQIB4FyKUs7QWZhk4=
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|19110799012|25010399006|4140399003|24121999003|8062599012|22091999003|8060799015|38102599003|21061999006|41001999006|2604032031799003|31061999003|24021099003|51005399006|26121999007|40105399003|30101999006|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?Qm4yNlBlV2RGaVArVEJ5WGNhMXBXVEkvNFQyRjk2WUxDKzUyUC9Md0pvRHFj?=
 =?utf-8?B?NXl4Wi9TeXpFNys2UDMreUt2WHliSVh5d2RuT0hmV3U5enZHM1ZsRW56WTl6?=
 =?utf-8?B?YlhJdko1dXZ5MG5GaEV0Y2tGUjNRSUlqMW0vSHpLVytYc3B3ekcwRW9uRjAw?=
 =?utf-8?B?NDlyYTh1NmhEMHJrNDgxbEp5RlBrM2NjU3QwWXNzdjR3dTBOc2FFMFpoZTdo?=
 =?utf-8?B?ekQxbmdlUFg4YktOR0IvbVVUTGs5NEZPMU1WZTRRWWgvcFNHZW9BazNSV2lF?=
 =?utf-8?B?bVJGelhEOXVSYTFZRW1zdkNLUmNLVGdpandnaEpoaUNoTFl1KzliVmttNmp3?=
 =?utf-8?B?KzNJalJwamxDajlnWjlpYzlGYW05OVROM1k2ekFVT3krVUw1bHpValN2YllP?=
 =?utf-8?B?TEV6UFpMNGFnZWl0bWlDcCtwRVRIS0I2M3BmTUhRQ1pndEU1NzlhKzZYRnhr?=
 =?utf-8?B?RU42S3NUVjZxUHdueGRaQW1jZG5EdUpTekh2MG90dU9qSFM0RWdOZmhBM25J?=
 =?utf-8?B?MXRVZDJVTmFQWmpLOXJFUmg2Kzh2Yk1hVUZ1ekFCSDNJOWlmV0JNWnQ0QytQ?=
 =?utf-8?B?SmtGUFJCMDhVQ3NqTGlKWHFHTGF3dGZycHRWbXJoN3ZCN0pEVmlNTmdVa0h2?=
 =?utf-8?B?dStQRDQ0ZlNJUlBQZVFpMmFnMjUwSThjRnpIYzRGTDFzaUYwUkV4Z1ZtTzhP?=
 =?utf-8?B?b2xDdk1FQncrSjFDcC9qWmdvK1Y5QkFEVzAxNi80WkNFZjBLU29WV3hlRzFz?=
 =?utf-8?B?Q3VDT0hKV3RzTEhWN1QzVHlVZUtiT051T2RhNjEyV1pWeDFjSHJ2WU1CUTdY?=
 =?utf-8?B?Z1BHeW1QYkhtS0xnYVd6L01QSDgvL0RQdk44YXZNV3FmbUg3TVdneFIxaFVk?=
 =?utf-8?B?RGlkd0ZqTDVueit1eERlazBJMG1mSzJPZ1hsZXFteWhOdm9vRWtNb0ZpRFFp?=
 =?utf-8?B?eklrdnRSZXJ3N2JHVEkzaGlHWEYrejFoZWRoWHREaGdtc29pNU1PTDVnZG5L?=
 =?utf-8?B?TmxJbXRhdnAxa043akpMRFJYUEhwbjZHVVVjN2VWSU9PRmFJcjM5UGkzMERn?=
 =?utf-8?B?dUlvVDNoL0JFSWNYZHJlSlB3UEtnWUxEbWhsaUZRclk2TFlnUkQ3SGdWdmQ1?=
 =?utf-8?B?RUdhbUIxS2JsQXdrVjUvaExxaXQ5MmJQd2JtZEdybUFndDhEUWZoTXZnNzZG?=
 =?utf-8?B?NlpGa1lhTldMenV6V1pBU0xzM0QyUWgzd0JaV3ZUL3NnM210NkpxQkVnV0pT?=
 =?utf-8?B?Yi9nazFndSs1bE5CYitCc1VMVCsxWWJySDhyR2JqMXVHYkpJN3BCYW9LRjdJ?=
 =?utf-8?B?M0tpY1Y1YVZwSGtyS0xqU3dlVXJVa0UvQVFJYklFVS9IaGpubmRvTHkycHZD?=
 =?utf-8?B?VkdkZ1F6ZDlraTdMOHA1dEw0ZTFKUldLczM4aWYvZENCWjRyNWtKMlI3S1FP?=
 =?utf-8?B?L2dlUFVxQnByMlVPRUFGMXN6UXE2NlFsbG9iUENtc1NFUzIyWElCTHdORTRQ?=
 =?utf-8?B?SU5NcjJrczBvR1JJY0taejZMWUh3RlRhZk1BT3FEdlhRMmdzcG5pblpHYVpH?=
 =?utf-8?B?UjBiMjRvdS9sNXNxaDlaV0MvZWRUc2NGaXBpaDVHRFpiV2FmUDVpRnhmTmxV?=
 =?utf-8?Q?c9TR+xrOeC/iqr82VoeM19vr67u1OZwimg2jqAulzWgA=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVBScnZlNW5naXVJei9zYUVaTDczelMwTjM4WVFSVC9EblZHRUtqUjB6T3pu?=
 =?utf-8?B?UFk0SlFPTWFtQXRmbFpiV0FRSjJtOFRlQTQvVUR1YnZVOFgvL1hGZFMyOTVQ?=
 =?utf-8?B?NTY4S1FXUVgzeStTN25lcVM0T3pHdUhIR3ZtZHJYL1RuVFZQcnNpcHJDcUow?=
 =?utf-8?B?Z3R0MkxIdG4wcXBmTEI4eUFZUXBreWFnUXRJcjhqNklBU1FtRVBCYmxxUHVQ?=
 =?utf-8?B?bXBpbkJKUW1xdVJHVnAwckpYN1R6TkJ0VEIvTEJWeUZ3Q2lFb3dxKzBUZHQ2?=
 =?utf-8?B?Z1dVdTNPTE5ZRi80ektLZG40bGNwaXdWTVA0Rjg2NzZydzNGdkNYSDFtemcx?=
 =?utf-8?B?Mnp2SFQyN0N4OU1CemhKdlFHYTdDeHZVZjVNQTJxbi9XSUtYRFFpdnZyR3c3?=
 =?utf-8?B?TlZIQnNLaEVaWVdRd092Q21QSzVFMFBNRkNmbWxhNWJON24ySkdySzlYaWJp?=
 =?utf-8?B?c2M3QktyemRpVVFIQUVVVnJ3NmRrLzd1VDBUcHRXUE9CdWRTZUJzQTI2TTZl?=
 =?utf-8?B?NDBhbFlxayt0NEJUR1FkbkJ0K0VOa0lCMnBTLy9IeC9TWjF3Y0NBT0MrYktB?=
 =?utf-8?B?OWJCSXRqWlhVdXNMZC9BenM0alNXWjZCVTNFa255R3dGWXRIVnR2di9XMEF3?=
 =?utf-8?B?TEtlcUtlQnVCeThXNDdkWHI4ajVweXJvRVhNbnFZUGxIY29QSUtQb2ZCQklX?=
 =?utf-8?B?dUtoaHk4YnNDMlR0aXMxaHVGc0VxWUhxQlJMVU5PVzd5VEV5c0dTekF3bFZt?=
 =?utf-8?B?ZUlIelpDK0gvQTJZcW1EL1FZekVQRW9zek9sVmF3d2dsZEJtWEdIUXYzSklO?=
 =?utf-8?B?WkdoVUp1OTFxWG96Vm5vcnNnbXB4YUZTRWdQN2VKWFY0cm1IVldjMllUeGZO?=
 =?utf-8?B?dG9tV2tvaGZJYkQ0NzlnRE9sQnduQUc1enhKMGg1bXNrWEJ2Q0d6VVlQU0g5?=
 =?utf-8?B?Qk5mSW56RlFwdW1pRXBZOTVjTVZmNUlCUHpKSHQ4dXllR0tCbnpUSDg5c2g5?=
 =?utf-8?B?NFJLcjRHNHlkVXJKVjl1TU1QaHlhVzZBRHRmNHZmK29wU2Y2MTBpd2V2ekts?=
 =?utf-8?B?NGFRNjlsZXJTYm02WGNZM2JYMytMQk13VnFuZEc1bkJHRU1uRmJYdVNyOGRI?=
 =?utf-8?B?N2pLcjh0RFMwdFY5alh0bC80VmxHTGpQZXcrNTlTamNZRmN4bVVvNWllcjJT?=
 =?utf-8?B?RitzS2RXb0RJY3k4RUVFcUREbnJGTUkxV0lkdzJqSXdqSFpUYW1CU0lXMU9Q?=
 =?utf-8?B?T0pLMWlrWmw2c25nRzVGR1VUaVNHRVdzUEdIcWRNMlVoUFlPeUJPWHJtU0NE?=
 =?utf-8?B?MWJBeVRkYWd0b1RKTGt3L1NWMWJoMDNEeUY0RFZXajRBMzFoclI0a0VUUmVr?=
 =?utf-8?B?TWgxaStNZldwM1Q5RmprbkVtNVo3Y2RVUVNJNlJIdGljRVVuZXR1OGdXWjZo?=
 =?utf-8?B?eWpKZ0tITmxGQmhHRFZQcTRQdFR6NEU3LzhaU0gwYWkvQ1M3TExUS3g3QU5X?=
 =?utf-8?B?MEhNQmdpNEwxMUxoVXZIb0VZcEVQdlA3bG1Wc2QyUXhhVzB2Rkx4Uk1qUmJU?=
 =?utf-8?B?dXo4OTZrTVBHS0dHMUlIaUFNbll6TzZjOHY2cXhkQVI5T2tkZytmYmJxTldV?=
 =?utf-8?B?K0NKVlcvRlFMUWNERGo2N1l6QVpRT1k0UmZYREROT2JFSHNlamxNT0NWT1E3?=
 =?utf-8?B?dEsydEE0b3ViQWovNVhqdlU2YTdva0d0bWdVdENDekt4eDBXL29FeXNUU1BX?=
 =?utf-8?B?R0N5cENVNVFFa0s0bWFVeXpLYUVDZlFnUnpkTmpWSjNSeXBteGE4SGpsR2Vm?=
 =?utf-8?B?N0ppWUFGbmFYMkkxdE9qZjVzTGE3WFhxTm1kTm45czRMdnhFd1l3WXdXcjl1?=
 =?utf-8?Q?78Qi6x+T4pcPl?=
Content-Type: text/plain; charset="utf-8"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f24df749-339f-47ba-b31e-08df35c93242
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 14:30:35.7624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR05MB587169

ZGV2aW5ldF9jb25mX3Byb2MoKSBtYXJrcyB0cmFja2VkIHBlci1kZXZpY2UgSVB2NCBzZXR0aW5n
cyBhcyBleHBsaWNpdGx5CmNvbmZpZ3VyZWQgYWZ0ZXIgZXZlcnkgd3JpdGUgYXR0ZW1wdC4gQSBy
ZWplY3RlZCBpbnRlZ2VyIGxlYXZlcyB0aGUgdmFsdWUKdW5jaGFuZ2VkIGJ1dCBzZXRzIGl0cyBz
dGF0ZSBiaXQsIHNvIGEgbGF0ZXIgdXBkYXRlIHRvIGNvbmYvZGVmYXVsdCBza2lwcwp0aGUgZGV2
aWNlLgoKWmVyby1sZW5ndGggd3JpdGVzIGFuZCB3cml0ZXMgaWdub3JlZCBiZWNhdXNlIHRoZWly
IGZpbGUgcG9zaXRpb24gaXMKbm9uemVybyBpbiBzdHJpY3Qgc3lzY3RsIG1vZGUgaGF2ZSB0aGUg
c2FtZSBlZmZlY3QuIHByb2NfZG9pbnR2ZWMoKQpyZXR1cm5zIHN1Y2Nlc3MgZm9yIGJvdGggd2l0
aG91dCBwYXJzaW5nIGEgdmFsdWUuCgpVc2UgcHJvY19kb2ludHZlY19jb252KCkgd2l0aCBhIGNv
bnZlcnRlciB0aGF0IHJlY29yZHMgc3VjY2Vzc2Z1bCBpbnRlZ2VyCmNvbnZlcnNpb24uIFVwZGF0
ZSBpbmhlcml0YW5jZSBzdGF0ZSBhbmQgcnVuIHBvc3Qtc2V0IGhhbmRsaW5nIG9ubHkgYWZ0ZXIK
Ym90aCBwYXJzaW5nIGFuZCBjb252ZXJzaW9uIHN1Y2NlZWQuIFRoZSBjb252ZXJ0ZXIgdXNlcyB0
aGUgc2FtZSBpbnRlZ2VyCmhlbHBlcnMgYXMgcHJvY19kb2ludHZlYygpLCBhbmQgdmFsaWQgc2Ft
ZS12YWx1ZSB3cml0ZXMgY29udGludWUgdG8gbWFyayBhCnNldHRpbmcgYXMgZXhwbGljaXQuCgpU
aGUgaXNzdWUgd2FzIHJlcHJvZHVjZWQgd2l0aCBvcmRpbmFyeSBzeXNjdGwgd3JpdGVzIGluIGZy
ZXNoIG5ldHdvcmsKbmFtZXNwYWNlcywgd2l0aG91dCBrZXJuZWwgbW9kaWZpY2F0aW9uIG9yIGVy
cm9yIGluamVjdGlvbi4gT24gdGhlIGJhc2UKa2VybmVsLCBsby9hcnBfaWdub3JlIHJlbWFpbmVk
IDAgYWZ0ZXIgZGVmYXVsdC9hcnBfaWdub3JlIHdhcyBzZXQgdG8gMQpmb2xsb3dpbmcgaW52YWxp
ZCwgYmxhbmssIHplcm8tYnl0ZSwgb3Igc3RyaWN0IG5vbnplcm8tb2Zmc2V0IHdyaXRlcy4gV2l0
aAp0aGlzIGNoYW5nZSBpdCBpbmhlcml0ZWQgMSBpbiBhbGwgZm91ciBjYXNlcywgd2hpbGUgdmFs
aWQgc2FtZS12YWx1ZSBhbmQKY2hhbmdlZC12YWx1ZSB3cml0ZXMgcmV0YWluZWQgMCBhbmQgMi4K
CkZpeGVzOiAzMWJlMzA4NTQxZTkgKCJbSVBWNF06IEFkZCBkZWZhdWx0IGNvbmZpZyBzdXBwb3J0
IGFmdGVyIGluZXRkZXZfaW5pdCIpClNpZ25lZC1vZmYtYnk6IFlpbmdqaWUgV2FuZyA8eC1wcm9m
ZXNzb3JAb3V0bG9vay5jb20+Ci0tLQogbmV0L2lwdjQvZGV2aW5ldC5jIHwgMjkgKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL25ldC9pcHY0L2RldmluZXQuYyBiL25ldC9pcHY0
L2RldmluZXQuYwppbmRleCAxZTlkOTg4ODQ5YzllLi5lMTdjODJmY2RlZmVkIDEwMDY0NAotLS0g
YS9uZXQvaXB2NC9kZXZpbmV0LmMKKysrIGIvbmV0L2lwdjQvZGV2aW5ldC5jCkBAIC0yNTU1LDE0
ICsyNTU1LDM3IEBAIHN0YXRpYyBpbnQgZGV2aW5ldF9jb25mX2lmaW5kZXgoc3RydWN0IG5ldCAq
bmV0LCBzdHJ1Y3QgaXB2NF9kZXZjb25mICpjbmYpCiAJfQogfQogCitzdGF0aWMgaW50IGRldmlu
ZXRfY29uZl9pbnRfY29udihib29sICpuZWdwLCB1bnNpZ25lZCBsb25nICp1X3B0ciwgaW50ICpr
X3B0ciwKKwkJCQkgaW50IGRpciwgY29uc3Qgc3RydWN0IGN0bF90YWJsZSAqY3RsKQoreworCWlu
dCByZXQ7CisKKwlpZiAoZGlyKQorCQlyZXQgPSBwcm9jX2ludF91MmtfY29udl91b3AodV9wdHIs
IGtfcHRyLCBuZWdwLCBOVUxMKTsKKwllbHNlCisJCXJldCA9IHByb2NfaW50X2sydV9jb252X2tv
cCh1X3B0ciwga19wdHIsIG5lZ3AsIE5VTEwpOworCisJaWYgKCFyZXQgJiYgZGlyKQorCQkqKGJv
b2wgKiljdGwtPmV4dHJhMSA9IHRydWU7CisKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMgaW50
IGRldmluZXRfY29uZl9wcm9jKGNvbnN0IHN0cnVjdCBjdGxfdGFibGUgKmN0bCwgaW50IHdyaXRl
LAogCQkJICAgICB2b2lkICpidWZmZXIsIHNpemVfdCAqbGVucCwgbG9mZl90ICpwcG9zKQogewog
CWludCBvbGRfdmFsdWUgPSAqKGludCAqKWN0bC0+ZGF0YTsKLQlpbnQgcmV0ID0gcHJvY19kb2lu
dHZlYyhjdGwsIHdyaXRlLCBidWZmZXIsIGxlbnAsIHBwb3MpOwotCWludCBuZXdfdmFsdWUgPSAq
KGludCAqKWN0bC0+ZGF0YTsKKwlzdHJ1Y3QgY3RsX3RhYmxlIHRtcCA9ICpjdGw7CisJYm9vbCBw
YXJzZWQgPSBmYWxzZTsKKwlpbnQgcmV0LCBuZXdfdmFsdWU7CisKKwkvKiBBbiBpZ25vcmVkIHdy
aXRlIHJldHVybnMgc3VjY2VzcyB3aXRob3V0IGNhbGxpbmcgdGhlIGNvbnZlcnRlci4gKi8KKwl0
bXAuZXh0cmExID0gJnBhcnNlZDsKKwlyZXQgPSBwcm9jX2RvaW50dmVjX2NvbnYoJnRtcCwgd3Jp
dGUsIGJ1ZmZlciwgbGVucCwgcHBvcywKKwkJCQkgZGV2aW5ldF9jb25mX2ludF9jb252KTsKKwlu
ZXdfdmFsdWUgPSAqKGludCAqKWN0bC0+ZGF0YTsKIAotCWlmICh3cml0ZSkgeworCWlmICh3cml0
ZSAmJiAhcmV0ICYmIHBhcnNlZCkgewogCQlzdHJ1Y3QgaXB2NF9kZXZjb25mICpjbmYgPSBjdGwt
PmV4dHJhMTsKIAkJaW50IGkgPSAoaW50ICopY3RsLT5kYXRhIC0gY25mLT5kYXRhOwogCQlzdHJ1
Y3QgbmV0ICpuZXQgPSBjdGwtPmV4dHJhMjsKLS0gCjIuNDMuMAoK

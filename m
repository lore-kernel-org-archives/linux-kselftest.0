Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284239;
	b=Se5TWVm08zxbjO1z+sQFGzYiQiZpvJLMvZjHQUfUuhtKYN84bSei/9F4YKxP3s2yH6xu
	 hHoBl+SWxjBbvbAnmTHCsUuI+KMqJYV1iEc8RJs5PiErbP+BvF+aw/wq5+BWnvhoZGdEL
	 goWJ26UlhKuy4p50GwscqE4G1uQe0QpF5uq9D0Iyy8e09wBsspIu685U6f/E44d2ZOh4Q
	 mS9U+vhffaMu/2e9dwlLci0knHzVnGwKZkwpZVlen5/BzBTFVSRR/7eLsuSUvE+efyd42
	 pjWTutgf0AL63SNKMOGKce52LHvBamaqf+kBPbZ4Cxtsl1mnA5AONpukFGcjRuaQHdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284239;
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
	bh=ksSUiHUBUyAkBeaYGmRziZ1TbhDblLgFclZNMewhPfU=;
	b=HVkhpJoD4jOKsMlTUuTak6yw/AMnFKQ3q3MrXvF8u4bCXQxaWoePOn7Oi0iUnu+EfuWV
	 dQrcGydep7oExQBaMrgfoZefv1FxHxGHkScJx4NenAD6mUKKKEqiy0qiuS9eGwP1UgHbC
	 cOa4TxxA/h7LExY/A0gtDp6/2bra6C3PEjG5CKB4wDHmJtuLGzA/+IahtrP1PY5laHwhx
	 O5Ac5QDcSugWMK/GUUzJneuO7873cIR8/SLCy0gEKuu51XHFoh8Fl4L7eBD64yo53FM2t
	 ABfxd7qUNgrOw+AMRkDOwH+E+vazDo1EXL6pASbf6ER9bwq/XBPJFv4OmFu+mx6Qyhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=STcpETY3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.80
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19011080.outbound.protection.outlook.com [52.103.23.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFBA606A331;
	Thu, 29 Oct 2026 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFFBA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=STcpETY3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ug2I0P9geugv70iiqaBv0hTiq1Jdl7tLSxUCxDb0pWjBT7TT+MYAMkFUmjbWqniqrj4ZXaeUnoSSC8bDxXAldzT9FkMaHbneK7fCiiFqgSNAwTwmKDMXuI5iYO9LgSxJ8rTuPqmqoutofjrHVb3/DT1DdmiI/wcPhk50yygioy7ksVp5zJA7DOjj++jUGAwKh0xwgbqbwXS1MFFQtTjW+8CFuhUAqHqmm8DC7ptmnBfbkG8QumYPPDn7G5jm8vVc1CijV0zAFNqbSFABOoYjIKCBj9d/Wg6tKnUD25kI7pj7mRuHlQ2TxkhvikBOfyOGb3w80s2qHMJMYXP4jZyk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=ksSUiHUBUyAkBeaYGmRziZ1TbhDblLgFclZNMewhPfU=;
 b=HeRmxgyOsxerhq7qUDrJMoqWMKVPR8hrjxc1OMWadU9zhQKGUzxeL2ArEFw2gouw3WcycPIPxuQ1ubM813RaJBqnp2Bz/fsBXCT4IZ44Ut0bHeO0NoWj12nyJDlMo+ieuCQ6Coy6KE/59EwzJwwaeVMRFJY0IaeZRadwoQ7R+VtZX6IlykXs2HQrANHTzYx0aUV2rE/zu6jhgdI6IriXlFAe3FzT3X+abieSFtjZb3VFm7goRqRfG92eKmY/ZsRQk4scsCuOAqLukvte7DrPelzZIwFfhuLfPQCqp6RkdnEzNTW6hn0PtoSYk7Lg67qsrg120giHyUR8YD+UzOtIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksSUiHUBUyAkBeaYGmRziZ1TbhDblLgFclZNMewhPfU=;
 b=STcpETY3GBDnI/S0UZOt6tGi4CrVPSMql3kc+mFB4qwhoJx1Fwtf9Kw0x9eBsN5PiAIHmVw4MRtpSiByZ2NKFY5Rjizqk1l2azOp2zfqcr3PXshvmE8XDXIdI2M/UOxD0IrUAE6N3Eby4j5BDekVoAo2maM2cfXVoCVTZmH7S9NcQEmO9cHu57H06Y6n58o74f3m+xyJPbptG2ZaWAu3M9DJdENJ1PcmLKX4m18xj+Z6GH0J6gouZ1r6I36PynrAcveaDyNaYN6msOtvgqL6y06xDikV+Y9C6JC/ndRMPLaweUzF609w2J8Ba9Nkziw4U+wCSgg0G36mE6i4PdvVww==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by DS6PR05MB587169.namprd05.prod.outlook.com
 (2603:10b6:8:52a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 14:30:37 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 14:30:37 +0000
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
Subject: [PATCH net 2/2] selftests: net: test devinet inheritance after failed
 writes
Thread-Topic: [PATCH net 2/2] selftests: net: test devinet inheritance after
 failed writes
Thread-Index: AQHdZ7IQM5hkZnvbZkuXubWIsrhCLw==
Date: Thu, 29 Oct 2026 14:30:37 +0000
Message-ID:
 <8910b7d6fd3f4ed7e7bddd746e759d660d05f1c0.1793283257.git.x-professor@outlook.com>
References: <cover.1793283257.git.x-professor@outlook.com>
In-Reply-To: <cover.1793283257.git.x-professor@outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|DS6PR05MB587169:EE_
x-ms-office365-filtering-correlation-id: cc0f633d-67c7-4a65-3efd-08df35c93312
x-ms-exchange-slblob-mailprops:
 AZnQBsB9XmrTkIzDOCxR6E7nJ4I/6XZ7NVNRpSO/y9f1YL2JwufqTArobvKE9AP6MObIn3RJyEF8wUO84VZZ/6UaBAqjMf0lUskIRgbVR8dLzH3vQ4ztKS7ZBX4brYKPehk/DjV6c9jZy/IJgqRQ0x+wPO0CWlmGhFatrZ/JcOt/bQuMMG1vznLZHFllJavUK6wqxpztnNCsSuzNoSp+SQ4uwwkapje6vxQ7Us5V9oRp1Mt4ERTUX0UVLJ2kk9YUFhyBvZmpP7T37BhgwgdsBViy1OU7UpZr6KpYLIzWcxVhjh4xMDlfq8TAR+OkN0rI05gjbMzc15Ku6g8WajMtHqIaOaE1Lz/x6B2qAA/3RPsM7LCgl5iOMjA8PLGl7HTL4Y+2m1uVWNbo9J1c0lgIr7FJ+aHdVovbHiqpusfkLrbnSVKPW+yTMwoEKxb9HBCnqs22eJdmewmViQ1ZRkuAGMsA+2iu22qG6FPes+O4kgJg4y47cNpqR/DLtil/R4Srwes6OI29TlZD1JgsrBZWd0rUXpbAF44/JIuhT0zUaUFXDcEmQ8AvESbhkaRly097mNrRyUhjaXpVcRjlew5CzZPavM2z1pDnphR+qgtYmEBH6Uv6R1xf6iDSt2qJruK45v9DAULdlnw2FDfsYfJrplmkgk7vfLvl7j0HedFt96mApnyokije8lwC2EJbIlwgRD5240ilW2MqHzieoAnW+9EuV06u4BFrxUBS5gdQEcfF97OuCTvY3IRQKoxSQuoJ7n4DkqxpMdE=
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|19110799012|12121999013|25010399006|4140399003|24121999003|8062599012|22091999003|8060799015|38102599003|41001999006|2604032031799003|31061999003|24021099003|51005399006|26121999007|40105399003|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2VLVjQ0bzZuQ3ZWQVd5eHRlbWU0aU5kc3BsaGcwZEVOU3FKU25TRDR0UTho?=
 =?utf-8?B?VitRZ21qZXBuUmtTSzhYYzVPSlh5K1pMRnBPWjR1ZlpGdjhTdlBRVmZXdHlP?=
 =?utf-8?B?bDNkc1VxOXdUUDNlZE1IdU1wZlNqRWhVQlRWakMzZ29VcFA1QnFmWE9qZDdC?=
 =?utf-8?B?SFhURkphSlYvdGNxVGIrNGRBVnZRdGpFc0RLbUZkVTQ1c2xZeXpLTi9wcTFx?=
 =?utf-8?B?cjN0VEY4VXJxdVl3QVQxUFBBMVBlb1RMN21aVUNUUEFPT2tZQjZhVjFGMDVF?=
 =?utf-8?B?SStTQU8wN3lrdmZOSWx3NGhCUE54Q0hqTFpkY1BsdExqdnd2V1FHS0Z1TzRT?=
 =?utf-8?B?cXFrS0RMZkcreXAvVVpJTDc5eUNuVjhiNC83dXRxdVFIS0VmQkhqbGFWbDRs?=
 =?utf-8?B?QldzQjN1RjZXanltN2k0KzF2amExQVpxdXovQ2tVSmZ0WWpWSkhxemFLd0E4?=
 =?utf-8?B?ckxhU2owQmlzcTdlV2c4dVUzbk9SNkFJSmNvdDl5N3FnMlhrb0h0TElUNDJr?=
 =?utf-8?B?U0RHSE5kR2hpbHZPbUpqeXViNGh0QlRUR3VXeG9JYTZRKzlCOVNBc3JYd3Iw?=
 =?utf-8?B?dDM0a0VTKy9XNzloY3FQYXR3WDVqMmw1cUFEN1FIOVdBWHVsSWsvOEI3S0xG?=
 =?utf-8?B?eVFnQW5NWDlsRkkvZk1VUVBCTkFUNUxNQTZTRGVFYmxYL0ttRnU4aEE1N0hI?=
 =?utf-8?B?S01kSGhEZlhGemhsNHZMSjFxTHZuTWNQcnFRbzZJbGRBbnFBSEJOY3BUYkxX?=
 =?utf-8?B?RnFOc083eU41YWw0SzZBcm11SlFZQXp2VS9IaitZZTdPOGdNV05MYmg4S2pX?=
 =?utf-8?B?cGtGeDFGOHRHN3Bwdnl1bjlKS1hVM0FSMlMvczBEeW5icUJHcXJ3aVNibzVu?=
 =?utf-8?B?UlQ0RDlJTWZITzFUZGVsbTRQZDhnVDFVVmhvMUFwQTQ1UytrSFhhbGgrcjJy?=
 =?utf-8?B?Njd4a1BqMDNsdjdjRThENEk5cGptRTRHWkxKRmRldng4SzNZTEszN3VLOGlU?=
 =?utf-8?B?a1dRaFJsZk41Sk5GOFp4UjEvTE04TE82Vm45NUNjdzdJY3BaMlc5MTRaTll3?=
 =?utf-8?B?RHkvb3Y5aHA0MVpvNjRQaGhqMFFWRnhnMkoyaTlaQVpuVGhReHBkMGJ6UGo4?=
 =?utf-8?B?ZllvWndVWE1GY2Q0Rk1vTE5NZFFYVEtQdmV0RWpySGxWVmpCMGhiYkhOeXps?=
 =?utf-8?B?UG5lQzNRMVNUZVJ5OE1wT21xdzNVamxGR3RjZ3lydWxPaTY3TmFZVFZubkg0?=
 =?utf-8?B?VUIweGFJRTVBTzRFMlY4bEdXZ0lUc1E1OXNXSlFIc2lGRFRNV3duZGZ1d1Z2?=
 =?utf-8?B?VFlRMnJWamdEampVVCt5Z3MrUlVhM1NPV3dlYW9Ud0M0ekZ5dml6NjZaeEdZ?=
 =?utf-8?B?Njg3SEd6TSs1YStPYTVWWU42SW1aWHdWSCtDaHdqMXNTdDQ3Y0oxdVg3Y2dn?=
 =?utf-8?B?OGk5ZEZlVmJsUHBYdkFQL3dMblArUHJhLzVNVTIvS2Qwa1Mvb2Q0MkY3Q0Fx?=
 =?utf-8?B?QkhadlFydlNuOHQ3TzE1azlyZi9MSnE3S3FKYTJDVXZ0V211ZkZaVk5xNVYw?=
 =?utf-8?B?TVdDMkc0RTNFTit3R0VFSit4S1RDQzdrSmFSdFpGS0V3U0FmL2JOcXhmTUZU?=
 =?utf-8?B?cWtiRVRJc2ZpN1JOY1NCUkVpTUpKZEE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TW5pK0ZYbDkrS3J3ZXEzRjRXRnVyZTFCT0ZoZTVsZ2ZETGZmYzRQWXNwdU4y?=
 =?utf-8?B?VEZIZ1hhQkxDcWhkenNsTXQrNUFXcEltNC90Snk0dWlIMitkYitUZk01bHMz?=
 =?utf-8?B?WFVlMlZYdktnZGtuTG1mdm5adUFyUVg4TFhiTVE1elRJWWJubXlmZk0zT1R6?=
 =?utf-8?B?cjZNTzZ5VklFNjBsd0xybFYvQ1JrR0F0MlFYbGVmY2dyeVN2aGJZbXpSMW1M?=
 =?utf-8?B?QmFGeTZ6WHZmd2lMQW1GYmcvdWhSdUJHYXorR202dEd2S3NYaXdhZnJ2SGlt?=
 =?utf-8?B?a3ZJU0xtcGE5M1RvemNydExNeUZuTUlGOXFkQXlnMllxRTVLdmRpQ3VHeW45?=
 =?utf-8?B?RjdNRlkyWUYxTXZ0NHR5M1p3eXo4Y2l4dlZCMm1ENTdqNWlFcjI5cGdHZWNl?=
 =?utf-8?B?N1d4ZlMxSmVQa21wZ2ZaM1ZweHpGVTNYREQvejdjRUVUblFrSE9VZ0RCQU1x?=
 =?utf-8?B?OUtPUWFoekExeUl3TzFkK1B2TjdrbXJoVUg2MlJpbCtERE85b3l3UkUzZmx4?=
 =?utf-8?B?TWpPZmFmd0dFbC9HUytQVVkxU0IrZmFtS09vRnhlekZaZkRtaVoxdm9CcXNY?=
 =?utf-8?B?VTV4bVdlWjBIR1hCMEhhOUVwS2ZxcVVXYXBkSmVQaTErbnora0UzclFsekdD?=
 =?utf-8?B?Yzdwb01HWEdoUnduL05TWTYwSXF0aUk1b21MSXRLTllaTzlBTStvd1lCNkRT?=
 =?utf-8?B?ZUNmdnhOemVkWU83ejNwN2s5VjYyUVg1VmdEK2srNDZaSTNtVForZUxlZWZT?=
 =?utf-8?B?cjBjT0V3N0FNRkFFSTNhMSsyRVo4TDdzNlBQT2I4NEI1Z3JhdTJ5NGQyRGNG?=
 =?utf-8?B?YThNaVlqSGRDSGV0bCtPN2lGek90KzUwcnJ1RG9mNVBVTU5LaDU4WlNBY0Z2?=
 =?utf-8?B?WVEySFc3bWs2WTBFdW1GL2QyT255UkJra2J6UUVEY2NidlVHQnVKaUJqZlhh?=
 =?utf-8?B?Ti92dllWb0NJZHR0ZVNhTGNsOEhweC8yTVJJMW93aS9vOFA5Y0xJZmZTeFps?=
 =?utf-8?B?TjB2eDB2QnlSNlBQSTFUWm1sdDVpMWxVbDI3VWtXYi9IYTJxOWFmK2tSNE9m?=
 =?utf-8?B?dVJ3d05GK0dnbnlVOThPK3VXTkZ0Qi8yQnNYTmp0QXprSHB3bTBhWEJYaTRF?=
 =?utf-8?B?Q0kzVEk0VllIcmxXaXkzWFpScUdNYnlCQnl0clNGdjJubDMzVDZDTUdieTd2?=
 =?utf-8?B?L3YvbnRhVmdIWmE2Y05IWXN3aVphM2JETGF0ejNWeHdEQzlzM3VFQ1hrUWJ6?=
 =?utf-8?B?T3E2Sk5TMXd4RlQxZDhIdkZHZEhmdWErV29oMSs1b2U4VEJ5VmFrZ1hObUZH?=
 =?utf-8?B?UkJQT3ZmaHJDMDFZQzlTR004ZkZkNnJXYkx6RnNaUHlHRDZKeFNyaGlDaE5O?=
 =?utf-8?B?NGFBREZYWmhuWXk5Z1JaWG9wd0NKeFZBNWMyelpaTmF6WU8xYkc0eXlaS0lF?=
 =?utf-8?B?SzF0S1czUUcxSlk1S1R4bHB1TkozMHF4Yk5NcjB5dWpaMmNuN0QxRUNnRnpB?=
 =?utf-8?B?b0ZmTC82TFFNWVMvZm81MldWLzN0S2E3d1ZPUXFhMlV2NnlqMVpPdTR0OUxG?=
 =?utf-8?B?SHd4eVB5TUtnNElQZmdUVkx2cXVhajd5WHZjd2t0d2Zwdm1kazJFS0cra3RB?=
 =?utf-8?B?R0llYWJpc1NYZ3NZWVdyS3FtaW1PWmlicjJiSUZub1AzRWpwTGgwM1pCOXBq?=
 =?utf-8?B?aVZmNGNXa3ZQREtEY1BHdmExclU2MjVsdFVnR0x4VkJZZTh2ZlRrRFE5aU1k?=
 =?utf-8?B?ZkVuQW9INDRIbGZQMXVaNWJWcFpMNWc0VURBb3dJR0VuRFg2S2UzZ0lqd3JQ?=
 =?utf-8?B?QUNQc3l3bThCTElpemJzdWhlOWNGOW1NTkVqaC9WY0J0aWxTbHErcFBjcXdh?=
 =?utf-8?Q?dYl/Y59DBNA1M?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0f633d-67c7-4a65-3efd-08df35c93312
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 14:30:37.1175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR05MB587169

QSBmYWlsZWQgcGVyLWRldmljZSBJUHY0IHN5c2N0bCB3cml0ZSBtdXN0IG5vdCBtYXJrIHRoZSBz
ZXR0aW5nIGFzCmV4cGxpY2l0bHkgY29uZmlndXJlZC4gT3RoZXJ3aXNlLCBsYXRlciBjb25mL2Rl
ZmF1bHQgdXBkYXRlcyBzdG9wCnByb3BhZ2F0aW5nIHRvIHRoYXQgZGV2aWNlLgoKQWRkIGEgdGVz
dCB3aGljaCByZWplY3RzIGFuIGludmFsaWQgbG8vYXJwX2lnbm9yZSB3cml0ZSBhbmQgdGhlbiBj
aGVja3MKdGhhdCBsbyBpbmhlcml0cyBhIG5ldyBkZWZhdWx0LiBLZWVwIGxvb3BiYWNrIHVuY29u
ZmlndXJlZCBiZWNhdXNlIGFkZGluZwppdHMgYWRkcmVzcyBtYXJrcyBhbGwgZGV2Y29uZiBzZXR0
aW5ncyBhcyBleHBsaWNpdC4gQWxzbyB2ZXJpZnkgdGhlCmNvbXBsZW1lbnRhcnkgY2FzZTogYSB2
YWxpZCBzYW1lLXZhbHVlIHdyaXRlIG1hcmtzIHRoZSBzZXR0aW5nIGFzIGV4cGxpY2l0CmFuZCBw
cmV2ZW50cyBpbmhlcml0YW5jZS4KCkJlZm9yZSBlYWNoIGNhc2UsIGNoYW5nZSB0aGUgZGVmYXVs
dCB0byBhIHZhbHVlIGRpZmZlcmVudCBmcm9tIHRoZSBjdXJyZW50CmxvIHZhbHVlIGFuZCByZXF1
aXJlIGxvIHRvIGluaGVyaXQgaXQuIFRoaXMgYXZvaWRzIGRlcGVuZGluZyBvbiBpbml0X25ldApk
ZWZhdWx0cyBhbmQgc2tpcHMgdGhlIHRlc3QgaWYgaW5oZXJpdGVkIHN0YXRlIGhhcyBhbHJlYWR5
IGRpc2FibGVkCnByb3BhZ2F0aW9uLgoKVGhlIGZhaWxlZC13cml0ZSBjYXNlIGZhaWxzIG9uIHRo
ZSBiYXNlIGtlcm5lbC4gQm90aCBjYXNlcyBwYXNzIHdpdGggdGhlCnByZWNlZGluZyBmaXguCgpT
aWduZWQtb2ZmLWJ5OiBZaW5namllIFdhbmcgPHgtcHJvZmVzc29yQG91dGxvb2suY29tPgotLS0K
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9NYWtlZmlsZSAgICAgICAgfCAgIDEgKwogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2RldmluZXRfY29uZi5zaCB8IDEwMSArKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNzU1IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9kZXZpbmV0X2NvbmYuc2gKCmRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvTWFrZWZpbGUgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvTWFrZWZpbGUKaW5kZXggZGYyMTVlMWE2MjYyMS4uZjU1MWJk
NDBiYWI4MCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L01ha2VmaWxl
CisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9NYWtlZmlsZQpAQCAtMjYsNiArMjYs
NyBAQCBURVNUX1BST0dTIDo9IFwKIAljbXNnX3NvX3ByaW9yaXR5LnNoIFwKIAljbXNnX3RpbWUu
c2ggXAogCWNvcmtfZnJhZ3NpemUucHkgXAorCWRldmluZXRfY29uZi5zaCBcCiAJZG91YmxlX3Vk
cF9lbmNhcC5zaCBcCiAJZHJvcF9tb25pdG9yX3Rlc3RzLnNoIFwKIAllY21wX3JlaGFzaC5zaCBc
CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZGV2aW5ldF9jb25mLnNo
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2RldmluZXRfY29uZi5zaApuZXcgZmlsZSBt
b2RlIDEwMDc1NQppbmRleCAwMDAwMDAwMDAwMDAwLi41NDY1NWRjMmIwYmQ4Ci0tLSAvZGV2L251
bGwKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2RldmluZXRfY29uZi5zaApAQCAt
MCwwICsxLDEwMSBAQAorIyEvYmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAKKworc291cmNlIGxpYi5zaAorCitjbGVhbnVwKCkKK3sKKwljbGVhbnVwX2FsbF9ucwor
fQorCit0cmFwIGNsZWFudXAgRVhJVAorCitwcmVwYXJlX2luaGVyaXRhbmNlKCkKK3sKKwlsb2Nh
bCBucz0kMQorCWxvY2FsIHJlc3VsdD0kMgorCWxvY2FsIGN1cnJlbnQKKwlsb2NhbCBwcm9iZQor
CWxvY2FsIHZhbHVlCisKKwlpZiAhIGN1cnJlbnQ9JChpcCBuZXRucyBleGVjICIkbnMiIFwKKwkJ
c3lzY3RsIC1uIG5ldC5pcHY0LmNvbmYubG8uYXJwX2lnbm9yZSk7IHRoZW4KKwkJZWNobyAiRVJS
T1I6IGZhaWxlZCB0byByZWFkIGxvL2FycF9pZ25vcmUgaW4gJG5zIgorCQlyZXR1cm4gIiRrc2Z0
X2ZhaWwiCisJZmkKKwlpZiAoKGN1cnJlbnQgPT0gMCkpOyB0aGVuCisJCXByb2JlPTEKKwllbHNl
CisJCXByb2JlPTAKKwlmaQorCisJaWYgISBpcCBuZXRucyBleGVjICIkbnMiIHN5c2N0bCAtcXcg
XAorCQluZXQuaXB2NC5jb25mLmRlZmF1bHQuYXJwX2lnbm9yZT0iJHByb2JlIjsgdGhlbgorCQll
Y2hvICJFUlJPUjogZmFpbGVkIHRvIHVwZGF0ZSBkZWZhdWx0L2FycF9pZ25vcmUgaW4gJG5zIgor
CQlyZXR1cm4gIiRrc2Z0X2ZhaWwiCisJZmkKKwlpZiAhIHZhbHVlPSQoaXAgbmV0bnMgZXhlYyAi
JG5zIiBcCisJCXN5c2N0bCAtbiBuZXQuaXB2NC5jb25mLmxvLmFycF9pZ25vcmUpOyB0aGVuCisJ
CWVjaG8gIkVSUk9SOiBmYWlsZWQgdG8gcmVhZCBsby9hcnBfaWdub3JlIGluICRucyIKKwkJcmV0
dXJuICIka3NmdF9mYWlsIgorCWZpCisJaWYgKCh2YWx1ZSAhPSBwcm9iZSkpOyB0aGVuCisJCWVj
aG8gIlNLSVA6IGxvL2FycF9pZ25vcmUgZG9lcyBub3QgaW5oZXJpdCBjb25mL2RlZmF1bHQgaW4g
JG5zIgorCQlyZXR1cm4gIiRrc2Z0X3NraXAiCisJZmkKKworCXByaW50ZiAtdiAiJHJlc3VsdCIg
JyVkJyAiJHByb2JlIgorfQorCisjIEFkZGluZyB0aGUgbG9vcGJhY2sgYWRkcmVzcyBtYXJrcyBh
bGwgZGV2Y29uZiBzZXR0aW5ncyBhcyBleHBsaWNpdC4KKyMgTGVhdmUgaXQgdW5jb25maWd1cmVk
IHNvIGRlZmF1bHQgaW5oZXJpdGFuY2UgcmVtYWlucyBhY3RpdmUuCitmYWlsZWRfbnM9ImZhaWxl
ZC0kKG1rdGVtcCAtdSBYWFhYWFgpIgoraWYgISBpcCBuZXRucyBhZGQgIiRmYWlsZWRfbnMiOyB0
aGVuCisJZWNobyAiRmFpbGVkIHRvIGNyZWF0ZSBuZXR3b3JrIG5hbWVzcGFjZSAkZmFpbGVkX25z
IgorCWV4aXQgIiRrc2Z0X3NraXAiCitmaQorTlNfTElTVCs9KCIkZmFpbGVkX25zIikKKworZXhw
bGljaXRfbnM9ImV4cGxpY2l0LSQobWt0ZW1wIC11IFhYWFhYWCkiCitpZiAhIGlwIG5ldG5zIGFk
ZCAiJGV4cGxpY2l0X25zIjsgdGhlbgorCWVjaG8gIkZhaWxlZCB0byBjcmVhdGUgbmV0d29yayBu
YW1lc3BhY2UgJGV4cGxpY2l0X25zIgorCWV4aXQgIiRrc2Z0X3NraXAiCitmaQorTlNfTElTVCs9
KCIkZXhwbGljaXRfbnMiKQorCitwcmVwYXJlX2luaGVyaXRhbmNlICIkZmFpbGVkX25zIiBmYWls
ZWRfdmFsdWUKK3JldD0kPworKChyZXQgPT0gMCkpIHx8IGV4aXQgIiRyZXQiCitwcmVwYXJlX2lu
aGVyaXRhbmNlICIkZXhwbGljaXRfbnMiIGV4cGxpY2l0X3ZhbHVlCityZXQ9JD8KKygocmV0ID09
IDApKSB8fCBleGl0ICIkcmV0IgorZmFpbGVkX25leHQ9JCgoIWZhaWxlZF92YWx1ZSkpCitleHBs
aWNpdF9uZXh0PSQoKCFleHBsaWNpdF92YWx1ZSkpCisKK1JFVD0wCitpcCBuZXRucyBleGVjICIk
ZmFpbGVkX25zIiBzaCAtYyBcCisJJ3ByaW50ZiB4ID4gL3Byb2Mvc3lzL25ldC9pcHY0L2NvbmYv
bG8vYXJwX2lnbm9yZScgMj4vZGV2L251bGwKK2NoZWNrX2ZhaWwgJD8gImludmFsaWQgYXJwX2ln
bm9yZSB3cml0ZSB3YXMgYWNjZXB0ZWQiCitpcCBuZXRucyBleGVjICIkZmFpbGVkX25zIiBzeXNj
dGwgLXF3IFwKKwluZXQuaXB2NC5jb25mLmRlZmF1bHQuYXJwX2lnbm9yZT0iJGZhaWxlZF9uZXh0
IgorY2hlY2tfZXJyICQ/ICJmYWlsZWQgdG8gdXBkYXRlIGRlZmF1bHQgYXJwX2lnbm9yZSIKK3Zh
bHVlPSQoaXAgbmV0bnMgZXhlYyAiJGZhaWxlZF9ucyIgc3lzY3RsIC1uIG5ldC5pcHY0LmNvbmYu
bG8uYXJwX2lnbm9yZSkKK2NoZWNrX2VyciAkPyAiZmFpbGVkIHRvIHJlYWQgbG8gYXJwX2lnbm9y
ZSIKK2NoZWNrX2VyciAiJCgodmFsdWUgIT0gZmFpbGVkX25leHQpKSIgXAorCSJmYWlsZWQgd3Jp
dGUgcHJldmVudGVkIGxvIGZyb20gaW5oZXJpdGluZyBhcnBfaWdub3JlIgorbG9nX3Rlc3QgIkZh
aWxlZCBkZXZpbmV0IHdyaXRlIHByZXNlcnZlcyBpbmhlcml0YW5jZSIKKworUkVUPTAKK2lwIG5l
dG5zIGV4ZWMgIiRleHBsaWNpdF9ucyIgc3lzY3RsIC1xdyBcCisJbmV0LmlwdjQuY29uZi5sby5h
cnBfaWdub3JlPSIkZXhwbGljaXRfdmFsdWUiCitjaGVja19lcnIgJD8gImZhaWxlZCB0byBleHBs
aWNpdGx5IHNldCBsbyBhcnBfaWdub3JlIgoraXAgbmV0bnMgZXhlYyAiJGV4cGxpY2l0X25zIiBz
eXNjdGwgLXF3IFwKKwluZXQuaXB2NC5jb25mLmRlZmF1bHQuYXJwX2lnbm9yZT0iJGV4cGxpY2l0
X25leHQiCitjaGVja19lcnIgJD8gImZhaWxlZCB0byB1cGRhdGUgZGVmYXVsdCBhcnBfaWdub3Jl
IgordmFsdWU9JChpcCBuZXRucyBleGVjICIkZXhwbGljaXRfbnMiIHN5c2N0bCAtbiBuZXQuaXB2
NC5jb25mLmxvLmFycF9pZ25vcmUpCitjaGVja19lcnIgJD8gImZhaWxlZCB0byByZWFkIGxvIGFy
cF9pZ25vcmUiCitjaGVja19lcnIgIiQoKHZhbHVlICE9IGV4cGxpY2l0X3ZhbHVlKSkiIFwKKwki
ZXhwbGljaXQgbG8gYXJwX2lnbm9yZSB1bmV4cGVjdGVkbHkgaW5oZXJpdGVkIHRoZSBkZWZhdWx0
IgorbG9nX3Rlc3QgIlZhbGlkIHNhbWUtdmFsdWUgZGV2aW5ldCB3cml0ZSBwcmV2ZW50cyBpbmhl
cml0YW5jZSIKKworZXhpdCAiJEVYSVRfU1RBVFVTIgotLSAKMi40My4wCgo=

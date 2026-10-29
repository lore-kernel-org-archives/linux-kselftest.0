Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286639;
	b=l/SijknZZVt62YLXxTE47cB+XVuZW9BLkUD8ugxC78ivBbMvNAie2ZsoJYzpYvlVwqN1
	 xV8CaStdsSfB2w0TNuoTbwWp+pTGZlSMXtJAYz2R2ykeOJH6o1Of5BfhOMwcPrtqo8mDv
	 itSbmESeVQC9kFzFbWCH8CiXjAnUL40aNqDKqVTATJYW/OTrcON4sHtHpBJzzVeX3dsry
	 BkSvFKYnZlayEFBxiRnFwX06iw8SzxOjTnx5vFJ/b/S7Y/Vcl9ZMsO7xYZefdlNycCERW
	 BQuGsSbqx5PHlVid43Uv+lS4N0RRgJve47BXe1ga16d2VPn1CNwk9adyyD0RJsmGNig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286639;
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
	bh=+bIPeM/YdHKWqS1GvpKQrsVSCMAWTUgIhpueTudSTh0=;
	b=tPoCFOFvMnrrwEZDYXJQOZsFo/RcMB8Luhp7Lq3gmWNA+zBzvmX5gcRONgQrqGrr2u8x
	 j4PTursAbH28+AzrZec3Q6QM7st8JQBVBeU6Qh/g7rtylhqL3V9q+gpq4vTbdkFpcMd8c
	 F/SbX8rOCXVNQL8UePt3QDAawtdisfj/8Sxlewqlk+AawfV7qq8iWCy1aje+hxToTQ7++
	 A2myvMMl7B5PHO1KaVZlE0CyA0Ll/BZH695v/SD0YvGusGbtzEKaF+ORmpq2fSamYyzLh
	 NrN+nj1Kj9v1NyGLvkP8DzdaKLxA5f6j1XbSDKlhI3DPg1ontXnVRf4IHcwp2meCydw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=KlBVygKq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.15
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012015.outbound.protection.outlook.com [52.103.14.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC89606A321;
	Thu, 29 Oct 2026 15:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC89606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=KlBVygKq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWHNWlHCb0dpxwmowg9uTxE1KJyxAOHUQ5P4+gLS3W4wmqtiN4i1Ns1XxL9yUX/G3hUHw1Sa/6zNAMWYLcVM0Ov/qbvYCvqbKNli8NCNkZgAfUb82NtHe0ur+AE/CK4L0Hvq8AZlrjaE93Q2QDb+TQqjgc7boHupG5PNaiV+mjdMeMsSej2++gvX2pt14VV0zucOZfHpjQOLdXD8wneBjKWHqg6E4Yu26+Wt7TD7QzdU/izJ2yJVFwpw9LYgftyYAtqknWZoE95ErYXol+wjvEe1AU6MU3+tN+XaC8/MM8bgNMck14docMudKGfM+mFQhEnbsmel9Z7nAC/16kSpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=+bIPeM/YdHKWqS1GvpKQrsVSCMAWTUgIhpueTudSTh0=;
 b=ks0mGbOOnDnoCaUhkGAl6UIYprbfTLurq2ABjKYBi5gk0LZil3xnC7+K8MEKpHGdEze2zUih2dQO0vRXrRDNRAxO4ycpqM45WGOPBiVp0S27tF6aRmxYblw/etJaMAeKiRGIGcp6Yx322Bxg6MFEAAJpdaC48npwTvTLsEUuDQ9d0azepXwlJwEg6IGO+uOZ3C2dwBOOtUb826cxIavjXrBuspiusRxwZfoRXSDuPYWrCVV17Yrp2i1FXLYqjQZhXgv+FT+cvE27BA6NaAgevDOBPKmaPBBRvLws/qKDhtqvy/1tMDH6aJYL7chHUS9IeXuMEu6JbO9ZN2lTUbjtKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bIPeM/YdHKWqS1GvpKQrsVSCMAWTUgIhpueTudSTh0=;
 b=KlBVygKqUwWZ8gQkRMRWwgh6Hfh7ZaphhZip1sN2CwBvTdTVp4loChXlzeLXHYiuU9WL4YURf5jYI9gDuvEHanwrdtJO2TIt5zkyibRrITe/2A0DQAHcb5y6YkdsUOIHG3wHOEiFow9ybrgqqlySqiWrq4u+jiTw9tTqmWhzkccok7doAhbpPQmi8/YMWVpMwxglIVi/VfeY0NcGzesfyNnuBvcH3QrEK/8CiIQv4fYAJQG8vTEOaDPvlPy/FiiuDgSIuCtdoGjlz2tH+cvyQRMdU9BSkV4o+puqVQJY77CZDmpVNvDjS4n2kT7SO4HFZP84tC5C5f+H05ABQM/N4Q==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by PH0PR05MB8240.namprd05.prod.outlook.com
 (2603:10b6:510:b3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 15:10:36 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 15:10:36 +0000
From: Yingjie Wang <x-professor@outlook.com>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
CC: Yingjie Wang <x-professor@outlook.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
	"phx0fer@gmail.com" <phx0fer@gmail.com>, "wang.zhan@smartx.com"
	<wang.zhan@smartx.com>, "kuniyu@google.com" <kuniyu@google.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH net v2 1/2] net: preserve rps_default_mask on failed writes
Thread-Topic: [PATCH net v2 1/2] net: preserve rps_default_mask on failed
 writes
Thread-Index: AQHdZ7emhk6XXdbOWEeDrAvBzjQI+Q==
Date: Thu, 29 Oct 2026 15:10:36 +0000
Message-ID:
 <11f9052cba649eb1efec6e9e45eb9377d46e19d1.1793286626.git.x-professor@outlook.com>
References: <cover.1793286626.git.x-professor@outlook.com>
In-Reply-To: <cover.1793286626.git.x-professor@outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|PH0PR05MB8240:EE_
x-ms-office365-filtering-correlation-id: 947f22f4-d4da-44b9-9f49-08df35cec912
x-ms-exchange-slblob-mailprops:
 AZnQBsB9XmrTkIzDOCxR6E7nJ4I/6XZ72lYkzezA7G7tMEKlCSVDKCPZDBLuCnmMjY1EAI1DxkPYlYAisibsRIjCQ8V1Ge5JKLAt/WaQT6rVoBjVJ9h8VP47NEvHOa8dN22y7qw7xB4a/uAtbecC1i4dK5ZDjbYqcvw26RLS8zcO/7fKvXbO0ZsiN5YnDolvqVnYsWtMR84yDwMq50+JnpouDaicj2GKfAb4OqU8JlVcW7wExKrY33AxyjtbJNsIqMBAP8tgqhAb6niNKeV7lRrg1azcXfXZjp1mJRappBN4LAMV8mnIG7oLdsmTeSWgOds0GsOkc4zbQjmGffArfppZlYkdUkXpKLON1BfUKF/f6cZk6oxVi9mUO7z+mW1Rma845c2mH82uzyKBa1hUlQaW/Pb4tDyElZWryXW6ptFvlbhaGhF3owKpPDC00Pr0DwNOJJlv15t/tCkbySHOHsbKMPJTkuweSQ1U/BSxvpr+lyS76VmfMLQ2CfQsxoutNWBBrLWFx9xivwuP4CQ+PlppJY2O/L0IQde/hef5OBstuwJuJj2GXkwqJ/r4TiWQqZWgu/5xjlu1g4duZj3MyhmhZD2GSf+t41cw3ErlXS9cQ9oTzKsRZHwBAMAFIUtG6pPcjAL2ctrOT6RanMCkId6j1f/gIA0H2jun1NjGKamW0kMy5fH7R7nL3p+lc953OaREtQ+wcuTP6yBWonpiRgkN/spSJt1Z1Bih9tFo37gU9FUVZWoRC9dBON6phupwFaPIToTMJLk=
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|51005399006|24121999003|22091999003|24021099003|8062599012|41001999006|19110799012|8060799015|38102599003|16051099003|2604032031799003|4140399003|31061999003|25010399006|102099032|440099028|3412199025|26121999007|40105399003|30101999006|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXhkZC9YSVZvbFNiZWxSYkxGZEpJVHRrYXFlVk1IOVFnUzRTNGdtdEJRUFpF?=
 =?utf-8?B?dDIzT2x4K3BWRzFSL1FWS2xpeVBORjFsL0JkVDVudThBSzA1MUVWWDE4YmJP?=
 =?utf-8?B?dEdCWVEzSXZ2RXJGdUIwaTZYcWN3SDIwUkFzQzhBRTBRb2w4N0drb3IzSjRF?=
 =?utf-8?B?MEczSTFhZ2RNSlFmSHZqRXdPcmVLcEQ5ZnVKR1Q5MHp2WlF4MUxpT3ZuSFh4?=
 =?utf-8?B?RVUvSTMvMzhSY3pYZ01OMVNiQ2MrWUxMbG0rK2RJKzh5UmROdGVaWXdFeTN6?=
 =?utf-8?B?WGVNZ05TYXhrY3hmM0NwcFl0VnZ2VWtWMXRaRVJWZ2M3aFJyODZ4UWFKcjZz?=
 =?utf-8?B?VzRzbjhPSENQcS9EZnJqZTZ5SXM5SEZGcGJUbURGOUlrelZNdlpielVQelNT?=
 =?utf-8?B?OU5DOUg1emYzTmJySnVYalpJci8xaUhlSU4xL0xlS2FTQmwwZENYck9Oa1Vl?=
 =?utf-8?B?ZmpNazVNY3dHb0h4ZE1jenNCNzNDeXVObGFocy9IcS8wNzYwZGVxRDZXNnFL?=
 =?utf-8?B?U3ByUW9MaXNYeWhEazVqODJoOWJWTytaakQ2RThkTE53S01YZm1yMk9vc0o2?=
 =?utf-8?B?TVUzVGxnUzdOM3h4Zmlpc1cyOTMwMVVnZ01GcG4wU3N3NnFyNmhmK1d1dWRV?=
 =?utf-8?B?YjRlajltZk9OVmk5VzBDdFdwNTdDZjg3eksrNnFiZStHb0pYZ2RGb2FSblIz?=
 =?utf-8?B?dklKaFk1eXZRTXRSM0YxU1FHRDhQMFdPSmdLOThjNDhNNEJxRVZVcVhTQkRC?=
 =?utf-8?B?ZXUxZENUbzBFYTBkK3oxc09aYzRWWWRHNDNHakdPNmpGR1QraEhiYWNZaVg3?=
 =?utf-8?B?UWlSRE9Ca3Z2QU4wRkI2cWF6VUVZdVBrUGFIUFBCMkp2dmIzRkl4M3FJczlJ?=
 =?utf-8?B?c2hnSHM0ZHRjd2FicDJCaUZhYjJ0WE1EaEsxaUdVc3B2TWhxdm9MbCttTTVR?=
 =?utf-8?B?RU8yVTI1MVJZcS9NTTVvYmdHTkErcVAycm9ROU1YdDJTSXY1NzFHWDJacnBL?=
 =?utf-8?B?aDN5VlVKT3VXb2wrUWxwTzFBMHRmVk1LWHQ0NFNJcVlUZVJJYml5dmx6TmVG?=
 =?utf-8?B?V1JoNVRTWFEzZXNpbmhEVnowL1c4N1RoTmtxMlpTTGN1NnN4dHJZOFVSU3VV?=
 =?utf-8?B?SFVGbC9hd2RYYzB0amt4UVZTN204Tk5MaEZyNUVsT0lhTzI2T2FueG5HaGJz?=
 =?utf-8?B?WmFwc2E3NUFGdWl5Vk5QZmY1SzJjWGpoTTVnc1RvbkZNcm16YVZDeG43Wjlz?=
 =?utf-8?B?ZXpBbTh2cm5JaEpqNVR5emNuUDNxSml3WFEvTFlmUkkyV0k1R0pTT2dEakdP?=
 =?utf-8?B?QytZdURLVCt5MExZckZsSG13bUtkVWpXK05QY1VxeTI5VXlXaTVLTzlsbURZ?=
 =?utf-8?B?SEh3aWJNbGR1VVpvK1pFdHd6cGFtdGlJY3YvOVJKczZ6dDQveVRzWTVtQXhh?=
 =?utf-8?B?aFpyNllZMXdHQWxvdGNMZlBDSFhCYjI1cmpYYUhKdWtBcENvR0ZpcGZaQUs5?=
 =?utf-8?B?aHQyckUvWHJpVytOekVVYW1TRUppZm16TFJpcGc3aFNwRCtDRWlDMm14b2xk?=
 =?utf-8?B?c3dZZkV4TE9jejBNRjZ2NVB3SGRQK0g3NGpKS29xU2ZVL3BZWUdXaW9ZdVZ3?=
 =?utf-8?Q?jO25rtA+/HRORieY1DZ7xBxT6l9o9+GZJ4LpiR/lIeOg=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnhPMnM5eDJqMEdWcjJxZmtaTkhlOHZUUENUMERHaXlTNWZyMVJMeGdyUCtx?=
 =?utf-8?B?L1AreDJYL3FpcitGOHR2SXk5TWlLY01PQTQ3bWJRWW8rckpyNmxUZWZiN2k5?=
 =?utf-8?B?ZFk5UVVvN005Uk5pa1U2VUlTaGRxQldCQjR4ZEUzbDZaTm1Ya0IzcFZ6cHll?=
 =?utf-8?B?TFZmTWg1UURaaTU2dkFKK3VmYUg4ajJEak9YUmcyQUMzczJsUFF5REozbU50?=
 =?utf-8?B?MjgwY1Bpb2x6Wi9xZkQ4SjM5a29XRW55RVpCQkVORCtQeDhGMGhTejBFWXZ5?=
 =?utf-8?B?U011SmxwVWprRXlzbXdINW54VG1nUGJ5NG9MdHZha01IR0FKeXhjeHhocmJB?=
 =?utf-8?B?STVFd2hibEFYTHZOK2tNbnkxRVBLK0J1azVhdnd1em5HdEZLbmlDTXBMOUVV?=
 =?utf-8?B?VWQvbTUxZ2lVbW5WcW1pYnY0ck5HYkdKNXlvUkJxb2ZselpkZEJQK2YwNm1Q?=
 =?utf-8?B?SzNCMXk2dXJKdmc4emFmTFdjeEJrWUFZc3ZmbEt1LzlHWFBXc0pxSW5BOFlk?=
 =?utf-8?B?cUE0WjVyT3lmM3JDdklXTnR5ZnBHeW1EM2NpTTZGM1g3MzZDUGkrK1F0MVBa?=
 =?utf-8?B?Nko0K25KeXd4YXljR2pRYzd2TnVMci9KVGk2M0VQckFaL20zT2JwUDFiZ2xa?=
 =?utf-8?B?MmZMZ3RtWjNGcERIeG0rWEs1WDlXZEt2UkozUzExRzFRY1JoMzFZZU5YekV4?=
 =?utf-8?B?Y1p4cjRFbk9JeVdia2wyOTBUYTF2NXE4UVpCTlQ3alh0Ums4V2ZwTmhJRXk0?=
 =?utf-8?B?ajVFdERZZk5yaWZBMVM5c2tydzhBczdoTVp5Y0laQStQQ2FZa3FwTEVVZlFi?=
 =?utf-8?B?aDhDYVNIRlFCS0Npb2hCN0dzVSsrRU5Hc0JXNXNQYjZBU0FoZnhrSUxZRlFU?=
 =?utf-8?B?ZDZ5ci9ia1RnbXRYZExvMnVpR2JTVTJCYzZsMU5XVVFjaVhmVS9SZ1V6NjJK?=
 =?utf-8?B?RS9YNnJPL09TaXdCcERzb1ZxN0FYREpDcGlyVjRldTVJQUFHVjRoOWJ5K2ZO?=
 =?utf-8?B?WjV5QjVIdmVWYmVWNVZTUGdvVnhMM29lMElTaWhLMS9La1RkVlcyN0NBVHhj?=
 =?utf-8?B?ZVVOcEtxbHFGQlNFUkZGSXFtYUk2NjV1Q1ZPKzJzaXp4V2g5MDFxV2g0MExU?=
 =?utf-8?B?ODhjYmFiaXpXNDUrRjJScFZOdTJBSGpwS0pOZmJMNXpWVmx4enhOa1Erdnov?=
 =?utf-8?B?OVhGSWxTZkRCWTd3aFR3YWtzRnZndlo3bmtxRmYxbEZKSnhHTVo4TFFialF2?=
 =?utf-8?B?cEcvUGd4cTFNNzJqcGNLQnhVVTdWNjFES3NVZ2lWcWNIYzBWZ1B5OUw1Mko1?=
 =?utf-8?B?bndSN1Vyc2lwdUloTXRrT2FYN3VueHVMd2V3MXRqdTBUdGlGd3J5ZE82WWFC?=
 =?utf-8?B?VGh4VjRLSEJvKzZqTjF4VG1VSE4yQ05tNjU4OXdSMmlWZjBaVEFpVGRiMVBn?=
 =?utf-8?B?cXFXd05pZHVpNUlsT3psNStmYkFSS2E1RjFhZXRrbkM4Y1ZOalBKZHFXSGxo?=
 =?utf-8?B?Y1I5SzFXWlJBOEw5UXVTeUhPVDJVRC9sNm5FeVpwUGp2TnNnV2xtRmtKc0ZU?=
 =?utf-8?B?UVd1cXdyb3hkdEZWa0Jta2RFR050d29aOVFyNGJ6cGROZUlJa0ZuNXFSdEV5?=
 =?utf-8?B?ZmV5TGUzQzlkRmw0Y202c1ZHVnkwR3VYZEljV01KTEpPM1RmUVBTN3pNa2h0?=
 =?utf-8?B?NVZwbFFjaE42ZDdWYys4VjdGTWhaY2I4KytqZmhJb2hiVlhTeW1za1JFcWdI?=
 =?utf-8?B?Q214ZjlxZUo2VWIzR281OVV1RDR2VGsxYjk5azdkZ29odXlzSGxMNmU1U0ps?=
 =?utf-8?B?Mnh4QzNRZUwrRTArRWVZdkQzNmo5ZkNJdUhXL1dmYlNWbStvS01VMkY2Y3BB?=
 =?utf-8?Q?8W6Ooj/RdQoVe?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 947f22f4-d4da-44b9-9f49-08df35cec912
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 15:10:36.2668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8240

cnBzX2RlZmF1bHRfbWFza19zeXNjdGwoKSBwYXNzZXMgdGhlIGxpdmUgcGVyLW5ldG5zIG1hc2sg
dG8KY3B1bWFza19wYXJzZSgpLiBiaXRtYXBfcGFyc2UoKSBzdG9yZXMgY2h1bmtzIGFzIGl0IHNj
YW5zIGZyb20gcmlnaHQgdG8KbGVmdCwgc28gYSBsYXRlciBlcnJvciBjYW4gbGVhdmUgbG93ZXIg
Y2h1bmtzIGNoYW5nZWQuCnJwc19jcHVtYXNrX2hvdXNla2VlcGluZygpIGFsc28gaW50ZXJzZWN0
cyBpdHMgaW5wdXQgaW4gcGxhY2UgYmVmb3JlCnJldHVybmluZyAtRUlOVkFMIHdoZW4gbm8gaG91
c2VrZWVwaW5nIENQVXMgcmVtYWluLgoKQ29uc2VxdWVudGx5LCBhIGZhaWxlZCB3cml0ZSBjaGFu
Z2VzIGJvdGggdGhlIHZhbHVlIHJlYWQgZnJvbSB0aGUgc3lzY3RsCmFuZCB0aGUgZGVmYXVsdCBj
b3BpZWQgdG8gUlggcXVldWVzIGNyZWF0ZWQgbGF0ZXIuIE9uIGEgZm91ci1DUFUgVk0sCmFmdGVy
IHNldHRpbmcgdGhlIG1hc2sgdG8gMSwgd3JpdGluZyB6eiwwMDAwMDAwMyBmYWlsZWQgd2l0aCBF
T1ZFUkZMT1cKYnV0IGNoYW5nZWQgdGhlIG1hc2sgdG8gMy4gV3JpdGluZyBhIG1hc2sgY29udGFp
bmluZyBvbmx5IGlzb2xhdGVkIENQVXMKZmFpbGVkIHdpdGggRUlOVkFMIGJ1dCBjaGFuZ2VkIGl0
IHRvIDAuIE5vIGtlcm5lbCBtb2RpZmljYXRpb24gb3IgZXJyb3IKaW5qZWN0aW9uIHdhcyBuZWVk
ZWQgdG8gcmVwcm9kdWNlIGVpdGhlciBjYXNlLgoKUGFyc2UgYW5kIHZhbGlkYXRlIGEgdGVtcG9y
YXJ5IG1hc2sgYmVmb3JlIHRha2luZyB0aGUgbXV0ZXguIEFmdGVyIGJvdGgKc3RlcHMgc3VjY2Vl
ZCwgdGFrZSB0aGUgbXV0ZXggYW5kIHJlcGxhY2UgdGhlIGxpdmUgcG9pbnRlci4gUmVhZGVycwph
Y2Nlc3MgYW5kIGNvbnN1bWUgdGhlIHBvaW50ZXIgd2hpbGUgaG9sZGluZyB0aGUgc2FtZSBtdXRl
eCwgc28gdGhlCnJlcGxhY2VkIG1hc2sgY2FuIGJlIGZyZWVkIGFmdGVyIGRyb3BwaW5nIHRoZSBt
dXRleC4KClRoZSBycHNfZGVmYXVsdF9tYXNrIHNlbGZ0ZXN0IGZhaWxlZCBvbiB0aGUgYmFzZSBr
ZXJuZWwgYW5kIHBhc3NlZCB3aXRoCnRoZSBmaXguIFRoZSBmaXhlZCBrZXJuZWwgYWxzbyBrZXB0
IHRoZSBtYXNrIGF0IDEgZm9yIHRoZSBvdmVyZmxvdyBhbmQKaG91c2VrZWVwaW5nIGZhaWx1cmUg
Y2FzZXMsIHdoaWxlIHZhbGlkIHdyaXRlcyBvZiAyIGFuZCAwIHN0aWxsCnN1Y2NlZWRlZC4KClRo
ZSBpc3N1ZSB3YXMgZm91bmQgd2hpbGUgZnV6emluZyBzeXNjdGwgd3JpdGUgZXJyb3IgcGF0aHMu
CgpGaXhlczogNjA1Y2ZhMWIxMDkwICgibmV0OiBpbnRyb2R1Y2UgZGVmYXVsdF9ycHNfbWFzayBu
ZXRucyBhdHRyaWJ1dGUiKQpSZXZpZXdlZC1ieTogV2FuZyBaaGFuIDx3YW5nLnpoYW5Ac21hcnR4
LmNvbT4KVGVzdGVkLWJ5OiBXYW5nIFpoYW4gPHdhbmcuemhhbkBzbWFydHguY29tPgpTaWduZWQt
b2ZmLWJ5OiBZaW5namllIFdhbmcgPHgtcHJvZmVzc29yQG91dGxvb2suY29tPgotLS0KIG5ldC9j
b3JlL3N5c2N0bF9uZXRfY29yZS5jIHwgMzEgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL25ldC9jb3JlL3N5c2N0bF9uZXRfY29yZS5jIGIvbmV0L2NvcmUvc3lzY3RsX25l
dF9jb3JlLmMKaW5kZXggNDczYzE2MjczNmQ2OS4uZjI1MjgxYzcwOTM0NiAxMDA2NDQKLS0tIGEv
bmV0L2NvcmUvc3lzY3RsX25ldF9jb3JlLmMKKysrIGIvbmV0L2NvcmUvc3lzY3RsX25ldF9jb3Jl
LmMKQEAgLTEwNSwzNCArMTA1LDM3IEBAIHN0YXRpYyBpbnQgcnBzX2RlZmF1bHRfbWFza19zeXNj
dGwoY29uc3Qgc3RydWN0IGN0bF90YWJsZSAqdGFibGUsIGludCB3cml0ZSwKIAkJCQkgICB2b2lk
ICpidWZmZXIsIHNpemVfdCAqbGVucCwgbG9mZl90ICpwcG9zKQogewogCXN0cnVjdCBuZXQgKm5l
dCA9IChzdHJ1Y3QgbmV0ICopdGFibGUtPmRhdGE7CisJc3RydWN0IGNwdW1hc2sgKm5ld19tYXNr
ID0gTlVMTDsKIAlzdHJ1Y3QgY3B1bWFzayAqbWFzazsKIAlpbnQgZXJyID0gMDsKIAotCW11dGV4
X2xvY2soJnJwc19kZWZhdWx0X21hc2tfbXV0ZXgpOwotCW1hc2sgPSBuZXQtPmNvcmUucnBzX2Rl
ZmF1bHRfbWFzazsKIAlpZiAod3JpdGUpIHsKLQkJaWYgKCFtYXNrKSB7Ci0JCQltYXNrID0ga3ph
bGxvYyhjcHVtYXNrX3NpemUoKSwgR0ZQX0tFUk5FTCk7Ci0JCQluZXQtPmNvcmUucnBzX2RlZmF1
bHRfbWFzayA9IG1hc2s7Ci0JCX0KLQkJZXJyID0gLUVOT01FTTsKLQkJaWYgKCFtYXNrKQotCQkJ
Z290byBkb25lOworCQluZXdfbWFzayA9IGt6YWxsb2MoY3B1bWFza19zaXplKCksIEdGUF9LRVJO
RUwpOworCQlpZiAoIW5ld19tYXNrKQorCQkJcmV0dXJuIC1FTk9NRU07CiAKLQkJZXJyID0gY3B1
bWFza19wYXJzZShidWZmZXIsIG1hc2spOworCQllcnIgPSBjcHVtYXNrX3BhcnNlKGJ1ZmZlciwg
bmV3X21hc2spOwogCQlpZiAoZXJyKQotCQkJZ290byBkb25lOworCQkJZ290byBvdXQ7CiAKLQkJ
ZXJyID0gcnBzX2NwdW1hc2tfaG91c2VrZWVwaW5nKG1hc2spOworCQllcnIgPSBycHNfY3B1bWFz
a19ob3VzZWtlZXBpbmcobmV3X21hc2spOwogCQlpZiAoZXJyKQotCQkJZ290byBkb25lOworCQkJ
Z290byBvdXQ7CisJfQorCisJbXV0ZXhfbG9jaygmcnBzX2RlZmF1bHRfbWFza19tdXRleCk7CisJ
bWFzayA9IG5ldC0+Y29yZS5ycHNfZGVmYXVsdF9tYXNrOworCWlmICh3cml0ZSkgeworCQluZXQt
PmNvcmUucnBzX2RlZmF1bHRfbWFzayA9IG5ld19tYXNrOworCQluZXdfbWFzayA9IG1hc2s7CiAJ
fSBlbHNlIHsKIAkJZXJyID0gZHVtcF9jcHVtYXNrKGJ1ZmZlciwgbGVucCwgcHBvcywKIAkJCQkg
ICBtYXNrID86IGNwdV9ub25lX21hc2spOwogCX0KIAotZG9uZToKIAltdXRleF91bmxvY2soJnJw
c19kZWZhdWx0X21hc2tfbXV0ZXgpOworb3V0OgorCWtmcmVlKG5ld19tYXNrKTsKIAlyZXR1cm4g
ZXJyOwogfQogCi0tIAoyLjQzLjAKCg==

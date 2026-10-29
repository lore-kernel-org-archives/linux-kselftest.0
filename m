Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286640;
	b=yMPyehn3e4Se1Yel9OZKMkbV/riH0zZ9aPDBjVuGSulAULQw4SbYf8mvaJCQcv9ha1hs
	 gGFn4b+KmzQT1eKM9LiA672ZMQ7dy2dkKt4jWNmMBn8ggpsKXNCSVExT+d0trkOujV30k
	 Rg+qQUOu3cnjbWmB3x1Nrg0uHoELsi6LbPLUpYy27nIArvi9IJ+tCupa2WGS+PV2wPf9T
	 IF/po6gcrjmzGzNQ5QFDZyXNsVA5Oj1a8nG/u8nQBf6J5LhYjz3aQiKANiIZgVj2lZo6A
	 not6zKfcqzIM60lHQFsonfDStCXy09/I3xhqkxLzNqa3/5WbxBFXxpcDt+LOSwqh7aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286640;
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
	bh=5Q8ASAXhOjgN8O4uaEzRORlthAF5BR8FzKrPKYs73zM=;
	b=eMQZeewygQUCXME4BzoES18H/NNnr8po9v/wvDr7UPHn3Fhg4Lfqr/RIIQLiBMx5ed/A
	 z8ibgF28wLpvZCivaKGmXoMtcaYH0BLAfB8VanTWj/bfteusfdaMlUCsO56uwqkGpRxQk
	 2oI3/HA6bKIZWaf3JJH2N1ZOk2O7huaOT68HJ3hkAopXfEy/8yfoS2Qy/MPvgawOy9eoS
	 4jjmjuLtaceGvQD9ZpU0mvOkfHzINTo3q78m82jKI5MKglf+VIv0hudtcrwtM2u/H3gWb
	 hjQZioY4Y08Z0xZkVClaKNutDxfNdVjmuuSzXCJcmJVBMreR4lBua/31MLNh24gZvig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=FspyYeRz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.68
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012068.outbound.protection.outlook.com [52.103.14.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8EE606A322;
	Thu, 29 Oct 2026 15:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8EE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=FspyYeRz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBmZhzLiThtXbQ3Jp2Du7zBxIsogfyLut7l6DmAVwYG6WNKXD8JMKn1wQ8TIOi/UAd8Voy6xiw0fs9SsMANO2cMxJyq3qSHmy/ThOBm/a7b9e3r2owRKLIrcTSiWk0Fa40YKaGVYHKbeqi5miX1KapDM/TOh9uxcdfOgqatkjx9OYdZk/lpczNaTJPjIIjOunQdkkEOwSF4lycrAU/dqpFWY43uvjapezzbqs1a8aXCySr+ZOPTOu28QyK8bcFjGwDmZVGQuDu0TOrwX9i+ILWkK6HRX9oCAltmDGHwjIxILnNEGZ6zAjNtCE2Eqp5R6o0evpizJpZe8tfjpGnb/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=5Q8ASAXhOjgN8O4uaEzRORlthAF5BR8FzKrPKYs73zM=;
 b=FzkDkD01w5ISkQsSANwcE1ApZrX8Hn+xvtdZTDH0qOkDYrnFv4YsfoZgYSmEmvwegdsvewQjFlOXNyI1Gk89ALvcERDzwwg288GpgSxpgnX9l+b3ovBxQlcx9AMfpTSeTwEX+3wKDqAZTpkH6HWbFzQoi7IzUHshdIopBA4AYcrb9II/XPb6i0YYepNjbJpeUN7wsQ6wsLQATrJIiUdInf5ff5Q6HlbqQa4hLn2JHIltlQF1Fc/Og168CRUlxmVOBCaG+HthP8kf3OAeXIT84qF/vijU/Nn0QLPBdVVQ5q2fgvdI2zFmRNxR0BlxBaook4LDjr1Lu154ApeY5edjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Q8ASAXhOjgN8O4uaEzRORlthAF5BR8FzKrPKYs73zM=;
 b=FspyYeRzEnbj7QcSMC5xUGi7nT4KBtwOz+tK4WkqJk4xyU3RRe0FjQpou4wqZkm1hOotwzDKVijC8kFcAqjpChVe5edqLNYtDizEqhfo7BjKE9KHDKnSPB1CYVHYOHhbwDUnCnCNlUKMyrDg4GwD62GOIUvxmPk6uXWVhwq3rQ33mZJ4MpxCFixpJpAi5PUpCtZAy6tmkEUuJsFSefCH3LCrL6+EY1+fWmsugCndP4y1+fStv8XrWISl7Os6XN4ggKXjMSsYZQHh3l3R90JW8qqyAMy/397esuSnB1y+LsJ7Ea57UMDhSpxy6D67vuZbtAjGz2iRPpOSOxH4pZGH0g==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by PH0PR05MB8240.namprd05.prod.outlook.com
 (2603:10b6:510:b3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 15:10:38 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 15:10:38 +0000
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
Subject: [PATCH net v2 2/2] selftests: net: check failed rps_default_mask
 writes
Thread-Topic: [PATCH net v2 2/2] selftests: net: check failed rps_default_mask
 writes
Thread-Index: AQHdZ7enE/IfKCJNMEulykY1ONvtVg==
Date: Thu, 29 Oct 2026 15:10:37 +0000
Message-ID:
 <04c3ce2081b72b48025f36f144836e264d60b2c1.1793286626.git.x-professor@outlook.com>
References: <cover.1793286626.git.x-professor@outlook.com>
In-Reply-To: <cover.1793286626.git.x-professor@outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|PH0PR05MB8240:EE_
x-ms-office365-filtering-correlation-id: aa284003-13f2-4276-a2ed-08df35ceca11
x-ms-exchange-slblob-mailprops:
 AZnQBsB9XmrTkIzDOCxR6E7nJ4I/6XZ7BUw8Lhg5wHQYIEfyw+vnM+tG121/+6sr71mSxyM0OytPUXuizxOn9og84SIP129mgiOw+WR6/mdFaBwV4GEr4xIy1pO7Of/ldhqvkLwHDdeeIKnuO89pWO9hqALjYfSH4EVBCGf8oGbmCRiWbUQDnqCdQaK/+Wsh92fIYnvqcMJ8/iANxEQnPdgTHTc5c61yhckB+SBjO19vlV8V6s7qdx3IFdrHcLHSXh13MmV14rcdRq1WqCsmulUfKZn7uXus7vMlHCVEwe8fyN+cHNUFqjQJxbIXpMT4HdZlxv8lNBYl4vKnvO88mLu49lyeNhvP+jJLtQyV4pGZDrkdxhyarBt9dDTySOPcMX7Bc2rgnDifImEjADyyUkxuXvvUUdlk48qzLPtjirA1i5XhPbLi1/zv+TBrnDdoXk6LLc5RGz3F0IICy3FXKkqxhYyYkzio8u/gMjg6JZ3hBJwI7uwiy2yB9cK7ntK56NPP9E3hi7oZcaA5wT2X+NhbkYyekPGzNGujdqH65kOu7+Nuz4378jEc4YMPDy9tHUwOaZSXtJ7hqiZ7kdcRVLXgjxypARvtY2zbpZ1KqDFjs7C+AbWNaw8Q+Zsd50rnYG2mrK6CuqpiszVVbQJgH0lt8VRBTt91+jqsg/PD4G1R6o73GzwkKaRm3dXxmKCqSIjCqJMYt0r+dPYCBACWyLE6FGe2hMf4b1Sz+5vrR092YBIrqQy8jzv2FKmOs9BbbuawqzsIFn0=
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|51005399006|24121999003|22091999003|24021099003|8062599012|19110799012|8060799015|38102599003|16051099003|2604032031799003|4140399003|31061999003|25010399006|102099032|440099028|3412199025|26121999007|40105399003|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?YnRNTGliYmZvTW04bzBGalpuOVlyYUdoZUNvWUd0dHpqZTNHQzFnaEhsSkFx?=
 =?utf-8?B?YnE2UWFYMmdkMlJGak5nN01GTVlvdW5PYXRLVHczcmFMQWVHU1B3Mjl3RVAz?=
 =?utf-8?B?Qlg2d1lvNEoxaHdWWmE2dko3dVRkQmZuTmtvTllOYTJZV1NEbGFBcjhEbVJI?=
 =?utf-8?B?OXBWZEdTVDNwcmFYZUdqNCtZV2JFcTlOd1p0UDY0cVNxRHI0bG9LSUt5Zmhx?=
 =?utf-8?B?UDRwM3paRTh6ZG1ETlo0STlpeXBnTjFPTnJuMnNvb2s5ZTh5eU91dExMWGIv?=
 =?utf-8?B?RytoRTB0VDcwV1pVelMwU1ErQVRBaTQvd3k4K0dHVWg1aHh1dkxjZk1vUUJG?=
 =?utf-8?B?OTR2bldJa2RPaHJsWHRBVzk2aFZOQ1VHZC9OR0ZMd0xDeGtmYnNROStNaWZR?=
 =?utf-8?B?RHhXYWEvekdRSWxZL3hCU0tlM000T2g3akJtd1NUWDJZb2xUSlJ5M3BEbkZH?=
 =?utf-8?B?QWhYL1Fici8zOW8rcVcvd3ZxM2VFZlFtTGJXOFZjK1F2NkMrbnBraXZ3TGc2?=
 =?utf-8?B?diswdnFNcWZOS3lBMmduZ216KzQwN0loN0MzaC9Vb2ZIV3liSGJ6VERuOVd5?=
 =?utf-8?B?Ym9ibmRkTzdFZXRZQjhGdml2STkxcXpKenNyWkllZEd2b2szQTVHKzZvUXBm?=
 =?utf-8?B?RlI3cnRtN0pYNDB2Q1IvcHRNOVhCWkdyUlZnckFzOXduZG90ZHVQYlBUaFlo?=
 =?utf-8?B?d2dNOXYxOHBoUUtnbUttSXJqZUQySy9XLzNVQzFTQXZ4UHhkdE8ydlczemZN?=
 =?utf-8?B?ZWdzaUNmemlIMnB0blBjVU54UzhjYkdaR21SM1lMQk1DRzFSdVRwdXhMbG0x?=
 =?utf-8?B?VWZ3TzA4ZlJTYTFQcHliR1A3OEVrM0dKRzFmODIrcG1KdUhDREtLUDc1SXM3?=
 =?utf-8?B?TW9vNUJEOW1wMWVvUFJZNGJSNVBaRjMzZDhqclVWVlVPVEM2dGZqdGtrZHZY?=
 =?utf-8?B?QTBsUEhQSVpTRENBUHB2QVRjMmtXaXNFeThZVUNJYlNGM2lvQ0doS3o2MXhJ?=
 =?utf-8?B?azRIaXp3OTBQUnpJZkxLMmVjTGNZZnNjWER3a1hoRXYzc3pvUGpTSnpRWDJh?=
 =?utf-8?B?Y3psNVU3RkJBbUlQNmdZdmVLOGhGRWM1YnF0VzQ1QjlycjQxdUZkazBsZjFY?=
 =?utf-8?B?aDNySlJQeHVEQzZyN3I4UUdBZ1FhcWZQS3QwN0ZoZDhya3RSMFZ6WDBmRkR5?=
 =?utf-8?B?RWtNSmt3bHJOcnQvRVJiNWhIS1IwZ0c1NFJPckowdGtWcDhyVFE3bnhIQmxN?=
 =?utf-8?B?UkJSTlViaEROQWw0T2RnekVja3ZaNURrODM4bERUV0V2aVEzaUp2dkVYZ3RY?=
 =?utf-8?B?SHY0cnhTcHdNTXpuU3QxK1R1cTVRTTdyQkltL2lrWmVYcGtRV0swSVc1UkVQ?=
 =?utf-8?B?akRxT3B3TUFOZkd4ZEhUdHRyOU1ObjZOVzd1ZXNOc3plUnF2QlQrYk5iWFlp?=
 =?utf-8?B?Q0N2SnFMOHBDN0xyRlI4QlFadlpmSUtoL1hTNWUwR1lhOXh4RTNYbFFIK1dD?=
 =?utf-8?B?cnlGZmdxbUtLQWpSdVJ6V0lJVVJ6SXVSNEhrUGlqT0lFVHBCTE5kREpiL2k5?=
 =?utf-8?Q?y6VZ9fEOhHyhTDg7i8VSMCmFw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGlMakI1Vk5haytvNEdEVlVyTlczMXN1QlJ5YmhFdlAzMTlOVndpempBN1lJ?=
 =?utf-8?B?UDcrRDFYK09pVTA1aFpKR3k3aG54bjI5UVhmUmVEUVR6UHhaeFA1bjNVVDFG?=
 =?utf-8?B?MGltQ0JDcDlRelhHZnhOZGN3U0dZbE5mQnNJRHRqeW9KZ2xmZVVNU0Z3SjJK?=
 =?utf-8?B?SUpmZ3pUYk5QY2toRjlBenh3T3RjejVET0tHangzeGJOd3NraUZMbGluVjlj?=
 =?utf-8?B?aTBxNk4yVjI5Q21PSG9oNWFLK2NQakFRU3pNV1JpS0VNaUJsdFNxSitwczNl?=
 =?utf-8?B?V1Z4ZmwyaWE1UEw0N2hTQkRuMi9SaGFhNHMxc2F3QXVOTU82dEFVLzhkcFNh?=
 =?utf-8?B?aDVheTFFcmoxUHczTDdtODJVVDF2ZENOeDBJamg2OEJpbzBFSldSU0M5cHFy?=
 =?utf-8?B?bU10bWg0SmptejJKNllPMlUzV0hoc2RDdGg4NStTbm5zb2pPa0VXSmdqWE11?=
 =?utf-8?B?VFJJZzF5Q25HWW85eGU0aHhJOGFXeTNpWUZUa1BWeUlTUlc2K051MXZOWXVv?=
 =?utf-8?B?Tm5pclJWTi9STGZHVlNZd2RxR1dZbnZwWnZTQk5vWS9CZ08yVEEzc2g0Q2Rt?=
 =?utf-8?B?NUtzWHNtTTQ2Mk1Yd1RMN3IySEFrVU04dUFoTmZIVUViL0huN3lPbHUwcFky?=
 =?utf-8?B?bUMzYWpDUUtoUTdVK2tVb0s5SUhMcjZXeDNLWmtpUDB5TUVnWDJUVUlOZmtx?=
 =?utf-8?B?eHdsTC9vV3Jad2g0b3JqRXNqcFpDZ3kzSm02YnNjYTVEYS9PWXpiakNQbUdJ?=
 =?utf-8?B?M3ppbngxRnRiVnZMb2RUV1Z2bnE4eGx6VkVMSGgxV0FuOEZtOEQwSkZkbE1W?=
 =?utf-8?B?L2FOS051eTYxTEVLRDJIb1V0aWhCRGhBMFQzRHU4Sko3U1JqWnlDYnVOWGt3?=
 =?utf-8?B?a3J4OXBQWENlZWtOWng5Mm94Z2NUNjRsSXJJV0VwdUdUblB5cENLZndIV3dU?=
 =?utf-8?B?bXhQdmZ0L3JqWHF5QTJYcnpUUDY5Q3VhTE1yQVhpaG5qMHEzanBHUGpaV05Y?=
 =?utf-8?B?bTlOMXhzN09DQXU3V3dqS1BSa3JZckZDdVNZUzhGOURDeUhoc2Q2elhwNTlE?=
 =?utf-8?B?Qm1jaXlKWnBXNGZWMWM3bytCTDBRMEFIZmlPRG9qN3FvUXNLNlFCU2pINzZp?=
 =?utf-8?B?QnIwUFduR0k2MEh0b25nNy9FNFRIcCsvY08wQi9BZW9sbllKSERSMUdmcEQy?=
 =?utf-8?B?MFU0eHAzYkVFYTJYNHpSZTBkQ0hXc2xaYXE3ZUx6MzRLU0RYU1VyNVYwUjYy?=
 =?utf-8?B?MVc1NjZodm9GUWFUNTI3cUNDaU1yN2ZDVVVLWHVlRk9oSDdxV1A0THhlUlZQ?=
 =?utf-8?B?Rm9jUjVtVEV5VkEvQk50ekxyeGRHd2ZrTFgzRzdGVkM0VXFxNzdRSHp4T2kz?=
 =?utf-8?B?SnFVbWZNN0FaeTRYa2ZHMXZ4ZlpVd29VQTdnMjVBRmVpazNDVFQvNit5azlp?=
 =?utf-8?B?VGgvdHkwa2NocUwraDBLRVptK1pLUmNoVXRTOFBHOEJ1UStyRnZ6UkhJU3pI?=
 =?utf-8?B?R1RLcFpzVlEvZERzNE4ycE1pZ2tYUjA1aVk1OU5RMWdpWExVNXdhamJhbjQ5?=
 =?utf-8?B?Y1lIcVExU3RXSlY3dkxvU1grZjNySlNadGV0NjZGZHIyekQ4Q3dDZVgrQ0Vj?=
 =?utf-8?B?ZzVoOHRLSFZrNytnemM4Yjl5TGhtYUFBOUJHTFV2YmEydnVrbThYWmZpVUgx?=
 =?utf-8?B?NXNVQVI2dlR6WUU3THlNeEgrWjdSL25IcVBFeXNnd1RyWnREMU5kNk5YQXda?=
 =?utf-8?B?Z3luUGlvTXZ0Y0lMeVlnUHF3NkFOSktITTRVOU5KWU5yNWZMVnhHM3BnODYy?=
 =?utf-8?B?L0t4THNPUTN6MC9ReEtTaHVZSzEwSjlERnlxNDNSWjM1Q1ZvR2w3TzN1OXJN?=
 =?utf-8?Q?avTNLn4j1qXsL?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aa284003-13f2-4276-a2ed-08df35ceca11
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 15:10:37.9568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8240

QSBmYWlsZWQgd3JpdGUgdG8gcnBzX2RlZmF1bHRfbWFzayBtdXN0IG5vdCBjaGFuZ2UgdGhlIGNv
bmZpZ3VyZWQgdmFsdWUuCkFkZCBhIGNhc2Ugd2l0aCBhIHZhbGlkIGxvdyBjaHVuayBmb2xsb3dl
ZCBieSBhbiBpbnZhbGlkIGhpZ2ggY2h1bmsuIFRoZQpvbGQgaGFuZGxlciBsZWF2ZXMgdGhlIGxv
dyBjaHVuayBpbnN0YWxsZWQgYmVmb3JlIHJldHVybmluZyBhbiBlcnJvciwKd2hlcmVhcyB0aGUg
Zml4ZWQgaGFuZGxlciByZXRhaW5zIHRoZSBwcmV2aW91cyBtYXNrLgoKU2lnbmVkLW9mZi1ieTog
WWluZ2ppZSBXYW5nIDx4LXByb2Zlc3NvckBvdXRsb29rLmNvbT4KLS0tCiAuLi4vdGVzdGluZy9z
ZWxmdGVzdHMvbmV0L3Jwc19kZWZhdWx0X21hc2suc2ggfCAyMyArKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL25ldC9ycHNfZGVmYXVsdF9tYXNrLnNoIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbmV0L3Jwc19kZWZhdWx0X21hc2suc2gKaW5kZXggYjIwMDAxOWIzYzgwYS4uOTFl
MTYzZmQyNTQ1MCAxMDA3NTUKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L3Jwc19k
ZWZhdWx0X21hc2suc2gKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L3Jwc19kZWZh
dWx0X21hc2suc2gKQEAgLTQ1LDggKzQ1LDMxIEBAIGNoa19ycHMoKSB7CiAJZmkKIH0KIAorY2hr
X3Jwc19kZWZhdWx0X21hc2soKSB7CisJbG9jYWwgcnBzX21hc2sgZXhwZWN0ZWRfcnBzX21hc2s9
JDIKKwlsb2NhbCBtc2c9JDEKKworCXJwc19tYXNrPSQoY2F0IC9wcm9jL3N5cy9uZXQvY29yZS9y
cHNfZGVmYXVsdF9tYXNrKQorCXByaW50ZiAiJS02MHMiICIkbXNnIgorCisJcnBzX21hc2s9JHty
cHNfbWFzay8vLH0KKwlpZiBbICIkcnBzX21hc2siIC1lcSAiJGV4cGVjdGVkX3Jwc19tYXNrIiBd
OyB0aGVuCisJCWVjaG8gIlsgb2sgXSIKKwllbHNlCisJCWVjaG8gIltmYWlsXSBleHBlY3RlZCAk
ZXhwZWN0ZWRfcnBzX21hc2sgZm91bmQgJHJwc19tYXNrIgorCQlyZXQ9MQorCWZpCit9CisKIHRy
YXAgY2xlYW51cCBFWElUCiAKK2VjaG8gMSA+IC9wcm9jL3N5cy9uZXQvY29yZS9ycHNfZGVmYXVs
dF9tYXNrCitpZiBlY2hvICJ6eiwwMDAwMDAwMyIgPiAvcHJvYy9zeXMvbmV0L2NvcmUvcnBzX2Rl
ZmF1bHRfbWFzayAyPi9kZXYvbnVsbDsgdGhlbgorCWVjaG8gImludmFsaWQgcnBzX2RlZmF1bHRf
bWFzayB3cml0ZSB1bmV4cGVjdGVkbHkgc3VjY2VlZGVkIgorCXJldD0xCitmaQorY2hrX3Jwc19k
ZWZhdWx0X21hc2sgImZhaWxlZCB3cml0ZSBkb2Vzbid0IGNoYW5nZSBycHNfZGVmYXVsdF9tYXNr
IiAxCisKIGVjaG8gMCA+IC9wcm9jL3N5cy9uZXQvY29yZS9ycHNfZGVmYXVsdF9tYXNrCiBzZXR1
cAogY2hrX3JwcyAiZW1wdHkgcnBzX2RlZmF1bHRfbWFzayIgJE5FVE5TIGxvIDAKLS0gCjIuNDMu
MAoK

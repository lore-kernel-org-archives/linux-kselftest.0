Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013014.outbound.protection.outlook.com [52.103.33.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734053909A6;
	Mon,  3 Aug 2026 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783742; cv=fail; b=Xlywj5mPfXHJm4WKDAFaoFa6B9nP4xPBVZtHzN80od9oPXGE15HRs3Hqt/i/LHQ6G0jdjoh7gIWUXdkjS16ygepKbC8DHywqJRA3AE5inLZ5BJ1TcXMhXIGUxDZv+gMA1iUphRVHa44KmbROcftsRnnO+UtlBOkpeFVnxKi03gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783742; c=relaxed/simple;
	bh=QPOu5Bs65GEpHRiDRsFBPrmHqdfKHBuyOO342YIi9QE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ju6nJWWxnYbKGPcp+CI1zn9vMvwcSfHnM4t+LNgN8in8Vtil3gnX08QAWcTbQTsXmKW6YfdW0frQ+Zm+68AxkEzZBGOLVErhODxDPw+1LhaWklX+OLyCrojxfSwsx9z1N5xmVvf+Vq5yJYcU5Ez/qVcqv61IEJaTu4aAkwwhoN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=ZwGXjWuF; arc=fail smtp.client-ip=52.103.33.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="ZwGXjWuF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbqBpPO0grcd6NYgk5iiDYKNIBQKxCfXvaHpxHM9zNg3NRk0cxFrJ8StAYJX6xfkB/o80/rhaUTCsdPTcw7Ui9vwRLLuJFf5PZvyi3QCUUANPrnJhQk3Kk+jiqk1MhxGffO8njUufYJb9+9SebGe2e6D/ju3mXwEL0NORsTQtqTNK1bBmBT8A0KCFfNYlXZ2qGSHNgyGyXBz3GIhVKagTdGBAk6kDn9ls8ZCJCT5e6Rh7a8NLM2IiDHfVhPK+tysQPKdCmCmWMNvx+bZ3Tf88HBBUPLlqjNR82KI5uEDOovDTEfowvagVFuO87qZBCI5NgFPLQwEw1UL3/q801WPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPOu5Bs65GEpHRiDRsFBPrmHqdfKHBuyOO342YIi9QE=;
 b=sLZv/cZ3KQml2YiMDrqwWW07YboAMFJDUlg50cs0Tt/lJZi8xHgBVk+yHWvLAiRT5X8T+6ZRqPsH0qDbSIYO2xxu2d5no5jT6M749Qrscblfz+0HgQ0rezNUZ4DHqFW1U+F8K3KpcmzYwwhUc227cd9KdOWqoDMtecfGw02x2GcMG777HDHGO+9ExR5kaAY288+rqKAYaOUiNLBRLAr8CrX95doYbQ0bTnstZVX+/R4XDO1IcE8XEhBF5WIqqFkYwv9aZ9vDIaSzV+hs5a3Y+QIt3pKLhBdWfFppANFEIeEH2tqVffo8H3YIUl2s4XGxIt1FpG7fy3/n9c867UsOgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPOu5Bs65GEpHRiDRsFBPrmHqdfKHBuyOO342YIi9QE=;
 b=ZwGXjWuFZLHob3QFLARtfgcEaLC6QN795lF5gLRFz336VtBKvqC7TklkkXiF+Ayjt+M/aQd1Tl2WQ/6fLyWPKZAn8+BX2OkU1icNTfaZTmBbJIInFGWN9zVYxVoEU2wueoiSKbTaaKhK7oDfRgC5gx4ka3SA7HcXFTU7OQlrEMZNEZ+j1wXoYzgFjkx0ETHGNhsGOLhEXaRB/Vrl7SvzaPu9Lo9e/62zBqNxaxAtZxYcARSwr+LshRhKxRnJNJrgl2yIesHU9orItqfk/rZgQokq6pFcODiub0QT839fk+kXcbwmRo4OSqc7pKeB/RvXt93MRqYbMI0te5lXSvq6uw==
Received: from DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:46::29)
 by AS4PR10MB5318.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 19:02:17 +0000
Received: from DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b098:308e:73ed:c664]) by DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b098:308e:73ed:c664%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 19:02:17 +0000
From: Mohammad abukhader <mohammad.abukhader@hotmail.com>
To: "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"david@davidgow.net" <david@davidgow.net>
CC: "raemoar63@gmail.com" <raemoar63@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kunit-dev@googlegroups.com" <kunit-dev@googlegroups.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] kunit: tool: fix _list_tests filtering wrong variable when
 list has TAP prefix
Thread-Topic: [PATCH v2] kunit: tool: fix _list_tests filtering wrong variable
 when list has TAP prefix
Thread-Index: AQHdI3qaTFRpSiYJAEmys03MLxrlpw==
Date: Mon, 3 Aug 2026 19:02:17 +0000
Message-ID: <20260803190059.36491-1-mohammad.abukhader@hotmail.com>
References: <b8f72a24-c280-4a67-90c0-4194a81a724b@linuxfoundation.org>
In-Reply-To: <b8f72a24-c280-4a67-90c0-4194a81a724b@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR10MB2249:EE_|AS4PR10MB5318:EE_
x-ms-office365-filtering-correlation-id: c64db0cf-1bd4-4680-3144-08def191bccc
x-ms-exchange-slblob-mailprops:
 30ekHghIwFoGqEgxaY/OAvK55SjXyV7lqOAsZ64tpUdj2IPPDSrAGteR6a9UZ8UmLs1oJBFN9L9aJh1Pvb8kJx9jEjygL6yA278Yy4m0ZICBkeArOt0dUVeHFlfrN2QtBhL16Jtp/qm49qz3gMt+W0rKe9Km185C5mxR4cbnp03c0mdc/1Ez9ziWx58xy70X6zADd93bQsbDgPj7/t/V77J4SkWT67iEN2Wqp75FxYNX521Yf9QOjuEP/0PNYhPY4SxT9kWgCB5BO+/dAP+yf78ueUoa4xOKbsqEdDNi9eAVtAdKl7Cmtd7ZIhafXNB3vTrUgBbJL/jrfH4A6O+G0t8TWV7B/FgDZkw5zSQhz5cN0KqksWQg4n0fNZYZ1Z8vQERbWhaCKlKzpC323CzM84ZtpDKf5W7GsfWXvUja1J50GEi8InK6wxaUDI7Hx5gTk2tNi6/ljiDkFnOWBmLHApeP2gJ0KIzyrLxEf5Q1pot0RX0Zw4yh99oAt19PMb5wRuo1bpWNMa9a0Uzo3ZN0De/N8bLUnQBEyKmZ/BLjLIZg4VZ8pZ4kDzSgugTKAKdOjZ1DaFDTD+Mzi/swCYsbSh8cuOEZDYjFnGguvwRUVHQuaaXmFYxf7IYjHamHAUh4SDg+1Em13wvpbOpEMUY1TICR9rFcmllqyoofOGBNFFY50iTIdLurpKB/tbG+Ph1LDT/xyNIbDWHUDHWjwnJKVuRACrpheM4LN4EMLjJjISGtr5tAjJF6sqibbPiiDaBl
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|15080799012|51005399006|38102599003|25010399006|41001999006|25031999004|31061999003|8062599012|8060799015|19110799012|440099028|3412199025|102099032|40105399003|2607281247196008;
x-microsoft-antispam-message-info:
 =?utf-8?B?dE9Ia1JuelRUYW9Sc05aUWRDRjFaQVFnbkZHZU1HSUlEY3E1eFRUQUxxZTla?=
 =?utf-8?B?WFdib3RzTDZuRFZ6NFRGSW0wdWF4dC96MHdWenh6Rkl5ZUFiN2hDL0N3V1Q2?=
 =?utf-8?B?SktOaGdvNGY1RzY1ZFBieUc1cmV1L1dOZUZyWHE4RTRmekFMS0xtQXBKZFZ4?=
 =?utf-8?B?cW8vZ2tpcEplaHd4YjhPOXpleHlJZW5lcDRNcEk2NFJnWFcvS2M2ZUxnZitu?=
 =?utf-8?B?QVVUUXlhMkFhSlowY0hiRngwRkVDemxrejJFSWpVZXVqZDg4NmVabXRVY1F0?=
 =?utf-8?B?RktIZWdDNFJkdGgyb1dxa2RVc0pkTUg2Qlh6Nk94bnN5U1Z1UEF1V0JZbHJK?=
 =?utf-8?B?NThLT3NaaEU2UzMwUW85VGU2L2xQUmFJa2VUeWhmWEYyUW1uZ3JJdFpNZHFa?=
 =?utf-8?B?cFIyNFhOMzZhZUpwL2RlV3FIRFg5a1hvYVpQeXQreUVuK040UWc5cnVEVDB0?=
 =?utf-8?B?VHRZN0RvT2I1dmR2R2VTUWZMcS9kYkZJSm54aWE3NTR1bVFtOExyWko4WU16?=
 =?utf-8?B?aFZXRTF6N2M2STJMRkEzcjM1UklGZlIzbnNiZWc3a2M0bVRQaGZCWkc3ZlVo?=
 =?utf-8?B?amd6endwaksrSXYvdHVCZFR4Ylg5VVl0cVNRYjR2V0VMTlZ2Qm0vOXhpQkpV?=
 =?utf-8?B?Q1pXelU3eXhRVVBuc3lnQ3FPRFBQM29vUU1UaGw1SkY3YUNuY1dpRHlwMC9N?=
 =?utf-8?B?SGZFMk9YR05BbWg0bURLb2xnRnhXcFNmeG5jS29yemRGQndYbDJ5TWJhajEz?=
 =?utf-8?B?RktJbHNqdk5neDIzK1lvd3E4K1JpN2FuWWhCZmpGQml3aThzSUVSS3pVenp6?=
 =?utf-8?B?Ui9NbC90aUJuV1pKbFNxeFZSSzR6TDFFWHFCdEpNQmE5c2h4UGdLYVRDeklP?=
 =?utf-8?B?eWhWeTYwKzl2VHNLbC8xVWJOeHkrQi9VeTMwMTgzSUZnMTdLUkt5YmxRcndL?=
 =?utf-8?B?aUVKNSt3aGh5eW8rMGtXcTZVK2RvcTMvbitveXNORDVSYWo2VUZDOHVQZG1R?=
 =?utf-8?B?R2N1OUw3TXNzODlJam5wR050VENnS0pjdi94NnNYVG9YNW0yWlhGM0IzWUFs?=
 =?utf-8?B?WUlzVVhneTk3S2tiYVVNTkhNL2JQUlVlU21CdDJMcCsydThFK3NFUUQ4Wmhy?=
 =?utf-8?B?UXN2Rjh2Q1ltTjVjV0J5eTBLN1hUVTAvcngvS3JvQ09COGZIQzdXQVVxYjl5?=
 =?utf-8?B?bFdIak9EWHVCbUFvVlZWZUJEaEt0MkZaRVNkYlFzamtPa3BXa2xobEcwUlBJ?=
 =?utf-8?B?YUJvWkZKQTdSMEY4ekVHbCtISlhJWGNRTzNqV25NbXhTWjZDOGpXTVVCWW1S?=
 =?utf-8?B?Qi9nNEhGek84cGhENTBmWGZKd1RwOTB5UG1iNWMwc24waFBMWEttWG5wVnRL?=
 =?utf-8?Q?VqsEUxz34vLYDTzleHehwBM6+8mE93Oo=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFFhYVFVSXhUb08rQi9qakhLS2xCYytYb2wzZUZJeG1YaTc3YWdJMk05WHBT?=
 =?utf-8?B?QThvMHZhSVpzYzYxcWZlVjVKZ0pIZTZGOXRwSG1BUEhsSkZ6TmQ5cnpRUmhP?=
 =?utf-8?B?YXN2b29IRC8rbXZNQ2M0OVF3eTlFcnJmWEx3M2h3UldBanllWkR6TjN1M295?=
 =?utf-8?B?eGZVcnRYcGRmRlJYUitzcnJjMXU2cTEvUys5VHFxU2ZRRVhqVGFBVnI2YnVJ?=
 =?utf-8?B?OGFNeUFIOXRmMVVlZ0xNWFEwVUFZWjF6eXdRVE5tMEdTUFV3YU5KSEtqalV3?=
 =?utf-8?B?Zm9XclorenhKek5CUWhrUm5oakhXV05yS2hITTdlUmFpemZMUTVZL3kwakJo?=
 =?utf-8?B?Zk5uTHZ5VUdlakN6UEN3ekViWjduOVlyRVRZcVBCRW4weGdYVHFaYnQrQ2h6?=
 =?utf-8?B?SnF4TXNGNGlsSG5LQ0JWcnludldtdE5GSHZDOXE4RTZ4WjVXaHk5b1pHRkM5?=
 =?utf-8?B?c2hPTkJGR2tnV1h0dVBCMVF5WlpPNURjOE1CNmpzR1BQcmI2R0JXbmJFMVM5?=
 =?utf-8?B?cW4zVmp2M1p2SGRvU3pTMi8vR2grZm9oK25zWUdKczVPTktUL2pxbWJFbTB2?=
 =?utf-8?B?RHZwMWRzVzNaeFZNZmZadmZCSUNrV20yeGJ1NlZ6RFZlaGoyOTlYb0VjVFlS?=
 =?utf-8?B?d01SQWxDR25jTzdZSlZHTEl2QkFFbDg1RTA3TGJRdHhlcU1EMmlFOHA5N1VW?=
 =?utf-8?B?ZlZiMUpjMVJKaE1laVc5Z2ZRRU16bUhhbzVVNnI1NSt5NkVGeDNpVzFwVVEx?=
 =?utf-8?B?QUVKVzNCZkdqdEplRTlMRUN2eDVwSVJDbzdWSHlTTGJJR3VTL3B5bnVheCsy?=
 =?utf-8?B?eVNFUFp2aG1tWE96RVA0MTJwZjhTYWJBYlFMWEhvY1NiMzBqZzlENE1qcTZN?=
 =?utf-8?B?UzRuYnI3a1FJSUQ5b0g5dWZwSVdrbGxMbXd4TnhHdnhLYVN3Yi9KS3BvdDJs?=
 =?utf-8?B?c2dTRHJmb0hvdmg0QlMzMWNFaXJkeFlkbVBHd1RxbXpjL0ZOMUR0b3pSM2hE?=
 =?utf-8?B?QXJDakpGMy8xL25hclFTeldEc1FtbFQwd2s5Y3pqQm9QM1hlSzlqQXdZSDJt?=
 =?utf-8?B?RFN6ODFybFVGTFF6QlZrcHBkSkh0YlZwVUJ4Zk1ibWs4NVY4WFNvYkVoZkRH?=
 =?utf-8?B?UGFtYS9BY2s3SjlybEl2RlZ3bXBzSzRFYmNDSUc0YU1KTXQ4RC96dEkxU1Bp?=
 =?utf-8?B?bnFUTWo4N0J5WThZOFl0RmRvdVhGYlV2UFRiT3dnUzRZNnV1TzgyTEg1TjJ6?=
 =?utf-8?B?eFo0Q0gxMTBFd0E3ekYvbnI2RHFZenFybmFIK0Nwc1lSWlJFakVYZ0lPSWpt?=
 =?utf-8?B?ZHpRUUJ0MVdURGtWM1JPT2lrckhUMmxRQVl5L0pvZmVpaGF3NDlRR0VMYUtn?=
 =?utf-8?B?UGhTSm15U3lTdXlPT2U0b2J1S1cvK1NpNmVWYXFCd3YrN1pwd1dNSGhlbE5o?=
 =?utf-8?B?Rmw3SXQzeFNSY011cVlNY1JYeTByMzlmVUlUd3FJYUp4M0xPVEhncm5XeVhI?=
 =?utf-8?B?WFdqQjVjK3laMEVORVRXWWtPOXc5WHFrOVNwMVVNZTlPY0swYW1UQmJHT3ZT?=
 =?utf-8?B?U1VqZDN3YVo5R3g5anZMcjJHeWQ1WFI4a3JvbmdWWEVwU0Y3Mkd0bXowa01q?=
 =?utf-8?B?TU1sdkRaZG1RZG5udHJCV0RiU0xiYTRtcWJQRFE5TEhFYWE4NEl4ek1JaGdr?=
 =?utf-8?B?QXplK21HZEE5WWNwRUFOOGJ2QkpSSDAyZ1h3WW9kZ0hGM1g2SnZpMHNxTWta?=
 =?utf-8?B?TU9aNXVnUWR2YjVNM0hjY21xWFhDem52RmVZa1dqcE1UVGxmMTN6SUsxLzk0?=
 =?utf-8?B?U3ZPQU5rdHVQTGNwbTZ5T2EwM3hrTFR0amxYazNJeE1UU1VjUUJhdUM3SWhk?=
 =?utf-8?Q?/PU6UT1yi+L1U?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-d3deb.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c64db0cf-1bd4-4680-3144-08def191bccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 19:02:17.2637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5318

RnJvbTogTW9oYW1tYWQgQWJ1LUtoYWRlciA8bW9oYW1tYWQuYWJ1a2hhZGVyQGhvdG1haWwuY29t
PgoKYF9saXN0X3Rlc3RzKClgIHJ1bnMgdGhlIGtlcm5lbCB0byBsaXN0IHRlc3RzLCBzdHJpcHMg
cHJpbnRrIHRpbWVzdGFtcApsaW5lcyB2aWEgYGV4dHJhY3RfdGFwX2xpbmVzKClgLCB0aGVuIGRy
b3BzIHRoZSBkdW1teSBUQVAgaGVhZGVyIGZyb20KdGhlIGNsZWFuZWQgYGxpbmVzYC4gIEhvd2V2
ZXIgdGhlIHN1YnNlcXVlbnQgcmVnZXggZmlsdGVyIG1pc3Rha2VubHkKb3BlcmF0ZXMgb24gdGhl
IG9yaWdpbmFsIGBvdXRwdXRgIGluc3RlYWQgb2YgdGhlIGNsZWFuZWQgYGxpbmVzYC4gIFdoZW4K
dGhlIGtlcm5lbCBvdXRwdXQgaW5jbHVkZXMgdGltZXN0YW1wIHByZWZpeGVzIChjb21tb24gd2l0
aCBVTUwgb3Igc2xvd2VyCnNldHVwcyksIGUuZy46CgogIFsgICAgMC4xMDAwMDBdIHN1aXRlLnRl
c3QxCiAgWyAgICAwLjEwMDAwMF0gc3VpdGUudGVzdDIKCnRoZSBhbmNob3JlZCByZWdleCBgXlte
XHMuXStcLlteXHMuXSskYCByZWplY3RzIHRoZW0gYW5kIGAtLWxpc3RfdGVzdHNgCnJldHVybnMg
YW4gZW1wdHkgbGlzdC4KCkZpbHRlciBgbGluZXNgIGluc3RlYWQgb2YgYG91dHB1dGAsIG1hdGNo
aW5nIHRoZSBiZWhhdmlvciBvZiB0aGUKYWRqYWNlbnQgYF9saXN0X3Rlc3RzX2F0dHIoKWAgd2hp
Y2ggYWxyZWFkeSByZXR1cm5zIHRoZSBjbGVhbmVkIGxpc3QuCgpBZGQgYSByZWdyZXNzaW9uIHRl
c3Qgd2l0aCB0aW1lc3RhbXAtcHJlZml4ZWQgaW5wdXQgdG8gdmVyaWZ5IHRoZSBmaXguCgpGaXhl
czogNzIzYzgyNThjOGZlICgia3VuaXQ6IHRvb2w6IEFkZCBjb21tYW5kIGxpbmUgaW50ZXJmYWNl
IHRvIGZpbHRlciBhbmQgcmVwb3J0IGF0dHJpYnV0ZXMiKQpTaWduZWQtb2ZmLWJ5OiBNb2hhbW1h
ZCBBYnUtS2hhZGVyIDxtb2hhbW1hZC5hYnVraGFkZXJAaG90bWFpbC5jb20+Ci0tLQogdG9vbHMv
dGVzdGluZy9rdW5pdC9rdW5pdC5weSAgICAgICAgICAgfCAgMiArLQogdG9vbHMvdGVzdGluZy9r
dW5pdC9rdW5pdF90b29sX3Rlc3QucHkgfCAxMiArKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcva3VuaXQva3VuaXQucHkgYi90b29scy90ZXN0aW5nL2t1bml0L2t1bml0LnB5CmluZGV4
IGFjM2Y3MTU5ZTY3Zi4uOTFkMjM0YWMzYjU3IDEwMDc1NQotLS0gYS90b29scy90ZXN0aW5nL2t1
bml0L2t1bml0LnB5CisrKyBiL3Rvb2xzL3Rlc3Rpbmcva3VuaXQva3VuaXQucHkKQEAgLTEyNiw3
ICsxMjYsNyBAQCBkZWYgX2xpc3RfdGVzdHMobGludXg6IGt1bml0X2tlcm5lbC5MaW51eFNvdXJj
ZVRyZWUsIHJlcXVlc3Q6IEt1bml0RXhlY1JlcXVlc3QpCiAJbGluZXMucG9wKCkKIAogCSMgRmls
dGVyIG91dCBhbnkgZXh0cmFuZW91cyBub24tdGVzdCBvdXRwdXQgdGhhdCBtaWdodCBoYXZlIGdv
dHRlbiBtaXhlZCBpbi4KLQlyZXR1cm4gW2wgZm9yIGwgaW4gb3V0cHV0IGlmIHJlLm1hdGNoKHIn
XlteXHMuXStcLlteXHMuXSskJywgbCldCisJcmV0dXJuIFtsIGZvciBsIGluIGxpbmVzIGlmIHJl
Lm1hdGNoKHInXlteXHMuXStcLlteXHMuXSskJywgbCldCiAKIGRlZiBfbGlzdF90ZXN0c19hdHRy
KGxpbnV4OiBrdW5pdF9rZXJuZWwuTGludXhTb3VyY2VUcmVlLCByZXF1ZXN0OiBLdW5pdEV4ZWNS
ZXF1ZXN0KSAtPiBJdGVyYWJsZVtzdHJdOgogCWFyZ3MgPSBbJ2t1bml0LmFjdGlvbj1saXN0X2F0
dHInXQpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF90b29sX3Rlc3QucHkg
Yi90b29scy90ZXN0aW5nL2t1bml0L2t1bml0X3Rvb2xfdGVzdC5weQppbmRleCBkYTg4YzNhMTY1
MWQuLjg1YWUyMTc1NGJkZiAxMDA3NTUKLS0tIGEvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF90
b29sX3Rlc3QucHkKKysrIGIvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF90b29sX3Rlc3QucHkK
QEAgLTk3OSw2ICs5NzksMTggQEAgY2xhc3MgS1VuaXRNYWluVGVzdCh1bml0dGVzdC5UZXN0Q2Fz
ZSk6CiAJCXNlbGYubGludXhfc291cmNlX21vY2sucnVuX2tlcm5lbC5hc3NlcnRfY2FsbGVkX29u
Y2Vfd2l0aCgKIAkJCWFyZ3M9WydrdW5pdC5hY3Rpb249bGlzdCddLCBidWlsZF9kaXI9Jy5rdW5p
dCcsIGZpbHRlcl9nbG9iPSdzdWl0ZSonLCBmaWx0ZXI9JycsIGZpbHRlcl9hY3Rpb249Tm9uZSwg
dGltZW91dD0zMDApCiAKKwlkZWYgdGVzdF9saXN0X3Rlc3RzX3dpdGhfcHJlZml4KHNlbGYpOgor
CQl3YW50ID0gWydzdWl0ZS50ZXN0MScsICdzdWl0ZS50ZXN0MicsICdzdWl0ZTIudGVzdDEnXQor
CQlzZWxmLmxpbnV4X3NvdXJjZV9tb2NrLnJ1bl9rZXJuZWwucmV0dXJuX3ZhbHVlID0gWworCQkJ
J1sgICAgMC4xMDAwMDBdIFRBUCB2ZXJzaW9uIDE0JywKKwkJCSdbICAgIDAuMjAwMDAwXSBzdWl0
ZS50ZXN0MScsCisJCQknWyAgICAwLjIwMDAwMF0gc3VpdGUudGVzdDInLAorCQkJJ1sgICAgMC4z
MDAwMDBdIHN1aXRlMi50ZXN0MSddCisKKwkJZ290ID0ga3VuaXQuX2xpc3RfdGVzdHMoc2VsZi5s
aW51eF9zb3VyY2VfbW9jaywKKwkJCQkgICAgIGt1bml0Lkt1bml0RXhlY1JlcXVlc3QoTm9uZSwg
Tm9uZSwgTm9uZSwgRmFsc2UsIEZhbHNlLCAnLmt1bml0JywgMzAwLCAnc3VpdGUqJywgJycsIE5v
bmUsIE5vbmUsICdzdWl0ZScsIEZhbHNlLCBGYWxzZSwgRmFsc2UpKQorCQlzZWxmLmFzc2VydEVx
dWFsKGdvdCwgd2FudCkKKwogCUBtb2NrLnBhdGNoLm9iamVjdChrdW5pdCwgJ19saXN0X3Rlc3Rz
JykKIAlkZWYgdGVzdF9ydW5faXNvbGF0ZWRfYnlfc3VpdGUoc2VsZiwgbW9ja190ZXN0cyk6CiAJ
CW1vY2tfdGVzdHMucmV0dXJuX3ZhbHVlID0gWydzdWl0ZS50ZXN0MScsICdzdWl0ZS50ZXN0Mics
ICdzdWl0ZTIudGVzdDEnXQotLSAKMi41NS4wCgo=

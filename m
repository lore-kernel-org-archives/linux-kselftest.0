Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284236;
	b=ptszc5Otg+YOojv+x0MdXcdXaKrnKV95GtXue+6kdPVH2l8GYFPNLik9ptueH7tHDUs3
	 7zjra3UY40JjTIhV8CsirX+1kTcntQaH+TYyiy3yJ+MiCXZzkn8N05S/eXSqXjEPyh+Gn
	 XEsqjCYWwDyn3aAQY8zJuOysh4e21+wUk+3TfwvlYzNSalnVEbWCl4Y8B8gaAhyzDNJm3
	 qecZzdUK1UYbxGsuwagXnVMcmBU2WdJZXTRItRO0RRcfHmJhhU5ZzAwHO8rSBoJt/Z/Iw
	 kPpWqIbkbmyoi721H8fCP/g8SIFY3GCUuF+QxOFJ2wyFMAubJJYx7dzjF3GFx7gmgTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284236;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
	bh=6Ou2KQScLR+ree5r7nXVjEUYW1dc4TmsWAtIPmp/6f4=;
	b=HtrG4y7o9aI7valWT9acpSh9ZArwzT8F8NEybTEqCAQDCgEDTpezotmbD4pe4k0sPbgh
	 OYzWVmyg2p92xRtY5pbBnv59zsijgd6p1F1+TNL6vNx+PQOsYTi7vH5V8Z+Xwb0GBBSOh
	 uDry07ybG3rZSv82ZQmInXBDDNYn2ZveJvBNzogXN3qh4y/DLdYmZ7ESYf1UKExIkamzz
	 9WXKCo5xQAYivyk2O9KLCg95Yy+/+FEKriennmlcezjc6euQvegybV0AQQ1wxN9i2GIUr
	 L6uwLExuuEDpjuDmKY2QmPn+pR/UzEqBPwuuozpJZJ4O2k6Utd80jCU/ykyOFWGM7gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=RsX5mQB2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.32
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011032.outbound.protection.outlook.com [52.103.12.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED75606A31C;
	Thu, 29 Oct 2026 14:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=RsX5mQB2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boqHJEQFiE6kDWVYFRtGxJl2V+22Ul2UcUSmOhNgrs6hbRCXnTWDai6xOzyE8dNF2Hnd6LqGSNXuzU4dXw/dLkiozNCO7uhIz57loDSZLOh4y5y8eyFRwnU/O9oOu0mXz23tvn71sgIRWGmFY/VfNa+CtGbkbgGOqGxUwqHEu3YMu6WCU0xSFytd08qQNPlzjHpMnBa2u4MzizVKcdVg/9Zvkbj4/Plnuq4kvyCGmOLuzAnTM/BNHo9sXrswIWYKdkL8jKOZhs/7wQqkU3BPvBF8tgC1APiyJXfVLka8CC1da9xKmzjnYETK39dqfErPgkKMftora8fiUlluHSkyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=6Ou2KQScLR+ree5r7nXVjEUYW1dc4TmsWAtIPmp/6f4=;
 b=U4NFoqaAAH8Ipswc/jBYzF6NIKwlmf2H1dGqosC5JQHBJr6GjVBIcsteDOr0IQmwm7AtB9zLkgk+CL8z51REVcveh6jjovoFCcm0kYKBLX52Cp0M3Vm3qm1EUljQiAkJDr+G6VHhfqyO2Jo0y5z/L31zfrhYPqjg90AWGf5IufrUEtdeksYHhpNT90YdtJFS3lGJc9iHJ9l97UIZHdnhnTrvjncWp1ECV1L3JPTGY8/9HBSQMEQXK8BD1CFiDtBYkAFn3w7R6RgNtEKeksXw5Dwucu8t+i1g2NqdN1MzvWQZlGeieqZT6MuhPnhYZnbF2cTiA4TPjs7csIXxvbf70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ou2KQScLR+ree5r7nXVjEUYW1dc4TmsWAtIPmp/6f4=;
 b=RsX5mQB2srwsAtEsy6vHXOh4KB6WZQt0N2vB9r+2NtD0p8EhoKRoB/sBF6jzKesx+y3+bSih5EXdQr6eYkC9VOojtQMb0jjZj18m5T/eanGsE9yvjhvXvu6Ynyhqv46RrzFSssvRwxlRkbWzoXCowsjgscbUYdmhCBUh27exO2b+O2ZPodRuBEaaG7BOxllIrENBu1Og3zXiKPvw/Hg2OHogOZu3aggMgJFAFRlQC/wJ/9WGp2iqWSdWBi0FS8cQwS1YbVE+ZPcyxfrqeOajEqflnxMPEG/HURSCmo5ED1zRPXuViCyNU1mTfXcqsCmUInPn1KuFSSufWvRBQFEvFA==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by DS6PR05MB587169.namprd05.prod.outlook.com
 (2603:10b6:8:52a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 14:30:33 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 14:30:33 +0000
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
Subject: [PATCH net 0/2] ipv4: preserve devinet inheritance after unparsed
 writes
Thread-Topic: [PATCH net 0/2] ipv4: preserve devinet inheritance after
 unparsed writes
Thread-Index: AQHdZ7IOfZoVE0Fue0iudrbU7U0/SQ==
Date: Thu, 29 Oct 2026 14:30:33 +0000
Message-ID: <cover.1793283257.git.x-professor@outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|DS6PR05MB587169:EE_
x-ms-office365-filtering-correlation-id: 67ab8892-bf54-4c1a-e3d5-08df35c93109
x-ms-exchange-slblob-mailprops:
 Cq7lScuPrnrlC5lHdFGci+YUsdS3F/CI+koslDnSkHKPMLHBKDRXOtYuhguS8Wu78OjASovssZmXRdtj74sRrg14yTUo6ON66kjCH9DzPxMzlVMHe7fj6XT8oYRxqPX63rdxi+1s5pmJQMlihNvDAotRRPX4N2zI+Y1yA+/BCPOobjtmTUVbzWcZLKI0/jBGIXOdVC+hrXG90HSXAYFCaPIJ1KrUYj3Jg+bbKk4P7N66hM3dGx/lUL/8vpyqViM3H4D8pxp8+pSy2XRE59P0qzyFXEDl/aarwe0St1u7RhSNTw2wTxLJD2GqWxThdnfw1Wftbuk0+3xY13Cyq9RqByv14ZEE/2nM9rJ3YD/jLxLxpnofZaridiOqEWGGamRIPyxF7yH6dLOqrXliMEZUMyfgLjMvT3u2ctJKQPHDT8wVe8xCyYyGcYioJR7oHM0T79G8PvEV3eVgxLQlWoRnVOCxvt+TPthv7i15I1l7PokMs3RP+rjJCNv47HLemW/KlMwpoNLmJijjgO1mJzBSFkngBpob3bqoliY+90iq05P1tbqTkAKC4TbMKzQL6BlNtkmm0po3LuIFajaGdBjyiGTl3qGTcHXXWRrK3wZUH4wrl2e5vYuBwlq0863WC8lzc2aVl1Cqh7DPi7vSP0/NbhcY6oqP+IKsmSq2E/66BeklJKZB9W+rTjE+Qey2cKxWr/5H3XeMtnTFsnO1cMeGYtGYpKbt1cXXGcx1qFAY6VNDiU6RftO9xTXlTRc5l4/c3vxU0GYPk/c=
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|19110799012|25010399006|4140399003|24121999003|8062599012|22091999003|8060799015|38102599003|2604032031799003|31061999003|24021099003|26121999007|40105399003|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ulk1WCtISHdsem5SQ2l4S1FkUVNKKzYrWjd6ajlNM3c2Wml3YXJyWTJTUVdQ?=
 =?utf-8?B?S0JZNG9oUENHelQ0YUExZ1BCQ1NyS0EveG8wNnRja2NtRmxKVW4wUkxYQXlz?=
 =?utf-8?B?U2o4UnAyblJ5aXhwMUZNeW5ReW9XU1FDUjBSQzVobm9MbEU2Zy9wQzZkUXdE?=
 =?utf-8?B?SDZlVWswWlNSaTNRbnNlb1F0WGZxenN2Tzd6VVZ1ZXBqUmVNV2RXWktKVkhl?=
 =?utf-8?B?Sk95bTEwVkNVWXpuMHpSczJRcTZ1T3JEVisrRG55aU1jOTQyVHVZMVZxbGhQ?=
 =?utf-8?B?N3daczAvVndpOXd5KzVRSzY4VjBkZmZucm5BUktHZTVsZDhaeXNqT2RkKzBz?=
 =?utf-8?B?ZDNFT21FNy80VytwRVBaVG9LYy8ySzhRbzEzTVQ0am90elFVaDM0VlVXSU1o?=
 =?utf-8?B?alN4T3hSRGRQN3FvcDl3U1JvVEo2MTc3bll1ODE3dkYvbHlmOUI3OFBNdUZk?=
 =?utf-8?B?aTZyaTkvMGlFa291OEZSQnM4K2NzNmcrRmJRc3VwSCtPUnVsSUFwYllCTFp2?=
 =?utf-8?B?TWJzTTh0N2hqb3ZtSHE5RWI5Rko1L3V4eGZzZmMrbzNPU3hGV1d0cHRqQTFm?=
 =?utf-8?B?M0lucFBqanhaRVoxclAxbEJMNFgweTR2RW5oTGlPdFdZSDFiQkpyZUN4ZCta?=
 =?utf-8?B?cEVPcHR0bGJOUWswT2ZwQ2l0cXV1M3pNcEVydVk4cUU3SlJ4b21nY21leENk?=
 =?utf-8?B?MlBWVEc3T3FZYXR3cG5rOTFmajlETzVLMHUrMkVZR1NaaHNUNko2bnhmUGlS?=
 =?utf-8?B?K1FtbHVCSlQwQnRBNUowQ09sV3hEWHhERVIxRG1HeXdUSkpROVg2eFpFOEtH?=
 =?utf-8?B?VGhBbWNTYjk3Uld4UjJzeVZsZmVQUENodWlKa0hkZ3ZiZHlFdHRJY3VsWWRT?=
 =?utf-8?B?U2hpNjJ3NWRXWlA2VFlodWpYMXl1VGFhVWpMTjZNdG4raTBzd0dCZWJJMjJr?=
 =?utf-8?B?MkpSRmkzdk93ZzZ1dU9GMjhEb2JwLzAyV3ZWTUwvSGRHc0ovWEgyQ2Rramk5?=
 =?utf-8?B?VnU3T3FHSnc1T25WS05IVGhybFQ0V2xpdzdIVTJ6TXp2K0J4U2dFVk0vaVds?=
 =?utf-8?B?WjlVblV6VGsyUGtSM2Z1Q0hQbEVXS0N4VWloQk93MlV4dGo2eGsvbEQ5MXFx?=
 =?utf-8?B?bE1ZSmd1OEFmNW05R1Y2ZXVlZE5TaXBYa1FRbUhheGs1ZnIxc3FPeVl0QVhK?=
 =?utf-8?B?REZ2WHNvRVNJR0t0bk1Rb295VWhlVmdKRXJNQnJNUlZsbllucE44cVczUUds?=
 =?utf-8?B?OUJSTkYxMlo5ZzhsNWtka05OMnM1eUhpSVVwdURsSmsrMUpMOUg0ZUkxbGxl?=
 =?utf-8?B?UW16OGl6MXBLQkxuM1YrazBDZTJMSkZhSXBWd0d1aVRib2tVRXZZbkZiQlhF?=
 =?utf-8?B?c2VUVXJTVkhvVFdwclhCY3BMcUYwSUJtbU9sa1RHSzVlZU9tQU12S3NSdlFn?=
 =?utf-8?B?L3RnbmR5cWk5Wm1WYzhIMEV5N0l0ZXh3andjL0llTEpQZVBLTmpKL0FyYzlx?=
 =?utf-8?Q?6iqH5E=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVBncFI1NllLK1VBVWpiZ3c4NGdtWkJMVVFOeXluQSsvc0prejVRTUI0Q1Jp?=
 =?utf-8?B?TEx3bTY5N2RNUURTV1ZHYjdBNkNHaDBnL0UyZGphWkw1Z1Z2RDlnUnJKYytJ?=
 =?utf-8?B?cVRDNVBzRVFLQlJSUmovOWdHWkViM3VQZWZINGdmU1hFcmNPbkFsZjEvdERv?=
 =?utf-8?B?RlZ0Nmw4UEJ1Mlo5elVCRE1aTDB5YW0xK3BBaDJ5elFsZ2dsRlFBNEJOYnlr?=
 =?utf-8?B?L1ZRdk55WDVGeDk1NmN3aDdxVVp5bzJ4SkNQN3JRSGFNZkNmZDJsWnhrSGxD?=
 =?utf-8?B?YnV2YUxLZ2tqV0I2TzJwKzR3c3R6MmsyZ05HK0h5anQydTBDQWxLSWlRdXhZ?=
 =?utf-8?B?VFh1TWVSTlpJTnVXWHI0eW5sOFFPM1lOQUI4ekhBQTViUlBGL2xKQlJKZlhs?=
 =?utf-8?B?Qit3NTlsQXVyOTlwQmxHTGgwb2ZkUk9OQ2NtTjFkMFJpK0o2d3AxZVhtY2Fj?=
 =?utf-8?B?eVBLTFRnZFJpSnN1K3Jaeit3bUZqMFBrRlVnTmFMcU1IYk1TaTdIYXRZM2hk?=
 =?utf-8?B?OTdxRkdmUEo2dHZIc0tRU3dqZTk2Y3c1NHNkbkhIUkZXNkE5TDd0VDRvaVRT?=
 =?utf-8?B?cmlxZ3NLSVRoNjhZMDVZdHRxSzcrdDVRSytWcVU4dlRpUUxlN3d3czBuREZz?=
 =?utf-8?B?UE9iRm9NZHhLa0dLSGNaNXZpcEJNUmJ2Y2lOQ1p6S2NaME4rZkoxZkdJcU9w?=
 =?utf-8?B?YWovcGpaVGIzZGd3NTl1TU1ibEFjNHJVTyt2ZVlqKzArSHRSY1RDaTNkZ0lt?=
 =?utf-8?B?ZDBWM09kZ2NNdHorcVNDWXN2T1JVNXNGWFRhcUd3NkoxOVF0dFZ3dGJzaXZm?=
 =?utf-8?B?d05WTDFBQ0lOaEtnV1FMdjJFdFZTWkZLSURQQjlxVCtLK0NFeHM5WElpK2Y5?=
 =?utf-8?B?SEg2Zkd6eU83YzcyaTNGRXpVWkd6K0tMUXJDckZaelhxalBraUhPMld1NW1W?=
 =?utf-8?B?UlhKV2xZSnBzUjI3NWdsajVIRlByTGtxbmFUN0VwQTIzR1VFODdaaUh5NDE0?=
 =?utf-8?B?dnQxak9KdmJKaFBqbTNHTnoyZDFxdU02SjFma2dnSlFKSU5NdGE0UTZBK1Bn?=
 =?utf-8?B?SjlsWEFCdnFDWW9zVUk3YjlzdlFGeno2VzByNThITmpFUTNmcnFxaE9Ua3cr?=
 =?utf-8?B?NFBWRHpCYkNkVGYvZkY2OEVkZkdzanVzNjMzRTg4RVduS2V4d3loeFFzQk9Y?=
 =?utf-8?B?bFhScXJqTFhjSGlQRkFwV2ZMWUl6cThXQWxaTyt3OU5YSXkzQ09FV0JuaTU3?=
 =?utf-8?B?SmZCZjdYaUpua2R3cVFsSENXVFRSRGtwVUZadEJweEdXTUp4SXgzYXRpS3NB?=
 =?utf-8?B?dENUaVNXSHliK0Q0bzVFaFMraVorNU9yc2tUZ2pLZktkb2s5djJmN1FYaStO?=
 =?utf-8?B?S2dIOXM4ZHlYRUNmUk51V0laNC9NVnlDT0poRS9VTDdMRXFrY0QwM2hBdUZJ?=
 =?utf-8?B?OXdSUEJaQSt0ZEZ3UVNtMFNVeXJaVzFmdTc5SVNmWVN2b3ZRQnZUcisxVzhG?=
 =?utf-8?B?OWduNTdRak5vNGdoblVmZ0VWMXc4cWNMZFpBaXlicE1mK2J4MktENGgxZjZy?=
 =?utf-8?B?TjhpeWlsUW4zVXNOMUZTeFhldmgvQ2hrWkxDTDdqWldvV1FITGRMTFIyczVX?=
 =?utf-8?B?cldtRGQyNCt2ZHJEMHkxQmRtQjQyUE9GT2YreWpDQTdJYWZicWgrd0JzdXFn?=
 =?utf-8?B?QytqdWs4OVFLU095eUI3K3FHUWpxV0FCV1pkQm83a1RHenRzYm9iTGlZbFVL?=
 =?utf-8?B?VDhNSDhLUStDM0Z1Z3JPaW9hN2ozQWtQQ25DZTE3LzQ3U3VFemNqTWFmeHF6?=
 =?utf-8?B?UXV2VytpaUJRMUtkeHc1OGRXSjVMUy8xUC83K3Y3MFQrTG5LYno5cE1mdmw5?=
 =?utf-8?Q?G0n/iZYCxB1V+?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ab8892-bf54-4c1a-e3d5-08df35c93109
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 14:30:33.7285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR05MB587169

ZGV2aW5ldF9jb25mX3Byb2MoKSBjdXJyZW50bHkgbWFya3MgcGVyLWRldmljZSBJUHY0IHNldHRp
bmdzIGFzCmV4cGxpY2l0bHkgY29uZmlndXJlZCBldmVuIHdoZW4gYSBzeXNjdGwgd3JpdGUgZmFp
bHMgb3IgaXMgaWdub3JlZCBiZWZvcmUKcGFyc2luZyBhIHZhbHVlLiBBIGxhdGVyIGNvbmYvZGVm
YXVsdCB1cGRhdGUgdGhlbiBza2lwcyB0aGUgZGV2aWNlLgoKUGF0Y2ggMSB1cGRhdGVzIGluaGVy
aXRhbmNlIHN0YXRlIGFuZCBydW5zIHBvc3Qtc2V0IGhhbmRsaW5nIG9ubHkgYWZ0ZXIKc3VjY2Vz
c2Z1bCBpbnRlZ2VyIGNvbnZlcnNpb24uIFBhdGNoIDIgYWRkcyBhIHJlZ3Jlc3Npb24gdGVzdCBm
b3IgYQpmYWlsZWQgd3JpdGUgYW5kIHRoZSBjb21wbGVtZW50YXJ5IHZhbGlkIHNhbWUtdmFsdWUg
Y2FzZS4gQmVmb3JlIGVpdGhlcgpjYXNlLCB0aGUgdGVzdCB2ZXJpZmllcyB0aGF0IGxvIHN0aWxs
IGluaGVyaXRzIGNvbmYvZGVmYXVsdCwgc28gaW5oZXJpdGVkCmluaXRfbmV0IHN0YXRlIGNhbm5v
dCB0dXJuIHRoZSByZXN1bHQgaW50byBhIGZhbHNlIHBhc3MuCgpPbiB0aGUgY3VycmVudCBuZXQv
bWFpbiBiYXNlLCB0aGUgZmFpbGVkLXdyaXRlIHNlbGZ0ZXN0IGNhc2UgZmFpbHMgd2hpbGUKdGhl
IHNhbWUtdmFsdWUgY29udHJvbCBwYXNzZXMuIEJvdGggY2FzZXMgcGFzcyB3aXRoIHRoaXMgc2Vy
aWVzLiBBCnNlcGFyYXRlIGVpZ2h0LWNhc2UgVk0gdGVzdCBhbHNvIGNvdmVycyBpbnZhbGlkLCBi
bGFuaywgemVyby1ieXRlIGFuZApzdHJpY3Qgbm9uemVyby1vZmZzZXQgd3JpdGVzIHBsdXMgdmFs
aWQtd3JpdGUgY29udHJvbHMuCgpGdWxsIHg4Ni02NCBhbGx5ZXNjb25maWcgYW5kIGFsbG1vZGNv
bmZpZyBidWlsZHMgd2l0aCBXPTEgY29tcGxldGVkIGFmdGVyCmRpc2FibGluZyBDT05GSUdfV0VS
Uk9SOyB0aGUgY2hhbmdlZCBvYmplY3QgcHJvZHVjZWQgbm8gZGlhZ25vc3RpY3MuIEFuCmkzODYg
Vz0xIGJ1aWxkIG9mIG5ldC9pcHY0L2RldmluZXQubyBhbHNvIHBhc3NlZC4KCmNoZWNrcGF0Y2gg
cmVwb3J0cyB0aGUgZXhwZWN0ZWQgQ09OU1RfU1RSVUNUIHdhcm5pbmcgZm9yIHRoZSBtdXRhYmxl
CmNhbGwtbG9jYWwgY3RsX3RhYmxlIGNvcHkgaW4gcGF0Y2ggMSBhbmQgdGhlIGdlbmVyaWMgTUFJ
TlRBSU5FUlMgcHJvbXB0CmZvciB0aGUgbmV3IHNlbGZ0ZXN0IGluIHBhdGNoIDIuIFRoZSBjb3B5
IGNhcnJpZXMgcGVyLWNhbGwgY29udmVydGVyCnN0YXRlLCBhbmQgdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbmV0IGlzIGFscmVhZHkgY292ZXJlZCBieSBORVRXT1JLSU5HCltHRU5FUkFMXS4KCllp
bmdqaWUgV2FuZyAoMik6CiAgaXB2NDogZGV2aW5ldDogdXBkYXRlIGluaGVyaXRhbmNlIHN0YXRl
IG9ubHkgYWZ0ZXIgcGFyc2VkIHdyaXRlcwogIHNlbGZ0ZXN0czogbmV0OiB0ZXN0IGRldmluZXQg
aW5oZXJpdGFuY2UgYWZ0ZXIgZmFpbGVkIHdyaXRlcwoKIG5ldC9pcHY0L2RldmluZXQuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMjkgKysrKystCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9uZXQvTWFrZWZpbGUgICAgICAgIHwgICAxICsKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25l
dC9kZXZpbmV0X2NvbmYuc2ggfCAxMDEgKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hh
bmdlZCwgMTI4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA3
NTUgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2RldmluZXRfY29uZi5zaAoKCmJhc2UtY29t
bWl0OiBmY2MwMGIxNWNiMjFhNmRlNzY4MjZlNTAxMmIyYzc1ODUwNWY1ZTY1Ci0tIAoyLjQzLjAK
Cg==

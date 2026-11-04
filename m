Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799777;
	b=CKpuCYiejmj6GdfPfY5iYHZG9QWmXlu4fgxDtu/KeEGnsmjvfVxVDDGZXxX302FWUEsf
	 FibotAqy5HVpd5IxKaous/2Jdh+Gezg1OslUWBz0ZlRiQW3Qjeh7MVmUxhwOJHWZGrkeh
	 0JZM9ZY7MyHI0Zv0sb8rRJwnOuoWxNTwlV8h8l/uVhqzvoN117yCubwtzPhW/ud7i0THW
	 eXDptDyYisQqH7/246cNmJPN51rtV0lJQtT3UUa9zrCTT+kM6tKpG5pWIl3MYU6Rzebu5
	 pZQ57lmSL5DEBsB32ohTvRI4rfkii6shqWIICXSohTHvz+43nYv8WpFsnMr0069ZCkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799777;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rnWDLsQG0OWOiJK74iHNz6bNJiK0U5833+mh1wCrx/I=;
	b=3t/sLFEcfBOA0qYBHvfJUAbd2r7S1FLPHp82kBFLQ4Y7sWp7yj+HDsEQDmQsiI6jXXOd
	 sRKddKK9fjbFVJk3tp8wFzYXLHsbe2Q3o/kKe0YWSxdFIsy5kf9NX9OOpqIp2jHHHeWmt
	 gIb3UYv/Kc5S+Dz9A8rX/oGIZuDZg58vXipJa5wPcqrfdKkSczrGGy4tQz/CUpXQGOgjt
	 FrLWdR6rydwBJ0q8C5yB4F4XwAKEcgtgEPb/5KvGHPws+3oyw+S6clsJD5TqLiawrPs5J
	 VSSc642toxMuFysru/2ETLBR6U0pOSsVn2Qu1Qsr5KTLitcWHnOWfaG8ZX0Si2Z1RJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sZ4oD7lu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.16
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0C4606A326;
	Wed,  4 Nov 2026 13:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sZ4oD7lu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhyHXTeiOSb2mC48DY+tUeG4cZhWNYtg+ufqlNy8aiKjACQlGAtHYcHsek33hw3RYu6wisIe6SA2Df7QhwHvHQjvHU5kqmtSkg6FAyuJCu1hXiIvtJyDGEbYTvpIHvhvi7SYDTMMKNv+m2AGgMv43/r+xMaF07ahc+k6ZN7HmsKdbTa59k/3jIM4VJUJgc0xV7HlUJESeSsj6W4AERuHkVuuuSueMrsPL7tyXMCopdz5Fj6AwRt15BImqz6+3pKUul3MwE83lXDmpTXNe78paeHlcX/Dma7AuLolVjkLRc9oA+4Wrt7dLjRh1dCzLo3RQPPoGvBr30RrEifMHFLfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnWDLsQG0OWOiJK74iHNz6bNJiK0U5833+mh1wCrx/I=;
 b=eeWi02Uj4rCa6h9ha+IWa3rONaFjXhtlwBSWUcoxAz0Lzpfk8kyfdFadJR6C0xZnqmyUDsGOkBm388pEORMiB1lR9DoxWaBrsAx+99s0kHJfHAFiBwJVNNAUkomn9d+yAl8+eKygnMWnj1UdTWZ6gHTB8lEBwqdLFNWq1UwFbSDWsm3rkgmXsS7GBMKBcp+ZzPiN+IpUwkJl33oS3KFuyqa74AG8i0iuq09s9N2jMwsVgE/O7tUEhA8NFY7vNiWHonQCXvWLApFdUEZYcbpRHAFEuQ4JQrcptvn+8CeQ2oFmoAYShRJcMOG6crt2iwbl3Qen5/7WBeTDNgl2Itfu8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnWDLsQG0OWOiJK74iHNz6bNJiK0U5833+mh1wCrx/I=;
 b=sZ4oD7lu73nLD4rFdSF0DhxEJ7Y2o4n2MOkgaXnICErgox26TI0OagAY0034MfmssQ5Twd3bLhGUPt28xzKglQHPiPHBFAoURzWauLw42uWoab8re2RaP31aXmLiOgixk4Vv6iCXNiZ0cL3QmXy5y+W/u1kct267T5nNJx67LWJjKbRyIyRfrOl998u0c3tzYd1ioSabfYQ/7/D/mFq6z0gdfowOjgr1HkdfpmFkuJTUTD7yBAKn4jo2MFVXVdo8/7tJoQy9ELTSkNj629f8d24hBhboeAlo2aR5DDJUvP7KEpqF5qexuUeT5AJk39S4dAYQPWycvlMWE1QnZOyvLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHAPR12MB999248.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::22) by LV9PR12MB9760.namprd12.prod.outlook.com
 (2603:10b6:408:2f0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 13:42:53 +0000
Received: from CHAPR12MB999248.namprd12.prod.outlook.com
 ([fe80::4972:8062:d74e:b205]) by CHAPR12MB999248.namprd12.prod.outlook.com
 ([fe80::4972:8062:d74e:b205%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 13:42:53 +0000
Message-ID: <3a3a9c66-3198-4529-832a-79848bd4cded@nvidia.com>
Date: Wed, 4 Nov 2026 14:42:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 3/4] net: devmem: support leased queues on
 netdev unregister
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bobby Eshleman <bobbyeshleman@meta.com>, David Wei <dw@davidwei.uk>
References: <20261103232659.1340283-1-almasrymina@google.com>
 <20261103232659.1340283-4-almasrymina@google.com>
Content-Language: en-US
From: Dragos Tatulea <dtatulea@nvidia.com>
In-Reply-To: <20261103232659.1340283-4-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To CHAPR12MB999248.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::22)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHAPR12MB999248:EE_|LV9PR12MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: 214c78fc-39ce-4c06-fc48-08df3a79865e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mxd/eXOaWN/HFPi1k0KfesAY9/S5cDxu/STxlPAgk3iQsKlpdF1DG6U0gIoqCmyZ6Yn5ywhVxghReVZmFe1mPj5mh35gPSKJuhwmf0Fe0OaXHoGhl5FUSCovyvBPLbrUR6Kqy/woAB5cglWZgTMzl2CEd4+xJRHBel/K7Y72VaCtOoo+6MyJvZPkoyxxIbOlfBmYZcEqYSq33/kJk+wjb+rI+qwoXH6mduiThk+/P0zMXikHW0q1wCKgotaBmU7X7SBACx1zKj5bN773cC3O/jQwBKhBjWgsnabuhNUzcRgEQwdIpLlzIYVOyQgr+bqdY6hU6DMb7S2bRP7QETXACHj+PWvORc31WDCUDwzesHerIbpsJANozeyinRj52mNDsxZlGX4QUb9yrtXOBWmClhBVRthhISdDP6iD8zhqh6Do47SZhtgM/llfL/rM/+6C3imjH05fuLkKrs/xoi6dOAVo3chqSxjFU+Gtfpw0sA4eUvVAtilFnirO74Nc+muKSN1C88x9YTM8C9/796UgWMof4WpPr4eW9zLwEkjHyjuDxQKuwk4aK63TVCUA9zhdIN0N9FIhU3Z5pWu0H9MJi5a97A1IHX6tSgvQfpZEyQdjbGZUxwfskQoeWmFnI48oR+kZG2EATth4yWZJojUkvI4SDXStQ2cSaApCu10ArJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHAPR12MB999248.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXhhY1BDTzVCUmlQNFBqQnl3OE1nT2w0YWFoVEl6VWtPWXJTbllaNEdlYmsx?=
 =?utf-8?B?QTFxWVNOMzhlaVVsQ0xYZTZiR0U3UkZ6cEs2bnVEOVdLMlBnSmFDN29XUzE3?=
 =?utf-8?B?ZFI3MzhDZjJaa0hGTGZaSkRMcVBPSUFURXo5MFhkS0JtYnhoSGJPWm11OUlB?=
 =?utf-8?B?NVZRR0wyUS9TTE5CNzY1MGlJaTJNR0UrQ0tWckNJR0prQW5XUWNzdEo0QWV0?=
 =?utf-8?B?S2RRRkZ6WFYrWHQ1QjNYSDFmcEI0RE5qMTdseURhWGNmbWNGeDFpdmt4SWxQ?=
 =?utf-8?B?UjYzODlDWjNiRnNUTHcyY01nMlRQTGp6azU1M29HazhqVDF2YlN6MmhLY3k3?=
 =?utf-8?B?Q0pEZzVyOW41dU45aEJ0NzNiT3VYQUFtaEhQOThVZ3k2UTNCaGJkTWtkeUFj?=
 =?utf-8?B?NXM1eVRYWWFMd2ZEcHE5bUphSDBudGc0Sm83Z0JGUHdCQWpZYTdQaUNxcHZm?=
 =?utf-8?B?cTY4d21jckNQTkZnaTJJZElreGVZaWxRVGp5MkxSbDN5VW9HbHpjU3o1Nytw?=
 =?utf-8?B?a1JXRzlrQW1NMlFURlBDdlhXazRJQk9nU0RxMW9VVXVEdmZHVTRVbFRtOFJn?=
 =?utf-8?B?TC9LU21MYUx5cGFXVStnbTk3WGFQWFFwSnhQS3NRMWEwdllSa2xGSit1L3ZC?=
 =?utf-8?B?K28wQ0EycDJTdU5sZERKUHJ2UGxQT2FXZjIvQ0t3ejFZWFZCcDFJT0NjeVhF?=
 =?utf-8?B?cmtERmZFT2FXeFN1Y0NpQXZ0d3ZDSVI1MVRMZE44ZWdiS1JiSVN6S0lSeEx1?=
 =?utf-8?B?R1dWMlpjTk5XTTV3MEZnUDBaUkhHbmdTZFFqMzBpT2xXcVFGUy85UzBCTXdw?=
 =?utf-8?B?RFd1YVpySFkvVkJkME5QQm1QWGVYcUhJMitxMzZuVklaMXRCcStXNmQvY1BE?=
 =?utf-8?B?N21ET1N0R0krUE8rRDRWTlFWOU56SG5QNTNqdHh6ZVpNRmV1ZkhudVcxZUdy?=
 =?utf-8?B?RkdZeFFCWEoxdUY1U2pWSDQwaEgzYTBRbEQzTXZLZnhzcXhWT1J0dzFPOHlB?=
 =?utf-8?B?WiswUUh5VSs0NUdLa21FS2ZzaXZMdjYwZTRWWEdTbWxHUVQwMGFhNWtycXV1?=
 =?utf-8?B?dU5EQUR0MDBnczdvRnZpQnpGV3lTR2VVVXFYTm85Q2JpM2NVNTl5MStmc2VB?=
 =?utf-8?B?ek5UT1I3V0pTT2lGQTQrTWREcjJobUVYVEk4RUpvbEo4dVdyeWZ3aC91MmdH?=
 =?utf-8?B?UEt4WnhKN3pQcWM3QzAzK3ErT0RIS3VmeDN5ZVZQWG5BZ2hYY3BLT3JTSTRj?=
 =?utf-8?B?TGFvZFRBcVREbGVMV2FPQ2haTjBFdDVyTks5UmdZNnU1ZnN0SmQ3OE90Uk1I?=
 =?utf-8?B?UTd3VG5kWlBpWUFUR1VxSzVVaURpczhnZkZqQW45NWRkV3pFemVtbStISDUr?=
 =?utf-8?B?dm94V3hHcnJZc1orSGZ6OFNzVGk4K0I1VzVGa0c1WFR1TmwwZlJuc0pYbmpD?=
 =?utf-8?B?d1A4OUp4eFgzaW02Vk1OZDJtZmpheC9UTXk3clgrcjZ2eFJhYUlnVTArLzhO?=
 =?utf-8?B?bkM5YzlKOTNSM0RibXo0b0l6UTh0SUVtK1ZkSTRUblMxcjFzdEFETlJoVFkx?=
 =?utf-8?B?WGdtNDVSeXlhRXl6ZE1YbzROTXpSTkx3YUpCSzc3S09Fck8waEF5VkozdnVp?=
 =?utf-8?B?enVnMVZnRHZCK2UvM1VyK3VDN0Z3U0ZwWFNQbmU1RzJaSnUybXRIRDNHMUdC?=
 =?utf-8?B?ODU1amlKdnNiQWJoNkU5UnprOW95MTFrSURBcmFORm4yTWdKK3V2OVVBNmdU?=
 =?utf-8?B?NG15Mm5Hbkt0UWN6LzZ3dnl3VE1oSTZHb3FsbklHZ0FQQ2xhaG5JTmN3TlpO?=
 =?utf-8?B?ck1aNFpPQzhLYmRuUmFqdFVOeWNuaVA0ZEpGbTUyZFl5L2FMR2VCenZXMmd0?=
 =?utf-8?B?UE9meFB3ZG1sa1d6S3JJeUx5Wi95VW1yN09UbDBhNVo4cGhnRnk0WW5PN0tW?=
 =?utf-8?B?UTZ1SUJSdE1sM3BjNkh4TVc1aitha2UzemJFY3MvN092RkxxeURhWVo2YUN3?=
 =?utf-8?B?WEh0SmlTT2VVNklYa3B5S0FpZExCWGlRWlF5YjBCdWVGbS9UZHNvM2JWRXB2?=
 =?utf-8?B?eEp6ZHoxZmVsQlMxczNtOVNSYkNvcGJKNW9TTnUwSTJ3TC9XVXRvbGdxem1E?=
 =?utf-8?B?dVJDVjR2RktsNXlleXV4czNVRklFejV3Yy85RUoyZDBJR2FqTUsvRFNZaGU3?=
 =?utf-8?B?NVhIRjhlS284RmRRUXpvM3ppT3BMZWFOOHBJUktiRDlsTFhBVGN5RGJlV3lI?=
 =?utf-8?B?c1NST3NaU1dpZmtuSGtkV1E4bXFGekVRSzhmOHRRV2ozalB3U0h5TnlXOUVU?=
 =?utf-8?B?OW9Mbit5OXhrb256TTZwTnRVdDlxZFd1a1N3SjVhazBJb2o2dUlkdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214c78fc-39ce-4c06-fc48-08df3a79865e
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 13:42:53.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to6vfNu5YUdZvRpdoEK+eAtbktwt54AONsZOtiy1GhByRMlSxDsoNdPBfBn7cigwENxxIANUsVckMGhUiFenJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9760

On 04.11.26 00:26, Mina Almasry wrote:
> Previously, bind_dev was only populated when bind-tx was called on a
> virtual netdev (where map_dev != netdev), and leased RX bindings stored
> the virtual netdev in map_dev without tracking the physical backing
> netdev at all. Unregistering either the virtual device or the physical
> backing device while a leased RX or TX devmem binding was active failed
> to detach the dma-buf cleanly.
> 
> Always populate both device pointers on struct
> net_devmem_dmabuf_binding:
> - map_dev: the physical net_device whose dma_dev holds the DMA mapping
>   (resolved from leased RX queues in netdev_nl_get_dma_dev(), with its
>   netdev_lock held across net_devmem_bind_dmabuf()).
> - bind_dev: the net_device the user called bind-rx or bind-tx on (equal
>   to map_dev for direct bindings, or the virtual device for leased
>   bindings).
> 
> With both pointers tracked on all bindings, handle socket teardown,
> queue uninstall, and netdev unregistration in either order (bind_dev
> first or map_dev first):
> - Lock &binding->bind_dev during socket teardown in
>   netdev_nl_sock_priv_destroy(), close and erase bound_rxqs via
>   binding->bind_dev in net_devmem_unbind_dmabuf(), and require
>   binding->map_dev to remain non-NULL in net_devmem_get_binding().
> - Clear binding->bind_dev in mp_dmabuf_devmem_uninstall() once
>   bound_rxqs is empty, leaving unleased bindings mapped until the
>   binding is freed or map_dev is unregistered.
Did you mean "leaving leased bindings"?

> - In net_devmem_dev_unregister(dev), if binding->bind_dev == dev, clear
>   NET_DEVMEM_BINDING_LIVE and clear binding->bind_dev if bound_rxqs is
>   empty or dev is not a queue leasee; if binding->map_dev == dev, clear
>   NET_DEVMEM_BINDING_LIVE, unmap the dmabuf, and clear binding->map_dev.
> - Reject new bindings and RX queue opens in net_devmem_bind_dmabuf() and
>   __netif_mp_open_rxq() if bind_dev or map_dev is no longer
>   NETREG_REGISTERED.
>
Why is it needed? This applies to all items in this list.
 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  net/core/devmem.c          | 85 +++++++++++++++++++++-----------------
>  net/core/devmem.h          |  8 ++--
>  net/core/netdev-genl.c     | 33 ++++++++++-----
>  net/core/netdev_rx_queue.c |  5 +++
>  4 files changed, 79 insertions(+), 52 deletions(-)
> 
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 6446355e787d4..1d6b89f196e02 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -86,7 +86,7 @@ net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
>  
>  /**
>   * net_devmem_lock_dev() - lock a binding's net_device pointer if still alive
> - * @dev_ptr:		pointer to the net_device field on a devmem binding
> + * @dev_ptr:		pointer to &binding->map_dev or &binding->bind_dev
>   * @dev_tracker:	reftracker for the held net_device reference
>   *
>   * Safely dereference @dev_ptr, acquire netdev_lock() on the device, and
> @@ -95,17 +95,18 @@ net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
>   * Invariant: *@dev_ptr is set once at bind time and is only ever cleared to
>   * NULL while holding netdev_lock() on that device (in
>   * mp_dmabuf_devmem_uninstall(), net_devmem_unbind_dmabuf(), or
> - * net_devmem_dev_unregister() during NETDEV_UNREGISTER before
> - * synchronize_net() and netdev_run_todo() free the net_device).
> + * net_devmem_dev_unregister(), all before synchronize_net() and
> + * netdev_run_todo() free the net_device).
>   *
>   * Taking rcu_read_lock() guarantees that a non-NULL device read from
>   * *@dev_ptr has not yet completed unregister_netdevice_many_notify()
>   * (which waits for an RCU grace period via synchronize_net() after
> - * NETDEV_UNREGISTER before freeing the net_device), so netdev_hold() can
> - * safely acquire a reference before sleeping on netdev_lock(). Once
> - * netdev_lock() is held, re-checking that READ_ONCE(*dev_ptr) == dev
> - * guarantees that the device has not yet been detached from the binding and
> - * cannot finish unregistering until net_devmem_unlock_dev().
> + * NETDEV_UNREGISTER and ndo_uninit before freeing the net_device), so
> + * netdev_hold() can safely acquire a reference before sleeping on
> + * netdev_lock(). Once netdev_lock() is held, re-checking that
> + * READ_ONCE(*dev_ptr) == dev guarantees that the device has not yet been
> + * detached from the binding and cannot finish unregistering until
> + * net_devmem_unlock_dev().
>   *
>   * Return: The locked and held net_device if *@dev_ptr is still non-NULL,
>   * or NULL if already cleared.
> @@ -219,22 +220,24 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
>  	if (binding->list.next)
>  		list_del(&binding->list);
>  
> -	xa_for_each(&binding->bound_rxqs, xa_idx, rxq) {
> -		const struct pp_memory_provider_params mp_params = {
> -			.mp_priv	= binding,
> -			.mp_ops		= &dmabuf_devmem_ops,
> -		};
> +	if (binding->bind_dev) {
> +		xa_for_each(&binding->bound_rxqs, xa_idx, rxq) {
> +			const struct pp_memory_provider_params mp_params = {
> +				.mp_priv	= binding,
> +				.mp_ops		= &dmabuf_devmem_ops,
> +			};
>  
> -		rxq_idx = get_netdev_rx_queue_index(rxq);
> +			xa_erase(&binding->bound_rxqs, xa_idx);
> +			rxq_idx = get_netdev_rx_queue_index(rxq);
>  
> -		if (netif_mp_close_rxq(binding->map_dev, rxq_idx, &mp_params))
> -			busy = true;
> -	}
> +			if (netif_mp_close_rxq(binding->bind_dev, rxq_idx,
> +					       &mp_params))
> +				busy = true;
> +		}
>  
> -	if (binding->direction == DMA_FROM_DEVICE && binding->map_dev &&
> -	    !busy) {
> -		net_devmem_dmabuf_binding_unmap(binding);
> -		WRITE_ONCE(binding->map_dev, NULL);
> +		if (binding->direction == DMA_FROM_DEVICE && !busy)
> +			net_devmem_dmabuf_binding_unmap(binding);
> +		WRITE_ONCE(binding->bind_dev, NULL);
>  	}
>  
>  	percpu_ref_kill(&binding->ref);
> @@ -252,24 +255,20 @@ void net_devmem_dev_unregister(struct net_device *dev)
>  
>  	xa_lock(&net_devmem_dmabuf_bindings);
>  	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> -		if (binding->direction == DMA_FROM_DEVICE) {
> -			if (READ_ONCE(binding->map_dev) != dev ||
> -			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
> -					NET_DEVMEM_BINDING_LIVE))
> -				continue;
> -		} else {
> -			if (READ_ONCE(binding->bind_dev) == dev)
> -				WRITE_ONCE(binding->bind_dev, NULL);
> -			if (READ_ONCE(binding->map_dev) != dev)
> -				continue;
> -			WRITE_ONCE(binding->bind_dev, NULL);
> +		if (READ_ONCE(binding->bind_dev) == dev) {
>  			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
>  					NET_DEVMEM_BINDING_LIVE);
> +			if (xa_empty(&binding->bound_rxqs) ||
> +			    !netif_is_queue_leasee(dev))
> +				WRITE_ONCE(binding->bind_dev, NULL);
>  		}
> +		if (READ_ONCE(binding->map_dev) != dev)
> +			continue;
>  
> +		__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
> +				NET_DEVMEM_BINDING_LIVE);
>  		xa_unlock(&net_devmem_dmabuf_bindings);
> -		if (!netif_is_queue_leasee(dev))
> -			net_devmem_dmabuf_binding_unmap(binding);
> +		net_devmem_dmabuf_binding_unmap(binding);
>  		xa_lock(&net_devmem_dmabuf_bindings);
>  		WRITE_ONCE(binding->map_dev, NULL);
>  	}
> @@ -324,6 +323,15 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
>  	size_t i;
>  	long err;
>  
> +	netdev_assert_locked(bind_dev);
> +	netdev_assert_locked(map_dev);
> +
> +	if (bind_dev->reg_state != NETREG_REGISTERED ||
> +	    map_dev->reg_state != NETREG_REGISTERED) {
> +		NL_SET_ERR_MSG(extack, "Device is being unregistered");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
>  	if (!dma_dev) {
>  		NL_SET_ERR_MSG(extack, "Device doesn't support DMA");
>  		return ERR_PTR(-EOPNOTSUPP);
> @@ -560,9 +568,9 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
>  	 * net_device.
>  	 */
>  	dst_dev = dst_dev_rcu(dst);
> -	if (unlikely(!dst_dev) ||
> -	    unlikely(dst_dev != READ_ONCE(binding->map_dev) &&
> -		     dst_dev != READ_ONCE(binding->bind_dev))) {
> +	if (unlikely(!dst_dev || !READ_ONCE(binding->map_dev) ||
> +		     (dst_dev != READ_ONCE(binding->map_dev) &&
> +		      dst_dev != READ_ONCE(binding->bind_dev)))) {
>  		err = -ENODEV;
>  		goto out_unlock;
>  	}
> @@ -686,8 +694,7 @@ static void mp_dmabuf_devmem_uninstall(void *mp_priv,
>  		if (xa_empty(&binding->bound_rxqs)) {
>  			if (!rxq->lease)
>  				net_devmem_dmabuf_binding_unmap(binding);
> -			ASSERT_EXCLUSIVE_WRITER(binding->map_dev);
rm or switch to bind_dev?> -			WRITE_ONCE(binding->map_dev, NULL);
> +			WRITE_ONCE(binding->bind_dev, NULL);
>  		}
>  		break;
>  	}
> diff --git a/net/core/devmem.h b/net/core/devmem.h
> index 9dcb629e10bfd..ff431e5e398e0 100644
> --- a/net/core/devmem.h
> +++ b/net/core/devmem.h
> @@ -25,8 +25,10 @@ struct net_devmem_dmabuf_binding {
>  	 * time and cleared to NULL under netdev_lock(map_dev).
>  	 */
>  	struct net_device *map_dev;
> -	/* Device the user called bind-rx or bind-tx on. Set at bind time and
> -	 * cleared to NULL on unregistration.
> +	/* Device the user called bind-rx or bind-tx on. Equal to map_dev for
> +	 * direct bindings, or the virtual device (e.g. netkit) for leased
> +	 * bindings. Set at bind time and cleared to NULL under
> +	 * netdev_lock(bind_dev).
>  	 */
>  	struct net_device *bind_dev;
>  	possible_net_t net;
> @@ -44,7 +46,7 @@ struct net_devmem_dmabuf_binding {
>  	 * those refs are dropped and the binding is no longer desired or in
>  	 * use. RX bindings are unmapped earlier when their queues are closed or
>  	 * uninstalled, unless a leased or busy queue may still use the binding.
> -	 * TX bindings are also unmapped earlier if their device is
> +	 * Both RX and TX bindings are also unmapped earlier if map_dev is
>  	 * unregistered.
>  	 *
>  	 * net_devmem_net_iov_inc_ref() on dmabuf net_iovs will increment this
> diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> index 962d7a8c75e9a..442362f23fe88 100644
> --- a/net/core/netdev-genl.c
> +++ b/net/core/netdev-genl.c
> @@ -1005,12 +1005,15 @@ static int netdev_nl_read_rxq_bitmap(struct genl_info *info,
>  
>  static struct device *
>  netdev_nl_get_dma_dev(struct net_device *netdev, unsigned long *rxq_bitmap,
> +		      struct net_device **map_dev,
>  		      struct netlink_ext_ack *extack)
>  {
>  	struct device *dma_dev = NULL;
>  	u32 rxq_idx, prev_rxq_idx;
>  
> +	*map_dev = netdev;
>  	for_each_set_bit(rxq_idx, rxq_bitmap, netdev->real_num_rx_queues) {
> +		struct netdev_rx_queue *rxq;
>  		struct device *rxq_dma_dev;
>  
>  		rxq_dma_dev = netdev_queue_get_dma_dev(netdev, rxq_idx,
> @@ -1023,6 +1026,11 @@ netdev_nl_get_dma_dev(struct net_device *netdev, unsigned long *rxq_bitmap,
>  
>  		dma_dev = rxq_dma_dev;
>  		prev_rxq_idx = rxq_idx;
> +		if (netif_rxq_is_leased(netdev, rxq_idx) &&
> +		    netif_is_queue_leasee(netdev)) {
> +			rxq = __netif_get_rx_queue(netdev, rxq_idx);
> +			*map_dev = rxq->lease->dev;
> +		}
>  	}
>  
>  	return dma_dev;
> @@ -1032,9 +1040,9 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
>  {
>  	struct net_devmem_dmabuf_binding *binding;
>  	unsigned int niov_shift = PAGE_SHIFT;
> +	struct net_device *netdev, *map_dev;
>  	u32 ifindex, dmabuf_fd, rxq_idx;
>  	struct netdev_nl_sock *priv;
> -	struct net_device *netdev;
>  	unsigned long *rxq_bitmap;
>  	struct device *dma_dev;
>  	struct sk_buff *rsp;
> @@ -1104,15 +1112,21 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
>  	if (err)
>  		goto err_rxq_bitmap;
>  
> -	dma_dev = netdev_nl_get_dma_dev(netdev, rxq_bitmap, info->extack);
> +	dma_dev = netdev_nl_get_dma_dev(netdev, rxq_bitmap, &map_dev,
> +					info->extack);
>  	if (IS_ERR(dma_dev)) {
>  		err = PTR_ERR(dma_dev);
>  		goto err_rxq_bitmap;
>  	}
>  
> -	binding = net_devmem_bind_dmabuf(netdev, NULL, dma_dev, DMA_FROM_DEVICE,
> -					 dmabuf_fd, niov_shift, priv,
> -					 NETLINK_CB(skb).sk, info->extack);
> +	if (map_dev != netdev)
> +		netdev_lock(map_dev);
> +	binding = net_devmem_bind_dmabuf(map_dev, netdev, dma_dev,
> +					 DMA_FROM_DEVICE, dmabuf_fd,
> +					 niov_shift, priv, NETLINK_CB(skb).sk,
> +					 info->extack);
> +	if (map_dev != netdev)
> +		netdev_unlock(map_dev);
>  	if (IS_ERR(binding)) {
>  		err = PTR_ERR(binding);
>  		goto err_rxq_bitmap;
> @@ -1257,10 +1271,9 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
>  
>  	dma_dev = netdev_queue_get_dma_dev(map_dev, 0, NETDEV_QUEUE_TYPE_TX);
>  
> -	binding = net_devmem_bind_dmabuf(map_dev,
> -					 map_dev != netdev ? netdev : NULL,
> -					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
> -					 PAGE_SHIFT, priv, NETLINK_CB(skb).sk,
> +	binding = net_devmem_bind_dmabuf(map_dev, netdev, dma_dev,
> +					 DMA_TO_DEVICE, dmabuf_fd, PAGE_SHIFT,
> +					 priv, NETLINK_CB(skb).sk,
>  					 info->extack);
>  	if (IS_ERR(binding)) {
>  		err = PTR_ERR(binding);
> @@ -1475,7 +1488,7 @@ void netdev_nl_sock_priv_destroy(struct netdev_nl_sock *priv)
>  
>  	mutex_lock(&priv->lock);
>  	list_for_each_entry_safe(binding, temp, &priv->bindings, list) {
> -		dev = net_devmem_lock_dev(&binding->map_dev, &dev_tracker);
> +		dev = net_devmem_lock_dev(&binding->bind_dev, &dev_tracker);
>  		net_devmem_unbind_dmabuf(binding);
>  		net_devmem_unlock_dev(dev, &dev_tracker);
>  	}
> diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
> index a7261fedd5e76..5f65b9bbfc369 100644
> --- a/net/core/netdev_rx_queue.c
> +++ b/net/core/netdev_rx_queue.c
> @@ -193,6 +193,11 @@ static int __netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
>  	struct netdev_rx_queue *rxq;
>  	int ret;
>  
> +	if (dev->reg_state != NETREG_REGISTERED) {
> +		NL_SET_ERR_MSG(extack, "Device is being unregistered");
> +		return -ENODEV;
> +	}
> +
>  	if (!qops)
>  		return -EOPNOTSUPP;
>  
Thanks,
Dragos


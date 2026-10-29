Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286638;
	b=voaxLIPDYduU0cJ4GOk+1A2VPe5ICryZ9TpUDz/MrmjeBJlnf25gxHvw6/W2F3uj3oQt
	 2IAT8auSQBlt3OmetRmZZWhcH23NNhAjWALM8IcCG1UEQedpSPE1il4f5C8ooJzxN5kwk
	 FFr5l5YU7wH5DK69VAOyWv05VouU/oo2BdfF1oLDsU7RR4CnQg6PFDkElzlcZ46yNRuhs
	 gZodVBhKKhnCkAbIlJnvQw3tUKakL5QZMfr9tBlZOh7stzBwg1osCBYR21QVZcM9O+dcp
	 DW6BjsegM0W0ld2AhpRh8LmODsqzUZ1YRUReKaKEZe8Gspf+KPgPUXgkS+1o6miGFlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286638;
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
	bh=oT+sjycOx+nbvXp7EP2yRbAJeW++n0LrIdBTBIJkabw=;
	b=ddzfUDJXJjZbcZLCtxhpfrTHwf1j7d6Li7hMYy++7PmVfUKDvDetb/nX14MMOgx7c67Q
	 xw/5m0/VAmky/74MeSshIBlVovQ9pWOb+Jya9t/ysaIfnhhJW24WGXHyoOqyQNxeXcYuq
	 Q0tQexwzHPAITAvE20GIA6vBnCpdklQKUYVgq3xn5AWZhwKNc2EV2RplFhwql1uXNGZeb
	 uVWTYq0I/CRNcb24bBcM3RPdbmXXJxE9PZaxq/yiErk2UOVI85Jo0V/bhXl8rZ2otJxeS
	 iFjp3D7Jx7uYiSdLRbAr9uRaFjpprxCJoSjb9KI9LUAGIYt5Q/QFS+7joC9vdJk0t/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=MDeIaEdi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.15
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012015.outbound.protection.outlook.com [52.103.14.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91AF606A31A;
	Thu, 29 Oct 2026 15:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91AF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=MDeIaEdi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHSxP8MRYqxrXNM/cwxpZG3V4QqAMS9eyCNGyVkfpL+GpK6/s3o3VFISXhpDpCau8LAaoMe/d/pALceB3mVDiRi4xG5G+3ifmYp+3k6Q1wuqpTQEhuwMkehpH8h4P/P+yPdMslqIfsI7GcN7f3lqUgdqhpcfxe90emI7ztBOj/YL+S+cGuqvv+u0zV2kVAyN7Q3I03pBY2ea5XMe8mdV24Xn9lONENG3BV6PU0q1glotjL8zozf4DE5TX76jK3den4H/oz/Clkts0FjkjVsGvR07ZkfsUSPTAu8ynwhMpnxsfeb6gpLcZsDY2O036ec/6/o1g3PB0W6G+CEHgz8vOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=oT+sjycOx+nbvXp7EP2yRbAJeW++n0LrIdBTBIJkabw=;
 b=R89C2pfiuVBHcexSjNgypVxi+/s+VC2mVIQHoLgwIhWVJxXBCt9iCWK9pdiSDp97lnwOc7mgTV8x6S65Wa2ybXTo2D7TOXpViTeIqWf/XhLhUf6QzysFJj/Gpfb/6uqG0uqg6TBqsU4iG9jiY3ti3JCWindf7Nwn6OnV3svMqfsha29cUgLl4zEHHYblm9WdUANiZEKtJtAUNEWVjmkNNdnxXI98XsdetBpAC0wLQaIDGj9CHiSBH4/i/rrWh3gkGWKk94ZBsMUdCCsh+/bwK7hSGGOn2oADe6Hh+WedXIFKlU/VnigzOZKGScJlGEDi+a6yr2MwNtVWHth4f/pLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT+sjycOx+nbvXp7EP2yRbAJeW++n0LrIdBTBIJkabw=;
 b=MDeIaEdizrWOZo+EMM6rjMVD7m58WM7d9OAH1/nNYLgzB8gQVix3GqE5RafcfoWocXUEUrY0H1yROsf3Tx8KpbRjiCX6j+UBLPPl/Z72WHbagJkvwYt76Uz6Ik9vGEStGr5NVuxt6rwK3anav69z/48haNzQsjfGHVtYt1YA5b6FVGhwI2OS8w4gCkn3fKWkwzNMkj7oWiKDL525c6A0R6z45tU8UOw2aOBM5Wj9y3B+IkOWgj+q+N7ehfg02NfdZaj8bxSUyZFn1+H0Ts223rSKVi70KOt7qIVVmKsS8JR+YOGfByOP8jcmtUinbP4SUP/yxFJXhg3p8neNSED3KQ==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by PH0PR05MB8240.namprd05.prod.outlook.com
 (2603:10b6:510:b3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 15:10:35 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 15:10:35 +0000
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
Subject: [PATCH net v2 0/2] net: preserve rps_default_mask on failed writes
Thread-Topic: [PATCH net v2 0/2] net: preserve rps_default_mask on failed
 writes
Thread-Index: AQHdZ7elGjmvniBqEEaxvtmojV8gmQ==
Date: Thu, 29 Oct 2026 15:10:34 +0000
Message-ID: <cover.1793286626.git.x-professor@outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|PH0PR05MB8240:EE_
x-ms-office365-filtering-correlation-id: 8ead4a65-a7f1-4792-e253-08df35cec84a
x-ms-exchange-slblob-mailprops:
 obhAqMD0nT+6TxoHw5fNkboUl/ASnSn2IlKvvcZOoMce3C5EnoMu4EwCpz+3P0cHwuP4032wNsfMnfQ0jswMEPu9hARwHDWRfuDZRnQZ0DQVprzYHuSZRmqQEHgi+yApbDEIfe2r15CT9w3tLPcQ00Aqhdo82etHGd9HAtaUcEXFn5C4tenadnv3MWSlLqSjCHn1a6CjoM68FPZ70SXhoIWO+TbRgSdQYCKiBkcGLjNx7IzCJ9yAJz8SW0fslCvzhJdb29ppthjqjQ1m5f3wYGK1ISeCFUV8jyNF+d4NvQCV/jNcY0yF3Jlm5qhNX7xpJCCLA1qqSzMqM9nEgzY0Rjk68H6hU7pKdCV332cTpGe+5UNU5JuMTUXs7+I3wQFLf/UaLfFf1yvupwyX3MSlmGtgl+NpHVU9KAXz9aIwWvmUZmQuEHyf7k2XXYPKiQu44NAJki/ojkGsHO5Kpqecu2qfvQkq8vi6pQvwGcLn/5Fiw31qfb8ViBOimHaCaGoHE2WMa83JSFzSbWt7Fvhy3Mdg+L02LxseXhaCt38/pdNgo75ORj81u5PxAyksoT/S0ZLt8of/8zk9jnW+xq9FfkaGWX2Kxy9FVNuRtTqhQCFjTtr/+t4d6T579o032HJTASK4EgGUUR13DewjfKPYF7YDOlZRQIuqteQ/flob+F3h7cHXq29pE2cC3s900BbJOWQhGZjlIVJybCMeXDSVKjbSmYfuoCj5EwDlBeKr4+AdWBgmw1xZ9qJf5/EJPxPWoz8rtkxEIqaX2CFh3kPDljq/cIGXnqF0vMlRRN+nUN2HeK7jQONSsTEYZ9E0cdHW
x-microsoft-antispam:
 BCL:0;ARA:14566002|5062599005|15080799012|24121999003|22091999003|24021099003|8062599012|19110799012|12121999013|8060799015|38102599003|2604032031799003|4140399003|31061999003|25010399006|102099032|440099028|3412199025|4302099013|1602099012|26121999007|40105399003|10035399007|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1A5T0JWUVpLN3JCWWNxZHFEeEV0OFJqTDBPOXRzakwwV2RhbFEyUkU0VzRM?=
 =?utf-8?B?dTJXRjNBTW9GbmpqRW5vZFQwT1BwbjlnNktkYTJBRGpOTkJ1dHIybTJQVlR2?=
 =?utf-8?B?MmF1aGpZRGpiMHlESkF4MTlYS2d5ZVZxWGcwUnlzSkozVUIvQ2I2Y3pZLzlG?=
 =?utf-8?B?T1ZSbFVkK0ZCYk1mYklIcCtpaUw4cUVOZXhDc0FSUEdQem1FTFZjb0tQMDlv?=
 =?utf-8?B?OUFVSDlvTzFhSXlhWFRFYVBuZVNMUXp0UElCei9ET2ltbkMrbWsxa1J5aXFr?=
 =?utf-8?B?TjhHb1JGdDRoUWY2dmx6c1l1Uy9EdUp2YnFLeWVUcXR6anRIem1LdEQ4V1lt?=
 =?utf-8?B?WWZNZkNwRVdYMGVCdWpyTzA0YUNuY08zWjdjak0wN2N2NWpkVjNrSW9Kbjgw?=
 =?utf-8?B?UUgyQlh3SnFYVXoxZXE3RWVvM1I3ZmhVWW01THNuTTc1UXVRT1B4V29KWXBV?=
 =?utf-8?B?YVJ3aDZlVmhRSGdpcDk3U09BRkRyOXVpdmZzTjNkOEVMK2hsbUpVbHRsL0hG?=
 =?utf-8?B?TU1MSVlHQ3RHbkFKNndYSVdsRnhZaGVXdlhsYTZwQlZ2cmNLQ05sSGI0TGlM?=
 =?utf-8?B?c2NNYzB2OGVpbkhUZS9kZkJvUmVucDU0UWg1eWgxVm9LZUc1clZRb2NJZXdX?=
 =?utf-8?B?TE9LNkR0eFc5SWE0ZlhCeUpRMjRQZlJ0eUIzRFZjV0VPYnVVSjVqbXBzdTJn?=
 =?utf-8?B?MWxldFZBYmVna1JkNUQxaDRWUUsyOFNLajdFa0VjSVVlbHhobjc0ZzF0ZGI3?=
 =?utf-8?B?OXd0MVE0dUZKaHY3S2I2aVZOYnc4RXBBeDBFYlU4K0FtQno3am81eHRLNjZQ?=
 =?utf-8?B?Q1E5bFdDb0RvYTZQbEszSk1QUVB5TnAvaDhzM21odUZnelVRYmJpVW9yKzJE?=
 =?utf-8?B?N09rV09hYW1CUXkvYWY1NDIyaitIM3NQUjJvMzF1NzVWTjlzOUo3ZmxqeEtE?=
 =?utf-8?B?TFVrRzN6K2dEY2xEWG9CcEFSUTFoN25wb0VPK1k1Qm5zdUtqRy80SVVWTU9m?=
 =?utf-8?B?OWl6L1gyZ0k2Z2pDaVRqSU95cUNnb2JBUWFRcXVzdlFIbjI1VmhUck9VSm1r?=
 =?utf-8?B?dS9QWUl0elpuTnpMVUFHbWoyaUl1dWpOUTZSYWgrejR6Q0NvTzhGSEZLTWZP?=
 =?utf-8?B?djRmRTlZNTR0SlZwU0NYZXFobjR1Sm5iakFDTm9kTGpIM1VldDl6N3FUeGpT?=
 =?utf-8?B?UUlDQ3JPT1dsL0lLcHQvdWVsWUZSRzlUNDBhTkpMREkyMkFGY2N6VVQwTGI3?=
 =?utf-8?B?c1NwN2xLcjZNdW1zZSs5S2J1STk3ellaRnl1UUlTUWxDaUJlWUVlNXdwdE1V?=
 =?utf-8?B?dWhkNmtqTkJkRmZYUHcxR1huNDBDZ0RpVVZwbTFiTkR0ckN3T0dqZERSQ2lN?=
 =?utf-8?B?RURJMUF6V2ZwanFJSzlBV2s0S3VWSkNHMUdqLzdhMHZNY1VLSU9zMk1sLzNO?=
 =?utf-8?B?dVFOVTA3V1NyYXBTanBoYkpxRHJLaE9ZU0FOM1F2YThtblRXaGliUUJUVWVY?=
 =?utf-8?B?OHQwNEhzcFEwMEp5MnFBeTZTVk5XUGdhZVl0K0xyc0lGUFU1VlpXNmFLNkta?=
 =?utf-8?B?MURuMXo3TENpSFB2cFFyVHplaXJ1Qmo0OHNKSEJibkJuODY0aXF4dWFIM0ow?=
 =?utf-8?B?Y2pXbVV1NzdSM1F6T0RpTDQydDVpSVE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHRpM3d1ZEhGdzg3YWpXYWVCck9BYXZEWUNYdzVOZ3c0UDcxT3pPcDZTUExw?=
 =?utf-8?B?L09NdXNnL1MxZFFyZW9rbmZXYmpjT20ySVJsa0JZSkFoRVpST0JtWWFqUVRl?=
 =?utf-8?B?dHBPUWc4NVlCYi9uVHA4dTB5MHJLOTJ6NFRQZzhwU3BWOUV4UkpsMHczdDFP?=
 =?utf-8?B?cWtXTHMrMEIrR0YzaGdEMzFpTW1KRTZyaHNvNXZKcEFOeVE3WXVrLzVkWS93?=
 =?utf-8?B?MExSRW1XcEo2UlhUNklnL25VakRWejBsUVhmaTIxcEdZbG1zc0JtL09pQXVq?=
 =?utf-8?B?cXBPNi9Ba0JKTXRJNlRXbjJxaE5iMmdSOHhjWEttT3d3SGhGSkJJMEFRUVBy?=
 =?utf-8?B?a3ZqU3lTeUFYQktxa2U2aWtaaWZqZ0MxSGNLOVc0SEczREVnYW9qeENpaHA3?=
 =?utf-8?B?cGF3dzU3ZUpsYTBUZ2JpWXJncVBUUVdEemd6ckt6WTFvRVNUWW9wQS9NcEVa?=
 =?utf-8?B?MWdpdjJncCtIbkd3cFVza3FXUXJGQnBtT2xRT2ZmTVFqN0hZT2tzaHZkZy9K?=
 =?utf-8?B?eWQ1SFdGK01oN3MwWVFFVnNwVDRiS2lHTTdsYzVUZHNrYm8rUmxkRk9ub2gx?=
 =?utf-8?B?ZjMvOVhvZS9hQUs3RFlySTRPUTF5Ni9FOG11MzZMYkR5Rmxndk15QlZZSEtD?=
 =?utf-8?B?TktEbWxSKy9BTmNFWDltQjUxRTZYVGp5UmpkQTNzRklDdEJqbEtNV1JPQ1J6?=
 =?utf-8?B?aStiekRiNUlzMS9kNkE1SStqWi81amlxelNuMjQrNjlSY09tS1BzK0dXVWxn?=
 =?utf-8?B?dGh4RTU1cXdvS3VLTHdJQ0t3QU9MbUVhVG4vVkVmWXFMWWNPZnZlbFg0S0V0?=
 =?utf-8?B?Y0VabzJZWkpNeFpXNk5jbFdXS0J0V0p1cER6WlUrOXY2ZEVnNlNLU0VsckJQ?=
 =?utf-8?B?Z3M0azRaY1dHZFVwMlZmeW9na3dXbzhnVXlZbk4yNnFjVHJqQnNxWjhnQlpO?=
 =?utf-8?B?UGtqNmJyTy9VdmQ5ZTAwYkdKL29MeldtTkhpTXNpZmk0WTU4dWNQeFhtMUgy?=
 =?utf-8?B?bFM4T0NaTUtMQjg4Zkk1bEU2VTlkOTdrQ0Rjc3NXZFNsbkhKdmdqZS9OZ3Rn?=
 =?utf-8?B?ejRtbjBRTTRIdEFCNTZrdmkvakNaNlZOeHFjRVk0c2hjakxsTXgwcDY2SStv?=
 =?utf-8?B?YUJkT1M3TjJXR1JUWW81U2pVeFdpN1l4ckhzaVBBYXVVRUJ5eU5HMVFBWU1C?=
 =?utf-8?B?SmR0eFJacTJtTlJpeThJeFV3RFBLLzF1UE1KSXgybVZWWWZ0bGtJaG9mUTRv?=
 =?utf-8?B?TmVodndhNVUrNmZGVW1YN28yc1c1Y1M4RTJvcFRCKzBibVJmSzg4NTNGOVBO?=
 =?utf-8?B?akMvNGZIL2ZnZTA4SUpiN1VhZE9Fd0xMOC9wdUlqUVJ1VXl4N0x6NmJlMWRx?=
 =?utf-8?B?RThRak5VZitFSjFDMjNFMWxlcFVpTzgwQkx1T3NPNUVPNE0xUFkzOXlrdkpG?=
 =?utf-8?B?SE01b0IxODR0Z2M3ZUw3MS9pQTN1cEwvaUlJaUE1WWpIUUVtL2xwT0ZKdlB0?=
 =?utf-8?B?WUVmZjViS21MZUc0ZldmOFJ4TWtnREhFRWVkWUlldEJsR0RRK2NBTkppcHV5?=
 =?utf-8?B?b2hxY1dOTnJEc3Zma0NUYjN2eTk4MytrSnkzWUt1aElDbVd3dnEwRWhOT2gv?=
 =?utf-8?B?OWd0ZWtRUlk4bDNCZTh4UWcydC9oaTk5TXY3Z2VkaS9TMU44UlV5UnNheVpM?=
 =?utf-8?B?M3dQS0cxd3VwWEhiNFFuWUtZQlNjSGZwVVdJaTVwZndFUEE4bmdocE9UZGlX?=
 =?utf-8?B?K1BncEFHYnZ6UnVHcnB6aGQyaGdVd0RrTkh5cUJhQWRZQk5yKzF4bGhxdkVC?=
 =?utf-8?B?cytwQ2hCRnBOb3h0dVlyZ3NEUnR2S21VUS9GUUhrVVMrZTJlSjRIc0E3eWdK?=
 =?utf-8?Q?v9DKk74SSsNoI?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ead4a65-a7f1-4792-e253-08df35cec84a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 15:10:34.9567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8240

cnBzX2RlZmF1bHRfbWFza19zeXNjdGwoKSBwYXJzZXMgYW5kIHZhbGlkYXRlcyB3cml0ZXMgaW4g
dGhlIGxpdmUKcGVyLW5ldG5zIG1hc2suIEJvdGggdGhlIGJpdG1hcCBwYXJzZXIgYW5kIGhvdXNl
a2VlcGluZyB2YWxpZGF0aW9uIGNhbgptb2RpZnkgdGhhdCBtYXNrIGJlZm9yZSByZXR1cm5pbmcg
YW4gZXJyb3IsIHNvIGEgZmFpbGVkIHdyaXRlIGNhbiBjaGFuZ2UKdGhlIGRlZmF1bHQgYXBwbGll
ZCB0byBSWCBxdWV1ZXMgY3JlYXRlZCBsYXRlci4KClBhcnNlIGFuZCB2YWxpZGF0ZSBhIHRlbXBv
cmFyeSBtYXNrIGJlZm9yZSBwdWJsaXNoaW5nIGl0LCBhbmQgYWRkIGEKcmVncmVzc2lvbiB0ZXN0
IGZvciBhIHBhcnRpYWxseSBwYXJzZWQgaW52YWxpZCB2YWx1ZS4KCk9uIHRoZSBiYXNlIGtlcm5l
bCwgdGhlIG5ldyB0ZXN0IGZhaWxzIGJlY2F1c2UgdGhlIG1hc2sgY2hhbmdlcyBmcm9tIDEKdG8g
My4gV2l0aCB0aGUgZml4LCBhbGwgdGVuIHJwc19kZWZhdWx0X21hc2sgc2VsZnRlc3RzIHBhc3Mu
IFRlc3RzIHdpdGgKaXNvbGF0ZWQgQ1BVcyBhbHNvIGNvbmZpcm0gdGhhdCBvdmVyZmxvdyBhbmQg
aG91c2VrZWVwaW5nIGZhaWx1cmVzIGxlYXZlCnRoZSBtYXNrIHVuY2hhbmdlZCwgd2hpbGUgdmFs
aWQgd3JpdGVzIGNvbnRpbnVlIHRvIHdvcmsuCgpDaGFuZ2VzIHNpbmNlIHYxOgotIFBhcnNlIGFu
ZCB2YWxpZGF0ZSB0aGUgdGVtcG9yYXJ5IG1hc2sgYmVmb3JlIHRha2luZwogIHJwc19kZWZhdWx0
X21hc2tfbXV0ZXgsIGFzIHN1Z2dlc3RlZCBieSBXYW5nIFpoYW4uCi0gQWRkIFdhbmcgWmhhbidz
IFJldmlld2VkLWJ5IGFuZCBUZXN0ZWQtYnkgdGFncyB0byBwYXRjaCAxLgotIEFkZCBLdW5peXVr
aSBJd2FzaGltYSB0byBDYy4KCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yL2NvdmVyLjE3
OTMxOTkxMTguZ2l0LngtcHJvZmVzc29yQG91dGxvb2suY29tCgpZaW5namllIFdhbmcgKDIpOgog
IG5ldDogcHJlc2VydmUgcnBzX2RlZmF1bHRfbWFzayBvbiBmYWlsZWQgd3JpdGVzCiAgc2VsZnRl
c3RzOiBuZXQ6IGNoZWNrIGZhaWxlZCBycHNfZGVmYXVsdF9tYXNrIHdyaXRlcwoKIG5ldC9jb3Jl
L3N5c2N0bF9uZXRfY29yZS5jICAgICAgICAgICAgICAgICAgICB8IDMxICsrKysrKysrKystLS0t
LS0tLS0KIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvcnBzX2RlZmF1bHRfbWFzay5zaCB8IDIz
ICsrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDE0IGRl
bGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiBmY2MwMGIxNWNiMjFhNmRlNzY4MjZlNTAxMmIyYzc1
ODUwNWY1ZTY1Ci0tIAoyLjQzLjAKCg==

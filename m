Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795366331;
	b=M8+/U5nchGn+KU7zz/u7PBttY6YphpKAjJmq0ID7CrNIP90TH/FF2XvN6M8Qnihr/bED
	 4F/7UG63cOcZehCb73Ed1kLmQs4iyUWdPsTc1Kzr/I9pJ3qkP+4zGWk2V6dbz79UhLbSu
	 QIBazPlO3PYBnu4X3OpAi6n0aN4Vq0yqvYdo6Xohvfeun9u5K2/PblK/UwiZNKXRU0tJn
	 QEw1pigrkGXxsgNXAOFlMn2WBpTEE1R5Wa5h9NfDiEH7QEttCH0dr9tpd4N62FgwTNSJo
	 WUIWhLedqR8R5Z8K3JL3gAe5yDPpHjcDQfIQfJa4uaogvpUIquK/eXm78sgd9zYouqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366331;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gg5CXwLELiiHT4sTbY1+2ax49goJ2iy/XRG996eDrek=;
	b=0a+EnFBvfEjIr8uNLRM2t4jDpByM05neuuK62U9Pklo/f6+naP4rtI5oQ3OT1k7mQntd
	 QO+pEiUNQAqFq8PG+WlfdKBx6r0OsHjX8f6WrcdFVnVS+wIvWH57pYVlF7ZvngoV+ZnZ/
	 Z7naE9abb8N5wQT0Iq6ghw9uTZ1XquuKX5v5/Ac//77tgu4sEvn6YKQHo/r4CkL5dTYeP
	 Q5vGgTS087w+xU6t5/zesQhW2y8koAIygadDT3KmqAXeDHM5l7ZS+VWBotY6jRixkt7jH
	 TrBGCgKcGHUPdoD/aKPe9URUFs8wjnOAN/xsJZcMVG9umJ7mt5wxQ3ka2KjN5kS/d6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PkTnxDqj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.36
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81056606A698;
	Sun, 22 Nov 2026 16:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81056606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PkTnxDqj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg/IMXNRRT+NK3D3ZrssAj1TeOceWNZkNMBIKFT4yHsyTr/uMw0OkzqT6S2yLsMbDbzNDP0zTJUfTQMo6oicQI7ykuHZIJj+MyzS+qeis3IvNDnAEMphCAWZzB9Zaz9YFfMjnCAWWYGPPbGJBoRnJbbaVsmKbQcMevwX8M1oHC5HZh39dztUkBAMlJzMChDJ9JJdFsO+RtenACnyQPiq8nri+QqVbV7Bu56gKlbiYK5A7oVW6M07ipuld9UnzhhLET+pKsfjUnaTMia24t9mo39vr830Hd0q2zDumyarN/bn/lSVjD86+wpJQDR4gxQsIj6GR/etR2gd9cRKWYFnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg5CXwLELiiHT4sTbY1+2ax49goJ2iy/XRG996eDrek=;
 b=W2naREfEepDCyGPtIivF07926CDLaI1zN5a6FJWiUjqkfrcu5FBkLU5j6tfkaVBNYalDd4kvy5heAT2DyctkkB8ulBEPi5cuyCkVSSFK8yEKE/vsDDyTircRWji6vPF3xyWjW47rRXweHeJ9cMZb4dDJplXd34fTfd8Pd5/p+IStjaDBK40IiCb199gH8oq/NK6zTnWIXoRItDe8SjiCA3Z33KaY6u5ZP2DkOTXukSMJXLCtSV8LGD1L4Ftf7nxfFfuUnsoVKd6VxDRcQx4Ec4TR6SsnveYY/aYeT9HskqhxOfdJAifC139/60+sFxHdrqDroT/K/LjQYP9v9dIdTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg5CXwLELiiHT4sTbY1+2ax49goJ2iy/XRG996eDrek=;
 b=PkTnxDqjg3W7hiaxMAclQxwOXUP3Wb7Vomsr1p4TUHMkSjRKaXnKEYnhaYhDVqklb1GWiHj9p7L6l/jwALKwGJUPbLVuXgEgjJcEEpeNAjA40hZS72Vb7GIvM2HJ55WGY95Xacr25qWADFWpRqOC8om6A7XK5hgjK+IH1TS0MHz+519Zy4FYcALcNhY76p2wb1KLd3sBltoHJ++KtOXD9Bz9AQU8nqJAoUlXKk6zXcbbhiBHDRh8bPl3WHh64gBjL+REBrMJC027bHh6JKqO/Y9bXRpO74maEUM2Y5/mwOyWxZbOFWj/NB01AsjHBILM1PM06JmoxVd7OkSZ0NxIPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by SJ0PR12MB7476.namprd12.prod.outlook.com (2603:10b6:a03:48d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 16:52:08 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 16:52:07 +0000
Date: Sun, 22 Nov 2026 18:51:58 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Vladimir Vdovin <deliran@verdict.gg>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/3] ipv4/ipv6: Cache pmtu on all paths of a
 multipath route
Message-ID: <20261122165158.GA3020566@shredder>
References: <20261117193141.27004-1-deliran@verdict.gg>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117193141.27004-1-deliran@verdict.gg>
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|SJ0PR12MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: eeed7458-9aa2-41f7-dbb9-08df48b8f16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261022105027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qkxh2h/9anWk5sCFQmTI/ygkNY+sjjbIMViCGiznhCPWHEnBzLi4pY0smfjy4RtgfYg9SakSEQDNKtp+DXt1mENgiUjkAE2AxaBiAwoGvNUBhKqdoWzff50SDq6xuwltZvh4y4v3sp4jjUsrCihf/Tz6yJcsUaI681zKxK0sAtOb1/yKc2Ac55k1qZ/seH6FlwdX7S3W245jRQrFZ2BNq/9wh6Lof1iyHIj7bpc1fnNcgszXl4HaJSEc9enc5ssa9HHFgrQsyi2bk34w/K2Ttfh1KlGoz/+C8npFWX6z6Ya2+WLtusef8ZQbKfusGZ5/bVo/HMwkEjH61e/MbzyCoDyNL49jLlJPD213OcuIa6o+0CP1bvVBIAfxzPHmIpjMZe4zWQ2fH7NQmsFL18ZreYAWX25LPC/Qpk2lte0RENy4n9YNTxPug7vzDBgQk5GWRBQLpsY3MM04TfBx2KHfeJTGu3Esw1dYXHaul5rd9RAPOlUQ/itXphz9f0eLTmirc2ar5hOvXTWdifCOg2THsBBPL3yUTpHP31tvHKj/wjkVZHYoQPyQ/dPLmaI5sqB9HPNADAeh5ZkAsp2M+kuBB9hI2YIy6clWkEhb8zJwD3ZV8+D1TSuxuvkH5V0scRlbjaR1DNhywu4UhywXBXKQX7voD4uW9d58JbeQQfCUfIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bY5EEXU/w2zgPu6lwFycF96d4VwUJM5Yeq7QzoGX4Vcla+pIo08RitW5vSvP?=
 =?us-ascii?Q?nmp8T8mcmC+f3YXQDO3BnE6HLGKfh3wbmmFvrVj43s1cPqLrVO3hpWeqVKZP?=
 =?us-ascii?Q?xn2WD9VnUxzYoFvY6/GFWohbgI2JG58HbOEXGy7msBnOqU1Sa1hIu1Axb6nk?=
 =?us-ascii?Q?UYbEDPGsX1me+d3nsc26RphSZBEnP47u31QxuxA0MxgKxR0vF7wrAPii2Cxk?=
 =?us-ascii?Q?yV0RQR6qLmKcrHlGsus+CqDAmdwIL8BFY0myU/wdo+alH63LKh4QeLGDXaVN?=
 =?us-ascii?Q?lQW3GFlDOXf8Sf+K2vQmMh4VSgJMGU2+OwZOb6IL9TSjIPqJrp7CoO18IVXZ?=
 =?us-ascii?Q?Z3lQ8CKMMD+dWsMO7Skc93FIMUscVPkwHjFQBLqoi0PfE+ucQ6Yxf8SjN7r+?=
 =?us-ascii?Q?s5LExkbGbUxLqczZ1X6q8FYL171KUQ4WYXe2NvR9ofk0nNfoxodbD3on74+k?=
 =?us-ascii?Q?j9YOJbqJSPgEy4RyejVMK5h6P493G7JC91jEuAMtjTxXkwLwzSo4eCKXbDDE?=
 =?us-ascii?Q?sLEGBGpp5fT/K3FX1Musy/dkCJbfFX5WtUOq+FMVvxjzjGO9CiMsd0YxzQh7?=
 =?us-ascii?Q?Rr2TETHryBX1yR5Uk0+0AObY7hPTPpXBtYjW6IzkIET0cWOSAGUN+jvs4/8x?=
 =?us-ascii?Q?oHoal5SK9E/ZJTK9aBJX17Kes2pTKxgjx9XsmwARSMU4vbFHUPj0mYSVUcMX?=
 =?us-ascii?Q?73gAeHgQpr+BoXG0ZBFgxGIdoHIpoz0x5TqYgHghKT8sL/Tr/p+ZGQSn5R/Y?=
 =?us-ascii?Q?RYUsXFtEvtVPHXfPeala9igLrkSD9rYe25ARSBVA+txHaMclZs85VI5M/0Va?=
 =?us-ascii?Q?U9qrY0Kxe0ndRAzhlboJ1FlOU8Q+UusFJzSr+a6xD2LrDH4m+CVH8ydRGgiv?=
 =?us-ascii?Q?+PyOCscmjwIE3yWR1HoM33uaizVqoQ8WaQmWZeM63vzIgfA0uP38xuZoVVVV?=
 =?us-ascii?Q?bzVKWALsz9KHBW8BphfXaN2VczLz1kg9k9gcnpPm/86q0D48wkqJvAQ/WEUV?=
 =?us-ascii?Q?g4Uo+1MzPvfpbtZCbhPViNwr06TVRVt1xyyziKLMgaXIC50eROtF7x+oeN0m?=
 =?us-ascii?Q?sBsGZylXy5G7dYHHu/Yzf/odbg+yg6Yc1iBDKKcs6woQySahNCD+C4oW4dJ2?=
 =?us-ascii?Q?dF/H/n4YHOHde7Zzq6x0cyXHn3RZLu4Y9kNdJVENOrEFM6LyFUZtyX2+E/Ww?=
 =?us-ascii?Q?s6gsI716OP1k6kx3T5SCj97UAUQTgdK8XUcyAh7ZuL78046qvV/LRG1cINZY?=
 =?us-ascii?Q?yXIYma0CXdyo0JmbK/6k2FbEEE9SXS4366NHuFil8CQHQKwXNYgViWrmbOLp?=
 =?us-ascii?Q?hhTmJOll1aeSebdnStrE+wVqi8pRgqXpfkKXqGAs92jN+wdrkE18UkLlx4CV?=
 =?us-ascii?Q?G8fROqk6OzzFJZ43CTVGx8bSlnt0cGtY6cE7cKIWr9GTYIMbShmadIs+/8QA?=
 =?us-ascii?Q?QVR2t7BmBxwxPgkwKW+WZsxixPkwJYcQFz+Wy64JuRlYWKjbPpDstBUjeidt?=
 =?us-ascii?Q?OjXGwfNYXuzDOwaQ3g3I/AZ4ttx5UbQoRqQ4SyFG9ePSRFx5ba4NdVycUHsl?=
 =?us-ascii?Q?LEuhNxDWldu+sSJgAS63O7iBBuDxBxbztPNYpc+nLfXm+9Pg466uCI6SfxuO?=
 =?us-ascii?Q?uwip7n+WzLGMWp11QmvJ3MHePCmNTU4euNyfsY/8Im8bNAVyWeppKTyPkvkW?=
 =?us-ascii?Q?L6g45rprtVFfQOx1oI+6CNWa1yHuQ0eoo00fMXv7+eUgvFXX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeed7458-9aa2-41f7-dbb9-08df48b8f16c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 16:52:07.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zrrhifsOeZTmkG7satUOjI0TTba0/AbMnRfqeBo/RFjomNgIOeJTR2EY1QXd+Mxadq3CI7X+P5eUomvfIkbqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7476

On Tue, Nov 17, 2026 at 10:31:38PM +0300, Vladimir Vdovin wrote:
> IPv6 counterpart of commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for
> all packet paths if multipath enabled"), deferred back then [1].
> 
> Patch 1 checks the mtu of a Fragmentation Needed against each path of
> the IPv4 fan-out, not against the looked-up one, patch 2 does the IPv6
> side, patch 3 adds the tests:
> the IPv6 variant of the pmtu.sh multipath test and, for both families,
> a multipath test with paths of different MTU. The IPv4 asymmetric
> test fails without patch 1, the IPv6 tests without patch 2.

Please wait with v5.

Patch 1 and the associated selftest should be split from this series.
Wait for the IPv4 part to be accepted, then send the IPv6 part. I will
review both parts tomorrow.

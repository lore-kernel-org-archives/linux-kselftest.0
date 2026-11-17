Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913018;
	b=UW/hakJ21uYlY6BtwPJGqckj464SpbZ0m5idip1mV4iQVgTiYHFuRbm1vetnNCISJLpi
	 Zc8UTTJHoozoIvT1BKGlBvZzUbPKtFfXsO+Yo2xWUKQkjcj1txl+UcpsQiwMzZmYBzV4c
	 Qa4UUqfD9KJbyCMVDOkzDpe3rXh3qHsD68m+INQ2dQi6vM2GyOezESL5rdYw/yV0QRF/j
	 U86sEGTbee/X65oNOZUNzMFztrHfp6DSOb7FsJtT6QSHAZtHTIVwLXNXrUe/n056JZu38
	 ANluBlTIx8c3Y2mMSCLJs4UCQnAumeDzSFdWMdF42OaRipg7Obt9na8FARZ63nVa5tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913018;
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
	bh=ZNV/ANsunKrTEnbWmSgtF6i0CIVf9Iv/2m4umhKSEOM=;
	b=5qT7hvFgT5xw//RCMt9X//niRJoEJLQ9mSLngqAa3YMgtDv+mhQPmKvxYUagc/RCCAhB
	 K/b5jQJzj1DrgwoV/nODUTr118f8O1XcLqTglBK39pdJI8FUH7yIRV51ICxdP1s2iAi9R
	 5YeJ19qVEWR0YQWd8ZAoqs72lBUpNclzRgGPB2Ktk5R9CFZQXZSwuOlMe0Hm/pLydW99S
	 TNWf/4rj24dJIVM7Ikp9t12Qrmhmvp/OhDVfnETM/+wpAv4DbNtvYK5SwSQAy3lP/lrku
	 KwJLwcJdTXDr3gFbXLIh2uIE7MGP/+TQXIMtIOunMrmDIDVzl0mpLtkckNd89Nyyk6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=opGuuel2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.32
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A433A606A31C;
	Tue, 17 Nov 2026 10:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A433A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=opGuuel2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiNY+qNG0t/r94V/acJNJcAoSckBXqitSMTPh+r/nfBhV5FgV8xQPblsImDgSxmFPKmi2U3/eRy/LqvAdbyyODJlVmu6vooA9R9TSW59GoZENhZqiXti2kj+blYnSmDE/rKtZryHQPiL3nB7tyTvHqtwSgkKx1zkmZgjNTNwPvvgd98Fu8TtdN3EVMsyv/r9g/O5NEAcu7G5XCVzWlom1u5EcLDebfoVGpp+Ci6RCFS/N5WXoNVrcW0lH5PfbZj/TlTIaBXBMGijYvZN8WyblYxH/nstBdQ4oOb913VIOVMtkn7svbax1QBEZEcsmQ4KgHjvHeCHmVAso4+9a/vJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNV/ANsunKrTEnbWmSgtF6i0CIVf9Iv/2m4umhKSEOM=;
 b=coL8/Q9pV4KJzDc5gTEHu5x1oGQN6MhsK9Op/3/rz4XwGx1t06ouArjlpECZPvKaKrAMI2ytpGBhlyeyGFiVMuV4qt9lxrFz1w/I3Dy6q1s921vSAPWO3N7GLZ7FYEX/HGZVB91wk4ZF8JUNZeAwOFFLTDF1XsX3u4z4tViMdpZKQJKNoaDfLKl7UobayjZsM/B3XHxZLXNDw616cqUxUJSswlQgQzcF0M7Gx+9sMuuZ9fv0TJEKhsWXkZvsSfonUY1XwXfdINqJcUEp5Q+A9XgoYUBUNlLtiX5y1Mkin3XFhweM4MWfbdNWjzP+zi7+NZg7ngQJRsHcuIdMVKeXnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNV/ANsunKrTEnbWmSgtF6i0CIVf9Iv/2m4umhKSEOM=;
 b=opGuuel2fVcSBDHUZxWoioYm/Jv85b6+pGs/+sEbZQ0C294KMd+leQ6FwDxlcpfjkVxfN21Y1GXsC4QrssxBdzy1jjvWUyNhYfyXaQKeYd3U4wHEIX9lMP3dUDwcaSVJVOVzNAzrL9F9f4NkXXV29sg+KbIemALjn8mntJ54S3Sm6ckk3gnp2AS8SZyVsjxv1hwKn79iz1VCLZxG8KyEADVvzYT+Dh6CjkE+1C46yFdsrG3+2eKDnoaf/JaC4GHeU8AAQhRRypjYfnQozdk0iaqNSupyjhGRIca0ZJc6HOqj1kl3yoOaD848bWsZ4YR+F/gPZ3rPFduUkeBP8r+h5Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DS8PR12MB540605.namprd12.prod.outlook.com (2603:10b6:8:447::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 10:56:53 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 10:56:53 +0000
Date: Tue, 17 Nov 2026 12:56:45 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: liamsmith827 <liamsmith827@grapheneos.org>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Smith <liamsmith827@proton.me>
Subject: Re: [PATCH net-next v5 0/4] ipv4: restrict on-link fallback to
 lookup misses
Message-ID: <20261117105645.GA648376@shredder>
References: <20261116202741.13106-1-liamsmith827@grapheneos.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116202741.13106-1-liamsmith827@grapheneos.org>
X-ClientProxiedBy: TL0P290CA0014.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::8)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DS8PR12MB540605:EE_
X-MS-Office365-Filtering-Correlation-Id: b889baee-b7b1-4716-0bf0-08df44997d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|6133799003|22082099003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|261028144727099003|10067099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	SRgKlPTLLemG/vMBN6+0Z8XX3+KYONHDOB71xDfnMKvDjSPDO1jy9mah+vrG3Zp0pK4IQiRQHs4Lo1lU77AoHC9TZcv4M/ZiIOwvCFNYZsHpCqjXN0c71L49qCnslq0bFaU57nFV98xHl190R4b8/0QrDjhdAQXRiCJUFXOe5L64m5LHdFpC6DG16V4oftarA5A5T+I9wjfA2QOJJZ6fHngDM7Ep4di74VoyP3ZEMKdLnKRd2DfF6oBnVleMeKk3Llps3nkASGTbVqFDm9Brpz8UWgHkP9kCjtTiRVzTsIgb5aw2MyEYvPN4tofnwHgQHQJfdlxJXjQ7JXtNzeHHzAG9y73AY1wKGEhofAMeV9wxYiZmPa2lYsJHqyb1zwf+qmEBzf2+GMWHveVbzW/T4d9iTOOW6SfPwPg23IidjtOj22pLnFJNtFZZJat6O0hFPn66IntjsvJ/Z6Fk6uCliD7pgeDiJYJrc6LmNBR7lshnkQF49eMgzpqPAnPiCigQjFQafEXC4JsB7VfyYLP8W+mo/bXWZG12YeQRotU/uiYsDyhkZyYtU36/9OspVw73qsSdyr5ZS2FusspScUZA4d2zcFKt2hb5tGMoTC93KppJdqqYFnBVEuzK72RCsuCWyeLGvwvfIzfvuqJZzDJSJIGE5mNGIrrZgwj/G99SqQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(10067099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NP2+f/XhedoFAg8dxNgplS1h8cAvdiFQdhOfm2ULjD17MGwovRlTa+Uawj+G?=
 =?us-ascii?Q?HdRJPOGRmHMJbuHvjAkQsG7/fGqOFDKoJiiGTvnHSiceigt/e+dBGFN2CFlP?=
 =?us-ascii?Q?cnQLqnX88sOr1fVshbpJER52ljmR/r2bB/kysLqZ/J9v+XvyLRIdStOLYCnL?=
 =?us-ascii?Q?EXgZzbTJkNCwI1vWFS0uNbHlEZ6b4pBcvZZaBcGGMvk2XuXtrTDel4ZQfG6S?=
 =?us-ascii?Q?FOCj5MT+vy7yEelUhhdO6wxfYnLfzJUUkhnmnAyfH1v8ES/H0ZIyrPIbR5fc?=
 =?us-ascii?Q?KWzb/LCm85USnDPoEZai0rUfDg14kIHQzroC4Sv6FBiCAbLATt522Y9JygbS?=
 =?us-ascii?Q?3MzfDczFvbmebbA0ve/mVOEuBNFXB1WZXmf6djEaWjBd+Q4ctnF/3E9KRTLW?=
 =?us-ascii?Q?LpK+HwQAh9gPXfSUN9S6/Anjo/qgHSbeo6K+3kwyKJcVE1eS1mH88zxn8Vgg?=
 =?us-ascii?Q?pqMvywygUMj3pM35bdlS/svrvBuERXCdACN3KWl9IUnnDlaGfE4uyW2X9pNa?=
 =?us-ascii?Q?2Lml2bc0DeKWUPy4j219CDRkTsecZuwiAuhBAFgi+AWhGg6H1E4dQi2864V2?=
 =?us-ascii?Q?1Vu1jI2q2by81NVn9Gn+2VYLykFY7rsawhb6yNWgXmkPGUsI4zpnxXDwkKiY?=
 =?us-ascii?Q?GkT+JwQA6Ss9HaUXNYuQ2vXAle59lUn1nYcwlgrQ1JAz57bmLyf48kajBd8r?=
 =?us-ascii?Q?3xBGIvPCP43ui3/IkUBwXk8MmxmEhPTdROEGO76byviUPYc62HWMzGpaWeqP?=
 =?us-ascii?Q?nlAB+G85f9NdsTijCiq+D9wTSexnuAZhwokNA0gppAl1ons3Pdns2BV47WTs?=
 =?us-ascii?Q?advk37rGOjgyF1iekZmZn7WLVHyL7ZzsU4g/yfiEmhJRoXaU2WJ/qcHkA/sF?=
 =?us-ascii?Q?IUMfdlF6x/erwHIzG8ERGyHVA9fRQbKL4ExIzD+smO1Euc8ekJqfyek5Lpqp?=
 =?us-ascii?Q?cJ3PlrJ/kUAG5s1N4j10XOAbBfmzpT0Zp0GUgUHQG/s4VW9L0QPuJ3gb9vII?=
 =?us-ascii?Q?4zlBFdcEWBqwTVmT0iSbqxY1iCWtyxZjIq7V/K6Epuo6bybRDp73uqMo/rT8?=
 =?us-ascii?Q?4AUbESY4QQpu5JZVEpsmaJKwKObTdO4dpIBS1kFX4EXaG3JzOMUFhxLor0Q1?=
 =?us-ascii?Q?CTdj3fcSpFyqY/a/PnWlam2t+YHaaqR3qRab8eb1sSMw9vG0lCllkveR4Gzc?=
 =?us-ascii?Q?qWvE40FhoSb/YyGc/mr/cNCcM+MlNPwjSLArVzB5QiBXT4tNEHz0kMiLYYDE?=
 =?us-ascii?Q?gofbPtj9K4dRYCLNXQKVLFHQ6y+rMzViyaAbe6lpAa9huj4VtwAxS+YZmTY6?=
 =?us-ascii?Q?x0lvb3Tgntcjrg5wgGxSJRZd13+gwDMI7KMGPo7G3UnH/KXPvEpmPIZoS4MS?=
 =?us-ascii?Q?dTfZavA9XFWF0aHwE3OcQBrXSu0qJn8SGbbAP8yfx036htHr1AFlJf68US1R?=
 =?us-ascii?Q?eJc0ZYY8BNk2IcdudRsrvDBkGW2YaIcJAxx8uESPg26KKRb051QWWNt+3lY1?=
 =?us-ascii?Q?p+LfNdiYHfhams3UvjqLdGrLqTlNUFJwlVYZlr9bHZlEujQIYkqoMTdOAdxw?=
 =?us-ascii?Q?1Mxk9wM8d9PgyRkyqAggs5t0J38iNYEAUTarEd/zU9PTo+QRh7DkbdBcdr2a?=
 =?us-ascii?Q?w/3f6woZp++QsW99KiAXWTjEMDoUCnEX2Cu1IXCAP3ac2AQgDMNGpKgjLnSK?=
 =?us-ascii?Q?RNClmGEfi+BvPoXnk0TVYFjR/xvMbBL3xqp9aqjGoF4WFZ72?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b889baee-b7b1-4716-0bf0-08df44997d72
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 10:56:53.6650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLFwDJY6Vlld/jWWGQKbr2b/3CNTvwZDltf0OXG9z6v5fCWGfSA7E1sJzCwuE46kDckxEbrwW5iTGnkIhbHadg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB540605

On Mon, Nov 16, 2026 at 08:27:37PM +0000, liamsmith827 wrote:
> From: Liam Smith <liamsmith827@proton.me>
> 
> When an output interface is specified (e.g., using SO_BINDTODEVICE,
> IP_UNICAST_IF or IP_PKTINFO) and the FIB lookup fails, the IPv4 output
> path ignores the error and constructs an on-link route via the
> specified interface. According to the comment above the code, the
> intent was to allow sending packets via an interface that does not have
> any routes.
> 
> However, the error code is not checked, so the fallback is also taken
> when the lookup hits an unreachable, blackhole or prohibit route/rule.
> In other words, these routes and rules are ignored when an output
> interface is specified [1].
> 
> This is a problem for Android, which implements its VPN "kill switch"
> using prohibit rules, with the expectation that packets hitting such
> rules are never transmitted. Unprivileged applications can bind a
> socket to an interface and trivially bypass the VPN. This is especially
> bad on cellular interfaces where neighbor resolution is not needed, so
> packets can reach any destination and not only on-link ones.
> 
> Solve this by only taking the fallback when the lookup did not match
> any route (i.e., a miss) and returning the error to the caller
> otherwise [2].
> 
> It is currently impossible to distinguish between a miss and an
> unreachable rule since they both return the same error (-ENETUNREACH).
> Therefore, patch #1 adds a lookup flag that makes the lookup return a
> different error upon a miss and patch #2 uses it to restrict the
> fallback. Patch #3 adjusts the selftests and patch #4 updates the
> comment above the fallback.
> 
> After the change, a packet that was previously transmitted on-link
> despite hitting one of these routes/rules is no longer transmitted and
> an error is returned to user space instead. It is unlikely that anyone
> is relying on the current behavior:
> 
> 1. It is a side effect of not checking the error code and it contradicts
> ip-route(8) and ip-rule(8), which document these routes and rules as
> dropping packets or generating an error.
> 
> 2. These routes and rules are already honored when the output interface
> is a VRF device or enslaved to one.
> 
> 3. These rules are already honored by IPv6, which does not have such a
> fallback.
> 
> The following is unchanged:
> 
> 1. Packets can still be sent via the specified interface when the
> lookup does not match any route, which is the original use case.
> 
> 2. The fallback is still always taken for multicast packets. The
> precedent in ip_route_output_key_hash_rcu() is to not enforce
> restriction rule/routes on oif-bound multicast, so that precedent should
> be followed here too. 

I think this series can be merged. It does change user-visible behavior,
but the regression risk seems to be low. Any configuration broken by
this change most likely doesn't work with VRFs / IPv6. If regressions
are reported, we can look into allowing the fallback for specific error
codes.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

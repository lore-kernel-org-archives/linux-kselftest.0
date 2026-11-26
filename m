Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795696032;
	b=1IM+P4X97uYCYfIJqdgoBIzqOgHM1EeJKbHVV6TTpTuPyADfunpN+jpKz6Cw7GioXBu1
	 MjZ3Nijzgn9PDAb0ydeXMfLwswrIVQc556xIRNCrpd8tCRHi8nBkVF8OhMs3/dNIa8Mrj
	 Cy28Ih8lBGX0nJdsv65P7y9hjad5fOzsWK5MTMZkzPRQ9VZAsr2ZUqyrkRFhs8J7ISrXD
	 708dr/y+ViyGJDhw53SqBdLnhlZzM6Kwt3qCuDVPDIIYQkDnqbUefvTPMT5Yp6+ReAuL2
	 aeAMyxrYvNVUSWz3JpfodtLoumbS5m/Bmdv4qu814XHZlWz9S/T3r0p+Q3eB/FIrfUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696032;
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
	bh=wmOOjVnCaUtmN4qEk2jUs3YBoTOfiyyRrYAHjILOw+w=;
	b=0oZUxQB/3ROJcaVOWzeDLqZnlYm28AU6SdBKMtst0JaanXBJxIdJ5R7PKtAzYf78ytqf
	 YDhZYqsuGEOuO34mTprePsDtDKYoOKR101rp07mCdn3y94VyK6+Mu3aCUZ7NRy5hOo2NS
	 HkhZwCXk71JyXJA1mJRgnzfjrZVCwHp+exis9UrHfDbCcLEDCFyORt5BOfi6shxnDzL5C
	 vX+L1HOCBfmmIiEbJWhNEWecDk94GA0qRi+c5CcBqlVQYh3sR9f0ploHR6KqJ8qtESyic
	 tS2U3VoARHj/2ftz35j0JgD7GfaAWNhyEnBK/ZJrOOJR4uE59iQ17/6JeeeiB4OIeSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cofZZK0R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.4
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010004.outbound.protection.outlook.com [40.93.198.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A132A606A31E;
	Thu, 26 Nov 2026 12:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A132A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cofZZK0R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xdebk0Tc63qOopFkeKuIWEmsAnmEz9OXU+XvxGsG6tkpQ8NmSxq7b/Bqw+9n0kGN6cxYpxQc8pJhbQmU9dF6pIW9kj2nwdcyYy0QAWlO21kzJ8zKndb5VDXN6pFN6QdMFCveL4kIII+36OGm78cPfbmzZWgeVhFVigNQiSeKtcbT2YRXBM5/IYOo2EKKdSBdK0cXL+VS0iWDsTUfxlDpOUmSmv3io1H4QvBRzl+8aAGFmjUjmDSZJcFF3iFCJlQpFzQaFAQODrFZ9uR3rJfV44TZbkJQXUEmqOVYYtBr1UhSJPLYBgG3t0wsb95V0ZM7ZSWdckY0kXbnls0bsSSYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmOOjVnCaUtmN4qEk2jUs3YBoTOfiyyRrYAHjILOw+w=;
 b=lQijvoFTwZLP3bR8O1rLM63mynOQqm733icPc5PH7tRj0Rfa1OUr6wpvaRF46cTOCcJgjkhVr+prGRGd7m36KFQZAHhbNsu2rIvbKyY2qzCatUOwnCN8/RSBgH7b3c/hjOCRbuu4S1K9DbKWCPwC3+oVON/W38H6N4N+yeZwVhlCa1c8nn48FncSKq6SRhswFHc1HNxe+H0cNLuCzqs2g29cXe8eniNCsYBNplc2pBGIfcQ1OTQv3irNnoifuJDKZtvNzT48z3mFjr9NA2E6bz2jRs2wReC8T2RhBPFq3SMxBiaQM3kjvGc2HUNCnF+I5fHavpC7jQly9tqa7RvGxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmOOjVnCaUtmN4qEk2jUs3YBoTOfiyyRrYAHjILOw+w=;
 b=cofZZK0RLPAwlzK6Xhu9nipi+XM35tILiSFb0S8RozhzRmY8BSVEF4vPTWLdrJRcjITjHJxpace8nUEzwvyU/zW/gsZiNZZ7ULuUx84Lukr3XGGFKZjJUrjXgFulk5NHG3b431q94BUmxUDxHA3wLsvy0U4yX05aGhYaEIX3XKVCohs1ko4GlxUT8BEJq/JpxUK9eLmxNWMacONVKo2bpebaG4pblNw5LtV/yZ7mFVER+anx5ED0ZZ47BFU3pNE1bRkbksW55wY4td3TmPKLslhqsuSzXaPI+VMH9vkXo+NxNEcWZH35gRsOXxrjW8GwOLTopU11FnSwFnjCbPG6XA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 12:27:04 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 12:27:04 +0000
Date: Thu, 26 Nov 2026 14:26:56 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Vladimir Vdovin <deliran@verdict.gg>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] ipv4: Don't cache a pmtu above the device
 mtu of a path
Message-ID: <20261126122656.GA729805@shredder>
References: <20261124153730.56549-1-deliran@verdict.gg>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124153730.56549-1-deliran@verdict.gg>
X-ClientProxiedBy: TLZP290CA0010.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::9)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa8146c-dc31-411b-9343-08df4bb89464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10067099003|11063799006|56012099006|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ghcpcytjR8cUrFi7li8pruinAtm7cJad/im30f3xQPJFeXkfbfyrman/QQQKxLScdX35cRu88j+0MeKFQ27e/K8DswTV0PKglLK44Mul2+vPA2lUWmoLLzAJ8fteM3DqCWR9jcn1oQSjm00srPAcnDr9Fm9ZT3T+jHK8pLP6uLi2x8V9ZzbDbhRR23zDAMQ92Llp9bthl1zYAPJN6xc0uhUoI9pYpwDVmpbgbsHyMHYuj8/RvJkVFJbjF/QQ2ECzzPqDE7iBxc0QyvqnjkUVkLV+ThShQZhcC9wny6tqVkapbLI23s39SgJe8DvILK1RUIa69lrMMds0MmplVOi3ANM2Ej9xHWBL7QDvOcLuGtLRbAgaxCP9Ssz1UfH1e9v7WpfbmZeywndve1tNcy/ahT8KMgX7gagTdh9mKWBf0hWD7/6C59JiReiAGSt0MIrqZ5DGKhay7QPsOG2I7Fd/OLRWT4ZGYDwplhePlv2DYEptrbppAIpnD6wB/YzIjQFDATyUIDUGIYZWNfAO0KuIqeNGwDYB6et2fu45qni1KcYHf5xUqDSU8CZKLkUkLKKWt9S+MXNPApiwaLwlNQdgeisFWsjiEeC8yQpCcju696axN7IyJLtOIktdX4LXPCFLtbcycGUuEAq/NUIQacm7arkAnsEN75o6fMzyERzS7EM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10067099003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xB3863AnSUr3bqhyDpG/objeVlnzr4MStOXPoH1ht+ByAgqDKZbxFyWOpRVr?=
 =?us-ascii?Q?so0Oa0+6BOEpXWuRiiSS/Krm+GXiIcUlzckqQz5i8CUOmzyaHl2/NZXDTYLC?=
 =?us-ascii?Q?AC1EBsdkj4rPS4QFEzGDbhN4fcAUizr5HhP6cPPsG1wQXP6roQd+ESG0siKv?=
 =?us-ascii?Q?eSdBDkrCA4U9mFDECAJ59n/VCeUNs2BScWhNl620GboVkY9yZ2Z0MXBLRcZd?=
 =?us-ascii?Q?wkfD8T/05fN36Yg84+sr3VWmSSOmd04uno/PftIioJ2ZRi9vsvVKXgaao9Wq?=
 =?us-ascii?Q?2Ttj0C08DtlEKk6C/kn4gb5U/lv4nR6JhYkPsJat1B44HrGmD9KYBs/cd7Gu?=
 =?us-ascii?Q?zkJZnJ2ak9eMxXR+NiGuTvfKs9wJ7yni5CQSA9fopEgpXYM+1WTXzpJdITDD?=
 =?us-ascii?Q?5cCymjp9YDA+SiC3R/QjdLFbk0IDw5bV/GrQmFpPBP+yCsDfHLaTeMNvpYXz?=
 =?us-ascii?Q?fGmT/5gMDr5zieZABAdAl2P7ICBEeDVFNl9VmjTauv5czZhvtaTaBmtI1E6i?=
 =?us-ascii?Q?6BDdb2ktrKMEd/U7csrUMxQ7aj3gR5ZyNdZO1g1/oecUOwIky9VndGe0QgV5?=
 =?us-ascii?Q?z4JjHIm5pTrPJXLA16EYRRJykYvM6IK10sdWKPRw9OOWsn/Wz/orDJCjwrYw?=
 =?us-ascii?Q?c+LUvY+oQHDIxLWd+dQDfy/HJPC5L1THZHrztqskC6yh39fnsJ73cXnjbQ6Y?=
 =?us-ascii?Q?8VG3kalqGcnM2WH6FlH7hDH3g+se4zUvAR4N1xMlTsNVWcTv0ODpd+AXuyq5?=
 =?us-ascii?Q?TpATWPeMj7CpvOzpHbzD8O1Yucjv2P40vg92fDARzZg2DbsGNlZmU+E8BOhF?=
 =?us-ascii?Q?YryFL4QIxNCKT8Qaz/4TZ4XTMRkcwKhQlhllfFxju2UNEJPhFOWouLhz6ciG?=
 =?us-ascii?Q?xLg8yL+vHrDasTSHB1tZnmUqIzsUk4K4ypv84e/00XQtgbF4Mg2dA+LSe5uA?=
 =?us-ascii?Q?5mTWlWhAWlqvhpxEdjUVIyEBr6FNvCgpiEVfDPy8OjOXHDzZX+c+W9toI7kb?=
 =?us-ascii?Q?XipSo/uIqCj4ir1q/uhicp2D5o9v1VYdRGR8YW+7wASTWN3qk6f1hTRGYx3C?=
 =?us-ascii?Q?xUVmDd47zOWCIoiViglD8gVxfdNm+dEPUfCYuty9wIlamvbHgcTE/uXHhIIw?=
 =?us-ascii?Q?1vyuwAMle66CV/DFPgAhaV7QjUyH70apTdTmFSbTXMxfQMqXBUUHDBZCN+s6?=
 =?us-ascii?Q?89RaJ9KVCRVkreG5DmlXu2t2drbQfAYBdgu5X4CjI9ZfuaIudlPp66REUcy+?=
 =?us-ascii?Q?fwd54uCmZnKsfiW5nfrBXfG2MMRxK+VGqzMEM2I290ziYDGYtWZyu+iPVe8J?=
 =?us-ascii?Q?cudDTJAzCeEUjVSL8dMKgcMJ0Ykd0SLuVqRR3btp1Bmpscp52vziDiqxn9pm?=
 =?us-ascii?Q?m5BBUuZxBOgDNf+ADxkmLsHJGxBjjyM8e6cB6wzEFo5KyyLqIOOXdonKEHQf?=
 =?us-ascii?Q?NQh6+njt2gIkI2uAW8ZCgWWK2W/wbnVTY9ne4jyqV9g2rnOsl1+C+Tb5fy7y?=
 =?us-ascii?Q?5DRkbU0u7v+KCK0ByqSR6fHcgneomQ4b4DhCbkNzceC6uWzO7QnJzOwfbyBr?=
 =?us-ascii?Q?3TW38c1zqXZ+Fbi9NSKWIpFavCuYIpds1MfconeSh5uKb4dkd8lpAAHS83Ny?=
 =?us-ascii?Q?3Df6I7t2IMeaUU1uF1Aj+UooYs1mCV6IzyHtmVADHVQa24xgan6yF16t1qZb?=
 =?us-ascii?Q?g9PqhRUpXya5lilZRYq2mvk3sMIrnZyC4CoIEtInqEOtQFCK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa8146c-dc31-411b-9343-08df4bb89464
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 12:27:04.6938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTj6cYG1hcbcuw6KKU6pD2j5HMjuSp06W5VIhGQer8ENTzwLa2S1arpstn/lcsyMB2N11t1IxtPfITTQgUJwNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518

On Tue, Nov 24, 2026 at 06:37:28PM +0300, Vladimir Vdovin wrote:
> The mtu of a Fragmentation Needed is cached on every path of a multipath
> route, but checked against the looked-up path only. A path whose device
> mtu is lower gets a pmtu above what it can carry, and its flows
> blackhole until the exception expires. Patch 1 skips such a path, patch
> 2 adds a test for it.
> 
> Split out of [1] with Ido's suggestion; the IPv6 part follows once this
> is in.
> 
> [1] https://lore.kernel.org/netdev/20261117193141.27004-1-deliran@verdict.gg/

A few notes:

1. The bot will most likely complain about a missing Fixes tag. I don't
think it's worth it. Nobody reported encountering this problem, it
requires an unusual setup (nexthop devices with different MTU) and the
PMTU needs to fall between these MTUs.

2. The patch doesn't handle an even more unlikely case where the PTB
lookup resolves a dst entry on a different nexthop than the nexthop via
which the quoted packet egressed, and the MTU of that nexthop is lower
than the PMTU. It's not worth the complexity. See more in [1].

3. An exception can be cached with a PMTU above the device MTU if the
device MTU is lowered concurrently. It's pre-existing and very unlikely.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

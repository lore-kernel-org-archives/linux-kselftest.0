Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792948447;
	b=ZzyhANV4N+AgXKSbKqNobX8yXjeLuAsz96I54RwXZAlmwSi+OYsUhQCgvcbqC+d6m3sT
	 H9f1pZ0K1II2OpIkIQCpM8bASURJ1N6ZjhkBLkpsjATXhoR8EgC3onD0VvRYBtzb2F0ge
	 Iu2AnVB48f8Sgtan3Z5EIRmv80wuxXkQ6hExej7nsMuvVlBOtqntJJdRpJ+xHJJUshERF
	 /u9Y7e3MaMCHMW824UeL/j9Kz+Zn+j8cWrVZdAVkXFbSIxXMRzaS553LMtHjl6s1tgjiG
	 iEhKBxzCQsfcjMusRzcqr8hTmT4O7jik3AGdN3CN5ghcdryFYhvEa8QsvvI5u9f1iDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792948447;
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
	bh=8SfEc++oKqDfhYtILOtMbMaUv7rOhhFzoWDnUyyiMzw=;
	b=4h3itJ+fa35fEMoGsk9X7bWEg6zQuyLryJqUuJ3+YIwl60N5yKfELzLmRzigrNjtGg0q
	 9gjXZmSviLaF4e/NVUZRoiBsLZW1e5xJitSoIPupeg43xE4IziWH8iKYC4WzPN29td+g5
	 0HTIzfY9W+n6x/iZs0hVdkTVTFoItAim8Ow54GlNAPUpI3EYTOJInNf8/sQPufnHcUBgu
	 G7HT2tQ9hg7jqwGoqzOPCfbybMjUPkPjVGNSHtKmXpgW9YHNhkzavmt664h9IRLGF+b6l
	 euGIsUwN+lL9u6Ah2iWpyMfxfv9fM6wSG8CgRzgiQzze6RbCyjCxiEbQfnJbEsLyJ9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P6zxOB42;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.3
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3338606A31D;
	Sun, 25 Oct 2026 17:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3338606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P6zxOB42
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM/G22OWn4vZNmaTaUunZWBEeOYDYK1+oSfbMHrktZPDwWZVGO/I2NYDeccLd85gFT7kftftQgtHyr78lwWEhlc8SsaCdtFjBk3M8m//VwQ+b55pnZYKOUu+bYuAiswwbDJB+rd4HGvTHYcCPQw8wMLynNOfxgaKbZYMUQPygXBO1zjKMa2/Sui+VnfqAai8+lRRIru50HgBTmYBbJogzre1RJfNbevcaaz6jdjLUP99RXALJtyRHzZ+Vzrgu20IFgJISxBTMoISPY/WaRcXm+efCdF9j3gkzqevGl7cNap/vEFdl1DOAQGU3MBVaSq15hd1e+1R3o6V0xweLaj1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SfEc++oKqDfhYtILOtMbMaUv7rOhhFzoWDnUyyiMzw=;
 b=FmLaEv6Lb7oRA6Kd23kk/lEQgDujobW6EfsbgPBEs6L7fL4dZ+PtMJI7Xb2E3vv6B8nHbf9A1oBEG55ykd6mLZ+crhs7u6yeRPoFbcPvcS+iuPiynBmOFP3RsYhYYeFsQXEIFjz3lUtBvLU0SUPqOBbkC/Rvuj3z9/fB1XySjr0PeApTFSFA2m68njwJCOBa0cnc82n82Pha7B9OIVsGxtFpqK0BAkyCeq6W0io8Biipp2yGdxTSwKnuGi/EoS37STAD5cSGGqhBDee09GiXPtwJKWzNiBtRoWqdX7izASxz3sNIP2NQ/oau5KodhIKKN7aRbP2Du3rMrngUDBGyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SfEc++oKqDfhYtILOtMbMaUv7rOhhFzoWDnUyyiMzw=;
 b=P6zxOB42/8FmjStt5CvFYjNFa1umX1B60Ft3hIPzaQmY4lnq1KXDgIzggARyJyq1xRGHRB1zqVGlQ63xebe28qLUCsMpkb7MeO3VmfolTmAUlBdXSWz+xgyIgHLBRckccWVtpLiuDGTtPazE1gyDgeAsTnqeepjvs2n1Fydvw/KqYzw4cDMAjjbsIFIt8Ury6rIN/H6s14Dl+Ufz+lIpdycLMSCAI6tKJo1YsGggUcAH3B85UutWgpLwELge11pmWro56Mv9KBBuig+ZU4g3/ONaBiOep9hQPWcnSKdhpYqGXrBmOfldIvCHHyBkiFA/I+ZpWDIuaDlfIVgbFzlGYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7948.namprd12.prod.outlook.com (2603:10b6:8:152::17)
 by CY5PR12MB6431.namprd12.prod.outlook.com (2603:10b6:930:39::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Sun, 25 Oct
 2026 17:14:03 +0000
Received: from DS0PR12MB7948.namprd12.prod.outlook.com
 ([fe80::5acf:54a9:f68e:6952]) by DS0PR12MB7948.namprd12.prod.outlook.com
 ([fe80::5acf:54a9:f68e:6952%4]) with mapi id 15.21.0546.021; Sun, 25 Oct 2026
 17:14:03 +0000
Date: Sun, 25 Oct 2026 19:13:48 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: liamsmith827 <liamsmith827@grapheneos.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, liamsmith827 <liamsmith827@proton.me>
Subject: Re: [RFC net-next 1/2] ipv4: Honor prohibit when oif specified
Message-ID: <20261025171348.GA233026@shredder>
References: <20261019032406.88874-1-liamsmith827@grapheneos.org>
 <20261019032406.88874-2-liamsmith827@grapheneos.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019032406.88874-2-liamsmith827@grapheneos.org>
X-ClientProxiedBy: FR4P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::20) To DS0PR12MB7948.namprd12.prod.outlook.com
 (2603:10b6:8:152::17)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7948:EE_|CY5PR12MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d27380-3a87-4d1a-148b-08df32bb5dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003|261021123027099003|261022075727099003|261021121427099003|10067099003|261009223027099003|261021135927099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	wdRWoxNKvQnihTQVk8P48X0ci7mF9rb+4RrhXsGcqNKu+DNzhqz/ECDdvD9hrRJBHUqjhrlHdj1w5EWlSKSDSxV1VKPHTa4xZkhpekMJ4dn8LPtA6cAwCMyjfUGG5OJiwtJ/VCz5dBkoxsm8JYY1D4uXS6tJK8KmqXi5OOxr5pIPHE/81wr6mvYIpi5Agbud5gjESGd48zqEh2m8I9ET+Y2w1kQnGxraEDApO8TElyao3DnddtGjsiIZ1RAlX6gNQ+X0ReTHDUK1IiCEoyWq+5ewcy8s6xOLoO5t5Q79dPuYM4IawIVztYZK++yi2Wxqp63kPf0/xzsUyBooKupvlLhnHw7BO6prOAf36w03Pi8odTTViFBznPT58GDpejsQ+VDx5zx0ThmieuPEhSE7bW0iQRRLEDfVuvrdBHZJDexhG/iA/Sbwt/A45+fFH1gB6NigYlfGkyhpYBPQDWflIaXO7N3e9WY1tsB/U1eowG/ThZf36QSP1dfKiio/b38985ILm/56Mro4JOR/Clx0SsaQHCnu+91svXCt8ZkaMUrhph3Q/AKtPXNYNzFLJGaxr+AI5oMP2U7S/vY+9yp+ugYlQpkEU26bQbgiBHhPcYsjRPy4pI7Ncqt2zDsXgloqb4q3UpXj8GgNnfCy+VnkOukYlbgkzV09PXqsqQW6KTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7948.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003)(261021123027099003)(261022075727099003)(261021121427099003)(10067099003)(261009223027099003)(261021135927099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TkvD6qRqoPXpuiHnHQ+wGqiB9AVVYyvev8nZAaQPnN6gN81KCVSCP8Mbcm1i?=
 =?us-ascii?Q?kYPvUt/175Ex00RQFERMSL2Y3BLxOw2ljRhU+aQjhjnPSh38CK25mxKdM5+7?=
 =?us-ascii?Q?MYLcor5rdHl0FLVwNGTGCjReK/7nJerp4HW6hJnhIJLSwQ3t1cNMt4k1T5bN?=
 =?us-ascii?Q?qpjngXcNZzrHWnSK3OoFDv+AS5M4lz3NA+ZkbRB99Obru2V6L9oSETO76LCP?=
 =?us-ascii?Q?8eKVcqgUZdxv+2iD+nrMKLHFg0kBRcKsD+kAJXfIvYXVanSksOlLEmsF5gBh?=
 =?us-ascii?Q?nLnDGUk1e2SjNrN4VlxQdPyHIjZNFlmblz29y5QpbyryMhcB0smDrnAXFILw?=
 =?us-ascii?Q?7lmaqYYVzkFYtGis9xQcvwJxERzmkh2/M+TxFite/8Nz8wX1QHqMLEQwvr44?=
 =?us-ascii?Q?/pbFkJe4F6vgGK35SeofrxNFnNMOUA9urDLo5Z/xccsOUaF0XOfbWvp1YIzg?=
 =?us-ascii?Q?25TRhnwidJ0ktPjL9Jsr0PW3G4HIfmUsYbzC7zJMaSdTp/e0h+rbMKemUpMH?=
 =?us-ascii?Q?ZTuDFlljBsAxA3PBxZTsqqbGYV4hunklz+P6/sDpxp5IdaGyS5m/o5hrVULX?=
 =?us-ascii?Q?Vwt37XdrR54iFJ6Ic8TLiJJa9vtzkvMgMV59wNQuY2TIbEeoKBU6BeYo7zCe?=
 =?us-ascii?Q?fBanOxPSgycwqbrWXGDTZ3Y2FvOhyIiWDWxvDVwAsarKDJsdrJztNDk8Y0VC?=
 =?us-ascii?Q?fUfBs5D6uHLOZhzUYMFyhvz+ABUEDhV9MB7/FvwNOWclR3AVpUXPEM/itoUs?=
 =?us-ascii?Q?mEUmVf19b64RGEpTZ5x4/36J0l/FwK+rJJ9XigOTKDfQC8lY3qPJwrXF/KbW?=
 =?us-ascii?Q?Xp4mYB8naiZJR21sUhzz11+GW0nc6z4QU1jhtUD28RhMy+zJTiYkSQPkW2Bk?=
 =?us-ascii?Q?SiwfvWwmDL5jQ/o+xU0VDstEp0bCn8p9DGpQwyyfbuSxL85r4FYvtlMXBRgd?=
 =?us-ascii?Q?T4Tn52tCc2QhxoGwZKrioURyLJi9iuMKbXMbjl6oCgLph9m4GLXK+1ED91CB?=
 =?us-ascii?Q?oauc4FX95Kc8iChWUxKnhpf9TSfxlH72eOLdTO8AfvJuNKCBvSFXesTbrO2T?=
 =?us-ascii?Q?LKqfMC5dRpVLPJDNjqskjgnwOLTBPhwlCHX8hyZ1+Kspl8aHGlIqbHfLloYS?=
 =?us-ascii?Q?rCUfNPMGontiBt7Fi0Sq4Vel6ijuaTnfl93AinbRNst8j35JIPO8ONBSU+8c?=
 =?us-ascii?Q?ybc5itBIMhqf9lW0HcM/Ir0eDImVj/rQ7sxOvz2LPe95K7UkBywYCs1O7Z5Z?=
 =?us-ascii?Q?UCdjSYVUW393yOa+2sO9QlY2rgFvZI7eUQQ+eYjzJ9No2GC9sNewJ9VQJla5?=
 =?us-ascii?Q?nkdrdu6vrtS4WT/PIW1fCFuFLy0zAXye1pu7PLrWop5C0MlZ+Viz4hT8FQBm?=
 =?us-ascii?Q?Tmc3ZYyQQB1Itkde0LlS0b7/ydE4oxaGY4VootVvgd8P0PSPlnnL3YV3TZ0C?=
 =?us-ascii?Q?FqLswD8JHfkFyMRkEIK2XLxXHO5pDXKGCfngAhF6lcX/xchbCyp2sx+6wZ9Q?=
 =?us-ascii?Q?yzvA3ZugUdf7A9muHfEKDzDPxedXTOIgDiT9o5nrddoKGzJz5CawgscRmJuN?=
 =?us-ascii?Q?P15LgoiKy60KQNU2fhzLBmaIbGdtXtj7DYo+3+VEJppr5nVogUwgVKiy/Qu+?=
 =?us-ascii?Q?eaI9mQ7Kxl5Q1HoZLuuM+/Ge8ztxhjitqL1nwtyepVc+LreAkGB/kY8UsAvd?=
 =?us-ascii?Q?6KCZcSxBdo12W/VgY/ykRFSUMUWfd8g7T2WEyzZTZSP1QtZd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d27380-3a87-4d1a-148b-08df32bb5dc4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2026 17:14:03.3290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQeM+BSsUhmkB+B8fGeoUGNru5n14L3z0Me1ZsrrERvU3hIhIm7hYHvccwxPIrguXGOQBfAuZ/C8xH553IqR8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6431

On Mon, Oct 19, 2026 at 03:24:05AM +0000, liamsmith827 wrote:
> From: liamsmith827 <liamsmith827@proton.me>
> 
> When flowi4_oif is set (SO_BINDTODEVICE, IP_PKTINFO, IP_UNICAST_IF,
> etc), prohibit rules and routes cause fib_lookup() to return -EACCES,
> but still allow the packet (and any necessary ARP) to be transmitted.
> This is documented as the expected behavior in the tests, but is
> confusing for route and rule maintainers. Specifically, Android uses
> prohibit rules as the basis for its VPN "kill switch", with the
> expectation that any packet encountering such a rule will not be allowed
> out. Due to this interface binding exemption, apps can trivially bypass
> the kill switch. This is most serious on cellular networks, where a
> connection to an arbitrary IPv4 address can be established without
> requiring ARP resolution.
> 
> Preserve -EACCES from fib_lookup() instead of constructing an on-link
> route when an output interface is specified. This honors prohibit rules
> and routes while retaining the existing fallback for other lookup
> errors.

My understanding is that the original intent was to only ignore the "no
route" error (-ENETUNREACH). The comment in the code says so: "we are
allowed to send to iface even if it has NO routes".

Ignoring unreachable, blackhole and prohibit routes / rules is merely a
side-effect of not checking for a specific error code. I find it very
hard to believe that anyone is relying on this behavior:

1. It's confusing. The ip-route man page says that unreachable,
blackhole and prohibit routes all discard packets.

2. These rules and routes are honored in the VRF case.

3. IPv6 behaves differently. These rules are honored, but IPv6 will
backtrack to a shorter prefix route if it hits an unreachable, blackhole
or prohibit route with a strict oif. Will look into it, looks like a
bug.

Given the above, I think that the patch is too specific to your use
case. It doesn't make sense to only honor prohibit rules / routes. How
about checking for 'err == -ENETUNREACH' [1]?

It doesn't allow us to distinguish between "no route" and "unreachable
rule", but we can probably ignore it given that it has always been the
case and nobody complained. It needs to be explained in the commit
message.

Note that multicast needs to be exempted because of VRF. The lookup
fails on the unreachable default route in the VRF table (-EHOSTUNREACH)
and we construct the route anyway. It is also consistent with IPv6 where
these routes / rules do not affect multicast traffic since the
per-interface ff00::/8 routes in the local table are matched first.

This change will allow you to uncomment all the test cases in
ipv4_ping_novrf(), so that it matches ipv6_ping_novrf().

> 
> Signed-off-by: liamsmith827 <liamsmith827@proton.me>
> ---
>  net/ipv4/route.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index 595a3b7f1783..616c20299334 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -2853,7 +2853,7 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
>  	if (err) {
>  		res->fi = NULL;
>  		res->table = NULL;
> -		if (fl4->flowi4_oif &&
> +		if (fl4->flowi4_oif && err != -EACCES &&
>  		    (ipv4_is_multicast(fl4->daddr) || !fl4->flowi4_l3mdev)) {
>  			/* Apparently, routing tables are wrong. Assume,
>  			 * that the destination is on link.
> @@ -2864,13 +2864,14 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
>  			 * addresses. When oif is specified, routing
>  			 * tables are looked up with only one purpose:
>  			 * to catch if destination is gatewayed, rather than
> -			 * direct. Moreover, if MSG_DONTROUTE is set,
> -			 * we send packet, ignoring both routing tables
> -			 * and ifaddr state. --ANK
> -			 *
> +			 * direct.

Why modify this hunk? Looks like an unrelated change.

>  			 *
>  			 * We could make it even if oif is unknown,
>  			 * likely IPv6, but we do not.
> +			 *
> +			 * Additionally, when oif is specified, routing lookup
> +			 * allows us to check if destination is prohibited
> +			 * (-EACCES). LS.

Please remove the signature. It's unnecessary in the git era.

>  			 */

[1]
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 595a3b7f1783..b10ea8bec090 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2854,7 +2854,8 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
 		res->fi = NULL;
 		res->table = NULL;
 		if (fl4->flowi4_oif &&
-		    (ipv4_is_multicast(fl4->daddr) || !fl4->flowi4_l3mdev)) {
+		    (ipv4_is_multicast(fl4->daddr) ||
+		     (!fl4->flowi4_l3mdev && err == -ENETUNREACH))) {
 			/* Apparently, routing tables are wrong. Assume,
 			 * that the destination is on link.
 			 *


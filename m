Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4034A92EC;
	Tue, 15 Sep 2026 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486075; cv=fail; b=oq3uYJaMfb5xWEzvD11Pjq4cgIkYfK7UdadbLvricB1GS/ZMcpiHVToMlDBbDTa511IkJQJJdOGZKhB7JBcPC4yD1wnUJNYFM9LKJipkRgmc3q9X3hrlKPiBpbBJLSrEe8he9/DIQMpk7qC8PGhDYIna3ZhmK+atI9v7vZqdXkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486075; c=relaxed/simple;
	bh=+b/yvPdMhFggPaZ/8AMKAIwqgbvBFVP1h9I6YR68sNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KxGzlO3t5d5zfp3MZZx/vraMfC/VXD5U9FKmIoWl6KjUp8mKR/3OSVKMjD/hB1Ovy+JTwyPHiiLyX7xeYF7/uMxtzVkm8MLX+3yHVbSpL5j4zq6BEsRShIX9JMQYbA2TZwlSh3yxawD5IQMSSYA/o9ZYf/dL00Uu1fOMrDBOlDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RD9jCTCT; arc=fail smtp.client-ip=40.107.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RD9jCTCT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfcrlWVdUsdzGeZwcITegE0UYuZJTHs+w5H9f0fLljY4SuogAiOQUN2orP87wLf6AA6mSqinMfcOLfYsd7uf/qGtZ/PjAEKszv+EYsF81nTyN7hq5aWFRCeVuWoBbNA+CuS9AHZ/RdawSfNxxvLc0uTUj9iJl3TwKITFqR+o0J1/1CM2fuFl89czjofh2T1KSbBf9B5zK/KVcQOrKRaI0n9JBbJ1RMXN92gx8n4TyYEkSSj4hXbQqhngVC7qm13ZAVpiLfT/Hq6lF8ouGkyeEWUB1qyTP16Oz+Sg3PKCXTYsQaVxbnmQpNBWKkEQB94xCkSdSZyqnX+iyUr6XS2K1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye7dI89rlXkXd8fAnD0nu1yAqAuKOBEhNOzPzlqil/0=;
 b=Q1n/0sQGZv6zKksYO5NNe+rCz8XkFyDmq/MHNRDqChoizWWVApQ4E7uXCeGbTczF+o7RHrd5G3V/uhrL2LyiJI5pDvm5y4Z37HkaBXhDYN5ydpk3NBfSrCvKstoVgkz0RHaMbaN4wIFQLNM9Gn+FBJ1iJzOHW4HG41LY3tRSZM8Yg9rk5R/w6wG31H202Mh1j3oD2pvG0ROXFmnwAGTgt1WzIwtX964zK8+g5gc2HvPvdID+kFNY+bv5Fbehx7Id46PJ7HIuCw4fFALcOqnGaE8nV/55Cydf4V4SMvBMvgOBvzl03wxzmb8rh8AaLke765abIgIYNtOBg5yCir/EyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye7dI89rlXkXd8fAnD0nu1yAqAuKOBEhNOzPzlqil/0=;
 b=RD9jCTCTOBC1Bhk52C7Utx/kCfphv1jn+vIc2xsiUT+OPtkuXpIEa7jD2FJQCOEGqHJjW8N2WUlkJNOtICzKxf4GSQZ3rlSEmwKstsldGnTJ1IiuhFGQQL+uq7L50jaJwp0qKnJ9E3Og4nYPIDcjtP6NgHhi9+qxxRln0iycLiuZRAWJqheaUS4b7iOs3urPHzbtRZrGEhraOOnPyAcnCB44pBxOJcwLhucJ6znmF4SI0pS3/qeDyfIQfYC+HiHfL3dpD7MZVjUZUbPRgG8Sjlfve28jE1f9B6ar9BF0MuSWvmxspwW/jyhYCRLxRju7JAL7wb5zFC6TP4KvZw5Z/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 by SJ0PR12MB6992.namprd12.prod.outlook.com (2603:10b6:a03:483::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 15:27:45 +0000
Received: from PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499]) by PH0PR12MB7957.namprd12.prod.outlook.com
 ([fe80::9251:acc2:cc63:3499%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:27:45 +0000
Date: Tue, 15 Sep 2026 18:27:34 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: markdamirkan@gmail.com
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexander Aring <alex.aring@gmail.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: net: add RPL SRH loop test
Message-ID: <20260915152734.GB723831@shredder>
References: <20260911-sympwn-rpl-send-v1-0-1753993bb584@gmail.com>
 <20260911-sympwn-rpl-send-v1-2-1753993bb584@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-sympwn-rpl-send-v1-2-1753993bb584@gmail.com>
X-ClientProxiedBy: FR4P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::11) To PH0PR12MB7957.namprd12.prod.outlook.com
 (2603:10b6:510:281::22)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7957:EE_|SJ0PR12MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: c9110d0a-ae88-4ea6-7d84-08df133de3e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+TGH9/wJj/gPD84OvFva5P0YHSR+DMLQZ41gxHeFJZft0LeGfrMuzgbW4ZTfYlU1zb1yf05u+jl/s+9xKFgXQ8Ir/hVgJ5n3ADJ6ryPJkJZMVdufnPP918cnuVAIFfY5woA4+W86YdSaCturtH4T6v8hGvkK+BhZYxExGKKfVdvua9AAif3OdDZBrZbp2HooBgraNnL9xxENOHtx+SYq1Zcqx6YNpL3U7RsaTjf2BcyYQx0N8bEcIBgCYaJG/nQLrmpz96rZ18818wPogK344vj+HBylxhVpvmqpimelxm3ZSKA/TCMqxUYay+/IvOV0iJ8iw6+MVBK+M6RjTnHNwaXtUHxAqm/sAJsU94qLvbsfnzr9kHVQSxFVTE4sLZSyQFCNlYIcaYlSy1B24+BzaVKtVo5VfWdCFEcgroskfDqUEX/lVwe9GzdAGRUFwTqhz40bCAOWSt9GlHI4MoEHWbf3tKZGa02+Q69n7i+F+GIUtHqRZo7RlU/jtJykW8xIB7vyOgxQEM4fAufAbxaG4yCinerp1RnSxt5ALQ13ANGZUs4V5J3NzQLObPqIYxVgIgW/bHa2xdouxDsTIX8Z+2/PJCluqOcKHMLuOK/Yy50ksBwEC4cwYWrU2re3WMUJgcu4WE7tFhZh1BGZkj/h1eqmwXhLHj6tuSTzCiWdBC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7957.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gzUum93BHuMquybHGPTkMsoZL+XzlX8FpOVVyeNfMRQt2EP4bvZrsSZk9Pak?=
 =?us-ascii?Q?TMiYNJtKO7eUwNY6sSWTue80IE4WqJg6cw8E+I4+r6PVI9uuJMI2/i/MHW3B?=
 =?us-ascii?Q?qAFhBq3FP7iv3sXP7EFT0PXD59HRNpHkLdwiyKP8wW8mlpio/rMyYHlflXa4?=
 =?us-ascii?Q?Ku9l/wk6p3I6Nme9ryQ9LaOUsWDhOYYV4sQKzH0oX8eE9uejYjhcrzHIFZ6L?=
 =?us-ascii?Q?VkzTOa2hCkwvLgihOCHsSqeMF9QNg9mO/x0gMx9Ofa/4A6MQkq4d72PkzzQw?=
 =?us-ascii?Q?CJswU5BO4Rv9En916yQWz9wqVJtMRAUM0xSyW70McYdEV320Qh0j0dJCUuVI?=
 =?us-ascii?Q?LfDwMm3BBCArsmI0eiB8LsSm4J0Ll+q2gXWf9/gs3dVGEqrEIyQWQCPHBW/1?=
 =?us-ascii?Q?Fu4X1Nx516QWzGXUEx1lsr5IxMQ/uN4cXLLPlecb0CKlygm5cFPP9f5a9Eqa?=
 =?us-ascii?Q?AIgF45thsj6VVKUVWFE5ILX+DBul2q3hQ11y5fwHQrtEhP1rvpdYTi5ibF2K?=
 =?us-ascii?Q?RXRID4tLeKex872ny818Jty69DPfPt0d0dSW2PVczlQRiJCbz3uqwqnSwSVv?=
 =?us-ascii?Q?37L0jzUqbY50klSilzaPPCl66T2s6Fq9oxpuqrPJOZvkw0xpc2z1dCTlKkxO?=
 =?us-ascii?Q?dMStpRRC03N2aP49yNNEAfWI2ji93oNn2K23onf3EIqg4Uc5S9A9EJMafOCs?=
 =?us-ascii?Q?W67jAWWZLjLMxBU2xoC8hTti9NZ9hXZ0YdmodIr6EX2QCWubz7QIg1DLReWu?=
 =?us-ascii?Q?RTCvOyBViLZzf5fYPVO4WnbuChtHgPEVQMnhN8o1Bx5sCmm0g+Zmv9NuaKgH?=
 =?us-ascii?Q?gprZ4OZ3onozQQaEXCfEGJJ2m2g677ZIo/wSLqglrKxsEx3Pefj1EZSjsoB1?=
 =?us-ascii?Q?kjuN6SQE8O9OHK1n2yOjRukHHb2YvaQZABdYaTKx0YpyNaLjPLtD0DhcMBj9?=
 =?us-ascii?Q?ysI54hXyOS/dha/Z8IJjPvRe+GS0K+wcE8ELFzBSptcT9+voaETcT3JPEuF7?=
 =?us-ascii?Q?dGlVAlpvc0GS1pihCx09r9ZLFbo74lxP1GLPuS1nGoQhdXHYXlCKOyETtY0z?=
 =?us-ascii?Q?1CarvGFAc46DjVqfdjJcWT2Bobo3vPtV/iuWRcaYO1+WUuF5YSHJAANcat5O?=
 =?us-ascii?Q?fUNu8DRPZQfoVeUi8biLTdgbpH6/YIQxj/NyUOum4DLgZ1FwCFtY1c0QlD1E?=
 =?us-ascii?Q?RgtDf0ocCn3NbZaV4ILsSlZlVNEB7H6Ww+spHZtHf0lXm/gco8WFnXnFe35s?=
 =?us-ascii?Q?UH22OfZ4g3CeQ+u4iNczNqeKO7AlV9mxgQdJ+02fkb5yDEREHjo1EScKeFq8?=
 =?us-ascii?Q?DQHpAMOw4PXjdLlNWXA4D442KwEdn0kQrkvIaSBSt5n8YLSw/yQQ/SPq7Nap?=
 =?us-ascii?Q?YCA+aJ2uMhgj7K+zhDiCNQGx1TZEC9ElzeTZESMIgjK2Pl7poyj9FBqEqgVb?=
 =?us-ascii?Q?lKGFY6RYU7pRlv+QrfAiyj5u2xIDoQKojy6bgpGFP/XlN9Zq5vtAHlmmul2v?=
 =?us-ascii?Q?ONfLdqL+8lwbUzBkoawIAgoUktj68IP5eykBTufI5axTv46LWD+o9brWro2m?=
 =?us-ascii?Q?yvaAB1lVKgAOEtHJqTeJMvB5WiXiEkQBAELtqg23yDsC5EFy29y7ZAcqE185?=
 =?us-ascii?Q?4RY3acymugZA9ON/wvtJUGFzGYfI5ZVhspM84TwtNDDLNocVw03RGhnQhxL+?=
 =?us-ascii?Q?ZhdSbETGBBKjMUklyz44ra0WpJvNLSqDTh7w6EohBobKOMoaMqGGvDFRdBh0?=
 =?us-ascii?Q?vNd5UAY4RQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9110d0a-ae88-4ea6-7d84-08df133de3e5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:27:44.9720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lrqewaPguZIgSdQB+iBL5Ffyc8RI6InZk/WvRE5RcEVjALCeXUonnYk1vG6eiAuoYK0mW63U3QBLs+hHOKxPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6992

On Fri, Sep 11, 2026 at 04:11:22PM -0700, Mark Amirkan via B4 Relay wrote:
> From: Mark Amirkan <markdamirkan@gmail.com>
> 
> Add two local addresses to a network namespace and exercise RPL route
> validation. Verify that adjacent local addresses remain valid, while a
> non-local address between them causes the route to be rejected.
> 
> Signed-off-by: Mark Amirkan <markdamirkan@gmail.com>
> Assisted-by: Symbolic

Thanks for the test. Same comment as before regarding the tag.

> ---
>  tools/testing/selftests/net/Makefile        |  1 +
>  tools/testing/selftests/net/rpl_srh_loop.sh | 38 +++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index 3ee3378f8b26..7fe7e38b9c6c 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -80,6 +80,7 @@ TEST_PROGS := \
>  	reuseport_addr_any.sh \
>  	route_hint.sh \
>  	route_localnet.sh \
> +	rpl_srh_loop.sh \
>  	rps_default_mask.sh \
>  	rtnetlink.py \
>  	rtnetlink.sh \
> diff --git a/tools/testing/selftests/net/rpl_srh_loop.sh b/tools/testing/selftests/net/rpl_srh_loop.sh
> new file mode 100755
> index 000000000000..a2e9991d789d
> --- /dev/null
> +++ b/tools/testing/selftests/net/rpl_srh_loop.sh
> @@ -0,0 +1,38 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +source lib.sh
> +
> +cleanup()
> +{
> +	cleanup_ns "$NS"
> +}
> +
> +trap cleanup EXIT

This can be:

trap 'cleanup_ns $NS' EXIT

> +
> +require_command ip
> +setup_ns NS || exit $?
> +
> +ip -n "$NS" -6 address add 2001:db8:1::1/128 dev lo nodad
> +ip -n "$NS" -6 address add 2001:db8:3::1/128 dev lo nodad
> +
> +if ! ip -n "$NS" -6 route add 2001:db8:10::/64 \
> +	encap rpl segs 2001:db8:4::1 dev lo 2>/dev/null; then
> +	echo "SKIP: RPL lightweight tunnel support not available"
> +	exit $ksft_skip
> +fi

This can be removed. rpl is present in iproute2 since 2020 and
CONFIG_IPV6_RPL_LWTUNNEL=y is present in tools/testing/selftests/net/config

> +
> +RET=0
> +ip -n "$NS" -6 route add 2001:db8:11::/64 \
> +	encap rpl segs 2001:db8:1::1,2001:db8:3::1 dev lo
> +check_err $? "Adjacent local addresses were rejected"
> +log_test "RPL accepts adjacent local addresses"
> +
> +RET=0
> +ip -n "$NS" -6 route add 2001:db8:12::/64 \
> +	encap rpl segs 2001:db8:1::1,2001:db8:2::1,2001:db8:3::1 dev lo \
> +	2>/dev/null
> +check_fail $? "Separated local addresses were accepted"
> +log_test "RPL rejects separated local addresses"
> +
> +exit $EXIT_STATUS

Should be:

exit "$EXIT_STATUS"

Please run shellcheck. Preferably via ingest_mdir.py:

https://github.com/linux-netdev/nipa#running-locally

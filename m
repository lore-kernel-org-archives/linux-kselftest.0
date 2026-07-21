Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011022.outbound.protection.outlook.com [52.101.57.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68133655E2;
	Tue, 21 Jul 2026 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647277; cv=fail; b=D0Js5B+V45cIfR89FnFuXHXiSSBFome0quY8ioVtzzfivpyB16ZDJ31Ss5h901Ec7oJPZumVCXw3G0SVOlQa7cYRaQ2J8Obs7cPdZsR4+qbbf2a9QADS7YMySQJ68OSl1A1eHoOq19i8UlL//POIm4+wn5YWIU7aSpCWi6R+Cjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647277; c=relaxed/simple;
	bh=kyzM+/kZ2rqFmOCDSezxrQJZxeTRk9CbcaQn+OvgTcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d2zAp3oUvqdUbUcAKyxrggiO3EUlz9ZH/aSud/9yGSmJejDwFKbFvtVo7+oAvz+m4g1gWm5IVdZWD1O+GvQebTU6fl3KX8jNGmJ0X46veVQigYegFGBIiD+76ji+4RcFcZPHu5Rd4x3Qfb7R5STLbEzjNN++XbrrcxAxMdKCVdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ttQsGvef; arc=fail smtp.client-ip=52.101.57.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ttQsGvef"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEa3T9Z6EKpKIEL93OHaZGB0qAEv5OBNYuoerEsPaeLBUc44wuEA4KQDSVLtHxMgqm+IXxmCrEp1EXuJDxIa5FTf6pCqiEfqHiY/W7acxvQdAs3kXpZSOj+kigtIZPU+FYauScWL0/UqOwdNmeAOMhYqUv+E0yyXVUAHyJhZhhOVzE+9qnLJ43n3Btv9H3XYnsiOoqpQQPXWYNWhf9U6ZqmFJSjDAvKRtzncvw/AEVrJ85ye9WdPyWVK6ieWYiNnLmJpDcrmzUlzln7Gan9kdiSxiKR7OYcPzPJlUVKcC4Eb3s6YsBZiXm4lpE+RdbQOzhCLa7qJF0JmoqU8iq9MJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41TGRzl0A/0+g6FZu3WVC/CpS/a2J6e/vX/I82Ot/y8=;
 b=CH4qu/PAfR8lbFHefeDR8z/HNY56qaXib6qKjd8CB7J1SfrycN7sZcBQQm91KCAnL7h3jBl4z5rzSZNwkY+GBRHsHs3MhMf+LOk5V4SUrRIstnshl3Rsk07wuMpU0gd3lTYltptd3GoNgYHOuTVFVn2wOLmHXu1dlW18w1Y1Brc4jzKMdJTRcJ4dZyXRLlYV9/2lvGbksaiMKsbBHDE900JoOxUeISo5KGUfO3AgccGskvtoev8ylFchCd50HYKwtVyBpkkYb9EH5B/PaUi1xt3jCOFaK0J+EQzgzO4cbwQdy8SRT704GkcC+UgREEL/5GMtcRAciLuWmw3f0IRFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41TGRzl0A/0+g6FZu3WVC/CpS/a2J6e/vX/I82Ot/y8=;
 b=ttQsGvef2mJo2Ee/dRrtzDESfvFUFsmR/yr+IjTkyZF6LceCeJTyKTOIMR3qQGY7d7Akatfek/3TPVKU9gRK/IoN0Fi+BNyHS6nTxIUaPiTNfcJT0ZOZqO8etP7CBA7wYiMUTw1B506H4IgFBbAe509FtZQLfQOLRAYDY7RKlDhJIrLC/oC3/kYd+lBEgSb7WWlziJOxkGWOQgs1c8xnVIfAN6Ya3jJdm+ooNHv5WmAWC9mr6FwV1gyDxAlkgZ6MqNllJ5d0TPxtwXo3tXLWtzWilbkBYxEFMQayX62996WAi/tJ2GeyXDRwGx5A7N9Fd72YEZLVGqDg0Uyyw/rdOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10)
 by LV3PR12MB9353.namprd12.prod.outlook.com (2603:10b6:408:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 15:21:11 +0000
Received: from DS0PR12MB7900.namprd12.prod.outlook.com
 ([fe80::3033:67fc:3646:c62f]) by DS0PR12MB7900.namprd12.prod.outlook.com
 ([fe80::3033:67fc:3646:c62f%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 15:21:11 +0000
Date: Tue, 21 Jul 2026 18:20:59 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jack Ma <jack4it@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/3] selftests: net: add coverage for fdb
 nexthop dst port
Message-ID: <20260721152059.GC2667735@shredder>
References: <20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com>
 <20260717-b4-vxlan-fdb-port-v2-3-f4862e8fe867@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-vxlan-fdb-port-v2-3-f4862e8fe867@gmail.com>
X-ClientProxiedBy: FR4P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::6) To DS0PR12MB7900.namprd12.prod.outlook.com
 (2603:10b6:8:14e::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7900:EE_|LV3PR12MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: dc017119-5799-4ace-d66c-08dee73bb253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Og/yp65HbQ37cOmcztDHdsCUodDi7sXZjxwrr1QeGf8Uc77KszgN+mMgzGllNSk0zxfj7HtFwKQyELDlhf7mBjXEQYgFXV9yJt4zq0AuzVAlnNcRZXhKits3ESTQwkTGKlYumr16MaVV4QaVhOpAsoEZTHKJaW6zPTyvGLn/SAj4C1LoYCjPiqBM0Oayazay1U9LEuVfVrvcAkcYOH/ojABxfe7qG5cgL5bL9byx7O3+3w+NwG5R5LkmczHqZt+K4K6yeWqJiS0CokPNeKPRYWqJo7wAEqGVUyobNJf89zkPCfZTUeBHT4gFRVO3UVErPgFX5imCMYjsJOnS2UulKpvyYyr2wF0J0cp7R5I36/GG8vLiO386A5PLuJG+T0daTmy5Nb9B6M1EadQ1Y74BnP6J7OsiyUemqMi1gYPp3PRq2QSXaS2Di1hnJyHaI9ipW8mDUqUNlDZLyZI+VKeyQojbefYtyUHYsOpJM0wbcYF1/K7ViaJXmDz12XmUUfYtPnqVGcjSR2S1M+Ca7+EG10Xa+GfcJ6x6YytvlhDRbISO60oRLjCMQBVL3hTE9Q5c8JB7hWhuAAQEhe6Eeagul+Y8dILCPwu3qX15qfSQ23vSoInawTpm+Am/+jEFsgzbOoqDPKhdn/wZsvXS7406zUS+3UFW9+Fg/gG4YDxHMOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7900.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1TRaYAHqLDFJFLKTLlkM3B3c5mY7TGAug6B3/Z5mz/7wFQIFKEd9zleZOrNg?=
 =?us-ascii?Q?NGct+6Ho0g1vnBQVNi3RylodiYwBinErx+TxEB5/oJ8JLFlbdcg0qXsTRcca?=
 =?us-ascii?Q?V8aPUOu7m/9/MTXpnWnuD3UWWx4/xPtvVHo6lAWAXMzoSu0Prmptk/GxdB/1?=
 =?us-ascii?Q?wIl1YEHjLzAuqws+ewvc9m+bB1/g5TPezo5gucYIHjXnUgRl1X3q9YXMVl7e?=
 =?us-ascii?Q?BYi527dAHaif8XLmcT7TQPM4zhIeD6r0s55LwvsTLpqpbIuYvn2ZBDGmJEII?=
 =?us-ascii?Q?YcaqCyRJGq8TWIIU0l9a34MG5a+NTxc2DINvArdq6HfTJFJK3YiUydTHKHBN?=
 =?us-ascii?Q?/gVpEuO/pXPzJQqkV4Dm8c8U8XjighUlba9awBxSkyHK5U7Fv4iFg2TWFjlx?=
 =?us-ascii?Q?6hs1X7jZM/9F1xAuDXEVdtbv4EUylierBAMFV4F2odWOp6LDmIafgiBORLHR?=
 =?us-ascii?Q?iaFSW4TB0SY+U9l5xFBMVp7LkcCxXzuCBjaKqsIlnN2rDkgCy4QxQVpsIOvw?=
 =?us-ascii?Q?lrvKgVjYpsdBE88YRZr51nSKQBmWxuLLhrAoRDwXnUyWlmNIOBiymaC8/55r?=
 =?us-ascii?Q?D+namVfpAQes2EZ0ZXu2rSrBeGw1YrUM7maprZdYMxCXUZ2F0+ii67kt3yQ1?=
 =?us-ascii?Q?f8QMrFicmwFXfC/5dlCoCmI/XTeeCwDvt9zGH8SkZIeCXVnHmj5LtKsZjQEo?=
 =?us-ascii?Q?hmRAO1GWz+QUiZJc3rbPcJsKmx69YngH5J/ZKkXUVq2DTB99wa0PQyggOn1F?=
 =?us-ascii?Q?3rs2pTXm0W1mQ7f0BCrc+eqJAqcVUUd+caY2uyJSQl8ZP1IgSG/yiqGmie30?=
 =?us-ascii?Q?NHX9yUoWmPYPm5Vm3Fx92ex6eqQLDBMDhH4/z+c1PYvQD/qgVaRgIHMxoWnb?=
 =?us-ascii?Q?1JdDXAVWshPwrManlu7h/bwLEruzkWoVhddvydSs7prJdZ3DnzLV7nMb9Mud?=
 =?us-ascii?Q?BHYeSCEi3MnWz8hTBOKFRSdotevorwP03Yk13j8/GUhb1J+X3CudvPDB+oEF?=
 =?us-ascii?Q?NFVNCizlCQR/t634EH+06FtaUinmXtuODC68ljm7ZdiJaL6Nq4KXa0ujIXzN?=
 =?us-ascii?Q?BaSeWbixXtHnaUK4jy23TKtbi169QpgtDtxpjXF+QBNFEyIs5ouimaQhRQEH?=
 =?us-ascii?Q?4GFMFFP24KyG2OsMLCdaVVxB3sfdQ/asYWCQZ/EoCD1RIMsB9mbIn3F0TjiR?=
 =?us-ascii?Q?3eCzVdXnbW6L1BP9KKY7BDsTFEFbXBYj7soRH+TTjpMtMME4hnYDR3rrIsmZ?=
 =?us-ascii?Q?hlpWgxSca/1hHJI79oeqnyZJn+l2aXCeReqD4CtJ1cLFtPoNwhnkAZc5YtXI?=
 =?us-ascii?Q?nCrfa65CwZVKHtaf4gIKVdjnPZ+jvQfN657qk2w6SGTfKvdhbDC2geGWx1BK?=
 =?us-ascii?Q?sg+xA0BpCS+DYVmBCvFR7vtumnD3Wp34ewPO7GvRbe/jCFbooEtkXhcP0APx?=
 =?us-ascii?Q?/49laZTWVqMpN/OpMuhynEVnnKzbZgDPEjuNzV3yZK+fN2c1uRwqPabmqIEa?=
 =?us-ascii?Q?WhA7jER/f3lbsoxHa+WuUqjEXCyzPnGl68qbOQwQYlTujL0hud46jYb/NZip?=
 =?us-ascii?Q?VBzRY8jq+iY8nU7uj+iryF0Ch6vf/721z1h2+DmnO+iVwoVm8geRg4GvqP3o?=
 =?us-ascii?Q?9REVeFAirTJq/FxKEIWdf3ZBCIP2NuaCVRD1QKDlTDedokfcc9REMmNyzH1K?=
 =?us-ascii?Q?EzNU8OIy3WTal2v4d5I8Ovdnmt+Y+by3PTV5LYFVRUYas95dC3oAuofQqlZo?=
 =?us-ascii?Q?DG2uD8CVGQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc017119-5799-4ace-d66c-08dee73bb253
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7900.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 15:21:11.5518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGPrG7hc6XzyfU24ScqhlLC1QIsKAmiasu+aFV5cBEbF2rL823s9Xp3KKdvkSab10JzbDT8b+b2fKUlTr6zTTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353

On Fri, Jul 17, 2026 at 06:45:18AM +0000, Jack Ma wrote:
> Add fib_nexthops_fdb_port.sh, which exercises the NHA_FDB_PORT rules:
> accept a port on an fdb nexthop that has a gateway and echo it back on
> dump, reject it on non-fdb or gateway-less nexthops, allow a group whose
> legs differ only in UDP port, and confirm a portless fdb nexthop omits
> the attribute.  The test SKIPs cleanly on kernels or iproute2 without
> NHA_FDB_PORT support.

We already have control plane test for FDB nexthops in fib_nexthops.sh,
can you add the new test cases there instead? Probably fit in
ipv4_fdb_grp_fcnal() and ipv6_fdb_grp_fcnal()

> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>
> ---
>  tools/testing/selftests/net/Makefile               |  1 +
>  .../testing/selftests/net/fib_nexthops_fdb_port.sh | 78 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index 708d960ae..c06eb4927 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -36,6 +36,7 @@ TEST_PROGS := \
>  	fib_nexthop_multiprefix.sh \
>  	fib_nexthop_nongw.sh \
>  	fib_nexthops.sh \
> +	fib_nexthops_fdb_port.sh \
>  	fib_rule_tests.sh \
>  	fib_tests.sh \
>  	fin_ack_lat.sh \
> diff --git a/tools/testing/selftests/net/fib_nexthops_fdb_port.sh b/tools/testing/selftests/net/fib_nexthops_fdb_port.sh
> new file mode 100755
> index 000000000..8b401c6d2
> --- /dev/null
> +++ b/tools/testing/selftests/net/fib_nexthops_fdb_port.sh
> @@ -0,0 +1,78 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Control-plane selftest for per-nexthop VXLAN fdb destination port
> +# (NHA_FDB_PORT).  Verifies the accept/reject rules and the dump roundtrip.
> +# No datapath traffic here -- see tests/integ/vxlan-fdb-port-integ.sh for the
> +# real forwarding test.

vxlan-fdb-port-integ.sh doesn't exist. We have test_vxlan_nh.sh. Can you
extend basic_tx_common() to test the new attribute? Don't change the
existing configuration (we want to test the configuration where user
space doesn't pass a port) and instead add a new:

1. FDB nexthop and a group that contains it
2. Flower filter that also matches on the destination port (not 4789)
3. FDB entry that points to the new group

Run shellcheck (preferably via ingest_mdir.py [1]) to make sure you're
not adding new warnings / errors.

[1] https://github.com/linux-netdev/nipa#running-locally

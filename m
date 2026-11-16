Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794819598;
	b=jwi09Jfp2hve3MvhgxyPr/RVnij1VHXn1Su4iDKC+evzVZkQkQaDjoQxMCPI0z5L+/QN
	 33vUR2aNRP/KijHSXEBLbwAvUJfMeQs6KDHinuWkWM8ZEQE7Rgl36d8lXiYaNysTCLUch
	 B07uNkH2K1jaVroPdDCsQ6N5py8se0zwz7os1GSLwQrfWjQvoxwtPieX63pnGsn/X49eM
	 aD7YePPvlN71HxZVCQ4JKn3qpDsJV4Yn3Ks4GULBWOqNnJPs+2c9Vxj/f1cPAMQE1jDdK
	 rQ3XmJkUnt9d5DKuCowA7tTAJ0aLefgy1AOL/yiccrhJaSoUJIGA41auLrs6yzbEgeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819598;
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
	bh=YmwZOv8tYzGsAmsGNJuOPJ5WvV9x6K7qfjrfIb6CDZE=;
	b=ARoraC4dumFXqNSu20ecfANpZnjZ1NvNGmIhvTtEAlkWTcQaZlA/NdVmPQJPp3NwO6L3
	 +BPBvMOjz69kXYrnej5tX6mHtO58kVAtelMcNxNJDIE+23oFv3staLvDXKEbWT5vrU5qh
	 uR9V8N+ELmy3qZGQDs+HmgydbU5lLzyt/UMLZVTZWFqOIMRLMKjUPKdVds/5bWzRaAvze
	 Sg50kbXoWhYRAJ0X1TkFvMYgVD+UyVk358slvPdXkG3bfzhmI4FGE5EK1Dn6/gXNa30wC
	 Fw0GRsh79R6WcT294ARVn+ToVrTIJXwPT53V97QcoJbMRbG5K/GY2wkcW0ycTxCV9MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="sbwpf/j2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.68
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2060F606A339;
	Mon, 16 Nov 2026 08:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2060F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sbwpf/j2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3BiB5k1vL8Pb/apCHohkA81K3so8SFkshxiz9uC7SbISbcZO4A1PmvCPs/jU5TTddEdnQYQZUw0RG6yEvZfE6orLL3UCUhbbS2y0ttYs5NYuqONR8TM0FO87e/P5RT4RrMgZyJPl4Lpuhlch78mluOSD0JNFXe3lT31e++py4r0kRJXbhFVxmRG8lKw2YC5R6HKnmS/cjs54nG/8L0c1IlNn5HlxR+6k2D2EW3UVpKWv9nIF8NmMpnBB0vhWCJCA4y/SuCJF/KpAxw1KCWX89LjQme4YwK/2OWHCbdzI7oS7zJH1dQqaldLfovtZH+u8su5Wq5Qf0E9RTUVrQYNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmwZOv8tYzGsAmsGNJuOPJ5WvV9x6K7qfjrfIb6CDZE=;
 b=mgiox0ZYNbq3La389/YlybanbQQ5BSbb8OVcvHcJmvqBGlv4VLXIYjSh+A9787WO0fSHqhcMx4okififEv+ib7KdEEO/ireA6zyTf4oDtPFBjhIOr+Rw4/dBmZjMLMe3j0CWTFgoloy8YrxLRx5CUOAWV8rF1SR8dwKnnWbnyG6WQSc+pfB3nWMsqJ3wSrGt7EdylkmHcsZoDBq7nuvH7vAME/MyVcXXz1PJlUh0lUH30y6Ljtb8875EMCkHG1CO8KjQ6SeLMdRnOHt3JkTQN3cKsBXH+XCP8E/0Eh7+jGAL5l/M2chZP+5ToSn4o5K4kh6imBv8N6Ui6VzeI4RlzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmwZOv8tYzGsAmsGNJuOPJ5WvV9x6K7qfjrfIb6CDZE=;
 b=sbwpf/j29PuZwW8jKdGl93DjKUEZTiATZtFlIAJzeLqYJ4i5uXUArx4/qpnbG7Wo20fq7ehhcMf9wwdPUJ/AnwWyXc+MQNh7Refbe5jBfnzHQ2LUfsibIh+rPiGB0cY68355afr96Eso6NydRLeJHzi1xj5YcUa5YGyOlaWcpq8qwIEu8iDK18CQ0UBYhFYqfVmvIvZlbtYC7PLg0S1G/1iOMBfkbFE5Z89oQzuvt/Wfhfsdy4FgDXn5MjV8wjhZZ1JOR1RdVo0OAkI2OpZ4yHi5sYxEvOHJdmwSbZrLqu7Ba5X9vQwqm13cIDZBx+ZDctqwxY1DlQwJbMXRDScBSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by DS0PR12MB6653.namprd12.prod.outlook.com (2603:10b6:8:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 08:59:53 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 08:59:53 +0000
Date: Mon, 16 Nov 2026 10:59:45 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: liamsmith827 <liamsmith827@grapheneos.org>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liam Smith <liamsmith827@proton.me>
Subject: Re: [PATCH net-next v4 3/4] selftests: net: test restricted on-link
 fallback
Message-ID: <20261116085945.GA105971@shredder>
References: <20261115215640.18728-1-liamsmith827@grapheneos.org>
 <20261115215640.18728-4-liamsmith827@grapheneos.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115215640.18728-4-liamsmith827@grapheneos.org>
X-ClientProxiedBy: MR1P264CA0207.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::7) To LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|DS0PR12MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfb6fb5-7f00-4fe9-87f5-08df43bffabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006|10067099003|261022105027099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	dlzxvgX8tx3ij3T8Q2MRDtf0uWqdk/+aV/ECjrQVwPH9+hg5YjuwUHuRwSgDoW2QMv67+BaQMjIfLaJDhbwb6eoPp4Ep1SxNfkNqxvKco2UkIoHqaokvXRZmOVXcs7LdvSVhltEtUQifpqmv95iU5VzvOF1iElKa8oYp2qMJvGqmZK/46UV7fpgZFNUQxeQlnPvgKMG0UXFmzgdsHXPAwT7ImYDjjR6OBUONyCwASDf0EROUD3EPWy/emlIdK6U5Ze8ikzixFSy4c2C91eS5Z5j0oyJ0xWrzW1L6DetvfT6smJj+QflMARI3PhZAsB/bJzRXscrDSx71n1t6K8OCaQFJ2gO7YJjDkbKBrqN93hI0t2ac8DX6THyW1j3ThuRseQ1mjAuZKIkck7N57wCvhNUq7iKoSZP0V3x7gl3GhXTnfr4soMBmRqbEdlzTwM+LryERcvCOLg+s0oAgEes85JuTT9fgmZ+1f42oaFE+BDjmpcO966bPGrr11PKDLzk1krYjGWv+qg2JsfWhXcCCjUiyF/rhyCFEZalBQGf3nJ5oekbILaYff2CijAxLhEUUWIYanFnbJMhgL+tsPUaMNL5wgPBTHwugmaP5nUqn78dZt0YZeEkF7fFWmXvTu+XBTunWNAYfUydFGDCWsA2EvpEYsgGtRkqKMV5qVUy+VmU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QCMmJvJ758oqh1PzXJIyq0Ar8/YgxenpMYozjNEhcIjvAmoqT43U5TKcgPU/?=
 =?us-ascii?Q?6N7IZe6xkvZpyvoQHT4mqMshts+h4aQvVsT3WCAQnPLykvNvWxHcM3auAXsA?=
 =?us-ascii?Q?O3SMmRjvSno7KDDrm2KSqBuJn5SljpaJ2t55IoZltJ3hG5LcMz4RXJ3gFvyT?=
 =?us-ascii?Q?eHYW6G+C42szHGCqNTS9u9SLDUjvPQwXB9fUZSR8kcTqSbsxj5nV2NZqUjwp?=
 =?us-ascii?Q?872PRU84eAqn4eN0DCZJS1u0AqRnCbUVQ+2CgwwwqXUqwJ1tLEroZg15EO42?=
 =?us-ascii?Q?Hr4eak5bQJKG6IDmkEusMVnvYGC5KeGCqEMoEx3C017WvSysmU5VdCL28h9I?=
 =?us-ascii?Q?Nji1Hqm7P9K1ITbHDI8fzQhknI4cqBczULFCxCedVj2fD+V6S/o+YKFugZ5n?=
 =?us-ascii?Q?4A7nyRCkaGgBRC1v0vmcDewucWsbcSUMfYERmYYbqX5I5Nnk8Nv2aI82k0Jq?=
 =?us-ascii?Q?D3EhL4UW2MFcycYXRs8NTc2JHd/L9JYi1CnqzZjfPC8Y6K0h3zb93BzauIgJ?=
 =?us-ascii?Q?ZaNVGP09a9Orjwpo2sdqeOxddxVrYwJ7OhRr3TVsPddtFmOIgSaaLl6xJCw9?=
 =?us-ascii?Q?iXRICsI+gAnmPOA4CAEcB1osJJZ9MX9Z0StKDBQOaMXZGahD07IxGSV5rm4k?=
 =?us-ascii?Q?ThSxAvkmJbclNwyL7Z92WpplvWr8zJ5vsW+NjM++nUPRG1YyhgDZkqgdanb+?=
 =?us-ascii?Q?tc8JVrw+cyBUYTCUni/7yLUO9adLbNzEp+ffgDzRE1RS9hy5qRK1RWZFrbA6?=
 =?us-ascii?Q?GwKzSDt4yCa3ap8r6B2Iyg3b8dwYRFySuuP1uxLN2rJe+i2wwTJZmcst7/w+?=
 =?us-ascii?Q?lmeKuHOzGMW0q6V+3l9OuKDs/2piurgHkdNDpYjAFb9bZoXrCkQh9ugKmAgm?=
 =?us-ascii?Q?i3ZM9Yb4V+Z/1SbTt+U4kPqeOjY8Uukh190DZ5EEL6poTECWSIIBurrpMzUf?=
 =?us-ascii?Q?F4c8T467O/TFsfsEiUZ5R6RLEIE1iQuE5zmP/2tRx7iHsKOVube/WtYesFZd?=
 =?us-ascii?Q?302HQn6ELcvgckraBGTO3ZpovPmLktZAYgwDod6/hOH/ks7qN2+WQd46OZtZ?=
 =?us-ascii?Q?cYceAfmJhKQE1R/xJG53RaanZLIxqXumN+9C6+NyHjwqUc0Buc/egiS5LPA1?=
 =?us-ascii?Q?AK8w5fYBW+NtuAMKSkkQL1BN4v3/XjT+hNSoD+E7XTdktdmdvEkdzmpGqb2Q?=
 =?us-ascii?Q?6+F651OcPRZUkZW5QrZCl5sgZ5y+48AmBFbwNBNilHDuoYSDDO3HEXR+2SeH?=
 =?us-ascii?Q?v1ydTKc2lRgwkBaNzDXJ146KAYDcV+1QNGbls5ZkkLCoEYx7VN58LiX/yghn?=
 =?us-ascii?Q?d/88hV9Lnv02ZwtssEKGfkCXydDIFmA+7AZ+ECeeSECgB+GF+OaEo3jMDBp4?=
 =?us-ascii?Q?9xXsyzTuzxn33mL+kH+FsKH8mVg8Tx4tHX4wbmcdsCq30XeDR5CcXIrQcr1+?=
 =?us-ascii?Q?AyD5apSRLPbRyNMdmRCGICGqUSQmLDbUwM2RHu+LB3RNNDA1E+quKa7eGZKo?=
 =?us-ascii?Q?RaCZk/ZYtjuwVYxJ5TwOtUDGmmU33kx0zs6sWK68/ITBFABGzCfDp4HisBmG?=
 =?us-ascii?Q?2xHTNxDYi2ObP/H/tsQOBIpdLZ+/s9Spe65eJ9L5YNbd96Fr6PLpfszTtdBe?=
 =?us-ascii?Q?tjdYnGCX8LxsneLFxj8uUnjItBbg4G+aAWj9gHEPxnXSaL7YGjQTRBFKLDHz?=
 =?us-ascii?Q?Ih2LW547Jz7/wIX2fCVX0Cl50TspHXapnjU2FFze4OGIMA90?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfb6fb5-7f00-4fe9-87f5-08df43bffabd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:59:53.7227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWUQ0sw/NoGJafdWIeQZBPPGNQgt1XG6UCYZd1LIXjBHHnymd2B7TxuFCD/UWHJsx7vXqHXK6ecrmyEX8wKGYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6653

On Sun, Nov 15, 2026 at 09:56:39PM +0000, liamsmith827 wrote:
> From: Liam Smith <liamsmith827@proton.me>
> 
> Following the previous patch, the on-link fallback is no longer taken
> when the FIB lookup hits an unreachable, blackhole or prohibit route/
> rule. Adjust the IPv4 tests accordingly:
> 
> 1. ipv4_ping_novrf(): Pinging a loopback address while bound to a
> device now fails with an error instead of timing out, since the lookup
> hits the unreachable default route. Adjust the expected return code.
> 
> 2. ipv4_ping_novrf(): Add a variant of the above without the
> unreachable default route, to make sure that the fallback is still
> taken upon a route miss.
> 
> 3. ipv4_ping_novrf(): Add a test that demonstrates ping fails as
> expected with an unreachable rule. This ensures FIB_LOOKUP_REPORT_MISS
> does not break this behavior.
> 
> 4. ipv4_ping_novrf(): Enable the device bind test cases that were
> commented out because of the fallback (prohibit rule, unreachable route
> and unreachable default route).
> 
> 5. ipv4_udp_novrf(): Connecting to a loopback address while bound to a
> device now fails with an error instead of timing out. Adjust the
> expected return code.
> 
> With the exception of the route miss and unreachable ping test cases,
> which are specific to IPv4, the IPv4 test cases are now aligned with
> their IPv6 counterparts.
> 
> Signed-off-by: Liam Smith <liamsmith827@proton.me>

# ./fcnal-test.sh -t ipv4_ping
[...]
Tests passed: 122
Tests failed:   3

Don't submit tests without running them.

Needs:

diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
index 9722d7dcad08..7d51fdcc8fda 100755
--- a/tools/testing/selftests/net/fcnal-test.sh
+++ b/tools/testing/selftests/net/fcnal-test.sh
@@ -658,7 +658,8 @@ ipv4_ping_novrf()
 
 	log_start
 	setup_cmd ip rule add pref 49 to ${NSB_LO_IP} unreachable
-	log_test_addr ${a} $? 2 "ping out, blocked by unreachable rule"
+	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
+	log_test_addr ${a} $? 2 "ping out, device bind, blocked by unreachable rule"
 	setup_cmd ip rule del pref 49 to ${NSB_LO_IP} unreachable
 
 	log_start


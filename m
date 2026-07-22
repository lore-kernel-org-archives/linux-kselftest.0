Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C242F2C86D;
	Wed, 22 Jul 2026 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725136; cv=fail; b=aKf343+gJemRyHcwUJR59cl8iAXwpuxX1ZUUPV6g6W/wnquh5ZarGLT0QXTT+OCoPk+XoKfZXM+BrubNwx4GnzYTp3KBaOCrsx/8Y7WLJo7A3P31Y0GyFacRLbhNnOPgrSeIqWzHrQ0m3/n7Zr0/ycKrSGvPUUmVFjD2JA3UjOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725136; c=relaxed/simple;
	bh=vMt/CbEoBRoVp/lijMJs0JNYMBjCF5LU1UF+kZsJ+/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GjMpXzT6LkW+yoO0sUEv2n/ABFHqUMTXhp2UE7TVoNZQUV8YWe2WeiqPSJKWFQhdNNqniYFOPm2HcD0cOoLZYKRqgkOymuyaZZWSzeAXyE/U7UIXA8YyacXPDsmEFpk0bVACsLS/7PatzHyVtRwkZd6OqRHDDpMHL0wjzQ1gHzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AJcU5dR+; arc=fail smtp.client-ip=52.101.52.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AJcU5dR+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2wtIM4mlMmoQoZk2vj44yNKn2kZG4DB+jBG4ecAz5BhKJvlMiLlQ2b96BKMUyuDBZLDdTl/9JuV1PT9J8Y5BkaakrmWiUdLmKaMtpXYYUhts+1hutZI+qsjikVhc5wrfeiO4CBp1B/4ASujzfxF2LbcBMB0ECHH0kY3pSjMNCVGEUG5FysYFbCEsEWcE/ldU3Nq1XHVV//eQXsU1DApv4Vu+iy0g0ciHdGiEqfNzkKrqj4OJn4DBJJGIS9nImLayiUa/160gujrJHF+Svx6J7kTxS8X64rWMH2N6ihM3UBpJQGkNhDqvmwrNckGTOHmBSaRfPHVLcEZBRLWgTENeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/26cydJL+88AbcDcnvmdjuCVLe7C5RuWnFORm/jLHnw=;
 b=odt964Q0jCXS6YRf61k6rbrmB99XjbhJPGxbaEVBOYCUh9CWOrrtmQjwGzIPRn3HdRan1bQWdOtApVM7DaFYIJlnCQomAJMCXUWY4fUJA4MERUdnGAaHN6IMFgoOp9AmvtGetph62Eh2PZDnwYKCyzPMYH+j7+hWYCJqMavfjUpsrFmZ9CFxKmSB2+8z52nvU2XE1WiwwWhblsG3YWnnsZgX6HrB6phSiDZMmAytNhA3FsRD7nJ3GmKrRMWUatIx326/rIRQ71ctzJ2ngyrhm+8rYA4W6CVYNG2dK8PQ78kGQmW7iPklR55UhapEwOPQ4NlPOjfvRCuITYMCgIuGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/26cydJL+88AbcDcnvmdjuCVLe7C5RuWnFORm/jLHnw=;
 b=AJcU5dR+cSkZzHBOknDAOsZG+vv73HHvmRuW24Ht1Cnvm80bLfT2OBFu16ZDP2LMYgGr3tqNouJsaGe6cjqmimZpwpNpbYkt9bOAIhzwIWzii6zuJqYLpCk7AD83n38tztGh2pvaccWu0yy9n7PknCcwrjNdhbYEd2f/DL7zqlkuGHkhi44guIo6SBBMkTsKky91yP9xPhhbWTW8pBRfFBGtZFCVDM3jkuaGA6n2pCVxF0zgAlmnsbrB+t5lc9JIbsE7HfePwL+4UxgEVZOyb1Yh4vBJwaD6Tn61rj2oCIHNtjWxmzw1tYjgKey4zXzrQcrPMpghc6qWc7lm+pUupg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by PH7PR12MB6785.namprd12.prod.outlook.com (2603:10b6:510:1ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:58:49 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 12:58:49 +0000
Date: Wed, 22 Jul 2026 15:58:39 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Jack Ma <jack4it@gmail.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v3 3/3] selftests: net: add coverage for fdb
 nexthop dst port
Message-ID: <20260722125839.GB2928696@shredder>
References: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
 <20260721-b4-vxlan-fdb-port-v3-3-9aa0a543a78a@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-b4-vxlan-fdb-port-v3-3-9aa0a543a78a@gmail.com>
X-ClientProxiedBy: TLZP290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::19) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|PH7PR12MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 2912a364-e86b-4042-e522-08dee7f0f943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4EVEQ6CL8TUJGCceP9SxWfAAHtPAXtvsVSbuX+bGYtejOAGpQEvSwm8uRx1mn6w/upq9NTXKfZ/l2oCAgYMbrd7UUr/miVfwlck9CV5SqB8LCmyi2xLDKlvbgyerMKe2UMFpHEMtvzHDPpq+C62gdtLbM2PRnIV5OobyB2edngNc9ZASoRi5UdBLdS6p1H1yj2bQZ8wbHO9VthZrQ89hMDpsPWJqZB3RVdTJOIMMQZJ2eAoYfdG7+SMobdNv4pognyPOWoY+tB4bIdSPIkTkLPY+75yWswN2CBiaVpu1BIlDt+XULmtoYwvKLqI1DtH6pL0grm6/qjLHRDOi1v7kD1BL3RJEIPLY65SYpzjTr5ajZbEQpA2mO+oVgHLpTHXTXI85Kl7FLy01eyOqY8VCanAw/Wa8gbVUTYC6ZdI2OhAlC8pqM8to5bt68AYNLb83ndCfwIYLTRQ7Xm9N07MOeMu1y300wizbJm1dZfuKbuwo1FSDlCdRsVtkb4c0HaDcIwzvBEbFWBQZyJ3U10IztIw9JwRyy2J/3/lBP/hWgeh0B5n7NpfjSb2vu4yaN4KjA6lzwWXLbcH8WufP9s1wQ/vYMtWSgmitU39eC4M7EJXiU0pjJXtOE1Wo+ZFdug9R2KQJpe5oziFJhxImsW6Hbkm7lP8paHhRszB8njxJiSs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HYfQ/mX0LGhT9VVd2vzUcFgG1y5wJuNOGg0sBMDjo30cL/bgE5PzxAFA/TTF?=
 =?us-ascii?Q?cozQhubOcm72I/v98S8cKooLIyuwv0ylkZiTDXA5tmRu6wRz9hJP0cGvl4zV?=
 =?us-ascii?Q?s3ilQPzgoUI7VnDZtYooSXJLq1H58KVo/gQpyiTuU8RA2nsvJP1y4iSVaa/F?=
 =?us-ascii?Q?l3WDfAZ4Qfk0ShCDbQ1H6FSWBdH0Rkz7TZZXexzNWqkwcWV8h2s3CB8GKMcs?=
 =?us-ascii?Q?CgDdrEGgIg65CcWkt0YOk8y4xyKQh3GGmyVwDhzRZ0UyM4jeaw9AQxT1Ba9F?=
 =?us-ascii?Q?I7zzDxW9VQmKF5OR3vn7j5R/xZ81biNlX6vDI/+kmyLGI8Kb9RVnCtbhTxrz?=
 =?us-ascii?Q?GT2uN0s0mvWAH3WLRbhR5lblbbHwL0/iXBoqiZwNxHl4nah2F+RFppRHwXjX?=
 =?us-ascii?Q?DON6U4Xqiy1BhCA4zsqM7b+K6LaNckMJ1t+sIg9d8bO5fMK2hQUhkEJ8u2rf?=
 =?us-ascii?Q?PsvbTexvsaDCoWqkk6PlPpJxP/JjrUu+Ot2R1WV9mE02f3XVNE6bzjlfMcMQ?=
 =?us-ascii?Q?RRg4jTAmh2HbOKrz74QyTNqvIsALVvpN7qUVk/+Hzrcpz/2hwQK9WgkhrF5G?=
 =?us-ascii?Q?ZvFL6XmWXdekLRmFmSu/TZFv6/0EyaYVy+Y+sMKj7EgocrzyQJwALUQOrfED?=
 =?us-ascii?Q?mlNBQqG6Bmn2qG2bT2+ccROTNJxDaSDbcNdb8GpFoqOc+Nzyu2GwBohyo8St?=
 =?us-ascii?Q?IOI5vLFkPmae5MkGtMHX6Sx2X6IBnPIhbqoELZxa4xo7h+u4fthBvxbKFQ/O?=
 =?us-ascii?Q?ucHAF8PXB0fJlMvHC7m5p0en6ljixZG4gQ2dN3i6ZdlYNbdUc1KC9RRcF48k?=
 =?us-ascii?Q?0s9kH6/GEEM3ptF7PCPdelAG7g+pU/jG7xSYoHWNitlRLl02FxuWHSKBX8RR?=
 =?us-ascii?Q?+rSq2paU3PZEUn0m2ooMR4uIMTK3QAvuMpYfyowghe5l84VvfF6xXCL9QIQC?=
 =?us-ascii?Q?mMHH8tE0M99dq6Qnn098COl9g0UCzZV0RvjAzZSSbm8ZwsiNRHNOQWfgMz+z?=
 =?us-ascii?Q?+n7I7x/nzOqbtc4l3lumspMcD53IQxCUu7CxuX446N2Ld9MR7Tq/C29QM/1E?=
 =?us-ascii?Q?2vgHt9BST+JkNsailNYJZBk/INvPTR/P51JluTER3sCkCXhAHQORFcuesehn?=
 =?us-ascii?Q?C5YMwXFuD3zjqfu1XWlM3gpThM6MQoX/9WyZgZj+yRMkuWKOrC7Nqbf3iDP3?=
 =?us-ascii?Q?xnI1uto1HQneFkv7fiRVzBkHEGA9Iy1tJK13egCK0a0wn311O0u+jfXOB07U?=
 =?us-ascii?Q?YNgMknGwWQgW9IVLmjLfiJkfSZNXZYE7BVmAYhraaGsb3fihktEltIylCOPM?=
 =?us-ascii?Q?S0ZxQNhvYVTJsnFr0s54YhYRWH/4B+LgEBvvpLrelQqtaXTYorX6G9hygmRY?=
 =?us-ascii?Q?JYDFFcmg/m5uduDfMP+NTxt8AjQiVb5EphySkTbVpXO3+mzhS4y98MYmn2e8?=
 =?us-ascii?Q?R1VIABSEbZriZ9B3V7ZkrsUYWjiITC8N9tIPAB4q6ksR/QUPpBlwpHkN33Qe?=
 =?us-ascii?Q?pbqnkNNYLkAZQU1TBgMf9FkM22dHS8jcawBFDzr+bM82NOYEdlp80tZAyj2H?=
 =?us-ascii?Q?LVw6SbxM4aonknkBtAVkhbRRXRl68cLTRJosrNAnwtCvK6lybB6cLhgOh07k?=
 =?us-ascii?Q?vblWawLUzGPAamm8QPEP/Va4cykSlD7kuroWSktz1oygArZkPG2mk88fgB3a?=
 =?us-ascii?Q?k3e0btjkD4Wvnz2rzUFDj3DMgxTTKOqD3AiBnjfoLenf7kWL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2912a364-e86b-4042-e522-08dee7f0f943
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 12:58:49.4756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnC4Q2QpyQ08KLW+8Z5ox6H1cry8w8IgB1oZBofy9u8zEL4U9m5PLIZiNOWuxFoozcgNU/MoYQ6Lnra+uUM6Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6785

On Tue, Jul 21, 2026 at 10:29:52PM +0000, Jack Ma wrote:
> Extend the existing fdb nexthop group tests with cases for the new
> per-nexthop VXLAN destination port (NHA_FDB_PORT).
> 
> In fib_nexthops.sh, ipv4_fdb_grp_fcnal() and ipv6_fdb_grp_fcnal() now
> check that a port is accepted on an fdb nexthop that has a gateway and
> echoed back on dump, that it is rejected without a gateway and rejected
> when zero, that a group may hold legs that differ only in UDP port, and
> that a portless fdb nexthop omits the attribute.  The cases SKIP when
> iproute2 lacks the "port" keyword.
> 
> In test_vxlan_nh.sh, basic_tx_common() gains a second fdb nexthop group
> whose nexthop carries a destination port that differs from the VXLAN
> device default, plus a flower filter keyed on that port, to confirm the
> per-nexthop port is used on the wire.
> 
> Signed-off-by: Jack Ma <jack4it@gmail.com>
> ---
>  tools/testing/selftests/net/fib_nexthops.sh  | 59 ++++++++++++++++++++++++++++
>  tools/testing/selftests/net/test_vxlan_nh.sh | 31 +++++++++++++++
>  2 files changed, 90 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
> index ac868a731694..1ce4f45fa651 100755
> --- a/tools/testing/selftests/net/fib_nexthops.sh
> +++ b/tools/testing/selftests/net/fib_nexthops.sh
> @@ -432,6 +432,15 @@ check_nexthop_fdb_support()
>  	fi
>  }
>  
> +check_nexthop_fdb_port_support()
> +{
> +	$IP nexthop help 2>&1 | grep -q "fdb \[ port"
> +	if [ $? -ne 0 ]; then
> +		echo "SKIP: iproute2 too old, missing fdb nexthop port support"
> +		return $ksft_skip
> +	fi
> +}
> +
>  check_nexthop_res_support()
>  {
>  	$IP nexthop help 2>&1 | grep -q resilient
> @@ -514,6 +523,31 @@ ipv6_fdb_grp_fcnal()
>  	run_cmd "$IP nexthop replace id 72 via 2001:db8:91::2 fdb"
>  	log_test $? 2 "Replace non-FDB nexthop to FDB nexthop while in a group"
>  
> +	# NHA_FDB_PORT: optional per-nexthop VXLAN destination UDP port,
> +	# letting an fdb nexthop group balance a flow across legs that share
> +	# an underlay IP but listen on different UDP ports.
> +	if check_nexthop_fdb_port_support; then
> +		run_cmd "$IP nexthop add id 80 via 2001:db8:91::2 fdb port 4790"
> +		check_nexthop "id 80" "id 80 via 2001:db8:91::2 scope link fdb port 4790"
> +		log_test $? 0 "Fdb nexthop with port"
> +
> +		run_cmd "$IP nexthop add id 81 fdb port 4790"
> +		log_test $? 2 "Fdb nexthop with port but no gateway"
> +
> +		run_cmd "$IP nexthop add id 81 via 2001:db8:91::2 fdb port 0"
> +		log_test $? 2 "Fdb nexthop with port 0"
> +
> +		run_cmd "$IP nexthop add id 82 via 2001:db8:91::2 fdb port 4789"
> +		run_cmd "$IP nexthop add id 83 via 2001:db8:91::3 fdb port 5789"
> +		run_cmd "$IP nexthop add id 106 group 82/83 fdb"
> +		check_nexthop "id 106" "id 106 group 82/83 fdb"
> +		log_test $? 0 "Fdb nexthop group with legs differing in port"
> +
> +		run_cmd "$IP nexthop add id 84 via 2001:db8:91::2 fdb"
> +		check_nexthop "id 84" "id 84 via 2001:db8:91::2 scope link fdb"
> +		log_test $? 0 "Fdb nexthop without port omits port"
> +	fi
> +
>  	run_cmd "$IP link add name vx10 type vxlan id 1010 local 2001:db8:91::9 remote 2001:db8:91::10 dstport 4789 nolearning noudpcsum tos inherit ttl 100"
>  	run_cmd "$BRIDGE fdb add 02:02:00:00:00:13 dev vx10 nhid 102 self"
>  	log_test $? 0 "Fdb mac add with nexthop group"
> @@ -614,6 +648,31 @@ ipv4_fdb_grp_fcnal()
>  	run_cmd "$IP nexthop replace id 20 via 172.16.1.2 fdb"
>  	log_test $? 2 "Replace non-FDB nexthop to FDB nexthop while in a group"
>  
> +	# NHA_FDB_PORT: optional per-nexthop VXLAN destination UDP port,
> +	# letting an fdb nexthop group balance a flow across legs that share
> +	# an underlay IP but listen on different UDP ports.
> +	if check_nexthop_fdb_port_support; then
> +		run_cmd "$IP nexthop add id 30 via 172.16.1.2 fdb port 4790"
> +		check_nexthop "id 30" "id 30 via 172.16.1.2 scope link fdb port 4790"
> +		log_test $? 0 "Fdb nexthop with port"
> +
> +		run_cmd "$IP nexthop add id 31 fdb port 4790"
> +		log_test $? 2 "Fdb nexthop with port but no gateway"
> +
> +		run_cmd "$IP nexthop add id 31 via 172.16.1.2 fdb port 0"
> +		log_test $? 2 "Fdb nexthop with port 0"
> +
> +		run_cmd "$IP nexthop add id 32 via 172.16.1.2 fdb port 4789"
> +		run_cmd "$IP nexthop add id 33 via 172.16.1.3 fdb port 5789"
> +		run_cmd "$IP nexthop add id 105 group 32/33 fdb"
> +		check_nexthop "id 105" "id 105 group 32/33 fdb"
> +		log_test $? 0 "Fdb nexthop group with legs differing in port"
> +
> +		run_cmd "$IP nexthop add id 34 via 172.16.1.2 fdb"
> +		check_nexthop "id 34" "id 34 via 172.16.1.2 scope link fdb"
> +		log_test $? 0 "Fdb nexthop without port omits port"
> +	fi

The indentation is sub-optimal. Maybe move the tests to
ipv4_fdb_port_fcnal() and ipv6_fdb_port_fcnal() (add to IPV4_TESTS and
IPV6_TESTS) that will be skipped if iproute2 is too old?

> +
>  	run_cmd "$IP link add name vx10 type vxlan id 1010 local 10.0.0.1 remote 10.0.0.2 dstport 4789 nolearning noudpcsum tos inherit ttl 100"
>  	run_cmd "$BRIDGE fdb add 02:02:00:00:00:13 dev vx10 nhid 102 self"
>  	log_test $? 0 "Fdb mac add with nexthop group"
> diff --git a/tools/testing/selftests/net/test_vxlan_nh.sh b/tools/testing/selftests/net/test_vxlan_nh.sh
> index 20f3369f776b..34a24a4f95bf 100755
> --- a/tools/testing/selftests/net/test_vxlan_nh.sh
> +++ b/tools/testing/selftests/net/test_vxlan_nh.sh
> @@ -56,6 +56,16 @@ tc_stats_get()
>  	tc_rule_handle_stats_get "dev dummy1 egress" 101 ".packets" "-n $ns1"
>  }
>  
> +nh_stats_get_port()
> +{
> +	ip -n "$ns1" -s -j nexthop show id 20 | jq ".[][\"group_stats\"][][\"packets\"]"
> +}
> +
> +tc_stats_get_port()
> +{
> +	tc_rule_handle_stats_get "dev dummy1 egress" 102 ".packets" "-n $ns1"
> +}
> +
>  basic_tx_common()
>  {
>  	local af_str=$1; shift
> @@ -90,6 +100,27 @@ basic_tx_common()
>  	busywait "$BUSYWAIT_TIMEOUT" until_counter_is "== 1" tc_stats_get > /dev/null
>  	check_err $? "tc filter stats did not increase"
>  
> +	# Add a second FDB nexthop group whose nexthop carries a per-nexthop
> +	# destination port (NHA_FDB_PORT) that differs from the VXLAN device
> +	# default. Matching outer traffic must egress with that port, so a
> +	# separate flower filter keyed on the new port catches it.
> +	if ip nexthop help 2>&1 | grep -q "fdb \[ port"; then
> +		run_cmd "tc -n $ns1 filter add dev dummy1 egress proto $proto pref 1 handle 102 flower ip_proto udp dst_ip $remote_addr dst_port 4790 action pass"
> +
> +		run_cmd "ip -n $ns1 nexthop add id 2 via $remote_addr fdb port 4790"
> +		run_cmd "ip -n $ns1 nexthop add id 20 group 2 fdb"
> +
> +		run_cmd "bridge -n $ns1 fdb add 00:11:22:33:44:66 dev vx0 self static nhid 20"
> +
> +		run_cmd "ip netns exec $ns1 mausezahn vx0 -a own -b 00:11:22:33:44:66 -c 1 -q"
> +
> +		busywait "$BUSYWAIT_TIMEOUT" until_counter_is "== 1" nh_stats_get_port > /dev/null
> +		check_err $? "FDB nexthop group stats did not increase (with port)"
> +
> +		busywait "$BUSYWAIT_TIMEOUT" until_counter_is "== 1" tc_stats_get_port > /dev/null
> +		check_err $? "tc filter stats did not increase (with port)"
> +	fi
> +
>  	log_test "VXLAN FDB nexthop: $af_str basic Tx"
>  }

This file only tests VXLAN with FDB nexthops so we can just do:

diff --git a/tools/testing/selftests/net/test_vxlan_nh.sh b/tools/testing/selftests/net/test_vxlan_nh.sh
index 34a24a4f95bf..ca905e82b7ca 100755
--- a/tools/testing/selftests/net/test_vxlan_nh.sh
+++ b/tools/testing/selftests/net/test_vxlan_nh.sh
@@ -241,8 +241,8 @@ require_command arping
 require_command ndisc6
 require_command jq
 
-if ! ip nexthop help 2>&1 | grep -q "stats"; then
-	echo "SKIP: iproute2 ip too old, missing nexthop stats support"
+if ! ip nexthop help 2>&1 | grep -q "dst_port"; then
+	echo "SKIP: iproute2 ip too old, missing nexthop dst_port support"
 	exit "$ksft_skip"
 fi

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795534676;
	b=w+tsTgciC8fyW5x3wKPjFIh41SRAW3IfeN+gBRVNYOnDQ4bBAbApk2luZI4G0mYL/RMb
	 h60vdtUPQc0cvZ1IrkDidO+jxu9GzPObLP1XBaDDV7qyHxYkyC1MYd/Q6m+FhvpfoyjaJ
	 M3xeBznWcYaLeF4qKIcEUxzn6K7yKyL9mEKbuuuZqxBhplVgZuFdl7b2nF5DwUW8ogl8C
	 YPa9bdbEs6txEHcFE1vfbumlLqUJFPDfLh09yxI6VAP8IeXNVaUBiTr5+FHSD72L3A7Kq
	 +CtvHxpsgayKlQaHEBaOGPrs/Wd4iR0AGNXQ4vlHQl9EoZXx6O3p/ERc/XWK/yK6iFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534676;
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
	bh=yd6RMuTmT8RrR/1Jb7xP5+vJ2rwKD9yrzTLhWXgT3tc=;
	b=HaEVuYTr1mr3p7eCIUoFNz7d20/PxbZ4wACZhRJYzVm42ddEu6k9t234ggaXPXpYGVv0
	 cqJydrlmvxhYk7p3ILvj1rqxqB9kWrRSifsBYbePpswku+56XmYYZSs6/nY8Wu87raI7J
	 gkpqXy8ifqkhUEdTQG+qqdoeo40wcQOHfAQS0qWmCz4ZrhAQvh6PbUvhyJWPzYDJcgoks
	 L8w5cRhgly0arE4btpt7LC5cGOc3b/k0vH9bdJOMZXlajflLM9hNSFveENwkab50VWJdQ
	 WSC1IpxZPcUUKIdXF33cWiAB7L+yLTqNhVuQSbkOQQaMsqj4fZtO1yMt8j3jXC14aVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RJC0xy+P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.33
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB07606A327;
	Tue, 24 Nov 2026 15:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EB07606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RJC0xy+P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PE3UF07T/0KKiut+zxLPEnf9RPg5acZJQh3r1bgRnSn7Z5HnxXopmyPDQw3XWcQGjdtOIG2yRyFIqeqcg1xvruz75aRBuDMjY7LnV7EZ1Ri7xwb+0EC52rOod4HlrgvCTYLhxtGfgx77CgVDhRVPgEbvCdPPgLuHt21PxxEucIl+5+yBIqganGIk3i+/u1qBKhOZgZYMj0TezqDZDErD9or5F4dUxJ0jxwRUKkE4cVneEW2x0SztesgGzdKtYrYaVgTjYkJnQwmEKTXkFrxX3Bfr4AT4zaGoN5yZTInb334TcfKnCEnrEdn/QJAKMHbqywpchgIKkpRWPp31Z+iP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yd6RMuTmT8RrR/1Jb7xP5+vJ2rwKD9yrzTLhWXgT3tc=;
 b=GRj8D6W+zcxye0JUHvNjXRoeanwokFvjXWPZFgiFwgIVWQgWYIhCSw62WTQbdkRjW7HUAuGFrMKQ218e7SdDU4NvFEpOySmXtVXpP+coHbEKm78hAesTG4OhvE6DnJckn/Vxzh367ovUc9rZEO3yxo/ZeRSd1GuwqxbJSoF4VApobdLOMdg8GEI7ZCHTAlLQrPPexKzzp4pfnCeDWZAxApIYGrOz78RBwWge0GAPOiYsZEJEn/WRZ2yh7DT91pnEYm+n3hHMHNTxL36aBfUori9SrhazecKzatYXb3QmdiMhGsOXNjI8cmT4+ldAgYG6y1jZmLpmbtlogIw/H7RnGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd6RMuTmT8RrR/1Jb7xP5+vJ2rwKD9yrzTLhWXgT3tc=;
 b=RJC0xy+Pz71uVhanE5pRRvS6TepXr4l1OOEtmuC9YIlQXWldIT6N+X3Px/tAe+885fWA3BdaMEHsZOJmQbXKGmDeZ62K1KjsHaXeP17F3NK9FoPtXbMBjbFDIyXckEPt1ytpsuHJaiug64GN9iO0F3LHwNprNN5pow6Og5obRkS7mEDipyMtrCJzVuLwAazlUyrdlwzYOJXdCriXFOHGyyOXZVOEYTkeq1ZoL6bP9sP26cK/PaBqZKeK/NlMz2b/s4SPvTTsrWQ2jxRUcx/Erq6RzL+BwR9TDHfq0VyMR2YqVYgX4LvOrTEzXKTfgNDa/ZHKQ15u0znyF6wckMA6oA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CYXPR12MB9385.namprd12.prod.outlook.com (2603:10b6:930:e2::13)
 by CHBPR12MB319464.namprd12.prod.outlook.com (2603:10b6:610:409::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 15:37:52 +0000
Received: from CYXPR12MB9385.namprd12.prod.outlook.com
 ([fe80::f8b:8279:83a9:3591]) by CYXPR12MB9385.namprd12.prod.outlook.com
 ([fe80::f8b:8279:83a9:3591%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 15:37:52 +0000
Date: Tue, 24 Nov 2026 17:37:42 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Yifei Sun <yifei.sun@inria.fr>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: net: test IPv4 nexthop fallback in
 the same trie leaf
Message-ID: <20261124153742.GB3946712@shredder>
References: <20261121182031.36626-1-yifei.sun@inria.fr>
 <20261121182031.36626-2-yifei.sun@inria.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121182031.36626-2-yifei.sun@inria.fr>
X-ClientProxiedBy: TL0P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::15) To CYXPR12MB9385.namprd12.prod.outlook.com
 (2603:10b6:930:e2::13)
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
X-MS-TrafficTypeDiagnostic: CYXPR12MB9385:EE_|CHBPR12MB319464:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d15730-ea3d-4051-3f77-08df4a40e6a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|261009223027099003|22082099003|18002099003|3023799007|4143699003|56012099006|11063799006|261028144727099003|261102123227099003|261026140227099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Lycxi7B/eMuxzrNkNsQMLdwser8QAS38T/qR9ixsPzUZKE8Lu/SamfCe1PCiZcTBjIxZq1SmdNGWtUv9lk1Adu6HaawP8Ezs/tYMLvYe9I01qaLNfjwng8brlBHiqK6WTlxEd7kCxapy9xaaS6nSItym/LmVkrjEjH2qmOrVnhtEklvaRM9zbwzJnBXsqSERRsZ3VEdrIV5oELNsKHKdmjylTMnWOihx3MQvVownqfZTpE6PWhmB5tR105S7z6xS1IosaHqb2nmNmUTQWL4xAGhQAICQq/AHlPtrXWuy9d0Q6u0EgXdx6YRas7Fi/+et9HTI9Bqtk6+IX6vZhNS9wno0GJck1TXuqTPzoi4lk3jJgv2HuXNtm47UA1rZ5KUUYwS4BIUq4BgQC0KT7eTmj0iCIQDzcLZRwul/D5qtP3A8uq5w2wlCO/DoVhHFHKVogqkxKRq+iKPR+IJ897+mzXtxQyleH2wXiuHljnohW0NV0Ri1Qxh7xy9pwjOYN7g89a7RNyHcmcH5fDzTpODzwqEsR0+RrxHkic+3cmDnxlWMUpHniKpVnqODJgx4mv4QHGvDnrP+KeeIBTKmKPxBKvflRbbkps5oQ/sL7GLIHDHjyvQTF/OU+/U3Uzz2SUV66TnWkCpx4R7Ui+KZY/bEVqS+TuEznzHWPHa+ZcsxUnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR12MB9385.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(261009223027099003)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g1DoAFvYvMLWX84cG70GB2hYKgTDQKQOvvYVs8GLaMFSd/6Y4apaUssI9U9g?=
 =?us-ascii?Q?vSzVn8uWgIUiwqQltj2F7qilZsaS1lAF67fCArlNi8eoOC+DO1tukJ8osC1i?=
 =?us-ascii?Q?6LPSt/xmU3k6x9IY/cAPaw4cdlFJUhI3MhRGDBu02X6Eyjd/pDe4jqV1kPPl?=
 =?us-ascii?Q?cSrBLGI5hoS/N1KryockgfOTZISRozx/mbRllZdbeO8iFZfkL3+nq/zDJFIH?=
 =?us-ascii?Q?SpQCXr3KdSqA4ckinFsjZmR+vHO6aQjQouXBs10Mv18spA0/CI7brxREtVki?=
 =?us-ascii?Q?hWYSpIa0tLavmomRrpyo8D+CHDxEXkuwOV0ys8ZzZYCkPn0JLenRQolKvdzI?=
 =?us-ascii?Q?pp27FsfBuQUSg/140SUhpj/mFXJRjY/8CEvF6yYZTvQxOSmHDkO4ZOgIn65q?=
 =?us-ascii?Q?orWjItU93wH8VJyHtkfHDchOTmRNrYcDjShdqbFsiNYPCxgT3LJIaVHzNxnp?=
 =?us-ascii?Q?hwl3+CHO+2pIv1MgivRnqD/7sWyxW7GjqfFPThFvTlFAoZLl+71cLb1Pm53A?=
 =?us-ascii?Q?KZQRUyvRrgJY2F+X5nzrybjK+vOvyPTRLzK8Ow5XdG80MFkMi8Ez8Fii50oh?=
 =?us-ascii?Q?y7K5x+AZW6MUQOSdydZ134xz01+jHvEqHh3gOyBGIzDvb1IG/0qWALHaey7D?=
 =?us-ascii?Q?JP9CncpPzLhJgw+DuEnqKvCTEsxYAD1iHVaGL9LpS4W//6qR/zumdepFlo9m?=
 =?us-ascii?Q?Qe1Yq//Bo+YlsS7p4ypaPpAPwhkA8c2d0Ekyiwq8EC9XK9tpmrHaJ0M27pNg?=
 =?us-ascii?Q?VMcNsxq+n+G5aUOgGbku8ZZeoE1lr1cagIJn56nNOApfChIyvMjUTc06vNW7?=
 =?us-ascii?Q?HyRVY5g1HBlrH54whCxgEsws+ZsIGF5SIMbvzS6NI3sFyjtfzQTqpT3mmn5X?=
 =?us-ascii?Q?7vBMBkty/bqHeqH9w3EeVP0Jg/d/YzjZnF3+wWS9NCu39zllT5U69ICwdHjM?=
 =?us-ascii?Q?aO/9cLmVRzNShhIowy0dJbVXmZThEFcKCkPOIO4ABAf4uCy8AoFIrz9bZCCW?=
 =?us-ascii?Q?KOGRH6dHsTJpOkspZjTWsR72i9yfkYhyzj+/SADKY64Wj66hPie3B70YevK8?=
 =?us-ascii?Q?5FXE1SHH6lK8rIvR7WHvUUKY4n0Fd88X8/RHQrN7VFUp89Sh/c0ouBAemS8i?=
 =?us-ascii?Q?ma2OaaxnDF3LMwHA9bvLLBE0xHRfMR9Hr+4lMyN9Fg2CilPTqSYCetX926fb?=
 =?us-ascii?Q?jjsV+kPa4uHsR40EsTV9mb9Pl9momD6abvNarfn4Eayk0jQrReMgTa54B2Bg?=
 =?us-ascii?Q?GyKs3P4rxqM1i70U7Rs8zJRBp0gabaeqyj9TPpQDVrI/QaKHA2J0Xyu10Lqc?=
 =?us-ascii?Q?5f/S7zXqVv5NHSTvZ4L3qA0WN3PK3k6+yktQtSksoamXw75TKx5Dc1oCVmjM?=
 =?us-ascii?Q?UPktKIgjMDoN052kq018sJjv/LTzAautsWV9t4WVJ4OqvSTEbHm9aeo6vjRP?=
 =?us-ascii?Q?L3HUVm90QCC/gUN96lNFHBeLD2Bc1mH4NZxd26TJBo73OWRk1W1qhpuunHoU?=
 =?us-ascii?Q?4YaWdtu7VjBBjAd4eKeWS+WhEIs2vIKfkXATG7rEBB5/BnXZALBEYMUmZ37P?=
 =?us-ascii?Q?mGgBTafXXG+hzdpsfiMv2Mdw+dozfD/FGcA+cWGObeZmMJwqMXf60o6+8a3q?=
 =?us-ascii?Q?CYcj0Bh9eqdq5TO6TX05fvJbK2VZ+Jw8L3J/ULk7FJjvvFfBl2KjrJyTBIgD?=
 =?us-ascii?Q?XSXMIkrnK/Vh2GFBdN1tfAxFU40mbsDtDZi1xKwJ0sYohPcV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d15730-ea3d-4051-3f77-08df4a40e6a7
X-MS-Exchange-CrossTenant-AuthSource: CYXPR12MB9385.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 15:37:52.2023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0u5H4OGbacUADdl6srSgdUEBaWzT9Dz9LuDurVVZSOr/eETvJbsGVF66BWUSGVJ2vrTUdsQGbVad/aRBWQdHpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB319464

On Sat, Nov 21, 2026 at 07:20:17PM +0100, Yifei Sun wrote:
> Check that a lookup bound to veth1 selects the nexthop object, while
> one bound to veth3 falls back to another route in the same trie leaf.
> Cover both a shorter prefix and a higher metric for the same prefix.
> 
> Signed-off-by: Yifei Sun <yifei.sun@inria.fr>
> ---
>  tools/testing/selftests/net/fib_nexthops.sh | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
> index adbec51917eb..38bb56f28187 100755
> --- a/tools/testing/selftests/net/fib_nexthops.sh
> +++ b/tools/testing/selftests/net/fib_nexthops.sh
> @@ -22,6 +22,7 @@ ksft_skip=4
>  # all tests in this script. Can be overridden with -t option
>  IPV4_TESTS="
>  	ipv4_fcnal
> +	ipv4_oif_fallback
>  	ipv4_grp_fcnal
>  	ipv4_res_grp_fcnal
>  	ipv4_withv6_fcnal

Please add a matching test case for IPv6. Ideally both address families
should behave the same.

Also, this test is more about the lookup semantic than nexthop objects,
so I suggest moving it to fib_tests.sh.

I suggest four test cases:

ipv4_oif_fallback - Two routes with legacy nexthops. Should pass even
w/o the fix.

ipv4_oif_fallback_nh - Two routes with nexthop objects. Should fail w/o
the fix and pass with it.

Another two for IPv6 which should pass regardless of the fix.

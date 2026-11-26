Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795721335;
	b=St7/yR4Joc2wlXVUK5rdsy4SYlxUBWf7djaLDa9jFLW2KIHScpzsEj/JcloSuUdrXNlJ
	 MjL7JBkA9FhDFmqMz+utQYFq5v5v0gNmNg33rfW+8+y9xe/bXA/YaJq1y2kp2QUOCgzjs
	 uK7qnQPFJitT6bS8yCbGWo5fl4JjIZkZ71unSQ8/RljcXAPh+pWrT61OXpWZIKbEU45lf
	 5JLstzzu1N7V2wB3Xn0I1l9uPkUESSSo4nuwFIEQs9/MONc1a2sENx4TPGevoRtBUXvuX
	 BDaCqE1CGsGP52o+4By4IYkfjxj0HnamqNS6o/YQNuWRdNKgXOiJ/VXvySeqA4w8uRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721335;
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
	bh=fnMjWcrG5j8D2mjjsDWRUsQwpO0u4wAcpZ/SXz5QLDA=;
	b=mOD9QKe7LQabHW9hFSUwnWw/9BQunoBtvsqF8EhZZiNkLem7E7WEqzz98ccxJOWiTApT
	 mdJEHFyk+20URS0y9+Ij1bVKYgarxKVS5AYglIt61E/Gc6W/ANDoQlInvCtTk3oY65qlS
	 FgFzcpthwwlJj35Z+SYoMa6Lo8mN8aHB+Hj5fHamJYhx7S0NDkckx2UBeumW8fE1Ud8p1
	 rkM0IX9HnirGsr8IQ0m1D1z7LjB/D5d5+1YYQR5XA8qM+gaBBfVj0753KhjJGrLuPAJR9
	 BPpLCQ1CyhDdJiBu1KYUELxs5t+oFLgVsLrPT1lfFITEv3fddR8gZ7Jc94eXh53qbVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l76iG24f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.41
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174BF606A31C;
	Thu, 26 Nov 2026 19:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l76iG24f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRVugzO6XpNwSNyS7K3PhP46KkUXFR8xegpAaOoqQ9UezKUmct/UCJ416+AtZcyW3htz1QQsTt/EJdClwCG2qqu49hnEm5F16Cmkvfm4nM4vswXWZuQn4IhvC/y1XVdmTYGsBJszyPeiRTVSjhMPbkwA64AqydVxthjSXvlPqIm/8SJnbcx9vB/r65h9dXcT7Codd3FiniXtfJz+1pauICBH1UF5KT8M6VNKor9KE+45tpl6WqyfvE7W7TT9ZKDeKjMnxqJPtP3tP3/EBmJz2qN3scD53vNwhMduZd4OvEWnmV4mzM36zSNeVepS2EfRRVaSWtwFDIInKf+vX4Uxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnMjWcrG5j8D2mjjsDWRUsQwpO0u4wAcpZ/SXz5QLDA=;
 b=HTfde7lwnM/GmyHJWa2UgKQGxrxplbAnhwP3545ruZl3qgJIZMgvwHVlvoJngaFL5ZLEXTl6KXhpJMFZGT5byv8I2tws/jCy8iKwG34oRbYWmjaxNe50c2xNWF1ge/8vq+VMYmoYUe9tOLCnqGWdkFIstep5zpMYVzNk4lFwV+/dNCyiaCSiT5PqYMO0jxOZNuzvxmYQvLu+YHmqYuPsFoVsdjqFcUH40L4mABwVykPzgB3GKMgcPGZkI0VsYn5PoqdafE2oI8o+bo5qPUIZkBXlulcjwbfjDUkvSyvbpPdZ+v/Dkb3Or+oxtuvZbgHDIxOBFv6xWRkgQptIXsS3Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnMjWcrG5j8D2mjjsDWRUsQwpO0u4wAcpZ/SXz5QLDA=;
 b=l76iG24f4/B7JAXK3hCOHCaFKUG4c7kvty5w76y/mWRZZusGU7Kl0p3gmwppxoBASMNBtuk/XcXvnBAHpURATaIA4o1x9invugWdVZ6W+LdcZz6MlLKvmtdwCJiDE1W0SVHJXXn+06BYw4fsnXvrePfdBEHuTaoFZPP6THBJe4atEWF00wgvJe6dplsZdVK+fxZkRxb24Vea2Tenh8tItaUYwUeoJFE9bBZGxZjp9lST4+xMigl8VxFLRiPXZs7AkeS3dJh3EEX+q3I6iIDQa04ZOMT4Qv6s5n0O4XQLAagsNfaYvGV23X+eYmpxbq7UikdgUZ+grHuGyez5Ytemiw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by CY8PR12MB7244.namprd12.prod.outlook.com (2603:10b6:930:57::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 26 Nov
 2026 19:28:50 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 19:28:50 +0000
Date: Thu, 26 Nov 2026 21:28:42 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Yifei Sun <yifei.sun@inria.fr>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	willemb@google.com, horms@kernel.org, razor@blackwall.org,
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] selftests: net: test IPv4 nexthop fallback in
 the same trie leaf
Message-ID: <20261126192842.GB1010466@shredder>
References: <20261126162538.2509994-1-yifei.sun@inria.fr>
 <20261126162538.2509994-2-yifei.sun@inria.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126162538.2509994-2-yifei.sun@inria.fr>
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|CY8PR12MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: e849abd7-07af-4582-8c69-08df4bf3800b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|261022075727099003|10067099003|11063799006|56012099006|4143699003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PjJjZfF6ieODLMnvLmZEZrJ+uIczoe8WSkfsoOt32CkFIKlArANGXWy/3+nhXl9WQrEzQAOrnfafGlb6pfuIgggkJAusBgvNjCg6ikDG0IpyZq3bLZDAJbrcxmJP3H1U53HiRikPLs6kvbuZoMa+PhVDxiDL3dkn6xbbL2XYJuJa5hlPOqEA93NPvwvyzLPKF0NF25yxBSynLf6Ehpmf7zaujNzq0QgAQSGNsZu4RrIyyxXRLGWlIpP8LEPxrj9JAgEDILN9Kkh4GHA8QVvsLkgz8fY6ExIvb3l9rN1HoqXi7fWVYWe5Z4TA1vwoEx+tvLUubYTK+tcWE0QXaqQJyCXvRv/KenrJkt7bCzqyA8jJAbWpFgw0rbYAj/qHcbEtIVrEe0dZcP9HTf2zTsGTCJpXhxhg0SGPzbd84meOMUSsgPsCFyRyH7A52NCzvBSNDorDsxZZLeziT8/HP0v9BZc6/aeTCDvJJlVhLE/spa4CJRfb1yG3+3LJ/V6K3OJPMMIU/RlYrh/7yvtBbtZSzHsTiJZKoksy4zO10kl8hWdOHHkdurr2+ujx0XYRMK0RXldeMKX/5YK/Au75SGat5XsBwRLg9bMX/Zg5N6kPq63bG5q4J1i1FWl7FQAXk7J5DuqO04lhMNYEJA8Z91yxugH7eQf4eVTDzO1bt9sSQhc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(261022075727099003)(10067099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j/sonisSk7VqoUf5NXgppdbl8h+g9cOu62A7kxqHmxi049dnQzyUWxQ/dLfQ?=
 =?us-ascii?Q?bZadTrjYGXtdy2IbxayI+Um3oJF1/rlG0egpW4+CVJv7SgKpaHalBSCuxGZw?=
 =?us-ascii?Q?sa0+IHJLo3O/EK9RqvMTCnwsM25wNg7NegiopiR90ajZ9gJENvx1GiHQA1C9?=
 =?us-ascii?Q?/WAPTOcBxxWpbmoBt4pXSXe8R2HcF+4fv0pHBBbprzTOfLJH9hnbb7vJH9pO?=
 =?us-ascii?Q?Xj3Q2lmkHQPamigH7Ikuj6WZ/F3h/+pmTA0TpoY+1eszHucyfvaTlmG7+Ke5?=
 =?us-ascii?Q?e0ZVMs2Dh1h0n4FK+1g0hFWwW9u7JaZQ3XOXawbW1KtOpo3HfNFq/+9LQJyi?=
 =?us-ascii?Q?YFQhGkk1qSIVVFeMFdOjtATfE8q19PPUyGCDU1kgkC3ogDXIw3QEcomm0F9U?=
 =?us-ascii?Q?ZMlOTq86xAn0rwCq9rCMYoCR/2aAZ6hWFjgZEZYRKg/pQ5F3oDDbd1xyX/bT?=
 =?us-ascii?Q?DjsMFgmaArFx13R2OavHBe8MsyhFP7jhSNXKniwx83DpWLs21EcEUiPHEXM9?=
 =?us-ascii?Q?6TLaJKgGGvd/6xpN23KRamoCdwVriAEpUwNc8Rm0l2KQGXCDr79Ua5hmU9zf?=
 =?us-ascii?Q?3lxYwUJbCEDy4C6ygC9o0I9Mdp7qeZWQWOk9sMijlknQWyUzpRkFsihWWLNV?=
 =?us-ascii?Q?/bOZPoSpFkTFX+2ehrZarA6zMs60sZ7q6HedBZzsTxXEg4NyVHuKW6vC+NMq?=
 =?us-ascii?Q?yR+9vCyp5Gtu6sQm3pgdwwJoy7J912Q71lgMC21nkkgYBOudf+/1aouDFMrc?=
 =?us-ascii?Q?Bb6A1mLcP+do/Yzwmdjo9BcKbu3RyG8MADurRx+LPjJkGoJhYU162dPAd0lx?=
 =?us-ascii?Q?0L3XtVluVu9BRcfydl0rM8mBAPWoLjLqLNypkwgXL58jLqiRo4Qfp0s1q12I?=
 =?us-ascii?Q?Kj1q0xPMA9Py7QdvK11SUcT/26RTXTMqx36SJAZl/XrS7eFAD8Zc+hIoJkuJ?=
 =?us-ascii?Q?mUrCze09Ghx8tK9aLg7j5xUgItbvONHaLxbigm2SCFqU4IpzbizR0oJ7bfz7?=
 =?us-ascii?Q?TOxuryx4BC76HL4SvwkiFnKVeYB3TiTOhw8KV/9c7qNyafve2+sWZvbN3cLQ?=
 =?us-ascii?Q?JQD0qWoJEQ7js8VukdEW3mpKy+5MIjcWzfKPqgP0Bryc0U5O8jXcfB4uVBWc?=
 =?us-ascii?Q?8zJtwEgtD3qzeJPssZpmUUKBdFNEuG2WUPijcm0QLsuHWOxrrNRAQP0v4wbU?=
 =?us-ascii?Q?/YY6bo8J+3V03fI9JrKPZZNCT3+JP/bNUcSn7vS5jrDzA+/ELVwa2qu8KVjl?=
 =?us-ascii?Q?s8JZAGm3Bbbpx2AqLDfBQoatcXLDrQA8XoeTFNy7qmxJNi5u89Ea3Q6tyZtp?=
 =?us-ascii?Q?/Rmad+Cb4iBeTmoCqu5hNx7eIGPjVC/JzHJhQ2QY4asEzWDHRgptsYiH2QR/?=
 =?us-ascii?Q?17sx8zHtajz+TSlpMeEMd+Y/WZDRQbCYuMk6e2yRsMOj+736Rc0FPi6WRT82?=
 =?us-ascii?Q?qfJiBlVJX1LDPgpaxiT/4y98L1Vo9XjArEVUkvopzysZnfSHiox0oSlSiJWA?=
 =?us-ascii?Q?lmhnMXkobluiA/DPa8mrW2ypAQet3Wn/2fGvmu95UkewJ1v+dl7GPpGWL396?=
 =?us-ascii?Q?oVInj4I7XVgTqm32AXUSqcEJEUkhJNb8Xd6pym91uj1NGb4UIAj0/Bf7+D+P?=
 =?us-ascii?Q?htXyzpS6NCkJ2lUH2opXSUpV6aCJ6xbEPZcPH/r2+UvlhgWoZJEnE8oa6kBL?=
 =?us-ascii?Q?A1immF2/c+OlrpBtRmH34CDad87GmPr3oFleOGm5aTXhVOI+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e849abd7-07af-4582-8c69-08df4bf3800b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 19:28:50.8169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pSBx5cvBLsz9lO5Uimg6mGNfIvXCSwVHWMq0oKEjpu2n40X+JgpazHiyDabVqO6O6A05lYA0Q9BoAblrhjYfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7244

On Thu, Nov 26, 2026 at 05:25:38PM +0100, Yifei Sun wrote:
> Check that a lookup bound to dummy0 selects the preferred route, while
> one bound to dummy1 falls back to another route in the same trie leaf.
> Cover both a shorter prefix and a higher metric for the same prefix.
> Run the same checks with legacy nexthops and for IPv6.
> 
> Signed-off-by: Yifei Sun <yifei.sun@inria.fr>

Nit (not worth a repost): The subject is IPv4-specific, but in v2 there
are also IPv6 tests.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>

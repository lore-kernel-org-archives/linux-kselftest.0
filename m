Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022094.outbound.protection.outlook.com [52.101.96.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B530EF62;
	Wed, 25 Feb 2026 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772053680; cv=fail; b=VCvpGsc9l8PDOrsJevxDanS16EMs4HCtjcx/tpkcjcW3+HZR3Yj4yvo+cRABAo6gWKyulcZ7szpQHAqhCRENEjim1WgFbVNJDtKK+VP13Is9VvbS4RyIphY9L4Q9vWC+/xhxYiIZY9zBy5+ayPGAHST/XMvZl1LdrRi15ZTe0Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772053680; c=relaxed/simple;
	bh=8/ZgkgWrlaHL8E5OU8tP/svaO/9Qg3DB1Q0RsGJzH3Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=QhfvKtQW2V/hNo6TARufTHOAOt03eX9VomdzNtxYgHBNYGHxi84budBZWQtj2GiTAtEAR/GmJrfBb5ljgxKPcpGIjpHQ23d1PXxFQstsaF+uTn2ZYkAuGoJFLp7RTviBwr1dTxTe0QXRDT6IcO/Bux7HdKVyMuD6iLSxQz3q9k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=hcu2d/Mw; arc=fail smtp.client-ip=52.101.96.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hcu2d/Mw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVqMEcCXLQbnA3ONvjKLmV0DnIqR//mFaMOlpThwn536wA6CeVoaRDP4SamY4NM9xQHMxgZO8OsKUGT1kxqLxIxOloSdi6w5mm2XzW7uznIVFR5lrQPyKTsWllmeIgEY12FRoelxTUxvy9qlwiHAoeV3h/hAZNzKwmmXdthnm88SBkbRfoXDOuN3UNY85G356XaKVxwjU8nW21yFT6qvGQFNcbnS42CUuI0aVTttYiY6bFLXFNzqZ3aTEazv7qR47JbeWwqUVwkmTQ/CzBK0tOMD7XxpkUfQZgViZFsZlx1vD3SAL1wvE0oKo890o+0/MTXFCJ3OZf+ZyVfLX2vstg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuM5SZlnXzManixCAO9TFA97bKJ4s2DlSnkREGz4h3M=;
 b=HB6Q6WIHccK8tUHolqK3O9jwQFqknwvfOPrtzHYLVL6mKrs1KkmdOM31NWE2OCsk/P4ml2CAIt5fo0V+5DeeVRGL0IOaunA14tCXfR+4YUq1REyX0wzetW6O9ValOxdtEc4R6HrPRJmPOrvMxfYelGzQfqUWKs9SQNFA3T2Go07yNG+21znFpVgXLUrNFDMyvU5whfYyoi1gEo05E3w2jP5RVpsnG/m1COF36Tq87p/i0a3PtlNZ1KHmlgLXI5MOZSIpTGqd/ISmb3+wvAV4l+7tQwZwSoCf9meHPvLTjyj4+YLL4LmzVv1xzYKfgoTvWq4UYcX07IsJWamGilNklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuM5SZlnXzManixCAO9TFA97bKJ4s2DlSnkREGz4h3M=;
 b=hcu2d/MwB5aEqbXDZp0EEkJO7fyjLIBs6gdSr/QJTrbZkmPn7VWOy2baLVvv2qHbNaDRJPvZud2wadNgW6MCDsIWGBsnYyL/VaS2VnDp3tcRL/Kh4rrd6exYnaQV7gHZ6cslPF+QDDNWALqdaWSHRrw7Mh5K0VsutkfzGe5bcfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO4P265MB7063.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 21:07:57 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9654.013; Wed, 25 Feb 2026
 21:07:57 +0000
Date: Wed, 25 Feb 2026 21:07:56 +0000
From: Gary Guo <gary@garyguo.net>
To: Elsanti <santiagojoseleal27@gmail.com>
Cc: brendan.higgins@linux.dev, davidgow@google.com, ojeda@kernel.org,
 raemoar63@gmail.com, boqun@kernel.org, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: kunit: implement test attr filtering without
 extract_if
In-Reply-To: <20260225194543.1542668-1-santiagojoseleal27@gmail.com>
References: <20260225194543.1542668-1-santiagojoseleal27@gmail.com>
Message-ID: <bfcdcd95aff2e515401784f464c61312@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO4P265MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e25f16-51dd-450f-324d-08de74b1f361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	jlVc7tIroynU4d+uGQMvZk8XnS1lT5Hsj5p3tgg89zIugtoBdBBhPN2o07MK8C4P54pKxy63Z+id8k+BI1a9MiNmJbU4qRTkFrkYLhGDk07Z79uN8hJsbdfjZJcRWT9wqDbGUZZvaG6eZc6ui0Aayh2U9PuVabF/OHcrYMCVHO6M/uBkiMG+HyTXhqC9Ulwm/Nc5s3wPEX8kVwg4/Lmo/+44epCxSGjGdw1f9vY2FrnpYKmFAhiiwqOV/NtdaQ83oQXjc1nVSCCJzmH7hPHcnzcTOcvEv1S5NWgI89J5tCuLob6KM8XbDRvFgDG2/MfaOF7M+mIY2Zxx8Tcy4h5dZYTPG9LWvHJ21eeaxV5yUjKJILEsH7cR2qxgKJRuQUj6aYXEAdzDSLqfHZ4z2J6c5r815oMiLBqmGnbfJ0RUIQNUdgnsqCtdKx7wYW9XYLiRw08O6xd5osp0zK6zHQXRGVugUw91RWm8Dlj2YmtIfDg635cSOu0fXtBoXZMusN+++PLhkiVbzw7zJtVYfEyEuORDCFNXTlhoJ5y7wLfzECiEAFI5HdwxMs+SpAZG2Tg+/Sz05/xE4RAa/WjkilHZcoe074c6hYdAmv+uXydENY9/+A/0ADrUse8fajTI1/rcxSuNcPJSpf6NU7tTq2fKh/vw/UTGVFpEbDJHoWCsB4sO7eVboBheozvAXVPTgK7yzEpf7b12YzJTHp5ydNkCX536DGAI8+OYoaEZXeHZSyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6naw9V5Xw1AJSsSTaP4VPVkHFTo7rZXvE6iDDbM62VYr1CosuC1jI4wLDTCj?=
 =?us-ascii?Q?iP6syTsnjLMmQXD7KNVb2XLsEv6hJMBiyE4IPhFe7MY1XchXjS+YVW4IRIk4?=
 =?us-ascii?Q?dUFYxv7G/Kc2G1++wQmKCbj7Rcq5jcotCjK3MqAA1Xs4tP2T+4d+0dIoBOqA?=
 =?us-ascii?Q?219mgZFOSeuF8YiZCGvwoKekCRR2GtoN4YFPepfCclsQH+x/xBlsFcqJNMhn?=
 =?us-ascii?Q?tPC0VT0Ocm4Kq1EMluhvmlSgGWJNfMDDEsXlIB6vufSMDx+kEXvWIu/lWEAD?=
 =?us-ascii?Q?AbX0Y8bk14Ux3zU/iI1RHH34zTSXc2FoMdhr9LScVJ5im8bTPjN4ihhR908L?=
 =?us-ascii?Q?jjUiQUA0UwJGNjIL7O8MjCmUBKK7L6zdEnHWKARXZi05hWJuG8oXzewRiXW/?=
 =?us-ascii?Q?cjnzf9W9eR16WfGegXp4DXj7WC+aJ2Y3zzHWi1RAnGFRbfCljIMMIH0r51a4?=
 =?us-ascii?Q?OtzGq8LnLRzve+HK7ixHAdwfyG91J6m+suT+bW6CdgiNI/NjcYPiLaZkLDrV?=
 =?us-ascii?Q?I69R1JpuJ+SSuv3F2Y1IscwAbkcDu9U+bk+5fX9aD4nneyzCQFWOCQphMqEg?=
 =?us-ascii?Q?kNID9oMPUruEmQ9E84UNW6steDnFdVcMkncnLRPWQN5FM6NxDmYu8Osdfb0J?=
 =?us-ascii?Q?WOSWjIpjvif6Af5755qxwmAS5cgeRaT+w8oukQfahLJj7Q98LS93gGb2NFGU?=
 =?us-ascii?Q?PCkQqXqEKVY5Avupm3RYbyk1VTa5RPvMcdC/NqiWPWt3HJ9Wf8YdH3voGLve?=
 =?us-ascii?Q?1VyZC59QLpi3wLW80ZeoC8QX++ZRxHc7kPRJkEBDaA5Lk0BvXgnXJ1AaO2CS?=
 =?us-ascii?Q?VxO91a9d8WOxj8EwElIF99sweNTs98pDV2m6EJjlGn/8ZF2gDuQvN8p//XyK?=
 =?us-ascii?Q?E49iWuxvjuDVMgqM1FGdsNLlUs3b3YnJO7zrjZeSKI/iY21mclV5nLjyit0k?=
 =?us-ascii?Q?IC3MZhScgru0J5TE3Qsvi7MJyk2/AOho/jBRbmZEdUWuzNEY4QlysHAEqSdT?=
 =?us-ascii?Q?kQ8FAXXFWIcnEeBRsYxSXW1M5gyUSpNMYyQr7vFPHYbYIKeDigRbvMILgPzo?=
 =?us-ascii?Q?6WkIatsnze7W6U5pjAQ7gP+bfLoOXKxwAHuDilgKEshgLskragL0K2hRzmas?=
 =?us-ascii?Q?ZhmMoNBJLjXRS5m2jbCdmJcpc4fLFAztoCFeKNFZtbq+wRMI2nFkp3HR6oP/?=
 =?us-ascii?Q?naBHHaljcfkc1nIY/5J6sHTcrzBkRR2dLX9BZQYY2qm3lCiq2YVJAa0cOZUL?=
 =?us-ascii?Q?q5/bLjXhlKQcugGB/MxSfmCTnupdUeKxdSaAzROpfIVz4PW42WmBJabimJM7?=
 =?us-ascii?Q?WRfGYUx7M8JTecVZIMu/PX/N3StUQVfwDpDOiB/1/4EpFkbOSJPSTPCB9uo8?=
 =?us-ascii?Q?EODb8f/gxCX2vN57/BLFeU+cTVO+XOVVK3HjvPUal7ouxoeLjtXTagXYGvDl?=
 =?us-ascii?Q?oowRN+gT8TWW3Ej9d6/dsrACAic7e2jTm7uKxxn/u1s3X5Yrf037lx7/sar2?=
 =?us-ascii?Q?cW1ACYXqI2KAUzE0/CkeCj4BCUZeok/6kcneRWyBIUS+qx3l1N/3F68JvHhL?=
 =?us-ascii?Q?aiJhgTb1Qj7GMq7mvld1vxtQXT2z4KPL8b6QNshxc6dMcdZxkzrHclevGFlM?=
 =?us-ascii?Q?E1SUk5glxyk30hbai4rrXIrrO+p/uLOunlRTPGcY34sk+MDT4XjMpVxdkHWL?=
 =?us-ascii?Q?OiyQcj30jSHxj9gi7mezOM0VjE70dOZ0Ry1MY5mOzsEC93rYsrHuTtwLW3r+?=
 =?us-ascii?Q?ZUELZ5NQoA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e25f16-51dd-450f-324d-08de74b1f361
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 21:07:57.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FYg6o9L1q4dYFVSU+3jsmrYqOB8ScDfC7DQ61WLz6Vy0TFgjIXFyi6HT/XoQlUIPpl6ZTKzJ8G6GSHv/u3EMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB7063

On 2026-02-25 19:45, Elsanti wrote:
> Replace the TODO-only removal of #[test] attributes with a
> retain_mut-based filter that works with the current MSRV.
> This preserves test detection without depending on
> Vec::extract_if and keeps the generated KUnit wrappers correct.
> 
> Signed-off-by: Elsanti <santiagojoseleal27@gmail.com>
> ---
>  rust/macros/kunit.rs | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
> index 6be880d634e2..e064419bfc10 100644
> --- a/rust/macros/kunit.rs
> +++ b/rust/macros/kunit.rs
> @@ -87,10 +87,15 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
>              continue;
>          };
>  
> -        // TODO: Replace below with `extract_if` when MSRV is bumped above 1.85.
> -        let before_len = f.attrs.len();
> -        f.attrs.retain(|attr| !attr.path().is_ident("test"));
> -        if f.attrs.len() == before_len {
> +        let mut had_test_attr = false;
> +        f.attrs.retain_mut(|attr| {
> +            let is_test = attr.path().is_ident("test");
> +            if is_test {
> +                had_test_attr = true;
> +            }
> +            !is_test
> +        });

Eh, no. I think the current code is more readable. I added the TODO because I think

if f.attrs.extract_if(|attr| attr.path().is_ident("test")).count() == 0 {
    ...
}

is slightly more readable, not that I had any issue with length comparison.

Best,
Gary

> +        if !had_test_attr {
>              processed_items.push(Item::Fn(f));
>              continue;
>          }

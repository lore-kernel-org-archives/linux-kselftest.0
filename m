Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022100.outbound.protection.outlook.com [52.101.96.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7148539B942;
	Fri, 17 Apr 2026 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435101; cv=fail; b=vFxd6rLMkSJ0jfPwNoLS7V6EPTnzKi6isugMh816eUZ2Y+THRn/U4UVbJIUzY0n8C8hLLGiGjVeFcBFhp2LYRAySMpV7Da5ziDxQrZE8LCBokiBPldNYWQCdn3rBqxTfZBDIO6VIqjY+2XhyPUe9Pj3afWX9oED+0Q8i0jVciZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435101; c=relaxed/simple;
	bh=aW812rTJLyIrxl3vaurv6cxTBr7JDEgl+47cYdru/xg=;
	h=Content-Type:Date:Message-Id:To:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Xz6FmJx3rE7/cXXzu57PvQ/AXkof6javfNFE3od1uLG+c/33nq5SRP6/s43w2NkY8y9pC81LnIUb9U1dqibcoogLe4tsz35Qier+LOH2F+DPTVDFXOgxeFLFxZc0iGgIPu2OV+oMcbGTx8uT58DXRyfvscN2yK5K2P9ZXy+fZbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CAKv7uwn; arc=fail smtp.client-ip=52.101.96.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CAKv7uwn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ID34/PkkYyOWAbBZjxx4wpdNoCaqJrKt21H6aH+SyquJ1za9rb84JaQ//GV8UQnDvdxn4V6DB3kCOOY1OaSTC9NAs7l4rmFEhicyn5BoRoeT3/tplNBojPK8GkbL4Gt+KvUYLkvrAtwjLXrpHgthDTi/dixE+iQp4IPYqNwywOKeDrjwaQYCZcotjHLizWYm7nQjNTZ1+mLPtB5GagH3rw79VO7tk2xGr1Vlf7w3+8R08mgJA9Nt/DC08Q9bojnFfm7rKPDSRtAP7/IrReJuk9XXQ3C/2zbNR2QuRWrcGCLCb0Tw19WTs60eapR2EdvD8f0Ws93Y/FlbDShvcQxb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKpjTE3fYsXalU657EcJaXg5KmFijNW5G/hCfCaWPSI=;
 b=QCh5U36DlWD+G6F5VwZo2lOitDbYF3WH8v2MNWYGvImUpIfLmxCMxr8KDPKr6boXahMjudKeLhBd8xqEDOVZILmvZXLf9Ki7q0ij3js+xLqKF7kPVcM94XDRHuq2dk0cVxIAS8J+nnPYMjV7RJ9K87k9z9ObY2n0vkbReRuKKAj8aHVdh9C8USR59FSAabS3xv09Uedx2LAuLtZ6LonOl8JTg3BEnjbNeRZrrYsPN96w9Xz7pw9lJ0Iq52RfegouZMK0+JePfMQr9gecR4ZCk0DJme56CvQgXJoJLE50TLmSMh4Ihmn38L9r4V32bAm3PXDY7hnwKQVl9PQti+wfgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKpjTE3fYsXalU657EcJaXg5KmFijNW5G/hCfCaWPSI=;
 b=CAKv7uwn6Ryt6VE3oMAkaLHJgPzAqcu/l2m/0Z00UeN0NpUKqlXODkDFAOtI9uRtVae6xFCd0dZB/bOo2rkrcKSRAgNPW58Fme8LrrioilBHfaVyk8WrkJM+G/+YdmQDcTrryFlSpWICvQKx41ZIwYpN8O/yKpMHhcJqygDxnj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB9039.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 14:11:34 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 14:11:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 15:11:33 +0100
Message-Id: <DHVHONYVWRP9.DOETMKOQLHM7@garyguo.net>
To: "Yury Norov" <ynorov@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Burak
 Emir" <bqe@google.com>, "Yury Norov" <yury.norov@gmail.com>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>,
 "Rae Moar" <raemoar63@gmail.com>, "Will Deacon" <will@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Kees Cook" <kees@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, "Thomas Gleixner" <tglx@kernel.org>,
 "Douglas Anderson" <dianders@chromium.org>, "Shakeel Butt"
 <shakeel.butt@linux.dev>, "Christian Brauner" <brauner@kernel.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Tamir Duberstein" <tamird@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>
Subject: Re: [PATCH 0/3] rust: add Kconfig.test
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260417031531.315281-1-ynorov@nvidia.com>
In-Reply-To: <20260417031531.315281-1-ynorov@nvidia.com>
X-ClientProxiedBy: LO4P123CA0160.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: b3419b4e-020e-44bd-ec57-08de9c8b3b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	rSOA8eciL9ykyG/3b+JuHumtre8CRQNd4yqXO+4lRvXywngsVEtf0LoSKbJ/o8n+02z3//let2jyc07/1bJz3rS44xNd+XhcgUj2vU0wzlabMqIz85vg3hZ5Y853fI6Gfjuo2sUcCFI/ZTrvjP4yC78p/70PdwY8E5mI4Ay0mvLjHuKbiAp3w2aRSR8ism4v+inhPQGrcI//B4vpUyv07DgdaTAzYKFMOpwExlKQQtlkC6bOQZUL9VKfywjx5jhC7Xg50ECtkzfuUPHjVIT7mc6U2yqNCpnEdewuc5gy76UAD9I0B/51yX8ZSoxpKStOnE6c64wVHkP6YwGOXPMbadcoMtBY5Z9LOWB9NkbPBaey2Ojvo4AKbXLA7N1HffVnjK3719T1rM98Bwja0r0etKSqO/Zv9PeFXTCGvwnR94dE0h2CUlG6xMqImVub77T8AbB+KHhmVOFgg6Vy1uKpaZ1mGuJpseprEiXnW+IXFjkb72oS0eM9ojddKpvbnaXxMGwcjebkicx4W0jiCFpRmBVrxaJOJ8UDmXX+LJ1aeUiNymjXYwewPlF4b0a0Ut5G/geB+Eo6GmjVTmI1CaaUJk9MgwCoyb029BdveibGUrMAFlZvfMf2kCdm5I+c0alqALeJtJcM3YwGjq6CncbAPvuzQFI9Sr9/K5mAMI+jetoJJd7Y4jtRaee68im9dTs2vqK51K61eve1w6T9VDuTrSIyL9ComV+9xrOnHdoenOXLPTo0w+FEMnNmomPLaQYAbWEs51GbeeFEPiFB6XZKOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bC9xaitKU0Z3ajdVZE5salBnTkx6cURLQzFiVXpCWDVMQ2ZUZk5wRS9ISXhx?=
 =?utf-8?B?NG8zcXNXV2t3VE93bGlsYjJrSWNiYVlralFUeHdkU1FNLzc2cEFaL0FOM05Q?=
 =?utf-8?B?eTFPZGJHcEZqREVPVUlSR3VSOUdVMXg0bGRlRlIzQ0NEcDc4Qy9PQzAyMEpu?=
 =?utf-8?B?d2VjZjRMdUt6bUdremk2YnJwMG9TUUtaYVJtZU5uVWJkcldQY3B0L3dsTW1u?=
 =?utf-8?B?MFdERklzUW9oamxUMjdxdW95aS9OdzRrSDVoaUU1cDdHMkZvbWt0b0ljRjla?=
 =?utf-8?B?dnVMQW4xSTZuM2N2WVAzb3BqQmtBTnpvcCt6UEtTKy9WdzBPZUdEYmV3Yytz?=
 =?utf-8?B?T1doaHRpbG1xQ04vbDdWNUNYcUc1SEtRTmZLRk41ZmJEenl6bVRFNVQxc0ZI?=
 =?utf-8?B?TjcrZE9DKzY5cXF5YnlEbEs2eUIxN1AvbWRhbnFLSnllSlQvM3FJWW4rS1hP?=
 =?utf-8?B?ZWt3TEZiaHhibHJaMVlldWdmU3BjRldWQUFFU2RDSDZpY3BBSHBZc3dhNHJH?=
 =?utf-8?B?Y01VYnVPdzVveERURWR6SWlYSkdXTzBaMUp5QjdQSkpzVHNxc0FsTnNQSnVa?=
 =?utf-8?B?RzhsTkFhcUlzV2dObW13ZEVjY1U5SjYwR1hxVFZNcklXRkxhcm03Wm1xYzlO?=
 =?utf-8?B?dHBsR1NFdVRWZmJpa1RVekNFczJuUUMzWTlKc0QwODQxTyt1UXpwbW1UZXMv?=
 =?utf-8?B?bllwWGZoaEJJTXV6b0xXL3lIMnE2MTliQXNIZ3pDSUljVzRBdUtsU1VCM1Vv?=
 =?utf-8?B?Ym9sVHVHaklvUTFaWkl3MjRNdnlPaWJZNGovaEVhdGk1UGJmNEU2YXJIci9x?=
 =?utf-8?B?OFpWS0puVHpJaDBrWDlYaStONVlaZlJIY2g3WG16NVl5Snk0NStqZW8zdzBT?=
 =?utf-8?B?cEhNOUdMQ2kyMU1QUzJabWl0Rk9mRjJCbHk1QWRPelpVZHFQU3lZaWIzT2pn?=
 =?utf-8?B?VExpOVhHN3hIcDJRZ2hyb3UzcEgrRTJGOGQ0c2RPSzlZV09aSlBLN3V1SzdV?=
 =?utf-8?B?OERSMGZlajM0OTVzckFGYmU4Mzg4UiszTFVkV2tyanU4TWhDL3loSGZqNmxn?=
 =?utf-8?B?Y3BqUkR1V1RCUlFTb2h0TGtINDMwR1d4Q0VjREw5cHhGcjhkQjFDZDVPcWRH?=
 =?utf-8?B?eHYrUkw5OG9kdVBtaXIrcE1BdGw1SURXaXd3eGVjNjhiaDZKaVZYQ3BFZVJv?=
 =?utf-8?B?NmFVMGtMR0VWQWVBK0hDdFB5RjRFTjRDWTNNb0JCenV0b3ZKM2k3RXM1alJu?=
 =?utf-8?B?OEk2T1dnZ3FZY3BTaElWeGNkKzVkZ0loNnhkQjBjcHdFZzBkeHkyaG1LSmFQ?=
 =?utf-8?B?a2RzR0VjZXBoK1dqNEFzeTlUWmdwNnA2RkdtdnBDNGNSTlNmOS9sb2JkYzkr?=
 =?utf-8?B?NkpNa09YUFQ0QTlwazROZFVqTDYyMU94T3h2WU9RcmJSQTZkMm9PMGVJakF2?=
 =?utf-8?B?V1BMV25hU0tMTG9objV2N2F0MklJYVVzQXdicEFlT2sxSm5zY0RXTzZ4RjJB?=
 =?utf-8?B?TDJkOFdCd0VlYzk1NXJFRlZBeDB0WXV1TlpYQUN5c0Z2TWdPZUtPcVNiUW43?=
 =?utf-8?B?TTJnME5TVjl6VzN3dG9USFFsYU9xNXMxbDlCdW1oWWVXdUl0bHZtTXlaOFVn?=
 =?utf-8?B?WUJBM1lzU1RQVnRKVjZTNEJGUHZCbzFab2lVejd3QlBGSmlSaUh4Y3p6eWFy?=
 =?utf-8?B?WktXVmh6czMrRzh1ZWtUTXJmUElaakVmMXNiaFc3T0hTdVhKdjJHSmRLaysz?=
 =?utf-8?B?bkJ2TUdVUmZUTFd3KzVGQWFEck12NUtiNHJKMzFIWnFOMDg3TktqOHVja1V3?=
 =?utf-8?B?emx5dEdnTk5PV1hWNmRQbkhPR1N0SXVldjhmdWkyMG1aVW9JSGpSaUdWMzJW?=
 =?utf-8?B?RjZjZkVnaGZTMkl1dUFVaFRNNE1NeUVrUGJ3SGlkZENoMFZyTXpBREhDQnNO?=
 =?utf-8?B?TFFWMGhiODJkRUhDYUo1YVdUd0YwdVR3dUdEQ3hReW8yejl0L1U3b3hsNWhp?=
 =?utf-8?B?N1BVNDVwUXRCMkQ2YjRDb2NWUDdIcVBKRld1VzBJTDNJREdTWCtjZGRDL3hk?=
 =?utf-8?B?aDhuS25PbzE2ajEvT0NjanprWTJkWWpXUGNZSnNlc3owS01XR3YrUk42cDBv?=
 =?utf-8?B?MjBHOWVhQVV0MTlzRzY0WldQOGJHNWlPQTE4UkxqcmFSS1ZUUXNsMkFxQ0hQ?=
 =?utf-8?B?U3F4cnpRaWIvMWRDMDdYVnNoQmpWQVl4ZFdVcVVOY1BQNEU3SFkwU3N5cGNE?=
 =?utf-8?B?dHFMa3BpcmdDZTRadjNhZUJ3ajBDNjNDRnlHamZzZFgzRmgwNDlGT0ZBTUpX?=
 =?utf-8?B?YVlLRmhXWnFZRFg1alozaktrZlNHODdmRDVDTHVTYlpuWnViSmhvdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b3419b4e-020e-44bd-ec57-08de9c8b3b79
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:11:34.6318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjO66wSgboyK55V8T/kCHB/e5rWM5U8rB88kDy3ODruEM72nb2oSwW0eSIJsTLmM4mKBNip91+Z+VVeXxABlhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9039

On Fri Apr 17, 2026 at 4:15 AM BST, Yury Norov wrote:
> There are 6 individual Rust KUnit tests. All the tests are compiled
> unconditionally now, which adds ~200 kB to the kernel image on my
> x86_64 buld. As Rust matures, this bloating will inevitably grow.
>
> Add Kconfig.test, which provides a RUST_KUNIT_TESTS menu, and all
> individual tests under it.
>
> Yury Norov (3):
>   rust: tests: drop 'use crate' in bitmap and atomic KUnit tests
>   rust: testing: add Kconfig for KUnit test
>   Documentation: rust: testing: add Kconfig guidance

Acked-by: Gary Guo <gary@garyguo.net>

>
>  Documentation/rust/testing.rst       |  5 ++-
>  init/Kconfig                         |  2 +
>  rust/kernel/Kconfig.test             | 76 ++++++++++++++++++++++++++++
>  rust/kernel/alloc/allocator.rs       |  1 +
>  rust/kernel/alloc/kvec.rs            |  1 +
>  rust/kernel/bitmap.rs                |  5 +--
>  rust/kernel/kunit.rs                 |  1 +
>  rust/kernel/str.rs                   |  1 +
>  rust/kernel/sync/atomic/predefine.rs |  5 +--
>  9 files changed, 79 insertions(+), 7 deletions(-)
>  create mode 100644 rust/kernel/Kconfig.test


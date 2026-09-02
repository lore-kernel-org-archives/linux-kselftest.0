Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021138.outbound.protection.outlook.com [52.101.95.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB623CEBA6;
	Wed,  2 Sep 2026 22:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386441; cv=fail; b=twd3BUlz1EkeuKDVEv6YCnBbbHu6gmxKXcm0W6imIdG1va63lFp996pKbMbF/YTzTYqulRwPgww0VQ4wY7auhNa6j4+XifCe3Fr+ZP60vVp2DxQ3EFqREOJgyrYfD8F/L6gfA74DTjuAd+LS2MJ7l28SV0WYx0SdpmNjbXpHTmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386441; c=relaxed/simple;
	bh=uAZWyJ4TqhHSbqxR098SNMt+LnK5fZaIrY9HwZF5H1c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AjMEwbzPDOZxL6UaFnjb3l0t5wzWt28ItW55qISgT4ylAjKNAJIMn3Jf/FNSr9DKwUbBZ8amUcLuHZE+3YKJ1HvCZRsCMJLW+q7J8Ejgx+sQGy/jObyPlNs7ejxkO0pPizZlw3bd1Has76tNoU2rxBGyN6ptXpQTNZp/WAxmzcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HUqhjzQd; arc=fail smtp.client-ip=52.101.95.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HUqhjzQd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBYxYwcLqG/GHMVT6vM1epZtvsGwgJBKf3egMYWSM/OxSWL1NZ8vhAm/HMP2VXKW6A52dM7+k2KSHs9tQYnDKAfcHREeI0wsKzEEVjH8bYSs7fG0zsV7whh7o2+NvFbfrBmDhPn+bUYXw+6fk2lJR9dIr0OI31hMxZleCrC3K4ON5lVIE1yT9mQ37/KRsatFEM+4+UQDhKpPBGF/K7CQ8bcQ6okSPI8Bb1ALnkjUbUaVuN3b4Zz0euYmL4QYeoXs0jzIbFEXiX2H5YzEs7V+A/aLmDbxoSpmxTG4OWcuIeror935Hjld2v5rxXZfiifEoksFXJB+d0qoCko43vstkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kzx5qFIUykHljOmd7LUmPjZhL9FahW+74V3kofS+1WY=;
 b=m+rd33A1d/k/awKdbJu431TEoQsnkFA6D3m1MrQeUYE+VW33xjqTvBycw7pHLy5qf3FE3xJig1WKuPirIrLZlItoheaYqvmPPyJXdvGpZm7tSR5Vd1c6lTxJUJf0Ac30fDhSNaNJUSZ6gYsSqUNjImER4YE4BvghRZ2DiODHMyLxTtVGyGZK+zA9veQpIv6uJNrLTqZ6xh3SUZhaWBdMc052VarApINeGgS8kkOVp0NNLdgU5LXqcPnkrK7BFNutRyGQUNFZtWingMZ/Rhzhe3IFP6Py8J2eL+IvM53b9lL3s+nujNLWV9+jqSS6FQkP3frI7LJEoN+0KTa27QsGqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kzx5qFIUykHljOmd7LUmPjZhL9FahW+74V3kofS+1WY=;
 b=HUqhjzQd59Z/TCHpM6zo6UXSOlV4UgWpHQACDfrRJo1YqNtcpR0SxHMCv4E4Ff5RowmPg+Aq7goo5eQ8gzZXlfZhWBakzRoCpzYfvN1q1IxSX51ZofXy2Kb4ngmWZxrRPA9hGnkCPAvGTWehKmgb7Nk11DmA6RpP3JCdnKkfw9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB2773.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 22:00:11 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 22:00:11 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 02 Sep 2026 23:00:01 +0100
Subject: [PATCH v2 3/3] rust: doctest: generate Rust kunit test suites
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-kunit-v2-3-eda3ed6c00c5@garyguo.net>
References: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
In-Reply-To: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788386408; l=4725;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=uAZWyJ4TqhHSbqxR098SNMt+LnK5fZaIrY9HwZF5H1c=;
 b=1F1eW5kH7YQffszbSnrfGChOjCKHL1feEnGr9XNWL/keIm+q1V2LB14/NedpRuqCJPymYK3dh
 qilgkLLSmhYD7kzY45P4WjUwu9ZRBBdShOfXLhGYFStMmGRQhsRiexL
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: CWLP265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:57::22) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB2773:EE_
X-MS-Office365-Filtering-Correlation-Id: 995f0cbd-9f9f-4d83-677d-08df093d8f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|7416014|10070799003|366016|56012099006|921020|6133799003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gfbjM4FrHGjXbZr+HJ+ifwAi2R4RCsSJdi3CAD2W+EDE4dbO5l/Yw69FzhbDC7HEPlkR7H3Lts+e+GE5vzzHNdSUY/ysXS00t0UTJTjBz5lASvxqQFh0JWNpaDlLCRxWTdqOPazZdPeAFvFZ+WxkF+0iMTQ0LOcGaZTy5j6p5b9dkac70INoOzmh1EYalCSrb1QETxJcmq5lCXAAO15M4ZAVg+o8PuUGEVM78LlQskgkUDPcIPji4fVDE+rFZqULIBXWVQy2ayHWg0zgH5RgjdMFYjAuUnvt4WuIbkZBgIt0rrHdXYfzMNgIiHc3CPOwdW4TfZdMuNUicITtCwgTZpvLG4L/8j0qjM7akKdOBNMcj0YBFRoYknBID8yzcewaMgpGK3JBM2JJ0EZ+N6Oh9g/pLA2YJp63qjYzXeoQ4rddgzk3pcejoyndbJg2ThbjAA/eaZiwNTJTznLFeQ0z86DT0OYkSHpCw3a/nB8LJ6A3YrsOLeqb6Krc5eA03H827V3N6NMS/JUb5huM8Vak30vCO1/knr+ARKeUgQUdJOrGF6QRjdBetQX3nUYuaijrYFQryJOXzdJEMyA8wwMJY7oKgdkhEZSnPXh3NvrftACT5URBUgWQJhWbKgkrXxL77Prk4H6CI3INIQUxf64hnALVgfbimaPasv0PUoX/e8GZuxl0EA2+12GJmdpbUgrYZrfsOJjNQXsEHLEjyBLhxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(7416014)(10070799003)(366016)(56012099006)(921020)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUxaK0ducnZmMHIvREtNazdUWkQ2dC9xczBsRXdZU09hckJJalkzRUt4eUxP?=
 =?utf-8?B?RHMrYXMvM3pyTFVodVJMZ3lhelg1QlByVDQyQmNrVGxUSFZJaERiUVF5dDlh?=
 =?utf-8?B?RHREMExzeHFnS1pxZkZmd1IrQVZaRE1OeWg4OWMxV0JMcSt1NStCQnovYlV2?=
 =?utf-8?B?c3RnTmgvOUhUcW5mSDNKOFpGcGRSVGkzOExxRnVUblh6eURMTHI5ZUNmT0lN?=
 =?utf-8?B?RzNSb2o2bmhQUmRIZzIzQk9ZY2NGVjJHV2xzSFZSYXh0TDZrMlFUYTVMZ1Vw?=
 =?utf-8?B?WTFkaDdkZzIwc3RRYWt3d0RxM0xvOGowSkhTZzJHelhoM0hQYkFacGo3K2J4?=
 =?utf-8?B?UzRWdllwM2wxck5rb1czTGlDTjZHL3NaamxnRjNsNE9acUh4N2VZNFB2TzQr?=
 =?utf-8?B?M2pUR1krRytudnhDS2lMNmxLZGg4N05EajllOXhsek1vd1BZaWxkbmI1RVd0?=
 =?utf-8?B?cVVhQ2x3Q3lNYU50UzQ1ajB2MDFmazZDd3JnRWdyOW1uUXB2Z1I1OGZmNDBQ?=
 =?utf-8?B?bm5UU3I1cDg4YkwvL0lJRDYxRWM5YjQvZkw2TkNRSXF5WU55SW84WXZSZnJ6?=
 =?utf-8?B?dGl6NVFDZzJUQ0FOTzdRdVE3S0dFZWN0Vjl2b1A3bW4zVW9Kd3ZXcjlMQnkr?=
 =?utf-8?B?RkNleW8ybkxOZ2ViTzRsR0FMZm8zRWE3cktFS24zS0RjMitQWVBoRWZWM2R3?=
 =?utf-8?B?YUVKZm84ZnBIUXRPMWhtaDJmQjQ1bTBCNHpMUk9LclZtVmJMeDdJRjBkSy9L?=
 =?utf-8?B?QXlLOHpzSDJmbnR6R2V1a2R4eS9FQXVBUGJENnRwWlU4ZWlVTTNSN05pZXNv?=
 =?utf-8?B?czZ2UzF6TFBuem0ydUJzK0oxQUxIVWMxK05mRTYrNlZJSmdJU3Y2blZMSTNv?=
 =?utf-8?B?Q2hRdDFqL3oyaVZCK08rSkRkS0tkbnZCamx3eExvd3FrTkNJWURqYnd0RldJ?=
 =?utf-8?B?NjMrRXE3bGVPRG1lWlZ4WmZSK2EvSjdTcFdLYTJzQmczZ2t6NGZ2aVltMGV5?=
 =?utf-8?B?dzJ2aURZRGNnSW5BejJpZFJncDhKTlExampaekdvWHZiTkRJeks3SWRwdlJr?=
 =?utf-8?B?MFBybEQ2N1ZJQy96YkZKZ0cvTGE3ZE1JdzRyZkdpRk1SL3JvNWxrL2tsd2hR?=
 =?utf-8?B?S1lwbkdJTnN5clg2WmtPOWdvWTU5eERSdFVjV2NOY2huUnYzRG9xS0NvVlIy?=
 =?utf-8?B?QnpNWFR0R2FDN0VnekVkS1NScms4TkMra1hiZ25XU1NrVDJlZ3NmdCt0ZXNm?=
 =?utf-8?B?NXZVMjAwdVZGNm03eDhpQkFwQVg4OEllY1d4dlh3V1lyc3ZxbzdnLy8vSkh5?=
 =?utf-8?B?SHhjVVRXVWE2VlpQR2dNL0JVVTNWQVg1ZzYzR3NjWVUzRHV5YVhEVXpjbklw?=
 =?utf-8?B?SE9hS1A4RnkwSHZPbFdMUitNRFdIdTRwbTlEQlRITnF4NHI4SGNZMHZhNi9Z?=
 =?utf-8?B?VEpiL2NOZ2RNZVZZeWxCTDI4c1J4SVRxYTRkRWI2UUREMHJyRTBvWjNKdERR?=
 =?utf-8?B?R2thYVNQMzNZU3h5RGcrcjdPOUJNakNGM1IwajFvUDFjZlBBTnZJWVh0cm1u?=
 =?utf-8?B?eXZtNGpiZkphN1FtbkJ5Q2Y5RW5Icko0M0NUNVp6eSs5dHFwZ1NTZ3RGSjh3?=
 =?utf-8?B?S3pEdE5SOFlKVFRLVDkwaTYyOVdkckR0SHF3bVRxUlRQWWxacUpCczEreVA1?=
 =?utf-8?B?d0ZoVnFRZlNseEFMT2Y0K01kZ3R2VlRyUC93WlFVZnMvc3RXdzVNSzhvME5j?=
 =?utf-8?B?VXpqNjBHRlowRGtJbzE1NWYwWVkxN2xkUXl5ZVROKzVaUXphUFBrVVh5Y29Y?=
 =?utf-8?B?OHZsdHFUY0Izamk5bDZaanJjSkM2N0MzZW1Zc2ViejZKRjRDcnlFOVorSXRQ?=
 =?utf-8?B?d1B4VU1uWFpIZUY3TEEyQStOYlo4VUlITlR0OFZwaUh0QlMxcXZsR253ZHJJ?=
 =?utf-8?B?UDBiS2MwN1ZOekZyNDNycit4RGdQWUJtNFJvcHc1bFZQdW52VUM0WUc5Tkpz?=
 =?utf-8?B?L0VPRW5KTGRUVVlXZWJoVExmNExNc3ZqQXUvQVRzRFVUdUZ5NW9rZG9CK2hy?=
 =?utf-8?B?NnVtbGcyTUp4c01DdG9rcmR3ODNKTEEvbnlsLzhid0RvVndxNi94ODhyNkx4?=
 =?utf-8?B?KytqZGNobVkybnhXM2xXMzdWeGJJRXhENUdBcHBjSzF6cENOSUJUclZCOVlE?=
 =?utf-8?B?VldrWVZBSi9VbVF0UWNrekorbHI4WE5ESm52UGJrQzMyejQxQ3lWOXFDdi9H?=
 =?utf-8?B?Tkl5UEhHN0k0azcrRElwQXdHY0d5R0RVLzlFOE91RmRSejFPRmgvUnJaNE44?=
 =?utf-8?B?RGNiU3d3M0hVWVNJQWV2QU1ZM3JmYnZTR29SY3BlWlNGWW9vVGptUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 995f0cbd-9f9f-4d83-677d-08df093d8f58
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 22:00:11.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUHW41BC78/70cSuPv6jTBHbgaHvaFi6Su3RLSakM+Th3BEC+1R4AuNc+UEeOEZXlitS7FVpqHPi2bjvkwaMYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2773

For doctest, instead of generating C FFI functions, generate a Rust test
suite with `#[kunit_tests]` and `#[test]` attributes. This makes the C glue
no longer needed.

Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/Makefile               |  4 +--
 scripts/rustdoc_test_gen.rs | 69 ++++++---------------------------------------
 2 files changed, 10 insertions(+), 63 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index da1a7409d984..ec8c08ee3263 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -39,10 +39,8 @@ obj-$(CONFIG_RUST) += exports.o
 always-$(CONFIG_RUST) += host/libproc_macro2.rlib host/libquote.rlib host/libsyn.rlib
 
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
-always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
 
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
-obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
 ifndef CONFIG_UML
@@ -400,7 +398,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 		$< $(rustdoc_test_kernel_quiet); \
 	$(objtree)/scripts/rustdoc_test_gen
 
-%/doctests_kernel_generated.rs %/doctests_kernel_generated_kunit.c: \
+%/doctests_kernel_generated.rs: \
     $(src)/kernel/lib.rs $(obj)/kernel.o \
     $(objtree)/scripts/rustdoc_test_builder \
     $(objtree)/scripts/rustdoc_test_gen FORCE
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index bb870f83dde2..068ecdb0845d 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -125,9 +125,7 @@ fn main() {
     // Sort paths.
     paths.sort();
 
-    let mut rust_tests = String::new();
-    let mut c_test_declarations = String::new();
-    let mut c_test_cases = String::new();
+    let mut tests = String::new();
     let mut body = String::new();
     let mut last_file = String::new();
     let mut number = 0;
@@ -172,10 +170,10 @@ fn main() {
 
         use std::fmt::Write;
         write!(
-            rust_tests,
+            tests,
             r#"/// Generated `{name}` KUnit test case from a Rust documentation test.
-#[no_mangle]
-pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::kunit) {{
+#[test]
+fn {kunit_name}() {{
     // Overrides the usual [`file!`] macro with one that expands to the real path.
     #[allow(unused)]
     macro_rules! file {{
@@ -190,26 +188,6 @@ macro_rules! line {{
         () => {{ const {{ ::core::line!() - __DOCTEST_ANCHOR + {line} }} }}
     }}
 
-    /// Overrides the usual [`assert!`] macro with one that calls KUnit instead.
-    #[allow(unused)]
-    macro_rules! assert {{
-        ($cond:expr $(,)?) => {{{{
-            ::kernel::kunit_assert!(
-                "{kunit_name}", $cond
-            );
-        }}}}
-    }}
-
-    /// Overrides the usual [`assert_eq!`] macro with one that calls KUnit instead.
-    #[allow(unused)]
-    macro_rules! assert_eq {{
-        ($left:expr, $right:expr $(,)?) => {{{{
-            ::kernel::kunit_assert_eq!(
-                "{kunit_name}", $left, $right
-            );
-        }}}}
-    }}
-
     // Many tests need the prelude, so provide it by default.
     #[allow(unused)]
     use ::kernel::prelude::*;
@@ -238,14 +216,9 @@ macro_rules! assert_eq {{
 "#
         )
         .unwrap();
-
-        write!(c_test_declarations, "void {kunit_name}(struct kunit *);\n").unwrap();
-        write!(c_test_cases, "    KUNIT_CASE({kunit_name}),\n").unwrap();
     }
 
-    let rust_tests = rust_tests.trim();
-    let c_test_declarations = c_test_declarations.trim();
-    let c_test_cases = c_test_cases.trim();
+    let tests = tests.trim();
 
     write!(
         BufWriter::new(File::create("rust/doctests_kernel_generated.rs").unwrap()),
@@ -271,34 +244,10 @@ impl ModuleMetadata for LocalModule {{
     }};
 }}
 
-{rust_tests}
-"#
-    )
-    .unwrap();
-
-    write!(
-        BufWriter::new(File::create("rust/doctests_kernel_generated_kunit.c").unwrap()),
-        r#"/*
- * `kernel` crate documentation tests.
- */
-
-#include <kunit/test.h>
-
-{c_test_declarations}
-
-static struct kunit_case test_cases[] = {{
-    {c_test_cases}
-    {{ }}
-}};
-
-static struct kunit_suite test_suite = {{
-    .name = "rust_doctests_kernel",
-    .test_cases = test_cases,
-}};
-
-kunit_test_suite(test_suite);
-
-MODULE_LICENSE("GPL");
+#[kernel::macros::kunit_tests(rust_doctests_kernel)]
+mod tests {{
+{tests}
+}}
 "#
     )
     .unwrap();

-- 
2.54.0


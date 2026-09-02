Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021138.outbound.protection.outlook.com [52.101.95.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618D5421253;
	Wed,  2 Sep 2026 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386433; cv=fail; b=bFT+TBSjT3M082ffIo896R0kcl29Cr0lvS2vDNPYBjNNGXhS0Ll48B2w9Xz0WcGpz7hYZE6K2Vo4dqEk+1cKwUQBkckaV8la5gpsp0a3jdsENzpjVhXQqUCDDvExHrKIIrYJ9dMK3d2S6Mnma0sYh2kE2aGxCni6x4G9akNMmgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386433; c=relaxed/simple;
	bh=YufZupjiRUchUD1oGD80hU8jFBTIk8lZVj6k15paxBA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CKi8U6OxfDu1TA9oRKMfQMFcNw8ou3WCQYq5uSKlTIVyVazngBs12Ikn2Pt1Lkf8GJqjWEqoShZ3jtYZj9A+bsAdrLMvgoFCFbqyvrK5mRgHEp1eAlZDmuoEkcsSAaptq90J18HtjY++AYH+pcQlqhpbrFf/syDZ+BZRgNtGIRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FtsV5P1U; arc=fail smtp.client-ip=52.101.95.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FtsV5P1U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLQ+PHSB9TO6VyilAu69yErWoFgPdmjNrQyuRfehUuismBBJiKWDszV02VeBoUaDk4s7MutkZXmybIhswlGO2H89/yCjZp8nEEwix2MexskKKVCKnhzaNMdlKRfKod2Pd0CuJc73b/ikS3XIUKuI7fTbq7HiNd2z7fqB/a9Nchjcjb/ttwDPURki9q86wuCWJE+QFm11B3CsZeyQutPg6uI90/8XXD9LVpYwZ4o807oiC+3xRCx18zs8rusUHJ2ABqJLVqUidbyGtnba5PgXdOa7FC4/91ILTlp93GG1qQwlCTWvfeSuPNsShWcBvtDdyn97jNuDznP+3+NwtVQgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZesE9lpj7ulg9y0HvQ8D/w7MProkMlLIKecRPAwnfs=;
 b=bZCayMmz2QXcW0crcXPaDOLH/+M4/3rxulAzRXI/QY+r3VbHi4iPbhHaMnUVhuWWKSvNt69fbkWVpqkNPgiSBgpkac3OxbVqiOuDuM6k7zXy+8SSK6dxkVYNVI+LZ+bofQW1btfSXAHxQy8t6cYhPWJvfj5mE5EeYg1q7gOYO/0wK06FnqzET2o10fpUtgdknqFj70kPaXESsf5z830SOs0LP6lJ/DG4ZR5pdtV30IubOfA3ZBpfL61PYxDINj5ayHqJZgedGfXYSulcnCIg7LZjBXP5t49b2M+2Xw3O2M2xWYZNOjBy+KLejEe1BYB+OqH6N+ebfqjr82N2sZy1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZesE9lpj7ulg9y0HvQ8D/w7MProkMlLIKecRPAwnfs=;
 b=FtsV5P1Uevjj39EFLNDMcTu3AGE+zaD6BlqMMgf3WtvjAvRpjtXXPxm+nVvNmaqO8mOIPKgoRjS9ug+O+xV2h+X6NtnluB8rNSy4mbupt/F/8SpGiSp04NrZsHEIf1h9ihKCz0vaMQ1zdMI+VV5x+Heh6kpNaYwSpUeS3JOjxjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB2773.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 22:00:10 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 22:00:10 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 02 Sep 2026 23:00:00 +0100
Subject: [PATCH v2 2/3] rust: kunit: use `line!()` inside `kunit_assert!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-kunit-v2-2-eda3ed6c00c5@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788386408; l=5845;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=YufZupjiRUchUD1oGD80hU8jFBTIk8lZVj6k15paxBA=;
 b=mdazVjoKHDmKF4eecMkgiftRqYjCiUezVDlp4EaSsf22DEN8p/eou+zlSWkcqNgLAbQwAo2VH
 scANgRpr+T8AsDwHQPpUdf5UPKTkXzPPIYlH7Am1EV9Aqz/Xm1poT2h
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
X-MS-Office365-Filtering-Correlation-Id: b33727ed-a2f3-4a89-673f-08df093d8ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|7416014|10070799003|366016|56012099006|921020|5023799004|6133799003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4FBPuYCdtbiOYJPgTEhIKfx++QawR+Pv6UtSJyWaXKLC3LSdxgxBAOuco3FqYSjylbSKw31aw2AwzAcTEuEk+yiBb+iVBTQ3IF8VSDNgtxuowT6da7FiN5Co5wsrb+BZdxMr7Q9Zz64cCQ0dz9hM36LpEe6M99IxY+ywk3csGjG3pAhmnEuxhOHKjL5lG/a7CC+0nsGo5NH7263bC64xfp/+639DX8VBXkQfbfahlpEUfgFiChFiNJSmWHaxIehb6jC1Ijh6uzEcSSfe+8lN6H0F0P6fyiNUq7pPQapVlOUMo1lOCIaTpyBwsPbdhu8/pcJOXFKSNzr59ok+6Tm/4Cza9xhPgP+gE4wiBOcmEMgGuQ7Qk7YpJtMViAKNGLeT6fEadtM03qtAwxXiTT0Kwc9dFgcueBz96XigJYeAChur2NkK/BNSypcb66n1xJISzJsR/XUnMxjyYsc87lZ4CKKx6TBAQFAd/FdBQwS7gK9X9TOtVeQZ21Cz/nmXaSCudcb6L7Rvc/yeOILOTKEJqO7jr7mQkgVJQbV9Hn86m3EvXABqssqK1suEbOFenAb3cbyHNEG8qi+3qGOYzkNaLMwJdeLXdZOdfXuUyW8FkdhCOt79hrpxXX77jBw1BGJl2QiH4/oiJQw5wBVEcOKnRwJ47NDJXzclT3bEwgMc4SgIXKyDlXhQ+SWVaFJwsI5oXxCpp8s+QFh5FzgU9prSLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(7416014)(10070799003)(366016)(56012099006)(921020)(5023799004)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0tENFJwcWxrRVp3d216NFdYVWZnS2JCRXhJbEVTR1lzNFZnbXlMZ3FVNXZT?=
 =?utf-8?B?ZENFeFo3bE0xU0dMTkFMa3VsM2ZKUWw5ektXVEVtWllwWXdXS1lGL0FOK05Z?=
 =?utf-8?B?YVpuR0F2RGVxYzJheldWVy9Oc2p2cEVRMDZ0MWowUkxHRGduTXNqV2RLNTY4?=
 =?utf-8?B?bnNDaHdWV3JEb0h1QkNWakJxSHR3UXUzazJZS0NrR01ZNjdjZENoblEvVlFI?=
 =?utf-8?B?V050TXBsZTJBMUJMV3VzNTFiZXI5M3hueDVwK0dsYmJGTC9RVTg1empOL0ZU?=
 =?utf-8?B?cFhoazdpOWZ5VTNPa2NkN0U2bmNGRDJpM0lKTXkzTVQ3SzlyTTB1VXZBOGZq?=
 =?utf-8?B?WkRUcXA4a2tRbytlM2JrT1g0VHAwZG5QZ1BCeEhTb0pUWUJ6ODIzKzZ0L0VJ?=
 =?utf-8?B?UElPdkxuV1cyK0NWQVp0MFNIRXp1aFFmeWZJYXlPdWlhcER4R0RLQWNqdlcx?=
 =?utf-8?B?SWVsR0RvVkVUZ1MyWkpoNE9NT2xIajc1QlZncVNLN2QzTXpHMngvc3E5QXV2?=
 =?utf-8?B?YlFmLytlTGFBNjBhTS9ja2xnQnZtcEo1TXYwQUVTMExEWTN4OU0wK1kzQ0xi?=
 =?utf-8?B?TmJ5UGRtYitiSE5mSG5NMVVPeHRzU2svUXlMTW5YWG10ckVxa1ljNXhNQVRO?=
 =?utf-8?B?R0JkWmZrcjM4dldsOFRMSk10Z3ZTcTMxY3lpYkF0YXVlcit3TjlpeWtCSHdt?=
 =?utf-8?B?UHlYQ1dhN2Fpdm5jSnRSVXlsMUovdnBJTUdDd3RYa0xyK2FiM2NVUmg2UnRj?=
 =?utf-8?B?L1NacnRxZklTUFMwYnptWFVhMjVhK0NiNkRPTXJHdHZ5Vlk5Zy9xUVZGR0tG?=
 =?utf-8?B?cTV5NmVJOVFzQit5ZVZTb2NETXdJdVVKSlRqVjc5M2pXSi96cWRIYlJXRWVP?=
 =?utf-8?B?YXJ0cWxIMVBuUVhOQ1o5WFQxMkQ3R2JxMzdONzZsK1FvWlFQRU1DMGlKQ0xo?=
 =?utf-8?B?NnJxUWpEaGhzTDQ3czBYUUtNNmE2WG1HT1lHU0pSREFqbUVTZXkzSUNSTis1?=
 =?utf-8?B?eVJzWjEvSWhWRGxIYkVTK1ozUWZhSG41Sm5xS1l3aVNXMVczYzBIdUdEWjBK?=
 =?utf-8?B?aEZLT0o4OUY0T25ZZ2YwRHZpOWJSMGFqL1VxOUFJdVdmdU84NDdIRkx2UjBT?=
 =?utf-8?B?REFnQm8rcUhxSDhOOTZCQXg3N1pPcmpmcVBFNkREbnVySzY4cExBdy8vUG4x?=
 =?utf-8?B?QzY4U2xkRmVuWmZSbGtDNHp6Yk0zQXV4R2pjTGh2SXNucFNESmpDSEpHWXZx?=
 =?utf-8?B?Y0dRejFJMm1IcXduRDJFZytrM2trZU1YU0kxTUNQaGFjR0t4SG1SQmlCakRS?=
 =?utf-8?B?Y0ppWGRwRlZMb0pMSVYxU1Znb3JJZkZid1Z0QUVaL1N6M2t1cnMxS2lqdTdx?=
 =?utf-8?B?aEI4cko0OHNFZDBnbzVyaUZlek91TDZGZ2c3RDg0NXUvRjAyeUp4dXU2TCtB?=
 =?utf-8?B?Ym96RU1sdzRNbDFHbnR3RHJGZk5HREgyVmIvbkVKM2QrWjRhRjF0U1p2eW1r?=
 =?utf-8?B?ejFxUDBEMEdqdHhNb0F0ZkxYMVgwbGJmMXVqd2U0dlBCYTdrWVlYSWhRMlRR?=
 =?utf-8?B?ZEtUaHZoVy9QV2M5TlF0YU5BQ05PZ1hsU3oyam9EOGpIQ2tDOXF3ZVRQclhs?=
 =?utf-8?B?UDVmeUFteFo3eGVvNnViZE9tOG1mSFdVcVdCSUl0SUloQWJ1N20zM3hnZUY2?=
 =?utf-8?B?bTBHR3huZnBOd1NqZXgzNStKQjhQbDlsb2VPUlhrQi82RGdyZEZsam1UUkFm?=
 =?utf-8?B?cUJpaXd0bDJZQ3hITlFNalJlVUlkTlVzb2U4K1BNc2FybXhpbkdsNXVROHY5?=
 =?utf-8?B?dmViNFBxZThTR0VHcGtWcnlMZHptNzdiTEc1d2FMeFJRLzhXQmpWUDlidFJo?=
 =?utf-8?B?NnlJM1NQeHh5L29EaWJkdjBpTGFMc0IyRDdtalY2SVRCSVMyRmkwVjlVRXB0?=
 =?utf-8?B?NkFIYmxXeTdObmR5WERJcWhGRUVFN29RRnRyRGlaaWZ4TGR3RklnRmpOSVg3?=
 =?utf-8?B?T2ZYREp5UW55WnBHVi9DcHdORWlGcjR0ZnA3Y2ZCaUlWN09hNEJWK2Y1Qjh6?=
 =?utf-8?B?T1BSLy9GRXBWZ2dGRkJnaGxmRjBIK3RUT2oxbitHb2VMOGJCTjBDOW5aM2Vp?=
 =?utf-8?B?T0FxdUpnV2Z0cDJlWlhoWE1zbDRFRGMwUHFZVU4rb3NnTUM3M1BpcDZ6bWNx?=
 =?utf-8?B?ekNqSmxvUE9MWjJTSndobTl0bFNpeTNvWWlKYUFJSEs3cUJuUDZUa1VlaWxN?=
 =?utf-8?B?REZMT0c4ZXV2UklROXAvTXZtTjI4M0wxV3ZNTTR5TWIxM0xyYS9TUXVLTjRR?=
 =?utf-8?B?ZHBDSHZPY0ZPZHhuR0ZwVi81bVh6K0R3bmVlYVF4SERWYWNMVkVyUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b33727ed-a2f3-4a89-673f-08df093d8ef2
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 22:00:10.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtsb/3x/Up3fKKe92StexLmRZTCINOu1z3PY6GB/zNKAwMM53mi0hOeEQM6jarLk37pJUyN4VqRq0iCwELRMnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2773

The `diff` parameter is needed currently because doctests want to override
the line number. Simplify it by changing it to use `line!()`. Have doctests
override `line!()` macro to achieve the current behavior.

A few current doctests (or their invoked macros) require `line!()` to
expand to literal; they're updated to use `::core::line!()` instead.

Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/kunit.rs        |  8 ++++----
 rust/kernel/str.rs          |  2 +-
 rust/macros/kunit.rs        |  4 ++--
 scripts/rustdoc_test_gen.rs | 16 ++++++++++++----
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 12084873b51e..27b109923407 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -58,7 +58,7 @@ pub fn info(args: fmt::Arguments<'_>) {
 #[doc(hidden)]
 #[macro_export]
 macro_rules! kunit_assert {
-    ($name:literal, $diff:expr, $condition:expr $(,)?) => {
+    ($name:literal, $condition:expr $(,)?) => {
         'out: {
             // Do nothing if the condition is `true`.
             if $condition {
@@ -67,7 +67,7 @@ macro_rules! kunit_assert {
 
             // Use `file!()` instead of `::core::file!()` here so it can be overridden.
             static FILE: &'static $crate::str::CStr = $crate::c_str!(file!());
-            static LINE: i32 = ::core::line!() as i32 - $diff;
+            static LINE: i32 = line!() as i32;
             static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
 
             // SAFETY: FFI call without safety requirements.
@@ -165,10 +165,10 @@ unsafe impl Sync for UnaryAssert {}
 #[doc(hidden)]
 #[macro_export]
 macro_rules! kunit_assert_eq {
-    ($name:literal, $diff:expr, $left:expr, $right:expr $(,)?) => {{
+    ($name:literal, $left:expr, $right:expr $(,)?) => {{
         // For the moment, we just forward to the expression assert because, for binary asserts,
         // KUnit supports only a few types (e.g. integers).
-        $crate::kunit_assert!($name, $diff, $left == $right);
+        $crate::kunit_assert!($name, $left == $right);
     }};
 }
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index b3caa9a1c898..644b4279a116 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -411,7 +411,7 @@ fn as_ref(&self) -> &BStr {
 /// const BAD: &CStr = c_str!("literal");
 ///
 /// // `c_str!` is still needed for static non-literal C strings.
-/// const GOOD: &CStr = c_str!(concat!(file!(), ":", line!(), ": My CStr!"));
+/// const GOOD: &CStr = c_str!(concat!(file!(), ":", ::core::line!(), ": My CStr!"));
 /// ```
 #[macro_export]
 macro_rules! c_str {
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 936eff014870..e9152b9d51f9 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -113,7 +113,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
             #[allow(unused)]
             macro_rules! assert {
                 ($cond:expr $(,)?) => {{
-                    kernel::kunit_assert!(#test_str, 0, $cond);
+                    kernel::kunit_assert!(#test_str, $cond);
                 }}
             }
         });
@@ -121,7 +121,7 @@ macro_rules! assert {
             #[allow(unused)]
             macro_rules! assert_eq {
                 ($left:expr, $right:expr $(,)?) => {{
-                    kernel::kunit_assert_eq!(#test_str, 0, $left, $right);
+                    kernel::kunit_assert_eq!(#test_str, $left, $right);
                 }}
             }
         });
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index bb57745ec339..bb870f83dde2 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -176,18 +176,26 @@ fn main() {
             r#"/// Generated `{name}` KUnit test case from a Rust documentation test.
 #[no_mangle]
 pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::kunit) {{
-    /// Overrides the usual [`file!`] macro with one that expands to the real path.
+    // Overrides the usual [`file!`] macro with one that expands to the real path.
     #[allow(unused)]
     macro_rules! file {{
         () => {{ "{real_path}" }}
     }}
 
+    // Overrides the usual [`line!`] macro with one that expands to the real line number.
+    #[allow(unused)]
+    macro_rules! line {{
+        // NOTE: This does not expand to a literal, but a constant expression.
+        // Therefore code that depends on `line!()` being overrideable needs special adjustment.
+        () => {{ const {{ ::core::line!() - __DOCTEST_ANCHOR + {line} }} }}
+    }}
+
     /// Overrides the usual [`assert!`] macro with one that calls KUnit instead.
     #[allow(unused)]
     macro_rules! assert {{
         ($cond:expr $(,)?) => {{{{
             ::kernel::kunit_assert!(
-                "{kunit_name}", __DOCTEST_ANCHOR - {line}, $cond
+                "{kunit_name}", $cond
             );
         }}}}
     }}
@@ -197,7 +205,7 @@ macro_rules! assert {{
     macro_rules! assert_eq {{
         ($left:expr, $right:expr $(,)?) => {{{{
             ::kernel::kunit_assert_eq!(
-                "{kunit_name}", __DOCTEST_ANCHOR - {line}, $left, $right
+                "{kunit_name}", $left, $right
             );
         }}}}
     }}
@@ -219,7 +227,7 @@ macro_rules! assert_eq {{
 
     /// The anchor where the test code body starts.
     #[allow(unused)]
-    static __DOCTEST_ANCHOR: i32 = ::core::line!() as i32 + {body_offset} + 2;
+    static __DOCTEST_ANCHOR: u32 = ::core::line!() + {body_offset} + 2;
     {{
         #![allow(unreachable_pub, clippy::disallowed_names)]
         {body}

-- 
2.54.0


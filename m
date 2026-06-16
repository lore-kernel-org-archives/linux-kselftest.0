Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021110.outbound.protection.outlook.com [52.101.100.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9414E441027;
	Tue, 16 Jun 2026 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781623501; cv=fail; b=HlcbWwsyfvY1vt/ap64RtN06peJPZTBT6AhPbdzGSXKen/A2mNh1W0YSvtKJp8MSMn7U8rz/TIIZPTjv89zGeVr5upGYKba23VuOJh3+Vd92qzldu9nTFQvsyzbLJjwGbtCVGwjK3LtmKpo859gaDls2uDwy5E+d4FcR5oD5oFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781623501; c=relaxed/simple;
	bh=2wOsMrPBVbJf5kmVvjapCV0pHbqdCz8omftAJkBQv+s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UX/94vywY8FeaXxuCZpTB/sPnpqCma5G3Sk9k7Zc1AjSPoQODuIgzgxCOhS4BkLmUlFNwYArMQILSL44UNAbbqLaxCnBL0q08DnKerngerXmB1JkLb2ML8wdCZSHiihXrNuquypUSJNrnKxUFhEPGPXZ/gDW99bhLvUZCpzyQsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=C2xi6qM6; arc=fail smtp.client-ip=52.101.100.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="C2xi6qM6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEhU8VfIewUuvCpmrpH8ONRwz2hKIOfzA7r6LxJyW3Lvb/YHtwyYtAmCi/sTkocTmB7QeY37bzn8eVxAJysuvcaxjYhXYSX9q/VXftOIBsRr38VkLGi342HznONxlZhqwL8WRGvUZJQIGdRPGRkIgmrMYsFYv/8qKE7AcVxOM5sp2OTKX/XpP5vCOV0uByINIj8UHpJfViQE1ZmpZYRBco1ojvBPEifzv/kKg3PD0GrVz7W2PwzUrfVyRm2nGBdk1n5Lmeo3rixr6JyckDNMxOEDhfC/Vs96XCAmQVqfa5iMLEQZOT033GkjqDUoQJELvOt/oFdkNKDDonC1AkemMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELLxeIBaknb+40qY2sFf0+QlUZa611oyvyVir4kHb+Y=;
 b=gcYrwqVD8cFkIAft0kJ17RgLwt0b44J+4sL09jU6ytJX0eAa81vgSHrSNToHyVn5c5ihq7R/GqPL/o1LAP/f0XkcSVdHPqK3K7904qDQv0Z3XIwXvw/nu/MMmlyjGW371HmHGC3qfkgJGCcne5EcpyrO9cLdBC5KJLCxwwarSgERhaRYTXd1fBBvrl/aoJ4T3powHT8ChUeapcN/aUB4wMGg0DXb2hoP1UvYDiDjUfUDHYV3pvHxHDy0D82dkAomNln1X92C+hOzyQKXLCputvaDv9jbQkD9ISofrxva6aB9PuOupIrPqcAjHjoB8E8lVvKDMm66QaYgyIvWnbboeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELLxeIBaknb+40qY2sFf0+QlUZa611oyvyVir4kHb+Y=;
 b=C2xi6qM6ZgALgxw+NepzLcv/hQtdNmfaWURuocm34dSQ517JpkC2R0OVj3fKLuKJPlBRoK/gRpbvguy7eTtHqAXhObtA6zI8rkOH0OVPOBHV3qTndLQyE0fLA7dAgMrdRpZF0e8Loy+oDDXQIXqQSw/5qmCYXAVJtOmJtBEiW+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2878.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 15:24:53 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 15:24:53 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 16 Jun 2026 16:24:50 +0100
Subject: [PATCH 2/3] rust: kunit: use `line!()` inside `kunit_assert!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-kunit-v1-2-b191604a8d6b@garyguo.net>
References: <20260616-kunit-v1-0-b191604a8d6b@garyguo.net>
In-Reply-To: <20260616-kunit-v1-0-b191604a8d6b@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781623491; l=6458;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=2wOsMrPBVbJf5kmVvjapCV0pHbqdCz8omftAJkBQv+s=;
 b=/nnWcxkF3h7F0WxpHt9ov5zwFcRSjaBZJl5b+K1e4irHCDSDT2082Aik5gF8ar403x1nRfbb/
 Kev69FWB5e8DDccIXR1gPPhoHlNLGbSeEB7+3jfxQIqTKOy8Tzu6bOO
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0280.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2878:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c04910b-7fbd-4bf0-4685-08decbbb69f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|10070799003|921020|56012099006|5023799004|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 mgIIkl//8oT2fL1cPj75yEXgKIvVYMOMgoZIPyIjw1Y+I2Gm07e9i/2hxi68E2RVOWMtW5Gbaktwq36Wso9a1CICI4K4TT+pvTjrD5TLvE9ymraXal8cbKziDDy0lTiXRytQXQLmFUVwTxfagF0gLPbAzjmCL1DqmgmL3sAplPpwRFVdoxELG3gvVzB4ZzjYDo7xSZEDcqZsaHHY6AJtJuyRgTMC6ezovLe/e2gHkF1z6OtrVqpJmLCxdkM5qMhyTYExfkj8HjSz6GWvNUyGhWveJHHhTx0ljaSVV8UJdX3w5f6w/ml9fD2nJeOc2VwU29b9NFDaiThyuUwRysBBz+e07VZJ+p4jFGYUCzTKnD+KkLt74TmC3Yvc57AgG2M98JnYSdxmuyavxwgmopP9EucIi5Kx5O3mDmR+5fhURCa/5aneX7zzXluz9lwA9EvJIot5u4Smtrw/NqfxVhWh6OXSpsr6lY1o3H1Co+9ZfOk+mf7uavRIRlwPuWtOb+Jam8DQZIz4Lz7plQ2Zj1Z3TyD5X1BvmjZUT4+eo31BtKgQNwh/Qk2KAfzvAXqPz3szH/WLmeVUpPhWfE2y0ieEO2zW5ui3O4uWpvCogt0Gprvpg+SzgCKee4llA8EFYhnf8RnUHACvsVbgPraQkr6Uu8MLK8FTjqIZewrMiWPAmd10KC8Dw++mYJphChHxVRiw0MaYzAKCBMwtJNovQiIlkyiAltfodxNp3yAzd2IVLbg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(10070799003)(921020)(56012099006)(5023799004)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ODJkclVJSDEyUnU5ZkxQakR6VFVsaFNRQ3Z1K29TcTRGdFU4aFNGcDhTWEN3?=
 =?utf-8?B?ZVYzM1B5R001ME9jNlRJaWxmN1JWUlcrclB2MUJyRm9ucTNaWnBWcEJ2NWF4?=
 =?utf-8?B?eWkxVjNTVnh0c2FJNjF0T3VkVWxaQVVXYkQxTGEwUy90NkJlZFJOa2M5MzRL?=
 =?utf-8?B?TUNUVWJiZHgrK1VUWHhUcjQzZWpwck03MVhsWjMrMHVzWHNjN29ORmk2OUxF?=
 =?utf-8?B?SXZyd1oraU9MSThvVEJmRDRIcVpLcm16emdiL3FPVGpLcS9EaUUzbDB6Wmhh?=
 =?utf-8?B?Y3hzRFVha2ZCOWtFNkpsUXFBbkQ3UStGRGxjUjR6K08rNDYwMWRZNWVMQVdE?=
 =?utf-8?B?T3ZqbjBhQWZmblJ5QlNiK0krQTRGaUcrYTRMTFpnaVZDNzNqeHBxck1OR2l5?=
 =?utf-8?B?aWZyR2djSkM1QjBDTUVRSFZLdTRSZXFHSE1hai9CYWNqS3QvN3hoNUMvdDFv?=
 =?utf-8?B?TEtwdkFIaFFFTERKUzh2a2grc0Vycm1jR1laOVpVc25Hc1ZRbW9pZjFZcGk3?=
 =?utf-8?B?MzhBQjI4KzhhTUZLZEVlODdPdVBsRitwVlB3Mzg2eWlISjA5YjdpTFBvdzN5?=
 =?utf-8?B?MUh6SmNUaFVUZDdXemdLa0l0ak1lSk1lRGpRWW9ON2pKTmMxS0ZjOGhYYTNW?=
 =?utf-8?B?TmV4eDJ1VGR2N0lUWFF6RHVqM0VBSXBVMFhnWmZERnphd0NESXZhVEhtOWlF?=
 =?utf-8?B?bTQxUzFJSDBudzJmWDV6d2U0NkEzRllVUVRXMVBzVmhiMVV5S2JGWEp2ZlJZ?=
 =?utf-8?B?Wm1Kb3JZWm5yZGVXMFd5bUtRcFpuN053ZUxRcTVkbUFsWVFjSm82anRWNFRy?=
 =?utf-8?B?d1A4RmZwM2UzekVickoyOHFuQXYzeE5TL3RxVTVsU0FNNC8zZW9FWUttV2Fw?=
 =?utf-8?B?dmR6aENLaEJKaVE5QURiQkl0OTlWRmM5WnNsQVBlMnh6MmZ2bzZhRDZzclh6?=
 =?utf-8?B?cjZsT3FBck05RVlsNlFld00zVEsyREJkbWlkTzZRWVdpT3NjbW9HbUorSWNH?=
 =?utf-8?B?U3VUa1MxWDdWSDdHbDM2T0Q2bVZaSmRKUXdQRldjUnZOTXR4L01zbTRNTy9W?=
 =?utf-8?B?TEJNcnJqVjhLN3pRYW0vdkRaclBnMDZZWXpCRkpYT25DNkNwSUpWOUZmL29S?=
 =?utf-8?B?SnY4VmRmdzFFSGdIbGVTWEVHVFQ3T2dNYnQ1YjV3SzN0d0NZQVE1RHR4V3l6?=
 =?utf-8?B?ZnNJZmNQVXl5V3p3bWNpanpOdkllMEE0cm54M2xNeTV2L2JwclI1dXNhNGlV?=
 =?utf-8?B?OUlDdXZ6STUwNzVCa3pnV2g0MEpxQnlOdUN4a1lxNG9EaXhYT1VobEh3NzNT?=
 =?utf-8?B?M2xSbHQwb1RJV29IYmJkYlRBVFdubEFoUDRwUmhOUHZMU1NLQm9zS2VyS2Y2?=
 =?utf-8?B?bHNrYmlBMlF1SXc5RVZLcnVGU2RTQkhFZ1F4cU5GK3c4M21ncllNR3RyUzF2?=
 =?utf-8?B?Ulpnc3VqVnpwMDN6MEMxWjlkTXIzK2FOOTNMbDAwenNOSkVNY0hlMHhiMHpj?=
 =?utf-8?B?amJWZ29BMVY5NEZBeHhlTDJuZmI0cVd3TE5hcURoeVpTRU43MlZublJXYkli?=
 =?utf-8?B?ZlluM2IrTk5kT0tORE16S0QrQmZjNWpUV2RWaEgxcG1kb2QySjREQlRnbDYr?=
 =?utf-8?B?WWM5YmxwNFUwZjZqMHdWNmVuNFpqdjlneElnenU5TVk4alYxaGFLY2IwWFhr?=
 =?utf-8?B?UkNJWUdjZ1V5di82S3Q5dUtCM2hDRzNWQ2xPL0xtdzd3M3h3RWxXZzBvSHFy?=
 =?utf-8?B?OFQ2K0htWXVTWU9mTzBQbEZFcTRtWm9Nb0pleHdrNk5aNHBqektuUS83YW9q?=
 =?utf-8?B?TkZKcW12b3lJbHgyL3IzK0NicXRZcGtjaHd5ZkR0djBmMUdTR1FJbUdvcFVX?=
 =?utf-8?B?aysxQUY3Z2pYV1hCalFkL3NQeitqN3E1RThCUUM2M2ZLVjd5M2pTUmNzc3F3?=
 =?utf-8?B?UUJqZ0EzL0hvbDVNcTUyaSttSlVDRTFKNzE5aC9qTmhMMFdMY05rWG8vL0Zn?=
 =?utf-8?B?YjlIelBWQkZpTFVHMmdRVW1CYTk3aTdNTkNiY1o1NlEvV2JCU3l1SkFudXNs?=
 =?utf-8?B?WUI1WXNlajlSUWtpSmYxOE0zRUQrM1ZkVDludkpFWUg4dm0wbmN4bjhQTito?=
 =?utf-8?B?NTJwYnJJYW9STnRJeXVsa0ViYVlpYWNjYlhXUVgxNlRrTFZ0MHQzYWZmMWsx?=
 =?utf-8?B?VjF1SjFPd2tBSk9XdHVpT2hCc3NlYUZvWnBsWGs0NmtQa3YyeTVqUmU3TVpM?=
 =?utf-8?B?eU43Y0NBOGtHbnZGTXFNelNxL3ByTGhlM3FVNUgxYzFybDhpdU1qeGp5SlVq?=
 =?utf-8?B?S0hGNk1aaXpOZTgvSTFHR3FFVG0zN1BBSnNkSmw0bEJRVVBRalQ2dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c04910b-7fbd-4bf0-4685-08decbbb69f2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 15:24:53.0634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dTUlnGmPN89xFjlb/6GAN6XwOCj0S2tU921mTLKzAMCQ/a0lXjxz0TdXKU7QwEON5j39KdlrJ/k/OWYcfrLmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2878

The `diff` parameter is needed currently because doctests want to override
the line number. Simplify it by changing it to use `line!()`. Have doctests
override `line!()` macro to achieve the current behavior.

A few current doctests (or their invoked macros) require `line!()` to
expand to literal; they're updated to use `::core::line!()` instead.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/device_id.rs    |  2 +-
 rust/kernel/kunit.rs        |  8 ++++----
 rust/kernel/str.rs          |  2 +-
 rust/macros/kunit.rs        |  4 ++--
 scripts/rustdoc_test_gen.rs | 16 ++++++++++++----
 5 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index 8e9721446014..20e2fe137202 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -195,7 +195,7 @@ macro_rules! module_device_table {
     ($table_type: literal, $module_table_name:ident, $table_name:ident) => {
         #[rustfmt::skip]
         #[export_name =
-            concat!("__mod_device_table__", line!(),
+            concat!("__mod_device_table__", ::core::line!(),
                     "__kmod_", module_path!(),
                     "__", $table_type,
                     "__", stringify!($table_name))
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 157fd0634708..58dfec66b4f6 100644
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
index 37f4877f52e2..acc4debe8592 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -169,18 +169,26 @@ fn main() {
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
@@ -190,7 +198,7 @@ macro_rules! assert {{
     macro_rules! assert_eq {{
         ($left:expr, $right:expr $(,)?) => {{{{
             ::kernel::kunit_assert_eq!(
-                "{kunit_name}", __DOCTEST_ANCHOR - {line}, $left, $right
+                "{kunit_name}", $left, $right
             );
         }}}}
     }}
@@ -212,7 +220,7 @@ macro_rules! assert_eq {{
 
     /// The anchor where the test code body starts.
     #[allow(unused)]
-    static __DOCTEST_ANCHOR: i32 = ::core::line!() as i32 + {body_offset} + 2;
+    static __DOCTEST_ANCHOR: u32 = ::core::line!() + {body_offset} + 2;
     {{
         #![allow(unreachable_pub, clippy::disallowed_names)]
         {body}

-- 
2.54.0


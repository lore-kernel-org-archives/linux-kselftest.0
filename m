Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021110.outbound.protection.outlook.com [52.101.100.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657FB4418D7;
	Tue, 16 Jun 2026 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781623502; cv=fail; b=sDI4wy6Ki3diKPanv/mHP4LKXPIjYhCva4tln/4V4VKwzoFmGeycmgYL+kViqrrWYcESu4qlkDAtVpNd27wb0HAcQpWgoRWpTWPDDcRznBp2NKCz1cRxZG3oimy9sA/Oq7j4IgLj/xGg7vMY/JmSf7AX1V0SKyL8a6bl2ZLMpeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781623502; c=relaxed/simple;
	bh=fOKF66hkC7dPGQr9prIUflTkDI6yNvAOwIAL/mCKPjA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m90C/72IaQWFDA7R0NAMfyg+Ir25TFio6YdA7G+uvRX8UFJ5gWEySjoZEOWh4DQuDUJslrlVNfvkVEipK1XuEDdgwkeiG7atl7x5cIYmbXgQT4KR5nOjh/p7p4d4uvUN//mwiy+QCuV5cVfUBMBJAdBN5lkBoGB2e48oP5EoZNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=bgl2GOxg; arc=fail smtp.client-ip=52.101.100.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="bgl2GOxg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J28yVR3ll6w94gkn6ORDamwRqXO7nNlw8B2rsdUtCPASQMyDrtDDTpd/d7aZME/Qp6NR9gwLxh1gd4TjNMrmCbmu4NuHPLM7LTQ6mAprgf4eSY3ozzvDJN6gHrbjUh1I4OKCXPZvFnkY7kZotQ58B0Cs/rt9rEFtJFp4FCXfdZtS7uO9wDTqm/U/lACtpPeX+QBTBMcOApMVzbHKLl2gky2FRA8oCgKhWbQm7UiQgoHH5Spaa/rwKdz5LTAQYknEawDjgE7Jv2FYwgQJBO4jYCvKijaSE0CuGcSFsC3/WzU4JMYmzgrd9fptNqU8YdLKW3779SPdV9/vTwVInCD6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrWiom7sntD8aRjQVEyi+djUUeTd1CamYfJer6/YzDI=;
 b=hR/DEjTXuHeUOUsJ7I6MGoGID/GAs16H0R8ZwkKSwwjee/T1JXiVEez8aAPrbSwmmtu6BoCiGJXf4ENiHInDCJkTdRYdOpXxQrqeMoOO1L/r7CaFZSsQfzFQ1LXODqrUPA7TzDLN9CYjKSLUS8bFbWEJkxjD9t6uSe059A0HDepNVy8MmL7ZuEolx4KRCj91c0u6V9w/jk5943ue2xnVvuxdGliflXSlHG/ir6Xcj6kc+TA8mt7a1iZt4WlMxitVNGwXkrEsCbTL3Z60tb0QlH/w0dPrAW5LJEem7rPLLzbhvg+07ApyAqmwNCKa5AxFPcE7At5zyA+Fi63saY+jDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrWiom7sntD8aRjQVEyi+djUUeTd1CamYfJer6/YzDI=;
 b=bgl2GOxguOhNA51J2Iz37Mmi/rxFO7YpYgZiaA7tQrbkK5a0lgUGDddABAYhKsXmu0sakglGfQUqqccC9ZCcdjacAqXjERHwg/1bqdYJ6NXMSHP7rUaJuvcKgDTFq+43RkyoCJOg6atbPKURIdxvgI6jV0N4ePtOiHvlZL/N5N0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2878.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 15:24:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 15:24:53 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 16 Jun 2026 16:24:51 +0100
Subject: [PATCH 3/3] rust: doctest: generate Rust kunit test suites
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-kunit-v1-3-b191604a8d6b@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781623491; l=4697;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=fOKF66hkC7dPGQr9prIUflTkDI6yNvAOwIAL/mCKPjA=;
 b=DP/LNbG0BumPiaKjIERN3K55yvC+SnyzuTkH9bf5byWLYrY/j9QrnjZ1ARH76i4r0kgjLEd0d
 NMb5xnqo7UFBtToiFW5sQrpkHWn9uE7aVkxGCaOeOyiNv6Lz1/ksmPG
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
X-MS-Office365-Filtering-Correlation-Id: 91312b4e-615d-41b2-e6ef-08decbbb6a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|10070799003|921020|56012099006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 zIuJOIRYOtjWxu7C1ZzQzQwh03Lrh3vynzYa8RChYNQKa5VsZfdBJHUniyPZirFgmchXaTKiDQ4pZBbVzeGOxARyGOS08QKNOJ49Wi80UYyKSRVta+/y/iYjJfaTZiyGwmMRP1dEUy2z5jYaT8j/T9si6xW8Xhv3yajhSNxOvjoab5a8V3m8VoBOLREg//4/WINSCwOTXSESComc8fFOdPE3UQfXiWolM9e73y4zISZurD2Hu630/KPnhi8tksEXiRyXB+IHLrYVL181aEQE8r/CZGqE3DUreLlJLOGEKXQ6tCT07wqKLLvWeYfnyxCt80+U5ueCXnV4LaHzl+nzUQGi5K9/uBtG2zPTi8oOZJQ3NwWGvb7n86CiJ9C572bJzgug28kvOoEI06Eng4twAP5H3XM27v3SFgflLkDnJodLCvZ3V34w+tY9mC63OpQM7dH3ufsk/wwlV7fC69cse2E5OBD7fREoX9kKPJghH2XjDwv28Alz2whS0IIk+3JPaRmudVzUa8p2VM2fTG3lPQV6vXmJhmYPgdhjBPE3jvVJbS4XtJDHBJQN+Ws79GojJyJstk+P2WLPlRCnFBLbHuRaVoLQUiEgHL07fHncAdnLJIXeDJyXhxJ/OX3C+tPvV9i5O0uCZAsqKabyCXJPYJh5zmuujZs8kkLGgkbbmgTn9rtf1ms/qtmiHqE1pcXHEBIZA5D7cg2fqdn/kfWpjnbB0VvIn07S3mWwPLkBJHc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(10070799003)(921020)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZXJ0UW9hb2FtVkk0TEFmOTY5UnRPOFlkRVBrSkN2UURxVmVQT094cmxyUDVz?=
 =?utf-8?B?ZDllWTFJQlZvd3JoUXlveU5sdE91MVUxajFNWTVEZmVOdUNsNmVDWFE2Q2cr?=
 =?utf-8?B?Y0ZEWGhRdW53OHNidjl6cGdOcWplZnFPMVdkZjJHemlBRlRsT0tGS1NCa2JV?=
 =?utf-8?B?cmNxNkRtaHlIQ1Y4TWgxcDJGMEcyWU1yR2NqRWpxbVpNU0gzYW56U3RHZ202?=
 =?utf-8?B?TXQwTXZZeVViZTB1Z0hVcXpvZEFOelZzaS9xeGZBZ2o5ckdxeFNkbUhKZEx5?=
 =?utf-8?B?eHloT0lndDNneFFDRE01SDF4R016alVCWU05VmpLRDhUVnAxMHcraHlibU5R?=
 =?utf-8?B?ZzVDR3VnRDRRSFFvcjN2NWtZeTloRWZuVmFINHBrL0l5MzNVUlIyV3J1TjNp?=
 =?utf-8?B?em1zcnhQNGgxMXh1UnM4NHMrTGQ2WFlSNDZCK0ZRaTZIS1pFRW14QlJ5b1E5?=
 =?utf-8?B?L2hMVGh3RzFlTWEySnlTclZrMU4wV0lpeU11eUxrRzlRWXV2Rm1LRk53OWl4?=
 =?utf-8?B?VzJoUS93MVNqTVo2MnFRSUpDd0FmUHdScjFKbFV2WEN2ck56czdVRDJiSXhG?=
 =?utf-8?B?UktXRTdmL2Jjblk5d3hiZnlFZXRBWXQ5T2p5MThxMkJFSWQzK2VqcVJqeGpM?=
 =?utf-8?B?NU0vVEpPU3lXVlVOUVF1VVlPNXd2WHg1bFpPczRnOU9BblYySDNrM29iS0sx?=
 =?utf-8?B?UHRoNVJSbjMrOHplUnJSNElJbVdpSjZqRGVLeUQyWUhIZXIxU2h4YzBiVC9P?=
 =?utf-8?B?djUxTUMrTGY0a3F0bmVXT24xdGpXQnB1SUdCbGN0bk95aEF5MUFaWW5EWUNh?=
 =?utf-8?B?YTQ1bDNwRmxJaVZTRTJrU1RQb29zWXpkQURhdVZQUGNrdjYxWlFXWk1Lck0w?=
 =?utf-8?B?Zkw5Yk5QNkorb3pNYnJ3TWV4a2FuYmZWSllkbFZxZFNrT2NxbUFMeWVEd0Rk?=
 =?utf-8?B?MGhzMmNMY0Y5QlVKSlNBdFgydzlwTVFjYXpaUDFmUGcwZ2dGOXUzclI4Vyt4?=
 =?utf-8?B?TUFVZExaS0wrVlNidDlXcW9VMjJSaTJCSUJ5MXpTOWMwRUtXbGx2UUdnTDBs?=
 =?utf-8?B?aTIxaWdBSE93eFdzZXJ3M3RIQ0ZHZVdNQzI0V0NVQkdjR2JoMTJPenIzSlBG?=
 =?utf-8?B?bnp5RkNrS2srMVFuRjFZRlB2WGl1eTRUTEsydk92S0ZrcG44UDllTVRDclBI?=
 =?utf-8?B?VnI2d1U3dStXc2xUN3E3SmVKSnNnZ21DenFlcHlOV2ljOTkvcEl3c3dmMERs?=
 =?utf-8?B?NDJqaXVlZG53Z2VEMFNYTnBPUVlOaXM4aElBQmRIU2VpMWM2RzF1UDJ3RldI?=
 =?utf-8?B?SjYvLzhZTDNtTWlEdjlXMDZNd2U1TG5nSmdLdHJYVHpvcm51OVppUUFuWjBZ?=
 =?utf-8?B?TlBhS2psSVk0ZGtKRDRVa1BUSmRkdHlWbzNKL1Q2QlFzdkZtTU5Sejl5YXhh?=
 =?utf-8?B?V1VQMnQ5TUhvdEpnMnhYNWJCblFWSHZ1NUdkWHc0ajN0WWRQZThzKzNBTFVM?=
 =?utf-8?B?R3habUpXZ2llMGFDT1VtWVJBMkxDbndac0tRbE4wdWFiVk4vS1ZsLzhTbUNU?=
 =?utf-8?B?SU9QU3Z5TnBQV2lHVzNydjBpdU1DazBaSitmdFdqNUY5MEJJS1drSkdZNkJk?=
 =?utf-8?B?cVpONWlwdyswMHFvVE1CdHg2bk5yZ29qZlNhMjNuQVUybm0xUWxjNDdaNHhE?=
 =?utf-8?B?QkdaSER1OUhkMUEzdXlIODM0MUhQdE0zZmZRZlBSMGpFS243YTkrcFBYZ2JQ?=
 =?utf-8?B?SGhxOWg1Skl2bjFyTWtndjhibFBDdjd4eTJzTEcvNXcrQWs5S1pObDVObkEw?=
 =?utf-8?B?Z3V6K0ZaaEpZSnU1U3VxQTVqSGRsak42TVVIQmw1ZGVWTWNUSEdVdUJtZVIv?=
 =?utf-8?B?RlUraEZWM2xwVzFPRTFiVWlob01WWEtZaFlLU2Rhb1I0dmhzNkpHRWp1cHdB?=
 =?utf-8?B?WnFTdE93Y1VhU21QZjJ1a1l5THdiMTBwRDdsYVdlcHVMOEJSdDZjbGtPTktZ?=
 =?utf-8?B?VEtoc3MycGErbklIVjJRTGJlZzkxZDkvK3Zaa3EyNG85Qko4NVFOekplajVx?=
 =?utf-8?B?MHB3MFh2Q0J5MTBTcUhqR1dtbDVraUlJalkxS0dRb1ZhdkxhVGRhM0VPM0NK?=
 =?utf-8?B?Qy9GUUNwRDVZWENsaXZuUWVWR2xYMXhnVFZzdmh4WklnUlVTRFBwaWNEWkdm?=
 =?utf-8?B?RExmam9UT2JqQ0pLMFo3OGlxNU1IV0RSY2kyNEo3Z2txTWdLSEcreUxQRGoz?=
 =?utf-8?B?d1NRL0JMZjlNMWlURFI1UEg0LzJuVitCazRuZ05TaWtuR3pKakVUalZhdkdn?=
 =?utf-8?B?YWNjWkdFWXJxU2thdHBiK1lINGc4WW9iSWZzVVFQLy85Rm4rZkM3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 91312b4e-615d-41b2-e6ef-08decbbb6a28
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 15:24:53.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEGpKX8dq133WCHeZg8jGd7cjOnKPopeGBtIm3eMdnRXciiCZPiWvu418QeN1q3C8khgN8wKix3mE2CQhWWQBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2878

For doctest, instead of generating C FFI functions, generate a Rust test
suite with `#[kunit_tests]` and `#[test]` attributes. This makes the C glue
no longer needed.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/Makefile               |  4 +--
 scripts/rustdoc_test_gen.rs | 69 ++++++---------------------------------------
 2 files changed, 10 insertions(+), 63 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index a870d1616c71..8c95dd4f6aee 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -36,10 +36,8 @@ obj-$(CONFIG_RUST) += exports.o
 always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
 
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
-always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
 
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
-obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
 ifndef CONFIG_UML
@@ -387,7 +385,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 		$< $(rustdoc_test_kernel_quiet); \
 	$(objtree)/scripts/rustdoc_test_gen
 
-%/doctests_kernel_generated.rs %/doctests_kernel_generated_kunit.c: \
+%/doctests_kernel_generated.rs: \
     $(src)/kernel/lib.rs $(obj)/kernel.o \
     $(objtree)/scripts/rustdoc_test_builder \
     $(objtree)/scripts/rustdoc_test_gen FORCE
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index acc4debe8592..601f7a5b3672 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -118,9 +118,7 @@ fn main() {
     // Sort paths.
     paths.sort();
 
-    let mut rust_tests = String::new();
-    let mut c_test_declarations = String::new();
-    let mut c_test_cases = String::new();
+    let mut tests = String::new();
     let mut body = String::new();
     let mut last_file = String::new();
     let mut number = 0;
@@ -165,10 +163,10 @@ fn main() {
 
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
@@ -183,26 +181,6 @@ macro_rules! line {{
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
@@ -231,14 +209,9 @@ macro_rules! assert_eq {{
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
@@ -246,34 +219,10 @@ macro_rules! assert_eq {{
 
 const __LOG_PREFIX: &[u8] = b"rust_doctests_kernel\0";
 
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


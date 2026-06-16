Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021110.outbound.protection.outlook.com [52.101.100.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B41643E490;
	Tue, 16 Jun 2026 15:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781623499; cv=fail; b=nx4wTdnP/JGOk+pgtn6YdXoRQvuOVJ50r/UAxT2CzpC/JQyYiJmmivyzjbAVVD4WcyfrgndL48dGRZKb9/E+kbEPMzXoxEtn+hKAc6O4VhcHJpzfK8CZJFvPnbkO46gHdR8dadfG7OT6AJJtKeJ041hBFQK7Xl9Is6rjlch6XcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781623499; c=relaxed/simple;
	bh=KnRuQQbY3AW7maQTdzu1Wba1F4E4JWxYvyi2UWUnErY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JoutaonlbrGNlQ3DC8unKpIMdeRUi6xWvoxHBhrUX0m7fC6XI6zWjhH3tqOEPJ8M8XJcFpRyOq3cfHIi/70FJPsEk1Mskd/JmJZM6cK6lrXYLDm/KGuaiJnzKELDufLeDWPzsYouPgwPCI8I7YzMwdP39J8wDoxWXb+paudzK48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CiwDnDbx; arc=fail smtp.client-ip=52.101.100.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CiwDnDbx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGUfa2U55Wh2ZWjipa+LZdFNrfyU0Ei65Uth56Bkj8CZSh9PaRM7hmfQU4J2kS5TQEoafqT3Vg72I1T1ckmoQGJSlZTCtSMKkiphALJwo6csrg5HsbHAVllmHS4y0FL7lpMewDBjm3qYLmOWS5suSQEMyXuW/CEMqUdAFWhxaIECE8p+h4xVNSJofhNNADM5ppmKe2D8auwKf3taBIEdVloK+Ygg6EsZhV8In8IpIXlRO5DLwRlvUhT3F+yxHLWVe5zymP1VLdwGXvQcLRkFEvTWorb47Lp7Ih1sdlMu5IdlQWo41gaio+UNJ81/7YMQZNekvEqfOIj8ynHGPT75Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rIFLv0eaHo9fEz2pYDBKWADOI97ERcdWYDY5F+XF3c=;
 b=kkbPGPIZ+KrN+/vNQj9dLRYZK4n2wZAf/nE+4h9qsynL/xRbbFucsqex55HWLDpkfAK4jM0Xa/104jwq84jl5nFSeeS6jf583RPXGeTB4CHB2W5MVu4F+ujadrrS6HmII+t02VMxM91JItJ8t2JVfWpKkYqTKeIj2nxF3RHe8PQnKq6uzi5EqP5eFe0MWjOx6aAovVixvoIoMstwYNXgaz8y2eWBeIj0LufBARtZGeY+XuTWk5vCXLfCwqKh75O6eghaYfX9jPXLLhbVkdv3VDX+vpVpf0BQgN3la9rEP7HoihAFJ9GZrSIlI+uQj+2SLiKX7sOiH/+LYU3mS8nJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rIFLv0eaHo9fEz2pYDBKWADOI97ERcdWYDY5F+XF3c=;
 b=CiwDnDbxl98Pypa7Xuey7BGVx3mT0DVoSiOZxTyD1I+8GtBdwxyO7rAK7NBggqTct4gz8zoktObdxNHRyiNSOZO5rBaQ5OKG8t/lnFehwbqNCXZh227aNTw87ExjCqC5KhhgcPpxqootY/QkfIQYTAfvvADWbWXFekf3Esej6Y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2878.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 15:24:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 15:24:52 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 16 Jun 2026 16:24:49 +0100
Subject: [PATCH 1/3] rust: kunit: use `file!()` inside `kunit_assert!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-kunit-v1-1-b191604a8d6b@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781623491; l=7284;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=KnRuQQbY3AW7maQTdzu1Wba1F4E4JWxYvyi2UWUnErY=;
 b=ctummxz+5wXEPNy3pLqLs5vXZii5L3+1guns2fAKKjRdA6WdURWpOEmqP/PRSSSCLOW9xiaE4
 u8h9IYY0OE1BzVmjzqlJ3yUDpnFra8rwKONT4C5HO28ot4A0CbAgbel
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
X-MS-Office365-Filtering-Correlation-Id: fb85f796-72f6-4865-12d3-08decbbb69b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|10070799003|921020|56012099006|5023799004|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 7DCQn+n3oK6VmVJ+sBFgaqUdTC/bnKEldI9uD5TGX7iSGNoNyC4aObSa7Jj+7cKyXIb14nlqPFMvTb596cdy3t6+nIrU7ZwZz+hMTZ7Z1Tnf3oLrS/pCAkeB9UsDA7FLEjbTmKWQeyGTAACq8AqHiUbUk9bhNKS+sWIoL78hDaU0rjhUVjghdFzxMwNLui+Y0Ca/zvQm+K6pCpR1pJ5MhY3Ou71LJ5mgOZORCtSBkH7UUJ0gunTuhbgnRBiCHsd7EtNeqmbC+kazPI52AQrPjyycxbmW/aKMq5Othi92RXsTsEgvK8f84QDhk7FgfKnwmorBmiHrbeqi9sJx+OHv0VGboZL2ZSSay/rRLN3riKosNcfKiGc5rAHHBXogkcuWHANmsdssYlBYjyp/DCGb695jIgULSpKMVByGogwKJdJHzfa3JmytEVyBPV4doP6dPOdO3UTAij5qovoo8wBKIIHwUfRO2H6saywbO2NBbv/1D1j2PX9I5tmGMO9dhZ42dnPWq4JyZT7yMhkjVI53vZOxC05Feq8+fJKw8gE1DA6ikNYD9IB37tg5XWL5l5jNZVOF2aQYfhweVVW2cNATEt8uvqAu+I+fJOlWmUz4LPu7Hbqf+mbQRrDQd2zoypi1lY6FGLzYEaf74aAPRXediBHAcuQY+kPxfW2pLbGslwQqDq7iVk/bcIOaKaXgZ3emXwj289fbSms2IFWpn0B48E0NJX84Z1lEudddO9pZVYnPdcVwXMpuXcJZEYAhF8eY
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(10070799003)(921020)(56012099006)(5023799004)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SUc3cElESjRkM0FrUlhUc2pMR0tLQlkrZEJjMSt6SXZFMm5lN3kxMmRVbUhX?=
 =?utf-8?B?TThTdmN6a3VZbkNPQ1E5eHRmTmdZa2ZtenE4M2VlVUJFcjVYOHczT0RrOGxJ?=
 =?utf-8?B?Q0Y0T2FORExCbTdmN2ZhY0pVOVBZR215NzhkRkhnTEdSYkxQTEZUZkozYkRk?=
 =?utf-8?B?cmpKMFozTTllUFQ3RVh4TGVxb2xMN3F6TW8xMkEvdFAwS2VEbWs5dWJjZEhF?=
 =?utf-8?B?dTMwbGV4NjdZWkhlYmlQM2xoTHBFa2pFZDRtekdnRDBaVFZyUEJVd1dNTmQx?=
 =?utf-8?B?d3N0OFkrbjVJak1oMWJ4SEZpOUswYVN6ZkNqWHhlcUxXM1VQZGdZY3U5Nk1D?=
 =?utf-8?B?T092T2pXYUlta2pxcjc3dXJxd0x0WjNubXRSUzRHT0x3UWZxbUdFaGpTemlk?=
 =?utf-8?B?b2JMTDB1NDBnNGZvU0FWQWdCOVV5enZTaXFsb0x5TUsybnY5cEJtMHp6ZlN3?=
 =?utf-8?B?Rk40VVUrd05JTkZiRUJTQnVYRlhjT2ZhZUlhSmx4WFdncWdOTFUvVEJDUU5v?=
 =?utf-8?B?MjlYZzJ3bWxhZENUK1NRM29KRWJjZnZtcG5YNEdSZHRCdm5PL1VwUWR6cU9X?=
 =?utf-8?B?MTNxUDdscUlkM0M5bzFwbXNwMURpRm5PeHZEVVRHelRCc1RQNFF6STZYMVJG?=
 =?utf-8?B?dGduQzFJZ2ltUlZ0a2Y0SjdXWFF0NEY1enlqY0pDWjA5cU4zTHVJektZbzFw?=
 =?utf-8?B?dzN0WXRLcUNvUkRxbldjN0p0U2RqR0dEcm9WRUg0NFc1RUtpbXdpYzdEZ1Ir?=
 =?utf-8?B?RC85NEpkZU1POHArYmdmSDMwZVE2bW9SNDNEU016TjRUUCtHOWQ1MUZaQVhW?=
 =?utf-8?B?b2pXMHBlZXZWQ1k5SG16ZEsyZ0RkbWNrbzM3eG9wZ0VDYkxpNGJKUnB3c041?=
 =?utf-8?B?eFJWL2ZvVlhPV0NoQWllQVlTckk1WlhHRHBGVllrN0hubWlPek1Scm1lRDB5?=
 =?utf-8?B?bnY1Y1hGam5vdHF1U0M2M0lFNmhEd1dYT3FWaEp2Q2svcFhUaU9LcklvQk5C?=
 =?utf-8?B?ZldvcVBoU0M3UWE4MHR1QXppOFRRTGs3Rm9jVlM4SGhscmZSME15ZkZtaHYv?=
 =?utf-8?B?QWRjY0tGSEV0RmlRM1g4WlhjZkgwb3h1REN6cXdvZWRlR0tXWUgrd2Y5eDkr?=
 =?utf-8?B?RzMzODF4N1U3ODE1Nk5TMFovMlhPS3RFT081cE84elZMaS9WNDc0STh0V2dY?=
 =?utf-8?B?N2R5V0ZaaXdGbXAzWDB4clpuVEhGY0ZsMFllOEs2THpjbXhyNGdPVUFiZklU?=
 =?utf-8?B?eno0ei9ZQVhLTjFrTUZxOTJZSTUrN082cnF4MldndWRyWG13MStjV1hwRy8x?=
 =?utf-8?B?QXV2bnJnbkZ4UEJPekpQV3VoSkNSYmFDMWZnNkNSTTd5OWNjOFFXaVRVb2tr?=
 =?utf-8?B?dFFvNEFHV2x4N0RWTE5lZWR5dUdIS29BUU1oSkwwMDhNZXlIblRTbUZvOXFp?=
 =?utf-8?B?S3dvQi9wSFU2Mm1XSkVzd2s5UVE5VzJHQUN3OGN4cVlORENJd2xSdlM4VXdN?=
 =?utf-8?B?UkNtdDgvRjdiemNGaWFqUlFnOVhnSUU4OUdLRU1JZEVGelFuVkFHM3JOWjA5?=
 =?utf-8?B?bHNJb0pDNXRjNUVmYzRpUW4vSGl3eEt5V3JmV3Q5WjllSHN6T1I3OURLYmds?=
 =?utf-8?B?L205SkdUblZkU0FwYUlFY0tCbG5TZlhtMUIxSW45bnJtVDI4VEVuaCtCdFhv?=
 =?utf-8?B?d3dKOWhaOEhmRSswVFRrd1RRR2d0YTNaYWkrazVDZUVtMk93N0VBSEluME93?=
 =?utf-8?B?U1ZDcHQyVmxHVWs1akE5ZFluZllBcVlnUExLTmxlTE5ZR3AvbWJRdEQ2UUM3?=
 =?utf-8?B?a3JPOHhNTXdLS2lBZjdsWTRqOXFoZXd3ZlZQRUdXdFRhRzJ4Tk43eWc1U2t3?=
 =?utf-8?B?cVc2SVZIQ3F0L1N0UzNLQjQ2RHVFYS8xTzVGRDhlamFyR0o0NFJQT2JDOEN5?=
 =?utf-8?B?bzROVmpaOEg3ZVpLS3dReTJWNXJUYWFLdWxYUUZRbGpYallqMFhMOWJhSlAv?=
 =?utf-8?B?UGhydTIvV2FoSFl2QWJvRDIvV21SYVhvejdjNXlwZHp4ajk4amFpb2VLMm9X?=
 =?utf-8?B?c2c3NENEdnczdCtkZHV6NGFPaXBZTE1uL1JGZlo2bTM1Q29BaDZXakhlSk0x?=
 =?utf-8?B?S2k3anY5enk5VE9oNEM0MnRzbjZ2TnBuMVgzZXhsZGVUcUNHcE9VbmhUZ1hE?=
 =?utf-8?B?ZkxTVklTbEQ0R2g2WXl6WWMvL1FPSTlMQmkwZWgzRmZPVDY4RjlzaWw1c0kx?=
 =?utf-8?B?VFBvNHJzSGlpNVhGM3ZWQVdwNS9kMlJuMjJ6bDJVc2NLa2daMFc2a01pSVZB?=
 =?utf-8?B?RWNyQ2hDWXgyQkRKcW9Bb2swY0tDTzBwTXRPajM2S2Y2ZEx3MXJTZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fb85f796-72f6-4865-12d3-08decbbb69b6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 15:24:52.6911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZpqF1W+w+R99z2Y1HdEH0fHFODDJjbQMuS+qUmMf8i22NpWIaZLNdjNSvWc1cGg1jH41bXiXneaPcEnqRZHAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2878

This parameter is needed currently because doctests want to override the
file. Simplify it by changing it to use `file!()`. Have doctests override
`file!()` macro to achieve the current behavior.

This allows us to remove the `file` helper and associated Kconfig options.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 Documentation/rust/general-information.rst |  4 ++--
 init/Kconfig                               |  3 ---
 rust/kernel/kunit.rs                       |  9 +++++----
 rust/macros/helpers.rs                     | 16 ----------------
 rust/macros/kunit.rs                       |  5 ++---
 rust/macros/lib.rs                         |  5 -----
 scripts/rustdoc_test_gen.rs                | 10 ++++++++--
 7 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 09234bed272c..20e3178ebfd4 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -157,5 +157,5 @@ numerical comparisons, one may define a new Kconfig symbol:
 
 .. code-block:: kconfig
 
-	config RUSTC_HAS_SPAN_FILE
-		def_bool RUSTC_VERSION >= 108800
+	config RUSTC_HAS_FILE_AS_C_STR
+		def_bool RUSTC_VERSION >= 109100
diff --git a/init/Kconfig b/init/Kconfig
index 5230d4879b1c..e118fdb9df11 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -178,9 +178,6 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
-config RUSTC_HAS_SPAN_FILE
-	def_bool RUSTC_VERSION >= 108800
-
 config RUSTC_HAS_UNNECESSARY_TRANSMUTES
 	def_bool RUSTC_VERSION >= 108800
 
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index cdee5f27bd7f..157fd0634708 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -58,14 +58,15 @@ pub fn info(args: fmt::Arguments<'_>) {
 #[doc(hidden)]
 #[macro_export]
 macro_rules! kunit_assert {
-    ($name:literal, $file:literal, $diff:expr, $condition:expr $(,)?) => {
+    ($name:literal, $diff:expr, $condition:expr $(,)?) => {
         'out: {
             // Do nothing if the condition is `true`.
             if $condition {
                 break 'out;
             }
 
-            static FILE: &'static $crate::str::CStr = $file;
+            // Use `file!()` instead of `::core::file!()` here so it can be overridden.
+            static FILE: &'static $crate::str::CStr = $crate::c_str!(file!());
             static LINE: i32 = ::core::line!() as i32 - $diff;
             static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
 
@@ -164,10 +165,10 @@ unsafe impl Sync for UnaryAssert {}
 #[doc(hidden)]
 #[macro_export]
 macro_rules! kunit_assert_eq {
-    ($name:literal, $file:literal, $diff:expr, $left:expr, $right:expr $(,)?) => {{
+    ($name:literal, $diff:expr, $left:expr, $right:expr $(,)?) => {{
         // For the moment, we just forward to the expression assert because, for binary asserts,
         // KUnit supports only a few types (e.g. integers).
-        $crate::kunit_assert!($name, $file, $diff, $left == $right);
+        $crate::kunit_assert!($name, $diff, $left == $right);
     }};
 }
 
diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index d18fbf4daa0a..8cc9a20f470e 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -38,22 +38,6 @@ pub(crate) fn value(&self) -> String {
     }
 }
 
-pub(crate) fn file() -> String {
-    #[cfg(not(CONFIG_RUSTC_HAS_SPAN_FILE))]
-    {
-        proc_macro::Span::call_site()
-            .source_file()
-            .path()
-            .to_string_lossy()
-            .into_owned()
-    }
-
-    #[cfg(CONFIG_RUSTC_HAS_SPAN_FILE)]
-    {
-        proc_macro::Span::call_site().file()
-    }
-}
-
 /// Obtain all `#[cfg]` attributes.
 pub(crate) fn gather_cfg_attrs(attr: &[Attribute]) -> impl Iterator<Item = &Attribute> + '_ {
     attr.iter().filter(|a| a.path().is_ident("cfg"))
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index ae20ed6768f1..936eff014870 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -109,12 +109,11 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
         // Before the test, override usual `assert!` and `assert_eq!` macros with ones that call
         // KUnit instead.
         let test_str = test.to_string();
-        let path = CString::new(crate::helpers::file()).expect("file path cannot contain NUL");
         processed_items.push(parse_quote! {
             #[allow(unused)]
             macro_rules! assert {
                 ($cond:expr $(,)?) => {{
-                    kernel::kunit_assert!(#test_str, #path, 0, $cond);
+                    kernel::kunit_assert!(#test_str, 0, $cond);
                 }}
             }
         });
@@ -122,7 +121,7 @@ macro_rules! assert {
             #[allow(unused)]
             macro_rules! assert_eq {
                 ($left:expr, $right:expr $(,)?) => {{
-                    kernel::kunit_assert_eq!(#test_str, #path, 0, $left, $right);
+                    kernel::kunit_assert_eq!(#test_str, 0, $left, $right);
                 }}
             }
         });
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 4a48fabbc268..6b00f9789772 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -8,11 +8,6 @@
 
 // Stable since Rust 1.87.0.
 #![feature(extract_if)]
-//
-// Stable since Rust 1.88.0 under a different name, `proc_macro_span_file`,
-// which was added in Rust 1.88.0. This is why `cfg_attr` is used here, i.e.
-// to avoid depending on the full `proc_macro_span` on Rust >= 1.88.0.
-#![cfg_attr(not(CONFIG_RUSTC_HAS_SPAN_FILE), feature(proc_macro_span))]
 
 mod concat_idents;
 mod export;
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index d61a77219a8c..37f4877f52e2 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -169,12 +169,18 @@ fn main() {
             r#"/// Generated `{name}` KUnit test case from a Rust documentation test.
 #[no_mangle]
 pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::kunit) {{
+    /// Overrides the usual [`file!`] macro with one that expands to the real path.
+    #[allow(unused)]
+    macro_rules! file {{
+        () => {{ "{real_path}" }}
+    }}
+
     /// Overrides the usual [`assert!`] macro with one that calls KUnit instead.
     #[allow(unused)]
     macro_rules! assert {{
         ($cond:expr $(,)?) => {{{{
             ::kernel::kunit_assert!(
-                "{kunit_name}", c"{real_path}", __DOCTEST_ANCHOR - {line}, $cond
+                "{kunit_name}", __DOCTEST_ANCHOR - {line}, $cond
             );
         }}}}
     }}
@@ -184,7 +190,7 @@ macro_rules! assert {{
     macro_rules! assert_eq {{
         ($left:expr, $right:expr $(,)?) => {{{{
             ::kernel::kunit_assert_eq!(
-                "{kunit_name}", c"{real_path}", __DOCTEST_ANCHOR - {line}, $left, $right
+                "{kunit_name}", __DOCTEST_ANCHOR - {line}, $left, $right
             );
         }}}}
     }}

-- 
2.54.0


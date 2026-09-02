Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021138.outbound.protection.outlook.com [52.101.95.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22266429036;
	Wed,  2 Sep 2026 22:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386421; cv=fail; b=EvH0vL+H/j3hLXWrFjfgta/IRWNEe/AVeMqoOGrIU3yMEby1EpB1wDKE0+qscshBMlOJHdVhLoefJDOr7R4GaF0FOJE1KvTGbl0qHOcimxxUt4osaWkj+faFlDTeNRlokh0678VgN1PiIBVfHLUn0hOSaN7U1oDlfSPcfKwECVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386421; c=relaxed/simple;
	bh=8Slr4JijMhVs64weEWULVVojV11iIbJ8CnT0c4KGDtY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gu0FsMB6rLAnbr4BX2E8a6XpanLeWyl4ZEk31tmdK8+CE5fnPuZVIWVH4eH7XNOPL4oZSGPSpOxWmoJm7oEkCe5PToT9bPMBCBvBJvsC4ygSlSGxtTHQiVdrur/uMoX7aFIF6skK/YRnMF1V4A4t09LbgYuD3tDSSggjA11FB+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=rF3PLawN; arc=fail smtp.client-ip=52.101.95.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="rF3PLawN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfdN70TkWxUrI3jBRabfWYOsqcFVfrqPvR9R6dXUYX9Qs7hC/rTG2eAR8oWpFXOaGpXcvb9VJPEeyExNComt3tOcheardqzBp0f9uy8p6UqDAsgSnLJsCA8ycaIFDdKPSeCz/mrkHcS0OAFWVX1SYtdETYXfJY/3ZpWcCP+d0u0/UCvJOg5bPDB+pXGGrybi4aHAPK3PPNFWG1kLM9tLdxzp/41r6TlLMSFLhm51usMbnIrxiKsA3sQuFuq/WleOD8QC3Gq017Y2X4qNXzgh0JsubzyCpY27Li+EexyAUxL48TtJ+TEf5Q32GJin7r8JZT7x6gg7kJ3K09UG9gSZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIc0C64sBLtqyNnHxTNg0cQbWNuvM+p8ZEhRoWkw3AA=;
 b=J9bZA9kTkChuYIFHRY5cIxoFLxdVa2uaS8M3Vq7g0PYi49ULEv+J2NetoQnSlsrzWrdFT/+9+KCmmOcaXdSZEYq8vw9PyaaStKa+aoM4MT55BWaMOwMKa6F/rY0KMEMNUCi11ibAiKYRcN1kg1F9WUyaTJY5TaG6I2ChVj5mTtajtxlMnPlfmgRDlhhcrituv6EijYWOMJv8ijKX6d0a0r2Dm7rcVAarTJnyYFHnCM0uVk2eZRbW6kNth0955j7BneXg+4wHpj8bS80X2Fuw4bdPLwYPmxBgpllrR5PsdXU1z+SQBq5Tcy5a/Wi32Jw7BzkvNDUF5ivCQXAWCDuDrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIc0C64sBLtqyNnHxTNg0cQbWNuvM+p8ZEhRoWkw3AA=;
 b=rF3PLawNiErEoJ0qn5QdALRUcgM6As0nl8wcLWhVvmi12d/4ck4NsKQJNXvrxTnkEhDDn1DfvCg5BARXP3yrO+2HO2g9Dk9RbLypgZJC7CARzY/qNijWhwdfgYs3siA5lHfaDJtZ41dAlnKPFr9V9mg7g2Cr8qZRSRAVfkxKPl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB2773.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 22:00:09 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 22:00:10 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 02 Sep 2026 22:59:59 +0100
Subject: [PATCH v2 1/3] rust: kunit: use `file!()` inside `kunit_assert!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-kunit-v2-1-eda3ed6c00c5@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788386408; l=7329;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=8Slr4JijMhVs64weEWULVVojV11iIbJ8CnT0c4KGDtY=;
 b=VolaeTHwsmv4jeuwkXBgYLxbK4CFlQJRjwa62ZXsHb9ur0Wf5G+c3z2eKS1p8n7G0upXpxvJW
 5AjoGU1+YXyAuNvMSfwCNazd1eORtVElx53b8L7ufhQIDmc1txe/AzJ
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
X-MS-Office365-Filtering-Correlation-Id: 453612f0-3aa5-4cc0-d627-08df093d8e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|7416014|10070799003|366016|56012099006|921020|5023799004|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YIudVQNvDQUnXwcFy4HB2HvUiN+kdm4pvyJ14j8CvoDYrgrngZcWAeIIlddY7J8Mgp24ZlaHFk8aluxpY3W63UWkYF360iDR8XF7cDFV3oeA8O0vaNn3l3gbUQMWWh+VASr9S/BsEJT7G3bMofZyw7M2m6B5XLaasPPO448upooCyHpplvKRFOh0yp9xZY7oJaUCYSCmavsGtYMvEUxKZFeTe+q6ixbje15Ib7qxM+lGjtANMeN2j+RKW++4medk8w8ISBNUCdt2HhpQlIas9SyVIjOy2q6+K++6zsbBVPQNAIeBTRr5PuBGi/6XRql6+0RDuWcFH3krd79syEco5M1vyzdeJEm12KHTAKEicZRjfKM2JJJ01BKc77ouiA1uRFlob7vJnHV+50oSsoK5FyrJQDAtXGBB0cVCi+RtBsfwSk3U/5gIAj5zQwKbUOci7dgdzY035AqmFU3Bt8jfkxpIVlmeoEWQIxLFzOoEhUBIszGsF94F+zucz3Uz8QM9pqU7/iSF+iX0FUrUW2P1EmqkA3taOQsjRwiF9wVshDrDhrtDCZM/ZoyiE6hY+CzCYCqSwA9n5CRL87LNAvLYkovKfGGTdhf97CXL7j61LA5BI+cWfhBsWI3m/CCyXgfI/3d6BsFweTh/XmztLeA07bvFV5hywMU7u87vODDjYRMuoTuFdtf44zvLTofA1SagJ+A+G9a260JecaLp/TQ2Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(7416014)(10070799003)(366016)(56012099006)(921020)(5023799004)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eURZM0dJdCtpelZ1Y28wZjQydkhsT1IrK2M5TWNsbFgxTGtzU2dlbks4WFRY?=
 =?utf-8?B?RDJjV3ZnUHBZMzRBeEhtSXRuTDJFN1Q2SHloNkhCWGROUzY3dXU0RXllUmZm?=
 =?utf-8?B?cEYxTkVnbVd6bXp6WUZiQklpdmZxN1Nsb2ppNHFHS3ZkaHFHd3B2bWNTL2Q0?=
 =?utf-8?B?YmFwdHhBeExvUkpZWjVzckNWVG4vbGxkZmJnYmtNcktaakpQcHd5WGZtY0Z2?=
 =?utf-8?B?bXFaRjVQZjkrYnN3b1psQ0g4T3R1L1lTSzd4bFVLMlJUOXZMd3dmc0U2aldq?=
 =?utf-8?B?MFVyRi92WnhLUUw0YzlXTmFsbmdBVnZEaSt1SWZ1Q2JBODNydTJ2L2ZJVjRn?=
 =?utf-8?B?aktUS042ODBwUzY2dWl4d1hic3Q0OHJWcllqb0NxTkdNdHIyRlVLeFhLc05U?=
 =?utf-8?B?WldWUGhGbDNLRjczY1ZNK1BFUW50akxkbkpUeEtLejdtYzVCMFcyZHU2bUtq?=
 =?utf-8?B?SDRkYnQ1RUpYaGp1L0JHTGRjaVRZVFBCTzZnL3dhLzlXdzdHeFRHbXM3clZw?=
 =?utf-8?B?RWdMOUZpZFZTdFQzcmRNVG55d2VVRkxGbTBXSWpSRzR2dUFNMFk1TEl0MHUr?=
 =?utf-8?B?K253ai9zOTl4K2Fzem9XdXNzSDBad0NLOVk5aTQwejhWQ3Aya3FDNi9lRW0y?=
 =?utf-8?B?TFRpb3RqQTlDMGV3L3RId2pZYXVNQ1RoT21kcGRzb1ZycTV2c2QzTkF0bjBH?=
 =?utf-8?B?eGhRV0pXeU12SEZsQlVveFdlbzFmS25DeVN0aGtsS2RFdG03YVl2ZGJ5cmJk?=
 =?utf-8?B?Y1JlTTd1NUtXam5ValVoOUdUZkdSWEtBaVFra243N0FiaytEcGpiWUIvRlZF?=
 =?utf-8?B?Q21udHJibWJZZWlRU3k0ME1LM0grOVhxWmdFQis5My9zbHpPZ3pySW1uamNW?=
 =?utf-8?B?TDc5azFtWGpURnNnZmh5MlBmemczMU11N09IUmFqbHpzTm5TUDhDQ2t1M05x?=
 =?utf-8?B?NHkwY3lqdTNkeU5GREUwMUJBNWRVc3JjckxsOVhJcTI1RTZUY2tBcTlqYjBJ?=
 =?utf-8?B?QzYrZFduL2l5QnljbGJDYXp5ZzgvRDhNN3JwWFZUZk9QeHhOMVZXSVB6VGxW?=
 =?utf-8?B?YjdZMDlpZFRGU0FtVXV4akZ2ZCtZeUtvZ3RnVWY5Y2RBdlBYWEJnaGhEeW52?=
 =?utf-8?B?M1dVMlZEUktEcklKQkFiaCtqNzF4VFNGcldRbUV6V0FITkFxWWdIdmZTcnNT?=
 =?utf-8?B?c2V4MEE4SmNjNllzcVp1eGlUZ3VPNXNybHIrQW9LSmlJYnJNN1hMWCtFL3lj?=
 =?utf-8?B?cDNpU1hTMXdpY3hlTVVnVmRzWnF2WWMyVE5CVERVN2RVVWVsa1MwNkRRNGcy?=
 =?utf-8?B?SWxlTUJHNnRKNkY3L0NJTmhPcXJQS0NScFl0aFBxcC9rNzJSdHQ4NG9lWUhM?=
 =?utf-8?B?LzhYR1U3dXh2dXN6NHNZV3BVR1QxQ05zblV4SUQ0aHFpTXR0bEpiQzhoZGZU?=
 =?utf-8?B?VDhMVlIxUXplMjZjaVhxRE50V2JuY1hqQWx0bnhEQ2xHRXhZZFViZE45SXlI?=
 =?utf-8?B?Y1BRa20wQkFpTDFtem5JYmNhS21kTDhtL3dhL1NDZk15UE5WTGY5TXczRVZx?=
 =?utf-8?B?QXFuSkNJZWp0eUdVYVRCK0tqYlM1Y3k2bVBjZFJJQnUxbFN5RmhUbkpyR0lz?=
 =?utf-8?B?Zlc2eU1tOEU0MEtCellVT04xdGZFL1R5ZmZMUTMyVnB0NFlvV1dQK2pTWFZ0?=
 =?utf-8?B?bGhKeUd5MXFRaVBaS1g5cndHYzhIQ0tjODl1VURpbmYrdVY4ajUrRVdDTWE2?=
 =?utf-8?B?UUpBekNpREJyL2tNQlh1YU9lSHdHeGppV0RBdVh2ZFJ4YXNsRWlSWWduRDBq?=
 =?utf-8?B?ZUt3RFBzb3QzZkVKNXNKV0hTTVZodzdlaThzUUhRNUFiRkFidUZDNHcwRVpV?=
 =?utf-8?B?Nm9jcjlORXJWZDhUeFc2K3pQbUpBUXJONW5KL1MwWEZHdGNYNGcycjBlcjRm?=
 =?utf-8?B?TmwvTHdWUTBHZU0vRUxpSjBuTy90V0tDd3RJTXRRNk5OcWxUaURtQm9nWjBK?=
 =?utf-8?B?OVVMa0JSVk5Xc1U2VDhxZDlSSlhqMjZPeVFOYXhHS1ovRVZXcFlsZHlPalVG?=
 =?utf-8?B?RWxobHRBa3R3MlZZZXkxQ3pWRHRaME9EdDVodTJ3SkVYeVAwUlphWFluOHdo?=
 =?utf-8?B?WWVmOHcwY3l3ZnBkNE9VVjZxL2MxWTJrT3c3UVRaY09tQmVFSXF4TEp6aFJr?=
 =?utf-8?B?aEtHUUw5VkVub2ZhVW9ZeFZVTW9wWXp2c1FpSCszOUYxc29pY1lld0pHaGIr?=
 =?utf-8?B?NnA2bVZOQ2J3MEg0MUZ5MEFjQk1RY09CNHdXZ0JJbE9xdG50TlN4SzY2L1h2?=
 =?utf-8?B?RFNlckxDS1cvenJjK3Y4bFFyeWZ4WjV2QzFwSGJzR1pzZWNwWEZnZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 453612f0-3aa5-4cc0-d627-08df093d8e84
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 22:00:09.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYG57/Q960lNfSlpiQU4QmZdOkJAx0HCMnC/uiP0N5geXGC7uFdmIbLg2njOdX8e7v4IRLTvCy0yOtxb5k7CLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2773

This parameter is needed currently because doctests want to override the
file. Simplify it by changing it to use `file!()`. Have doctests override
`file!()` macro to achieve the current behavior.

This allows us to remove the `file` helper and associated Kconfig options.

Reviewed-by: David Gow <david@davidgow.net>
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
index 8583d9f06c52..24b019104d88 100644
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
index 91eaff8c186a..12084873b51e 100644
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
index 24f96feaeb34..6916195f0051 100644
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
index d087c0d9fcb3..bb57745ec339 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -176,12 +176,18 @@ fn main() {
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
@@ -191,7 +197,7 @@ macro_rules! assert {{
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


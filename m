Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022141.outbound.protection.outlook.com [52.101.101.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE164F55C9;
	Thu,  3 Sep 2026 19:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463332; cv=fail; b=DLfVbmUQjmngxXBNSlyW0nhbE5MhP7MFlrWr/5p6/ZBs8SZPX0WlVThA2k9pnqo2djLAZzEjGhH0UuwOEo67AGKmJ1ge5KoihN4G0Tk6OK4F4HnPjTOUKUfQH85u7gpDSFIeWvsFT7AWLt2B2wdGUYFZaWVJ416sMNQrBuD4+B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463332; c=relaxed/simple;
	bh=BwI8boB+nWUV0iiqRW6iyDy+82Auv6kwY0ttC1RnTxI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=Pjaw8spmL+2Geqz/fyBMrBwwchqBGuEkK65+rhhH4zohA87yxbs9MYJem6pygVWpeUKGjRiRkfNxn3jL811X78fGbqnkbMH1durt8dO51dgZKaKS4JSxRtzbYJR/dLHsBOowghoZ8PLKyR7yB2xRnSsJBWdzeqD8muSjdwRgcc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ftSphIFB; arc=fail smtp.client-ip=52.101.101.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ftSphIFB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJC3MGst4UbHP9K54+vzG73khcJYQvYBRG9TBFZdYwEG8NErAlf6XJZZvv58/DKhthIVyqp4pNP1Zec3gRREeXokrv4SVNVZ1PLmSmIbOyi71UE5DyFSxbGQT1Ep2jn7r4ZI04jaEhz8YiQ8dreRQh+HFvG76CL32h2HyZlsavBN2qvaxi+2slWmrWmVDDIMvxdDPqywAnc1mkq3TKrq/afbGAVSrQe9E1Q8wG4J2t5mw+ZKwbajf8YZhoudlGQ1zQVZY742qPwnXCe2O835U7IHFqTa7UfEwd5UekyNg18glRIBUZNJcHQSsDVapVzdCAlXM/xXcdYs2zPMfmV1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7EqUwOMuyEeou55AjjA91uClN5whdb5PeAAmb2eMng=;
 b=yY/RJiWi9NwWthdcFbOSd/fJhMR7SglnntvNHvibStl6J3EqrNgvYGKlSo2yCysfMsoB8n12ocvcAVBXs6vYbmz36BfXZLE94RJ37UgORWAObbjgNcaG+8yoCVHXoG9svcmAgE4pQ44HHUPoVZ+IFo32bgs6fhkHlpJBvj3DTKtTlBk91OoIWUoZRZagHEZrSuXr98QV4QDEJexklhLlNsnId74wUcPzucksnL6QuxcyaZcys+WMt6GRxhdbIp0pM64yiE99vIoXk7/jrYu4VnKYPKYDVO1QO86WD4WQQ1pVa0CNsSazw8lGirVNlsfsFKRT2tcZqs7Ka0Rk7BZgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7EqUwOMuyEeou55AjjA91uClN5whdb5PeAAmb2eMng=;
 b=ftSphIFBAkRszkcgqysZ3b+sITHGMrdMS/gvEjZ+fewm17+4eZ/9paqjEJ3dPNlrW7fxSsVEv6sWlYvUvLVRPK0HoYiRf7A3f++maiU5vAdNFIRaCbdXOleLJxq39c1oCMn7KzeCzTU10fdfJ64GxRRjLrJ9nZxKexiCAu9GYKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB6265.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:21:56 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:21:56 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 03 Sep 2026 20:21:44 +0100
Subject: [PATCH v2] rust: doctest: add source map script
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-rustdoc-sourcemap-v2-1-d5b1abf3dc83@garyguo.net>
X-B4-Tracking: v=1; b=H4sIAMfImWoC/yWOyw6CMBBFf4V0bbEU5eHK/zAuShmgCq2ZaQ2G8
 O9SWJ7JvWfuwgjQALFbsjCEryHj7AbylDA9KNsDN+3GTApZiFrkHAP51mlOLqCGSX14VoiuFpc
 OyqpjW++D0Jl5dz6eB1NoXqB9FMVEowh4g8rqIZ5GY8PMLcz+PCnygDEzGPIOf/uwbxZdx4Yik
 9vDq8zTXFR5WUue8V7h7/4GtDCmDnv2XNf1D+iJtGHaAAAA
X-Change-ID: 20260903-rustdoc-sourcemap-160f904fe78f
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
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
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788463314; l=4613;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=BwI8boB+nWUV0iiqRW6iyDy+82Auv6kwY0ttC1RnTxI=;
 b=bJUwPPe9tNDJP7jcsHWvIOxa66Eej3bClEvISlW1xN2HP4DWEwqKZ1pjGr6WeTJwO4p/qL96g
 JVhYkLcfFT5DSI9W0vU4hzOWWPkMKXaZC+oQvjmSscHkF8GkluM0HvA
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: OL1P279CA0021.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:13::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 791199b6-f77d-4196-56f5-08df09f09e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|10070799003|366016|921020|6133799003|10067099003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4kfX/V2pGbW4iW06Ul1D/FBEA5kCMQ3vT/JxotTyGKnYppwQBeviU5HwimGNk8BiEdirEJ29RvzJtm5cTDgONE3M1+MCX1EvyAFyJJWCpGzrxHbfC6xJprzrWi/IRx4u+HuS9hZpWTbiFrVh66xAVTIGd1gAiBcsTt7CrKJhDR1d0jdWjBekxMoivczGx7FRuEoNTCG85KUdN4fVOKtg8dSblzpcD5dTWf6yKaJT87fBwp8TrQEQF//zWJcOySMjPXxHF6wSIytE/4wZwapoQcbGfDwYO7ikZL0DQ6QKUcr2g1PijoBgBbLfCol++P7cAq34DnGJFI0NM8+7jEf7C3eL+uJ+oFNf90168fqGuuZ25+iTDJsjznwupVuR8cECUpWNfLeV3x1gE0uwGsLfC4x19A922/dxC3yDKv5iaT2C+2lfrtiEKIvSYAcA1RVtAbB5vS5pFgcbuhopuvDPvKEiSI0bKHCnTTNgMeLjkjqIpnc7US2GiTAlUnv6q2+Raco9+ddB4cTWo7q1puYYodlc5tpPaHad+bsMmeXvk6sBdjvX0SjBEM0hkRtipvnlVKiu28oCmLur4exTIFriSRRr6Tli3SzYnMsUs0DU8fTElNJ0TOM+JTXinCp3Kpr6zK4Zgo6JhIsd34cbKnnJeMNe8V3vaMP3S4SIowqrR+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(10070799003)(366016)(921020)(6133799003)(10067099003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkErZUhZOG5GNEdLaStDdUprTEJsOXJUeU91OHFFbUZtQzd4VS9tRVhWK0hl?=
 =?utf-8?B?NjRObUNqdGtpekxUQzZQZExYeUtQVUprZlZBRDhwU255aFB5N3d1ckRhZXhq?=
 =?utf-8?B?WUVUNjhpYzlWOVAxWmxsVU9wMVFXZ1BibytUSldZQUFjZ0JPNHloUW9Ka3A4?=
 =?utf-8?B?cTdrWlBLU2UrN1RYU1c2bjJhbDJicG03UzFmcDZHLzdNM0Izd3lYdnYrRmlj?=
 =?utf-8?B?MHdPT3BiNDVyb3FaVXczbjlPSm1STldkVDV0VlM3MkFtM3ZRQWdLMi9iZ21i?=
 =?utf-8?B?ZWRsVS9WRXhRMGZLMmk1REZxbWJ3aloyL2ZYQzYwMGhqQmpuWTZaS2FlNFpk?=
 =?utf-8?B?N1dXeG5HUm1UcC8vUklwanMrZk9oWHpnSHpOMnE5NE1RRjBWQUd4OHdNaGNx?=
 =?utf-8?B?NkJGV3prVHBMNmlXNk01R2JpRGVLTVNHT3F1ejluOXk0RkpPUi9JcHpnd3dW?=
 =?utf-8?B?aDhINDFaTHdrS1lHZk5jSlhiNnR1MWM3RFRnKzR4SS9ydGc1Z2hwMDAzdkw0?=
 =?utf-8?B?K2ZaWTZPaEZTcXpKRlRxLzdiTjZnQThHVFBXK3N4R1BZcGswY1gxNjdyT2pB?=
 =?utf-8?B?ZWlrQk55RGhFNHRDMGNObTE3aWExVjdPQjFZUUpHWm5qckRSaGF6QnBsbTFj?=
 =?utf-8?B?VjJnT2s0dTdFWnMzazVZZHlkWEg1QjRObm1GV2pjWTFNQ3dqT2RDZ0xNcEVI?=
 =?utf-8?B?YVlBblAzTHI3eWZjTjRpd01OTnJTeTVLM2Y3SEtOa1RkWFdyL3U5MjFWamdu?=
 =?utf-8?B?RUZIbFJyS1hHRm1LdWhLYWVyQWZOYmloRFBrR0hkMlhmejRIc0tucFYxTUZX?=
 =?utf-8?B?K09GOUp6TFNHNmlCSEJGYi94S0N4akZNcEp1MDdhT3hMRjVlN000TWxRcjl6?=
 =?utf-8?B?a0FwTmtjQktKMm1rS2d0ejVIaDFuVmNERTJUbFBvVGg0RGFKN0VzaENYZEF5?=
 =?utf-8?B?Tnl6V3duTzgzcGhLb1Bva3gwMDJYaEg3c0dheVhYSjh0UGthaXpOM1RzYVZC?=
 =?utf-8?B?NExZaGJzZGJMek5UOE9UMkJpRU00bmtXeTE4MGUxaFRhQk9iUmhpOWcxWVdv?=
 =?utf-8?B?RFZSOTQ4U1QzYWI5Z3pyZ3QrTHNBN21FUkppUk43bEhwWjRxeVNRNUY1VDdJ?=
 =?utf-8?B?RHNxbGNTTHNZc2I1QzY4ZXQwL3RYNEVxcUhJUTJJb2owRVl5RDdtbk05aHhj?=
 =?utf-8?B?RmY3V3hBM2hhOUF6cFVDRGR1K1RMYVpnNTU5dGd5M2R5b3RpWkRGYWtKNWty?=
 =?utf-8?B?NHhMSm9ONml1OERudVI0NDVBdFZjUUtLTWI5OUVPeEVKdnQyOWZxZTFrMG81?=
 =?utf-8?B?T3luSGdiUXhaVzVxdVNFTnREMXpYQm9uZDhERldnVEREbG9wREMzS2pHRVFT?=
 =?utf-8?B?amdSd1gzc3ZCV1llMTdRZTZKTDc0VkRZN3JMb0kyc1F4ZC9BNFMwZzhTd3RM?=
 =?utf-8?B?bk9WYW9JNkFqb1lWOGR3UmVORW1RUjJjOElvRTJSa3dFQUpQbVdYVk9tWGJ3?=
 =?utf-8?B?eDUzUFk4S0ErVnNRSi93ZEt2VmJ6ZU9HYXBFVnhSMFF4eTQrMy9YTWFOTEVo?=
 =?utf-8?B?WHlVcVZrQk1kTi9aWTNNQ29xUUdwWEZkTTRqVFZxbzlVelhFQTRwcHJ4OVRP?=
 =?utf-8?B?ZVVpZ0JEWlZQVzZrRzVqUlRnakJqRnIxWWFVa3BNZXUrT1dPdU5vUlU2aDVZ?=
 =?utf-8?B?RHZYa2JUWkIyL3lqVHZ5VGt5bXJ0RnVyUGttUzlmdThUYnArZ1I5THRwem9V?=
 =?utf-8?B?bXBwZ1pneTZkZzRQT3REbDZxZjE5eGZMazNwSkhFNkF6UTVBcFdRRk5IaWd5?=
 =?utf-8?B?QzJTMWJRRHNVQ3F5R1VoVktIN2RuV2dTZCtSTjkxdXdma3ZaaVpwWTUrQzVH?=
 =?utf-8?B?b1E0S04xeUxEZkFsYk5mQ2NqM05BMStsbFd4UjkzZmJ1S1AxZ1lrYUxLVXNv?=
 =?utf-8?B?N0lXaGFPdUhLdjBUTFFEeFZpS0tSRC95UFBDYXFZYzF1Z1grTnNybTNaWStr?=
 =?utf-8?B?ZTlSa01qMGhnQUlYdnNXT2U2U3krZ3F4L2VRSnBZbERXUFk3OUhtb0ZlOHh2?=
 =?utf-8?B?RklzWHorMVJFMGRBZFBMWGdZdjVyTDhhSzJGcTRBODJFTW5BMm1EZmtNc2ZG?=
 =?utf-8?B?RDFaSld1T3g5UklNekFBSndqNWhMY3pRSE9FT2R4MUZLZjRUbTRINnBEUGZa?=
 =?utf-8?B?RzRSWmR2eVJYem9UcVI1dlh0MmY2WVBaSERMNkt5MXEvUjMzbzBUUzFtSUh3?=
 =?utf-8?B?QnEvR2cxdDVEWkhDbjN4RHdJeWJwcmg1YitRNXcvNzFPR3VPWFBFT0RFWGhQ?=
 =?utf-8?B?bjBha3NtUC8yYnZlY3BtYnU3aTdON0Juem9CSVRXRDVoWlF1WlJMQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 791199b6-f77d-4196-56f5-08df09f09e48
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:21:56.3388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbWjfxeZ2BecoZxo8daf4gjD+Yc+lwAx5bTVmJZnBkvH/awgU5DQOTq8rnzEdNdQH1loPKAMaOT+YN9AlxIJWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6265

Quite often when updating abstractions there will be some documentation
that needs updating, but the build process is not very developer friendly
as it just gives out something like
"rust/doctests_kernel_generated.rs:12345:42" and it is a hassle to find
where the documentation actually is.

Add a script as rustc wrapper, which translates the error message by
appending a "(generated from original_file:original_line:col)" message to
the original source info emitted by rustc.

This is the result of an example diagnostics:

    error: test
        --> rust/doctests_kernel_generated.rs:4490:1 (generated from rust/kernel/build_assert.rs:96:1)
         |
    4490 | compile_error!("test");
         | ^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Changes in v2:
- Fixed SPDX header.
- Detect tty with stderr instead of stdout.
- Match doctest anchors more loosely without hardcoding i32.
- Link to v1: https://patch.msgid.link/20260612160523.3083792-1-gary@kernel.org
---
 rust/Makefile                      |  6 ++++
 scripts/rustdoc_test_map_source.py | 73 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index da1a7409d984..23f603d1356e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -406,6 +406,12 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
     $(objtree)/scripts/rustdoc_test_gen FORCE
 	+$(call if_changed,rustdoc_test_kernel)
 
+# When building rustdoc tests, instead of using the actual RUSTC_OR_CLIPPY, use a wrapper to build
+# so we can convert line number in diagnostics.
+ACTUAL_RUSTC := $(RUSTC_OR_CLIPPY)
+%/doctests_kernel_generated.o: private RUSTC_OR_CLIPPY = \
+	PYTHONDONTWRITEBYTECODE=1 ACTUAL_RUSTC=$(ACTUAL_RUSTC) $(PYTHON3) $(srctree)/scripts/rustdoc_test_map_source.py
+
 # We cannot use `-Zpanic-abort-tests` because some tests are dynamic,
 # so for the moment we skip `-Cpanic=abort`.
 quiet_cmd_rustc_test = $(RUSTC_OR_CLIPPY_QUIET) T  $<
diff --git a/scripts/rustdoc_test_map_source.py b/scripts/rustdoc_test_map_source.py
new file mode 100644
index 000000000000..673021bedf4c
--- /dev/null
+++ b/scripts/rustdoc_test_map_source.py
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0
+
+import sys
+import re
+import os
+import subprocess
+
+LOCATION_REGEX = re.compile(r"\.location: (.*):(\d+)")
+ANCHOR_REGEX = re.compile(r"static __DOCTEST_ANCHOR: .+ = .* \+ (\d+) \+ (\d+);")
+SOURCE_INFO_REGEX = re.compile(r"(rust/[\w/.-]+\.rs):(\d+):(\d+)")
+
+
+def transform(file, line):
+    with open(file, "r") as f:
+        lines = f.readlines()
+
+    line_idx = line - 1
+
+    # Find the last location and anchor before the erroring line
+    real_path = None
+    orig_line = None
+    anchor_line = None
+
+    for i in range(line_idx, -1, -1):
+        if real_path is None:
+            match = LOCATION_REGEX.search(lines[i])
+            if match:
+                real_path = match.group(1)
+                orig_line = int(match.group(2))
+
+        if anchor_line is None:
+            match = ANCHOR_REGEX.search(lines[i])
+            if match:
+                anchor_line = i + int(match.group(1)) + int(match.group(2))
+
+        if real_path is not None and anchor_line is not None:
+            break
+
+    new_line = orig_line + (line_idx - anchor_line)
+    return real_path, new_line
+
+
+def main():
+    actual_rustc = os.environ.get("ACTUAL_RUSTC")
+    args = sys.argv[1:]
+
+    # We redirected Rust output so it is not TTY anymore.
+    # Add `--color=always` back to preserve the color behaviour.
+    if sys.stderr.isatty() and not any(arg.startswith("--color") for arg in args):
+        args.append("--color=always")
+
+    result = subprocess.run([actual_rustc] + args, stderr=subprocess.PIPE, text=True)
+
+    def replacer(match):
+        orig = match.group(0)
+        file = match.group(1)
+        line = int(match.group(2))
+        col = int(match.group(3))
+
+        if file != "rust/doctests_kernel_generated.rs":
+            return orig
+
+        new_file, new_line = transform(file, line)
+        return f"{orig} (generated from {new_file}:{new_line}:{col})"
+
+    if result.stderr:
+        sys.stderr.write(SOURCE_INFO_REGEX.sub(replacer, result.stderr))
+
+    sys.exit(result.returncode)
+
+
+if __name__ == "__main__":
+    main()

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260903-rustdoc-sourcemap-160f904fe78f

Best regards,
--  
Gary Guo <gary@garyguo.net>


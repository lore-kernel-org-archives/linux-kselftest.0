Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF7D4734C6;
	Tue, 18 Aug 2026 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066620; cv=fail; b=U8kM5kniHyrsJFu4U4BxzcUUl+QDGciiaggyHzcOAwdynIJ+OMfxPm8mTbQ9KPEo4rposXWIFoQEuhEs9z9HKuDEsm1p0oeiB0E8u7NtYweeDrAYS/VZ7FVU/Hi2BHep++fQ5VoP3E6H24IN48fPGQ/FpvhOkDVeyhIlNg8laOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066620; c=relaxed/simple;
	bh=khKV1XIP1Rhj+6e9JUu9GvedBfGn+7x9oJhXO0KJtgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kjt7udK7PkNUz8XNFEGD9QOXmQCOIquq1hEWqF42IwMDRsFQfJFtigdi1wXNRIscEDceiGIAW/O/ORT2XV8LqYnycUX8lEM4DLliXIdQQcedEO2+G3NhDjJxAKBzrxMmCAK9uf0vkNyI6xIW3SaoUWodoUlt0Pqs7331ueoD3DI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Jwcq9eB0; arc=fail smtp.client-ip=52.101.56.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jwcq9eB0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9Hg12e7d6kBtryfbw7kqbvkLS/utLOJPQspd7e8RafYs6X9YYd19F3tIwkaHizdmMrcNHMSk1eI8gqxRgerSA9g7+IWh/EzHLBToQ5w7VFGKznMxdc8J85Ojq493zI+bGr0wJJ5JrdZGmTeQPRIkjS9G3cB8shKADXfQFxO9PaGXMhWeWOvfwbZrggCJi6mHFLcY41huY5217ECh1RFIoBzhSVd9Z7aT41eemLPZ7Oyf/nuIg8NxrWKCvlHP8s2pnPlMUEq5udA26laUwSjocfoOM7Zu2O8cQNchRwWOwsp/IkgYupPfoIvIh4eBudmdybIbhc8gHKnEcvWVLlfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8s9SGzPqT3qBC80MuSQOZJGWd6x6ahQKeuz9iRPNzE=;
 b=GIu/2zTnSFShrlsqAuTAOr5TBcpLjjJQ3LkEbssIrhHcEcK41ZtRJQ0zTQTQVban06yWY1H4xkV89jzx62ZaduwLxFRRRPrDqxOwF7J6X/b8WyHwdvYhym4/sEGVJ7Iq+3CO+dcOPEYfEVrI3OV5ZV9a+dXJj9qmMpvG3uDcL1RXwol4cMfyNLD7HahX8zA8mAMnQsQ2lQcJnyK7dEIJlnK5yDLpD2xS9kfapT/C9KCQgcjMDu8rbmyO9G8JWxgnY5G3/CjVH2Ftiya8ZfE33eI93LhzoIwfIxeemT2wQjtRNu+RViSWy10QNgY+VHNlFQBsOmb5M1g6TKbqwtbeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8s9SGzPqT3qBC80MuSQOZJGWd6x6ahQKeuz9iRPNzE=;
 b=Jwcq9eB0hdnEUVI34VbW/0nXCytqh4cYxR6GIwawq+4D5XnnCMQAiH3q4VxWOzYuIg5uAy+6psKPTnskiiBWdczjkW9Xas4Y/DgtksO4Jp8SfjZCIDsUquo/t6FEU9LPKBa8G3K078iCUAaAz4dM/vSROoPx42q+Gn2Gr33+ZRSSnGOkr9X6Q8C8gg0wJv0nrgsyJBXiT4+LT/A0k0Y0Lzc8PZktkypkxnHlU4oa64w2qst4yWa+2c4Kii05Kx/TDt4jWvZO3p6/EhTkvdVIqcPFoh8GHK9xsRon77KEb+rVyDYvyQeLHIEzwsY1AvyjoJ3GAdbxBfT2ILVMDQUvZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by IA1PR12MB7661.namprd12.prod.outlook.com (2603:10b6:208:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 15:23:30 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 15:23:30 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev
Cc: Yury Norov <ynorov@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rust: kunit: move test configuration gating into macro
Date: Tue, 18 Aug 2026 11:23:24 -0400
Message-ID: <20260818152324.587932-3-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818152324.587932-1-ynorov@nvidia.com>
References: <20260818152324.587932-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR14CA0022.namprd14.prod.outlook.com
 (2603:10b6:408:e3::27) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|IA1PR12MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 4417dbbd-c3eb-40f7-d021-08defd3ca897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bUa8JJ1I3nHkZAUQHMATwaBkLra6YG3mJHuaDZk2HtQekyCjnvP1ZnHUHzGasjZcwvu4ExRGaTBt/pcZUV447nt5B3bmeZokdsqktA4rNFyYOzIC9S5g8ymBhiitFaXyNVLqLAuNNM7UcE72F3QdXfajS6Z7m6pkA+xPujY07C0xLhc72eVSysVV2UWZlnwy+9vCSUDbYdjqqSw8Y1YTPz7XVSdRjqH0mGF0IdPXE7FyY6oB72LdnLngq7HsrQqN1OOoYX4/Uhok8kOD27gPE0FUwNOwtLxxfemoGnnp8hfK7KIw4To4oOIM+kNImX5kjLgXBDTuwdRjoNP/IFopYAjKTRMMUazh9z1U/vCp50SU8TW0LiCtWg4md11pvazV+FEa1pRjMm0QzH520qx8cNciym2RlB6er71NJmF0o8OxJ28NvINRXLFKY0h4OlX84vNNeSCZU6V+0oNtly6ToGIYOWC3ODkGwZVIZtDxRmW2X2F+XHksWVSbm/cp36hp9MGyR0yxGEdunN/jiAQC2VX1CQ3t/6zZqzHPjZPTAhPMvxu7eDo0aOgHKZMSMF7eNK+s4+irlWbLEAZW1W/R6ytamiamAh9XhfhOKgOsTXCR/QFnaH72Ph8zmLLK1kCSZYQ+bPapygkdykjkSxEoK/nWOZuzeOxh8g6JZzzIOIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LJMXbLjA1Ms1w+dthCCQtgy5t5zbpIXBX+i7h2ZKc+8wl1VINkHclNLiKg7g?=
 =?us-ascii?Q?pA/HMPRKOz5Pfdv3dSHCzA3QAMopfBu7Z8Hvcf4T17UdG0p3EZx+uQOzk77t?=
 =?us-ascii?Q?NseuMd6vdyLf0BWWFVcV4azOB9yV52Rpj/4uG4+R6SdkTWELw/n1b76XwLvz?=
 =?us-ascii?Q?FPp1PbJUurgiRAsglE399CVkg9s/DtAa2mhdIX4uDRlh0C5TBEQJVpdruh7l?=
 =?us-ascii?Q?b1AVLOI912Q1d00hmMQNKEYMIexqr6KUXd8/fWlZUG1O2pjkTTDleDOhJAat?=
 =?us-ascii?Q?WYhZZkTItALS3drraZ5WJyAf4GUe8yFLUPVM2LwKnCLBzOL99oNP8LWeIGMz?=
 =?us-ascii?Q?7eLYOFJRsc9l9WP9PVpVqAIWl7rqNAFZG7A3pGv5lcCrfknEAeGBXGleTiUb?=
 =?us-ascii?Q?SKtRWpiwZEVD1nbNrR5i5romIe5e5rUb0D1OZMQW5EoK3qIDvjDYvSrIAZZi?=
 =?us-ascii?Q?vJgXEhP20MFcJuWoBpowdKvzwN3+hI1KkZkT1HScKF8ff+GEQC2QDegQUl2f?=
 =?us-ascii?Q?r8TEisoa2WDYOZJcQaS+4gpKBvL8UtUT0ihHPlvoOfnkjGV5ipmgtY3p78Xd?=
 =?us-ascii?Q?Vk23pOaYzuH9Oj/ymOu4lKFlLpYIq7IQYorArIsKO5I0OEDaInQR8ksL3KGg?=
 =?us-ascii?Q?PdK/bQ/SQTwYjMZCRlI+RmgVen5gpp0Ywxik+cHlKIREtBwMiVy8RrfmFXFw?=
 =?us-ascii?Q?g5WuLzEfkqBfkJnfO7HfnDvimuffJGU13d04MqaRWnd7tTeKLN6PoRweGDkq?=
 =?us-ascii?Q?VesF6qXrZ/3ofOTtKg02GWXvCPehX4Cm9rJFX0Y3WK9gzoWZTCQcoXi20wxG?=
 =?us-ascii?Q?OW+8k0LzRwuJMBrLZ3kOA3U3U5rqmT/nAbVZyPeZeeSbINeye4x7nmYGMFkb?=
 =?us-ascii?Q?iMeX4TWm+O1kFiWRv+3W8R81DvU5Zv0TyPnWWOc0ggwFX3jtt2CtgaS2gWrm?=
 =?us-ascii?Q?6lKXYbjKRGO/bAeKTm0iJWXqOo9W+/C9oqXDEYskouIVWs8yics1NAXbFIJ3?=
 =?us-ascii?Q?Fd09QlIWtTb4HBLgywnMOpSusUZMSJ3Pdprs8H1UkUxZsgH0e5oIBYFhF2c4?=
 =?us-ascii?Q?a7IvFDYHyoZoMydcA8h5CZSIYgLBCXlmmtM4uDckzMiWavwP9xAvvlWzmw7m?=
 =?us-ascii?Q?7Xp0S8zdc1qUl+LSDUJaF03CKNrApSXvPncJCLAW1hPk8gVCfXNpVSJkAB8g?=
 =?us-ascii?Q?7luIdt2nlRjecw+ow9RIaH/cikFjBVa5RHXMV4ljPoBBTQEVu1WODHTyrQ02?=
 =?us-ascii?Q?EcFWcoanFvY7Ksg5qgrFqaqwPTLQjEu3jsaVJ6tiokTph663Zs1JuWalycoe?=
 =?us-ascii?Q?mq2pPQSS/dGfBWkW4XB7gyUgmctXcInoaLC1cPXzMVcbZxU9qwLDecHlCUL7?=
 =?us-ascii?Q?aEKf6A2RMU2yuduoDZOQ02ZgZw4SUgl6KBsM7vcZ+8xQ9x0RqjT97eaAREkX?=
 =?us-ascii?Q?aCswWlPZGTyT/26kLGZew1JAFZn/Wi2FWiztik1A3bc3zzEnNeTmX7h1TlNH?=
 =?us-ascii?Q?hvJGJuGvOySHJYkWEmdTE8Xv8nPl9gcaqCguyeqEXYEMIP7jK4cr/e4KgYIN?=
 =?us-ascii?Q?+Ee4SNSwPbJR34X27ZbIEr5Xfo1FVwNAtIl9Ha2+3QfsVs2K/x+qWI5PbRbi?=
 =?us-ascii?Q?uxoamw7bZlD9UGjqkVLh3e7Afe3Rk8P4HqQe7OA4fDQEHFTAbINnR9X7G67Y?=
 =?us-ascii?Q?QLPZbRZ7M2a2bPwvswgwEWVS+9fy1WDLEUdr5O5SbubewQDm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4417dbbd-c3eb-40f7-d021-08defd3ca897
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 15:23:30.4731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tURl2vHipvi3qRtfCYxBgW1rVzdkrPcdarQAQnVdYzimSH4Q2Ybb3KX4eqBQ2IlXa39Xa4LBzzlfJ2kt4nHhFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7661

KUnit test modules currently need a separate cfg attribute in addition to
the kunit_tests attribute. This makes every test suite repeat the same
two-attribute pattern.

Declaring a KUnit test without a preceding `#[cfg]` attribute is also
possible, causing it to be built whenever KUnit and its containing code are
enabled.

Require the controlling Kconfig symbol as the second kunit_tests argument
and have the macro emit the cfg attribute itself. Update all existing users
to the new form.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 Documentation/rust/testing.rst                | 11 ++++---
 .../gpu/nova-core/gsp/cmdq/continuation.rs    |  3 +-
 rust/kernel/alloc/allocator.rs                |  3 +-
 rust/kernel/alloc/kvec.rs                     |  3 +-
 rust/kernel/bitfield.rs                       |  3 +-
 rust/kernel/bitmap.rs                         |  3 +-
 rust/kernel/kunit.rs                          |  3 +-
 rust/kernel/str.rs                            |  3 +-
 rust/kernel/sync/atomic/predefine.rs          |  3 +-
 rust/macros/kunit.rs                          | 30 +++++++++++++++++--
 rust/macros/lib.rs                            |  6 ++--
 11 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index e3943aceceb9..767b111afd41 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -138,9 +138,10 @@ these are also fairly similar to what you would expect from userspace, and they
 are also mapped to KUnit.
 
 These tests are introduced by the ``kunit_tests`` procedural macro, which takes
-the name of the test suite as an argument.
+the name of the test suite and its controlling Kconfig option as arguments. The
+Kconfig option is required, and the macro uses it to guard the test suite.
 
-Each test suite should be guarded by a Kconfig option in
+Each test suite should have a Kconfig option, typically in
 ``rust/kernel/Kconfig.test``.
 
 For instance, assume we want to test the function ``f`` from the documentation
@@ -148,8 +149,7 @@ tests section. We could write, in the same file where we have our function:
 
 .. code-block:: rust
 
-	#[cfg(CONFIG_RUST_MYMOD_KUNIT_TEST)]
-	#[kunit_tests(rust_kernel_mymod)]
+	#[kunit_tests(rust_kernel_mymod, CONFIG_RUST_MYMOD_KUNIT_TEST)]
 	mod tests {
 	    use super::*;
 
@@ -177,8 +177,7 @@ the unit type ``()``) or ``Result`` (i.e. any ``Result<T, E>``). For instance:
 
 .. code-block:: rust
 
-	#[cfg(CONFIG_RUST_MYMOD_KUNIT_TEST)]
-	#[kunit_tests(rust_kernel_mymod)]
+	#[kunit_tests(rust_kernel_mymod, CONFIG_RUST_MYMOD_KUNIT_TEST)]
 	mod tests {
 	    use super::*;
 
diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
index c0aa16c8fbf4..2e4b21f2002f 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
@@ -167,8 +167,7 @@ fn init_variable_payload(
     }
 }
 
-#[cfg(CONFIG_NOVA_CORE_KUNIT_TEST)]
-#[kunit_tests(nova_core_gsp_continuation)]
+#[kunit_tests(nova_core_gsp_continuation, CONFIG_NOVA_CORE_KUNIT_TEST)]
 mod tests {
     use super::*;
 
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index cd4203f27aed..b2c235801a3f 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -265,8 +265,7 @@ unsafe fn realloc(
     }
 }
 
-#[cfg(CONFIG_RUST_ALLOCATOR_KUNIT_TEST)]
-#[macros::kunit_tests(rust_allocator)]
+#[macros::kunit_tests(rust_allocator, CONFIG_RUST_ALLOCATOR_KUNIT_TEST)]
 mod tests {
     use super::*;
     use core::mem::MaybeUninit;
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index f7af62835aa8..4b77425950d3 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1508,8 +1508,7 @@ fn drop(&mut self) {
     }
 }
 
-#[cfg(CONFIG_RUST_KVEC_KUNIT_TEST)]
-#[macros::kunit_tests(rust_kvec)]
+#[macros::kunit_tests(rust_kvec, CONFIG_RUST_KVEC_KUNIT_TEST)]
 mod tests {
     use super::*;
     use crate::prelude::*;
diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 35ede53f2b8e..8b329b6e4f8d 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -548,8 +548,7 @@ fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
     };
 }
 
-#[cfg(CONFIG_RUST_BITFIELD_KUNIT_TEST)]
-#[::kernel::macros::kunit_tests(rust_kernel_bitfield)]
+#[::kernel::macros::kunit_tests(rust_kernel_bitfield, CONFIG_RUST_BITFIELD_KUNIT_TEST)]
 mod tests {
     use core::convert::TryFrom;
 
diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80d64..c4195e00d895 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -499,8 +499,7 @@ pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
     }
 }
 
-#[cfg(CONFIG_RUST_BITMAP_KUNIT_TEST)]
-#[macros::kunit_tests(rust_kernel_bitmap)]
+#[macros::kunit_tests(rust_kernel_bitmap, CONFIG_RUST_BITMAP_KUNIT_TEST)]
 mod tests {
     use super::*;
     use kernel::alloc::flags::GFP_KERNEL;
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 91eaff8c186a..52f2ccbfba49 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -330,8 +330,7 @@ pub fn in_kunit_test() -> bool {
     !unsafe { bindings::kunit_get_current_test() }.is_null()
 }
 
-#[cfg(CONFIG_RUST_KUNIT_SELFTEST)]
-#[kunit_tests(rust_kernel_kunit)]
+#[kunit_tests(rust_kernel_kunit, CONFIG_RUST_KUNIT_SELFTEST)]
 mod tests {
     use super::*;
 
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index b3caa9a1c898..404418504c13 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -428,8 +428,7 @@ macro_rules! c_str {
     }};
 }
 
-#[cfg(CONFIG_RUST_STR_KUNIT_TEST)]
-#[kunit_tests(rust_kernel_str)]
+#[kunit_tests(rust_kernel_str, CONFIG_RUST_STR_KUNIT_TEST)]
 mod tests {
     use super::*;
 
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 3d63f40791fa..e92194b37de8 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -152,8 +152,7 @@ fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
     }
 }
 
-#[cfg(CONFIG_RUST_ATOMICS_KUNIT_TEST)]
-#[macros::kunit_tests(rust_atomics)]
+#[macros::kunit_tests(rust_atomics, CONFIG_RUST_ATOMICS_KUNIT_TEST)]
 mod tests {
     use super::super::*;
 
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index ae20ed6768f1..7c7ba30f58c0 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -13,6 +13,10 @@
     ToTokens, //
 };
 use syn::{
+    parse::{
+        Parse,
+        ParseStream, //
+    },
     parse_quote,
     Error,
     Ident,
@@ -20,9 +24,28 @@
     ItemMod,
     LitCStr,
     Result, //
+    Token,
 };
 
-pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<TokenStream> {
+pub(crate) struct KunitTestArgs {
+    test_suite: Ident,
+    config: Ident,
+}
+
+impl Parse for KunitTestArgs {
+    fn parse(input: ParseStream<'_>) -> Result<Self> {
+        let test_suite = input.parse()?;
+        input.parse::<Token![,]>()?;
+        let config = input.parse()?;
+
+        Ok(Self { test_suite, config })
+    }
+}
+
+pub(crate) fn kunit_tests(
+    KunitTestArgs { test_suite, config }: KunitTestArgs,
+    mut module: ItemMod,
+) -> Result<TokenStream> {
     if test_suite.to_string().len() > 255 {
         return Err(Error::new_spanned(
             test_suite,
@@ -34,7 +57,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
     let Some((module_brace, module_items)) = module.content.take() else {
         Err(Error::new_spanned(
             module,
-            "`#[kunit_tests(test_name)]` attribute should only be applied to inline modules",
+            "`#[kunit_tests(test_name, CONFIG_KUNIT_TEST)]` attribute should only be applied to inline modules",
         ))?
     };
 
@@ -42,6 +65,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
     module
         .attrs
         .insert(0, parse_quote!(#[cfg(CONFIG_KUNIT="y")]));
+    module.attrs.insert(0, parse_quote!(#[cfg(#config)]));
 
     let mut processed_items = Vec::new();
     let mut test_cases = Vec::new();
@@ -51,7 +75,7 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
     // The code generated for the following test module:
     //
     // ```
-    // #[kunit_tests(kunit_test_suit_name)]
+    // #[kunit_tests(kunit_test_suite_name, CONFIG_KUNIT_TEST)]
     // mod tests {
     //     #[test]
     //     fn foo() {
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 4a48fabbc268..a660296d5dbd 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -464,14 +464,14 @@ pub fn paste(input: TokenStream) -> TokenStream {
 
 /// Registers a KUnit test suite and its test cases using a user-space like syntax.
 ///
-/// This macro should be used on modules. If `CONFIG_KUNIT` (in `.config`) is `n`, the target module
-/// is ignored.
+/// This macro should be used on modules. The second argument is the Kconfig symbol that controls
+/// the test suite. If it or `CONFIG_KUNIT` (in `.config`) is `n`, the target module is ignored.
 ///
 /// # Examples
 ///
 /// ```ignore
 /// # use kernel::prelude::*;
-/// #[kunit_tests(kunit_test_suit_name)]
+/// #[kunit_tests(kunit_test_suite_name, CONFIG_KUNIT_TEST)]
 /// mod tests {
 ///     #[test]
 ///     fn foo() {
-- 
2.53.0

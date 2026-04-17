Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2578D355803;
	Fri, 17 Apr 2026 03:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776395750; cv=fail; b=SrSxLA18LzAM+fy72GUZek3SJx81Pytxn5soHZP1LthNdX9HXGTZcif5/lHVKFyNMgsiJqWYmsWZ+pHH+txquZO4/N1PxGLvp7mE2hUDqnMmJ3GGA2rNhjTobits/4qUWmngHbzhLBW61YFO1KhMzWMkp2tO9wSuIicCF88zNlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776395750; c=relaxed/simple;
	bh=Q8S/vb/HQyr2cUDUOTyaSas6UTH/kcx0vJCBTOuObEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f/H1WK0JANfe477xgUnZUiFMmh0rzUWOl9wHYNJCpjOYGSgWDyq6r3oj/ca9vMIRbCse1Izh0YueQTisKbo9qIuAh23hkFn8h06vLUp2r17uqF9YwVttn0JT0Tke08MIr4Nchch4zrvLuP7pl5XaxbBpLdpmQIQljsabnLYHCVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HQqZ2WrM; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HQqZ2WrM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn3lwtFCuB3cZ8oTgVeOrhPPd7GmIvXHOpuh0xaMT/UPifRuIzPYZfROBOZTkXzNcN5ULQJ8LhCVfAEvtzRT9eUcd3pvqwOhhBgNgHpj4yrpaZzuZGnqL1vFyCM1HZeSfm2HFogJ2CjrZgs9rekbCNP3hU/b/aHd5x1PUl9h6i+hZmTkgl3oO1gota6puuJIBitEKjbcr5E6gqvkvTa+OBQVSUWcHpl6kB8+jHnprbFAEHtQXKg+3GNTHdco3l9zJ7T+l7repERQ5yy+rlmniPjyPHvPReZleFj99M2HliG2ZolIxX+rYSJLv2g0cbRxhePBQOhPR6aU1p/Wac1A4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3Kn4ZjjjSFenQxslEbf8CsmDbwUtgd8OY5p2iwX8Ig=;
 b=U2uTab9ZJcTNbwWBzLLPomAPHIS/MCa4WTRSWkrjWuGUFslJBOp95aQuCGFgddMxVp8EOz/DrJ+mFsnta899IDPOpzpImAoU6gI9enNA0xCsmaaG4fZ/LFlgLt5Uca1WQko7sjYUYxLSuaarEQbvPjNIHCuSZ1rwAfEC4TVplJIEsrh4vb0OTTPYGcHpSYQBK2B3MI4yTUYpOaKq1PbPStmTigta3p+fw+5VRNyAKpaut4wOzKyAJ/9lzTGlr1m08RBrqv03+9EDpRxKHkubBrQBt2WluzRkmnPfq17Vk3vbZL2KsNQgGPVvjwI++vZOV9CNra//oXA5pH7mfrmKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3Kn4ZjjjSFenQxslEbf8CsmDbwUtgd8OY5p2iwX8Ig=;
 b=HQqZ2WrMm5T+/oBpoE4b+TlESJjsBqvPAsRtPrZXlGo/K59nQHDJ9gKh3Z/62dnDgZSM+qyJPtcczmVjAdHUIfJF/4/MyoG2+SQJ7d8rRJTeXQmEMJ1PzYqnJ0zw5qhYg6IEamOECaD7gyzOBPLIEu08Fsy0OO10dXyHO0IH/EBm6hRJ3OHCgk1fA31gZk3JiHvM3eyZwwqxud0XB0GNHzc+ReN5lz3EHBfg3p7IxfOxhSq91HJnDKxc9NQnQjrX+W9gLCOCTt/kH9KqU8j2JYuUvrwGhN1QbHCa0Tm5GMnDzAa79F96E5wCBMhs5WDUN0JCKFFqxA6vc54Xzf1ZWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:15:40 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:15:40 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Burak Emir <bqe@google.com>,
	Yury Norov <yury.norov@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tamir Duberstein <tamird@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 2/3] rust: testing: add Kconfig for KUnit test
Date: Thu, 16 Apr 2026 23:15:28 -0400
Message-ID: <20260417031531.315281-3-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417031531.315281-1-ynorov@nvidia.com>
References: <20260417031531.315281-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0019.namprd14.prod.outlook.com
 (2603:10b6:610:60::29) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ceee3b2-e5e7-42a6-232b-08de9c2f9aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OXh4wXqbvjTnjw1BMhMGRs9KdS0NCYbMHMBaM4BlYl7odyvwJ1QB8T4gLLkkdxGWQfOTyaAKt08C2myJVsSm9+c78GkhTg/6kqBuZbl+pjvB2MoIaFoyo+OI05gH1svl0T4s4+/WgH6lz1zuA5+ZfHh4D7i/TOvTkHuKf92uABp+DkSGKXc4NPDYF0Hfm6gHbAduQp0PcIeNnuDA4p/MbOSbiOs1OFiOrHh95YGNuIHzkjr1T1TLPV70M5BWUgvf2KFm2d31YUmUUXr4fvNPNj1XDmXISw/v44GDU7BA2l+EJPeCZCNRjyMvQN0emvDSsaWsDQ2rLaIakH/yO7MO+MJyh2FEiXmcXwF/FkPZc1XOV4X5QUuXt+Mhl6Wwh+NugQh89ynwjWJNfAbKoJn4virysAn8GQhGYmhHG5pA5aVGfMpj1OFksHl+Bgjb808ZUSQ1xOsLey/9TteLKGeHTHotcIei1FgCpAf2ssZqOWK0fAx1yT5uuIQXd6f1gc64T9AFXlgdOSkCH+xOtGqqyBpcJtUd6NPrgJZZ18CxYiVOR+Yo+OVri4q3lQhCoJbaD4/sG/ibO0A3lk3jVxP2tqXOPmYFS8CN1h4hAIf9Bg6LhrelEGJJwaGUDITdaF0wT5ZLaIQVkfh4jEKH5P9nmba376CZ6zt2PnZY3ztHIiB13nNaukKAAtwJO1sYHukN2VXTJP0ySGRxFbSN0hIFFXFyxraUCG7mWNcxodRmATS/Ajx2qMhM/RSaeADHZAS8HtnogQcQEOCE99rWjraJqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wbMYabag1reY4RFuCIU1yLwGZ5FKKz2RioepjWWlVcaIuubv6TDC31PD25CH?=
 =?us-ascii?Q?geoCl0lOmVx2wTJ9ESfzV+stONUxYF/lnUVwTCVakZHZljZJxf92O2myedfF?=
 =?us-ascii?Q?Xke4sQEh7jXcIhulmvnH6YRSGSSIvuZPhESla4OUaOUfxk74rDuxm05P/tj/?=
 =?us-ascii?Q?mSMBddqHwI1qcuTmu4qb55xGTMNdocakRdAJd22GjE1x1UWy9W/lH7Hqxclp?=
 =?us-ascii?Q?8vbTH9uVOG3IVM+Z7ou6TNoDGWBAZafDdn19+NjTcFKvBiPZmoYiqL3+QtpZ?=
 =?us-ascii?Q?DcrCNQ/FEt7JTyXzIvHWp/k1rr3+A7PhiX4Bnxf47iWeVnJWhIeCPyLI3opk?=
 =?us-ascii?Q?HYwiCHCpGkOy3Jgh9FwHGEenimQ718UGDExkgPxmavgHrtk1oZrW6IsFVcgX?=
 =?us-ascii?Q?+lwUFTGvSrHFklIeyXY7+ByFjaW82o+GjXaxl15ElmEV85gJWTMXfBWiDmzk?=
 =?us-ascii?Q?uRsAziZcivdr3CnoHycNTSVlgz0kszBGkkeMsLMXOlXYzeOXOdaTlLiv91us?=
 =?us-ascii?Q?yIlW6H2T5A6bV0jZhb3oJfeuYvC94tnpcarIaRxsMVXf9PL55sVM0hMjnWax?=
 =?us-ascii?Q?SseLMRfz92vO0iWtVg/LJCxGZqvlyXfJrkoZqY/gRDFoxVcP8oQv/ay9tqce?=
 =?us-ascii?Q?sc2vaL+QsRTn+XWlcd2N7NI96QkAVA5BzyuXAYzErNhB9roweGctkKQMZJn0?=
 =?us-ascii?Q?yx0mCHuRDXUmm5v2LV5AocrIzRReVXPhF7DHUjT/yujJ9sVDYvLTpHN7eBoQ?=
 =?us-ascii?Q?sYPwIYCxtd6AWGuV42+vFM0u9cN6onQIQ6HXrtiJd/ZU0fRm1CDwpbmy0FKo?=
 =?us-ascii?Q?0GhifEv+hj/p5qhvaM7B8/LnGPTyFRoN7QCoVlwGvrf1vMPC1NSL0DHViSNx?=
 =?us-ascii?Q?hR4JjLDhRQFTjhMJeIv5ouoCrQu57mKR/RSnTWlem1KxMkDdqDs2GSqT8aYJ?=
 =?us-ascii?Q?ZLPMmaixUhdGQdolvIhA1bGHLi+bBrK04dF2rpUw3bOZcO7ORprpYABWZfbc?=
 =?us-ascii?Q?S/3gICbI4yzJzFLpMZfhvOjsRuobFNnQLYT147xQGKcS/6RxzaD/0rWqOUfY?=
 =?us-ascii?Q?An24qZTdU1y9Gbo3gxXosj3ZORSvzcMuBSG6eKUrxxtepRY6KQtw+4lC+XXf?=
 =?us-ascii?Q?bkgHUfONSP5rVj+maDtd6/qW5eRCF3Ub/NTQ6t6XLpa43FDW/keHq/EyRc3O?=
 =?us-ascii?Q?Ys3A9mi07VEv5qijFdSVukntPyi1WwKHoD9FZ7m4OFdTjTtMvtWZAgk+w7vk?=
 =?us-ascii?Q?9a+i1cuQuPi/Zd7PXghdMSqSQ19UhUDnAe4XcKlmf+hyumd2/o8zkHDhCfjp?=
 =?us-ascii?Q?dQ3JP5Mh7RPnpBBpDQYl4VTL44ydTJrqafskhI9K7LHvbxkX4FTq2gFcm1H3?=
 =?us-ascii?Q?APMGEDsg7be3PwwIQi1tGhZn/dpBlbQYOlybeslXEuF5fh8RkeuwmKWtdbN3?=
 =?us-ascii?Q?cmcuyExyZmy0s5UEnkWJnvgKiOY+XLzJx+HSsXDqLEXcqZKS0kGDpHCw7xGE?=
 =?us-ascii?Q?VIFSXqW8q3uoFAlabgctTx74Ev5ecWa8K3zTy/ik3t8TOJsMvKTSaGnwKfuB?=
 =?us-ascii?Q?8uwfYijVgKXm1vFIgfEW9sCQl979BgXg1ITnrGI34bJhFKfYUQIiuyP4jHdj?=
 =?us-ascii?Q?9E3MCGSQsnoEALlZUHRVRcBhhf/KW9V0jPaH//u4kEE0CdDJzWmSNyaUknyI?=
 =?us-ascii?Q?eKdMd1UfpbSoeFxoc8CVW0O8vVwa/hbOked4n7tQ/WDvYJr7nt+SJP/N/D7w?=
 =?us-ascii?Q?RiN3JyhzDIswkHfuM0NMMglJfRBStAS51b65hDRt2fc1MifHxi/u?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ceee3b2-e5e7-42a6-232b-08de9c2f9aa2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:15:40.6476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/M5Nvel25GxX/U2De1JbykW08lpWsHINB7WnPvy26ViWDBpoRZQsHtK2Rin0hCAmnxvaH1lQA6XPpqtLbRD3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772

There are 6 individual Rust KUnit tests. All the tests are compiled
unconditionally now, which adds ~200 kB to the kernel image for me
on x86_64. As Rust matures, this bloating will inevitably grow.

Add Kconfig.test which includes a RUST_KUNIT_TESTS menu, and all
individual tests under it.

As usual, new tests are all enabled if KUNIT_ALL_TESTS=y.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
This doesn't create a new entry in MAINTAINERS for the Kconfig.test,
so the new file just follows the implicit rule for the rust/ directory.
Please let me know if the explicit entry is needed.

 init/Kconfig                         |  2 +
 rust/kernel/Kconfig.test             | 76 ++++++++++++++++++++++++++++
 rust/kernel/alloc/allocator.rs       |  1 +
 rust/kernel/alloc/kvec.rs            |  1 +
 rust/kernel/bitmap.rs                |  1 +
 rust/kernel/kunit.rs                 |  1 +
 rust/kernel/str.rs                   |  1 +
 rust/kernel/sync/atomic/predefine.rs |  1 +
 8 files changed, 84 insertions(+)
 create mode 100644 rust/kernel/Kconfig.test

diff --git a/init/Kconfig b/init/Kconfig
index 43875ef36752..4af544514e6c 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2208,6 +2208,8 @@ config RUST
 
 	  If unsure, say N.
 
+source "rust/kernel/Kconfig.test"
+
 config RUSTC_VERSION_TEXT
 	string
 	depends on RUST
diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
new file mode 100644
index 000000000000..a05243696a01
--- /dev/null
+++ b/rust/kernel/Kconfig.test
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menuconfig RUST_KUNIT_TESTS
+	bool "Rust KUnit tests"
+	depends on KUNIT && RUST
+	default KUNIT_ALL_TESTS
+	help
+	  This menu collects all options for Rust Kunit tests.
+	  See Documentation/rust/testing.rst for how to protect
+	  unit tests with these options.
+
+	  Say Y here to enable Rust KUnit tests.
+
+	  If unsure, say N.
+
+if RUST_KUNIT_TESTS
+config RUST_ALLOCATOR_KUNIT_TEST
+	bool "KUnit tests for Rust allocator API" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust allocator API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
+config RUST_KVEC_KUNIT_TEST
+	bool "KUnit tests for Rust KVEC API" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust KVEC API.
+	  These are only for development and testing, not for
+	  regular kernel use cases.
+
+	  If unsure, say N.
+
+config RUST_BITMAP_KUNIT_TEST
+	bool "KUnit tests for Rust bitmap API" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust bitmap API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
+config RUST_KUNIT_SELFTEST
+	bool "KUnit selftests for Rust" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit selftests. These are only
+	  for development and testing, not for regular kernel
+	  use cases.
+
+	  If unsure, say N.
+
+config RUST_STR_KUNIT_TEST
+	bool "KUnit tests for Rust strings APIs" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust strings API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
+config RUST_ATOMICS_KUNIT_TEST
+	bool "KUnit tests for Rust atomics APIs" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust atomics API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
+endif
diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 63bfb91b3671..0d3434bca867 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -251,6 +251,7 @@ unsafe fn realloc(
     }
 }
 
+#[cfg(CONFIG_RUST_ALLOCATOR_KUNIT_TEST)]
 #[macros::kunit_tests(rust_allocator)]
 mod tests {
     use super::*;
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae8..563c760c8105 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1351,6 +1351,7 @@ fn drop(&mut self) {
     }
 }
 
+#[cfg(CONFIG_RUST_KVEC_KUNIT_TEST)]
 #[macros::kunit_tests(rust_kvec)]
 mod tests {
     use super::*;
diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index 894043c9e460..b27e0ec80d64 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -499,6 +499,7 @@ pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
     }
 }
 
+#[cfg(CONFIG_RUST_BITMAP_KUNIT_TEST)]
 #[macros::kunit_tests(rust_kernel_bitmap)]
 mod tests {
     use super::*;
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index a1edf7491579..cdee5f27bd7f 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -329,6 +329,7 @@ pub fn in_kunit_test() -> bool {
     !unsafe { bindings::kunit_get_current_test() }.is_null()
 }
 
+#[cfg(CONFIG_RUST_KUNIT_SELFTEST)]
 #[kunit_tests(rust_kernel_kunit)]
 mod tests {
     use super::*;
diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 8311d91549e1..a435674f05ea 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -415,6 +415,7 @@ macro_rules! c_str {
     }};
 }
 
+#[cfg(CONFIG_RUST_STR_KUNIT_TEST)]
 #[kunit_tests(rust_kernel_str)]
 mod tests {
     use super::*;
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 84fcd7cfcb73..7468153429e1 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -154,6 +154,7 @@ fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
     }
 }
 
+#[cfg(CONFIG_RUST_ATOMICS_KUNIT_TEST)]
 #[macros::kunit_tests(rust_atomics)]
 mod tests {
     use super::super::*;
-- 
2.51.0


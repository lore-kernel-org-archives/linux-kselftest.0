Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E65A3563F6;
	Tue, 18 Aug 2026 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066617; cv=fail; b=CkFIy7IQsKuUio7vh1utIB8B88ozXj6eSAuP/aEYT1OUUXazbMhBoN+crbIS0VszSaX0Upw3mhexHlPmb5ZFL6fbEZUVkqtWfTdR5j6LYD0nSzcMgemEGlCpJ16BSpcJqcGtYHnoqHpZ/DmYj5esBv2zWmw512pSjXGLfA3Q9Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066617; c=relaxed/simple;
	bh=avBj9T1KpKf8xPs7gNbJeGWzxyIcmFuL0WPm9hGp0Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=L83PggqSRYo0SGZFsPhvabWuSTfD+8VQ0OFgO/DNjEtCW07sP/hIXvouBIsORM1tdDVFjZRQtRPDO6thft4ctMmwFcl+eFV/InUlqoYh0oJdBQ2cMtfjn7+reSIQ1N1OiKBD9J0Sh+/lWuc04hg7htayC4c3Y0Yk6C0p+c5paN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mmU0HqOS; arc=fail smtp.client-ip=52.101.56.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mmU0HqOS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAsFl/+NrEmiEkq9QL5A4wEri93lbur22qvA3bVrf1Ui/16cJwKGe/5x5IJLxgR8C6bbYdPKPwy9UkVputWMLXZ8WPFsq70Wyns0tIeyVxWnT3XM5v6fEGub4p8zWb04i0YFSOfJNLG//VS58VEyy0+8K2OqvsHrmZilMZIZRtvXvEiE9Hk5bkkAjQKIya42WVpyGCRgC7sWiOatG0YaD4fzSgemMHi74Z8iohIyCzzGpYFSxShpVV2RWS6Ctb4rgHUsHHOoaxIhDiRegQYo399D6I39Pal1Re2P0EXIbj+LnSKQjFU2zWlM0XIC4h5hrt/q7AnWN9KBh0ZZijJMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpt+aSO5hJ8cqoAE7KPRJ0UOcAcVEjh9n9lI6o7ZW4M=;
 b=DwXqZhe6xLHdS8q1Da2I/vQ47nj0qG9AnT8Ew0RfhbFgbnGkC7g/44b6+oEtM16ffzhRIJK5GAfDkkdAVPP5zcH6QxY5Vt1SFrIhFF9BqFT+wfzxCCEysLfTUoK4qQlZZE5fjxew7R/pSVo99zfvj3vg4yRllDXQaYoLPyWt1MChNmT322BoAiwWuD9O/j+8Oezyn07Pm7PY8Qenh6z0/xqcuSM6a3FZGxoXzwfqYGRCt2hLYS7eN9bJSMS/7NiU5RQ3DdTldep33Jd4ZjQowjxWJPKr0+YMw/eSwhx1RvwC8SsGFJd2vrLqNyvyHRcSnlVBWsKzk+tQuPumlryxEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpt+aSO5hJ8cqoAE7KPRJ0UOcAcVEjh9n9lI6o7ZW4M=;
 b=mmU0HqOSXg9mJDrPgqaFk6s1Yei5v+JJQIxEarsgBUEx2RELFJqe685SHLvX7DiG/X2FqoDjwmcuRDwBqhj7l3P4s3toa43qavJydoPLKikbbohtybq05Uji3lvMmXoAyyF19wwteUplnpzPeYJYvMhntrlf0MWysV1ONaXHHVn0hZigpueGr5420Hbeau/i+Oy8VVKSI8tHDiyv3b1ESPrsmaiPeLZSpNqarPjrLc7DbchSVkHdx9HKW9Gd/ESeO2cyaqNji/Lp11buiRyXN22fmPbjChV4Ux6KsojkQaQm7+KBdxlprN1kuRD2tJM344gFNgAyXZJRbEiLYU5eRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by IA1PR12MB7661.namprd12.prod.outlook.com (2603:10b6:208:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 15:23:27 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 15:23:26 +0000
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
Subject: [PATCH 0/2] rust: kunit: enforce test configurability
Date: Tue, 18 Aug 2026 11:23:22 -0400
Message-ID: <20260818152324.587932-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0040.namprd04.prod.outlook.com
 (2603:10b6:408:e8::15) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|IA1PR12MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 4909c5db-161c-481b-61d3-08defd3ca67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	uy39QH/0QAST46qzaMLL0pVWMp+hah2mat0Kpd3PhefB5FWD/82NW3nuGeqD0O5b6sP7eotaFq6ls6NIklc+rVq/Bp+FvUlMzosXMPLhGdB9doHHKY2b8qeeAuyUAUSWaEPeQvQP5/eTd6lnP92w0xjpZKMJiVArIJeP7TKaHYermflm8C05ifm2dbDDSPBuJtmXNyW3NWhV3C7OUNhfOwpjBpi9YH8IqKE+6sYuMyHiE4pIb4yjf/HJzMe+CtmPC6yuWoMSMeKbG6mJzMa4EBZ4OxfHL8d9UXM52v6a4cyPp4jrZ6ZUU8T6S1UFkGZ2BHp2FMadNlmEFN0pkEsAX0JNP+5ZFX0jqhetAFjBA0n55qlJM/pJMYD26R1fsrOSBBo17EB3BOZ/F6WBLCivjB5rkgahWB9O3KpPNujxI6xdyTYIZIDBEkX+4Xn21uV/mFmJLnMIRW9ut73bMNOh+/a//0J2A3GS4FhvcKObql9oXQFUIjvQF8QCY2ScGykYX2qsBsmKt4XA3IV2wClhiO4Q4NFJRxP1ZipuT1LdlYmI1cGjrMXfATUN4oKtwIIyHjrOtnnG75JlHVOrMKPDh3uuAwBGG5W+NpWzDY32dpkLNkRs2isEEX9IgEpOQCAxQiPL8AeFTMxj+MjluMwTkyPBZO+/BWvvK57hvgvObIU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dVzyHsQxERlsA+6Hr4ITKkJHTY0Lo9cla7y2u0K9vODeIz+BQqbsWSe+YU9X?=
 =?us-ascii?Q?iodmVwa/L4OjcXkcNTOlA53HY1uPi856RPCOm6LWhvRxyyWBq7sOaRnf6auO?=
 =?us-ascii?Q?O9AEshN7xaSF5sfodciWk2Fb8cogL9tLXBnUNx+je1cLn3GZpeX6qcM/y1F9?=
 =?us-ascii?Q?SLmkYVrzV/UukRwmDmrtwjfGoa/z2QoWSLUvaw46+FYJKv24kqJp9JUx0Nym?=
 =?us-ascii?Q?HsdQvv4KbTmgshJ503wkRcTAylUzWZG1tLWoa6nZX3fZGX5WH1nFOCaV6c8V?=
 =?us-ascii?Q?xe8ZZqEStBcWe3qRah1SW3ylEZZfEa7hrNDJbp0HBDnUPp/fR5aBBbJpKx/8?=
 =?us-ascii?Q?TILd95vi37dnk4JVAi2lvAwELxhEPg13Fw7/CTYj2BCMceobq6KtttfBegPB?=
 =?us-ascii?Q?VZ3cGxJV3MOzDGI7lBt2ytJ8YxZ5GptZwv7c5iGI1ItFtyzu8pKWuQYKxDP2?=
 =?us-ascii?Q?B0ST1bz3BSZluvovO0ztltJAKifiFb7GwLnUuUoBnKQ25bEmofeqNIIetQpg?=
 =?us-ascii?Q?Rzlqa1V1Ph7FlnG5BV5UvhKILegYpPPo8PTxPYYmDOhr42XfFSXIWwqiGuQ8?=
 =?us-ascii?Q?qFyVZRURrh7VwzOK5wCw+Q/xY+52l+1K5uiQwvXSVF7/3B1q1+0DVDMWxUOx?=
 =?us-ascii?Q?ld+UZKALwFljmX+fk9X2VNDqUr1RSOmTJX7ToR8TA8iV9Nb8aIEc+UFpAVsz?=
 =?us-ascii?Q?ocHmkUSXaFvDkNfEl5S1CFOU/liSNquV5jfuatST9okOfGN7mmURLjEpJcmT?=
 =?us-ascii?Q?OQ6En/aZ4UOvQyvalOqH+prUBM0S/82m2eZESqzFXVlUMrgDDB2OlKjby1LX?=
 =?us-ascii?Q?7WcfLmWx4Ayz84IuO/C08Db35QGjyKvbFrj/cgIzR+r69C6efdvuWoqxBA9R?=
 =?us-ascii?Q?821ULzyWVvZmdgaz+OJwhGYpn9kPFUXoLQzWd0SlQJ2oTHJsZ07oTHrX2tXI?=
 =?us-ascii?Q?/MiHL8YlMYzgOfXTq7XqCQW/0LlXAXB1fbneDJjj/aEcbMM+bgBh2tPY/m1x?=
 =?us-ascii?Q?eAXxMTbx/eWSN+lAzuPyp8ySPRE3C43JUirqbS8aBqYpQY/0FL6RsTk7sMrT?=
 =?us-ascii?Q?FZEID8xsYmY9GU+k7mpWxmWu5mdapZbXMDT3tuqMGTfC7q1IjoyxWx6gBnSZ?=
 =?us-ascii?Q?TvBPJsB135TNP2060KfZPAqoJDa+8iAObL8qyjRUB/9dwzkiYeBFjWyLyK/Q?=
 =?us-ascii?Q?yliL3iGYoJyRSxNEskLChWdMZW6x/tca1kzFhzCP2atJGlnyphssPf+lHE2X?=
 =?us-ascii?Q?PA6ybXHaFA2mj50Z9Ji6l/yEtdsIavL6N292y+w8kdbUTFj8LFZ8VRf4NIAg?=
 =?us-ascii?Q?tjwHV8nbNIuB11bAnKVSscdsRaZJ9TlQSrng20gsPDLGzUdFvi8FV69AAjL5?=
 =?us-ascii?Q?oAfocClr61H17BoRU+VD9j+/r1LKYJslefOwy/upL4CODWui5Y2UcHYEBUBK?=
 =?us-ascii?Q?Wy69t5IPEHaPjN9mgs2Tglf/eYTU22nhNtPfHMnZ+Ahljm8r+//QuxBRol6J?=
 =?us-ascii?Q?oTAYhxJvRDv5svUzldjjsq1ktJWUTlWbLY7f8eRtlTt7z/UCM7kZ45Xipu5m?=
 =?us-ascii?Q?RT04iRExBav8BV1MFCfbsxcO7vE28Z8xuXB0pvx5iEJwNh1ULGdghLa67KEI?=
 =?us-ascii?Q?FjrrBVpDJHLciXRZ155wPJd5J6aSJxaenwDSEDkFxaIFtgFOjXWNJv2ZMdtk?=
 =?us-ascii?Q?MULqCz6JKLhR6Fu4YThBmUZD8WB1lyXt8OoUOpHoCHT9mGdn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4909c5db-161c-481b-61d3-08defd3ca67c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 15:23:26.8746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmAnjVRNN0Ev51pO+B2YDKbvMMiLMPSoKhY5MkgSPsWjCFvBYIBM0iHPdXT9M4y73HxP4Zazq1HUQzwB7Y3feA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7661

Make every Rust KUnit test suite require the Kconfig option that controls
it, and let the `kunit_tests` macro apply the corresponding `#[cfg]`
attribute.

Most Rust KUnit suites currently combine a separate `#[cfg]` attribute with
`#[kunit_tests]`. The macro does not enforce this pattern, however, and the
Nova continuation suite currently has no dedicated test option.

Add a Nova Core KUnit option first and use it to guard the existing suite.
Then require a controlling Kconfig symbol in `kunit_tests` by moving the
guard into the macro. Update all callers and documentation as well.

Yury Norov (2):
  gpu: nova-core: add a KUnit test configuration option
  rust: kunit: move test configuration gating into macro

 Documentation/rust/testing.rst                | 11 ++++---
 drivers/gpu/nova-core/Kconfig                 | 12 ++++++++
 .../gpu/nova-core/gsp/cmdq/continuation.rs    |  2 +-
 rust/kernel/alloc/allocator.rs                |  3 +-
 rust/kernel/alloc/kvec.rs                     |  3 +-
 rust/kernel/bitfield.rs                       |  3 +-
 rust/kernel/bitmap.rs                         |  3 +-
 rust/kernel/kunit.rs                          |  3 +-
 rust/kernel/str.rs                            |  3 +-
 rust/kernel/sync/atomic/predefine.rs          |  3 +-
 rust/macros/kunit.rs                          | 30 +++++++++++++++++--
 rust/macros/lib.rs                            |  6 ++--
 12 files changed, 55 insertions(+), 27 deletions(-)

base-commit: aaa4e12f32b6552db1469a796312b25a0def7164
-- 
2.53.0

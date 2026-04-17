Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B517F350D74;
	Fri, 17 Apr 2026 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776395749; cv=fail; b=d/m2dHRvpApuxGS0WjG+37nW38gBZnxH631jHXutN1HrV8J0usz22yUfxsb7TIu4tWu1ZOj3JPb7vrI90uWmrElI7jo8w0kON9sWwh+358Bv9rwm+ez1e/qR36tVL/FmpZ2XtO+D3QQD1aiYYCBtDcE0TcoVrVwb9LvOw5hvrhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776395749; c=relaxed/simple;
	bh=AIMdhiBJnNHgCMs2E1iR47qryv9V7WoeQG53WVWkIlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ULK3I2ZmNBfbjnlb3PIo+YbaSc6zAhGO2SjCry3Vhwr/Mc9DE55XDzeyZNw4eng5uj4+zv98huw3cLwfUGGnOO1YVgleeXyO+9x7PZsPr2k4d8bZqk3Wlwm/spWs2nnKFpOmUAwJfdbIGKGadVfzt6ONbWkT4PwSpX3RasYqu64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QO6WlhY1; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QO6WlhY1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulVlyWcGb41gjZDBFSbJC4cyb7EtnfZH8VLt2sheoMMsHF6awhOxD2zmNsB+f3m7rBu94F6OoST7Epua1ZnvnY05DbVIjRncuqUO+CufeJJKARIsKnBkk9LmXcuNZoHS8xeuelWEyxKaCTUsrBz6c7L/q4fdkkiQdU13XMc/Ykj6nkqVxvDf2LOhigMYhLOi5H0Ea4U5xrqmo3ExgVhfwoxYmpzNBAfgR6lv+8Meffanx9Ub+TtIdKtYuN+2C/DumfMHnHQ8cpvBVAghNsaVRbc69YsifX2H7PGmdphwxOIA3AgjfmcZG86zGkbYQaT1x2bwUtft4G3Wg1gy5wu7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJLF4GutWDqwTFLLEqq4Za/q1LrMK3Ep2Z0S/VcYVG4=;
 b=r52/YQZS/mPcFOkv3BTUaUKI+shRFHotM/glB9i7HyQS8fdVJ7dMmQLk6Taduypmo9mxiCDtQxBLwvfmBtHo665gAXL3mleK+pXXuQRk+kZ4lBbOXgYqlMQk8TBCsZ6Jc4eaLPRGkCUrV2tbJA0BX2VmSqR1TmRq2Jc0cVBQdrnlL8ABZimGW2SoVhWHtfGlcK9eM08tOa1EAE9vU76KzNkgFyQg8Jsjdwpso0in6j0221cNHJ5HQUjMli6U/vV7Y4Kibx/q0p4HAOlReMPoEhmoChLaFRPg22tKBuWP5Ni81LlMKc20uyHk3LMM6DaCgPrUBf5aphzJCUjDbNj6NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJLF4GutWDqwTFLLEqq4Za/q1LrMK3Ep2Z0S/VcYVG4=;
 b=QO6WlhY1Iht8Vd5DEsq+KRDO3DuGooQdjNtYzXgjntsfjXAdj/l0y7R/YyNI+klLp9i1o/7j1Qh/8byO5uoxxihrjflruSdGSo6dmV2/cS32hF1Qx10GMbVIrylybvwth8lYKjycu9KirtbNHNTlXCTnJuv9WwYPk61hLRkMY6sFnKinsYqyASkI3RFpo1NTdBnCRlQHjG1VTDz97ZEHs2CqKhtxCVDXutX0DrvwbAX6qxL/YduQIajfuSfhGkY+jpTfO2wR27/D33Yx3ZMcpWSQR3lNB8EUMXhX24VVzO58x/2ny21vkM4MDvkVJkMe4O2OM/9KKYZAGfxyCJIkVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:15:38 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:15:38 +0000
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
Subject: [PATCH 1/3] rust: tests: drop 'use crate' in bitmap and atomic KUnit tests
Date: Thu, 16 Apr 2026 23:15:27 -0400
Message-ID: <20260417031531.315281-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417031531.315281-1-ynorov@nvidia.com>
References: <20260417031531.315281-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:208:2be::34) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ad43d1-b182-43b4-df1f-08de9c2f993b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hAgM4gZzJmCHIZuAU/prwagbeLSKhffpB0Prn3D9/ewlqfFKHe3VHwQ1RS/mNprS3nJaVw2FK2ci4Wd7+y7kdT6qIdxLUe3diT+ivT3QXkaIl4d2M56WqYgy3nCYa7DjrW9ajPxIhoDFUPpKP8ObsHO97ByWV4RKmJkYyxwHhd5f+FYVlJ1m/+RYfu6RW3/0b/vYQGr3GhA0IqPm0+2xLcod76f61dCdfPG3zhVEkdrNVz2085MasCTfZIFeCwSWr2a5k9sGiihrwdTEeXlP77n+QwMh3+UHlj70VkD3IDF7eofI5bL+57IrXV0ZpwzVOr5XDIRNEfcF8KmUBrY26msElG5aycV9XoPfKNTAFIzmWXpzK3NQHHmKguHSx3aJWwJQL1fcXRsugfMJUA9PsuQZJbTGH8zA1hjOz5YuGG9zFSPuUi5YJ+W33/xrr/3nd698glr7CSCVuIY7qARXoVVghisJs/w7iGVJGLVFtOQZ6opSD49rF7E9nfCFVpG76wMK9skDoDzQcMwOZMc4kPObzVtkA/Z1Ez5Le5AAsFoJS57mY6JGdKKZYtMu03I5pivLjb6FE3jHDKkusC8NwxtSyoRwGNwqky9OBDwCsa8uOQAyS+1Y75HR62zz/UH9lW+ar7HmOrWc5VO0bQ4FhNAvapYs+wXn4d8vhnJhOXeKHsm+LSyetiVgcMK7zkM1uXCJUVYmgofdZm5yvaZCuN2JTzJ2e8xbHVhN07BsM3MYftaN8PR0VkpzO+oN1aJlX4MlyUfNDTKKl3nPcCottg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oLVpcDVJWbHBETtSVj/nCNqg918waTcOf4sE/jkIsF3pMk1uwQwRUtuu9b/q?=
 =?us-ascii?Q?gyHpz+IRMKQBgyNrQg6oaq/62ZcvG5x2xfXZq3zRw2x3cOwKApgnPaVg3e2V?=
 =?us-ascii?Q?LFOWLjRGQMLRpC0lQR4DWWNK1LDH3GZhsIu/UfiRcjIWxXLM5cFmiMPnPn7l?=
 =?us-ascii?Q?kwpSEKGs70M8skXMoCfaN89AiPStf2TcKJ+U5Q76Hg+1mM9p1M4/PwA09erM?=
 =?us-ascii?Q?14yn+uy8Qu3fRQiyG834kzJl512z90T4KbIfOmVFvpqPNjv46kcZkHtfDW8j?=
 =?us-ascii?Q?XSQBswtbo71L4ypts9UdGZcyD2Ftn+dAj++INDv/DzMCLBeWjdwgcrVK3ZQR?=
 =?us-ascii?Q?OfYdeRZ7dYCN6hKqw5S0Qre5q2KmRnT3cn/cNCQbCwgF04rbe5Hwy/0yL0TV?=
 =?us-ascii?Q?fPzUi/SZlbHEK2t5lq4GHSeOdTS2c/j3AxNlbNj0bO8ygGK/RPp7V/nqoaC4?=
 =?us-ascii?Q?UjV7B7TKKpOV2gfFzUKMgcrHnv18WZNbYSyoxHHpAAqPo5l2MmNetjisUXre?=
 =?us-ascii?Q?pgfRau5c3jn9dByKAD7Wh2LhYI9dMeFZYEnKJ5eDgcaqeYOH5fd22U+hK5F4?=
 =?us-ascii?Q?f5p6gMdJCBeKu1v/wvVRo+Z/3aoZgbX2XX/PR41ZnscMXAgGzxBBbQBXO5qT?=
 =?us-ascii?Q?o3aUvbjpV2lBwqsFj8yWR4EvsE/k30oYOnpoNIz2q+JLg6C/Z94RAtDGq/WL?=
 =?us-ascii?Q?2dVEvzySK3+m5R3RMyvseG3Knc7gz92VjFjMs9VS1kaDQY0sP+K6U33f2Lth?=
 =?us-ascii?Q?DuQzDzWAdJ03mluFuS2shvr3Jzm97+vmPZ3S4VipaBam//dHoxoB0XirOPPL?=
 =?us-ascii?Q?DGnQL4MwKuyj5TpqpepI8t4B1C1GticNAS3dTB8Sl0umOZfu58X4Yhh/gt1P?=
 =?us-ascii?Q?g5/cdJE5N7iGmOIhOgXG4/kRl8ckILG6sZ0+Y8rkfU+TPvzDMldL+oWeeRDH?=
 =?us-ascii?Q?IW/i2efKf5lsS51TlxJPY1vriKhT0lg1/hsJwuJc19NXrYd+QUZK2tnMGxnJ?=
 =?us-ascii?Q?OoQevvMDvAEFZ2A2qCheXrBe1Ppqd1iPdN0eqLLVwgK0aojepNfzwDCOmtCA?=
 =?us-ascii?Q?DSfPhZbZT8614xtafIYT2HdlxdSKDZ1iNn+Gl3xdeGnhinX6XcahAqPxKSQ5?=
 =?us-ascii?Q?elNghN95aTtv2OO5lvBtXnEeJxnqJ5QByelb5T0VNLdQBWQrWTRE0MUU/qaF?=
 =?us-ascii?Q?MHgw0MCrcq4wpW7Qw9EVSRrm1fD96BX33vqoKLgseeZ9malIzN/iboPPszjY?=
 =?us-ascii?Q?I2TNqbI+NSIkZ7lrf8ndHQsvPV9VtyGamnTCsemNRmOsfnoxnU3hV6gbc9+h?=
 =?us-ascii?Q?YI9cJvkkIupiGvOwBtGbvKJD3kny687HxH7CoEGcGt5R0l/srh2LXOp/lMF1?=
 =?us-ascii?Q?FJsnHmjroE/9kH+9KiQMqW78gI+UP8xG6oBMr2GVQf12+K3BYLIc9GUQgnju?=
 =?us-ascii?Q?NUJFNztuRV9uweoMw47S7SpweI0yfQKaDbsnUtsq3GUX7hwpnQCefQwIGM3V?=
 =?us-ascii?Q?o5so28ap9jQPQyMPiAmOPz76wtnCbWoE/K94rTC89BwOpBwjkjj9tlZWQADE?=
 =?us-ascii?Q?sMd+DMBBY/Rn5vM/O7LpgGNv/CMxoRIt0ZCob+UQRoVWqBcqTZoyom3ghU9h?=
 =?us-ascii?Q?o3VVjV0kSarXnmb77AXB0rOqaJPKZ/iPp5qDUIOlkUX7+PfWiSpQqnlAMfvm?=
 =?us-ascii?Q?M7+i4A6HEZmwkLyfRtnE7u3NfKeiUTsh1Cii3UdAYC5YpjXyW8E4WI+m6hlC?=
 =?us-ascii?Q?fn+PyyUYe9gD2P00lLjhRi1nCiAKGB2fgUMZ3nogtcjH8QyMq/AI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ad43d1-b182-43b4-df1f-08de9c2f993b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:15:38.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywzg1oJHh9EpqzBT5aDN7MmiKsrimbDxL+v/x2lpxwBYCPoBwGTAu72TCWshfW5lxstBZbdWKc8c+jFAYw7gSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772

The following patch makes usage of macros::kunit_tests crate conditional
on the corresponding configs. When the configs are disabled, compiler
warns on unused crate. So, embed it in unit test declaration.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 rust/kernel/bitmap.rs                | 4 +---
 rust/kernel/sync/atomic/predefine.rs | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index 83d7dea99137..894043c9e460 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -499,9 +499,7 @@ pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
     }
 }
 
-use macros::kunit_tests;
-
-#[kunit_tests(rust_kernel_bitmap)]
+#[macros::kunit_tests(rust_kernel_bitmap)]
 mod tests {
     use super::*;
     use kernel::alloc::flags::GFP_KERNEL;
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 1d53834fcb12..84fcd7cfcb73 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -154,9 +154,7 @@ fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
     }
 }
 
-use crate::macros::kunit_tests;
-
-#[kunit_tests(rust_atomics)]
+#[macros::kunit_tests(rust_atomics)]
 mod tests {
     use super::super::*;
 
-- 
2.51.0


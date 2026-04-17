Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA4282F05;
	Fri, 17 Apr 2026 03:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776395747; cv=fail; b=Qq63PBLn8+g5M9ARL3mIe+UU9wp3xcudHkjKX754dtf0g2mYNdLLepR2Uzy2FH3/p8efoA/+LGOYaVrTyZvTnDo+xPwfPcV65ycW7VZDfaWLFkzbPOvJQR/00RCu6zSz5U//LEP8QlyxGX6OwrOuCICaTYFtDuvmhk+E1bZxQD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776395747; c=relaxed/simple;
	bh=7TdZU9G1o6CI0OmqLm8EuTCBLbc8L4ayNZjl11DM9Po=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uUN4GKqiElrb12qn9C61fF7az/hFZ5mIa7QMnIilFq8lIxAaMiig82ZJbKlFypJeUJlzQPeXH3qnp+jzZ+MZJGxy079YrPkefjKjpWI3PONBLwQ2QCCgIgis6Qs13SzltNGVyiYrxVcBGBUr8q3hWxFTAjfgQ5/Zam5JuhzqHJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J5QadiZs; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J5QadiZs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0+ypoRirwoyVHT/NALDVQZx0lEYTyTb81ylUcRzSHC1USo4YFUsPEiRgsP2mmJ2PuPBaK+BR07+4byQq+zvJJV+vKELWMEJzn+mAWJuBlLLQBgR6F0d+Pfi+jkZiDRROX8PgTAMWHmldz6DMpfGA0mL9FxRI9tvdZHUsiGabwmOedXlqNkR/Wd+frA9FUoeBhuK6EOcleiMUnsb+7YIYxMclzE7/gl5zSVMK9bC+U29TQDpkYCWBKlNAfe035t3xuzmbtl27tIABLpm4lnwFR/AQxRp8sJ9ak8aGQoJukJWJ9RA9VaWwWTfK5DdWTPp3mpHPDgSGjHriFWgTggnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sXHPmKMajO/f+B2Gb79GxmtAl1NEf5zp52EuZczvUA=;
 b=jH0jkRKkmbk9HMdgSM3D3wYKUNHmzjZfVAP9OFdsgwPaOznkN1TLShKH1DdUEjMi9KoTtZyk/B31kZ/ZnLWP2OgXDMADJrTlhbUjXD0K7nLjpnY8llSWVTSrcP1yq50s9FDvBhK7Ci50edDxDtvo7t+VxwSYjVG0uElI5gU4crK5q8wHlRpacBVxYPsjdxSCyheJj7Ais5MqBtnTHeZ3EtPGWNtJacvqJKKy9JDcWxihdclaMW3T4kf0zpo0Yb8VP7hMrSh1tmUbJcsBANojo5En74RtHb2r3LhmbBifCGkJ455OIU/yAT5BiZ/817rhkuDJ8OSna0bdskGKjFTaPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sXHPmKMajO/f+B2Gb79GxmtAl1NEf5zp52EuZczvUA=;
 b=J5QadiZswoL39qPQJ8N61QqPsrAVF7/BGI1B/8UvExhUqvWOJS0J5+Ru0LKvNSYg9CzKew7ZZLxdXu4GaU9bfuhmCQERsLBEPJfXoM2WsKaYzIyXYGKJKRPWTgtkbMENjWDzQiCZ/gzBEoo1upaaQS5XHIV3zb8CT4itzy34FyoIIXHwMsKgoibMLni9EKPU44O+7lH/IMZjNMGEJAGkZkao94cG9meHokLOYwJrL9e67YVDAMJc4c2uyHbZ65Bpeb9Yybc/UciMbtqDB4Y5mVjS0AnxFsT6JKOdetPcW6OEwRtDXvTHNCd6Fmnqva+hPATpnIEwe7zcoJMOFASvFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:15:37 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:15:35 +0000
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
Subject: [PATCH 0/3] rust: add Kconfig.test
Date: Thu, 16 Apr 2026 23:15:26 -0400
Message-ID: <20260417031531.315281-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:610:118::7) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: a86a37a0-8954-4e5a-a347-08de9c2f97c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Nx/Y25Q15PTjgePQZpKmeo0URKBy6NLqsaDFwx4OqoUjLVXwPdKX+iQ3yBBZSAyUVBTtIx4H1J/RWb0hdLm41NMFDJ0rs21zZhaN0uHtt7NuqKp4P6MOPiOMFiehDhaodJ8gcfI4QE/b0gSCnGb/H3fjbmV0KWYnDwtYWtHkUhQvizmC6e6Gr9YUuqK+zsqyDWBX3cAujxcH7hWY74csf1zKAw3tDtjbLIdsv+D0YeCdc89+IUxCTM0BIluW9I80ZGSfzaJwqedCjppAqhwJoWyDBrmwHVcfd4Tt0QOHcP+gnf4m56lvlu7cMUF4fJIMxX4UZ1Gh/NQxVcIFmLFhKlSNPcVlWGI1XESwJMA1ku2gAFAnYM4lSybHZz3LtF9tn4DZ5ixrOZnXKV/xV5SAledWiABAwW94UyO/Z3H3a5wjmHK5kLb270pM+Zz98UDxte177FqS4RFYZvtwxQzMpa33Cv+L6FYfKf4FBLn8ea50jzdTE0UMstA+RAeAQU8hJL1M/1lImlcJSQ7uBDAF5ZzN7MaIgEOb6ORVh6MPGN8qz3Gg3G+ckCli77zLIqNWDvaCFCr82v9fblbctK9YNToQ4MEEz+mB8wH9KXV9gCGoE5WgOyrajdIyuKCqZMjASsKEdYF1pN426YDS8Sa00g2ZjvcPyJ8ZP2YiCmfxIakYpHZVcXFbzlabXpp9ZOHBDe6knrEcNuNrnQFzqJwrCUB5VsR/Kx4ud7xXOyamYH2Sn8IzJc4WHAj3b/lKaKkQRCY9CeF+TzCkOTwWkShCbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W55lktk0xQmgd+xh5K4vu55wpkBQqMMikZO04ZqzH/B9r3e9Q/Zv09u+0vic?=
 =?us-ascii?Q?k4tuOp+i+HQ3aVT1Uwmx2lcF09a6tsNCJm4WvhiMZK38xBcpllmuTAhEtZvg?=
 =?us-ascii?Q?X2bqa4W/3aS+MX8nhRZQk6SfCdBsA5AR+R2BFM2BGYXF0KRa4Uhscx2bBZ0f?=
 =?us-ascii?Q?GqBMoTN6cYKhRzQ9P1hVDvrADOWqWOQIgqgzdaLJeku18oh0EoX5LBx/XLaK?=
 =?us-ascii?Q?zRwGQo8AvQWZhjQ7mR7ydbP3ItPAIt9OzUxJkE4R79hFOQ11uE20Bb+7xiZ6?=
 =?us-ascii?Q?BCNVOVha7lnNdhMNe7erDNqcaeiJGzw5dfUZFkrh1Jg9ev+K52dqLJNSKRBC?=
 =?us-ascii?Q?1lwXy/F0jwlA+G/kpFiIIa7XXl2P1M2Mx02L8QyuowTxC0f4nNJ+2Vi3CrlO?=
 =?us-ascii?Q?NETShVIg5CaHaqnBFWlIRFrtSrjQdeZPSDx+ofM+g8tHcO3KWjbWAAKCVk9/?=
 =?us-ascii?Q?qh5aoLrVM15ERgqp631ik7Jt3zWWLE2WHtPiRGduhmaOMLgEQiXMnd+psQED?=
 =?us-ascii?Q?gDzXaODnKI2vcEakIIIHGzZfmPeOgiUb3gkPZkGYPA4r6/MJn//foKLdR8tQ?=
 =?us-ascii?Q?cJ4w6VCn3Qsk2LZfpvWTSgWNXRkYm0UupzFRf6hpMUTjMmIMUqmlqJbwwkT2?=
 =?us-ascii?Q?6Wzl6bkQwh0cJa3D6FBWN2VGgouf1mJm3CDtaOJwnoljUzXyZqijoRNlBrO1?=
 =?us-ascii?Q?T5C21pDKEh51BYhGPbffia+TpsglJlNla/LlFU9gE46Wlrl/kTBitL684Yr1?=
 =?us-ascii?Q?z3G2xgbE2us/oOQ/1YLGWt8hECsL/553IcqwpUVfZLdtA3T/w+fjbKneeGdg?=
 =?us-ascii?Q?6wQg4emQPllXfugOv4CizitDl+W7gJYPiH7S1ryQtj6bzjS3JFA8ih9MK5Gv?=
 =?us-ascii?Q?fOroX/MMgd6LQsKO89ktfThEJ35MeT25yOuhQLfSUvPNRZVZTtN6j/gjVrGH?=
 =?us-ascii?Q?EYlHtMZU47CO7nAoYxQj4HgkH9LPgvpDu88mYdOwySpbgvmSXfPc+f58G3MU?=
 =?us-ascii?Q?3/xpKpPLDPlyqr2uUsi/Jaw03eKYXMz7AsIs4ySMG18Xsh2R46mxak/2//ws?=
 =?us-ascii?Q?t9An/Fp5swPQkneJpDP409G+OCcn/bdDozxRlMQQAqc5MTYQLKOQ2ZedSf9t?=
 =?us-ascii?Q?XhE8WR6mvrzQCJxkPlaZiCD/M7PwdX/yudJL6arjCzpHa972m2Xkez2AlEkX?=
 =?us-ascii?Q?M1+95eCLbcIz5YIIhNm94LrZz4QE7cRbYYD5EofR/LixW2avhrPneMfs7Zg6?=
 =?us-ascii?Q?Qbh4zepLyJMcrF5Qxb1WXY9InaiCuV9I+U/R6vBN+46v67ghM2Dmo2Us+mtO?=
 =?us-ascii?Q?XWUvmH9G1RXLDQ11tq2PH8blb+vbVrvU/bNiahbKLzcE1rVTKlRKugVFdZtA?=
 =?us-ascii?Q?JZjpAm7kx4rx2Rg3kwaL4UK3nHtGV1BfmuK1grSwpKbNnirpXZ3zl1PhmRf0?=
 =?us-ascii?Q?jWcyRDC8EwUf8SyFDfL1oCJfSa3DU4vX0+OAw6Sn1bsWZZCv2XcF3jDRYTxf?=
 =?us-ascii?Q?zNLc9kY5TU68VuoCQx5RKxVtU2m/VfSkuTVkuqvPbd/AzcAyueira5H2O5vC?=
 =?us-ascii?Q?2JQekrYJAznyZjrm1fZArVR7p4PIHnnUj/l+xKELdThtPhzDMui4b8HL9vd9?=
 =?us-ascii?Q?pGqN87m3K9+fAPq4/MbwoIgy6ZKbaDrSuCmbiUYBtsjOLexgGOPnZJwgsrFB?=
 =?us-ascii?Q?3qHT1wwIEGuEX3XF2yI/F71Mna+FSHjamxrg9lvK++Uj9Np5uo1001nPUug8?=
 =?us-ascii?Q?qdfb5poQFTLLqMlz+hGQrvsJM6Fp1LEffZOGRzzmqxAAdychtwhi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86a37a0-8954-4e5a-a347-08de9c2f97c6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:15:35.8370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBuEXK21LjBYOb8VWQfjYfPtjuC4x1h1zTRWvoJKENvxIKlAPah6Jzpmywj0e5PA0f2GpOpDrwNGLO4/2FNR4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772

There are 6 individual Rust KUnit tests. All the tests are compiled
unconditionally now, which adds ~200 kB to the kernel image on my
x86_64 buld. As Rust matures, this bloating will inevitably grow.

Add Kconfig.test, which provides a RUST_KUNIT_TESTS menu, and all
individual tests under it.

Yury Norov (3):
  rust: tests: drop 'use crate' in bitmap and atomic KUnit tests
  rust: testing: add Kconfig for KUnit test
  Documentation: rust: testing: add Kconfig guidance

 Documentation/rust/testing.rst       |  5 ++-
 init/Kconfig                         |  2 +
 rust/kernel/Kconfig.test             | 76 ++++++++++++++++++++++++++++
 rust/kernel/alloc/allocator.rs       |  1 +
 rust/kernel/alloc/kvec.rs            |  1 +
 rust/kernel/bitmap.rs                |  5 +--
 rust/kernel/kunit.rs                 |  1 +
 rust/kernel/str.rs                   |  1 +
 rust/kernel/sync/atomic/predefine.rs |  5 +--
 9 files changed, 79 insertions(+), 7 deletions(-)
 create mode 100644 rust/kernel/Kconfig.test

-- 
2.51.0


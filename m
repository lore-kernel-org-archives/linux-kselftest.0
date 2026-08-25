Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012006.outbound.protection.outlook.com [40.107.209.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917D83314C3;
	Tue, 25 Aug 2026 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787681834; cv=fail; b=UF527SXX4F/gU803ZNAdITrbyFCg6xB3ewLkGTjqbn9yobqWgRzHuLA02fhBB/jKpSTvkDymDSCX2x/aWY6Aw0usbx59QhpsHB0YNvTC1BYKIKmKvIjTmEA+gkGCythdk2I+WZauoUCW/0bhndWUGL2wYoJ0lw8UQVmiDr7mNT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787681834; c=relaxed/simple;
	bh=IjUf8rxOuicQtjuhoFZKZnzVVKrpCaeOteAqRbD6CYg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QJN6IaZrJVTGvJr6G7n96+qj795EEUJ/L1Dek59jqwstbuH8KoUS+Kkqv8tJKq38uv0ypSy/MqztZBCDmPi6OlOlaUC/3EiO1+4TxKqPfF6iFukqRdiRhMN+Gx4jus4sdvJs8ugoXnzsn03ny+Zxb7zRmyk4BpL0OEAEKWls8sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JdEpG3mi; arc=fail smtp.client-ip=40.107.209.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JdEpG3mi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjXHvImrmixqQgXIs8gAXA/0gYoIH0fL6RuvnoCdPhFGG286sTotnJojlGphe8QBbB2xFnyVRPukqnVQHZRpxV6W/WYQHRyiFyJHlM/dSTl6K3WXelJd52STPyOS/i5onyTm2bHZvOTOk8SOfdGqbMrOKlKiuMYKJOdyvRuAdqVYrYvMySKIrgXFI3bCv69g/2gw6QFMUaecgxofpaV7b0Ygeko9SMSaHiPFblEeZSvIMgmb7m3tm8fo1INJULo43ktZ1JsNa0NohuubvqnRMrBVt2XkTItB0O8lYvvxvt9GmkPC9dknVduKwW5dWt0N6JQcKuMa3ILuDIFlHjzzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zfFwdkrdYl+6cZEO9EeoR/Fz8KvvrfEfw1oT2iZMCk=;
 b=hTOvsSuCrUf5CGnn0LZHYKDlgPC3wujrVRdmzAL+nCIg05ppOA2pHbfinTqdgJb+9WZv3yyk05z8/cSuip4ODSMvaiMt51TQTXS3dxv0qy59Li62yYoLV/VMQbdFvMsgAXRyLSPcXl0sBQykVRglkkt5Jwagi4Vt3gT2fW/eGW2Y0af5QuKeJ3Hf0PIL+D4J2d32CWz+L9VhJvXgFaJMlG3EDYwKQkVEIdy0BEYBZt7Nnr360Df8Bhebowl9ogTlqZOc/C/zbMoWskSilTypoZjJV5s8bP9UwhPuYKfMjR51imvVwIa29soJtBkQzjSU5qAAp3QEDbsal5fEaIphgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zfFwdkrdYl+6cZEO9EeoR/Fz8KvvrfEfw1oT2iZMCk=;
 b=JdEpG3mi9Irw1hrcA17TsZuFe0zbdtJ96/gA9tRBsE2jr2tNlJYZen0PotUhV4vYFMwo1/4lYFUdiy/cq29cmGSIgLtg8HgRGl4+YN6Cih2CmbEUhc9V1SnBfIHHILjZ/dxsqz75X27dOKJtxakyxYUOO2b6On4/Ud6MtwMNykYNegGxK3RHYUyV0K4vaYFkqiNBpdzLJ1qUEvgaZmVX4ziBk76NV9oPtwQ7mjySGN4MUCccwEWwLwdE1eydMl+iRWiS5H6in86vZbJgnNF2rThUrVLg6+T5tNhXTtsxg5SlIL38oJtNr37q2aNBROqr+voEWbGPyEzHhHQDhw7iKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by MN0PR12MB6149.namprd12.prod.outlook.com
 (2603:10b6:208:3c7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 18:17:04 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0339.010; Tue, 25 Aug 2026
 18:17:04 +0000
From: Koba Ko <kobak@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Fenghua Yu <fenghuay@nvidia.com>,
	Tushar Dave <tdave@nvidia.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	rupakr@nvidia.com,
	mohammedk@nvidia.com
Subject: [RFC PATCH v2 0/3] arm64: expose CPU prefetch and cache modulation controls
Date: Wed, 26 Aug 2026 02:16:58 +0800
Message-ID: <20260825181701.3-1-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0044.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::18) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|MN0PR12MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: ad890ff8-f4cf-4179-560a-08df02d51109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	XvS2ZYji7lmsB4cB1PFi73vnV5sUmNOc2IN2ObVsF/GllHCeNnc5DhyamUY1pbyTiZVEPfRZ6b6CfRExhxbwaPPZLAwklBjt0ZruIq7b5T7+gWAlr15MImfMDf2r96UMrtZbgEY2hagrOlxPH9td4cBwCRQFyTCyseGIGxCo7XS43AMehohsPgifOqce4NIPHJxy9/lNmWINg5j8C/J97p+J4MwVGIPbYxEzL+NY64GW+CvplyAnbFnwtwGU4/7PEUgPhExAzfhjLdeT9zcqSngs684haaaELabZuLr2GOB0lkHAeDEhH9bwLDDxh9h/cjR0P41xK99QZCDq6vnFPmnzFEo2YpNp0+ZsX0JuyOfor2zuw1pHQ6LcvWRfIC0JeYwNCuwT6I3dxKxvfHXHsJ/+r47dgmxUdmklbxfbUKUHf53jSuIaMfZkDTWwMgpr7PyxIKskH80W7ZhrjRcKEU2HwgHDl3R190EmDHK6mm7f+xx83I5vFQv5zpEP7xB/irwbUNiECDzkam00HQ4mZTiFQHf3XY2pj0YCudak80qwRTbrAXeKsRdn9qd2Nm+ESKwu7Sama55pfpL/rQR48CIRzJZH2OdVjo/CWalRI4y+HXSrhWerZGkfMxDuoMgBK85VFPmBOQA49jcVbCHKqD9oIO5X5xxfQ4l19JxuMjk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H4K30GkDUdSkMMqq1ZkgqOTKXaeeV087ziIgnYMS94sKtsLNwuA0Z1Jnt86n?=
 =?us-ascii?Q?3/TzuD4t4Wrc385bcwU6yLVU1CNfHhIo8Ov8wIQM4bljN40Asx+P4hhYC8Kw?=
 =?us-ascii?Q?MeBJ3Ew3VMj683ffW+4cs+s/ApXrALOEmXhejwfGGeMxiRaI8Nb1c42+brHv?=
 =?us-ascii?Q?3Rz4Adq/G8mPPZEdj09oS5EtydjN1SBly39ZGMzRhGBGz5Xx6qKa29S7dvK1?=
 =?us-ascii?Q?ibsV99dYcktvkNc18cijFLtaYXnsbDq1L28o0ehlr1j/UG0dW7zXqHXWuAvF?=
 =?us-ascii?Q?QRZpQqGRnL2Mo+af56BM85xcSFJ6Q4qEnL7pD7C0NQmaiIWVMsFc0QlOhbPf?=
 =?us-ascii?Q?0MN7HQQZcarC9IuSiYUEdIi7tUzbvh0KQY3W8XW8zAiDxfZhkO/HN4661qom?=
 =?us-ascii?Q?7pgOiJbgU4r3j9kKL7tinSvJZ9dJOp2b7KjNZmXKGyaRMl0XG+vPT1vi3TmI?=
 =?us-ascii?Q?9GsB0uIWqYwaedjdGKTvd/AliwX6ZLOidpdTpuFOPCr6dvk927M+xbO1Ebk4?=
 =?us-ascii?Q?o1iJ91qZMLdCybkjxgsPB/PsEVx6gjMa2HjETeiH1VW5DHcWW6JFVBVF0ePX?=
 =?us-ascii?Q?UHYtORdE5/pqB8bAtIkSkl4yvFhT6S5iRogEAgzA4uoRMDo4V0vf4sl3Xfi3?=
 =?us-ascii?Q?hm+TS0dib7xM6S9wTd/xc7XOPqsYfKKo+uSNEbpubrVbZDn9yaDcbTWkLzsa?=
 =?us-ascii?Q?5nHTiDIrFoMmdcUhA7Gg5WSX9cQPI+4xDswC8OfcJ1qBKq8mZ/kLQlgVpZqR?=
 =?us-ascii?Q?bSoRGqSjb2PXRtMVdhrRaWFQtWWNfGRLlrIMU5x7uNCwHWta6KYyRBbdFBqA?=
 =?us-ascii?Q?5Po+YlULH1vfGBgcUCddHs0/im7KT7Ba67Zq01GilA29c+l3253uCQRSSzX/?=
 =?us-ascii?Q?brlr3NpBTUHP9K4boDnrw1BuXi5NScd8x3KXQ1gspnyPRNQRoq5lOEVBEeq8?=
 =?us-ascii?Q?1sSUD9FEfJ6gONNvHzXpIqFTLDyCpFlccmduIqZ0/X+V9hHzU5xO12f0yR91?=
 =?us-ascii?Q?Nw9ynKSU3SZrFs1j5OGTuvoW6hJItqhs2raVkL5Q6ZgL9gTmjIYHeqdaSWUr?=
 =?us-ascii?Q?wtMLXeZE88lc+LEcjL6YdpUW8IZdLBZHp9OfkXNqieNoUfsQqzDzFFEIJYWF?=
 =?us-ascii?Q?nRfDfpPhxtNc7+q8cQhGPUEsTszQArIgFqSVjZVVNF9vPPhmz3+SEQ/2xxzh?=
 =?us-ascii?Q?SMpt1LF4BCkvWnTM2Q3xHg9BjJflO1SPaYLVklvy8UIyAHTn0NlEPRYYjTau?=
 =?us-ascii?Q?jLPrmpjiNSX5KsM6i9kYTlNyL91Pft/plDoD0gSNvgMQ7lr1+C4qExzwN4A8?=
 =?us-ascii?Q?9ZHDNVgaOZ2jSZD3pLbR5lQZfSNaJPKQJ7DYWlGLpfxa19FShrA7WG7iDNjC?=
 =?us-ascii?Q?7xvUjn96FTzP7WjR7F9qZdQSoMSNF2X3reJmZnpB4f5kN8m17twrfnARDCdF?=
 =?us-ascii?Q?tRVMcjo/Ti+YJcAZQKBeVjzZuCQ5QKMcc3FQiy5Dh6VlllvSDXZEhAOUOoEJ?=
 =?us-ascii?Q?ygRqvTJziYDgfLpUt3sKUfB+W0d1rdFZLxq0LX++izdIAkhPHnIRuMXlc6+P?=
 =?us-ascii?Q?5eyGMc2D3chDWRIIg5YT3hYuuyQY/001mhHl/F44kH4IldEGk2x+XGxFeoKn?=
 =?us-ascii?Q?JjYWvsXDXihTeBGFnjOoMNQHPV7OQn0vJbpzd2KYDxUpd3c7hYvxbga+kTaw?=
 =?us-ascii?Q?hk3UCE7sUiDJTAeRdwNtie3qOmAlTn/NxRAt0dxUOtpBKpdylkjvFpCIiRKt?=
 =?us-ascii?Q?Cq5QZUvwmg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad890ff8-f4cf-4179-560a-08df02d51109
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:17:04.8193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/1lqPQkdWNBuuQemVQ+0txSsZ5sjEaCzjtN7mUbvE5zU/3W1rqkc7dfPwvpcBTdZdfYi9VwX2pJkX0zmloAcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6149

This series adds CONFIG_ARM64_CPUMOD, a default-off arm64 interface for
controlled performance characterization of selected implementation-defined
CPU prefetch and cache-management fields. It exposes a small set of named,
per-CPU attributes under the path below, with writable control fields
range-checked before register state is changed:

  /sys/devices/system/cpu/cpuN/cpumod/

The directory is created for online CPUs whose MIDR matches a recognized
Grace or Vera profile, with common and profile-specific attributes selected
for that CPU. Register accesses execute on the CPU that owns the sysfs
instance, and CPU hotplug creates or removes the per-CPU subtree as the CPU
transitions online or offline. Unsupported CPU profiles are skipped without
blocking module load or CPU hotplug.

The register-backed attributes are root-only read/write files. Reads return
the live value from the synchronous target-CPU callback rather than relying
on persistent per-attribute sysfs storage. affected_cpus remains
world-readable and read-only.

Changes since v1:
- Remove redundant GPL boilerplate from the new source file while retaining
  the SPDX identifier and NVIDIA copyright notice.
- Address Rob Herring's ABI feedback by adding standard
  Documentation/ABI/testing/sysfs-devices-system-cpu records and keeping the
  arm64 guide as a pointer to that ABI, without a second attribute list.
- Address Breno Leitao's access/readback feedback by returning live
  synchronous target-CPU register reads, changing the six register-backed
  controls to mode 0600, documenting affected_cpus as 0444, and adding
  deterministic selftest mode checks.

Koba Ko (3):
  arm64: add CPU prefetch and cache modulation sysfs interface
  Documentation/arch/arm64: document arm_cpumod
  selftests: arm64: add arm_cpumod kselftest

 .../ABI/testing/sysfs-devices-system-cpu      |  77 +++
 Documentation/arch/arm64/arm-cpumod.rst       |  66 +++
 Documentation/arch/arm64/index.rst            |   1 +
 arch/arm64/Kconfig                            |  17 +
 arch/arm64/kernel/Makefile                    |   1 +
 arch/arm64/kernel/arm_cpumod.c                | 458 +++++++++++++++
 arch/arm64/kernel/arm_cpumod_internal.h       |  93 +++
 tools/testing/selftests/arm64/Makefile        |   2 +-
 .../selftests/arm64/arm_cpumod/Makefile       |   5 +
 .../selftests/arm64/arm_cpumod/arm_cpumod.sh  | 543 ++++++++++++++++++
 10 files changed, 1262 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/arch/arm64/arm-cpumod.rst
 create mode 100644 arch/arm64/kernel/arm_cpumod.c
 create mode 100644 arch/arm64/kernel/arm_cpumod_internal.h
 create mode 100644 tools/testing/selftests/arm64/arm_cpumod/Makefile
 create mode 100755 tools/testing/selftests/arm64/arm_cpumod/arm_cpumod.sh

-- 
2.43.0

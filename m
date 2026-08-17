Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869754B04A3;
	Mon, 17 Aug 2026 02:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786933425; cv=fail; b=dF1ngb0dQ1oWUIE/nE5DMVr6J3XOT1BFxkYH4xzpLGwdYLG98pHd1KcXMibHqvcKOZMPB0S5A6AtRDQSZbHJ3nx6y1AT3owZzPsajc45/7FZtoGhHVWQ2KtE/zHheFTdGze2/o1ItObdH1oaEZy9xgDAwCc3WGamUqrWJOwwh60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786933425; c=relaxed/simple;
	bh=G3c/Q29ffAfhYaa4/51SpJkbc+dtk5ejE/zZCCVz16Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sRworRTtSeH9HqQb8oE4uxbEAuxKZcnk6d5KwDgxJfIHB3cxlBwsY0hC1TCOQxh9sM9QcEOlIcqEMBycpssUWwB5x8ibICDUmUKsmRul6cAzTp9InB7wFC6/RlDqvJIVN/IFRZtZzr4kM7k2Dpu46vSq8ARDDGHLTm3o2VVz0vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JQbvbotK; arc=fail smtp.client-ip=52.101.48.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JQbvbotK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFcaxJlTof+4lDhOT/vmbHlMQsnrH06+6phUMMfVduJsDuIn3r+IoduP+9XXYyLEGy+kcFm/RpI1W91vgkrFFR6FIHxGGmv8N+9fMkQGiWxi/LL1Lwcs3XG8K4RqM9NTWGyIK22fNEk3thjnDiXLlmvR71BwXfAcZEszMN7IPdp2L/efcLdkswtal5oqCCvPXEmv9Vev8UMRpKwXzsUhf4UekG0aej8MqUAtUqKdM7TbyhWbOk4GWVqImAH0FtCC9s4DhWCMnOSrHXMmOby6KqKbZwAcPXsywNJEzVS/E6/LgGE+txc9BW/T0agwUTIeyi4wHTkSYAcDMCYi/Zei2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lWFkp9Q4odc+ATOu4u9xlSDDLg8SfOYSZzi8IhBBtg=;
 b=xOlUPmJG/k16fma8T/Qxdiq4DHTUgDSbnUotZYQN0th67B+xwrrpXoQTy7vAmP+QXZ4iVPl44+RGtgKZWpyHIh6wBogtMN+q/U9TNKU34ibLNQLoB/86ZShFW5k3gAGu7zLYdHvWDA4DTKTNyvzq6xlvrNaq+cxHtE474WImisViqt1xsc+QwCiCvh+cFP3njoc3zYgfgkal0qAwp/XZYC14UHK4h9GfD97iRmN7M4b8opIWYfStD8QBLjk36ctozw+rkXv5+0gSSQVy7dKajvZK/djT5VmtY5BiOOqeDcTD+1dfoKX8ie9s03EmWkBJSZUIcXlqQaV8gnNdlqScmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lWFkp9Q4odc+ATOu4u9xlSDDLg8SfOYSZzi8IhBBtg=;
 b=JQbvbotKBm9W0JO5f60ZEQm2JzyWKqbQQq3/Wjs5C84bEJ+KI7pVsuQrCaFPyw+L2MOrZ+Tlvw9u5kcezBGjrVmHcntziG15ZKEQ3AMOiKYMY5SJWKqhl49zuWLbxJMPQ7hN2P6Fnd3gp+D5Ye7xSnLhWKWZL4UlgS8LELUfTcmSiZDzrcWcy+zC0ibhzLUiMwnErfzUj1Y/oVKLSbuZylj7iKucYHX3Kzx5D2MJR/bd8TJZ/Zyh2oYdC0QXsleNC/TdjZ/zQZSRiCmou6JsWsIUEpA6j8SwmfbAkBt9rIe6byWolXGaHPEkyF0+jlnC48kaZ3hig1S8C3vuf3pBOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by PH8PR12MB7304.namprd12.prod.outlook.com
 (2603:10b6:510:217::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 02:23:41 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 02:23:41 +0000
From: KobaK <kobak@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
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
Subject: [RFC PATCH 0/3] arm64: expose CPU prefetch and cache modulation controls
Date: Mon, 17 Aug 2026 10:23:32 +0800
Message-ID: <20260817022335.3-1-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0147.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::16) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f038178-ccee-4696-fc5d-08defc068db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	dRRktIGoSzMQvD2RpQszHdcUVdL05JZoFJWXr1EONqv95UGQOxIvNAU/L63eVGKDhbPMJLpC9aA7FbMc3Bv4tUAqnI98d2TVEVyJa2InctacGVR48Gd622kbRxRMttStHcVR0NutwV1O/yGvvDl+nJAQuhY2pfR1BbVHgBzF5+aEqLb2XzM3tUP3NZ7I6AFWYr1NV9+YNxgwf77XPEotX9y5ntalCY2WsPzK6I924+vv/fF44kMMEWH+W3bU1cYMq1kYL9Zzc4m637AkliAmCTqLOUbyj3G7Y4nAEIO2riCmQ7K9w4+9dukHup0K7b93X6j5RIA4CoIN4Mdc7LcisBzMCOgiUxGZmmO8HQSD+sbaLUzl3mThaogOZ/9mB2TqA+yLI0gq5W9zaYsrqwffnjiDmCYVYB1Gbqy+R9n7PH4M4QTNzAnbetaIoCrqajsgMTQdJUwIQS7k01vTxLgohuCP/tWvkrxpePkZl5UvBhAnmhNjXCMHR3/ZWkQElvEmoMJeesFQqsczMujU542VSiHm05hH8Ga4sIsBSj6yYTGe4UaX0O0oeXbl2kC0/0b6GqbZBNbPb3xktkilJw4LbkRMLWESND8sIjF12Cgcloo1PlB0imE2/6wC4A+7BTMkQN/egUmHPqVi0ggFjGuh0jWVWgsnRaWhpptBLheAuHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3hXQhKaPTL8vyNqf9GuY69ZmFUOKJ9OnG4H/JX9OaK0Dj0HiEshVnkCnPHmg?=
 =?us-ascii?Q?yYJCIpBMwaewZi5amik2zNInHUvh/+3oiaafTwZmhDYIjZicR5dYRSQMjA10?=
 =?us-ascii?Q?bJ4ZjFvmGCSKLU55DyEBkTknROJ3UD/sGowphscv2w7Fdh5dBAGTtxOrN899?=
 =?us-ascii?Q?hOgZhoacj0Re5YfjE3k9zRXhscfzGR4AAV82Vx0TUo5ZCYjqFDfQqKqg58y2?=
 =?us-ascii?Q?QXpEb4Xyd51R43vxBiMwWkIeoo40Lea4tL6kL6I1Wc+tVImoX9wzXIuto+y8?=
 =?us-ascii?Q?laBFTmVKI2SnFLo8qewJUVa7LsJ9swhPyjWVI5pSSPRM43okSXay2SfxiVSr?=
 =?us-ascii?Q?cMAknX3J8Wh4TLcVzyuaZHhgNLAO7l4vTrkstrToFqNs+fmX8h0A/t+Q5I3k?=
 =?us-ascii?Q?Vn1h/v2ClAC4P5RZV+0mDsiyT30fpnYQcfWowcVvS9imsz2KkpRqrq9eauN5?=
 =?us-ascii?Q?GwcRirnW8NxcLZyw5mcGkkityIwKPcHMKEwc0kDUltfe4G0HrlrRWn981OXW?=
 =?us-ascii?Q?K9xVoqKjKcQhm4Nxxi6miJLuEtEVVy14J2d+1OTnbGQc7DE1DD0GhyWvVxQ5?=
 =?us-ascii?Q?wqXdGW03c46SN9pB1G6Fa2Dd/hRUuNzl+XKuEm5XUWP92n/dk4BAZHHbbdpR?=
 =?us-ascii?Q?97KRNBMTZDbPuK6XHwOeAhn3DA8Z7seNdspi6m07/7bsnpch0SlU4BHFLj5b?=
 =?us-ascii?Q?xfCAa2tg/JPr14TT0JUM0gQGP5jUILfZdLC5R3GR61nBr7X/qAWMErRBhv15?=
 =?us-ascii?Q?+61ELryh/GnduNPb9OlMtBQwNNeSRy0UfTmafIGZoagnMJItAa3+vnHz1OEQ?=
 =?us-ascii?Q?Fp+eNhFUM48rBz5/aOzPAg3P9YbUiXSrh/Zwv7W4ZgPQ03vCQ2cBbuZpGF9x?=
 =?us-ascii?Q?NoBhNiRYFdSU8FSQT+3XsaLfMSHbwvDHGi1RHAH67WHwoJPr1pFIBj7gH5bX?=
 =?us-ascii?Q?s7RL9aIuduPxBx3R9hbrqM0XcJsOIaNWBD3dRW47RoTdb15zoLsEPP56HKgP?=
 =?us-ascii?Q?Li6IgnN2RaBJBIL9dj8gghLZNI23LC/L5foto2bajuAKl+dfLACCj2B5ltiR?=
 =?us-ascii?Q?Yhye6dastF+YH+B7DJyLWwLnufoLC5CZsA54YrYVIrUE8UWTVFldgPd70kDX?=
 =?us-ascii?Q?FBzJ+RsGoEnLos/+tS7696BEvMqPfSDZx+odz8m2Gyb5K1rpr7+zo/PWFjNx?=
 =?us-ascii?Q?TA6TvX9EKRAIbR+gUDf1svpZnRhKyrDie60hnBJ9qlJx8Ya86QwDsrp3m+Tw?=
 =?us-ascii?Q?ArSRBOjpnuqZLfnO0/AmmxbyLJhopZBUTqxhBhsGhPP0t+ukUEJN6G+Hr8jU?=
 =?us-ascii?Q?bwBtxl9SlSPZpqa5cxiM7UAAy1ebGmRcBjcJCoEwaMa/iRQ9YqfQ4HRXKFc1?=
 =?us-ascii?Q?We0867S8sYgQXM1pF/0367Bf2E848vmFCFXqfRyHuXyCXv+IKeS1r4kZ8pJt?=
 =?us-ascii?Q?L9ED9G7eQemYgUJ1zKB6LidvcpxNtXMf2br3fMb53gOFWam7A/TEYMu8Bt3L?=
 =?us-ascii?Q?h3JgnTTP/YYIkWsjqX2F5WhMOlErOmWVHz3NV8kVrb4pPbHQdUpBxOXw0Oku?=
 =?us-ascii?Q?dW1zwevd4XhoftJHg2ZMbFHbEo9/H+EEWU+xPKbZVm8b/aHvY/yiz+S0XSQQ?=
 =?us-ascii?Q?DKYvhMfZhtnQ26clErsqPNMFLitLrxYFuI4MXlDdB/URg9gftAW05jimcyVf?=
 =?us-ascii?Q?sEiZG1HAuFQv27k0MU5bGT5HOcizCVLixC6Wv1VFdc8285cphnYZ0E/Tuv1l?=
 =?us-ascii?Q?Z1ddobQvAw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f038178-ccee-4696-fc5d-08defc068db9
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 02:23:41.1755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLFEx11iqhf1ulku9QoxLBOmYAuCwSOt2xTKpqZ0gKNdfCC2yASL5cH79qCvCJ6rNBWoauOwHZZmm2YSThIuig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304

From: Koba Ko <kobak@nvidia.com>

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

The implementation keeps each dynamically allocated kobject in a private
per-CPU pointer, avoiding use of the CPU device's shared driver-data slot.
The documentation defines the ABI, firmware prerequisite, and hotplug
lifecycle. The kselftest validates profile-specific layout, unsupported-CPU
skipping, decimal affected_cpus reporting, value validation, optional
writes, all-online-CPU coverage, and cleanup.

The controls require firmware to permit EL1 access to the relevant
implementation control registers. This is an RFC interface for controlled
evaluation, not a general raw-register or production-default tuning ABI.

Compile and static verification passed. DUT runtime validation was not run.

Koba Ko (3):
  arm64: add CPU prefetch and cache modulation sysfs interface
  Documentation/arch/arm64: document arm_cpumod
  selftests: arm64: add arm_cpumod kselftest

 Documentation/arch/arm64/arm-cpumod.rst       |  89 +++
 Documentation/arch/arm64/index.rst            |   1 +
 arch/arm64/Kconfig                            |  17 +
 arch/arm64/kernel/Makefile                    |   1 +
 arch/arm64/kernel/arm_cpumod.c                | 471 ++++++++++++++++
 arch/arm64/kernel/arm_cpumod_internal.h       | 113 ++++
 tools/testing/selftests/arm64/Makefile        |   2 +-
 .../selftests/arm64/arm_cpumod/Makefile       |   5 +
 .../selftests/arm64/arm_cpumod/arm_cpumod.sh  | 526 ++++++++++++++++++
 9 files changed, 1224 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/arch/arm64/arm-cpumod.rst
 create mode 100644 arch/arm64/kernel/arm_cpumod.c
 create mode 100644 arch/arm64/kernel/arm_cpumod_internal.h
 create mode 100644 tools/testing/selftests/arm64/arm_cpumod/Makefile
 create mode 100755 tools/testing/selftests/arm64/arm_cpumod/arm_cpumod.sh

-- 
2.43.0

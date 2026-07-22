Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92969387588;
	Wed, 22 Jul 2026 02:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686397; cv=fail; b=hv1zZxE5XomPNgu3eHnTr7WeS8CYkc7stjBychOB5fIgkSgPRTC4M/z9n1jfaUWw0FwbuyIYosC8XXmA0MWdufbMTMGKGAcraLOPEKwN09TdhB0pdUgifSpJYFtPT3HeHI85RIDXN2rDjxY1VA34605Btz4vWq2GLtpFNoAy5gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686397; c=relaxed/simple;
	bh=X6ji7HLexqVxgnSfg0VGXd87I4I/yyw00SpT3+w2BAg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lCvMicgcbWhLzmMsAS1oPhZ8qZ02qOREFtqaJKEUpE6RxJI8Azxy15udZr372Q4nt9pLRUbe9RAKYhXdZWiCTqtZo8xjm50C4AQQF5W+uieU1iGq8z+A+dKHfvqmElJZFJRlcy68JNGqvNY0aq4oTp8ttkgdytaSD0veEz1k0O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L8UqUiUy; arc=fail smtp.client-ip=40.93.196.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L8UqUiUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kur+vjzd/sIoT1LRjMOO1kd8VGVXhqAFWgr7u7BzJW/o3wNBBmcGjPo4lfpxHO/Ilngg42NBTD3sFv7aGH05tc/KdMIu3onlNEReBLt/6ogHwsFDo7Z51q6rICUkVN40R+ucrcP1FRzbtQCqHKQp/SK/aixJ+8RWr4Fhmr0ylHVR7bFs/p+2wV2spWm575kO3hjmRLCkUMnhf1Xu8sKbwlLFMUU69UBSNiv+yqoCECXSXUYc+1sGPA/y+5syuaAfuxruxo0An18oJ8Din1ipnXeTaxzCLxfI5DZJZDU7G/BvdzW1nzYb5mUnpCQV7osqQ4TlxaRPF3oy4SergEH25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQaIRSpj+FHBTJYCReICgKxQjtSXkDyjpf13/ffx73w=;
 b=oZYjNcAAXAx12CqAYfduDnvE4m/SVTabq3cls0RLXTDjjQh74X1NyzmboMvcQHKSOasdhKFyraznm8gGWG+LGimEf6nRxQgMoyBwetYrjtO1H0tyy0/MtvX0HfeU95zcNkaxUbyEJJZF6tOIgfyOJ9uHxgERBJwKbP5Lff93t/qsvOFAgrhoYZyEkJuRd5m91FVVVyrdRMgikyRkk0E9S1j5aTDbwFWb6ivK8qV3d6aoUHoHO5s0xEiTHG2W+nGf0MnSfERCN58UthOb7drD56mBqqGqG1PsNiSkV7PGXSGFz0QloZm4tyUZZrwfCfoym4wohFXFwQ0iR2g1qGb6oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQaIRSpj+FHBTJYCReICgKxQjtSXkDyjpf13/ffx73w=;
 b=L8UqUiUy11mi+f+ygZ6yhlyh52EbclEGTWQrYrNdptZPf1ZrD4m2gCbg3kmGRE3PpwKUp4T7chCNYkxdhL+g/E4+MdiI0xJCldi9kYwuQZLwjfN5btR3z8YMH8yZM47P/Jn9CcuKbWkXnFbjVMQBLnppivAnvtSccSkMA8JZdN/jhVXX6yzBiz1XK/ZaJnNfRwHj4tEyWaHUoIRd4Cic+NlSZz8qnN9gW+IBaQdi83xVbb3c5cn0GI037sZSV30FzMmZ0rZNV8LZe6IqOctUcA8YGe7JaUS8bfltBADKsfN9NPXwz1s+xH49FH6KBUKYuFKLbC8Htm9qL01Iy+zrSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:13:13 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:13:12 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kobak@nvidia.com,
	kaihengf@nvidia.com,
	fenghuay@nvidia.com,
	ltrager@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH 0/5] selftests/resctrl: Run the MBA test on arm64 MPAM via the NVIDIA SCF PMU
Date: Wed, 22 Jul 2026 10:12:58 +0800
Message-ID: <20260722021303.9471-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f4934e-e2d8-4d9c-8453-08dee796c79e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	Qg9UFdpfbJARSi2nm7lF7/I96P4zyLb1tqpZNYtp2scBdnsbFZVGiyK2oRoK5iA8LlhUNktE8K4FcDjKwg/XnTei2K7e+NJJKhoygNz1mpfppZjyj3NTNg6OAA/cGGIIyIxfaj3b5//z1FOdndd/+bRJ3vopFcrhWGzq04VpFGISflj/Xe95HLQwg2fICSd9q/Cj7+99WVeATyAQPob3GWWD8YU42J11so7S8IJO6pOflxj6Z5SBJk3MUB8dE68IDNxohUKYp4Jq4eVvgLUZzD803fBeIoo/N+BV1Xj2GU6PTMU21gBpsGhzfJfhclAw0xK26XmWA29W4PLRzU9dFFckd1K2bqxhR7plLH6IypE4lUd7zXUDghCXhUvNnKjcwOtZCYXgyyhwOpAXmyvexp3ggY12oJVgk1YqivmLtZOy6gCr3ssJiI+OlN21o2978Lag9FDhNYB8R9syUrfRCzbvjhpdJ2TukkdlmpLESXX7f2UzngASCsBYZi27rU3Xa3hCcCIAbX+rMrJgI6lkyF0Jh7uEY0h1ixxfCl5o7LdXCeMqLL3msI/oEUPER+2hTypPDtxjO8cpCsApmx8BvHfHRkUbq5bxOQBYQfnIMbeZvPMDz1X2zSMe3684U5ebpEbuGjJjdL8k6dXxoSClLopB/M6zC8p9jRvFodZZXGE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PxP+plyCzeI3aUoGcPisu0sqJfrUbw1JPWIOvSEWtobKWhJCg/j9TPICtVpe?=
 =?us-ascii?Q?0ayuUCPw/RnpDjwqFJOSWQaj8Q+2Wd0Nm0zLcnPCUXwxflF8CgFgqKHX4JEc?=
 =?us-ascii?Q?plMGzcuJ80vyRDk/C2CHd6F6wNDizbYKru7hYVFptl0YWRdrXQAFNnz6PEHy?=
 =?us-ascii?Q?ecJvj+z0ULPh3Hqr5NmEdoBNJvaFpNa4C6WqSJRvtv0mk95pHMFMM8MiQ8mt?=
 =?us-ascii?Q?uEz7mGTgfxgJU/It93ezGNKLFsPMyyCdTRUzgPvCb0ZqpFSfLdjuKMzxLzN2?=
 =?us-ascii?Q?Vje6gu3PP6/VBlf2UYjkX3Sg9ptjpWchTliOC+NTpOY4vcnhBgSlXqnCbH3+?=
 =?us-ascii?Q?X10YPXQ5zvahEVdqFfFCVXI664Kq6DsEOZHONu3evfv/ftqpQif2aNZEGw+W?=
 =?us-ascii?Q?vNctFnycj+CQ9xFxZlQCqC99BIMXBnHkGFvN72xXJTThxl+lZl5/Xy+VdJA1?=
 =?us-ascii?Q?hekGF05LdMjTX4y3RyOGqgMjuGSIb0bPNmsF16bsoXfTiad+3KiyFatHoqKi?=
 =?us-ascii?Q?SQpijcEuWu9tZMOmv+qye60MYggyBjMkEk1kU5tyamvewBRkbZgKMF1YDAh4?=
 =?us-ascii?Q?ZiqwHCy27Qu02ADp+X6VAhrcRUwyk9YRAiDXYqOzXn/57AB4BepozBhAAAqy?=
 =?us-ascii?Q?Wog+Ob++jFolckagrTgmq76jZS7gQF20ZKgHNtWl2kTt1O162f40ieboFijj?=
 =?us-ascii?Q?oquvN9h7hMA2G7jbQQRUqGX+WNJVDZFwOS8HxtYqUeGYkvSIb2VHOp3lPqj6?=
 =?us-ascii?Q?5fGoyfrRIs9LZDirX5fykB4Oqplp7rscDkD/Cuf4S0jo/hPxGGRqTVKZ8n8T?=
 =?us-ascii?Q?x7yBTTNcHTVqh4q6rr7RB1bzui5WvCAPiQ5YSFk37V94F20pJZdwiBdFjvkb?=
 =?us-ascii?Q?2jxhfLPIv7TFfKxoX3JtGqHzAMCw3UmKu1A26kVnZhQWwqOm8TWMiGu0mIDp?=
 =?us-ascii?Q?8La/tQC22fII0+N/8VlXR9H3kqVYaRZTNOaZvLCG9/1zwrA5DiJxmqvNwiP3?=
 =?us-ascii?Q?es5Cjd0T0E8RkeS5czhCRpSoaa2O6wtMAZvl0mp+BBAcPRhlzgEwuHYGbNoW?=
 =?us-ascii?Q?LGuodQJBHpAOZxZ8FVRtwwE1Gzjlx8fMg8kAnXH+nw+CGJseZkia3WKvjtm7?=
 =?us-ascii?Q?E0fButE2U81BDBJCde4HsUJeu5kORbnhfheLijQwl9euqZFBMcAm5XWnTN0h?=
 =?us-ascii?Q?yaPHoAl21peBsuS6T7wGdbt0l1e22LzipVHWnGThjBfGKRS+tQ8fW4pQODv2?=
 =?us-ascii?Q?z8xt6Vwo6MJ7VAtsuu56ATUJL+DUPY1qQvUITDC6V2kIHWEV3BlDBgfkrI3k?=
 =?us-ascii?Q?ykw+D9pH5FqltQ3CAFs+oUvX9/YmK5FJAHM8QsWj6t9HtyTIOYdDIj00aJfY?=
 =?us-ascii?Q?RM4y0srTnuQAjtefikbGQ9cfn3JPu8ENRQ47AbE+DUZdO6wQ5MonwXm1S1dz?=
 =?us-ascii?Q?+Q8ky4Eqo6s2petRbs1WEHqmJiAMhP1xAx2iI+yMa/9QvTStsogAIwVZRoQE?=
 =?us-ascii?Q?AnJedreo6gR2Bjma++w6CfzsY8YjmJVOw4G9rMH/r5jT3ZB/eN33bCL7DUUT?=
 =?us-ascii?Q?9A77VFAcZkVIXXFo/y2P8aOe2VC2yw5OpevqoXjCWYGObvNKDMojXftlg3dY?=
 =?us-ascii?Q?cnRq0NCE/bl99oy5A9Z+0QgRKy4JKH4IFTdPe71/zuJZRIoVmbFvv45Y10LP?=
 =?us-ascii?Q?DB7RXWQ4z9yZiTBtaGM0h4bQadzcJXbeItFB15dgDzgZw1xL0cT3dxKXugJq?=
 =?us-ascii?Q?XWDoqsKQdQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f4934e-e2d8-4d9c-8453-08dee796c79e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:13:12.8732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DINvb7x6dF/NKrP6RWdlj4wkkrG6z1IAvF6PCCVccD5OxarIkuGQNCBXmQko3kw3bnkyBRTkgVPUrXkGoIo55A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002

The resctrl MBA selftest is currently Intel-only: the test is
vendor-gated to GenuineIntel and its reference bandwidth measurement
is hard-wired to the Intel iMC uncore PMU. MPAM on arm64 exposes the
same MB resource through resctrl, and NVIDIA Grace/Vera systems
provide an uncore PMU (the SoC coherency fabric, SCF) that can serve
as the same kind of independent reference that the iMC provides on
x86.

Patches 1-2 decouple the test machinery from the iMC with no
functional change and no NVIDIA code: a mechanical rename, then a
small backend abstraction (detect()/setup_counters()) with the iMC as
the only backend. Patch 3 teaches the framework the MPAM memory
bandwidth monitoring layout (NUMA-node-keyed MB domains, MB_MON's
mbm_total_bytes, ABMC counter assignment). Patch 4 switches the MBA
test from vendor gating to feature detection. Patch 5 adds the NVIDIA
SCF PMU as a reference bandwidth backend, making the MBA test
runnable on arm64.

The series builds after each patch, and mid-series behavior is sane:
on arm64 the MBA test skips cleanly until patch 5, after which it
runs and passes. x86 behavior is preserved throughout - the iMC stays
the default backend and the mbm_local_bytes comparison path is
unchanged.

This series applies on top of the
26.04_linux-nvidia.glue.others.cpu_less.hardlimit branch of

  https://github.com/fyu1/NV-Kernels.fenghuay.baseos

The base-commit recorded below is the current tip of that branch.

Validated on a two-socket VR-NVL72 (Vera) system: the SCF-measured
bandwidth and resctrl mbm_total_bytes agree within 3-4% across all
MBA schemata levels (10%..100%), against the test's 8% threshold.

Richard Cheng (5):
  selftests/resctrl: Make memory bandwidth measurement vendor-neutral
  selftests/resctrl: Abstract reference bandwidth counters behind a
    backend
  selftests/resctrl: Support the MPAM memory bandwidth monitoring layout
  selftests/resctrl: Gate the MBA test on features, not CPU vendor
  selftests/resctrl: Add NVIDIA SCF reference bandwidth backend

 tools/testing/selftests/resctrl/mba_test.c    |  38 +-
 tools/testing/selftests/resctrl/mbm_test.c    |  23 +-
 tools/testing/selftests/resctrl/resctrl.h     |   6 +-
 tools/testing/selftests/resctrl/resctrl_val.c | 530 ++++++++++++++----
 tools/testing/selftests/resctrl/resctrlfs.c   |  45 +-
 5 files changed, 519 insertions(+), 123 deletions(-)


base-commit: 475f355d0408698d9f632ba3b9a5dfb1f91e928b
-- 
2.43.0


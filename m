Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F3388881;
	Wed, 22 Jul 2026 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686272; cv=fail; b=NEiOl+ETtsZV84Fw4c7wwiGPNN7bMpSpwl5cKXWfRNR3nBNFFLhpVzGu9cWXIeNuyOqk7lmBmbMP/aD/SLK+IqW63Bjqk3JjtPREB+XPiGz/wh6u/kBO+3z1dnNAHtz+KlCvDxkmOoZcVElVMT4+rpoFhP84bgv+OSbjxlpu3hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686272; c=relaxed/simple;
	bh=CCRxlfYnmXNiMdChz9GsURnqSFVB/gRfF6R88nDksdc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UiyMgOznVnepClAUEiR+g8Zy/S31fmfF8RyvLP7lLkiKewd8r/+pfEHoa1rXUJkQZs/63VmhXMtTKd7ZQMpx8SWD9fTGcfNsbjbxrRa9+cI9sFbaJj5mKFh9F8AciVnOIqY7suhCOfIQbHzl6oYqX2S8gG58Lr6FJBemuohfYks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RYrSz7KE; arc=fail smtp.client-ip=40.93.196.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RYrSz7KE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZ1FRmVks73uoub5zEeIdxixj4VRtT5POHpgg1N18f2jJL8kB7mxyqh7oNRjYKvFZhHD0z8VYqp9d/3zSOn2lAkpuJZIv8MdqrG3lFCwyghbEUhoKsuiyWedMq9F4Td/lbD4CGlE9Dkr3cJO2w07R1LhCVmWk4YgPf33rfYSrPrKRgI+nGfGitkQmvPNq17LFHGSxuAZEHOaWhDPqKF7t9iCdPGgMPQS9nz6pVBCBDFokW9KR0ZZgf8hGeM5xDf1pIsfQ6TLytQEgWx4f7RxjYbMAnbds5RR9vt1XFSmepvsqeIWANt8ZJ/LNbmcwo4ofQKeErBoLuPdbQWQ9nrPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iG2Ukz+sF2t4k8kf/KP5Cy/Ra4t1Vk2aso9vVm0Sz8=;
 b=s7GatY7k4u3Y00wur372EolU+df7rGZZhKjMZ8+3tfFYy0UGEAfJFgkHEnjIVfuBPf20IuEXWZaHet7h4K74UJ/rXtPAkeuNbUqfGAHR2mrEtK1Lo9Ws7TZPdVMXeY9hr49ME6AqZJAf94to6ZfIkZ0wH2G++1fZWrb5yE8LJkCN5CigKJqL0g+KvqmcxUZhCzqknALHsG5UhxBe7Hk3R/7Y66HwGnsYZ6JE8YpZFytqmIYO7rJirVfcIg+urnvRzxji/gNTSLjInlscD5VEGnL4Y7kWvDsRZGPAvru1iMmXf2j61MYHpp5zDzy1b6kpbPwhEij+ZGdw86Efn4HSBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iG2Ukz+sF2t4k8kf/KP5Cy/Ra4t1Vk2aso9vVm0Sz8=;
 b=RYrSz7KEBuOyPLaIRE4YObefpp+R642cEqiHzcRLLf1h57RVayEJCHKyW/eM/aSYeB43lRXnHsj0/dusS24dj5A0m9zZML+bU5sapEk5KtFG47nMKDJLaiWssmLwX2f1aUvTcMES05o5hxx463rFjGLsRdaeszs7/R4E2u3264exhkMFh8YF0GwuNG6qcqDEFbFzDR7e+Kmvp+DAEo8UKxJ0Or1NWxLQAiDURr+NMBK93ue34VJKxED8CDALIXrjOpLR6G1l/6zjza3exFDSXENEDfkmjbjEBeY1w48Hjce5CuXN+06484Z3dQsVp6gTVKPT3NJ0DGNq+kUOPKc6Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SN7PR12MB6957.namprd12.prod.outlook.com (2603:10b6:806:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:11:05 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:11:05 +0000
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
Subject: [PATCH 0/4] selftests/resctrl: MBA schemata ABI selftests for MPAM platforms
Date: Wed, 22 Jul 2026 10:10:53 +0800
Message-ID: <20260722021057.9370-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0050.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::6)
 To BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SN7PR12MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: f14a8d1e-fb14-4bce-fd72-08dee7967c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|56012099006|10067099003|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1vyZsz6CONgwZ3RHJ75ceE8EhmQlow7awtPRvZtYKwd4N6rsoNs6MLG2OvkCynZKl5lPG377rj3DF4VwodpXgLCchsz3DfEgHQTTqt7zcaqtVAAaWhkO6nB4YFOCji7g13oeEgeXPwD0iruiLLVFEl03V462DEubXQY4LZTlz2GcMC7xMM0X1bs86SsxVJ7CjLGbwZKraYIqtTeaHaeZs418mYM/mh5PjDfYC/ZK+7II/9ZT9x8Qu+8VQvw2pz2cKghUNFKEVOrBnnPuQQC1RvqHCoCrEUQDDIZrDInM8wYyFAnasITVBoqBY8V0KLhOpsoRDs5xlPgPfYCjg/YFXXxoXFMeTr8+/+pP+bxvBVPwiosbBXIjU8dK4mv7XAxqOfK+HDtBNeUwUV9ZJPqIqQxVai6Cd40cZ1XVfjJIS63qLzDP9dAvZtOQHU8JSWwu5mg1HfEwUt7BZXYXpvDEg6LN4Rr3tfP/RJ30Bqg3q7wg+cHhMx4cpGcHUyJheM2US35YdXgqAF4id2AsGqtxlT+pMX9wmhF+coPOBpwT2SAidDFsRuoV0f2AI9fRdjlOZbFEVzbm4cRkmz+G2PsWvIaEQfWRaQAl4FCdHgW58FSUPrKBlrby/+e97tV0f8OLC6gL6tW8KbMCjy4QWhg3EVb55pGTsz3Zf1PEJZKuf/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DgtUITdvdR4O/++APdcUxVJ5/UQqYTfbzuV1S6exUliQWR5F3DSFCSD97ulT?=
 =?us-ascii?Q?3hQNV1N5U2EVAN2FwITXhYhpdhpIyJrmcH/T6HSm1n0HNhC/+PpAHX5r/nW5?=
 =?us-ascii?Q?nXIBh9R8tMKd5ZaWfmpLE6AADBbi3BUy0RHBPSR8mTcvckVYE0PNdKR9UHj8?=
 =?us-ascii?Q?3fBc9g7xdryg7+OlfWgyRkzUMPc5o60/89t574kLU+S35Y++ZkU8tCbhJgs8?=
 =?us-ascii?Q?ZYZ+q2kvCxuQ3O6Z4Zs3Mh/JZTaFJr5fydrpzSUgxfP4J/ax96HfQ/Z0ae+7?=
 =?us-ascii?Q?1ZBm1oW9YCl7iCXp8YWWjsyGRFAC9yk5o9hAObjYZeWenOqdPA5BlqM2VhdT?=
 =?us-ascii?Q?yAVhjXxiJT+26nfS6wwId0sKm9BcvWgrKqz6A0qg1+lGUbQY/1+Bz+1BL28+?=
 =?us-ascii?Q?oAfpA6UrZRsEMUOAGJ92wYarVpCmtSOaqJmhuOiVjVoGhYbFC2tc3KHuzXL0?=
 =?us-ascii?Q?Cr2HjDWNjmgnQiG1nfiabPHvh36MeuRR6rgtGpSRWMWbaY8AgLYJBDCic5Zl?=
 =?us-ascii?Q?Otsgg5WtZKeRlbh2pOaGE0khC+KaK/BH0vLVRK9Xp5S9NIKKxXJnLQaFCP99?=
 =?us-ascii?Q?W6u6soi7CrPe6vcM3aJSuOg1h3gGR2Dr/igBViuKz0CETDL9sqQw2DIjWURT?=
 =?us-ascii?Q?/4PrsJwcVfyrjj9S8bx1xZhMLeF04Ep+sajoDqzebHakF2ha1GTfgMqvd4dK?=
 =?us-ascii?Q?KiQspRgq0zUPfms+0fMpRM0IZNmWmogYf2fFWmh5UOKe6FlUsAy8dPFNETEh?=
 =?us-ascii?Q?B145QW6ZP7rJiK6ekIK7vdty5jJslhDFkzfF7pPpn/+VjApO5b2ihfVUvCor?=
 =?us-ascii?Q?cY9DeLUay3dOQ/d7Zx61qSYw+UeCMSlp/E0I+3MZY09HkJubszYrU7anaXYO?=
 =?us-ascii?Q?uSAPu4KUOSjzguSXLeRRUL+/a6pZsc0mjo6NcWn4E/a93W1gsTVJ3lA7Akmi?=
 =?us-ascii?Q?KDDdkGgJm+SXyFcIzQsIeAugzyhh25Z5daRb8rQJ/xubsTJmsF61bSQ1QnnS?=
 =?us-ascii?Q?wLFFzNqyPgdkejen/SzYeuL2tXkbrUwpibL6NFe5cwqaHiOMMKGsEvQU62CZ?=
 =?us-ascii?Q?USjikGlnbmkERTUeg4wzakbyyrQMsJV1H/LLYObhFmQndukzIhyhOpJJ7VIP?=
 =?us-ascii?Q?qiWu4COFbLNaRO3QNkyFpso6pTI5PDg0Ydb/TtRUF2olmU71m3/DPtZg3df4?=
 =?us-ascii?Q?aLEyiwSsgTUXylFEyGqSBkHFI1ve0eV7s2QzV651qOGQpo56bGgR4ivkudQ6?=
 =?us-ascii?Q?fgm83kw57Xi/i2x3vFuh2y/yyxSMgUnKZ6PIEJ4WDuOl86DvY/oKC7SYUI5X?=
 =?us-ascii?Q?GYwTS6vcmXDAJkQmuz5jRDj4DceptD//bhfgHMZCM97a4h0T2n6CQ0jNdeTA?=
 =?us-ascii?Q?tWlSXzTheywUS7p48lSqk0wxzHU1whL4x9KGevJBHxFprBhvNUZDqy/yXUW6?=
 =?us-ascii?Q?YJ4Cyt0WSBmYkaE5Mjt37rpB/ISLgzZLN2njey2nffaLWGI8eDiaEnrK78Cx?=
 =?us-ascii?Q?qDFHmyRDzOyF/rOlAib6QQKLPObkE0s/JICJa/jMeVp0HqHYWn3z18Rbhe/G?=
 =?us-ascii?Q?19ivIK0rQWknVcT6pknWbLWGRL0/z1VFt3aJ3RUHzXb10+aZK7mvMaxzQPxr?=
 =?us-ascii?Q?H5PKFkdMy6pPkDUS3b9KDJlKIWZp8lGhi2bfQbXDJLDGHLaGKXZijey5ZKcg?=
 =?us-ascii?Q?KY3pAS2Wiy4s1Wetq2RAwJCgtZTGg5i++JQxtuUEecuaX7B/aPNMjX0qv9q9?=
 =?us-ascii?Q?FH6QhaNIgw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14a8d1e-fb14-4bce-fd72-08dee7967c1b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:11:05.1848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ci1WBxk7tQr80XxrzIJGST5kCO//szSZpGLHwq/RQ1iAyqMwahdGfD7bWSy/TKiKDslvq1E64Kp2luHTIk5Jpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6957

The MPAM MBA enablement carried in this tree exposes memory-bandwidth
allocation through the resctrl "MB" schemata, but none of it is covered
by the in-tree resctrl selftests: the existing mba_test/mbm_test are
ARCH_INTEL-gated throughput tests that validate against the Intel iMC
PMU and map domains via L3 cache ids, so they skip (and cannot work) on
aarch64/MPAM, where MB domains are NUMA proximity ids. Any regression
in the MB control plane currently ships unnoticed.

Add four deterministic, workload-free ABI tests in a shared
MBA_SCHEMATA group, one resctrl_test entry each:

  1. MBA_SCHEMATA_INFO    - sane control contract (schema_format, gran,
                            min_bandwidth, num_closids) and default
                            schemata at 100% on every domain
  2. MBA_SCHEMATA_RW      - percentages take effect and read back
                            exactly, per domain, including restore
  3. MBA_SCHEMATA_INVAL   - out-of-range/malformed/bad-domain writes
                            are rejected with the documented
                            last_cmd_status diagnostics
  4. MBA_SCHEMATA_ISOLATE - two groups keep independent caps; the
                            default group is never perturbed

All cases are feature-gated (schema_format == percentage) and skip
cleanly elsewhere; no workload or measurement is involved, so they are
CI-safe and flake-free. The Intel tests are left untouched. The tests
are written upstream-shaped for eventual submission.

This series applies on top of the 26.04_linux-nvidia.glue.others.
cpu_less.hardlimit branch of
https://github.com/fyu1/NV-Kernels.fenghuay.baseos

Tested on an NVIDIA Grace (Vera) system with MPAM MBA enabled (two MB
domains): sudo ./resctrl_tests -t MBA_SCHEMATA -> 4/4 pass.

The newly added test file fires a warning when using checkpatch.pl .

Richard Cheng (4):
  selftests/resctrl: Add MBA schemata info selftest
  selftests/resctrl: Add MBA schemata write/read-back selftest
  selftests/resctrl: Add MBA schemata invalid-write selftest
  selftests/resctrl: Add MBA schemata per-group isolation selftest

 .../selftests/resctrl/mba_schemata_test.c     | 521 ++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   7 +
 .../testing/selftests/resctrl/resctrl_tests.c |   4 +
 tools/testing/selftests/resctrl/resctrlfs.c   | 157 ++++++
 4 files changed, 689 insertions(+)
 create mode 100644 tools/testing/selftests/resctrl/mba_schemata_test.c


base-commit: 475f355d0408698d9f632ba3b9a5dfb1f91e928b
-- 
2.43.0


Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692E3AFD0C;
	Mon, 10 Aug 2026 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355503; cv=fail; b=XqeQHJQMVQjzr7eYXDFccqYlNyJHtLj8rCtUYpkCA3WO2eJGhJtrkHlhOMP6PA4Fwd1wo4c9Nyqj6YtCk4jeodxohRMD/OdHbaS5jU44hwx8ycqK8nKdAcMVbuaMcANqU9bvKzwJZUD5wuGYVwH6eUHuxJh7behQXGcScIlvbqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355503; c=relaxed/simple;
	bh=sdPi9RzDZyliVvHNES/TlcxW05iy47WdgKwoMoYwv3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BqypeoKjbZ2T6TN37vr654H/XeF9GCZ3zGdionWhjo0tRmDfrHnnAC1cTWKD0MvNG2STUefBlm6t+zBZhslym1BfLFmloqS1AWY0MK+JLoOQAb937u08emuEfgnigHjExn5ikwsL1H9ZKkbyLCSnPiorBC/Oj+L1VIFJZLKfejo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ohweEIkv; arc=fail smtp.client-ip=52.101.43.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ohweEIkv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEfuHTtHupbVTLYWJGGPSt+DhgJAcCcXKUtq40Bem/poOW1mk6PGoglGxQYkY9IyxSR9c4oIOkARBBFxSX0Q9EPvJZJhgMiyPWuBCujnF4ZwJwPkkRMd7b563WQhb60i1I1KWaNpE/1kr9AAQG6wpjW8J1VG6chlEID5wwL5SA1OcCCMEnLnTilINgtaeKMLsOfpvzID+T3BDp67riRn1SQkN0Qf4A8O1LuFfy7q+ZfrgkNZh+QBcoXHgsAoKexuqsn+L+gc+KaWQot0RYmDyTJZUlFD9Uvr7VwLGKxmb68Ewl23uByMWvQoXKGP7Sig3FDne/gkyzNwtHSSE7kCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWGyxU/TfDaBYg36msx8kQ/E0331NdbuhoARgGptPjg=;
 b=xpnB16rPIT2DrnS8uQLCC91oh3ioud8/DOYGaa6SXs9RL84Vg1HMwjISOmsy0TKdQ5zsT2BE9uSFuiOJePVOdDXK2x7rghbFJWW3CZVcNMEXosHKI1E8Qo4qWlGpIt+ZR9JA8mFaCtxQ2340BnQjQhHw4jZqn56WuT0kCuMRT1wXD6SqIHJwXnTU4Hb03eUf2RL+O1PELzfEoi2g/r2X4PM5CL4/92Kvo0sb3+iiSXWd1rhu4IJOf9oDncLTtj3osNp+XwjPJWQ0CctofRFa/KDeSA4XBMEGIwlSW3tb+3gBnd7NdVt8qfyBzxel4DY/ViFg+X8btQpTOGiNapRd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWGyxU/TfDaBYg36msx8kQ/E0331NdbuhoARgGptPjg=;
 b=ohweEIkvANvkkaBK8TXHBW9IHPTiBAbUt7NR/3OofFJSD4Cn7ijzY09dbl6lDND0luBvn0Y3nLhGkL5ld6BooQAa3TLKGibPHwzQM8vqz+vtgencPDOg9cLx0a7CZlTlnPyy3gR/cCLTuwvY7SU7tybzYRfcvb8pB5y8U2opC0+ir/PP418rB86d932CXsCKe6DtqeWi+W1Me2ecS9h7dYD14gMHYIDNFGkpXrxBeDBIiLTG7OCp9hollG1Ypq+FySQfaJYatiCpeg8QrrHWHog9cWhD89d0oQEDBvbP65z1M4rhPrltf3XUzRp5dIdXInW5h08VnqKZJ0H362nYaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DM4PR12MB5987.namprd12.prod.outlook.com (2603:10b6:8:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 09:51:37 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 09:51:37 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.co,
	shuah@kernel.org,
	reinette.chatre@intel.com
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fenghuay@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	sdonthineni@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v2 0/2] selftests/resctrl: Increase L3 cache test coverage
Date: Mon, 10 Aug 2026 17:51:21 +0800
Message-ID: <20260810095124.32244-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:195::23) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DM4PR12MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2f1d98-dddf-4a35-8539-08def6c4f7ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|10067099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	XVGMSUhzEVgCuvPJVTJvAoFUdxgLdcMrVe7JjA/H5f2jNykL8ossmU5okwIHGC39+LqdZM0kGxrtfwwAcLs+in+zzNY2oru9qKS4iGEkAD9Wp4OtO8YmLj7SXF4E3CX7NDvceoB7TJdtca9r6NK5Auvugp1+N/oJwVmg6V3DPuRnMMRiZEaBF20IypzK2uE7iOoSrBOXCCjD0t1Oav2z35v8NWgx/kFIuycn/BcVEI+yUez5g6aT6L6+yt4MB3l6BsWLTrm8CAOuq6eWM20XOVa7B3oNjh0IkEU9pweYIUk+uCvML2BYJHx4F3KBlBnqN7mualhu72uYzINT/qTuMG8pgQOwEs5Zo5zmIOFZpUMp7dcU43nrTo7/utKYjR6kgzXB9UNieSnjVyiFhnWlB6xmoRLdcy3btm4W9HGJMh6QUU3wgTe9ZdtTgNx0Rz59oab7PAKFneVjufUtCTkodfJMRk+J5xdoq32xz5zzAyLRQCseySo5luJEtHZjcmUF08rTTxYEsS5EUxwAFA2HKwn0gphZnGibBK1FmyQ6ngEf3wElNOxGNTd6lsVBSeRFTMveOfyc2EQnjUap1ENIcIwooE7r5IVKpMACLH5ks8TdS/VUGTo/8dnuoh2hOH87ydydZUlYx7Cr57NQataqssS75YrhJdBUCqaZNkgl7Mc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7g6Wc4R8uphOT/jX5Y/uPwlLtbUvdBkCC71WXFFIfdF7e0+b2Ou8A8Mzlal1?=
 =?us-ascii?Q?iiu6WYN5hxnmgeSqXDEvv/ILk6xURygmNYo1AONECO6OdcR7KfgyA5bb3n3Q?=
 =?us-ascii?Q?LdeNbhEshAn15nxmCTn9xlB0O423SD4hjQ1MUClPkLVnBu/N10BEUXrNQwBF?=
 =?us-ascii?Q?K7tLGR3EZcwknncgb+wYngJOpPhrAd/Ig480V1PtgX5pWRVtQp2tkQ4WtNO2?=
 =?us-ascii?Q?nrYWsOuIx8D4zqOaeErqQ2bytBx12rSVJjpkLYTZGepybeaPVVGHE6eARSa1?=
 =?us-ascii?Q?2hhh8aN96VxFMnLtEt0CgKt+whiqawM/TJC5J8RKJ9Id47Q6N4y+VIV59PNW?=
 =?us-ascii?Q?pgo1Z5kwBqPKXZ4eVLozsc+zwvDD8KqVZJ9QdwW3cSPb2CWVPepRJdNO4czX?=
 =?us-ascii?Q?rET37zfbT+dnEMCZ1iFcuyedngzinPXvmYZ949vSrUvdNPoBGf8FJvG+FazW?=
 =?us-ascii?Q?tTlDItdQVAxByEZY50aTBZLJQX9XyA9mL+CjOqhLBzICfeHqqSWaJ7PChCkV?=
 =?us-ascii?Q?jZRC7erIK6zhLNvN9uQKEfkD6uWkGEv6x5c3kc7p/FV15zJMzxwOxwTcEDgU?=
 =?us-ascii?Q?KuFiUK+3H0+a4x20Y48QWzzZzvjj6mjXMHE0w7LIrmb6ZqQUr1pVAqqEhRIa?=
 =?us-ascii?Q?eAG4ich69hy/oOK6ZGXqASI5AR6mCwN9njHAMDq16BgAo5kCzZYX6/1o2Gfo?=
 =?us-ascii?Q?SoERdTlvmqcbZGUSA3YQbb0Y+7inWvSyMvsT54+M16Ask++2NtiIdEzdpfx/?=
 =?us-ascii?Q?22pMrFvBfngPSwFKpPQ7EXlELUFFmtMfZbiYJm2Hs65RHKzo/6tglWDG4h/G?=
 =?us-ascii?Q?l27sd3uRXxeaODv221BXoDqlA9PzHUro5ATP99sIM180nRLgrAdmVBfAHEQk?=
 =?us-ascii?Q?6DGhOalYUvBu/vLK7rVi5G2/PeT1RBBege5gzk+K5qn3XvjqUyYwls5R2EdC?=
 =?us-ascii?Q?1Yur+EXET5etQXZNc4ux9LD2yepxVV7tFfsTgeYv4Kf10Zwdr7N4TL+3vSDw?=
 =?us-ascii?Q?bWCeTvAVBFS/TSKWauRnmYCens29RZtn1W4FUAatHrDycptualsCpbE6nCe8?=
 =?us-ascii?Q?R2XInOrxq3DNrBKbyjUqFDWyYRAHwP5sI/q5XyFTuGujHNpKsC/beqsq5u8F?=
 =?us-ascii?Q?v9LI6UNsVhdgLm5WsgS6UEDm56sWrWUkjboyx80KwjsFQjfSzIpxQnJ3w+ZQ?=
 =?us-ascii?Q?gKfaAvGQmyWrL3wmwOvCVhFQysfA75M5I1PfsZ2cSmn1zyd6Vk5hninjFtzu?=
 =?us-ascii?Q?yvi+/esOGXCwMPbE37JmTnOjFcfV9CnouMUxHczoiSGnhVFTELte77SaowHi?=
 =?us-ascii?Q?/yBu+CH04FSaHKflj85QDGvnQO6iu8tvAUduW/QzTharuRuhXgwEuTlLqa0s?=
 =?us-ascii?Q?xjb2mn9nSMh+XEdjNLhlh54uClT6ixqy85M6yvxcJbpTCPkvwBBv0vFG6nbN?=
 =?us-ascii?Q?jg3NR3r7U5YwLi9uJpUPLy4U0jjhHTNBKmChyy53BnMkmuy3vfYHQqx96T4p?=
 =?us-ascii?Q?tzQqzi6BZV0MBoYJaVLVxEv9pQ7tGSNsHZSwMMFeGCcnLCLdVKhwztttY/4c?=
 =?us-ascii?Q?iVmzh3zD7Sjve4+mEsGhU0JKRWZ8azumIKnwNSiw2DQCIKaLcQttutlOYGlE?=
 =?us-ascii?Q?5p3fd4VWfDT5OCLER+IjHkymAwS9rkZszLB6nvsImaFdSpWLJhlzG8U0AstK?=
 =?us-ascii?Q?TxILubAgfzHLOH9CcRdAPpawfnKyci5O5NsEFcufwGf4zYy+i+/3WbMF6oYS?=
 =?us-ascii?Q?ghD/wUHsXw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2f1d98-dddf-4a35-8539-08def6c4f7ca
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 09:51:37.3775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+pJLtqp5j1HRPTZqVJbVxC5FOgDGbSQXGq0yUMF6KY0SYGAgAqLo7xlNwkv9E5bRo3LVajHSwVx6llYnq+rbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5987

The resctrl selftests check L3 cache isolation L3_CAT and occupancy
accuracy CMT, but some basic L3 behavior is untested. That CBM writes
are handle correctly and that info/L3/bit_usage reports allocations
correctly.

Add two self-contained tests for these. Each gates on the feature it
needs, so it runs wherever that feature exists and skips otherwise.
They were exercised on an arm64 MPAM platform.

Changes since v1:
- Drop L3_CAT_OCCUP because CMT already tests cache occupancy bounds.
- Rework L3_CAT_VALIDATE as L3_CBM_VALIDATE to check valid and invalid
  CBMs using cbm_mask and min_cbm_bits.
- Rework L3_BIT_USAGE to use valid partial allocations and simplify
  domain bit_usage parsing.


Running checkpatch.pl will have warning on patch 1 about string issue,
I've tweaked it for several times so I'll let you decide whether we
should decrease the message or leave it as is.


Richard Cheng (2):
  selftests/resctrl: Add L3_CBM_VALIDATE to check CBM writes
  selftests/resctrl: Add L3_BIT_USAGE to check allocation reporting

 tools/testing/selftests/resctrl/cat_test.c    | 285 ++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   2 +
 .../testing/selftests/resctrl/resctrl_tests.c |   2 +
 3 files changed, 289 insertions(+)


base-commit: 840ef6c78e6a2f694b578ecb9063241c992aaa9e
-- 
2.53.0


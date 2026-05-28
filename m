Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012052.outbound.protection.outlook.com [52.101.43.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C7A3B7765;
	Thu, 28 May 2026 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964210; cv=fail; b=SJ+HP9EOPIo5BqnDOgDM9IKht0KG3EFgkktivFS+s8PqVKlQD8xhoZaU975dKlCTPMh/d5NemI4cY7WWIZ3HpE92/GVZG/TAPyDlwCEpWFY6oOrS6vkVStjLcB/1/3xkoz6AyIjaGms5kaBJcm4GaWsDptLYW1eQco0ET0n5O5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964210; c=relaxed/simple;
	bh=pYEIGpO55Fg8vDIdgD2qe5bXOhkwu5E6wz8xgdgJcF0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VhmzBpLZLmqRVBiM3OfYzU13DIIh9Sbh1evDVogZDyPfE6OO+igphlHaoj2E5LTWmHZGnxzPJiu+ntaumyf7DD/vkK4irHMhp31gqeGhTWdHi6B0jnW0qw6Xu+KYJ9zPFbCXecNNu7haUV7IS/IITXeLNOO6ZTDrdA2UJDmPXgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cM2nBeKE; arc=fail smtp.client-ip=52.101.43.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cM2nBeKE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SClIZrA0PREOxarWCoD4DzNbo/5wlAsTT2iwlJ+QWB2UyGyPWWzcjPfO8bFIKVTpsilxBb9JbOd7yhUNP/2cmHuY+52NePifn8HQSmZQfPeabF9qf2ijjVF7na+o1K+CAS1SzXZV2p3IAFcVImEjpVWtqhogoq8vQ5MVkJF+Dk/X/DztvyTFzZyoSgJxejYH4gU1tXQJDIyux6B0w2Yeh/RyLAUlz5QODJHyzfGO0kuBh45YEPMxDDD21F9kFXrRCoDv9UkkBpUHFDB8ZslmGoMlaZt4UJ3wetcbmp7x8vCM4JBTK/yA7YxVEy10z8OghJG0dbnFfu1EOCw9kJAlUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o2KGCnOSHtz0OtK66d5Z7HZb4oQ3rO4X7BQAGhXMUQ=;
 b=sIdoCND5mAXg/AM2kytto9O+urspaugfwZv3UckynFOq1SKreLK/29yCChPpdTQkFLo6KyHK2zvfNO2fImWrIlVLoM8as28GoXWjKgdIXScPhwAFH5oOx3qf4HX1sdmbATDsmlkUaVkAVdwP0sBHicBn9gJN2YUlszLIHawkguU/oTQ752CYSJf1VfzL95nrgkr3LVtyQ/3W8oBDsi5dShwinL000fddFjlppBulqVpfiF/cI/eK3VR4Y9M+nndDUSEi5nATJz8UbdYA2s+HU9rzWqJFyZe/vSQaKPG1sQmnZJAabG33HL1kCTQbEgjZHn/XChRXtxhTy+mruBMwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6o2KGCnOSHtz0OtK66d5Z7HZb4oQ3rO4X7BQAGhXMUQ=;
 b=cM2nBeKEnUEnJwwLwf1D+A9CNpkSltu90okjRqYjnIXXLbDF0svm2fuY8ByO8Eczz266hiaMoCQeOKV/nyjo74XtPFQCbQXuYYPyyMcpRAsfdXW0Mo8ueEDG6NZwkBnZ1PebUddZYP4H6C8G93momzRKoEH41dG9lPyORB7sez9N16rNSfTlZjMiQJilT9jooLrIEn9rztOwC+RmhuxZMyzGzXR0Tp/KIr7UmOXtxsseuvmF5ZMSh/5QW7NDVNeSb9IJF/ogfjNKkJR420S0traKSHB4wrodAvx/ZrTpYCHdO5ez53LdByCr68aa3lVfHKPc3L4GhM6GUlzW2gaODw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Thu, 28 May
 2026 10:30:04 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 10:30:04 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	shuah@kernel.org
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
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v2 0/3] selftests/resctrl: Fix resctrl selftests issues on aarch64
Date: Thu, 28 May 2026 18:29:53 +0800
Message-ID: <20260528102956.33121-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To MW2PR12MB2380.namprd12.prod.outlook.com (2603:10b6:907:4::32)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: c08c0fac-5a44-477b-28d9-08debca413c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	yydD19OsR6zaHXk5wmgZsHjtl7CwsBI7fT5S/2T2TQCxlyBCg9GN9qYwhNwIzCZmDFaUjMrvjlvj24KYUaVK+5TOIm5gRBh2gDOjzkuBpiMg7uj/e8oGV0UBktbm8ghaotkh7iVKRH5CkG/PpsN5KmIHj5BX8P6gIYoEmURG+pEoxYzde8DaQYgypWdn4xjLqge4Y54DpljoxwhMikbeoD66hG4MoYcgnH9/zLbPeinZ5RFLtZtCxGHGO2uzNAwCdT/tJBEylB2ThZHhZSQvIuD94NYEU/yQSmyagIEJHKarT/lsM8moigMlJbFOSeS3cnGvcMnH7ZJNH7HpvClNpARrVJ2PLu00hHjEOTyO1GbhNboCHEo9pb7PTwGEiSfV2UT8wGKfvV0EB1jGXdA7yUHleQyi8M1iEIRFhPEqhFlZm8Xmlgy90I2KYXhqYy4AJ8Skuhqt7MEyIN2D9Fl0TuYvR+2Svvw8cW8aqaB+2dJyMl8BpDMfzUCNEMGnxLo0r10y/Rwo+m/AEtPu5/DrBttePY9sVUM/uK0UA1TYas13HwpVGUVUlOLvgL2M7eYgbl/gqdM/mECJEomNi9u7yLj194NI/baxYf7UGlGYav7gQpHoxo1rhzJcM9XSL1ionRAVo8XSFYm116CUvx5bMiJ6lZwGVlnvcyCbvE+F01ie2xiuHYAQuIUbU+Dq7cxL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mp6dg4acwWBu1K93CDEABwX0co0E7KqTdtbeVKrqBm24xLBIyZdxWaeN2LFQ?=
 =?us-ascii?Q?0SXa2ZdKG3U8u2ZBeB2F/4OEbCv5YFaacVNR7r+fPjryzEmYlmaNPfqWLWjP?=
 =?us-ascii?Q?vw6QcrkzF/ZNijKH0DckqjtN1nx+ZGg90o+H8pzWFrXKZAeeZz/ZDLp5MmNN?=
 =?us-ascii?Q?Dog95/HLSStdJoe88uLX6s4Il8EeiF6pgVMZVUmGuuG+8Xrv9M1TA7SO4XT5?=
 =?us-ascii?Q?x1q4iIaFluuGH/pHSR+8A3c4lLUUpXRAI0PWz9HQ1FDRsxRFcMOX9RVg4MZw?=
 =?us-ascii?Q?uO2b0nmBFwVzm8vS6Y0F5jMmS/+db6Z6HGg+tkq16CSSW3/M+/KR5M+0sGRr?=
 =?us-ascii?Q?Fvzk3GEHlMbx8CblfIXvZjpFCWW1K+N7p+PjVi9UGPkluMJVeMVMNmAc1NUX?=
 =?us-ascii?Q?WZ+iCIynPcMpExyLGVZMa3MDjCmI7nmN94wSSlFNYPGj+WwywI9qgoxq5DTP?=
 =?us-ascii?Q?A4+lrBrm5DDJ9P7rlFhK+kUnGT46e4DkCmR9dICmvnl1JGKAVmvRdVqBD3zB?=
 =?us-ascii?Q?ALa7p2gGCsJDeaLv1CimCIWNnz9toETY5CZe0yjVV0xtMxn2MQa1ok/pSzGe?=
 =?us-ascii?Q?K6KUQBvbgyngtOvQsXKzlHdVnsn7d1wU+WVRUd38NPbJaf953xwCp0nuY7gh?=
 =?us-ascii?Q?LRlRejNPaRPUNc/5AuQpHgA1/wHMd/XxJOtIsXAVMJRoyNX842uQlojWO5ep?=
 =?us-ascii?Q?ly1KNRwA1v41GBb+CqEyZoRBWRrZbgrfVahr23w6eY2VJc4lzlmtaHzyV/8c?=
 =?us-ascii?Q?UaT3E1GsR8bFrDrQYKbnRXzqBhxbbJnB0fcg7JnG/IzolJXrS1TQBSRo4H06?=
 =?us-ascii?Q?8TBMg1vqGfzGw3+H4X42tYbwhcS0tVYeAZ3oGzWot5Lx816rEUBaEqWHCT5x?=
 =?us-ascii?Q?3x1PyCOmTqa93jq7szhBnmsvgIOHoAIXk4UMsAtkPih/el1Mrmfp3KoUockz?=
 =?us-ascii?Q?ZzG4cW8S6UC7pnU1LTKKpobjKkFqgY/iawqr/rQpGEj0FXdsgN1Y3bZabx01?=
 =?us-ascii?Q?9BTmarr6XYliu3HvEpHJiJUQP379WCnPIHJOezogy18h976n+D+dDvL46ztb?=
 =?us-ascii?Q?gdOPS8tzpj0qTMRFZgkMRlsjZPsxBcgwV8VsbcjdSQlvb50iZ+R5WCFB1tKL?=
 =?us-ascii?Q?AssYFsLTrEAH7h4TUQ7Ir9sWaYO7K8wnT6Md7ojMu47Dl3ke8QvGw1uz7eJl?=
 =?us-ascii?Q?0YEh7n8z5GqObI61DOt99k5wD7/YWRwuWzeN/QqaQHWrG4d0wafzg6cXnZS4?=
 =?us-ascii?Q?g3h42p0YgB9vVskHv1coZsHdJhqY0MmJ/0cvmTrXql9s6z2IaEUifl/7gzk3?=
 =?us-ascii?Q?xcT+upV5ohJsPvOmOpE/YCEkyMXc1kpktcfITgwzkLkj0BcUD47oQvu3KBPL?=
 =?us-ascii?Q?gMSZ1do18HCBGIXwKECLedrfwJLqlb2LltrlbKgwQtIES3uAy1mK+9VZMDDu?=
 =?us-ascii?Q?szpwk3aA178H+rY+bYbw4TLmQilg6DmtUx55NXwgwAzlIkOstoPFUvZ91H0L?=
 =?us-ascii?Q?OWZ8e3FxbWjscQp2OOwpGnokaFcf5qQ2m2svfmnfqaweg5p8Hfmdu2gCNguX?=
 =?us-ascii?Q?r2NqzVYcFUEztJe64yJrMLwki+Fd6kR6XSLuEEk92h6W/YmZpW6M5SwfF1aA?=
 =?us-ascii?Q?fzmRHts269DnRVs9UTJbHr6qQmNic8Babl9UOTIrbNQfYAjs6RzTnsZySe3I?=
 =?us-ascii?Q?l84bcsc9+MG60/Qbtgxu8U4xjRXldp9LtPzu8Ogx0BDndjUzAj3pK5b3D/sW?=
 =?us-ascii?Q?cc8MngHFgQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08c0fac-5a44-477b-28d9-08debca413c1
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2380.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:30:04.3192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehf/4PUk13QKLCrgLjguigQ8anz1l24Lf41WN0aidBjsJpXQFUQjyYBKKclhfH6+RlTVW7fHBHp0q3TpKD0czg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124

This series fixes numerous issues in the resctrl selftests on aarch64,
where they currently misreport failures.

Patch 1 adds aarch64 implementations of cl_flush() and sb() in
fill_buf.c so cache flushes are no longer silent no-ops.

Patch 2 teaches detect_vendor() about aarch64 (which exposes no
vendor_id in /proc/cpuinfo) and lets arch_supports_noncont_cat()
return true for ARM, fixing spurious L3_NONCONT_CAT failures.

Patch 3 skips L3_CAT at feature-check time when MPAM legitimately
reports every CBM bit as shareable, instead of failing the test.

Changes since v1:
    - Make the 3 patches into a series

Richard Cheng (3):
  selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists
  selftests/resctrl: Implement cl_flush() and sb() for aarch64
  selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT

 tools/testing/selftests/resctrl/cat_test.c    | 32 +++++++++++++++++--
 tools/testing/selftests/resctrl/fill_buf.c    |  6 ++++
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 .../testing/selftests/resctrl/resctrl_tests.c | 11 +++++++
 4 files changed, 47 insertions(+), 3 deletions(-)

-- 
2.43.0


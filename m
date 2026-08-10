Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013027.outbound.protection.outlook.com [40.93.196.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616E4398E4;
	Mon, 10 Aug 2026 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387811; cv=fail; b=AWWO5BHavzxAhw0MBuzhlFVDvrpJGonPbPS4fohRvD/BS8iSMcNCWPsfRwr21KjaoPmLMvM7OkOZaJ9PhwrFj8yqEPEyjjPLDnZz/i9Q/+1AaeS4fVeo9sONi9Mg+ONaElynCvsh5Y2J+6/saOx262b0vOjGBFe+p8cJL00YN8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387811; c=relaxed/simple;
	bh=kyPOAiW0Wg3wLEaN173ju0+BCpgEAAAUVjnbGdgJzvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cLZPPJ9rV6L7fHRszvOoDQw860NYCFPXqq6+e3qa5CbDyjwH+BYVFirsrX+qO7/LkUMsQIC72Vc0pUerXyGzno6X/R80VgNWEuAUrK7jmsid4MneWZX8OSNXR/OiNo0img2I1cBIDBoIEhZ1IAKCZ1BjH0EJsVtOOaXoQdvLI6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YoDGCoJj; arc=fail smtp.client-ip=40.93.196.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YoDGCoJj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwFElsB1VvHS1MKjSjyJMY7/lfqGIvkR9+aJjEah23GpqpaU6mOJxJqrOVqcNPtyN8tDNg4QwBY99HPRHN4NYfxOImNHGSrzIcWCP9gRTHoPW6HE++AsxC1w1mDWTr6MBLu4+aXI9+44KwuLM6256Xuo5kOIDZHveowz+Pk7OVE9iR+NdfBaC8dHjtYojOyIuZnpN/1aAgmuagT773KEaV7mjk52N2sRI5XECzs67xsK0jmibU6pWc0k8fonsW9B2IwEfS64gWO3OEtWEXt+qz89pleFFki21zlvFy1+ou8ZPx6xX4hNbludcHNjwGpSup5H0U9Pi1UfcOzO7R3kEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTQTMo0nNCyYaCXhz0/zXqgGZZDjV/wBQGVHzPEjDzE=;
 b=spnwnLmi72ipWIC0Y3vJz2HnywTnjOrclemZeDrzrR1jpuio7G2qzBR+nKSdZ6IMsASSKNJ8Gj6bK/eg5jJ+1pGeBwhGwtkOtS0xLHWuFloQm4+8kRMYrXdyGn7BItBki702/7qvULFw8Z9nNukYUrun1mGfFs3IQW1xNSfhUl4lYNiK64dOiUnfBfxUoXWCaHR3G4apgk5GLoyioTlH28fH2+LUNhuU00vn78WWDz8+Gu3DM1cVxw530vVVILLschfOl9ly5AYduz0DyYHM0VAAmGrPjO9SC2Jvasm7xY5ZAk6CcK5T38Y0u1mIcXaGubtheyAfkhgWWgeayBDlKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTQTMo0nNCyYaCXhz0/zXqgGZZDjV/wBQGVHzPEjDzE=;
 b=YoDGCoJjBHLRpC7aUXhcbL6bLwMb4tsEWhzvepjvgIuY7NUy2DfFP1Wx9TewhEO2fAuSZxS+vtq6snBC8RC34hESYGnNcTAfHRgEckevga2esYh5XAQMsqrRHPCg7ksQa8KLSsvDs7d+hhdqqWMDM8tF1Z12QJasBl0B0TmsRa4=
Received: from MN0P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::30)
 by IA1PR12MB6113.namprd12.prod.outlook.com (2603:10b6:208:3eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:50:03 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::99) by MN0P222CA0028.outlook.office365.com
 (2603:10b6:208:531::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 18:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 18:50:03 +0000
Received: from tapi.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 13:49:59 -0500
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>, Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v4 5/5] selftests/resctrl: Enable MBM and MBA tests on AMD
Date: Mon, 10 Aug 2026 18:48:06 +0000
Message-ID: <20260810184806.1089507-6-swapnil.sapkal@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810184806.1089507-1-swapnil.sapkal@amd.com>
References: <20260810184806.1089507-1-swapnil.sapkal@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|IA1PR12MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ea9196-6cb0-44e8-900b-08def7103037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|7416014|376014|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	E+2v/UwQxglhuYTWaASdrwKb7wlK3/yjHNfQS6NlLH7E4xeZqG6Jw/ytuKWnVkLnmSzFCoxZJNQUreMR960mheQbEMvX1+I8RAAA46/NBclnDEw4dLKWgO+rlKDiNiA71Cqfxcj4Sl16H7NK6/602Fq7AvYhPeMZ/1QjZEcbd+ZobFOpz34ene+iyPVMDomU73cg4trYij6WlijqAnKtFvbYEj40RDVvh0x7L0PCOp+GMAD4ytJAYTSUo2tJZUWe8BGgCcATF4l6TPUKl22ePZVA1mbLjXG+I4XBy4zOz7n2kelH1VkgOAY7djV2W7GQEDDgHpAXq1nLlcBJGgagYFj3FJ4IkKdQiSXbYBaDqye3Pq7yIFqRBn6++l1zeyVnn1pbdmqDRXESYicYSfgx+parFuCnyxv2mD4QNqyuEaar2tx6BXU7xBPAWdo2+Hjicb/SJxUu8vhbw/MMrYpxcSboip/nFoXWd9/9AkP4B9n4B3peED4DwCnhRfQqr3C8R0Xdbxjv6w1nX31pGRzW2QTSHdkVF2Ak+eMhLvFqOGqgUPUZbtvGGpmCE0nLtjBAffUVw3jAVXbx6WjhBpfTJMVxYCP1Wc2NbGPBnzuTOP/QdewRoz7MEiPoQR5C8P8YrX7TPxkB5BJfQeRyYmWyaoCc1r+vsqoBATQBTsU+idDMvvbwThhErzIi+cBsZ4/chnmAFTgc3eSGdmg8MEUubA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(7416014)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ffPm3nvaCTQoPkBYENLBqerGK9TooLzpDpW0mFVvXsxx8SZoLVy1WU9aDtpM8VPqnGeVpO9LXsR2L4zixFSu9lEYTyV5pIAOhdfT6vmml34pAJPl+pG0TalgxhgldBocKL56WvILguCoslCwhgq9y8KmPZKZ3HO/u+LJyfIQeaA26P971NGbvo5EVjgR6QeBUZtIXqzQXEu0SIaRcAmOyej+Nqy1EvIn99Z6zO6cM958WothRclbpwOMNsCeYioAeekioUEKGv+aghosWZKIkBrGAA+sc1ZStK+4F9FyVD0anK/AculbXiVrK6yl0Oo3qk5P2gtLoE626kHeaGXGO1/TnTM8vJpAPpzkdx+/DK3yt1+ffBSGkkqC+rSeYBXuutiSEgxLQ7mb8JHXOZ+g8b6DV5eNnsFXiZzx6wZxsB2uhEhaXs/E7qwKuMB5nsfV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:50:03.3240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ea9196-6cb0-44e8-900b-08def7103037
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6113

From: Babu Moger <babu.moger@amd.com>

Now that the UMC (Unified Memory Controller) perf events can be used to
validate the resctrl memory bandwidth numbers on AMD, extend the
vendor_specific gate of the MBM and MBA tests to also cover AMD so that
they run on AMD in addition to Intel.

The tests stay restricted to Intel and AMD: num_of_mem_controllers()
only knows about the iMC and UMC counters, so keeping the gate (rather
than making the tests universal) leaves other vendors skipped instead of
failing.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Babu Moger <babu.moger@amd.com>
Co-developed-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---

v3->v4:
    - Rebased onto v7.2-rc7.
    - Extend the vendor_specific gate to ARCH_INTEL | ARCH_AMD instead of
      removing it, so unsupported vendors are skipped rather than reported
      as a failure.

 tools/testing/selftests/resctrl/mba_test.c | 2 +-
 tools/testing/selftests/resctrl/mbm_test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 9fcb9992c529..97b7d368d5a2 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -271,7 +271,7 @@ static bool mba_feature_check(const struct resctrl_test *test)
 struct resctrl_test mba_test = {
 	.name = "MBA",
 	.resource = "MB",
-	.vendor_specific = ARCH_INTEL,
+	.vendor_specific = ARCH_INTEL | ARCH_AMD,
 	.feature_check = mba_feature_check,
 	.run_test = mba_run_test,
 	.cleanup = mba_test_cleanup,
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index d89f71c58335..515717743a61 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -177,7 +177,7 @@ static bool mbm_feature_check(const struct resctrl_test *test)
 struct resctrl_test mbm_test = {
 	.name = "MBM",
 	.resource = "MB",
-	.vendor_specific = ARCH_INTEL,
+	.vendor_specific = ARCH_INTEL | ARCH_AMD,
 	.feature_check = mbm_feature_check,
 	.run_test = mbm_run_test,
 	.cleanup = mbm_test_cleanup,
-- 
2.43.0


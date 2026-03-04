Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F17637EFEF;
	Wed,  4 Mar 2026 04:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597027; cv=none; b=ob2JrgOpytoYmOVsPN7wz6foUOog6bWzdnTMI3NNk9V262MPoKE2d5z55i3T4uldP/c3T0j7w1UY5SjGxuvrYEfsfdX8wDmYmG6CoGJWvqGcqm2iui2eb6oFh4m7TV/n0DrAjftIZA17QJD26xawOcCWcNosZQIXj7lkhdi1KFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597027; c=relaxed/simple;
	bh=fXoC8rRu8ncPCFkyyLu1EXJ4FDa4DnNH0o6t6hFvvSM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XIK4U9Etig/lDrhwJ14TIn3+VDj7mjgTbrYekocX6zXxJUdasr3PMvo8IGXuTLo1PYdxl/F0LW5GKAlgNp+qyuYsvWYpcVGPtO20FanDao8u5lkqf0F+ru4mkfMTyxKEw9pJA4jqhMkAly6uHkAW+af6J/7Qj7jiy7CnAnhQLas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=TiP32JKA; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="TiP32JKA"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ffq+ffv2AEW6XoO4gokHEtGBQnh5vVWTy9dBnVUZO6c=;
	b=TiP32JKAkclrZflA0AxrMU2liHLl2vMgh/tED2yzwJl5dwqMbFr32EgBJxeONevUt08Ufsob9
	tpf3FcOzFvoYh8NnaXk2GAKJcDwLdHQY5oG1brMx2eQlU0OpZ2YmX0h6G4tkVW1MswpG7kVEJuw
	pUecLwUTKdF2tRHDcDfdQds=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6b6jdbzRhTQ;
	Wed,  4 Mar 2026 11:58:47 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3544A202E6;
	Wed,  4 Mar 2026 12:03:38 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:37 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [RFC patch 4/9] selftests/resctrl: Move memory bandwidth measurement init and cleanup to resctrl_val.c
Date: Wed, 4 Mar 2026 12:03:29 +0800
Message-ID: <20260304040334.765860-5-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260304040334.765860-1-wuyifan50@huawei.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)

The initialization for memory bandwidth measurement was duplicated across
mbm_test.c and mba_test.c.

This commit move the memory bandwidth measurement's initialization
to resctrl_val.c. It introduces a new common initialization function,
including the new vendor-specific configuration setup.

Additionally, a cleanup call has been added to the test teardown routines
to ensure that resources allocated during initialization are properly
released.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/mba_test.c    | 11 ++---------
 tools/testing/selftests/resctrl/mbm_test.c    | 11 ++---------
 tools/testing/selftests/resctrl/resctrl_val.c |  8 ++++++++
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index c7e9adc0368f..c41914f6a2e6 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -19,15 +19,7 @@
 
 static int mba_init(const struct resctrl_val_param *param, int domain_id)
 {
-	int ret;
-
-	ret = initialize_read_mem_bw_imc();
-	if (ret)
-		return ret;
-
-	initialize_mem_bw_resctrl(param, domain_id);
-
-	return 0;
+	return initialize_measure_read_mem_bw(param, domain_id);
 }
 
 /*
@@ -164,6 +156,7 @@ static int check_results(void)
 
 static void mba_test_cleanup(void)
 {
+	cleanup_read_mem_bw_imc();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 84d8bc250539..1d4ef268db5a 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -85,15 +85,7 @@ static int check_results(size_t span)
 
 static int mbm_init(const struct resctrl_val_param *param, int domain_id)
 {
-	int ret;
-
-	ret = initialize_read_mem_bw_imc();
-	if (ret)
-		return ret;
-
-	initialize_mem_bw_resctrl(param, domain_id);
-
-	return 0;
+	return initialize_measure_read_mem_bw(param, domain_id);
 }
 
 static int mbm_setup(const struct resctrl_test *test,
@@ -123,6 +115,7 @@ static int mbm_measure(const struct user_params *uparams,
 
 static void mbm_test_cleanup(void)
 {
+	cleanup_read_mem_bw_imc();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 68e46c863474..75a3d359f16b 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -520,6 +520,14 @@ int initialize_measure_read_mem_bw(const struct resctrl_val_param *param, int do
 	if (!current_config->vendor_id)
 		return -1;
 
+	int ret;
+
+	ret = initialize_read_mem_bw_imc();
+	if (ret)
+		return ret;
+
+	initialize_mem_bw_resctrl(param, domain_id);
+
 	return 0;
 }
 
-- 
2.33.0


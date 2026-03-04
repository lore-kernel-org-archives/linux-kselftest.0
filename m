Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B0C37F72F;
	Wed,  4 Mar 2026 04:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597034; cv=none; b=exrfOI1PQIMcgXGtkmAj2d8Fn/7duEvVWzELh5tpawgRve+WapTf/a5e6xU/87J6OBnqjJ2sY+ouQHcAIzHtci8L8ecOmGe+oPHhGDLx7OKJdS1t4+42snpD0XfbNWCvfrwJBLg27OZYpsNOAHb7/92ZrDfR/vGp5BE0IhuHDBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597034; c=relaxed/simple;
	bh=36FpjVBtxAQB5NwKKjzjbclUJy/9nqEWaa9WwPfGJ0s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C5wQeHiPFMDdEwECoQjGPELbMG+Q4G91zL7e/KsU7H5unYB5BqVILuOaQBkgYFYqAt8jA3IxBjDZAJLEW1mUXgYCQDXflfGcvpO2eTEA/yotrb3vlTAzvaslaZJFuuk8aOlEQ2CZFj5mto7W6w7Qvd32cQhFh3XyKzUOoHMK1BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=z0l1/gC9; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="z0l1/gC9"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=K0uaACBVh1x7LkH20bvlUt3ZEiQsV/Byfo7bO3qkE0U=;
	b=z0l1/gC9C8fHpD4xjAvIMvKGXxoOytCuapn5GmNMDZb9WF9e6mc4zbYQy3ckjswNFTFJepDPK
	yPSL0Pp/ezRdfyHCbJIDa6DvypwLeHzNxeQNgZOk+FVRQ2GCE+EzLsyn+kbFBRvm/UXKVqkQVik
	6AQId4aQF+t9axYm5JAa0Qo=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6h1jBYz1K9Bt;
	Wed,  4 Mar 2026 11:58:52 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D87D940561;
	Wed,  4 Mar 2026 12:03:40 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:40 +0800
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
Subject: [RFC patch 8/9] selftests/resctrl: Add support for HiSilicon MBM/MBA test
Date: Wed, 4 Mar 2026 12:03:33 +0800
Message-ID: <20260304040334.765860-9-wuyifan50@huawei.com>
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

This commit adds the support to check and test this feature on HiSilicon
platform.

Specifically, this is because on HiSilicon platform, the mbm_total_bytes
counter for MBM/MBA is located in the MB_MON, which is distinct from other
monitoring paths.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/mba_test.c | 24 +++++++++++++++++++---
 tools/testing/selftests/resctrl/mbm_test.c | 23 +++++++++++++++++----
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index c41914f6a2e6..ebed2d2d6ce0 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -202,14 +202,32 @@ static int mba_run_test(const struct resctrl_test *test, const struct user_param
 
 static bool mba_feature_check(const struct resctrl_test *test)
 {
-	return test_resource_feature_check(test) &&
-	       resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes");
+	unsigned int vendor = get_vendor();
+	bool feature_exists = false;
+
+	switch (vendor) {
+	case ARCH_INTEL:
+		feature_exists = test_resource_feature_check(test) &&
+					resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes");
+		break;
+
+	case ARCH_HISILICON:
+		feature_exists = test_resource_feature_check(test) &&
+					resctrl_mon_feature_exists("MB_MON", "mbm_total_bytes");
+		break;
+
+	default:
+		break;
+	}
+
+	return feature_exists;
+
 }
 
 struct resctrl_test mba_test = {
 	.name = "MBA",
 	.resource = "MB",
-	.vendor_specific = ARCH_INTEL,
+	.vendor_specific = ARCH_INTEL | ARCH_HISILICON,
 	.feature_check = mba_feature_check,
 	.run_test = mba_run_test,
 	.cleanup = mba_test_cleanup,
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 1d4ef268db5a..44bb450398e7 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -161,14 +161,29 @@ static int mbm_run_test(const struct resctrl_test *test, const struct user_param
 
 static bool mbm_feature_check(const struct resctrl_test *test)
 {
-	return resctrl_mon_feature_exists("L3_MON", "mbm_total_bytes") &&
-	       resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes");
-}
+	unsigned int vendor = get_vendor();
+	bool feature_exists = false;
+
+	switch (vendor) {
+	case ARCH_INTEL:
+		feature_exists = resctrl_mon_feature_exists("L3_MON", "mbm_total_bytes") &&
+					resctrl_mon_feature_exists("L3_MON", "mbm_local_bytes");
+		break;
+
+	case ARCH_HISILICON:
+		feature_exists = resctrl_mon_feature_exists("MB_MON", "mbm_total_bytes");
+		break;
 
+	default:
+		break;
+	}
+
+	return feature_exists;
+}
 struct resctrl_test mbm_test = {
 	.name = "MBM",
 	.resource = "MB",
-	.vendor_specific = ARCH_INTEL,
+	.vendor_specific = ARCH_INTEL | ARCH_HISILICON,
 	.feature_check = mbm_feature_check,
 	.run_test = mbm_run_test,
 	.cleanup = mbm_test_cleanup,
-- 
2.33.0


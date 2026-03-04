Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2537E2F4;
	Wed,  4 Mar 2026 04:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597025; cv=none; b=MwJ/YcnrtsxJ6/F0bMfW3uN37DxcwwrR/GdGLz+Y1FWC9zwtJzTLnEcsoAGCxkEHBCfLXBwkULDjAgFER7B8SLalplov1St4p5sfXzvs2zMn5NrcpPNreVTldMfSh0BxDVtqUGSIzN4I0edHtHnCAoXazuTGx/yplEGhUeBRFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597025; c=relaxed/simple;
	bh=80sfpqAt2rO/+jceRYwAuPYQBNckL5psv8lY34EgYWo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JsvzatBmh32v9b8tP4YiI+f/V2y1b6jZzvDIgOIuI8jdhGjseayDnl/cNxBgXjZWSs2YgZZmFhDvMT1HNGm3Hmco1suryDxRu4RwFHJ21Vf91bRl97KxaziJ+JY4TxLb16w0onSq3+Envl8txlg+spPfZka666YyKHacF37Nv10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=DCATHUJp; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="DCATHUJp"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1o2MhPh9+ZeE7u/z+qBXrIbJ3flY0UMRQ5CbaMHY31U=;
	b=DCATHUJpULTz7dfsn5qUeqoLLAroUULOdj+2CCV6u74+I/mE7+TnRMoqyoDUac591cTZhKckm
	sSImPZ2kTA+chgVVy2XNDchJZcdH9b+7323FeEs8bh4l3NTPnNb7GdDz+xymsp7iW4mAOEdrfQm
	VNU7ZpRa5wkvRPuxHu+n8+M=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6D2VJxzcbMV;
	Wed,  4 Mar 2026 11:58:28 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7EB14202E6;
	Wed,  4 Mar 2026 12:03:41 +0800 (CST)
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
Subject: [RFC patch 9/9] selftests/resctrl: Add support for HiSilicon CAT/CMT test
Date: Wed, 4 Mar 2026 12:03:34 +0800
Message-ID: <20260304040334.765860-10-wuyifan50@huawei.com>
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

This commit adds support for HiSilicon CAT/CMT test by adapting the
HiSilicon-specificed implementation.

1. Handle Cache Masking on HiSilicon: On HiSilicon's platform, all
cache are shareable, platform-level non-contiguous CAT is not applicable,
and the test should default to using the full cache.

2. Extend Non-Contiguous CAT Support: HiSilicon always support
non-contiguous CBM.

3. Specify Mount Options for HiSilicon resctrlfs: When mounting the
resctrl filesystem on HiSilicon platform, specify "l2" option.

4. Adjust Perf Event Attributes for ARM: ARM performance counters
do not support mode exclusion.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/cache.c     |  4 +++-
 tools/testing/selftests/resctrl/cat_test.c  | 18 +++++++++++-------
 tools/testing/selftests/resctrl/resctrlfs.c |  5 ++++-
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cache.c b/tools/testing/selftests/resctrl/cache.c
index 1ff1104e6575..798aefc6cb29 100644
--- a/tools/testing/selftests/resctrl/cache.c
+++ b/tools/testing/selftests/resctrl/cache.c
@@ -13,7 +13,9 @@ void perf_event_attr_initialize(struct perf_event_attr *pea, __u64 config)
 	pea->read_format = PERF_FORMAT_GROUP;
 	pea->exclude_kernel = 1;
 	pea->exclude_hv = 1;
-	pea->exclude_idle = 1;
+	/* ARM performance counters do not support mode exclusion */
+	if (get_vendor() != ARCH_HISILICON)
+		pea->exclude_idle = 1;
 	pea->exclude_callchain_kernel = 1;
 	pea->inherit = 1;
 	pea->exclude_guest = 1;
diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index f00b622c1460..e5365665a6d3 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -245,11 +245,15 @@ static int cat_run_test(const struct resctrl_test *test, const struct user_param
 	ret = get_full_cbm(test->resource, &full_cache_mask);
 	if (ret)
 		return ret;
-	/* Get the largest contiguous exclusive portion of the cache */
-	ret = get_mask_no_shareable(test->resource, &long_mask);
-	if (ret)
-		return ret;
-
+	if (get_vendor() == ARCH_HISILICON) {
+		/* On HiSilicon's platform, all cache are shareable. */
+		long_mask = full_cache_mask;
+	} else {
+		/* Get the largest contiguous exclusive portion of the cache */
+		ret = get_mask_no_shareable(test->resource, &long_mask);
+		if (ret)
+			return ret;
+	}
 	/* Get L3/L2 cache size */
 	ret = get_cache_size(uparams->cpu, test->resource, &cache_total_size);
 	if (ret)
@@ -292,8 +296,8 @@ static bool arch_supports_noncont_cat(const struct resctrl_test *test)
 {
 	unsigned int vendor_id = get_vendor();
 
-	/* AMD and Hygon always support non-contiguous CBM. */
-	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON)
+	/* AMD and Hygon and HiSilicon always support non-contiguous CBM. */
+	if (vendor_id == ARCH_AMD || vendor_id == ARCH_HYGON || vendor_id == ARCH_HISILICON)
 		return true;
 
 #if defined(__i386__) || defined(__x86_64__) /* arch */
diff --git a/tools/testing/selftests/resctrl/resctrlfs.c b/tools/testing/selftests/resctrl/resctrlfs.c
index 01b775cfe849..7567d3b31efb 100644
--- a/tools/testing/selftests/resctrl/resctrlfs.c
+++ b/tools/testing/selftests/resctrl/resctrlfs.c
@@ -69,7 +69,10 @@ int mount_resctrlfs(void)
 		return -1;
 
 	ksft_print_msg("Mounting resctrl to \"%s\"\n", RESCTRL_PATH);
-	ret = mount("resctrl", RESCTRL_PATH, "resctrl", 0, NULL);
+	if (get_vendor() == ARCH_HISILICON)
+		ret = mount("resctrl", RESCTRL_PATH, "resctrl", 0, "l2");
+	else
+		ret = mount("resctrl", RESCTRL_PATH, "resctrl", 0, NULL);
 	if (ret)
 		ksft_perror("mount");
 
-- 
2.33.0


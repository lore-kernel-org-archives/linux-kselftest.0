Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005C30595B;
	Tue, 24 Mar 2026 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356642; cv=none; b=W9lHw9xexYXX3PFnFTr0e+pYAIhLhDUrUTDSaX1uOTm+5QvKk1nW5VO/Fk4LC2M2U5XzM1x0AZXMj8sHSWBTryo8qFVu5VIcyKKxoWkkm+1NEP9voVD8qhx2Bv+suRKcWRMmRcCwLytS0qBzjGDcBk10l7+JcZBayuYBkHjRENU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356642; c=relaxed/simple;
	bh=xEgErpbabjpGH3nL3u3JiQzAa/JlZFvNw1tXPC+6oQ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cPs+B8QQwnb/aCnId36B6NxxWVp2yTeyDKhTf6nem2gR6Xl9caNBi4Oi2a+sH+4P+fy965ErXo6mV5DQgegcw6ULf9Ffjb+jePNb30wNgdqymbkmV2XLIbN1CF3fFjSI+SrD4m88GXRKoUstYKW20OTQMbn5WmeNvBTetHdERFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Qe/WPNGh; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Qe/WPNGh"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SIuCbAbKu7kNYu1ZZRlrYWiiyCn0PY9hwvPkx8mbFIM=;
	b=Qe/WPNGhmzdxIAlsb49zn0p4EuElA8IG/GzRsvveUIDc3T5s1V+CddX6mAM5Ov+WUn8f22RNd
	kdkCtYOz27uvxsYYhP3kKG0GQ0A3zaMVGEcsopVUnkGec0fIECrQ3KX+ovDOs5VHvR4dc8Yt/2l
	4nGS9QO9A3FtFit07oCycLc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fg8qz1tL8zRhRB;
	Tue, 24 Mar 2026 20:44:31 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B9354056A;
	Tue, 24 Mar 2026 20:50:36 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Mar
 2026 20:50:35 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<wuyifan50@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH 1/3] selftests/resctrl: Introduced linked list management for IMC counters
Date: Tue, 24 Mar 2026 20:50:32 +0800
Message-ID: <20260324125034.1509177-2-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260324125034.1509177-1-wuyifan50@huawei.com>
References: <20260324125034.1509177-1-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Added linked list based management for IMC counter configurations,
allowing the system to dynamically allocate and clean up resources based on
actual hardware capabilities.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 tools/testing/selftests/resctrl/resctrl_val.c | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 175101022bf3..29c9f76132f0 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -24,6 +24,7 @@
 #include <linux/perf_event.h>
 #include <linux/compiler.h>
 #include <linux/bits.h>
+#include  <linux/list.h>
 #include "kselftest.h"
 
 #define MB			(1024 * 1024)
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index f20d2194c35f..ac58d3862281 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -28,6 +28,7 @@ struct membw_read_format {
 };
 
 struct imc_counter_config {
+	struct list_head imc_list;
 	__u32 type;
 	__u64 event;
 	__u64 umask;
@@ -38,6 +39,7 @@ struct imc_counter_config {
 static char mbm_total_path[1024];
 static int imcs;
 static struct imc_counter_config imc_counters_config[MAX_IMCS];
+LIST_HEAD(imc_counters_configs);
 static const struct resctrl_test *current_test;
 
 static void read_mem_bw_initialize_perf_event_attr(int i)
@@ -235,6 +237,7 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
  */
 static int num_of_imcs(void)
 {
+	struct imc_counter_config *imc_counters_config;
 	char imc_dir[512], *temp;
 	unsigned int count = 0;
 	struct dirent *ep;
@@ -263,14 +266,23 @@ static int num_of_imcs(void)
 			 * first character is a numerical digit or not.
 			 */
 			if (temp[0] >= '0' && temp[0] <= '9') {
+				imc_counters_config = malloc(sizeof(struct imc_counter_config));
+				if (!imc_counters_config) {
+					ksft_print_msg("Unable to allocate memory for iMC counters\n");
+
+					return -1;
+				}
+				memset(imc_counters_config, 0, sizeof(struct imc_counter_config));
 				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
 				ret = read_from_imc_dir(imc_dir, &count);
 				if (ret) {
+					free(imc_counters_config);
 					closedir(dp);
 
 					return ret;
 				}
+				list_add(&imc_counters_config->imc_list, &imc_counters_configs);
 			}
 		}
 		closedir(dp);
@@ -303,6 +315,19 @@ int initialize_read_mem_bw_imc(void)
 	return 0;
 }
 
+void cleanup_read_mem_bw_imc(void)
+{
+	struct imc_counter_config *next_imc_counters_config;
+	struct imc_counter_config *imc_counters_config;
+
+	list_for_each_entry_safe(imc_counters_config, next_imc_counters_config,
+				 &imc_counters_configs, imc_list) {
+		list_del(&imc_counters_config->imc_list);
+		free(imc_counters_config);
+	}
+	INIT_LIST_HEAD(&imc_counters_configs);
+}
+
 static void perf_close_imc_read_mem_bw(void)
 {
 	int mc;
-- 
2.33.0


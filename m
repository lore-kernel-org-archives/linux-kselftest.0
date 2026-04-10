Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC88F33A70E;
	Fri, 10 Apr 2026 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813654; cv=none; b=judLi38j5mL2rnCWCfF6+ToElXkeEXre9KNjy1Dg7wkwo7EkBDima3s04kKKwH+njn+it6r9Trr2CymkNY6YMtQPv6hb2BwSA82CTQzDN2gXoF6bVgzd6quoqpUCRxbqIPlx8TByJa6wxjBeNHpj/VHQmJlhJsHo6xGHac4LT/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813654; c=relaxed/simple;
	bh=PazdHqLl9tsE/Qdx3VJSTwchfa6Y+GCXHdx7bJuITvM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=knnjqxFnWWqKIhUC33OsnULB0l3jDrTSuQHZv7lFTXFanRWj8a2lOj5TgZ+zaHaYXXs2hJ8pMqLnoGTIIsOzRjOYKWu+oIrDmIGBzZV3FpGdoYP0WAegS076CdNvrZ8wVAnVbcJsAHPryfk6GCBF1oY5uk/xVqL4uEJ+K1A6/B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=jocgOYpj; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=jocgOYpj; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="jocgOYpj";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="jocgOYpj"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8IjqAoeDdVagfBLkiypNJEraYHsPPairzevdGS/Cfvo=;
	b=jocgOYpjemc0kB90wXgea0j6u3rV4DidOaE9dm94KqDfLxUQgid6UC5yUbdFDq9cc2JK7hN4N
	qyqOBIHRaQ6Guv7TgHA6IUOBBNRySSlz8t2SZBALwBT06CwmjA7JfSjTu/5jVUAqSb2YYV3dIQd
	HVRTjaEbXy/OyJS3K1mSgBQ=
Received: from canpmsgout05.his.huawei.com (unknown [172.19.92.145])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fsWnk5Ffvz1BG7B;
	Fri, 10 Apr 2026 17:33:30 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8IjqAoeDdVagfBLkiypNJEraYHsPPairzevdGS/Cfvo=;
	b=jocgOYpjemc0kB90wXgea0j6u3rV4DidOaE9dm94KqDfLxUQgid6UC5yUbdFDq9cc2JK7hN4N
	qyqOBIHRaQ6Guv7TgHA6IUOBBNRySSlz8t2SZBALwBT06CwmjA7JfSjTu/5jVUAqSb2YYV3dIQd
	HVRTjaEbXy/OyJS3K1mSgBQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fsWfs4W5Jz12LCq;
	Fri, 10 Apr 2026 17:27:33 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7329940561;
	Fri, 10 Apr 2026 17:33:54 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 10 Apr
 2026 17:33:53 +0800
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
Subject: [PATCH v2 1/6] selftests/resctrl: Introduced linked list management for IMC counters
Date: Fri, 10 Apr 2026 17:33:47 +0800
Message-ID: <20260410093352.3988125-2-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260410093352.3988125-1-wuyifan50@huawei.com>
References: <20260410093352.3988125-1-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Added linked list based management for IMC counter configurations,
allowing the system to dynamically allocate and clean up resources based on
actual hardware capabilities.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/mba_test.c    |  1 +
 tools/testing/selftests/resctrl/mbm_test.c    |  1 +
 tools/testing/selftests/resctrl/resctrl.h     |  2 ++
 tools/testing/selftests/resctrl/resctrl_val.c | 20 +++++++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/tools/testing/selftests/resctrl/mba_test.c b/tools/testing/selftests/resctrl/mba_test.c
index 39cee9898359..4bb1a82eb195 100644
--- a/tools/testing/selftests/resctrl/mba_test.c
+++ b/tools/testing/selftests/resctrl/mba_test.c
@@ -166,6 +166,7 @@ static int check_results(void)
 
 static void mba_test_cleanup(void)
 {
+	cleanup_read_mem_bw_imc();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/mbm_test.c b/tools/testing/selftests/resctrl/mbm_test.c
index 6dbbc3b76003..68c89f50a34a 100644
--- a/tools/testing/selftests/resctrl/mbm_test.c
+++ b/tools/testing/selftests/resctrl/mbm_test.c
@@ -125,6 +125,7 @@ static int mbm_measure(const struct user_params *uparams,
 
 static void mbm_test_cleanup(void)
 {
+	cleanup_read_mem_bw_imc();
 	remove(RESULT_FILE_NAME);
 }
 
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 175101022bf3..a7556cdae0de 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -24,6 +24,7 @@
 #include <linux/perf_event.h>
 #include <linux/compiler.h>
 #include <linux/bits.h>
+#include <linux/list.h>
 #include "kselftest.h"
 
 #define MB			(1024 * 1024)
@@ -183,6 +184,7 @@ void mem_flush(unsigned char *buf, size_t buf_size);
 void fill_cache_read(unsigned char *buf, size_t buf_size, bool once);
 ssize_t get_fill_buf_size(int cpu_no, const char *cache_type);
 int initialize_read_mem_bw_imc(void);
+void cleanup_read_mem_bw_imc(void);
 int measure_read_mem_bw(const struct user_params *uparams,
 			struct resctrl_val_param *param, pid_t bm_pid);
 void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index f20d2194c35f..d9ae24e9d971 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -28,6 +28,7 @@ struct membw_read_format {
 };
 
 struct imc_counter_config {
+	struct list_head entry;
 	__u32 type;
 	__u64 event;
 	__u64 umask;
@@ -38,6 +39,7 @@ struct imc_counter_config {
 static char mbm_total_path[1024];
 static int imcs;
 static struct imc_counter_config imc_counters_config[MAX_IMCS];
+LIST_HEAD(imc_counters_list);
 static const struct resctrl_test *current_test;
 
 static void read_mem_bw_initialize_perf_event_attr(int i)
@@ -113,6 +115,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 				    unsigned int *count)
 {
 	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
+	struct imc_counter_config *imc_counter;
 	unsigned int orig_count = *count;
 	char cas_count_cfg[1024];
 	struct dirent *ep;
@@ -167,11 +170,17 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 			ksft_print_msg("Maximum iMC count exceeded\n");
 			goto out_close;
 		}
+		imc_counter = calloc(1, sizeof(*imc_counter));
+		if (!imc_counter) {
+			ksft_perror("Unable to allocate memory for iMC counters\n");
+			goto out_close;
+		}
 
 		imc_counters_config[*count].type = type;
 		get_read_event_and_umask(cas_count_cfg, *count);
 		/* Do not fail after incrementing *count. */
 		*count += 1;
+		list_add(&imc_counter->entry, &imc_counters_list);
 	}
 	if (*count == orig_count) {
 		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
@@ -303,6 +312,17 @@ int initialize_read_mem_bw_imc(void)
 	return 0;
 }
 
+void cleanup_read_mem_bw_imc(void)
+{
+	struct imc_counter_config *imc_counter, *tmp;
+
+	list_for_each_entry_safe(imc_counter, tmp,
+				 &imc_counters_list, entry) {
+		list_del(&imc_counter->entry);
+		free(imc_counter);
+	}
+}
+
 static void perf_close_imc_read_mem_bw(void)
 {
 	int mc;
-- 
2.43.0


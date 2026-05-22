Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9EF3B6C14;
	Fri, 22 May 2026 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440753; cv=none; b=YY3CPCQWRykSSWIR1qkM4UVFxWuPiIvaAjlLJl5tRTn2gv/LHSwz2jkwPzOvWSAntrvheftQrPRyhWa8p16Fm3WnMm38fptiGBQSX3yfVhp1WN4wKuBwSEb42vOGOQnQ+bJPxMzidl2WzLG+A1F0K/EVCKvcq2djvOj4F7tGmgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440753; c=relaxed/simple;
	bh=onVQprd6DEDTJaMCZ/BPAeqLWRlerMmXYqk/i5JCH1c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l4seeq+Cy+OfEWdi+Mgr2njv+N2EqW5ua1Rgc5aU+sSuXV7iY1G9VuBEddbkzvKnu0uON4fu2wngf1e55ny7eoa10BJAG58hZ9p7G4VjGkhCf/5Sc7/CYMKrrqFlPNEu75/a47AZFGK5fh+o937GYJJp+U0r8ilHNfqUWLTbPQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=46R7hVEl; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="46R7hVEl"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=171MQcM9CJWyfM3/2Ru252BSs6XH3O3/Wc0oiM+Mdo0=;
	b=46R7hVElxJRykBcWe1HatiAKJuY7Iicpd8UQDywhW3QCaFWMA7W3EGVywhxgdu3EudQZjBzjj
	XRttR71t6SFsWjzF8AHUcVu+Huw6SFF4VxPpFzfJWIX5PQpAzyJUmflLKWMVRvUHrTi79A+dZXI
	WksSZUXDI8dMArpwC8ZW6gI=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gMK0z4TSTz12LD3;
	Fri, 22 May 2026 16:57:39 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3CA16203B1;
	Fri, 22 May 2026 17:05:42 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 22 May
 2026 17:05:41 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <shuah@kernel.org>, <tan.shaopeng@fujitsu.com>,
	<fenghuay@nvidia.com>, <ben.horgan@arm.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v3 1/3] selftests/resctrl: Introduce linked list management for IMC counters
Date: Fri, 22 May 2026 17:05:38 +0800
Message-ID: <20260522090540.444554-2-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260522090540.444554-1-wuyifan50@huawei.com>
References: <20260522090540.444554-1-wuyifan50@huawei.com>
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

The static array approach to managing IMC counters has fixed size
constraints and limited compatibility and scalability. Introduce
a linked list-based dynamic management infrastructure to address
these limitations. Add the core data structure definitions and
memory allocation and cleanup functions for dynamic counter
configurations.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/mba_test.c    |  1 +
 tools/testing/selftests/resctrl/mbm_test.c    |  1 +
 tools/testing/selftests/resctrl/resctrl.h     |  2 ++
 tools/testing/selftests/resctrl/resctrl_val.c | 27 +++++++++++++++++--
 4 files changed, 29 insertions(+), 2 deletions(-)

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
index f20d2194c35f..a72dc4ae61fe 100644
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
@@ -126,13 +129,13 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 			    imc_dir);
 	if (path_len >= sizeof(imc_events_dir)) {
 		ksft_print_msg("Unable to create path to %sevents\n", imc_dir);
-		return -1;
+		goto out;
 	}
 
 	dp = opendir(imc_events_dir);
 	if (!dp) {
 		ksft_perror("Unable to open PMU events directory");
-		return -1;
+		goto out;
 	}
 
 	while ((ep = readdir(dp))) {
@@ -167,11 +170,17 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 			ksft_print_msg("Maximum iMC count exceeded\n");
 			goto out_close;
 		}
+		imc_counter = calloc(1, sizeof(*imc_counter));
+		if (!imc_counter) {
+			ksft_perror("Unable to allocate memory for iMC counters");
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
@@ -180,6 +189,10 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 	ret = 0;
 out_close:
 	closedir(dp);
+out:
+	if (ret)
+		cleanup_read_mem_bw_imc();
+
 	return ret;
 }
 
@@ -303,6 +316,16 @@ int initialize_read_mem_bw_imc(void)
 	return 0;
 }
 
+void cleanup_read_mem_bw_imc(void)
+{
+	struct imc_counter_config *imc_counter, *tmp;
+
+	list_for_each_entry_safe(imc_counter, tmp, &imc_counters_list, entry) {
+		list_del(&imc_counter->entry);
+		free(imc_counter);
+	}
+}
+
 static void perf_close_imc_read_mem_bw(void)
 {
 	int mc;
-- 
2.34.1


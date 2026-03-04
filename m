Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BBE37E31D;
	Wed,  4 Mar 2026 04:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597026; cv=none; b=TtHt/SAYOePV085PbXYUZY12Mt5D1rhxyZzct4cF8acU7b2EKrzycMArZnw5XogITE24+mmfQrSsKj0y8HNLepBmC9ItZjqvFbqO2qiv5H2LgltmHcQFzy2Ki5lmIGFeFHtvTgodzuyIqsEEuIxyL8E4H7ixiwRG96KSK9nmBW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597026; c=relaxed/simple;
	bh=/b9cQarmDgPBiNp5S4KSO8XSZUfsNyJjluqAS0foRTU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hvwjKOCyhLuAsNJ79L2InpGj2iSOGGQmV4ky9zAL/5kixK2DY3i+r9uBYvhkPmxEpAM1hje2SadYLy59Pff3+QNUJrBBv6R1b4zepDwlB9dyldHktm9jnndlRGzzbvfeeE1SxCcm/EiRq8dBNb9a4F3uF0lzqINbapzLuQE/DX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=WAg4xjzR; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="WAg4xjzR"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bwKQfDZLKns5if9ynjLe+4Lfv8JmZHnCssBKf5Eyipg=;
	b=WAg4xjzRmfHY89Eo0ZszbpSH/Z2W0H4GnS6RJ1qjD2esE8tihbU8WDcQqs3f6f+gYmq1UIcKB
	YlA8LYI1alqaz1jpfUZclwBo4nw7IcbTfuibltU4kr4YbSyxkoRYZ1r4wljqiZJk9bGpTGoN3bH
	iJIhERqdlLMmMRD+nEL/ilU=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6Z0MSnzLlSL;
	Wed,  4 Mar 2026 11:58:46 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DDF8A40562;
	Wed,  4 Mar 2026 12:03:36 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Mar
 2026 12:03:36 +0800
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
Subject: [RFC patch 2/9] selftests/resctrl: Refactor resctrl_val.c for vendor-specific mem bw measurement
Date: Wed, 4 Mar 2026 12:03:27 +0800
Message-ID: <20260304040334.765860-3-wuyifan50@huawei.com>
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

Currently, the resctrl_val.c is tightly coupled with X86's uncore IMC
counter, which is inapplicable on other platforms like ARM.

This commit refactor resctrl_val.c by introducing a structure to support
vendor-specific PMU, event and scale. This allows the test to dynamically
select the PMU based on the detected CPU vendor, paving the way for
supporting multiple vendors and architectures.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 48 +++++++++++++++----
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 85ac96c7cb8f..b0570c615aac 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -10,10 +10,7 @@
  */
 #include "resctrl.h"
 
-#define UNCORE_IMC		"uncore_imc"
-#define READ_FILE_NAME		"events/cas_count_read"
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
-#define SCALE			0.00006103515625
 #define MAX_IMCS		20
 #define MAX_TOKENS		5
 
@@ -36,10 +33,30 @@ struct imc_counter_config {
 	int fd;
 };
 
+struct membw_read_config {
+	int vendor_id;
+	const char *name;
+	const char *event;
+	double scale;
+};
+
+static struct membw_read_config membw_read_configs[] = {
+	{
+		.vendor_id = ARCH_INTEL | ARCH_AMD | ARCH_HYGON,
+		.name = "uncore_imc",
+		.event = "events/cas_count_read",
+		.scale = 64.0 / MB,
+	},
+	{
+		.vendor_id = NULL
+	}
+};
+
 static char mbm_total_path[1024];
 static int imcs;
 static struct imc_counter_config imc_counters_config[MAX_IMCS];
 static const struct resctrl_test *current_test;
+static struct membw_read_config *current_config;
 
 static void read_mem_bw_initialize_perf_event_attr(int i)
 {
@@ -133,7 +150,7 @@ static int read_from_imc_dir(char *imc_dir, int count)
 	fclose(fp);
 
 	/* Get read config */
-	sprintf(imc_counter_cfg, "%s%s", imc_dir, READ_FILE_NAME);
+	sprintf(imc_counter_cfg, "%s%s", imc_dir, current_config->event);
 	fp = fopen(imc_counter_cfg, "r");
 	if (!fp) {
 		ksft_perror("Failed to open iMC config file");
@@ -176,18 +193,18 @@ static int num_of_imcs(void)
 	dp = opendir(DYN_PMU_PATH);
 	if (dp) {
 		while ((ep = readdir(dp))) {
-			temp = strstr(ep->d_name, UNCORE_IMC);
+			temp = strstr(ep->d_name, current_config->name);
 			if (!temp)
 				continue;
 
 			/*
 			 * imc counters are named as "uncore_imc_<n>", hence
 			 * increment the pointer to point to <n>. Note that
-			 * sizeof(UNCORE_IMC) would count for null character as
+			 * sizeof("uncore_imc") would count for null character as
 			 * well and hence the last underscore character in
 			 * uncore_imc'_' need not be counted.
 			 */
-			temp = temp + sizeof(UNCORE_IMC);
+			temp = temp + strlen(current_config->name) + 1;
 
 			/*
 			 * Some directories under "DYN_PMU_PATH" could have
@@ -328,7 +345,7 @@ static int get_read_mem_bw_imc(float *bw_imc)
 			of_mul_read = (float)r_time_enabled /
 					(float)r_time_running;
 
-		reads += r->return_value.value * of_mul_read * SCALE;
+		reads += r->return_value.value * of_mul_read * current_config->scale;
 	}
 
 	*bw_imc = reads;
@@ -469,6 +486,21 @@ static int print_results_bw(char *filename, pid_t bm_pid, float bw_imc,
 	return 0;
 }
 
+int initialize_measure_read_mem_bw(const struct resctrl_val_param *param, int domain_id)
+{
+	unsigned int vendor = get_vendor();
+
+	for (current_config = membw_read_configs;
+		!(current_config->vendor_id & vendor);
+		current_config++)
+		continue;
+
+	if (!current_config->vendor_id)
+		return -1;
+
+	return 0;
+}
+
 /*
  * measure_read_mem_bw - Measures read memory bandwidth numbers while benchmark runs
  * @uparams:		User supplied parameters
-- 
2.33.0


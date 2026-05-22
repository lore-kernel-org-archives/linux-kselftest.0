Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB93B47CB;
	Fri, 22 May 2026 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440753; cv=none; b=ts5YnCQMdBOeUBKDoW+9SaL9teAjdWpd8ksivAohYvEzU0tMYUx/2BSFs2EBn893RQKhgNau61IqpCsViMaelBGXRMLLxeLQKNImy0I3EUVtH2y0bD2b8LgM82WxFmkx8P93lOm5BXU1TBfmAC5hpMtDUIXcqFJeJ3NuxeQ5hPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440753; c=relaxed/simple;
	bh=Nefw9AEnhiRmekn7lIpCd2KGwBxAX1vg+4Lul4UKaIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W1MVHOzpERNh3XnYuVUqz8rDEZuLnWg9hHuFRfMkOITUQ5qoj5uj/AosIU07gOm16HqetjOST/TIoKYHyMRFww3JsFRADVlCmXNrGQwf2EUmKUeowgpaT0byCjgXywA5sCck/q7mLxZOO5Vsop8lT23r5qBQZU37NS1KMeuLM+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=BmJ5k3JB; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="BmJ5k3JB"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6x+Ai4MQGy8fIGxHgSMRknjeSmI2GVTe5Zg6/0V+pTc=;
	b=BmJ5k3JBRUMpvqts9+07eJJfA+VcPR7kRyBxiMSv22DvMxRBV35xRz9uJrQMfM6dFNhXV/cZ+
	MB9LKwDtAUDAi7YghpWRSKL8lOC4n65PorXklkU+CsMCSKQJw1EqTE2CiDXzS3vi4J5hBi8uQpR
	YKmQyl3ZQAUPAfoz7ZC5C+M=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gMK1P1x3rzLlSh;
	Fri, 22 May 2026 16:58:01 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 703EA4056C;
	Fri, 22 May 2026 17:05:43 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 22 May
 2026 17:05:42 +0800
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
Subject: [PATCH v3 3/3] selftests/resctrl: Enable dynamic management of IMC counters via linked list
Date: Fri, 22 May 2026 17:05:40 +0800
Message-ID: <20260522090540.444554-4-wuyifan50@huawei.com>
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

Remove the static array and the count and upper limit checks during
initialization, allowing the system to dynamically use all available
IMC counters detected by hardware.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 85 +++++++++----------
 1 file changed, 38 insertions(+), 47 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 3d2b6919717a..129e8d76222a 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -14,7 +14,6 @@
 #define READ_FILE_NAME		"cas_count_read"
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
 #define SCALE			0.00006103515625
-#define MAX_IMCS		40
 #define MAX_TOKENS		5
 
 #define CON_MBM_LOCAL_BYTES_PATH		\
@@ -37,8 +36,6 @@ struct imc_counter_config {
 };
 
 static char mbm_total_path[1024];
-static int imcs;
-static struct imc_counter_config imc_counters_config[MAX_IMCS];
 LIST_HEAD(imc_counters_list);
 static const struct resctrl_test *current_test;
 
@@ -111,12 +108,11 @@ static int open_perf_read_event(int cpu_no, struct imc_counter_config *imc_count
 	return 0;
 }
 
-static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
-				    unsigned int *count)
+static int parse_imc_read_bw_events(char *imc_dir, unsigned int type)
 {
 	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
 	struct imc_counter_config *imc_counter;
-	unsigned int orig_count = *count;
+	bool found_event = false;
 	char cas_count_cfg[1024];
 	struct dirent *ep;
 	int path_len;
@@ -166,23 +162,18 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 			ksft_perror("Could not get iMC cas count read");
 			goto out_close;
 		}
-		if (*count >= MAX_IMCS) {
-			ksft_print_msg("Maximum iMC count exceeded\n");
-			goto out_close;
-		}
 		imc_counter = calloc(1, sizeof(*imc_counter));
 		if (!imc_counter) {
 			ksft_perror("Unable to allocate memory for iMC counters");
 			goto out_close;
 		}
 
-		imc_counters_config[*count].type = type;
-		get_read_event_and_umask(cas_count_cfg, &imc_counters_config[*count]);
-		/* Do not fail after incrementing *count. */
-		*count += 1;
+		imc_counter->type = type;
+		get_read_event_and_umask(cas_count_cfg, imc_counter);
 		list_add(&imc_counter->entry, &imc_counters_list);
+		found_event = true;
 	}
-	if (*count == orig_count) {
+	if (!found_event) {
 		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
 		goto out_close;
 	}
@@ -197,7 +188,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 }
 
 /* Get type and config of an iMC counter's read event. */
-static int read_from_imc_dir(char *imc_dir, unsigned int *count)
+static int read_from_imc_dir(char *imc_dir)
 {
 	char imc_counter_type[PATH_MAX];
 	unsigned int type;
@@ -225,7 +216,7 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
 		ksft_perror("Could not get iMC type");
 		return -1;
 	}
-	ret = parse_imc_read_bw_events(imc_dir, type, count);
+	ret = parse_imc_read_bw_events(imc_dir, type);
 	if (ret) {
 		ksft_print_msg("Unable to parse bandwidth event and umask\n");
 		return ret;
@@ -242,14 +233,13 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
  * counter's event and umask for the memory read events that will be
  * measured.
  *
- * Enumerate all these details into an array of structures.
+ * Enumerate all these details into a linked list of structures.
  *
  * Return: >= 0 on success. < 0 on failure.
  */
-static int num_of_imcs(void)
+static int enumerate_imcs(void)
 {
 	char imc_dir[512], *temp;
-	unsigned int count = 0;
 	struct dirent *ep;
 	int ret;
 	DIR *dp;
@@ -278,7 +268,7 @@ static int num_of_imcs(void)
 			if (temp[0] >= '0' && temp[0] <= '9') {
 				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
-				ret = read_from_imc_dir(imc_dir, &count);
+				ret = read_from_imc_dir(imc_dir);
 				if (ret) {
 					closedir(dp);
 
@@ -287,7 +277,7 @@ static int num_of_imcs(void)
 			}
 		}
 		closedir(dp);
-		if (count == 0) {
+		if (list_empty(&imc_counters_list)) {
 			ksft_print_msg("Unable to find iMC counters\n");
 
 			return -1;
@@ -298,20 +288,22 @@ static int num_of_imcs(void)
 		return -1;
 	}
 
-	return count;
+	return 0;
 }
 
 int initialize_read_mem_bw_imc(void)
 {
-	int imc;
+	struct imc_counter_config *imc_counter;
+	int ret;
 
-	imcs = num_of_imcs();
-	if (imcs <= 0)
-		return imcs;
+	ret = enumerate_imcs();
+	if (ret < 0)
+		return ret;
 
 	/* Initialize perf_event_attr structures for all iMC's */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_initialize_perf_event_attr(&imc_counters_config[imc]);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
+		read_mem_bw_initialize_perf_event_attr(imc_counter);
+	}
 
 	return 0;
 }
@@ -328,11 +320,11 @@ void cleanup_read_mem_bw_imc(void)
 
 static void perf_close_imc_read_mem_bw(void)
 {
-	int mc;
+	struct imc_counter_config *imc_counter;
 
-	for (mc = 0; mc < imcs; mc++) {
-		if (imc_counters_config[mc].fd != -1)
-			close(imc_counters_config[mc].fd);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
+		if (imc_counter->fd != -1)
+			close(imc_counter->fd);
 	}
 }
 
@@ -344,13 +336,14 @@ static void perf_close_imc_read_mem_bw(void)
  */
 static int perf_open_imc_read_mem_bw(int cpu_no)
 {
-	int imc, ret;
+	struct imc_counter_config *imc_counter;
+	int ret;
 
-	for (imc = 0; imc < imcs; imc++)
-		imc_counters_config[imc].fd = -1;
+	list_for_each_entry(imc_counter, &imc_counters_list, entry)
+		imc_counter->fd = -1;
 
-	for (imc = 0; imc < imcs; imc++) {
-		ret = open_perf_read_event(cpu_no, &imc_counters_config[imc]);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
+		ret = open_perf_read_event(cpu_no, imc_counter);
 		if (ret)
 			goto close_fds;
 	}
@@ -370,16 +363,16 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
  */
 static void do_imc_read_mem_bw_test(void)
 {
-	int imc;
+	struct imc_counter_config *imc_counter;
 
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_reset_enable(&imc_counters_config[imc]);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry)
+		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc_counter);
 
 	sleep(1);
 
 	/* Stop counters after a second to get results. */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_disable(&imc_counters_config[imc]);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry)
+		read_mem_bw_ioctl_perf_event_ioc_disable(imc_counter);
 }
 
 /*
@@ -394,17 +387,15 @@ static void do_imc_read_mem_bw_test(void)
 static int get_read_mem_bw_imc(float *bw_imc)
 {
 	float reads = 0, of_mul_read = 1;
-	int imc;
+	struct imc_counter_config *r;
 
 	/*
 	 * Log read event values from all iMC counters into
 	 * struct imc_counter_config.
 	 * Take overflow into consideration before calculating total bandwidth.
 	 */
-	for (imc = 0; imc < imcs; imc++) {
+	list_for_each_entry(r, &imc_counters_list, entry) {
 		struct membw_read_format measurement;
-		struct imc_counter_config *r =
-			&imc_counters_config[imc];
 
 		if (read(r->fd, &measurement, sizeof(measurement)) == -1) {
 			ksft_perror("Couldn't get read bandwidth through iMC");
-- 
2.34.1


Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4996830EF6C;
	Tue, 24 Mar 2026 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356643; cv=none; b=B9vsMxRYdVb32jv3Ocli9kL7uXpYDz5RZSJHBt1t7YrF3W2BTIwq6XCLdpQUBJFr85MnTa9hRolbFbgnoDxRzB/NiqiVIIsKGVDF387llVVdLCfOTLhqAgi4+riUNUYY38mA+wmDRLcPhosxHdSOR6TJAtfKzWFW7GLNylqKIs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356643; c=relaxed/simple;
	bh=qUKiUDy5EBdT80W4TZAUlmt+FnEr5LR6odOwBkFZD5I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JlcnBd0BQj/7db7IQB6f7wbzQlNeRcOWCGhmOKFiV51+tJwcU3mA3RK3qqaepglLomsKEOo/S/TucTHAMM62T1p7WgWt+fFUgEqtbUV90ysTQXxCkK6OQ1xvYOo7LALbT0jqL1655ld5/fR96+KWvoVriXSeTyA5aaGZ7AhNuqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=QR0j0xUh; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="QR0j0xUh"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+Rj3H+Rxn3WFkspO/SlxX+arhyXmlOArDfD2BhoGg8I=;
	b=QR0j0xUhV7i7bKLoRq9PNK4I8TBHHBlYoNzg3Bu0rVHxyGmsLrD67X2PudZCOYmejbDQhfx51
	qJAdZ54NJ75JVNrqi2j7bIRcKvIgCl2PJC6OO1DBIlfSQGfYRQ3PbSAk//aLB0VDnIh33c/KrJ7
	E5mxRE+Ar2bwbXoWHG2pys0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fg8r03q7mz1cyTY;
	Tue, 24 Mar 2026 20:44:32 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id BC18D402AB;
	Tue, 24 Mar 2026 20:50:36 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Mar
 2026 20:50:36 +0800
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
Subject: [PATCH 2/3] selftests/resctrl: Replace array-based IMC counter management with linked lists
Date: Tue, 24 Mar 2026 20:50:33 +0800
Message-ID: <20260324125034.1509177-3-wuyifan50@huawei.com>
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

Convert IMC counter management from static array to dynamic
linked list allocation.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 134 +++++++++---------
 1 file changed, 66 insertions(+), 68 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index ac58d3862281..417d87ba368a 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -14,7 +14,6 @@
 #define READ_FILE_NAME		"cas_count_read"
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
 #define SCALE			0.00006103515625
-#define MAX_IMCS		40
 #define MAX_TOKENS		5
 
 #define CON_MBM_LOCAL_BYTES_PATH		\
@@ -38,36 +37,37 @@ struct imc_counter_config {
 
 static char mbm_total_path[1024];
 static int imcs;
-static struct imc_counter_config imc_counters_config[MAX_IMCS];
 LIST_HEAD(imc_counters_configs);
 static const struct resctrl_test *current_test;
 
-static void read_mem_bw_initialize_perf_event_attr(int i)
+static void read_mem_bw_initialize_perf_event_attr(struct imc_counter_config *imc_counters_config)
 {
-	memset(&imc_counters_config[i].pe, 0,
+	memset(&imc_counters_config->pe, 0,
 	       sizeof(struct perf_event_attr));
-	imc_counters_config[i].pe.type = imc_counters_config[i].type;
-	imc_counters_config[i].pe.size = sizeof(struct perf_event_attr);
-	imc_counters_config[i].pe.disabled = 1;
-	imc_counters_config[i].pe.inherit = 1;
-	imc_counters_config[i].pe.exclude_guest = 0;
-	imc_counters_config[i].pe.config =
-		imc_counters_config[i].umask << 8 |
-		imc_counters_config[i].event;
-	imc_counters_config[i].pe.sample_type = PERF_SAMPLE_IDENTIFIER;
-	imc_counters_config[i].pe.read_format =
+	imc_counters_config->pe.type = imc_counters_config->type;
+	imc_counters_config->pe.size = sizeof(struct perf_event_attr);
+	imc_counters_config->pe.disabled = 1;
+	imc_counters_config->pe.inherit = 1;
+	imc_counters_config->pe.exclude_guest = 0;
+	imc_counters_config->pe.config =
+		imc_counters_config->umask << 8 |
+		imc_counters_config->event;
+	imc_counters_config->pe.sample_type = PERF_SAMPLE_IDENTIFIER;
+	imc_counters_config->pe.read_format =
 		PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
 }
 
-static void read_mem_bw_ioctl_perf_event_ioc_reset_enable(int i)
+static void read_mem_bw_ioctl_perf_event_ioc_reset_enable(struct imc_counter_config
+	*imc_counters_config)
 {
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_RESET, 0);
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_ENABLE, 0);
+	ioctl(imc_counters_config->fd, PERF_EVENT_IOC_RESET, 0);
+	ioctl(imc_counters_config->fd, PERF_EVENT_IOC_ENABLE, 0);
 }
 
-static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
+static void read_mem_bw_ioctl_perf_event_ioc_disable(struct imc_counter_config
+	*imc_counters_config)
 {
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_DISABLE, 0);
+	ioctl(imc_counters_config->fd, PERF_EVENT_IOC_DISABLE, 0);
 }
 
 /*
@@ -75,7 +75,8 @@ static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
  * @cas_count_cfg:	Config
  * @count:		iMC number
  */
-static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
+static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_config
+	*imc_counters_config)
 {
 	char *token[MAX_TOKENS];
 	int i = 0;
@@ -89,21 +90,21 @@ static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
 		if (!token[i])
 			break;
 		if (strcmp(token[i], "event") == 0)
-			imc_counters_config[count].event = strtol(token[i + 1], NULL, 16);
+			imc_counters_config->event = strtol(token[i + 1], NULL, 16);
 		if (strcmp(token[i], "umask") == 0)
-			imc_counters_config[count].umask = strtol(token[i + 1], NULL, 16);
+			imc_counters_config->umask = strtol(token[i + 1], NULL, 16);
 	}
 }
 
-static int open_perf_read_event(int i, int cpu_no)
+static int open_perf_read_event(struct imc_counter_config *imc_counters_config, int cpu_no)
 {
-	imc_counters_config[i].fd =
-		perf_event_open(&imc_counters_config[i].pe, -1, cpu_no, -1,
+	imc_counters_config->fd =
+		perf_event_open(&imc_counters_config->pe, -1, cpu_no, -1,
 				PERF_FLAG_FD_CLOEXEC);
 
-	if (imc_counters_config[i].fd == -1) {
+	if (imc_counters_config->fd == -1) {
 		fprintf(stderr, "Error opening leader %llx\n",
-			imc_counters_config[i].pe.config);
+			imc_counters_config->pe.config);
 
 		return -1;
 	}
@@ -112,10 +113,10 @@ static int open_perf_read_event(int i, int cpu_no)
 }
 
 static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
-				    unsigned int *count)
+				    struct imc_counter_config *imc_counters_config)
 {
 	char imc_events_dir[PATH_MAX], imc_counter_cfg[PATH_MAX];
-	unsigned int orig_count = *count;
+	unsigned int orig_count = imcs;
 	char cas_count_cfg[1024];
 	struct dirent *ep;
 	int path_len;
@@ -165,17 +166,13 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 			ksft_perror("Could not get iMC cas count read");
 			goto out_close;
 		}
-		if (*count >= MAX_IMCS) {
-			ksft_print_msg("Maximum iMC count exceeded\n");
-			goto out_close;
-		}
 
-		imc_counters_config[*count].type = type;
-		get_read_event_and_umask(cas_count_cfg, *count);
-		/* Do not fail after incrementing *count. */
-		*count += 1;
+		imc_counters_config->type = type;
+		get_read_event_and_umask(cas_count_cfg, imc_counters_config);
+		/* Do not fail after incrementing count. */
+		imcs++;
 	}
-	if (*count == orig_count) {
+	if (imcs == orig_count) {
 		ksft_print_msg("Unable to find events in %s\n", imc_events_dir);
 		goto out_close;
 	}
@@ -186,7 +183,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 }
 
 /* Get type and config of an iMC counter's read event. */
-static int read_from_imc_dir(char *imc_dir, unsigned int *count)
+static int read_from_imc_dir(char *imc_dir, struct imc_counter_config *imc_counters_config)
 {
 	char imc_counter_type[PATH_MAX];
 	unsigned int type;
@@ -214,7 +211,7 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
 		ksft_perror("Could not get iMC type");
 		return -1;
 	}
-	ret = parse_imc_read_bw_events(imc_dir, type, count);
+	ret = parse_imc_read_bw_events(imc_dir, type, imc_counters_config);
 	if (ret) {
 		ksft_print_msg("Unable to parse bandwidth event and umask\n");
 		return ret;
@@ -239,7 +236,7 @@ static int num_of_imcs(void)
 {
 	struct imc_counter_config *imc_counters_config;
 	char imc_dir[512], *temp;
-	unsigned int count = 0;
+	imcs = 0;
 	struct dirent *ep;
 	int ret;
 	DIR *dp;
@@ -275,7 +272,7 @@ static int num_of_imcs(void)
 				memset(imc_counters_config, 0, sizeof(struct imc_counter_config));
 				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
-				ret = read_from_imc_dir(imc_dir, &count);
+				ret = read_from_imc_dir(imc_dir, imc_counters_config);
 				if (ret) {
 					free(imc_counters_config);
 					closedir(dp);
@@ -286,7 +283,7 @@ static int num_of_imcs(void)
 			}
 		}
 		closedir(dp);
-		if (count == 0) {
+		if (imcs == 0) {
 			ksft_print_msg("Unable to find iMC counters\n");
 
 			return -1;
@@ -297,20 +294,22 @@ static int num_of_imcs(void)
 		return -1;
 	}
 
-	return count;
+	return imcs;
 }
 
 int initialize_read_mem_bw_imc(void)
 {
-	int imc;
+	int ret;
+	struct imc_counter_config *imc_counters_config;
 
-	imcs = num_of_imcs();
-	if (imcs <= 0)
-		return imcs;
+	ret = num_of_imcs();
+	if (ret <= 0)
+		return ret;
 
 	/* Initialize perf_event_attr structures for all iMC's */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_initialize_perf_event_attr(imc);
+	list_for_each_entry(imc_counters_config, &imc_counters_configs, imc_list) {
+		read_mem_bw_initialize_perf_event_attr(imc_counters_config);
+	}
 
 	return 0;
 }
@@ -330,11 +329,11 @@ void cleanup_read_mem_bw_imc(void)
 
 static void perf_close_imc_read_mem_bw(void)
 {
-	int mc;
+	struct imc_counter_config *imc_counters_config;
 
-	for (mc = 0; mc < imcs; mc++) {
-		if (imc_counters_config[mc].fd != -1)
-			close(imc_counters_config[mc].fd);
+	list_for_each_entry(imc_counters_config, &imc_counters_configs, imc_list) {
+		if (imc_counters_config->fd != -1)
+			close(imc_counters_config->fd);
 	}
 }
 
@@ -346,13 +345,14 @@ static void perf_close_imc_read_mem_bw(void)
  */
 static int perf_open_imc_read_mem_bw(int cpu_no)
 {
-	int imc, ret;
+	int ret;
+	struct imc_counter_config *imc_counters_config;
 
-	for (imc = 0; imc < imcs; imc++)
-		imc_counters_config[imc].fd = -1;
+	list_for_each_entry(imc_counters_config, &imc_counters_configs, imc_list)
+		imc_counters_config->fd = -1;
 
-	for (imc = 0; imc < imcs; imc++) {
-		ret = open_perf_read_event(imc, cpu_no);
+	list_for_each_entry(imc_counters_config, &imc_counters_configs, imc_list) {
+		ret = open_perf_read_event(imc_counters_config, cpu_no);
 		if (ret)
 			goto close_fds;
 	}
@@ -372,16 +372,16 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
  */
 static void do_imc_read_mem_bw_test(void)
 {
-	int imc;
+	struct imc_counter_config *imc_counters_config;
 
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc);
+	list_for_each_entry(imc_counters_config, &imc_counters_configs, imc_list)
+		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc_counters_config);
 
 	sleep(1);
 
 	/* Stop counters after a second to get results. */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_disable(imc);
+	list_for_each_entry(imc_counters_config, &imc_counters_configs, imc_list)
+		read_mem_bw_ioctl_perf_event_ioc_disable(imc_counters_config);
 }
 
 /*
@@ -396,17 +396,15 @@ static void do_imc_read_mem_bw_test(void)
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
+	list_for_each_entry(r, &imc_counters_configs, imc_list) {
 		struct membw_read_format measurement;
-		struct imc_counter_config *r =
-			&imc_counters_config[imc];
 
 		if (read(r->fd, &measurement, sizeof(measurement)) == -1) {
 			ksft_perror("Couldn't get read bandwidth through iMC");
-- 
2.33.0


Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8787537EFE9;
	Wed,  4 Mar 2026 04:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597028; cv=none; b=XER/PE+4vsjtGYqOfNANKZgENVQ1JhIfrCnSvwfuYglokK93xUmNp3tz4VW5iS66Q9SjvqVAPQw5/1OUiDie1F3PLbTC8/vbbOQtfmBpk94mIQcWLKypxQe2/eWHD9rStiS064QPdmPfWHK1eXzkbn8e8SlYHvBIVF0BvChkNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597028; c=relaxed/simple;
	bh=eZ6Qa95y7C/Qq2Ag9Q4FVbZmz8KbwNUm2y87w9RMIWk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WcrXX1zSTnqq3WDWTV5tsOEjdK5vdya+9eegeWQcRre2IizreCQaptI9Eq4bbNy1z5+wrDDB0tvQEe0Y1TN+2JX9JaQUc029byZ0kXgoZ+dUJsh7Bmvpw12xqjFOZAlh4IrurMGj6yiETw3SkqsrNsMFjGtYYdsFzQoDxcNNniA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=raRn0eCJ; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="raRn0eCJ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=l5MKVeWc1MFu02pEFQ4S+bTlOGPyv37doLYVbksQMw8=;
	b=raRn0eCJtHLRBC+S2WF3ovAe+oKbIcfnY4BS3Ba4zpHQpNwK6Of7boC15dAo7ZEjcN6C13fqr
	7cm2dP8ei3QH8zI+ewFwMh+JL7q2I+MjOypNUyHYOaYFNXKro448Y8ULuxwy5Js1P/RDYiUp5VY
	4GiRzjukhfjQ+YWbIC0FE/k=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fQf6c6l3hz1K98S;
	Wed,  4 Mar 2026 11:58:48 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9305D4055B;
	Wed,  4 Mar 2026 12:03:37 +0800 (CST)
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
Subject: [RFC patch 3/9] selftests/resctrl: Use dynamic linked list for iMC counters config
Date: Wed, 4 Mar 2026 12:03:28 +0800
Message-ID: <20260304040334.765860-4-wuyifan50@huawei.com>
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

Currently, a fixed-size array is used to store the configurations for
all discovered iMC counters, which has several issues:

1. Fixed Overhead: The array is allocated a fixed size, even if the
platform has fewer iMCs.

2. Out-of-Bounds Access: On platforms with more iMC counters than
MAX_IMCS, the num_of_imcs() function can return a larger number, leading
to an array index out-of-bounds access.

3. Reduced Maintainability: The need to statically define MAX_IMCS for
different architectures and vendors makes the code harder to maintain.

4. Redundancy: The num_of_imcs() function dynamically discovers the
actual number of counters, making the static size declaration unnecessary
and redundant.

To address these issues, this commit refactors resctrl_val.c to use
a dynamic linked list. The num_of_imcs() function now allocates and
configures an imc_counter_config structure for each discovered iMC and
adds it to a global list (imc_counters_configs). This change ensures that
only the required memory is used and prevents the out-of-bounds issue.

Additionally, a corresponding cleanup_read_mem_bw_imc() function
is added to iterate through the list and free all allocated memory,
preventing leaks.

All function signatures that previously accepted an integer index have
been updated to accept a pointer to the imc_counter_config struct,
and the calling code has been updated to traverse the new list.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl.h     |   1 +
 tools/testing/selftests/resctrl/resctrl_val.c | 132 ++++++++++--------
 2 files changed, 78 insertions(+), 55 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index afe635b6e48d..75c595812e7d 100644
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
index b0570c615aac..68e46c863474 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -11,7 +11,6 @@
 #include "resctrl.h"
 
 #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
-#define MAX_IMCS		20
 #define MAX_TOKENS		5
 
 #define CON_MBM_LOCAL_BYTES_PATH		\
@@ -31,6 +30,7 @@ struct imc_counter_config {
 	struct perf_event_attr pe;
 	struct membw_read_format return_value;
 	int fd;
+	struct list_head	imc_list;
 };
 
 struct membw_read_config {
@@ -38,14 +38,18 @@ struct membw_read_config {
 	const char *name;
 	const char *event;
 	double scale;
+	int (*num_of)(void);
 };
 
+static int num_of_imcs(void);
+
 static struct membw_read_config membw_read_configs[] = {
 	{
 		.vendor_id = ARCH_INTEL | ARCH_AMD | ARCH_HYGON,
 		.name = "uncore_imc",
 		.event = "events/cas_count_read",
 		.scale = 64.0 / MB,
+		.num_of = num_of_imcs,
 	},
 	{
 		.vendor_id = NULL
@@ -53,37 +57,38 @@ static struct membw_read_config membw_read_configs[] = {
 };
 
 static char mbm_total_path[1024];
-static int imcs;
-static struct imc_counter_config imc_counters_config[MAX_IMCS];
+LIST_HEAD(imc_counters_configs);
 static const struct resctrl_test *current_test;
 static struct membw_read_config *current_config;
 
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
@@ -91,7 +96,8 @@ static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
  * @cas_count_cfg:	Config
  * @count:		iMC number
  */
-static void get_read_event_and_umask(char *cas_count_cfg, int count)
+static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_config
+									*imc_counters_config)
 {
 	char *token[MAX_TOKENS];
 	int i = 0;
@@ -105,21 +111,21 @@ static void get_read_event_and_umask(char *cas_count_cfg, int count)
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
@@ -128,7 +134,7 @@ static int open_perf_read_event(int i, int cpu_no)
 }
 
 /* Get type and config of an iMC counter's read event. */
-static int read_from_imc_dir(char *imc_dir, int count)
+static int read_from_imc_dir(char *imc_dir, struct imc_counter_config *imc_counters_config)
 {
 	char cas_count_cfg[1024], imc_counter_cfg[1024], imc_counter_type[1024];
 	FILE *fp;
@@ -141,7 +147,7 @@ static int read_from_imc_dir(char *imc_dir, int count)
 
 		return -1;
 	}
-	if (fscanf(fp, "%u", &imc_counters_config[count].type) <= 0) {
+	if (fscanf(fp, "%u", &imc_counters_config->type) <= 0) {
 		ksft_perror("Could not get iMC type");
 		fclose(fp);
 
@@ -165,7 +171,7 @@ static int read_from_imc_dir(char *imc_dir, int count)
 	}
 	fclose(fp);
 
-	get_read_event_and_umask(cas_count_cfg, count);
+	get_read_event_and_umask(cas_count_cfg, imc_counters_config);
 
 	return 0;
 }
@@ -189,6 +195,7 @@ static int num_of_imcs(void)
 	struct dirent *ep;
 	int ret;
 	DIR *dp;
+	struct imc_counter_config *imc_counters_config;
 
 	dp = opendir(DYN_PMU_PATH);
 	if (dp) {
@@ -212,14 +219,17 @@ static int num_of_imcs(void)
 			 * first character is a numerical digit or not.
 			 */
 			if (temp[0] >= '0' && temp[0] <= '9') {
+				imc_counters_config = malloc(sizeof(struct imc_counter_config));
 				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
-				ret = read_from_imc_dir(imc_dir, count);
+				ret = read_from_imc_dir(imc_dir, imc_counters_config);
 				if (ret) {
+					free(imc_counters_config);
 					closedir(dp);
 
 					return ret;
 				}
+				list_add(&imc_counters_config->imc_list, &imc_counters_configs);
 				count++;
 			}
 		}
@@ -240,26 +250,40 @@ static int num_of_imcs(void)
 
 int initialize_read_mem_bw_imc(void)
 {
-	int imc;
+	struct imc_counter_config *imc_counters_config;
 
-	imcs = num_of_imcs();
+	int imcs = current_config->num_of();
 	if (imcs <= 0)
 		return imcs;
 
 	/* Initialize perf_event_attr structures for all iMC's */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_initialize_perf_event_attr(imc);
+	list_for_each_entry(imc_counters_config, &imc_counters_configs, imc_list) {
+		read_mem_bw_initialize_perf_event_attr(imc_counters_config);
+	}
 
 	return 0;
 }
 
+void cleanup_read_mem_bw_imc(void)
+{
+	struct imc_counter_config *imc_counters_config;
+	struct imc_counter_config *next_imc_counters_config;
+
+	list_for_each_entry_safe(imc_counters_config, next_imc_counters_config,
+				 &imc_counters_configs, imc_list) {
+		list_del(&imc_counters_config->imc_list);
+		free(imc_counters_config);
+	}
+	list_del_init(&imc_counters_configs);
+}
+
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
 
@@ -271,13 +295,14 @@ static void perf_close_imc_read_mem_bw(void)
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
@@ -297,16 +322,16 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
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
@@ -321,17 +346,14 @@ static void do_imc_read_mem_bw_test(void)
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
-		struct imc_counter_config *r =
-			&imc_counters_config[imc];
-
+	list_for_each_entry(r, &imc_counters_configs, imc_list) {
 		if (read(r->fd, &r->return_value,
 			 sizeof(struct membw_read_format)) == -1) {
 			ksft_perror("Couldn't get read bandwidth through iMC");
-- 
2.33.0


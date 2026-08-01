Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB0737C926;
	Sat,  1 Aug 2026 09:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785576286; cv=none; b=P+zREAd7PeOzBZtHYGIrYAV5bXyYviATziHlKi0C/UcCmlW52VbKi2oWhDHl4TmWQWvrAIJIUtK1Z1gai8PrhLDkYbJCtHuPHSRXqZM1FNKHRi6lGrcqlJRzIwUbBhmjLxI7LufYJJNqqgKC6cc8uh7J7IqemxqdWdiBouB/v8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785576286; c=relaxed/simple;
	bh=MK2mseHPrUhMSBJCJATnzgA8QT41z98qr7QanRhGW4M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAr9RTz57XS6b7scJpB+zv7EC0p/vht0aPU9pNyzKk2lprinBykyQfkQiEIeC5qxL7so+HeO8afmZwiQNo3MPhyyu40ld6OGj1mLZZQt9tJ5LJQLuA4VpaZe9xsjJi/oWp8ljhB7aoqrhndoJAl7HsTnh9um2+M3Mp1+yuf5Nc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=TarxnRlK; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="TarxnRlK"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sabZ//AtpzLb7TMq3zY3IlaXl11sk1zDxBbZBnwOTU4=;
	b=TarxnRlK4WPRWM5o4U6EPdYYvDiAigoFHzQgzr41gmq4Xiz/jC43y8xCG4hegq86sTduPI61y
	chus0gFoLn5SgSLxGePwFr+xmWsFANcGK/9SgTYNwZwP1sWl37RoCR3vJzX7kNl8mdgZQ+EzWwX
	t254jpTZfGTKD0B/az9ig3c=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hBy2H2RJ0zmV8f;
	Sat,  1 Aug 2026 17:15:03 +0800 (CST)
Received: from kwepemo100012.china.huawei.com (unknown [7.202.195.139])
	by mail.maildlp.com (Postfix) with ESMTPS id 62C6440586;
	Sat,  1 Aug 2026 17:24:32 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemo100012.china.huawei.com
 (7.202.195.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 1 Aug
 2026 17:24:31 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<zengheng4@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <prime.zeng@hisilicon.com>, <wangyushan12@huawei.com>,
	<xuwei5@huawei.com>, <wangzhou1@hisilicon.com>, <xiaqinxin@huawei.com>
Subject: [PATCH v4 2/3] selftests/resctrl: Replace counter index references with pointers
Date: Sat, 1 Aug 2026 17:24:28 +0800
Message-ID: <20260801092429.533956-3-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260801092429.533956-1-wuyifan50@huawei.com>
References: <20260801092429.533956-1-wuyifan50@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo100012.china.huawei.com (7.202.195.139)

Replace direct counter number references with pointers to remove the
dependency on fixed array indexing and enable the use of different
data structures for counter management.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 62 +++++++++----------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index a72dc4ae61fe..f4111da26fc2 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -42,40 +42,37 @@ static struct imc_counter_config imc_counters_config[MAX_IMCS];
 LIST_HEAD(imc_counters_list);
 static const struct resctrl_test *current_test;
 
-static void read_mem_bw_initialize_perf_event_attr(int i)
+static void read_mem_bw_initialize_perf_event_attr(struct imc_counter_config *imc_counter)
 {
-	memset(&imc_counters_config[i].pe, 0,
-	       sizeof(struct perf_event_attr));
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
+	memset(&imc_counter->pe, 0, sizeof(struct perf_event_attr));
+	imc_counter->pe.type = imc_counter->type;
+	imc_counter->pe.size = sizeof(struct perf_event_attr);
+	imc_counter->pe.disabled = 1;
+	imc_counter->pe.inherit = 1;
+	imc_counter->pe.exclude_guest = 0;
+	imc_counter->pe.config = imc_counter->umask << 8 | imc_counter->event;
+	imc_counter->pe.sample_type = PERF_SAMPLE_IDENTIFIER;
+	imc_counter->pe.read_format =
 		PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
 }
 
-static void read_mem_bw_ioctl_perf_event_ioc_reset_enable(int i)
+static void read_mem_bw_ioctl_perf_event_ioc_reset_enable(struct imc_counter_config *imc_counter)
 {
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_RESET, 0);
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_ENABLE, 0);
+	ioctl(imc_counter->fd, PERF_EVENT_IOC_RESET, 0);
+	ioctl(imc_counter->fd, PERF_EVENT_IOC_ENABLE, 0);
 }
 
-static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
+static void read_mem_bw_ioctl_perf_event_ioc_disable(struct imc_counter_config *imc_counter)
 {
-	ioctl(imc_counters_config[i].fd, PERF_EVENT_IOC_DISABLE, 0);
+	ioctl(imc_counter->fd, PERF_EVENT_IOC_DISABLE, 0);
 }
 
 /*
  * get_read_event_and_umask:	Parse config into event and umask
  * @cas_count_cfg:	Config
- * @count:		iMC number
+ * @imc_counter:	iMC counter config
  */
-static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
+static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_config *imc_counter)
 {
 	char *token[MAX_TOKENS];
 	int i = 0;
@@ -89,21 +86,20 @@ static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
 		if (!token[i])
 			break;
 		if (strcmp(token[i], "event") == 0)
-			imc_counters_config[count].event = strtol(token[i + 1], NULL, 16);
+			imc_counter->event = strtol(token[i + 1], NULL, 16);
 		if (strcmp(token[i], "umask") == 0)
-			imc_counters_config[count].umask = strtol(token[i + 1], NULL, 16);
+			imc_counter->umask = strtol(token[i + 1], NULL, 16);
 	}
 }
 
-static int open_perf_read_event(int i, int cpu_no)
+static int open_perf_read_event(int cpu_no, struct imc_counter_config *imc_counter)
 {
-	imc_counters_config[i].fd =
-		perf_event_open(&imc_counters_config[i].pe, -1, cpu_no, -1,
-				PERF_FLAG_FD_CLOEXEC);
+	imc_counter->fd = perf_event_open(&imc_counter->pe, -1, cpu_no, -1,
+					  PERF_FLAG_FD_CLOEXEC);
 
-	if (imc_counters_config[i].fd == -1) {
+	if (imc_counter->fd == -1) {
 		fprintf(stderr, "Error opening leader %llx\n",
-			imc_counters_config[i].pe.config);
+			imc_counter->pe.config);
 
 		return -1;
 	}
@@ -177,7 +173,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 		}
 
 		imc_counters_config[*count].type = type;
-		get_read_event_and_umask(cas_count_cfg, *count);
+		get_read_event_and_umask(cas_count_cfg, &imc_counters_config[*count]);
 		/* Do not fail after incrementing *count. */
 		*count += 1;
 		list_add(&imc_counter->entry, &imc_counters_list);
@@ -311,7 +307,7 @@ int initialize_read_mem_bw_imc(void)
 
 	/* Initialize perf_event_attr structures for all iMC's */
 	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_initialize_perf_event_attr(imc);
+		read_mem_bw_initialize_perf_event_attr(&imc_counters_config[imc]);
 
 	return 0;
 }
@@ -350,7 +346,7 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
 		imc_counters_config[imc].fd = -1;
 
 	for (imc = 0; imc < imcs; imc++) {
-		ret = open_perf_read_event(imc, cpu_no);
+		ret = open_perf_read_event(cpu_no, &imc_counters_config[imc]);
 		if (ret)
 			goto close_fds;
 	}
@@ -373,13 +369,13 @@ static void do_imc_read_mem_bw_test(void)
 	int imc;
 
 	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc);
+		read_mem_bw_ioctl_perf_event_ioc_reset_enable(&imc_counters_config[imc]);
 
 	sleep(1);
 
 	/* Stop counters after a second to get results. */
 	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_disable(imc);
+		read_mem_bw_ioctl_perf_event_ioc_disable(&imc_counters_config[imc]);
 }
 
 /*
-- 
2.33.0


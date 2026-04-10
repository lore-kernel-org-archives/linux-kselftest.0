Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8093B3BF7;
	Fri, 10 Apr 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813655; cv=none; b=H23a1ZQUY7VF7fjXx7fIrIcxBY01BzdBZktcZ+0J89UUyRYGNzYFQ4g70qC+ICm6w1uLCbPkn4KIe0b3UATnNKNzFPEn7uDCU5vgPM0hGQ61+CItt5UWXxL3FH2JkIUesa3rH9j9DKEqxFXN5/ynnECK/pg76PqMUffRzImE4n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813655; c=relaxed/simple;
	bh=RIQj6fOsTEvGroBILPBQfDhdToainaT8wL6PCqlHCPA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgipaVZzhJDuWNkcQcF4jmGzBwei928sFd5NrJd3EP9ebgNS4jelxLqYAckgIuNBFaQdPDO9z1kxg0Y4Pvdu1Czip4AhIwx2CYv5nlQs1w/CRkdGT1QfCphEY+tO2BTUHZ7Vd0/LpShoHnxHyq8mlpnoHzhRXVHc3UOUJD039Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=2kQJBhYc; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=2kQJBhYc; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="2kQJBhYc";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="2kQJBhYc"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DLLBswuP5vM3z5lAacgS6ua4SOqTqK53UTCgIoBMBEo=;
	b=2kQJBhYcCAUSFJz0qMblYLUswiA7EtkYi9er+gxjSkCI4+1m7fgnghStdHTgKu2J5O97d3vLL
	gTnndwLN2qiMWG0MMXQMoYIhmENHG7WdZC1ujaSHxmzysk515XJCCtYycbqk5g59ZdwQj6Rm4kK
	zFJM235wAHiQz7pl8ymnHGc=
Received: from canpmsgout04.his.huawei.com (unknown [172.19.92.133])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fsWnm50wKz1BG7B;
	Fri, 10 Apr 2026 17:33:32 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DLLBswuP5vM3z5lAacgS6ua4SOqTqK53UTCgIoBMBEo=;
	b=2kQJBhYcCAUSFJz0qMblYLUswiA7EtkYi9er+gxjSkCI4+1m7fgnghStdHTgKu2J5O97d3vLL
	gTnndwLN2qiMWG0MMXQMoYIhmENHG7WdZC1ujaSHxmzysk515XJCCtYycbqk5g59ZdwQj6Rm4kK
	zFJM235wAHiQz7pl8ymnHGc=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fsWfy4J6Pz1prKv;
	Fri, 10 Apr 2026 17:27:38 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A8FC440571;
	Fri, 10 Apr 2026 17:33:56 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 10 Apr
 2026 17:33:55 +0800
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
Subject: [PATCH v2 4/6] selftests/resctrl: Refactor perf event open/close using linked list
Date: Fri, 10 Apr 2026 17:33:50 +0800
Message-ID: <20260410093352.3988125-5-wuyifan50@huawei.com>
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

Using linked list when open/close perf event.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index ce675d349a6e..ce5f96d5457c 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -93,15 +93,15 @@ static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_con
 	}
 }
 
-static int open_perf_read_event(int i, int cpu_no)
+static int open_perf_read_event(int cpu_no, struct imc_counter_config *imc_counter)
 {
-	imc_counters_config[i].fd =
-		perf_event_open(&imc_counters_config[i].pe, -1, cpu_no, -1,
+	imc_counter->fd =
+		perf_event_open(&imc_counter->pe, -1, cpu_no, -1,
 				PERF_FLAG_FD_CLOEXEC);
 
-	if (imc_counters_config[i].fd == -1) {
+	if (imc_counter->fd == -1) {
 		fprintf(stderr, "Error opening leader %llx\n",
-			imc_counters_config[i].pe.config);
+			imc_counter->pe.config);
 
 		return -1;
 	}
@@ -318,11 +318,11 @@ void cleanup_read_mem_bw_imc(void)
 
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
 
@@ -334,13 +334,14 @@ static void perf_close_imc_read_mem_bw(void)
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
-		ret = open_perf_read_event(imc, cpu_no);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
+		ret = open_perf_read_event(cpu_no, imc_counter);
 		if (ret)
 			goto close_fds;
 	}
-- 
2.43.0


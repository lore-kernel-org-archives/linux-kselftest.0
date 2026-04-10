Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E6734321A;
	Fri, 10 Apr 2026 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813641; cv=none; b=sc3buEN6B83IJTTf89ZIhDCBgbmsA3L9l+gB9e/4QdUdpfkFvPS8+6LPFz6msiiYWn0mN1Eufosmwu7WbK6+qEfnUGggpuBbDif4pv+246+9x/UC0QpQkSmrbY5iamaYnem3lD2uIOzXXU/mFtSvWK9b6z/vEprHt/jCX65ebCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813641; c=relaxed/simple;
	bh=wS89Gmr/rThfl6ZdgnOObPR7nag9iM0T4MnaA4sIReA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kI97jKHowQVX0LWZuPm+Ai7YHExitDCxCSiuiQCMaXLA3e4mij+Ep3swadY1MNDWmAYRrwJx3OLZGx/G0lb2H7RSDulpgC5fJWXfG7kzyPFwuEI9oD81BH1qqejhrwlSn9LIgpCVxQOuibW6YENadMJ3AG/QIBCcpDwpVzTXEQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=i55Kip2z; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="i55Kip2z"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Un6/5hQDB4O/MEu6q894jg317PijwDr803+Azh9z1Jg=;
	b=i55Kip2zCvSkxi/dx8mmEUh3mlwyX/Z9rqtPkjLLA+cHvkcvtVguhivXOMcR5QNy9eaYBR6HU
	bBEzuj6Mi9DYEnw+ol+ckj7uYIEX4BKlqm1+SdmEIzFsYGyILcEHzZ8ZwrRpq3LDZhIjof2/qIN
	zO/WKxNMtcmialiVAmfX5tA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fsWfw3JNczcb16;
	Fri, 10 Apr 2026 17:27:36 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 6DA0C4048F;
	Fri, 10 Apr 2026 17:33:57 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 10 Apr
 2026 17:33:56 +0800
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
Subject: [PATCH v2 5/6] selftests/resctrl: Refactor reading from IMC using linked list
Date: Fri, 10 Apr 2026 17:33:51 +0800
Message-ID: <20260410093352.3988125-6-wuyifan50@huawei.com>
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

Read the memory bandwidth from the IMC using linked list.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index ce5f96d5457c..65ae93205b38 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -57,15 +57,15 @@ static void read_mem_bw_initialize_perf_event_attr(struct imc_counter_config *im
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
@@ -361,16 +361,16 @@ static int perf_open_imc_read_mem_bw(int cpu_no)
  */
 static void do_imc_read_mem_bw_test(void)
 {
-	int imc;
+	struct imc_counter_config *imc_counter;
 
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry)
+		read_mem_bw_ioctl_perf_event_ioc_reset_enable(imc_counter);
 
 	sleep(1);
 
 	/* Stop counters after a second to get results. */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_ioctl_perf_event_ioc_disable(imc);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry)
+		read_mem_bw_ioctl_perf_event_ioc_disable(imc_counter);
 }
 
 /*
@@ -385,17 +385,15 @@ static void do_imc_read_mem_bw_test(void)
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
2.43.0


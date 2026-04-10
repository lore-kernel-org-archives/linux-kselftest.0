Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CB936EA8C;
	Fri, 10 Apr 2026 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813645; cv=none; b=RpE8wZGbwpUXhWHUwSvEMLM/deDKQ1MhhDHavihzfa9bkpDDySvqR64dI1kJgRhFoNYnjXJREiHC3j6QWg1dOx9OqKFEoUBWqwfPll7x2eVEncDyx1TTuCaUM/duxTqS3o8gFIqoDczd5HyEAQbM2Eij1qJBXmMlJLW7N1o4Djk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813645; c=relaxed/simple;
	bh=YciSoPP78WvNT4rqA89UMwvhjBbTCvVJm04GjsbQ+IU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TKm4gbbyrvDhDMzVx6b0bF+n3Y3/H218usHRMoF4lIJnIca9Zxzj1I0XmTSKgJpJ2YpEOduLn13j+Nqw3pr++AYSVCOP6mOMQe7+x5ldaZrWi7H8Z9noLb6v9c2sDZSe2MLptCP2J6eRotHvwcGigEpYCsdKWCn+CQWc2KpsELY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=TH+XxIR0; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="TH+XxIR0"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ASxunNUXGSJJZD348DA2S3TTm5bdoy8jwQBI6RlCbrQ=;
	b=TH+XxIR0Dd+KSV7xDZAHZ7tE1N3RKF41oSg8ounYclJ2kN/4kopzACd7U9atyEdqEWt49p+4W
	W4bngGoD0FExSNqcXTYv/jhmCzFO4pzbg6SgZGFj/AH4l57jj0m08rNAi2LMRtKnBE3nnGbcteM
	n5CfrsporjQYQ2UHbCOcfSU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fsWg26FWfz1K99S;
	Fri, 10 Apr 2026 17:27:42 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DEAE74056E;
	Fri, 10 Apr 2026 17:33:55 +0800 (CST)
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
Subject: [PATCH v2 3/6] selftests/resctrl: Refactor the initialization of IMC's perf_event_attr using linked list
Date: Fri, 10 Apr 2026 17:33:49 +0800
Message-ID: <20260410093352.3988125-4-wuyifan50@huawei.com>
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

The initialization of perf_event_attr in iMC is refactord using
linked list. Removed the initialization of the global variable imcs.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 60cda2214c13..ce675d349a6e 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -42,20 +42,18 @@ static struct imc_counter_config imc_counters_config[MAX_IMCS];
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
+	imc_counter->pe.type = imc_counter->type;
+	imc_counter->pe.size = sizeof(struct perf_event_attr);
+	imc_counter->pe.disabled = 1;
+	imc_counter->pe.inherit = 1;
+	imc_counter->pe.exclude_guest = 0;
+	imc_counter->pe.config =
+		imc_counter->umask << 8 |
+		imc_counter->event;
+	imc_counter->pe.sample_type = PERF_SAMPLE_IDENTIFIER;
+	imc_counter->pe.read_format =
 		PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
 }
 
@@ -292,15 +290,17 @@ static int num_of_imcs(void)
 
 int initialize_read_mem_bw_imc(void)
 {
-	int imc;
+	struct imc_counter_config *imc_counter;
+	int ret;
 
-	imcs = num_of_imcs();
-	if (imcs <= 0)
-		return imcs;
+	ret = num_of_imcs();
+	if (ret < 0)
+		return ret;
 
 	/* Initialize perf_event_attr structures for all iMC's */
-	for (imc = 0; imc < imcs; imc++)
-		read_mem_bw_initialize_perf_event_attr(imc);
+	list_for_each_entry(imc_counter, &imc_counters_list, entry) {
+		read_mem_bw_initialize_perf_event_attr(imc_counter);
+	}
 
 	return 0;
 }
-- 
2.43.0


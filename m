Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B1D33D6DD;
	Fri, 10 Apr 2026 09:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813640; cv=none; b=rtEEQezTT0E61jft6hUJWwI+Q26TMBEQHiAOkGZZXLoH4Mc8LnzMlKrVGwBozYIPTWOUtmFr8eEnqFdXPFfQQk59s4O2W2shKbkMX3c9E+bs1zfm+A2Ya0IX/Tlr91329e6GSIpNTCwylBjoF1W32oxlyLvEmXZHWQlgLLQmtPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813640; c=relaxed/simple;
	bh=s9zgobcm2CHtlcIS+kopSWTxykc6RfmLS0EoYUXCWqQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pqq4XBTVhhzZYf1s1g4F1/OOxY5SC4jPAwcE+dy4zcw9l+lfi/6LA2qm3/oNt4IL1B4nx8RFeUb7zBvudgnQj2ste3UGXQM3d9fDdbfVX32hIszyAdQ/ABtt5kBoT827oUN+I7gJEYWJX8X1uZHdzTMFNwNLCHyMwXeoPaUp2SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Bs1GDTfr; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Bs1GDTfr"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KjF6DB/OqPjtMxMksRwOz4b3e0pFo875sZuK+jxuacc=;
	b=Bs1GDTfrACuTuJ3/3Xk1eb4VOE1cKD93VnXfa+KkGIwLnWHFu5xs+OKXUDqPA/dRrJqy388C/
	/XtVhN94MxJBHILBJKr1Ffm8+GmpgzQZXhvRfPxqwpVkBenM18BpHguyaIlLcnjwJgC5ompU+jE
	KQna3PQ9SctNOx+D9iODqUw=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fsWft1J2Yzcb19;
	Fri, 10 Apr 2026 17:27:34 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B6EC203C8;
	Fri, 10 Apr 2026 17:33:55 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 10 Apr
 2026 17:33:54 +0800
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
Subject: [PATCH v2 2/6] selftests/resctrl: Refactor the discovery of IMC counters using linked list
Date: Fri, 10 Apr 2026 17:33:48 +0800
Message-ID: <20260410093352.3988125-3-wuyifan50@huawei.com>
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

Use linked list to refactor the discovery of IMC counters. The counting
during the discovery and the check on the upper limit of the number
of IMC counters are removed.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 35 ++++++++-----------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index d9ae24e9d971..60cda2214c13 100644
--- a/tools/testing/selftests/resctrl/resctrl_val.c
+++ b/tools/testing/selftests/resctrl/resctrl_val.c
@@ -75,7 +75,7 @@ static void read_mem_bw_ioctl_perf_event_ioc_disable(int i)
  * @cas_count_cfg:	Config
  * @count:		iMC number
  */
-static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
+static void get_read_event_and_umask(char *cas_count_cfg, struct imc_counter_config *imc_counter)
 {
 	char *token[MAX_TOKENS];
 	int i = 0;
@@ -89,9 +89,9 @@ static void get_read_event_and_umask(char *cas_count_cfg, unsigned int count)
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
 
@@ -111,12 +111,11 @@ static int open_perf_read_event(int i, int cpu_no)
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
@@ -166,23 +165,18 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 			ksft_perror("Could not get iMC cas count read");
 			goto out_close;
 		}
-		if (*count >= MAX_IMCS) {
-			ksft_print_msg("Maximum iMC count exceeded\n");
-			goto out_close;
-		}
 		imc_counter = calloc(1, sizeof(*imc_counter));
 		if (!imc_counter) {
 			ksft_perror("Unable to allocate memory for iMC counters\n");
 			goto out_close;
 		}
 
-		imc_counters_config[*count].type = type;
-		get_read_event_and_umask(cas_count_cfg, *count);
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
@@ -193,7 +187,7 @@ static int parse_imc_read_bw_events(char *imc_dir, unsigned int type,
 }
 
 /* Get type and config of an iMC counter's read event. */
-static int read_from_imc_dir(char *imc_dir, unsigned int *count)
+static int read_from_imc_dir(char *imc_dir)
 {
 	char imc_counter_type[PATH_MAX];
 	unsigned int type;
@@ -221,7 +215,7 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
 		ksft_perror("Could not get iMC type");
 		return -1;
 	}
-	ret = parse_imc_read_bw_events(imc_dir, type, count);
+	ret = parse_imc_read_bw_events(imc_dir, type);
 	if (ret) {
 		ksft_print_msg("Unable to parse bandwidth event and umask\n");
 		return ret;
@@ -245,7 +239,6 @@ static int read_from_imc_dir(char *imc_dir, unsigned int *count)
 static int num_of_imcs(void)
 {
 	char imc_dir[512], *temp;
-	unsigned int count = 0;
 	struct dirent *ep;
 	int ret;
 	DIR *dp;
@@ -274,7 +267,7 @@ static int num_of_imcs(void)
 			if (temp[0] >= '0' && temp[0] <= '9') {
 				sprintf(imc_dir, "%s/%s/", DYN_PMU_PATH,
 					ep->d_name);
-				ret = read_from_imc_dir(imc_dir, &count);
+				ret = read_from_imc_dir(imc_dir);
 				if (ret) {
 					closedir(dp);
 
@@ -283,7 +276,7 @@ static int num_of_imcs(void)
 			}
 		}
 		closedir(dp);
-		if (count == 0) {
+		if (list_empty(&imc_counters_list)) {
 			ksft_print_msg("Unable to find iMC counters\n");
 
 			return -1;
@@ -294,7 +287,7 @@ static int num_of_imcs(void)
 		return -1;
 	}
 
-	return count;
+	return 0;
 }
 
 int initialize_read_mem_bw_imc(void)
-- 
2.43.0


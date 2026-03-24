Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A852437BE66;
	Tue, 24 Mar 2026 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356643; cv=none; b=Vhtc3UDD+rAYujE0vMIxMKzbBD+bLpdrBtitIXyCl3+ga8hLlBAuypF4SoGLRNH42hepA1I6gxqyngfmCr4nXwhaVdP6k9pv+2U/oqeh2VxCqZyHR7QLGLgZyENH+FSveWaFzb5dPXskXwHzMjgRHfx9JdYx34bicAv/0a+HDMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356643; c=relaxed/simple;
	bh=Tmaxk4DdN05KmAs+nHyaQ21YgkjPt+1iB3UbJ5x+E5s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DzXgg1rSWTe4610zJbvELN0btCj39p5nrhBhAqEiwrrynDyc9buEHOObzRHsPX/Ophx2FSUAxdnihKHCFtVVbf2Y9JDI4FTa9bwT6hUKJDMWZZewON5uN+BPUex6Uqbool6vOdOQpcZbEpNSrlarO6N7nkgEXtOttzYpTwle2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=jThLklzh; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="jThLklzh"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ODAPhpGPDD8xQTcegORqlMgeQdBfrTF1UcLJA2PAaS8=;
	b=jThLklzh5wXHquZgOxtRABAFwHJotQnA5p84vG5R5Mt4ex0WzMG/6oZfKtdjfhSKoRFO4jaNS
	sbZLHlw9XMcAfbQ8cNJ1NntNZt1LK1j7/juNbZ3OTmvh9IkwFbbmDIbTSOLI2JyYJT2Qg76iHeU
	Uq95/zm2IeEFMDetjmPNY5c=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fg8qx3J7Kz1prLB;
	Tue, 24 Mar 2026 20:44:29 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4DB674056A;
	Tue, 24 Mar 2026 20:50:37 +0800 (CST)
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
Subject: [PATCH 3/3] selftests/resctrl: Add cleanup for MBM/MBA test
Date: Tue, 24 Mar 2026 20:50:34 +0800
Message-ID: <20260324125034.1509177-4-wuyifan50@huawei.com>
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

Added cleanup calls in MBA and MBM tests to prevent resource leaks.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/mba_test.c | 1 +
 tools/testing/selftests/resctrl/mbm_test.c | 1 +
 tools/testing/selftests/resctrl/resctrl.h  | 1 +
 3 files changed, 3 insertions(+)

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
index 29c9f76132f0..27dca1e7cf8e 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -184,6 +184,7 @@ void mem_flush(unsigned char *buf, size_t buf_size);
 void fill_cache_read(unsigned char *buf, size_t buf_size, bool once);
 ssize_t get_fill_buf_size(int cpu_no, const char *cache_type);
 int initialize_read_mem_bw_imc(void);
+void cleanup_read_mem_bw_imc(void);
 int measure_read_mem_bw(const struct user_params *uparams,
 			struct resctrl_val_param *param, pid_t bm_pid);
 void initialize_mem_bw_resctrl(const struct resctrl_val_param *param,
-- 
2.33.0


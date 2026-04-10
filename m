Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EA136F42B;
	Fri, 10 Apr 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813647; cv=none; b=W99pqVJrCEok/b0R/zPVgo1NjEsGw0Z86xVGHu15WxfWlR3D+dsw+VhaijSORrN27LDIYs0T6wlbizTMEoxTyssDtH/ZKEmlnZuqYtx/CNtRorQUgjzt2SXy/BYFfle4i9hQkI9+BRAGuowtIXAvvcJVJavpJNxcG6gZZF4eD5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813647; c=relaxed/simple;
	bh=qFO2QnppJFNf/U34Ko433cweQot+NmWgtmUIfZHmjfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bxBkBupZkw/ulLH2pc0jCYKLaHPMDU80xBh39TFq8a9imiX7dalNS3uwkGq/5uSMnuzNtB49Ag2vJ3RaCmewk8WyxffnAw2IOZKfOs5aGCE1v4PMc3P/us/8oCPOS7QUG5qyIlINyRKInWJLVITr+Q4NA+McgFCMCV6tKko+imY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=s2kBV0MG; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="s2kBV0MG"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mVmpCI0HC1/hdt/Oa73YmK5ClzgLJZRC5VBrHWy673M=;
	b=s2kBV0MGnmH8yHm6y0j5Yfr+rSaIYmuyS62fE13daWSdzDsZOux/XwLXVSGY+vWWJdRGONhV1
	TVAyZAwz7iwzwSoBcSMps+BHFf+GAJANqPPnba0u330+FSs7PRJn5cA/ndZHPQLJ9ImIBbm7U24
	ZOjoXnCeDeposB7ppFfAkUw=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fsWg51VdYz1K99S;
	Fri, 10 Apr 2026 17:27:45 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 32BE240563;
	Fri, 10 Apr 2026 17:33:58 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 10 Apr
 2026 17:33:57 +0800
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
Subject: [PATCH v2 6/6] selftests/resctrl: Remove the definition of the IMC counter config array and imcs.
Date: Fri, 10 Apr 2026 17:33:52 +0800
Message-ID: <20260410093352.3988125-7-wuyifan50@huawei.com>
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

The definitions of the imc counter configuration array, imcs, and MAX_IMCS
are removed.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/resctrl/resctrl_val.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
index 65ae93205b38..acc2a4c19cf4 100644
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
 
-- 
2.43.0


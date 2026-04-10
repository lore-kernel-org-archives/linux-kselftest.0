Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DA433D4F8;
	Fri, 10 Apr 2026 09:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813639; cv=none; b=UAzwjjOo3o5sO2Nrq/ryzoT9nRZ5JvMW6NRfpBYowiPGC05Eid2dPvvcJRnT6ZBR3Vn6GUitZw2susHZaH/oTDjYGpXyLC01GBV6icg2rqOybC54/VBg3J6ZFK8NURhlgn6dvrwT2n3vKILidZ2wnmCqJ+dXXbMgW2TYEB5J6eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813639; c=relaxed/simple;
	bh=ewIFl9ADEJp4pP8M1/xD9iOi9xqBc3c9y7oAmYj6hkM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ghRLI0FM6/vMIFz7BCp/PUsYQNsh2Jo46v+mV/GXCeuW6DybkKyuqxMmVapiwjO+woPptrZDt690oxFjwoddU+ag+2G3jzC15XsErSEhhgiCsg+ByocHP+y3vDxcAJy/e88ZjCdzDMKacdDxHpG5fhn4BfQ9993j9bqVOq8Du/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=AuAYrJSb; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="AuAYrJSb"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U7aexDBYjzFhqpIUVgOryHwFMOm26RrjCXdTykrO8Hw=;
	b=AuAYrJSb31WeikXdnSgxza+xhTGfOJO2HxJpcbzACfeGZPt5VlzMKdhnj2Z66jbv9ExyJsg8R
	FNyH24RDrKfRxaHTz6SVckuObDPqjmjyz+lB+DvndDRHRyvHGlzO90nx54DF5eJG9dwZm2rARRC
	VcMRWvM+FQgJPBT5tjO6wOA=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fsWfw4LQlzKm4w;
	Fri, 10 Apr 2026 17:27:36 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B8FA640563;
	Fri, 10 Apr 2026 17:33:53 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 10 Apr
 2026 17:33:52 +0800
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
Subject: [PATCH v2 0/6] selftests/resctrl: Add dynamic linked list management for IMC counters
Date: Fri, 10 Apr 2026 17:33:46 +0800
Message-ID: <20260410093352.3988125-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
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

Hi all,

This patch series adds dynamic linked list management for the IMC
counters, which can work based on the actual number of counters instead of
an upper limit, without the need for array out-of-bounds access check.

This patch series is based on the Reinette's patch series aimed at fixing
the resctrl test and can be found at:
https://lore.kernel.org/lkml/cover.1775266384.git.reinette.chatre@intel.com/

changelog:
1. Fixed the code style and variable naming.
2. The initialization and cleanup of the linked list are integrated in patch 1.
3. The use of arrays is refactored to linked list split in the remaining patches.
4. The IMC count and global variable imcs are removed.
For more details, see the commit message.

v1 can be found at:
https://lore.kernel.org/all/20260324125034.1509177-1-wuyifan50@huawei.com/

Yifan Wu (6):
  selftests/resctrl: Introduced linked list management for IMC counters
  selftests/resctrl: Refactor the discovery of IMC counters using linked
    list
  selftests/resctrl: Refactor the initialization of IMC's perf_event_attr
    using linked list
  selftests/resctrl: Refactor perf event open/close using linked list
  selftests/resctrl: Refactor reading from IMC using linked list
  selftests/resctrl: Remove the definition of the IMC counter config
    array and imcs.

 tools/testing/selftests/resctrl/mba_test.c    |   1 +
 tools/testing/selftests/resctrl/mbm_test.c    |   1 +
 tools/testing/selftests/resctrl/resctrl.h     |   2 +
 tools/testing/selftests/resctrl/resctrl_val.c | 147 ++++++++++--------
 4 files changed, 82 insertions(+), 69 deletions(-)

-- 
2.43.0


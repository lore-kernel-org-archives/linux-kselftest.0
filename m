Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CCC396593;
	Tue, 24 Mar 2026 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356647; cv=none; b=k3iwA05EOhokbDI/F81kNWph8BiyQvTk+hC3tcMCez5KR6UOr4NDKkk3scXUtzxw7AAifbz5mSDNbriiTq8RsKVyvlui58zm0+hXmNuJ/jHmp5mEelGgalBFey6w2gUTyPcJhm8xAPX+mGPT0UD+HTFL+esGoYPRmHnZ8/SsT5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356647; c=relaxed/simple;
	bh=XI03vPnhKsSqkRkpOSeHoZR/FmfxGdKwN2qi5YCtajw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=djOlpxufwHrXeKJd1/Nx9OIacRiKbFegdtvLlOX4cwNydTqQox3gbbVQJB9t3rPpv8Arri/pqggIIRyzRZpJudvrv2ertjhV33/hYBnG+lOoT1jb0DcmfxVFhbd2j3FJxbjjNeq77VXsHiGbejZtOUsHwbz9kVGxTR3xshAQGCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=qtcwuOjJ; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="qtcwuOjJ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Hfr2FSvcInRJN9qnFobwetvq4sqGiHycr5j1Jc1+i+o=;
	b=qtcwuOjJEI0S9j8Duh43tRWfbwcFbVbsbuYhiyuXFS4K1t+mmQkX7j1IxRvlDFODrZSlmvcsK
	SUML5n1IFriJX+MTl/UUKlgmMaGjX0h7lexGMQ8yQ6pUclVmoATAYLUFWT2F9DTGdY6jYD8UTG6
	h2rrqX/8dfwAYpWEL3s4s2c=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fg8rd6SLnz1T4Hm;
	Tue, 24 Mar 2026 20:45:05 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id BB07D2012A;
	Tue, 24 Mar 2026 20:50:35 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Mar
 2026 20:50:34 +0800
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
Subject: [PATCH 0/3] selftests/resctrl: Add dynamic linked list management for IMC counters
Date: Tue, 24 Mar 2026 20:50:31 +0800
Message-ID: <20260324125034.1509177-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
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

Hi all,

This patch series adds dynamic linked list management for the IMC
counters, which can work based on the actual number of counters instead of
an upper limit, without the need for array out-of-bounds access check.

This patch series is based on the Reinette's patch series aimed at fixing
the resctrl test and can be found at:
https://lore.kernel.org/lkml/cover.1773432891.git.reinette.chatre@intel.com/

Yifan Wu (3):
  selftests/resctrl: Introduced linked list management for IMC counters
  selftests/resctrl: Replace array-based IMC counter management with
    linked lists
  selftests/resctrl: Add cleanup for MBM/MBA test

 tools/testing/selftests/resctrl/mba_test.c    |   1 +
 tools/testing/selftests/resctrl/mbm_test.c    |   1 +
 tools/testing/selftests/resctrl/resctrl.h     |   2 +
 tools/testing/selftests/resctrl/resctrl_val.c | 159 ++++++++++--------
 4 files changed, 95 insertions(+), 68 deletions(-)

-- 
2.33.0


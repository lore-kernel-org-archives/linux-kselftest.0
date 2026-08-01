Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21B1370D56;
	Sat,  1 Aug 2026 09:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785576285; cv=none; b=r7RgCz0Nou2APck+tZA7SAZEOShGJw33SytjAzSxrpjLXUZkAarl21l+sAQTLf2z9x+izTyulaTXci24YOa+QTNTrLUbG6eSHCL9ps9Q4C00R8HrL4sZPjey7TE/RJdIKU5A/SgZ4jXhlX+QUs7VnhzWIgCg3DjmRjU9CGBaHEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785576285; c=relaxed/simple;
	bh=LN8uEka7ByOgqre6DeWvxOgp3sL1WQvBtDYq2mnTVKg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tNeY3rFpyK+/EaoA7MY5CfgqRSCZBwxnFJThJmXgv93MvBISRbaPWUSMb1uSoTaavClomZTI1gcANqIlBJyJLQNQhC7wN0b2Imcxkotugx2WLaYqG5atsvqRnctRA1EtVl5YW0u1Z+zLf5+S55LjDwm7/2Ooohd5TV6txqpw5oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=t9n6k9pe; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="t9n6k9pe"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Cxt7Grz6TynoJOIeevIl0xSsRDWr0aoHmM0WTjYrIGc=;
	b=t9n6k9peZ1ns2ZZzIUG99Eq8X5ewjbfEEwbRromba6abBmToyVtWIvlE3uQP8ZJhFYOZMKxz9
	5zQPGYDJRt73ff6R305YgE4r+nwv8jlC7zN7TkFt5K8K4fozCpofwFsMeCQZkRKeUUYKvDdCxGq
	Wn8BBrNEQAErs7hgFCUETP0=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hBy2D0fxlz1prKd;
	Sat,  1 Aug 2026 17:15:00 +0800 (CST)
Received: from kwepemo100012.china.huawei.com (unknown [7.202.195.139])
	by mail.maildlp.com (Postfix) with ESMTPS id EEC1B20333;
	Sat,  1 Aug 2026 17:24:30 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemo100012.china.huawei.com
 (7.202.195.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 1 Aug
 2026 17:24:30 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<zengheng4@huawei.com>, <wuyifan50@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <prime.zeng@hisilicon.com>, <wangyushan12@huawei.com>,
	<xuwei5@huawei.com>, <wangzhou1@hisilicon.com>, <xiaqinxin@huawei.com>
Subject: [PATCH v4 0/3] selftests/resctrl: Add dynamic linked list management for IMC counters
Date: Sat, 1 Aug 2026 17:24:26 +0800
Message-ID: <20260801092429.533956-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
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

Hi all,

This patch series introduces dynamic linked list management for IMC
counters, enabling the tests to use all available counters detected by
hardware instead of a fixed upper limit, without the need for array
bounds checking.

This series is based on Reinette's patch series aimed at fixing the
resctrl tests, available at:
https://lore.kernel.org/lkml/cover.1775266384.git.reinette.chatre@intel.com/

Changes in v4:
- Fix the style under Reinette's review and add Reviewed-by tags.

Changes in v3:
- Rename functions and update comments.
- Split the patches into incremental changes.
- Explicitly release memory after failing to parse the imc config.

Changes in v2:
- Fix code style and variable names.
- Integrate linked list initialization and cleanup into patch 1.
- Split the conversion from arrays to linked list across the remaining
  patches.
- Remove the IMC count and the global imcs variable.

v3: https://lore.kernel.org/all/20260522090540.444554-1-wuyifan50@huawei.com/
v2: https://lore.kernel.org/all/20260410093352.3988125-1-wuyifan50@huawei.com/
v1: https://lore.kernel.org/all/20260324125034.1509177-1-wuyifan50@huawei.com/

Yifan Wu (3):
  selftests/resctrl: Introduce linked list management for IMC counters
  selftests/resctrl: Replace counter index references with pointers
  selftests/resctrl: Enable dynamic management of IMC counters via
    linked list

 tools/testing/selftests/resctrl/mba_test.c    |   1 +
 tools/testing/selftests/resctrl/mbm_test.c    |   1 +
 tools/testing/selftests/resctrl/resctrl.h     |   2 +
 tools/testing/selftests/resctrl/resctrl_val.c | 169 +++++++++---------
 4 files changed, 92 insertions(+), 81 deletions(-)

-- 
2.33.0


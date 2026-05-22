Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0B63B8D4A;
	Fri, 22 May 2026 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440752; cv=none; b=eKmC2hTEjBm4iy6f27ZLeqQNs48+6bhF2l2+bYZ+8spJ7JsztGF800zEtbYkc9gXVnc1P38vSdxj2hCwNLhJq/kf1T7Wr7JzVRWJY2byMPousUeZoO23ghjrgkCvEzNr8olygPu2BXz5BjPLA35VGYfRZgvU38xONM2JoLbvj58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440752; c=relaxed/simple;
	bh=MOXJMX8T/PbZJYid5HC0xE8EChSS1DfEM6Q0QDPztCc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M9ErbhGzb2n9mQpyAWFnTTjc+OxWL1kdX48kfNQm/jfLXtU6zl1wYmaZ5gCAKSwRQ+yQRGQ4YW/PyGwcAs7NVNeWRf216BDeYEZHhSwycA0qFyKvkiavWWc5tqXjFhv1dmjn8a1AasNIb6Inb0E0pbqXbjCzqZmAumVmRgvHfPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=FrYcGZtK; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="FrYcGZtK"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XXZIt/IRMdpz6Q7Qv47k57QVKqhas9hhPMosHbHkOcA=;
	b=FrYcGZtK2Q6waeF8Nok7HXk/4mvM5F/JP+BFiIKa97kb53VUncbbEvCAi9EuzdRKHY8J2OpU0
	huLztcdDLr+AwFgNDvECu6hfxFSgBPCYfjrAZlkIo5YGIone6OBhtXDja7HPwGaFKTPWKhqLYCg
	pbW9uBQn2Icm/cRCFN4UTAQ=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gMK1M3XmvzLlSh;
	Fri, 22 May 2026 16:57:59 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A70DA4056C;
	Fri, 22 May 2026 17:05:41 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 22 May
 2026 17:05:40 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <shuah@kernel.org>, <tan.shaopeng@fujitsu.com>,
	<fenghuay@nvidia.com>, <ben.horgan@arm.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v3 0/3] selftests/resctrl: Add dynamic linked list management for IMC counters
Date: Fri, 22 May 2026 17:05:37 +0800
Message-ID: <20260522090540.444554-1-wuyifan50@huawei.com>
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

This patch series introduces dynamic linked list management for IMC
counters, enabling the tests to use all available counters detected by
hardware instead of a fixed upper limit, without the need for array
bounds checking.

This series is based on Reinette's patch series aimed at fixing the
resctrl tests, available at:
https://lore.kernel.org/lkml/cover.1775266384.git.reinette.chatre@intel.com/

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
 tools/testing/selftests/resctrl/resctrl_val.c | 160 ++++++++++--------
 4 files changed, 91 insertions(+), 73 deletions(-)

-- 
2.34.1


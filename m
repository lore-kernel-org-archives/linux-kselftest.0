Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE841DE3DC;
	Thu,  5 Mar 2026 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674626; cv=none; b=sfcjOJ7T9kQg5rHEUek0E4QZePkn/U+tIl/AyqFoiWe8h9FLrzI5IaJSbk3brKAtPPuGbNZv5VvN+gi7Iaa7Z1WpC+GBnLbguUdnjg7tNHTpeaI0JCj+cyyaSh5v4v0ca0h8IwIuMr8CEACHiqynON278wLiu0UDjo+Fm1LElL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674626; c=relaxed/simple;
	bh=Nh3Tqzy2tq5YkixDdaZwou6ipM//83Ht+lhH6CMdjq8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aY3hMLUBPe9yYyDpSgj4z/IuEiA20CAfDjjOfz8iQ/8w8g8aGiv1nK5fzP8dFAem443IK2YJgrvySYz19eRQNg11QwUITw+oQEovpYBzEhTI7H7in5cKdR4EFNZeyBQfKZ0zbdnnd8Xd5Q7xuhYNlvsVwpKU4ca1HXRkXV4D4/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=IinlKN/c; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="IinlKN/c"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v4C33E1hX+Vidxc1X+jNPqKj3AvWKe8bmB8EyKplG3U=;
	b=IinlKN/cVzrSW9tkjALJJ2POGRlDb+TE/+BY10frgaprTHA0kZ4DR2hS57NBAhWgIHS35VOC+
	Z+Mz7Ci3+YiP8X0pWzsM7l2ETiiC16MiHjpy//EqN4+Uz2BdQN7e6rlEbctqJ1CXYNHE0LIe/wM
	3J22aNA5sf895TU1nLsjY58=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fRBqF5PL1znTbP;
	Thu,  5 Mar 2026 09:32:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0780240565;
	Thu,  5 Mar 2026 09:37:02 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Mar
 2026 09:37:01 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<broonie@kernel.org>, <yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v2 0/2] selftests/arm64: Fix sve2p1_sigill() and add cmpbr_sigill() for hwcap test
Date: Thu, 5 Mar 2026 09:36:36 +0800
Message-ID: <20260305013638.992301-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Hi all,

This patch series fixes and adds two selftests in the arm64 hwcap
test suite.

Patch 1/2 fixes the sve2p1_sigill() test to correctly detect the
FEAT_SVE2p1 feature. Previously, the test incorrectly assumed that
the presence of FEAT_SVE2.1 implied support for the BFADD
instruction, which actually depends on the FEAT_SVE_B16B16 feature.
The test is updated to use the LD1Q instruction, which is
unambiguously implied by FEAT_SVE2p1.

Patch 2/2 implements the cmpbr_sigill() test to correctly detect
the presence of the CMPBR extension. The test uses the CBEQ
instruction, which is valid only if the CPU supports the extension.
If supported, a branch is taken and the UDF instruction is skipped,
avoiding a SIGILL. Otherwise, the UDF is executed and a SIGILL
is generated.

These changes improve the accuracy and reliability of the selftests
for arm64 hardware capability detection.

References:

CBEQ: https://developer.arm.com/documentation/ddi0602/2025-12/Base-Instructions/CB-cc---register---Compare-registers-and-branch-?lang=en
BFADD: https://developer.arm.com/documentation/ddi0602/2025-12/SVE-Instructions/BFADD--unpredicated---BFloat16-add--unpredicated--?lang=en
LD1Q: https://developer.arm.com/documentation/ddi0602/2025-12/SVE-Instructions/LD1Q--Gather-load-quadwords-?lang=en
ID_AA64ZFR0_EL1: https://developer.arm.com/documentation/ddi0601/2025-03/AArch64-Registers/ID-AA64ZFR0-EL1--SVE-Feature-ID-Register-0?lang=en

Change Log:
v1:
Fixes the sve2p1_sigill() in patch 1.
Implements cmpbr_sigill() by the single asm volatile statement.
Updated the comments.

v1 can be found at:
https://lore.kernel.org/all/20260227031933.4103333-1-wuyifan50@huawei.com/

Yifan Wu (2):
  selftest/arm64: Fix sve2p1_sigill() to hwcap test
  selftests/arm64: Implement cmpbr_sigill() to hwcap test

 tools/testing/selftests/arm64/abi/hwcap.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.33.0


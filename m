Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D9F2F6928
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 03:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772162384; cv=none; b=Lt1rpFVlg8w9EssCy5Awq4qoZKYNLK5I9xBT1ZMUABxSzg6JIwkeG8OMB/BH7KwFQukhaGtiI8qfgRWOu24mouTTFyUFbrYLHzvE5v4O5QE8aWVlD6KShykFH/489/vVYrMU92DIP3MsM/B/kAmZWsxRrBZ8SOTnzAsjJ3FcSIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772162384; c=relaxed/simple;
	bh=ICqHGqb3sblKA/YUuWI8ilefkByTBfZZDKY0KIHPuy4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ueRihrWFP+B5QMAghHHW1OC7tmcRMM/2Xo3zGv0smLY0KFUuMNPIImOBqewhR3o0AnvcjdDVQOUFljHhnT4SvVU2jSryp9+E12bBgrZ0CaX7LRhz3F6Cp5MlFsoetBbWQVbOBDLB9CN6ThVY9aKdWMvGWEGrBUm2Ft7WXFoCgss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=RY5AFvJJ; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="RY5AFvJJ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BA6A7leQRevCce304CqKBN+0/oyAnNHxRWwEBqBsG+E=;
	b=RY5AFvJJt8a6Qjfr72rQ2Unt/sLAMtQ7YxvYhYmdX39/yQg9noULFvy3VpvteumVNp7+UzDV4
	QfTi88EjmuoXFx4MURtF2k24cwuzrsZoaB0wgGuQSnbVl5eRFAD7lSOcXfcIFhWZJz9zwp9OFuK
	T/4m0n1ONVNEKJP7e0LAey0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fMYN45jGwz1prLF;
	Fri, 27 Feb 2026 11:14:44 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 166F240561;
	Fri, 27 Feb 2026 11:19:35 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Feb
 2026 11:19:34 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<broonie@kernel.org>, <yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH 0/2] selftests/arm64: Add cmpbr_sigill() and fix sve2p1_sigill() for hwcap test
Date: Fri, 27 Feb 2026 11:19:31 +0800
Message-ID: <20260227031933.4103333-1-wuyifan50@huawei.com>
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

This patch series adds and fixes two selftests in the arm64 hwcap
test suite.

Patch 1/2 implements the cmpbr_sigill() test to correctly detect
the presence of the CMPBR extension. The test uses the CBEQ
instruction, which is valid only if the CPU supports the extension.
If supported, a branch is taken and the UDF instruction is skipped,
avoiding a SIGILL. Otherwise, the UDF is executed and a SIGILL
is generated.

Patch 2/2 fixes the sve2p1_sigill() test to correctly detect the
FEAT_SVE2p1 feature. Previously, the test incorrectly assumed that
the presence of FEAT_SVE2.1 implied support for the BFADD
instruction, which actually depends on the FEAT_SVE_B16B16 feature.
The test is updated to use the LD1Q instruction, which is
unambiguously implied by FEAT_SVE2p1.

These changes improve the accuracy and reliability of the selftests
for arm64 hardware capability detection.

References:

CBEQ: https://developer.arm.com/documentation/ddi0602/2025-12/Base-Instructions/CB-cc---register---Compare-registers-and-branch-?lang=en
BFADD: https://developer.arm.com/documentation/ddi0602/2025-12/SVE-Instructions/BFADD--unpredicated---BFloat16-add--unpredicated--?lang=en
LD1Q: https://developer.arm.com/documentation/ddi0602/2025-12/SVE-Instructions/LD1Q--Gather-load-quadwords-?lang=en
ID_AA64ZFR0_EL1: https://developer.arm.com/documentation/ddi0601/2025-03/AArch64-Registers/ID-AA64ZFR0-EL1--SVE-Feature-ID-Register-0?lang=en

Yifan Wu (2):
  selftests/arm64: Implement cmpbr_sigill() to hwcap test
  selftest/arm64: Fix sve2p1_sigill() to hwcap test

 tools/testing/selftests/arm64/abi/hwcap.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.33.0


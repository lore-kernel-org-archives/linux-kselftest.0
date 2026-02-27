Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7402F6928
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772162381; cv=none; b=gFQ3uMyYAIHiMM3tfXFtoDfEz1GtsyZ8S6c3zyCLrs0leUGvAZXAFIpO2vy2PXsB8YJGfwTblLPkgl3xf5Q9k7SNJpIdn+/3aRj785qr0konduALKSTN+D1ARDKdQ5LvNYY5XqDk3J2nzg2lVRIf8JsOTEzdc4FF3awapXh//3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772162381; c=relaxed/simple;
	bh=RVnntmTzXs+hvPfRA7NOqmTQfpxW4HA+H04KqFGYqYo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ox9n7pU3zLuguvAlh0cYlRiK9IBpsgHBHPozEGAkLPNb9H5ryB8IqCUv5NfmrzU1uCrBzIDUW+MQXgui41WkfdvU/RB5/scJAy6D0i+EpGrczX6/xbjU2AGCon9Gbw+ON7kSn8pV+RhoCC1uPaRU+UixK+iR/RWfPDrlNCnxaGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=e7fARSYa; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="e7fARSYa"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rPGb2TyziU/dFBTeP5RkyLgux5odcZyBVzlNY4Qr1LU=;
	b=e7fARSYa0gdt+SsWCzmzPUHlRZsLyb9i/tsKWQjus+9yiNH901v1LAcYIUXt3f4+6VynEk/fK
	9QESlMdenpqs8MYl1GaKrVt0Dka3AvsbLn55WnJHAet9SJWwKcl2e0YdiorTv912fdCeeN0kXv4
	JnMaHCdtswyVdhqOG2bgnpM=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fMYNJ4gd2znTXc;
	Fri, 27 Feb 2026 11:14:56 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 5483640539;
	Fri, 27 Feb 2026 11:19:36 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Feb
 2026 11:19:35 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<broonie@kernel.org>, <yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH 2/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
Date: Fri, 27 Feb 2026 11:19:33 +0800
Message-ID: <20260227031933.4103333-3-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260227031933.4103333-1-wuyifan50@huawei.com>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
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

The FEAT_SVE2p1 is indicated by ID_AA64ZFR0_EL1.SVEver. However,
the BFADD requires the FEAT_SVE_B16B16, which is indicated by
ID_AA64ZFR0_EL1.B16B16. This could cause the test to incorrectly
fail on a CPU that supports FEAT_SVE2.1 but not FEAT_SVE_B16B16.

LD1Q Gather load quadwords which is decoded from SVE encodings and
implied by FEAT_SVE2p1.

Fixes: c5195b027d29 ("kselftest/arm64: Add SVE 2.1 to hwcap test")
Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 0d229804a857..e8b22a60326c 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -478,8 +478,8 @@ static void sve2_sigill(void)
 
 static void sve2p1_sigill(void)
 {
-	/* BFADD Z0.H, Z0.H, Z0.H */
-	asm volatile(".inst 0x65000000" : : : "z0");
+	/* LD1Q Z0.Q, P0/Z, Z0.D, X0 */
+	asm volatile(".inst 0xC400A000" : : : "z0");
 }
 
 static void sve2p2_sigill(void)
-- 
2.33.0


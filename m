Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46626318ECC
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 03:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772162385; cv=none; b=cxFK/FjyavEPalqeQ01BJL4zmyS4rfdKT6bEw3u8a3uSJhzAbM7Ix1RalYz708vgpu7gDGe7+JMZOmseGQ4z6hENWcp4snf4Uz+0B4iMMRKaKd4ZZuakVitTcNXOZ4Y+ywsfENOltwroLs9VyAkBI4SNwCzDV4+jqB3L2+n+ZB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772162385; c=relaxed/simple;
	bh=DtjKqkUaoSEqVji9JwpC85a6Vu5US2fimEjajOznGcw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=imkpE77K4BFb1xyuml7jdeQU7fOmGsS6lBeIhSl85XmupvmpsIUyaGYuy9ln8+eEhdH7nO1SKDq0Af1tfQtUFCFsl6A67HlQwr2OZXO7SXsvBMen/KwqGBIUPYBVgigjJggrA9qOUpZuivsGLa+/Jz4kKhzL40SAISegmXOZZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=jfiWMjBw; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="jfiWMjBw"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3O+AOzmpnyfwQS2PkJNqr9fWBcdHz7jMhU/F79la4Nc=;
	b=jfiWMjBwS+GANZQLHHyx61TDrpi3QFYYI0+ISP1NzZjxSsSCxiLub/69evp5v/8OKLtBF1dJe
	kIs9SjkkU0f8rouNSr8VY7Vv3VHGEKRVNEJAfMjvNfw1fo4NVc1ScbTn/OU1+EGEl88bSsn5eLV
	CYsWg6DMh5tpCMdKraaZEh0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fMYNJ1XyXz12LDR;
	Fri, 27 Feb 2026 11:14:56 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B561F40561;
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
Subject: [PATCH 1/2] selftests/arm64: Implement cmpbr_sigill() to hwcap test
Date: Fri, 27 Feb 2026 11:19:32 +0800
Message-ID: <20260227031933.4103333-2-wuyifan50@huawei.com>
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

The function executes a CBEQ instruction which is valid if the CPU
supports the CMPBR extension. The CBEQ branches to skip the following
UDF instruction, and no SIGILL is generated. Otherwise, it will
generate a SIGILL.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 9d2df1f3e6bb..0d229804a857 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -56,7 +56,10 @@ static void atomics_sigill(void)
 
 static void cmpbr_sigill(void)
 {
-	/* Not implemented, too complicated and unreliable anyway */
+	/* CBEQ x0, x0, +8 */
+	asm volatile(".inst 0x74C00040" : : : "x0");
+	/* UDF #0 */
+	asm volatile("udf #0" : : : );
 }
 
 static void crc32_sigill(void)
-- 
2.33.0


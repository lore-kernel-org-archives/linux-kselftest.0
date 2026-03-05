Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044A519E98D;
	Thu,  5 Mar 2026 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674626; cv=none; b=XKvVHCi40B3o7eQ3W5H81n46IWrrsHcwfzpYzI4RmAZRlEU+A46BEoQljGSvPNToJy+v3sdV8u8TAs4NlQnhxuqAPP8r+5ARV7zBcKhFLytq4NKzDP3I2zdrwzubLOcpMMM9snzv/8B49oBBxnp+pMTrRsD7qmWnZElL1mKUXEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674626; c=relaxed/simple;
	bh=Uevk0GB5nabvrKrs0N2S+u91XxJSaz29sUMiVgSAUnc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S+o0zh+GUCBsVNGMntgjAQuB1g2oCSa2/b6bUzV9/EuvBHt5KRmLMPUtIDqAy0iPiAg4yPHYYd1Q4wLzbt5pWRKoWRL9pnl30Te80DfsOXKpiJiNf8iN/TjiAiLMTafDZDyL67byPyjC6kdEpZxgw1w2MdygozC9H4RhnMa2Om4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=DvCG0FyU; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="DvCG0FyU"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OfW3VplqAwqPnYpDi9Xi2kjGv6UcJGL67/vONLonH0k=;
	b=DvCG0FyUOHOUTxq1Ky6Vqx/hHHDjVHJ1DiomkbGf127J7h2OSB/q4jJYeB3hz7onFDsoSuKec
	pI9PfXuJu6AEZ4O3TBBe3xzPWUnDrtmVS+o32kiOjk+aveJqUQxxWKky0t3SNto05J29PTJOW0p
	s6Fx/cc3+uQ9UPp0u32TbLM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fRBq01VLjzRhTj;
	Thu,  5 Mar 2026 09:32:12 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 02EC54056B;
	Thu,  5 Mar 2026 09:37:03 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Mar
 2026 09:37:02 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<broonie@kernel.org>, <yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v2 2/2] selftests/arm64: Implement cmpbr_sigill() to hwcap test
Date: Thu, 5 Mar 2026 09:36:38 +0800
Message-ID: <20260305013638.992301-3-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260305013638.992301-1-wuyifan50@huawei.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
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

The function executes a CBEQ instruction which is valid if the CPU
supports the CMPBR extension. The CBEQ branches to skip the following
UDF instruction, and no SIGILL is generated. Otherwise, it will
generate a SIGILL.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index c2661a312fc9..e22703d6b97c 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -56,7 +56,8 @@ static void atomics_sigill(void)
 
 static void cmpbr_sigill(void)
 {
-	/* Not implemented, too complicated and unreliable anyway */
+	asm volatile(".inst 0x74C00040\n" /* CBEQ w0, w0, +8 */
+		     "udf #0" : : : "cc"); /* UDF #0 */
 }
 
 static void crc32_sigill(void)
-- 
2.33.0


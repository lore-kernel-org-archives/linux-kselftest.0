Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794643969;
	b=joebqpJzNEgiKKxjlXpnlxIDOWqzoAUITgXURwGBPCv5Nw+a4AzhbXlOHhpJewrG+Jvy
	 xMYWJ96Ncz8L3o98gxXG2ev/ijGk5frZVMtuD/vmJQFAHgmLS10AjGDhkntFe/Bq3zftZ
	 0I1EY231HVg+RNM0TFF76d8t0JuDpGL8MCqCIzWD1OwNiEsRHXAna+IF8zqbfyyVEOySw
	 umRig2I5vAkoUKHUVu/eNzDJp/BknZqwwROMiDX36ubwNsjRZB0MhXsfpJPM0M0P3c5re
	 rlsUO4qVfULSrIHdGlmYfIbuJ5qNllujsVSuhNnKJ6pyt7kJF8x+ugxVZx+51jbL7Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794643969;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=CEs83Sr1XhEd2DXMpAa750j5Z0GIbDWQqMk0/gmeD7o=;
	b=INvwHy0ZUc3FsRtM5LTBO3dH5H3JoMEzOJE1ucetXfGKspynT1BpYNLEWi5z6rKaQ2+q
	 oRJAIsqM13wDWFXbxjkPRsqvUXFxgn41gdnYvT3HVdE5WZtv6WY29YJbLDwVgMAEAa/zX
	 geRbV52TOYar7jxNkYmoWhqNw+AhQB1qQjBifJ7k2/Yfj1zAqSnTu8v87RcJ+MNiRFatt
	 TG3R2j1u8On83CHBylHDiqL8kEq3EBbn/J2PJVSrS0IO1IftRHtCUyU07ffmHVT6Ph07V
	 4Hv5XuTD4O75ul3T+X+nOYWfMARrk/H/TsxdnntkAfrHmQ0bt20juRAeL1BsJRNtD1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aujXAkEF;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9B2606A327
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 08:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B9B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aujXAkEF
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CEs83Sr1XhEd2DXMpAa750j5Z0GIbDWQqMk0/gmeD7o=;
	b=aujXAkEFYwrNXIPo4ckxgDufLTx5qGt/hEp7zFk59xz7QEt+p/rbiBbMuz8i+P+gBrKNMmlBp
	VxJ+9i2PUlJapnVw5FIgoT0xSmO79EUvhfjmrzJ7cJ8LdKhA6eNdz2Q9pykTEwI0LkbNO61qTDZ
	m3nxNath3ymLz4QlpZ49xNQ=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jRRgh0vw6zKm6K;
	Sat, 14 Nov 2026 16:12:32 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id EEC4240578;
	Sat, 14 Nov 2026 16:12:43 +0800 (CST)
Received: from localhost.localdomain (10.50.159.234) by
 kwepemo200009.china.huawei.com (7.202.195.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 14 Nov 2026 16:12:43 +0800
From: Long Wei <longwei27@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>
CC: <mark.rutland@arm.com>, <broonie@kernel.org>, <kevin.brodsky@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<hewenliang4@huawei.com>, Long Wei <longwei27@huawei.com>
Subject: [PATCH] selftests/arm64: signal: fix inverted feature mask in diagnostics
Date: Sat, 14 Nov 2026 16:10:13 +0800
Message-ID: <20261114081013.964933-1-longwei27@huawei.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo200009.china.huawei.com (7.202.195.26)

When a testcase is skipped because an incompatible CPU feature is
present, test_init() reports the feature set with:

        feats_incompatible & ~feats_supported

That is the set of incompatible features which are *not* supported,
i.e. always empty, instead of the incompatible features which actually
triggered the skip.  As a result the diagnostic prints an empty list and
gives no hint about why the test was skipped.

Use the supported set so the offending feature is reported:

        feats_incompatible & feats_supported

Fixes: 32de73e89099 ("kselftest/arm64: signal: Allow tests to be incompatible with features")
Signed-off-by: Long Wei <longwei27@huawei.com>
---
 tools/testing/selftests/arm64/signal/test_signals_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.c b/tools/testing/selftests/arm64/signal/test_signals_utils.c
index 4b12dbd7669d..16036e06d6c1 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.c
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.c
@@ -365,7 +365,7 @@ int test_init(struct tdescr *td)
 				fprintf(stderr,
 					"Incompatible Features: [%s] supported\n",
 					feats_to_string(td->feats_incompatible &
-							~td->feats_supported));
+							td->feats_supported));
 
 
 			td->result = KSFT_SKIP;
-- 
2.43.0


Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C49935A3A9;
	Mon, 27 Jul 2026 03:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785121774; cv=none; b=FWitjSSq9x6iLjTaSMo4COKofVkfTw7XXpzQVeFYbhsL5de7VPkz1Sfkg+KbcQJJSre/Eujdg8An+LC76LIEiyBiCg2jdiLwR5cnKv1g6l9ScUy+jLHt0NVaFBwxHGEOxS+XCw9XB+s7CXFHRV/i14UygdvsI80nxW2Rn2E7NGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785121774; c=relaxed/simple;
	bh=/j+r5l32f6sJujS8mA5cLIMkCaYNVqLT7ghA9P5WISk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n1r2FAsu6p21cJBSkHXLJBLobCY3b8lb3YGlwJUy4ULhtqlPZBEBjFlw0ZvQeVqqzTamvSn8g83/dJEbvyM2K/e8sgtWLgeaXNWXlnWeErPkmhy4/y0oamzVy5Lhugidne3te0BLo0UVJjMZfdYA0NkAr9qol+PzrnEdwIqfLNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GUvONaer; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GUvONaer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qd
	P5ft23szBz2myOhT2xaAy5Fx45GU1uhSDgzMjbKuc=; b=GUvONaeroz2yqmRxeX
	CRVdTMvMxZ3THdneyEQjLFQvoYq9uPEobnlsD9CJ1Ml75Ajpno7NvFmdMkKnqt8D
	gxzLE7UeN+ittnsJoofZsnMDtHfey1ysUHkNgePoDlr0mgMz79MVGntqeDsyOCXC
	kms7Z7mtH9hrR7//obq0Fg+F8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHsPiwy2ZqBRV6Lw--.25347S2;
	Mon, 27 Jul 2026 11:08:33 +0800 (CST)
From: Lei Zhu <zhulei_szu@163.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	shuah@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhulei_szu@163.com
Subject: [PATCH] selftests/futex: Correct pthread_create return value check
Date: Mon, 27 Jul 2026 11:08:32 +0800
Message-Id: <20260727030832.118316-1-zhulei_szu@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHsPiwy2ZqBRV6Lw--.25347S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4kZF43tr4xWw1UArW8WFg_yoWkZrgEg3
	yUAw4vyr45Jw1vvr1Ika13ur1DK34UWr4rXFy3Wr17tF1xXwsxAw1kZw4kuF9ag34Yy343
	tan5WFy3Ga4a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMUUUUUUUUU==
X-CM-SenderInfo: x2kxzvxlbv63i6rwjhhfrp/xtbCzhJToGpmy7KLOgAA3r

From: Lei Zhu <zhulei@kylinos.cn>

The pthread_create() functions returns 0 on success and a positive value on
failure. Modify the return value check to correctly detect failure cases.

Fixes: 14d016bd7282 ("selftests/futex: Refactor futex_wait_private_mapped_file with kselftest_harness.h")
Signed-off-by: Lei Zhu <zhulei@kylinos.cn>
---
 .../selftests/futex/functional/futex_wait_private_mapped_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c b/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
index 2a749f9b14eb..e6266c8a357e 100644
--- a/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
+++ b/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
@@ -62,7 +62,7 @@ TEST(wait_private_mapped_file)
 	int res;
 
 	res = pthread_create(&thr, NULL, thr_futex_wait, NULL);
-	if (res < 0)
+	if (res)
 		ksft_exit_fail_msg("pthread_create error\n");
 
 	ksft_print_dbg_msg("wait a while\n");
-- 
2.25.1


Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A4347BA9;
	Tue,  7 Jul 2026 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404506; cv=none; b=PRXYm95GXJPdkjLlEIgQX5IfmGg2TeXuK8tBKvvHfaqPGDSubpqUqXx2ejc/j3KxLJ2yXAbD8tGNrBfZl5CyBbco8ovBi1QMptQshJ1te2/nUT1oJq5BLNJRQ7SNGg03NhXenIJJceJlcxqAWlrjX2UIUhWW2E766mqHjTYRIb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404506; c=relaxed/simple;
	bh=WksgIUkXjqj1KPOcbhLTowPkWDTc+0pEkWLBeWEz8ao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h+begkY6wllErJE0uOqFAsGk7/pzs/+MWza2+hkFWOXKic8uEmFrOZe0YaxUzOUx/gdCF0C58wjgHaJk26Em4nNBXm4Uqj2g4X6dh6oxksjNTQpUdSUDJYYBb/B014Kc+k+PYk3YhcmCufmWxWURtWgVEZLRGdATGNkXNytclgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3ea803fc79ca11f1aa26b74ffac11d73-20260707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:38aed175-766c-4fad-8cf9-35507b534818,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:54fd8fcea6665db57fd660727f37e98c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3ea803fc79ca11f1aa26b74ffac11d73-20260707
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 912493711; Tue, 07 Jul 2026 14:08:16 +0800
From: gonglinkai <gonglinkai@kylinos.cn>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gonglinkai <gonglinkai@kylinos.cn>
Subject: [PATCH 2/2] selftests: watchdog: fix block comment style in file header
Date: Tue,  7 Jul 2026 14:07:35 +0800
Message-Id: <20260707060735.1469033-3-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260707060735.1469033-1-gonglinkai@kylinos.cn>
References: <20260707060735.1469033-1-gonglinkai@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch reports BLOCK_COMMENT_STYLE for the file header because the
'*' on the description lines is not aligned with the trailing '*/'.

Align the block comment. No functional change.

Signed-off-by: gonglinkai <gonglinkai@kylinos.cn>
---
 tools/testing/selftests/watchdog/watchdog-test.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index 74a581250829..8b2c9a63439d 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -1,12 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
-* Watchdog Driver Test Program
-* - Tests all ioctls
-* - Tests Magic Close - CONFIG_WATCHDOG_NOWAYOUT
-* - Could be tested against softdog driver on systems that
-*   don't have watchdog hardware.
-*
-* Reference: Documentation/watchdog/watchdog-api.rst
+ * Watchdog Driver Test Program
+ * - Tests all ioctls
+ * - Tests Magic Close - CONFIG_WATCHDOG_NOWAYOUT
+ * - Could be tested against softdog driver on systems that
+ *   don't have watchdog hardware.
+ *
+ * Reference: Documentation/watchdog/watchdog-api.rst
  */
 
 #include <errno.h>
-- 
2.25.1


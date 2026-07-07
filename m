Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2E54204E;
	Tue,  7 Jul 2026 06:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404481; cv=none; b=i+ry+cpbO8i4ir2Zm1sqUld/92EzJT2Jo4SFnhMUyA1AsV9frJoF0hzQ3gXQWgERwJN0j8DT7tyH8pGj6Fb2a2d94oVV58nm9fHvLbQ5SCYA04cF2mFVHH/rd0wxG1Pn0tw5eDKcFnkvA9YMoP/4zicWSPSJNO7nMTifoa6kadI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404481; c=relaxed/simple;
	bh=ZLR/FWv/SLHitfPPDWeD4qRrtjdb+4LIIaiA9TuijQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pstjW5sOVlINe9VezymAFK1WijPDy3h6m9+mozUJGM0trtPjtZKqdcNy6hb8Ps/nWlJ97paKOKl+qgj48ZC3rCCqc+oKcmT03kqXWShKupFsBFE8u/3nCrFj1+sZxcjF22xSUJ9KmqzPFg4Fi2+zl8LnoTKSsHwKsAzQ3exbIr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3168792e79ca11f1aa26b74ffac11d73-20260707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a5da04fa-ec6b-493f-8325-f7e4e95343e5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:5e6a871c530384ba7180390b8f9fb0dd,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3168792e79ca11f1aa26b74ffac11d73-20260707
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 627537347; Tue, 07 Jul 2026 14:07:54 +0800
From: gonglinkai <gonglinkai@kylinos.cn>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gonglinkai <gonglinkai@kylinos.cn>
Subject: [PATCH 1/2] selftests: watchdog: drop obsolete WDIOC_GETTEMP TODO
Date: Tue,  7 Jul 2026 14:07:34 +0800
Message-Id: <20260707060735.1469033-2-gonglinkai@kylinos.cn>
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

The file header still lists

    - TODO:
    - Enhance test to add coverage for WDIOC_GETTEMP.

but that coverage was added in commit ec7b4511185b ("selftests/watchdog:
add test for WDIOC_GETTEMP"): the '-s'/'--status' path now issues
WDIOC_GETTEMP and prints the temperature.

Remove the stale TODO. No functional change.

Signed-off-by: gonglinkai <gonglinkai@kylinos.cn>
---
 tools/testing/selftests/watchdog/watchdog-test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index 4f09c5db0c7f..74a581250829 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -5,8 +5,6 @@
 * - Tests Magic Close - CONFIG_WATCHDOG_NOWAYOUT
 * - Could be tested against softdog driver on systems that
 *   don't have watchdog hardware.
-* - TODO:
-* - Enhance test to add coverage for WDIOC_GETTEMP.
 *
 * Reference: Documentation/watchdog/watchdog-api.rst
  */
-- 
2.25.1


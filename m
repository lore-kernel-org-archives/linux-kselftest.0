Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977514204E;
	Tue,  7 Jul 2026 06:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404467; cv=none; b=P/nW/l3Ix0CwOjxQJM+OO/D8xWZBi9PcsKJjzf2r/T4OfW98WG54u8uVzWsRncoNNaJERUavVdNw0Fe4Xmw75fByVVAMUwvtb5+QTPzcU/I0P6g45938sa0K5ifUkFMfyYpj9Ja5Mq7Xd4jSkyGthKiTuFnHpR7RbqaOBhm+yWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404467; c=relaxed/simple;
	bh=RfO9Bl1VU4R3c5pt5zhdLyh9eGJHCv6DqWCxZX69WRA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GQ96Ox3ZIOX2Jm43GUX2t6V3L2fGHq47roWTst6gskDdKYdIl++6Ge95Lzmam2yLsuMZ3D1IYgz1CtEizJF6Y+VjG/vOCq1HjXQ/ngMWNgv6SITJtknHt53kYNM5GMBUQGgefJa7YsyousHOPFTNTbR4f2+eRb26LedjKyNlOZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 28448d5679ca11f1aa26b74ffac11d73-20260707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0e75bcc5-358b-4dac-b72a-57b28b533ffd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:48b47292785d03c2d9ec75d873650513,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 28448d5679ca11f1aa26b74ffac11d73-20260707
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 342158271; Tue, 07 Jul 2026 14:07:39 +0800
From: gonglinkai <gonglinkai@kylinos.cn>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gonglinkai <gonglinkai@kylinos.cn>
Subject: [PATCH 0/2] selftests: watchdog: clean up file header comment
Date: Tue,  7 Jul 2026 14:07:33 +0800
Message-Id: <20260707060735.1469033-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two small cleanups for the file header comment in watchdog-test.c:

  1. Drop the WDIOC_GETTEMP TODO that was already done in
     commit ec7b4511185b ("selftests/watchdog: add test for
     WDIOC_GETTEMP").
  2. Fix block comment alignment flagged by checkpatch.

No functional change.

gonglinkai (2):
  selftests: watchdog: drop obsolete WDIOC_GETTEMP TODO
  selftests: watchdog: fix block comment style in file header

 tools/testing/selftests/watchdog/watchdog-test.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.25.1


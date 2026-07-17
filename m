Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2993AB27B;
	Fri, 17 Jul 2026 06:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784269556; cv=none; b=VmoWftVwsTnLwDvVL+Qph1YetuQZzeoJrKSmLPcM1QFPhbqKCsoul8svA0aq4Z8Pqh0y4lztzw7XuniPftT+vYbY3pEkSpg2l2V/V8LVMxV3bKUL5ardvP68ZuX2BNLEzsxUUgHn1uFREc20NDByDKPhJt8tZEFTE7JGKI09Sjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784269556; c=relaxed/simple;
	bh=V45wftsuEXBvIMFd2nPl4/u6SLII7P+XcPx/TrAeE/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dnwVV3N6XgURSx4/tjlpJIKpy5FYgaKjtOJZHP24TqbT48076hGTZiOKxR6bnEnjFDAKNsJX7kUUy0EYXOdgJAwAp6Qib295MUfUCJDrbrohFYLAKSzD6MDh1WEyaMtJdAn93mOhh+49/YnWYeXqDZVXkPceOj9XJMYSqDoN1Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 57ac5bd881a811f1aa26b74ffac11d73-20260717
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f869318d-2b99-4b29-90e2-4dc5fc5a60a4,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:e7bac3a,CLOUDID:94922f67502caf87048fee04fd7fe257,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 57ac5bd881a811f1aa26b74ffac11d73-20260717
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1772774522; Fri, 17 Jul 2026 14:25:45 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/net: use ARRAY_SIZE macro in skf_net_off.c
Date: Fri, 17 Jul 2026 14:25:02 +0800
Message-ID: <20260717062502.1016-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ARRAY_SIZE macro is more compact and more formal in linux source.

Fixes: fcd7132cb1f9 ("selftests/net: test sk_filter support for SKF_NET_OFF on frags")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/net/skf_net_off.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/skf_net_off.c b/tools/testing/selftests/net/skf_net_off.c
index 1fdf61d6cd7f..d4e38d326c39 100644
--- a/tools/testing/selftests/net/skf_net_off.c
+++ b/tools/testing/selftests/net/skf_net_off.c
@@ -46,6 +46,7 @@
 #include <sys/types.h>
 #include <sys/uio.h>
 #include <unistd.h>
+#include "kselftest.h"
 
 static bool cfg_do_filter;
 static bool cfg_do_frags;
@@ -92,7 +93,7 @@ static void sk_set_filter(int fd)
 	};
 
 	struct sock_fprog filter = {
-		sizeof(filter_code) / sizeof(filter_code[0]),
+		ARRAY_SIZE(filter_code),
 		filter_code,
 	};
 
@@ -159,7 +160,7 @@ static void tun_write(int fd)
 	iov[4].iov_base = &payload;
 	iov[4].iov_len  = sizeof(payload);
 
-	ret = writev(fd, iov, sizeof(iov) / sizeof(iov[0]));
+	ret = writev(fd, iov, ARRAY_SIZE(iov));
 	if (ret <= 0)
 		error(1, errno, "writev");
 }
@@ -183,7 +184,7 @@ static void raw_read(int fd)
 	iov[1].iov_len = sizeof(payload);
 
 	msg.msg_iov = iov;
-	msg.msg_iovlen = sizeof(iov) / sizeof(iov[0]);
+	msg.msg_iovlen = ARRAY_SIZE(iov);
 
 	ret = recvmsg(fd, &msg, 0);
 	if (ret <= 0)
-- 
2.43.0


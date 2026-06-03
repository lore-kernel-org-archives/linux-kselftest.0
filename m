Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBC73FE35F;
	Wed,  3 Jun 2026 07:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471703; cv=none; b=Ra8C/6QGsOHV1EiKc4Nuc1ft/3vqpMLfo+P7cCBiB9xnEAtKmGuEa0TcSSrzhhQgmBkr/YN8VAesBu7CX3CgZg00pjC4Xx80voY3tr+vkru9gLvUOW+f7TuRejKli6NPgGGkunHLLP9FGJNroS4N1ulOY6+HHKig4heDs9t70xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471703; c=relaxed/simple;
	bh=xA7UfIjsdzjpfP0ypjSbyTGSceSJkM4ZFBm5jJ7NLcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bRcSnjumNz4UKIxs/ehUgL4UG5iLuoWdHKshAPNsBsJyebLvncI3oWUBqjYzm1EPop0vQpRpDQLbOuPrOOKsgjFVtSS4Ia2+ERlQLT+0YlIXvBGoMu8xYnyOX8OLQP/ICR77lfPTMzenoWWp6b/ufFe1Hh5P99NG1s0FC+U10DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c689eb545f1d11f1aa26b74ffac11d73-20260603
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8a7ad3f5-a62e-46e2-a6ac-ab11e6ea4dfe,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:36e271051fba172e530ea51f5dec6a70,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c689eb545f1d11f1aa26b74ffac11d73-20260603
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2125374877; Wed, 03 Jun 2026 15:28:11 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: antonio@openvpn.net
Cc: sd@queasysnail.net,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	horms@kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/net: ovpn: fix getaddrinfo memory leak in ovpn_parse_remote()
Date: Wed,  3 Jun 2026 15:27:41 +0800
Message-ID: <20260603072741.1097-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ovpn_parse_remote() function has two memory management issues:

1. When both 'host' and 'vpnip' are non-NULL, the first getaddrinfo()
   allocation is leaked because 'result' is overwritten by the second
   getaddrinfo() call without freeing the first allocation.

2. When both 'host' and 'vpnip' are NULL, 'result' is an uninitialized
   stack variable passed to freeaddrinfo(), which is undefined behavior.

Fix by initializing 'result' to NULL and calling freeaddrinfo() after
the first getaddrinfo() result is consumed.

Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/net/ovpn/ovpn-cli.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
index d40953375c86..f4effa7580c0 100644
--- a/tools/testing/selftests/net/ovpn/ovpn-cli.c
+++ b/tools/testing/selftests/net/ovpn/ovpn-cli.c
@@ -1785,7 +1785,7 @@ static int ovpn_parse_remote(struct ovpn_ctx *ovpn, const char *host,
 			     const char *service, const char *vpnip)
 {
 	int ret;
-	struct addrinfo *result;
+	struct addrinfo *result = NULL;
 	struct addrinfo hints = {
 		.ai_family = ovpn->sa_family,
 		.ai_socktype = SOCK_DGRAM,
@@ -1809,6 +1809,8 @@ static int ovpn_parse_remote(struct ovpn_ctx *ovpn, const char *host,
 		}
 
 		memcpy(&ovpn->remote, result->ai_addr, result->ai_addrlen);
+		freeaddrinfo(result);
+		result = NULL;
 	}
 
 	if (vpnip) {
-- 
2.43.0


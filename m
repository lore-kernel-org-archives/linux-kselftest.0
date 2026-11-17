Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910057;
	b=hED4I00yKynXD4Bur9KqZW+UVrYrsRXpSSKx6kD7C+uRll2Da7wSdrk7rGB7WwvctFU/
	 9umnp16XByBn38mP1F7D7MAG1UdF/WppoJCWp5wY37RdH2La6dvg3YxrEyBu994nN6mat
	 k15o7pSkJS282jSVh5cB7vlL+9mORzw+WPfMHlLDHQzIFhzI87xEkj5H+DVYDyzhYkUhr
	 Y5nMT828oGqzGOWAUBToJXwXrBbGWGYyVHzrhiFEaSM/s8X4cTCD5st2BrnZwOMHkOTiE
	 F3ZTR9wZyHQ+HAXefJQqkDqd6IoRMfQYZfcM9xEa70+1/Hwf1Eb/1/rCTiZQQQXQqUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910057;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P4EDsTXYCseHV5hzoZfsshveTpYVJTtMQhg6TQmq8mA=;
	b=iFTu8RXWXzesZgZ1nl89b8vOu8WJJ3PVTbrifScIAmBNRfgOaU+L0D3qaVgCWvHNsWMe
	 yDE4fUDbXm2Hp9zsRq8QhgHVS1aO8unKLc+g0sP1wYoJTS8/SPKzAqzYq3u/aTKW2tXjd
	 E8IAcniWsZYaKDbWL5tHG4ZbVWmOHUoYJLME8pPvHks5JgoC3iEuy1/o7mDox+SEJ2xx3
	 Fl/uHPEP980BwrHegUs5V1pmrGqi0NcxDmjWbdy1EnUYKEKlqlUXkR5/ko0bEBmEWTX1r
	 jxY4hx7X7yyv0E+/O9EYdr1eu1Xk/EKy2+fh+0aYtR7VRMV8t7q0+Nfl4bjAeVXga/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22F7606A323;
	Tue, 17 Nov 2026 10:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b1e1d30ee26e11f19a56ed5b684f684d-20261117
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:2a683d23-300d-49f1-bb21-3a3a885a9175,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:6fb6a018501204081278b4e12134eedf,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:-3,I
	P:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b1e1d30ee26e11f19a56ed5b684f684d-20261117
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 12662009; Tue, 17 Nov 2026 18:07:28 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: brendan.higgins@linux.dev,
	david@davidgow.net
Cc: raemoar63@gmail.com,
	bartosz.golaszewski@oss.qualcomm.com,
	dakr@kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] kunit: unregister software node when fwnode lookup fails
Date: Tue, 17 Nov 2026 18:07:23 +0800
Message-Id: <20261117100723.667634-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

If software_node_fwnode() returns NULL right after a successful
software_node_register(), the error path leaves the node registered
with no cleanup. Unregister it before returning the error to match
the behaviour of the other helpers in this file.

Fixes: 9fdbdb528488 ("kunit: provide a set of fwnode-oriented helpers")
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 lib/kunit/fwnode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/kunit/fwnode.c b/lib/kunit/fwnode.c
index a58ce0984d76..5a98e5e75f22 100644
--- a/lib/kunit/fwnode.c
+++ b/lib/kunit/fwnode.c
@@ -74,8 +74,10 @@ kunit_software_node_register(struct kunit *test,
 		return ERR_PTR(ret);
 
 	fwnode = software_node_fwnode(swnode);
-	if (WARN_ON(!fwnode))
+	if (WARN_ON(!fwnode)) {
+		software_node_unregister(swnode);
 		return ERR_PTR(-ENOENT);
+	}
 
 	ret = kunit_add_action_or_reset(test, software_node_unregister_wrapper,
 					(void *)swnode);
-- 
2.25.1


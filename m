Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A2A198A17;
	Mon,  1 Jun 2026 01:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780277991; cv=none; b=VVx2xDfU6dNpD2UbCU3IRZ2ZB4Bzr4sDibS4HrjWD0LHMwNbmDVxgulYHMUfNwjRYYm3Looov82KO6SYRy3x56gihhdYaU/iUGKeWH/2eaL6Vawrbmvb0Ua72Qq53kfMSDyGQjbHZyv5aKCOzB6gIFZ1Vt+V/YwrgtuF2YPc1YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780277991; c=relaxed/simple;
	bh=VdDacIgbwXmWuXA8GIrc7g15U71VknDUlGPE5f3K/eg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ktUH7LSDrEYjoYPCTtAlv8IOLSshrcQqm4UEbUInH0JNzmlzwDjFTT06IRgBSLGYqUt+nrKjGrLnKiSTsM0CTNv9hosed4tLUcYruVQTGbIL204rB0hKn/TjCXOuo+ztJVq/9VPzvwuqYCDKgoDbhKpdsKQDeX7cSPAsoMD2K3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c3272dd85d5a11f1aa26b74ffac11d73-20260601
X-CID-CACHE: Type:Local,Time:202606010901+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:203ff2de-9a5d-42f8-9e9e-6087554b6eef,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:f432ff75abedca96198ec1fc4468285f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c3272dd85d5a11f1aa26b74ffac11d73-20260601
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 704507111; Mon, 01 Jun 2026 09:39:42 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kuniyu@google.com
Cc: joannelkoong@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] selftests/net: bind_bhash: fix memory leak in bind_socket
Date: Mon,  1 Jun 2026 09:39:27 +0800
Message-ID: <20260601013927.1835-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The getaddrinfo() call in bind_socket() dynamically allocates memory
for the result linked list that must be freed with freeaddrinfo().
However, none of the code paths after a successful getaddrinfo() call
free this memory, causing a leak in every invocation of bind_socket().

Fixes: c35ecb95c448 ("selftests/net: Add test for timing a bind request to a port with a populated bhash entry")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/testing/selftests/net/bind_bhash.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/bind_bhash.c b/tools/testing/selftests/net/bind_bhash.c
index da04b0b19b73..2bd100777448 100644
--- a/tools/testing/selftests/net/bind_bhash.c
+++ b/tools/testing/selftests/net/bind_bhash.c
@@ -52,18 +52,19 @@ static int bind_socket(int opt, const char *addr)
 		err = setsockopt(sock_fd, SOL_SOCKET, opt, &reuse, sizeof(reuse));
 		if (err) {
 			perror("setsockopt failed");
-			goto cleanup;
+			goto err_free_info;
 		}
 	}
 
 	err = bind(sock_fd, res->ai_addr, res->ai_addrlen);
 	if (err) {
 		perror("failed to bind to port");
-		goto cleanup;
+		goto err_free_info;
 	}
-
+	freeaddrinfo(res);
 	return sock_fd;
-
+err_free_info:
+	freeaddrinfo(res);
 cleanup:
 	close(sock_fd);
 	return err;
-- 
2.43.0


Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ADC3B8D48
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776774694; cv=none; b=Ht1HOGuA1WzDhhb+Ln0wRNx4jcdYHNx8GFBeF8e8ggHqYBijxj5WY9fG4MXTwbNGZInMsXbNzg5y9n8uyUMMZNXZXniiN6+QwkMgf2sWF68r6YuQaxa1tJwlyVIW7yQKd3o63JBlb03FtW8JlBTGgsHqt20IBhjjYUxWUk+pU3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776774694; c=relaxed/simple;
	bh=w884/R5pRr4A9Ao3FZ4s632FkuobTk5hiTXn9qCtIm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFE+AkhxtKaUsD8TLWow/AnAj/e4aiQ7njQ62EFnXy3EREvvidRVrBDMVXZZuW7IpPc1FVbZAZDmZhhB8KYM4ZU0bXROu1PMa7igj6OYYZ+8nxDE9OQ7CEwObErAZAi1XcDbCYgMTjLmSSMk2gWNxGr9sJhg6SnWcLvTSWYgoWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAFCK7qZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAFCK7qZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ab46931cf1so36415485ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776774689; x=1777379489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfSMMYYOulor7sfQhsaown6uCtV1QzJ0oZSRjmjzgNk=;
        b=lAFCK7qZfgCVLE2+iHUNp76bMMvpI5XdqYHfJC++v1x1nV2sxfP1mGU+XZF49eY3Qg
         GY8/l8VeSKedA68mv63mRQO/AOePhkriKrZCCSpWimFlIiEYWg2/3LUWWdpzTVjFEdGc
         Y+NeGfcHfB0u76IeKYVEgDPb18UY8RFbcfd2eBfRQBkHCid8LGdMgTEpqtBER0GCdMly
         VFJ0/WBignMqLlCs5+DRddlJPh+9T8+92b5cNWeVKb6/Hdfm8gGAXIAZEv9v3dKU/b1p
         6uOhwfChOVgUs/ObL6xV7kdZ74eIuKsLm/ZkF50I4T88vcgF0uAEpzaTJa6TwelkgHBh
         bZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776774689; x=1777379489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MfSMMYYOulor7sfQhsaown6uCtV1QzJ0oZSRjmjzgNk=;
        b=EKe/lXFyYfIVnEAtTWSTBVtbBTZShdTq/16rkCchIgLkvg/gl+qAnKEO1XOqPJYSPo
         O0ESX/k9yFUyHnNwrdAw6IXiETk2Tqm5jIzBdKK/sDLyReQJTL0lqFjtW1KlYPaeI63p
         wOVpAfrvjKliWNLf7rw3pWEZol7xsvaEjwvkGQCMFpDb/JBmJ7XBXusfsg+orqIKqqWT
         vm9jMQGW0uXwgZcv5qHQv/t1x71AWeVDPznf/07BdXjduPvIHu4ns2pnorB8vrwyRpq0
         m+zYnmVtsYpCnGi64dhHNmlVPIuF1pUTVFMxI39N768Nbv3Jea9QIFgfi2h2BBtEVd6x
         6CrA==
X-Forwarded-Encrypted: i=1; AFNElJ9td/ObQbm/hwx0IC2EfBPhVQ7WTDfh65/Nk12pN1+0Jw5+Qe31PoXx5gEGi98aQfhvvYtZdxT3kLY0dCNIMbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMjCyDxzjifBvdAJeisKoZ6+MNgBONRRxx27muOJEXQEXVsJTG
	k+gbou0k4RnT8yabgLM0U6lRmbfyd6jcNe0DjPt7tYVVml+nOfZ8OdM2
X-Gm-Gg: AeBDieuNiz1J4iqiiU/arsIhwyvSw/kDPa4PPM/nz44fyziMQxu9R0uDSGqJ0NdXy6A
	+S5mVqtNX/XA4bM5HMgzbHeH6cOdnUwDCHMfdPfXKQ7hVG2w0w+pyyP2n+8nRMJKqQGszJCygxw
	wsLKTmV34F7QPo0oNZdHHtI6QkKGChIpGTeLR3KE5/X7X9IvSlrZKqPEC68XxXyvDakoY4JRFEX
	Jis7Hb7O/3rcsWf/3rThGeNxh67dYn1vup5eW35jYcgG/8qqDXFhC+JuCUj1gJ7ieeuUPm2ppnE
	4U5Nb4Sg8iq+etPk074BUDG9M/Inav0YDiC+K5FSZya8ouk4ni9KUa6QemRUz6tlBxsxVVvYyuA
	vEE6gYLUUTb/beQVv62mb5EAAfyI0WbkXl8gWuYX73mNM9U8cIRe7tVgEvznb+rDzUrSwkEqsVV
	KAPSdR/k+3ee3o5s4U9sWfy3Bv4ntsSEp9gYY/7ob1+ywaM9SSto5RHYukFKtBDhTr7XkPHjoN
X-Received: by 2002:a17:902:bb96:b0:2b2:5168:2f82 with SMTP id d9443c01a7336-2b5f9ed4d0cmr96165515ad.24.1776774689295;
        Tue, 21 Apr 2026 05:31:29 -0700 (PDT)
Received: from DESKTOP-MUHC17F.tail07b66e.ts.net ([188.253.121.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff409sm169724315ad.14.2026.04.21.05.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:31:28 -0700 (PDT)
From: Zhenzhong Wu <jt26wzz@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	tamird@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhenzhong Wu <jt26wzz@gmail.com>
Subject: [PATCH net v3 2/2] selftests/bpf: check epoll readiness during reuseport migration
Date: Tue, 21 Apr 2026 20:31:06 +0800
Message-ID: <20260421123106.142299-3-jt26wzz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421123106.142299-1-jt26wzz@gmail.com>
References: <20260421123106.142299-1-jt26wzz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inside migrate_dance(), add epoll checks around shutdown() to
verify that the target listener is not ready before shutdown()
and becomes ready immediately after shutdown() triggers migration.

Cover TCP_ESTABLISHED and TCP_SYN_RECV. Exclude TCP_NEW_SYN_RECV
as it depends on later handshake completion.

Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
---
 .../bpf/prog_tests/migrate_reuseport.c        | 46 ++++++++++++++++---
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
index 653b0a20f..6180a79a7 100644
--- a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
+++ b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
@@ -7,24 +7,29 @@
  *   3. call listen() for 1 server socket. (migration target)
  *   4. update a map to migrate all child sockets
  *        to the last server socket (migrate_map[cookie] = 4)
- *   5. call shutdown() for first 4 server sockets
+ *   5. for TCP_ESTABLISHED and TCP_SYN_RECV cases, verify via epoll
+ *        that the last server socket is not ready before migration.
+ *   6. call shutdown() for first 4 server sockets
  *        and migrate the requests in the accept queue
  *        to the last server socket.
- *   6. call listen() for the second server socket.
- *   7. call shutdown() for the last server
+ *   7. for TCP_ESTABLISHED and TCP_SYN_RECV cases, verify via epoll
+ *        that the last server socket is ready after migration.
+ *   8. call listen() for the second server socket.
+ *   9. call shutdown() for the last server
  *        and migrate the requests in the accept queue
  *        to the second server socket.
- *   8. call listen() for the last server.
- *   9. call shutdown() for the second server
+ *  10. call listen() for the last server.
+ *  11. call shutdown() for the second server
  *        and migrate the requests in the accept queue
  *        to the last server socket.
- *  10. call accept() for the last server socket.
+ *  12. call accept() for the last server socket.
  *
  * Author: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
  */
 
 #include <bpf/bpf.h>
 #include <bpf/libbpf.h>
+#include <sys/epoll.h>
 
 #include "test_progs.h"
 #include "test_migrate_reuseport.skel.h"
@@ -350,8 +355,28 @@ static int update_maps(struct migrate_reuseport_test_case *test_case,
 
 static int migrate_dance(struct migrate_reuseport_test_case *test_case)
 {
+	struct epoll_event ev = {
+		.events = EPOLLIN,
+	};
+	int epoll = -1, nfds;
 	int i, err;
 
+	if (test_case->state != BPF_TCP_NEW_SYN_RECV) {
+		epoll = epoll_create1(0);
+		if (!ASSERT_NEQ(epoll, -1, "epoll_create1"))
+			return -1;
+
+		ev.data.fd = test_case->servers[MIGRATED_TO];
+		if (!ASSERT_OK(epoll_ctl(epoll, EPOLL_CTL_ADD,
+					 test_case->servers[MIGRATED_TO], &ev),
+			       "epoll_ctl"))
+			goto close_epoll;
+
+		nfds = epoll_wait(epoll, &ev, 1, 0);
+		if (!ASSERT_EQ(nfds, 0, "epoll_wait 1"))
+			goto close_epoll;
+	}
+
 	/* Migrate TCP_ESTABLISHED and TCP_SYN_RECV requests
 	 * to the last listener based on eBPF.
 	 */
@@ -365,6 +390,15 @@ static int migrate_dance(struct migrate_reuseport_test_case *test_case)
 	if (test_case->state == BPF_TCP_NEW_SYN_RECV)
 		return 0;
 
+	nfds = epoll_wait(epoll, &ev, 1, 0);
+	if (!ASSERT_EQ(nfds, 1, "epoll_wait 2")) {
+close_epoll:
+		close(epoll);
+		return -1;
+	}
+
+	close(epoll);
+
 	/* Note that we use the second listener instead of the
 	 * first one here.
 	 *
-- 
2.43.0


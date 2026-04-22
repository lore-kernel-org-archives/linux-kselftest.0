Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0E93932EF
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 02:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826011; cv=none; b=raQgUVPoiDVGPOgcdrIqOcpRA5hMzO9d6R+f4w7fClbaLFwvs9cpOVjkQJQJESIwW71B+XwfxcGw4F4hpxF1D9PFNHMtm+QMg17PK/EY3Ex6TxOFwiJ34jTdzEOXY/PuaF7haM+WBV53GH+mLo8X3eAcO2F/pMNR5Pi/FqZcu5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826011; c=relaxed/simple;
	bh=0sA2sLWOI1+YrADOtn/nn5LqfxqcE06IldheBa+ejVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5bdqg7FrVjxgVznUj94jIWDG9R5lgk2f1l57wIRbp/COtYWoKd8d9qbNGw22nH73UwbiOQa/97FWcVMoFmBVXT8NW2I9yn/H7PRrk247Hiho/GNBquzPNXrpGJSRBWY35Lmoaf09XpubTHG6s7Lt/xMd2vHTnw31uP/jBlpBqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pikjsedV; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pikjsedV"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c648bc907ebso3159677a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 19:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776825999; x=1777430799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lS/6+OQwHBm0U4E/bt3m5g//SPZTdfGBYdVOL3eGpDw=;
        b=pikjsedV/6GXojXW6P3fNbkfSD/yuiKE62Q2hOY9r3IVyzRPPoSJecEYQ/6QplW3IU
         UeJSINZG+lkosuUVyjBCF8oJjqLW+1AirhSLsKfsKPL7XnlDaZSBUSP8UDp9+mtkZEqr
         rOXj+aJSkOMTSy1102dXwJeKZWbNJibAsjhZGEbtD1Hja4GCTqbmcHr0CHBfzVDRVonY
         M6BjClsCLIiMcSkWvyepNz66U6HAoJlLL4EHYibdVFaDKQKTjX2w/Avjx9jCAkQ8dn+G
         Iu2RTIY2e67W0XKDqLIFygz2yE24Q7cftRn3Y638OWsgOURs9D5sgMYiDF7KWdzD+CqL
         eXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776825999; x=1777430799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lS/6+OQwHBm0U4E/bt3m5g//SPZTdfGBYdVOL3eGpDw=;
        b=S9ArXkoq7O82fJO/IkQNBHqoaSeZTrYsVZA9OBCv17OuqnxI/k/Qx1ACW1k1cn37Nq
         whgtaL5AB/1Ipo4SGwYZnVfx1qDC9glB3KkONn6+NH/o2q9qwhxpyweNWXkYZtspl3YD
         LqZ9ZeNMWr6OO1y5GAnC5fHN/RndG8URZZUrJWZkHBTYNUS/aprOEOTSKnJ8C5k4moo6
         9w+FfQ3mDlAdtIBLmmiaezoSkmPNL2v2CssFjudYb/ggQiv9beL9vJIAA5TolwQm1NQY
         2pTWARrsG8jhpxu1XHLclazKgKXZzlg0b7FKXG7WsyMUAKDjTNygH8WZLgtyDCT2G/3G
         mkQg==
X-Forwarded-Encrypted: i=1; AFNElJ+4b8CLtUz67MA1QskpEs2LEJsdAtrgPv7BXX6ibLRIeDu2leF1602f/N/VUW88vCB3OG99pJP94of8wS2t844=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0YiBfOTg8OjyPTZ0yRjdruFG0uKiooeNQ8AXPHBVF/fVs3g7l
	A28ft+0Drlj41AKxppkl+m0nV2+4oRai48YdSkLE979ASJutWK+7Yn0X
X-Gm-Gg: AeBDiesm4mxF8vzJPdnioQsf5ZvyS2tuYFIMx2Nr0ImVo8FuR1TLHqqoR+y9ChOJ7ef
	rhoZfB16WGEA2+Zk/iaxUDX4lshuSYbw0ebxwsiGbyqlTmmSmIXISgCFvQI0XqmsTyhwdtB3bs3
	6pD26Bes5V6f3xfcNWtcy0EYm4Ovss8Zcl4rmk5Pcy8Ex0naWxYJy66O2rEEjLtE+MF34ClSh1D
	uZwYLfxsRtBDya1wJ0wJoyfwE9Znoa4lajxQm1XwC3+Nq7MVv9uURSm9RlUBlLNC8dGBzUuy23X
	sPlW4yjAQzXfKJM9YoG8RWZOc6nWlgW7EutvMz3GKljHxLBxjd2HZLlKj87Tl3HjcMbnD/zXMSS
	a8t3jBTaGFeym6MKo3EY8yVqUPbPFSts1mOOVwRdT5JP6auSCy1B+W1MwxG7pFyEjIZonWRVnVp
	YBxKSvTSFyhj0jK6Vdx3zxJdWCFVgi8Q+8q4EmXB/oKUQfv56XWumSuJQIv7Tb/A==
X-Received: by 2002:a05:6a21:32a1:b0:3a2:f402:50fb with SMTP id adf61e73a8af0-3a2f402551emr4604812637.34.1776825999302;
        Tue, 21 Apr 2026 19:46:39 -0700 (PDT)
Received: from DESKTOP-MUHC17F.tail07b66e.ts.net ([188.253.121.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f92183sm10656632a12.3.2026.04.21.19.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:46:38 -0700 (PDT)
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
Subject: [PATCH net v4 2/2] selftests/bpf: check epoll readiness during reuseport migration
Date: Wed, 22 Apr 2026 10:45:54 +0800
Message-ID: <20260422024554.130346-3-jt26wzz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422024554.130346-1-jt26wzz@gmail.com>
References: <20260422024554.130346-1-jt26wzz@gmail.com>
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
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
---
 .../bpf/prog_tests/migrate_reuseport.c        | 49 ++++++++++++++++---
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c b/tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
index 653b0a20f..c62907732 100644
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
@@ -350,21 +355,51 @@ static int update_maps(struct migrate_reuseport_test_case *test_case,
 
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
 	for (i = 0; i < MIGRATED_TO; i++) {
 		err = shutdown(test_case->servers[i], SHUT_RDWR);
 		if (!ASSERT_OK(err, "shutdown"))
-			return -1;
+			goto close_epoll;
 	}
 
 	/* No dance for TCP_NEW_SYN_RECV to migrate based on eBPF */
 	if (test_case->state == BPF_TCP_NEW_SYN_RECV)
 		return 0;
 
+	nfds = epoll_wait(epoll, &ev, 1, 0);
+	if (!ASSERT_EQ(nfds, 1, "epoll_wait 2")) {
+close_epoll:
+		if (epoll >= 0)
+			close(epoll);
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

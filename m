Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EEC491582;
	Mon, 21 Sep 2026 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023699; cv=none; b=ma7VEXkwUxIqof4IrD3DAUURGtJ61T2kxLNvjW0yfNsv3grwyemr1lhV8sGFvlYfReDYx88PccP2ffNmk9jJzV1SZKpVGoY8ApQXwZyt+5v+MESWsmxS69zfLqEeUNdkjpNkcoRaNwRMByOonLhle7R8PwWi/IymPHMWUbLZQsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023699; c=relaxed/simple;
	bh=p4n8QSY/qYYIzhzZV9PoDwq31sXk+L9M3s1kLZqLrWE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+SqA8UKNppCg8jDMnUPFmuMwZzfX6QpoGC/KOSN/sPi/JBjgmbddqii1yOGRftX/vAzVtwTpgs6arGmoml4d1hRm2ou8L6CyWZOA+4IlMUs6FZHkKxVZ8pkWZzemLUtYAJamFdJ+eg47R2Jdm1zqVts//VSYR6+rNS+zYxpobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=rklxGnp2; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="rklxGnp2"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 17CFA2067A;
	Mon, 21 Sep 2026 22:48:10 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cSb85p2dnBhi; Mon, 21 Sep 2026 22:48:09 +0200 (CEST)
Received: from EXCH-02.secunet.de (rl2.secunet.de [10.32.0.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 8FAC8201CC;
	Mon, 21 Sep 2026 22:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 8FAC8201CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1790023689;
	bh=xzIMruTV1GCsnaTXFdiWhzzFSfNOwiJ8cb5dvDaIOqM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=rklxGnp2iXfEla5+hYt5Zt+mNK9z6nTrII7qmJ8S5CupnBY1X2jqsY0i1BiBl66XQ
	 SE+B7aQ2DsyJT2BcRMD5VWSZx/7n9bfjGVASMx04oQB7Qg/7mHV8Dy3af8xaGwCbaI
	 T1FmPo2FlKgDcFgr7wiCFcrKi8OQ4XU4ub9zC9SmLs6rIjW6xhajoBL2Iud4L3sg3B
	 IijrT9eYXoh/o8ta4VFnW2fjsjlwisYI4N8MY+r6SpXrgjxi2Yssn5LA617kRFGw4z
	 aO5ki1O3tyTxre2/ju2a1mlJFAcWmUNIWQaeaAXxNgb545gyC+sk0XKKXW0ofUHZrf
	 FDF7kmC54uVOQ==
Received: from moon.secunet.de (172.18.149.1) by EXCH-02.secunet.de
 (10.32.0.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 21 Sep
 2026 22:48:08 +0200
From: Antony Antony <antony.antony@secunet.com>
To: Antony Antony <antony.antony@secunet.com>, Steffen Klassert
	<steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Jamal Hadi Salim
	<hadi@cyberus.ca>, Shuah Khan <shuah@kernel.org>
CC: Sabrina Dubroca <sd@queasysnail.net>, <netdev@vger.kernel.org>, Yan Yan
	<evitayan@google.com>, Tobias Brunner <tobias@strongswan.org>, Florian
 Westphal <fw@strlen.de>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH ipsec v3 3/6] xfrm: fix hw offload state leak on xfrm_do_migrate_state() error path
Date: Mon, 21 Sep 2026 22:48:00 +0200
Message-ID: <migrate-state-fixes-v3-3-836125bb53dd@secunet.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <migrate-state-fixes-v3-0-836125bb53dd@secunet.com>
References: <migrate-state-fixes-v3-0-836125bb53dd@secunet.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16-dev
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EXCH-03.secunet.de (10.32.0.183) To EXCH-02.secunet.de
 (10.32.0.172)

In the error path, the cloned state is dropped without removing its
hardware offload, leaking the offloaded SA entry.

Fixes: a9d155ea9b44 ("xfrm: add XFRM_MSG_MIGRATE_STATE for single SA migration")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Antony Antony <antony.antony@secunet.com>
---
 net/xfrm/xfrm_user.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index 48b8a0af95e2..aac12991d2ca 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -3511,6 +3511,8 @@ static int xfrm_do_migrate_state(struct sk_buff *skb, struct nlmsghdr *nlh,
 	xfrm_state_put(x);
 	return err;
 out_xc:
+	if (m.xuo)
+		xfrm_dev_state_delete(xc);
 	xc->km.state = XFRM_STATE_DEAD;
 	xfrm_state_put(xc);
 	xfrm_state_put(x);

-- 
2.47.3


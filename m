Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA68D371065;
	Tue,  8 Sep 2026 06:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850182; cv=none; b=BUZW6OVkmC5m9+STYsG4pVA9eFJ9913R9LS0OWQlgVruqeBnkznLd8sFHHhdKazkvvi7/wJgtA+MCb7F4tTjli3yg7wr+z8LscI/Nx5vw6n+wpldsS2gRhsl/e6Jt7Br/SuFVe/J8w8lBXPq2GOZ2r+Qe9+lhQkXASgAyr6xsis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850182; c=relaxed/simple;
	bh=p4n8QSY/qYYIzhzZV9PoDwq31sXk+L9M3s1kLZqLrWE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DfONuLFnoikeEYp1PANicSyQUOKoNk5Rcfe1T9lhU/k+pd/Id4b2w8G74EKyTXEbBw9ewtYqVU4jXMBZJpF21mJMnkfMLGsCecEcHyxuMIDyJgH6VXEp820NVmFSMJ1aTZ60GzUuGDpnhG8X12bZtjXSnN+aXEFqSwMNcF/5ta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=OMinIYBb; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="OMinIYBb"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 43CE020719;
	Tue,  8 Sep 2026 08:49:39 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBQ3hv_870Ng; Tue,  8 Sep 2026 08:49:38 +0200 (CEST)
Received: from EXCH-02.secunet.de (rl2.secunet.de [10.32.0.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id B49CF201E2;
	Tue,  8 Sep 2026 08:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com B49CF201E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1788850178;
	bh=xzIMruTV1GCsnaTXFdiWhzzFSfNOwiJ8cb5dvDaIOqM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=OMinIYBbIBl+G3MZbgVFccjkcxfggNBvhqUgcPRgfk7ZHJUEzo0mI3TB+xVjmmcCt
	 6b4mLpczLT96WSxZ4ChS1W5Jq+/vfUpg95wot2pW7Kb+YrlWcSlhfBpPqoEyeoXD/U
	 MdkT+xvmpH13jgsK7SIEja/Z/0OXecQ3EYV5Kp9ny/FWym3B1+eMMhmw8ZTtRl59YS
	 nOItoOxcBoRc/SRDnx7e4YTbsAxyJ1Hz8EVf4t8K01DVRpQVp4y/QuOiRgjYtdd788
	 sIcVHJ7Sz/81rIhMmt6om8pmrq0avGhp8gVsVpf08lQjTA5JWPVaExcHf4aHPjgFF3
	 H9Rjpaj72sfNw==
Received: from moon.secunet.de (172.18.149.1) by EXCH-02.secunet.de
 (10.32.0.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 8 Sep
 2026 08:49:37 +0200
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
Subject: [PATCH ipsec v2 3/6] xfrm: fix hw offload state leak on xfrm_do_migrate_state() error path
Date: Tue, 8 Sep 2026 08:49:28 +0200
Message-ID: <migrate-state-fixes-v2-3-c3e2767f0d96@secunet.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <migrate-state-fixes-v2-0-c3e2767f0d96@secunet.com>
References: <migrate-state-fixes-v2-0-c3e2767f0d96@secunet.com>
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


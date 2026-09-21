Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992EE46EF75;
	Mon, 21 Sep 2026 20:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023687; cv=none; b=UmboGQmdYRMgqQBlHdqx1ssluabkiqtceQnv0jgCPUs9SD0OG6ri7CcRYjZiyPZefxM+uOxTp5rNqxaDDhr/QsGl3Ha7eItUYLpEtp5wYmlbgYx9nWWLgcy3eUorbKGWKLGHrVmuRWgIVTwUFHVnrEd1srkb8lURVDmgccZsTWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023687; c=relaxed/simple;
	bh=tiAYAvR1QYd1IZYryXNKs6hYmPsrTGgr1WQBUbUqZRM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s3RVd/PmFiWNWI50966xuLahPuHGt1dN5reNswMIggZq6HaaX6OB06l3D12RcHDLl/BFd80jTSfhE2rZjlBrzGFuRJ2V7dsUI5QhXN9Yajqv5JSYL1ouSFv1gzQnX4Xos8+vp8d7nXDMWBRMOhTSHaIeO9Dn7v29DSAV88YQNKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=SiPrlWnZ; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="SiPrlWnZ"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 109062067A;
	Mon, 21 Sep 2026 22:48:01 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQUzXPtyjO4m; Mon, 21 Sep 2026 22:48:00 +0200 (CEST)
Received: from EXCH-02.secunet.de (rl2.secunet.de [10.32.0.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 842BB201CC;
	Mon, 21 Sep 2026 22:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 842BB201CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1790023680;
	bh=H3I55tJOyAusyHBnFUqnTqeigM7Fj3ckzMXFybOjMms=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=SiPrlWnZEMmR20i8EOyzsvTyghKa+NPF3nFMrOBLp+zyO37nI7s1T7A9sjY65mLs3
	 YxyRKlu9nAO+K68wkcXguAw/JU7IDUl2CK0br9sjFc8G+PTyPf6QZH63+9yAsbTSnT
	 v227Gs60pswPs06mFq+0Jd5x6bprfTmDkyyx8BLmDlIUeYNBLAduRRoRD/BgJ3W0M/
	 qUeOXZPrkgfHqtXtGtFY25tjhXySKbltCMgZcdHRBa2kYeg+AEplOqItQQYgcEBd2r
	 mF/WgO0sdht0ggpFjF4fM+DIDPBYu2kMGolC0s/6s821o97KDp/mX/J4GMDXZJ6Rta
	 Et7mVFAbplFlw==
Received: from moon.secunet.de (172.18.149.1) by EXCH-02.secunet.de
 (10.32.0.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 21 Sep
 2026 22:47:59 +0200
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
Subject: [PATCH ipsec v3 2/6] xfrm: fix use-after-free of migrated state in xfrm_do_migrate_state()
Date: Mon, 21 Sep 2026 22:47:48 +0200
Message-ID: <migrate-state-fixes-v3-2-836125bb53dd@secunet.com>
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

A concurrent delete can free the migrated state before
xfrm_do_migrate_state() finishes using it.

Fixes: a9d155ea9b44 ("xfrm: add XFRM_MSG_MIGRATE_STATE for single SA migration")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Antony Antony <antony.antony@secunet.com>
---
 net/xfrm/xfrm_user.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index fffce22389e8..48b8a0af95e2 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -3479,6 +3479,7 @@ static int xfrm_do_migrate_state(struct sk_buff *skb, struct nlmsghdr *nlh,
 	__xfrm_state_delete(x);
 	spin_unlock_bh(&x->lock);
 
+	xfrm_state_hold(xc);
 	err = xfrm_state_migrate_install(x, xc, &m, extack);
 	if (err < 0) {
 		/*
@@ -3486,6 +3487,7 @@ static int xfrm_do_migrate_state(struct sk_buff *skb, struct nlmsghdr *nlh,
 		 * free under xfrm_cfg_mutex. Both SAs are gone if it does;
 		 * restoring x would risk SN/IV reuse.
 		 */
+		xfrm_state_put(xc);
 		goto out;
 	}
 
@@ -3504,6 +3506,7 @@ static int xfrm_do_migrate_state(struct sk_buff *skb, struct nlmsghdr *nlh,
 		err = 0;
 	}
 
+	xfrm_state_put(xc);
 out:
 	xfrm_state_put(x);
 	return err;

-- 
2.47.3


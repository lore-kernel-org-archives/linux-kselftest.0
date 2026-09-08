Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313E7385515;
	Tue,  8 Sep 2026 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850199; cv=none; b=KsZkZsyNU9PhSkgCudSPAwtxfPjAvY8u7/fhZKxP8gmMwXHcytb4TQH9l8jWMBlRQMnn4Qyiu3L36TULG/2e7PsnUt6y5uagpva9Mpk1cg9JCtbOZNf62VVvFWkMMTbivg8FRElRTAuvMtPjollprNcSu1pcFc9GiBKHTDLQnYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850199; c=relaxed/simple;
	bh=bL2xSeEm3COfdpoR2nYdTGY71ph1rfY4UtFjwT5Y+MU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ioit/pebBbnhy+WI9bUTZCW1h0ze321bwKv8jQPM3GjyulbbRUtPGkG5ROu8zNwQ2UyuZ5geR+v8YT+QRo9piuC2HlDWblYR2G15cECrhccx4grt+x0fx4G15DNn116WW4buXZcoUjR2c59zcFP8Jy2zTvA9Cf+reSwTvNJVF1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=anzhS1N6; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="anzhS1N6"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id E862820719;
	Tue,  8 Sep 2026 08:49:56 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3zivE58BhlK; Tue,  8 Sep 2026 08:49:56 +0200 (CEST)
Received: from EXCH-02.secunet.de (rl2.secunet.de [10.32.0.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 628E6201E2;
	Tue,  8 Sep 2026 08:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 628E6201E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1788850196;
	bh=/lx7D5OBjkuU/uxyDMVfVVgu2YXn8QOCl9XSmhtbtVE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=anzhS1N6WM4Gll+nPnyMF2MZ1ub4+DfwPwmL027FQbYNG6nuwBhPt/sv0/FzFV7jt
	 e3Iv+GCyx7doD3ay2tphHwhzgshMBCtai77kMb11kekwssBEkFb6YvqVSyEPHaMxPF
	 0bDlseckECrdgVy7YxwIk/inFs4mHZPWpPEAEaJ3WED2UWzSl6SEVSi5/W8EMOpwD8
	 Tu3O3Sr8HiB1EBHO200OVbgqAvfXBG0YJpG2NBid/QpcEj/m/EUOux5d24+PQXPLbp
	 lHzzGWE9rL9cyaM8bsU2tiTqoQ84f+EDSn6yc9SO582dyhcgUwMgHz8chgkOJgX5ye
	 Cd+s1c26aUy2Q==
Received: from moon.secunet.de (172.18.149.1) by EXCH-02.secunet.de
 (10.32.0.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 8 Sep
 2026 08:49:55 +0200
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
	<linux-doc@vger.kernel.org>
Subject: [PATCH ipsec v2 5/6] xfrm: pass extack through to xfrm_init_replay() from xfrm_init_state()
Date: Tue, 8 Sep 2026 08:49:45 +0200
Message-ID: <migrate-state-fixes-v2-5-c3e2767f0d96@secunet.com>
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

xfrm_init_state() takes an extack parameter but doesn't pass it to
xfrm_init_replay(), so replay-window errors can't be reported via
extack.

Fixes: 231a1744dc43 ("xfrm: add extack to xfrm_init_state")
Signed-off-by: Antony Antony <antony.antony@secunet.com>
---
 net/xfrm/xfrm_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 977eb004270a..782ba23a4915 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -3387,7 +3387,7 @@ int xfrm_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 	if (err)
 		return err;
 
-	err = xfrm_init_replay(x, NULL);
+	err = xfrm_init_replay(x, extack);
 	if (err)
 		return err;
 

-- 
2.47.3


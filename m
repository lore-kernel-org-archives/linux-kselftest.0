Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460E8488D82;
	Mon, 21 Sep 2026 20:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023712; cv=none; b=dR3HMcxli5NRua/49wEkEZSX32N9XM8X2vbE3No7G5gkMnikw2rWnhGIgalzTPqfQrZ09M7PoIm7AGZtw1gkjV9TJgCQsVVEXrNlPHgVXTgDGwMAHiZPxvzZAzZGl6SX67Mw6waGu96wKDI+7knR3kM5Kjzx1VR7FvPe+Sl9MP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023712; c=relaxed/simple;
	bh=giMl9qUfGXDIuGnhEdJBcdJesjw3B20FjeHhKHWfQtk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g9fO/Y1XLkIkjo26R+6PZXfTZ0qSyDbTkiY9iFGpOIM2HrUdu73MVnT2Kei/YelmAcuQBzXKUW2S4xOlXTf10S05GnkCoLCHyyqbBZQnlmGkZBpRgcwk2GfpnGXWbqO8j0vEguzkS5D9iAy5uRpS413sScguP3RqUKwVQbg0Pvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=UaCuzzfQ; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="UaCuzzfQ"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 3EFBE2067A;
	Mon, 21 Sep 2026 22:48:28 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YNrcbp4pWim; Mon, 21 Sep 2026 22:48:27 +0200 (CEST)
Received: from EXCH-02.secunet.de (rl2.secunet.de [10.32.0.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id B8C0B201CC;
	Mon, 21 Sep 2026 22:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com B8C0B201CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1790023707;
	bh=zRadyrn9yb99AvpJmf3DF7lC4hF0GAD6dtS3YYiSUME=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=UaCuzzfQfBg+pkQZ0L68UvOnYl2FYbIzH7CSmfkvPedXsS6/wDCYvdfVKvDUNO2uk
	 89TM4PsTDLpoDnaxVvYrdSLONiSIydbAjYcI7IIa+IbSpdUNy9jWovyipTfJAJ+BJ5
	 PYMTtTHsqKgSR2IjINiNw+1+zoEfbVl1rQzyIeUbhWs1U7Ayp+fq5ViX6I/MCoSnjy
	 I3J9QnR36oZ1aLbMk9RyhzE3OgqpkOmvjrwnOubKLuX9WSozwV2MlpVRdfLEFx/Yr2
	 Ss6VFdniMavO+XuAldWV+YxQv//aOSJsIhUCnaHSqDEEZEzoDHwkRwAKfvb+xvk0Bc
	 XOyWWSVhF0pQA==
Received: from moon.secunet.de (172.18.149.1) by EXCH-02.secunet.de
 (10.32.0.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 21 Sep
 2026 22:48:26 +0200
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
Subject: [PATCH ipsec v3 5/6] xfrm: pass extack through to xfrm_init_replay() from xfrm_init_state()
Date: Mon, 21 Sep 2026 22:48:18 +0200
Message-ID: <migrate-state-fixes-v3-5-836125bb53dd@secunet.com>
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
X-ClientProxiedBy: EXCH-01.secunet.de (10.32.0.171) To EXCH-02.secunet.de
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
index d340dc9d7346..5b241dfcae62 100644
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


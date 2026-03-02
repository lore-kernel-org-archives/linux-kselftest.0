Received: from mail.aperture-lab.de (mail.aperture-lab.de [116.203.183.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782A931716F;
	Mon,  2 Mar 2026 05:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.183.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772430054; cv=none; b=ZEcG+oeiyos8MLpsdAelclET5EV8BbUHq9iXo9QzPqZH0XHbhFDCheTsOMp86y6eQgFeiqKumpHlvcbBRhNYQUxMdgWk5Hdrbmps8qeM+Y/D1gE9euSmeKo/AwX/ek+l4Y0saGkPbvgWKa8kFBV/I4fNnUKywZc6Vf1CpNMh1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772430054; c=relaxed/simple;
	bh=kodMDrcMUAnXOCsD2/tzBZ9g/SvMctsVTZ/KtSQRt5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hg/5dFU3pSZ9/4O1E2VOaE2x6UaAHBPvZ4ZNKoc6vyiBCB6Z0Es2ioajvxX4kbBpOc60BjXxKpbaBpp3semxFqsAOAH4ANQfwbEceobfHor0CloIcXg2n8R4m3QCiSO6mWfp8TXAK7y6RMhYrfLZWUtsFVjsuS/J6ZsC6f8Q7LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c0d3.blue; spf=pass smtp.mailfrom=c0d3.blue; arc=none smtp.client-ip=116.203.183.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c0d3.blue
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c0d3.blue
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58E3954CC66;
	Mon,  2 Mar 2026 06:40:50 +0100 (CET)
From: =?UTF-8?q?Linus=20L=C3=BCssing?= <linus.luessing@c0d3.blue>
To: bridge@lists.linux.dev
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xiao Liang <shaw.leon@gmail.com>,
	shuah@kernel.org,
	=?UTF-8?q?Linus=20L=C3=BCssing?= <linus.luessing@c0d3.blue>
Subject: [PATCH net-next v3 07/14] net: bridge: mcast: track active state, own MLD querier disappearance
Date: Mon,  2 Mar 2026 06:40:01 +0100
Message-ID: <20260302054008.21638-8-linus.luessing@c0d3.blue>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260302054008.21638-1-linus.luessing@c0d3.blue>
References: <20260302054008.21638-1-linus.luessing@c0d3.blue>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This change ensures that the new multicast active state variable is
immediately unset if our internal IGMP/MLD querier was elected and
now disabled.

If no IGMP/MLD querier exists on the link then we can't reliably receive
IGMP/MLD reports and in turn can't ensure the completeness of our MDB
anymore either.

No functional change for the fast/data path yet.

Signed-off-by: Linus Lüssing <linus.luessing@c0d3.blue>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/bridge/br_multicast.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index 12be40a1d0a2..6c4b239c70eb 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -4919,6 +4919,7 @@ int br_multicast_set_querier(struct net_bridge_mcast *brmctx, unsigned long val)
 #endif
 
 unlock:
+	br_multicast_update_active(brmctx);
 	spin_unlock_bh(&brmctx->br->multicast_lock);
 
 	return 0;
-- 
2.51.0


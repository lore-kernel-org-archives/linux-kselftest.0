Received: from mail.aperture-lab.de (mail.aperture-lab.de [116.203.183.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBC630E0E9;
	Mon,  2 Mar 2026 05:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.183.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772430053; cv=none; b=Wmnh00+FG1aSE8Hgh7UFMKD0y8GT+vgeBIJWjhsKW2VQ4nE0rxKRitO4U55qKVllcBrz/B/ljZFK0luKS4p4fpyAZEknBrkIam8MR32voprB+d/ejIkyaw++8O5BNi7Pn1+aXpCCaNL2DTCpTCJZ3ZYbmDEGo0LSrB5PCoz1IvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772430053; c=relaxed/simple;
	bh=W/EDjmMTZwcbyG/tfNckxXWY8uyLEPZuNqKpLc5nADQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sUDL5kLMrR2pY6+WJyBL67mcrpFqjkz4B5Lb5X/2NcQQMM/Ad/qwbSRdgWgaA3drALTJl4BiQcx6+UxvoR1QRMyQE3Z9jqpGVwlD1XISHMdnWOXsUoc2sPcc63npx4aiyZXF3IOMKqLEstNQnka5/59pYVDK58I65O75j5lN9ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c0d3.blue; spf=pass smtp.mailfrom=c0d3.blue; arc=none smtp.client-ip=116.203.183.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c0d3.blue
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c0d3.blue
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68E85540FC5;
	Mon,  2 Mar 2026 06:40:47 +0100 (CET)
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
Subject: [PATCH net-next v3 05/14] net: bridge: mcast: track active state, foreign IGMP/MLD querier disappearance
Date: Mon,  2 Mar 2026 06:39:59 +0100
Message-ID: <20260302054008.21638-6-linus.luessing@c0d3.blue>
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

This change ensures that the new multicast active state variable is unset
again after a foreign IGMP/MLD querier has disappeared (default: 255
seconds). If no new, other IGMP/MLD querier took over then we can't
reliably receive IGMP/MLD reports anymore and in turn can't ensure the
completeness of our MDB anymore either.

No functional change for the fast/data path yet.

Signed-off-by: Linus Lüssing <linus.luessing@c0d3.blue>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/bridge/br_multicast.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index 83c1331843f3..b05f00b4d832 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -1824,6 +1824,10 @@ static void br_multicast_querier_expired(struct net_bridge_mcast *brmctx,
 	br_multicast_start_querier(brmctx, query);
 
 out:
+	/* another IGMP/MLD querier disappeared, set multicast state to inactive
+	 * if our own querier is disabled, too
+	 */
+	br_multicast_update_active(brmctx);
 	spin_unlock(&brmctx->br->multicast_lock);
 }
 
-- 
2.51.0


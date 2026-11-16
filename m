Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860937;
	b=rI5xs1DZnyyUAAlRi6fe/Yyt/R8Bm+Z/ccRuuwPQIPDZTxF8j+hLGocJYkQ8UpahJlXD
	 g7ccn7Ss6mmGbnzkg9DdfJ0sZviMzTZjDO8/BaqDp9HcG0cTjekVuflMrAQSaaf/amzd9
	 8o1tC/2nwLJDWf5vjifhmTg9D5k6gljAqcdXyK5HvcYmFTrVTHENFLBXCAhBx1/qqn7bu
	 30o+2QdVRb4UsFMltIcEhZz9wqvmr2p9EksKDqeQfnsN2nhO8acVooAOOOCeJzmurOdBm
	 IRUJ/OZCjNj1KmawAnE8W/ao/1vW9uZu6IrxznZPPhkJKY2UZz+vw9LoU0Eaydj2PdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860937;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2V63xxIdgKQBi65AnPtnz8ppdYY7iry1RAv9yEE7Ysg=;
	b=hLRlWnRWJHB9rx3NdzSdp9ti+P+achYyIcnZm9DLrfHsht6WIQ294iwXlkJJTJwDZwHq
	 tgRGcxja+1fvuP+wG/kmcx83/6UoWL9TNXbNqMcjcjd4vnSVQ38z66+fJkYWItYDWrPFg
	 NtiTMHoU1wWTkmuV8YadyclOC5H9WpywgegvdKFFMT6E+1PA/q+DKO89172awhifANpNC
	 t8pwYlGTghoIhhz9VXqBmVYu9rpnDTFboOXm/OKnHjG6eyEMBvjfKqAJSjK/KXDExmKNc
	 ZJsiD5yLO1MM6q6uYhbWzkoSsktld0CZXf01y75IRFKaWZCQ5IR+p9YbsUiCNGnoyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=I954Dlty;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4176606A881;
	Mon, 16 Nov 2026 20:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4176606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=I954Dlty
Received: by mail.grapheneos.org (Postfix) id C4A0C3C08B8E6;
	Mon, 16 Nov 2026 20:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794860935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2V63xxIdgKQBi65AnPtnz8ppdYY7iry1RAv9yEE7Ysg=;
	b=I954Dlty+YR5ETHBGffpKC14kaY2iqid3/LCg0EV2nVGwSw2QwG+ZGGCrg4tCpfh+MzHRt
	JoyQoStup5UZ+bN6kIjS1woyUxpvje9AonJYqlXoyXTVDQLh3SulBPCoenWDZSWTpKQ7KG
	ezV/fdCtZ3kVHylpKyB5CE2esgXFNAz4R5GUCBlGguey6Sm7Ost8clN7gjMjSaqvo34O5s
	H0ppZs/PKab/mo1cvtTkr44mCFy0WP9tsPP24RaPbYiGzCJo0/fORZc7Ct5JFWMguSBD3+
	oU7b+mXP86h36FQz74c8pmFUAGFfV1G2G6ObaMWOqv0GFLXiEsQtMZHFL4mH2Q==
From: liamsmith827 <liamsmith827@grapheneos.org>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liam Smith <liamsmith827@proton.me>
Subject: [PATCH net-next v5 4/4] ipv4: replace obsolete routing comment
Date: Mon, 16 Nov 2026 20:27:41 +0000
Message-ID: <20261116202741.13106-5-liamsmith827@grapheneos.org>
In-Reply-To: <20261116202741.13106-1-liamsmith827@grapheneos.org>
References: <20261116202741.13106-1-liamsmith827@grapheneos.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liam Smith <liamsmith827@proton.me>

Replace an existing comment which describes obsolete fib_lookup(),
MSG_DONTROUTE and IPv6 behavior.

Signed-off-by: Liam Smith <liamsmith827@proton.me>
---
 net/ipv4/route.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 03db105303b4..fcdcb63ba09e 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2856,24 +2856,18 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
 		if (fl4->flowi4_oif &&
 		    (ipv4_is_multicast(fl4->daddr) ||
 		     (!fl4->flowi4_l3mdev && err == -ESRCH))) {
-			/* Apparently, routing tables are wrong. Assume,
-			 * that the destination is on link.
+			/* When oif is specified, fib_lookup() is called
+			 * primarily to determine if the destination is
+			 * accessible directly or through a gateway. It also
+			 * checks whether there are any traffic restrictions
+			 * (blackhole, prohibit, unreachable), or if there's a
+			 * routing lookup miss.
 			 *
-			 * WHY? DW.
-			 * Because we are allowed to send to iface
-			 * even if it has NO routes and NO assigned
-			 * addresses. When oif is specified, routing
-			 * tables are looked up with only one purpose:
-			 * to catch if destination is gatewayed, rather than
-			 * direct. Moreover, if MSG_DONTROUTE is set,
-			 * we send packet, ignoring both routing tables
-			 * and ifaddr state. --ANK
-			 *
-			 *
-			 * We could make it even if oif is unknown,
-			 * likely IPv6, but we do not.
+			 * Multicast is sent regardless of restriction or miss.
+			 * Non-vrf unicast honors restrictions but allows
+			 * oif-bound sends even when oif has no routes. In both
+			 * cases the destination is assumed on-link.
 			 */
-
 			if (fl4->saddr == 0)
 				fl4->saddr = inet_select_addr(dev_out, 0,
 							      RT_SCOPE_LINK);
-- 
2.47.3


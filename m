Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291394;
	b=i5adAEo+63mgrdYhSj5FDfSw6IxCNovVrCah6FA+heY2LZs3youHAOw65C9djJKtHcOW
	 9MZUn0GbatwGl7vj4ZfLwG6/qWvXqNufNO61n+tzIO1nXrs8p2X/oryHlDI8i6V+UbJoa
	 +UmfS+fqP9qIjOpem9JpWl7blSLxvQ/LsgkSV+1hHK/kmeGcbwJYOXe8+j51AQMnSOcw2
	 mv5HBZk3fVk0WxIjYUKeMb/bkRgvCh5TFoPO/9i0FRQ7PYoFvFkGyYCVlhcjaJi7hueDD
	 JFM+HPmV0JQoNN8jMy+iABrHTGkVYY3jYnI58djFCFXFixGysUIY0Enz/06OOiml8lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291394;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Oeu07vqVy2JLN+Yu711g2KyCvjKmF5UCb4tBTlLQyw=;
	b=h4TSxxpZKr8XNNk2Aq18fEjsuBLSW7h1fk/jphKJndojr2GV9iLiEZHl06PHMjiXMz7N
	 gHXI6pXFx9gaiHtk/kgWB5LPCz+kvZHkJ0gWvfOBnevQGwrys3xfTfF2MlvFlzVq3wBar
	 hQ8LDDfuE6zSNTv63sjpgsgI/TkJJ1N/w1CoSaOH/jjYjGFJFWVAdCSWjfR0yR0S92jOD
	 Dz7Cc7VJjJaJqMZwAQ52GLbqfjHeJQO5UCPkY0Ao+tGTN5DsEZqHjNQKtJlXx9hgT++cp
	 V0bQ1f7EZ6tuztyHmjmetQQrutG3gbqLpqbR/NNwTeaB/dBfMUMjRESUeZBYsLPFZOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=a21v7RIa;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D98A60A263F;
	Tue, 10 Nov 2026 06:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D98A60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=a21v7RIa
Received: by mail.grapheneos.org (Postfix) id B46133C08EF3F;
	Tue, 10 Nov 2026 06:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794291393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Oeu07vqVy2JLN+Yu711g2KyCvjKmF5UCb4tBTlLQyw=;
	b=a21v7RIaoRJ0an++QN+Mm2oPu1OuK8aOcRDpjtunN1nnZnbZ0WIwSebGbXD5pH8IXetJ7G
	REQVFjdxVMkE0ThIUw8lZexUxw87uNmaOLDJ+VFYwpRkhVC+OYPdgl2o18y7TtS02KVT8o
	50W9By3neDRFcj9uyM6vmCqBREbWgjvqlHfoC8if2VYgXTrxjoAcsSKbE9IkGw4LHXhoaJ
	Sht4x5g6wUGnh9J8Y+MX7uXoq188Oc5lK60urREWFg/bS7llRp0lioYmenPATppnX6kTmq
	2jrPLpR6dwJ5hDIN1hBcR30QjdvqSV+jUPW22ISc57JWw7hXvKraANE7EzA96g==
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
	liamsmith827 <liamsmith827@proton.me>
Subject: [PATCH net v2 4/4] ipv4: replace obsolete routing comment
Date: Tue, 10 Nov 2026 06:15:36 +0000
Message-ID: <20261110061536.10811-5-liamsmith827@grapheneos.org>
In-Reply-To: <20261110061536.10811-1-liamsmith827@grapheneos.org>
References: <20261110061536.10811-1-liamsmith827@grapheneos.org>
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

From: liamsmith827 <liamsmith827@proton.me>

Replace an existing comment which describes obsolete fib_lookup(),
MSG_DONTROUTE and IPv6 behavior.

Signed-off-by: liamsmith827 <liamsmith827@proton.me>
---
 net/ipv4/route.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 80a2c8a3c571..ac94d8262b6e 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2858,24 +2858,19 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
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
+			 * This fallback path is always taken for multicast,
+			 * regardless of any restrictions or misses. Non-vrf
+			 * unicast does honor restrictions, but falls back if
+			 * there's a miss. The destination is assumed on-link
+			 * for both.
 			 */
-
 			if (fl4->saddr == 0)
 				fl4->saddr = inet_select_addr(dev_out, 0,
 							      RT_SCOPE_LINK);
-- 
2.47.3


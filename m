Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528019;
	b=Klrwd7jQBAI//q7ShwROjNJb7fNjVgbhIsWzO6+ziamJsqWVTglFYeMPKLjPX/ZMwhYr
	 2T2NSlvKF7chdaxdAKsDwE0mWYWo7/lHXjCNHYX4yfNg3mClBllkzbOFye1AHLG5io558
	 J8U9lKYIKdYZXe/gGjEmX4wBY5lSzxsQyARL9QAHA5bTKY1FA/mvONHlaS76jEVXFI5LB
	 jdEVuw1S/fELMl5sWDccNCUAYIIsmEeK7Ox8XNZbBWhq2Xb0L0I1HuaGE2V8QQ2FgIIRp
	 EKpVcQghLJhGxkZRPl872zxHohUO6d8KnaELI/WMSN0gwS3of9nFOw7tcB+rxoFrh9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528019;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T4830KXgSeuV+6c6bzEl09PBaOCpCcRTIhoHRz8MES8=;
	b=fBq/CMwr2Xoch9KlntS6W3J1kQKO+IzpaU7QKio24JrkoqMQ60Qm6aVDcXvsb0izqPwa
	 t5vTEbNawnIyQ5hWTztCykFp5UvGgjpmVMG21F0cv2N5NtbonAqK67eSeYlepfIJ9tulY
	 xHq1LraG97B6+NBEl+m3JhXsGt0rDexoQYIfyLfzKp2RI50nI+UB+gMYEiDnsGIy6iTc5
	 wZi3WUAOMZnNQkbqCcotan4VM/Blg0mDncg0nwwQkyuYWZbuvd3Z+v61f66fl+hLW6GEI
	 DVE3EagaKqb7HlAB9tX9e6Ga+Nlov1dExgbVkSumVPCVGFMvdFtGHG7fIV+rjBdg2tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=U2EFw6QX;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E640C606A893;
	Fri, 13 Nov 2026 00:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E640C606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=U2EFw6QX
Received: by mail.grapheneos.org (Postfix) id 98BBE3C01F111;
	Fri, 13 Nov 2026 00:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794528018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4830KXgSeuV+6c6bzEl09PBaOCpCcRTIhoHRz8MES8=;
	b=U2EFw6QXwKbD8YhfdpDeqKPQFRV1YP4k1FAw108LmZeETI9q5AFdEh2dZOcInhVCl41h8D
	e7JdNr3kx8zVAgVHo3rH4qQP06FvzFWdHh8T+41Mo14tz4h+MFLpsA6fs7yVFOwTDcm2RY
	B2p595uA9vUe7SwEzG/Hy3ekpO4SIeZ13eIRfq67gUM3vFcLAoBv0fPnLsivW3I6j0wA4G
	u6X8/1LvpN6E0J7W6PFOaqKVkzvEgDFJWCPsZIbsNd6wt+8cUcxyddIn1wwzj36mUTVtWb
	NFHjsvOP8XPX2/L8iNXlO1Q2kPgcJuVSLPGa9poSLQyPNaA/lO0kEuOXll9piw==
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
Subject: [PATCH net-next v3 4/4] ipv4: replace obsolete routing comment
Date: Thu, 12 Nov 2026 23:59:32 +0000
Message-ID: <20261112235932.23836-5-liamsmith827@grapheneos.org>
In-Reply-To: <20261112235932.23836-1-liamsmith827@grapheneos.org>
References: <20261112235932.23836-1-liamsmith827@grapheneos.org>
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
 net/ipv4/route.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 03db105303b4..d862b5ecad71 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2856,24 +2856,19 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
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


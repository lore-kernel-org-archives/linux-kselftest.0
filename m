Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779845;
	b=laNAPd8BFmgPeJpj1ZPkYYmhg0shsM+/g5oSaZ6YDeMABw6oVOFgRRE6HGQ91ASldmAW
	 Lwr07Cn9pbCCbdWGGaO8wI1vkUpLi2eiYphZt7l2xoXBiO+TwGnVTM9AigIAKorwtC8F2
	 /k8cclWviA+8ziqlZN5MN7kjYaeeyyjScxZbbUNdJX2v592A74bnb3+xqpbQV5GhhzPEe
	 SQAv/ZsYdHbb8lzwbVDn8Q+KrOZxY+BPjXzBWvECZVOhnsUQ5EVTN7m+WlRN1UAK334wH
	 SL+AYNOQHzKtEuwwU2ual9hk1hU8TXjEIz9haP47XWod9S90FccGBwxz03eplCByx0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779845;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2V63xxIdgKQBi65AnPtnz8ppdYY7iry1RAv9yEE7Ysg=;
	b=sGbr8mSCQ44jN+rOjH1l9bjYFzR5wrlaMoH7VF+3NEEjYc1nYrdazLQSeYXlB/C7EgFa
	 bdJtSXNLaCCypnNM7t/FBHDTb3YSa8O3FasHpkvqQagefS2AD5yQQEBZ2pwskh2wtqM6O
	 dGz+ORkedQgZGXdAtz9dzk+Xv/E2YYL8kqJcz8GcxzWDgw+4k3ev6L0TBeGUoJ/9vO8W/
	 gZyJKpLknYLhWSJT/hTSQR0zzTbQvmyVkEeuhxx93GJMGiRnvsa4oYARGVtOmztlIuqXj
	 auEp0wdpIEAViCQWbCBWfuQvFvyTV80r1RLlMckYw1bC2HfKN+at3CscSAMMZPozWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=Tly4ZNCx;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BFD606A333;
	Sun, 15 Nov 2026 21:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20BFD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=Tly4ZNCx
Received: by mail.grapheneos.org (Postfix) id C40F63C08EEAB;
	Sun, 15 Nov 2026 21:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794779844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2V63xxIdgKQBi65AnPtnz8ppdYY7iry1RAv9yEE7Ysg=;
	b=Tly4ZNCxDpM8U4qEEKXazjyxuZHNhwZsn0zeTQ/ZOAdfBBEXTSLLo6gsFkUN7KB2DTrPs6
	xB//7Y5VXDIYCIR2ykXLE316hQpNUsxw31QBRL8Pf/4VY/eSpJjJh3lu0NiRHI5+GFIM1s
	6Rr/B8lRoIjA0K6ynOg/nW1iR48kCZo5VxLbJrkKnAQNhLLwkpPU4FZzVDBGypNKQ18NGG
	cspZMW2qn/L6x18DVIcHtDOPYc4ujJ/gXO3+Cf5ybuczANpVd7F4tpOyDZ6ol4GnwobDqA
	dIoh7gYJ8llNwQdt14uwePoZi5TAEXSSrBInhp7B7YnPiqLhDTJW7uymbgtrHg==
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
Subject: [PATCH net-next v4 4/4] ipv4: replace obsolete routing comment
Date: Sun, 15 Nov 2026 21:56:40 +0000
Message-ID: <20261115215640.18728-5-liamsmith827@grapheneos.org>
In-Reply-To: <20261115215640.18728-1-liamsmith827@grapheneos.org>
References: <20261115215640.18728-1-liamsmith827@grapheneos.org>
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


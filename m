Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8336448B9C;
	Mon, 19 Oct 2026 03:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.220.120.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380296; cv=none; b=YnlHL0oBJqWpifkIcRBUY4Rie8XblG3ex9rbyyM80Z20ZECuVBG2JItVFJKVbBz7zPB3PZps61DxQtFimb6CPtBRrGw/m7d/hmTMhCkVFfLpJ6OfQ++S2Vsk2kz25uubeR4gUr1BWPRXXlJ5sveLeZw/dJAjwpaidcO5c/f7/xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380296; c=relaxed/simple;
	bh=gI1LN4wISfgn1bAeKrEfaBUInAcb+RJiih7YAFIgmUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtrR3yZtee1Yzc/vJ3K8UKXxSU9HCMpVn1xL/DPd/P/F4nXMNTFCpW4AVVdDyjdyP809ZDIQsN+UFezB4GkFSW/bRlnsTyzjYHDrYA0tJupULR3TOTapeWP9DpjLiBgx9MwdpjJ/+W+fZvfQBrNsKeljhfIT+APpKYJAEgBpq/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org; spf=pass smtp.mailfrom=grapheneos.org; dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.b=f2LUXp0i; arc=none smtp.client-ip=206.220.120.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.b="f2LUXp0i"
Received: by mail.grapheneos.org (Postfix) id 153E93C08EF32;
	Mon, 19 Oct 2026 03:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1792380294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yb+hSU++eWbZBiajsga+iTEJtZpjGxUH7iWaTVKai9U=;
	b=f2LUXp0iiwiechCGPSNklPBiCHAjkDAJPBBjO2ouPdArx36/3yPR1QL9L5uPWlQQ14Jtaq
	DBp/+F9LUWS5Hp0dtGgVdeFivheQ+jMozY/AlSrKx3gKK91yh7uNrqRyqwSUTpind8yvG5
	2bNWxnqa8OMb4yBe6nE25Ngek/GUBhCmYPlULJ+YSk/wEv658tSQ7VNIgrez3irs9dwA6E
	MOlR2Tfl4Yk20W+Wad9tn0Ux0wTGS8o613pT/3c0dUCQUJPkXhAAfcug2jvhsPGvx+6DK8
	Ru5PFJIIztQXoithEASWuI9WsksLZ8KphmcaBbiair2sZlL+vywDkOs+FCNlKQ==
From: liamsmith827 <liamsmith827@grapheneos.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liamsmith827 <liamsmith827@proton.me>
Subject: [RFC net-next 1/2] ipv4: Honor prohibit when oif specified
Date: Mon, 19 Oct 2026 03:24:05 +0000
Message-ID: <20261019032406.88874-2-liamsmith827@grapheneos.org>
In-Reply-To: <20261019032406.88874-1-liamsmith827@grapheneos.org>
References: <20261019032406.88874-1-liamsmith827@grapheneos.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: liamsmith827 <liamsmith827@proton.me>

When flowi4_oif is set (SO_BINDTODEVICE, IP_PKTINFO, IP_UNICAST_IF,
etc), prohibit rules and routes cause fib_lookup() to return -EACCES,
but still allow the packet (and any necessary ARP) to be transmitted.
This is documented as the expected behavior in the tests, but is
confusing for route and rule maintainers. Specifically, Android uses
prohibit rules as the basis for its VPN "kill switch", with the
expectation that any packet encountering such a rule will not be allowed
out. Due to this interface binding exemption, apps can trivially bypass
the kill switch. This is most serious on cellular networks, where a
connection to an arbitrary IPv4 address can be established without
requiring ARP resolution.

Preserve -EACCES from fib_lookup() instead of constructing an on-link
route when an output interface is specified. This honors prohibit rules
and routes while retaining the existing fallback for other lookup
errors.

Signed-off-by: liamsmith827 <liamsmith827@proton.me>
---
 net/ipv4/route.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 595a3b7f1783..616c20299334 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2853,7 +2853,7 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
 	if (err) {
 		res->fi = NULL;
 		res->table = NULL;
-		if (fl4->flowi4_oif &&
+		if (fl4->flowi4_oif && err != -EACCES &&
 		    (ipv4_is_multicast(fl4->daddr) || !fl4->flowi4_l3mdev)) {
 			/* Apparently, routing tables are wrong. Assume,
 			 * that the destination is on link.
@@ -2864,13 +2864,14 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
 			 * addresses. When oif is specified, routing
 			 * tables are looked up with only one purpose:
 			 * to catch if destination is gatewayed, rather than
-			 * direct. Moreover, if MSG_DONTROUTE is set,
-			 * we send packet, ignoring both routing tables
-			 * and ifaddr state. --ANK
-			 *
+			 * direct.
 			 *
 			 * We could make it even if oif is unknown,
 			 * likely IPv6, but we do not.
+			 *
+			 * Additionally, when oif is specified, routing lookup
+			 * allows us to check if destination is prohibited
+			 * (-EACCES). LS.
 			 */
 
 			if (fl4->saddr == 0)
-- 
2.47.3


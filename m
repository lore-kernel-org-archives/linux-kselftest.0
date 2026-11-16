Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860912;
	b=FWjKwAEeph0l4qLIVIC0QEE+JWh01XXcQKqz/BpdPxdL2aGwgdVP/e5PfX/d/N2wqjGG
	 fgQob5iPsaAOl2nVrbb7Yxp6DNYpsqO1wiUEnOxr4TpXLyKlEyJkkYpA2M1zV1mQCTbgr
	 CDnmhivFNd+xTBZqn/FO982t3CXTmnooobbikFDnj0iTvAoDY/pAaakrVsqtxnSRUTZqr
	 LLjfrkys2Jo9XITdP3KSKUZmUB/e6VfRoVO4IFxCpNDoNdYkYfW+Wn6oyWQBZNVNDPW76
	 OBMCSq34BVZpjUNkFX2RDtLO2reFNkmMTsScxetgmHe5nebrwyc2YoXMjoqm3dcku3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860912;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BOTklJYt8KH7rFlZVdBoknjaS+NDwDtd3MuPB3oLLOc=;
	b=icjjxFX2BkG9ah4hqI3Y2DZgweNGxZzEnckiMTD9bHeuRHn0DX2Ok28hNchFYy7Hwwge
	 e/VaBxwOV0HTqyZ3VY8GD9gxZrEu7xrm39lBoTaj8tZSKvM8zspjeo02i2BY5HsG4SdYl
	 10TSjh8j9VJw0dTewURE8dkC9hS2pfe1ErMsgrqFuM9kC1eYT1CtVI8IyRiUCTMsc+mhK
	 9y3GhZvAox97PpP6QIoNY+iXoyn/uTf+iXZmeVYgHnSDkwBe3Pkd8mMsnZ/YTekgzLMjS
	 aCO7UMX3i7+Lf6YMVnnpDKJldyHt7N458jJP9PK0cwICWSDxu3dKzHPKqTAwlP0rhnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=XjXy0V+h;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE35606A330;
	Mon, 16 Nov 2026 20:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE35606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=XjXy0V+h
Received: by mail.grapheneos.org (Postfix) id 9B6E83C08B8D7;
	Mon, 16 Nov 2026 20:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794860911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BOTklJYt8KH7rFlZVdBoknjaS+NDwDtd3MuPB3oLLOc=;
	b=XjXy0V+h6/3WZs7+k68wYcGaeGHOuY+JSAtp6hEdVPlJbjZYStp2V3FHlmwNXIsyIlamg9
	oZ28fSaclDA0ClSzKBaOWUMNYY2TzZqhWQ+pV7zYZYwdaE4vgOGRpsU6wDEzsRu8Znbnz7
	kfRXjtm7JG/UEZu0KVexS3p8v0UVxEej3958K6z1p2Dr51i3bVuUTSeYIwfguYvLoCLfCz
	NSWVjW6CJCPColH2VmJejuz362kG7QQmYOIcWQBSLlQnIU736f1PQhjDJwQdtU8TaiiiEq
	Dy//KlwoawOMIu32NMZAgw6mUzYRxc3DTmCsH+2ytnijar+ybcdyshXyJ+ZMKg==
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
Subject: [PATCH net-next v5 2/4] ipv4: restrict on-link fallback to lookup misses
Date: Mon, 16 Nov 2026 20:27:39 +0000
Message-ID: <20261116202741.13106-3-liamsmith827@grapheneos.org>
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

For non-vrf unicast, the on-link fallback currently occurs regardless of
the particular error returned by fib_lookup(). As a result, routes and
rules that are supposed to restrict traffic (blackhole, prohibit,
unreachable) are unable to do so comprehensively.

A specific example of this being a problem is within Android, where the
VPN "kill switch" is implemented with prohibit rules. Any process that
can set flowi4_oif (SO_BINDTODEVICE, IP_UNICAST_IF, IP_PKTINFO, etc.) is
able to utilize this fallback, meaning unprivileged Android apps can
trivially bypass the VPN. This is particularly bad on cellular networks,
where ARP is often not needed.

Restrict the fallback to routing lookup misses.

This was originally observed on an Android device, by way of packet
capture.

Tested fcnal-test.sh in UML with CONFIG_IP_MULTIPLE_TABLES both enabled
and disabled.

Signed-off-by: Liam Smith <liamsmith827@proton.me>
---
 net/ipv4/route.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 595a3b7f1783..03db105303b4 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2849,12 +2849,13 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
 		goto make_route;
 	}
 
-	err = fib_lookup(net, fl4, res, 0);
+	err = fib_lookup(net, fl4, res, FIB_LOOKUP_REPORT_MISS);
 	if (err) {
 		res->fi = NULL;
 		res->table = NULL;
 		if (fl4->flowi4_oif &&
-		    (ipv4_is_multicast(fl4->daddr) || !fl4->flowi4_l3mdev)) {
+		    (ipv4_is_multicast(fl4->daddr) ||
+		     (!fl4->flowi4_l3mdev && err == -ESRCH))) {
 			/* Apparently, routing tables are wrong. Assume,
 			 * that the destination is on link.
 			 *
@@ -2879,6 +2880,8 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
 			res->type = RTN_UNICAST;
 			goto make_route;
 		}
+		/* Reverse the mapping induced by FIB_LOOKUP_REPORT_MISS. */
+		err = err == -ESRCH ? -ENETUNREACH : err;
 		rth = ERR_PTR(err);
 		goto out;
 	}
-- 
2.47.3


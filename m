Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528003;
	b=Xx+CsGRMeeX3CfpBsQFP3QpZg4nCJc11eevmzCAa8fM8YpN9oxjHhcvk7xd6tkHBcgDf
	 lzVGNPmn2f+HN6qcYJW5kkIgDBIUvGxs8jp8a6AWR6sOvvn/9A6aD8ICG2fQ5EagIrR3K
	 Jtk4HdqHbomYyCMdZ+KoSjEmx9H5jJfEucRtm0RtGYZJpZoGHcrlS91ejfX4aIHciRjd5
	 mmclDJ3U0n0HlOCHDTSkDNKhNpSC7TqjZIo+Jo0ppgFnvklPn4Y+6f7RzUA0UBJlhcJg4
	 mh8X8lmwsv8PxDmGgSnsnyy2CAXAdCxbr2S9LW10oxyV3lgmc0kKMPVPeldbwoVptPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528003;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BOTklJYt8KH7rFlZVdBoknjaS+NDwDtd3MuPB3oLLOc=;
	b=jPyYa3FGNrZ/E0R3s9JZu2BKzZqdDHYM9R87vvawXNGHLEKhMrmZJDJB5IC+FhmuxOaV
	 YHKG/q5D2pJWckp/Bz6Eb2WTxL4ap2hfO1PU6UiY4eTc2kidpUIdRFh6zY5ibI/Dmh3dH
	 qSt5vnh62U7J2Y++uOABfQmI3C0eBNBMEWOtpvqOZD5GgT499LXEU/DI7uwM4FCXK1ccx
	 /nfOWFZWBjzq4E1i2mGSyjGvXmD1XKATSH64c7VNsiS1DPe31BFUWRXEa2UHo7+HdPaEY
	 fOgYbiYnJ6u863OyQUCKgdGhempyzCsB+QWY9RDj4UZkWn3/SlQqRNvheMcywc+b8aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=c+9fpAX5;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E84606A33D;
	Fri, 13 Nov 2026 00:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E84606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=c+9fpAX5
Received: by mail.grapheneos.org (Postfix) id 551C03C08EEA4;
	Thu, 12 Nov 2026 23:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794528001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BOTklJYt8KH7rFlZVdBoknjaS+NDwDtd3MuPB3oLLOc=;
	b=c+9fpAX5gW+5t+H3ZktJL3Xgdt4urTLlOnpN75Mn+17fKIb3/Oy7eTXq7ZPX0vt4pgL0hL
	H4Mgxs/fMY/3z1c4CiD4E0aValV8k72XXREkNLZurzPp0LXkl9vB4f399z2cbQ+g6UwNWd
	6Hplqe7qWVa/pECcQQnAGp5As/PMwXuWpI/m2PZPnfSIwSz4dEPRwPCu6gwtuh4IgebKpV
	HFAHbk+Komm3Oz5Df3aw/N4jwe+IcOGPW+qoc5BWMkZtSkGf2WMTGP+6Mlvc+a5uPtqw2S
	CE1aC+ktdXYSzvz3Q15jx2dpmMz9AMw320OWyBIF3jJ/4e5N5vDm1vUFxtllPg==
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
Subject: [PATCH net-next v3 2/4] ipv4: restrict on-link fallback to lookup misses
Date: Thu, 12 Nov 2026 23:59:30 +0000
Message-ID: <20261112235932.23836-3-liamsmith827@grapheneos.org>
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


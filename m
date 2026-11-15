Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779830;
	b=o0jA2xWjHg8b/Nht9/0ePwFFx6uC/T6AnO9jEHikL1DypBo4Cq5a0ap6FlBivf0UfWmz
	 d+7jmSyhY206/6UrY4IlOyKl9xpDugQS8MnU7sauhkVDWPAlX/Bjt7dk3JKqspckc8t1z
	 7T1S4ejzQzh1PxDAZp+/79VrDZkNi2tvP1FAJFv+pEXMIvXxStJrB6gRssPT/yQswN8wM
	 HwvaqzAhAK4rkAbhuHjK0AmzocXjoFdUMtTH/9PBog4V64L/69Gd/d1q6JOzRmNXpX2jL
	 fxtMc9y6beF8fXXe97tz2F8VXJfl/v2+hjL6ZODdhZDvjv2m0RV0FYFTduUgYC9ge1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779830;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BOTklJYt8KH7rFlZVdBoknjaS+NDwDtd3MuPB3oLLOc=;
	b=GMNp33rwNYf7lD5JV11mTec2CMI6XiJV4NE54TXubmnN1KmOjT4a/NI91zBBjuJZ1+MS
	 EEzsoXV2eFR3o87tPilEn3HK0PWS4vjBXGyQcco65yWdVIthlhklFV5F/kOf84UTMgop4
	 LqtaIEozKdub0XeK2+Qoi3fxsmfuy3sVGVDrg+fEqQfqJc5Wd7+omRb9gqiMwO2eWSx/3
	 danbz8g4fBk0DI/dUYsxvp97Yfonp/eZ1d/NcJR7S+UKcQVqQ27pMVbkkO4HKg0W4QCpU
	 HmmXtP34qUM53X9oEwLnRkUDNFCXMSipASYJ1BgqWs5ai9YpBVVviBLZkafrNRis7oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=jQ2E8dSO;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFC6606A33B;
	Sun, 15 Nov 2026 21:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEFC6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=jQ2E8dSO
Received: by mail.grapheneos.org (Postfix) id 7E8833C08EE9B;
	Sun, 15 Nov 2026 21:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794779829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BOTklJYt8KH7rFlZVdBoknjaS+NDwDtd3MuPB3oLLOc=;
	b=jQ2E8dSOyEyvR+KXoZTG4ntK4GTZQQAxYDEkpAwh7oT6p6eMp2Y4bdeWU9ijsMerd6WaDX
	jdveaR6VY7MjGCJL0s4w8AHhHvfm6QMSHMQ276LG47Z12QfrYkvjCfkSQui/pWFGZqeJHT
	GAV2f3HtdH3qbpWT/IYF6usUHq250tD2eaEWKuzzkQR29KJ6PQyi76f96sVzdw+ygMHEgq
	rdOA7/GO/SklNRMnJlLxyDFfuyHjOOwkoWj2GRXRNt9dMl1kaKOasX7j3ldjdrtm+mzewS
	R3Gefcm4EbTy6cXklkXovPp2/mE2v4muHG8AKLmZgnMSBW3oHR46NiRf3dY/Wg==
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
Subject: [PATCH net-next v4 2/4] ipv4: restrict on-link fallback to lookup misses
Date: Sun, 15 Nov 2026 21:56:38 +0000
Message-ID: <20261115215640.18728-3-liamsmith827@grapheneos.org>
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


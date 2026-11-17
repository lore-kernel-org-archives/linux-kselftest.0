Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.86.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943918;
	b=kyTDbF/ApxLHZFCnIW3111Q2SqZg3Hf8LkM5IpC3xDrynELF49tgd5cDk+DErIvcz/y9
	 mqhZYi9tze4BQe/Ig6osrhewFzUDPZu5ifVUJ2ny7gOeYkxJ8vG/sPGJu03ZKtsDaUsrh
	 jVorkMDfxHmEGfxpi5riq7oqXHF9cv3yrZIzNMBJ8YS/DmCZjl3SE9iN/W3u3eZGn1r0J
	 UlClT6Ep8cItHEc8Lh3GzLkXWGmdh7AXifII/A9HHfkZCBlvtgtLI958P0aL7GbJ6bYH/
	 Mz2q6jSlKNwdRLjRrrSlO1QDBF2CEp3NdYYJHYqwVz/0fcvOJM4pR4GV3MokOZ18z6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943918;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Info-Out:X-JNJ;
	bh=rN1wAzsDyTyHsKYikFRi8F7g30XHEisXiAU6gXl3u08=;
	b=fHP+Bqj+KMFX8h5lcJsj6H3ut+wlexzDFLC0D5xUXGp2kfoXE4xIBuUFZkK0nEOeYFUE
	 Gth2rQZM7c9WjIU3fMpgoKAodU78SiAaAw24SZNd+Flu/p+PRdYH2p+NN4DGLzcpOYBG1
	 wPqXUxgGYy3Q5NYKfGWbTOio/8wMFhOFKGN7EBZFE13oXSUQbzMtqwJ4mv30Yku1wXxMg
	 5VFGcpJGTEcJcIVt+ZZpvzEM66LFgvrIjUAAfJAfa08g1usCADy8g6DRcOC8JuUauWEY7
	 R4S2evHT+xcLEr+jsDplju+viCTYTAEd3quTvnRLtUfOPSSQJSYOxsJzojkM1l4G4/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b="H/aCc+E5";
	arc=none smtp.remote-ip=57.103.86.181
Received: from outbound.qs.icloud.com (qs-2005e-snip4-11.eps.apple.com [57.103.86.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B2B606A33B
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B2B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=H/aCc+E5
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPS id 2BF283000171;
	Tue, 17 Nov 2026 19:31:53 +0000 (UTC)
X-ICL-RepId: 01a1eafe-8c80-7955-8955-4795a3a64edd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794943916; x=1826479916; bh=rN1wAzsDyTyHsKYikFRi8F7g30XHEisXiAU6gXl3u08=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=H/aCc+E5impAEyXCBfDtV0/tlNHnmC/HkRwSqOYfmscXsbstE0292HQlNePX49M3ztnLBPFJ2kh37xmADrdREUsrHWXiASdOTVjrSa0k8oWWMnqASlZXadUdonxeqAubKbtcfotcSUbMtYcAR75B678c7wqVmty+JxyfBoPtmysPJsxQO29eYuu0ucJL0PzC0AMtgr+OTv5yLTeah8fquqQFXXAbXC5xzBdfs+bKkZpWOO+Pa1eCY3H3lamd5jtMPf+NryRhjzwTNPqcYlpFAj553Gk00G9iVhENRrf6gczziBOZt0fei+gzVMBQ72nVsSUTX0hfh2czytZuIusrZA==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPSA id 5E32730006C7;
	Tue, 17 Nov 2026 19:31:50 +0000 (UTC)
From: Vladimir Vdovin <deliran@verdict.gg>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Vladimir Vdovin <deliran@verdict.gg>
Subject: [PATCH net-next v4 1/3] ipv4: Check a Fragmentation Needed against each path of a multipath route
Date: Tue, 17 Nov 2026 22:31:39 +0300
Message-ID: <20261117193141.27004-2-deliran@verdict.gg>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117193141.27004-1-deliran@verdict.gg>
References: <20261117193141.27004-1-deliran@verdict.gg>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NyBTYWx0ZWRfXxHkkGdvFWXOQ
 AAcKtJ7uNYB+a2aAtPF4Br8M6/5H6T+7UKY4TEB5Gz88D9F22lzpFG9QOepATAMkJp9UYr5laNx
 iyKmaLlRYmKINch+f1doRMVLOM/6id8=
X-Proofpoint-GUID: Tdyp_REldT85hbKg71cBBtghor5BqhrM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NyBTYWx0ZWRfXxJfSMHPLOoFQ
 fx7wrbf+QfIcuPgb7i9OXqpFW2AX8S1YNMi+89luBg+9rF2FxMIolyMJDh5L8ZyMmP1MQqsxhSO
 1FGgmO1+fUy5UqPDPMpmlzaHvgXCmk1WKVIRAqaBcoOe/Oj7VeDWeZZL8yrAg4s4n11V47CDlC1
 yQavSjBGDvTCtJeQl7MIkvDWfJpwNb5r+8kps8QARbt9tQ2gUh1D8kgaP4rh/++ImaRBBMdJN1D
 dgefsc12I8UabC2xvkKo2MY3tNh9SmOUekYwQM0M1gfuKZybnDAIcgNzjvokhmU1peOMy/WrI+x
 87gBlj7GKqDVwaH28vgm/IIcOhlzByhtM+wojdAyRZikdWWOo8VaVKlBmWdESw=
X-Proofpoint-ORIG-GUID: Tdyp_REldT85hbKg71cBBtghor5BqhrM
X-Authority-Info-Out: v=2.4 cv=EJOTQFZC c=1 sm=1 tr=0 ts=6afcabaa
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HxOO8S7qDNDRVQTpMkN7:22 a=0OSefl1wAvM1iDVUJ7Ah:22 a=HdksMtlPh3Tn2dY-6eIA:9
X-JNJ: AAAAAAAB8rPvDcUX3ZLgcgHjcRpMweUBNVctQMVy1436jeJP9wuxUj8ZAuh1W0UfQ6YMYX
 9ftrn9uwmhqZzzmWRxUFrRXk1estSRfFOevvDjruUfA3pAqEOEv0KUv4i+0X4Y7hxMe403
 2rDB0HfzlPcyAtBaOhUnl0NJ0JFr+cada7vYj67ocuD8zsqZy9R3s+owGLM+/cghwKYJLj
 b45Mwup/7VWDcovUxVkC3ceQODYdazdI/keo50Dtb1OYBe9H5Fl+OKnINl9upkymGW5Qc5
 8x7/6L28NfmTg3+jitOAPijz8M3UAFHUBByCpdTXrBNn2k7ggetClU014BdFSNeHdLIi8J
 fnhJJdPI6lKeDk7VEfdqJwWseJOAP4hDxfmCu/a4h1yXcUNyECicA6VFQ+kbSkuLxlT+rv
 vpv3Q3wHqM6a6zQTdkMs4mkaqsfmJ7ENpSDSIWWTPNQDiojqHbTALxS4VFcYe/pe6nAPL7
 +axvXn3eCNGcJOEESKKjdNn26fbhel2ZK/ZnfUhF2/0qxTj3t08MkVQnnOnpekpclj4jKh
 DvwZNLb33Yp0Em2gGBWSK4/ywGPJ2QPV0JTCAZyIYz2qGGjl38GY7n7wiSUTLHm3o7z1VH
 PH+B9sOy/boOoc2QDr61irP16PqyGFmN2PZ+O6y7bej9Eg5cLZN650cjozm/LBf9Y23V9I
 cOjSMgDEuuxrR9rOZ1a+cUTB8vyfEn/Ed/YbuVeAdsNHtnvc2WQkltWmyJwH9F6MKTB9gT
 XiYUaqpFsNM+bYCT0MKKFJdfPENl72a9zqC8k4ESXJyYHEpEOTHn7BMjKNQcd5ELzLq0dm
 xznyW5WLO6rvftmaoH7EPQmWdAEpZ5OcOuqv5lG9Cta3ou4=

Since commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths
if multipath enabled") the mtu of a Fragmentation Needed is cached on
every path of a multipath route, as the lookup for it may land on
another path than the one the flow is on. But the mtu is still checked
against that one path only, by the early returns on the looked-up dst:

- a path whose mtu or pmtu is lower gets a pmtu above what it can
  carry, its flows blackhole until the exception expires
- a mtu locked for being below ip_rt_min_pmtu is written as is, over a
  lower device mtu or locked pmtu
- a looked-up path narrower than the mtu, or already at it, ends the
  update before the path of the flow has learned anything

Check the mtu against each path instead, what it uses now as ipv4_mtu()
reports it: cache the mtu only where it is lower, cap a locked mtu to
it, leave a locked pmtu alone. The checks on the dst stay for the other
callers, sockets and tunnels, whose dst is the path of their flow. A
Fragmentation Needed that changes nothing costs the ICMP callers a fib
lookup and a look at the exception of each path.

Fixes: 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths if multipath enabled")
Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 net/ipv4/route.c | 90 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 63 insertions(+), 27 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d0a5f6d77094..b90eed715fb5 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -150,6 +150,8 @@ static struct neighbour *ipv4_dst_neigh_lookup(const struct dst_entry *dst,
 					       struct sk_buff *skb,
 					       const void *daddr);
 static void ipv4_confirm_neigh(const struct dst_entry *dst, const void *daddr);
+static struct fib_nh_exception *find_exception(struct fib_nh_common *nhc,
+					       __be32 daddr);
 
 static struct dst_ops ipv4_dst_ops = {
 	.family =		AF_INET,
@@ -1046,54 +1048,87 @@ out:	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
-static void __ip_rt_update_pmtu(struct rtable *rt, struct flowi4 *fl4, u32 mtu)
+/* The pmtu to cache on a path for the mtu of a Fragmentation Needed, 0 to
+ * leave the path alone: what it uses now, as ipv4_mtu() reports it, is not
+ * above the mtu, or its pmtu is locked. An exception about to expire is
+ * refreshed, a locked mtu is capped at what the path uses.
+ */
+static u32 fib_nhc_pmtu(struct fib_nh_common *nhc, const struct fib_info *fi,
+			__be32 daddr, u32 mtu, bool lock)
+{
+	struct fib_nh_exception *fnhe = find_exception(nhc, daddr);
+	struct net *net = dev_net(nhc->nhc_dev);
+	u32 path_mtu = 0;
+
+	if (fnhe && fnhe->fnhe_genid == fnhe_genid(net) &&
+	    time_before(jiffies, fnhe->fnhe_expires)) {
+		if (fnhe->fnhe_mtu_locked)
+			return 0;
+		if (!lock && fnhe->fnhe_pmtu == mtu &&
+		    time_before(jiffies, fnhe->fnhe_expires -
+					 net->ipv4.ip_rt_mtu_expires / 2))
+			return 0;
+		path_mtu = fnhe->fnhe_pmtu;
+	}
+	if (!path_mtu)
+		path_mtu = fi->fib_mtu;
+	if (!path_mtu)
+		path_mtu = READ_ONCE(nhc->nhc_dev->mtu);
+	path_mtu = min(path_mtu, IP_MAX_MTU);
+
+	if (lock)
+		return min(mtu, path_mtu);
+	return mtu > path_mtu ? 0 : mtu;
+}
+
+static void __ip_rt_update_pmtu(struct rtable *rt, struct flowi4 *fl4, u32 mtu,
+				bool from_lookup)
 {
 	struct dst_entry *dst = &rt->dst;
 	struct fib_result res;
 	bool lock = false;
 	struct net *net;
-	u32 old_mtu;
 
-	if (ip_mtu_locked(dst))
+	if (dst_metric_locked(dst, RTAX_MTU))
 		return;
 
-	old_mtu = ipv4_mtu(dst);
-	if (old_mtu < mtu)
+	/* A dst looked up for the Fragmentation Needed, without the ports
+	 * the packet was hashed on, may be another path of a multipath
+	 * route than the flow is on: don't judge the mtu by it, each path
+	 * does that below.
+	 */
+	if (!from_lookup && (rt->rt_mtu_locked || ipv4_mtu(dst) < mtu))
 		return;
 
 	rcu_read_lock();
 	net = dst_dev_net_rcu(dst);
 	if (mtu < net->ipv4.ip_rt_min_pmtu) {
 		lock = true;
-		mtu = min(old_mtu, net->ipv4.ip_rt_min_pmtu);
+		mtu = net->ipv4.ip_rt_min_pmtu;
 	}
 
-	if (rt->rt_pmtu == mtu && !lock &&
+	if (!from_lookup && rt->rt_pmtu == mtu && !lock &&
 	    time_before(jiffies, READ_ONCE(dst->expires) -
 				 net->ipv4.ip_rt_mtu_expires / 2))
 		goto out;
 
 	if (fib_lookup(net, fl4, &res, 0) == 0) {
 		struct fib_nh_common *nhc;
+		unsigned long expires;
+		u32 pmtu;
+		int nhsel;
 
 		fib_select_path(net, &res, fl4, NULL);
-#ifdef CONFIG_IP_ROUTE_MULTIPATH
-		if (fib_info_num_path(res.fi) > 1) {
-			int nhsel;
-
-			for (nhsel = 0; nhsel < fib_info_num_path(res.fi); nhsel++) {
-				nhc = fib_info_nhc(res.fi, nhsel);
-				if (!nhc)
-					break;
-				update_or_create_fnhe(nhc, fl4->daddr, 0, mtu, lock,
-						      jiffies + net->ipv4.ip_rt_mtu_expires);
-			}
-			goto out;
+		expires = jiffies + net->ipv4.ip_rt_mtu_expires;
+		for (nhsel = 0; nhsel < fib_info_num_path(res.fi); nhsel++) {
+			nhc = fib_info_nhc(res.fi, nhsel);
+			if (!nhc)
+				break;
+			pmtu = fib_nhc_pmtu(nhc, res.fi, fl4->daddr, mtu, lock);
+			if (pmtu)
+				update_or_create_fnhe(nhc, fl4->daddr, 0, pmtu,
+						      lock, expires);
 		}
-#endif /* CONFIG_IP_ROUTE_MULTIPATH */
-		nhc = FIB_RES_NHC(res);
-		update_or_create_fnhe(nhc, fl4->daddr, 0, mtu, lock,
-				      jiffies + net->ipv4.ip_rt_mtu_expires);
 	}
 out:
 	rcu_read_unlock();
@@ -1112,7 +1147,7 @@ static void ip_rt_update_pmtu(struct dst_entry *dst, struct sock *sk,
 	if (skb && netif_is_any_bridge_port(skb->dev))
 		fl4.flowi4_oif = 0;
 
-	__ip_rt_update_pmtu(rt, &fl4, mtu);
+	__ip_rt_update_pmtu(rt, &fl4, mtu, false);
 }
 
 void ipv4_update_pmtu(struct sk_buff *skb, struct net *net, u32 mtu,
@@ -1127,7 +1162,7 @@ void ipv4_update_pmtu(struct sk_buff *skb, struct net *net, u32 mtu,
 			 0);
 	rt = __ip_route_output_key(net, &fl4);
 	if (!IS_ERR(rt)) {
-		__ip_rt_update_pmtu(rt, &fl4, mtu);
+		__ip_rt_update_pmtu(rt, &fl4, mtu, true);
 		ip_rt_put(rt);
 	}
 }
@@ -1146,7 +1181,7 @@ static void __ipv4_sk_update_pmtu(struct sk_buff *skb, struct sock *sk, u32 mtu)
 
 	rt = __ip_route_output_key(sock_net(sk), &fl4);
 	if (!IS_ERR(rt)) {
-		__ip_rt_update_pmtu(rt, &fl4, mtu);
+		__ip_rt_update_pmtu(rt, &fl4, mtu, true);
 		ip_rt_put(rt);
 	}
 }
@@ -1183,7 +1218,8 @@ void ipv4_sk_update_pmtu(struct sk_buff *skb, struct sock *sk, u32 mtu)
 		new = true;
 	}
 
-	__ip_rt_update_pmtu(dst_rtable(xfrm_dst_path(&rt->dst)), &fl4, mtu);
+	__ip_rt_update_pmtu(dst_rtable(xfrm_dst_path(&rt->dst)), &fl4, mtu,
+			    new);
 
 	if (!dst_check(&rt->dst, 0)) {
 		if (new)
-- 
2.56.0


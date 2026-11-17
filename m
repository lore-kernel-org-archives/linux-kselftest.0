Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.86.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943919;
	b=XVE6ZlFGUKBs1L0s5yItf5vkW5RzMo9tk7uc9HGiqt8IfS4eJ+ZRdSnEQvivVVxsYd3g
	 AGQ2xZOWfjJxz4PL9ePwg/HImM6OqIxDb9g+v6ukKNWVuQLes9NV8+ukTGW3SuycEy9Il
	 UsCyg/sPh+IsZybZR9TeOxm6tAXnP79UUQyf8uJW9U8ZuTi/wkVs81dAH2np4+dpZ7kJ6
	 3Iahf07B6JODjJsIrEaLAkg9qYn59lb6y18zNYSKvcKrdyDnzpL3oMqV4mTu3UDehfg3v
	 1EpU/3Z7YA471Q02IG5FpJrLZkAF0liX0zkiJPTeCYtaQBXO45rB6aWtcDNEdw0qL2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943919;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=S568VBiZawAF43lVx5UIOI9lVrbFH9i2Y+l6M8aUoaY=;
	b=Ca6ILo0psjOG69phsQfQBODhqI9kz8o5oywaCjKgjS9snzMeQnqvjYJGGTg6iNy4IX95
	 eMJkojQ1aGyQFCee+pz0Y7JcsC92kPuVUIuFF8/JLaVRLWXge2V0p7ehMAdopO98W9wRt
	 hG/331dEqnDszmCcv0hSWVAW0HcO9/Wj2d00KRarXR3B/uomVTvmRtpO4uu/pW2Q1j1G4
	 AhA5iqjMZs63sYnV/UnGtorLzdWkwcRI0cRX/JnP0d0/CfZuw5GLW2ezr5GMb9S7Woww7
	 f6UBSUtghSCKbx2zBoV9Vge2mE+E/BxRy5QqPsC/EqqBLTiAnDAKFXweXcEOc69BrCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=verdict.gg;
	spf=pass smtp.mailfrom=verdict.gg;
	dkim=pass header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=UbajGJBd;
	arc=none smtp.remote-ip=57.103.86.145
Received: from outbound.qs.icloud.com (qs-2005b-snip4-4.eps.apple.com [57.103.86.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02C3606A33E
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F02C3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=verdict.gg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=verdict.gg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=verdict.gg header.i=@verdict.gg header.a=rsa-sha256 header.s=sig1 header.b=UbajGJBd
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPS id 2879F30006CE;
	Tue, 17 Nov 2026 19:31:54 +0000 (UTC)
X-ICL-RepId: 01a1eafe-9449-7edd-b63a-b9f3b4a926bd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verdict.gg; s=sig1; t=1794943918; x=1826479918; bh=S568VBiZawAF43lVx5UIOI9lVrbFH9i2Y+l6M8aUoaY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=UbajGJBdAMQkX0RebuPU3iXZVtLOctW3j+VsV5kq0iHMVv9QDkeEpcKaxpYXbwIXYrSuJbCi5d7hg4wSH5wgo4vAzYNrQhZWzPowg6fIPugp3FuEZWb3xENUWw1Ii6z72eVMVy1MYLeRod8X7+GTrR76iVaSzde0zH/8s724KnhBIOgSHo3svI3XD7emjJlned8leUzkBR2b8dLQuPIazuiKwd1OZC3kg7oIW6AOrkW4vASVnShIEMQskMIMqj9MqNJI5v7cPAA2U+xRIwvBQR2kDZjXwYOpoR+njD0Gbx6wa1bNI6vOe/l5wEGwkw33wkLiDZLlGfZLvrUCLUNcTQ==
mail-alias-created-date: 1621344842221
Received: from DelNac.mail.msk (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-10-percent-2 (Postfix) with ESMTPSA id 8FDB33000176;
	Tue, 17 Nov 2026 19:31:52 +0000 (UTC)
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
Subject: [PATCH net-next v4 2/3] ipv6: Cache pmtu for all paths of a multipath route
Date: Tue, 17 Nov 2026 22:31:40 +0300
Message-ID: <20261117193141.27004-3-deliran@verdict.gg>
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
X-Authority-Info-Out: v=2.4 cv=eZUwvrEH c=1 sm=1 tr=0 ts=6afcabac
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=WYnk3XYbMWVZ0JM96JUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NyBTYWx0ZWRfXwTBuelg4BqKT
 BBGRkebnwTH3bsgIXWdzbWnsaM1MWVH4GMI8eglKUur6wa0TrnWm4YS6LDvtX02DElr8bOldKPG
 +HAMgxWDZPIk8l/9QRBw2dCVTCNZ8yW01nUNGcc5JEpV+Uy2ZEXPBb1WmgKQW6JMMemNusHHkPU
 330r3506Q2yAV8J2JKgpxFQKZ814NqcUz3La/xMYadHmULgs3cTMpE5qwbdEx8eMiI7vqrnge8t
 j8uO/NXUZKN291tlixvV0Nb4+3+3srUEO5wZ29dFhIJaYZWwUMMalKLqAtDjS7AzEap61qSWhRM
 X2bn7LMqxHEjR2inwfExHNR6k156dP//0hbtBB9DPELkdJb6mpPk6MRk6y3jFI=
X-Proofpoint-GUID: Pw4CkM6oSJ-qbY0tltBjUKersR4fxsWk
X-Proofpoint-ORIG-GUID: Pw4CkM6oSJ-qbY0tltBjUKersR4fxsWk
X-JNJ: AAAAAAAB/v2JPUaDiWdlGmVDBbn4Wqnw/PyJ31oU5og2aLEUE4PpMysBeEpmMTAxpWZ/bH
 KNLJnqjBRY5uAZ69gmfevE6zoLaNIUYv8ITXU68Ej9rYqkwypjmxDgqhofQZX28O5pmleL
 maGWJLRevl9ZZITgMoMPO9nCkR5Lnpml/VkesbHYsu/+RY+RrGMi/2gqPkn3cBLeDw1dZi
 ZP0tMtwH+O2qTUWERWAkZ2GsgjuWx2RLa4vw4kS6NOZXkiMlQfIVTOB6MIkCqYzI/PcQa6
 RocLiAuZ+J4AQJitmu0UYS7cy25FKCs8CLs9DgF6OqtIXXsdtax/B3ZIQgvMAsnMy9re0+
 oK/LeaGT2Nv2gNfmbpfsfJEjjgsD/5vDz0/H5Y25XgePKpv/XjswiKM3oDLDTlezA2i6ZG
 954FlIkWDynoiwu9xXa7L6DbYhHQ/LJZ6HUt1ob0yVM/jIsyCMPSdgcvasJSENjVDqRK0B
 FHbFShUbJqcDOQhPwlJcQJQ0rXKG8I0+yT34BHTVA4ZA9G+Rbh9LxVlH39MwTwV1Cr3q0v
 /PmrQT2FkrXEIRHk/OWYv6mYTvQKNYJXIdd4zIuwdlSMwKKP+rXPoVluNmiXvV4/2RLbzh
 +BmLY05J3jAN8BUbxkMH1ojd9b8VOOCEROrX7c3c5Jrbw+c9rynDLvLqxIWifjN9uL2zW9
 Ws5Ev6BxqtwQMuYAOobL0QYDe5hADvV+oYntCvoPZDgw/i81dEoH+F/eoUtuGyPXok19Ky
 kwwnNUVG6il4GuycnIo58DuRPSdy0VaxBFLDO+HckAxBN8+l7HzQXLMsAjHi5jc+NKoZ2y
 KLoLcbJNroETUb02RIMdg/x+4BtOPJHdV7Eowjg=

Same problem and same fix as for IPv4 in commit 7d3f3b4367f3 ("net:
ipv4: Cache pmtu for all packet paths if multipath enabled"): the
exception for a Packet Too Big may land on another path of a multipath
route than the one the flow is on, and the flow keeps blackholing. Cache
the pmtu on every path of the route instead.

For IPv6 that means:

- ip6_update_pmtu() looks the destination up by the interface the
  Packet Too Big came in on, or by a hash without the protocol and
  ports for an unbound socket, neither has to be the path of the flow.

- the paths are the fib6_nh of a nexthop object, or the siblings of the
  fib6_info the dst came from. Only ip6_update_pmtu() walks them, the
  dst of sockets and tunnels is the path of their flow.

- a path only lowers what it uses, the pmtu of its exception, updated
  in place to keep a gateway from a redirect, else the mtu of the route
  and the device. The looked-up dst isn't checked anymore, it may be
  narrower than the Packet Too Big while the path of the flow isn't.

- siblings not in the tree and a nexthop replaced by a blackhole are
  skipped.

A Packet Too Big now costs up to one exception per path, as a
Fragmentation Needed does for IPv4 since the commit above.

Link: https://lore.kernel.org/netdev/ad29493c-9e48-4a94-b327-e47af3a9d137@kernel.org/
Signed-off-by: Vladimir Vdovin <deliran@verdict.gg>
---
 net/ipv6/route.c | 138 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 103 insertions(+), 35 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 04098cf32eab..a835abc698d2 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2911,12 +2911,55 @@ static bool rt6_cache_allowed_for_pmtu(const struct rt6_info *rt)
 		(rt->rt6i_flags & RTF_PCPU || rcu_access_pointer(rt->from));
 }
 
+struct rt6_pmtu_arg {
+	struct fib6_result	res;
+	const struct in6_addr	*daddr;
+	const struct in6_addr	*saddr;
+	u32			mtu;
+};
+
+/* Cache a pmtu on one path of a route, never raising what the path
+ * uses for daddr. An existing exception is updated in place, a new
+ * one would lose a gateway learned from a redirect.
+ */
+static int rt6_nh_update_pmtu(struct fib6_nh *nh, void *_arg)
+{
+	struct rt6_pmtu_arg *arg = _arg;
+	struct fib6_result *res = &arg->res;
+	struct rt6_info *rt;
+
+	res->nh = nh;
+	rt = rt6_find_cached_rt(res, arg->daddr, arg->saddr);
+	if (rt) {
+		if (arg->mtu < dst6_mtu(&rt->dst)) {
+			rt6_do_update_pmtu(rt, arg->mtu);
+			fib6_nh_update_exception(nh, res->f6i->fib6_src.plen,
+						 rt);
+		}
+		return 0;
+	}
+
+	if (arg->mtu >= fib6_mtu(res))
+		return 0;
+
+	rt = ip6_rt_cache_alloc(res, arg->daddr, arg->saddr);
+	if (rt) {
+		rt6_do_update_pmtu(rt, arg->mtu);
+		if (rt6_insert_exception(rt, res))
+			dst_release_immediate(&rt->dst);
+	}
+
+	return 0;
+}
+
 static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 				 const struct ipv6hdr *iph, u32 mtu,
-				 bool confirm_neigh)
+				 bool confirm_neigh, bool from_lookup)
 {
-	const struct in6_addr *daddr, *saddr;
+	struct rt6_pmtu_arg arg = { .mtu = mtu };
 	struct rt6_info *rt6 = dst_rt6_info(dst);
+	const struct in6_addr *daddr, *saddr;
+	struct fib6_info *f6i, *sibling;
 
 	/* Note: do *NOT* check dst_metric_locked(dst, RTAX_MTU)
 	 * IPv6 pmtu discovery isn't optional, so 'mtu lock' cannot disable it.
@@ -2939,55 +2982,80 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 
 	if (mtu < IPV6_MIN_MTU)
 		return;
-	if (mtu >= dst6_mtu(dst))
-		return;
 
-	if (!rt6_cache_allowed_for_pmtu(rt6)) {
+	if (mtu >= dst6_mtu(dst)) {
+		/* A dst ip6_update_pmtu() looked up for the Packet Too Big
+		 * may be another path of a multipath route than the flow is
+		 * on: don't judge the mtu by it, each path does that below.
+		 */
+		if (!from_lookup)
+			return;
+	} else if (!rt6_cache_allowed_for_pmtu(rt6)) {
 		rt6_do_update_pmtu(rt6, mtu);
 		/* update rt6_ex->stamp for cache */
 		if (rt6->rt6i_flags & RTF_CACHE)
 			rt6_update_exception_stamp_rt(rt6);
-	} else if (daddr) {
-		struct fib6_result res = {};
-		struct rt6_info *nrt6;
+		if (!from_lookup)
+			return;
+	}
+	if (!daddr)
+		return;
 
-		rcu_read_lock();
-		res.f6i = rcu_dereference(rt6->from);
-		if (!res.f6i)
-			goto out_unlock;
+	rcu_read_lock();
+	f6i = rcu_dereference(rt6->from);
+	/* A route on its way out of the tree takes no exceptions */
+	if (!f6i || !rcu_access_pointer(f6i->fib6_node))
+		goto out;
 
-		res.fib6_flags = res.f6i->fib6_flags;
-		res.fib6_type = res.f6i->fib6_type;
+	arg.daddr = daddr;
+	arg.saddr = saddr;
+	arg.res.f6i = f6i;
+	arg.res.fib6_flags = f6i->fib6_flags;
+	arg.res.fib6_type = f6i->fib6_type;
 
-		if (res.f6i->nh) {
-			struct fib6_nh_match_arg arg = {
+	if (f6i->nh) {
+		if (!from_lookup) {
+			struct fib6_nh_match_arg match = {
 				.dev = dst_dev_rcu(dst),
 				.gw = &rt6->rt6i_gateway,
 			};
 
-			nexthop_for_each_fib6_nh(res.f6i->nh,
-						 fib6_nh_find_match, &arg);
-
+			nexthop_for_each_fib6_nh(f6i->nh, fib6_nh_find_match,
+						 &match);
 			/* fib6_info uses a nexthop that does not have fib6_nh
 			 * using the dst->dev + gw. Should be impossible.
 			 */
-			if (!arg.match)
-				goto out_unlock;
-
-			res.nh = arg.match;
-		} else {
-			res.nh = res.f6i->fib6_nh;
+			if (match.match)
+				rt6_nh_update_pmtu(match.match, &arg);
+		} else if (!nexthop_is_blackhole(f6i->nh)) {
+			/* A blackhole nexthop, swapped in by a replace since
+			 * the lookup, must not get a usable exception.
+			 */
+			nexthop_for_each_fib6_nh(f6i->nh, rt6_nh_update_pmtu,
+						 &arg);
 		}
+		goto out;
+	}
 
-		nrt6 = ip6_rt_cache_alloc(&res, daddr, saddr);
-		if (nrt6) {
-			rt6_do_update_pmtu(nrt6, mtu);
-			if (rt6_insert_exception(nrt6, &res))
-				dst_release_immediate(&nrt6->dst);
-		}
-out_unlock:
-		rcu_read_unlock();
+	rt6_nh_update_pmtu(f6i->fib6_nh, &arg);
+	if (!from_lookup)
+		goto out;
+
+	/* Stop when f6i leaves the sibling list, the walk would never end.
+	 * Skip a sibling not in the tree, being added or removed.
+	 */
+	list_for_each_entry_rcu(sibling, &f6i->fib6_siblings, fib6_siblings) {
+		if (!READ_ONCE(f6i->fib6_nsiblings))
+			break;
+		if (!rcu_access_pointer(sibling->fib6_node))
+			continue;
+		arg.res.f6i = sibling;
+		arg.res.fib6_flags = sibling->fib6_flags;
+		arg.res.fib6_type = sibling->fib6_type;
+		rt6_nh_update_pmtu(sibling->fib6_nh, &arg);
 	}
+out:
+	rcu_read_unlock();
 }
 
 static void ip6_rt_update_pmtu(struct dst_entry *dst, struct sock *sk,
@@ -2995,7 +3063,7 @@ static void ip6_rt_update_pmtu(struct dst_entry *dst, struct sock *sk,
 			       bool confirm_neigh)
 {
 	__ip6_rt_update_pmtu(dst, sk, skb ? ipv6_hdr(skb) : NULL, mtu,
-			     confirm_neigh);
+			     confirm_neigh, false);
 }
 
 void ip6_update_pmtu(struct sk_buff *skb, struct net *net, __be32 mtu,
@@ -3014,7 +3082,7 @@ void ip6_update_pmtu(struct sk_buff *skb, struct net *net, __be32 mtu,
 
 	dst = ip6_route_output(net, NULL, &fl6);
 	if (!dst->error)
-		__ip6_rt_update_pmtu(dst, NULL, iph, ntohl(mtu), true);
+		__ip6_rt_update_pmtu(dst, NULL, iph, ntohl(mtu), true, true);
 	dst_release(dst);
 }
 EXPORT_SYMBOL_GPL(ip6_update_pmtu);
-- 
2.56.0


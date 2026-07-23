Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE2E4334B8;
	Thu, 23 Jul 2026 12:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809448; cv=none; b=nMGNsUhVAEKtSupifiSBa+ARKv4j3QStGyCT6paBvkPKiUleeyivU9hcWC89hEdqyxV1A3Ac8Zpl43qh7MAvtZTHm62kenqjDNfJINo8J4WZGSZ0wMXU1Y1AG1cd1CrDJwTlcsqEB3zO7xNJgkT4ktjy9HKnK7BPFSTyT30v9uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809448; c=relaxed/simple;
	bh=CAJFWANobY+5xRbOQn29r/YmP6M6e9qZpvFhPlsuPI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hA27GCa5aIbXpTgaB6PQGVFgX0t2FvbFrsuD4ppLVN20l7YBmIY/eyqNqZmbsxSTF0E9LL6/yxIvik1+bQ4oshiXLXUeFLm/itEojneCSJ+moleSmU/eJL9E+H0/Pv04PaiJWBWzTrdmItVGkrrtI6bXsqxuHrZPJz8oA/cSLzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from [2001:67c:370:1998:30cb:b625:4f9:61b4] (helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsT3-00000003Wpj-1n31;
	Thu, 23 Jul 2026 14:24:01 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsRV-00000000Q2C-004o;
	Thu, 23 Jul 2026 14:22:25 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>
Cc: Ido Schimmel <idosch@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Lorenzo Colitti <lorenzo@google.com>,
	=?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	David 'equinox' Lamparter <equinox@diac24.net>,
	Jen Linkova <furry13@gmail.com>
Subject: [PATCH net-next v2 07/10] net/ipv6: support RFC6724 rule 5.5 via subtrees
Date: Thu, 23 Jul 2026 14:19:33 +0200
Message-ID: <20260723122106.99772-8-equinox@diac24.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723122106.99772-1-equinox@diac24.net>
References: <20260723122106.99772-1-equinox@diac24.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RFC6724 says:
   Rule 5.5: Prefer addresses in a prefix advertised by the next-hop.
   If SA or SA's prefix is assigned by the selected next-hop that will
   be used to send to D and SB or SB's prefix is assigned by a different
   next-hop, then prefer SA.  Similarly, if SB or SB's prefix is
   assigned by the next-hop that will be used to send to D and SA or
   SA's prefix is assigned by a different next-hop, then prefer SB.

As it turns out, this behavior is immensely useful in handling
renumbering, multihoming, and source address liveliness checks.

That said, just implementing this as an one-shot in source address
selection is not particularly useful if output routing then meanders
between multiple nexthops.  To actually make this work (and work well),
installing source-specific routes for prefixes seen in PIOs is a good
way to go.

To actually select a source address, there's still the route lookup with
an empty source as before, which will select some particular nexthop.
Now, for the various candidate source addresses, this does another
lookup and checks if we got the same nexthop, and prefers those source
addresses - rule 5.5 behavior.

Signed-off-by: David 'equinox' Lamparter <equinox@diac24.net>
Cc: Lorenzo Colitti <lorenzo@google.com>
Cc: Maciej Żenczykowski <maze@google.com>
Cc: Jen Linkova <furry13@gmail.com>
---
 net/ipv6/addrconf.c | 113 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 0ba46ed518a9..fcf5a7d0c37d 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -1522,6 +1522,7 @@ enum {
 	IPV6_SADDR_RULE_HOA,
 #endif
 	IPV6_SADDR_RULE_OIF,
+	IPV6_SADDR_RULE_PIO_BY_NEXTHOP,
 	IPV6_SADDR_RULE_LABEL,
 	IPV6_SADDR_RULE_PRIVACY,
 	IPV6_SADDR_RULE_ORCHID,
@@ -1542,13 +1543,14 @@ struct ipv6_saddr_score {
 };
 
 struct ipv6_saddr_dst {
-	const struct flowi6 *fl6;
+	struct flowi6 *fl6;
 	const struct dst_entry *dst;
 	const struct sock *sk;
 	int ifindex;
 	int scope;
 	int label;
 	unsigned int prefs;
+	struct net *net;
 };
 
 static inline int ipv6_saddr_preferred(int type)
@@ -1593,6 +1595,92 @@ static bool ipv6_allow_optimistic_dad(const struct net *net,
 #endif
 }
 
+/* "source address is preferable if the chosen nexthop advertised it as a PIO"
+ * => consider 'advertised as a PIO' to be 'the routes for the source's subtree
+ *    include one with the same nexthop'
+ *
+ * NB: there is no backtracking in the subtree here, this is intentional -
+ * each prefix seen (and accepted) in PIOs creates essentially a "zone" which
+ * is our search scope.
+ */
+static int ipv6_saddr_rule5p5(struct ipv6_saddr_score *score,
+			      struct ipv6_saddr_dst *saddr_dst)
+{
+	const struct rt6_info *rt, *cmp_rt;
+	struct dst_entry *cmp_dst;
+	struct fib6_info *f6i;
+	struct flowi6 fl6;
+	int ret = 0;
+
+	rt = container_of(saddr_dst->dst, struct rt6_info, dst);
+
+	/* fl6->saddr is ::, cf. check at the top of ipv6_fl_get_saddr()
+	 * unfortunately, ip6_route_output can update iif/oif - not making a
+	 * local copy would be rather fragile (considering future changes too)
+	 */
+	fl6 = *saddr_dst->fl6;
+	fl6.saddr = score->ifa->addr;
+	cmp_dst = ip6_route_output(saddr_dst->net, saddr_dst->sk, &fl6);
+
+	if (cmp_dst->error)
+		goto out_release_dst;
+
+	cmp_rt = container_of(cmp_dst, struct rt6_info, dst);
+
+	/* this must work if _any_ nexthop matches; the non-subtree best may
+	 * not be in same order as subtree best
+	 */
+	for (f6i = rcu_dereference(cmp_rt->from); f6i;
+	     f6i = rcu_dereference(f6i->fib6_next)) {
+		struct fib6_nh *f6n;
+		struct fib6_info *sibling;
+
+		/* non-subtree route: says nothing about router advertising this source */
+		if (f6i->fib6_src.plen == 0)
+			continue;
+
+		if (unlikely(f6i->nh)) {
+			/* kernel refuses subtree routes with nexthop objects,
+			 * this should be impossible to hit
+			 */
+			WARN_ONCE(1, "IPv6 dst-src route with nexthop object");
+			continue;
+		}
+
+		f6n = f6i->fib6_nh;
+		if (f6n->nh_common.nhc_dev != saddr_dst->dst->dev ||
+		    f6n->nh_common.nhc_gw_family != AF_INET6)
+			continue;
+
+		if (ipv6_addr_equal(&f6n->nh_common.nhc_gw.ipv6,
+				    &rt->rt6i_gateway)) {
+			ret = 1;
+			goto out_release_dst;
+		}
+
+		if (!f6i->fib6_nsiblings)
+			continue;
+
+		list_for_each_entry_rcu(sibling, &f6i->fib6_siblings, fib6_siblings) {
+			f6n = sibling->fib6_nh;
+
+			if (f6n->nh_common.nhc_dev != saddr_dst->dst->dev ||
+			    f6n->nh_common.nhc_gw_family != AF_INET6)
+				continue;
+
+			if (ipv6_addr_equal(&f6n->nh_common.nhc_gw.ipv6,
+					    &rt->rt6i_gateway)) {
+				ret = 1;
+				goto out_release_dst;
+			}
+		}
+	}
+
+out_release_dst:
+	dst_release(cmp_dst);
+	return ret;
+}
+
 static int ipv6_get_saddr_eval(struct net *net,
 			       struct ipv6_saddr_score *score,
 			       struct ipv6_saddr_dst *dst,
@@ -1677,6 +1765,24 @@ static int ipv6_get_saddr_eval(struct net *net,
 		ret = (!dst->ifindex ||
 		       dst->ifindex == score->ifa->idev->dev->ifindex);
 		break;
+	case IPV6_SADDR_RULE_PIO_BY_NEXTHOP:
+		/* Rule 5.5: Prefer sources advertised by chosen next-hop */
+
+		/* Without subtrees, the source address will make no difference
+		 * in the ip6_route_output call in rule5p5.  Therefore the rule
+		 * 5.5 check becomes useless.  This wouldn't result in any
+		 * errors, but ip6_route_output isn't free, so if subtrees are
+		 * disabled save some cycles by skipping this entirely.
+		 *
+		 * This is done through subtrees_enabled to have the code
+		 * compiled regardless.
+		 */
+		if (fib6_routes_require_src(net) && dst->dst &&
+		    !dst->dst->error)
+			ret = ipv6_saddr_rule5p5(score, dst);
+		else
+			ret = 1;
+		break;
 	case IPV6_SADDR_RULE_LABEL:
 		/* Rule 6: Prefer matching label */
 		ret = ipv6_addr_label(net,
@@ -1835,7 +1941,12 @@ int ipv6_fl_get_saddr(struct net *net, const struct dst_entry *dst_entry,
 	int hiscore_idx = 0;
 	int ret = 0;
 
+	/* we should never end up here with a non-empty saddr. */
+	if (WARN_ON_ONCE(!ipv6_addr_any(&fl6->saddr)))
+		return 0;
+
 	dst_type = __ipv6_addr_type(&fl6->daddr);
+	dst.net = net;
 	dst.fl6 = fl6;
 	dst.sk = sk;
 	dst.dst = dst_entry;
-- 
2.53.0


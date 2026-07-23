Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B6A411F92;
	Thu, 23 Jul 2026 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809457; cv=none; b=E7J+V+sTEUMJvfX3pTuCRkVvJr24hM8P5h8Pnf6KKDkdJIH9aBBHJaa9xX8PC2BH+BGPfmZ9F/8AYWxraUX+XL+uSAC5TnFzwi9VLmjKAdIyLrOZGwJIJcr2qyOdD9to+YV9V1hmORE64+mBoY9boJaGZ3/B9h98ETB8T0N9siI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809457; c=relaxed/simple;
	bh=+5Xh9dg0q3HZnktLwU3FznNI2zpWMPAKSpwms0VI3vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9mM16NrgcCskVsyH89DObfgJTcJ+mRwahCva/K8ykYpFwcRLofk3l4looKlA/InPGY77stfO0rg8sgiAGcwt1mDl7v96tPepxU8WjkGEH1bJ20Nt1VsDRcWFabAJ6hnCqX/hpGRnORFg9MR+nJpI+9yYdYovhkNxtDRC2vKejw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from [2001:67c:370:1998:30cb:b625:4f9:61b4] (helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsTB-00000003Wpj-2g40;
	Thu, 23 Jul 2026 14:24:09 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsRY-00000000Q2I-1mKP;
	Thu, 23 Jul 2026 14:22:28 +0200
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
	David 'equinox' Lamparter <equinox@diac24.net>
Subject: [PATCH net-next v2 08/10] net/ipv6: leave a note on subtree/nexthop objects
Date: Thu, 23 Jul 2026 14:19:34 +0200
Message-ID: <20260723122106.99772-9-equinox@diac24.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723122106.99772-1-equinox@diac24.net>
References: <20260723122106.99772-1-equinox@diac24.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rule 5.5 code doesn't handle nexthop objects, it doesn't need to
since they're currently rejected by the kernel.  There's no fundamental
reason why nexthop objects can't be supported on subtree / dst-src
routes, so leave a note in case somebody wants to do this at a future
point in time.  (NB: I have no idea what else would need to be addressed
for that, hence the "among other things" in the comment.)

The error messages on this reject were also just plain worded wrong,
source-specific routing and source routing both exist and are very
different things, and the source address on a route is yet another
distinct thing.  Admittedly, "source routing" is sometimes (mis)used to
mean source-specific / policy routing, either way let's not add to the
confusion.

For reference:
* source-specific routing: include source address in lookup *after*
  destination, aka subtree routes, aka dst-src routing, aka SADR
  (NB: policy routing / ip rule is source *before* destination)
* source routing: pre-deciding multiple hops / the path through the
  network on ingress, e.g. MPLS, segment routing
* source attribute on a route: preference to apply when selecting a
  source address for outbound connections/packets from this system

Signed-off-by: David 'equinox' Lamparter <equinox@diac24.net>
---
 net/ipv4/nexthop.c |  5 ++++-
 net/ipv6/route.c   | 10 +++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 6205bd57aa85..f26ba66954cc 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -1542,8 +1542,11 @@ EXPORT_SYMBOL_GPL(nexthop_for_each_fib6_nh);
 static int check_src_addr(const struct in6_addr *saddr,
 			  struct netlink_ext_ack *extack)
 {
+	/* among other things, ipv6_saddr_rule5p5() would need fixing for this
+	 * (it currently doesn't handle nexthop objects / groups)
+	 */
 	if (!ipv6_addr_any(saddr)) {
-		NL_SET_ERR_MSG(extack, "IPv6 routes using source address can not use nexthop objects");
+		NL_SET_ERR_MSG(extack, "IPv6 dst-src routes (with a source prefix) cannot use nexthop objects");
 		return -EINVAL;
 	}
 	return 0;
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 704afe2ddea7..3323cda37589 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -3786,18 +3786,22 @@ static int fib6_config_validate(struct fib6_config *cfg,
 
 #ifdef CONFIG_IPV6_SUBTREES
 	if (cfg->fc_src_len > 128) {
-		NL_SET_ERR_MSG(extack, "Invalid source address length");
+		NL_SET_ERR_MSG(extack, "Invalid source prefix length");
 		goto errout;
 	}
 
+	/* among other things, ipv6_saddr_rule5p5() would need fixing for this
+	 * (it currently doesn't handle nexthop objects / groups)
+	 */
 	if (cfg->fc_nh_id && cfg->fc_src_len) {
-		NL_SET_ERR_MSG(extack, "Nexthops can not be used with source routing");
+		NL_SET_ERR_MSG(extack,
+			       "IPv6 dst-src routes (with a source prefix) cannot use nexthop objects");
 		goto errout;
 	}
 #else
 	if (cfg->fc_src_len) {
 		NL_SET_ERR_MSG(extack,
-			       "Specifying source address requires IPV6_SUBTREES to be enabled");
+			       "Specifying source prefix requires IPV6_SUBTREES to be enabled");
 		goto errout;
 	}
 #endif
-- 
2.53.0


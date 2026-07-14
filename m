Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A3843CEF3;
	Tue, 14 Jul 2026 09:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022352; cv=none; b=tul/q8V6Fbhm+v6ZrKp83Epy94CsJTHQJuNw4998TanceNqWb2jauJvXreFkQQqElxhO/YlDlCfEJbjSz86h3SVax1Zr7qt89z/gixKRLuQANBjaJp0DBzdWi2xb2ELSxI3gUN/kYAYWZBbU/3jlR5/B1YaT71HTn9+mhOKu8ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022352; c=relaxed/simple;
	bh=I7IR/QJzw7fHXXNSNsDNnjbu2daLho+C+H6OagnADZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1Q1zns593OIYnPCbSWUovoP71pwxyC3IiB5F+G/moLABcn6BP96WJcUSzFL1gspoeqGA9eIJcKRpYapAEOokGAHD703qcgmS6NI27ySW9HGdMh+6In+A/IiPYPPCCUdb3lQcEe1day9bV8U/lLfPdWqGe0gz2K+O2M861FPvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from nat-wifi0.uniroma3.it ([193.204.167.180] helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wjZhv-000000022cr-1GsQ;
	Tue, 14 Jul 2026 11:45:43 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wjZdN-00000000ZUk-0U2i;
	Tue, 14 Jul 2026 11:41:01 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Lorenzo Colitti <lorenzo@google.com>,
	=?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>,
	Patrick Rohr <prohr@google.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	David 'equinox' Lamparter <equinox@diac24.net>
Subject: [PATCH net-next 5/9] net/ipv6: drop ip6_route_get_saddr
Date: Tue, 14 Jul 2026 11:40:08 +0200
Message-ID: <20260714094030.136317-6-equinox@diac24.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714094030.136317-1-equinox@diac24.net>
References: <20260714094030.136317-1-equinox@diac24.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's no longer used anywhere.

Signed-off-by: David 'equinox' Lamparter <equinox@diac24.net>
---
 include/net/ip6_route.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
index 09ffe0f13ce7..fe13cb1d3257 100644
--- a/include/net/ip6_route.h
+++ b/include/net/ip6_route.h
@@ -140,32 +140,6 @@ void rt6_flush_exceptions(struct fib6_info *f6i);
 void rt6_age_exceptions(struct fib6_info *f6i, struct fib6_gc_args *gc_args,
 			unsigned long now);
 
-static inline int ip6_route_get_saddr(struct net *net, struct fib6_info *f6i,
-				      const struct in6_addr *daddr,
-				      unsigned int prefs, int l3mdev_index,
-				      struct in6_addr *saddr)
-{
-	struct net_device *l3mdev;
-	struct net_device *dev;
-	bool same_vrf;
-	int err = 0;
-
-	rcu_read_lock();
-
-	l3mdev = dev_get_by_index_rcu(net, l3mdev_index);
-	if (!f6i || !f6i->fib6_prefsrc.plen || l3mdev)
-		dev = f6i ? fib6_info_nh_dev(f6i) : NULL;
-	same_vrf = !l3mdev || l3mdev_master_dev_rcu(dev) == l3mdev;
-	if (f6i && f6i->fib6_prefsrc.plen && same_vrf)
-		*saddr = f6i->fib6_prefsrc.addr;
-	else
-		err = ipv6_dev_get_saddr(net, same_vrf ? dev : l3mdev, daddr, prefs, saddr);
-
-	rcu_read_unlock();
-
-	return err;
-}
-
 struct rt6_info *rt6_lookup(struct net *net, const struct in6_addr *daddr,
 			    const struct in6_addr *saddr, int oif,
 			    const struct sk_buff *skb, int flags);
-- 
2.53.0


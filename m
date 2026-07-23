Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37177495522;
	Thu, 23 Jul 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809348; cv=none; b=UbB6W0EMT1PteW8dPBBCZyHfZ71ZYocJZgwG/PVxr9fCXbxTRCOpZSy9y8KyYK6Kq1UZd8QqrzCqKFwuVyagcKjOe24IN2FAjHaIc4M7yZUZHVrIb8ucIuNT8km5lVzn5OQLc31X1mCbo02oZXdtmw4GSwwyY1q3lUxkjO5M+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809348; c=relaxed/simple;
	bh=aEf+WTE/WscgBNRyK2TtMiVwG5OizbTiNWI2GO6HOxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNFg2M3FjvS3ZwaLfIlkgSZLDfRM0kv42bXJe+by6IkVZL6Bp9VV9ifp3Yr0sgvfM8JyWjgs+LoA7zoeew74C6LHmXGGyOgLXZl2nOw2tu9FXMbqNoyJh+we8pZWKybpC18yWQVj2W1ZqW9S41uPCKAwR1xGz9JkPaRqCZLUTIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from [2001:67c:370:1998:30cb:b625:4f9:61b4] (helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsRR-00000003Wm6-0lty;
	Thu, 23 Jul 2026 14:22:21 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsR4-00000000Q18-3INo;
	Thu, 23 Jul 2026 14:21:58 +0200
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
Subject: [PATCH net-next v2 04/10] net/ipv6: use ipv6_fl_get_saddr in output
Date: Thu, 23 Jul 2026 14:19:30 +0200
Message-ID: <20260723122106.99772-5-equinox@diac24.net>
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

Flatten ip6_route_get_saddr() into ip6_dst_lookup_tail (which really
just means handling fib6_prefsrc), and then replace ipv6_dev_get_saddr
with ipv6_fl_get_saddr to pass down the flow information.

Signed-off-by: David 'equinox' Lamparter <equinox@diac24.net>
---
 net/ipv6/ip6_output.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 368e4fa3b43c..7fda0152945d 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1143,27 +1143,41 @@ static int ip6_dst_lookup_tail(struct net *net, const struct sock *sk,
 	int flags = 0;
 
 	/* The correct way to handle this would be to do
-	 * ip6_route_get_saddr, and then ip6_route_output; however,
+	 * ipv6_fl_get_saddr, and then ip6_route_output; however,
 	 * the route-specific preferred source forces the
-	 * ip6_route_output call _before_ ip6_route_get_saddr.
+	 * ip6_route_output call _before_ ipv6_fl_get_saddr.
 	 *
 	 * In source specific routing (no src=any default route),
 	 * ip6_route_output will fail given src=any saddr, though, so
 	 * that's why we try it again later.
 	 */
 	if (ipv6_addr_any(&fl6->saddr)) {
+		struct net_device *l3mdev;
+		struct net_device *dev;
 		struct fib6_info *from;
 		struct rt6_info *rt;
+		bool same_vrf;
 
 		*dst = ip6_route_output(net, sk, fl6);
 		rt = (*dst)->error ? NULL : dst_rt6_info(*dst);
 
 		rcu_read_lock();
 		from = rt ? rcu_dereference(rt->from) : NULL;
-		err = ip6_route_get_saddr(net, from, &fl6->daddr,
-					  sk ? READ_ONCE(inet6_sk(sk)->srcprefs) : 0,
-					  fl6->flowi6_l3mdev,
-					  &fl6->saddr);
+
+		l3mdev = dev_get_by_index_rcu(net, fl6->flowi6_l3mdev);
+		if (!from || !from->fib6_prefsrc.plen || l3mdev)
+			dev = from ? fib6_info_nh_dev(from) : NULL;
+		same_vrf = !l3mdev || l3mdev_master_dev_rcu(dev) == l3mdev;
+		if (from && from->fib6_prefsrc.plen && same_vrf) {
+			fl6->saddr = from->fib6_prefsrc.addr;
+			err = 0;
+		} else {
+			err = ipv6_fl_get_saddr(net, *dst,
+						same_vrf ? dev : l3mdev, sk,
+						sk ? READ_ONCE(inet6_sk(sk)->srcprefs) : 0,
+						fl6);
+		}
+
 		rcu_read_unlock();
 
 		if (err)
-- 
2.53.0


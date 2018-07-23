From: davem at davemloft.net (David Miller)
Date: Mon, 23 Jul 2018 09:47:05 -0700 (PDT)
Subject: [PATCH net-next] selftests: forwarding: gre_multipath: Drop
 IPv6 tests
In-Reply-To: <cf0e380baf6a6aa5cf384017e8d69fec79750cfe.1532341813.git.petrm@mellanox.com>
References: <cf0e380baf6a6aa5cf384017e8d69fec79750cfe.1532341813.git.petrm@mellanox.com>
Message-ID: <20180723.094705.243995419064933020.davem@davemloft.net>

From: Petr Machata <petrm at mellanox.com>
Date: Mon, 23 Jul 2018 12:33:08 +0200

> Support for device-only IPv6 multipath next hops was dropped in
> commit 33bd5ac54dc4 ("net/ipv6: Revert attempt to simplify route replace
> and append") and as of commit b5d2d75e079a ("net/ipv6: Do not allow
> device only routes via the multipath API"), attempts to add a next hop
> like that yield an explicit diagnostic.
> 
> Correspondingly, drop the IPv6 parts of GRE multipath test that are
> supposed to test that code.
> 
> Signed-off-by: Petr Machata <petrm at mellanox.com>

Applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

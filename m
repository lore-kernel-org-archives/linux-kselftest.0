From: davem@davemloft.net (David Miller)
Date: Tue, 26 Jun 2018 23:03:19 +0900 (KST)
Subject: [PATCH net-next v2] selftests: net: Test headroom handling of
 ip6_gre devices
In-Reply-To: <2071eab42614e7019ece0e2d6f89fdde55815347.1529937619.git.petrm@mellanox.com>
References: <2071eab42614e7019ece0e2d6f89fdde55815347.1529937619.git.petrm@mellanox.com>
Message-ID: <20180626.230319.2202227950116916295.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626140319.BfoYqMdIIH3_UESvWS718XZkTD3qwlSrAU72EWoG6EA@z>

From: Petr Machata <petrm@mellanox.com>
Date: Mon, 25 Jun 2018 16:43:55 +0200

> Commit 5691484df961 ("net: ip6_gre: Fix headroom request in
> ip6erspan_tunnel_xmit()") and commit 01b8d064d58b ("net: ip6_gre:
> Request headroom in __gre6_xmit()") fix problems in reserving headroom
> in the packets tunneled through ip6gre/tap and ip6erspan netdevices.
> 
> These two patches included snippets that reproduced the issues. This
> patch elevates the snippets to a full-fledged test case.
> 
> Suggested-by: David Miller <davem at davemloft.net>
> Signed-off-by: Petr Machata <petrm at mellanox.com>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

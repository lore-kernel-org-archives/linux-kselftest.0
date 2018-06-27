From: davem at davemloft.net (David Miller)
Date: Wed, 27 Jun 2018 10:42:32 +0900 (KST)
Subject: [PATCH net-next 0/6] Multipath tests for tunnel devices
In-Reply-To: <cover.1529971148.git.petrm@mellanox.com>
References: <cover.1529971148.git.petrm@mellanox.com>
Message-ID: <20180627.104232.104524931315029852.davem@davemloft.net>

From: Petr Machata <petrm at mellanox.com>
Date: Tue, 26 Jun 2018 02:05:51 +0200

> This patchset adds a test for ECMP and weighted ECMP between two GRE
> tunnels.
> 
> In patches #1 and #2, the function multipath_eval() is first moved from
> router_multipath.sh to lib.sh for ease of reuse, and then fixed up.
> 
> In patch #3, the function tc_rule_stats_get() is parameterized to be
> useful for egress rules as well.
> 
> In patch #4, a new function __simple_if_init() is extracted from
> simple_if_init(). This covers the logic that needs to be done for the
> usual interface: VRF migration, upping and installation of IP addresses.
> 
> Patch #5 then adds the test itself.
> 
> Additionally in patch #6, a requirement to add diagrams to selftests is
> documented.

Looks good, series applied.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

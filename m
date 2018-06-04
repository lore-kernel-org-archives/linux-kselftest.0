From: davem@davemloft.net (David Miller)
Date: Mon, 04 Jun 2018 10:09:16 -0400 (EDT)
Subject: [PATCH net-next 0/2] selftests: forwarding: mirror_vlan: Fixlets
In-Reply-To: <cover.1527805500.git.petrm@mellanox.com>
References: <cover.1527805500.git.petrm@mellanox.com>
Message-ID: <20180604.100916.2136602646047594512.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180604140916.yeLQvQWzVW_ymYH80cVTtciJNhZ-7uM9TcAzJfDWqd8@z>

From: Petr Machata <petrm@mellanox.com>
Date: Fri, 01 Jun 2018 00:37:29 +0200

> This patchset includes two small fixes for the tests that were
> introduced in commit 1bb58d2d3cbe ("Merge branch
> 'Mirroring-tests-involving-VLAN'").
> 
> In patch #1, a "tc action trap" is uninstalled after the suite runs,
> instead of being installed again.
> 
> In patch #2, a test in suite is renamed to differentiate it from another
> test of the same name.

Series applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

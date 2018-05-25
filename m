From: davem@davemloft.net (David Miller)
Date: Thu, 24 May 2018 22:26:42 -0400 (EDT)
Subject: [PATCH net-next 00/10] Mirroring tests involving VLAN
In-Reply-To: <cover.1527171860.git.petrm@mellanox.com>
References: <cover.1527171860.git.petrm@mellanox.com>
Message-ID: <20180524.222642.1508131441762277991.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180525022642.MIGuhe5d2ZL9JBE_qt7-Uj_4UU_SMVt5waDRNXThPis@z>

From: Petr Machata <petrm@mellanox.com>
Date: Thu, 24 May 2018 16:27:04 +0200

> This patchset tests mirror-to-gretap with various underlay
> configurations involving VLAN netdevice in particular. Some of the tests
> involve bridges as well, but tests aimed specifically at testing bridges
> (i.e. FDB, STP) are not part of this patchset.
> 
> In patches #1-#6, the codebase is adapted to support the new tests.
> 
> In patch #7, a test for mirroring to VLAN is introduced.
> 
> Patches #8-#10 add three tests where VLAN is part of underlay path after
> gretap encapsulation.

Series applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

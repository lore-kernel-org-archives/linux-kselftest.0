From: davem@davemloft.net (David Miller)
Date: Fri, 01 Jun 2018 14:11:32 -0400 (EDT)
Subject: [PATCH net-next 0/9] Test mirror-to-gretap with bridge in UL
In-Reply-To: <cover.1527788672.git.petrm@mellanox.com>
References: <cover.1527788672.git.petrm@mellanox.com>
Message-ID: <20180601.141132.2033350757881840928.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180601181132.uFoOvQireyY1D3rJ4YpwZ-l-6MZ2kY8dx-PD7urGqkM@z>

From: Petr Machata <petrm@mellanox.com>
Date: Thu, 31 May 2018 19:51:56 +0200

> This patchset adds more tests to the mirror-to-gretap suite where bridge
> is present in the underlay. Specifically it adds tests for bridge VLAN
> handling, FDB, and bridge port STP status.
> 
> In patches #1-#3, the codebase is refactored to support the new tests.
> 
> In patch #4, an STP test is added to the mirroring library, that will
> later be called from bridge tests.
> 
> In patches #5-#8, the test for mirror-to-gretap with an 802.1q bridge in
> underlay is adapted and more tests are added.
> 
> In patch #9, an STP test is added to the test suite for mirror-to-gretap
> with an 802.1d bridge in underlay.

Series applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

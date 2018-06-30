From: davem at davemloft.net (David Miller)
Date: Sat, 30 Jun 2018 20:35:53 +0900 (KST)
Subject: [PATCH net-next 0/4] Fixes for running mirror-to-gretap tests
 on veth
In-Reply-To: <cover.1530204784.git.petrm@mellanox.com>
References: <cover.1530204784.git.petrm@mellanox.com>
Message-ID: <20180630.203553.1800987077648681363.davem@davemloft.net>

From: Petr Machata <petrm at mellanox.com>
Date: Thu, 28 Jun 2018 18:56:15 +0200

> The forwarding selftests infrastructure makes it possible to run the
> individual tests on a purely software netdevices. Names of interfaces to
> run the test with can be passed as command line arguments to a test.
> lib.sh then creates veth pairs backing the interfaces if none exist in
> the system.
> 
> However, the tests need to recognize that they might be run on a soft
> device. Many mirror-to-gretap tests are buggy in this regard. This patch
> set aims to fix the problems in running mirror-to-gretap tests on veth
> devices.
> 
> In patch #1, a service function is split out of setup_wait().
> In patch #2, installing a trap is made optional.
> In patch #3, tc filters in several tests are tweaked to work with veth.
> In patch #4, the logic for waiting for neighbor is fixed for veth.

Series applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

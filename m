From: davem at davemloft.net (David Miller)
Date: Wed, 28 Feb 2018 12:27:53 -0500 (EST)
Subject: [PATCH net-next v2 00/14] selftests: forwarding: Add VRF-based
 tests
In-Reply-To: <20180228102519.4156-1-idosch@mellanox.com>
References: <20180228102519.4156-1-idosch@mellanox.com>
Message-ID: <20180228.122753.1975722492464203885.davem@davemloft.net>

From: Ido Schimmel <idosch at mellanox.com>
Date: Wed, 28 Feb 2018 12:25:05 +0200

> One of the nice things about network namespaces is that they allow one
> to easily create and test complex environments.
> 
> Unfortunately, these namespaces can not be used with actual switching
> ASICs, as their ports can not be migrated to other network namespaces
> (NETIF_F_NETNS_LOCAL) and most of them probably do not support the
> L1-separation provided by namespaces.
> 
> However, a similar kind of flexibility can be achieved by using VRFs and
> by looping the switch ports together. For example:
> 
>                              br0
>                               +
>                vrf-h1         |           vrf-h2
>                  +        +---+----+        +
>                  |        |        |        |
>     192.0.2.1/24 +        +        +        + 192.0.2.2/24
>                swp1     swp2     swp3     swp4
>                  +        +        +        +
>                  |        |        |        |
>                  +--------+        +--------+
> 
> The VRFs act as lightweight namespaces representing hosts connected to
> the switch.
> 
> This approach for testing switch ASICs has several advantages over the
> traditional method that requires multiple physical machines, to name a
> few:
> 
> 1. Only the device under test (DUT) is being tested without noise from
> other system.
> 
> 2. Ability to easily provision complex topologies. Testing bridging
> between 4-ports LAGs or 8-way ECMP requires many physical links that are
> not always available. With the VRF-based approach one merely needs to
> loopback more ports.
> 
> These tests are written with switch ASICs in mind, but they can be run
> on any Linux box using veth pairs to emulate physical loopbacks.
 ...

I love this series on so many levels.

First and foremost, we now have more tests!  We always need more tests!

Second, this is yet another interesting and practical use for one of
the most underutilized and most powerful facilities we have, VRF.

Whatever problems or limitations these tests have can be easily fixed
with follow-on changes.

Series applied, thanks a lot!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

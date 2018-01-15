From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 15 Jan 2018 21:18:41 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 00/12] selftests:
	forwarding: Add VRF-based tests
Message-ID: <20180115191853.26129-1-idosch@mellanox.com>

One of the nice things about network namespaces is that they allow one
to easily create and test complex environments.

Unfortunately, these namespaces can not be used with actual switching
ASICs, as their ports can not be migrated to other network namespaces
(NETIF_F_NETNS_LOCAL) and most of them probably do not support the
L1-separation provided by namespaces.

However, a similar kind of flexibility can be achieved by using VRFs and
by looping the switch ports together. For example:

                             br0
                              +
               vrf-h1         |           vrf-h2
                 +        +---+----+        +
                 |        |        |        |
    192.0.2.1/24 +        +        +        + 192.0.2.2/24
               swp1     swp2     swp3     swp4
                 +        +        +        +
                 |        |        |        |
                 +--------+        +--------+

The VRFs act as lightweight namespaces representing hosts connected to
the switch.

This approach for testing switch ASICs has several advantages over the
traditional method that requires multiple physical machines, to name a
few:

1. Only the device under test (DUT) is being tested without noise from
other system.

2. Ability to easily provision complex topologies. Testing bridging
between 4-ports LAGs or 8-way ECMP requires many physical links that are
not always available. With the VRF-based approach one merely needs to
loopback more ports.

These tests are written with switch ASICs in mind, but they can be run
on any Linux box using veth pairs to emulate physical loopbacks.

Feedback is is welcome. Particularly regarding the best location for
these tests (e.g., current location, tools/testing/selftests/net).

Thanks.

Ido Schimmel (7):
  selftests: forwarding: Add initial testing framework
  selftests: forwarding: Add a test for FDB learning
  selftests: forwarding: Add a test for flooded traffic
  selftests: forwarding: Add a test for basic IPv4 and IPv6 routing
  selftests: forwarding: Create test topology for multipath routing
  selftests: forwarding: Test IPv4 weighted nexthops
  selftests: forwarding: Test IPv6 weighted nexthops

Jiri Pirko (5):
  selftests: forwarding: Add tc offload check helper
  selftests: forwarding: Add MAC get helper
  selftests: forwarding: Allow to get netdev interfaces names from
    commandline
  selftests: forwarding: Allow to pass commandline options
  selftests: forwarding: Introduce tc flower matching tests

 tools/testing/selftests/Makefile                   |   1 +
 tools/testing/selftests/forwarding/.gitignore      |   1 +
 tools/testing/selftests/forwarding/Makefile        |   6 +
 tools/testing/selftests/forwarding/README          |  56 +++
 tools/testing/selftests/forwarding/bridge.sh       | 117 +++++++
 tools/testing/selftests/forwarding/config          |  12 +
 .../selftests/forwarding/forwarding.config.sample  |  19 +
 tools/testing/selftests/forwarding/lib.sh          | 383 +++++++++++++++++++++
 tools/testing/selftests/forwarding/router.sh       | 131 +++++++
 .../selftests/forwarding/router_multipath.sh       | 321 +++++++++++++++++
 tools/testing/selftests/forwarding/tc_flower.sh    | 261 ++++++++++++++
 11 files changed, 1308 insertions(+)
 create mode 100644 tools/testing/selftests/forwarding/.gitignore
 create mode 100644 tools/testing/selftests/forwarding/Makefile
 create mode 100644 tools/testing/selftests/forwarding/README
 create mode 100755 tools/testing/selftests/forwarding/bridge.sh
 create mode 100644 tools/testing/selftests/forwarding/config
 create mode 100644 tools/testing/selftests/forwarding/forwarding.config.sample
 create mode 100644 tools/testing/selftests/forwarding/lib.sh
 create mode 100755 tools/testing/selftests/forwarding/router.sh
 create mode 100755 tools/testing/selftests/forwarding/router_multipath.sh
 create mode 100755 tools/testing/selftests/forwarding/tc_flower.sh

-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

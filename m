From: idosch at mellanox.com (Ido Schimmel)
Date: Wed, 28 Feb 2018 12:25:05 +0200
Subject: [PATCH net-next v2 00/14] selftests: forwarding: Add VRF-based tests
Message-ID: <20180228102519.4156-1-idosch@mellanox.com>

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

v2:
* Order local variables declaration according to function arguments
  order (Petr)

v1:
* Change location to net/forwarding instead of forwarding/
* Add ability to pause on failure
* Add ability to pause on cleanup
* Make configuration file optional
* Make ping/ping6/mz configurable
* Add more tc tests

Ido Schimmel (7):
  selftests: forwarding: Add initial testing framework
  selftests: forwarding: Add a test for FDB learning
  selftests: forwarding: Add a test for flooded traffic
  selftests: forwarding: Add a test for basic IPv4 and IPv6 routing
  selftests: forwarding: Create test topology for multipath routing
  selftests: forwarding: Test IPv4 weighted nexthops
  selftests: forwarding: Test IPv6 weighted nexthops

Jiri Pirko (7):
  selftests: forwarding: Add tc offload check helper
  selftests: forwarding: Add MAC get helper
  selftests: forwarding: Allow to get netdev interfaces names from
    commandline
  selftests: forwarding: Introduce tc flower matching tests
  selftests: forwarding: Introduce tc actions tests
  selftests: forwarding: Introduce basic tc chains tests
  selftests: forwarding: Introduce basic shared blocks tests

 tools/testing/selftests/net/forwarding/.gitignore  |   1 +
 tools/testing/selftests/net/forwarding/README      |  56 +++
 .../selftests/net/forwarding/bridge_vlan_aware.sh  |  87 ++++
 tools/testing/selftests/net/forwarding/config      |  12 +
 .../net/forwarding/forwarding.config.sample        |  31 ++
 tools/testing/selftests/net/forwarding/lib.sh      | 533 +++++++++++++++++++++
 tools/testing/selftests/net/forwarding/router.sh   | 125 +++++
 .../selftests/net/forwarding/router_multipath.sh   | 322 +++++++++++++
 .../testing/selftests/net/forwarding/tc_actions.sh | 195 ++++++++
 .../testing/selftests/net/forwarding/tc_chains.sh  | 122 +++++
 .../testing/selftests/net/forwarding/tc_common.sh  |  23 +
 .../testing/selftests/net/forwarding/tc_flower.sh  | 196 ++++++++
 .../selftests/net/forwarding/tc_shblocks.sh        | 122 +++++
 13 files changed, 1825 insertions(+)
 create mode 100644 tools/testing/selftests/net/forwarding/.gitignore
 create mode 100644 tools/testing/selftests/net/forwarding/README
 create mode 100755 tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
 create mode 100644 tools/testing/selftests/net/forwarding/config
 create mode 100644 tools/testing/selftests/net/forwarding/forwarding.config.sample
 create mode 100644 tools/testing/selftests/net/forwarding/lib.sh
 create mode 100755 tools/testing/selftests/net/forwarding/router.sh
 create mode 100755 tools/testing/selftests/net/forwarding/router_multipath.sh
 create mode 100755 tools/testing/selftests/net/forwarding/tc_actions.sh
 create mode 100755 tools/testing/selftests/net/forwarding/tc_chains.sh
 create mode 100644 tools/testing/selftests/net/forwarding/tc_common.sh
 create mode 100755 tools/testing/selftests/net/forwarding/tc_flower.sh
 create mode 100755 tools/testing/selftests/net/forwarding/tc_shblocks.sh

-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

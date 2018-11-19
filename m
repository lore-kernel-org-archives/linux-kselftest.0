From: idosch@mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:06 +0000
Subject: [PATCH net-next 00/18] selftests: Add tests for VXLAN at an 802.1d
 bridge
Message-ID: <20181119161006.5405-1-idosch@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181119161106.DdqPQMniYzvkimyYOnE1AIZAJ_rmn79xO99fbVCMCx8@z>

Petr says:

This patchset adds several tests for VXLAN attached to an 802.1d bridge
and fixes a related bug.

First patch #1 fixes a bug in propagating SKB already-forwarded marks
over veth to bridges, where they are irrelevant. This bug causes the
vxlan_bridge_1d test suite from this patchset to fail as the packets
aren't forwarded by br2.

In patches #2 and #3, lib.sh is extended to support network namespaces.
The use of namespaces is necessitated by VXLAN, which allows only one
VXLAN device with a given VNI per namespace. Thus to host full topology
on a single box for selftests, the "remote" endpoints need to be in
namespaces.

In patches #4-#6, lib.sh is extended in other ways to facilitate the
following patches.

In patches #7-#15, first the skeleton, and later the generic tests
themselves are added.

Patch #16 then adds another test that serves as a wrapper around the
previous one, and runs it with a non-default port number.

Patches #17 and #18 add mlxsw-specific tests. About those, Ido writes:

The first test creates various configurations with regards to the VxLAN
and bridge devices and makes sure the driver correctly forbids
unsupported configuration and permits supported ones. It also verifies
that the driver correctly sets the offload indication on FDB entries and
the local route used for VxLAN decapsulation.

The second test verifies that the driver correctly configures the singly
linked list used to flood BUM traffic and that traffic is flooded as
expected.

Ido Schimmel (2):
  selftests: mlxsw: Add a test for VxLAN configuration
  selftests: mlxsw: Add a test for VxLAN flooding

Petr Machata (16):
  net: skb_scrub_packet(): Scrub offload_fwd_mark
  selftests: forwarding: lib: Support NUM_NETIFS of 0
  selftests: forwarding: lib: Add in_ns()
  selftests: forwarding: ping{6,}_test(): Add description argument
  selftests: forwarding: ping{6,}_do(): Allow passing ping arguments
  selftests: forwarding: lib: Add link_stats_rx_errors_get()
  selftests: forwarding: Add a skeleton of vxlan_bridge_1d
  selftests: forwarding: vxlan_bridge_1d: Add ping test
  selftests: forwarding: vxlan_bridge_1d: Add flood test
  selftests: forwarding: vxlan_bridge_1d: Add unicast test
  selftests: forwarding: vxlan_bridge_1d: Reconfigure & rerun tests
  selftests: forwarding: vxlan_bridge_1d: Add a TTL test
  selftests: forwarding: vxlan_bridge_1d: Add a TOS test
  selftests: forwarding: vxlan_bridge_1d: Add an ECN encap test
  selftests: forwarding: vxlan_bridge_1d: Add an ECN decap test
  selftests: forwarding: vxlan_bridge_1d_port_8472: New test

 net/core/skbuff.c                             |   5 +
 .../selftests/drivers/net/mlxsw/vxlan.sh      | 664 +++++++++++++++++
 .../drivers/net/mlxsw/vxlan_flooding.sh       | 309 ++++++++
 tools/testing/selftests/net/forwarding/lib.sh |  42 +-
 .../net/forwarding/vxlan_bridge_1d.sh         | 678 ++++++++++++++++++
 .../forwarding/vxlan_bridge_1d_port_8472.sh   |  10 +
 6 files changed, 1700 insertions(+), 8 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/mlxsw/vxlan.sh
 create mode 100755 tools/testing/selftests/drivers/net/mlxsw/vxlan_flooding.sh
 create mode 100755 tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
 create mode 100755 tools/testing/selftests/net/forwarding/vxlan_bridge_1d_port_8472.sh

-- 
2.19.1

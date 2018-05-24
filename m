From: petrm@mellanox.com (Petr Machata)
Date: Thu, 24 May 2018 16:27:04 +0200
Subject: [PATCH net-next 00/10] Mirroring tests involving VLAN
Message-ID: <cover.1527171860.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180524142704.gimBHPj_Seyd-9cshGVTQa7BQuYihvpegI9mfVcY-4I@z>

This patchset tests mirror-to-gretap with various underlay
configurations involving VLAN netdevice in particular. Some of the tests
involve bridges as well, but tests aimed specifically at testing bridges
(i.e. FDB, STP) are not part of this patchset.

In patches #1-#6, the codebase is adapted to support the new tests.

In patch #7, a test for mirroring to VLAN is introduced.

Patches #8-#10 add three tests where VLAN is part of underlay path after
gretap encapsulation.

Petr Machata (10):
  selftests: forwarding: Split mirror_gre_topo_lib.sh
  selftests: forwarding: mirror_gre_lib: Extract generic functions
  selftests: forwarding: Add $h3's clsact to mirror_topo_lib.sh
  selftests: forwarding: lib: Support VLAN devices
  selftests: forwarding: mirror_gre_lib: Support VLAN
  selftests: forwarding: lib: Extract trap_{,un}install()
  selftests: forwarding: Test mirror-to-vlan
  selftests: forwarding: Test mirror-to-gre w/ UL VLAN+802.1q
  selftests: forwarding: Test mirror-to-gre w/ UL VLAN
  selftests: forwarding: Test mirror-to-gre w/ UL 802.1d+VLAN

 tools/testing/selftests/net/forwarding/lib.sh      |  52 +++++--
 .../testing/selftests/net/forwarding/mirror_gre.sh |   2 -
 .../net/forwarding/mirror_gre_bridge_1d_vlan.sh    | 109 +++++++++++++
 .../selftests/net/forwarding/mirror_gre_changes.sh |   2 -
 .../selftests/net/forwarding/mirror_gre_lib.sh     |  61 +++++---
 .../net/forwarding/mirror_gre_topo_lib.sh          |  53 ++-----
 .../selftests/net/forwarding/mirror_gre_vlan.sh    |  92 +++++++++++
 .../net/forwarding/mirror_gre_vlan_bridge_1q.sh    | 140 +++++++++++++++++
 .../testing/selftests/net/forwarding/mirror_lib.sh |  54 +++++++
 .../selftests/net/forwarding/mirror_topo_lib.sh    | 101 ++++++++++++
 .../selftests/net/forwarding/mirror_vlan.sh        | 169 +++++++++++++++++++++
 11 files changed, 754 insertions(+), 81 deletions(-)
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_vlan.sh
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
 create mode 100644 tools/testing/selftests/net/forwarding/mirror_topo_lib.sh
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_vlan.sh

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

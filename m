From: petrm at mellanox.com (Petr Machata)
Date: Mon, 02 Jul 2018 19:58:44 +0200
Subject: [PATCH net-next 0/2] More mirror-to-gretap tests with bridge in UL
Message-ID: <cover.1530553971.git.petrm@mellanox.com>

This patchset adds two more tests where the mirror-to-gretap has a
bridge in underlay packet path, without a VLAN above or below that
bridge.

In patch #1, a non-VLAN-filtering bridge is tested.

In patch #2, a VLAN-filtering bridge is tested.

Petr Machata (2):
  selftests: forwarding: Test mirror-to-gretap w/ UL 802.1d
  selftests: forwarding: Test mirror-to-gretap w/ UL 802.1q

 .../net/forwarding/mirror_gre_bridge_1d.sh         | 132 +++++++++++++++++++++
 .../net/forwarding/mirror_gre_bridge_1q.sh         | 126 ++++++++++++++++++++
 2 files changed, 258 insertions(+)
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d.sh
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_bridge_1q.sh

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

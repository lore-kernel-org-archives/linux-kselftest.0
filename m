From: petrm@mellanox.com (Petr Machata)
Date: Mon, 30 Jul 2018 16:37:17 +0200
Subject: [PATCH net-next 0/5] A test for mirror-to-gretap with team in UL
 packet path
Message-ID: <cover.1532961216.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180730143717.t3dxdHDgzgjDh6VOxZvxmYOd7oCBwoRExV-LM9B85MA@z>

This patchset adds a test for "tc action mirred mirror" where the
mirrored-to device is a gretap, and underlay path contains a team
device.

In patch #1 require_command() is added, which should henceforth be used
to declare dependence on a certain tool.

In patch #2, two new functions, team_create() and team_destroy(), are
added to lib.sh.

The newly-added test uses arping, which isn't necessarily available.
Therefore patch #3 introduces $ARPING, and a preexisting test is fixed
to require_command $ARPING.

In patches #4 and #5, two new tests are added. In both cases, a team
device is on egress path of a mirrored packet in a mirror-to-gretap
scenario. In the first one, the team device is in loadbalance mode, in
the second one it's in lacp mode. (The difference in modes necessitates
a different testing strategy, hence two test cases instead of just
parameterizing one.)

Petr Machata (5):
  selftests: forwarding: lib: Add require_command()
  selftests: forwarding: lib: Support team devices
  selftests: forwarding: Introduce $ARPING
  selftests: forwarding: Test mirror-to-gretap w/ UL team
  selftests: forwarding: Test mirror-to-gretap w/ UL team LACP

 tools/testing/selftests/net/forwarding/lib.sh      |  43 +++-
 .../net/forwarding/mirror_gre_bridge_1q_lag.sh     | 283 ++++++++++++++++++++
 .../net/forwarding/mirror_gre_lag_lacp.sh          | 285 +++++++++++++++++++++
 .../net/forwarding/mirror_gre_vlan_bridge_1q.sh    |   6 +-
 4 files changed, 607 insertions(+), 10 deletions(-)
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_bridge_1q_lag.sh
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_lag_lacp.sh

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

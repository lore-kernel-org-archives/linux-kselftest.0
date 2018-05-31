From: petrm@mellanox.com (Petr Machata)
Date: Thu, 31 May 2018 19:51:56 +0200
Subject: [PATCH net-next 0/9] Test mirror-to-gretap with bridge in UL
Message-ID: <cover.1527788672.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531175156.8679ZL6TEO1ikSLHrCYPh1wyb5Yq19zhcTnyiI758As@z>

This patchset adds more tests to the mirror-to-gretap suite where bridge
is present in the underlay. Specifically it adds tests for bridge VLAN
handling, FDB, and bridge port STP status.

In patches #1-#3, the codebase is refactored to support the new tests.

In patch #4, an STP test is added to the mirroring library, that will
later be called from bridge tests.

In patches #5-#8, the test for mirror-to-gretap with an 802.1q bridge in
underlay is adapted and more tests are added.

In patch #9, an STP test is added to the test suite for mirror-to-gretap
with an 802.1d bridge in underlay.

Petr Machata (9):
  selftests: forwarding: lib: Move here vlan_capture_{,un}install()
  selftests: forwarding: mirror_lib: Move here
    do_test_span_vlan_dir_ips()
  selftests: forwarding: mirror_lib: skip_hw the VLAN capture
  selftests: forwarding: mirror_gre_lib: Add STP test
  selftests: forwarding: mirror_gre_vlan_bridge_1q: Fix tunnel name
  selftests: forwarding: mirror_gre_vlan_bridge_1q: Test final config
  selftests: forwarding: mirror_gre_vlan_bridge_1q: Rename two tests
  selftests: forwarding: mirror_gre_vlan_bridge_1q: Add more tests
  selftests: forwarding: mirror_gre_bridge_1d_vlan: Add STP test

 tools/testing/selftests/net/forwarding/lib.sh      |  23 ++++
 .../net/forwarding/mirror_gre_bridge_1d_vlan.sh    |  12 ++
 .../selftests/net/forwarding/mirror_gre_lib.sh     |  32 +++++
 .../net/forwarding/mirror_gre_vlan_bridge_1q.sh    | 148 +++++++++++++++++++--
 .../testing/selftests/net/forwarding/mirror_lib.sh |  38 ++++++
 .../selftests/net/forwarding/mirror_vlan.sh        |  38 ------
 6 files changed, 244 insertions(+), 47 deletions(-)

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

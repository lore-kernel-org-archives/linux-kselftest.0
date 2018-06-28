From: petrm at mellanox.com (Petr Machata)
Date: Thu, 28 Jun 2018 18:56:15 +0200
Subject: [PATCH net-next 0/4] Fixes for running mirror-to-gretap tests on veth
Message-ID: <cover.1530204784.git.petrm@mellanox.com>

The forwarding selftests infrastructure makes it possible to run the
individual tests on a purely software netdevices. Names of interfaces to
run the test with can be passed as command line arguments to a test.
lib.sh then creates veth pairs backing the interfaces if none exist in
the system.

However, the tests need to recognize that they might be run on a soft
device. Many mirror-to-gretap tests are buggy in this regard. This patch
set aims to fix the problems in running mirror-to-gretap tests on veth
devices.

In patch #1, a service function is split out of setup_wait().
In patch #2, installing a trap is made optional.
In patch #3, tc filters in several tests are tweaked to work with veth.
In patch #4, the logic for waiting for neighbor is fixed for veth.

Petr Machata (4):
  selftests: forwarding: lib: Split out setup_wait_dev()
  selftests: forwarding: lib: Avoid trapping soft devices
  selftests: forwarding: Tweak tc filters for mirror-to-gretap tests
  selftests: forwarding: mirror_gre_changes: Fix waiting for neighbor

 tools/testing/selftests/net/forwarding/lib.sh      | 41 +++++++++++++++-------
 .../net/forwarding/mirror_gre_bridge_1d_vlan.sh    |  6 ++--
 .../selftests/net/forwarding/mirror_gre_changes.sh | 11 ++----
 .../selftests/net/forwarding/mirror_gre_lib.sh     |  2 +-
 .../net/forwarding/mirror_gre_vlan_bridge_1q.sh    |  6 ++--
 5 files changed, 39 insertions(+), 27 deletions(-)

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

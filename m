From: petrm at mellanox.com (Petr Machata)
Date: Tue, 26 Jun 2018 02:05:51 +0200
Subject: [PATCH net-next 0/6] Multipath tests for tunnel devices
Message-ID: <cover.1529971148.git.petrm@mellanox.com>

This patchset adds a test for ECMP and weighted ECMP between two GRE
tunnels.

In patches #1 and #2, the function multipath_eval() is first moved from
router_multipath.sh to lib.sh for ease of reuse, and then fixed up.

In patch #3, the function tc_rule_stats_get() is parameterized to be
useful for egress rules as well.

In patch #4, a new function __simple_if_init() is extracted from
simple_if_init(). This covers the logic that needs to be done for the
usual interface: VRF migration, upping and installation of IP addresses.

Patch #5 then adds the test itself.

Additionally in patch #6, a requirement to add diagrams to selftests is
documented.

Petr Machata (6):
  selftests: forwarding: Move multipath_eval() to lib.sh
  selftests: forwarding: multipath_eval(): Improve style
  selftests: forwarding: tc_rule_stats_get: Parameterize direction
  selftests: forwarding: lib: Extract interface-init functions
  selftests: forwarding: Test multipath tunneling
  selftests: forwarding: README: Require diagrams

 tools/testing/selftests/net/forwarding/README      |   2 +
 .../selftests/net/forwarding/gre_multipath.sh      | 354 +++++++++++++++++++++
 tools/testing/selftests/net/forwarding/lib.sh      |  80 ++++-
 .../selftests/net/forwarding/router_multipath.sh   |  39 ---
 4 files changed, 427 insertions(+), 48 deletions(-)
 create mode 100755 tools/testing/selftests/net/forwarding/gre_multipath.sh

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

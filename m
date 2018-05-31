From: petrm@mellanox.com (Petr Machata)
Date: Fri, 01 Jun 2018 00:37:29 +0200
Subject: [PATCH net-next 0/2] selftests: forwarding: mirror_vlan: Fixlets
Message-ID: <cover.1527805500.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531223729.-I7fnBp_QHMaotyp-o05KN56V6J8JFv6e6vj300OHVw@z>

This patchset includes two small fixes for the tests that were
introduced in commit 1bb58d2d3cbe ("Merge branch
'Mirroring-tests-involving-VLAN'").

In patch #1, a "tc action trap" is uninstalled after the suite runs,
instead of being installed again.

In patch #2, a test in suite is renamed to differentiate it from another
test of the same name.

Petr Machata (2):
  selftests: forwarding: mirror_vlan: Uninstall trap
  selftests: forwarding: mirror_vlan: Change test description

 tools/testing/selftests/net/forwarding/mirror_vlan.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

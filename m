From: sashal@kernel.org (Sasha Levin)
Date: Tue, 12 Feb 2019 21:33:32 -0500
Subject: [PATCH AUTOSEL 4.20 101/105] selftests: forwarding: Add a test case
 for externally learned FDB entries
In-Reply-To: <20190213023336.19019-1-sashal@kernel.org>
References: <20190213023336.19019-1-sashal@kernel.org>
Message-ID: <20190213023336.19019-101-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190213023332.tP1yZD8MvbFg9KwI9_Zi88L3GSLB4TL6VCvSPqFF7Nw@z>

From: Ido Schimmel <idosch@mellanox.com>

[ Upstream commit 479a2b761d61c04e2ae97325aa391a8a8c99c23e ]

Test that externally learned FDB entries can roam, but not age out.

Signed-off-by: Ido Schimmel <idosch at mellanox.com>
Reviewed-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 .../net/forwarding/bridge_vlan_aware.sh       | 34 ++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
index 04c6431b2bd8..b90dff8d3a94 100755
--- a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 
-ALL_TESTS="ping_ipv4 ping_ipv6 learning flooding vlan_deletion"
+ALL_TESTS="ping_ipv4 ping_ipv6 learning flooding vlan_deletion extern_learn"
 NUM_NETIFS=4
 CHECK_TC="yes"
 source lib.sh
@@ -109,6 +109,38 @@ vlan_deletion()
 	ping_ipv6
 }
 
+extern_learn()
+{
+	local mac=de:ad:be:ef:13:37
+	local ageing_time
+
+	# Test that externally learned FDB entries can roam, but not age out
+	RET=0
+
+	bridge fdb add de:ad:be:ef:13:37 dev $swp1 master extern_learn vlan 1
+
+	bridge fdb show brport $swp1 | grep -q de:ad:be:ef:13:37
+	check_err $? "Did not find FDB entry when should"
+
+	# Wait for 10 seconds after the ageing time to make sure the FDB entry
+	# was not aged out
+	ageing_time=$(bridge_ageing_time_get br0)
+	sleep $((ageing_time + 10))
+
+	bridge fdb show brport $swp1 | grep -q de:ad:be:ef:13:37
+	check_err $? "FDB entry was aged out when should not"
+
+	$MZ $h2 -c 1 -p 64 -a $mac -t ip -q
+
+	bridge fdb show brport $swp2 | grep -q de:ad:be:ef:13:37
+	check_err $? "FDB entry did not roam when should"
+
+	log_test "Externally learned FDB entry - ageing & roaming"
+
+	bridge fdb del de:ad:be:ef:13:37 dev $swp2 master vlan 1 &> /dev/null
+	bridge fdb del de:ad:be:ef:13:37 dev $swp1 master vlan 1 &> /dev/null
+}
+
 trap cleanup EXIT
 
 setup_prepare
-- 
2.19.1

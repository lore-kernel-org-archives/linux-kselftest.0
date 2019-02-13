From: sashal@kernel.org (Sasha Levin)
Date: Tue, 12 Feb 2019 21:36:09 -0500
Subject: [PATCH AUTOSEL 4.19 31/83] selftests: forwarding: Add a test for VLAN
 deletion
In-Reply-To: <20190213023701.20286-1-sashal@kernel.org>
References: <20190213023701.20286-1-sashal@kernel.org>
Message-ID: <20190213023701.20286-31-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190213023609.2FptwLkVpF9uCEZONbizHYDFkIrsE94eltTx3qTGtNY@z>

From: Ido Schimmel <idosch@mellanox.com>

[ Upstream commit 4fabf3bf93a194c7fa5288da3e0af37e4b943cf3 ]

Add a VLAN on a bridge port, delete it and make sure the PVID VLAN is
not affected.

Signed-off-by: Ido Schimmel <idosch at mellanox.com>
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 .../selftests/net/forwarding/bridge_vlan_aware.sh | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
index d8313d0438b7..04c6431b2bd8 100755
--- a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 
-ALL_TESTS="ping_ipv4 ping_ipv6 learning flooding"
+ALL_TESTS="ping_ipv4 ping_ipv6 learning flooding vlan_deletion"
 NUM_NETIFS=4
 CHECK_TC="yes"
 source lib.sh
@@ -96,6 +96,19 @@ flooding()
 	flood_test $swp2 $h1 $h2
 }
 
+vlan_deletion()
+{
+	# Test that the deletion of a VLAN on a bridge port does not affect
+	# the PVID VLAN
+	log_info "Add and delete a VLAN on bridge port $swp1"
+
+	bridge vlan add vid 10 dev $swp1
+	bridge vlan del vid 10 dev $swp1
+
+	ping_ipv4
+	ping_ipv6
+}
+
 trap cleanup EXIT
 
 setup_prepare
-- 
2.19.1

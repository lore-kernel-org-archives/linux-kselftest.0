From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:25 +0000
Subject: [PATCH net-next 16/18] selftests: forwarding:
 vxlan_bridge_1d_port_8472: New test
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-17-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

This simple wrapper reruns the VXLAN ping test with a port number of
8472.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../net/forwarding/vxlan_bridge_1d_port_8472.sh        | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100755 tools/testing/selftests/net/forwarding/vxlan_bridge_1d_port_8472.sh

diff --git a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d_port_8472.sh b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d_port_8472.sh
new file mode 100755
index 000000000000..3bf3da69195f
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d_port_8472.sh
@@ -0,0 +1,10 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# A wrapper to run VXLAN tests with an unusual port number.
+
+VXPORT=8472
+ALL_TESTS="
+	ping_ipv4
+"
+source vxlan_bridge_1d.sh
-- 
2.19.1

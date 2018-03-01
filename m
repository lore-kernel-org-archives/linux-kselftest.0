From: dsahern at gmail.com (David Ahern)
Date: Thu,  1 Mar 2018 13:49:30 -0800
Subject: [PATCH v2 net-next 1/4] selftests: forwarding: Only check tc version
 for tc tests
In-Reply-To: <20180301214933.20199-1-dsahern@gmail.com>
References: <20180301214933.20199-1-dsahern@gmail.com>
Message-ID: <20180301214933.20199-2-dsahern@gmail.com>

Capabilities of tc command are irrelevant for router tests:
    $ ./router.sh
    SKIP: iproute2 too old, missing shared block support

Add a CHECK_TC flag and only check tc capabilities if set. Add flag to
tc_common.sh and have it sourced before lib.sh

Also, if the command lacks some feature the test should exit non-0.

Signed-off-by: David Ahern <dsahern at gmail.com>
---
 .../selftests/net/forwarding/bridge_vlan_aware.sh  |  1 +
 tools/testing/selftests/net/forwarding/lib.sh      | 29 ++++++++++++++--------
 .../testing/selftests/net/forwarding/tc_actions.sh |  2 +-
 .../testing/selftests/net/forwarding/tc_chains.sh  |  2 +-
 .../testing/selftests/net/forwarding/tc_common.sh  |  2 ++
 .../testing/selftests/net/forwarding/tc_flower.sh  |  2 +-
 .../selftests/net/forwarding/tc_shblocks.sh        |  2 +-
 7 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
index 651998e70557..75d922438bc9 100755
--- a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 NUM_NETIFS=4
+CHECK_TC="yes"
 source lib.sh
 
 h1_create()
diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 23866a685f77..d0af52109360 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -19,26 +19,33 @@ fi
 ##############################################################################
 # Sanity checks
 
+check_tc_version()
+{
+	tc -j &> /dev/null
+	if [[ $? -ne 0 ]]; then
+		echo "SKIP: iproute2 too old; tc is missing JSON support"
+		exit 1
+	fi
+
+	tc filter help 2>&1 | grep block &> /dev/null
+	if [[ $? -ne 0 ]]; then
+		echo "SKIP: iproute2 too old; tc is missing shared block support"
+		exit 1
+	fi
+}
+
 if [[ "$(id -u)" -ne 0 ]]; then
 	echo "SKIP: need root privileges"
 	exit 0
 fi
 
-tc -j &> /dev/null
-if [[ $? -ne 0 ]]; then
-	echo "SKIP: iproute2 too old, missing JSON support"
-	exit 0
-fi
-
-tc filter help 2>&1 | grep block &> /dev/null
-if [[ $? -ne 0 ]]; then
-	echo "SKIP: iproute2 too old, missing shared block support"
-	exit 0
+if [[ "$CHECK_TC" = "yes" ]]; then
+	check_tc_version
 fi
 
 if [[ ! -x "$(command -v jq)" ]]; then
 	echo "SKIP: jq not installed"
-	exit 0
+	exit 1
 fi
 
 if [[ ! -x "$(command -v $MZ)" ]]; then
diff --git a/tools/testing/selftests/net/forwarding/tc_actions.sh b/tools/testing/selftests/net/forwarding/tc_actions.sh
index 84234317a25d..8ab5cf0a960b 100755
--- a/tools/testing/selftests/net/forwarding/tc_actions.sh
+++ b/tools/testing/selftests/net/forwarding/tc_actions.sh
@@ -2,8 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 NUM_NETIFS=4
-source lib.sh
 source tc_common.sh
+source lib.sh
 
 tcflags="skip_hw"
 
diff --git a/tools/testing/selftests/net/forwarding/tc_chains.sh b/tools/testing/selftests/net/forwarding/tc_chains.sh
index 94c114ad8b44..2fd15226974b 100755
--- a/tools/testing/selftests/net/forwarding/tc_chains.sh
+++ b/tools/testing/selftests/net/forwarding/tc_chains.sh
@@ -2,8 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 NUM_NETIFS=2
-source lib.sh
 source tc_common.sh
+source lib.sh
 
 tcflags="skip_hw"
 
diff --git a/tools/testing/selftests/net/forwarding/tc_common.sh b/tools/testing/selftests/net/forwarding/tc_common.sh
index acd0b520241c..9d3b64a2a264 100644
--- a/tools/testing/selftests/net/forwarding/tc_common.sh
+++ b/tools/testing/selftests/net/forwarding/tc_common.sh
@@ -1,6 +1,8 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 
+CHECK_TC="yes"
+
 tc_check_packets()
 {
 	local id=$1
diff --git a/tools/testing/selftests/net/forwarding/tc_flower.sh b/tools/testing/selftests/net/forwarding/tc_flower.sh
index 026a4ea4b2fb..032b882adfc0 100755
--- a/tools/testing/selftests/net/forwarding/tc_flower.sh
+++ b/tools/testing/selftests/net/forwarding/tc_flower.sh
@@ -2,8 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 NUM_NETIFS=2
-source lib.sh
 source tc_common.sh
+source lib.sh
 
 tcflags="skip_hw"
 
diff --git a/tools/testing/selftests/net/forwarding/tc_shblocks.sh b/tools/testing/selftests/net/forwarding/tc_shblocks.sh
index cfc8a2ace388..077b98048ef4 100755
--- a/tools/testing/selftests/net/forwarding/tc_shblocks.sh
+++ b/tools/testing/selftests/net/forwarding/tc_shblocks.sh
@@ -2,8 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 NUM_NETIFS=4
-source lib.sh
 source tc_common.sh
+source lib.sh
 
 tcflags="skip_hw"
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: dsahern at gmail.com (David Ahern)
Date: Thu,  1 Mar 2018 11:09:44 -0800
Subject: [PATCH net-next 2/5] selftests: forwarding: Only check for mz when it
 is needed
In-Reply-To: <20180301190947.7299-1-dsahern@gmail.com>
References: <20180301190947.7299-1-dsahern@gmail.com>
Message-ID: <20180301190947.7299-3-dsahern@gmail.com>

Add a CHECK_MZ flag and only check if mz exists when flag is set.
If it does not exist, exit non-0.

Signed-off-by: David Ahern <dsahern at gmail.com>
---
 tools/testing/selftests/net/forwarding/lib.sh              | 8 +++++---
 tools/testing/selftests/net/forwarding/router_multipath.sh | 1 +
 tools/testing/selftests/net/forwarding/tc_common.sh        | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index d0af52109360..f21b3ac11d27 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -48,9 +48,11 @@ if [[ ! -x "$(command -v jq)" ]]; then
 	exit 1
 fi
 
-if [[ ! -x "$(command -v $MZ)" ]]; then
-	echo "SKIP: $MZ not installed"
-	exit 0
+if [[ "$CHECK_MZ" = "yes" ]]; then
+	if [[ ! -x "$(command -v $MZ)" ]]; then
+		echo "SKIP: $MZ not installed"
+		exit 1
+	fi
 fi
 
 if [[ ! -v NUM_NETIFS ]]; then
diff --git a/tools/testing/selftests/net/forwarding/router_multipath.sh b/tools/testing/selftests/net/forwarding/router_multipath.sh
index d31888e3133e..d40016443272 100755
--- a/tools/testing/selftests/net/forwarding/router_multipath.sh
+++ b/tools/testing/selftests/net/forwarding/router_multipath.sh
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 NUM_NETIFS=8
+CHECK_MZ="yes"
 source lib.sh
 
 h1_create()
diff --git a/tools/testing/selftests/net/forwarding/tc_common.sh b/tools/testing/selftests/net/forwarding/tc_common.sh
index 9d3b64a2a264..d93cd7599bc1 100644
--- a/tools/testing/selftests/net/forwarding/tc_common.sh
+++ b/tools/testing/selftests/net/forwarding/tc_common.sh
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 CHECK_TC="yes"
+CHECK_MZ="yes"
 
 tc_check_packets()
 {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

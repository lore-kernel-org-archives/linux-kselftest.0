From: petrm at mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:46:05 +0200
Subject: [PATCH net-next 03/13] selftests: forwarding: lib: Parameterize
 NUM_NETIFS in two functions
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID: <d8b28a09db684d9e247759c794c9a2a5571a257c.1530319109.git.petrm@mellanox.com>

setup_wait() and tc_offload_check() both assume that all NUM_NETIFS
interfaces are relevant for a given test. However, the scale test script
acts as an umbrella for a number of sub-tests, some of which may not
require all the interfaces.

Thus it's suboptimal for tc_offload_check() to query all the interfaces.
In case of setup_wait() it's incorrect, because the sub-test in question
of course doesn't configure any interfaces beyond what it needs, and
setup_wait() then ends up waiting indefinitely for the extraneous
interfaces to come up.

For that reason, give setup_wait() and tc_offload_check() an optional
parameter with a number of interfaces to probe. Fall back to global
NUM_NETIFS if the parameter is not given.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Yuval Mintz <yuvalm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 5f4b7ed2c65a..e073918bbe15 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -220,7 +220,9 @@ setup_wait_dev()
 
 setup_wait()
 {
-	for i in $(eval echo {1..$NUM_NETIFS}); do
+	local num_netifs=${1:-$NUM_NETIFS}
+
+	for ((i = 1; i <= num_netifs; ++i)); do
 		setup_wait_dev ${NETIFS[p$i]}
 	done
 
@@ -481,7 +483,9 @@ forwarding_restore()
 
 tc_offload_check()
 {
-	for i in $(eval echo {1..$NUM_NETIFS}); do
+	local num_netifs=${1:-$NUM_NETIFS}
+
+	for ((i = 1; i <= num_netifs; ++i)); do
 		ethtool -k ${NETIFS[p$i]} \
 			| grep "hw-tc-offload: on" &> /dev/null
 		if [[ $? -ne 0 ]]; then
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

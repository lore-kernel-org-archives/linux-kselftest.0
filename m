From: petrm at mellanox.com (Petr Machata)
Date: Thu, 28 Jun 2018 18:56:20 +0200
Subject: [PATCH net-next 1/4] selftests: forwarding: lib: Split out
 setup_wait_dev()
In-Reply-To: <cover.1530204784.git.petrm@mellanox.com>
References: <cover.1530204784.git.petrm@mellanox.com>
Message-ID: <141750f970e14c36b70c86bc67cf2ed952eb61ab.1530204784.git.petrm@mellanox.com>

Split out of setup_wait() a function setup_wait_dev() that waits for a
single device. This gives tests the opportunity to wait for a selected
device after they tinkered with its upness.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 1dfdf14894e2..ac1df4860fbe 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -185,18 +185,25 @@ log_info()
 	echo "INFO: $msg"
 }
 
+setup_wait_dev()
+{
+	local dev=$1; shift
+
+	while true; do
+		ip link show dev $dev up \
+			| grep 'state UP' &> /dev/null
+		if [[ $? -ne 0 ]]; then
+			sleep 1
+		else
+			break
+		fi
+	done
+}
+
 setup_wait()
 {
 	for i in $(eval echo {1..$NUM_NETIFS}); do
-		while true; do
-			ip link show dev ${NETIFS[p$i]} up \
-				| grep 'state UP' &> /dev/null
-			if [[ $? -ne 0 ]]; then
-				sleep 1
-			else
-				break
-			fi
-		done
+		setup_wait_dev ${NETIFS[p$i]}
 	done
 
 	# Make sure links are ready.
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

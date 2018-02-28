From: idosch@mellanox.com (Ido Schimmel)
Date: Wed, 28 Feb 2018 12:25:13 +0200
Subject: [PATCH net-next v2 08/14] selftests: forwarding: Add tc offload check
 helper
In-Reply-To: <20180228102519.4156-1-idosch@mellanox.com>
References: <20180228102519.4156-1-idosch@mellanox.com>
Message-ID: <20180228102519.4156-9-idosch@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180228102513.yztErfyZk1pZpxoFBwpFe1M-QVRxXLcDEwJqO85Rxxk@z>

From: Jiri Pirko <jiri@mellanox.com>

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 6866f4a4bc4e..92e46426bd1d 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -296,6 +296,19 @@ forwarding_restore()
        sysctl -q -w net.ipv4.conf.all.forwarding=$ipv4_fwd
 }
 
+tc_offload_check()
+{
+	for i in $(eval echo {1..$NUM_NETIFS}); do
+		ethtool -k ${NETIFS[p$i]} \
+			| grep "hw-tc-offload: on" &> /dev/null
+		if [[ $? -ne 0 ]]; then
+			return 1
+		fi
+	done
+
+	return 0
+}
+
 ##############################################################################
 # Tests
 
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

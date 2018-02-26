From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 26 Feb 2018 10:59:42 +0200
Subject: [PATCH net-next 08/14] selftests: forwarding: Add tc offload check
 helper
In-Reply-To: <20180226085948.19368-1-idosch@mellanox.com>
References: <20180226085948.19368-1-idosch@mellanox.com>
Message-ID: <20180226085948.19368-9-idosch@mellanox.com>

From: Jiri Pirko <jiri at mellanox.com>

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index b601f6ad9630..141dd33bf6c4 100644
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

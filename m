From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 15 Jan 2018 21:18:49 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 08/12] selftests:
	forwarding: Add tc offload check helper
In-Reply-To: <20180115191853.26129-1-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
Message-ID: <20180115191853.26129-9-idosch@mellanox.com>

From: Jiri Pirko <jiri at mellanox.com>

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/forwarding/lib.sh | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
index b814b5350378..346ec4283953 100644
--- a/tools/testing/selftests/forwarding/lib.sh
+++ b/tools/testing/selftests/forwarding/lib.sh
@@ -198,6 +198,19 @@ forwarding_restore()
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
 ### Tests ###
 
 ping_test()
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

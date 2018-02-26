From: idosch@mellanox.com (Ido Schimmel)
Date: Mon, 26 Feb 2018 10:59:43 +0200
Subject: [PATCH net-next 09/14] selftests: forwarding: Add MAC get helper
In-Reply-To: <20180226085948.19368-1-idosch@mellanox.com>
References: <20180226085948.19368-1-idosch@mellanox.com>
Message-ID: <20180226085948.19368-10-idosch@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180226085943.fP4Yg-U53wIDoHwHO7nnGMsWhLqIkTH87IhRHoDjt8Y@z>

From: Jiri Pirko <jiri@mellanox.com>

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 141dd33bf6c4..9129a30df3b9 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -270,6 +270,13 @@ link_stats_tx_packets_get()
        ip -j -s link show dev $if_name | jq '.[]["stats64"]["tx"]["packets"]'
 }
 
+mac_get()
+{
+	local if_name=$1
+
+	ip -j link show dev $if_name | jq -r '.[]["address"]'
+}
+
 bridge_ageing_time_get()
 {
 	local ageing_time
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

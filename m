From: idosch@mellanox.com (Ido Schimmel)
Date: Mon, 15 Jan 2018 21:18:50 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 09/12] selftests:
	forwarding: Add MAC get helper
In-Reply-To: <20180115191853.26129-1-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
Message-ID: <20180115191853.26129-10-idosch@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180115191850._y1ZUHrkNh0O-w7TM9__5bY-6MTJ1PgDujlhDJqqfFo@z>

From: Jiri Pirko <jiri@mellanox.com>

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/forwarding/lib.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
index 346ec4283953..ddc3ef77f21d 100644
--- a/tools/testing/selftests/forwarding/lib.sh
+++ b/tools/testing/selftests/forwarding/lib.sh
@@ -172,6 +172,13 @@ link_stats_tx_packets_get()
        ip -j -s link show dev $if_name | jq '.[]["stats644"]["tx"]["packets"]'
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

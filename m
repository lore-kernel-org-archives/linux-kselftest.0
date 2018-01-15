From: idosch@mellanox.com (Ido Schimmel)
Date: Mon, 15 Jan 2018 21:18:51 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 10/12] selftests:
	forwarding: Allow to get netdev interfaces names from commandline
In-Reply-To: <20180115191853.26129-1-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
Message-ID: <20180115191853.26129-11-idosch@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180115191851.oCRmseoAiA7CQgJCXLvXCRJOTqR93TC-ajpX5mMmTWs@z>

From: Jiri Pirko <jiri@mellanox.com>

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/forwarding/lib.sh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
index ddc3ef77f21d..85dbbe83a243 100644
--- a/tools/testing/selftests/forwarding/lib.sh
+++ b/tools/testing/selftests/forwarding/lib.sh
@@ -34,6 +34,20 @@ fi
 
 source forwarding.config
 
+# Load netdev names from command line
+
+count=0
+
+while [[ $# -gt 0 ]]; do
+	if [[ "$count" -eq "0" ]]; then
+		unset NETIFS
+		declare -A NETIFS
+	fi
+	count=$((count + 1))
+	NETIFS[p$count]="$1"
+	shift
+done
+
 for i in $(eval echo {1..$NUM_NETIFS}); do
 	ip link show dev ${NETIFS[p$i]} &> /dev/null
 	if [[ $? -ne 0 ]]; then
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

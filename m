From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 26 Feb 2018 10:59:44 +0200
Subject: [PATCH net-next 10/14] selftests: forwarding: Allow to get netdev
 interfaces names from commandline
In-Reply-To: <20180226085948.19368-1-idosch@mellanox.com>
References: <20180226085948.19368-1-idosch@mellanox.com>
Message-ID: <20180226085948.19368-11-idosch@mellanox.com>

From: Jiri Pirko <jiri at mellanox.com>

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 9129a30df3b9..d666b743047d 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -45,6 +45,21 @@ if [[ ! -v NUM_NETIFS ]]; then
 	exit 0
 fi
 
+##############################################################################
+# Command line options handling
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
 ##############################################################################
 # Network interfaces configuration
 
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

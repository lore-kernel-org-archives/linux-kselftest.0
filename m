From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 15 Jan 2018 21:18:52 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 11/12] selftests:
	forwarding: Allow to pass commandline options
In-Reply-To: <20180115191853.26129-1-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
Message-ID: <20180115191853.26129-12-idosch@mellanox.com>

From: Jiri Pirko <jiri at mellanox.com>

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/forwarding/lib.sh | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
index 85dbbe83a243..b9b049af93cb 100644
--- a/tools/testing/selftests/forwarding/lib.sh
+++ b/tools/testing/selftests/forwarding/lib.sh
@@ -34,17 +34,23 @@ fi
 
 source forwarding.config
 
-# Load netdev names from command line
+# Load options and netdev names from command line
 
 count=0
 
 while [[ $# -gt 0 ]]; do
-	if [[ "$count" -eq "0" ]]; then
-		unset NETIFS
-		declare -A NETIFS
+	echo $1 | grep "=" &> /dev/null
+	if [[ $? -eq 0 ]]; then
+		splitarr=(${1//=/ })
+		OPTIONS[${splitarr[0]}]=${splitarr[1]}
+	else
+		if [[ "$count" -eq "0" ]]; then
+			unset NETIFS
+			declare -A NETIFS
+		fi
+		count=$((count + 1))
+		NETIFS[p$count]="$1"
 	fi
-	count=$((count + 1))
-	NETIFS[p$count]="$1"
 	shift
 done
 
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

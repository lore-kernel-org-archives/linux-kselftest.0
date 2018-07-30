From: petrm@mellanox.com (Petr Machata)
Date: Mon, 30 Jul 2018 16:39:46 +0200
Subject: [PATCH net-next 1/5] selftests: forwarding: lib: Add require_command()
In-Reply-To: <cover.1532961216.git.petrm@mellanox.com>
References: <cover.1532961216.git.petrm@mellanox.com>
Message-ID:
 <1e938f8458821359f085a0815df487581b0da159.1532961216.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180730143946.7gq1UDLk1NiZpz7RKbzlhW43oQq6rtX3Q9ub03i1W1Q@z>

The logic for testing whether a certain command is available is used
several times in the current code base. The tests in follow-up patches
add more requirements like that.

Therefore extract the logic into a named function, require_command(),
that can be used directly from lib.sh as well as from any test that
wishes to declare dependence on some command.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 158d59ffee40..81e36157bf16 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -62,15 +62,18 @@ if [[ "$CHECK_TC" = "yes" ]]; then
 	check_tc_version
 fi
 
-if [[ ! -x "$(command -v jq)" ]]; then
-	echo "SKIP: jq not installed"
-	exit 1
-fi
+require_command()
+{
+	local cmd=$1; shift
 
-if [[ ! -x "$(command -v $MZ)" ]]; then
-	echo "SKIP: $MZ not installed"
-	exit 1
-fi
+	if [[ ! -x "$(command -v "$cmd")" ]]; then
+		echo "SKIP: $cmd not installed"
+		exit 1
+	fi
+}
+
+require_command jq
+require_command $MZ
 
 if [[ ! -v NUM_NETIFS ]]; then
 	echo "SKIP: importer does not define \"NUM_NETIFS\""
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

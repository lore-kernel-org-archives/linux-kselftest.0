From: petrm@mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:45:19 +0200
Subject: [PATCH net-next 01/13] selftests: forwarding: Allow lib.sh sourcing
 from other directories
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID:
 <4ca9cb980b67e44afc16d638c06329ab817ce6e3.1530319109.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180630004519.no88I2V0eqiAcyRTAkSbr9BmBcrkBpfwRovZVfCDsrE@z>

From: Yuval Mintz <yuvalm@mellanox.com>

The devlink related scripts are mlxsw-specific. As a result, they'll
reside in a different directory - but would still need the common logic
implemented in lib.sh.
So as a preliminary step, allow lib.sh to be sourced from other
directories as well.

Signed-off-by: Yuval Mintz <yuvalm at mellanox.com>
Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index d1f14f83979e..59272824ef37 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -14,8 +14,13 @@ PAUSE_ON_CLEANUP=${PAUSE_ON_CLEANUP:=no}
 NETIF_TYPE=${NETIF_TYPE:=veth}
 NETIF_CREATE=${NETIF_CREATE:=yes}
 
-if [[ -f forwarding.config ]]; then
-	source forwarding.config
+relative_path="${BASH_SOURCE%/*}"
+if [[ "$relative_path" == "${BASH_SOURCE}" ]]; then
+	relative_path="."
+fi
+
+if [[ -f $relative_path/forwarding.config ]]; then
+	source "$relative_path/forwarding.config"
 fi
 
 ##############################################################################
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

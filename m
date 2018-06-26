From: petrm@mellanox.com (Petr Machata)
Date: Tue, 26 Jun 2018 02:07:45 +0200
Subject: [PATCH net-next 3/6] selftests: forwarding: tc_rule_stats_get:
 Parameterize direction
In-Reply-To: <cover.1529971148.git.petrm@mellanox.com>
References: <cover.1529971148.git.petrm@mellanox.com>
Message-ID:
 <53efc91c8ae4eebef123adc9c597b3cc3ecffb99.1529971148.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626000745.RxjnSVarAw6peAjVsOyuAPYxnTSX6aenYTysmE5Bwiw@z>

The GRE multipath tests need stats on an egress counter. Change
tc_rule_stats_get() to take direction as an optional argument, with
default of ingress.

Take the opportunity to change line continuation character from | to \.
Move the | to the next line, which indent.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 911d753c4ff0..f94ea4bafa13 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -383,9 +383,10 @@ tc_rule_stats_get()
 {
 	local dev=$1; shift
 	local pref=$1; shift
+	local dir=$1; shift
 
-	tc -j -s filter show dev $dev ingress pref $pref |
-	jq '.[1].options.actions[].stats.packets'
+	tc -j -s filter show dev $dev ${dir:-ingress} pref $pref \
+	    | jq '.[1].options.actions[].stats.packets'
 }
 
 mac_get()
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

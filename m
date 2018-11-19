From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:11 +0000
Subject: [PATCH net-next 04/18] selftests: forwarding: ping{6,}_test(): Add
 description argument
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-5-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

Have ping_test() recognize an optional argument with a description of
the test. This is handy if there are several ping test, to make it clear
which is which.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 93d6e9df483e..fa734ddce2e9 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -813,7 +813,7 @@ ping_test()
 
 	ping_do $1 $2
 	check_err $?
-	log_test "ping"
+	log_test "ping$3"
 }
 
 ping6_do()
@@ -832,7 +832,7 @@ ping6_test()
 
 	ping6_do $1 $2
 	check_err $?
-	log_test "ping6"
+	log_test "ping6$3"
 }
 
 learning_test()
-- 
2.19.1

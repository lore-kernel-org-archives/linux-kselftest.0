From: marcelo.cerri at canonical.com (Marcelo Henrique Cerri)
Date: Wed, 30 Jan 2019 16:19:03 -0200
Subject: [PATCH] selftests: net: fix "from" match test in fib_rule_tests.sh
Message-ID: <20190130181903.16465-1-marcelo.cerri@canonical.com>

Fix the IPv4 address of the dummy0 interface and ensure that ip_forward
is enabled in the network space to get a valid response when checking
for routes between the gateway and other hosts.

Signed-off-by: Marcelo Henrique Cerri <marcelo.cerri at canonical.com>
---
 tools/testing/selftests/net/fib_rule_tests.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/fib_rule_tests.sh b/tools/testing/selftests/net/fib_rule_tests.sh
index d4cfb6a7a086..552a9784e759 100755
--- a/tools/testing/selftests/net/fib_rule_tests.sh
+++ b/tools/testing/selftests/net/fib_rule_tests.sh
@@ -54,9 +54,11 @@ setup()
 
 	$IP link add dummy0 type dummy
 	$IP link set dev dummy0 up
-	$IP address add 198.51.100.1/24 dev dummy0
+	$IP address add 192.51.100.1/24 dev dummy0
 	$IP -6 address add 2001:db8:1::1/64 dev dummy0
 
+	ip netns exec testns sysctl -w net.ipv4.ip_forward=1
+
 	set +e
 }
 
-- 
2.17.1

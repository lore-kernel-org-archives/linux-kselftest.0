From: cascardo at canonical.com (Thadeu Lima de Souza Cascardo)
Date: Fri, 22 Feb 2019 07:27:41 -0300
Subject: [PATCH] selftests: fib_tests: sleep after changing carrier. again.
Message-ID: <20190222102741.31173-1-cascardo@canonical.com>

Just like commit e2ba732a1681 ("selftests: fib_tests: sleep after
changing carrier"), wait one second to allow linkwatch to propagate the
carrier change to the stack.

There are two sets of carrier tests. The first slept after the carrier
was set to off, and when the second set ran, it was likely that the
linkwatch would be able to run again without much delay, reducing the
likelihood of a race. However, if you run 'fib_tests.sh -t carrier' on a
loop, you will quickly notice the failures.

Sleeping on the second set of tests make the failures go away.

Cc: David Ahern <dsahern at gmail.com>
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo at canonical.com>
---
 tools/testing/selftests/net/fib_tests.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index 802b4af18729..1080ff55a788 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -388,6 +388,7 @@ fib_carrier_unicast_test()
 
 	set -e
 	$IP link set dev dummy0 carrier off
+	sleep 1
 	set +e
 
 	echo "    Carrier down"
-- 
2.20.1

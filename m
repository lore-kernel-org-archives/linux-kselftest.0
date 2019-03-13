From: sashal at kernel.org (Sasha Levin)
Date: Wed, 13 Mar 2019 15:12:50 -0400
Subject: [PATCH AUTOSEL 4.19 48/48] selftests: fib_tests: sleep after changing
 carrier. again.
In-Reply-To: <20190313191250.158955-1-sashal@kernel.org>
References: <20190313191250.158955-1-sashal@kernel.org>
Message-ID: <20190313191250.158955-48-sashal@kernel.org>

From: Thadeu Lima de Souza Cascardo <cascardo at canonical.com>

[ Upstream commit af548a27b158d548d41e56255e6eaca1658cc3be ]

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
Reviewed-by: David Ahern <dsahern at gmail.com>
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/net/fib_tests.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index 0f45633bd634..a4ccde0e473b 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -385,6 +385,7 @@ fib_carrier_unicast_test()
 
 	set -e
 	$IP link set dev dummy0 carrier off
+	sleep 1
 	set +e
 
 	echo "    Carrier down"
-- 
2.19.1

From: sashal at kernel.org (Sasha Levin)
Date: Tue,  4 Jun 2019 19:21:50 -0400
Subject: [PATCH AUTOSEL 5.1 40/60] selftests: fib_rule_tests: fix local IPv4
 address typo
In-Reply-To: <20190604232212.6753-1-sashal@kernel.org>
References: <20190604232212.6753-1-sashal@kernel.org>
Message-ID: <20190604232212.6753-40-sashal@kernel.org>

From: Hangbin Liu <liuhangbin at gmail.com>

[ Upstream commit fc82d93e57e3d41f79eff19031588b262fc3d0b6 ]

The IPv4 testing address are all in 192.51.100.0 subnet. It doesn't make
sense to set a 198.51.100.1 local address. Should be a typo.

Fixes: 65b2b4939a64 ("selftests: net: initial fib rule tests")
Signed-off-by: Hangbin Liu <liuhangbin at gmail.com>
Reviewed-by: David Ahern <dsahern at gmail.com>
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/net/fib_rule_tests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/fib_rule_tests.sh b/tools/testing/selftests/net/fib_rule_tests.sh
index 4b7e107865bf..1ba069967fa2 100755
--- a/tools/testing/selftests/net/fib_rule_tests.sh
+++ b/tools/testing/selftests/net/fib_rule_tests.sh
@@ -55,7 +55,7 @@ setup()
 
 	$IP link add dummy0 type dummy
 	$IP link set dev dummy0 up
-	$IP address add 198.51.100.1/24 dev dummy0
+	$IP address add 192.51.100.1/24 dev dummy0
 	$IP -6 address add 2001:db8:1::1/64 dev dummy0
 
 	set +e
-- 
2.20.1

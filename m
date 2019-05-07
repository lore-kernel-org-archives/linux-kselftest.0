From: sashal at kernel.org (Sasha Levin)
Date: Tue,  7 May 2019 01:32:07 -0400
Subject: [PATCH AUTOSEL 5.0 73/99] selftests/net: correct the return value for
 run_afpackettests
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
Message-ID: <20190507053235.29900-73-sashal@kernel.org>

From: Po-Hsu Lin <po-hsu.lin at canonical.com>

[ Upstream commit 8c03557c3f25271e62e39154af66ebdd1b59c9ca ]

The run_afpackettests will be marked as passed regardless the return
value of those sub-tests in the script:
    --------------------
    running psock_tpacket test
    --------------------
    [FAIL]
    selftests: run_afpackettests [PASS]

Fix this by changing the return value for each tests.

Signed-off-by: Po-Hsu Lin <po-hsu.lin at canonical.com>
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/net/run_afpackettests | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/net/run_afpackettests b/tools/testing/selftests/net/run_afpackettests
index 2dc95fda7ef7..ea5938ec009a 100755
--- a/tools/testing/selftests/net/run_afpackettests
+++ b/tools/testing/selftests/net/run_afpackettests
@@ -6,12 +6,14 @@ if [ $(id -u) != 0 ]; then
 	exit 0
 fi
 
+ret=0
 echo "--------------------"
 echo "running psock_fanout test"
 echo "--------------------"
 ./in_netns.sh ./psock_fanout
 if [ $? -ne 0 ]; then
 	echo "[FAIL]"
+	ret=1
 else
 	echo "[PASS]"
 fi
@@ -22,6 +24,7 @@ echo "--------------------"
 ./in_netns.sh ./psock_tpacket
 if [ $? -ne 0 ]; then
 	echo "[FAIL]"
+	ret=1
 else
 	echo "[PASS]"
 fi
@@ -32,6 +35,8 @@ echo "--------------------"
 ./in_netns.sh ./txring_overwrite
 if [ $? -ne 0 ]; then
 	echo "[FAIL]"
+	ret=1
 else
 	echo "[PASS]"
 fi
+exit $ret
-- 
2.20.1

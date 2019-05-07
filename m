From: sashal@kernel.org (Sasha Levin)
Date: Tue,  7 May 2019 01:32:06 -0400
Subject: [PATCH AUTOSEL 5.0 72/99] selftests/net: correct the return value for
 run_netsocktests
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
Message-ID: <20190507053235.29900-72-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507053206.Tdi3BSmTliR8UheY2kQkHIIt3xGWP-fhuf3hQH6CoBo@z>

From: Po-Hsu Lin <po-hsu.lin@canonical.com>

[ Upstream commit 30c04d796b693e22405c38e9b78e9a364e4c77e6 ]

The run_netsocktests will be marked as passed regardless the actual test
result from the ./socket:

    selftests: net: run_netsocktests
    ========================================
    --------------------
    running socket test
    --------------------
    [FAIL]
    ok 1..6 selftests: net: run_netsocktests [PASS]

This is because the test script itself has been successfully executed.
Fix this by exit 1 when the test failed.

Signed-off-by: Po-Hsu Lin <po-hsu.lin at canonical.com>
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/net/run_netsocktests | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/run_netsocktests b/tools/testing/selftests/net/run_netsocktests
index b093f39c298c..14e41faf2c57 100755
--- a/tools/testing/selftests/net/run_netsocktests
+++ b/tools/testing/selftests/net/run_netsocktests
@@ -7,7 +7,7 @@ echo "--------------------"
 ./socket
 if [ $? -ne 0 ]; then
 	echo "[FAIL]"
+	exit 1
 else
 	echo "[PASS]"
 fi
-
-- 
2.20.1

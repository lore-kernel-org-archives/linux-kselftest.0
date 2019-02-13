From: sashal at kernel.org (Sasha Levin)
Date: Tue, 12 Feb 2019 21:36:43 -0500
Subject: [PATCH AUTOSEL 4.19 65/83] selftests: tc-testing: fix tunnel_key
 failure if dst_port is unspecified
In-Reply-To: <20190213023701.20286-1-sashal@kernel.org>
References: <20190213023701.20286-1-sashal@kernel.org>
Message-ID: <20190213023701.20286-65-sashal@kernel.org>

From: Davide Caratti <dcaratti at redhat.com>

[ Upstream commit 5216bd77798e2ed773ecd45f3f368dcaec63e5dd ]

After commit 1c25324caf82 ("net/sched: act_tunnel_key: Don't dump dst port
if it wasn't set"), act_tunnel_key doesn't dump anymore the destination
port, unless it was explicitly configured. This caused systematic failures
in the following TDC test case:

 7a88 - Add tunnel_key action with cookie parameter

Avoid matching zero values of TCA_TUNNEL_KEY_ENC_DST_PORT to let the test
pass again.

Signed-off-by: Davide Caratti <dcaratti at redhat.com>
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 .../selftests/tc-testing/tc-tests/actions/tunnel_key.json       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/tunnel_key.json b/tools/testing/selftests/tc-testing/tc-tests/actions/tunnel_key.json
index af5e99d27229..e7e15a7336b6 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/tunnel_key.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/tunnel_key.json
@@ -605,7 +605,7 @@
         "cmdUnderTest": "$TC actions add action tunnel_key set src_ip 10.10.10.1 dst_ip 10.10.10.2 id 7 index 4 cookie aa11bb22cc33dd44ee55ff66aa11b1b2",
         "expExitCode": "0",
         "verifyCmd": "$TC actions get action tunnel_key index 4",
-        "matchPattern": "action order [0-9]+: tunnel_key.*set.*src_ip 10.10.10.1.*dst_ip 10.10.10.2.*key_id 7.*dst_port 0.*csum pipe.*index 4 ref.*cookie aa11bb22cc33dd44ee55ff66aa11b1b2",
+        "matchPattern": "action order [0-9]+: tunnel_key.*set.*src_ip 10.10.10.1.*dst_ip 10.10.10.2.*key_id 7.*csum pipe.*index 4 ref.*cookie aa11bb22cc33dd44ee55ff66aa11b1b2",
         "matchCount": "1",
         "teardown": [
             "$TC actions flush action tunnel_key"
-- 
2.19.1

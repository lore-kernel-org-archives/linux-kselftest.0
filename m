From: sashal at kernel.org (Sasha Levin)
Date: Tue, 12 Feb 2019 21:36:42 -0500
Subject: [PATCH AUTOSEL 4.19 64/83] selftests: tc-testing: drop test on
 missing tunnel key id
In-Reply-To: <20190213023701.20286-1-sashal@kernel.org>
References: <20190213023701.20286-1-sashal@kernel.org>
Message-ID: <20190213023701.20286-64-sashal@kernel.org>

From: Davide Caratti <dcaratti at redhat.com>

[ Upstream commit e413615502a3324daba038f529932ba9a5248af0 ]

After merge of commit 80ef0f22ceda ("net/sched: act_tunnel_key: Allow
key-less tunnels"), act_tunnel_key does not reject anymore requests to
install 'set' rules where the key id is missing. Therefore, drop the
following TDC testcase:

 ba4e - Add tunnel_key set action with missing mandatory id parameter

because it's going to become a systematic fail as soon as userspace
iproute2 will start supporting key-less tunnels.

Signed-off-by: Davide Caratti <dcaratti at redhat.com>
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 .../tc-tests/actions/tunnel_key.json          | 29 -------------------
 1 file changed, 29 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/tunnel_key.json b/tools/testing/selftests/tc-testing/tc-tests/actions/tunnel_key.json
index 10b2d894e436..af5e99d27229 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/actions/tunnel_key.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/actions/tunnel_key.json
@@ -81,35 +81,6 @@
 	    ]
         ]
     },
-    {
-        "id": "ba4e",
-        "name": "Add tunnel_key set action with missing mandatory id parameter",
-        "category": [
-            "actions",
-            "tunnel_key"
-        ],
-        "setup": [
-            [
-                "$TC actions flush action tunnel_key",
-                0,
-                1,
-                255
-            ]
-        ],
-        "cmdUnderTest": "$TC actions add action tunnel_key set src_ip 10.10.10.1 dst_ip 20.20.20.2",
-        "expExitCode": "255",
-        "verifyCmd": "$TC actions list action tunnel_key",
-        "matchPattern": "action order [0-9]+: tunnel_key set.*src_ip 10.10.10.1.*dst_ip 20.20.20.2",
-        "matchCount": "0",
-        "teardown": [
-	    [
-		"$TC actions flush action tunnel_key",
-		0,
-		1,
-		255
-	    ]
-        ]
-    },
     {
         "id": "a5e0",
         "name": "Add tunnel_key set action with invalid src_ip parameter",
-- 
2.19.1

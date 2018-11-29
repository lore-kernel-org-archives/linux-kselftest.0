From: sashal at kernel.org (Sasha Levin)
Date: Thu, 29 Nov 2018 00:55:26 -0500
Subject: [PATCH AUTOSEL 4.19 35/68] tc-testing: tdc.py: ignore errors when
 decoding stdout/stderr
In-Reply-To: <20181129055559.159228-1-sashal@kernel.org>
References: <20181129055559.159228-1-sashal@kernel.org>
Message-ID: <20181129055559.159228-35-sashal@kernel.org>

From: Lucas Bates <lucasb at mojatatu.com>

[ Upstream commit 5aaf6428526bcad98d6f51f2f679c919bb75d7e9 ]

Prevent exceptions from being raised while decoding output
from an executed command. There is no impact on tdc's
execution and the verify command phase would fail the pattern
match.

Signed-off-by: Lucas Bates <lucasb at mojatatu.com>
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/tc-testing/tdc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tdc.py b/tools/testing/selftests/tc-testing/tdc.py
index 87a04a8a5945..9b3f414ff1e9 100755
--- a/tools/testing/selftests/tc-testing/tdc.py
+++ b/tools/testing/selftests/tc-testing/tdc.py
@@ -134,9 +134,9 @@ def exec_cmd(args, pm, stage, command):
     (rawout, serr) = proc.communicate()
 
     if proc.returncode != 0 and len(serr) > 0:
-        foutput = serr.decode("utf-8")
+        foutput = serr.decode("utf-8", errors="ignore")
     else:
-        foutput = rawout.decode("utf-8")
+        foutput = rawout.decode("utf-8", errors="ignore")
 
     proc.stdout.close()
     proc.stderr.close()
-- 
2.17.1

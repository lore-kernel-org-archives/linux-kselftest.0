From: sashal@kernel.org (Sasha Levin)
Date: Thu, 29 Nov 2018 00:55:27 -0500
Subject: [PATCH AUTOSEL 4.19 36/68] tc-testing: tdc.py: Guard against lack of
 returncode in executed command
In-Reply-To: <20181129055559.159228-1-sashal@kernel.org>
References: <20181129055559.159228-1-sashal@kernel.org>
Message-ID: <20181129055559.159228-36-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181129055527.yeoWCwqFpM8fEuL13StTqQTaCo0ANv6UL266R58NhYA@z>

From: "Brenda J. Butler" <bjb@mojatatu.com>

[ Upstream commit c6cecf4ae44e4ce9158ef8806358142c3512cd33 ]

Add some defensive coding in case one of the subprocesses created by tdc
returns nothing. If no object is returned from exec_cmd, then tdc will
halt with an unhandled exception.

Signed-off-by: Brenda J. Butler <bjb at mojatatu.com>
Signed-off-by: Lucas Bates <lucasb at mojatatu.com>
Signed-off-by: David S. Miller <davem at davemloft.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/tc-testing/tdc.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tdc.py b/tools/testing/selftests/tc-testing/tdc.py
index 9b3f414ff1e9..7607ba3e3cbe 100755
--- a/tools/testing/selftests/tc-testing/tdc.py
+++ b/tools/testing/selftests/tc-testing/tdc.py
@@ -169,6 +169,8 @@ def prepare_env(args, pm, stage, prefix, cmdlist, output = None):
                   file=sys.stderr)
             print("\n{} *** Error message: \"{}\"".format(prefix, foutput),
                   file=sys.stderr)
+            print("returncode {}; expected {}".format(proc.returncode,
+                                                      exit_codes))
             print("\n{} *** Aborting test run.".format(prefix), file=sys.stderr)
             print("\n\n{} *** stdout ***".format(proc.stdout), file=sys.stderr)
             print("\n\n{} *** stderr ***".format(proc.stderr), file=sys.stderr)
@@ -195,12 +197,18 @@ def run_one_test(pm, args, index, tidx):
         print('-----> execute stage')
     pm.call_pre_execute()
     (p, procout) = exec_cmd(args, pm, 'execute', tidx["cmdUnderTest"])
-    exit_code = p.returncode
+    if p:
+        exit_code = p.returncode
+    else:
+        exit_code = None
+
     pm.call_post_execute()
 
-    if (exit_code != int(tidx["expExitCode"])):
+    if (exit_code is None or exit_code != int(tidx["expExitCode"])):
         result = False
-        print("exit:", exit_code, int(tidx["expExitCode"]))
+        print("exit: {!r}".format(exit_code))
+        print("exit: {}".format(int(tidx["expExitCode"])))
+        #print("exit: {!r} {}".format(exit_code, int(tidx["expExitCode"])))
         print(procout)
     else:
         if args.verbose > 0:
-- 
2.17.1

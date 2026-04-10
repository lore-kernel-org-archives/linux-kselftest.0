Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7839529BDBB;
	Fri, 10 Apr 2026 01:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775785166; cv=none; b=nDLG9oUIEBVUXCpFCf5m5/0SzL9GFo3EAn4pg4SsTUbgB07yAchyE1OLWPhQstPXG1yu8/U3vweRgQ3nwJnIn2Y+oaMXlZsWWM0zLx1dmYSmlSkLeqEERCAlHaG+bIz4MEySkp2n3taRv4nL7TwHTVWb/ge84It8VYfIjUhQr8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775785166; c=relaxed/simple;
	bh=d6R0GNJx9UIEg4Vkv2+FT+u+tUYEDkbF5czUCYXpDAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mpCJMPwkSVFwg1/j3UO7C4hXNGGmnOyElHnXGbBpfDjRbP45vrc92cVAD4uFAsqJDRnIhUDet1URD/4Xfg9npq0KbrrnbDH08tP+g+unCF2UBdYwWPJ8xm6Wa1SXgglFNBQIUjtc035G7RSjGa84NHVZ2V5EYpGsjpuEjtQbo5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5uClOUA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5uClOUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F031C2BC87;
	Fri, 10 Apr 2026 01:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775785165;
	bh=d6R0GNJx9UIEg4Vkv2+FT+u+tUYEDkbF5czUCYXpDAQ=;
	h=From:To:Cc:Subject:Date:From;
	b=b5uClOUAGfA5lMvP5NEgvC7Epv6DmBquf0DFIQ0LykTAn+lqQOgBiCC29Ib/T+CHG
	 GTCS3pCjfYvEcHZSGz0CpOFwjYHnTPpavbiXyFptChUP5u/WTu0lPIGUIln380ZFsf
	 nsJWDSSZeokFX3uGfGbel1GHJ4R3umZOxUQZa2uyiDUZworKo2+peXVpv96j/vn3Vw
	 ymV5tppLdFJhO5QokNyoIOtkNu9bhgxzPJfZ8FgBES/FaR3WAe2BGQn8bAiWS/B7GB
	 IAUv8N4MiQWhliX+lqQB5uq/2rPTu0aV+gN698LjUPPUrCcryqUxHM4w7ac738iIA2
	 CUpsuWbg+UGXQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Gal Pressman <gal@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	shuah@kernel.org,
	petrm@nvidia.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2] selftests: net: py: add test case filtering and listing
Date: Thu,  9 Apr 2026 18:39:21 -0700
Message-ID: <20260410013921.1710295-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When developing new test cases and reproducing failures in
existing ones we currently have to run the entire test which
can take minutes to finish.

Add command line options for test selection, modeled after
kselftest_harness.h:

  -l       list tests (filtered, if filters were specified)
  -t name  include test
  -T name  exclude test

Since we don't have as clean separation into fixture / variant /
test as kselftest_harness this is not really a 1 to 1 match.
We have to lean on glob patterns instead.

Like in kselftest_harness filters are evaluated in order, first
match wins. If only exclusions are specified everything else is
included and vice versa.

Glob patterns (*, ?, [) are supported in addition to exact
matching.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Tested-by: Gal Pressman <gal@nvidia.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - update the help message for -l
v1: https://lore.kernel.org/20260407151715.3800579-1-kuba@kernel.org

CC: shuah@kernel.org
CC: petrm@nvidia.com
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/net/lib/py/ksft.py | 65 +++++++++++++++++++++-
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/ksft.py b/tools/testing/selftests/net/lib/py/ksft.py
index 7b8af463e35d..71518c3f8ad9 100644
--- a/tools/testing/selftests/net/lib/py/ksft.py
+++ b/tools/testing/selftests/net/lib/py/ksft.py
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+import fnmatch
 import functools
+import getopt
 import inspect
 import os
 import signal
@@ -32,6 +34,34 @@ KSFT_DISRUPTIVE = True
     pass
 
 
+class _KsftArgs:
+    def __init__(self):
+        self.list_tests = False
+        self.filters = []
+
+        try:
+            opts, _ = getopt.getopt(sys.argv[1:], 'hlt:T:')
+        except getopt.GetoptError as e:
+            print(e, file=sys.stderr)
+            sys.exit(1)
+
+        for opt, val in opts:
+            if opt == '-h':
+                print(f"Usage: {sys.argv[0]} [-h|-l] [-t|-T name]\n"
+                      f"\t-h       print help\n"
+                      f"\t-l       list tests (filtered, if filters were specified)\n"
+                      f"\t-t name  include test\n"
+                      f"\t-T name  exclude test",
+                      file=sys.stderr)
+                sys.exit(0)
+            elif opt == '-l':
+                self.list_tests = True
+            elif opt == '-t':
+                self.filters.append((True, val))
+            elif opt == '-T':
+                self.filters.append((False, val))
+
+
 @functools.lru_cache()
 def _ksft_supports_color():
     if os.environ.get("NO_COLOR") is not None:
@@ -298,8 +328,26 @@ KsftCaseFunction = namedtuple("KsftCaseFunction",
         ksft_pr(f"Ignoring SIGTERM (cnt: {term_cnt}), already exiting...")
 
 
-def _ksft_generate_test_cases(cases, globs, case_pfx, args):
-    """Generate a flat list of (func, args, name) tuples"""
+def _ksft_name_matches(name, pattern):
+    if '*' in pattern or '?' in pattern or '[' in pattern:
+        return fnmatch.fnmatchcase(name, pattern)
+    return name == pattern
+
+
+def _ksft_test_enabled(name, filters):
+    has_positive = False
+    for include, pattern in filters:
+        has_positive |= include
+        if _ksft_name_matches(name, pattern):
+            return include
+    return not has_positive
+
+
+def _ksft_generate_test_cases(cases, globs, case_pfx, args, cli_args):
+    """Generate a filtered list of (func, args, name) tuples.
+
+    If -l is given, prints matching test names and exits.
+    """
 
     cases = cases or []
     test_cases = []
@@ -329,11 +377,22 @@ KsftCaseFunction = namedtuple("KsftCaseFunction",
         else:
             test_cases.append((func, args, func.__name__))
 
+    if cli_args.filters:
+        test_cases = [tc for tc in test_cases
+                      if _ksft_test_enabled(tc[2], cli_args.filters)]
+
+    if cli_args.list_tests:
+        for _, _, name in test_cases:
+            print(name)
+        sys.exit(0)
+
     return test_cases
 
 
 def ksft_run(cases=None, globs=None, case_pfx=None, args=()):
-    test_cases = _ksft_generate_test_cases(cases, globs, case_pfx, args)
+    cli_args = _KsftArgs()
+    test_cases = _ksft_generate_test_cases(cases, globs, case_pfx, args,
+                                           cli_args)
 
     global term_cnt
     term_cnt = 0
-- 
2.53.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A9439F87;
	Tue,  1 Sep 2026 20:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293266; cv=none; b=gaEYlLQRDdOh5ZdiTk3BtPpK3uiORPYpjMf5Z2rJp4+PM45APeFKHmF0GefUpWEzKAb+B9hz5yYbNrZjqHel/ZryhkfRUghZGvcgJg40N9rAhlWIjTOU45FF6evw3iI8MKUkNa/Ms2skNGJYRjvK5F4pPGC1kfgsMNY5RSmbjRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293266; c=relaxed/simple;
	bh=/F786WZm/skOweQ+cnwP/MRole0nm/uF4CdCNkxt6vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngvgc0bELw8sw7tK5LGlFh8l9bqn9JUG6QmGnPDzDjOEdNkJDvF8Z8TMmgugmoQGSGSrt2TqU05HmCEIYfg8Nwj19oF0KevoyrNuA+NKqok4+XErtcML9Jf9WS6rkptRk5DH42oOaWZwwl8JALO7MWl9pyhJT2oYVewBUdelAhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DH66E2b8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DH66E2b8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB1D1F00A3A;
	Tue,  1 Sep 2026 20:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293264;
	bh=dtazqntCwQeZsm2HAx4uUbyYg6TIc3k3LuF/CJvZFuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DH66E2b8GNgZ+W0h5pFDGRa76X2u3zoyVJnh9s39JgJrYotHRaW6fGabJkKieix8p
	 qcDf5wlOLY44yYjDy9KNQCBpUA2tKucNm9f9mk7mdM9zR59Na7DSKb8ErH24y5QO8R
	 VU74O0F0spq1RvagiL+DwpSPQ/y9CVyx1NxY4mXFkXAWQt2ctmAwfoQ6yGjZpePEiG
	 acU/m/koHcktSw7N930egi5uiANp92ay5s5JlaBuQCOS+0ls+3TcWpLoYTHAJ5ppHX
	 hTVNiTIsoojOTc+ccm3SvQx7J1BWYdg74DLcMcd6O+85BCxNh0oy5VQk+eirY+29Zl
	 kt+u3poJp7hRA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	linux-kselftest@vger.kernel.org,
	noren@nvidia.com,
	joe@dama.to,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 2/3] selftests: drv-net: split gro.py into one test per coalescing mode
Date: Tue,  1 Sep 2026 13:07:27 -0700
Message-ID: <20260901200728.2063720-3-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901200728.2063720-1-kuba@kernel.org>
References: <20260901200728.2063720-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gro.py runs its full set of cases three times over - against SW GRO,
HW GRO and LRO. It's our test with the longest runtime. The 318 cases
take 12m30s on mlx5 with a debug kernel.

Bumping the timeout for all tests feels wrong when we can so easily
split the GRO test by execution mode. Shorter runtime also helps retry
just the failing portion / mode (we retry failing tests to try to
detect flakes vs real failures).

Move the main logic to gro_lib.py and add one program per mode -
gro_sw.py, gro_hw.py and gro_lro.py, 102 cases each. Move PPPoE to
a dedicated test. It has been tacked onto the tests in an ugly way,
and it only runs against SW GRO anyway.

Note that unfortunately this will case a rename of all test cases.
The mode moves from the case name to the test name

  gro.py test.sw_ipv4_data_same

becomes

  gro_sw.py test.ipv4_data_same

Reviewed-by: Joe Damato <joe@dama.to>
Reviewed-by: Nimrod Oren <noren@nvidia.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - reorder lines to make ruff check happy

We also saw 20min runs on gve, but those may have been errors.
The GVE runner is very flaky and even when it runs it doesn't seem
to execute the gro test. Perhaps because the test times out?
---
 tools/testing/selftests/drivers/net/Makefile  |  9 ++-
 tools/testing/selftests/drivers/net/gro_hw.py | 13 ++++
 .../drivers/net/{gro.py => gro_lib.py}        | 68 +++++++++----------
 .../testing/selftests/drivers/net/gro_lro.py  | 14 ++++
 tools/testing/selftests/drivers/net/gro_sw.py | 13 ++++
 .../selftests/drivers/net/pppoe_gro.py        | 45 ++++++++++++
 .../selftests/net/lib/ksft_setup_loopback.sh  |  2 +-
 7 files changed, 125 insertions(+), 39 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/gro_hw.py
 rename tools/testing/selftests/drivers/net/{gro.py => gro_lib.py} (92%)
 mode change 100755 => 100644
 create mode 100755 tools/testing/selftests/drivers/net/gro_lro.py
 create mode 100755 tools/testing/selftests/drivers/net/gro_sw.py
 create mode 100755 tools/testing/selftests/drivers/net/pppoe_gro.py

diff --git a/tools/testing/selftests/drivers/net/Makefile b/tools/testing/selftests/drivers/net/Makefile
index d5bf4cb638a8..1f21e17d8c22 100644
--- a/tools/testing/selftests/drivers/net/Makefile
+++ b/tools/testing/selftests/drivers/net/Makefile
@@ -11,13 +11,16 @@ TEST_GEN_FILES := \
 # end of TEST_GEN_FILES
 
 TEST_PROGS := \
-	gro.py \
+	gro_hw.py \
+	gro_lro.py \
+	gro_sw.py \
 	hds.py \
 	macsec.py \
 	napi_id.py \
 	napi_threaded.py \
 	netpoll_basic.py \
 	ping.py \
+	pppoe_gro.py \
 	psp.py \
 	queues.py \
 	ring_reconfig.py \
@@ -27,6 +30,10 @@ TEST_PROGS := \
 	xdp.py \
 # end of TEST_PROGS
 
+TEST_FILES := \
+	gro_lib.py \
+# end of TEST_FILES
+
 # YNL files, must be before "include ..lib.mk"
 YNL_GEN_FILES := psp_responder
 TEST_GEN_FILES += $(YNL_GEN_FILES)
diff --git a/tools/testing/selftests/drivers/net/gro_hw.py b/tools/testing/selftests/drivers/net/gro_hw.py
new file mode 100755
index 000000000000..06b980220835
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/gro_hw.py
@@ -0,0 +1,13 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+GRO conformance tests against the HW GRO implementation (rx-gro-hw).
+
+See gro_lib.py for the list of test cases.
+"""
+
+from gro_lib import gro_main
+
+if __name__ == "__main__":
+    gro_main(__file__, "hw")
diff --git a/tools/testing/selftests/drivers/net/gro.py b/tools/testing/selftests/drivers/net/gro_lib.py
old mode 100755
new mode 100644
similarity index 92%
rename from tools/testing/selftests/drivers/net/gro.py
rename to tools/testing/selftests/drivers/net/gro_lib.py
index 6ab8c97880d1..45ded8477a50
--- a/tools/testing/selftests/drivers/net/gro.py
+++ b/tools/testing/selftests/drivers/net/gro_lib.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 
 """
@@ -8,6 +7,13 @@ Validates that GRO coalescing works correctly by running the gro
 binary in different configurations and checking for correct packet
 coalescing behavior.
 
+The same test cases are run against all three coalescing implementations,
+one mode per test program, because a full sweep takes too long to fit in
+a single test's timeout:
+  - gro_sw.py:  SW GRO (generic-receive-offload)
+  - gro_hw.py:  HW GRO (rx-gro-hw)
+  - gro_lro.py: LRO    (large-receive-offload)
+
 Test cases:
   - data_same: Same size data packets coalesce
   - data_lrg_sml: Large packet followed by smaller one coalesces
@@ -323,32 +329,19 @@ def _run_gro_bin(cfg, test_name, protocol=None, num_flows=None,
         "ip_frag6", "ip_v6ext_same", "ip_v6ext_diff",
     ]
 
-    # Tests specific to PPPoE
-    pppoe_tests = [
-        "data_same", "data_lrg_sml", "data_sml_lrg", "data_lrg_1byte",
-        "data_burst", "pppoe_sid",
-    ]
+    for protocol in ["ipv4", "ipv6", "ipip", "ip6ip6"]:
+        for test_name in common_tests:
+            yield protocol, test_name
 
-    for mode in ["sw", "hw", "lro"]:
-        for protocol in ["ipv4", "ipv6", "ipip", "ip6ip6"]:
-            for test_name in common_tests:
-                yield mode, protocol, test_name
-
-            if protocol in ["ipv4", "ipip"]:
-                for test_name in ipv4_tests:
-                    yield mode, protocol, test_name
-            elif protocol == "ipv6":
-                for test_name in ipv6_tests:
-                    yield mode, protocol, test_name
-
-    for mode in ["sw"]:
-        for protocol in ["pppoev4", "pppoev6"]:
-            for test_name in pppoe_tests:
-                yield mode, protocol, test_name
+        if protocol in ["ipv4", "ipip"]:
+            for test_name in ipv4_tests:
+                yield protocol, test_name
+        elif protocol == "ipv6":
+            for test_name in ipv6_tests:
+                yield protocol, test_name
 
 
-@ksft_variants(_gro_variants())
-def test(cfg, mode, protocol, test_name):
+def run_test(cfg, mode, protocol, test_name):
     """Run a single GRO test with retries."""
 
     ipver = "6" if protocol[-1] == "6" else "4"
@@ -383,16 +376,21 @@ def _run_gro_bin(cfg, test_name, protocol=None, num_flows=None,
         ksft_pr(f"Attempt {attempt + 1}/{max_retries} failed, retrying...")
 
 
+@ksft_variants(_gro_variants())
+def test(cfg, mode, protocol, test_name):
+    """Run a single GRO test case."""
+    run_test(cfg, mode, protocol, test_name)
+
+
 def _capacity_variants():
-    """Generate variants for capacity test: mode x queue setup."""
+    """Generate variants for capacity test: queue setup."""
     setups = [
         ("isolated", _setup_isolated_queue),
         ("1q", lambda cfg: _setup_queue_count(cfg, 1)),
         ("8q", lambda cfg: _setup_queue_count(cfg, 8)),
     ]
-    for mode in ["sw", "hw", "lro"]:
-        for name, func in setups:
-            yield KsftNamedVariant(f"{mode}_{name}", mode, func)
+    for name, func in setups:
+        yield KsftNamedVariant(name, func)
 
 
 @ksft_variants(_capacity_variants())
@@ -403,7 +401,7 @@ def _run_gro_bin(cfg, test_name, protocol=None, num_flows=None,
     Start with 8 flows and increase by 2x on each successful run.
     Retry up to 3 times on failure.
 
-    Variants combine mode (sw, hw, lro) with queue setup:
+    Queue setup variants:
       - isolated: Use a single queue isolated from RSS
       - 1q: Configure NIC to use 1 queue
       - 8q: Configure NIC to use 8 queues
@@ -459,15 +457,11 @@ def _run_gro_bin(cfg, test_name, protocol=None, num_flows=None,
         num_flows *= 2
 
 
-def main() -> None:
-    """ Ksft boiler plate main """
+def gro_main(src_path, mode) -> None:
+    """ Ksft boiler plate main, run all the cases in the given mode """
 
-    with NetDrvEpEnv(__file__) as cfg:
+    with NetDrvEpEnv(src_path) as cfg:
         cfg.ethnl = EthtoolFamily()
         cfg.netnl = NetdevFamily()
-        ksft_run(cases=[test, test_gro_capacity], args=(cfg,))
+        ksft_run(cases=[test, test_gro_capacity], args=(cfg, mode))
     ksft_exit()
-
-
-if __name__ == "__main__":
-    main()
diff --git a/tools/testing/selftests/drivers/net/gro_lro.py b/tools/testing/selftests/drivers/net/gro_lro.py
new file mode 100755
index 000000000000..63428d4aa749
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/gro_lro.py
@@ -0,0 +1,14 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+GRO conformance tests against the LRO implementation
+(large-receive-offload).
+
+See gro_lib.py for the list of test cases.
+"""
+
+from gro_lib import gro_main
+
+if __name__ == "__main__":
+    gro_main(__file__, "lro")
diff --git a/tools/testing/selftests/drivers/net/gro_sw.py b/tools/testing/selftests/drivers/net/gro_sw.py
new file mode 100755
index 000000000000..b682c092faad
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/gro_sw.py
@@ -0,0 +1,13 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+GRO conformance tests against the SW GRO implementation.
+
+See gro_lib.py for the list of test cases.
+"""
+
+from gro_lib import gro_main
+
+if __name__ == "__main__":
+    gro_main(__file__, "sw")
diff --git a/tools/testing/selftests/drivers/net/pppoe_gro.py b/tools/testing/selftests/drivers/net/pppoe_gro.py
new file mode 100755
index 000000000000..3891d5e17ee1
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/pppoe_gro.py
@@ -0,0 +1,45 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+GRO conformance tests for PPPoE.
+
+Only SW GRO is expected to coalesce PPPoE, the HW offloads are not
+exercised. PPPoE runs a subset of the cases described in gro_lib.py,
+plus one of its own:
+  - pppoe_sid: Packets with different PPPoE session ID don't coalesce
+"""
+
+from gro_lib import run_test
+from lib.py import NetDrvEpEnv, ksft_exit, ksft_run, ksft_variants
+
+
+def _pppoe_variants():
+    """Generator that yields all combinations of protocol and test types."""
+
+    tests = [
+        "data_same", "data_lrg_sml", "data_sml_lrg", "data_lrg_1byte",
+        "data_burst", "pppoe_sid",
+    ]
+
+    for protocol in ["pppoev4", "pppoev6"]:
+        for test_name in tests:
+            yield protocol, test_name
+
+
+@ksft_variants(_pppoe_variants())
+def test(cfg, protocol, test_name):
+    """Run a single GRO test case."""
+    run_test(cfg, "sw", protocol, test_name)
+
+
+def main() -> None:
+    """ Ksft boiler plate main """
+
+    with NetDrvEpEnv(__file__) as cfg:
+        ksft_run(cases=[test], args=(cfg,))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/testing/selftests/net/lib/ksft_setup_loopback.sh b/tools/testing/selftests/net/lib/ksft_setup_loopback.sh
index 3defbb1919c5..9ec4c3616795 100755
--- a/tools/testing/selftests/net/lib/ksft_setup_loopback.sh
+++ b/tools/testing/selftests/net/lib/ksft_setup_loopback.sh
@@ -12,7 +12,7 @@
 #
 # Example use:
 #   export NETIF=eth0
-#   ./net/lib/ksft_setup_loopback.sh ./drivers/net/gro.py
+#   ./net/lib/ksft_setup_loopback.sh ./drivers/net/gro_sw.py
 
 if [ -z "$NETIF" ]; then
     echo "Error: NETIF variable not set"
-- 
2.55.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DB828DC4;
	Sat, 31 Jan 2026 22:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769900096; cv=none; b=Tn7+n7XwrVf5wdAL4pKFplYK/XCB8Kt/+FVDyfWgFmGgfSfRzd4nlf35kDNJpUiReGIzg8IGe1bdnJNQY6mlNE1K6vlC95vTgy15pLw8c6HP8A5ceEvMezoguC5QRZTkgxIDiwFKIV4y7CWtUJzrJXHQr6fHQ9C2Z6pCK5MObI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769900096; c=relaxed/simple;
	bh=BTniO/AC0UG7FBraGWw304a/ulr2l1sgMTzzCZYsM4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STZpPnxsk0cEe4c7WLtnB4WQhTQaWL7+YOtGlyTFCtjd+XTSEMMV3+8HWNHiCgD0wOaQzLk6VwcbIY12Xte6YcfuvnSPIWXJE5cZpJjexLvev+ZilR+KT3C1/IO4dDT0rY3N5s8x/z+tTMBaecgXoT/T4Wk0k35xPqTz5BX2s10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BurZ9dKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BurZ9dKM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C739AC4CEF1;
	Sat, 31 Jan 2026 22:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769900096;
	bh=BTniO/AC0UG7FBraGWw304a/ulr2l1sgMTzzCZYsM4g=;
	h=From:To:Cc:Subject:Date:From;
	b=BurZ9dKMvSs1r4WBjT3CaOse0X/ebtLrPyoxafOKKcU8wJjEMYuUYmW9OedP3eJjL
	 k7kIzdmmnpE9LYwUDBTr/F9iw1ALV0kZxQ0ymQ4mL7n2t1u1rDML8pjVbdYGvAnv+o
	 G/syMSD9a/Okl5DI3gc5YOP7sO34i5tnBMCGqsGsW6kpjvk8SR36uDP0cGLxJQIWT6
	 ILBWeq9po3mqYFE89qmA4muwMxHKe4WZGt6YHqq1lcaXmYwfQ8rtT2pZffRvM3ju4r
	 YCei8cXE584q603Yio6dzigdvwYkp5Fe9H3/FNygBG3PgX4LIu1DLiYhxeHl3HKYI0
	 dlJUblV4keAqw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 1/2] selftests: drv-net: rss: validate min RSS table size
Date: Sat, 31 Jan 2026 14:54:53 -0800
Message-ID: <20260131225454.1225151-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test which checks that the RSS table is at least 4x the max
queue count supported by the device. The original RSS spec from
Microsoft stated that the RSS indirection table should be 2 to 8
times the CPU count, presumably assuming queue per CPU. If the
CPU count is not a power of two, however, a power-of-2 table
2x larger than queue count results in a 33% traffic imbalance.
Validate that the indirection table is at least 4x the queue
count. This lowers the imbalance to 16% which empirically
appears to be more acceptable to memcache-like workloads.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - no changes (see patch 2)
v1: https://lore.kernel.org/20260130192912.826454-1-kuba@kernel.org

CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 .../testing/selftests/drivers/net/hw/Makefile |  1 +
 .../selftests/drivers/net/hw/rss_drv.py       | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/hw/rss_drv.py

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 9c163ba6feee..a64140333a46 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -35,6 +35,7 @@ TEST_PROGS = \
 	pp_alloc_fail.py \
 	rss_api.py \
 	rss_ctx.py \
+	rss_drv.py \
 	rss_flow_label.py \
 	rss_input_xfrm.py \
 	toeplitz.py \
diff --git a/tools/testing/selftests/drivers/net/hw/rss_drv.py b/tools/testing/selftests/drivers/net/hw/rss_drv.py
new file mode 100755
index 000000000000..2d1a33189076
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/rss_drv.py
@@ -0,0 +1,88 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Driver-related behavior tests for RSS.
+"""
+
+from lib.py import ksft_run, ksft_exit, ksft_ge
+from lib.py import ksft_variants, KsftNamedVariant, KsftSkipEx
+from lib.py import defer, ethtool
+from lib.py import EthtoolFamily, NlError
+from lib.py import NetDrvEnv
+
+
+def _is_power_of_two(n):
+    return n > 0 and (n & (n - 1)) == 0
+
+
+def _get_rss(cfg, context=0):
+    return ethtool(f"-x {cfg.ifname} context {context}", json=True)[0]
+
+
+def _test_rss_indir_size(cfg, qcnt, context=0):
+    """Test that indirection table size is at least 4x queue count."""
+    ethtool(f"-L {cfg.ifname} combined {qcnt}")
+
+    rss = _get_rss(cfg, context=context)
+    indir = rss['rss-indirection-table']
+    ksft_ge(len(indir), 4 * qcnt, "Table smaller than 4x")
+    return len(indir)
+
+
+def _maybe_create_context(cfg, create_context):
+    """ Either create a context and return its ID or return 0 for main ctx """
+    if not create_context:
+        return 0
+    try:
+        ctx = cfg.ethnl.rss_create_act({'header': {'dev-index': cfg.ifindex}})
+        ctx_id = ctx['context']
+        defer(cfg.ethnl.rss_delete_act,
+              {'header': {'dev-index': cfg.ifindex}, 'context': ctx_id})
+    except NlError:
+        raise KsftSkipEx("Device does not support additional RSS contexts")
+
+    return ctx_id
+
+
+@ksft_variants([
+    KsftNamedVariant("main", False),
+    KsftNamedVariant("ctx", True),
+])
+def indir_size_4x(cfg, create_context):
+    """
+    Test that the indirection table has at least 4 entries per queue.
+    Empirically network-heavy workloads like memcache suffer with the 33%
+    imbalance of a 2x indirection table size.
+    4x table translates to a 16% imbalance.
+    """
+    channels = cfg.ethnl.channels_get({'header': {'dev-index': cfg.ifindex}})
+    ch_max = channels.get('combined-max', 0)
+    qcnt = channels['combined-count']
+
+    if ch_max < 3:
+        raise KsftSkipEx(f"Not enough queues for the test: max={ch_max}")
+
+    defer(ethtool, f"-L {cfg.ifname} combined {qcnt}")
+    ethtool(f"-L {cfg.ifname} combined 3")
+
+    ctx_id = _maybe_create_context(cfg, create_context)
+
+    indir_sz = _test_rss_indir_size(cfg, 3, context=ctx_id)
+
+    # Test with max queue count (max - 1 if max is a power of two)
+    test_max = ch_max - 1 if _is_power_of_two(ch_max) else ch_max
+    if test_max > 3 and indir_sz < test_max * 4:
+        _test_rss_indir_size(cfg, test_max, context=ctx_id)
+
+
+def main() -> None:
+    """ Ksft boiler plate main """
+    with NetDrvEnv(__file__) as cfg:
+        cfg.ethnl = EthtoolFamily()
+        ksft_run([indir_size_4x], args=(cfg, ))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.52.0


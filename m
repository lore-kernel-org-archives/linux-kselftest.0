Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128C23D9041
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773354938; cv=none; b=cm0irhypD+DAbWcFipdI4SZIpMs+oyDjktyo+Ispk0CUuoJt0yX0efaVI0BLi3GFh+eC735O9GIIA7KeUNax8x1eX+0xV8hgsGSs5kjXDLJHnS/JKSjhKxAUAzmCqYdCB1DnDyiJusGDu5mZ0KE9eBVa0sbKlosOo9x4TfSwM+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773354938; c=relaxed/simple;
	bh=bOIv1idMYclJig7dHHf8ZB5kdbI0WSQDOttniO+KCbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYyZWKBmJf0y3dCHMsEdFEhYw3ELTIo3/qQ6G+KCngXbMMoIakP4ItOqA/kVnTUcvFtjaxuTlN3+qbvZp1ko+P24I5TzYvTVN23SfYsQNgn+7kVTt7yHuQWlJnrQGuMFThWxqn+EatD4UzNqL6vNvafcIq7WpOYKZNppZK0fkoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=p3D9+s+/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="p3D9+s+/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a1f549e7eso549215a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 15:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1773354928; x=1773959728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDgUXurlnboqnR9kUYXcG83BLVmHtjY+C3jwCrk3SN8=;
        b=p3D9+s+/2+ucOmzmglVyBs1yEFXGrh6FarkmvyuB6BZtQxW9J0Zn7up12rbiGXGl8/
         mpG/QBiuvBstyFF1MQ9H1ZI3kklsuO5tRVtFyXnTH+hFUHa1oDd+x9KlMmiYhcKy3MHB
         qrHtVhnp+asDFcwFxmDubToeSMQg82U7g6paTERDTWZAKf2U8+6oVupWvp1Xf/XjkLNk
         Vb1u4dAigjd3mhV/L3Dfw0c8tcyR3XixYj9CZMNujrep5pYZFtprfJUQki4CckbVb/P1
         9jVpKSRFUQet3WUKBbiE8UscUSBvvcUquDHoxHVrf6v9+MUK2sK53zptQN6TkhdPNVOY
         8wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773354928; x=1773959728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDgUXurlnboqnR9kUYXcG83BLVmHtjY+C3jwCrk3SN8=;
        b=sd+NhftK10KBBK03mYLxhNbffcCiWYOUX9sRvlIYevRyeojVCbJuMxqjqZciMo5Bss
         JRMDji+LLPjP/OhZB9qXzDG5TPyYJMi2aphfYCr1ICg/2c0RthO+GTS+7LU/RM6lj3d0
         SGU47/wQal2tVUJKMhgWwXltTwpctomhUh6i7m5/IpN8y/DL2Rx8Os3zSb/U8Ds9OpD2
         aGAp1PY4GH3uzzV4C6sY+Kf/qkZ3uyJ2LaK/Bpq+i+/OHG/cANm5MBeuHrCLnPeyEbFx
         XfyhifL/w6sWPcKxyYjGttTQN/JiaDUw5yvaEDiKXEvPihXq8iM+8Mbs0puYUf7bVpgo
         g8tA==
X-Forwarded-Encrypted: i=1; AJvYcCXW83lQqLe74ITZ8ONpMS8JFBbgchSYSKuhePn/9e2uSUMq/XSiC/QIYK8kSnjbvExNbLIzLSQoUV4mRQBIljw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK3bu4bfWIr7fBFjXMha5A1xuxmWC5+zAgvDVcwy0qsmlrVZXF
	AiGp4AOs3nkTlwX3fd0/lfVcK/4PgAvg/z/cHTe9h3CL3dlPFZpP0nwyRxQP2kLSFmQ=
X-Gm-Gg: ATEYQzz5JK1f/WlUCfFT9VJ/RivgAs5UpI1DHQ+9treZvqghEfqWdwYxi8l9PrPnyxj
	A7PIFRWoE2OQluxc/rBeSVgM69RN44mWD26yhpt+7j/cNjbULOaHo5DcEGbIADHSOPsVWE1vrb3
	hrOQ8xYHL3L/D2CHQuN2aW/JRjjbgfaD2nNyUCtkSLHlLYlkgwnc03lu2V5XqLWaHLAI4CxT5SJ
	zm8xEkx6M22tPXLsXfdHS0hHpPgJzED467yjPV1VndS++CPoHhdt5/1kqwCeeLOHc6dgegPWz2C
	F/X4Mu2uJjpzZRW4G8ACeExCXo378/jqqTi2a90wK1exHYsZCmofF7iQyDFF/hVxLHVqSqd6t40
	ixG9N2AKhEXeVXadkTzKfKOVQItza0A580Z7cQcfPR3Az3pJRE+wCZX/zYg/1j6Iv6GlxZ0aU5w
	M3WaA=
X-Received: by 2002:a17:90b:2783:b0:35a:329:73c1 with SMTP id 98e67ed59e1d1-35a21e1b7b2mr1078051a91.7.1773354928480;
        Thu, 12 Mar 2026 15:35:28 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:7::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a24acecadsm142489a91.2.2026.03.12.15.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 15:35:28 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>,
	linux-kselftest@vger.kernel.org
Subject: [RFC net-next v2 12/12] selftests: drv-net: Add USO test
Date: Thu, 12 Mar 2026 15:34:49 -0700
Message-ID: <20260312223457.1999489-13-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260312223457.1999489-1-joe@dama.to>
References: <20260312223457.1999489-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple test for USO. Can be used with netdevsim or real hardware.
Tests both ipv4 and ipv6 with several full segments and a partial
segment.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Joe Damato <joe@dama.to>
---
 rfcv2:
   - new in rfcv2

 tools/testing/selftests/drivers/net/Makefile |  1 +
 tools/testing/selftests/drivers/net/uso.py   | 87 ++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/uso.py

diff --git a/tools/testing/selftests/drivers/net/Makefile b/tools/testing/selftests/drivers/net/Makefile
index 8154d6d429d3..800065fe443f 100644
--- a/tools/testing/selftests/drivers/net/Makefile
+++ b/tools/testing/selftests/drivers/net/Makefile
@@ -22,6 +22,7 @@ TEST_PROGS := \
 	ring_reconfig.py \
 	shaper.py \
 	stats.py \
+	uso.py \
 	xdp.py \
 # end of TEST_PROGS
 
diff --git a/tools/testing/selftests/drivers/net/uso.py b/tools/testing/selftests/drivers/net/uso.py
new file mode 100755
index 000000000000..da7a68b15734
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/uso.py
@@ -0,0 +1,87 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Test USO
+
+Sends large UDP datagrams with UDP_SEGMENT and verifies that the peer
+receives the correct number of individual segments with correct sizes.
+"""
+import socket
+import struct
+import time
+
+from lib.py import ksft_pr, ksft_run, ksft_exit, KsftSkipEx
+from lib.py import ksft_eq, ksft_ge
+from lib.py import NetDrvEpEnv
+from lib.py import bkg, cmd, defer, ethtool, ip, rand_port, wait_port_listen
+
+# python doesn't expose this constant, so we need to hardcode it to enable UDP
+# segmentation for large payloads
+UDP_SEGMENT = 103
+
+def _send_uso(cfg, ipver, mss, total_payload, port):
+    if ipver == "4":
+        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
+        dst = (cfg.remote_addr_v["4"], port)
+    else:
+        sock = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
+        dst = (cfg.remote_addr_v["6"], port)
+
+    sock.setsockopt(socket.IPPROTO_UDP, UDP_SEGMENT, mss)
+    payload = bytes(range(256)) * ((total_payload // 256) + 1)
+    payload = payload[:total_payload]
+    sock.sendto(payload, dst)
+    sock.close()
+    return payload
+
+def _get_rx_packets(cfg):
+    stats = ip(f"-s link show dev {cfg.remote_ifname}",
+               json=True, host=cfg.remote)[0]
+    return stats['stats64']['rx']['packets']
+
+def _test_uso(cfg, ipver, mss, total_payload):
+    cfg.require_ipver(ipver)
+
+    try:
+        ethtool(f"-K {cfg.ifname} tx-udp-segmentation on")
+    except Exception:
+        raise KsftSkipEx("Device does not support tx-udp-segmentation")
+    defer(ethtool, f"-K {cfg.ifname} tx-udp-segmentation off")
+
+    expected_segs = (total_payload + mss - 1) // mss
+
+    rx_before = _get_rx_packets(cfg)
+
+    port = rand_port(stype=socket.SOCK_DGRAM)
+    _send_uso(cfg, ipver, mss, total_payload, port)
+
+    time.sleep(0.5)
+
+    rx_after = _get_rx_packets(cfg)
+    rx_delta = rx_after - rx_before
+
+    ksft_ge(rx_delta, expected_segs,
+            comment=f"Expected >= {expected_segs} rx packets, got {rx_delta}")
+
+def test_uso_v4(cfg):
+    """USO IPv4: 11 segments (10 full + 1 partial)."""
+    _test_uso(cfg, "4", 1400, 1400 * 10 + 500)
+
+def test_uso_v6(cfg):
+    """USO IPv6: 11 segments (10 full + 1 partial)."""
+    _test_uso(cfg, "6", 1400, 1400 * 10 + 500)
+
+def test_uso_v4_exact(cfg):
+    """USO IPv4: exact multiple of MSS (5 full segments)."""
+    _test_uso(cfg, "4", 1400, 1400 * 5)
+
+def main() -> None:
+    with NetDrvEpEnv(__file__) as cfg:
+        ksft_run([test_uso_v4,
+                  test_uso_v6,
+                  test_uso_v4_exact],
+                 args=(cfg, ))
+    ksft_exit()
+
+if __name__ == "__main__":
+    main()
-- 
2.52.0


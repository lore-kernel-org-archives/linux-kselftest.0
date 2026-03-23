Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E783D47C7
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774291169; cv=none; b=uiL9zc8PQOMmX8W5sa+ByEUuMfaPE4j9L4wDix0sZSCVU925lJyeL7O5dcM2Kx10wubZuWLwQWOkNzHHF4JMYh98bJOLSrIZCvnUWDtzJkI4ytH05Fk+FTeptKl1fcImLFKpxRuQaBw+0xi27L3F14mDgJkgfSzzHGVJgWjCdu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774291169; c=relaxed/simple;
	bh=S62nqp/L7oaBVz+l0EkYVc7w8PWzqc5mHLXWWDxhwe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSuADbVWWHSMe+t0D4DHR/iYbElWDeB80w4FBHeeSt+wGC8fmI0kkUAwalyzCSONBgdOPjk5TDEz627ShGr5OiLdUgkJz5/cfZoBg8Yxh3W6T+tOVh9M5t+edUCBbXceJuDusJ2LzY7xOQZe4o87dAusB1WH1kjq/1vq8RVDq1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=xppXZ4ua; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="xppXZ4ua"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b04d051664so38882015ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 11:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1774291162; x=1774895962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9OKWh4GFeDrs3iW8vGT1OneAtu45dtpNVuW7lfnaEs=;
        b=xppXZ4ua4pxk8tMDyUkC3S54I/nOd1N/VghTIbTBuj01dRaqzm+Ihm84NQviGM7Qul
         MvwIDizEeJnshNWkJ+L2Uo7IQtgrn12dYUdoynJrIiRndZVZZvPppHQY5jCphGpqZxAj
         Txn9fiJjJw3g4sC4u93RaOPOo5o8qH4bG8hGTrtAEaV6OHqRnweoIEkKBk46bKcgdl1j
         thAPEvR3Nih/IId/T7NbIwJnRQ5Vx61LsGxsdZa3bfTa2IxSOf35d5l4gHTG/ESbW1Vm
         Jr6vK3War8+7cXoH8/UbzKGc7FOxHix3lcxCntOwIApG+RCW3UVtGNU8yyA5+n/UFzPW
         OKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774291162; x=1774895962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r9OKWh4GFeDrs3iW8vGT1OneAtu45dtpNVuW7lfnaEs=;
        b=gGDQBS8qieX70w4mELyfca8cX/ISnH9sIf9s7PtDlg5tE6UxBzGzW5LaUnMQ8bXDOx
         6cVULJf921UXJlFjBqPIpJDeJtCpHPH4I93QT6A15pj0w1eFZH0cn9xQv/iFxbxWsNO0
         4yDsoAPjlTa/8/HaU3G/whgOSC0N6wbAUOW0BVs+VJRxhqUm+/oliuSYl+aQLzD/+hj/
         WWotSK/9rgIgAZtkCzlwxQ+28fk91DJaizUT2IgJTFl3MagQa0OqA9ubjrfEdlv1jEBH
         5qlQgVq6tqcwEIo/bybeSjboYmjYnZH0TIfGMS9K3OpynRbazUXjRGSabJ9BO7exadak
         VxaA==
X-Forwarded-Encrypted: i=1; AJvYcCUAmHtRh1mOVA0NMx3sEO4hx/aNKqX/Cgg5wkYEIAWNmuF2tB+RJatO2+l+xbIx3aimDU5CTp53WLYAdsG+twQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx18LiIuFYVDUXTND/3MAhznByf3rK/sGD894DBbp0xNcUXg+hm
	8BausPRcNiZ2I5GSK6v9VUqhYyZoiYNAEPaUSCUvUEtj91zweDxBVQ9pZURbZUT8Eh8=
X-Gm-Gg: ATEYQzw0X1giQT8kPBxkYAmf3/yfcBazgKAvNqllFKUsCNmRSkEbZlgSVABMgG2S8K5
	hAY0f1uPowJJtnza+3LpmMhFmVqf5b+MnuseaYh63TN1T+4unAGTYbz2yn6CdN7ZPYOFYDjiu8h
	7FWkke3qK5/3Ej5COUBFjse7YTEXcFTRGLJ1lXnfOY8azRvkYFj6jRoyBCeBR/KO17L9W41o8QY
	3HZNn3BZyNH0ifbsoc7dKQavCPfjfYf4Wgu+95nol0ujGhVVJQmvw84U45W4dJrmP9FrZo3nH5c
	wEMlfzCqCBD69ABUJrAj6IyuaT+4t6dJp8aMhCcwuzk9XF8mZa2UkEtH2xVdhz8ihjHX2zKyENj
	ZA+L15D3nUJabrmCKzRByggrZ+KrBingCAfRCudTonA2zch5c89w9mxYxa5iHAYhJzIbVDWlv+p
	ImPJA=
X-Received: by 2002:a17:902:f548:b0:2ae:c529:a13f with SMTP id d9443c01a7336-2b0826f5528mr122156715ad.14.1774291162408;
        Mon, 23 Mar 2026 11:39:22 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:1::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516908sm149199255ad.1.2026.03.23.11.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:39:22 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: horms@kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	leon@kernel.org,
	Joe Damato <joe@dama.to>,
	linux-kselftest@vger.kernel.org
Subject: [net-next v5 12/12] selftests: drv-net: Add USO test
Date: Mon, 23 Mar 2026 11:38:37 -0700
Message-ID: <20260323183844.3146982-13-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260323183844.3146982-1-joe@dama.to>
References: <20260323183844.3146982-1-joe@dama.to>
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
Reviewed-by: Pavan Chebbi <pavan.chebbi@broadcom.com>
Signed-off-by: Joe Damato <joe@dama.to>
---
 v5:
   - Added Pavan's Reviewed-by. No functional changes.

 v4:
   - Fix python linter issues (unused imports, docstring, etc).

 rfcv2:
   - new in rfcv2

 tools/testing/selftests/drivers/net/Makefile |  1 +
 tools/testing/selftests/drivers/net/uso.py   | 96 ++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/uso.py

diff --git a/tools/testing/selftests/drivers/net/Makefile b/tools/testing/selftests/drivers/net/Makefile
index 7c7fa75b80c2..335c2ce4b9ab 100644
--- a/tools/testing/selftests/drivers/net/Makefile
+++ b/tools/testing/selftests/drivers/net/Makefile
@@ -21,6 +21,7 @@ TEST_PROGS := \
 	ring_reconfig.py \
 	shaper.py \
 	stats.py \
+	uso.py \
 	xdp.py \
 # end of TEST_PROGS
 
diff --git a/tools/testing/selftests/drivers/net/uso.py b/tools/testing/selftests/drivers/net/uso.py
new file mode 100755
index 000000000000..2ddeae99b4d6
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/uso.py
@@ -0,0 +1,96 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Test USO
+
+Sends large UDP datagrams with UDP_SEGMENT and verifies that the peer
+receives the correct number of individual segments with correct sizes.
+"""
+import socket
+import time
+
+from lib.py import ksft_run, ksft_exit, KsftSkipEx
+from lib.py import ksft_ge
+from lib.py import NetDrvEpEnv
+from lib.py import defer, ethtool, ip, rand_port
+
+# python doesn't expose this constant, so we need to hardcode it to enable UDP
+# segmentation for large payloads
+UDP_SEGMENT = 103
+
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
+
+def _get_rx_packets(cfg):
+    stats = ip(f"-s link show dev {cfg.remote_ifname}",
+               json=True, host=cfg.remote)[0]
+    return stats['stats64']['rx']['packets']
+
+
+def _test_uso(cfg, ipver, mss, total_payload):
+    cfg.require_ipver(ipver)
+
+    try:
+        ethtool(f"-K {cfg.ifname} tx-udp-segmentation on")
+    except Exception as exc:
+        raise KsftSkipEx(
+            "Device does not support tx-udp-segmentation") from exc
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
+
+def test_uso_v4(cfg):
+    """USO IPv4: 11 segments (10 full + 1 partial)."""
+    _test_uso(cfg, "4", 1400, 1400 * 10 + 500)
+
+
+def test_uso_v6(cfg):
+    """USO IPv6: 11 segments (10 full + 1 partial)."""
+    _test_uso(cfg, "6", 1400, 1400 * 10 + 500)
+
+
+def test_uso_v4_exact(cfg):
+    """USO IPv4: exact multiple of MSS (5 full segments)."""
+    _test_uso(cfg, "4", 1400, 1400 * 5)
+
+
+def main() -> None:
+    """Run USO tests."""
+    with NetDrvEpEnv(__file__) as cfg:
+        ksft_run([test_uso_v4,
+                  test_uso_v6,
+                  test_uso_v4_exact],
+                 args=(cfg, ))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.52.0


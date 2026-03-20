Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C463C5DB2
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 14:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017736; cv=none; b=vB24VcUHIZ2lAadNMx7stLCbJ0mS+1uz4BdPPhGqSiPnJCzW+eJBSsjwLhFT71du+Bb+RKSF+XSVVSiCwN5Y94tq/MGk0IzDfSsXsUNIgYX6V9DAlinagOFMGHaWdPUWqGesLioRwRDdOpKIpcpLmtCYMG3ErNsrORiuzqEO7RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017736; c=relaxed/simple;
	bh=gZOdfjY1VvR5IwPQ4DlYdoa0l2KwYEyHRE+QSQfPXrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aiMDRNTuDt3JM4b0DSrQ6Yh9F1xymalaadsUz7gAxXxQLXSvL48rVIF67/ulvUI5zMHWsXQIULX+nK7jAdqfsLIndmRAoyMFQzDD3lAEYI1pXttYMaxDe1OOiWaUDcWEr2cCNMW2PIymX6d+zjcVcA0vugv9vGk9SnP2sc1fVJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=S6h+IxUc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="S6h+IxUc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35b90d6fe14so1329062a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1774017733; x=1774622533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnLqUf8eREw2cxnnLAXHgQIdPczp+LnKWCZ2auovkBA=;
        b=S6h+IxUcDve7CSroRjQdoXgfJSHNJPrX0b2pIxo84kxe3092NVaQB59jjcU4Xkjp0a
         vX5ULqbDlLDCUe1i1GsP5JG2O4/CeJ01QJqvTmq9xFKtgVc3aKOrt38w4jnq34rUjT65
         GVuk9LF0eW1s5sZBtzd6l6AugFUAeS0xlvR7d98JMSOZJ/86cM65JwZC5HLW9AhsoM5y
         AfWMmg2H8GoE4efGQEig2JWoSkeokRtKnmWaKhJlhooEuquadPQ3AH/H+1hOKNqqZCJw
         GpiP/AB68pfW+AZ32xrOfyeoIOnHPoWvfEuc2toCRBgpOeGLJBTBMM5y1HigL6uuw/f9
         UJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017733; x=1774622533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mnLqUf8eREw2cxnnLAXHgQIdPczp+LnKWCZ2auovkBA=;
        b=oU2ddUbOzwQgxoKb4VKkZFLbmJPnckFQVlCtmO17Yj4wkUAlMn5L6qTXn1juIjnOzU
         qmoF3N3m2cukbm+6V7GfYBg8ns/NW8FjLpbKvflvoNH0Krjb4+oKrTrZKUVH76FWcH4S
         i0NhgnLqTyWkz4lUDqEE3GC6sW9LqGXqkk192PPK1OvTXe2GlTmbsCp2J9CK29VGzER7
         cLqIWhoLed88UPAcMuRDHCZwF/Snnuvq0sqwd0hYz4QnBQN7OyQKrgZT7Y/YVisFBq1+
         2MZSx6bnRyWSNnRv9aj1oNjXrMOuWnwEgVrnGMcH1uu+INoO37fUDWPWywmyNvkJhkm+
         eTLw==
X-Forwarded-Encrypted: i=1; AJvYcCVGhYEd3F+HNrDqyPikWIfRn+RElSqrebC1x0ptF8q6Z0ydTtcD8ZhLFdeMpGVHMPlOfPxMKTV/NCyV+dgXfe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ8sKNudlJ9oquULkzdaioXGYM/6ET4IjnbunY83a00cpgN1BO
	8G4Rq8ZaPNVlfpeY7pzbmpelutCTSPfjI7POOmcHEYj9TpzPiSrUwTW6O1fNVjcQ/TewIROXTxB
	7gaRANns=
X-Gm-Gg: ATEYQzxQlSPm8tC59RV+oqbxrXETzLSFS7cHZqnR6/57pOk2q8Bq+94a8pZC62HqEVC
	9hhfeau37X+5aKqad3zZJGQSJFJgBkSBFCGpU7BhJnB4CZ2QJRzhtkj9+2R11eNPKi4EJKYcuOQ
	Jy6Xi1NwYIHM743CDQuGlSrMTGUdWgrllCh/od+4S0zBEvs1eNAIgdGUvIiK5lk6ZzYYuUD3owL
	ZUejeIqLwXBFp4DDjsIQ1TiksVj7Ntf+1Rgy1ZatyVj9A59WoenyVG+qNRY6gooQUrOkPr+QAKM
	36gHY3SlLAnwujmC/FmH/f1J/nNLTLAvTAOlRSzh5YHe2Z03SPD/FFd1bd9j7kQS+MinxW/vFiL
	gIpkgkrIbyvgF26cbd4DdBf6OClEa+m5Vn7s3CZi7tiPnuV4dWz+JBOD1YyCa8b3heSbCx0z5b+
	8t//rk
X-Received: by 2002:a17:90b:5584:b0:359:8e1c:53e with SMTP id 98e67ed59e1d1-35bd2d3b94emr2258575a91.31.1774017733134;
        Fri, 20 Mar 2026 07:42:13 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc610c1efsm5621687a91.14.2026.03.20.07.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:42:12 -0700 (PDT)
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
Subject: [net-next v4 12/12] selftests: drv-net: Add USO test
Date: Fri, 20 Mar 2026 07:41:33 -0700
Message-ID: <20260320144141.260246-13-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320144141.260246-1-joe@dama.to>
References: <20260320144141.260246-1-joe@dama.to>
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
 v4:
   - Fix python linter issues (unused imports, docstring, etc).

 rfcv2:
   - new in rfcv2

 tools/testing/selftests/drivers/net/Makefile |  1 +
 tools/testing/selftests/drivers/net/uso.py   | 96 ++++++++++++++++++++
 2 files changed, 97 insertions(+)
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


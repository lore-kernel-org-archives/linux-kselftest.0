Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467563F8811
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773861241; cv=none; b=QIkUtOm1gAi00t0nSvt7oB5JOSTqlDrNXbjRaiQFeoadTIuC833FiUybo0AqsNmEHjy7Xv0B9BLs0d6h84bUm2Oka0WdjTp4442rRY17LlBK7d9ykfC5Fd/vGEn2/ljj3/T59kxP/DwaIMFdVqYLHXykHPi6VqMKwpmj6Ja/xDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773861241; c=relaxed/simple;
	bh=bOIv1idMYclJig7dHHf8ZB5kdbI0WSQDOttniO+KCbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBYnr0HIRErvH1PFY5yFkZ2xc42q0KK897uvUP5gqAKOyZUB9QjIMSqlOWgp1VqyyvuFV0PR7qXLeIdbCBJ9Sta9TOEP5rYg2z/hh7rrnqV6FpPdQqT/lgqzo4ewo75qBkL3DNkfwlS/LywivS+DM5rz2Cwj5YkVjQjxbmmzacM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=Sgpm/1Fe; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="Sgpm/1Fe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a9296b3926so1541955ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 12:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1773861237; x=1774466037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDgUXurlnboqnR9kUYXcG83BLVmHtjY+C3jwCrk3SN8=;
        b=Sgpm/1FemW4HE9FTESN1VKa0U/dX6wBSVM5HUsfiIG47WQC20EEqnxPb1t+oTS/d3e
         jFRrMFtgf+hDSf+1ydPyeV1lDFibFJbMaS7RXU4AqItu3W/NV5IyW1lTcCip84phvBEl
         E/k7MzwS9iFsAi/cRiBr8yhB7cAKPohxUQp/tFsmE5VE9AA9MkbN2KhG4z+9mQa9kiSQ
         Y3xRtgKXqVaLuFrSxUm/MUCR9bpWNuZkCqsEA3cMZnjrBFdD5gAUcJq1WmdLPXFY6Qzb
         XfUDzoAci9plLTe+bN6KY+Hers7Q0wWCTu2FwzaBTgUV2U2oyPY8NX9oHvO3cfpayZNh
         V24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773861237; x=1774466037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDgUXurlnboqnR9kUYXcG83BLVmHtjY+C3jwCrk3SN8=;
        b=DTTkU2ylnqKEER19WDixkyTNveKbjC/anOO3cUoHCvP5SkGx9mkNOdYnHbM9rkmfCl
         a1Hs5SbZTv4bMXtPgp87jVMNvDZ4wCpc4NSwviuRjd3jcv4huhyfOfloTPHqWXQkO2cn
         KkyodzmLWgC8+r4XJsj6dglAkkxMAFmWXmz65o02nBZxQnq8O8V9Ff0cBmfK6/WbZzw8
         9u7iRoOu9tn8/WSbsTJkyG2NxIA5tKhdHh8x4TsYfcLCPavorp2Ciw5GHZSQJWCJ4q/o
         f/t3DXskHMCIQ0oPxOIYPJrRSNYBgH8tkVapqSqLj7Nogg6hiRAtWCQDapeyKQh9PKS4
         AG+A==
X-Forwarded-Encrypted: i=1; AJvYcCX1O1KH3qixMc0S9+fHczETDqJWvVy0slL5T8Yga9A3lkDzYONHW3MAmVh8lYo2GO0u5ix5o2Wdmhc70pmN5yA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3by1BEL8OFtqarHdqVm0Bs5Gyrym43S8w7r7pDrxGtqTrvvnZ
	Eoobp4/UNeuRsmDUiOVDT6KTglKHKRMJL4REg9u+1FBkTAtvIo5+9b3CCCSh7aTBL5s=
X-Gm-Gg: ATEYQzyCEiaQAgx/avQC2/GlWjVTR8WD8ktLapo82+8p7Ia6/fj4mwNWOJS7SoclLQL
	tdRy1qPQV73X6jvOAU0YJR7XHZpyqVytcOOEx38Sxaon4fyQv+NN0SyE89ttLBYDTjvkDxxTjdm
	MOr5Yadrmvyuc8wqzWKu7NqcRtjVQf0ni/RwD1SoWrM0j3rvfleMUkz7NOHtOh215Nlhu5ke1/n
	shGoHoidZPdQpVZFt2HyGAmOYr2vntrvymivVrcSii7OhYKG9FGJnyM9h7PZE7ax2d1LXS/z6E0
	Vq3QzeqRukG48J3be0x/M+2HJWGzsVk22rdVw2vqdI8K0sov+1WGk6Ux0MdjSO9/AENHXb/KTN7
	hnQ2i2DfrkO5gFXg4mHujPiaCCy1PIveOvzLfp5fNiKnp/1dSq9UU4wksCMQWSo5yLDqfV2+Dxx
	+JUgo3
X-Received: by 2002:a17:903:2a90:b0:2b0:4158:c9d1 with SMTP id d9443c01a7336-2b06e3e5bacmr53777575ad.36.1773861237621;
        Wed, 18 Mar 2026 12:13:57 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:73::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e627132sm36037645ad.74.2026.03.18.12.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:13:57 -0700 (PDT)
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
Subject: [net-next v3 12/12] selftests: drv-net: Add USO test
Date: Wed, 18 Mar 2026 12:13:17 -0700
Message-ID: <20260318191325.1819881-13-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318191325.1819881-1-joe@dama.to>
References: <20260318191325.1819881-1-joe@dama.to>
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


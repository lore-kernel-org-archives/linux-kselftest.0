Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFFF3A1E6A
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775689601; cv=none; b=kMCEePCsdgPALdD23NLvYP9p6igZiMAzXEug6x0cvI3h3s2FHVIDsX5Qlxl4YTlFLn/0dyiSrKH7RbrjLeGiqtwO/6Pb054FeSpBvaPp13jxC3U7adnbofv4uGmoCeJ6l1uNGDSBMptHz4TTccMdNUflr1wA8glEbtwL4N9PEvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775689601; c=relaxed/simple;
	bh=eavrLBchN8fm9XIu1vqukYxkvy5howdAitN/UagQmIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=La8FOiRimhbNXeYi3WJB5a8K2mqsQoRCAEh7waaDZPgBFMiQQNn1IopaqI9vON687OSsV8qYPIDD0kApIw/U/+j/3og9KO0LU/9H+4DzcjX7EfHIrL0QL13G8UbQV0ObUG4vA6Dl2M6i5ibQgUYEKAbgSWTiCYB/dsz3TAyZorM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=lxP6H9ib; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="lxP6H9ib"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c742723c863so174801a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 16:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775689592; x=1776294392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaI/8wTi1iXn0q/44Vh7ATr+prNCrN7zaPdtxJM69Ko=;
        b=lxP6H9ib/yxziiVSV5eUcStMTXg6xPl7bTt/AwD1Ib5uGElTb3dfZ7gFwz68PtJjhR
         K1BPBNN7ixBemH6aFegfukdaDLMPgb77P8qQM75sA7ZAKWhBUbq78/5BkiuyYZ0HXgRp
         Nk92WEpuZ+bVZK9CnBS8NbOKKMMH9KU8b/882XhvJ8jW1IBy9PPArBKGqxG9/ZducAzh
         M81eVMdEE7k1NqR8hTSiTk+sc4IKfm3RWUy4aR2MxJ4Lf9IbyqerEDJ560PZp9ZpvPdN
         osL0VrnPWkkh4sWnknvP+zC1457GX+qbqqo7YY2RSEG5hgCTfOreo3pl+PlPSQM7VtMT
         O9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775689592; x=1776294392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RaI/8wTi1iXn0q/44Vh7ATr+prNCrN7zaPdtxJM69Ko=;
        b=fl535NDu8fN1DgJ6JY6YOCx/xoAmDQtdUO59ISA0skVihrJ8iGWqOHONdtkKxWoHP+
         hbmXDvcxXcslVL6qCjYn+D+VCTVE6ggr0n10WnybYmJv+5uK8ftAEWM6I1nxxitHef3o
         3QKZfliloYclwQApv8nN1MBU4zxpqEoPdUjBi84R+rd2EiolwMSrxdqXZiW+SQ/XoHkK
         xM0p0MQYO6zNokXiUVREgHfrtahklhkMdle3vM/VIo3ENySMyxlYqk0WNVkBjRJu96CO
         /JrkeV/Opxug5NLanlbzKEfQEMCkmSKCxJrCdFBFbTYawpnWY4SEXqZ6Ja3kZtlAdqwk
         lzKg==
X-Forwarded-Encrypted: i=1; AJvYcCUiDj6zAynlSKY5oy+TH1dTdSqclUFIlHVVJpxtcZ8PN/BBe6xZHv+k/AqqDSlyuPl/bBYhTepTmFX1AbIVHE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YybrW8xdbv+5jPlacX1+KyNl0X75xocKM99q5eTwQ6jz71K4lDz
	XrjASSjrsz5mOw65SxaBB6OJOBzpOxMsu1bFkknEuWUeMVmkk3WYMMW/536lAnoo9Qk=
X-Gm-Gg: AeBDiev0Bw+B/J3YU3PWB7HGWIDgBUlpcsOBI9wgJA2mCr2p6he/01Bh8FPgwRv3UOF
	aZJ6aRKv4Qc3W0zHUh5RjP5CUSO8n7Ct05fB2DeFQ281AQShJitTSE7G8Iz6kPtFJXwLh/4sFwk
	a8p0LzVq9DZpcvaHwhq7m99Vi0zJTImTzujLABT3OlcsQ2YoD51gdWsRO72gIBjndSU7wtyCdtk
	ZrxZCkb2HP0IdqRadcqwT3kPAaoysQ2OsdtZKKgzBUt2elXEaGS+dXfvoxaQIKg8rOY7+KpzEuo
	JQBK5MlGTuaYGOdQ7YoA75u5agDKLfYYC558sqaNt1WnJof54HSafQsQSUg8VLQp42mS0Sbw+ie
	dyBRTIYepv9r3sVv9EoXjwWTHtlDAE+9U5ayQYRS/v1jjxhbiX1NrDPauI5afoINUIOqID2uG8K
	BfWZ8=
X-Received: by 2002:a05:6a20:94c8:b0:398:7998:8300 with SMTP id adf61e73a8af0-39f2f179df6mr22822579637.58.1775689592275;
        Wed, 08 Apr 2026 16:06:32 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ad8asm22239635b3a.40.2026.04.08.16.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 16:06:31 -0700 (PDT)
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
Subject: [net-next v10 10/10] selftests: drv-net: Add USO test
Date: Wed,  8 Apr 2026 16:05:59 -0700
Message-ID: <20260408230607.2019402-11-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260408230607.2019402-1-joe@dama.to>
References: <20260408230607.2019402-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple test for USO. Tests both ipv4 and ipv6 with several full
segments and a partial segment.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Joe Damato <joe@dama.to>
---
 v10:
   - Moved test from drivers/net/ to drivers/net/hw/ since it requires real
     hardware. No functional changes.

 v9:
   - Use UDP-LISTEN instead of UDP-RECV in socat receiver (suggested by AI).
   - Fixed stale docstring.
   - Removed unused return value.

 v7:
   - Dropped Pavan's Reviewed-by as there were changes.
   - Update to use ksft_variants with a generator and a parameterized test_uso
     function.
   - Save original USO state and restore it at the end of the test.
   - Replace sleep with cfg.wait_hw_stats_settle
   - Use a socat receiver and check tx stats locally instead of rx on the
     remote.

 v5:
   - Added Pavan's Reviewed-by. No functional changes.

 v4:
   - Fix python linter issues (unused imports, docstring, etc).

 rfcv2:
   - new in rfcv2

 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/drivers/net/hw/uso.py | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/hw/uso.py

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index deeca3f8d080..5c348c8d72ae 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -43,6 +43,7 @@ TEST_PROGS = \
 	rss_input_xfrm.py \
 	toeplitz.py \
 	tso.py \
+	uso.py \
 	xdp_metadata.py \
 	xsk_reconfig.py \
 	#
diff --git a/tools/testing/selftests/drivers/net/hw/uso.py b/tools/testing/selftests/drivers/net/hw/uso.py
new file mode 100755
index 000000000000..6d61e56cab3c
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/uso.py
@@ -0,0 +1,103 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Test USO
+
+Sends large UDP datagrams with UDP_SEGMENT and verifies that the peer
+receives the expected total payload and that the NIC transmitted at least
+the expected number of segments.
+"""
+import random
+import socket
+import string
+
+from lib.py import ksft_run, ksft_exit, KsftSkipEx
+from lib.py import ksft_eq, ksft_ge, ksft_variants, KsftNamedVariant
+from lib.py import NetDrvEpEnv
+from lib.py import bkg, defer, ethtool, ip, rand_port, wait_port_listen
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
+    payload = ''.join(random.choice(string.ascii_lowercase)
+                      for _ in range(total_payload))
+    sock.sendto(payload.encode(), dst)
+    sock.close()
+
+
+def _get_tx_packets(cfg):
+    stats = ip(f"-s link show dev {cfg.ifname}", json=True)[0]
+    return stats['stats64']['tx']['packets']
+
+
+def _test_uso(cfg, ipver, mss, total_payload):
+    cfg.require_ipver(ipver)
+    cfg.require_cmd("socat", remote=True)
+
+    features = ethtool(f"-k {cfg.ifname}", json=True)
+    uso_was_on = features[0]["tx-udp-segmentation"]["active"]
+
+    try:
+        ethtool(f"-K {cfg.ifname} tx-udp-segmentation on")
+    except Exception as exc:
+        raise KsftSkipEx(
+            "Device does not support tx-udp-segmentation") from exc
+    if not uso_was_on:
+        defer(ethtool, f"-K {cfg.ifname} tx-udp-segmentation off")
+
+    expected_segs = (total_payload + mss - 1) // mss
+
+    port = rand_port(stype=socket.SOCK_DGRAM)
+    rx_cmd = f"socat -{ipver} -T 2 -u UDP-LISTEN:{port},reuseport STDOUT"
+
+    tx_before = _get_tx_packets(cfg)
+
+    with bkg(rx_cmd, host=cfg.remote, exit_wait=True) as rx:
+        wait_port_listen(port, proto="udp", host=cfg.remote)
+        _send_uso(cfg, ipver, mss, total_payload, port)
+
+    ksft_eq(len(rx.stdout), total_payload,
+            comment=f"Received {len(rx.stdout)}B, expected {total_payload}B")
+
+    cfg.wait_hw_stats_settle()
+
+    tx_after = _get_tx_packets(cfg)
+    tx_delta = tx_after - tx_before
+
+    ksft_ge(tx_delta, expected_segs,
+            comment=f"Expected >= {expected_segs} tx packets, got {tx_delta}")
+
+
+def _uso_variants():
+    for ipver in ["4", "6"]:
+        yield KsftNamedVariant(f"v{ipver}_partial", ipver, 1400, 1400 * 10 + 500)
+        yield KsftNamedVariant(f"v{ipver}_exact", ipver, 1400, 1400 * 5)
+
+
+@ksft_variants(_uso_variants())
+def test_uso(cfg, ipver, mss, total_payload):
+    """Send a USO datagram and verify the peer receives the expected segments."""
+    _test_uso(cfg, ipver, mss, total_payload)
+
+
+def main() -> None:
+    """Run USO tests."""
+    with NetDrvEpEnv(__file__) as cfg:
+        ksft_run([test_uso],
+                 args=(cfg, ))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.52.0


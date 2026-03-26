Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59883C1961
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 23:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774569196; cv=none; b=Z9elNtqCYBP9Ar3mwoqDVvKBGdq0yVlVi/ZMqmqDGlvnWhmw73UxFFkMn9G1hrtCKolgH434SLn+2GnhSUT+lgN9CC+ywODYfqm+4ZtgTvays3NxLnYrzrZm+3iHkVAbCfgZT92JPE0wrCfr/YTRnt50j72yeSGiRJ0Twa6Mx0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774569196; c=relaxed/simple;
	bh=S62nqp/L7oaBVz+l0EkYVc7w8PWzqc5mHLXWWDxhwe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctURlXaQdw8zBYM4XUJBIRO21mzXRRvXMDyZeVBbWYjlrPXug53rVaiGSjMOeZAHWlDdNtTUkCzrdwhC1Hoh/Psg0CAzTsg4liVru9jGvqHc0flH9aD3IwcfpVunjzgrZ4sB8QMdHlEBwl5FtcYdrzCdKj7F3Q9Z1u+q6jfCD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=UsJJEm5P; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="UsJJEm5P"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b056b7f783so6902815ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1774569192; x=1775173992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9OKWh4GFeDrs3iW8vGT1OneAtu45dtpNVuW7lfnaEs=;
        b=UsJJEm5Pz1rIeqzf4B5RAagtfXe24nDNyZBZGb/qo7zY7flCo/Hbs+JNlULaCmC6eh
         N9XIV4Mj7aMcVSK/xaAlQqzMLe3jYWIZu5Ja3nm4W32TIwtadjIiT9omtkwImZJg6r/O
         B1pR7+5mww8vbRebznyH/OMe/hbpHpxg7jLir+Mu0r/0yLOJis2iiEHIg+iJBwZ+1Jxx
         XP3QMiMEWChljqFc/aQqNnlgcByeqySzroFS8rVLrerHvdBt4pUkDZLsdItlhBHGCFxy
         2nfErfxeFm75SCDubQOu/s8YlEtzixSVt1LqqXL3vWKR1v2sPDrPfAjW1s+YUNZJa4tg
         A5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774569192; x=1775173992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r9OKWh4GFeDrs3iW8vGT1OneAtu45dtpNVuW7lfnaEs=;
        b=RR1DI+1LIU0MudWKveGEsodbduY/HPCFal+DDtfnKYaS/0cq1Ye4whN+m7wDhAU8kn
         gZy+M5I1VuhFx1yMA2mkFGqOvNz5jkf9vCjAMjTe+N1SksjI8/k5fbe7d0CtWb9GoYSq
         Mjan8kxV+FpOl+B9Y8XgdBSOjfoBOViY6EO2DQme8a6RNTibvIie1r1Sd6z1LolE8fEe
         RYQ3Hz7dh2qzVZ9LIGA6qVIic2Eijpu5BF/B1Vv9VRADXFldSQJ99uXrpK3rPq8NZaeh
         56JSHbv0LoWWJIet2Du6TQIRTqt0Vf1Rnf02cwbpTn1l7PGVEv+Vay5pXbo+FHzMdahC
         fIow==
X-Forwarded-Encrypted: i=1; AJvYcCU07LQeeWJ88ptYcrXTcYYjiUAsO3Takuclk0dnQ9nLvjZQTjAVll0zhxQ8B+ofda6cmIiq6CC5HU0696jMh+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5BFj2YuQjVWQUIf/5VvmfnRFyeKvz8xyoz77KuHYUEat1rAX8
	F/c1REbYue7aekokaexczwreu1RdVA0bwpNxA4KC0pQ7zfw/Gzpkdf09sAnDkI3bM/c=
X-Gm-Gg: ATEYQzz5b4V2Qr+hdCzGQcWD/Ijb8dYGKF5qO+wjo09RGrPIBmc5YpKVjauyRgX+eBg
	zrajyIuias2fmAcJshQT0Que6lTie746HaLJ1ah2kphjEXFj/1YOPcTooCOLqvACu6cjyKtrWON
	/zK7ONXUuoEnje71os0vyy4C9oqQlGn1BewU2Kbddf2CVR8PRgQC1mCX1Rg7VMBynFFlo1NsPPF
	abjSEv26bhCxRAHrB7RlOSpVcFgZbUqzRS7URWh/O2ZyLi0JYL6wDECr9S4N7dBHo4tvja9HJ8m
	FQWK33/ieYi60/bhr5ROZ3hYGtIuGFKn4hBg9v2a4fSs2hmXTzzVCV0iLXuaQx9XYyZ+8sN3qpw
	Wr9aW0+2HORTujTuRNvC8cZJYRiSicxQsiiUHiPq/dTcDoZDWiaClReRo0iyXdzke+gH5SQgjfk
	RBOQTRt3NGLklDSA==
X-Received: by 2002:a17:902:ef4c:b0:2b0:501e:d751 with SMTP id d9443c01a7336-2b0ce5b10f3mr2054445ad.20.1774569192019;
        Thu, 26 Mar 2026 16:53:12 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:7::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm52644875ad.20.2026.03.26.16.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:53:11 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	leon@kernel.org,
	Joe Damato <joe@dama.to>,
	linux-kselftest@vger.kernel.org
Subject: [net-next v6 12/12] selftests: drv-net: Add USO test
Date: Thu, 26 Mar 2026 16:52:31 -0700
Message-ID: <20260326235238.2940471-13-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260326235238.2940471-1-joe@dama.to>
References: <20260326235238.2940471-1-joe@dama.to>
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


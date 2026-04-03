Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5728C869
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 00:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775176568; cv=none; b=k0L6hyHMi+cGOT0KysNU4fMo+FNqqlKH/DlHaaNhRyEhF9buI6J+QIvLn+4lWz7R5KpstYRbJc2rPkM/c/E1Sz7edwjlzo3lsmBCPRucM5tM2GVRBzUkV6Bp9azrhsDPPGZfGuZP5LU76Sb2O0KVhicZVzJerV/2Q4pGTedPNvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775176568; c=relaxed/simple;
	bh=8wDnYGmsZvC7abjvNEJ3Tk+IvO8q3U34sLBOd8TOXA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILY8jJEfh9e2oHDGSfBG0ujVjudQy2baKFSG1onzYfZlF93BVETxKzt0rtTzleFZOhohR/yauP89spOvQjBebrhO8XPZFxfuVEcPReex6gwftm+6o44p31gkQ8aokbfzQbEG3kJx5txGVjcO8zjbj+MmT8iwcnB0PaNrT8MRg9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=VfvzpoH6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="VfvzpoH6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a871daa98fso10798145ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 17:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775176566; x=1775781366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLMUaKCgV8ol4xEA39jbeNRFpzXzgz54RkpOpnmPJPI=;
        b=VfvzpoH6pNmkO3AKv5bsD/XwKnYjQs5Qycpuz7hrofgEvL2WyvJ8QYYqX/Ef/RTJ5w
         HwiwG/NP55ALItUKag1Asr9FCxVH1dRYNuBIYE+AEgIiuvgNpGl6aLvJEPqrqStB/RKc
         uxD8z8buOdOwDugaBZ4Ld+P+w5w1uvtXNq6YlNUGjRNUSGXW2XQrPRX9wDG2nZOhdYjT
         R/76NBd1w0sMJSVx24jt1zRkeW1TCJFNjXs1o13DK2Wlljlfg+N0K9/iD2nSePyReFyk
         bSFAEJmp3hvB4x0H5VyRl1BOf9Rx9rG50kD7eRtZotynIDeCq7PgcpDdukprsW21VrZe
         /ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775176566; x=1775781366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLMUaKCgV8ol4xEA39jbeNRFpzXzgz54RkpOpnmPJPI=;
        b=m7HpegIhljQhaWDuvIT5FkCBswOWyQbhULHDzqfvOms/CJtjPmaJY0ictArDWe4hmY
         k7L3DHhoMktBElBq4ZOfLc/lq5W3GlvgOEBXrWCCVAbzCcqY3U6YecOVfJRrLXH1IXOI
         zWr9Dk/Iy0Qa5pFbB0U5ZNBnk/hzrkQ+XcapvdT5zunotF4w1iyBjckcx7/W7j4exV7G
         DjpuXuAN1cQ5Lyasn9bp98vH51hBqXxJ5KijVujQWBsvNL3gUrq/oGlzV0hm3Xlgb9Zu
         Df7Z/uN7o8hSgCjSB1iU2qvEgQ7XKXcjaSbisp+jpOUhSNx9vbiJYn2wO80L0kmBvvBr
         Ms7w==
X-Forwarded-Encrypted: i=1; AJvYcCV9iyIPB+mBpvHo0212LjCwEFzkIyWw6Pm8YcmXqQz8ZBhOOZ/M8RCBJqAfAgsecbFnWDKCPL/lwpEwSc4SP1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YypD4mTOGuPceLBpAw1brjycoU/jPx7wFt1jIs1auHzBD422FSA
	KDdYQj5pyvN2TtoLSAg8IK36Rh7cdq4EqPPw+X3LpaOvEQOamngybfzr/xde8wmWx0U=
X-Gm-Gg: AeBDievKGHuQlfmXSFt+cIRICL9Z+4B3LMUc5baCkDUqHZKqG6hqAim4C6rAeTc3LCX
	TYhzeLK3O3KGf10LsrgkzHSEl6XDwim5/DKBYMpySiR4fsMQ+D5FFFLj4rwJoD4cPVWHf9X2XEP
	jNy6BjyR1fXA1RJ/Upw++GHP7W3lHY11yihNL1xLjPiYtaEIQyYzrk0aHZarBjoc4PIkxc4ti53
	5MGm4G1nqwi1YDgz70xUbdPzrkhmAP422NIsMZ/EJYr8NzJLV6Cp2TgZPYFj0CoMikDcXR5sW61
	IWCMqPyKxVP5kXsJ5ozxsBzc8WDRpxvjmEE2oFA7SoLqUDNCb081wqaC/l9hYP8VJUpaqYUuKIl
	3xU1Ylljt6a3Xn5H/ufX47eIjBBikTBzR/yJlLS+ozpyO6Lp6zOsDcUxKiGOf7o5xgzSuQXPFHV
	SIhAo=
X-Received: by 2002:a17:903:2a86:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b281706f07mr13520335ad.5.1775176566421;
        Thu, 02 Apr 2026 17:36:06 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:1::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd85sm38769725ad.74.2026.04.02.17.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:36:06 -0700 (PDT)
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
Subject: [net-next v8 10/10] selftests: drv-net: Add USO test
Date: Thu,  2 Apr 2026 17:35:17 -0700
Message-ID: <20260403003524.2564973-11-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260403003524.2564973-1-joe@dama.to>
References: <20260403003524.2564973-1-joe@dama.to>
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

 tools/testing/selftests/drivers/net/Makefile |   1 +
 tools/testing/selftests/drivers/net/uso.py   | 103 +++++++++++++++++++
 2 files changed, 104 insertions(+)
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
index 000000000000..75bf02849075
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/uso.py
@@ -0,0 +1,103 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Test USO
+
+Sends large UDP datagrams with UDP_SEGMENT and verifies that the peer
+receives the correct number of individual segments with correct sizes.
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
+    return payload
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
+    rx_cmd = f"socat -{ipver} -T 2 -u UDP-RECV:{port},reuseport STDOUT"
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


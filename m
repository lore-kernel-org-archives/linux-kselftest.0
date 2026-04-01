Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DFE3EFD1F
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 23:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775086699; cv=none; b=KRaWO6FxO1nMVcDKUx9wqNhYTHmccWF1wUjEbY3PHXYkcZ7jp+yGsf+VzNzGwLG5lDXPo1yGzwXrgby1/iK3VNEMUqmz3EPP4EKOsAZxgd2XHtKEL4MNHKxHFv1mBabiPcHovU2opNYiyWOKRcjzWDNQN+SgEyro8qU2DvH9K90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775086699; c=relaxed/simple;
	bh=8wDnYGmsZvC7abjvNEJ3Tk+IvO8q3U34sLBOd8TOXA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5sBs+VqWsjI5xBP5onw9stEWAhOXthK02+7iT7JvZpQ9ai0JLRHYyXizJlWIBj+oJYaPCvLEUFVjp9j5FLMFRMyOkbvEbm+JAvE/rSP0Th263YglZjdPuXnGhdUq4YlBuSueyYDHV7Wgs3AqDIpUX+KUGv2QhIP06/X38onrno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=BtTAUNxg; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="BtTAUNxg"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c76b6f9a50eso83420a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 16:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1775086693; x=1775691493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLMUaKCgV8ol4xEA39jbeNRFpzXzgz54RkpOpnmPJPI=;
        b=BtTAUNxgkl40G3QbV4lpMXmZDZcHWpK6LHqIasTGGiqKhokxl6Ip7J5UW2klnzlYod
         EE0W6yA2QdYkm9RX+PoArFbx+49pjL8LTxXVKxXTVBU+vh6toW4DjWTgwSLFjpm39IFY
         /mnEYp2DyOe7KDhYAoN3svzA8L75o16hiqlduxx0WV6PJuXbMfdawIw3bCqEgXwr9FEj
         A3MDdLGndmYSK6AgeR5QwLf1X2Dzck4VkYz5JI8Ug68Isx2nFTgEEhK7/Vojae+/iJCA
         /Tsa+HIMoXtbEwcRoKKTnzjwRll4d8wAGGazpRYk4AyqWZyvUVdI3OOWj2onPo/pkNRH
         okSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775086693; x=1775691493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLMUaKCgV8ol4xEA39jbeNRFpzXzgz54RkpOpnmPJPI=;
        b=JPiH5YHzLk04dMKoSvFA8yV5F7fcS5kpXxNGa4J67qOuCPXPSRLZ6glSEK5dqcrXX/
         Q0/aLibsCt0QlKTdSJT0U1VcuMEBfUnis5rhHDsMszH7lJJlGuD6KjpUeaiCMF0svIxj
         5OeUKfe+JUIurrvOQAskw2NDxzNfcvQfzkFwKLih79C8d5PfCtJ+9HtjI8iAc5mYa544
         7bmiq1qyp+3vZA9sWgso/MDUSVGi/HAGtc8CeOhwyseCIfGa3c7NSKap9bVQREmWQ30C
         5PbxnXrE0avKLVjG4VTmDie34svTmBAieXrOfN1rX1q6PbKVjTIewxOnh9KFTGs5lBz8
         y2Sg==
X-Forwarded-Encrypted: i=1; AJvYcCX/qpqNWEW3pLXFYE+k5uyXthhjkd+LoLMKfgCs+1EkHWYuXDNXIzcP8J08YJTZtlwRVeH5R5oxarcvj8BqI7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmJZ+WnDEBdjwdxW3fcw4+KHJ68uZU8YwDrV55HUh9zwS2aG3I
	53ehFJkXdb26IwixqyP9XH0w/JT+XnWhC4W6q+EErSeMAZiJGNFjI1ZjsWlcBbr5Fgw=
X-Gm-Gg: ATEYQzzamw3/HrJ3ce51MiyFn/66fsmNEAXHT2oENcPo0vBaviJ119RB2GuTXKPYRfl
	AJv3dkO7pKUxcvr0N5O91ceISgVf4ofhVE1zNhj9uYJakVnXKodpOwfQRC0wGJ8HrxI8lnTNgq8
	89jFbGYekvD0J8EiyvytEwTyMQOeSDfqAryK/RCMjEWnyk1Vfv0TDTVCOySP1VancifOqXJt0xP
	kFUq5DinYSdQBkJ2qOFS+XfDdmUx9iVjkw2SBq2btuOlcQKtxJcFb6LFZym2SpumFtILF4+0d5a
	5S19+zgKHhzNTtJPqkJiAovShN3qxGKNERgodEopViXnNMQZHaE5cyRnycMx8CGuyLb684MX8Yr
	nBasIWHK7F9ouyeptymP0GQouXLaQXkca6dJF9MOHQg7ddzBTThmbIpTap7O0vdQefCDIXMwJFn
	4taen6
X-Received: by 2002:a05:6a21:9983:b0:39c:787:f17a with SMTP id adf61e73a8af0-39ef76a85e2mr5757489637.41.1775086693216;
        Wed, 01 Apr 2026 16:38:13 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:70::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3dcbesm1012860b3a.22.2026.04.01.16.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 16:38:12 -0700 (PDT)
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
Subject: [net-next v7 10/10] selftests: drv-net: Add USO test
Date: Wed,  1 Apr 2026 16:37:38 -0700
Message-ID: <20260401233745.2333858-11-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401233745.2333858-1-joe@dama.to>
References: <20260401233745.2333858-1-joe@dama.to>
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


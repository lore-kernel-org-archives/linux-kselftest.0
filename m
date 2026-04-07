Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5418737F8CA
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775599424; cv=none; b=Lz22VbE/Py+r9MZ5DAkN1LZFL9CjC0TunLl+ZVZa0+Mt1vEg7MSxEQcuvs/N06tFVAzy0qDIcIze79sLt769VZ4fRo0FX/zG/p/1gA4JtnK7KDv4YpezocmjZ5zsOT4u4Ul3N2EXO9HKXl7df0P5twhOKR4OUxcs4kuEM3YxPsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775599424; c=relaxed/simple;
	bh=o/NtSsecFTNFsiPqiNCLzmEF05SSxO9/5XaAXM7arIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3tE4tpRMNMeZAAKhctbZMZqdAJDS0Zz/PsdczPk+j1Z1b76uTn46FIxv5BDiI0wZ4c6ejlrgWd2RKK1orvrXoqbXhRrmzbm7ydtuLkDxiM19NLg7N9U2OXdp+Pxv4v+Gg9YTP8LU5PUVRzeJO7swyai0W5FStLVff8yNy6Uu6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=A8F05xPr; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="A8F05xPr"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so3745679a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 15:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775599423; x=1776204223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmD0I3pcx04Mtpj/oo4F+jl+//3G3jRQHwrxWNrdT1Y=;
        b=A8F05xPr23ZAyBRW50hOtfIKI5FaNNvrIL2+XslcNalgNgrdz3GFTSF3zo0Hd7d9ZU
         lHmtk/eYMJIKI52ZVn5Y4282qTNAIuMBr0FDeHgK2Ebg60R9vt4U8qK4f0NIRskcD4bK
         milGHICq9G8hdnR7N+tZovni7XLJkl3YU6RmbKMbcL5mD4OFr1P3LsChDGnM2P6ua/e0
         y6rgI2JPGS1je+uLccTK9OiKljSX6O7cLEJuKjwKHbI67foidwCQWnbS0y5KoVh38IWf
         sVaPiiyPGJzwtFnq8WQYMMwYOoht+LPpNLE1pQ/goG/lStKHPqVQVnozasuEVZuigLD6
         cuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775599423; x=1776204223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmD0I3pcx04Mtpj/oo4F+jl+//3G3jRQHwrxWNrdT1Y=;
        b=OIngHlXWDA+GfvtGWd5AB0zSbLTcxuHk2c35XZhwj6s8onveS9eJafzbTK8UQEf8Yg
         rkhl8X5anjaUMdCha9MDzzZ72iIRoRngUdf7xVVfwRxgCOGZzvhUs0hyzWeMgNCVH4e1
         mOVS8EgrmHXk8EgX2YV1aSuVdGn5N05LF/Wf7HM4ZYDUMoe1Wp3qFC/LwAvvU0cs17Mr
         CtsPF1uSQMSWAhJrWKnwtad3lP6Te0vhhZwJ7y07cCriBwCYnmHInxgqZeOcH+LzgcWg
         GfAng91JrPgSwK4qiLCrUzMO6qLdvDaJis23nPRwMe1gOZL4qaVkSjYBaqMtfQPHCwjB
         Y2FA==
X-Forwarded-Encrypted: i=1; AJvYcCWvxKjOwO53k5P8yomeaah7U+eohgZnYon7fM7uarfuDmf29OfkpzL5g/MItNpr98pcfp+bfVkvh8fsSdU4WD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUza2h9FnihGo6jXByNlAxXuv9m6PLccF/6Y4XGdknH/GqEeTZ
	cB9IVm0xY265cZx1x7zs1KHvluFp5zadhH5+jAey7VbkKd4ikPTZdHf3SFaaTTpOHbw=
X-Gm-Gg: AeBDies+3wNAjHt2DSI1YL3srynilRKiTaqODu1KI665fkUGj4Sm0HL4lNRuUOIvaZi
	0M/atley6sV/6K4f2gSvLFpAm8L2FRVoHR6O+hVruoTjo74llAlIcI+O+2xmiNPuEp3dEl97OLR
	Qi3FqtEjAqLomI8P8La8kqDT4sMhrpkLlXL8t9poLPv8bONi0JFCln6j9SR/dsopGB+Fzb6aBnJ
	h9Bp6u2KTP/kc47TLwezmfIKunHbzYMgIbe0+ALST4Jp0e1K6Hz2rfPI6PSdjb2L3KRiked86Nc
	R82MHQr3G15Pm61U0KY1FBn40kUdRyn4EKLXeiiHQ9ppyyr3ZQiLy9qQ99R4+H7RTy+e0vVVN47
	ejdHhgVCDlT+QrdLcB+iQlE/rYmzU1O687M52YHgIrs0VB169FjsOIKZukl6L5xcceLJVEI/eWa
	nZ+AQx
X-Received: by 2002:a17:90b:2251:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35de69acf35mr18090837a91.22.1775599422777;
        Tue, 07 Apr 2026 15:03:42 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f7229sm19645039a91.7.2026.04.07.15.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 15:03:42 -0700 (PDT)
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
Subject: [net-next v9 10/10] selftests: drv-net: Add USO test
Date: Tue,  7 Apr 2026 15:03:06 -0700
Message-ID: <20260407220313.3990909-11-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407220313.3990909-1-joe@dama.to>
References: <20260407220313.3990909-1-joe@dama.to>
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
index 000000000000..6d61e56cab3c
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/uso.py
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


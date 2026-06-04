Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2468C21638D
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 00:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533792; cv=none; b=JYT+7UAZxRUHvZrRXTpaLWUyXap93kW2wz1e7cKE6cYnalDJtYj/7BwWmQYQu8scfcXltXJlTC9BMrWflHV+Hp1fer4XRcYTiijj0XxjO6HSdzPd1yACm5LVQK+IBzp5WYEQr0kceniSV+RJ1Elk0QYJ+bfja3vSK6iPHTVzXA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533792; c=relaxed/simple;
	bh=z413rEVyMB6mH/jde6zuXpETKXPhggQOWfBnPF3Jd7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UOMueXuFsKjjs0A+s7JOPTbNiTpwYOymNHN3uXpPyobnafwpQl6VGR6qxG+1KwBysp4Gg2GXQEDgyeaNFWI5Chbp9Ij/Ql4mc468bRkOlk04sGtvLWyXyBO0uqdJDDmGI29ImFghVDe6kF0M1M16ZOHJ4K5ETs2ATRElpb/+pMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pmFIruSV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pmFIruSV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf22d29dabso875165ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 17:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780533790; x=1781138590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFwU+gJPCdIvaG8BIeMjrGJqao3C2Cvmdt82URI9gpQ=;
        b=pmFIruSVaXb1eqrli29ftEkZpNcoxQ1fJRkKQz5Y+T2MjTTDwzikrjYY1o806t4bC4
         vTWRbrJCpmhe7iLHalhz/2Uwfmxz/CandvnRuqwoYL9LQhYkoQnAxSUEtACzpV7e49m9
         9fG+Pti+0GLtB2HLWRoO13ctFUHlF5EOOJam1r4Ly35pIQsCmn6SjycNhq/D1h28Drcv
         dCwQlq6UORY2CfE3rwN5XFthoqqQxrjfH889qAbenqSQMkdJZQZyNYH7niCQiW67G05Z
         UDzvNjXE2eqcYsi84tBP2uGZBz1PtlLnzMenxiJvU9SxEg9VmQrwjcZgdc8Xrg3WcQG9
         PobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533790; x=1781138590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yFwU+gJPCdIvaG8BIeMjrGJqao3C2Cvmdt82URI9gpQ=;
        b=icnvSDtgrt2wMNxBXOy/B1veDL2cezOGQYsTF8am/nRoXD7Ah5aUc80pVQ2vQFuNa/
         PF52xrsXdpP5Umxbx/IpcdYZ8o2Gr6ICpnWmzPOTiGPn7ATXJHsf8YHoCoos7vSGyjkc
         n//8H7ny3cNRtHm9aoRW6VhA5SMM0Ij9f+Ke0QHpfhYhqSx6Jns95ilzOKp990pPCPR4
         T/Xd8OIRAY1qDPRw1Q8boCm60hqcpShwTBjAYOPnBEdbSbx2Ykr8D3uyMBesfrCUSERJ
         DdCyfKa6P4CVv179u06tDofiGcJNdxFXP8JBgRyapRDtdr1w0tjIpvsu4d5+mTx2HqCf
         VHtg==
X-Forwarded-Encrypted: i=1; AFNElJ+/3zBCCuvWRaPDjZSvw1Gl7QMYg7+PXSBnKiKU3YLpm7+sojoL2k21MfVtDOKgADFf8gEQ45Vus+XT+ALjTLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk5E4xy00iHTKLIWq0qUSY8pV4vyOXDokg3YQTap8AaZ4JEFr8
	nbxOEeawXQS1ZjuXIpJNw7i1/8jzoOqMIfIw03T3ET7wTpvAPCy3LJpN
X-Gm-Gg: Acq92OFvdNqAtWK65rj2xlvnL4fQ4lP2pRsORdU4WjQt3FG3NZYI+Rf6ZVOKJC39Jpp
	jrNsV8vpZVuEuQEZhn6SM2E9uEyoL8uaAQW4NnifJA1XRyyKEGvommH2CMsOsChrxNMESpXZjAA
	z5RbwqLg9aA8ZF75RJ0Cz8dgSwhnVc0+s5PKrwP4PJI14A2WrrJaR23WXcLcp4gNBeRW4hQ/KDb
	B3auWNUtvqt9J/RszhNBeahocFgEBY6FO1Z5QkAFAsy0nqNCErAgZb7di0Evp8gLKy0oxOswe8f
	BWz43JhF0aTUCAgl4wMieEaQekK4IypcpwMXsErzLGZKDzj8mtzB1qjXwN4bcT82zw+K+VcC2XL
	CYe6tSI2eSgxe2TThJ3edS3Rty3ZUylZlorzOKEcxB+e9SXKqNg9DG+GgcLn56PZcEzmD5fCoDA
	NOjkJSEUpb2bISW6yQmxql2Vylel+RAg==
X-Received: by 2002:a17:903:3b85:b0:2c1:8fea:4dbf with SMTP id d9443c01a7336-2c18fea4df8mr24927635ad.8.1780533790154;
        Wed, 03 Jun 2026 17:43:10 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e1b6sm37277735ad.38.2026.06.03.17.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:43:09 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 03 Jun 2026 17:43:01 -0700
Subject: [PATCH net-next 4/4] selftests/net: devmem.py: add
 check_rx_large_niov
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-tcpdm-large-niovs-v1-4-f37a4ac6726c@meta.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
In-Reply-To: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com, 
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add a new devmem test case for binding the dmabuf with rx-buf-size=16K.
The test sweeps RX payload sizes straddling the niov boundary to cover
the sub-niov, exact-niov, and multi-niov RX paths.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/devmem.py   | 12 +++++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 46 +++++++++++++++++++++-
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 11 +++++-
 3 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/testing/selftests/drivers/net/hw/devmem.py
index 031cf9905f65..47b54e18e7a6 100755
--- a/tools/testing/selftests/drivers/net/hw/devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem.py
@@ -2,7 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 from os import path
-from devmem_lib import setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds
+from devmem_lib import (setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds,
+                        run_rx_large_niov)
 from lib.py import ksft_run, ksft_exit, ksft_disruptive
 from lib.py import NetDrvEpEnv
 
@@ -30,11 +31,18 @@ def check_rx_hds(cfg) -> None:
     run_rx_hds(cfg)
 
 
+@ksft_disruptive
+def check_rx_large_niov(cfg) -> None:
+    """Run the devmem RX test with rx-buf-size = 16 KiB."""
+    run_rx_large_niov(cfg)
+
+
 def main() -> None:
     """Run the devmem test cases."""
     with NetDrvEpEnv(__file__) as cfg:
         setup_test(cfg, path.abspath(path.dirname(__file__) + "/ncdevmem"))
-        ksft_run([check_rx, check_tx, check_tx_chunks, check_rx_hds],
+        ksft_run([check_rx, check_tx, check_tx_chunks, check_rx_hds,
+                  check_rx_large_niov],
                  args=(cfg,))
     ksft_exit()
 
diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
index 0921ff03eb81..1d9ad3a294c8 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -8,7 +8,7 @@ from lib.py import (bkg, cmd, defer, ethtool, rand_port, wait_port_listen,
                     NetdevFamily)
 
 
-def require_devmem(cfg):
+def require_devmem(cfg, rx_buf_size=0):
     """Probe ncdevmem on cfg.ifname and SKIP the test if devmem isn't supported."""
     if not hasattr(cfg, "devmem_probed"):
         probe_command = f"{cfg.bin_local} -f {cfg.ifname}"
@@ -18,6 +18,19 @@ def require_devmem(cfg):
     if not cfg.devmem_supported:
         raise KsftSkipEx("Test requires devmem support")
 
+    if rx_buf_size > 0:
+        if not hasattr(cfg, "devmem_rx_buf_size_probed"):
+            cfg.devmem_rx_buf_size_probed = {}
+
+        if rx_buf_size not in cfg.devmem_rx_buf_size_probed:
+            probe_command = f"{cfg.bin_local} -f {cfg.ifname} -b {rx_buf_size}"
+            cfg.devmem_rx_buf_size_probed[rx_buf_size] = \
+                cmd(probe_command, fail=False, shell=True).ret == 0
+
+        if not cfg.devmem_rx_buf_size_probed[rx_buf_size]:
+            raise KsftSkipEx(
+                f"Test requires devmem rx-buf-size={rx_buf_size} support")
+
 
 def configure_nic(cfg):
     """Channels, rings, RSS, queue lease for netkit devmem."""
@@ -76,7 +89,8 @@ def set_flow_rule(cfg, port):
     return int(re.search(r'ID (\d+)', output).group(1))
 
 
-def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
+def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
+                rx_buf_size=0):
     """Build the ncdevmem RX listener command."""
     if hasattr(cfg, 'netns'):
         flow_rule_id = set_flow_rule(cfg, port)
@@ -96,6 +110,8 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
         extras.append("-v 7")
     if fail_on_linear:
         extras.append("-L")
+    if rx_buf_size > 0:
+        extras.append(f"-b {rx_buf_size}")
 
     parts = [cfg.bin_local, "-l", f"-f {ifname}", f"-s {addr}",
              f"-p {port}", *extras]
@@ -202,6 +218,32 @@ def run_tx_chunks(cfg):
     ksft_eq(socat.stdout.strip(), "hello\nworld")
 
 
+def run_rx_large_niov(cfg):
+    """Run the devmem RX test with a large niov (rx-buf-size > PAGE_SIZE).
+
+    Sweep payload sizes that straddle the niov boundary: below, equal to,
+    and above rx_buf_size, to exercise sub-niov, exact-niov, and multi-niov
+    RX paths.
+    """
+    require_devmem(cfg, rx_buf_size=16384)
+    configure_nic(cfg)
+    netns = getattr(cfg, "netns", None)
+
+    for size in [1024, 4096, 8192, 16384, 32768, 65536]:
+        port = rand_port()
+        socat = socat_send(cfg, port)
+        listen_cmd = ncdevmem_rx(cfg, port,
+                                 flow_steer=not netns,
+                                 rx_buf_size=16384)
+        data_pipe = (f"yes $(echo -e \x01\x02\x03\x04\x05\x06) | "
+                     f"head -c {size} | {socat}")
+        with bkg(listen_cmd, exit_wait=True, ns=netns) as ncdevmem:
+            wait_port_listen(port, proto="tcp", ns=netns)
+            cmd(data_pipe, host=cfg.remote, shell=True)
+        ksft_eq(ncdevmem.ret, 0,
+                f"large-niov failed for payload size {size}")
+
+
 def run_rx_hds(cfg):
     """Run the HDS test by running devmem RX across a segment size sweep."""
     require_devmem(cfg)
diff --git a/tools/testing/selftests/drivers/net/hw/nk_devmem.py b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
index 300ed2a70ab4..7f1867e4ff32 100755
--- a/tools/testing/selftests/drivers/net/hw/nk_devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
@@ -3,7 +3,8 @@
 """Test devmem TCP with netkit."""
 
 import os
-from devmem_lib import setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds
+from devmem_lib import (setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds,
+                        run_rx_large_niov)
 from lib.py import ksft_run, ksft_exit, ksft_disruptive
 from lib.py import NetDrvContEnv
 
@@ -31,6 +32,12 @@ def check_nk_rx_hds(cfg) -> None:
     run_rx_hds(cfg)
 
 
+@ksft_disruptive
+def check_nk_rx_large_niov(cfg) -> None:
+    """Run the devmem RX large-niov test through netkit."""
+    run_rx_large_niov(cfg)
+
+
 def main() -> None:
     """Run the netkit devmem test cases."""
     with NetDrvContEnv(__file__, rxqueues=2, primary_rx_redirect=True) as cfg:
@@ -38,7 +45,7 @@ def main() -> None:
                    os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                 "ncdevmem"))
         ksft_run([check_nk_rx, check_nk_tx, check_nk_tx_chunks,
-                  check_nk_rx_hds], args=(cfg,))
+                  check_nk_rx_hds, check_nk_rx_large_niov], args=(cfg,))
     ksft_exit()
 
 

-- 
2.53.0-Meta


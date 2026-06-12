Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9703E5572
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 16:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281699; cv=none; b=q4yccNBzr53krN2XtnF2+Wyj+8Kqfiet2FV8EeeIDqmlwymBWUMsKviNiYqENV/Q8Nh+xd4BY3d6g2m+rdzkmOzTkpV+CrvBhdaKZgZIAQ/UiRnPNN6bmFOPo4DdJJwHY+Indtskd7neay2IAT56xzJrBOZA4FusEIT4QqMgtNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281699; c=relaxed/simple;
	bh=A/u1sgwJL84QuL//U05v2lBMcf3jkxTHTxBmA7D1yHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJiuM9Gssflddc5O9R551PjqkPBC4vfNlxBsmR4eBq7mvew/S1LJSYKQJv9ZyN6shtSJX/EWZCNOv4iZKBYeSZlSmkS+wXr7vvYhoSwXycN8C/rvqlxGHXTGMHWuQXwGSW+IGIDJ81RBzKDp9x0YutoDFO/OvjxeBbIMKl27PuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJA6a/P7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJA6a/P7"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso1015380a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 09:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781281696; x=1781886496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj5Chnos4zVE+LHfOdXd/pBqHjH9b6HHf2TeuBkMLx4=;
        b=LJA6a/P7TAf268QT7dfVC9ZOhmkzGSkNeMyo+s3fLaxZAJgb/VStCqtAJxo8AnWN8u
         XvNzlsowvgQphvlD/TanboyMiUdB8SVhqr0WG5BEyw0QJDMuuL4l/jegUbpPXaJDPd61
         P6FJ8jINuoo2T7hiTgtDlDrnYJ4Oq4oara67fsxJ6yL6eBLEeI/3q0BQy8fCzjcfRAbt
         V5sFcQiWIJPHdtHMTIRlBO0oPy7lREyCewjmOLDyHK5AntUhx7JXAKda5KDQBXfcDVpA
         v6IFynQlvev+B+bT6GIi80zL3jVgvPkAzPCgP/14OFQWJ7GQojzRA670XWopbcnCd1vV
         yCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781281696; x=1781886496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yj5Chnos4zVE+LHfOdXd/pBqHjH9b6HHf2TeuBkMLx4=;
        b=cL4LUqOra3ee6eTTdl9UNum2r5kfUCtcXFd0S4opwiSOjHra8wls5YiNN0L4uwgNwK
         6SyZUA+39QCL6xupd/sH4943JU94IEjuwZNhErt8CPJtqmLfQSJS09YXiytMP1OpIXcS
         xSF/bnosEU7U7MRl25N2oA8VOzARIL2PTas9/wkiCYvapV7d+fihZuhk8MyIOLLLyRGP
         iQAoZJBkFioVWyK+BE76gBrUlNPfWFnzE2UySfB0OwPjryX9m4Fn1IrDHOB9c6T5QyvS
         p4/ytxjzOnh+6Vuz7mKUpRqQT6Y1idxX8hC8PJ5ofC30CtDFYXnBq7j+E6oxBB7Q9aHc
         PtGw==
X-Forwarded-Encrypted: i=1; AFNElJ9i6fHVur9Ailmoh82Uv2sXYusESf5z7n/8rpPqjhRDwdiv1V/xcSBHaNpVgM7T80JY53oljn9HN5ctK1exbgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJQPSI3bTuRlekVZFaZiO7sqhZuY2DM5Jm0oa8lADCeT0ReZzU
	x9MctDDoPwzTOy474GvrOJh0sRipJb6kN4/pf6Mlm7IpxzJIA3KZyHwL
X-Gm-Gg: Acq92OElK89opLrU/mnNOX5pJ8hlr1o8b32EDtnZYTXVWUM8b2dUmT9jgdFLMG1QFCF
	TwVGw+kDSBHa6pAZhuGKEPoTVLgWg7oK2Pg5nzh8Xayh6eEGwnYaySZktwKFg44OqDvFrgmSA2x
	BaYkZZJRii/FzBRTUI7Qj8vaP3RQeBC+C1OvSWYqiePXNAgo5KjnCm817mdcU4JMt7Flu02vKcJ
	EKCLt1cJEZIuniqzxZLNi8l9oGGYatud3/Mg8zFA90GFn376KrHVYLRx9HNAbvbG6Cxab2H6Lf7
	ZQCmBAWyGrnpj2SNGP9HBOnOrUX4YsckZeXSkBu6wvtBuKiLkylpbih7ahttyfG+G6jN4XJ2bu5
	u3v1EaLmHYTh0mEPmbDBV8RdshC5KT+VNppVBxSwM9dtV5nps1vNzsHqyMlb0BO8DPxM2xs1OBH
	mBlGdqyepI3t5jXCxVhqazJ5UyRUC8xA==
X-Received: by 2002:a17:90b:4b8c:b0:36e:2106:ded8 with SMTP id 98e67ed59e1d1-37a040b3449mr3725356a91.25.1781281696041;
        Fri, 12 Jun 2026 09:28:16 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e7e217c0sm2114029a91.2.2026.06.12.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 09:28:15 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 12 Jun 2026 09:26:00 -0700
Subject: [PATCH net-next v3 4/4] selftests/net: devmem.py: add
 check_rx_large_niov
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-tcpdm-large-niovs-v3-4-a3b693e76fcb@meta.com>
References: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
In-Reply-To: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
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
 tools/testing/selftests/drivers/net/hw/devmem.py   | 12 ++++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 58 +++++++++++++++++++++-
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 11 +++-
 3 files changed, 75 insertions(+), 6 deletions(-)

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
index 0921ff03eb81..d2f00a876767 100644
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
@@ -202,6 +218,44 @@ def run_tx_chunks(cfg):
     ksft_eq(socat.stdout.strip(), "hello\nworld")
 
 
+def _restore_nr_hugepages(hp_file, nr_hugepages):
+    with open(hp_file, 'w', encoding='utf-8') as f:
+        f.write(str(nr_hugepages))
+
+
+def run_rx_large_niov(cfg):
+    """Run the devmem RX test with a large niov (rx-buf-size > PAGE_SIZE).
+
+    Sweep payload sizes that straddle the niov boundary: below, equal to,
+    and above rx_buf_size, to exercise sub-niov, exact-niov, and multi-niov
+    RX paths.
+    """
+    hp_file = "/proc/sys/vm/nr_hugepages"
+    with open(hp_file, 'r+', encoding='utf-8') as f:
+        nr_hugepages = int(f.read().strip())
+        if nr_hugepages < 64:
+            f.seek(0)
+            f.write("64")
+            defer(_restore_nr_hugepages, hp_file, nr_hugepages)
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


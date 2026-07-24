Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9263E46A5FC
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928112; cv=none; b=TxWaCWVH5RheStKobH6eG33+TUDtoBm5i33epdPG6E6HtP+YLrUvVCgf/taI1rhDfCIQi+uM4hnEjMiNg17uIIzrEbZ75sy+CEA8Skflt/wL17eXLgjisFTcujSOLPvAXbynPRPSKfBdHZy+wnSdKLKIEzXhK2UUZqZz3Ok/hXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928112; c=relaxed/simple;
	bh=RG1zMOAjscVettyJyIUMDCMbHN2ZmcaGTf0gdEBIwgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5S9hS9kAhiVMU5FM1Hv16ZKxNQS1SYwZjGmVe9IOdx4RlqdqybxaCzh87/f5U3Oen+8bdVuMMfPDMXqAu1KNNzQjD0bFP6SLzr7ivKuqmsKiDTlM8kg7VFu7Q8IhFoyoJYsTnAJ2MEh6/6P6ip/LdzqOzLdk62340AOKMyll7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYuhkWGE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYuhkWGE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caced6038eso12570035ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784928110; x=1785532910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVE9mezfwx2DgerLJfcGNMZoP6+QarHJ8jyXD0AzZd8=;
        b=pYuhkWGEdMplHguPsYCrXBQKufIJDypB6WhFgtenVoIpsYKo2PvULNfdiSUZ5XZsOn
         g7xu0CoZk9JmQZAjmLDAW3nEDu8oITArYrw5EkWgM/8eCtSwWTDjiSEiQzP0uulc5rEz
         gZt+Iy9F/4fvZW8xyXPIvpuxP0NjO1wvVusw3KHZYv5mHiMLasZQvjgoOAi6c6uHkPMT
         SPuWtDOJLG5UbtrA4EnIK37Sqy8YtMidBWQrV5RnrCscPLTMpY+D0/12SE812pOF61cM
         ZboJlN6/dZHGCZlVyB1/mMrHdf6DdLSs2X9owLxRQvqSRpKTvUzpDXGPdPKxvwFnEqo0
         QowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928110; x=1785532910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVE9mezfwx2DgerLJfcGNMZoP6+QarHJ8jyXD0AzZd8=;
        b=ee8CTRdiPEai5qBmHn0AtRNYQq8Rj6Abjds61hRCBPW4sn5fliQu/yV8J5RTlHtRFD
         fsHPrrWkj7W1s1eMid5PrtlSQdLgs6tFmbv/LKf4U3XinsBmuf5RpobvpExeKvgl9X4Z
         qMJdn+k3LXBcwSfyCvh2DQyESK6iGjKxiH1fC6/HvbrqSEM0lFBJXqNF1TR1PSCu5tZp
         BZRE8PRix37/gvI+3e/QkFynIcO/8mLu8P1mlxGAzUer68+ydDGVd5mvFytRNZ98f3Dn
         DZM7ArS7tWBat6qL6EOAECGJWaTFU4s6wHejFVAtOvy74t/5Ji0loXE7heJxHrQuJv04
         2ISQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq29qUFEPWP5CntQPbfbmHeWvt9pa856HpLFhctSD3lQ5GI3vW4csKkOOsu3oUnoGUSGu9wdy5+ijpkwqLcjW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGFl8xNh70deY3wHYJ99DiJ3tg4XuR1pz1SmhPjqkQaJ7jatX
	SldDPd61kTq3MaTCrL7z/CoDGULPwceTBU+Ky0Ea+/H4mdH0PlaUr8ch
X-Gm-Gg: AR+sD13D8ENNg79Rt0rmWVCf3GeIn0QPJj37NbSJOG4zQpiMiIxnV/AR2E2e1b2wp+2
	D607UDVhKbAgkeCU/dvctR2GlkkU2B+0cYeyYQysialkNUF3GPM/RDbuVASV2KaPGlB5yK1xoNR
	UysP/NT2E+TBVnGzSJG9YBv43N9UAg9raIowxP960uwZdwzb6eJU0m6pHQb7vWAhh2DePP5E+Dl
	kKnN1Pu28aTkeyfaHMRzsIr1124OmROdXLFFtErOqrKclJ/SN/miGzzrgkuCIRUcWpVE97hpU4Q
	w+swhKJAtyfN6QmR2MOM9k7duHaIiowuHAIyGguYHDH/99PXiVsOE2E5Ohg0TFKArk4dTzJpMHq
	fRPzOwRsEY+SFPdJnZ4cdi9tdiADXdFKpDxDmIT1Ygohe9Hkc57NT2J70R/ZL1+T1ReVBseo3M/
	eCazgjrl3WdNzB56sYwW875ku6Hn7dql2OdYiO1ZsL83k5FtAr3j+Bwc6M
X-Received: by 2002:a17:903:1c2:b0:2bc:e299:4b3f with SMTP id d9443c01a7336-2cfd7953a96mr18792475ad.10.1784928109829;
        Fri, 24 Jul 2026 14:21:49 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcb3sm330815ad.82.2026.07.24.14.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:21:49 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 24 Jul 2026 14:21:17 -0700
Subject: [PATCH net-next v6 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-tcpdm-large-niovs-v6-3-7975f62cdfbb@meta.com>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
In-Reply-To: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
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
 dw@davidwei.uk, Joe Damato <joe@dama.to>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add a new devmem test case for binding the dmabuf with rx-page-size=16K.
The test sweeps RX payload sizes straddling the niov boundary to cover
the sub-niov, exact-niov, and multi-niov RX paths.

Silence pylint invalid-name (`with open() as f`) and too-many-arguments
(ncdevmem_rx grew to 6 args) at file scope.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 tools/testing/selftests/drivers/net/hw/devmem.py   | 11 +++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 59 +++++++++++++++++++++-
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 10 +++-
 3 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/testing/selftests/drivers/net/hw/devmem.py
index 031cf9905f65..82c11ffc4add 100755
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
 
@@ -30,11 +31,17 @@ def check_rx_hds(cfg) -> None:
     run_rx_hds(cfg)
 
 
+def check_rx_large_niov(cfg) -> None:
+    """Run the devmem RX test with rx-page-size = 16 KiB."""
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
index 0921ff03eb81..6c932018b463 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+# pylint: disable=invalid-name,too-many-arguments
 """Shared helpers for devmem TCP selftests."""
 
 import re
@@ -8,7 +9,7 @@ from lib.py import (bkg, cmd, defer, ethtool, rand_port, wait_port_listen,
                     NetdevFamily)
 
 
-def require_devmem(cfg):
+def require_devmem(cfg, rx_page_size=0):
     """Probe ncdevmem on cfg.ifname and SKIP the test if devmem isn't supported."""
     if not hasattr(cfg, "devmem_probed"):
         probe_command = f"{cfg.bin_local} -f {cfg.ifname}"
@@ -18,6 +19,19 @@ def require_devmem(cfg):
     if not cfg.devmem_supported:
         raise KsftSkipEx("Test requires devmem support")
 
+    if rx_page_size > 0:
+        if not hasattr(cfg, "devmem_rx_page_size_probed"):
+            cfg.devmem_rx_page_size_probed = {}
+
+        if rx_page_size not in cfg.devmem_rx_page_size_probed:
+            probe_command = f"{cfg.bin_local} -f {cfg.ifname} -b {rx_page_size}"
+            cfg.devmem_rx_page_size_probed[rx_page_size] = \
+                cmd(probe_command, fail=False, shell=True).ret == 0
+
+        if not cfg.devmem_rx_page_size_probed[rx_page_size]:
+            raise KsftSkipEx(
+                f"Test requires devmem rx-page-size={rx_page_size} support")
+
 
 def configure_nic(cfg):
     """Channels, rings, RSS, queue lease for netkit devmem."""
@@ -76,7 +90,8 @@ def set_flow_rule(cfg, port):
     return int(re.search(r'ID (\d+)', output).group(1))
 
 
-def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
+def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
+                rx_page_size=0):
     """Build the ncdevmem RX listener command."""
     if hasattr(cfg, 'netns'):
         flow_rule_id = set_flow_rule(cfg, port)
@@ -96,6 +111,8 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
         extras.append("-v 7")
     if fail_on_linear:
         extras.append("-L")
+    if rx_page_size > 0:
+        extras.append(f"-b {rx_page_size}")
 
     parts = [cfg.bin_local, "-l", f"-f {ifname}", f"-s {addr}",
              f"-p {port}", *extras]
@@ -202,6 +219,44 @@ def run_tx_chunks(cfg):
     ksft_eq(socat.stdout.strip(), "hello\nworld")
 
 
+def _restore_nr_hugepages(hp_file, nr_hugepages):
+    with open(hp_file, 'w', encoding='utf-8') as f:
+        f.write(str(nr_hugepages))
+
+
+def run_rx_large_niov(cfg):
+    """Run the devmem RX test with a large niov (rx-page-size > PAGE_SIZE).
+
+    Sweep payload sizes that straddle the niov boundary: below, equal to,
+    and above rx_page_size, to exercise sub-niov, exact-niov, and multi-niov
+    RX paths.
+    """
+    hp_file = "/proc/sys/vm/nr_hugepages"
+    with open(hp_file, 'r+', encoding='utf-8') as f:
+        nr_hugepages = int(f.read().strip())
+        if nr_hugepages < 64:
+            f.seek(0)
+            f.write("64")
+            defer(_restore_nr_hugepages, hp_file, nr_hugepages)
+    require_devmem(cfg, rx_page_size=16384)
+    configure_nic(cfg)
+    netns = getattr(cfg, "netns", None)
+
+    for size in [1024, 4096, 8192, 16384, 32768, 65536]:
+        port = rand_port()
+        socat = socat_send(cfg, port)
+        listen_cmd = ncdevmem_rx(cfg, port,
+                                 flow_steer=not netns,
+                                 rx_page_size=16384)
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
index 300ed2a70ab4..61c6f31f01e5 100755
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
 
@@ -31,6 +32,11 @@ def check_nk_rx_hds(cfg) -> None:
     run_rx_hds(cfg)
 
 
+def check_nk_rx_large_niov(cfg) -> None:
+    """Run the devmem RX large-niov test through netkit."""
+    run_rx_large_niov(cfg)
+
+
 def main() -> None:
     """Run the netkit devmem test cases."""
     with NetDrvContEnv(__file__, rxqueues=2, primary_rx_redirect=True) as cfg:
@@ -38,7 +44,7 @@ def main() -> None:
                    os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                 "ncdevmem"))
         ksft_run([check_nk_rx, check_nk_tx, check_nk_tx_chunks,
-                  check_nk_rx_hds], args=(cfg,))
+                  check_nk_rx_hds, check_nk_rx_large_niov], args=(cfg,))
     ksft_exit()
 
 

-- 
2.53.0-Meta


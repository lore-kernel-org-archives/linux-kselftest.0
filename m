Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3772B274670
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457979; cv=none; b=STzmBvbxwdekoybReBG28U09skICRA65XE/0qaxWtNFySfv/ocf6cQg+2Dm0B9zcV+mrKwhTUjgXbPrSQJgFkbWHN/JzDy0FaeuBwkOnOSv8DVwfeEDNp75Z5fXSmDwHIfIp8XoojIi06/v8pfZs59sHkAVSgiEl0MFWk3+n268=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457979; c=relaxed/simple;
	bh=/28TnXUMBW7B1XY6WxMDZBLJy7i9uqBt1MSUCdQ2BeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1NcA63hploo/79qPnNFpfvxh26FlHqUCih8ii9xujmorG3xsc7kjge90xS0Jj0fPe9Okzlt8aNzSPqNfpJAIuEVCBn8WYYtFyF0HjHXBgVUxxg3OqoN9Bpvic4wMTWVKz/4LsFAPGQ0HnYLoirgxjc3LpxdGb9uGJo1Str8oMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgqVmjuE; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgqVmjuE"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so342091a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785457974; x=1786062774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lVRsPFiIdtPB9DslbLIhlupoyA5riRltCZqTzlKbSk=;
        b=QgqVmjuEfWSzzcEIELGDuPBDtu1xjO2Aq+NiHJdTjRb7bvIjrLCCW3RYlQo3vge5uT
         cqiTN3hZbx5UCmyJWBrDRfgEZF7jKryQTTThMesg9kZ7fQhpfPhmvknOsJs9l0ibP+t6
         aw2Q9DlF4yVReyL5uN37w8G2nEHM06aGgNhe8WJwWY4twfHlAA79GTQy3MmwQpZfuMpa
         XW/VHi6RYrrUXWty3AM/Kb3C8wKqWpzUNzbLDSB/FfJFcOSB+HmBcIdM2oa0Up342zvB
         BNCOCllH+ihyn+tC8pymYyucxG2000732E4GEZAkOkl6tpBEMde2A7vyPn6eNzRp8RGY
         fyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457974; x=1786062774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lVRsPFiIdtPB9DslbLIhlupoyA5riRltCZqTzlKbSk=;
        b=QPysZ0/ifKJNnCwJhzh4mlqHkVjJiy4uu5etPhTpvnVlmokNfU9A4lTE+2ZfbhBTNm
         VZ8MTeyoy8Iyj1A35JmrAJCyHRyhamHMP10HT4sVX8YCrewe/3thmx8bdqOiWzjvr4An
         Rcd1ti7gP6nygKfZuhb5hW8B994XUrO8c8IHb+Cl8o7AdyVdgarkVXUVivx0sijbDd28
         wFfuKZBC1xH5hWSQYrneVzbY2D9T0EEpwcYtf1PQXioPR2Pqq5UgqsrxevdVmWqDeChg
         CdN8LujJMoN+R8II47aLuM0iOJHRJcX5cru4vID0yB6J5X9AfFe/nx/C9IorARREEjP6
         7jUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq30U8o9LV2m5th+UYDy9xsea5m3a0eziN5ClxuNthuypnys/l7vhZhuocSkBN/kncOfOzVeA7hGuBf9Nrhhpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDtY1mcuFxTKWfOmJL37ado3Ag8mGr+Ylvqxk3UVO2bAus0Z3E
	AYqpfpfuakCh9WCmOAFPT8duNXmI7PL2LQ0vxJAfH1C5xnjB3lQXU+Kz
X-Gm-Gg: AR+sD126Zr0JgGAYwubsFJWBtsYnZKj6Kd+H04IyzGuBR9WwQtYZgTI+4wbHxn17OsG
	1JGfZ+9Fqdg/P9+dYTeETGFD1oLOmevWzGcBZgMQbey61TPnVL4vlqAA7nu3epSO19Pc45hEOfa
	DdDRpC+qW0R+GRfnNQpdHT9dh7rMfl6h973/nbZvhHsBtZEHxUIPiAh+Gqf7wkrSRnBGNYDPF+p
	ltjzk8TOcgAGNeNxxMsPniTDLdvBAfV0KBpDfZIKOh28j1df+QpBed/ddk/YJmnhgHR48jWoHz6
	7DSuqk5GO+lMN2kZ9vxYOqz34s12RBy7XLk0PaRP1RSpeCypNx0d5VNW3uFc4x/tN/KjwSyVoWA
	4m6wPMHHYXb1F9qulelVvT88YU6xXvOaT4L932FjoajyPGANf3E2si8wLSImM9fy8JLiHkTR35Q
	I7QNlX7LquTSkn0fjvwWSr5Jylg+LwcNvwk6k4ZKgaRml6l1bwVeZWZAA=
X-Received: by 2002:a17:90b:2685:b0:38f:5801:eaf7 with SMTP id 98e67ed59e1d1-38f9bece617mr4253015a91.27.1785457974360;
        Thu, 30 Jul 2026 17:32:54 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:a::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b46a048sm1659459a91.7.2026.07.30.17.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:32:53 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Thu, 30 Jul 2026 17:32:12 -0700
Subject: [PATCH net-next v7 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-tcpdm-large-niovs-v7-3-033d580a619d@meta.com>
References: <20260730-tcpdm-large-niovs-v7-0-033d580a619d@meta.com>
In-Reply-To: <20260730-tcpdm-large-niovs-v7-0-033d580a619d@meta.com>
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

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/devmem.py   | 11 +++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 74 +++++++++++++++++++++-
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 10 ++-
 3 files changed, 89 insertions(+), 6 deletions(-)

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
index 0921ff03eb81..cbe3a8e49823 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
+# pylint: disable=invalid-name,too-many-arguments
 """Shared helpers for devmem TCP selftests."""
 
+import os
 import re
 
 from lib.py import (bkg, cmd, defer, ethtool, rand_port, wait_port_listen,
@@ -8,7 +10,15 @@ from lib.py import (bkg, cmd, defer, ethtool, rand_port, wait_port_listen,
                     NetdevFamily)
 
 
-def require_devmem(cfg):
+def _is_aligned(value, alignment):
+    """Equivalent of the kernel IS_ALIGNED(value, alignment).
+
+    alignment must be a power of two.
+    """
+    return (value & (alignment - 1)) == 0
+
+
+def require_devmem(cfg, rx_page_size=0):
     """Probe ncdevmem on cfg.ifname and SKIP the test if devmem isn't supported."""
     if not hasattr(cfg, "devmem_probed"):
         probe_command = f"{cfg.bin_local} -f {cfg.ifname}"
@@ -18,6 +28,25 @@ def require_devmem(cfg):
     if not cfg.devmem_supported:
         raise KsftSkipEx("Test requires devmem support")
 
+    if rx_page_size > 0:
+        page_size = os.sysconf("SC_PAGE_SIZE")
+        if not _is_aligned(rx_page_size, page_size):
+            raise KsftSkipEx(
+                f"rx-page-size={rx_page_size} is invalid for this platform "
+                f"(must be a multiple of PAGE_SIZE={page_size})")
+
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
@@ -76,7 +105,8 @@ def set_flow_rule(cfg, port):
     return int(re.search(r'ID (\d+)', output).group(1))
 
 
-def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
+def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
+                rx_page_size=0):
     """Build the ncdevmem RX listener command."""
     if hasattr(cfg, 'netns'):
         flow_rule_id = set_flow_rule(cfg, port)
@@ -96,6 +126,8 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
         extras.append("-v 7")
     if fail_on_linear:
         extras.append("-L")
+    if rx_page_size > 0:
+        extras.append(f"-b {rx_page_size}")
 
     parts = [cfg.bin_local, "-l", f"-f {ifname}", f"-s {addr}",
              f"-p {port}", *extras]
@@ -202,6 +234,44 @@ def run_tx_chunks(cfg):
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


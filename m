Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552437BE8C
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 01:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450679; cv=none; b=nCdlyZic/qa0yeAdKc+VSBHiHzu9A1Qqi1CwYVUZI6YwWUgLDJ1Zj/uL/7qe6hfOGRxZ9Wg9CZFtL/LthTErkvDPZZjtGViiGO4X/qnYuDDdyBbB1UOXkuP2rrozjGIUICdv0YNN1nK/HBw0kJIWON/EwLnQqU+QVSGhH4M+EXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450679; c=relaxed/simple;
	bh=wQa0+PR590RvvsPJ8mcZQFY9BTUEq3s57UM2A3Ix4Z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cq0fdTyApDdR1LmhMVnwDdiesJiYkdiyKVUsPvSaJ/QYP/bGsD+PECKNhJ3qH995QOfC0njG+ZplzEc+w4meB4FS4twcrOvHapxpzHfC4PXuPPC9aPVIbst5KPzEroqKpHxupML/AgsgMyeMUEVvJxglYIzqRXYc+u/n59NkJcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8CBl2/T; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8CBl2/T"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so2139840a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 18:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780450675; x=1781055475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjhGA/iRmYG+PA1yrZnoVXmSA038wnK54FiTZiG9kls=;
        b=K8CBl2/TaCxzlttuJ5OOEuvmz09DgSvRbgc70NHYTrxnKSyUUaS2YCjfSJvIvbzCB4
         HWHn+IqGs/1INnXX7/WOKRkajmv2d+mti3Ib0GBAWXQlHcILdAqrcEdAczT/LIiAVesT
         79RJ1tO2//RIMT3JWJUOgp4V/l7JrIorTRd/+SROrhqy6Ae508cS7YNLPe2qfJoAFzzS
         mUxCqNFjTJDEnbjdXY/Ocnc5YR0joGm34kkSWx1ClN8pJrZ4XZHUEPUBBWw31usgXKsm
         uyACXhBTElpA5EaW3tEWatHbdHzHUHHO0kBwpLQWW3Hs0O6WDm5LkZ8/IBUknVlhNM44
         6YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780450675; x=1781055475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NjhGA/iRmYG+PA1yrZnoVXmSA038wnK54FiTZiG9kls=;
        b=JY4TbxxjN79MsgtVPkxSZ2/6mPY9ZqhvK75wmLs7JL5bzqK/V1L03t74W1XXIsB4FH
         2S4u4t8P7NV5aF4zAjF3MAOiSD1DLsBM+DuGat/XxO2Ny7oFKP5WJieb5Bb2sh9vkFLx
         EFeUvLYIJuOQIcdhuffbbscqKBpFNW95l2NFVw03iQlj5csRp+1U1eK8EOVPNiB0NCLx
         heExcQ1um5e5YlEri+aVTO3uMq78hcn/q+XaWvqqeiO/djNaPlmRdSx7AUdSClfncvi3
         n25LP7jfIOUEHVpMcw6aPEwvzN5/d6b8d8ZgO6lgr9apNmLRJoloVZs29CVtIfi+YDEJ
         LBMg==
X-Forwarded-Encrypted: i=1; AFNElJ+oYjkTx9kbvn6m9y2ViVQfwRjolRQ2ZGoXRQjM97OZRwHE3gnGI6q5DLoe1cq5StWC3LSoUWoW34QoLoFJVFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBaY7AfR4ruexc6lYem6DG+Ny27FDPU9GJkx8Avlpwr7GP65F
	zcOOCSysmGGC8KI+x60G5cfnKCwuUiAxoscypNYF00+wvASzem2E9cpT
X-Gm-Gg: Acq92OEp14BLRag+YFS4S1DJNKEZaTaS71Elup8gRWm5coMbT3WutpZ0WEkg+W4VBcz
	FM6a/9K43efS8RIOhEf0LgX+LLH9jsZ0jU99CnUmnvfIafOuIQsJ27QECHuKykuNZjXUCdvGn04
	eIrDtOh7nToWg0p/Owlo0RWFt375/OWWq9SVgiAfyc8a5rz8ScdCqtElChA1i08eX1H4PI0AH9K
	NfFyrOA4YQrvJVDbOmGeV6SoZTVmBg7nkgsA6qFo9y9aNMG8AwZLxJog4KdaxvVR/K7jl+bQUQ7
	aapYQsz7sOro0H7abqPVZRT2alPWXIXVHcqpVWIaoODHCTS7WDshRq/BdNoNBL51jbo4mVTAGrc
	FKWjFkE1toipOrhej8EvhUQ4P6+S5h08lURYRwOMGR/KPmL5tKLRv+VSdpX1FI8Jd+3dPkYh8Fa
	lmoeDSeUyGDVEHxIIgCPB0xercd2sbVw==
X-Received: by 2002:a17:90b:48c5:b0:369:971:4888 with SMTP id 98e67ed59e1d1-36e30a284d3mr1282699a91.15.1780450675150;
        Tue, 02 Jun 2026 18:37:55 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:71::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e6eabdd57sm128204a91.5.2026.06.02.18.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:37:54 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 02 Jun 2026 18:37:32 -0700
Subject: [PATCH net-next v2 2/2] selftests: drv-net: add userns devmem RX
 test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-nl-prov-v2-2-ad721142c641@meta.com>
References: <20260602-nl-prov-v2-0-ad721142c641@meta.com>
In-Reply-To: <20260602-nl-prov-v2-0-ad721142c641@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Stanislav Fomichev <sdf@fomichev.me>, 
 Mina Almasry <almasrymina@google.com>, daniel@iogearbox.net, 
 matttbe@kernel.org, petrm@nvidia.com, dw@davidwei.uk, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add userns_devmem.py, which mirrors nk_devmem.py but places the netkit
guest in a netns whose owning user_ns is non-init. ncdevmem is ran there
via nsenter so the bind-rx call is issued with creds that hold
CAP_NET_ADMIN only in the child user_ns.

Without the preceding GENL_UNS_ADMIN_PERM patch the test fails at
bind-rx with EPERM, but with the patch the transfer completes and tests
pass.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/Makefile    |  1 +
 tools/testing/selftests/drivers/net/hw/config      |  1 +
 .../selftests/drivers/net/hw/lib/py/__init__.py    |  4 +-
 .../selftests/drivers/net/hw/userns_devmem.py      | 49 ++++++++++++++
 .../selftests/drivers/net/lib/py/__init__.py       |  4 +-
 tools/testing/selftests/drivers/net/lib/py/env.py  |  8 ++-
 tools/testing/selftests/net/lib/py/__init__.py     |  4 +-
 tools/testing/selftests/net/lib/py/netns.py        | 75 +++++++++++++++++++++-
 tools/testing/selftests/net/lib/py/utils.py        |  7 +-
 9 files changed, 142 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index c7a1206880ea..fd0535a96d84 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -47,6 +47,7 @@ TEST_PROGS = \
 	rss_input_xfrm.py \
 	toeplitz.py \
 	tso.py \
+	userns_devmem.py \
 	uso.py \
 	xdp_metadata.py \
 	xsk_reconfig.py \
diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
index 8c132ace2b8d..3da6d3e39960 100644
--- a/tools/testing/selftests/drivers/net/hw/config
+++ b/tools/testing/selftests/drivers/net/hw/config
@@ -17,5 +17,6 @@ CONFIG_NET_IPGRE_DEMUX=y
 CONFIG_NETKIT=y
 CONFIG_NET_SCH_INGRESS=y
 CONFIG_UDMABUF=y
+CONFIG_USER_NS=y
 CONFIG_VXLAN=y
 CONFIG_XFRM_USER=y
diff --git a/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py b/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
index 84a4dab6c649..8a58cb17cc06 100644
--- a/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
@@ -18,7 +18,7 @@ try:
     sys.path.append(KSFT_DIR.as_posix())
 
     # Import one by one to avoid pylint false positives
-    from net.lib.py import NetNS, NetNSEnter, NetdevSimDev
+    from net.lib.py import NetNS, NetNSEnter, NetdevSimDev, UserNetNS
     from net.lib.py import EthtoolFamily, NetdevFamily, NetshaperFamily, \
         NlError, RtnlFamily, DevlinkFamily, PSPFamily, Netlink
     from net.lib.py import CmdExitFailure
@@ -34,7 +34,7 @@ try:
     from drivers.net.lib.py import GenerateTraffic, Remote, Iperf3Runner
     from drivers.net.lib.py import NetDrvEnv, NetDrvEpEnv, NetDrvContEnv
 
-    __all__ = ["NetNS", "NetNSEnter", "NetdevSimDev",
+    __all__ = ["NetNS", "NetNSEnter", "NetdevSimDev", "UserNetNS",
                "EthtoolFamily", "NetdevFamily", "NetshaperFamily",
                "NlError", "RtnlFamily", "DevlinkFamily", "PSPFamily", "Netlink",
                "CmdExitFailure",
diff --git a/tools/testing/selftests/drivers/net/hw/userns_devmem.py b/tools/testing/selftests/drivers/net/hw/userns_devmem.py
new file mode 100755
index 000000000000..2aaf6ea81715
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/userns_devmem.py
@@ -0,0 +1,49 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Devmem tests for non-init userns.
+"""
+
+import os
+
+from devmem_lib import run_rx, run_rx_hds, run_tx, run_tx_chunks, setup_test
+from lib.py import NetDrvContEnv, ksft_disruptive, ksft_exit, ksft_run
+
+
+@ksft_disruptive
+def check_userns_rx(cfg) -> None:
+    """Run the devmem RX test through non-init userns netkit."""
+    run_rx(cfg)
+
+
+@ksft_disruptive
+def check_userns_tx(cfg) -> None:
+    """Run the devmem TX test through non-init userns netkit."""
+    run_tx(cfg)
+
+
+@ksft_disruptive
+def check_userns_tx_chunks(cfg) -> None:
+    """Run the devmem TX chunking test through non-init userns netkit."""
+    run_tx_chunks(cfg)
+
+
+def check_userns_rx_hds(cfg) -> None:
+    """Run the HDS test through non-init userns netkit."""
+    run_rx_hds(cfg)
+
+
+def main() -> None:
+    """Run userns devmem RX selftests against the test environment."""
+    with NetDrvContEnv(__file__, userns=True, rxqueues=2,
+                       primary_rx_redirect=True) as cfg:
+        setup_test(cfg,
+                   os.path.join(os.path.dirname(os.path.abspath(__file__)),
+                                "ncdevmem"))
+        ksft_run([check_userns_rx, check_userns_tx, check_userns_tx_chunks,
+                  check_userns_rx_hds], args=(cfg,))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/testing/selftests/drivers/net/lib/py/__init__.py b/tools/testing/selftests/drivers/net/lib/py/__init__.py
index 09aac4ce67bc..ee903bcf3207 100644
--- a/tools/testing/selftests/drivers/net/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/lib/py/__init__.py
@@ -18,7 +18,7 @@ try:
     sys.path.append(KSFT_DIR.as_posix())
 
     # Import one by one to avoid pylint false positives
-    from net.lib.py import NetNS, NetNSEnter, NetdevSimDev
+    from net.lib.py import NetNS, NetNSEnter, NetdevSimDev, UserNetNS
     from net.lib.py import EthtoolFamily, NetdevFamily, NetshaperFamily, \
         NlError, RtnlFamily, DevlinkFamily, PSPFamily, Netlink
     from net.lib.py import CmdExitFailure
@@ -32,7 +32,7 @@ try:
     from net.lib.py import ksft_eq, ksft_ge, ksft_in, ksft_is, ksft_lt, \
         ksft_ne, ksft_not_in, ksft_raises, ksft_true, ksft_gt, ksft_not_none
 
-    __all__ = ["NetNS", "NetNSEnter", "NetdevSimDev",
+    __all__ = ["NetNS", "NetNSEnter", "NetdevSimDev", "UserNetNS",
                "EthtoolFamily", "NetdevFamily", "NetshaperFamily",
                "NlError", "RtnlFamily", "DevlinkFamily", "PSPFamily", "Netlink",
                "CmdExitFailure",
diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index ef317aef3a0a..2cc78b8a2152 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -9,7 +9,7 @@ from pathlib import Path
 from lib.py import KsftSkipEx, KsftXfailEx
 from lib.py import ksft_setup, wait_file
 from lib.py import cmd, ethtool, ip, CmdExitFailure
-from lib.py import NetNS, NetdevSimDev
+from lib.py import NetNS, NetdevSimDev, UserNetNS
 from .remote import Remote
 from . import bpftool, RtnlFamily, Netlink
 
@@ -337,8 +337,10 @@ class NetDrvContEnv(NetDrvEpEnv):
               +---------------+
     """
 
-    def __init__(self, src_path, rxqueues=1, primary_rx_redirect=False, **kwargs):
+    def __init__(self, src_path, rxqueues=1, primary_rx_redirect=False,
+                 userns=False, **kwargs):
         self.netns = None
+        self._userns = userns
         self._nk_host_ifname = None
         self.nk_guest_ifname = None
         self._tc_clsact_added = False
@@ -463,7 +465,7 @@ class NetDrvContEnv(NetDrvEpEnv):
         with open(ra_path, "w", encoding="utf-8") as f:
             f.write("2")
 
-        self.netns = NetNS()
+        self.netns = UserNetNS() if self._userns else NetNS()
         cmd("ip netns attach init 1")
         self._init_ns_attached = True
         ip("netns set init 0", ns=self.netns)
diff --git a/tools/testing/selftests/net/lib/py/__init__.py b/tools/testing/selftests/net/lib/py/__init__.py
index 64a8c1ed4950..e58bdbdc58ee 100644
--- a/tools/testing/selftests/net/lib/py/__init__.py
+++ b/tools/testing/selftests/net/lib/py/__init__.py
@@ -10,7 +10,7 @@ from .ksft import KsftFailEx, KsftSkipEx, KsftXfailEx, ksft_pr, ksft_eq, \
     ksft_ge, ksft_gt, ksft_lt, ksft_raises, ksft_busy_wait, \
     ktap_result, ksft_disruptive, ksft_setup, ksft_run, ksft_exit, \
     ksft_variants, KsftNamedVariant
-from .netns import NetNS, NetNSEnter
+from .netns import NetNS, NetNSEnter, UserNetNS
 from .nsim import NetdevSim, NetdevSimDev
 from .utils import CmdExitFailure, fd_read_timeout, cmd, bkg, defer, \
     bpftool, ip, ethtool, bpftrace, rand_port, rand_ports, wait_port_listen, \
@@ -26,7 +26,7 @@ __all__ = ["KSRC",
            "ksft_is", "ksft_ge", "ksft_gt", "ksft_lt", "ksft_raises",
            "ksft_busy_wait", "ktap_result", "ksft_disruptive", "ksft_setup",
            "ksft_run", "ksft_exit", "ksft_variants", "KsftNamedVariant",
-           "NetNS", "NetNSEnter",
+           "NetNS", "NetNSEnter", "UserNetNS",
            "CmdExitFailure", "fd_read_timeout", "cmd", "bkg", "defer",
            "bpftool", "ip", "ethtool", "bpftrace", "rand_port", "rand_ports",
            "wait_port_listen", "wait_file", "tool", "tc",
diff --git a/tools/testing/selftests/net/lib/py/netns.py b/tools/testing/selftests/net/lib/py/netns.py
index 8e9317044eef..526f6aa80077 100644
--- a/tools/testing/selftests/net/lib/py/netns.py
+++ b/tools/testing/selftests/net/lib/py/netns.py
@@ -1,9 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 
-from .utils import ip
 import ctypes
+import os
 import random
 import string
+import subprocess
+import time
+from pathlib import Path
+
+from .utils import ip
 
 libc = ctypes.cdll.LoadLibrary('libc.so.6')
 
@@ -34,6 +39,74 @@ class NetNS:
         return f"NetNS({self.name})"
 
 
+class UserNetNS:
+    """Network namespace owned by a non-init user namespace."""
+
+    def __init__(self):
+        self.name = ''.join(
+            random.choice(string.ascii_lowercase) for _ in range(8))
+        self.user_ns_path = f"/run/userns/{self.name}"
+        self.net_ns_path = f"/run/netns/{self.name}"
+        self._user_mounted = False
+        self._net_mounted = False
+
+        os.makedirs("/run/userns", exist_ok=True)
+        os.makedirs("/run/netns", exist_ok=True)
+
+        Path(self.user_ns_path).touch()
+        Path(self.net_ns_path).touch()
+
+        with subprocess.Popen(
+                ["unshare", "--user", "--net", "--map-root-user",
+                 "sleep", "infinity"]) as proc:
+            try:
+                pid = proc.pid
+                init_user = os.readlink("/proc/self/ns/user")
+                for _ in range(200):
+                    try:
+                        if os.readlink(f"/proc/{pid}/ns/user") != init_user:
+                            break
+                    except OSError:
+                        pass
+                    time.sleep(0.01)
+                else:
+                    raise RuntimeError("unshare child did not create userns")
+
+                subprocess.run(["mount", "--bind", f"/proc/{pid}/ns/user",
+                                self.user_ns_path], check=True)
+                self._user_mounted = True
+                subprocess.run(["mount", "--bind", f"/proc/{pid}/ns/net",
+                                self.net_ns_path], check=True)
+                self._net_mounted = True
+            finally:
+                proc.kill()
+
+    def __del__(self):
+        if self._net_mounted:
+            subprocess.run(["umount", self.net_ns_path], check=False)
+            self._net_mounted = False
+        if self._user_mounted:
+            subprocess.run(["umount", self.user_ns_path], check=False)
+            self._user_mounted = False
+        for path in (self.net_ns_path, self.user_ns_path):
+            try:
+                os.unlink(path)
+            except OSError:
+                pass
+
+    def __enter__(self):
+        return self
+
+    def __exit__(self, ex_type, ex_value, ex_tb):
+        self.__del__()
+
+    def __str__(self):
+        return self.name
+
+    def __repr__(self):
+        return f"UserNetNS({self.name})"
+
+
 class NetNSEnter:
     def __init__(self, ns_name):
         self.ns_path = f"/run/netns/{ns_name}"
diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index be9408a77168..87eae79d01c1 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -47,7 +47,12 @@ class cmd:
                  background=False, host=None, timeout=5, ksft_ready=None,
                  ksft_wait=None):
         if ns:
-            comm = f'ip netns exec {ns} ' + comm
+            if hasattr(ns, 'user_ns_path'):
+                comm = (f'nsenter --user={ns.user_ns_path} '
+                        f'--net={ns.net_ns_path} --setuid=0 --setgid=0 -- '
+                        + comm)
+            else:
+                comm = f'ip netns exec {ns} ' + comm
 
         self.stdout = None
         self.stderr = None

-- 
2.53.0-Meta


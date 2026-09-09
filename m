Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E743939DE;
	Wed,  9 Sep 2026 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976813; cv=none; b=YD0nSLc8cAywSWwYTQ/4kH6viMe6NOKF2snet3r9fGyBe7dbU+2YHUnaljv1K+n5nUFHa290ZG90lyMu9sJ2wNNT8IpA7LRMf8Ww9SMpSFvftRPHMpsYXK54vS92KnTtr1qaaXOajecAwj752AJN7RFuYKWcCJipFE9F4u6dO6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976813; c=relaxed/simple;
	bh=F+IDTCP8/2HgkBa1eaWHMtr5fs4eRsqGV6K+vOtCoHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFyNt2tedP5Q/6SIN+3XwhHqGQeQwA8ZZ3x8/yT1lYpHLhqFMAbRr7R70GH0S2UbuwWLpY0YwREKctipAC1AFqnGigWZLMm6sCojPe8yDbE46DRY16KFN4aL+xGYX8jHTGUNYP8uRIB9raDokCK8VV+I5MJkleUGb78t+/r7a0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZE+casB1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZE+casB1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231A71F000FF;
	Wed,  9 Sep 2026 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788976811;
	bh=6wgG54EGTew86MP7O3cN9/jHMA8MTf/7MKoi6/IOdUA=;
	h=From:To:Cc:Subject:Date;
	b=ZE+casB1Om5+nzlV2DyBruFQ2KAWXmvCnAqkPEBIyzjV+f8JDlI9Rna+7kLZvOLwo
	 ZHxLzdJLctIsp2nKqZ89+GxwhuVmiKcna3gkmarz+v9HE5aRqAUwCEN3Hw6Y9oXYad
	 4NO7ke0rqYPMJf+Y3IwX4URlzSBWRRgl1GGsBACmSjtYlarEOEEe7zLCapIDXgqGD9
	 KmENvuPbYiQqBqSTcJ/OZu4V/e/eIgFJvdqKG2eSihkwd2m/+acO5soe8d3YdDxici
	 8yxxq7/ZEpoGBCxngaDgfeT2gd7DtqnfiS4wewkPIEYnXnq0FO+C200FsKbviOddfq
	 7iUdCak1kMrKA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	bobbyeshleman@gmail.com,
	shuah@kernel.org,
	cjubran@nvidia.com,
	cratiu@nvidia.com,
	noren@nvidia.com,
	willemb@google.com,
	petrm@nvidia.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2] selftests: net: add ctl_file_write() helper
Date: Wed,  9 Sep 2026 11:00:09 -0700
Message-ID: <20260909180009.1894019-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting a sysctl or a sysfs attribute for the duration of a test and
putting the old value back has been open coded multiple times.

We generally avoid creating library helpers but this one is very
common, and the defer is a little tricky as using the same function
for defer as the initial write leads to an infinite loop (not that
I would ever make such mistake!)

Some of the conversions are not identical, but arguably ctl_file_write()
semantics are more correct.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - rebase
 - drop the irq.py change which wasn't identical
v1: https://lore.kernel.org/20260904174134.3789400-1-kuba@kernel.org

CC: bobbyeshleman@gmail.com
CC: shuah@kernel.org
CC: cjubran@nvidia.com
CC: cratiu@nvidia.com
CC: noren@nvidia.com
CC: willemb@google.com
CC: petrm@nvidia.com
CC: linux-kselftest@vger.kernel.org
---
 .../testing/selftests/drivers/net/gro_lib.py  | 17 +++---------
 .../drivers/net/hw/devlink_rate_tc_bw.py      |  5 ++--
 .../drivers/net/hw/lib/py/__init__.py         |  4 +--
 .../selftests/drivers/net/hw/toeplitz.py      | 10 +++----
 .../selftests/drivers/net/lib/py/__init__.py  |  4 +--
 .../selftests/drivers/net/ring_reconfig.py    | 26 ++++---------------
 .../testing/selftests/net/lib/py/__init__.py  |  4 +--
 tools/testing/selftests/net/lib/py/utils.py   | 22 ++++++++++++++++
 8 files changed, 42 insertions(+), 50 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/gro_lib.py b/tools/testing/selftests/drivers/net/gro_lib.py
index 45ded8477a50..b7ac0660adc0 100644
--- a/tools/testing/selftests/drivers/net/gro_lib.py
+++ b/tools/testing/selftests/drivers/net/gro_lib.py
@@ -48,7 +48,7 @@ import re
 from lib.py import ksft_run, ksft_exit, ksft_pr
 from lib.py import NetDrvEpEnv, KsftFailEx, KsftXfailEx
 from lib.py import NetdevFamily, EthtoolFamily
-from lib.py import bkg, cmd, defer, ethtool, ip
+from lib.py import bkg, cmd, ctl_file_write, defer, ethtool, ip
 from lib.py import ksft_variants, KsftNamedVariant
 
 
@@ -85,17 +85,6 @@ GRO_DPORT = 8000
     return getattr(cfg, attr)
 
 
-def _write_defer_restore(cfg, path, val, defer_undo=False):
-    with open(path, "r", encoding="utf-8") as fp:
-        orig_val = fp.read().strip()
-        if str(val) == orig_val:
-            return
-    with open(path, "w", encoding="utf-8") as fp:
-        fp.write(val)
-    if defer_undo:
-        defer(_write_defer_restore, cfg, path, orig_val)
-
-
 def _set_mtu_restore(dev, mtu, host):
     if dev['mtu'] < mtu:
         ip(f"link set dev {dev['ifname']} mtu {mtu}", host=host)
@@ -250,8 +239,8 @@ def _run_gro_bin(cfg, test_name, protocol=None, num_flows=None,
         flush_path = f"/sys/class/net/{cfg.ifname}/gro_flush_timeout"
         irq_path = f"/sys/class/net/{cfg.ifname}/napi_defer_hard_irqs"
 
-        _write_defer_restore(cfg, flush_path, "200000", defer_undo=True)
-        _write_defer_restore(cfg, irq_path, "10", defer_undo=True)
+        ctl_file_write(flush_path, "200000")
+        ctl_file_write(irq_path, "10")
 
         _set_ethtool_feat(cfg.ifname, cfg.feat,
                           {"generic-receive-offload": True,
diff --git a/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py b/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
index 4e4faa9275bb..38d712755257 100755
--- a/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
+++ b/tools/testing/selftests/drivers/net/hw/devlink_rate_tc_bw.py
@@ -63,7 +63,7 @@ from lib.py import ksft_pr, ksft_run, ksft_exit
 from lib.py import KsftSkipEx, KsftFailEx, KsftXfailEx
 from lib.py import NetDrvEpEnv, DevlinkFamily
 from lib.py import NlError
-from lib.py import cmd, defer, ethtool, ip
+from lib.py import cmd, ctl_file_write, defer, ethtool, ip
 from lib.py import Iperf3Runner
 
 
@@ -113,8 +113,7 @@ from lib.py import Iperf3Runner
     except Exception as exc:
         raise KsftSkipEx(f"Failed to enable switchdev mode on {cfg.pci}") from exc
     try:
-        cmd(f"echo 1 > /sys/class/net/{cfg.ifname}/device/sriov_numvfs", shell=True)
-        defer(cmd, f"echo 0 > /sys/class/net/{cfg.ifname}/device/sriov_numvfs", shell=True)
+        ctl_file_write(f"/sys/class/net/{cfg.ifname}/device/sriov_numvfs", 1)
     except Exception as exc:
         raise KsftSkipEx(f"Failed to enable SR-IOV on {cfg.ifname}") from exc
 
diff --git a/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py b/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
index 8a58cb17cc06..81e1d1865cd5 100644
--- a/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
@@ -24,7 +24,7 @@ KSFT_DIR = (Path(__file__).parent / "../../../../..").resolve()
     from net.lib.py import CmdExitFailure
     from net.lib.py import bkg, cmd, bpftool, bpftrace, defer, ethtool, \
         fd_read_timeout, ip, rand_port, rand_ports, wait_port_listen, \
-        wait_file, tool
+        wait_file, ctl_file_write, tool
     from net.lib.py import bpf_map_set, bpf_map_dump, bpf_prog_map_ids
     from net.lib.py import KsftSkipEx, KsftFailEx, KsftXfailEx
     from net.lib.py import ksft_disruptive, ksft_exit, ksft_pr, ksft_run, \
@@ -40,7 +40,7 @@ KSFT_DIR = (Path(__file__).parent / "../../../../..").resolve()
                "CmdExitFailure",
                "bkg", "cmd", "bpftool", "bpftrace", "defer", "ethtool",
                "fd_read_timeout", "ip", "rand_port", "rand_ports",
-               "wait_port_listen", "wait_file", "tool",
+               "wait_port_listen", "wait_file", "ctl_file_write", "tool",
                "bpf_map_set", "bpf_map_dump", "bpf_prog_map_ids",
                "KsftSkipEx", "KsftFailEx", "KsftXfailEx",
                "ksft_disruptive", "ksft_exit", "ksft_pr", "ksft_run",
diff --git a/tools/testing/selftests/drivers/net/hw/toeplitz.py b/tools/testing/selftests/drivers/net/hw/toeplitz.py
index 571732198b93..962d1aca2bc9 100755
--- a/tools/testing/selftests/drivers/net/hw/toeplitz.py
+++ b/tools/testing/selftests/drivers/net/hw/toeplitz.py
@@ -13,7 +13,7 @@ import os
 import socket
 from lib.py import ksft_run, ksft_exit, ksft_pr
 from lib.py import NetDrvEpEnv, EthtoolFamily, NetdevFamily
-from lib.py import cmd, bkg, rand_port, defer
+from lib.py import cmd, bkg, ctl_file_write, rand_port, defer
 from lib.py import ksft_in
 from lib.py import ksft_variants, KsftNamedVariant, KsftSkipEx, KsftFailEx
 
@@ -113,7 +113,7 @@ QUEUE_CAP = 8
 
 
 def _configure_rps(cfg, rps_cpus):
-    """Configure RPS for all Rx queues."""
+    """Configure RPS for all Rx queues, restored at the end of the test."""
 
     mask = 0
     for cpu in rps_cpus:
@@ -123,9 +123,8 @@ QUEUE_CAP = 8
 
     # Set RPS bitmap for all rx queues
     for rps_file in glob.glob(f"/sys/class/net/{cfg.ifname}/queues/rx-*/rps_cpus"):
-        with open(rps_file, "w", encoding="utf-8") as fp:
-            # sysfs expects hex without '0x' prefix, toeplitz.c needs the prefix
-            fp.write(mask[2:])
+        # sysfs expects hex without '0x' prefix, toeplitz.c needs the prefix
+        ctl_file_write(rps_file, mask[2:])
 
     return mask
 
@@ -208,7 +207,6 @@ QUEUE_CAP = 8
         # Get CPUs not used by Rx queues and configure them for RPS
         rps_cpus = _get_unused_rps_cpus(cfg, count=2)
         rps_mask = _configure_rps(cfg, rps_cpus)
-        defer(_configure_rps, cfg, [])
         rx_cmd += ["-r", rps_mask]
         ksft_pr(f"RPS using CPUs: {rps_cpus}, mask: {rps_mask}")
 
diff --git a/tools/testing/selftests/drivers/net/lib/py/__init__.py b/tools/testing/selftests/drivers/net/lib/py/__init__.py
index ee903bcf3207..591b1e6c7eea 100644
--- a/tools/testing/selftests/drivers/net/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/lib/py/__init__.py
@@ -24,7 +24,7 @@ KSFT_DIR = (Path(__file__).parent / "../../../..").resolve()
     from net.lib.py import CmdExitFailure
     from net.lib.py import bkg, cmd, bpftool, bpftrace, defer, ethtool, \
         fd_read_timeout, ip, rand_port, rand_ports, tc, wait_port_listen, \
-        wait_file
+        wait_file, ctl_file_write
     from net.lib.py import bpf_map_set, bpf_map_dump, bpf_prog_map_ids
     from net.lib.py import KsftSkipEx, KsftFailEx, KsftXfailEx
     from net.lib.py import ksft_disruptive, ksft_exit, ksft_pr, ksft_run, \
@@ -38,7 +38,7 @@ KSFT_DIR = (Path(__file__).parent / "../../../..").resolve()
                "CmdExitFailure",
                "bkg", "cmd", "bpftool", "bpftrace", "defer", "ethtool",
                "fd_read_timeout", "ip", "rand_port", "rand_ports", "tc",
-               "wait_port_listen", "wait_file",
+               "wait_port_listen", "wait_file", "ctl_file_write",
                "bpf_map_set", "bpf_map_dump", "bpf_prog_map_ids",
                "KsftSkipEx", "KsftFailEx", "KsftXfailEx",
                "ksft_disruptive", "ksft_exit", "ksft_pr", "ksft_run",
diff --git a/tools/testing/selftests/drivers/net/ring_reconfig.py b/tools/testing/selftests/drivers/net/ring_reconfig.py
index 2bc329b77134..6682d4badfbf 100755
--- a/tools/testing/selftests/drivers/net/ring_reconfig.py
+++ b/tools/testing/selftests/drivers/net/ring_reconfig.py
@@ -13,7 +13,7 @@ from lib.py import ksft_run, ksft_exit, ksft_pr
 from lib.py import ksft_eq
 from lib.py import KsftSkipEx, KsftXfailEx
 from lib.py import NetDrvEpEnv, EthtoolFamily, GenerateTraffic
-from lib.py import cmd, defer, rand_port, tc, NlError
+from lib.py import cmd, ctl_file_write, defer, rand_port, tc, NlError
 
 # Added in Python 3.13; fallback to 61 for x86/ARM/MIPS
 SO_TXTIME = getattr(socket, "SO_TXTIME", 61)
@@ -166,22 +166,6 @@ MAX_TX_RING = 1024
         GenerateTraffic(cfg).wait_pkts_and_stop(10000)
 
 
-def _write_file(path, val):
-    """Write val to a file."""
-    with open(path, "w", encoding="utf-8") as fp:
-        fp.write(str(val))
-
-
-def _write_sysfs(path, val):
-    """Write val to a sysfs file, restoring the original value on exit."""
-    with open(path, "r", encoding="utf-8") as fp:
-        orig_val = fp.read().strip()
-    if str(val) == orig_val:
-        return
-    _write_file(path, val)
-    defer(_write_file, path, orig_val)
-
-
 def _get_qdisc_backlog(cfg, mq_handle, queue):
     """Return the qdisc backlog (bytes) for the given TX queue's leaf."""
     target_parent = f"{mq_handle}{queue + 1:x}"
@@ -342,8 +326,8 @@ MAX_TX_RING = 1024
     # Slow completions so the ring stays full after FQ releases packets
     napi_defer = f"/sys/class/net/{cfg.ifname}/napi_defer_hard_irqs"
     gro_timeout = f"/sys/class/net/{cfg.ifname}/gro_flush_timeout"
-    _write_sysfs(napi_defer, 100)
-    _write_sysfs(gro_timeout, 1000000000)
+    ctl_file_write(napi_defer, 100)
+    ctl_file_write(gro_timeout, 1000000000)
 
     port = rand_port()
     # A single flow must overflow the ring, so send twice the ring depth and
@@ -384,8 +368,8 @@ MAX_TX_RING = 1024
     cfg.eth.rings_set(ehdr | {'tx': tx_cur})
 
     # Let completions proceed normally
-    _write_sysfs(napi_defer, 0)
-    _write_sysfs(gro_timeout, 0)
+    ctl_file_write(napi_defer, 0)
+    ctl_file_write(gro_timeout, 0)
 
     # Poll for backlog to drain
     for _ in range(100):
diff --git a/tools/testing/selftests/net/lib/py/__init__.py b/tools/testing/selftests/net/lib/py/__init__.py
index 34935886b6ad..71df5880b356 100644
--- a/tools/testing/selftests/net/lib/py/__init__.py
+++ b/tools/testing/selftests/net/lib/py/__init__.py
@@ -14,7 +14,7 @@ from .netns import NetNS, NetNSEnter, UserNetNS
 from .nsim import NetdevSim, NetdevSimDev
 from .utils import CmdExitFailure, fd_read_timeout, cmd, bkg, defer, \
     bpftool, ip, ethtool, bpftrace, rand_port, rand_ports, wait_port_listen, \
-    wait_file, tool, tc
+    ctl_file_write, wait_file, tool, tc
 from .bpf import bpf_map_set, bpf_map_dump, bpf_prog_map_ids
 from .ynl import NlError, NlctrlFamily, YnlFamily, \
     EthtoolFamily, NetdevFamily, RtnlFamily, RtnlAddrFamily, RtnlRouteFamily
@@ -29,7 +29,7 @@ __all__ = ["KSRC",
            "NetNS", "NetNSEnter", "UserNetNS",
            "CmdExitFailure", "fd_read_timeout", "cmd", "bkg", "defer",
            "bpftool", "ip", "ethtool", "bpftrace", "rand_port", "rand_ports",
-           "wait_port_listen", "wait_file", "tool", "tc",
+           "wait_port_listen", "ctl_file_write", "wait_file", "tool", "tc",
            "bpf_map_set", "bpf_map_dump", "bpf_prog_map_ids",
            "NetdevSim", "NetdevSimDev",
            "NetshaperFamily", "DevlinkFamily", "PSPFamily", "NlError",
diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index 184bb04343f6..1727bc418073 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -357,6 +357,28 @@ GLOBAL_DEFER_ARMED = False
         time.sleep(sleep)
 
 
+def _ctl_file_write(path, val):
+    with open(path, "w", encoding="utf-8") as fp:
+        fp.write(str(val))
+
+
+def ctl_file_write(path, val):
+    """
+    Write @val to a control file - a sysctl, a sysfs attribute, configfs...
+    and defer() restoring the old value, so needs a defer queue.
+
+    Writing a value which is already set is skipped, there is nothing
+    to restore in that case.
+    """
+    with open(path, "r", encoding="utf-8") as fp:
+        old = fp.read().strip()
+    if old == str(val):
+        return
+
+    _ctl_file_write(path, val)
+    defer(_ctl_file_write, path, old)
+
+
 def wait_file(fname, test_fn, sleep=0.005, deadline=5, encoding='utf-8'):
     """
     Wait for file contents on the local system to satisfy a condition.
-- 
2.55.0


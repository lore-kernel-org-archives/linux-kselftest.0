Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C552BEC2B
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 23:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784850543; cv=none; b=A1tZVDRmk2IDdCOXfj/GZRhw1NVYBKMrHeJgC02eZFsw80n9SKa1TCZ/Tii70DgnpdDtRdmRdN/Nm44B0OBPNojxC0PzmNo41ibhXEYFss/BaqAS8JMqggHKn5TJTmLHhlQeUwGwIkHNRVa7kDIBe1MoJBSqCIS40ZQgRTZy2FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784850543; c=relaxed/simple;
	bh=JkKgwfbwSWE/W2vX/kkIONFlxUMWhEmRwOzG1inAE8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J8K7dzqyD83J5hiCr3JATXfcVDFLgkou/Zw4jH+nj5wnWXeENYzbVCuIxCMPsiQ0pmDqmHCTNOx4ocHW/Dpk1CoOlcY35EtCt2bCbyJorw4OxQ5hrmTx0WNTsqFYWQwDTZdsy17fjSc8NkGhWtqddTxBbZGuoyJjs0ezvktUxaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0nP4WlM; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0nP4WlM"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6a31c05e092so522585eaf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 16:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784850541; x=1785455341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SM4Olva3UxHUMc0jHFquvfoKH+36uv2FSDslSJ2+uw=;
        b=r0nP4WlMSrLXySNH1N0znE9yrdne0mhGmO5ZrFLzo8rdV0F2bP+Wx5RldOu+ANri2V
         p33IrzxGR6vrJTELntNS01g1YE+WS29sZFaFWNx3mDUUBMDO6B/abAqtAI2CYOgWRAh6
         +dPxJEGN7qsSjAIr+oL8GRUdOSm33n+wvNRRRefOJxz6TsdQA3cyClNY0ybbha1bwpB0
         Q1nBAm4+9t8Usl/dHijqeAvZ6hPH+Y8BfwUgABvk4grd0o44UAzFlXZl30MFVaEypw01
         fsBOTgF9iUNLuPmIznQy3OL0MTsSJVy6YQgRQsaFXWcSaIjBFqfm7lNtM4BEMav913n9
         9jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784850541; x=1785455341;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8SM4Olva3UxHUMc0jHFquvfoKH+36uv2FSDslSJ2+uw=;
        b=SUGxCi/S7aZd6uN+FPEKikFDPQKow7zRWVU4MAFfyY3AqQP4NzcQFscsxaUiy50ael
         Pvx4k3bJlGZs8LKdlT6MRkVANwuEJ5him0u9/GCECd+YpJbxvz1tLC4GSUAPmhFLX4cb
         h10Zu05q+YDZVdW/zvByJ5LGrTaQgcU4HHmkf7She89yEAlObPseUGMiHnzSg7xUdvca
         BriUQrVxrsM879Drwds3g/SDqC9y2Zl3j4aOBQFkXHixTNILvYT68SBMvJxXMMP/T04k
         a6ThncDx97PQB7OGip8aLe2ipTC0T4EP3TYXPn/p0rHD1qkYmIFSzBsd7fwdCCkcyySX
         ZR2A==
X-Forwarded-Encrypted: i=1; AHgh+RryDozIWP+1RIaunTvI7fSd9gyVOZ4oij0e8NzeIwTaGeWhaT7RK0rsz4YJwnbrP0+JRAAoUXpYxOTDqaJHmKo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2pSo9JUeYwNOJaHVv0tJTUgbYjiFapenMjiN+ZuwfQIjdYw47
	pFyHgEG+RZAfA7dytqMFhjvP+N0TBhdvGbNqTe3c3ij3z9emZwUQCjhd
X-Gm-Gg: AR+sD129beef6E5kAD4EIF36IvQA2EBOM5yDJZKL7LdPlHhnlv+UwJLioWhE4MVsC9K
	qc0RUCzTbO/Sgg1Utk1+6Sqlac4XYcWzoxAlD+7KLN0B30AbRGIkcDSEiGIL0bz3YOGa1kcE5MO
	59J1t+YF8leL0bKyDK5almjfFNLR4p/xRd6g8qqpIJC5tciZBKNSwtWye+dykeQ1isEZClhzpQZ
	jD6U/d91zL/ItQGuDBPVyMX+qo/LcFw6vJ6iBUkBAa2Ey61IhdF/2umyViooRQ0sVT8PPaomQYU
	wB2CA+X96rmg61UI6QuFx0dxH/D4QvMKMzQVznnLBYY794SwL/k/N/A8O9uvVrGN5Wn2xRsh2FD
	ApzyNxrhq62Qw1/L9PEYn1yJsCVz+qXEBf2jzla/mUsqcElEt/16lhrvjkwRB7U0HiW7BBXpOK8
	I=
X-Received: by 2002:a05:6820:4c14:b0:696:836e:ba2b with SMTP id 006d021491bc7-6aad3f4c0demr2535127eaf.11.1784850540853;
        Thu, 23 Jul 2026 16:49:00 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:43::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45766f16dfcsm5904191fac.7.2026.07.23.16.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 16:49:00 -0700 (PDT)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	mohsin.bashr@gmail.com
Subject: [PATCH net-next V3] selftests: drv-net: Test queue stall upon reconfig
Date: Thu, 23 Jul 2026 16:48:55 -0700
Message-ID: <20260723234857.2880270-1-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mohsin Bashir <hmohsin@meta.com>

Add a reconfig_tx_stall test that detects the possibility of a TX stall
after ring reconfiguration. The key observation is that drivers using
netif_tx_start_all_queues() are prone to experiencing a stall when
reconfiguration completes compared to drivers using
netif_tx_wake_all_queues(). start_all_queues only clears DRV_XOFF, while
wake_all_queues also calls __netif_schedule() to kick the qdisc. Without
the kick, qdisc backlog present at reconfig time can stay stuck until a
new trigger is issued.

The test caps the TX ring at 64 entries so it fills quickly, then
installs FQ on a target TX queue and sends UDP packets with SO_TXTIME
scheduled in the future. With napi_defer_hard_irqs slowing completions,
the small ring can fill when FQ releases the burst, leaving requeued
qdisc backlog with no FQ timer to rescue it. A subsequent ring reconfig
must wake the queues to drain the backlog. Simply starting the queues can
leave it stuck.

On host with problematic driver:
 Sent 128 SO_TXTIME packets (+100ms)
 Sent 128 SO_TXTIME packets (+200ms)
 Backlog before reconfig: 52632 bytes
 Check| At /root/ksft-net-drv/./drivers/net/ring_reconfig.py, ...
 Check|     ksft_eq(0, backlog,
 Check failed 0 != 52632 qdisc backlog stuck on queue 1 after ring reconfig
not ok 3 ring_reconfig.reconfig_tx_stall

On host with fixed driver:
 Sent 128 SO_TXTIME packets (+100ms)
 Sent 128 SO_TXTIME packets (+200ms)
 Backlog before reconfig: 76024 bytes
ok 3 ring_reconfig.reconfig_tx_stall

Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
Changelog:
V3:
  - Preserve the device's existing TX/RX qdisc policy. On a device with a
    previously-configured (addressable) mq, only the target queue's leaf is
    swapped and restored. The default mq (unaddressable handle 0:) or a
    noqueue root is temporarily given a real handle and restored to the
    default mq on exit. Skip when the root is a non-mq qdisc rather than
    disturb it.
  - Request 2+ queues from NetDrvEpEnv via a new queue_count parameter so
    the test runs under netdevsim.
  - Fail instead of skip when the qdisc backlog cannot be built.
  - Skip on devices without 2+ combined channels; bump combined-count to 2
    (restored on exit) when supported but not currently configured.

V2: https://lore.kernel.org/netdev/20260613014855.1717712-1-mohsin.bashr@gmail.com

V1: https://lore.kernel.org/netdev/20260612001754.2489868-1-mohsin.bashr@gmail.com
---
 tools/testing/selftests/drivers/net/config    |   3 +
 .../selftests/drivers/net/lib/py/env.py       |  11 +-
 .../selftests/drivers/net/ring_reconfig.py    | 207 +++++++++++++++++-
 3 files changed, 215 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
index 2070e890e064..f3933cf3e6be 100644
--- a/tools/testing/selftests/drivers/net/config
+++ b/tools/testing/selftests/drivers/net/config
@@ -4,8 +4,11 @@ CONFIG_DEBUG_INFO_BTF_MODULES=n
 CONFIG_INET_PSP=y
 CONFIG_IPV6=y
 CONFIG_MACSEC=m
+CONFIG_NET_ACT_SKBEDIT=m
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_CLS_BPF=y
+CONFIG_NET_CLS_FLOWER=m
+CONFIG_NET_CLS_MATCHALL=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
 CONFIG_NETCONSOLE_EXTENDED_LOG=y
diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index e4acf3d8333f..b1c6f6cef7dd 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -114,10 +114,11 @@ class NetDrvEpEnv(NetDrvEnvBase):
     nsim_v4_pfx = "192.0.2."
     nsim_v6_pfx = "2001:db8::"
 
-    def __init__(self, src_path, nsim_test=None):
+    def __init__(self, src_path, nsim_test=None, queue_count=None):
         super().__init__(src_path)
 
         self._stats_settle_time = None
+        self._queue_count = queue_count
 
         # Things we try to destroy
         self.remote = None
@@ -173,9 +174,13 @@ class NetDrvEpEnv(NetDrvEnvBase):
         self._required_cmd = {}
 
     def create_local(self):
+        nsim_kwargs = {}
+        if self._queue_count:
+            nsim_kwargs["queue_count"] = self._queue_count
+
         self._netns = NetNS()
-        self._ns = NetdevSimDev()
-        self._ns_peer = NetdevSimDev(ns=self._netns)
+        self._ns = NetdevSimDev(**nsim_kwargs)
+        self._ns_peer = NetdevSimDev(ns=self._netns, **nsim_kwargs)
 
         with open("/proc/self/ns/net") as nsfd0, \
              open("/var/run/netns/" + self._netns.name) as nsfd1:
diff --git a/tools/testing/selftests/drivers/net/ring_reconfig.py b/tools/testing/selftests/drivers/net/ring_reconfig.py
index f9530a8b0856..a5a2defc4fb1 100755
--- a/tools/testing/selftests/drivers/net/ring_reconfig.py
+++ b/tools/testing/selftests/drivers/net/ring_reconfig.py
@@ -5,10 +5,21 @@
 Test channel and ring size configuration via ethtool (-L / -G).
 """
 
+import socket
+import struct
+import time
+
 from lib.py import ksft_run, ksft_exit, ksft_pr
 from lib.py import ksft_eq
+from lib.py import KsftSkipEx, KsftFailEx
 from lib.py import NetDrvEpEnv, EthtoolFamily, GenerateTraffic
-from lib.py import defer, NlError
+from lib.py import cmd, defer, rand_port, tc, NlError
+
+# Added in Python 3.13; fallback to 61 for x86/ARM/MIPS
+SO_TXTIME = getattr(socket, "SO_TXTIME", 61)
+
+# TX ring size the test shrinks to so the ring fills quickly.
+MIN_TX_RING = 64
 
 
 def channels(cfg) -> None:
@@ -151,14 +162,204 @@ def ringparam(cfg) -> None:
         GenerateTraffic(cfg).wait_pkts_and_stop(10000)
 
 
+def _write_file(path, val):
+    """Write val to a file."""
+    with open(path, "w", encoding="utf-8") as fp:
+        fp.write(str(val))
+
+
+def _write_sysfs(path, val):
+    """Write val to a sysfs file, restoring the original value on exit."""
+    with open(path, "r", encoding="utf-8") as fp:
+        orig_val = fp.read().strip()
+    if str(val) == orig_val:
+        return
+    _write_file(path, val)
+    defer(_write_file, path, orig_val)
+
+
+def _get_qdisc_backlog(cfg, mq_handle, queue):
+    """Return the qdisc backlog (bytes) for the given TX queue's leaf."""
+    target_parent = f"{mq_handle}{queue + 1:x}"
+    for q in tc(f"-s qdisc show dev {cfg.ifname}", json=True):
+        if q.get("parent", "") == target_parent:
+            return q.get("backlog") or 0
+    return 0
+
+
+def _setup_fq_qdisc(cfg, port, target_queue, other_queue):
+    """Put an fq qdisc on target_queue's leaf and return the mq handle in use.
+
+    We must not disturb the device's existing TX/RX qdisc policy. On a real
+    NIC the root mq already has an addressable handle, so we leave the root
+    and every other queue alone and only swap this one leaf, restoring its
+    original qdisc afterwards.
+    """
+    qdiscs = tc(f"qdisc show dev {cfg.ifname}", json=True)
+    root = next((q for q in qdiscs if q.get("root")), None)
+
+    if root and root["kind"] == "mq" and root["handle"] != "0:":
+        # Addressable mq (previously-configured): touch only the target queue's
+        # leaf and restore its original qdisc afterwards.
+        mq_handle = root["handle"]
+        parent = f"{mq_handle}{target_queue + 1:x}"
+        orig = next((q for q in qdiscs if q.get("parent") == parent), None)
+        orig_kind = orig["kind"] if orig else \
+            cmd("sysctl -n net.core.default_qdisc").stdout.strip()
+        defer(tc, f"qdisc replace dev {cfg.ifname} parent {parent} {orig_kind}")
+    elif root is None or root["kind"] in ("mq", "noqueue"):
+        # The auto-attached root mq has handle 0: on any device (real or sim),
+        # which the kernel rejects as a qdisc parent. A 0: handle means the mq
+        # is the untouched kernel default - no custom child qdiscs can hang off
+        # an unaddressable parent - so installing a real handle and restoring
+        # the default mq on exit preserves the device's effective policy.
+        mq_handle = "1:"
+        tc(f"qdisc replace dev {cfg.ifname} root handle {mq_handle} mq")
+        defer(tc, f"qdisc replace dev {cfg.ifname} root mq")
+        parent = f"{mq_handle}{target_queue + 1:x}"
+    else:
+        raise KsftSkipEx(f"root qdisc '{root['kind']}' is not mq; "
+                         "refusing to disturb existing qdisc policy")
+
+    try:
+        tc(f"qdisc replace dev {cfg.ifname} parent {parent} fq")
+    except Exception as exc:
+        raise KsftSkipEx(
+            f"fq not available (CONFIG_NET_SCH_FQ): {exc}") from exc
+
+    qdisc_j = tc(f"qdisc show dev {cfg.ifname}", json=True)
+    has_clsact = any(q['kind'] == 'clsact' for q in qdisc_j)
+    if not has_clsact:
+        tc(f"qdisc add dev {cfg.ifname} clsact")
+        defer(tc, f"qdisc del dev {cfg.ifname} clsact")
+
+    proto = "ipv6" if int(cfg.addr_ipver) == 6 else "ip"
+    try:
+        tc(f"filter add dev {cfg.ifname} egress protocol {proto} "
+           f"pref 1 flower ip_proto udp dst_port {port} "
+           f"action skbedit queue_mapping {target_queue}")
+    except Exception as exc:
+        raise KsftSkipEx("tc flower/act_skbedit not available") from exc
+    defer(tc, f"filter del dev {cfg.ifname} egress pref 1")
+
+    tc(f"filter add dev {cfg.ifname} egress pref 100 "
+       f"matchall action skbedit queue_mapping {other_queue}")
+    defer(tc, f"filter del dev {cfg.ifname} egress pref 100")
+
+    return mq_handle
+
+
+def _create_sotxtime_socket(cfg):
+    """Create a UDP socket with SO_TXTIME enabled, bound to the test device."""
+    sock = socket.socket(socket.AF_INET6 if cfg.addr_ipver == "6"
+                         else socket.AF_INET, socket.SOCK_DGRAM)
+    try:
+        sock.setsockopt(socket.SOL_SOCKET, SO_TXTIME, struct.pack("Ii", 1, 0))
+    except OSError as exc:
+        sock.close()
+        raise KsftSkipEx("SO_TXTIME not supported") from exc
+    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BINDTODEVICE,
+                    cfg.ifname.encode())
+    return sock
+
+
+def _send_sotxtime_burst(cfg, sock, port, count, delay_ns):
+    """Send count UDP packets scheduled delay_ns ahead using SO_TXTIME."""
+    payload = b'\x00' * 1400
+    txtime_ns = time.clock_gettime_ns(time.CLOCK_MONOTONIC) + delay_ns
+
+    ancdata = [(socket.SOL_SOCKET, SO_TXTIME, struct.pack("Q", txtime_ns))]
+    if int(cfg.addr_ipver) == 6:
+        dest = (cfg.remote_addr, port, 0, 0)
+    else:
+        dest = (cfg.remote_addr, port)
+    for _ in range(count):
+        sock.sendmsg([payload], ancdata, 0, dest)
+
+
+def reconfig_tx_stall(cfg) -> None:
+    """Test that qdisc backlog drains after ring reconfiguration."""
+    target_queue = 1
+    other_queue = 0
+
+    ehdr = {'header': {'dev-index': cfg.ifindex}}
+    chans = cfg.eth.channels_get(ehdr)
+
+    if "combined-max" not in chans:
+        raise KsftSkipEx("device does not support combined channels")
+    if chans.get("combined-max", 0) < 2:
+        raise KsftSkipEx("device does not support 2+ combined channels")
+    if chans["combined-count"] < 2:
+        defer(cfg.eth.channels_set,
+              ehdr | {"combined-count": chans["combined-count"]})
+        cfg.eth.channels_set(ehdr | {"combined-count": 2})
+
+    rings = cfg.eth.rings_get(ehdr)
+    if 'rx' not in rings or 'tx' not in rings:
+        raise KsftSkipEx("device does not expose rx/tx ring params")
+    tx_cur = rings['tx']
+    if tx_cur <= MIN_TX_RING:
+        raise KsftSkipEx("tx ring size already at minimum")
+    defer(cfg.eth.rings_set, ehdr | {'tx': tx_cur})
+
+    cfg.eth.rings_set(ehdr | {'tx': MIN_TX_RING})
+
+    # Slow completions so the ring stays full after FQ releases packets
+    napi_defer = f"/sys/class/net/{cfg.ifname}/napi_defer_hard_irqs"
+    gro_timeout = f"/sys/class/net/{cfg.ifname}/gro_flush_timeout"
+    _write_sysfs(napi_defer, 100)
+    _write_sysfs(gro_timeout, 1000000000)
+
+    port = rand_port()
+    mq_handle = _setup_fq_qdisc(cfg, port, target_queue, other_queue)
+
+    sock = _create_sotxtime_socket(cfg)
+    defer(sock.close)
+
+    pkt_count = MIN_TX_RING * 2
+
+    for delay_ms in [100, 200, 500]:
+        _send_sotxtime_burst(cfg, sock, port, pkt_count,
+                             delay_ms * 1_000_000)
+        ksft_pr(f"Sent {pkt_count} SO_TXTIME packets (+{delay_ms}ms)")
+        time.sleep(delay_ms / 1000 + 0.3)
+
+        backlog = _get_qdisc_backlog(cfg, mq_handle, target_queue)
+        if backlog:
+            break
+    else:
+        raise KsftFailEx("failed to build qdisc backlog")
+
+    ksft_pr(f"Backlog before reconfig: {backlog} bytes")
+
+    # Trigger ring reconfig — driver should call wake, not just start
+    cfg.eth.rings_set(ehdr | {'tx': tx_cur})
+
+    # Let completions proceed normally
+    _write_sysfs(napi_defer, 0)
+    _write_sysfs(gro_timeout, 0)
+
+    # Poll for backlog to drain
+    for _ in range(100):
+        backlog = _get_qdisc_backlog(cfg, mq_handle, target_queue)
+        if not backlog:
+            break
+        time.sleep(0.1)
+
+    ksft_eq(0, backlog,
+            comment=f"qdisc backlog stuck on queue {target_queue} "
+                    f"after ring reconfig")
+
+
 def main() -> None:
     """ Ksft boiler plate main """
 
-    with NetDrvEpEnv(__file__) as cfg:
+    with NetDrvEpEnv(__file__, queue_count=2) as cfg:
         cfg.eth = EthtoolFamily()
 
         ksft_run([channels,
-                  ringparam],
+                  ringparam,
+                  reconfig_tx_stall],
                  args=(cfg, ))
     ksft_exit()
 
-- 
2.53.0-Meta


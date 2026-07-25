Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472BF2771E
	for <linux-kselftest@vger.kernel.org>; Sat, 25 Jul 2026 00:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784938950; cv=none; b=UA+Xmbfu/BxhjU2K22mPQhDvsDpPGwMviXkmt9AQFkLCVBjYnKIq2+0OygHutBqjFd631kxzTVak+oznUKteZst8aASVw0HDscG27pKdZ2CJQ+GbKiWTEs3CvGHo7ykvx7SSSj2VB6+R4wNj51G9YvsYKnVwcUjGF7NUcQOSK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784938950; c=relaxed/simple;
	bh=Zzks7/K1IofpfFO2Fe2Yq8NI/uWJHZ4rMK12hiD+28k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f5GHsr/89eRDUHs1Sm1QJN6UhE2MLRR52GLnNBCHpjPBcpTVePiy+n10p/NZd2qTi0llruPfpzKIcST46mlCTIEuDvBvQVjIohpIJkp+OptQFDtzlKE1QwYEBQCwKaaKRxz6fwRUNOZ3ZO73ygjK4O+x/wiudtKbpbkDWcxU2cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yc0JsR92; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yc0JsR92"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-497d6c2d000so515367b6e.0
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 17:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784938947; x=1785543747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zODayEQn8bHJMCKdIJSEIqfrS40G7786qIxs2JhBNcw=;
        b=Yc0JsR92IENOhB5Q8VrCjrZSocIHBraCjOzJgjsHS3/woxQ+elpb/7oUIUYFjRoBYl
         9jOcHYUsrn3exYj+JAOWfaVEFX5th9MUdD6r0yusVx1YZWZ9wQkjgdXtS+1CP+YMqvon
         8pIfKWWYAcEjsyw6euLWBYq8W1qZeL4ub1QnTl1OWpMhfg1DJEpLwO9xAVGh3YsdcpjL
         CsPihZ5UGJ5rcEmGbHgHc4ZqFsfkAEc03FqJd+Y2WRrllP3Z3eOG9wHai3Xs2jXmTGMQ
         EJzOY8acyf4+/4bT+iZ2wqsd2D6RXXbdBQim+YMfiTA/9fa6LDyCyZEBKD78dAdr/WPA
         byeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784938947; x=1785543747;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zODayEQn8bHJMCKdIJSEIqfrS40G7786qIxs2JhBNcw=;
        b=L8Xxn5AKocbUwyHcSmSwkWj2j3xciw7fWBn7+cMDm5JzZc00cAwVpdFfINYhPiiWUD
         Kz1lwbGiBS8s1De0uKrAfwFZaeaQn4RkJ+AKEqa613OGKkN5N0rOKz7x7XrI7VD8tyTN
         LzTlvuEJ4UizEtx+Dae/S2U4D9Pebx5Y8h5UffVb9ijCBIAbUK4PlermyGGHxq7eKymP
         Zy8Ab+Ep9qgagX3QBM8h+Y5kWWkUJowWfO0hRbqHmBxOb3CHVhZyHCMQaJSOGTQlS1ql
         gc9gxs+YuPkoLpKJKHSrLu27lWFah3gu8WxtRcfNyxK7XNpzOKV7AunzD63ghmm9cSkn
         67/A==
X-Forwarded-Encrypted: i=1; AHgh+RrsUiv6gFaxxnsrsfMo4uUf57kpPx1WsmThFK3OMXeI61tL5NHs6jn580phMsPIZrZ5zz5r9Y3/wUIVrs6wz5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQQDtohjiBrpN4phanIEzHuRy5NwHMw2RvGkGcQImmjfFe1PRL
	tYD+7FNx4nY0JOEmJymszHiEQ+Zn2nBEisfPf5zpW8lbE8rgRljoX0Hb
X-Gm-Gg: AR+sD12OZ00LYKB4dwvW9eqRiHLkq+mt5YHNSp8x6f9lGaqNEDqzBRO/hUcA4JN8tzO
	ePuxnzwcu1juRnp1SC47yZ4mHc2WomicS2WPZ7kSDiLnj2EghGPtVuI0QVTAdCwJ9l0Yz5ez9Uu
	D5IU68Dl7YDa0k3FIhf7MtozTgQgyZgRWJ50pPy7XLVuCL2i90NNxjSZh4p9fCwTJmpSZZvXUjw
	0NoOihtspVHaJjSqu+gvLwis0IUraaOzhzRxJ/gqi0AP8VY6KqRLAqqBHka9HAP1HJj4u/CHpei
	6cbH1FeTSc5/+zI3JMmI+vit2fOMw7POHG5Qe2ScwS/EbrkkXHdVcpz+NTmolbU212KtqCRA303
	C2sArFO9Xnf0gAp5jPDPt5G6UiPRlPktF6FAFDP3zXMo42Le98T30cKP1WVkj/AWs99X4NQVRgM
	8=
X-Received: by 2002:a05:6808:514c:b0:4a4:a06:43b3 with SMTP id 5614622812f47-4ab6a1d162emr675255b6e.38.1784938946721;
        Fri, 24 Jul 2026 17:22:26 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:25::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab0eeb0748sm6249976b6e.13.2026.07.24.17.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:22:25 -0700 (PDT)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	dw@davidwei.uk,
	mohsin.bashr@gmail.com
Subject: [PATCH net-next V4] selftests: drv-net: Test queue stall upon reconfig
Date: Fri, 24 Jul 2026 17:21:55 -0700
Message-ID: <20260725002156.3027762-1-mohsin.bashr@gmail.com>
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

Some drivers lack backpressure on the TX path and may not be able to
build up the qdisc backlog the test relies on. In that case report an
expected failure (xfail) instead of a hard failure.

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
V4:
  - Some drivers lack backpressure on the TX path and cannot build up the
    qdisc backlog; report xfail in that case instead of failing.

V3: https://lore.kernel.org/netdev/20260723234857.2880270-1-mohsin.bashr@gmail.com

V2: https://lore.kernel.org/netdev/20260613014855.1717712-1-mohsin.bashr@gmail.com

V1: https://lore.kernel.org/netdev/20260612001754.2489868-1-mohsin.bashr@gmail.com
---
 tools/testing/selftests/drivers/net/config    |   3 +
 .../selftests/drivers/net/lib/py/env.py       |  11 +-
 .../selftests/drivers/net/ring_reconfig.py    | 211 +++++++++++++++++-
 3 files changed, 219 insertions(+), 6 deletions(-)

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
index f9530a8b0856..be2a62b69f12 100755
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
+from lib.py import KsftSkipEx, KsftXfailEx
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
@@ -151,14 +162,208 @@ def ringparam(cfg) -> None:
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
+        # A device that completes Tx synchronously (e.g. a software/virtual
+        # driver like netdevsim) never keeps the ring full long enough for a
+        # backlog to form, so the wake-vs-start behavior can't be exercised.
+        # Treat that as an expected failure rather than a hard failure.
+        raise KsftXfailEx("could not build qdisc backlog")
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


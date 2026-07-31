Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1052FFF89
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 02:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785464155; cv=none; b=K5QAL6pjbBbeqxTZ7pHiRrpsL2/ysz5XVHfyLfPZKAh7Mcg9DTqqTtcP7GUFnA6Pfi0XZYY2uBZWZp6PBKb22k0YZTA2DcfkIJxTuFUKOofqVwNxMaD4DrDfErLA3T7gyCqknaLHmihwNd6j48wgzUgW83LKmxwzpytGq4Lvg9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785464155; c=relaxed/simple;
	bh=pPaPke8jO8HuaNUk145pWpj9lMs5zA0j/1+OX/7rmFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iHZmmoymJtVPZ3dfGmFWMsOtlxqOby6JrC2X9WA6I1UEvmsXSNvDwmVjg1RCj92FAuyKG30HfVyZTYb/BOny1MGCFKARW00iwwHN0hNJB0cPVmOGd3LH7mqf9XdueOOM+2jGCtM3Ou/GcXf4of6MDijNac0l3x71VbhCqXwO5io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPQuGEyD; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPQuGEyD"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4a4c6081f9fso148644b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785464152; x=1786068952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDurhkNL470hEjIHcirkK1gn78xNjj6DB23pJ2LgGFw=;
        b=iPQuGEyD/jlsDaTWJvYTDNvaxaNU/uukRyx9f8aPUV3PGjcBONbOuIrTzJKZLO5Oqg
         amYyBV+7XOuw7EeWE+1MPM04WhryeD/MtIaDsaxFlTOd1qNAao0ffcXzskWwJFoFNPuy
         Mwm00Y1ZRemecTXNqyQwt8zQaYChWF5TgcG0dIGaRhrGXcb00HH3rH23+afoCQk3WuPJ
         OI5akk35z9DRbcuHh/MTdfsOdUQkY4bqjJ0q/vERVZvk5oCJ6KdSUo6Cbo/krly8vxDl
         Ww8PcIraQ25JkQTWN44BuyR0M3znXAdAfI7p0atskZqn3pSODps7qK9PHNekKbiZW96I
         2A1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785464152; x=1786068952;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sDurhkNL470hEjIHcirkK1gn78xNjj6DB23pJ2LgGFw=;
        b=dzzI/2kFegjlLifER30tmMckHSKL1lGChHwUSVC4HeoU2mfN0reSdHAGGiTkmoS7bB
         Vc0ESzroVmEBRgC73jyvzL0r+VRKn6kHL32n4oU/am9uNfXpTOSm10XHC/kfLzcXIuif
         Fj1UM//aAL16jP6VukkgvTSBhYTve9zRfraYpZAuLWhoTCXL1hMS0mH/SYWSjNsuyptd
         6t6DbZ6hDFSVjiQ1/thPrYpvkE/CVauhz0wVda89cm9rDl21VWb4vfEU8Mk7DkCX6PgV
         2yvzNfrkuhL+R3VbN6YLMNR7FVXdu7x8+JhqcBexcMq8WoAr70i3ZDs18ehlAZfHs7r0
         3jJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBucNAm0pimZM7mhIJu2sUujUrpF31VSrDJ2S3Of8xbO4SmjyACg+s8NW40UhBdhMZUYJXA2MoV5gvTZtHYMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxhEVwGWmli8jRO0Gy6hWBMSZMSrUNlox3h659piftljN4Fy48
	cLf+zrrSYEdjwQA5U3J/xr+hSWR/w2PrN6Y42x2Jda+0J1V8FqfMfXA7
X-Gm-Gg: AR+sD10LtC/mFHqAE2sgxIfoMbuq7D98GhLCS0m6T3VUWObxKKp7sm0w0WCvPdMZ+tV
	xqv6qhV5YhiLoGjnN+IrIRl36YCFr8WWQsFHLxMTFRR+vNr5glNRgigl0qJHN6q2DbsidNx4S3G
	ejdd/O89d4xo5+kB8YDFiVepDE3szwbMvs8+qc5z0HmsWgtedOJkGQKquq7IP5boxxG+U/lkZ2b
	9rSAKQ6U2seJxpdphFSU5kClmYGaPOLw3rwG7WZjNfMKnAlahmVb+7wnaKzDA9oOwr7d1Z5wL2z
	APK5rqiPruEj9vNJWirpmSSWsoK5+uSwqRQ5djDQlidamrDy5Y4DvphVnGMBtnaaxT0J/ka9OYP
	ZqwvuJ1yHHAWvH0TQwEkkttet7VALYoPOvKSOwTDjS/dzYcOGh03YC64vrFGkKD1RqOiRJGQmCW
	/2l4h00JYZ7oHro4qTdw09FSStAGwrpvClyDpGsld09La93E7lxzSl+kdlrDaV1HQXmi4x
X-Received: by 2002:a05:6808:4f24:b0:496:2b3:ae70 with SMTP id 5614622812f47-4ae4c52edfamr55921b6e.25.1785464151902;
        Thu, 30 Jul 2026 19:15:51 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:52::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c2606f26sm3814092fac.8.2026.07.30.19.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 19:15:51 -0700 (PDT)
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
Subject: [PATCH net-next v5] selftests: drv-net: Test queue stall upon reconfig
Date: Thu, 30 Jul 2026 19:15:42 -0700
Message-ID: <20260731021543.1058526-1-mohsin.bashr@gmail.com>
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

Testing on some of the existing drivers: Driver-A does not have the bug,
Driver-B has the bug, Driver-C had the bug but it is fixed now.

Driver-A:
./drivers/net/ring_reconfig.py -t reconfig_tx_stall
TAP version 13
1..1
 Sent 1024 SO_TXTIME packets (+100ms)
 Backlog before reconfig: 1176378 bytes
ok 1 ring_reconfig.reconfig_tx_stall
 Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Driver-B:
TAP version 13
1..1
 Sent 128 SO_TXTIME packets (+100ms)
 Sent 128 SO_TXTIME packets (+200ms)
 Backlog before reconfig: 148372 bytes
 Check| At ./drivers/net/ring_reconfig.py, line 397, in reconfig_tx_stall:
 Check|     ksft_eq(0, backlog,
 Check failed 0 != 148372 qdisc backlog stuck on queue 1 after ring ....
not ok 1 ring_reconfig.reconfig_tx_stall
 Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

Driver-C:
TAP version 13
1..1
 Sent 128 SO_TXTIME packets (+100ms)
 Backlog before reconfig: 192278 bytes
ok 1 ring_reconfig.reconfig_tx_stall
 Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
---
Changelog:
V5:
- Probe for the smallest TX ring the driver supports starting with 32,
  doubling up to 1024
- Use a large socket send buffer (sized to the burst) so every in-flight
  skb stays charged to the send buffer
- Raise fq's per-flow limit. The default per-flow limit may not be enough
- Scale the burst to the probed ring since ring size is now determined
  at runtime

V4: https://lore.kernel.org/netdev/20260725002156.3027762-1-mohsin.bashr@gmail.com

V3: https://lore.kernel.org/netdev/20260723234857.2880270-1-mohsin.bashr@gmail.com

V2: https://lore.kernel.org/netdev/20260613014855.1717712-1-mohsin.bashr@gmail.com

V1: https://lore.kernel.org/netdev/20260612001754.2489868-1-mohsin.bashr@gmail.com
---
 tools/testing/selftests/drivers/net/config    |   3 +
 .../selftests/drivers/net/lib/py/env.py       |  11 +-
 .../selftests/drivers/net/ring_reconfig.py    | 255 +++++++++++++++++-
 3 files changed, 263 insertions(+), 6 deletions(-)

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
index f9530a8b0856..2bc329b77134 100755
--- a/tools/testing/selftests/drivers/net/ring_reconfig.py
+++ b/tools/testing/selftests/drivers/net/ring_reconfig.py
@@ -5,10 +5,25 @@
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
+# Not always exported by the socket module; asm-generic value (x86/ARM/MIPS).
+SO_SNDBUFFORCE = getattr(socket, "SO_SNDBUFFORCE", 32)
+
+# TX ring size the test shrinks to so the ring fills quickly.
+MIN_TX_RING = 32
+MAX_TX_RING = 1024
 
 
 def channels(cfg) -> None:
@@ -151,14 +166,248 @@ def ringparam(cfg) -> None:
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
+def _setup_fq_qdisc(cfg, port, target_queue, other_queue, flow_limit):
+    """Put an fq qdisc on target_queue's leaf and return the mq handle in use.
+
+    We must not disturb the device's existing TX/RX qdisc policy. On a real
+    NIC the root mq already has an addressable handle, so we leave the root
+    and every other queue alone and only swap this one leaf, restoring its
+    original qdisc afterwards.
+
+    @flow_limit raises fq's per-flow packet limit (default 100) so a single
+    flow can back up more packets than the Tx ring holds and thus overflow it.
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
+        tc(f"qdisc replace dev {cfg.ifname} parent {parent} fq "
+           f"flow_limit {flow_limit} limit {flow_limit * 2}")
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
+    tc(f"filter add dev {cfg.ifname} egress pref 101 "
+       f"matchall action skbedit queue_mapping {other_queue}")
+    defer(tc, f"filter del dev {cfg.ifname} egress pref 101")
+
+    return mq_handle
+
+
+def _create_sotxtime_socket(cfg, sndbuf):
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
+    # Deferred completions keep every in-flight skb charged to the socket, so
+    # size the send buffer to hold the whole burst. SO_SNDBUFFORCE bypasses
+    # net.core.wmem_max (the test runs as root).
+    try:
+        sock.setsockopt(socket.SOL_SOCKET, SO_SNDBUFFORCE, sndbuf)
+    except OSError:
+        sock.setsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF, sndbuf)
+    return sock
+
+
+def _send_sotxtime_burst(cfg, sock, port, count, delay_ns, pkt_size):
+    """Send count UDP packets scheduled delay_ns ahead using SO_TXTIME."""
+    payload = b'\x00' * pkt_size
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
+def _set_small_tx_ring(cfg, ehdr):
+    """Set the Tx ring to the smallest size the driver accepts.
+
+    Start at 32 so the ring fills quickly, then grow exponentially (64,
+    128, 256, ...) up to 1024. Some drivers enforce a minimum well above 32
+    (e.g. bnxt needs a large ring for software UDP segmentation), so raise
+    the lower bound until the driver accepts it, giving up past 1024.
+    """
+    size = MIN_TX_RING
+    while size <= MAX_TX_RING:
+        try:
+            cfg.eth.rings_set(ehdr | {'tx': size})
+            return size
+        except NlError:
+            size = size * 2
+            continue
+    raise KsftSkipEx("driver rejects all tx ring sizes up to 1024")
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
+    # Use the smallest Tx ring the driver accepts (32, growing to 1024).
+    tx_ring = _set_small_tx_ring(cfg, ehdr)
+
+    # Slow completions so the ring stays full after FQ releases packets
+    napi_defer = f"/sys/class/net/{cfg.ifname}/napi_defer_hard_irqs"
+    gro_timeout = f"/sys/class/net/{cfg.ifname}/gro_flush_timeout"
+    _write_sysfs(napi_defer, 100)
+    _write_sysfs(gro_timeout, 1000000000)
+
+    port = rand_port()
+    # A single flow must overflow the ring, so send twice the ring depth and
+    # let fq hold that many packets for the flow.
+    pkt_count = tx_ring * 2
+    mq_handle = _setup_fq_qdisc(cfg, port, target_queue, other_queue,
+                               tx_ring * 2)
+
+    # Size each packet to one MTU (less L3/L4 headers to avoid fragmentation).
+    pkt_size = cfg.dev['mtu'] - (48 if int(cfg.addr_ipver) == 6 else 28)
+
+    # Each queued skb charges the socket its truesize (~2x the payload), so
+    # budget the send buffer for the whole in-flight burst.
+    sock = _create_sotxtime_socket(cfg, pkt_count * pkt_size * 2)
+    defer(sock.close)
+
+    for delay_ms in [100, 200, 500]:
+        _send_sotxtime_burst(cfg, sock, port, pkt_count,
+                             delay_ms * 1_000_000, pkt_size)
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
+    # Trigger ring reconfig — driver should call wake, not just start.
+    # Grow back to the original size so the driver actually switches channels
+    # (setting the current size is a no-op the driver short-circuits).
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


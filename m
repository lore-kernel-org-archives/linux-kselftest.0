Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E788C40B102
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 20:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021540; cv=none; b=g/WN7TE9zKwlJ4P9li6Bcu9vIvBMf+aSRVa05CGNeN4d+tyk4pN2l34WPIWegoRaVTG9ITwFxzC+2dbktz6e/yLgNIEbVgA9A3UXi+M2Ij6RHh7lBRTMVvqEoYbCgePzpJJ5IWOgehm7D+fmdjXPejrXop6tPoKbW34MQ4iAcU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021540; c=relaxed/simple;
	bh=5T4lbni0PCLYd4q7QXK+iCi30F7GifM33dUtGAiz8DI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GEgR2K7GqTPj1vMFghgTV/kifdsXeAbOMHLtoWfCwGMsWDbnRdt1E6tSkcuAVAHAv1BDKUXpG/NoxNXc0W6Rgy81xPGi1ZEZxgKtu1utgrq0uxZ1HpqJm3fHahrq6kY3qoeWcI8QiftGbwCU8gRMbPDtR8E2YUcK/5KNEz/UmZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4nXtMe8; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4nXtMe8"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so3005564a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 13:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790021538; x=1790626338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pO39sZ0nSfGxxtiUdD70gv53e2K+kwH/We90AH1SI04=;
        b=b4nXtMe8IDvMXSNRRjRSodAqZ+72bpPQpdXmcp2mFGlnzKRHzTHLcUHUF3uidu67Oz
         3U6i66jvvk0C9dqwF3DDkajwz+kVomKCorWmYyClkfcCKIBZrv6xtoR+vML2knovqy/T
         nQoTQVizEe3fQEIdfdrn0wuiZSmVI+WQzziyrXt3UxnAolJhHtRqxT2jvO0FjNwu7Hxc
         BwN53+VrsGAGXcRGLlkDOkDvDvYqWGc/lDuMP7XQ7oGUviEJni61kqK6a/43Hgdt22C4
         ViSc+C0TbJN3Vgy7mHv2/WmIAlFNveHLypZKLFneM8NvO7CKInT6l5f+tGByHEZus5ht
         JhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021538; x=1790626338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pO39sZ0nSfGxxtiUdD70gv53e2K+kwH/We90AH1SI04=;
        b=qxk0hTCg9hYbI5OSpqIzaVkiGk6ptZg+DSXW1q6YwONQ2Vnls/zLx7vfc1zrYyR9YS
         i7lqqc2ZLJ1jP69YjPq/T8luYcHzeSZVDC727dN9BasNwMZWtcVPMDf4HAfOs7vDHVay
         pZVX2aJLyWocCEel/U3L6y3XiuCo+753IUkh9TgL8ADGi6Jg8v8UBi2Z6x8NFO01FyML
         5JfZJydn0blxYbzFXWgYu2ve+6HvTbXhR8EoghAZLTq5XWDh/xO6cydibAZonl2tw5Rq
         c/TfLv+z8EL11K2HvB6HG3ZKXKlAhqe+h7gAgbMOphlrrzeCAh/WC7NaIBZ7brVYshpY
         9MyQ==
X-Gm-Message-State: AFuF++kZGEiVHa/tz/mGO1PF+xOkDNSCe257hOTpRDZyOAFyDOsRpuuH
	8LKuOeNQ1bKfcIq36+AfV4HNcrohR5LsP5wePA5bSu+RfsCqYEmtjGNg
X-Gm-Gg: AYBFou0+b+kP34c8NsRkOH8LEczzE1bZvZX+MPCrKIzJEfovDI4VP+v4qf3/gEmlB7D
	katYQIG7rSIuPGMkxau8doVJoSnX2e4Hg9usVgK6acEb1O3LC54A52j466s7o6mPrahUwijLTsV
	atgsDh+uT4HfI5+oJIA51eRy9ndAKgK+hhFYrqA0UfOXkoO/WuBd2N+1awMJ/LNERvdD0psK8Wc
	C/HhjBy/wtTnKdRAHdyoQuOlxYMY1m/y9gGDrtIMzT+Ap0HzkvzAbdStu2vOX93Vl5+njObwXXV
	sfzKMrpnLUkGwixFG3uh6DmTNpFBnj+6sLXtzgQZo993aP5qwayUT4z4R30bmkFWWFEwqNWcfyF
	pa1L6RpcKu46bZS3ZKfjB3zOpDKJUxevcmN1PReUVr4QyrRbiHRDW5DvRuzOs3T7SVf1uTbHdTV
	9uSiqmSyNM6gBkSiFcgJnvIfwPhZeHCAFeq0kvlSuC5jUqtfvo8HvB1zr7c/cTSCLjNqjIOj1nl
	QiV2r+O8rCsKiuxlEAUqPkWJLsrqaMQyDLM
X-Received: by 2002:a05:6a20:748f:b0:3dd:85aa:452d with SMTP id adf61e73a8af0-3dd8c59d659mr17356044637.31.1790021538200;
        Mon, 21 Sep 2026 13:12:18 -0700 (PDT)
Received: from narcisav-mac.thefacebook.com ([2620:10d:c090:400::5:a2c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec60d1fsm297025eec.28.2026.09.21.13.12.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 13:12:17 -0700 (PDT)
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: netdev@vger.kernel.org,
	kuba@kernel.org,
	daniel.zahka@gmail.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Petr Vorel <pvorel@suse.cz>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	narcisav.kernel@gmail.com
Subject: [PATCH net-next] selftests: drv-net: add BIG TCP coverage to TSO test
Date: Mon, 21 Sep 2026 13:11:45 -0700
Message-ID: <20260921201145.49875-1-narcisav.kernel@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add IPv4 and IPv6 test cases that exercise GSO packets under BIG TCP
size limits.

1..2
ok 1 tso.big_tcp_ipv4
ok 2 tso.big_tcp_ipv6

Both of them run the existing tx-tcp-segmentation
and tx-tcp6-segmentation tests at the increased TSO maximum.

Additionally, reserve a hugepage and transmit its content using
MSG_ZEROCOPY to produce skb fragments larger than 65536.
Check that the number of retransmissions represents a small
percentage of the total packets sent. Record the number of drops
before and after the send to catch issues with large frag
handling during segmentation.

Signed-off-by: Narcisa Vasile <narcisav.kernel@gmail.com>
---
 tools/testing/selftests/drivers/net/hw/tso.py | 161 ++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index 67f6c9ca9a64..176ddf97fabb 100755
--- a/tools/testing/selftests/drivers/net/hw/tso.py
+++ b/tools/testing/selftests/drivers/net/hw/tso.py
@@ -4,6 +4,7 @@
 """A simple test for TSO."""
 
 import fcntl
+import mmap
 import socket
 import struct
 import termios
@@ -15,6 +16,87 @@ from lib.py import EthtoolFamily, NetdevFamily, NetDrvEpEnv
 from lib.py import bkg, cmd, defer, ethtool, ip, rand_port, wait_port_listen
 
 
+MAP_HUGETLB = getattr(mmap, "MAP_HUGETLB", 0x40000)
+MSG_ZEROCOPY = getattr(socket, "MSG_ZEROCOPY", 0x4000000)
+SO_ZEROCOPY = getattr(socket, "SO_ZEROCOPY", 60)
+
+GSO_LEGACY_MAX_SIZE = 65536
+
+# Pool of the default hugepage size, the one /proc/meminfo reports on.
+NR_HUGEPAGES = "/proc/sys/vm/nr_hugepages"
+
+
+def default_huge_page_size():
+    """Return the hugepage size in bytes"""
+    try:
+        with open("/proc/meminfo", encoding="utf-8") as meminfo:
+            for line in meminfo:
+                if line.startswith("Hugepagesize:"):
+                    return int(line.split()[1]) * 1024
+    except OSError:
+        pass
+
+    return 2 * 1024 * 1024
+
+
+def hugepages_free():
+    """Return the number of unused hugepages of the default size."""
+    try:
+        with open("/proc/meminfo", encoding="utf-8") as meminfo:
+            for line in meminfo:
+                if line.startswith("HugePages_Free:"):
+                    return int(line.split()[1])
+    except OSError:
+        pass
+    return 0
+
+
+def set_nr_hugepages(count):
+    with open(NR_HUGEPAGES, "w", encoding="utf-8") as sysctl:
+        sysctl.write(f"{count}\n")
+
+
+def tx_dropped(ifname):
+    with open(f"/sys/class/net/{ifname}/statistics/tx_dropped",
+              encoding="utf-8") as counter:
+        return int(counter.read())
+
+
+def setup_hugepage():
+    """Reserve one hugepage, and put the pool back afterwards."""
+    if hugepages_free() >= 1:
+        return
+
+    try:
+        with open(NR_HUGEPAGES, encoding="utf-8") as sysctl:
+            old_count = int(sysctl.read())
+        set_nr_hugepages(old_count + 1)
+    except OSError as error:
+        raise KsftSkipEx(f"Unable to reserve a hugepage: {error}") from error
+
+    defer(set_nr_hugepages, old_count)
+
+    if hugepages_free() < 1:
+        raise KsftSkipEx("Unable to reserve a hugepage")
+
+
+def mmap_large_buffer():
+    """Allocate a buffer backed by one huge page."""
+    size = default_huge_page_size()
+
+    setup_hugepage()
+
+    try:
+        return mmap.mmap(-1, size,
+                         flags=mmap.MAP_PRIVATE |
+                               mmap.MAP_ANONYMOUS |
+                               MAP_HUGETLB,
+                         prot=mmap.PROT_READ)
+    except OSError as e:
+        raise KsftSkipEx(f"Unable to allocate a {size >> 20}MB hugepage "
+                         f"buffer: {e}") from e
+
+
 def sock_wait_drain(sock, max_wait=1000):
     """Wait for all pending write data on the socket to get ACKed."""
     for _ in range(max_wait):
@@ -33,6 +115,32 @@ def tcp_sock_get_retrans(sock):
     return struct.unpack("I", info[100:104])[0]
 
 
+def setup_big_tcp(cfg):
+    """Lift the GSO ceiling to what the device advertises for TSO."""
+    if cfg.dev["tso_max_size"] <= GSO_LEGACY_MAX_SIZE:
+        raise KsftSkipEx("Device does not support BIG TCP")
+
+    ip(f"link set dev {cfg.ifname} "
+       f"gso_max_size {cfg.dev['tso_max_size']} "
+       f"gso_ipv4_max_size {cfg.dev['tso_max_size']}")
+
+    defer(ip, f"link set dev {cfg.ifname} "
+              f"gso_max_size {cfg.dev['gso_max_size']} "
+              f"gso_ipv4_max_size {cfg.dev['gso_ipv4_max_size']}")
+
+
+def sock_send_zerocopy(sock):
+    """Send with MSG_ZEROCOPY, return the bytes queued."""
+    try:
+        sock.setsockopt(socket.SOL_SOCKET, SO_ZEROCOPY, 1)
+    except OSError as e:
+        raise KsftSkipEx(f"SO_ZEROCOPY not supported: {e}") from e
+
+    with mmap_large_buffer() as tx_buf:
+        sock.sendall(tx_buf, MSG_ZEROCOPY)
+        return len(tx_buf)
+
+
 def run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso):
     cfg.require_cmd("socat", local=False, remote=True)
 
@@ -96,6 +204,46 @@ def run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso):
                         500, comment="Number of LSO wire-packets with LSO disabled")
 
 
+def run_big_tcp_stream(cfg, ipver, remote_v4, remote_v6):
+    """Send with MSG_ZEROCOPY out of a huge page, so the frags exceed 64kB."""
+    cfg.require_cmd("socat", local=False, remote=True)
+
+    # No clamping, as it would keep the frags under 64kB
+    port = rand_port()
+    listen_opts = f"{port},reuseport"
+    listen_cmd = f"socat -{ipver} -t 2 -u TCP-LISTEN:{listen_opts} /dev/null,ignoreeof"
+
+    with bkg(listen_cmd, host=cfg.remote, exit_wait=True):
+        wait_port_listen(port, host=cfg.remote)
+
+        if ipver == "4":
+            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+            sock.connect((remote_v4, port))
+        else:
+            sock = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
+            sock.connect((remote_v6, port))
+
+        # Small send to make sure the connection is working.
+        sock.send("ping".encode())
+        sock_wait_drain(sock)
+
+        retrans_old = tcp_sock_get_retrans(sock)
+        drops_old = tx_dropped(cfg.ifname)
+
+        sent = sock_send_zerocopy(sock)
+        sock_wait_drain(sock)
+
+        drops = tx_dropped(cfg.ifname) - drops_old
+        retrans = tcp_sock_get_retrans(sock) - retrans_old
+        sock.close()
+
+        ksft_eq(drops, 0, comment="Driver TX drops during BIG TCP send")
+
+        # Same best effort bound as the plain stream.
+        total_lso_wire = sent * 0.90 // cfg.dev["mtu"]
+        ksft_lt(retrans, total_lso_wire / 16)
+
+
 def build_tunnel(cfg, outer_ipver, tun_info):
     local_v4  = NetDrvEpEnv.nsim_v4_pfx + "1"
     local_v6  = NetDrvEpEnv.nsim_v6_pfx + "1"
@@ -147,6 +295,11 @@ def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
         if feature not in cfg.hw_features:
             raise KsftSkipEx(f"Device does not support {feature}")
 
+        # Run non-tunnel test cases under the BIG TCP limits too.
+        big_tcp = "big_tcp" in name
+        if big_tcp:
+            setup_big_tcp(cfg)
+
         ipver = outer_ipver
         if tun:
             remote_v4, remote_v6 = build_tunnel(cfg, ipver, tun)
@@ -159,6 +312,9 @@ def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
         ethtool(f"-K {cfg.ifname} {feature} off")
         run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso=False)
 
+        if big_tcp:
+            run_big_tcp_stream(cfg, ipver, remote_v4, remote_v6)
+
         ethtool(f"-K {cfg.ifname} tx-gso-partial off")
         ethtool(f"-K {cfg.ifname} tx-tcp-mangleid-segmentation off")
         if feature in cfg.partial_features:
@@ -171,6 +327,9 @@ def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
         ethtool(f"-K {cfg.ifname} {feature} on")
         run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso=True)
 
+        if big_tcp:
+            run_big_tcp_stream(cfg, ipver, remote_v4, remote_v6)
+
     f.__name__ = name + ((outer_ipver + "_") if tun else "") + "ipv" + inner_ipver
     return f
 
@@ -230,6 +389,8 @@ def main() -> None:
             # name,       v4/v6  ethtool_feature               tun:(type, args, inner ip versions)
             ("",           "4", "tx-tcp-segmentation",         None),
             ("",           "6", "tx-tcp6-segmentation",        None),
+            ("big_tcp_",   "4", "tx-tcp-segmentation",         None),
+            ("big_tcp_",   "6", "tx-tcp6-segmentation",        None),
             ("vxlan",      "4", "tx-udp_tnl-segmentation",     ("vxlan", "id 100 dstport 4789 noudpcsum", ("4", "6"))),
             ("vxlan",      "6", "tx-udp_tnl-segmentation",     ("vxlan", "id 100 dstport 4789 udp6zerocsumtx udp6zerocsumrx", ("4", "6"))),
             ("vxlan_csum", "", "tx-udp_tnl-csum-segmentation", ("vxlan", "id 100 dstport 4789 udpcsum", ("4", "6"))),
-- 
2.53.0-Meta


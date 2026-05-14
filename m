Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7038E5C8
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 17:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779375; cv=none; b=oqL+O9Jve6DuPm5XZj4jXVzN4sLQeKDn/glpVjVVT0/AMF7F72yDYEdT7FNNx5HWPyqgldzixsZqIhosltMawSPZHXjeJV/jbykPt6E9VX/XBDaNHKM0TR/0u2PjxJLBGqf1ecBxyBgp51I7KIeCQ1TIUx4z/yuWx/dS+512uOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779375; c=relaxed/simple;
	bh=wptIkvH9L489Qlo2T7M1mLc4bl4xRw6+9h17Bso5o/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mVP2O8WWVJzVYF5s28YWu01ObW5LylOheun0rdKmJiJ12GPMp3kAC2d8HrQaRpZru3wFLrmkwO4vxQspNtF+oj404kgDbRv1Z7Jtzl6t5DHWiEds9P2nbpJLS49ZmiGyeScap0hKOGvULBydJr9LPy43G6+Cs2KjcgS7nzmY+1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enzGIqOg; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enzGIqOg"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65dd9b25829so4697513d50.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 10:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778779371; x=1779384171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HA/ybwawhpYacQbiJl7tU2w4tisbAXIL92cuydme34=;
        b=enzGIqOgEYzB+6SyUyh1GN7EtLmoHeyU4CvqLV7imOsRX80EPJUvnhA3ePoLFNuydj
         B/G+6ZsDp+kP8XH3g1xVSDF0/cKMIrDRO6g55ZG+iTN2soA8hVtsjj2QTIJrpEYZgywK
         FSiblWES/YabS2q+5MgwDRaWlH+Ly+DiesfBjdZH15V8vVw3pvLaq8jxGJyTTBXBWhW/
         Lm/TAjVgvgRfotf85PY/QPe5Kqg4w/qMGPqP7q1VUhIVSiiEiFf+JRQCbubeSgDTSvuE
         FAwHqUaD4TTxoMKrqt0a5tD/aaVaq5/S46IDFcC8LjQME9um8PmvbTgj+p0+widX/d3z
         fr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778779371; x=1779384171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9HA/ybwawhpYacQbiJl7tU2w4tisbAXIL92cuydme34=;
        b=aPxzdiG1BSIcZMgutboVt0vBu3k3yqjo8t9PWVpgUiivHJZUN0oNYKO8T9EEtt0+7e
         Pa6JTNZjnaq4sLQpbrTdUEtvbWNWDX4fcFDCecD7djg9cTvXe/G3nLbUxQfgXxwc0zut
         crIPtgLLyKxUCj7tCypAr/hTWPvmygQ+i1OM1DWV6iON1vPv6R9LUOuji7w0/uYQydJW
         xCpr/CWYL4EJA1D+m3PzqPzYwKpnpFjF4iPLVrd89jjcykcj6aZJxQj8bm3ne1yW+QGk
         u2IPGqML6lsLZjgJtERWTzQQVJTXXDCNXlAlobbIO8a/ks52SWvXe9Oy1bM6Qs2DhjD9
         gjMw==
X-Forwarded-Encrypted: i=1; AFNElJ/z+XVyDdEbUFqi6OpUj+e3n/lQG7j9cSfFtd1qFLcHJXcaWbTAyEqYAFVrxA20yfrhAqN7B9aG2f0f9Pb5ZAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyfY8whJyZdcRj4eiVB2iCOaSI/4UbVGyLEE4zAMo4NzeIvum8
	0gsqFd3aXU9q5ywK4I20HEMPsQrAtEJsrSFBmr1keFCH6Ybtuk4S2hR2
X-Gm-Gg: Acq92OFFJYD6h1Bipxn4KnsdwGshUhuJK15pF9STOOKLjshmQR0LSpUd41OmdjLXlWO
	5cHW/tj+GKZc6JT/KdQb5QViAp8JqTOb2/H06wRTNaMZK6u0eXvsttVhGKc23AYtzKeOFh180R+
	G6F3QF8CHh0KBRni+AiJ/xebhsL8h3y6IY9qOmoOswf34GsALOYhslEmNuG1XQnf3X+UBY9qrXj
	iVXs2ttUul/9vrKJbbDQFCQqAOsQPXOZgYdSro6cESkWebbZkRZHxg6qutfraHQ5gQUNOTiXuh9
	BOZEgKOup6A8yg/x4kAcjdL4obX3zMKVMzVzIxNYknJeNlgsr91RSigf/nWY/r9p6PKHvnKE6Iw
	wHHjKUbx8tmGKu0PjTRg6h7yQmX66NTypNcrEFfHez3g6yp8JHVpYE++Jbz40E5+78OIBpGSPjD
	v4L/QomtIo8pIW7mRpM1zHrg==
X-Received: by 2002:a53:d051:0:20b0:650:ea3:de9b with SMTP id 956f58d0204a3-65e226de860mr156252d50.21.1778779371526;
        Thu, 14 May 2026 10:22:51 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:23::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0dbcda4bsm1363004d50.18.2026.05.14.10.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:22:51 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Thu, 14 May 2026 10:22:32 -0700
Subject: [PATCH net-next v5 5/8] selftests: drv-net: make attr
 _nk_guest_ifname public
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-tcp-dm-netkit-v5-5-408c59b91e66@meta.com>
References: <20260514-tcp-dm-netkit-v5-0-408c59b91e66@meta.com>
In-Reply-To: <20260514-tcp-dm-netkit-v5-0-408c59b91e66@meta.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: dw@davidwei.uk, sdf.kernel@gmail.com, mohsin.bashr@gmail.com, 
 willemb@google.com, jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn, 
 wang.yaxin@zte.com.cn, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.13.0

From: Bobby Eshleman <bobbyeshleman@meta.com>

Subsequent patches will use the _nk_guest_ifname as a public attr for
setting up devmem. Rename to nk_guest_ifname to avoid angering the
linter about the '_' prefix being used for a non-private attr.

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/nk_qlease.py |  8 ++++----
 tools/testing/selftests/drivers/net/lib/py/env.py   | 16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/nk_qlease.py b/tools/testing/selftests/drivers/net/hw/nk_qlease.py
index aa83dc321328..139a91ebd229 100755
--- a/tools/testing/selftests/drivers/net/hw/nk_qlease.py
+++ b/tools/testing/selftests/drivers/net/hw/nk_qlease.py
@@ -71,7 +71,7 @@ def test_iou_zcrx(cfg) -> None:
     flow_rule_id = set_flow_rule(cfg)
     defer(ethtool, f"-N {cfg.ifname} delete {flow_rule_id}")
 
-    rx_cmd = f"ip netns exec {cfg.netns.name} {cfg.bin_local} -s -p {cfg.port} -i {cfg._nk_guest_ifname} -q {cfg.nk_queue}"
+    rx_cmd = f"ip netns exec {cfg.netns.name} {cfg.bin_local} -s -p {cfg.port} -i {cfg.nk_guest_ifname} -q {cfg.nk_queue}"
     tx_cmd = f"{cfg.bin_remote} -c -h {cfg.nk_guest_ipv6} -p {cfg.port} -l 12840"
     with bkg(rx_cmd, exit_wait=True):
         wait_port_listen(cfg.port, proto="tcp", ns=cfg.netns)
@@ -128,7 +128,7 @@ def test_attach_xdp_with_mp(cfg) -> None:
 
     netdevnl = NetdevFamily()
 
-    rx_cmd = f"ip netns exec {cfg.netns.name} {cfg.bin_local} -s -p {cfg.port} -i {cfg._nk_guest_ifname} -q {cfg.nk_queue}"
+    rx_cmd = f"ip netns exec {cfg.netns.name} {cfg.bin_local} -s -p {cfg.port} -i {cfg.nk_guest_ifname} -q {cfg.nk_queue}"
     with bkg(rx_cmd):
         wait_port_listen(cfg.port, proto="tcp", ns=cfg.netns)
 
@@ -178,7 +178,7 @@ def test_destroy(cfg) -> None:
     ethtool(f"-X {cfg.ifname} equal {cfg.src_queue}")
     defer(ethtool, f"-X {cfg.ifname} default")
 
-    rx_cmd = f"ip netns exec {cfg.netns.name} {cfg.bin_local} -s -p {cfg.port} -i {cfg._nk_guest_ifname} -q {cfg.nk_queue}"
+    rx_cmd = f"ip netns exec {cfg.netns.name} {cfg.bin_local} -s -p {cfg.port} -i {cfg.nk_guest_ifname} -q {cfg.nk_queue}"
     rx_proc = cmd(rx_cmd, background=True)
     wait_port_listen(cfg.port, proto="tcp", ns=cfg.netns)
 
@@ -196,7 +196,7 @@ def test_destroy(cfg) -> None:
     ip(f"link del dev {cfg._nk_host_ifname}")
     kill_timer.join()
     cfg._nk_host_ifname = None
-    cfg._nk_guest_ifname = None
+    cfg.nk_guest_ifname = None
 
     queue_info = netdevnl.queue_get(
         {"ifindex": cfg.ifindex, "id": cfg.src_queue, "type": "rx"}
diff --git a/tools/testing/selftests/drivers/net/lib/py/env.py b/tools/testing/selftests/drivers/net/lib/py/env.py
index 24ce122abd9c..409b41922245 100644
--- a/tools/testing/selftests/drivers/net/lib/py/env.py
+++ b/tools/testing/selftests/drivers/net/lib/py/env.py
@@ -339,7 +339,7 @@ class NetDrvContEnv(NetDrvEpEnv):
     def __init__(self, src_path, rxqueues=1, **kwargs):
         self.netns = None
         self._nk_host_ifname = None
-        self._nk_guest_ifname = None
+        self.nk_guest_ifname = None
         self._tc_clsact_added = False
         self._tc_attached = False
         self._bpf_prog_pref = None
@@ -390,7 +390,7 @@ class NetDrvContEnv(NetDrvEpEnv):
 
         netkit_links.sort(key=lambda x: x['ifindex'])
         self._nk_host_ifname = netkit_links[1]['ifname']
-        self._nk_guest_ifname = netkit_links[0]['ifname']
+        self.nk_guest_ifname = netkit_links[0]['ifname']
         self.nk_host_ifindex = netkit_links[1]['ifindex']
         self.nk_guest_ifindex = netkit_links[0]['ifindex']
 
@@ -409,7 +409,7 @@ class NetDrvContEnv(NetDrvEpEnv):
         if self._nk_host_ifname:
             cmd(f"ip link del dev {self._nk_host_ifname}")
             self._nk_host_ifname = None
-            self._nk_guest_ifname = None
+            self.nk_guest_ifname = None
 
         if self._init_ns_attached:
             cmd("ip netns del init", fail=False)
@@ -448,16 +448,16 @@ class NetDrvContEnv(NetDrvEpEnv):
         cmd("ip netns attach init 1")
         self._init_ns_attached = True
         ip("netns set init 0", ns=self.netns)
-        ip(f"link set dev {self._nk_guest_ifname} netns {self.netns.name}")
+        ip(f"link set dev {self.nk_guest_ifname} netns {self.netns.name}")
         ip(f"link set dev {self._nk_host_ifname} up")
         ip(f"-6 addr add fe80::1/64 dev {self._nk_host_ifname} nodad")
         ip(f"-6 route add {self.nk_guest_ipv6}/128 via fe80::2 dev {self._nk_host_ifname}")
 
         ip("link set lo up", ns=self.netns)
-        ip(f"link set dev {self._nk_guest_ifname} up", ns=self.netns)
-        ip(f"-6 addr add fe80::2/64 dev {self._nk_guest_ifname}", ns=self.netns)
-        ip(f"-6 addr add {self.nk_guest_ipv6}/64 dev {self._nk_guest_ifname} nodad", ns=self.netns)
-        ip(f"-6 route add default via fe80::1 dev {self._nk_guest_ifname}", ns=self.netns)
+        ip(f"link set dev {self.nk_guest_ifname} up", ns=self.netns)
+        ip(f"-6 addr add fe80::2/64 dev {self.nk_guest_ifname}", ns=self.netns)
+        ip(f"-6 addr add {self.nk_guest_ipv6}/64 dev {self.nk_guest_ifname} nodad", ns=self.netns)
+        ip(f"-6 route add default via fe80::1 dev {self.nk_guest_ifname}", ns=self.netns)
 
     def _tc_ensure_clsact(self):
         qdisc = json.loads(cmd(f"tc -j qdisc show dev {self.ifname}").stdout)

-- 
2.53.0-Meta


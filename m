Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471D2DECDF
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 02:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529951; cv=none; b=t8JERBz5lmMbmY6oA73Ue3fus9EyJZCCbLSvxcOwPwki/avF7JJmf6ez6InAn4+/TBYgshJ94WIFJ8R+Sl0xVMS6YbC3ab8KYbI3X3rrHygG94IP/JGCi9hAzNvsZyS+DFxxmDUmQfQtDhKYPvS5GxVqIYQkt0iiIqVdhiV5dhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529951; c=relaxed/simple;
	bh=SfgMN3y4jYNXbpizBMWePWbS3RAPpZZUcCKLotlKuCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Em3iLCtcL+syDCFYU8TnPSwCBm+xW1h+psM0mN2lZK8A7sFH5+mU261oogSpGQGwYMg7zHS47r9rePqo1caeVEYeAgUHC48Sbrsg2tKIlmGkU3k+y36HiBtu6QM/QTCOpC7uIyy5Js+eEpzbWRfina+6lpIHJ3ljEbSNy3jAv0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pg+tUasE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pg+tUasE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775529945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EXd4/voVLzjEmWeVtz1atqAJ9E1tZgC6UdSGMEkrm6A=;
	b=Pg+tUasEyVaHcD2bCUmlyy1k1fWD6tim9MD475YhPKKqUhcQdSaw0ZmkBtGl6ird5saP4H
	uj50zk5KMtJgBPSGp6l8n2q4n5Wtc8A3QC7pu+8bJKM4Zs1gBgk48f0Yakydw6uLKTKHb4
	FndporvUDJ0gBC0OiFNj/QwgkuMBhEQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-n-g1HeEcMa29HzTyS5wW7g-1; Mon,
 06 Apr 2026 22:45:39 -0400
X-MC-Unique: n-g1HeEcMa29HzTyS5wW7g-1
X-Mimecast-MFC-AGG-ID: n-g1HeEcMa29HzTyS5wW7g_1775529932
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1084D195608A;
	Tue,  7 Apr 2026 02:45:32 +0000 (UTC)
Received: from xudu-thinkpadx1carbongen9.nay.com (unknown [10.72.116.131])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 407D5300019F;
	Tue,  7 Apr 2026 02:45:27 +0000 (UTC)
From: Xu Du <xudu@redhat.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next 3/4] selftests: drv-net: tso: add Geneve double tunneling GSO test
Date: Tue,  7 Apr 2026 10:45:10 +0800
Message-ID: <59ac21abe8a0d7431485ae1c9d158eecbb877b75.1775527362.git.xudu@redhat.com>
In-Reply-To: <cover.1775527362.git.xudu@redhat.com>
References: <cover.1775527362.git.xudu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Add a new test case to verify GSO behavior for double-encapsulated Geneve
tunnels. This ensures that hardware drivers and the network stack correctly
handle nested tunnel headers during segmentation.

To maintain consistency and avoid complexity in hardware parser logic, the
test case ensures that the IP versions for both the inner and outer headers
remain the same.

Signed-off-by: Xu Du <xudu@redhat.com>
---
 tools/testing/selftests/drivers/net/hw/tso.py | 228 +++++++++++++++---
 1 file changed, 188 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index f792115adfb3..6b4639ce6139 100755
--- a/tools/testing/selftests/drivers/net/hw/tso.py
+++ b/tools/testing/selftests/drivers/net/hw/tso.py
@@ -5,6 +5,7 @@
 
 import errno
 import fcntl
+import json
 import socket
 import struct
 import termios
@@ -13,7 +14,29 @@ import time
 from lib.py import ksft_pr, ksft_run, ksft_exit, KsftSkipEx, KsftXfailEx
 from lib.py import ksft_eq, ksft_ge, ksft_lt
 from lib.py import EthtoolFamily, NetdevFamily, NetDrvEpEnv
-from lib.py import bkg, cmd, defer, ethtool, ip, rand_port, wait_port_listen
+from lib.py import bkg, ynlcli, defer, ethtool, ip, rand_port, wait_port_listen
+
+
+def _convert_ip(key):
+    def _conv(val):
+        final_key = f"{key}6" if ":" in str(val) else key
+        return final_key, val
+
+    return _conv
+
+
+YNLLINK_PARAM_MAP = {
+    "geneve": {
+        "id": ("id", int),
+        "dstport": ("port", int),
+        "remote": ("", _convert_ip("remote")),
+        "udpcsum": ("udp-csum",),
+        "udp6zerocsumtx": ("udp-zero-csum6-tx",),
+        "udp6zerocsumrx": ("udp-zero-csum6-rx",),
+        "gro-hint": ("gro-hint",),
+        "innerprotoinherit": ("inner-proto-inherit",),
+    },
+}
 
 
 def sock_wait_drain(sock, max_wait=1000):
@@ -107,29 +130,106 @@ def run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso):
                         500, comment="Number of LSO wire-packets with LSO disabled")
 
 
-def build_tunnel(cfg, outer_ipver, tun_info):
-    local_v4  = NetDrvEpEnv.nsim_v4_pfx + "1"
-    local_v6  = NetDrvEpEnv.nsim_v6_pfx + "1"
-    remote_v4 = NetDrvEpEnv.nsim_v4_pfx + "2"
-    remote_v6 = NetDrvEpEnv.nsim_v6_pfx + "2"
-
-    local_addr  = cfg.addr_v[outer_ipver]
-    remote_addr = cfg.remote_addr_v[outer_ipver]
+def get_tun_ip_address(encap_tun):
+    pfx_v4 = NetDrvEpEnv.nsim_v4_pfx
+    pfx_v6 = NetDrvEpEnv.nsim_v6_pfx.rsplit("::", 1)[0] + ":"
+    v4_offset = 1 if encap_tun == "outer" else 17
+    v6_offset = "1" if encap_tun == "outer" else "2"
+    local_v4 = f"{pfx_v4}{v4_offset}"
+    remote_v4 = f"{pfx_v4}{v4_offset + 1}"
+    local_v6 = f"{pfx_v6}{v6_offset}::1"
+    remote_v6 = f"{pfx_v6}{v6_offset}::2"
+    return local_v4, remote_v4, 28, local_v6, remote_v6, 80
+
+
+def parse_tun_args(tun_arg, tunnel_arg_dict):
+    data = {}
+    args = tun_arg.split()
+    i = 0
+    while i < len(args):
+        negate = False
+        item = tunnel_arg_dict.get(args[i])
+        if item is None and args[i].startswith("no"):
+            item = tunnel_arg_dict.get(args[i][2:])
+            negate = True
+        if item and len(item) == 2:
+            key, conv = item
+            val = conv(args[i + 1])
+            if isinstance(val, tuple) and len(val) == 2:
+                data[val[0]] = val[1]
+            else:
+                data[key] = val
+            i += 2
+        elif item:
+            data[item[0]] = 0 if negate else 1
+            i += 1
+        else:
+            i += 1
+    return data
+
+
+def create_tunnel(tun_type, tun_name, tun_arg, host=None) -> None:
+    tunnel_arg_dict = YNLLINK_PARAM_MAP.get(tun_type)
+    if tunnel_arg_dict:
+        data = parse_tun_args(tun_arg, tunnel_arg_dict)
+        nl_msg = json.dumps({
+            "ifname": tun_name,
+            "linkinfo": {"kind": tun_type, "data": data},
+        })
+        ynlcli("rt-link",
+               f"--create --excl --do newlink --json '{nl_msg}'",
+               host=host)
+    else:
+        ip(f"link add {tun_name} type {tun_type} {tun_arg}", host=host)
+
+
+def build_tunnel(cfg, encap_ipver, encap_tun, tun_info):
+    if encap_tun == "outer":
+        encap_addr = cfg.addr_v[encap_ipver]
+        decap_addr = cfg.remote_addr_v[encap_ipver]
+    else:
+        local_v4, remote_v4, _, local_v6, remote_v6, _ = get_tun_ip_address(
+            "outer")
+        encap_addr = local_v4 if encap_ipver == "4" else local_v6
+        decap_addr = remote_v4 if encap_ipver == "4" else remote_v6
 
     tun_type = tun_info[0]
-    tun_arg  = tun_info[1]
-    ip(f"link add {tun_type}-ksft type {tun_type} {tun_arg} local {local_addr} remote {remote_addr} dev {cfg.ifname}")
-    defer(ip, f"link del {tun_type}-ksft")
-    ip(f"link set dev {tun_type}-ksft up")
-    ip(f"addr add {local_v4}/24 dev {tun_type}-ksft")
-    ip(f"addr add {local_v6}/64 dev {tun_type}-ksft")
-
-    ip(f"link add {tun_type}-ksft type {tun_type} {tun_arg} local {remote_addr} remote {local_addr} dev {cfg.remote_ifname}",
-        host=cfg.remote)
-    defer(ip, f"link del {tun_type}-ksft", host=cfg.remote)
-    ip(f"link set dev {tun_type}-ksft up", host=cfg.remote)
-    ip(f"addr add {remote_v4}/24 dev {tun_type}-ksft", host=cfg.remote)
-    ip(f"addr add {remote_v6}/64 dev {tun_type}-ksft", host=cfg.remote)
+    tun_name = f"{tun_type}-ksft" if encap_tun == "outer" else f"in-{tun_type}-ksft"
+    local_v4, remote_v4, mask_v4, local_v6, remote_v6, mask_v6 = get_tun_ip_address(
+        encap_tun
+    )
+    tun_features = " ".join(
+        f + " on" for f in tun_info[2].split()) if tun_info[2] else ""
+
+    tun_dev = cfg.ifname if encap_tun == "outer" else f"{tun_type}-ksft"
+    tun_arg = tun_info[1] + \
+        f" local {encap_addr} remote {decap_addr} dev {tun_dev}"
+
+    create_tunnel(tun_type, tun_name, tun_arg)
+    defer(ip, f"link del {tun_name}")
+    ip(f"link set dev {tun_name} up")
+    ip(f"addr add {local_v4}/{mask_v4} dev {tun_name}")
+    ip(f"addr add {local_v6}/{mask_v6} dev {tun_name}")
+    if tun_features:
+        ethtool(f"-K {tun_name} {tun_features}")
+    # pmtu can't be propagated to upper layer devices; need manual adjust
+    if encap_tun == "inner":
+        tun_mtu = 1392 if encap_ipver == "4" else 1352
+        ip(f"link set dev {tun_name} mtu {tun_mtu}")
+
+    tun_dev = cfg.remote_ifname if encap_tun == "outer" else f"{tun_type}-ksft"
+    tun_arg = tun_info[1] + \
+        f" local {decap_addr} remote {encap_addr} dev {tun_dev}"
+
+    create_tunnel(tun_type, tun_name, tun_arg, host=cfg.remote)
+    defer(ip, f"link del {tun_name}", host=cfg.remote)
+    ip(f"link set dev {tun_name} up", host=cfg.remote)
+    ip(f"addr add {remote_v4}/{mask_v4} dev {tun_name}", host=cfg.remote)
+    ip(f"addr add {remote_v6}/{mask_v6} dev {tun_name}", host=cfg.remote)
+    if tun_features:
+        ethtool(f"-K {tun_name} {tun_features}", host=cfg.remote)
+    if encap_tun == "inner":
+        ip(f"link set dev {tun_name} mtu {tun_mtu}", host=cfg.remote)
 
     return remote_v4, remote_v6
 
@@ -145,7 +245,10 @@ def restore_wanted_features(cfg):
         ksft_pr(f"WARNING: failure restoring wanted features: {e}")
 
 
-def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
+def test_builder(
+    name, cfg, outer_ipver, feature, outer_tun=None,
+    inner_tun=None, inner_ipver=None,
+):
     """Construct specific tests from the common template."""
     def f(cfg):
         cfg.require_ipver(outer_ipver)
@@ -159,8 +262,12 @@ def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
             raise KsftSkipEx(f"Device does not support {feature}")
 
         ipver = outer_ipver
-        if tun:
-            remote_v4, remote_v6 = build_tunnel(cfg, ipver, tun)
+        if outer_tun and inner_tun:
+            build_tunnel(cfg, ipver, "outer", outer_tun)
+            remote_v4, remote_v6 = build_tunnel(cfg, ipver, "inner", inner_tun)
+            ipver = inner_ipver
+        elif outer_tun:
+            remote_v4, remote_v6 = build_tunnel(cfg, ipver, "outer", outer_tun)
             ipver = inner_ipver
         else:
             remote_v4 = cfg.remote_addr_v["4"]
@@ -182,7 +289,11 @@ def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
         ethtool(f"-K {cfg.ifname} {feature} on")
         run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso=True)
 
-    f.__name__ = name + ((outer_ipver + "_") if tun else "") + "ipv" + inner_ipver
+    outer_tun_name = f"{outer_tun[0]}{outer_ipver}_" if outer_tun else ""
+    inner_tun_name = f"{inner_tun[0]}{outer_ipver}_" if inner_tun else ""
+    f.__name__ = (
+        name + "_" if name else ""
+    ) + f"{outer_tun_name}{inner_tun_name}ipv{inner_ipver}"
     return f
 
 
@@ -242,14 +353,43 @@ def main() -> None:
         query_nic_features(cfg)
 
         test_info = (
-            # name,       v4/v6  ethtool_feature               tun:(type, args, inner ip versions)
-            ("",           "4", "tx-tcp-segmentation",         None),
-            ("",           "6", "tx-tcp6-segmentation",        None),
-            ("vxlan",      "4", "tx-udp_tnl-segmentation",     ("vxlan", "id 100 dstport 4789 noudpcsum", ("4", "6"))),
-            ("vxlan",      "6", "tx-udp_tnl-segmentation",     ("vxlan", "id 100 dstport 4789 udp6zerocsumtx udp6zerocsumrx", ("4", "6"))),
-            ("vxlan_csum", "", "tx-udp_tnl-csum-segmentation", ("vxlan", "id 100 dstport 4789 udpcsum", ("4", "6"))),
-            ("gre",        "4", "tx-gre-segmentation",         ("gre",   "", ("4", "6"))),
-            ("gre",        "6", "tx-gre-segmentation",         ("ip6gre","", ("4", "6"))),
+            # name, v4/v6, ethtool_feature,
+            # outer_tun:(type, args, ethtool_feature, inner ip versions),
+            # inner_tun:(type, args, ethtool_feature, inner ip versions)
+            ("", "4", "tx-tcp-segmentation", (), ()),
+            ("", "6", "tx-tcp6-segmentation", (), ()),
+            (
+                "vxlan", "4", "tx-udp_tnl-segmentation",
+                ("vxlan", "id 100 dstport 4789 noudpcsum", "", ("4", "6")), (),
+            ),
+            (
+                "vxlan", "6", "tx-udp_tnl-segmentation",
+                ("vxlan", "id 100 dstport 4789 udp6zerocsumtx udp6zerocsumrx",
+                 "", ("4", "6")),
+                (),
+            ),
+            (
+                "vxlan_csum", "", "tx-udp_tnl-csum-segmentation",
+                ("vxlan", "id 100 dstport 4789 udpcsum", "", ("4", "6")),
+                (),
+            ),
+            (
+                "gre", "4", "tx-gre-segmentation",
+                ("gre", "", "", ("4", "6")),
+                (),
+            ),
+            (
+                "gre", "6", "tx-gre-segmentation",
+                ("ip6gre", "", "", ("4", "6")),
+                (),
+            ),
+            (
+                "geneve2", "4", "tx-udp_tnl-segmentation",
+                ("geneve", "id 100 dstport 6081 noudpcsum udp6zerocsumtx udp6zerocsumrx",
+                 "tx-gso-partial tx-udp_tnl-segmentation tx-udp_tnl-csum-segmentation", (),),
+                ("geneve", "id 200 dstport 6082 noudpcsum udp6zerocsumtx udp6zerocsumrx",
+                 "", ("4", "6"),),
+            ),
         )
 
         cases = []
@@ -259,13 +399,21 @@ def main() -> None:
                 if info[1] and outer_ipver != info[1]:
                     continue
 
-                if info[3]:
-                    cases += [
-                        test_builder(info[0], cfg, outer_ipver, info[2], info[3], inner_ipver)
-                        for inner_ipver in info[3][2]
-                    ]
+                outer_tun, inner_tun = info[3], info[4]
+                if outer_tun and inner_tun:
+                    inner_ipvers = inner_tun[3]
+                    cases += [test_builder(info[0], cfg, outer_ipver, info[2],
+                                           outer_tun, inner_tun, inner_ipver)
+                              for inner_ipver in inner_ipvers]
+                elif outer_tun:
+                    inner_ipvers = outer_tun[3]
+                    cases += [test_builder(info[0], cfg, outer_ipver, info[2],
+                                           outer_tun, None, inner_ipver)
+                              for inner_ipver in inner_ipvers]
                 else:
-                    cases.append(test_builder(info[0], cfg, outer_ipver, info[2], None, outer_ipver))
+                    cases.append(
+                        test_builder(info[0], cfg, outer_ipver, info[2],
+                                     None, None, outer_ipver))
 
         ksft_run(cases=cases, args=(cfg, ))
     ksft_exit()
-- 
2.53.0


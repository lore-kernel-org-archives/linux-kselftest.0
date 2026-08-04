Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEDA2DF132
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785808104; cv=none; b=KJnDJEscO1CSQlqdLlDqHJ+XrqcpFwnXBO0Jmes3FG6OpPtxsseYHieatp4whZffvSeMwiDKpS3x5AtBLxFr+b5ZxBeLjHbuRVY4bjNY9VRCPYTo9FIe7dEAC8B8uZM7yZ9OEsxq/tiLPbN2kPu3JEpscnJtSb9DOOOeDhQy+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785808104; c=relaxed/simple;
	bh=O1CQFr8gL/tx0nZELxNaajoTVr4qy8kYNkp4eOn+3D8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfD9pnXJwjrbb+oLytA2xdviBDryFaayc3XJ1EDgS9IROj3bTsnlzkEs/maDBhDr7UJP0AwVnCRzeLAX1BLo+lSpGwsolk5WoFYUyn0ByLF4dMHXD14eOy4irynJD5Xgd63kWdq05lvhHV9kuBBC0w34RSgZBeetop5YYdvVOwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFLd+eJJ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFLd+eJJ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so3446063b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 18:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785808103; x=1786412903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IfEzsYijpMni+dHKVnbyAeGeNkrEFny9SRjpkXNKFps=;
        b=iFLd+eJJSdtsDCGhSc5ZyuE3+2myHIMNqcNAKOwent4o570T9ECl0/3kcIkxKARVU2
         yvoas6ZKzde4ZuedQQWKxxYzhc37ceUp8p/gpnMeQgg6KpzKqXIjS6uVpXOxtgFc69go
         MbYwvj1clJsKoUlifFjMdX9g9xOjespvjJv8b8KAu+EA7IaBPsHbDdDy9e6lfOewuCor
         1CdO595vaN0kHuQdQIy+9WNE6b04yWDuGKyodGci1iqkVPpTEC94tkVjty3PkWdi+Nsm
         WilZvDCzQ0Kjs+lmec2X1TZlJZCevWhOE8QiE/LBxAxcuutwvfVWoF7CktE087UqPFu0
         p9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785808103; x=1786412903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IfEzsYijpMni+dHKVnbyAeGeNkrEFny9SRjpkXNKFps=;
        b=jbgf1jFSYGc/ZSom4AZhf4QMAZfUDgH0hzugWO6aTPslbLYAXFfpafnKq7UPRas+ZD
         +h+/r6OsjBibnJjyy2RoAIY37DbKV9Uj3NpfvKlk+Qbx7Fr1M69/Gn5lQ4i2voOJRYBW
         aQW3FTZU2PIazZJX4WH4R0PsBVI4WW07rxETYJ/APe7HI/DJgYAHwEPyHBlZ5S0z2lkH
         Uwsan5IaOXTrYwplYJHGiC9QNjaf829raNjbaQecxNJVmI1tJ7U9GWAndFv1jcl0xhs0
         Bvgmvm1BYcid/SmsHPwLLbrxaVITMussTF7fBmBGEj+mEZy/77GJslNmbg/eSgI34Tff
         g0Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rq5XFVs4ssc0fGknv3psxIzGmvs/gfnR70z0Up9lBAOc1CDH7AaKggYYEbxgwv+Qka06YvhyyG88fhFnpM5wgk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vHn+PeDyR8fMMdf+kmI7YWKgsOkQLeudTz7BVUbpixyPYbzY
	vjaZxpeQ4Va1khVTchYHbvHf4LRuYgj52LAq9C6n023Rv5YonpsLZzEb
X-Gm-Gg: AR+sD127HsEQR93gqiLZYUAPFGIH5WagDW0Mc7ql8ZpMP8m3tzKAbFjQlkOKxC9hkJj
	fnJpXdmjPFrW/P/mgBpp/qt71kryzh79uLT5BFBdv4eQOMvndiew6jjpqIl2RYfyCuueky7gRVK
	OZiKrlzMMumDd9A8ncPMMudQBPyoE7FZfDqawILnnSXabiqItBdu5kgimoNFYqawZdL7K6WgDO/
	Dk/5BzAXpENDrXCNYFlb8cfkSnbc4DjKgk6pNulHN5SGZOfYbdYZSAhjma3xoO8W2t3HwUE1y0s
	QOx+AQWn+hCkyHCGjQoGNk6PZgOhcUDtFEHz3BYcP2s+wcXSGJppbZaLNFMLPPvN0qrrnSvbG+w
	7IkkMyjD0z5fZ49EdQ8DJasGWw1yUzQMz/NGG2hJatscfyXCsXMYs/Q4uia/+a5XtjJEGbWPdZV
	QXtkw5khg6OvG5yMfWkdGpctRh7Ug2C70lZ+N/mb8JWmm3Rh0LJUtYTf7PJZyh/m2DE7Db3G5Pi
	jJZvV9S5t4x2xhPvjCd9PcTjR2/9MCGv8kAe50bveg/9zY3ptfdNHOIWPDSsQ==
X-Received: by 2002:a05:6a00:3926:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-84ee47e01ecmr10832317b3a.4.1785808102604;
        Mon, 03 Aug 2026 18:48:22 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:cb1c:934a:3e5f:ef88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7b97sm4410164b3a.43.2026.08.03.18.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 18:48:22 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Gal Pressman <gal@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nimrod Oren <noren@nvidia.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v5 10/10] selftests: net: verify RTA_DEL_REASON on route deletion
Date: Tue,  4 Aug 2026 10:47:14 +0900
Message-ID: <20260804014714.4362-11-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804014714.4362-1-sigefriedhyy@gmail.com>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend rtnetlink.py to check the reason reported in RTM_DELROUTE:

- expired: route with a 2s lifetime collected by the fib6 GC
  (gc_interval lowered like fib_tests.sh fib6_gc_test does);
- ra-withdrawn: a single RA advertises a default route (router
  lifetime), an on-link prefix route (RFC 4861 prefix information
  option) and a route information option route (RFC 4191), then a
  second RA withdraws all three with zero lifetimes; the RAs are
  crafted over a raw ICMPv6 socket so the test does not depend on an
  external RA tool;
- absence: a userspace deletion request records no cause and must not
  carry the attribute at all.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 .../testing/selftests/net/lib/py/__init__.py  |   4 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   7 +-
 tools/testing/selftests/net/rtnetlink.py      | 181 +++++++++++++++++-
 3 files changed, 187 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/__init__.py b/tools/testing/selftests/net/lib/py/__init__.py
index e58bdbdc58ee..34935886b6ad 100644
--- a/tools/testing/selftests/net/lib/py/__init__.py
+++ b/tools/testing/selftests/net/lib/py/__init__.py
@@ -17,7 +17,7 @@ from .utils import CmdExitFailure, fd_read_timeout, cmd, bkg, defer, \
     wait_file, tool, tc
 from .bpf import bpf_map_set, bpf_map_dump, bpf_prog_map_ids
 from .ynl import NlError, NlctrlFamily, YnlFamily, \
-    EthtoolFamily, NetdevFamily, RtnlFamily, RtnlAddrFamily
+    EthtoolFamily, NetdevFamily, RtnlFamily, RtnlAddrFamily, RtnlRouteFamily
 from .ynl import NetshaperFamily, DevlinkFamily, PSPFamily, Netlink
 
 __all__ = ["KSRC",
@@ -34,4 +34,4 @@ __all__ = ["KSRC",
            "NetdevSim", "NetdevSimDev",
            "NetshaperFamily", "DevlinkFamily", "PSPFamily", "NlError",
            "YnlFamily", "EthtoolFamily", "NetdevFamily", "RtnlFamily",
-           "NlctrlFamily", "RtnlAddrFamily", "Netlink"]
+           "NlctrlFamily", "RtnlAddrFamily", "RtnlRouteFamily", "Netlink"]
diff --git a/tools/testing/selftests/net/lib/py/ynl.py b/tools/testing/selftests/net/lib/py/ynl.py
index 2e567062aa6c..08deff756f29 100644
--- a/tools/testing/selftests/net/lib/py/ynl.py
+++ b/tools/testing/selftests/net/lib/py/ynl.py
@@ -29,7 +29,7 @@ except ModuleNotFoundError as e:
 
 __all__ = [
     "NlError", "NlPolicy", "Netlink", "YnlFamily", "SPEC_PATH",
-    "EthtoolFamily", "RtnlFamily", "RtnlAddrFamily",
+    "EthtoolFamily", "RtnlFamily", "RtnlAddrFamily", "RtnlRouteFamily",
     "NetdevFamily", "NetshaperFamily", "NlctrlFamily", "DevlinkFamily",
     "PSPFamily",
 ]
@@ -54,6 +54,11 @@ class RtnlAddrFamily(YnlFamily):
         super().__init__((SPEC_PATH / Path('rt-addr.yaml')).as_posix(),
                          schema='', recv_size=recv_size)
 
+class RtnlRouteFamily(YnlFamily):
+    def __init__(self, recv_size=0):
+        super().__init__((SPEC_PATH / Path('rt-route.yaml')).as_posix(),
+                         schema='', recv_size=recv_size)
+
 class NetdevFamily(YnlFamily):
     def __init__(self, recv_size=0):
         super().__init__((SPEC_PATH / Path('netdev.yaml')).as_posix(),
diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
index 0c67c7c00d84..f74ccd5c2d13 100755
--- a/tools/testing/selftests/net/rtnetlink.py
+++ b/tools/testing/selftests/net/rtnetlink.py
@@ -5,7 +5,8 @@ import socket
 import struct
 import time
 from lib.py import bkg, ip, ksft_exit, ksft_run, ksft_eq, ksft_ge, ksft_true, KsftSkipEx
-from lib.py import CmdExitFailure, NetNS, NetNSEnter, RtnlAddrFamily
+from lib.py import ksft_not_in, ksft_not_none
+from lib.py import CmdExitFailure, NetNS, NetNSEnter, RtnlAddrFamily, RtnlRouteFamily
 
 IPV4_ALL_HOSTS_MULTICAST = b'\xe0\x00\x00\x01'
 IPV4_TEST_MULTICAST = b'\xef\x01\x01\x01'
@@ -134,8 +135,184 @@ def ipv4_devconf_notify() -> None:
     ksft_true(f"inet {ifname} forwarding on" in cmd_obj.stdout,
               f"No 'forwarding on' notificiation found for interface {ifname}")
 
+def _rtnl_route_subscribe(ns):
+    with NetNSEnter(str(ns)):
+        rtnl = RtnlRouteFamily()
+    rtnl.ntf_subscribe("rtnlgrp-ipv6-route")
+    return rtnl
+
+
+def _wait_route_ntf(rtnl, name, dst_len, dst=None, deadline=10):
+    """Return the attrs of the first matching notification, None on timeout."""
+
+    for msg in rtnl.poll_ntf(duration=deadline):
+        if msg['name'] != name:
+            continue
+        attrs = msg['msg']
+        if attrs['rtm-dst-len'] != dst_len:
+            continue
+        if dst is not None and attrs.get('dst') != dst:
+            continue
+        return attrs
+    return None
+
+
+def _collect_route_ntfs(rtnl, name, want, deadline=10):
+    """Gather attrs of matching notifications, keyed by (dst_len, dst)."""
+
+    seen = {}
+    for msg in rtnl.poll_ntf(duration=deadline):
+        if msg['name'] != name:
+            continue
+        attrs = msg['msg']
+        key = (attrs['rtm-dst-len'], attrs.get('dst'))
+        if key in want:
+            seen[key] = attrs
+            if len(seen) == len(want):
+                break
+    return seen
+
+
+def _write_ipv6_sysctl(name, value):
+    with open(f"/proc/sys/net/ipv6/{name}", "w") as f:
+        f.write(f"{value}\n")
+
+
+def ipv6_route_del_reason_expired() -> None:
+    """An expired route reports RTA_DEL_REASON == expired."""
+
+    with NetNS() as ns:
+        rtnl = _rtnl_route_subscribe(ns)
+        with NetNSEnter(str(ns)):
+            _write_ipv6_sysctl("route/gc_interval", 2)
+        ip("link add name dummy1 type dummy", ns=str(ns))
+        ip("link set dev dummy1 up", ns=str(ns))
+        ip("-6 route add 2001:db8:2::/64 dev dummy1 expires 2", ns=str(ns))
+
+        attrs = _wait_route_ntf(rtnl, 'delroute-ntf', 64, '2001:db8:2::',
+                                deadline=15)
+        ksft_not_none(attrs, "no RTM_DELROUTE for the expired route")
+        if attrs is not None:
+            ksft_eq(attrs.get('del-reason'), 'expired')
+
+
+def _send_ra(sock, ifindex, lifetime, rio=None, pio=None):
+    """The kernel fills in the ICMPv6 checksum on raw ICMPv6 sockets."""
+
+    # type, code, cksum, hop limit, flags, router lifetime,
+    # reachable time, retrans timer
+    ra = struct.pack('!BBHBBHII', 134, 0, 0, 64, 0, lifetime, 0, 0)
+    if rio is not None:
+        prefix, plen, rio_lifetime = rio
+        # RFC 4191 route information option, /64 prefix (8 bytes)
+        ra += struct.pack('!BBBBI', 24, 2, plen, 0, rio_lifetime)
+        ra += socket.inet_pton(socket.AF_INET6, prefix)[:8]
+    if pio is not None:
+        prefix, plen, valid_lft = pio
+        # RFC 4861 prefix information option, on-link only (L set, A clear)
+        ra += struct.pack('!BBBBIII', 3, 4, plen, 0x80, valid_lft, 0, 0)
+        ra += socket.inet_pton(socket.AF_INET6, prefix)
+    sock.sendto(ra, ('ff02::1', 0, 0, ifindex))
+
+
+def _ra_router_sock(ns_r, ifname):
+    with NetNSEnter(str(ns_r)):
+        sock = socket.socket(socket.AF_INET6, socket.SOCK_RAW,
+                             socket.IPPROTO_ICMPV6)
+        sock.setsockopt(socket.IPPROTO_IPV6, socket.IPV6_MULTICAST_HOPS, 255)
+        return sock, socket.if_nametoindex(ifname)
+
+
+def _ra_advertise_routes(rtnl, sock, ifindex, want, **ra_opts):
+    """
+    Sending fails with EADDRNOTAVAIL until the router's link-local
+    address passes DAD, so retry.
+    """
+
+    seen = {}
+    for _ in range(10):
+        try:
+            _send_ra(sock, ifindex, **ra_opts)
+        except OSError:
+            time.sleep(0.2)
+            continue
+        seen.update(_collect_route_ntfs(rtnl, 'newroute-ntf',
+                                        want - set(seen.keys()), deadline=2))
+        if len(seen) == len(want):
+            break
+    return seen
+
+
+def ipv6_route_del_reason_ra_withdrawn() -> None:
+    """
+    Routes withdrawn by a zero-lifetime RA (router lifetime, RFC 4861
+    PIO, RFC 4191 RIO) report RTA_DEL_REASON == ra-withdrawn.
+    """
+
+    # (rtm-dst-len, dst); the default route carries no RTA_DST
+    routes = {(0, None), (64, '2001:db8:6::'), (64, '2001:db8:5::')}
+
+    with NetNS() as ns_h, NetNS() as ns_r:
+        ip(f"link add veth0 netns {ns_h} type veth peer name veth1 netns {ns_r}")
+        with NetNSEnter(str(ns_h)):
+            _write_ipv6_sysctl("conf/veth0/accept_ra", 2)
+            _write_ipv6_sysctl("conf/veth0/forwarding", 0)
+            try:
+                _write_ipv6_sysctl("conf/veth0/accept_ra_rt_info_max_plen", 64)
+            except FileNotFoundError:
+                raise KsftSkipEx("no CONFIG_IPV6_ROUTE_INFO")
+        with NetNSEnter(str(ns_r)):
+            # skip DAD so the router's link-local source is usable right away
+            _write_ipv6_sysctl("conf/veth1/accept_dad", 0)
+        ip("link set dev veth0 up", ns=str(ns_h))
+        ip("link set dev veth1 up", ns=str(ns_r))
+
+        rtnl = _rtnl_route_subscribe(ns_h)
+        sock, ifindex = _ra_router_sock(ns_r, "veth1")
+
+        seen = _ra_advertise_routes(rtnl, sock, ifindex, routes,
+                                    lifetime=1800,
+                                    rio=('2001:db8:5::', 64, 600),
+                                    pio=('2001:db8:6::', 64, 600))
+        ksft_eq(set(seen), routes, "not all RA routes were installed")
+        if set(seen) != routes:
+            return
+
+        _send_ra(sock, ifindex, 0, rio=('2001:db8:5::', 64, 0),
+                 pio=('2001:db8:6::', 64, 0))
+        seen = _collect_route_ntfs(rtnl, 'delroute-ntf', routes)
+        for key in routes:
+            attrs = seen.get(key)
+            ksft_not_none(attrs, f"no RTM_DELROUTE for {key}")
+            if attrs is not None:
+                ksft_eq(attrs.get('del-reason'), 'ra-withdrawn')
+
+
+def ipv6_route_del_reason_absent() -> None:
+    """
+    A deletion path that records no cause (here a userspace request)
+    must not carry RTA_DEL_REASON at all.
+    """
+
+    with NetNS() as ns:
+        rtnl = _rtnl_route_subscribe(ns)
+        ip("link add name dummy1 type dummy", ns=str(ns))
+        ip("link set dev dummy1 up", ns=str(ns))
+        ip("-6 route add 2001:db8:1::/64 dev dummy1", ns=str(ns))
+        ip("-6 route del 2001:db8:1::/64 dev dummy1", ns=str(ns))
+
+        attrs = _wait_route_ntf(rtnl, 'delroute-ntf', 64, '2001:db8:1::')
+        ksft_not_none(attrs, "no RTM_DELROUTE for 2001:db8:1::/64")
+        if attrs is not None:
+            ksft_not_in('del-reason', attrs,
+                        "user deletion must not carry del-reason")
+
+
 def main() -> None:
-    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, ipv4_devconf_notify])
+    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, ipv4_devconf_notify,
+              ipv6_route_del_reason_expired,
+              ipv6_route_del_reason_ra_withdrawn,
+              ipv6_route_del_reason_absent])
     ksft_exit()
 
 if __name__ == "__main__":
-- 
2.43.0


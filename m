Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CC933D4E1
	for <linux-kselftest@vger.kernel.org>; Sat, 25 Jul 2026 03:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949162; cv=none; b=ebQoT3fh5mbL4AZOIATVkjy8lkXMP+Egn6TlBf6RQhl1ET8Gswo9i4ZKsgSrE4q6DAs4cDmbzk4MyoclnWxpGWo39JxM1CMfw/FhEBtHYwi7BTdwnWvHyAwZk3yWBKJiPBI5BomUM7grf5Kaz3P8UaBXaBvHadpNEAw1kXphBPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949162; c=relaxed/simple;
	bh=O1CQFr8gL/tx0nZELxNaajoTVr4qy8kYNkp4eOn+3D8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQ7PukEBxz+ze089aUzic08hgZKmo1rb85ZU79chL6jQls3gj1itFAAvTAd00xMKnY8NJaBkD8cUdOJAiQtvhqmreyBEWJI81UO6SnOIRHyI14oBSzhJIDzQa7GTSB3j5cuc4UhuVtGd3X1kui5nB3I6Tl11xpndUhHdIJpDL4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLqIaOOV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLqIaOOV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cee9b74ee1so8958155ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 20:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949147; x=1785553947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IfEzsYijpMni+dHKVnbyAeGeNkrEFny9SRjpkXNKFps=;
        b=SLqIaOOVXM54iM4+ZkHWMs0M64hs65iSUgGjivBj9GuaWR3udAXOkam4rRtZIlEwSu
         gY43hxl8ke8hGBjAVBx9Z+jrh3SP8E/2cUyv2mxFYStTgJNU+0WGcSQ98kW0xbn1qlFR
         Aiz2Ezbl4WonAwxO9PzGe5zVcGe2i8FM1QhgnS74H/wAWW1c+8ipY2CAT1ACYrNmWJYs
         f4gkNrLskhpECZAddyk/0ihhRrQTX6AO9URqEzfDzB836q8C0tXAj62eZAgakhOr653o
         UqoUOCdY8lCKvOZt0an75JhWxirUWPfKZkdKN0UVLGIVhD/uG7HsW36sN3jDFn39+QkF
         C7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949147; x=1785553947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IfEzsYijpMni+dHKVnbyAeGeNkrEFny9SRjpkXNKFps=;
        b=iPDSuDj/4DIEKRLEGJbHgY0YIVbnaKQzpQuzcuBSXdumUx3wUn5nJQOEw07YdA4UJy
         17WTfuyVm8HBy9B3zdvfFC8aaHLCEmvz58Q89VOdOabWHDttKEOIv+8ZddclRHbztYaY
         slgv+wGdXUVITCR5gK6mtJCpgnLIaer5t7vliy5QcVamsq9dufu2SA0A7/rneXr/+sW9
         BhPMymjD/50T6RYBz4mhbifsq62x1O0fEBuBtzTWXhChHY3GSv6TGeDLEqgvcfqjzHhO
         sZMP09TPhnFmcm6fgNWeluoTgxBVqLG5xYpNqu1p5sfRwIBlp3SbErWJwyHo07uKyF3u
         tTbw==
X-Forwarded-Encrypted: i=1; AHgh+RoSXumboFt2bv9sPCjOJuwCYWh3hggnOtyuAjhQ52/X6QP0ryWzCEa4Ip2lAzdewW7oGlW8H1nEby+peBYgAmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/VzfJ/WC9hvO3u0crTiGlHmL6cB81/GDhkf4zyplmfNx+vqc
	lBsSUHOlUNt0LJEgg7nNCnl39FbFibPtMxiDYZJF3Eg1zMB1PnxvXEta
X-Gm-Gg: AR+sD11EHOId9QLbszfksel8IWNiecgsQBlPaQp4QtNzq+7x4dAMHiLg3835l0DA1E8
	+FKKQYScX/fspPY4OT+4WF64svk2Yre5FO5AVvVZi0i6M3BZ4YB7VuNvOz5/nYSt0MmVAU/AbHd
	Fsg8m3oZ/QR5TiIxD/6qtwh2VwE2FiXS34cA3+YiF7FZ92WqHwEJsdEXco2XdS7b4DWxr3GyegC
	poSdHLZ8T4Lz4a65Z3RY9quX+3zk5Q5ZgGulB28KU7bYtpd1mMqDWY81ZI2W2e4gqDRLCIgbgb9
	suZdZbo8/oiFMATBEG0g89Ohp5JlyOJ1XvfKFTu92/1t6EjYN9ryE3ywbkI6/6NANIB1CM6aMmy
	SSrQGiYpvWMqtJrpiL/CNe+ChmAqj/q0hNRxRLpncikBntktQcYx02G8unKi6a1U4E1jJQ+7PC7
	x2dZvMLj0JUHSLXzCOMp+gFzLx9lH17u0+bF4hDoEyvsmIxrO+tfDCQ5Ca2sthEobk
X-Received: by 2002:a17:903:3887:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2cfde7b6eb0mr8895075ad.17.1784949147297;
        Fri, 24 Jul 2026 20:12:27 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:a005:2f41:ab3d:c011])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e26e9sm3610265ad.23.2026.07.24.20.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:12:26 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	David Ahern <dsahern@kernel.org>,
	David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Gal Pressman <gal@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 2/2] selftests: net: verify RTA_DEL_REASON on route deletion
Date: Sat, 25 Jul 2026 12:12:14 +0900
Message-ID: <20260725031214.43059-3-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725031214.43059-1-sigefriedhyy@gmail.com>
References: <20260725031214.43059-1-sigefriedhyy@gmail.com>
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


Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2054F93AE;
	Fri, 18 Sep 2026 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.136.29.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745758; cv=none; b=gUxMNNQysMOoiKeOSOaCaDTFriZV5SpyajyIyNZPPHoC1hyx2L6XkIbweIjbGZEE9LaWxeGU1V5CcPACNHQgeu9+Z9Iv1CMAHmcMm+IPI35hjSWa4r1Ujm1Bm278mTRbkIBL4CyeAsBu+DwVe72b0vRdbBFtZA6xq/yekGiuDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745758; c=relaxed/simple;
	bh=cpIBgXULYb03HMA48vKKBNv/NqLBKIiN2QOCfiRgYDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXmEGnASyIXlrM1I/cklgvWiLBjcKswy6Zcb+OHMTbwmczolV4INn+B+MG61e/PUAb75VXV3Sovbo5Th0Ih+VAUX6LNuVgPF3wzJ38oQg7gG9gyenWBLQXf5itGL7T0HbWw3MXZG/s/pCQqp/1+5tkX+C3qOqTm1vn7lkjKdhD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com; spf=pass smtp.mailfrom=proxmox.com; arc=none smtp.client-ip=94.136.29.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 5E0564772C;
	Fri, 18 Sep 2026 17:35:53 +0200 (CEST)
From: Gabriel Goller <g.goller@proxmox.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 2/2] selftests: seg6: check extack messages on SRv6 lwtunnel setup
Date: Fri, 18 Sep 2026 17:35:16 +0200
Message-ID: <20260918153544.1178884-3-g.goller@proxmox.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918153544.1178884-1-g.goller@proxmox.com>
References: <20260918153544.1178884-1-g.goller@proxmox.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1789745751870

Add a ksft/ynl test that shoves invalid RTA_ENCAP payloads to
RTM_NEWROUTE and asserts both the errno and the extack message are
correct.Also verify that the rejected route was not installed.

Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/srv6_iptunnel_extack.py     | 168 ++++++++++++++++++
 2 files changed, 169 insertions(+)
 create mode 100755 tools/testing/selftests/net/srv6_iptunnel_extack.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 3ee3378f8b26..45639f46b003 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -101,6 +101,7 @@ TEST_PROGS := \
 	srv6_hencap_red_l3vpn_test.sh \
 	srv6_hl2encap_red_l2vpn_test.sh \
 	srv6_iptunnel_cache.sh \
+	srv6_iptunnel_extack.py \
 	stress_reuseport_listen.sh \
 	tcp_ecmp_failover.sh \
 	tcp_fastopen_backup_key.sh \
diff --git a/tools/testing/selftests/net/srv6_iptunnel_extack.py b/tools/testing/selftests/net/srv6_iptunnel_extack.py
new file mode 100755
index 000000000000..77e708a08c3e
--- /dev/null
+++ b/tools/testing/selftests/net/srv6_iptunnel_extack.py
@@ -0,0 +1,168 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# author: Gabriel Goller <g.goller@proxmox.com>
+
+"""Exercise SRv6 tunnel validation with invalid netlink attributes."""
+
+import errno
+import os
+import socket
+import struct
+from contextlib import contextmanager
+
+from lib.py import KsftNamedVariant, KsftSkipEx, Netlink, NetNS, NetNSEnter
+from lib.py import NlError, RtnlRouteFamily, ip, ksft_eq, ksft_exit, ksft_raises
+from lib.py import ksft_run, ksft_variants
+
+
+LWTUNNEL_ENCAP_SEG6 = 5
+SEG6_IPTUNNEL_SRH = 1
+SEG6_IPTUNNEL_SRC = 2
+SEG6_IPTUNNEL_TABLE = 3
+SEG6_IPTUN_MODE_INLINE = 0
+SEG6_IPTUN_MODE_ENCAP = 1
+SEG6_IPTUN_MODE_L2ENCAP = 2
+SEG6_IPTUN_MODE_ENCAP_RED = 3
+SEG6_IPTUN_MODE_L2ENCAP_RED = 4
+
+
+def encap(mode=SEG6_IPTUN_MODE_ENCAP, hdrlen=2, routing_type=4):
+    # seg6_iptunnel_encap followed by an SRH containing one segment.
+    srh = struct.pack('!BBBBBBH', 0, hdrlen, routing_type, 0, 0, 0, 0)
+    srh += socket.inet_pton(socket.AF_INET6, '2001:db8::1')
+    return struct.pack('=i', mode) + srh
+
+
+def nlattr(attr_type, payload):
+    length = 4 + len(payload)
+    return (struct.pack('=HH', length, attr_type) + payload +
+            bytes(-length % 4))
+
+
+def route(family, oif, payload, tunsrc=None, table=None):
+    attrs = b''
+    if payload is not None:
+        attrs += nlattr(SEG6_IPTUNNEL_SRH, payload)
+    if tunsrc is not None:
+        attrs += nlattr(SEG6_IPTUNNEL_SRC,
+                        socket.inet_pton(socket.AF_INET6, tunsrc))
+    if table is not None:
+        attrs += nlattr(SEG6_IPTUNNEL_TABLE, struct.pack('=I', table))
+
+    return {
+        'rtm-family': family,
+        'rtm-dst-len': 32 if family == socket.AF_INET else 128,
+        'rtm-table': 254,
+        'rtm-protocol': 4,  # RTPROT_STATIC
+        'rtm-type': 1,  # RTN_UNICAST
+        'dst': '192.0.2.1' if family == socket.AF_INET else '2001:db8:1::1',
+        'oif': oif,
+        'encap-type': LWTUNNEL_ENCAP_SEG6,
+        'encap': attrs,
+    }
+
+
+def add_route(rtnl, attrs):
+    rtnl.newroute(attrs.copy(),
+                  flags=[Netlink.NLM_F_CREATE, Netlink.NLM_F_EXCL])
+
+
+def matching_routes(rtnl, attrs):
+    routes = rtnl.getroute({'rtm-family': attrs['rtm-family']}, dump=True)
+    return [entry for entry in routes
+            if entry.get('dst') == attrs['dst'] and
+            entry['rtm-table'] == attrs['rtm-table']]
+
+
+@contextmanager
+def setup():
+    if os.geteuid() != 0:
+        raise KsftSkipEx('Root privileges are required')
+
+    with NetNS() as ns, NetNSEnter(str(ns)):
+        ip('link set lo up')
+        oif = socket.if_nametoindex('lo')
+        rtnl = RtnlRouteFamily()
+        try:
+            # Probe with a valid route so missing SRv6 support is a skip,
+            # whereas missing diagnostics remain a test failure.
+            probe = route(socket.AF_INET6, oif, encap())
+            try:
+                add_route(rtnl, probe)
+            except NlError as error:
+                if error.error == errno.EOPNOTSUPP:
+                    raise KsftSkipEx('SRv6 tunnels are not supported') from error
+                raise
+            rtnl.delroute(probe.copy())
+            yield rtnl, oif
+        finally:
+            rtnl.close()
+
+
+# (name, SRH payload, extra encap attributes, expected extack message)
+INVALID = [
+    ('missing_srh', None, {}, 'missing SRv6 SRH attribute'),
+    ('empty_srh', b'', {}, 'truncated SRv6 SRH attribute'),
+    ('short_srh', encap()[:-1], {}, 'truncated SRv6 SRH attribute'),
+    ('invalid_mode', encap(mode=255), {}, 'invalid SRv6 encapsulation mode'),
+    ('invalid_type', encap(routing_type=0), {},
+     'invalid SRv6 segment routing header'),
+    ('invalid_length', encap(hdrlen=4), {},
+     'invalid SRv6 segment routing header'),
+    ('invalid_tunsrc', encap(), {'tunsrc': '::'}, 'invalid tunsrc address'),
+    ('invalid_table', encap(), {'table': 0}, 'invalid lookup table'),
+]
+
+
+@ksft_variants([
+    KsftNamedVariant(f'{name}_{af_name}', family, payload, extra, message)
+    for name, payload, extra, message in INVALID
+    for af_name, family in [('ipv4', socket.AF_INET), ('ipv6', socket.AF_INET6)]
+] + [KsftNamedVariant('inline_ipv4', socket.AF_INET,
+                      encap(mode=SEG6_IPTUN_MODE_INLINE), {},
+                      'inline mode requires an IPv6 route'),
+     # Inline mode rejects a non-IPv6 route before it looks at tunsrc,
+     # so only IPv6 reaches the tunsrc check.
+     KsftNamedVariant('inline_tunsrc_ipv6', socket.AF_INET6,
+                      encap(mode=SEG6_IPTUN_MODE_INLINE),
+                      {'tunsrc': '2001:db8::2'},
+                      'incompatible mode for tunsrc')])
+def invalid_config(family, payload, extra, message):
+    with setup() as (rtnl, oif):
+        attrs = route(family, oif, payload, **extra)
+        with ksft_raises(NlError) as caught:
+            add_route(rtnl, attrs)
+        ksft_eq(matching_routes(rtnl, attrs), [], 'Rejected route was installed')
+        if caught.exception is None:
+            return
+        ksft_eq(caught.exception.error, errno.EINVAL)
+        ksft_eq((caught.exception.nl_msg.extack or {}).get('msg'), message)
+
+
+@ksft_variants([
+    KsftNamedVariant(f'{name}_{af_name}', family, mode)
+    for name, mode in [('inline', SEG6_IPTUN_MODE_INLINE),
+                       ('encap', SEG6_IPTUN_MODE_ENCAP),
+                       ('l2encap', SEG6_IPTUN_MODE_L2ENCAP),
+                       ('encap_red', SEG6_IPTUN_MODE_ENCAP_RED),
+                       ('l2encap_red', SEG6_IPTUN_MODE_L2ENCAP_RED)]
+    for af_name, family in [('ipv4', socket.AF_INET), ('ipv6', socket.AF_INET6)]
+    if mode != SEG6_IPTUN_MODE_INLINE or family == socket.AF_INET6
+])
+def valid_config(family, mode):
+    with setup() as (rtnl, oif):
+        attrs = route(family, oif, encap(mode=mode))
+        add_route(rtnl, attrs)
+        routes = matching_routes(rtnl, attrs)
+        ksft_eq(len(routes), 1)
+        if routes:
+            ksft_eq(routes[0].get('encap-type'), LWTUNNEL_ENCAP_SEG6)
+            ksft_eq(routes[0].get('encap'), attrs['encap'])
+            rtnl.delroute(attrs.copy())
+            ksft_eq(matching_routes(rtnl, attrs), [])
+
+
+if __name__ == '__main__':
+    ksft_run([invalid_config, valid_config])
+    ksft_exit()
-- 
2.47.3



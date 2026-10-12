Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92501E51E0
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 01:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791767876; cv=none; b=t/ySpYfYPUafYuZS1aj1l9ga3fk8kGjESxoxEDS3mnNiO4CUbaFQjjiSapdXUb033AMrbnNfITizvTIUJPe6QS+UXZa2dRTgq6MpoHR7rVk3o2PRqUs6nppr1lwv0iwO0n2L7kd3wSchnjz29gCOCRb7a6XoPPleewXF2CLgOiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791767876; c=relaxed/simple;
	bh=6I9/o2fsb95RZ/cdcrjocTXvh86feiHHlbzI4OFSZMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuEd2IHrP3ccwHK8Ep1TpIwdyJ86cPZTuYSjt9XmK7/nOc0UlVm5s/v7W1iiMGc2QGQ0Msvh21VE8TnHD4wtUrl2Dr8RYyKBUbQGw9L2hg50JplVdne/3i8L5HACyZJXBVES4Ead2FHTm2PatJ5RXtyAC4HU8VF0HIovKOeUlRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KygHaENb; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KygHaENb"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso801591a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 18:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791767873; x=1792372673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tVHCGk2Xwqu+yf2mIq4Pai4+4x8BJRwBsQH1o/snK8=;
        b=KygHaENb2fxkCWmR9OsxI/hUXRS91DrD7vgPECd+1Xzf3rvB1DQYwTXhRWtc3fyIpO
         fvHw6dJ/peyFQt/xTyAdlbIbdd+ekW4r2+LQNhoQNA66QgyrINczMJpitY8gHcK2H4T7
         cVZ7UaSXDBNjWP/QpTuA0KdhWZOYwN0IdXnaw+WRlakuplgXdsCpHA/LbQzoqwVznnVR
         xqT4Xn/MLz/+1Y30Yax9R5j3uH/BNASk+3688Wsg+GfwdBAqNHMowsPFbmSX0KCN8HEr
         qr3ZaO54bcfkVszVaiiyFDeXXT9mwPGvKpMjjnfzTwes9oPBu6tk4ATvmQqzMF2L6pfJ
         6IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791767873; x=1792372673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tVHCGk2Xwqu+yf2mIq4Pai4+4x8BJRwBsQH1o/snK8=;
        b=tcwL4nfD9bOHLQCxGCEhIbNJfNgPZB+izIPLr/MUf5AwqCPidXZ0Jr4/fSnUXFF0Iw
         j4hKvroVMdyO5q7o5JkNNWKgg+mzKu9AwVfiXeMjqgfmwkr1LyeEhI/+LJ30BGfnAq0G
         LLVh/72wGHFtND+8qfcFy4eoa+L3db2nOy8+VQE8Lc+B032anHopw6flRkh7n41B8HNs
         KRVW4bqxXfelk1inU8s8gODpK/j1dORhMx0Lwrato/pPqxVeA4k4o58zyX76h/oQugva
         WmYZ7j5OsgpijSQHEhFtPonrV8J8SDZftr6r5FmGAz7ORO3XmMtE5Uia5uoCL4hQsfs7
         0LRw==
X-Forwarded-Encrypted: i=1; AKwUvBx1JPbuqBM6qQDAER22PWlPInKSlLFbLWdjhoSETIfzKSgYgzp9GppRQNZ7K8d2/FJUPax96A3rcAJj9wR8IXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVoLAH7j28HmAD+m6P7+ukZRkGqG2UMqNce5UCKYycCaRy7YqR
	BlDX+8YxSzmqLxUob1jObZBjm1e+AyOtmTTacaLGEUrCIl1U9NNi8Yoy
X-Gm-Gg: AYBFou2b9nv3sfEuCJcP/HVy+61tLMwwW8EZMjFPNzRi+z0d0Etcyp4Pp9ZU4ybeeYb
	r0sR8bQ0SGinTNbOnzGD7gbkZyYbsw3pXLw+Z/Jxyy8NHwWD1H2FtUIzc1f8IEkFE1G+9EMmF5G
	C9TPd30zf9FcSVy6b8X1FAtNmh4tB7JQwFc8/IgZ+uKxsfJGpLWNN3SxxKHSb6dXfZMkULkbGNf
	eRw3sj1XvYNxvvS+1rgM48sggK0XwWcbhNqIYJpassFboxyIyi1OMbWNWlMYdIPuVwn97T6pLds
	4dVGph3kpYUjm2ZPki3+DWqn3PgPnqEagRTjm+UNpWu9wdjEiAX6GqES9MLeQCARIdbidjPmQoS
	cGB9kxf/+NJ5mITy4qaTEoAQtDjxhfwZ3AunJn7s1G54NvVxS4TzKq1sOBXxwUj4BARxmpNXvWP
	JYsYJNmA/g0gvvcas/wp82uqnmx6CJjRxOu2uXFIU0nhKBhmq1XUMbl6HKEfjHl0LqOqK44Lb4n
	UrDutDAYiEtNzOrr8V07miwRARlVdv8G58g56Ef6bbKq0aoBRrNxFKY8m8nnC8h2Uz6WOlr5xPq
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr5759375a91.12.1791767872977;
        Sun, 11 Oct 2026 18:17:52 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm13743307a91.8.2026.10.11.18.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 18:17:52 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kees Cook <kees@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v11 6/6] selftests: net: test AF_PACKET multicast dumps
Date: Mon, 12 Oct 2026 10:17:07 +0900
Message-ID: <20261012011707.3378-7-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012011707.3378-1-sigefriedhyy@gmail.com>
References: <20261012011707.3378-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dump the link-layer multicast addresses of a dummy device and verify
that ifa_index restricts the dump to that device, that the all-hosts
address joined on link up is listed without IFA_F_GLOBAL, that an
address added with SIOCADDMULTI is listed with IFA_F_GLOBAL and
IFA_MC_USERS, and that IFA_TARGET_NETNSID dumps another netns.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 tools/testing/selftests/net/rtnetlink.py | 73 +++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
index dc8c77db48974..5534ade056a5c 100755
--- a/tools/testing/selftests/net/rtnetlink.py
+++ b/tools/testing/selftests/net/rtnetlink.py
@@ -5,13 +5,18 @@ import socket
 import struct
 import time
 from lib.py import bkg, ip, ksft_exit, ksft_run, ksft_eq, ksft_ge, ksft_true, KsftSkipEx
-from lib.py import ksft_not_in, ksft_not_none
+from lib.py import ksft_in, ksft_not_in, ksft_not_none
 from lib.py import CmdExitFailure, NetNS, NetNSEnter, RtnlAddrFamily, RtnlRouteFamily
 from lib.py import defer
 
 IPV4_ALL_HOSTS_MULTICAST = b'\xe0\x00\x00\x01'
 IPV4_TEST_MULTICAST = b'\xef\x01\x01\x01'
 IPV6_TEST_MULTICAST = bytes.fromhex('ff020000000000000000000000000123')
+ETH_ALL_HOSTS_MULTICAST = bytes.fromhex('01005e000001')
+ETH_TEST_MULTICAST_STR = '01:00:5e:01:01:01'
+ETH_TEST_MULTICAST = bytes.fromhex(ETH_TEST_MULTICAST_STR.replace(':', ''))
+ETH_PEER_MULTICAST_STR = '01:00:5e:02:02:02'
+ETH_PEER_MULTICAST = bytes.fromhex(ETH_PEER_MULTICAST_STR.replace(':', ''))
 
 
 def _users_for(rtnl: RtnlAddrFamily, family: int, grp: bytes, ifindex: int):
@@ -105,6 +110,69 @@ def dump_mcaddr6_check() -> None:
                 s2.close()
 
 
+def dump_mcaddr_l2_check() -> None:
+    """
+    Verify link-layer multicast addresses in an AF_PACKET RTM_GETMULTICAST
+    dump: the ifa-index filter, mc-users, the global flag and
+    target-netnsid.
+    """
+
+    with NetNS() as ns, NetNSEnter(str(ns)):
+        for ifname in ("dummy1", "dummy2"):
+            ip(f"link add name {ifname} type dummy")
+            ip(f"link set {ifname} up")
+        dev_idx = socket.if_nametoindex("dummy1")
+        ip(f"maddr add {ETH_TEST_MULTICAST_STR} dev dummy1")
+
+        rtnl = RtnlAddrFamily()
+        defer(rtnl.close)
+        addresses = rtnl.getmulticast(
+            {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx},
+            dump=True)
+
+        # dummy2 has entries as well, only dummy1 may be listed
+        ksft_eq({addr['ifa-index'] for addr in addresses}, {dev_idx},
+                "AF_PACKET multicast dump ignored ifa-index filter")
+
+        entries = {addr['multicast']: addr for addr in addresses}
+
+        # Bringing an Ethernet device up joins 224.0.0.1, which maps
+        # to 01:00:5e:00:00:01 in the device multicast list.
+        all_hosts = entries.get(ETH_ALL_HOSTS_MULTICAST)
+        ksft_not_none(all_hosts,
+                      "dummy1 does not have the all-hosts link-layer address")
+        if all_hosts is not None:
+            ksft_not_in('global', all_hosts['flags'],
+                        "protocol entry is global")
+
+        static = entries.get(ETH_TEST_MULTICAST)
+        ksft_not_none(static, "dummy1 does not have the SIOCADDMULTI address")
+        if static is not None:
+            ksft_eq(static['mc-users'], 1,
+                    "unexpected mc-users for the SIOCADDMULTI address")
+            ksft_in('global', static['flags'],
+                    "SIOCADDMULTI entry is not global")
+
+        # target-netnsid dumps another netns, ifa-index is relative to it
+        with NetNS() as peer:
+            ip(f"netns set {peer} 5")
+            ip("link add name dummy3 type dummy", ns=peer)
+            ip("link set dummy3 up", ns=peer)
+            ip(f"maddr add {ETH_PEER_MULTICAST_STR} dev dummy3", ns=peer)
+            peer_idx = ip("link show dummy3", json=True, ns=peer)[0]['ifindex']
+
+            addresses = rtnl.getmulticast(
+                {"ifa-family": socket.AF_PACKET, "target-netnsid": 5,
+                 "ifa-index": peer_idx}, dump=True)
+            ksft_eq({(addr['ifa-index'], addr['target-netnsid'])
+                     for addr in addresses}, {(peer_idx, 5)},
+                    "target-netnsid did not dump the peer netns")
+            # dummy1 in this netns can have the same ifindex as dummy3
+            ksft_in(ETH_PEER_MULTICAST,
+                    {addr['multicast'] for addr in addresses},
+                    "target-netnsid did not dump the peer device")
+
+
 def ipv4_devconf_notify() -> None:
     """
     Configure an interface and set ipv4-devconf values through netlink
@@ -424,7 +492,8 @@ def ipv6_verify_inter_scope_addr_order() -> None:
 
 
 def main() -> None:
-    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, ipv4_devconf_notify,
+    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, dump_mcaddr_l2_check,
+              ipv4_devconf_notify,
               ipv6_route_del_reason_expired,
               ipv6_route_del_reason_ra_withdrawn,
               ipv6_route_del_reason_absent,
-- 
2.43.0


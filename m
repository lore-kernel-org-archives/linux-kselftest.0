Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDCE254B03
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 00:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468720; cv=none; b=fbn5F3K3LCt19cHWtQ4O6q8qCPN8kak63hTb+BUL3ZMf/I3jHR6aJyv3P+GdOHFnVQAfJux1ssGyajnMnv7Ra65HrT3Kt4YDlz+UJfsgrnMHR7jCOBGSEStcjmTIJNv6h8Fdke128+rKEDFA9OEOrsg+xmfO0p7wO0jYp/SDYwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468720; c=relaxed/simple;
	bh=AIe0tVI2MDMU+wAUIOGkfF/prRfDfU5eGXTYlmKrHJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dcYIxISxNUgZyHPFoHAZRxwj+wGRx/7wgW/wbErYtXjLkJthixNbuseOS/AcAuh23TYLuWeXQHdK5vnLKcN0dHKDUY2XNU3EIDzkowQ3M/KG6QnnXPg1tmwDRDgb0gBXKM6XVdPJOIwi+CuwcTCYKfCTDfW+aqjqOPk8AJcB/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgGzvNGh; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgGzvNGh"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc79223bcfbso944083a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 17:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468717; x=1791073517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZghyl21slJP0T9zWNT6FTVcuW3rARquNgkyu57N/4I=;
        b=DgGzvNGh74+hkd/2R1ppAw2hBKnkqM1ySNT0ubNHfvmtSH8XS7Ww4uzNM4KbOFlbKU
         JS2gI2TDYJvvwlHs8dli/Rg7JJBKQLgCshdQZeI3j4jQmWyugZ+UHpw/u+kBNcMcIqxv
         Y1lY+R71tAA6UraRyvFIJQvTqe9BPmZUd2TsdYx4+oHq/v/KMTUXxF7ZPDLyMNhAHUvB
         Hmzf+f3UfSEMuQ4bmqm9hwtI/OyCSsgyzDjTojTdRaxXA6TIoMS7BX9gDHXPMsQxm2cK
         McJBMvnvd8WFB1GV82q/8SDrex9ukP1iak/GeZR2LG1IgDftgjBnu0ezZUWtf6CnvvPs
         c1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468717; x=1791073517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZghyl21slJP0T9zWNT6FTVcuW3rARquNgkyu57N/4I=;
        b=uEbmaCzapOje3XScQfrn4rpymIOxH9oM+U/Ph0wkXmcwVNc6R9vY08Iq9rJSOVFuIa
         cvfkmiGGRscEdOFD2UWZsEBs2g7hx615+K5WOcrDZdoVKcULQqNeuMrrPFUDm3sK3EdH
         2eEr6IO4e/bK6aPU1SqE3IOG6ii8sW8HUoHKpd/txadq35BBq70xJJrPYZjtRf79wmcM
         tKHjRXtfWT+VFgPImoDO1ABqGSRTSVhm95zecpsViaOIf0SbArEummsRali70TZNSr63
         +aWXv3rUChXuhe1XdPCvF+OfikqLXNW6xvbyX5RYPTemU8WWy4OgTbyiTfFD3EH+mXzF
         2Umg==
X-Forwarded-Encrypted: i=1; AKwUvByerGdSUmgvbawXrppAD7Aa+VMR+A26MDVScPs+8ChTwEyJ4PeebUclkxVYNkmwGj2nfYFtY+7hUEQKGVqYSRY=@vger.kernel.org
X-Gm-Message-State: AFuF++lX70fQehd2gyADw90Y9wZ3nYL/IA8bgiU6ujrt3ubUZCrZ3h11
	yCjv35aSvnenG6uZMj9Kf50Wzd0oDrI1PjlNL5hR/8T51d6iy5rY6XjW
X-Gm-Gg: AYBFou0qZm9Jc2+GOykqHz1vOQZ4hp4rkoG8+HMJ3VEZnKv+V7mx/i4tkyP+M/3QOWq
	X15o47TWiVf0NVPFSIJgCUo23+9LJprpPF63XxYkdGeEdpZMpJnfy0zbtdUt/lr6P5VU/1NjDC/
	oW8wT5hhIChyStw4exMSa9yzRrb70xsocpjiVnRehBa267BdH9VXAbKfbVmysYaRccx98Ic1Cb9
	6W4ZM6pVuzWl430yvRwhxsdPG/sjuUugvxT5VHjvyT9yJFyh+p/VW/9qqyRNnoWZm3uyGvUcDY7
	0zIcG7va5gx+JO1BCrwa/AyBa2D5UB3vtm6naO9Iu2adLzMhhU659hsRuMrOhMMtxp9sFiNay5J
	Whk9lffzaRPQ8BlmjQVfW1E+sbPUID8lqLKI3vjawPJlDhj5M4tCASVnvTUSF6J+qWP98VYQN9u
	O2ldtMewsg9kCslG+7gcJ/3Duo3nDXbYvJJrKTBiO8K1lUQIAxD35ZQEAoKDIOLlW9JZx1T4j5U
	ES902ENYhw28IW0uVe4J6uSvpr17hBg2eADx3mpAnnu0bnTfbYgeCply49pXqbbO/v4HQE=
X-Received: by 2002:a05:6a20:6f8f:b0:3dd:85a8:cb7d with SMTP id adf61e73a8af0-3de0e78b15emr9330708637.32.1790468716805;
        Sat, 26 Sep 2026 17:25:16 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:78b6:7bf6:b1de:12ef])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c680sm2698224a12.16.2026.09.26.17.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:25:16 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v8 5/5] selftests: net: test AF_PACKET multicast dumps
Date: Sun, 27 Sep 2026 09:24:27 +0900
Message-ID: <20260927002427.4519-6-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927002427.4519-1-sigefriedhyy@gmail.com>
References: <20260927002427.4519-1-sigefriedhyy@gmail.com>
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
index dc8c77db4897..5534ade056a5 100755
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


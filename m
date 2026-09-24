Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7172F83A2
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 01:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212585; cv=none; b=efgkMQ4nBplMpMKnC6RFTxJaOYfImZO9vaTCiSbEImp1Xr5k1AfCGGR9G+Ym0NasHYGSrxIxEp1acAtBqUWqQMconkP0Lkhl5kCjQV55hTAPXByaHMAejo0jwwc4vvBW0l/g4McOIqrEdrf1xjfIkMvnmLr9GV/AbtbjlyLLmrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212585; c=relaxed/simple;
	bh=AIe0tVI2MDMU+wAUIOGkfF/prRfDfU5eGXTYlmKrHJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFNY78em6ySM0mr3cHoSGl10jhgkNevEQq7Uxf3Y34sVWbF+/rlVFvJPNMZnE5S3O8mnd1rws9tDzuW24TT86A313z1E/FpFiLyZv+olPnmotuaQBXynUUChC3R39CdrBe+MVr63dHWAkiywZoTIYCyUQqowJlXlQNA6RHAhfPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMO/C/4A; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMO/C/4A"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so785774a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 18:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790212583; x=1790817383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZghyl21slJP0T9zWNT6FTVcuW3rARquNgkyu57N/4I=;
        b=jMO/C/4Ag54kS56ov/JxQII15shS7hI3JW+cRl5jMqc2FTSbKGxRGmYGI2RqqL+rnc
         aA/TtiTooe1H01Qd12R11+Kiuz2tXPBWwMNChmV0WJdVDocVP5bEzqBPIN9XR1aNKYbo
         1IwRipVi0qkXjfTeKP2UvsDusFiDv3CBnJjkmHrPZwfueDp6wGpD841oMouBprFJqaz/
         B7B6c1Wf7lDysWbbwqZsJ5byQ0eyaN6uwD6saxPkafITvbL7L3bzcFlmlcjWMhE9p3q2
         EgqxXRALo8BWsuS/gCtXMNB5NxuRnXZV6HGNushwBz53hOCWKi/XT/lYjfeL/zcEYkRk
         wLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790212583; x=1790817383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZghyl21slJP0T9zWNT6FTVcuW3rARquNgkyu57N/4I=;
        b=ABszK7IX+FsALDZ0MDVOT0RwvJVzIs+iHnZXrMngAMyWgS4uARgx47OQR255GvEGiU
         z9qt+6IQkieQ5wCR7CAyp2iYrfTVLTYiRDRSagWT5mosyuXGAPbORNzX1PXuaqw5UfkT
         qmj0R+el1md0UQv8saKSILF4AYOTGFZ9n2p9XQ4WK4NyL/gykREA4W+n6YYLKSjzEzr4
         7ZIUb0nwbLb/fPIN4loAuthm3tnfjL7jr4z7O13Sbkl2JyQcJcL4jQZTFNUaygya9O0V
         T1+lDWs/JG2raqmPNJMjj5MQQvWcKM1JV4u8RGvncUd8hYvevAPqMaJLaIQlyR5l8juK
         76og==
X-Forwarded-Encrypted: i=1; AKwUvBxZApvkP5H0Wn5jiY3VHc6CEOv5jwSYhLvHWYuEoickvFxFMNfkuDrKfD52PSigIReHbXfjZ3LXOEZKbemkt64=@vger.kernel.org
X-Gm-Message-State: AFuF++kN5qwGQvmZ+Tm8bvNeM81w+iyYwDZVbnqdZfQaNHc1rS+UpT/I
	IwJ2Arp7+D7Ay3j556H6S4cbaFUtrckRfUh1M5IY8COaWz+jmojJNQdk
X-Gm-Gg: AYBFou3SfDIFQprkGbvbgTPuBL5Euu7WTRxXGpYXStTGu88D4f2gE4ABYshkAhELxGQ
	yJSJJMIbmNqSJ4sziQ2G0VWjdva61pvMVBMqt/QTfc6V+rVtONVeuO+Oi3SG30iXvtrO532md+3
	f4N2AffwuyXFOEWbXbFBI1mNRShQrWx0LWr6CccWGzRElpUmuRWoxalgSw3xV+iTK9R7+UN2ouf
	exiaDkkIPvY1Hgarei+21Yt00CnquTWyqHg1xZ5Q6RyIe14stE6znEt9E0L2knlGDGV1W/fgaf4
	fZyR0nMYPJM5MNwlY774QlNZNLSWyyJUiWGfQc6O+QZhPK5e2ZHVpglQX9ObLq6SpSxR+1KNgEj
	UhBgrlK+VzFyuW1IbljybiWGlesFm04zgUoCueITlww2BmDOdNKr9w3+aFV6RtDLeV6m4LfjaSv
	Q4GhqSqabVQu+VYPIRdm8NLZkoN5V2AbN2A7/e4daDJVxpRFsHSb2gkwcK3pzl2nglcZe4FmpcM
	iDxd7r6hAeKP0/PyD28HmkkS8LOg67IILWN4McPU/KHBelIUeocfLbpqWLrgikAZKK+auY/itQZ
	LmKaBOU6NWU=
X-Received: by 2002:a17:90b:440b:b0:39e:6c69:34d4 with SMTP id 98e67ed59e1d1-3a098e888c9mr768925a91.56.1790212582839;
        Wed, 23 Sep 2026 18:16:22 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d5794sm1741392a12.14.2026.09.23.18.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:16:22 -0700 (PDT)
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
Subject: [PATCH net-next v7 5/5] selftests: net: test AF_PACKET multicast dumps
Date: Thu, 24 Sep 2026 10:15:54 +0900
Message-ID: <20260924011554.3494-6-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924011554.3494-1-sigefriedhyy@gmail.com>
References: <20260924011554.3494-1-sigefriedhyy@gmail.com>
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


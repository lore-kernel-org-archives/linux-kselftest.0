Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE76440638
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123896; cv=none; b=LYZD/jS7XTHH1JsK997yZxuel76KfvdWHq7DRUq1vA5u4xvOz3dxrwHQrxhHMWLcN9UoFmnbpCtLE1WWpksdDgLOBqmFcnhbpmbGoSk3jkhSTB1RAPuCceF8WDyG/87/fGnAZU7x0iW1OFdYeCeNz4rKiIv8mG4aXSwBhF94WqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123896; c=relaxed/simple;
	bh=ZU59QORF8aEFGb/GLYQdk3XUMzkHjqCLpILtgCX8z2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AfhejGNcCzzF5Los9WM6JvK2dzSIpvLyZd7yB/fSVMWzkQUO9eZ+Chjyic8fs+NSbNIujqrGpkYIyF3hQioT2BBLrloJioxsaw8ViDDBhU47Eqp4zlcULh9TD/Md+mRZysFyvGewc7btfhW22nDmYv/+9f/JA0qFemBRm7jsPio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMkkw5zk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMkkw5zk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so750630a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789123892; x=1789728692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBprWD+UdIA7t4+GGinbNgIVbXulJoerlIuVIoo1MfM=;
        b=XMkkw5zk0HwCI5r8UCpBZBHmXWM05M5E2vGmEb7dFg/fmonDVfeLdThe/gfYI4drst
         qr60XNLpobm9a3I4fvbSfLm3UL4jziIle5CHcAYVTf5eE/zXxqcXuDWSrRIN5cZoqukX
         K/s/7ubUCaS1LaEqoZNarwy5DbFGGK66J+FjqnWAhLqfEzkRsBO3xiVJf44BGGBqhyCr
         MehETtOU4fHA600PEk6Prv3IX3voBNekKnu3igchr0T11Fwzt9aLah3pWN0/JNWaEA8M
         gkRSue567BPLIq1yC8yF1uhNzWTlgEozyHGmFhOhTekwu+ELIxxEkek3AgE2jMBhhhJV
         8eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123892; x=1789728692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBprWD+UdIA7t4+GGinbNgIVbXulJoerlIuVIoo1MfM=;
        b=UsU/27Zk3yyxUAdRSq9Xo6vf5ZkjLe7P4Nj3NvxPQ1tKlysPW0lzH1t2S2N9Qo/JOU
         1m9FqeW6UtqKml8wa4x8kpHnqPsykRCuQpeZI6m92+0NpvjgLEpdaF0217Xuz27DT83x
         xxSbnqJLOnqDk5kLxhPF91bdKDxo1fSoOpwCyDSWaXAQ7s7G3mMkeVNiJqCVPQvpdKZc
         muYSscSXfb7pSsaC/fGTCmMqWKp2Zk6Gyi0t3Ijh+9oGXtCmsKjxvQQaOUsquPur5m7P
         TDRryV2vNa67BxNWBwyi8ObAcgHXi/+uZdWgCNGwiPXJ4X2a1HaE8CwUN/cIFuvXMCB5
         JDbg==
X-Forwarded-Encrypted: i=1; AKwUvByPX4upQe3L5W4/FbfH+NIlUZSkULvB+doV9qi7ZJzQkizcYoNtl09YolcTAYY7QJ2taaZbCyW6vdROWPHFH3U=@vger.kernel.org
X-Gm-Message-State: AFuF++nbW2DW+esXn8OnePCcNLVFrLIMotA2v/ZCdaGgEcrUrQ4fFX1H
	/npPhd+o1+VIlkBQ6DlLowkzsuzz+nMoqoDjwjV6dOKYCrzkV0R6Xo3d
X-Gm-Gg: AYBFou0LdsHJdFMHq/gVCbPHJPPowzLTfbtGRi6nV5ypm+0RLoxf+k6CC1YMt8/nFHl
	cC1OOpnhafjKydYfEwxH05WiIf+Z0mQdH5cbB+iT5ngg8FlZQg7rPBtW8ZFx0KkuaZ7K0WIA6DN
	DvDYd0qUdBCZJiIeW+xM9pFDbiVMo+D9OGa/Ty+neKNJzGXfJcf7WjomSQnQhki/xhP+SnMMTdE
	vpYXjSphQe+nzUPRTe+KdqlDWUsB6S0uuDrikJTL4t+3tV+A0dlOwPvnKtdVmALT8QWbOz68F80
	/syT8ylNB2xjDiu4S+QBYvNdZiN9Sm64Ck9M9uM5Q/kQka/ZtbfrRKOWfib04raAtKXFmqVjFIz
	eR8c7W9iQ6EvkZuIy2/Azzd4GRuCaZj1dW3xFhZTJPM7Q88N76K/i9w7gGixhTYRVOy+Te5qYBP
	ElGTFDwfdffuoFcFr8+elcjVSsR8vIvbb6AixViqZGkWT1YPxpwXU7x9m1M7+kcSKLyKak6RSno
	F4qJdvgnhmDmKG9JQIa4Q3p8TeRAY+Z7UrCE/+6ij7oRfRIKtUmghrSwZdX5g==
X-Received: by 2002:a17:90b:2547:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39d9c225ceemr7107821a91.17.1789123892036;
        Fri, 11 Sep 2026 03:51:32 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:f7e5:8b43:47c8:5245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm4876004a91.1.2026.09.11.03.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:51:31 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v4 4/4] selftests: net: test AF_PACKET multicast dumps
Date: Fri, 11 Sep 2026 19:51:03 +0900
Message-ID: <20260911105103.7771-5-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911105103.7771-1-sigefriedhyy@gmail.com>
References: <20260911105103.7771-1-sigefriedhyy@gmail.com>
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
IFA_MC_USERS, and that IFA_TARGET_NETNSID dumps another netns. Skip
when the kernel does not support AF_PACKET dumps.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 tools/testing/selftests/net/rtnetlink.py | 75 +++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
index 5cc3ebdcf08d..cca14c4008cf 100755
--- a/tools/testing/selftests/net/rtnetlink.py
+++ b/tools/testing/selftests/net/rtnetlink.py
@@ -1,17 +1,21 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 
+import errno
 import socket
 import struct
 import time
 from lib.py import bkg, ip, ksft_exit, ksft_run, ksft_eq, ksft_ge, ksft_true, KsftSkipEx
-from lib.py import ksft_not_in, ksft_not_none
-from lib.py import CmdExitFailure, NetNS, NetNSEnter, RtnlAddrFamily, RtnlRouteFamily
+from lib.py import ksft_in, ksft_not_in, ksft_not_none
+from lib.py import CmdExitFailure, NetNS, NetNSEnter, NlError, RtnlAddrFamily, RtnlRouteFamily
 from lib.py import defer
 
 IPV4_ALL_HOSTS_MULTICAST = b'\xe0\x00\x00\x01'
 IPV4_TEST_MULTICAST = b'\xef\x01\x01\x01'
 IPV6_TEST_MULTICAST = bytes.fromhex('ff020000000000000000000000000123')
+ETH_ALL_HOSTS_MULTICAST = bytes.fromhex('01005e000001')
+ETH_TEST_MULTICAST_STR = '01:00:5e:01:01:01'
+ETH_TEST_MULTICAST = bytes.fromhex(ETH_TEST_MULTICAST_STR.replace(':', ''))
 
 
 def _users_for(rtnl: RtnlAddrFamily, family: int, grp: bytes, ifindex: int):
@@ -105,6 +109,70 @@ def dump_mcaddr6_check() -> None:
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
+        try:
+            addresses = rtnl.getmulticast(
+                {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx},
+                dump=True)
+        except NlError as e:
+            if e.error == errno.EOPNOTSUPP:
+                raise KsftSkipEx(
+                    "kernel does not support AF_PACKET multicast dump")
+            raise
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
+            peer_idx = ip("link show dummy3", json=True, ns=peer)[0]['ifindex']
+
+            addresses = rtnl.getmulticast(
+                {"ifa-family": socket.AF_PACKET, "target-netnsid": 5},
+                dump=True)
+            ksft_eq({(addr['ifa-index'], addr['target-netnsid'])
+                     for addr in addresses}, {(peer_idx, 5)},
+                    "target-netnsid did not dump the peer netns")
+
+
 def ipv4_devconf_notify() -> None:
     """
     Configure an interface and set ipv4-devconf values through netlink
@@ -315,7 +383,8 @@ def ipv6_route_del_reason_absent() -> None:
 
 
 def main() -> None:
-    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, ipv4_devconf_notify,
+    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, dump_mcaddr_l2_check,
+              ipv4_devconf_notify,
               ipv6_route_del_reason_expired,
               ipv6_route_del_reason_ra_withdrawn,
               ipv6_route_del_reason_absent])
-- 
2.43.0


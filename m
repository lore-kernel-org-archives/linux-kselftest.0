Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A9B29B200
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 01:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917684; cv=none; b=ujx1JuvTyYg7d+XXr1gHzqKN/Pq6wDUFUNPwJ8QMYFJJF5iP6XlEnohhm87wXdKX+wP2Al09aJMtWkV3giULjw4fukKSjNN9OU7eE0Hj9ZcwmE7Fy60iq4nSns2ZpxSdPKzBA2lb5WpH7FmJCqCnas6W7paMkrVlj+89Mqblk80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917684; c=relaxed/simple;
	bh=+edinUEnt6ZoO1TKdvOI2/Cb6vTbZMYFw3UEyvP+Dak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTug2upPvumuqqQ6wmU69/KfZlJq00t8AYmC7Tlokmn03JrGMBH9uIPt+wybY4ra/P3LyclCyb4BrEpeHkX85FGeKIksXcqsMDNU/eH2rVGlTCjuA3eMGFOQot27AwyI7brFgyeJVFWxm7BZ7Ztl8BCkvVmRm4hiPZXPACguVIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb9Wvo4R; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb9Wvo4R"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d715f4a587so73763135ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 18:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788917681; x=1789522481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLIDmezDXdQ70zfy5nszD8xSCALT8WngLTXlbOTB1pA=;
        b=Nb9Wvo4RM3X1rz74Y0hs2x8Yb72dQNJb8oZM/z37J1D4V96yAan2d8ahfiym26FDFb
         upclh9JsL0tIlgLSeq0o/RUZCgis9Er43VEEUJadjMBzCTfN6Bk1GhkQChz0zlla/Cjq
         0E+DDEwQGsbaKSwqLPzYv0fiyvM7+m7x3ZCBOQnKOLp7dF1bR/oD85VC1D9ozqiwoixP
         s62d3+Py9rxkVXAbc9tT5ToyeeZrx7/LGekWXoo6FwfjH109YNDhp1q4g5AwgDy7j9Of
         ztp12eraqGF159wQCwGi06U7PTBn9sDiS8BshqnBjEwoLfUvLel0VD1cpesp0gwo2tFE
         j5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788917681; x=1789522481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLIDmezDXdQ70zfy5nszD8xSCALT8WngLTXlbOTB1pA=;
        b=sVwHROd+FdBXGUNp5YbbDaoy4pSjHAjasxcXLZihjDu9mxqHDO7WKEYTcbhRK9MAdi
         8AEmm8rffQF/LY5xX3kjHei9jKRwQ3kRZdZLMQwBppT/rKdaFD5ncSBtvfYnU1g3kMEf
         izlYG4II104m4ZA/mIHDEzYgZKiV2UwnBQdL+HFSLTn65ETDqHY1GqnDn/rdwPTP1T3a
         2kdM502EZC2l4KKTLjLCLxPWqT0miKNPihp9Io9XOWcesK9WqEny15AKhmtUpzmrR9Zn
         SRkWZdilbgfJkNwoLa+XguLk3QXF615B5og6s4XBgGmOGXcrvXsBesSm15yP1Kaps45+
         vfZg==
X-Forwarded-Encrypted: i=1; AKwUvBwZ9JEgSewLSpNMDcsdZa+fDNujoel4QA39NbjjZEJK4F/8RcR7EFlxO9EpttQMDd7369Y8rfvHkYL5FltoBVA=@vger.kernel.org
X-Gm-Message-State: AFuF++mOLeAXZKY0rIZTTgB/qvVfIwi3J5cPJxipEoCDeyLfnvwFPRLl
	ALSrLORk0mi4+Rp8jN3TpWjnPngHdI2mAjFKsGWuDZ5KqYAbShDjzHHR
X-Gm-Gg: AYBFou0aDaQHJm7Hcry0NftP27kXYWkC+q3NYyMoQ54aDLZe/dfsc4IvdlJTWVd2/Tx
	gHyaQoyt1wfMy6QhW+CocjgshCr7SucMPL1C1oHfHs9QsxEA7P7j4v8u+hXsdOWcnpJ5e5qLRdz
	ZFbCt3kOBXcOowy70fPT82Y1RDn4/ozRWvEQH4vTSPbz44EACBH1rqvYwkj0JolTULhglTtgQtt
	ba4lXkS6Q9tUN0bp9NHPI/FU1n2UQPkmHZuAnMzfTdIFgFZQyNlFaHHSmHpvSkCATqb1XoCW/MM
	Sn9qPHaMPlrXPTM9ubi5YZJnFfYiTej3dkrS6WE5tvePFnXA+QGAI8aRAhjSkkKEsnyAGbyfWRE
	UbuSRCvTJO1XTPVwXwsNd399lVt1UGbna0inAv01WNK0vpNg+j8yC3mTwlnroKKvLeRXbMRbwN/
	gpr789iD1/zTApoNXfK3uDz/CA4Wn8ADiEkcfg19xDo0IXZvficBV9zlGy8WAvaDOP2J+yYFUVU
	5yPg27uVfqZJrqW5QkmtL5CxQzjw2CRDBDj01p8k3JfmI1al4+HVsvzXzmUUQ==
X-Received: by 2002:a17:903:19cc:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2db125cd39dmr547568255ad.5.1788917680847;
        Tue, 08 Sep 2026 18:34:40 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:574b:e1a5:307b:15c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db63c00837sm27975145ad.40.2026.09.08.18.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:34:40 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
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
Subject: [PATCH net-next v2 3/3] selftests: net: test AF_PACKET multicast dumps
Date: Wed,  9 Sep 2026 10:34:01 +0900
Message-ID: <20260909013401.14408-4-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909013401.14408-1-sigefriedhyy@gmail.com>
References: <20260909013401.14408-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dump the link-layer multicast addresses of a dummy device and verify
that ifa_index restricts the dump to that device, that the all-hosts
address joined on link up is listed without IFA_F_PERMANENT and that an
address added with SIOCADDMULTI is listed with IFA_F_PERMANENT and
IFA_MC_USERS. Skip when the kernel does not support AF_PACKET dumps.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 tools/testing/selftests/net/rtnetlink.py | 57 ++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
index 5cc3ebdcf08d..cea636f10aeb 100755
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
@@ -105,6 +109,52 @@ def dump_mcaddr6_check() -> None:
                 s2.close()
 
 
+def dump_mcaddr_l2_check() -> None:
+    """
+    Verify link-layer multicast addresses in an AF_PACKET RTM_GETMULTICAST
+    dump: the ifa-index filter, mc-users and the permanent flag.
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
+        ksft_in(ETH_ALL_HOSTS_MULTICAST, entries,
+                "dummy1 does not have the all-hosts link-layer address")
+        ksft_not_in('permanent',
+                    entries[ETH_ALL_HOSTS_MULTICAST]['ifa-flags'],
+                    "protocol entry is permanent")
+
+        ksft_in(ETH_TEST_MULTICAST, entries,
+                "dummy1 does not have the SIOCADDMULTI address")
+        ksft_eq(entries[ETH_TEST_MULTICAST]['mc-users'], 1,
+                "unexpected mc-users for the SIOCADDMULTI address")
+        ksft_in('permanent', entries[ETH_TEST_MULTICAST]['ifa-flags'],
+                "SIOCADDMULTI entry is not permanent")
+
+
 def ipv4_devconf_notify() -> None:
     """
     Configure an interface and set ipv4-devconf values through netlink
@@ -315,7 +365,8 @@ def ipv6_route_del_reason_absent() -> None:
 
 
 def main() -> None:
-    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, ipv4_devconf_notify,
+    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, dump_mcaddr_l2_check,
+              ipv4_devconf_notify,
               ipv6_route_del_reason_expired,
               ipv6_route_del_reason_ra_withdrawn,
               ipv6_route_del_reason_absent])
-- 
2.43.0


Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA6D2E7165
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 01:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350373; cv=none; b=jg6n9LTNcFC45jA+G3Gvj3wkJFxF6WiEjSe4yXRlTm1l+DqOJjPNXIIUt6xhEP4rU29cICUFs6vYsbLtu321CMdZw6Ur1p7z1h9ETkjqJTlWLoEjFDmJNVPRrOXKWr2CEqy1rYBuGHYV5jDf4jCk7z1M0DDROHMhcSky03/L1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350373; c=relaxed/simple;
	bh=EsT+PBPEd9+QfxQSnu5BDxW9hMrBz9PT5H0Z8BMmhSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvPcVu5FoZeVJZMR1jkAlqBDSbhmjrJx2jH0mAtNZC6YmNsdttQ2/Zp9GzzKJ/a4Dw3pQ38Or+WABn4VRGDOD9T/+7mPhEu9WUyjCGxzev/4MOnFGoc+M+I5lv15GAoAMdByhkAqIenzE7LBPXjPT6Ec+D+MQ/Uvx1+NQZ1uvms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqUVBmRi; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqUVBmRi"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso1520004a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 18:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789350371; x=1789955171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iog9u3kWQAxr12SZF5gI4RQKtYZ4RbwMVa3tg5U3XlE=;
        b=MqUVBmRiFM9k/unPPQzVguf558ycBf5ZPymyuKaJnnld2Utona4gE2v002YkkQmezF
         A5zfpJo1jlC6FNbZ9q81AQ8oqvIpU1WZXZmIjFUKyFIV8kt+92Sb/sZSWnO4Cy9c2XY+
         +vutF2+CaZTrr3lQnX5vbWQ1q0+qnyYH9w/AQWDouNe+qVkvyqf7VGA7mnHzhn7Zuqvl
         rWslY0i3tICVFEoEaYHgj5KJxllUS7CkO8ZX9EOdy69PzHkT6EoAXCn8AxVru0hDGS5D
         lI+2FvI2NTXONZh0x871VPid6d2tIPB/oIgmjMw2H5LiC4Z2DpKUkK8bc8VRWilfpLSf
         q0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789350371; x=1789955171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iog9u3kWQAxr12SZF5gI4RQKtYZ4RbwMVa3tg5U3XlE=;
        b=OoXEdEQN5UZI+en2rphZgImn0eK3snIoWBUbS0eht53/leUrYOdnQe6959cdsGy6ez
         iu5yHoxQ26jZR0S7FTnZggUdFLOVdoGCJhyo0aWjAM9ZiLzHmVqnkMeEuAwbHdBGMzcI
         EblYzqLiuE8ZQeS7hvaoYPeggoI9hmO8uftxiolrPMt0YuQ7xSpUbdmu3oHsWAbssxRh
         0EEzLV64X0Q2DuaWcJ+NFWmCoBXieF/EDE56Aybq7mE8YB+SM/41pvRhM9SVI3sj2qjp
         wSmzmWH4rxtETeejn+49s8cs4rdf35s63H5BX7KdUw4JAXrCODLJpqgQs0trl1jfU5OU
         9wKA==
X-Forwarded-Encrypted: i=1; AKwUvBwsAv4xR+WQTY6i0ocA9m7/NZRhd/XcZqYC+QxCRpz374S2hM4i0wivVNoEcMqUzGWGtjVYnDRcagEsYHgu2oU=@vger.kernel.org
X-Gm-Message-State: AFuF++nOsCpQuXTCL4tQmVZJn031to359UVs8eMn+so4NZwnm+bPma1U
	/42tFqFm4BD87YoFj1v3tDa8M0h3xm5MuzDXoRNoqecw6uetklnIYCBF
X-Gm-Gg: AYBFou3CCTOeDqp2u2KGk7uWjhK8MRRp7I9ihSQHZxe1QuycoElqBigmbrKpI4j9GXE
	DtV4s2X0eFTVWrdqz6bPVj5qNsBMYb92R5liQ1cZaEQtpPDCSNbToby+ohN6MZFMGWDJ50cIqRm
	ckrskQFAdGCK9ByLGxCIEekq+qE5IHuGed+4fk22zxcLRg1nC8VW/8FNZmRzpjNi3wBpMqd7eYn
	aUsvZRDVaUWltopya2172xX+8O2YmJ8UwhkSaRRsIW+GPauJjH31I1+k/jcys3txeF+ygzEiKew
	VYG9YRPGw8G6szBN+Qltwz4Td2V7SERD94BnpjBnrKr/1aMMb99+i2C4Pi5Pte0G6Gs+5AkOeCH
	p7j15DltlXByuYx5ikLkStMbpS2IW6RGDnYzKgP9hKrv2NkYyXK+EsEC+6PysjprHbJ+vAoOhi2
	iG94/OIC4t1yHgdIE0RrtlXvv9NffsPIo/f6Vl/6TxRLmdDJlhsYIAJzpKn7hMdRo2w8AeNoIh1
	86V0PsRHVEd4OnokCx7aurRh5rgE3gd7pcr8V+kPQzm/pI=
X-Received: by 2002:a17:90b:440b:b0:39d:e784:3e1c with SMTP id 98e67ed59e1d1-39dec0f7193mr1056503a91.19.1789350370733;
        Sun, 13 Sep 2026 18:46:10 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:fd07:4a24:951e:c85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d1056sm17513403a91.7.2026.09.13.18.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:46:10 -0700 (PDT)
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
Subject: [PATCH net-next v5 4/4] selftests: net: test AF_PACKET multicast dumps
Date: Mon, 14 Sep 2026 10:45:39 +0900
Message-ID: <20260914014539.5015-5-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914014539.5015-1-sigefriedhyy@gmail.com>
References: <20260914014539.5015-1-sigefriedhyy@gmail.com>
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
index 5cc3ebdcf08d..d69d375a2def 100755
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
+                {"ifa-family": socket.AF_PACKET, "target-netnsid": 5,
+                 "ifa-index": peer_idx}, dump=True)
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


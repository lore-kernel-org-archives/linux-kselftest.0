Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E143CB54C
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035214; cv=none; b=qFOwboOpqfS/EpYXB+HZH4NFz79Ri9p/uf4QjceEQS1IRwRNioO97z8t6Vwwd+/+QzAJeIgFDABMOoMm67P78j2yHUlIkNDf5yZhODmGX915YQVpuQYF/euKIczu1VQgbmAnHROLtEomli5otEwPGmyGM2DjCi2mgTyfxGRwbQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035214; c=relaxed/simple;
	bh=AIe0tVI2MDMU+wAUIOGkfF/prRfDfU5eGXTYlmKrHJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddJA8Gh9GaPgGcUbNxMUvaQVGLofb3Pvk1Mx5kQMrr4TbdUHplwi40p8tQaj3YgegFmNoPUKLvKJCaX+XK62hl4pP3Nf6O2Mc9+VM0MtSUmEWGYNKEKiW1O9YlP7MB2NrQyhOPnlgq6kxLhlQqdb1Y9b1GAVNbdUdtlTB612JHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8htQSXt; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8htQSXt"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so43263215ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 17:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035212; x=1790640012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZghyl21slJP0T9zWNT6FTVcuW3rARquNgkyu57N/4I=;
        b=g8htQSXt7FioU6wybQ9LcLTlEN1xf7/2TGQAcYqnmAYYjAi+JilCLbcqpTXWIgk8uH
         Mkw+XMz1SzRLLJTcrrSvb38cSqaO61IxREj4CnoEfBeri1vSLAxHz3wrMOGO6tecPzEc
         2cfQYnT4OPtOhpbaiJjEMBq9DPgJQhdzbkQMTVg/1baDwbF14snL3b0AfxTN0D9tRRkc
         TyjrlWzPA80k3awa0mBZTYKYEEejtC/yrOVox8a4MXMASCz6NaJSS7imfbpkJaOY99Nt
         KiBmLQU5vBZ8YlX6YFnnlzq4Q4XLPnQlP+qIIw0xsaQprAp/5WO+aLVZfBTFlfuuA7YD
         h6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035212; x=1790640012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZghyl21slJP0T9zWNT6FTVcuW3rARquNgkyu57N/4I=;
        b=AlKIxk0U1JYDY3xx0E6sQsD2D9BqbLOzTEs857C38dp+Ri87px2oqByUhQfMK1VISl
         pzin6EDw9lDkDR52Vf++frVLy84vNZXSp5hUTwZjCOm6AmSPYvLIeI7IeikFd76n8tyC
         sMupB2W7Izxp4g7ZLZFZD6hDQBCX2Qr4LeD647Dt3nwzZBTlcjU1tRlYuerATB+W0fkq
         eIY2jRyVGyOMLrx7Xxo30Fo4mpfA/4eHsegU8iMsI2Go0iBMk4XFS36DZGzTUJmoXCUo
         Q6b0mhedznjUjqXjwRsSjeXDJQHc6YJ80tWTtL/jl7FWkBmm3bekUD68xte0vOInlL47
         +rVQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1dYzt4G9kXk+bbuLRmOAiub19+RwcrkQZYbM91tsYyul1/rO5+plt+VdtiJdmiU8Pv+BJkS77FABn0euVObg=@vger.kernel.org
X-Gm-Message-State: AFuF++k6YBC/8Tull5oRhTw71w55CndNgVGa4ReeWYqJCJiAfQW8ZB2N
	ZPvqKgylNCGFMnrJEkPZwN9BP09D8yxW21r/UyWUmmXvPvJcUvS2909W
X-Gm-Gg: AYBFou3d1fAd/QVpfEd3tvqOu3R8nGWoTB6mDkLMqTYCQMklvZI47XkjM4J0ezDF0pq
	+jGe2foPEPrq//y3uSF+haYvNFCE5xrDP5UQTcMEFMfAwgcX8CYYjuRB8PdYrp7uJIypDg/80H1
	9kHf6yYh0zSyGZH33ZtHlZPKgCIwfVXmqwEUGtlH2FDoIVilo9tUNAXnwuxiQr7reLOnAtuEoTp
	6w54uRcw9T4+m9Mjbjz0KXJMVpyNnT+FQIVWRhPJEGkda9emJQc3bQO5XfzZuCqxs8z/6mpppPU
	HFqq8KhNNmY6nndy78garIH0T/crfbyiR3Hf30NHlB+8sitmt5Akjhj3uyPIn44o0cs+DXTpO2w
	Jl3W1mxrNYjNCYMV3fsvwREPs5ltsZVBXTeBiVh/a+Xp74Hbm+MHwMcsjDt6nIlLtmVLMrSneph
	oqjvSdjFNB/YX9PN4e2P1JtJLbOaa0Aj0fFsJNxeG/2ZvbHwaKJ6RUwu5DU39knWybkfqjHm/Oc
	I8zTUHhY6FQOnnH+XeE8VvyOuzXuSRwzUKzDtLlbxaXMOxM+dYf+z+nMS2uXI1SPxlQznd9YbVx
	6Q==
X-Received: by 2002:a17:902:f544:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2ddb1adbb7bmr172030645ad.10.1790035212267;
        Mon, 21 Sep 2026 17:00:12 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d045e78sm386135ad.51.2026.09.21.17.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:00:11 -0700 (PDT)
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
Subject: [PATCH net-next v6 4/4] selftests: net: test AF_PACKET multicast dumps
Date: Tue, 22 Sep 2026 08:59:51 +0900
Message-ID: <20260921235951.3214-5-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921235951.3214-1-sigefriedhyy@gmail.com>
References: <20260921235951.3214-1-sigefriedhyy@gmail.com>
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


Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F240960F
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817351; cv=none; b=Ks87Ts8mVZ65UOHtTqw/MSGNzRYkO0qS1BPiBBPOzRoBv8fBi3YWJQ91hvj+khWMQRQwy8ktM+JsqJ9wpKTKEDvAZQVSEz7nQoBh+05cuErmaDt7w5L4u1MGYg3lNs70lwkx0OE6+OpM/rAnHB1hhhEWLSsfddtiCkB3H5msCm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817351; c=relaxed/simple;
	bh=8wZAl9dIq90GZLioFiUpzFcU9diyNdRhpnpQypxIlwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zx3KWo9Lpoc9I6XmgUPdZFGTklEwtlsVHkLQnwrIKWYcwR1rnLZLGIpuZj+S41eSu/yyOk5nHPR7FhAklvx+Ix+vZepIGtgORTzXNnNbT06i9FsXOAYERFK/KqadfPtCfxFr1DKzSfLmp/owD+lLP4w0eQXdbFulW5G0qf9dhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOqY/0CC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOqY/0CC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c9b42be8feso25212095ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782817349; x=1783422149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=710DEh42/SxcOGjoC0hzcAfTSmEIF90NLkpYChDQKCY=;
        b=fOqY/0CCbio+7XRNKbwvkNQ0tt5ObisYqS/+D6LvltV0Lr2egGZJKkUPRyoa94YJb7
         rOeV5e9VSwaLUAYjyCxiWZSzh5Qu4hn7VxN23Xqf3NaZbmD9zDdJjaEizKuJHsDXuYhJ
         xddvtCjL+UpB+vmHW2+9cmKn3tjmAAX0N4Mzh3gy/+d+DK1NwsHVMATDzkyQxUKWuL7F
         bBwcD9Ff1Tat8XQKHYv6KlZC4dD5CO4zvTTrn1zbGLSU9AU2ztT0BXPeQHoIdkdB5otJ
         w4oL8i75Fwd9bs+oU+og107VD/qozD2+xKTOvz65j09vACl4TR8cz520SUF2yVT9oAZb
         cLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817349; x=1783422149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=710DEh42/SxcOGjoC0hzcAfTSmEIF90NLkpYChDQKCY=;
        b=jHDb0UknGm9cn0mwTPSlcD35KMXXzlwl6/6gYw243fZlFQUKuh+6BiCw0gTKI2ZWJx
         cktTiV5X6AifoVg1ZLk8HO50P0Ze6zQmwVbELuOcmVtcPmzSkr2tdQCr03/Nevt2ZLLn
         MYsaKNel2ZPQT6mewFMccoUC+ntd13EUW/OxLtQB9oIgpIPA9h5udTjlxZ8Z2QGvSaEo
         o56/qLwMVRfrpzALUmN6hevJr3ORvWcBSlTePgj/Qapyc8R0AREBRFfhKMldI9Dtp83b
         Go4y4e6xiAfs78o3uXx0PnX5ToxgzePgNqTiSZPYdMB/B7iGmsUG5bnEQ4iMaRopNs+x
         q2uQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEPCzR1080BVFNbE7WsnEmgglFbERnOCFK1MmqtCO6M4vrtm74ahj+HatHkP6paN3PMuKGNPv0j3/nb7kK1LM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfGIA+kPchzu7NeTvIpS4S2tvpeSTMP1NMucfDmYtd5d7qUnp1
	M61INdsjSK4V9RU7WkrAMSo9VUHW4gGiDB/fCYPwk5raA9J3TOf/jJ29
X-Gm-Gg: AfdE7cmHJ6sQdkCs+2Jrydb07MZnfXxn1RLPxoi1kSk5wtzU4qJxPIl+5bCv5Ij8t3k
	ypjZbVsTdL2Uw2Bt1c0++92H2fWcdU9r0sI6+HLA/3kPEPAsz3kFX2zlrzIplhGzATQb1GUoJj1
	M+q8OD0BoCUi4h566bxAZAfuAnh3GK8VhwPwBSZDWtK0xLovjlEaGVQ0QLKIFPaiftBEyEIR52Q
	NEwaRMcisxdAs4O59PYLoJVZMq3G+lfVIRvG1Efjm3ZA2HPsR6UHhSslEDj56/v1expfgjy88rq
	IT5qhg6Udwlt/DbRQe9Ti8QmXahuB01gdKXeea0pJDtM3uJgIvJJsbHEPSceTJj6rXob/6yubyE
	NsIEOAoTLncLbeEiHvnm8L6oyzthwef5ZgXSy3LOiRnYtNfL3FNS7ATld2HSFGTxSk9mmH/ewyA
	hQHIsYFu1eFA3VHc59/NcQ1DqPc54cZb4/n74aGmHU
X-Received: by 2002:a17:902:f645:b0:2c6:ad70:d870 with SMTP id d9443c01a7336-2ca2d54457emr24425215ad.13.1782817348784;
        Tue, 30 Jun 2026 04:02:28 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:ae0d:35d1:dac9:a0e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a701b5sm11455265ad.17.2026.06.30.04.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:02:28 -0700 (PDT)
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 3/3] selftests: net: check multicast group user count
Date: Tue, 30 Jun 2026 20:02:07 +0900
Message-ID: <20260630110207.37841-4-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630110207.37841-1-sigefriedhyy@gmail.com>
References: <20260630110207.37841-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the RTM_GETMULTICAST dump test to verify IFA_MC_USERS for both
IPv4 and IPv6 multicast groups.

Run each protocol test in a fresh network namespace to avoid changing
host-network state or racing with unrelated multicast users. Join a
fixed multicast group twice using separate sockets and check that the
reported user count increases by two.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 tools/testing/selftests/net/rtnetlink.py | 101 ++++++++++++++++++++---
 1 file changed, 90 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
index 3622413d793d..0c67c7c00d84 100755
--- a/tools/testing/selftests/net/rtnetlink.py
+++ b/tools/testing/selftests/net/rtnetlink.py
@@ -2,27 +2,106 @@
 # SPDX-License-Identifier: GPL-2.0
 
 import socket
+import struct
 import time
-from lib.py import bkg, ip, ksft_exit, ksft_run, ksft_ge, ksft_true, KsftSkipEx
+from lib.py import bkg, ip, ksft_exit, ksft_run, ksft_eq, ksft_ge, ksft_true, KsftSkipEx
 from lib.py import CmdExitFailure, NetNS, NetNSEnter, RtnlAddrFamily
 
 IPV4_ALL_HOSTS_MULTICAST = b'\xe0\x00\x00\x01'
+IPV4_TEST_MULTICAST = b'\xef\x01\x01\x01'
+IPV6_TEST_MULTICAST = bytes.fromhex('ff020000000000000000000000000123')
+
+
+def _users_for(rtnl: RtnlAddrFamily, family: int, grp: bytes, ifindex: int):
+    """Return mc-users for grp on ifindex, or 0 if absent."""
+
+    addrs = rtnl.getmulticast({"ifa-family": family}, dump=True)
+    matches = [addr for addr in addrs
+               if addr['multicast'] == grp and addr['ifa-index'] == ifindex]
+    if not matches:
+        return 0
+    if 'mc-users' not in matches[0]:
+        return None
+
+    return matches[0]['mc-users']
+
 
 def dump_mcaddr_check() -> None:
     """
-    Verify that at least one interface has the IPv4 all-hosts multicast address.
-    At least the loopback interface should have this address.
+    Verify IPv4 multicast addresses and their user counts in RTM_GETMULTICAST.
+    """
+
+    with NetNS() as ns:
+        with NetNSEnter(str(ns)):
+            ip("link set lo up")
+            rtnl = RtnlAddrFamily()
+            lo_idx = socket.if_nametoindex('lo')
+            addresses = rtnl.getmulticast({"ifa-family": socket.AF_INET}, dump=True)
+
+            all_host_multicasts = [
+                addr for addr in addresses
+                if addr['multicast'] == IPV4_ALL_HOSTS_MULTICAST
+            ]
+
+            ksft_ge(len(all_host_multicasts), 1,
+                    "No interface found with the IPv4 all-hosts multicast address")
+
+            mreq = IPV4_TEST_MULTICAST + socket.inet_aton('127.0.0.1')
+            before = _users_for(rtnl, socket.AF_INET, IPV4_TEST_MULTICAST, lo_idx)
+            if before is None:
+                raise KsftSkipEx("kernel does not expose IFA_MC_USERS")
+
+            s1 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
+            s2 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
+            try:
+                s1.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
+                s2.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
+
+                after_join = _users_for(rtnl, socket.AF_INET,
+                                        IPV4_TEST_MULTICAST, lo_idx)
+                if after_join is None:
+                    raise KsftSkipEx("kernel does not expose IFA_MC_USERS")
+                ksft_eq(after_join - before, 2,
+                        f"users delta != 2 after two joins "
+                        f"(before={before}, after={after_join})")
+            finally:
+                s1.close()
+                s2.close()
+
+
+def dump_mcaddr6_check() -> None:
+    """
+    Verify IPv6 multicast addresses and their user counts in RTM_GETMULTICAST.
     """
 
-    rtnl = RtnlAddrFamily()
-    addresses = rtnl.getmulticast({"ifa-family": socket.AF_INET}, dump=True)
+    with NetNS() as ns:
+        with NetNSEnter(str(ns)):
+            ip("link set lo up")
+            rtnl = RtnlAddrFamily()
+            lo_idx = socket.if_nametoindex('lo')
+            before = _users_for(rtnl, socket.AF_INET6,
+                                IPV6_TEST_MULTICAST, lo_idx)
+            if before is None:
+                raise KsftSkipEx("kernel does not expose IFA_MC_USERS for IPv6")
+
+            mreq = IPV6_TEST_MULTICAST + struct.pack('=I', lo_idx)
+            s1 = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
+            s2 = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
+            try:
+                s1.setsockopt(socket.IPPROTO_IPV6, socket.IPV6_JOIN_GROUP, mreq)
+                s2.setsockopt(socket.IPPROTO_IPV6, socket.IPV6_JOIN_GROUP, mreq)
 
-    all_host_multicasts = [
-        addr for addr in addresses if addr['multicast'] == IPV4_ALL_HOSTS_MULTICAST
-    ]
+                after_join = _users_for(rtnl, socket.AF_INET6,
+                                        IPV6_TEST_MULTICAST, lo_idx)
+                if after_join is None:
+                    raise KsftSkipEx("kernel does not expose IFA_MC_USERS for IPv6")
+                ksft_eq(after_join - before, 2,
+                        f"IPv6 users delta != 2 after two joins "
+                        f"(before={before}, after={after_join})")
+            finally:
+                s1.close()
+                s2.close()
 
-    ksft_ge(len(all_host_multicasts), 1,
-            "No interface found with the IPv4 all-hosts multicast address")
 
 def ipv4_devconf_notify() -> None:
     """
@@ -56,7 +135,7 @@ def ipv4_devconf_notify() -> None:
               f"No 'forwarding on' notificiation found for interface {ifname}")
 
 def main() -> None:
-    ksft_run([dump_mcaddr_check, ipv4_devconf_notify])
+    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, ipv4_devconf_notify])
     ksft_exit()
 
 if __name__ == "__main__":
-- 
2.43.0


Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFAA487BE
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876392; cv=none; b=Ub8UyNAfiH4jWSlGbQtH3f1lOGhUdR9sNZz21vOsgv0vg9rBCnJzSqyaZH0ddg9D2aJLPvZVDMMWkz68uYhpyI/wcP/pJO80pwSpnny5+CghbQ0EsqUDKTLY/IF9MnpxhBPGJhqxQYZs1AP3ugZs2+NnYUOIVwg+mGpDXtA7ZWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876392; c=relaxed/simple;
	bh=PEURoDySqWuQSZD27dPpBt6/0GrdH4gRDEOa7Eum+aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mn/PcOGsZgqePE5gebBNzurJ1FAl1QuDEI/YKGuF84qXcPmMnHP5uyp3Ceafh1B3an9J+9yIN+ogQTpAfP7VWoqH1IGvNXI/Qi05NoKRpCwHbqoqjjMAfQkF8cayJLwIC4ZtqX6eOn+vuCPqp65sOGPU7yEMEQfS/2bi5cyi24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so7567465e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 13:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876386; x=1779481186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmQU4ZHn0BP9pNq3YQ9QtcvmPxZeqXAZW4pwCEu/ebY=;
        b=nYbakq5yUC+M9zUVC0jHSgZJeQwlz0oC6AOrJtVVnQgTUwr2bHLyzMZt8im+8s38bD
         c4RTrFHJt87NLkPDvJIapRYSBRHN/BgQx/2NtiZC4Wmk1iz1/kf5gpPeYBpvLr0xfDT9
         pPqdQNxsFGZ8Sx4ZmIPS3sxEzGAm89jDo82BfdacOxcx9mMoqyBOrIBxD1eZhmF/IsJS
         rBhbUg2IlbfvdFcvDpxMYhsIU6tNqa6Bth9AfAklaf3uk+zKzGLeakpzsmMg+O2rYsSj
         SvDpsayqO6Bf6p4ruAqDKEaoFHO6glEFM1zeyoPWA0AeTrXWXWTMSPhwCCo18kwBdovX
         /YwA==
X-Forwarded-Encrypted: i=1; AFNElJ/RGDJ1lkboXqZeplO86niKjGaC5cM4HHxKSoCUWuOfAwyRM4uN4xgs6h0/buIK4N664uhmr+Q5BMnkXpzhV6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVqdUO0hhalLTh+YDyO4xCUyOOkGK+Bxl43xn49WPaa4g6CF2D
	JwqtCsUxQwdu23S3rJwNSmwzfoG+P0s/uoMYOdaZsr233ShY4J9mNtZ5FoUESBpa
X-Gm-Gg: Acq92OEvXCpI2V9PdxyLuiJF7kwJ76ww+NANF8eXTxoVuoHKjylEeQvnBE/gaVQ/4iF
	W+5pg/LsKco2fdCnRrMtSTIUUW2FQsHJKU5O+32NB5mGG2SBwenWw/oZc0xGq2i4HuEbeowmkeh
	K7PxyuhIBD49VQlVXjWa/jOv0OqpmP6V4kW1k7lBC//leU4+moW39ndnpvT6umt5eMBEXWpc2Fd
	gOgevPglBsG0vdkZtCYkRsGsFUuMq37aa35z/QQJ9d0XJ0g9gWDkriiKAFaw89z9SBv8wHXHrct
	T1XB5rOEdivuxGLkzBLqMB8EyA4Ff7JadgDhkf6MiCb4TQGL2K00GWqK5xyc+TWcL2sz5wzs5zM
	dM5whbzKjQ/AZTqL8joJ28+ZzxabQkxxTZCya2pEoGjJZP7ur0Xj2ye967FnjzmyxiXFh/0beX6
	diQ4tiJH14Hu9jXvTKEQlx7gRoLgvA7FXlMZ8CA4FIjmS9WLOTYthupWP1kGJoZ6zIbUfGOQ==
X-Received: by 2002:a05:600c:8485:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48fe537fb6fmr64515925e9.9.1778876385954;
        Fri, 15 May 2026 13:19:45 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab2896bsm22924605e9.4.2026.05.15.13.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 13:19:45 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Adrian Moreno <amorenoz@redhat.com>,
	Jiri Benc <jbenc@redhat.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matteo Perin <matteo.perin@canonical.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net 2/5] selftests: net: add a test case for cross-namespace peer netns
Date: Fri, 15 May 2026 22:19:21 +0200
Message-ID: <20260515201937.2813983-3-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515201937.2813983-1-i.maximets@ovn.org>
References: <20260515201937.2813983-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test makes requests with RTM_GETLINK and TARGET_NETNS and verifies
that reported LINK_NSID is correct and only reported when it is needed
from the querier's perspective.

Assisted-by: OpenCode:claude-opus-4.6
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 tools/testing/selftests/net/link_netns.py | 49 ++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/link_netns.py b/tools/testing/selftests/net/link_netns.py
index aab043c59d695..2aae422d3f8a6 100755
--- a/tools/testing/selftests/net/link_netns.py
+++ b/tools/testing/selftests/net/link_netns.py
@@ -3,13 +3,14 @@
 
 import time
 
-from lib.py import ksft_run, ksft_exit, ksft_true
+from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_true
 from lib.py import ip
 from lib.py import NetNS, NetNSEnter
 from lib.py import RtnlFamily
 
 
 LINK_NETNSID = 100
+LINK_NETNSID2 = 200
 
 
 def test_event() -> None:
@@ -132,8 +133,52 @@ def test_peer_net() -> None:
                 ip(f"link del foo", ns=tgt_net)
 
 
+def test_peer_net_cross_ns() -> None:
+    """Cross-namespace RTM_GETLINK queries using target-netnsid.
+    IFLA_LINK_NETNSID should report the link peer's namespace from the
+    querier's perspective.  Absent means the peer is in the querier's
+    own namespace.  Must not create self-referential nsid mappings."""
+
+    with NetNS() as ns1, NetNS() as ns2, NetNS() as ns3:
+        net1, net2, net3 = str(ns1), str(ns2), str(ns3)
+
+        ip(f"netns set {net2} {LINK_NETNSID}", ns=net1)
+        ip(f"netns set {net3} {LINK_NETNSID2}", ns=net1)
+
+        with NetNSEnter(net1):
+            rtnl = RtnlFamily()
+
+        cases = [
+            # "dev netns", "peer netns", "query nsid", expected link-netnsid.
+            (net2, net1, LINK_NETNSID, None),
+            (net2, net2, LINK_NETNSID, LINK_NETNSID),
+            (net2, net3, LINK_NETNSID, LINK_NETNSID2),
+        ]
+
+        for dev_ns, peer_ns, query_nsid, exp in cases:
+            ip(f"link add foo netns {dev_ns} type veth"
+               f" peer name bar netns {peer_ns}")
+
+            resp = rtnl.getlink({"target-netnsid": query_nsid,
+                                 "ifname": "foo"})
+            ksft_eq(resp.get("link-netnsid"), exp,
+                    f"link-netnsid mismatch for dev={dev_ns} peer={peer_ns}")
+
+            ip("link del foo", ns=dev_ns)
+
+        # Verify no extra nsid was created by the queries.
+        nsids = ip("netns list-id", ns=net1, json=True)
+        ksft_eq(len(nsids), 2,
+                f"unexpected nsid mappings after cross-ns queries: {nsids}")
+
+
 def main() -> None:
-    ksft_run([test_event, test_link_net, test_peer_net])
+    ksft_run([
+        test_event,
+        test_link_net,
+        test_peer_net,
+        test_peer_net_cross_ns,
+    ])
     ksft_exit()
 
 
-- 
2.53.0


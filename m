Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864EF3F871B
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297830; cv=none; b=Ju+OHARaQH278KSaI8eaxt26KgLW/vjiouH17pOjrYHTkWmuFXmy0nfXVA61KhtCPZBnjkNVdvPQTtKnkOxbrYERB6aIl5MpADB0cEamLs9+hO8WQJvBObbXIAwFwnX2cZdErfbqULkjxAq5+M4mY9HoDEMjyR0wzX4oTpCbr7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297830; c=relaxed/simple;
	bh=8ee1KK6pbWiMoa+lm6mq4reiA3CNV5J1Dikiqs/l0Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGJDA0L5TgD5KD36xBgD91j4ZgxyzWje7l18p4Ew+eypy+H6wFvFyN9XXP2ESwKnocm803szrdYTi3HsdZpC3F1fcnbD5IanDmjRwWj86QKxlbXGAN01gEuKjLEWTXIpuFjh4lPq96JbwieOJ6rneJjXxcGJXfdEU2+fSrHIRQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2897322f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 10:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779297827; x=1779902627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DryccTLU/nbCr+QwWZ91fsYNK6rnvVP3JQDHF5PbwEg=;
        b=JGYqbOEIq7zJUa0nrMLwLDY6Wa/9QZgG9fSLj+XZbAo6/jkwnZmOkauW78LY2JwOTx
         ESM3usVt+e+kXjWebUeQRmdmb6mc8WFBUhoGX7LB/uFTSmi8VPPB/N8CYXqGCjlj6vZB
         oKGOIpRXY9u03GXXggq0SHpVzAfKEJTNN0UCZgaFa9SYRV7BMBlMGozQozdGQ4MrUXxn
         UFT6JE9NQ019zkGgRfTc6xzt6afgn0HtiYTMcG41/wP7ERnGZ8KfiV6/JNF9BTF44Uhs
         9hQALH3GBqyNrOmfutPZblcaKwqc1VVNCA8C5tDUBnVIHIESUwxdANfiEyoRGpkC8u6a
         MrfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IeYVzON8EJ6w4T9mdCvd7kxapBP+dtChzdkzlkn6fa+EYRInda7RxECbsLhcEyDZvOrdn3rMpTB4mR/ArTL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDqTf198rpqtFeSc2gdMg9FGUZxJGATCaos9/uBmwcfCgEfEyX
	aNJbLcuc42LzfyNwUvp0jvDXfYBlVHofqDYTsCRay2RP5YIpfu2CbUfe
X-Gm-Gg: Acq92OEUYjp5DHFwZX467Jk4fPiD+ECg5EWjCswJgzAqo+RrjIcCcsndR5HRdv4ov/s
	tkk6QJqzPtCpULVsAVZNHzrCoeXmYDtSP6F2bYrZDxRsp6OJvPqs10Ee3MAdIiU55RQFH+93CGw
	KYvabV3s0TeYjrXeHuNBwuWTY22QTSy2isOhF6fonD6iva+Wb2wDFUncEzPF13X1hnLwWdotU4p
	5IyXRKK5bzGx3jqUyc0XD00kLMYmeIgTz9W4DULOSPw8xI0S4fCMSTUHWWIOuEi5Jo1UrwbD8l5
	MYiJDXKFS14Rgx/giS/GidSMVJHJnUfW7y7s5HaxMEmirmg1PPHEG7qPzLPPPUhnxGe6V1DiG8X
	2H/wXspDtYKeQT2dG1Db99F1sJXeNDL+e/m84Ei7kBwYuEEKnCxcLohzpRGL2UkPk2TwAVVDl1w
	mVtvx0zEOSHqTW6aeszbbrWuu+EvG8bx47JrpXcJzk5PXM5pUQfgeJwSUG0uA=
X-Received: by 2002:a05:600c:1d99:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48fe631389bmr363429105e9.26.1779297826824;
        Wed, 20 May 2026 10:23:46 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm51125580f8f.26.2026.05.20.10.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:23:46 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Kees Cook <kees@kernel.org>,
	Adrian Moreno <amorenoz@redhat.com>,
	Jiri Benc <jbenc@redhat.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matteo Perin <matteo.perin@canonical.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net v2 4/4] selftests: net: add a test case for nsid in all nsid notifications
Date: Wed, 20 May 2026 19:22:38 +0200
Message-ID: <20260520172317.175168-5-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520172317.175168-1-i.maximets@ovn.org>
References: <20260520172317.175168-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test subscribes to link events from all namespaces and makes
sure that local events do not carry NSID in their ancillary data
(even if there is a self-referential NSID allocated for the local
namespace), and remote events do.

Assisted-by: OpenCode:claude-opus-4.6
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 tools/testing/selftests/net/link_netns.py | 61 ++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/link_netns.py b/tools/testing/selftests/net/link_netns.py
index aab043c59d695..6d1f863b6262e 100755
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
@@ -32,6 +33,57 @@ def test_event() -> None:
                   "Received unexpected link notification")
 
 
+def test_event_all_nsid() -> None:
+    """NETLINK_LISTEN_ALL_NSID notifications: local events must not
+    carry nsid even with a self-referential mapping.  Remote events
+    must carry the correct nsid."""
+
+    with NetNS() as ns1, NetNS() as ns2:
+        net1, net2 = str(ns1), str(ns2)
+
+        with NetNSEnter(net1):
+            rtnl = RtnlFamily()
+        rtnl.ntf_listen_all_nsid()
+        rtnl.ntf_subscribe("rtnlgrp-link")
+
+        # Case 1: no nsid assigned, local event, no nsid expected.
+        ip("link add dummy-lo type dummy", ns=net1)
+
+        # Case 2: self-referential nsid, local event, still no nsid.
+        ip(f"netns set {net1} {LINK_NETNSID}", ns=net1)
+        ip("link add dummy-sr type dummy", ns=net1)
+
+        # Case 3: remote event, nsid present.
+        ip(f"netns set {net2} {LINK_NETNSID2}", ns=net1)
+        ip("link add dummy-re type dummy", ns=net2)
+
+        # Collect the three newlink events, ignoring unrelated noise.
+        events = {}
+        for msg in rtnl.poll_ntf(duration=1):
+            if msg['name'] == 'getlink':
+                ifname = msg['msg'].get('ifname')
+                if ifname in ('dummy-lo', 'dummy-sr', 'dummy-re'):
+                    events[ifname] = msg
+            if len(events) == 3:
+                break
+
+        ksft_true('dummy-lo' in events, "missing local event")
+        ksft_true(events['dummy-lo'].get('nsid') is None,
+                  "local event without nsid should not carry nsid")
+
+        ksft_true('dummy-sr' in events, "missing self-ref event")
+        ksft_true(events['dummy-sr'].get('nsid') is None,
+                  "local event with self-ref nsid should not carry nsid")
+
+        ksft_true('dummy-re' in events, "missing remote event")
+        ksft_eq(events['dummy-re'].get('nsid'), LINK_NETNSID2,
+                "remote event should carry nsid")
+
+        ip("link del dummy-lo", ns=net1)
+        ip("link del dummy-sr", ns=net1)
+        ip("link del dummy-re", ns=net2)
+
+
 def validate_link_netns(netns, ifname, link_netnsid) -> bool:
     link_info = ip(f"-d link show dev {ifname}", ns=netns, json=True)
     if not link_info:
@@ -133,7 +185,12 @@ def test_peer_net() -> None:
 
 
 def main() -> None:
-    ksft_run([test_event, test_link_net, test_peer_net])
+    ksft_run([
+        test_event,
+        test_event_all_nsid,
+        test_link_net,
+        test_peer_net,
+    ])
     ksft_exit()
 
 
-- 
2.53.0


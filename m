Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4993B775E;
	Mon, 29 Jun 2026 23:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782776367; cv=none; b=sxpsXRFph7lLTTDH3IxGhh4bgt+eeGN/FiuYuUDdVfkBr4B1OxLfO8a9US9N1fTXumVXcppEXADkZEDMcouuB2x/1R0mS1AOFrxu/i5d59HmB3Zx4uWIVFV+QcAfz4vsZVBr7YD/FRrwGhRJ4lDf3dNX3l8+hqPplD9NpTn9iaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782776367; c=relaxed/simple;
	bh=k+iYdOEYm8ajI9FFUUI9J2YdBkGW8M5C42/TMvXJXdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M2iQ+VUvO0fAoPl7TUVm6GTS5vDhyrJzIj1LHcA40ZV3ozqPzf7Sv4PiUYjoGL0y0Olf6Oszh7tVzeTFa0OyF/rWmTbXZeJhM0M/1VUQMz5Rx6QvrFNkrRvXWFzvZmrqeaFjpue5k15HvIUpzbXQwdyz70MxCM0KLlMyVpQIT68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtoNbnST; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtoNbnST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30EC1F000E9;
	Mon, 29 Jun 2026 23:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782776366;
	bh=67dpFiB0kL9pIl9TBkme+FUeDED8hep10aAU/lEUSbo=;
	h=From:To:Cc:Subject:Date;
	b=CtoNbnSTnfabIKnUEU7HEINZIj7AXriYLm0QMB/Q4wfAVsqrnpdYeO1PmIc6Xi+oH
	 uXeves6Bq0qoPpUOAR4eps1iheedv5tA3s0rJVuGep4UKMpboEgmCKgeuEhX7K6L/g
	 /Row6B1TVTYZW70AwzYdZKmEeM65y5FFEifxxhByQ91NbYfhDkOQLUOVIU/BccIFaV
	 G4XSHiCGJKe7YPOoEDF1B8qDlQn0iN4OkS4y0QLeP7at0id41QD9/Q3ZKHIJ2gO3rq
	 R0BN4ffw/fi8RSVNkn/Qn0LQtFgJDmjRuBc92my8ItA5cjSuUrKxUwF/530YNKrxK5
	 L+3kOpSZzJ6bQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org,
	daniel.zahka@gmail.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net] selftests: drv-net: tso: don't touch dangerous feature bits
Date: Mon, 29 Jun 2026 16:39:23 -0700
Message-ID: <20260629233923.2151144-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

query_nic_features() detects which offloads depend on tx-gso-partial
by enabling everything, turning tx-gso-partial off, and seeing which
active features drop out. Enabling all hw features is dangerous:
we may end up enabling rx-fcs and loopback for example. For the
ice driver we end up getting into problems with feature dependencies
so the cleanup isn't successful either, and the test exits with
rx-fcs and loopback enabled.

Scope the feature probing just to segmentation bits.

Fixes: 266b835e5e84 ("selftests: drv-net: tso: enable test cases based on hw_features")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: daniel.zahka@gmail.com
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/hw/tso.py | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
index 1b789fea8929..802bb4868046 100755
--- a/tools/testing/selftests/drivers/net/hw/tso.py
+++ b/tools/testing/selftests/drivers/net/hw/tso.py
@@ -187,28 +187,24 @@ from lib.py import bkg, cmd, defer, ethtool, ip, rand_port, wait_port_listen
         cfg.wanted_features.add(f["name"])
 
     cfg.hw_features = set()
-    hw_all_features_cmd = ""
     for f in features["hw"]["bits"]["bit"]:
         if f.get("value", False):
-            feature = f["name"]
-            cfg.hw_features.add(feature)
-            hw_all_features_cmd += f" {feature} on"
-    try:
-        ethtool(f"-K {cfg.ifname} {hw_all_features_cmd}")
-    except Exception as e:
-        ksft_pr(f"WARNING: failure enabling all hw features: {e}")
-        ksft_pr("partial gso feature detection may be impacted")
+            cfg.hw_features.add(f["name"])
 
     # Check which features are supported via GSO partial
     cfg.partial_features = set()
     if 'tx-gso-partial' in cfg.hw_features:
+        seg_features = {f for f in cfg.hw_features if "segmentation" in f}
+        ethtool(f"-K {cfg.ifname} " +
+                " ".join(f"{f} on" for f in seg_features))
+
         ethtool(f"-K {cfg.ifname} tx-gso-partial off")
 
         no_partial = set()
         features = cfg.ethnl.features_get({"header": {"dev-index": cfg.ifindex}})
         for f in features["active"]["bits"]["bit"]:
             no_partial.add(f["name"])
-        cfg.partial_features = cfg.hw_features - no_partial
+        cfg.partial_features = seg_features - no_partial
         ethtool(f"-K {cfg.ifname} tx-gso-partial on")
 
     restore_wanted_features(cfg)
-- 
2.54.0


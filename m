Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D6C585960;
	Tue,  8 Sep 2026 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885862; cv=fail; b=HLEgtL20VBAV7UiAunkU/DyuSm1XDjpgpDd410MU0p8SfkMnhvUe7fHSWoP1X7CqAlb2kyEtE7EMiKoW7T0Scc70BDNpEKG3Cjcbahe0mAlMVW7VwzcUDZIjsT/sJLaWjdB3AiwHJlZzT+RKz7THns9EaWNyS/k0H98w84yoEt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885862; c=relaxed/simple;
	bh=bWUXbarXNzT6hBpdmRQdP1TfLYdeHstzoOfB0tC5nkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IB5LTDMhmcNeb5r3caJY+bVABes3mQU0aRlM0DzocAJRmRkXmHSg/sxCFuQl73Hu0HMWs1Uupmir6CSliEpQaiBE2sZxEFQeNMfIhyfzvSX9nxHX7bZcTTP6+A90abxwxim/a5VLUji2mm+9cDsAAAqT7QT6J7b+rKElJw9pl0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Zr8YpSSk; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Zr8YpSSk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1eUFVUdiGAJ8XcPfzRxOk5is4lSlAMP8Aytdp2yvafPiz4HHnO/68sAjbTGCkr5PF6AqOLbOYMrScJsBbQNciNoIwC9xHIeMwiIxGKt2vg8WBYaVcaAKWY3AKfAX6O+A33gkhlK9E7t3EZ4GxDS050tXF6vcfXepcapAkz6Qz7naZNx28keVupmizxIcAgdohgZss8oiTzo0ooEk8MROaxz8FXet0saUx+suG316zhITxInZ6aMzaRqPM24Kxjsd4VV7V20JNQ1tmXVbTVP/KheMoRk9T4zd6u4r/RwFIZ4I+dUJ4FMV1YbQGtbIHdWOGqw+S5eGy3V6+iQa1aL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWAD8qw5BaN/waNwxRr5RIrv8DsM0KLGkweaYwneCbg=;
 b=aYoBTJCJdx2XDgpYRgzmvFgqQJ3MGqNi1a8AqwZYgpiszIq2uwWjTx/oSfARWyO//u5QpeWaL9kWFWaF+9P2bKsK7ON/irRQaA9telF7t4qnLu1ciz1rx8eStFDMkRGHZrEqIfoOmRqDkBWZpN6DYBLbWNFVscwiBTCgzvCC0gFelecCH+O/BroH0PcYT5K4nmdbfMkZS0JdLi+inK1faXPuZN488AuZUO8i34EQAz540JTNUC8SAmzRm1GCWBTwWL6ThHSg7rCe05UpjmqoJT3zoMbJPyRVy2PD6/E8Zzom/lNWXyCnPqLeHQGjOOXue8eQV5Fq+pFg+MwxZ3abgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWAD8qw5BaN/waNwxRr5RIrv8DsM0KLGkweaYwneCbg=;
 b=Zr8YpSSkZ33tj/BERxtY/LG7zVR6uhHO+zmQNXj5D8XUzxhaIZ9w354eGpiZGmY//72c9nnOqYbdbKVxektuGeEAcUiRJipsoY9PpAShhn+ZhchQfP1ECS+2FFalYh8gArfL9KPiU21NP0xi2OLA3pyry+aMYqPfn91f2R6kgfo=
Received: from TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:7d::8) by
 OS7PR01MB17560.jpnprd01.prod.outlook.com (2603:1096:604:443::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 16:44:16 +0000
Received: from TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7d:cafe::8d) by TYCP301CA0063.outlook.office365.com
 (2603:1096:405:7d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 16:44:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005622.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 16:44:15 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.55])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id B178B30001C0;
	Wed,  9 Sep 2026 01:44:09 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	recv.jo@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shuah@kernel.org,
	joabreu@synopsys.com,
	yi.fang.gan@intel.com,
	jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v4 6/7] selftests: drv-net: Move _set_ethtool_feat() into lib
Date: Tue,  8 Sep 2026 16:43:08 +0000
Message-ID: <20260908164309.59282-7-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005622:EE_|OS7PR01MB17560:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 832820ef-ad43-443c-3b56-08df0dc86b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|921020|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WXQwnaIArYSnWPaUGzZuTDsmzoCf05kh2zDFj9WRlhzAYnDtOLvtM+AurXP7mc9kU4L//tJGmMDFv71Ny8nAo4F1lsdlc85Z3fS3sPui04QYJeUDoZNE89CKpb+BiuTeDO6QCErzzdKgAsdPpSp+8q79vtbFjWn1yUXF1ogqcSqUSMQzSEBSkGa/YAXX7APILCU4ENSvotTS9Xq8IO/DVyxX9hyThE3+LvcsZuQKYP3s4WV5O9SM0tRot86cltstu4iyBbtoxVOZhw5FQlX6hKdYI2gFwr+H9t1uFqRtJZVQ1fFEE6f9KH13WeMthlUlF/gp/ShbecgBZRJ1kdTMXsNGxkWr6dd2m3DngUwj3KryjqdHxPITsHSC6IJ76QmSEVlO8jMzQglwKFw3CC3Z0jucD0AIFptTVwNRCXFlADu8jdpJ0UVbVW/K9Ak55fqbMk+LlTL9z2QOO0OIWaiGdpAsCKVQuW7ZE9HIkvEXvGtyvtfQr0yZLCAJhqV/3OGK7nvMIkyUncGH6De1htqfcRMgaf2Bnk/diS5IZh/GrYnksxlay+IUnZ8aXQI3TQoSXDbVICHcqOFHGdnJJ6qklZd28z0kevVT4rSIOxJUYNPi+8lTQ9oz/dJJY9Q49nom7ilr7athuxIeCFq01aW3OdS6yeDrN2M+8NVeP7w6F6d3PQvnFe6xJEjt9wqs//cMzsd7DChmoSRhosvyX3PBhHFcwOI1nsfzPF0WsVqOffS2YDgnHjPH69vx8VEtxYyO
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(921020)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fDanfeSoWNgSSnsrVvigQ0+HlGiugkeAW2jG4CR/CdkXDAre/T1z/dtjIgK42VeJLUPtKmMQ7Sy7sN/Wa51XrmNf+Qi+dial5eVZr1/26erDWFFYNbYhHI55fPkKMKz8kAgRj+c7ceo1VttabZY2aryrzSawmgPbCFsr8S6n6GAM8R1LRnNHEO0XdDz6Gi7pgW0vgjCKCVR/NieN38HrL5ZNj0TdgOWSA1oF83ZEMobr/7TpwIx3ht/nBceRfvNLPX2yIZqNeBHiHDWF9yUEvfB8Kv4PS5o18KvZjmMnBWYPMr9hnPMYo115FGlZ6FdCXd7jGHLgkGD4Ozj5BNoB1eeFhNCdHHs28jnBhA/2yCLV0FYOzKknVqXaHeE1x/dSByM2BoEZOTEoMdIi3jiknd7tahL3R5wHukfAWXjCqF6fvLkkZSHPb0W4JBB4D3Wp
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:44:15.4572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 832820ef-ad43-443c-3b56-08df0dc86b52
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17560

Move the _set_ethtool_feat() helper from gro.py into lib, so that it can
be reused by the VLAN test added in the next commit. Drop the leading
underscore, now that the helper is exported.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v4 changes: None.

v3 changes:
- Fixed "ruff check" and "pylint --disable=R" warnings reported for
  tools/testing/selftests/drivers/net/lib/py/feat.py.

v2 changes:
- New patch.

 tools/testing/selftests/drivers/net/gro.py    | 65 ++++++-------------
 .../drivers/net/hw/lib/py/__init__.py         |  3 +-
 .../selftests/drivers/net/lib/py/__init__.py  |  3 +-
 .../selftests/drivers/net/lib/py/feat.py      | 35 ++++++++++
 4 files changed, 59 insertions(+), 47 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/lib/py/feat.py

diff --git a/tools/testing/selftests/drivers/net/gro.py b/tools/testing/selftests/drivers/net/gro.py
index 6ab8c97880d1..051a3b2d0ead 100755
--- a/tools/testing/selftests/drivers/net/gro.py
+++ b/tools/testing/selftests/drivers/net/gro.py
@@ -42,7 +42,7 @@ import re
 from lib.py import ksft_run, ksft_exit, ksft_pr
 from lib.py import NetDrvEpEnv, KsftFailEx, KsftXfailEx
 from lib.py import NetdevFamily, EthtoolFamily
-from lib.py import bkg, cmd, defer, ethtool, ip
+from lib.py import bkg, cmd, defer, ethtool, ip, set_ethtool_feat
 from lib.py import ksft_variants, KsftNamedVariant
 
 
@@ -96,31 +96,6 @@ def _set_mtu_restore(dev, mtu, host):
         defer(ip, f"link set dev {dev['ifname']} mtu {dev['mtu']}", host=host)
 
 
-def _set_ethtool_feat(dev, current, feats, host=None):
-    s2n = {True: "on", False: "off"}
-
-    new = ["-K", dev]
-    old = ["-K", dev]
-    no_change = True
-    for name, state in feats.items():
-        new += [name, s2n[state]]
-        old += [name, s2n[current[name]["active"]]]
-
-        if current[name]["active"] != state:
-            no_change = False
-            if current[name]["fixed"]:
-                raise KsftXfailEx(f"Device does not support {name}")
-    if no_change:
-        return
-
-    eth_cmd = ethtool(" ".join(new), host=host)
-    defer(ethtool, " ".join(old), host=host)
-
-    # If ethtool printed something kernel must have modified some features
-    if eth_cmd.stdout:
-        ksft_pr(eth_cmd)
-
-
 def _get_queue_stats(cfg, queue_id):
     """Get stats for a specific Rx queue."""
     cfg.wait_hw_stats_settle()
@@ -247,15 +222,15 @@ def _setup(cfg, mode, test_name):
         _write_defer_restore(cfg, flush_path, "200000", defer_undo=True)
         _write_defer_restore(cfg, irq_path, "10", defer_undo=True)
 
-        _set_ethtool_feat(cfg.ifname, cfg.feat,
-                          {"generic-receive-offload": True,
-                           "rx-gro-hw": False,
-                           "large-receive-offload": False})
+        set_ethtool_feat(cfg.ifname, cfg.feat,
+                         {"generic-receive-offload": True,
+                          "rx-gro-hw": False,
+                          "large-receive-offload": False})
     elif mode == "hw":
-        _set_ethtool_feat(cfg.ifname, cfg.feat,
-                          {"generic-receive-offload": False,
-                           "rx-gro-hw": True,
-                           "large-receive-offload": False})
+        set_ethtool_feat(cfg.ifname, cfg.feat,
+                         {"generic-receive-offload": False,
+                          "rx-gro-hw": True,
+                          "large-receive-offload": False})
 
         # Some NICs treat HW GRO as a GRO sub-feature so disabling GRO
         # will also clear HW GRO. Use a hack of installing XDP generic
@@ -270,27 +245,27 @@ def _setup(cfg, mode, test_name):
             # Attaching XDP may change features, fetch the latest state
             feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
 
-            _set_ethtool_feat(cfg.ifname, feat,
-                              {"generic-receive-offload": True,
-                               "rx-gro-hw": True,
-                               "large-receive-offload": False})
+            set_ethtool_feat(cfg.ifname, feat,
+                             {"generic-receive-offload": True,
+                              "rx-gro-hw": True,
+                              "large-receive-offload": False})
     elif mode == "lro":
         # netdevsim advertises LRO for feature inheritance testing with
         # bonding/team tests but it doesn't actually perform the offload
         cfg.require_nsim(nsim_test=False)
 
-        _set_ethtool_feat(cfg.ifname, cfg.feat,
-                          {"generic-receive-offload": False,
-                           "rx-gro-hw": False,
-                           "large-receive-offload": True})
+        set_ethtool_feat(cfg.ifname, cfg.feat,
+                         {"generic-receive-offload": False,
+                          "rx-gro-hw": False,
+                          "large-receive-offload": True})
 
     try:
         # Disable TSO for local tests
         cfg.require_nsim()  # will raise KsftXfailEx if not running on nsim
 
-        _set_ethtool_feat(cfg.remote_ifname, cfg.remote_feat,
-                          {"tcp-segmentation-offload": False},
-                          host=cfg.remote)
+        set_ethtool_feat(cfg.remote_ifname, cfg.remote_feat,
+                         {"tcp-segmentation-offload": False},
+                         host=cfg.remote)
     except KsftXfailEx:
         pass
 
diff --git a/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py b/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
index 8a58cb17cc06..eea45d01cf7b 100644
--- a/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
@@ -31,6 +31,7 @@ try:
         ksft_setup, ksft_variants, KsftNamedVariant
     from net.lib.py import ksft_eq, ksft_ge, ksft_in, ksft_is, ksft_lt, \
         ksft_ne, ksft_not_in, ksft_raises, ksft_true, ksft_gt, ksft_not_none
+    from drivers.net.lib.py import set_ethtool_feat
     from drivers.net.lib.py import GenerateTraffic, Remote, Iperf3Runner
     from drivers.net.lib.py import NetDrvEnv, NetDrvEpEnv, NetDrvContEnv
 
@@ -49,7 +50,7 @@ try:
                "ksft_ne", "ksft_not_in", "ksft_raises", "ksft_true", "ksft_gt",
                "ksft_not_none", "ksft_not_none",
                "NetDrvEnv", "NetDrvEpEnv", "NetDrvContEnv", "GenerateTraffic",
-               "Remote", "Iperf3Runner"]
+               "Remote", "Iperf3Runner", "set_ethtool_feat"]
 except ModuleNotFoundError as e:
     print("Failed importing `net` library from kernel sources")
     print(str(e))
diff --git a/tools/testing/selftests/drivers/net/lib/py/__init__.py b/tools/testing/selftests/drivers/net/lib/py/__init__.py
index ee903bcf3207..c261aac2b976 100644
--- a/tools/testing/selftests/drivers/net/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/lib/py/__init__.py
@@ -48,11 +48,12 @@ try:
                "ksft_not_none", "ksft_not_none"]
 
     from .env import NetDrvEnv, NetDrvEpEnv, NetDrvContEnv
+    from .feat import set_ethtool_feat
     from .load import GenerateTraffic, Iperf3Runner
     from .remote import Remote
 
     __all__ += ["NetDrvEnv", "NetDrvEpEnv", "NetDrvContEnv", "GenerateTraffic",
-                "Remote", "Iperf3Runner"]
+                "Remote", "Iperf3Runner", "set_ethtool_feat"]
 except ModuleNotFoundError as e:
     print("Failed importing `net` library from kernel sources")
     print(str(e))
diff --git a/tools/testing/selftests/drivers/net/lib/py/feat.py b/tools/testing/selftests/drivers/net/lib/py/feat.py
new file mode 100644
index 000000000000..014971c82b4b
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/lib/py/feat.py
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Netdev feature helper utilities for kernel selftests.
+
+Provides common operations for changing device features via ethtool.
+"""
+
+from lib.py import KsftXfailEx, defer, ethtool, ksft_pr
+
+
+def set_ethtool_feat(dev, current, feats, host=None):
+    """Set ethtool features with defer to restore original state."""
+    s2n = {True: "on", False: "off"}
+
+    new = ["-K", dev]
+    old = ["-K", dev]
+    no_change = True
+    for name, state in feats.items():
+        new += [name, s2n[state]]
+        old += [name, s2n[current[name]["active"]]]
+
+        if current[name]["active"] != state:
+            no_change = False
+            if current[name]["fixed"]:
+                raise KsftXfailEx(f"Device does not support {name}")
+    if no_change:
+        return
+
+    eth_cmd = ethtool(" ".join(new), host=host)
+    defer(ethtool, " ".join(old), host=host)
+
+    # If ethtool printed something kernel must have modified some features
+    if eth_cmd.stdout:
+        ksft_pr(eth_cmd)
-- 
2.34.1


Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0C938DC72;
	Tue, 25 Aug 2026 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787676400; cv=fail; b=VFR8M/xGmmE3874NGKA+4aztSeDukW3t2WdNuXGygBMPjCPeW9t6dpXMzPSfgX/RzDCFM+nvEjcYiiQkZxU9ZBg0pWdqr7rVcIhLn7LaKJZGRfOkkpIx0TdX7ggUDVCGQqNwjdHAMsYlNcYEeDzNx0vUNiQplvIWfNP8IVbb5tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787676400; c=relaxed/simple;
	bh=5h5FvXA+UxgLS0/+DGOJZbW/sT2HqlT/5JX+eRL9Vls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sgam95ySOiRI4VnVhLncJqrZS0SIVGJVJy/V3iEqPwgSSgvKg8Bo+Vz2p05PpY9fNgWbbJAb6VxrxNPwlC4tj0IBbwc/p2cAWoTodeSZWL9jRtZL5iZFBbglptBaaQFYvpvzla66r94XbW1xeYuNjs8lC/FnxZITJcwDg7xZ2/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Seg/CloC; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Seg/CloC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+TxYjSySrZAtLLJZj8u6Tkc4bPlx6Te3Z4axGOG8zYgBRqjq8gD3AHEBhfvwNUWAeB7QctSrMx2mxpfJrb77ZCEmR9Jn/UZvaMW46ks/1yRPng0i/q4q/5s32HxqwsqVB21Z22Nu5tbkYGp1XU6ovWtiRVDlgfML21qtv1VF4feNMDhp+5uAvZySVz614EHyTo/DU6IRzS8yhGHHMUGYzOizbg4QLS6knWPeQzFJwuYgaJtWea+B2cFRl+179fhHulOyG3FEb06vezyRXZg90uI/LDuyey8h5mLbGWN918dBWZrUWxi0bvuIpZeCxvqCYle/glnEwDsBN23xVAl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yN0oMMVZ6d1L75Tt7a/vpPtRu0nikbw6SOMWFjR4Ks=;
 b=f+IPheJB0jPLsBLUM45Z9WEJYj5TwjvG/apb/JWeAjO7XZmafIJlrZ9jeMkAGSMZ7W8NsJiu2wW6RNmk00REDS+3AlfbfKo8edu3bCWWIQW3v1j1rFFVtRn9eI1cUt723qj2iuzWiFpGII5DFwnlokFn5QOAd4EO7YMZymJ24MJJS4zstXPTSXZXh8iNx0MawLfLx11o1G3soEWz8B7g9JuGfMdjFPffuGJtjItwB453cyvjCjcfWuNmYyoIPFTXhnRxTDbC/QAGNiW3HWnZDQ9DLjN7IhCkMrSHePzxpl37JQkQsSJ2PJuExOoWBKKmTE/PF2Vb8roO1LmvyooaYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yN0oMMVZ6d1L75Tt7a/vpPtRu0nikbw6SOMWFjR4Ks=;
 b=Seg/CloCOeNmc7qy8qVtP/roIzbTmNGJPOnTzhBbPw/R4IKmtYv4Q/kou98Jb1YxdlYcpoDDY98TD0BpW0sVXDPd5rDLLz4AuKfvz8SyDXLdCOjCwcNNDjP6G2eIleojS6DcC/5/++eYz+WVGzbS1qKUJ2tXPSE4b4RdT8J4Ptc=
Received: from TY4P286CA0090.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:369::17)
 by TYYPR01MB7736.jpnprd01.prod.outlook.com (2603:1096:400:118::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 16:46:32 +0000
Received: from TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369:cafe::91) by TY4P286CA0090.outlook.office365.com
 (2603:1096:405:369::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 16:46:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005622.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Tue, 25 Aug 2026 16:46:30 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.185])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id D1C7930001CB;
	Wed, 26 Aug 2026 01:46:24 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shuah@kernel.org,
	joabreu@synopsys.com,
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v3 4/5] selftests: drv-net: Move _set_ethtool_feat() into lib
Date: Tue, 25 Aug 2026 16:45:21 +0000
Message-ID: <20260825164522.4244-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005622:EE_|TYYPR01MB7736:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1c558dcc-e576-43df-105d-08df02c86a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	lnQG2pn8PXTXNmf88ldkNxV6YPE4jZpPGQhbEOPY68EMGVTHiw/02TwfYdWPgzi4OIXrKQyz/CYZMgL21p2W9ddNf9vxkjaxK55Iupyd9yuQ7WHmfdOP1c5MV43+F/jqRXMLQ1Mvxuc+BCq5vFeZFDedtryhEEDi/myvnIvZpeQdvfeJGRK61fS1Pk/28Ff5Tpo31osGDHZK+cDcaSe5VcmF54mf4D9w2NT9ch+Vq5o6KyJpWcHic4wLu4gKY5PV9wHFS/0h30yleGkVXDOKw2fxdSV+4f0KHUl+47QJduGOI03p5hxNy+M6v0ub9X6qxBlq6nxkNPTznKOnrEB3HKMFDftfdp0S27f8rfjZI+jbxjt15WcfR6+sZNxZh0FU8VLgIYwVMowqeSjTofvAcWQyrpzSd9xzq2P9Ol+QKGQiGIt0MKaJmOkgUXQqe5evLkWOc6UZzOAD03lxjkUdbeUPwzyy+87iKKk2JYhjs93jXuGN3IkrtlI/rjotnDUPFM3RR2bUX0kChXgNLuERd4f/ZRBesvN36GD+EquFU96q4JItyOexvK+3Lv7kIP97sT3uwryEr3qOjqcWc8wAFizoopRboPuELaD7qTANYu4sC+FwElzwPq8E90yfYl4i+TztQJr5XatAZdi2IO4so4li+F6KyIMK8dzjrT0PpEW23vLIkgjfeDAwQ66rMi7qi/nTP6462f+7FdvEbXTDn/c4U29QfIHSkR+5wQ/YRl43N977BB0+qjOTZv10dJ5U
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F1BzNOxZM2IAXitJR6jx7Om08Z9sZEldGzE4zVSqICioUcy6s+G8BcWGb8ntVwYWTGC3o498MEZITlbtE/+1e09/1AbL98CtPqhlUlH57BNXWLvOJxkWCMsRrOaXThDyhqocYmJlH2l9uoM8oAtQ51iOs2k/hr5AO8VOspjbZC4lefiFEw8jUzdDiRoxH6dOML5Ixrg+18R9Z81qi6qaJMbA0KcPcNmHz55VGI0yio1AHl+z7JsaSmLCTzn0zxyFfWX7OBNVq/yuu20AJQbp9oH1WTw1rpVyQzrBmIvM2BF1GjcP7inSTm4KTCXYhsR5BfrET1D/Aps/uRd2ck8juxkmmXIwGiKpM/iGfJDqvqWzQw9AZXtQSg5m01iOe/PvkcnXmyTMD5VcBqtde+kI+RnNFBx7ehoWdPn/ne1+WVT01cFmLTaByNVvFdrj8e57
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 16:46:30.5618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c558dcc-e576-43df-105d-08df02c86a11
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7736

Move the _set_ethtool_feat() helper from gro.py into lib, so that it can
be reused by the VLAN test added in the next commit. Drop the leading
underscore, now that the helper is exported.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
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


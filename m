Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593EC381B15;
	Fri, 21 Aug 2026 17:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787332247; cv=fail; b=TE0pb0LDTJtJLeRNKdbFQFGpP4QxqzACfJOENeHnPZx5+h/hfWB4sGFKZfAKl2Jl6VabAPEx6y0FNdFHrxr78lF5zyVr7uMfDTZWn9uZVAHX7obnP5PGAN+/ypIf5eD7pOUJq8N2bqUKUwQUPJw8X5PVQqlG6hifCzxucpxvyKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787332247; c=relaxed/simple;
	bh=AVb5X/hQ5E3MwHkIsccjUzOCnMaVHIhBsq1EOyyeyaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CwaoqeDlNpf9aEUv8d0qk1HfGSafKlkQaKlM6UEG1QeNuIV/mAKBUGc07efwGwlnxEKqyVAGRLfcfVOXLSpkvfsrIwZ8pqOJdttLmW+trwB2RZyEoUKkPkjzK7oHuz5G3MhpNj2sz7n2U3pCDW7yuyaJJ8jTe4ooe2bI0GVJpdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RKr6M2lC; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RKr6M2lC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8vXDnhsebZLwmknDwrrfHfDfPiHI9GGM/UU+bJw/kaPJH3AyM9OzWCDm3Nyc3AzNbFxorNeF2bcUijLYKiHXdUPv5Prx085BZX/aKjhhSASGWaixXFBEPp3mWKqHdkHq4Jm/qOUtPILFJBgdHZJjamwaVTkSdxjyABqkdyHBDCzsnfrQEQhgBKRFKWzXgozM9XAKccdvNQR5vJcckDKzEAw5g3EGNtqKMF3N36snTbeb8kJddneACfU1RjB0du9Hcj0psskbsXUBIwAnLz26VRDCyGxt+wDE6P8MtyD05wAlt4X//pnXQK8M70oYzsgBCAgF3lHH69dmE8YTGJ+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcpTrhg3lW92t7EDN5F4YzBdgvOw/eo+jCajvRhWRvg=;
 b=ZSxbTMcjvOfkgblma+13RkfKL9VVGFBNdK3GYxzXdGeU+9gwqaIlDTRsa1LIQzP2VHrEsxU9Moo9AE+gmmRb7XIyXOuCnKfskRT7GOyfotYq/GZ0Y/xUhvn2andGY28c8Ilg+J29KIhpKXN1Ya5mnX5hwGwIpY+7UKVJf/KOOqIFjjoaSOqIZ1LiQBFZ/ubh9Xruph4rAmVoGbdnC1tY61MjXt/3ThDAOQwvUk78JCmaC3RlKKRJICsJCFlIWR2V1gDB4/x2pw7OzJE2c/xNyGdCpB9KY/hDDfJqNG25dIejKzlfdoFM9cAv2V1LCcQCtw/oiRG39EEMH53bk2uYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcpTrhg3lW92t7EDN5F4YzBdgvOw/eo+jCajvRhWRvg=;
 b=RKr6M2lCS/wDuN52HNoaMnGSROWUje4Ax4NUGR1dyS4OH98W8eYjcFgORpFPWMntf+mUoPuYtygIq36qBfGEAiJOnIQk9EqYi55ZbZFrve3L8n0ZYIVZc1JLeR6noqKm5ULdbeylNiX8IvdCLduKEy7UGio6GOWvmlaZkHvhufs=
Received: from OS0P286CA0009.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:9c::14)
 by TY3PR01MB10268.jpnprd01.prod.outlook.com (2603:1096:400:1dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 17:10:40 +0000
Received: from OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9c:cafe::6c) by OS0P286CA0009.outlook.office365.com
 (2603:1096:604:9c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 17:10:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20E.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 17:10:38 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.76])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 4956630001FA;
	Sat, 22 Aug 2026 02:10:33 +0900 (JST)
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
	yi.fang.gan@intel.com,
	jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v2 5/6] selftests: drv-net: Move _set_ethtool_feat() into lib
Date: Fri, 21 Aug 2026 17:09:58 +0000
Message-ID: <20260821170959.79708-6-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20E:EE_|TY3PR01MB10268:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f0615b32-07ab-4958-5fdc-08deffa71fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|23010399003|921020|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i6jbElQ9NeB9JQga9zf7sRD4dyhkPcDeEYFL2pHbrjGsv6AZbu9hl2IzDT0BICBTHfmVQXHHzz2q1gzmX1fanuTo6MtTJBYlzfrtylRU1/jgStSqRUFyNKVAMOus6YA+lCmKQhkCI2tpho0nc2wkjCWa+sgYP0CG35nNaRwggFsYv0cIembORfJ1hJHFpSexJhqSDo39bdJXa9oTWZj5rjfEhQTkxbQfWUrnCWv4UhDaNWUG4JJdv/LJojGKkDfpUzq5kHlxhNQMN9f0wHS5L7rr9ysCP1HJqZY34BrCGaq8DQNsM0Z5k6g/sZ0TlDuin1+qouWf8oPDNI+jMwJjCubR+Yw5TbF+mYJbs6aOIzT2tscfMLEvd5NdIGdALa4D7BXLu2tzAXdsCs5qSQbel9RSGH3LBeABM/2sJFVkVkpZ5Bz8yuuJ+VYyvWr1tZ9npROVq0Y/9MVUg+zZUodlNBSxLvKNaxXJ6R5lhVqJWW+lSHvXXdWy91RgUbLJLVwUGc+mGsQsv8vYzZWK60T2LLU66xV37BAIobfVSKoFVMOhhdkWoYz9GErBmpVjHK7mOmDyDTqtzz0Wf4qXImY2kIaw1iPMV5HLoXVjh3nGwacxTCIfOPgyYDGa25VPN71Q6IyXkAeR6d+ZZLtrUPVB1/TJZeEf9jgYeRRnhRcjJ5LHiYS8leGfAFjNIfeFzZyj/O6BabelnBKI/P5Mr1/Kj3cjtZM8UG7+BZ8m8cCbwBnyQ90sIDclqaLHBw52YQMQ
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(23010399003)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w/lacDwlWE7cpI1IOIanMqhFXY79OqWUT6JdQAF7X/0jkAcy/8tSEU+G8HdXUiP4R+pwCla6t+5y3eFgbDxNC/HEDo/L37EclfAJ/lDC/WRMM2urc4L/4dwef3+xB21crUUFvtfRSbxcjzG50Y/X4pQg1FhaD21kJNdF8Rw8kyijWmqcId6rOQMRPZXOqk+JlSleQ/UFoyrfx90lbPF9Uj4Jb88b6CBnFLa3tF5NELfveugCUdklyPyPG+TSwVoyOPCWftHEan/PxZW+HpJybBG4/95S2EkaqKJERCEb8oQxjcecgqnnCj+abyf1koXAfIifj6B0+yQPRIz3bdI95oIkkjuabOFrsYHlYJlBTQlc1mdil190x7/RVqu2VuD10eYP3vB/TTVm58aOUw9tzMXZ4JUGkldOn3cRMKjPb8rGfTZY2Do69kLEeo+DIyAD
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 17:10:38.8710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0615b32-07ab-4958-5fdc-08deffa71fae
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10268

Move the _set_ethtool_feat() helper from gro.py into lib, so that it can
be reused by the VLAN test added in the next commit. Drop the leading
underscore, now that the helper is exported.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes:
- New patch.

 tools/testing/selftests/drivers/net/gro.py    | 65 ++++++-------------
 .../selftests/drivers/net/lib/py/__init__.py  |  3 +-
 .../selftests/drivers/net/lib/py/feat.py      | 37 +++++++++++
 3 files changed, 59 insertions(+), 46 deletions(-)
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
index 000000000000..33b4895059df
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/lib/py/feat.py
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Netdev feature helper utilities for kernel selftests.
+
+Provides common operations for changing device features via ethtool,
+used by driver test files.
+"""
+
+from lib.py import KsftXfailEx
+from lib.py import ksft_pr
+from lib.py import defer, ethtool
+
+
+def set_ethtool_feat(dev, current, feats, host=None):
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


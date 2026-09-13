Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C573F4105;
	Sun, 13 Sep 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310416; cv=fail; b=IbjNLf4KpoZQTTv3xzKLF+T5mUJ98gur6A3hMdqKEdXLKf/c0URRHcZPdf52BlzsFY0bVw2cm9Xgr/frYdGGnevWijWtUxZURNz50BcJKTXWblb7hJpB5ULVCsotuFpeWYvETkBfsF43qoJBT5n8KiElKJuioPKTiK6JlNZIPsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310416; c=relaxed/simple;
	bh=7zlnCGu34tNz939RA5SikChEg4jPdtPa8cCIk21j340=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=exg575TUdgLH2Zf6T07HydZTFHS1S5ur2F2+VIqb17wngLogBbYX7NCPS2EFc/PKL0V1RrdbkOGuaGeXpk8Ig6fzDCWGyPnQf/2ZWH49n1mJ7YHdKPEblePirfl8+Fr1pCze2HoJEJKHTsC99qAcM3TTdfhN5RUp32B+ecKbWhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n6ib19JV; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n6ib19JV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljp6rJmflXYJlp2p6e4F1E1G0V6Hnm5Ler/UrhBX4LAZP6CNF5mLlvgHxXvA8uAt4s0JuAzNZs1qYQ8Ex4kzTNparXxsRN+0xwGclU8+fqToYuoJ5FV9VMg2Ig6tCQAAMPM2muKB7z+b4CDiKxi42NjFgCRTQsWmotUry/kfy/X2GnBlUm08008RrkuQAatV6DoZR4H05wyG7i9OMspsMi8Vv8nHHWQ1c2zQ9AfIrFsb/bhgTTkghA/loYlTTuRdqXkSX8rmWuciPmU3/MMedGs83sjDP+76dI1pExXkdP/baL1z3sQ+r3skZRL80nz8Ub0V4sAd/4xLcZoHTCxHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOAbmkf5F5WHTinnD7OcK9ffEHYi1r2F55pKGAX7YTU=;
 b=b/pqP/w11XQgNvnAcaCN98fcH0adqENUaKT6t53Ww/8eP5pPYJ/JO6wKRjGCtnPgh5UaducjRVLwVrwRov4C25CNW5nmtntqoAniKhkse64ZE/RpBT9iPoWtznWsnR/ls/OwGJFkNk2PHZYCZDO9P6QDl1Oo35+Wk9SF8yj2Jh64479uq44KFeq/Mbn/1fNjnmu2VdAl/ra8WG9/ANiQMkkmD2rQEuWwlqfbfdlwgTpL6jwkfKg8+qcEpXhI2vc0gZRvHPlxJihlIPPDUquMxy6RE74Q/jjBjKVFgy0JuW9lu8lK/J6q1eNAmio6hgepZdeXUDi4ssJnlTQgNdFFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOAbmkf5F5WHTinnD7OcK9ffEHYi1r2F55pKGAX7YTU=;
 b=n6ib19JVSZ7ApG+yH26CvtvT0cyYYyRXbN9blLXSQt1kPIq5g50exv5SaItqNYytLN+Wj8D+NAkhtzcjFhNU0x2lApwTX5OPbk4irD2rFNiLZoWgabp8SFpVfgqVUR/nijyF63vMqGjCGwsoD37r8WiwYDWlD/kw6GKUa3YHXt8=
Received: from TYWPR01CA0028.jpnprd01.prod.outlook.com (2603:1096:400:aa::15)
 by OSCPR01MB13441.jpnprd01.prod.outlook.com (2603:1096:604:334::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 14:40:09 +0000
Received: from TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:aa:cafe::2b) by TYWPR01CA0028.outlook.office365.com
 (2603:1096:400:aa::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Sun,
 13 Sep 2026 14:40:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005624.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Sun, 13 Sep 2026 14:40:08 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.2])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 00176300024A;
	Sun, 13 Sep 2026 23:40:04 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net-next 1/2] selftests: drv-net: Move _set_ethtool_feat() into lib
Date: Sun, 13 Sep 2026 14:39:25 +0000
Message-ID: <20260913143926.77366-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913143926.77366-1-ovidiu.panait.rb@renesas.com>
References: <20260913143926.77366-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005624:EE_|OSCPR01MB13441:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 92b8ac7d-491a-43b6-948c-08df11a4e871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	MynKTE6zddyUINgXcSExvU08w7zuUC2Wk/toBAqFE3yuxSe6q0+oP8/w6Imq4nmyHjNiF7i2VWnluam+nAC54clvNerIDRMktQs26nWUjs/HhwzsHbX6IQ2OMboZvsEmhc4udIFqcMvQRrNVG8VWMcg/j/+v2Lk1wKt7FDq4gzgtzyafkuPnVVMdwmto7+GIIcpPRNwkkFeVRwEsvi7oInrCEtkN7LQ9dDKBnyQZosmUbDHL8oS2I/d6b8q87vd+TKTAE9v2hcMiLbaZcH35yh8BZyuLxMDynT9HONflw4LvfvJhrMGMcCvS8oXMde0mjhfhlTAX00vV89VTeLVujlfLcjAynD17TRX6ncd61wUYVYvtLXL5tmFZXSb0HfJ7Rkaoh1/Bl7eFoOWudomkde+8bqGORXC+CP/OuMOnbwW1agIaHuta22hQUnK1roUhg52IY1O2pR6K/tsGkoUZHA+pr40rZ4EPvaP9B+gHyzSdl5FTYnGG1JpwsSTogUQNxMSZKe/M4Ph2SyYB+MtKnP/fIGK8oeUyijSxx00ViVbJ3bwG2l38dk500U+1Hnbhr/yaag5fzNLhVIsd4K+nZFMyqlzmHuB/nfgQPsrnUyHwd54zR20U65673lRWIY6Q3+hxC+IBbjpFlOGc8A2asXbOG7rSoUnAD3BymlOFnkDArEEQfEPl1D1lnynH4AIqL1mJ6hPNn6tz2bt5IHmk3Q==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a6b40EmqOXo6xiFBTTVNGahGQoiWijwhVf5Nx+MajSXFjrg2CsDCElyWrMVzKMYUdLtYdpvxYgm3z8d+6fZuy30bGdRRuDXGyfRl5tTukM/yrSBTPNCdi1fgfv6WlgY1YojOy2NEk8AqNDyxrUvsqeiAFLqaCbNAPRZ8bauLLmUXrt6OzkpHJaX1DtkHonjBUAXWVjC9zhXYcq9AfdzXGD64jnGJidQ742+SWybzNvEGkUcmqaVYtFTg2AL941jWixaXgAjhiFUP4F1aDAuAiGIZpaTI11b4V/bNooD8wbtrhE8agz0YwNBrJGZR3g18NSBjCpLJtBSdDhz+4JpIuKwSsAgEdoi01Jh8ED5bVVhVtI59tMuBt1o7rrUxRJIq73D8+ujBMPU6FxjxHgwmQoGySoU8xtIhZrotNbiCu4n1fYnp3DUlhqU5y3pNboSn
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 14:40:08.1471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b8ac7d-491a-43b6-948c-08df11a4e871
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13441

Move the _set_ethtool_feat() helper from gro_lib.py into lib, so that it
can be reused by the VLAN test added in the next commit. Drop the leading
underscore, now that the helper is exported.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 .../testing/selftests/drivers/net/gro_lib.py  | 65 ++++++-------------
 .../drivers/net/hw/lib/py/__init__.py         |  3 +-
 .../selftests/drivers/net/lib/py/__init__.py  |  3 +-
 .../selftests/drivers/net/lib/py/feat.py      | 35 ++++++++++
 4 files changed, 59 insertions(+), 47 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/lib/py/feat.py

diff --git a/tools/testing/selftests/drivers/net/gro_lib.py b/tools/testing/selftests/drivers/net/gro_lib.py
index b7ac0660adc0..e9d373cf3483 100644
--- a/tools/testing/selftests/drivers/net/gro_lib.py
+++ b/tools/testing/selftests/drivers/net/gro_lib.py
@@ -48,7 +48,7 @@ import re
 from lib.py import ksft_run, ksft_exit, ksft_pr
 from lib.py import NetDrvEpEnv, KsftFailEx, KsftXfailEx
 from lib.py import NetdevFamily, EthtoolFamily
-from lib.py import bkg, cmd, ctl_file_write, defer, ethtool, ip
+from lib.py import bkg, cmd, ctl_file_write, defer, ethtool, ip, set_ethtool_feat
 from lib.py import ksft_variants, KsftNamedVariant
 
 
@@ -91,31 +91,6 @@ def _set_mtu_restore(dev, mtu, host):
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
@@ -242,15 +217,15 @@ def _setup(cfg, mode, test_name):
         ctl_file_write(flush_path, "200000")
         ctl_file_write(irq_path, "10")
 
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
@@ -265,27 +240,27 @@ def _setup(cfg, mode, test_name):
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
index 81e1d1865cd5..4077f5f1a1be 100644
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
index 591b1e6c7eea..40ccdcf0c378 100644
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
index 000000000000..b94a24214e59
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
+from . import KsftXfailEx, defer, ethtool, ksft_pr
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


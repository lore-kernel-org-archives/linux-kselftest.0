Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB36E3F326F;
	Sun, 13 Sep 2026 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310427; cv=fail; b=CYimQy/pbpBxJd8fLj/rLnuqJoXwBQ65VVFNAOPhzHyzWQbWhXvEhJAaAO6/Abs/pWPHZVfAINnW3tAKos4a0U5JG+JyKS476rpb1+N1ZZPMMz9aiB+n8NgYUlllryq5yjWPep9ENLwHuYF670b+YDrj58x3OSkKY2J/YQPgl+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310427; c=relaxed/simple;
	bh=5FGdyIKQ6AaPlZiG7BcadSmKzqCM/sSOjNnP/kz1Lhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AU3HDQmZvfASLeWAmPtczUvQNtiP5yIkI5/Z0R8q+/h66AE1UqjCu2ZveWEO1ssE5pnGv8enHhAHDYW1yDOg1or2nA3g1kXtDZ7Kt+pAlv7treo3Oy2/M18IrtNxiK5Da48/kipavL3Kjubx6+hxNvpI3hO9Pn86m11kTsVaS8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dk9U8Xt6; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dk9U8Xt6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcoPyezXpSbgN0taR+AeOOqB72VWQ2PdXyXVCaTjJHVX/vK1eggzc3GemMY2WOC76mJ9nCNOve18hWO8eHqmyb5A+1iv9xpGb1CgjukHOOJLF7ncjFG11frmYxotEAqcndaV9M60eF1V7xPouaGh/Bm/37cF4m4ZBlJg+3Zj5r86e1w3iMp9FNsrf3KliVm10/HTQO0RZVdulz/sj4wjGyGFN3kegMFATZy/G5SlNCPWDZyjE/fmmDFsU6F8KuG632shT/xmW6EPDEWIsaEldSfBgbqVTGuC6Ni3O/xF8eTaWAwkSNclOtQdxnj+ITG0iQBUm4dvDvxlrJWMTLzaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiHXHpfATgxDU/U9he/NwvDDsl2A+iJIaNORErOV3wY=;
 b=w5sMUWOSVg6JzUk56s1NY06mqsW4ltojh3hYwvHG1oERNSIiJxuAS1R+cXYuvD6oPuoae6y4XqM/hvlVX504cYXx0UIDROqcNxGSwzdcObpl4wtIgU30Ocq8nnM5OuTPFgQQzYsHpcGP15Zr1/kLKFY7YxnjjgUaRPdk+B5upNHPJXQhUGSpJ4lETMXw6b5TC09Ai3heygMIgozTSVouObYhd3H6wNbMk5GB3wtzLssgtiHiry0tZ5JmMqI40IH400J1x82x6Dh0sf6/Px6BDCsAqY2Ge9rCbrOpyjlInobZlLjDhsOh1mlb6fKPif+/BP4GKtXcDyHqMWtl+csJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiHXHpfATgxDU/U9he/NwvDDsl2A+iJIaNORErOV3wY=;
 b=dk9U8Xt6BcIuSLi2IhuEchc/ZxuKKL1kOCYQfbJfze1evIzm/1com6+9PqhqzGhF+OgT2LMGDENlCjd5kjIjNJpiIW6Kf+1QmPNkIG5jp7gKduuwyK/L3owG7/xXREsrn6hPgOk7xwXwrc+k4tdRMA9kFqzcHPLRH/REcKqd064=
Received: from TYWPR01CA0026.jpnprd01.prod.outlook.com (2603:1096:400:aa::13)
 by OS7PR01MB13687.jpnprd01.prod.outlook.com (2603:1096:604:35b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 14:40:12 +0000
Received: from TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:aa:cafe::2d) by TYWPR01CA0026.outlook.office365.com
 (2603:1096:400:aa::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Sun, 13
 Sep 2026 14:40:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005624.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Sun, 13 Sep 2026 14:40:11 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.2])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 9C207300024B;
	Sun, 13 Sep 2026 23:40:08 +0900 (JST)
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
Subject: [PATCH net-next 2/2] selftests: drv-net: Add VLAN test
Date: Sun, 13 Sep 2026 14:39:26 +0000
Message-ID: <20260913143926.77366-3-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF00005624:EE_|OS7PR01MB13687:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e65ef164-4649-40c7-243f-08df11a4ea99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	9rGuPQAuMQVRoUTtyQYsYEx7w0JzeDorexo7WryOARMVJH7F+RIvbGgLahq1xsB+Unke0G80h6KW/DiMg95hwz9TUQvV5oDJ9rok5oxIq4pBRqHExLEqhW3bD2LFpT+YmQ/QQXsXvMIk5TyLG7EP+Tq2O0PlNDdPTj24WsxSpbB40jpe4Wyt0yiMNAHC9pKu701Pc8enHnvoUKJciQ68xkTjNQqkiHh4t59WYvzyGTbZh69AaQSo6ovT8ceqjKX1T0LEyM66LTdUWc1mu8kSdbU8FhKhUQjuzsjV15ZUiShzFKFoOTrYrSAcCFpdSEpjJf6iYc1nVtudmIHf+VNzcnlQ4VICwNEk3giQHj5IJ63mGMuK7CT99+NsM5w/tSTlfIkU2iSKVMlblime4UeoRZxABGbbIGQTx1EuDj1DQlMJDst+zbpySdsf6pgqhQl8dO4F4VDSe7dz5rjq6MiZI9CMtkaO52cZLQiGV0AB+Q/8QiVj0SYYqAINeHfAtRcbS2+PY28i5sbiEUorKAr86lfXhVZ6lSNv8TQ1mj00wtxx/S/syAHGJk5UIZBxkSt7pzWNC6LFbzgchwPlk5XrsdnizesAzzDkEnYoPITnPVo1s5jPf0x1cT/UIZ1wdW8on3ol1Nd/PBVcFgFDeALvvoXIVZbSaRgGsUHlYDovSmXmc6AzpdHHwPj8KVDn6aem6rWkoM+M+lpBnI1TD50/rA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nXOjwqJaO+AHH84G1eNO/3Ma39cs01ZmFy36apXWoePHXrpJd6R5C8QjXYI1jwbUQFO1FexTI39D8F6MGN8VbpELor+KUIXL5J9d7+avLNEw2rfeH3KslRtECWcOpbjPIEZ+OKedlHNrwRscLkSGF/mNxPznz4YwuzNoGD0yq/R4yA8wSQ1SgOSs4+2VuLRYpfLs6CVUjQ6hh/pxtSp+HznyhYqwuNJMPGcn6QvypGIOcyZuwPShBH+o7zfiTL115hxHukelARGF02LUuR6gO4P4TLD3RLKvlc2xDlMvOTC3TSGkImNrK9fPFoDBYYJdAcfGgCmJ7iS6KlDdvYEFbE6B0ylw/bjvYhTmsoQgx+1eNt2ORpOciD6CfTcRU12VtGW+Ey23p/D7nNEE8ScPlyPvDkzAdD6REhASnVqTROKC+IJBeWAv5w3e9OJZunyl
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 14:40:11.7608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e65ef164-4649-40c7-243f-08df11a4ea99
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13687

Add a test that validates ping traffic over VLAN interfaces. It aims
to catch drivers which mishandle hardware VLAN tag stripping, in
particular QinQ.

Three VLAN configurations are covered, each with hardware RX VLAN
stripping enabled and disabled (via the rx-vlan-offload and
rx-vlan-stag-hw-parse features):
- a single 802.1q VLAN interface
- a single 802.1ad VLAN interface
- an 802.1q VLAN stacked on top of an 802.1ad interface

The "hw" test variants enable the RX VLAN stripping features supported
by the device (rx-vlan-offload and rx-vlan-stag-hw-parse), the "sw"
test variants disable all of them. A test is xfailed if the requested
configuration is not possible.

VLAN insertion offloads are not tested for now.

NETIF=end0 LOCAL_V4=172.16.0.2 REMOTE_V4=172.16.0.3 \
REMOTE_TYPE=ssh REMOTE_ARGS=root@172.16.0.3 \
run_kselftest.sh -t drivers/net/hw:vlan.py
 TAP version 13
 1..1
 # timeout set to 0
 # selftests: drivers/net/hw: vlan.py
 # # Interface: end0, driver: st_gmac
 # TAP version 13
 # 1..6
 # ok 1 vlan.test.8021q_hw
 # ok 2 vlan.test.8021q_sw
 # ok 3 vlan.test.8021ad_hw
 # ok 4 vlan.test.8021ad_sw
 # ok 5 vlan.test.qinq_hw
 # ok 6 vlan.test.qinq_sw
 # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0
 ok 1 selftests: drivers/net/hw: vlan.py
 # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/drivers/net/hw/config |   1 +
 .../testing/selftests/drivers/net/hw/vlan.py  | 127 ++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/hw/vlan.py

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index bd3b8d2fa47e..5582b644078e 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -54,6 +54,7 @@ TEST_PROGS = \
 	tso.py \
 	userns_devmem.py \
 	uso.py \
+	vlan.py \
 	xdp_metadata.py \
 	xsk_reconfig.py \
 	#
diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
index d89a9ba17655..c6c2b64bb712 100644
--- a/tools/testing/selftests/drivers/net/hw/config
+++ b/tools/testing/selftests/drivers/net/hw/config
@@ -24,5 +24,6 @@ CONFIG_NET_SCH_INGRESS=y
 CONFIG_SYNC_FILE=y
 CONFIG_UDMABUF=y
 CONFIG_USER_NS=y
+CONFIG_VLAN_8021Q=m
 CONFIG_VXLAN=y
 CONFIG_XFRM_USER=y
diff --git a/tools/testing/selftests/drivers/net/hw/vlan.py b/tools/testing/selftests/drivers/net/hw/vlan.py
new file mode 100755
index 000000000000..f514ad3e5dfd
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/vlan.py
@@ -0,0 +1,127 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+VLAN tests.
+
+Validates that ping traffic is sent and received correctly over 802.1q
+and 802.1ad VLAN interfaces, with hardware RX VLAN stripping enabled and
+disabled on the local interface.
+
+The "hw" test variants enable the RX VLAN stripping features supported by
+the device, the "sw" test variants disable all of them. A test is xfailed
+if the requested configuration is not possible.
+
+Test cases:
+  - 8021q_hw:  Traffic over a single 802.1q VLAN, HW stripping on
+  - 8021q_sw:  Traffic over a single 802.1q VLAN, HW stripping off
+  - 8021ad_hw: Traffic over a single 802.1ad VLAN, HW stripping on
+  - 8021ad_sw: Traffic over a single 802.1ad VLAN, HW stripping off
+  - qinq_hw:   Traffic over an 802.1q VLAN stacked on an 802.1ad VLAN,
+               HW stripping on
+  - qinq_sw:   Traffic over an 802.1q VLAN stacked on an 802.1ad VLAN,
+               HW stripping off
+"""
+
+import os
+
+from lib.py import (
+    KsftNamedVariant,
+    KsftXfailEx,
+    NetDrvEpEnv,
+    cmd,
+    defer,
+    ethtool,
+    ip,
+    ksft_exit,
+    ksft_run,
+    ksft_variants,
+    set_ethtool_feat,
+)
+
+OUTER_DEV = f"vlout{os.getpid()}"
+INNER_DEV = f"vlin{os.getpid()}"
+
+OUTER_VID = 100
+INNER_VID = 200
+
+LOCAL_IP = "198.51.100.1"
+REMOTE_IP = "198.51.100.2"
+
+
+def _vlan_add(base, name, proto, vid, host=None):
+    """Create a VLAN device on top of base and bring it up."""
+
+    ip(f"link add link {base} name {name} type vlan proto {proto} id {vid}",
+       host=host)
+    defer(ip, f"link del {name}", host=host)
+    ip(f"link set {name} up", host=host)
+
+
+def _vlan_setup(base, addr, outer_proto, inner_proto, host=None):
+    """Create VLAN interfaces on base and set an IP on the innermost one."""
+
+    _vlan_add(base, OUTER_DEV, outer_proto, OUTER_VID, host=host)
+    if inner_proto:
+        _vlan_add(OUTER_DEV, INNER_DEV, inner_proto, INNER_VID, host=host)
+
+    dev = INNER_DEV if inner_proto else OUTER_DEV
+    ip(f"addr add {addr}/24 dev {dev}", host=host)
+
+
+def _setup(cfg, outer_proto, inner_proto, hw_strip):
+    """Configure VLAN stripping and create the VLAN interfaces."""
+
+    names = ["rx-vlan-offload"]
+    if outer_proto == "802.1ad":
+        names.append("rx-vlan-stag-hw-parse")
+
+    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
+    feats = {}
+    for name in names:
+        # hw: skip the features the device does not support
+        # sw: request all of them off
+        if hw_strip and feat[name]["fixed"] and not feat[name]["active"]:
+            continue
+        feats[name] = hw_strip
+
+    if hw_strip and not feats:
+        raise KsftXfailEx("Device does not support RX VLAN stripping")
+
+    set_ethtool_feat(cfg.ifname, feat, feats)
+
+    _vlan_setup(cfg.ifname, LOCAL_IP, outer_proto, inner_proto)
+    _vlan_setup(cfg.remote_ifname, REMOTE_IP, outer_proto, inner_proto,
+                host=cfg.remote)
+
+
+def _vlan_variants():
+    """Generator that yields the VLAN protocols and the stripping mode."""
+
+    yield KsftNamedVariant("8021q_hw", "802.1q", None, True)
+    yield KsftNamedVariant("8021q_sw", "802.1q", None, False)
+    yield KsftNamedVariant("8021ad_hw", "802.1ad", None, True)
+    yield KsftNamedVariant("8021ad_sw", "802.1ad", None, False)
+    yield KsftNamedVariant("qinq_hw", "802.1ad", "802.1q", True)
+    yield KsftNamedVariant("qinq_sw", "802.1ad", "802.1q", False)
+
+
+@ksft_variants(_vlan_variants())
+def test(cfg, outer_proto, inner_proto, hw_strip):
+    """Run a single VLAN test"""
+
+    _setup(cfg, outer_proto, inner_proto, hw_strip)
+
+    cmd(f"ping -c 1 -W 5 {REMOTE_IP}")
+
+
+def main() -> None:
+    """ Ksft boiler plate main """
+
+    with NetDrvEpEnv(__file__) as cfg:
+        ksft_run(cases=[test], args=(cfg, ))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.34.1


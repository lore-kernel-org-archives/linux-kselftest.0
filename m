Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6552257EDAF;
	Tue,  8 Sep 2026 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885869; cv=fail; b=HL+gUaTgyoVHLmHh1F4BfVXATg06iPbXFyRI0+j5WdpImj3niZrtZ0EhhW9OWENuQMn/rNLdoWbGPPmTRnDnin83m7tATRyay/wr9YuUedF+9+uxcUiHOVjVxAWSu87FI83n9GkvWiOq3+ct45496eEsVH2a3Kf7sSCxycaCQ8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885869; c=relaxed/simple;
	bh=09dp8X3AJMYPBZ7VW0mJTIq50woDDof0FDOA42klLqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zxuy8m1MRHWv0vGLFqOizLuG/g2qNYlqkVD9jkXyN08u8CzTcTns2BOxyDvUmbc9rjMegDqRDMnZH1R9a1uDb7jekeLHX1NKVOPC1FPY/MbCx9jd9V49odpXWsOTnMrOeg/7uks8u7KxmXNP4JyeF+exFPPoXO6jk5LwMcflnzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HcdixOQX; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HcdixOQX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyKF2ahna5YVrgPA/zZHdJJ27TCCuCwSOevqy16fY3GJmcgHH4jy3SZuSTwin1mSzQIayAbaI8IPlJSAuWRYU3xcz7ZrJegQ4oXf8MtLhZgBC+A/KzuBChHY23eYTfjnR4EBqV+stmc7AADLT4CTo4AucUmdy7laL6JImsw4LzMurc8aguQuFfjx/EU0B64MCjvUTy5WebC/cVvMCSOfSCdHETz57Zza1xOuawPjJVnEiHr8KQdk8b+ul0hFtah7KfjcwZV0RnTLOnoxryicxePdlEly18koO6NzNOHJMldqaBGsGSd9eLQ05hlz4tQmpPJB11ZjCJp/+av1W9wr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAICVZ4NbDIwbfYPAkXbmJvoFZIDSnBoGcO7k7jyk9U=;
 b=kgc+SD3BUxX5ALiHh19wrEeq6WmBSOEP174MYEx2TnI6fwWdQfoSeGYA/AxcvJemfsxZRbNt/c2Me0dvxUB/+2JIFnxagNdT8VG+59iianCBOkHq6CC8POJ51LqrgcczvHVdyhNrwuyDRbtRaV9SGoShTGgXrkl3Mia6nzd642toViNyLYPcq8kJwz9JDt+bidixhc5F1FBhca1SGGB6/bqUIT1IAXLG+Q/rXV/gdMdYiDo5edQEqfwd7nyor2hzsICw7CvFgLFcWO1tMN4gBq1dHNAGoIQDWfK37TwTKGn4jxShy/dm7Eg260rII6E42yg0RhOcMGd5x37kPr7REw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAICVZ4NbDIwbfYPAkXbmJvoFZIDSnBoGcO7k7jyk9U=;
 b=HcdixOQXrelVAmviumiAr2iw7tgmwDxHbOw/HIsl71vo47lb+Ev8MUO6rURiI0iq+1vjZ/i26XdD4Ugya9lg9qsGAFaWfKzYCTqUL7XWZQeG4VuwdPm98D052LIPbUn7Ui09WN0TLgFzIBcYmz75pzQ1GKk0/y492BeMaXcDW2c=
Received: from OS7PR01CA0280.jpnprd01.prod.outlook.com (2603:1096:604:259::14)
 by OSCPR01MB14484.jpnprd01.prod.outlook.com (2603:1096:604:3a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 16:44:23 +0000
Received: from OS3PEPF0000003C.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:259:cafe::17) by OS7PR01CA0280.outlook.office365.com
 (2603:1096:604:259::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 16:44:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003C.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 16:44:21 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.55])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id E7F05300044D;
	Wed,  9 Sep 2026 01:44:15 +0900 (JST)
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
Subject: [PATCH net v4 7/7] selftests: drv-net: Add VLAN test
Date: Tue,  8 Sep 2026 16:43:09 +0000
Message-ID: <20260908164309.59282-8-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003C:EE_|OSCPR01MB14484:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6c588b0e-839b-4310-f279-08df0dc86f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|921020|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yRV7CizHD6mG0YbmnqILp67ZM8Zi9OnWoaZvDFHUJJfu44necKYtTlFn96Wn6d8RNeIdRFY0ltvE4vGlXN+pPj6L64TaqmS4vPQAS/0DbzibBTTrH02ibHHGSHvCfBzQGsB/xyn1OjAFurQ7TY3Kj8vC3aJG7xSrSls2oy79SmBK2RaU9oGMyVHomRutudXdM1GKhLPVBbZp9EzL1BeQVun3LaUFBPynDFFK5osJrVSpYBfBUrBFbUGAz7VEr7xXqnhPexGZJ11t0CB0o+OaYgWUPxUrzRQhHKUVOph5Jcvxsyg5JSbXz1Pjp3iU3HKa4jV9SH73g+CdDVX/y4JNE8m0Noyx6wppcrdWRnd9OpnAtp/bBh09Q1qz5p7OnmkfJvUZYaPIELmTLvFtFnTZwP/RsXHzu6x3XrE3i0jA7T7ZmdZ4gqCpcN55ekHl7xL8ct8VNJW1iENPgG6hFe9tkM9qkiAWFZZmMycteRyzuFMNI3fRT6vv4OFcpNkp1ejuKFMtAu3EnKCdNhXk8HbHakj3P5UgY4m3BblpijM6dGPE5XBHutTF8TGPFC9nL5cYj2aLSLS1/JIGs8yTc+ZTdI8T4UEU/QXq1+2Y6eVVIIRvBUayfLyWeikIxJ1Z7uyerQYIkY57X6Y4EZCsSS63ti8cF778Xzra+UekBcK66OHtqItFy2ObnfCWmjADKXC/wbyvpKd9vavv0zmzPuVhtjVVFQQ8bDc1NPXl/dL6prnDmLsnRNqdzZMyqiI8YrOj
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(921020)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	odys+Z66v5DznPavNkLCNpsol97t9HMcFLE3NX1U5JhyjQbjYq1i7TnPO4SScR2oaDjqwT1vBUcJws3KQOR9rkEIVLcG9ccrZ6SvKH9VPIIK7Y/tFc84ks4YHMlC623ixoZGQ6gCgWu5b+AHKaQUX8HrFKsw9jRfQFd4N2926WcGwHc+GLpvjwZki4SYpN0GGpnD9lp8Ud5uIDcJT62ZKagtepdaw60Fr2V9mMMxuho0rMQPwbM46CJPye3Hrd0wAU0clTPRRHN4yWIwccaWCf+dmKA5hR6heYpeNfAXd7LDLRW/ZSWoV2Ar+GAXsr64oCNRbI63XxQi/8mWqJdDiSpsDDC/43UXN/o/ZZyI6yQICb132cwL1fKl7x8Ni85UxPCUjm3MceFNOOejBA81dXKHduYatOxxM0I5jOXshCYyrIsy+sugAqbDI5OHyIrF
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:44:21.7934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c588b0e-839b-4310-f279-08df0dc86f1a
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003C.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14484

Add a test that validates ping traffic over VLAN interfaces. It aims
to catch drivers which mishandle hardware VLAN tag stripping, in
particular QinQ.

Three VLAN configurations are covered, each with hardware RX VLAN
stripping enabled and disabled (via the rx-vlan-offload and
rx-vlan-stag-hw-parse features):
- a single 802.1q VLAN interface
- a single 802.1ad VLAN interface
- an 802.1q VLAN stacked on top of an 802.1ad interface

The test is xfailed when a specific feature cannot be changed.

VLAN insertion offloads are not tested for now.

NETIF=end1 LOCAL_V4=172.16.0.2 REMOTE_V4=172.16.0.3 \
REMOTE_TYPE=ssh REMOTE_ARGS=root@172.16.0.3 \
run_kselftest.sh -t drivers/net/hw:vlan.py
 TAP version 13
 1..1
 # timeout set to 0
 # selftests: drivers/net/hw: vlan.py
 # # Interface: end1, driver: st_gmac
 # TAP version 13
 # 1..6
 # ok 1 vlan.test.8021q_hw
 # ok 2 vlan.test.8021q_sw
 # ok 3 vlan.test.8021ad_hw # XFAIL Device does not support rx-vlan-stag-hw-parse
 # ok 4 vlan.test.8021ad_sw
 # ok 5 vlan.test.qinq_hw # XFAIL Device does not support rx-vlan-stag-hw-parse
 # ok 6 vlan.test.qinq_sw
 # # Totals: pass:4 fail:0 xfail:2 xpass:0 skip:0 error:0
 ok 1 selftests: drivers/net/hw: vlan.py
 # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v4 changes:
- Toggle rx-vlan-stag-hw-parse for the 802.1ad and QinQ variants.
- Updated the commit message and docstrings.

v3 changes:
- Moved the selftest to drivers/net/hw, as the _hw variants couldn't run
  under netdevsim.
- Fixed "ruff check" and "pylint --disable=R" warnings.
- Added CONFIG_VLAN_8021Q=m to configs file.

v2 changes:
- New patch.

 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/drivers/net/hw/config |   1 +
 .../testing/selftests/drivers/net/hw/vlan.py  | 112 ++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/hw/vlan.py

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 78bb0169350b..886a4222c6cf 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -49,6 +49,7 @@ TEST_PROGS = \
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
index 000000000000..61fa452b95bd
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/vlan.py
@@ -0,0 +1,112 @@
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
+    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
+    feats = {"rx-vlan-offload": hw_strip}
+    if outer_proto == "802.1ad":
+        feats["rx-vlan-stag-hw-parse"] = hw_strip
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
+    cfg.require_ipver("4")
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


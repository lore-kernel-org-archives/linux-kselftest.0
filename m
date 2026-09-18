Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73A4E3EF6;
	Fri, 18 Sep 2026 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730779; cv=fail; b=IalsBmw9jEhJRvhP6u2AYzLLXFuuecX0nZTjt2UW2Qx4aKiPYLJ/7I9BKkzLlMEBw/awRO04dVUFGsQyG1MBntsz/Eth/IcLeXhYxVMX+s2+PERdug79F7cVQCe8+wEuvQrEJz3uQXjFPXIA3yqaOI5YBcfOygqilZF/Fbgc6c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730779; c=relaxed/simple;
	bh=lKseDOBRDqZ9NgiovEm4kMGQmXu3xhXAWzNveKj0SS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h53DdP4xxAkquYpXutcWN0mO5YBcrE5CaYk5erU8uGxT4jy9eLNw6FnhJwKkG9HE2CUPtfNc0URFbn8F6xsmHnL/Z3K82t9MCKx3ZI4BE4n6c9msGA/1/8iIVDUBwop2v4cnIxwSuw6z9+/d2L2xcIHNcD6jaWG30zle6JWHkf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Mhf0md/e; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Mhf0md/e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyj1vU6sTt3waQm3BkIEsLctu2Qic3y6XgOuDuru9zgq8pB0GYN/JF7OVj9TPsNdl8gPBjTj4rVYPHkzlBfaUIs3BoKq2Gh5o/pnNYGlqX4lnz3jcZlGPer/3Jizt+4NPbop/PSszB7n2rNAPzyjC6RM9AiUY/o7kFbBIZNiIrO7qQQlccE/OOGiZA4dww6/VsrUTHOAKzIJDtrJBm+ZaEZu0RpfTKvbgUFKJPYnPdbYt5U4ldA7Q9ToEIAh4NB0U+ZkiqWiEnjAJaynwkdB//VHMJJ3P5rJ/TQSFGC/oKiKhmWWn7KczeZmU497kFyos2ShaOh8HPn+YKtEOpnFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+FwqjY7AYLHTgWr3uEmetH+SF/TY2YRUVQfnWf7jyo=;
 b=DSlqxk+mDws9ce7VXbqci4NKC/usHNWFU55yjDzJoLkCkiRohGoxMQkTAr6sPheb1q+VgvfVm8D44sHoL7qv3rjzGEKWWQBOSctxJRfIXh/46dN+HQnHDdqwsB6ISN2wjihI0hNtdkZqzDQ85hDHOpRd4PpEatX+kMShfYuwzuWrs3lkV4fpwrIz+d/simqQM3c5KUm7y1/eXnJVh/MmkLW1CvL1esbzhyZsKdUTy7hSuASBIF7u2kDcmURnBhFdxVs1HtnmSjYx3c4Yn1BlTUpwvU6vtHOPWIo8lQxyPYLo5U4N6LgfSs9bId1jnSshCvbwnfZZBM9TQGBLFPVmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+FwqjY7AYLHTgWr3uEmetH+SF/TY2YRUVQfnWf7jyo=;
 b=Mhf0md/eHNEaygylFTDlnZ+QsYbGC0cBnrRZxpQJdSJavGx4hmabCzAYzGmGK5DhRImRtsrug9N7O/m3slknrFua4279OQWqfyLqiZFFpLglznWzpXkk0WMtk6lYB218tEX9EdHz+wPWZ2fuFsfVLrvAOUdtYKNS4+TkAkJgZt4=
Received: from OSTPR01CA0067.jpnprd01.prod.outlook.com (2603:1096:604:21a::14)
 by TYYPR01MB6827.jpnprd01.prod.outlook.com (2603:1096:400:d2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 11:26:05 +0000
Received: from OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:21a:cafe::9d) by OSTPR01CA0067.outlook.office365.com
 (2603:1096:604:21a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 11:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003E.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 11:26:04 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.165])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 1211E300027D;
	Fri, 18 Sep 2026 20:26:00 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	nb@tipi-net.de
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net-next v2 3/3] selftests: drv-net: Add VLAN test
Date: Fri, 18 Sep 2026 11:25:29 +0000
Message-ID: <20260918112529.96039-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
References: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003E:EE_|TYYPR01MB6827:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e72cb495-f897-429b-e426-08df1577a07d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|7416014|10067099003|3023799007|6133799003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	2HbPRB+KsSh/U8qzvkKa+4ka6TtxMuJiVHBYq5TDe3dueb/3VLQqXiRnKeRpAenS0PycBjkKvymVutb6hISVat3XVi6AOMm3YaLjcaDFdo8qQF5NWQW9kj4VIuBaGPh1uQQxMO5a3zF+A2aLKZBp7fTSpyfs9EFjB7iv2N6lIHBIoGs/EgklGJLQfmXBU5MhmOADjFDN36ZO990wZoQ7zFZBQhDIZhJfeUekUb2cmNnAZWYTy0do3IXzQ4JdQ5Z/70giHP2oNVSfGOSam8RTz8u1n7IKE2fdB8XjHG0RlwdmcmcVOVaMwSc3QOxN1nUdGmWaQafyi3WKbiGRj40vxR9TU7036hv6ZPEL27ssIbyVnPhr6bHmIEUAyr0Fcxb2qdxOXk96vFNXLcyOqPoxxGnPTPn8OGlGV07KR4CuFa1tMLJV5jA1O32wyUQKlZkKhEi450gCRaecX3Zkm0NWwt4kOF8A+FVVu6Q3PdReV3/JnWOWma8UJf0ZFO1fATJQBhqhszYcmTH10vyJg4Kvlmpsn3QMRblQiySJjDTMVXUsE64eFh3M8VIa3gaQRTA7Oe/66sVVLZUZtKurju4WWweWAeWv4VW0du7G/m2JW4Kztul47fbJT3s5NK5o3Qglj6ejcvmBreFFw+EhCX+JJ2tithTHn4KyJkrP3c7EcFtBJQ+FjUfVe8JAfBX3yUrb8/1hcGjy/+ABlyr1vFd20Q==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(7416014)(10067099003)(3023799007)(6133799003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cewKlApdSQlW3KCzgWTBqfUu2m/bhih1ykpMH4u+eNoMrUm6o7pqDbDmvGCM81v/KVh7T5Dq4ULondx2DwChWXmWjrbHMVJc4hI93xrPSObqQO0Aq2ubyYP89yyuzrw3I3beUoYDSbsuLdxK7VsgzYhgXs2Y4C6XKloPjBqSFZcxlBtk0VMRxRTs8b5bIJs/nvW8eDKxJX7ObFLNxK+eVpnfDxbv0jff4RweOxmUw/0KG1cZicBveOoL2VjlS+nsvWYuxX3VqmClKWwXH6aul4m0oojRRAmtJqvUeE779OxEe7p3xX6feZmhKwl0cPC0BqM7YST4HOReqYcxcgPI+ItDHEUjMPc8Q/g50z1Z3xePtJDpJyAEzQQ31FmcUyVkvquLJFkwXcj6nZED4VGcoD2uBC5yWjZcy7bwDafVY3MdIM4F2r2O0T3bnodUtCoh
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 11:26:04.7162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e72cb495-f897-429b-e426-08df1577a07d
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6827

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
v2:
- Allowed the VLAN test IPs to be set from the environment, to avoid
  possible clashes.

 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/drivers/net/hw/config |   1 +
 .../testing/selftests/drivers/net/hw/vlan.py  | 127 ++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/hw/vlan.py

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 8aebdc6feb17..18ce235a77f8 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -50,6 +50,7 @@ TEST_PROGS = \
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
index 000000000000..00c90b930f67
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
+LOCAL_IP = os.environ.get("VLAN_LOCAL_V4", "198.51.100.1")
+REMOTE_IP = os.environ.get("VLAN_REMOTE_V4", "198.51.100.2")
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


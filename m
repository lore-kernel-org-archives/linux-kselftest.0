Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2703CE4A3;
	Tue, 25 Aug 2026 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648926; cv=fail; b=ihQoTXR4Kq26cJrzvi4DS19NzNZI/jnvAWnbtdxpbdKKxlUF7lVD6mGIZlND95xB1XSmR3Nt2Se9xcFB15lOcAPKh5Lo+gOxnZSNggBAwi1kBU987PY/DC6Imlxmsyl0YisXw/rr5Uu+rFW3Fw08HCuOyx62KoxtY96inJxfl/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648926; c=relaxed/simple;
	bh=40/o9vHIIBwyqQRJ7PKhOPfdLq80NvZ/ddi99nB/xl0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ujOQXnTlWCcSJeS47RlAs08E6H9A4Ls9+UzOfWwbN4GBmCLXGerfSSIF3OYMY/3ZKrjvdwQave0RWA9tBwWshgCAxW6Ee7t1B8nlQksAsYhnG3bQCOxQBezh/v8U0WIQwEfUH0cHq6/q1YWIX1eKYOTJf9Env5oHsnDDcEfD51Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IbJwFjNl; arc=fail smtp.client-ip=40.107.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IbJwFjNl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8OYvcSR7Kn+6GFvV1qtiDSkTpaivQ33l98pPsXrWYsUkYYjTUOMYCdvnmP8xmEFGT8eiJlOqp2iY/l7c0ZhOkrQatBvNqewrKRu6u9Rhe5euwE+6DXtM1pEY3g2zLHAQmHqA3960EBws6XWQK3+4J5tMeJ1UfnaqtK06LM58RtC2dsb2HYEip42o+JzsblLUnNys7Lt9u4z864U5bBA2YcdEsFHa+gmD2i0U2tQUOj2yV5JJz+DpAKdsMsI1pm31J+aEEWktwWUt/uTHpDFwfkBVkHkmKTUMUY3yuGItrir0RnmQcVaFN5OSfgihTUM5wj85yGjZRMfZxVhwoMnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/5E7fTQjK39HW86la73YV6c4X1AdFfcGFuU7ARjzBk=;
 b=oQW+oR7uNjTH2PKz36946xw24FQ2hygnuQgFw/km43S7RI1tKawYSQEf5Da2NgrMkvdKNFMj4M/eTrHCBGeVmYzwyJjyxIGyfy+Xi4cEh0OqwwrDE9renjEz9jbhv6o56BXveobMXdPYeKfGiIZ6eiqHUTNU/S4v0oGZk3pvSQ2cVMFlJVE59R//jXugrwDQxq8U5pfBTAmdVbSU2OjyiO4B2trWTMAxeuhiRlD+4SVV1qRWMzfh9ON/6ej8cTRePzUVakqfWYuj97g9CtQGziXTeQs+717xe4pQXrOo0fCd0ZTZtpjxpyViH6D7PiJ/NkJ9hBWx/0zcWMbrvlIxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/5E7fTQjK39HW86la73YV6c4X1AdFfcGFuU7ARjzBk=;
 b=IbJwFjNlz5K+ArJKj2Ow6fdC+qSOwLGXyantCqETTbWBX//1L1CkjtEIBPy9OOo/DMho+FGgeFDhgtA8vMYDBPOW+uZB2snLNLAxBNAgYETViYtmwPsTnSFsVkCrKK+jQmT0qTD2ku0+VJb/nhZ3bGVF2BzO1lTMTvAtooF6O8r6dyzR0ihhbalD926gYQbfGeaJtqDW/GcF3V5XNC9o6ZrmV0Ue6Rp80qqSGXUz/n1pia9letEjmErSz1gCuBHh0+H6PHQIpeY08ybDyWbQrw/fxRnxcmTRbUN3PolJvcb590N6Ff77UCNR47Kznpv9jBIbyHvU0VNe++ou+v/+Zw==
Received: from CH5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:610:1f4::26)
 by PH8PR12MB7230.namprd12.prod.outlook.com (2603:10b6:510:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 09:08:39 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::d) by CH5PR04CA0014.outlook.office365.com
 (2603:10b6:610:1f4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 09:08:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 09:08:38 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 25 Aug
 2026 02:08:14 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 25 Aug
 2026 02:08:13 -0700
Received: from vdi.nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Tue, 25
 Aug 2026 02:08:10 -0700
From: Nimrod Oren <noren@nvidia.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
	<shuah@kernel.org>
CC: Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
	Nimrod Oren <noren@nvidia.com>, Willem de Bruijn <willemb@google.com>,
	<netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Yael Chemla <ychemla@nvidia.com>, "Dragos
 Tatulea" <dtatulea@nvidia.com>
Subject: [PATCH net] selftests: drv-net: pp_alloc_fail: restore ring size after timeout
Date: Tue, 25 Aug 2026 12:07:58 +0300
Message-ID: <20260825090758.308167-1-noren@nvidia.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|PH8PR12MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 6846a034-e8c8-40fe-8765-08df02887372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|23010399003|82310400026|13003099007|3023799007|5023799004|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ivDpt0m5J15gFFL0+N4VwtL60LDGosKP6f+gAVBKudzCsOlsv7tCfq7AAFjDhl734GXCxPDRdxE0CBVR/CF4RcUkJ2ISRgEb8Ob20PqDqREQVJRGno3ZjCAK9g8vnzcEgBrK7GqPxF3Xn+nFaSNd6YfKN/yevpgtwdoNpVyVs+xGMN6Dt8iG7o+lvp1qC2ncURDU9Bu3uXClAlsKbufNym5TkUQzrLZJzK3cvaeZ3eRKvqMWlxmrwfOxVMH1d889xrb5BTXz986irxan18l1UC0i2eLcoObE6uXtv9U/20jUXB6s12+mHvXxRlpGYG1YKikzFZcucgfmluO1706FvlQIAFlp75PwvOAeRAB4FzBi8T++Krieps9MWXLFsoLBtVAhAXjIfASHsZxBBh6+T6upX1YeDzcqA3DvuTM9A9jZm5K3jAbbWthkiFe15ebsyyWh1e0GNoBbJoLc7cU15m2/oQQNa7OIEGNK1jb71uuKsrl/wdDWV3toS3EyJ7fRbRRLqGqwekmTomUlaYvb4D04j02TPWUg2X1j14KX3eUQg+bVnc3gS+vIH0KOT6zr48/htYavhPZKBrNfeWT6gSKBeMKfNawYfZRn1DRbW6NUem4i5BV7T4TI6arG0MzEOau+w6VeUzbZ17/3qLQaKZaFVO3NEZgKpRSaaBhrP4P4i4zziQIcoXhWkj9fY2dC0MRv7VIqwj4MBRhl3j/9Qg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(23010399003)(82310400026)(13003099007)(3023799007)(5023799004)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Frw0bk2O0tl0ZqmC5kyI/AUnuKe3lPO2XU69KwHGIDzFYFfzvvMPlTBh5NjQLjgRMIFOfseE/mVSMsAbkN1VZSX2wPIDGdryv7mdC33RinnaPK4F9Vx3edbTHWkcoMYb6/Z4bLWMTnozz5VZejqXA6LRjQuOfrB0qTm70JEY1hvmmN1YPY1g9nEsSg4eg5EHllTTBTi0HJHouEwFSM2kzF78qfP0SE9pFxQN4tL4an5ImunE0ylwWH0mGHkq2dxkV2CWMKPX3TctK7zc/mumiGF65if4ehQSOe7rWn0447pKfnp5JHlbR6wccXdXvoMpAUPvd3aH4UcsItnBTjDys/AlrU7syQJ5z6EPYdk3n1Iodl5b302Ka1Mn7heiL/vIdTwwSSxwRaSKISupQWbYpDX9u1bNODgoZ4Ik+ZH5hKljliexCtIWx06LhdLsgicI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 09:08:38.3942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6846a034-e8c8-40fe-8765-08df02887372
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7230

The test restores the original RX ring size only if the command to
change it returns successfully. The cmd() helper raises TimeoutExpired
after 20 seconds but does not terminate the ethtool subprocess or wait
for it to finish. The subprocess may therefore continue running and
leave the new ring size applied despite the timeout, while the test
skips restoration.

This was observed in a NIPA run. The first attempt reported:

    subprocess.TimeoutExpired: Command '['ethtool', '-G', 'ens25f1np1',
    'rx', '2048']' timed out after 20 seconds

https://netdev.bots.linux.dev/logview.html?f=/logs/hwksft/CX7-dbg/results/763842/test-outputs/36-pp-alloc-fail-py/stdout

The subsequent retry attempt then reported:

    subprocess.TimeoutExpired: Command '['ethtool', '-G', 'ens25f1np1',
    'rx', '4096']' timed out after 20 seconds

https://netdev.bots.linux.dev/logview.html?f=/logs/hwksft/CX7-dbg/results/763842/test-outputs/36-pp-alloc-fail-py-retry/stdout

The retry attempted to increase the ring from 2048 to 4096, showing that
the first command had applied the change despite the timeout.

Register the restoration with defer() before running the command so it
is attempted if cmd() times out. If the restoration also times out, its
ethtool subprocess is likewise left running and may eventually restore
the original ring size, avoiding a persistent configuration leak.

Fixes: 9da271f825e4 ("selftests: drv-net-hw: add test for memory allocation failures with page pool")
Reviewed-by: Yael Chemla <ychemla@nvidia.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Signed-off-by: Nimrod Oren <noren@nvidia.com>
---
Would it be preferable for cmd() to terminate and wait for
timed-out subprocesses?
---
 .../testing/selftests/drivers/net/hw/pp_alloc_fail.py  | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py b/tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py
index 2a51b60df8a1..9e7e5cb6a7e8 100755
--- a/tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py
+++ b/tools/testing/selftests/drivers/net/hw/pp_alloc_fail.py
@@ -13,7 +13,7 @@ from lib.py import ksft_run, ksft_exit, ksft_pr
 from lib.py import KsftSkipEx, KsftFailEx
 from lib.py import NetdevFamily, NlError
 from lib.py import NetDrvEpEnv
-from lib.py import cmd, tool, GenerateTraffic
+from lib.py import cmd, defer, ethtool, tool, GenerateTraffic
 
 
 def _write_fail_config(config):
@@ -77,7 +77,6 @@ def test_pp_alloc(cfg, netdevnl):
     if 'rx-alloc-fail' not in stats:
         raise KsftSkipEx("Driver does not report 'rx-alloc-fail' via qstats")
 
-    set_g = False
     traffic = None
     try:
         traffic = GenerateTraffic(cfg)
@@ -112,10 +111,11 @@ def test_pp_alloc(cfg, netdevnl):
             new_g = None
 
         if new_g:
-            set_g = cmd(f"ethtool -G {cfg.ifname} rx {new_g}", fail=False).ret == 0
-            if set_g:
+            restore_g = defer(ethtool, f"-G {cfg.ifname} rx {g['rx']}")
+            if cmd(f"ethtool -G {cfg.ifname} rx {new_g}", fail=False).ret == 0:
                 ksft_pr("ethtool -G change retval: success")
             else:
+                restore_g.cancel()
                 ksft_pr("ethtool -G change retval: did not succeed", new_g)
         else:
             ksft_pr("ethtool -G change retval: did not try")
@@ -127,8 +127,6 @@ def test_pp_alloc(cfg, netdevnl):
         if traffic:
             traffic.stop()
         time.sleep(0.1)
-        if set_g:
-            cmd(f"ethtool -G {cfg.ifname} rx {g['rx']}")
 
 
 def main() -> None:
-- 
2.45.0


Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1932C032E;
	Wed, 22 Jul 2026 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723949; cv=fail; b=oL/O+P0PXBVH0z4ce8BmQKrc8dcpJC49z8zsBsgbd9OO59bb7LXmFuV1X6Pv2jCgrwUp7KP5uZHh2FAEJ/bSDLK7P0t4jdc/FGItkZ2gBjjO6HrlxSgDywqdXhFzQImht6NGsw8rL5LY4Vcdl3Ep2vwwEcWe17//N2kBYEIoT4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723949; c=relaxed/simple;
	bh=4nfVtswBOy/cTCEcyjqqy5YemfgzU2RByP7joXlyEho=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OSj7OHLiw3LEs1iGV6pleSxofwDIB1txK+gjQS68Qj0U9LPdf/jeb4WyHjT8CVI9Z9jIwmZw8HLRvAaCzKrlmrh2tmJ8ofRtBzH+ODxtly+6bEuYDPA6q0LH7wGAxaW5UPFZCuSflB51tBAjvsEdWGb4YiJo19wx5xY9CBtCS/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Md+R/CMH; arc=fail smtp.client-ip=40.93.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Md+R/CMH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysDGsvGn+xfLi0X/EEm8n0GYmdy+sgjSuKXAcPbIoG/nXhlzuMCwz4vIFanCn7EVTHfeHYCqxgLoIP76ss12kwvtlvyg5sAfCd6PJNYBsPVF6WERgIGOtUWjMKmNSs6xt+yymH+i1+q5ytA5F6/Cr+p7I7QO+/3Ap9E8i2vAHLMoslkt8SyHSscf0cOEQH+YnFOS3A1YS2AY9wyEYQOTB/uftXmAJ314sn03okB39uaAatNqtoXv6Mu8vCwHmuk0/O0E08DHMuWWwLx1dfg+8B5fh5ssaGr0/3oeSR/4roJZnoretw5sEizFpjwb6HPRAdNcjmlM5lmWQ/XjmT1D9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbWkFhdQmPTBfc6xAdLzwrbvWs7TAJSbeJSkWoal0xk=;
 b=GfHhnO1zRtut4dDURKtIPVMf7jbRJBiuYyNzA4btj7zSbsNqVIKVCR24LMb7u6Hm2DBGAlSl8HmqBe1Fi0xlnO2aiTiIvdNOVVE4IPENLlnvWmBqCkLoeW5lq7tjK9Vgh1eshZQk15vgn1DmSUqRWAjPr/jMi34bEpSMEUelr5aTf3E6VidG1fAXqLQxV82FTVDjAbkzhA440Hxrp3wattMGLrHCLupxcpY8w9JNgPqsjzG5jVd+LwM8N+CanDt2WucF2t7zwT3YAgVnLFClef2VV2udCETCkMGD1FZRQytmWZnmqg5BFExAbm2S983MJxWtBgBEWoCmzM2fUZqzIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=davemloft.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbWkFhdQmPTBfc6xAdLzwrbvWs7TAJSbeJSkWoal0xk=;
 b=Md+R/CMHrC7eTqBiy6nGNL+AS35JsVovqteDLUjuUfFPPjQFdwvmz+HpG+ylnPYuV1IJVSI7tXb+Yy8X1vEAXMA5fg4ZtP0AgdbeG6RDP2bD23zYuNy9v0GvaELNGVnYTjdL8jc/AHyzpylPRLGkXvcZliJSRxyodETsNuWqG1xPxXiDadGRCLarak9HsROUidIgL7bca3jMKF+EIg1n9/bYmdww8/qvJvaaVxXW4sYrh+CkCSB+AMiTVo7WO7hSpPYdmJ95a2eMKEEupqljVsOn6Uq8G/7zU4LVSK6uQwElMUB3jbOS80nxQpEP2NA+EPYly5BLsX30H+GeaEH+5w==
Received: from DS7P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::7) by
 MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 12:39:02 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:8:25c:cafe::70) by DS7P221CA0017.outlook.office365.com
 (2603:10b6:8:25c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 12:39:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 12:39:01 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Jul
 2026 05:38:54 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 05:38:54 -0700
Received: from vdi.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Jul 2026 05:38:50 -0700
From: Gal Pressman <gal@nvidia.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	<netdev@vger.kernel.org>
CC: Shuah Khan <shuah@kernel.org>, Andy Gospodarek
	<andrew.gospodarek@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Michael Chan <michael.chan@broadcom.com>, <linux-kselftest@vger.kernel.org>,
	Gal Pressman <gal@nvidia.com>, Nimrod Oren <noren@nvidia.com>
Subject: [PATCH net] selftests: drv-net: rss_ctx: fix persist tests skip on IPv6 setups
Date: Wed, 22 Jul 2026 15:38:44 +0300
Message-ID: <20260722123844.1673299-1-gal@nvidia.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: adee7de1-c4e1-4c77-c4f3-08dee7ee352f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|7416014|376014|6133799003|56012099006|5023799004|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	W31WEDhaPfvCLG0Syh4zdBlIntn8q+gNqVpFTQv6Hol56/KvNDP4T2En0rrpJpcE4hAI/RTEzQfFqwaOmA2kMJUrpyZ5U742mauuMF+gI98lZJ1wtQ6hiptasV7EwAr+VIZs/qoKvE2WZm28lqz7vOLeLcE/WSOr5iuTtHOVxk/A4nau0qV3nEfzK7YspT81hQd7VAkK+lWX22ctHAd+xDU1u9SGRgZOFlrV/2uVFUf27GhH49/UQPeI7hqyewbgCRb2c4HK9ft6rhx+3wjboY8I0Aa72UQ1WSefVs9zgq2MTiVJ86pzGy6cFXMcbvhZBGB9igNoOFFDQn5F1XHyJZKGiXWW/kzUy8YCmferGHgwcUYdX+9t7W8CLFJoLxqPLmTYbpcEq87g30/ixXmzl8ekbmQNKkShELT7/ioRikCQlXBAEG+0Z+xuU+o5QIG8rVCu+KloAHu9bAfxE7CB0QeC2UF4PWn0FP1TDs1yojhGHw/OKXkbbGFaoaMA/ZXxFNq13LtgvVnSulqTHC+IDM02Pht6YnQuDyGfS3lx1SHg+DsfiOa0GHSesb5ISPOxbbjexsZWTj8moyqPaMRHYY9oXX/PZIOlIHnz0dzRAbQVAJ4GKOnIk0Eqhz6QNdnmvYFalRpCa8/hN5aQhWv00R4rLpAuChX0XC5Ddtheba690diKcEMg6HlqwyXYxGY9JIaEONvDfVV4qOYCx5Jc2A==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(7416014)(376014)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3DMxfia1/K2yprgfP6LewX/slfJxbpefU0EIN50A2s5DT9uN6iKYYOW5P4au/gPd4FrNtdM2KtiYTKwue3y4I0DTuLGXi1fgN+a9/Qc/g7DShLa0GaNA6ruqdR2rOxxFumZNwT4atXJ8nEU8UoDtk3ELG3OiU8r5gF8p96JenbW6ps80qtD+NfMgnipshc9YY6M5E3wApmlqE0dDzZNmqDy9aA67J9W56WYBXD3Z1xI/6c2e7lbBsC2vYz8yilERXz/AMDyDo2nHmXHN6wmtr8SBh5EFPi5MxRBDdHkl2FPLRMAps2Sxc07NcGh0JGamDrPvJ0BYZhnaT2/SEJ7cAw5sS+a51LxMBsz9uYUPsY2R+58BaNO2WL7XB+HumG2IfVz31y8DWMOODnIqELWiumfzrCVV0Fy03+mER7bWnRgMVM6pJHdCj1yBBQqQRPST
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 12:39:01.2442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adee7de1-c4e1-4c77-c4f3-08dee7ee352f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054

test_rss_context_persist_ifupdown() cycles the interface down/up and
pings the remote host before verifying the contexts survived.

When using IPv6, the down operation deletes the configured IPv6 address
(default keep_addr_on_down=0) and nothing restores it after the up, so
all ping attempts fail and both tests skip with "Cannot reach remote
host after interface up".

Set the interface's keep_addr_on_down sysctl around the flap to retain
the address.

Fixes: ce5a0f4612db ("selftests: drv-net: rss_ctx: test RSS contexts persist after ifdown/up")
Reviewed-by: Nimrod Oren <noren@nvidia.com>
Signed-off-by: Gal Pressman <gal@nvidia.com>
---
Disclaimer: I'm not sure if this should go to net or net-next.
---
 tools/testing/selftests/drivers/net/hw/rss_ctx.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/rss_ctx.py b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
index f36f76d6ca59..eeea2fb292ac 100755
--- a/tools/testing/selftests/drivers/net/hw/rss_ctx.py
+++ b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
@@ -938,6 +938,13 @@ def test_rss_context_persist_ifupdown(cfg, pre_down=False):
     ethtool(f"-X {cfg.ifname} equal 2")
     defer(ethtool, f"-X {cfg.ifname} default")
 
+    # IPv6 addresses are deleted on admin down and not restored on up
+    knob = f"net/ipv6/conf/{cfg.ifname}/keep_addr_on_down"
+    probe = cmd(f"sysctl -n {knob}", fail=False)
+    if probe.ret == 0:
+        cmd(f"sysctl -qw {knob}=1")
+        defer(cmd, f"sysctl -qw {knob}={probe.stdout.strip()}")
+
     ifup = defer(ip, f"link set dev {cfg.ifname} up")
     if pre_down:
         ip(f"link set dev {cfg.ifname} down")
-- 
2.54.0

